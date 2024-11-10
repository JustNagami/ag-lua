return {
	Play115201001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 115201001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play115201002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "RO0205"

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
				local var_4_5 = arg_1_1.bgs_.RO0205

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
					if iter_4_0 ~= "RO0205" then
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

				arg_1_1:AudioAction(var_4_24, var_4_25, "se_story_15", "se_story_15_blast03", "")
			end

			local var_4_26 = 0
			local var_4_27 = 0.3

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_30 = 0.475
			local var_4_31 = 0.525

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "music"

				arg_1_1:AudioAction(var_4_32, var_4_33, "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2.awb")
			end

			local var_4_34 = manager.ui.mainCamera.transform
			local var_4_35 = 1

			if var_4_35 < arg_1_1.time_ and arg_1_1.time_ <= var_4_35 + arg_4_0 then
				arg_1_1.var_.shakeOldPos = var_4_34.localPosition
			end

			local var_4_36 = 1

			if var_4_35 <= arg_1_1.time_ and arg_1_1.time_ < var_4_35 + var_4_36 then
				local var_4_37 = (arg_1_1.time_ - var_4_35) / 0.066
				local var_4_38, var_4_39 = math.modf(var_4_37)

				var_4_34.localPosition = Vector3.New(var_4_39 * 0.13, var_4_39 * 0.13, var_4_39 * 0.13) + arg_1_1.var_.shakeOldPos
			end

			if arg_1_1.time_ >= var_4_35 + var_4_36 and arg_1_1.time_ < var_4_35 + var_4_36 + arg_4_0 then
				var_4_34.localPosition = arg_1_1.var_.shakeOldPos
			end

			local var_4_40 = arg_1_1.bgs_.RO0205.transform
			local var_4_41 = 0

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				arg_1_1.var_.moveOldPosRO0205 = var_4_40.localPosition
			end

			local var_4_42 = 0.001

			if var_4_41 <= arg_1_1.time_ and arg_1_1.time_ < var_4_41 + var_4_42 then
				local var_4_43 = (arg_1_1.time_ - var_4_41) / var_4_42
				local var_4_44 = Vector3.New(-1, 1, 6)

				var_4_40.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPosRO0205, var_4_44, var_4_43)
			end

			if arg_1_1.time_ >= var_4_41 + var_4_42 and arg_1_1.time_ < var_4_41 + var_4_42 + arg_4_0 then
				var_4_40.localPosition = Vector3.New(-1, 1, 6)
			end

			local var_4_45 = arg_1_1.bgs_.RO0205.transform
			local var_4_46 = 0.0166666666666667

			if var_4_46 < arg_1_1.time_ and arg_1_1.time_ <= var_4_46 + arg_4_0 then
				arg_1_1.var_.moveOldPosRO0205 = var_4_45.localPosition
			end

			local var_4_47 = 3.5

			if var_4_46 <= arg_1_1.time_ and arg_1_1.time_ < var_4_46 + var_4_47 then
				local var_4_48 = (arg_1_1.time_ - var_4_46) / var_4_47
				local var_4_49 = Vector3.New(-1, 0.5, 6)

				var_4_45.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPosRO0205, var_4_49, var_4_48)
			end

			if arg_1_1.time_ >= var_4_46 + var_4_47 and arg_1_1.time_ < var_4_46 + var_4_47 + arg_4_0 then
				var_4_45.localPosition = Vector3.New(-1, 0.5, 6)
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_50 = 2
			local var_4_51 = 0.475

			if var_4_50 < arg_1_1.time_ and arg_1_1.time_ <= var_4_50 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_52 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_52:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_52:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_52:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_53 = arg_1_1:GetWordFromCfg(115201001)
				local var_4_54 = arg_1_1:FormatText(var_4_53.content)

				arg_1_1.text_.text = var_4_54

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_55 = 19
				local var_4_56 = utf8.len(var_4_54)
				local var_4_57 = var_4_55 <= 0 and var_4_51 or var_4_51 * (var_4_56 / var_4_55)

				if var_4_57 > 0 and var_4_51 < var_4_57 then
					arg_1_1.talkMaxDuration = var_4_57
					var_4_50 = var_4_50 + 0.3

					if var_4_57 + var_4_50 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_57 + var_4_50
					end
				end

				arg_1_1.text_.text = var_4_54
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_58 = var_4_50 + 0.3
			local var_4_59 = math.max(var_4_51, arg_1_1.talkMaxDuration)

			if var_4_58 <= arg_1_1.time_ and arg_1_1.time_ < var_4_58 + var_4_59 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_58) / var_4_59

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_58 + var_4_59 and arg_1_1.time_ < var_4_58 + var_4_59 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play115201002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 115201002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play115201003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.075

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

				local var_10_2 = arg_7_1:GetWordFromCfg(115201002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 43
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
	Play115201003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 115201003
		arg_11_1.duration_ = 8.866

		local var_11_0 = {
			ja = 8.866,
			ko = 5.4,
			zh = 8.666,
			en = 6.833
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
				arg_11_0:Play115201004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.475

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[263].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1052")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(115201003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201003", "story_v_out_115201.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201003", "story_v_out_115201.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_115201", "115201003", "story_v_out_115201.awb")

						arg_11_1:RecordAudio("115201003", var_14_9)
						arg_11_1:RecordAudio("115201003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_115201", "115201003", "story_v_out_115201.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_115201", "115201003", "story_v_out_115201.awb")
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
	Play115201004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 115201004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play115201005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.375

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

				local var_18_2 = arg_15_1:GetWordFromCfg(115201004)
				local var_18_3 = arg_15_1:FormatText(var_18_2.content)

				arg_15_1.text_.text = var_18_3

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_4 = 15
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
	Play115201005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 115201005
		arg_19_1.duration_ = 10.1

		local var_19_0 = {
			ja = 10.1,
			ko = 6.333,
			zh = 8.133,
			en = 5.966
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
				arg_19_0:Play115201006(arg_19_1)
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

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[263].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1052")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(115201005)
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201005", "story_v_out_115201.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201005", "story_v_out_115201.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_115201", "115201005", "story_v_out_115201.awb")

						arg_19_1:RecordAudio("115201005", var_22_9)
						arg_19_1:RecordAudio("115201005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_115201", "115201005", "story_v_out_115201.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_115201", "115201005", "story_v_out_115201.awb")
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
	Play115201006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 115201006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play115201007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.65

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_2 = arg_23_1:GetWordFromCfg(115201006)
				local var_26_3 = arg_23_1:FormatText(var_26_2.content)

				arg_23_1.text_.text = var_26_3

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_4 = 26
				local var_26_5 = utf8.len(var_26_3)
				local var_26_6 = var_26_4 <= 0 and var_26_1 or var_26_1 * (var_26_5 / var_26_4)

				if var_26_6 > 0 and var_26_1 < var_26_6 then
					arg_23_1.talkMaxDuration = var_26_6

					if var_26_6 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_6 + var_26_0
					end
				end

				arg_23_1.text_.text = var_26_3
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_7 = math.max(var_26_1, arg_23_1.talkMaxDuration)

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_7 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_0) / var_26_7

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_0 + var_26_7 and arg_23_1.time_ < var_26_0 + var_26_7 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play115201007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 115201007
		arg_27_1.duration_ = 10.5

		local var_27_0 = {
			ja = 8.8,
			ko = 8.2,
			zh = 10.5,
			en = 7.666
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
				arg_27_0:Play115201008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = "G02j"

			if arg_27_1.bgs_[var_30_0] == nil then
				local var_30_1 = Object.Instantiate(arg_27_1.paintGo_)

				var_30_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_30_0)
				var_30_1.name = var_30_0
				var_30_1.transform.parent = arg_27_1.stage_.transform
				var_30_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_27_1.bgs_[var_30_0] = var_30_1
			end

			local var_30_2 = 2

			if var_30_2 < arg_27_1.time_ and arg_27_1.time_ <= var_30_2 + arg_30_0 then
				local var_30_3 = manager.ui.mainCamera.transform.localPosition
				local var_30_4 = Vector3.New(0, 0, 10) + Vector3.New(var_30_3.x, var_30_3.y, 0)
				local var_30_5 = arg_27_1.bgs_.G02j

				var_30_5.transform.localPosition = var_30_4
				var_30_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_30_6 = var_30_5:GetComponent("SpriteRenderer")

				if var_30_6 and var_30_6.sprite then
					local var_30_7 = (var_30_5.transform.localPosition - var_30_3).z
					local var_30_8 = manager.ui.mainCameraCom_
					local var_30_9 = 2 * var_30_7 * Mathf.Tan(var_30_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_30_10 = var_30_9 * var_30_8.aspect
					local var_30_11 = var_30_6.sprite.bounds.size.x
					local var_30_12 = var_30_6.sprite.bounds.size.y
					local var_30_13 = var_30_10 / var_30_11
					local var_30_14 = var_30_9 / var_30_12
					local var_30_15 = var_30_14 < var_30_13 and var_30_13 or var_30_14

					var_30_5.transform.localScale = Vector3.New(var_30_15, var_30_15, 0)
				end

				for iter_30_0, iter_30_1 in pairs(arg_27_1.bgs_) do
					if iter_30_0 ~= "G02j" then
						iter_30_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_30_16 = 0

			if var_30_16 < arg_27_1.time_ and arg_27_1.time_ <= var_30_16 + arg_30_0 then
				arg_27_1.mask_.enabled = true
				arg_27_1.mask_.raycastTarget = true

				arg_27_1:SetGaussion(false)
			end

			local var_30_17 = 2

			if var_30_16 <= arg_27_1.time_ and arg_27_1.time_ < var_30_16 + var_30_17 then
				local var_30_18 = (arg_27_1.time_ - var_30_16) / var_30_17
				local var_30_19 = Color.New(0, 0, 0)

				var_30_19.a = Mathf.Lerp(0, 1, var_30_18)
				arg_27_1.mask_.color = var_30_19
			end

			if arg_27_1.time_ >= var_30_16 + var_30_17 and arg_27_1.time_ < var_30_16 + var_30_17 + arg_30_0 then
				local var_30_20 = Color.New(0, 0, 0)

				var_30_20.a = 1
				arg_27_1.mask_.color = var_30_20
			end

			local var_30_21 = 2

			if var_30_21 < arg_27_1.time_ and arg_27_1.time_ <= var_30_21 + arg_30_0 then
				arg_27_1.mask_.enabled = true
				arg_27_1.mask_.raycastTarget = true

				arg_27_1:SetGaussion(false)
			end

			local var_30_22 = 2

			if var_30_21 <= arg_27_1.time_ and arg_27_1.time_ < var_30_21 + var_30_22 then
				local var_30_23 = (arg_27_1.time_ - var_30_21) / var_30_22
				local var_30_24 = Color.New(0, 0, 0)

				var_30_24.a = Mathf.Lerp(1, 0, var_30_23)
				arg_27_1.mask_.color = var_30_24
			end

			if arg_27_1.time_ >= var_30_21 + var_30_22 and arg_27_1.time_ < var_30_21 + var_30_22 + arg_30_0 then
				local var_30_25 = Color.New(0, 0, 0)
				local var_30_26 = 0

				arg_27_1.mask_.enabled = false
				var_30_25.a = var_30_26
				arg_27_1.mask_.color = var_30_25
			end

			if arg_27_1.frameCnt_ <= 1 then
				arg_27_1.dialog_:SetActive(false)
			end

			local var_30_27 = 4
			local var_30_28 = 0.25

			if var_30_27 < arg_27_1.time_ and arg_27_1.time_ <= var_30_27 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0

				arg_27_1.dialog_:SetActive(true)

				local var_30_29 = LeanTween.value(arg_27_1.dialog_, 0, 1, 0.3)

				var_30_29:setOnUpdate(LuaHelper.FloatAction(function(arg_31_0)
					arg_27_1.dialogCg_.alpha = arg_31_0
				end))
				var_30_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_27_1.dialog_)
					var_30_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_27_1.duration_ = arg_27_1.duration_ + 0.3

				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_30 = arg_27_1:FormatText(StoryNameCfg[263].name)

				arg_27_1.leftNameTxt_.text = var_30_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, true)
				arg_27_1.iconController_:SetSelectedState("hero")

				arg_27_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1052")

				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_31 = arg_27_1:GetWordFromCfg(115201007)
				local var_30_32 = arg_27_1:FormatText(var_30_31.content)

				arg_27_1.text_.text = var_30_32

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_33 = 10
				local var_30_34 = utf8.len(var_30_32)
				local var_30_35 = var_30_33 <= 0 and var_30_28 or var_30_28 * (var_30_34 / var_30_33)

				if var_30_35 > 0 and var_30_28 < var_30_35 then
					arg_27_1.talkMaxDuration = var_30_35
					var_30_27 = var_30_27 + 0.3

					if var_30_35 + var_30_27 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_35 + var_30_27
					end
				end

				arg_27_1.text_.text = var_30_32
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201007", "story_v_out_115201.awb") ~= 0 then
					local var_30_36 = manager.audio:GetVoiceLength("story_v_out_115201", "115201007", "story_v_out_115201.awb") / 1000

					if var_30_36 + var_30_27 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_36 + var_30_27
					end

					if var_30_31.prefab_name ~= "" and arg_27_1.actors_[var_30_31.prefab_name] ~= nil then
						local var_30_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_31.prefab_name].transform, "story_v_out_115201", "115201007", "story_v_out_115201.awb")

						arg_27_1:RecordAudio("115201007", var_30_37)
						arg_27_1:RecordAudio("115201007", var_30_37)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_115201", "115201007", "story_v_out_115201.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_115201", "115201007", "story_v_out_115201.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_38 = var_30_27 + 0.3
			local var_30_39 = math.max(var_30_28, arg_27_1.talkMaxDuration)

			if var_30_38 <= arg_27_1.time_ and arg_27_1.time_ < var_30_38 + var_30_39 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_38) / var_30_39

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_38 + var_30_39 and arg_27_1.time_ < var_30_38 + var_30_39 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play115201008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 115201008
		arg_33_1.duration_ = 5

		local var_33_0 = {
			ja = 5,
			ko = 3,
			zh = 2.566,
			en = 3.633
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
				arg_33_0:Play115201009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = "1024ui_story"

			if arg_33_1.actors_[var_36_0] == nil then
				local var_36_1 = Object.Instantiate(Asset.Load("Char/" .. var_36_0), arg_33_1.stage_.transform)

				var_36_1.name = var_36_0
				var_36_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_33_1.actors_[var_36_0] = var_36_1

				local var_36_2 = var_36_1:GetComponentInChildren(typeof(CharacterEffect))

				var_36_2.enabled = true

				local var_36_3 = GameObjectTools.GetOrAddComponent(var_36_1, typeof(DynamicBoneHelper))

				if var_36_3 then
					var_36_3:EnableDynamicBone(false)
				end

				arg_33_1:ShowWeapon(var_36_2.transform, false)

				arg_33_1.var_[var_36_0 .. "Animator"] = var_36_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_33_1.var_[var_36_0 .. "Animator"].applyRootMotion = true
				arg_33_1.var_[var_36_0 .. "LipSync"] = var_36_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_36_4 = arg_33_1.actors_["1024ui_story"].transform
			local var_36_5 = 0

			if var_36_5 < arg_33_1.time_ and arg_33_1.time_ <= var_36_5 + arg_36_0 then
				arg_33_1.var_.moveOldPos1024ui_story = var_36_4.localPosition
			end

			local var_36_6 = 0.001

			if var_36_5 <= arg_33_1.time_ and arg_33_1.time_ < var_36_5 + var_36_6 then
				local var_36_7 = (arg_33_1.time_ - var_36_5) / var_36_6
				local var_36_8 = Vector3.New(0, -1, -6.05)

				var_36_4.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos1024ui_story, var_36_8, var_36_7)

				local var_36_9 = manager.ui.mainCamera.transform.position - var_36_4.position

				var_36_4.forward = Vector3.New(var_36_9.x, var_36_9.y, var_36_9.z)

				local var_36_10 = var_36_4.localEulerAngles

				var_36_10.z = 0
				var_36_10.x = 0
				var_36_4.localEulerAngles = var_36_10
			end

			if arg_33_1.time_ >= var_36_5 + var_36_6 and arg_33_1.time_ < var_36_5 + var_36_6 + arg_36_0 then
				var_36_4.localPosition = Vector3.New(0, -1, -6.05)

				local var_36_11 = manager.ui.mainCamera.transform.position - var_36_4.position

				var_36_4.forward = Vector3.New(var_36_11.x, var_36_11.y, var_36_11.z)

				local var_36_12 = var_36_4.localEulerAngles

				var_36_12.z = 0
				var_36_12.x = 0
				var_36_4.localEulerAngles = var_36_12
			end

			local var_36_13 = 0

			if var_36_13 < arg_33_1.time_ and arg_33_1.time_ <= var_36_13 + arg_36_0 then
				arg_33_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action5_1")
			end

			local var_36_14 = 0

			if var_36_14 < arg_33_1.time_ and arg_33_1.time_ <= var_36_14 + arg_36_0 then
				arg_33_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_36_15 = arg_33_1.actors_["1024ui_story"]
			local var_36_16 = 0

			if var_36_16 < arg_33_1.time_ and arg_33_1.time_ <= var_36_16 + arg_36_0 and arg_33_1.var_.characterEffect1024ui_story == nil then
				arg_33_1.var_.characterEffect1024ui_story = var_36_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_17 = 0.2

			if var_36_16 <= arg_33_1.time_ and arg_33_1.time_ < var_36_16 + var_36_17 then
				local var_36_18 = (arg_33_1.time_ - var_36_16) / var_36_17

				if arg_33_1.var_.characterEffect1024ui_story then
					arg_33_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_33_1.time_ >= var_36_16 + var_36_17 and arg_33_1.time_ < var_36_16 + var_36_17 + arg_36_0 and arg_33_1.var_.characterEffect1024ui_story then
				arg_33_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_36_19 = 0
			local var_36_20 = 0.4

			if var_36_19 < arg_33_1.time_ and arg_33_1.time_ <= var_36_19 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_21 = arg_33_1:FormatText(StoryNameCfg[265].name)

				arg_33_1.leftNameTxt_.text = var_36_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_22 = arg_33_1:GetWordFromCfg(115201008)
				local var_36_23 = arg_33_1:FormatText(var_36_22.content)

				arg_33_1.text_.text = var_36_23

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_24 = 16
				local var_36_25 = utf8.len(var_36_23)
				local var_36_26 = var_36_24 <= 0 and var_36_20 or var_36_20 * (var_36_25 / var_36_24)

				if var_36_26 > 0 and var_36_20 < var_36_26 then
					arg_33_1.talkMaxDuration = var_36_26

					if var_36_26 + var_36_19 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_26 + var_36_19
					end
				end

				arg_33_1.text_.text = var_36_23
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201008", "story_v_out_115201.awb") ~= 0 then
					local var_36_27 = manager.audio:GetVoiceLength("story_v_out_115201", "115201008", "story_v_out_115201.awb") / 1000

					if var_36_27 + var_36_19 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_27 + var_36_19
					end

					if var_36_22.prefab_name ~= "" and arg_33_1.actors_[var_36_22.prefab_name] ~= nil then
						local var_36_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_22.prefab_name].transform, "story_v_out_115201", "115201008", "story_v_out_115201.awb")

						arg_33_1:RecordAudio("115201008", var_36_28)
						arg_33_1:RecordAudio("115201008", var_36_28)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_115201", "115201008", "story_v_out_115201.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_115201", "115201008", "story_v_out_115201.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_29 = math.max(var_36_20, arg_33_1.talkMaxDuration)

			if var_36_19 <= arg_33_1.time_ and arg_33_1.time_ < var_36_19 + var_36_29 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_19) / var_36_29

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_19 + var_36_29 and arg_33_1.time_ < var_36_19 + var_36_29 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play115201009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 115201009
		arg_37_1.duration_ = 10.8

		local var_37_0 = {
			ja = 8.333,
			ko = 6.133,
			zh = 10.8,
			en = 6.766
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
				arg_37_0:Play115201010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1024ui_story"]
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 and arg_37_1.var_.characterEffect1024ui_story == nil then
				arg_37_1.var_.characterEffect1024ui_story = var_40_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_2 = 0.2

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2

				if arg_37_1.var_.characterEffect1024ui_story then
					local var_40_4 = Mathf.Lerp(0, 0.5, var_40_3)

					arg_37_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_37_1.var_.characterEffect1024ui_story.fillRatio = var_40_4
				end
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 and arg_37_1.var_.characterEffect1024ui_story then
				local var_40_5 = 0.5

				arg_37_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_37_1.var_.characterEffect1024ui_story.fillRatio = var_40_5
			end

			local var_40_6 = 0
			local var_40_7 = 0.55

			if var_40_6 < arg_37_1.time_ and arg_37_1.time_ <= var_40_6 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_8 = arg_37_1:FormatText(StoryNameCfg[263].name)

				arg_37_1.leftNameTxt_.text = var_40_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, true)
				arg_37_1.iconController_:SetSelectedState("hero")

				arg_37_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1052")

				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_9 = arg_37_1:GetWordFromCfg(115201009)
				local var_40_10 = arg_37_1:FormatText(var_40_9.content)

				arg_37_1.text_.text = var_40_10

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_11 = 22
				local var_40_12 = utf8.len(var_40_10)
				local var_40_13 = var_40_11 <= 0 and var_40_7 or var_40_7 * (var_40_12 / var_40_11)

				if var_40_13 > 0 and var_40_7 < var_40_13 then
					arg_37_1.talkMaxDuration = var_40_13

					if var_40_13 + var_40_6 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_13 + var_40_6
					end
				end

				arg_37_1.text_.text = var_40_10
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201009", "story_v_out_115201.awb") ~= 0 then
					local var_40_14 = manager.audio:GetVoiceLength("story_v_out_115201", "115201009", "story_v_out_115201.awb") / 1000

					if var_40_14 + var_40_6 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_14 + var_40_6
					end

					if var_40_9.prefab_name ~= "" and arg_37_1.actors_[var_40_9.prefab_name] ~= nil then
						local var_40_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_9.prefab_name].transform, "story_v_out_115201", "115201009", "story_v_out_115201.awb")

						arg_37_1:RecordAudio("115201009", var_40_15)
						arg_37_1:RecordAudio("115201009", var_40_15)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_115201", "115201009", "story_v_out_115201.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_115201", "115201009", "story_v_out_115201.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_16 = math.max(var_40_7, arg_37_1.talkMaxDuration)

			if var_40_6 <= arg_37_1.time_ and arg_37_1.time_ < var_40_6 + var_40_16 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_6) / var_40_16

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_6 + var_40_16 and arg_37_1.time_ < var_40_6 + var_40_16 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play115201010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 115201010
		arg_41_1.duration_ = 3.033

		local var_41_0 = {
			ja = 2.866,
			ko = 2.4,
			zh = 3.033,
			en = 2.7
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
				arg_41_0:Play115201011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1024ui_story"].transform
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 then
				arg_41_1.var_.moveOldPos1024ui_story = var_44_0.localPosition
			end

			local var_44_2 = 0.001

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2
				local var_44_4 = Vector3.New(0, 100, 0)

				var_44_0.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos1024ui_story, var_44_4, var_44_3)

				local var_44_5 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_5.x, var_44_5.y, var_44_5.z)

				local var_44_6 = var_44_0.localEulerAngles

				var_44_6.z = 0
				var_44_6.x = 0
				var_44_0.localEulerAngles = var_44_6
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 then
				var_44_0.localPosition = Vector3.New(0, 100, 0)

				local var_44_7 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_7.x, var_44_7.y, var_44_7.z)

				local var_44_8 = var_44_0.localEulerAngles

				var_44_8.z = 0
				var_44_8.x = 0
				var_44_0.localEulerAngles = var_44_8
			end

			local var_44_9 = 0
			local var_44_10 = 0.225

			if var_44_9 < arg_41_1.time_ and arg_41_1.time_ <= var_44_9 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_11 = arg_41_1:FormatText(StoryNameCfg[261].name)

				arg_41_1.leftNameTxt_.text = var_44_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, true)
				arg_41_1.iconController_:SetSelectedState("hero")

				arg_41_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2084")

				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_12 = arg_41_1:GetWordFromCfg(115201010)
				local var_44_13 = arg_41_1:FormatText(var_44_12.content)

				arg_41_1.text_.text = var_44_13

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_14 = 9
				local var_44_15 = utf8.len(var_44_13)
				local var_44_16 = var_44_14 <= 0 and var_44_10 or var_44_10 * (var_44_15 / var_44_14)

				if var_44_16 > 0 and var_44_10 < var_44_16 then
					arg_41_1.talkMaxDuration = var_44_16

					if var_44_16 + var_44_9 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_16 + var_44_9
					end
				end

				arg_41_1.text_.text = var_44_13
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201010", "story_v_out_115201.awb") ~= 0 then
					local var_44_17 = manager.audio:GetVoiceLength("story_v_out_115201", "115201010", "story_v_out_115201.awb") / 1000

					if var_44_17 + var_44_9 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_17 + var_44_9
					end

					if var_44_12.prefab_name ~= "" and arg_41_1.actors_[var_44_12.prefab_name] ~= nil then
						local var_44_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_12.prefab_name].transform, "story_v_out_115201", "115201010", "story_v_out_115201.awb")

						arg_41_1:RecordAudio("115201010", var_44_18)
						arg_41_1:RecordAudio("115201010", var_44_18)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_115201", "115201010", "story_v_out_115201.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_115201", "115201010", "story_v_out_115201.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_19 = math.max(var_44_10, arg_41_1.talkMaxDuration)

			if var_44_9 <= arg_41_1.time_ and arg_41_1.time_ < var_44_9 + var_44_19 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_9) / var_44_19

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_9 + var_44_19 and arg_41_1.time_ < var_44_9 + var_44_19 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play115201011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 115201011
		arg_45_1.duration_ = 2.6

		local var_45_0 = {
			ja = 2.6,
			ko = 2,
			zh = 1.866,
			en = 2.3
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
				arg_45_0:Play115201012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = 0
			local var_48_1 = 0.15

			if var_48_0 < arg_45_1.time_ and arg_45_1.time_ <= var_48_0 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_2 = arg_45_1:FormatText(StoryNameCfg[262].name)

				arg_45_1.leftNameTxt_.text = var_48_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, true)
				arg_45_1.iconController_:SetSelectedState("hero")

				arg_45_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2084")

				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_3 = arg_45_1:GetWordFromCfg(115201011)
				local var_48_4 = arg_45_1:FormatText(var_48_3.content)

				arg_45_1.text_.text = var_48_4

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201011", "story_v_out_115201.awb") ~= 0 then
					local var_48_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201011", "story_v_out_115201.awb") / 1000

					if var_48_8 + var_48_0 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_8 + var_48_0
					end

					if var_48_3.prefab_name ~= "" and arg_45_1.actors_[var_48_3.prefab_name] ~= nil then
						local var_48_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_3.prefab_name].transform, "story_v_out_115201", "115201011", "story_v_out_115201.awb")

						arg_45_1:RecordAudio("115201011", var_48_9)
						arg_45_1:RecordAudio("115201011", var_48_9)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_115201", "115201011", "story_v_out_115201.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_115201", "115201011", "story_v_out_115201.awb")
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
	Play115201012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 115201012
		arg_49_1.duration_ = 5

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play115201013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = 0
			local var_52_1 = 0.9

			if var_52_0 < arg_49_1.time_ and arg_49_1.time_ <= var_52_0 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, false)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_2 = arg_49_1:GetWordFromCfg(115201012)
				local var_52_3 = arg_49_1:FormatText(var_52_2.content)

				arg_49_1.text_.text = var_52_3

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_4 = 36
				local var_52_5 = utf8.len(var_52_3)
				local var_52_6 = var_52_4 <= 0 and var_52_1 or var_52_1 * (var_52_5 / var_52_4)

				if var_52_6 > 0 and var_52_1 < var_52_6 then
					arg_49_1.talkMaxDuration = var_52_6

					if var_52_6 + var_52_0 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_6 + var_52_0
					end
				end

				arg_49_1.text_.text = var_52_3
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)
				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_7 = math.max(var_52_1, arg_49_1.talkMaxDuration)

			if var_52_0 <= arg_49_1.time_ and arg_49_1.time_ < var_52_0 + var_52_7 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_0) / var_52_7

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_0 + var_52_7 and arg_49_1.time_ < var_52_0 + var_52_7 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play115201013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 115201013
		arg_53_1.duration_ = 7.3

		local var_53_0 = {
			ja = 7.3,
			ko = 6.266,
			zh = 5.933,
			en = 6.966
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
				arg_53_0:Play115201014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0
			local var_56_1 = 0.675

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_2 = arg_53_1:FormatText(StoryNameCfg[261].name)

				arg_53_1.leftNameTxt_.text = var_56_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, true)
				arg_53_1.iconController_:SetSelectedState("hero")

				arg_53_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2084")

				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_3 = arg_53_1:GetWordFromCfg(115201013)
				local var_56_4 = arg_53_1:FormatText(var_56_3.content)

				arg_53_1.text_.text = var_56_4

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_5 = 27
				local var_56_6 = utf8.len(var_56_4)
				local var_56_7 = var_56_5 <= 0 and var_56_1 or var_56_1 * (var_56_6 / var_56_5)

				if var_56_7 > 0 and var_56_1 < var_56_7 then
					arg_53_1.talkMaxDuration = var_56_7

					if var_56_7 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_7 + var_56_0
					end
				end

				arg_53_1.text_.text = var_56_4
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201013", "story_v_out_115201.awb") ~= 0 then
					local var_56_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201013", "story_v_out_115201.awb") / 1000

					if var_56_8 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_8 + var_56_0
					end

					if var_56_3.prefab_name ~= "" and arg_53_1.actors_[var_56_3.prefab_name] ~= nil then
						local var_56_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_3.prefab_name].transform, "story_v_out_115201", "115201013", "story_v_out_115201.awb")

						arg_53_1:RecordAudio("115201013", var_56_9)
						arg_53_1:RecordAudio("115201013", var_56_9)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_115201", "115201013", "story_v_out_115201.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_115201", "115201013", "story_v_out_115201.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_10 = math.max(var_56_1, arg_53_1.talkMaxDuration)

			if var_56_0 <= arg_53_1.time_ and arg_53_1.time_ < var_56_0 + var_56_10 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_0) / var_56_10

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_0 + var_56_10 and arg_53_1.time_ < var_56_0 + var_56_10 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play115201014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 115201014
		arg_57_1.duration_ = 4.6

		local var_57_0 = {
			ja = 4.6,
			ko = 4.233,
			zh = 3.333,
			en = 3.7
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
				arg_57_0:Play115201015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0
			local var_60_1 = 0.45

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_2 = arg_57_1:FormatText(StoryNameCfg[262].name)

				arg_57_1.leftNameTxt_.text = var_60_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, true)
				arg_57_1.iconController_:SetSelectedState("hero")

				arg_57_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2084")

				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_3 = arg_57_1:GetWordFromCfg(115201014)
				local var_60_4 = arg_57_1:FormatText(var_60_3.content)

				arg_57_1.text_.text = var_60_4

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_5 = 18
				local var_60_6 = utf8.len(var_60_4)
				local var_60_7 = var_60_5 <= 0 and var_60_1 or var_60_1 * (var_60_6 / var_60_5)

				if var_60_7 > 0 and var_60_1 < var_60_7 then
					arg_57_1.talkMaxDuration = var_60_7

					if var_60_7 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_7 + var_60_0
					end
				end

				arg_57_1.text_.text = var_60_4
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201014", "story_v_out_115201.awb") ~= 0 then
					local var_60_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201014", "story_v_out_115201.awb") / 1000

					if var_60_8 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_8 + var_60_0
					end

					if var_60_3.prefab_name ~= "" and arg_57_1.actors_[var_60_3.prefab_name] ~= nil then
						local var_60_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_3.prefab_name].transform, "story_v_out_115201", "115201014", "story_v_out_115201.awb")

						arg_57_1:RecordAudio("115201014", var_60_9)
						arg_57_1:RecordAudio("115201014", var_60_9)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_115201", "115201014", "story_v_out_115201.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_115201", "115201014", "story_v_out_115201.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_10 = math.max(var_60_1, arg_57_1.talkMaxDuration)

			if var_60_0 <= arg_57_1.time_ and arg_57_1.time_ < var_60_0 + var_60_10 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_0) / var_60_10

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_0 + var_60_10 and arg_57_1.time_ < var_60_0 + var_60_10 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play115201015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 115201015
		arg_61_1.duration_ = 6.433

		local var_61_0 = {
			ja = 6.433,
			ko = 5.433,
			zh = 4.966,
			en = 6.266
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
				arg_61_0:Play115201016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 0.675

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_2 = arg_61_1:FormatText(StoryNameCfg[262].name)

				arg_61_1.leftNameTxt_.text = var_64_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, true)
				arg_61_1.iconController_:SetSelectedState("hero")

				arg_61_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2084")

				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_3 = arg_61_1:GetWordFromCfg(115201015)
				local var_64_4 = arg_61_1:FormatText(var_64_3.content)

				arg_61_1.text_.text = var_64_4

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_5 = 27
				local var_64_6 = utf8.len(var_64_4)
				local var_64_7 = var_64_5 <= 0 and var_64_1 or var_64_1 * (var_64_6 / var_64_5)

				if var_64_7 > 0 and var_64_1 < var_64_7 then
					arg_61_1.talkMaxDuration = var_64_7

					if var_64_7 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_7 + var_64_0
					end
				end

				arg_61_1.text_.text = var_64_4
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201015", "story_v_out_115201.awb") ~= 0 then
					local var_64_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201015", "story_v_out_115201.awb") / 1000

					if var_64_8 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_8 + var_64_0
					end

					if var_64_3.prefab_name ~= "" and arg_61_1.actors_[var_64_3.prefab_name] ~= nil then
						local var_64_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_3.prefab_name].transform, "story_v_out_115201", "115201015", "story_v_out_115201.awb")

						arg_61_1:RecordAudio("115201015", var_64_9)
						arg_61_1:RecordAudio("115201015", var_64_9)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_115201", "115201015", "story_v_out_115201.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_115201", "115201015", "story_v_out_115201.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_10 = math.max(var_64_1, arg_61_1.talkMaxDuration)

			if var_64_0 <= arg_61_1.time_ and arg_61_1.time_ < var_64_0 + var_64_10 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_0) / var_64_10

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_0 + var_64_10 and arg_61_1.time_ < var_64_0 + var_64_10 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play115201016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 115201016
		arg_65_1.duration_ = 4.366

		local var_65_0 = {
			ja = 3.9,
			ko = 3.666,
			zh = 3.7,
			en = 4.366
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
				arg_65_0:Play115201017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = manager.ui.mainCamera.transform
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 then
				arg_65_1.var_.shakeOldPos = var_68_0.localPosition
			end

			local var_68_2 = 0.6

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / 0.066
				local var_68_4, var_68_5 = math.modf(var_68_3)

				var_68_0.localPosition = Vector3.New(var_68_5 * 0.13, var_68_5 * 0.13, var_68_5 * 0.13) + arg_65_1.var_.shakeOldPos
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 then
				var_68_0.localPosition = arg_65_1.var_.shakeOldPos
			end

			local var_68_6 = 0

			if var_68_6 < arg_65_1.time_ and arg_65_1.time_ <= var_68_6 + arg_68_0 then
				arg_65_1.allBtn_.enabled = false
			end

			local var_68_7 = 0.6

			if arg_65_1.time_ >= var_68_6 + var_68_7 and arg_65_1.time_ < var_68_6 + var_68_7 + arg_68_0 then
				arg_65_1.allBtn_.enabled = true
			end

			local var_68_8 = 0
			local var_68_9 = 0.35

			if var_68_8 < arg_65_1.time_ and arg_65_1.time_ <= var_68_8 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_10 = arg_65_1:FormatText(StoryNameCfg[260].name)

				arg_65_1.leftNameTxt_.text = var_68_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, true)
				arg_65_1.iconController_:SetSelectedState("hero")

				arg_65_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1016")

				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_11 = arg_65_1:GetWordFromCfg(115201016)
				local var_68_12 = arg_65_1:FormatText(var_68_11.content)

				arg_65_1.text_.text = var_68_12

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_13 = 14
				local var_68_14 = utf8.len(var_68_12)
				local var_68_15 = var_68_13 <= 0 and var_68_9 or var_68_9 * (var_68_14 / var_68_13)

				if var_68_15 > 0 and var_68_9 < var_68_15 then
					arg_65_1.talkMaxDuration = var_68_15

					if var_68_15 + var_68_8 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_15 + var_68_8
					end
				end

				arg_65_1.text_.text = var_68_12
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201016", "story_v_out_115201.awb") ~= 0 then
					local var_68_16 = manager.audio:GetVoiceLength("story_v_out_115201", "115201016", "story_v_out_115201.awb") / 1000

					if var_68_16 + var_68_8 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_16 + var_68_8
					end

					if var_68_11.prefab_name ~= "" and arg_65_1.actors_[var_68_11.prefab_name] ~= nil then
						local var_68_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_11.prefab_name].transform, "story_v_out_115201", "115201016", "story_v_out_115201.awb")

						arg_65_1:RecordAudio("115201016", var_68_17)
						arg_65_1:RecordAudio("115201016", var_68_17)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_115201", "115201016", "story_v_out_115201.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_115201", "115201016", "story_v_out_115201.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_18 = math.max(var_68_9, arg_65_1.talkMaxDuration)

			if var_68_8 <= arg_65_1.time_ and arg_65_1.time_ < var_68_8 + var_68_18 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_8) / var_68_18

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_8 + var_68_18 and arg_65_1.time_ < var_68_8 + var_68_18 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play115201017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 115201017
		arg_69_1.duration_ = 5.733

		local var_69_0 = {
			ja = 5.733,
			ko = 3.9,
			zh = 3,
			en = 3.7
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
				arg_69_0:Play115201018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = 0.2

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_2 = arg_69_1:FormatText(StoryNameCfg[263].name)

				arg_69_1.leftNameTxt_.text = var_72_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, true)
				arg_69_1.iconController_:SetSelectedState("hero")

				arg_69_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1052")

				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_3 = arg_69_1:GetWordFromCfg(115201017)
				local var_72_4 = arg_69_1:FormatText(var_72_3.content)

				arg_69_1.text_.text = var_72_4

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_5 = 8
				local var_72_6 = utf8.len(var_72_4)
				local var_72_7 = var_72_5 <= 0 and var_72_1 or var_72_1 * (var_72_6 / var_72_5)

				if var_72_7 > 0 and var_72_1 < var_72_7 then
					arg_69_1.talkMaxDuration = var_72_7

					if var_72_7 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_7 + var_72_0
					end
				end

				arg_69_1.text_.text = var_72_4
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201017", "story_v_out_115201.awb") ~= 0 then
					local var_72_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201017", "story_v_out_115201.awb") / 1000

					if var_72_8 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_8 + var_72_0
					end

					if var_72_3.prefab_name ~= "" and arg_69_1.actors_[var_72_3.prefab_name] ~= nil then
						local var_72_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_3.prefab_name].transform, "story_v_out_115201", "115201017", "story_v_out_115201.awb")

						arg_69_1:RecordAudio("115201017", var_72_9)
						arg_69_1:RecordAudio("115201017", var_72_9)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_115201", "115201017", "story_v_out_115201.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_115201", "115201017", "story_v_out_115201.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_10 = math.max(var_72_1, arg_69_1.talkMaxDuration)

			if var_72_0 <= arg_69_1.time_ and arg_69_1.time_ < var_72_0 + var_72_10 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_0) / var_72_10

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_0 + var_72_10 and arg_69_1.time_ < var_72_0 + var_72_10 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play115201018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 115201018
		arg_73_1.duration_ = 5

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play115201019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 0.65

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, false)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_2 = arg_73_1:GetWordFromCfg(115201018)
				local var_76_3 = arg_73_1:FormatText(var_76_2.content)

				arg_73_1.text_.text = var_76_3

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_4 = 26
				local var_76_5 = utf8.len(var_76_3)
				local var_76_6 = var_76_4 <= 0 and var_76_1 or var_76_1 * (var_76_5 / var_76_4)

				if var_76_6 > 0 and var_76_1 < var_76_6 then
					arg_73_1.talkMaxDuration = var_76_6

					if var_76_6 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_6 + var_76_0
					end
				end

				arg_73_1.text_.text = var_76_3
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)
				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_7 = math.max(var_76_1, arg_73_1.talkMaxDuration)

			if var_76_0 <= arg_73_1.time_ and arg_73_1.time_ < var_76_0 + var_76_7 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_0) / var_76_7

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_0 + var_76_7 and arg_73_1.time_ < var_76_0 + var_76_7 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play115201019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 115201019
		arg_77_1.duration_ = 2.9

		local var_77_0 = {
			ja = 2.633,
			ko = 2.9,
			zh = 2.1,
			en = 2.8
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
				arg_77_0:Play115201020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = "1052ui_story"

			if arg_77_1.actors_[var_80_0] == nil then
				local var_80_1 = Object.Instantiate(Asset.Load("Char/" .. var_80_0), arg_77_1.stage_.transform)

				var_80_1.name = var_80_0
				var_80_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_77_1.actors_[var_80_0] = var_80_1

				local var_80_2 = var_80_1:GetComponentInChildren(typeof(CharacterEffect))

				var_80_2.enabled = true

				local var_80_3 = GameObjectTools.GetOrAddComponent(var_80_1, typeof(DynamicBoneHelper))

				if var_80_3 then
					var_80_3:EnableDynamicBone(false)
				end

				arg_77_1:ShowWeapon(var_80_2.transform, false)

				arg_77_1.var_[var_80_0 .. "Animator"] = var_80_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_77_1.var_[var_80_0 .. "Animator"].applyRootMotion = true
				arg_77_1.var_[var_80_0 .. "LipSync"] = var_80_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_80_4 = arg_77_1.actors_["1052ui_story"].transform
			local var_80_5 = 0

			if var_80_5 < arg_77_1.time_ and arg_77_1.time_ <= var_80_5 + arg_80_0 then
				arg_77_1.var_.moveOldPos1052ui_story = var_80_4.localPosition
			end

			local var_80_6 = 0.001

			if var_80_5 <= arg_77_1.time_ and arg_77_1.time_ < var_80_5 + var_80_6 then
				local var_80_7 = (arg_77_1.time_ - var_80_5) / var_80_6
				local var_80_8 = Vector3.New(0, -1.05, -6.2)

				var_80_4.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos1052ui_story, var_80_8, var_80_7)

				local var_80_9 = manager.ui.mainCamera.transform.position - var_80_4.position

				var_80_4.forward = Vector3.New(var_80_9.x, var_80_9.y, var_80_9.z)

				local var_80_10 = var_80_4.localEulerAngles

				var_80_10.z = 0
				var_80_10.x = 0
				var_80_4.localEulerAngles = var_80_10
			end

			if arg_77_1.time_ >= var_80_5 + var_80_6 and arg_77_1.time_ < var_80_5 + var_80_6 + arg_80_0 then
				var_80_4.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_80_11 = manager.ui.mainCamera.transform.position - var_80_4.position

				var_80_4.forward = Vector3.New(var_80_11.x, var_80_11.y, var_80_11.z)

				local var_80_12 = var_80_4.localEulerAngles

				var_80_12.z = 0
				var_80_12.x = 0
				var_80_4.localEulerAngles = var_80_12
			end

			local var_80_13 = 0

			if var_80_13 < arg_77_1.time_ and arg_77_1.time_ <= var_80_13 + arg_80_0 then
				arg_77_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_80_14 = 0

			if var_80_14 < arg_77_1.time_ and arg_77_1.time_ <= var_80_14 + arg_80_0 then
				arg_77_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action1_1")
			end

			local var_80_15 = arg_77_1.actors_["1052ui_story"]
			local var_80_16 = 0

			if var_80_16 < arg_77_1.time_ and arg_77_1.time_ <= var_80_16 + arg_80_0 and arg_77_1.var_.characterEffect1052ui_story == nil then
				arg_77_1.var_.characterEffect1052ui_story = var_80_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_17 = 0.2

			if var_80_16 <= arg_77_1.time_ and arg_77_1.time_ < var_80_16 + var_80_17 then
				local var_80_18 = (arg_77_1.time_ - var_80_16) / var_80_17

				if arg_77_1.var_.characterEffect1052ui_story then
					arg_77_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_16 + var_80_17 and arg_77_1.time_ < var_80_16 + var_80_17 + arg_80_0 and arg_77_1.var_.characterEffect1052ui_story then
				arg_77_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_80_19 = 0
			local var_80_20 = 0.25

			if var_80_19 < arg_77_1.time_ and arg_77_1.time_ <= var_80_19 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_21 = arg_77_1:FormatText(StoryNameCfg[263].name)

				arg_77_1.leftNameTxt_.text = var_80_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_22 = arg_77_1:GetWordFromCfg(115201019)
				local var_80_23 = arg_77_1:FormatText(var_80_22.content)

				arg_77_1.text_.text = var_80_23

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_24 = 10
				local var_80_25 = utf8.len(var_80_23)
				local var_80_26 = var_80_24 <= 0 and var_80_20 or var_80_20 * (var_80_25 / var_80_24)

				if var_80_26 > 0 and var_80_20 < var_80_26 then
					arg_77_1.talkMaxDuration = var_80_26

					if var_80_26 + var_80_19 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_26 + var_80_19
					end
				end

				arg_77_1.text_.text = var_80_23
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201019", "story_v_out_115201.awb") ~= 0 then
					local var_80_27 = manager.audio:GetVoiceLength("story_v_out_115201", "115201019", "story_v_out_115201.awb") / 1000

					if var_80_27 + var_80_19 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_27 + var_80_19
					end

					if var_80_22.prefab_name ~= "" and arg_77_1.actors_[var_80_22.prefab_name] ~= nil then
						local var_80_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_22.prefab_name].transform, "story_v_out_115201", "115201019", "story_v_out_115201.awb")

						arg_77_1:RecordAudio("115201019", var_80_28)
						arg_77_1:RecordAudio("115201019", var_80_28)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_115201", "115201019", "story_v_out_115201.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_115201", "115201019", "story_v_out_115201.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_29 = math.max(var_80_20, arg_77_1.talkMaxDuration)

			if var_80_19 <= arg_77_1.time_ and arg_77_1.time_ < var_80_19 + var_80_29 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_19) / var_80_29

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_19 + var_80_29 and arg_77_1.time_ < var_80_19 + var_80_29 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play115201020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 115201020
		arg_81_1.duration_ = 5.133

		local var_81_0 = {
			ja = 5.133,
			ko = 4.7,
			zh = 4.233,
			en = 4.066
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
				arg_81_0:Play115201021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["1052ui_story"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.characterEffect1052ui_story == nil then
				arg_81_1.var_.characterEffect1052ui_story = var_84_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_2 = 0.2

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.characterEffect1052ui_story then
					local var_84_4 = Mathf.Lerp(0, 0.5, var_84_3)

					arg_81_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_81_1.var_.characterEffect1052ui_story.fillRatio = var_84_4
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.characterEffect1052ui_story then
				local var_84_5 = 0.5

				arg_81_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_81_1.var_.characterEffect1052ui_story.fillRatio = var_84_5
			end

			local var_84_6 = 0
			local var_84_7 = 0.425

			if var_84_6 < arg_81_1.time_ and arg_81_1.time_ <= var_84_6 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_8 = arg_81_1:FormatText(StoryNameCfg[262].name)

				arg_81_1.leftNameTxt_.text = var_84_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, true)
				arg_81_1.iconController_:SetSelectedState("hero")

				arg_81_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2084")

				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_9 = arg_81_1:GetWordFromCfg(115201020)
				local var_84_10 = arg_81_1:FormatText(var_84_9.content)

				arg_81_1.text_.text = var_84_10

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_11 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201020", "story_v_out_115201.awb") ~= 0 then
					local var_84_14 = manager.audio:GetVoiceLength("story_v_out_115201", "115201020", "story_v_out_115201.awb") / 1000

					if var_84_14 + var_84_6 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_14 + var_84_6
					end

					if var_84_9.prefab_name ~= "" and arg_81_1.actors_[var_84_9.prefab_name] ~= nil then
						local var_84_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_9.prefab_name].transform, "story_v_out_115201", "115201020", "story_v_out_115201.awb")

						arg_81_1:RecordAudio("115201020", var_84_15)
						arg_81_1:RecordAudio("115201020", var_84_15)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_115201", "115201020", "story_v_out_115201.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_115201", "115201020", "story_v_out_115201.awb")
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
	Play115201021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 115201021
		arg_85_1.duration_ = 4.9

		local var_85_0 = {
			ja = 4.9,
			ko = 4.733,
			zh = 3.733,
			en = 4.466
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
				arg_85_0:Play115201022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 0.4

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_2 = arg_85_1:FormatText(StoryNameCfg[291].name)

				arg_85_1.leftNameTxt_.text = var_88_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, true)
				arg_85_1.iconController_:SetSelectedState("hero")

				arg_85_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2084")

				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_3 = arg_85_1:GetWordFromCfg(115201021)
				local var_88_4 = arg_85_1:FormatText(var_88_3.content)

				arg_85_1.text_.text = var_88_4

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_5 = 15
				local var_88_6 = utf8.len(var_88_4)
				local var_88_7 = var_88_5 <= 0 and var_88_1 or var_88_1 * (var_88_6 / var_88_5)

				if var_88_7 > 0 and var_88_1 < var_88_7 then
					arg_85_1.talkMaxDuration = var_88_7

					if var_88_7 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_7 + var_88_0
					end
				end

				arg_85_1.text_.text = var_88_4
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201021", "story_v_out_115201.awb") ~= 0 then
					local var_88_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201021", "story_v_out_115201.awb") / 1000

					if var_88_8 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_8 + var_88_0
					end

					if var_88_3.prefab_name ~= "" and arg_85_1.actors_[var_88_3.prefab_name] ~= nil then
						local var_88_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_3.prefab_name].transform, "story_v_out_115201", "115201021", "story_v_out_115201.awb")

						arg_85_1:RecordAudio("115201021", var_88_9)
						arg_85_1:RecordAudio("115201021", var_88_9)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_115201", "115201021", "story_v_out_115201.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_115201", "115201021", "story_v_out_115201.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_10 = math.max(var_88_1, arg_85_1.talkMaxDuration)

			if var_88_0 <= arg_85_1.time_ and arg_85_1.time_ < var_88_0 + var_88_10 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_0) / var_88_10

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_0 + var_88_10 and arg_85_1.time_ < var_88_0 + var_88_10 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play115201022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 115201022
		arg_89_1.duration_ = 6.6

		local var_89_0 = {
			ja = 6.6,
			ko = 4.033,
			zh = 3.233,
			en = 5.666
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
				arg_89_0:Play115201023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_92_1 = arg_89_1.actors_["1052ui_story"]
			local var_92_2 = 0

			if var_92_2 < arg_89_1.time_ and arg_89_1.time_ <= var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect1052ui_story == nil then
				arg_89_1.var_.characterEffect1052ui_story = var_92_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_3 = 0.2

			if var_92_2 <= arg_89_1.time_ and arg_89_1.time_ < var_92_2 + var_92_3 then
				local var_92_4 = (arg_89_1.time_ - var_92_2) / var_92_3

				if arg_89_1.var_.characterEffect1052ui_story then
					arg_89_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_2 + var_92_3 and arg_89_1.time_ < var_92_2 + var_92_3 + arg_92_0 and arg_89_1.var_.characterEffect1052ui_story then
				arg_89_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_92_5 = 0

			if var_92_5 < arg_89_1.time_ and arg_89_1.time_ <= var_92_5 + arg_92_0 then
				arg_89_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action2_1")
			end

			local var_92_6 = arg_89_1.actors_["1052ui_story"].transform
			local var_92_7 = 0

			if var_92_7 < arg_89_1.time_ and arg_89_1.time_ <= var_92_7 + arg_92_0 then
				arg_89_1.var_.moveOldPos1052ui_story = var_92_6.localPosition

				local var_92_8 = "1052ui_story"

				arg_89_1:ShowWeapon(arg_89_1.var_[var_92_8 .. "Animator"].transform, true)
			end

			local var_92_9 = 0.001

			if var_92_7 <= arg_89_1.time_ and arg_89_1.time_ < var_92_7 + var_92_9 then
				local var_92_10 = (arg_89_1.time_ - var_92_7) / var_92_9
				local var_92_11 = Vector3.New(0, -1.05, -6.2)

				var_92_6.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1052ui_story, var_92_11, var_92_10)

				local var_92_12 = manager.ui.mainCamera.transform.position - var_92_6.position

				var_92_6.forward = Vector3.New(var_92_12.x, var_92_12.y, var_92_12.z)

				local var_92_13 = var_92_6.localEulerAngles

				var_92_13.z = 0
				var_92_13.x = 0
				var_92_6.localEulerAngles = var_92_13
			end

			if arg_89_1.time_ >= var_92_7 + var_92_9 and arg_89_1.time_ < var_92_7 + var_92_9 + arg_92_0 then
				var_92_6.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_92_14 = manager.ui.mainCamera.transform.position - var_92_6.position

				var_92_6.forward = Vector3.New(var_92_14.x, var_92_14.y, var_92_14.z)

				local var_92_15 = var_92_6.localEulerAngles

				var_92_15.z = 0
				var_92_15.x = 0
				var_92_6.localEulerAngles = var_92_15
			end

			local var_92_16 = 0
			local var_92_17 = 0.35

			if var_92_16 < arg_89_1.time_ and arg_89_1.time_ <= var_92_16 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_18 = arg_89_1:FormatText(StoryNameCfg[263].name)

				arg_89_1.leftNameTxt_.text = var_92_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_19 = arg_89_1:GetWordFromCfg(115201022)
				local var_92_20 = arg_89_1:FormatText(var_92_19.content)

				arg_89_1.text_.text = var_92_20

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_21 = 14
				local var_92_22 = utf8.len(var_92_20)
				local var_92_23 = var_92_21 <= 0 and var_92_17 or var_92_17 * (var_92_22 / var_92_21)

				if var_92_23 > 0 and var_92_17 < var_92_23 then
					arg_89_1.talkMaxDuration = var_92_23

					if var_92_23 + var_92_16 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_23 + var_92_16
					end
				end

				arg_89_1.text_.text = var_92_20
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201022", "story_v_out_115201.awb") ~= 0 then
					local var_92_24 = manager.audio:GetVoiceLength("story_v_out_115201", "115201022", "story_v_out_115201.awb") / 1000

					if var_92_24 + var_92_16 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_24 + var_92_16
					end

					if var_92_19.prefab_name ~= "" and arg_89_1.actors_[var_92_19.prefab_name] ~= nil then
						local var_92_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_19.prefab_name].transform, "story_v_out_115201", "115201022", "story_v_out_115201.awb")

						arg_89_1:RecordAudio("115201022", var_92_25)
						arg_89_1:RecordAudio("115201022", var_92_25)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_115201", "115201022", "story_v_out_115201.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_115201", "115201022", "story_v_out_115201.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_26 = math.max(var_92_17, arg_89_1.talkMaxDuration)

			if var_92_16 <= arg_89_1.time_ and arg_89_1.time_ < var_92_16 + var_92_26 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_16) / var_92_26

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_16 + var_92_26 and arg_89_1.time_ < var_92_16 + var_92_26 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play115201023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 115201023
		arg_93_1.duration_ = 7.9

		local var_93_0 = {
			ja = 5.566,
			ko = 3.633,
			zh = 3.266,
			en = 7.9
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
				arg_93_0:Play115201024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1052ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.characterEffect1052ui_story == nil then
				arg_93_1.var_.characterEffect1052ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.2

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect1052ui_story then
					local var_96_4 = Mathf.Lerp(0, 0.5, var_96_3)

					arg_93_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_93_1.var_.characterEffect1052ui_story.fillRatio = var_96_4
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect1052ui_story then
				local var_96_5 = 0.5

				arg_93_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_93_1.var_.characterEffect1052ui_story.fillRatio = var_96_5
			end

			local var_96_6 = arg_93_1.actors_["1052ui_story"].transform
			local var_96_7 = 0

			if var_96_7 < arg_93_1.time_ and arg_93_1.time_ <= var_96_7 + arg_96_0 then
				arg_93_1.var_.moveOldPos1052ui_story = var_96_6.localPosition
			end

			local var_96_8 = 0.001

			if var_96_7 <= arg_93_1.time_ and arg_93_1.time_ < var_96_7 + var_96_8 then
				local var_96_9 = (arg_93_1.time_ - var_96_7) / var_96_8
				local var_96_10 = Vector3.New(0, 100, 0)

				var_96_6.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1052ui_story, var_96_10, var_96_9)

				local var_96_11 = manager.ui.mainCamera.transform.position - var_96_6.position

				var_96_6.forward = Vector3.New(var_96_11.x, var_96_11.y, var_96_11.z)

				local var_96_12 = var_96_6.localEulerAngles

				var_96_12.z = 0
				var_96_12.x = 0
				var_96_6.localEulerAngles = var_96_12
			end

			if arg_93_1.time_ >= var_96_7 + var_96_8 and arg_93_1.time_ < var_96_7 + var_96_8 + arg_96_0 then
				var_96_6.localPosition = Vector3.New(0, 100, 0)

				local var_96_13 = manager.ui.mainCamera.transform.position - var_96_6.position

				var_96_6.forward = Vector3.New(var_96_13.x, var_96_13.y, var_96_13.z)

				local var_96_14 = var_96_6.localEulerAngles

				var_96_14.z = 0
				var_96_14.x = 0
				var_96_6.localEulerAngles = var_96_14
			end

			local var_96_15 = 0
			local var_96_16 = 0.375

			if var_96_15 < arg_93_1.time_ and arg_93_1.time_ <= var_96_15 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_17 = arg_93_1:FormatText(StoryNameCfg[292].name)

				arg_93_1.leftNameTxt_.text = var_96_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, true)
				arg_93_1.iconController_:SetSelectedState("hero")

				arg_93_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2084")

				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_18 = arg_93_1:GetWordFromCfg(115201023)
				local var_96_19 = arg_93_1:FormatText(var_96_18.content)

				arg_93_1.text_.text = var_96_19

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_20 = 15
				local var_96_21 = utf8.len(var_96_19)
				local var_96_22 = var_96_20 <= 0 and var_96_16 or var_96_16 * (var_96_21 / var_96_20)

				if var_96_22 > 0 and var_96_16 < var_96_22 then
					arg_93_1.talkMaxDuration = var_96_22

					if var_96_22 + var_96_15 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_22 + var_96_15
					end
				end

				arg_93_1.text_.text = var_96_19
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201023", "story_v_out_115201.awb") ~= 0 then
					local var_96_23 = manager.audio:GetVoiceLength("story_v_out_115201", "115201023", "story_v_out_115201.awb") / 1000

					if var_96_23 + var_96_15 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_23 + var_96_15
					end

					if var_96_18.prefab_name ~= "" and arg_93_1.actors_[var_96_18.prefab_name] ~= nil then
						local var_96_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_18.prefab_name].transform, "story_v_out_115201", "115201023", "story_v_out_115201.awb")

						arg_93_1:RecordAudio("115201023", var_96_24)
						arg_93_1:RecordAudio("115201023", var_96_24)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_115201", "115201023", "story_v_out_115201.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_115201", "115201023", "story_v_out_115201.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_25 = math.max(var_96_16, arg_93_1.talkMaxDuration)

			if var_96_15 <= arg_93_1.time_ and arg_93_1.time_ < var_96_15 + var_96_25 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_15) / var_96_25

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_15 + var_96_25 and arg_93_1.time_ < var_96_15 + var_96_25 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play115201024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 115201024
		arg_97_1.duration_ = 5

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play115201025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = manager.ui.mainCamera.transform
			local var_100_1 = 0.666666666666667

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 then
				arg_97_1.var_.shakeOldPos = var_100_0.localPosition
			end

			local var_100_2 = 1

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / 0.066
				local var_100_4, var_100_5 = math.modf(var_100_3)

				var_100_0.localPosition = Vector3.New(var_100_5 * 0.13, var_100_5 * 0.13, var_100_5 * 0.13) + arg_97_1.var_.shakeOldPos
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 then
				var_100_0.localPosition = arg_97_1.var_.shakeOldPos
			end

			local var_100_6 = 0.666666666666667
			local var_100_7 = 0.833333333333333

			if var_100_6 < arg_97_1.time_ and arg_97_1.time_ <= var_100_6 + arg_100_0 then
				local var_100_8 = "play"
				local var_100_9 = "effect"

				arg_97_1:AudioAction(var_100_8, var_100_9, "se_story_15", "se_story_15_gun02", "")
			end

			local var_100_10 = 0

			if var_100_10 < arg_97_1.time_ and arg_97_1.time_ <= var_100_10 + arg_100_0 then
				arg_97_1.allBtn_.enabled = false
			end

			local var_100_11 = 1.66666666666667

			if arg_97_1.time_ >= var_100_10 + var_100_11 and arg_97_1.time_ < var_100_10 + var_100_11 + arg_100_0 then
				arg_97_1.allBtn_.enabled = true
			end

			local var_100_12 = 0
			local var_100_13 = 1.5

			if var_100_12 < arg_97_1.time_ and arg_97_1.time_ <= var_100_12 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, false)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_14 = arg_97_1:GetWordFromCfg(115201024)
				local var_100_15 = arg_97_1:FormatText(var_100_14.content)

				arg_97_1.text_.text = var_100_15

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_16 = 60
				local var_100_17 = utf8.len(var_100_15)
				local var_100_18 = var_100_16 <= 0 and var_100_13 or var_100_13 * (var_100_17 / var_100_16)

				if var_100_18 > 0 and var_100_13 < var_100_18 then
					arg_97_1.talkMaxDuration = var_100_18

					if var_100_18 + var_100_12 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_18 + var_100_12
					end
				end

				arg_97_1.text_.text = var_100_15
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)
				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_19 = math.max(var_100_13, arg_97_1.talkMaxDuration)

			if var_100_12 <= arg_97_1.time_ and arg_97_1.time_ < var_100_12 + var_100_19 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_12) / var_100_19

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_12 + var_100_19 and arg_97_1.time_ < var_100_12 + var_100_19 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play115201025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 115201025
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play115201026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0.675
			local var_104_1 = 1

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				local var_104_2 = "play"
				local var_104_3 = "effect"

				arg_101_1:AudioAction(var_104_2, var_104_3, "se_story_15", "se_story_15_repel", "")
			end

			local var_104_4 = 0
			local var_104_5 = 1.675

			if var_104_4 < arg_101_1.time_ and arg_101_1.time_ <= var_104_4 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, false)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_6 = arg_101_1:GetWordFromCfg(115201025)
				local var_104_7 = arg_101_1:FormatText(var_104_6.content)

				arg_101_1.text_.text = var_104_7

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_8 = 67
				local var_104_9 = utf8.len(var_104_7)
				local var_104_10 = var_104_8 <= 0 and var_104_5 or var_104_5 * (var_104_9 / var_104_8)

				if var_104_10 > 0 and var_104_5 < var_104_10 then
					arg_101_1.talkMaxDuration = var_104_10

					if var_104_10 + var_104_4 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_10 + var_104_4
					end
				end

				arg_101_1.text_.text = var_104_7
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)
				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_11 = math.max(var_104_5, arg_101_1.talkMaxDuration)

			if var_104_4 <= arg_101_1.time_ and arg_101_1.time_ < var_104_4 + var_104_11 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_4) / var_104_11

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_4 + var_104_11 and arg_101_1.time_ < var_104_4 + var_104_11 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play115201026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 115201026
		arg_105_1.duration_ = 4.766

		local var_105_0 = {
			ja = 4.766,
			ko = 4.466,
			zh = 3.033,
			en = 4.3
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
				arg_105_0:Play115201027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = "4010ui_story"

			if arg_105_1.actors_[var_108_0] == nil then
				local var_108_1 = Object.Instantiate(Asset.Load("Char/" .. var_108_0), arg_105_1.stage_.transform)

				var_108_1.name = var_108_0
				var_108_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_105_1.actors_[var_108_0] = var_108_1

				local var_108_2 = var_108_1:GetComponentInChildren(typeof(CharacterEffect))

				var_108_2.enabled = true

				local var_108_3 = GameObjectTools.GetOrAddComponent(var_108_1, typeof(DynamicBoneHelper))

				if var_108_3 then
					var_108_3:EnableDynamicBone(false)
				end

				arg_105_1:ShowWeapon(var_108_2.transform, false)

				arg_105_1.var_[var_108_0 .. "Animator"] = var_108_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_105_1.var_[var_108_0 .. "Animator"].applyRootMotion = true
				arg_105_1.var_[var_108_0 .. "LipSync"] = var_108_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_108_4 = arg_105_1.actors_["4010ui_story"].transform
			local var_108_5 = 0

			if var_108_5 < arg_105_1.time_ and arg_105_1.time_ <= var_108_5 + arg_108_0 then
				arg_105_1.var_.moveOldPos4010ui_story = var_108_4.localPosition
			end

			local var_108_6 = 0.001

			if var_108_5 <= arg_105_1.time_ and arg_105_1.time_ < var_108_5 + var_108_6 then
				local var_108_7 = (arg_105_1.time_ - var_108_5) / var_108_6
				local var_108_8 = Vector3.New(-0.7, -1.59, -5.2)

				var_108_4.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos4010ui_story, var_108_8, var_108_7)

				local var_108_9 = manager.ui.mainCamera.transform.position - var_108_4.position

				var_108_4.forward = Vector3.New(var_108_9.x, var_108_9.y, var_108_9.z)

				local var_108_10 = var_108_4.localEulerAngles

				var_108_10.z = 0
				var_108_10.x = 0
				var_108_4.localEulerAngles = var_108_10
			end

			if arg_105_1.time_ >= var_108_5 + var_108_6 and arg_105_1.time_ < var_108_5 + var_108_6 + arg_108_0 then
				var_108_4.localPosition = Vector3.New(-0.7, -1.59, -5.2)

				local var_108_11 = manager.ui.mainCamera.transform.position - var_108_4.position

				var_108_4.forward = Vector3.New(var_108_11.x, var_108_11.y, var_108_11.z)

				local var_108_12 = var_108_4.localEulerAngles

				var_108_12.z = 0
				var_108_12.x = 0
				var_108_4.localEulerAngles = var_108_12
			end

			local var_108_13 = 0

			if var_108_13 < arg_105_1.time_ and arg_105_1.time_ <= var_108_13 + arg_108_0 then
				arg_105_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action1_1")
			end

			local var_108_14 = 0

			if var_108_14 < arg_105_1.time_ and arg_105_1.time_ <= var_108_14 + arg_108_0 then
				arg_105_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_108_15 = arg_105_1.actors_["4010ui_story"]
			local var_108_16 = 0

			if var_108_16 < arg_105_1.time_ and arg_105_1.time_ <= var_108_16 + arg_108_0 and arg_105_1.var_.characterEffect4010ui_story == nil then
				arg_105_1.var_.characterEffect4010ui_story = var_108_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_17 = 0.2

			if var_108_16 <= arg_105_1.time_ and arg_105_1.time_ < var_108_16 + var_108_17 then
				local var_108_18 = (arg_105_1.time_ - var_108_16) / var_108_17

				if arg_105_1.var_.characterEffect4010ui_story then
					arg_105_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_16 + var_108_17 and arg_105_1.time_ < var_108_16 + var_108_17 + arg_108_0 and arg_105_1.var_.characterEffect4010ui_story then
				arg_105_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_108_19 = 0
			local var_108_20 = 0.325

			if var_108_19 < arg_105_1.time_ and arg_105_1.time_ <= var_108_19 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_21 = arg_105_1:FormatText(StoryNameCfg[42].name)

				arg_105_1.leftNameTxt_.text = var_108_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_22 = arg_105_1:GetWordFromCfg(115201026)
				local var_108_23 = arg_105_1:FormatText(var_108_22.content)

				arg_105_1.text_.text = var_108_23

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_24 = 13
				local var_108_25 = utf8.len(var_108_23)
				local var_108_26 = var_108_24 <= 0 and var_108_20 or var_108_20 * (var_108_25 / var_108_24)

				if var_108_26 > 0 and var_108_20 < var_108_26 then
					arg_105_1.talkMaxDuration = var_108_26

					if var_108_26 + var_108_19 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_26 + var_108_19
					end
				end

				arg_105_1.text_.text = var_108_23
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201026", "story_v_out_115201.awb") ~= 0 then
					local var_108_27 = manager.audio:GetVoiceLength("story_v_out_115201", "115201026", "story_v_out_115201.awb") / 1000

					if var_108_27 + var_108_19 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_27 + var_108_19
					end

					if var_108_22.prefab_name ~= "" and arg_105_1.actors_[var_108_22.prefab_name] ~= nil then
						local var_108_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_22.prefab_name].transform, "story_v_out_115201", "115201026", "story_v_out_115201.awb")

						arg_105_1:RecordAudio("115201026", var_108_28)
						arg_105_1:RecordAudio("115201026", var_108_28)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_115201", "115201026", "story_v_out_115201.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_115201", "115201026", "story_v_out_115201.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_29 = math.max(var_108_20, arg_105_1.talkMaxDuration)

			if var_108_19 <= arg_105_1.time_ and arg_105_1.time_ < var_108_19 + var_108_29 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_19) / var_108_29

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_19 + var_108_29 and arg_105_1.time_ < var_108_19 + var_108_29 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play115201027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 115201027
		arg_109_1.duration_ = 5.966

		local var_109_0 = {
			ja = 4.333,
			ko = 4.666,
			zh = 5.966,
			en = 4.3
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
				arg_109_0:Play115201028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1052ui_story"].transform
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 then
				arg_109_1.var_.moveOldPos1052ui_story = var_112_0.localPosition

				local var_112_2 = "1052ui_story"

				arg_109_1:ShowWeapon(arg_109_1.var_[var_112_2 .. "Animator"].transform, false)
			end

			local var_112_3 = 0.001

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_3 then
				local var_112_4 = (arg_109_1.time_ - var_112_1) / var_112_3
				local var_112_5 = Vector3.New(0.7, -1.05, -6.2)

				var_112_0.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1052ui_story, var_112_5, var_112_4)

				local var_112_6 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_6.x, var_112_6.y, var_112_6.z)

				local var_112_7 = var_112_0.localEulerAngles

				var_112_7.z = 0
				var_112_7.x = 0
				var_112_0.localEulerAngles = var_112_7
			end

			if arg_109_1.time_ >= var_112_1 + var_112_3 and arg_109_1.time_ < var_112_1 + var_112_3 + arg_112_0 then
				var_112_0.localPosition = Vector3.New(0.7, -1.05, -6.2)

				local var_112_8 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_8.x, var_112_8.y, var_112_8.z)

				local var_112_9 = var_112_0.localEulerAngles

				var_112_9.z = 0
				var_112_9.x = 0
				var_112_0.localEulerAngles = var_112_9
			end

			local var_112_10 = 0

			if var_112_10 < arg_109_1.time_ and arg_109_1.time_ <= var_112_10 + arg_112_0 then
				arg_109_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_112_11 = 0

			if var_112_11 < arg_109_1.time_ and arg_109_1.time_ <= var_112_11 + arg_112_0 then
				arg_109_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action1_1")
			end

			local var_112_12 = arg_109_1.actors_["1052ui_story"]
			local var_112_13 = 0

			if var_112_13 < arg_109_1.time_ and arg_109_1.time_ <= var_112_13 + arg_112_0 and arg_109_1.var_.characterEffect1052ui_story == nil then
				arg_109_1.var_.characterEffect1052ui_story = var_112_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_14 = 0.2

			if var_112_13 <= arg_109_1.time_ and arg_109_1.time_ < var_112_13 + var_112_14 then
				local var_112_15 = (arg_109_1.time_ - var_112_13) / var_112_14

				if arg_109_1.var_.characterEffect1052ui_story then
					arg_109_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_13 + var_112_14 and arg_109_1.time_ < var_112_13 + var_112_14 + arg_112_0 and arg_109_1.var_.characterEffect1052ui_story then
				arg_109_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_112_16 = arg_109_1.actors_["4010ui_story"]
			local var_112_17 = 0

			if var_112_17 < arg_109_1.time_ and arg_109_1.time_ <= var_112_17 + arg_112_0 and arg_109_1.var_.characterEffect4010ui_story == nil then
				arg_109_1.var_.characterEffect4010ui_story = var_112_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_18 = 0.2

			if var_112_17 <= arg_109_1.time_ and arg_109_1.time_ < var_112_17 + var_112_18 then
				local var_112_19 = (arg_109_1.time_ - var_112_17) / var_112_18

				if arg_109_1.var_.characterEffect4010ui_story then
					local var_112_20 = Mathf.Lerp(0, 0.5, var_112_19)

					arg_109_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_109_1.var_.characterEffect4010ui_story.fillRatio = var_112_20
				end
			end

			if arg_109_1.time_ >= var_112_17 + var_112_18 and arg_109_1.time_ < var_112_17 + var_112_18 + arg_112_0 and arg_109_1.var_.characterEffect4010ui_story then
				local var_112_21 = 0.5

				arg_109_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_109_1.var_.characterEffect4010ui_story.fillRatio = var_112_21
			end

			local var_112_22 = 0
			local var_112_23 = 0.375

			if var_112_22 < arg_109_1.time_ and arg_109_1.time_ <= var_112_22 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_24 = arg_109_1:FormatText(StoryNameCfg[263].name)

				arg_109_1.leftNameTxt_.text = var_112_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_25 = arg_109_1:GetWordFromCfg(115201027)
				local var_112_26 = arg_109_1:FormatText(var_112_25.content)

				arg_109_1.text_.text = var_112_26

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_27 = 15
				local var_112_28 = utf8.len(var_112_26)
				local var_112_29 = var_112_27 <= 0 and var_112_23 or var_112_23 * (var_112_28 / var_112_27)

				if var_112_29 > 0 and var_112_23 < var_112_29 then
					arg_109_1.talkMaxDuration = var_112_29

					if var_112_29 + var_112_22 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_29 + var_112_22
					end
				end

				arg_109_1.text_.text = var_112_26
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201027", "story_v_out_115201.awb") ~= 0 then
					local var_112_30 = manager.audio:GetVoiceLength("story_v_out_115201", "115201027", "story_v_out_115201.awb") / 1000

					if var_112_30 + var_112_22 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_30 + var_112_22
					end

					if var_112_25.prefab_name ~= "" and arg_109_1.actors_[var_112_25.prefab_name] ~= nil then
						local var_112_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_25.prefab_name].transform, "story_v_out_115201", "115201027", "story_v_out_115201.awb")

						arg_109_1:RecordAudio("115201027", var_112_31)
						arg_109_1:RecordAudio("115201027", var_112_31)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_115201", "115201027", "story_v_out_115201.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_115201", "115201027", "story_v_out_115201.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_32 = math.max(var_112_23, arg_109_1.talkMaxDuration)

			if var_112_22 <= arg_109_1.time_ and arg_109_1.time_ < var_112_22 + var_112_32 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_22) / var_112_32

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_22 + var_112_32 and arg_109_1.time_ < var_112_22 + var_112_32 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play115201028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 115201028
		arg_113_1.duration_ = 8.433

		local var_113_0 = {
			ja = 7.3,
			ko = 7.066,
			zh = 6.466,
			en = 8.433
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
				arg_113_0:Play115201029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action1_1")
			end

			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 then
				arg_113_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_116_2 = arg_113_1.actors_["4010ui_story"]
			local var_116_3 = 0

			if var_116_3 < arg_113_1.time_ and arg_113_1.time_ <= var_116_3 + arg_116_0 and arg_113_1.var_.characterEffect4010ui_story == nil then
				arg_113_1.var_.characterEffect4010ui_story = var_116_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_4 = 0.2

			if var_116_3 <= arg_113_1.time_ and arg_113_1.time_ < var_116_3 + var_116_4 then
				local var_116_5 = (arg_113_1.time_ - var_116_3) / var_116_4

				if arg_113_1.var_.characterEffect4010ui_story then
					arg_113_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_3 + var_116_4 and arg_113_1.time_ < var_116_3 + var_116_4 + arg_116_0 and arg_113_1.var_.characterEffect4010ui_story then
				arg_113_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_116_6 = arg_113_1.actors_["1052ui_story"]
			local var_116_7 = 0

			if var_116_7 < arg_113_1.time_ and arg_113_1.time_ <= var_116_7 + arg_116_0 and arg_113_1.var_.characterEffect1052ui_story == nil then
				arg_113_1.var_.characterEffect1052ui_story = var_116_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_8 = 0.2

			if var_116_7 <= arg_113_1.time_ and arg_113_1.time_ < var_116_7 + var_116_8 then
				local var_116_9 = (arg_113_1.time_ - var_116_7) / var_116_8

				if arg_113_1.var_.characterEffect1052ui_story then
					local var_116_10 = Mathf.Lerp(0, 0.5, var_116_9)

					arg_113_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_113_1.var_.characterEffect1052ui_story.fillRatio = var_116_10
				end
			end

			if arg_113_1.time_ >= var_116_7 + var_116_8 and arg_113_1.time_ < var_116_7 + var_116_8 + arg_116_0 and arg_113_1.var_.characterEffect1052ui_story then
				local var_116_11 = 0.5

				arg_113_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_113_1.var_.characterEffect1052ui_story.fillRatio = var_116_11
			end

			local var_116_12 = 0
			local var_116_13 = 0.775

			if var_116_12 < arg_113_1.time_ and arg_113_1.time_ <= var_116_12 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_14 = arg_113_1:FormatText(StoryNameCfg[42].name)

				arg_113_1.leftNameTxt_.text = var_116_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_15 = arg_113_1:GetWordFromCfg(115201028)
				local var_116_16 = arg_113_1:FormatText(var_116_15.content)

				arg_113_1.text_.text = var_116_16

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_17 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201028", "story_v_out_115201.awb") ~= 0 then
					local var_116_20 = manager.audio:GetVoiceLength("story_v_out_115201", "115201028", "story_v_out_115201.awb") / 1000

					if var_116_20 + var_116_12 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_20 + var_116_12
					end

					if var_116_15.prefab_name ~= "" and arg_113_1.actors_[var_116_15.prefab_name] ~= nil then
						local var_116_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_15.prefab_name].transform, "story_v_out_115201", "115201028", "story_v_out_115201.awb")

						arg_113_1:RecordAudio("115201028", var_116_21)
						arg_113_1:RecordAudio("115201028", var_116_21)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_115201", "115201028", "story_v_out_115201.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_115201", "115201028", "story_v_out_115201.awb")
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
	Play115201029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 115201029
		arg_117_1.duration_ = 5

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play115201030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["4010ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect4010ui_story == nil then
				arg_117_1.var_.characterEffect4010ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.2

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect4010ui_story then
					local var_120_4 = Mathf.Lerp(0, 0.5, var_120_3)

					arg_117_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_117_1.var_.characterEffect4010ui_story.fillRatio = var_120_4
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect4010ui_story then
				local var_120_5 = 0.5

				arg_117_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_117_1.var_.characterEffect4010ui_story.fillRatio = var_120_5
			end

			local var_120_6 = 0
			local var_120_7 = 0.95

			if var_120_6 < arg_117_1.time_ and arg_117_1.time_ <= var_120_6 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, false)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_8 = arg_117_1:GetWordFromCfg(115201029)
				local var_120_9 = arg_117_1:FormatText(var_120_8.content)

				arg_117_1.text_.text = var_120_9

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_10 = 38
				local var_120_11 = utf8.len(var_120_9)
				local var_120_12 = var_120_10 <= 0 and var_120_7 or var_120_7 * (var_120_11 / var_120_10)

				if var_120_12 > 0 and var_120_7 < var_120_12 then
					arg_117_1.talkMaxDuration = var_120_12

					if var_120_12 + var_120_6 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_12 + var_120_6
					end
				end

				arg_117_1.text_.text = var_120_9
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_13 = math.max(var_120_7, arg_117_1.talkMaxDuration)

			if var_120_6 <= arg_117_1.time_ and arg_117_1.time_ < var_120_6 + var_120_13 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_6) / var_120_13

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_6 + var_120_13 and arg_117_1.time_ < var_120_6 + var_120_13 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play115201030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 115201030
		arg_121_1.duration_ = 5.533

		local var_121_0 = {
			ja = 5.533,
			ko = 3.5,
			zh = 3.266,
			en = 5.366
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
				arg_121_0:Play115201031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_124_1 = arg_121_1.actors_["1052ui_story"]
			local var_124_2 = 0

			if var_124_2 < arg_121_1.time_ and arg_121_1.time_ <= var_124_2 + arg_124_0 and arg_121_1.var_.characterEffect1052ui_story == nil then
				arg_121_1.var_.characterEffect1052ui_story = var_124_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_3 = 0.2

			if var_124_2 <= arg_121_1.time_ and arg_121_1.time_ < var_124_2 + var_124_3 then
				local var_124_4 = (arg_121_1.time_ - var_124_2) / var_124_3

				if arg_121_1.var_.characterEffect1052ui_story then
					arg_121_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_2 + var_124_3 and arg_121_1.time_ < var_124_2 + var_124_3 + arg_124_0 and arg_121_1.var_.characterEffect1052ui_story then
				arg_121_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_124_5 = 0
			local var_124_6 = 0.325

			if var_124_5 < arg_121_1.time_ and arg_121_1.time_ <= var_124_5 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_7 = arg_121_1:FormatText(StoryNameCfg[263].name)

				arg_121_1.leftNameTxt_.text = var_124_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_8 = arg_121_1:GetWordFromCfg(115201030)
				local var_124_9 = arg_121_1:FormatText(var_124_8.content)

				arg_121_1.text_.text = var_124_9

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_10 = 13
				local var_124_11 = utf8.len(var_124_9)
				local var_124_12 = var_124_10 <= 0 and var_124_6 or var_124_6 * (var_124_11 / var_124_10)

				if var_124_12 > 0 and var_124_6 < var_124_12 then
					arg_121_1.talkMaxDuration = var_124_12

					if var_124_12 + var_124_5 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_12 + var_124_5
					end
				end

				arg_121_1.text_.text = var_124_9
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201030", "story_v_out_115201.awb") ~= 0 then
					local var_124_13 = manager.audio:GetVoiceLength("story_v_out_115201", "115201030", "story_v_out_115201.awb") / 1000

					if var_124_13 + var_124_5 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_13 + var_124_5
					end

					if var_124_8.prefab_name ~= "" and arg_121_1.actors_[var_124_8.prefab_name] ~= nil then
						local var_124_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_8.prefab_name].transform, "story_v_out_115201", "115201030", "story_v_out_115201.awb")

						arg_121_1:RecordAudio("115201030", var_124_14)
						arg_121_1:RecordAudio("115201030", var_124_14)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_115201", "115201030", "story_v_out_115201.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_115201", "115201030", "story_v_out_115201.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_15 = math.max(var_124_6, arg_121_1.talkMaxDuration)

			if var_124_5 <= arg_121_1.time_ and arg_121_1.time_ < var_124_5 + var_124_15 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_5) / var_124_15

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_5 + var_124_15 and arg_121_1.time_ < var_124_5 + var_124_15 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play115201031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 115201031
		arg_125_1.duration_ = 12.6

		local var_125_0 = {
			ja = 12.6,
			ko = 8.733,
			zh = 6.733,
			en = 8.6
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
				arg_125_0:Play115201032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				arg_125_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action4_1")
			end

			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_128_2 = arg_125_1.actors_["4010ui_story"]
			local var_128_3 = 0

			if var_128_3 < arg_125_1.time_ and arg_125_1.time_ <= var_128_3 + arg_128_0 and arg_125_1.var_.characterEffect4010ui_story == nil then
				arg_125_1.var_.characterEffect4010ui_story = var_128_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_4 = 0.2

			if var_128_3 <= arg_125_1.time_ and arg_125_1.time_ < var_128_3 + var_128_4 then
				local var_128_5 = (arg_125_1.time_ - var_128_3) / var_128_4

				if arg_125_1.var_.characterEffect4010ui_story then
					arg_125_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_3 + var_128_4 and arg_125_1.time_ < var_128_3 + var_128_4 + arg_128_0 and arg_125_1.var_.characterEffect4010ui_story then
				arg_125_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_128_6 = arg_125_1.actors_["1052ui_story"]
			local var_128_7 = 0

			if var_128_7 < arg_125_1.time_ and arg_125_1.time_ <= var_128_7 + arg_128_0 and arg_125_1.var_.characterEffect1052ui_story == nil then
				arg_125_1.var_.characterEffect1052ui_story = var_128_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_8 = 0.2

			if var_128_7 <= arg_125_1.time_ and arg_125_1.time_ < var_128_7 + var_128_8 then
				local var_128_9 = (arg_125_1.time_ - var_128_7) / var_128_8

				if arg_125_1.var_.characterEffect1052ui_story then
					local var_128_10 = Mathf.Lerp(0, 0.5, var_128_9)

					arg_125_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1052ui_story.fillRatio = var_128_10
				end
			end

			if arg_125_1.time_ >= var_128_7 + var_128_8 and arg_125_1.time_ < var_128_7 + var_128_8 + arg_128_0 and arg_125_1.var_.characterEffect1052ui_story then
				local var_128_11 = 0.5

				arg_125_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1052ui_story.fillRatio = var_128_11
			end

			local var_128_12 = 0
			local var_128_13 = 0.7

			if var_128_12 < arg_125_1.time_ and arg_125_1.time_ <= var_128_12 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_14 = arg_125_1:FormatText(StoryNameCfg[42].name)

				arg_125_1.leftNameTxt_.text = var_128_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_15 = arg_125_1:GetWordFromCfg(115201031)
				local var_128_16 = arg_125_1:FormatText(var_128_15.content)

				arg_125_1.text_.text = var_128_16

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_17 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201031", "story_v_out_115201.awb") ~= 0 then
					local var_128_20 = manager.audio:GetVoiceLength("story_v_out_115201", "115201031", "story_v_out_115201.awb") / 1000

					if var_128_20 + var_128_12 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_20 + var_128_12
					end

					if var_128_15.prefab_name ~= "" and arg_125_1.actors_[var_128_15.prefab_name] ~= nil then
						local var_128_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_15.prefab_name].transform, "story_v_out_115201", "115201031", "story_v_out_115201.awb")

						arg_125_1:RecordAudio("115201031", var_128_21)
						arg_125_1:RecordAudio("115201031", var_128_21)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_115201", "115201031", "story_v_out_115201.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_115201", "115201031", "story_v_out_115201.awb")
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
	Play115201032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 115201032
		arg_129_1.duration_ = 20.633

		local var_129_0 = {
			ja = 11.833,
			ko = 15.1,
			zh = 14.833,
			en = 20.633
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
				arg_129_0:Play115201033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1052ui_story"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos1052ui_story = var_132_0.localPosition
			end

			local var_132_2 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2
				local var_132_4 = Vector3.New(0, 100, 0)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1052ui_story, var_132_4, var_132_3)

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

			local var_132_9 = arg_129_1.actors_["4010ui_story"].transform
			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 then
				arg_129_1.var_.moveOldPos4010ui_story = var_132_9.localPosition
			end

			local var_132_11 = 0.001

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_11 then
				local var_132_12 = (arg_129_1.time_ - var_132_10) / var_132_11
				local var_132_13 = Vector3.New(0, 100, 0)

				var_132_9.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos4010ui_story, var_132_13, var_132_12)

				local var_132_14 = manager.ui.mainCamera.transform.position - var_132_9.position

				var_132_9.forward = Vector3.New(var_132_14.x, var_132_14.y, var_132_14.z)

				local var_132_15 = var_132_9.localEulerAngles

				var_132_15.z = 0
				var_132_15.x = 0
				var_132_9.localEulerAngles = var_132_15
			end

			if arg_129_1.time_ >= var_132_10 + var_132_11 and arg_129_1.time_ < var_132_10 + var_132_11 + arg_132_0 then
				var_132_9.localPosition = Vector3.New(0, 100, 0)

				local var_132_16 = manager.ui.mainCamera.transform.position - var_132_9.position

				var_132_9.forward = Vector3.New(var_132_16.x, var_132_16.y, var_132_16.z)

				local var_132_17 = var_132_9.localEulerAngles

				var_132_17.z = 0
				var_132_17.x = 0
				var_132_9.localEulerAngles = var_132_17
			end

			local var_132_18 = arg_129_1.actors_["1024ui_story"].transform
			local var_132_19 = 0

			if var_132_19 < arg_129_1.time_ and arg_129_1.time_ <= var_132_19 + arg_132_0 then
				arg_129_1.var_.moveOldPos1024ui_story = var_132_18.localPosition

				local var_132_20 = "1024ui_story"

				arg_129_1:ShowWeapon(arg_129_1.var_[var_132_20 .. "Animator"].transform, true)
			end

			local var_132_21 = 0.001

			if var_132_19 <= arg_129_1.time_ and arg_129_1.time_ < var_132_19 + var_132_21 then
				local var_132_22 = (arg_129_1.time_ - var_132_19) / var_132_21
				local var_132_23 = Vector3.New(0, -1, -6.05)

				var_132_18.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1024ui_story, var_132_23, var_132_22)

				local var_132_24 = manager.ui.mainCamera.transform.position - var_132_18.position

				var_132_18.forward = Vector3.New(var_132_24.x, var_132_24.y, var_132_24.z)

				local var_132_25 = var_132_18.localEulerAngles

				var_132_25.z = 0
				var_132_25.x = 0
				var_132_18.localEulerAngles = var_132_25
			end

			if arg_129_1.time_ >= var_132_19 + var_132_21 and arg_129_1.time_ < var_132_19 + var_132_21 + arg_132_0 then
				var_132_18.localPosition = Vector3.New(0, -1, -6.05)

				local var_132_26 = manager.ui.mainCamera.transform.position - var_132_18.position

				var_132_18.forward = Vector3.New(var_132_26.x, var_132_26.y, var_132_26.z)

				local var_132_27 = var_132_18.localEulerAngles

				var_132_27.z = 0
				var_132_27.x = 0
				var_132_18.localEulerAngles = var_132_27
			end

			local var_132_28 = 0

			if var_132_28 < arg_129_1.time_ and arg_129_1.time_ <= var_132_28 + arg_132_0 then
				arg_129_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action7_1")
			end

			local var_132_29 = 0

			if var_132_29 < arg_129_1.time_ and arg_129_1.time_ <= var_132_29 + arg_132_0 then
				arg_129_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_132_30 = arg_129_1.actors_["1024ui_story"]
			local var_132_31 = 0

			if var_132_31 < arg_129_1.time_ and arg_129_1.time_ <= var_132_31 + arg_132_0 and arg_129_1.var_.characterEffect1024ui_story == nil then
				arg_129_1.var_.characterEffect1024ui_story = var_132_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_32 = 0.2

			if var_132_31 <= arg_129_1.time_ and arg_129_1.time_ < var_132_31 + var_132_32 then
				local var_132_33 = (arg_129_1.time_ - var_132_31) / var_132_32

				if arg_129_1.var_.characterEffect1024ui_story then
					arg_129_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_31 + var_132_32 and arg_129_1.time_ < var_132_31 + var_132_32 + arg_132_0 and arg_129_1.var_.characterEffect1024ui_story then
				arg_129_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_132_34 = 0
			local var_132_35 = 1.75

			if var_132_34 < arg_129_1.time_ and arg_129_1.time_ <= var_132_34 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_36 = arg_129_1:FormatText(StoryNameCfg[265].name)

				arg_129_1.leftNameTxt_.text = var_132_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_37 = arg_129_1:GetWordFromCfg(115201032)
				local var_132_38 = arg_129_1:FormatText(var_132_37.content)

				arg_129_1.text_.text = var_132_38

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_39 = 70
				local var_132_40 = utf8.len(var_132_38)
				local var_132_41 = var_132_39 <= 0 and var_132_35 or var_132_35 * (var_132_40 / var_132_39)

				if var_132_41 > 0 and var_132_35 < var_132_41 then
					arg_129_1.talkMaxDuration = var_132_41

					if var_132_41 + var_132_34 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_41 + var_132_34
					end
				end

				arg_129_1.text_.text = var_132_38
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201032", "story_v_out_115201.awb") ~= 0 then
					local var_132_42 = manager.audio:GetVoiceLength("story_v_out_115201", "115201032", "story_v_out_115201.awb") / 1000

					if var_132_42 + var_132_34 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_42 + var_132_34
					end

					if var_132_37.prefab_name ~= "" and arg_129_1.actors_[var_132_37.prefab_name] ~= nil then
						local var_132_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_37.prefab_name].transform, "story_v_out_115201", "115201032", "story_v_out_115201.awb")

						arg_129_1:RecordAudio("115201032", var_132_43)
						arg_129_1:RecordAudio("115201032", var_132_43)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_115201", "115201032", "story_v_out_115201.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_115201", "115201032", "story_v_out_115201.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_44 = math.max(var_132_35, arg_129_1.talkMaxDuration)

			if var_132_34 <= arg_129_1.time_ and arg_129_1.time_ < var_132_34 + var_132_44 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_34) / var_132_44

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_34 + var_132_44 and arg_129_1.time_ < var_132_34 + var_132_44 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play115201033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 115201033
		arg_133_1.duration_ = 5.733

		local var_133_0 = {
			ja = 5.733,
			ko = 5.433,
			zh = 5.2,
			en = 4.066
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
				arg_133_0:Play115201034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = "1035ui_story"

			if arg_133_1.actors_[var_136_0] == nil then
				local var_136_1 = Object.Instantiate(Asset.Load("Char/" .. var_136_0), arg_133_1.stage_.transform)

				var_136_1.name = var_136_0
				var_136_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_133_1.actors_[var_136_0] = var_136_1

				local var_136_2 = var_136_1:GetComponentInChildren(typeof(CharacterEffect))

				var_136_2.enabled = true

				local var_136_3 = GameObjectTools.GetOrAddComponent(var_136_1, typeof(DynamicBoneHelper))

				if var_136_3 then
					var_136_3:EnableDynamicBone(false)
				end

				arg_133_1:ShowWeapon(var_136_2.transform, false)

				arg_133_1.var_[var_136_0 .. "Animator"] = var_136_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_133_1.var_[var_136_0 .. "Animator"].applyRootMotion = true
				arg_133_1.var_[var_136_0 .. "LipSync"] = var_136_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_136_4 = arg_133_1.actors_["1035ui_story"].transform
			local var_136_5 = 0

			if var_136_5 < arg_133_1.time_ and arg_133_1.time_ <= var_136_5 + arg_136_0 then
				arg_133_1.var_.moveOldPos1035ui_story = var_136_4.localPosition
			end

			local var_136_6 = 0.001

			if var_136_5 <= arg_133_1.time_ and arg_133_1.time_ < var_136_5 + var_136_6 then
				local var_136_7 = (arg_133_1.time_ - var_136_5) / var_136_6
				local var_136_8 = Vector3.New(0, -1.05, -5.6)

				var_136_4.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1035ui_story, var_136_8, var_136_7)

				local var_136_9 = manager.ui.mainCamera.transform.position - var_136_4.position

				var_136_4.forward = Vector3.New(var_136_9.x, var_136_9.y, var_136_9.z)

				local var_136_10 = var_136_4.localEulerAngles

				var_136_10.z = 0
				var_136_10.x = 0
				var_136_4.localEulerAngles = var_136_10
			end

			if arg_133_1.time_ >= var_136_5 + var_136_6 and arg_133_1.time_ < var_136_5 + var_136_6 + arg_136_0 then
				var_136_4.localPosition = Vector3.New(0, -1.05, -5.6)

				local var_136_11 = manager.ui.mainCamera.transform.position - var_136_4.position

				var_136_4.forward = Vector3.New(var_136_11.x, var_136_11.y, var_136_11.z)

				local var_136_12 = var_136_4.localEulerAngles

				var_136_12.z = 0
				var_136_12.x = 0
				var_136_4.localEulerAngles = var_136_12
			end

			local var_136_13 = 0

			if var_136_13 < arg_133_1.time_ and arg_133_1.time_ <= var_136_13 + arg_136_0 then
				arg_133_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035action/1035action6_1")
			end

			local var_136_14 = arg_133_1.actors_["1035ui_story"]
			local var_136_15 = 0

			if var_136_15 < arg_133_1.time_ and arg_133_1.time_ <= var_136_15 + arg_136_0 and arg_133_1.var_.characterEffect1035ui_story == nil then
				arg_133_1.var_.characterEffect1035ui_story = var_136_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_16 = 0.2

			if var_136_15 <= arg_133_1.time_ and arg_133_1.time_ < var_136_15 + var_136_16 then
				local var_136_17 = (arg_133_1.time_ - var_136_15) / var_136_16

				if arg_133_1.var_.characterEffect1035ui_story then
					arg_133_1.var_.characterEffect1035ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_15 + var_136_16 and arg_133_1.time_ < var_136_15 + var_136_16 + arg_136_0 and arg_133_1.var_.characterEffect1035ui_story then
				arg_133_1.var_.characterEffect1035ui_story.fillFlat = false
			end

			local var_136_18 = arg_133_1.actors_["1024ui_story"].transform
			local var_136_19 = 0

			if var_136_19 < arg_133_1.time_ and arg_133_1.time_ <= var_136_19 + arg_136_0 then
				arg_133_1.var_.moveOldPos1024ui_story = var_136_18.localPosition

				local var_136_20 = "1024ui_story"

				arg_133_1:ShowWeapon(arg_133_1.var_[var_136_20 .. "Animator"].transform, true)
			end

			local var_136_21 = 0.001

			if var_136_19 <= arg_133_1.time_ and arg_133_1.time_ < var_136_19 + var_136_21 then
				local var_136_22 = (arg_133_1.time_ - var_136_19) / var_136_21
				local var_136_23 = Vector3.New(0, 100, 0)

				var_136_18.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1024ui_story, var_136_23, var_136_22)

				local var_136_24 = manager.ui.mainCamera.transform.position - var_136_18.position

				var_136_18.forward = Vector3.New(var_136_24.x, var_136_24.y, var_136_24.z)

				local var_136_25 = var_136_18.localEulerAngles

				var_136_25.z = 0
				var_136_25.x = 0
				var_136_18.localEulerAngles = var_136_25
			end

			if arg_133_1.time_ >= var_136_19 + var_136_21 and arg_133_1.time_ < var_136_19 + var_136_21 + arg_136_0 then
				var_136_18.localPosition = Vector3.New(0, 100, 0)

				local var_136_26 = manager.ui.mainCamera.transform.position - var_136_18.position

				var_136_18.forward = Vector3.New(var_136_26.x, var_136_26.y, var_136_26.z)

				local var_136_27 = var_136_18.localEulerAngles

				var_136_27.z = 0
				var_136_27.x = 0
				var_136_18.localEulerAngles = var_136_27
			end

			local var_136_28 = 0
			local var_136_29 = 0.525

			if var_136_28 < arg_133_1.time_ and arg_133_1.time_ <= var_136_28 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_30 = arg_133_1:FormatText(StoryNameCfg[21].name)

				arg_133_1.leftNameTxt_.text = var_136_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_31 = arg_133_1:GetWordFromCfg(115201033)
				local var_136_32 = arg_133_1:FormatText(var_136_31.content)

				arg_133_1.text_.text = var_136_32

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_33 = 21
				local var_136_34 = utf8.len(var_136_32)
				local var_136_35 = var_136_33 <= 0 and var_136_29 or var_136_29 * (var_136_34 / var_136_33)

				if var_136_35 > 0 and var_136_29 < var_136_35 then
					arg_133_1.talkMaxDuration = var_136_35

					if var_136_35 + var_136_28 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_35 + var_136_28
					end
				end

				arg_133_1.text_.text = var_136_32
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201033", "story_v_out_115201.awb") ~= 0 then
					local var_136_36 = manager.audio:GetVoiceLength("story_v_out_115201", "115201033", "story_v_out_115201.awb") / 1000

					if var_136_36 + var_136_28 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_36 + var_136_28
					end

					if var_136_31.prefab_name ~= "" and arg_133_1.actors_[var_136_31.prefab_name] ~= nil then
						local var_136_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_31.prefab_name].transform, "story_v_out_115201", "115201033", "story_v_out_115201.awb")

						arg_133_1:RecordAudio("115201033", var_136_37)
						arg_133_1:RecordAudio("115201033", var_136_37)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_115201", "115201033", "story_v_out_115201.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_115201", "115201033", "story_v_out_115201.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_38 = math.max(var_136_29, arg_133_1.talkMaxDuration)

			if var_136_28 <= arg_133_1.time_ and arg_133_1.time_ < var_136_28 + var_136_38 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_28) / var_136_38

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_28 + var_136_38 and arg_133_1.time_ < var_136_28 + var_136_38 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play115201034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 115201034
		arg_137_1.duration_ = 6.5

		local var_137_0 = {
			ja = 6.5,
			ko = 5.7,
			zh = 5.1,
			en = 6.266
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
				arg_137_0:Play115201035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1035ui_story"].transform
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1.var_.moveOldPos1035ui_story = var_140_0.localPosition
			end

			local var_140_2 = 0.001

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2
				local var_140_4 = Vector3.New(0, 100, 0)

				var_140_0.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1035ui_story, var_140_4, var_140_3)

				local var_140_5 = manager.ui.mainCamera.transform.position - var_140_0.position

				var_140_0.forward = Vector3.New(var_140_5.x, var_140_5.y, var_140_5.z)

				local var_140_6 = var_140_0.localEulerAngles

				var_140_6.z = 0
				var_140_6.x = 0
				var_140_0.localEulerAngles = var_140_6
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 then
				var_140_0.localPosition = Vector3.New(0, 100, 0)

				local var_140_7 = manager.ui.mainCamera.transform.position - var_140_0.position

				var_140_0.forward = Vector3.New(var_140_7.x, var_140_7.y, var_140_7.z)

				local var_140_8 = var_140_0.localEulerAngles

				var_140_8.z = 0
				var_140_8.x = 0
				var_140_0.localEulerAngles = var_140_8
			end

			local var_140_9 = 0
			local var_140_10 = 0.575

			if var_140_9 < arg_137_1.time_ and arg_137_1.time_ <= var_140_9 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_11 = arg_137_1:FormatText(StoryNameCfg[273].name)

				arg_137_1.leftNameTxt_.text = var_140_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, true)
				arg_137_1.iconController_:SetSelectedState("hero")

				arg_137_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1017")

				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_12 = arg_137_1:GetWordFromCfg(115201034)
				local var_140_13 = arg_137_1:FormatText(var_140_12.content)

				arg_137_1.text_.text = var_140_13

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_14 = 23
				local var_140_15 = utf8.len(var_140_13)
				local var_140_16 = var_140_14 <= 0 and var_140_10 or var_140_10 * (var_140_15 / var_140_14)

				if var_140_16 > 0 and var_140_10 < var_140_16 then
					arg_137_1.talkMaxDuration = var_140_16

					if var_140_16 + var_140_9 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_16 + var_140_9
					end
				end

				arg_137_1.text_.text = var_140_13
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201034", "story_v_out_115201.awb") ~= 0 then
					local var_140_17 = manager.audio:GetVoiceLength("story_v_out_115201", "115201034", "story_v_out_115201.awb") / 1000

					if var_140_17 + var_140_9 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_17 + var_140_9
					end

					if var_140_12.prefab_name ~= "" and arg_137_1.actors_[var_140_12.prefab_name] ~= nil then
						local var_140_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_12.prefab_name].transform, "story_v_out_115201", "115201034", "story_v_out_115201.awb")

						arg_137_1:RecordAudio("115201034", var_140_18)
						arg_137_1:RecordAudio("115201034", var_140_18)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_115201", "115201034", "story_v_out_115201.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_115201", "115201034", "story_v_out_115201.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_19 = math.max(var_140_10, arg_137_1.talkMaxDuration)

			if var_140_9 <= arg_137_1.time_ and arg_137_1.time_ < var_140_9 + var_140_19 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_9) / var_140_19

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_9 + var_140_19 and arg_137_1.time_ < var_140_9 + var_140_19 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play115201035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 115201035
		arg_141_1.duration_ = 16.3

		local var_141_0 = {
			ja = 15.8,
			ko = 14.8,
			zh = 13.2,
			en = 16.3
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
				arg_141_0:Play115201036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["4010ui_story"].transform
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos4010ui_story = var_144_0.localPosition
			end

			local var_144_2 = 0.001

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2
				local var_144_4 = Vector3.New(0, -1.59, -5.2)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos4010ui_story, var_144_4, var_144_3)

				local var_144_5 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_5.x, var_144_5.y, var_144_5.z)

				local var_144_6 = var_144_0.localEulerAngles

				var_144_6.z = 0
				var_144_6.x = 0
				var_144_0.localEulerAngles = var_144_6
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 then
				var_144_0.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_144_7 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_7.x, var_144_7.y, var_144_7.z)

				local var_144_8 = var_144_0.localEulerAngles

				var_144_8.z = 0
				var_144_8.x = 0
				var_144_0.localEulerAngles = var_144_8
			end

			local var_144_9 = 0

			if var_144_9 < arg_141_1.time_ and arg_141_1.time_ <= var_144_9 + arg_144_0 then
				arg_141_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action1_1")
			end

			local var_144_10 = 0

			if var_144_10 < arg_141_1.time_ and arg_141_1.time_ <= var_144_10 + arg_144_0 then
				arg_141_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_144_11 = arg_141_1.actors_["4010ui_story"]
			local var_144_12 = 0

			if var_144_12 < arg_141_1.time_ and arg_141_1.time_ <= var_144_12 + arg_144_0 and arg_141_1.var_.characterEffect4010ui_story == nil then
				arg_141_1.var_.characterEffect4010ui_story = var_144_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_13 = 0.2

			if var_144_12 <= arg_141_1.time_ and arg_141_1.time_ < var_144_12 + var_144_13 then
				local var_144_14 = (arg_141_1.time_ - var_144_12) / var_144_13

				if arg_141_1.var_.characterEffect4010ui_story then
					arg_141_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_12 + var_144_13 and arg_141_1.time_ < var_144_12 + var_144_13 + arg_144_0 and arg_141_1.var_.characterEffect4010ui_story then
				arg_141_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_144_15 = 0
			local var_144_16 = 1.175

			if var_144_15 < arg_141_1.time_ and arg_141_1.time_ <= var_144_15 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_17 = arg_141_1:FormatText(StoryNameCfg[42].name)

				arg_141_1.leftNameTxt_.text = var_144_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_18 = arg_141_1:GetWordFromCfg(115201035)
				local var_144_19 = arg_141_1:FormatText(var_144_18.content)

				arg_141_1.text_.text = var_144_19

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_20 = 47
				local var_144_21 = utf8.len(var_144_19)
				local var_144_22 = var_144_20 <= 0 and var_144_16 or var_144_16 * (var_144_21 / var_144_20)

				if var_144_22 > 0 and var_144_16 < var_144_22 then
					arg_141_1.talkMaxDuration = var_144_22

					if var_144_22 + var_144_15 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_22 + var_144_15
					end
				end

				arg_141_1.text_.text = var_144_19
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201035", "story_v_out_115201.awb") ~= 0 then
					local var_144_23 = manager.audio:GetVoiceLength("story_v_out_115201", "115201035", "story_v_out_115201.awb") / 1000

					if var_144_23 + var_144_15 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_23 + var_144_15
					end

					if var_144_18.prefab_name ~= "" and arg_141_1.actors_[var_144_18.prefab_name] ~= nil then
						local var_144_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_18.prefab_name].transform, "story_v_out_115201", "115201035", "story_v_out_115201.awb")

						arg_141_1:RecordAudio("115201035", var_144_24)
						arg_141_1:RecordAudio("115201035", var_144_24)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_115201", "115201035", "story_v_out_115201.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_115201", "115201035", "story_v_out_115201.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_25 = math.max(var_144_16, arg_141_1.talkMaxDuration)

			if var_144_15 <= arg_141_1.time_ and arg_141_1.time_ < var_144_15 + var_144_25 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_15) / var_144_25

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_15 + var_144_25 and arg_141_1.time_ < var_144_15 + var_144_25 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play115201036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 115201036
		arg_145_1.duration_ = 6.066

		local var_145_0 = {
			ja = 6.066,
			ko = 4.033,
			zh = 3.6,
			en = 3.6
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
				arg_145_0:Play115201037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action6_1")
			end

			local var_148_2 = 0
			local var_148_3 = 0.4

			if var_148_2 < arg_145_1.time_ and arg_145_1.time_ <= var_148_2 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_4 = arg_145_1:FormatText(StoryNameCfg[42].name)

				arg_145_1.leftNameTxt_.text = var_148_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_5 = arg_145_1:GetWordFromCfg(115201036)
				local var_148_6 = arg_145_1:FormatText(var_148_5.content)

				arg_145_1.text_.text = var_148_6

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_7 = 17
				local var_148_8 = utf8.len(var_148_6)
				local var_148_9 = var_148_7 <= 0 and var_148_3 or var_148_3 * (var_148_8 / var_148_7)

				if var_148_9 > 0 and var_148_3 < var_148_9 then
					arg_145_1.talkMaxDuration = var_148_9

					if var_148_9 + var_148_2 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_9 + var_148_2
					end
				end

				arg_145_1.text_.text = var_148_6
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201036", "story_v_out_115201.awb") ~= 0 then
					local var_148_10 = manager.audio:GetVoiceLength("story_v_out_115201", "115201036", "story_v_out_115201.awb") / 1000

					if var_148_10 + var_148_2 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_10 + var_148_2
					end

					if var_148_5.prefab_name ~= "" and arg_145_1.actors_[var_148_5.prefab_name] ~= nil then
						local var_148_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_5.prefab_name].transform, "story_v_out_115201", "115201036", "story_v_out_115201.awb")

						arg_145_1:RecordAudio("115201036", var_148_11)
						arg_145_1:RecordAudio("115201036", var_148_11)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_115201", "115201036", "story_v_out_115201.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_115201", "115201036", "story_v_out_115201.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_12 = math.max(var_148_3, arg_145_1.talkMaxDuration)

			if var_148_2 <= arg_145_1.time_ and arg_145_1.time_ < var_148_2 + var_148_12 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_2) / var_148_12

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_2 + var_148_12 and arg_145_1.time_ < var_148_2 + var_148_12 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play115201037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 115201037
		arg_149_1.duration_ = 2.1

		local var_149_0 = {
			ja = 1.633,
			ko = 1.266,
			zh = 1.6,
			en = 2.1
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
				arg_149_0:Play115201038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["4010ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect4010ui_story == nil then
				arg_149_1.var_.characterEffect4010ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.2

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect4010ui_story then
					local var_152_4 = Mathf.Lerp(0, 0.5, var_152_3)

					arg_149_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_149_1.var_.characterEffect4010ui_story.fillRatio = var_152_4
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect4010ui_story then
				local var_152_5 = 0.5

				arg_149_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_149_1.var_.characterEffect4010ui_story.fillRatio = var_152_5
			end

			local var_152_6 = 0
			local var_152_7 = 0.05

			if var_152_6 < arg_149_1.time_ and arg_149_1.time_ <= var_152_6 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_8 = arg_149_1:FormatText(StoryNameCfg[260].name)

				arg_149_1.leftNameTxt_.text = var_152_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, true)
				arg_149_1.iconController_:SetSelectedState("hero")

				arg_149_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1016")

				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_9 = arg_149_1:GetWordFromCfg(115201037)
				local var_152_10 = arg_149_1:FormatText(var_152_9.content)

				arg_149_1.text_.text = var_152_10

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_11 = 2
				local var_152_12 = utf8.len(var_152_10)
				local var_152_13 = var_152_11 <= 0 and var_152_7 or var_152_7 * (var_152_12 / var_152_11)

				if var_152_13 > 0 and var_152_7 < var_152_13 then
					arg_149_1.talkMaxDuration = var_152_13

					if var_152_13 + var_152_6 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_13 + var_152_6
					end
				end

				arg_149_1.text_.text = var_152_10
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201037", "story_v_out_115201.awb") ~= 0 then
					local var_152_14 = manager.audio:GetVoiceLength("story_v_out_115201", "115201037", "story_v_out_115201.awb") / 1000

					if var_152_14 + var_152_6 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_14 + var_152_6
					end

					if var_152_9.prefab_name ~= "" and arg_149_1.actors_[var_152_9.prefab_name] ~= nil then
						local var_152_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_9.prefab_name].transform, "story_v_out_115201", "115201037", "story_v_out_115201.awb")

						arg_149_1:RecordAudio("115201037", var_152_15)
						arg_149_1:RecordAudio("115201037", var_152_15)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_115201", "115201037", "story_v_out_115201.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_115201", "115201037", "story_v_out_115201.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_16 = math.max(var_152_7, arg_149_1.talkMaxDuration)

			if var_152_6 <= arg_149_1.time_ and arg_149_1.time_ < var_152_6 + var_152_16 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_6) / var_152_16

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_6 + var_152_16 and arg_149_1.time_ < var_152_6 + var_152_16 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play115201038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 115201038
		arg_153_1.duration_ = 10.2

		local var_153_0 = {
			ja = 9,
			ko = 6.5,
			zh = 6.433,
			en = 10.2
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
				arg_153_0:Play115201039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action6_2")
			end

			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 then
				arg_153_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_156_2 = arg_153_1.actors_["4010ui_story"]
			local var_156_3 = 0

			if var_156_3 < arg_153_1.time_ and arg_153_1.time_ <= var_156_3 + arg_156_0 and arg_153_1.var_.characterEffect4010ui_story == nil then
				arg_153_1.var_.characterEffect4010ui_story = var_156_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_4 = 0.2

			if var_156_3 <= arg_153_1.time_ and arg_153_1.time_ < var_156_3 + var_156_4 then
				local var_156_5 = (arg_153_1.time_ - var_156_3) / var_156_4

				if arg_153_1.var_.characterEffect4010ui_story then
					arg_153_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_3 + var_156_4 and arg_153_1.time_ < var_156_3 + var_156_4 + arg_156_0 and arg_153_1.var_.characterEffect4010ui_story then
				arg_153_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_156_6 = 0
			local var_156_7 = 0.8

			if var_156_6 < arg_153_1.time_ and arg_153_1.time_ <= var_156_6 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_8 = arg_153_1:FormatText(StoryNameCfg[42].name)

				arg_153_1.leftNameTxt_.text = var_156_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_9 = arg_153_1:GetWordFromCfg(115201038)
				local var_156_10 = arg_153_1:FormatText(var_156_9.content)

				arg_153_1.text_.text = var_156_10

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_11 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201038", "story_v_out_115201.awb") ~= 0 then
					local var_156_14 = manager.audio:GetVoiceLength("story_v_out_115201", "115201038", "story_v_out_115201.awb") / 1000

					if var_156_14 + var_156_6 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_14 + var_156_6
					end

					if var_156_9.prefab_name ~= "" and arg_153_1.actors_[var_156_9.prefab_name] ~= nil then
						local var_156_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_9.prefab_name].transform, "story_v_out_115201", "115201038", "story_v_out_115201.awb")

						arg_153_1:RecordAudio("115201038", var_156_15)
						arg_153_1:RecordAudio("115201038", var_156_15)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_115201", "115201038", "story_v_out_115201.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_115201", "115201038", "story_v_out_115201.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_16 = math.max(var_156_7, arg_153_1.talkMaxDuration)

			if var_156_6 <= arg_153_1.time_ and arg_153_1.time_ < var_156_6 + var_156_16 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_6) / var_156_16

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_6 + var_156_16 and arg_153_1.time_ < var_156_6 + var_156_16 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play115201039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 115201039
		arg_157_1.duration_ = 8.666

		local var_157_0 = {
			ja = 6.1,
			ko = 8.666,
			zh = 5.833,
			en = 7.4
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
				arg_157_0:Play115201040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_160_1 = 0
			local var_160_2 = 0.8

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_3 = arg_157_1:FormatText(StoryNameCfg[42].name)

				arg_157_1.leftNameTxt_.text = var_160_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_4 = arg_157_1:GetWordFromCfg(115201039)
				local var_160_5 = arg_157_1:FormatText(var_160_4.content)

				arg_157_1.text_.text = var_160_5

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_6 = 32
				local var_160_7 = utf8.len(var_160_5)
				local var_160_8 = var_160_6 <= 0 and var_160_2 or var_160_2 * (var_160_7 / var_160_6)

				if var_160_8 > 0 and var_160_2 < var_160_8 then
					arg_157_1.talkMaxDuration = var_160_8

					if var_160_8 + var_160_1 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_8 + var_160_1
					end
				end

				arg_157_1.text_.text = var_160_5
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201039", "story_v_out_115201.awb") ~= 0 then
					local var_160_9 = manager.audio:GetVoiceLength("story_v_out_115201", "115201039", "story_v_out_115201.awb") / 1000

					if var_160_9 + var_160_1 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_9 + var_160_1
					end

					if var_160_4.prefab_name ~= "" and arg_157_1.actors_[var_160_4.prefab_name] ~= nil then
						local var_160_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_4.prefab_name].transform, "story_v_out_115201", "115201039", "story_v_out_115201.awb")

						arg_157_1:RecordAudio("115201039", var_160_10)
						arg_157_1:RecordAudio("115201039", var_160_10)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_115201", "115201039", "story_v_out_115201.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_115201", "115201039", "story_v_out_115201.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_11 = math.max(var_160_2, arg_157_1.talkMaxDuration)

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_11 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_1) / var_160_11

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_1 + var_160_11 and arg_157_1.time_ < var_160_1 + var_160_11 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play115201040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 115201040
		arg_161_1.duration_ = 6.133

		local var_161_0 = {
			ja = 2.9,
			ko = 6.133,
			zh = 5.133,
			en = 5.8
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
				arg_161_0:Play115201041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["4010ui_story"].transform
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPos4010ui_story = var_164_0.localPosition
			end

			local var_164_2 = 0.001

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2
				local var_164_4 = Vector3.New(0, 100, 0)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos4010ui_story, var_164_4, var_164_3)

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

			local var_164_9 = 0
			local var_164_10 = 0.625

			if var_164_9 < arg_161_1.time_ and arg_161_1.time_ <= var_164_9 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_11 = arg_161_1:FormatText(StoryNameCfg[261].name)

				arg_161_1.leftNameTxt_.text = var_164_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, true)
				arg_161_1.iconController_:SetSelectedState("hero")

				arg_161_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2084")

				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_12 = arg_161_1:GetWordFromCfg(115201040)
				local var_164_13 = arg_161_1:FormatText(var_164_12.content)

				arg_161_1.text_.text = var_164_13

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_14 = 25
				local var_164_15 = utf8.len(var_164_13)
				local var_164_16 = var_164_14 <= 0 and var_164_10 or var_164_10 * (var_164_15 / var_164_14)

				if var_164_16 > 0 and var_164_10 < var_164_16 then
					arg_161_1.talkMaxDuration = var_164_16

					if var_164_16 + var_164_9 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_16 + var_164_9
					end
				end

				arg_161_1.text_.text = var_164_13
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201040", "story_v_out_115201.awb") ~= 0 then
					local var_164_17 = manager.audio:GetVoiceLength("story_v_out_115201", "115201040", "story_v_out_115201.awb") / 1000

					if var_164_17 + var_164_9 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_17 + var_164_9
					end

					if var_164_12.prefab_name ~= "" and arg_161_1.actors_[var_164_12.prefab_name] ~= nil then
						local var_164_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_12.prefab_name].transform, "story_v_out_115201", "115201040", "story_v_out_115201.awb")

						arg_161_1:RecordAudio("115201040", var_164_18)
						arg_161_1:RecordAudio("115201040", var_164_18)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_115201", "115201040", "story_v_out_115201.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_115201", "115201040", "story_v_out_115201.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_19 = math.max(var_164_10, arg_161_1.talkMaxDuration)

			if var_164_9 <= arg_161_1.time_ and arg_161_1.time_ < var_164_9 + var_164_19 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_9) / var_164_19

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_9 + var_164_19 and arg_161_1.time_ < var_164_9 + var_164_19 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play115201041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 115201041
		arg_165_1.duration_ = 4.7

		local var_165_0 = {
			ja = 4.7,
			ko = 3.3,
			zh = 3.766,
			en = 4.166
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
				arg_165_0:Play115201042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0
			local var_168_1 = 0.35

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_2 = arg_165_1:FormatText(StoryNameCfg[262].name)

				arg_165_1.leftNameTxt_.text = var_168_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, true)
				arg_165_1.iconController_:SetSelectedState("hero")

				arg_165_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2084")

				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_3 = arg_165_1:GetWordFromCfg(115201041)
				local var_168_4 = arg_165_1:FormatText(var_168_3.content)

				arg_165_1.text_.text = var_168_4

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201041", "story_v_out_115201.awb") ~= 0 then
					local var_168_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201041", "story_v_out_115201.awb") / 1000

					if var_168_8 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_8 + var_168_0
					end

					if var_168_3.prefab_name ~= "" and arg_165_1.actors_[var_168_3.prefab_name] ~= nil then
						local var_168_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_3.prefab_name].transform, "story_v_out_115201", "115201041", "story_v_out_115201.awb")

						arg_165_1:RecordAudio("115201041", var_168_9)
						arg_165_1:RecordAudio("115201041", var_168_9)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_115201", "115201041", "story_v_out_115201.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_115201", "115201041", "story_v_out_115201.awb")
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
	Play115201042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 115201042
		arg_169_1.duration_ = 7.9

		local var_169_0 = {
			ja = 4.9,
			ko = 6.433,
			zh = 5.1,
			en = 7.9
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
				arg_169_0:Play115201043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1035ui_story"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos1035ui_story = var_172_0.localPosition
			end

			local var_172_2 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2
				local var_172_4 = Vector3.New(0, -1.05, -5.6)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1035ui_story, var_172_4, var_172_3)

				local var_172_5 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_5.x, var_172_5.y, var_172_5.z)

				local var_172_6 = var_172_0.localEulerAngles

				var_172_6.z = 0
				var_172_6.x = 0
				var_172_0.localEulerAngles = var_172_6
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(0, -1.05, -5.6)

				local var_172_7 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_7.x, var_172_7.y, var_172_7.z)

				local var_172_8 = var_172_0.localEulerAngles

				var_172_8.z = 0
				var_172_8.x = 0
				var_172_0.localEulerAngles = var_172_8
			end

			local var_172_9 = 0

			if var_172_9 < arg_169_1.time_ and arg_169_1.time_ <= var_172_9 + arg_172_0 then
				arg_169_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035action/1035action6_1")
			end

			local var_172_10 = arg_169_1.actors_["1035ui_story"]
			local var_172_11 = 0

			if var_172_11 < arg_169_1.time_ and arg_169_1.time_ <= var_172_11 + arg_172_0 and arg_169_1.var_.characterEffect1035ui_story == nil then
				arg_169_1.var_.characterEffect1035ui_story = var_172_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_12 = 0.2

			if var_172_11 <= arg_169_1.time_ and arg_169_1.time_ < var_172_11 + var_172_12 then
				local var_172_13 = (arg_169_1.time_ - var_172_11) / var_172_12

				if arg_169_1.var_.characterEffect1035ui_story then
					arg_169_1.var_.characterEffect1035ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_11 + var_172_12 and arg_169_1.time_ < var_172_11 + var_172_12 + arg_172_0 and arg_169_1.var_.characterEffect1035ui_story then
				arg_169_1.var_.characterEffect1035ui_story.fillFlat = false
			end

			local var_172_14 = 0
			local var_172_15 = 0.575

			if var_172_14 < arg_169_1.time_ and arg_169_1.time_ <= var_172_14 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_16 = arg_169_1:FormatText(StoryNameCfg[21].name)

				arg_169_1.leftNameTxt_.text = var_172_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_17 = arg_169_1:GetWordFromCfg(115201042)
				local var_172_18 = arg_169_1:FormatText(var_172_17.content)

				arg_169_1.text_.text = var_172_18

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_19 = 23
				local var_172_20 = utf8.len(var_172_18)
				local var_172_21 = var_172_19 <= 0 and var_172_15 or var_172_15 * (var_172_20 / var_172_19)

				if var_172_21 > 0 and var_172_15 < var_172_21 then
					arg_169_1.talkMaxDuration = var_172_21

					if var_172_21 + var_172_14 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_21 + var_172_14
					end
				end

				arg_169_1.text_.text = var_172_18
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201042", "story_v_out_115201.awb") ~= 0 then
					local var_172_22 = manager.audio:GetVoiceLength("story_v_out_115201", "115201042", "story_v_out_115201.awb") / 1000

					if var_172_22 + var_172_14 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_22 + var_172_14
					end

					if var_172_17.prefab_name ~= "" and arg_169_1.actors_[var_172_17.prefab_name] ~= nil then
						local var_172_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_17.prefab_name].transform, "story_v_out_115201", "115201042", "story_v_out_115201.awb")

						arg_169_1:RecordAudio("115201042", var_172_23)
						arg_169_1:RecordAudio("115201042", var_172_23)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_115201", "115201042", "story_v_out_115201.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_115201", "115201042", "story_v_out_115201.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_24 = math.max(var_172_15, arg_169_1.talkMaxDuration)

			if var_172_14 <= arg_169_1.time_ and arg_169_1.time_ < var_172_14 + var_172_24 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_14) / var_172_24

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_14 + var_172_24 and arg_169_1.time_ < var_172_14 + var_172_24 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play115201043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 115201043
		arg_173_1.duration_ = 1.6

		local var_173_0 = {
			ja = 1.6,
			ko = 1.2,
			zh = 1.433,
			en = 1.4
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
				arg_173_0:Play115201044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1035ui_story"].transform
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.var_.moveOldPos1035ui_story = var_176_0.localPosition
			end

			local var_176_2 = 0.001

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2
				local var_176_4 = Vector3.New(0, 100, 0)

				var_176_0.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1035ui_story, var_176_4, var_176_3)

				local var_176_5 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_5.x, var_176_5.y, var_176_5.z)

				local var_176_6 = var_176_0.localEulerAngles

				var_176_6.z = 0
				var_176_6.x = 0
				var_176_0.localEulerAngles = var_176_6
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 then
				var_176_0.localPosition = Vector3.New(0, 100, 0)

				local var_176_7 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_7.x, var_176_7.y, var_176_7.z)

				local var_176_8 = var_176_0.localEulerAngles

				var_176_8.z = 0
				var_176_8.x = 0
				var_176_0.localEulerAngles = var_176_8
			end

			local var_176_9 = 0
			local var_176_10 = 0.125

			if var_176_9 < arg_173_1.time_ and arg_173_1.time_ <= var_176_9 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_11 = arg_173_1:FormatText(StoryNameCfg[263].name)

				arg_173_1.leftNameTxt_.text = var_176_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, true)
				arg_173_1.iconController_:SetSelectedState("hero")

				arg_173_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1052")

				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_12 = arg_173_1:GetWordFromCfg(115201043)
				local var_176_13 = arg_173_1:FormatText(var_176_12.content)

				arg_173_1.text_.text = var_176_13

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_14 = 5
				local var_176_15 = utf8.len(var_176_13)
				local var_176_16 = var_176_14 <= 0 and var_176_10 or var_176_10 * (var_176_15 / var_176_14)

				if var_176_16 > 0 and var_176_10 < var_176_16 then
					arg_173_1.talkMaxDuration = var_176_16

					if var_176_16 + var_176_9 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_16 + var_176_9
					end
				end

				arg_173_1.text_.text = var_176_13
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201043", "story_v_out_115201.awb") ~= 0 then
					local var_176_17 = manager.audio:GetVoiceLength("story_v_out_115201", "115201043", "story_v_out_115201.awb") / 1000

					if var_176_17 + var_176_9 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_17 + var_176_9
					end

					if var_176_12.prefab_name ~= "" and arg_173_1.actors_[var_176_12.prefab_name] ~= nil then
						local var_176_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_12.prefab_name].transform, "story_v_out_115201", "115201043", "story_v_out_115201.awb")

						arg_173_1:RecordAudio("115201043", var_176_18)
						arg_173_1:RecordAudio("115201043", var_176_18)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_115201", "115201043", "story_v_out_115201.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_115201", "115201043", "story_v_out_115201.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_19 = math.max(var_176_10, arg_173_1.talkMaxDuration)

			if var_176_9 <= arg_173_1.time_ and arg_173_1.time_ < var_176_9 + var_176_19 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_9) / var_176_19

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_9 + var_176_19 and arg_173_1.time_ < var_176_9 + var_176_19 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play115201044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 115201044
		arg_177_1.duration_ = 5

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play115201045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0
			local var_180_1 = 0.85

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, false)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_2 = arg_177_1:GetWordFromCfg(115201044)
				local var_180_3 = arg_177_1:FormatText(var_180_2.content)

				arg_177_1.text_.text = var_180_3

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_4 = 34
				local var_180_5 = utf8.len(var_180_3)
				local var_180_6 = var_180_4 <= 0 and var_180_1 or var_180_1 * (var_180_5 / var_180_4)

				if var_180_6 > 0 and var_180_1 < var_180_6 then
					arg_177_1.talkMaxDuration = var_180_6

					if var_180_6 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_6 + var_180_0
					end
				end

				arg_177_1.text_.text = var_180_3
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)
				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_7 = math.max(var_180_1, arg_177_1.talkMaxDuration)

			if var_180_0 <= arg_177_1.time_ and arg_177_1.time_ < var_180_0 + var_180_7 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_0) / var_180_7

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_0 + var_180_7 and arg_177_1.time_ < var_180_0 + var_180_7 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play115201045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 115201045
		arg_181_1.duration_ = 15.333

		local var_181_0 = {
			ja = 15.333,
			ko = 9.433,
			zh = 7.566,
			en = 8.366
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
				arg_181_0:Play115201046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = 2

			if var_184_0 < arg_181_1.time_ and arg_181_1.time_ <= var_184_0 + arg_184_0 then
				arg_181_1.mask_.enabled = true
				arg_181_1.mask_.raycastTarget = true

				arg_181_1:SetGaussion(false)
			end

			local var_184_1 = 2

			if var_184_0 <= arg_181_1.time_ and arg_181_1.time_ < var_184_0 + var_184_1 then
				local var_184_2 = (arg_181_1.time_ - var_184_0) / var_184_1
				local var_184_3 = Color.New(0, 0, 0)

				var_184_3.a = Mathf.Lerp(1, 0, var_184_2)
				arg_181_1.mask_.color = var_184_3
			end

			if arg_181_1.time_ >= var_184_0 + var_184_1 and arg_181_1.time_ < var_184_0 + var_184_1 + arg_184_0 then
				local var_184_4 = Color.New(0, 0, 0)
				local var_184_5 = 0

				arg_181_1.mask_.enabled = false
				var_184_4.a = var_184_5
				arg_181_1.mask_.color = var_184_4
			end

			local var_184_6 = 0

			if var_184_6 < arg_181_1.time_ and arg_181_1.time_ <= var_184_6 + arg_184_0 then
				arg_181_1.mask_.enabled = true
				arg_181_1.mask_.raycastTarget = true

				arg_181_1:SetGaussion(false)
			end

			local var_184_7 = 2

			if var_184_6 <= arg_181_1.time_ and arg_181_1.time_ < var_184_6 + var_184_7 then
				local var_184_8 = (arg_181_1.time_ - var_184_6) / var_184_7
				local var_184_9 = Color.New(0, 0, 0)

				var_184_9.a = Mathf.Lerp(0, 1, var_184_8)
				arg_181_1.mask_.color = var_184_9
			end

			if arg_181_1.time_ >= var_184_6 + var_184_7 and arg_181_1.time_ < var_184_6 + var_184_7 + arg_184_0 then
				local var_184_10 = Color.New(0, 0, 0)

				var_184_10.a = 1
				arg_181_1.mask_.color = var_184_10
			end

			local var_184_11 = "RO0206"

			if arg_181_1.bgs_[var_184_11] == nil then
				local var_184_12 = Object.Instantiate(arg_181_1.paintGo_)

				var_184_12:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_184_11)
				var_184_12.name = var_184_11
				var_184_12.transform.parent = arg_181_1.stage_.transform
				var_184_12.transform.localPosition = Vector3.New(0, 100, 0)
				arg_181_1.bgs_[var_184_11] = var_184_12
			end

			local var_184_13 = 2

			if var_184_13 < arg_181_1.time_ and arg_181_1.time_ <= var_184_13 + arg_184_0 then
				local var_184_14 = manager.ui.mainCamera.transform.localPosition
				local var_184_15 = Vector3.New(0, 0, 10) + Vector3.New(var_184_14.x, var_184_14.y, 0)
				local var_184_16 = arg_181_1.bgs_.RO0206

				var_184_16.transform.localPosition = var_184_15
				var_184_16.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_184_17 = var_184_16:GetComponent("SpriteRenderer")

				if var_184_17 and var_184_17.sprite then
					local var_184_18 = (var_184_16.transform.localPosition - var_184_14).z
					local var_184_19 = manager.ui.mainCameraCom_
					local var_184_20 = 2 * var_184_18 * Mathf.Tan(var_184_19.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_184_21 = var_184_20 * var_184_19.aspect
					local var_184_22 = var_184_17.sprite.bounds.size.x
					local var_184_23 = var_184_17.sprite.bounds.size.y
					local var_184_24 = var_184_21 / var_184_22
					local var_184_25 = var_184_20 / var_184_23
					local var_184_26 = var_184_25 < var_184_24 and var_184_24 or var_184_25

					var_184_16.transform.localScale = Vector3.New(var_184_26, var_184_26, 0)
				end

				for iter_184_0, iter_184_1 in pairs(arg_181_1.bgs_) do
					if iter_184_0 ~= "RO0206" then
						iter_184_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_184_27 = arg_181_1.bgs_.RO0206.transform
			local var_184_28 = 2

			if var_184_28 < arg_181_1.time_ and arg_181_1.time_ <= var_184_28 + arg_184_0 then
				arg_181_1.var_.moveOldPosRO0206 = var_184_27.localPosition
			end

			local var_184_29 = 0.001

			if var_184_28 <= arg_181_1.time_ and arg_181_1.time_ < var_184_28 + var_184_29 then
				local var_184_30 = (arg_181_1.time_ - var_184_28) / var_184_29
				local var_184_31 = Vector3.New(3, 1.65, 4.9)

				var_184_27.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPosRO0206, var_184_31, var_184_30)
			end

			if arg_181_1.time_ >= var_184_28 + var_184_29 and arg_181_1.time_ < var_184_28 + var_184_29 + arg_184_0 then
				var_184_27.localPosition = Vector3.New(3, 1.65, 4.9)
			end

			local var_184_32 = arg_181_1.bgs_.RO0206.transform
			local var_184_33 = 2.01666666666667

			if var_184_33 < arg_181_1.time_ and arg_181_1.time_ <= var_184_33 + arg_184_0 then
				arg_181_1.var_.moveOldPosRO0206 = var_184_32.localPosition
			end

			local var_184_34 = 5

			if var_184_33 <= arg_181_1.time_ and arg_181_1.time_ < var_184_33 + var_184_34 then
				local var_184_35 = (arg_181_1.time_ - var_184_33) / var_184_34
				local var_184_36 = Vector3.New(2.5, 1.65, 4.9)

				var_184_32.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPosRO0206, var_184_36, var_184_35)
			end

			if arg_181_1.time_ >= var_184_33 + var_184_34 and arg_181_1.time_ < var_184_33 + var_184_34 + arg_184_0 then
				var_184_32.localPosition = Vector3.New(2.5, 1.65, 4.9)
			end

			local var_184_37 = 4

			if var_184_37 < arg_181_1.time_ and arg_181_1.time_ <= var_184_37 + arg_184_0 then
				arg_181_1.allBtn_.enabled = false
			end

			local var_184_38 = 3.01666666666667

			if arg_181_1.time_ >= var_184_37 + var_184_38 and arg_181_1.time_ < var_184_37 + var_184_38 + arg_184_0 then
				arg_181_1.allBtn_.enabled = true
			end

			if arg_181_1.frameCnt_ <= 1 then
				arg_181_1.dialog_:SetActive(false)
			end

			local var_184_39 = 4
			local var_184_40 = 0.425

			if var_184_39 < arg_181_1.time_ and arg_181_1.time_ <= var_184_39 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0

				arg_181_1.dialog_:SetActive(true)

				local var_184_41 = LeanTween.value(arg_181_1.dialog_, 0, 1, 0.3)

				var_184_41:setOnUpdate(LuaHelper.FloatAction(function(arg_185_0)
					arg_181_1.dialogCg_.alpha = arg_185_0
				end))
				var_184_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_181_1.dialog_)
					var_184_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_181_1.duration_ = arg_181_1.duration_ + 0.3

				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_42 = arg_181_1:FormatText(StoryNameCfg[260].name)

				arg_181_1.leftNameTxt_.text = var_184_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_43 = arg_181_1:GetWordFromCfg(115201045)
				local var_184_44 = arg_181_1:FormatText(var_184_43.content)

				arg_181_1.text_.text = var_184_44

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_45 = 17
				local var_184_46 = utf8.len(var_184_44)
				local var_184_47 = var_184_45 <= 0 and var_184_40 or var_184_40 * (var_184_46 / var_184_45)

				if var_184_47 > 0 and var_184_40 < var_184_47 then
					arg_181_1.talkMaxDuration = var_184_47
					var_184_39 = var_184_39 + 0.3

					if var_184_47 + var_184_39 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_47 + var_184_39
					end
				end

				arg_181_1.text_.text = var_184_44
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201045", "story_v_out_115201.awb") ~= 0 then
					local var_184_48 = manager.audio:GetVoiceLength("story_v_out_115201", "115201045", "story_v_out_115201.awb") / 1000

					if var_184_48 + var_184_39 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_48 + var_184_39
					end

					if var_184_43.prefab_name ~= "" and arg_181_1.actors_[var_184_43.prefab_name] ~= nil then
						local var_184_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_43.prefab_name].transform, "story_v_out_115201", "115201045", "story_v_out_115201.awb")

						arg_181_1:RecordAudio("115201045", var_184_49)
						arg_181_1:RecordAudio("115201045", var_184_49)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_115201", "115201045", "story_v_out_115201.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_115201", "115201045", "story_v_out_115201.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_50 = var_184_39 + 0.3
			local var_184_51 = math.max(var_184_40, arg_181_1.talkMaxDuration)

			if var_184_50 <= arg_181_1.time_ and arg_181_1.time_ < var_184_50 + var_184_51 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_50) / var_184_51

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_50 + var_184_51 and arg_181_1.time_ < var_184_50 + var_184_51 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play115201046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 115201046
		arg_187_1.duration_ = 1.466

		local var_187_0 = {
			ja = 0.999999999999,
			ko = 0.999999999999,
			zh = 1.466,
			en = 1.233
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
				arg_187_0:Play115201047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0
			local var_190_1 = 0.1

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_2 = arg_187_1:FormatText(StoryNameCfg[263].name)

				arg_187_1.leftNameTxt_.text = var_190_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_3 = arg_187_1:GetWordFromCfg(115201046)
				local var_190_4 = arg_187_1:FormatText(var_190_3.content)

				arg_187_1.text_.text = var_190_4

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_5 = 4
				local var_190_6 = utf8.len(var_190_4)
				local var_190_7 = var_190_5 <= 0 and var_190_1 or var_190_1 * (var_190_6 / var_190_5)

				if var_190_7 > 0 and var_190_1 < var_190_7 then
					arg_187_1.talkMaxDuration = var_190_7

					if var_190_7 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_7 + var_190_0
					end
				end

				arg_187_1.text_.text = var_190_4
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201046", "story_v_out_115201.awb") ~= 0 then
					local var_190_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201046", "story_v_out_115201.awb") / 1000

					if var_190_8 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_8 + var_190_0
					end

					if var_190_3.prefab_name ~= "" and arg_187_1.actors_[var_190_3.prefab_name] ~= nil then
						local var_190_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_3.prefab_name].transform, "story_v_out_115201", "115201046", "story_v_out_115201.awb")

						arg_187_1:RecordAudio("115201046", var_190_9)
						arg_187_1:RecordAudio("115201046", var_190_9)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_115201", "115201046", "story_v_out_115201.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_115201", "115201046", "story_v_out_115201.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_10 = math.max(var_190_1, arg_187_1.talkMaxDuration)

			if var_190_0 <= arg_187_1.time_ and arg_187_1.time_ < var_190_0 + var_190_10 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_0) / var_190_10

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_0 + var_190_10 and arg_187_1.time_ < var_190_0 + var_190_10 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play115201047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 115201047
		arg_191_1.duration_ = 11.366

		local var_191_0 = {
			ja = 11.366,
			ko = 8.3,
			zh = 9.233,
			en = 7.433
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
				arg_191_0:Play115201048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0
			local var_194_1 = 1.025

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_2 = arg_191_1:FormatText(StoryNameCfg[260].name)

				arg_191_1.leftNameTxt_.text = var_194_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_3 = arg_191_1:GetWordFromCfg(115201047)
				local var_194_4 = arg_191_1:FormatText(var_194_3.content)

				arg_191_1.text_.text = var_194_4

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_5 = 41
				local var_194_6 = utf8.len(var_194_4)
				local var_194_7 = var_194_5 <= 0 and var_194_1 or var_194_1 * (var_194_6 / var_194_5)

				if var_194_7 > 0 and var_194_1 < var_194_7 then
					arg_191_1.talkMaxDuration = var_194_7

					if var_194_7 + var_194_0 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_7 + var_194_0
					end
				end

				arg_191_1.text_.text = var_194_4
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201047", "story_v_out_115201.awb") ~= 0 then
					local var_194_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201047", "story_v_out_115201.awb") / 1000

					if var_194_8 + var_194_0 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_8 + var_194_0
					end

					if var_194_3.prefab_name ~= "" and arg_191_1.actors_[var_194_3.prefab_name] ~= nil then
						local var_194_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_3.prefab_name].transform, "story_v_out_115201", "115201047", "story_v_out_115201.awb")

						arg_191_1:RecordAudio("115201047", var_194_9)
						arg_191_1:RecordAudio("115201047", var_194_9)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_115201", "115201047", "story_v_out_115201.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_115201", "115201047", "story_v_out_115201.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_10 = math.max(var_194_1, arg_191_1.talkMaxDuration)

			if var_194_0 <= arg_191_1.time_ and arg_191_1.time_ < var_194_0 + var_194_10 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_0) / var_194_10

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_0 + var_194_10 and arg_191_1.time_ < var_194_0 + var_194_10 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play115201048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 115201048
		arg_195_1.duration_ = 2.8

		local var_195_0 = {
			ja = 2.8,
			ko = 2.466,
			zh = 2.6,
			en = 1.2
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
				arg_195_0:Play115201049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 0.3

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_2 = arg_195_1:FormatText(StoryNameCfg[263].name)

				arg_195_1.leftNameTxt_.text = var_198_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_3 = arg_195_1:GetWordFromCfg(115201048)
				local var_198_4 = arg_195_1:FormatText(var_198_3.content)

				arg_195_1.text_.text = var_198_4

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_5 = 12
				local var_198_6 = utf8.len(var_198_4)
				local var_198_7 = var_198_5 <= 0 and var_198_1 or var_198_1 * (var_198_6 / var_198_5)

				if var_198_7 > 0 and var_198_1 < var_198_7 then
					arg_195_1.talkMaxDuration = var_198_7

					if var_198_7 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_7 + var_198_0
					end
				end

				arg_195_1.text_.text = var_198_4
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201048", "story_v_out_115201.awb") ~= 0 then
					local var_198_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201048", "story_v_out_115201.awb") / 1000

					if var_198_8 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_8 + var_198_0
					end

					if var_198_3.prefab_name ~= "" and arg_195_1.actors_[var_198_3.prefab_name] ~= nil then
						local var_198_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_3.prefab_name].transform, "story_v_out_115201", "115201048", "story_v_out_115201.awb")

						arg_195_1:RecordAudio("115201048", var_198_9)
						arg_195_1:RecordAudio("115201048", var_198_9)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_115201", "115201048", "story_v_out_115201.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_115201", "115201048", "story_v_out_115201.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_10 = math.max(var_198_1, arg_195_1.talkMaxDuration)

			if var_198_0 <= arg_195_1.time_ and arg_195_1.time_ < var_198_0 + var_198_10 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_0) / var_198_10

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_0 + var_198_10 and arg_195_1.time_ < var_198_0 + var_198_10 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play115201049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 115201049
		arg_199_1.duration_ = 1.5

		local var_199_0 = {
			ja = 0.999999999999,
			ko = 0.999999999999,
			zh = 1.5,
			en = 1.033
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
				arg_199_0:Play115201050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 0.075

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_2 = arg_199_1:FormatText(StoryNameCfg[260].name)

				arg_199_1.leftNameTxt_.text = var_202_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_3 = arg_199_1:GetWordFromCfg(115201049)
				local var_202_4 = arg_199_1:FormatText(var_202_3.content)

				arg_199_1.text_.text = var_202_4

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_5 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201049", "story_v_out_115201.awb") ~= 0 then
					local var_202_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201049", "story_v_out_115201.awb") / 1000

					if var_202_8 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_8 + var_202_0
					end

					if var_202_3.prefab_name ~= "" and arg_199_1.actors_[var_202_3.prefab_name] ~= nil then
						local var_202_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_3.prefab_name].transform, "story_v_out_115201", "115201049", "story_v_out_115201.awb")

						arg_199_1:RecordAudio("115201049", var_202_9)
						arg_199_1:RecordAudio("115201049", var_202_9)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_115201", "115201049", "story_v_out_115201.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_115201", "115201049", "story_v_out_115201.awb")
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
	Play115201050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 115201050
		arg_203_1.duration_ = 5.666

		local var_203_0 = {
			ja = 5.4,
			ko = 3.866,
			zh = 5.666,
			en = 3.133
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
				arg_203_0:Play115201051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0
			local var_206_1 = 0.7

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_2 = arg_203_1:FormatText(StoryNameCfg[260].name)

				arg_203_1.leftNameTxt_.text = var_206_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_3 = arg_203_1:GetWordFromCfg(115201050)
				local var_206_4 = arg_203_1:FormatText(var_206_3.content)

				arg_203_1.text_.text = var_206_4

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_5 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201050", "story_v_out_115201.awb") ~= 0 then
					local var_206_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201050", "story_v_out_115201.awb") / 1000

					if var_206_8 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_8 + var_206_0
					end

					if var_206_3.prefab_name ~= "" and arg_203_1.actors_[var_206_3.prefab_name] ~= nil then
						local var_206_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_3.prefab_name].transform, "story_v_out_115201", "115201050", "story_v_out_115201.awb")

						arg_203_1:RecordAudio("115201050", var_206_9)
						arg_203_1:RecordAudio("115201050", var_206_9)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_115201", "115201050", "story_v_out_115201.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_115201", "115201050", "story_v_out_115201.awb")
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
	Play115201051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 115201051
		arg_207_1.duration_ = 15.066

		local var_207_0 = {
			ja = 10.666,
			ko = 12.033,
			zh = 15.066,
			en = 13.466
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
				arg_207_0:Play115201052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 1.6

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_2 = arg_207_1:FormatText(StoryNameCfg[260].name)

				arg_207_1.leftNameTxt_.text = var_210_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_3 = arg_207_1:GetWordFromCfg(115201051)
				local var_210_4 = arg_207_1:FormatText(var_210_3.content)

				arg_207_1.text_.text = var_210_4

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_5 = 64
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201051", "story_v_out_115201.awb") ~= 0 then
					local var_210_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201051", "story_v_out_115201.awb") / 1000

					if var_210_8 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_8 + var_210_0
					end

					if var_210_3.prefab_name ~= "" and arg_207_1.actors_[var_210_3.prefab_name] ~= nil then
						local var_210_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_3.prefab_name].transform, "story_v_out_115201", "115201051", "story_v_out_115201.awb")

						arg_207_1:RecordAudio("115201051", var_210_9)
						arg_207_1:RecordAudio("115201051", var_210_9)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_115201", "115201051", "story_v_out_115201.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_115201", "115201051", "story_v_out_115201.awb")
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
	Play115201052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 115201052
		arg_211_1.duration_ = 13.733

		local var_211_0 = {
			ja = 13.733,
			ko = 11.2,
			zh = 10.533,
			en = 11.3
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
				arg_211_0:Play115201053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 1.1

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_2 = arg_211_1:FormatText(StoryNameCfg[260].name)

				arg_211_1.leftNameTxt_.text = var_214_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_3 = arg_211_1:GetWordFromCfg(115201052)
				local var_214_4 = arg_211_1:FormatText(var_214_3.content)

				arg_211_1.text_.text = var_214_4

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_5 = 43
				local var_214_6 = utf8.len(var_214_4)
				local var_214_7 = var_214_5 <= 0 and var_214_1 or var_214_1 * (var_214_6 / var_214_5)

				if var_214_7 > 0 and var_214_1 < var_214_7 then
					arg_211_1.talkMaxDuration = var_214_7

					if var_214_7 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_7 + var_214_0
					end
				end

				arg_211_1.text_.text = var_214_4
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201052", "story_v_out_115201.awb") ~= 0 then
					local var_214_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201052", "story_v_out_115201.awb") / 1000

					if var_214_8 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_8 + var_214_0
					end

					if var_214_3.prefab_name ~= "" and arg_211_1.actors_[var_214_3.prefab_name] ~= nil then
						local var_214_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_3.prefab_name].transform, "story_v_out_115201", "115201052", "story_v_out_115201.awb")

						arg_211_1:RecordAudio("115201052", var_214_9)
						arg_211_1:RecordAudio("115201052", var_214_9)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_115201", "115201052", "story_v_out_115201.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_115201", "115201052", "story_v_out_115201.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_10 = math.max(var_214_1, arg_211_1.talkMaxDuration)

			if var_214_0 <= arg_211_1.time_ and arg_211_1.time_ < var_214_0 + var_214_10 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_0) / var_214_10

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_0 + var_214_10 and arg_211_1.time_ < var_214_0 + var_214_10 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play115201053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 115201053
		arg_215_1.duration_ = 11.633

		local var_215_0 = {
			ja = 11.633,
			ko = 3.533,
			zh = 4.933,
			en = 4.733
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
				arg_215_0:Play115201054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 0.575

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_2 = arg_215_1:FormatText(StoryNameCfg[260].name)

				arg_215_1.leftNameTxt_.text = var_218_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_3 = arg_215_1:GetWordFromCfg(115201053)
				local var_218_4 = arg_215_1:FormatText(var_218_3.content)

				arg_215_1.text_.text = var_218_4

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201053", "story_v_out_115201.awb") ~= 0 then
					local var_218_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201053", "story_v_out_115201.awb") / 1000

					if var_218_8 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_8 + var_218_0
					end

					if var_218_3.prefab_name ~= "" and arg_215_1.actors_[var_218_3.prefab_name] ~= nil then
						local var_218_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_3.prefab_name].transform, "story_v_out_115201", "115201053", "story_v_out_115201.awb")

						arg_215_1:RecordAudio("115201053", var_218_9)
						arg_215_1:RecordAudio("115201053", var_218_9)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_115201", "115201053", "story_v_out_115201.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_115201", "115201053", "story_v_out_115201.awb")
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
	Play115201054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 115201054
		arg_219_1.duration_ = 13.7

		local var_219_0 = {
			ja = 13.7,
			ko = 7.433,
			zh = 7.266,
			en = 7.8
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
				arg_219_0:Play115201055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 0
			local var_222_1 = 0.85

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_2 = arg_219_1:FormatText(StoryNameCfg[260].name)

				arg_219_1.leftNameTxt_.text = var_222_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_3 = arg_219_1:GetWordFromCfg(115201054)
				local var_222_4 = arg_219_1:FormatText(var_222_3.content)

				arg_219_1.text_.text = var_222_4

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201054", "story_v_out_115201.awb") ~= 0 then
					local var_222_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201054", "story_v_out_115201.awb") / 1000

					if var_222_8 + var_222_0 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_8 + var_222_0
					end

					if var_222_3.prefab_name ~= "" and arg_219_1.actors_[var_222_3.prefab_name] ~= nil then
						local var_222_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_3.prefab_name].transform, "story_v_out_115201", "115201054", "story_v_out_115201.awb")

						arg_219_1:RecordAudio("115201054", var_222_9)
						arg_219_1:RecordAudio("115201054", var_222_9)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_115201", "115201054", "story_v_out_115201.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_115201", "115201054", "story_v_out_115201.awb")
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
	Play115201055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 115201055
		arg_223_1.duration_ = 4.1

		local var_223_0 = {
			ja = 4.1,
			ko = 1.833,
			zh = 1.3,
			en = 1.533
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
				arg_223_0:Play115201056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = 0
			local var_226_1 = 0.1

			if var_226_0 < arg_223_1.time_ and arg_223_1.time_ <= var_226_0 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_2 = arg_223_1:FormatText(StoryNameCfg[42].name)

				arg_223_1.leftNameTxt_.text = var_226_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, true)
				arg_223_1.iconController_:SetSelectedState("hero")

				arg_223_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4010")

				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_3 = arg_223_1:GetWordFromCfg(115201055)
				local var_226_4 = arg_223_1:FormatText(var_226_3.content)

				arg_223_1.text_.text = var_226_4

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_5 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201055", "story_v_out_115201.awb") ~= 0 then
					local var_226_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201055", "story_v_out_115201.awb") / 1000

					if var_226_8 + var_226_0 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_8 + var_226_0
					end

					if var_226_3.prefab_name ~= "" and arg_223_1.actors_[var_226_3.prefab_name] ~= nil then
						local var_226_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_3.prefab_name].transform, "story_v_out_115201", "115201055", "story_v_out_115201.awb")

						arg_223_1:RecordAudio("115201055", var_226_9)
						arg_223_1:RecordAudio("115201055", var_226_9)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_115201", "115201055", "story_v_out_115201.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_115201", "115201055", "story_v_out_115201.awb")
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
	Play115201056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 115201056
		arg_227_1.duration_ = 1.733

		local var_227_0 = {
			ja = 1,
			ko = 0.999999999999,
			zh = 1.4,
			en = 1.733
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
				arg_227_0:Play115201057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0
			local var_230_1 = 0.05

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_2 = arg_227_1:FormatText(StoryNameCfg[263].name)

				arg_227_1.leftNameTxt_.text = var_230_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_3 = arg_227_1:GetWordFromCfg(115201056)
				local var_230_4 = arg_227_1:FormatText(var_230_3.content)

				arg_227_1.text_.text = var_230_4

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_5 = 2
				local var_230_6 = utf8.len(var_230_4)
				local var_230_7 = var_230_5 <= 0 and var_230_1 or var_230_1 * (var_230_6 / var_230_5)

				if var_230_7 > 0 and var_230_1 < var_230_7 then
					arg_227_1.talkMaxDuration = var_230_7

					if var_230_7 + var_230_0 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_7 + var_230_0
					end
				end

				arg_227_1.text_.text = var_230_4
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201056", "story_v_out_115201.awb") ~= 0 then
					local var_230_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201056", "story_v_out_115201.awb") / 1000

					if var_230_8 + var_230_0 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_8 + var_230_0
					end

					if var_230_3.prefab_name ~= "" and arg_227_1.actors_[var_230_3.prefab_name] ~= nil then
						local var_230_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_3.prefab_name].transform, "story_v_out_115201", "115201056", "story_v_out_115201.awb")

						arg_227_1:RecordAudio("115201056", var_230_9)
						arg_227_1:RecordAudio("115201056", var_230_9)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_115201", "115201056", "story_v_out_115201.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_115201", "115201056", "story_v_out_115201.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_10 = math.max(var_230_1, arg_227_1.talkMaxDuration)

			if var_230_0 <= arg_227_1.time_ and arg_227_1.time_ < var_230_0 + var_230_10 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_0) / var_230_10

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_0 + var_230_10 and arg_227_1.time_ < var_230_0 + var_230_10 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play115201057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 115201057
		arg_231_1.duration_ = 7

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play115201058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.bgs_.RO0206
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				local var_234_2 = var_234_0:GetComponent("SpriteRenderer")

				if var_234_2 then
					var_234_2.material = arg_231_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_234_3 = var_234_2.material
					local var_234_4 = var_234_3:GetColor("_Color")

					arg_231_1.var_.alphaOldValueRO0206 = var_234_4.a
					arg_231_1.var_.alphaMatValueRO0206 = var_234_3
				end

				arg_231_1.var_.alphaOldValueRO0206 = 1
			end

			local var_234_5 = 2

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_5 then
				local var_234_6 = (arg_231_1.time_ - var_234_1) / var_234_5
				local var_234_7 = Mathf.Lerp(arg_231_1.var_.alphaOldValueRO0206, 0, var_234_6)

				if arg_231_1.var_.alphaMatValueRO0206 then
					local var_234_8 = arg_231_1.var_.alphaMatValueRO0206
					local var_234_9 = var_234_8:GetColor("_Color")

					var_234_9.a = var_234_7

					var_234_8:SetColor("_Color", var_234_9)
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_5 and arg_231_1.time_ < var_234_1 + var_234_5 + arg_234_0 and arg_231_1.var_.alphaMatValueRO0206 then
				local var_234_10 = arg_231_1.var_.alphaMatValueRO0206
				local var_234_11 = var_234_10:GetColor("_Color")

				var_234_11.a = 0

				var_234_10:SetColor("_Color", var_234_11)
			end

			if arg_231_1.frameCnt_ <= 1 then
				arg_231_1.dialog_:SetActive(false)
			end

			local var_234_12 = 2
			local var_234_13 = 1.2

			if var_234_12 < arg_231_1.time_ and arg_231_1.time_ <= var_234_12 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0

				arg_231_1.dialog_:SetActive(true)

				local var_234_14 = LeanTween.value(arg_231_1.dialog_, 0, 1, 0.3)

				var_234_14:setOnUpdate(LuaHelper.FloatAction(function(arg_235_0)
					arg_231_1.dialogCg_.alpha = arg_235_0
				end))
				var_234_14:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_231_1.dialog_)
					var_234_14:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_231_1.duration_ = arg_231_1.duration_ + 0.3

				SetActive(arg_231_1.leftNameGo_, false)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_15 = arg_231_1:GetWordFromCfg(115201057)
				local var_234_16 = arg_231_1:FormatText(var_234_15.content)

				arg_231_1.text_.text = var_234_16

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_17 = 48
				local var_234_18 = utf8.len(var_234_16)
				local var_234_19 = var_234_17 <= 0 and var_234_13 or var_234_13 * (var_234_18 / var_234_17)

				if var_234_19 > 0 and var_234_13 < var_234_19 then
					arg_231_1.talkMaxDuration = var_234_19
					var_234_12 = var_234_12 + 0.3

					if var_234_19 + var_234_12 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_19 + var_234_12
					end
				end

				arg_231_1.text_.text = var_234_16
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)
				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_20 = var_234_12 + 0.3
			local var_234_21 = math.max(var_234_13, arg_231_1.talkMaxDuration)

			if var_234_20 <= arg_231_1.time_ and arg_231_1.time_ < var_234_20 + var_234_21 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_20) / var_234_21

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_20 + var_234_21 and arg_231_1.time_ < var_234_20 + var_234_21 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play115201058 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 115201058
		arg_237_1.duration_ = 6.1

		local var_237_0 = {
			ja = 5.8,
			ko = 6.1,
			zh = 5.4,
			en = 4.6
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
				arg_237_0:Play115201059(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.bgs_.RO0206
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 then
				local var_240_2 = var_240_0:GetComponent("SpriteRenderer")

				if var_240_2 then
					var_240_2.material = arg_237_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_240_3 = var_240_2.material
					local var_240_4 = var_240_3:GetColor("_Color")

					arg_237_1.var_.alphaOldValueRO0206 = var_240_4.a
					arg_237_1.var_.alphaMatValueRO0206 = var_240_3
				end

				arg_237_1.var_.alphaOldValueRO0206 = 0
			end

			local var_240_5 = 2

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_5 then
				local var_240_6 = (arg_237_1.time_ - var_240_1) / var_240_5
				local var_240_7 = Mathf.Lerp(arg_237_1.var_.alphaOldValueRO0206, 1, var_240_6)

				if arg_237_1.var_.alphaMatValueRO0206 then
					local var_240_8 = arg_237_1.var_.alphaMatValueRO0206
					local var_240_9 = var_240_8:GetColor("_Color")

					var_240_9.a = var_240_7

					var_240_8:SetColor("_Color", var_240_9)
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_5 and arg_237_1.time_ < var_240_1 + var_240_5 + arg_240_0 and arg_237_1.var_.alphaMatValueRO0206 then
				local var_240_10 = arg_237_1.var_.alphaMatValueRO0206
				local var_240_11 = var_240_10:GetColor("_Color")

				var_240_11.a = 1

				var_240_10:SetColor("_Color", var_240_11)
			end

			local var_240_12 = 2
			local var_240_13 = 0.225

			if var_240_12 < arg_237_1.time_ and arg_237_1.time_ <= var_240_12 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_14 = arg_237_1:FormatText(StoryNameCfg[263].name)

				arg_237_1.leftNameTxt_.text = var_240_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_15 = arg_237_1:GetWordFromCfg(115201058)
				local var_240_16 = arg_237_1:FormatText(var_240_15.content)

				arg_237_1.text_.text = var_240_16

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_17 = 9
				local var_240_18 = utf8.len(var_240_16)
				local var_240_19 = var_240_17 <= 0 and var_240_13 or var_240_13 * (var_240_18 / var_240_17)

				if var_240_19 > 0 and var_240_13 < var_240_19 then
					arg_237_1.talkMaxDuration = var_240_19

					if var_240_19 + var_240_12 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_19 + var_240_12
					end
				end

				arg_237_1.text_.text = var_240_16
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201058", "story_v_out_115201.awb") ~= 0 then
					local var_240_20 = manager.audio:GetVoiceLength("story_v_out_115201", "115201058", "story_v_out_115201.awb") / 1000

					if var_240_20 + var_240_12 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_20 + var_240_12
					end

					if var_240_15.prefab_name ~= "" and arg_237_1.actors_[var_240_15.prefab_name] ~= nil then
						local var_240_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_15.prefab_name].transform, "story_v_out_115201", "115201058", "story_v_out_115201.awb")

						arg_237_1:RecordAudio("115201058", var_240_21)
						arg_237_1:RecordAudio("115201058", var_240_21)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_115201", "115201058", "story_v_out_115201.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_115201", "115201058", "story_v_out_115201.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_22 = math.max(var_240_13, arg_237_1.talkMaxDuration)

			if var_240_12 <= arg_237_1.time_ and arg_237_1.time_ < var_240_12 + var_240_22 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_12) / var_240_22

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_12 + var_240_22 and arg_237_1.time_ < var_240_12 + var_240_22 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play115201059 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 115201059
		arg_241_1.duration_ = 3.866

		local var_241_0 = {
			ja = 1.4,
			ko = 2.9,
			zh = 3.866,
			en = 2.8
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
				arg_241_0:Play115201060(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = 0
			local var_244_1 = 0.2

			if var_244_0 < arg_241_1.time_ and arg_241_1.time_ <= var_244_0 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_2 = arg_241_1:FormatText(StoryNameCfg[260].name)

				arg_241_1.leftNameTxt_.text = var_244_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_3 = arg_241_1:GetWordFromCfg(115201059)
				local var_244_4 = arg_241_1:FormatText(var_244_3.content)

				arg_241_1.text_.text = var_244_4

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_5 = 8
				local var_244_6 = utf8.len(var_244_4)
				local var_244_7 = var_244_5 <= 0 and var_244_1 or var_244_1 * (var_244_6 / var_244_5)

				if var_244_7 > 0 and var_244_1 < var_244_7 then
					arg_241_1.talkMaxDuration = var_244_7

					if var_244_7 + var_244_0 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_7 + var_244_0
					end
				end

				arg_241_1.text_.text = var_244_4
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201059", "story_v_out_115201.awb") ~= 0 then
					local var_244_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201059", "story_v_out_115201.awb") / 1000

					if var_244_8 + var_244_0 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_8 + var_244_0
					end

					if var_244_3.prefab_name ~= "" and arg_241_1.actors_[var_244_3.prefab_name] ~= nil then
						local var_244_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_3.prefab_name].transform, "story_v_out_115201", "115201059", "story_v_out_115201.awb")

						arg_241_1:RecordAudio("115201059", var_244_9)
						arg_241_1:RecordAudio("115201059", var_244_9)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_115201", "115201059", "story_v_out_115201.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_115201", "115201059", "story_v_out_115201.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_10 = math.max(var_244_1, arg_241_1.talkMaxDuration)

			if var_244_0 <= arg_241_1.time_ and arg_241_1.time_ < var_244_0 + var_244_10 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_0) / var_244_10

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_0 + var_244_10 and arg_241_1.time_ < var_244_0 + var_244_10 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play115201060 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 115201060
		arg_245_1.duration_ = 18.366

		local var_245_0 = {
			ja = 13.933,
			ko = 18.366,
			zh = 15.566,
			en = 15.5
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
				arg_245_0:Play115201061(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 0
			local var_248_1 = 1.35

			if var_248_0 < arg_245_1.time_ and arg_245_1.time_ <= var_248_0 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_2 = arg_245_1:FormatText(StoryNameCfg[263].name)

				arg_245_1.leftNameTxt_.text = var_248_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_3 = arg_245_1:GetWordFromCfg(115201060)
				local var_248_4 = arg_245_1:FormatText(var_248_3.content)

				arg_245_1.text_.text = var_248_4

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_5 = 54
				local var_248_6 = utf8.len(var_248_4)
				local var_248_7 = var_248_5 <= 0 and var_248_1 or var_248_1 * (var_248_6 / var_248_5)

				if var_248_7 > 0 and var_248_1 < var_248_7 then
					arg_245_1.talkMaxDuration = var_248_7

					if var_248_7 + var_248_0 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_7 + var_248_0
					end
				end

				arg_245_1.text_.text = var_248_4
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201060", "story_v_out_115201.awb") ~= 0 then
					local var_248_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201060", "story_v_out_115201.awb") / 1000

					if var_248_8 + var_248_0 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_8 + var_248_0
					end

					if var_248_3.prefab_name ~= "" and arg_245_1.actors_[var_248_3.prefab_name] ~= nil then
						local var_248_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_3.prefab_name].transform, "story_v_out_115201", "115201060", "story_v_out_115201.awb")

						arg_245_1:RecordAudio("115201060", var_248_9)
						arg_245_1:RecordAudio("115201060", var_248_9)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_115201", "115201060", "story_v_out_115201.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_115201", "115201060", "story_v_out_115201.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_10 = math.max(var_248_1, arg_245_1.talkMaxDuration)

			if var_248_0 <= arg_245_1.time_ and arg_245_1.time_ < var_248_0 + var_248_10 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_0) / var_248_10

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_0 + var_248_10 and arg_245_1.time_ < var_248_0 + var_248_10 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play115201061 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 115201061
		arg_249_1.duration_ = 2.4

		local var_249_0 = {
			ja = 1.133,
			ko = 2.333,
			zh = 2.4,
			en = 2.266
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
				arg_249_0:Play115201062(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = 0
			local var_252_1 = 0.2

			if var_252_0 < arg_249_1.time_ and arg_249_1.time_ <= var_252_0 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_2 = arg_249_1:FormatText(StoryNameCfg[260].name)

				arg_249_1.leftNameTxt_.text = var_252_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_3 = arg_249_1:GetWordFromCfg(115201061)
				local var_252_4 = arg_249_1:FormatText(var_252_3.content)

				arg_249_1.text_.text = var_252_4

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201061", "story_v_out_115201.awb") ~= 0 then
					local var_252_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201061", "story_v_out_115201.awb") / 1000

					if var_252_8 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_8 + var_252_0
					end

					if var_252_3.prefab_name ~= "" and arg_249_1.actors_[var_252_3.prefab_name] ~= nil then
						local var_252_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_3.prefab_name].transform, "story_v_out_115201", "115201061", "story_v_out_115201.awb")

						arg_249_1:RecordAudio("115201061", var_252_9)
						arg_249_1:RecordAudio("115201061", var_252_9)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_115201", "115201061", "story_v_out_115201.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_115201", "115201061", "story_v_out_115201.awb")
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
	Play115201062 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 115201062
		arg_253_1.duration_ = 13.166

		local var_253_0 = {
			ja = 13.166,
			ko = 11.466,
			zh = 10,
			en = 11.833
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
				arg_253_0:Play115201063(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0
			local var_256_1 = 0.925

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_2 = arg_253_1:FormatText(StoryNameCfg[263].name)

				arg_253_1.leftNameTxt_.text = var_256_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_3 = arg_253_1:GetWordFromCfg(115201062)
				local var_256_4 = arg_253_1:FormatText(var_256_3.content)

				arg_253_1.text_.text = var_256_4

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_5 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201062", "story_v_out_115201.awb") ~= 0 then
					local var_256_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201062", "story_v_out_115201.awb") / 1000

					if var_256_8 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_8 + var_256_0
					end

					if var_256_3.prefab_name ~= "" and arg_253_1.actors_[var_256_3.prefab_name] ~= nil then
						local var_256_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_3.prefab_name].transform, "story_v_out_115201", "115201062", "story_v_out_115201.awb")

						arg_253_1:RecordAudio("115201062", var_256_9)
						arg_253_1:RecordAudio("115201062", var_256_9)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_115201", "115201062", "story_v_out_115201.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_115201", "115201062", "story_v_out_115201.awb")
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
	Play115201063 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 115201063
		arg_257_1.duration_ = 14.3

		local var_257_0 = {
			ja = 14.3,
			ko = 10.8,
			zh = 11.3,
			en = 10.866
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
				arg_257_0:Play115201064(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0
			local var_260_1 = 1.1

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_2 = arg_257_1:FormatText(StoryNameCfg[263].name)

				arg_257_1.leftNameTxt_.text = var_260_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_3 = arg_257_1:GetWordFromCfg(115201063)
				local var_260_4 = arg_257_1:FormatText(var_260_3.content)

				arg_257_1.text_.text = var_260_4

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_5 = 44
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201063", "story_v_out_115201.awb") ~= 0 then
					local var_260_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201063", "story_v_out_115201.awb") / 1000

					if var_260_8 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_8 + var_260_0
					end

					if var_260_3.prefab_name ~= "" and arg_257_1.actors_[var_260_3.prefab_name] ~= nil then
						local var_260_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_3.prefab_name].transform, "story_v_out_115201", "115201063", "story_v_out_115201.awb")

						arg_257_1:RecordAudio("115201063", var_260_9)
						arg_257_1:RecordAudio("115201063", var_260_9)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_115201", "115201063", "story_v_out_115201.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_115201", "115201063", "story_v_out_115201.awb")
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
	Play115201064 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 115201064
		arg_261_1.duration_ = 5.066

		local var_261_0 = {
			ja = 5,
			ko = 4,
			zh = 3.833,
			en = 5.066
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
				arg_261_0:Play115201065(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0
			local var_264_1 = 0.3

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_2 = arg_261_1:FormatText(StoryNameCfg[263].name)

				arg_261_1.leftNameTxt_.text = var_264_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_3 = arg_261_1:GetWordFromCfg(115201064)
				local var_264_4 = arg_261_1:FormatText(var_264_3.content)

				arg_261_1.text_.text = var_264_4

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_5 = 13
				local var_264_6 = utf8.len(var_264_4)
				local var_264_7 = var_264_5 <= 0 and var_264_1 or var_264_1 * (var_264_6 / var_264_5)

				if var_264_7 > 0 and var_264_1 < var_264_7 then
					arg_261_1.talkMaxDuration = var_264_7

					if var_264_7 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_7 + var_264_0
					end
				end

				arg_261_1.text_.text = var_264_4
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201064", "story_v_out_115201.awb") ~= 0 then
					local var_264_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201064", "story_v_out_115201.awb") / 1000

					if var_264_8 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_8 + var_264_0
					end

					if var_264_3.prefab_name ~= "" and arg_261_1.actors_[var_264_3.prefab_name] ~= nil then
						local var_264_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_3.prefab_name].transform, "story_v_out_115201", "115201064", "story_v_out_115201.awb")

						arg_261_1:RecordAudio("115201064", var_264_9)
						arg_261_1:RecordAudio("115201064", var_264_9)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_115201", "115201064", "story_v_out_115201.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_115201", "115201064", "story_v_out_115201.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_10 = math.max(var_264_1, arg_261_1.talkMaxDuration)

			if var_264_0 <= arg_261_1.time_ and arg_261_1.time_ < var_264_0 + var_264_10 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_0) / var_264_10

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_0 + var_264_10 and arg_261_1.time_ < var_264_0 + var_264_10 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play115201065 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 115201065
		arg_265_1.duration_ = 1.5

		local var_265_0 = {
			ja = 1.233,
			ko = 0.999999999999,
			zh = 1.5,
			en = 1.5
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
				arg_265_0:Play115201066(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0
			local var_268_1 = 0.05

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_2 = arg_265_1:FormatText(StoryNameCfg[260].name)

				arg_265_1.leftNameTxt_.text = var_268_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_3 = arg_265_1:GetWordFromCfg(115201065)
				local var_268_4 = arg_265_1:FormatText(var_268_3.content)

				arg_265_1.text_.text = var_268_4

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_5 = 2
				local var_268_6 = utf8.len(var_268_4)
				local var_268_7 = var_268_5 <= 0 and var_268_1 or var_268_1 * (var_268_6 / var_268_5)

				if var_268_7 > 0 and var_268_1 < var_268_7 then
					arg_265_1.talkMaxDuration = var_268_7

					if var_268_7 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_7 + var_268_0
					end
				end

				arg_265_1.text_.text = var_268_4
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201065", "story_v_out_115201.awb") ~= 0 then
					local var_268_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201065", "story_v_out_115201.awb") / 1000

					if var_268_8 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_8 + var_268_0
					end

					if var_268_3.prefab_name ~= "" and arg_265_1.actors_[var_268_3.prefab_name] ~= nil then
						local var_268_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_3.prefab_name].transform, "story_v_out_115201", "115201065", "story_v_out_115201.awb")

						arg_265_1:RecordAudio("115201065", var_268_9)
						arg_265_1:RecordAudio("115201065", var_268_9)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_115201", "115201065", "story_v_out_115201.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_115201", "115201065", "story_v_out_115201.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_10 = math.max(var_268_1, arg_265_1.talkMaxDuration)

			if var_268_0 <= arg_265_1.time_ and arg_265_1.time_ < var_268_0 + var_268_10 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_0) / var_268_10

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_0 + var_268_10 and arg_265_1.time_ < var_268_0 + var_268_10 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play115201066 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 115201066
		arg_269_1.duration_ = 4.6

		local var_269_0 = {
			ja = 4.6,
			ko = 2.433,
			zh = 3.066,
			en = 2.233
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
				arg_269_0:Play115201067(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = 0
			local var_272_1 = 0.2

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_2 = arg_269_1:FormatText(StoryNameCfg[260].name)

				arg_269_1.leftNameTxt_.text = var_272_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_3 = arg_269_1:GetWordFromCfg(115201066)
				local var_272_4 = arg_269_1:FormatText(var_272_3.content)

				arg_269_1.text_.text = var_272_4

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201066", "story_v_out_115201.awb") ~= 0 then
					local var_272_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201066", "story_v_out_115201.awb") / 1000

					if var_272_8 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_8 + var_272_0
					end

					if var_272_3.prefab_name ~= "" and arg_269_1.actors_[var_272_3.prefab_name] ~= nil then
						local var_272_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_3.prefab_name].transform, "story_v_out_115201", "115201066", "story_v_out_115201.awb")

						arg_269_1:RecordAudio("115201066", var_272_9)
						arg_269_1:RecordAudio("115201066", var_272_9)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_115201", "115201066", "story_v_out_115201.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_115201", "115201066", "story_v_out_115201.awb")
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
	Play115201067 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 115201067
		arg_273_1.duration_ = 9

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play115201068(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1.mask_.enabled = true
				arg_273_1.mask_.raycastTarget = true

				arg_273_1:SetGaussion(false)
			end

			local var_276_1 = 2

			if var_276_0 <= arg_273_1.time_ and arg_273_1.time_ < var_276_0 + var_276_1 then
				local var_276_2 = (arg_273_1.time_ - var_276_0) / var_276_1
				local var_276_3 = Color.New(0, 0, 0)

				var_276_3.a = Mathf.Lerp(0, 1, var_276_2)
				arg_273_1.mask_.color = var_276_3
			end

			if arg_273_1.time_ >= var_276_0 + var_276_1 and arg_273_1.time_ < var_276_0 + var_276_1 + arg_276_0 then
				local var_276_4 = Color.New(0, 0, 0)

				var_276_4.a = 1
				arg_273_1.mask_.color = var_276_4
			end

			local var_276_5 = 2

			if var_276_5 < arg_273_1.time_ and arg_273_1.time_ <= var_276_5 + arg_276_0 then
				arg_273_1.mask_.enabled = true
				arg_273_1.mask_.raycastTarget = true

				arg_273_1:SetGaussion(false)
			end

			local var_276_6 = 2

			if var_276_5 <= arg_273_1.time_ and arg_273_1.time_ < var_276_5 + var_276_6 then
				local var_276_7 = (arg_273_1.time_ - var_276_5) / var_276_6
				local var_276_8 = Color.New(0, 0, 0)

				var_276_8.a = Mathf.Lerp(1, 0, var_276_7)
				arg_273_1.mask_.color = var_276_8
			end

			if arg_273_1.time_ >= var_276_5 + var_276_6 and arg_273_1.time_ < var_276_5 + var_276_6 + arg_276_0 then
				local var_276_9 = Color.New(0, 0, 0)
				local var_276_10 = 0

				arg_273_1.mask_.enabled = false
				var_276_9.a = var_276_10
				arg_273_1.mask_.color = var_276_9
			end

			local var_276_11 = arg_273_1.bgs_.RO0206.transform
			local var_276_12 = 2

			if var_276_12 < arg_273_1.time_ and arg_273_1.time_ <= var_276_12 + arg_276_0 then
				arg_273_1.var_.moveOldPosRO0206 = var_276_11.localPosition
			end

			local var_276_13 = 0.001

			if var_276_12 <= arg_273_1.time_ and arg_273_1.time_ < var_276_12 + var_276_13 then
				local var_276_14 = (arg_273_1.time_ - var_276_12) / var_276_13
				local var_276_15 = Vector3.New(0, 1, 9.5)

				var_276_11.localPosition = Vector3.Lerp(arg_273_1.var_.moveOldPosRO0206, var_276_15, var_276_14)
			end

			if arg_273_1.time_ >= var_276_12 + var_276_13 and arg_273_1.time_ < var_276_12 + var_276_13 + arg_276_0 then
				var_276_11.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_276_16 = arg_273_1.bgs_.RO0206.transform
			local var_276_17 = 2.01666666666667

			if var_276_17 < arg_273_1.time_ and arg_273_1.time_ <= var_276_17 + arg_276_0 then
				arg_273_1.var_.moveOldPosRO0206 = var_276_16.localPosition
			end

			local var_276_18 = 2.5

			if var_276_17 <= arg_273_1.time_ and arg_273_1.time_ < var_276_17 + var_276_18 then
				local var_276_19 = (arg_273_1.time_ - var_276_17) / var_276_18
				local var_276_20 = Vector3.New(0, 1, 10)

				var_276_16.localPosition = Vector3.Lerp(arg_273_1.var_.moveOldPosRO0206, var_276_20, var_276_19)
			end

			if arg_273_1.time_ >= var_276_17 + var_276_18 and arg_273_1.time_ < var_276_17 + var_276_18 + arg_276_0 then
				var_276_16.localPosition = Vector3.New(0, 1, 10)
			end

			local var_276_21 = 4

			if var_276_21 < arg_273_1.time_ and arg_273_1.time_ <= var_276_21 + arg_276_0 then
				arg_273_1.allBtn_.enabled = false
			end

			local var_276_22 = 0.516666666666667

			if arg_273_1.time_ >= var_276_21 + var_276_22 and arg_273_1.time_ < var_276_21 + var_276_22 + arg_276_0 then
				arg_273_1.allBtn_.enabled = true
			end

			if arg_273_1.frameCnt_ <= 1 then
				arg_273_1.dialog_:SetActive(false)
			end

			local var_276_23 = 4
			local var_276_24 = 0.35

			if var_276_23 < arg_273_1.time_ and arg_273_1.time_ <= var_276_23 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0

				arg_273_1.dialog_:SetActive(true)

				local var_276_25 = LeanTween.value(arg_273_1.dialog_, 0, 1, 0.3)

				var_276_25:setOnUpdate(LuaHelper.FloatAction(function(arg_277_0)
					arg_273_1.dialogCg_.alpha = arg_277_0
				end))
				var_276_25:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_273_1.dialog_)
					var_276_25:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_273_1.duration_ = arg_273_1.duration_ + 0.3

				SetActive(arg_273_1.leftNameGo_, false)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_26 = arg_273_1:GetWordFromCfg(115201067)
				local var_276_27 = arg_273_1:FormatText(var_276_26.content)

				arg_273_1.text_.text = var_276_27

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_28 = 14
				local var_276_29 = utf8.len(var_276_27)
				local var_276_30 = var_276_28 <= 0 and var_276_24 or var_276_24 * (var_276_29 / var_276_28)

				if var_276_30 > 0 and var_276_24 < var_276_30 then
					arg_273_1.talkMaxDuration = var_276_30
					var_276_23 = var_276_23 + 0.3

					if var_276_30 + var_276_23 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_30 + var_276_23
					end
				end

				arg_273_1.text_.text = var_276_27
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)
				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_31 = var_276_23 + 0.3
			local var_276_32 = math.max(var_276_24, arg_273_1.talkMaxDuration)

			if var_276_31 <= arg_273_1.time_ and arg_273_1.time_ < var_276_31 + var_276_32 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_31) / var_276_32

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_31 + var_276_32 and arg_273_1.time_ < var_276_31 + var_276_32 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play115201068 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 115201068
		arg_279_1.duration_ = 4.533

		local var_279_0 = {
			ja = 4.533,
			ko = 1.533,
			zh = 1.366,
			en = 1.466
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
				arg_279_0:Play115201069(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = 0
			local var_282_1 = 0.1

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_2 = arg_279_1:FormatText(StoryNameCfg[263].name)

				arg_279_1.leftNameTxt_.text = var_282_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_3 = arg_279_1:GetWordFromCfg(115201068)
				local var_282_4 = arg_279_1:FormatText(var_282_3.content)

				arg_279_1.text_.text = var_282_4

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_5 = 4
				local var_282_6 = utf8.len(var_282_4)
				local var_282_7 = var_282_5 <= 0 and var_282_1 or var_282_1 * (var_282_6 / var_282_5)

				if var_282_7 > 0 and var_282_1 < var_282_7 then
					arg_279_1.talkMaxDuration = var_282_7

					if var_282_7 + var_282_0 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_7 + var_282_0
					end
				end

				arg_279_1.text_.text = var_282_4
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201068", "story_v_out_115201.awb") ~= 0 then
					local var_282_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201068", "story_v_out_115201.awb") / 1000

					if var_282_8 + var_282_0 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_8 + var_282_0
					end

					if var_282_3.prefab_name ~= "" and arg_279_1.actors_[var_282_3.prefab_name] ~= nil then
						local var_282_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_3.prefab_name].transform, "story_v_out_115201", "115201068", "story_v_out_115201.awb")

						arg_279_1:RecordAudio("115201068", var_282_9)
						arg_279_1:RecordAudio("115201068", var_282_9)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_115201", "115201068", "story_v_out_115201.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_115201", "115201068", "story_v_out_115201.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_10 = math.max(var_282_1, arg_279_1.talkMaxDuration)

			if var_282_0 <= arg_279_1.time_ and arg_279_1.time_ < var_282_0 + var_282_10 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_0) / var_282_10

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_0 + var_282_10 and arg_279_1.time_ < var_282_0 + var_282_10 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play115201069 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 115201069
		arg_283_1.duration_ = 1.633

		local var_283_0 = {
			ja = 1.5,
			ko = 1.633,
			zh = 1.366,
			en = 1.433
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
				arg_283_0:Play115201070(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = 0
			local var_286_1 = 0.1

			if var_286_0 < arg_283_1.time_ and arg_283_1.time_ <= var_286_0 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_2 = arg_283_1:FormatText(StoryNameCfg[261].name)

				arg_283_1.leftNameTxt_.text = var_286_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, true)
				arg_283_1.iconController_:SetSelectedState("hero")

				arg_283_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2084")

				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_3 = arg_283_1:GetWordFromCfg(115201069)
				local var_286_4 = arg_283_1:FormatText(var_286_3.content)

				arg_283_1.text_.text = var_286_4

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_5 = 4
				local var_286_6 = utf8.len(var_286_4)
				local var_286_7 = var_286_5 <= 0 and var_286_1 or var_286_1 * (var_286_6 / var_286_5)

				if var_286_7 > 0 and var_286_1 < var_286_7 then
					arg_283_1.talkMaxDuration = var_286_7

					if var_286_7 + var_286_0 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_7 + var_286_0
					end
				end

				arg_283_1.text_.text = var_286_4
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201069", "story_v_out_115201.awb") ~= 0 then
					local var_286_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201069", "story_v_out_115201.awb") / 1000

					if var_286_8 + var_286_0 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_8 + var_286_0
					end

					if var_286_3.prefab_name ~= "" and arg_283_1.actors_[var_286_3.prefab_name] ~= nil then
						local var_286_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_3.prefab_name].transform, "story_v_out_115201", "115201069", "story_v_out_115201.awb")

						arg_283_1:RecordAudio("115201069", var_286_9)
						arg_283_1:RecordAudio("115201069", var_286_9)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_115201", "115201069", "story_v_out_115201.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_115201", "115201069", "story_v_out_115201.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_10 = math.max(var_286_1, arg_283_1.talkMaxDuration)

			if var_286_0 <= arg_283_1.time_ and arg_283_1.time_ < var_286_0 + var_286_10 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_0) / var_286_10

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_0 + var_286_10 and arg_283_1.time_ < var_286_0 + var_286_10 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play115201070 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 115201070
		arg_287_1.duration_ = 2.7

		local var_287_0 = {
			ja = 1.8,
			ko = 1.033,
			zh = 1.766,
			en = 2.7
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
				arg_287_0:Play115201071(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0
			local var_290_1 = 0.1

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_2 = arg_287_1:FormatText(StoryNameCfg[263].name)

				arg_287_1.leftNameTxt_.text = var_290_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_3 = arg_287_1:GetWordFromCfg(115201070)
				local var_290_4 = arg_287_1:FormatText(var_290_3.content)

				arg_287_1.text_.text = var_290_4

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_5 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201070", "story_v_out_115201.awb") ~= 0 then
					local var_290_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201070", "story_v_out_115201.awb") / 1000

					if var_290_8 + var_290_0 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_8 + var_290_0
					end

					if var_290_3.prefab_name ~= "" and arg_287_1.actors_[var_290_3.prefab_name] ~= nil then
						local var_290_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_3.prefab_name].transform, "story_v_out_115201", "115201070", "story_v_out_115201.awb")

						arg_287_1:RecordAudio("115201070", var_290_9)
						arg_287_1:RecordAudio("115201070", var_290_9)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_115201", "115201070", "story_v_out_115201.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_115201", "115201070", "story_v_out_115201.awb")
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
	Play115201071 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 115201071
		arg_291_1.duration_ = 5

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play115201072(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 0
			local var_294_1 = 0.4

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

				local var_294_2 = arg_291_1:GetWordFromCfg(115201071)
				local var_294_3 = arg_291_1:FormatText(var_294_2.content)

				arg_291_1.text_.text = var_294_3

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_4 = 16
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
	Play115201072 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 115201072
		arg_295_1.duration_ = 5

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play115201073(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = 0
			local var_298_1 = 1.2

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

				local var_298_2 = arg_295_1:GetWordFromCfg(115201072)
				local var_298_3 = arg_295_1:FormatText(var_298_2.content)

				arg_295_1.text_.text = var_298_3

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_4 = 48
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
	Play115201073 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 115201073
		arg_299_1.duration_ = 5

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play115201074(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0
			local var_302_1 = 0.8

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, false)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_2 = arg_299_1:GetWordFromCfg(115201073)
				local var_302_3 = arg_299_1:FormatText(var_302_2.content)

				arg_299_1.text_.text = var_302_3

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_4 = 32
				local var_302_5 = utf8.len(var_302_3)
				local var_302_6 = var_302_4 <= 0 and var_302_1 or var_302_1 * (var_302_5 / var_302_4)

				if var_302_6 > 0 and var_302_1 < var_302_6 then
					arg_299_1.talkMaxDuration = var_302_6

					if var_302_6 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_6 + var_302_0
					end
				end

				arg_299_1.text_.text = var_302_3
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)
				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_7 = math.max(var_302_1, arg_299_1.talkMaxDuration)

			if var_302_0 <= arg_299_1.time_ and arg_299_1.time_ < var_302_0 + var_302_7 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_0) / var_302_7

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_0 + var_302_7 and arg_299_1.time_ < var_302_0 + var_302_7 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play115201074 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 115201074
		arg_303_1.duration_ = 9.266

		local var_303_0 = {
			ja = 7.4,
			ko = 7.566,
			zh = 6.866,
			en = 9.266
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
				arg_303_0:Play115201075(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 0
			local var_306_1 = 0.675

			if var_306_0 < arg_303_1.time_ and arg_303_1.time_ <= var_306_0 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_2 = arg_303_1:FormatText(StoryNameCfg[260].name)

				arg_303_1.leftNameTxt_.text = var_306_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_3 = arg_303_1:GetWordFromCfg(115201074)
				local var_306_4 = arg_303_1:FormatText(var_306_3.content)

				arg_303_1.text_.text = var_306_4

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_5 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201074", "story_v_out_115201.awb") ~= 0 then
					local var_306_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201074", "story_v_out_115201.awb") / 1000

					if var_306_8 + var_306_0 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_8 + var_306_0
					end

					if var_306_3.prefab_name ~= "" and arg_303_1.actors_[var_306_3.prefab_name] ~= nil then
						local var_306_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_3.prefab_name].transform, "story_v_out_115201", "115201074", "story_v_out_115201.awb")

						arg_303_1:RecordAudio("115201074", var_306_9)
						arg_303_1:RecordAudio("115201074", var_306_9)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_115201", "115201074", "story_v_out_115201.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_115201", "115201074", "story_v_out_115201.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_10 = math.max(var_306_1, arg_303_1.talkMaxDuration)

			if var_306_0 <= arg_303_1.time_ and arg_303_1.time_ < var_306_0 + var_306_10 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_0) / var_306_10

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_0 + var_306_10 and arg_303_1.time_ < var_306_0 + var_306_10 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play115201075 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 115201075
		arg_307_1.duration_ = 5

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play115201076(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = 0
			local var_310_1 = 1.025

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

				local var_310_2 = arg_307_1:GetWordFromCfg(115201075)
				local var_310_3 = arg_307_1:FormatText(var_310_2.content)

				arg_307_1.text_.text = var_310_3

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_4 = 41
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
	Play115201076 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 115201076
		arg_311_1.duration_ = 9

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play115201077(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = "G03_1"

			if arg_311_1.bgs_[var_314_0] == nil then
				local var_314_1 = Object.Instantiate(arg_311_1.paintGo_)

				var_314_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_314_0)
				var_314_1.name = var_314_0
				var_314_1.transform.parent = arg_311_1.stage_.transform
				var_314_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_311_1.bgs_[var_314_0] = var_314_1
			end

			local var_314_2 = 2

			if var_314_2 < arg_311_1.time_ and arg_311_1.time_ <= var_314_2 + arg_314_0 then
				local var_314_3 = manager.ui.mainCamera.transform.localPosition
				local var_314_4 = Vector3.New(0, 0, 10) + Vector3.New(var_314_3.x, var_314_3.y, 0)
				local var_314_5 = arg_311_1.bgs_.G03_1

				var_314_5.transform.localPosition = var_314_4
				var_314_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_314_6 = var_314_5:GetComponent("SpriteRenderer")

				if var_314_6 and var_314_6.sprite then
					local var_314_7 = (var_314_5.transform.localPosition - var_314_3).z
					local var_314_8 = manager.ui.mainCameraCom_
					local var_314_9 = 2 * var_314_7 * Mathf.Tan(var_314_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_314_10 = var_314_9 * var_314_8.aspect
					local var_314_11 = var_314_6.sprite.bounds.size.x
					local var_314_12 = var_314_6.sprite.bounds.size.y
					local var_314_13 = var_314_10 / var_314_11
					local var_314_14 = var_314_9 / var_314_12
					local var_314_15 = var_314_14 < var_314_13 and var_314_13 or var_314_14

					var_314_5.transform.localScale = Vector3.New(var_314_15, var_314_15, 0)
				end

				for iter_314_0, iter_314_1 in pairs(arg_311_1.bgs_) do
					if iter_314_0 ~= "G03_1" then
						iter_314_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_314_16 = 0

			if var_314_16 < arg_311_1.time_ and arg_311_1.time_ <= var_314_16 + arg_314_0 then
				arg_311_1.mask_.enabled = true
				arg_311_1.mask_.raycastTarget = true

				arg_311_1:SetGaussion(false)
			end

			local var_314_17 = 2

			if var_314_16 <= arg_311_1.time_ and arg_311_1.time_ < var_314_16 + var_314_17 then
				local var_314_18 = (arg_311_1.time_ - var_314_16) / var_314_17
				local var_314_19 = Color.New(0, 0, 0)

				var_314_19.a = Mathf.Lerp(0, 1, var_314_18)
				arg_311_1.mask_.color = var_314_19
			end

			if arg_311_1.time_ >= var_314_16 + var_314_17 and arg_311_1.time_ < var_314_16 + var_314_17 + arg_314_0 then
				local var_314_20 = Color.New(0, 0, 0)

				var_314_20.a = 1
				arg_311_1.mask_.color = var_314_20
			end

			local var_314_21 = 2

			if var_314_21 < arg_311_1.time_ and arg_311_1.time_ <= var_314_21 + arg_314_0 then
				arg_311_1.mask_.enabled = true
				arg_311_1.mask_.raycastTarget = true

				arg_311_1:SetGaussion(false)
			end

			local var_314_22 = 2

			if var_314_21 <= arg_311_1.time_ and arg_311_1.time_ < var_314_21 + var_314_22 then
				local var_314_23 = (arg_311_1.time_ - var_314_21) / var_314_22
				local var_314_24 = Color.New(0, 0, 0)

				var_314_24.a = Mathf.Lerp(1, 0, var_314_23)
				arg_311_1.mask_.color = var_314_24
			end

			if arg_311_1.time_ >= var_314_21 + var_314_22 and arg_311_1.time_ < var_314_21 + var_314_22 + arg_314_0 then
				local var_314_25 = Color.New(0, 0, 0)
				local var_314_26 = 0

				arg_311_1.mask_.enabled = false
				var_314_25.a = var_314_26
				arg_311_1.mask_.color = var_314_25
			end

			if arg_311_1.frameCnt_ <= 1 then
				arg_311_1.dialog_:SetActive(false)
			end

			local var_314_27 = 4
			local var_314_28 = 0.7

			if var_314_27 < arg_311_1.time_ and arg_311_1.time_ <= var_314_27 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0

				arg_311_1.dialog_:SetActive(true)

				local var_314_29 = LeanTween.value(arg_311_1.dialog_, 0, 1, 0.3)

				var_314_29:setOnUpdate(LuaHelper.FloatAction(function(arg_315_0)
					arg_311_1.dialogCg_.alpha = arg_315_0
				end))
				var_314_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_311_1.dialog_)
					var_314_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_311_1.duration_ = arg_311_1.duration_ + 0.3

				SetActive(arg_311_1.leftNameGo_, false)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_30 = arg_311_1:GetWordFromCfg(115201076)
				local var_314_31 = arg_311_1:FormatText(var_314_30.content)

				arg_311_1.text_.text = var_314_31

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_32 = 28
				local var_314_33 = utf8.len(var_314_31)
				local var_314_34 = var_314_32 <= 0 and var_314_28 or var_314_28 * (var_314_33 / var_314_32)

				if var_314_34 > 0 and var_314_28 < var_314_34 then
					arg_311_1.talkMaxDuration = var_314_34
					var_314_27 = var_314_27 + 0.3

					if var_314_34 + var_314_27 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_34 + var_314_27
					end
				end

				arg_311_1.text_.text = var_314_31
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)
				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_35 = var_314_27 + 0.3
			local var_314_36 = math.max(var_314_28, arg_311_1.talkMaxDuration)

			if var_314_35 <= arg_311_1.time_ and arg_311_1.time_ < var_314_35 + var_314_36 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_35) / var_314_36

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_35 + var_314_36 and arg_311_1.time_ < var_314_35 + var_314_36 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play115201077 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 115201077
		arg_317_1.duration_ = 5

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play115201078(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = 0
			local var_320_1 = 0.625

			if var_320_0 < arg_317_1.time_ and arg_317_1.time_ <= var_320_0 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, false)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_2 = arg_317_1:GetWordFromCfg(115201077)
				local var_320_3 = arg_317_1:FormatText(var_320_2.content)

				arg_317_1.text_.text = var_320_3

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_4 = 25
				local var_320_5 = utf8.len(var_320_3)
				local var_320_6 = var_320_4 <= 0 and var_320_1 or var_320_1 * (var_320_5 / var_320_4)

				if var_320_6 > 0 and var_320_1 < var_320_6 then
					arg_317_1.talkMaxDuration = var_320_6

					if var_320_6 + var_320_0 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_6 + var_320_0
					end
				end

				arg_317_1.text_.text = var_320_3
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)
				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_7 = math.max(var_320_1, arg_317_1.talkMaxDuration)

			if var_320_0 <= arg_317_1.time_ and arg_317_1.time_ < var_320_0 + var_320_7 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_0) / var_320_7

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_0 + var_320_7 and arg_317_1.time_ < var_320_0 + var_320_7 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play115201078 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 115201078
		arg_321_1.duration_ = 13.8

		local var_321_0 = {
			ja = 13.8,
			ko = 4.933,
			zh = 5.333,
			en = 7.266
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
				arg_321_0:Play115201079(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = "1017ui_story"

			if arg_321_1.actors_[var_324_0] == nil then
				local var_324_1 = Object.Instantiate(Asset.Load("Char/" .. var_324_0), arg_321_1.stage_.transform)

				var_324_1.name = var_324_0
				var_324_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_321_1.actors_[var_324_0] = var_324_1

				local var_324_2 = var_324_1:GetComponentInChildren(typeof(CharacterEffect))

				var_324_2.enabled = true

				local var_324_3 = GameObjectTools.GetOrAddComponent(var_324_1, typeof(DynamicBoneHelper))

				if var_324_3 then
					var_324_3:EnableDynamicBone(false)
				end

				arg_321_1:ShowWeapon(var_324_2.transform, false)

				arg_321_1.var_[var_324_0 .. "Animator"] = var_324_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_321_1.var_[var_324_0 .. "Animator"].applyRootMotion = true
				arg_321_1.var_[var_324_0 .. "LipSync"] = var_324_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_324_4 = arg_321_1.actors_["1017ui_story"].transform
			local var_324_5 = 0

			if var_324_5 < arg_321_1.time_ and arg_321_1.time_ <= var_324_5 + arg_324_0 then
				arg_321_1.var_.moveOldPos1017ui_story = var_324_4.localPosition
			end

			local var_324_6 = 0.001

			if var_324_5 <= arg_321_1.time_ and arg_321_1.time_ < var_324_5 + var_324_6 then
				local var_324_7 = (arg_321_1.time_ - var_324_5) / var_324_6
				local var_324_8 = Vector3.New(-0.7, -1.01, -6.05)

				var_324_4.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos1017ui_story, var_324_8, var_324_7)

				local var_324_9 = manager.ui.mainCamera.transform.position - var_324_4.position

				var_324_4.forward = Vector3.New(var_324_9.x, var_324_9.y, var_324_9.z)

				local var_324_10 = var_324_4.localEulerAngles

				var_324_10.z = 0
				var_324_10.x = 0
				var_324_4.localEulerAngles = var_324_10
			end

			if arg_321_1.time_ >= var_324_5 + var_324_6 and arg_321_1.time_ < var_324_5 + var_324_6 + arg_324_0 then
				var_324_4.localPosition = Vector3.New(-0.7, -1.01, -6.05)

				local var_324_11 = manager.ui.mainCamera.transform.position - var_324_4.position

				var_324_4.forward = Vector3.New(var_324_11.x, var_324_11.y, var_324_11.z)

				local var_324_12 = var_324_4.localEulerAngles

				var_324_12.z = 0
				var_324_12.x = 0
				var_324_4.localEulerAngles = var_324_12
			end

			local var_324_13 = 0

			if var_324_13 < arg_321_1.time_ and arg_321_1.time_ <= var_324_13 + arg_324_0 then
				arg_321_1:PlayTimeline("1017ui_story", "StoryTimeline/CharAction/1017/1017action/1017action6_1")
			end

			local var_324_14 = 0

			if var_324_14 < arg_321_1.time_ and arg_321_1.time_ <= var_324_14 + arg_324_0 then
				arg_321_1:PlayTimeline("1017ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_324_15 = arg_321_1.actors_["1017ui_story"]
			local var_324_16 = 0

			if var_324_16 < arg_321_1.time_ and arg_321_1.time_ <= var_324_16 + arg_324_0 and arg_321_1.var_.characterEffect1017ui_story == nil then
				arg_321_1.var_.characterEffect1017ui_story = var_324_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_17 = 0.2

			if var_324_16 <= arg_321_1.time_ and arg_321_1.time_ < var_324_16 + var_324_17 then
				local var_324_18 = (arg_321_1.time_ - var_324_16) / var_324_17

				if arg_321_1.var_.characterEffect1017ui_story then
					arg_321_1.var_.characterEffect1017ui_story.fillFlat = false
				end
			end

			if arg_321_1.time_ >= var_324_16 + var_324_17 and arg_321_1.time_ < var_324_16 + var_324_17 + arg_324_0 and arg_321_1.var_.characterEffect1017ui_story then
				arg_321_1.var_.characterEffect1017ui_story.fillFlat = false
			end

			local var_324_19 = 0
			local var_324_20 = 0.675

			if var_324_19 < arg_321_1.time_ and arg_321_1.time_ <= var_324_19 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_21 = arg_321_1:FormatText(StoryNameCfg[273].name)

				arg_321_1.leftNameTxt_.text = var_324_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_22 = arg_321_1:GetWordFromCfg(115201078)
				local var_324_23 = arg_321_1:FormatText(var_324_22.content)

				arg_321_1.text_.text = var_324_23

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_24 = 27
				local var_324_25 = utf8.len(var_324_23)
				local var_324_26 = var_324_24 <= 0 and var_324_20 or var_324_20 * (var_324_25 / var_324_24)

				if var_324_26 > 0 and var_324_20 < var_324_26 then
					arg_321_1.talkMaxDuration = var_324_26

					if var_324_26 + var_324_19 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_26 + var_324_19
					end
				end

				arg_321_1.text_.text = var_324_23
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201078", "story_v_out_115201.awb") ~= 0 then
					local var_324_27 = manager.audio:GetVoiceLength("story_v_out_115201", "115201078", "story_v_out_115201.awb") / 1000

					if var_324_27 + var_324_19 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_27 + var_324_19
					end

					if var_324_22.prefab_name ~= "" and arg_321_1.actors_[var_324_22.prefab_name] ~= nil then
						local var_324_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_22.prefab_name].transform, "story_v_out_115201", "115201078", "story_v_out_115201.awb")

						arg_321_1:RecordAudio("115201078", var_324_28)
						arg_321_1:RecordAudio("115201078", var_324_28)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_115201", "115201078", "story_v_out_115201.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_115201", "115201078", "story_v_out_115201.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_29 = math.max(var_324_20, arg_321_1.talkMaxDuration)

			if var_324_19 <= arg_321_1.time_ and arg_321_1.time_ < var_324_19 + var_324_29 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_19) / var_324_29

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_19 + var_324_29 and arg_321_1.time_ < var_324_19 + var_324_29 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play115201079 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 115201079
		arg_325_1.duration_ = 7.333

		local var_325_0 = {
			ja = 7.3,
			ko = 6.266,
			zh = 5.966,
			en = 7.333
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
				arg_325_0:Play115201080(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1:PlayTimeline("1017ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_328_1 = 0
			local var_328_2 = 0.725

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_3 = arg_325_1:FormatText(StoryNameCfg[273].name)

				arg_325_1.leftNameTxt_.text = var_328_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_4 = arg_325_1:GetWordFromCfg(115201079)
				local var_328_5 = arg_325_1:FormatText(var_328_4.content)

				arg_325_1.text_.text = var_328_5

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_6 = 29
				local var_328_7 = utf8.len(var_328_5)
				local var_328_8 = var_328_6 <= 0 and var_328_2 or var_328_2 * (var_328_7 / var_328_6)

				if var_328_8 > 0 and var_328_2 < var_328_8 then
					arg_325_1.talkMaxDuration = var_328_8

					if var_328_8 + var_328_1 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_8 + var_328_1
					end
				end

				arg_325_1.text_.text = var_328_5
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201079", "story_v_out_115201.awb") ~= 0 then
					local var_328_9 = manager.audio:GetVoiceLength("story_v_out_115201", "115201079", "story_v_out_115201.awb") / 1000

					if var_328_9 + var_328_1 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_9 + var_328_1
					end

					if var_328_4.prefab_name ~= "" and arg_325_1.actors_[var_328_4.prefab_name] ~= nil then
						local var_328_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_4.prefab_name].transform, "story_v_out_115201", "115201079", "story_v_out_115201.awb")

						arg_325_1:RecordAudio("115201079", var_328_10)
						arg_325_1:RecordAudio("115201079", var_328_10)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_115201", "115201079", "story_v_out_115201.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_115201", "115201079", "story_v_out_115201.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_11 = math.max(var_328_2, arg_325_1.talkMaxDuration)

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_11 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_1) / var_328_11

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_1 + var_328_11 and arg_325_1.time_ < var_328_1 + var_328_11 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play115201080 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 115201080
		arg_329_1.duration_ = 7.466

		local var_329_0 = {
			ja = 6.166,
			ko = 5.933,
			zh = 5.933,
			en = 7.466
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
				arg_329_0:Play115201081(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["1052ui_story"].transform
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				arg_329_1.var_.moveOldPos1052ui_story = var_332_0.localPosition
			end

			local var_332_2 = 0.001

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_2 then
				local var_332_3 = (arg_329_1.time_ - var_332_1) / var_332_2
				local var_332_4 = Vector3.New(0.7, -1.05, -6.2)

				var_332_0.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1052ui_story, var_332_4, var_332_3)

				local var_332_5 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_5.x, var_332_5.y, var_332_5.z)

				local var_332_6 = var_332_0.localEulerAngles

				var_332_6.z = 0
				var_332_6.x = 0
				var_332_0.localEulerAngles = var_332_6
			end

			if arg_329_1.time_ >= var_332_1 + var_332_2 and arg_329_1.time_ < var_332_1 + var_332_2 + arg_332_0 then
				var_332_0.localPosition = Vector3.New(0.7, -1.05, -6.2)

				local var_332_7 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_7.x, var_332_7.y, var_332_7.z)

				local var_332_8 = var_332_0.localEulerAngles

				var_332_8.z = 0
				var_332_8.x = 0
				var_332_0.localEulerAngles = var_332_8
			end

			local var_332_9 = 0

			if var_332_9 < arg_329_1.time_ and arg_329_1.time_ <= var_332_9 + arg_332_0 then
				arg_329_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_332_10 = 0

			if var_332_10 < arg_329_1.time_ and arg_329_1.time_ <= var_332_10 + arg_332_0 then
				arg_329_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action1_1")
			end

			local var_332_11 = arg_329_1.actors_["1052ui_story"]
			local var_332_12 = 0

			if var_332_12 < arg_329_1.time_ and arg_329_1.time_ <= var_332_12 + arg_332_0 and arg_329_1.var_.characterEffect1052ui_story == nil then
				arg_329_1.var_.characterEffect1052ui_story = var_332_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_13 = 0.2

			if var_332_12 <= arg_329_1.time_ and arg_329_1.time_ < var_332_12 + var_332_13 then
				local var_332_14 = (arg_329_1.time_ - var_332_12) / var_332_13

				if arg_329_1.var_.characterEffect1052ui_story then
					arg_329_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_329_1.time_ >= var_332_12 + var_332_13 and arg_329_1.time_ < var_332_12 + var_332_13 + arg_332_0 and arg_329_1.var_.characterEffect1052ui_story then
				arg_329_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_332_15 = arg_329_1.actors_["1017ui_story"]
			local var_332_16 = 0

			if var_332_16 < arg_329_1.time_ and arg_329_1.time_ <= var_332_16 + arg_332_0 and arg_329_1.var_.characterEffect1017ui_story == nil then
				arg_329_1.var_.characterEffect1017ui_story = var_332_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_17 = 0.2

			if var_332_16 <= arg_329_1.time_ and arg_329_1.time_ < var_332_16 + var_332_17 then
				local var_332_18 = (arg_329_1.time_ - var_332_16) / var_332_17

				if arg_329_1.var_.characterEffect1017ui_story then
					local var_332_19 = Mathf.Lerp(0, 0.5, var_332_18)

					arg_329_1.var_.characterEffect1017ui_story.fillFlat = true
					arg_329_1.var_.characterEffect1017ui_story.fillRatio = var_332_19
				end
			end

			if arg_329_1.time_ >= var_332_16 + var_332_17 and arg_329_1.time_ < var_332_16 + var_332_17 + arg_332_0 and arg_329_1.var_.characterEffect1017ui_story then
				local var_332_20 = 0.5

				arg_329_1.var_.characterEffect1017ui_story.fillFlat = true
				arg_329_1.var_.characterEffect1017ui_story.fillRatio = var_332_20
			end

			local var_332_21 = 0
			local var_332_22 = 0.65

			if var_332_21 < arg_329_1.time_ and arg_329_1.time_ <= var_332_21 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_23 = arg_329_1:FormatText(StoryNameCfg[263].name)

				arg_329_1.leftNameTxt_.text = var_332_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_24 = arg_329_1:GetWordFromCfg(115201080)
				local var_332_25 = arg_329_1:FormatText(var_332_24.content)

				arg_329_1.text_.text = var_332_25

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_26 = 27
				local var_332_27 = utf8.len(var_332_25)
				local var_332_28 = var_332_26 <= 0 and var_332_22 or var_332_22 * (var_332_27 / var_332_26)

				if var_332_28 > 0 and var_332_22 < var_332_28 then
					arg_329_1.talkMaxDuration = var_332_28

					if var_332_28 + var_332_21 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_28 + var_332_21
					end
				end

				arg_329_1.text_.text = var_332_25
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201080", "story_v_out_115201.awb") ~= 0 then
					local var_332_29 = manager.audio:GetVoiceLength("story_v_out_115201", "115201080", "story_v_out_115201.awb") / 1000

					if var_332_29 + var_332_21 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_29 + var_332_21
					end

					if var_332_24.prefab_name ~= "" and arg_329_1.actors_[var_332_24.prefab_name] ~= nil then
						local var_332_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_24.prefab_name].transform, "story_v_out_115201", "115201080", "story_v_out_115201.awb")

						arg_329_1:RecordAudio("115201080", var_332_30)
						arg_329_1:RecordAudio("115201080", var_332_30)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_115201", "115201080", "story_v_out_115201.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_115201", "115201080", "story_v_out_115201.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_31 = math.max(var_332_22, arg_329_1.talkMaxDuration)

			if var_332_21 <= arg_329_1.time_ and arg_329_1.time_ < var_332_21 + var_332_31 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_21) / var_332_31

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_21 + var_332_31 and arg_329_1.time_ < var_332_21 + var_332_31 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play115201081 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 115201081
		arg_333_1.duration_ = 1.999999999999

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play115201082(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = 0

			if var_336_0 < arg_333_1.time_ and arg_333_1.time_ <= var_336_0 + arg_336_0 then
				arg_333_1:PlayTimeline("1017ui_story", "StoryTimeline/CharAction/1017/1017action/1017action6_2")
			end

			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 then
				arg_333_1:PlayTimeline("1017ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_336_2 = arg_333_1.actors_["1017ui_story"]
			local var_336_3 = 0

			if var_336_3 < arg_333_1.time_ and arg_333_1.time_ <= var_336_3 + arg_336_0 and arg_333_1.var_.characterEffect1017ui_story == nil then
				arg_333_1.var_.characterEffect1017ui_story = var_336_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_4 = 0.2

			if var_336_3 <= arg_333_1.time_ and arg_333_1.time_ < var_336_3 + var_336_4 then
				local var_336_5 = (arg_333_1.time_ - var_336_3) / var_336_4

				if arg_333_1.var_.characterEffect1017ui_story then
					arg_333_1.var_.characterEffect1017ui_story.fillFlat = false
				end
			end

			if arg_333_1.time_ >= var_336_3 + var_336_4 and arg_333_1.time_ < var_336_3 + var_336_4 + arg_336_0 and arg_333_1.var_.characterEffect1017ui_story then
				arg_333_1.var_.characterEffect1017ui_story.fillFlat = false
			end

			local var_336_6 = arg_333_1.actors_["1052ui_story"]
			local var_336_7 = 0

			if var_336_7 < arg_333_1.time_ and arg_333_1.time_ <= var_336_7 + arg_336_0 and arg_333_1.var_.characterEffect1052ui_story == nil then
				arg_333_1.var_.characterEffect1052ui_story = var_336_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_8 = 0.2

			if var_336_7 <= arg_333_1.time_ and arg_333_1.time_ < var_336_7 + var_336_8 then
				local var_336_9 = (arg_333_1.time_ - var_336_7) / var_336_8

				if arg_333_1.var_.characterEffect1052ui_story then
					local var_336_10 = Mathf.Lerp(0, 0.5, var_336_9)

					arg_333_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_333_1.var_.characterEffect1052ui_story.fillRatio = var_336_10
				end
			end

			if arg_333_1.time_ >= var_336_7 + var_336_8 and arg_333_1.time_ < var_336_7 + var_336_8 + arg_336_0 and arg_333_1.var_.characterEffect1052ui_story then
				local var_336_11 = 0.5

				arg_333_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_333_1.var_.characterEffect1052ui_story.fillRatio = var_336_11
			end

			local var_336_12 = 0
			local var_336_13 = 0.15

			if var_336_12 < arg_333_1.time_ and arg_333_1.time_ <= var_336_12 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_14 = arg_333_1:FormatText(StoryNameCfg[273].name)

				arg_333_1.leftNameTxt_.text = var_336_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_15 = arg_333_1:GetWordFromCfg(115201081)
				local var_336_16 = arg_333_1:FormatText(var_336_15.content)

				arg_333_1.text_.text = var_336_16

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_17 = 6
				local var_336_18 = utf8.len(var_336_16)
				local var_336_19 = var_336_17 <= 0 and var_336_13 or var_336_13 * (var_336_18 / var_336_17)

				if var_336_19 > 0 and var_336_13 < var_336_19 then
					arg_333_1.talkMaxDuration = var_336_19

					if var_336_19 + var_336_12 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_19 + var_336_12
					end
				end

				arg_333_1.text_.text = var_336_16
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201081", "story_v_out_115201.awb") ~= 0 then
					local var_336_20 = manager.audio:GetVoiceLength("story_v_out_115201", "115201081", "story_v_out_115201.awb") / 1000

					if var_336_20 + var_336_12 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_20 + var_336_12
					end

					if var_336_15.prefab_name ~= "" and arg_333_1.actors_[var_336_15.prefab_name] ~= nil then
						local var_336_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_15.prefab_name].transform, "story_v_out_115201", "115201081", "story_v_out_115201.awb")

						arg_333_1:RecordAudio("115201081", var_336_21)
						arg_333_1:RecordAudio("115201081", var_336_21)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_115201", "115201081", "story_v_out_115201.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_115201", "115201081", "story_v_out_115201.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_22 = math.max(var_336_13, arg_333_1.talkMaxDuration)

			if var_336_12 <= arg_333_1.time_ and arg_333_1.time_ < var_336_12 + var_336_22 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_12) / var_336_22

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_12 + var_336_22 and arg_333_1.time_ < var_336_12 + var_336_22 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play115201082 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 115201082
		arg_337_1.duration_ = 4.033

		local var_337_0 = {
			ja = 2.566,
			ko = 4.033,
			zh = 2.433,
			en = 2.6
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
				arg_337_0:Play115201083(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = 0

			if var_340_0 < arg_337_1.time_ and arg_337_1.time_ <= var_340_0 + arg_340_0 then
				arg_337_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 then
				arg_337_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action7_1")
			end

			local var_340_2 = arg_337_1.actors_["1052ui_story"]
			local var_340_3 = 0

			if var_340_3 < arg_337_1.time_ and arg_337_1.time_ <= var_340_3 + arg_340_0 and arg_337_1.var_.characterEffect1052ui_story == nil then
				arg_337_1.var_.characterEffect1052ui_story = var_340_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_4 = 0.2

			if var_340_3 <= arg_337_1.time_ and arg_337_1.time_ < var_340_3 + var_340_4 then
				local var_340_5 = (arg_337_1.time_ - var_340_3) / var_340_4

				if arg_337_1.var_.characterEffect1052ui_story then
					arg_337_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_337_1.time_ >= var_340_3 + var_340_4 and arg_337_1.time_ < var_340_3 + var_340_4 + arg_340_0 and arg_337_1.var_.characterEffect1052ui_story then
				arg_337_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_340_6 = arg_337_1.actors_["1017ui_story"]
			local var_340_7 = 0

			if var_340_7 < arg_337_1.time_ and arg_337_1.time_ <= var_340_7 + arg_340_0 and arg_337_1.var_.characterEffect1017ui_story == nil then
				arg_337_1.var_.characterEffect1017ui_story = var_340_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_8 = 0.2

			if var_340_7 <= arg_337_1.time_ and arg_337_1.time_ < var_340_7 + var_340_8 then
				local var_340_9 = (arg_337_1.time_ - var_340_7) / var_340_8

				if arg_337_1.var_.characterEffect1017ui_story then
					local var_340_10 = Mathf.Lerp(0, 0.5, var_340_9)

					arg_337_1.var_.characterEffect1017ui_story.fillFlat = true
					arg_337_1.var_.characterEffect1017ui_story.fillRatio = var_340_10
				end
			end

			if arg_337_1.time_ >= var_340_7 + var_340_8 and arg_337_1.time_ < var_340_7 + var_340_8 + arg_340_0 and arg_337_1.var_.characterEffect1017ui_story then
				local var_340_11 = 0.5

				arg_337_1.var_.characterEffect1017ui_story.fillFlat = true
				arg_337_1.var_.characterEffect1017ui_story.fillRatio = var_340_11
			end

			local var_340_12 = 0
			local var_340_13 = 0.225

			if var_340_12 < arg_337_1.time_ and arg_337_1.time_ <= var_340_12 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_14 = arg_337_1:FormatText(StoryNameCfg[263].name)

				arg_337_1.leftNameTxt_.text = var_340_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_15 = arg_337_1:GetWordFromCfg(115201082)
				local var_340_16 = arg_337_1:FormatText(var_340_15.content)

				arg_337_1.text_.text = var_340_16

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_17 = 9
				local var_340_18 = utf8.len(var_340_16)
				local var_340_19 = var_340_17 <= 0 and var_340_13 or var_340_13 * (var_340_18 / var_340_17)

				if var_340_19 > 0 and var_340_13 < var_340_19 then
					arg_337_1.talkMaxDuration = var_340_19

					if var_340_19 + var_340_12 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_19 + var_340_12
					end
				end

				arg_337_1.text_.text = var_340_16
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201082", "story_v_out_115201.awb") ~= 0 then
					local var_340_20 = manager.audio:GetVoiceLength("story_v_out_115201", "115201082", "story_v_out_115201.awb") / 1000

					if var_340_20 + var_340_12 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_20 + var_340_12
					end

					if var_340_15.prefab_name ~= "" and arg_337_1.actors_[var_340_15.prefab_name] ~= nil then
						local var_340_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_15.prefab_name].transform, "story_v_out_115201", "115201082", "story_v_out_115201.awb")

						arg_337_1:RecordAudio("115201082", var_340_21)
						arg_337_1:RecordAudio("115201082", var_340_21)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_115201", "115201082", "story_v_out_115201.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_115201", "115201082", "story_v_out_115201.awb")
				end

				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_22 = math.max(var_340_13, arg_337_1.talkMaxDuration)

			if var_340_12 <= arg_337_1.time_ and arg_337_1.time_ < var_340_12 + var_340_22 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_12) / var_340_22

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_12 + var_340_22 and arg_337_1.time_ < var_340_12 + var_340_22 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play115201083 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 115201083
		arg_341_1.duration_ = 7.733

		local var_341_0 = {
			ja = 7.733,
			ko = 4.2,
			zh = 3.366,
			en = 4.9
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
				arg_341_0:Play115201084(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1017ui_story"].transform
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 then
				arg_341_1.var_.moveOldPos1017ui_story = var_344_0.localPosition
			end

			local var_344_2 = 0.001

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2
				local var_344_4 = Vector3.New(0, 100, 0)

				var_344_0.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPos1017ui_story, var_344_4, var_344_3)

				local var_344_5 = manager.ui.mainCamera.transform.position - var_344_0.position

				var_344_0.forward = Vector3.New(var_344_5.x, var_344_5.y, var_344_5.z)

				local var_344_6 = var_344_0.localEulerAngles

				var_344_6.z = 0
				var_344_6.x = 0
				var_344_0.localEulerAngles = var_344_6
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 then
				var_344_0.localPosition = Vector3.New(0, 100, 0)

				local var_344_7 = manager.ui.mainCamera.transform.position - var_344_0.position

				var_344_0.forward = Vector3.New(var_344_7.x, var_344_7.y, var_344_7.z)

				local var_344_8 = var_344_0.localEulerAngles

				var_344_8.z = 0
				var_344_8.x = 0
				var_344_0.localEulerAngles = var_344_8
			end

			local var_344_9 = arg_341_1.actors_["1024ui_story"].transform
			local var_344_10 = 0

			if var_344_10 < arg_341_1.time_ and arg_341_1.time_ <= var_344_10 + arg_344_0 then
				arg_341_1.var_.moveOldPos1024ui_story = var_344_9.localPosition

				local var_344_11 = "1024ui_story"

				arg_341_1:ShowWeapon(arg_341_1.var_[var_344_11 .. "Animator"].transform, false)
			end

			local var_344_12 = 0.001

			if var_344_10 <= arg_341_1.time_ and arg_341_1.time_ < var_344_10 + var_344_12 then
				local var_344_13 = (arg_341_1.time_ - var_344_10) / var_344_12
				local var_344_14 = Vector3.New(-0.7, -1, -6.05)

				var_344_9.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPos1024ui_story, var_344_14, var_344_13)

				local var_344_15 = manager.ui.mainCamera.transform.position - var_344_9.position

				var_344_9.forward = Vector3.New(var_344_15.x, var_344_15.y, var_344_15.z)

				local var_344_16 = var_344_9.localEulerAngles

				var_344_16.z = 0
				var_344_16.x = 0
				var_344_9.localEulerAngles = var_344_16
			end

			if arg_341_1.time_ >= var_344_10 + var_344_12 and arg_341_1.time_ < var_344_10 + var_344_12 + arg_344_0 then
				var_344_9.localPosition = Vector3.New(-0.7, -1, -6.05)

				local var_344_17 = manager.ui.mainCamera.transform.position - var_344_9.position

				var_344_9.forward = Vector3.New(var_344_17.x, var_344_17.y, var_344_17.z)

				local var_344_18 = var_344_9.localEulerAngles

				var_344_18.z = 0
				var_344_18.x = 0
				var_344_9.localEulerAngles = var_344_18
			end

			local var_344_19 = 0

			if var_344_19 < arg_341_1.time_ and arg_341_1.time_ <= var_344_19 + arg_344_0 then
				arg_341_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action5_1")
			end

			local var_344_20 = 0

			if var_344_20 < arg_341_1.time_ and arg_341_1.time_ <= var_344_20 + arg_344_0 then
				arg_341_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_344_21 = arg_341_1.actors_["1024ui_story"]
			local var_344_22 = 0

			if var_344_22 < arg_341_1.time_ and arg_341_1.time_ <= var_344_22 + arg_344_0 and arg_341_1.var_.characterEffect1024ui_story == nil then
				arg_341_1.var_.characterEffect1024ui_story = var_344_21:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_23 = 0.2

			if var_344_22 <= arg_341_1.time_ and arg_341_1.time_ < var_344_22 + var_344_23 then
				local var_344_24 = (arg_341_1.time_ - var_344_22) / var_344_23

				if arg_341_1.var_.characterEffect1024ui_story then
					arg_341_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_341_1.time_ >= var_344_22 + var_344_23 and arg_341_1.time_ < var_344_22 + var_344_23 + arg_344_0 and arg_341_1.var_.characterEffect1024ui_story then
				arg_341_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_344_25 = arg_341_1.actors_["1052ui_story"]
			local var_344_26 = 0

			if var_344_26 < arg_341_1.time_ and arg_341_1.time_ <= var_344_26 + arg_344_0 and arg_341_1.var_.characterEffect1052ui_story == nil then
				arg_341_1.var_.characterEffect1052ui_story = var_344_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_27 = 0.2

			if var_344_26 <= arg_341_1.time_ and arg_341_1.time_ < var_344_26 + var_344_27 then
				local var_344_28 = (arg_341_1.time_ - var_344_26) / var_344_27

				if arg_341_1.var_.characterEffect1052ui_story then
					local var_344_29 = Mathf.Lerp(0, 0.5, var_344_28)

					arg_341_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_341_1.var_.characterEffect1052ui_story.fillRatio = var_344_29
				end
			end

			if arg_341_1.time_ >= var_344_26 + var_344_27 and arg_341_1.time_ < var_344_26 + var_344_27 + arg_344_0 and arg_341_1.var_.characterEffect1052ui_story then
				local var_344_30 = 0.5

				arg_341_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_341_1.var_.characterEffect1052ui_story.fillRatio = var_344_30
			end

			local var_344_31 = 0
			local var_344_32 = 0.45

			if var_344_31 < arg_341_1.time_ and arg_341_1.time_ <= var_344_31 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_33 = arg_341_1:FormatText(StoryNameCfg[265].name)

				arg_341_1.leftNameTxt_.text = var_344_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_34 = arg_341_1:GetWordFromCfg(115201083)
				local var_344_35 = arg_341_1:FormatText(var_344_34.content)

				arg_341_1.text_.text = var_344_35

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_36 = 18
				local var_344_37 = utf8.len(var_344_35)
				local var_344_38 = var_344_36 <= 0 and var_344_32 or var_344_32 * (var_344_37 / var_344_36)

				if var_344_38 > 0 and var_344_32 < var_344_38 then
					arg_341_1.talkMaxDuration = var_344_38

					if var_344_38 + var_344_31 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_38 + var_344_31
					end
				end

				arg_341_1.text_.text = var_344_35
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201083", "story_v_out_115201.awb") ~= 0 then
					local var_344_39 = manager.audio:GetVoiceLength("story_v_out_115201", "115201083", "story_v_out_115201.awb") / 1000

					if var_344_39 + var_344_31 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_39 + var_344_31
					end

					if var_344_34.prefab_name ~= "" and arg_341_1.actors_[var_344_34.prefab_name] ~= nil then
						local var_344_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_34.prefab_name].transform, "story_v_out_115201", "115201083", "story_v_out_115201.awb")

						arg_341_1:RecordAudio("115201083", var_344_40)
						arg_341_1:RecordAudio("115201083", var_344_40)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_115201", "115201083", "story_v_out_115201.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_115201", "115201083", "story_v_out_115201.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_41 = math.max(var_344_32, arg_341_1.talkMaxDuration)

			if var_344_31 <= arg_341_1.time_ and arg_341_1.time_ < var_344_31 + var_344_41 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_31) / var_344_41

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_31 + var_344_41 and arg_341_1.time_ < var_344_31 + var_344_41 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play115201084 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 115201084
		arg_345_1.duration_ = 5.066

		local var_345_0 = {
			ja = 4.733,
			ko = 4.6,
			zh = 2.933,
			en = 5.066
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
				arg_345_0:Play115201085(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["1024ui_story"]
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 and arg_345_1.var_.characterEffect1024ui_story == nil then
				arg_345_1.var_.characterEffect1024ui_story = var_348_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_2 = 0.2

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_2 then
				local var_348_3 = (arg_345_1.time_ - var_348_1) / var_348_2

				if arg_345_1.var_.characterEffect1024ui_story then
					local var_348_4 = Mathf.Lerp(0, 0.5, var_348_3)

					arg_345_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_345_1.var_.characterEffect1024ui_story.fillRatio = var_348_4
				end
			end

			if arg_345_1.time_ >= var_348_1 + var_348_2 and arg_345_1.time_ < var_348_1 + var_348_2 + arg_348_0 and arg_345_1.var_.characterEffect1024ui_story then
				local var_348_5 = 0.5

				arg_345_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_345_1.var_.characterEffect1024ui_story.fillRatio = var_348_5
			end

			local var_348_6 = 0

			if var_348_6 < arg_345_1.time_ and arg_345_1.time_ <= var_348_6 + arg_348_0 then
				arg_345_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action5_2")
			end

			local var_348_7 = 0
			local var_348_8 = 0.4

			if var_348_7 < arg_345_1.time_ and arg_345_1.time_ <= var_348_7 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_9 = arg_345_1:FormatText(StoryNameCfg[273].name)

				arg_345_1.leftNameTxt_.text = var_348_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, true)
				arg_345_1.iconController_:SetSelectedState("hero")

				arg_345_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1017")

				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_10 = arg_345_1:GetWordFromCfg(115201084)
				local var_348_11 = arg_345_1:FormatText(var_348_10.content)

				arg_345_1.text_.text = var_348_11

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_12 = 16
				local var_348_13 = utf8.len(var_348_11)
				local var_348_14 = var_348_12 <= 0 and var_348_8 or var_348_8 * (var_348_13 / var_348_12)

				if var_348_14 > 0 and var_348_8 < var_348_14 then
					arg_345_1.talkMaxDuration = var_348_14

					if var_348_14 + var_348_7 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_14 + var_348_7
					end
				end

				arg_345_1.text_.text = var_348_11
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201084", "story_v_out_115201.awb") ~= 0 then
					local var_348_15 = manager.audio:GetVoiceLength("story_v_out_115201", "115201084", "story_v_out_115201.awb") / 1000

					if var_348_15 + var_348_7 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_15 + var_348_7
					end

					if var_348_10.prefab_name ~= "" and arg_345_1.actors_[var_348_10.prefab_name] ~= nil then
						local var_348_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_10.prefab_name].transform, "story_v_out_115201", "115201084", "story_v_out_115201.awb")

						arg_345_1:RecordAudio("115201084", var_348_16)
						arg_345_1:RecordAudio("115201084", var_348_16)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_115201", "115201084", "story_v_out_115201.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_115201", "115201084", "story_v_out_115201.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_17 = math.max(var_348_8, arg_345_1.talkMaxDuration)

			if var_348_7 <= arg_345_1.time_ and arg_345_1.time_ < var_348_7 + var_348_17 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_7) / var_348_17

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_7 + var_348_17 and arg_345_1.time_ < var_348_7 + var_348_17 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play115201085 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 115201085
		arg_349_1.duration_ = 8.533

		local var_349_0 = {
			ja = 8.533,
			ko = 5.2,
			zh = 6.333,
			en = 3.933
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
				arg_349_0:Play115201086(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = 0

			if var_352_0 < arg_349_1.time_ and arg_349_1.time_ <= var_352_0 + arg_352_0 then
				arg_349_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_352_1 = arg_349_1.actors_["1052ui_story"]
			local var_352_2 = 0

			if var_352_2 < arg_349_1.time_ and arg_349_1.time_ <= var_352_2 + arg_352_0 and arg_349_1.var_.characterEffect1052ui_story == nil then
				arg_349_1.var_.characterEffect1052ui_story = var_352_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_3 = 0.2

			if var_352_2 <= arg_349_1.time_ and arg_349_1.time_ < var_352_2 + var_352_3 then
				local var_352_4 = (arg_349_1.time_ - var_352_2) / var_352_3

				if arg_349_1.var_.characterEffect1052ui_story then
					arg_349_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_349_1.time_ >= var_352_2 + var_352_3 and arg_349_1.time_ < var_352_2 + var_352_3 + arg_352_0 and arg_349_1.var_.characterEffect1052ui_story then
				arg_349_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_352_5 = 0
			local var_352_6 = 0.525

			if var_352_5 < arg_349_1.time_ and arg_349_1.time_ <= var_352_5 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_7 = arg_349_1:FormatText(StoryNameCfg[263].name)

				arg_349_1.leftNameTxt_.text = var_352_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_8 = arg_349_1:GetWordFromCfg(115201085)
				local var_352_9 = arg_349_1:FormatText(var_352_8.content)

				arg_349_1.text_.text = var_352_9

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_10 = 21
				local var_352_11 = utf8.len(var_352_9)
				local var_352_12 = var_352_10 <= 0 and var_352_6 or var_352_6 * (var_352_11 / var_352_10)

				if var_352_12 > 0 and var_352_6 < var_352_12 then
					arg_349_1.talkMaxDuration = var_352_12

					if var_352_12 + var_352_5 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_12 + var_352_5
					end
				end

				arg_349_1.text_.text = var_352_9
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201085", "story_v_out_115201.awb") ~= 0 then
					local var_352_13 = manager.audio:GetVoiceLength("story_v_out_115201", "115201085", "story_v_out_115201.awb") / 1000

					if var_352_13 + var_352_5 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_13 + var_352_5
					end

					if var_352_8.prefab_name ~= "" and arg_349_1.actors_[var_352_8.prefab_name] ~= nil then
						local var_352_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_8.prefab_name].transform, "story_v_out_115201", "115201085", "story_v_out_115201.awb")

						arg_349_1:RecordAudio("115201085", var_352_14)
						arg_349_1:RecordAudio("115201085", var_352_14)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_115201", "115201085", "story_v_out_115201.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_115201", "115201085", "story_v_out_115201.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_15 = math.max(var_352_6, arg_349_1.talkMaxDuration)

			if var_352_5 <= arg_349_1.time_ and arg_349_1.time_ < var_352_5 + var_352_15 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_5) / var_352_15

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_5 + var_352_15 and arg_349_1.time_ < var_352_5 + var_352_15 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play115201086 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 115201086
		arg_353_1.duration_ = 10.333

		local var_353_0 = {
			ja = 10.333,
			ko = 8.033,
			zh = 8.233,
			en = 8.766
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
				arg_353_0:Play115201087(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = 0

			if var_356_0 < arg_353_1.time_ and arg_353_1.time_ <= var_356_0 + arg_356_0 then
				arg_353_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_356_1 = 0
			local var_356_2 = 0.8

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_3 = arg_353_1:FormatText(StoryNameCfg[263].name)

				arg_353_1.leftNameTxt_.text = var_356_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_4 = arg_353_1:GetWordFromCfg(115201086)
				local var_356_5 = arg_353_1:FormatText(var_356_4.content)

				arg_353_1.text_.text = var_356_5

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_6 = 32
				local var_356_7 = utf8.len(var_356_5)
				local var_356_8 = var_356_6 <= 0 and var_356_2 or var_356_2 * (var_356_7 / var_356_6)

				if var_356_8 > 0 and var_356_2 < var_356_8 then
					arg_353_1.talkMaxDuration = var_356_8

					if var_356_8 + var_356_1 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_8 + var_356_1
					end
				end

				arg_353_1.text_.text = var_356_5
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201086", "story_v_out_115201.awb") ~= 0 then
					local var_356_9 = manager.audio:GetVoiceLength("story_v_out_115201", "115201086", "story_v_out_115201.awb") / 1000

					if var_356_9 + var_356_1 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_9 + var_356_1
					end

					if var_356_4.prefab_name ~= "" and arg_353_1.actors_[var_356_4.prefab_name] ~= nil then
						local var_356_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_4.prefab_name].transform, "story_v_out_115201", "115201086", "story_v_out_115201.awb")

						arg_353_1:RecordAudio("115201086", var_356_10)
						arg_353_1:RecordAudio("115201086", var_356_10)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_115201", "115201086", "story_v_out_115201.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_115201", "115201086", "story_v_out_115201.awb")
				end

				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_11 = math.max(var_356_2, arg_353_1.talkMaxDuration)

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_11 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_1) / var_356_11

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_1 + var_356_11 and arg_353_1.time_ < var_356_1 + var_356_11 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play115201087 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 115201087
		arg_357_1.duration_ = 3.733

		local var_357_0 = {
			ja = 3.733,
			ko = 2.7,
			zh = 2.833,
			en = 2.833
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
				arg_357_0:Play115201088(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["1024ui_story"]
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 and arg_357_1.var_.characterEffect1024ui_story == nil then
				arg_357_1.var_.characterEffect1024ui_story = var_360_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_2 = 0.2

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_2 then
				local var_360_3 = (arg_357_1.time_ - var_360_1) / var_360_2

				if arg_357_1.var_.characterEffect1024ui_story then
					arg_357_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_357_1.time_ >= var_360_1 + var_360_2 and arg_357_1.time_ < var_360_1 + var_360_2 + arg_360_0 and arg_357_1.var_.characterEffect1024ui_story then
				arg_357_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_360_4 = 0

			if var_360_4 < arg_357_1.time_ and arg_357_1.time_ <= var_360_4 + arg_360_0 then
				arg_357_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_360_5 = arg_357_1.actors_["1052ui_story"]
			local var_360_6 = 0

			if var_360_6 < arg_357_1.time_ and arg_357_1.time_ <= var_360_6 + arg_360_0 and arg_357_1.var_.characterEffect1052ui_story == nil then
				arg_357_1.var_.characterEffect1052ui_story = var_360_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_7 = 0.2

			if var_360_6 <= arg_357_1.time_ and arg_357_1.time_ < var_360_6 + var_360_7 then
				local var_360_8 = (arg_357_1.time_ - var_360_6) / var_360_7

				if arg_357_1.var_.characterEffect1052ui_story then
					local var_360_9 = Mathf.Lerp(0, 0.5, var_360_8)

					arg_357_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_357_1.var_.characterEffect1052ui_story.fillRatio = var_360_9
				end
			end

			if arg_357_1.time_ >= var_360_6 + var_360_7 and arg_357_1.time_ < var_360_6 + var_360_7 + arg_360_0 and arg_357_1.var_.characterEffect1052ui_story then
				local var_360_10 = 0.5

				arg_357_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_357_1.var_.characterEffect1052ui_story.fillRatio = var_360_10
			end

			local var_360_11 = 0
			local var_360_12 = 0.325

			if var_360_11 < arg_357_1.time_ and arg_357_1.time_ <= var_360_11 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_13 = arg_357_1:FormatText(StoryNameCfg[265].name)

				arg_357_1.leftNameTxt_.text = var_360_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_14 = arg_357_1:GetWordFromCfg(115201087)
				local var_360_15 = arg_357_1:FormatText(var_360_14.content)

				arg_357_1.text_.text = var_360_15

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_16 = 13
				local var_360_17 = utf8.len(var_360_15)
				local var_360_18 = var_360_16 <= 0 and var_360_12 or var_360_12 * (var_360_17 / var_360_16)

				if var_360_18 > 0 and var_360_12 < var_360_18 then
					arg_357_1.talkMaxDuration = var_360_18

					if var_360_18 + var_360_11 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_18 + var_360_11
					end
				end

				arg_357_1.text_.text = var_360_15
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201087", "story_v_out_115201.awb") ~= 0 then
					local var_360_19 = manager.audio:GetVoiceLength("story_v_out_115201", "115201087", "story_v_out_115201.awb") / 1000

					if var_360_19 + var_360_11 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_19 + var_360_11
					end

					if var_360_14.prefab_name ~= "" and arg_357_1.actors_[var_360_14.prefab_name] ~= nil then
						local var_360_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_14.prefab_name].transform, "story_v_out_115201", "115201087", "story_v_out_115201.awb")

						arg_357_1:RecordAudio("115201087", var_360_20)
						arg_357_1:RecordAudio("115201087", var_360_20)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_115201", "115201087", "story_v_out_115201.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_115201", "115201087", "story_v_out_115201.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_21 = math.max(var_360_12, arg_357_1.talkMaxDuration)

			if var_360_11 <= arg_357_1.time_ and arg_357_1.time_ < var_360_11 + var_360_21 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_11) / var_360_21

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_11 + var_360_21 and arg_357_1.time_ < var_360_11 + var_360_21 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play115201088 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 115201088
		arg_361_1.duration_ = 4.7

		local var_361_0 = {
			ja = 2.8,
			ko = 3.533,
			zh = 4.7,
			en = 2.6
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
				arg_361_0:Play115201089(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = 0

			if var_364_0 < arg_361_1.time_ and arg_361_1.time_ <= var_364_0 + arg_364_0 then
				arg_361_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_364_1 = arg_361_1.actors_["1052ui_story"]
			local var_364_2 = 0

			if var_364_2 < arg_361_1.time_ and arg_361_1.time_ <= var_364_2 + arg_364_0 and arg_361_1.var_.characterEffect1052ui_story == nil then
				arg_361_1.var_.characterEffect1052ui_story = var_364_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_364_3 = 0.2

			if var_364_2 <= arg_361_1.time_ and arg_361_1.time_ < var_364_2 + var_364_3 then
				local var_364_4 = (arg_361_1.time_ - var_364_2) / var_364_3

				if arg_361_1.var_.characterEffect1052ui_story then
					arg_361_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_361_1.time_ >= var_364_2 + var_364_3 and arg_361_1.time_ < var_364_2 + var_364_3 + arg_364_0 and arg_361_1.var_.characterEffect1052ui_story then
				arg_361_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_364_5 = 0
			local var_364_6 = 0.275

			if var_364_5 < arg_361_1.time_ and arg_361_1.time_ <= var_364_5 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_7 = arg_361_1:FormatText(StoryNameCfg[263].name)

				arg_361_1.leftNameTxt_.text = var_364_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_8 = arg_361_1:GetWordFromCfg(115201088)
				local var_364_9 = arg_361_1:FormatText(var_364_8.content)

				arg_361_1.text_.text = var_364_9

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_10 = 11
				local var_364_11 = utf8.len(var_364_9)
				local var_364_12 = var_364_10 <= 0 and var_364_6 or var_364_6 * (var_364_11 / var_364_10)

				if var_364_12 > 0 and var_364_6 < var_364_12 then
					arg_361_1.talkMaxDuration = var_364_12

					if var_364_12 + var_364_5 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_12 + var_364_5
					end
				end

				arg_361_1.text_.text = var_364_9
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201088", "story_v_out_115201.awb") ~= 0 then
					local var_364_13 = manager.audio:GetVoiceLength("story_v_out_115201", "115201088", "story_v_out_115201.awb") / 1000

					if var_364_13 + var_364_5 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_13 + var_364_5
					end

					if var_364_8.prefab_name ~= "" and arg_361_1.actors_[var_364_8.prefab_name] ~= nil then
						local var_364_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_8.prefab_name].transform, "story_v_out_115201", "115201088", "story_v_out_115201.awb")

						arg_361_1:RecordAudio("115201088", var_364_14)
						arg_361_1:RecordAudio("115201088", var_364_14)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_115201", "115201088", "story_v_out_115201.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_115201", "115201088", "story_v_out_115201.awb")
				end

				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_15 = math.max(var_364_6, arg_361_1.talkMaxDuration)

			if var_364_5 <= arg_361_1.time_ and arg_361_1.time_ < var_364_5 + var_364_15 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_5) / var_364_15

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_5 + var_364_15 and arg_361_1.time_ < var_364_5 + var_364_15 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play115201089 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 115201089
		arg_365_1.duration_ = 3.866

		local var_365_0 = {
			ja = 3.866,
			ko = 3.566,
			zh = 2.633,
			en = 2.066
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
				arg_365_0:Play115201090(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["1052ui_story"]
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 and arg_365_1.var_.characterEffect1052ui_story == nil then
				arg_365_1.var_.characterEffect1052ui_story = var_368_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_2 = 0.2

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_2 then
				local var_368_3 = (arg_365_1.time_ - var_368_1) / var_368_2

				if arg_365_1.var_.characterEffect1052ui_story then
					local var_368_4 = Mathf.Lerp(0, 0.5, var_368_3)

					arg_365_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_365_1.var_.characterEffect1052ui_story.fillRatio = var_368_4
				end
			end

			if arg_365_1.time_ >= var_368_1 + var_368_2 and arg_365_1.time_ < var_368_1 + var_368_2 + arg_368_0 and arg_365_1.var_.characterEffect1052ui_story then
				local var_368_5 = 0.5

				arg_365_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_365_1.var_.characterEffect1052ui_story.fillRatio = var_368_5
			end

			local var_368_6 = 0
			local var_368_7 = 0.275

			if var_368_6 < arg_365_1.time_ and arg_365_1.time_ <= var_368_6 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_8 = arg_365_1:FormatText(StoryNameCfg[273].name)

				arg_365_1.leftNameTxt_.text = var_368_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, true)
				arg_365_1.iconController_:SetSelectedState("hero")

				arg_365_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1017")

				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_9 = arg_365_1:GetWordFromCfg(115201089)
				local var_368_10 = arg_365_1:FormatText(var_368_9.content)

				arg_365_1.text_.text = var_368_10

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_11 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201089", "story_v_out_115201.awb") ~= 0 then
					local var_368_14 = manager.audio:GetVoiceLength("story_v_out_115201", "115201089", "story_v_out_115201.awb") / 1000

					if var_368_14 + var_368_6 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_14 + var_368_6
					end

					if var_368_9.prefab_name ~= "" and arg_365_1.actors_[var_368_9.prefab_name] ~= nil then
						local var_368_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_9.prefab_name].transform, "story_v_out_115201", "115201089", "story_v_out_115201.awb")

						arg_365_1:RecordAudio("115201089", var_368_15)
						arg_365_1:RecordAudio("115201089", var_368_15)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_out_115201", "115201089", "story_v_out_115201.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_out_115201", "115201089", "story_v_out_115201.awb")
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
	Play115201090 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 115201090
		arg_369_1.duration_ = 5

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play115201091(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = arg_369_1.actors_["1052ui_story"].transform
			local var_372_1 = 0

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 then
				arg_369_1.var_.moveOldPos1052ui_story = var_372_0.localPosition
			end

			local var_372_2 = 0.001

			if var_372_1 <= arg_369_1.time_ and arg_369_1.time_ < var_372_1 + var_372_2 then
				local var_372_3 = (arg_369_1.time_ - var_372_1) / var_372_2
				local var_372_4 = Vector3.New(0, 100, 0)

				var_372_0.localPosition = Vector3.Lerp(arg_369_1.var_.moveOldPos1052ui_story, var_372_4, var_372_3)

				local var_372_5 = manager.ui.mainCamera.transform.position - var_372_0.position

				var_372_0.forward = Vector3.New(var_372_5.x, var_372_5.y, var_372_5.z)

				local var_372_6 = var_372_0.localEulerAngles

				var_372_6.z = 0
				var_372_6.x = 0
				var_372_0.localEulerAngles = var_372_6
			end

			if arg_369_1.time_ >= var_372_1 + var_372_2 and arg_369_1.time_ < var_372_1 + var_372_2 + arg_372_0 then
				var_372_0.localPosition = Vector3.New(0, 100, 0)

				local var_372_7 = manager.ui.mainCamera.transform.position - var_372_0.position

				var_372_0.forward = Vector3.New(var_372_7.x, var_372_7.y, var_372_7.z)

				local var_372_8 = var_372_0.localEulerAngles

				var_372_8.z = 0
				var_372_8.x = 0
				var_372_0.localEulerAngles = var_372_8
			end

			local var_372_9 = arg_369_1.actors_["1024ui_story"].transform
			local var_372_10 = 0

			if var_372_10 < arg_369_1.time_ and arg_369_1.time_ <= var_372_10 + arg_372_0 then
				arg_369_1.var_.moveOldPos1024ui_story = var_372_9.localPosition
			end

			local var_372_11 = 0.001

			if var_372_10 <= arg_369_1.time_ and arg_369_1.time_ < var_372_10 + var_372_11 then
				local var_372_12 = (arg_369_1.time_ - var_372_10) / var_372_11
				local var_372_13 = Vector3.New(0, 100, 0)

				var_372_9.localPosition = Vector3.Lerp(arg_369_1.var_.moveOldPos1024ui_story, var_372_13, var_372_12)

				local var_372_14 = manager.ui.mainCamera.transform.position - var_372_9.position

				var_372_9.forward = Vector3.New(var_372_14.x, var_372_14.y, var_372_14.z)

				local var_372_15 = var_372_9.localEulerAngles

				var_372_15.z = 0
				var_372_15.x = 0
				var_372_9.localEulerAngles = var_372_15
			end

			if arg_369_1.time_ >= var_372_10 + var_372_11 and arg_369_1.time_ < var_372_10 + var_372_11 + arg_372_0 then
				var_372_9.localPosition = Vector3.New(0, 100, 0)

				local var_372_16 = manager.ui.mainCamera.transform.position - var_372_9.position

				var_372_9.forward = Vector3.New(var_372_16.x, var_372_16.y, var_372_16.z)

				local var_372_17 = var_372_9.localEulerAngles

				var_372_17.z = 0
				var_372_17.x = 0
				var_372_9.localEulerAngles = var_372_17
			end

			local var_372_18 = 0
			local var_372_19 = 0.6

			if var_372_18 < arg_369_1.time_ and arg_369_1.time_ <= var_372_18 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, false)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_20 = arg_369_1:GetWordFromCfg(115201090)
				local var_372_21 = arg_369_1:FormatText(var_372_20.content)

				arg_369_1.text_.text = var_372_21

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_22 = 24
				local var_372_23 = utf8.len(var_372_21)
				local var_372_24 = var_372_22 <= 0 and var_372_19 or var_372_19 * (var_372_23 / var_372_22)

				if var_372_24 > 0 and var_372_19 < var_372_24 then
					arg_369_1.talkMaxDuration = var_372_24

					if var_372_24 + var_372_18 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_24 + var_372_18
					end
				end

				arg_369_1.text_.text = var_372_21
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)
				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_25 = math.max(var_372_19, arg_369_1.talkMaxDuration)

			if var_372_18 <= arg_369_1.time_ and arg_369_1.time_ < var_372_18 + var_372_25 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_18) / var_372_25

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_18 + var_372_25 and arg_369_1.time_ < var_372_18 + var_372_25 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play115201091 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 115201091
		arg_373_1.duration_ = 4.7

		local var_373_0 = {
			ja = 4.7,
			ko = 2.8,
			zh = 3.8,
			en = 2.433
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
				arg_373_0:Play115201092(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["1052ui_story"].transform
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 then
				arg_373_1.var_.moveOldPos1052ui_story = var_376_0.localPosition
			end

			local var_376_2 = 0.001

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_2 then
				local var_376_3 = (arg_373_1.time_ - var_376_1) / var_376_2
				local var_376_4 = Vector3.New(0, -1.05, -6.2)

				var_376_0.localPosition = Vector3.Lerp(arg_373_1.var_.moveOldPos1052ui_story, var_376_4, var_376_3)

				local var_376_5 = manager.ui.mainCamera.transform.position - var_376_0.position

				var_376_0.forward = Vector3.New(var_376_5.x, var_376_5.y, var_376_5.z)

				local var_376_6 = var_376_0.localEulerAngles

				var_376_6.z = 0
				var_376_6.x = 0
				var_376_0.localEulerAngles = var_376_6
			end

			if arg_373_1.time_ >= var_376_1 + var_376_2 and arg_373_1.time_ < var_376_1 + var_376_2 + arg_376_0 then
				var_376_0.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_376_7 = manager.ui.mainCamera.transform.position - var_376_0.position

				var_376_0.forward = Vector3.New(var_376_7.x, var_376_7.y, var_376_7.z)

				local var_376_8 = var_376_0.localEulerAngles

				var_376_8.z = 0
				var_376_8.x = 0
				var_376_0.localEulerAngles = var_376_8
			end

			local var_376_9 = 0

			if var_376_9 < arg_373_1.time_ and arg_373_1.time_ <= var_376_9 + arg_376_0 then
				arg_373_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_376_10 = 0

			if var_376_10 < arg_373_1.time_ and arg_373_1.time_ <= var_376_10 + arg_376_0 then
				arg_373_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action1_1")
			end

			local var_376_11 = arg_373_1.actors_["1052ui_story"]
			local var_376_12 = 0

			if var_376_12 < arg_373_1.time_ and arg_373_1.time_ <= var_376_12 + arg_376_0 and arg_373_1.var_.characterEffect1052ui_story == nil then
				arg_373_1.var_.characterEffect1052ui_story = var_376_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_13 = 0.2

			if var_376_12 <= arg_373_1.time_ and arg_373_1.time_ < var_376_12 + var_376_13 then
				local var_376_14 = (arg_373_1.time_ - var_376_12) / var_376_13

				if arg_373_1.var_.characterEffect1052ui_story then
					arg_373_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_373_1.time_ >= var_376_12 + var_376_13 and arg_373_1.time_ < var_376_12 + var_376_13 + arg_376_0 and arg_373_1.var_.characterEffect1052ui_story then
				arg_373_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_376_15 = 0
			local var_376_16 = 0.275

			if var_376_15 < arg_373_1.time_ and arg_373_1.time_ <= var_376_15 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_17 = arg_373_1:FormatText(StoryNameCfg[263].name)

				arg_373_1.leftNameTxt_.text = var_376_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_18 = arg_373_1:GetWordFromCfg(115201091)
				local var_376_19 = arg_373_1:FormatText(var_376_18.content)

				arg_373_1.text_.text = var_376_19

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_20 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201091", "story_v_out_115201.awb") ~= 0 then
					local var_376_23 = manager.audio:GetVoiceLength("story_v_out_115201", "115201091", "story_v_out_115201.awb") / 1000

					if var_376_23 + var_376_15 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_23 + var_376_15
					end

					if var_376_18.prefab_name ~= "" and arg_373_1.actors_[var_376_18.prefab_name] ~= nil then
						local var_376_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_18.prefab_name].transform, "story_v_out_115201", "115201091", "story_v_out_115201.awb")

						arg_373_1:RecordAudio("115201091", var_376_24)
						arg_373_1:RecordAudio("115201091", var_376_24)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_115201", "115201091", "story_v_out_115201.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_115201", "115201091", "story_v_out_115201.awb")
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
	Play115201092 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 115201092
		arg_377_1.duration_ = 6.4

		local var_377_0 = {
			ja = 4.4,
			ko = 5.166,
			zh = 5.033,
			en = 6.4
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
				arg_377_0:Play115201093(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["1052ui_story"]
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 and arg_377_1.var_.characterEffect1052ui_story == nil then
				arg_377_1.var_.characterEffect1052ui_story = var_380_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_2 = 0.2

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_2 then
				local var_380_3 = (arg_377_1.time_ - var_380_1) / var_380_2

				if arg_377_1.var_.characterEffect1052ui_story then
					local var_380_4 = Mathf.Lerp(0, 0.5, var_380_3)

					arg_377_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_377_1.var_.characterEffect1052ui_story.fillRatio = var_380_4
				end
			end

			if arg_377_1.time_ >= var_380_1 + var_380_2 and arg_377_1.time_ < var_380_1 + var_380_2 + arg_380_0 and arg_377_1.var_.characterEffect1052ui_story then
				local var_380_5 = 0.5

				arg_377_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_377_1.var_.characterEffect1052ui_story.fillRatio = var_380_5
			end

			local var_380_6 = 0
			local var_380_7 = 0.575

			if var_380_6 < arg_377_1.time_ and arg_377_1.time_ <= var_380_6 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_8 = arg_377_1:FormatText(StoryNameCfg[261].name)

				arg_377_1.leftNameTxt_.text = var_380_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, true)
				arg_377_1.iconController_:SetSelectedState("hero")

				arg_377_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2084")

				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_9 = arg_377_1:GetWordFromCfg(115201092)
				local var_380_10 = arg_377_1:FormatText(var_380_9.content)

				arg_377_1.text_.text = var_380_10

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_11 = 23
				local var_380_12 = utf8.len(var_380_10)
				local var_380_13 = var_380_11 <= 0 and var_380_7 or var_380_7 * (var_380_12 / var_380_11)

				if var_380_13 > 0 and var_380_7 < var_380_13 then
					arg_377_1.talkMaxDuration = var_380_13

					if var_380_13 + var_380_6 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_13 + var_380_6
					end
				end

				arg_377_1.text_.text = var_380_10
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201092", "story_v_out_115201.awb") ~= 0 then
					local var_380_14 = manager.audio:GetVoiceLength("story_v_out_115201", "115201092", "story_v_out_115201.awb") / 1000

					if var_380_14 + var_380_6 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_14 + var_380_6
					end

					if var_380_9.prefab_name ~= "" and arg_377_1.actors_[var_380_9.prefab_name] ~= nil then
						local var_380_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_377_1.actors_[var_380_9.prefab_name].transform, "story_v_out_115201", "115201092", "story_v_out_115201.awb")

						arg_377_1:RecordAudio("115201092", var_380_15)
						arg_377_1:RecordAudio("115201092", var_380_15)
					else
						arg_377_1:AudioAction("play", "voice", "story_v_out_115201", "115201092", "story_v_out_115201.awb")
					end

					arg_377_1:RecordHistoryTalkVoice("story_v_out_115201", "115201092", "story_v_out_115201.awb")
				end

				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_16 = math.max(var_380_7, arg_377_1.talkMaxDuration)

			if var_380_6 <= arg_377_1.time_ and arg_377_1.time_ < var_380_6 + var_380_16 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_6) / var_380_16

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_6 + var_380_16 and arg_377_1.time_ < var_380_6 + var_380_16 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play115201093 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 115201093
		arg_381_1.duration_ = 3.2

		local var_381_0 = {
			ja = 2.4,
			ko = 1.999999999999,
			zh = 3.2,
			en = 2.033
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
				arg_381_0:Play115201094(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = arg_381_1.actors_["1052ui_story"]
			local var_384_1 = 0

			if var_384_1 < arg_381_1.time_ and arg_381_1.time_ <= var_384_1 + arg_384_0 and arg_381_1.var_.characterEffect1052ui_story == nil then
				arg_381_1.var_.characterEffect1052ui_story = var_384_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_384_2 = 0.2

			if var_384_1 <= arg_381_1.time_ and arg_381_1.time_ < var_384_1 + var_384_2 then
				local var_384_3 = (arg_381_1.time_ - var_384_1) / var_384_2

				if arg_381_1.var_.characterEffect1052ui_story then
					arg_381_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_381_1.time_ >= var_384_1 + var_384_2 and arg_381_1.time_ < var_384_1 + var_384_2 + arg_384_0 and arg_381_1.var_.characterEffect1052ui_story then
				arg_381_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_384_4 = 0

			if var_384_4 < arg_381_1.time_ and arg_381_1.time_ <= var_384_4 + arg_384_0 then
				arg_381_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_384_5 = 0
			local var_384_6 = 0.125

			if var_384_5 < arg_381_1.time_ and arg_381_1.time_ <= var_384_5 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_7 = arg_381_1:FormatText(StoryNameCfg[263].name)

				arg_381_1.leftNameTxt_.text = var_384_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_8 = arg_381_1:GetWordFromCfg(115201093)
				local var_384_9 = arg_381_1:FormatText(var_384_8.content)

				arg_381_1.text_.text = var_384_9

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_10 = 5
				local var_384_11 = utf8.len(var_384_9)
				local var_384_12 = var_384_10 <= 0 and var_384_6 or var_384_6 * (var_384_11 / var_384_10)

				if var_384_12 > 0 and var_384_6 < var_384_12 then
					arg_381_1.talkMaxDuration = var_384_12

					if var_384_12 + var_384_5 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_12 + var_384_5
					end
				end

				arg_381_1.text_.text = var_384_9
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201093", "story_v_out_115201.awb") ~= 0 then
					local var_384_13 = manager.audio:GetVoiceLength("story_v_out_115201", "115201093", "story_v_out_115201.awb") / 1000

					if var_384_13 + var_384_5 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_13 + var_384_5
					end

					if var_384_8.prefab_name ~= "" and arg_381_1.actors_[var_384_8.prefab_name] ~= nil then
						local var_384_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_8.prefab_name].transform, "story_v_out_115201", "115201093", "story_v_out_115201.awb")

						arg_381_1:RecordAudio("115201093", var_384_14)
						arg_381_1:RecordAudio("115201093", var_384_14)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_115201", "115201093", "story_v_out_115201.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_115201", "115201093", "story_v_out_115201.awb")
				end

				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_15 = math.max(var_384_6, arg_381_1.talkMaxDuration)

			if var_384_5 <= arg_381_1.time_ and arg_381_1.time_ < var_384_5 + var_384_15 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_5) / var_384_15

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_5 + var_384_15 and arg_381_1.time_ < var_384_5 + var_384_15 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play115201094 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 115201094
		arg_385_1.duration_ = 2.533

		local var_385_0 = {
			ja = 2.3,
			ko = 2.533,
			zh = 1.866,
			en = 1.7
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
				arg_385_0:Play115201095(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = arg_385_1.actors_["1052ui_story"]
			local var_388_1 = 0

			if var_388_1 < arg_385_1.time_ and arg_385_1.time_ <= var_388_1 + arg_388_0 and arg_385_1.var_.characterEffect1052ui_story == nil then
				arg_385_1.var_.characterEffect1052ui_story = var_388_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_388_2 = 0.2

			if var_388_1 <= arg_385_1.time_ and arg_385_1.time_ < var_388_1 + var_388_2 then
				local var_388_3 = (arg_385_1.time_ - var_388_1) / var_388_2

				if arg_385_1.var_.characterEffect1052ui_story then
					local var_388_4 = Mathf.Lerp(0, 0.5, var_388_3)

					arg_385_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_385_1.var_.characterEffect1052ui_story.fillRatio = var_388_4
				end
			end

			if arg_385_1.time_ >= var_388_1 + var_388_2 and arg_385_1.time_ < var_388_1 + var_388_2 + arg_388_0 and arg_385_1.var_.characterEffect1052ui_story then
				local var_388_5 = 0.5

				arg_385_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_385_1.var_.characterEffect1052ui_story.fillRatio = var_388_5
			end

			local var_388_6 = 0
			local var_388_7 = 0.225

			if var_388_6 < arg_385_1.time_ and arg_385_1.time_ <= var_388_6 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_8 = arg_385_1:FormatText(StoryNameCfg[261].name)

				arg_385_1.leftNameTxt_.text = var_388_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, true)
				arg_385_1.iconController_:SetSelectedState("hero")

				arg_385_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2084")

				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_9 = arg_385_1:GetWordFromCfg(115201094)
				local var_388_10 = arg_385_1:FormatText(var_388_9.content)

				arg_385_1.text_.text = var_388_10

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_11 = 9
				local var_388_12 = utf8.len(var_388_10)
				local var_388_13 = var_388_11 <= 0 and var_388_7 or var_388_7 * (var_388_12 / var_388_11)

				if var_388_13 > 0 and var_388_7 < var_388_13 then
					arg_385_1.talkMaxDuration = var_388_13

					if var_388_13 + var_388_6 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_13 + var_388_6
					end
				end

				arg_385_1.text_.text = var_388_10
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201094", "story_v_out_115201.awb") ~= 0 then
					local var_388_14 = manager.audio:GetVoiceLength("story_v_out_115201", "115201094", "story_v_out_115201.awb") / 1000

					if var_388_14 + var_388_6 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_14 + var_388_6
					end

					if var_388_9.prefab_name ~= "" and arg_385_1.actors_[var_388_9.prefab_name] ~= nil then
						local var_388_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_385_1.actors_[var_388_9.prefab_name].transform, "story_v_out_115201", "115201094", "story_v_out_115201.awb")

						arg_385_1:RecordAudio("115201094", var_388_15)
						arg_385_1:RecordAudio("115201094", var_388_15)
					else
						arg_385_1:AudioAction("play", "voice", "story_v_out_115201", "115201094", "story_v_out_115201.awb")
					end

					arg_385_1:RecordHistoryTalkVoice("story_v_out_115201", "115201094", "story_v_out_115201.awb")
				end

				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_16 = math.max(var_388_7, arg_385_1.talkMaxDuration)

			if var_388_6 <= arg_385_1.time_ and arg_385_1.time_ < var_388_6 + var_388_16 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_6) / var_388_16

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_6 + var_388_16 and arg_385_1.time_ < var_388_6 + var_388_16 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play115201095 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 115201095
		arg_389_1.duration_ = 6.4

		local var_389_0 = {
			ja = 6.4,
			ko = 5.266,
			zh = 5.9,
			en = 5.933
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
				arg_389_0:Play115201096(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = 0

			if var_392_0 < arg_389_1.time_ and arg_389_1.time_ <= var_392_0 + arg_392_0 then
				arg_389_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_392_1 = arg_389_1.actors_["1052ui_story"]
			local var_392_2 = 0

			if var_392_2 < arg_389_1.time_ and arg_389_1.time_ <= var_392_2 + arg_392_0 and arg_389_1.var_.characterEffect1052ui_story == nil then
				arg_389_1.var_.characterEffect1052ui_story = var_392_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_3 = 0.2

			if var_392_2 <= arg_389_1.time_ and arg_389_1.time_ < var_392_2 + var_392_3 then
				local var_392_4 = (arg_389_1.time_ - var_392_2) / var_392_3

				if arg_389_1.var_.characterEffect1052ui_story then
					arg_389_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_389_1.time_ >= var_392_2 + var_392_3 and arg_389_1.time_ < var_392_2 + var_392_3 + arg_392_0 and arg_389_1.var_.characterEffect1052ui_story then
				arg_389_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_392_5 = 0

			if var_392_5 < arg_389_1.time_ and arg_389_1.time_ <= var_392_5 + arg_392_0 then
				arg_389_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action6_1")
			end

			local var_392_6 = 0
			local var_392_7 = 0.55

			if var_392_6 < arg_389_1.time_ and arg_389_1.time_ <= var_392_6 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_8 = arg_389_1:FormatText(StoryNameCfg[263].name)

				arg_389_1.leftNameTxt_.text = var_392_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_9 = arg_389_1:GetWordFromCfg(115201095)
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201095", "story_v_out_115201.awb") ~= 0 then
					local var_392_14 = manager.audio:GetVoiceLength("story_v_out_115201", "115201095", "story_v_out_115201.awb") / 1000

					if var_392_14 + var_392_6 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_14 + var_392_6
					end

					if var_392_9.prefab_name ~= "" and arg_389_1.actors_[var_392_9.prefab_name] ~= nil then
						local var_392_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_9.prefab_name].transform, "story_v_out_115201", "115201095", "story_v_out_115201.awb")

						arg_389_1:RecordAudio("115201095", var_392_15)
						arg_389_1:RecordAudio("115201095", var_392_15)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_out_115201", "115201095", "story_v_out_115201.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_out_115201", "115201095", "story_v_out_115201.awb")
				end

				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_16 = math.max(var_392_7, arg_389_1.talkMaxDuration)

			if var_392_6 <= arg_389_1.time_ and arg_389_1.time_ < var_392_6 + var_392_16 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_6) / var_392_16

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_6 + var_392_16 and arg_389_1.time_ < var_392_6 + var_392_16 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play115201096 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 115201096
		arg_393_1.duration_ = 3.633

		local var_393_0 = {
			ja = 3.333,
			ko = 3.2,
			zh = 3.633,
			en = 3.566
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
				arg_393_0:Play115201097(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = arg_393_1.actors_["1052ui_story"]
			local var_396_1 = 0

			if var_396_1 < arg_393_1.time_ and arg_393_1.time_ <= var_396_1 + arg_396_0 and arg_393_1.var_.characterEffect1052ui_story == nil then
				arg_393_1.var_.characterEffect1052ui_story = var_396_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_396_2 = 0.2

			if var_396_1 <= arg_393_1.time_ and arg_393_1.time_ < var_396_1 + var_396_2 then
				local var_396_3 = (arg_393_1.time_ - var_396_1) / var_396_2

				if arg_393_1.var_.characterEffect1052ui_story then
					local var_396_4 = Mathf.Lerp(0, 0.5, var_396_3)

					arg_393_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_393_1.var_.characterEffect1052ui_story.fillRatio = var_396_4
				end
			end

			if arg_393_1.time_ >= var_396_1 + var_396_2 and arg_393_1.time_ < var_396_1 + var_396_2 + arg_396_0 and arg_393_1.var_.characterEffect1052ui_story then
				local var_396_5 = 0.5

				arg_393_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_393_1.var_.characterEffect1052ui_story.fillRatio = var_396_5
			end

			local var_396_6 = 0
			local var_396_7 = 0.225

			if var_396_6 < arg_393_1.time_ and arg_393_1.time_ <= var_396_6 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_8 = arg_393_1:FormatText(StoryNameCfg[261].name)

				arg_393_1.leftNameTxt_.text = var_396_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, true)
				arg_393_1.iconController_:SetSelectedState("hero")

				arg_393_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2084")

				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_9 = arg_393_1:GetWordFromCfg(115201096)
				local var_396_10 = arg_393_1:FormatText(var_396_9.content)

				arg_393_1.text_.text = var_396_10

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_11 = 9
				local var_396_12 = utf8.len(var_396_10)
				local var_396_13 = var_396_11 <= 0 and var_396_7 or var_396_7 * (var_396_12 / var_396_11)

				if var_396_13 > 0 and var_396_7 < var_396_13 then
					arg_393_1.talkMaxDuration = var_396_13

					if var_396_13 + var_396_6 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_13 + var_396_6
					end
				end

				arg_393_1.text_.text = var_396_10
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201096", "story_v_out_115201.awb") ~= 0 then
					local var_396_14 = manager.audio:GetVoiceLength("story_v_out_115201", "115201096", "story_v_out_115201.awb") / 1000

					if var_396_14 + var_396_6 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_14 + var_396_6
					end

					if var_396_9.prefab_name ~= "" and arg_393_1.actors_[var_396_9.prefab_name] ~= nil then
						local var_396_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_393_1.actors_[var_396_9.prefab_name].transform, "story_v_out_115201", "115201096", "story_v_out_115201.awb")

						arg_393_1:RecordAudio("115201096", var_396_15)
						arg_393_1:RecordAudio("115201096", var_396_15)
					else
						arg_393_1:AudioAction("play", "voice", "story_v_out_115201", "115201096", "story_v_out_115201.awb")
					end

					arg_393_1:RecordHistoryTalkVoice("story_v_out_115201", "115201096", "story_v_out_115201.awb")
				end

				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_16 = math.max(var_396_7, arg_393_1.talkMaxDuration)

			if var_396_6 <= arg_393_1.time_ and arg_393_1.time_ < var_396_6 + var_396_16 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_6) / var_396_16

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_6 + var_396_16 and arg_393_1.time_ < var_396_6 + var_396_16 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play115201097 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 115201097
		arg_397_1.duration_ = 8.5

		local var_397_0 = {
			ja = 5.866,
			ko = 8.3,
			zh = 7.033,
			en = 8.5
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
				arg_397_0:Play115201098(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = 0
			local var_400_1 = 0.8

			if var_400_0 < arg_397_1.time_ and arg_397_1.time_ <= var_400_0 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_2 = arg_397_1:FormatText(StoryNameCfg[262].name)

				arg_397_1.leftNameTxt_.text = var_400_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, true)
				arg_397_1.iconController_:SetSelectedState("hero")

				arg_397_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2084")

				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_3 = arg_397_1:GetWordFromCfg(115201097)
				local var_400_4 = arg_397_1:FormatText(var_400_3.content)

				arg_397_1.text_.text = var_400_4

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_5 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201097", "story_v_out_115201.awb") ~= 0 then
					local var_400_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201097", "story_v_out_115201.awb") / 1000

					if var_400_8 + var_400_0 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_8 + var_400_0
					end

					if var_400_3.prefab_name ~= "" and arg_397_1.actors_[var_400_3.prefab_name] ~= nil then
						local var_400_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_3.prefab_name].transform, "story_v_out_115201", "115201097", "story_v_out_115201.awb")

						arg_397_1:RecordAudio("115201097", var_400_9)
						arg_397_1:RecordAudio("115201097", var_400_9)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_out_115201", "115201097", "story_v_out_115201.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_out_115201", "115201097", "story_v_out_115201.awb")
				end

				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_10 = math.max(var_400_1, arg_397_1.talkMaxDuration)

			if var_400_0 <= arg_397_1.time_ and arg_397_1.time_ < var_400_0 + var_400_10 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_0) / var_400_10

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_0 + var_400_10 and arg_397_1.time_ < var_400_0 + var_400_10 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play115201098 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 115201098
		arg_401_1.duration_ = 14.9

		local var_401_0 = {
			ja = 12.666,
			ko = 8.366,
			zh = 8.8,
			en = 14.9
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
				arg_401_0:Play115201099(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = 0
			local var_404_1 = 1.225

			if var_404_0 < arg_401_1.time_ and arg_401_1.time_ <= var_404_0 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_2 = arg_401_1:FormatText(StoryNameCfg[291].name)

				arg_401_1.leftNameTxt_.text = var_404_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, true)
				arg_401_1.iconController_:SetSelectedState("hero")

				arg_401_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2084")

				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_3 = arg_401_1:GetWordFromCfg(115201098)
				local var_404_4 = arg_401_1:FormatText(var_404_3.content)

				arg_401_1.text_.text = var_404_4

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_5 = 49
				local var_404_6 = utf8.len(var_404_4)
				local var_404_7 = var_404_5 <= 0 and var_404_1 or var_404_1 * (var_404_6 / var_404_5)

				if var_404_7 > 0 and var_404_1 < var_404_7 then
					arg_401_1.talkMaxDuration = var_404_7

					if var_404_7 + var_404_0 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_7 + var_404_0
					end
				end

				arg_401_1.text_.text = var_404_4
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201098", "story_v_out_115201.awb") ~= 0 then
					local var_404_8 = manager.audio:GetVoiceLength("story_v_out_115201", "115201098", "story_v_out_115201.awb") / 1000

					if var_404_8 + var_404_0 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_8 + var_404_0
					end

					if var_404_3.prefab_name ~= "" and arg_401_1.actors_[var_404_3.prefab_name] ~= nil then
						local var_404_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_3.prefab_name].transform, "story_v_out_115201", "115201098", "story_v_out_115201.awb")

						arg_401_1:RecordAudio("115201098", var_404_9)
						arg_401_1:RecordAudio("115201098", var_404_9)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_out_115201", "115201098", "story_v_out_115201.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_out_115201", "115201098", "story_v_out_115201.awb")
				end

				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_10 = math.max(var_404_1, arg_401_1.talkMaxDuration)

			if var_404_0 <= arg_401_1.time_ and arg_401_1.time_ < var_404_0 + var_404_10 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_0) / var_404_10

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_0 + var_404_10 and arg_401_1.time_ < var_404_0 + var_404_10 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play115201099 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 115201099
		arg_405_1.duration_ = 10.133

		local var_405_0 = {
			ja = 8.233,
			ko = 5.633,
			zh = 5.2,
			en = 10.133
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
				arg_405_0:Play115201100(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = 0

			if var_408_0 < arg_405_1.time_ and arg_405_1.time_ <= var_408_0 + arg_408_0 then
				arg_405_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_408_1 = arg_405_1.actors_["1052ui_story"]
			local var_408_2 = 0

			if var_408_2 < arg_405_1.time_ and arg_405_1.time_ <= var_408_2 + arg_408_0 and arg_405_1.var_.characterEffect1052ui_story == nil then
				arg_405_1.var_.characterEffect1052ui_story = var_408_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_408_3 = 0.2

			if var_408_2 <= arg_405_1.time_ and arg_405_1.time_ < var_408_2 + var_408_3 then
				local var_408_4 = (arg_405_1.time_ - var_408_2) / var_408_3

				if arg_405_1.var_.characterEffect1052ui_story then
					arg_405_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_405_1.time_ >= var_408_2 + var_408_3 and arg_405_1.time_ < var_408_2 + var_408_3 + arg_408_0 and arg_405_1.var_.characterEffect1052ui_story then
				arg_405_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_408_5 = 0

			if var_408_5 < arg_405_1.time_ and arg_405_1.time_ <= var_408_5 + arg_408_0 then
				arg_405_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action6_2")
			end

			local var_408_6 = 0
			local var_408_7 = 0.4

			if var_408_6 < arg_405_1.time_ and arg_405_1.time_ <= var_408_6 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_8 = arg_405_1:FormatText(StoryNameCfg[263].name)

				arg_405_1.leftNameTxt_.text = var_408_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_9 = arg_405_1:GetWordFromCfg(115201099)
				local var_408_10 = arg_405_1:FormatText(var_408_9.content)

				arg_405_1.text_.text = var_408_10

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_11 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201099", "story_v_out_115201.awb") ~= 0 then
					local var_408_14 = manager.audio:GetVoiceLength("story_v_out_115201", "115201099", "story_v_out_115201.awb") / 1000

					if var_408_14 + var_408_6 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_14 + var_408_6
					end

					if var_408_9.prefab_name ~= "" and arg_405_1.actors_[var_408_9.prefab_name] ~= nil then
						local var_408_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_405_1.actors_[var_408_9.prefab_name].transform, "story_v_out_115201", "115201099", "story_v_out_115201.awb")

						arg_405_1:RecordAudio("115201099", var_408_15)
						arg_405_1:RecordAudio("115201099", var_408_15)
					else
						arg_405_1:AudioAction("play", "voice", "story_v_out_115201", "115201099", "story_v_out_115201.awb")
					end

					arg_405_1:RecordHistoryTalkVoice("story_v_out_115201", "115201099", "story_v_out_115201.awb")
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
	Play115201100 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 115201100
		arg_409_1.duration_ = 12.7

		local var_409_0 = {
			ja = 12.633,
			ko = 10.433,
			zh = 9.6,
			en = 12.7
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
				arg_409_0:Play115201101(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = 0

			if var_412_0 < arg_409_1.time_ and arg_409_1.time_ <= var_412_0 + arg_412_0 then
				arg_409_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_412_1 = 0
			local var_412_2 = 1.2

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_3 = arg_409_1:FormatText(StoryNameCfg[263].name)

				arg_409_1.leftNameTxt_.text = var_412_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_4 = arg_409_1:GetWordFromCfg(115201100)
				local var_412_5 = arg_409_1:FormatText(var_412_4.content)

				arg_409_1.text_.text = var_412_5

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_6 = 48
				local var_412_7 = utf8.len(var_412_5)
				local var_412_8 = var_412_6 <= 0 and var_412_2 or var_412_2 * (var_412_7 / var_412_6)

				if var_412_8 > 0 and var_412_2 < var_412_8 then
					arg_409_1.talkMaxDuration = var_412_8

					if var_412_8 + var_412_1 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_8 + var_412_1
					end
				end

				arg_409_1.text_.text = var_412_5
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201100", "story_v_out_115201.awb") ~= 0 then
					local var_412_9 = manager.audio:GetVoiceLength("story_v_out_115201", "115201100", "story_v_out_115201.awb") / 1000

					if var_412_9 + var_412_1 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_9 + var_412_1
					end

					if var_412_4.prefab_name ~= "" and arg_409_1.actors_[var_412_4.prefab_name] ~= nil then
						local var_412_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_4.prefab_name].transform, "story_v_out_115201", "115201100", "story_v_out_115201.awb")

						arg_409_1:RecordAudio("115201100", var_412_10)
						arg_409_1:RecordAudio("115201100", var_412_10)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_115201", "115201100", "story_v_out_115201.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_115201", "115201100", "story_v_out_115201.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_11 = math.max(var_412_2, arg_409_1.talkMaxDuration)

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_11 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_1) / var_412_11

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_1 + var_412_11 and arg_409_1.time_ < var_412_1 + var_412_11 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play115201101 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 115201101
		arg_413_1.duration_ = 4.966

		local var_413_0 = {
			ja = 4.5,
			ko = 4.966,
			zh = 4.2,
			en = 3.366
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
				arg_413_0:Play115201102(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = 0

			if var_416_0 < arg_413_1.time_ and arg_413_1.time_ <= var_416_0 + arg_416_0 then
				arg_413_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_416_1 = 0
			local var_416_2 = 0.4

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_3 = arg_413_1:FormatText(StoryNameCfg[263].name)

				arg_413_1.leftNameTxt_.text = var_416_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_4 = arg_413_1:GetWordFromCfg(115201101)
				local var_416_5 = arg_413_1:FormatText(var_416_4.content)

				arg_413_1.text_.text = var_416_5

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_6 = 16
				local var_416_7 = utf8.len(var_416_5)
				local var_416_8 = var_416_6 <= 0 and var_416_2 or var_416_2 * (var_416_7 / var_416_6)

				if var_416_8 > 0 and var_416_2 < var_416_8 then
					arg_413_1.talkMaxDuration = var_416_8

					if var_416_8 + var_416_1 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_8 + var_416_1
					end
				end

				arg_413_1.text_.text = var_416_5
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201101", "story_v_out_115201.awb") ~= 0 then
					local var_416_9 = manager.audio:GetVoiceLength("story_v_out_115201", "115201101", "story_v_out_115201.awb") / 1000

					if var_416_9 + var_416_1 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_9 + var_416_1
					end

					if var_416_4.prefab_name ~= "" and arg_413_1.actors_[var_416_4.prefab_name] ~= nil then
						local var_416_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_413_1.actors_[var_416_4.prefab_name].transform, "story_v_out_115201", "115201101", "story_v_out_115201.awb")

						arg_413_1:RecordAudio("115201101", var_416_10)
						arg_413_1:RecordAudio("115201101", var_416_10)
					else
						arg_413_1:AudioAction("play", "voice", "story_v_out_115201", "115201101", "story_v_out_115201.awb")
					end

					arg_413_1:RecordHistoryTalkVoice("story_v_out_115201", "115201101", "story_v_out_115201.awb")
				end

				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_11 = math.max(var_416_2, arg_413_1.talkMaxDuration)

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_11 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_1) / var_416_11

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_1 + var_416_11 and arg_413_1.time_ < var_416_1 + var_416_11 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play115201102 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 115201102
		arg_417_1.duration_ = 11

		local var_417_0 = {
			ja = 11,
			ko = 6.266,
			zh = 5.533,
			en = 7.766
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
				arg_417_0:Play115201103(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["1052ui_story"].transform
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 then
				arg_417_1.var_.moveOldPos1052ui_story = var_420_0.localPosition
			end

			local var_420_2 = 0.001

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2
				local var_420_4 = Vector3.New(0, 100, 0)

				var_420_0.localPosition = Vector3.Lerp(arg_417_1.var_.moveOldPos1052ui_story, var_420_4, var_420_3)

				local var_420_5 = manager.ui.mainCamera.transform.position - var_420_0.position

				var_420_0.forward = Vector3.New(var_420_5.x, var_420_5.y, var_420_5.z)

				local var_420_6 = var_420_0.localEulerAngles

				var_420_6.z = 0
				var_420_6.x = 0
				var_420_0.localEulerAngles = var_420_6
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 then
				var_420_0.localPosition = Vector3.New(0, 100, 0)

				local var_420_7 = manager.ui.mainCamera.transform.position - var_420_0.position

				var_420_0.forward = Vector3.New(var_420_7.x, var_420_7.y, var_420_7.z)

				local var_420_8 = var_420_0.localEulerAngles

				var_420_8.z = 0
				var_420_8.x = 0
				var_420_0.localEulerAngles = var_420_8
			end

			local var_420_9 = arg_417_1.actors_["1024ui_story"].transform
			local var_420_10 = 0

			if var_420_10 < arg_417_1.time_ and arg_417_1.time_ <= var_420_10 + arg_420_0 then
				arg_417_1.var_.moveOldPos1024ui_story = var_420_9.localPosition
			end

			local var_420_11 = 0.001

			if var_420_10 <= arg_417_1.time_ and arg_417_1.time_ < var_420_10 + var_420_11 then
				local var_420_12 = (arg_417_1.time_ - var_420_10) / var_420_11
				local var_420_13 = Vector3.New(0, -1, -6.05)

				var_420_9.localPosition = Vector3.Lerp(arg_417_1.var_.moveOldPos1024ui_story, var_420_13, var_420_12)

				local var_420_14 = manager.ui.mainCamera.transform.position - var_420_9.position

				var_420_9.forward = Vector3.New(var_420_14.x, var_420_14.y, var_420_14.z)

				local var_420_15 = var_420_9.localEulerAngles

				var_420_15.z = 0
				var_420_15.x = 0
				var_420_9.localEulerAngles = var_420_15
			end

			if arg_417_1.time_ >= var_420_10 + var_420_11 and arg_417_1.time_ < var_420_10 + var_420_11 + arg_420_0 then
				var_420_9.localPosition = Vector3.New(0, -1, -6.05)

				local var_420_16 = manager.ui.mainCamera.transform.position - var_420_9.position

				var_420_9.forward = Vector3.New(var_420_16.x, var_420_16.y, var_420_16.z)

				local var_420_17 = var_420_9.localEulerAngles

				var_420_17.z = 0
				var_420_17.x = 0
				var_420_9.localEulerAngles = var_420_17
			end

			local var_420_18 = 0

			if var_420_18 < arg_417_1.time_ and arg_417_1.time_ <= var_420_18 + arg_420_0 then
				arg_417_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action5_1")
			end

			local var_420_19 = 0

			if var_420_19 < arg_417_1.time_ and arg_417_1.time_ <= var_420_19 + arg_420_0 then
				arg_417_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_420_20 = arg_417_1.actors_["1024ui_story"]
			local var_420_21 = 0

			if var_420_21 < arg_417_1.time_ and arg_417_1.time_ <= var_420_21 + arg_420_0 and arg_417_1.var_.characterEffect1024ui_story == nil then
				arg_417_1.var_.characterEffect1024ui_story = var_420_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_22 = 0.2

			if var_420_21 <= arg_417_1.time_ and arg_417_1.time_ < var_420_21 + var_420_22 then
				local var_420_23 = (arg_417_1.time_ - var_420_21) / var_420_22

				if arg_417_1.var_.characterEffect1024ui_story then
					arg_417_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_417_1.time_ >= var_420_21 + var_420_22 and arg_417_1.time_ < var_420_21 + var_420_22 + arg_420_0 and arg_417_1.var_.characterEffect1024ui_story then
				arg_417_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_420_24 = 0
			local var_420_25 = 0.825

			if var_420_24 < arg_417_1.time_ and arg_417_1.time_ <= var_420_24 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_26 = arg_417_1:FormatText(StoryNameCfg[265].name)

				arg_417_1.leftNameTxt_.text = var_420_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_27 = arg_417_1:GetWordFromCfg(115201102)
				local var_420_28 = arg_417_1:FormatText(var_420_27.content)

				arg_417_1.text_.text = var_420_28

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_29 = 33
				local var_420_30 = utf8.len(var_420_28)
				local var_420_31 = var_420_29 <= 0 and var_420_25 or var_420_25 * (var_420_30 / var_420_29)

				if var_420_31 > 0 and var_420_25 < var_420_31 then
					arg_417_1.talkMaxDuration = var_420_31

					if var_420_31 + var_420_24 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_31 + var_420_24
					end
				end

				arg_417_1.text_.text = var_420_28
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201102", "story_v_out_115201.awb") ~= 0 then
					local var_420_32 = manager.audio:GetVoiceLength("story_v_out_115201", "115201102", "story_v_out_115201.awb") / 1000

					if var_420_32 + var_420_24 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_32 + var_420_24
					end

					if var_420_27.prefab_name ~= "" and arg_417_1.actors_[var_420_27.prefab_name] ~= nil then
						local var_420_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_27.prefab_name].transform, "story_v_out_115201", "115201102", "story_v_out_115201.awb")

						arg_417_1:RecordAudio("115201102", var_420_33)
						arg_417_1:RecordAudio("115201102", var_420_33)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_out_115201", "115201102", "story_v_out_115201.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_out_115201", "115201102", "story_v_out_115201.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_34 = math.max(var_420_25, arg_417_1.talkMaxDuration)

			if var_420_24 <= arg_417_1.time_ and arg_417_1.time_ < var_420_24 + var_420_34 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_24) / var_420_34

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_24 + var_420_34 and arg_417_1.time_ < var_420_24 + var_420_34 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play115201103 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 115201103
		arg_421_1.duration_ = 6.666

		local var_421_0 = {
			ja = 6.666,
			ko = 5.6,
			zh = 4.033,
			en = 4.2
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
				arg_421_0:Play115201104(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["1024ui_story"]
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 and arg_421_1.var_.characterEffect1024ui_story == nil then
				arg_421_1.var_.characterEffect1024ui_story = var_424_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_2 = 0.2

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_2 then
				local var_424_3 = (arg_421_1.time_ - var_424_1) / var_424_2

				if arg_421_1.var_.characterEffect1024ui_story then
					local var_424_4 = Mathf.Lerp(0, 0.5, var_424_3)

					arg_421_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_421_1.var_.characterEffect1024ui_story.fillRatio = var_424_4
				end
			end

			if arg_421_1.time_ >= var_424_1 + var_424_2 and arg_421_1.time_ < var_424_1 + var_424_2 + arg_424_0 and arg_421_1.var_.characterEffect1024ui_story then
				local var_424_5 = 0.5

				arg_421_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_421_1.var_.characterEffect1024ui_story.fillRatio = var_424_5
			end

			local var_424_6 = 0
			local var_424_7 = 0.525

			if var_424_6 < arg_421_1.time_ and arg_421_1.time_ <= var_424_6 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, true)

				local var_424_8 = arg_421_1:FormatText(StoryNameCfg[261].name)

				arg_421_1.leftNameTxt_.text = var_424_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_421_1.leftNameTxt_.transform)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1.leftNameTxt_.text)
				SetActive(arg_421_1.iconTrs_.gameObject, true)
				arg_421_1.iconController_:SetSelectedState("hero")

				arg_421_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2084")

				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_9 = arg_421_1:GetWordFromCfg(115201103)
				local var_424_10 = arg_421_1:FormatText(var_424_9.content)

				arg_421_1.text_.text = var_424_10

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_11 = 21
				local var_424_12 = utf8.len(var_424_10)
				local var_424_13 = var_424_11 <= 0 and var_424_7 or var_424_7 * (var_424_12 / var_424_11)

				if var_424_13 > 0 and var_424_7 < var_424_13 then
					arg_421_1.talkMaxDuration = var_424_13

					if var_424_13 + var_424_6 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_13 + var_424_6
					end
				end

				arg_421_1.text_.text = var_424_10
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201103", "story_v_out_115201.awb") ~= 0 then
					local var_424_14 = manager.audio:GetVoiceLength("story_v_out_115201", "115201103", "story_v_out_115201.awb") / 1000

					if var_424_14 + var_424_6 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_14 + var_424_6
					end

					if var_424_9.prefab_name ~= "" and arg_421_1.actors_[var_424_9.prefab_name] ~= nil then
						local var_424_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_421_1.actors_[var_424_9.prefab_name].transform, "story_v_out_115201", "115201103", "story_v_out_115201.awb")

						arg_421_1:RecordAudio("115201103", var_424_15)
						arg_421_1:RecordAudio("115201103", var_424_15)
					else
						arg_421_1:AudioAction("play", "voice", "story_v_out_115201", "115201103", "story_v_out_115201.awb")
					end

					arg_421_1:RecordHistoryTalkVoice("story_v_out_115201", "115201103", "story_v_out_115201.awb")
				end

				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_16 = math.max(var_424_7, arg_421_1.talkMaxDuration)

			if var_424_6 <= arg_421_1.time_ and arg_421_1.time_ < var_424_6 + var_424_16 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_6) / var_424_16

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_6 + var_424_16 and arg_421_1.time_ < var_424_6 + var_424_16 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play115201104 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 115201104
		arg_425_1.duration_ = 5.266

		local var_425_0 = {
			ja = 5.266,
			ko = 4.533,
			zh = 4.033,
			en = 3.133
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
				arg_425_0:Play115201105(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = 0

			if var_428_0 < arg_425_1.time_ and arg_425_1.time_ <= var_428_0 + arg_428_0 then
				arg_425_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_428_1 = arg_425_1.actors_["1024ui_story"]
			local var_428_2 = 0

			if var_428_2 < arg_425_1.time_ and arg_425_1.time_ <= var_428_2 + arg_428_0 and arg_425_1.var_.characterEffect1024ui_story == nil then
				arg_425_1.var_.characterEffect1024ui_story = var_428_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_3 = 0.2

			if var_428_2 <= arg_425_1.time_ and arg_425_1.time_ < var_428_2 + var_428_3 then
				local var_428_4 = (arg_425_1.time_ - var_428_2) / var_428_3

				if arg_425_1.var_.characterEffect1024ui_story then
					arg_425_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_425_1.time_ >= var_428_2 + var_428_3 and arg_425_1.time_ < var_428_2 + var_428_3 + arg_428_0 and arg_425_1.var_.characterEffect1024ui_story then
				arg_425_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_428_5 = 0

			if var_428_5 < arg_425_1.time_ and arg_425_1.time_ <= var_428_5 + arg_428_0 then
				arg_425_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action5_2")
			end

			local var_428_6 = 0
			local var_428_7 = 0.475

			if var_428_6 < arg_425_1.time_ and arg_425_1.time_ <= var_428_6 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_8 = arg_425_1:FormatText(StoryNameCfg[265].name)

				arg_425_1.leftNameTxt_.text = var_428_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_9 = arg_425_1:GetWordFromCfg(115201104)
				local var_428_10 = arg_425_1:FormatText(var_428_9.content)

				arg_425_1.text_.text = var_428_10

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_11 = 19
				local var_428_12 = utf8.len(var_428_10)
				local var_428_13 = var_428_11 <= 0 and var_428_7 or var_428_7 * (var_428_12 / var_428_11)

				if var_428_13 > 0 and var_428_7 < var_428_13 then
					arg_425_1.talkMaxDuration = var_428_13

					if var_428_13 + var_428_6 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_13 + var_428_6
					end
				end

				arg_425_1.text_.text = var_428_10
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201104", "story_v_out_115201.awb") ~= 0 then
					local var_428_14 = manager.audio:GetVoiceLength("story_v_out_115201", "115201104", "story_v_out_115201.awb") / 1000

					if var_428_14 + var_428_6 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_14 + var_428_6
					end

					if var_428_9.prefab_name ~= "" and arg_425_1.actors_[var_428_9.prefab_name] ~= nil then
						local var_428_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_425_1.actors_[var_428_9.prefab_name].transform, "story_v_out_115201", "115201104", "story_v_out_115201.awb")

						arg_425_1:RecordAudio("115201104", var_428_15)
						arg_425_1:RecordAudio("115201104", var_428_15)
					else
						arg_425_1:AudioAction("play", "voice", "story_v_out_115201", "115201104", "story_v_out_115201.awb")
					end

					arg_425_1:RecordHistoryTalkVoice("story_v_out_115201", "115201104", "story_v_out_115201.awb")
				end

				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_16 = math.max(var_428_7, arg_425_1.talkMaxDuration)

			if var_428_6 <= arg_425_1.time_ and arg_425_1.time_ < var_428_6 + var_428_16 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_6) / var_428_16

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_6 + var_428_16 and arg_425_1.time_ < var_428_6 + var_428_16 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play115201105 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 115201105
		arg_429_1.duration_ = 9.6

		local var_429_0 = {
			ja = 8.033,
			ko = 8.466,
			zh = 9.6,
			en = 6.833
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
				arg_429_0:Play115201106(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = arg_429_1.actors_["1024ui_story"].transform
			local var_432_1 = 0

			if var_432_1 < arg_429_1.time_ and arg_429_1.time_ <= var_432_1 + arg_432_0 then
				arg_429_1.var_.moveOldPos1024ui_story = var_432_0.localPosition
			end

			local var_432_2 = 0.001

			if var_432_1 <= arg_429_1.time_ and arg_429_1.time_ < var_432_1 + var_432_2 then
				local var_432_3 = (arg_429_1.time_ - var_432_1) / var_432_2
				local var_432_4 = Vector3.New(0, 100, 0)

				var_432_0.localPosition = Vector3.Lerp(arg_429_1.var_.moveOldPos1024ui_story, var_432_4, var_432_3)

				local var_432_5 = manager.ui.mainCamera.transform.position - var_432_0.position

				var_432_0.forward = Vector3.New(var_432_5.x, var_432_5.y, var_432_5.z)

				local var_432_6 = var_432_0.localEulerAngles

				var_432_6.z = 0
				var_432_6.x = 0
				var_432_0.localEulerAngles = var_432_6
			end

			if arg_429_1.time_ >= var_432_1 + var_432_2 and arg_429_1.time_ < var_432_1 + var_432_2 + arg_432_0 then
				var_432_0.localPosition = Vector3.New(0, 100, 0)

				local var_432_7 = manager.ui.mainCamera.transform.position - var_432_0.position

				var_432_0.forward = Vector3.New(var_432_7.x, var_432_7.y, var_432_7.z)

				local var_432_8 = var_432_0.localEulerAngles

				var_432_8.z = 0
				var_432_8.x = 0
				var_432_0.localEulerAngles = var_432_8
			end

			local var_432_9 = arg_429_1.actors_["1017ui_story"].transform
			local var_432_10 = 0

			if var_432_10 < arg_429_1.time_ and arg_429_1.time_ <= var_432_10 + arg_432_0 then
				arg_429_1.var_.moveOldPos1017ui_story = var_432_9.localPosition
			end

			local var_432_11 = 0.001

			if var_432_10 <= arg_429_1.time_ and arg_429_1.time_ < var_432_10 + var_432_11 then
				local var_432_12 = (arg_429_1.time_ - var_432_10) / var_432_11
				local var_432_13 = Vector3.New(-0.7, -1.01, -6.05)

				var_432_9.localPosition = Vector3.Lerp(arg_429_1.var_.moveOldPos1017ui_story, var_432_13, var_432_12)

				local var_432_14 = manager.ui.mainCamera.transform.position - var_432_9.position

				var_432_9.forward = Vector3.New(var_432_14.x, var_432_14.y, var_432_14.z)

				local var_432_15 = var_432_9.localEulerAngles

				var_432_15.z = 0
				var_432_15.x = 0
				var_432_9.localEulerAngles = var_432_15
			end

			if arg_429_1.time_ >= var_432_10 + var_432_11 and arg_429_1.time_ < var_432_10 + var_432_11 + arg_432_0 then
				var_432_9.localPosition = Vector3.New(-0.7, -1.01, -6.05)

				local var_432_16 = manager.ui.mainCamera.transform.position - var_432_9.position

				var_432_9.forward = Vector3.New(var_432_16.x, var_432_16.y, var_432_16.z)

				local var_432_17 = var_432_9.localEulerAngles

				var_432_17.z = 0
				var_432_17.x = 0
				var_432_9.localEulerAngles = var_432_17
			end

			local var_432_18 = 0

			if var_432_18 < arg_429_1.time_ and arg_429_1.time_ <= var_432_18 + arg_432_0 then
				arg_429_1:PlayTimeline("1017ui_story", "StoryTimeline/CharAction/1017/1017action/1017action6_1")
			end

			local var_432_19 = 0

			if var_432_19 < arg_429_1.time_ and arg_429_1.time_ <= var_432_19 + arg_432_0 then
				arg_429_1:PlayTimeline("1017ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_432_20 = arg_429_1.actors_["1017ui_story"]
			local var_432_21 = 0

			if var_432_21 < arg_429_1.time_ and arg_429_1.time_ <= var_432_21 + arg_432_0 and arg_429_1.var_.characterEffect1017ui_story == nil then
				arg_429_1.var_.characterEffect1017ui_story = var_432_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_22 = 0.2

			if var_432_21 <= arg_429_1.time_ and arg_429_1.time_ < var_432_21 + var_432_22 then
				local var_432_23 = (arg_429_1.time_ - var_432_21) / var_432_22

				if arg_429_1.var_.characterEffect1017ui_story then
					arg_429_1.var_.characterEffect1017ui_story.fillFlat = false
				end
			end

			if arg_429_1.time_ >= var_432_21 + var_432_22 and arg_429_1.time_ < var_432_21 + var_432_22 + arg_432_0 and arg_429_1.var_.characterEffect1017ui_story then
				arg_429_1.var_.characterEffect1017ui_story.fillFlat = false
			end

			local var_432_24 = 0
			local var_432_25 = 1.05

			if var_432_24 < arg_429_1.time_ and arg_429_1.time_ <= var_432_24 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, true)

				local var_432_26 = arg_429_1:FormatText(StoryNameCfg[273].name)

				arg_429_1.leftNameTxt_.text = var_432_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_429_1.leftNameTxt_.transform)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1.leftNameTxt_.text)
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_27 = arg_429_1:GetWordFromCfg(115201105)
				local var_432_28 = arg_429_1:FormatText(var_432_27.content)

				arg_429_1.text_.text = var_432_28

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_29 = 42
				local var_432_30 = utf8.len(var_432_28)
				local var_432_31 = var_432_29 <= 0 and var_432_25 or var_432_25 * (var_432_30 / var_432_29)

				if var_432_31 > 0 and var_432_25 < var_432_31 then
					arg_429_1.talkMaxDuration = var_432_31

					if var_432_31 + var_432_24 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_31 + var_432_24
					end
				end

				arg_429_1.text_.text = var_432_28
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201105", "story_v_out_115201.awb") ~= 0 then
					local var_432_32 = manager.audio:GetVoiceLength("story_v_out_115201", "115201105", "story_v_out_115201.awb") / 1000

					if var_432_32 + var_432_24 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_32 + var_432_24
					end

					if var_432_27.prefab_name ~= "" and arg_429_1.actors_[var_432_27.prefab_name] ~= nil then
						local var_432_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_429_1.actors_[var_432_27.prefab_name].transform, "story_v_out_115201", "115201105", "story_v_out_115201.awb")

						arg_429_1:RecordAudio("115201105", var_432_33)
						arg_429_1:RecordAudio("115201105", var_432_33)
					else
						arg_429_1:AudioAction("play", "voice", "story_v_out_115201", "115201105", "story_v_out_115201.awb")
					end

					arg_429_1:RecordHistoryTalkVoice("story_v_out_115201", "115201105", "story_v_out_115201.awb")
				end

				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_34 = math.max(var_432_25, arg_429_1.talkMaxDuration)

			if var_432_24 <= arg_429_1.time_ and arg_429_1.time_ < var_432_24 + var_432_34 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_24) / var_432_34

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_24 + var_432_34 and arg_429_1.time_ < var_432_24 + var_432_34 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play115201106 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 115201106
		arg_433_1.duration_ = 4.866

		local var_433_0 = {
			ja = 4.866,
			ko = 2.7,
			zh = 4.133,
			en = 4.3
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
			arg_433_1.auto_ = false
		end

		function arg_433_1.playNext_(arg_435_0)
			arg_433_1.onStoryFinished_()
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = arg_433_1.actors_["1017ui_story"]
			local var_436_1 = 0

			if var_436_1 < arg_433_1.time_ and arg_433_1.time_ <= var_436_1 + arg_436_0 and arg_433_1.var_.characterEffect1017ui_story == nil then
				arg_433_1.var_.characterEffect1017ui_story = var_436_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_436_2 = 0.2

			if var_436_1 <= arg_433_1.time_ and arg_433_1.time_ < var_436_1 + var_436_2 then
				local var_436_3 = (arg_433_1.time_ - var_436_1) / var_436_2

				if arg_433_1.var_.characterEffect1017ui_story then
					local var_436_4 = Mathf.Lerp(0, 0.5, var_436_3)

					arg_433_1.var_.characterEffect1017ui_story.fillFlat = true
					arg_433_1.var_.characterEffect1017ui_story.fillRatio = var_436_4
				end
			end

			if arg_433_1.time_ >= var_436_1 + var_436_2 and arg_433_1.time_ < var_436_1 + var_436_2 + arg_436_0 and arg_433_1.var_.characterEffect1017ui_story then
				local var_436_5 = 0.5

				arg_433_1.var_.characterEffect1017ui_story.fillFlat = true
				arg_433_1.var_.characterEffect1017ui_story.fillRatio = var_436_5
			end

			local var_436_6 = arg_433_1.actors_["1052ui_story"].transform
			local var_436_7 = 0

			if var_436_7 < arg_433_1.time_ and arg_433_1.time_ <= var_436_7 + arg_436_0 then
				arg_433_1.var_.moveOldPos1052ui_story = var_436_6.localPosition
			end

			local var_436_8 = 0.001

			if var_436_7 <= arg_433_1.time_ and arg_433_1.time_ < var_436_7 + var_436_8 then
				local var_436_9 = (arg_433_1.time_ - var_436_7) / var_436_8
				local var_436_10 = Vector3.New(0.7, -1.05, -6.2)

				var_436_6.localPosition = Vector3.Lerp(arg_433_1.var_.moveOldPos1052ui_story, var_436_10, var_436_9)

				local var_436_11 = manager.ui.mainCamera.transform.position - var_436_6.position

				var_436_6.forward = Vector3.New(var_436_11.x, var_436_11.y, var_436_11.z)

				local var_436_12 = var_436_6.localEulerAngles

				var_436_12.z = 0
				var_436_12.x = 0
				var_436_6.localEulerAngles = var_436_12
			end

			if arg_433_1.time_ >= var_436_7 + var_436_8 and arg_433_1.time_ < var_436_7 + var_436_8 + arg_436_0 then
				var_436_6.localPosition = Vector3.New(0.7, -1.05, -6.2)

				local var_436_13 = manager.ui.mainCamera.transform.position - var_436_6.position

				var_436_6.forward = Vector3.New(var_436_13.x, var_436_13.y, var_436_13.z)

				local var_436_14 = var_436_6.localEulerAngles

				var_436_14.z = 0
				var_436_14.x = 0
				var_436_6.localEulerAngles = var_436_14
			end

			local var_436_15 = 0

			if var_436_15 < arg_433_1.time_ and arg_433_1.time_ <= var_436_15 + arg_436_0 then
				arg_433_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_436_16 = 0

			if var_436_16 < arg_433_1.time_ and arg_433_1.time_ <= var_436_16 + arg_436_0 then
				arg_433_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action6_1")
			end

			local var_436_17 = arg_433_1.actors_["1052ui_story"]
			local var_436_18 = 0

			if var_436_18 < arg_433_1.time_ and arg_433_1.time_ <= var_436_18 + arg_436_0 and arg_433_1.var_.characterEffect1052ui_story == nil then
				arg_433_1.var_.characterEffect1052ui_story = var_436_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_436_19 = 0.2

			if var_436_18 <= arg_433_1.time_ and arg_433_1.time_ < var_436_18 + var_436_19 then
				local var_436_20 = (arg_433_1.time_ - var_436_18) / var_436_19

				if arg_433_1.var_.characterEffect1052ui_story then
					arg_433_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_433_1.time_ >= var_436_18 + var_436_19 and arg_433_1.time_ < var_436_18 + var_436_19 + arg_436_0 and arg_433_1.var_.characterEffect1052ui_story then
				arg_433_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_436_21 = 0
			local var_436_22 = 0.25

			if var_436_21 < arg_433_1.time_ and arg_433_1.time_ <= var_436_21 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, true)

				local var_436_23 = arg_433_1:FormatText(StoryNameCfg[263].name)

				arg_433_1.leftNameTxt_.text = var_436_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_433_1.leftNameTxt_.transform)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1.leftNameTxt_.text)
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_24 = arg_433_1:GetWordFromCfg(115201106)
				local var_436_25 = arg_433_1:FormatText(var_436_24.content)

				arg_433_1.text_.text = var_436_25

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_26 = 10
				local var_436_27 = utf8.len(var_436_25)
				local var_436_28 = var_436_26 <= 0 and var_436_22 or var_436_22 * (var_436_27 / var_436_26)

				if var_436_28 > 0 and var_436_22 < var_436_28 then
					arg_433_1.talkMaxDuration = var_436_28

					if var_436_28 + var_436_21 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_28 + var_436_21
					end
				end

				arg_433_1.text_.text = var_436_25
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115201", "115201106", "story_v_out_115201.awb") ~= 0 then
					local var_436_29 = manager.audio:GetVoiceLength("story_v_out_115201", "115201106", "story_v_out_115201.awb") / 1000

					if var_436_29 + var_436_21 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_29 + var_436_21
					end

					if var_436_24.prefab_name ~= "" and arg_433_1.actors_[var_436_24.prefab_name] ~= nil then
						local var_436_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_433_1.actors_[var_436_24.prefab_name].transform, "story_v_out_115201", "115201106", "story_v_out_115201.awb")

						arg_433_1:RecordAudio("115201106", var_436_30)
						arg_433_1:RecordAudio("115201106", var_436_30)
					else
						arg_433_1:AudioAction("play", "voice", "story_v_out_115201", "115201106", "story_v_out_115201.awb")
					end

					arg_433_1:RecordHistoryTalkVoice("story_v_out_115201", "115201106", "story_v_out_115201.awb")
				end

				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_31 = math.max(var_436_22, arg_433_1.talkMaxDuration)

			if var_436_21 <= arg_433_1.time_ and arg_433_1.time_ < var_436_21 + var_436_31 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_21) / var_436_31

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_21 + var_436_31 and arg_433_1.time_ < var_436_21 + var_436_31 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/RO0205",
		"Assets/UIResources/UI_AB/TextureConfig/Background/G02j",
		"Assets/UIResources/UI_AB/TextureConfig/Background/RO0206",
		"Assets/UIResources/UI_AB/TextureConfig/Background/G03_1"
	},
	voices = {
		"story_v_out_115201.awb"
	}
}
