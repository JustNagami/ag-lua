return {
	Play101021001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 101021001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play101021002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0
			local var_4_1 = 1

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				local var_4_2 = "play"
				local var_4_3 = "music"

				arg_1_1:AudioAction(var_4_2, var_4_3, "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2")
			end

			local var_4_4 = "B10a"

			if arg_1_1.bgs_[var_4_4] == nil then
				local var_4_5 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_5:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_4)
				var_4_5.name = var_4_4
				var_4_5.transform.parent = arg_1_1.stage_.transform
				var_4_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_4] = var_4_5
			end

			local var_4_6 = arg_1_1.bgs_.B10a
			local var_4_7 = 0

			if var_4_7 < arg_1_1.time_ and arg_1_1.time_ <= var_4_7 + arg_4_0 then
				local var_4_8 = var_4_6:GetComponent("SpriteRenderer")

				if var_4_8 then
					var_4_8.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_9 = var_4_8.material
					local var_4_10 = var_4_9:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB10a = var_4_10.a
					arg_1_1.var_.alphaMatValueB10a = var_4_9
				end

				arg_1_1.var_.alphaOldValueB10a = 0
			end

			local var_4_11 = 1.5

			if var_4_7 <= arg_1_1.time_ and arg_1_1.time_ < var_4_7 + var_4_11 then
				local var_4_12 = (arg_1_1.time_ - var_4_7) / var_4_11
				local var_4_13 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB10a, 1, var_4_12)

				if arg_1_1.var_.alphaMatValueB10a then
					local var_4_14 = arg_1_1.var_.alphaMatValueB10a
					local var_4_15 = var_4_14:GetColor("_Color")

					var_4_15.a = var_4_13

					var_4_14:SetColor("_Color", var_4_15)
				end
			end

			if arg_1_1.time_ >= var_4_7 + var_4_11 and arg_1_1.time_ < var_4_7 + var_4_11 + arg_4_0 and arg_1_1.var_.alphaMatValueB10a then
				local var_4_16 = arg_1_1.var_.alphaMatValueB10a
				local var_4_17 = var_4_16:GetColor("_Color")

				var_4_17.a = 1

				var_4_16:SetColor("_Color", var_4_17)
			end

			local var_4_18 = 0

			if var_4_18 < arg_1_1.time_ and arg_1_1.time_ <= var_4_18 + arg_4_0 then
				local var_4_19 = manager.ui.mainCamera.transform.localPosition
				local var_4_20 = Vector3.New(0, 0, 10) + Vector3.New(var_4_19.x, var_4_19.y, 0)
				local var_4_21 = arg_1_1.bgs_.B10a

				var_4_21.transform.localPosition = var_4_20
				var_4_21.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_22 = var_4_21:GetComponent("SpriteRenderer")

				if var_4_22 and var_4_22.sprite then
					local var_4_23 = (var_4_21.transform.localPosition - var_4_19).z
					local var_4_24 = manager.ui.mainCameraCom_
					local var_4_25 = 2 * var_4_23 * Mathf.Tan(var_4_24.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_26 = var_4_25 * var_4_24.aspect
					local var_4_27 = var_4_22.sprite.bounds.size.x
					local var_4_28 = var_4_22.sprite.bounds.size.y
					local var_4_29 = var_4_26 / var_4_27
					local var_4_30 = var_4_25 / var_4_28
					local var_4_31 = var_4_30 < var_4_29 and var_4_29 or var_4_30

					var_4_21.transform.localScale = Vector3.New(var_4_31, var_4_31, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "B10a" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_32 = 0

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_33 = 2

			if arg_1_1.time_ >= var_4_32 + var_4_33 and arg_1_1.time_ < var_4_32 + var_4_33 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.525

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

				local var_4_37 = arg_1_1:GetWordFromCfg(101021001)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_39 = 20
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
	Play101021002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 101021002
		arg_7_1.duration_ = 10.4

		local var_7_0 = {
			ja = 9.866,
			ko = 10.2,
			zh = 7.733,
			en = 10.4
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
				arg_7_0:Play101021003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				local var_10_2 = "play"
				local var_10_3 = "effect"

				arg_7_1:AudioAction(var_10_2, var_10_3, "se_story_v1_environment_crowd", "se_story_v1_environment_crowd", "se_story_v1_environment_crowd")
			end

			local var_10_4 = 0
			local var_10_5 = 1

			if var_10_4 < arg_7_1.time_ and arg_7_1.time_ <= var_10_4 + arg_10_0 then
				local var_10_6 = "play"
				local var_10_7 = "effect"

				arg_7_1:AudioAction(var_10_6, var_10_7, "se_story_1", "se_story_1_protest", "")
			end

			local var_10_8 = manager.ui.mainCamera.transform
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 then
				arg_7_1.var_.shakeOldPosMainCamera = var_10_8.localPosition
			end

			local var_10_10 = 0.600000023841858

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_10 then
				local var_10_11 = (arg_7_1.time_ - var_10_9) / 0.066
				local var_10_12, var_10_13 = math.modf(var_10_11)

				var_10_8.localPosition = Vector3.New(var_10_13 * 0.13, var_10_13 * 0.13, var_10_13 * 0.13) + arg_7_1.var_.shakeOldPosMainCamera
			end

			if arg_7_1.time_ >= var_10_9 + var_10_10 and arg_7_1.time_ < var_10_9 + var_10_10 + arg_10_0 then
				var_10_8.localPosition = arg_7_1.var_.shakeOldPosMainCamera
			end

			local var_10_14 = 0
			local var_10_15 = 0.75

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_16 = arg_7_1:FormatText(StoryNameCfg[16].name)

				arg_7_1.leftNameTxt_.text = var_10_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_17 = arg_7_1:GetWordFromCfg(101021002)
				local var_10_18 = arg_7_1:FormatText(var_10_17.content)

				arg_7_1.text_.text = var_10_18

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_19 = 30
				local var_10_20 = utf8.len(var_10_18)
				local var_10_21 = var_10_19 <= 0 and var_10_15 or var_10_15 * (var_10_20 / var_10_19)

				if var_10_21 > 0 and var_10_15 < var_10_21 then
					arg_7_1.talkMaxDuration = var_10_21

					if var_10_21 + var_10_14 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_21 + var_10_14
					end
				end

				arg_7_1.text_.text = var_10_18
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021002", "story_v_out_101021.awb") ~= 0 then
					local var_10_22 = manager.audio:GetVoiceLength("story_v_out_101021", "101021002", "story_v_out_101021.awb") / 1000

					if var_10_22 + var_10_14 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_22 + var_10_14
					end

					if var_10_17.prefab_name ~= "" and arg_7_1.actors_[var_10_17.prefab_name] ~= nil then
						local var_10_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_17.prefab_name].transform, "story_v_out_101021", "101021002", "story_v_out_101021.awb")

						arg_7_1:RecordAudio("101021002", var_10_23)
						arg_7_1:RecordAudio("101021002", var_10_23)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_101021", "101021002", "story_v_out_101021.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_101021", "101021002", "story_v_out_101021.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_24 = math.max(var_10_15, arg_7_1.talkMaxDuration)

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_24 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_14) / var_10_24

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_14 + var_10_24 and arg_7_1.time_ < var_10_14 + var_10_24 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play101021003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 101021003
		arg_11_1.duration_ = 3.6

		local var_11_0 = {
			ja = 2.566,
			ko = 3.6,
			zh = 2.733,
			en = 2.2
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
				arg_11_0:Play101021004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.25

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[17].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(101021003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021003", "story_v_out_101021.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_101021", "101021003", "story_v_out_101021.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_101021", "101021003", "story_v_out_101021.awb")

						arg_11_1:RecordAudio("101021003", var_14_9)
						arg_11_1:RecordAudio("101021003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_101021", "101021003", "story_v_out_101021.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_101021", "101021003", "story_v_out_101021.awb")
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
	Play101021004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 101021004
		arg_15_1.duration_ = 7.233

		local var_15_0 = {
			ja = 7.1,
			ko = 4.966,
			zh = 4.333,
			en = 7.233
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
				arg_15_0:Play101021005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.55

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[18].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(101021004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021004", "story_v_out_101021.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_101021", "101021004", "story_v_out_101021.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_101021", "101021004", "story_v_out_101021.awb")

						arg_15_1:RecordAudio("101021004", var_18_9)
						arg_15_1:RecordAudio("101021004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_101021", "101021004", "story_v_out_101021.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_101021", "101021004", "story_v_out_101021.awb")
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
	Play101021005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 101021005
		arg_19_1.duration_ = 4.5

		local var_19_0 = {
			ja = 3.233,
			ko = 2.166,
			zh = 4.5,
			en = 4.466
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
				arg_19_0:Play101021006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "2020_tpose"

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

			local var_22_4 = arg_19_1.actors_["2020_tpose"]
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 and arg_19_1.var_.characterEffect2020_tpose == nil then
				arg_19_1.var_.characterEffect2020_tpose = var_22_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_6 = 0.1

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6

				if arg_19_1.var_.characterEffect2020_tpose then
					arg_19_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 and arg_19_1.var_.characterEffect2020_tpose then
				arg_19_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_22_8 = arg_19_1.actors_["2020_tpose"].transform
			local var_22_9 = 0

			if var_22_9 < arg_19_1.time_ and arg_19_1.time_ <= var_22_9 + arg_22_0 then
				arg_19_1.var_.moveOldPos2020_tpose = var_22_8.localPosition
			end

			local var_22_10 = 0.001

			if var_22_9 <= arg_19_1.time_ and arg_19_1.time_ < var_22_9 + var_22_10 then
				local var_22_11 = (arg_19_1.time_ - var_22_9) / var_22_10
				local var_22_12 = Vector3.New(-0.7, -1.2, -4.1)

				var_22_8.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos2020_tpose, var_22_12, var_22_11)

				local var_22_13 = manager.ui.mainCamera.transform.position - var_22_8.position

				var_22_8.forward = Vector3.New(var_22_13.x, var_22_13.y, var_22_13.z)

				local var_22_14 = var_22_8.localEulerAngles

				var_22_14.z = 0
				var_22_14.x = 0
				var_22_8.localEulerAngles = var_22_14
			end

			if arg_19_1.time_ >= var_22_9 + var_22_10 and arg_19_1.time_ < var_22_9 + var_22_10 + arg_22_0 then
				var_22_8.localPosition = Vector3.New(-0.7, -1.2, -4.1)

				local var_22_15 = manager.ui.mainCamera.transform.position - var_22_8.position

				var_22_8.forward = Vector3.New(var_22_15.x, var_22_15.y, var_22_15.z)

				local var_22_16 = var_22_8.localEulerAngles

				var_22_16.z = 0
				var_22_16.x = 0
				var_22_8.localEulerAngles = var_22_16
			end

			local var_22_17 = 0

			if var_22_17 < arg_19_1.time_ and arg_19_1.time_ <= var_22_17 + arg_22_0 then
				arg_19_1:PlayTimeline("2020_tpose", "StoryTimeline/CharAction/story2020/story2020action/2020action1_1")
			end

			local var_22_18 = 0
			local var_22_19 = 0.375

			if var_22_18 < arg_19_1.time_ and arg_19_1.time_ <= var_22_18 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_20 = arg_19_1:FormatText(StoryNameCfg[19].name)

				arg_19_1.leftNameTxt_.text = var_22_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_21 = arg_19_1:GetWordFromCfg(101021005)
				local var_22_22 = arg_19_1:FormatText(var_22_21.content)

				arg_19_1.text_.text = var_22_22

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_23 = 15
				local var_22_24 = utf8.len(var_22_22)
				local var_22_25 = var_22_23 <= 0 and var_22_19 or var_22_19 * (var_22_24 / var_22_23)

				if var_22_25 > 0 and var_22_19 < var_22_25 then
					arg_19_1.talkMaxDuration = var_22_25

					if var_22_25 + var_22_18 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_25 + var_22_18
					end
				end

				arg_19_1.text_.text = var_22_22
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021005", "story_v_out_101021.awb") ~= 0 then
					local var_22_26 = manager.audio:GetVoiceLength("story_v_out_101021", "101021005", "story_v_out_101021.awb") / 1000

					if var_22_26 + var_22_18 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_26 + var_22_18
					end

					if var_22_21.prefab_name ~= "" and arg_19_1.actors_[var_22_21.prefab_name] ~= nil then
						local var_22_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_21.prefab_name].transform, "story_v_out_101021", "101021005", "story_v_out_101021.awb")

						arg_19_1:RecordAudio("101021005", var_22_27)
						arg_19_1:RecordAudio("101021005", var_22_27)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_101021", "101021005", "story_v_out_101021.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_101021", "101021005", "story_v_out_101021.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_28 = math.max(var_22_19, arg_19_1.talkMaxDuration)

			if var_22_18 <= arg_19_1.time_ and arg_19_1.time_ < var_22_18 + var_22_28 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_18) / var_22_28

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_18 + var_22_28 and arg_19_1.time_ < var_22_18 + var_22_28 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play101021006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 101021006
		arg_23_1.duration_ = 8

		local var_23_0 = {
			ja = 8,
			ko = 6.9,
			zh = 7.2,
			en = 6.7
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
				arg_23_0:Play101021007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "3008ui_story"

			if arg_23_1.actors_[var_26_0] == nil then
				local var_26_1 = Object.Instantiate(Asset.Load("Char/" .. var_26_0), arg_23_1.stage_.transform)

				var_26_1.name = var_26_0
				var_26_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_23_1.actors_[var_26_0] = var_26_1

				local var_26_2 = var_26_1:GetComponentInChildren(typeof(CharacterEffect))

				var_26_2.enabled = true

				local var_26_3 = GameObjectTools.GetOrAddComponent(var_26_1, typeof(DynamicBoneHelper))

				if var_26_3 then
					var_26_3:EnableDynamicBone(false)
				end

				arg_23_1:ShowWeapon(var_26_2.transform, false)

				arg_23_1.var_[var_26_0 .. "Animator"] = var_26_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_23_1.var_[var_26_0 .. "Animator"].applyRootMotion = true
				arg_23_1.var_[var_26_0 .. "LipSync"] = var_26_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_26_4 = arg_23_1.actors_["3008ui_story"]
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 and arg_23_1.var_.characterEffect3008ui_story == nil then
				arg_23_1.var_.characterEffect3008ui_story = var_26_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_6 = 0.1

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6

				if arg_23_1.var_.characterEffect3008ui_story then
					arg_23_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 and arg_23_1.var_.characterEffect3008ui_story then
				arg_23_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_26_8 = arg_23_1.actors_["2020_tpose"]
			local var_26_9 = 0

			if var_26_9 < arg_23_1.time_ and arg_23_1.time_ <= var_26_9 + arg_26_0 and arg_23_1.var_.characterEffect2020_tpose == nil then
				arg_23_1.var_.characterEffect2020_tpose = var_26_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_10 = 0.1

			if var_26_9 <= arg_23_1.time_ and arg_23_1.time_ < var_26_9 + var_26_10 then
				local var_26_11 = (arg_23_1.time_ - var_26_9) / var_26_10

				if arg_23_1.var_.characterEffect2020_tpose then
					local var_26_12 = Mathf.Lerp(0, 0.5, var_26_11)

					arg_23_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_23_1.var_.characterEffect2020_tpose.fillRatio = var_26_12
				end
			end

			if arg_23_1.time_ >= var_26_9 + var_26_10 and arg_23_1.time_ < var_26_9 + var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect2020_tpose then
				local var_26_13 = 0.5

				arg_23_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_23_1.var_.characterEffect2020_tpose.fillRatio = var_26_13
			end

			local var_26_14 = arg_23_1.actors_["3008ui_story"].transform
			local var_26_15 = 0

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 then
				arg_23_1.var_.moveOldPos3008ui_story = var_26_14.localPosition
			end

			local var_26_16 = 0.001

			if var_26_15 <= arg_23_1.time_ and arg_23_1.time_ < var_26_15 + var_26_16 then
				local var_26_17 = (arg_23_1.time_ - var_26_15) / var_26_16
				local var_26_18 = Vector3.New(0.7, -1.51, -4.3)

				var_26_14.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos3008ui_story, var_26_18, var_26_17)

				local var_26_19 = manager.ui.mainCamera.transform.position - var_26_14.position

				var_26_14.forward = Vector3.New(var_26_19.x, var_26_19.y, var_26_19.z)

				local var_26_20 = var_26_14.localEulerAngles

				var_26_20.z = 0
				var_26_20.x = 0
				var_26_14.localEulerAngles = var_26_20
			end

			if arg_23_1.time_ >= var_26_15 + var_26_16 and arg_23_1.time_ < var_26_15 + var_26_16 + arg_26_0 then
				var_26_14.localPosition = Vector3.New(0.7, -1.51, -4.3)

				local var_26_21 = manager.ui.mainCamera.transform.position - var_26_14.position

				var_26_14.forward = Vector3.New(var_26_21.x, var_26_21.y, var_26_21.z)

				local var_26_22 = var_26_14.localEulerAngles

				var_26_22.z = 0
				var_26_22.x = 0
				var_26_14.localEulerAngles = var_26_22
			end

			local var_26_23 = 0

			if var_26_23 < arg_23_1.time_ and arg_23_1.time_ <= var_26_23 + arg_26_0 then
				arg_23_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action1_1")
			end

			local var_26_24 = 0

			if var_26_24 < arg_23_1.time_ and arg_23_1.time_ <= var_26_24 + arg_26_0 then
				arg_23_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_26_25 = 0
			local var_26_26 = 0.8

			if var_26_25 < arg_23_1.time_ and arg_23_1.time_ <= var_26_25 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_27 = arg_23_1:FormatText(StoryNameCfg[20].name)

				arg_23_1.leftNameTxt_.text = var_26_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_28 = arg_23_1:GetWordFromCfg(101021006)
				local var_26_29 = arg_23_1:FormatText(var_26_28.content)

				arg_23_1.text_.text = var_26_29

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_30 = 32
				local var_26_31 = utf8.len(var_26_29)
				local var_26_32 = var_26_30 <= 0 and var_26_26 or var_26_26 * (var_26_31 / var_26_30)

				if var_26_32 > 0 and var_26_26 < var_26_32 then
					arg_23_1.talkMaxDuration = var_26_32

					if var_26_32 + var_26_25 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_32 + var_26_25
					end
				end

				arg_23_1.text_.text = var_26_29
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021006", "story_v_out_101021.awb") ~= 0 then
					local var_26_33 = manager.audio:GetVoiceLength("story_v_out_101021", "101021006", "story_v_out_101021.awb") / 1000

					if var_26_33 + var_26_25 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_33 + var_26_25
					end

					if var_26_28.prefab_name ~= "" and arg_23_1.actors_[var_26_28.prefab_name] ~= nil then
						local var_26_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_28.prefab_name].transform, "story_v_out_101021", "101021006", "story_v_out_101021.awb")

						arg_23_1:RecordAudio("101021006", var_26_34)
						arg_23_1:RecordAudio("101021006", var_26_34)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_101021", "101021006", "story_v_out_101021.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_101021", "101021006", "story_v_out_101021.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_35 = math.max(var_26_26, arg_23_1.talkMaxDuration)

			if var_26_25 <= arg_23_1.time_ and arg_23_1.time_ < var_26_25 + var_26_35 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_25) / var_26_35

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_25 + var_26_35 and arg_23_1.time_ < var_26_25 + var_26_35 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play101021007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 101021007
		arg_27_1.duration_ = 5.966

		local var_27_0 = {
			ja = 5.966,
			ko = 4.033,
			zh = 4.533,
			en = 3.033
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
				arg_27_0:Play101021008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["2020_tpose"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect2020_tpose == nil then
				arg_27_1.var_.characterEffect2020_tpose = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.1

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect2020_tpose then
					arg_27_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect2020_tpose then
				arg_27_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_30_4 = arg_27_1.actors_["3008ui_story"]
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 and arg_27_1.var_.characterEffect3008ui_story == nil then
				arg_27_1.var_.characterEffect3008ui_story = var_30_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_6 = 0.1

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6

				if arg_27_1.var_.characterEffect3008ui_story then
					local var_30_8 = Mathf.Lerp(0, 0.5, var_30_7)

					arg_27_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_27_1.var_.characterEffect3008ui_story.fillRatio = var_30_8
				end
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 and arg_27_1.var_.characterEffect3008ui_story then
				local var_30_9 = 0.5

				arg_27_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_27_1.var_.characterEffect3008ui_story.fillRatio = var_30_9
			end

			local var_30_10 = 0
			local var_30_11 = 0.425

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_12 = arg_27_1:FormatText(StoryNameCfg[19].name)

				arg_27_1.leftNameTxt_.text = var_30_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_13 = arg_27_1:GetWordFromCfg(101021007)
				local var_30_14 = arg_27_1:FormatText(var_30_13.content)

				arg_27_1.text_.text = var_30_14

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_15 = 15
				local var_30_16 = utf8.len(var_30_14)
				local var_30_17 = var_30_15 <= 0 and var_30_11 or var_30_11 * (var_30_16 / var_30_15)

				if var_30_17 > 0 and var_30_11 < var_30_17 then
					arg_27_1.talkMaxDuration = var_30_17

					if var_30_17 + var_30_10 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_17 + var_30_10
					end
				end

				arg_27_1.text_.text = var_30_14
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021007", "story_v_out_101021.awb") ~= 0 then
					local var_30_18 = manager.audio:GetVoiceLength("story_v_out_101021", "101021007", "story_v_out_101021.awb") / 1000

					if var_30_18 + var_30_10 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_18 + var_30_10
					end

					if var_30_13.prefab_name ~= "" and arg_27_1.actors_[var_30_13.prefab_name] ~= nil then
						local var_30_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_13.prefab_name].transform, "story_v_out_101021", "101021007", "story_v_out_101021.awb")

						arg_27_1:RecordAudio("101021007", var_30_19)
						arg_27_1:RecordAudio("101021007", var_30_19)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_101021", "101021007", "story_v_out_101021.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_101021", "101021007", "story_v_out_101021.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_20 = math.max(var_30_11, arg_27_1.talkMaxDuration)

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_20 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_10) / var_30_20

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_10 + var_30_20 and arg_27_1.time_ < var_30_10 + var_30_20 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play101021008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 101021008
		arg_31_1.duration_ = 6.5

		local var_31_0 = {
			ja = 4.7,
			ko = 6.5,
			zh = 5.5,
			en = 5.1
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
				arg_31_0:Play101021009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["3008ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect3008ui_story == nil then
				arg_31_1.var_.characterEffect3008ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect3008ui_story then
					arg_31_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect3008ui_story then
				arg_31_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_34_4 = arg_31_1.actors_["2020_tpose"]
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 and arg_31_1.var_.characterEffect2020_tpose == nil then
				arg_31_1.var_.characterEffect2020_tpose = var_34_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_6 = 0.1

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6

				if arg_31_1.var_.characterEffect2020_tpose then
					local var_34_8 = Mathf.Lerp(0, 0.5, var_34_7)

					arg_31_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_31_1.var_.characterEffect2020_tpose.fillRatio = var_34_8
				end
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 and arg_31_1.var_.characterEffect2020_tpose then
				local var_34_9 = 0.5

				arg_31_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_31_1.var_.characterEffect2020_tpose.fillRatio = var_34_9
			end

			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_34_11 = 0
			local var_34_12 = 0.6

			if var_34_11 < arg_31_1.time_ and arg_31_1.time_ <= var_34_11 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_13 = arg_31_1:FormatText(StoryNameCfg[20].name)

				arg_31_1.leftNameTxt_.text = var_34_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_14 = arg_31_1:GetWordFromCfg(101021008)
				local var_34_15 = arg_31_1:FormatText(var_34_14.content)

				arg_31_1.text_.text = var_34_15

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_16 = 24
				local var_34_17 = utf8.len(var_34_15)
				local var_34_18 = var_34_16 <= 0 and var_34_12 or var_34_12 * (var_34_17 / var_34_16)

				if var_34_18 > 0 and var_34_12 < var_34_18 then
					arg_31_1.talkMaxDuration = var_34_18

					if var_34_18 + var_34_11 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_18 + var_34_11
					end
				end

				arg_31_1.text_.text = var_34_15
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021008", "story_v_out_101021.awb") ~= 0 then
					local var_34_19 = manager.audio:GetVoiceLength("story_v_out_101021", "101021008", "story_v_out_101021.awb") / 1000

					if var_34_19 + var_34_11 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_19 + var_34_11
					end

					if var_34_14.prefab_name ~= "" and arg_31_1.actors_[var_34_14.prefab_name] ~= nil then
						local var_34_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_14.prefab_name].transform, "story_v_out_101021", "101021008", "story_v_out_101021.awb")

						arg_31_1:RecordAudio("101021008", var_34_20)
						arg_31_1:RecordAudio("101021008", var_34_20)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_101021", "101021008", "story_v_out_101021.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_101021", "101021008", "story_v_out_101021.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_21 = math.max(var_34_12, arg_31_1.talkMaxDuration)

			if var_34_11 <= arg_31_1.time_ and arg_31_1.time_ < var_34_11 + var_34_21 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_11) / var_34_21

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_11 + var_34_21 and arg_31_1.time_ < var_34_11 + var_34_21 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play101021009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 101021009
		arg_35_1.duration_ = 8.5

		local var_35_0 = {
			ja = 8.5,
			ko = 6.6,
			zh = 6.266,
			en = 7.566
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
				arg_35_0:Play101021010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["2020_tpose"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect2020_tpose == nil then
				arg_35_1.var_.characterEffect2020_tpose = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.1

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect2020_tpose then
					arg_35_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect2020_tpose then
				arg_35_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_38_4 = arg_35_1.actors_["3008ui_story"]
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 and arg_35_1.var_.characterEffect3008ui_story == nil then
				arg_35_1.var_.characterEffect3008ui_story = var_38_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_6 = 0.1

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6

				if arg_35_1.var_.characterEffect3008ui_story then
					local var_38_8 = Mathf.Lerp(0, 0.5, var_38_7)

					arg_35_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_35_1.var_.characterEffect3008ui_story.fillRatio = var_38_8
				end
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect3008ui_story then
				local var_38_9 = 0.5

				arg_35_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_35_1.var_.characterEffect3008ui_story.fillRatio = var_38_9
			end

			local var_38_10 = 0
			local var_38_11 = 0.675

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_12 = arg_35_1:FormatText(StoryNameCfg[19].name)

				arg_35_1.leftNameTxt_.text = var_38_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_13 = arg_35_1:GetWordFromCfg(101021009)
				local var_38_14 = arg_35_1:FormatText(var_38_13.content)

				arg_35_1.text_.text = var_38_14

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_15 = 27
				local var_38_16 = utf8.len(var_38_14)
				local var_38_17 = var_38_15 <= 0 and var_38_11 or var_38_11 * (var_38_16 / var_38_15)

				if var_38_17 > 0 and var_38_11 < var_38_17 then
					arg_35_1.talkMaxDuration = var_38_17

					if var_38_17 + var_38_10 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_17 + var_38_10
					end
				end

				arg_35_1.text_.text = var_38_14
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021009", "story_v_out_101021.awb") ~= 0 then
					local var_38_18 = manager.audio:GetVoiceLength("story_v_out_101021", "101021009", "story_v_out_101021.awb") / 1000

					if var_38_18 + var_38_10 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_18 + var_38_10
					end

					if var_38_13.prefab_name ~= "" and arg_35_1.actors_[var_38_13.prefab_name] ~= nil then
						local var_38_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_13.prefab_name].transform, "story_v_out_101021", "101021009", "story_v_out_101021.awb")

						arg_35_1:RecordAudio("101021009", var_38_19)
						arg_35_1:RecordAudio("101021009", var_38_19)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_101021", "101021009", "story_v_out_101021.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_101021", "101021009", "story_v_out_101021.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_20 = math.max(var_38_11, arg_35_1.talkMaxDuration)

			if var_38_10 <= arg_35_1.time_ and arg_35_1.time_ < var_38_10 + var_38_20 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_10) / var_38_20

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_10 + var_38_20 and arg_35_1.time_ < var_38_10 + var_38_20 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play101021010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 101021010
		arg_39_1.duration_ = 3.533

		local var_39_0 = {
			ja = 3.433,
			ko = 2.333,
			zh = 3.533,
			en = 2.4
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
				arg_39_0:Play101021011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["3008ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect3008ui_story == nil then
				arg_39_1.var_.characterEffect3008ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.1

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect3008ui_story then
					arg_39_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect3008ui_story then
				arg_39_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_42_4 = arg_39_1.actors_["2020_tpose"]
			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 and arg_39_1.var_.characterEffect2020_tpose == nil then
				arg_39_1.var_.characterEffect2020_tpose = var_42_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_6 = 0.1

			if var_42_5 <= arg_39_1.time_ and arg_39_1.time_ < var_42_5 + var_42_6 then
				local var_42_7 = (arg_39_1.time_ - var_42_5) / var_42_6

				if arg_39_1.var_.characterEffect2020_tpose then
					local var_42_8 = Mathf.Lerp(0, 0.5, var_42_7)

					arg_39_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_39_1.var_.characterEffect2020_tpose.fillRatio = var_42_8
				end
			end

			if arg_39_1.time_ >= var_42_5 + var_42_6 and arg_39_1.time_ < var_42_5 + var_42_6 + arg_42_0 and arg_39_1.var_.characterEffect2020_tpose then
				local var_42_9 = 0.5

				arg_39_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_39_1.var_.characterEffect2020_tpose.fillRatio = var_42_9
			end

			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_42_11 = 0

			if var_42_11 < arg_39_1.time_ and arg_39_1.time_ <= var_42_11 + arg_42_0 then
				arg_39_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action5_1")
			end

			local var_42_12 = 0
			local var_42_13 = 0.3

			if var_42_12 < arg_39_1.time_ and arg_39_1.time_ <= var_42_12 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_14 = arg_39_1:FormatText(StoryNameCfg[20].name)

				arg_39_1.leftNameTxt_.text = var_42_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_15 = arg_39_1:GetWordFromCfg(101021010)
				local var_42_16 = arg_39_1:FormatText(var_42_15.content)

				arg_39_1.text_.text = var_42_16

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_17 = 12
				local var_42_18 = utf8.len(var_42_16)
				local var_42_19 = var_42_17 <= 0 and var_42_13 or var_42_13 * (var_42_18 / var_42_17)

				if var_42_19 > 0 and var_42_13 < var_42_19 then
					arg_39_1.talkMaxDuration = var_42_19

					if var_42_19 + var_42_12 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_19 + var_42_12
					end
				end

				arg_39_1.text_.text = var_42_16
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021010", "story_v_out_101021.awb") ~= 0 then
					local var_42_20 = manager.audio:GetVoiceLength("story_v_out_101021", "101021010", "story_v_out_101021.awb") / 1000

					if var_42_20 + var_42_12 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_20 + var_42_12
					end

					if var_42_15.prefab_name ~= "" and arg_39_1.actors_[var_42_15.prefab_name] ~= nil then
						local var_42_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_15.prefab_name].transform, "story_v_out_101021", "101021010", "story_v_out_101021.awb")

						arg_39_1:RecordAudio("101021010", var_42_21)
						arg_39_1:RecordAudio("101021010", var_42_21)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_101021", "101021010", "story_v_out_101021.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_101021", "101021010", "story_v_out_101021.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_22 = math.max(var_42_13, arg_39_1.talkMaxDuration)

			if var_42_12 <= arg_39_1.time_ and arg_39_1.time_ < var_42_12 + var_42_22 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_12) / var_42_22

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_12 + var_42_22 and arg_39_1.time_ < var_42_12 + var_42_22 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play101021011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 101021011
		arg_43_1.duration_ = 8.066

		local var_43_0 = {
			ja = 8.066,
			ko = 4.7,
			zh = 4.766,
			en = 5.366
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
				arg_43_0:Play101021012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 1

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				local var_46_2 = "stop"
				local var_46_3 = "effect"

				arg_43_1:AudioAction(var_46_2, var_46_3, "se_story_1", "se_story_1_protest", "")
			end

			local var_46_4 = arg_43_1.actors_["3008ui_story"]
			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 and arg_43_1.var_.characterEffect3008ui_story == nil then
				arg_43_1.var_.characterEffect3008ui_story = var_46_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_6 = 0.1

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_6 then
				local var_46_7 = (arg_43_1.time_ - var_46_5) / var_46_6

				if arg_43_1.var_.characterEffect3008ui_story then
					local var_46_8 = Mathf.Lerp(0, 0.5, var_46_7)

					arg_43_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_43_1.var_.characterEffect3008ui_story.fillRatio = var_46_8
				end
			end

			if arg_43_1.time_ >= var_46_5 + var_46_6 and arg_43_1.time_ < var_46_5 + var_46_6 + arg_46_0 and arg_43_1.var_.characterEffect3008ui_story then
				local var_46_9 = 0.5

				arg_43_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_43_1.var_.characterEffect3008ui_story.fillRatio = var_46_9
			end

			local var_46_10 = manager.ui.mainCamera.transform
			local var_46_11 = 0

			if var_46_11 < arg_43_1.time_ and arg_43_1.time_ <= var_46_11 + arg_46_0 then
				arg_43_1.var_.shakeOldPosMainCamera = var_46_10.localPosition
			end

			local var_46_12 = 0.600000023841858

			if var_46_11 <= arg_43_1.time_ and arg_43_1.time_ < var_46_11 + var_46_12 then
				local var_46_13 = (arg_43_1.time_ - var_46_11) / 0.066
				local var_46_14, var_46_15 = math.modf(var_46_13)

				var_46_10.localPosition = Vector3.New(var_46_15 * 0.13, var_46_15 * 0.13, var_46_15 * 0.13) + arg_43_1.var_.shakeOldPosMainCamera
			end

			if arg_43_1.time_ >= var_46_11 + var_46_12 and arg_43_1.time_ < var_46_11 + var_46_12 + arg_46_0 then
				var_46_10.localPosition = arg_43_1.var_.shakeOldPosMainCamera
			end

			local var_46_16 = arg_43_1.actors_["2020_tpose"].transform
			local var_46_17 = 0

			if var_46_17 < arg_43_1.time_ and arg_43_1.time_ <= var_46_17 + arg_46_0 then
				arg_43_1.var_.moveOldPos2020_tpose = var_46_16.localPosition
			end

			local var_46_18 = 0.001

			if var_46_17 <= arg_43_1.time_ and arg_43_1.time_ < var_46_17 + var_46_18 then
				local var_46_19 = (arg_43_1.time_ - var_46_17) / var_46_18
				local var_46_20 = Vector3.New(0, 100, 0)

				var_46_16.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos2020_tpose, var_46_20, var_46_19)

				local var_46_21 = manager.ui.mainCamera.transform.position - var_46_16.position

				var_46_16.forward = Vector3.New(var_46_21.x, var_46_21.y, var_46_21.z)

				local var_46_22 = var_46_16.localEulerAngles

				var_46_22.z = 0
				var_46_22.x = 0
				var_46_16.localEulerAngles = var_46_22
			end

			if arg_43_1.time_ >= var_46_17 + var_46_18 and arg_43_1.time_ < var_46_17 + var_46_18 + arg_46_0 then
				var_46_16.localPosition = Vector3.New(0, 100, 0)

				local var_46_23 = manager.ui.mainCamera.transform.position - var_46_16.position

				var_46_16.forward = Vector3.New(var_46_23.x, var_46_23.y, var_46_23.z)

				local var_46_24 = var_46_16.localEulerAngles

				var_46_24.z = 0
				var_46_24.x = 0
				var_46_16.localEulerAngles = var_46_24
			end

			local var_46_25 = arg_43_1.actors_["3008ui_story"].transform
			local var_46_26 = 0

			if var_46_26 < arg_43_1.time_ and arg_43_1.time_ <= var_46_26 + arg_46_0 then
				arg_43_1.var_.moveOldPos3008ui_story = var_46_25.localPosition
			end

			local var_46_27 = 0.001

			if var_46_26 <= arg_43_1.time_ and arg_43_1.time_ < var_46_26 + var_46_27 then
				local var_46_28 = (arg_43_1.time_ - var_46_26) / var_46_27
				local var_46_29 = Vector3.New(0, 100, 0)

				var_46_25.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos3008ui_story, var_46_29, var_46_28)

				local var_46_30 = manager.ui.mainCamera.transform.position - var_46_25.position

				var_46_25.forward = Vector3.New(var_46_30.x, var_46_30.y, var_46_30.z)

				local var_46_31 = var_46_25.localEulerAngles

				var_46_31.z = 0
				var_46_31.x = 0
				var_46_25.localEulerAngles = var_46_31
			end

			if arg_43_1.time_ >= var_46_26 + var_46_27 and arg_43_1.time_ < var_46_26 + var_46_27 + arg_46_0 then
				var_46_25.localPosition = Vector3.New(0, 100, 0)

				local var_46_32 = manager.ui.mainCamera.transform.position - var_46_25.position

				var_46_25.forward = Vector3.New(var_46_32.x, var_46_32.y, var_46_32.z)

				local var_46_33 = var_46_25.localEulerAngles

				var_46_33.z = 0
				var_46_33.x = 0
				var_46_25.localEulerAngles = var_46_33
			end

			local var_46_34 = "1035ui_story"

			if arg_43_1.actors_[var_46_34] == nil then
				local var_46_35 = Object.Instantiate(Asset.Load("Char/" .. var_46_34), arg_43_1.stage_.transform)

				var_46_35.name = var_46_34
				var_46_35.transform.localPosition = Vector3.New(0, 100, 0)
				arg_43_1.actors_[var_46_34] = var_46_35

				local var_46_36 = var_46_35:GetComponentInChildren(typeof(CharacterEffect))

				var_46_36.enabled = true

				local var_46_37 = GameObjectTools.GetOrAddComponent(var_46_35, typeof(DynamicBoneHelper))

				if var_46_37 then
					var_46_37:EnableDynamicBone(false)
				end

				arg_43_1:ShowWeapon(var_46_36.transform, false)

				arg_43_1.var_[var_46_34 .. "Animator"] = var_46_36.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_43_1.var_[var_46_34 .. "Animator"].applyRootMotion = true
				arg_43_1.var_[var_46_34 .. "LipSync"] = var_46_36.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_46_38 = arg_43_1.actors_["1035ui_story"].transform
			local var_46_39 = 0

			if var_46_39 < arg_43_1.time_ and arg_43_1.time_ <= var_46_39 + arg_46_0 then
				arg_43_1.var_.moveOldPos1035ui_story = var_46_38.localPosition
			end

			local var_46_40 = 0.001

			if var_46_39 <= arg_43_1.time_ and arg_43_1.time_ < var_46_39 + var_46_40 then
				local var_46_41 = (arg_43_1.time_ - var_46_39) / var_46_40
				local var_46_42 = Vector3.New(0, -1.05, -5.6)

				var_46_38.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1035ui_story, var_46_42, var_46_41)

				local var_46_43 = manager.ui.mainCamera.transform.position - var_46_38.position

				var_46_38.forward = Vector3.New(var_46_43.x, var_46_43.y, var_46_43.z)

				local var_46_44 = var_46_38.localEulerAngles

				var_46_44.z = 0
				var_46_44.x = 0
				var_46_38.localEulerAngles = var_46_44
			end

			if arg_43_1.time_ >= var_46_39 + var_46_40 and arg_43_1.time_ < var_46_39 + var_46_40 + arg_46_0 then
				var_46_38.localPosition = Vector3.New(0, -1.05, -5.6)

				local var_46_45 = manager.ui.mainCamera.transform.position - var_46_38.position

				var_46_38.forward = Vector3.New(var_46_45.x, var_46_45.y, var_46_45.z)

				local var_46_46 = var_46_38.localEulerAngles

				var_46_46.z = 0
				var_46_46.x = 0
				var_46_38.localEulerAngles = var_46_46
			end

			local var_46_47 = arg_43_1.actors_["1035ui_story"]
			local var_46_48 = 0

			if var_46_48 < arg_43_1.time_ and arg_43_1.time_ <= var_46_48 + arg_46_0 and arg_43_1.var_.characterEffect1035ui_story == nil then
				arg_43_1.var_.characterEffect1035ui_story = var_46_47:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_49 = 0.1

			if var_46_48 <= arg_43_1.time_ and arg_43_1.time_ < var_46_48 + var_46_49 then
				local var_46_50 = (arg_43_1.time_ - var_46_48) / var_46_49

				if arg_43_1.var_.characterEffect1035ui_story then
					arg_43_1.var_.characterEffect1035ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_48 + var_46_49 and arg_43_1.time_ < var_46_48 + var_46_49 + arg_46_0 and arg_43_1.var_.characterEffect1035ui_story then
				arg_43_1.var_.characterEffect1035ui_story.fillFlat = false
			end

			local var_46_51 = 0

			if var_46_51 < arg_43_1.time_ and arg_43_1.time_ <= var_46_51 + arg_46_0 then
				arg_43_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035action/1035action7_1")
			end

			local var_46_52 = 0
			local var_46_53 = 0.5

			if var_46_52 < arg_43_1.time_ and arg_43_1.time_ <= var_46_52 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_54 = arg_43_1:FormatText(StoryNameCfg[21].name)

				arg_43_1.leftNameTxt_.text = var_46_54

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_55 = arg_43_1:GetWordFromCfg(101021011)
				local var_46_56 = arg_43_1:FormatText(var_46_55.content)

				arg_43_1.text_.text = var_46_56

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_57 = 20
				local var_46_58 = utf8.len(var_46_56)
				local var_46_59 = var_46_57 <= 0 and var_46_53 or var_46_53 * (var_46_58 / var_46_57)

				if var_46_59 > 0 and var_46_53 < var_46_59 then
					arg_43_1.talkMaxDuration = var_46_59

					if var_46_59 + var_46_52 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_59 + var_46_52
					end
				end

				arg_43_1.text_.text = var_46_56
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021011", "story_v_out_101021.awb") ~= 0 then
					local var_46_60 = manager.audio:GetVoiceLength("story_v_out_101021", "101021011", "story_v_out_101021.awb") / 1000

					if var_46_60 + var_46_52 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_60 + var_46_52
					end

					if var_46_55.prefab_name ~= "" and arg_43_1.actors_[var_46_55.prefab_name] ~= nil then
						local var_46_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_55.prefab_name].transform, "story_v_out_101021", "101021011", "story_v_out_101021.awb")

						arg_43_1:RecordAudio("101021011", var_46_61)
						arg_43_1:RecordAudio("101021011", var_46_61)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_101021", "101021011", "story_v_out_101021.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_101021", "101021011", "story_v_out_101021.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_62 = math.max(var_46_53, arg_43_1.talkMaxDuration)

			if var_46_52 <= arg_43_1.time_ and arg_43_1.time_ < var_46_52 + var_46_62 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_52) / var_46_62

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_52 + var_46_62 and arg_43_1.time_ < var_46_52 + var_46_62 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play101021012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 101021012
		arg_47_1.duration_ = 5.466

		local var_47_0 = {
			ja = 3.1,
			ko = 5.466,
			zh = 3.9,
			en = 3.7
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
				arg_47_0:Play101021013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1035ui_story"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1035ui_story = var_50_0.localPosition
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(0, 100, 0)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1035ui_story, var_50_4, var_50_3)

				local var_50_5 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_5.x, var_50_5.y, var_50_5.z)

				local var_50_6 = var_50_0.localEulerAngles

				var_50_6.z = 0
				var_50_6.x = 0
				var_50_0.localEulerAngles = var_50_6
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(0, 100, 0)

				local var_50_7 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_7.x, var_50_7.y, var_50_7.z)

				local var_50_8 = var_50_0.localEulerAngles

				var_50_8.z = 0
				var_50_8.x = 0
				var_50_0.localEulerAngles = var_50_8
			end

			local var_50_9 = 0
			local var_50_10 = 0.475

			if var_50_9 < arg_47_1.time_ and arg_47_1.time_ <= var_50_9 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_11 = arg_47_1:FormatText(StoryNameCfg[16].name)

				arg_47_1.leftNameTxt_.text = var_50_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, true)
				arg_47_1.iconController_:SetSelectedState("hero")

				arg_47_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_12 = arg_47_1:GetWordFromCfg(101021012)
				local var_50_13 = arg_47_1:FormatText(var_50_12.content)

				arg_47_1.text_.text = var_50_13

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_14 = 17
				local var_50_15 = utf8.len(var_50_13)
				local var_50_16 = var_50_14 <= 0 and var_50_10 or var_50_10 * (var_50_15 / var_50_14)

				if var_50_16 > 0 and var_50_10 < var_50_16 then
					arg_47_1.talkMaxDuration = var_50_16

					if var_50_16 + var_50_9 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_16 + var_50_9
					end
				end

				arg_47_1.text_.text = var_50_13
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021012", "story_v_out_101021.awb") ~= 0 then
					local var_50_17 = manager.audio:GetVoiceLength("story_v_out_101021", "101021012", "story_v_out_101021.awb") / 1000

					if var_50_17 + var_50_9 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_17 + var_50_9
					end

					if var_50_12.prefab_name ~= "" and arg_47_1.actors_[var_50_12.prefab_name] ~= nil then
						local var_50_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_12.prefab_name].transform, "story_v_out_101021", "101021012", "story_v_out_101021.awb")

						arg_47_1:RecordAudio("101021012", var_50_18)
						arg_47_1:RecordAudio("101021012", var_50_18)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_101021", "101021012", "story_v_out_101021.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_101021", "101021012", "story_v_out_101021.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_19 = math.max(var_50_10, arg_47_1.talkMaxDuration)

			if var_50_9 <= arg_47_1.time_ and arg_47_1.time_ < var_50_9 + var_50_19 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_9) / var_50_19

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_9 + var_50_19 and arg_47_1.time_ < var_50_9 + var_50_19 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play101021013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 101021013
		arg_51_1.duration_ = 5.766

		local var_51_0 = {
			ja = 5.766,
			ko = 3.1,
			zh = 3.2,
			en = 4.733
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
				arg_51_0:Play101021014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.35

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[17].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(101021013)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021013", "story_v_out_101021.awb") ~= 0 then
					local var_54_8 = manager.audio:GetVoiceLength("story_v_out_101021", "101021013", "story_v_out_101021.awb") / 1000

					if var_54_8 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_0
					end

					if var_54_3.prefab_name ~= "" and arg_51_1.actors_[var_54_3.prefab_name] ~= nil then
						local var_54_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_3.prefab_name].transform, "story_v_out_101021", "101021013", "story_v_out_101021.awb")

						arg_51_1:RecordAudio("101021013", var_54_9)
						arg_51_1:RecordAudio("101021013", var_54_9)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_101021", "101021013", "story_v_out_101021.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_101021", "101021013", "story_v_out_101021.awb")
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
	Play101021014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 101021014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play101021015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.675

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0

				arg_55_1.dialog_:SetActive(true)

				local var_58_2 = LeanTween.value(arg_55_1.dialog_, 0, 1, 0.3)

				var_58_2:setOnUpdate(LuaHelper.FloatAction(function(arg_59_0)
					arg_55_1.dialogCg_.alpha = arg_59_0
				end))
				var_58_2:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_55_1.dialog_)
					var_58_2:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_55_1.duration_ = arg_55_1.duration_ + 0.3

				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(101021014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 27
				local var_58_6 = utf8.len(var_58_4)
				local var_58_7 = var_58_5 <= 0 and var_58_1 or var_58_1 * (var_58_6 / var_58_5)

				if var_58_7 > 0 and var_58_1 < var_58_7 then
					arg_55_1.talkMaxDuration = var_58_7
					var_58_0 = var_58_0 + 0.3

					if var_58_7 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_7 + var_58_0
					end
				end

				arg_55_1.text_.text = var_58_4
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_8 = var_58_0 + 0.3
			local var_58_9 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_8 <= arg_55_1.time_ and arg_55_1.time_ < var_58_8 + var_58_9 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_8) / var_58_9

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_8 + var_58_9 and arg_55_1.time_ < var_58_8 + var_58_9 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play101021015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 101021015
		arg_61_1.duration_ = 7.733

		local var_61_0 = {
			ja = 6.166,
			ko = 7.1,
			zh = 7,
			en = 7.733
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
				arg_61_0:Play101021016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["3008ui_story"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and arg_61_1.var_.characterEffect3008ui_story == nil then
				arg_61_1.var_.characterEffect3008ui_story = var_64_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_2 = 0.1

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.characterEffect3008ui_story then
					arg_61_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and arg_61_1.var_.characterEffect3008ui_story then
				arg_61_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_64_4 = arg_61_1.actors_["3008ui_story"].transform
			local var_64_5 = 0

			if var_64_5 < arg_61_1.time_ and arg_61_1.time_ <= var_64_5 + arg_64_0 then
				arg_61_1.var_.moveOldPos3008ui_story = var_64_4.localPosition
			end

			local var_64_6 = 0.001

			if var_64_5 <= arg_61_1.time_ and arg_61_1.time_ < var_64_5 + var_64_6 then
				local var_64_7 = (arg_61_1.time_ - var_64_5) / var_64_6
				local var_64_8 = Vector3.New(-0.7, -1.51, -4.3)

				var_64_4.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos3008ui_story, var_64_8, var_64_7)

				local var_64_9 = manager.ui.mainCamera.transform.position - var_64_4.position

				var_64_4.forward = Vector3.New(var_64_9.x, var_64_9.y, var_64_9.z)

				local var_64_10 = var_64_4.localEulerAngles

				var_64_10.z = 0
				var_64_10.x = 0
				var_64_4.localEulerAngles = var_64_10
			end

			if arg_61_1.time_ >= var_64_5 + var_64_6 and arg_61_1.time_ < var_64_5 + var_64_6 + arg_64_0 then
				var_64_4.localPosition = Vector3.New(-0.7, -1.51, -4.3)

				local var_64_11 = manager.ui.mainCamera.transform.position - var_64_4.position

				var_64_4.forward = Vector3.New(var_64_11.x, var_64_11.y, var_64_11.z)

				local var_64_12 = var_64_4.localEulerAngles

				var_64_12.z = 0
				var_64_12.x = 0
				var_64_4.localEulerAngles = var_64_12
			end

			local var_64_13 = 0

			if var_64_13 < arg_61_1.time_ and arg_61_1.time_ <= var_64_13 + arg_64_0 then
				arg_61_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action1_1")
			end

			local var_64_14 = 0

			if var_64_14 < arg_61_1.time_ and arg_61_1.time_ <= var_64_14 + arg_64_0 then
				arg_61_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_64_15 = 0
			local var_64_16 = 0.85

			if var_64_15 < arg_61_1.time_ and arg_61_1.time_ <= var_64_15 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_17 = arg_61_1:FormatText(StoryNameCfg[22].name)

				arg_61_1.leftNameTxt_.text = var_64_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_18 = arg_61_1:GetWordFromCfg(101021015)
				local var_64_19 = arg_61_1:FormatText(var_64_18.content)

				arg_61_1.text_.text = var_64_19

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_20 = 33
				local var_64_21 = utf8.len(var_64_19)
				local var_64_22 = var_64_20 <= 0 and var_64_16 or var_64_16 * (var_64_21 / var_64_20)

				if var_64_22 > 0 and var_64_16 < var_64_22 then
					arg_61_1.talkMaxDuration = var_64_22

					if var_64_22 + var_64_15 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_22 + var_64_15
					end
				end

				arg_61_1.text_.text = var_64_19
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021015", "story_v_out_101021.awb") ~= 0 then
					local var_64_23 = manager.audio:GetVoiceLength("story_v_out_101021", "101021015", "story_v_out_101021.awb") / 1000

					if var_64_23 + var_64_15 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_23 + var_64_15
					end

					if var_64_18.prefab_name ~= "" and arg_61_1.actors_[var_64_18.prefab_name] ~= nil then
						local var_64_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_18.prefab_name].transform, "story_v_out_101021", "101021015", "story_v_out_101021.awb")

						arg_61_1:RecordAudio("101021015", var_64_24)
						arg_61_1:RecordAudio("101021015", var_64_24)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_101021", "101021015", "story_v_out_101021.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_101021", "101021015", "story_v_out_101021.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_25 = math.max(var_64_16, arg_61_1.talkMaxDuration)

			if var_64_15 <= arg_61_1.time_ and arg_61_1.time_ < var_64_15 + var_64_25 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_15) / var_64_25

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_15 + var_64_25 and arg_61_1.time_ < var_64_15 + var_64_25 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play101021016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 101021016
		arg_65_1.duration_ = 4.933

		local var_65_0 = {
			ja = 4.933,
			ko = 4.8,
			zh = 4.5,
			en = 4.566
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
				arg_65_0:Play101021017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["3008ui_story"]
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 and arg_65_1.var_.characterEffect3008ui_story == nil then
				arg_65_1.var_.characterEffect3008ui_story = var_68_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_2 = 0.1

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2

				if arg_65_1.var_.characterEffect3008ui_story then
					local var_68_4 = Mathf.Lerp(0, 0.5, var_68_3)

					arg_65_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_65_1.var_.characterEffect3008ui_story.fillRatio = var_68_4
				end
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 and arg_65_1.var_.characterEffect3008ui_story then
				local var_68_5 = 0.5

				arg_65_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_65_1.var_.characterEffect3008ui_story.fillRatio = var_68_5
			end

			local var_68_6 = arg_65_1.actors_["1035ui_story"].transform
			local var_68_7 = 0

			if var_68_7 < arg_65_1.time_ and arg_65_1.time_ <= var_68_7 + arg_68_0 then
				arg_65_1.var_.moveOldPos1035ui_story = var_68_6.localPosition
			end

			local var_68_8 = 0.001

			if var_68_7 <= arg_65_1.time_ and arg_65_1.time_ < var_68_7 + var_68_8 then
				local var_68_9 = (arg_65_1.time_ - var_68_7) / var_68_8
				local var_68_10 = Vector3.New(0.7, -1.05, -5.6)

				var_68_6.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos1035ui_story, var_68_10, var_68_9)

				local var_68_11 = manager.ui.mainCamera.transform.position - var_68_6.position

				var_68_6.forward = Vector3.New(var_68_11.x, var_68_11.y, var_68_11.z)

				local var_68_12 = var_68_6.localEulerAngles

				var_68_12.z = 0
				var_68_12.x = 0
				var_68_6.localEulerAngles = var_68_12
			end

			if arg_65_1.time_ >= var_68_7 + var_68_8 and arg_65_1.time_ < var_68_7 + var_68_8 + arg_68_0 then
				var_68_6.localPosition = Vector3.New(0.7, -1.05, -5.6)

				local var_68_13 = manager.ui.mainCamera.transform.position - var_68_6.position

				var_68_6.forward = Vector3.New(var_68_13.x, var_68_13.y, var_68_13.z)

				local var_68_14 = var_68_6.localEulerAngles

				var_68_14.z = 0
				var_68_14.x = 0
				var_68_6.localEulerAngles = var_68_14
			end

			local var_68_15 = 0

			if var_68_15 < arg_65_1.time_ and arg_65_1.time_ <= var_68_15 + arg_68_0 then
				arg_65_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035action/1035action11_1")
			end

			local var_68_16 = 0
			local var_68_17 = 0.475

			if var_68_16 < arg_65_1.time_ and arg_65_1.time_ <= var_68_16 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_18 = arg_65_1:FormatText(StoryNameCfg[21].name)

				arg_65_1.leftNameTxt_.text = var_68_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_19 = arg_65_1:GetWordFromCfg(101021016)
				local var_68_20 = arg_65_1:FormatText(var_68_19.content)

				arg_65_1.text_.text = var_68_20

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_21 = 19
				local var_68_22 = utf8.len(var_68_20)
				local var_68_23 = var_68_21 <= 0 and var_68_17 or var_68_17 * (var_68_22 / var_68_21)

				if var_68_23 > 0 and var_68_17 < var_68_23 then
					arg_65_1.talkMaxDuration = var_68_23

					if var_68_23 + var_68_16 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_23 + var_68_16
					end
				end

				arg_65_1.text_.text = var_68_20
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021016", "story_v_out_101021.awb") ~= 0 then
					local var_68_24 = manager.audio:GetVoiceLength("story_v_out_101021", "101021016", "story_v_out_101021.awb") / 1000

					if var_68_24 + var_68_16 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_24 + var_68_16
					end

					if var_68_19.prefab_name ~= "" and arg_65_1.actors_[var_68_19.prefab_name] ~= nil then
						local var_68_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_19.prefab_name].transform, "story_v_out_101021", "101021016", "story_v_out_101021.awb")

						arg_65_1:RecordAudio("101021016", var_68_25)
						arg_65_1:RecordAudio("101021016", var_68_25)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_101021", "101021016", "story_v_out_101021.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_101021", "101021016", "story_v_out_101021.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_26 = math.max(var_68_17, arg_65_1.talkMaxDuration)

			if var_68_16 <= arg_65_1.time_ and arg_65_1.time_ < var_68_16 + var_68_26 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_16) / var_68_26

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_16 + var_68_26 and arg_65_1.time_ < var_68_16 + var_68_26 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play101021017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 101021017
		arg_69_1.duration_ = 3.066

		local var_69_0 = {
			ja = 3,
			ko = 2.6,
			zh = 3.066,
			en = 1.999999999999
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
				arg_69_0:Play101021018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["3008ui_story"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and arg_69_1.var_.characterEffect3008ui_story == nil then
				arg_69_1.var_.characterEffect3008ui_story = var_72_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_2 = 0.1

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.characterEffect3008ui_story then
					arg_69_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and arg_69_1.var_.characterEffect3008ui_story then
				arg_69_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_72_4 = arg_69_1.actors_["1035ui_story"]
			local var_72_5 = 0

			if var_72_5 < arg_69_1.time_ and arg_69_1.time_ <= var_72_5 + arg_72_0 and arg_69_1.var_.characterEffect1035ui_story == nil then
				arg_69_1.var_.characterEffect1035ui_story = var_72_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_6 = 0.100000001490116

			if var_72_5 <= arg_69_1.time_ and arg_69_1.time_ < var_72_5 + var_72_6 then
				local var_72_7 = (arg_69_1.time_ - var_72_5) / var_72_6

				if arg_69_1.var_.characterEffect1035ui_story then
					local var_72_8 = Mathf.Lerp(0, 0.5, var_72_7)

					arg_69_1.var_.characterEffect1035ui_story.fillFlat = true
					arg_69_1.var_.characterEffect1035ui_story.fillRatio = var_72_8
				end
			end

			if arg_69_1.time_ >= var_72_5 + var_72_6 and arg_69_1.time_ < var_72_5 + var_72_6 + arg_72_0 and arg_69_1.var_.characterEffect1035ui_story then
				local var_72_9 = 0.5

				arg_69_1.var_.characterEffect1035ui_story.fillFlat = true
				arg_69_1.var_.characterEffect1035ui_story.fillRatio = var_72_9
			end

			local var_72_10 = 0

			if var_72_10 < arg_69_1.time_ and arg_69_1.time_ <= var_72_10 + arg_72_0 then
				arg_69_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_72_11 = 0
			local var_72_12 = 0.25

			if var_72_11 < arg_69_1.time_ and arg_69_1.time_ <= var_72_11 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_13 = arg_69_1:FormatText(StoryNameCfg[22].name)

				arg_69_1.leftNameTxt_.text = var_72_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_14 = arg_69_1:GetWordFromCfg(101021017)
				local var_72_15 = arg_69_1:FormatText(var_72_14.content)

				arg_69_1.text_.text = var_72_15

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_16 = 10
				local var_72_17 = utf8.len(var_72_15)
				local var_72_18 = var_72_16 <= 0 and var_72_12 or var_72_12 * (var_72_17 / var_72_16)

				if var_72_18 > 0 and var_72_12 < var_72_18 then
					arg_69_1.talkMaxDuration = var_72_18

					if var_72_18 + var_72_11 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_18 + var_72_11
					end
				end

				arg_69_1.text_.text = var_72_15
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021017", "story_v_out_101021.awb") ~= 0 then
					local var_72_19 = manager.audio:GetVoiceLength("story_v_out_101021", "101021017", "story_v_out_101021.awb") / 1000

					if var_72_19 + var_72_11 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_19 + var_72_11
					end

					if var_72_14.prefab_name ~= "" and arg_69_1.actors_[var_72_14.prefab_name] ~= nil then
						local var_72_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_14.prefab_name].transform, "story_v_out_101021", "101021017", "story_v_out_101021.awb")

						arg_69_1:RecordAudio("101021017", var_72_20)
						arg_69_1:RecordAudio("101021017", var_72_20)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_101021", "101021017", "story_v_out_101021.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_101021", "101021017", "story_v_out_101021.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_21 = math.max(var_72_12, arg_69_1.talkMaxDuration)

			if var_72_11 <= arg_69_1.time_ and arg_69_1.time_ < var_72_11 + var_72_21 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_11) / var_72_21

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_11 + var_72_21 and arg_69_1.time_ < var_72_11 + var_72_21 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play101021018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 101021018
		arg_73_1.duration_ = 7.7

		local var_73_0 = {
			ja = 7.7,
			ko = 2.533,
			zh = 4.066,
			en = 5.233
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
				arg_73_0:Play101021019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_76_1 = 0
			local var_76_2 = 0.525

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_3 = arg_73_1:FormatText(StoryNameCfg[22].name)

				arg_73_1.leftNameTxt_.text = var_76_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_4 = arg_73_1:GetWordFromCfg(101021018)
				local var_76_5 = arg_73_1:FormatText(var_76_4.content)

				arg_73_1.text_.text = var_76_5

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_6 = 21
				local var_76_7 = utf8.len(var_76_5)
				local var_76_8 = var_76_6 <= 0 and var_76_2 or var_76_2 * (var_76_7 / var_76_6)

				if var_76_8 > 0 and var_76_2 < var_76_8 then
					arg_73_1.talkMaxDuration = var_76_8

					if var_76_8 + var_76_1 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_8 + var_76_1
					end
				end

				arg_73_1.text_.text = var_76_5
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021018", "story_v_out_101021.awb") ~= 0 then
					local var_76_9 = manager.audio:GetVoiceLength("story_v_out_101021", "101021018", "story_v_out_101021.awb") / 1000

					if var_76_9 + var_76_1 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_9 + var_76_1
					end

					if var_76_4.prefab_name ~= "" and arg_73_1.actors_[var_76_4.prefab_name] ~= nil then
						local var_76_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_4.prefab_name].transform, "story_v_out_101021", "101021018", "story_v_out_101021.awb")

						arg_73_1:RecordAudio("101021018", var_76_10)
						arg_73_1:RecordAudio("101021018", var_76_10)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_101021", "101021018", "story_v_out_101021.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_101021", "101021018", "story_v_out_101021.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_11 = math.max(var_76_2, arg_73_1.talkMaxDuration)

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_11 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_1) / var_76_11

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_1 + var_76_11 and arg_73_1.time_ < var_76_1 + var_76_11 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play101021019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 101021019
		arg_77_1.duration_ = 6.966

		local var_77_0 = {
			ja = 6.966,
			ko = 2.466,
			zh = 5.066,
			en = 5
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
				arg_77_0:Play101021020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["3008ui_story"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.characterEffect3008ui_story == nil then
				arg_77_1.var_.characterEffect3008ui_story = var_80_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_2 = 0.1

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.characterEffect3008ui_story then
					local var_80_4 = Mathf.Lerp(0, 0.5, var_80_3)

					arg_77_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_77_1.var_.characterEffect3008ui_story.fillRatio = var_80_4
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.characterEffect3008ui_story then
				local var_80_5 = 0.5

				arg_77_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_77_1.var_.characterEffect3008ui_story.fillRatio = var_80_5
			end

			local var_80_6 = arg_77_1.actors_["1035ui_story"]
			local var_80_7 = 0

			if var_80_7 < arg_77_1.time_ and arg_77_1.time_ <= var_80_7 + arg_80_0 and arg_77_1.var_.characterEffect1035ui_story == nil then
				arg_77_1.var_.characterEffect1035ui_story = var_80_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_8 = 0.1

			if var_80_7 <= arg_77_1.time_ and arg_77_1.time_ < var_80_7 + var_80_8 then
				local var_80_9 = (arg_77_1.time_ - var_80_7) / var_80_8

				if arg_77_1.var_.characterEffect1035ui_story then
					arg_77_1.var_.characterEffect1035ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_7 + var_80_8 and arg_77_1.time_ < var_80_7 + var_80_8 + arg_80_0 and arg_77_1.var_.characterEffect1035ui_story then
				arg_77_1.var_.characterEffect1035ui_story.fillFlat = false
			end

			local var_80_10 = 0

			if var_80_10 < arg_77_1.time_ and arg_77_1.time_ <= var_80_10 + arg_80_0 then
				arg_77_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035action/1035action11_2")
			end

			local var_80_11 = 0
			local var_80_12 = 0.65

			if var_80_11 < arg_77_1.time_ and arg_77_1.time_ <= var_80_11 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_13 = arg_77_1:FormatText(StoryNameCfg[21].name)

				arg_77_1.leftNameTxt_.text = var_80_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_14 = arg_77_1:GetWordFromCfg(101021019)
				local var_80_15 = arg_77_1:FormatText(var_80_14.content)

				arg_77_1.text_.text = var_80_15

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_16 = 26
				local var_80_17 = utf8.len(var_80_15)
				local var_80_18 = var_80_16 <= 0 and var_80_12 or var_80_12 * (var_80_17 / var_80_16)

				if var_80_18 > 0 and var_80_12 < var_80_18 then
					arg_77_1.talkMaxDuration = var_80_18

					if var_80_18 + var_80_11 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_18 + var_80_11
					end
				end

				arg_77_1.text_.text = var_80_15
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021019", "story_v_out_101021.awb") ~= 0 then
					local var_80_19 = manager.audio:GetVoiceLength("story_v_out_101021", "101021019", "story_v_out_101021.awb") / 1000

					if var_80_19 + var_80_11 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_19 + var_80_11
					end

					if var_80_14.prefab_name ~= "" and arg_77_1.actors_[var_80_14.prefab_name] ~= nil then
						local var_80_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_14.prefab_name].transform, "story_v_out_101021", "101021019", "story_v_out_101021.awb")

						arg_77_1:RecordAudio("101021019", var_80_20)
						arg_77_1:RecordAudio("101021019", var_80_20)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_101021", "101021019", "story_v_out_101021.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_101021", "101021019", "story_v_out_101021.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_21 = math.max(var_80_12, arg_77_1.talkMaxDuration)

			if var_80_11 <= arg_77_1.time_ and arg_77_1.time_ < var_80_11 + var_80_21 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_11) / var_80_21

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_11 + var_80_21 and arg_77_1.time_ < var_80_11 + var_80_21 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play101021020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 101021020
		arg_81_1.duration_ = 8.6

		local var_81_0 = {
			ja = 8.6,
			ko = 6.133,
			zh = 4.1,
			en = 4.533
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
				arg_81_0:Play101021021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["3008ui_story"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.characterEffect3008ui_story == nil then
				arg_81_1.var_.characterEffect3008ui_story = var_84_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_2 = 0.1

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.characterEffect3008ui_story then
					arg_81_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.characterEffect3008ui_story then
				arg_81_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_84_4 = arg_81_1.actors_["1035ui_story"]
			local var_84_5 = 0

			if var_84_5 < arg_81_1.time_ and arg_81_1.time_ <= var_84_5 + arg_84_0 and arg_81_1.var_.characterEffect1035ui_story == nil then
				arg_81_1.var_.characterEffect1035ui_story = var_84_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_6 = 0.1

			if var_84_5 <= arg_81_1.time_ and arg_81_1.time_ < var_84_5 + var_84_6 then
				local var_84_7 = (arg_81_1.time_ - var_84_5) / var_84_6

				if arg_81_1.var_.characterEffect1035ui_story then
					local var_84_8 = Mathf.Lerp(0, 0.5, var_84_7)

					arg_81_1.var_.characterEffect1035ui_story.fillFlat = true
					arg_81_1.var_.characterEffect1035ui_story.fillRatio = var_84_8
				end
			end

			if arg_81_1.time_ >= var_84_5 + var_84_6 and arg_81_1.time_ < var_84_5 + var_84_6 + arg_84_0 and arg_81_1.var_.characterEffect1035ui_story then
				local var_84_9 = 0.5

				arg_81_1.var_.characterEffect1035ui_story.fillFlat = true
				arg_81_1.var_.characterEffect1035ui_story.fillRatio = var_84_9
			end

			local var_84_10 = 0

			if var_84_10 < arg_81_1.time_ and arg_81_1.time_ <= var_84_10 + arg_84_0 then
				arg_81_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_84_11 = 0

			if var_84_11 < arg_81_1.time_ and arg_81_1.time_ <= var_84_11 + arg_84_0 then
				arg_81_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action6_1")
			end

			local var_84_12 = 0
			local var_84_13 = 0.475

			if var_84_12 < arg_81_1.time_ and arg_81_1.time_ <= var_84_12 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_14 = arg_81_1:FormatText(StoryNameCfg[22].name)

				arg_81_1.leftNameTxt_.text = var_84_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_15 = arg_81_1:GetWordFromCfg(101021020)
				local var_84_16 = arg_81_1:FormatText(var_84_15.content)

				arg_81_1.text_.text = var_84_16

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_17 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021020", "story_v_out_101021.awb") ~= 0 then
					local var_84_20 = manager.audio:GetVoiceLength("story_v_out_101021", "101021020", "story_v_out_101021.awb") / 1000

					if var_84_20 + var_84_12 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_20 + var_84_12
					end

					if var_84_15.prefab_name ~= "" and arg_81_1.actors_[var_84_15.prefab_name] ~= nil then
						local var_84_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_15.prefab_name].transform, "story_v_out_101021", "101021020", "story_v_out_101021.awb")

						arg_81_1:RecordAudio("101021020", var_84_21)
						arg_81_1:RecordAudio("101021020", var_84_21)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_101021", "101021020", "story_v_out_101021.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_101021", "101021020", "story_v_out_101021.awb")
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
	Play101021021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 101021021
		arg_85_1.duration_ = 9

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play101021022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.mask_.enabled = true
				arg_85_1.mask_.raycastTarget = true

				arg_85_1:SetGaussion(false)
			end

			local var_88_1 = 2

			if var_88_0 <= arg_85_1.time_ and arg_85_1.time_ < var_88_0 + var_88_1 then
				local var_88_2 = (arg_85_1.time_ - var_88_0) / var_88_1
				local var_88_3 = Color.New(0, 0, 0)

				var_88_3.a = Mathf.Lerp(0, 1, var_88_2)
				arg_85_1.mask_.color = var_88_3
			end

			if arg_85_1.time_ >= var_88_0 + var_88_1 and arg_85_1.time_ < var_88_0 + var_88_1 + arg_88_0 then
				local var_88_4 = Color.New(0, 0, 0)

				var_88_4.a = 1
				arg_85_1.mask_.color = var_88_4
			end

			local var_88_5 = 2

			if var_88_5 < arg_85_1.time_ and arg_85_1.time_ <= var_88_5 + arg_88_0 then
				arg_85_1.mask_.enabled = true
				arg_85_1.mask_.raycastTarget = true

				arg_85_1:SetGaussion(false)
			end

			local var_88_6 = 2

			if var_88_5 <= arg_85_1.time_ and arg_85_1.time_ < var_88_5 + var_88_6 then
				local var_88_7 = (arg_85_1.time_ - var_88_5) / var_88_6
				local var_88_8 = Color.New(0, 0, 0)

				var_88_8.a = Mathf.Lerp(1, 0, var_88_7)
				arg_85_1.mask_.color = var_88_8
			end

			if arg_85_1.time_ >= var_88_5 + var_88_6 and arg_85_1.time_ < var_88_5 + var_88_6 + arg_88_0 then
				local var_88_9 = Color.New(0, 0, 0)
				local var_88_10 = 0

				arg_85_1.mask_.enabled = false
				var_88_9.a = var_88_10
				arg_85_1.mask_.color = var_88_9
			end

			local var_88_11 = "B10f"

			if arg_85_1.bgs_[var_88_11] == nil then
				local var_88_12 = Object.Instantiate(arg_85_1.paintGo_)

				var_88_12:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_88_11)
				var_88_12.name = var_88_11
				var_88_12.transform.parent = arg_85_1.stage_.transform
				var_88_12.transform.localPosition = Vector3.New(0, 100, 0)
				arg_85_1.bgs_[var_88_11] = var_88_12
			end

			local var_88_13 = 2

			if var_88_13 < arg_85_1.time_ and arg_85_1.time_ <= var_88_13 + arg_88_0 then
				local var_88_14 = manager.ui.mainCamera.transform.localPosition
				local var_88_15 = Vector3.New(0, 0, 10) + Vector3.New(var_88_14.x, var_88_14.y, 0)
				local var_88_16 = arg_85_1.bgs_.B10f

				var_88_16.transform.localPosition = var_88_15
				var_88_16.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_88_17 = var_88_16:GetComponent("SpriteRenderer")

				if var_88_17 and var_88_17.sprite then
					local var_88_18 = (var_88_16.transform.localPosition - var_88_14).z
					local var_88_19 = manager.ui.mainCameraCom_
					local var_88_20 = 2 * var_88_18 * Mathf.Tan(var_88_19.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_88_21 = var_88_20 * var_88_19.aspect
					local var_88_22 = var_88_17.sprite.bounds.size.x
					local var_88_23 = var_88_17.sprite.bounds.size.y
					local var_88_24 = var_88_21 / var_88_22
					local var_88_25 = var_88_20 / var_88_23
					local var_88_26 = var_88_25 < var_88_24 and var_88_24 or var_88_25

					var_88_16.transform.localScale = Vector3.New(var_88_26, var_88_26, 0)
				end

				for iter_88_0, iter_88_1 in pairs(arg_85_1.bgs_) do
					if iter_88_0 ~= "B10f" then
						iter_88_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_88_27 = arg_85_1.actors_["3008ui_story"].transform
			local var_88_28 = 1.967

			if var_88_28 < arg_85_1.time_ and arg_85_1.time_ <= var_88_28 + arg_88_0 then
				arg_85_1.var_.moveOldPos3008ui_story = var_88_27.localPosition
			end

			local var_88_29 = 0.001

			if var_88_28 <= arg_85_1.time_ and arg_85_1.time_ < var_88_28 + var_88_29 then
				local var_88_30 = (arg_85_1.time_ - var_88_28) / var_88_29
				local var_88_31 = Vector3.New(0, 100, 0)

				var_88_27.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos3008ui_story, var_88_31, var_88_30)

				local var_88_32 = manager.ui.mainCamera.transform.position - var_88_27.position

				var_88_27.forward = Vector3.New(var_88_32.x, var_88_32.y, var_88_32.z)

				local var_88_33 = var_88_27.localEulerAngles

				var_88_33.z = 0
				var_88_33.x = 0
				var_88_27.localEulerAngles = var_88_33
			end

			if arg_85_1.time_ >= var_88_28 + var_88_29 and arg_85_1.time_ < var_88_28 + var_88_29 + arg_88_0 then
				var_88_27.localPosition = Vector3.New(0, 100, 0)

				local var_88_34 = manager.ui.mainCamera.transform.position - var_88_27.position

				var_88_27.forward = Vector3.New(var_88_34.x, var_88_34.y, var_88_34.z)

				local var_88_35 = var_88_27.localEulerAngles

				var_88_35.z = 0
				var_88_35.x = 0
				var_88_27.localEulerAngles = var_88_35
			end

			local var_88_36 = arg_85_1.actors_["1035ui_story"].transform
			local var_88_37 = 1.967

			if var_88_37 < arg_85_1.time_ and arg_85_1.time_ <= var_88_37 + arg_88_0 then
				arg_85_1.var_.moveOldPos1035ui_story = var_88_36.localPosition
			end

			local var_88_38 = 0.001

			if var_88_37 <= arg_85_1.time_ and arg_85_1.time_ < var_88_37 + var_88_38 then
				local var_88_39 = (arg_85_1.time_ - var_88_37) / var_88_38
				local var_88_40 = Vector3.New(0, 100, 0)

				var_88_36.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos1035ui_story, var_88_40, var_88_39)

				local var_88_41 = manager.ui.mainCamera.transform.position - var_88_36.position

				var_88_36.forward = Vector3.New(var_88_41.x, var_88_41.y, var_88_41.z)

				local var_88_42 = var_88_36.localEulerAngles

				var_88_42.z = 0
				var_88_42.x = 0
				var_88_36.localEulerAngles = var_88_42
			end

			if arg_85_1.time_ >= var_88_37 + var_88_38 and arg_85_1.time_ < var_88_37 + var_88_38 + arg_88_0 then
				var_88_36.localPosition = Vector3.New(0, 100, 0)

				local var_88_43 = manager.ui.mainCamera.transform.position - var_88_36.position

				var_88_36.forward = Vector3.New(var_88_43.x, var_88_43.y, var_88_43.z)

				local var_88_44 = var_88_36.localEulerAngles

				var_88_44.z = 0
				var_88_44.x = 0
				var_88_36.localEulerAngles = var_88_44
			end

			if arg_85_1.frameCnt_ <= 1 then
				arg_85_1.dialog_:SetActive(false)
			end

			local var_88_45 = 4
			local var_88_46 = 0.625

			if var_88_45 < arg_85_1.time_ and arg_85_1.time_ <= var_88_45 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0

				arg_85_1.dialog_:SetActive(true)

				local var_88_47 = LeanTween.value(arg_85_1.dialog_, 0, 1, 0.3)

				var_88_47:setOnUpdate(LuaHelper.FloatAction(function(arg_89_0)
					arg_85_1.dialogCg_.alpha = arg_89_0
				end))
				var_88_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_85_1.dialog_)
					var_88_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_85_1.duration_ = arg_85_1.duration_ + 0.3

				SetActive(arg_85_1.leftNameGo_, false)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_48 = arg_85_1:GetWordFromCfg(101021021)
				local var_88_49 = arg_85_1:FormatText(var_88_48.content)

				arg_85_1.text_.text = var_88_49

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_50 = 24
				local var_88_51 = utf8.len(var_88_49)
				local var_88_52 = var_88_50 <= 0 and var_88_46 or var_88_46 * (var_88_51 / var_88_50)

				if var_88_52 > 0 and var_88_46 < var_88_52 then
					arg_85_1.talkMaxDuration = var_88_52
					var_88_45 = var_88_45 + 0.3

					if var_88_52 + var_88_45 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_52 + var_88_45
					end
				end

				arg_85_1.text_.text = var_88_49
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_53 = var_88_45 + 0.3
			local var_88_54 = math.max(var_88_46, arg_85_1.talkMaxDuration)

			if var_88_53 <= arg_85_1.time_ and arg_85_1.time_ < var_88_53 + var_88_54 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_53) / var_88_54

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_53 + var_88_54 and arg_85_1.time_ < var_88_53 + var_88_54 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play101021022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 101021022
		arg_91_1.duration_ = 12.8

		local var_91_0 = {
			ja = 12.8,
			ko = 6.866,
			zh = 6.5,
			en = 8
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
				arg_91_0:Play101021023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = "10001_tpose"

			if arg_91_1.actors_[var_94_0] == nil then
				local var_94_1 = Object.Instantiate(Asset.Load("Char/" .. var_94_0), arg_91_1.stage_.transform)

				var_94_1.name = var_94_0
				var_94_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_91_1.actors_[var_94_0] = var_94_1

				local var_94_2 = var_94_1:GetComponentInChildren(typeof(CharacterEffect))

				var_94_2.enabled = true

				local var_94_3 = GameObjectTools.GetOrAddComponent(var_94_1, typeof(DynamicBoneHelper))

				if var_94_3 then
					var_94_3:EnableDynamicBone(false)
				end

				arg_91_1:ShowWeapon(var_94_2.transform, false)

				arg_91_1.var_[var_94_0 .. "Animator"] = var_94_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_91_1.var_[var_94_0 .. "Animator"].applyRootMotion = true
				arg_91_1.var_[var_94_0 .. "LipSync"] = var_94_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_94_4 = arg_91_1.actors_["10001_tpose"].transform
			local var_94_5 = 0

			if var_94_5 < arg_91_1.time_ and arg_91_1.time_ <= var_94_5 + arg_94_0 then
				arg_91_1.var_.moveOldPos10001_tpose = var_94_4.localPosition
			end

			local var_94_6 = 0.001

			if var_94_5 <= arg_91_1.time_ and arg_91_1.time_ < var_94_5 + var_94_6 then
				local var_94_7 = (arg_91_1.time_ - var_94_5) / var_94_6
				local var_94_8 = Vector3.New(0, -1.23, -5.8)

				var_94_4.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos10001_tpose, var_94_8, var_94_7)

				local var_94_9 = manager.ui.mainCamera.transform.position - var_94_4.position

				var_94_4.forward = Vector3.New(var_94_9.x, var_94_9.y, var_94_9.z)

				local var_94_10 = var_94_4.localEulerAngles

				var_94_10.z = 0
				var_94_10.x = 0
				var_94_4.localEulerAngles = var_94_10
			end

			if arg_91_1.time_ >= var_94_5 + var_94_6 and arg_91_1.time_ < var_94_5 + var_94_6 + arg_94_0 then
				var_94_4.localPosition = Vector3.New(0, -1.23, -5.8)

				local var_94_11 = manager.ui.mainCamera.transform.position - var_94_4.position

				var_94_4.forward = Vector3.New(var_94_11.x, var_94_11.y, var_94_11.z)

				local var_94_12 = var_94_4.localEulerAngles

				var_94_12.z = 0
				var_94_12.x = 0
				var_94_4.localEulerAngles = var_94_12
			end

			local var_94_13 = 0

			if var_94_13 < arg_91_1.time_ and arg_91_1.time_ <= var_94_13 + arg_94_0 then
				arg_91_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action1_1")
			end

			local var_94_14 = 0
			local var_94_15 = 1.05

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_16 = arg_91_1:FormatText(StoryNameCfg[23].name)

				arg_91_1.leftNameTxt_.text = var_94_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_17 = arg_91_1:GetWordFromCfg(101021022)
				local var_94_18 = arg_91_1:FormatText(var_94_17.content)

				arg_91_1.text_.text = var_94_18

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_19 = 42
				local var_94_20 = utf8.len(var_94_18)
				local var_94_21 = var_94_19 <= 0 and var_94_15 or var_94_15 * (var_94_20 / var_94_19)

				if var_94_21 > 0 and var_94_15 < var_94_21 then
					arg_91_1.talkMaxDuration = var_94_21

					if var_94_21 + var_94_14 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_21 + var_94_14
					end
				end

				arg_91_1.text_.text = var_94_18
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021022", "story_v_out_101021.awb") ~= 0 then
					local var_94_22 = manager.audio:GetVoiceLength("story_v_out_101021", "101021022", "story_v_out_101021.awb") / 1000

					if var_94_22 + var_94_14 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_22 + var_94_14
					end

					if var_94_17.prefab_name ~= "" and arg_91_1.actors_[var_94_17.prefab_name] ~= nil then
						local var_94_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_17.prefab_name].transform, "story_v_out_101021", "101021022", "story_v_out_101021.awb")

						arg_91_1:RecordAudio("101021022", var_94_23)
						arg_91_1:RecordAudio("101021022", var_94_23)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_101021", "101021022", "story_v_out_101021.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_101021", "101021022", "story_v_out_101021.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_24 = math.max(var_94_15, arg_91_1.talkMaxDuration)

			if var_94_14 <= arg_91_1.time_ and arg_91_1.time_ < var_94_14 + var_94_24 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_14) / var_94_24

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_14 + var_94_24 and arg_91_1.time_ < var_94_14 + var_94_24 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play101021023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 101021023
		arg_95_1.duration_ = 6.9

		local var_95_0 = {
			ja = 4.266,
			ko = 3.3,
			zh = 3.866,
			en = 6.9
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
				arg_95_0:Play101021024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["10001_tpose"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect10001_tpose == nil then
				arg_95_1.var_.characterEffect10001_tpose = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.1

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect10001_tpose then
					arg_95_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect10001_tpose then
				arg_95_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_98_4 = 0

			if var_98_4 < arg_95_1.time_ and arg_95_1.time_ <= var_98_4 + arg_98_0 then
				arg_95_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action2_1")
			end

			local var_98_5 = 0

			if var_98_5 < arg_95_1.time_ and arg_95_1.time_ <= var_98_5 + arg_98_0 then
				arg_95_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_98_6 = 0
			local var_98_7 = 0.425

			if var_98_6 < arg_95_1.time_ and arg_95_1.time_ <= var_98_6 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_8 = arg_95_1:FormatText(StoryNameCfg[24].name)

				arg_95_1.leftNameTxt_.text = var_98_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_9 = arg_95_1:GetWordFromCfg(101021023)
				local var_98_10 = arg_95_1:FormatText(var_98_9.content)

				arg_95_1.text_.text = var_98_10

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_11 = 17
				local var_98_12 = utf8.len(var_98_10)
				local var_98_13 = var_98_11 <= 0 and var_98_7 or var_98_7 * (var_98_12 / var_98_11)

				if var_98_13 > 0 and var_98_7 < var_98_13 then
					arg_95_1.talkMaxDuration = var_98_13

					if var_98_13 + var_98_6 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_13 + var_98_6
					end
				end

				arg_95_1.text_.text = var_98_10
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021023", "story_v_out_101021.awb") ~= 0 then
					local var_98_14 = manager.audio:GetVoiceLength("story_v_out_101021", "101021023", "story_v_out_101021.awb") / 1000

					if var_98_14 + var_98_6 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_14 + var_98_6
					end

					if var_98_9.prefab_name ~= "" and arg_95_1.actors_[var_98_9.prefab_name] ~= nil then
						local var_98_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_9.prefab_name].transform, "story_v_out_101021", "101021023", "story_v_out_101021.awb")

						arg_95_1:RecordAudio("101021023", var_98_15)
						arg_95_1:RecordAudio("101021023", var_98_15)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_101021", "101021023", "story_v_out_101021.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_101021", "101021023", "story_v_out_101021.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_16 = math.max(var_98_7, arg_95_1.talkMaxDuration)

			if var_98_6 <= arg_95_1.time_ and arg_95_1.time_ < var_98_6 + var_98_16 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_6) / var_98_16

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_6 + var_98_16 and arg_95_1.time_ < var_98_6 + var_98_16 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play101021024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 101021024
		arg_99_1.duration_ = 11.9

		local var_99_0 = {
			ja = 11.9,
			ko = 9.9,
			zh = 9.6,
			en = 11.666
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
				arg_99_0:Play101021025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["10001_tpose"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect10001_tpose == nil then
				arg_99_1.var_.characterEffect10001_tpose = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.1

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect10001_tpose then
					local var_102_4 = Mathf.Lerp(0, 0.5, var_102_3)

					arg_99_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_99_1.var_.characterEffect10001_tpose.fillRatio = var_102_4
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect10001_tpose then
				local var_102_5 = 0.5

				arg_99_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_99_1.var_.characterEffect10001_tpose.fillRatio = var_102_5
			end

			local var_102_6 = 0
			local var_102_7 = 1.425

			if var_102_6 < arg_99_1.time_ and arg_99_1.time_ <= var_102_6 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_8 = arg_99_1:FormatText(StoryNameCfg[25].name)

				arg_99_1.leftNameTxt_.text = var_102_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_9 = arg_99_1:GetWordFromCfg(101021024)
				local var_102_10 = arg_99_1:FormatText(var_102_9.content)

				arg_99_1.text_.text = var_102_10

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_11 = 57
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

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021024", "story_v_out_101021.awb") ~= 0 then
					local var_102_14 = manager.audio:GetVoiceLength("story_v_out_101021", "101021024", "story_v_out_101021.awb") / 1000

					if var_102_14 + var_102_6 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_14 + var_102_6
					end

					if var_102_9.prefab_name ~= "" and arg_99_1.actors_[var_102_9.prefab_name] ~= nil then
						local var_102_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_9.prefab_name].transform, "story_v_out_101021", "101021024", "story_v_out_101021.awb")

						arg_99_1:RecordAudio("101021024", var_102_15)
						arg_99_1:RecordAudio("101021024", var_102_15)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_101021", "101021024", "story_v_out_101021.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_101021", "101021024", "story_v_out_101021.awb")
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
	Play101021025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 101021025
		arg_103_1.duration_ = 3.666

		local var_103_0 = {
			ja = 3.666,
			ko = 2,
			zh = 1.999999999998,
			en = 2.433
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
				arg_103_0:Play101021026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["10001_tpose"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect10001_tpose == nil then
				arg_103_1.var_.characterEffect10001_tpose = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.1

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect10001_tpose then
					arg_103_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect10001_tpose then
				arg_103_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_106_4 = 0

			if var_106_4 < arg_103_1.time_ and arg_103_1.time_ <= var_106_4 + arg_106_0 then
				arg_103_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001actionlink/10001action424")
			end

			local var_106_5 = 0

			if var_106_5 < arg_103_1.time_ and arg_103_1.time_ <= var_106_5 + arg_106_0 then
				arg_103_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_106_6 = 0
			local var_106_7 = 0.125

			if var_106_6 < arg_103_1.time_ and arg_103_1.time_ <= var_106_6 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_8 = arg_103_1:FormatText(StoryNameCfg[24].name)

				arg_103_1.leftNameTxt_.text = var_106_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_9 = arg_103_1:GetWordFromCfg(101021025)
				local var_106_10 = arg_103_1:FormatText(var_106_9.content)

				arg_103_1.text_.text = var_106_10

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_11 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021025", "story_v_out_101021.awb") ~= 0 then
					local var_106_14 = manager.audio:GetVoiceLength("story_v_out_101021", "101021025", "story_v_out_101021.awb") / 1000

					if var_106_14 + var_106_6 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_14 + var_106_6
					end

					if var_106_9.prefab_name ~= "" and arg_103_1.actors_[var_106_9.prefab_name] ~= nil then
						local var_106_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_9.prefab_name].transform, "story_v_out_101021", "101021025", "story_v_out_101021.awb")

						arg_103_1:RecordAudio("101021025", var_106_15)
						arg_103_1:RecordAudio("101021025", var_106_15)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_101021", "101021025", "story_v_out_101021.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_101021", "101021025", "story_v_out_101021.awb")
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
	Play101021026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 101021026
		arg_107_1.duration_ = 9.966

		local var_107_0 = {
			ja = 9.966,
			ko = 4.5,
			zh = 6.3,
			en = 9.233
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
				arg_107_0:Play101021027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["10001_tpose"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect10001_tpose == nil then
				arg_107_1.var_.characterEffect10001_tpose = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.1

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect10001_tpose then
					local var_110_4 = Mathf.Lerp(0, 0.5, var_110_3)

					arg_107_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_107_1.var_.characterEffect10001_tpose.fillRatio = var_110_4
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect10001_tpose then
				local var_110_5 = 0.5

				arg_107_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_107_1.var_.characterEffect10001_tpose.fillRatio = var_110_5
			end

			local var_110_6 = 0
			local var_110_7 = 0.975

			if var_110_6 < arg_107_1.time_ and arg_107_1.time_ <= var_110_6 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_8 = arg_107_1:FormatText(StoryNameCfg[26].name)

				arg_107_1.leftNameTxt_.text = var_110_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_9 = arg_107_1:GetWordFromCfg(101021026)
				local var_110_10 = arg_107_1:FormatText(var_110_9.content)

				arg_107_1.text_.text = var_110_10

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_11 = 40
				local var_110_12 = utf8.len(var_110_10)
				local var_110_13 = var_110_11 <= 0 and var_110_7 or var_110_7 * (var_110_12 / var_110_11)

				if var_110_13 > 0 and var_110_7 < var_110_13 then
					arg_107_1.talkMaxDuration = var_110_13

					if var_110_13 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_13 + var_110_6
					end
				end

				arg_107_1.text_.text = var_110_10
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021026", "story_v_out_101021.awb") ~= 0 then
					local var_110_14 = manager.audio:GetVoiceLength("story_v_out_101021", "101021026", "story_v_out_101021.awb") / 1000

					if var_110_14 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_14 + var_110_6
					end

					if var_110_9.prefab_name ~= "" and arg_107_1.actors_[var_110_9.prefab_name] ~= nil then
						local var_110_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_9.prefab_name].transform, "story_v_out_101021", "101021026", "story_v_out_101021.awb")

						arg_107_1:RecordAudio("101021026", var_110_15)
						arg_107_1:RecordAudio("101021026", var_110_15)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_101021", "101021026", "story_v_out_101021.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_101021", "101021026", "story_v_out_101021.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_16 = math.max(var_110_7, arg_107_1.talkMaxDuration)

			if var_110_6 <= arg_107_1.time_ and arg_107_1.time_ < var_110_6 + var_110_16 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_6) / var_110_16

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_6 + var_110_16 and arg_107_1.time_ < var_110_6 + var_110_16 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play101021027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 101021027
		arg_111_1.duration_ = 16.833

		local var_111_0 = {
			ja = 14.7,
			ko = 12.1,
			zh = 12.333,
			en = 16.833
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
				arg_111_0:Play101021028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["10001_tpose"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect10001_tpose == nil then
				arg_111_1.var_.characterEffect10001_tpose = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.1

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect10001_tpose then
					arg_111_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect10001_tpose then
				arg_111_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_114_4 = 0

			if var_114_4 < arg_111_1.time_ and arg_111_1.time_ <= var_114_4 + arg_114_0 then
				arg_111_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action4_2")
			end

			local var_114_5 = 0

			if var_114_5 < arg_111_1.time_ and arg_111_1.time_ <= var_114_5 + arg_114_0 then
				arg_111_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_114_6 = 0
			local var_114_7 = 1.525

			if var_114_6 < arg_111_1.time_ and arg_111_1.time_ <= var_114_6 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_8 = arg_111_1:FormatText(StoryNameCfg[24].name)

				arg_111_1.leftNameTxt_.text = var_114_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_9 = arg_111_1:GetWordFromCfg(101021027)
				local var_114_10 = arg_111_1:FormatText(var_114_9.content)

				arg_111_1.text_.text = var_114_10

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_11 = 61
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

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021027", "story_v_out_101021.awb") ~= 0 then
					local var_114_14 = manager.audio:GetVoiceLength("story_v_out_101021", "101021027", "story_v_out_101021.awb") / 1000

					if var_114_14 + var_114_6 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_14 + var_114_6
					end

					if var_114_9.prefab_name ~= "" and arg_111_1.actors_[var_114_9.prefab_name] ~= nil then
						local var_114_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_9.prefab_name].transform, "story_v_out_101021", "101021027", "story_v_out_101021.awb")

						arg_111_1:RecordAudio("101021027", var_114_15)
						arg_111_1:RecordAudio("101021027", var_114_15)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_101021", "101021027", "story_v_out_101021.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_101021", "101021027", "story_v_out_101021.awb")
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
	Play101021028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 101021028
		arg_115_1.duration_ = 6.866

		local var_115_0 = {
			ja = 6.866,
			ko = 4.033,
			zh = 4.533,
			en = 6.466
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
				arg_115_0:Play101021029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["10001_tpose"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.characterEffect10001_tpose == nil then
				arg_115_1.var_.characterEffect10001_tpose = var_118_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_2 = 0.1

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.characterEffect10001_tpose then
					local var_118_4 = Mathf.Lerp(0, 0.5, var_118_3)

					arg_115_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_115_1.var_.characterEffect10001_tpose.fillRatio = var_118_4
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect10001_tpose then
				local var_118_5 = 0.5

				arg_115_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_115_1.var_.characterEffect10001_tpose.fillRatio = var_118_5
			end

			local var_118_6 = 0
			local var_118_7 = 0.625

			if var_118_6 < arg_115_1.time_ and arg_115_1.time_ <= var_118_6 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_8 = arg_115_1:FormatText(StoryNameCfg[27].name)

				arg_115_1.leftNameTxt_.text = var_118_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_9 = arg_115_1:GetWordFromCfg(101021028)
				local var_118_10 = arg_115_1:FormatText(var_118_9.content)

				arg_115_1.text_.text = var_118_10

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_11 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021028", "story_v_out_101021.awb") ~= 0 then
					local var_118_14 = manager.audio:GetVoiceLength("story_v_out_101021", "101021028", "story_v_out_101021.awb") / 1000

					if var_118_14 + var_118_6 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_14 + var_118_6
					end

					if var_118_9.prefab_name ~= "" and arg_115_1.actors_[var_118_9.prefab_name] ~= nil then
						local var_118_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_9.prefab_name].transform, "story_v_out_101021", "101021028", "story_v_out_101021.awb")

						arg_115_1:RecordAudio("101021028", var_118_15)
						arg_115_1:RecordAudio("101021028", var_118_15)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_101021", "101021028", "story_v_out_101021.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_101021", "101021028", "story_v_out_101021.awb")
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
	Play101021029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 101021029
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play101021030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 1

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				local var_122_2 = "play"
				local var_122_3 = "effect"

				arg_119_1:AudioAction(var_122_2, var_122_3, "se_story_ui", "se_story_env_highcut_open", "")
			end

			local var_122_4 = arg_119_1.actors_["10001_tpose"].transform
			local var_122_5 = 0

			if var_122_5 < arg_119_1.time_ and arg_119_1.time_ <= var_122_5 + arg_122_0 then
				arg_119_1.var_.moveOldPos10001_tpose = var_122_4.localPosition
			end

			local var_122_6 = 0.001

			if var_122_5 <= arg_119_1.time_ and arg_119_1.time_ < var_122_5 + var_122_6 then
				local var_122_7 = (arg_119_1.time_ - var_122_5) / var_122_6
				local var_122_8 = Vector3.New(0, 100, 0)

				var_122_4.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos10001_tpose, var_122_8, var_122_7)

				local var_122_9 = manager.ui.mainCamera.transform.position - var_122_4.position

				var_122_4.forward = Vector3.New(var_122_9.x, var_122_9.y, var_122_9.z)

				local var_122_10 = var_122_4.localEulerAngles

				var_122_10.z = 0
				var_122_10.x = 0
				var_122_4.localEulerAngles = var_122_10
			end

			if arg_119_1.time_ >= var_122_5 + var_122_6 and arg_119_1.time_ < var_122_5 + var_122_6 + arg_122_0 then
				var_122_4.localPosition = Vector3.New(0, 100, 0)

				local var_122_11 = manager.ui.mainCamera.transform.position - var_122_4.position

				var_122_4.forward = Vector3.New(var_122_11.x, var_122_11.y, var_122_11.z)

				local var_122_12 = var_122_4.localEulerAngles

				var_122_12.z = 0
				var_122_12.x = 0
				var_122_4.localEulerAngles = var_122_12
			end

			local var_122_13 = 0
			local var_122_14 = 1.3

			if var_122_13 < arg_119_1.time_ and arg_119_1.time_ <= var_122_13 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0

				arg_119_1.dialog_:SetActive(true)

				local var_122_15 = LeanTween.value(arg_119_1.dialog_, 0, 1, 0.3)

				var_122_15:setOnUpdate(LuaHelper.FloatAction(function(arg_123_0)
					arg_119_1.dialogCg_.alpha = arg_123_0
				end))
				var_122_15:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_119_1.dialog_)
					var_122_15:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_119_1.duration_ = arg_119_1.duration_ + 0.3

				SetActive(arg_119_1.leftNameGo_, false)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_16 = arg_119_1:GetWordFromCfg(101021029)
				local var_122_17 = arg_119_1:FormatText(var_122_16.content)

				arg_119_1.text_.text = var_122_17

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_18 = 52
				local var_122_19 = utf8.len(var_122_17)
				local var_122_20 = var_122_18 <= 0 and var_122_14 or var_122_14 * (var_122_19 / var_122_18)

				if var_122_20 > 0 and var_122_14 < var_122_20 then
					arg_119_1.talkMaxDuration = var_122_20
					var_122_13 = var_122_13 + 0.3

					if var_122_20 + var_122_13 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_20 + var_122_13
					end
				end

				arg_119_1.text_.text = var_122_17
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_21 = var_122_13 + 0.3
			local var_122_22 = math.max(var_122_14, arg_119_1.talkMaxDuration)

			if var_122_21 <= arg_119_1.time_ and arg_119_1.time_ < var_122_21 + var_122_22 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_21) / var_122_22

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_21 + var_122_22 and arg_119_1.time_ < var_122_21 + var_122_22 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play101021030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 101021030
		arg_125_1.duration_ = 15.7

		local var_125_0 = {
			ja = 15.7,
			ko = 10.533,
			zh = 8.9,
			en = 10.666
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
				arg_125_0:Play101021031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = "1148ui_story"

			if arg_125_1.actors_[var_128_0] == nil then
				local var_128_1 = Object.Instantiate(Asset.Load("Char/" .. var_128_0), arg_125_1.stage_.transform)

				var_128_1.name = var_128_0
				var_128_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_125_1.actors_[var_128_0] = var_128_1

				local var_128_2 = var_128_1:GetComponentInChildren(typeof(CharacterEffect))

				var_128_2.enabled = true

				local var_128_3 = GameObjectTools.GetOrAddComponent(var_128_1, typeof(DynamicBoneHelper))

				if var_128_3 then
					var_128_3:EnableDynamicBone(false)
				end

				arg_125_1:ShowWeapon(var_128_2.transform, false)

				arg_125_1.var_[var_128_0 .. "Animator"] = var_128_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_125_1.var_[var_128_0 .. "Animator"].applyRootMotion = true
				arg_125_1.var_[var_128_0 .. "LipSync"] = var_128_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_128_4 = arg_125_1.actors_["1148ui_story"]
			local var_128_5 = 0

			if var_128_5 < arg_125_1.time_ and arg_125_1.time_ <= var_128_5 + arg_128_0 and arg_125_1.var_.characterEffect1148ui_story == nil then
				arg_125_1.var_.characterEffect1148ui_story = var_128_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_6 = 0.1

			if var_128_5 <= arg_125_1.time_ and arg_125_1.time_ < var_128_5 + var_128_6 then
				local var_128_7 = (arg_125_1.time_ - var_128_5) / var_128_6

				if arg_125_1.var_.characterEffect1148ui_story then
					arg_125_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_5 + var_128_6 and arg_125_1.time_ < var_128_5 + var_128_6 + arg_128_0 and arg_125_1.var_.characterEffect1148ui_story then
				arg_125_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_128_8 = arg_125_1.actors_["1148ui_story"].transform
			local var_128_9 = 0

			if var_128_9 < arg_125_1.time_ and arg_125_1.time_ <= var_128_9 + arg_128_0 then
				arg_125_1.var_.moveOldPos1148ui_story = var_128_8.localPosition
			end

			local var_128_10 = 0.001

			if var_128_9 <= arg_125_1.time_ and arg_125_1.time_ < var_128_9 + var_128_10 then
				local var_128_11 = (arg_125_1.time_ - var_128_9) / var_128_10
				local var_128_12 = Vector3.New(-0.7, -0.8, -6.2)

				var_128_8.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1148ui_story, var_128_12, var_128_11)

				local var_128_13 = manager.ui.mainCamera.transform.position - var_128_8.position

				var_128_8.forward = Vector3.New(var_128_13.x, var_128_13.y, var_128_13.z)

				local var_128_14 = var_128_8.localEulerAngles

				var_128_14.z = 0
				var_128_14.x = 0
				var_128_8.localEulerAngles = var_128_14
			end

			if arg_125_1.time_ >= var_128_9 + var_128_10 and arg_125_1.time_ < var_128_9 + var_128_10 + arg_128_0 then
				var_128_8.localPosition = Vector3.New(-0.7, -0.8, -6.2)

				local var_128_15 = manager.ui.mainCamera.transform.position - var_128_8.position

				var_128_8.forward = Vector3.New(var_128_15.x, var_128_15.y, var_128_15.z)

				local var_128_16 = var_128_8.localEulerAngles

				var_128_16.z = 0
				var_128_16.x = 0
				var_128_8.localEulerAngles = var_128_16
			end

			local var_128_17 = 0

			if var_128_17 < arg_125_1.time_ and arg_125_1.time_ <= var_128_17 + arg_128_0 then
				arg_125_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action5_1")
			end

			local var_128_18 = 0

			if var_128_18 < arg_125_1.time_ and arg_125_1.time_ <= var_128_18 + arg_128_0 then
				arg_125_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_128_19 = 0
			local var_128_20 = 1.175

			if var_128_19 < arg_125_1.time_ and arg_125_1.time_ <= var_128_19 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_21 = arg_125_1:FormatText(StoryNameCfg[8].name)

				arg_125_1.leftNameTxt_.text = var_128_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_22 = arg_125_1:GetWordFromCfg(101021030)
				local var_128_23 = arg_125_1:FormatText(var_128_22.content)

				arg_125_1.text_.text = var_128_23

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_24 = 47
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

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021030", "story_v_out_101021.awb") ~= 0 then
					local var_128_27 = manager.audio:GetVoiceLength("story_v_out_101021", "101021030", "story_v_out_101021.awb") / 1000

					if var_128_27 + var_128_19 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_27 + var_128_19
					end

					if var_128_22.prefab_name ~= "" and arg_125_1.actors_[var_128_22.prefab_name] ~= nil then
						local var_128_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_22.prefab_name].transform, "story_v_out_101021", "101021030", "story_v_out_101021.awb")

						arg_125_1:RecordAudio("101021030", var_128_28)
						arg_125_1:RecordAudio("101021030", var_128_28)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_101021", "101021030", "story_v_out_101021.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_101021", "101021030", "story_v_out_101021.awb")
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
	Play101021031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 101021031
		arg_129_1.duration_ = 9.166

		local var_129_0 = {
			ja = 9.166,
			ko = 5.8,
			zh = 7.433,
			en = 6.3
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
				arg_129_0:Play101021032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = "1059ui_story"

			if arg_129_1.actors_[var_132_0] == nil then
				local var_132_1 = Object.Instantiate(Asset.Load("Char/" .. var_132_0), arg_129_1.stage_.transform)

				var_132_1.name = var_132_0
				var_132_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_129_1.actors_[var_132_0] = var_132_1

				local var_132_2 = var_132_1:GetComponentInChildren(typeof(CharacterEffect))

				var_132_2.enabled = true

				local var_132_3 = GameObjectTools.GetOrAddComponent(var_132_1, typeof(DynamicBoneHelper))

				if var_132_3 then
					var_132_3:EnableDynamicBone(false)
				end

				arg_129_1:ShowWeapon(var_132_2.transform, false)

				arg_129_1.var_[var_132_0 .. "Animator"] = var_132_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_129_1.var_[var_132_0 .. "Animator"].applyRootMotion = true
				arg_129_1.var_[var_132_0 .. "LipSync"] = var_132_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_132_4 = arg_129_1.actors_["1059ui_story"]
			local var_132_5 = 0

			if var_132_5 < arg_129_1.time_ and arg_129_1.time_ <= var_132_5 + arg_132_0 and arg_129_1.var_.characterEffect1059ui_story == nil then
				arg_129_1.var_.characterEffect1059ui_story = var_132_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_6 = 0.1

			if var_132_5 <= arg_129_1.time_ and arg_129_1.time_ < var_132_5 + var_132_6 then
				local var_132_7 = (arg_129_1.time_ - var_132_5) / var_132_6

				if arg_129_1.var_.characterEffect1059ui_story then
					arg_129_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_5 + var_132_6 and arg_129_1.time_ < var_132_5 + var_132_6 + arg_132_0 and arg_129_1.var_.characterEffect1059ui_story then
				arg_129_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_132_8 = arg_129_1.actors_["1148ui_story"]
			local var_132_9 = 0

			if var_132_9 < arg_129_1.time_ and arg_129_1.time_ <= var_132_9 + arg_132_0 and arg_129_1.var_.characterEffect1148ui_story == nil then
				arg_129_1.var_.characterEffect1148ui_story = var_132_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_10 = 0.1

			if var_132_9 <= arg_129_1.time_ and arg_129_1.time_ < var_132_9 + var_132_10 then
				local var_132_11 = (arg_129_1.time_ - var_132_9) / var_132_10

				if arg_129_1.var_.characterEffect1148ui_story then
					local var_132_12 = Mathf.Lerp(0, 0.5, var_132_11)

					arg_129_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1148ui_story.fillRatio = var_132_12
				end
			end

			if arg_129_1.time_ >= var_132_9 + var_132_10 and arg_129_1.time_ < var_132_9 + var_132_10 + arg_132_0 and arg_129_1.var_.characterEffect1148ui_story then
				local var_132_13 = 0.5

				arg_129_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1148ui_story.fillRatio = var_132_13
			end

			local var_132_14 = arg_129_1.actors_["1059ui_story"].transform
			local var_132_15 = 0

			if var_132_15 < arg_129_1.time_ and arg_129_1.time_ <= var_132_15 + arg_132_0 then
				arg_129_1.var_.moveOldPos1059ui_story = var_132_14.localPosition
			end

			local var_132_16 = 0.001

			if var_132_15 <= arg_129_1.time_ and arg_129_1.time_ < var_132_15 + var_132_16 then
				local var_132_17 = (arg_129_1.time_ - var_132_15) / var_132_16
				local var_132_18 = Vector3.New(0.7, -1.05, -6)

				var_132_14.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1059ui_story, var_132_18, var_132_17)

				local var_132_19 = manager.ui.mainCamera.transform.position - var_132_14.position

				var_132_14.forward = Vector3.New(var_132_19.x, var_132_19.y, var_132_19.z)

				local var_132_20 = var_132_14.localEulerAngles

				var_132_20.z = 0
				var_132_20.x = 0
				var_132_14.localEulerAngles = var_132_20
			end

			if arg_129_1.time_ >= var_132_15 + var_132_16 and arg_129_1.time_ < var_132_15 + var_132_16 + arg_132_0 then
				var_132_14.localPosition = Vector3.New(0.7, -1.05, -6)

				local var_132_21 = manager.ui.mainCamera.transform.position - var_132_14.position

				var_132_14.forward = Vector3.New(var_132_21.x, var_132_21.y, var_132_21.z)

				local var_132_22 = var_132_14.localEulerAngles

				var_132_22.z = 0
				var_132_22.x = 0
				var_132_14.localEulerAngles = var_132_22
			end

			local var_132_23 = 0

			if var_132_23 < arg_129_1.time_ and arg_129_1.time_ <= var_132_23 + arg_132_0 then
				arg_129_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action3_1")
			end

			local var_132_24 = 0

			if var_132_24 < arg_129_1.time_ and arg_129_1.time_ <= var_132_24 + arg_132_0 then
				arg_129_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_132_25 = 0
			local var_132_26 = 0.675

			if var_132_25 < arg_129_1.time_ and arg_129_1.time_ <= var_132_25 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_27 = arg_129_1:FormatText(StoryNameCfg[28].name)

				arg_129_1.leftNameTxt_.text = var_132_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_28 = arg_129_1:GetWordFromCfg(101021031)
				local var_132_29 = arg_129_1:FormatText(var_132_28.content)

				arg_129_1.text_.text = var_132_29

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_30 = 27
				local var_132_31 = utf8.len(var_132_29)
				local var_132_32 = var_132_30 <= 0 and var_132_26 or var_132_26 * (var_132_31 / var_132_30)

				if var_132_32 > 0 and var_132_26 < var_132_32 then
					arg_129_1.talkMaxDuration = var_132_32

					if var_132_32 + var_132_25 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_32 + var_132_25
					end
				end

				arg_129_1.text_.text = var_132_29
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021031", "story_v_out_101021.awb") ~= 0 then
					local var_132_33 = manager.audio:GetVoiceLength("story_v_out_101021", "101021031", "story_v_out_101021.awb") / 1000

					if var_132_33 + var_132_25 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_33 + var_132_25
					end

					if var_132_28.prefab_name ~= "" and arg_129_1.actors_[var_132_28.prefab_name] ~= nil then
						local var_132_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_28.prefab_name].transform, "story_v_out_101021", "101021031", "story_v_out_101021.awb")

						arg_129_1:RecordAudio("101021031", var_132_34)
						arg_129_1:RecordAudio("101021031", var_132_34)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_101021", "101021031", "story_v_out_101021.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_101021", "101021031", "story_v_out_101021.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_35 = math.max(var_132_26, arg_129_1.talkMaxDuration)

			if var_132_25 <= arg_129_1.time_ and arg_129_1.time_ < var_132_25 + var_132_35 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_25) / var_132_35

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_25 + var_132_35 and arg_129_1.time_ < var_132_25 + var_132_35 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play101021032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 101021032
		arg_133_1.duration_ = 6.433

		local var_133_0 = {
			ja = 6.433,
			ko = 5.633,
			zh = 3.7,
			en = 2.433
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
				arg_133_0:Play101021033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1148ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect1148ui_story == nil then
				arg_133_1.var_.characterEffect1148ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.1

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1148ui_story then
					arg_133_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect1148ui_story then
				arg_133_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_136_4 = arg_133_1.actors_["1059ui_story"]
			local var_136_5 = 0

			if var_136_5 < arg_133_1.time_ and arg_133_1.time_ <= var_136_5 + arg_136_0 and arg_133_1.var_.characterEffect1059ui_story == nil then
				arg_133_1.var_.characterEffect1059ui_story = var_136_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_6 = 0.1

			if var_136_5 <= arg_133_1.time_ and arg_133_1.time_ < var_136_5 + var_136_6 then
				local var_136_7 = (arg_133_1.time_ - var_136_5) / var_136_6

				if arg_133_1.var_.characterEffect1059ui_story then
					local var_136_8 = Mathf.Lerp(0, 0.5, var_136_7)

					arg_133_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_133_1.var_.characterEffect1059ui_story.fillRatio = var_136_8
				end
			end

			if arg_133_1.time_ >= var_136_5 + var_136_6 and arg_133_1.time_ < var_136_5 + var_136_6 + arg_136_0 and arg_133_1.var_.characterEffect1059ui_story then
				local var_136_9 = 0.5

				arg_133_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_133_1.var_.characterEffect1059ui_story.fillRatio = var_136_9
			end

			local var_136_10 = 0

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 then
				arg_133_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action453")
			end

			local var_136_11 = 0

			if var_136_11 < arg_133_1.time_ and arg_133_1.time_ <= var_136_11 + arg_136_0 then
				arg_133_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_136_12 = 0
			local var_136_13 = 0.35

			if var_136_12 < arg_133_1.time_ and arg_133_1.time_ <= var_136_12 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_14 = arg_133_1:FormatText(StoryNameCfg[8].name)

				arg_133_1.leftNameTxt_.text = var_136_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_15 = arg_133_1:GetWordFromCfg(101021032)
				local var_136_16 = arg_133_1:FormatText(var_136_15.content)

				arg_133_1.text_.text = var_136_16

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_17 = 14
				local var_136_18 = utf8.len(var_136_16)
				local var_136_19 = var_136_17 <= 0 and var_136_13 or var_136_13 * (var_136_18 / var_136_17)

				if var_136_19 > 0 and var_136_13 < var_136_19 then
					arg_133_1.talkMaxDuration = var_136_19

					if var_136_19 + var_136_12 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_19 + var_136_12
					end
				end

				arg_133_1.text_.text = var_136_16
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021032", "story_v_out_101021.awb") ~= 0 then
					local var_136_20 = manager.audio:GetVoiceLength("story_v_out_101021", "101021032", "story_v_out_101021.awb") / 1000

					if var_136_20 + var_136_12 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_20 + var_136_12
					end

					if var_136_15.prefab_name ~= "" and arg_133_1.actors_[var_136_15.prefab_name] ~= nil then
						local var_136_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_15.prefab_name].transform, "story_v_out_101021", "101021032", "story_v_out_101021.awb")

						arg_133_1:RecordAudio("101021032", var_136_21)
						arg_133_1:RecordAudio("101021032", var_136_21)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_101021", "101021032", "story_v_out_101021.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_101021", "101021032", "story_v_out_101021.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_22 = math.max(var_136_13, arg_133_1.talkMaxDuration)

			if var_136_12 <= arg_133_1.time_ and arg_133_1.time_ < var_136_12 + var_136_22 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_12) / var_136_22

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_12 + var_136_22 and arg_133_1.time_ < var_136_12 + var_136_22 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play101021033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 101021033
		arg_137_1.duration_ = 6.7

		local var_137_0 = {
			ja = 6.7,
			ko = 3.3,
			zh = 3.266,
			en = 2.9
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
				arg_137_0:Play101021034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1059ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect1059ui_story == nil then
				arg_137_1.var_.characterEffect1059ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.1

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect1059ui_story then
					arg_137_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect1059ui_story then
				arg_137_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_140_4 = arg_137_1.actors_["1148ui_story"]
			local var_140_5 = 0

			if var_140_5 < arg_137_1.time_ and arg_137_1.time_ <= var_140_5 + arg_140_0 and arg_137_1.var_.characterEffect1148ui_story == nil then
				arg_137_1.var_.characterEffect1148ui_story = var_140_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_6 = 0.1

			if var_140_5 <= arg_137_1.time_ and arg_137_1.time_ < var_140_5 + var_140_6 then
				local var_140_7 = (arg_137_1.time_ - var_140_5) / var_140_6

				if arg_137_1.var_.characterEffect1148ui_story then
					local var_140_8 = Mathf.Lerp(0, 0.5, var_140_7)

					arg_137_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1148ui_story.fillRatio = var_140_8
				end
			end

			if arg_137_1.time_ >= var_140_5 + var_140_6 and arg_137_1.time_ < var_140_5 + var_140_6 + arg_140_0 and arg_137_1.var_.characterEffect1148ui_story then
				local var_140_9 = 0.5

				arg_137_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1148ui_story.fillRatio = var_140_9
			end

			local var_140_10 = 0

			if var_140_10 < arg_137_1.time_ and arg_137_1.time_ <= var_140_10 + arg_140_0 then
				arg_137_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059actionlink/1059action434")
			end

			local var_140_11 = 0

			if var_140_11 < arg_137_1.time_ and arg_137_1.time_ <= var_140_11 + arg_140_0 then
				arg_137_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_140_12 = 0
			local var_140_13 = 0.425

			if var_140_12 < arg_137_1.time_ and arg_137_1.time_ <= var_140_12 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_14 = arg_137_1:FormatText(StoryNameCfg[28].name)

				arg_137_1.leftNameTxt_.text = var_140_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_15 = arg_137_1:GetWordFromCfg(101021033)
				local var_140_16 = arg_137_1:FormatText(var_140_15.content)

				arg_137_1.text_.text = var_140_16

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_17 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021033", "story_v_out_101021.awb") ~= 0 then
					local var_140_20 = manager.audio:GetVoiceLength("story_v_out_101021", "101021033", "story_v_out_101021.awb") / 1000

					if var_140_20 + var_140_12 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_20 + var_140_12
					end

					if var_140_15.prefab_name ~= "" and arg_137_1.actors_[var_140_15.prefab_name] ~= nil then
						local var_140_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_15.prefab_name].transform, "story_v_out_101021", "101021033", "story_v_out_101021.awb")

						arg_137_1:RecordAudio("101021033", var_140_21)
						arg_137_1:RecordAudio("101021033", var_140_21)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_101021", "101021033", "story_v_out_101021.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_101021", "101021033", "story_v_out_101021.awb")
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
	Play101021034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 101021034
		arg_141_1.duration_ = 9.166

		local var_141_0 = {
			ja = 8.4,
			ko = 9.166,
			zh = 6.133,
			en = 7.533
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
				arg_141_0:Play101021035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059actionlink/1059action447")
			end

			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_144_2 = 0
			local var_144_3 = 0.85

			if var_144_2 < arg_141_1.time_ and arg_141_1.time_ <= var_144_2 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_4 = arg_141_1:FormatText(StoryNameCfg[28].name)

				arg_141_1.leftNameTxt_.text = var_144_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_5 = arg_141_1:GetWordFromCfg(101021034)
				local var_144_6 = arg_141_1:FormatText(var_144_5.content)

				arg_141_1.text_.text = var_144_6

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_7 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021034", "story_v_out_101021.awb") ~= 0 then
					local var_144_10 = manager.audio:GetVoiceLength("story_v_out_101021", "101021034", "story_v_out_101021.awb") / 1000

					if var_144_10 + var_144_2 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_10 + var_144_2
					end

					if var_144_5.prefab_name ~= "" and arg_141_1.actors_[var_144_5.prefab_name] ~= nil then
						local var_144_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_5.prefab_name].transform, "story_v_out_101021", "101021034", "story_v_out_101021.awb")

						arg_141_1:RecordAudio("101021034", var_144_11)
						arg_141_1:RecordAudio("101021034", var_144_11)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_101021", "101021034", "story_v_out_101021.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_101021", "101021034", "story_v_out_101021.awb")
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
	Play101021035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 101021035
		arg_145_1.duration_ = 9.133

		local var_145_0 = {
			ja = 9.133,
			ko = 5.4,
			zh = 5.066,
			en = 6.833
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
				arg_145_0:Play101021036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1148ui_story"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.characterEffect1148ui_story == nil then
				arg_145_1.var_.characterEffect1148ui_story = var_148_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_2 = 0.1

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.characterEffect1148ui_story then
					arg_145_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and arg_145_1.var_.characterEffect1148ui_story then
				arg_145_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_148_4 = arg_145_1.actors_["1059ui_story"]
			local var_148_5 = 0

			if var_148_5 < arg_145_1.time_ and arg_145_1.time_ <= var_148_5 + arg_148_0 and arg_145_1.var_.characterEffect1059ui_story == nil then
				arg_145_1.var_.characterEffect1059ui_story = var_148_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_6 = 0.1

			if var_148_5 <= arg_145_1.time_ and arg_145_1.time_ < var_148_5 + var_148_6 then
				local var_148_7 = (arg_145_1.time_ - var_148_5) / var_148_6

				if arg_145_1.var_.characterEffect1059ui_story then
					local var_148_8 = Mathf.Lerp(0, 0.5, var_148_7)

					arg_145_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_145_1.var_.characterEffect1059ui_story.fillRatio = var_148_8
				end
			end

			if arg_145_1.time_ >= var_148_5 + var_148_6 and arg_145_1.time_ < var_148_5 + var_148_6 + arg_148_0 and arg_145_1.var_.characterEffect1059ui_story then
				local var_148_9 = 0.5

				arg_145_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_145_1.var_.characterEffect1059ui_story.fillRatio = var_148_9
			end

			local var_148_10 = 0

			if var_148_10 < arg_145_1.time_ and arg_145_1.time_ <= var_148_10 + arg_148_0 then
				arg_145_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action437")
			end

			local var_148_11 = 0

			if var_148_11 < arg_145_1.time_ and arg_145_1.time_ <= var_148_11 + arg_148_0 then
				arg_145_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_148_12 = 0
			local var_148_13 = 0.425

			if var_148_12 < arg_145_1.time_ and arg_145_1.time_ <= var_148_12 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_14 = arg_145_1:FormatText(StoryNameCfg[8].name)

				arg_145_1.leftNameTxt_.text = var_148_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_15 = arg_145_1:GetWordFromCfg(101021035)
				local var_148_16 = arg_145_1:FormatText(var_148_15.content)

				arg_145_1.text_.text = var_148_16

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_17 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021035", "story_v_out_101021.awb") ~= 0 then
					local var_148_20 = manager.audio:GetVoiceLength("story_v_out_101021", "101021035", "story_v_out_101021.awb") / 1000

					if var_148_20 + var_148_12 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_20 + var_148_12
					end

					if var_148_15.prefab_name ~= "" and arg_145_1.actors_[var_148_15.prefab_name] ~= nil then
						local var_148_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_15.prefab_name].transform, "story_v_out_101021", "101021035", "story_v_out_101021.awb")

						arg_145_1:RecordAudio("101021035", var_148_21)
						arg_145_1:RecordAudio("101021035", var_148_21)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_101021", "101021035", "story_v_out_101021.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_101021", "101021035", "story_v_out_101021.awb")
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
	Play101021036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 101021036
		arg_149_1.duration_ = 9.266

		local var_149_0 = {
			ja = 9.266,
			ko = 7.333,
			zh = 6.1,
			en = 5.1
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
				arg_149_0:Play101021037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1059ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect1059ui_story == nil then
				arg_149_1.var_.characterEffect1059ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.1

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect1059ui_story then
					arg_149_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect1059ui_story then
				arg_149_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_152_4 = arg_149_1.actors_["1148ui_story"]
			local var_152_5 = 0

			if var_152_5 < arg_149_1.time_ and arg_149_1.time_ <= var_152_5 + arg_152_0 and arg_149_1.var_.characterEffect1148ui_story == nil then
				arg_149_1.var_.characterEffect1148ui_story = var_152_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_6 = 0.1

			if var_152_5 <= arg_149_1.time_ and arg_149_1.time_ < var_152_5 + var_152_6 then
				local var_152_7 = (arg_149_1.time_ - var_152_5) / var_152_6

				if arg_149_1.var_.characterEffect1148ui_story then
					local var_152_8 = Mathf.Lerp(0, 0.5, var_152_7)

					arg_149_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_149_1.var_.characterEffect1148ui_story.fillRatio = var_152_8
				end
			end

			if arg_149_1.time_ >= var_152_5 + var_152_6 and arg_149_1.time_ < var_152_5 + var_152_6 + arg_152_0 and arg_149_1.var_.characterEffect1148ui_story then
				local var_152_9 = 0.5

				arg_149_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_149_1.var_.characterEffect1148ui_story.fillRatio = var_152_9
			end

			local var_152_10 = 0

			if var_152_10 < arg_149_1.time_ and arg_149_1.time_ <= var_152_10 + arg_152_0 then
				arg_149_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059actionlink/1059action476")
			end

			local var_152_11 = 0

			if var_152_11 < arg_149_1.time_ and arg_149_1.time_ <= var_152_11 + arg_152_0 then
				arg_149_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_152_12 = 0
			local var_152_13 = 0.65

			if var_152_12 < arg_149_1.time_ and arg_149_1.time_ <= var_152_12 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_14 = arg_149_1:FormatText(StoryNameCfg[28].name)

				arg_149_1.leftNameTxt_.text = var_152_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_15 = arg_149_1:GetWordFromCfg(101021036)
				local var_152_16 = arg_149_1:FormatText(var_152_15.content)

				arg_149_1.text_.text = var_152_16

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_17 = 26
				local var_152_18 = utf8.len(var_152_16)
				local var_152_19 = var_152_17 <= 0 and var_152_13 or var_152_13 * (var_152_18 / var_152_17)

				if var_152_19 > 0 and var_152_13 < var_152_19 then
					arg_149_1.talkMaxDuration = var_152_19

					if var_152_19 + var_152_12 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_19 + var_152_12
					end
				end

				arg_149_1.text_.text = var_152_16
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021036", "story_v_out_101021.awb") ~= 0 then
					local var_152_20 = manager.audio:GetVoiceLength("story_v_out_101021", "101021036", "story_v_out_101021.awb") / 1000

					if var_152_20 + var_152_12 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_20 + var_152_12
					end

					if var_152_15.prefab_name ~= "" and arg_149_1.actors_[var_152_15.prefab_name] ~= nil then
						local var_152_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_15.prefab_name].transform, "story_v_out_101021", "101021036", "story_v_out_101021.awb")

						arg_149_1:RecordAudio("101021036", var_152_21)
						arg_149_1:RecordAudio("101021036", var_152_21)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_101021", "101021036", "story_v_out_101021.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_101021", "101021036", "story_v_out_101021.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_22 = math.max(var_152_13, arg_149_1.talkMaxDuration)

			if var_152_12 <= arg_149_1.time_ and arg_149_1.time_ < var_152_12 + var_152_22 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_12) / var_152_22

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_12 + var_152_22 and arg_149_1.time_ < var_152_12 + var_152_22 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play101021037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 101021037
		arg_153_1.duration_ = 7.7

		local var_153_0 = {
			ja = 7.7,
			ko = 5.966,
			zh = 5.566,
			en = 5.4
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
				arg_153_0:Play101021038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 1

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				local var_156_2 = "play"
				local var_156_3 = "effect"

				arg_153_1:AudioAction(var_156_2, var_156_3, "se_story_ui", "se_story_env_highcut_close", "")
			end

			local var_156_4 = 0
			local var_156_5 = 1

			if var_156_4 < arg_153_1.time_ and arg_153_1.time_ <= var_156_4 + arg_156_0 then
				local var_156_6 = "play"
				local var_156_7 = "effect"

				arg_153_1:AudioAction(var_156_6, var_156_7, "se_story", "se_story_robot_long", "")
			end

			local var_156_8 = "2044_tpose"

			if arg_153_1.actors_[var_156_8] == nil then
				local var_156_9 = Object.Instantiate(Asset.Load("Char/" .. var_156_8), arg_153_1.stage_.transform)

				var_156_9.name = var_156_8
				var_156_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_153_1.actors_[var_156_8] = var_156_9

				local var_156_10 = var_156_9:GetComponentInChildren(typeof(CharacterEffect))

				var_156_10.enabled = true

				local var_156_11 = GameObjectTools.GetOrAddComponent(var_156_9, typeof(DynamicBoneHelper))

				if var_156_11 then
					var_156_11:EnableDynamicBone(false)
				end

				arg_153_1:ShowWeapon(var_156_10.transform, false)

				arg_153_1.var_[var_156_8 .. "Animator"] = var_156_10.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_153_1.var_[var_156_8 .. "Animator"].applyRootMotion = true
				arg_153_1.var_[var_156_8 .. "LipSync"] = var_156_10.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_156_12 = arg_153_1.actors_["2044_tpose"]
			local var_156_13 = 0

			if var_156_13 < arg_153_1.time_ and arg_153_1.time_ <= var_156_13 + arg_156_0 and arg_153_1.var_.characterEffect2044_tpose == nil then
				arg_153_1.var_.characterEffect2044_tpose = var_156_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_14 = 0.1

			if var_156_13 <= arg_153_1.time_ and arg_153_1.time_ < var_156_13 + var_156_14 then
				local var_156_15 = (arg_153_1.time_ - var_156_13) / var_156_14

				if arg_153_1.var_.characterEffect2044_tpose then
					arg_153_1.var_.characterEffect2044_tpose.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_13 + var_156_14 and arg_153_1.time_ < var_156_13 + var_156_14 + arg_156_0 and arg_153_1.var_.characterEffect2044_tpose then
				arg_153_1.var_.characterEffect2044_tpose.fillFlat = false
			end

			local var_156_16 = arg_153_1.actors_["1059ui_story"]
			local var_156_17 = 0

			if var_156_17 < arg_153_1.time_ and arg_153_1.time_ <= var_156_17 + arg_156_0 and arg_153_1.var_.characterEffect1059ui_story == nil then
				arg_153_1.var_.characterEffect1059ui_story = var_156_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_18 = 0.1

			if var_156_17 <= arg_153_1.time_ and arg_153_1.time_ < var_156_17 + var_156_18 then
				local var_156_19 = (arg_153_1.time_ - var_156_17) / var_156_18

				if arg_153_1.var_.characterEffect1059ui_story then
					local var_156_20 = Mathf.Lerp(0, 0.5, var_156_19)

					arg_153_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1059ui_story.fillRatio = var_156_20
				end
			end

			if arg_153_1.time_ >= var_156_17 + var_156_18 and arg_153_1.time_ < var_156_17 + var_156_18 + arg_156_0 and arg_153_1.var_.characterEffect1059ui_story then
				local var_156_21 = 0.5

				arg_153_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1059ui_story.fillRatio = var_156_21
			end

			local var_156_22 = arg_153_1.actors_["1059ui_story"].transform
			local var_156_23 = 0

			if var_156_23 < arg_153_1.time_ and arg_153_1.time_ <= var_156_23 + arg_156_0 then
				arg_153_1.var_.moveOldPos1059ui_story = var_156_22.localPosition
			end

			local var_156_24 = 0.001

			if var_156_23 <= arg_153_1.time_ and arg_153_1.time_ < var_156_23 + var_156_24 then
				local var_156_25 = (arg_153_1.time_ - var_156_23) / var_156_24
				local var_156_26 = Vector3.New(0, 100, 0)

				var_156_22.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1059ui_story, var_156_26, var_156_25)

				local var_156_27 = manager.ui.mainCamera.transform.position - var_156_22.position

				var_156_22.forward = Vector3.New(var_156_27.x, var_156_27.y, var_156_27.z)

				local var_156_28 = var_156_22.localEulerAngles

				var_156_28.z = 0
				var_156_28.x = 0
				var_156_22.localEulerAngles = var_156_28
			end

			if arg_153_1.time_ >= var_156_23 + var_156_24 and arg_153_1.time_ < var_156_23 + var_156_24 + arg_156_0 then
				var_156_22.localPosition = Vector3.New(0, 100, 0)

				local var_156_29 = manager.ui.mainCamera.transform.position - var_156_22.position

				var_156_22.forward = Vector3.New(var_156_29.x, var_156_29.y, var_156_29.z)

				local var_156_30 = var_156_22.localEulerAngles

				var_156_30.z = 0
				var_156_30.x = 0
				var_156_22.localEulerAngles = var_156_30
			end

			local var_156_31 = arg_153_1.actors_["1148ui_story"].transform
			local var_156_32 = 0

			if var_156_32 < arg_153_1.time_ and arg_153_1.time_ <= var_156_32 + arg_156_0 then
				arg_153_1.var_.moveOldPos1148ui_story = var_156_31.localPosition
			end

			local var_156_33 = 0.001

			if var_156_32 <= arg_153_1.time_ and arg_153_1.time_ < var_156_32 + var_156_33 then
				local var_156_34 = (arg_153_1.time_ - var_156_32) / var_156_33
				local var_156_35 = Vector3.New(0, 100, 0)

				var_156_31.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1148ui_story, var_156_35, var_156_34)

				local var_156_36 = manager.ui.mainCamera.transform.position - var_156_31.position

				var_156_31.forward = Vector3.New(var_156_36.x, var_156_36.y, var_156_36.z)

				local var_156_37 = var_156_31.localEulerAngles

				var_156_37.z = 0
				var_156_37.x = 0
				var_156_31.localEulerAngles = var_156_37
			end

			if arg_153_1.time_ >= var_156_32 + var_156_33 and arg_153_1.time_ < var_156_32 + var_156_33 + arg_156_0 then
				var_156_31.localPosition = Vector3.New(0, 100, 0)

				local var_156_38 = manager.ui.mainCamera.transform.position - var_156_31.position

				var_156_31.forward = Vector3.New(var_156_38.x, var_156_38.y, var_156_38.z)

				local var_156_39 = var_156_31.localEulerAngles

				var_156_39.z = 0
				var_156_39.x = 0
				var_156_31.localEulerAngles = var_156_39
			end

			local var_156_40 = arg_153_1.actors_["2044_tpose"].transform
			local var_156_41 = 0

			if var_156_41 < arg_153_1.time_ and arg_153_1.time_ <= var_156_41 + arg_156_0 then
				arg_153_1.var_.moveOldPos2044_tpose = var_156_40.localPosition
			end

			local var_156_42 = 0.001

			if var_156_41 <= arg_153_1.time_ and arg_153_1.time_ < var_156_41 + var_156_42 then
				local var_156_43 = (arg_153_1.time_ - var_156_41) / var_156_42
				local var_156_44 = Vector3.New(0, -1.15, -2.3)

				var_156_40.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos2044_tpose, var_156_44, var_156_43)

				local var_156_45 = manager.ui.mainCamera.transform.position - var_156_40.position

				var_156_40.forward = Vector3.New(var_156_45.x, var_156_45.y, var_156_45.z)

				local var_156_46 = var_156_40.localEulerAngles

				var_156_46.z = 0
				var_156_46.x = 0
				var_156_40.localEulerAngles = var_156_46
			end

			if arg_153_1.time_ >= var_156_41 + var_156_42 and arg_153_1.time_ < var_156_41 + var_156_42 + arg_156_0 then
				var_156_40.localPosition = Vector3.New(0, -1.15, -2.3)

				local var_156_47 = manager.ui.mainCamera.transform.position - var_156_40.position

				var_156_40.forward = Vector3.New(var_156_47.x, var_156_47.y, var_156_47.z)

				local var_156_48 = var_156_40.localEulerAngles

				var_156_48.z = 0
				var_156_48.x = 0
				var_156_40.localEulerAngles = var_156_48
			end

			local var_156_49 = 0

			if var_156_49 < arg_153_1.time_ and arg_153_1.time_ <= var_156_49 + arg_156_0 then
				arg_153_1:PlayTimeline("2044_tpose", "StoryTimeline/CharAction/story2044/story2044action/2044action1_1")
			end

			local var_156_50 = 0
			local var_156_51 = 0.6

			if var_156_50 < arg_153_1.time_ and arg_153_1.time_ <= var_156_50 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_52 = arg_153_1:FormatText(StoryNameCfg[29].name)

				arg_153_1.leftNameTxt_.text = var_156_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_53 = arg_153_1:GetWordFromCfg(101021037)
				local var_156_54 = arg_153_1:FormatText(var_156_53.content)

				arg_153_1.text_.text = var_156_54

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_55 = 23
				local var_156_56 = utf8.len(var_156_54)
				local var_156_57 = var_156_55 <= 0 and var_156_51 or var_156_51 * (var_156_56 / var_156_55)

				if var_156_57 > 0 and var_156_51 < var_156_57 then
					arg_153_1.talkMaxDuration = var_156_57

					if var_156_57 + var_156_50 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_57 + var_156_50
					end
				end

				arg_153_1.text_.text = var_156_54
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021037", "story_v_out_101021.awb") ~= 0 then
					local var_156_58 = manager.audio:GetVoiceLength("story_v_out_101021", "101021037", "story_v_out_101021.awb") / 1000

					if var_156_58 + var_156_50 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_58 + var_156_50
					end

					if var_156_53.prefab_name ~= "" and arg_153_1.actors_[var_156_53.prefab_name] ~= nil then
						local var_156_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_53.prefab_name].transform, "story_v_out_101021", "101021037", "story_v_out_101021.awb")

						arg_153_1:RecordAudio("101021037", var_156_59)
						arg_153_1:RecordAudio("101021037", var_156_59)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_101021", "101021037", "story_v_out_101021.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_101021", "101021037", "story_v_out_101021.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_60 = math.max(var_156_51, arg_153_1.talkMaxDuration)

			if var_156_50 <= arg_153_1.time_ and arg_153_1.time_ < var_156_50 + var_156_60 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_50) / var_156_60

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_50 + var_156_60 and arg_153_1.time_ < var_156_50 + var_156_60 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play101021038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 101021038
		arg_157_1.duration_ = 7.066

		local var_157_0 = {
			ja = 7.066,
			ko = 4.933,
			zh = 4.433,
			en = 5.1
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
				arg_157_0:Play101021039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["2044_tpose"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.characterEffect2044_tpose == nil then
				arg_157_1.var_.characterEffect2044_tpose = var_160_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_2 = 0.1

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.characterEffect2044_tpose then
					local var_160_4 = Mathf.Lerp(0, 0.5, var_160_3)

					arg_157_1.var_.characterEffect2044_tpose.fillFlat = true
					arg_157_1.var_.characterEffect2044_tpose.fillRatio = var_160_4
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.characterEffect2044_tpose then
				local var_160_5 = 0.5

				arg_157_1.var_.characterEffect2044_tpose.fillFlat = true
				arg_157_1.var_.characterEffect2044_tpose.fillRatio = var_160_5
			end

			local var_160_6 = 0
			local var_160_7 = 0.5

			if var_160_6 < arg_157_1.time_ and arg_157_1.time_ <= var_160_6 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_8 = arg_157_1:FormatText(StoryNameCfg[30].name)

				arg_157_1.leftNameTxt_.text = var_160_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_9 = arg_157_1:GetWordFromCfg(101021038)
				local var_160_10 = arg_157_1:FormatText(var_160_9.content)

				arg_157_1.text_.text = var_160_10

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_11 = 20
				local var_160_12 = utf8.len(var_160_10)
				local var_160_13 = var_160_11 <= 0 and var_160_7 or var_160_7 * (var_160_12 / var_160_11)

				if var_160_13 > 0 and var_160_7 < var_160_13 then
					arg_157_1.talkMaxDuration = var_160_13

					if var_160_13 + var_160_6 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_13 + var_160_6
					end
				end

				arg_157_1.text_.text = var_160_10
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021038", "story_v_out_101021.awb") ~= 0 then
					local var_160_14 = manager.audio:GetVoiceLength("story_v_out_101021", "101021038", "story_v_out_101021.awb") / 1000

					if var_160_14 + var_160_6 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_14 + var_160_6
					end

					if var_160_9.prefab_name ~= "" and arg_157_1.actors_[var_160_9.prefab_name] ~= nil then
						local var_160_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_9.prefab_name].transform, "story_v_out_101021", "101021038", "story_v_out_101021.awb")

						arg_157_1:RecordAudio("101021038", var_160_15)
						arg_157_1:RecordAudio("101021038", var_160_15)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_101021", "101021038", "story_v_out_101021.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_101021", "101021038", "story_v_out_101021.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_16 = math.max(var_160_7, arg_157_1.talkMaxDuration)

			if var_160_6 <= arg_157_1.time_ and arg_157_1.time_ < var_160_6 + var_160_16 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_6) / var_160_16

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_6 + var_160_16 and arg_157_1.time_ < var_160_6 + var_160_16 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play101021039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 101021039
		arg_161_1.duration_ = 3.2

		local var_161_0 = {
			ja = 1.999999999999,
			ko = 2.8,
			zh = 1.999999999999,
			en = 3.2
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
				arg_161_0:Play101021040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["10001_tpose"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and arg_161_1.var_.characterEffect10001_tpose == nil then
				arg_161_1.var_.characterEffect10001_tpose = var_164_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_2 = 0.1

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.characterEffect10001_tpose then
					arg_161_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and arg_161_1.var_.characterEffect10001_tpose then
				arg_161_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_164_4 = arg_161_1.actors_["2044_tpose"].transform
			local var_164_5 = 0

			if var_164_5 < arg_161_1.time_ and arg_161_1.time_ <= var_164_5 + arg_164_0 then
				arg_161_1.var_.moveOldPos2044_tpose = var_164_4.localPosition
			end

			local var_164_6 = 0.001

			if var_164_5 <= arg_161_1.time_ and arg_161_1.time_ < var_164_5 + var_164_6 then
				local var_164_7 = (arg_161_1.time_ - var_164_5) / var_164_6
				local var_164_8 = Vector3.New(0, 100, 0)

				var_164_4.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos2044_tpose, var_164_8, var_164_7)

				local var_164_9 = manager.ui.mainCamera.transform.position - var_164_4.position

				var_164_4.forward = Vector3.New(var_164_9.x, var_164_9.y, var_164_9.z)

				local var_164_10 = var_164_4.localEulerAngles

				var_164_10.z = 0
				var_164_10.x = 0
				var_164_4.localEulerAngles = var_164_10
			end

			if arg_161_1.time_ >= var_164_5 + var_164_6 and arg_161_1.time_ < var_164_5 + var_164_6 + arg_164_0 then
				var_164_4.localPosition = Vector3.New(0, 100, 0)

				local var_164_11 = manager.ui.mainCamera.transform.position - var_164_4.position

				var_164_4.forward = Vector3.New(var_164_11.x, var_164_11.y, var_164_11.z)

				local var_164_12 = var_164_4.localEulerAngles

				var_164_12.z = 0
				var_164_12.x = 0
				var_164_4.localEulerAngles = var_164_12
			end

			local var_164_13 = arg_161_1.actors_["10001_tpose"].transform
			local var_164_14 = 0

			if var_164_14 < arg_161_1.time_ and arg_161_1.time_ <= var_164_14 + arg_164_0 then
				arg_161_1.var_.moveOldPos10001_tpose = var_164_13.localPosition
			end

			local var_164_15 = 0.001

			if var_164_14 <= arg_161_1.time_ and arg_161_1.time_ < var_164_14 + var_164_15 then
				local var_164_16 = (arg_161_1.time_ - var_164_14) / var_164_15
				local var_164_17 = Vector3.New(0, -1.23, -5.8)

				var_164_13.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos10001_tpose, var_164_17, var_164_16)

				local var_164_18 = manager.ui.mainCamera.transform.position - var_164_13.position

				var_164_13.forward = Vector3.New(var_164_18.x, var_164_18.y, var_164_18.z)

				local var_164_19 = var_164_13.localEulerAngles

				var_164_19.z = 0
				var_164_19.x = 0
				var_164_13.localEulerAngles = var_164_19
			end

			if arg_161_1.time_ >= var_164_14 + var_164_15 and arg_161_1.time_ < var_164_14 + var_164_15 + arg_164_0 then
				var_164_13.localPosition = Vector3.New(0, -1.23, -5.8)

				local var_164_20 = manager.ui.mainCamera.transform.position - var_164_13.position

				var_164_13.forward = Vector3.New(var_164_20.x, var_164_20.y, var_164_20.z)

				local var_164_21 = var_164_13.localEulerAngles

				var_164_21.z = 0
				var_164_21.x = 0
				var_164_13.localEulerAngles = var_164_21
			end

			local var_164_22 = 0

			if var_164_22 < arg_161_1.time_ and arg_161_1.time_ <= var_164_22 + arg_164_0 then
				arg_161_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action5_1")
			end

			local var_164_23 = 0

			if var_164_23 < arg_161_1.time_ and arg_161_1.time_ <= var_164_23 + arg_164_0 then
				arg_161_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_164_24 = 0
			local var_164_25 = 0.175

			if var_164_24 < arg_161_1.time_ and arg_161_1.time_ <= var_164_24 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_26 = arg_161_1:FormatText(StoryNameCfg[31].name)

				arg_161_1.leftNameTxt_.text = var_164_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_27 = arg_161_1:GetWordFromCfg(101021039)
				local var_164_28 = arg_161_1:FormatText(var_164_27.content)

				arg_161_1.text_.text = var_164_28

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_29 = 7
				local var_164_30 = utf8.len(var_164_28)
				local var_164_31 = var_164_29 <= 0 and var_164_25 or var_164_25 * (var_164_30 / var_164_29)

				if var_164_31 > 0 and var_164_25 < var_164_31 then
					arg_161_1.talkMaxDuration = var_164_31

					if var_164_31 + var_164_24 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_31 + var_164_24
					end
				end

				arg_161_1.text_.text = var_164_28
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021039", "story_v_out_101021.awb") ~= 0 then
					local var_164_32 = manager.audio:GetVoiceLength("story_v_out_101021", "101021039", "story_v_out_101021.awb") / 1000

					if var_164_32 + var_164_24 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_32 + var_164_24
					end

					if var_164_27.prefab_name ~= "" and arg_161_1.actors_[var_164_27.prefab_name] ~= nil then
						local var_164_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_27.prefab_name].transform, "story_v_out_101021", "101021039", "story_v_out_101021.awb")

						arg_161_1:RecordAudio("101021039", var_164_33)
						arg_161_1:RecordAudio("101021039", var_164_33)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_101021", "101021039", "story_v_out_101021.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_101021", "101021039", "story_v_out_101021.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_34 = math.max(var_164_25, arg_161_1.talkMaxDuration)

			if var_164_24 <= arg_161_1.time_ and arg_161_1.time_ < var_164_24 + var_164_34 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_24) / var_164_34

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_24 + var_164_34 and arg_161_1.time_ < var_164_24 + var_164_34 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play101021040 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 101021040
		arg_165_1.duration_ = 10.133

		local var_165_0 = {
			ja = 10.133,
			ko = 7.9,
			zh = 7.366,
			en = 8
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
				arg_165_0:Play101021041(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["10001_tpose"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 and arg_165_1.var_.characterEffect10001_tpose == nil then
				arg_165_1.var_.characterEffect10001_tpose = var_168_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_2 = 0.1

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2

				if arg_165_1.var_.characterEffect10001_tpose then
					local var_168_4 = Mathf.Lerp(0, 0.5, var_168_3)

					arg_165_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_165_1.var_.characterEffect10001_tpose.fillRatio = var_168_4
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 and arg_165_1.var_.characterEffect10001_tpose then
				local var_168_5 = 0.5

				arg_165_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_165_1.var_.characterEffect10001_tpose.fillRatio = var_168_5
			end

			local var_168_6 = 0
			local var_168_7 = 0.7

			if var_168_6 < arg_165_1.time_ and arg_165_1.time_ <= var_168_6 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_8 = arg_165_1:FormatText(StoryNameCfg[30].name)

				arg_165_1.leftNameTxt_.text = var_168_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_9 = arg_165_1:GetWordFromCfg(101021040)
				local var_168_10 = arg_165_1:FormatText(var_168_9.content)

				arg_165_1.text_.text = var_168_10

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_11 = 28
				local var_168_12 = utf8.len(var_168_10)
				local var_168_13 = var_168_11 <= 0 and var_168_7 or var_168_7 * (var_168_12 / var_168_11)

				if var_168_13 > 0 and var_168_7 < var_168_13 then
					arg_165_1.talkMaxDuration = var_168_13

					if var_168_13 + var_168_6 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_13 + var_168_6
					end
				end

				arg_165_1.text_.text = var_168_10
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021040", "story_v_out_101021.awb") ~= 0 then
					local var_168_14 = manager.audio:GetVoiceLength("story_v_out_101021", "101021040", "story_v_out_101021.awb") / 1000

					if var_168_14 + var_168_6 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_14 + var_168_6
					end

					if var_168_9.prefab_name ~= "" and arg_165_1.actors_[var_168_9.prefab_name] ~= nil then
						local var_168_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_9.prefab_name].transform, "story_v_out_101021", "101021040", "story_v_out_101021.awb")

						arg_165_1:RecordAudio("101021040", var_168_15)
						arg_165_1:RecordAudio("101021040", var_168_15)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_101021", "101021040", "story_v_out_101021.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_101021", "101021040", "story_v_out_101021.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_16 = math.max(var_168_7, arg_165_1.talkMaxDuration)

			if var_168_6 <= arg_165_1.time_ and arg_165_1.time_ < var_168_6 + var_168_16 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_6) / var_168_16

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_6 + var_168_16 and arg_165_1.time_ < var_168_6 + var_168_16 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play101021041 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 101021041
		arg_169_1.duration_ = 2.033

		local var_169_0 = {
			ja = 1.680999999999,
			ko = 1.680999999999,
			zh = 2.033,
			en = 1.680999999999
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
				arg_169_0:Play101021042(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["10001_tpose"]
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 and arg_169_1.var_.characterEffect10001_tpose == nil then
				arg_169_1.var_.characterEffect10001_tpose = var_172_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_2 = 0.1

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2

				if arg_169_1.var_.characterEffect10001_tpose then
					arg_169_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 and arg_169_1.var_.characterEffect10001_tpose then
				arg_169_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_172_4 = 0

			if var_172_4 < arg_169_1.time_ and arg_169_1.time_ <= var_172_4 + arg_172_0 then
				arg_169_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action5_2")
			end

			local var_172_5 = 0

			if var_172_5 < arg_169_1.time_ and arg_169_1.time_ <= var_172_5 + arg_172_0 then
				arg_169_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_172_6 = 0
			local var_172_7 = 0.175

			if var_172_6 < arg_169_1.time_ and arg_169_1.time_ <= var_172_6 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_8 = arg_169_1:FormatText(StoryNameCfg[31].name)

				arg_169_1.leftNameTxt_.text = var_172_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_9 = arg_169_1:GetWordFromCfg(101021041)
				local var_172_10 = arg_169_1:FormatText(var_172_9.content)

				arg_169_1.text_.text = var_172_10

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_11 = 7
				local var_172_12 = utf8.len(var_172_10)
				local var_172_13 = var_172_11 <= 0 and var_172_7 or var_172_7 * (var_172_12 / var_172_11)

				if var_172_13 > 0 and var_172_7 < var_172_13 then
					arg_169_1.talkMaxDuration = var_172_13

					if var_172_13 + var_172_6 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_13 + var_172_6
					end
				end

				arg_169_1.text_.text = var_172_10
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021041", "story_v_out_101021.awb") ~= 0 then
					local var_172_14 = manager.audio:GetVoiceLength("story_v_out_101021", "101021041", "story_v_out_101021.awb") / 1000

					if var_172_14 + var_172_6 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_14 + var_172_6
					end

					if var_172_9.prefab_name ~= "" and arg_169_1.actors_[var_172_9.prefab_name] ~= nil then
						local var_172_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_9.prefab_name].transform, "story_v_out_101021", "101021041", "story_v_out_101021.awb")

						arg_169_1:RecordAudio("101021041", var_172_15)
						arg_169_1:RecordAudio("101021041", var_172_15)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_101021", "101021041", "story_v_out_101021.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_101021", "101021041", "story_v_out_101021.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_16 = math.max(var_172_7, arg_169_1.talkMaxDuration)

			if var_172_6 <= arg_169_1.time_ and arg_169_1.time_ < var_172_6 + var_172_16 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_6) / var_172_16

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_6 + var_172_16 and arg_169_1.time_ < var_172_6 + var_172_16 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play101021042 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 101021042
		arg_173_1.duration_ = 9.733

		local var_173_0 = {
			ja = 6.866,
			ko = 8.233,
			zh = 8.4,
			en = 9.733
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
				arg_173_0:Play101021043(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0
			local var_176_1 = 1

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				local var_176_2 = "play"
				local var_176_3 = "effect"

				arg_173_1:AudioAction(var_176_2, var_176_3, "se_story", "se_story_robot_long", "")
			end

			local var_176_4 = arg_173_1.actors_["2044_tpose"]
			local var_176_5 = 0

			if var_176_5 < arg_173_1.time_ and arg_173_1.time_ <= var_176_5 + arg_176_0 and arg_173_1.var_.characterEffect2044_tpose == nil then
				arg_173_1.var_.characterEffect2044_tpose = var_176_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_6 = 0.1

			if var_176_5 <= arg_173_1.time_ and arg_173_1.time_ < var_176_5 + var_176_6 then
				local var_176_7 = (arg_173_1.time_ - var_176_5) / var_176_6

				if arg_173_1.var_.characterEffect2044_tpose then
					arg_173_1.var_.characterEffect2044_tpose.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_5 + var_176_6 and arg_173_1.time_ < var_176_5 + var_176_6 + arg_176_0 and arg_173_1.var_.characterEffect2044_tpose then
				arg_173_1.var_.characterEffect2044_tpose.fillFlat = false
			end

			local var_176_8 = arg_173_1.actors_["10001_tpose"]
			local var_176_9 = 0

			if var_176_9 < arg_173_1.time_ and arg_173_1.time_ <= var_176_9 + arg_176_0 and arg_173_1.var_.characterEffect10001_tpose == nil then
				arg_173_1.var_.characterEffect10001_tpose = var_176_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_10 = 0.1

			if var_176_9 <= arg_173_1.time_ and arg_173_1.time_ < var_176_9 + var_176_10 then
				local var_176_11 = (arg_173_1.time_ - var_176_9) / var_176_10

				if arg_173_1.var_.characterEffect10001_tpose then
					local var_176_12 = Mathf.Lerp(0, 0.5, var_176_11)

					arg_173_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_173_1.var_.characterEffect10001_tpose.fillRatio = var_176_12
				end
			end

			if arg_173_1.time_ >= var_176_9 + var_176_10 and arg_173_1.time_ < var_176_9 + var_176_10 + arg_176_0 and arg_173_1.var_.characterEffect10001_tpose then
				local var_176_13 = 0.5

				arg_173_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_173_1.var_.characterEffect10001_tpose.fillRatio = var_176_13
			end

			local var_176_14 = arg_173_1.actors_["10001_tpose"].transform
			local var_176_15 = 0

			if var_176_15 < arg_173_1.time_ and arg_173_1.time_ <= var_176_15 + arg_176_0 then
				arg_173_1.var_.moveOldPos10001_tpose = var_176_14.localPosition
			end

			local var_176_16 = 0.001

			if var_176_15 <= arg_173_1.time_ and arg_173_1.time_ < var_176_15 + var_176_16 then
				local var_176_17 = (arg_173_1.time_ - var_176_15) / var_176_16
				local var_176_18 = Vector3.New(0, 100, 0)

				var_176_14.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos10001_tpose, var_176_18, var_176_17)

				local var_176_19 = manager.ui.mainCamera.transform.position - var_176_14.position

				var_176_14.forward = Vector3.New(var_176_19.x, var_176_19.y, var_176_19.z)

				local var_176_20 = var_176_14.localEulerAngles

				var_176_20.z = 0
				var_176_20.x = 0
				var_176_14.localEulerAngles = var_176_20
			end

			if arg_173_1.time_ >= var_176_15 + var_176_16 and arg_173_1.time_ < var_176_15 + var_176_16 + arg_176_0 then
				var_176_14.localPosition = Vector3.New(0, 100, 0)

				local var_176_21 = manager.ui.mainCamera.transform.position - var_176_14.position

				var_176_14.forward = Vector3.New(var_176_21.x, var_176_21.y, var_176_21.z)

				local var_176_22 = var_176_14.localEulerAngles

				var_176_22.z = 0
				var_176_22.x = 0
				var_176_14.localEulerAngles = var_176_22
			end

			local var_176_23 = arg_173_1.actors_["2044_tpose"].transform
			local var_176_24 = 0

			if var_176_24 < arg_173_1.time_ and arg_173_1.time_ <= var_176_24 + arg_176_0 then
				arg_173_1.var_.moveOldPos2044_tpose = var_176_23.localPosition
			end

			local var_176_25 = 0.001

			if var_176_24 <= arg_173_1.time_ and arg_173_1.time_ < var_176_24 + var_176_25 then
				local var_176_26 = (arg_173_1.time_ - var_176_24) / var_176_25
				local var_176_27 = Vector3.New(0, -1.15, -2.3)

				var_176_23.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos2044_tpose, var_176_27, var_176_26)

				local var_176_28 = manager.ui.mainCamera.transform.position - var_176_23.position

				var_176_23.forward = Vector3.New(var_176_28.x, var_176_28.y, var_176_28.z)

				local var_176_29 = var_176_23.localEulerAngles

				var_176_29.z = 0
				var_176_29.x = 0
				var_176_23.localEulerAngles = var_176_29
			end

			if arg_173_1.time_ >= var_176_24 + var_176_25 and arg_173_1.time_ < var_176_24 + var_176_25 + arg_176_0 then
				var_176_23.localPosition = Vector3.New(0, -1.15, -2.3)

				local var_176_30 = manager.ui.mainCamera.transform.position - var_176_23.position

				var_176_23.forward = Vector3.New(var_176_30.x, var_176_30.y, var_176_30.z)

				local var_176_31 = var_176_23.localEulerAngles

				var_176_31.z = 0
				var_176_31.x = 0
				var_176_23.localEulerAngles = var_176_31
			end

			local var_176_32 = 0

			if var_176_32 < arg_173_1.time_ and arg_173_1.time_ <= var_176_32 + arg_176_0 then
				arg_173_1:PlayTimeline("2044_tpose", "StoryTimeline/CharAction/story2044/story2044action/2044action1_1")
			end

			local var_176_33 = 0
			local var_176_34 = 0.775

			if var_176_33 < arg_173_1.time_ and arg_173_1.time_ <= var_176_33 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_35 = arg_173_1:FormatText(StoryNameCfg[29].name)

				arg_173_1.leftNameTxt_.text = var_176_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_36 = arg_173_1:GetWordFromCfg(101021042)
				local var_176_37 = arg_173_1:FormatText(var_176_36.content)

				arg_173_1.text_.text = var_176_37

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_38 = 30
				local var_176_39 = utf8.len(var_176_37)
				local var_176_40 = var_176_38 <= 0 and var_176_34 or var_176_34 * (var_176_39 / var_176_38)

				if var_176_40 > 0 and var_176_34 < var_176_40 then
					arg_173_1.talkMaxDuration = var_176_40

					if var_176_40 + var_176_33 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_40 + var_176_33
					end
				end

				arg_173_1.text_.text = var_176_37
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021042", "story_v_out_101021.awb") ~= 0 then
					local var_176_41 = manager.audio:GetVoiceLength("story_v_out_101021", "101021042", "story_v_out_101021.awb") / 1000

					if var_176_41 + var_176_33 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_41 + var_176_33
					end

					if var_176_36.prefab_name ~= "" and arg_173_1.actors_[var_176_36.prefab_name] ~= nil then
						local var_176_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_36.prefab_name].transform, "story_v_out_101021", "101021042", "story_v_out_101021.awb")

						arg_173_1:RecordAudio("101021042", var_176_42)
						arg_173_1:RecordAudio("101021042", var_176_42)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_101021", "101021042", "story_v_out_101021.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_101021", "101021042", "story_v_out_101021.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_43 = math.max(var_176_34, arg_173_1.talkMaxDuration)

			if var_176_33 <= arg_173_1.time_ and arg_173_1.time_ < var_176_33 + var_176_43 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_33) / var_176_43

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_33 + var_176_43 and arg_173_1.time_ < var_176_33 + var_176_43 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play101021043 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 101021043
		arg_177_1.duration_ = 1

		local var_177_0 = {
			ja = 0.8,
			ko = 0.9,
			zh = 1,
			en = 0.833
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
				arg_177_0:Play101021044(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["2044_tpose"]
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 and arg_177_1.var_.characterEffect2044_tpose == nil then
				arg_177_1.var_.characterEffect2044_tpose = var_180_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_2 = 0.1

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2

				if arg_177_1.var_.characterEffect2044_tpose then
					local var_180_4 = Mathf.Lerp(0, 0.5, var_180_3)

					arg_177_1.var_.characterEffect2044_tpose.fillFlat = true
					arg_177_1.var_.characterEffect2044_tpose.fillRatio = var_180_4
				end
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 and arg_177_1.var_.characterEffect2044_tpose then
				local var_180_5 = 0.5

				arg_177_1.var_.characterEffect2044_tpose.fillFlat = true
				arg_177_1.var_.characterEffect2044_tpose.fillRatio = var_180_5
			end

			local var_180_6 = 0
			local var_180_7 = 0.05

			if var_180_6 < arg_177_1.time_ and arg_177_1.time_ <= var_180_6 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_8 = arg_177_1:FormatText(StoryNameCfg[30].name)

				arg_177_1.leftNameTxt_.text = var_180_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_9 = arg_177_1:GetWordFromCfg(101021043)
				local var_180_10 = arg_177_1:FormatText(var_180_9.content)

				arg_177_1.text_.text = var_180_10

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_11 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021043", "story_v_out_101021.awb") ~= 0 then
					local var_180_14 = manager.audio:GetVoiceLength("story_v_out_101021", "101021043", "story_v_out_101021.awb") / 1000

					if var_180_14 + var_180_6 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_14 + var_180_6
					end

					if var_180_9.prefab_name ~= "" and arg_177_1.actors_[var_180_9.prefab_name] ~= nil then
						local var_180_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_9.prefab_name].transform, "story_v_out_101021", "101021043", "story_v_out_101021.awb")

						arg_177_1:RecordAudio("101021043", var_180_15)
						arg_177_1:RecordAudio("101021043", var_180_15)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_101021", "101021043", "story_v_out_101021.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_101021", "101021043", "story_v_out_101021.awb")
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
	Play101021044 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 101021044
		arg_181_1.duration_ = 2.866

		local var_181_0 = {
			ja = 2.866,
			ko = 1.466,
			zh = 2.2,
			en = 1.333
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
				arg_181_0:Play101021045(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = 0
			local var_184_1 = 1

			if var_184_0 < arg_181_1.time_ and arg_181_1.time_ <= var_184_0 + arg_184_0 then
				local var_184_2 = "play"
				local var_184_3 = "effect"

				arg_181_1:AudioAction(var_184_2, var_184_3, "se_story", "se_story_robot_excited", "")
			end

			local var_184_4 = arg_181_1.actors_["2044_tpose"]
			local var_184_5 = 0

			if var_184_5 < arg_181_1.time_ and arg_181_1.time_ <= var_184_5 + arg_184_0 and arg_181_1.var_.characterEffect2044_tpose == nil then
				arg_181_1.var_.characterEffect2044_tpose = var_184_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_6 = 0.1

			if var_184_5 <= arg_181_1.time_ and arg_181_1.time_ < var_184_5 + var_184_6 then
				local var_184_7 = (arg_181_1.time_ - var_184_5) / var_184_6

				if arg_181_1.var_.characterEffect2044_tpose then
					arg_181_1.var_.characterEffect2044_tpose.fillFlat = false
				end
			end

			if arg_181_1.time_ >= var_184_5 + var_184_6 and arg_181_1.time_ < var_184_5 + var_184_6 + arg_184_0 and arg_181_1.var_.characterEffect2044_tpose then
				arg_181_1.var_.characterEffect2044_tpose.fillFlat = false
			end

			local var_184_8 = 0

			if var_184_8 < arg_181_1.time_ and arg_181_1.time_ <= var_184_8 + arg_184_0 then
				arg_181_1.mask_.enabled = true
				arg_181_1.mask_.raycastTarget = true

				arg_181_1:SetGaussion(false)
			end

			local var_184_9 = 0.5

			if var_184_8 <= arg_181_1.time_ and arg_181_1.time_ < var_184_8 + var_184_9 then
				local var_184_10 = (arg_181_1.time_ - var_184_8) / var_184_9
				local var_184_11 = Color.New(1, 1, 1)

				var_184_11.a = Mathf.Lerp(1, 0, var_184_10)
				arg_181_1.mask_.color = var_184_11
			end

			if arg_181_1.time_ >= var_184_8 + var_184_9 and arg_181_1.time_ < var_184_8 + var_184_9 + arg_184_0 then
				local var_184_12 = Color.New(1, 1, 1)
				local var_184_13 = 0

				arg_181_1.mask_.enabled = false
				var_184_12.a = var_184_13
				arg_181_1.mask_.color = var_184_12
			end

			local var_184_14 = manager.ui.mainCamera.transform
			local var_184_15 = 0

			if var_184_15 < arg_181_1.time_ and arg_181_1.time_ <= var_184_15 + arg_184_0 then
				arg_181_1.var_.shakeOldPosMainCamera = var_184_14.localPosition
			end

			local var_184_16 = 0.600000023841858

			if var_184_15 <= arg_181_1.time_ and arg_181_1.time_ < var_184_15 + var_184_16 then
				local var_184_17 = (arg_181_1.time_ - var_184_15) / 0.066
				local var_184_18, var_184_19 = math.modf(var_184_17)

				var_184_14.localPosition = Vector3.New(var_184_19 * 0.13, var_184_19 * 0.13, var_184_19 * 0.13) + arg_181_1.var_.shakeOldPosMainCamera
			end

			if arg_181_1.time_ >= var_184_15 + var_184_16 and arg_181_1.time_ < var_184_15 + var_184_16 + arg_184_0 then
				var_184_14.localPosition = arg_181_1.var_.shakeOldPosMainCamera
			end

			local var_184_20 = 0
			local var_184_21 = 0.125

			if var_184_20 < arg_181_1.time_ and arg_181_1.time_ <= var_184_20 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_22 = arg_181_1:FormatText(StoryNameCfg[29].name)

				arg_181_1.leftNameTxt_.text = var_184_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_23 = arg_181_1:GetWordFromCfg(101021044)
				local var_184_24 = arg_181_1:FormatText(var_184_23.content)

				arg_181_1.text_.text = var_184_24

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_25 = 5
				local var_184_26 = utf8.len(var_184_24)
				local var_184_27 = var_184_25 <= 0 and var_184_21 or var_184_21 * (var_184_26 / var_184_25)

				if var_184_27 > 0 and var_184_21 < var_184_27 then
					arg_181_1.talkMaxDuration = var_184_27

					if var_184_27 + var_184_20 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_27 + var_184_20
					end
				end

				arg_181_1.text_.text = var_184_24
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021044", "story_v_out_101021.awb") ~= 0 then
					local var_184_28 = manager.audio:GetVoiceLength("story_v_out_101021", "101021044", "story_v_out_101021.awb") / 1000

					if var_184_28 + var_184_20 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_28 + var_184_20
					end

					if var_184_23.prefab_name ~= "" and arg_181_1.actors_[var_184_23.prefab_name] ~= nil then
						local var_184_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_23.prefab_name].transform, "story_v_out_101021", "101021044", "story_v_out_101021.awb")

						arg_181_1:RecordAudio("101021044", var_184_29)
						arg_181_1:RecordAudio("101021044", var_184_29)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_101021", "101021044", "story_v_out_101021.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_101021", "101021044", "story_v_out_101021.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_30 = math.max(var_184_21, arg_181_1.talkMaxDuration)

			if var_184_20 <= arg_181_1.time_ and arg_181_1.time_ < var_184_20 + var_184_30 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_20) / var_184_30

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_20 + var_184_30 and arg_181_1.time_ < var_184_20 + var_184_30 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play101021045 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 101021045
		arg_185_1.duration_ = 5

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play101021046(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0
			local var_188_1 = 1

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				local var_188_2 = "play"
				local var_188_3 = "effect"

				arg_185_1:AudioAction(var_188_2, var_188_3, "se_story_1", "se_story_1_apollo_bow", "")
			end

			local var_188_4 = arg_185_1.actors_["2044_tpose"]
			local var_188_5 = 0

			if var_188_5 < arg_185_1.time_ and arg_185_1.time_ <= var_188_5 + arg_188_0 and arg_185_1.var_.characterEffect2044_tpose == nil then
				arg_185_1.var_.characterEffect2044_tpose = var_188_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_6 = 0.1

			if var_188_5 <= arg_185_1.time_ and arg_185_1.time_ < var_188_5 + var_188_6 then
				local var_188_7 = (arg_185_1.time_ - var_188_5) / var_188_6

				if arg_185_1.var_.characterEffect2044_tpose then
					local var_188_8 = Mathf.Lerp(0, 0.5, var_188_7)

					arg_185_1.var_.characterEffect2044_tpose.fillFlat = true
					arg_185_1.var_.characterEffect2044_tpose.fillRatio = var_188_8
				end
			end

			if arg_185_1.time_ >= var_188_5 + var_188_6 and arg_185_1.time_ < var_188_5 + var_188_6 + arg_188_0 and arg_185_1.var_.characterEffect2044_tpose then
				local var_188_9 = 0.5

				arg_185_1.var_.characterEffect2044_tpose.fillFlat = true
				arg_185_1.var_.characterEffect2044_tpose.fillRatio = var_188_9
			end

			local var_188_10 = 0

			if var_188_10 < arg_185_1.time_ and arg_185_1.time_ <= var_188_10 + arg_188_0 then
				arg_185_1.mask_.enabled = true
				arg_185_1.mask_.raycastTarget = true

				arg_185_1:SetGaussion(false)
			end

			local var_188_11 = 0.5

			if var_188_10 <= arg_185_1.time_ and arg_185_1.time_ < var_188_10 + var_188_11 then
				local var_188_12 = (arg_185_1.time_ - var_188_10) / var_188_11
				local var_188_13 = Color.New(1, 1, 1)

				var_188_13.a = Mathf.Lerp(1, 0, var_188_12)
				arg_185_1.mask_.color = var_188_13
			end

			if arg_185_1.time_ >= var_188_10 + var_188_11 and arg_185_1.time_ < var_188_10 + var_188_11 + arg_188_0 then
				local var_188_14 = Color.New(1, 1, 1)
				local var_188_15 = 0

				arg_185_1.mask_.enabled = false
				var_188_14.a = var_188_15
				arg_185_1.mask_.color = var_188_14
			end

			local var_188_16 = arg_185_1.actors_["2044_tpose"].transform
			local var_188_17 = 0

			if var_188_17 < arg_185_1.time_ and arg_185_1.time_ <= var_188_17 + arg_188_0 then
				arg_185_1.var_.moveOldPos2044_tpose = var_188_16.localPosition
			end

			local var_188_18 = 0.001

			if var_188_17 <= arg_185_1.time_ and arg_185_1.time_ < var_188_17 + var_188_18 then
				local var_188_19 = (arg_185_1.time_ - var_188_17) / var_188_18
				local var_188_20 = Vector3.New(0, 100, 0)

				var_188_16.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos2044_tpose, var_188_20, var_188_19)

				local var_188_21 = manager.ui.mainCamera.transform.position - var_188_16.position

				var_188_16.forward = Vector3.New(var_188_21.x, var_188_21.y, var_188_21.z)

				local var_188_22 = var_188_16.localEulerAngles

				var_188_22.z = 0
				var_188_22.x = 0
				var_188_16.localEulerAngles = var_188_22
			end

			if arg_185_1.time_ >= var_188_17 + var_188_18 and arg_185_1.time_ < var_188_17 + var_188_18 + arg_188_0 then
				var_188_16.localPosition = Vector3.New(0, 100, 0)

				local var_188_23 = manager.ui.mainCamera.transform.position - var_188_16.position

				var_188_16.forward = Vector3.New(var_188_23.x, var_188_23.y, var_188_23.z)

				local var_188_24 = var_188_16.localEulerAngles

				var_188_24.z = 0
				var_188_24.x = 0
				var_188_16.localEulerAngles = var_188_24
			end

			local var_188_25 = manager.ui.mainCamera.transform
			local var_188_26 = 0

			if var_188_26 < arg_185_1.time_ and arg_185_1.time_ <= var_188_26 + arg_188_0 then
				arg_185_1.var_.shakeOldPosMainCamera = var_188_25.localPosition
			end

			local var_188_27 = 0.300000011920929

			if var_188_26 <= arg_185_1.time_ and arg_185_1.time_ < var_188_26 + var_188_27 then
				local var_188_28 = (arg_185_1.time_ - var_188_26) / 0.066
				local var_188_29, var_188_30 = math.modf(var_188_28)

				var_188_25.localPosition = Vector3.New(var_188_30 * 0.13, var_188_30 * 0.13, var_188_30 * 0.13) + arg_185_1.var_.shakeOldPosMainCamera
			end

			if arg_185_1.time_ >= var_188_26 + var_188_27 and arg_185_1.time_ < var_188_26 + var_188_27 + arg_188_0 then
				var_188_25.localPosition = arg_185_1.var_.shakeOldPosMainCamera
			end

			local var_188_31 = 0
			local var_188_32 = 0.9

			if var_188_31 < arg_185_1.time_ and arg_185_1.time_ <= var_188_31 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0

				arg_185_1.dialog_:SetActive(true)

				local var_188_33 = LeanTween.value(arg_185_1.dialog_, 0, 1, 0.3)

				var_188_33:setOnUpdate(LuaHelper.FloatAction(function(arg_189_0)
					arg_185_1.dialogCg_.alpha = arg_189_0
				end))
				var_188_33:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_185_1.dialog_)
					var_188_33:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_185_1.duration_ = arg_185_1.duration_ + 0.3

				SetActive(arg_185_1.leftNameGo_, false)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_34 = arg_185_1:GetWordFromCfg(101021045)
				local var_188_35 = arg_185_1:FormatText(var_188_34.content)

				arg_185_1.text_.text = var_188_35

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_36 = 36
				local var_188_37 = utf8.len(var_188_35)
				local var_188_38 = var_188_36 <= 0 and var_188_32 or var_188_32 * (var_188_37 / var_188_36)

				if var_188_38 > 0 and var_188_32 < var_188_38 then
					arg_185_1.talkMaxDuration = var_188_38
					var_188_31 = var_188_31 + 0.3

					if var_188_38 + var_188_31 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_38 + var_188_31
					end
				end

				arg_185_1.text_.text = var_188_35
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)
				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_39 = var_188_31 + 0.3
			local var_188_40 = math.max(var_188_32, arg_185_1.talkMaxDuration)

			if var_188_39 <= arg_185_1.time_ and arg_185_1.time_ < var_188_39 + var_188_40 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_39) / var_188_40

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_39 + var_188_40 and arg_185_1.time_ < var_188_39 + var_188_40 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play101021046 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 101021046
		arg_191_1.duration_ = 9.366

		local var_191_0 = {
			ja = 7.733,
			ko = 9.366,
			zh = 7.6,
			en = 6.766
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
			arg_191_1.auto_ = false
		end

		function arg_191_1.playNext_(arg_193_0)
			arg_191_1.onStoryFinished_()
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1059ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect1059ui_story == nil then
				arg_191_1.var_.characterEffect1059ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.1

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect1059ui_story then
					arg_191_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect1059ui_story then
				arg_191_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_194_4 = arg_191_1.actors_["1059ui_story"].transform
			local var_194_5 = 0

			if var_194_5 < arg_191_1.time_ and arg_191_1.time_ <= var_194_5 + arg_194_0 then
				arg_191_1.var_.moveOldPos1059ui_story = var_194_4.localPosition
			end

			local var_194_6 = 0.001

			if var_194_5 <= arg_191_1.time_ and arg_191_1.time_ < var_194_5 + var_194_6 then
				local var_194_7 = (arg_191_1.time_ - var_194_5) / var_194_6
				local var_194_8 = Vector3.New(0, -1.05, -6)

				var_194_4.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos1059ui_story, var_194_8, var_194_7)

				local var_194_9 = manager.ui.mainCamera.transform.position - var_194_4.position

				var_194_4.forward = Vector3.New(var_194_9.x, var_194_9.y, var_194_9.z)

				local var_194_10 = var_194_4.localEulerAngles

				var_194_10.z = 0
				var_194_10.x = 0
				var_194_4.localEulerAngles = var_194_10
			end

			if arg_191_1.time_ >= var_194_5 + var_194_6 and arg_191_1.time_ < var_194_5 + var_194_6 + arg_194_0 then
				var_194_4.localPosition = Vector3.New(0, -1.05, -6)

				local var_194_11 = manager.ui.mainCamera.transform.position - var_194_4.position

				var_194_4.forward = Vector3.New(var_194_11.x, var_194_11.y, var_194_11.z)

				local var_194_12 = var_194_4.localEulerAngles

				var_194_12.z = 0
				var_194_12.x = 0
				var_194_4.localEulerAngles = var_194_12
			end

			local var_194_13 = 0

			if var_194_13 < arg_191_1.time_ and arg_191_1.time_ <= var_194_13 + arg_194_0 then
				arg_191_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action5_1")
			end

			local var_194_14 = 0

			if var_194_14 < arg_191_1.time_ and arg_191_1.time_ <= var_194_14 + arg_194_0 then
				arg_191_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_194_15 = 0
			local var_194_16 = 0.9

			if var_194_15 < arg_191_1.time_ and arg_191_1.time_ <= var_194_15 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_17 = arg_191_1:FormatText(StoryNameCfg[28].name)

				arg_191_1.leftNameTxt_.text = var_194_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_18 = arg_191_1:GetWordFromCfg(101021046)
				local var_194_19 = arg_191_1:FormatText(var_194_18.content)

				arg_191_1.text_.text = var_194_19

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_20 = 36
				local var_194_21 = utf8.len(var_194_19)
				local var_194_22 = var_194_20 <= 0 and var_194_16 or var_194_16 * (var_194_21 / var_194_20)

				if var_194_22 > 0 and var_194_16 < var_194_22 then
					arg_191_1.talkMaxDuration = var_194_22

					if var_194_22 + var_194_15 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_22 + var_194_15
					end
				end

				arg_191_1.text_.text = var_194_19
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101021", "101021046", "story_v_out_101021.awb") ~= 0 then
					local var_194_23 = manager.audio:GetVoiceLength("story_v_out_101021", "101021046", "story_v_out_101021.awb") / 1000

					if var_194_23 + var_194_15 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_23 + var_194_15
					end

					if var_194_18.prefab_name ~= "" and arg_191_1.actors_[var_194_18.prefab_name] ~= nil then
						local var_194_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_18.prefab_name].transform, "story_v_out_101021", "101021046", "story_v_out_101021.awb")

						arg_191_1:RecordAudio("101021046", var_194_24)
						arg_191_1:RecordAudio("101021046", var_194_24)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_101021", "101021046", "story_v_out_101021.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_101021", "101021046", "story_v_out_101021.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_25 = math.max(var_194_16, arg_191_1.talkMaxDuration)

			if var_194_15 <= arg_191_1.time_ and arg_191_1.time_ < var_194_15 + var_194_25 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_15) / var_194_25

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_15 + var_194_25 and arg_191_1.time_ < var_194_15 + var_194_25 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B10a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B10f"
	},
	voices = {
		"story_v_out_101021.awb"
	}
}
