return {
	Play105121001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 105121001
		arg_1_1.duration_ = 12.666

		local var_1_0 = {
			ja = 12.666,
			ko = 7.9,
			zh = 9.966,
			en = 12.2
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
				arg_1_0:Play105121002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0
			local var_4_1 = 1

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				local var_4_2 = "play"
				local var_4_3 = "music"

				arg_1_1:AudioAction(var_4_2, var_4_3, "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1")
			end

			local var_4_4 = 2
			local var_4_5 = 1

			if var_4_4 < arg_1_1.time_ and arg_1_1.time_ <= var_4_4 + arg_4_0 then
				local var_4_6 = "play"
				local var_4_7 = "effect"

				arg_1_1:AudioAction(var_4_6, var_4_7, "se_story_v0_environment_source", "se_story_v0_environment_source", "se_story_v0_environment_source")
			end

			local var_4_8 = 2
			local var_4_9 = 1

			if var_4_8 < arg_1_1.time_ and arg_1_1.time_ <= var_4_8 + arg_4_0 then
				local var_4_10 = "play"
				local var_4_11 = "effect"

				arg_1_1:AudioAction(var_4_10, var_4_11, "se_story_5", "se_story_5_steamloop", "")
			end

			local var_4_12 = "B12a"

			if arg_1_1.bgs_[var_4_12] == nil then
				local var_4_13 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_13:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_12)
				var_4_13.name = var_4_12
				var_4_13.transform.parent = arg_1_1.stage_.transform
				var_4_13.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_12] = var_4_13
			end

			local var_4_14 = arg_1_1.bgs_.B12a
			local var_4_15 = 0

			if var_4_15 < arg_1_1.time_ and arg_1_1.time_ <= var_4_15 + arg_4_0 then
				local var_4_16 = var_4_14:GetComponent("SpriteRenderer")

				if var_4_16 then
					var_4_16.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_17 = var_4_16.material
					local var_4_18 = var_4_17:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB12a = var_4_18.a
					arg_1_1.var_.alphaMatValueB12a = var_4_17
				end

				arg_1_1.var_.alphaOldValueB12a = 0
			end

			local var_4_19 = 1.5

			if var_4_15 <= arg_1_1.time_ and arg_1_1.time_ < var_4_15 + var_4_19 then
				local var_4_20 = (arg_1_1.time_ - var_4_15) / var_4_19
				local var_4_21 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB12a, 1, var_4_20)

				if arg_1_1.var_.alphaMatValueB12a then
					local var_4_22 = arg_1_1.var_.alphaMatValueB12a
					local var_4_23 = var_4_22:GetColor("_Color")

					var_4_23.a = var_4_21

					var_4_22:SetColor("_Color", var_4_23)
				end
			end

			if arg_1_1.time_ >= var_4_15 + var_4_19 and arg_1_1.time_ < var_4_15 + var_4_19 + arg_4_0 and arg_1_1.var_.alphaMatValueB12a then
				local var_4_24 = arg_1_1.var_.alphaMatValueB12a
				local var_4_25 = var_4_24:GetColor("_Color")

				var_4_25.a = 1

				var_4_24:SetColor("_Color", var_4_25)
			end

			local var_4_26 = 0

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_27 = manager.ui.mainCamera.transform.localPosition
				local var_4_28 = Vector3.New(0, 0, 10) + Vector3.New(var_4_27.x, var_4_27.y, 0)
				local var_4_29 = arg_1_1.bgs_.B12a

				var_4_29.transform.localPosition = var_4_28
				var_4_29.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_30 = var_4_29:GetComponent("SpriteRenderer")

				if var_4_30 and var_4_30.sprite then
					local var_4_31 = (var_4_29.transform.localPosition - var_4_27).z
					local var_4_32 = manager.ui.mainCameraCom_
					local var_4_33 = 2 * var_4_31 * Mathf.Tan(var_4_32.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_34 = var_4_33 * var_4_32.aspect
					local var_4_35 = var_4_30.sprite.bounds.size.x
					local var_4_36 = var_4_30.sprite.bounds.size.y
					local var_4_37 = var_4_34 / var_4_35
					local var_4_38 = var_4_33 / var_4_36
					local var_4_39 = var_4_38 < var_4_37 and var_4_37 or var_4_38

					var_4_29.transform.localScale = Vector3.New(var_4_39, var_4_39, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "B12a" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_40 = 0

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_41 = 2

			if arg_1_1.time_ >= var_4_40 + var_4_41 and arg_1_1.time_ < var_4_40 + var_4_41 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_42 = 2
			local var_4_43 = 0.65

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

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_45 = arg_1_1:FormatText(StoryNameCfg[49].name)

				arg_1_1.leftNameTxt_.text = var_4_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4013")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_46 = arg_1_1:GetWordFromCfg(105121001)
				local var_4_47 = arg_1_1:FormatText(var_4_46.content)

				arg_1_1.text_.text = var_4_47

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_48 = 25
				local var_4_49 = utf8.len(var_4_47)
				local var_4_50 = var_4_48 <= 0 and var_4_43 or var_4_43 * (var_4_49 / var_4_48)

				if var_4_50 > 0 and var_4_43 < var_4_50 then
					arg_1_1.talkMaxDuration = var_4_50
					var_4_42 = var_4_42 + 0.3

					if var_4_50 + var_4_42 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_50 + var_4_42
					end
				end

				arg_1_1.text_.text = var_4_47
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121001", "story_v_out_105121.awb") ~= 0 then
					local var_4_51 = manager.audio:GetVoiceLength("story_v_out_105121", "105121001", "story_v_out_105121.awb") / 1000

					if var_4_51 + var_4_42 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_51 + var_4_42
					end

					if var_4_46.prefab_name ~= "" and arg_1_1.actors_[var_4_46.prefab_name] ~= nil then
						local var_4_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_46.prefab_name].transform, "story_v_out_105121", "105121001", "story_v_out_105121.awb")

						arg_1_1:RecordAudio("105121001", var_4_52)
						arg_1_1:RecordAudio("105121001", var_4_52)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_105121", "105121001", "story_v_out_105121.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_105121", "105121001", "story_v_out_105121.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_53 = var_4_42 + 0.3
			local var_4_54 = math.max(var_4_43, arg_1_1.talkMaxDuration)

			if var_4_53 <= arg_1_1.time_ and arg_1_1.time_ < var_4_53 + var_4_54 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_53) / var_4_54

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_53 + var_4_54 and arg_1_1.time_ < var_4_53 + var_4_54 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play105121002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 105121002
		arg_7_1.duration_ = 1.266

		local var_7_0 = {
			ja = 1.133,
			ko = 1.166,
			zh = 1.266,
			en = 1.266
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
				arg_7_0:Play105121003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.125

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[5].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1036")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(105121002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121002", "story_v_out_105121.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_105121", "105121002", "story_v_out_105121.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_105121", "105121002", "story_v_out_105121.awb")

						arg_7_1:RecordAudio("105121002", var_10_9)
						arg_7_1:RecordAudio("105121002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_105121", "105121002", "story_v_out_105121.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_105121", "105121002", "story_v_out_105121.awb")
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
	Play105121003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 105121003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play105121004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				local var_14_2 = "play"
				local var_14_3 = "effect"

				arg_11_1:AudioAction(var_14_2, var_14_3, "se_story_5", "se_story_5_bossarrow", "")
			end

			local var_14_4 = manager.ui.mainCamera.transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.shakeOldPos = var_14_4.localPosition
			end

			local var_14_6 = 0.6

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / 0.066
				local var_14_8, var_14_9 = math.modf(var_14_7)

				var_14_4.localPosition = Vector3.New(var_14_9 * 0.13, var_14_9 * 0.13, var_14_9 * 0.13) + arg_11_1.var_.shakeOldPos
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				var_14_4.localPosition = arg_11_1.var_.shakeOldPos
			end

			local var_14_10 = 0
			local var_14_11 = 1.225

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_12 = arg_11_1:GetWordFromCfg(105121003)
				local var_14_13 = arg_11_1:FormatText(var_14_12.content)

				arg_11_1.text_.text = var_14_13

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_14 = 49
				local var_14_15 = utf8.len(var_14_13)
				local var_14_16 = var_14_14 <= 0 and var_14_11 or var_14_11 * (var_14_15 / var_14_14)

				if var_14_16 > 0 and var_14_11 < var_14_16 then
					arg_11_1.talkMaxDuration = var_14_16

					if var_14_16 + var_14_10 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_16 + var_14_10
					end
				end

				arg_11_1.text_.text = var_14_13
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_17 = math.max(var_14_11, arg_11_1.talkMaxDuration)

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_17 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_10) / var_14_17

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_10 + var_14_17 and arg_11_1.time_ < var_14_10 + var_14_17 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play105121004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 105121004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play105121005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1.275

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_2 = arg_15_1:GetWordFromCfg(105121004)
				local var_18_3 = arg_15_1:FormatText(var_18_2.content)

				arg_15_1.text_.text = var_18_3

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_4 = 51
				local var_18_5 = utf8.len(var_18_3)
				local var_18_6 = var_18_4 <= 0 and var_18_1 or var_18_1 * (var_18_5 / var_18_4)

				if var_18_6 > 0 and var_18_1 < var_18_6 then
					arg_15_1.talkMaxDuration = var_18_6

					if var_18_6 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_6 + var_18_0
					end
				end

				arg_15_1.text_.text = var_18_3
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_7 = math.max(var_18_1, arg_15_1.talkMaxDuration)

			if var_18_0 <= arg_15_1.time_ and arg_15_1.time_ < var_18_0 + var_18_7 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_0) / var_18_7

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_0 + var_18_7 and arg_15_1.time_ < var_18_0 + var_18_7 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play105121005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 105121005
		arg_19_1.duration_ = 16.083

		local var_19_0 = {
			ja = 16.083,
			ko = 5.95,
			zh = 8.95,
			en = 14.75
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
				arg_19_0:Play105121006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = manager.ui.mainCamera.transform
			local var_22_1 = 0.25

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.shakeOldPos = var_22_0.localPosition
			end

			local var_22_2 = 0.6

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / 0.099
				local var_22_4, var_22_5 = math.modf(var_22_3)

				var_22_0.localPosition = Vector3.New(var_22_5 * 0.13, var_22_5 * 0.13, var_22_5 * 0.13) + arg_19_1.var_.shakeOldPos
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 then
				var_22_0.localPosition = arg_19_1.var_.shakeOldPos
			end

			local var_22_6 = 0.25
			local var_22_7 = 0.75

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_8 = arg_19_1:FormatText(StoryNameCfg[49].name)

				arg_19_1.leftNameTxt_.text = var_22_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4013")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_9 = arg_19_1:GetWordFromCfg(105121005)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 30
				local var_22_12 = utf8.len(var_22_10)
				local var_22_13 = var_22_11 <= 0 and var_22_7 or var_22_7 * (var_22_12 / var_22_11)

				if var_22_13 > 0 and var_22_7 < var_22_13 then
					arg_19_1.talkMaxDuration = var_22_13

					if var_22_13 + var_22_6 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_13 + var_22_6
					end
				end

				arg_19_1.text_.text = var_22_10
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121005", "story_v_out_105121.awb") ~= 0 then
					local var_22_14 = manager.audio:GetVoiceLength("story_v_out_105121", "105121005", "story_v_out_105121.awb") / 1000

					if var_22_14 + var_22_6 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_14 + var_22_6
					end

					if var_22_9.prefab_name ~= "" and arg_19_1.actors_[var_22_9.prefab_name] ~= nil then
						local var_22_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_9.prefab_name].transform, "story_v_out_105121", "105121005", "story_v_out_105121.awb")

						arg_19_1:RecordAudio("105121005", var_22_15)
						arg_19_1:RecordAudio("105121005", var_22_15)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_105121", "105121005", "story_v_out_105121.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_105121", "105121005", "story_v_out_105121.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_16 = math.max(var_22_7, arg_19_1.talkMaxDuration)

			if var_22_6 <= arg_19_1.time_ and arg_19_1.time_ < var_22_6 + var_22_16 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_6) / var_22_16

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_6 + var_22_16 and arg_19_1.time_ < var_22_6 + var_22_16 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play105121006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 105121006
		arg_23_1.duration_ = 1.999999999999

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play105121007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "1019ui_story"

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

			local var_26_4 = arg_23_1.actors_["1019ui_story"]
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 and arg_23_1.var_.characterEffect1019ui_story == nil then
				arg_23_1.var_.characterEffect1019ui_story = var_26_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_6 = 0.1

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6

				if arg_23_1.var_.characterEffect1019ui_story then
					arg_23_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 and arg_23_1.var_.characterEffect1019ui_story then
				arg_23_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_26_8 = arg_23_1.actors_["1019ui_story"].transform
			local var_26_9 = 0

			if var_26_9 < arg_23_1.time_ and arg_23_1.time_ <= var_26_9 + arg_26_0 then
				arg_23_1.var_.moveOldPos1019ui_story = var_26_8.localPosition
			end

			local var_26_10 = 0.001

			if var_26_9 <= arg_23_1.time_ and arg_23_1.time_ < var_26_9 + var_26_10 then
				local var_26_11 = (arg_23_1.time_ - var_26_9) / var_26_10
				local var_26_12 = Vector3.New(-0.7, -1.08, -5.9)

				var_26_8.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1019ui_story, var_26_12, var_26_11)

				local var_26_13 = manager.ui.mainCamera.transform.position - var_26_8.position

				var_26_8.forward = Vector3.New(var_26_13.x, var_26_13.y, var_26_13.z)

				local var_26_14 = var_26_8.localEulerAngles

				var_26_14.z = 0
				var_26_14.x = 0
				var_26_8.localEulerAngles = var_26_14
			end

			if arg_23_1.time_ >= var_26_9 + var_26_10 and arg_23_1.time_ < var_26_9 + var_26_10 + arg_26_0 then
				var_26_8.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_26_15 = manager.ui.mainCamera.transform.position - var_26_8.position

				var_26_8.forward = Vector3.New(var_26_15.x, var_26_15.y, var_26_15.z)

				local var_26_16 = var_26_8.localEulerAngles

				var_26_16.z = 0
				var_26_16.x = 0
				var_26_8.localEulerAngles = var_26_16
			end

			local var_26_17 = 0

			if var_26_17 < arg_23_1.time_ and arg_23_1.time_ <= var_26_17 + arg_26_0 then
				arg_23_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action4_1")
			end

			local var_26_18 = 0

			if var_26_18 < arg_23_1.time_ and arg_23_1.time_ <= var_26_18 + arg_26_0 then
				arg_23_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_26_19 = 0
			local var_26_20 = 0.175

			if var_26_19 < arg_23_1.time_ and arg_23_1.time_ <= var_26_19 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_21 = arg_23_1:FormatText(StoryNameCfg[13].name)

				arg_23_1.leftNameTxt_.text = var_26_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_22 = arg_23_1:GetWordFromCfg(105121006)
				local var_26_23 = arg_23_1:FormatText(var_26_22.content)

				arg_23_1.text_.text = var_26_23

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_24 = 7
				local var_26_25 = utf8.len(var_26_23)
				local var_26_26 = var_26_24 <= 0 and var_26_20 or var_26_20 * (var_26_25 / var_26_24)

				if var_26_26 > 0 and var_26_20 < var_26_26 then
					arg_23_1.talkMaxDuration = var_26_26

					if var_26_26 + var_26_19 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_26 + var_26_19
					end
				end

				arg_23_1.text_.text = var_26_23
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121006", "story_v_out_105121.awb") ~= 0 then
					local var_26_27 = manager.audio:GetVoiceLength("story_v_out_105121", "105121006", "story_v_out_105121.awb") / 1000

					if var_26_27 + var_26_19 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_27 + var_26_19
					end

					if var_26_22.prefab_name ~= "" and arg_23_1.actors_[var_26_22.prefab_name] ~= nil then
						local var_26_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_22.prefab_name].transform, "story_v_out_105121", "105121006", "story_v_out_105121.awb")

						arg_23_1:RecordAudio("105121006", var_26_28)
						arg_23_1:RecordAudio("105121006", var_26_28)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_105121", "105121006", "story_v_out_105121.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_105121", "105121006", "story_v_out_105121.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_29 = math.max(var_26_20, arg_23_1.talkMaxDuration)

			if var_26_19 <= arg_23_1.time_ and arg_23_1.time_ < var_26_19 + var_26_29 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_19) / var_26_29

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_19 + var_26_29 and arg_23_1.time_ < var_26_19 + var_26_29 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play105121007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 105121007
		arg_27_1.duration_ = 1.999999999999

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play105121008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = "1084ui_story"

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

			local var_30_4 = arg_27_1.actors_["1084ui_story"]
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 and arg_27_1.var_.characterEffect1084ui_story == nil then
				arg_27_1.var_.characterEffect1084ui_story = var_30_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_6 = 0.1

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6

				if arg_27_1.var_.characterEffect1084ui_story then
					arg_27_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 and arg_27_1.var_.characterEffect1084ui_story then
				arg_27_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_30_8 = arg_27_1.actors_["1019ui_story"]
			local var_30_9 = 0

			if var_30_9 < arg_27_1.time_ and arg_27_1.time_ <= var_30_9 + arg_30_0 and arg_27_1.var_.characterEffect1019ui_story == nil then
				arg_27_1.var_.characterEffect1019ui_story = var_30_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_10 = 0.1

			if var_30_9 <= arg_27_1.time_ and arg_27_1.time_ < var_30_9 + var_30_10 then
				local var_30_11 = (arg_27_1.time_ - var_30_9) / var_30_10

				if arg_27_1.var_.characterEffect1019ui_story then
					local var_30_12 = Mathf.Lerp(0, 0.5, var_30_11)

					arg_27_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1019ui_story.fillRatio = var_30_12
				end
			end

			if arg_27_1.time_ >= var_30_9 + var_30_10 and arg_27_1.time_ < var_30_9 + var_30_10 + arg_30_0 and arg_27_1.var_.characterEffect1019ui_story then
				local var_30_13 = 0.5

				arg_27_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1019ui_story.fillRatio = var_30_13
			end

			local var_30_14 = arg_27_1.actors_["1084ui_story"].transform
			local var_30_15 = 0

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 then
				arg_27_1.var_.moveOldPos1084ui_story = var_30_14.localPosition

				local var_30_16 = "1084ui_story"

				arg_27_1:ShowWeapon(arg_27_1.var_[var_30_16 .. "Animator"].transform, true)
			end

			local var_30_17 = 0.001

			if var_30_15 <= arg_27_1.time_ and arg_27_1.time_ < var_30_15 + var_30_17 then
				local var_30_18 = (arg_27_1.time_ - var_30_15) / var_30_17
				local var_30_19 = Vector3.New(0.7, -0.97, -6)

				var_30_14.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1084ui_story, var_30_19, var_30_18)

				local var_30_20 = manager.ui.mainCamera.transform.position - var_30_14.position

				var_30_14.forward = Vector3.New(var_30_20.x, var_30_20.y, var_30_20.z)

				local var_30_21 = var_30_14.localEulerAngles

				var_30_21.z = 0
				var_30_21.x = 0
				var_30_14.localEulerAngles = var_30_21
			end

			if arg_27_1.time_ >= var_30_15 + var_30_17 and arg_27_1.time_ < var_30_15 + var_30_17 + arg_30_0 then
				var_30_14.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_30_22 = manager.ui.mainCamera.transform.position - var_30_14.position

				var_30_14.forward = Vector3.New(var_30_22.x, var_30_22.y, var_30_22.z)

				local var_30_23 = var_30_14.localEulerAngles

				var_30_23.z = 0
				var_30_23.x = 0
				var_30_14.localEulerAngles = var_30_23
			end

			local var_30_24 = 0

			if var_30_24 < arg_27_1.time_ and arg_27_1.time_ <= var_30_24 + arg_30_0 then
				arg_27_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_1")
			end

			local var_30_25 = 0

			if var_30_25 < arg_27_1.time_ and arg_27_1.time_ <= var_30_25 + arg_30_0 then
				arg_27_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_30_26 = 0
			local var_30_27 = 0.125

			if var_30_26 < arg_27_1.time_ and arg_27_1.time_ <= var_30_26 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_28 = arg_27_1:FormatText(StoryNameCfg[6].name)

				arg_27_1.leftNameTxt_.text = var_30_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_29 = arg_27_1:GetWordFromCfg(105121007)
				local var_30_30 = arg_27_1:FormatText(var_30_29.content)

				arg_27_1.text_.text = var_30_30

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_31 = 5
				local var_30_32 = utf8.len(var_30_30)
				local var_30_33 = var_30_31 <= 0 and var_30_27 or var_30_27 * (var_30_32 / var_30_31)

				if var_30_33 > 0 and var_30_27 < var_30_33 then
					arg_27_1.talkMaxDuration = var_30_33

					if var_30_33 + var_30_26 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_33 + var_30_26
					end
				end

				arg_27_1.text_.text = var_30_30
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121007", "story_v_out_105121.awb") ~= 0 then
					local var_30_34 = manager.audio:GetVoiceLength("story_v_out_105121", "105121007", "story_v_out_105121.awb") / 1000

					if var_30_34 + var_30_26 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_34 + var_30_26
					end

					if var_30_29.prefab_name ~= "" and arg_27_1.actors_[var_30_29.prefab_name] ~= nil then
						local var_30_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_29.prefab_name].transform, "story_v_out_105121", "105121007", "story_v_out_105121.awb")

						arg_27_1:RecordAudio("105121007", var_30_35)
						arg_27_1:RecordAudio("105121007", var_30_35)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_105121", "105121007", "story_v_out_105121.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_105121", "105121007", "story_v_out_105121.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_36 = math.max(var_30_27, arg_27_1.talkMaxDuration)

			if var_30_26 <= arg_27_1.time_ and arg_27_1.time_ < var_30_26 + var_30_36 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_26) / var_30_36

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_26 + var_30_36 and arg_27_1.time_ < var_30_26 + var_30_36 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play105121008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 105121008
		arg_31_1.duration_ = 5.60000002384186

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play105121009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 1

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				local var_34_2 = "play"
				local var_34_3 = "effect"

				arg_31_1:AudioAction(var_34_2, var_34_3, "se_story_5", "se_story_5_bosscollapse", "")
			end

			local var_34_4 = 0
			local var_34_5 = 1

			if var_34_4 < arg_31_1.time_ and arg_31_1.time_ <= var_34_4 + arg_34_0 then
				local var_34_6 = "play"
				local var_34_7 = "effect"

				arg_31_1:AudioAction(var_34_6, var_34_7, "se_story_5", "se_story_5_bossflee", "")
			end

			local var_34_8 = manager.ui.mainCamera.transform
			local var_34_9 = 0

			if var_34_9 < arg_31_1.time_ and arg_31_1.time_ <= var_34_9 + arg_34_0 then
				arg_31_1.var_.shakeOldPosMainCamera = var_34_8.localPosition
			end

			local var_34_10 = 0.600000023841858

			if var_34_9 <= arg_31_1.time_ and arg_31_1.time_ < var_34_9 + var_34_10 then
				local var_34_11 = (arg_31_1.time_ - var_34_9) / 0.066
				local var_34_12, var_34_13 = math.modf(var_34_11)

				var_34_8.localPosition = Vector3.New(var_34_13 * 0.13, var_34_13 * 0.13, var_34_13 * 0.13) + arg_31_1.var_.shakeOldPosMainCamera
			end

			if arg_31_1.time_ >= var_34_9 + var_34_10 and arg_31_1.time_ < var_34_9 + var_34_10 + arg_34_0 then
				var_34_8.localPosition = arg_31_1.var_.shakeOldPosMainCamera
			end

			local var_34_14 = arg_31_1.actors_["1019ui_story"].transform
			local var_34_15 = 0

			if var_34_15 < arg_31_1.time_ and arg_31_1.time_ <= var_34_15 + arg_34_0 then
				arg_31_1.var_.moveOldPos1019ui_story = var_34_14.localPosition
			end

			local var_34_16 = 0.001

			if var_34_15 <= arg_31_1.time_ and arg_31_1.time_ < var_34_15 + var_34_16 then
				local var_34_17 = (arg_31_1.time_ - var_34_15) / var_34_16
				local var_34_18 = Vector3.New(0, 100, 0)

				var_34_14.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1019ui_story, var_34_18, var_34_17)

				local var_34_19 = manager.ui.mainCamera.transform.position - var_34_14.position

				var_34_14.forward = Vector3.New(var_34_19.x, var_34_19.y, var_34_19.z)

				local var_34_20 = var_34_14.localEulerAngles

				var_34_20.z = 0
				var_34_20.x = 0
				var_34_14.localEulerAngles = var_34_20
			end

			if arg_31_1.time_ >= var_34_15 + var_34_16 and arg_31_1.time_ < var_34_15 + var_34_16 + arg_34_0 then
				var_34_14.localPosition = Vector3.New(0, 100, 0)

				local var_34_21 = manager.ui.mainCamera.transform.position - var_34_14.position

				var_34_14.forward = Vector3.New(var_34_21.x, var_34_21.y, var_34_21.z)

				local var_34_22 = var_34_14.localEulerAngles

				var_34_22.z = 0
				var_34_22.x = 0
				var_34_14.localEulerAngles = var_34_22
			end

			local var_34_23 = arg_31_1.actors_["1084ui_story"].transform
			local var_34_24 = 0

			if var_34_24 < arg_31_1.time_ and arg_31_1.time_ <= var_34_24 + arg_34_0 then
				arg_31_1.var_.moveOldPos1084ui_story = var_34_23.localPosition

				local var_34_25 = "1084ui_story"

				arg_31_1:ShowWeapon(arg_31_1.var_[var_34_25 .. "Animator"].transform, false)
			end

			local var_34_26 = 0.001

			if var_34_24 <= arg_31_1.time_ and arg_31_1.time_ < var_34_24 + var_34_26 then
				local var_34_27 = (arg_31_1.time_ - var_34_24) / var_34_26
				local var_34_28 = Vector3.New(0, 100, 0)

				var_34_23.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1084ui_story, var_34_28, var_34_27)

				local var_34_29 = manager.ui.mainCamera.transform.position - var_34_23.position

				var_34_23.forward = Vector3.New(var_34_29.x, var_34_29.y, var_34_29.z)

				local var_34_30 = var_34_23.localEulerAngles

				var_34_30.z = 0
				var_34_30.x = 0
				var_34_23.localEulerAngles = var_34_30
			end

			if arg_31_1.time_ >= var_34_24 + var_34_26 and arg_31_1.time_ < var_34_24 + var_34_26 + arg_34_0 then
				var_34_23.localPosition = Vector3.New(0, 100, 0)

				local var_34_31 = manager.ui.mainCamera.transform.position - var_34_23.position

				var_34_23.forward = Vector3.New(var_34_31.x, var_34_31.y, var_34_31.z)

				local var_34_32 = var_34_23.localEulerAngles

				var_34_32.z = 0
				var_34_32.x = 0
				var_34_23.localEulerAngles = var_34_32
			end

			local var_34_33 = 0

			if var_34_33 < arg_31_1.time_ and arg_31_1.time_ <= var_34_33 + arg_34_0 then
				arg_31_1.mask_.enabled = true
				arg_31_1.mask_.raycastTarget = true

				arg_31_1:SetGaussion(false)
			end

			local var_34_34 = 0.5

			if var_34_33 <= arg_31_1.time_ and arg_31_1.time_ < var_34_33 + var_34_34 then
				local var_34_35 = (arg_31_1.time_ - var_34_33) / var_34_34
				local var_34_36 = Color.New(1, 1, 1)

				var_34_36.a = Mathf.Lerp(1, 0, var_34_35)
				arg_31_1.mask_.color = var_34_36
			end

			if arg_31_1.time_ >= var_34_33 + var_34_34 and arg_31_1.time_ < var_34_33 + var_34_34 + arg_34_0 then
				local var_34_37 = Color.New(1, 1, 1)
				local var_34_38 = 0

				arg_31_1.mask_.enabled = false
				var_34_37.a = var_34_38
				arg_31_1.mask_.color = var_34_37
			end

			if arg_31_1.frameCnt_ <= 1 then
				arg_31_1.dialog_:SetActive(false)
			end

			local var_34_39 = 0.600000023841858
			local var_34_40 = 0.65

			if var_34_39 < arg_31_1.time_ and arg_31_1.time_ <= var_34_39 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0

				arg_31_1.dialog_:SetActive(true)

				local var_34_41 = LeanTween.value(arg_31_1.dialog_, 0, 1, 0.3)

				var_34_41:setOnUpdate(LuaHelper.FloatAction(function(arg_35_0)
					arg_31_1.dialogCg_.alpha = arg_35_0
				end))
				var_34_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_31_1.dialog_)
					var_34_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_31_1.duration_ = arg_31_1.duration_ + 0.3

				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_42 = arg_31_1:GetWordFromCfg(105121008)
				local var_34_43 = arg_31_1:FormatText(var_34_42.content)

				arg_31_1.text_.text = var_34_43

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_44 = 26
				local var_34_45 = utf8.len(var_34_43)
				local var_34_46 = var_34_44 <= 0 and var_34_40 or var_34_40 * (var_34_45 / var_34_44)

				if var_34_46 > 0 and var_34_40 < var_34_46 then
					arg_31_1.talkMaxDuration = var_34_46
					var_34_39 = var_34_39 + 0.3

					if var_34_46 + var_34_39 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_46 + var_34_39
					end
				end

				arg_31_1.text_.text = var_34_43
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_47 = var_34_39 + 0.3
			local var_34_48 = math.max(var_34_40, arg_31_1.talkMaxDuration)

			if var_34_47 <= arg_31_1.time_ and arg_31_1.time_ < var_34_47 + var_34_48 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_47) / var_34_48

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_47 + var_34_48 and arg_31_1.time_ < var_34_47 + var_34_48 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play105121009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 105121009
		arg_37_1.duration_ = 6

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play105121010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = 1

			if var_40_0 < arg_37_1.time_ and arg_37_1.time_ <= var_40_0 + arg_40_0 then
				arg_37_1.mask_.enabled = true
				arg_37_1.mask_.raycastTarget = false

				arg_37_1:SetGaussion(false)
			end

			local var_40_1 = 1

			if var_40_0 <= arg_37_1.time_ and arg_37_1.time_ < var_40_0 + var_40_1 then
				local var_40_2 = (arg_37_1.time_ - var_40_0) / var_40_1
				local var_40_3 = Color.New(1, 1, 1)

				var_40_3.a = Mathf.Lerp(1, 0, var_40_2)
				arg_37_1.mask_.color = var_40_3
			end

			if arg_37_1.time_ >= var_40_0 + var_40_1 and arg_37_1.time_ < var_40_0 + var_40_1 + arg_40_0 then
				local var_40_4 = Color.New(1, 1, 1)
				local var_40_5 = 0

				arg_37_1.mask_.enabled = false
				var_40_4.a = var_40_5
				arg_37_1.mask_.color = var_40_4
			end

			local var_40_6 = 0

			if var_40_6 < arg_37_1.time_ and arg_37_1.time_ <= var_40_6 + arg_40_0 then
				arg_37_1.mask_.enabled = true
				arg_37_1.mask_.raycastTarget = false

				arg_37_1:SetGaussion(false)
			end

			local var_40_7 = 1

			if var_40_6 <= arg_37_1.time_ and arg_37_1.time_ < var_40_6 + var_40_7 then
				local var_40_8 = (arg_37_1.time_ - var_40_6) / var_40_7
				local var_40_9 = Color.New(1, 1, 1)

				var_40_9.a = Mathf.Lerp(0, 1, var_40_8)
				arg_37_1.mask_.color = var_40_9
			end

			if arg_37_1.time_ >= var_40_6 + var_40_7 and arg_37_1.time_ < var_40_6 + var_40_7 + arg_40_0 then
				local var_40_10 = Color.New(1, 1, 1)

				var_40_10.a = 1
				arg_37_1.mask_.color = var_40_10
			end

			local var_40_11 = "S0505"

			if arg_37_1.bgs_[var_40_11] == nil then
				local var_40_12 = Object.Instantiate(arg_37_1.paintGo_)

				var_40_12:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_40_11)
				var_40_12.name = var_40_11
				var_40_12.transform.parent = arg_37_1.stage_.transform
				var_40_12.transform.localPosition = Vector3.New(0, 100, 0)
				arg_37_1.bgs_[var_40_11] = var_40_12
			end

			local var_40_13 = 1

			if var_40_13 < arg_37_1.time_ and arg_37_1.time_ <= var_40_13 + arg_40_0 then
				local var_40_14 = manager.ui.mainCamera.transform.localPosition
				local var_40_15 = Vector3.New(0, 0, 10) + Vector3.New(var_40_14.x, var_40_14.y, 0)
				local var_40_16 = arg_37_1.bgs_.S0505

				var_40_16.transform.localPosition = var_40_15
				var_40_16.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_40_17 = var_40_16:GetComponent("SpriteRenderer")

				if var_40_17 and var_40_17.sprite then
					local var_40_18 = (var_40_16.transform.localPosition - var_40_14).z
					local var_40_19 = manager.ui.mainCameraCom_
					local var_40_20 = 2 * var_40_18 * Mathf.Tan(var_40_19.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_40_21 = var_40_20 * var_40_19.aspect
					local var_40_22 = var_40_17.sprite.bounds.size.x
					local var_40_23 = var_40_17.sprite.bounds.size.y
					local var_40_24 = var_40_21 / var_40_22
					local var_40_25 = var_40_20 / var_40_23
					local var_40_26 = var_40_25 < var_40_24 and var_40_24 or var_40_25

					var_40_16.transform.localScale = Vector3.New(var_40_26, var_40_26, 0)
				end

				for iter_40_0, iter_40_1 in pairs(arg_37_1.bgs_) do
					if iter_40_0 ~= "S0505" then
						iter_40_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_37_1.frameCnt_ <= 1 then
				arg_37_1.dialog_:SetActive(false)
			end

			local var_40_27 = 1
			local var_40_28 = 1.55

			if var_40_27 < arg_37_1.time_ and arg_37_1.time_ <= var_40_27 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0

				arg_37_1.dialog_:SetActive(true)

				local var_40_29 = LeanTween.value(arg_37_1.dialog_, 0, 1, 0.3)

				var_40_29:setOnUpdate(LuaHelper.FloatAction(function(arg_41_0)
					arg_37_1.dialogCg_.alpha = arg_41_0
				end))
				var_40_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_37_1.dialog_)
					var_40_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_37_1.duration_ = arg_37_1.duration_ + 0.3

				SetActive(arg_37_1.leftNameGo_, false)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_30 = arg_37_1:GetWordFromCfg(105121009)
				local var_40_31 = arg_37_1:FormatText(var_40_30.content)

				arg_37_1.text_.text = var_40_31

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_32 = 62
				local var_40_33 = utf8.len(var_40_31)
				local var_40_34 = var_40_32 <= 0 and var_40_28 or var_40_28 * (var_40_33 / var_40_32)

				if var_40_34 > 0 and var_40_28 < var_40_34 then
					arg_37_1.talkMaxDuration = var_40_34
					var_40_27 = var_40_27 + 0.3

					if var_40_34 + var_40_27 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_34 + var_40_27
					end
				end

				arg_37_1.text_.text = var_40_31
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)
				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_35 = var_40_27 + 0.3
			local var_40_36 = math.max(var_40_28, arg_37_1.talkMaxDuration)

			if var_40_35 <= arg_37_1.time_ and arg_37_1.time_ < var_40_35 + var_40_36 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_35) / var_40_36

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_35 + var_40_36 and arg_37_1.time_ < var_40_35 + var_40_36 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play105121010 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 105121010
		arg_43_1.duration_ = 10.666

		local var_43_0 = {
			ja = 10.666,
			ko = 5.5,
			zh = 8.133,
			en = 9.466
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
				arg_43_0:Play105121011(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.575

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[49].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, true)
				arg_43_1.iconController_:SetSelectedState("hero")

				arg_43_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4013")

				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(105121010)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121010", "story_v_out_105121.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_105121", "105121010", "story_v_out_105121.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_105121", "105121010", "story_v_out_105121.awb")

						arg_43_1:RecordAudio("105121010", var_46_9)
						arg_43_1:RecordAudio("105121010", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_105121", "105121010", "story_v_out_105121.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_105121", "105121010", "story_v_out_105121.awb")
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
	Play105121011 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 105121011
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play105121012(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 1

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				local var_50_2 = "play"
				local var_50_3 = "effect"

				arg_47_1:AudioAction(var_50_2, var_50_3, "se_story_5", "se_story_5_spear", "")
			end

			local var_50_4 = 0
			local var_50_5 = 1.925

			if var_50_4 < arg_47_1.time_ and arg_47_1.time_ <= var_50_4 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_6 = arg_47_1:GetWordFromCfg(105121011)
				local var_50_7 = arg_47_1:FormatText(var_50_6.content)

				arg_47_1.text_.text = var_50_7

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_8 = 77
				local var_50_9 = utf8.len(var_50_7)
				local var_50_10 = var_50_8 <= 0 and var_50_5 or var_50_5 * (var_50_9 / var_50_8)

				if var_50_10 > 0 and var_50_5 < var_50_10 then
					arg_47_1.talkMaxDuration = var_50_10

					if var_50_10 + var_50_4 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_10 + var_50_4
					end
				end

				arg_47_1.text_.text = var_50_7
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_11 = math.max(var_50_5, arg_47_1.talkMaxDuration)

			if var_50_4 <= arg_47_1.time_ and arg_47_1.time_ < var_50_4 + var_50_11 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_4) / var_50_11

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_4 + var_50_11 and arg_47_1.time_ < var_50_4 + var_50_11 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play105121012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 105121012
		arg_51_1.duration_ = 10.5

		local var_51_0 = {
			ja = 9,
			ko = 5,
			zh = 9.433,
			en = 10.5
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
				arg_51_0:Play105121013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.mask_.enabled = true
				arg_51_1.mask_.raycastTarget = true

				arg_51_1:SetGaussion(false)
			end

			local var_54_1 = 0.5

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_1 then
				local var_54_2 = (arg_51_1.time_ - var_54_0) / var_54_1
				local var_54_3 = Color.New(1, 1, 1)

				var_54_3.a = Mathf.Lerp(1, 0, var_54_2)
				arg_51_1.mask_.color = var_54_3
			end

			if arg_51_1.time_ >= var_54_0 + var_54_1 and arg_51_1.time_ < var_54_0 + var_54_1 + arg_54_0 then
				local var_54_4 = Color.New(1, 1, 1)
				local var_54_5 = 0

				arg_51_1.mask_.enabled = false
				var_54_4.a = var_54_5
				arg_51_1.mask_.color = var_54_4
			end

			local var_54_6 = manager.ui.mainCamera.transform
			local var_54_7 = 0

			if var_54_7 < arg_51_1.time_ and arg_51_1.time_ <= var_54_7 + arg_54_0 then
				arg_51_1.var_.shakeOldPosMainCamera = var_54_6.localPosition
			end

			local var_54_8 = 0.600000023841858

			if var_54_7 <= arg_51_1.time_ and arg_51_1.time_ < var_54_7 + var_54_8 then
				local var_54_9 = (arg_51_1.time_ - var_54_7) / 0.066
				local var_54_10, var_54_11 = math.modf(var_54_9)

				var_54_6.localPosition = Vector3.New(var_54_11 * 0.13, var_54_11 * 0.13, var_54_11 * 0.13) + arg_51_1.var_.shakeOldPosMainCamera
			end

			if arg_51_1.time_ >= var_54_7 + var_54_8 and arg_51_1.time_ < var_54_7 + var_54_8 + arg_54_0 then
				var_54_6.localPosition = arg_51_1.var_.shakeOldPosMainCamera
			end

			local var_54_12 = 0.5
			local var_54_13 = 0.4

			if var_54_12 < arg_51_1.time_ and arg_51_1.time_ <= var_54_12 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_14 = arg_51_1:FormatText(StoryNameCfg[49].name)

				arg_51_1.leftNameTxt_.text = var_54_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4013")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_15 = arg_51_1:GetWordFromCfg(105121012)
				local var_54_16 = arg_51_1:FormatText(var_54_15.content)

				arg_51_1.text_.text = var_54_16

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_17 = 16
				local var_54_18 = utf8.len(var_54_16)
				local var_54_19 = var_54_17 <= 0 and var_54_13 or var_54_13 * (var_54_18 / var_54_17)

				if var_54_19 > 0 and var_54_13 < var_54_19 then
					arg_51_1.talkMaxDuration = var_54_19

					if var_54_19 + var_54_12 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_19 + var_54_12
					end
				end

				arg_51_1.text_.text = var_54_16
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121012", "story_v_out_105121.awb") ~= 0 then
					local var_54_20 = manager.audio:GetVoiceLength("story_v_out_105121", "105121012", "story_v_out_105121.awb") / 1000

					if var_54_20 + var_54_12 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_20 + var_54_12
					end

					if var_54_15.prefab_name ~= "" and arg_51_1.actors_[var_54_15.prefab_name] ~= nil then
						local var_54_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_15.prefab_name].transform, "story_v_out_105121", "105121012", "story_v_out_105121.awb")

						arg_51_1:RecordAudio("105121012", var_54_21)
						arg_51_1:RecordAudio("105121012", var_54_21)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_105121", "105121012", "story_v_out_105121.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_105121", "105121012", "story_v_out_105121.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_22 = math.max(var_54_13, arg_51_1.talkMaxDuration)

			if var_54_12 <= arg_51_1.time_ and arg_51_1.time_ < var_54_12 + var_54_22 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_12) / var_54_22

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_12 + var_54_22 and arg_51_1.time_ < var_54_12 + var_54_22 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play105121013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 105121013
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play105121014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 1

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				local var_58_2 = "play"
				local var_58_3 = "effect"

				arg_55_1:AudioAction(var_58_2, var_58_3, "se_story_5", "se_story_5_sword", "")
			end

			local var_58_4 = 0
			local var_58_5 = 1.875

			if var_58_4 < arg_55_1.time_ and arg_55_1.time_ <= var_58_4 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_6 = arg_55_1:GetWordFromCfg(105121013)
				local var_58_7 = arg_55_1:FormatText(var_58_6.content)

				arg_55_1.text_.text = var_58_7

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_8 = 75
				local var_58_9 = utf8.len(var_58_7)
				local var_58_10 = var_58_8 <= 0 and var_58_5 or var_58_5 * (var_58_9 / var_58_8)

				if var_58_10 > 0 and var_58_5 < var_58_10 then
					arg_55_1.talkMaxDuration = var_58_10

					if var_58_10 + var_58_4 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_10 + var_58_4
					end
				end

				arg_55_1.text_.text = var_58_7
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_11 = math.max(var_58_5, arg_55_1.talkMaxDuration)

			if var_58_4 <= arg_55_1.time_ and arg_55_1.time_ < var_58_4 + var_58_11 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_4) / var_58_11

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_4 + var_58_11 and arg_55_1.time_ < var_58_4 + var_58_11 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play105121014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 105121014
		arg_59_1.duration_ = 3.966

		local var_59_0 = {
			ja = 3.166,
			ko = 3.3,
			zh = 3.1,
			en = 3.966
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
				arg_59_0:Play105121015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0.375

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.mask_.enabled = true
				arg_59_1.mask_.raycastTarget = true

				arg_59_1:SetGaussion(false)
			end

			local var_62_1 = 0.5

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_1 then
				local var_62_2 = (arg_59_1.time_ - var_62_0) / var_62_1
				local var_62_3 = Color.New(1, 1, 1)

				var_62_3.a = Mathf.Lerp(1, 0, var_62_2)
				arg_59_1.mask_.color = var_62_3
			end

			if arg_59_1.time_ >= var_62_0 + var_62_1 and arg_59_1.time_ < var_62_0 + var_62_1 + arg_62_0 then
				local var_62_4 = Color.New(1, 1, 1)
				local var_62_5 = 0

				arg_59_1.mask_.enabled = false
				var_62_4.a = var_62_5
				arg_59_1.mask_.color = var_62_4
			end

			local var_62_6 = manager.ui.mainCamera.transform
			local var_62_7 = 0.375

			if var_62_7 < arg_59_1.time_ and arg_59_1.time_ <= var_62_7 + arg_62_0 then
				arg_59_1.var_.shakeOldPosMainCamera = var_62_6.localPosition
			end

			local var_62_8 = 0.600000023841858

			if var_62_7 <= arg_59_1.time_ and arg_59_1.time_ < var_62_7 + var_62_8 then
				local var_62_9 = (arg_59_1.time_ - var_62_7) / 0.066
				local var_62_10, var_62_11 = math.modf(var_62_9)

				var_62_6.localPosition = Vector3.New(var_62_11 * 0.13, var_62_11 * 0.13, var_62_11 * 0.13) + arg_59_1.var_.shakeOldPosMainCamera
			end

			if arg_59_1.time_ >= var_62_7 + var_62_8 and arg_59_1.time_ < var_62_7 + var_62_8 + arg_62_0 then
				var_62_6.localPosition = arg_59_1.var_.shakeOldPosMainCamera
			end

			local var_62_12 = 0

			if var_62_12 < arg_59_1.time_ and arg_59_1.time_ <= var_62_12 + arg_62_0 then
				arg_59_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_62_13 = 0
			local var_62_14 = 0.375

			if var_62_13 < arg_59_1.time_ and arg_59_1.time_ <= var_62_13 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_15 = arg_59_1:FormatText(StoryNameCfg[6].name)

				arg_59_1.leftNameTxt_.text = var_62_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, true)
				arg_59_1.iconController_:SetSelectedState("hero")

				arg_59_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_16 = arg_59_1:GetWordFromCfg(105121014)
				local var_62_17 = arg_59_1:FormatText(var_62_16.content)

				arg_59_1.text_.text = var_62_17

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_18 = 15
				local var_62_19 = utf8.len(var_62_17)
				local var_62_20 = var_62_18 <= 0 and var_62_14 or var_62_14 * (var_62_19 / var_62_18)

				if var_62_20 > 0 and var_62_14 < var_62_20 then
					arg_59_1.talkMaxDuration = var_62_20

					if var_62_20 + var_62_13 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_20 + var_62_13
					end
				end

				arg_59_1.text_.text = var_62_17
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121014", "story_v_out_105121.awb") ~= 0 then
					local var_62_21 = manager.audio:GetVoiceLength("story_v_out_105121", "105121014", "story_v_out_105121.awb") / 1000

					if var_62_21 + var_62_13 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_21 + var_62_13
					end

					if var_62_16.prefab_name ~= "" and arg_59_1.actors_[var_62_16.prefab_name] ~= nil then
						local var_62_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_16.prefab_name].transform, "story_v_out_105121", "105121014", "story_v_out_105121.awb")

						arg_59_1:RecordAudio("105121014", var_62_22)
						arg_59_1:RecordAudio("105121014", var_62_22)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_105121", "105121014", "story_v_out_105121.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_105121", "105121014", "story_v_out_105121.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_23 = math.max(var_62_14, arg_59_1.talkMaxDuration)

			if var_62_13 <= arg_59_1.time_ and arg_59_1.time_ < var_62_13 + var_62_23 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_13) / var_62_23

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_13 + var_62_23 and arg_59_1.time_ < var_62_13 + var_62_23 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play105121015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 105121015
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play105121016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 1

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				local var_66_2 = "play"
				local var_66_3 = "effect"

				arg_63_1:AudioAction(var_66_2, var_66_3, "se_story_5", "se_story_5_heartbeat", "")
			end

			local var_66_4 = 0
			local var_66_5 = 1.225

			if var_66_4 < arg_63_1.time_ and arg_63_1.time_ <= var_66_4 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_6 = arg_63_1:GetWordFromCfg(105121015)
				local var_66_7 = arg_63_1:FormatText(var_66_6.content)

				arg_63_1.text_.text = var_66_7

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_8 = 49
				local var_66_9 = utf8.len(var_66_7)
				local var_66_10 = var_66_8 <= 0 and var_66_5 or var_66_5 * (var_66_9 / var_66_8)

				if var_66_10 > 0 and var_66_5 < var_66_10 then
					arg_63_1.talkMaxDuration = var_66_10

					if var_66_10 + var_66_4 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_10 + var_66_4
					end
				end

				arg_63_1.text_.text = var_66_7
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_11 = math.max(var_66_5, arg_63_1.talkMaxDuration)

			if var_66_4 <= arg_63_1.time_ and arg_63_1.time_ < var_66_4 + var_66_11 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_4) / var_66_11

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_4 + var_66_11 and arg_63_1.time_ < var_66_4 + var_66_11 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play105121016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 105121016
		arg_67_1.duration_ = 4.4

		local var_67_0 = {
			ja = 4.4,
			ko = 3.2,
			zh = 3.333,
			en = 3.2
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
				arg_67_0:Play105121017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_70_1 = 0
			local var_70_2 = 0.425

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_3 = arg_67_1:FormatText(StoryNameCfg[13].name)

				arg_67_1.leftNameTxt_.text = var_70_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, true)
				arg_67_1.iconController_:SetSelectedState("hero")

				arg_67_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_4 = arg_67_1:GetWordFromCfg(105121016)
				local var_70_5 = arg_67_1:FormatText(var_70_4.content)

				arg_67_1.text_.text = var_70_5

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_6 = 17
				local var_70_7 = utf8.len(var_70_5)
				local var_70_8 = var_70_6 <= 0 and var_70_2 or var_70_2 * (var_70_7 / var_70_6)

				if var_70_8 > 0 and var_70_2 < var_70_8 then
					arg_67_1.talkMaxDuration = var_70_8

					if var_70_8 + var_70_1 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_8 + var_70_1
					end
				end

				arg_67_1.text_.text = var_70_5
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121016", "story_v_out_105121.awb") ~= 0 then
					local var_70_9 = manager.audio:GetVoiceLength("story_v_out_105121", "105121016", "story_v_out_105121.awb") / 1000

					if var_70_9 + var_70_1 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_9 + var_70_1
					end

					if var_70_4.prefab_name ~= "" and arg_67_1.actors_[var_70_4.prefab_name] ~= nil then
						local var_70_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_4.prefab_name].transform, "story_v_out_105121", "105121016", "story_v_out_105121.awb")

						arg_67_1:RecordAudio("105121016", var_70_10)
						arg_67_1:RecordAudio("105121016", var_70_10)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_105121", "105121016", "story_v_out_105121.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_105121", "105121016", "story_v_out_105121.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_11 = math.max(var_70_2, arg_67_1.talkMaxDuration)

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_11 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_1) / var_70_11

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_1 + var_70_11 and arg_67_1.time_ < var_70_1 + var_70_11 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play105121017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 105121017
		arg_71_1.duration_ = 7.333

		local var_71_0 = {
			ja = 6.966,
			ko = 5.1,
			zh = 5.166,
			en = 7.333
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
				arg_71_0:Play105121018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0.575

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.mask_.enabled = true
				arg_71_1.mask_.raycastTarget = true

				arg_71_1:SetGaussion(false)
			end

			local var_74_1 = 0.5

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_1 then
				local var_74_2 = (arg_71_1.time_ - var_74_0) / var_74_1
				local var_74_3 = Color.New(1, 1, 1)

				var_74_3.a = Mathf.Lerp(1, 0, var_74_2)
				arg_71_1.mask_.color = var_74_3
			end

			if arg_71_1.time_ >= var_74_0 + var_74_1 and arg_71_1.time_ < var_74_0 + var_74_1 + arg_74_0 then
				local var_74_4 = Color.New(1, 1, 1)
				local var_74_5 = 0

				arg_71_1.mask_.enabled = false
				var_74_4.a = var_74_5
				arg_71_1.mask_.color = var_74_4
			end

			local var_74_6 = manager.ui.mainCamera.transform
			local var_74_7 = 0.575

			if var_74_7 < arg_71_1.time_ and arg_71_1.time_ <= var_74_7 + arg_74_0 then
				arg_71_1.var_.shakeOldPosMainCamera = var_74_6.localPosition
			end

			local var_74_8 = 0.600000023841858

			if var_74_7 <= arg_71_1.time_ and arg_71_1.time_ < var_74_7 + var_74_8 then
				local var_74_9 = (arg_71_1.time_ - var_74_7) / 0.066
				local var_74_10, var_74_11 = math.modf(var_74_9)

				var_74_6.localPosition = Vector3.New(var_74_11 * 0.13, var_74_11 * 0.13, var_74_11 * 0.13) + arg_71_1.var_.shakeOldPosMainCamera
			end

			if arg_71_1.time_ >= var_74_7 + var_74_8 and arg_71_1.time_ < var_74_7 + var_74_8 + arg_74_0 then
				var_74_6.localPosition = arg_71_1.var_.shakeOldPosMainCamera
			end

			local var_74_12 = 0
			local var_74_13 = 0.575

			if var_74_12 < arg_71_1.time_ and arg_71_1.time_ <= var_74_12 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_14 = arg_71_1:FormatText(StoryNameCfg[6].name)

				arg_71_1.leftNameTxt_.text = var_74_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, true)
				arg_71_1.iconController_:SetSelectedState("hero")

				arg_71_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_15 = arg_71_1:GetWordFromCfg(105121017)
				local var_74_16 = arg_71_1:FormatText(var_74_15.content)

				arg_71_1.text_.text = var_74_16

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_17 = 23
				local var_74_18 = utf8.len(var_74_16)
				local var_74_19 = var_74_17 <= 0 and var_74_13 or var_74_13 * (var_74_18 / var_74_17)

				if var_74_19 > 0 and var_74_13 < var_74_19 then
					arg_71_1.talkMaxDuration = var_74_19

					if var_74_19 + var_74_12 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_19 + var_74_12
					end
				end

				arg_71_1.text_.text = var_74_16
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121017", "story_v_out_105121.awb") ~= 0 then
					local var_74_20 = manager.audio:GetVoiceLength("story_v_out_105121", "105121017", "story_v_out_105121.awb") / 1000

					if var_74_20 + var_74_12 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_20 + var_74_12
					end

					if var_74_15.prefab_name ~= "" and arg_71_1.actors_[var_74_15.prefab_name] ~= nil then
						local var_74_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_15.prefab_name].transform, "story_v_out_105121", "105121017", "story_v_out_105121.awb")

						arg_71_1:RecordAudio("105121017", var_74_21)
						arg_71_1:RecordAudio("105121017", var_74_21)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_105121", "105121017", "story_v_out_105121.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_105121", "105121017", "story_v_out_105121.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_22 = math.max(var_74_13, arg_71_1.talkMaxDuration)

			if var_74_12 <= arg_71_1.time_ and arg_71_1.time_ < var_74_12 + var_74_22 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_12) / var_74_22

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_12 + var_74_22 and arg_71_1.time_ < var_74_12 + var_74_22 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play105121018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 105121018
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play105121019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 1

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				local var_78_2 = "play"
				local var_78_3 = "effect"

				arg_75_1:AudioAction(var_78_2, var_78_3, "se_story_5", "se_story_5_lastcharge", "")
			end

			local var_78_4 = 0
			local var_78_5 = 0.4

			if var_78_4 < arg_75_1.time_ and arg_75_1.time_ <= var_78_4 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, false)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_6 = arg_75_1:GetWordFromCfg(105121018)
				local var_78_7 = arg_75_1:FormatText(var_78_6.content)

				arg_75_1.text_.text = var_78_7

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_8 = 16
				local var_78_9 = utf8.len(var_78_7)
				local var_78_10 = var_78_8 <= 0 and var_78_5 or var_78_5 * (var_78_9 / var_78_8)

				if var_78_10 > 0 and var_78_5 < var_78_10 then
					arg_75_1.talkMaxDuration = var_78_10

					if var_78_10 + var_78_4 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_10 + var_78_4
					end
				end

				arg_75_1.text_.text = var_78_7
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_11 = math.max(var_78_5, arg_75_1.talkMaxDuration)

			if var_78_4 <= arg_75_1.time_ and arg_75_1.time_ < var_78_4 + var_78_11 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_4) / var_78_11

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_4 + var_78_11 and arg_75_1.time_ < var_78_4 + var_78_11 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play105121019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 105121019
		arg_79_1.duration_ = 6.5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play105121020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 1

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				local var_82_2 = "play"
				local var_82_3 = "effect"

				arg_79_1:AudioAction(var_82_2, var_82_3, "se_story_5", "se_story_5_laststrike", "")
			end

			local var_82_4 = 0
			local var_82_5 = 1

			if var_82_4 < arg_79_1.time_ and arg_79_1.time_ <= var_82_4 + arg_82_0 then
				local var_82_6 = "stop"
				local var_82_7 = "effect"

				arg_79_1:AudioAction(var_82_6, var_82_7, "se_story_5", "se_story_5_steamloop", "")
			end

			local var_82_8 = 0
			local var_82_9 = 1

			if var_82_8 < arg_79_1.time_ and arg_79_1.time_ <= var_82_8 + arg_82_0 then
				local var_82_10 = "stop"
				local var_82_11 = "effect"

				arg_79_1:AudioAction(var_82_10, var_82_11, "se_story_5", "se_story_5_bossflee", "")
			end

			local var_82_12 = 0
			local var_82_13 = 1

			if var_82_12 < arg_79_1.time_ and arg_79_1.time_ <= var_82_12 + arg_82_0 then
				local var_82_14 = "stop"
				local var_82_15 = "effect"

				arg_79_1:AudioAction(var_82_14, var_82_15, "se_story_5", "se_story_5_heartbeat", "")
			end

			local var_82_16 = 0

			if var_82_16 < arg_79_1.time_ and arg_79_1.time_ <= var_82_16 + arg_82_0 then
				arg_79_1.mask_.enabled = true
				arg_79_1.mask_.raycastTarget = true

				arg_79_1:SetGaussion(false)
			end

			local var_82_17 = 1.5

			if var_82_16 <= arg_79_1.time_ and arg_79_1.time_ < var_82_16 + var_82_17 then
				local var_82_18 = (arg_79_1.time_ - var_82_16) / var_82_17
				local var_82_19 = Color.New(1, 1, 1)

				var_82_19.a = Mathf.Lerp(0, 1, var_82_18)
				arg_79_1.mask_.color = var_82_19
			end

			if arg_79_1.time_ >= var_82_16 + var_82_17 and arg_79_1.time_ < var_82_16 + var_82_17 + arg_82_0 then
				local var_82_20 = Color.New(1, 1, 1)

				var_82_20.a = 1
				arg_79_1.mask_.color = var_82_20
			end

			local var_82_21 = 1.49999999999999

			if var_82_21 < arg_79_1.time_ and arg_79_1.time_ <= var_82_21 + arg_82_0 then
				arg_79_1.mask_.enabled = true
				arg_79_1.mask_.raycastTarget = false

				arg_79_1:SetGaussion(false)
			end

			local var_82_22 = 1.5

			if var_82_21 <= arg_79_1.time_ and arg_79_1.time_ < var_82_21 + var_82_22 then
				local var_82_23 = (arg_79_1.time_ - var_82_21) / var_82_22
				local var_82_24 = Color.New(1, 1, 1)

				var_82_24.a = Mathf.Lerp(1, 0, var_82_23)
				arg_79_1.mask_.color = var_82_24
			end

			if arg_79_1.time_ >= var_82_21 + var_82_22 and arg_79_1.time_ < var_82_21 + var_82_22 + arg_82_0 then
				local var_82_25 = Color.New(1, 1, 1)
				local var_82_26 = 0

				arg_79_1.mask_.enabled = false
				var_82_25.a = var_82_26
				arg_79_1.mask_.color = var_82_25
			end

			local var_82_27 = manager.ui.mainCamera.transform
			local var_82_28 = 0

			if var_82_28 < arg_79_1.time_ and arg_79_1.time_ <= var_82_28 + arg_82_0 then
				arg_79_1.var_.shakeOldPosMainCamera = var_82_27.localPosition
			end

			local var_82_29 = 0.600000023841858

			if var_82_28 <= arg_79_1.time_ and arg_79_1.time_ < var_82_28 + var_82_29 then
				local var_82_30 = (arg_79_1.time_ - var_82_28) / 0.066
				local var_82_31, var_82_32 = math.modf(var_82_30)

				var_82_27.localPosition = Vector3.New(var_82_32 * 0.13, var_82_32 * 0.13, var_82_32 * 0.13) + arg_79_1.var_.shakeOldPosMainCamera
			end

			if arg_79_1.time_ >= var_82_28 + var_82_29 and arg_79_1.time_ < var_82_28 + var_82_29 + arg_82_0 then
				var_82_27.localPosition = arg_79_1.var_.shakeOldPosMainCamera
			end

			local var_82_33 = arg_79_1.bgs_.S0505.transform
			local var_82_34 = 1.5

			if var_82_34 < arg_79_1.time_ and arg_79_1.time_ <= var_82_34 + arg_82_0 then
				arg_79_1.var_.moveOldPosS0505 = var_82_33.localPosition
			end

			local var_82_35 = 0.001

			if var_82_34 <= arg_79_1.time_ and arg_79_1.time_ < var_82_34 + var_82_35 then
				local var_82_36 = (arg_79_1.time_ - var_82_34) / var_82_35
				local var_82_37 = Vector3.New(0, -100, 0)

				var_82_33.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPosS0505, var_82_37, var_82_36)
			end

			if arg_79_1.time_ >= var_82_34 + var_82_35 and arg_79_1.time_ < var_82_34 + var_82_35 + arg_82_0 then
				var_82_33.localPosition = Vector3.New(0, -100, 0)
			end

			local var_82_38 = "STwhite"

			if arg_79_1.bgs_[var_82_38] == nil then
				local var_82_39 = Object.Instantiate(arg_79_1.paintGo_)

				var_82_39:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_82_38)
				var_82_39.name = var_82_38
				var_82_39.transform.parent = arg_79_1.stage_.transform
				var_82_39.transform.localPosition = Vector3.New(0, 100, 0)
				arg_79_1.bgs_[var_82_38] = var_82_39
			end

			local var_82_40 = arg_79_1.bgs_.STwhite.transform
			local var_82_41 = 1.5

			if var_82_41 < arg_79_1.time_ and arg_79_1.time_ <= var_82_41 + arg_82_0 then
				arg_79_1.var_.moveOldPosSTwhite = var_82_40.localPosition
				var_82_40.localScale = Vector3.New(12, 12, 12)
			end

			local var_82_42 = 0.001

			if var_82_41 <= arg_79_1.time_ and arg_79_1.time_ < var_82_41 + var_82_42 then
				local var_82_43 = (arg_79_1.time_ - var_82_41) / var_82_42
				local var_82_44 = Vector3.New(0, 0, 0)

				var_82_40.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPosSTwhite, var_82_44, var_82_43)
			end

			if arg_79_1.time_ >= var_82_41 + var_82_42 and arg_79_1.time_ < var_82_41 + var_82_42 + arg_82_0 then
				var_82_40.localPosition = Vector3.New(0, 0, 0)
			end

			local var_82_45 = 0

			if var_82_45 < arg_79_1.time_ and arg_79_1.time_ <= var_82_45 + arg_82_0 then
				arg_79_1.allBtn_.enabled = false
			end

			local var_82_46 = 1.49999999999999

			if arg_79_1.time_ >= var_82_45 + var_82_46 and arg_79_1.time_ < var_82_45 + var_82_46 + arg_82_0 then
				arg_79_1.allBtn_.enabled = true
			end

			local var_82_47 = 1.5
			local var_82_48 = 1.375

			if var_82_47 < arg_79_1.time_ and arg_79_1.time_ <= var_82_47 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_49 = arg_79_1:GetWordFromCfg(105121019)
				local var_82_50 = arg_79_1:FormatText(var_82_49.content)

				arg_79_1.text_.text = var_82_50

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_51 = 55
				local var_82_52 = utf8.len(var_82_50)
				local var_82_53 = var_82_51 <= 0 and var_82_48 or var_82_48 * (var_82_52 / var_82_51)

				if var_82_53 > 0 and var_82_48 < var_82_53 then
					arg_79_1.talkMaxDuration = var_82_53

					if var_82_53 + var_82_47 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_53 + var_82_47
					end
				end

				arg_79_1.text_.text = var_82_50
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_54 = math.max(var_82_48, arg_79_1.talkMaxDuration)

			if var_82_47 <= arg_79_1.time_ and arg_79_1.time_ < var_82_47 + var_82_54 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_47) / var_82_54

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_47 + var_82_54 and arg_79_1.time_ < var_82_47 + var_82_54 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play105121020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 105121020
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play105121021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 1

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				local var_86_2 = "play"
				local var_86_3 = "music"

				arg_83_1:AudioAction(var_86_2, var_86_3, "se_story_ui", "se_story_stopenv", "")
			end

			local var_86_4 = 0
			local var_86_5 = 0.05

			if var_86_4 < arg_83_1.time_ and arg_83_1.time_ <= var_86_4 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, false)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_6 = arg_83_1:GetWordFromCfg(105121020)
				local var_86_7 = arg_83_1:FormatText(var_86_6.content)

				arg_83_1.text_.text = var_86_7

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_8 = 2
				local var_86_9 = utf8.len(var_86_7)
				local var_86_10 = var_86_8 <= 0 and var_86_5 or var_86_5 * (var_86_9 / var_86_8)

				if var_86_10 > 0 and var_86_5 < var_86_10 then
					arg_83_1.talkMaxDuration = var_86_10

					if var_86_10 + var_86_4 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_10 + var_86_4
					end
				end

				arg_83_1.text_.text = var_86_7
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_11 = math.max(var_86_5, arg_83_1.talkMaxDuration)

			if var_86_4 <= arg_83_1.time_ and arg_83_1.time_ < var_86_4 + var_86_11 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_4) / var_86_11

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_4 + var_86_11 and arg_83_1.time_ < var_86_4 + var_86_11 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play105121021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 105121021
		arg_87_1.duration_ = 6.5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play105121022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 1.5
			local var_90_1 = 1

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				local var_90_2 = "play"
				local var_90_3 = "effect"

				arg_87_1:AudioAction(var_90_2, var_90_3, "se_story_5", "se_story_5_back", "")
			end

			local var_90_4 = 0

			if var_90_4 < arg_87_1.time_ and arg_87_1.time_ <= var_90_4 + arg_90_0 then
				arg_87_1.mask_.enabled = true
				arg_87_1.mask_.raycastTarget = true

				arg_87_1:SetGaussion(false)
			end

			local var_90_5 = 1.5

			if var_90_4 <= arg_87_1.time_ and arg_87_1.time_ < var_90_4 + var_90_5 then
				local var_90_6 = (arg_87_1.time_ - var_90_4) / var_90_5
				local var_90_7 = Color.New(1, 1, 1)

				var_90_7.a = Mathf.Lerp(1, 0, var_90_6)
				arg_87_1.mask_.color = var_90_7
			end

			if arg_87_1.time_ >= var_90_4 + var_90_5 and arg_87_1.time_ < var_90_4 + var_90_5 + arg_90_0 then
				local var_90_8 = Color.New(1, 1, 1)
				local var_90_9 = 0

				arg_87_1.mask_.enabled = false
				var_90_8.a = var_90_9
				arg_87_1.mask_.color = var_90_8
			end

			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 then
				local var_90_11 = manager.ui.mainCamera.transform.localPosition
				local var_90_12 = Vector3.New(0, 0, 10) + Vector3.New(var_90_11.x, var_90_11.y, 0)
				local var_90_13 = arg_87_1.bgs_.B12a

				var_90_13.transform.localPosition = var_90_12
				var_90_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_90_14 = var_90_13:GetComponent("SpriteRenderer")

				if var_90_14 and var_90_14.sprite then
					local var_90_15 = (var_90_13.transform.localPosition - var_90_11).z
					local var_90_16 = manager.ui.mainCameraCom_
					local var_90_17 = 2 * var_90_15 * Mathf.Tan(var_90_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_90_18 = var_90_17 * var_90_16.aspect
					local var_90_19 = var_90_14.sprite.bounds.size.x
					local var_90_20 = var_90_14.sprite.bounds.size.y
					local var_90_21 = var_90_18 / var_90_19
					local var_90_22 = var_90_17 / var_90_20
					local var_90_23 = var_90_22 < var_90_21 and var_90_21 or var_90_22

					var_90_13.transform.localScale = Vector3.New(var_90_23, var_90_23, 0)
				end

				for iter_90_0, iter_90_1 in pairs(arg_87_1.bgs_) do
					if iter_90_0 ~= "B12a" then
						iter_90_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_87_1.frameCnt_ <= 1 then
				arg_87_1.dialog_:SetActive(false)
			end

			local var_90_24 = 1.5
			local var_90_25 = 0.625

			if var_90_24 < arg_87_1.time_ and arg_87_1.time_ <= var_90_24 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0

				arg_87_1.dialog_:SetActive(true)

				local var_90_26 = LeanTween.value(arg_87_1.dialog_, 0, 1, 0.3)

				var_90_26:setOnUpdate(LuaHelper.FloatAction(function(arg_91_0)
					arg_87_1.dialogCg_.alpha = arg_91_0
				end))
				var_90_26:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_87_1.dialog_)
					var_90_26:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_87_1.duration_ = arg_87_1.duration_ + 0.3

				SetActive(arg_87_1.leftNameGo_, false)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_27 = arg_87_1:GetWordFromCfg(105121021)
				local var_90_28 = arg_87_1:FormatText(var_90_27.content)

				arg_87_1.text_.text = var_90_28

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_29 = 25
				local var_90_30 = utf8.len(var_90_28)
				local var_90_31 = var_90_29 <= 0 and var_90_25 or var_90_25 * (var_90_30 / var_90_29)

				if var_90_31 > 0 and var_90_25 < var_90_31 then
					arg_87_1.talkMaxDuration = var_90_31
					var_90_24 = var_90_24 + 0.3

					if var_90_31 + var_90_24 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_31 + var_90_24
					end
				end

				arg_87_1.text_.text = var_90_28
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_32 = var_90_24 + 0.3
			local var_90_33 = math.max(var_90_25, arg_87_1.talkMaxDuration)

			if var_90_32 <= arg_87_1.time_ and arg_87_1.time_ < var_90_32 + var_90_33 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_32) / var_90_33

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_32 + var_90_33 and arg_87_1.time_ < var_90_32 + var_90_33 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play105121022 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 105121022
		arg_93_1.duration_ = 2.4

		local var_93_0 = {
			ja = 1.999999999999,
			ko = 2.166,
			zh = 2.4,
			en = 1.999999999999
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
				arg_93_0:Play105121023(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = "1036ui_story"

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

			local var_96_4 = arg_93_1.actors_["1036ui_story"]
			local var_96_5 = 0

			if var_96_5 < arg_93_1.time_ and arg_93_1.time_ <= var_96_5 + arg_96_0 and arg_93_1.var_.characterEffect1036ui_story == nil then
				arg_93_1.var_.characterEffect1036ui_story = var_96_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_6 = 0.1

			if var_96_5 <= arg_93_1.time_ and arg_93_1.time_ < var_96_5 + var_96_6 then
				local var_96_7 = (arg_93_1.time_ - var_96_5) / var_96_6

				if arg_93_1.var_.characterEffect1036ui_story then
					arg_93_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_5 + var_96_6 and arg_93_1.time_ < var_96_5 + var_96_6 + arg_96_0 and arg_93_1.var_.characterEffect1036ui_story then
				arg_93_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_96_8 = arg_93_1.actors_["1036ui_story"].transform
			local var_96_9 = 0

			if var_96_9 < arg_93_1.time_ and arg_93_1.time_ <= var_96_9 + arg_96_0 then
				arg_93_1.var_.moveOldPos1036ui_story = var_96_8.localPosition
			end

			local var_96_10 = 0.001

			if var_96_9 <= arg_93_1.time_ and arg_93_1.time_ < var_96_9 + var_96_10 then
				local var_96_11 = (arg_93_1.time_ - var_96_9) / var_96_10
				local var_96_12 = Vector3.New(0, -1.09, -5.78)

				var_96_8.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1036ui_story, var_96_12, var_96_11)

				local var_96_13 = manager.ui.mainCamera.transform.position - var_96_8.position

				var_96_8.forward = Vector3.New(var_96_13.x, var_96_13.y, var_96_13.z)

				local var_96_14 = var_96_8.localEulerAngles

				var_96_14.z = 0
				var_96_14.x = 0
				var_96_8.localEulerAngles = var_96_14
			end

			if arg_93_1.time_ >= var_96_9 + var_96_10 and arg_93_1.time_ < var_96_9 + var_96_10 + arg_96_0 then
				var_96_8.localPosition = Vector3.New(0, -1.09, -5.78)

				local var_96_15 = manager.ui.mainCamera.transform.position - var_96_8.position

				var_96_8.forward = Vector3.New(var_96_15.x, var_96_15.y, var_96_15.z)

				local var_96_16 = var_96_8.localEulerAngles

				var_96_16.z = 0
				var_96_16.x = 0
				var_96_8.localEulerAngles = var_96_16
			end

			local var_96_17 = 0

			if var_96_17 < arg_93_1.time_ and arg_93_1.time_ <= var_96_17 + arg_96_0 then
				arg_93_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action7_1")
			end

			local var_96_18 = 0

			if var_96_18 < arg_93_1.time_ and arg_93_1.time_ <= var_96_18 + arg_96_0 then
				arg_93_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_96_19 = 0
			local var_96_20 = 0.15

			if var_96_19 < arg_93_1.time_ and arg_93_1.time_ <= var_96_19 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_21 = arg_93_1:FormatText(StoryNameCfg[5].name)

				arg_93_1.leftNameTxt_.text = var_96_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_22 = arg_93_1:GetWordFromCfg(105121022)
				local var_96_23 = arg_93_1:FormatText(var_96_22.content)

				arg_93_1.text_.text = var_96_23

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_24 = 7
				local var_96_25 = utf8.len(var_96_23)
				local var_96_26 = var_96_24 <= 0 and var_96_20 or var_96_20 * (var_96_25 / var_96_24)

				if var_96_26 > 0 and var_96_20 < var_96_26 then
					arg_93_1.talkMaxDuration = var_96_26

					if var_96_26 + var_96_19 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_26 + var_96_19
					end
				end

				arg_93_1.text_.text = var_96_23
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121022", "story_v_out_105121.awb") ~= 0 then
					local var_96_27 = manager.audio:GetVoiceLength("story_v_out_105121", "105121022", "story_v_out_105121.awb") / 1000

					if var_96_27 + var_96_19 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_27 + var_96_19
					end

					if var_96_22.prefab_name ~= "" and arg_93_1.actors_[var_96_22.prefab_name] ~= nil then
						local var_96_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_22.prefab_name].transform, "story_v_out_105121", "105121022", "story_v_out_105121.awb")

						arg_93_1:RecordAudio("105121022", var_96_28)
						arg_93_1:RecordAudio("105121022", var_96_28)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_105121", "105121022", "story_v_out_105121.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_105121", "105121022", "story_v_out_105121.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_29 = math.max(var_96_20, arg_93_1.talkMaxDuration)

			if var_96_19 <= arg_93_1.time_ and arg_93_1.time_ < var_96_19 + var_96_29 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_19) / var_96_29

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_19 + var_96_29 and arg_93_1.time_ < var_96_19 + var_96_29 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play105121023 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 105121023
		arg_97_1.duration_ = 3.633

		local var_97_0 = {
			ja = 3.633,
			ko = 2.2,
			zh = 2.6,
			en = 3.066
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
				arg_97_0:Play105121024(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1084ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect1084ui_story == nil then
				arg_97_1.var_.characterEffect1084ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.1

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect1084ui_story then
					arg_97_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect1084ui_story then
				arg_97_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_100_4 = arg_97_1.actors_["1036ui_story"]
			local var_100_5 = 0

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 and arg_97_1.var_.characterEffect1036ui_story == nil then
				arg_97_1.var_.characterEffect1036ui_story = var_100_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_6 = 0.1

			if var_100_5 <= arg_97_1.time_ and arg_97_1.time_ < var_100_5 + var_100_6 then
				local var_100_7 = (arg_97_1.time_ - var_100_5) / var_100_6

				if arg_97_1.var_.characterEffect1036ui_story then
					local var_100_8 = Mathf.Lerp(0, 0.5, var_100_7)

					arg_97_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_97_1.var_.characterEffect1036ui_story.fillRatio = var_100_8
				end
			end

			if arg_97_1.time_ >= var_100_5 + var_100_6 and arg_97_1.time_ < var_100_5 + var_100_6 + arg_100_0 and arg_97_1.var_.characterEffect1036ui_story then
				local var_100_9 = 0.5

				arg_97_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_97_1.var_.characterEffect1036ui_story.fillRatio = var_100_9
			end

			local var_100_10 = 0
			local var_100_11 = 0.15

			if var_100_10 < arg_97_1.time_ and arg_97_1.time_ <= var_100_10 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_12 = arg_97_1:FormatText(StoryNameCfg[6].name)

				arg_97_1.leftNameTxt_.text = var_100_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, true)
				arg_97_1.iconController_:SetSelectedState("hero")

				arg_97_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_13 = arg_97_1:GetWordFromCfg(105121023)
				local var_100_14 = arg_97_1:FormatText(var_100_13.content)

				arg_97_1.text_.text = var_100_14

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_15 = 6
				local var_100_16 = utf8.len(var_100_14)
				local var_100_17 = var_100_15 <= 0 and var_100_11 or var_100_11 * (var_100_16 / var_100_15)

				if var_100_17 > 0 and var_100_11 < var_100_17 then
					arg_97_1.talkMaxDuration = var_100_17

					if var_100_17 + var_100_10 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_17 + var_100_10
					end
				end

				arg_97_1.text_.text = var_100_14
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121023", "story_v_out_105121.awb") ~= 0 then
					local var_100_18 = manager.audio:GetVoiceLength("story_v_out_105121", "105121023", "story_v_out_105121.awb") / 1000

					if var_100_18 + var_100_10 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_18 + var_100_10
					end

					if var_100_13.prefab_name ~= "" and arg_97_1.actors_[var_100_13.prefab_name] ~= nil then
						local var_100_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_13.prefab_name].transform, "story_v_out_105121", "105121023", "story_v_out_105121.awb")

						arg_97_1:RecordAudio("105121023", var_100_19)
						arg_97_1:RecordAudio("105121023", var_100_19)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_105121", "105121023", "story_v_out_105121.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_105121", "105121023", "story_v_out_105121.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_20 = math.max(var_100_11, arg_97_1.talkMaxDuration)

			if var_100_10 <= arg_97_1.time_ and arg_97_1.time_ < var_100_10 + var_100_20 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_10) / var_100_20

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_10 + var_100_20 and arg_97_1.time_ < var_100_10 + var_100_20 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play105121024 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 105121024
		arg_101_1.duration_ = 3.666

		local var_101_0 = {
			ja = 3.666,
			ko = 2.766,
			zh = 2.9,
			en = 2.966
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
				arg_101_0:Play105121025(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1019ui_story"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.characterEffect1019ui_story == nil then
				arg_101_1.var_.characterEffect1019ui_story = var_104_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_2 = 0.1

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.characterEffect1019ui_story then
					arg_101_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.characterEffect1019ui_story then
				arg_101_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_104_4 = arg_101_1.actors_["1084ui_story"]
			local var_104_5 = 0

			if var_104_5 < arg_101_1.time_ and arg_101_1.time_ <= var_104_5 + arg_104_0 and arg_101_1.var_.characterEffect1084ui_story == nil then
				arg_101_1.var_.characterEffect1084ui_story = var_104_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_6 = 0.1

			if var_104_5 <= arg_101_1.time_ and arg_101_1.time_ < var_104_5 + var_104_6 then
				local var_104_7 = (arg_101_1.time_ - var_104_5) / var_104_6

				if arg_101_1.var_.characterEffect1084ui_story then
					local var_104_8 = Mathf.Lerp(0, 0.5, var_104_7)

					arg_101_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1084ui_story.fillRatio = var_104_8
				end
			end

			if arg_101_1.time_ >= var_104_5 + var_104_6 and arg_101_1.time_ < var_104_5 + var_104_6 + arg_104_0 and arg_101_1.var_.characterEffect1084ui_story then
				local var_104_9 = 0.5

				arg_101_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1084ui_story.fillRatio = var_104_9
			end

			local var_104_10 = arg_101_1.actors_["1036ui_story"].transform
			local var_104_11 = 0

			if var_104_11 < arg_101_1.time_ and arg_101_1.time_ <= var_104_11 + arg_104_0 then
				arg_101_1.var_.moveOldPos1036ui_story = var_104_10.localPosition
			end

			local var_104_12 = 0.001

			if var_104_11 <= arg_101_1.time_ and arg_101_1.time_ < var_104_11 + var_104_12 then
				local var_104_13 = (arg_101_1.time_ - var_104_11) / var_104_12
				local var_104_14 = Vector3.New(0, 100, 0)

				var_104_10.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1036ui_story, var_104_14, var_104_13)

				local var_104_15 = manager.ui.mainCamera.transform.position - var_104_10.position

				var_104_10.forward = Vector3.New(var_104_15.x, var_104_15.y, var_104_15.z)

				local var_104_16 = var_104_10.localEulerAngles

				var_104_16.z = 0
				var_104_16.x = 0
				var_104_10.localEulerAngles = var_104_16
			end

			if arg_101_1.time_ >= var_104_11 + var_104_12 and arg_101_1.time_ < var_104_11 + var_104_12 + arg_104_0 then
				var_104_10.localPosition = Vector3.New(0, 100, 0)

				local var_104_17 = manager.ui.mainCamera.transform.position - var_104_10.position

				var_104_10.forward = Vector3.New(var_104_17.x, var_104_17.y, var_104_17.z)

				local var_104_18 = var_104_10.localEulerAngles

				var_104_18.z = 0
				var_104_18.x = 0
				var_104_10.localEulerAngles = var_104_18
			end

			local var_104_19 = arg_101_1.actors_["1019ui_story"].transform
			local var_104_20 = 0

			if var_104_20 < arg_101_1.time_ and arg_101_1.time_ <= var_104_20 + arg_104_0 then
				arg_101_1.var_.moveOldPos1019ui_story = var_104_19.localPosition
			end

			local var_104_21 = 0.001

			if var_104_20 <= arg_101_1.time_ and arg_101_1.time_ < var_104_20 + var_104_21 then
				local var_104_22 = (arg_101_1.time_ - var_104_20) / var_104_21
				local var_104_23 = Vector3.New(0, -1.08, -5.9)

				var_104_19.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1019ui_story, var_104_23, var_104_22)

				local var_104_24 = manager.ui.mainCamera.transform.position - var_104_19.position

				var_104_19.forward = Vector3.New(var_104_24.x, var_104_24.y, var_104_24.z)

				local var_104_25 = var_104_19.localEulerAngles

				var_104_25.z = 0
				var_104_25.x = 0
				var_104_19.localEulerAngles = var_104_25
			end

			if arg_101_1.time_ >= var_104_20 + var_104_21 and arg_101_1.time_ < var_104_20 + var_104_21 + arg_104_0 then
				var_104_19.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_104_26 = manager.ui.mainCamera.transform.position - var_104_19.position

				var_104_19.forward = Vector3.New(var_104_26.x, var_104_26.y, var_104_26.z)

				local var_104_27 = var_104_19.localEulerAngles

				var_104_27.z = 0
				var_104_27.x = 0
				var_104_19.localEulerAngles = var_104_27
			end

			local var_104_28 = 0

			if var_104_28 < arg_101_1.time_ and arg_101_1.time_ <= var_104_28 + arg_104_0 then
				arg_101_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			local var_104_29 = 0

			if var_104_29 < arg_101_1.time_ and arg_101_1.time_ <= var_104_29 + arg_104_0 then
				arg_101_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_104_30 = 0
			local var_104_31 = 0.225

			if var_104_30 < arg_101_1.time_ and arg_101_1.time_ <= var_104_30 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_32 = arg_101_1:FormatText(StoryNameCfg[13].name)

				arg_101_1.leftNameTxt_.text = var_104_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_33 = arg_101_1:GetWordFromCfg(105121024)
				local var_104_34 = arg_101_1:FormatText(var_104_33.content)

				arg_101_1.text_.text = var_104_34

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_35 = 9
				local var_104_36 = utf8.len(var_104_34)
				local var_104_37 = var_104_35 <= 0 and var_104_31 or var_104_31 * (var_104_36 / var_104_35)

				if var_104_37 > 0 and var_104_31 < var_104_37 then
					arg_101_1.talkMaxDuration = var_104_37

					if var_104_37 + var_104_30 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_37 + var_104_30
					end
				end

				arg_101_1.text_.text = var_104_34
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121024", "story_v_out_105121.awb") ~= 0 then
					local var_104_38 = manager.audio:GetVoiceLength("story_v_out_105121", "105121024", "story_v_out_105121.awb") / 1000

					if var_104_38 + var_104_30 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_38 + var_104_30
					end

					if var_104_33.prefab_name ~= "" and arg_101_1.actors_[var_104_33.prefab_name] ~= nil then
						local var_104_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_33.prefab_name].transform, "story_v_out_105121", "105121024", "story_v_out_105121.awb")

						arg_101_1:RecordAudio("105121024", var_104_39)
						arg_101_1:RecordAudio("105121024", var_104_39)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_105121", "105121024", "story_v_out_105121.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_105121", "105121024", "story_v_out_105121.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_40 = math.max(var_104_31, arg_101_1.talkMaxDuration)

			if var_104_30 <= arg_101_1.time_ and arg_101_1.time_ < var_104_30 + var_104_40 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_30) / var_104_40

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_30 + var_104_40 and arg_101_1.time_ < var_104_30 + var_104_40 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play105121025 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 105121025
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play105121026(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1019ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.characterEffect1019ui_story == nil then
				arg_105_1.var_.characterEffect1019ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.1

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect1019ui_story then
					local var_108_4 = Mathf.Lerp(0, 0.5, var_108_3)

					arg_105_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_105_1.var_.characterEffect1019ui_story.fillRatio = var_108_4
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.characterEffect1019ui_story then
				local var_108_5 = 0.5

				arg_105_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_105_1.var_.characterEffect1019ui_story.fillRatio = var_108_5
			end

			local var_108_6 = arg_105_1.actors_["1019ui_story"].transform
			local var_108_7 = 0

			if var_108_7 < arg_105_1.time_ and arg_105_1.time_ <= var_108_7 + arg_108_0 then
				arg_105_1.var_.moveOldPos1019ui_story = var_108_6.localPosition
			end

			local var_108_8 = 0.001

			if var_108_7 <= arg_105_1.time_ and arg_105_1.time_ < var_108_7 + var_108_8 then
				local var_108_9 = (arg_105_1.time_ - var_108_7) / var_108_8
				local var_108_10 = Vector3.New(0, 100, 0)

				var_108_6.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos1019ui_story, var_108_10, var_108_9)

				local var_108_11 = manager.ui.mainCamera.transform.position - var_108_6.position

				var_108_6.forward = Vector3.New(var_108_11.x, var_108_11.y, var_108_11.z)

				local var_108_12 = var_108_6.localEulerAngles

				var_108_12.z = 0
				var_108_12.x = 0
				var_108_6.localEulerAngles = var_108_12
			end

			if arg_105_1.time_ >= var_108_7 + var_108_8 and arg_105_1.time_ < var_108_7 + var_108_8 + arg_108_0 then
				var_108_6.localPosition = Vector3.New(0, 100, 0)

				local var_108_13 = manager.ui.mainCamera.transform.position - var_108_6.position

				var_108_6.forward = Vector3.New(var_108_13.x, var_108_13.y, var_108_13.z)

				local var_108_14 = var_108_6.localEulerAngles

				var_108_14.z = 0
				var_108_14.x = 0
				var_108_6.localEulerAngles = var_108_14
			end

			local var_108_15 = 0
			local var_108_16 = 1.3

			if var_108_15 < arg_105_1.time_ and arg_105_1.time_ <= var_108_15 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, false)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_17 = arg_105_1:GetWordFromCfg(105121025)
				local var_108_18 = arg_105_1:FormatText(var_108_17.content)

				arg_105_1.text_.text = var_108_18

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_19 = 52
				local var_108_20 = utf8.len(var_108_18)
				local var_108_21 = var_108_19 <= 0 and var_108_16 or var_108_16 * (var_108_20 / var_108_19)

				if var_108_21 > 0 and var_108_16 < var_108_21 then
					arg_105_1.talkMaxDuration = var_108_21

					if var_108_21 + var_108_15 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_21 + var_108_15
					end
				end

				arg_105_1.text_.text = var_108_18
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_22 = math.max(var_108_16, arg_105_1.talkMaxDuration)

			if var_108_15 <= arg_105_1.time_ and arg_105_1.time_ < var_108_15 + var_108_22 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_15) / var_108_22

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_15 + var_108_22 and arg_105_1.time_ < var_108_15 + var_108_22 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play105121026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 105121026
		arg_109_1.duration_ = 4.933

		local var_109_0 = {
			ja = 4.933,
			ko = 3.7,
			zh = 2.5,
			en = 4.666
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
				arg_109_0:Play105121027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1036ui_story"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.characterEffect1036ui_story == nil then
				arg_109_1.var_.characterEffect1036ui_story = var_112_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_2 = 0.1

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.characterEffect1036ui_story then
					arg_109_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.characterEffect1036ui_story then
				arg_109_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_112_4 = 0
			local var_112_5 = 0.35

			if var_112_4 < arg_109_1.time_ and arg_109_1.time_ <= var_112_4 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_6 = arg_109_1:FormatText(StoryNameCfg[5].name)

				arg_109_1.leftNameTxt_.text = var_112_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, true)
				arg_109_1.iconController_:SetSelectedState("hero")

				arg_109_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1036")

				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_7 = arg_109_1:GetWordFromCfg(105121026)
				local var_112_8 = arg_109_1:FormatText(var_112_7.content)

				arg_109_1.text_.text = var_112_8

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_9 = 14
				local var_112_10 = utf8.len(var_112_8)
				local var_112_11 = var_112_9 <= 0 and var_112_5 or var_112_5 * (var_112_10 / var_112_9)

				if var_112_11 > 0 and var_112_5 < var_112_11 then
					arg_109_1.talkMaxDuration = var_112_11

					if var_112_11 + var_112_4 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_11 + var_112_4
					end
				end

				arg_109_1.text_.text = var_112_8
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121026", "story_v_out_105121.awb") ~= 0 then
					local var_112_12 = manager.audio:GetVoiceLength("story_v_out_105121", "105121026", "story_v_out_105121.awb") / 1000

					if var_112_12 + var_112_4 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_12 + var_112_4
					end

					if var_112_7.prefab_name ~= "" and arg_109_1.actors_[var_112_7.prefab_name] ~= nil then
						local var_112_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_7.prefab_name].transform, "story_v_out_105121", "105121026", "story_v_out_105121.awb")

						arg_109_1:RecordAudio("105121026", var_112_13)
						arg_109_1:RecordAudio("105121026", var_112_13)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_105121", "105121026", "story_v_out_105121.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_105121", "105121026", "story_v_out_105121.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_14 = math.max(var_112_5, arg_109_1.talkMaxDuration)

			if var_112_4 <= arg_109_1.time_ and arg_109_1.time_ < var_112_4 + var_112_14 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_4) / var_112_14

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_4 + var_112_14 and arg_109_1.time_ < var_112_4 + var_112_14 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play105121027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 105121027
		arg_113_1.duration_ = 3.3

		local var_113_0 = {
			ja = 3.3,
			ko = 2,
			zh = 3,
			en = 1.9
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
				arg_113_0:Play105121028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1019ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect1019ui_story == nil then
				arg_113_1.var_.characterEffect1019ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.1

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1019ui_story then
					arg_113_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect1019ui_story then
				arg_113_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_116_4 = arg_113_1.actors_["1036ui_story"]
			local var_116_5 = 0

			if var_116_5 < arg_113_1.time_ and arg_113_1.time_ <= var_116_5 + arg_116_0 and arg_113_1.var_.characterEffect1036ui_story == nil then
				arg_113_1.var_.characterEffect1036ui_story = var_116_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_6 = 0.1

			if var_116_5 <= arg_113_1.time_ and arg_113_1.time_ < var_116_5 + var_116_6 then
				local var_116_7 = (arg_113_1.time_ - var_116_5) / var_116_6

				if arg_113_1.var_.characterEffect1036ui_story then
					local var_116_8 = Mathf.Lerp(0, 0.5, var_116_7)

					arg_113_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_113_1.var_.characterEffect1036ui_story.fillRatio = var_116_8
				end
			end

			if arg_113_1.time_ >= var_116_5 + var_116_6 and arg_113_1.time_ < var_116_5 + var_116_6 + arg_116_0 and arg_113_1.var_.characterEffect1036ui_story then
				local var_116_9 = 0.5

				arg_113_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_113_1.var_.characterEffect1036ui_story.fillRatio = var_116_9
			end

			local var_116_10 = 0
			local var_116_11 = 0.25

			if var_116_10 < arg_113_1.time_ and arg_113_1.time_ <= var_116_10 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_12 = arg_113_1:FormatText(StoryNameCfg[13].name)

				arg_113_1.leftNameTxt_.text = var_116_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, true)
				arg_113_1.iconController_:SetSelectedState("hero")

				arg_113_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_13 = arg_113_1:GetWordFromCfg(105121027)
				local var_116_14 = arg_113_1:FormatText(var_116_13.content)

				arg_113_1.text_.text = var_116_14

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_15 = 10
				local var_116_16 = utf8.len(var_116_14)
				local var_116_17 = var_116_15 <= 0 and var_116_11 or var_116_11 * (var_116_16 / var_116_15)

				if var_116_17 > 0 and var_116_11 < var_116_17 then
					arg_113_1.talkMaxDuration = var_116_17

					if var_116_17 + var_116_10 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_17 + var_116_10
					end
				end

				arg_113_1.text_.text = var_116_14
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121027", "story_v_out_105121.awb") ~= 0 then
					local var_116_18 = manager.audio:GetVoiceLength("story_v_out_105121", "105121027", "story_v_out_105121.awb") / 1000

					if var_116_18 + var_116_10 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_18 + var_116_10
					end

					if var_116_13.prefab_name ~= "" and arg_113_1.actors_[var_116_13.prefab_name] ~= nil then
						local var_116_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_13.prefab_name].transform, "story_v_out_105121", "105121027", "story_v_out_105121.awb")

						arg_113_1:RecordAudio("105121027", var_116_19)
						arg_113_1:RecordAudio("105121027", var_116_19)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_105121", "105121027", "story_v_out_105121.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_105121", "105121027", "story_v_out_105121.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_20 = math.max(var_116_11, arg_113_1.talkMaxDuration)

			if var_116_10 <= arg_113_1.time_ and arg_113_1.time_ < var_116_10 + var_116_20 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_10) / var_116_20

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_10 + var_116_20 and arg_113_1.time_ < var_116_10 + var_116_20 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play105121028 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 105121028
		arg_117_1.duration_ = 4.533

		local var_117_0 = {
			ja = 4.533,
			ko = 3.2,
			zh = 3.1,
			en = 3.633
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
				arg_117_0:Play105121029(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1084ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect1084ui_story == nil then
				arg_117_1.var_.characterEffect1084ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.1

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect1084ui_story then
					arg_117_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect1084ui_story then
				arg_117_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_120_4 = arg_117_1.actors_["1019ui_story"]
			local var_120_5 = 0

			if var_120_5 < arg_117_1.time_ and arg_117_1.time_ <= var_120_5 + arg_120_0 and arg_117_1.var_.characterEffect1019ui_story == nil then
				arg_117_1.var_.characterEffect1019ui_story = var_120_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_6 = 0.1

			if var_120_5 <= arg_117_1.time_ and arg_117_1.time_ < var_120_5 + var_120_6 then
				local var_120_7 = (arg_117_1.time_ - var_120_5) / var_120_6

				if arg_117_1.var_.characterEffect1019ui_story then
					local var_120_8 = Mathf.Lerp(0, 0.5, var_120_7)

					arg_117_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_117_1.var_.characterEffect1019ui_story.fillRatio = var_120_8
				end
			end

			if arg_117_1.time_ >= var_120_5 + var_120_6 and arg_117_1.time_ < var_120_5 + var_120_6 + arg_120_0 and arg_117_1.var_.characterEffect1019ui_story then
				local var_120_9 = 0.5

				arg_117_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_117_1.var_.characterEffect1019ui_story.fillRatio = var_120_9
			end

			local var_120_10 = 0
			local var_120_11 = 0.225

			if var_120_10 < arg_117_1.time_ and arg_117_1.time_ <= var_120_10 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_12 = arg_117_1:FormatText(StoryNameCfg[6].name)

				arg_117_1.leftNameTxt_.text = var_120_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, true)
				arg_117_1.iconController_:SetSelectedState("hero")

				arg_117_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_13 = arg_117_1:GetWordFromCfg(105121028)
				local var_120_14 = arg_117_1:FormatText(var_120_13.content)

				arg_117_1.text_.text = var_120_14

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_15 = 9
				local var_120_16 = utf8.len(var_120_14)
				local var_120_17 = var_120_15 <= 0 and var_120_11 or var_120_11 * (var_120_16 / var_120_15)

				if var_120_17 > 0 and var_120_11 < var_120_17 then
					arg_117_1.talkMaxDuration = var_120_17

					if var_120_17 + var_120_10 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_17 + var_120_10
					end
				end

				arg_117_1.text_.text = var_120_14
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121028", "story_v_out_105121.awb") ~= 0 then
					local var_120_18 = manager.audio:GetVoiceLength("story_v_out_105121", "105121028", "story_v_out_105121.awb") / 1000

					if var_120_18 + var_120_10 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_18 + var_120_10
					end

					if var_120_13.prefab_name ~= "" and arg_117_1.actors_[var_120_13.prefab_name] ~= nil then
						local var_120_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_13.prefab_name].transform, "story_v_out_105121", "105121028", "story_v_out_105121.awb")

						arg_117_1:RecordAudio("105121028", var_120_19)
						arg_117_1:RecordAudio("105121028", var_120_19)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_105121", "105121028", "story_v_out_105121.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_105121", "105121028", "story_v_out_105121.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_20 = math.max(var_120_11, arg_117_1.talkMaxDuration)

			if var_120_10 <= arg_117_1.time_ and arg_117_1.time_ < var_120_10 + var_120_20 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_10) / var_120_20

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_10 + var_120_20 and arg_117_1.time_ < var_120_10 + var_120_20 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play105121029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 105121029
		arg_121_1.duration_ = 8

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play105121030(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 1

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				local var_124_2 = "play"
				local var_124_3 = "music"

				arg_121_1:AudioAction(var_124_2, var_124_3, "se_story_v1_environment_factory", "se_story_v1_environment_factory", "se_story_v1_environment_factory")
			end

			local var_124_4 = arg_121_1.actors_["1084ui_story"]
			local var_124_5 = 2

			if var_124_5 < arg_121_1.time_ and arg_121_1.time_ <= var_124_5 + arg_124_0 and arg_121_1.var_.characterEffect1084ui_story == nil then
				arg_121_1.var_.characterEffect1084ui_story = var_124_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_6 = 0.1

			if var_124_5 <= arg_121_1.time_ and arg_121_1.time_ < var_124_5 + var_124_6 then
				local var_124_7 = (arg_121_1.time_ - var_124_5) / var_124_6

				if arg_121_1.var_.characterEffect1084ui_story then
					local var_124_8 = Mathf.Lerp(0, 0.5, var_124_7)

					arg_121_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_121_1.var_.characterEffect1084ui_story.fillRatio = var_124_8
				end
			end

			if arg_121_1.time_ >= var_124_5 + var_124_6 and arg_121_1.time_ < var_124_5 + var_124_6 + arg_124_0 and arg_121_1.var_.characterEffect1084ui_story then
				local var_124_9 = 0.5

				arg_121_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_121_1.var_.characterEffect1084ui_story.fillRatio = var_124_9
			end

			local var_124_10 = arg_121_1.bgs_.B12a
			local var_124_11 = 0

			if var_124_11 < arg_121_1.time_ and arg_121_1.time_ <= var_124_11 + arg_124_0 then
				local var_124_12 = var_124_10:GetComponent("SpriteRenderer")

				if var_124_12 then
					var_124_12.material = arg_121_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_124_13 = var_124_12.material
					local var_124_14 = var_124_13:GetColor("_Color")

					arg_121_1.var_.alphaOldValueB12a = var_124_14.a
					arg_121_1.var_.alphaMatValueB12a = var_124_13
				end

				arg_121_1.var_.alphaOldValueB12a = 1
			end

			local var_124_15 = 1.5

			if var_124_11 <= arg_121_1.time_ and arg_121_1.time_ < var_124_11 + var_124_15 then
				local var_124_16 = (arg_121_1.time_ - var_124_11) / var_124_15
				local var_124_17 = Mathf.Lerp(arg_121_1.var_.alphaOldValueB12a, 0, var_124_16)

				if arg_121_1.var_.alphaMatValueB12a then
					local var_124_18 = arg_121_1.var_.alphaMatValueB12a
					local var_124_19 = var_124_18:GetColor("_Color")

					var_124_19.a = var_124_17

					var_124_18:SetColor("_Color", var_124_19)
				end
			end

			if arg_121_1.time_ >= var_124_11 + var_124_15 and arg_121_1.time_ < var_124_11 + var_124_15 + arg_124_0 and arg_121_1.var_.alphaMatValueB12a then
				local var_124_20 = arg_121_1.var_.alphaMatValueB12a
				local var_124_21 = var_124_20:GetColor("_Color")

				var_124_21.a = 0

				var_124_20:SetColor("_Color", var_124_21)
			end

			local var_124_22 = arg_121_1.bgs_.B12a.transform
			local var_124_23 = 1.5

			if var_124_23 < arg_121_1.time_ and arg_121_1.time_ <= var_124_23 + arg_124_0 then
				arg_121_1.var_.moveOldPosB12a = var_124_22.localPosition
			end

			local var_124_24 = 0.001

			if var_124_23 <= arg_121_1.time_ and arg_121_1.time_ < var_124_23 + var_124_24 then
				local var_124_25 = (arg_121_1.time_ - var_124_23) / var_124_24
				local var_124_26 = Vector3.New(0, -100, 10)

				var_124_22.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPosB12a, var_124_26, var_124_25)
			end

			if arg_121_1.time_ >= var_124_23 + var_124_24 and arg_121_1.time_ < var_124_23 + var_124_24 + arg_124_0 then
				var_124_22.localPosition = Vector3.New(0, -100, 10)
			end

			local var_124_27 = "B01a"

			if arg_121_1.bgs_[var_124_27] == nil then
				local var_124_28 = Object.Instantiate(arg_121_1.paintGo_)

				var_124_28:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_124_27)
				var_124_28.name = var_124_27
				var_124_28.transform.parent = arg_121_1.stage_.transform
				var_124_28.transform.localPosition = Vector3.New(0, 100, 0)
				arg_121_1.bgs_[var_124_27] = var_124_28
			end

			local var_124_29 = arg_121_1.bgs_.B01a
			local var_124_30 = 1.5

			if var_124_30 < arg_121_1.time_ and arg_121_1.time_ <= var_124_30 + arg_124_0 then
				local var_124_31 = var_124_29:GetComponent("SpriteRenderer")

				if var_124_31 then
					var_124_31.material = arg_121_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_124_32 = var_124_31.material
					local var_124_33 = var_124_32:GetColor("_Color")

					arg_121_1.var_.alphaOldValueB01a = var_124_33.a
					arg_121_1.var_.alphaMatValueB01a = var_124_32
				end

				arg_121_1.var_.alphaOldValueB01a = 0
			end

			local var_124_34 = 1.5

			if var_124_30 <= arg_121_1.time_ and arg_121_1.time_ < var_124_30 + var_124_34 then
				local var_124_35 = (arg_121_1.time_ - var_124_30) / var_124_34
				local var_124_36 = Mathf.Lerp(arg_121_1.var_.alphaOldValueB01a, 1, var_124_35)

				if arg_121_1.var_.alphaMatValueB01a then
					local var_124_37 = arg_121_1.var_.alphaMatValueB01a
					local var_124_38 = var_124_37:GetColor("_Color")

					var_124_38.a = var_124_36

					var_124_37:SetColor("_Color", var_124_38)
				end
			end

			if arg_121_1.time_ >= var_124_30 + var_124_34 and arg_121_1.time_ < var_124_30 + var_124_34 + arg_124_0 and arg_121_1.var_.alphaMatValueB01a then
				local var_124_39 = arg_121_1.var_.alphaMatValueB01a
				local var_124_40 = var_124_39:GetColor("_Color")

				var_124_40.a = 1

				var_124_39:SetColor("_Color", var_124_40)
			end

			local var_124_41 = 1.5

			if var_124_41 < arg_121_1.time_ and arg_121_1.time_ <= var_124_41 + arg_124_0 then
				local var_124_42 = manager.ui.mainCamera.transform.localPosition
				local var_124_43 = Vector3.New(0, 0, 10) + Vector3.New(var_124_42.x, var_124_42.y, 0)
				local var_124_44 = arg_121_1.bgs_.B01a

				var_124_44.transform.localPosition = var_124_43
				var_124_44.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_124_45 = var_124_44:GetComponent("SpriteRenderer")

				if var_124_45 and var_124_45.sprite then
					local var_124_46 = (var_124_44.transform.localPosition - var_124_42).z
					local var_124_47 = manager.ui.mainCameraCom_
					local var_124_48 = 2 * var_124_46 * Mathf.Tan(var_124_47.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_124_49 = var_124_48 * var_124_47.aspect
					local var_124_50 = var_124_45.sprite.bounds.size.x
					local var_124_51 = var_124_45.sprite.bounds.size.y
					local var_124_52 = var_124_49 / var_124_50
					local var_124_53 = var_124_48 / var_124_51
					local var_124_54 = var_124_53 < var_124_52 and var_124_52 or var_124_53

					var_124_44.transform.localScale = Vector3.New(var_124_54, var_124_54, 0)
				end

				for iter_124_0, iter_124_1 in pairs(arg_121_1.bgs_) do
					if iter_124_0 ~= "B01a" then
						iter_124_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_124_55 = 0

			if var_124_55 < arg_121_1.time_ and arg_121_1.time_ <= var_124_55 + arg_124_0 then
				arg_121_1.allBtn_.enabled = false
			end

			local var_124_56 = 3

			if arg_121_1.time_ >= var_124_55 + var_124_56 and arg_121_1.time_ < var_124_55 + var_124_56 + arg_124_0 then
				arg_121_1.allBtn_.enabled = true
			end

			if arg_121_1.frameCnt_ <= 1 then
				arg_121_1.dialog_:SetActive(false)
			end

			local var_124_57 = 3
			local var_124_58 = 0.2

			if var_124_57 < arg_121_1.time_ and arg_121_1.time_ <= var_124_57 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0

				arg_121_1.dialog_:SetActive(true)

				local var_124_59 = LeanTween.value(arg_121_1.dialog_, 0, 1, 0.3)

				var_124_59:setOnUpdate(LuaHelper.FloatAction(function(arg_125_0)
					arg_121_1.dialogCg_.alpha = arg_125_0
				end))
				var_124_59:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_121_1.dialog_)
					var_124_59:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_121_1.duration_ = arg_121_1.duration_ + 0.3

				SetActive(arg_121_1.leftNameGo_, false)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_60 = arg_121_1:GetWordFromCfg(105121029)
				local var_124_61 = arg_121_1:FormatText(var_124_60.content)

				arg_121_1.text_.text = var_124_61

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_62 = 8
				local var_124_63 = utf8.len(var_124_61)
				local var_124_64 = var_124_62 <= 0 and var_124_58 or var_124_58 * (var_124_63 / var_124_62)

				if var_124_64 > 0 and var_124_58 < var_124_64 then
					arg_121_1.talkMaxDuration = var_124_64
					var_124_57 = var_124_57 + 0.3

					if var_124_64 + var_124_57 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_64 + var_124_57
					end
				end

				arg_121_1.text_.text = var_124_61
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_65 = var_124_57 + 0.3
			local var_124_66 = math.max(var_124_58, arg_121_1.talkMaxDuration)

			if var_124_65 <= arg_121_1.time_ and arg_121_1.time_ < var_124_65 + var_124_66 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_65) / var_124_66

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_65 + var_124_66 and arg_121_1.time_ < var_124_65 + var_124_66 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play105121030 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 105121030
		arg_127_1.duration_ = 7.433

		local var_127_0 = {
			ja = 7.433,
			ko = 5.4,
			zh = 5.633,
			en = 6.5
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
				arg_127_0:Play105121031(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = "1059ui_story"

			if arg_127_1.actors_[var_130_0] == nil then
				local var_130_1 = Object.Instantiate(Asset.Load("Char/" .. var_130_0), arg_127_1.stage_.transform)

				var_130_1.name = var_130_0
				var_130_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_127_1.actors_[var_130_0] = var_130_1

				local var_130_2 = var_130_1:GetComponentInChildren(typeof(CharacterEffect))

				var_130_2.enabled = true

				local var_130_3 = GameObjectTools.GetOrAddComponent(var_130_1, typeof(DynamicBoneHelper))

				if var_130_3 then
					var_130_3:EnableDynamicBone(false)
				end

				arg_127_1:ShowWeapon(var_130_2.transform, false)

				arg_127_1.var_[var_130_0 .. "Animator"] = var_130_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_127_1.var_[var_130_0 .. "Animator"].applyRootMotion = true
				arg_127_1.var_[var_130_0 .. "LipSync"] = var_130_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_130_4 = arg_127_1.actors_["1059ui_story"]
			local var_130_5 = 0

			if var_130_5 < arg_127_1.time_ and arg_127_1.time_ <= var_130_5 + arg_130_0 and arg_127_1.var_.characterEffect1059ui_story == nil then
				arg_127_1.var_.characterEffect1059ui_story = var_130_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_6 = 0.1

			if var_130_5 <= arg_127_1.time_ and arg_127_1.time_ < var_130_5 + var_130_6 then
				local var_130_7 = (arg_127_1.time_ - var_130_5) / var_130_6

				if arg_127_1.var_.characterEffect1059ui_story then
					arg_127_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_5 + var_130_6 and arg_127_1.time_ < var_130_5 + var_130_6 + arg_130_0 and arg_127_1.var_.characterEffect1059ui_story then
				arg_127_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_130_8 = arg_127_1.actors_["1059ui_story"].transform
			local var_130_9 = 0

			if var_130_9 < arg_127_1.time_ and arg_127_1.time_ <= var_130_9 + arg_130_0 then
				arg_127_1.var_.moveOldPos1059ui_story = var_130_8.localPosition
			end

			local var_130_10 = 0.001

			if var_130_9 <= arg_127_1.time_ and arg_127_1.time_ < var_130_9 + var_130_10 then
				local var_130_11 = (arg_127_1.time_ - var_130_9) / var_130_10
				local var_130_12 = Vector3.New(-0.7, -1.05, -6)

				var_130_8.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1059ui_story, var_130_12, var_130_11)

				local var_130_13 = manager.ui.mainCamera.transform.position - var_130_8.position

				var_130_8.forward = Vector3.New(var_130_13.x, var_130_13.y, var_130_13.z)

				local var_130_14 = var_130_8.localEulerAngles

				var_130_14.z = 0
				var_130_14.x = 0
				var_130_8.localEulerAngles = var_130_14
			end

			if arg_127_1.time_ >= var_130_9 + var_130_10 and arg_127_1.time_ < var_130_9 + var_130_10 + arg_130_0 then
				var_130_8.localPosition = Vector3.New(-0.7, -1.05, -6)

				local var_130_15 = manager.ui.mainCamera.transform.position - var_130_8.position

				var_130_8.forward = Vector3.New(var_130_15.x, var_130_15.y, var_130_15.z)

				local var_130_16 = var_130_8.localEulerAngles

				var_130_16.z = 0
				var_130_16.x = 0
				var_130_8.localEulerAngles = var_130_16
			end

			local var_130_17 = 0

			if var_130_17 < arg_127_1.time_ and arg_127_1.time_ <= var_130_17 + arg_130_0 then
				arg_127_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action2_1")
			end

			local var_130_18 = 0

			if var_130_18 < arg_127_1.time_ and arg_127_1.time_ <= var_130_18 + arg_130_0 then
				arg_127_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_130_19 = 0
			local var_130_20 = 0.6

			if var_130_19 < arg_127_1.time_ and arg_127_1.time_ <= var_130_19 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_21 = arg_127_1:FormatText(StoryNameCfg[28].name)

				arg_127_1.leftNameTxt_.text = var_130_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_22 = arg_127_1:GetWordFromCfg(105121030)
				local var_130_23 = arg_127_1:FormatText(var_130_22.content)

				arg_127_1.text_.text = var_130_23

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_24 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121030", "story_v_out_105121.awb") ~= 0 then
					local var_130_27 = manager.audio:GetVoiceLength("story_v_out_105121", "105121030", "story_v_out_105121.awb") / 1000

					if var_130_27 + var_130_19 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_27 + var_130_19
					end

					if var_130_22.prefab_name ~= "" and arg_127_1.actors_[var_130_22.prefab_name] ~= nil then
						local var_130_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_22.prefab_name].transform, "story_v_out_105121", "105121030", "story_v_out_105121.awb")

						arg_127_1:RecordAudio("105121030", var_130_28)
						arg_127_1:RecordAudio("105121030", var_130_28)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_105121", "105121030", "story_v_out_105121.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_105121", "105121030", "story_v_out_105121.awb")
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
	Play105121031 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 105121031
		arg_131_1.duration_ = 4.366

		local var_131_0 = {
			ja = 3.6,
			ko = 4.366,
			zh = 3.4,
			en = 2.333
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
				arg_131_0:Play105121032(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = "1037ui_story"

			if arg_131_1.actors_[var_134_0] == nil then
				local var_134_1 = Object.Instantiate(Asset.Load("Char/" .. var_134_0), arg_131_1.stage_.transform)

				var_134_1.name = var_134_0
				var_134_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_131_1.actors_[var_134_0] = var_134_1

				local var_134_2 = var_134_1:GetComponentInChildren(typeof(CharacterEffect))

				var_134_2.enabled = true

				local var_134_3 = GameObjectTools.GetOrAddComponent(var_134_1, typeof(DynamicBoneHelper))

				if var_134_3 then
					var_134_3:EnableDynamicBone(false)
				end

				arg_131_1:ShowWeapon(var_134_2.transform, false)

				arg_131_1.var_[var_134_0 .. "Animator"] = var_134_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_131_1.var_[var_134_0 .. "Animator"].applyRootMotion = true
				arg_131_1.var_[var_134_0 .. "LipSync"] = var_134_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_134_4 = arg_131_1.actors_["1037ui_story"]
			local var_134_5 = 0

			if var_134_5 < arg_131_1.time_ and arg_131_1.time_ <= var_134_5 + arg_134_0 and arg_131_1.var_.characterEffect1037ui_story == nil then
				arg_131_1.var_.characterEffect1037ui_story = var_134_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_6 = 0.1

			if var_134_5 <= arg_131_1.time_ and arg_131_1.time_ < var_134_5 + var_134_6 then
				local var_134_7 = (arg_131_1.time_ - var_134_5) / var_134_6

				if arg_131_1.var_.characterEffect1037ui_story then
					arg_131_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_5 + var_134_6 and arg_131_1.time_ < var_134_5 + var_134_6 + arg_134_0 and arg_131_1.var_.characterEffect1037ui_story then
				arg_131_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_134_8 = arg_131_1.actors_["1059ui_story"]
			local var_134_9 = 0

			if var_134_9 < arg_131_1.time_ and arg_131_1.time_ <= var_134_9 + arg_134_0 and arg_131_1.var_.characterEffect1059ui_story == nil then
				arg_131_1.var_.characterEffect1059ui_story = var_134_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_10 = 0.1

			if var_134_9 <= arg_131_1.time_ and arg_131_1.time_ < var_134_9 + var_134_10 then
				local var_134_11 = (arg_131_1.time_ - var_134_9) / var_134_10

				if arg_131_1.var_.characterEffect1059ui_story then
					local var_134_12 = Mathf.Lerp(0, 0.5, var_134_11)

					arg_131_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_131_1.var_.characterEffect1059ui_story.fillRatio = var_134_12
				end
			end

			if arg_131_1.time_ >= var_134_9 + var_134_10 and arg_131_1.time_ < var_134_9 + var_134_10 + arg_134_0 and arg_131_1.var_.characterEffect1059ui_story then
				local var_134_13 = 0.5

				arg_131_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_131_1.var_.characterEffect1059ui_story.fillRatio = var_134_13
			end

			local var_134_14 = arg_131_1.actors_["1037ui_story"].transform
			local var_134_15 = 0

			if var_134_15 < arg_131_1.time_ and arg_131_1.time_ <= var_134_15 + arg_134_0 then
				arg_131_1.var_.moveOldPos1037ui_story = var_134_14.localPosition
			end

			local var_134_16 = 0.001

			if var_134_15 <= arg_131_1.time_ and arg_131_1.time_ < var_134_15 + var_134_16 then
				local var_134_17 = (arg_131_1.time_ - var_134_15) / var_134_16
				local var_134_18 = Vector3.New(0.7, -1.09, -5.81)

				var_134_14.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1037ui_story, var_134_18, var_134_17)

				local var_134_19 = manager.ui.mainCamera.transform.position - var_134_14.position

				var_134_14.forward = Vector3.New(var_134_19.x, var_134_19.y, var_134_19.z)

				local var_134_20 = var_134_14.localEulerAngles

				var_134_20.z = 0
				var_134_20.x = 0
				var_134_14.localEulerAngles = var_134_20
			end

			if arg_131_1.time_ >= var_134_15 + var_134_16 and arg_131_1.time_ < var_134_15 + var_134_16 + arg_134_0 then
				var_134_14.localPosition = Vector3.New(0.7, -1.09, -5.81)

				local var_134_21 = manager.ui.mainCamera.transform.position - var_134_14.position

				var_134_14.forward = Vector3.New(var_134_21.x, var_134_21.y, var_134_21.z)

				local var_134_22 = var_134_14.localEulerAngles

				var_134_22.z = 0
				var_134_22.x = 0
				var_134_14.localEulerAngles = var_134_22
			end

			local var_134_23 = 0

			if var_134_23 < arg_131_1.time_ and arg_131_1.time_ <= var_134_23 + arg_134_0 then
				arg_131_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action3_1")
			end

			local var_134_24 = 0

			if var_134_24 < arg_131_1.time_ and arg_131_1.time_ <= var_134_24 + arg_134_0 then
				arg_131_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_134_25 = 0
			local var_134_26 = 0.4

			if var_134_25 < arg_131_1.time_ and arg_131_1.time_ <= var_134_25 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_27 = arg_131_1:FormatText(StoryNameCfg[15].name)

				arg_131_1.leftNameTxt_.text = var_134_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_28 = arg_131_1:GetWordFromCfg(105121031)
				local var_134_29 = arg_131_1:FormatText(var_134_28.content)

				arg_131_1.text_.text = var_134_29

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_30 = 16
				local var_134_31 = utf8.len(var_134_29)
				local var_134_32 = var_134_30 <= 0 and var_134_26 or var_134_26 * (var_134_31 / var_134_30)

				if var_134_32 > 0 and var_134_26 < var_134_32 then
					arg_131_1.talkMaxDuration = var_134_32

					if var_134_32 + var_134_25 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_32 + var_134_25
					end
				end

				arg_131_1.text_.text = var_134_29
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121031", "story_v_out_105121.awb") ~= 0 then
					local var_134_33 = manager.audio:GetVoiceLength("story_v_out_105121", "105121031", "story_v_out_105121.awb") / 1000

					if var_134_33 + var_134_25 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_33 + var_134_25
					end

					if var_134_28.prefab_name ~= "" and arg_131_1.actors_[var_134_28.prefab_name] ~= nil then
						local var_134_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_28.prefab_name].transform, "story_v_out_105121", "105121031", "story_v_out_105121.awb")

						arg_131_1:RecordAudio("105121031", var_134_34)
						arg_131_1:RecordAudio("105121031", var_134_34)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_105121", "105121031", "story_v_out_105121.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_105121", "105121031", "story_v_out_105121.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_35 = math.max(var_134_26, arg_131_1.talkMaxDuration)

			if var_134_25 <= arg_131_1.time_ and arg_131_1.time_ < var_134_25 + var_134_35 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_25) / var_134_35

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_25 + var_134_35 and arg_131_1.time_ < var_134_25 + var_134_35 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play105121032 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 105121032
		arg_135_1.duration_ = 5.366

		local var_135_0 = {
			ja = 5.366,
			ko = 4.3,
			zh = 3.066,
			en = 3.066
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
				arg_135_0:Play105121033(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1036ui_story"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.characterEffect1036ui_story == nil then
				arg_135_1.var_.characterEffect1036ui_story = var_138_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_2 = 0.1

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.characterEffect1036ui_story then
					arg_135_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect1036ui_story then
				arg_135_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_138_4 = arg_135_1.actors_["1037ui_story"]
			local var_138_5 = 0

			if var_138_5 < arg_135_1.time_ and arg_135_1.time_ <= var_138_5 + arg_138_0 and arg_135_1.var_.characterEffect1037ui_story == nil then
				arg_135_1.var_.characterEffect1037ui_story = var_138_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_6 = 0.1

			if var_138_5 <= arg_135_1.time_ and arg_135_1.time_ < var_138_5 + var_138_6 then
				local var_138_7 = (arg_135_1.time_ - var_138_5) / var_138_6

				if arg_135_1.var_.characterEffect1037ui_story then
					local var_138_8 = Mathf.Lerp(0, 0.5, var_138_7)

					arg_135_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_135_1.var_.characterEffect1037ui_story.fillRatio = var_138_8
				end
			end

			if arg_135_1.time_ >= var_138_5 + var_138_6 and arg_135_1.time_ < var_138_5 + var_138_6 + arg_138_0 and arg_135_1.var_.characterEffect1037ui_story then
				local var_138_9 = 0.5

				arg_135_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_135_1.var_.characterEffect1037ui_story.fillRatio = var_138_9
			end

			local var_138_10 = arg_135_1.actors_["1037ui_story"].transform
			local var_138_11 = 0

			if var_138_11 < arg_135_1.time_ and arg_135_1.time_ <= var_138_11 + arg_138_0 then
				arg_135_1.var_.moveOldPos1037ui_story = var_138_10.localPosition
			end

			local var_138_12 = 0.001

			if var_138_11 <= arg_135_1.time_ and arg_135_1.time_ < var_138_11 + var_138_12 then
				local var_138_13 = (arg_135_1.time_ - var_138_11) / var_138_12
				local var_138_14 = Vector3.New(0, 100, 0)

				var_138_10.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1037ui_story, var_138_14, var_138_13)

				local var_138_15 = manager.ui.mainCamera.transform.position - var_138_10.position

				var_138_10.forward = Vector3.New(var_138_15.x, var_138_15.y, var_138_15.z)

				local var_138_16 = var_138_10.localEulerAngles

				var_138_16.z = 0
				var_138_16.x = 0
				var_138_10.localEulerAngles = var_138_16
			end

			if arg_135_1.time_ >= var_138_11 + var_138_12 and arg_135_1.time_ < var_138_11 + var_138_12 + arg_138_0 then
				var_138_10.localPosition = Vector3.New(0, 100, 0)

				local var_138_17 = manager.ui.mainCamera.transform.position - var_138_10.position

				var_138_10.forward = Vector3.New(var_138_17.x, var_138_17.y, var_138_17.z)

				local var_138_18 = var_138_10.localEulerAngles

				var_138_18.z = 0
				var_138_18.x = 0
				var_138_10.localEulerAngles = var_138_18
			end

			local var_138_19 = arg_135_1.actors_["1059ui_story"].transform
			local var_138_20 = 0

			if var_138_20 < arg_135_1.time_ and arg_135_1.time_ <= var_138_20 + arg_138_0 then
				arg_135_1.var_.moveOldPos1059ui_story = var_138_19.localPosition
			end

			local var_138_21 = 0.001

			if var_138_20 <= arg_135_1.time_ and arg_135_1.time_ < var_138_20 + var_138_21 then
				local var_138_22 = (arg_135_1.time_ - var_138_20) / var_138_21
				local var_138_23 = Vector3.New(0, 100, 0)

				var_138_19.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1059ui_story, var_138_23, var_138_22)

				local var_138_24 = manager.ui.mainCamera.transform.position - var_138_19.position

				var_138_19.forward = Vector3.New(var_138_24.x, var_138_24.y, var_138_24.z)

				local var_138_25 = var_138_19.localEulerAngles

				var_138_25.z = 0
				var_138_25.x = 0
				var_138_19.localEulerAngles = var_138_25
			end

			if arg_135_1.time_ >= var_138_20 + var_138_21 and arg_135_1.time_ < var_138_20 + var_138_21 + arg_138_0 then
				var_138_19.localPosition = Vector3.New(0, 100, 0)

				local var_138_26 = manager.ui.mainCamera.transform.position - var_138_19.position

				var_138_19.forward = Vector3.New(var_138_26.x, var_138_26.y, var_138_26.z)

				local var_138_27 = var_138_19.localEulerAngles

				var_138_27.z = 0
				var_138_27.x = 0
				var_138_19.localEulerAngles = var_138_27
			end

			local var_138_28 = 0

			if var_138_28 < arg_135_1.time_ and arg_135_1.time_ <= var_138_28 + arg_138_0 then
				arg_135_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action5_1")
			end

			local var_138_29 = arg_135_1.actors_["1036ui_story"].transform
			local var_138_30 = 0

			if var_138_30 < arg_135_1.time_ and arg_135_1.time_ <= var_138_30 + arg_138_0 then
				arg_135_1.var_.moveOldPos1036ui_story = var_138_29.localPosition
			end

			local var_138_31 = 0.001

			if var_138_30 <= arg_135_1.time_ and arg_135_1.time_ < var_138_30 + var_138_31 then
				local var_138_32 = (arg_135_1.time_ - var_138_30) / var_138_31
				local var_138_33 = Vector3.New(0, -1.09, -5.78)

				var_138_29.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1036ui_story, var_138_33, var_138_32)

				local var_138_34 = manager.ui.mainCamera.transform.position - var_138_29.position

				var_138_29.forward = Vector3.New(var_138_34.x, var_138_34.y, var_138_34.z)

				local var_138_35 = var_138_29.localEulerAngles

				var_138_35.z = 0
				var_138_35.x = 0
				var_138_29.localEulerAngles = var_138_35
			end

			if arg_135_1.time_ >= var_138_30 + var_138_31 and arg_135_1.time_ < var_138_30 + var_138_31 + arg_138_0 then
				var_138_29.localPosition = Vector3.New(0, -1.09, -5.78)

				local var_138_36 = manager.ui.mainCamera.transform.position - var_138_29.position

				var_138_29.forward = Vector3.New(var_138_36.x, var_138_36.y, var_138_36.z)

				local var_138_37 = var_138_29.localEulerAngles

				var_138_37.z = 0
				var_138_37.x = 0
				var_138_29.localEulerAngles = var_138_37
			end

			local var_138_38 = 0

			if var_138_38 < arg_135_1.time_ and arg_135_1.time_ <= var_138_38 + arg_138_0 then
				arg_135_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_138_39 = 0
			local var_138_40 = 0.45

			if var_138_39 < arg_135_1.time_ and arg_135_1.time_ <= var_138_39 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_41 = arg_135_1:FormatText(StoryNameCfg[5].name)

				arg_135_1.leftNameTxt_.text = var_138_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_42 = arg_135_1:GetWordFromCfg(105121032)
				local var_138_43 = arg_135_1:FormatText(var_138_42.content)

				arg_135_1.text_.text = var_138_43

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_44 = 16
				local var_138_45 = utf8.len(var_138_43)
				local var_138_46 = var_138_44 <= 0 and var_138_40 or var_138_40 * (var_138_45 / var_138_44)

				if var_138_46 > 0 and var_138_40 < var_138_46 then
					arg_135_1.talkMaxDuration = var_138_46

					if var_138_46 + var_138_39 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_46 + var_138_39
					end
				end

				arg_135_1.text_.text = var_138_43
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121032", "story_v_out_105121.awb") ~= 0 then
					local var_138_47 = manager.audio:GetVoiceLength("story_v_out_105121", "105121032", "story_v_out_105121.awb") / 1000

					if var_138_47 + var_138_39 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_47 + var_138_39
					end

					if var_138_42.prefab_name ~= "" and arg_135_1.actors_[var_138_42.prefab_name] ~= nil then
						local var_138_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_42.prefab_name].transform, "story_v_out_105121", "105121032", "story_v_out_105121.awb")

						arg_135_1:RecordAudio("105121032", var_138_48)
						arg_135_1:RecordAudio("105121032", var_138_48)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_105121", "105121032", "story_v_out_105121.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_105121", "105121032", "story_v_out_105121.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_49 = math.max(var_138_40, arg_135_1.talkMaxDuration)

			if var_138_39 <= arg_135_1.time_ and arg_135_1.time_ < var_138_39 + var_138_49 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_39) / var_138_49

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_39 + var_138_49 and arg_135_1.time_ < var_138_39 + var_138_49 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play105121033 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 105121033
		arg_139_1.duration_ = 0.100000001489

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"

			SetActive(arg_139_1.choicesGo_, true)

			for iter_140_0, iter_140_1 in ipairs(arg_139_1.choices_) do
				local var_140_0 = iter_140_0 <= 1

				SetActive(iter_140_1.go, var_140_0)
			end

			arg_139_1.choices_[1].txt.text = arg_139_1:FormatText(StoryChoiceCfg[34].name)
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play105121034(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1036ui_story"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.characterEffect1036ui_story == nil then
				arg_139_1.var_.characterEffect1036ui_story = var_142_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_2 = 0.1

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.characterEffect1036ui_story then
					local var_142_4 = Mathf.Lerp(0, 0.5, var_142_3)

					arg_139_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1036ui_story.fillRatio = var_142_4
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect1036ui_story then
				local var_142_5 = 0.5

				arg_139_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1036ui_story.fillRatio = var_142_5
			end
		end
	end,
	Play105121034 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 105121034
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play105121035(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1036ui_story"].transform
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.var_.moveOldPos1036ui_story = var_146_0.localPosition
			end

			local var_146_2 = 0.001

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2
				local var_146_4 = Vector3.New(0, 100, 0)

				var_146_0.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1036ui_story, var_146_4, var_146_3)

				local var_146_5 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_5.x, var_146_5.y, var_146_5.z)

				local var_146_6 = var_146_0.localEulerAngles

				var_146_6.z = 0
				var_146_6.x = 0
				var_146_0.localEulerAngles = var_146_6
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 then
				var_146_0.localPosition = Vector3.New(0, 100, 0)

				local var_146_7 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_7.x, var_146_7.y, var_146_7.z)

				local var_146_8 = var_146_0.localEulerAngles

				var_146_8.z = 0
				var_146_8.x = 0
				var_146_0.localEulerAngles = var_146_8
			end

			local var_146_9 = 0
			local var_146_10 = 0.35

			if var_146_9 < arg_143_1.time_ and arg_143_1.time_ <= var_146_9 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_11 = arg_143_1:FormatText(StoryNameCfg[7].name)

				arg_143_1.leftNameTxt_.text = var_146_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_12 = arg_143_1:GetWordFromCfg(105121034)
				local var_146_13 = arg_143_1:FormatText(var_146_12.content)

				arg_143_1.text_.text = var_146_13

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_14 = 14
				local var_146_15 = utf8.len(var_146_13)
				local var_146_16 = var_146_14 <= 0 and var_146_10 or var_146_10 * (var_146_15 / var_146_14)

				if var_146_16 > 0 and var_146_10 < var_146_16 then
					arg_143_1.talkMaxDuration = var_146_16

					if var_146_16 + var_146_9 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_16 + var_146_9
					end
				end

				arg_143_1.text_.text = var_146_13
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_17 = math.max(var_146_10, arg_143_1.talkMaxDuration)

			if var_146_9 <= arg_143_1.time_ and arg_143_1.time_ < var_146_9 + var_146_17 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_9) / var_146_17

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_9 + var_146_17 and arg_143_1.time_ < var_146_9 + var_146_17 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play105121035 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 105121035
		arg_147_1.duration_ = 5

		local var_147_0 = {
			ja = 5,
			ko = 3.7,
			zh = 3.7,
			en = 4.033
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
				arg_147_0:Play105121036(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1019ui_story"]
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 and arg_147_1.var_.characterEffect1019ui_story == nil then
				arg_147_1.var_.characterEffect1019ui_story = var_150_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_2 = 0.1

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2

				if arg_147_1.var_.characterEffect1019ui_story then
					arg_147_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 and arg_147_1.var_.characterEffect1019ui_story then
				arg_147_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_150_4 = arg_147_1.actors_["1019ui_story"].transform
			local var_150_5 = 0

			if var_150_5 < arg_147_1.time_ and arg_147_1.time_ <= var_150_5 + arg_150_0 then
				arg_147_1.var_.moveOldPos1019ui_story = var_150_4.localPosition
			end

			local var_150_6 = 0.001

			if var_150_5 <= arg_147_1.time_ and arg_147_1.time_ < var_150_5 + var_150_6 then
				local var_150_7 = (arg_147_1.time_ - var_150_5) / var_150_6
				local var_150_8 = Vector3.New(0, -1.08, -5.9)

				var_150_4.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1019ui_story, var_150_8, var_150_7)

				local var_150_9 = manager.ui.mainCamera.transform.position - var_150_4.position

				var_150_4.forward = Vector3.New(var_150_9.x, var_150_9.y, var_150_9.z)

				local var_150_10 = var_150_4.localEulerAngles

				var_150_10.z = 0
				var_150_10.x = 0
				var_150_4.localEulerAngles = var_150_10
			end

			if arg_147_1.time_ >= var_150_5 + var_150_6 and arg_147_1.time_ < var_150_5 + var_150_6 + arg_150_0 then
				var_150_4.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_150_11 = manager.ui.mainCamera.transform.position - var_150_4.position

				var_150_4.forward = Vector3.New(var_150_11.x, var_150_11.y, var_150_11.z)

				local var_150_12 = var_150_4.localEulerAngles

				var_150_12.z = 0
				var_150_12.x = 0
				var_150_4.localEulerAngles = var_150_12
			end

			local var_150_13 = 0

			if var_150_13 < arg_147_1.time_ and arg_147_1.time_ <= var_150_13 + arg_150_0 then
				arg_147_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action7_1")
			end

			local var_150_14 = 0

			if var_150_14 < arg_147_1.time_ and arg_147_1.time_ <= var_150_14 + arg_150_0 then
				arg_147_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_150_15 = 0
			local var_150_16 = 0.375

			if var_150_15 < arg_147_1.time_ and arg_147_1.time_ <= var_150_15 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_17 = arg_147_1:FormatText(StoryNameCfg[13].name)

				arg_147_1.leftNameTxt_.text = var_150_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_18 = arg_147_1:GetWordFromCfg(105121035)
				local var_150_19 = arg_147_1:FormatText(var_150_18.content)

				arg_147_1.text_.text = var_150_19

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_20 = 13
				local var_150_21 = utf8.len(var_150_19)
				local var_150_22 = var_150_20 <= 0 and var_150_16 or var_150_16 * (var_150_21 / var_150_20)

				if var_150_22 > 0 and var_150_16 < var_150_22 then
					arg_147_1.talkMaxDuration = var_150_22

					if var_150_22 + var_150_15 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_22 + var_150_15
					end
				end

				arg_147_1.text_.text = var_150_19
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121035", "story_v_out_105121.awb") ~= 0 then
					local var_150_23 = manager.audio:GetVoiceLength("story_v_out_105121", "105121035", "story_v_out_105121.awb") / 1000

					if var_150_23 + var_150_15 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_23 + var_150_15
					end

					if var_150_18.prefab_name ~= "" and arg_147_1.actors_[var_150_18.prefab_name] ~= nil then
						local var_150_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_18.prefab_name].transform, "story_v_out_105121", "105121035", "story_v_out_105121.awb")

						arg_147_1:RecordAudio("105121035", var_150_24)
						arg_147_1:RecordAudio("105121035", var_150_24)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_105121", "105121035", "story_v_out_105121.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_105121", "105121035", "story_v_out_105121.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_25 = math.max(var_150_16, arg_147_1.talkMaxDuration)

			if var_150_15 <= arg_147_1.time_ and arg_147_1.time_ < var_150_15 + var_150_25 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_15) / var_150_25

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_15 + var_150_25 and arg_147_1.time_ < var_150_15 + var_150_25 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play105121036 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 105121036
		arg_151_1.duration_ = 10.866

		local var_151_0 = {
			ja = 10.866,
			ko = 3.166,
			zh = 5.266,
			en = 5.066
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
				arg_151_0:Play105121037(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = "1148ui_story"

			if arg_151_1.actors_[var_154_0] == nil then
				local var_154_1 = Object.Instantiate(Asset.Load("Char/" .. var_154_0), arg_151_1.stage_.transform)

				var_154_1.name = var_154_0
				var_154_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_151_1.actors_[var_154_0] = var_154_1

				local var_154_2 = var_154_1:GetComponentInChildren(typeof(CharacterEffect))

				var_154_2.enabled = true

				local var_154_3 = GameObjectTools.GetOrAddComponent(var_154_1, typeof(DynamicBoneHelper))

				if var_154_3 then
					var_154_3:EnableDynamicBone(false)
				end

				arg_151_1:ShowWeapon(var_154_2.transform, false)

				arg_151_1.var_[var_154_0 .. "Animator"] = var_154_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_151_1.var_[var_154_0 .. "Animator"].applyRootMotion = true
				arg_151_1.var_[var_154_0 .. "LipSync"] = var_154_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_154_4 = arg_151_1.actors_["1148ui_story"]
			local var_154_5 = 0

			if var_154_5 < arg_151_1.time_ and arg_151_1.time_ <= var_154_5 + arg_154_0 and arg_151_1.var_.characterEffect1148ui_story == nil then
				arg_151_1.var_.characterEffect1148ui_story = var_154_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_6 = 0.1

			if var_154_5 <= arg_151_1.time_ and arg_151_1.time_ < var_154_5 + var_154_6 then
				local var_154_7 = (arg_151_1.time_ - var_154_5) / var_154_6

				if arg_151_1.var_.characterEffect1148ui_story then
					arg_151_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_5 + var_154_6 and arg_151_1.time_ < var_154_5 + var_154_6 + arg_154_0 and arg_151_1.var_.characterEffect1148ui_story then
				arg_151_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_154_8 = "1011ui_story"

			if arg_151_1.actors_[var_154_8] == nil then
				local var_154_9 = Object.Instantiate(Asset.Load("Char/" .. var_154_8), arg_151_1.stage_.transform)

				var_154_9.name = var_154_8
				var_154_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_151_1.actors_[var_154_8] = var_154_9

				local var_154_10 = var_154_9:GetComponentInChildren(typeof(CharacterEffect))

				var_154_10.enabled = true

				local var_154_11 = GameObjectTools.GetOrAddComponent(var_154_9, typeof(DynamicBoneHelper))

				if var_154_11 then
					var_154_11:EnableDynamicBone(false)
				end

				arg_151_1:ShowWeapon(var_154_10.transform, false)

				arg_151_1.var_[var_154_8 .. "Animator"] = var_154_10.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_151_1.var_[var_154_8 .. "Animator"].applyRootMotion = true
				arg_151_1.var_[var_154_8 .. "LipSync"] = var_154_10.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_154_12 = arg_151_1.actors_["1011ui_story"]
			local var_154_13 = 0

			if var_154_13 < arg_151_1.time_ and arg_151_1.time_ <= var_154_13 + arg_154_0 and arg_151_1.var_.characterEffect1011ui_story == nil then
				arg_151_1.var_.characterEffect1011ui_story = var_154_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_14 = 0.1

			if var_154_13 <= arg_151_1.time_ and arg_151_1.time_ < var_154_13 + var_154_14 then
				local var_154_15 = (arg_151_1.time_ - var_154_13) / var_154_14

				if arg_151_1.var_.characterEffect1011ui_story then
					local var_154_16 = Mathf.Lerp(0, 0.5, var_154_15)

					arg_151_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_151_1.var_.characterEffect1011ui_story.fillRatio = var_154_16
				end
			end

			if arg_151_1.time_ >= var_154_13 + var_154_14 and arg_151_1.time_ < var_154_13 + var_154_14 + arg_154_0 and arg_151_1.var_.characterEffect1011ui_story then
				local var_154_17 = 0.5

				arg_151_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_151_1.var_.characterEffect1011ui_story.fillRatio = var_154_17
			end

			local var_154_18 = arg_151_1.actors_["1019ui_story"].transform
			local var_154_19 = 0

			if var_154_19 < arg_151_1.time_ and arg_151_1.time_ <= var_154_19 + arg_154_0 then
				arg_151_1.var_.moveOldPos1019ui_story = var_154_18.localPosition
			end

			local var_154_20 = 0.001

			if var_154_19 <= arg_151_1.time_ and arg_151_1.time_ < var_154_19 + var_154_20 then
				local var_154_21 = (arg_151_1.time_ - var_154_19) / var_154_20
				local var_154_22 = Vector3.New(0, 100, 0)

				var_154_18.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1019ui_story, var_154_22, var_154_21)

				local var_154_23 = manager.ui.mainCamera.transform.position - var_154_18.position

				var_154_18.forward = Vector3.New(var_154_23.x, var_154_23.y, var_154_23.z)

				local var_154_24 = var_154_18.localEulerAngles

				var_154_24.z = 0
				var_154_24.x = 0
				var_154_18.localEulerAngles = var_154_24
			end

			if arg_151_1.time_ >= var_154_19 + var_154_20 and arg_151_1.time_ < var_154_19 + var_154_20 + arg_154_0 then
				var_154_18.localPosition = Vector3.New(0, 100, 0)

				local var_154_25 = manager.ui.mainCamera.transform.position - var_154_18.position

				var_154_18.forward = Vector3.New(var_154_25.x, var_154_25.y, var_154_25.z)

				local var_154_26 = var_154_18.localEulerAngles

				var_154_26.z = 0
				var_154_26.x = 0
				var_154_18.localEulerAngles = var_154_26
			end

			local var_154_27 = arg_151_1.actors_["1148ui_story"].transform
			local var_154_28 = 0

			if var_154_28 < arg_151_1.time_ and arg_151_1.time_ <= var_154_28 + arg_154_0 then
				arg_151_1.var_.moveOldPos1148ui_story = var_154_27.localPosition
			end

			local var_154_29 = 0.001

			if var_154_28 <= arg_151_1.time_ and arg_151_1.time_ < var_154_28 + var_154_29 then
				local var_154_30 = (arg_151_1.time_ - var_154_28) / var_154_29
				local var_154_31 = Vector3.New(0, -0.8, -6.2)

				var_154_27.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1148ui_story, var_154_31, var_154_30)

				local var_154_32 = manager.ui.mainCamera.transform.position - var_154_27.position

				var_154_27.forward = Vector3.New(var_154_32.x, var_154_32.y, var_154_32.z)

				local var_154_33 = var_154_27.localEulerAngles

				var_154_33.z = 0
				var_154_33.x = 0
				var_154_27.localEulerAngles = var_154_33
			end

			if arg_151_1.time_ >= var_154_28 + var_154_29 and arg_151_1.time_ < var_154_28 + var_154_29 + arg_154_0 then
				var_154_27.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_154_34 = manager.ui.mainCamera.transform.position - var_154_27.position

				var_154_27.forward = Vector3.New(var_154_34.x, var_154_34.y, var_154_34.z)

				local var_154_35 = var_154_27.localEulerAngles

				var_154_35.z = 0
				var_154_35.x = 0
				var_154_27.localEulerAngles = var_154_35
			end

			local var_154_36 = 0

			if var_154_36 < arg_151_1.time_ and arg_151_1.time_ <= var_154_36 + arg_154_0 then
				arg_151_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action7_1")
			end

			local var_154_37 = 0

			if var_154_37 < arg_151_1.time_ and arg_151_1.time_ <= var_154_37 + arg_154_0 then
				arg_151_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_154_38 = 0
			local var_154_39 = 0.575

			if var_154_38 < arg_151_1.time_ and arg_151_1.time_ <= var_154_38 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_40 = arg_151_1:FormatText(StoryNameCfg[8].name)

				arg_151_1.leftNameTxt_.text = var_154_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_41 = arg_151_1:GetWordFromCfg(105121036)
				local var_154_42 = arg_151_1:FormatText(var_154_41.content)

				arg_151_1.text_.text = var_154_42

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_43 = 23
				local var_154_44 = utf8.len(var_154_42)
				local var_154_45 = var_154_43 <= 0 and var_154_39 or var_154_39 * (var_154_44 / var_154_43)

				if var_154_45 > 0 and var_154_39 < var_154_45 then
					arg_151_1.talkMaxDuration = var_154_45

					if var_154_45 + var_154_38 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_45 + var_154_38
					end
				end

				arg_151_1.text_.text = var_154_42
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121036", "story_v_out_105121.awb") ~= 0 then
					local var_154_46 = manager.audio:GetVoiceLength("story_v_out_105121", "105121036", "story_v_out_105121.awb") / 1000

					if var_154_46 + var_154_38 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_46 + var_154_38
					end

					if var_154_41.prefab_name ~= "" and arg_151_1.actors_[var_154_41.prefab_name] ~= nil then
						local var_154_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_41.prefab_name].transform, "story_v_out_105121", "105121036", "story_v_out_105121.awb")

						arg_151_1:RecordAudio("105121036", var_154_47)
						arg_151_1:RecordAudio("105121036", var_154_47)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_105121", "105121036", "story_v_out_105121.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_105121", "105121036", "story_v_out_105121.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_48 = math.max(var_154_39, arg_151_1.talkMaxDuration)

			if var_154_38 <= arg_151_1.time_ and arg_151_1.time_ < var_154_38 + var_154_48 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_38) / var_154_48

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_38 + var_154_48 and arg_151_1.time_ < var_154_38 + var_154_48 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play105121037 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 105121037
		arg_155_1.duration_ = 5.9

		local var_155_0 = {
			ja = 5.9,
			ko = 5.433,
			zh = 5.533,
			en = 5.133
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
				arg_155_0:Play105121038(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = "10001_tpose"

			if arg_155_1.actors_[var_158_0] == nil then
				local var_158_1 = Object.Instantiate(Asset.Load("Char/" .. var_158_0), arg_155_1.stage_.transform)

				var_158_1.name = var_158_0
				var_158_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_155_1.actors_[var_158_0] = var_158_1

				local var_158_2 = var_158_1:GetComponentInChildren(typeof(CharacterEffect))

				var_158_2.enabled = true

				local var_158_3 = GameObjectTools.GetOrAddComponent(var_158_1, typeof(DynamicBoneHelper))

				if var_158_3 then
					var_158_3:EnableDynamicBone(false)
				end

				arg_155_1:ShowWeapon(var_158_2.transform, false)

				arg_155_1.var_[var_158_0 .. "Animator"] = var_158_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_155_1.var_[var_158_0 .. "Animator"].applyRootMotion = true
				arg_155_1.var_[var_158_0 .. "LipSync"] = var_158_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_158_4 = arg_155_1.actors_["10001_tpose"]
			local var_158_5 = 0

			if var_158_5 < arg_155_1.time_ and arg_155_1.time_ <= var_158_5 + arg_158_0 and arg_155_1.var_.characterEffect10001_tpose == nil then
				arg_155_1.var_.characterEffect10001_tpose = var_158_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_6 = 0.1

			if var_158_5 <= arg_155_1.time_ and arg_155_1.time_ < var_158_5 + var_158_6 then
				local var_158_7 = (arg_155_1.time_ - var_158_5) / var_158_6

				if arg_155_1.var_.characterEffect10001_tpose then
					arg_155_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_155_1.time_ >= var_158_5 + var_158_6 and arg_155_1.time_ < var_158_5 + var_158_6 + arg_158_0 and arg_155_1.var_.characterEffect10001_tpose then
				arg_155_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_158_8 = arg_155_1.actors_["1148ui_story"]
			local var_158_9 = 0

			if var_158_9 < arg_155_1.time_ and arg_155_1.time_ <= var_158_9 + arg_158_0 and arg_155_1.var_.characterEffect1148ui_story == nil then
				arg_155_1.var_.characterEffect1148ui_story = var_158_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_10 = 0.1

			if var_158_9 <= arg_155_1.time_ and arg_155_1.time_ < var_158_9 + var_158_10 then
				local var_158_11 = (arg_155_1.time_ - var_158_9) / var_158_10

				if arg_155_1.var_.characterEffect1148ui_story then
					local var_158_12 = Mathf.Lerp(0, 0.5, var_158_11)

					arg_155_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_155_1.var_.characterEffect1148ui_story.fillRatio = var_158_12
				end
			end

			if arg_155_1.time_ >= var_158_9 + var_158_10 and arg_155_1.time_ < var_158_9 + var_158_10 + arg_158_0 and arg_155_1.var_.characterEffect1148ui_story then
				local var_158_13 = 0.5

				arg_155_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_155_1.var_.characterEffect1148ui_story.fillRatio = var_158_13
			end

			local var_158_14 = arg_155_1.actors_["1148ui_story"].transform
			local var_158_15 = 0

			if var_158_15 < arg_155_1.time_ and arg_155_1.time_ <= var_158_15 + arg_158_0 then
				arg_155_1.var_.moveOldPos1148ui_story = var_158_14.localPosition
			end

			local var_158_16 = 0.001

			if var_158_15 <= arg_155_1.time_ and arg_155_1.time_ < var_158_15 + var_158_16 then
				local var_158_17 = (arg_155_1.time_ - var_158_15) / var_158_16
				local var_158_18 = Vector3.New(0, 100, 0)

				var_158_14.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos1148ui_story, var_158_18, var_158_17)

				local var_158_19 = manager.ui.mainCamera.transform.position - var_158_14.position

				var_158_14.forward = Vector3.New(var_158_19.x, var_158_19.y, var_158_19.z)

				local var_158_20 = var_158_14.localEulerAngles

				var_158_20.z = 0
				var_158_20.x = 0
				var_158_14.localEulerAngles = var_158_20
			end

			if arg_155_1.time_ >= var_158_15 + var_158_16 and arg_155_1.time_ < var_158_15 + var_158_16 + arg_158_0 then
				var_158_14.localPosition = Vector3.New(0, 100, 0)

				local var_158_21 = manager.ui.mainCamera.transform.position - var_158_14.position

				var_158_14.forward = Vector3.New(var_158_21.x, var_158_21.y, var_158_21.z)

				local var_158_22 = var_158_14.localEulerAngles

				var_158_22.z = 0
				var_158_22.x = 0
				var_158_14.localEulerAngles = var_158_22
			end

			local var_158_23 = 0

			if var_158_23 < arg_155_1.time_ and arg_155_1.time_ <= var_158_23 + arg_158_0 then
				arg_155_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action3_1")
			end

			local var_158_24 = arg_155_1.actors_["10001_tpose"].transform
			local var_158_25 = 0

			if var_158_25 < arg_155_1.time_ and arg_155_1.time_ <= var_158_25 + arg_158_0 then
				arg_155_1.var_.moveOldPos10001_tpose = var_158_24.localPosition
			end

			local var_158_26 = 0.001

			if var_158_25 <= arg_155_1.time_ and arg_155_1.time_ < var_158_25 + var_158_26 then
				local var_158_27 = (arg_155_1.time_ - var_158_25) / var_158_26
				local var_158_28 = Vector3.New(0, -1.23, -5.8)

				var_158_24.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos10001_tpose, var_158_28, var_158_27)

				local var_158_29 = manager.ui.mainCamera.transform.position - var_158_24.position

				var_158_24.forward = Vector3.New(var_158_29.x, var_158_29.y, var_158_29.z)

				local var_158_30 = var_158_24.localEulerAngles

				var_158_30.z = 0
				var_158_30.x = 0
				var_158_24.localEulerAngles = var_158_30
			end

			if arg_155_1.time_ >= var_158_25 + var_158_26 and arg_155_1.time_ < var_158_25 + var_158_26 + arg_158_0 then
				var_158_24.localPosition = Vector3.New(0, -1.23, -5.8)

				local var_158_31 = manager.ui.mainCamera.transform.position - var_158_24.position

				var_158_24.forward = Vector3.New(var_158_31.x, var_158_31.y, var_158_31.z)

				local var_158_32 = var_158_24.localEulerAngles

				var_158_32.z = 0
				var_158_32.x = 0
				var_158_24.localEulerAngles = var_158_32
			end

			local var_158_33 = 0

			if var_158_33 < arg_155_1.time_ and arg_155_1.time_ <= var_158_33 + arg_158_0 then
				arg_155_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_158_34 = 0
			local var_158_35 = 0.55

			if var_158_34 < arg_155_1.time_ and arg_155_1.time_ <= var_158_34 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_36 = arg_155_1:FormatText(StoryNameCfg[31].name)

				arg_155_1.leftNameTxt_.text = var_158_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_37 = arg_155_1:GetWordFromCfg(105121037)
				local var_158_38 = arg_155_1:FormatText(var_158_37.content)

				arg_155_1.text_.text = var_158_38

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_39 = 22
				local var_158_40 = utf8.len(var_158_38)
				local var_158_41 = var_158_39 <= 0 and var_158_35 or var_158_35 * (var_158_40 / var_158_39)

				if var_158_41 > 0 and var_158_35 < var_158_41 then
					arg_155_1.talkMaxDuration = var_158_41

					if var_158_41 + var_158_34 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_41 + var_158_34
					end
				end

				arg_155_1.text_.text = var_158_38
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121037", "story_v_out_105121.awb") ~= 0 then
					local var_158_42 = manager.audio:GetVoiceLength("story_v_out_105121", "105121037", "story_v_out_105121.awb") / 1000

					if var_158_42 + var_158_34 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_42 + var_158_34
					end

					if var_158_37.prefab_name ~= "" and arg_155_1.actors_[var_158_37.prefab_name] ~= nil then
						local var_158_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_37.prefab_name].transform, "story_v_out_105121", "105121037", "story_v_out_105121.awb")

						arg_155_1:RecordAudio("105121037", var_158_43)
						arg_155_1:RecordAudio("105121037", var_158_43)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_105121", "105121037", "story_v_out_105121.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_105121", "105121037", "story_v_out_105121.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_44 = math.max(var_158_35, arg_155_1.talkMaxDuration)

			if var_158_34 <= arg_155_1.time_ and arg_155_1.time_ < var_158_34 + var_158_44 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_34) / var_158_44

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_34 + var_158_44 and arg_155_1.time_ < var_158_34 + var_158_44 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play105121038 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 105121038
		arg_159_1.duration_ = 4.033

		local var_159_0 = {
			ja = 4,
			ko = 2.2,
			zh = 2.933,
			en = 4.033
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
				arg_159_0:Play105121039(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1036ui_story"]
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 and arg_159_1.var_.characterEffect1036ui_story == nil then
				arg_159_1.var_.characterEffect1036ui_story = var_162_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_2 = 0.1

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2

				if arg_159_1.var_.characterEffect1036ui_story then
					arg_159_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 and arg_159_1.var_.characterEffect1036ui_story then
				arg_159_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_162_4 = arg_159_1.actors_["10001_tpose"]
			local var_162_5 = 0

			if var_162_5 < arg_159_1.time_ and arg_159_1.time_ <= var_162_5 + arg_162_0 and arg_159_1.var_.characterEffect10001_tpose == nil then
				arg_159_1.var_.characterEffect10001_tpose = var_162_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_6 = 0.1

			if var_162_5 <= arg_159_1.time_ and arg_159_1.time_ < var_162_5 + var_162_6 then
				local var_162_7 = (arg_159_1.time_ - var_162_5) / var_162_6

				if arg_159_1.var_.characterEffect10001_tpose then
					local var_162_8 = Mathf.Lerp(0, 0.5, var_162_7)

					arg_159_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_159_1.var_.characterEffect10001_tpose.fillRatio = var_162_8
				end
			end

			if arg_159_1.time_ >= var_162_5 + var_162_6 and arg_159_1.time_ < var_162_5 + var_162_6 + arg_162_0 and arg_159_1.var_.characterEffect10001_tpose then
				local var_162_9 = 0.5

				arg_159_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_159_1.var_.characterEffect10001_tpose.fillRatio = var_162_9
			end

			local var_162_10 = arg_159_1.actors_["10001_tpose"].transform
			local var_162_11 = 0

			if var_162_11 < arg_159_1.time_ and arg_159_1.time_ <= var_162_11 + arg_162_0 then
				arg_159_1.var_.moveOldPos10001_tpose = var_162_10.localPosition
			end

			local var_162_12 = 0.001

			if var_162_11 <= arg_159_1.time_ and arg_159_1.time_ < var_162_11 + var_162_12 then
				local var_162_13 = (arg_159_1.time_ - var_162_11) / var_162_12
				local var_162_14 = Vector3.New(0, 100, 0)

				var_162_10.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos10001_tpose, var_162_14, var_162_13)

				local var_162_15 = manager.ui.mainCamera.transform.position - var_162_10.position

				var_162_10.forward = Vector3.New(var_162_15.x, var_162_15.y, var_162_15.z)

				local var_162_16 = var_162_10.localEulerAngles

				var_162_16.z = 0
				var_162_16.x = 0
				var_162_10.localEulerAngles = var_162_16
			end

			if arg_159_1.time_ >= var_162_11 + var_162_12 and arg_159_1.time_ < var_162_11 + var_162_12 + arg_162_0 then
				var_162_10.localPosition = Vector3.New(0, 100, 0)

				local var_162_17 = manager.ui.mainCamera.transform.position - var_162_10.position

				var_162_10.forward = Vector3.New(var_162_17.x, var_162_17.y, var_162_17.z)

				local var_162_18 = var_162_10.localEulerAngles

				var_162_18.z = 0
				var_162_18.x = 0
				var_162_10.localEulerAngles = var_162_18
			end

			local var_162_19 = arg_159_1.actors_["1036ui_story"].transform
			local var_162_20 = 0

			if var_162_20 < arg_159_1.time_ and arg_159_1.time_ <= var_162_20 + arg_162_0 then
				arg_159_1.var_.moveOldPos1036ui_story = var_162_19.localPosition
			end

			local var_162_21 = 0.001

			if var_162_20 <= arg_159_1.time_ and arg_159_1.time_ < var_162_20 + var_162_21 then
				local var_162_22 = (arg_159_1.time_ - var_162_20) / var_162_21
				local var_162_23 = Vector3.New(-0.7, -1.09, -5.78)

				var_162_19.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos1036ui_story, var_162_23, var_162_22)

				local var_162_24 = manager.ui.mainCamera.transform.position - var_162_19.position

				var_162_19.forward = Vector3.New(var_162_24.x, var_162_24.y, var_162_24.z)

				local var_162_25 = var_162_19.localEulerAngles

				var_162_25.z = 0
				var_162_25.x = 0
				var_162_19.localEulerAngles = var_162_25
			end

			if arg_159_1.time_ >= var_162_20 + var_162_21 and arg_159_1.time_ < var_162_20 + var_162_21 + arg_162_0 then
				var_162_19.localPosition = Vector3.New(-0.7, -1.09, -5.78)

				local var_162_26 = manager.ui.mainCamera.transform.position - var_162_19.position

				var_162_19.forward = Vector3.New(var_162_26.x, var_162_26.y, var_162_26.z)

				local var_162_27 = var_162_19.localEulerAngles

				var_162_27.z = 0
				var_162_27.x = 0
				var_162_19.localEulerAngles = var_162_27
			end

			local var_162_28 = 0

			if var_162_28 < arg_159_1.time_ and arg_159_1.time_ <= var_162_28 + arg_162_0 then
				arg_159_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action4_1")
			end

			local var_162_29 = 0

			if var_162_29 < arg_159_1.time_ and arg_159_1.time_ <= var_162_29 + arg_162_0 then
				arg_159_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_162_30 = 0
			local var_162_31 = 0.35

			if var_162_30 < arg_159_1.time_ and arg_159_1.time_ <= var_162_30 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_32 = arg_159_1:FormatText(StoryNameCfg[5].name)

				arg_159_1.leftNameTxt_.text = var_162_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_33 = arg_159_1:GetWordFromCfg(105121038)
				local var_162_34 = arg_159_1:FormatText(var_162_33.content)

				arg_159_1.text_.text = var_162_34

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_35 = 14
				local var_162_36 = utf8.len(var_162_34)
				local var_162_37 = var_162_35 <= 0 and var_162_31 or var_162_31 * (var_162_36 / var_162_35)

				if var_162_37 > 0 and var_162_31 < var_162_37 then
					arg_159_1.talkMaxDuration = var_162_37

					if var_162_37 + var_162_30 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_37 + var_162_30
					end
				end

				arg_159_1.text_.text = var_162_34
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121038", "story_v_out_105121.awb") ~= 0 then
					local var_162_38 = manager.audio:GetVoiceLength("story_v_out_105121", "105121038", "story_v_out_105121.awb") / 1000

					if var_162_38 + var_162_30 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_38 + var_162_30
					end

					if var_162_33.prefab_name ~= "" and arg_159_1.actors_[var_162_33.prefab_name] ~= nil then
						local var_162_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_33.prefab_name].transform, "story_v_out_105121", "105121038", "story_v_out_105121.awb")

						arg_159_1:RecordAudio("105121038", var_162_39)
						arg_159_1:RecordAudio("105121038", var_162_39)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_105121", "105121038", "story_v_out_105121.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_105121", "105121038", "story_v_out_105121.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_40 = math.max(var_162_31, arg_159_1.talkMaxDuration)

			if var_162_30 <= arg_159_1.time_ and arg_159_1.time_ < var_162_30 + var_162_40 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_30) / var_162_40

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_30 + var_162_40 and arg_159_1.time_ < var_162_30 + var_162_40 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play105121039 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 105121039
		arg_163_1.duration_ = 6.1

		local var_163_0 = {
			ja = 6.1,
			ko = 4.466,
			zh = 5.733,
			en = 5.333
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
				arg_163_0:Play105121040(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1148ui_story"]
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 and arg_163_1.var_.characterEffect1148ui_story == nil then
				arg_163_1.var_.characterEffect1148ui_story = var_166_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_2 = 0.1

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2

				if arg_163_1.var_.characterEffect1148ui_story then
					arg_163_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 and arg_163_1.var_.characterEffect1148ui_story then
				arg_163_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_166_4 = arg_163_1.actors_["1036ui_story"]
			local var_166_5 = 0

			if var_166_5 < arg_163_1.time_ and arg_163_1.time_ <= var_166_5 + arg_166_0 and arg_163_1.var_.characterEffect1036ui_story == nil then
				arg_163_1.var_.characterEffect1036ui_story = var_166_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_6 = 0.1

			if var_166_5 <= arg_163_1.time_ and arg_163_1.time_ < var_166_5 + var_166_6 then
				local var_166_7 = (arg_163_1.time_ - var_166_5) / var_166_6

				if arg_163_1.var_.characterEffect1036ui_story then
					local var_166_8 = Mathf.Lerp(0, 0.5, var_166_7)

					arg_163_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_163_1.var_.characterEffect1036ui_story.fillRatio = var_166_8
				end
			end

			if arg_163_1.time_ >= var_166_5 + var_166_6 and arg_163_1.time_ < var_166_5 + var_166_6 + arg_166_0 and arg_163_1.var_.characterEffect1036ui_story then
				local var_166_9 = 0.5

				arg_163_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_163_1.var_.characterEffect1036ui_story.fillRatio = var_166_9
			end

			local var_166_10 = arg_163_1.actors_["1148ui_story"].transform
			local var_166_11 = 0

			if var_166_11 < arg_163_1.time_ and arg_163_1.time_ <= var_166_11 + arg_166_0 then
				arg_163_1.var_.moveOldPos1148ui_story = var_166_10.localPosition
			end

			local var_166_12 = 0.001

			if var_166_11 <= arg_163_1.time_ and arg_163_1.time_ < var_166_11 + var_166_12 then
				local var_166_13 = (arg_163_1.time_ - var_166_11) / var_166_12
				local var_166_14 = Vector3.New(0.7, -0.8, -6.2)

				var_166_10.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1148ui_story, var_166_14, var_166_13)

				local var_166_15 = manager.ui.mainCamera.transform.position - var_166_10.position

				var_166_10.forward = Vector3.New(var_166_15.x, var_166_15.y, var_166_15.z)

				local var_166_16 = var_166_10.localEulerAngles

				var_166_16.z = 0
				var_166_16.x = 0
				var_166_10.localEulerAngles = var_166_16
			end

			if arg_163_1.time_ >= var_166_11 + var_166_12 and arg_163_1.time_ < var_166_11 + var_166_12 + arg_166_0 then
				var_166_10.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_166_17 = manager.ui.mainCamera.transform.position - var_166_10.position

				var_166_10.forward = Vector3.New(var_166_17.x, var_166_17.y, var_166_17.z)

				local var_166_18 = var_166_10.localEulerAngles

				var_166_18.z = 0
				var_166_18.x = 0
				var_166_10.localEulerAngles = var_166_18
			end

			local var_166_19 = 0

			if var_166_19 < arg_163_1.time_ and arg_163_1.time_ <= var_166_19 + arg_166_0 then
				arg_163_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action4_1")
			end

			local var_166_20 = 0

			if var_166_20 < arg_163_1.time_ and arg_163_1.time_ <= var_166_20 + arg_166_0 then
				arg_163_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_166_21 = 0
			local var_166_22 = 0.55

			if var_166_21 < arg_163_1.time_ and arg_163_1.time_ <= var_166_21 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_23 = arg_163_1:FormatText(StoryNameCfg[8].name)

				arg_163_1.leftNameTxt_.text = var_166_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_24 = arg_163_1:GetWordFromCfg(105121039)
				local var_166_25 = arg_163_1:FormatText(var_166_24.content)

				arg_163_1.text_.text = var_166_25

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_26 = 22
				local var_166_27 = utf8.len(var_166_25)
				local var_166_28 = var_166_26 <= 0 and var_166_22 or var_166_22 * (var_166_27 / var_166_26)

				if var_166_28 > 0 and var_166_22 < var_166_28 then
					arg_163_1.talkMaxDuration = var_166_28

					if var_166_28 + var_166_21 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_28 + var_166_21
					end
				end

				arg_163_1.text_.text = var_166_25
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121039", "story_v_out_105121.awb") ~= 0 then
					local var_166_29 = manager.audio:GetVoiceLength("story_v_out_105121", "105121039", "story_v_out_105121.awb") / 1000

					if var_166_29 + var_166_21 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_29 + var_166_21
					end

					if var_166_24.prefab_name ~= "" and arg_163_1.actors_[var_166_24.prefab_name] ~= nil then
						local var_166_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_24.prefab_name].transform, "story_v_out_105121", "105121039", "story_v_out_105121.awb")

						arg_163_1:RecordAudio("105121039", var_166_30)
						arg_163_1:RecordAudio("105121039", var_166_30)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_105121", "105121039", "story_v_out_105121.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_105121", "105121039", "story_v_out_105121.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_31 = math.max(var_166_22, arg_163_1.talkMaxDuration)

			if var_166_21 <= arg_163_1.time_ and arg_163_1.time_ < var_166_21 + var_166_31 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_21) / var_166_31

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_21 + var_166_31 and arg_163_1.time_ < var_166_21 + var_166_31 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play105121040 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 105121040
		arg_167_1.duration_ = 14.4

		local var_167_0 = {
			ja = 14.4,
			ko = 6.166,
			zh = 6.8,
			en = 8.066
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
				arg_167_0:Play105121041(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1019ui_story"]
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 and arg_167_1.var_.characterEffect1019ui_story == nil then
				arg_167_1.var_.characterEffect1019ui_story = var_170_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_2 = 0.1

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2

				if arg_167_1.var_.characterEffect1019ui_story then
					arg_167_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 and arg_167_1.var_.characterEffect1019ui_story then
				arg_167_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_170_4 = arg_167_1.actors_["1148ui_story"]
			local var_170_5 = 0

			if var_170_5 < arg_167_1.time_ and arg_167_1.time_ <= var_170_5 + arg_170_0 and arg_167_1.var_.characterEffect1148ui_story == nil then
				arg_167_1.var_.characterEffect1148ui_story = var_170_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_6 = 0.1

			if var_170_5 <= arg_167_1.time_ and arg_167_1.time_ < var_170_5 + var_170_6 then
				local var_170_7 = (arg_167_1.time_ - var_170_5) / var_170_6

				if arg_167_1.var_.characterEffect1148ui_story then
					local var_170_8 = Mathf.Lerp(0, 0.5, var_170_7)

					arg_167_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_167_1.var_.characterEffect1148ui_story.fillRatio = var_170_8
				end
			end

			if arg_167_1.time_ >= var_170_5 + var_170_6 and arg_167_1.time_ < var_170_5 + var_170_6 + arg_170_0 and arg_167_1.var_.characterEffect1148ui_story then
				local var_170_9 = 0.5

				arg_167_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_167_1.var_.characterEffect1148ui_story.fillRatio = var_170_9
			end

			local var_170_10 = arg_167_1.actors_["1148ui_story"].transform
			local var_170_11 = 0

			if var_170_11 < arg_167_1.time_ and arg_167_1.time_ <= var_170_11 + arg_170_0 then
				arg_167_1.var_.moveOldPos1148ui_story = var_170_10.localPosition
			end

			local var_170_12 = 0.001

			if var_170_11 <= arg_167_1.time_ and arg_167_1.time_ < var_170_11 + var_170_12 then
				local var_170_13 = (arg_167_1.time_ - var_170_11) / var_170_12
				local var_170_14 = Vector3.New(0, 100, 0)

				var_170_10.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1148ui_story, var_170_14, var_170_13)

				local var_170_15 = manager.ui.mainCamera.transform.position - var_170_10.position

				var_170_10.forward = Vector3.New(var_170_15.x, var_170_15.y, var_170_15.z)

				local var_170_16 = var_170_10.localEulerAngles

				var_170_16.z = 0
				var_170_16.x = 0
				var_170_10.localEulerAngles = var_170_16
			end

			if arg_167_1.time_ >= var_170_11 + var_170_12 and arg_167_1.time_ < var_170_11 + var_170_12 + arg_170_0 then
				var_170_10.localPosition = Vector3.New(0, 100, 0)

				local var_170_17 = manager.ui.mainCamera.transform.position - var_170_10.position

				var_170_10.forward = Vector3.New(var_170_17.x, var_170_17.y, var_170_17.z)

				local var_170_18 = var_170_10.localEulerAngles

				var_170_18.z = 0
				var_170_18.x = 0
				var_170_10.localEulerAngles = var_170_18
			end

			local var_170_19 = arg_167_1.actors_["1036ui_story"].transform
			local var_170_20 = 0

			if var_170_20 < arg_167_1.time_ and arg_167_1.time_ <= var_170_20 + arg_170_0 then
				arg_167_1.var_.moveOldPos1036ui_story = var_170_19.localPosition
			end

			local var_170_21 = 0.001

			if var_170_20 <= arg_167_1.time_ and arg_167_1.time_ < var_170_20 + var_170_21 then
				local var_170_22 = (arg_167_1.time_ - var_170_20) / var_170_21
				local var_170_23 = Vector3.New(0, 100, 0)

				var_170_19.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1036ui_story, var_170_23, var_170_22)

				local var_170_24 = manager.ui.mainCamera.transform.position - var_170_19.position

				var_170_19.forward = Vector3.New(var_170_24.x, var_170_24.y, var_170_24.z)

				local var_170_25 = var_170_19.localEulerAngles

				var_170_25.z = 0
				var_170_25.x = 0
				var_170_19.localEulerAngles = var_170_25
			end

			if arg_167_1.time_ >= var_170_20 + var_170_21 and arg_167_1.time_ < var_170_20 + var_170_21 + arg_170_0 then
				var_170_19.localPosition = Vector3.New(0, 100, 0)

				local var_170_26 = manager.ui.mainCamera.transform.position - var_170_19.position

				var_170_19.forward = Vector3.New(var_170_26.x, var_170_26.y, var_170_26.z)

				local var_170_27 = var_170_19.localEulerAngles

				var_170_27.z = 0
				var_170_27.x = 0
				var_170_19.localEulerAngles = var_170_27
			end

			local var_170_28 = arg_167_1.actors_["1019ui_story"].transform
			local var_170_29 = 0

			if var_170_29 < arg_167_1.time_ and arg_167_1.time_ <= var_170_29 + arg_170_0 then
				arg_167_1.var_.moveOldPos1019ui_story = var_170_28.localPosition
			end

			local var_170_30 = 0.001

			if var_170_29 <= arg_167_1.time_ and arg_167_1.time_ < var_170_29 + var_170_30 then
				local var_170_31 = (arg_167_1.time_ - var_170_29) / var_170_30
				local var_170_32 = Vector3.New(0, -1.08, -5.9)

				var_170_28.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1019ui_story, var_170_32, var_170_31)

				local var_170_33 = manager.ui.mainCamera.transform.position - var_170_28.position

				var_170_28.forward = Vector3.New(var_170_33.x, var_170_33.y, var_170_33.z)

				local var_170_34 = var_170_28.localEulerAngles

				var_170_34.z = 0
				var_170_34.x = 0
				var_170_28.localEulerAngles = var_170_34
			end

			if arg_167_1.time_ >= var_170_29 + var_170_30 and arg_167_1.time_ < var_170_29 + var_170_30 + arg_170_0 then
				var_170_28.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_170_35 = manager.ui.mainCamera.transform.position - var_170_28.position

				var_170_28.forward = Vector3.New(var_170_35.x, var_170_35.y, var_170_35.z)

				local var_170_36 = var_170_28.localEulerAngles

				var_170_36.z = 0
				var_170_36.x = 0
				var_170_28.localEulerAngles = var_170_36
			end

			local var_170_37 = 0

			if var_170_37 < arg_167_1.time_ and arg_167_1.time_ <= var_170_37 + arg_170_0 then
				arg_167_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_170_38 = 0

			if var_170_38 < arg_167_1.time_ and arg_167_1.time_ <= var_170_38 + arg_170_0 then
				arg_167_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_170_39 = 0
			local var_170_40 = 0.925

			if var_170_39 < arg_167_1.time_ and arg_167_1.time_ <= var_170_39 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_41 = arg_167_1:FormatText(StoryNameCfg[13].name)

				arg_167_1.leftNameTxt_.text = var_170_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_42 = arg_167_1:GetWordFromCfg(105121040)
				local var_170_43 = arg_167_1:FormatText(var_170_42.content)

				arg_167_1.text_.text = var_170_43

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_44 = 37
				local var_170_45 = utf8.len(var_170_43)
				local var_170_46 = var_170_44 <= 0 and var_170_40 or var_170_40 * (var_170_45 / var_170_44)

				if var_170_46 > 0 and var_170_40 < var_170_46 then
					arg_167_1.talkMaxDuration = var_170_46

					if var_170_46 + var_170_39 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_46 + var_170_39
					end
				end

				arg_167_1.text_.text = var_170_43
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121040", "story_v_out_105121.awb") ~= 0 then
					local var_170_47 = manager.audio:GetVoiceLength("story_v_out_105121", "105121040", "story_v_out_105121.awb") / 1000

					if var_170_47 + var_170_39 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_47 + var_170_39
					end

					if var_170_42.prefab_name ~= "" and arg_167_1.actors_[var_170_42.prefab_name] ~= nil then
						local var_170_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_42.prefab_name].transform, "story_v_out_105121", "105121040", "story_v_out_105121.awb")

						arg_167_1:RecordAudio("105121040", var_170_48)
						arg_167_1:RecordAudio("105121040", var_170_48)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_105121", "105121040", "story_v_out_105121.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_105121", "105121040", "story_v_out_105121.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_49 = math.max(var_170_40, arg_167_1.talkMaxDuration)

			if var_170_39 <= arg_167_1.time_ and arg_167_1.time_ < var_170_39 + var_170_49 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_39) / var_170_49

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_39 + var_170_49 and arg_167_1.time_ < var_170_39 + var_170_49 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play105121041 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 105121041
		arg_171_1.duration_ = 1.533

		local var_171_0 = {
			ja = 1.3,
			ko = 1.433,
			zh = 1.333,
			en = 1.533
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
				arg_171_0:Play105121042(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["10001_tpose"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.characterEffect10001_tpose == nil then
				arg_171_1.var_.characterEffect10001_tpose = var_174_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_2 = 0.1

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.characterEffect10001_tpose then
					arg_171_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.characterEffect10001_tpose then
				arg_171_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_174_4 = arg_171_1.actors_["1019ui_story"]
			local var_174_5 = 0

			if var_174_5 < arg_171_1.time_ and arg_171_1.time_ <= var_174_5 + arg_174_0 and arg_171_1.var_.characterEffect1019ui_story == nil then
				arg_171_1.var_.characterEffect1019ui_story = var_174_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_6 = 0.1

			if var_174_5 <= arg_171_1.time_ and arg_171_1.time_ < var_174_5 + var_174_6 then
				local var_174_7 = (arg_171_1.time_ - var_174_5) / var_174_6

				if arg_171_1.var_.characterEffect1019ui_story then
					local var_174_8 = Mathf.Lerp(0, 0.5, var_174_7)

					arg_171_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_171_1.var_.characterEffect1019ui_story.fillRatio = var_174_8
				end
			end

			if arg_171_1.time_ >= var_174_5 + var_174_6 and arg_171_1.time_ < var_174_5 + var_174_6 + arg_174_0 and arg_171_1.var_.characterEffect1019ui_story then
				local var_174_9 = 0.5

				arg_171_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_171_1.var_.characterEffect1019ui_story.fillRatio = var_174_9
			end

			local var_174_10 = 0

			if var_174_10 < arg_171_1.time_ and arg_171_1.time_ <= var_174_10 + arg_174_0 then
				arg_171_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_174_11 = 0
			local var_174_12 = 0.075

			if var_174_11 < arg_171_1.time_ and arg_171_1.time_ <= var_174_11 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_13 = arg_171_1:FormatText(StoryNameCfg[31].name)

				arg_171_1.leftNameTxt_.text = var_174_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, true)
				arg_171_1.iconController_:SetSelectedState("hero")

				arg_171_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_Noviher")

				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_14 = arg_171_1:GetWordFromCfg(105121041)
				local var_174_15 = arg_171_1:FormatText(var_174_14.content)

				arg_171_1.text_.text = var_174_15

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_16 = 3
				local var_174_17 = utf8.len(var_174_15)
				local var_174_18 = var_174_16 <= 0 and var_174_12 or var_174_12 * (var_174_17 / var_174_16)

				if var_174_18 > 0 and var_174_12 < var_174_18 then
					arg_171_1.talkMaxDuration = var_174_18

					if var_174_18 + var_174_11 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_18 + var_174_11
					end
				end

				arg_171_1.text_.text = var_174_15
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121041", "story_v_out_105121.awb") ~= 0 then
					local var_174_19 = manager.audio:GetVoiceLength("story_v_out_105121", "105121041", "story_v_out_105121.awb") / 1000

					if var_174_19 + var_174_11 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_19 + var_174_11
					end

					if var_174_14.prefab_name ~= "" and arg_171_1.actors_[var_174_14.prefab_name] ~= nil then
						local var_174_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_14.prefab_name].transform, "story_v_out_105121", "105121041", "story_v_out_105121.awb")

						arg_171_1:RecordAudio("105121041", var_174_20)
						arg_171_1:RecordAudio("105121041", var_174_20)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_105121", "105121041", "story_v_out_105121.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_105121", "105121041", "story_v_out_105121.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_21 = math.max(var_174_12, arg_171_1.talkMaxDuration)

			if var_174_11 <= arg_171_1.time_ and arg_171_1.time_ < var_174_11 + var_174_21 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_11) / var_174_21

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_11 + var_174_21 and arg_171_1.time_ < var_174_11 + var_174_21 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play105121042 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 105121042
		arg_175_1.duration_ = 8.233

		local var_175_0 = {
			ja = 4.466,
			ko = 8.233,
			zh = 7.366,
			en = 7.9
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
				arg_175_0:Play105121043(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1036ui_story"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.characterEffect1036ui_story == nil then
				arg_175_1.var_.characterEffect1036ui_story = var_178_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_2 = 0.1

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.characterEffect1036ui_story then
					arg_175_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.characterEffect1036ui_story then
				arg_175_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_178_4 = arg_175_1.actors_["10001_tpose"]
			local var_178_5 = 0

			if var_178_5 < arg_175_1.time_ and arg_175_1.time_ <= var_178_5 + arg_178_0 and arg_175_1.var_.characterEffect10001_tpose == nil then
				arg_175_1.var_.characterEffect10001_tpose = var_178_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_6 = 0.1

			if var_178_5 <= arg_175_1.time_ and arg_175_1.time_ < var_178_5 + var_178_6 then
				local var_178_7 = (arg_175_1.time_ - var_178_5) / var_178_6

				if arg_175_1.var_.characterEffect10001_tpose then
					local var_178_8 = Mathf.Lerp(0, 0.5, var_178_7)

					arg_175_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_175_1.var_.characterEffect10001_tpose.fillRatio = var_178_8
				end
			end

			if arg_175_1.time_ >= var_178_5 + var_178_6 and arg_175_1.time_ < var_178_5 + var_178_6 + arg_178_0 and arg_175_1.var_.characterEffect10001_tpose then
				local var_178_9 = 0.5

				arg_175_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_175_1.var_.characterEffect10001_tpose.fillRatio = var_178_9
			end

			local var_178_10 = arg_175_1.actors_["1019ui_story"].transform
			local var_178_11 = 0

			if var_178_11 < arg_175_1.time_ and arg_175_1.time_ <= var_178_11 + arg_178_0 then
				arg_175_1.var_.moveOldPos1019ui_story = var_178_10.localPosition
			end

			local var_178_12 = 0.001

			if var_178_11 <= arg_175_1.time_ and arg_175_1.time_ < var_178_11 + var_178_12 then
				local var_178_13 = (arg_175_1.time_ - var_178_11) / var_178_12
				local var_178_14 = Vector3.New(0, 100, 0)

				var_178_10.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1019ui_story, var_178_14, var_178_13)

				local var_178_15 = manager.ui.mainCamera.transform.position - var_178_10.position

				var_178_10.forward = Vector3.New(var_178_15.x, var_178_15.y, var_178_15.z)

				local var_178_16 = var_178_10.localEulerAngles

				var_178_16.z = 0
				var_178_16.x = 0
				var_178_10.localEulerAngles = var_178_16
			end

			if arg_175_1.time_ >= var_178_11 + var_178_12 and arg_175_1.time_ < var_178_11 + var_178_12 + arg_178_0 then
				var_178_10.localPosition = Vector3.New(0, 100, 0)

				local var_178_17 = manager.ui.mainCamera.transform.position - var_178_10.position

				var_178_10.forward = Vector3.New(var_178_17.x, var_178_17.y, var_178_17.z)

				local var_178_18 = var_178_10.localEulerAngles

				var_178_18.z = 0
				var_178_18.x = 0
				var_178_10.localEulerAngles = var_178_18
			end

			local var_178_19 = arg_175_1.actors_["1036ui_story"].transform
			local var_178_20 = 0

			if var_178_20 < arg_175_1.time_ and arg_175_1.time_ <= var_178_20 + arg_178_0 then
				arg_175_1.var_.moveOldPos1036ui_story = var_178_19.localPosition
			end

			local var_178_21 = 0.001

			if var_178_20 <= arg_175_1.time_ and arg_175_1.time_ < var_178_20 + var_178_21 then
				local var_178_22 = (arg_175_1.time_ - var_178_20) / var_178_21
				local var_178_23 = Vector3.New(0, -1.09, -5.78)

				var_178_19.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1036ui_story, var_178_23, var_178_22)

				local var_178_24 = manager.ui.mainCamera.transform.position - var_178_19.position

				var_178_19.forward = Vector3.New(var_178_24.x, var_178_24.y, var_178_24.z)

				local var_178_25 = var_178_19.localEulerAngles

				var_178_25.z = 0
				var_178_25.x = 0
				var_178_19.localEulerAngles = var_178_25
			end

			if arg_175_1.time_ >= var_178_20 + var_178_21 and arg_175_1.time_ < var_178_20 + var_178_21 + arg_178_0 then
				var_178_19.localPosition = Vector3.New(0, -1.09, -5.78)

				local var_178_26 = manager.ui.mainCamera.transform.position - var_178_19.position

				var_178_19.forward = Vector3.New(var_178_26.x, var_178_26.y, var_178_26.z)

				local var_178_27 = var_178_19.localEulerAngles

				var_178_27.z = 0
				var_178_27.x = 0
				var_178_19.localEulerAngles = var_178_27
			end

			local var_178_28 = 0

			if var_178_28 < arg_175_1.time_ and arg_175_1.time_ <= var_178_28 + arg_178_0 then
				arg_175_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action4_1")
			end

			local var_178_29 = 0

			if var_178_29 < arg_175_1.time_ and arg_175_1.time_ <= var_178_29 + arg_178_0 then
				arg_175_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_178_30 = 0
			local var_178_31 = 1.025

			if var_178_30 < arg_175_1.time_ and arg_175_1.time_ <= var_178_30 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_32 = arg_175_1:FormatText(StoryNameCfg[5].name)

				arg_175_1.leftNameTxt_.text = var_178_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_33 = arg_175_1:GetWordFromCfg(105121042)
				local var_178_34 = arg_175_1:FormatText(var_178_33.content)

				arg_175_1.text_.text = var_178_34

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_35 = 40
				local var_178_36 = utf8.len(var_178_34)
				local var_178_37 = var_178_35 <= 0 and var_178_31 or var_178_31 * (var_178_36 / var_178_35)

				if var_178_37 > 0 and var_178_31 < var_178_37 then
					arg_175_1.talkMaxDuration = var_178_37

					if var_178_37 + var_178_30 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_37 + var_178_30
					end
				end

				arg_175_1.text_.text = var_178_34
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121042", "story_v_out_105121.awb") ~= 0 then
					local var_178_38 = manager.audio:GetVoiceLength("story_v_out_105121", "105121042", "story_v_out_105121.awb") / 1000

					if var_178_38 + var_178_30 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_38 + var_178_30
					end

					if var_178_33.prefab_name ~= "" and arg_175_1.actors_[var_178_33.prefab_name] ~= nil then
						local var_178_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_33.prefab_name].transform, "story_v_out_105121", "105121042", "story_v_out_105121.awb")

						arg_175_1:RecordAudio("105121042", var_178_39)
						arg_175_1:RecordAudio("105121042", var_178_39)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_105121", "105121042", "story_v_out_105121.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_105121", "105121042", "story_v_out_105121.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_40 = math.max(var_178_31, arg_175_1.talkMaxDuration)

			if var_178_30 <= arg_175_1.time_ and arg_175_1.time_ < var_178_30 + var_178_40 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_30) / var_178_40

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_30 + var_178_40 and arg_175_1.time_ < var_178_30 + var_178_40 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play105121043 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 105121043
		arg_179_1.duration_ = 8.5

		local var_179_0 = {
			ja = 7.533,
			ko = 7.833,
			zh = 8.5,
			en = 7.666
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
				arg_179_0:Play105121044(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = "1027ui_story"

			if arg_179_1.actors_[var_182_0] == nil then
				local var_182_1 = Object.Instantiate(Asset.Load("Char/" .. var_182_0), arg_179_1.stage_.transform)

				var_182_1.name = var_182_0
				var_182_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_179_1.actors_[var_182_0] = var_182_1

				local var_182_2 = var_182_1:GetComponentInChildren(typeof(CharacterEffect))

				var_182_2.enabled = true

				local var_182_3 = GameObjectTools.GetOrAddComponent(var_182_1, typeof(DynamicBoneHelper))

				if var_182_3 then
					var_182_3:EnableDynamicBone(false)
				end

				arg_179_1:ShowWeapon(var_182_2.transform, false)

				arg_179_1.var_[var_182_0 .. "Animator"] = var_182_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_179_1.var_[var_182_0 .. "Animator"].applyRootMotion = true
				arg_179_1.var_[var_182_0 .. "LipSync"] = var_182_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_182_4 = arg_179_1.actors_["1027ui_story"]
			local var_182_5 = 0

			if var_182_5 < arg_179_1.time_ and arg_179_1.time_ <= var_182_5 + arg_182_0 and arg_179_1.var_.characterEffect1027ui_story == nil then
				arg_179_1.var_.characterEffect1027ui_story = var_182_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_6 = 0.1

			if var_182_5 <= arg_179_1.time_ and arg_179_1.time_ < var_182_5 + var_182_6 then
				local var_182_7 = (arg_179_1.time_ - var_182_5) / var_182_6

				if arg_179_1.var_.characterEffect1027ui_story then
					arg_179_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_5 + var_182_6 and arg_179_1.time_ < var_182_5 + var_182_6 + arg_182_0 and arg_179_1.var_.characterEffect1027ui_story then
				arg_179_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_182_8 = arg_179_1.actors_["1036ui_story"]
			local var_182_9 = 0

			if var_182_9 < arg_179_1.time_ and arg_179_1.time_ <= var_182_9 + arg_182_0 and arg_179_1.var_.characterEffect1036ui_story == nil then
				arg_179_1.var_.characterEffect1036ui_story = var_182_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_10 = 0.1

			if var_182_9 <= arg_179_1.time_ and arg_179_1.time_ < var_182_9 + var_182_10 then
				local var_182_11 = (arg_179_1.time_ - var_182_9) / var_182_10

				if arg_179_1.var_.characterEffect1036ui_story then
					local var_182_12 = Mathf.Lerp(0, 0.5, var_182_11)

					arg_179_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_179_1.var_.characterEffect1036ui_story.fillRatio = var_182_12
				end
			end

			if arg_179_1.time_ >= var_182_9 + var_182_10 and arg_179_1.time_ < var_182_9 + var_182_10 + arg_182_0 and arg_179_1.var_.characterEffect1036ui_story then
				local var_182_13 = 0.5

				arg_179_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_179_1.var_.characterEffect1036ui_story.fillRatio = var_182_13
			end

			local var_182_14 = arg_179_1.actors_["1036ui_story"].transform
			local var_182_15 = 0.033

			if var_182_15 < arg_179_1.time_ and arg_179_1.time_ <= var_182_15 + arg_182_0 then
				arg_179_1.var_.moveOldPos1036ui_story = var_182_14.localPosition
			end

			local var_182_16 = 0.5

			if var_182_15 <= arg_179_1.time_ and arg_179_1.time_ < var_182_15 + var_182_16 then
				local var_182_17 = (arg_179_1.time_ - var_182_15) / var_182_16
				local var_182_18 = Vector3.New(0.7, -1.09, -5.78)

				var_182_14.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1036ui_story, var_182_18, var_182_17)

				local var_182_19 = manager.ui.mainCamera.transform.position - var_182_14.position

				var_182_14.forward = Vector3.New(var_182_19.x, var_182_19.y, var_182_19.z)

				local var_182_20 = var_182_14.localEulerAngles

				var_182_20.z = 0
				var_182_20.x = 0
				var_182_14.localEulerAngles = var_182_20
			end

			if arg_179_1.time_ >= var_182_15 + var_182_16 and arg_179_1.time_ < var_182_15 + var_182_16 + arg_182_0 then
				var_182_14.localPosition = Vector3.New(0.7, -1.09, -5.78)

				local var_182_21 = manager.ui.mainCamera.transform.position - var_182_14.position

				var_182_14.forward = Vector3.New(var_182_21.x, var_182_21.y, var_182_21.z)

				local var_182_22 = var_182_14.localEulerAngles

				var_182_22.z = 0
				var_182_22.x = 0
				var_182_14.localEulerAngles = var_182_22
			end

			local var_182_23 = arg_179_1.actors_["1036ui_story"].transform
			local var_182_24 = 0

			if var_182_24 < arg_179_1.time_ and arg_179_1.time_ <= var_182_24 + arg_182_0 then
				arg_179_1.var_.moveOldPos1036ui_story = var_182_23.localPosition
			end

			local var_182_25 = 0.001

			if var_182_24 <= arg_179_1.time_ and arg_179_1.time_ < var_182_24 + var_182_25 then
				local var_182_26 = (arg_179_1.time_ - var_182_24) / var_182_25
				local var_182_27 = Vector3.New(0, -1.09, -5.78)

				var_182_23.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1036ui_story, var_182_27, var_182_26)

				local var_182_28 = manager.ui.mainCamera.transform.position - var_182_23.position

				var_182_23.forward = Vector3.New(var_182_28.x, var_182_28.y, var_182_28.z)

				local var_182_29 = var_182_23.localEulerAngles

				var_182_29.z = 0
				var_182_29.x = 0
				var_182_23.localEulerAngles = var_182_29
			end

			if arg_179_1.time_ >= var_182_24 + var_182_25 and arg_179_1.time_ < var_182_24 + var_182_25 + arg_182_0 then
				var_182_23.localPosition = Vector3.New(0, -1.09, -5.78)

				local var_182_30 = manager.ui.mainCamera.transform.position - var_182_23.position

				var_182_23.forward = Vector3.New(var_182_30.x, var_182_30.y, var_182_30.z)

				local var_182_31 = var_182_23.localEulerAngles

				var_182_31.z = 0
				var_182_31.x = 0
				var_182_23.localEulerAngles = var_182_31
			end

			local var_182_32 = arg_179_1.actors_["1027ui_story"].transform
			local var_182_33 = 0

			if var_182_33 < arg_179_1.time_ and arg_179_1.time_ <= var_182_33 + arg_182_0 then
				arg_179_1.var_.moveOldPos1027ui_story = var_182_32.localPosition
			end

			local var_182_34 = 0.001

			if var_182_33 <= arg_179_1.time_ and arg_179_1.time_ < var_182_33 + var_182_34 then
				local var_182_35 = (arg_179_1.time_ - var_182_33) / var_182_34
				local var_182_36 = Vector3.New(-0.7, -0.81, -5.8)

				var_182_32.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1027ui_story, var_182_36, var_182_35)

				local var_182_37 = manager.ui.mainCamera.transform.position - var_182_32.position

				var_182_32.forward = Vector3.New(var_182_37.x, var_182_37.y, var_182_37.z)

				local var_182_38 = var_182_32.localEulerAngles

				var_182_38.z = 0
				var_182_38.x = 0
				var_182_32.localEulerAngles = var_182_38
			end

			if arg_179_1.time_ >= var_182_33 + var_182_34 and arg_179_1.time_ < var_182_33 + var_182_34 + arg_182_0 then
				var_182_32.localPosition = Vector3.New(-0.7, -0.81, -5.8)

				local var_182_39 = manager.ui.mainCamera.transform.position - var_182_32.position

				var_182_32.forward = Vector3.New(var_182_39.x, var_182_39.y, var_182_39.z)

				local var_182_40 = var_182_32.localEulerAngles

				var_182_40.z = 0
				var_182_40.x = 0
				var_182_32.localEulerAngles = var_182_40
			end

			local var_182_41 = 0

			if var_182_41 < arg_179_1.time_ and arg_179_1.time_ <= var_182_41 + arg_182_0 then
				arg_179_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action7_1")
			end

			local var_182_42 = 0

			if var_182_42 < arg_179_1.time_ and arg_179_1.time_ <= var_182_42 + arg_182_0 then
				arg_179_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_182_43 = 0
			local var_182_44 = 0.925

			if var_182_43 < arg_179_1.time_ and arg_179_1.time_ <= var_182_43 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_45 = arg_179_1:FormatText(StoryNameCfg[56].name)

				arg_179_1.leftNameTxt_.text = var_182_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_46 = arg_179_1:GetWordFromCfg(105121043)
				local var_182_47 = arg_179_1:FormatText(var_182_46.content)

				arg_179_1.text_.text = var_182_47

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_48 = 37
				local var_182_49 = utf8.len(var_182_47)
				local var_182_50 = var_182_48 <= 0 and var_182_44 or var_182_44 * (var_182_49 / var_182_48)

				if var_182_50 > 0 and var_182_44 < var_182_50 then
					arg_179_1.talkMaxDuration = var_182_50

					if var_182_50 + var_182_43 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_50 + var_182_43
					end
				end

				arg_179_1.text_.text = var_182_47
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121043", "story_v_out_105121.awb") ~= 0 then
					local var_182_51 = manager.audio:GetVoiceLength("story_v_out_105121", "105121043", "story_v_out_105121.awb") / 1000

					if var_182_51 + var_182_43 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_51 + var_182_43
					end

					if var_182_46.prefab_name ~= "" and arg_179_1.actors_[var_182_46.prefab_name] ~= nil then
						local var_182_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_46.prefab_name].transform, "story_v_out_105121", "105121043", "story_v_out_105121.awb")

						arg_179_1:RecordAudio("105121043", var_182_52)
						arg_179_1:RecordAudio("105121043", var_182_52)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_105121", "105121043", "story_v_out_105121.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_105121", "105121043", "story_v_out_105121.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_53 = math.max(var_182_44, arg_179_1.talkMaxDuration)

			if var_182_43 <= arg_179_1.time_ and arg_179_1.time_ < var_182_43 + var_182_53 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_43) / var_182_53

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_43 + var_182_53 and arg_179_1.time_ < var_182_43 + var_182_53 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play105121044 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 105121044
		arg_183_1.duration_ = 7.1

		local var_183_0 = {
			ja = 7.1,
			ko = 3.7,
			zh = 3.366,
			en = 3.033
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
				arg_183_0:Play105121045(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1148ui_story"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.characterEffect1148ui_story == nil then
				arg_183_1.var_.characterEffect1148ui_story = var_186_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_2 = 0.1

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.characterEffect1148ui_story then
					arg_183_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.characterEffect1148ui_story then
				arg_183_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_186_4 = arg_183_1.actors_["1027ui_story"]
			local var_186_5 = 0

			if var_186_5 < arg_183_1.time_ and arg_183_1.time_ <= var_186_5 + arg_186_0 and arg_183_1.var_.characterEffect1027ui_story == nil then
				arg_183_1.var_.characterEffect1027ui_story = var_186_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_6 = 0.1

			if var_186_5 <= arg_183_1.time_ and arg_183_1.time_ < var_186_5 + var_186_6 then
				local var_186_7 = (arg_183_1.time_ - var_186_5) / var_186_6

				if arg_183_1.var_.characterEffect1027ui_story then
					local var_186_8 = Mathf.Lerp(0, 0.5, var_186_7)

					arg_183_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_183_1.var_.characterEffect1027ui_story.fillRatio = var_186_8
				end
			end

			if arg_183_1.time_ >= var_186_5 + var_186_6 and arg_183_1.time_ < var_186_5 + var_186_6 + arg_186_0 and arg_183_1.var_.characterEffect1027ui_story then
				local var_186_9 = 0.5

				arg_183_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_183_1.var_.characterEffect1027ui_story.fillRatio = var_186_9
			end

			local var_186_10 = arg_183_1.actors_["1036ui_story"].transform
			local var_186_11 = 0

			if var_186_11 < arg_183_1.time_ and arg_183_1.time_ <= var_186_11 + arg_186_0 then
				arg_183_1.var_.moveOldPos1036ui_story = var_186_10.localPosition
			end

			local var_186_12 = 0.001

			if var_186_11 <= arg_183_1.time_ and arg_183_1.time_ < var_186_11 + var_186_12 then
				local var_186_13 = (arg_183_1.time_ - var_186_11) / var_186_12
				local var_186_14 = Vector3.New(0, 100, 0)

				var_186_10.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1036ui_story, var_186_14, var_186_13)

				local var_186_15 = manager.ui.mainCamera.transform.position - var_186_10.position

				var_186_10.forward = Vector3.New(var_186_15.x, var_186_15.y, var_186_15.z)

				local var_186_16 = var_186_10.localEulerAngles

				var_186_16.z = 0
				var_186_16.x = 0
				var_186_10.localEulerAngles = var_186_16
			end

			if arg_183_1.time_ >= var_186_11 + var_186_12 and arg_183_1.time_ < var_186_11 + var_186_12 + arg_186_0 then
				var_186_10.localPosition = Vector3.New(0, 100, 0)

				local var_186_17 = manager.ui.mainCamera.transform.position - var_186_10.position

				var_186_10.forward = Vector3.New(var_186_17.x, var_186_17.y, var_186_17.z)

				local var_186_18 = var_186_10.localEulerAngles

				var_186_18.z = 0
				var_186_18.x = 0
				var_186_10.localEulerAngles = var_186_18
			end

			local var_186_19 = arg_183_1.actors_["1148ui_story"].transform
			local var_186_20 = 0

			if var_186_20 < arg_183_1.time_ and arg_183_1.time_ <= var_186_20 + arg_186_0 then
				arg_183_1.var_.moveOldPos1148ui_story = var_186_19.localPosition
			end

			local var_186_21 = 0.001

			if var_186_20 <= arg_183_1.time_ and arg_183_1.time_ < var_186_20 + var_186_21 then
				local var_186_22 = (arg_183_1.time_ - var_186_20) / var_186_21
				local var_186_23 = Vector3.New(0.7, -0.8, -6.2)

				var_186_19.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1148ui_story, var_186_23, var_186_22)

				local var_186_24 = manager.ui.mainCamera.transform.position - var_186_19.position

				var_186_19.forward = Vector3.New(var_186_24.x, var_186_24.y, var_186_24.z)

				local var_186_25 = var_186_19.localEulerAngles

				var_186_25.z = 0
				var_186_25.x = 0
				var_186_19.localEulerAngles = var_186_25
			end

			if arg_183_1.time_ >= var_186_20 + var_186_21 and arg_183_1.time_ < var_186_20 + var_186_21 + arg_186_0 then
				var_186_19.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_186_26 = manager.ui.mainCamera.transform.position - var_186_19.position

				var_186_19.forward = Vector3.New(var_186_26.x, var_186_26.y, var_186_26.z)

				local var_186_27 = var_186_19.localEulerAngles

				var_186_27.z = 0
				var_186_27.x = 0
				var_186_19.localEulerAngles = var_186_27
			end

			local var_186_28 = 0

			if var_186_28 < arg_183_1.time_ and arg_183_1.time_ <= var_186_28 + arg_186_0 then
				arg_183_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action2_1")
			end

			local var_186_29 = 0

			if var_186_29 < arg_183_1.time_ and arg_183_1.time_ <= var_186_29 + arg_186_0 then
				arg_183_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1301cva")
			end

			local var_186_30 = 0
			local var_186_31 = 0.4

			if var_186_30 < arg_183_1.time_ and arg_183_1.time_ <= var_186_30 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_32 = arg_183_1:FormatText(StoryNameCfg[8].name)

				arg_183_1.leftNameTxt_.text = var_186_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_33 = arg_183_1:GetWordFromCfg(105121044)
				local var_186_34 = arg_183_1:FormatText(var_186_33.content)

				arg_183_1.text_.text = var_186_34

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_35 = 16
				local var_186_36 = utf8.len(var_186_34)
				local var_186_37 = var_186_35 <= 0 and var_186_31 or var_186_31 * (var_186_36 / var_186_35)

				if var_186_37 > 0 and var_186_31 < var_186_37 then
					arg_183_1.talkMaxDuration = var_186_37

					if var_186_37 + var_186_30 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_37 + var_186_30
					end
				end

				arg_183_1.text_.text = var_186_34
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121044", "story_v_out_105121.awb") ~= 0 then
					local var_186_38 = manager.audio:GetVoiceLength("story_v_out_105121", "105121044", "story_v_out_105121.awb") / 1000

					if var_186_38 + var_186_30 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_38 + var_186_30
					end

					if var_186_33.prefab_name ~= "" and arg_183_1.actors_[var_186_33.prefab_name] ~= nil then
						local var_186_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_33.prefab_name].transform, "story_v_out_105121", "105121044", "story_v_out_105121.awb")

						arg_183_1:RecordAudio("105121044", var_186_39)
						arg_183_1:RecordAudio("105121044", var_186_39)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_105121", "105121044", "story_v_out_105121.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_105121", "105121044", "story_v_out_105121.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_40 = math.max(var_186_31, arg_183_1.talkMaxDuration)

			if var_186_30 <= arg_183_1.time_ and arg_183_1.time_ < var_186_30 + var_186_40 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_30) / var_186_40

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_30 + var_186_40 and arg_183_1.time_ < var_186_30 + var_186_40 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play105121045 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 105121045
		arg_187_1.duration_ = 7.9

		local var_187_0 = {
			ja = 7.9,
			ko = 4.366,
			zh = 4.166,
			en = 4.966
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
				arg_187_0:Play105121046(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1027ui_story"]
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 and arg_187_1.var_.characterEffect1027ui_story == nil then
				arg_187_1.var_.characterEffect1027ui_story = var_190_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_2 = 0.1

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2

				if arg_187_1.var_.characterEffect1027ui_story then
					arg_187_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.characterEffect1027ui_story then
				arg_187_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_190_4 = arg_187_1.actors_["1148ui_story"]
			local var_190_5 = 0

			if var_190_5 < arg_187_1.time_ and arg_187_1.time_ <= var_190_5 + arg_190_0 and arg_187_1.var_.characterEffect1148ui_story == nil then
				arg_187_1.var_.characterEffect1148ui_story = var_190_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_6 = 0.1

			if var_190_5 <= arg_187_1.time_ and arg_187_1.time_ < var_190_5 + var_190_6 then
				local var_190_7 = (arg_187_1.time_ - var_190_5) / var_190_6

				if arg_187_1.var_.characterEffect1148ui_story then
					local var_190_8 = Mathf.Lerp(0, 0.5, var_190_7)

					arg_187_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_187_1.var_.characterEffect1148ui_story.fillRatio = var_190_8
				end
			end

			if arg_187_1.time_ >= var_190_5 + var_190_6 and arg_187_1.time_ < var_190_5 + var_190_6 + arg_190_0 and arg_187_1.var_.characterEffect1148ui_story then
				local var_190_9 = 0.5

				arg_187_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_187_1.var_.characterEffect1148ui_story.fillRatio = var_190_9
			end

			local var_190_10 = 0

			if var_190_10 < arg_187_1.time_ and arg_187_1.time_ <= var_190_10 + arg_190_0 then
				arg_187_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027actionlink/1027action472")
			end

			local var_190_11 = 0

			if var_190_11 < arg_187_1.time_ and arg_187_1.time_ <= var_190_11 + arg_190_0 then
				arg_187_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_190_12 = 0
			local var_190_13 = 0.475

			if var_190_12 < arg_187_1.time_ and arg_187_1.time_ <= var_190_12 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_14 = arg_187_1:FormatText(StoryNameCfg[56].name)

				arg_187_1.leftNameTxt_.text = var_190_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_15 = arg_187_1:GetWordFromCfg(105121045)
				local var_190_16 = arg_187_1:FormatText(var_190_15.content)

				arg_187_1.text_.text = var_190_16

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_17 = 19
				local var_190_18 = utf8.len(var_190_16)
				local var_190_19 = var_190_17 <= 0 and var_190_13 or var_190_13 * (var_190_18 / var_190_17)

				if var_190_19 > 0 and var_190_13 < var_190_19 then
					arg_187_1.talkMaxDuration = var_190_19

					if var_190_19 + var_190_12 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_19 + var_190_12
					end
				end

				arg_187_1.text_.text = var_190_16
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121045", "story_v_out_105121.awb") ~= 0 then
					local var_190_20 = manager.audio:GetVoiceLength("story_v_out_105121", "105121045", "story_v_out_105121.awb") / 1000

					if var_190_20 + var_190_12 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_20 + var_190_12
					end

					if var_190_15.prefab_name ~= "" and arg_187_1.actors_[var_190_15.prefab_name] ~= nil then
						local var_190_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_15.prefab_name].transform, "story_v_out_105121", "105121045", "story_v_out_105121.awb")

						arg_187_1:RecordAudio("105121045", var_190_21)
						arg_187_1:RecordAudio("105121045", var_190_21)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_105121", "105121045", "story_v_out_105121.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_105121", "105121045", "story_v_out_105121.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_22 = math.max(var_190_13, arg_187_1.talkMaxDuration)

			if var_190_12 <= arg_187_1.time_ and arg_187_1.time_ < var_190_12 + var_190_22 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_12) / var_190_22

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_12 + var_190_22 and arg_187_1.time_ < var_190_12 + var_190_22 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play105121046 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 105121046
		arg_191_1.duration_ = 9.266

		local var_191_0 = {
			ja = 9.266,
			ko = 8.266,
			zh = 7.666,
			en = 8.133
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
				arg_191_0:Play105121047(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1148ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect1148ui_story == nil then
				arg_191_1.var_.characterEffect1148ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.1

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect1148ui_story then
					arg_191_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect1148ui_story then
				arg_191_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_194_4 = arg_191_1.actors_["1027ui_story"]
			local var_194_5 = 0

			if var_194_5 < arg_191_1.time_ and arg_191_1.time_ <= var_194_5 + arg_194_0 and arg_191_1.var_.characterEffect1027ui_story == nil then
				arg_191_1.var_.characterEffect1027ui_story = var_194_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_6 = 0.1

			if var_194_5 <= arg_191_1.time_ and arg_191_1.time_ < var_194_5 + var_194_6 then
				local var_194_7 = (arg_191_1.time_ - var_194_5) / var_194_6

				if arg_191_1.var_.characterEffect1027ui_story then
					local var_194_8 = Mathf.Lerp(0, 0.5, var_194_7)

					arg_191_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_191_1.var_.characterEffect1027ui_story.fillRatio = var_194_8
				end
			end

			if arg_191_1.time_ >= var_194_5 + var_194_6 and arg_191_1.time_ < var_194_5 + var_194_6 + arg_194_0 and arg_191_1.var_.characterEffect1027ui_story then
				local var_194_9 = 0.5

				arg_191_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_191_1.var_.characterEffect1027ui_story.fillRatio = var_194_9
			end

			local var_194_10 = 0

			if var_194_10 < arg_191_1.time_ and arg_191_1.time_ <= var_194_10 + arg_194_0 then
				arg_191_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action426")
			end

			local var_194_11 = 0
			local var_194_12 = 0.875

			if var_194_11 < arg_191_1.time_ and arg_191_1.time_ <= var_194_11 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_13 = arg_191_1:FormatText(StoryNameCfg[8].name)

				arg_191_1.leftNameTxt_.text = var_194_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_14 = arg_191_1:GetWordFromCfg(105121046)
				local var_194_15 = arg_191_1:FormatText(var_194_14.content)

				arg_191_1.text_.text = var_194_15

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_16 = 35
				local var_194_17 = utf8.len(var_194_15)
				local var_194_18 = var_194_16 <= 0 and var_194_12 or var_194_12 * (var_194_17 / var_194_16)

				if var_194_18 > 0 and var_194_12 < var_194_18 then
					arg_191_1.talkMaxDuration = var_194_18

					if var_194_18 + var_194_11 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_18 + var_194_11
					end
				end

				arg_191_1.text_.text = var_194_15
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121046", "story_v_out_105121.awb") ~= 0 then
					local var_194_19 = manager.audio:GetVoiceLength("story_v_out_105121", "105121046", "story_v_out_105121.awb") / 1000

					if var_194_19 + var_194_11 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_19 + var_194_11
					end

					if var_194_14.prefab_name ~= "" and arg_191_1.actors_[var_194_14.prefab_name] ~= nil then
						local var_194_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_14.prefab_name].transform, "story_v_out_105121", "105121046", "story_v_out_105121.awb")

						arg_191_1:RecordAudio("105121046", var_194_20)
						arg_191_1:RecordAudio("105121046", var_194_20)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_105121", "105121046", "story_v_out_105121.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_105121", "105121046", "story_v_out_105121.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_21 = math.max(var_194_12, arg_191_1.talkMaxDuration)

			if var_194_11 <= arg_191_1.time_ and arg_191_1.time_ < var_194_11 + var_194_21 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_11) / var_194_21

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_11 + var_194_21 and arg_191_1.time_ < var_194_11 + var_194_21 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play105121047 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 105121047
		arg_195_1.duration_ = 5

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play105121048(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1148ui_story"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 and arg_195_1.var_.characterEffect1148ui_story == nil then
				arg_195_1.var_.characterEffect1148ui_story = var_198_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_2 = 0.1

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2

				if arg_195_1.var_.characterEffect1148ui_story then
					local var_198_4 = Mathf.Lerp(0, 0.5, var_198_3)

					arg_195_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_195_1.var_.characterEffect1148ui_story.fillRatio = var_198_4
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 and arg_195_1.var_.characterEffect1148ui_story then
				local var_198_5 = 0.5

				arg_195_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_195_1.var_.characterEffect1148ui_story.fillRatio = var_198_5
			end

			local var_198_6 = 0

			if var_198_6 < arg_195_1.time_ and arg_195_1.time_ <= var_198_6 + arg_198_0 then
				arg_195_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_198_7 = 0
			local var_198_8 = 0.05

			if var_198_7 < arg_195_1.time_ and arg_195_1.time_ <= var_198_7 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_9 = arg_195_1:FormatText(StoryNameCfg[7].name)

				arg_195_1.leftNameTxt_.text = var_198_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_10 = arg_195_1:GetWordFromCfg(105121047)
				local var_198_11 = arg_195_1:FormatText(var_198_10.content)

				arg_195_1.text_.text = var_198_11

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_12 = 2
				local var_198_13 = utf8.len(var_198_11)
				local var_198_14 = var_198_12 <= 0 and var_198_8 or var_198_8 * (var_198_13 / var_198_12)

				if var_198_14 > 0 and var_198_8 < var_198_14 then
					arg_195_1.talkMaxDuration = var_198_14

					if var_198_14 + var_198_7 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_14 + var_198_7
					end
				end

				arg_195_1.text_.text = var_198_11
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)
				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_15 = math.max(var_198_8, arg_195_1.talkMaxDuration)

			if var_198_7 <= arg_195_1.time_ and arg_195_1.time_ < var_198_7 + var_198_15 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_7) / var_198_15

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_7 + var_198_15 and arg_195_1.time_ < var_198_7 + var_198_15 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play105121048 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 105121048
		arg_199_1.duration_ = 6.866

		local var_199_0 = {
			ja = 6.866,
			ko = 4.566,
			zh = 5.033,
			en = 6.066
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
				arg_199_0:Play105121049(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1019ui_story"]
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 and arg_199_1.var_.characterEffect1019ui_story == nil then
				arg_199_1.var_.characterEffect1019ui_story = var_202_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_2 = 0.1

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2

				if arg_199_1.var_.characterEffect1019ui_story then
					arg_199_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 and arg_199_1.var_.characterEffect1019ui_story then
				arg_199_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_202_4 = arg_199_1.actors_["1148ui_story"].transform
			local var_202_5 = 0

			if var_202_5 < arg_199_1.time_ and arg_199_1.time_ <= var_202_5 + arg_202_0 then
				arg_199_1.var_.moveOldPos1148ui_story = var_202_4.localPosition
			end

			local var_202_6 = 0.001

			if var_202_5 <= arg_199_1.time_ and arg_199_1.time_ < var_202_5 + var_202_6 then
				local var_202_7 = (arg_199_1.time_ - var_202_5) / var_202_6
				local var_202_8 = Vector3.New(0, 100, 0)

				var_202_4.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1148ui_story, var_202_8, var_202_7)

				local var_202_9 = manager.ui.mainCamera.transform.position - var_202_4.position

				var_202_4.forward = Vector3.New(var_202_9.x, var_202_9.y, var_202_9.z)

				local var_202_10 = var_202_4.localEulerAngles

				var_202_10.z = 0
				var_202_10.x = 0
				var_202_4.localEulerAngles = var_202_10
			end

			if arg_199_1.time_ >= var_202_5 + var_202_6 and arg_199_1.time_ < var_202_5 + var_202_6 + arg_202_0 then
				var_202_4.localPosition = Vector3.New(0, 100, 0)

				local var_202_11 = manager.ui.mainCamera.transform.position - var_202_4.position

				var_202_4.forward = Vector3.New(var_202_11.x, var_202_11.y, var_202_11.z)

				local var_202_12 = var_202_4.localEulerAngles

				var_202_12.z = 0
				var_202_12.x = 0
				var_202_4.localEulerAngles = var_202_12
			end

			local var_202_13 = arg_199_1.actors_["1027ui_story"].transform
			local var_202_14 = 0

			if var_202_14 < arg_199_1.time_ and arg_199_1.time_ <= var_202_14 + arg_202_0 then
				arg_199_1.var_.moveOldPos1027ui_story = var_202_13.localPosition
			end

			local var_202_15 = 0.001

			if var_202_14 <= arg_199_1.time_ and arg_199_1.time_ < var_202_14 + var_202_15 then
				local var_202_16 = (arg_199_1.time_ - var_202_14) / var_202_15
				local var_202_17 = Vector3.New(0, 100, 0)

				var_202_13.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1027ui_story, var_202_17, var_202_16)

				local var_202_18 = manager.ui.mainCamera.transform.position - var_202_13.position

				var_202_13.forward = Vector3.New(var_202_18.x, var_202_18.y, var_202_18.z)

				local var_202_19 = var_202_13.localEulerAngles

				var_202_19.z = 0
				var_202_19.x = 0
				var_202_13.localEulerAngles = var_202_19
			end

			if arg_199_1.time_ >= var_202_14 + var_202_15 and arg_199_1.time_ < var_202_14 + var_202_15 + arg_202_0 then
				var_202_13.localPosition = Vector3.New(0, 100, 0)

				local var_202_20 = manager.ui.mainCamera.transform.position - var_202_13.position

				var_202_13.forward = Vector3.New(var_202_20.x, var_202_20.y, var_202_20.z)

				local var_202_21 = var_202_13.localEulerAngles

				var_202_21.z = 0
				var_202_21.x = 0
				var_202_13.localEulerAngles = var_202_21
			end

			local var_202_22 = arg_199_1.actors_["1019ui_story"].transform
			local var_202_23 = 0

			if var_202_23 < arg_199_1.time_ and arg_199_1.time_ <= var_202_23 + arg_202_0 then
				arg_199_1.var_.moveOldPos1019ui_story = var_202_22.localPosition
			end

			local var_202_24 = 0.001

			if var_202_23 <= arg_199_1.time_ and arg_199_1.time_ < var_202_23 + var_202_24 then
				local var_202_25 = (arg_199_1.time_ - var_202_23) / var_202_24
				local var_202_26 = Vector3.New(0, -1.08, -5.9)

				var_202_22.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1019ui_story, var_202_26, var_202_25)

				local var_202_27 = manager.ui.mainCamera.transform.position - var_202_22.position

				var_202_22.forward = Vector3.New(var_202_27.x, var_202_27.y, var_202_27.z)

				local var_202_28 = var_202_22.localEulerAngles

				var_202_28.z = 0
				var_202_28.x = 0
				var_202_22.localEulerAngles = var_202_28
			end

			if arg_199_1.time_ >= var_202_23 + var_202_24 and arg_199_1.time_ < var_202_23 + var_202_24 + arg_202_0 then
				var_202_22.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_202_29 = manager.ui.mainCamera.transform.position - var_202_22.position

				var_202_22.forward = Vector3.New(var_202_29.x, var_202_29.y, var_202_29.z)

				local var_202_30 = var_202_22.localEulerAngles

				var_202_30.z = 0
				var_202_30.x = 0
				var_202_22.localEulerAngles = var_202_30
			end

			local var_202_31 = 0

			if var_202_31 < arg_199_1.time_ and arg_199_1.time_ <= var_202_31 + arg_202_0 then
				arg_199_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_202_32 = 0
			local var_202_33 = 0.6

			if var_202_32 < arg_199_1.time_ and arg_199_1.time_ <= var_202_32 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_34 = arg_199_1:FormatText(StoryNameCfg[13].name)

				arg_199_1.leftNameTxt_.text = var_202_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_35 = arg_199_1:GetWordFromCfg(105121048)
				local var_202_36 = arg_199_1:FormatText(var_202_35.content)

				arg_199_1.text_.text = var_202_36

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_37 = 24
				local var_202_38 = utf8.len(var_202_36)
				local var_202_39 = var_202_37 <= 0 and var_202_33 or var_202_33 * (var_202_38 / var_202_37)

				if var_202_39 > 0 and var_202_33 < var_202_39 then
					arg_199_1.talkMaxDuration = var_202_39

					if var_202_39 + var_202_32 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_39 + var_202_32
					end
				end

				arg_199_1.text_.text = var_202_36
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121048", "story_v_out_105121.awb") ~= 0 then
					local var_202_40 = manager.audio:GetVoiceLength("story_v_out_105121", "105121048", "story_v_out_105121.awb") / 1000

					if var_202_40 + var_202_32 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_40 + var_202_32
					end

					if var_202_35.prefab_name ~= "" and arg_199_1.actors_[var_202_35.prefab_name] ~= nil then
						local var_202_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_35.prefab_name].transform, "story_v_out_105121", "105121048", "story_v_out_105121.awb")

						arg_199_1:RecordAudio("105121048", var_202_41)
						arg_199_1:RecordAudio("105121048", var_202_41)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_105121", "105121048", "story_v_out_105121.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_105121", "105121048", "story_v_out_105121.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_42 = math.max(var_202_33, arg_199_1.talkMaxDuration)

			if var_202_32 <= arg_199_1.time_ and arg_199_1.time_ < var_202_32 + var_202_42 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_32) / var_202_42

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_32 + var_202_42 and arg_199_1.time_ < var_202_32 + var_202_42 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play105121049 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 105121049
		arg_203_1.duration_ = 3.266

		local var_203_0 = {
			ja = 3.266,
			ko = 2,
			zh = 2.066,
			en = 2.3
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
				arg_203_0:Play105121050(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1019ui_story"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.characterEffect1019ui_story == nil then
				arg_203_1.var_.characterEffect1019ui_story = var_206_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_2 = 0.1

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.characterEffect1019ui_story then
					local var_206_4 = Mathf.Lerp(0, 0.5, var_206_3)

					arg_203_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_203_1.var_.characterEffect1019ui_story.fillRatio = var_206_4
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.characterEffect1019ui_story then
				local var_206_5 = 0.5

				arg_203_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_203_1.var_.characterEffect1019ui_story.fillRatio = var_206_5
			end

			local var_206_6 = arg_203_1.actors_["1019ui_story"].transform
			local var_206_7 = 0

			if var_206_7 < arg_203_1.time_ and arg_203_1.time_ <= var_206_7 + arg_206_0 then
				arg_203_1.var_.moveOldPos1019ui_story = var_206_6.localPosition
			end

			local var_206_8 = 0.001

			if var_206_7 <= arg_203_1.time_ and arg_203_1.time_ < var_206_7 + var_206_8 then
				local var_206_9 = (arg_203_1.time_ - var_206_7) / var_206_8
				local var_206_10 = Vector3.New(0, 100, 0)

				var_206_6.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1019ui_story, var_206_10, var_206_9)

				local var_206_11 = manager.ui.mainCamera.transform.position - var_206_6.position

				var_206_6.forward = Vector3.New(var_206_11.x, var_206_11.y, var_206_11.z)

				local var_206_12 = var_206_6.localEulerAngles

				var_206_12.z = 0
				var_206_12.x = 0
				var_206_6.localEulerAngles = var_206_12
			end

			if arg_203_1.time_ >= var_206_7 + var_206_8 and arg_203_1.time_ < var_206_7 + var_206_8 + arg_206_0 then
				var_206_6.localPosition = Vector3.New(0, 100, 0)

				local var_206_13 = manager.ui.mainCamera.transform.position - var_206_6.position

				var_206_6.forward = Vector3.New(var_206_13.x, var_206_13.y, var_206_13.z)

				local var_206_14 = var_206_6.localEulerAngles

				var_206_14.z = 0
				var_206_14.x = 0
				var_206_6.localEulerAngles = var_206_14
			end

			local var_206_15 = 0
			local var_206_16 = 0.175

			if var_206_15 < arg_203_1.time_ and arg_203_1.time_ <= var_206_15 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_17 = arg_203_1:FormatText(StoryNameCfg[35].name)

				arg_203_1.leftNameTxt_.text = var_206_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, true)
				arg_203_1.iconController_:SetSelectedState("hero")

				arg_203_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1013")

				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_18 = arg_203_1:GetWordFromCfg(105121049)
				local var_206_19 = arg_203_1:FormatText(var_206_18.content)

				arg_203_1.text_.text = var_206_19

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_20 = 7
				local var_206_21 = utf8.len(var_206_19)
				local var_206_22 = var_206_20 <= 0 and var_206_16 or var_206_16 * (var_206_21 / var_206_20)

				if var_206_22 > 0 and var_206_16 < var_206_22 then
					arg_203_1.talkMaxDuration = var_206_22

					if var_206_22 + var_206_15 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_22 + var_206_15
					end
				end

				arg_203_1.text_.text = var_206_19
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121049", "story_v_out_105121.awb") ~= 0 then
					local var_206_23 = manager.audio:GetVoiceLength("story_v_out_105121", "105121049", "story_v_out_105121.awb") / 1000

					if var_206_23 + var_206_15 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_23 + var_206_15
					end

					if var_206_18.prefab_name ~= "" and arg_203_1.actors_[var_206_18.prefab_name] ~= nil then
						local var_206_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_18.prefab_name].transform, "story_v_out_105121", "105121049", "story_v_out_105121.awb")

						arg_203_1:RecordAudio("105121049", var_206_24)
						arg_203_1:RecordAudio("105121049", var_206_24)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_105121", "105121049", "story_v_out_105121.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_105121", "105121049", "story_v_out_105121.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_25 = math.max(var_206_16, arg_203_1.talkMaxDuration)

			if var_206_15 <= arg_203_1.time_ and arg_203_1.time_ < var_206_15 + var_206_25 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_15) / var_206_25

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_15 + var_206_25 and arg_203_1.time_ < var_206_15 + var_206_25 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play105121050 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 105121050
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play105121051(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 1.425

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, false)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_2 = arg_207_1:GetWordFromCfg(105121050)
				local var_210_3 = arg_207_1:FormatText(var_210_2.content)

				arg_207_1.text_.text = var_210_3

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_4 = 56
				local var_210_5 = utf8.len(var_210_3)
				local var_210_6 = var_210_4 <= 0 and var_210_1 or var_210_1 * (var_210_5 / var_210_4)

				if var_210_6 > 0 and var_210_1 < var_210_6 then
					arg_207_1.talkMaxDuration = var_210_6

					if var_210_6 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_6 + var_210_0
					end
				end

				arg_207_1.text_.text = var_210_3
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_7 = math.max(var_210_1, arg_207_1.talkMaxDuration)

			if var_210_0 <= arg_207_1.time_ and arg_207_1.time_ < var_210_0 + var_210_7 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_0) / var_210_7

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_0 + var_210_7 and arg_207_1.time_ < var_210_0 + var_210_7 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play105121051 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 105121051
		arg_211_1.duration_ = 5.433

		local var_211_0 = {
			ja = 5.433,
			ko = 4,
			zh = 4.1,
			en = 4.066
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
				arg_211_0:Play105121052(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = "1013ui_story"

			if arg_211_1.actors_[var_214_0] == nil then
				local var_214_1 = Object.Instantiate(Asset.Load("Char/" .. var_214_0), arg_211_1.stage_.transform)

				var_214_1.name = var_214_0
				var_214_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_211_1.actors_[var_214_0] = var_214_1

				local var_214_2 = var_214_1:GetComponentInChildren(typeof(CharacterEffect))

				var_214_2.enabled = true

				local var_214_3 = GameObjectTools.GetOrAddComponent(var_214_1, typeof(DynamicBoneHelper))

				if var_214_3 then
					var_214_3:EnableDynamicBone(false)
				end

				arg_211_1:ShowWeapon(var_214_2.transform, false)

				arg_211_1.var_[var_214_0 .. "Animator"] = var_214_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_211_1.var_[var_214_0 .. "Animator"].applyRootMotion = true
				arg_211_1.var_[var_214_0 .. "LipSync"] = var_214_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_214_4 = arg_211_1.actors_["1013ui_story"]
			local var_214_5 = 0

			if var_214_5 < arg_211_1.time_ and arg_211_1.time_ <= var_214_5 + arg_214_0 and arg_211_1.var_.characterEffect1013ui_story == nil then
				arg_211_1.var_.characterEffect1013ui_story = var_214_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_6 = 0.1

			if var_214_5 <= arg_211_1.time_ and arg_211_1.time_ < var_214_5 + var_214_6 then
				local var_214_7 = (arg_211_1.time_ - var_214_5) / var_214_6

				if arg_211_1.var_.characterEffect1013ui_story then
					arg_211_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_5 + var_214_6 and arg_211_1.time_ < var_214_5 + var_214_6 + arg_214_0 and arg_211_1.var_.characterEffect1013ui_story then
				arg_211_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_214_8 = arg_211_1.actors_["1013ui_story"].transform
			local var_214_9 = 0

			if var_214_9 < arg_211_1.time_ and arg_211_1.time_ <= var_214_9 + arg_214_0 then
				arg_211_1.var_.moveOldPos1013ui_story = var_214_8.localPosition
			end

			local var_214_10 = 0.001

			if var_214_9 <= arg_211_1.time_ and arg_211_1.time_ < var_214_9 + var_214_10 then
				local var_214_11 = (arg_211_1.time_ - var_214_9) / var_214_10
				local var_214_12 = Vector3.New(-0.7, -0.66, -6.15)

				var_214_8.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos1013ui_story, var_214_12, var_214_11)

				local var_214_13 = manager.ui.mainCamera.transform.position - var_214_8.position

				var_214_8.forward = Vector3.New(var_214_13.x, var_214_13.y, var_214_13.z)

				local var_214_14 = var_214_8.localEulerAngles

				var_214_14.z = 0
				var_214_14.x = 0
				var_214_8.localEulerAngles = var_214_14
			end

			if arg_211_1.time_ >= var_214_9 + var_214_10 and arg_211_1.time_ < var_214_9 + var_214_10 + arg_214_0 then
				var_214_8.localPosition = Vector3.New(-0.7, -0.66, -6.15)

				local var_214_15 = manager.ui.mainCamera.transform.position - var_214_8.position

				var_214_8.forward = Vector3.New(var_214_15.x, var_214_15.y, var_214_15.z)

				local var_214_16 = var_214_8.localEulerAngles

				var_214_16.z = 0
				var_214_16.x = 0
				var_214_8.localEulerAngles = var_214_16
			end

			local var_214_17 = 0

			if var_214_17 < arg_211_1.time_ and arg_211_1.time_ <= var_214_17 + arg_214_0 then
				arg_211_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013action/1013action10_1")
			end

			local var_214_18 = 0

			if var_214_18 < arg_211_1.time_ and arg_211_1.time_ <= var_214_18 + arg_214_0 then
				arg_211_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_214_19 = 0
			local var_214_20 = 0.525

			if var_214_19 < arg_211_1.time_ and arg_211_1.time_ <= var_214_19 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_21 = arg_211_1:FormatText(StoryNameCfg[35].name)

				arg_211_1.leftNameTxt_.text = var_214_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_22 = arg_211_1:GetWordFromCfg(105121051)
				local var_214_23 = arg_211_1:FormatText(var_214_22.content)

				arg_211_1.text_.text = var_214_23

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_24 = 21
				local var_214_25 = utf8.len(var_214_23)
				local var_214_26 = var_214_24 <= 0 and var_214_20 or var_214_20 * (var_214_25 / var_214_24)

				if var_214_26 > 0 and var_214_20 < var_214_26 then
					arg_211_1.talkMaxDuration = var_214_26

					if var_214_26 + var_214_19 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_26 + var_214_19
					end
				end

				arg_211_1.text_.text = var_214_23
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121051", "story_v_out_105121.awb") ~= 0 then
					local var_214_27 = manager.audio:GetVoiceLength("story_v_out_105121", "105121051", "story_v_out_105121.awb") / 1000

					if var_214_27 + var_214_19 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_27 + var_214_19
					end

					if var_214_22.prefab_name ~= "" and arg_211_1.actors_[var_214_22.prefab_name] ~= nil then
						local var_214_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_22.prefab_name].transform, "story_v_out_105121", "105121051", "story_v_out_105121.awb")

						arg_211_1:RecordAudio("105121051", var_214_28)
						arg_211_1:RecordAudio("105121051", var_214_28)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_105121", "105121051", "story_v_out_105121.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_105121", "105121051", "story_v_out_105121.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_29 = math.max(var_214_20, arg_211_1.talkMaxDuration)

			if var_214_19 <= arg_211_1.time_ and arg_211_1.time_ < var_214_19 + var_214_29 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_19) / var_214_29

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_19 + var_214_29 and arg_211_1.time_ < var_214_19 + var_214_29 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play105121052 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 105121052
		arg_215_1.duration_ = 1.999999999999

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play105121053(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1084ui_story"]
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 and arg_215_1.var_.characterEffect1084ui_story == nil then
				arg_215_1.var_.characterEffect1084ui_story = var_218_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_2 = 0.1

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2

				if arg_215_1.var_.characterEffect1084ui_story then
					arg_215_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 and arg_215_1.var_.characterEffect1084ui_story then
				arg_215_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_218_4 = arg_215_1.actors_["1013ui_story"]
			local var_218_5 = 0

			if var_218_5 < arg_215_1.time_ and arg_215_1.time_ <= var_218_5 + arg_218_0 and arg_215_1.var_.characterEffect1013ui_story == nil then
				arg_215_1.var_.characterEffect1013ui_story = var_218_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_6 = 0.1

			if var_218_5 <= arg_215_1.time_ and arg_215_1.time_ < var_218_5 + var_218_6 then
				local var_218_7 = (arg_215_1.time_ - var_218_5) / var_218_6

				if arg_215_1.var_.characterEffect1013ui_story then
					local var_218_8 = Mathf.Lerp(0, 0.5, var_218_7)

					arg_215_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_215_1.var_.characterEffect1013ui_story.fillRatio = var_218_8
				end
			end

			if arg_215_1.time_ >= var_218_5 + var_218_6 and arg_215_1.time_ < var_218_5 + var_218_6 + arg_218_0 and arg_215_1.var_.characterEffect1013ui_story then
				local var_218_9 = 0.5

				arg_215_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_215_1.var_.characterEffect1013ui_story.fillRatio = var_218_9
			end

			local var_218_10 = arg_215_1.actors_["1084ui_story"].transform
			local var_218_11 = 0

			if var_218_11 < arg_215_1.time_ and arg_215_1.time_ <= var_218_11 + arg_218_0 then
				arg_215_1.var_.moveOldPos1084ui_story = var_218_10.localPosition
			end

			local var_218_12 = 0.001

			if var_218_11 <= arg_215_1.time_ and arg_215_1.time_ < var_218_11 + var_218_12 then
				local var_218_13 = (arg_215_1.time_ - var_218_11) / var_218_12
				local var_218_14 = Vector3.New(0.7, -0.97, -6)

				var_218_10.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos1084ui_story, var_218_14, var_218_13)

				local var_218_15 = manager.ui.mainCamera.transform.position - var_218_10.position

				var_218_10.forward = Vector3.New(var_218_15.x, var_218_15.y, var_218_15.z)

				local var_218_16 = var_218_10.localEulerAngles

				var_218_16.z = 0
				var_218_16.x = 0
				var_218_10.localEulerAngles = var_218_16
			end

			if arg_215_1.time_ >= var_218_11 + var_218_12 and arg_215_1.time_ < var_218_11 + var_218_12 + arg_218_0 then
				var_218_10.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_218_17 = manager.ui.mainCamera.transform.position - var_218_10.position

				var_218_10.forward = Vector3.New(var_218_17.x, var_218_17.y, var_218_17.z)

				local var_218_18 = var_218_10.localEulerAngles

				var_218_18.z = 0
				var_218_18.x = 0
				var_218_10.localEulerAngles = var_218_18
			end

			local var_218_19 = 0

			if var_218_19 < arg_215_1.time_ and arg_215_1.time_ <= var_218_19 + arg_218_0 then
				arg_215_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_218_20 = 0

			if var_218_20 < arg_215_1.time_ and arg_215_1.time_ <= var_218_20 + arg_218_0 then
				arg_215_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_218_21 = 0
			local var_218_22 = 0.125

			if var_218_21 < arg_215_1.time_ and arg_215_1.time_ <= var_218_21 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_23 = arg_215_1:FormatText(StoryNameCfg[6].name)

				arg_215_1.leftNameTxt_.text = var_218_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_24 = arg_215_1:GetWordFromCfg(105121052)
				local var_218_25 = arg_215_1:FormatText(var_218_24.content)

				arg_215_1.text_.text = var_218_25

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_26 = 5
				local var_218_27 = utf8.len(var_218_25)
				local var_218_28 = var_218_26 <= 0 and var_218_22 or var_218_22 * (var_218_27 / var_218_26)

				if var_218_28 > 0 and var_218_22 < var_218_28 then
					arg_215_1.talkMaxDuration = var_218_28

					if var_218_28 + var_218_21 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_28 + var_218_21
					end
				end

				arg_215_1.text_.text = var_218_25
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121052", "story_v_out_105121.awb") ~= 0 then
					local var_218_29 = manager.audio:GetVoiceLength("story_v_out_105121", "105121052", "story_v_out_105121.awb") / 1000

					if var_218_29 + var_218_21 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_29 + var_218_21
					end

					if var_218_24.prefab_name ~= "" and arg_215_1.actors_[var_218_24.prefab_name] ~= nil then
						local var_218_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_24.prefab_name].transform, "story_v_out_105121", "105121052", "story_v_out_105121.awb")

						arg_215_1:RecordAudio("105121052", var_218_30)
						arg_215_1:RecordAudio("105121052", var_218_30)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_105121", "105121052", "story_v_out_105121.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_105121", "105121052", "story_v_out_105121.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_31 = math.max(var_218_22, arg_215_1.talkMaxDuration)

			if var_218_21 <= arg_215_1.time_ and arg_215_1.time_ < var_218_21 + var_218_31 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_21) / var_218_31

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_21 + var_218_31 and arg_215_1.time_ < var_218_21 + var_218_31 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play105121053 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 105121053
		arg_219_1.duration_ = 11.733

		local var_219_0 = {
			ja = 9.266,
			ko = 8.6,
			zh = 7.833,
			en = 11.733
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
				arg_219_0:Play105121054(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = "10002_tpose"

			if arg_219_1.actors_[var_222_0] == nil then
				local var_222_1 = Object.Instantiate(Asset.Load("Char/" .. var_222_0), arg_219_1.stage_.transform)

				var_222_1.name = var_222_0
				var_222_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_219_1.actors_[var_222_0] = var_222_1

				local var_222_2 = var_222_1:GetComponentInChildren(typeof(CharacterEffect))

				var_222_2.enabled = true

				local var_222_3 = GameObjectTools.GetOrAddComponent(var_222_1, typeof(DynamicBoneHelper))

				if var_222_3 then
					var_222_3:EnableDynamicBone(false)
				end

				arg_219_1:ShowWeapon(var_222_2.transform, false)

				arg_219_1.var_[var_222_0 .. "Animator"] = var_222_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_219_1.var_[var_222_0 .. "Animator"].applyRootMotion = true
				arg_219_1.var_[var_222_0 .. "LipSync"] = var_222_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_222_4 = arg_219_1.actors_["10002_tpose"]
			local var_222_5 = 0

			if var_222_5 < arg_219_1.time_ and arg_219_1.time_ <= var_222_5 + arg_222_0 and arg_219_1.var_.characterEffect10002_tpose == nil then
				arg_219_1.var_.characterEffect10002_tpose = var_222_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_6 = 0.1

			if var_222_5 <= arg_219_1.time_ and arg_219_1.time_ < var_222_5 + var_222_6 then
				local var_222_7 = (arg_219_1.time_ - var_222_5) / var_222_6

				if arg_219_1.var_.characterEffect10002_tpose then
					arg_219_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_5 + var_222_6 and arg_219_1.time_ < var_222_5 + var_222_6 + arg_222_0 and arg_219_1.var_.characterEffect10002_tpose then
				arg_219_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_222_8 = arg_219_1.actors_["1084ui_story"]
			local var_222_9 = 0

			if var_222_9 < arg_219_1.time_ and arg_219_1.time_ <= var_222_9 + arg_222_0 and arg_219_1.var_.characterEffect1084ui_story == nil then
				arg_219_1.var_.characterEffect1084ui_story = var_222_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_10 = 0.1

			if var_222_9 <= arg_219_1.time_ and arg_219_1.time_ < var_222_9 + var_222_10 then
				local var_222_11 = (arg_219_1.time_ - var_222_9) / var_222_10

				if arg_219_1.var_.characterEffect1084ui_story then
					local var_222_12 = Mathf.Lerp(0, 0.5, var_222_11)

					arg_219_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_219_1.var_.characterEffect1084ui_story.fillRatio = var_222_12
				end
			end

			if arg_219_1.time_ >= var_222_9 + var_222_10 and arg_219_1.time_ < var_222_9 + var_222_10 + arg_222_0 and arg_219_1.var_.characterEffect1084ui_story then
				local var_222_13 = 0.5

				arg_219_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_219_1.var_.characterEffect1084ui_story.fillRatio = var_222_13
			end

			local var_222_14 = arg_219_1.actors_["1013ui_story"].transform
			local var_222_15 = 0

			if var_222_15 < arg_219_1.time_ and arg_219_1.time_ <= var_222_15 + arg_222_0 then
				arg_219_1.var_.moveOldPos1013ui_story = var_222_14.localPosition
			end

			local var_222_16 = 0.001

			if var_222_15 <= arg_219_1.time_ and arg_219_1.time_ < var_222_15 + var_222_16 then
				local var_222_17 = (arg_219_1.time_ - var_222_15) / var_222_16
				local var_222_18 = Vector3.New(0, 100, 0)

				var_222_14.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1013ui_story, var_222_18, var_222_17)

				local var_222_19 = manager.ui.mainCamera.transform.position - var_222_14.position

				var_222_14.forward = Vector3.New(var_222_19.x, var_222_19.y, var_222_19.z)

				local var_222_20 = var_222_14.localEulerAngles

				var_222_20.z = 0
				var_222_20.x = 0
				var_222_14.localEulerAngles = var_222_20
			end

			if arg_219_1.time_ >= var_222_15 + var_222_16 and arg_219_1.time_ < var_222_15 + var_222_16 + arg_222_0 then
				var_222_14.localPosition = Vector3.New(0, 100, 0)

				local var_222_21 = manager.ui.mainCamera.transform.position - var_222_14.position

				var_222_14.forward = Vector3.New(var_222_21.x, var_222_21.y, var_222_21.z)

				local var_222_22 = var_222_14.localEulerAngles

				var_222_22.z = 0
				var_222_22.x = 0
				var_222_14.localEulerAngles = var_222_22
			end

			local var_222_23 = arg_219_1.actors_["10002_tpose"].transform
			local var_222_24 = 0

			if var_222_24 < arg_219_1.time_ and arg_219_1.time_ <= var_222_24 + arg_222_0 then
				arg_219_1.var_.moveOldPos10002_tpose = var_222_23.localPosition
			end

			local var_222_25 = 0.001

			if var_222_24 <= arg_219_1.time_ and arg_219_1.time_ < var_222_24 + var_222_25 then
				local var_222_26 = (arg_219_1.time_ - var_222_24) / var_222_25
				local var_222_27 = Vector3.New(-0.7, -1.2, -5.8)

				var_222_23.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos10002_tpose, var_222_27, var_222_26)

				local var_222_28 = manager.ui.mainCamera.transform.position - var_222_23.position

				var_222_23.forward = Vector3.New(var_222_28.x, var_222_28.y, var_222_28.z)

				local var_222_29 = var_222_23.localEulerAngles

				var_222_29.z = 0
				var_222_29.x = 0
				var_222_23.localEulerAngles = var_222_29
			end

			if arg_219_1.time_ >= var_222_24 + var_222_25 and arg_219_1.time_ < var_222_24 + var_222_25 + arg_222_0 then
				var_222_23.localPosition = Vector3.New(-0.7, -1.2, -5.8)

				local var_222_30 = manager.ui.mainCamera.transform.position - var_222_23.position

				var_222_23.forward = Vector3.New(var_222_30.x, var_222_30.y, var_222_30.z)

				local var_222_31 = var_222_23.localEulerAngles

				var_222_31.z = 0
				var_222_31.x = 0
				var_222_23.localEulerAngles = var_222_31
			end

			local var_222_32 = 0

			if var_222_32 < arg_219_1.time_ and arg_219_1.time_ <= var_222_32 + arg_222_0 then
				arg_219_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action1_1")
			end

			local var_222_33 = 0

			if var_222_33 < arg_219_1.time_ and arg_219_1.time_ <= var_222_33 + arg_222_0 then
				arg_219_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_222_34 = 0
			local var_222_35 = 0.75

			if var_222_34 < arg_219_1.time_ and arg_219_1.time_ <= var_222_34 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_36 = arg_219_1:FormatText(StoryNameCfg[72].name)

				arg_219_1.leftNameTxt_.text = var_222_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_37 = arg_219_1:GetWordFromCfg(105121053)
				local var_222_38 = arg_219_1:FormatText(var_222_37.content)

				arg_219_1.text_.text = var_222_38

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_39 = 30
				local var_222_40 = utf8.len(var_222_38)
				local var_222_41 = var_222_39 <= 0 and var_222_35 or var_222_35 * (var_222_40 / var_222_39)

				if var_222_41 > 0 and var_222_35 < var_222_41 then
					arg_219_1.talkMaxDuration = var_222_41

					if var_222_41 + var_222_34 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_41 + var_222_34
					end
				end

				arg_219_1.text_.text = var_222_38
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121053", "story_v_out_105121.awb") ~= 0 then
					local var_222_42 = manager.audio:GetVoiceLength("story_v_out_105121", "105121053", "story_v_out_105121.awb") / 1000

					if var_222_42 + var_222_34 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_42 + var_222_34
					end

					if var_222_37.prefab_name ~= "" and arg_219_1.actors_[var_222_37.prefab_name] ~= nil then
						local var_222_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_37.prefab_name].transform, "story_v_out_105121", "105121053", "story_v_out_105121.awb")

						arg_219_1:RecordAudio("105121053", var_222_43)
						arg_219_1:RecordAudio("105121053", var_222_43)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_105121", "105121053", "story_v_out_105121.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_105121", "105121053", "story_v_out_105121.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_44 = math.max(var_222_35, arg_219_1.talkMaxDuration)

			if var_222_34 <= arg_219_1.time_ and arg_219_1.time_ < var_222_34 + var_222_44 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_34) / var_222_44

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_34 + var_222_44 and arg_219_1.time_ < var_222_34 + var_222_44 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play105121054 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 105121054
		arg_223_1.duration_ = 2.5

		local var_223_0 = {
			ja = 2.5,
			ko = 2.5,
			zh = 2.066,
			en = 2.033
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
				arg_223_0:Play105121055(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1084ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.characterEffect1084ui_story == nil then
				arg_223_1.var_.characterEffect1084ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.1

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect1084ui_story then
					arg_223_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect1084ui_story then
				arg_223_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_226_4 = arg_223_1.actors_["10002_tpose"]
			local var_226_5 = 0

			if var_226_5 < arg_223_1.time_ and arg_223_1.time_ <= var_226_5 + arg_226_0 and arg_223_1.var_.characterEffect10002_tpose == nil then
				arg_223_1.var_.characterEffect10002_tpose = var_226_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_6 = 0.1

			if var_226_5 <= arg_223_1.time_ and arg_223_1.time_ < var_226_5 + var_226_6 then
				local var_226_7 = (arg_223_1.time_ - var_226_5) / var_226_6

				if arg_223_1.var_.characterEffect10002_tpose then
					local var_226_8 = Mathf.Lerp(0, 0.5, var_226_7)

					arg_223_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_223_1.var_.characterEffect10002_tpose.fillRatio = var_226_8
				end
			end

			if arg_223_1.time_ >= var_226_5 + var_226_6 and arg_223_1.time_ < var_226_5 + var_226_6 + arg_226_0 and arg_223_1.var_.characterEffect10002_tpose then
				local var_226_9 = 0.5

				arg_223_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_223_1.var_.characterEffect10002_tpose.fillRatio = var_226_9
			end

			local var_226_10 = 0

			if var_226_10 < arg_223_1.time_ and arg_223_1.time_ <= var_226_10 + arg_226_0 then
				arg_223_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4136")
			end

			local var_226_11 = 0

			if var_226_11 < arg_223_1.time_ and arg_223_1.time_ <= var_226_11 + arg_226_0 then
				arg_223_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_226_12 = 0
			local var_226_13 = 0.225

			if var_226_12 < arg_223_1.time_ and arg_223_1.time_ <= var_226_12 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_14 = arg_223_1:FormatText(StoryNameCfg[6].name)

				arg_223_1.leftNameTxt_.text = var_226_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_15 = arg_223_1:GetWordFromCfg(105121054)
				local var_226_16 = arg_223_1:FormatText(var_226_15.content)

				arg_223_1.text_.text = var_226_16

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_17 = 9
				local var_226_18 = utf8.len(var_226_16)
				local var_226_19 = var_226_17 <= 0 and var_226_13 or var_226_13 * (var_226_18 / var_226_17)

				if var_226_19 > 0 and var_226_13 < var_226_19 then
					arg_223_1.talkMaxDuration = var_226_19

					if var_226_19 + var_226_12 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_19 + var_226_12
					end
				end

				arg_223_1.text_.text = var_226_16
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121054", "story_v_out_105121.awb") ~= 0 then
					local var_226_20 = manager.audio:GetVoiceLength("story_v_out_105121", "105121054", "story_v_out_105121.awb") / 1000

					if var_226_20 + var_226_12 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_20 + var_226_12
					end

					if var_226_15.prefab_name ~= "" and arg_223_1.actors_[var_226_15.prefab_name] ~= nil then
						local var_226_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_15.prefab_name].transform, "story_v_out_105121", "105121054", "story_v_out_105121.awb")

						arg_223_1:RecordAudio("105121054", var_226_21)
						arg_223_1:RecordAudio("105121054", var_226_21)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_105121", "105121054", "story_v_out_105121.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_105121", "105121054", "story_v_out_105121.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_22 = math.max(var_226_13, arg_223_1.talkMaxDuration)

			if var_226_12 <= arg_223_1.time_ and arg_223_1.time_ < var_226_12 + var_226_22 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_12) / var_226_22

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_12 + var_226_22 and arg_223_1.time_ < var_226_12 + var_226_22 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play105121055 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 105121055
		arg_227_1.duration_ = 7.5

		local var_227_0 = {
			ja = 6.033,
			ko = 5.3,
			zh = 5.2,
			en = 7.5
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
				arg_227_0:Play105121056(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["10002_tpose"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.characterEffect10002_tpose == nil then
				arg_227_1.var_.characterEffect10002_tpose = var_230_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_2 = 0.1

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.characterEffect10002_tpose then
					arg_227_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.characterEffect10002_tpose then
				arg_227_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_230_4 = arg_227_1.actors_["1084ui_story"]
			local var_230_5 = 0

			if var_230_5 < arg_227_1.time_ and arg_227_1.time_ <= var_230_5 + arg_230_0 and arg_227_1.var_.characterEffect1084ui_story == nil then
				arg_227_1.var_.characterEffect1084ui_story = var_230_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_6 = 0.1

			if var_230_5 <= arg_227_1.time_ and arg_227_1.time_ < var_230_5 + var_230_6 then
				local var_230_7 = (arg_227_1.time_ - var_230_5) / var_230_6

				if arg_227_1.var_.characterEffect1084ui_story then
					local var_230_8 = Mathf.Lerp(0, 0.5, var_230_7)

					arg_227_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_227_1.var_.characterEffect1084ui_story.fillRatio = var_230_8
				end
			end

			if arg_227_1.time_ >= var_230_5 + var_230_6 and arg_227_1.time_ < var_230_5 + var_230_6 + arg_230_0 and arg_227_1.var_.characterEffect1084ui_story then
				local var_230_9 = 0.5

				arg_227_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_227_1.var_.characterEffect1084ui_story.fillRatio = var_230_9
			end

			local var_230_10 = 0

			if var_230_10 < arg_227_1.time_ and arg_227_1.time_ <= var_230_10 + arg_230_0 then
				arg_227_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action3_1")
			end

			local var_230_11 = 0

			if var_230_11 < arg_227_1.time_ and arg_227_1.time_ <= var_230_11 + arg_230_0 then
				arg_227_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_230_12 = 0
			local var_230_13 = 0.45

			if var_230_12 < arg_227_1.time_ and arg_227_1.time_ <= var_230_12 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_14 = arg_227_1:FormatText(StoryNameCfg[72].name)

				arg_227_1.leftNameTxt_.text = var_230_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_15 = arg_227_1:GetWordFromCfg(105121055)
				local var_230_16 = arg_227_1:FormatText(var_230_15.content)

				arg_227_1.text_.text = var_230_16

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_17 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121055", "story_v_out_105121.awb") ~= 0 then
					local var_230_20 = manager.audio:GetVoiceLength("story_v_out_105121", "105121055", "story_v_out_105121.awb") / 1000

					if var_230_20 + var_230_12 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_20 + var_230_12
					end

					if var_230_15.prefab_name ~= "" and arg_227_1.actors_[var_230_15.prefab_name] ~= nil then
						local var_230_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_15.prefab_name].transform, "story_v_out_105121", "105121055", "story_v_out_105121.awb")

						arg_227_1:RecordAudio("105121055", var_230_21)
						arg_227_1:RecordAudio("105121055", var_230_21)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_105121", "105121055", "story_v_out_105121.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_105121", "105121055", "story_v_out_105121.awb")
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
	Play105121056 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 105121056
		arg_231_1.duration_ = 4.1

		local var_231_0 = {
			ja = 4.1,
			ko = 2.5,
			zh = 2.2,
			en = 1.999999999999
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
				arg_231_0:Play105121057(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0

			if var_234_0 < arg_231_1.time_ and arg_231_1.time_ <= var_234_0 + arg_234_0 then
				arg_231_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action3_2")
			end

			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_234_2 = 0
			local var_234_3 = 0.15

			if var_234_2 < arg_231_1.time_ and arg_231_1.time_ <= var_234_2 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_4 = arg_231_1:FormatText(StoryNameCfg[72].name)

				arg_231_1.leftNameTxt_.text = var_234_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_5 = arg_231_1:GetWordFromCfg(105121056)
				local var_234_6 = arg_231_1:FormatText(var_234_5.content)

				arg_231_1.text_.text = var_234_6

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_7 = 6
				local var_234_8 = utf8.len(var_234_6)
				local var_234_9 = var_234_7 <= 0 and var_234_3 or var_234_3 * (var_234_8 / var_234_7)

				if var_234_9 > 0 and var_234_3 < var_234_9 then
					arg_231_1.talkMaxDuration = var_234_9

					if var_234_9 + var_234_2 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_9 + var_234_2
					end
				end

				arg_231_1.text_.text = var_234_6
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121056", "story_v_out_105121.awb") ~= 0 then
					local var_234_10 = manager.audio:GetVoiceLength("story_v_out_105121", "105121056", "story_v_out_105121.awb") / 1000

					if var_234_10 + var_234_2 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_10 + var_234_2
					end

					if var_234_5.prefab_name ~= "" and arg_231_1.actors_[var_234_5.prefab_name] ~= nil then
						local var_234_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_5.prefab_name].transform, "story_v_out_105121", "105121056", "story_v_out_105121.awb")

						arg_231_1:RecordAudio("105121056", var_234_11)
						arg_231_1:RecordAudio("105121056", var_234_11)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_105121", "105121056", "story_v_out_105121.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_105121", "105121056", "story_v_out_105121.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_12 = math.max(var_234_3, arg_231_1.talkMaxDuration)

			if var_234_2 <= arg_231_1.time_ and arg_231_1.time_ < var_234_2 + var_234_12 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_2) / var_234_12

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_2 + var_234_12 and arg_231_1.time_ < var_234_2 + var_234_12 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play105121057 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 105121057
		arg_235_1.duration_ = 7.5

		local var_235_0 = {
			ja = 7.5,
			ko = 3.7,
			zh = 3.766,
			en = 4.833
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
				arg_235_0:Play105121058(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["10001_tpose"]
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 and arg_235_1.var_.characterEffect10001_tpose == nil then
				arg_235_1.var_.characterEffect10001_tpose = var_238_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_2 = 0.1

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2

				if arg_235_1.var_.characterEffect10001_tpose then
					arg_235_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 and arg_235_1.var_.characterEffect10001_tpose then
				arg_235_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_238_4 = arg_235_1.actors_["10002_tpose"]
			local var_238_5 = 0

			if var_238_5 < arg_235_1.time_ and arg_235_1.time_ <= var_238_5 + arg_238_0 and arg_235_1.var_.characterEffect10002_tpose == nil then
				arg_235_1.var_.characterEffect10002_tpose = var_238_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_6 = 0.1

			if var_238_5 <= arg_235_1.time_ and arg_235_1.time_ < var_238_5 + var_238_6 then
				local var_238_7 = (arg_235_1.time_ - var_238_5) / var_238_6

				if arg_235_1.var_.characterEffect10002_tpose then
					local var_238_8 = Mathf.Lerp(0, 0.5, var_238_7)

					arg_235_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_235_1.var_.characterEffect10002_tpose.fillRatio = var_238_8
				end
			end

			if arg_235_1.time_ >= var_238_5 + var_238_6 and arg_235_1.time_ < var_238_5 + var_238_6 + arg_238_0 and arg_235_1.var_.characterEffect10002_tpose then
				local var_238_9 = 0.5

				arg_235_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_235_1.var_.characterEffect10002_tpose.fillRatio = var_238_9
			end

			local var_238_10 = arg_235_1.actors_["1084ui_story"].transform
			local var_238_11 = 0

			if var_238_11 < arg_235_1.time_ and arg_235_1.time_ <= var_238_11 + arg_238_0 then
				arg_235_1.var_.moveOldPos1084ui_story = var_238_10.localPosition
			end

			local var_238_12 = 0.001

			if var_238_11 <= arg_235_1.time_ and arg_235_1.time_ < var_238_11 + var_238_12 then
				local var_238_13 = (arg_235_1.time_ - var_238_11) / var_238_12
				local var_238_14 = Vector3.New(0, 100, 0)

				var_238_10.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1084ui_story, var_238_14, var_238_13)

				local var_238_15 = manager.ui.mainCamera.transform.position - var_238_10.position

				var_238_10.forward = Vector3.New(var_238_15.x, var_238_15.y, var_238_15.z)

				local var_238_16 = var_238_10.localEulerAngles

				var_238_16.z = 0
				var_238_16.x = 0
				var_238_10.localEulerAngles = var_238_16
			end

			if arg_235_1.time_ >= var_238_11 + var_238_12 and arg_235_1.time_ < var_238_11 + var_238_12 + arg_238_0 then
				var_238_10.localPosition = Vector3.New(0, 100, 0)

				local var_238_17 = manager.ui.mainCamera.transform.position - var_238_10.position

				var_238_10.forward = Vector3.New(var_238_17.x, var_238_17.y, var_238_17.z)

				local var_238_18 = var_238_10.localEulerAngles

				var_238_18.z = 0
				var_238_18.x = 0
				var_238_10.localEulerAngles = var_238_18
			end

			local var_238_19 = arg_235_1.actors_["10002_tpose"].transform
			local var_238_20 = 0

			if var_238_20 < arg_235_1.time_ and arg_235_1.time_ <= var_238_20 + arg_238_0 then
				arg_235_1.var_.moveOldPos10002_tpose = var_238_19.localPosition
			end

			local var_238_21 = 0.001

			if var_238_20 <= arg_235_1.time_ and arg_235_1.time_ < var_238_20 + var_238_21 then
				local var_238_22 = (arg_235_1.time_ - var_238_20) / var_238_21
				local var_238_23 = Vector3.New(0, 100, 0)

				var_238_19.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos10002_tpose, var_238_23, var_238_22)

				local var_238_24 = manager.ui.mainCamera.transform.position - var_238_19.position

				var_238_19.forward = Vector3.New(var_238_24.x, var_238_24.y, var_238_24.z)

				local var_238_25 = var_238_19.localEulerAngles

				var_238_25.z = 0
				var_238_25.x = 0
				var_238_19.localEulerAngles = var_238_25
			end

			if arg_235_1.time_ >= var_238_20 + var_238_21 and arg_235_1.time_ < var_238_20 + var_238_21 + arg_238_0 then
				var_238_19.localPosition = Vector3.New(0, 100, 0)

				local var_238_26 = manager.ui.mainCamera.transform.position - var_238_19.position

				var_238_19.forward = Vector3.New(var_238_26.x, var_238_26.y, var_238_26.z)

				local var_238_27 = var_238_19.localEulerAngles

				var_238_27.z = 0
				var_238_27.x = 0
				var_238_19.localEulerAngles = var_238_27
			end

			local var_238_28 = 0

			if var_238_28 < arg_235_1.time_ and arg_235_1.time_ <= var_238_28 + arg_238_0 then
				arg_235_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action1_1")
			end

			local var_238_29 = arg_235_1.actors_["10001_tpose"].transform
			local var_238_30 = 0

			if var_238_30 < arg_235_1.time_ and arg_235_1.time_ <= var_238_30 + arg_238_0 then
				arg_235_1.var_.moveOldPos10001_tpose = var_238_29.localPosition
			end

			local var_238_31 = 0.001

			if var_238_30 <= arg_235_1.time_ and arg_235_1.time_ < var_238_30 + var_238_31 then
				local var_238_32 = (arg_235_1.time_ - var_238_30) / var_238_31
				local var_238_33 = Vector3.New(0, -1.23, -5.8)

				var_238_29.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos10001_tpose, var_238_33, var_238_32)

				local var_238_34 = manager.ui.mainCamera.transform.position - var_238_29.position

				var_238_29.forward = Vector3.New(var_238_34.x, var_238_34.y, var_238_34.z)

				local var_238_35 = var_238_29.localEulerAngles

				var_238_35.z = 0
				var_238_35.x = 0
				var_238_29.localEulerAngles = var_238_35
			end

			if arg_235_1.time_ >= var_238_30 + var_238_31 and arg_235_1.time_ < var_238_30 + var_238_31 + arg_238_0 then
				var_238_29.localPosition = Vector3.New(0, -1.23, -5.8)

				local var_238_36 = manager.ui.mainCamera.transform.position - var_238_29.position

				var_238_29.forward = Vector3.New(var_238_36.x, var_238_36.y, var_238_36.z)

				local var_238_37 = var_238_29.localEulerAngles

				var_238_37.z = 0
				var_238_37.x = 0
				var_238_29.localEulerAngles = var_238_37
			end

			local var_238_38 = 0

			if var_238_38 < arg_235_1.time_ and arg_235_1.time_ <= var_238_38 + arg_238_0 then
				arg_235_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_238_39 = 0
			local var_238_40 = 0.225

			if var_238_39 < arg_235_1.time_ and arg_235_1.time_ <= var_238_39 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_41 = arg_235_1:FormatText(StoryNameCfg[31].name)

				arg_235_1.leftNameTxt_.text = var_238_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_42 = arg_235_1:GetWordFromCfg(105121057)
				local var_238_43 = arg_235_1:FormatText(var_238_42.content)

				arg_235_1.text_.text = var_238_43

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_44 = 9
				local var_238_45 = utf8.len(var_238_43)
				local var_238_46 = var_238_44 <= 0 and var_238_40 or var_238_40 * (var_238_45 / var_238_44)

				if var_238_46 > 0 and var_238_40 < var_238_46 then
					arg_235_1.talkMaxDuration = var_238_46

					if var_238_46 + var_238_39 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_46 + var_238_39
					end
				end

				arg_235_1.text_.text = var_238_43
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121057", "story_v_out_105121.awb") ~= 0 then
					local var_238_47 = manager.audio:GetVoiceLength("story_v_out_105121", "105121057", "story_v_out_105121.awb") / 1000

					if var_238_47 + var_238_39 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_47 + var_238_39
					end

					if var_238_42.prefab_name ~= "" and arg_235_1.actors_[var_238_42.prefab_name] ~= nil then
						local var_238_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_42.prefab_name].transform, "story_v_out_105121", "105121057", "story_v_out_105121.awb")

						arg_235_1:RecordAudio("105121057", var_238_48)
						arg_235_1:RecordAudio("105121057", var_238_48)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_105121", "105121057", "story_v_out_105121.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_105121", "105121057", "story_v_out_105121.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_49 = math.max(var_238_40, arg_235_1.talkMaxDuration)

			if var_238_39 <= arg_235_1.time_ and arg_235_1.time_ < var_238_39 + var_238_49 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_39) / var_238_49

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_39 + var_238_49 and arg_235_1.time_ < var_238_39 + var_238_49 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play105121058 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 105121058
		arg_239_1.duration_ = 1.333

		local var_239_0 = {
			ja = 0.766,
			ko = 1.266,
			zh = 1,
			en = 1.333
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
				arg_239_0:Play105121059(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1084ui_story"]
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 and arg_239_1.var_.characterEffect1084ui_story == nil then
				arg_239_1.var_.characterEffect1084ui_story = var_242_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_2 = 0.1

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2

				if arg_239_1.var_.characterEffect1084ui_story then
					arg_239_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 and arg_239_1.var_.characterEffect1084ui_story then
				arg_239_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_242_4 = arg_239_1.actors_["10001_tpose"]
			local var_242_5 = 0

			if var_242_5 < arg_239_1.time_ and arg_239_1.time_ <= var_242_5 + arg_242_0 and arg_239_1.var_.characterEffect10001_tpose == nil then
				arg_239_1.var_.characterEffect10001_tpose = var_242_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_6 = 0.1

			if var_242_5 <= arg_239_1.time_ and arg_239_1.time_ < var_242_5 + var_242_6 then
				local var_242_7 = (arg_239_1.time_ - var_242_5) / var_242_6

				if arg_239_1.var_.characterEffect10001_tpose then
					local var_242_8 = Mathf.Lerp(0, 0.5, var_242_7)

					arg_239_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_239_1.var_.characterEffect10001_tpose.fillRatio = var_242_8
				end
			end

			if arg_239_1.time_ >= var_242_5 + var_242_6 and arg_239_1.time_ < var_242_5 + var_242_6 + arg_242_0 and arg_239_1.var_.characterEffect10001_tpose then
				local var_242_9 = 0.5

				arg_239_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_239_1.var_.characterEffect10001_tpose.fillRatio = var_242_9
			end

			local var_242_10 = 0
			local var_242_11 = 0.05

			if var_242_10 < arg_239_1.time_ and arg_239_1.time_ <= var_242_10 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_12 = arg_239_1:FormatText(StoryNameCfg[6].name)

				arg_239_1.leftNameTxt_.text = var_242_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, true)
				arg_239_1.iconController_:SetSelectedState("hero")

				arg_239_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_13 = arg_239_1:GetWordFromCfg(105121058)
				local var_242_14 = arg_239_1:FormatText(var_242_13.content)

				arg_239_1.text_.text = var_242_14

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_15 = 2
				local var_242_16 = utf8.len(var_242_14)
				local var_242_17 = var_242_15 <= 0 and var_242_11 or var_242_11 * (var_242_16 / var_242_15)

				if var_242_17 > 0 and var_242_11 < var_242_17 then
					arg_239_1.talkMaxDuration = var_242_17

					if var_242_17 + var_242_10 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_17 + var_242_10
					end
				end

				arg_239_1.text_.text = var_242_14
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121058", "story_v_out_105121.awb") ~= 0 then
					local var_242_18 = manager.audio:GetVoiceLength("story_v_out_105121", "105121058", "story_v_out_105121.awb") / 1000

					if var_242_18 + var_242_10 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_18 + var_242_10
					end

					if var_242_13.prefab_name ~= "" and arg_239_1.actors_[var_242_13.prefab_name] ~= nil then
						local var_242_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_13.prefab_name].transform, "story_v_out_105121", "105121058", "story_v_out_105121.awb")

						arg_239_1:RecordAudio("105121058", var_242_19)
						arg_239_1:RecordAudio("105121058", var_242_19)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_105121", "105121058", "story_v_out_105121.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_105121", "105121058", "story_v_out_105121.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_20 = math.max(var_242_11, arg_239_1.talkMaxDuration)

			if var_242_10 <= arg_239_1.time_ and arg_239_1.time_ < var_242_10 + var_242_20 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_10) / var_242_20

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_10 + var_242_20 and arg_239_1.time_ < var_242_10 + var_242_20 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play105121059 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 105121059
		arg_243_1.duration_ = 5

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play105121060(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1019ui_story"]
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 and arg_243_1.var_.characterEffect1019ui_story == nil then
				arg_243_1.var_.characterEffect1019ui_story = var_246_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_2 = 0.1

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2

				if arg_243_1.var_.characterEffect1019ui_story then
					arg_243_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 and arg_243_1.var_.characterEffect1019ui_story then
				arg_243_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_246_4 = arg_243_1.actors_["1084ui_story"]
			local var_246_5 = 0

			if var_246_5 < arg_243_1.time_ and arg_243_1.time_ <= var_246_5 + arg_246_0 and arg_243_1.var_.characterEffect1084ui_story == nil then
				arg_243_1.var_.characterEffect1084ui_story = var_246_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_6 = 0.1

			if var_246_5 <= arg_243_1.time_ and arg_243_1.time_ < var_246_5 + var_246_6 then
				local var_246_7 = (arg_243_1.time_ - var_246_5) / var_246_6

				if arg_243_1.var_.characterEffect1084ui_story then
					local var_246_8 = Mathf.Lerp(0, 0.5, var_246_7)

					arg_243_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_243_1.var_.characterEffect1084ui_story.fillRatio = var_246_8
				end
			end

			if arg_243_1.time_ >= var_246_5 + var_246_6 and arg_243_1.time_ < var_246_5 + var_246_6 + arg_246_0 and arg_243_1.var_.characterEffect1084ui_story then
				local var_246_9 = 0.5

				arg_243_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_243_1.var_.characterEffect1084ui_story.fillRatio = var_246_9
			end

			local var_246_10 = 0
			local var_246_11 = 0.075

			if var_246_10 < arg_243_1.time_ and arg_243_1.time_ <= var_246_10 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_12 = arg_243_1:FormatText(StoryNameCfg[7].name)

				arg_243_1.leftNameTxt_.text = var_246_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_13 = arg_243_1:GetWordFromCfg(105121059)
				local var_246_14 = arg_243_1:FormatText(var_246_13.content)

				arg_243_1.text_.text = var_246_14

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_15 = 3
				local var_246_16 = utf8.len(var_246_14)
				local var_246_17 = var_246_15 <= 0 and var_246_11 or var_246_11 * (var_246_16 / var_246_15)

				if var_246_17 > 0 and var_246_11 < var_246_17 then
					arg_243_1.talkMaxDuration = var_246_17

					if var_246_17 + var_246_10 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_17 + var_246_10
					end
				end

				arg_243_1.text_.text = var_246_14
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)
				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_18 = math.max(var_246_11, arg_243_1.talkMaxDuration)

			if var_246_10 <= arg_243_1.time_ and arg_243_1.time_ < var_246_10 + var_246_18 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_10) / var_246_18

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_10 + var_246_18 and arg_243_1.time_ < var_246_10 + var_246_18 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play105121060 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 105121060
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play105121061(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = 0
			local var_250_1 = 0.25

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

				local var_250_3 = arg_247_1:GetWordFromCfg(105121060)
				local var_250_4 = arg_247_1:FormatText(var_250_3.content)

				arg_247_1.text_.text = var_250_4

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_5 = 10
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
	Play105121061 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 105121061
		arg_251_1.duration_ = 1.766

		local var_251_0 = {
			ja = 0.933,
			ko = 1.766,
			zh = 0.9,
			en = 0.933
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
				arg_251_0:Play105121062(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1.mask_.enabled = true
				arg_251_1.mask_.raycastTarget = true

				arg_251_1:SetGaussion(false)
			end

			local var_254_1 = 0.5

			if var_254_0 <= arg_251_1.time_ and arg_251_1.time_ < var_254_0 + var_254_1 then
				local var_254_2 = (arg_251_1.time_ - var_254_0) / var_254_1
				local var_254_3 = Color.New(1, 1, 1)

				var_254_3.a = Mathf.Lerp(1, 0, var_254_2)
				arg_251_1.mask_.color = var_254_3
			end

			if arg_251_1.time_ >= var_254_0 + var_254_1 and arg_251_1.time_ < var_254_0 + var_254_1 + arg_254_0 then
				local var_254_4 = Color.New(1, 1, 1)
				local var_254_5 = 0

				arg_251_1.mask_.enabled = false
				var_254_4.a = var_254_5
				arg_251_1.mask_.color = var_254_4
			end

			local var_254_6 = manager.ui.mainCamera.transform
			local var_254_7 = 0

			if var_254_7 < arg_251_1.time_ and arg_251_1.time_ <= var_254_7 + arg_254_0 then
				arg_251_1.var_.shakeOldPosMainCamera = var_254_6.localPosition
			end

			local var_254_8 = 0.600000023841858

			if var_254_7 <= arg_251_1.time_ and arg_251_1.time_ < var_254_7 + var_254_8 then
				local var_254_9 = (arg_251_1.time_ - var_254_7) / 0.066
				local var_254_10, var_254_11 = math.modf(var_254_9)

				var_254_6.localPosition = Vector3.New(var_254_11 * 0.13, var_254_11 * 0.13, var_254_11 * 0.13) + arg_251_1.var_.shakeOldPosMainCamera
			end

			if arg_251_1.time_ >= var_254_7 + var_254_8 and arg_251_1.time_ < var_254_7 + var_254_8 + arg_254_0 then
				var_254_6.localPosition = arg_251_1.var_.shakeOldPosMainCamera
			end

			local var_254_12 = 0
			local var_254_13 = 0.075

			if var_254_12 < arg_251_1.time_ and arg_251_1.time_ <= var_254_12 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_14 = arg_251_1:FormatText(StoryNameCfg[5].name)

				arg_251_1.leftNameTxt_.text = var_254_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, true)
				arg_251_1.iconController_:SetSelectedState("hero")

				arg_251_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1036")

				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_15 = arg_251_1:GetWordFromCfg(105121061)
				local var_254_16 = arg_251_1:FormatText(var_254_15.content)

				arg_251_1.text_.text = var_254_16

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_17 = 3
				local var_254_18 = utf8.len(var_254_16)
				local var_254_19 = var_254_17 <= 0 and var_254_13 or var_254_13 * (var_254_18 / var_254_17)

				if var_254_19 > 0 and var_254_13 < var_254_19 then
					arg_251_1.talkMaxDuration = var_254_19

					if var_254_19 + var_254_12 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_19 + var_254_12
					end
				end

				arg_251_1.text_.text = var_254_16
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121061", "story_v_out_105121.awb") ~= 0 then
					local var_254_20 = manager.audio:GetVoiceLength("story_v_out_105121", "105121061", "story_v_out_105121.awb") / 1000

					if var_254_20 + var_254_12 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_20 + var_254_12
					end

					if var_254_15.prefab_name ~= "" and arg_251_1.actors_[var_254_15.prefab_name] ~= nil then
						local var_254_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_15.prefab_name].transform, "story_v_out_105121", "105121061", "story_v_out_105121.awb")

						arg_251_1:RecordAudio("105121061", var_254_21)
						arg_251_1:RecordAudio("105121061", var_254_21)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_105121", "105121061", "story_v_out_105121.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_105121", "105121061", "story_v_out_105121.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_22 = math.max(var_254_13, arg_251_1.talkMaxDuration)

			if var_254_12 <= arg_251_1.time_ and arg_251_1.time_ < var_254_12 + var_254_22 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_12) / var_254_22

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_12 + var_254_22 and arg_251_1.time_ < var_254_12 + var_254_22 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play105121062 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 105121062
		arg_255_1.duration_ = 5

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play105121063(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["10001_tpose"].transform
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 then
				arg_255_1.var_.moveOldPos10001_tpose = var_258_0.localPosition
			end

			local var_258_2 = 0.001

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2
				local var_258_4 = Vector3.New(0, 100, 0)

				var_258_0.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos10001_tpose, var_258_4, var_258_3)

				local var_258_5 = manager.ui.mainCamera.transform.position - var_258_0.position

				var_258_0.forward = Vector3.New(var_258_5.x, var_258_5.y, var_258_5.z)

				local var_258_6 = var_258_0.localEulerAngles

				var_258_6.z = 0
				var_258_6.x = 0
				var_258_0.localEulerAngles = var_258_6
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 then
				var_258_0.localPosition = Vector3.New(0, 100, 0)

				local var_258_7 = manager.ui.mainCamera.transform.position - var_258_0.position

				var_258_0.forward = Vector3.New(var_258_7.x, var_258_7.y, var_258_7.z)

				local var_258_8 = var_258_0.localEulerAngles

				var_258_8.z = 0
				var_258_8.x = 0
				var_258_0.localEulerAngles = var_258_8
			end

			local var_258_9 = 0
			local var_258_10 = 1.55

			if var_258_9 < arg_255_1.time_ and arg_255_1.time_ <= var_258_9 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, false)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_11 = arg_255_1:GetWordFromCfg(105121062)
				local var_258_12 = arg_255_1:FormatText(var_258_11.content)

				arg_255_1.text_.text = var_258_12

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_13 = 62
				local var_258_14 = utf8.len(var_258_12)
				local var_258_15 = var_258_13 <= 0 and var_258_10 or var_258_10 * (var_258_14 / var_258_13)

				if var_258_15 > 0 and var_258_10 < var_258_15 then
					arg_255_1.talkMaxDuration = var_258_15

					if var_258_15 + var_258_9 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_15 + var_258_9
					end
				end

				arg_255_1.text_.text = var_258_12
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)
				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_16 = math.max(var_258_10, arg_255_1.talkMaxDuration)

			if var_258_9 <= arg_255_1.time_ and arg_255_1.time_ < var_258_9 + var_258_16 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_9) / var_258_16

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_9 + var_258_16 and arg_255_1.time_ < var_258_9 + var_258_16 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play105121063 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 105121063
		arg_259_1.duration_ = 2.566

		local var_259_0 = {
			ja = 1.233,
			ko = 2.4,
			zh = 2.566,
			en = 1.5
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
				arg_259_0:Play105121064(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1019ui_story"]
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 and arg_259_1.var_.characterEffect1019ui_story == nil then
				arg_259_1.var_.characterEffect1019ui_story = var_262_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_2 = 0.1

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2

				if arg_259_1.var_.characterEffect1019ui_story then
					local var_262_4 = Mathf.Lerp(0, 0.5, var_262_3)

					arg_259_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_259_1.var_.characterEffect1019ui_story.fillRatio = var_262_4
				end
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 and arg_259_1.var_.characterEffect1019ui_story then
				local var_262_5 = 0.5

				arg_259_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_259_1.var_.characterEffect1019ui_story.fillRatio = var_262_5
			end

			local var_262_6 = 0
			local var_262_7 = 0.225

			if var_262_6 < arg_259_1.time_ and arg_259_1.time_ <= var_262_6 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_8 = arg_259_1:FormatText(StoryNameCfg[5].name)

				arg_259_1.leftNameTxt_.text = var_262_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, true)
				arg_259_1.iconController_:SetSelectedState("hero")

				arg_259_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1036")

				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_9 = arg_259_1:GetWordFromCfg(105121063)
				local var_262_10 = arg_259_1:FormatText(var_262_9.content)

				arg_259_1.text_.text = var_262_10

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_11 = 9
				local var_262_12 = utf8.len(var_262_10)
				local var_262_13 = var_262_11 <= 0 and var_262_7 or var_262_7 * (var_262_12 / var_262_11)

				if var_262_13 > 0 and var_262_7 < var_262_13 then
					arg_259_1.talkMaxDuration = var_262_13

					if var_262_13 + var_262_6 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_13 + var_262_6
					end
				end

				arg_259_1.text_.text = var_262_10
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121063", "story_v_out_105121.awb") ~= 0 then
					local var_262_14 = manager.audio:GetVoiceLength("story_v_out_105121", "105121063", "story_v_out_105121.awb") / 1000

					if var_262_14 + var_262_6 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_14 + var_262_6
					end

					if var_262_9.prefab_name ~= "" and arg_259_1.actors_[var_262_9.prefab_name] ~= nil then
						local var_262_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_9.prefab_name].transform, "story_v_out_105121", "105121063", "story_v_out_105121.awb")

						arg_259_1:RecordAudio("105121063", var_262_15)
						arg_259_1:RecordAudio("105121063", var_262_15)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_105121", "105121063", "story_v_out_105121.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_105121", "105121063", "story_v_out_105121.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_16 = math.max(var_262_7, arg_259_1.talkMaxDuration)

			if var_262_6 <= arg_259_1.time_ and arg_259_1.time_ < var_262_6 + var_262_16 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_6) / var_262_16

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_6 + var_262_16 and arg_259_1.time_ < var_262_6 + var_262_16 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play105121064 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 105121064
		arg_263_1.duration_ = 3.666

		local var_263_0 = {
			ja = 3.466,
			ko = 3.233,
			zh = 3.666,
			en = 3.266
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
				arg_263_0:Play105121065(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = "S0504"

			if arg_263_1.bgs_[var_266_0] == nil then
				local var_266_1 = Object.Instantiate(arg_263_1.paintGo_)

				var_266_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_266_0)
				var_266_1.name = var_266_0
				var_266_1.transform.parent = arg_263_1.stage_.transform
				var_266_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_263_1.bgs_[var_266_0] = var_266_1
			end

			local var_266_2 = 1.5

			if var_266_2 < arg_263_1.time_ and arg_263_1.time_ <= var_266_2 + arg_266_0 then
				local var_266_3 = manager.ui.mainCamera.transform.localPosition
				local var_266_4 = Vector3.New(0, 0, 10) + Vector3.New(var_266_3.x, var_266_3.y, 0)
				local var_266_5 = arg_263_1.bgs_.S0504

				var_266_5.transform.localPosition = var_266_4
				var_266_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_266_6 = var_266_5:GetComponent("SpriteRenderer")

				if var_266_6 and var_266_6.sprite then
					local var_266_7 = (var_266_5.transform.localPosition - var_266_3).z
					local var_266_8 = manager.ui.mainCameraCom_
					local var_266_9 = 2 * var_266_7 * Mathf.Tan(var_266_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_266_10 = var_266_9 * var_266_8.aspect
					local var_266_11 = var_266_6.sprite.bounds.size.x
					local var_266_12 = var_266_6.sprite.bounds.size.y
					local var_266_13 = var_266_10 / var_266_11
					local var_266_14 = var_266_9 / var_266_12
					local var_266_15 = var_266_14 < var_266_13 and var_266_13 or var_266_14

					var_266_5.transform.localScale = Vector3.New(var_266_15, var_266_15, 0)
				end

				for iter_266_0, iter_266_1 in pairs(arg_263_1.bgs_) do
					if iter_266_0 ~= "S0504" then
						iter_266_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_266_16 = arg_263_1.bgs_.B01a.transform
			local var_266_17 = 1.5

			if var_266_17 < arg_263_1.time_ and arg_263_1.time_ <= var_266_17 + arg_266_0 then
				arg_263_1.var_.moveOldPosB01a = var_266_16.localPosition
			end

			local var_266_18 = 0.001

			if var_266_17 <= arg_263_1.time_ and arg_263_1.time_ < var_266_17 + var_266_18 then
				local var_266_19 = (arg_263_1.time_ - var_266_17) / var_266_18
				local var_266_20 = Vector3.New(0, -100, 10)

				var_266_16.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPosB01a, var_266_20, var_266_19)
			end

			if arg_263_1.time_ >= var_266_17 + var_266_18 and arg_263_1.time_ < var_266_17 + var_266_18 + arg_266_0 then
				var_266_16.localPosition = Vector3.New(0, -100, 10)
			end

			local var_266_21 = arg_263_1.bgs_.B01a
			local var_266_22 = 0

			if var_266_22 < arg_263_1.time_ and arg_263_1.time_ <= var_266_22 + arg_266_0 then
				local var_266_23 = var_266_21:GetComponent("SpriteRenderer")

				if var_266_23 then
					var_266_23.material = arg_263_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_266_24 = var_266_23.material
					local var_266_25 = var_266_24:GetColor("_Color")

					arg_263_1.var_.alphaOldValueB01a = var_266_25.a
					arg_263_1.var_.alphaMatValueB01a = var_266_24
				end

				arg_263_1.var_.alphaOldValueB01a = 1
			end

			local var_266_26 = 1.5

			if var_266_22 <= arg_263_1.time_ and arg_263_1.time_ < var_266_22 + var_266_26 then
				local var_266_27 = (arg_263_1.time_ - var_266_22) / var_266_26
				local var_266_28 = Mathf.Lerp(arg_263_1.var_.alphaOldValueB01a, 0, var_266_27)

				if arg_263_1.var_.alphaMatValueB01a then
					local var_266_29 = arg_263_1.var_.alphaMatValueB01a
					local var_266_30 = var_266_29:GetColor("_Color")

					var_266_30.a = var_266_28

					var_266_29:SetColor("_Color", var_266_30)
				end
			end

			if arg_263_1.time_ >= var_266_22 + var_266_26 and arg_263_1.time_ < var_266_22 + var_266_26 + arg_266_0 and arg_263_1.var_.alphaMatValueB01a then
				local var_266_31 = arg_263_1.var_.alphaMatValueB01a
				local var_266_32 = var_266_31:GetColor("_Color")

				var_266_32.a = 0

				var_266_31:SetColor("_Color", var_266_32)
			end

			local var_266_33 = arg_263_1.bgs_.S0504
			local var_266_34 = 1.5

			if var_266_34 < arg_263_1.time_ and arg_263_1.time_ <= var_266_34 + arg_266_0 then
				local var_266_35 = var_266_33:GetComponent("SpriteRenderer")

				if var_266_35 then
					var_266_35.material = arg_263_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_266_36 = var_266_35.material
					local var_266_37 = var_266_36:GetColor("_Color")

					arg_263_1.var_.alphaOldValueS0504 = var_266_37.a
					arg_263_1.var_.alphaMatValueS0504 = var_266_36
				end

				arg_263_1.var_.alphaOldValueS0504 = 0
			end

			local var_266_38 = 1.5

			if var_266_34 <= arg_263_1.time_ and arg_263_1.time_ < var_266_34 + var_266_38 then
				local var_266_39 = (arg_263_1.time_ - var_266_34) / var_266_38
				local var_266_40 = Mathf.Lerp(arg_263_1.var_.alphaOldValueS0504, 1, var_266_39)

				if arg_263_1.var_.alphaMatValueS0504 then
					local var_266_41 = arg_263_1.var_.alphaMatValueS0504
					local var_266_42 = var_266_41:GetColor("_Color")

					var_266_42.a = var_266_40

					var_266_41:SetColor("_Color", var_266_42)
				end
			end

			if arg_263_1.time_ >= var_266_34 + var_266_38 and arg_263_1.time_ < var_266_34 + var_266_38 + arg_266_0 and arg_263_1.var_.alphaMatValueS0504 then
				local var_266_43 = arg_263_1.var_.alphaMatValueS0504
				local var_266_44 = var_266_43:GetColor("_Color")

				var_266_44.a = 1

				var_266_43:SetColor("_Color", var_266_44)
			end

			local var_266_45 = 0

			if var_266_45 < arg_263_1.time_ and arg_263_1.time_ <= var_266_45 + arg_266_0 then
				arg_263_1.allBtn_.enabled = false
			end

			local var_266_46 = 1.5

			if arg_263_1.time_ >= var_266_45 + var_266_46 and arg_263_1.time_ < var_266_45 + var_266_46 + arg_266_0 then
				arg_263_1.allBtn_.enabled = true
			end

			if arg_263_1.frameCnt_ <= 1 then
				arg_263_1.dialog_:SetActive(false)
			end

			local var_266_47 = 2
			local var_266_48 = 0.15

			if var_266_47 < arg_263_1.time_ and arg_263_1.time_ <= var_266_47 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0

				arg_263_1.dialog_:SetActive(true)

				local var_266_49 = LeanTween.value(arg_263_1.dialog_, 0, 1, 0.3)

				var_266_49:setOnUpdate(LuaHelper.FloatAction(function(arg_267_0)
					arg_263_1.dialogCg_.alpha = arg_267_0
				end))
				var_266_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_263_1.dialog_)
					var_266_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_263_1.duration_ = arg_263_1.duration_ + 0.3

				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_50 = arg_263_1:FormatText(StoryNameCfg[13].name)

				arg_263_1.leftNameTxt_.text = var_266_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, true)
				arg_263_1.iconController_:SetSelectedState("hero")

				arg_263_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_51 = arg_263_1:GetWordFromCfg(105121064)
				local var_266_52 = arg_263_1:FormatText(var_266_51.content)

				arg_263_1.text_.text = var_266_52

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_53 = 6
				local var_266_54 = utf8.len(var_266_52)
				local var_266_55 = var_266_53 <= 0 and var_266_48 or var_266_48 * (var_266_54 / var_266_53)

				if var_266_55 > 0 and var_266_48 < var_266_55 then
					arg_263_1.talkMaxDuration = var_266_55
					var_266_47 = var_266_47 + 0.3

					if var_266_55 + var_266_47 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_55 + var_266_47
					end
				end

				arg_263_1.text_.text = var_266_52
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121064", "story_v_out_105121.awb") ~= 0 then
					local var_266_56 = manager.audio:GetVoiceLength("story_v_out_105121", "105121064", "story_v_out_105121.awb") / 1000

					if var_266_56 + var_266_47 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_56 + var_266_47
					end

					if var_266_51.prefab_name ~= "" and arg_263_1.actors_[var_266_51.prefab_name] ~= nil then
						local var_266_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_51.prefab_name].transform, "story_v_out_105121", "105121064", "story_v_out_105121.awb")

						arg_263_1:RecordAudio("105121064", var_266_57)
						arg_263_1:RecordAudio("105121064", var_266_57)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_105121", "105121064", "story_v_out_105121.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_105121", "105121064", "story_v_out_105121.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_58 = var_266_47 + 0.3
			local var_266_59 = math.max(var_266_48, arg_263_1.talkMaxDuration)

			if var_266_58 <= arg_263_1.time_ and arg_263_1.time_ < var_266_58 + var_266_59 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_58) / var_266_59

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_58 + var_266_59 and arg_263_1.time_ < var_266_58 + var_266_59 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play105121065 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 105121065
		arg_269_1.duration_ = 1.9

		local var_269_0 = {
			ja = 1.5,
			ko = 1.9,
			zh = 1.433,
			en = 1.3
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
				arg_269_0:Play105121066(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = 0
			local var_272_1 = 0.175

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_2 = arg_269_1:FormatText(StoryNameCfg[15].name)

				arg_269_1.leftNameTxt_.text = var_272_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, true)
				arg_269_1.iconController_:SetSelectedState("hero")

				arg_269_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1037")

				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_3 = arg_269_1:GetWordFromCfg(105121065)
				local var_272_4 = arg_269_1:FormatText(var_272_3.content)

				arg_269_1.text_.text = var_272_4

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121065", "story_v_out_105121.awb") ~= 0 then
					local var_272_8 = manager.audio:GetVoiceLength("story_v_out_105121", "105121065", "story_v_out_105121.awb") / 1000

					if var_272_8 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_8 + var_272_0
					end

					if var_272_3.prefab_name ~= "" and arg_269_1.actors_[var_272_3.prefab_name] ~= nil then
						local var_272_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_3.prefab_name].transform, "story_v_out_105121", "105121065", "story_v_out_105121.awb")

						arg_269_1:RecordAudio("105121065", var_272_9)
						arg_269_1:RecordAudio("105121065", var_272_9)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_105121", "105121065", "story_v_out_105121.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_105121", "105121065", "story_v_out_105121.awb")
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
	Play105121066 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 105121066
		arg_273_1.duration_ = 2.433

		local var_273_0 = {
			ja = 1.533,
			ko = 1.333,
			zh = 1.233,
			en = 2.433
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
				arg_273_0:Play105121067(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = "1080ui_story"

			if arg_273_1.actors_[var_276_0] == nil then
				local var_276_1 = Object.Instantiate(Asset.Load("Char/" .. var_276_0), arg_273_1.stage_.transform)

				var_276_1.name = var_276_0
				var_276_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_273_1.actors_[var_276_0] = var_276_1

				local var_276_2 = var_276_1:GetComponentInChildren(typeof(CharacterEffect))

				var_276_2.enabled = true

				local var_276_3 = GameObjectTools.GetOrAddComponent(var_276_1, typeof(DynamicBoneHelper))

				if var_276_3 then
					var_276_3:EnableDynamicBone(false)
				end

				arg_273_1:ShowWeapon(var_276_2.transform, false)

				arg_273_1.var_[var_276_0 .. "Animator"] = var_276_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_273_1.var_[var_276_0 .. "Animator"].applyRootMotion = true
				arg_273_1.var_[var_276_0 .. "LipSync"] = var_276_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_276_4 = arg_273_1.actors_["1080ui_story"]
			local var_276_5 = 0

			if var_276_5 < arg_273_1.time_ and arg_273_1.time_ <= var_276_5 + arg_276_0 and arg_273_1.var_.characterEffect1080ui_story == nil then
				arg_273_1.var_.characterEffect1080ui_story = var_276_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_6 = 0.1

			if var_276_5 <= arg_273_1.time_ and arg_273_1.time_ < var_276_5 + var_276_6 then
				local var_276_7 = (arg_273_1.time_ - var_276_5) / var_276_6

				if arg_273_1.var_.characterEffect1080ui_story then
					arg_273_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_273_1.time_ >= var_276_5 + var_276_6 and arg_273_1.time_ < var_276_5 + var_276_6 + arg_276_0 and arg_273_1.var_.characterEffect1080ui_story then
				arg_273_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_276_8 = 0
			local var_276_9 = 0.25

			if var_276_8 < arg_273_1.time_ and arg_273_1.time_ <= var_276_8 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_10 = arg_273_1:FormatText(StoryNameCfg[55].name)

				arg_273_1.leftNameTxt_.text = var_276_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, true)
				arg_273_1.iconController_:SetSelectedState("hero")

				arg_273_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1080")

				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_11 = arg_273_1:GetWordFromCfg(105121066)
				local var_276_12 = arg_273_1:FormatText(var_276_11.content)

				arg_273_1.text_.text = var_276_12

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_13 = 6
				local var_276_14 = utf8.len(var_276_12)
				local var_276_15 = var_276_13 <= 0 and var_276_9 or var_276_9 * (var_276_14 / var_276_13)

				if var_276_15 > 0 and var_276_9 < var_276_15 then
					arg_273_1.talkMaxDuration = var_276_15

					if var_276_15 + var_276_8 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_15 + var_276_8
					end
				end

				arg_273_1.text_.text = var_276_12
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121066", "story_v_out_105121.awb") ~= 0 then
					local var_276_16 = manager.audio:GetVoiceLength("story_v_out_105121", "105121066", "story_v_out_105121.awb") / 1000

					if var_276_16 + var_276_8 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_16 + var_276_8
					end

					if var_276_11.prefab_name ~= "" and arg_273_1.actors_[var_276_11.prefab_name] ~= nil then
						local var_276_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_11.prefab_name].transform, "story_v_out_105121", "105121066", "story_v_out_105121.awb")

						arg_273_1:RecordAudio("105121066", var_276_17)
						arg_273_1:RecordAudio("105121066", var_276_17)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_105121", "105121066", "story_v_out_105121.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_105121", "105121066", "story_v_out_105121.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_18 = math.max(var_276_9, arg_273_1.talkMaxDuration)

			if var_276_8 <= arg_273_1.time_ and arg_273_1.time_ < var_276_8 + var_276_18 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_8) / var_276_18

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_8 + var_276_18 and arg_273_1.time_ < var_276_8 + var_276_18 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play105121067 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 105121067
		arg_277_1.duration_ = 4.833

		local var_277_0 = {
			ja = 2.8,
			ko = 4.233,
			zh = 4.566,
			en = 4.833
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
				arg_277_0:Play105121068(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0
			local var_280_1 = 0.475

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_2 = arg_277_1:FormatText(StoryNameCfg[45].name)

				arg_277_1.leftNameTxt_.text = var_280_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, true)
				arg_277_1.iconController_:SetSelectedState("hero")

				arg_277_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_Noviher")

				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_3 = arg_277_1:GetWordFromCfg(105121067)
				local var_280_4 = arg_277_1:FormatText(var_280_3.content)

				arg_277_1.text_.text = var_280_4

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_5 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121067", "story_v_out_105121.awb") ~= 0 then
					local var_280_8 = manager.audio:GetVoiceLength("story_v_out_105121", "105121067", "story_v_out_105121.awb") / 1000

					if var_280_8 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_8 + var_280_0
					end

					if var_280_3.prefab_name ~= "" and arg_277_1.actors_[var_280_3.prefab_name] ~= nil then
						local var_280_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_3.prefab_name].transform, "story_v_out_105121", "105121067", "story_v_out_105121.awb")

						arg_277_1:RecordAudio("105121067", var_280_9)
						arg_277_1:RecordAudio("105121067", var_280_9)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_105121", "105121067", "story_v_out_105121.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_105121", "105121067", "story_v_out_105121.awb")
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
	Play105121068 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 105121068
		arg_281_1.duration_ = 5

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play105121069(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["1080ui_story"]
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 and arg_281_1.var_.characterEffect1080ui_story == nil then
				arg_281_1.var_.characterEffect1080ui_story = var_284_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_2 = 0.1

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2

				if arg_281_1.var_.characterEffect1080ui_story then
					local var_284_4 = Mathf.Lerp(0, 0.5, var_284_3)

					arg_281_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_281_1.var_.characterEffect1080ui_story.fillRatio = var_284_4
				end
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 and arg_281_1.var_.characterEffect1080ui_story then
				local var_284_5 = 0.5

				arg_281_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_281_1.var_.characterEffect1080ui_story.fillRatio = var_284_5
			end

			local var_284_6 = 0
			local var_284_7 = 0.2

			if var_284_6 < arg_281_1.time_ and arg_281_1.time_ <= var_284_6 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_8 = arg_281_1:FormatText(StoryNameCfg[7].name)

				arg_281_1.leftNameTxt_.text = var_284_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_9 = arg_281_1:GetWordFromCfg(105121068)
				local var_284_10 = arg_281_1:FormatText(var_284_9.content)

				arg_281_1.text_.text = var_284_10

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_11 = 8
				local var_284_12 = utf8.len(var_284_10)
				local var_284_13 = var_284_11 <= 0 and var_284_7 or var_284_7 * (var_284_12 / var_284_11)

				if var_284_13 > 0 and var_284_7 < var_284_13 then
					arg_281_1.talkMaxDuration = var_284_13

					if var_284_13 + var_284_6 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_13 + var_284_6
					end
				end

				arg_281_1.text_.text = var_284_10
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)
				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_14 = math.max(var_284_7, arg_281_1.talkMaxDuration)

			if var_284_6 <= arg_281_1.time_ and arg_281_1.time_ < var_284_6 + var_284_14 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_6) / var_284_14

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_6 + var_284_14 and arg_281_1.time_ < var_284_6 + var_284_14 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play105121069 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 105121069
		arg_285_1.duration_ = 7.833

		local var_285_0 = {
			ja = 5.6,
			ko = 7.833,
			zh = 6.2,
			en = 7.366
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
				arg_285_0:Play105121070(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 0.575

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[72].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, true)
				arg_285_1.iconController_:SetSelectedState("hero")

				arg_285_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_Jolin")

				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(105121069)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121069", "story_v_out_105121.awb") ~= 0 then
					local var_288_8 = manager.audio:GetVoiceLength("story_v_out_105121", "105121069", "story_v_out_105121.awb") / 1000

					if var_288_8 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_0
					end

					if var_288_3.prefab_name ~= "" and arg_285_1.actors_[var_288_3.prefab_name] ~= nil then
						local var_288_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_3.prefab_name].transform, "story_v_out_105121", "105121069", "story_v_out_105121.awb")

						arg_285_1:RecordAudio("105121069", var_288_9)
						arg_285_1:RecordAudio("105121069", var_288_9)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_105121", "105121069", "story_v_out_105121.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_105121", "105121069", "story_v_out_105121.awb")
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
	Play105121070 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 105121070
		arg_289_1.duration_ = 3.833

		local var_289_0 = {
			ja = 3.833,
			ko = 1.833,
			zh = 1.866,
			en = 1.666
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
				arg_289_0:Play105121071(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 0.15

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_2 = arg_289_1:FormatText(StoryNameCfg[6].name)

				arg_289_1.leftNameTxt_.text = var_292_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, true)
				arg_289_1.iconController_:SetSelectedState("hero")

				arg_289_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_3 = arg_289_1:GetWordFromCfg(105121070)
				local var_292_4 = arg_289_1:FormatText(var_292_3.content)

				arg_289_1.text_.text = var_292_4

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121070", "story_v_out_105121.awb") ~= 0 then
					local var_292_8 = manager.audio:GetVoiceLength("story_v_out_105121", "105121070", "story_v_out_105121.awb") / 1000

					if var_292_8 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_8 + var_292_0
					end

					if var_292_3.prefab_name ~= "" and arg_289_1.actors_[var_292_3.prefab_name] ~= nil then
						local var_292_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_3.prefab_name].transform, "story_v_out_105121", "105121070", "story_v_out_105121.awb")

						arg_289_1:RecordAudio("105121070", var_292_9)
						arg_289_1:RecordAudio("105121070", var_292_9)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_105121", "105121070", "story_v_out_105121.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_105121", "105121070", "story_v_out_105121.awb")
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
	Play105121071 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 105121071
		arg_293_1.duration_ = 5

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play105121072(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["10001_tpose"]
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 and arg_293_1.var_.characterEffect10001_tpose == nil then
				arg_293_1.var_.characterEffect10001_tpose = var_296_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_2 = 0.1

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_2 then
				local var_296_3 = (arg_293_1.time_ - var_296_1) / var_296_2

				if arg_293_1.var_.characterEffect10001_tpose then
					local var_296_4 = Mathf.Lerp(0, 0.5, var_296_3)

					arg_293_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_293_1.var_.characterEffect10001_tpose.fillRatio = var_296_4
				end
			end

			if arg_293_1.time_ >= var_296_1 + var_296_2 and arg_293_1.time_ < var_296_1 + var_296_2 + arg_296_0 and arg_293_1.var_.characterEffect10001_tpose then
				local var_296_5 = 0.5

				arg_293_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_293_1.var_.characterEffect10001_tpose.fillRatio = var_296_5
			end

			local var_296_6 = 0
			local var_296_7 = 1.25

			if var_296_6 < arg_293_1.time_ and arg_293_1.time_ <= var_296_6 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, false)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_8 = arg_293_1:GetWordFromCfg(105121071)
				local var_296_9 = arg_293_1:FormatText(var_296_8.content)

				arg_293_1.text_.text = var_296_9

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_10 = 50
				local var_296_11 = utf8.len(var_296_9)
				local var_296_12 = var_296_10 <= 0 and var_296_7 or var_296_7 * (var_296_11 / var_296_10)

				if var_296_12 > 0 and var_296_7 < var_296_12 then
					arg_293_1.talkMaxDuration = var_296_12

					if var_296_12 + var_296_6 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_12 + var_296_6
					end
				end

				arg_293_1.text_.text = var_296_9
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)
				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_13 = math.max(var_296_7, arg_293_1.talkMaxDuration)

			if var_296_6 <= arg_293_1.time_ and arg_293_1.time_ < var_296_6 + var_296_13 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_6) / var_296_13

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_6 + var_296_13 and arg_293_1.time_ < var_296_6 + var_296_13 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play105121072 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 105121072
		arg_297_1.duration_ = 7

		local var_297_0 = {
			ja = 5.8,
			ko = 3.5,
			zh = 7,
			en = 5.5
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
				arg_297_0:Play105121073(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = arg_297_1.actors_["10001_tpose"]
			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 and arg_297_1.var_.characterEffect10001_tpose == nil then
				arg_297_1.var_.characterEffect10001_tpose = var_300_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_300_2 = 0.1

			if var_300_1 <= arg_297_1.time_ and arg_297_1.time_ < var_300_1 + var_300_2 then
				local var_300_3 = (arg_297_1.time_ - var_300_1) / var_300_2

				if arg_297_1.var_.characterEffect10001_tpose then
					arg_297_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_297_1.time_ >= var_300_1 + var_300_2 and arg_297_1.time_ < var_300_1 + var_300_2 + arg_300_0 and arg_297_1.var_.characterEffect10001_tpose then
				arg_297_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_300_4 = arg_297_1.actors_["1084ui_story"]
			local var_300_5 = 0

			if var_300_5 < arg_297_1.time_ and arg_297_1.time_ <= var_300_5 + arg_300_0 and arg_297_1.var_.characterEffect1084ui_story == nil then
				arg_297_1.var_.characterEffect1084ui_story = var_300_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_300_6 = 0.1

			if var_300_5 <= arg_297_1.time_ and arg_297_1.time_ < var_300_5 + var_300_6 then
				local var_300_7 = (arg_297_1.time_ - var_300_5) / var_300_6

				if arg_297_1.var_.characterEffect1084ui_story then
					local var_300_8 = Mathf.Lerp(0, 0.5, var_300_7)

					arg_297_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_297_1.var_.characterEffect1084ui_story.fillRatio = var_300_8
				end
			end

			if arg_297_1.time_ >= var_300_5 + var_300_6 and arg_297_1.time_ < var_300_5 + var_300_6 + arg_300_0 and arg_297_1.var_.characterEffect1084ui_story then
				local var_300_9 = 0.5

				arg_297_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_297_1.var_.characterEffect1084ui_story.fillRatio = var_300_9
			end

			local var_300_10 = 0
			local var_300_11 = 0.375

			if var_300_10 < arg_297_1.time_ and arg_297_1.time_ <= var_300_10 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_12 = arg_297_1:FormatText(StoryNameCfg[45].name)

				arg_297_1.leftNameTxt_.text = var_300_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, true)
				arg_297_1.iconController_:SetSelectedState("hero")

				arg_297_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_Noviher")

				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_13 = arg_297_1:GetWordFromCfg(105121072)
				local var_300_14 = arg_297_1:FormatText(var_300_13.content)

				arg_297_1.text_.text = var_300_14

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_15 = 15
				local var_300_16 = utf8.len(var_300_14)
				local var_300_17 = var_300_15 <= 0 and var_300_11 or var_300_11 * (var_300_16 / var_300_15)

				if var_300_17 > 0 and var_300_11 < var_300_17 then
					arg_297_1.talkMaxDuration = var_300_17

					if var_300_17 + var_300_10 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_17 + var_300_10
					end
				end

				arg_297_1.text_.text = var_300_14
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121072", "story_v_out_105121.awb") ~= 0 then
					local var_300_18 = manager.audio:GetVoiceLength("story_v_out_105121", "105121072", "story_v_out_105121.awb") / 1000

					if var_300_18 + var_300_10 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_18 + var_300_10
					end

					if var_300_13.prefab_name ~= "" and arg_297_1.actors_[var_300_13.prefab_name] ~= nil then
						local var_300_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_13.prefab_name].transform, "story_v_out_105121", "105121072", "story_v_out_105121.awb")

						arg_297_1:RecordAudio("105121072", var_300_19)
						arg_297_1:RecordAudio("105121072", var_300_19)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_105121", "105121072", "story_v_out_105121.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_105121", "105121072", "story_v_out_105121.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_20 = math.max(var_300_11, arg_297_1.talkMaxDuration)

			if var_300_10 <= arg_297_1.time_ and arg_297_1.time_ < var_300_10 + var_300_20 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_10) / var_300_20

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_10 + var_300_20 and arg_297_1.time_ < var_300_10 + var_300_20 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play105121073 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 105121073
		arg_301_1.duration_ = 9.966

		local var_301_0 = {
			ja = 9.966,
			ko = 4.766,
			zh = 5.366,
			en = 3.8
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
				arg_301_0:Play105121074(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0
			local var_304_1 = 0.525

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_2 = arg_301_1:FormatText(StoryNameCfg[45].name)

				arg_301_1.leftNameTxt_.text = var_304_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, true)
				arg_301_1.iconController_:SetSelectedState("hero")

				arg_301_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_Noviher")

				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_3 = arg_301_1:GetWordFromCfg(105121073)
				local var_304_4 = arg_301_1:FormatText(var_304_3.content)

				arg_301_1.text_.text = var_304_4

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121073", "story_v_out_105121.awb") ~= 0 then
					local var_304_8 = manager.audio:GetVoiceLength("story_v_out_105121", "105121073", "story_v_out_105121.awb") / 1000

					if var_304_8 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_8 + var_304_0
					end

					if var_304_3.prefab_name ~= "" and arg_301_1.actors_[var_304_3.prefab_name] ~= nil then
						local var_304_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_3.prefab_name].transform, "story_v_out_105121", "105121073", "story_v_out_105121.awb")

						arg_301_1:RecordAudio("105121073", var_304_9)
						arg_301_1:RecordAudio("105121073", var_304_9)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_105121", "105121073", "story_v_out_105121.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_105121", "105121073", "story_v_out_105121.awb")
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
	Play105121074 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 105121074
		arg_305_1.duration_ = 10.4

		local var_305_0 = {
			ja = 5.2,
			ko = 5.433,
			zh = 8.466,
			en = 10.4
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
				arg_305_0:Play105121075(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0
			local var_308_1 = 0.775

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_2 = arg_305_1:FormatText(StoryNameCfg[45].name)

				arg_305_1.leftNameTxt_.text = var_308_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, true)
				arg_305_1.iconController_:SetSelectedState("hero")

				arg_305_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_Noviher")

				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_3 = arg_305_1:GetWordFromCfg(105121074)
				local var_308_4 = arg_305_1:FormatText(var_308_3.content)

				arg_305_1.text_.text = var_308_4

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_5 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121074", "story_v_out_105121.awb") ~= 0 then
					local var_308_8 = manager.audio:GetVoiceLength("story_v_out_105121", "105121074", "story_v_out_105121.awb") / 1000

					if var_308_8 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_8 + var_308_0
					end

					if var_308_3.prefab_name ~= "" and arg_305_1.actors_[var_308_3.prefab_name] ~= nil then
						local var_308_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_3.prefab_name].transform, "story_v_out_105121", "105121074", "story_v_out_105121.awb")

						arg_305_1:RecordAudio("105121074", var_308_9)
						arg_305_1:RecordAudio("105121074", var_308_9)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_105121", "105121074", "story_v_out_105121.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_105121", "105121074", "story_v_out_105121.awb")
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
	Play105121075 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 105121075
		arg_309_1.duration_ = 6.2

		local var_309_0 = {
			ja = 6.2,
			ko = 5.666,
			zh = 4.866,
			en = 3.7
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
				arg_309_0:Play105121076(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1037ui_story"]
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 and arg_309_1.var_.characterEffect1037ui_story == nil then
				arg_309_1.var_.characterEffect1037ui_story = var_312_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_2 = 0.1

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2

				if arg_309_1.var_.characterEffect1037ui_story then
					arg_309_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 and arg_309_1.var_.characterEffect1037ui_story then
				arg_309_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_312_4 = arg_309_1.actors_["10001_tpose"]
			local var_312_5 = 0

			if var_312_5 < arg_309_1.time_ and arg_309_1.time_ <= var_312_5 + arg_312_0 and arg_309_1.var_.characterEffect10001_tpose == nil then
				arg_309_1.var_.characterEffect10001_tpose = var_312_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_6 = 0.1

			if var_312_5 <= arg_309_1.time_ and arg_309_1.time_ < var_312_5 + var_312_6 then
				local var_312_7 = (arg_309_1.time_ - var_312_5) / var_312_6

				if arg_309_1.var_.characterEffect10001_tpose then
					local var_312_8 = Mathf.Lerp(0, 0.5, var_312_7)

					arg_309_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_309_1.var_.characterEffect10001_tpose.fillRatio = var_312_8
				end
			end

			if arg_309_1.time_ >= var_312_5 + var_312_6 and arg_309_1.time_ < var_312_5 + var_312_6 + arg_312_0 and arg_309_1.var_.characterEffect10001_tpose then
				local var_312_9 = 0.5

				arg_309_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_309_1.var_.characterEffect10001_tpose.fillRatio = var_312_9
			end

			local var_312_10 = 0
			local var_312_11 = 0.425

			if var_312_10 < arg_309_1.time_ and arg_309_1.time_ <= var_312_10 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_12 = arg_309_1:FormatText(StoryNameCfg[15].name)

				arg_309_1.leftNameTxt_.text = var_312_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, true)
				arg_309_1.iconController_:SetSelectedState("hero")

				arg_309_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1037")

				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_13 = arg_309_1:GetWordFromCfg(105121075)
				local var_312_14 = arg_309_1:FormatText(var_312_13.content)

				arg_309_1.text_.text = var_312_14

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_15 = 17
				local var_312_16 = utf8.len(var_312_14)
				local var_312_17 = var_312_15 <= 0 and var_312_11 or var_312_11 * (var_312_16 / var_312_15)

				if var_312_17 > 0 and var_312_11 < var_312_17 then
					arg_309_1.talkMaxDuration = var_312_17

					if var_312_17 + var_312_10 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_17 + var_312_10
					end
				end

				arg_309_1.text_.text = var_312_14
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121075", "story_v_out_105121.awb") ~= 0 then
					local var_312_18 = manager.audio:GetVoiceLength("story_v_out_105121", "105121075", "story_v_out_105121.awb") / 1000

					if var_312_18 + var_312_10 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_18 + var_312_10
					end

					if var_312_13.prefab_name ~= "" and arg_309_1.actors_[var_312_13.prefab_name] ~= nil then
						local var_312_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_13.prefab_name].transform, "story_v_out_105121", "105121075", "story_v_out_105121.awb")

						arg_309_1:RecordAudio("105121075", var_312_19)
						arg_309_1:RecordAudio("105121075", var_312_19)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_105121", "105121075", "story_v_out_105121.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_105121", "105121075", "story_v_out_105121.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_20 = math.max(var_312_11, arg_309_1.talkMaxDuration)

			if var_312_10 <= arg_309_1.time_ and arg_309_1.time_ < var_312_10 + var_312_20 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_10) / var_312_20

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_10 + var_312_20 and arg_309_1.time_ < var_312_10 + var_312_20 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play105121076 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 105121076
		arg_313_1.duration_ = 4.866

		local var_313_0 = {
			ja = 3.6,
			ko = 3.266,
			zh = 4.866,
			en = 4.366
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
				arg_313_0:Play105121077(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["1036ui_story"]
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 and arg_313_1.var_.characterEffect1036ui_story == nil then
				arg_313_1.var_.characterEffect1036ui_story = var_316_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_2 = 0.1

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2

				if arg_313_1.var_.characterEffect1036ui_story then
					arg_313_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 and arg_313_1.var_.characterEffect1036ui_story then
				arg_313_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_316_4 = arg_313_1.actors_["1037ui_story"]
			local var_316_5 = 0

			if var_316_5 < arg_313_1.time_ and arg_313_1.time_ <= var_316_5 + arg_316_0 and arg_313_1.var_.characterEffect1037ui_story == nil then
				arg_313_1.var_.characterEffect1037ui_story = var_316_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_6 = 0.1

			if var_316_5 <= arg_313_1.time_ and arg_313_1.time_ < var_316_5 + var_316_6 then
				local var_316_7 = (arg_313_1.time_ - var_316_5) / var_316_6

				if arg_313_1.var_.characterEffect1037ui_story then
					local var_316_8 = Mathf.Lerp(0, 0.5, var_316_7)

					arg_313_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_313_1.var_.characterEffect1037ui_story.fillRatio = var_316_8
				end
			end

			if arg_313_1.time_ >= var_316_5 + var_316_6 and arg_313_1.time_ < var_316_5 + var_316_6 + arg_316_0 and arg_313_1.var_.characterEffect1037ui_story then
				local var_316_9 = 0.5

				arg_313_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_313_1.var_.characterEffect1037ui_story.fillRatio = var_316_9
			end

			local var_316_10 = 0
			local var_316_11 = 0.25

			if var_316_10 < arg_313_1.time_ and arg_313_1.time_ <= var_316_10 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_12 = arg_313_1:FormatText(StoryNameCfg[5].name)

				arg_313_1.leftNameTxt_.text = var_316_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, true)
				arg_313_1.iconController_:SetSelectedState("hero")

				arg_313_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1036")

				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_13 = arg_313_1:GetWordFromCfg(105121076)
				local var_316_14 = arg_313_1:FormatText(var_316_13.content)

				arg_313_1.text_.text = var_316_14

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_15 = 10
				local var_316_16 = utf8.len(var_316_14)
				local var_316_17 = var_316_15 <= 0 and var_316_11 or var_316_11 * (var_316_16 / var_316_15)

				if var_316_17 > 0 and var_316_11 < var_316_17 then
					arg_313_1.talkMaxDuration = var_316_17

					if var_316_17 + var_316_10 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_17 + var_316_10
					end
				end

				arg_313_1.text_.text = var_316_14
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121076", "story_v_out_105121.awb") ~= 0 then
					local var_316_18 = manager.audio:GetVoiceLength("story_v_out_105121", "105121076", "story_v_out_105121.awb") / 1000

					if var_316_18 + var_316_10 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_18 + var_316_10
					end

					if var_316_13.prefab_name ~= "" and arg_313_1.actors_[var_316_13.prefab_name] ~= nil then
						local var_316_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_13.prefab_name].transform, "story_v_out_105121", "105121076", "story_v_out_105121.awb")

						arg_313_1:RecordAudio("105121076", var_316_19)
						arg_313_1:RecordAudio("105121076", var_316_19)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_105121", "105121076", "story_v_out_105121.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_105121", "105121076", "story_v_out_105121.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_20 = math.max(var_316_11, arg_313_1.talkMaxDuration)

			if var_316_10 <= arg_313_1.time_ and arg_313_1.time_ < var_316_10 + var_316_20 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_10) / var_316_20

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_10 + var_316_20 and arg_313_1.time_ < var_316_10 + var_316_20 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play105121077 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 105121077
		arg_317_1.duration_ = 6.266

		local var_317_0 = {
			ja = 4.866,
			ko = 5.233,
			zh = 5.7,
			en = 6.266
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
				arg_317_0:Play105121078(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["1019ui_story"]
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 and arg_317_1.var_.characterEffect1019ui_story == nil then
				arg_317_1.var_.characterEffect1019ui_story = var_320_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_2 = 0.1

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2

				if arg_317_1.var_.characterEffect1019ui_story then
					arg_317_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 and arg_317_1.var_.characterEffect1019ui_story then
				arg_317_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_320_4 = arg_317_1.actors_["1036ui_story"]
			local var_320_5 = 0

			if var_320_5 < arg_317_1.time_ and arg_317_1.time_ <= var_320_5 + arg_320_0 and arg_317_1.var_.characterEffect1036ui_story == nil then
				arg_317_1.var_.characterEffect1036ui_story = var_320_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_6 = 0.1

			if var_320_5 <= arg_317_1.time_ and arg_317_1.time_ < var_320_5 + var_320_6 then
				local var_320_7 = (arg_317_1.time_ - var_320_5) / var_320_6

				if arg_317_1.var_.characterEffect1036ui_story then
					local var_320_8 = Mathf.Lerp(0, 0.5, var_320_7)

					arg_317_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_317_1.var_.characterEffect1036ui_story.fillRatio = var_320_8
				end
			end

			if arg_317_1.time_ >= var_320_5 + var_320_6 and arg_317_1.time_ < var_320_5 + var_320_6 + arg_320_0 and arg_317_1.var_.characterEffect1036ui_story then
				local var_320_9 = 0.5

				arg_317_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_317_1.var_.characterEffect1036ui_story.fillRatio = var_320_9
			end

			local var_320_10 = 0
			local var_320_11 = 0.6

			if var_320_10 < arg_317_1.time_ and arg_317_1.time_ <= var_320_10 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_12 = arg_317_1:FormatText(StoryNameCfg[13].name)

				arg_317_1.leftNameTxt_.text = var_320_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, true)
				arg_317_1.iconController_:SetSelectedState("hero")

				arg_317_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_13 = arg_317_1:GetWordFromCfg(105121077)
				local var_320_14 = arg_317_1:FormatText(var_320_13.content)

				arg_317_1.text_.text = var_320_14

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_15 = 25
				local var_320_16 = utf8.len(var_320_14)
				local var_320_17 = var_320_15 <= 0 and var_320_11 or var_320_11 * (var_320_16 / var_320_15)

				if var_320_17 > 0 and var_320_11 < var_320_17 then
					arg_317_1.talkMaxDuration = var_320_17

					if var_320_17 + var_320_10 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_17 + var_320_10
					end
				end

				arg_317_1.text_.text = var_320_14
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121077", "story_v_out_105121.awb") ~= 0 then
					local var_320_18 = manager.audio:GetVoiceLength("story_v_out_105121", "105121077", "story_v_out_105121.awb") / 1000

					if var_320_18 + var_320_10 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_18 + var_320_10
					end

					if var_320_13.prefab_name ~= "" and arg_317_1.actors_[var_320_13.prefab_name] ~= nil then
						local var_320_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_13.prefab_name].transform, "story_v_out_105121", "105121077", "story_v_out_105121.awb")

						arg_317_1:RecordAudio("105121077", var_320_19)
						arg_317_1:RecordAudio("105121077", var_320_19)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_105121", "105121077", "story_v_out_105121.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_105121", "105121077", "story_v_out_105121.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_20 = math.max(var_320_11, arg_317_1.talkMaxDuration)

			if var_320_10 <= arg_317_1.time_ and arg_317_1.time_ < var_320_10 + var_320_20 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_10) / var_320_20

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_10 + var_320_20 and arg_317_1.time_ < var_320_10 + var_320_20 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play105121078 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 105121078
		arg_321_1.duration_ = 11.366

		local var_321_0 = {
			ja = 11.366,
			ko = 3.233,
			zh = 5.833,
			en = 7.866
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
				arg_321_0:Play105121079(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["10001_tpose"]
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 and arg_321_1.var_.characterEffect10001_tpose == nil then
				arg_321_1.var_.characterEffect10001_tpose = var_324_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_2 = 0.1

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2

				if arg_321_1.var_.characterEffect10001_tpose then
					arg_321_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 and arg_321_1.var_.characterEffect10001_tpose then
				arg_321_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_324_4 = arg_321_1.actors_["1019ui_story"]
			local var_324_5 = 0

			if var_324_5 < arg_321_1.time_ and arg_321_1.time_ <= var_324_5 + arg_324_0 and arg_321_1.var_.characterEffect1019ui_story == nil then
				arg_321_1.var_.characterEffect1019ui_story = var_324_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_6 = 0.1

			if var_324_5 <= arg_321_1.time_ and arg_321_1.time_ < var_324_5 + var_324_6 then
				local var_324_7 = (arg_321_1.time_ - var_324_5) / var_324_6

				if arg_321_1.var_.characterEffect1019ui_story then
					local var_324_8 = Mathf.Lerp(0, 0.5, var_324_7)

					arg_321_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_321_1.var_.characterEffect1019ui_story.fillRatio = var_324_8
				end
			end

			if arg_321_1.time_ >= var_324_5 + var_324_6 and arg_321_1.time_ < var_324_5 + var_324_6 + arg_324_0 and arg_321_1.var_.characterEffect1019ui_story then
				local var_324_9 = 0.5

				arg_321_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_321_1.var_.characterEffect1019ui_story.fillRatio = var_324_9
			end

			local var_324_10 = 0
			local var_324_11 = 0.525

			if var_324_10 < arg_321_1.time_ and arg_321_1.time_ <= var_324_10 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_12 = arg_321_1:FormatText(StoryNameCfg[45].name)

				arg_321_1.leftNameTxt_.text = var_324_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, true)
				arg_321_1.iconController_:SetSelectedState("hero")

				arg_321_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_Noviher")

				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_13 = arg_321_1:GetWordFromCfg(105121078)
				local var_324_14 = arg_321_1:FormatText(var_324_13.content)

				arg_321_1.text_.text = var_324_14

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_15 = 21
				local var_324_16 = utf8.len(var_324_14)
				local var_324_17 = var_324_15 <= 0 and var_324_11 or var_324_11 * (var_324_16 / var_324_15)

				if var_324_17 > 0 and var_324_11 < var_324_17 then
					arg_321_1.talkMaxDuration = var_324_17

					if var_324_17 + var_324_10 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_17 + var_324_10
					end
				end

				arg_321_1.text_.text = var_324_14
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121078", "story_v_out_105121.awb") ~= 0 then
					local var_324_18 = manager.audio:GetVoiceLength("story_v_out_105121", "105121078", "story_v_out_105121.awb") / 1000

					if var_324_18 + var_324_10 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_18 + var_324_10
					end

					if var_324_13.prefab_name ~= "" and arg_321_1.actors_[var_324_13.prefab_name] ~= nil then
						local var_324_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_13.prefab_name].transform, "story_v_out_105121", "105121078", "story_v_out_105121.awb")

						arg_321_1:RecordAudio("105121078", var_324_19)
						arg_321_1:RecordAudio("105121078", var_324_19)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_105121", "105121078", "story_v_out_105121.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_105121", "105121078", "story_v_out_105121.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_20 = math.max(var_324_11, arg_321_1.talkMaxDuration)

			if var_324_10 <= arg_321_1.time_ and arg_321_1.time_ < var_324_10 + var_324_20 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_10) / var_324_20

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_10 + var_324_20 and arg_321_1.time_ < var_324_10 + var_324_20 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play105121079 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 105121079
		arg_325_1.duration_ = 0.100000001489

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"

			SetActive(arg_325_1.choicesGo_, true)

			for iter_326_0, iter_326_1 in ipairs(arg_325_1.choices_) do
				local var_326_0 = iter_326_0 <= 1

				SetActive(iter_326_1.go, var_326_0)
			end

			arg_325_1.choices_[1].txt.text = arg_325_1:FormatText(StoryChoiceCfg[35].name)
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play105121080(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			return
		end
	end,
	Play105121080 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 105121080
		arg_329_1.duration_ = 1.7

		local var_329_0 = {
			ja = 1.7,
			ko = 0.966,
			zh = 1.633,
			en = 1.2
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
				arg_329_0:Play105121081(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["10001_tpose"]
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 and arg_329_1.var_.characterEffect10001_tpose == nil then
				arg_329_1.var_.characterEffect10001_tpose = var_332_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_2 = 0.1

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_2 then
				local var_332_3 = (arg_329_1.time_ - var_332_1) / var_332_2

				if arg_329_1.var_.characterEffect10001_tpose then
					local var_332_4 = Mathf.Lerp(0, 0.5, var_332_3)

					arg_329_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_329_1.var_.characterEffect10001_tpose.fillRatio = var_332_4
				end
			end

			if arg_329_1.time_ >= var_332_1 + var_332_2 and arg_329_1.time_ < var_332_1 + var_332_2 + arg_332_0 and arg_329_1.var_.characterEffect10001_tpose then
				local var_332_5 = 0.5

				arg_329_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_329_1.var_.characterEffect10001_tpose.fillRatio = var_332_5
			end

			local var_332_6 = 0
			local var_332_7 = 0.125

			if var_332_6 < arg_329_1.time_ and arg_329_1.time_ <= var_332_6 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_8 = arg_329_1:FormatText(StoryNameCfg[55].name)

				arg_329_1.leftNameTxt_.text = var_332_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, true)
				arg_329_1.iconController_:SetSelectedState("hero")

				arg_329_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1080")

				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_9 = arg_329_1:GetWordFromCfg(105121080)
				local var_332_10 = arg_329_1:FormatText(var_332_9.content)

				arg_329_1.text_.text = var_332_10

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_11 = 5
				local var_332_12 = utf8.len(var_332_10)
				local var_332_13 = var_332_11 <= 0 and var_332_7 or var_332_7 * (var_332_12 / var_332_11)

				if var_332_13 > 0 and var_332_7 < var_332_13 then
					arg_329_1.talkMaxDuration = var_332_13

					if var_332_13 + var_332_6 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_13 + var_332_6
					end
				end

				arg_329_1.text_.text = var_332_10
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121080", "story_v_out_105121.awb") ~= 0 then
					local var_332_14 = manager.audio:GetVoiceLength("story_v_out_105121", "105121080", "story_v_out_105121.awb") / 1000

					if var_332_14 + var_332_6 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_14 + var_332_6
					end

					if var_332_9.prefab_name ~= "" and arg_329_1.actors_[var_332_9.prefab_name] ~= nil then
						local var_332_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_9.prefab_name].transform, "story_v_out_105121", "105121080", "story_v_out_105121.awb")

						arg_329_1:RecordAudio("105121080", var_332_15)
						arg_329_1:RecordAudio("105121080", var_332_15)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_105121", "105121080", "story_v_out_105121.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_105121", "105121080", "story_v_out_105121.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_16 = math.max(var_332_7, arg_329_1.talkMaxDuration)

			if var_332_6 <= arg_329_1.time_ and arg_329_1.time_ < var_332_6 + var_332_16 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_6) / var_332_16

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_6 + var_332_16 and arg_329_1.time_ < var_332_6 + var_332_16 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play105121081 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 105121081
		arg_333_1.duration_ = 5

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play105121082(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = 0
			local var_336_1 = 0.95

			if var_336_0 < arg_333_1.time_ and arg_333_1.time_ <= var_336_0 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, false)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_2 = arg_333_1:GetWordFromCfg(105121081)
				local var_336_3 = arg_333_1:FormatText(var_336_2.content)

				arg_333_1.text_.text = var_336_3

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_4 = 38
				local var_336_5 = utf8.len(var_336_3)
				local var_336_6 = var_336_4 <= 0 and var_336_1 or var_336_1 * (var_336_5 / var_336_4)

				if var_336_6 > 0 and var_336_1 < var_336_6 then
					arg_333_1.talkMaxDuration = var_336_6

					if var_336_6 + var_336_0 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_6 + var_336_0
					end
				end

				arg_333_1.text_.text = var_336_3
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)
				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_7 = math.max(var_336_1, arg_333_1.talkMaxDuration)

			if var_336_0 <= arg_333_1.time_ and arg_333_1.time_ < var_336_0 + var_336_7 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_0) / var_336_7

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_0 + var_336_7 and arg_333_1.time_ < var_336_0 + var_336_7 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play105121082 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 105121082
		arg_337_1.duration_ = 3.5

		local var_337_0 = {
			ja = 2.7,
			ko = 2.2,
			zh = 3.5,
			en = 1.6
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
				arg_337_0:Play105121083(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = 0
			local var_340_1 = 0.25

			if var_340_0 < arg_337_1.time_ and arg_337_1.time_ <= var_340_0 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_2 = arg_337_1:FormatText(StoryNameCfg[56].name)

				arg_337_1.leftNameTxt_.text = var_340_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, true)
				arg_337_1.iconController_:SetSelectedState("hero")

				arg_337_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1027")

				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_3 = arg_337_1:GetWordFromCfg(105121082)
				local var_340_4 = arg_337_1:FormatText(var_340_3.content)

				arg_337_1.text_.text = var_340_4

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121082", "story_v_out_105121.awb") ~= 0 then
					local var_340_8 = manager.audio:GetVoiceLength("story_v_out_105121", "105121082", "story_v_out_105121.awb") / 1000

					if var_340_8 + var_340_0 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_8 + var_340_0
					end

					if var_340_3.prefab_name ~= "" and arg_337_1.actors_[var_340_3.prefab_name] ~= nil then
						local var_340_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_3.prefab_name].transform, "story_v_out_105121", "105121082", "story_v_out_105121.awb")

						arg_337_1:RecordAudio("105121082", var_340_9)
						arg_337_1:RecordAudio("105121082", var_340_9)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_105121", "105121082", "story_v_out_105121.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_105121", "105121082", "story_v_out_105121.awb")
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
	Play105121083 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 105121083
		arg_341_1.duration_ = 4

		local var_341_0 = {
			ja = 4,
			ko = 3.433,
			zh = 3.533,
			en = 3.866
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
			arg_341_1.auto_ = false
		end

		function arg_341_1.playNext_(arg_343_0)
			arg_341_1.onStoryFinished_()
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1084ui_story"]
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 and arg_341_1.var_.characterEffect1084ui_story == nil then
				arg_341_1.var_.characterEffect1084ui_story = var_344_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_2 = 0.1

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2

				if arg_341_1.var_.characterEffect1084ui_story then
					arg_341_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 and arg_341_1.var_.characterEffect1084ui_story then
				arg_341_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_344_4 = 0
			local var_344_5 = 0.45

			if var_344_4 < arg_341_1.time_ and arg_341_1.time_ <= var_344_4 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_6 = arg_341_1:FormatText(StoryNameCfg[6].name)

				arg_341_1.leftNameTxt_.text = var_344_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, true)
				arg_341_1.iconController_:SetSelectedState("hero")

				arg_341_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_7 = arg_341_1:GetWordFromCfg(105121083)
				local var_344_8 = arg_341_1:FormatText(var_344_7.content)

				arg_341_1.text_.text = var_344_8

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_9 = 18
				local var_344_10 = utf8.len(var_344_8)
				local var_344_11 = var_344_9 <= 0 and var_344_5 or var_344_5 * (var_344_10 / var_344_9)

				if var_344_11 > 0 and var_344_5 < var_344_11 then
					arg_341_1.talkMaxDuration = var_344_11

					if var_344_11 + var_344_4 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_11 + var_344_4
					end
				end

				arg_341_1.text_.text = var_344_8
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105121", "105121083", "story_v_out_105121.awb") ~= 0 then
					local var_344_12 = manager.audio:GetVoiceLength("story_v_out_105121", "105121083", "story_v_out_105121.awb") / 1000

					if var_344_12 + var_344_4 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_12 + var_344_4
					end

					if var_344_7.prefab_name ~= "" and arg_341_1.actors_[var_344_7.prefab_name] ~= nil then
						local var_344_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_7.prefab_name].transform, "story_v_out_105121", "105121083", "story_v_out_105121.awb")

						arg_341_1:RecordAudio("105121083", var_344_13)
						arg_341_1:RecordAudio("105121083", var_344_13)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_105121", "105121083", "story_v_out_105121.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_105121", "105121083", "story_v_out_105121.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_14 = math.max(var_344_5, arg_341_1.talkMaxDuration)

			if var_344_4 <= arg_341_1.time_ and arg_341_1.time_ < var_344_4 + var_344_14 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_4) / var_344_14

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_4 + var_344_14 and arg_341_1.time_ < var_344_4 + var_344_14 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B12a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0505",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B01a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0504"
	},
	voices = {
		"story_v_out_105121.awb"
	}
}
