return {
	Play115032001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 115032001
		arg_1_1.duration_ = 7.599999999999

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play115032002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "RO0104"

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
				local var_4_5 = arg_1_1.bgs_.RO0104

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
					if iter_4_0 ~= "RO0104" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 0

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = false

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

			local var_4_22 = manager.ui.mainCamera.transform
			local var_4_23 = 1.999999999999

			if var_4_23 < arg_1_1.time_ and arg_1_1.time_ <= var_4_23 + arg_4_0 then
				arg_1_1.var_.shakeOldPos = var_4_22.localPosition
			end

			local var_4_24 = 0.6

			if var_4_23 <= arg_1_1.time_ and arg_1_1.time_ < var_4_23 + var_4_24 then
				local var_4_25 = (arg_1_1.time_ - var_4_23) / 0.066
				local var_4_26, var_4_27 = math.modf(var_4_25)

				var_4_22.localPosition = Vector3.New(var_4_27 * 0.13, var_4_27 * 0.13, var_4_27 * 0.13) + arg_1_1.var_.shakeOldPos
			end

			if arg_1_1.time_ >= var_4_23 + var_4_24 and arg_1_1.time_ < var_4_23 + var_4_24 + arg_4_0 then
				var_4_22.localPosition = arg_1_1.var_.shakeOldPos
			end

			local var_4_28 = 1.999999999999

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_29 = 0.6

			if arg_1_1.time_ >= var_4_28 + var_4_29 and arg_1_1.time_ < var_4_28 + var_4_29 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_30 = arg_1_1.bgs_.RO0104.transform
			local var_4_31 = 0

			if var_4_31 < arg_1_1.time_ and arg_1_1.time_ <= var_4_31 + arg_4_0 then
				arg_1_1.var_.moveOldPosRO0104 = var_4_30.localPosition
			end

			local var_4_32 = 0.001

			if var_4_31 <= arg_1_1.time_ and arg_1_1.time_ < var_4_31 + var_4_32 then
				local var_4_33 = (arg_1_1.time_ - var_4_31) / var_4_32
				local var_4_34 = Vector3.New(0, 1, 9.5)

				var_4_30.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPosRO0104, var_4_34, var_4_33)
			end

			if arg_1_1.time_ >= var_4_31 + var_4_32 and arg_1_1.time_ < var_4_31 + var_4_32 + arg_4_0 then
				var_4_30.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_4_35 = arg_1_1.bgs_.RO0104.transform
			local var_4_36 = 0

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				arg_1_1.var_.moveOldPosRO0104 = var_4_35.localPosition
			end

			local var_4_37 = 0.001

			if var_4_36 <= arg_1_1.time_ and arg_1_1.time_ < var_4_36 + var_4_37 then
				local var_4_38 = (arg_1_1.time_ - var_4_36) / var_4_37
				local var_4_39 = Vector3.New(0, 1, 10)

				var_4_35.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPosRO0104, var_4_39, var_4_38)
			end

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 then
				var_4_35.localPosition = Vector3.New(0, 1, 10)
			end

			local var_4_40 = 2

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_41 = 2.299998

			if arg_1_1.time_ >= var_4_40 + var_4_41 and arg_1_1.time_ < var_4_40 + var_4_41 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_42 = arg_1_1.bgs_.RO0104.transform
			local var_4_43 = 0

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				arg_1_1.var_.moveOldPosRO0104 = var_4_42.localPosition
			end

			local var_4_44 = 3

			if var_4_43 <= arg_1_1.time_ and arg_1_1.time_ < var_4_43 + var_4_44 then
				local var_4_45 = (arg_1_1.time_ - var_4_43) / var_4_44
				local var_4_46 = Vector3.New(0, 1, 9.5)

				var_4_42.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPosRO0104, var_4_46, var_4_45)
			end

			if arg_1_1.time_ >= var_4_43 + var_4_44 and arg_1_1.time_ < var_4_43 + var_4_44 + arg_4_0 then
				var_4_42.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_4_47 = 0
			local var_4_48 = 1

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 then
				local var_4_49 = "play"
				local var_4_50 = "music"

				arg_1_1:AudioAction(var_4_49, var_4_50, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_51 = 1.23333333333333
			local var_4_52 = 2.33333333333333

			if var_4_51 < arg_1_1.time_ and arg_1_1.time_ <= var_4_51 + arg_4_0 then
				local var_4_53 = "play"
				local var_4_54 = "music"

				arg_1_1:AudioAction(var_4_53, var_4_54, "bgm_activity_1_5_story_3", "bgm_activity_1_5_story_3", "bgm_activity_1_5_story_3.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_55 = 2.599999999999
			local var_4_56 = 0.625

			if var_4_55 < arg_1_1.time_ and arg_1_1.time_ <= var_4_55 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_57 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_57:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_57:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_57:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_58 = arg_1_1:GetWordFromCfg(115032001)
				local var_4_59 = arg_1_1:FormatText(var_4_58.content)

				arg_1_1.text_.text = var_4_59

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_60 = 25
				local var_4_61 = utf8.len(var_4_59)
				local var_4_62 = var_4_60 <= 0 and var_4_56 or var_4_56 * (var_4_61 / var_4_60)

				if var_4_62 > 0 and var_4_56 < var_4_62 then
					arg_1_1.talkMaxDuration = var_4_62
					var_4_55 = var_4_55 + 0.3

					if var_4_62 + var_4_55 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_62 + var_4_55
					end
				end

				arg_1_1.text_.text = var_4_59
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_63 = var_4_55 + 0.3
			local var_4_64 = math.max(var_4_56, arg_1_1.talkMaxDuration)

			if var_4_63 <= arg_1_1.time_ and arg_1_1.time_ < var_4_63 + var_4_64 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_63) / var_4_64

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_63 + var_4_64 and arg_1_1.time_ < var_4_63 + var_4_64 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play115032002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 115032002
		arg_7_1.duration_ = 4.633

		local var_7_0 = {
			ja = 2.7,
			ko = 4.633,
			zh = 2.4,
			en = 2.9
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
				arg_7_0:Play115032003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.3

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[265].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(115032002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_115032", "115032002", "story_v_out_115032.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_115032", "115032002", "story_v_out_115032.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_115032", "115032002", "story_v_out_115032.awb")

						arg_7_1:RecordAudio("115032002", var_10_9)
						arg_7_1:RecordAudio("115032002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_115032", "115032002", "story_v_out_115032.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_115032", "115032002", "story_v_out_115032.awb")
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
	Play115032003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 115032003
		arg_11_1.duration_ = 5.466

		local var_11_0 = {
			ja = 5.466,
			ko = 4.3,
			zh = 4.366,
			en = 3.733
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
				arg_11_0:Play115032004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.425

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[264].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10014")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(115032003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_115032", "115032003", "story_v_out_115032.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_115032", "115032003", "story_v_out_115032.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_115032", "115032003", "story_v_out_115032.awb")

						arg_11_1:RecordAudio("115032003", var_14_9)
						arg_11_1:RecordAudio("115032003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_115032", "115032003", "story_v_out_115032.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_115032", "115032003", "story_v_out_115032.awb")
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
	Play115032004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 115032004
		arg_15_1.duration_ = 6.866

		local var_15_0 = {
			ja = 6.866,
			ko = 5.799999999999,
			zh = 6.3,
			en = 5.799999999999
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
				arg_15_0:Play115032005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "G03a"

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
				local var_18_5 = arg_15_1.bgs_.G03a

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
					if iter_18_0 ~= "G03a" then
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

			local var_18_27 = "1024ui_story"

			if arg_15_1.actors_[var_18_27] == nil then
				local var_18_28 = Object.Instantiate(Asset.Load("Char/" .. var_18_27), arg_15_1.stage_.transform)

				var_18_28.name = var_18_27
				var_18_28.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.actors_[var_18_27] = var_18_28

				local var_18_29 = var_18_28:GetComponentInChildren(typeof(CharacterEffect))

				var_18_29.enabled = true

				local var_18_30 = GameObjectTools.GetOrAddComponent(var_18_28, typeof(DynamicBoneHelper))

				if var_18_30 then
					var_18_30:EnableDynamicBone(false)
				end

				arg_15_1:ShowWeapon(var_18_29.transform, false)

				arg_15_1.var_[var_18_27 .. "Animator"] = var_18_29.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_15_1.var_[var_18_27 .. "Animator"].applyRootMotion = true
				arg_15_1.var_[var_18_27 .. "LipSync"] = var_18_29.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_18_31 = arg_15_1.actors_["1024ui_story"].transform
			local var_18_32 = 3.8

			if var_18_32 < arg_15_1.time_ and arg_15_1.time_ <= var_18_32 + arg_18_0 then
				arg_15_1.var_.moveOldPos1024ui_story = var_18_31.localPosition
			end

			local var_18_33 = 0.001

			if var_18_32 <= arg_15_1.time_ and arg_15_1.time_ < var_18_32 + var_18_33 then
				local var_18_34 = (arg_15_1.time_ - var_18_32) / var_18_33
				local var_18_35 = Vector3.New(-0.7, -1, -6.05)

				var_18_31.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1024ui_story, var_18_35, var_18_34)

				local var_18_36 = manager.ui.mainCamera.transform.position - var_18_31.position

				var_18_31.forward = Vector3.New(var_18_36.x, var_18_36.y, var_18_36.z)

				local var_18_37 = var_18_31.localEulerAngles

				var_18_37.z = 0
				var_18_37.x = 0
				var_18_31.localEulerAngles = var_18_37
			end

			if arg_15_1.time_ >= var_18_32 + var_18_33 and arg_15_1.time_ < var_18_32 + var_18_33 + arg_18_0 then
				var_18_31.localPosition = Vector3.New(-0.7, -1, -6.05)

				local var_18_38 = manager.ui.mainCamera.transform.position - var_18_31.position

				var_18_31.forward = Vector3.New(var_18_38.x, var_18_38.y, var_18_38.z)

				local var_18_39 = var_18_31.localEulerAngles

				var_18_39.z = 0
				var_18_39.x = 0
				var_18_31.localEulerAngles = var_18_39
			end

			local var_18_40 = 3.8

			if var_18_40 < arg_15_1.time_ and arg_15_1.time_ <= var_18_40 + arg_18_0 then
				arg_15_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action1_1")
			end

			local var_18_41 = 3.8

			if var_18_41 < arg_15_1.time_ and arg_15_1.time_ <= var_18_41 + arg_18_0 then
				arg_15_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_18_42 = arg_15_1.actors_["1024ui_story"]
			local var_18_43 = 3.8

			if var_18_43 < arg_15_1.time_ and arg_15_1.time_ <= var_18_43 + arg_18_0 and arg_15_1.var_.characterEffect1024ui_story == nil then
				arg_15_1.var_.characterEffect1024ui_story = var_18_42:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_44 = 0.2

			if var_18_43 <= arg_15_1.time_ and arg_15_1.time_ < var_18_43 + var_18_44 then
				local var_18_45 = (arg_15_1.time_ - var_18_43) / var_18_44

				if arg_15_1.var_.characterEffect1024ui_story then
					arg_15_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_43 + var_18_44 and arg_15_1.time_ < var_18_43 + var_18_44 + arg_18_0 and arg_15_1.var_.characterEffect1024ui_story then
				arg_15_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			if arg_15_1.frameCnt_ <= 1 then
				arg_15_1.dialog_:SetActive(false)
			end

			local var_18_46 = 4
			local var_18_47 = 0.25

			if var_18_46 < arg_15_1.time_ and arg_15_1.time_ <= var_18_46 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0

				arg_15_1.dialog_:SetActive(true)

				local var_18_48 = LeanTween.value(arg_15_1.dialog_, 0, 1, 0.3)

				var_18_48:setOnUpdate(LuaHelper.FloatAction(function(arg_19_0)
					arg_15_1.dialogCg_.alpha = arg_19_0
				end))
				var_18_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_15_1.dialog_)
					var_18_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_15_1.duration_ = arg_15_1.duration_ + 0.3

				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_49 = arg_15_1:FormatText(StoryNameCfg[265].name)

				arg_15_1.leftNameTxt_.text = var_18_49

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_50 = arg_15_1:GetWordFromCfg(115032004)
				local var_18_51 = arg_15_1:FormatText(var_18_50.content)

				arg_15_1.text_.text = var_18_51

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_52 = 10
				local var_18_53 = utf8.len(var_18_51)
				local var_18_54 = var_18_52 <= 0 and var_18_47 or var_18_47 * (var_18_53 / var_18_52)

				if var_18_54 > 0 and var_18_47 < var_18_54 then
					arg_15_1.talkMaxDuration = var_18_54
					var_18_46 = var_18_46 + 0.3

					if var_18_54 + var_18_46 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_54 + var_18_46
					end
				end

				arg_15_1.text_.text = var_18_51
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115032", "115032004", "story_v_out_115032.awb") ~= 0 then
					local var_18_55 = manager.audio:GetVoiceLength("story_v_out_115032", "115032004", "story_v_out_115032.awb") / 1000

					if var_18_55 + var_18_46 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_55 + var_18_46
					end

					if var_18_50.prefab_name ~= "" and arg_15_1.actors_[var_18_50.prefab_name] ~= nil then
						local var_18_56 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_50.prefab_name].transform, "story_v_out_115032", "115032004", "story_v_out_115032.awb")

						arg_15_1:RecordAudio("115032004", var_18_56)
						arg_15_1:RecordAudio("115032004", var_18_56)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_115032", "115032004", "story_v_out_115032.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_115032", "115032004", "story_v_out_115032.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_57 = var_18_46 + 0.3
			local var_18_58 = math.max(var_18_47, arg_15_1.talkMaxDuration)

			if var_18_57 <= arg_15_1.time_ and arg_15_1.time_ < var_18_57 + var_18_58 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_57) / var_18_58

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_57 + var_18_58 and arg_15_1.time_ < var_18_57 + var_18_58 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play115032005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 115032005
		arg_21_1.duration_ = 2.966666666666

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play115032006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = arg_21_1.actors_["1024ui_story"]
			local var_24_1 = 0

			if var_24_1 < arg_21_1.time_ and arg_21_1.time_ <= var_24_1 + arg_24_0 and arg_21_1.var_.characterEffect1024ui_story == nil then
				arg_21_1.var_.characterEffect1024ui_story = var_24_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_24_2 = 0.2

			if var_24_1 <= arg_21_1.time_ and arg_21_1.time_ < var_24_1 + var_24_2 then
				local var_24_3 = (arg_21_1.time_ - var_24_1) / var_24_2

				if arg_21_1.var_.characterEffect1024ui_story then
					local var_24_4 = Mathf.Lerp(0, 0.5, var_24_3)

					arg_21_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_21_1.var_.characterEffect1024ui_story.fillRatio = var_24_4
				end
			end

			if arg_21_1.time_ >= var_24_1 + var_24_2 and arg_21_1.time_ < var_24_1 + var_24_2 + arg_24_0 and arg_21_1.var_.characterEffect1024ui_story then
				local var_24_5 = 0.5

				arg_21_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_21_1.var_.characterEffect1024ui_story.fillRatio = var_24_5
			end

			local var_24_6 = "10014ui_story"

			if arg_21_1.actors_[var_24_6] == nil then
				local var_24_7 = Object.Instantiate(Asset.Load("Char/" .. var_24_6), arg_21_1.stage_.transform)

				var_24_7.name = var_24_6
				var_24_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_21_1.actors_[var_24_6] = var_24_7

				local var_24_8 = var_24_7:GetComponentInChildren(typeof(CharacterEffect))

				var_24_8.enabled = true

				local var_24_9 = GameObjectTools.GetOrAddComponent(var_24_7, typeof(DynamicBoneHelper))

				if var_24_9 then
					var_24_9:EnableDynamicBone(false)
				end

				arg_21_1:ShowWeapon(var_24_8.transform, false)

				arg_21_1.var_[var_24_6 .. "Animator"] = var_24_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_21_1.var_[var_24_6 .. "Animator"].applyRootMotion = true
				arg_21_1.var_[var_24_6 .. "LipSync"] = var_24_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_24_10 = arg_21_1.actors_["10014ui_story"].transform
			local var_24_11 = 0

			if var_24_11 < arg_21_1.time_ and arg_21_1.time_ <= var_24_11 + arg_24_0 then
				arg_21_1.var_.moveOldPos10014ui_story = var_24_10.localPosition
			end

			local var_24_12 = 0.001

			if var_24_11 <= arg_21_1.time_ and arg_21_1.time_ < var_24_11 + var_24_12 then
				local var_24_13 = (arg_21_1.time_ - var_24_11) / var_24_12
				local var_24_14 = Vector3.New(0.7, -1.06, -6.2)

				var_24_10.localPosition = Vector3.Lerp(arg_21_1.var_.moveOldPos10014ui_story, var_24_14, var_24_13)

				local var_24_15 = manager.ui.mainCamera.transform.position - var_24_10.position

				var_24_10.forward = Vector3.New(var_24_15.x, var_24_15.y, var_24_15.z)

				local var_24_16 = var_24_10.localEulerAngles

				var_24_16.z = 0
				var_24_16.x = 0
				var_24_10.localEulerAngles = var_24_16
			end

			if arg_21_1.time_ >= var_24_11 + var_24_12 and arg_21_1.time_ < var_24_11 + var_24_12 + arg_24_0 then
				var_24_10.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_24_17 = manager.ui.mainCamera.transform.position - var_24_10.position

				var_24_10.forward = Vector3.New(var_24_17.x, var_24_17.y, var_24_17.z)

				local var_24_18 = var_24_10.localEulerAngles

				var_24_18.z = 0
				var_24_18.x = 0
				var_24_10.localEulerAngles = var_24_18
			end

			local var_24_19 = 0

			if var_24_19 < arg_21_1.time_ and arg_21_1.time_ <= var_24_19 + arg_24_0 then
				arg_21_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_24_20 = arg_21_1.actors_["10014ui_story"]
			local var_24_21 = 0

			if var_24_21 < arg_21_1.time_ and arg_21_1.time_ <= var_24_21 + arg_24_0 then
				if arg_21_1.var_.characterEffect10014ui_story == nil then
					arg_21_1.var_.characterEffect10014ui_story = var_24_20:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_24_22 = arg_21_1.var_.characterEffect10014ui_story

				var_24_22.imageEffect:turnOff()

				var_24_22.interferenceEffect.enabled = true
				var_24_22.interferenceEffect.noise = 0.001
				var_24_22.interferenceEffect.simTimeScale = 1
				var_24_22.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_24_23 = arg_21_1.actors_["10014ui_story"]
			local var_24_24 = 0
			local var_24_25 = 0.1

			if var_24_24 < arg_21_1.time_ and arg_21_1.time_ <= var_24_24 + arg_24_0 then
				if arg_21_1.var_.characterEffect10014ui_story == nil then
					arg_21_1.var_.characterEffect10014ui_story = var_24_23:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_21_1.var_.characterEffect10014ui_story.imageEffect:turnOn(false)
			end

			local var_24_26 = 0

			if var_24_26 < arg_21_1.time_ and arg_21_1.time_ <= var_24_26 + arg_24_0 then
				arg_21_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_24_27 = 0
			local var_24_28 = 0.125

			if var_24_27 < arg_21_1.time_ and arg_21_1.time_ <= var_24_27 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_29 = arg_21_1:FormatText(StoryNameCfg[264].name)

				arg_21_1.leftNameTxt_.text = var_24_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_30 = arg_21_1:GetWordFromCfg(115032005)
				local var_24_31 = arg_21_1:FormatText(var_24_30.content)

				arg_21_1.text_.text = var_24_31

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_32 = 5
				local var_24_33 = utf8.len(var_24_31)
				local var_24_34 = var_24_32 <= 0 and var_24_28 or var_24_28 * (var_24_33 / var_24_32)

				if var_24_34 > 0 and var_24_28 < var_24_34 then
					arg_21_1.talkMaxDuration = var_24_34

					if var_24_34 + var_24_27 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_34 + var_24_27
					end
				end

				arg_21_1.text_.text = var_24_31
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115032", "115032005", "story_v_out_115032.awb") ~= 0 then
					local var_24_35 = manager.audio:GetVoiceLength("story_v_out_115032", "115032005", "story_v_out_115032.awb") / 1000

					if var_24_35 + var_24_27 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_35 + var_24_27
					end

					if var_24_30.prefab_name ~= "" and arg_21_1.actors_[var_24_30.prefab_name] ~= nil then
						local var_24_36 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_30.prefab_name].transform, "story_v_out_115032", "115032005", "story_v_out_115032.awb")

						arg_21_1:RecordAudio("115032005", var_24_36)
						arg_21_1:RecordAudio("115032005", var_24_36)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_out_115032", "115032005", "story_v_out_115032.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_out_115032", "115032005", "story_v_out_115032.awb")
				end

				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_37 = math.max(var_24_28, arg_21_1.talkMaxDuration)

			if var_24_27 <= arg_21_1.time_ and arg_21_1.time_ < var_24_27 + var_24_37 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_27) / var_24_37

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_27 + var_24_37 and arg_21_1.time_ < var_24_27 + var_24_37 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play115032006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 115032006
		arg_25_1.duration_ = 4.733

		local var_25_0 = {
			ja = 4.733,
			ko = 3.966,
			zh = 3.266,
			en = 2.2
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
				arg_25_0:Play115032007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["1024ui_story"]
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 and arg_25_1.var_.characterEffect1024ui_story == nil then
				arg_25_1.var_.characterEffect1024ui_story = var_28_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_2 = 0.2

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2

				if arg_25_1.var_.characterEffect1024ui_story then
					arg_25_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 and arg_25_1.var_.characterEffect1024ui_story then
				arg_25_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_28_4 = 0

			if var_28_4 < arg_25_1.time_ and arg_25_1.time_ <= var_28_4 + arg_28_0 then
				arg_25_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_28_5 = 0
			local var_28_6 = 0.375

			if var_28_5 < arg_25_1.time_ and arg_25_1.time_ <= var_28_5 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_7 = arg_25_1:FormatText(StoryNameCfg[265].name)

				arg_25_1.leftNameTxt_.text = var_28_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_8 = arg_25_1:GetWordFromCfg(115032006)
				local var_28_9 = arg_25_1:FormatText(var_28_8.content)

				arg_25_1.text_.text = var_28_9

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_10 = 15
				local var_28_11 = utf8.len(var_28_9)
				local var_28_12 = var_28_10 <= 0 and var_28_6 or var_28_6 * (var_28_11 / var_28_10)

				if var_28_12 > 0 and var_28_6 < var_28_12 then
					arg_25_1.talkMaxDuration = var_28_12

					if var_28_12 + var_28_5 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_12 + var_28_5
					end
				end

				arg_25_1.text_.text = var_28_9
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115032", "115032006", "story_v_out_115032.awb") ~= 0 then
					local var_28_13 = manager.audio:GetVoiceLength("story_v_out_115032", "115032006", "story_v_out_115032.awb") / 1000

					if var_28_13 + var_28_5 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_13 + var_28_5
					end

					if var_28_8.prefab_name ~= "" and arg_25_1.actors_[var_28_8.prefab_name] ~= nil then
						local var_28_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_8.prefab_name].transform, "story_v_out_115032", "115032006", "story_v_out_115032.awb")

						arg_25_1:RecordAudio("115032006", var_28_14)
						arg_25_1:RecordAudio("115032006", var_28_14)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_115032", "115032006", "story_v_out_115032.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_115032", "115032006", "story_v_out_115032.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_15 = math.max(var_28_6, arg_25_1.talkMaxDuration)

			if var_28_5 <= arg_25_1.time_ and arg_25_1.time_ < var_28_5 + var_28_15 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_5) / var_28_15

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_5 + var_28_15 and arg_25_1.time_ < var_28_5 + var_28_15 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play115032007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 115032007
		arg_29_1.duration_ = 5

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play115032008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["10014ui_story"].transform
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 then
				arg_29_1.var_.moveOldPos10014ui_story = var_32_0.localPosition
			end

			local var_32_2 = 0.001

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_2 then
				local var_32_3 = (arg_29_1.time_ - var_32_1) / var_32_2
				local var_32_4 = Vector3.New(0, 100, 0)

				var_32_0.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos10014ui_story, var_32_4, var_32_3)

				local var_32_5 = manager.ui.mainCamera.transform.position - var_32_0.position

				var_32_0.forward = Vector3.New(var_32_5.x, var_32_5.y, var_32_5.z)

				local var_32_6 = var_32_0.localEulerAngles

				var_32_6.z = 0
				var_32_6.x = 0
				var_32_0.localEulerAngles = var_32_6
			end

			if arg_29_1.time_ >= var_32_1 + var_32_2 and arg_29_1.time_ < var_32_1 + var_32_2 + arg_32_0 then
				var_32_0.localPosition = Vector3.New(0, 100, 0)

				local var_32_7 = manager.ui.mainCamera.transform.position - var_32_0.position

				var_32_0.forward = Vector3.New(var_32_7.x, var_32_7.y, var_32_7.z)

				local var_32_8 = var_32_0.localEulerAngles

				var_32_8.z = 0
				var_32_8.x = 0
				var_32_0.localEulerAngles = var_32_8
			end

			local var_32_9 = arg_29_1.actors_["1024ui_story"].transform
			local var_32_10 = 0

			if var_32_10 < arg_29_1.time_ and arg_29_1.time_ <= var_32_10 + arg_32_0 then
				arg_29_1.var_.moveOldPos1024ui_story = var_32_9.localPosition
			end

			local var_32_11 = 0.001

			if var_32_10 <= arg_29_1.time_ and arg_29_1.time_ < var_32_10 + var_32_11 then
				local var_32_12 = (arg_29_1.time_ - var_32_10) / var_32_11
				local var_32_13 = Vector3.New(0, 100, 0)

				var_32_9.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos1024ui_story, var_32_13, var_32_12)

				local var_32_14 = manager.ui.mainCamera.transform.position - var_32_9.position

				var_32_9.forward = Vector3.New(var_32_14.x, var_32_14.y, var_32_14.z)

				local var_32_15 = var_32_9.localEulerAngles

				var_32_15.z = 0
				var_32_15.x = 0
				var_32_9.localEulerAngles = var_32_15
			end

			if arg_29_1.time_ >= var_32_10 + var_32_11 and arg_29_1.time_ < var_32_10 + var_32_11 + arg_32_0 then
				var_32_9.localPosition = Vector3.New(0, 100, 0)

				local var_32_16 = manager.ui.mainCamera.transform.position - var_32_9.position

				var_32_9.forward = Vector3.New(var_32_16.x, var_32_16.y, var_32_16.z)

				local var_32_17 = var_32_9.localEulerAngles

				var_32_17.z = 0
				var_32_17.x = 0
				var_32_9.localEulerAngles = var_32_17
			end

			local var_32_18 = 0
			local var_32_19 = 0.8

			if var_32_18 < arg_29_1.time_ and arg_29_1.time_ <= var_32_18 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, false)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_20 = arg_29_1:GetWordFromCfg(115032007)
				local var_32_21 = arg_29_1:FormatText(var_32_20.content)

				arg_29_1.text_.text = var_32_21

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_22 = 32
				local var_32_23 = utf8.len(var_32_21)
				local var_32_24 = var_32_22 <= 0 and var_32_19 or var_32_19 * (var_32_23 / var_32_22)

				if var_32_24 > 0 and var_32_19 < var_32_24 then
					arg_29_1.talkMaxDuration = var_32_24

					if var_32_24 + var_32_18 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_24 + var_32_18
					end
				end

				arg_29_1.text_.text = var_32_21
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)
				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_25 = math.max(var_32_19, arg_29_1.talkMaxDuration)

			if var_32_18 <= arg_29_1.time_ and arg_29_1.time_ < var_32_18 + var_32_25 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_18) / var_32_25

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_18 + var_32_25 and arg_29_1.time_ < var_32_18 + var_32_25 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play115032008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 115032008
		arg_33_1.duration_ = 5.7

		local var_33_0 = {
			ja = 4.066,
			ko = 4.333,
			zh = 5.3,
			en = 5.7
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
				arg_33_0:Play115032009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = 0

			if var_36_0 < arg_33_1.time_ and arg_33_1.time_ <= var_36_0 + arg_36_0 then
				arg_33_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 then
				arg_33_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action2_1")
			end

			local var_36_2 = arg_33_1.actors_["10014ui_story"].transform
			local var_36_3 = 0

			if var_36_3 < arg_33_1.time_ and arg_33_1.time_ <= var_36_3 + arg_36_0 then
				arg_33_1.var_.moveOldPos10014ui_story = var_36_2.localPosition
			end

			local var_36_4 = 0.001

			if var_36_3 <= arg_33_1.time_ and arg_33_1.time_ < var_36_3 + var_36_4 then
				local var_36_5 = (arg_33_1.time_ - var_36_3) / var_36_4
				local var_36_6 = Vector3.New(0, -1.06, -6.2)

				var_36_2.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos10014ui_story, var_36_6, var_36_5)

				local var_36_7 = manager.ui.mainCamera.transform.position - var_36_2.position

				var_36_2.forward = Vector3.New(var_36_7.x, var_36_7.y, var_36_7.z)

				local var_36_8 = var_36_2.localEulerAngles

				var_36_8.z = 0
				var_36_8.x = 0
				var_36_2.localEulerAngles = var_36_8
			end

			if arg_33_1.time_ >= var_36_3 + var_36_4 and arg_33_1.time_ < var_36_3 + var_36_4 + arg_36_0 then
				var_36_2.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_36_9 = manager.ui.mainCamera.transform.position - var_36_2.position

				var_36_2.forward = Vector3.New(var_36_9.x, var_36_9.y, var_36_9.z)

				local var_36_10 = var_36_2.localEulerAngles

				var_36_10.z = 0
				var_36_10.x = 0
				var_36_2.localEulerAngles = var_36_10
			end

			local var_36_11 = 0
			local var_36_12 = 0.425

			if var_36_11 < arg_33_1.time_ and arg_33_1.time_ <= var_36_11 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_13 = arg_33_1:FormatText(StoryNameCfg[264].name)

				arg_33_1.leftNameTxt_.text = var_36_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_14 = arg_33_1:GetWordFromCfg(115032008)
				local var_36_15 = arg_33_1:FormatText(var_36_14.content)

				arg_33_1.text_.text = var_36_15

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_16 = 17
				local var_36_17 = utf8.len(var_36_15)
				local var_36_18 = var_36_16 <= 0 and var_36_12 or var_36_12 * (var_36_17 / var_36_16)

				if var_36_18 > 0 and var_36_12 < var_36_18 then
					arg_33_1.talkMaxDuration = var_36_18

					if var_36_18 + var_36_11 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_18 + var_36_11
					end
				end

				arg_33_1.text_.text = var_36_15
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115032", "115032008", "story_v_out_115032.awb") ~= 0 then
					local var_36_19 = manager.audio:GetVoiceLength("story_v_out_115032", "115032008", "story_v_out_115032.awb") / 1000

					if var_36_19 + var_36_11 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_19 + var_36_11
					end

					if var_36_14.prefab_name ~= "" and arg_33_1.actors_[var_36_14.prefab_name] ~= nil then
						local var_36_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_14.prefab_name].transform, "story_v_out_115032", "115032008", "story_v_out_115032.awb")

						arg_33_1:RecordAudio("115032008", var_36_20)
						arg_33_1:RecordAudio("115032008", var_36_20)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_115032", "115032008", "story_v_out_115032.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_115032", "115032008", "story_v_out_115032.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_21 = math.max(var_36_12, arg_33_1.talkMaxDuration)

			if var_36_11 <= arg_33_1.time_ and arg_33_1.time_ < var_36_11 + var_36_21 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_11) / var_36_21

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_11 + var_36_21 and arg_33_1.time_ < var_36_11 + var_36_21 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play115032009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 115032009
		arg_37_1.duration_ = 2.8

		local var_37_0 = {
			ja = 0.999999999999,
			ko = 0.999999999999,
			zh = 2.8,
			en = 0.999999999999
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
				arg_37_0:Play115032010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = 0
			local var_40_1 = 0.05

			if var_40_0 < arg_37_1.time_ and arg_37_1.time_ <= var_40_0 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_2 = arg_37_1:FormatText(StoryNameCfg[265].name)

				arg_37_1.leftNameTxt_.text = var_40_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, true)
				arg_37_1.iconController_:SetSelectedState("hero")

				arg_37_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1024")

				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_3 = arg_37_1:GetWordFromCfg(115032009)
				local var_40_4 = arg_37_1:FormatText(var_40_3.content)

				arg_37_1.text_.text = var_40_4

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_5 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_115032", "115032009", "story_v_out_115032.awb") ~= 0 then
					local var_40_8 = manager.audio:GetVoiceLength("story_v_out_115032", "115032009", "story_v_out_115032.awb") / 1000

					if var_40_8 + var_40_0 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_8 + var_40_0
					end

					if var_40_3.prefab_name ~= "" and arg_37_1.actors_[var_40_3.prefab_name] ~= nil then
						local var_40_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_3.prefab_name].transform, "story_v_out_115032", "115032009", "story_v_out_115032.awb")

						arg_37_1:RecordAudio("115032009", var_40_9)
						arg_37_1:RecordAudio("115032009", var_40_9)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_115032", "115032009", "story_v_out_115032.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_115032", "115032009", "story_v_out_115032.awb")
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
	Play115032010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 115032010
		arg_41_1.duration_ = 3.733

		local var_41_0 = {
			ja = 3.566,
			ko = 3.166,
			zh = 3.733,
			en = 3.5
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
				arg_41_0:Play115032011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1024ui_story"]
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 and arg_41_1.var_.characterEffect1024ui_story == nil then
				arg_41_1.var_.characterEffect1024ui_story = var_44_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_2 = 0.2

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2

				if arg_41_1.var_.characterEffect1024ui_story then
					local var_44_4 = Mathf.Lerp(0, 0.5, var_44_3)

					arg_41_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_41_1.var_.characterEffect1024ui_story.fillRatio = var_44_4
				end
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 and arg_41_1.var_.characterEffect1024ui_story then
				local var_44_5 = 0.5

				arg_41_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_41_1.var_.characterEffect1024ui_story.fillRatio = var_44_5
			end

			local var_44_6 = 0

			if var_44_6 < arg_41_1.time_ and arg_41_1.time_ <= var_44_6 + arg_44_0 then
				arg_41_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_44_7 = 0
			local var_44_8 = 0.4

			if var_44_7 < arg_41_1.time_ and arg_41_1.time_ <= var_44_7 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_9 = arg_41_1:FormatText(StoryNameCfg[264].name)

				arg_41_1.leftNameTxt_.text = var_44_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_10 = arg_41_1:GetWordFromCfg(115032010)
				local var_44_11 = arg_41_1:FormatText(var_44_10.content)

				arg_41_1.text_.text = var_44_11

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_12 = 16
				local var_44_13 = utf8.len(var_44_11)
				local var_44_14 = var_44_12 <= 0 and var_44_8 or var_44_8 * (var_44_13 / var_44_12)

				if var_44_14 > 0 and var_44_8 < var_44_14 then
					arg_41_1.talkMaxDuration = var_44_14

					if var_44_14 + var_44_7 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_14 + var_44_7
					end
				end

				arg_41_1.text_.text = var_44_11
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115032", "115032010", "story_v_out_115032.awb") ~= 0 then
					local var_44_15 = manager.audio:GetVoiceLength("story_v_out_115032", "115032010", "story_v_out_115032.awb") / 1000

					if var_44_15 + var_44_7 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_15 + var_44_7
					end

					if var_44_10.prefab_name ~= "" and arg_41_1.actors_[var_44_10.prefab_name] ~= nil then
						local var_44_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_10.prefab_name].transform, "story_v_out_115032", "115032010", "story_v_out_115032.awb")

						arg_41_1:RecordAudio("115032010", var_44_16)
						arg_41_1:RecordAudio("115032010", var_44_16)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_115032", "115032010", "story_v_out_115032.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_115032", "115032010", "story_v_out_115032.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_17 = math.max(var_44_8, arg_41_1.talkMaxDuration)

			if var_44_7 <= arg_41_1.time_ and arg_41_1.time_ < var_44_7 + var_44_17 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_7) / var_44_17

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_7 + var_44_17 and arg_41_1.time_ < var_44_7 + var_44_17 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play115032011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 115032011
		arg_45_1.duration_ = 5

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
			arg_45_1.auto_ = false
		end

		function arg_45_1.playNext_(arg_47_0)
			arg_45_1.onStoryFinished_()
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["10014ui_story"].transform
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 then
				arg_45_1.var_.moveOldPos10014ui_story = var_48_0.localPosition
			end

			local var_48_2 = 0.001

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2
				local var_48_4 = Vector3.New(0, 100, 0)

				var_48_0.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos10014ui_story, var_48_4, var_48_3)

				local var_48_5 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_5.x, var_48_5.y, var_48_5.z)

				local var_48_6 = var_48_0.localEulerAngles

				var_48_6.z = 0
				var_48_6.x = 0
				var_48_0.localEulerAngles = var_48_6
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 then
				var_48_0.localPosition = Vector3.New(0, 100, 0)

				local var_48_7 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_7.x, var_48_7.y, var_48_7.z)

				local var_48_8 = var_48_0.localEulerAngles

				var_48_8.z = 0
				var_48_8.x = 0
				var_48_0.localEulerAngles = var_48_8
			end

			local var_48_9 = 0
			local var_48_10 = 0.575

			if var_48_9 < arg_45_1.time_ and arg_45_1.time_ <= var_48_9 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0

				arg_45_1.dialog_:SetActive(true)

				local var_48_11 = LeanTween.value(arg_45_1.dialog_, 0, 1, 0.3)

				var_48_11:setOnUpdate(LuaHelper.FloatAction(function(arg_49_0)
					arg_45_1.dialogCg_.alpha = arg_49_0
				end))
				var_48_11:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_45_1.dialog_)
					var_48_11:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_45_1.duration_ = arg_45_1.duration_ + 0.3

				SetActive(arg_45_1.leftNameGo_, false)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_12 = arg_45_1:GetWordFromCfg(115032011)
				local var_48_13 = arg_45_1:FormatText(var_48_12.content)

				arg_45_1.text_.text = var_48_13

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_14 = 23
				local var_48_15 = utf8.len(var_48_13)
				local var_48_16 = var_48_14 <= 0 and var_48_10 or var_48_10 * (var_48_15 / var_48_14)

				if var_48_16 > 0 and var_48_10 < var_48_16 then
					arg_45_1.talkMaxDuration = var_48_16
					var_48_9 = var_48_9 + 0.3

					if var_48_16 + var_48_9 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_16 + var_48_9
					end
				end

				arg_45_1.text_.text = var_48_13
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)
				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_17 = var_48_9 + 0.3
			local var_48_18 = math.max(var_48_10, arg_45_1.talkMaxDuration)

			if var_48_17 <= arg_45_1.time_ and arg_45_1.time_ < var_48_17 + var_48_18 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_17) / var_48_18

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_17 + var_48_18 and arg_45_1.time_ < var_48_17 + var_48_18 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/RO0104",
		"Assets/UIResources/UI_AB/TextureConfig/Background/G03a"
	},
	voices = {
		"story_v_out_115032.awb"
	}
}
