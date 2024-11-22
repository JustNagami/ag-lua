return {
	Play114291001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 114291001
		arg_1_1.duration_ = 9.7

		local var_1_0 = {
			ja = 9.7,
			ko = 5.5,
			zh = 6.9,
			en = 6.133
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
				arg_1_0:Play114291002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST26"

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
				local var_4_5 = arg_1_1.bgs_.ST26

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
					if iter_4_0 ~= "ST26" then
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

			local var_4_22 = "10016"

			if arg_1_1.actors_[var_4_22] == nil then
				local var_4_23 = Object.Instantiate(arg_1_1.imageGo_, arg_1_1.canvasGo_.transform)

				var_4_23.transform:SetSiblingIndex(1)

				var_4_23.name = var_4_22

				local var_4_24 = var_4_23:GetComponent(typeof(Image))

				var_4_24.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_4_22)

				var_4_24:SetNativeSize()

				var_4_23.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_22] = var_4_23
			end

			local var_4_25 = arg_1_1.actors_["10016"].transform
			local var_4_26 = 1.8

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				arg_1_1.var_.moveOldPos10016 = var_4_25.localPosition
				var_4_25.localScale = Vector3.New(1, 1, 1)

				arg_1_1:CheckSpriteTmpPos("10016", 2)
			end

			local var_4_27 = 0.001

			if var_4_26 <= arg_1_1.time_ and arg_1_1.time_ < var_4_26 + var_4_27 then
				local var_4_28 = (arg_1_1.time_ - var_4_26) / var_4_27
				local var_4_29 = Vector3.New(-390, -350, -180)

				var_4_25.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos10016, var_4_29, var_4_28)
			end

			if arg_1_1.time_ >= var_4_26 + var_4_27 and arg_1_1.time_ < var_4_26 + var_4_27 + arg_4_0 then
				var_4_25.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_4_30 = arg_1_1.actors_["10016"]
			local var_4_31 = 1.8

			if var_4_31 < arg_1_1.time_ and arg_1_1.time_ <= var_4_31 + arg_4_0 then
				local var_4_32 = var_4_30:GetComponent("Image")

				if var_4_32 then
					arg_1_1.var_.highlightMatValue10016 = var_4_32
				end
			end

			local var_4_33 = 0.034

			if var_4_31 <= arg_1_1.time_ and arg_1_1.time_ < var_4_31 + var_4_33 then
				local var_4_34 = (arg_1_1.time_ - var_4_31) / var_4_33

				if arg_1_1.var_.highlightMatValue10016 then
					local var_4_35 = Mathf.Lerp(0.5, 1, var_4_34)
					local var_4_36 = arg_1_1.var_.highlightMatValue10016
					local var_4_37 = var_4_36.color

					var_4_37.r = var_4_35
					var_4_37.g = var_4_35
					var_4_37.b = var_4_35
					var_4_36.color = var_4_37
				end
			end

			if arg_1_1.time_ >= var_4_31 + var_4_33 and arg_1_1.time_ < var_4_31 + var_4_33 + arg_4_0 and arg_1_1.var_.highlightMatValue10016 then
				local var_4_38 = 1

				var_4_30.transform:SetSiblingIndex(1)

				local var_4_39 = arg_1_1.var_.highlightMatValue10016
				local var_4_40 = var_4_39.color

				var_4_40.r = var_4_38
				var_4_40.g = var_4_38
				var_4_40.b = var_4_38
				var_4_39.color = var_4_40
			end

			local var_4_41 = arg_1_1.actors_["10016"]
			local var_4_42 = 1.8

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				local var_4_43 = var_4_41:GetComponent("Image")

				if var_4_43 then
					arg_1_1.var_.alphaMatValue10016 = var_4_43
					arg_1_1.var_.alphaOldValue10016 = var_4_43.color.a
				end

				arg_1_1.var_.alphaOldValue10016 = 0
			end

			local var_4_44 = 0.5

			if var_4_42 <= arg_1_1.time_ and arg_1_1.time_ < var_4_42 + var_4_44 then
				local var_4_45 = (arg_1_1.time_ - var_4_42) / var_4_44
				local var_4_46 = Mathf.Lerp(arg_1_1.var_.alphaOldValue10016, 1, var_4_45)

				if arg_1_1.var_.alphaMatValue10016 then
					local var_4_47 = arg_1_1.var_.alphaMatValue10016.color

					var_4_47.a = var_4_46
					arg_1_1.var_.alphaMatValue10016.color = var_4_47
				end
			end

			if arg_1_1.time_ >= var_4_42 + var_4_44 and arg_1_1.time_ < var_4_42 + var_4_44 + arg_4_0 and arg_1_1.var_.alphaMatValue10016 then
				local var_4_48 = arg_1_1.var_.alphaMatValue10016
				local var_4_49 = var_4_48.color

				var_4_49.a = 1
				var_4_48.color = var_4_49
			end

			local var_4_50 = 0
			local var_4_51 = 1

			if var_4_50 < arg_1_1.time_ and arg_1_1.time_ <= var_4_50 + arg_4_0 then
				local var_4_52 = "play"
				local var_4_53 = "music"

				arg_1_1:AudioAction(var_4_52, var_4_53, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_54 = 2
			local var_4_55 = 0.733333333333333

			if var_4_54 < arg_1_1.time_ and arg_1_1.time_ <= var_4_54 + arg_4_0 then
				local var_4_56 = "play"
				local var_4_57 = "music"

				arg_1_1:AudioAction(var_4_56, var_4_57, "bgm_story_v1_qiaolin", "bgm_story_v1_qiaolin", "bgm_story_v1_qiaolin.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_58 = 2
			local var_4_59 = 0.475

			if var_4_58 < arg_1_1.time_ and arg_1_1.time_ <= var_4_58 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_60 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_60:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_60:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_60:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_61 = arg_1_1:FormatText(StoryNameCfg[226].name)

				arg_1_1.leftNameTxt_.text = var_4_61

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_62 = arg_1_1:GetWordFromCfg(114291001)
				local var_4_63 = arg_1_1:FormatText(var_4_62.content)

				arg_1_1.text_.text = var_4_63

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_64 = 19
				local var_4_65 = utf8.len(var_4_63)
				local var_4_66 = var_4_64 <= 0 and var_4_59 or var_4_59 * (var_4_65 / var_4_64)

				if var_4_66 > 0 and var_4_59 < var_4_66 then
					arg_1_1.talkMaxDuration = var_4_66
					var_4_58 = var_4_58 + 0.3

					if var_4_66 + var_4_58 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_66 + var_4_58
					end
				end

				arg_1_1.text_.text = var_4_63
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291001", "story_v_out_114291.awb") ~= 0 then
					local var_4_67 = manager.audio:GetVoiceLength("story_v_out_114291", "114291001", "story_v_out_114291.awb") / 1000

					if var_4_67 + var_4_58 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_67 + var_4_58
					end

					if var_4_62.prefab_name ~= "" and arg_1_1.actors_[var_4_62.prefab_name] ~= nil then
						local var_4_68 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_62.prefab_name].transform, "story_v_out_114291", "114291001", "story_v_out_114291.awb")

						arg_1_1:RecordAudio("114291001", var_4_68)
						arg_1_1:RecordAudio("114291001", var_4_68)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_114291", "114291001", "story_v_out_114291.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_114291", "114291001", "story_v_out_114291.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_69 = var_4_58 + 0.3
			local var_4_70 = math.max(var_4_59, arg_1_1.talkMaxDuration)

			if var_4_69 <= arg_1_1.time_ and arg_1_1.time_ < var_4_69 + var_4_70 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_69) / var_4_70

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_69 + var_4_70 and arg_1_1.time_ < var_4_69 + var_4_70 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play114291002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 114291002
		arg_7_1.duration_ = 9.133

		local var_7_0 = {
			ja = 9.133,
			ko = 8.8,
			zh = 6.166,
			en = 5.233
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
				arg_7_0:Play114291003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "10020"

			if arg_7_1.actors_[var_10_0] == nil then
				local var_10_1 = Object.Instantiate(arg_7_1.imageGo_, arg_7_1.canvasGo_.transform)

				var_10_1.transform:SetSiblingIndex(1)

				var_10_1.name = var_10_0

				local var_10_2 = var_10_1:GetComponent(typeof(Image))

				var_10_2.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_10_0)

				var_10_2:SetNativeSize()

				var_10_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_7_1.actors_[var_10_0] = var_10_1
			end

			local var_10_3 = arg_7_1.actors_["10020"].transform
			local var_10_4 = 0

			if var_10_4 < arg_7_1.time_ and arg_7_1.time_ <= var_10_4 + arg_10_0 then
				arg_7_1.var_.moveOldPos10020 = var_10_3.localPosition
				var_10_3.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("10020", 4)
			end

			local var_10_5 = 0.001

			if var_10_4 <= arg_7_1.time_ and arg_7_1.time_ < var_10_4 + var_10_5 then
				local var_10_6 = (arg_7_1.time_ - var_10_4) / var_10_5
				local var_10_7 = Vector3.New(390, -350, -180)

				var_10_3.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10020, var_10_7, var_10_6)
			end

			if arg_7_1.time_ >= var_10_4 + var_10_5 and arg_7_1.time_ < var_10_4 + var_10_5 + arg_10_0 then
				var_10_3.localPosition = Vector3.New(390, -350, -180)
			end

			local var_10_8 = arg_7_1.actors_["10016"]
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 then
				local var_10_10 = var_10_8:GetComponent("Image")

				if var_10_10 then
					arg_7_1.var_.highlightMatValue10016 = var_10_10
				end
			end

			local var_10_11 = 0.034

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_11 then
				local var_10_12 = (arg_7_1.time_ - var_10_9) / var_10_11

				if arg_7_1.var_.highlightMatValue10016 then
					local var_10_13 = Mathf.Lerp(1, 0.5, var_10_12)
					local var_10_14 = arg_7_1.var_.highlightMatValue10016
					local var_10_15 = var_10_14.color

					var_10_15.r = var_10_13
					var_10_15.g = var_10_13
					var_10_15.b = var_10_13
					var_10_14.color = var_10_15
				end
			end

			if arg_7_1.time_ >= var_10_9 + var_10_11 and arg_7_1.time_ < var_10_9 + var_10_11 + arg_10_0 and arg_7_1.var_.highlightMatValue10016 then
				local var_10_16 = 0.5
				local var_10_17 = arg_7_1.var_.highlightMatValue10016
				local var_10_18 = var_10_17.color

				var_10_18.r = var_10_16
				var_10_18.g = var_10_16
				var_10_18.b = var_10_16
				var_10_17.color = var_10_18
			end

			local var_10_19 = arg_7_1.actors_["10020"]
			local var_10_20 = 0

			if var_10_20 < arg_7_1.time_ and arg_7_1.time_ <= var_10_20 + arg_10_0 then
				local var_10_21 = var_10_19:GetComponent("Image")

				if var_10_21 then
					arg_7_1.var_.highlightMatValue10020 = var_10_21
				end
			end

			local var_10_22 = 0.034

			if var_10_20 <= arg_7_1.time_ and arg_7_1.time_ < var_10_20 + var_10_22 then
				local var_10_23 = (arg_7_1.time_ - var_10_20) / var_10_22

				if arg_7_1.var_.highlightMatValue10020 then
					local var_10_24 = Mathf.Lerp(0.5, 1, var_10_23)
					local var_10_25 = arg_7_1.var_.highlightMatValue10020
					local var_10_26 = var_10_25.color

					var_10_26.r = var_10_24
					var_10_26.g = var_10_24
					var_10_26.b = var_10_24
					var_10_25.color = var_10_26
				end
			end

			if arg_7_1.time_ >= var_10_20 + var_10_22 and arg_7_1.time_ < var_10_20 + var_10_22 + arg_10_0 and arg_7_1.var_.highlightMatValue10020 then
				local var_10_27 = 1

				var_10_19.transform:SetSiblingIndex(1)

				local var_10_28 = arg_7_1.var_.highlightMatValue10020
				local var_10_29 = var_10_28.color

				var_10_29.r = var_10_27
				var_10_29.g = var_10_27
				var_10_29.b = var_10_27
				var_10_28.color = var_10_29
			end

			local var_10_30 = arg_7_1.actors_["10020"]
			local var_10_31 = 0

			if var_10_31 < arg_7_1.time_ and arg_7_1.time_ <= var_10_31 + arg_10_0 then
				local var_10_32 = var_10_30:GetComponent("Image")

				if var_10_32 then
					arg_7_1.var_.alphaMatValue10020 = var_10_32
					arg_7_1.var_.alphaOldValue10020 = var_10_32.color.a
				end

				arg_7_1.var_.alphaOldValue10020 = 0
			end

			local var_10_33 = 0.5

			if var_10_31 <= arg_7_1.time_ and arg_7_1.time_ < var_10_31 + var_10_33 then
				local var_10_34 = (arg_7_1.time_ - var_10_31) / var_10_33
				local var_10_35 = Mathf.Lerp(arg_7_1.var_.alphaOldValue10020, 1, var_10_34)

				if arg_7_1.var_.alphaMatValue10020 then
					local var_10_36 = arg_7_1.var_.alphaMatValue10020.color

					var_10_36.a = var_10_35
					arg_7_1.var_.alphaMatValue10020.color = var_10_36
				end
			end

			if arg_7_1.time_ >= var_10_31 + var_10_33 and arg_7_1.time_ < var_10_31 + var_10_33 + arg_10_0 and arg_7_1.var_.alphaMatValue10020 then
				local var_10_37 = arg_7_1.var_.alphaMatValue10020
				local var_10_38 = var_10_37.color

				var_10_38.a = 1
				var_10_37.color = var_10_38
			end

			local var_10_39 = 0
			local var_10_40 = 0.675

			if var_10_39 < arg_7_1.time_ and arg_7_1.time_ <= var_10_39 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_41 = arg_7_1:FormatText(StoryNameCfg[36].name)

				arg_7_1.leftNameTxt_.text = var_10_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_42 = arg_7_1:GetWordFromCfg(114291002)
				local var_10_43 = arg_7_1:FormatText(var_10_42.content)

				arg_7_1.text_.text = var_10_43

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_44 = 27
				local var_10_45 = utf8.len(var_10_43)
				local var_10_46 = var_10_44 <= 0 and var_10_40 or var_10_40 * (var_10_45 / var_10_44)

				if var_10_46 > 0 and var_10_40 < var_10_46 then
					arg_7_1.talkMaxDuration = var_10_46

					if var_10_46 + var_10_39 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_46 + var_10_39
					end
				end

				arg_7_1.text_.text = var_10_43
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291002", "story_v_out_114291.awb") ~= 0 then
					local var_10_47 = manager.audio:GetVoiceLength("story_v_out_114291", "114291002", "story_v_out_114291.awb") / 1000

					if var_10_47 + var_10_39 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_47 + var_10_39
					end

					if var_10_42.prefab_name ~= "" and arg_7_1.actors_[var_10_42.prefab_name] ~= nil then
						local var_10_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_42.prefab_name].transform, "story_v_out_114291", "114291002", "story_v_out_114291.awb")

						arg_7_1:RecordAudio("114291002", var_10_48)
						arg_7_1:RecordAudio("114291002", var_10_48)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_114291", "114291002", "story_v_out_114291.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_114291", "114291002", "story_v_out_114291.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_49 = math.max(var_10_40, arg_7_1.talkMaxDuration)

			if var_10_39 <= arg_7_1.time_ and arg_7_1.time_ < var_10_39 + var_10_49 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_39) / var_10_49

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_39 + var_10_49 and arg_7_1.time_ < var_10_39 + var_10_49 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play114291003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 114291003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play114291004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["10020"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				local var_14_2 = var_14_0:GetComponent("Image")

				if var_14_2 then
					arg_11_1.var_.highlightMatValue10020 = var_14_2
				end
			end

			local var_14_3 = 0.034

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_3 then
				local var_14_4 = (arg_11_1.time_ - var_14_1) / var_14_3

				if arg_11_1.var_.highlightMatValue10020 then
					local var_14_5 = Mathf.Lerp(1, 0.5, var_14_4)
					local var_14_6 = arg_11_1.var_.highlightMatValue10020
					local var_14_7 = var_14_6.color

					var_14_7.r = var_14_5
					var_14_7.g = var_14_5
					var_14_7.b = var_14_5
					var_14_6.color = var_14_7
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_3 and arg_11_1.time_ < var_14_1 + var_14_3 + arg_14_0 and arg_11_1.var_.highlightMatValue10020 then
				local var_14_8 = 0.5
				local var_14_9 = arg_11_1.var_.highlightMatValue10020
				local var_14_10 = var_14_9.color

				var_14_10.r = var_14_8
				var_14_10.g = var_14_8
				var_14_10.b = var_14_8
				var_14_9.color = var_14_10
			end

			local var_14_11 = 0
			local var_14_12 = 1.2

			if var_14_11 < arg_11_1.time_ and arg_11_1.time_ <= var_14_11 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_13 = arg_11_1:GetWordFromCfg(114291003)
				local var_14_14 = arg_11_1:FormatText(var_14_13.content)

				arg_11_1.text_.text = var_14_14

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_15 = 48
				local var_14_16 = utf8.len(var_14_14)
				local var_14_17 = var_14_15 <= 0 and var_14_12 or var_14_12 * (var_14_16 / var_14_15)

				if var_14_17 > 0 and var_14_12 < var_14_17 then
					arg_11_1.talkMaxDuration = var_14_17

					if var_14_17 + var_14_11 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_17 + var_14_11
					end
				end

				arg_11_1.text_.text = var_14_14
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_18 = math.max(var_14_12, arg_11_1.talkMaxDuration)

			if var_14_11 <= arg_11_1.time_ and arg_11_1.time_ < var_14_11 + var_14_18 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_11) / var_14_18

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_11 + var_14_18 and arg_11_1.time_ < var_14_11 + var_14_18 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play114291004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 114291004
		arg_15_1.duration_ = 16.266

		local var_15_0 = {
			ja = 16.266,
			ko = 10.7,
			zh = 13.933,
			en = 13.666
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
				arg_15_0:Play114291005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["10016"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				local var_18_2 = var_18_0:GetComponent("Image")

				if var_18_2 then
					arg_15_1.var_.highlightMatValue10016 = var_18_2
				end
			end

			local var_18_3 = 0.034

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_3 then
				local var_18_4 = (arg_15_1.time_ - var_18_1) / var_18_3

				if arg_15_1.var_.highlightMatValue10016 then
					local var_18_5 = Mathf.Lerp(0.5, 1, var_18_4)
					local var_18_6 = arg_15_1.var_.highlightMatValue10016
					local var_18_7 = var_18_6.color

					var_18_7.r = var_18_5
					var_18_7.g = var_18_5
					var_18_7.b = var_18_5
					var_18_6.color = var_18_7
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_3 and arg_15_1.time_ < var_18_1 + var_18_3 + arg_18_0 and arg_15_1.var_.highlightMatValue10016 then
				local var_18_8 = 1

				var_18_0.transform:SetSiblingIndex(1)

				local var_18_9 = arg_15_1.var_.highlightMatValue10016
				local var_18_10 = var_18_9.color

				var_18_10.r = var_18_8
				var_18_10.g = var_18_8
				var_18_10.b = var_18_8
				var_18_9.color = var_18_10
			end

			local var_18_11 = 0
			local var_18_12 = 1.275

			if var_18_11 < arg_15_1.time_ and arg_15_1.time_ <= var_18_11 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_13 = arg_15_1:FormatText(StoryNameCfg[226].name)

				arg_15_1.leftNameTxt_.text = var_18_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_14 = arg_15_1:GetWordFromCfg(114291004)
				local var_18_15 = arg_15_1:FormatText(var_18_14.content)

				arg_15_1.text_.text = var_18_15

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_16 = 51
				local var_18_17 = utf8.len(var_18_15)
				local var_18_18 = var_18_16 <= 0 and var_18_12 or var_18_12 * (var_18_17 / var_18_16)

				if var_18_18 > 0 and var_18_12 < var_18_18 then
					arg_15_1.talkMaxDuration = var_18_18

					if var_18_18 + var_18_11 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_18 + var_18_11
					end
				end

				arg_15_1.text_.text = var_18_15
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291004", "story_v_out_114291.awb") ~= 0 then
					local var_18_19 = manager.audio:GetVoiceLength("story_v_out_114291", "114291004", "story_v_out_114291.awb") / 1000

					if var_18_19 + var_18_11 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_19 + var_18_11
					end

					if var_18_14.prefab_name ~= "" and arg_15_1.actors_[var_18_14.prefab_name] ~= nil then
						local var_18_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_14.prefab_name].transform, "story_v_out_114291", "114291004", "story_v_out_114291.awb")

						arg_15_1:RecordAudio("114291004", var_18_20)
						arg_15_1:RecordAudio("114291004", var_18_20)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_114291", "114291004", "story_v_out_114291.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_114291", "114291004", "story_v_out_114291.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_21 = math.max(var_18_12, arg_15_1.talkMaxDuration)

			if var_18_11 <= arg_15_1.time_ and arg_15_1.time_ < var_18_11 + var_18_21 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_11) / var_18_21

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_11 + var_18_21 and arg_15_1.time_ < var_18_11 + var_18_21 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play114291005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 114291005
		arg_19_1.duration_ = 10.933

		local var_19_0 = {
			ja = 10.933,
			ko = 10.266,
			zh = 8.833,
			en = 10.9
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
				arg_19_0:Play114291006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10016"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				local var_22_2 = var_22_0:GetComponent("Image")

				if var_22_2 then
					arg_19_1.var_.highlightMatValue10016 = var_22_2
				end
			end

			local var_22_3 = 0.034

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_3 then
				local var_22_4 = (arg_19_1.time_ - var_22_1) / var_22_3

				if arg_19_1.var_.highlightMatValue10016 then
					local var_22_5 = Mathf.Lerp(1, 0.5, var_22_4)
					local var_22_6 = arg_19_1.var_.highlightMatValue10016
					local var_22_7 = var_22_6.color

					var_22_7.r = var_22_5
					var_22_7.g = var_22_5
					var_22_7.b = var_22_5
					var_22_6.color = var_22_7
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_3 and arg_19_1.time_ < var_22_1 + var_22_3 + arg_22_0 and arg_19_1.var_.highlightMatValue10016 then
				local var_22_8 = 0.5
				local var_22_9 = arg_19_1.var_.highlightMatValue10016
				local var_22_10 = var_22_9.color

				var_22_10.r = var_22_8
				var_22_10.g = var_22_8
				var_22_10.b = var_22_8
				var_22_9.color = var_22_10
			end

			local var_22_11 = arg_19_1.actors_["10020"]
			local var_22_12 = 0

			if var_22_12 < arg_19_1.time_ and arg_19_1.time_ <= var_22_12 + arg_22_0 then
				local var_22_13 = var_22_11:GetComponent("Image")

				if var_22_13 then
					arg_19_1.var_.highlightMatValue10020 = var_22_13
				end
			end

			local var_22_14 = 0.034

			if var_22_12 <= arg_19_1.time_ and arg_19_1.time_ < var_22_12 + var_22_14 then
				local var_22_15 = (arg_19_1.time_ - var_22_12) / var_22_14

				if arg_19_1.var_.highlightMatValue10020 then
					local var_22_16 = Mathf.Lerp(0.5, 1, var_22_15)
					local var_22_17 = arg_19_1.var_.highlightMatValue10020
					local var_22_18 = var_22_17.color

					var_22_18.r = var_22_16
					var_22_18.g = var_22_16
					var_22_18.b = var_22_16
					var_22_17.color = var_22_18
				end
			end

			if arg_19_1.time_ >= var_22_12 + var_22_14 and arg_19_1.time_ < var_22_12 + var_22_14 + arg_22_0 and arg_19_1.var_.highlightMatValue10020 then
				local var_22_19 = 1

				var_22_11.transform:SetSiblingIndex(1)

				local var_22_20 = arg_19_1.var_.highlightMatValue10020
				local var_22_21 = var_22_20.color

				var_22_21.r = var_22_19
				var_22_21.g = var_22_19
				var_22_21.b = var_22_19
				var_22_20.color = var_22_21
			end

			local var_22_22 = 0
			local var_22_23 = 0.7

			if var_22_22 < arg_19_1.time_ and arg_19_1.time_ <= var_22_22 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_24 = arg_19_1:FormatText(StoryNameCfg[36].name)

				arg_19_1.leftNameTxt_.text = var_22_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_25 = arg_19_1:GetWordFromCfg(114291005)
				local var_22_26 = arg_19_1:FormatText(var_22_25.content)

				arg_19_1.text_.text = var_22_26

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_27 = 28
				local var_22_28 = utf8.len(var_22_26)
				local var_22_29 = var_22_27 <= 0 and var_22_23 or var_22_23 * (var_22_28 / var_22_27)

				if var_22_29 > 0 and var_22_23 < var_22_29 then
					arg_19_1.talkMaxDuration = var_22_29

					if var_22_29 + var_22_22 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_29 + var_22_22
					end
				end

				arg_19_1.text_.text = var_22_26
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291005", "story_v_out_114291.awb") ~= 0 then
					local var_22_30 = manager.audio:GetVoiceLength("story_v_out_114291", "114291005", "story_v_out_114291.awb") / 1000

					if var_22_30 + var_22_22 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_30 + var_22_22
					end

					if var_22_25.prefab_name ~= "" and arg_19_1.actors_[var_22_25.prefab_name] ~= nil then
						local var_22_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_25.prefab_name].transform, "story_v_out_114291", "114291005", "story_v_out_114291.awb")

						arg_19_1:RecordAudio("114291005", var_22_31)
						arg_19_1:RecordAudio("114291005", var_22_31)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_114291", "114291005", "story_v_out_114291.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_114291", "114291005", "story_v_out_114291.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_32 = math.max(var_22_23, arg_19_1.talkMaxDuration)

			if var_22_22 <= arg_19_1.time_ and arg_19_1.time_ < var_22_22 + var_22_32 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_22) / var_22_32

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_22 + var_22_32 and arg_19_1.time_ < var_22_22 + var_22_32 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play114291006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 114291006
		arg_23_1.duration_ = 12.7

		local var_23_0 = {
			ja = 12.7,
			ko = 9.433,
			zh = 10.766,
			en = 8.166
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
				arg_23_0:Play114291007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["10016"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				local var_26_2 = var_26_0:GetComponent("Image")

				if var_26_2 then
					arg_23_1.var_.highlightMatValue10016 = var_26_2
				end
			end

			local var_26_3 = 0.034

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_3 then
				local var_26_4 = (arg_23_1.time_ - var_26_1) / var_26_3

				if arg_23_1.var_.highlightMatValue10016 then
					local var_26_5 = Mathf.Lerp(0.5, 1, var_26_4)
					local var_26_6 = arg_23_1.var_.highlightMatValue10016
					local var_26_7 = var_26_6.color

					var_26_7.r = var_26_5
					var_26_7.g = var_26_5
					var_26_7.b = var_26_5
					var_26_6.color = var_26_7
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_3 and arg_23_1.time_ < var_26_1 + var_26_3 + arg_26_0 and arg_23_1.var_.highlightMatValue10016 then
				local var_26_8 = 1

				var_26_0.transform:SetSiblingIndex(1)

				local var_26_9 = arg_23_1.var_.highlightMatValue10016
				local var_26_10 = var_26_9.color

				var_26_10.r = var_26_8
				var_26_10.g = var_26_8
				var_26_10.b = var_26_8
				var_26_9.color = var_26_10
			end

			local var_26_11 = arg_23_1.actors_["10020"]
			local var_26_12 = 0

			if var_26_12 < arg_23_1.time_ and arg_23_1.time_ <= var_26_12 + arg_26_0 then
				local var_26_13 = var_26_11:GetComponent("Image")

				if var_26_13 then
					arg_23_1.var_.highlightMatValue10020 = var_26_13
				end
			end

			local var_26_14 = 0.034

			if var_26_12 <= arg_23_1.time_ and arg_23_1.time_ < var_26_12 + var_26_14 then
				local var_26_15 = (arg_23_1.time_ - var_26_12) / var_26_14

				if arg_23_1.var_.highlightMatValue10020 then
					local var_26_16 = Mathf.Lerp(1, 0.5, var_26_15)
					local var_26_17 = arg_23_1.var_.highlightMatValue10020
					local var_26_18 = var_26_17.color

					var_26_18.r = var_26_16
					var_26_18.g = var_26_16
					var_26_18.b = var_26_16
					var_26_17.color = var_26_18
				end
			end

			if arg_23_1.time_ >= var_26_12 + var_26_14 and arg_23_1.time_ < var_26_12 + var_26_14 + arg_26_0 and arg_23_1.var_.highlightMatValue10020 then
				local var_26_19 = 0.5
				local var_26_20 = arg_23_1.var_.highlightMatValue10020
				local var_26_21 = var_26_20.color

				var_26_21.r = var_26_19
				var_26_21.g = var_26_19
				var_26_21.b = var_26_19
				var_26_20.color = var_26_21
			end

			local var_26_22 = 0
			local var_26_23 = 0.95

			if var_26_22 < arg_23_1.time_ and arg_23_1.time_ <= var_26_22 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_24 = arg_23_1:FormatText(StoryNameCfg[226].name)

				arg_23_1.leftNameTxt_.text = var_26_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_25 = arg_23_1:GetWordFromCfg(114291006)
				local var_26_26 = arg_23_1:FormatText(var_26_25.content)

				arg_23_1.text_.text = var_26_26

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_27 = 38
				local var_26_28 = utf8.len(var_26_26)
				local var_26_29 = var_26_27 <= 0 and var_26_23 or var_26_23 * (var_26_28 / var_26_27)

				if var_26_29 > 0 and var_26_23 < var_26_29 then
					arg_23_1.talkMaxDuration = var_26_29

					if var_26_29 + var_26_22 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_29 + var_26_22
					end
				end

				arg_23_1.text_.text = var_26_26
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291006", "story_v_out_114291.awb") ~= 0 then
					local var_26_30 = manager.audio:GetVoiceLength("story_v_out_114291", "114291006", "story_v_out_114291.awb") / 1000

					if var_26_30 + var_26_22 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_30 + var_26_22
					end

					if var_26_25.prefab_name ~= "" and arg_23_1.actors_[var_26_25.prefab_name] ~= nil then
						local var_26_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_25.prefab_name].transform, "story_v_out_114291", "114291006", "story_v_out_114291.awb")

						arg_23_1:RecordAudio("114291006", var_26_31)
						arg_23_1:RecordAudio("114291006", var_26_31)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_114291", "114291006", "story_v_out_114291.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_114291", "114291006", "story_v_out_114291.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_32 = math.max(var_26_23, arg_23_1.talkMaxDuration)

			if var_26_22 <= arg_23_1.time_ and arg_23_1.time_ < var_26_22 + var_26_32 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_22) / var_26_32

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_22 + var_26_32 and arg_23_1.time_ < var_26_22 + var_26_32 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play114291007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 114291007
		arg_27_1.duration_ = 5.9

		local var_27_0 = {
			ja = 5.9,
			ko = 4.333,
			zh = 3.366,
			en = 2.9
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
				arg_27_0:Play114291008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10016"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				local var_30_2 = var_30_0:GetComponent("Image")

				if var_30_2 then
					arg_27_1.var_.highlightMatValue10016 = var_30_2
				end
			end

			local var_30_3 = 0.034

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_3 then
				local var_30_4 = (arg_27_1.time_ - var_30_1) / var_30_3

				if arg_27_1.var_.highlightMatValue10016 then
					local var_30_5 = Mathf.Lerp(1, 0.5, var_30_4)
					local var_30_6 = arg_27_1.var_.highlightMatValue10016
					local var_30_7 = var_30_6.color

					var_30_7.r = var_30_5
					var_30_7.g = var_30_5
					var_30_7.b = var_30_5
					var_30_6.color = var_30_7
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_3 and arg_27_1.time_ < var_30_1 + var_30_3 + arg_30_0 and arg_27_1.var_.highlightMatValue10016 then
				local var_30_8 = 0.5
				local var_30_9 = arg_27_1.var_.highlightMatValue10016
				local var_30_10 = var_30_9.color

				var_30_10.r = var_30_8
				var_30_10.g = var_30_8
				var_30_10.b = var_30_8
				var_30_9.color = var_30_10
			end

			local var_30_11 = arg_27_1.actors_["10020"]
			local var_30_12 = 0

			if var_30_12 < arg_27_1.time_ and arg_27_1.time_ <= var_30_12 + arg_30_0 then
				local var_30_13 = var_30_11:GetComponent("Image")

				if var_30_13 then
					arg_27_1.var_.highlightMatValue10020 = var_30_13
				end
			end

			local var_30_14 = 0.034

			if var_30_12 <= arg_27_1.time_ and arg_27_1.time_ < var_30_12 + var_30_14 then
				local var_30_15 = (arg_27_1.time_ - var_30_12) / var_30_14

				if arg_27_1.var_.highlightMatValue10020 then
					local var_30_16 = Mathf.Lerp(0.5, 1, var_30_15)
					local var_30_17 = arg_27_1.var_.highlightMatValue10020
					local var_30_18 = var_30_17.color

					var_30_18.r = var_30_16
					var_30_18.g = var_30_16
					var_30_18.b = var_30_16
					var_30_17.color = var_30_18
				end
			end

			if arg_27_1.time_ >= var_30_12 + var_30_14 and arg_27_1.time_ < var_30_12 + var_30_14 + arg_30_0 and arg_27_1.var_.highlightMatValue10020 then
				local var_30_19 = 1

				var_30_11.transform:SetSiblingIndex(1)

				local var_30_20 = arg_27_1.var_.highlightMatValue10020
				local var_30_21 = var_30_20.color

				var_30_21.r = var_30_19
				var_30_21.g = var_30_19
				var_30_21.b = var_30_19
				var_30_20.color = var_30_21
			end

			local var_30_22 = 0
			local var_30_23 = 0.35

			if var_30_22 < arg_27_1.time_ and arg_27_1.time_ <= var_30_22 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_24 = arg_27_1:FormatText(StoryNameCfg[36].name)

				arg_27_1.leftNameTxt_.text = var_30_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_25 = arg_27_1:GetWordFromCfg(114291007)
				local var_30_26 = arg_27_1:FormatText(var_30_25.content)

				arg_27_1.text_.text = var_30_26

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_27 = 14
				local var_30_28 = utf8.len(var_30_26)
				local var_30_29 = var_30_27 <= 0 and var_30_23 or var_30_23 * (var_30_28 / var_30_27)

				if var_30_29 > 0 and var_30_23 < var_30_29 then
					arg_27_1.talkMaxDuration = var_30_29

					if var_30_29 + var_30_22 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_29 + var_30_22
					end
				end

				arg_27_1.text_.text = var_30_26
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291007", "story_v_out_114291.awb") ~= 0 then
					local var_30_30 = manager.audio:GetVoiceLength("story_v_out_114291", "114291007", "story_v_out_114291.awb") / 1000

					if var_30_30 + var_30_22 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_30 + var_30_22
					end

					if var_30_25.prefab_name ~= "" and arg_27_1.actors_[var_30_25.prefab_name] ~= nil then
						local var_30_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_25.prefab_name].transform, "story_v_out_114291", "114291007", "story_v_out_114291.awb")

						arg_27_1:RecordAudio("114291007", var_30_31)
						arg_27_1:RecordAudio("114291007", var_30_31)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_114291", "114291007", "story_v_out_114291.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_114291", "114291007", "story_v_out_114291.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_32 = math.max(var_30_23, arg_27_1.talkMaxDuration)

			if var_30_22 <= arg_27_1.time_ and arg_27_1.time_ < var_30_22 + var_30_32 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_22) / var_30_32

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_22 + var_30_32 and arg_27_1.time_ < var_30_22 + var_30_32 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play114291008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 114291008
		arg_31_1.duration_ = 17.6

		local var_31_0 = {
			ja = 13.233,
			ko = 15.9,
			zh = 16.033,
			en = 17.6
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
				arg_31_0:Play114291009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10016"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				local var_34_2 = var_34_0:GetComponent("Image")

				if var_34_2 then
					arg_31_1.var_.highlightMatValue10016 = var_34_2
				end
			end

			local var_34_3 = 0.034

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_3 then
				local var_34_4 = (arg_31_1.time_ - var_34_1) / var_34_3

				if arg_31_1.var_.highlightMatValue10016 then
					local var_34_5 = Mathf.Lerp(0.5, 1, var_34_4)
					local var_34_6 = arg_31_1.var_.highlightMatValue10016
					local var_34_7 = var_34_6.color

					var_34_7.r = var_34_5
					var_34_7.g = var_34_5
					var_34_7.b = var_34_5
					var_34_6.color = var_34_7
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_3 and arg_31_1.time_ < var_34_1 + var_34_3 + arg_34_0 and arg_31_1.var_.highlightMatValue10016 then
				local var_34_8 = 1

				var_34_0.transform:SetSiblingIndex(1)

				local var_34_9 = arg_31_1.var_.highlightMatValue10016
				local var_34_10 = var_34_9.color

				var_34_10.r = var_34_8
				var_34_10.g = var_34_8
				var_34_10.b = var_34_8
				var_34_9.color = var_34_10
			end

			local var_34_11 = arg_31_1.actors_["10020"]
			local var_34_12 = 0

			if var_34_12 < arg_31_1.time_ and arg_31_1.time_ <= var_34_12 + arg_34_0 then
				local var_34_13 = var_34_11:GetComponent("Image")

				if var_34_13 then
					arg_31_1.var_.highlightMatValue10020 = var_34_13
				end
			end

			local var_34_14 = 0.034

			if var_34_12 <= arg_31_1.time_ and arg_31_1.time_ < var_34_12 + var_34_14 then
				local var_34_15 = (arg_31_1.time_ - var_34_12) / var_34_14

				if arg_31_1.var_.highlightMatValue10020 then
					local var_34_16 = Mathf.Lerp(1, 0.5, var_34_15)
					local var_34_17 = arg_31_1.var_.highlightMatValue10020
					local var_34_18 = var_34_17.color

					var_34_18.r = var_34_16
					var_34_18.g = var_34_16
					var_34_18.b = var_34_16
					var_34_17.color = var_34_18
				end
			end

			if arg_31_1.time_ >= var_34_12 + var_34_14 and arg_31_1.time_ < var_34_12 + var_34_14 + arg_34_0 and arg_31_1.var_.highlightMatValue10020 then
				local var_34_19 = 0.5
				local var_34_20 = arg_31_1.var_.highlightMatValue10020
				local var_34_21 = var_34_20.color

				var_34_21.r = var_34_19
				var_34_21.g = var_34_19
				var_34_21.b = var_34_19
				var_34_20.color = var_34_21
			end

			local var_34_22 = 0
			local var_34_23 = 1.325

			if var_34_22 < arg_31_1.time_ and arg_31_1.time_ <= var_34_22 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_24 = arg_31_1:FormatText(StoryNameCfg[226].name)

				arg_31_1.leftNameTxt_.text = var_34_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_25 = arg_31_1:GetWordFromCfg(114291008)
				local var_34_26 = arg_31_1:FormatText(var_34_25.content)

				arg_31_1.text_.text = var_34_26

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_27 = 53
				local var_34_28 = utf8.len(var_34_26)
				local var_34_29 = var_34_27 <= 0 and var_34_23 or var_34_23 * (var_34_28 / var_34_27)

				if var_34_29 > 0 and var_34_23 < var_34_29 then
					arg_31_1.talkMaxDuration = var_34_29

					if var_34_29 + var_34_22 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_29 + var_34_22
					end
				end

				arg_31_1.text_.text = var_34_26
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291008", "story_v_out_114291.awb") ~= 0 then
					local var_34_30 = manager.audio:GetVoiceLength("story_v_out_114291", "114291008", "story_v_out_114291.awb") / 1000

					if var_34_30 + var_34_22 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_30 + var_34_22
					end

					if var_34_25.prefab_name ~= "" and arg_31_1.actors_[var_34_25.prefab_name] ~= nil then
						local var_34_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_25.prefab_name].transform, "story_v_out_114291", "114291008", "story_v_out_114291.awb")

						arg_31_1:RecordAudio("114291008", var_34_31)
						arg_31_1:RecordAudio("114291008", var_34_31)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_114291", "114291008", "story_v_out_114291.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_114291", "114291008", "story_v_out_114291.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_32 = math.max(var_34_23, arg_31_1.talkMaxDuration)

			if var_34_22 <= arg_31_1.time_ and arg_31_1.time_ < var_34_22 + var_34_32 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_22) / var_34_32

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_22 + var_34_32 and arg_31_1.time_ < var_34_22 + var_34_32 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play114291009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 114291009
		arg_35_1.duration_ = 12.333

		local var_35_0 = {
			ja = 6.666,
			ko = 12.3,
			zh = 12.333,
			en = 9.866
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
				arg_35_0:Play114291010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["10016"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				local var_38_2 = var_38_0:GetComponent("Image")

				if var_38_2 then
					arg_35_1.var_.highlightMatValue10016 = var_38_2
				end
			end

			local var_38_3 = 0.034

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_3 then
				local var_38_4 = (arg_35_1.time_ - var_38_1) / var_38_3

				if arg_35_1.var_.highlightMatValue10016 then
					local var_38_5 = Mathf.Lerp(1, 0.5, var_38_4)
					local var_38_6 = arg_35_1.var_.highlightMatValue10016
					local var_38_7 = var_38_6.color

					var_38_7.r = var_38_5
					var_38_7.g = var_38_5
					var_38_7.b = var_38_5
					var_38_6.color = var_38_7
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_3 and arg_35_1.time_ < var_38_1 + var_38_3 + arg_38_0 and arg_35_1.var_.highlightMatValue10016 then
				local var_38_8 = 0.5
				local var_38_9 = arg_35_1.var_.highlightMatValue10016
				local var_38_10 = var_38_9.color

				var_38_10.r = var_38_8
				var_38_10.g = var_38_8
				var_38_10.b = var_38_8
				var_38_9.color = var_38_10
			end

			local var_38_11 = arg_35_1.actors_["10020"]
			local var_38_12 = 0

			if var_38_12 < arg_35_1.time_ and arg_35_1.time_ <= var_38_12 + arg_38_0 then
				local var_38_13 = var_38_11:GetComponent("Image")

				if var_38_13 then
					arg_35_1.var_.highlightMatValue10020 = var_38_13
				end
			end

			local var_38_14 = 0.034

			if var_38_12 <= arg_35_1.time_ and arg_35_1.time_ < var_38_12 + var_38_14 then
				local var_38_15 = (arg_35_1.time_ - var_38_12) / var_38_14

				if arg_35_1.var_.highlightMatValue10020 then
					local var_38_16 = Mathf.Lerp(0.5, 1, var_38_15)
					local var_38_17 = arg_35_1.var_.highlightMatValue10020
					local var_38_18 = var_38_17.color

					var_38_18.r = var_38_16
					var_38_18.g = var_38_16
					var_38_18.b = var_38_16
					var_38_17.color = var_38_18
				end
			end

			if arg_35_1.time_ >= var_38_12 + var_38_14 and arg_35_1.time_ < var_38_12 + var_38_14 + arg_38_0 and arg_35_1.var_.highlightMatValue10020 then
				local var_38_19 = 1

				var_38_11.transform:SetSiblingIndex(1)

				local var_38_20 = arg_35_1.var_.highlightMatValue10020
				local var_38_21 = var_38_20.color

				var_38_21.r = var_38_19
				var_38_21.g = var_38_19
				var_38_21.b = var_38_19
				var_38_20.color = var_38_21
			end

			local var_38_22 = 0
			local var_38_23 = 1.15

			if var_38_22 < arg_35_1.time_ and arg_35_1.time_ <= var_38_22 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_24 = arg_35_1:FormatText(StoryNameCfg[36].name)

				arg_35_1.leftNameTxt_.text = var_38_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_25 = arg_35_1:GetWordFromCfg(114291009)
				local var_38_26 = arg_35_1:FormatText(var_38_25.content)

				arg_35_1.text_.text = var_38_26

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_27 = 46
				local var_38_28 = utf8.len(var_38_26)
				local var_38_29 = var_38_27 <= 0 and var_38_23 or var_38_23 * (var_38_28 / var_38_27)

				if var_38_29 > 0 and var_38_23 < var_38_29 then
					arg_35_1.talkMaxDuration = var_38_29

					if var_38_29 + var_38_22 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_29 + var_38_22
					end
				end

				arg_35_1.text_.text = var_38_26
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291009", "story_v_out_114291.awb") ~= 0 then
					local var_38_30 = manager.audio:GetVoiceLength("story_v_out_114291", "114291009", "story_v_out_114291.awb") / 1000

					if var_38_30 + var_38_22 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_30 + var_38_22
					end

					if var_38_25.prefab_name ~= "" and arg_35_1.actors_[var_38_25.prefab_name] ~= nil then
						local var_38_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_25.prefab_name].transform, "story_v_out_114291", "114291009", "story_v_out_114291.awb")

						arg_35_1:RecordAudio("114291009", var_38_31)
						arg_35_1:RecordAudio("114291009", var_38_31)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_114291", "114291009", "story_v_out_114291.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_114291", "114291009", "story_v_out_114291.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_32 = math.max(var_38_23, arg_35_1.talkMaxDuration)

			if var_38_22 <= arg_35_1.time_ and arg_35_1.time_ < var_38_22 + var_38_32 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_22) / var_38_32

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_22 + var_38_32 and arg_35_1.time_ < var_38_22 + var_38_32 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play114291010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 114291010
		arg_39_1.duration_ = 6.333

		local var_39_0 = {
			ja = 6.333,
			ko = 5.2,
			zh = 3.866,
			en = 3.466
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
				arg_39_0:Play114291011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 0.425

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_2 = arg_39_1:FormatText(StoryNameCfg[36].name)

				arg_39_1.leftNameTxt_.text = var_42_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(114291010)
				local var_42_4 = arg_39_1:FormatText(var_42_3.content)

				arg_39_1.text_.text = var_42_4

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291010", "story_v_out_114291.awb") ~= 0 then
					local var_42_8 = manager.audio:GetVoiceLength("story_v_out_114291", "114291010", "story_v_out_114291.awb") / 1000

					if var_42_8 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_8 + var_42_0
					end

					if var_42_3.prefab_name ~= "" and arg_39_1.actors_[var_42_3.prefab_name] ~= nil then
						local var_42_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_3.prefab_name].transform, "story_v_out_114291", "114291010", "story_v_out_114291.awb")

						arg_39_1:RecordAudio("114291010", var_42_9)
						arg_39_1:RecordAudio("114291010", var_42_9)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_114291", "114291010", "story_v_out_114291.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_114291", "114291010", "story_v_out_114291.awb")
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
	Play114291011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 114291011
		arg_43_1.duration_ = 3.366

		local var_43_0 = {
			ja = 3.366,
			ko = 2.5,
			zh = 3,
			en = 2.666
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
				arg_43_0:Play114291012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10016"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				local var_46_2 = var_46_0:GetComponent("Image")

				if var_46_2 then
					arg_43_1.var_.highlightMatValue10016 = var_46_2
				end
			end

			local var_46_3 = 0.034

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_3 then
				local var_46_4 = (arg_43_1.time_ - var_46_1) / var_46_3

				if arg_43_1.var_.highlightMatValue10016 then
					local var_46_5 = Mathf.Lerp(0.5, 1, var_46_4)
					local var_46_6 = arg_43_1.var_.highlightMatValue10016
					local var_46_7 = var_46_6.color

					var_46_7.r = var_46_5
					var_46_7.g = var_46_5
					var_46_7.b = var_46_5
					var_46_6.color = var_46_7
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_3 and arg_43_1.time_ < var_46_1 + var_46_3 + arg_46_0 and arg_43_1.var_.highlightMatValue10016 then
				local var_46_8 = 1

				var_46_0.transform:SetSiblingIndex(1)

				local var_46_9 = arg_43_1.var_.highlightMatValue10016
				local var_46_10 = var_46_9.color

				var_46_10.r = var_46_8
				var_46_10.g = var_46_8
				var_46_10.b = var_46_8
				var_46_9.color = var_46_10
			end

			local var_46_11 = arg_43_1.actors_["10020"]
			local var_46_12 = 0

			if var_46_12 < arg_43_1.time_ and arg_43_1.time_ <= var_46_12 + arg_46_0 then
				local var_46_13 = var_46_11:GetComponent("Image")

				if var_46_13 then
					arg_43_1.var_.highlightMatValue10020 = var_46_13
				end
			end

			local var_46_14 = 0.034

			if var_46_12 <= arg_43_1.time_ and arg_43_1.time_ < var_46_12 + var_46_14 then
				local var_46_15 = (arg_43_1.time_ - var_46_12) / var_46_14

				if arg_43_1.var_.highlightMatValue10020 then
					local var_46_16 = Mathf.Lerp(1, 0.5, var_46_15)
					local var_46_17 = arg_43_1.var_.highlightMatValue10020
					local var_46_18 = var_46_17.color

					var_46_18.r = var_46_16
					var_46_18.g = var_46_16
					var_46_18.b = var_46_16
					var_46_17.color = var_46_18
				end
			end

			if arg_43_1.time_ >= var_46_12 + var_46_14 and arg_43_1.time_ < var_46_12 + var_46_14 + arg_46_0 and arg_43_1.var_.highlightMatValue10020 then
				local var_46_19 = 0.5
				local var_46_20 = arg_43_1.var_.highlightMatValue10020
				local var_46_21 = var_46_20.color

				var_46_21.r = var_46_19
				var_46_21.g = var_46_19
				var_46_21.b = var_46_19
				var_46_20.color = var_46_21
			end

			local var_46_22 = 0
			local var_46_23 = 0.175

			if var_46_22 < arg_43_1.time_ and arg_43_1.time_ <= var_46_22 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_24 = arg_43_1:FormatText(StoryNameCfg[226].name)

				arg_43_1.leftNameTxt_.text = var_46_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_25 = arg_43_1:GetWordFromCfg(114291011)
				local var_46_26 = arg_43_1:FormatText(var_46_25.content)

				arg_43_1.text_.text = var_46_26

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_27 = 7
				local var_46_28 = utf8.len(var_46_26)
				local var_46_29 = var_46_27 <= 0 and var_46_23 or var_46_23 * (var_46_28 / var_46_27)

				if var_46_29 > 0 and var_46_23 < var_46_29 then
					arg_43_1.talkMaxDuration = var_46_29

					if var_46_29 + var_46_22 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_29 + var_46_22
					end
				end

				arg_43_1.text_.text = var_46_26
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291011", "story_v_out_114291.awb") ~= 0 then
					local var_46_30 = manager.audio:GetVoiceLength("story_v_out_114291", "114291011", "story_v_out_114291.awb") / 1000

					if var_46_30 + var_46_22 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_30 + var_46_22
					end

					if var_46_25.prefab_name ~= "" and arg_43_1.actors_[var_46_25.prefab_name] ~= nil then
						local var_46_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_25.prefab_name].transform, "story_v_out_114291", "114291011", "story_v_out_114291.awb")

						arg_43_1:RecordAudio("114291011", var_46_31)
						arg_43_1:RecordAudio("114291011", var_46_31)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_114291", "114291011", "story_v_out_114291.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_114291", "114291011", "story_v_out_114291.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_32 = math.max(var_46_23, arg_43_1.talkMaxDuration)

			if var_46_22 <= arg_43_1.time_ and arg_43_1.time_ < var_46_22 + var_46_32 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_22) / var_46_32

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_22 + var_46_32 and arg_43_1.time_ < var_46_22 + var_46_32 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play114291012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 114291012
		arg_47_1.duration_ = 17.433

		local var_47_0 = {
			ja = 17.433,
			ko = 16,
			zh = 15.533,
			en = 15.833
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
				arg_47_0:Play114291013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = "OM0503"

			if arg_47_1.bgs_[var_50_0] == nil then
				local var_50_1 = Object.Instantiate(arg_47_1.paintGo_)

				var_50_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_50_0)
				var_50_1.name = var_50_0
				var_50_1.transform.parent = arg_47_1.stage_.transform
				var_50_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_47_1.bgs_[var_50_0] = var_50_1
			end

			local var_50_2 = 2

			if var_50_2 < arg_47_1.time_ and arg_47_1.time_ <= var_50_2 + arg_50_0 then
				local var_50_3 = manager.ui.mainCamera.transform.localPosition
				local var_50_4 = Vector3.New(0, 0, 10) + Vector3.New(var_50_3.x, var_50_3.y, 0)
				local var_50_5 = arg_47_1.bgs_.OM0503

				var_50_5.transform.localPosition = var_50_4
				var_50_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_50_6 = var_50_5:GetComponent("SpriteRenderer")

				if var_50_6 and var_50_6.sprite then
					local var_50_7 = (var_50_5.transform.localPosition - var_50_3).z
					local var_50_8 = manager.ui.mainCameraCom_
					local var_50_9 = 2 * var_50_7 * Mathf.Tan(var_50_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_50_10 = var_50_9 * var_50_8.aspect
					local var_50_11 = var_50_6.sprite.bounds.size.x
					local var_50_12 = var_50_6.sprite.bounds.size.y
					local var_50_13 = var_50_10 / var_50_11
					local var_50_14 = var_50_9 / var_50_12
					local var_50_15 = var_50_14 < var_50_13 and var_50_13 or var_50_14

					var_50_5.transform.localScale = Vector3.New(var_50_15, var_50_15, 0)
				end

				for iter_50_0, iter_50_1 in pairs(arg_47_1.bgs_) do
					if iter_50_0 ~= "OM0503" then
						iter_50_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_50_16 = 0

			if var_50_16 < arg_47_1.time_ and arg_47_1.time_ <= var_50_16 + arg_50_0 then
				arg_47_1.mask_.enabled = true
				arg_47_1.mask_.raycastTarget = true

				arg_47_1:SetGaussion(false)
			end

			local var_50_17 = 2

			if var_50_16 <= arg_47_1.time_ and arg_47_1.time_ < var_50_16 + var_50_17 then
				local var_50_18 = (arg_47_1.time_ - var_50_16) / var_50_17
				local var_50_19 = Color.New(0, 0, 0)

				var_50_19.a = Mathf.Lerp(0, 1, var_50_18)
				arg_47_1.mask_.color = var_50_19
			end

			if arg_47_1.time_ >= var_50_16 + var_50_17 and arg_47_1.time_ < var_50_16 + var_50_17 + arg_50_0 then
				local var_50_20 = Color.New(0, 0, 0)

				var_50_20.a = 1
				arg_47_1.mask_.color = var_50_20
			end

			local var_50_21 = 2

			if var_50_21 < arg_47_1.time_ and arg_47_1.time_ <= var_50_21 + arg_50_0 then
				arg_47_1.mask_.enabled = true
				arg_47_1.mask_.raycastTarget = true

				arg_47_1:SetGaussion(false)
			end

			local var_50_22 = 2

			if var_50_21 <= arg_47_1.time_ and arg_47_1.time_ < var_50_21 + var_50_22 then
				local var_50_23 = (arg_47_1.time_ - var_50_21) / var_50_22
				local var_50_24 = Color.New(0, 0, 0)

				var_50_24.a = Mathf.Lerp(1, 0, var_50_23)
				arg_47_1.mask_.color = var_50_24
			end

			if arg_47_1.time_ >= var_50_21 + var_50_22 and arg_47_1.time_ < var_50_21 + var_50_22 + arg_50_0 then
				local var_50_25 = Color.New(0, 0, 0)
				local var_50_26 = 0

				arg_47_1.mask_.enabled = false
				var_50_25.a = var_50_26
				arg_47_1.mask_.color = var_50_25
			end

			local var_50_27 = arg_47_1.actors_["10020"]
			local var_50_28 = 1.5

			if var_50_28 < arg_47_1.time_ and arg_47_1.time_ <= var_50_28 + arg_50_0 then
				local var_50_29 = var_50_27:GetComponent("Image")

				if var_50_29 then
					arg_47_1.var_.alphaMatValue10020 = var_50_29
					arg_47_1.var_.alphaOldValue10020 = var_50_29.color.a
				end

				arg_47_1.var_.alphaOldValue10020 = 1
			end

			local var_50_30 = 0.5

			if var_50_28 <= arg_47_1.time_ and arg_47_1.time_ < var_50_28 + var_50_30 then
				local var_50_31 = (arg_47_1.time_ - var_50_28) / var_50_30
				local var_50_32 = Mathf.Lerp(arg_47_1.var_.alphaOldValue10020, 0, var_50_31)

				if arg_47_1.var_.alphaMatValue10020 then
					local var_50_33 = arg_47_1.var_.alphaMatValue10020.color

					var_50_33.a = var_50_32
					arg_47_1.var_.alphaMatValue10020.color = var_50_33
				end
			end

			if arg_47_1.time_ >= var_50_28 + var_50_30 and arg_47_1.time_ < var_50_28 + var_50_30 + arg_50_0 and arg_47_1.var_.alphaMatValue10020 then
				local var_50_34 = arg_47_1.var_.alphaMatValue10020
				local var_50_35 = var_50_34.color

				var_50_35.a = 0
				var_50_34.color = var_50_35
			end

			local var_50_36 = arg_47_1.actors_["10016"]
			local var_50_37 = 1.5

			if var_50_37 < arg_47_1.time_ and arg_47_1.time_ <= var_50_37 + arg_50_0 then
				local var_50_38 = var_50_36:GetComponent("Image")

				if var_50_38 then
					arg_47_1.var_.alphaMatValue10016 = var_50_38
					arg_47_1.var_.alphaOldValue10016 = var_50_38.color.a
				end

				arg_47_1.var_.alphaOldValue10016 = 1
			end

			local var_50_39 = 0.5

			if var_50_37 <= arg_47_1.time_ and arg_47_1.time_ < var_50_37 + var_50_39 then
				local var_50_40 = (arg_47_1.time_ - var_50_37) / var_50_39
				local var_50_41 = Mathf.Lerp(arg_47_1.var_.alphaOldValue10016, 0, var_50_40)

				if arg_47_1.var_.alphaMatValue10016 then
					local var_50_42 = arg_47_1.var_.alphaMatValue10016.color

					var_50_42.a = var_50_41
					arg_47_1.var_.alphaMatValue10016.color = var_50_42
				end
			end

			if arg_47_1.time_ >= var_50_37 + var_50_39 and arg_47_1.time_ < var_50_37 + var_50_39 + arg_50_0 and arg_47_1.var_.alphaMatValue10016 then
				local var_50_43 = arg_47_1.var_.alphaMatValue10016
				local var_50_44 = var_50_43.color

				var_50_44.a = 0
				var_50_43.color = var_50_44
			end

			if arg_47_1.frameCnt_ <= 1 then
				arg_47_1.dialog_:SetActive(false)
			end

			local var_50_45 = 4
			local var_50_46 = 1.075

			if var_50_45 < arg_47_1.time_ and arg_47_1.time_ <= var_50_45 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0

				arg_47_1.dialog_:SetActive(true)

				local var_50_47 = LeanTween.value(arg_47_1.dialog_, 0, 1, 0.3)

				var_50_47:setOnUpdate(LuaHelper.FloatAction(function(arg_51_0)
					arg_47_1.dialogCg_.alpha = arg_51_0
				end))
				var_50_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_47_1.dialog_)
					var_50_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_47_1.duration_ = arg_47_1.duration_ + 0.3

				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_48 = arg_47_1:FormatText(StoryNameCfg[226].name)

				arg_47_1.leftNameTxt_.text = var_50_48

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_49 = arg_47_1:GetWordFromCfg(114291012)
				local var_50_50 = arg_47_1:FormatText(var_50_49.content)

				arg_47_1.text_.text = var_50_50

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_51 = 43
				local var_50_52 = utf8.len(var_50_50)
				local var_50_53 = var_50_51 <= 0 and var_50_46 or var_50_46 * (var_50_52 / var_50_51)

				if var_50_53 > 0 and var_50_46 < var_50_53 then
					arg_47_1.talkMaxDuration = var_50_53
					var_50_45 = var_50_45 + 0.3

					if var_50_53 + var_50_45 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_53 + var_50_45
					end
				end

				arg_47_1.text_.text = var_50_50
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291012", "story_v_out_114291.awb") ~= 0 then
					local var_50_54 = manager.audio:GetVoiceLength("story_v_out_114291", "114291012", "story_v_out_114291.awb") / 1000

					if var_50_54 + var_50_45 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_54 + var_50_45
					end

					if var_50_49.prefab_name ~= "" and arg_47_1.actors_[var_50_49.prefab_name] ~= nil then
						local var_50_55 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_49.prefab_name].transform, "story_v_out_114291", "114291012", "story_v_out_114291.awb")

						arg_47_1:RecordAudio("114291012", var_50_55)
						arg_47_1:RecordAudio("114291012", var_50_55)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_114291", "114291012", "story_v_out_114291.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_114291", "114291012", "story_v_out_114291.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_56 = var_50_45 + 0.3
			local var_50_57 = math.max(var_50_46, arg_47_1.talkMaxDuration)

			if var_50_56 <= arg_47_1.time_ and arg_47_1.time_ < var_50_56 + var_50_57 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_56) / var_50_57

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_56 + var_50_57 and arg_47_1.time_ < var_50_56 + var_50_57 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play114291013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 114291013
		arg_53_1.duration_ = 19.7

		local var_53_0 = {
			ja = 16.1,
			ko = 18.333,
			zh = 19.7,
			en = 18.433
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
				arg_53_0:Play114291014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0
			local var_56_1 = 1.575

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_2 = arg_53_1:FormatText(StoryNameCfg[226].name)

				arg_53_1.leftNameTxt_.text = var_56_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_3 = arg_53_1:GetWordFromCfg(114291013)
				local var_56_4 = arg_53_1:FormatText(var_56_3.content)

				arg_53_1.text_.text = var_56_4

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_5 = 63
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

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291013", "story_v_out_114291.awb") ~= 0 then
					local var_56_8 = manager.audio:GetVoiceLength("story_v_out_114291", "114291013", "story_v_out_114291.awb") / 1000

					if var_56_8 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_8 + var_56_0
					end

					if var_56_3.prefab_name ~= "" and arg_53_1.actors_[var_56_3.prefab_name] ~= nil then
						local var_56_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_3.prefab_name].transform, "story_v_out_114291", "114291013", "story_v_out_114291.awb")

						arg_53_1:RecordAudio("114291013", var_56_9)
						arg_53_1:RecordAudio("114291013", var_56_9)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_114291", "114291013", "story_v_out_114291.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_114291", "114291013", "story_v_out_114291.awb")
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
	Play114291014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 114291014
		arg_57_1.duration_ = 22.9

		local var_57_0 = {
			ja = 22.9,
			ko = 16.6,
			zh = 18.733,
			en = 19.966
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
				arg_57_0:Play114291015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0
			local var_60_1 = 1.825

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_2 = arg_57_1:FormatText(StoryNameCfg[226].name)

				arg_57_1.leftNameTxt_.text = var_60_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_3 = arg_57_1:GetWordFromCfg(114291014)
				local var_60_4 = arg_57_1:FormatText(var_60_3.content)

				arg_57_1.text_.text = var_60_4

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_5 = 74
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

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291014", "story_v_out_114291.awb") ~= 0 then
					local var_60_8 = manager.audio:GetVoiceLength("story_v_out_114291", "114291014", "story_v_out_114291.awb") / 1000

					if var_60_8 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_8 + var_60_0
					end

					if var_60_3.prefab_name ~= "" and arg_57_1.actors_[var_60_3.prefab_name] ~= nil then
						local var_60_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_3.prefab_name].transform, "story_v_out_114291", "114291014", "story_v_out_114291.awb")

						arg_57_1:RecordAudio("114291014", var_60_9)
						arg_57_1:RecordAudio("114291014", var_60_9)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_114291", "114291014", "story_v_out_114291.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_114291", "114291014", "story_v_out_114291.awb")
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
	Play114291015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 114291015
		arg_61_1.duration_ = 5

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play114291016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 1.475

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, false)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_2 = arg_61_1:GetWordFromCfg(114291015)
				local var_64_3 = arg_61_1:FormatText(var_64_2.content)

				arg_61_1.text_.text = var_64_3

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_4 = 59
				local var_64_5 = utf8.len(var_64_3)
				local var_64_6 = var_64_4 <= 0 and var_64_1 or var_64_1 * (var_64_5 / var_64_4)

				if var_64_6 > 0 and var_64_1 < var_64_6 then
					arg_61_1.talkMaxDuration = var_64_6

					if var_64_6 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_6 + var_64_0
					end
				end

				arg_61_1.text_.text = var_64_3
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_7 = math.max(var_64_1, arg_61_1.talkMaxDuration)

			if var_64_0 <= arg_61_1.time_ and arg_61_1.time_ < var_64_0 + var_64_7 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_0) / var_64_7

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_0 + var_64_7 and arg_61_1.time_ < var_64_0 + var_64_7 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play114291016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 114291016
		arg_65_1.duration_ = 26.2

		local var_65_0 = {
			ja = 26.2,
			ko = 21.9,
			zh = 18.7,
			en = 22.933
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
				arg_65_0:Play114291017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 1.8

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_2 = arg_65_1:FormatText(StoryNameCfg[226].name)

				arg_65_1.leftNameTxt_.text = var_68_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_3 = arg_65_1:GetWordFromCfg(114291016)
				local var_68_4 = arg_65_1:FormatText(var_68_3.content)

				arg_65_1.text_.text = var_68_4

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_5 = 72
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

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291016", "story_v_out_114291.awb") ~= 0 then
					local var_68_8 = manager.audio:GetVoiceLength("story_v_out_114291", "114291016", "story_v_out_114291.awb") / 1000

					if var_68_8 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_8 + var_68_0
					end

					if var_68_3.prefab_name ~= "" and arg_65_1.actors_[var_68_3.prefab_name] ~= nil then
						local var_68_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_3.prefab_name].transform, "story_v_out_114291", "114291016", "story_v_out_114291.awb")

						arg_65_1:RecordAudio("114291016", var_68_9)
						arg_65_1:RecordAudio("114291016", var_68_9)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_114291", "114291016", "story_v_out_114291.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_114291", "114291016", "story_v_out_114291.awb")
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
	Play114291017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 114291017
		arg_69_1.duration_ = 22.266

		local var_69_0 = {
			ja = 22.266,
			ko = 17.7,
			zh = 14.966,
			en = 15.766
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
				arg_69_0:Play114291018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = 1.45

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_2 = arg_69_1:FormatText(StoryNameCfg[226].name)

				arg_69_1.leftNameTxt_.text = var_72_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_3 = arg_69_1:GetWordFromCfg(114291017)
				local var_72_4 = arg_69_1:FormatText(var_72_3.content)

				arg_69_1.text_.text = var_72_4

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_5 = 58
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

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291017", "story_v_out_114291.awb") ~= 0 then
					local var_72_8 = manager.audio:GetVoiceLength("story_v_out_114291", "114291017", "story_v_out_114291.awb") / 1000

					if var_72_8 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_8 + var_72_0
					end

					if var_72_3.prefab_name ~= "" and arg_69_1.actors_[var_72_3.prefab_name] ~= nil then
						local var_72_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_3.prefab_name].transform, "story_v_out_114291", "114291017", "story_v_out_114291.awb")

						arg_69_1:RecordAudio("114291017", var_72_9)
						arg_69_1:RecordAudio("114291017", var_72_9)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_114291", "114291017", "story_v_out_114291.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_114291", "114291017", "story_v_out_114291.awb")
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
	Play114291018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 114291018
		arg_73_1.duration_ = 16.633

		local var_73_0 = {
			ja = 13.366,
			ko = 14.466,
			zh = 16.466,
			en = 16.633
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
				arg_73_0:Play114291019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 1.475

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_2 = arg_73_1:FormatText(StoryNameCfg[226].name)

				arg_73_1.leftNameTxt_.text = var_76_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_3 = arg_73_1:GetWordFromCfg(114291018)
				local var_76_4 = arg_73_1:FormatText(var_76_3.content)

				arg_73_1.text_.text = var_76_4

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_5 = 59
				local var_76_6 = utf8.len(var_76_4)
				local var_76_7 = var_76_5 <= 0 and var_76_1 or var_76_1 * (var_76_6 / var_76_5)

				if var_76_7 > 0 and var_76_1 < var_76_7 then
					arg_73_1.talkMaxDuration = var_76_7

					if var_76_7 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_7 + var_76_0
					end
				end

				arg_73_1.text_.text = var_76_4
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291018", "story_v_out_114291.awb") ~= 0 then
					local var_76_8 = manager.audio:GetVoiceLength("story_v_out_114291", "114291018", "story_v_out_114291.awb") / 1000

					if var_76_8 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_8 + var_76_0
					end

					if var_76_3.prefab_name ~= "" and arg_73_1.actors_[var_76_3.prefab_name] ~= nil then
						local var_76_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_3.prefab_name].transform, "story_v_out_114291", "114291018", "story_v_out_114291.awb")

						arg_73_1:RecordAudio("114291018", var_76_9)
						arg_73_1:RecordAudio("114291018", var_76_9)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_114291", "114291018", "story_v_out_114291.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_114291", "114291018", "story_v_out_114291.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_10 = math.max(var_76_1, arg_73_1.talkMaxDuration)

			if var_76_0 <= arg_73_1.time_ and arg_73_1.time_ < var_76_0 + var_76_10 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_0) / var_76_10

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_0 + var_76_10 and arg_73_1.time_ < var_76_0 + var_76_10 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play114291019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 114291019
		arg_77_1.duration_ = 8.1

		local var_77_0 = {
			ja = 8.1,
			ko = 7.733,
			zh = 6.5,
			en = 7.566
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
				arg_77_0:Play114291020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 0.675

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_2 = arg_77_1:FormatText(StoryNameCfg[36].name)

				arg_77_1.leftNameTxt_.text = var_80_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_3 = arg_77_1:GetWordFromCfg(114291019)
				local var_80_4 = arg_77_1:FormatText(var_80_3.content)

				arg_77_1.text_.text = var_80_4

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_5 = 27
				local var_80_6 = utf8.len(var_80_4)
				local var_80_7 = var_80_5 <= 0 and var_80_1 or var_80_1 * (var_80_6 / var_80_5)

				if var_80_7 > 0 and var_80_1 < var_80_7 then
					arg_77_1.talkMaxDuration = var_80_7

					if var_80_7 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_7 + var_80_0
					end
				end

				arg_77_1.text_.text = var_80_4
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291019", "story_v_out_114291.awb") ~= 0 then
					local var_80_8 = manager.audio:GetVoiceLength("story_v_out_114291", "114291019", "story_v_out_114291.awb") / 1000

					if var_80_8 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_8 + var_80_0
					end

					if var_80_3.prefab_name ~= "" and arg_77_1.actors_[var_80_3.prefab_name] ~= nil then
						local var_80_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_3.prefab_name].transform, "story_v_out_114291", "114291019", "story_v_out_114291.awb")

						arg_77_1:RecordAudio("114291019", var_80_9)
						arg_77_1:RecordAudio("114291019", var_80_9)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_114291", "114291019", "story_v_out_114291.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_114291", "114291019", "story_v_out_114291.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_10 = math.max(var_80_1, arg_77_1.talkMaxDuration)

			if var_80_0 <= arg_77_1.time_ and arg_77_1.time_ < var_80_0 + var_80_10 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_0) / var_80_10

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_0 + var_80_10 and arg_77_1.time_ < var_80_0 + var_80_10 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play114291020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 114291020
		arg_81_1.duration_ = 8.266

		local var_81_0 = {
			ja = 8.266,
			ko = 6.933,
			zh = 7.1,
			en = 7.133
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
				arg_81_0:Play114291021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 0.525

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_2 = arg_81_1:FormatText(StoryNameCfg[226].name)

				arg_81_1.leftNameTxt_.text = var_84_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_3 = arg_81_1:GetWordFromCfg(114291020)
				local var_84_4 = arg_81_1:FormatText(var_84_3.content)

				arg_81_1.text_.text = var_84_4

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_5 = 21
				local var_84_6 = utf8.len(var_84_4)
				local var_84_7 = var_84_5 <= 0 and var_84_1 or var_84_1 * (var_84_6 / var_84_5)

				if var_84_7 > 0 and var_84_1 < var_84_7 then
					arg_81_1.talkMaxDuration = var_84_7

					if var_84_7 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_7 + var_84_0
					end
				end

				arg_81_1.text_.text = var_84_4
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291020", "story_v_out_114291.awb") ~= 0 then
					local var_84_8 = manager.audio:GetVoiceLength("story_v_out_114291", "114291020", "story_v_out_114291.awb") / 1000

					if var_84_8 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_8 + var_84_0
					end

					if var_84_3.prefab_name ~= "" and arg_81_1.actors_[var_84_3.prefab_name] ~= nil then
						local var_84_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_3.prefab_name].transform, "story_v_out_114291", "114291020", "story_v_out_114291.awb")

						arg_81_1:RecordAudio("114291020", var_84_9)
						arg_81_1:RecordAudio("114291020", var_84_9)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_114291", "114291020", "story_v_out_114291.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_114291", "114291020", "story_v_out_114291.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_10 = math.max(var_84_1, arg_81_1.talkMaxDuration)

			if var_84_0 <= arg_81_1.time_ and arg_81_1.time_ < var_84_0 + var_84_10 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_0) / var_84_10

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_0 + var_84_10 and arg_81_1.time_ < var_84_0 + var_84_10 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play114291021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 114291021
		arg_85_1.duration_ = 24

		local var_85_0 = {
			ja = 24,
			ko = 11.6,
			zh = 16.4,
			en = 17.833
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
				arg_85_0:Play114291022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 1.325

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_2 = arg_85_1:FormatText(StoryNameCfg[226].name)

				arg_85_1.leftNameTxt_.text = var_88_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_3 = arg_85_1:GetWordFromCfg(114291021)
				local var_88_4 = arg_85_1:FormatText(var_88_3.content)

				arg_85_1.text_.text = var_88_4

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_5 = 53
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

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291021", "story_v_out_114291.awb") ~= 0 then
					local var_88_8 = manager.audio:GetVoiceLength("story_v_out_114291", "114291021", "story_v_out_114291.awb") / 1000

					if var_88_8 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_8 + var_88_0
					end

					if var_88_3.prefab_name ~= "" and arg_85_1.actors_[var_88_3.prefab_name] ~= nil then
						local var_88_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_3.prefab_name].transform, "story_v_out_114291", "114291021", "story_v_out_114291.awb")

						arg_85_1:RecordAudio("114291021", var_88_9)
						arg_85_1:RecordAudio("114291021", var_88_9)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_114291", "114291021", "story_v_out_114291.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_114291", "114291021", "story_v_out_114291.awb")
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
	Play114291022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 114291022
		arg_89_1.duration_ = 19.166

		local var_89_0 = {
			ja = 19.166,
			ko = 14.7,
			zh = 19.1,
			en = 14.766
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
				arg_89_0:Play114291023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 1.125

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_2 = arg_89_1:FormatText(StoryNameCfg[226].name)

				arg_89_1.leftNameTxt_.text = var_92_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_3 = arg_89_1:GetWordFromCfg(114291022)
				local var_92_4 = arg_89_1:FormatText(var_92_3.content)

				arg_89_1.text_.text = var_92_4

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_5 = 45
				local var_92_6 = utf8.len(var_92_4)
				local var_92_7 = var_92_5 <= 0 and var_92_1 or var_92_1 * (var_92_6 / var_92_5)

				if var_92_7 > 0 and var_92_1 < var_92_7 then
					arg_89_1.talkMaxDuration = var_92_7

					if var_92_7 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_7 + var_92_0
					end
				end

				arg_89_1.text_.text = var_92_4
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291022", "story_v_out_114291.awb") ~= 0 then
					local var_92_8 = manager.audio:GetVoiceLength("story_v_out_114291", "114291022", "story_v_out_114291.awb") / 1000

					if var_92_8 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_8 + var_92_0
					end

					if var_92_3.prefab_name ~= "" and arg_89_1.actors_[var_92_3.prefab_name] ~= nil then
						local var_92_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_3.prefab_name].transform, "story_v_out_114291", "114291022", "story_v_out_114291.awb")

						arg_89_1:RecordAudio("114291022", var_92_9)
						arg_89_1:RecordAudio("114291022", var_92_9)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_114291", "114291022", "story_v_out_114291.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_114291", "114291022", "story_v_out_114291.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_10 = math.max(var_92_1, arg_89_1.talkMaxDuration)

			if var_92_0 <= arg_89_1.time_ and arg_89_1.time_ < var_92_0 + var_92_10 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_0) / var_92_10

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_0 + var_92_10 and arg_89_1.time_ < var_92_0 + var_92_10 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play114291023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 114291023
		arg_93_1.duration_ = 9

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play114291024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 2

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				local var_96_1 = manager.ui.mainCamera.transform.localPosition
				local var_96_2 = Vector3.New(0, 0, 10) + Vector3.New(var_96_1.x, var_96_1.y, 0)
				local var_96_3 = arg_93_1.bgs_.ST26

				var_96_3.transform.localPosition = var_96_2
				var_96_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_96_4 = var_96_3:GetComponent("SpriteRenderer")

				if var_96_4 and var_96_4.sprite then
					local var_96_5 = (var_96_3.transform.localPosition - var_96_1).z
					local var_96_6 = manager.ui.mainCameraCom_
					local var_96_7 = 2 * var_96_5 * Mathf.Tan(var_96_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_96_8 = var_96_7 * var_96_6.aspect
					local var_96_9 = var_96_4.sprite.bounds.size.x
					local var_96_10 = var_96_4.sprite.bounds.size.y
					local var_96_11 = var_96_8 / var_96_9
					local var_96_12 = var_96_7 / var_96_10
					local var_96_13 = var_96_12 < var_96_11 and var_96_11 or var_96_12

					var_96_3.transform.localScale = Vector3.New(var_96_13, var_96_13, 0)
				end

				for iter_96_0, iter_96_1 in pairs(arg_93_1.bgs_) do
					if iter_96_0 ~= "ST26" then
						iter_96_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_96_14 = 0

			if var_96_14 < arg_93_1.time_ and arg_93_1.time_ <= var_96_14 + arg_96_0 then
				arg_93_1.mask_.enabled = true
				arg_93_1.mask_.raycastTarget = true

				arg_93_1:SetGaussion(false)
			end

			local var_96_15 = 2

			if var_96_14 <= arg_93_1.time_ and arg_93_1.time_ < var_96_14 + var_96_15 then
				local var_96_16 = (arg_93_1.time_ - var_96_14) / var_96_15
				local var_96_17 = Color.New(0, 0, 0)

				var_96_17.a = Mathf.Lerp(0, 1, var_96_16)
				arg_93_1.mask_.color = var_96_17
			end

			if arg_93_1.time_ >= var_96_14 + var_96_15 and arg_93_1.time_ < var_96_14 + var_96_15 + arg_96_0 then
				local var_96_18 = Color.New(0, 0, 0)

				var_96_18.a = 1
				arg_93_1.mask_.color = var_96_18
			end

			local var_96_19 = 2

			if var_96_19 < arg_93_1.time_ and arg_93_1.time_ <= var_96_19 + arg_96_0 then
				arg_93_1.mask_.enabled = true
				arg_93_1.mask_.raycastTarget = true

				arg_93_1:SetGaussion(false)
			end

			local var_96_20 = 2

			if var_96_19 <= arg_93_1.time_ and arg_93_1.time_ < var_96_19 + var_96_20 then
				local var_96_21 = (arg_93_1.time_ - var_96_19) / var_96_20
				local var_96_22 = Color.New(0, 0, 0)

				var_96_22.a = Mathf.Lerp(1, 0, var_96_21)
				arg_93_1.mask_.color = var_96_22
			end

			if arg_93_1.time_ >= var_96_19 + var_96_20 and arg_93_1.time_ < var_96_19 + var_96_20 + arg_96_0 then
				local var_96_23 = Color.New(0, 0, 0)
				local var_96_24 = 0

				arg_93_1.mask_.enabled = false
				var_96_23.a = var_96_24
				arg_93_1.mask_.color = var_96_23
			end

			if arg_93_1.frameCnt_ <= 1 then
				arg_93_1.dialog_:SetActive(false)
			end

			local var_96_25 = 4
			local var_96_26 = 0.05

			if var_96_25 < arg_93_1.time_ and arg_93_1.time_ <= var_96_25 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0

				arg_93_1.dialog_:SetActive(true)

				local var_96_27 = LeanTween.value(arg_93_1.dialog_, 0, 1, 0.3)

				var_96_27:setOnUpdate(LuaHelper.FloatAction(function(arg_97_0)
					arg_93_1.dialogCg_.alpha = arg_97_0
				end))
				var_96_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_93_1.dialog_)
					var_96_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_93_1.duration_ = arg_93_1.duration_ + 0.3

				SetActive(arg_93_1.leftNameGo_, false)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_28 = arg_93_1:GetWordFromCfg(114291023)
				local var_96_29 = arg_93_1:FormatText(var_96_28.content)

				arg_93_1.text_.text = var_96_29

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_30 = 2
				local var_96_31 = utf8.len(var_96_29)
				local var_96_32 = var_96_30 <= 0 and var_96_26 or var_96_26 * (var_96_31 / var_96_30)

				if var_96_32 > 0 and var_96_26 < var_96_32 then
					arg_93_1.talkMaxDuration = var_96_32
					var_96_25 = var_96_25 + 0.3

					if var_96_32 + var_96_25 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_32 + var_96_25
					end
				end

				arg_93_1.text_.text = var_96_29
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_33 = var_96_25 + 0.3
			local var_96_34 = math.max(var_96_26, arg_93_1.talkMaxDuration)

			if var_96_33 <= arg_93_1.time_ and arg_93_1.time_ < var_96_33 + var_96_34 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_33) / var_96_34

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_33 + var_96_34 and arg_93_1.time_ < var_96_33 + var_96_34 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play114291024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 114291024
		arg_99_1.duration_ = 1.633

		local var_99_0 = {
			ja = 1.633,
			ko = 1.566,
			zh = 1.066,
			en = 1.333
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
				arg_99_0:Play114291025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = "10015"

			if arg_99_1.actors_[var_102_0] == nil then
				local var_102_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_102_0), arg_99_1.canvasGo_.transform)

				var_102_1.transform:SetSiblingIndex(1)

				var_102_1.name = var_102_0
				var_102_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_99_1.actors_[var_102_0] = var_102_1
			end

			local var_102_2 = arg_99_1.actors_["10015"].transform
			local var_102_3 = 0

			if var_102_3 < arg_99_1.time_ and arg_99_1.time_ <= var_102_3 + arg_102_0 then
				arg_99_1.var_.moveOldPos10015 = var_102_2.localPosition
				var_102_2.localScale = Vector3.New(1, 1, 1)

				arg_99_1:CheckSpriteTmpPos("10015", 4)

				local var_102_4 = var_102_2.childCount

				for iter_102_0 = 0, var_102_4 - 1 do
					local var_102_5 = var_102_2:GetChild(iter_102_0)

					if var_102_5.name == "split_1" or not string.find(var_102_5.name, "split") then
						var_102_5.gameObject:SetActive(true)
					else
						var_102_5.gameObject:SetActive(false)
					end
				end
			end

			local var_102_6 = 0.001

			if var_102_3 <= arg_99_1.time_ and arg_99_1.time_ < var_102_3 + var_102_6 then
				local var_102_7 = (arg_99_1.time_ - var_102_3) / var_102_6
				local var_102_8 = Vector3.New(390, -350, -180)

				var_102_2.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos10015, var_102_8, var_102_7)
			end

			if arg_99_1.time_ >= var_102_3 + var_102_6 and arg_99_1.time_ < var_102_3 + var_102_6 + arg_102_0 then
				var_102_2.localPosition = Vector3.New(390, -350, -180)
			end

			local var_102_9 = arg_99_1.actors_["10015"]
			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 and arg_99_1.var_.actorSpriteComps10015 == nil then
				arg_99_1.var_.actorSpriteComps10015 = var_102_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_11 = 0.034

			if var_102_10 <= arg_99_1.time_ and arg_99_1.time_ < var_102_10 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_10) / var_102_11

				if arg_99_1.var_.actorSpriteComps10015 then
					for iter_102_1, iter_102_2 in pairs(arg_99_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_102_2 then
							local var_102_13 = Mathf.Lerp(iter_102_2.color.r, 1, var_102_12)

							iter_102_2.color = Color.New(var_102_13, var_102_13, var_102_13)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_10 + var_102_11 and arg_99_1.time_ < var_102_10 + var_102_11 + arg_102_0 and arg_99_1.var_.actorSpriteComps10015 then
				local var_102_14 = 1

				for iter_102_3, iter_102_4 in pairs(arg_99_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_102_4 then
						iter_102_4.color = Color.New(var_102_14, var_102_14, var_102_14)
					end
				end

				arg_99_1.var_.actorSpriteComps10015 = nil
			end

			local var_102_15 = arg_99_1.actors_["10015"]
			local var_102_16 = 0

			if var_102_16 < arg_99_1.time_ and arg_99_1.time_ <= var_102_16 + arg_102_0 then
				local var_102_17 = var_102_15:GetComponentInChildren(typeof(CanvasGroup))

				if var_102_17 then
					arg_99_1.var_.alphaOldValue10015 = var_102_17.alpha
					arg_99_1.var_.characterEffect10015 = var_102_17
				end

				arg_99_1.var_.alphaOldValue10015 = 0
			end

			local var_102_18 = 0.5

			if var_102_16 <= arg_99_1.time_ and arg_99_1.time_ < var_102_16 + var_102_18 then
				local var_102_19 = (arg_99_1.time_ - var_102_16) / var_102_18
				local var_102_20 = Mathf.Lerp(arg_99_1.var_.alphaOldValue10015, 1, var_102_19)

				if arg_99_1.var_.characterEffect10015 then
					arg_99_1.var_.characterEffect10015.alpha = var_102_20
				end
			end

			if arg_99_1.time_ >= var_102_16 + var_102_18 and arg_99_1.time_ < var_102_16 + var_102_18 + arg_102_0 and arg_99_1.var_.characterEffect10015 then
				arg_99_1.var_.characterEffect10015.alpha = 1
			end

			local var_102_21 = 0
			local var_102_22 = 0.1

			if var_102_21 < arg_99_1.time_ and arg_99_1.time_ <= var_102_21 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_23 = arg_99_1:FormatText(StoryNameCfg[208].name)

				arg_99_1.leftNameTxt_.text = var_102_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_24 = arg_99_1:GetWordFromCfg(114291024)
				local var_102_25 = arg_99_1:FormatText(var_102_24.content)

				arg_99_1.text_.text = var_102_25

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_26 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291024", "story_v_out_114291.awb") ~= 0 then
					local var_102_29 = manager.audio:GetVoiceLength("story_v_out_114291", "114291024", "story_v_out_114291.awb") / 1000

					if var_102_29 + var_102_21 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_29 + var_102_21
					end

					if var_102_24.prefab_name ~= "" and arg_99_1.actors_[var_102_24.prefab_name] ~= nil then
						local var_102_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_24.prefab_name].transform, "story_v_out_114291", "114291024", "story_v_out_114291.awb")

						arg_99_1:RecordAudio("114291024", var_102_30)
						arg_99_1:RecordAudio("114291024", var_102_30)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_114291", "114291024", "story_v_out_114291.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_114291", "114291024", "story_v_out_114291.awb")
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
	Play114291025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 114291025
		arg_103_1.duration_ = 7.733

		local var_103_0 = {
			ja = 7.5,
			ko = 7.1,
			zh = 7.733,
			en = 6.8
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
				arg_103_0:Play114291026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["10016"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos10016 = var_106_0.localPosition
				var_106_0.localScale = Vector3.New(1, 1, 1)

				arg_103_1:CheckSpriteTmpPos("10016", 2)
			end

			local var_106_2 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(-390, -350, -180)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos10016, var_106_4, var_106_3)
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_106_5 = arg_103_1.actors_["10015"]
			local var_106_6 = 0

			if var_106_6 < arg_103_1.time_ and arg_103_1.time_ <= var_106_6 + arg_106_0 and arg_103_1.var_.actorSpriteComps10015 == nil then
				arg_103_1.var_.actorSpriteComps10015 = var_106_5:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_7 = 0.034

			if var_106_6 <= arg_103_1.time_ and arg_103_1.time_ < var_106_6 + var_106_7 then
				local var_106_8 = (arg_103_1.time_ - var_106_6) / var_106_7

				if arg_103_1.var_.actorSpriteComps10015 then
					for iter_106_0, iter_106_1 in pairs(arg_103_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_106_1 then
							local var_106_9 = Mathf.Lerp(iter_106_1.color.r, 0.5, var_106_8)

							iter_106_1.color = Color.New(var_106_9, var_106_9, var_106_9)
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_6 + var_106_7 and arg_103_1.time_ < var_106_6 + var_106_7 + arg_106_0 and arg_103_1.var_.actorSpriteComps10015 then
				local var_106_10 = 0.5

				for iter_106_2, iter_106_3 in pairs(arg_103_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_106_3 then
						iter_106_3.color = Color.New(var_106_10, var_106_10, var_106_10)
					end
				end

				arg_103_1.var_.actorSpriteComps10015 = nil
			end

			local var_106_11 = arg_103_1.actors_["10016"]
			local var_106_12 = 0

			if var_106_12 < arg_103_1.time_ and arg_103_1.time_ <= var_106_12 + arg_106_0 then
				local var_106_13 = var_106_11:GetComponent("Image")

				if var_106_13 then
					arg_103_1.var_.highlightMatValue10016 = var_106_13
				end
			end

			local var_106_14 = 0.034

			if var_106_12 <= arg_103_1.time_ and arg_103_1.time_ < var_106_12 + var_106_14 then
				local var_106_15 = (arg_103_1.time_ - var_106_12) / var_106_14

				if arg_103_1.var_.highlightMatValue10016 then
					local var_106_16 = Mathf.Lerp(0.5, 1, var_106_15)
					local var_106_17 = arg_103_1.var_.highlightMatValue10016
					local var_106_18 = var_106_17.color

					var_106_18.r = var_106_16
					var_106_18.g = var_106_16
					var_106_18.b = var_106_16
					var_106_17.color = var_106_18
				end
			end

			if arg_103_1.time_ >= var_106_12 + var_106_14 and arg_103_1.time_ < var_106_12 + var_106_14 + arg_106_0 and arg_103_1.var_.highlightMatValue10016 then
				local var_106_19 = 1

				var_106_11.transform:SetSiblingIndex(1)

				local var_106_20 = arg_103_1.var_.highlightMatValue10016
				local var_106_21 = var_106_20.color

				var_106_21.r = var_106_19
				var_106_21.g = var_106_19
				var_106_21.b = var_106_19
				var_106_20.color = var_106_21
			end

			local var_106_22 = arg_103_1.actors_["10016"]
			local var_106_23 = 0

			if var_106_23 < arg_103_1.time_ and arg_103_1.time_ <= var_106_23 + arg_106_0 then
				local var_106_24 = var_106_22:GetComponent("Image")

				if var_106_24 then
					arg_103_1.var_.alphaMatValue10016 = var_106_24
					arg_103_1.var_.alphaOldValue10016 = var_106_24.color.a
				end

				arg_103_1.var_.alphaOldValue10016 = 0
			end

			local var_106_25 = 0.5

			if var_106_23 <= arg_103_1.time_ and arg_103_1.time_ < var_106_23 + var_106_25 then
				local var_106_26 = (arg_103_1.time_ - var_106_23) / var_106_25
				local var_106_27 = Mathf.Lerp(arg_103_1.var_.alphaOldValue10016, 1, var_106_26)

				if arg_103_1.var_.alphaMatValue10016 then
					local var_106_28 = arg_103_1.var_.alphaMatValue10016.color

					var_106_28.a = var_106_27
					arg_103_1.var_.alphaMatValue10016.color = var_106_28
				end
			end

			if arg_103_1.time_ >= var_106_23 + var_106_25 and arg_103_1.time_ < var_106_23 + var_106_25 + arg_106_0 and arg_103_1.var_.alphaMatValue10016 then
				local var_106_29 = arg_103_1.var_.alphaMatValue10016
				local var_106_30 = var_106_29.color

				var_106_30.a = 1
				var_106_29.color = var_106_30
			end

			local var_106_31 = 0
			local var_106_32 = 0.625

			if var_106_31 < arg_103_1.time_ and arg_103_1.time_ <= var_106_31 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_33 = arg_103_1:FormatText(StoryNameCfg[226].name)

				arg_103_1.leftNameTxt_.text = var_106_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_34 = arg_103_1:GetWordFromCfg(114291025)
				local var_106_35 = arg_103_1:FormatText(var_106_34.content)

				arg_103_1.text_.text = var_106_35

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_36 = 25
				local var_106_37 = utf8.len(var_106_35)
				local var_106_38 = var_106_36 <= 0 and var_106_32 or var_106_32 * (var_106_37 / var_106_36)

				if var_106_38 > 0 and var_106_32 < var_106_38 then
					arg_103_1.talkMaxDuration = var_106_38

					if var_106_38 + var_106_31 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_38 + var_106_31
					end
				end

				arg_103_1.text_.text = var_106_35
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291025", "story_v_out_114291.awb") ~= 0 then
					local var_106_39 = manager.audio:GetVoiceLength("story_v_out_114291", "114291025", "story_v_out_114291.awb") / 1000

					if var_106_39 + var_106_31 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_39 + var_106_31
					end

					if var_106_34.prefab_name ~= "" and arg_103_1.actors_[var_106_34.prefab_name] ~= nil then
						local var_106_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_34.prefab_name].transform, "story_v_out_114291", "114291025", "story_v_out_114291.awb")

						arg_103_1:RecordAudio("114291025", var_106_40)
						arg_103_1:RecordAudio("114291025", var_106_40)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_114291", "114291025", "story_v_out_114291.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_114291", "114291025", "story_v_out_114291.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_41 = math.max(var_106_32, arg_103_1.talkMaxDuration)

			if var_106_31 <= arg_103_1.time_ and arg_103_1.time_ < var_106_31 + var_106_41 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_31) / var_106_41

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_31 + var_106_41 and arg_103_1.time_ < var_106_31 + var_106_41 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play114291026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 114291026
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play114291027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["10016"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				local var_110_2 = var_110_0:GetComponent("Image")

				if var_110_2 then
					arg_107_1.var_.highlightMatValue10016 = var_110_2
				end
			end

			local var_110_3 = 0.034

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_3 then
				local var_110_4 = (arg_107_1.time_ - var_110_1) / var_110_3

				if arg_107_1.var_.highlightMatValue10016 then
					local var_110_5 = Mathf.Lerp(1, 0.5, var_110_4)
					local var_110_6 = arg_107_1.var_.highlightMatValue10016
					local var_110_7 = var_110_6.color

					var_110_7.r = var_110_5
					var_110_7.g = var_110_5
					var_110_7.b = var_110_5
					var_110_6.color = var_110_7
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_3 and arg_107_1.time_ < var_110_1 + var_110_3 + arg_110_0 and arg_107_1.var_.highlightMatValue10016 then
				local var_110_8 = 0.5
				local var_110_9 = arg_107_1.var_.highlightMatValue10016
				local var_110_10 = var_110_9.color

				var_110_10.r = var_110_8
				var_110_10.g = var_110_8
				var_110_10.b = var_110_8
				var_110_9.color = var_110_10
			end

			local var_110_11 = 0
			local var_110_12 = 1.2

			if var_110_11 < arg_107_1.time_ and arg_107_1.time_ <= var_110_11 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, false)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_13 = arg_107_1:GetWordFromCfg(114291026)
				local var_110_14 = arg_107_1:FormatText(var_110_13.content)

				arg_107_1.text_.text = var_110_14

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_15 = 48
				local var_110_16 = utf8.len(var_110_14)
				local var_110_17 = var_110_15 <= 0 and var_110_12 or var_110_12 * (var_110_16 / var_110_15)

				if var_110_17 > 0 and var_110_12 < var_110_17 then
					arg_107_1.talkMaxDuration = var_110_17

					if var_110_17 + var_110_11 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_17 + var_110_11
					end
				end

				arg_107_1.text_.text = var_110_14
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_18 = math.max(var_110_12, arg_107_1.talkMaxDuration)

			if var_110_11 <= arg_107_1.time_ and arg_107_1.time_ < var_110_11 + var_110_18 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_11) / var_110_18

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_11 + var_110_18 and arg_107_1.time_ < var_110_11 + var_110_18 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play114291027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 114291027
		arg_111_1.duration_ = 9.933

		local var_111_0 = {
			ja = 5.966,
			ko = 9.933,
			zh = 7.7,
			en = 7.5
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
				arg_111_0:Play114291028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["10015"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos10015 = var_114_0.localPosition
				var_114_0.localScale = Vector3.New(1, 1, 1)

				arg_111_1:CheckSpriteTmpPos("10015", 4)

				local var_114_2 = var_114_0.childCount

				for iter_114_0 = 0, var_114_2 - 1 do
					local var_114_3 = var_114_0:GetChild(iter_114_0)

					if var_114_3.name == "split_2" or not string.find(var_114_3.name, "split") then
						var_114_3.gameObject:SetActive(true)
					else
						var_114_3.gameObject:SetActive(false)
					end
				end
			end

			local var_114_4 = 0.001

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_4 then
				local var_114_5 = (arg_111_1.time_ - var_114_1) / var_114_4
				local var_114_6 = Vector3.New(390, -350, -180)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos10015, var_114_6, var_114_5)
			end

			if arg_111_1.time_ >= var_114_1 + var_114_4 and arg_111_1.time_ < var_114_1 + var_114_4 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_114_7 = arg_111_1.actors_["10015"]
			local var_114_8 = 0

			if var_114_8 < arg_111_1.time_ and arg_111_1.time_ <= var_114_8 + arg_114_0 and arg_111_1.var_.actorSpriteComps10015 == nil then
				arg_111_1.var_.actorSpriteComps10015 = var_114_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_9 = 0.034

			if var_114_8 <= arg_111_1.time_ and arg_111_1.time_ < var_114_8 + var_114_9 then
				local var_114_10 = (arg_111_1.time_ - var_114_8) / var_114_9

				if arg_111_1.var_.actorSpriteComps10015 then
					for iter_114_1, iter_114_2 in pairs(arg_111_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_114_2 then
							local var_114_11 = Mathf.Lerp(iter_114_2.color.r, 1, var_114_10)

							iter_114_2.color = Color.New(var_114_11, var_114_11, var_114_11)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_8 + var_114_9 and arg_111_1.time_ < var_114_8 + var_114_9 + arg_114_0 and arg_111_1.var_.actorSpriteComps10015 then
				local var_114_12 = 1

				for iter_114_3, iter_114_4 in pairs(arg_111_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_114_4 then
						iter_114_4.color = Color.New(var_114_12, var_114_12, var_114_12)
					end
				end

				arg_111_1.var_.actorSpriteComps10015 = nil
			end

			local var_114_13 = 0
			local var_114_14 = 0.7

			if var_114_13 < arg_111_1.time_ and arg_111_1.time_ <= var_114_13 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_15 = arg_111_1:FormatText(StoryNameCfg[208].name)

				arg_111_1.leftNameTxt_.text = var_114_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_16 = arg_111_1:GetWordFromCfg(114291027)
				local var_114_17 = arg_111_1:FormatText(var_114_16.content)

				arg_111_1.text_.text = var_114_17

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_18 = 28
				local var_114_19 = utf8.len(var_114_17)
				local var_114_20 = var_114_18 <= 0 and var_114_14 or var_114_14 * (var_114_19 / var_114_18)

				if var_114_20 > 0 and var_114_14 < var_114_20 then
					arg_111_1.talkMaxDuration = var_114_20

					if var_114_20 + var_114_13 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_20 + var_114_13
					end
				end

				arg_111_1.text_.text = var_114_17
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291027", "story_v_out_114291.awb") ~= 0 then
					local var_114_21 = manager.audio:GetVoiceLength("story_v_out_114291", "114291027", "story_v_out_114291.awb") / 1000

					if var_114_21 + var_114_13 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_21 + var_114_13
					end

					if var_114_16.prefab_name ~= "" and arg_111_1.actors_[var_114_16.prefab_name] ~= nil then
						local var_114_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_16.prefab_name].transform, "story_v_out_114291", "114291027", "story_v_out_114291.awb")

						arg_111_1:RecordAudio("114291027", var_114_22)
						arg_111_1:RecordAudio("114291027", var_114_22)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_114291", "114291027", "story_v_out_114291.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_114291", "114291027", "story_v_out_114291.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_23 = math.max(var_114_14, arg_111_1.talkMaxDuration)

			if var_114_13 <= arg_111_1.time_ and arg_111_1.time_ < var_114_13 + var_114_23 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_13) / var_114_23

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_13 + var_114_23 and arg_111_1.time_ < var_114_13 + var_114_23 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play114291028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 114291028
		arg_115_1.duration_ = 14.633

		local var_115_0 = {
			ja = 14.633,
			ko = 9.733,
			zh = 9.9,
			en = 9.4
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
				arg_115_0:Play114291029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["10015"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.actorSpriteComps10015 == nil then
				arg_115_1.var_.actorSpriteComps10015 = var_118_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_2 = 0.034

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.actorSpriteComps10015 then
					for iter_118_0, iter_118_1 in pairs(arg_115_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_118_1 then
							local var_118_4 = Mathf.Lerp(iter_118_1.color.r, 0.5, var_118_3)

							iter_118_1.color = Color.New(var_118_4, var_118_4, var_118_4)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.actorSpriteComps10015 then
				local var_118_5 = 0.5

				for iter_118_2, iter_118_3 in pairs(arg_115_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_118_3 then
						iter_118_3.color = Color.New(var_118_5, var_118_5, var_118_5)
					end
				end

				arg_115_1.var_.actorSpriteComps10015 = nil
			end

			local var_118_6 = arg_115_1.actors_["10016"]
			local var_118_7 = 0

			if var_118_7 < arg_115_1.time_ and arg_115_1.time_ <= var_118_7 + arg_118_0 then
				local var_118_8 = var_118_6:GetComponent("Image")

				if var_118_8 then
					arg_115_1.var_.highlightMatValue10016 = var_118_8
				end
			end

			local var_118_9 = 0.034

			if var_118_7 <= arg_115_1.time_ and arg_115_1.time_ < var_118_7 + var_118_9 then
				local var_118_10 = (arg_115_1.time_ - var_118_7) / var_118_9

				if arg_115_1.var_.highlightMatValue10016 then
					local var_118_11 = Mathf.Lerp(0.5, 1, var_118_10)
					local var_118_12 = arg_115_1.var_.highlightMatValue10016
					local var_118_13 = var_118_12.color

					var_118_13.r = var_118_11
					var_118_13.g = var_118_11
					var_118_13.b = var_118_11
					var_118_12.color = var_118_13
				end
			end

			if arg_115_1.time_ >= var_118_7 + var_118_9 and arg_115_1.time_ < var_118_7 + var_118_9 + arg_118_0 and arg_115_1.var_.highlightMatValue10016 then
				local var_118_14 = 1

				var_118_6.transform:SetSiblingIndex(1)

				local var_118_15 = arg_115_1.var_.highlightMatValue10016
				local var_118_16 = var_118_15.color

				var_118_16.r = var_118_14
				var_118_16.g = var_118_14
				var_118_16.b = var_118_14
				var_118_15.color = var_118_16
			end

			local var_118_17 = 0
			local var_118_18 = 0.875

			if var_118_17 < arg_115_1.time_ and arg_115_1.time_ <= var_118_17 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_19 = arg_115_1:FormatText(StoryNameCfg[226].name)

				arg_115_1.leftNameTxt_.text = var_118_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_20 = arg_115_1:GetWordFromCfg(114291028)
				local var_118_21 = arg_115_1:FormatText(var_118_20.content)

				arg_115_1.text_.text = var_118_21

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_22 = 35
				local var_118_23 = utf8.len(var_118_21)
				local var_118_24 = var_118_22 <= 0 and var_118_18 or var_118_18 * (var_118_23 / var_118_22)

				if var_118_24 > 0 and var_118_18 < var_118_24 then
					arg_115_1.talkMaxDuration = var_118_24

					if var_118_24 + var_118_17 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_24 + var_118_17
					end
				end

				arg_115_1.text_.text = var_118_21
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291028", "story_v_out_114291.awb") ~= 0 then
					local var_118_25 = manager.audio:GetVoiceLength("story_v_out_114291", "114291028", "story_v_out_114291.awb") / 1000

					if var_118_25 + var_118_17 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_25 + var_118_17
					end

					if var_118_20.prefab_name ~= "" and arg_115_1.actors_[var_118_20.prefab_name] ~= nil then
						local var_118_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_20.prefab_name].transform, "story_v_out_114291", "114291028", "story_v_out_114291.awb")

						arg_115_1:RecordAudio("114291028", var_118_26)
						arg_115_1:RecordAudio("114291028", var_118_26)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_114291", "114291028", "story_v_out_114291.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_114291", "114291028", "story_v_out_114291.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_27 = math.max(var_118_18, arg_115_1.talkMaxDuration)

			if var_118_17 <= arg_115_1.time_ and arg_115_1.time_ < var_118_17 + var_118_27 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_17) / var_118_27

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_17 + var_118_27 and arg_115_1.time_ < var_118_17 + var_118_27 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play114291029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 114291029
		arg_119_1.duration_ = 10.1

		local var_119_0 = {
			ja = 6.8,
			ko = 8.566,
			zh = 10.1,
			en = 7.233
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
				arg_119_0:Play114291030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["10015"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos10015 = var_122_0.localPosition
				var_122_0.localScale = Vector3.New(1, 1, 1)

				arg_119_1:CheckSpriteTmpPos("10015", 4)

				local var_122_2 = var_122_0.childCount

				for iter_122_0 = 0, var_122_2 - 1 do
					local var_122_3 = var_122_0:GetChild(iter_122_0)

					if var_122_3.name == "split_1" or not string.find(var_122_3.name, "split") then
						var_122_3.gameObject:SetActive(true)
					else
						var_122_3.gameObject:SetActive(false)
					end
				end
			end

			local var_122_4 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_4 then
				local var_122_5 = (arg_119_1.time_ - var_122_1) / var_122_4
				local var_122_6 = Vector3.New(390, -350, -180)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos10015, var_122_6, var_122_5)
			end

			if arg_119_1.time_ >= var_122_1 + var_122_4 and arg_119_1.time_ < var_122_1 + var_122_4 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_122_7 = arg_119_1.actors_["10015"]
			local var_122_8 = 0

			if var_122_8 < arg_119_1.time_ and arg_119_1.time_ <= var_122_8 + arg_122_0 and arg_119_1.var_.actorSpriteComps10015 == nil then
				arg_119_1.var_.actorSpriteComps10015 = var_122_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_9 = 0.034

			if var_122_8 <= arg_119_1.time_ and arg_119_1.time_ < var_122_8 + var_122_9 then
				local var_122_10 = (arg_119_1.time_ - var_122_8) / var_122_9

				if arg_119_1.var_.actorSpriteComps10015 then
					for iter_122_1, iter_122_2 in pairs(arg_119_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_122_2 then
							local var_122_11 = Mathf.Lerp(iter_122_2.color.r, 1, var_122_10)

							iter_122_2.color = Color.New(var_122_11, var_122_11, var_122_11)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_8 + var_122_9 and arg_119_1.time_ < var_122_8 + var_122_9 + arg_122_0 and arg_119_1.var_.actorSpriteComps10015 then
				local var_122_12 = 1

				for iter_122_3, iter_122_4 in pairs(arg_119_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_122_4 then
						iter_122_4.color = Color.New(var_122_12, var_122_12, var_122_12)
					end
				end

				arg_119_1.var_.actorSpriteComps10015 = nil
			end

			local var_122_13 = arg_119_1.actors_["10016"]
			local var_122_14 = 0

			if var_122_14 < arg_119_1.time_ and arg_119_1.time_ <= var_122_14 + arg_122_0 then
				local var_122_15 = var_122_13:GetComponent("Image")

				if var_122_15 then
					arg_119_1.var_.highlightMatValue10016 = var_122_15
				end
			end

			local var_122_16 = 0.034

			if var_122_14 <= arg_119_1.time_ and arg_119_1.time_ < var_122_14 + var_122_16 then
				local var_122_17 = (arg_119_1.time_ - var_122_14) / var_122_16

				if arg_119_1.var_.highlightMatValue10016 then
					local var_122_18 = Mathf.Lerp(1, 0.5, var_122_17)
					local var_122_19 = arg_119_1.var_.highlightMatValue10016
					local var_122_20 = var_122_19.color

					var_122_20.r = var_122_18
					var_122_20.g = var_122_18
					var_122_20.b = var_122_18
					var_122_19.color = var_122_20
				end
			end

			if arg_119_1.time_ >= var_122_14 + var_122_16 and arg_119_1.time_ < var_122_14 + var_122_16 + arg_122_0 and arg_119_1.var_.highlightMatValue10016 then
				local var_122_21 = 0.5
				local var_122_22 = arg_119_1.var_.highlightMatValue10016
				local var_122_23 = var_122_22.color

				var_122_23.r = var_122_21
				var_122_23.g = var_122_21
				var_122_23.b = var_122_21
				var_122_22.color = var_122_23
			end

			local var_122_24 = 0
			local var_122_25 = 0.925

			if var_122_24 < arg_119_1.time_ and arg_119_1.time_ <= var_122_24 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_26 = arg_119_1:FormatText(StoryNameCfg[208].name)

				arg_119_1.leftNameTxt_.text = var_122_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_27 = arg_119_1:GetWordFromCfg(114291029)
				local var_122_28 = arg_119_1:FormatText(var_122_27.content)

				arg_119_1.text_.text = var_122_28

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_29 = 37
				local var_122_30 = utf8.len(var_122_28)
				local var_122_31 = var_122_29 <= 0 and var_122_25 or var_122_25 * (var_122_30 / var_122_29)

				if var_122_31 > 0 and var_122_25 < var_122_31 then
					arg_119_1.talkMaxDuration = var_122_31

					if var_122_31 + var_122_24 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_31 + var_122_24
					end
				end

				arg_119_1.text_.text = var_122_28
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291029", "story_v_out_114291.awb") ~= 0 then
					local var_122_32 = manager.audio:GetVoiceLength("story_v_out_114291", "114291029", "story_v_out_114291.awb") / 1000

					if var_122_32 + var_122_24 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_32 + var_122_24
					end

					if var_122_27.prefab_name ~= "" and arg_119_1.actors_[var_122_27.prefab_name] ~= nil then
						local var_122_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_27.prefab_name].transform, "story_v_out_114291", "114291029", "story_v_out_114291.awb")

						arg_119_1:RecordAudio("114291029", var_122_33)
						arg_119_1:RecordAudio("114291029", var_122_33)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_114291", "114291029", "story_v_out_114291.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_114291", "114291029", "story_v_out_114291.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_34 = math.max(var_122_25, arg_119_1.talkMaxDuration)

			if var_122_24 <= arg_119_1.time_ and arg_119_1.time_ < var_122_24 + var_122_34 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_24) / var_122_34

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_24 + var_122_34 and arg_119_1.time_ < var_122_24 + var_122_34 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play114291030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 114291030
		arg_123_1.duration_ = 2.1

		local var_123_0 = {
			ja = 1.633,
			ko = 2.1,
			zh = 1.233,
			en = 1
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
				arg_123_0:Play114291031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["10015"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.actorSpriteComps10015 == nil then
				arg_123_1.var_.actorSpriteComps10015 = var_126_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_2 = 0.034

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.actorSpriteComps10015 then
					for iter_126_0, iter_126_1 in pairs(arg_123_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_126_1 then
							local var_126_4 = Mathf.Lerp(iter_126_1.color.r, 0.5, var_126_3)

							iter_126_1.color = Color.New(var_126_4, var_126_4, var_126_4)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.actorSpriteComps10015 then
				local var_126_5 = 0.5

				for iter_126_2, iter_126_3 in pairs(arg_123_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_126_3 then
						iter_126_3.color = Color.New(var_126_5, var_126_5, var_126_5)
					end
				end

				arg_123_1.var_.actorSpriteComps10015 = nil
			end

			local var_126_6 = arg_123_1.actors_["10016"]
			local var_126_7 = 0

			if var_126_7 < arg_123_1.time_ and arg_123_1.time_ <= var_126_7 + arg_126_0 then
				local var_126_8 = var_126_6:GetComponent("Image")

				if var_126_8 then
					arg_123_1.var_.highlightMatValue10016 = var_126_8
				end
			end

			local var_126_9 = 0.034

			if var_126_7 <= arg_123_1.time_ and arg_123_1.time_ < var_126_7 + var_126_9 then
				local var_126_10 = (arg_123_1.time_ - var_126_7) / var_126_9

				if arg_123_1.var_.highlightMatValue10016 then
					local var_126_11 = Mathf.Lerp(0.5, 1, var_126_10)
					local var_126_12 = arg_123_1.var_.highlightMatValue10016
					local var_126_13 = var_126_12.color

					var_126_13.r = var_126_11
					var_126_13.g = var_126_11
					var_126_13.b = var_126_11
					var_126_12.color = var_126_13
				end
			end

			if arg_123_1.time_ >= var_126_7 + var_126_9 and arg_123_1.time_ < var_126_7 + var_126_9 + arg_126_0 and arg_123_1.var_.highlightMatValue10016 then
				local var_126_14 = 1

				var_126_6.transform:SetSiblingIndex(1)

				local var_126_15 = arg_123_1.var_.highlightMatValue10016
				local var_126_16 = var_126_15.color

				var_126_16.r = var_126_14
				var_126_16.g = var_126_14
				var_126_16.b = var_126_14
				var_126_15.color = var_126_16
			end

			local var_126_17 = 0
			local var_126_18 = 0.075

			if var_126_17 < arg_123_1.time_ and arg_123_1.time_ <= var_126_17 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_19 = arg_123_1:FormatText(StoryNameCfg[226].name)

				arg_123_1.leftNameTxt_.text = var_126_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_20 = arg_123_1:GetWordFromCfg(114291030)
				local var_126_21 = arg_123_1:FormatText(var_126_20.content)

				arg_123_1.text_.text = var_126_21

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_22 = 3
				local var_126_23 = utf8.len(var_126_21)
				local var_126_24 = var_126_22 <= 0 and var_126_18 or var_126_18 * (var_126_23 / var_126_22)

				if var_126_24 > 0 and var_126_18 < var_126_24 then
					arg_123_1.talkMaxDuration = var_126_24

					if var_126_24 + var_126_17 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_24 + var_126_17
					end
				end

				arg_123_1.text_.text = var_126_21
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291030", "story_v_out_114291.awb") ~= 0 then
					local var_126_25 = manager.audio:GetVoiceLength("story_v_out_114291", "114291030", "story_v_out_114291.awb") / 1000

					if var_126_25 + var_126_17 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_25 + var_126_17
					end

					if var_126_20.prefab_name ~= "" and arg_123_1.actors_[var_126_20.prefab_name] ~= nil then
						local var_126_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_20.prefab_name].transform, "story_v_out_114291", "114291030", "story_v_out_114291.awb")

						arg_123_1:RecordAudio("114291030", var_126_26)
						arg_123_1:RecordAudio("114291030", var_126_26)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_114291", "114291030", "story_v_out_114291.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_114291", "114291030", "story_v_out_114291.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_27 = math.max(var_126_18, arg_123_1.talkMaxDuration)

			if var_126_17 <= arg_123_1.time_ and arg_123_1.time_ < var_126_17 + var_126_27 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_17) / var_126_27

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_17 + var_126_27 and arg_123_1.time_ < var_126_17 + var_126_27 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play114291031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 114291031
		arg_127_1.duration_ = 3.733

		local var_127_0 = {
			ja = 3.733,
			ko = 3.2,
			zh = 3.333,
			en = 1.866
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
				arg_127_0:Play114291032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["10015"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.actorSpriteComps10015 == nil then
				arg_127_1.var_.actorSpriteComps10015 = var_130_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_130_2 = 0.034

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.actorSpriteComps10015 then
					for iter_130_0, iter_130_1 in pairs(arg_127_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_130_1 then
							local var_130_4 = Mathf.Lerp(iter_130_1.color.r, 1, var_130_3)

							iter_130_1.color = Color.New(var_130_4, var_130_4, var_130_4)
						end
					end
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.actorSpriteComps10015 then
				local var_130_5 = 1

				for iter_130_2, iter_130_3 in pairs(arg_127_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_130_3 then
						iter_130_3.color = Color.New(var_130_5, var_130_5, var_130_5)
					end
				end

				arg_127_1.var_.actorSpriteComps10015 = nil
			end

			local var_130_6 = arg_127_1.actors_["10016"]
			local var_130_7 = 0

			if var_130_7 < arg_127_1.time_ and arg_127_1.time_ <= var_130_7 + arg_130_0 then
				local var_130_8 = var_130_6:GetComponent("Image")

				if var_130_8 then
					arg_127_1.var_.highlightMatValue10016 = var_130_8
				end
			end

			local var_130_9 = 0.034

			if var_130_7 <= arg_127_1.time_ and arg_127_1.time_ < var_130_7 + var_130_9 then
				local var_130_10 = (arg_127_1.time_ - var_130_7) / var_130_9

				if arg_127_1.var_.highlightMatValue10016 then
					local var_130_11 = Mathf.Lerp(1, 0.5, var_130_10)
					local var_130_12 = arg_127_1.var_.highlightMatValue10016
					local var_130_13 = var_130_12.color

					var_130_13.r = var_130_11
					var_130_13.g = var_130_11
					var_130_13.b = var_130_11
					var_130_12.color = var_130_13
				end
			end

			if arg_127_1.time_ >= var_130_7 + var_130_9 and arg_127_1.time_ < var_130_7 + var_130_9 + arg_130_0 and arg_127_1.var_.highlightMatValue10016 then
				local var_130_14 = 0.5
				local var_130_15 = arg_127_1.var_.highlightMatValue10016
				local var_130_16 = var_130_15.color

				var_130_16.r = var_130_14
				var_130_16.g = var_130_14
				var_130_16.b = var_130_14
				var_130_15.color = var_130_16
			end

			local var_130_17 = 0
			local var_130_18 = 0.25

			if var_130_17 < arg_127_1.time_ and arg_127_1.time_ <= var_130_17 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_19 = arg_127_1:FormatText(StoryNameCfg[208].name)

				arg_127_1.leftNameTxt_.text = var_130_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_20 = arg_127_1:GetWordFromCfg(114291031)
				local var_130_21 = arg_127_1:FormatText(var_130_20.content)

				arg_127_1.text_.text = var_130_21

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_22 = 10
				local var_130_23 = utf8.len(var_130_21)
				local var_130_24 = var_130_22 <= 0 and var_130_18 or var_130_18 * (var_130_23 / var_130_22)

				if var_130_24 > 0 and var_130_18 < var_130_24 then
					arg_127_1.talkMaxDuration = var_130_24

					if var_130_24 + var_130_17 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_24 + var_130_17
					end
				end

				arg_127_1.text_.text = var_130_21
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291031", "story_v_out_114291.awb") ~= 0 then
					local var_130_25 = manager.audio:GetVoiceLength("story_v_out_114291", "114291031", "story_v_out_114291.awb") / 1000

					if var_130_25 + var_130_17 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_25 + var_130_17
					end

					if var_130_20.prefab_name ~= "" and arg_127_1.actors_[var_130_20.prefab_name] ~= nil then
						local var_130_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_20.prefab_name].transform, "story_v_out_114291", "114291031", "story_v_out_114291.awb")

						arg_127_1:RecordAudio("114291031", var_130_26)
						arg_127_1:RecordAudio("114291031", var_130_26)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_114291", "114291031", "story_v_out_114291.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_114291", "114291031", "story_v_out_114291.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_27 = math.max(var_130_18, arg_127_1.talkMaxDuration)

			if var_130_17 <= arg_127_1.time_ and arg_127_1.time_ < var_130_17 + var_130_27 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_17) / var_130_27

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_17 + var_130_27 and arg_127_1.time_ < var_130_17 + var_130_27 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play114291032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 114291032
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play114291033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["10015"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.actorSpriteComps10015 == nil then
				arg_131_1.var_.actorSpriteComps10015 = var_134_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_134_2 = 0.034

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.actorSpriteComps10015 then
					for iter_134_0, iter_134_1 in pairs(arg_131_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_134_1 then
							local var_134_4 = Mathf.Lerp(iter_134_1.color.r, 0.5, var_134_3)

							iter_134_1.color = Color.New(var_134_4, var_134_4, var_134_4)
						end
					end
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.actorSpriteComps10015 then
				local var_134_5 = 0.5

				for iter_134_2, iter_134_3 in pairs(arg_131_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_134_3 then
						iter_134_3.color = Color.New(var_134_5, var_134_5, var_134_5)
					end
				end

				arg_131_1.var_.actorSpriteComps10015 = nil
			end

			local var_134_6 = 0
			local var_134_7 = 0.8

			if var_134_6 < arg_131_1.time_ and arg_131_1.time_ <= var_134_6 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_8 = arg_131_1:GetWordFromCfg(114291032)
				local var_134_9 = arg_131_1:FormatText(var_134_8.content)

				arg_131_1.text_.text = var_134_9

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_10 = 32
				local var_134_11 = utf8.len(var_134_9)
				local var_134_12 = var_134_10 <= 0 and var_134_7 or var_134_7 * (var_134_11 / var_134_10)

				if var_134_12 > 0 and var_134_7 < var_134_12 then
					arg_131_1.talkMaxDuration = var_134_12

					if var_134_12 + var_134_6 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_12 + var_134_6
					end
				end

				arg_131_1.text_.text = var_134_9
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_13 = math.max(var_134_7, arg_131_1.talkMaxDuration)

			if var_134_6 <= arg_131_1.time_ and arg_131_1.time_ < var_134_6 + var_134_13 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_6) / var_134_13

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_6 + var_134_13 and arg_131_1.time_ < var_134_6 + var_134_13 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play114291033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 114291033
		arg_135_1.duration_ = 4.1

		local var_135_0 = {
			ja = 4.1,
			ko = 3,
			zh = 2.133,
			en = 2.933
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
				arg_135_0:Play114291034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["10015"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.actorSpriteComps10015 == nil then
				arg_135_1.var_.actorSpriteComps10015 = var_138_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_138_2 = 0.034

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.actorSpriteComps10015 then
					for iter_138_0, iter_138_1 in pairs(arg_135_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_138_1 then
							local var_138_4 = Mathf.Lerp(iter_138_1.color.r, 1, var_138_3)

							iter_138_1.color = Color.New(var_138_4, var_138_4, var_138_4)
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.actorSpriteComps10015 then
				local var_138_5 = 1

				for iter_138_2, iter_138_3 in pairs(arg_135_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_138_3 then
						iter_138_3.color = Color.New(var_138_5, var_138_5, var_138_5)
					end
				end

				arg_135_1.var_.actorSpriteComps10015 = nil
			end

			local var_138_6 = arg_135_1.actors_["10015"].transform
			local var_138_7 = 0

			if var_138_7 < arg_135_1.time_ and arg_135_1.time_ <= var_138_7 + arg_138_0 then
				arg_135_1.var_.moveOldPos10015 = var_138_6.localPosition
				var_138_6.localScale = Vector3.New(1, 1, 1)

				arg_135_1:CheckSpriteTmpPos("10015", 4)

				local var_138_8 = var_138_6.childCount

				for iter_138_4 = 0, var_138_8 - 1 do
					local var_138_9 = var_138_6:GetChild(iter_138_4)

					if var_138_9.name == "split_5" or not string.find(var_138_9.name, "split") then
						var_138_9.gameObject:SetActive(true)
					else
						var_138_9.gameObject:SetActive(false)
					end
				end
			end

			local var_138_10 = 0.001

			if var_138_7 <= arg_135_1.time_ and arg_135_1.time_ < var_138_7 + var_138_10 then
				local var_138_11 = (arg_135_1.time_ - var_138_7) / var_138_10
				local var_138_12 = Vector3.New(390, -350, -180)

				var_138_6.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos10015, var_138_12, var_138_11)
			end

			if arg_135_1.time_ >= var_138_7 + var_138_10 and arg_135_1.time_ < var_138_7 + var_138_10 + arg_138_0 then
				var_138_6.localPosition = Vector3.New(390, -350, -180)
			end

			local var_138_13 = 0
			local var_138_14 = 0.2

			if var_138_13 < arg_135_1.time_ and arg_135_1.time_ <= var_138_13 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_15 = arg_135_1:FormatText(StoryNameCfg[208].name)

				arg_135_1.leftNameTxt_.text = var_138_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_16 = arg_135_1:GetWordFromCfg(114291033)
				local var_138_17 = arg_135_1:FormatText(var_138_16.content)

				arg_135_1.text_.text = var_138_17

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_18 = 8
				local var_138_19 = utf8.len(var_138_17)
				local var_138_20 = var_138_18 <= 0 and var_138_14 or var_138_14 * (var_138_19 / var_138_18)

				if var_138_20 > 0 and var_138_14 < var_138_20 then
					arg_135_1.talkMaxDuration = var_138_20

					if var_138_20 + var_138_13 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_20 + var_138_13
					end
				end

				arg_135_1.text_.text = var_138_17
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291033", "story_v_out_114291.awb") ~= 0 then
					local var_138_21 = manager.audio:GetVoiceLength("story_v_out_114291", "114291033", "story_v_out_114291.awb") / 1000

					if var_138_21 + var_138_13 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_21 + var_138_13
					end

					if var_138_16.prefab_name ~= "" and arg_135_1.actors_[var_138_16.prefab_name] ~= nil then
						local var_138_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_16.prefab_name].transform, "story_v_out_114291", "114291033", "story_v_out_114291.awb")

						arg_135_1:RecordAudio("114291033", var_138_22)
						arg_135_1:RecordAudio("114291033", var_138_22)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_114291", "114291033", "story_v_out_114291.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_114291", "114291033", "story_v_out_114291.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_23 = math.max(var_138_14, arg_135_1.talkMaxDuration)

			if var_138_13 <= arg_135_1.time_ and arg_135_1.time_ < var_138_13 + var_138_23 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_13) / var_138_23

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_13 + var_138_23 and arg_135_1.time_ < var_138_13 + var_138_23 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play114291034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 114291034
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play114291035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["10015"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.actorSpriteComps10015 == nil then
				arg_139_1.var_.actorSpriteComps10015 = var_142_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_142_2 = 0.034

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.actorSpriteComps10015 then
					for iter_142_0, iter_142_1 in pairs(arg_139_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_142_1 then
							local var_142_4 = Mathf.Lerp(iter_142_1.color.r, 0.5, var_142_3)

							iter_142_1.color = Color.New(var_142_4, var_142_4, var_142_4)
						end
					end
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.actorSpriteComps10015 then
				local var_142_5 = 0.5

				for iter_142_2, iter_142_3 in pairs(arg_139_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_142_3 then
						iter_142_3.color = Color.New(var_142_5, var_142_5, var_142_5)
					end
				end

				arg_139_1.var_.actorSpriteComps10015 = nil
			end

			local var_142_6 = 0
			local var_142_7 = 1.85

			if var_142_6 < arg_139_1.time_ and arg_139_1.time_ <= var_142_6 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, false)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_8 = arg_139_1:GetWordFromCfg(114291034)
				local var_142_9 = arg_139_1:FormatText(var_142_8.content)

				arg_139_1.text_.text = var_142_9

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_10 = 74
				local var_142_11 = utf8.len(var_142_9)
				local var_142_12 = var_142_10 <= 0 and var_142_7 or var_142_7 * (var_142_11 / var_142_10)

				if var_142_12 > 0 and var_142_7 < var_142_12 then
					arg_139_1.talkMaxDuration = var_142_12

					if var_142_12 + var_142_6 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_12 + var_142_6
					end
				end

				arg_139_1.text_.text = var_142_9
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_13 = math.max(var_142_7, arg_139_1.talkMaxDuration)

			if var_142_6 <= arg_139_1.time_ and arg_139_1.time_ < var_142_6 + var_142_13 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_6) / var_142_13

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_6 + var_142_13 and arg_139_1.time_ < var_142_6 + var_142_13 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play114291035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 114291035
		arg_143_1.duration_ = 14.333

		local var_143_0 = {
			ja = 14.333,
			ko = 11.033,
			zh = 10.033,
			en = 9.9
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
				arg_143_0:Play114291036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["10015"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.actorSpriteComps10015 == nil then
				arg_143_1.var_.actorSpriteComps10015 = var_146_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_146_2 = 0.034

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.actorSpriteComps10015 then
					for iter_146_0, iter_146_1 in pairs(arg_143_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_146_1 then
							local var_146_4 = Mathf.Lerp(iter_146_1.color.r, 1, var_146_3)

							iter_146_1.color = Color.New(var_146_4, var_146_4, var_146_4)
						end
					end
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.actorSpriteComps10015 then
				local var_146_5 = 1

				for iter_146_2, iter_146_3 in pairs(arg_143_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_146_3 then
						iter_146_3.color = Color.New(var_146_5, var_146_5, var_146_5)
					end
				end

				arg_143_1.var_.actorSpriteComps10015 = nil
			end

			local var_146_6 = 0
			local var_146_7 = 1.15

			if var_146_6 < arg_143_1.time_ and arg_143_1.time_ <= var_146_6 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_8 = arg_143_1:FormatText(StoryNameCfg[208].name)

				arg_143_1.leftNameTxt_.text = var_146_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_9 = arg_143_1:GetWordFromCfg(114291035)
				local var_146_10 = arg_143_1:FormatText(var_146_9.content)

				arg_143_1.text_.text = var_146_10

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_11 = 46
				local var_146_12 = utf8.len(var_146_10)
				local var_146_13 = var_146_11 <= 0 and var_146_7 or var_146_7 * (var_146_12 / var_146_11)

				if var_146_13 > 0 and var_146_7 < var_146_13 then
					arg_143_1.talkMaxDuration = var_146_13

					if var_146_13 + var_146_6 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_13 + var_146_6
					end
				end

				arg_143_1.text_.text = var_146_10
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291035", "story_v_out_114291.awb") ~= 0 then
					local var_146_14 = manager.audio:GetVoiceLength("story_v_out_114291", "114291035", "story_v_out_114291.awb") / 1000

					if var_146_14 + var_146_6 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_14 + var_146_6
					end

					if var_146_9.prefab_name ~= "" and arg_143_1.actors_[var_146_9.prefab_name] ~= nil then
						local var_146_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_9.prefab_name].transform, "story_v_out_114291", "114291035", "story_v_out_114291.awb")

						arg_143_1:RecordAudio("114291035", var_146_15)
						arg_143_1:RecordAudio("114291035", var_146_15)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_114291", "114291035", "story_v_out_114291.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_114291", "114291035", "story_v_out_114291.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_16 = math.max(var_146_7, arg_143_1.talkMaxDuration)

			if var_146_6 <= arg_143_1.time_ and arg_143_1.time_ < var_146_6 + var_146_16 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_6) / var_146_16

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_6 + var_146_16 and arg_143_1.time_ < var_146_6 + var_146_16 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play114291036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 114291036
		arg_147_1.duration_ = 9.966

		local var_147_0 = {
			ja = 8.133,
			ko = 5.333,
			zh = 9.966,
			en = 7.333
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
				arg_147_0:Play114291037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["10015"]
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 and arg_147_1.var_.actorSpriteComps10015 == nil then
				arg_147_1.var_.actorSpriteComps10015 = var_150_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_150_2 = 0.034

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2

				if arg_147_1.var_.actorSpriteComps10015 then
					for iter_150_0, iter_150_1 in pairs(arg_147_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_150_1 then
							local var_150_4 = Mathf.Lerp(iter_150_1.color.r, 0.5, var_150_3)

							iter_150_1.color = Color.New(var_150_4, var_150_4, var_150_4)
						end
					end
				end
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 and arg_147_1.var_.actorSpriteComps10015 then
				local var_150_5 = 0.5

				for iter_150_2, iter_150_3 in pairs(arg_147_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_150_3 then
						iter_150_3.color = Color.New(var_150_5, var_150_5, var_150_5)
					end
				end

				arg_147_1.var_.actorSpriteComps10015 = nil
			end

			local var_150_6 = arg_147_1.actors_["10016"]
			local var_150_7 = 0

			if var_150_7 < arg_147_1.time_ and arg_147_1.time_ <= var_150_7 + arg_150_0 then
				local var_150_8 = var_150_6:GetComponent("Image")

				if var_150_8 then
					arg_147_1.var_.highlightMatValue10016 = var_150_8
				end
			end

			local var_150_9 = 0.034

			if var_150_7 <= arg_147_1.time_ and arg_147_1.time_ < var_150_7 + var_150_9 then
				local var_150_10 = (arg_147_1.time_ - var_150_7) / var_150_9

				if arg_147_1.var_.highlightMatValue10016 then
					local var_150_11 = Mathf.Lerp(0.5, 1, var_150_10)
					local var_150_12 = arg_147_1.var_.highlightMatValue10016
					local var_150_13 = var_150_12.color

					var_150_13.r = var_150_11
					var_150_13.g = var_150_11
					var_150_13.b = var_150_11
					var_150_12.color = var_150_13
				end
			end

			if arg_147_1.time_ >= var_150_7 + var_150_9 and arg_147_1.time_ < var_150_7 + var_150_9 + arg_150_0 and arg_147_1.var_.highlightMatValue10016 then
				local var_150_14 = 1

				var_150_6.transform:SetSiblingIndex(1)

				local var_150_15 = arg_147_1.var_.highlightMatValue10016
				local var_150_16 = var_150_15.color

				var_150_16.r = var_150_14
				var_150_16.g = var_150_14
				var_150_16.b = var_150_14
				var_150_15.color = var_150_16
			end

			local var_150_17 = 0
			local var_150_18 = 0.625

			if var_150_17 < arg_147_1.time_ and arg_147_1.time_ <= var_150_17 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_19 = arg_147_1:FormatText(StoryNameCfg[226].name)

				arg_147_1.leftNameTxt_.text = var_150_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_20 = arg_147_1:GetWordFromCfg(114291036)
				local var_150_21 = arg_147_1:FormatText(var_150_20.content)

				arg_147_1.text_.text = var_150_21

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_22 = 25
				local var_150_23 = utf8.len(var_150_21)
				local var_150_24 = var_150_22 <= 0 and var_150_18 or var_150_18 * (var_150_23 / var_150_22)

				if var_150_24 > 0 and var_150_18 < var_150_24 then
					arg_147_1.talkMaxDuration = var_150_24

					if var_150_24 + var_150_17 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_24 + var_150_17
					end
				end

				arg_147_1.text_.text = var_150_21
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291036", "story_v_out_114291.awb") ~= 0 then
					local var_150_25 = manager.audio:GetVoiceLength("story_v_out_114291", "114291036", "story_v_out_114291.awb") / 1000

					if var_150_25 + var_150_17 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_25 + var_150_17
					end

					if var_150_20.prefab_name ~= "" and arg_147_1.actors_[var_150_20.prefab_name] ~= nil then
						local var_150_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_20.prefab_name].transform, "story_v_out_114291", "114291036", "story_v_out_114291.awb")

						arg_147_1:RecordAudio("114291036", var_150_26)
						arg_147_1:RecordAudio("114291036", var_150_26)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_114291", "114291036", "story_v_out_114291.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_114291", "114291036", "story_v_out_114291.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_27 = math.max(var_150_18, arg_147_1.talkMaxDuration)

			if var_150_17 <= arg_147_1.time_ and arg_147_1.time_ < var_150_17 + var_150_27 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_17) / var_150_27

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_17 + var_150_27 and arg_147_1.time_ < var_150_17 + var_150_27 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play114291037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 114291037
		arg_151_1.duration_ = 11.066

		local var_151_0 = {
			ja = 11.066,
			ko = 10.6,
			zh = 10.4,
			en = 10.9
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
				arg_151_0:Play114291038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["10015"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.actorSpriteComps10015 == nil then
				arg_151_1.var_.actorSpriteComps10015 = var_154_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_2 = 0.034

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.actorSpriteComps10015 then
					for iter_154_0, iter_154_1 in pairs(arg_151_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_154_1 then
							local var_154_4 = Mathf.Lerp(iter_154_1.color.r, 1, var_154_3)

							iter_154_1.color = Color.New(var_154_4, var_154_4, var_154_4)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.actorSpriteComps10015 then
				local var_154_5 = 1

				for iter_154_2, iter_154_3 in pairs(arg_151_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_154_3 then
						iter_154_3.color = Color.New(var_154_5, var_154_5, var_154_5)
					end
				end

				arg_151_1.var_.actorSpriteComps10015 = nil
			end

			local var_154_6 = arg_151_1.actors_["10016"]
			local var_154_7 = 0

			if var_154_7 < arg_151_1.time_ and arg_151_1.time_ <= var_154_7 + arg_154_0 then
				local var_154_8 = var_154_6:GetComponent("Image")

				if var_154_8 then
					arg_151_1.var_.highlightMatValue10016 = var_154_8
				end
			end

			local var_154_9 = 0.034

			if var_154_7 <= arg_151_1.time_ and arg_151_1.time_ < var_154_7 + var_154_9 then
				local var_154_10 = (arg_151_1.time_ - var_154_7) / var_154_9

				if arg_151_1.var_.highlightMatValue10016 then
					local var_154_11 = Mathf.Lerp(1, 0.5, var_154_10)
					local var_154_12 = arg_151_1.var_.highlightMatValue10016
					local var_154_13 = var_154_12.color

					var_154_13.r = var_154_11
					var_154_13.g = var_154_11
					var_154_13.b = var_154_11
					var_154_12.color = var_154_13
				end
			end

			if arg_151_1.time_ >= var_154_7 + var_154_9 and arg_151_1.time_ < var_154_7 + var_154_9 + arg_154_0 and arg_151_1.var_.highlightMatValue10016 then
				local var_154_14 = 0.5
				local var_154_15 = arg_151_1.var_.highlightMatValue10016
				local var_154_16 = var_154_15.color

				var_154_16.r = var_154_14
				var_154_16.g = var_154_14
				var_154_16.b = var_154_14
				var_154_15.color = var_154_16
			end

			local var_154_17 = arg_151_1.actors_["10015"].transform
			local var_154_18 = 0

			if var_154_18 < arg_151_1.time_ and arg_151_1.time_ <= var_154_18 + arg_154_0 then
				arg_151_1.var_.moveOldPos10015 = var_154_17.localPosition
				var_154_17.localScale = Vector3.New(1, 1, 1)

				arg_151_1:CheckSpriteTmpPos("10015", 4)

				local var_154_19 = var_154_17.childCount

				for iter_154_4 = 0, var_154_19 - 1 do
					local var_154_20 = var_154_17:GetChild(iter_154_4)

					if var_154_20.name == "split_1" or not string.find(var_154_20.name, "split") then
						var_154_20.gameObject:SetActive(true)
					else
						var_154_20.gameObject:SetActive(false)
					end
				end
			end

			local var_154_21 = 0.001

			if var_154_18 <= arg_151_1.time_ and arg_151_1.time_ < var_154_18 + var_154_21 then
				local var_154_22 = (arg_151_1.time_ - var_154_18) / var_154_21
				local var_154_23 = Vector3.New(390, -350, -180)

				var_154_17.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos10015, var_154_23, var_154_22)
			end

			if arg_151_1.time_ >= var_154_18 + var_154_21 and arg_151_1.time_ < var_154_18 + var_154_21 + arg_154_0 then
				var_154_17.localPosition = Vector3.New(390, -350, -180)
			end

			local var_154_24 = 0
			local var_154_25 = 1.175

			if var_154_24 < arg_151_1.time_ and arg_151_1.time_ <= var_154_24 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_26 = arg_151_1:FormatText(StoryNameCfg[208].name)

				arg_151_1.leftNameTxt_.text = var_154_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_27 = arg_151_1:GetWordFromCfg(114291037)
				local var_154_28 = arg_151_1:FormatText(var_154_27.content)

				arg_151_1.text_.text = var_154_28

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_29 = 47
				local var_154_30 = utf8.len(var_154_28)
				local var_154_31 = var_154_29 <= 0 and var_154_25 or var_154_25 * (var_154_30 / var_154_29)

				if var_154_31 > 0 and var_154_25 < var_154_31 then
					arg_151_1.talkMaxDuration = var_154_31

					if var_154_31 + var_154_24 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_31 + var_154_24
					end
				end

				arg_151_1.text_.text = var_154_28
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291037", "story_v_out_114291.awb") ~= 0 then
					local var_154_32 = manager.audio:GetVoiceLength("story_v_out_114291", "114291037", "story_v_out_114291.awb") / 1000

					if var_154_32 + var_154_24 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_32 + var_154_24
					end

					if var_154_27.prefab_name ~= "" and arg_151_1.actors_[var_154_27.prefab_name] ~= nil then
						local var_154_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_27.prefab_name].transform, "story_v_out_114291", "114291037", "story_v_out_114291.awb")

						arg_151_1:RecordAudio("114291037", var_154_33)
						arg_151_1:RecordAudio("114291037", var_154_33)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_114291", "114291037", "story_v_out_114291.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_114291", "114291037", "story_v_out_114291.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_34 = math.max(var_154_25, arg_151_1.talkMaxDuration)

			if var_154_24 <= arg_151_1.time_ and arg_151_1.time_ < var_154_24 + var_154_34 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_24) / var_154_34

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_24 + var_154_34 and arg_151_1.time_ < var_154_24 + var_154_34 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play114291038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 114291038
		arg_155_1.duration_ = 16.733

		local var_155_0 = {
			ja = 6.566,
			ko = 16.733,
			zh = 12.8,
			en = 11.133
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
				arg_155_0:Play114291039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 1.425

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_2 = arg_155_1:FormatText(StoryNameCfg[208].name)

				arg_155_1.leftNameTxt_.text = var_158_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_3 = arg_155_1:GetWordFromCfg(114291038)
				local var_158_4 = arg_155_1:FormatText(var_158_3.content)

				arg_155_1.text_.text = var_158_4

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_5 = 57
				local var_158_6 = utf8.len(var_158_4)
				local var_158_7 = var_158_5 <= 0 and var_158_1 or var_158_1 * (var_158_6 / var_158_5)

				if var_158_7 > 0 and var_158_1 < var_158_7 then
					arg_155_1.talkMaxDuration = var_158_7

					if var_158_7 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_7 + var_158_0
					end
				end

				arg_155_1.text_.text = var_158_4
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291038", "story_v_out_114291.awb") ~= 0 then
					local var_158_8 = manager.audio:GetVoiceLength("story_v_out_114291", "114291038", "story_v_out_114291.awb") / 1000

					if var_158_8 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_8 + var_158_0
					end

					if var_158_3.prefab_name ~= "" and arg_155_1.actors_[var_158_3.prefab_name] ~= nil then
						local var_158_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_3.prefab_name].transform, "story_v_out_114291", "114291038", "story_v_out_114291.awb")

						arg_155_1:RecordAudio("114291038", var_158_9)
						arg_155_1:RecordAudio("114291038", var_158_9)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_114291", "114291038", "story_v_out_114291.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_114291", "114291038", "story_v_out_114291.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_10 = math.max(var_158_1, arg_155_1.talkMaxDuration)

			if var_158_0 <= arg_155_1.time_ and arg_155_1.time_ < var_158_0 + var_158_10 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_0) / var_158_10

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_0 + var_158_10 and arg_155_1.time_ < var_158_0 + var_158_10 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play114291039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 114291039
		arg_159_1.duration_ = 18.1

		local var_159_0 = {
			ja = 5.3,
			ko = 14.866,
			zh = 18.1,
			en = 13.2
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
				arg_159_0:Play114291040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 1.9

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_2 = arg_159_1:FormatText(StoryNameCfg[208].name)

				arg_159_1.leftNameTxt_.text = var_162_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(114291039)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 76
				local var_162_6 = utf8.len(var_162_4)
				local var_162_7 = var_162_5 <= 0 and var_162_1 or var_162_1 * (var_162_6 / var_162_5)

				if var_162_7 > 0 and var_162_1 < var_162_7 then
					arg_159_1.talkMaxDuration = var_162_7

					if var_162_7 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_7 + var_162_0
					end
				end

				arg_159_1.text_.text = var_162_4
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291039", "story_v_out_114291.awb") ~= 0 then
					local var_162_8 = manager.audio:GetVoiceLength("story_v_out_114291", "114291039", "story_v_out_114291.awb") / 1000

					if var_162_8 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_0
					end

					if var_162_3.prefab_name ~= "" and arg_159_1.actors_[var_162_3.prefab_name] ~= nil then
						local var_162_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_3.prefab_name].transform, "story_v_out_114291", "114291039", "story_v_out_114291.awb")

						arg_159_1:RecordAudio("114291039", var_162_9)
						arg_159_1:RecordAudio("114291039", var_162_9)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_114291", "114291039", "story_v_out_114291.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_114291", "114291039", "story_v_out_114291.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_10 = math.max(var_162_1, arg_159_1.talkMaxDuration)

			if var_162_0 <= arg_159_1.time_ and arg_159_1.time_ < var_162_0 + var_162_10 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_0) / var_162_10

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_0 + var_162_10 and arg_159_1.time_ < var_162_0 + var_162_10 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play114291040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 114291040
		arg_163_1.duration_ = 4.3

		local var_163_0 = {
			ja = 3.7,
			ko = 3.966,
			zh = 4.3,
			en = 4.2
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
				arg_163_0:Play114291041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["10015"]
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 and arg_163_1.var_.actorSpriteComps10015 == nil then
				arg_163_1.var_.actorSpriteComps10015 = var_166_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_2 = 0.034

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2

				if arg_163_1.var_.actorSpriteComps10015 then
					for iter_166_0, iter_166_1 in pairs(arg_163_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_166_1 then
							local var_166_4 = Mathf.Lerp(iter_166_1.color.r, 0.5, var_166_3)

							iter_166_1.color = Color.New(var_166_4, var_166_4, var_166_4)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 and arg_163_1.var_.actorSpriteComps10015 then
				local var_166_5 = 0.5

				for iter_166_2, iter_166_3 in pairs(arg_163_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_166_3 then
						iter_166_3.color = Color.New(var_166_5, var_166_5, var_166_5)
					end
				end

				arg_163_1.var_.actorSpriteComps10015 = nil
			end

			local var_166_6 = arg_163_1.actors_["10016"]
			local var_166_7 = 0

			if var_166_7 < arg_163_1.time_ and arg_163_1.time_ <= var_166_7 + arg_166_0 then
				local var_166_8 = var_166_6:GetComponent("Image")

				if var_166_8 then
					arg_163_1.var_.highlightMatValue10016 = var_166_8
				end
			end

			local var_166_9 = 0.034

			if var_166_7 <= arg_163_1.time_ and arg_163_1.time_ < var_166_7 + var_166_9 then
				local var_166_10 = (arg_163_1.time_ - var_166_7) / var_166_9

				if arg_163_1.var_.highlightMatValue10016 then
					local var_166_11 = Mathf.Lerp(0.5, 1, var_166_10)
					local var_166_12 = arg_163_1.var_.highlightMatValue10016
					local var_166_13 = var_166_12.color

					var_166_13.r = var_166_11
					var_166_13.g = var_166_11
					var_166_13.b = var_166_11
					var_166_12.color = var_166_13
				end
			end

			if arg_163_1.time_ >= var_166_7 + var_166_9 and arg_163_1.time_ < var_166_7 + var_166_9 + arg_166_0 and arg_163_1.var_.highlightMatValue10016 then
				local var_166_14 = 1

				var_166_6.transform:SetSiblingIndex(1)

				local var_166_15 = arg_163_1.var_.highlightMatValue10016
				local var_166_16 = var_166_15.color

				var_166_16.r = var_166_14
				var_166_16.g = var_166_14
				var_166_16.b = var_166_14
				var_166_15.color = var_166_16
			end

			local var_166_17 = 0
			local var_166_18 = 0.3

			if var_166_17 < arg_163_1.time_ and arg_163_1.time_ <= var_166_17 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_19 = arg_163_1:FormatText(StoryNameCfg[226].name)

				arg_163_1.leftNameTxt_.text = var_166_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_20 = arg_163_1:GetWordFromCfg(114291040)
				local var_166_21 = arg_163_1:FormatText(var_166_20.content)

				arg_163_1.text_.text = var_166_21

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_22 = 12
				local var_166_23 = utf8.len(var_166_21)
				local var_166_24 = var_166_22 <= 0 and var_166_18 or var_166_18 * (var_166_23 / var_166_22)

				if var_166_24 > 0 and var_166_18 < var_166_24 then
					arg_163_1.talkMaxDuration = var_166_24

					if var_166_24 + var_166_17 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_24 + var_166_17
					end
				end

				arg_163_1.text_.text = var_166_21
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291040", "story_v_out_114291.awb") ~= 0 then
					local var_166_25 = manager.audio:GetVoiceLength("story_v_out_114291", "114291040", "story_v_out_114291.awb") / 1000

					if var_166_25 + var_166_17 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_25 + var_166_17
					end

					if var_166_20.prefab_name ~= "" and arg_163_1.actors_[var_166_20.prefab_name] ~= nil then
						local var_166_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_20.prefab_name].transform, "story_v_out_114291", "114291040", "story_v_out_114291.awb")

						arg_163_1:RecordAudio("114291040", var_166_26)
						arg_163_1:RecordAudio("114291040", var_166_26)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_114291", "114291040", "story_v_out_114291.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_114291", "114291040", "story_v_out_114291.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_27 = math.max(var_166_18, arg_163_1.talkMaxDuration)

			if var_166_17 <= arg_163_1.time_ and arg_163_1.time_ < var_166_17 + var_166_27 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_17) / var_166_27

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_17 + var_166_27 and arg_163_1.time_ < var_166_17 + var_166_27 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play114291041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 114291041
		arg_167_1.duration_ = 3.866

		local var_167_0 = {
			ja = 3.7,
			ko = 3.1,
			zh = 3.233,
			en = 3.866
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
				arg_167_0:Play114291042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["10015"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos10015 = var_170_0.localPosition
				var_170_0.localScale = Vector3.New(1, 1, 1)

				arg_167_1:CheckSpriteTmpPos("10015", 4)

				local var_170_2 = var_170_0.childCount

				for iter_170_0 = 0, var_170_2 - 1 do
					local var_170_3 = var_170_0:GetChild(iter_170_0)

					if var_170_3.name == "split_4" or not string.find(var_170_3.name, "split") then
						var_170_3.gameObject:SetActive(true)
					else
						var_170_3.gameObject:SetActive(false)
					end
				end
			end

			local var_170_4 = 0.001

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_4 then
				local var_170_5 = (arg_167_1.time_ - var_170_1) / var_170_4
				local var_170_6 = Vector3.New(390, -350, -180)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos10015, var_170_6, var_170_5)
			end

			if arg_167_1.time_ >= var_170_1 + var_170_4 and arg_167_1.time_ < var_170_1 + var_170_4 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_170_7 = arg_167_1.actors_["10015"]
			local var_170_8 = 0

			if var_170_8 < arg_167_1.time_ and arg_167_1.time_ <= var_170_8 + arg_170_0 and arg_167_1.var_.actorSpriteComps10015 == nil then
				arg_167_1.var_.actorSpriteComps10015 = var_170_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_9 = 0.034

			if var_170_8 <= arg_167_1.time_ and arg_167_1.time_ < var_170_8 + var_170_9 then
				local var_170_10 = (arg_167_1.time_ - var_170_8) / var_170_9

				if arg_167_1.var_.actorSpriteComps10015 then
					for iter_170_1, iter_170_2 in pairs(arg_167_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_170_2 then
							local var_170_11 = Mathf.Lerp(iter_170_2.color.r, 1, var_170_10)

							iter_170_2.color = Color.New(var_170_11, var_170_11, var_170_11)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_8 + var_170_9 and arg_167_1.time_ < var_170_8 + var_170_9 + arg_170_0 and arg_167_1.var_.actorSpriteComps10015 then
				local var_170_12 = 1

				for iter_170_3, iter_170_4 in pairs(arg_167_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_170_4 then
						iter_170_4.color = Color.New(var_170_12, var_170_12, var_170_12)
					end
				end

				arg_167_1.var_.actorSpriteComps10015 = nil
			end

			local var_170_13 = arg_167_1.actors_["10016"]
			local var_170_14 = 0

			if var_170_14 < arg_167_1.time_ and arg_167_1.time_ <= var_170_14 + arg_170_0 then
				local var_170_15 = var_170_13:GetComponent("Image")

				if var_170_15 then
					arg_167_1.var_.highlightMatValue10016 = var_170_15
				end
			end

			local var_170_16 = 0.034

			if var_170_14 <= arg_167_1.time_ and arg_167_1.time_ < var_170_14 + var_170_16 then
				local var_170_17 = (arg_167_1.time_ - var_170_14) / var_170_16

				if arg_167_1.var_.highlightMatValue10016 then
					local var_170_18 = Mathf.Lerp(1, 0.5, var_170_17)
					local var_170_19 = arg_167_1.var_.highlightMatValue10016
					local var_170_20 = var_170_19.color

					var_170_20.r = var_170_18
					var_170_20.g = var_170_18
					var_170_20.b = var_170_18
					var_170_19.color = var_170_20
				end
			end

			if arg_167_1.time_ >= var_170_14 + var_170_16 and arg_167_1.time_ < var_170_14 + var_170_16 + arg_170_0 and arg_167_1.var_.highlightMatValue10016 then
				local var_170_21 = 0.5
				local var_170_22 = arg_167_1.var_.highlightMatValue10016
				local var_170_23 = var_170_22.color

				var_170_23.r = var_170_21
				var_170_23.g = var_170_21
				var_170_23.b = var_170_21
				var_170_22.color = var_170_23
			end

			local var_170_24 = 0
			local var_170_25 = 0.35

			if var_170_24 < arg_167_1.time_ and arg_167_1.time_ <= var_170_24 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_26 = arg_167_1:FormatText(StoryNameCfg[208].name)

				arg_167_1.leftNameTxt_.text = var_170_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_27 = arg_167_1:GetWordFromCfg(114291041)
				local var_170_28 = arg_167_1:FormatText(var_170_27.content)

				arg_167_1.text_.text = var_170_28

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_29 = 14
				local var_170_30 = utf8.len(var_170_28)
				local var_170_31 = var_170_29 <= 0 and var_170_25 or var_170_25 * (var_170_30 / var_170_29)

				if var_170_31 > 0 and var_170_25 < var_170_31 then
					arg_167_1.talkMaxDuration = var_170_31

					if var_170_31 + var_170_24 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_31 + var_170_24
					end
				end

				arg_167_1.text_.text = var_170_28
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291041", "story_v_out_114291.awb") ~= 0 then
					local var_170_32 = manager.audio:GetVoiceLength("story_v_out_114291", "114291041", "story_v_out_114291.awb") / 1000

					if var_170_32 + var_170_24 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_32 + var_170_24
					end

					if var_170_27.prefab_name ~= "" and arg_167_1.actors_[var_170_27.prefab_name] ~= nil then
						local var_170_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_27.prefab_name].transform, "story_v_out_114291", "114291041", "story_v_out_114291.awb")

						arg_167_1:RecordAudio("114291041", var_170_33)
						arg_167_1:RecordAudio("114291041", var_170_33)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_114291", "114291041", "story_v_out_114291.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_114291", "114291041", "story_v_out_114291.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_34 = math.max(var_170_25, arg_167_1.talkMaxDuration)

			if var_170_24 <= arg_167_1.time_ and arg_167_1.time_ < var_170_24 + var_170_34 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_24) / var_170_34

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_24 + var_170_34 and arg_167_1.time_ < var_170_24 + var_170_34 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play114291042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 114291042
		arg_171_1.duration_ = 3.233

		local var_171_0 = {
			ja = 3.233,
			ko = 1.5,
			zh = 1.433,
			en = 2.533
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
				arg_171_0:Play114291043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["10015"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.actorSpriteComps10015 == nil then
				arg_171_1.var_.actorSpriteComps10015 = var_174_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_2 = 0.034

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.actorSpriteComps10015 then
					for iter_174_0, iter_174_1 in pairs(arg_171_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_174_1 then
							local var_174_4 = Mathf.Lerp(iter_174_1.color.r, 0.5, var_174_3)

							iter_174_1.color = Color.New(var_174_4, var_174_4, var_174_4)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.actorSpriteComps10015 then
				local var_174_5 = 0.5

				for iter_174_2, iter_174_3 in pairs(arg_171_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_174_3 then
						iter_174_3.color = Color.New(var_174_5, var_174_5, var_174_5)
					end
				end

				arg_171_1.var_.actorSpriteComps10015 = nil
			end

			local var_174_6 = arg_171_1.actors_["10016"]
			local var_174_7 = 0

			if var_174_7 < arg_171_1.time_ and arg_171_1.time_ <= var_174_7 + arg_174_0 then
				local var_174_8 = var_174_6:GetComponent("Image")

				if var_174_8 then
					arg_171_1.var_.highlightMatValue10016 = var_174_8
				end
			end

			local var_174_9 = 0.034

			if var_174_7 <= arg_171_1.time_ and arg_171_1.time_ < var_174_7 + var_174_9 then
				local var_174_10 = (arg_171_1.time_ - var_174_7) / var_174_9

				if arg_171_1.var_.highlightMatValue10016 then
					local var_174_11 = Mathf.Lerp(0.5, 1, var_174_10)
					local var_174_12 = arg_171_1.var_.highlightMatValue10016
					local var_174_13 = var_174_12.color

					var_174_13.r = var_174_11
					var_174_13.g = var_174_11
					var_174_13.b = var_174_11
					var_174_12.color = var_174_13
				end
			end

			if arg_171_1.time_ >= var_174_7 + var_174_9 and arg_171_1.time_ < var_174_7 + var_174_9 + arg_174_0 and arg_171_1.var_.highlightMatValue10016 then
				local var_174_14 = 1

				var_174_6.transform:SetSiblingIndex(1)

				local var_174_15 = arg_171_1.var_.highlightMatValue10016
				local var_174_16 = var_174_15.color

				var_174_16.r = var_174_14
				var_174_16.g = var_174_14
				var_174_16.b = var_174_14
				var_174_15.color = var_174_16
			end

			local var_174_17 = 0
			local var_174_18 = 0.15

			if var_174_17 < arg_171_1.time_ and arg_171_1.time_ <= var_174_17 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_19 = arg_171_1:FormatText(StoryNameCfg[226].name)

				arg_171_1.leftNameTxt_.text = var_174_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_20 = arg_171_1:GetWordFromCfg(114291042)
				local var_174_21 = arg_171_1:FormatText(var_174_20.content)

				arg_171_1.text_.text = var_174_21

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_22 = 6
				local var_174_23 = utf8.len(var_174_21)
				local var_174_24 = var_174_22 <= 0 and var_174_18 or var_174_18 * (var_174_23 / var_174_22)

				if var_174_24 > 0 and var_174_18 < var_174_24 then
					arg_171_1.talkMaxDuration = var_174_24

					if var_174_24 + var_174_17 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_24 + var_174_17
					end
				end

				arg_171_1.text_.text = var_174_21
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291042", "story_v_out_114291.awb") ~= 0 then
					local var_174_25 = manager.audio:GetVoiceLength("story_v_out_114291", "114291042", "story_v_out_114291.awb") / 1000

					if var_174_25 + var_174_17 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_25 + var_174_17
					end

					if var_174_20.prefab_name ~= "" and arg_171_1.actors_[var_174_20.prefab_name] ~= nil then
						local var_174_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_20.prefab_name].transform, "story_v_out_114291", "114291042", "story_v_out_114291.awb")

						arg_171_1:RecordAudio("114291042", var_174_26)
						arg_171_1:RecordAudio("114291042", var_174_26)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_114291", "114291042", "story_v_out_114291.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_114291", "114291042", "story_v_out_114291.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_27 = math.max(var_174_18, arg_171_1.talkMaxDuration)

			if var_174_17 <= arg_171_1.time_ and arg_171_1.time_ < var_174_17 + var_174_27 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_17) / var_174_27

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_17 + var_174_27 and arg_171_1.time_ < var_174_17 + var_174_27 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play114291043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 114291043
		arg_175_1.duration_ = 10.133

		local var_175_0 = {
			ja = 7.233,
			ko = 9.066,
			zh = 9.066,
			en = 10.133
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
				arg_175_0:Play114291044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["10015"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos10015 = var_178_0.localPosition
				var_178_0.localScale = Vector3.New(1, 1, 1)

				arg_175_1:CheckSpriteTmpPos("10015", 4)

				local var_178_2 = var_178_0.childCount

				for iter_178_0 = 0, var_178_2 - 1 do
					local var_178_3 = var_178_0:GetChild(iter_178_0)

					if var_178_3.name == "split_1" or not string.find(var_178_3.name, "split") then
						var_178_3.gameObject:SetActive(true)
					else
						var_178_3.gameObject:SetActive(false)
					end
				end
			end

			local var_178_4 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_4 then
				local var_178_5 = (arg_175_1.time_ - var_178_1) / var_178_4
				local var_178_6 = Vector3.New(390, -350, -180)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos10015, var_178_6, var_178_5)
			end

			if arg_175_1.time_ >= var_178_1 + var_178_4 and arg_175_1.time_ < var_178_1 + var_178_4 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_178_7 = arg_175_1.actors_["10015"]
			local var_178_8 = 0

			if var_178_8 < arg_175_1.time_ and arg_175_1.time_ <= var_178_8 + arg_178_0 and arg_175_1.var_.actorSpriteComps10015 == nil then
				arg_175_1.var_.actorSpriteComps10015 = var_178_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_9 = 0.034

			if var_178_8 <= arg_175_1.time_ and arg_175_1.time_ < var_178_8 + var_178_9 then
				local var_178_10 = (arg_175_1.time_ - var_178_8) / var_178_9

				if arg_175_1.var_.actorSpriteComps10015 then
					for iter_178_1, iter_178_2 in pairs(arg_175_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_178_2 then
							local var_178_11 = Mathf.Lerp(iter_178_2.color.r, 1, var_178_10)

							iter_178_2.color = Color.New(var_178_11, var_178_11, var_178_11)
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_8 + var_178_9 and arg_175_1.time_ < var_178_8 + var_178_9 + arg_178_0 and arg_175_1.var_.actorSpriteComps10015 then
				local var_178_12 = 1

				for iter_178_3, iter_178_4 in pairs(arg_175_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_178_4 then
						iter_178_4.color = Color.New(var_178_12, var_178_12, var_178_12)
					end
				end

				arg_175_1.var_.actorSpriteComps10015 = nil
			end

			local var_178_13 = arg_175_1.actors_["10016"]
			local var_178_14 = 0

			if var_178_14 < arg_175_1.time_ and arg_175_1.time_ <= var_178_14 + arg_178_0 then
				local var_178_15 = var_178_13:GetComponent("Image")

				if var_178_15 then
					arg_175_1.var_.highlightMatValue10016 = var_178_15
				end
			end

			local var_178_16 = 0.034

			if var_178_14 <= arg_175_1.time_ and arg_175_1.time_ < var_178_14 + var_178_16 then
				local var_178_17 = (arg_175_1.time_ - var_178_14) / var_178_16

				if arg_175_1.var_.highlightMatValue10016 then
					local var_178_18 = Mathf.Lerp(1, 0.5, var_178_17)
					local var_178_19 = arg_175_1.var_.highlightMatValue10016
					local var_178_20 = var_178_19.color

					var_178_20.r = var_178_18
					var_178_20.g = var_178_18
					var_178_20.b = var_178_18
					var_178_19.color = var_178_20
				end
			end

			if arg_175_1.time_ >= var_178_14 + var_178_16 and arg_175_1.time_ < var_178_14 + var_178_16 + arg_178_0 and arg_175_1.var_.highlightMatValue10016 then
				local var_178_21 = 0.5
				local var_178_22 = arg_175_1.var_.highlightMatValue10016
				local var_178_23 = var_178_22.color

				var_178_23.r = var_178_21
				var_178_23.g = var_178_21
				var_178_23.b = var_178_21
				var_178_22.color = var_178_23
			end

			local var_178_24 = 0
			local var_178_25 = 0.8

			if var_178_24 < arg_175_1.time_ and arg_175_1.time_ <= var_178_24 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_26 = arg_175_1:FormatText(StoryNameCfg[208].name)

				arg_175_1.leftNameTxt_.text = var_178_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_27 = arg_175_1:GetWordFromCfg(114291043)
				local var_178_28 = arg_175_1:FormatText(var_178_27.content)

				arg_175_1.text_.text = var_178_28

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_29 = 32
				local var_178_30 = utf8.len(var_178_28)
				local var_178_31 = var_178_29 <= 0 and var_178_25 or var_178_25 * (var_178_30 / var_178_29)

				if var_178_31 > 0 and var_178_25 < var_178_31 then
					arg_175_1.talkMaxDuration = var_178_31

					if var_178_31 + var_178_24 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_31 + var_178_24
					end
				end

				arg_175_1.text_.text = var_178_28
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291043", "story_v_out_114291.awb") ~= 0 then
					local var_178_32 = manager.audio:GetVoiceLength("story_v_out_114291", "114291043", "story_v_out_114291.awb") / 1000

					if var_178_32 + var_178_24 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_32 + var_178_24
					end

					if var_178_27.prefab_name ~= "" and arg_175_1.actors_[var_178_27.prefab_name] ~= nil then
						local var_178_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_27.prefab_name].transform, "story_v_out_114291", "114291043", "story_v_out_114291.awb")

						arg_175_1:RecordAudio("114291043", var_178_33)
						arg_175_1:RecordAudio("114291043", var_178_33)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_114291", "114291043", "story_v_out_114291.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_114291", "114291043", "story_v_out_114291.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_34 = math.max(var_178_25, arg_175_1.talkMaxDuration)

			if var_178_24 <= arg_175_1.time_ and arg_175_1.time_ < var_178_24 + var_178_34 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_24) / var_178_34

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_24 + var_178_34 and arg_175_1.time_ < var_178_24 + var_178_34 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play114291044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 114291044
		arg_179_1.duration_ = 9.733

		local var_179_0 = {
			ja = 9.2,
			ko = 6.1,
			zh = 6.933,
			en = 9.733
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
				arg_179_0:Play114291045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["10015"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 and arg_179_1.var_.actorSpriteComps10015 == nil then
				arg_179_1.var_.actorSpriteComps10015 = var_182_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_182_2 = 0.034

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2

				if arg_179_1.var_.actorSpriteComps10015 then
					for iter_182_0, iter_182_1 in pairs(arg_179_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_182_1 then
							local var_182_4 = Mathf.Lerp(iter_182_1.color.r, 0.5, var_182_3)

							iter_182_1.color = Color.New(var_182_4, var_182_4, var_182_4)
						end
					end
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 and arg_179_1.var_.actorSpriteComps10015 then
				local var_182_5 = 0.5

				for iter_182_2, iter_182_3 in pairs(arg_179_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_182_3 then
						iter_182_3.color = Color.New(var_182_5, var_182_5, var_182_5)
					end
				end

				arg_179_1.var_.actorSpriteComps10015 = nil
			end

			local var_182_6 = arg_179_1.actors_["10016"]
			local var_182_7 = 0

			if var_182_7 < arg_179_1.time_ and arg_179_1.time_ <= var_182_7 + arg_182_0 then
				local var_182_8 = var_182_6:GetComponent("Image")

				if var_182_8 then
					arg_179_1.var_.highlightMatValue10016 = var_182_8
				end
			end

			local var_182_9 = 0.034

			if var_182_7 <= arg_179_1.time_ and arg_179_1.time_ < var_182_7 + var_182_9 then
				local var_182_10 = (arg_179_1.time_ - var_182_7) / var_182_9

				if arg_179_1.var_.highlightMatValue10016 then
					local var_182_11 = Mathf.Lerp(0.5, 1, var_182_10)
					local var_182_12 = arg_179_1.var_.highlightMatValue10016
					local var_182_13 = var_182_12.color

					var_182_13.r = var_182_11
					var_182_13.g = var_182_11
					var_182_13.b = var_182_11
					var_182_12.color = var_182_13
				end
			end

			if arg_179_1.time_ >= var_182_7 + var_182_9 and arg_179_1.time_ < var_182_7 + var_182_9 + arg_182_0 and arg_179_1.var_.highlightMatValue10016 then
				local var_182_14 = 1

				var_182_6.transform:SetSiblingIndex(1)

				local var_182_15 = arg_179_1.var_.highlightMatValue10016
				local var_182_16 = var_182_15.color

				var_182_16.r = var_182_14
				var_182_16.g = var_182_14
				var_182_16.b = var_182_14
				var_182_15.color = var_182_16
			end

			local var_182_17 = 0
			local var_182_18 = 0.45

			if var_182_17 < arg_179_1.time_ and arg_179_1.time_ <= var_182_17 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_19 = arg_179_1:FormatText(StoryNameCfg[226].name)

				arg_179_1.leftNameTxt_.text = var_182_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_20 = arg_179_1:GetWordFromCfg(114291044)
				local var_182_21 = arg_179_1:FormatText(var_182_20.content)

				arg_179_1.text_.text = var_182_21

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_22 = 18
				local var_182_23 = utf8.len(var_182_21)
				local var_182_24 = var_182_22 <= 0 and var_182_18 or var_182_18 * (var_182_23 / var_182_22)

				if var_182_24 > 0 and var_182_18 < var_182_24 then
					arg_179_1.talkMaxDuration = var_182_24

					if var_182_24 + var_182_17 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_24 + var_182_17
					end
				end

				arg_179_1.text_.text = var_182_21
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291044", "story_v_out_114291.awb") ~= 0 then
					local var_182_25 = manager.audio:GetVoiceLength("story_v_out_114291", "114291044", "story_v_out_114291.awb") / 1000

					if var_182_25 + var_182_17 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_25 + var_182_17
					end

					if var_182_20.prefab_name ~= "" and arg_179_1.actors_[var_182_20.prefab_name] ~= nil then
						local var_182_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_20.prefab_name].transform, "story_v_out_114291", "114291044", "story_v_out_114291.awb")

						arg_179_1:RecordAudio("114291044", var_182_26)
						arg_179_1:RecordAudio("114291044", var_182_26)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_114291", "114291044", "story_v_out_114291.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_114291", "114291044", "story_v_out_114291.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_27 = math.max(var_182_18, arg_179_1.talkMaxDuration)

			if var_182_17 <= arg_179_1.time_ and arg_179_1.time_ < var_182_17 + var_182_27 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_17) / var_182_27

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_17 + var_182_27 and arg_179_1.time_ < var_182_17 + var_182_27 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play114291045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 114291045
		arg_183_1.duration_ = 3.266

		local var_183_0 = {
			ja = 3.266,
			ko = 1.8,
			zh = 2.133,
			en = 1.866
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
				arg_183_0:Play114291046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["10015"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos10015 = var_186_0.localPosition
				var_186_0.localScale = Vector3.New(1, 1, 1)

				arg_183_1:CheckSpriteTmpPos("10015", 4)

				local var_186_2 = var_186_0.childCount

				for iter_186_0 = 0, var_186_2 - 1 do
					local var_186_3 = var_186_0:GetChild(iter_186_0)

					if var_186_3.name == "split_2" or not string.find(var_186_3.name, "split") then
						var_186_3.gameObject:SetActive(true)
					else
						var_186_3.gameObject:SetActive(false)
					end
				end
			end

			local var_186_4 = 0.001

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_4 then
				local var_186_5 = (arg_183_1.time_ - var_186_1) / var_186_4
				local var_186_6 = Vector3.New(390, -350, -180)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos10015, var_186_6, var_186_5)
			end

			if arg_183_1.time_ >= var_186_1 + var_186_4 and arg_183_1.time_ < var_186_1 + var_186_4 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_186_7 = arg_183_1.actors_["10015"]
			local var_186_8 = 0

			if var_186_8 < arg_183_1.time_ and arg_183_1.time_ <= var_186_8 + arg_186_0 and arg_183_1.var_.actorSpriteComps10015 == nil then
				arg_183_1.var_.actorSpriteComps10015 = var_186_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_9 = 0.034

			if var_186_8 <= arg_183_1.time_ and arg_183_1.time_ < var_186_8 + var_186_9 then
				local var_186_10 = (arg_183_1.time_ - var_186_8) / var_186_9

				if arg_183_1.var_.actorSpriteComps10015 then
					for iter_186_1, iter_186_2 in pairs(arg_183_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_186_2 then
							local var_186_11 = Mathf.Lerp(iter_186_2.color.r, 1, var_186_10)

							iter_186_2.color = Color.New(var_186_11, var_186_11, var_186_11)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_8 + var_186_9 and arg_183_1.time_ < var_186_8 + var_186_9 + arg_186_0 and arg_183_1.var_.actorSpriteComps10015 then
				local var_186_12 = 1

				for iter_186_3, iter_186_4 in pairs(arg_183_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_186_4 then
						iter_186_4.color = Color.New(var_186_12, var_186_12, var_186_12)
					end
				end

				arg_183_1.var_.actorSpriteComps10015 = nil
			end

			local var_186_13 = arg_183_1.actors_["10016"]
			local var_186_14 = 0

			if var_186_14 < arg_183_1.time_ and arg_183_1.time_ <= var_186_14 + arg_186_0 then
				local var_186_15 = var_186_13:GetComponent("Image")

				if var_186_15 then
					arg_183_1.var_.highlightMatValue10016 = var_186_15
				end
			end

			local var_186_16 = 0.034

			if var_186_14 <= arg_183_1.time_ and arg_183_1.time_ < var_186_14 + var_186_16 then
				local var_186_17 = (arg_183_1.time_ - var_186_14) / var_186_16

				if arg_183_1.var_.highlightMatValue10016 then
					local var_186_18 = Mathf.Lerp(1, 0.5, var_186_17)
					local var_186_19 = arg_183_1.var_.highlightMatValue10016
					local var_186_20 = var_186_19.color

					var_186_20.r = var_186_18
					var_186_20.g = var_186_18
					var_186_20.b = var_186_18
					var_186_19.color = var_186_20
				end
			end

			if arg_183_1.time_ >= var_186_14 + var_186_16 and arg_183_1.time_ < var_186_14 + var_186_16 + arg_186_0 and arg_183_1.var_.highlightMatValue10016 then
				local var_186_21 = 0.5
				local var_186_22 = arg_183_1.var_.highlightMatValue10016
				local var_186_23 = var_186_22.color

				var_186_23.r = var_186_21
				var_186_23.g = var_186_21
				var_186_23.b = var_186_21
				var_186_22.color = var_186_23
			end

			local var_186_24 = 0
			local var_186_25 = 0.225

			if var_186_24 < arg_183_1.time_ and arg_183_1.time_ <= var_186_24 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_26 = arg_183_1:FormatText(StoryNameCfg[208].name)

				arg_183_1.leftNameTxt_.text = var_186_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_27 = arg_183_1:GetWordFromCfg(114291045)
				local var_186_28 = arg_183_1:FormatText(var_186_27.content)

				arg_183_1.text_.text = var_186_28

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_29 = 9
				local var_186_30 = utf8.len(var_186_28)
				local var_186_31 = var_186_29 <= 0 and var_186_25 or var_186_25 * (var_186_30 / var_186_29)

				if var_186_31 > 0 and var_186_25 < var_186_31 then
					arg_183_1.talkMaxDuration = var_186_31

					if var_186_31 + var_186_24 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_31 + var_186_24
					end
				end

				arg_183_1.text_.text = var_186_28
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291045", "story_v_out_114291.awb") ~= 0 then
					local var_186_32 = manager.audio:GetVoiceLength("story_v_out_114291", "114291045", "story_v_out_114291.awb") / 1000

					if var_186_32 + var_186_24 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_32 + var_186_24
					end

					if var_186_27.prefab_name ~= "" and arg_183_1.actors_[var_186_27.prefab_name] ~= nil then
						local var_186_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_27.prefab_name].transform, "story_v_out_114291", "114291045", "story_v_out_114291.awb")

						arg_183_1:RecordAudio("114291045", var_186_33)
						arg_183_1:RecordAudio("114291045", var_186_33)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_114291", "114291045", "story_v_out_114291.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_114291", "114291045", "story_v_out_114291.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_34 = math.max(var_186_25, arg_183_1.talkMaxDuration)

			if var_186_24 <= arg_183_1.time_ and arg_183_1.time_ < var_186_24 + var_186_34 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_24) / var_186_34

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_24 + var_186_34 and arg_183_1.time_ < var_186_24 + var_186_34 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play114291046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 114291046
		arg_187_1.duration_ = 4.133

		local var_187_0 = {
			ja = 3.266,
			ko = 1.2,
			zh = 1.433,
			en = 4.133
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
				arg_187_0:Play114291047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["10016"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos10016 = var_190_0.localPosition
				var_190_0.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("10016", 3)
			end

			local var_190_2 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2
				local var_190_4 = Vector3.New(0, -350, -180)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10016, var_190_4, var_190_3)
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_190_5 = arg_187_1.actors_["10016"]
			local var_190_6 = 0

			if var_190_6 < arg_187_1.time_ and arg_187_1.time_ <= var_190_6 + arg_190_0 then
				local var_190_7 = var_190_5:GetComponent("Image")

				if var_190_7 then
					arg_187_1.var_.highlightMatValue10016 = var_190_7
				end
			end

			local var_190_8 = 0.034

			if var_190_6 <= arg_187_1.time_ and arg_187_1.time_ < var_190_6 + var_190_8 then
				local var_190_9 = (arg_187_1.time_ - var_190_6) / var_190_8

				if arg_187_1.var_.highlightMatValue10016 then
					local var_190_10 = Mathf.Lerp(0.5, 1, var_190_9)
					local var_190_11 = arg_187_1.var_.highlightMatValue10016
					local var_190_12 = var_190_11.color

					var_190_12.r = var_190_10
					var_190_12.g = var_190_10
					var_190_12.b = var_190_10
					var_190_11.color = var_190_12
				end
			end

			if arg_187_1.time_ >= var_190_6 + var_190_8 and arg_187_1.time_ < var_190_6 + var_190_8 + arg_190_0 and arg_187_1.var_.highlightMatValue10016 then
				local var_190_13 = 1

				var_190_5.transform:SetSiblingIndex(1)

				local var_190_14 = arg_187_1.var_.highlightMatValue10016
				local var_190_15 = var_190_14.color

				var_190_15.r = var_190_13
				var_190_15.g = var_190_13
				var_190_15.b = var_190_13
				var_190_14.color = var_190_15
			end

			local var_190_16 = arg_187_1.actors_["10015"]
			local var_190_17 = 0

			if var_190_17 < arg_187_1.time_ and arg_187_1.time_ <= var_190_17 + arg_190_0 then
				local var_190_18 = var_190_16:GetComponentInChildren(typeof(CanvasGroup))

				if var_190_18 then
					arg_187_1.var_.alphaOldValue10015 = var_190_18.alpha
					arg_187_1.var_.characterEffect10015 = var_190_18
				end

				arg_187_1.var_.alphaOldValue10015 = 1
			end

			local var_190_19 = 0.5

			if var_190_17 <= arg_187_1.time_ and arg_187_1.time_ < var_190_17 + var_190_19 then
				local var_190_20 = (arg_187_1.time_ - var_190_17) / var_190_19
				local var_190_21 = Mathf.Lerp(arg_187_1.var_.alphaOldValue10015, 0, var_190_20)

				if arg_187_1.var_.characterEffect10015 then
					arg_187_1.var_.characterEffect10015.alpha = var_190_21
				end
			end

			if arg_187_1.time_ >= var_190_17 + var_190_19 and arg_187_1.time_ < var_190_17 + var_190_19 + arg_190_0 and arg_187_1.var_.characterEffect10015 then
				arg_187_1.var_.characterEffect10015.alpha = 0
			end

			local var_190_22 = arg_187_1.actors_["10016"]
			local var_190_23 = 0

			if var_190_23 < arg_187_1.time_ and arg_187_1.time_ <= var_190_23 + arg_190_0 then
				local var_190_24 = var_190_22:GetComponent("Image")

				if var_190_24 then
					arg_187_1.var_.alphaMatValue10016 = var_190_24
					arg_187_1.var_.alphaOldValue10016 = var_190_24.color.a
				end

				arg_187_1.var_.alphaOldValue10016 = 0
			end

			local var_190_25 = 0.5

			if var_190_23 <= arg_187_1.time_ and arg_187_1.time_ < var_190_23 + var_190_25 then
				local var_190_26 = (arg_187_1.time_ - var_190_23) / var_190_25
				local var_190_27 = Mathf.Lerp(arg_187_1.var_.alphaOldValue10016, 1, var_190_26)

				if arg_187_1.var_.alphaMatValue10016 then
					local var_190_28 = arg_187_1.var_.alphaMatValue10016.color

					var_190_28.a = var_190_27
					arg_187_1.var_.alphaMatValue10016.color = var_190_28
				end
			end

			if arg_187_1.time_ >= var_190_23 + var_190_25 and arg_187_1.time_ < var_190_23 + var_190_25 + arg_190_0 and arg_187_1.var_.alphaMatValue10016 then
				local var_190_29 = arg_187_1.var_.alphaMatValue10016
				local var_190_30 = var_190_29.color

				var_190_30.a = 1
				var_190_29.color = var_190_30
			end

			local var_190_31 = 0
			local var_190_32 = 0.05

			if var_190_31 < arg_187_1.time_ and arg_187_1.time_ <= var_190_31 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_33 = arg_187_1:FormatText(StoryNameCfg[226].name)

				arg_187_1.leftNameTxt_.text = var_190_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_34 = arg_187_1:GetWordFromCfg(114291046)
				local var_190_35 = arg_187_1:FormatText(var_190_34.content)

				arg_187_1.text_.text = var_190_35

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_36 = 2
				local var_190_37 = utf8.len(var_190_35)
				local var_190_38 = var_190_36 <= 0 and var_190_32 or var_190_32 * (var_190_37 / var_190_36)

				if var_190_38 > 0 and var_190_32 < var_190_38 then
					arg_187_1.talkMaxDuration = var_190_38

					if var_190_38 + var_190_31 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_38 + var_190_31
					end
				end

				arg_187_1.text_.text = var_190_35
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291046", "story_v_out_114291.awb") ~= 0 then
					local var_190_39 = manager.audio:GetVoiceLength("story_v_out_114291", "114291046", "story_v_out_114291.awb") / 1000

					if var_190_39 + var_190_31 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_39 + var_190_31
					end

					if var_190_34.prefab_name ~= "" and arg_187_1.actors_[var_190_34.prefab_name] ~= nil then
						local var_190_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_34.prefab_name].transform, "story_v_out_114291", "114291046", "story_v_out_114291.awb")

						arg_187_1:RecordAudio("114291046", var_190_40)
						arg_187_1:RecordAudio("114291046", var_190_40)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_114291", "114291046", "story_v_out_114291.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_114291", "114291046", "story_v_out_114291.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_41 = math.max(var_190_32, arg_187_1.talkMaxDuration)

			if var_190_31 <= arg_187_1.time_ and arg_187_1.time_ < var_190_31 + var_190_41 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_31) / var_190_41

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_31 + var_190_41 and arg_187_1.time_ < var_190_31 + var_190_41 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play114291047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 114291047
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play114291048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10016"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				local var_194_2 = var_194_0:GetComponent("Image")

				if var_194_2 then
					arg_191_1.var_.alphaMatValue10016 = var_194_2
					arg_191_1.var_.alphaOldValue10016 = var_194_2.color.a
				end

				arg_191_1.var_.alphaOldValue10016 = 1
			end

			local var_194_3 = 0.5

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_3 then
				local var_194_4 = (arg_191_1.time_ - var_194_1) / var_194_3
				local var_194_5 = Mathf.Lerp(arg_191_1.var_.alphaOldValue10016, 0, var_194_4)

				if arg_191_1.var_.alphaMatValue10016 then
					local var_194_6 = arg_191_1.var_.alphaMatValue10016.color

					var_194_6.a = var_194_5
					arg_191_1.var_.alphaMatValue10016.color = var_194_6
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_3 and arg_191_1.time_ < var_194_1 + var_194_3 + arg_194_0 and arg_191_1.var_.alphaMatValue10016 then
				local var_194_7 = arg_191_1.var_.alphaMatValue10016
				local var_194_8 = var_194_7.color

				var_194_8.a = 0
				var_194_7.color = var_194_8
			end

			local var_194_9 = 0
			local var_194_10 = 1.125

			if var_194_9 < arg_191_1.time_ and arg_191_1.time_ <= var_194_9 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, false)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_11 = arg_191_1:GetWordFromCfg(114291047)
				local var_194_12 = arg_191_1:FormatText(var_194_11.content)

				arg_191_1.text_.text = var_194_12

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_13 = 45
				local var_194_14 = utf8.len(var_194_12)
				local var_194_15 = var_194_13 <= 0 and var_194_10 or var_194_10 * (var_194_14 / var_194_13)

				if var_194_15 > 0 and var_194_10 < var_194_15 then
					arg_191_1.talkMaxDuration = var_194_15

					if var_194_15 + var_194_9 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_15 + var_194_9
					end
				end

				arg_191_1.text_.text = var_194_12
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_16 = math.max(var_194_10, arg_191_1.talkMaxDuration)

			if var_194_9 <= arg_191_1.time_ and arg_191_1.time_ < var_194_9 + var_194_16 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_9) / var_194_16

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_9 + var_194_16 and arg_191_1.time_ < var_194_9 + var_194_16 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play114291048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 114291048
		arg_195_1.duration_ = 5

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play114291049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 0.55

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, false)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_2 = arg_195_1:GetWordFromCfg(114291048)
				local var_198_3 = arg_195_1:FormatText(var_198_2.content)

				arg_195_1.text_.text = var_198_3

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_4 = 22
				local var_198_5 = utf8.len(var_198_3)
				local var_198_6 = var_198_4 <= 0 and var_198_1 or var_198_1 * (var_198_5 / var_198_4)

				if var_198_6 > 0 and var_198_1 < var_198_6 then
					arg_195_1.talkMaxDuration = var_198_6

					if var_198_6 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_6 + var_198_0
					end
				end

				arg_195_1.text_.text = var_198_3
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)
				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_7 = math.max(var_198_1, arg_195_1.talkMaxDuration)

			if var_198_0 <= arg_195_1.time_ and arg_195_1.time_ < var_198_0 + var_198_7 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_0) / var_198_7

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_0 + var_198_7 and arg_195_1.time_ < var_198_0 + var_198_7 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play114291049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 114291049
		arg_199_1.duration_ = 12.7

		local var_199_0 = {
			ja = 12.7,
			ko = 8.733,
			zh = 6.5,
			en = 6.566
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
				arg_199_0:Play114291050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["10015"].transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.moveOldPos10015 = var_202_0.localPosition
				var_202_0.localScale = Vector3.New(1, 1, 1)

				arg_199_1:CheckSpriteTmpPos("10015", 4)

				local var_202_2 = var_202_0.childCount

				for iter_202_0 = 0, var_202_2 - 1 do
					local var_202_3 = var_202_0:GetChild(iter_202_0)

					if var_202_3.name == "split_1" or not string.find(var_202_3.name, "split") then
						var_202_3.gameObject:SetActive(true)
					else
						var_202_3.gameObject:SetActive(false)
					end
				end
			end

			local var_202_4 = 0.001

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_4 then
				local var_202_5 = (arg_199_1.time_ - var_202_1) / var_202_4
				local var_202_6 = Vector3.New(390, -350, -180)

				var_202_0.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos10015, var_202_6, var_202_5)
			end

			if arg_199_1.time_ >= var_202_1 + var_202_4 and arg_199_1.time_ < var_202_1 + var_202_4 + arg_202_0 then
				var_202_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_202_7 = arg_199_1.actors_["10016"].transform
			local var_202_8 = 0

			if var_202_8 < arg_199_1.time_ and arg_199_1.time_ <= var_202_8 + arg_202_0 then
				arg_199_1.var_.moveOldPos10016 = var_202_7.localPosition
				var_202_7.localScale = Vector3.New(1, 1, 1)

				arg_199_1:CheckSpriteTmpPos("10016", 2)
			end

			local var_202_9 = 0.001

			if var_202_8 <= arg_199_1.time_ and arg_199_1.time_ < var_202_8 + var_202_9 then
				local var_202_10 = (arg_199_1.time_ - var_202_8) / var_202_9
				local var_202_11 = Vector3.New(-390, -350, -180)

				var_202_7.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos10016, var_202_11, var_202_10)
			end

			if arg_199_1.time_ >= var_202_8 + var_202_9 and arg_199_1.time_ < var_202_8 + var_202_9 + arg_202_0 then
				var_202_7.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_202_12 = arg_199_1.actors_["10015"]
			local var_202_13 = 0

			if var_202_13 < arg_199_1.time_ and arg_199_1.time_ <= var_202_13 + arg_202_0 and arg_199_1.var_.actorSpriteComps10015 == nil then
				arg_199_1.var_.actorSpriteComps10015 = var_202_12:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_14 = 0.034

			if var_202_13 <= arg_199_1.time_ and arg_199_1.time_ < var_202_13 + var_202_14 then
				local var_202_15 = (arg_199_1.time_ - var_202_13) / var_202_14

				if arg_199_1.var_.actorSpriteComps10015 then
					for iter_202_1, iter_202_2 in pairs(arg_199_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_202_2 then
							local var_202_16 = Mathf.Lerp(iter_202_2.color.r, 1, var_202_15)

							iter_202_2.color = Color.New(var_202_16, var_202_16, var_202_16)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_13 + var_202_14 and arg_199_1.time_ < var_202_13 + var_202_14 + arg_202_0 and arg_199_1.var_.actorSpriteComps10015 then
				local var_202_17 = 1

				for iter_202_3, iter_202_4 in pairs(arg_199_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_202_4 then
						iter_202_4.color = Color.New(var_202_17, var_202_17, var_202_17)
					end
				end

				arg_199_1.var_.actorSpriteComps10015 = nil
			end

			local var_202_18 = arg_199_1.actors_["10016"]
			local var_202_19 = 0

			if var_202_19 < arg_199_1.time_ and arg_199_1.time_ <= var_202_19 + arg_202_0 then
				local var_202_20 = var_202_18:GetComponent("Image")

				if var_202_20 then
					arg_199_1.var_.highlightMatValue10016 = var_202_20
				end
			end

			local var_202_21 = 0.034

			if var_202_19 <= arg_199_1.time_ and arg_199_1.time_ < var_202_19 + var_202_21 then
				local var_202_22 = (arg_199_1.time_ - var_202_19) / var_202_21

				if arg_199_1.var_.highlightMatValue10016 then
					local var_202_23 = Mathf.Lerp(1, 0.5, var_202_22)
					local var_202_24 = arg_199_1.var_.highlightMatValue10016
					local var_202_25 = var_202_24.color

					var_202_25.r = var_202_23
					var_202_25.g = var_202_23
					var_202_25.b = var_202_23
					var_202_24.color = var_202_25
				end
			end

			if arg_199_1.time_ >= var_202_19 + var_202_21 and arg_199_1.time_ < var_202_19 + var_202_21 + arg_202_0 and arg_199_1.var_.highlightMatValue10016 then
				local var_202_26 = 0.5
				local var_202_27 = arg_199_1.var_.highlightMatValue10016
				local var_202_28 = var_202_27.color

				var_202_28.r = var_202_26
				var_202_28.g = var_202_26
				var_202_28.b = var_202_26
				var_202_27.color = var_202_28
			end

			local var_202_29 = arg_199_1.actors_["10015"]
			local var_202_30 = 0

			if var_202_30 < arg_199_1.time_ and arg_199_1.time_ <= var_202_30 + arg_202_0 then
				local var_202_31 = var_202_29:GetComponentInChildren(typeof(CanvasGroup))

				if var_202_31 then
					arg_199_1.var_.alphaOldValue10015 = var_202_31.alpha
					arg_199_1.var_.characterEffect10015 = var_202_31
				end

				arg_199_1.var_.alphaOldValue10015 = 0
			end

			local var_202_32 = 0.5

			if var_202_30 <= arg_199_1.time_ and arg_199_1.time_ < var_202_30 + var_202_32 then
				local var_202_33 = (arg_199_1.time_ - var_202_30) / var_202_32
				local var_202_34 = Mathf.Lerp(arg_199_1.var_.alphaOldValue10015, 1, var_202_33)

				if arg_199_1.var_.characterEffect10015 then
					arg_199_1.var_.characterEffect10015.alpha = var_202_34
				end
			end

			if arg_199_1.time_ >= var_202_30 + var_202_32 and arg_199_1.time_ < var_202_30 + var_202_32 + arg_202_0 and arg_199_1.var_.characterEffect10015 then
				arg_199_1.var_.characterEffect10015.alpha = 1
			end

			local var_202_35 = arg_199_1.actors_["10016"]
			local var_202_36 = 0

			if var_202_36 < arg_199_1.time_ and arg_199_1.time_ <= var_202_36 + arg_202_0 then
				local var_202_37 = var_202_35:GetComponent("Image")

				if var_202_37 then
					arg_199_1.var_.alphaMatValue10016 = var_202_37
					arg_199_1.var_.alphaOldValue10016 = var_202_37.color.a
				end

				arg_199_1.var_.alphaOldValue10016 = 0
			end

			local var_202_38 = 0.5

			if var_202_36 <= arg_199_1.time_ and arg_199_1.time_ < var_202_36 + var_202_38 then
				local var_202_39 = (arg_199_1.time_ - var_202_36) / var_202_38
				local var_202_40 = Mathf.Lerp(arg_199_1.var_.alphaOldValue10016, 1, var_202_39)

				if arg_199_1.var_.alphaMatValue10016 then
					local var_202_41 = arg_199_1.var_.alphaMatValue10016.color

					var_202_41.a = var_202_40
					arg_199_1.var_.alphaMatValue10016.color = var_202_41
				end
			end

			if arg_199_1.time_ >= var_202_36 + var_202_38 and arg_199_1.time_ < var_202_36 + var_202_38 + arg_202_0 and arg_199_1.var_.alphaMatValue10016 then
				local var_202_42 = arg_199_1.var_.alphaMatValue10016
				local var_202_43 = var_202_42.color

				var_202_43.a = 1
				var_202_42.color = var_202_43
			end

			local var_202_44 = 0
			local var_202_45 = 0.7

			if var_202_44 < arg_199_1.time_ and arg_199_1.time_ <= var_202_44 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_46 = arg_199_1:FormatText(StoryNameCfg[208].name)

				arg_199_1.leftNameTxt_.text = var_202_46

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_47 = arg_199_1:GetWordFromCfg(114291049)
				local var_202_48 = arg_199_1:FormatText(var_202_47.content)

				arg_199_1.text_.text = var_202_48

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_49 = 28
				local var_202_50 = utf8.len(var_202_48)
				local var_202_51 = var_202_49 <= 0 and var_202_45 or var_202_45 * (var_202_50 / var_202_49)

				if var_202_51 > 0 and var_202_45 < var_202_51 then
					arg_199_1.talkMaxDuration = var_202_51

					if var_202_51 + var_202_44 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_51 + var_202_44
					end
				end

				arg_199_1.text_.text = var_202_48
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291049", "story_v_out_114291.awb") ~= 0 then
					local var_202_52 = manager.audio:GetVoiceLength("story_v_out_114291", "114291049", "story_v_out_114291.awb") / 1000

					if var_202_52 + var_202_44 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_52 + var_202_44
					end

					if var_202_47.prefab_name ~= "" and arg_199_1.actors_[var_202_47.prefab_name] ~= nil then
						local var_202_53 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_47.prefab_name].transform, "story_v_out_114291", "114291049", "story_v_out_114291.awb")

						arg_199_1:RecordAudio("114291049", var_202_53)
						arg_199_1:RecordAudio("114291049", var_202_53)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_114291", "114291049", "story_v_out_114291.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_114291", "114291049", "story_v_out_114291.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_54 = math.max(var_202_45, arg_199_1.talkMaxDuration)

			if var_202_44 <= arg_199_1.time_ and arg_199_1.time_ < var_202_44 + var_202_54 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_44) / var_202_54

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_44 + var_202_54 and arg_199_1.time_ < var_202_44 + var_202_54 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play114291050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 114291050
		arg_203_1.duration_ = 21.433

		local var_203_0 = {
			ja = 17.6,
			ko = 19.266,
			zh = 16.6,
			en = 21.433
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
			arg_203_1.auto_ = false
		end

		function arg_203_1.playNext_(arg_205_0)
			arg_203_1.onStoryFinished_()
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["10015"].transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPos10015 = var_206_0.localPosition
				var_206_0.localScale = Vector3.New(1, 1, 1)

				arg_203_1:CheckSpriteTmpPos("10015", 4)

				local var_206_2 = var_206_0.childCount

				for iter_206_0 = 0, var_206_2 - 1 do
					local var_206_3 = var_206_0:GetChild(iter_206_0)

					if var_206_3.name == "split_2" or not string.find(var_206_3.name, "split") then
						var_206_3.gameObject:SetActive(true)
					else
						var_206_3.gameObject:SetActive(false)
					end
				end
			end

			local var_206_4 = 0.001

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_4 then
				local var_206_5 = (arg_203_1.time_ - var_206_1) / var_206_4
				local var_206_6 = Vector3.New(390, -350, -180)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos10015, var_206_6, var_206_5)
			end

			if arg_203_1.time_ >= var_206_1 + var_206_4 and arg_203_1.time_ < var_206_1 + var_206_4 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_206_7 = arg_203_1.actors_["10015"]
			local var_206_8 = 0

			if var_206_8 < arg_203_1.time_ and arg_203_1.time_ <= var_206_8 + arg_206_0 and arg_203_1.var_.actorSpriteComps10015 == nil then
				arg_203_1.var_.actorSpriteComps10015 = var_206_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_9 = 0.034

			if var_206_8 <= arg_203_1.time_ and arg_203_1.time_ < var_206_8 + var_206_9 then
				local var_206_10 = (arg_203_1.time_ - var_206_8) / var_206_9

				if arg_203_1.var_.actorSpriteComps10015 then
					for iter_206_1, iter_206_2 in pairs(arg_203_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_206_2 then
							local var_206_11 = Mathf.Lerp(iter_206_2.color.r, 1, var_206_10)

							iter_206_2.color = Color.New(var_206_11, var_206_11, var_206_11)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_8 + var_206_9 and arg_203_1.time_ < var_206_8 + var_206_9 + arg_206_0 and arg_203_1.var_.actorSpriteComps10015 then
				local var_206_12 = 1

				for iter_206_3, iter_206_4 in pairs(arg_203_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_206_4 then
						iter_206_4.color = Color.New(var_206_12, var_206_12, var_206_12)
					end
				end

				arg_203_1.var_.actorSpriteComps10015 = nil
			end

			local var_206_13 = arg_203_1.actors_["10015"]
			local var_206_14 = 0

			if var_206_14 < arg_203_1.time_ and arg_203_1.time_ <= var_206_14 + arg_206_0 then
				local var_206_15 = var_206_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_206_15 then
					arg_203_1.var_.alphaOldValue10015 = var_206_15.alpha
					arg_203_1.var_.characterEffect10015 = var_206_15
				end

				arg_203_1.var_.alphaOldValue10015 = 0
			end

			local var_206_16 = 0.0166666666666667

			if var_206_14 <= arg_203_1.time_ and arg_203_1.time_ < var_206_14 + var_206_16 then
				local var_206_17 = (arg_203_1.time_ - var_206_14) / var_206_16
				local var_206_18 = Mathf.Lerp(arg_203_1.var_.alphaOldValue10015, 1, var_206_17)

				if arg_203_1.var_.characterEffect10015 then
					arg_203_1.var_.characterEffect10015.alpha = var_206_18
				end
			end

			if arg_203_1.time_ >= var_206_14 + var_206_16 and arg_203_1.time_ < var_206_14 + var_206_16 + arg_206_0 and arg_203_1.var_.characterEffect10015 then
				arg_203_1.var_.characterEffect10015.alpha = 1
			end

			local var_206_19 = 0
			local var_206_20 = 1.575

			if var_206_19 < arg_203_1.time_ and arg_203_1.time_ <= var_206_19 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_21 = arg_203_1:FormatText(StoryNameCfg[208].name)

				arg_203_1.leftNameTxt_.text = var_206_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_22 = arg_203_1:GetWordFromCfg(114291050)
				local var_206_23 = arg_203_1:FormatText(var_206_22.content)

				arg_203_1.text_.text = var_206_23

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_24 = 63
				local var_206_25 = utf8.len(var_206_23)
				local var_206_26 = var_206_24 <= 0 and var_206_20 or var_206_20 * (var_206_25 / var_206_24)

				if var_206_26 > 0 and var_206_20 < var_206_26 then
					arg_203_1.talkMaxDuration = var_206_26

					if var_206_26 + var_206_19 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_26 + var_206_19
					end
				end

				arg_203_1.text_.text = var_206_23
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114291", "114291050", "story_v_out_114291.awb") ~= 0 then
					local var_206_27 = manager.audio:GetVoiceLength("story_v_out_114291", "114291050", "story_v_out_114291.awb") / 1000

					if var_206_27 + var_206_19 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_27 + var_206_19
					end

					if var_206_22.prefab_name ~= "" and arg_203_1.actors_[var_206_22.prefab_name] ~= nil then
						local var_206_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_22.prefab_name].transform, "story_v_out_114291", "114291050", "story_v_out_114291.awb")

						arg_203_1:RecordAudio("114291050", var_206_28)
						arg_203_1:RecordAudio("114291050", var_206_28)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_114291", "114291050", "story_v_out_114291.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_114291", "114291050", "story_v_out_114291.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_29 = math.max(var_206_20, arg_203_1.talkMaxDuration)

			if var_206_19 <= arg_203_1.time_ and arg_203_1.time_ < var_206_19 + var_206_29 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_19) / var_206_29

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_19 + var_206_29 and arg_203_1.time_ < var_206_19 + var_206_29 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST26",
		"Assets/UIResources/UI_AB/TextureConfig/Background/OM0503"
	},
	voices = {
		"story_v_out_114291.awb"
	}
}
