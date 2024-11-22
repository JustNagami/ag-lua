return {
	Play120011001 = function(arg_1_0, arg_1_1)
		arg_1_1.marker = "Mark1"
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 120011001
		arg_1_1.duration_ = 178.375

		local var_1_0 = {
			zh = 166.099999999999,
			ja = 178.375
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
			arg_1_1.marker = ""

			if arg_3_0 == 1 then
				arg_1_0:Play120011002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "XH0101"

			if arg_1_1.bgs_[var_4_0] == nil then
				local var_4_1 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_0)
				var_4_1.name = var_4_0
				var_4_1.transform.parent = arg_1_1.stage_.transform
				var_4_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_0] = var_4_1
			end

			local var_4_2 = 141.5

			if var_4_2 < arg_1_1.time_ and arg_1_1.time_ <= var_4_2 + arg_4_0 then
				local var_4_3 = manager.ui.mainCamera.transform.localPosition
				local var_4_4 = Vector3.New(0, 0, 10) + Vector3.New(var_4_3.x, var_4_3.y, 0)
				local var_4_5 = arg_1_1.bgs_.XH0101

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
					if iter_4_0 ~= "XH0101" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 141.5

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_17 = 4.5

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

			local var_4_22 = 138

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_23 = 3.5

			if var_4_22 <= arg_1_1.time_ and arg_1_1.time_ < var_4_22 + var_4_23 then
				local var_4_24 = (arg_1_1.time_ - var_4_22) / var_4_23
				local var_4_25 = Color.New(0, 0, 0)

				var_4_25.a = Mathf.Lerp(0, 1, var_4_24)
				arg_1_1.mask_.color = var_4_25
			end

			if arg_1_1.time_ >= var_4_22 + var_4_23 and arg_1_1.time_ < var_4_22 + var_4_23 + arg_4_0 then
				local var_4_26 = Color.New(0, 0, 0)

				var_4_26.a = 1
				arg_1_1.mask_.color = var_4_26
			end

			local var_4_27 = arg_1_1.bgs_.XH0101.transform
			local var_4_28 = 141.5

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				arg_1_1.var_.moveOldPosXH0101 = var_4_27.localPosition
			end

			local var_4_29 = 0.001

			if var_4_28 <= arg_1_1.time_ and arg_1_1.time_ < var_4_28 + var_4_29 then
				local var_4_30 = (arg_1_1.time_ - var_4_28) / var_4_29
				local var_4_31 = Vector3.New(0, 0.5, 2)

				var_4_27.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPosXH0101, var_4_31, var_4_30)
			end

			if arg_1_1.time_ >= var_4_28 + var_4_29 and arg_1_1.time_ < var_4_28 + var_4_29 + arg_4_0 then
				var_4_27.localPosition = Vector3.New(0, 0.5, 2)
			end

			local var_4_32 = arg_1_1.bgs_.XH0101.transform
			local var_4_33 = 141.534

			if var_4_33 < arg_1_1.time_ and arg_1_1.time_ <= var_4_33 + arg_4_0 then
				arg_1_1.var_.moveOldPosXH0101 = var_4_32.localPosition
			end

			local var_4_34 = 5

			if var_4_33 <= arg_1_1.time_ and arg_1_1.time_ < var_4_33 + var_4_34 then
				local var_4_35 = (arg_1_1.time_ - var_4_33) / var_4_34
				local var_4_36 = Vector3.New(-0.5, 0.5, 2)

				var_4_32.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPosXH0101, var_4_36, var_4_35)
			end

			if arg_1_1.time_ >= var_4_33 + var_4_34 and arg_1_1.time_ < var_4_33 + var_4_34 + arg_4_0 then
				var_4_32.localPosition = Vector3.New(-0.5, 0.5, 2)
			end

			local var_4_37 = 145.409

			if var_4_37 < arg_1_1.time_ and arg_1_1.time_ <= var_4_37 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_38 = 1.12500000000001

			if arg_1_1.time_ >= var_4_37 + var_4_38 and arg_1_1.time_ < var_4_37 + var_4_38 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_39 = 143.4
			local var_4_40 = 1

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				local var_4_41 = "play"
				local var_4_42 = "music"

				arg_1_1:AudioAction(var_4_41, var_4_42, "bgm_activity_2_0_story_tianlu", "bgm_activity_2_0_story_tianlu", "bgm_activity_2_0_story_tianlu.awb")
			end

			local var_4_43 = 0
			local var_4_44 = 1

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				local var_4_45 = "play"
				local var_4_46 = "music"

				arg_1_1:AudioAction(var_4_45, var_4_46, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_47 = 0

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 then
				SetActive(arg_1_1.dialog_, false)
				SetActive(arg_1_1.allBtn_.gameObject, false)
				arg_1_1.hideBtnsController_:SetSelectedIndex(1)

				arg_1_1.marker = "PlayCantSkipVideo"

				manager.video:Play("SofdecAsset/story/101200101.usm", function(arg_5_0)
					arg_1_1.time_ = var_4_47 + 141.490000000224

					if arg_1_1.state_ == "pause" then
						arg_1_1.state_ = "playing"
					end

					manager.video:Dispose()
				end, nil, nil, function(arg_6_0)
					if arg_6_0 then
						arg_1_1.state_ = "pause"
					else
						arg_1_1.state_ = "playing"
					end
				end, 101200101)
				manager.video.transform_:SetSiblingIndex(1)
			end

			local var_4_48 = 141.5

			if var_4_47 <= arg_1_1.time_ and arg_1_1.time_ < var_4_47 + var_4_48 then
				-- block empty
			end

			if arg_1_1.time_ >= var_4_47 + var_4_48 and arg_1_1.time_ < var_4_47 + var_4_48 + arg_4_0 then
				arg_1_1.marker = ""
			end

			local var_4_49 = 141.5

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				SetActive(arg_1_1.dialog_, true)
				SetActive(arg_1_1.allBtn_.gameObject, true)
				arg_1_1.hideBtnsController_:SetSelectedIndex(0)
				manager.video:Dispose()
			end

			local var_4_50 = 0.199999999999989

			if var_4_49 <= arg_1_1.time_ and arg_1_1.time_ < var_4_49 + var_4_50 then
				-- block empty
			end

			if arg_1_1.time_ >= var_4_49 + var_4_50 and arg_1_1.time_ < var_4_49 + var_4_50 + arg_4_0 then
				-- block empty
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_51 = 145.409
			local var_4_52 = 1.125

			if var_4_51 < arg_1_1.time_ and arg_1_1.time_ <= var_4_51 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_53 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_53:setOnUpdate(LuaHelper.FloatAction(function(arg_7_0)
					arg_1_1.dialogCg_.alpha = arg_7_0
				end))
				var_4_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_54 = arg_1_1:FormatText(StoryNameCfg[319].name)

				arg_1_1.leftNameTxt_.text = var_4_54

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_55 = arg_1_1:GetWordFromCfg(120011001)
				local var_4_56 = arg_1_1:FormatText(var_4_55.content)

				arg_1_1.text_.text = var_4_56

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_57 = 45
				local var_4_58 = utf8.len(var_4_56)
				local var_4_59 = var_4_57 <= 0 and var_4_52 or var_4_52 * (var_4_58 / var_4_57)

				if var_4_59 > 0 and var_4_52 < var_4_59 then
					arg_1_1.talkMaxDuration = var_4_59
					var_4_51 = var_4_51 + 0.3

					if var_4_59 + var_4_51 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_59 + var_4_51
					end
				end

				arg_1_1.text_.text = var_4_56
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011001", "story_v_out_120011.awb") ~= 0 then
					local var_4_60 = manager.audio:GetVoiceLength("story_v_out_120011", "120011001", "story_v_out_120011.awb") / 1000

					if var_4_60 + var_4_51 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_60 + var_4_51
					end

					if var_4_55.prefab_name ~= "" and arg_1_1.actors_[var_4_55.prefab_name] ~= nil then
						local var_4_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_55.prefab_name].transform, "story_v_out_120011", "120011001", "story_v_out_120011.awb")

						arg_1_1:RecordAudio("120011001", var_4_61)
						arg_1_1:RecordAudio("120011001", var_4_61)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_120011", "120011001", "story_v_out_120011.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_120011", "120011001", "story_v_out_120011.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_62 = var_4_51 + 0.3
			local var_4_63 = math.max(var_4_52, arg_1_1.talkMaxDuration)

			if var_4_62 <= arg_1_1.time_ and arg_1_1.time_ < var_4_62 + var_4_63 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_62) / var_4_63

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_62 + var_4_63 and arg_1_1.time_ < var_4_62 + var_4_63 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play120011002 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 120011002
		arg_9_1.duration_ = 5

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play120011003(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = 0
			local var_12_1 = 1.5

			if var_12_0 < arg_9_1.time_ and arg_9_1.time_ <= var_12_0 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0
				arg_9_1.dialogCg_.alpha = 1

				arg_9_1.dialog_:SetActive(true)
				SetActive(arg_9_1.leftNameGo_, false)

				arg_9_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_9_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_9_1:RecordName(arg_9_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_9_1.iconTrs_.gameObject, false)
				arg_9_1.callingController_:SetSelectedState("normal")

				local var_12_2 = arg_9_1:GetWordFromCfg(120011002)
				local var_12_3 = arg_9_1:FormatText(var_12_2.content)

				arg_9_1.text_.text = var_12_3

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_4 = 60
				local var_12_5 = utf8.len(var_12_3)
				local var_12_6 = var_12_4 <= 0 and var_12_1 or var_12_1 * (var_12_5 / var_12_4)

				if var_12_6 > 0 and var_12_1 < var_12_6 then
					arg_9_1.talkMaxDuration = var_12_6

					if var_12_6 + var_12_0 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_6 + var_12_0
					end
				end

				arg_9_1.text_.text = var_12_3
				arg_9_1.typewritter.percent = 0

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(false)
				arg_9_1:RecordContent(arg_9_1.text_.text)
			end

			local var_12_7 = math.max(var_12_1, arg_9_1.talkMaxDuration)

			if var_12_0 <= arg_9_1.time_ and arg_9_1.time_ < var_12_0 + var_12_7 then
				arg_9_1.typewritter.percent = (arg_9_1.time_ - var_12_0) / var_12_7

				arg_9_1.typewritter:SetDirty()
			end

			if arg_9_1.time_ >= var_12_0 + var_12_7 and arg_9_1.time_ < var_12_0 + var_12_7 + arg_12_0 then
				arg_9_1.typewritter.percent = 1

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(true)
			end
		end
	end,
	Play120011003 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 120011003
		arg_13_1.duration_ = 3.466

		local var_13_0 = {
			zh = 3.466,
			ja = 3.233
		}
		local var_13_1 = manager.audio:GetLocalizationFlag()

		if var_13_0[var_13_1] ~= nil then
			arg_13_1.duration_ = var_13_0[var_13_1]
		end

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play120011004(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = 0
			local var_16_1 = 0.325

			if var_16_0 < arg_13_1.time_ and arg_13_1.time_ <= var_16_0 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, true)

				local var_16_2 = arg_13_1:FormatText(StoryNameCfg[319].name)

				arg_13_1.leftNameTxt_.text = var_16_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_13_1.leftNameTxt_.transform)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1.leftNameTxt_.text)
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_3 = arg_13_1:GetWordFromCfg(120011003)
				local var_16_4 = arg_13_1:FormatText(var_16_3.content)

				arg_13_1.text_.text = var_16_4

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_5 = 13
				local var_16_6 = utf8.len(var_16_4)
				local var_16_7 = var_16_5 <= 0 and var_16_1 or var_16_1 * (var_16_6 / var_16_5)

				if var_16_7 > 0 and var_16_1 < var_16_7 then
					arg_13_1.talkMaxDuration = var_16_7

					if var_16_7 + var_16_0 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_7 + var_16_0
					end
				end

				arg_13_1.text_.text = var_16_4
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011003", "story_v_out_120011.awb") ~= 0 then
					local var_16_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011003", "story_v_out_120011.awb") / 1000

					if var_16_8 + var_16_0 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_8 + var_16_0
					end

					if var_16_3.prefab_name ~= "" and arg_13_1.actors_[var_16_3.prefab_name] ~= nil then
						local var_16_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_13_1.actors_[var_16_3.prefab_name].transform, "story_v_out_120011", "120011003", "story_v_out_120011.awb")

						arg_13_1:RecordAudio("120011003", var_16_9)
						arg_13_1:RecordAudio("120011003", var_16_9)
					else
						arg_13_1:AudioAction("play", "voice", "story_v_out_120011", "120011003", "story_v_out_120011.awb")
					end

					arg_13_1:RecordHistoryTalkVoice("story_v_out_120011", "120011003", "story_v_out_120011.awb")
				end

				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_10 = math.max(var_16_1, arg_13_1.talkMaxDuration)

			if var_16_0 <= arg_13_1.time_ and arg_13_1.time_ < var_16_0 + var_16_10 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_0) / var_16_10

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_0 + var_16_10 and arg_13_1.time_ < var_16_0 + var_16_10 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play120011004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 120011004
		arg_17_1.duration_ = 5

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play120011005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0
			local var_20_1 = 0.4

			if var_20_0 < arg_17_1.time_ and arg_17_1.time_ <= var_20_0 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, false)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_2 = arg_17_1:GetWordFromCfg(120011004)
				local var_20_3 = arg_17_1:FormatText(var_20_2.content)

				arg_17_1.text_.text = var_20_3

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_4 = 16
				local var_20_5 = utf8.len(var_20_3)
				local var_20_6 = var_20_4 <= 0 and var_20_1 or var_20_1 * (var_20_5 / var_20_4)

				if var_20_6 > 0 and var_20_1 < var_20_6 then
					arg_17_1.talkMaxDuration = var_20_6

					if var_20_6 + var_20_0 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_6 + var_20_0
					end
				end

				arg_17_1.text_.text = var_20_3
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)
				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_7 = math.max(var_20_1, arg_17_1.talkMaxDuration)

			if var_20_0 <= arg_17_1.time_ and arg_17_1.time_ < var_20_0 + var_20_7 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_0) / var_20_7

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_0 + var_20_7 and arg_17_1.time_ < var_20_0 + var_20_7 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play120011005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 120011005
		arg_21_1.duration_ = 5

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play120011006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0
			local var_24_1 = 1.35

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, false)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_2 = arg_21_1:GetWordFromCfg(120011005)
				local var_24_3 = arg_21_1:FormatText(var_24_2.content)

				arg_21_1.text_.text = var_24_3

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_4 = 50
				local var_24_5 = utf8.len(var_24_3)
				local var_24_6 = var_24_4 <= 0 and var_24_1 or var_24_1 * (var_24_5 / var_24_4)

				if var_24_6 > 0 and var_24_1 < var_24_6 then
					arg_21_1.talkMaxDuration = var_24_6

					if var_24_6 + var_24_0 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_6 + var_24_0
					end
				end

				arg_21_1.text_.text = var_24_3
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)
				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_7 = math.max(var_24_1, arg_21_1.talkMaxDuration)

			if var_24_0 <= arg_21_1.time_ and arg_21_1.time_ < var_24_0 + var_24_7 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_0) / var_24_7

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_0 + var_24_7 and arg_21_1.time_ < var_24_0 + var_24_7 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play120011006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 120011006
		arg_25_1.duration_ = 7.033

		local var_25_0 = {
			zh = 5.266,
			ja = 7.033
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
				arg_25_0:Play120011007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = 0
			local var_28_1 = 0.625

			if var_28_0 < arg_25_1.time_ and arg_25_1.time_ <= var_28_0 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_2 = arg_25_1:FormatText(StoryNameCfg[319].name)

				arg_25_1.leftNameTxt_.text = var_28_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_3 = arg_25_1:GetWordFromCfg(120011006)
				local var_28_4 = arg_25_1:FormatText(var_28_3.content)

				arg_25_1.text_.text = var_28_4

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011006", "story_v_out_120011.awb") ~= 0 then
					local var_28_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011006", "story_v_out_120011.awb") / 1000

					if var_28_8 + var_28_0 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_8 + var_28_0
					end

					if var_28_3.prefab_name ~= "" and arg_25_1.actors_[var_28_3.prefab_name] ~= nil then
						local var_28_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_3.prefab_name].transform, "story_v_out_120011", "120011006", "story_v_out_120011.awb")

						arg_25_1:RecordAudio("120011006", var_28_9)
						arg_25_1:RecordAudio("120011006", var_28_9)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_120011", "120011006", "story_v_out_120011.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_120011", "120011006", "story_v_out_120011.awb")
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
	Play120011007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 120011007
		arg_29_1.duration_ = 4.733

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play120011008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0
			local var_32_1 = 0.5

			if var_32_0 < arg_29_1.time_ and arg_29_1.time_ <= var_32_0 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_2 = arg_29_1:FormatText(StoryNameCfg[36].name)

				arg_29_1.leftNameTxt_.text = var_32_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_3 = arg_29_1:GetWordFromCfg(120011007)
				local var_32_4 = arg_29_1:FormatText(var_32_3.content)

				arg_29_1.text_.text = var_32_4

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_5 = 20
				local var_32_6 = utf8.len(var_32_4)
				local var_32_7 = var_32_5 <= 0 and var_32_1 or var_32_1 * (var_32_6 / var_32_5)

				if var_32_7 > 0 and var_32_1 < var_32_7 then
					arg_29_1.talkMaxDuration = var_32_7

					if var_32_7 + var_32_0 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_7 + var_32_0
					end
				end

				arg_29_1.text_.text = var_32_4
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011007", "story_v_out_120011.awb") ~= 0 then
					local var_32_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011007", "story_v_out_120011.awb") / 1000

					if var_32_8 + var_32_0 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_8 + var_32_0
					end

					if var_32_3.prefab_name ~= "" and arg_29_1.actors_[var_32_3.prefab_name] ~= nil then
						local var_32_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_3.prefab_name].transform, "story_v_out_120011", "120011007", "story_v_out_120011.awb")

						arg_29_1:RecordAudio("120011007", var_32_9)
						arg_29_1:RecordAudio("120011007", var_32_9)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_120011", "120011007", "story_v_out_120011.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_120011", "120011007", "story_v_out_120011.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_10 = math.max(var_32_1, arg_29_1.talkMaxDuration)

			if var_32_0 <= arg_29_1.time_ and arg_29_1.time_ < var_32_0 + var_32_10 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_0) / var_32_10

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_0 + var_32_10 and arg_29_1.time_ < var_32_0 + var_32_10 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play120011008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 120011008
		arg_33_1.duration_ = 3.633

		local var_33_0 = {
			zh = 3.2,
			ja = 3.633
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
				arg_33_0:Play120011009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = 0
			local var_36_1 = 0.425

			if var_36_0 < arg_33_1.time_ and arg_33_1.time_ <= var_36_0 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_2 = arg_33_1:FormatText(StoryNameCfg[36].name)

				arg_33_1.leftNameTxt_.text = var_36_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_3 = arg_33_1:GetWordFromCfg(120011008)
				local var_36_4 = arg_33_1:FormatText(var_36_3.content)

				arg_33_1.text_.text = var_36_4

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_5 = 17
				local var_36_6 = utf8.len(var_36_4)
				local var_36_7 = var_36_5 <= 0 and var_36_1 or var_36_1 * (var_36_6 / var_36_5)

				if var_36_7 > 0 and var_36_1 < var_36_7 then
					arg_33_1.talkMaxDuration = var_36_7

					if var_36_7 + var_36_0 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_7 + var_36_0
					end
				end

				arg_33_1.text_.text = var_36_4
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011008", "story_v_out_120011.awb") ~= 0 then
					local var_36_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011008", "story_v_out_120011.awb") / 1000

					if var_36_8 + var_36_0 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_8 + var_36_0
					end

					if var_36_3.prefab_name ~= "" and arg_33_1.actors_[var_36_3.prefab_name] ~= nil then
						local var_36_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_3.prefab_name].transform, "story_v_out_120011", "120011008", "story_v_out_120011.awb")

						arg_33_1:RecordAudio("120011008", var_36_9)
						arg_33_1:RecordAudio("120011008", var_36_9)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_120011", "120011008", "story_v_out_120011.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_120011", "120011008", "story_v_out_120011.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_10 = math.max(var_36_1, arg_33_1.talkMaxDuration)

			if var_36_0 <= arg_33_1.time_ and arg_33_1.time_ < var_36_0 + var_36_10 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_0) / var_36_10

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_0 + var_36_10 and arg_33_1.time_ < var_36_0 + var_36_10 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play120011009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 120011009
		arg_37_1.duration_ = 12

		local var_37_0 = {
			zh = 12,
			ja = 10.233
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
				arg_37_0:Play120011010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = 0
			local var_40_1 = 1.125

			if var_40_0 < arg_37_1.time_ and arg_37_1.time_ <= var_40_0 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_2 = arg_37_1:FormatText(StoryNameCfg[319].name)

				arg_37_1.leftNameTxt_.text = var_40_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_3 = arg_37_1:GetWordFromCfg(120011009)
				local var_40_4 = arg_37_1:FormatText(var_40_3.content)

				arg_37_1.text_.text = var_40_4

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_5 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011009", "story_v_out_120011.awb") ~= 0 then
					local var_40_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011009", "story_v_out_120011.awb") / 1000

					if var_40_8 + var_40_0 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_8 + var_40_0
					end

					if var_40_3.prefab_name ~= "" and arg_37_1.actors_[var_40_3.prefab_name] ~= nil then
						local var_40_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_3.prefab_name].transform, "story_v_out_120011", "120011009", "story_v_out_120011.awb")

						arg_37_1:RecordAudio("120011009", var_40_9)
						arg_37_1:RecordAudio("120011009", var_40_9)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_120011", "120011009", "story_v_out_120011.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_120011", "120011009", "story_v_out_120011.awb")
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
	Play120011010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 120011010
		arg_41_1.duration_ = 7

		local var_41_0 = {
			zh = 7,
			ja = 6.4
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
				arg_41_0:Play120011011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 0
			local var_44_1 = 0.5

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_2 = arg_41_1:FormatText(StoryNameCfg[319].name)

				arg_41_1.leftNameTxt_.text = var_44_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_3 = arg_41_1:GetWordFromCfg(120011010)
				local var_44_4 = arg_41_1:FormatText(var_44_3.content)

				arg_41_1.text_.text = var_44_4

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_5 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011010", "story_v_out_120011.awb") ~= 0 then
					local var_44_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011010", "story_v_out_120011.awb") / 1000

					if var_44_8 + var_44_0 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_8 + var_44_0
					end

					if var_44_3.prefab_name ~= "" and arg_41_1.actors_[var_44_3.prefab_name] ~= nil then
						local var_44_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_3.prefab_name].transform, "story_v_out_120011", "120011010", "story_v_out_120011.awb")

						arg_41_1:RecordAudio("120011010", var_44_9)
						arg_41_1:RecordAudio("120011010", var_44_9)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_120011", "120011010", "story_v_out_120011.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_120011", "120011010", "story_v_out_120011.awb")
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
	Play120011011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 120011011
		arg_45_1.duration_ = 12.433

		local var_45_0 = {
			zh = 9.666,
			ja = 12.433
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
				arg_45_0:Play120011012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = 0
			local var_48_1 = 1.225

			if var_48_0 < arg_45_1.time_ and arg_45_1.time_ <= var_48_0 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_2 = arg_45_1:FormatText(StoryNameCfg[319].name)

				arg_45_1.leftNameTxt_.text = var_48_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_3 = arg_45_1:GetWordFromCfg(120011011)
				local var_48_4 = arg_45_1:FormatText(var_48_3.content)

				arg_45_1.text_.text = var_48_4

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_5 = 49
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011011", "story_v_out_120011.awb") ~= 0 then
					local var_48_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011011", "story_v_out_120011.awb") / 1000

					if var_48_8 + var_48_0 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_8 + var_48_0
					end

					if var_48_3.prefab_name ~= "" and arg_45_1.actors_[var_48_3.prefab_name] ~= nil then
						local var_48_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_3.prefab_name].transform, "story_v_out_120011", "120011011", "story_v_out_120011.awb")

						arg_45_1:RecordAudio("120011011", var_48_9)
						arg_45_1:RecordAudio("120011011", var_48_9)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_120011", "120011011", "story_v_out_120011.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_120011", "120011011", "story_v_out_120011.awb")
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
	Play120011012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 120011012
		arg_49_1.duration_ = 9.8

		local var_49_0 = {
			zh = 9.266,
			ja = 9.8
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
				arg_49_0:Play120011013(arg_49_1)
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

			local var_52_11 = arg_49_1.bgs_.XH0101.transform
			local var_52_12 = 1.98333333333333

			if var_52_12 < arg_49_1.time_ and arg_49_1.time_ <= var_52_12 + arg_52_0 then
				arg_49_1.var_.moveOldPosXH0101 = var_52_11.localPosition
			end

			local var_52_13 = 0.001

			if var_52_12 <= arg_49_1.time_ and arg_49_1.time_ < var_52_12 + var_52_13 then
				local var_52_14 = (arg_49_1.time_ - var_52_12) / var_52_13
				local var_52_15 = Vector3.New(0, 1, 10)

				var_52_11.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPosXH0101, var_52_15, var_52_14)
			end

			if arg_49_1.time_ >= var_52_12 + var_52_13 and arg_49_1.time_ < var_52_12 + var_52_13 + arg_52_0 then
				var_52_11.localPosition = Vector3.New(0, 1, 10)
			end

			if arg_49_1.frameCnt_ <= 1 then
				arg_49_1.dialog_:SetActive(false)
			end

			local var_52_16 = 4
			local var_52_17 = 0.5

			if var_52_16 < arg_49_1.time_ and arg_49_1.time_ <= var_52_16 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0

				arg_49_1.dialog_:SetActive(true)

				local var_52_18 = LeanTween.value(arg_49_1.dialog_, 0, 1, 0.3)

				var_52_18:setOnUpdate(LuaHelper.FloatAction(function(arg_53_0)
					arg_49_1.dialogCg_.alpha = arg_53_0
				end))
				var_52_18:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_49_1.dialog_)
					var_52_18:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_49_1.duration_ = arg_49_1.duration_ + 0.3

				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_19 = arg_49_1:FormatText(StoryNameCfg[36].name)

				arg_49_1.leftNameTxt_.text = var_52_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_20 = arg_49_1:GetWordFromCfg(120011012)
				local var_52_21 = arg_49_1:FormatText(var_52_20.content)

				arg_49_1.text_.text = var_52_21

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_22 = 20
				local var_52_23 = utf8.len(var_52_21)
				local var_52_24 = var_52_22 <= 0 and var_52_17 or var_52_17 * (var_52_23 / var_52_22)

				if var_52_24 > 0 and var_52_17 < var_52_24 then
					arg_49_1.talkMaxDuration = var_52_24
					var_52_16 = var_52_16 + 0.3

					if var_52_24 + var_52_16 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_24 + var_52_16
					end
				end

				arg_49_1.text_.text = var_52_21
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011012", "story_v_out_120011.awb") ~= 0 then
					local var_52_25 = manager.audio:GetVoiceLength("story_v_out_120011", "120011012", "story_v_out_120011.awb") / 1000

					if var_52_25 + var_52_16 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_25 + var_52_16
					end

					if var_52_20.prefab_name ~= "" and arg_49_1.actors_[var_52_20.prefab_name] ~= nil then
						local var_52_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_20.prefab_name].transform, "story_v_out_120011", "120011012", "story_v_out_120011.awb")

						arg_49_1:RecordAudio("120011012", var_52_26)
						arg_49_1:RecordAudio("120011012", var_52_26)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_120011", "120011012", "story_v_out_120011.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_120011", "120011012", "story_v_out_120011.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_27 = var_52_16 + 0.3
			local var_52_28 = math.max(var_52_17, arg_49_1.talkMaxDuration)

			if var_52_27 <= arg_49_1.time_ and arg_49_1.time_ < var_52_27 + var_52_28 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_27) / var_52_28

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_27 + var_52_28 and arg_49_1.time_ < var_52_27 + var_52_28 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play120011013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 120011013
		arg_55_1.duration_ = 7.633

		local var_55_0 = {
			zh = 7.4,
			ja = 7.633
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
				arg_55_0:Play120011014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.95

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[319].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(120011013)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011013", "story_v_out_120011.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011013", "story_v_out_120011.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_120011", "120011013", "story_v_out_120011.awb")

						arg_55_1:RecordAudio("120011013", var_58_9)
						arg_55_1:RecordAudio("120011013", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_120011", "120011013", "story_v_out_120011.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_120011", "120011013", "story_v_out_120011.awb")
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
	Play120011014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 120011014
		arg_59_1.duration_ = 6.366

		local var_59_0 = {
			zh = 4.866,
			ja = 6.366
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
				arg_59_0:Play120011015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.5

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[319].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(120011014)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011014", "story_v_out_120011.awb") ~= 0 then
					local var_62_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011014", "story_v_out_120011.awb") / 1000

					if var_62_8 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_0
					end

					if var_62_3.prefab_name ~= "" and arg_59_1.actors_[var_62_3.prefab_name] ~= nil then
						local var_62_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_3.prefab_name].transform, "story_v_out_120011", "120011014", "story_v_out_120011.awb")

						arg_59_1:RecordAudio("120011014", var_62_9)
						arg_59_1:RecordAudio("120011014", var_62_9)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_120011", "120011014", "story_v_out_120011.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_120011", "120011014", "story_v_out_120011.awb")
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
	Play120011015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 120011015
		arg_63_1.duration_ = 4.066

		local var_63_0 = {
			zh = 1.466,
			ja = 4.066
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
				arg_63_0:Play120011016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 0.125

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_2 = arg_63_1:FormatText(StoryNameCfg[36].name)

				arg_63_1.leftNameTxt_.text = var_66_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_3 = arg_63_1:GetWordFromCfg(120011015)
				local var_66_4 = arg_63_1:FormatText(var_66_3.content)

				arg_63_1.text_.text = var_66_4

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_5 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011015", "story_v_out_120011.awb") ~= 0 then
					local var_66_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011015", "story_v_out_120011.awb") / 1000

					if var_66_8 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_8 + var_66_0
					end

					if var_66_3.prefab_name ~= "" and arg_63_1.actors_[var_66_3.prefab_name] ~= nil then
						local var_66_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_3.prefab_name].transform, "story_v_out_120011", "120011015", "story_v_out_120011.awb")

						arg_63_1:RecordAudio("120011015", var_66_9)
						arg_63_1:RecordAudio("120011015", var_66_9)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_120011", "120011015", "story_v_out_120011.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_120011", "120011015", "story_v_out_120011.awb")
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
	Play120011016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 120011016
		arg_67_1.duration_ = 12.733

		local var_67_0 = {
			zh = 12.733,
			ja = 9.366
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
				arg_67_0:Play120011017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 1.225

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_2 = arg_67_1:FormatText(StoryNameCfg[319].name)

				arg_67_1.leftNameTxt_.text = var_70_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_3 = arg_67_1:GetWordFromCfg(120011016)
				local var_70_4 = arg_67_1:FormatText(var_70_3.content)

				arg_67_1.text_.text = var_70_4

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_5 = 49
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011016", "story_v_out_120011.awb") ~= 0 then
					local var_70_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011016", "story_v_out_120011.awb") / 1000

					if var_70_8 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_8 + var_70_0
					end

					if var_70_3.prefab_name ~= "" and arg_67_1.actors_[var_70_3.prefab_name] ~= nil then
						local var_70_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_3.prefab_name].transform, "story_v_out_120011", "120011016", "story_v_out_120011.awb")

						arg_67_1:RecordAudio("120011016", var_70_9)
						arg_67_1:RecordAudio("120011016", var_70_9)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_120011", "120011016", "story_v_out_120011.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_120011", "120011016", "story_v_out_120011.awb")
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
	Play120011017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 120011017
		arg_71_1.duration_ = 11.833

		local var_71_0 = {
			zh = 11.666,
			ja = 11.833
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
				arg_71_0:Play120011018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 1.25

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_2 = arg_71_1:FormatText(StoryNameCfg[319].name)

				arg_71_1.leftNameTxt_.text = var_74_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_3 = arg_71_1:GetWordFromCfg(120011017)
				local var_74_4 = arg_71_1:FormatText(var_74_3.content)

				arg_71_1.text_.text = var_74_4

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_5 = 50
				local var_74_6 = utf8.len(var_74_4)
				local var_74_7 = var_74_5 <= 0 and var_74_1 or var_74_1 * (var_74_6 / var_74_5)

				if var_74_7 > 0 and var_74_1 < var_74_7 then
					arg_71_1.talkMaxDuration = var_74_7

					if var_74_7 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_7 + var_74_0
					end
				end

				arg_71_1.text_.text = var_74_4
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011017", "story_v_out_120011.awb") ~= 0 then
					local var_74_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011017", "story_v_out_120011.awb") / 1000

					if var_74_8 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_8 + var_74_0
					end

					if var_74_3.prefab_name ~= "" and arg_71_1.actors_[var_74_3.prefab_name] ~= nil then
						local var_74_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_3.prefab_name].transform, "story_v_out_120011", "120011017", "story_v_out_120011.awb")

						arg_71_1:RecordAudio("120011017", var_74_9)
						arg_71_1:RecordAudio("120011017", var_74_9)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_120011", "120011017", "story_v_out_120011.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_120011", "120011017", "story_v_out_120011.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_10 = math.max(var_74_1, arg_71_1.talkMaxDuration)

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_10 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_0) / var_74_10

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_0 + var_74_10 and arg_71_1.time_ < var_74_0 + var_74_10 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play120011018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 120011018
		arg_75_1.duration_ = 4.766

		local var_75_0 = {
			zh = 1.566,
			ja = 4.766
		}
		local var_75_1 = manager.audio:GetLocalizationFlag()

		if var_75_0[var_75_1] ~= nil then
			arg_75_1.duration_ = var_75_0[var_75_1]
		end

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play120011019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 0.125

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_2 = arg_75_1:FormatText(StoryNameCfg[36].name)

				arg_75_1.leftNameTxt_.text = var_78_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_3 = arg_75_1:GetWordFromCfg(120011018)
				local var_78_4 = arg_75_1:FormatText(var_78_3.content)

				arg_75_1.text_.text = var_78_4

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_5 = 5
				local var_78_6 = utf8.len(var_78_4)
				local var_78_7 = var_78_5 <= 0 and var_78_1 or var_78_1 * (var_78_6 / var_78_5)

				if var_78_7 > 0 and var_78_1 < var_78_7 then
					arg_75_1.talkMaxDuration = var_78_7

					if var_78_7 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_7 + var_78_0
					end
				end

				arg_75_1.text_.text = var_78_4
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011018", "story_v_out_120011.awb") ~= 0 then
					local var_78_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011018", "story_v_out_120011.awb") / 1000

					if var_78_8 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_8 + var_78_0
					end

					if var_78_3.prefab_name ~= "" and arg_75_1.actors_[var_78_3.prefab_name] ~= nil then
						local var_78_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_3.prefab_name].transform, "story_v_out_120011", "120011018", "story_v_out_120011.awb")

						arg_75_1:RecordAudio("120011018", var_78_9)
						arg_75_1:RecordAudio("120011018", var_78_9)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_120011", "120011018", "story_v_out_120011.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_120011", "120011018", "story_v_out_120011.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_10 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_10 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_10

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_10 and arg_75_1.time_ < var_78_0 + var_78_10 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play120011019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 120011019
		arg_79_1.duration_ = 13.533

		local var_79_0 = {
			zh = 8.466,
			ja = 13.533
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
				arg_79_0:Play120011020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 0.85

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_2 = arg_79_1:FormatText(StoryNameCfg[319].name)

				arg_79_1.leftNameTxt_.text = var_82_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_3 = arg_79_1:GetWordFromCfg(120011019)
				local var_82_4 = arg_79_1:FormatText(var_82_3.content)

				arg_79_1.text_.text = var_82_4

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_5 = 34
				local var_82_6 = utf8.len(var_82_4)
				local var_82_7 = var_82_5 <= 0 and var_82_1 or var_82_1 * (var_82_6 / var_82_5)

				if var_82_7 > 0 and var_82_1 < var_82_7 then
					arg_79_1.talkMaxDuration = var_82_7

					if var_82_7 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_7 + var_82_0
					end
				end

				arg_79_1.text_.text = var_82_4
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011019", "story_v_out_120011.awb") ~= 0 then
					local var_82_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011019", "story_v_out_120011.awb") / 1000

					if var_82_8 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_8 + var_82_0
					end

					if var_82_3.prefab_name ~= "" and arg_79_1.actors_[var_82_3.prefab_name] ~= nil then
						local var_82_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_3.prefab_name].transform, "story_v_out_120011", "120011019", "story_v_out_120011.awb")

						arg_79_1:RecordAudio("120011019", var_82_9)
						arg_79_1:RecordAudio("120011019", var_82_9)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_120011", "120011019", "story_v_out_120011.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_120011", "120011019", "story_v_out_120011.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_10 = math.max(var_82_1, arg_79_1.talkMaxDuration)

			if var_82_0 <= arg_79_1.time_ and arg_79_1.time_ < var_82_0 + var_82_10 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_0) / var_82_10

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_0 + var_82_10 and arg_79_1.time_ < var_82_0 + var_82_10 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play120011020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 120011020
		arg_83_1.duration_ = 3.5

		local var_83_0 = {
			zh = 3.3,
			ja = 3.5
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
				arg_83_0:Play120011021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 0.4

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_2 = arg_83_1:FormatText(StoryNameCfg[319].name)

				arg_83_1.leftNameTxt_.text = var_86_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_3 = arg_83_1:GetWordFromCfg(120011020)
				local var_86_4 = arg_83_1:FormatText(var_86_3.content)

				arg_83_1.text_.text = var_86_4

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011020", "story_v_out_120011.awb") ~= 0 then
					local var_86_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011020", "story_v_out_120011.awb") / 1000

					if var_86_8 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_8 + var_86_0
					end

					if var_86_3.prefab_name ~= "" and arg_83_1.actors_[var_86_3.prefab_name] ~= nil then
						local var_86_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_3.prefab_name].transform, "story_v_out_120011", "120011020", "story_v_out_120011.awb")

						arg_83_1:RecordAudio("120011020", var_86_9)
						arg_83_1:RecordAudio("120011020", var_86_9)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_120011", "120011020", "story_v_out_120011.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_120011", "120011020", "story_v_out_120011.awb")
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
	Play120011021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 120011021
		arg_87_1.duration_ = 13.266

		local var_87_0 = {
			zh = 13.266,
			ja = 12.733
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
				arg_87_0:Play120011022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 1.45

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[319].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(120011021)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 58
				local var_90_6 = utf8.len(var_90_4)
				local var_90_7 = var_90_5 <= 0 and var_90_1 or var_90_1 * (var_90_6 / var_90_5)

				if var_90_7 > 0 and var_90_1 < var_90_7 then
					arg_87_1.talkMaxDuration = var_90_7

					if var_90_7 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_7 + var_90_0
					end
				end

				arg_87_1.text_.text = var_90_4
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011021", "story_v_out_120011.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011021", "story_v_out_120011.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_120011", "120011021", "story_v_out_120011.awb")

						arg_87_1:RecordAudio("120011021", var_90_9)
						arg_87_1:RecordAudio("120011021", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_120011", "120011021", "story_v_out_120011.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_120011", "120011021", "story_v_out_120011.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_10 = math.max(var_90_1, arg_87_1.talkMaxDuration)

			if var_90_0 <= arg_87_1.time_ and arg_87_1.time_ < var_90_0 + var_90_10 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_0) / var_90_10

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_0 + var_90_10 and arg_87_1.time_ < var_90_0 + var_90_10 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play120011022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 120011022
		arg_91_1.duration_ = 9.8

		local var_91_0 = {
			zh = 6.3,
			ja = 9.8
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
				arg_91_0:Play120011023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 0.575

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[319].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(120011022)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011022", "story_v_out_120011.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011022", "story_v_out_120011.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_120011", "120011022", "story_v_out_120011.awb")

						arg_91_1:RecordAudio("120011022", var_94_9)
						arg_91_1:RecordAudio("120011022", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_120011", "120011022", "story_v_out_120011.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_120011", "120011022", "story_v_out_120011.awb")
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
	Play120011023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 120011023
		arg_95_1.duration_ = 4

		local var_95_0 = {
			zh = 3.966,
			ja = 4
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
				arg_95_0:Play120011024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 0.275

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_2 = arg_95_1:FormatText(StoryNameCfg[36].name)

				arg_95_1.leftNameTxt_.text = var_98_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_3 = arg_95_1:GetWordFromCfg(120011023)
				local var_98_4 = arg_95_1:FormatText(var_98_3.content)

				arg_95_1.text_.text = var_98_4

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_5 = 11
				local var_98_6 = utf8.len(var_98_4)
				local var_98_7 = var_98_5 <= 0 and var_98_1 or var_98_1 * (var_98_6 / var_98_5)

				if var_98_7 > 0 and var_98_1 < var_98_7 then
					arg_95_1.talkMaxDuration = var_98_7

					if var_98_7 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_7 + var_98_0
					end
				end

				arg_95_1.text_.text = var_98_4
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011023", "story_v_out_120011.awb") ~= 0 then
					local var_98_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011023", "story_v_out_120011.awb") / 1000

					if var_98_8 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_8 + var_98_0
					end

					if var_98_3.prefab_name ~= "" and arg_95_1.actors_[var_98_3.prefab_name] ~= nil then
						local var_98_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_3.prefab_name].transform, "story_v_out_120011", "120011023", "story_v_out_120011.awb")

						arg_95_1:RecordAudio("120011023", var_98_9)
						arg_95_1:RecordAudio("120011023", var_98_9)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_120011", "120011023", "story_v_out_120011.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_120011", "120011023", "story_v_out_120011.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_10 = math.max(var_98_1, arg_95_1.talkMaxDuration)

			if var_98_0 <= arg_95_1.time_ and arg_95_1.time_ < var_98_0 + var_98_10 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_0) / var_98_10

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_0 + var_98_10 and arg_95_1.time_ < var_98_0 + var_98_10 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play120011024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 120011024
		arg_99_1.duration_ = 4.7

		local var_99_0 = {
			zh = 3.133,
			ja = 4.7
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
				arg_99_0:Play120011025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 0.35

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_2 = arg_99_1:FormatText(StoryNameCfg[319].name)

				arg_99_1.leftNameTxt_.text = var_102_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_3 = arg_99_1:GetWordFromCfg(120011024)
				local var_102_4 = arg_99_1:FormatText(var_102_3.content)

				arg_99_1.text_.text = var_102_4

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_5 = 14
				local var_102_6 = utf8.len(var_102_4)
				local var_102_7 = var_102_5 <= 0 and var_102_1 or var_102_1 * (var_102_6 / var_102_5)

				if var_102_7 > 0 and var_102_1 < var_102_7 then
					arg_99_1.talkMaxDuration = var_102_7

					if var_102_7 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_7 + var_102_0
					end
				end

				arg_99_1.text_.text = var_102_4
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011024", "story_v_out_120011.awb") ~= 0 then
					local var_102_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011024", "story_v_out_120011.awb") / 1000

					if var_102_8 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_8 + var_102_0
					end

					if var_102_3.prefab_name ~= "" and arg_99_1.actors_[var_102_3.prefab_name] ~= nil then
						local var_102_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_3.prefab_name].transform, "story_v_out_120011", "120011024", "story_v_out_120011.awb")

						arg_99_1:RecordAudio("120011024", var_102_9)
						arg_99_1:RecordAudio("120011024", var_102_9)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_120011", "120011024", "story_v_out_120011.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_120011", "120011024", "story_v_out_120011.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_10 = math.max(var_102_1, arg_99_1.talkMaxDuration)

			if var_102_0 <= arg_99_1.time_ and arg_99_1.time_ < var_102_0 + var_102_10 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_0) / var_102_10

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_0 + var_102_10 and arg_99_1.time_ < var_102_0 + var_102_10 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play120011025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 120011025
		arg_103_1.duration_ = 1.266

		local var_103_0 = {
			zh = 1.266,
			ja = 0.999999999999
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
				arg_103_0:Play120011026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 0.05

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_2 = arg_103_1:FormatText(StoryNameCfg[36].name)

				arg_103_1.leftNameTxt_.text = var_106_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_3 = arg_103_1:GetWordFromCfg(120011025)
				local var_106_4 = arg_103_1:FormatText(var_106_3.content)

				arg_103_1.text_.text = var_106_4

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_5 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011025", "story_v_out_120011.awb") ~= 0 then
					local var_106_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011025", "story_v_out_120011.awb") / 1000

					if var_106_8 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_0
					end

					if var_106_3.prefab_name ~= "" and arg_103_1.actors_[var_106_3.prefab_name] ~= nil then
						local var_106_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_3.prefab_name].transform, "story_v_out_120011", "120011025", "story_v_out_120011.awb")

						arg_103_1:RecordAudio("120011025", var_106_9)
						arg_103_1:RecordAudio("120011025", var_106_9)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_120011", "120011025", "story_v_out_120011.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_120011", "120011025", "story_v_out_120011.awb")
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
	Play120011026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 120011026
		arg_107_1.duration_ = 4.733

		local var_107_0 = {
			zh = 4.133,
			ja = 4.733
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
				arg_107_0:Play120011027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 0.575

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_2 = arg_107_1:FormatText(StoryNameCfg[319].name)

				arg_107_1.leftNameTxt_.text = var_110_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_3 = arg_107_1:GetWordFromCfg(120011026)
				local var_110_4 = arg_107_1:FormatText(var_110_3.content)

				arg_107_1.text_.text = var_110_4

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_5 = 23
				local var_110_6 = utf8.len(var_110_4)
				local var_110_7 = var_110_5 <= 0 and var_110_1 or var_110_1 * (var_110_6 / var_110_5)

				if var_110_7 > 0 and var_110_1 < var_110_7 then
					arg_107_1.talkMaxDuration = var_110_7

					if var_110_7 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_7 + var_110_0
					end
				end

				arg_107_1.text_.text = var_110_4
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011026", "story_v_out_120011.awb") ~= 0 then
					local var_110_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011026", "story_v_out_120011.awb") / 1000

					if var_110_8 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_8 + var_110_0
					end

					if var_110_3.prefab_name ~= "" and arg_107_1.actors_[var_110_3.prefab_name] ~= nil then
						local var_110_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_3.prefab_name].transform, "story_v_out_120011", "120011026", "story_v_out_120011.awb")

						arg_107_1:RecordAudio("120011026", var_110_9)
						arg_107_1:RecordAudio("120011026", var_110_9)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_120011", "120011026", "story_v_out_120011.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_120011", "120011026", "story_v_out_120011.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_10 = math.max(var_110_1, arg_107_1.talkMaxDuration)

			if var_110_0 <= arg_107_1.time_ and arg_107_1.time_ < var_110_0 + var_110_10 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_0) / var_110_10

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_0 + var_110_10 and arg_107_1.time_ < var_110_0 + var_110_10 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play120011027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 120011027
		arg_111_1.duration_ = 8.6

		local var_111_0 = {
			zh = 6.1,
			ja = 8.6
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
				arg_111_0:Play120011028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 0.525

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_2 = arg_111_1:FormatText(StoryNameCfg[319].name)

				arg_111_1.leftNameTxt_.text = var_114_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_3 = arg_111_1:GetWordFromCfg(120011027)
				local var_114_4 = arg_111_1:FormatText(var_114_3.content)

				arg_111_1.text_.text = var_114_4

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011027", "story_v_out_120011.awb") ~= 0 then
					local var_114_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011027", "story_v_out_120011.awb") / 1000

					if var_114_8 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_8 + var_114_0
					end

					if var_114_3.prefab_name ~= "" and arg_111_1.actors_[var_114_3.prefab_name] ~= nil then
						local var_114_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_3.prefab_name].transform, "story_v_out_120011", "120011027", "story_v_out_120011.awb")

						arg_111_1:RecordAudio("120011027", var_114_9)
						arg_111_1:RecordAudio("120011027", var_114_9)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_120011", "120011027", "story_v_out_120011.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_120011", "120011027", "story_v_out_120011.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_10 = math.max(var_114_1, arg_111_1.talkMaxDuration)

			if var_114_0 <= arg_111_1.time_ and arg_111_1.time_ < var_114_0 + var_114_10 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_0) / var_114_10

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_0 + var_114_10 and arg_111_1.time_ < var_114_0 + var_114_10 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play120011028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 120011028
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play120011029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.575

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, false)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_2 = arg_115_1:GetWordFromCfg(120011028)
				local var_118_3 = arg_115_1:FormatText(var_118_2.content)

				arg_115_1.text_.text = var_118_3

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_4 = 23
				local var_118_5 = utf8.len(var_118_3)
				local var_118_6 = var_118_4 <= 0 and var_118_1 or var_118_1 * (var_118_5 / var_118_4)

				if var_118_6 > 0 and var_118_1 < var_118_6 then
					arg_115_1.talkMaxDuration = var_118_6

					if var_118_6 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_6 + var_118_0
					end
				end

				arg_115_1.text_.text = var_118_3
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_7 = math.max(var_118_1, arg_115_1.talkMaxDuration)

			if var_118_0 <= arg_115_1.time_ and arg_115_1.time_ < var_118_0 + var_118_7 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_0) / var_118_7

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_0 + var_118_7 and arg_115_1.time_ < var_118_0 + var_118_7 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play120011029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 120011029
		arg_119_1.duration_ = 6.9

		local var_119_0 = {
			zh = 6.9,
			ja = 5.2
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
				arg_119_0:Play120011030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 0.675

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_2 = arg_119_1:FormatText(StoryNameCfg[319].name)

				arg_119_1.leftNameTxt_.text = var_122_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_3 = arg_119_1:GetWordFromCfg(120011029)
				local var_122_4 = arg_119_1:FormatText(var_122_3.content)

				arg_119_1.text_.text = var_122_4

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_5 = 27
				local var_122_6 = utf8.len(var_122_4)
				local var_122_7 = var_122_5 <= 0 and var_122_1 or var_122_1 * (var_122_6 / var_122_5)

				if var_122_7 > 0 and var_122_1 < var_122_7 then
					arg_119_1.talkMaxDuration = var_122_7

					if var_122_7 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_7 + var_122_0
					end
				end

				arg_119_1.text_.text = var_122_4
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011029", "story_v_out_120011.awb") ~= 0 then
					local var_122_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011029", "story_v_out_120011.awb") / 1000

					if var_122_8 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_0
					end

					if var_122_3.prefab_name ~= "" and arg_119_1.actors_[var_122_3.prefab_name] ~= nil then
						local var_122_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_3.prefab_name].transform, "story_v_out_120011", "120011029", "story_v_out_120011.awb")

						arg_119_1:RecordAudio("120011029", var_122_9)
						arg_119_1:RecordAudio("120011029", var_122_9)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_120011", "120011029", "story_v_out_120011.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_120011", "120011029", "story_v_out_120011.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_10 = math.max(var_122_1, arg_119_1.talkMaxDuration)

			if var_122_0 <= arg_119_1.time_ and arg_119_1.time_ < var_122_0 + var_122_10 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_0) / var_122_10

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_0 + var_122_10 and arg_119_1.time_ < var_122_0 + var_122_10 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play120011030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 120011030
		arg_123_1.duration_ = 5.1

		local var_123_0 = {
			zh = 1.666,
			ja = 5.1
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
				arg_123_0:Play120011031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 0.225

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_2 = arg_123_1:FormatText(StoryNameCfg[36].name)

				arg_123_1.leftNameTxt_.text = var_126_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_3 = arg_123_1:GetWordFromCfg(120011030)
				local var_126_4 = arg_123_1:FormatText(var_126_3.content)

				arg_123_1.text_.text = var_126_4

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_5 = 9
				local var_126_6 = utf8.len(var_126_4)
				local var_126_7 = var_126_5 <= 0 and var_126_1 or var_126_1 * (var_126_6 / var_126_5)

				if var_126_7 > 0 and var_126_1 < var_126_7 then
					arg_123_1.talkMaxDuration = var_126_7

					if var_126_7 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_7 + var_126_0
					end
				end

				arg_123_1.text_.text = var_126_4
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011030", "story_v_out_120011.awb") ~= 0 then
					local var_126_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011030", "story_v_out_120011.awb") / 1000

					if var_126_8 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_8 + var_126_0
					end

					if var_126_3.prefab_name ~= "" and arg_123_1.actors_[var_126_3.prefab_name] ~= nil then
						local var_126_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_3.prefab_name].transform, "story_v_out_120011", "120011030", "story_v_out_120011.awb")

						arg_123_1:RecordAudio("120011030", var_126_9)
						arg_123_1:RecordAudio("120011030", var_126_9)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_120011", "120011030", "story_v_out_120011.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_120011", "120011030", "story_v_out_120011.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_10 = math.max(var_126_1, arg_123_1.talkMaxDuration)

			if var_126_0 <= arg_123_1.time_ and arg_123_1.time_ < var_126_0 + var_126_10 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_0) / var_126_10

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_0 + var_126_10 and arg_123_1.time_ < var_126_0 + var_126_10 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play120011031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 120011031
		arg_127_1.duration_ = 6

		local var_127_0 = {
			zh = 4.033,
			ja = 6
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
				arg_127_0:Play120011032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.525

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_2 = arg_127_1:FormatText(StoryNameCfg[319].name)

				arg_127_1.leftNameTxt_.text = var_130_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_3 = arg_127_1:GetWordFromCfg(120011031)
				local var_130_4 = arg_127_1:FormatText(var_130_3.content)

				arg_127_1.text_.text = var_130_4

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_5 = 21
				local var_130_6 = utf8.len(var_130_4)
				local var_130_7 = var_130_5 <= 0 and var_130_1 or var_130_1 * (var_130_6 / var_130_5)

				if var_130_7 > 0 and var_130_1 < var_130_7 then
					arg_127_1.talkMaxDuration = var_130_7

					if var_130_7 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_7 + var_130_0
					end
				end

				arg_127_1.text_.text = var_130_4
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011031", "story_v_out_120011.awb") ~= 0 then
					local var_130_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011031", "story_v_out_120011.awb") / 1000

					if var_130_8 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_0
					end

					if var_130_3.prefab_name ~= "" and arg_127_1.actors_[var_130_3.prefab_name] ~= nil then
						local var_130_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_3.prefab_name].transform, "story_v_out_120011", "120011031", "story_v_out_120011.awb")

						arg_127_1:RecordAudio("120011031", var_130_9)
						arg_127_1:RecordAudio("120011031", var_130_9)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_120011", "120011031", "story_v_out_120011.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_120011", "120011031", "story_v_out_120011.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_10 = math.max(var_130_1, arg_127_1.talkMaxDuration)

			if var_130_0 <= arg_127_1.time_ and arg_127_1.time_ < var_130_0 + var_130_10 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_0) / var_130_10

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_0 + var_130_10 and arg_127_1.time_ < var_130_0 + var_130_10 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play120011032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 120011032
		arg_131_1.duration_ = 8.466

		local var_131_0 = {
			zh = 6.433,
			ja = 8.466
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
				arg_131_0:Play120011033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 0.7

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_2 = arg_131_1:FormatText(StoryNameCfg[319].name)

				arg_131_1.leftNameTxt_.text = var_134_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_3 = arg_131_1:GetWordFromCfg(120011032)
				local var_134_4 = arg_131_1:FormatText(var_134_3.content)

				arg_131_1.text_.text = var_134_4

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_5 = 28
				local var_134_6 = utf8.len(var_134_4)
				local var_134_7 = var_134_5 <= 0 and var_134_1 or var_134_1 * (var_134_6 / var_134_5)

				if var_134_7 > 0 and var_134_1 < var_134_7 then
					arg_131_1.talkMaxDuration = var_134_7

					if var_134_7 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_7 + var_134_0
					end
				end

				arg_131_1.text_.text = var_134_4
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011032", "story_v_out_120011.awb") ~= 0 then
					local var_134_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011032", "story_v_out_120011.awb") / 1000

					if var_134_8 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_8 + var_134_0
					end

					if var_134_3.prefab_name ~= "" and arg_131_1.actors_[var_134_3.prefab_name] ~= nil then
						local var_134_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_3.prefab_name].transform, "story_v_out_120011", "120011032", "story_v_out_120011.awb")

						arg_131_1:RecordAudio("120011032", var_134_9)
						arg_131_1:RecordAudio("120011032", var_134_9)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_120011", "120011032", "story_v_out_120011.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_120011", "120011032", "story_v_out_120011.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_10 = math.max(var_134_1, arg_131_1.talkMaxDuration)

			if var_134_0 <= arg_131_1.time_ and arg_131_1.time_ < var_134_0 + var_134_10 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_0) / var_134_10

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_0 + var_134_10 and arg_131_1.time_ < var_134_0 + var_134_10 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play120011033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 120011033
		arg_135_1.duration_ = 2.4

		local var_135_0 = {
			zh = 1.033,
			ja = 2.4
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
				arg_135_0:Play120011034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0
			local var_138_1 = 0.075

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_2 = arg_135_1:FormatText(StoryNameCfg[36].name)

				arg_135_1.leftNameTxt_.text = var_138_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_3 = arg_135_1:GetWordFromCfg(120011033)
				local var_138_4 = arg_135_1:FormatText(var_138_3.content)

				arg_135_1.text_.text = var_138_4

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_5 = 3
				local var_138_6 = utf8.len(var_138_4)
				local var_138_7 = var_138_5 <= 0 and var_138_1 or var_138_1 * (var_138_6 / var_138_5)

				if var_138_7 > 0 and var_138_1 < var_138_7 then
					arg_135_1.talkMaxDuration = var_138_7

					if var_138_7 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_7 + var_138_0
					end
				end

				arg_135_1.text_.text = var_138_4
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011033", "story_v_out_120011.awb") ~= 0 then
					local var_138_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011033", "story_v_out_120011.awb") / 1000

					if var_138_8 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_8 + var_138_0
					end

					if var_138_3.prefab_name ~= "" and arg_135_1.actors_[var_138_3.prefab_name] ~= nil then
						local var_138_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_3.prefab_name].transform, "story_v_out_120011", "120011033", "story_v_out_120011.awb")

						arg_135_1:RecordAudio("120011033", var_138_9)
						arg_135_1:RecordAudio("120011033", var_138_9)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_120011", "120011033", "story_v_out_120011.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_120011", "120011033", "story_v_out_120011.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_10 = math.max(var_138_1, arg_135_1.talkMaxDuration)

			if var_138_0 <= arg_135_1.time_ and arg_135_1.time_ < var_138_0 + var_138_10 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_0) / var_138_10

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_0 + var_138_10 and arg_135_1.time_ < var_138_0 + var_138_10 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play120011034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 120011034
		arg_139_1.duration_ = 10.833

		local var_139_0 = {
			zh = 7.066,
			ja = 10.833
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
				arg_139_0:Play120011035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0
			local var_142_1 = 0.325

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_2 = arg_139_1:FormatText(StoryNameCfg[319].name)

				arg_139_1.leftNameTxt_.text = var_142_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_3 = arg_139_1:GetWordFromCfg(120011034)
				local var_142_4 = arg_139_1:FormatText(var_142_3.content)

				arg_139_1.text_.text = var_142_4

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_5 = 13
				local var_142_6 = utf8.len(var_142_4)
				local var_142_7 = var_142_5 <= 0 and var_142_1 or var_142_1 * (var_142_6 / var_142_5)

				if var_142_7 > 0 and var_142_1 < var_142_7 then
					arg_139_1.talkMaxDuration = var_142_7

					if var_142_7 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_7 + var_142_0
					end
				end

				arg_139_1.text_.text = var_142_4
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011034", "story_v_out_120011.awb") ~= 0 then
					local var_142_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011034", "story_v_out_120011.awb") / 1000

					if var_142_8 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_8 + var_142_0
					end

					if var_142_3.prefab_name ~= "" and arg_139_1.actors_[var_142_3.prefab_name] ~= nil then
						local var_142_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_3.prefab_name].transform, "story_v_out_120011", "120011034", "story_v_out_120011.awb")

						arg_139_1:RecordAudio("120011034", var_142_9)
						arg_139_1:RecordAudio("120011034", var_142_9)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_120011", "120011034", "story_v_out_120011.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_120011", "120011034", "story_v_out_120011.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_10 = math.max(var_142_1, arg_139_1.talkMaxDuration)

			if var_142_0 <= arg_139_1.time_ and arg_139_1.time_ < var_142_0 + var_142_10 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_0) / var_142_10

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_0 + var_142_10 and arg_139_1.time_ < var_142_0 + var_142_10 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play120011035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 120011035
		arg_143_1.duration_ = 3.6

		local var_143_0 = {
			zh = 2.4,
			ja = 3.6
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
				arg_143_0:Play120011036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 0.3

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_2 = arg_143_1:FormatText(StoryNameCfg[36].name)

				arg_143_1.leftNameTxt_.text = var_146_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_3 = arg_143_1:GetWordFromCfg(120011035)
				local var_146_4 = arg_143_1:FormatText(var_146_3.content)

				arg_143_1.text_.text = var_146_4

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011035", "story_v_out_120011.awb") ~= 0 then
					local var_146_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011035", "story_v_out_120011.awb") / 1000

					if var_146_8 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_8 + var_146_0
					end

					if var_146_3.prefab_name ~= "" and arg_143_1.actors_[var_146_3.prefab_name] ~= nil then
						local var_146_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_3.prefab_name].transform, "story_v_out_120011", "120011035", "story_v_out_120011.awb")

						arg_143_1:RecordAudio("120011035", var_146_9)
						arg_143_1:RecordAudio("120011035", var_146_9)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_120011", "120011035", "story_v_out_120011.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_120011", "120011035", "story_v_out_120011.awb")
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
	Play120011036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 120011036
		arg_147_1.duration_ = 7.033

		local var_147_0 = {
			zh = 7.033,
			ja = 5.166
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
				arg_147_0:Play120011037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 0.775

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_2 = arg_147_1:FormatText(StoryNameCfg[319].name)

				arg_147_1.leftNameTxt_.text = var_150_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_3 = arg_147_1:GetWordFromCfg(120011036)
				local var_150_4 = arg_147_1:FormatText(var_150_3.content)

				arg_147_1.text_.text = var_150_4

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_5 = 31
				local var_150_6 = utf8.len(var_150_4)
				local var_150_7 = var_150_5 <= 0 and var_150_1 or var_150_1 * (var_150_6 / var_150_5)

				if var_150_7 > 0 and var_150_1 < var_150_7 then
					arg_147_1.talkMaxDuration = var_150_7

					if var_150_7 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_7 + var_150_0
					end
				end

				arg_147_1.text_.text = var_150_4
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011036", "story_v_out_120011.awb") ~= 0 then
					local var_150_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011036", "story_v_out_120011.awb") / 1000

					if var_150_8 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_8 + var_150_0
					end

					if var_150_3.prefab_name ~= "" and arg_147_1.actors_[var_150_3.prefab_name] ~= nil then
						local var_150_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_3.prefab_name].transform, "story_v_out_120011", "120011036", "story_v_out_120011.awb")

						arg_147_1:RecordAudio("120011036", var_150_9)
						arg_147_1:RecordAudio("120011036", var_150_9)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_120011", "120011036", "story_v_out_120011.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_120011", "120011036", "story_v_out_120011.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_10 = math.max(var_150_1, arg_147_1.talkMaxDuration)

			if var_150_0 <= arg_147_1.time_ and arg_147_1.time_ < var_150_0 + var_150_10 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_0) / var_150_10

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_0 + var_150_10 and arg_147_1.time_ < var_150_0 + var_150_10 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play120011037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 120011037
		arg_151_1.duration_ = 10.3

		local var_151_0 = {
			zh = 6.133,
			ja = 10.3
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
				arg_151_0:Play120011038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 0.75

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_2 = arg_151_1:FormatText(StoryNameCfg[319].name)

				arg_151_1.leftNameTxt_.text = var_154_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_3 = arg_151_1:GetWordFromCfg(120011037)
				local var_154_4 = arg_151_1:FormatText(var_154_3.content)

				arg_151_1.text_.text = var_154_4

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011037", "story_v_out_120011.awb") ~= 0 then
					local var_154_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011037", "story_v_out_120011.awb") / 1000

					if var_154_8 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_0
					end

					if var_154_3.prefab_name ~= "" and arg_151_1.actors_[var_154_3.prefab_name] ~= nil then
						local var_154_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_3.prefab_name].transform, "story_v_out_120011", "120011037", "story_v_out_120011.awb")

						arg_151_1:RecordAudio("120011037", var_154_9)
						arg_151_1:RecordAudio("120011037", var_154_9)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_120011", "120011037", "story_v_out_120011.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_120011", "120011037", "story_v_out_120011.awb")
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
	Play120011038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 120011038
		arg_155_1.duration_ = 11.2

		local var_155_0 = {
			zh = 9.366,
			ja = 11.2
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
				arg_155_0:Play120011039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 0.9

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_2 = arg_155_1:FormatText(StoryNameCfg[319].name)

				arg_155_1.leftNameTxt_.text = var_158_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_3 = arg_155_1:GetWordFromCfg(120011038)
				local var_158_4 = arg_155_1:FormatText(var_158_3.content)

				arg_155_1.text_.text = var_158_4

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_5 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011038", "story_v_out_120011.awb") ~= 0 then
					local var_158_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011038", "story_v_out_120011.awb") / 1000

					if var_158_8 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_8 + var_158_0
					end

					if var_158_3.prefab_name ~= "" and arg_155_1.actors_[var_158_3.prefab_name] ~= nil then
						local var_158_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_3.prefab_name].transform, "story_v_out_120011", "120011038", "story_v_out_120011.awb")

						arg_155_1:RecordAudio("120011038", var_158_9)
						arg_155_1:RecordAudio("120011038", var_158_9)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_120011", "120011038", "story_v_out_120011.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_120011", "120011038", "story_v_out_120011.awb")
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
	Play120011039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 120011039
		arg_159_1.duration_ = 14.5

		local var_159_0 = {
			zh = 5.466,
			ja = 14.5
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
				arg_159_0:Play120011040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 0.575

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_2 = arg_159_1:FormatText(StoryNameCfg[36].name)

				arg_159_1.leftNameTxt_.text = var_162_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(120011039)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011039", "story_v_out_120011.awb") ~= 0 then
					local var_162_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011039", "story_v_out_120011.awb") / 1000

					if var_162_8 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_0
					end

					if var_162_3.prefab_name ~= "" and arg_159_1.actors_[var_162_3.prefab_name] ~= nil then
						local var_162_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_3.prefab_name].transform, "story_v_out_120011", "120011039", "story_v_out_120011.awb")

						arg_159_1:RecordAudio("120011039", var_162_9)
						arg_159_1:RecordAudio("120011039", var_162_9)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_120011", "120011039", "story_v_out_120011.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_120011", "120011039", "story_v_out_120011.awb")
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
	Play120011040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 120011040
		arg_163_1.duration_ = 8.466

		local var_163_0 = {
			zh = 8.466,
			ja = 6.6
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
				arg_163_0:Play120011041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 0.9

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_2 = arg_163_1:FormatText(StoryNameCfg[319].name)

				arg_163_1.leftNameTxt_.text = var_166_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_3 = arg_163_1:GetWordFromCfg(120011040)
				local var_166_4 = arg_163_1:FormatText(var_166_3.content)

				arg_163_1.text_.text = var_166_4

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_5 = 36
				local var_166_6 = utf8.len(var_166_4)
				local var_166_7 = var_166_5 <= 0 and var_166_1 or var_166_1 * (var_166_6 / var_166_5)

				if var_166_7 > 0 and var_166_1 < var_166_7 then
					arg_163_1.talkMaxDuration = var_166_7

					if var_166_7 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_7 + var_166_0
					end
				end

				arg_163_1.text_.text = var_166_4
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011040", "story_v_out_120011.awb") ~= 0 then
					local var_166_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011040", "story_v_out_120011.awb") / 1000

					if var_166_8 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_8 + var_166_0
					end

					if var_166_3.prefab_name ~= "" and arg_163_1.actors_[var_166_3.prefab_name] ~= nil then
						local var_166_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_3.prefab_name].transform, "story_v_out_120011", "120011040", "story_v_out_120011.awb")

						arg_163_1:RecordAudio("120011040", var_166_9)
						arg_163_1:RecordAudio("120011040", var_166_9)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_120011", "120011040", "story_v_out_120011.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_120011", "120011040", "story_v_out_120011.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_10 = math.max(var_166_1, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_10 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_0) / var_166_10

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_10 and arg_163_1.time_ < var_166_0 + var_166_10 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play120011041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 120011041
		arg_167_1.duration_ = 9.6

		local var_167_0 = {
			zh = 9.6,
			ja = 7.9
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
				arg_167_0:Play120011042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0
			local var_170_1 = 1.075

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_2 = arg_167_1:FormatText(StoryNameCfg[319].name)

				arg_167_1.leftNameTxt_.text = var_170_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_3 = arg_167_1:GetWordFromCfg(120011041)
				local var_170_4 = arg_167_1:FormatText(var_170_3.content)

				arg_167_1.text_.text = var_170_4

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_5 = 43
				local var_170_6 = utf8.len(var_170_4)
				local var_170_7 = var_170_5 <= 0 and var_170_1 or var_170_1 * (var_170_6 / var_170_5)

				if var_170_7 > 0 and var_170_1 < var_170_7 then
					arg_167_1.talkMaxDuration = var_170_7

					if var_170_7 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_7 + var_170_0
					end
				end

				arg_167_1.text_.text = var_170_4
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011041", "story_v_out_120011.awb") ~= 0 then
					local var_170_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011041", "story_v_out_120011.awb") / 1000

					if var_170_8 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_8 + var_170_0
					end

					if var_170_3.prefab_name ~= "" and arg_167_1.actors_[var_170_3.prefab_name] ~= nil then
						local var_170_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_3.prefab_name].transform, "story_v_out_120011", "120011041", "story_v_out_120011.awb")

						arg_167_1:RecordAudio("120011041", var_170_9)
						arg_167_1:RecordAudio("120011041", var_170_9)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_120011", "120011041", "story_v_out_120011.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_120011", "120011041", "story_v_out_120011.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_10 = math.max(var_170_1, arg_167_1.talkMaxDuration)

			if var_170_0 <= arg_167_1.time_ and arg_167_1.time_ < var_170_0 + var_170_10 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_0) / var_170_10

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_0 + var_170_10 and arg_167_1.time_ < var_170_0 + var_170_10 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play120011042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 120011042
		arg_171_1.duration_ = 7.433

		local var_171_0 = {
			zh = 6.3,
			ja = 7.433
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
				arg_171_0:Play120011043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 0.625

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_2 = arg_171_1:FormatText(StoryNameCfg[36].name)

				arg_171_1.leftNameTxt_.text = var_174_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_3 = arg_171_1:GetWordFromCfg(120011042)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011042", "story_v_out_120011.awb") ~= 0 then
					local var_174_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011042", "story_v_out_120011.awb") / 1000

					if var_174_8 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_8 + var_174_0
					end

					if var_174_3.prefab_name ~= "" and arg_171_1.actors_[var_174_3.prefab_name] ~= nil then
						local var_174_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_3.prefab_name].transform, "story_v_out_120011", "120011042", "story_v_out_120011.awb")

						arg_171_1:RecordAudio("120011042", var_174_9)
						arg_171_1:RecordAudio("120011042", var_174_9)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_120011", "120011042", "story_v_out_120011.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_120011", "120011042", "story_v_out_120011.awb")
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
	Play120011043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 120011043
		arg_175_1.duration_ = 5

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play120011044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 0.75

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, false)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_2 = arg_175_1:GetWordFromCfg(120011043)
				local var_178_3 = arg_175_1:FormatText(var_178_2.content)

				arg_175_1.text_.text = var_178_3

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_4 = 29
				local var_178_5 = utf8.len(var_178_3)
				local var_178_6 = var_178_4 <= 0 and var_178_1 or var_178_1 * (var_178_5 / var_178_4)

				if var_178_6 > 0 and var_178_1 < var_178_6 then
					arg_175_1.talkMaxDuration = var_178_6

					if var_178_6 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_6 + var_178_0
					end
				end

				arg_175_1.text_.text = var_178_3
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_7 = math.max(var_178_1, arg_175_1.talkMaxDuration)

			if var_178_0 <= arg_175_1.time_ and arg_175_1.time_ < var_178_0 + var_178_7 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_0) / var_178_7

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_0 + var_178_7 and arg_175_1.time_ < var_178_0 + var_178_7 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play120011044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 120011044
		arg_179_1.duration_ = 9

		local var_179_0 = {
			zh = 8.866,
			ja = 9
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
				arg_179_0:Play120011045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 0.275

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_2 = arg_179_1:FormatText(StoryNameCfg[36].name)

				arg_179_1.leftNameTxt_.text = var_182_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_3 = arg_179_1:GetWordFromCfg(120011044)
				local var_182_4 = arg_179_1:FormatText(var_182_3.content)

				arg_179_1.text_.text = var_182_4

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_5 = 11
				local var_182_6 = utf8.len(var_182_4)
				local var_182_7 = var_182_5 <= 0 and var_182_1 or var_182_1 * (var_182_6 / var_182_5)

				if var_182_7 > 0 and var_182_1 < var_182_7 then
					arg_179_1.talkMaxDuration = var_182_7

					if var_182_7 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_7 + var_182_0
					end
				end

				arg_179_1.text_.text = var_182_4
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011044", "story_v_out_120011.awb") ~= 0 then
					local var_182_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011044", "story_v_out_120011.awb") / 1000

					if var_182_8 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_0
					end

					if var_182_3.prefab_name ~= "" and arg_179_1.actors_[var_182_3.prefab_name] ~= nil then
						local var_182_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_3.prefab_name].transform, "story_v_out_120011", "120011044", "story_v_out_120011.awb")

						arg_179_1:RecordAudio("120011044", var_182_9)
						arg_179_1:RecordAudio("120011044", var_182_9)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_120011", "120011044", "story_v_out_120011.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_120011", "120011044", "story_v_out_120011.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_10 = math.max(var_182_1, arg_179_1.talkMaxDuration)

			if var_182_0 <= arg_179_1.time_ and arg_179_1.time_ < var_182_0 + var_182_10 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_0) / var_182_10

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_0 + var_182_10 and arg_179_1.time_ < var_182_0 + var_182_10 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play120011045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 120011045
		arg_183_1.duration_ = 3.533

		local var_183_0 = {
			zh = 3.3,
			ja = 3.533
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
				arg_183_0:Play120011046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 0.225

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_2 = arg_183_1:FormatText(StoryNameCfg[319].name)

				arg_183_1.leftNameTxt_.text = var_186_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_3 = arg_183_1:GetWordFromCfg(120011045)
				local var_186_4 = arg_183_1:FormatText(var_186_3.content)

				arg_183_1.text_.text = var_186_4

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_5 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011045", "story_v_out_120011.awb") ~= 0 then
					local var_186_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011045", "story_v_out_120011.awb") / 1000

					if var_186_8 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_8 + var_186_0
					end

					if var_186_3.prefab_name ~= "" and arg_183_1.actors_[var_186_3.prefab_name] ~= nil then
						local var_186_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_3.prefab_name].transform, "story_v_out_120011", "120011045", "story_v_out_120011.awb")

						arg_183_1:RecordAudio("120011045", var_186_9)
						arg_183_1:RecordAudio("120011045", var_186_9)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_120011", "120011045", "story_v_out_120011.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_120011", "120011045", "story_v_out_120011.awb")
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
	Play120011046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 120011046
		arg_187_1.duration_ = 7.7

		local var_187_0 = {
			zh = 4.9,
			ja = 7.7
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
				arg_187_0:Play120011047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0
			local var_190_1 = 0.45

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_2 = arg_187_1:FormatText(StoryNameCfg[36].name)

				arg_187_1.leftNameTxt_.text = var_190_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_3 = arg_187_1:GetWordFromCfg(120011046)
				local var_190_4 = arg_187_1:FormatText(var_190_3.content)

				arg_187_1.text_.text = var_190_4

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011046", "story_v_out_120011.awb") ~= 0 then
					local var_190_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011046", "story_v_out_120011.awb") / 1000

					if var_190_8 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_8 + var_190_0
					end

					if var_190_3.prefab_name ~= "" and arg_187_1.actors_[var_190_3.prefab_name] ~= nil then
						local var_190_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_3.prefab_name].transform, "story_v_out_120011", "120011046", "story_v_out_120011.awb")

						arg_187_1:RecordAudio("120011046", var_190_9)
						arg_187_1:RecordAudio("120011046", var_190_9)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_120011", "120011046", "story_v_out_120011.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_120011", "120011046", "story_v_out_120011.awb")
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
	Play120011047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 120011047
		arg_191_1.duration_ = 12.166

		local var_191_0 = {
			zh = 8.7,
			ja = 12.166
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
				arg_191_0:Play120011048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0
			local var_194_1 = 0.9

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_2 = arg_191_1:FormatText(StoryNameCfg[36].name)

				arg_191_1.leftNameTxt_.text = var_194_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_3 = arg_191_1:GetWordFromCfg(120011047)
				local var_194_4 = arg_191_1:FormatText(var_194_3.content)

				arg_191_1.text_.text = var_194_4

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_5 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011047", "story_v_out_120011.awb") ~= 0 then
					local var_194_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011047", "story_v_out_120011.awb") / 1000

					if var_194_8 + var_194_0 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_8 + var_194_0
					end

					if var_194_3.prefab_name ~= "" and arg_191_1.actors_[var_194_3.prefab_name] ~= nil then
						local var_194_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_3.prefab_name].transform, "story_v_out_120011", "120011047", "story_v_out_120011.awb")

						arg_191_1:RecordAudio("120011047", var_194_9)
						arg_191_1:RecordAudio("120011047", var_194_9)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_120011", "120011047", "story_v_out_120011.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_120011", "120011047", "story_v_out_120011.awb")
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
	Play120011048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 120011048
		arg_195_1.duration_ = 7.866

		local var_195_0 = {
			zh = 5.866,
			ja = 7.866
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
				arg_195_0:Play120011049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 0.55

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_2 = arg_195_1:FormatText(StoryNameCfg[36].name)

				arg_195_1.leftNameTxt_.text = var_198_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_3 = arg_195_1:GetWordFromCfg(120011048)
				local var_198_4 = arg_195_1:FormatText(var_198_3.content)

				arg_195_1.text_.text = var_198_4

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_5 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011048", "story_v_out_120011.awb") ~= 0 then
					local var_198_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011048", "story_v_out_120011.awb") / 1000

					if var_198_8 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_8 + var_198_0
					end

					if var_198_3.prefab_name ~= "" and arg_195_1.actors_[var_198_3.prefab_name] ~= nil then
						local var_198_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_3.prefab_name].transform, "story_v_out_120011", "120011048", "story_v_out_120011.awb")

						arg_195_1:RecordAudio("120011048", var_198_9)
						arg_195_1:RecordAudio("120011048", var_198_9)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_120011", "120011048", "story_v_out_120011.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_120011", "120011048", "story_v_out_120011.awb")
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
	Play120011049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 120011049
		arg_199_1.duration_ = 6.9

		local var_199_0 = {
			zh = 5.3,
			ja = 6.9
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
				arg_199_0:Play120011050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 0.525

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_2 = arg_199_1:FormatText(StoryNameCfg[319].name)

				arg_199_1.leftNameTxt_.text = var_202_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_3 = arg_199_1:GetWordFromCfg(120011049)
				local var_202_4 = arg_199_1:FormatText(var_202_3.content)

				arg_199_1.text_.text = var_202_4

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011049", "story_v_out_120011.awb") ~= 0 then
					local var_202_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011049", "story_v_out_120011.awb") / 1000

					if var_202_8 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_8 + var_202_0
					end

					if var_202_3.prefab_name ~= "" and arg_199_1.actors_[var_202_3.prefab_name] ~= nil then
						local var_202_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_3.prefab_name].transform, "story_v_out_120011", "120011049", "story_v_out_120011.awb")

						arg_199_1:RecordAudio("120011049", var_202_9)
						arg_199_1:RecordAudio("120011049", var_202_9)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_120011", "120011049", "story_v_out_120011.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_120011", "120011049", "story_v_out_120011.awb")
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
	Play120011050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 120011050
		arg_203_1.duration_ = 3.033

		local var_203_0 = {
			zh = 1.6,
			ja = 3.033
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
				arg_203_0:Play120011051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0
			local var_206_1 = 0.2

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_2 = arg_203_1:FormatText(StoryNameCfg[319].name)

				arg_203_1.leftNameTxt_.text = var_206_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_3 = arg_203_1:GetWordFromCfg(120011050)
				local var_206_4 = arg_203_1:FormatText(var_206_3.content)

				arg_203_1.text_.text = var_206_4

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011050", "story_v_out_120011.awb") ~= 0 then
					local var_206_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011050", "story_v_out_120011.awb") / 1000

					if var_206_8 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_8 + var_206_0
					end

					if var_206_3.prefab_name ~= "" and arg_203_1.actors_[var_206_3.prefab_name] ~= nil then
						local var_206_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_3.prefab_name].transform, "story_v_out_120011", "120011050", "story_v_out_120011.awb")

						arg_203_1:RecordAudio("120011050", var_206_9)
						arg_203_1:RecordAudio("120011050", var_206_9)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_120011", "120011050", "story_v_out_120011.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_120011", "120011050", "story_v_out_120011.awb")
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
	Play120011051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 120011051
		arg_207_1.duration_ = 1.966

		local var_207_0 = {
			zh = 1.266,
			ja = 1.966
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
				arg_207_0:Play120011052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 0.1

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_2 = arg_207_1:FormatText(StoryNameCfg[36].name)

				arg_207_1.leftNameTxt_.text = var_210_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_3 = arg_207_1:GetWordFromCfg(120011051)
				local var_210_4 = arg_207_1:FormatText(var_210_3.content)

				arg_207_1.text_.text = var_210_4

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_5 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011051", "story_v_out_120011.awb") ~= 0 then
					local var_210_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011051", "story_v_out_120011.awb") / 1000

					if var_210_8 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_8 + var_210_0
					end

					if var_210_3.prefab_name ~= "" and arg_207_1.actors_[var_210_3.prefab_name] ~= nil then
						local var_210_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_3.prefab_name].transform, "story_v_out_120011", "120011051", "story_v_out_120011.awb")

						arg_207_1:RecordAudio("120011051", var_210_9)
						arg_207_1:RecordAudio("120011051", var_210_9)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_120011", "120011051", "story_v_out_120011.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_120011", "120011051", "story_v_out_120011.awb")
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
	Play120011052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 120011052
		arg_211_1.duration_ = 3.666

		local var_211_0 = {
			zh = 3.666,
			ja = 1.8
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
				arg_211_0:Play120011053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 0.3

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_2 = arg_211_1:FormatText(StoryNameCfg[319].name)

				arg_211_1.leftNameTxt_.text = var_214_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_3 = arg_211_1:GetWordFromCfg(120011052)
				local var_214_4 = arg_211_1:FormatText(var_214_3.content)

				arg_211_1.text_.text = var_214_4

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011052", "story_v_out_120011.awb") ~= 0 then
					local var_214_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011052", "story_v_out_120011.awb") / 1000

					if var_214_8 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_8 + var_214_0
					end

					if var_214_3.prefab_name ~= "" and arg_211_1.actors_[var_214_3.prefab_name] ~= nil then
						local var_214_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_3.prefab_name].transform, "story_v_out_120011", "120011052", "story_v_out_120011.awb")

						arg_211_1:RecordAudio("120011052", var_214_9)
						arg_211_1:RecordAudio("120011052", var_214_9)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_120011", "120011052", "story_v_out_120011.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_120011", "120011052", "story_v_out_120011.awb")
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
	Play120011053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 120011053
		arg_215_1.duration_ = 10.1

		local var_215_0 = {
			zh = 10.1,
			ja = 8.366
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
				arg_215_0:Play120011054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 0.95

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_2 = arg_215_1:FormatText(StoryNameCfg[319].name)

				arg_215_1.leftNameTxt_.text = var_218_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_3 = arg_215_1:GetWordFromCfg(120011053)
				local var_218_4 = arg_215_1:FormatText(var_218_3.content)

				arg_215_1.text_.text = var_218_4

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_5 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011053", "story_v_out_120011.awb") ~= 0 then
					local var_218_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011053", "story_v_out_120011.awb") / 1000

					if var_218_8 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_8 + var_218_0
					end

					if var_218_3.prefab_name ~= "" and arg_215_1.actors_[var_218_3.prefab_name] ~= nil then
						local var_218_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_3.prefab_name].transform, "story_v_out_120011", "120011053", "story_v_out_120011.awb")

						arg_215_1:RecordAudio("120011053", var_218_9)
						arg_215_1:RecordAudio("120011053", var_218_9)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_120011", "120011053", "story_v_out_120011.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_120011", "120011053", "story_v_out_120011.awb")
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
	Play120011054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 120011054
		arg_219_1.duration_ = 5.1

		local var_219_0 = {
			zh = 1.633,
			ja = 5.1
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
				arg_219_0:Play120011055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 0
			local var_222_1 = 0.2

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_2 = arg_219_1:FormatText(StoryNameCfg[36].name)

				arg_219_1.leftNameTxt_.text = var_222_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_3 = arg_219_1:GetWordFromCfg(120011054)
				local var_222_4 = arg_219_1:FormatText(var_222_3.content)

				arg_219_1.text_.text = var_222_4

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011054", "story_v_out_120011.awb") ~= 0 then
					local var_222_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011054", "story_v_out_120011.awb") / 1000

					if var_222_8 + var_222_0 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_8 + var_222_0
					end

					if var_222_3.prefab_name ~= "" and arg_219_1.actors_[var_222_3.prefab_name] ~= nil then
						local var_222_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_3.prefab_name].transform, "story_v_out_120011", "120011054", "story_v_out_120011.awb")

						arg_219_1:RecordAudio("120011054", var_222_9)
						arg_219_1:RecordAudio("120011054", var_222_9)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_120011", "120011054", "story_v_out_120011.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_120011", "120011054", "story_v_out_120011.awb")
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
	Play120011055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 120011055
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play120011056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = 0
			local var_226_1 = 1.2

			if var_226_0 < arg_223_1.time_ and arg_223_1.time_ <= var_226_0 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, false)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_2 = arg_223_1:GetWordFromCfg(120011055)
				local var_226_3 = arg_223_1:FormatText(var_226_2.content)

				arg_223_1.text_.text = var_226_3

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_4 = 48
				local var_226_5 = utf8.len(var_226_3)
				local var_226_6 = var_226_4 <= 0 and var_226_1 or var_226_1 * (var_226_5 / var_226_4)

				if var_226_6 > 0 and var_226_1 < var_226_6 then
					arg_223_1.talkMaxDuration = var_226_6

					if var_226_6 + var_226_0 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_6 + var_226_0
					end
				end

				arg_223_1.text_.text = var_226_3
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)
				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_7 = math.max(var_226_1, arg_223_1.talkMaxDuration)

			if var_226_0 <= arg_223_1.time_ and arg_223_1.time_ < var_226_0 + var_226_7 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_0) / var_226_7

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_0 + var_226_7 and arg_223_1.time_ < var_226_0 + var_226_7 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play120011056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 120011056
		arg_227_1.duration_ = 1.933

		local var_227_0 = {
			zh = 1.6,
			ja = 1.933
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
				arg_227_0:Play120011057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0
			local var_230_1 = 0.175

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_2 = arg_227_1:FormatText(StoryNameCfg[319].name)

				arg_227_1.leftNameTxt_.text = var_230_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_3 = arg_227_1:GetWordFromCfg(120011056)
				local var_230_4 = arg_227_1:FormatText(var_230_3.content)

				arg_227_1.text_.text = var_230_4

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011056", "story_v_out_120011.awb") ~= 0 then
					local var_230_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011056", "story_v_out_120011.awb") / 1000

					if var_230_8 + var_230_0 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_8 + var_230_0
					end

					if var_230_3.prefab_name ~= "" and arg_227_1.actors_[var_230_3.prefab_name] ~= nil then
						local var_230_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_3.prefab_name].transform, "story_v_out_120011", "120011056", "story_v_out_120011.awb")

						arg_227_1:RecordAudio("120011056", var_230_9)
						arg_227_1:RecordAudio("120011056", var_230_9)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_120011", "120011056", "story_v_out_120011.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_120011", "120011056", "story_v_out_120011.awb")
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
	Play120011057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 120011057
		arg_231_1.duration_ = 6.966

		local var_231_0 = {
			zh = 3.9,
			ja = 6.966
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
				arg_231_0:Play120011058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0
			local var_234_1 = 0.375

			if var_234_0 < arg_231_1.time_ and arg_231_1.time_ <= var_234_0 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_2 = arg_231_1:FormatText(StoryNameCfg[36].name)

				arg_231_1.leftNameTxt_.text = var_234_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_3 = arg_231_1:GetWordFromCfg(120011057)
				local var_234_4 = arg_231_1:FormatText(var_234_3.content)

				arg_231_1.text_.text = var_234_4

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_5 = 15
				local var_234_6 = utf8.len(var_234_4)
				local var_234_7 = var_234_5 <= 0 and var_234_1 or var_234_1 * (var_234_6 / var_234_5)

				if var_234_7 > 0 and var_234_1 < var_234_7 then
					arg_231_1.talkMaxDuration = var_234_7

					if var_234_7 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_7 + var_234_0
					end
				end

				arg_231_1.text_.text = var_234_4
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011057", "story_v_out_120011.awb") ~= 0 then
					local var_234_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011057", "story_v_out_120011.awb") / 1000

					if var_234_8 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_8 + var_234_0
					end

					if var_234_3.prefab_name ~= "" and arg_231_1.actors_[var_234_3.prefab_name] ~= nil then
						local var_234_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_3.prefab_name].transform, "story_v_out_120011", "120011057", "story_v_out_120011.awb")

						arg_231_1:RecordAudio("120011057", var_234_9)
						arg_231_1:RecordAudio("120011057", var_234_9)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_120011", "120011057", "story_v_out_120011.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_120011", "120011057", "story_v_out_120011.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_10 = math.max(var_234_1, arg_231_1.talkMaxDuration)

			if var_234_0 <= arg_231_1.time_ and arg_231_1.time_ < var_234_0 + var_234_10 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_0) / var_234_10

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_0 + var_234_10 and arg_231_1.time_ < var_234_0 + var_234_10 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play120011058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 120011058
		arg_235_1.duration_ = 4.966

		local var_235_0 = {
			zh = 4.966,
			ja = 3.733
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
				arg_235_0:Play120011059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0
			local var_238_1 = 0.4

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_2 = arg_235_1:FormatText(StoryNameCfg[319].name)

				arg_235_1.leftNameTxt_.text = var_238_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_3 = arg_235_1:GetWordFromCfg(120011058)
				local var_238_4 = arg_235_1:FormatText(var_238_3.content)

				arg_235_1.text_.text = var_238_4

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_5 = 16
				local var_238_6 = utf8.len(var_238_4)
				local var_238_7 = var_238_5 <= 0 and var_238_1 or var_238_1 * (var_238_6 / var_238_5)

				if var_238_7 > 0 and var_238_1 < var_238_7 then
					arg_235_1.talkMaxDuration = var_238_7

					if var_238_7 + var_238_0 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_7 + var_238_0
					end
				end

				arg_235_1.text_.text = var_238_4
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011058", "story_v_out_120011.awb") ~= 0 then
					local var_238_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011058", "story_v_out_120011.awb") / 1000

					if var_238_8 + var_238_0 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_8 + var_238_0
					end

					if var_238_3.prefab_name ~= "" and arg_235_1.actors_[var_238_3.prefab_name] ~= nil then
						local var_238_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_3.prefab_name].transform, "story_v_out_120011", "120011058", "story_v_out_120011.awb")

						arg_235_1:RecordAudio("120011058", var_238_9)
						arg_235_1:RecordAudio("120011058", var_238_9)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_120011", "120011058", "story_v_out_120011.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_120011", "120011058", "story_v_out_120011.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_10 = math.max(var_238_1, arg_235_1.talkMaxDuration)

			if var_238_0 <= arg_235_1.time_ and arg_235_1.time_ < var_238_0 + var_238_10 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_0) / var_238_10

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_0 + var_238_10 and arg_235_1.time_ < var_238_0 + var_238_10 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play120011059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 120011059
		arg_239_1.duration_ = 7.5

		local var_239_0 = {
			zh = 5.966,
			ja = 7.5
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
				arg_239_0:Play120011060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0
			local var_242_1 = 0.525

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_2 = arg_239_1:FormatText(StoryNameCfg[36].name)

				arg_239_1.leftNameTxt_.text = var_242_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_3 = arg_239_1:GetWordFromCfg(120011059)
				local var_242_4 = arg_239_1:FormatText(var_242_3.content)

				arg_239_1.text_.text = var_242_4

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_5 = 21
				local var_242_6 = utf8.len(var_242_4)
				local var_242_7 = var_242_5 <= 0 and var_242_1 or var_242_1 * (var_242_6 / var_242_5)

				if var_242_7 > 0 and var_242_1 < var_242_7 then
					arg_239_1.talkMaxDuration = var_242_7

					if var_242_7 + var_242_0 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_7 + var_242_0
					end
				end

				arg_239_1.text_.text = var_242_4
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011059", "story_v_out_120011.awb") ~= 0 then
					local var_242_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011059", "story_v_out_120011.awb") / 1000

					if var_242_8 + var_242_0 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_8 + var_242_0
					end

					if var_242_3.prefab_name ~= "" and arg_239_1.actors_[var_242_3.prefab_name] ~= nil then
						local var_242_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_3.prefab_name].transform, "story_v_out_120011", "120011059", "story_v_out_120011.awb")

						arg_239_1:RecordAudio("120011059", var_242_9)
						arg_239_1:RecordAudio("120011059", var_242_9)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_120011", "120011059", "story_v_out_120011.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_120011", "120011059", "story_v_out_120011.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_10 = math.max(var_242_1, arg_239_1.talkMaxDuration)

			if var_242_0 <= arg_239_1.time_ and arg_239_1.time_ < var_242_0 + var_242_10 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_0) / var_242_10

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_0 + var_242_10 and arg_239_1.time_ < var_242_0 + var_242_10 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play120011060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 120011060
		arg_243_1.duration_ = 1.3

		local var_243_0 = {
			zh = 1.3,
			ja = 1.1
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
				arg_243_0:Play120011061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 0.075

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_2 = arg_243_1:FormatText(StoryNameCfg[319].name)

				arg_243_1.leftNameTxt_.text = var_246_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_3 = arg_243_1:GetWordFromCfg(120011060)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 3
				local var_246_6 = utf8.len(var_246_4)
				local var_246_7 = var_246_5 <= 0 and var_246_1 or var_246_1 * (var_246_6 / var_246_5)

				if var_246_7 > 0 and var_246_1 < var_246_7 then
					arg_243_1.talkMaxDuration = var_246_7

					if var_246_7 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_7 + var_246_0
					end
				end

				arg_243_1.text_.text = var_246_4
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011060", "story_v_out_120011.awb") ~= 0 then
					local var_246_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011060", "story_v_out_120011.awb") / 1000

					if var_246_8 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_8 + var_246_0
					end

					if var_246_3.prefab_name ~= "" and arg_243_1.actors_[var_246_3.prefab_name] ~= nil then
						local var_246_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_3.prefab_name].transform, "story_v_out_120011", "120011060", "story_v_out_120011.awb")

						arg_243_1:RecordAudio("120011060", var_246_9)
						arg_243_1:RecordAudio("120011060", var_246_9)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_120011", "120011060", "story_v_out_120011.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_120011", "120011060", "story_v_out_120011.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_10 = math.max(var_246_1, arg_243_1.talkMaxDuration)

			if var_246_0 <= arg_243_1.time_ and arg_243_1.time_ < var_246_0 + var_246_10 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_0) / var_246_10

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_0 + var_246_10 and arg_243_1.time_ < var_246_0 + var_246_10 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play120011061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 120011061
		arg_247_1.duration_ = 4.466

		local var_247_0 = {
			zh = 1.8,
			ja = 4.466
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
				arg_247_0:Play120011062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = 0
			local var_250_1 = 0.15

			if var_250_0 < arg_247_1.time_ and arg_247_1.time_ <= var_250_0 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_2 = arg_247_1:FormatText(StoryNameCfg[36].name)

				arg_247_1.leftNameTxt_.text = var_250_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_3 = arg_247_1:GetWordFromCfg(120011061)
				local var_250_4 = arg_247_1:FormatText(var_250_3.content)

				arg_247_1.text_.text = var_250_4

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011061", "story_v_out_120011.awb") ~= 0 then
					local var_250_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011061", "story_v_out_120011.awb") / 1000

					if var_250_8 + var_250_0 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_8 + var_250_0
					end

					if var_250_3.prefab_name ~= "" and arg_247_1.actors_[var_250_3.prefab_name] ~= nil then
						local var_250_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_3.prefab_name].transform, "story_v_out_120011", "120011061", "story_v_out_120011.awb")

						arg_247_1:RecordAudio("120011061", var_250_9)
						arg_247_1:RecordAudio("120011061", var_250_9)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_120011", "120011061", "story_v_out_120011.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_120011", "120011061", "story_v_out_120011.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_10 = math.max(var_250_1, arg_247_1.talkMaxDuration)

			if var_250_0 <= arg_247_1.time_ and arg_247_1.time_ < var_250_0 + var_250_10 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_0) / var_250_10

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_0 + var_250_10 and arg_247_1.time_ < var_250_0 + var_250_10 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play120011062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 120011062
		arg_251_1.duration_ = 1.1

		local var_251_0 = {
			zh = 1.066,
			ja = 1.1
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
				arg_251_0:Play120011063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0
			local var_254_1 = 0.05

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_2 = arg_251_1:FormatText(StoryNameCfg[319].name)

				arg_251_1.leftNameTxt_.text = var_254_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_3 = arg_251_1:GetWordFromCfg(120011062)
				local var_254_4 = arg_251_1:FormatText(var_254_3.content)

				arg_251_1.text_.text = var_254_4

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_5 = 2
				local var_254_6 = utf8.len(var_254_4)
				local var_254_7 = var_254_5 <= 0 and var_254_1 or var_254_1 * (var_254_6 / var_254_5)

				if var_254_7 > 0 and var_254_1 < var_254_7 then
					arg_251_1.talkMaxDuration = var_254_7

					if var_254_7 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_7 + var_254_0
					end
				end

				arg_251_1.text_.text = var_254_4
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011062", "story_v_out_120011.awb") ~= 0 then
					local var_254_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011062", "story_v_out_120011.awb") / 1000

					if var_254_8 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_8 + var_254_0
					end

					if var_254_3.prefab_name ~= "" and arg_251_1.actors_[var_254_3.prefab_name] ~= nil then
						local var_254_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_3.prefab_name].transform, "story_v_out_120011", "120011062", "story_v_out_120011.awb")

						arg_251_1:RecordAudio("120011062", var_254_9)
						arg_251_1:RecordAudio("120011062", var_254_9)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_120011", "120011062", "story_v_out_120011.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_120011", "120011062", "story_v_out_120011.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_10 = math.max(var_254_1, arg_251_1.talkMaxDuration)

			if var_254_0 <= arg_251_1.time_ and arg_251_1.time_ < var_254_0 + var_254_10 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_0) / var_254_10

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_0 + var_254_10 and arg_251_1.time_ < var_254_0 + var_254_10 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play120011063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 120011063
		arg_255_1.duration_ = 5.133

		local var_255_0 = {
			zh = 5.133,
			ja = 2.266
		}
		local var_255_1 = manager.audio:GetLocalizationFlag()

		if var_255_0[var_255_1] ~= nil then
			arg_255_1.duration_ = var_255_0[var_255_1]
		end

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play120011064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 0
			local var_258_1 = 0.45

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_2 = arg_255_1:FormatText(StoryNameCfg[319].name)

				arg_255_1.leftNameTxt_.text = var_258_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_3 = arg_255_1:GetWordFromCfg(120011063)
				local var_258_4 = arg_255_1:FormatText(var_258_3.content)

				arg_255_1.text_.text = var_258_4

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_5 = 18
				local var_258_6 = utf8.len(var_258_4)
				local var_258_7 = var_258_5 <= 0 and var_258_1 or var_258_1 * (var_258_6 / var_258_5)

				if var_258_7 > 0 and var_258_1 < var_258_7 then
					arg_255_1.talkMaxDuration = var_258_7

					if var_258_7 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_7 + var_258_0
					end
				end

				arg_255_1.text_.text = var_258_4
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011063", "story_v_out_120011.awb") ~= 0 then
					local var_258_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011063", "story_v_out_120011.awb") / 1000

					if var_258_8 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_8 + var_258_0
					end

					if var_258_3.prefab_name ~= "" and arg_255_1.actors_[var_258_3.prefab_name] ~= nil then
						local var_258_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_3.prefab_name].transform, "story_v_out_120011", "120011063", "story_v_out_120011.awb")

						arg_255_1:RecordAudio("120011063", var_258_9)
						arg_255_1:RecordAudio("120011063", var_258_9)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_120011", "120011063", "story_v_out_120011.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_120011", "120011063", "story_v_out_120011.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_10 = math.max(var_258_1, arg_255_1.talkMaxDuration)

			if var_258_0 <= arg_255_1.time_ and arg_255_1.time_ < var_258_0 + var_258_10 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_0) / var_258_10

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_0 + var_258_10 and arg_255_1.time_ < var_258_0 + var_258_10 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play120011064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 120011064
		arg_259_1.duration_ = 8.999999999999

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play120011065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = "ST45"

			if arg_259_1.bgs_[var_262_0] == nil then
				local var_262_1 = Object.Instantiate(arg_259_1.paintGo_)

				var_262_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_262_0)
				var_262_1.name = var_262_0
				var_262_1.transform.parent = arg_259_1.stage_.transform
				var_262_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_259_1.bgs_[var_262_0] = var_262_1
			end

			local var_262_2 = 2

			if var_262_2 < arg_259_1.time_ and arg_259_1.time_ <= var_262_2 + arg_262_0 then
				local var_262_3 = manager.ui.mainCamera.transform.localPosition
				local var_262_4 = Vector3.New(0, 0, 10) + Vector3.New(var_262_3.x, var_262_3.y, 0)
				local var_262_5 = arg_259_1.bgs_.ST45

				var_262_5.transform.localPosition = var_262_4
				var_262_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_262_6 = var_262_5:GetComponent("SpriteRenderer")

				if var_262_6 and var_262_6.sprite then
					local var_262_7 = (var_262_5.transform.localPosition - var_262_3).z
					local var_262_8 = manager.ui.mainCameraCom_
					local var_262_9 = 2 * var_262_7 * Mathf.Tan(var_262_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_262_10 = var_262_9 * var_262_8.aspect
					local var_262_11 = var_262_6.sprite.bounds.size.x
					local var_262_12 = var_262_6.sprite.bounds.size.y
					local var_262_13 = var_262_10 / var_262_11
					local var_262_14 = var_262_9 / var_262_12
					local var_262_15 = var_262_14 < var_262_13 and var_262_13 or var_262_14

					var_262_5.transform.localScale = Vector3.New(var_262_15, var_262_15, 0)
				end

				for iter_262_0, iter_262_1 in pairs(arg_259_1.bgs_) do
					if iter_262_0 ~= "ST45" then
						iter_262_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_262_16 = 0

			if var_262_16 < arg_259_1.time_ and arg_259_1.time_ <= var_262_16 + arg_262_0 then
				arg_259_1.mask_.enabled = true
				arg_259_1.mask_.raycastTarget = true

				arg_259_1:SetGaussion(false)
			end

			local var_262_17 = 2

			if var_262_16 <= arg_259_1.time_ and arg_259_1.time_ < var_262_16 + var_262_17 then
				local var_262_18 = (arg_259_1.time_ - var_262_16) / var_262_17
				local var_262_19 = Color.New(0, 0, 0)

				var_262_19.a = Mathf.Lerp(0, 1, var_262_18)
				arg_259_1.mask_.color = var_262_19
			end

			if arg_259_1.time_ >= var_262_16 + var_262_17 and arg_259_1.time_ < var_262_16 + var_262_17 + arg_262_0 then
				local var_262_20 = Color.New(0, 0, 0)

				var_262_20.a = 1
				arg_259_1.mask_.color = var_262_20
			end

			local var_262_21 = 2

			if var_262_21 < arg_259_1.time_ and arg_259_1.time_ <= var_262_21 + arg_262_0 then
				arg_259_1.mask_.enabled = true
				arg_259_1.mask_.raycastTarget = true

				arg_259_1:SetGaussion(false)
			end

			local var_262_22 = 2

			if var_262_21 <= arg_259_1.time_ and arg_259_1.time_ < var_262_21 + var_262_22 then
				local var_262_23 = (arg_259_1.time_ - var_262_21) / var_262_22
				local var_262_24 = Color.New(0, 0, 0)

				var_262_24.a = Mathf.Lerp(1, 0, var_262_23)
				arg_259_1.mask_.color = var_262_24
			end

			if arg_259_1.time_ >= var_262_21 + var_262_22 and arg_259_1.time_ < var_262_21 + var_262_22 + arg_262_0 then
				local var_262_25 = Color.New(0, 0, 0)
				local var_262_26 = 0

				arg_259_1.mask_.enabled = false
				var_262_25.a = var_262_26
				arg_259_1.mask_.color = var_262_25
			end

			local var_262_27 = arg_259_1.bgs_.ST45.transform
			local var_262_28 = 2

			if var_262_28 < arg_259_1.time_ and arg_259_1.time_ <= var_262_28 + arg_262_0 then
				arg_259_1.var_.moveOldPosST45 = var_262_27.localPosition
			end

			local var_262_29 = 0.001

			if var_262_28 <= arg_259_1.time_ and arg_259_1.time_ < var_262_28 + var_262_29 then
				local var_262_30 = (arg_259_1.time_ - var_262_28) / var_262_29
				local var_262_31 = Vector3.New(0, 1, 9.5)

				var_262_27.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPosST45, var_262_31, var_262_30)
			end

			if arg_259_1.time_ >= var_262_28 + var_262_29 and arg_259_1.time_ < var_262_28 + var_262_29 + arg_262_0 then
				var_262_27.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_262_32 = arg_259_1.bgs_.ST45.transform
			local var_262_33 = 2.01666666666667

			if var_262_33 < arg_259_1.time_ and arg_259_1.time_ <= var_262_33 + arg_262_0 then
				arg_259_1.var_.moveOldPosST45 = var_262_32.localPosition
			end

			local var_262_34 = 3.5

			if var_262_33 <= arg_259_1.time_ and arg_259_1.time_ < var_262_33 + var_262_34 then
				local var_262_35 = (arg_259_1.time_ - var_262_33) / var_262_34
				local var_262_36 = Vector3.New(0, 1, 10)

				var_262_32.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPosST45, var_262_36, var_262_35)
			end

			if arg_259_1.time_ >= var_262_33 + var_262_34 and arg_259_1.time_ < var_262_33 + var_262_34 + arg_262_0 then
				var_262_32.localPosition = Vector3.New(0, 1, 10)
			end

			local var_262_37 = 3.9

			if var_262_37 < arg_259_1.time_ and arg_259_1.time_ <= var_262_37 + arg_262_0 then
				arg_259_1.allBtn_.enabled = false
			end

			local var_262_38 = 1.61666666666667

			if arg_259_1.time_ >= var_262_37 + var_262_38 and arg_259_1.time_ < var_262_37 + var_262_38 + arg_262_0 then
				arg_259_1.allBtn_.enabled = true
			end

			if arg_259_1.frameCnt_ <= 1 then
				arg_259_1.dialog_:SetActive(false)
			end

			local var_262_39 = 3.999999999999
			local var_262_40 = 0.6

			if var_262_39 < arg_259_1.time_ and arg_259_1.time_ <= var_262_39 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0

				arg_259_1.dialog_:SetActive(true)

				local var_262_41 = LeanTween.value(arg_259_1.dialog_, 0, 1, 0.3)

				var_262_41:setOnUpdate(LuaHelper.FloatAction(function(arg_263_0)
					arg_259_1.dialogCg_.alpha = arg_263_0
				end))
				var_262_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_259_1.dialog_)
					var_262_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_259_1.duration_ = arg_259_1.duration_ + 0.3

				SetActive(arg_259_1.leftNameGo_, false)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_42 = arg_259_1:GetWordFromCfg(120011064)
				local var_262_43 = arg_259_1:FormatText(var_262_42.content)

				arg_259_1.text_.text = var_262_43

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_44 = 24
				local var_262_45 = utf8.len(var_262_43)
				local var_262_46 = var_262_44 <= 0 and var_262_40 or var_262_40 * (var_262_45 / var_262_44)

				if var_262_46 > 0 and var_262_40 < var_262_46 then
					arg_259_1.talkMaxDuration = var_262_46
					var_262_39 = var_262_39 + 0.3

					if var_262_46 + var_262_39 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_46 + var_262_39
					end
				end

				arg_259_1.text_.text = var_262_43
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_47 = var_262_39 + 0.3
			local var_262_48 = math.max(var_262_40, arg_259_1.talkMaxDuration)

			if var_262_47 <= arg_259_1.time_ and arg_259_1.time_ < var_262_47 + var_262_48 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_47) / var_262_48

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_47 + var_262_48 and arg_259_1.time_ < var_262_47 + var_262_48 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play120011065 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 120011065
		arg_265_1.duration_ = 3.966

		local var_265_0 = {
			zh = 3.133,
			ja = 3.966
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
				arg_265_0:Play120011066(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0
			local var_268_1 = 0.275

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_2 = arg_265_1:FormatText(StoryNameCfg[319].name)

				arg_265_1.leftNameTxt_.text = var_268_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, true)
				arg_265_1.iconController_:SetSelectedState("hero")

				arg_265_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_3 = arg_265_1:GetWordFromCfg(120011065)
				local var_268_4 = arg_265_1:FormatText(var_268_3.content)

				arg_265_1.text_.text = var_268_4

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_5 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011065", "story_v_out_120011.awb") ~= 0 then
					local var_268_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011065", "story_v_out_120011.awb") / 1000

					if var_268_8 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_8 + var_268_0
					end

					if var_268_3.prefab_name ~= "" and arg_265_1.actors_[var_268_3.prefab_name] ~= nil then
						local var_268_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_3.prefab_name].transform, "story_v_out_120011", "120011065", "story_v_out_120011.awb")

						arg_265_1:RecordAudio("120011065", var_268_9)
						arg_265_1:RecordAudio("120011065", var_268_9)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_120011", "120011065", "story_v_out_120011.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_120011", "120011065", "story_v_out_120011.awb")
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
	Play120011066 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 120011066
		arg_269_1.duration_ = 8.475

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play120011067(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = "STblack"

			if arg_269_1.bgs_[var_272_0] == nil then
				local var_272_1 = Object.Instantiate(arg_269_1.paintGo_)

				var_272_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_272_0)
				var_272_1.name = var_272_0
				var_272_1.transform.parent = arg_269_1.stage_.transform
				var_272_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_269_1.bgs_[var_272_0] = var_272_1
			end

			local var_272_2 = 2

			if var_272_2 < arg_269_1.time_ and arg_269_1.time_ <= var_272_2 + arg_272_0 then
				local var_272_3 = manager.ui.mainCamera.transform.localPosition
				local var_272_4 = Vector3.New(0, 0, 10) + Vector3.New(var_272_3.x, var_272_3.y, 0)
				local var_272_5 = arg_269_1.bgs_.STblack

				var_272_5.transform.localPosition = var_272_4
				var_272_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_272_6 = var_272_5:GetComponent("SpriteRenderer")

				if var_272_6 and var_272_6.sprite then
					local var_272_7 = (var_272_5.transform.localPosition - var_272_3).z
					local var_272_8 = manager.ui.mainCameraCom_
					local var_272_9 = 2 * var_272_7 * Mathf.Tan(var_272_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_272_10 = var_272_9 * var_272_8.aspect
					local var_272_11 = var_272_6.sprite.bounds.size.x
					local var_272_12 = var_272_6.sprite.bounds.size.y
					local var_272_13 = var_272_10 / var_272_11
					local var_272_14 = var_272_9 / var_272_12
					local var_272_15 = var_272_14 < var_272_13 and var_272_13 or var_272_14

					var_272_5.transform.localScale = Vector3.New(var_272_15, var_272_15, 0)
				end

				for iter_272_0, iter_272_1 in pairs(arg_269_1.bgs_) do
					if iter_272_0 ~= "STblack" then
						iter_272_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_272_16 = 0

			if var_272_16 < arg_269_1.time_ and arg_269_1.time_ <= var_272_16 + arg_272_0 then
				arg_269_1.mask_.enabled = true
				arg_269_1.mask_.raycastTarget = true

				arg_269_1:SetGaussion(false)
			end

			local var_272_17 = 2

			if var_272_16 <= arg_269_1.time_ and arg_269_1.time_ < var_272_16 + var_272_17 then
				local var_272_18 = (arg_269_1.time_ - var_272_16) / var_272_17
				local var_272_19 = Color.New(0, 0, 0)

				var_272_19.a = Mathf.Lerp(0, 1, var_272_18)
				arg_269_1.mask_.color = var_272_19
			end

			if arg_269_1.time_ >= var_272_16 + var_272_17 and arg_269_1.time_ < var_272_16 + var_272_17 + arg_272_0 then
				local var_272_20 = Color.New(0, 0, 0)

				var_272_20.a = 1
				arg_269_1.mask_.color = var_272_20
			end

			local var_272_21 = 2

			if var_272_21 < arg_269_1.time_ and arg_269_1.time_ <= var_272_21 + arg_272_0 then
				arg_269_1.mask_.enabled = true
				arg_269_1.mask_.raycastTarget = true

				arg_269_1:SetGaussion(false)
			end

			local var_272_22 = 2

			if var_272_21 <= arg_269_1.time_ and arg_269_1.time_ < var_272_21 + var_272_22 then
				local var_272_23 = (arg_269_1.time_ - var_272_21) / var_272_22
				local var_272_24 = Color.New(0, 0, 0)

				var_272_24.a = Mathf.Lerp(1, 0, var_272_23)
				arg_269_1.mask_.color = var_272_24
			end

			if arg_269_1.time_ >= var_272_21 + var_272_22 and arg_269_1.time_ < var_272_21 + var_272_22 + arg_272_0 then
				local var_272_25 = Color.New(0, 0, 0)
				local var_272_26 = 0

				arg_269_1.mask_.enabled = false
				var_272_25.a = var_272_26
				arg_269_1.mask_.color = var_272_25
			end

			local var_272_27 = 0
			local var_272_28 = 0.666666666666667

			if var_272_27 < arg_269_1.time_ and arg_269_1.time_ <= var_272_27 + arg_272_0 then
				local var_272_29 = "play"
				local var_272_30 = "music"

				arg_269_1:AudioAction(var_272_29, var_272_30, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_269_1.frameCnt_ <= 1 then
				arg_269_1.dialog_:SetActive(false)
			end

			local var_272_31 = 3.475
			local var_272_32 = 0.525

			if var_272_31 < arg_269_1.time_ and arg_269_1.time_ <= var_272_31 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0

				arg_269_1.dialog_:SetActive(true)

				local var_272_33 = LeanTween.value(arg_269_1.dialog_, 0, 1, 0.3)

				var_272_33:setOnUpdate(LuaHelper.FloatAction(function(arg_273_0)
					arg_269_1.dialogCg_.alpha = arg_273_0
				end))
				var_272_33:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_269_1.dialog_)
					var_272_33:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_269_1.duration_ = arg_269_1.duration_ + 0.3

				SetActive(arg_269_1.leftNameGo_, false)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_34 = arg_269_1:GetWordFromCfg(120011066)
				local var_272_35 = arg_269_1:FormatText(var_272_34.content)

				arg_269_1.text_.text = var_272_35

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_36 = 21
				local var_272_37 = utf8.len(var_272_35)
				local var_272_38 = var_272_36 <= 0 and var_272_32 or var_272_32 * (var_272_37 / var_272_36)

				if var_272_38 > 0 and var_272_32 < var_272_38 then
					arg_269_1.talkMaxDuration = var_272_38
					var_272_31 = var_272_31 + 0.3

					if var_272_38 + var_272_31 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_38 + var_272_31
					end
				end

				arg_269_1.text_.text = var_272_35
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)
				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_39 = var_272_31 + 0.3
			local var_272_40 = math.max(var_272_32, arg_269_1.talkMaxDuration)

			if var_272_39 <= arg_269_1.time_ and arg_269_1.time_ < var_272_39 + var_272_40 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_39) / var_272_40

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_39 + var_272_40 and arg_269_1.time_ < var_272_39 + var_272_40 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play120011067 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 120011067
		arg_275_1.duration_ = 5

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play120011068(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = 0
			local var_278_1 = 1.375

			if var_278_0 < arg_275_1.time_ and arg_275_1.time_ <= var_278_0 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, false)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_2 = arg_275_1:GetWordFromCfg(120011067)
				local var_278_3 = arg_275_1:FormatText(var_278_2.content)

				arg_275_1.text_.text = var_278_3

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_4 = 55
				local var_278_5 = utf8.len(var_278_3)
				local var_278_6 = var_278_4 <= 0 and var_278_1 or var_278_1 * (var_278_5 / var_278_4)

				if var_278_6 > 0 and var_278_1 < var_278_6 then
					arg_275_1.talkMaxDuration = var_278_6

					if var_278_6 + var_278_0 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_6 + var_278_0
					end
				end

				arg_275_1.text_.text = var_278_3
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)
				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_7 = math.max(var_278_1, arg_275_1.talkMaxDuration)

			if var_278_0 <= arg_275_1.time_ and arg_275_1.time_ < var_278_0 + var_278_7 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_0) / var_278_7

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_0 + var_278_7 and arg_275_1.time_ < var_278_0 + var_278_7 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play120011068 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 120011068
		arg_279_1.duration_ = 5

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play120011069(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = 0
			local var_282_1 = 0.475

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, false)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_2 = arg_279_1:GetWordFromCfg(120011068)
				local var_282_3 = arg_279_1:FormatText(var_282_2.content)

				arg_279_1.text_.text = var_282_3

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_4 = 19
				local var_282_5 = utf8.len(var_282_3)
				local var_282_6 = var_282_4 <= 0 and var_282_1 or var_282_1 * (var_282_5 / var_282_4)

				if var_282_6 > 0 and var_282_1 < var_282_6 then
					arg_279_1.talkMaxDuration = var_282_6

					if var_282_6 + var_282_0 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_6 + var_282_0
					end
				end

				arg_279_1.text_.text = var_282_3
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)
				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_7 = math.max(var_282_1, arg_279_1.talkMaxDuration)

			if var_282_0 <= arg_279_1.time_ and arg_279_1.time_ < var_282_0 + var_282_7 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_0) / var_282_7

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_0 + var_282_7 and arg_279_1.time_ < var_282_0 + var_282_7 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play120011069 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 120011069
		arg_283_1.duration_ = 0.333333333332

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"

			SetActive(arg_283_1.choicesGo_, true)

			for iter_284_0, iter_284_1 in ipairs(arg_283_1.choices_) do
				local var_284_0 = iter_284_0 <= 2

				SetActive(iter_284_1.go, var_284_0)
			end

			arg_283_1.choices_[1].txt.text = arg_283_1:FormatText(StoryChoiceCfg[362].name)
			arg_283_1.choices_[2].txt.text = arg_283_1:FormatText(StoryChoiceCfg[363].name)
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play120011070(arg_283_1)
			end

			if arg_285_0 == 2 then
				arg_283_0:Play120011072(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = 0

			if var_286_0 < arg_283_1.time_ and arg_283_1.time_ <= var_286_0 + arg_286_0 then
				arg_283_1.allBtn_.enabled = false
			end

			local var_286_1 = 0.333333333333333

			if arg_283_1.time_ >= var_286_0 + var_286_1 and arg_283_1.time_ < var_286_0 + var_286_1 + arg_286_0 then
				arg_283_1.allBtn_.enabled = true
			end
		end
	end,
	Play120011070 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 120011070
		arg_287_1.duration_ = 5

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play120011071(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0
			local var_290_1 = 0.675

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, false)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_2 = arg_287_1:GetWordFromCfg(120011070)
				local var_290_3 = arg_287_1:FormatText(var_290_2.content)

				arg_287_1.text_.text = var_290_3

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_4 = 27
				local var_290_5 = utf8.len(var_290_3)
				local var_290_6 = var_290_4 <= 0 and var_290_1 or var_290_1 * (var_290_5 / var_290_4)

				if var_290_6 > 0 and var_290_1 < var_290_6 then
					arg_287_1.talkMaxDuration = var_290_6

					if var_290_6 + var_290_0 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_6 + var_290_0
					end
				end

				arg_287_1.text_.text = var_290_3
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)
				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_7 = math.max(var_290_1, arg_287_1.talkMaxDuration)

			if var_290_0 <= arg_287_1.time_ and arg_287_1.time_ < var_290_0 + var_290_7 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_0) / var_290_7

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_0 + var_290_7 and arg_287_1.time_ < var_290_0 + var_290_7 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play120011071 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 120011071
		arg_291_1.duration_ = 5

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play120011074(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 0
			local var_294_1 = 0.5

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

				local var_294_2 = arg_291_1:GetWordFromCfg(120011071)
				local var_294_3 = arg_291_1:FormatText(var_294_2.content)

				arg_291_1.text_.text = var_294_3

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_4 = 20
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
	Play120011074 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 120011074
		arg_295_1.duration_ = 5

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play120011075(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = 0
			local var_298_1 = 1.025

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

				local var_298_2 = arg_295_1:GetWordFromCfg(120011074)
				local var_298_3 = arg_295_1:FormatText(var_298_2.content)

				arg_295_1.text_.text = var_298_3

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_4 = 41
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
	Play120011075 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 120011075
		arg_299_1.duration_ = 5

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play120011076(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0
			local var_302_1 = 1

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				local var_302_2 = "play"
				local var_302_3 = "effect"

				arg_299_1:AudioAction(var_302_2, var_302_3, "se_story_16", "se_story_16_gun", "")
			end

			local var_302_4 = 0
			local var_302_5 = 0.1

			if var_302_4 < arg_299_1.time_ and arg_299_1.time_ <= var_302_4 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, false)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_6 = arg_299_1:GetWordFromCfg(120011075)
				local var_302_7 = arg_299_1:FormatText(var_302_6.content)

				arg_299_1.text_.text = var_302_7

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_8 = 4
				local var_302_9 = utf8.len(var_302_7)
				local var_302_10 = var_302_8 <= 0 and var_302_5 or var_302_5 * (var_302_9 / var_302_8)

				if var_302_10 > 0 and var_302_5 < var_302_10 then
					arg_299_1.talkMaxDuration = var_302_10

					if var_302_10 + var_302_4 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_10 + var_302_4
					end
				end

				arg_299_1.text_.text = var_302_7
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)
				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_11 = math.max(var_302_5, arg_299_1.talkMaxDuration)

			if var_302_4 <= arg_299_1.time_ and arg_299_1.time_ < var_302_4 + var_302_11 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_4) / var_302_11

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_4 + var_302_11 and arg_299_1.time_ < var_302_4 + var_302_11 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play120011076 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 120011076
		arg_303_1.duration_ = 1

		local var_303_0 = {
			zh = 0.999999999999,
			ja = 1
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
				arg_303_0:Play120011077(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 0
			local var_306_1 = 0.075

			if var_306_0 < arg_303_1.time_ and arg_303_1.time_ <= var_306_0 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_2 = arg_303_1:FormatText(StoryNameCfg[6].name)

				arg_303_1.leftNameTxt_.text = var_306_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, true)
				arg_303_1.iconController_:SetSelectedState("hero")

				arg_303_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_3 = arg_303_1:GetWordFromCfg(120011076)
				local var_306_4 = arg_303_1:FormatText(var_306_3.content)

				arg_303_1.text_.text = var_306_4

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_5 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011076", "story_v_out_120011.awb") ~= 0 then
					local var_306_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011076", "story_v_out_120011.awb") / 1000

					if var_306_8 + var_306_0 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_8 + var_306_0
					end

					if var_306_3.prefab_name ~= "" and arg_303_1.actors_[var_306_3.prefab_name] ~= nil then
						local var_306_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_3.prefab_name].transform, "story_v_out_120011", "120011076", "story_v_out_120011.awb")

						arg_303_1:RecordAudio("120011076", var_306_9)
						arg_303_1:RecordAudio("120011076", var_306_9)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_120011", "120011076", "story_v_out_120011.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_120011", "120011076", "story_v_out_120011.awb")
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
	Play120011077 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 120011077
		arg_307_1.duration_ = 7

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play120011078(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = "ST31"

			if arg_307_1.bgs_[var_310_0] == nil then
				local var_310_1 = Object.Instantiate(arg_307_1.paintGo_)

				var_310_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_310_0)
				var_310_1.name = var_310_0
				var_310_1.transform.parent = arg_307_1.stage_.transform
				var_310_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_307_1.bgs_[var_310_0] = var_310_1
			end

			local var_310_2 = 0

			if var_310_2 < arg_307_1.time_ and arg_307_1.time_ <= var_310_2 + arg_310_0 then
				local var_310_3 = manager.ui.mainCamera.transform.localPosition
				local var_310_4 = Vector3.New(0, 0, 10) + Vector3.New(var_310_3.x, var_310_3.y, 0)
				local var_310_5 = arg_307_1.bgs_.ST31

				var_310_5.transform.localPosition = var_310_4
				var_310_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_310_6 = var_310_5:GetComponent("SpriteRenderer")

				if var_310_6 and var_310_6.sprite then
					local var_310_7 = (var_310_5.transform.localPosition - var_310_3).z
					local var_310_8 = manager.ui.mainCameraCom_
					local var_310_9 = 2 * var_310_7 * Mathf.Tan(var_310_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_310_10 = var_310_9 * var_310_8.aspect
					local var_310_11 = var_310_6.sprite.bounds.size.x
					local var_310_12 = var_310_6.sprite.bounds.size.y
					local var_310_13 = var_310_10 / var_310_11
					local var_310_14 = var_310_9 / var_310_12
					local var_310_15 = var_310_14 < var_310_13 and var_310_13 or var_310_14

					var_310_5.transform.localScale = Vector3.New(var_310_15, var_310_15, 0)
				end

				for iter_310_0, iter_310_1 in pairs(arg_307_1.bgs_) do
					if iter_310_0 ~= "ST31" then
						iter_310_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_310_16 = 0

			if var_310_16 < arg_307_1.time_ and arg_307_1.time_ <= var_310_16 + arg_310_0 then
				arg_307_1.mask_.enabled = true
				arg_307_1.mask_.raycastTarget = true

				arg_307_1:SetGaussion(false)
			end

			local var_310_17 = 2

			if var_310_16 <= arg_307_1.time_ and arg_307_1.time_ < var_310_16 + var_310_17 then
				local var_310_18 = (arg_307_1.time_ - var_310_16) / var_310_17
				local var_310_19 = Color.New(0, 0, 0)

				var_310_19.a = Mathf.Lerp(1, 0, var_310_18)
				arg_307_1.mask_.color = var_310_19
			end

			if arg_307_1.time_ >= var_310_16 + var_310_17 and arg_307_1.time_ < var_310_16 + var_310_17 + arg_310_0 then
				local var_310_20 = Color.New(0, 0, 0)
				local var_310_21 = 0

				arg_307_1.mask_.enabled = false
				var_310_20.a = var_310_21
				arg_307_1.mask_.color = var_310_20
			end

			local var_310_22 = 0
			local var_310_23 = 1

			if var_310_22 < arg_307_1.time_ and arg_307_1.time_ <= var_310_22 + arg_310_0 then
				local var_310_24 = "play"
				local var_310_25 = "effect"

				arg_307_1:AudioAction(var_310_24, var_310_25, "se_story_side_1096", "se_story_1096_crowd_loop", "")
			end

			local var_310_26 = "ST31_blur"

			if arg_307_1.bgs_[var_310_26] == nil then
				local var_310_27 = Object.Instantiate(arg_307_1.blurPaintGo_)
				local var_310_28 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_310_26)

				var_310_27:GetComponent("SpriteRenderer").sprite = var_310_28
				var_310_27.name = var_310_26
				var_310_27.transform.parent = arg_307_1.stage_.transform
				var_310_27.transform.localPosition = Vector3.New(0, 100, 0)
				arg_307_1.bgs_[var_310_26] = var_310_27
			end

			local var_310_29 = 0
			local var_310_30 = arg_307_1.bgs_[var_310_26]

			if var_310_29 < arg_307_1.time_ and arg_307_1.time_ <= var_310_29 + arg_310_0 then
				local var_310_31 = manager.ui.mainCamera.transform.localPosition
				local var_310_32 = Vector3.New(0, 0, 10) + Vector3.New(var_310_31.x, var_310_31.y, 0)

				var_310_30.transform.localPosition = var_310_32
				var_310_30.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_310_33 = var_310_30:GetComponent("SpriteRenderer")

				if var_310_33 and var_310_33.sprite then
					local var_310_34 = (var_310_30.transform.localPosition - var_310_31).z
					local var_310_35 = manager.ui.mainCameraCom_
					local var_310_36 = 2 * var_310_34 * Mathf.Tan(var_310_35.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_310_37 = var_310_36 * var_310_35.aspect
					local var_310_38 = var_310_33.sprite.bounds.size.x
					local var_310_39 = var_310_33.sprite.bounds.size.y
					local var_310_40 = var_310_37 / var_310_38
					local var_310_41 = var_310_36 / var_310_39
					local var_310_42 = var_310_41 < var_310_40 and var_310_40 or var_310_41

					var_310_30.transform.localScale = Vector3.New(var_310_42, var_310_42, 0)
				end
			end

			local var_310_43 = 2

			if var_310_29 <= arg_307_1.time_ and arg_307_1.time_ < var_310_29 + var_310_43 then
				local var_310_44 = (arg_307_1.time_ - var_310_29) / var_310_43
				local var_310_45 = Color.New(1, 1, 1)

				var_310_45.a = Mathf.Lerp(0, 1, var_310_44)

				var_310_30:GetComponent("SpriteRenderer").material:SetColor("_Color", var_310_45)
			end

			local var_310_46 = 0
			local var_310_47 = 0.433333333333333

			if var_310_46 < arg_307_1.time_ and arg_307_1.time_ <= var_310_46 + arg_310_0 then
				local var_310_48 = "play"
				local var_310_49 = "music"

				arg_307_1:AudioAction(var_310_48, var_310_49, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_310_50 = 0.517975796759129
			local var_310_51 = 0.8

			if var_310_50 < arg_307_1.time_ and arg_307_1.time_ <= var_310_50 + arg_310_0 then
				local var_310_52 = "play"
				local var_310_53 = "music"

				arg_307_1:AudioAction(var_310_52, var_310_53, "bgm_activity_2_0_story_tianlu", "bgm_activity_2_0_story_tianlu", "bgm_activity_2_0_story_tianlu.awb")
			end

			if arg_307_1.frameCnt_ <= 1 then
				arg_307_1.dialog_:SetActive(false)
			end

			local var_310_54 = 2
			local var_310_55 = 1.075

			if var_310_54 < arg_307_1.time_ and arg_307_1.time_ <= var_310_54 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0

				arg_307_1.dialog_:SetActive(true)

				local var_310_56 = LeanTween.value(arg_307_1.dialog_, 0, 1, 0.3)

				var_310_56:setOnUpdate(LuaHelper.FloatAction(function(arg_311_0)
					arg_307_1.dialogCg_.alpha = arg_311_0
				end))
				var_310_56:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_307_1.dialog_)
					var_310_56:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_307_1.duration_ = arg_307_1.duration_ + 0.3

				SetActive(arg_307_1.leftNameGo_, false)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_57 = arg_307_1:GetWordFromCfg(120011077)
				local var_310_58 = arg_307_1:FormatText(var_310_57.content)

				arg_307_1.text_.text = var_310_58

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_59 = 43
				local var_310_60 = utf8.len(var_310_58)
				local var_310_61 = var_310_59 <= 0 and var_310_55 or var_310_55 * (var_310_60 / var_310_59)

				if var_310_61 > 0 and var_310_55 < var_310_61 then
					arg_307_1.talkMaxDuration = var_310_61
					var_310_54 = var_310_54 + 0.3

					if var_310_61 + var_310_54 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_61 + var_310_54
					end
				end

				arg_307_1.text_.text = var_310_58
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)
				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_62 = var_310_54 + 0.3
			local var_310_63 = math.max(var_310_55, arg_307_1.talkMaxDuration)

			if var_310_62 <= arg_307_1.time_ and arg_307_1.time_ < var_310_62 + var_310_63 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_62) / var_310_63

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_62 + var_310_63 and arg_307_1.time_ < var_310_62 + var_310_63 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play120011078 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 120011078
		arg_313_1.duration_ = 5

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play120011079(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = 0
			local var_316_1 = 1.55

			if var_316_0 < arg_313_1.time_ and arg_313_1.time_ <= var_316_0 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, false)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_2 = arg_313_1:GetWordFromCfg(120011078)
				local var_316_3 = arg_313_1:FormatText(var_316_2.content)

				arg_313_1.text_.text = var_316_3

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_4 = 61
				local var_316_5 = utf8.len(var_316_3)
				local var_316_6 = var_316_4 <= 0 and var_316_1 or var_316_1 * (var_316_5 / var_316_4)

				if var_316_6 > 0 and var_316_1 < var_316_6 then
					arg_313_1.talkMaxDuration = var_316_6

					if var_316_6 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_6 + var_316_0
					end
				end

				arg_313_1.text_.text = var_316_3
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)
				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_7 = math.max(var_316_1, arg_313_1.talkMaxDuration)

			if var_316_0 <= arg_313_1.time_ and arg_313_1.time_ < var_316_0 + var_316_7 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_0) / var_316_7

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_0 + var_316_7 and arg_313_1.time_ < var_316_0 + var_316_7 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play120011079 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 120011079
		arg_317_1.duration_ = 3.5

		local var_317_0 = {
			zh = 3,
			ja = 3.5
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
				arg_317_0:Play120011080(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = "1084ui_story"

			if arg_317_1.actors_[var_320_0] == nil then
				local var_320_1 = Object.Instantiate(Asset.Load("Char/" .. var_320_0), arg_317_1.stage_.transform)

				var_320_1.name = var_320_0
				var_320_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_317_1.actors_[var_320_0] = var_320_1

				local var_320_2 = var_320_1:GetComponentInChildren(typeof(CharacterEffect))

				var_320_2.enabled = true

				local var_320_3 = GameObjectTools.GetOrAddComponent(var_320_1, typeof(DynamicBoneHelper))

				if var_320_3 then
					var_320_3:EnableDynamicBone(false)
				end

				arg_317_1:ShowWeapon(var_320_2.transform, false)

				arg_317_1.var_[var_320_0 .. "Animator"] = var_320_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_317_1.var_[var_320_0 .. "Animator"].applyRootMotion = true
				arg_317_1.var_[var_320_0 .. "LipSync"] = var_320_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_320_4 = arg_317_1.actors_["1084ui_story"].transform
			local var_320_5 = 0

			if var_320_5 < arg_317_1.time_ and arg_317_1.time_ <= var_320_5 + arg_320_0 then
				arg_317_1.var_.moveOldPos1084ui_story = var_320_4.localPosition
			end

			local var_320_6 = 0.001

			if var_320_5 <= arg_317_1.time_ and arg_317_1.time_ < var_320_5 + var_320_6 then
				local var_320_7 = (arg_317_1.time_ - var_320_5) / var_320_6
				local var_320_8 = Vector3.New(0, -0.97, -6)

				var_320_4.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos1084ui_story, var_320_8, var_320_7)

				local var_320_9 = manager.ui.mainCamera.transform.position - var_320_4.position

				var_320_4.forward = Vector3.New(var_320_9.x, var_320_9.y, var_320_9.z)

				local var_320_10 = var_320_4.localEulerAngles

				var_320_10.z = 0
				var_320_10.x = 0
				var_320_4.localEulerAngles = var_320_10
			end

			if arg_317_1.time_ >= var_320_5 + var_320_6 and arg_317_1.time_ < var_320_5 + var_320_6 + arg_320_0 then
				var_320_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_320_11 = manager.ui.mainCamera.transform.position - var_320_4.position

				var_320_4.forward = Vector3.New(var_320_11.x, var_320_11.y, var_320_11.z)

				local var_320_12 = var_320_4.localEulerAngles

				var_320_12.z = 0
				var_320_12.x = 0
				var_320_4.localEulerAngles = var_320_12
			end

			local var_320_13 = arg_317_1.actors_["1084ui_story"]
			local var_320_14 = 0

			if var_320_14 < arg_317_1.time_ and arg_317_1.time_ <= var_320_14 + arg_320_0 and arg_317_1.var_.characterEffect1084ui_story == nil then
				arg_317_1.var_.characterEffect1084ui_story = var_320_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_15 = 0.2

			if var_320_14 <= arg_317_1.time_ and arg_317_1.time_ < var_320_14 + var_320_15 then
				local var_320_16 = (arg_317_1.time_ - var_320_14) / var_320_15

				if arg_317_1.var_.characterEffect1084ui_story then
					arg_317_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_317_1.time_ >= var_320_14 + var_320_15 and arg_317_1.time_ < var_320_14 + var_320_15 + arg_320_0 and arg_317_1.var_.characterEffect1084ui_story then
				arg_317_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_320_17 = 0

			if var_320_17 < arg_317_1.time_ and arg_317_1.time_ <= var_320_17 + arg_320_0 then
				arg_317_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_320_18 = 0

			if var_320_18 < arg_317_1.time_ and arg_317_1.time_ <= var_320_18 + arg_320_0 then
				arg_317_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_320_19 = "ST31_blur"

			if arg_317_1.bgs_[var_320_19] == nil then
				local var_320_20 = Object.Instantiate(arg_317_1.blurPaintGo_)
				local var_320_21 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_320_19)

				var_320_20:GetComponent("SpriteRenderer").sprite = var_320_21
				var_320_20.name = var_320_19
				var_320_20.transform.parent = arg_317_1.stage_.transform
				var_320_20.transform.localPosition = Vector3.New(0, 100, 0)
				arg_317_1.bgs_[var_320_19] = var_320_20
			end

			local var_320_22 = 0
			local var_320_23 = arg_317_1.bgs_[var_320_19]

			if var_320_22 < arg_317_1.time_ and arg_317_1.time_ <= var_320_22 + arg_320_0 then
				local var_320_24 = manager.ui.mainCamera.transform.localPosition
				local var_320_25 = Vector3.New(0, 0, 10) + Vector3.New(var_320_24.x, var_320_24.y, 0)

				var_320_23.transform.localPosition = var_320_25
				var_320_23.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_320_26 = var_320_23:GetComponent("SpriteRenderer")

				if var_320_26 and var_320_26.sprite then
					local var_320_27 = (var_320_23.transform.localPosition - var_320_24).z
					local var_320_28 = manager.ui.mainCameraCom_
					local var_320_29 = 2 * var_320_27 * Mathf.Tan(var_320_28.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_320_30 = var_320_29 * var_320_28.aspect
					local var_320_31 = var_320_26.sprite.bounds.size.x
					local var_320_32 = var_320_26.sprite.bounds.size.y
					local var_320_33 = var_320_30 / var_320_31
					local var_320_34 = var_320_29 / var_320_32
					local var_320_35 = var_320_34 < var_320_33 and var_320_33 or var_320_34

					var_320_23.transform.localScale = Vector3.New(var_320_35, var_320_35, 0)
				end
			end

			local var_320_36 = 2

			if var_320_22 <= arg_317_1.time_ and arg_317_1.time_ < var_320_22 + var_320_36 then
				local var_320_37 = (arg_317_1.time_ - var_320_22) / var_320_36
				local var_320_38 = Color.New(1, 1, 1)

				var_320_38.a = Mathf.Lerp(1, 0, var_320_37)

				var_320_23:GetComponent("SpriteRenderer").material:SetColor("_Color", var_320_38)
			end

			local var_320_39 = 0
			local var_320_40 = 0.325

			if var_320_39 < arg_317_1.time_ and arg_317_1.time_ <= var_320_39 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_41 = arg_317_1:FormatText(StoryNameCfg[6].name)

				arg_317_1.leftNameTxt_.text = var_320_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_42 = arg_317_1:GetWordFromCfg(120011079)
				local var_320_43 = arg_317_1:FormatText(var_320_42.content)

				arg_317_1.text_.text = var_320_43

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_44 = 13
				local var_320_45 = utf8.len(var_320_43)
				local var_320_46 = var_320_44 <= 0 and var_320_40 or var_320_40 * (var_320_45 / var_320_44)

				if var_320_46 > 0 and var_320_40 < var_320_46 then
					arg_317_1.talkMaxDuration = var_320_46

					if var_320_46 + var_320_39 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_46 + var_320_39
					end
				end

				arg_317_1.text_.text = var_320_43
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011079", "story_v_out_120011.awb") ~= 0 then
					local var_320_47 = manager.audio:GetVoiceLength("story_v_out_120011", "120011079", "story_v_out_120011.awb") / 1000

					if var_320_47 + var_320_39 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_47 + var_320_39
					end

					if var_320_42.prefab_name ~= "" and arg_317_1.actors_[var_320_42.prefab_name] ~= nil then
						local var_320_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_42.prefab_name].transform, "story_v_out_120011", "120011079", "story_v_out_120011.awb")

						arg_317_1:RecordAudio("120011079", var_320_48)
						arg_317_1:RecordAudio("120011079", var_320_48)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_120011", "120011079", "story_v_out_120011.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_120011", "120011079", "story_v_out_120011.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_49 = math.max(var_320_40, arg_317_1.talkMaxDuration)

			if var_320_39 <= arg_317_1.time_ and arg_317_1.time_ < var_320_39 + var_320_49 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_39) / var_320_49

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_39 + var_320_49 and arg_317_1.time_ < var_320_39 + var_320_49 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play120011080 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 120011080
		arg_321_1.duration_ = 8.45

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play120011081(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = 0

			if var_324_0 < arg_321_1.time_ and arg_321_1.time_ <= var_324_0 + arg_324_0 then
				arg_321_1.mask_.enabled = true
				arg_321_1.mask_.raycastTarget = true

				arg_321_1:SetGaussion(false)
			end

			local var_324_1 = 2

			if var_324_0 <= arg_321_1.time_ and arg_321_1.time_ < var_324_0 + var_324_1 then
				local var_324_2 = (arg_321_1.time_ - var_324_0) / var_324_1
				local var_324_3 = Color.New(0, 0, 0)

				var_324_3.a = Mathf.Lerp(0, 1, var_324_2)
				arg_321_1.mask_.color = var_324_3
			end

			if arg_321_1.time_ >= var_324_0 + var_324_1 and arg_321_1.time_ < var_324_0 + var_324_1 + arg_324_0 then
				local var_324_4 = Color.New(0, 0, 0)

				var_324_4.a = 1
				arg_321_1.mask_.color = var_324_4
			end

			local var_324_5 = 2

			if var_324_5 < arg_321_1.time_ and arg_321_1.time_ <= var_324_5 + arg_324_0 then
				arg_321_1.mask_.enabled = true
				arg_321_1.mask_.raycastTarget = true

				arg_321_1:SetGaussion(false)
			end

			local var_324_6 = 2

			if var_324_5 <= arg_321_1.time_ and arg_321_1.time_ < var_324_5 + var_324_6 then
				local var_324_7 = (arg_321_1.time_ - var_324_5) / var_324_6
				local var_324_8 = Color.New(0, 0, 0)

				var_324_8.a = Mathf.Lerp(1, 0, var_324_7)
				arg_321_1.mask_.color = var_324_8
			end

			if arg_321_1.time_ >= var_324_5 + var_324_6 and arg_321_1.time_ < var_324_5 + var_324_6 + arg_324_0 then
				local var_324_9 = Color.New(0, 0, 0)
				local var_324_10 = 0

				arg_321_1.mask_.enabled = false
				var_324_9.a = var_324_10
				arg_321_1.mask_.color = var_324_9
			end

			local var_324_11 = arg_321_1.actors_["1084ui_story"].transform
			local var_324_12 = 2

			if var_324_12 < arg_321_1.time_ and arg_321_1.time_ <= var_324_12 + arg_324_0 then
				arg_321_1.var_.moveOldPos1084ui_story = var_324_11.localPosition
			end

			local var_324_13 = 0.001

			if var_324_12 <= arg_321_1.time_ and arg_321_1.time_ < var_324_12 + var_324_13 then
				local var_324_14 = (arg_321_1.time_ - var_324_12) / var_324_13
				local var_324_15 = Vector3.New(0, 100, 0)

				var_324_11.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos1084ui_story, var_324_15, var_324_14)

				local var_324_16 = manager.ui.mainCamera.transform.position - var_324_11.position

				var_324_11.forward = Vector3.New(var_324_16.x, var_324_16.y, var_324_16.z)

				local var_324_17 = var_324_11.localEulerAngles

				var_324_17.z = 0
				var_324_17.x = 0
				var_324_11.localEulerAngles = var_324_17
			end

			if arg_321_1.time_ >= var_324_12 + var_324_13 and arg_321_1.time_ < var_324_12 + var_324_13 + arg_324_0 then
				var_324_11.localPosition = Vector3.New(0, 100, 0)

				local var_324_18 = manager.ui.mainCamera.transform.position - var_324_11.position

				var_324_11.forward = Vector3.New(var_324_18.x, var_324_18.y, var_324_18.z)

				local var_324_19 = var_324_11.localEulerAngles

				var_324_19.z = 0
				var_324_19.x = 0
				var_324_11.localEulerAngles = var_324_19
			end

			local var_324_20 = 0

			if var_324_20 < arg_321_1.time_ and arg_321_1.time_ <= var_324_20 + arg_324_0 then
				arg_321_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_324_21 = 0

			if var_324_21 < arg_321_1.time_ and arg_321_1.time_ <= var_324_21 + arg_324_0 then
				arg_321_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			if arg_321_1.frameCnt_ <= 1 then
				arg_321_1.dialog_:SetActive(false)
			end

			local var_324_22 = 3.45
			local var_324_23 = 1.45

			if var_324_22 < arg_321_1.time_ and arg_321_1.time_ <= var_324_22 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0

				arg_321_1.dialog_:SetActive(true)

				local var_324_24 = LeanTween.value(arg_321_1.dialog_, 0, 1, 0.3)

				var_324_24:setOnUpdate(LuaHelper.FloatAction(function(arg_325_0)
					arg_321_1.dialogCg_.alpha = arg_325_0
				end))
				var_324_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_321_1.dialog_)
					var_324_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_321_1.duration_ = arg_321_1.duration_ + 0.3

				SetActive(arg_321_1.leftNameGo_, false)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_25 = arg_321_1:GetWordFromCfg(120011080)
				local var_324_26 = arg_321_1:FormatText(var_324_25.content)

				arg_321_1.text_.text = var_324_26

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_27 = 42
				local var_324_28 = utf8.len(var_324_26)
				local var_324_29 = var_324_27 <= 0 and var_324_23 or var_324_23 * (var_324_28 / var_324_27)

				if var_324_29 > 0 and var_324_23 < var_324_29 then
					arg_321_1.talkMaxDuration = var_324_29
					var_324_22 = var_324_22 + 0.3

					if var_324_29 + var_324_22 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_29 + var_324_22
					end
				end

				arg_321_1.text_.text = var_324_26
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)
				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_30 = var_324_22 + 0.3
			local var_324_31 = math.max(var_324_23, arg_321_1.talkMaxDuration)

			if var_324_30 <= arg_321_1.time_ and arg_321_1.time_ < var_324_30 + var_324_31 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_30) / var_324_31

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_30 + var_324_31 and arg_321_1.time_ < var_324_30 + var_324_31 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play120011081 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 120011081
		arg_327_1.duration_ = 5

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play120011082(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = 0
			local var_330_1 = 0.375

			if var_330_0 < arg_327_1.time_ and arg_327_1.time_ <= var_330_0 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_2 = arg_327_1:FormatText(StoryNameCfg[7].name)

				arg_327_1.leftNameTxt_.text = var_330_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_3 = arg_327_1:GetWordFromCfg(120011081)
				local var_330_4 = arg_327_1:FormatText(var_330_3.content)

				arg_327_1.text_.text = var_330_4

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_5 = 15
				local var_330_6 = utf8.len(var_330_4)
				local var_330_7 = var_330_5 <= 0 and var_330_1 or var_330_1 * (var_330_6 / var_330_5)

				if var_330_7 > 0 and var_330_1 < var_330_7 then
					arg_327_1.talkMaxDuration = var_330_7

					if var_330_7 + var_330_0 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_7 + var_330_0
					end
				end

				arg_327_1.text_.text = var_330_4
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)
				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_8 = math.max(var_330_1, arg_327_1.talkMaxDuration)

			if var_330_0 <= arg_327_1.time_ and arg_327_1.time_ < var_330_0 + var_330_8 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_0) / var_330_8

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_0 + var_330_8 and arg_327_1.time_ < var_330_0 + var_330_8 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play120011082 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 120011082
		arg_331_1.duration_ = 3.033

		local var_331_0 = {
			zh = 3.033,
			ja = 2.6
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
				arg_331_0:Play120011083(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1084ui_story"].transform
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 then
				arg_331_1.var_.moveOldPos1084ui_story = var_334_0.localPosition
			end

			local var_334_2 = 0.001

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2
				local var_334_4 = Vector3.New(0, -0.97, -6)

				var_334_0.localPosition = Vector3.Lerp(arg_331_1.var_.moveOldPos1084ui_story, var_334_4, var_334_3)

				local var_334_5 = manager.ui.mainCamera.transform.position - var_334_0.position

				var_334_0.forward = Vector3.New(var_334_5.x, var_334_5.y, var_334_5.z)

				local var_334_6 = var_334_0.localEulerAngles

				var_334_6.z = 0
				var_334_6.x = 0
				var_334_0.localEulerAngles = var_334_6
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 then
				var_334_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_334_7 = manager.ui.mainCamera.transform.position - var_334_0.position

				var_334_0.forward = Vector3.New(var_334_7.x, var_334_7.y, var_334_7.z)

				local var_334_8 = var_334_0.localEulerAngles

				var_334_8.z = 0
				var_334_8.x = 0
				var_334_0.localEulerAngles = var_334_8
			end

			local var_334_9 = arg_331_1.actors_["1084ui_story"]
			local var_334_10 = 0

			if var_334_10 < arg_331_1.time_ and arg_331_1.time_ <= var_334_10 + arg_334_0 and arg_331_1.var_.characterEffect1084ui_story == nil then
				arg_331_1.var_.characterEffect1084ui_story = var_334_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_11 = 0.2

			if var_334_10 <= arg_331_1.time_ and arg_331_1.time_ < var_334_10 + var_334_11 then
				local var_334_12 = (arg_331_1.time_ - var_334_10) / var_334_11

				if arg_331_1.var_.characterEffect1084ui_story then
					arg_331_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_331_1.time_ >= var_334_10 + var_334_11 and arg_331_1.time_ < var_334_10 + var_334_11 + arg_334_0 and arg_331_1.var_.characterEffect1084ui_story then
				arg_331_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_334_13 = 0

			if var_334_13 < arg_331_1.time_ and arg_331_1.time_ <= var_334_13 + arg_334_0 then
				arg_331_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_334_14 = 0

			if var_334_14 < arg_331_1.time_ and arg_331_1.time_ <= var_334_14 + arg_334_0 then
				arg_331_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action2_1")
			end

			local var_334_15 = 0
			local var_334_16 = 0.275

			if var_334_15 < arg_331_1.time_ and arg_331_1.time_ <= var_334_15 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_17 = arg_331_1:FormatText(StoryNameCfg[6].name)

				arg_331_1.leftNameTxt_.text = var_334_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_18 = arg_331_1:GetWordFromCfg(120011082)
				local var_334_19 = arg_331_1:FormatText(var_334_18.content)

				arg_331_1.text_.text = var_334_19

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_20 = 11
				local var_334_21 = utf8.len(var_334_19)
				local var_334_22 = var_334_20 <= 0 and var_334_16 or var_334_16 * (var_334_21 / var_334_20)

				if var_334_22 > 0 and var_334_16 < var_334_22 then
					arg_331_1.talkMaxDuration = var_334_22

					if var_334_22 + var_334_15 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_22 + var_334_15
					end
				end

				arg_331_1.text_.text = var_334_19
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011082", "story_v_out_120011.awb") ~= 0 then
					local var_334_23 = manager.audio:GetVoiceLength("story_v_out_120011", "120011082", "story_v_out_120011.awb") / 1000

					if var_334_23 + var_334_15 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_23 + var_334_15
					end

					if var_334_18.prefab_name ~= "" and arg_331_1.actors_[var_334_18.prefab_name] ~= nil then
						local var_334_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_18.prefab_name].transform, "story_v_out_120011", "120011082", "story_v_out_120011.awb")

						arg_331_1:RecordAudio("120011082", var_334_24)
						arg_331_1:RecordAudio("120011082", var_334_24)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_120011", "120011082", "story_v_out_120011.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_120011", "120011082", "story_v_out_120011.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_25 = math.max(var_334_16, arg_331_1.talkMaxDuration)

			if var_334_15 <= arg_331_1.time_ and arg_331_1.time_ < var_334_15 + var_334_25 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_15) / var_334_25

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_15 + var_334_25 and arg_331_1.time_ < var_334_15 + var_334_25 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play120011083 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 120011083
		arg_335_1.duration_ = 5

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play120011084(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = arg_335_1.actors_["1084ui_story"].transform
			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 then
				arg_335_1.var_.moveOldPos1084ui_story = var_338_0.localPosition
			end

			local var_338_2 = 0.001

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_2 then
				local var_338_3 = (arg_335_1.time_ - var_338_1) / var_338_2
				local var_338_4 = Vector3.New(0, 100, 0)

				var_338_0.localPosition = Vector3.Lerp(arg_335_1.var_.moveOldPos1084ui_story, var_338_4, var_338_3)

				local var_338_5 = manager.ui.mainCamera.transform.position - var_338_0.position

				var_338_0.forward = Vector3.New(var_338_5.x, var_338_5.y, var_338_5.z)

				local var_338_6 = var_338_0.localEulerAngles

				var_338_6.z = 0
				var_338_6.x = 0
				var_338_0.localEulerAngles = var_338_6
			end

			if arg_335_1.time_ >= var_338_1 + var_338_2 and arg_335_1.time_ < var_338_1 + var_338_2 + arg_338_0 then
				var_338_0.localPosition = Vector3.New(0, 100, 0)

				local var_338_7 = manager.ui.mainCamera.transform.position - var_338_0.position

				var_338_0.forward = Vector3.New(var_338_7.x, var_338_7.y, var_338_7.z)

				local var_338_8 = var_338_0.localEulerAngles

				var_338_8.z = 0
				var_338_8.x = 0
				var_338_0.localEulerAngles = var_338_8
			end

			local var_338_9 = 0
			local var_338_10 = 1.625

			if var_338_9 < arg_335_1.time_ and arg_335_1.time_ <= var_338_9 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, false)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_11 = arg_335_1:GetWordFromCfg(120011083)
				local var_338_12 = arg_335_1:FormatText(var_338_11.content)

				arg_335_1.text_.text = var_338_12

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_13 = 65
				local var_338_14 = utf8.len(var_338_12)
				local var_338_15 = var_338_13 <= 0 and var_338_10 or var_338_10 * (var_338_14 / var_338_13)

				if var_338_15 > 0 and var_338_10 < var_338_15 then
					arg_335_1.talkMaxDuration = var_338_15

					if var_338_15 + var_338_9 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_15 + var_338_9
					end
				end

				arg_335_1.text_.text = var_338_12
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)
				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_16 = math.max(var_338_10, arg_335_1.talkMaxDuration)

			if var_338_9 <= arg_335_1.time_ and arg_335_1.time_ < var_338_9 + var_338_16 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_9) / var_338_16

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_9 + var_338_16 and arg_335_1.time_ < var_338_9 + var_338_16 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play120011084 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 120011084
		arg_339_1.duration_ = 5

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play120011085(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = 0
			local var_342_1 = 0.975

			if var_342_0 < arg_339_1.time_ and arg_339_1.time_ <= var_342_0 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_2 = arg_339_1:FormatText(StoryNameCfg[7].name)

				arg_339_1.leftNameTxt_.text = var_342_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_3 = arg_339_1:GetWordFromCfg(120011084)
				local var_342_4 = arg_339_1:FormatText(var_342_3.content)

				arg_339_1.text_.text = var_342_4

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_5 = 39
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
				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_8 = math.max(var_342_1, arg_339_1.talkMaxDuration)

			if var_342_0 <= arg_339_1.time_ and arg_339_1.time_ < var_342_0 + var_342_8 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_0) / var_342_8

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_0 + var_342_8 and arg_339_1.time_ < var_342_0 + var_342_8 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play120011085 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 120011085
		arg_343_1.duration_ = 5

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play120011086(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = 0
			local var_346_1 = 0.325

			if var_346_0 < arg_343_1.time_ and arg_343_1.time_ <= var_346_0 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, false)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_2 = arg_343_1:GetWordFromCfg(120011085)
				local var_346_3 = arg_343_1:FormatText(var_346_2.content)

				arg_343_1.text_.text = var_346_3

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_4 = 13
				local var_346_5 = utf8.len(var_346_3)
				local var_346_6 = var_346_4 <= 0 and var_346_1 or var_346_1 * (var_346_5 / var_346_4)

				if var_346_6 > 0 and var_346_1 < var_346_6 then
					arg_343_1.talkMaxDuration = var_346_6

					if var_346_6 + var_346_0 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_6 + var_346_0
					end
				end

				arg_343_1.text_.text = var_346_3
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)
				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_7 = math.max(var_346_1, arg_343_1.talkMaxDuration)

			if var_346_0 <= arg_343_1.time_ and arg_343_1.time_ < var_346_0 + var_346_7 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_0) / var_346_7

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_0 + var_346_7 and arg_343_1.time_ < var_346_0 + var_346_7 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play120011086 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 120011086
		arg_347_1.duration_ = 5

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play120011087(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = 0
			local var_350_1 = 0.225

			if var_350_0 < arg_347_1.time_ and arg_347_1.time_ <= var_350_0 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_2 = arg_347_1:FormatText(StoryNameCfg[7].name)

				arg_347_1.leftNameTxt_.text = var_350_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_3 = arg_347_1:GetWordFromCfg(120011086)
				local var_350_4 = arg_347_1:FormatText(var_350_3.content)

				arg_347_1.text_.text = var_350_4

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_5 = 9
				local var_350_6 = utf8.len(var_350_4)
				local var_350_7 = var_350_5 <= 0 and var_350_1 or var_350_1 * (var_350_6 / var_350_5)

				if var_350_7 > 0 and var_350_1 < var_350_7 then
					arg_347_1.talkMaxDuration = var_350_7

					if var_350_7 + var_350_0 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_7 + var_350_0
					end
				end

				arg_347_1.text_.text = var_350_4
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)
				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_8 = math.max(var_350_1, arg_347_1.talkMaxDuration)

			if var_350_0 <= arg_347_1.time_ and arg_347_1.time_ < var_350_0 + var_350_8 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_0) / var_350_8

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_0 + var_350_8 and arg_347_1.time_ < var_350_0 + var_350_8 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play120011087 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 120011087
		arg_351_1.duration_ = 7.2

		local var_351_0 = {
			zh = 4,
			ja = 7.2
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
				arg_351_0:Play120011088(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = 0
			local var_354_1 = 0.425

			if var_354_0 < arg_351_1.time_ and arg_351_1.time_ <= var_354_0 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_2 = arg_351_1:FormatText(StoryNameCfg[10].name)

				arg_351_1.leftNameTxt_.text = var_354_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, true)
				arg_351_1.iconController_:SetSelectedState("hero")

				arg_351_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_3 = arg_351_1:GetWordFromCfg(120011087)
				local var_354_4 = arg_351_1:FormatText(var_354_3.content)

				arg_351_1.text_.text = var_354_4

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_5 = 17
				local var_354_6 = utf8.len(var_354_4)
				local var_354_7 = var_354_5 <= 0 and var_354_1 or var_354_1 * (var_354_6 / var_354_5)

				if var_354_7 > 0 and var_354_1 < var_354_7 then
					arg_351_1.talkMaxDuration = var_354_7

					if var_354_7 + var_354_0 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_7 + var_354_0
					end
				end

				arg_351_1.text_.text = var_354_4
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011087", "story_v_out_120011.awb") ~= 0 then
					local var_354_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011087", "story_v_out_120011.awb") / 1000

					if var_354_8 + var_354_0 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_8 + var_354_0
					end

					if var_354_3.prefab_name ~= "" and arg_351_1.actors_[var_354_3.prefab_name] ~= nil then
						local var_354_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_3.prefab_name].transform, "story_v_out_120011", "120011087", "story_v_out_120011.awb")

						arg_351_1:RecordAudio("120011087", var_354_9)
						arg_351_1:RecordAudio("120011087", var_354_9)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_out_120011", "120011087", "story_v_out_120011.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_out_120011", "120011087", "story_v_out_120011.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_10 = math.max(var_354_1, arg_351_1.talkMaxDuration)

			if var_354_0 <= arg_351_1.time_ and arg_351_1.time_ < var_354_0 + var_354_10 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_0) / var_354_10

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_0 + var_354_10 and arg_351_1.time_ < var_354_0 + var_354_10 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play120011088 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 120011088
		arg_355_1.duration_ = 5

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play120011089(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = 0
			local var_358_1 = 0.475

			if var_358_0 < arg_355_1.time_ and arg_355_1.time_ <= var_358_0 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_2 = arg_355_1:FormatText(StoryNameCfg[7].name)

				arg_355_1.leftNameTxt_.text = var_358_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_3 = arg_355_1:GetWordFromCfg(120011088)
				local var_358_4 = arg_355_1:FormatText(var_358_3.content)

				arg_355_1.text_.text = var_358_4

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_5 = 19
				local var_358_6 = utf8.len(var_358_4)
				local var_358_7 = var_358_5 <= 0 and var_358_1 or var_358_1 * (var_358_6 / var_358_5)

				if var_358_7 > 0 and var_358_1 < var_358_7 then
					arg_355_1.talkMaxDuration = var_358_7

					if var_358_7 + var_358_0 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_7 + var_358_0
					end
				end

				arg_355_1.text_.text = var_358_4
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)
				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_8 = math.max(var_358_1, arg_355_1.talkMaxDuration)

			if var_358_0 <= arg_355_1.time_ and arg_355_1.time_ < var_358_0 + var_358_8 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_0) / var_358_8

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_0 + var_358_8 and arg_355_1.time_ < var_358_0 + var_358_8 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play120011089 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 120011089
		arg_359_1.duration_ = 4.033

		local var_359_0 = {
			zh = 3.633,
			ja = 4.033
		}
		local var_359_1 = manager.audio:GetLocalizationFlag()

		if var_359_0[var_359_1] ~= nil then
			arg_359_1.duration_ = var_359_0[var_359_1]
		end

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play120011090(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = arg_359_1.actors_["1084ui_story"].transform
			local var_362_1 = 0

			if var_362_1 < arg_359_1.time_ and arg_359_1.time_ <= var_362_1 + arg_362_0 then
				arg_359_1.var_.moveOldPos1084ui_story = var_362_0.localPosition
			end

			local var_362_2 = 0.001

			if var_362_1 <= arg_359_1.time_ and arg_359_1.time_ < var_362_1 + var_362_2 then
				local var_362_3 = (arg_359_1.time_ - var_362_1) / var_362_2
				local var_362_4 = Vector3.New(0, -0.97, -6)

				var_362_0.localPosition = Vector3.Lerp(arg_359_1.var_.moveOldPos1084ui_story, var_362_4, var_362_3)

				local var_362_5 = manager.ui.mainCamera.transform.position - var_362_0.position

				var_362_0.forward = Vector3.New(var_362_5.x, var_362_5.y, var_362_5.z)

				local var_362_6 = var_362_0.localEulerAngles

				var_362_6.z = 0
				var_362_6.x = 0
				var_362_0.localEulerAngles = var_362_6
			end

			if arg_359_1.time_ >= var_362_1 + var_362_2 and arg_359_1.time_ < var_362_1 + var_362_2 + arg_362_0 then
				var_362_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_362_7 = manager.ui.mainCamera.transform.position - var_362_0.position

				var_362_0.forward = Vector3.New(var_362_7.x, var_362_7.y, var_362_7.z)

				local var_362_8 = var_362_0.localEulerAngles

				var_362_8.z = 0
				var_362_8.x = 0
				var_362_0.localEulerAngles = var_362_8
			end

			local var_362_9 = arg_359_1.actors_["1084ui_story"]
			local var_362_10 = 0

			if var_362_10 < arg_359_1.time_ and arg_359_1.time_ <= var_362_10 + arg_362_0 and arg_359_1.var_.characterEffect1084ui_story == nil then
				arg_359_1.var_.characterEffect1084ui_story = var_362_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_11 = 0.2

			if var_362_10 <= arg_359_1.time_ and arg_359_1.time_ < var_362_10 + var_362_11 then
				local var_362_12 = (arg_359_1.time_ - var_362_10) / var_362_11

				if arg_359_1.var_.characterEffect1084ui_story then
					arg_359_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_359_1.time_ >= var_362_10 + var_362_11 and arg_359_1.time_ < var_362_10 + var_362_11 + arg_362_0 and arg_359_1.var_.characterEffect1084ui_story then
				arg_359_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_362_13 = 0

			if var_362_13 < arg_359_1.time_ and arg_359_1.time_ <= var_362_13 + arg_362_0 then
				arg_359_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_362_14 = 0

			if var_362_14 < arg_359_1.time_ and arg_359_1.time_ <= var_362_14 + arg_362_0 then
				arg_359_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_1")
			end

			local var_362_15 = 0
			local var_362_16 = 0.45

			if var_362_15 < arg_359_1.time_ and arg_359_1.time_ <= var_362_15 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_17 = arg_359_1:FormatText(StoryNameCfg[6].name)

				arg_359_1.leftNameTxt_.text = var_362_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_18 = arg_359_1:GetWordFromCfg(120011089)
				local var_362_19 = arg_359_1:FormatText(var_362_18.content)

				arg_359_1.text_.text = var_362_19

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_20 = 18
				local var_362_21 = utf8.len(var_362_19)
				local var_362_22 = var_362_20 <= 0 and var_362_16 or var_362_16 * (var_362_21 / var_362_20)

				if var_362_22 > 0 and var_362_16 < var_362_22 then
					arg_359_1.talkMaxDuration = var_362_22

					if var_362_22 + var_362_15 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_22 + var_362_15
					end
				end

				arg_359_1.text_.text = var_362_19
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011089", "story_v_out_120011.awb") ~= 0 then
					local var_362_23 = manager.audio:GetVoiceLength("story_v_out_120011", "120011089", "story_v_out_120011.awb") / 1000

					if var_362_23 + var_362_15 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_23 + var_362_15
					end

					if var_362_18.prefab_name ~= "" and arg_359_1.actors_[var_362_18.prefab_name] ~= nil then
						local var_362_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_359_1.actors_[var_362_18.prefab_name].transform, "story_v_out_120011", "120011089", "story_v_out_120011.awb")

						arg_359_1:RecordAudio("120011089", var_362_24)
						arg_359_1:RecordAudio("120011089", var_362_24)
					else
						arg_359_1:AudioAction("play", "voice", "story_v_out_120011", "120011089", "story_v_out_120011.awb")
					end

					arg_359_1:RecordHistoryTalkVoice("story_v_out_120011", "120011089", "story_v_out_120011.awb")
				end

				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_25 = math.max(var_362_16, arg_359_1.talkMaxDuration)

			if var_362_15 <= arg_359_1.time_ and arg_359_1.time_ < var_362_15 + var_362_25 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_15) / var_362_25

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_15 + var_362_25 and arg_359_1.time_ < var_362_15 + var_362_25 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play120011090 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 120011090
		arg_363_1.duration_ = 7.2

		local var_363_0 = {
			zh = 5.833,
			ja = 7.2
		}
		local var_363_1 = manager.audio:GetLocalizationFlag()

		if var_363_0[var_363_1] ~= nil then
			arg_363_1.duration_ = var_363_0[var_363_1]
		end

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play120011091(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["1084ui_story"].transform
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 then
				arg_363_1.var_.moveOldPos1084ui_story = var_366_0.localPosition
			end

			local var_366_2 = 0.001

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_2 then
				local var_366_3 = (arg_363_1.time_ - var_366_1) / var_366_2
				local var_366_4 = Vector3.New(0, -0.97, -6)

				var_366_0.localPosition = Vector3.Lerp(arg_363_1.var_.moveOldPos1084ui_story, var_366_4, var_366_3)

				local var_366_5 = manager.ui.mainCamera.transform.position - var_366_0.position

				var_366_0.forward = Vector3.New(var_366_5.x, var_366_5.y, var_366_5.z)

				local var_366_6 = var_366_0.localEulerAngles

				var_366_6.z = 0
				var_366_6.x = 0
				var_366_0.localEulerAngles = var_366_6
			end

			if arg_363_1.time_ >= var_366_1 + var_366_2 and arg_363_1.time_ < var_366_1 + var_366_2 + arg_366_0 then
				var_366_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_366_7 = manager.ui.mainCamera.transform.position - var_366_0.position

				var_366_0.forward = Vector3.New(var_366_7.x, var_366_7.y, var_366_7.z)

				local var_366_8 = var_366_0.localEulerAngles

				var_366_8.z = 0
				var_366_8.x = 0
				var_366_0.localEulerAngles = var_366_8
			end

			local var_366_9 = 0

			if var_366_9 < arg_363_1.time_ and arg_363_1.time_ <= var_366_9 + arg_366_0 then
				arg_363_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_366_10 = 0
			local var_366_11 = 0.575

			if var_366_10 < arg_363_1.time_ and arg_363_1.time_ <= var_366_10 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_12 = arg_363_1:FormatText(StoryNameCfg[6].name)

				arg_363_1.leftNameTxt_.text = var_366_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_13 = arg_363_1:GetWordFromCfg(120011090)
				local var_366_14 = arg_363_1:FormatText(var_366_13.content)

				arg_363_1.text_.text = var_366_14

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_15 = 23
				local var_366_16 = utf8.len(var_366_14)
				local var_366_17 = var_366_15 <= 0 and var_366_11 or var_366_11 * (var_366_16 / var_366_15)

				if var_366_17 > 0 and var_366_11 < var_366_17 then
					arg_363_1.talkMaxDuration = var_366_17

					if var_366_17 + var_366_10 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_17 + var_366_10
					end
				end

				arg_363_1.text_.text = var_366_14
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011090", "story_v_out_120011.awb") ~= 0 then
					local var_366_18 = manager.audio:GetVoiceLength("story_v_out_120011", "120011090", "story_v_out_120011.awb") / 1000

					if var_366_18 + var_366_10 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_18 + var_366_10
					end

					if var_366_13.prefab_name ~= "" and arg_363_1.actors_[var_366_13.prefab_name] ~= nil then
						local var_366_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_13.prefab_name].transform, "story_v_out_120011", "120011090", "story_v_out_120011.awb")

						arg_363_1:RecordAudio("120011090", var_366_19)
						arg_363_1:RecordAudio("120011090", var_366_19)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_out_120011", "120011090", "story_v_out_120011.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_out_120011", "120011090", "story_v_out_120011.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_20 = math.max(var_366_11, arg_363_1.talkMaxDuration)

			if var_366_10 <= arg_363_1.time_ and arg_363_1.time_ < var_366_10 + var_366_20 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_10) / var_366_20

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_10 + var_366_20 and arg_363_1.time_ < var_366_10 + var_366_20 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play120011091 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 120011091
		arg_367_1.duration_ = 5

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play120011092(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["1084ui_story"]
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 and arg_367_1.var_.characterEffect1084ui_story == nil then
				arg_367_1.var_.characterEffect1084ui_story = var_370_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_370_2 = 0.2

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_2 then
				local var_370_3 = (arg_367_1.time_ - var_370_1) / var_370_2

				if arg_367_1.var_.characterEffect1084ui_story then
					local var_370_4 = Mathf.Lerp(0, 0.5, var_370_3)

					arg_367_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_367_1.var_.characterEffect1084ui_story.fillRatio = var_370_4
				end
			end

			if arg_367_1.time_ >= var_370_1 + var_370_2 and arg_367_1.time_ < var_370_1 + var_370_2 + arg_370_0 and arg_367_1.var_.characterEffect1084ui_story then
				local var_370_5 = 0.5

				arg_367_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_367_1.var_.characterEffect1084ui_story.fillRatio = var_370_5
			end

			local var_370_6 = 0
			local var_370_7 = 0.775

			if var_370_6 < arg_367_1.time_ and arg_367_1.time_ <= var_370_6 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_8 = arg_367_1:FormatText(StoryNameCfg[7].name)

				arg_367_1.leftNameTxt_.text = var_370_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_9 = arg_367_1:GetWordFromCfg(120011091)
				local var_370_10 = arg_367_1:FormatText(var_370_9.content)

				arg_367_1.text_.text = var_370_10

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_11 = 31
				local var_370_12 = utf8.len(var_370_10)
				local var_370_13 = var_370_11 <= 0 and var_370_7 or var_370_7 * (var_370_12 / var_370_11)

				if var_370_13 > 0 and var_370_7 < var_370_13 then
					arg_367_1.talkMaxDuration = var_370_13

					if var_370_13 + var_370_6 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_13 + var_370_6
					end
				end

				arg_367_1.text_.text = var_370_10
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)
				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_14 = math.max(var_370_7, arg_367_1.talkMaxDuration)

			if var_370_6 <= arg_367_1.time_ and arg_367_1.time_ < var_370_6 + var_370_14 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_6) / var_370_14

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_6 + var_370_14 and arg_367_1.time_ < var_370_6 + var_370_14 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play120011092 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 120011092
		arg_371_1.duration_ = 5

		SetActive(arg_371_1.tipsGo_, false)

		function arg_371_1.onSingleLineFinish_()
			arg_371_1.onSingleLineUpdate_ = nil
			arg_371_1.onSingleLineFinish_ = nil
			arg_371_1.state_ = "waiting"
		end

		function arg_371_1.playNext_(arg_373_0)
			if arg_373_0 == 1 then
				arg_371_0:Play120011093(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = arg_371_1.actors_["1084ui_story"].transform
			local var_374_1 = 0

			if var_374_1 < arg_371_1.time_ and arg_371_1.time_ <= var_374_1 + arg_374_0 then
				arg_371_1.var_.moveOldPos1084ui_story = var_374_0.localPosition
			end

			local var_374_2 = 0.001

			if var_374_1 <= arg_371_1.time_ and arg_371_1.time_ < var_374_1 + var_374_2 then
				local var_374_3 = (arg_371_1.time_ - var_374_1) / var_374_2
				local var_374_4 = Vector3.New(0, 100, 0)

				var_374_0.localPosition = Vector3.Lerp(arg_371_1.var_.moveOldPos1084ui_story, var_374_4, var_374_3)

				local var_374_5 = manager.ui.mainCamera.transform.position - var_374_0.position

				var_374_0.forward = Vector3.New(var_374_5.x, var_374_5.y, var_374_5.z)

				local var_374_6 = var_374_0.localEulerAngles

				var_374_6.z = 0
				var_374_6.x = 0
				var_374_0.localEulerAngles = var_374_6
			end

			if arg_371_1.time_ >= var_374_1 + var_374_2 and arg_371_1.time_ < var_374_1 + var_374_2 + arg_374_0 then
				var_374_0.localPosition = Vector3.New(0, 100, 0)

				local var_374_7 = manager.ui.mainCamera.transform.position - var_374_0.position

				var_374_0.forward = Vector3.New(var_374_7.x, var_374_7.y, var_374_7.z)

				local var_374_8 = var_374_0.localEulerAngles

				var_374_8.z = 0
				var_374_8.x = 0
				var_374_0.localEulerAngles = var_374_8
			end

			local var_374_9 = 0
			local var_374_10 = 1.425

			if var_374_9 < arg_371_1.time_ and arg_371_1.time_ <= var_374_9 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, false)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_11 = arg_371_1:GetWordFromCfg(120011092)
				local var_374_12 = arg_371_1:FormatText(var_374_11.content)

				arg_371_1.text_.text = var_374_12

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_13 = 57
				local var_374_14 = utf8.len(var_374_12)
				local var_374_15 = var_374_13 <= 0 and var_374_10 or var_374_10 * (var_374_14 / var_374_13)

				if var_374_15 > 0 and var_374_10 < var_374_15 then
					arg_371_1.talkMaxDuration = var_374_15

					if var_374_15 + var_374_9 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_15 + var_374_9
					end
				end

				arg_371_1.text_.text = var_374_12
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)
				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_16 = math.max(var_374_10, arg_371_1.talkMaxDuration)

			if var_374_9 <= arg_371_1.time_ and arg_371_1.time_ < var_374_9 + var_374_16 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_9) / var_374_16

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_9 + var_374_16 and arg_371_1.time_ < var_374_9 + var_374_16 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play120011093 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 120011093
		arg_375_1.duration_ = 6.9

		local var_375_0 = {
			zh = 5.366,
			ja = 6.9
		}
		local var_375_1 = manager.audio:GetLocalizationFlag()

		if var_375_0[var_375_1] ~= nil then
			arg_375_1.duration_ = var_375_0[var_375_1]
		end

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play120011094(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = arg_375_1.actors_["1084ui_story"].transform
			local var_378_1 = 0

			if var_378_1 < arg_375_1.time_ and arg_375_1.time_ <= var_378_1 + arg_378_0 then
				arg_375_1.var_.moveOldPos1084ui_story = var_378_0.localPosition
			end

			local var_378_2 = 0.001

			if var_378_1 <= arg_375_1.time_ and arg_375_1.time_ < var_378_1 + var_378_2 then
				local var_378_3 = (arg_375_1.time_ - var_378_1) / var_378_2
				local var_378_4 = Vector3.New(0, -0.97, -6)

				var_378_0.localPosition = Vector3.Lerp(arg_375_1.var_.moveOldPos1084ui_story, var_378_4, var_378_3)

				local var_378_5 = manager.ui.mainCamera.transform.position - var_378_0.position

				var_378_0.forward = Vector3.New(var_378_5.x, var_378_5.y, var_378_5.z)

				local var_378_6 = var_378_0.localEulerAngles

				var_378_6.z = 0
				var_378_6.x = 0
				var_378_0.localEulerAngles = var_378_6
			end

			if arg_375_1.time_ >= var_378_1 + var_378_2 and arg_375_1.time_ < var_378_1 + var_378_2 + arg_378_0 then
				var_378_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_378_7 = manager.ui.mainCamera.transform.position - var_378_0.position

				var_378_0.forward = Vector3.New(var_378_7.x, var_378_7.y, var_378_7.z)

				local var_378_8 = var_378_0.localEulerAngles

				var_378_8.z = 0
				var_378_8.x = 0
				var_378_0.localEulerAngles = var_378_8
			end

			local var_378_9 = arg_375_1.actors_["1084ui_story"]
			local var_378_10 = 0

			if var_378_10 < arg_375_1.time_ and arg_375_1.time_ <= var_378_10 + arg_378_0 and arg_375_1.var_.characterEffect1084ui_story == nil then
				arg_375_1.var_.characterEffect1084ui_story = var_378_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_378_11 = 0.2

			if var_378_10 <= arg_375_1.time_ and arg_375_1.time_ < var_378_10 + var_378_11 then
				local var_378_12 = (arg_375_1.time_ - var_378_10) / var_378_11

				if arg_375_1.var_.characterEffect1084ui_story then
					arg_375_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_375_1.time_ >= var_378_10 + var_378_11 and arg_375_1.time_ < var_378_10 + var_378_11 + arg_378_0 and arg_375_1.var_.characterEffect1084ui_story then
				arg_375_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_378_13 = 0

			if var_378_13 < arg_375_1.time_ and arg_375_1.time_ <= var_378_13 + arg_378_0 then
				arg_375_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_378_14 = 0

			if var_378_14 < arg_375_1.time_ and arg_375_1.time_ <= var_378_14 + arg_378_0 then
				arg_375_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_378_15 = 0
			local var_378_16 = 0.65

			if var_378_15 < arg_375_1.time_ and arg_375_1.time_ <= var_378_15 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_17 = arg_375_1:FormatText(StoryNameCfg[6].name)

				arg_375_1.leftNameTxt_.text = var_378_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_18 = arg_375_1:GetWordFromCfg(120011093)
				local var_378_19 = arg_375_1:FormatText(var_378_18.content)

				arg_375_1.text_.text = var_378_19

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_20 = 26
				local var_378_21 = utf8.len(var_378_19)
				local var_378_22 = var_378_20 <= 0 and var_378_16 or var_378_16 * (var_378_21 / var_378_20)

				if var_378_22 > 0 and var_378_16 < var_378_22 then
					arg_375_1.talkMaxDuration = var_378_22

					if var_378_22 + var_378_15 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_22 + var_378_15
					end
				end

				arg_375_1.text_.text = var_378_19
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011093", "story_v_out_120011.awb") ~= 0 then
					local var_378_23 = manager.audio:GetVoiceLength("story_v_out_120011", "120011093", "story_v_out_120011.awb") / 1000

					if var_378_23 + var_378_15 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_23 + var_378_15
					end

					if var_378_18.prefab_name ~= "" and arg_375_1.actors_[var_378_18.prefab_name] ~= nil then
						local var_378_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_18.prefab_name].transform, "story_v_out_120011", "120011093", "story_v_out_120011.awb")

						arg_375_1:RecordAudio("120011093", var_378_24)
						arg_375_1:RecordAudio("120011093", var_378_24)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_out_120011", "120011093", "story_v_out_120011.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_out_120011", "120011093", "story_v_out_120011.awb")
				end

				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_25 = math.max(var_378_16, arg_375_1.talkMaxDuration)

			if var_378_15 <= arg_375_1.time_ and arg_375_1.time_ < var_378_15 + var_378_25 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_15) / var_378_25

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_15 + var_378_25 and arg_375_1.time_ < var_378_15 + var_378_25 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play120011094 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 120011094
		arg_379_1.duration_ = 5

		SetActive(arg_379_1.tipsGo_, false)

		function arg_379_1.onSingleLineFinish_()
			arg_379_1.onSingleLineUpdate_ = nil
			arg_379_1.onSingleLineFinish_ = nil
			arg_379_1.state_ = "waiting"
		end

		function arg_379_1.playNext_(arg_381_0)
			if arg_381_0 == 1 then
				arg_379_0:Play120011095(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = arg_379_1.actors_["1084ui_story"]
			local var_382_1 = 0

			if var_382_1 < arg_379_1.time_ and arg_379_1.time_ <= var_382_1 + arg_382_0 and arg_379_1.var_.characterEffect1084ui_story == nil then
				arg_379_1.var_.characterEffect1084ui_story = var_382_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_382_2 = 0.2

			if var_382_1 <= arg_379_1.time_ and arg_379_1.time_ < var_382_1 + var_382_2 then
				local var_382_3 = (arg_379_1.time_ - var_382_1) / var_382_2

				if arg_379_1.var_.characterEffect1084ui_story then
					local var_382_4 = Mathf.Lerp(0, 0.5, var_382_3)

					arg_379_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_379_1.var_.characterEffect1084ui_story.fillRatio = var_382_4
				end
			end

			if arg_379_1.time_ >= var_382_1 + var_382_2 and arg_379_1.time_ < var_382_1 + var_382_2 + arg_382_0 and arg_379_1.var_.characterEffect1084ui_story then
				local var_382_5 = 0.5

				arg_379_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_379_1.var_.characterEffect1084ui_story.fillRatio = var_382_5
			end

			local var_382_6 = 0
			local var_382_7 = 0.8

			if var_382_6 < arg_379_1.time_ and arg_379_1.time_ <= var_382_6 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, true)

				local var_382_8 = arg_379_1:FormatText(StoryNameCfg[7].name)

				arg_379_1.leftNameTxt_.text = var_382_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_379_1.leftNameTxt_.transform)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1.leftNameTxt_.text)
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_9 = arg_379_1:GetWordFromCfg(120011094)
				local var_382_10 = arg_379_1:FormatText(var_382_9.content)

				arg_379_1.text_.text = var_382_10

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_11 = 32
				local var_382_12 = utf8.len(var_382_10)
				local var_382_13 = var_382_11 <= 0 and var_382_7 or var_382_7 * (var_382_12 / var_382_11)

				if var_382_13 > 0 and var_382_7 < var_382_13 then
					arg_379_1.talkMaxDuration = var_382_13

					if var_382_13 + var_382_6 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_13 + var_382_6
					end
				end

				arg_379_1.text_.text = var_382_10
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)
				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_14 = math.max(var_382_7, arg_379_1.talkMaxDuration)

			if var_382_6 <= arg_379_1.time_ and arg_379_1.time_ < var_382_6 + var_382_14 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_6) / var_382_14

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_6 + var_382_14 and arg_379_1.time_ < var_382_6 + var_382_14 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play120011095 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 120011095
		arg_383_1.duration_ = 10.233

		local var_383_0 = {
			zh = 10.233,
			ja = 9.7
		}
		local var_383_1 = manager.audio:GetLocalizationFlag()

		if var_383_0[var_383_1] ~= nil then
			arg_383_1.duration_ = var_383_0[var_383_1]
		end

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play120011096(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = arg_383_1.actors_["1084ui_story"]
			local var_386_1 = 0

			if var_386_1 < arg_383_1.time_ and arg_383_1.time_ <= var_386_1 + arg_386_0 and arg_383_1.var_.characterEffect1084ui_story == nil then
				arg_383_1.var_.characterEffect1084ui_story = var_386_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_386_2 = 0.2

			if var_386_1 <= arg_383_1.time_ and arg_383_1.time_ < var_386_1 + var_386_2 then
				local var_386_3 = (arg_383_1.time_ - var_386_1) / var_386_2

				if arg_383_1.var_.characterEffect1084ui_story then
					arg_383_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_383_1.time_ >= var_386_1 + var_386_2 and arg_383_1.time_ < var_386_1 + var_386_2 + arg_386_0 and arg_383_1.var_.characterEffect1084ui_story then
				arg_383_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_386_4 = 0

			if var_386_4 < arg_383_1.time_ and arg_383_1.time_ <= var_386_4 + arg_386_0 then
				arg_383_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_386_5 = 0
			local var_386_6 = 1.05

			if var_386_5 < arg_383_1.time_ and arg_383_1.time_ <= var_386_5 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, true)

				local var_386_7 = arg_383_1:FormatText(StoryNameCfg[6].name)

				arg_383_1.leftNameTxt_.text = var_386_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_383_1.leftNameTxt_.transform)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1.leftNameTxt_.text)
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_8 = arg_383_1:GetWordFromCfg(120011095)
				local var_386_9 = arg_383_1:FormatText(var_386_8.content)

				arg_383_1.text_.text = var_386_9

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_10 = 42
				local var_386_11 = utf8.len(var_386_9)
				local var_386_12 = var_386_10 <= 0 and var_386_6 or var_386_6 * (var_386_11 / var_386_10)

				if var_386_12 > 0 and var_386_6 < var_386_12 then
					arg_383_1.talkMaxDuration = var_386_12

					if var_386_12 + var_386_5 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_12 + var_386_5
					end
				end

				arg_383_1.text_.text = var_386_9
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011095", "story_v_out_120011.awb") ~= 0 then
					local var_386_13 = manager.audio:GetVoiceLength("story_v_out_120011", "120011095", "story_v_out_120011.awb") / 1000

					if var_386_13 + var_386_5 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_13 + var_386_5
					end

					if var_386_8.prefab_name ~= "" and arg_383_1.actors_[var_386_8.prefab_name] ~= nil then
						local var_386_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_383_1.actors_[var_386_8.prefab_name].transform, "story_v_out_120011", "120011095", "story_v_out_120011.awb")

						arg_383_1:RecordAudio("120011095", var_386_14)
						arg_383_1:RecordAudio("120011095", var_386_14)
					else
						arg_383_1:AudioAction("play", "voice", "story_v_out_120011", "120011095", "story_v_out_120011.awb")
					end

					arg_383_1:RecordHistoryTalkVoice("story_v_out_120011", "120011095", "story_v_out_120011.awb")
				end

				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_15 = math.max(var_386_6, arg_383_1.talkMaxDuration)

			if var_386_5 <= arg_383_1.time_ and arg_383_1.time_ < var_386_5 + var_386_15 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_5) / var_386_15

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_5 + var_386_15 and arg_383_1.time_ < var_386_5 + var_386_15 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play120011096 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 120011096
		arg_387_1.duration_ = 10.566

		local var_387_0 = {
			zh = 7,
			ja = 10.566
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
				arg_387_0:Play120011097(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = arg_387_1.actors_["1084ui_story"].transform
			local var_390_1 = 0

			if var_390_1 < arg_387_1.time_ and arg_387_1.time_ <= var_390_1 + arg_390_0 then
				arg_387_1.var_.moveOldPos1084ui_story = var_390_0.localPosition
			end

			local var_390_2 = 0.001

			if var_390_1 <= arg_387_1.time_ and arg_387_1.time_ < var_390_1 + var_390_2 then
				local var_390_3 = (arg_387_1.time_ - var_390_1) / var_390_2
				local var_390_4 = Vector3.New(0, -0.97, -6)

				var_390_0.localPosition = Vector3.Lerp(arg_387_1.var_.moveOldPos1084ui_story, var_390_4, var_390_3)

				local var_390_5 = manager.ui.mainCamera.transform.position - var_390_0.position

				var_390_0.forward = Vector3.New(var_390_5.x, var_390_5.y, var_390_5.z)

				local var_390_6 = var_390_0.localEulerAngles

				var_390_6.z = 0
				var_390_6.x = 0
				var_390_0.localEulerAngles = var_390_6
			end

			if arg_387_1.time_ >= var_390_1 + var_390_2 and arg_387_1.time_ < var_390_1 + var_390_2 + arg_390_0 then
				var_390_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_390_7 = manager.ui.mainCamera.transform.position - var_390_0.position

				var_390_0.forward = Vector3.New(var_390_7.x, var_390_7.y, var_390_7.z)

				local var_390_8 = var_390_0.localEulerAngles

				var_390_8.z = 0
				var_390_8.x = 0
				var_390_0.localEulerAngles = var_390_8
			end

			local var_390_9 = 0

			if var_390_9 < arg_387_1.time_ and arg_387_1.time_ <= var_390_9 + arg_390_0 then
				arg_387_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_390_10 = 0

			if var_390_10 < arg_387_1.time_ and arg_387_1.time_ <= var_390_10 + arg_390_0 then
				arg_387_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action467")
			end

			local var_390_11 = 0
			local var_390_12 = 0.7

			if var_390_11 < arg_387_1.time_ and arg_387_1.time_ <= var_390_11 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_13 = arg_387_1:FormatText(StoryNameCfg[6].name)

				arg_387_1.leftNameTxt_.text = var_390_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_14 = arg_387_1:GetWordFromCfg(120011096)
				local var_390_15 = arg_387_1:FormatText(var_390_14.content)

				arg_387_1.text_.text = var_390_15

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_16 = 28
				local var_390_17 = utf8.len(var_390_15)
				local var_390_18 = var_390_16 <= 0 and var_390_12 or var_390_12 * (var_390_17 / var_390_16)

				if var_390_18 > 0 and var_390_12 < var_390_18 then
					arg_387_1.talkMaxDuration = var_390_18

					if var_390_18 + var_390_11 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_18 + var_390_11
					end
				end

				arg_387_1.text_.text = var_390_15
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011096", "story_v_out_120011.awb") ~= 0 then
					local var_390_19 = manager.audio:GetVoiceLength("story_v_out_120011", "120011096", "story_v_out_120011.awb") / 1000

					if var_390_19 + var_390_11 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_19 + var_390_11
					end

					if var_390_14.prefab_name ~= "" and arg_387_1.actors_[var_390_14.prefab_name] ~= nil then
						local var_390_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_387_1.actors_[var_390_14.prefab_name].transform, "story_v_out_120011", "120011096", "story_v_out_120011.awb")

						arg_387_1:RecordAudio("120011096", var_390_20)
						arg_387_1:RecordAudio("120011096", var_390_20)
					else
						arg_387_1:AudioAction("play", "voice", "story_v_out_120011", "120011096", "story_v_out_120011.awb")
					end

					arg_387_1:RecordHistoryTalkVoice("story_v_out_120011", "120011096", "story_v_out_120011.awb")
				end

				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_21 = math.max(var_390_12, arg_387_1.talkMaxDuration)

			if var_390_11 <= arg_387_1.time_ and arg_387_1.time_ < var_390_11 + var_390_21 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_11) / var_390_21

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_11 + var_390_21 and arg_387_1.time_ < var_390_11 + var_390_21 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play120011097 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 120011097
		arg_391_1.duration_ = 5

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play120011098(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = arg_391_1.actors_["1084ui_story"]
			local var_394_1 = 0

			if var_394_1 < arg_391_1.time_ and arg_391_1.time_ <= var_394_1 + arg_394_0 and arg_391_1.var_.characterEffect1084ui_story == nil then
				arg_391_1.var_.characterEffect1084ui_story = var_394_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_394_2 = 0.2

			if var_394_1 <= arg_391_1.time_ and arg_391_1.time_ < var_394_1 + var_394_2 then
				local var_394_3 = (arg_391_1.time_ - var_394_1) / var_394_2

				if arg_391_1.var_.characterEffect1084ui_story then
					local var_394_4 = Mathf.Lerp(0, 0.5, var_394_3)

					arg_391_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_391_1.var_.characterEffect1084ui_story.fillRatio = var_394_4
				end
			end

			if arg_391_1.time_ >= var_394_1 + var_394_2 and arg_391_1.time_ < var_394_1 + var_394_2 + arg_394_0 and arg_391_1.var_.characterEffect1084ui_story then
				local var_394_5 = 0.5

				arg_391_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_391_1.var_.characterEffect1084ui_story.fillRatio = var_394_5
			end

			local var_394_6 = 0
			local var_394_7 = 0.5

			if var_394_6 < arg_391_1.time_ and arg_391_1.time_ <= var_394_6 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, true)

				local var_394_8 = arg_391_1:FormatText(StoryNameCfg[7].name)

				arg_391_1.leftNameTxt_.text = var_394_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_391_1.leftNameTxt_.transform)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1.leftNameTxt_.text)
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_9 = arg_391_1:GetWordFromCfg(120011097)
				local var_394_10 = arg_391_1:FormatText(var_394_9.content)

				arg_391_1.text_.text = var_394_10

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_11 = 20
				local var_394_12 = utf8.len(var_394_10)
				local var_394_13 = var_394_11 <= 0 and var_394_7 or var_394_7 * (var_394_12 / var_394_11)

				if var_394_13 > 0 and var_394_7 < var_394_13 then
					arg_391_1.talkMaxDuration = var_394_13

					if var_394_13 + var_394_6 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_13 + var_394_6
					end
				end

				arg_391_1.text_.text = var_394_10
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)
				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_14 = math.max(var_394_7, arg_391_1.talkMaxDuration)

			if var_394_6 <= arg_391_1.time_ and arg_391_1.time_ < var_394_6 + var_394_14 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_6) / var_394_14

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_6 + var_394_14 and arg_391_1.time_ < var_394_6 + var_394_14 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play120011098 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 120011098
		arg_395_1.duration_ = 5

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play120011099(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = 0
			local var_398_1 = 0.925

			if var_398_0 < arg_395_1.time_ and arg_395_1.time_ <= var_398_0 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, true)

				local var_398_2 = arg_395_1:FormatText(StoryNameCfg[7].name)

				arg_395_1.leftNameTxt_.text = var_398_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_395_1.leftNameTxt_.transform)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1.leftNameTxt_.text)
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_3 = arg_395_1:GetWordFromCfg(120011098)
				local var_398_4 = arg_395_1:FormatText(var_398_3.content)

				arg_395_1.text_.text = var_398_4

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_5 = 37
				local var_398_6 = utf8.len(var_398_4)
				local var_398_7 = var_398_5 <= 0 and var_398_1 or var_398_1 * (var_398_6 / var_398_5)

				if var_398_7 > 0 and var_398_1 < var_398_7 then
					arg_395_1.talkMaxDuration = var_398_7

					if var_398_7 + var_398_0 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_7 + var_398_0
					end
				end

				arg_395_1.text_.text = var_398_4
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)
				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_8 = math.max(var_398_1, arg_395_1.talkMaxDuration)

			if var_398_0 <= arg_395_1.time_ and arg_395_1.time_ < var_398_0 + var_398_8 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_0) / var_398_8

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_0 + var_398_8 and arg_395_1.time_ < var_398_0 + var_398_8 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play120011099 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 120011099
		arg_399_1.duration_ = 9.733

		local var_399_0 = {
			zh = 3.7,
			ja = 9.733
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
				arg_399_0:Play120011100(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = arg_399_1.actors_["1084ui_story"].transform
			local var_402_1 = 0

			if var_402_1 < arg_399_1.time_ and arg_399_1.time_ <= var_402_1 + arg_402_0 then
				arg_399_1.var_.moveOldPos1084ui_story = var_402_0.localPosition
			end

			local var_402_2 = 0.001

			if var_402_1 <= arg_399_1.time_ and arg_399_1.time_ < var_402_1 + var_402_2 then
				local var_402_3 = (arg_399_1.time_ - var_402_1) / var_402_2
				local var_402_4 = Vector3.New(0, -0.97, -6)

				var_402_0.localPosition = Vector3.Lerp(arg_399_1.var_.moveOldPos1084ui_story, var_402_4, var_402_3)

				local var_402_5 = manager.ui.mainCamera.transform.position - var_402_0.position

				var_402_0.forward = Vector3.New(var_402_5.x, var_402_5.y, var_402_5.z)

				local var_402_6 = var_402_0.localEulerAngles

				var_402_6.z = 0
				var_402_6.x = 0
				var_402_0.localEulerAngles = var_402_6
			end

			if arg_399_1.time_ >= var_402_1 + var_402_2 and arg_399_1.time_ < var_402_1 + var_402_2 + arg_402_0 then
				var_402_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_402_7 = manager.ui.mainCamera.transform.position - var_402_0.position

				var_402_0.forward = Vector3.New(var_402_7.x, var_402_7.y, var_402_7.z)

				local var_402_8 = var_402_0.localEulerAngles

				var_402_8.z = 0
				var_402_8.x = 0
				var_402_0.localEulerAngles = var_402_8
			end

			local var_402_9 = arg_399_1.actors_["1084ui_story"]
			local var_402_10 = 0

			if var_402_10 < arg_399_1.time_ and arg_399_1.time_ <= var_402_10 + arg_402_0 and arg_399_1.var_.characterEffect1084ui_story == nil then
				arg_399_1.var_.characterEffect1084ui_story = var_402_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_402_11 = 0.2

			if var_402_10 <= arg_399_1.time_ and arg_399_1.time_ < var_402_10 + var_402_11 then
				local var_402_12 = (arg_399_1.time_ - var_402_10) / var_402_11

				if arg_399_1.var_.characterEffect1084ui_story then
					arg_399_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_399_1.time_ >= var_402_10 + var_402_11 and arg_399_1.time_ < var_402_10 + var_402_11 + arg_402_0 and arg_399_1.var_.characterEffect1084ui_story then
				arg_399_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_402_13 = 0

			if var_402_13 < arg_399_1.time_ and arg_399_1.time_ <= var_402_13 + arg_402_0 then
				arg_399_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_402_14 = 0

			if var_402_14 < arg_399_1.time_ and arg_399_1.time_ <= var_402_14 + arg_402_0 then
				arg_399_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action472")
			end

			local var_402_15 = 0
			local var_402_16 = 0.4

			if var_402_15 < arg_399_1.time_ and arg_399_1.time_ <= var_402_15 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, true)

				local var_402_17 = arg_399_1:FormatText(StoryNameCfg[6].name)

				arg_399_1.leftNameTxt_.text = var_402_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_399_1.leftNameTxt_.transform)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1.leftNameTxt_.text)
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_18 = arg_399_1:GetWordFromCfg(120011099)
				local var_402_19 = arg_399_1:FormatText(var_402_18.content)

				arg_399_1.text_.text = var_402_19

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_20 = 16
				local var_402_21 = utf8.len(var_402_19)
				local var_402_22 = var_402_20 <= 0 and var_402_16 or var_402_16 * (var_402_21 / var_402_20)

				if var_402_22 > 0 and var_402_16 < var_402_22 then
					arg_399_1.talkMaxDuration = var_402_22

					if var_402_22 + var_402_15 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_22 + var_402_15
					end
				end

				arg_399_1.text_.text = var_402_19
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011099", "story_v_out_120011.awb") ~= 0 then
					local var_402_23 = manager.audio:GetVoiceLength("story_v_out_120011", "120011099", "story_v_out_120011.awb") / 1000

					if var_402_23 + var_402_15 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_23 + var_402_15
					end

					if var_402_18.prefab_name ~= "" and arg_399_1.actors_[var_402_18.prefab_name] ~= nil then
						local var_402_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_399_1.actors_[var_402_18.prefab_name].transform, "story_v_out_120011", "120011099", "story_v_out_120011.awb")

						arg_399_1:RecordAudio("120011099", var_402_24)
						arg_399_1:RecordAudio("120011099", var_402_24)
					else
						arg_399_1:AudioAction("play", "voice", "story_v_out_120011", "120011099", "story_v_out_120011.awb")
					end

					arg_399_1:RecordHistoryTalkVoice("story_v_out_120011", "120011099", "story_v_out_120011.awb")
				end

				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_25 = math.max(var_402_16, arg_399_1.talkMaxDuration)

			if var_402_15 <= arg_399_1.time_ and arg_399_1.time_ < var_402_15 + var_402_25 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_15) / var_402_25

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_15 + var_402_25 and arg_399_1.time_ < var_402_15 + var_402_25 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play120011100 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 120011100
		arg_403_1.duration_ = 5

		SetActive(arg_403_1.tipsGo_, false)

		function arg_403_1.onSingleLineFinish_()
			arg_403_1.onSingleLineUpdate_ = nil
			arg_403_1.onSingleLineFinish_ = nil
			arg_403_1.state_ = "waiting"
		end

		function arg_403_1.playNext_(arg_405_0)
			if arg_405_0 == 1 then
				arg_403_0:Play120011101(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = arg_403_1.actors_["1084ui_story"]
			local var_406_1 = 0

			if var_406_1 < arg_403_1.time_ and arg_403_1.time_ <= var_406_1 + arg_406_0 and arg_403_1.var_.characterEffect1084ui_story == nil then
				arg_403_1.var_.characterEffect1084ui_story = var_406_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_406_2 = 0.2

			if var_406_1 <= arg_403_1.time_ and arg_403_1.time_ < var_406_1 + var_406_2 then
				local var_406_3 = (arg_403_1.time_ - var_406_1) / var_406_2

				if arg_403_1.var_.characterEffect1084ui_story then
					local var_406_4 = Mathf.Lerp(0, 0.5, var_406_3)

					arg_403_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_403_1.var_.characterEffect1084ui_story.fillRatio = var_406_4
				end
			end

			if arg_403_1.time_ >= var_406_1 + var_406_2 and arg_403_1.time_ < var_406_1 + var_406_2 + arg_406_0 and arg_403_1.var_.characterEffect1084ui_story then
				local var_406_5 = 0.5

				arg_403_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_403_1.var_.characterEffect1084ui_story.fillRatio = var_406_5
			end

			local var_406_6 = 0

			if var_406_6 < arg_403_1.time_ and arg_403_1.time_ <= var_406_6 + arg_406_0 then
				arg_403_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_406_7 = 0
			local var_406_8 = 0.25

			if var_406_7 < arg_403_1.time_ and arg_403_1.time_ <= var_406_7 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, true)

				local var_406_9 = arg_403_1:FormatText(StoryNameCfg[7].name)

				arg_403_1.leftNameTxt_.text = var_406_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_403_1.leftNameTxt_.transform)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1.leftNameTxt_.text)
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_10 = arg_403_1:GetWordFromCfg(120011100)
				local var_406_11 = arg_403_1:FormatText(var_406_10.content)

				arg_403_1.text_.text = var_406_11

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_12 = 10
				local var_406_13 = utf8.len(var_406_11)
				local var_406_14 = var_406_12 <= 0 and var_406_8 or var_406_8 * (var_406_13 / var_406_12)

				if var_406_14 > 0 and var_406_8 < var_406_14 then
					arg_403_1.talkMaxDuration = var_406_14

					if var_406_14 + var_406_7 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_14 + var_406_7
					end
				end

				arg_403_1.text_.text = var_406_11
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)
				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_15 = math.max(var_406_8, arg_403_1.talkMaxDuration)

			if var_406_7 <= arg_403_1.time_ and arg_403_1.time_ < var_406_7 + var_406_15 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_7) / var_406_15

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_7 + var_406_15 and arg_403_1.time_ < var_406_7 + var_406_15 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play120011101 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 120011101
		arg_407_1.duration_ = 5

		SetActive(arg_407_1.tipsGo_, false)

		function arg_407_1.onSingleLineFinish_()
			arg_407_1.onSingleLineUpdate_ = nil
			arg_407_1.onSingleLineFinish_ = nil
			arg_407_1.state_ = "waiting"
		end

		function arg_407_1.playNext_(arg_409_0)
			if arg_409_0 == 1 then
				arg_407_0:Play120011102(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = arg_407_1.actors_["1084ui_story"].transform
			local var_410_1 = 0

			if var_410_1 < arg_407_1.time_ and arg_407_1.time_ <= var_410_1 + arg_410_0 then
				arg_407_1.var_.moveOldPos1084ui_story = var_410_0.localPosition
			end

			local var_410_2 = 0.001

			if var_410_1 <= arg_407_1.time_ and arg_407_1.time_ < var_410_1 + var_410_2 then
				local var_410_3 = (arg_407_1.time_ - var_410_1) / var_410_2
				local var_410_4 = Vector3.New(0, 100, 0)

				var_410_0.localPosition = Vector3.Lerp(arg_407_1.var_.moveOldPos1084ui_story, var_410_4, var_410_3)

				local var_410_5 = manager.ui.mainCamera.transform.position - var_410_0.position

				var_410_0.forward = Vector3.New(var_410_5.x, var_410_5.y, var_410_5.z)

				local var_410_6 = var_410_0.localEulerAngles

				var_410_6.z = 0
				var_410_6.x = 0
				var_410_0.localEulerAngles = var_410_6
			end

			if arg_407_1.time_ >= var_410_1 + var_410_2 and arg_407_1.time_ < var_410_1 + var_410_2 + arg_410_0 then
				var_410_0.localPosition = Vector3.New(0, 100, 0)

				local var_410_7 = manager.ui.mainCamera.transform.position - var_410_0.position

				var_410_0.forward = Vector3.New(var_410_7.x, var_410_7.y, var_410_7.z)

				local var_410_8 = var_410_0.localEulerAngles

				var_410_8.z = 0
				var_410_8.x = 0
				var_410_0.localEulerAngles = var_410_8
			end

			local var_410_9 = 0
			local var_410_10 = 0.875

			if var_410_9 < arg_407_1.time_ and arg_407_1.time_ <= var_410_9 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, false)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_407_1.iconTrs_.gameObject, false)
				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_11 = arg_407_1:GetWordFromCfg(120011101)
				local var_410_12 = arg_407_1:FormatText(var_410_11.content)

				arg_407_1.text_.text = var_410_12

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_13 = 35
				local var_410_14 = utf8.len(var_410_12)
				local var_410_15 = var_410_13 <= 0 and var_410_10 or var_410_10 * (var_410_14 / var_410_13)

				if var_410_15 > 0 and var_410_10 < var_410_15 then
					arg_407_1.talkMaxDuration = var_410_15

					if var_410_15 + var_410_9 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_15 + var_410_9
					end
				end

				arg_407_1.text_.text = var_410_12
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)
				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_16 = math.max(var_410_10, arg_407_1.talkMaxDuration)

			if var_410_9 <= arg_407_1.time_ and arg_407_1.time_ < var_410_9 + var_410_16 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_9) / var_410_16

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_9 + var_410_16 and arg_407_1.time_ < var_410_9 + var_410_16 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play120011102 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 120011102
		arg_411_1.duration_ = 5

		SetActive(arg_411_1.tipsGo_, false)

		function arg_411_1.onSingleLineFinish_()
			arg_411_1.onSingleLineUpdate_ = nil
			arg_411_1.onSingleLineFinish_ = nil
			arg_411_1.state_ = "waiting"
		end

		function arg_411_1.playNext_(arg_413_0)
			if arg_413_0 == 1 then
				arg_411_0:Play120011103(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = 0
			local var_414_1 = 1.1

			if var_414_0 < arg_411_1.time_ and arg_411_1.time_ <= var_414_0 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, false)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_2 = arg_411_1:GetWordFromCfg(120011102)
				local var_414_3 = arg_411_1:FormatText(var_414_2.content)

				arg_411_1.text_.text = var_414_3

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_4 = 44
				local var_414_5 = utf8.len(var_414_3)
				local var_414_6 = var_414_4 <= 0 and var_414_1 or var_414_1 * (var_414_5 / var_414_4)

				if var_414_6 > 0 and var_414_1 < var_414_6 then
					arg_411_1.talkMaxDuration = var_414_6

					if var_414_6 + var_414_0 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_6 + var_414_0
					end
				end

				arg_411_1.text_.text = var_414_3
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)
				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_7 = math.max(var_414_1, arg_411_1.talkMaxDuration)

			if var_414_0 <= arg_411_1.time_ and arg_411_1.time_ < var_414_0 + var_414_7 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_0) / var_414_7

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_0 + var_414_7 and arg_411_1.time_ < var_414_0 + var_414_7 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play120011103 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 120011103
		arg_415_1.duration_ = 5

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play120011104(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = "1071ui_story"

			if arg_415_1.actors_[var_418_0] == nil then
				local var_418_1 = Object.Instantiate(Asset.Load("Char/" .. var_418_0), arg_415_1.stage_.transform)

				var_418_1.name = var_418_0
				var_418_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_415_1.actors_[var_418_0] = var_418_1

				local var_418_2 = var_418_1:GetComponentInChildren(typeof(CharacterEffect))

				var_418_2.enabled = true

				local var_418_3 = GameObjectTools.GetOrAddComponent(var_418_1, typeof(DynamicBoneHelper))

				if var_418_3 then
					var_418_3:EnableDynamicBone(false)
				end

				arg_415_1:ShowWeapon(var_418_2.transform, false)

				arg_415_1.var_[var_418_0 .. "Animator"] = var_418_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_415_1.var_[var_418_0 .. "Animator"].applyRootMotion = true
				arg_415_1.var_[var_418_0 .. "LipSync"] = var_418_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_418_4 = 0

			if var_418_4 < arg_415_1.time_ and arg_415_1.time_ <= var_418_4 + arg_418_0 then
				arg_415_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_418_5 = 0
			local var_418_6 = 0.75

			if var_418_5 < arg_415_1.time_ and arg_415_1.time_ <= var_418_5 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0
				arg_415_1.dialogCg_.alpha = 1

				arg_415_1.dialog_:SetActive(true)
				SetActive(arg_415_1.leftNameGo_, false)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_415_1.iconTrs_.gameObject, false)
				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_7 = arg_415_1:GetWordFromCfg(120011103)
				local var_418_8 = arg_415_1:FormatText(var_418_7.content)

				arg_415_1.text_.text = var_418_8

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_9 = 30
				local var_418_10 = utf8.len(var_418_8)
				local var_418_11 = var_418_9 <= 0 and var_418_6 or var_418_6 * (var_418_10 / var_418_9)

				if var_418_11 > 0 and var_418_6 < var_418_11 then
					arg_415_1.talkMaxDuration = var_418_11

					if var_418_11 + var_418_5 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_11 + var_418_5
					end
				end

				arg_415_1.text_.text = var_418_8
				arg_415_1.typewritter.percent = 0

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(false)
				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_12 = math.max(var_418_6, arg_415_1.talkMaxDuration)

			if var_418_5 <= arg_415_1.time_ and arg_415_1.time_ < var_418_5 + var_418_12 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_5) / var_418_12

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_5 + var_418_12 and arg_415_1.time_ < var_418_5 + var_418_12 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play120011104 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 120011104
		arg_419_1.duration_ = 2.733

		local var_419_0 = {
			zh = 1.999999999999,
			ja = 2.733
		}
		local var_419_1 = manager.audio:GetLocalizationFlag()

		if var_419_0[var_419_1] ~= nil then
			arg_419_1.duration_ = var_419_0[var_419_1]
		end

		SetActive(arg_419_1.tipsGo_, false)

		function arg_419_1.onSingleLineFinish_()
			arg_419_1.onSingleLineUpdate_ = nil
			arg_419_1.onSingleLineFinish_ = nil
			arg_419_1.state_ = "waiting"
		end

		function arg_419_1.playNext_(arg_421_0)
			if arg_421_0 == 1 then
				arg_419_0:Play120011105(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = arg_419_1.actors_["1084ui_story"].transform
			local var_422_1 = 0

			if var_422_1 < arg_419_1.time_ and arg_419_1.time_ <= var_422_1 + arg_422_0 then
				arg_419_1.var_.moveOldPos1084ui_story = var_422_0.localPosition
			end

			local var_422_2 = 0.001

			if var_422_1 <= arg_419_1.time_ and arg_419_1.time_ < var_422_1 + var_422_2 then
				local var_422_3 = (arg_419_1.time_ - var_422_1) / var_422_2
				local var_422_4 = Vector3.New(-0.7, -0.97, -6)

				var_422_0.localPosition = Vector3.Lerp(arg_419_1.var_.moveOldPos1084ui_story, var_422_4, var_422_3)

				local var_422_5 = manager.ui.mainCamera.transform.position - var_422_0.position

				var_422_0.forward = Vector3.New(var_422_5.x, var_422_5.y, var_422_5.z)

				local var_422_6 = var_422_0.localEulerAngles

				var_422_6.z = 0
				var_422_6.x = 0
				var_422_0.localEulerAngles = var_422_6
			end

			if arg_419_1.time_ >= var_422_1 + var_422_2 and arg_419_1.time_ < var_422_1 + var_422_2 + arg_422_0 then
				var_422_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_422_7 = manager.ui.mainCamera.transform.position - var_422_0.position

				var_422_0.forward = Vector3.New(var_422_7.x, var_422_7.y, var_422_7.z)

				local var_422_8 = var_422_0.localEulerAngles

				var_422_8.z = 0
				var_422_8.x = 0
				var_422_0.localEulerAngles = var_422_8
			end

			local var_422_9 = arg_419_1.actors_["1071ui_story"].transform
			local var_422_10 = 0

			if var_422_10 < arg_419_1.time_ and arg_419_1.time_ <= var_422_10 + arg_422_0 then
				arg_419_1.var_.moveOldPos1071ui_story = var_422_9.localPosition
			end

			local var_422_11 = 0.001

			if var_422_10 <= arg_419_1.time_ and arg_419_1.time_ < var_422_10 + var_422_11 then
				local var_422_12 = (arg_419_1.time_ - var_422_10) / var_422_11
				local var_422_13 = Vector3.New(0.7, -1.05, -6.2)

				var_422_9.localPosition = Vector3.Lerp(arg_419_1.var_.moveOldPos1071ui_story, var_422_13, var_422_12)

				local var_422_14 = manager.ui.mainCamera.transform.position - var_422_9.position

				var_422_9.forward = Vector3.New(var_422_14.x, var_422_14.y, var_422_14.z)

				local var_422_15 = var_422_9.localEulerAngles

				var_422_15.z = 0
				var_422_15.x = 0
				var_422_9.localEulerAngles = var_422_15
			end

			if arg_419_1.time_ >= var_422_10 + var_422_11 and arg_419_1.time_ < var_422_10 + var_422_11 + arg_422_0 then
				var_422_9.localPosition = Vector3.New(0.7, -1.05, -6.2)

				local var_422_16 = manager.ui.mainCamera.transform.position - var_422_9.position

				var_422_9.forward = Vector3.New(var_422_16.x, var_422_16.y, var_422_16.z)

				local var_422_17 = var_422_9.localEulerAngles

				var_422_17.z = 0
				var_422_17.x = 0
				var_422_9.localEulerAngles = var_422_17
			end

			local var_422_18 = arg_419_1.actors_["1084ui_story"]
			local var_422_19 = 0

			if var_422_19 < arg_419_1.time_ and arg_419_1.time_ <= var_422_19 + arg_422_0 and arg_419_1.var_.characterEffect1084ui_story == nil then
				arg_419_1.var_.characterEffect1084ui_story = var_422_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_422_20 = 0.2

			if var_422_19 <= arg_419_1.time_ and arg_419_1.time_ < var_422_19 + var_422_20 then
				local var_422_21 = (arg_419_1.time_ - var_422_19) / var_422_20

				if arg_419_1.var_.characterEffect1084ui_story then
					arg_419_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_419_1.time_ >= var_422_19 + var_422_20 and arg_419_1.time_ < var_422_19 + var_422_20 + arg_422_0 and arg_419_1.var_.characterEffect1084ui_story then
				arg_419_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_422_22 = 0

			if var_422_22 < arg_419_1.time_ and arg_419_1.time_ <= var_422_22 + arg_422_0 then
				arg_419_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_422_23 = 0

			if var_422_23 < arg_419_1.time_ and arg_419_1.time_ <= var_422_23 + arg_422_0 then
				arg_419_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_422_24 = arg_419_1.actors_["1071ui_story"]
			local var_422_25 = 0

			if var_422_25 < arg_419_1.time_ and arg_419_1.time_ <= var_422_25 + arg_422_0 and arg_419_1.var_.characterEffect1071ui_story == nil then
				arg_419_1.var_.characterEffect1071ui_story = var_422_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_422_26 = 0.2

			if var_422_25 <= arg_419_1.time_ and arg_419_1.time_ < var_422_25 + var_422_26 then
				local var_422_27 = (arg_419_1.time_ - var_422_25) / var_422_26

				if arg_419_1.var_.characterEffect1071ui_story then
					local var_422_28 = Mathf.Lerp(0, 0.5, var_422_27)

					arg_419_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_419_1.var_.characterEffect1071ui_story.fillRatio = var_422_28
				end
			end

			if arg_419_1.time_ >= var_422_25 + var_422_26 and arg_419_1.time_ < var_422_25 + var_422_26 + arg_422_0 and arg_419_1.var_.characterEffect1071ui_story then
				local var_422_29 = 0.5

				arg_419_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_419_1.var_.characterEffect1071ui_story.fillRatio = var_422_29
			end

			local var_422_30 = 0

			if var_422_30 < arg_419_1.time_ and arg_419_1.time_ <= var_422_30 + arg_422_0 then
				arg_419_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_422_31 = 0
			local var_422_32 = 0.225

			if var_422_31 < arg_419_1.time_ and arg_419_1.time_ <= var_422_31 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, true)

				local var_422_33 = arg_419_1:FormatText(StoryNameCfg[6].name)

				arg_419_1.leftNameTxt_.text = var_422_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_419_1.leftNameTxt_.transform)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1.leftNameTxt_.text)
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_34 = arg_419_1:GetWordFromCfg(120011104)
				local var_422_35 = arg_419_1:FormatText(var_422_34.content)

				arg_419_1.text_.text = var_422_35

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_36 = 9
				local var_422_37 = utf8.len(var_422_35)
				local var_422_38 = var_422_36 <= 0 and var_422_32 or var_422_32 * (var_422_37 / var_422_36)

				if var_422_38 > 0 and var_422_32 < var_422_38 then
					arg_419_1.talkMaxDuration = var_422_38

					if var_422_38 + var_422_31 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_38 + var_422_31
					end
				end

				arg_419_1.text_.text = var_422_35
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011104", "story_v_out_120011.awb") ~= 0 then
					local var_422_39 = manager.audio:GetVoiceLength("story_v_out_120011", "120011104", "story_v_out_120011.awb") / 1000

					if var_422_39 + var_422_31 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_39 + var_422_31
					end

					if var_422_34.prefab_name ~= "" and arg_419_1.actors_[var_422_34.prefab_name] ~= nil then
						local var_422_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_419_1.actors_[var_422_34.prefab_name].transform, "story_v_out_120011", "120011104", "story_v_out_120011.awb")

						arg_419_1:RecordAudio("120011104", var_422_40)
						arg_419_1:RecordAudio("120011104", var_422_40)
					else
						arg_419_1:AudioAction("play", "voice", "story_v_out_120011", "120011104", "story_v_out_120011.awb")
					end

					arg_419_1:RecordHistoryTalkVoice("story_v_out_120011", "120011104", "story_v_out_120011.awb")
				end

				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_41 = math.max(var_422_32, arg_419_1.talkMaxDuration)

			if var_422_31 <= arg_419_1.time_ and arg_419_1.time_ < var_422_31 + var_422_41 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_31) / var_422_41

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_31 + var_422_41 and arg_419_1.time_ < var_422_31 + var_422_41 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play120011105 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 120011105
		arg_423_1.duration_ = 7.1

		local var_423_0 = {
			zh = 4.766,
			ja = 7.1
		}
		local var_423_1 = manager.audio:GetLocalizationFlag()

		if var_423_0[var_423_1] ~= nil then
			arg_423_1.duration_ = var_423_0[var_423_1]
		end

		SetActive(arg_423_1.tipsGo_, false)

		function arg_423_1.onSingleLineFinish_()
			arg_423_1.onSingleLineUpdate_ = nil
			arg_423_1.onSingleLineFinish_ = nil
			arg_423_1.state_ = "waiting"
		end

		function arg_423_1.playNext_(arg_425_0)
			if arg_425_0 == 1 then
				arg_423_0:Play120011106(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = arg_423_1.actors_["1084ui_story"]
			local var_426_1 = 0

			if var_426_1 < arg_423_1.time_ and arg_423_1.time_ <= var_426_1 + arg_426_0 and arg_423_1.var_.characterEffect1084ui_story == nil then
				arg_423_1.var_.characterEffect1084ui_story = var_426_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_426_2 = 0.2

			if var_426_1 <= arg_423_1.time_ and arg_423_1.time_ < var_426_1 + var_426_2 then
				local var_426_3 = (arg_423_1.time_ - var_426_1) / var_426_2

				if arg_423_1.var_.characterEffect1084ui_story then
					local var_426_4 = Mathf.Lerp(0, 0.5, var_426_3)

					arg_423_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_423_1.var_.characterEffect1084ui_story.fillRatio = var_426_4
				end
			end

			if arg_423_1.time_ >= var_426_1 + var_426_2 and arg_423_1.time_ < var_426_1 + var_426_2 + arg_426_0 and arg_423_1.var_.characterEffect1084ui_story then
				local var_426_5 = 0.5

				arg_423_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_423_1.var_.characterEffect1084ui_story.fillRatio = var_426_5
			end

			local var_426_6 = arg_423_1.actors_["1071ui_story"]
			local var_426_7 = 0

			if var_426_7 < arg_423_1.time_ and arg_423_1.time_ <= var_426_7 + arg_426_0 and arg_423_1.var_.characterEffect1071ui_story == nil then
				arg_423_1.var_.characterEffect1071ui_story = var_426_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_426_8 = 0.2

			if var_426_7 <= arg_423_1.time_ and arg_423_1.time_ < var_426_7 + var_426_8 then
				local var_426_9 = (arg_423_1.time_ - var_426_7) / var_426_8

				if arg_423_1.var_.characterEffect1071ui_story then
					arg_423_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_423_1.time_ >= var_426_7 + var_426_8 and arg_423_1.time_ < var_426_7 + var_426_8 + arg_426_0 and arg_423_1.var_.characterEffect1071ui_story then
				arg_423_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_426_10 = 0

			if var_426_10 < arg_423_1.time_ and arg_423_1.time_ <= var_426_10 + arg_426_0 then
				arg_423_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_1")
			end

			local var_426_11 = 0
			local var_426_12 = 0.625

			if var_426_11 < arg_423_1.time_ and arg_423_1.time_ <= var_426_11 + arg_426_0 then
				arg_423_1.talkMaxDuration = 0
				arg_423_1.dialogCg_.alpha = 1

				arg_423_1.dialog_:SetActive(true)
				SetActive(arg_423_1.leftNameGo_, true)

				local var_426_13 = arg_423_1:FormatText(StoryNameCfg[376].name)

				arg_423_1.leftNameTxt_.text = var_426_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_423_1.leftNameTxt_.transform)

				arg_423_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_423_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_423_1:RecordName(arg_423_1.leftNameTxt_.text)
				SetActive(arg_423_1.iconTrs_.gameObject, false)
				arg_423_1.callingController_:SetSelectedState("normal")

				local var_426_14 = arg_423_1:GetWordFromCfg(120011105)
				local var_426_15 = arg_423_1:FormatText(var_426_14.content)

				arg_423_1.text_.text = var_426_15

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_16 = 25
				local var_426_17 = utf8.len(var_426_15)
				local var_426_18 = var_426_16 <= 0 and var_426_12 or var_426_12 * (var_426_17 / var_426_16)

				if var_426_18 > 0 and var_426_12 < var_426_18 then
					arg_423_1.talkMaxDuration = var_426_18

					if var_426_18 + var_426_11 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_18 + var_426_11
					end
				end

				arg_423_1.text_.text = var_426_15
				arg_423_1.typewritter.percent = 0

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011105", "story_v_out_120011.awb") ~= 0 then
					local var_426_19 = manager.audio:GetVoiceLength("story_v_out_120011", "120011105", "story_v_out_120011.awb") / 1000

					if var_426_19 + var_426_11 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_19 + var_426_11
					end

					if var_426_14.prefab_name ~= "" and arg_423_1.actors_[var_426_14.prefab_name] ~= nil then
						local var_426_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_423_1.actors_[var_426_14.prefab_name].transform, "story_v_out_120011", "120011105", "story_v_out_120011.awb")

						arg_423_1:RecordAudio("120011105", var_426_20)
						arg_423_1:RecordAudio("120011105", var_426_20)
					else
						arg_423_1:AudioAction("play", "voice", "story_v_out_120011", "120011105", "story_v_out_120011.awb")
					end

					arg_423_1:RecordHistoryTalkVoice("story_v_out_120011", "120011105", "story_v_out_120011.awb")
				end

				arg_423_1:RecordContent(arg_423_1.text_.text)
			end

			local var_426_21 = math.max(var_426_12, arg_423_1.talkMaxDuration)

			if var_426_11 <= arg_423_1.time_ and arg_423_1.time_ < var_426_11 + var_426_21 then
				arg_423_1.typewritter.percent = (arg_423_1.time_ - var_426_11) / var_426_21

				arg_423_1.typewritter:SetDirty()
			end

			if arg_423_1.time_ >= var_426_11 + var_426_21 and arg_423_1.time_ < var_426_11 + var_426_21 + arg_426_0 then
				arg_423_1.typewritter.percent = 1

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(true)
			end
		end
	end,
	Play120011106 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 120011106
		arg_427_1.duration_ = 3.766

		local var_427_0 = {
			zh = 3.766,
			ja = 3.4
		}
		local var_427_1 = manager.audio:GetLocalizationFlag()

		if var_427_0[var_427_1] ~= nil then
			arg_427_1.duration_ = var_427_0[var_427_1]
		end

		SetActive(arg_427_1.tipsGo_, false)

		function arg_427_1.onSingleLineFinish_()
			arg_427_1.onSingleLineUpdate_ = nil
			arg_427_1.onSingleLineFinish_ = nil
			arg_427_1.state_ = "waiting"
		end

		function arg_427_1.playNext_(arg_429_0)
			if arg_429_0 == 1 then
				arg_427_0:Play120011107(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = arg_427_1.actors_["1071ui_story"].transform
			local var_430_1 = 0

			if var_430_1 < arg_427_1.time_ and arg_427_1.time_ <= var_430_1 + arg_430_0 then
				arg_427_1.var_.moveOldPos1071ui_story = var_430_0.localPosition
			end

			local var_430_2 = 0.001

			if var_430_1 <= arg_427_1.time_ and arg_427_1.time_ < var_430_1 + var_430_2 then
				local var_430_3 = (arg_427_1.time_ - var_430_1) / var_430_2
				local var_430_4 = Vector3.New(0.7, -1.05, -6.2)

				var_430_0.localPosition = Vector3.Lerp(arg_427_1.var_.moveOldPos1071ui_story, var_430_4, var_430_3)

				local var_430_5 = manager.ui.mainCamera.transform.position - var_430_0.position

				var_430_0.forward = Vector3.New(var_430_5.x, var_430_5.y, var_430_5.z)

				local var_430_6 = var_430_0.localEulerAngles

				var_430_6.z = 0
				var_430_6.x = 0
				var_430_0.localEulerAngles = var_430_6
			end

			if arg_427_1.time_ >= var_430_1 + var_430_2 and arg_427_1.time_ < var_430_1 + var_430_2 + arg_430_0 then
				var_430_0.localPosition = Vector3.New(0.7, -1.05, -6.2)

				local var_430_7 = manager.ui.mainCamera.transform.position - var_430_0.position

				var_430_0.forward = Vector3.New(var_430_7.x, var_430_7.y, var_430_7.z)

				local var_430_8 = var_430_0.localEulerAngles

				var_430_8.z = 0
				var_430_8.x = 0
				var_430_0.localEulerAngles = var_430_8
			end

			local var_430_9 = 0

			if var_430_9 < arg_427_1.time_ and arg_427_1.time_ <= var_430_9 + arg_430_0 then
				arg_427_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_2")
			end

			local var_430_10 = 0
			local var_430_11 = 0.45

			if var_430_10 < arg_427_1.time_ and arg_427_1.time_ <= var_430_10 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, true)

				local var_430_12 = arg_427_1:FormatText(StoryNameCfg[376].name)

				arg_427_1.leftNameTxt_.text = var_430_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_427_1.leftNameTxt_.transform)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1.leftNameTxt_.text)
				SetActive(arg_427_1.iconTrs_.gameObject, false)
				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_13 = arg_427_1:GetWordFromCfg(120011106)
				local var_430_14 = arg_427_1:FormatText(var_430_13.content)

				arg_427_1.text_.text = var_430_14

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_15 = 18
				local var_430_16 = utf8.len(var_430_14)
				local var_430_17 = var_430_15 <= 0 and var_430_11 or var_430_11 * (var_430_16 / var_430_15)

				if var_430_17 > 0 and var_430_11 < var_430_17 then
					arg_427_1.talkMaxDuration = var_430_17

					if var_430_17 + var_430_10 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_17 + var_430_10
					end
				end

				arg_427_1.text_.text = var_430_14
				arg_427_1.typewritter.percent = 0

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011106", "story_v_out_120011.awb") ~= 0 then
					local var_430_18 = manager.audio:GetVoiceLength("story_v_out_120011", "120011106", "story_v_out_120011.awb") / 1000

					if var_430_18 + var_430_10 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_18 + var_430_10
					end

					if var_430_13.prefab_name ~= "" and arg_427_1.actors_[var_430_13.prefab_name] ~= nil then
						local var_430_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_427_1.actors_[var_430_13.prefab_name].transform, "story_v_out_120011", "120011106", "story_v_out_120011.awb")

						arg_427_1:RecordAudio("120011106", var_430_19)
						arg_427_1:RecordAudio("120011106", var_430_19)
					else
						arg_427_1:AudioAction("play", "voice", "story_v_out_120011", "120011106", "story_v_out_120011.awb")
					end

					arg_427_1:RecordHistoryTalkVoice("story_v_out_120011", "120011106", "story_v_out_120011.awb")
				end

				arg_427_1:RecordContent(arg_427_1.text_.text)
			end

			local var_430_20 = math.max(var_430_11, arg_427_1.talkMaxDuration)

			if var_430_10 <= arg_427_1.time_ and arg_427_1.time_ < var_430_10 + var_430_20 then
				arg_427_1.typewritter.percent = (arg_427_1.time_ - var_430_10) / var_430_20

				arg_427_1.typewritter:SetDirty()
			end

			if arg_427_1.time_ >= var_430_10 + var_430_20 and arg_427_1.time_ < var_430_10 + var_430_20 + arg_430_0 then
				arg_427_1.typewritter.percent = 1

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(true)
			end
		end
	end,
	Play120011107 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 120011107
		arg_431_1.duration_ = 4.066

		local var_431_0 = {
			zh = 2.533,
			ja = 4.066
		}
		local var_431_1 = manager.audio:GetLocalizationFlag()

		if var_431_0[var_431_1] ~= nil then
			arg_431_1.duration_ = var_431_0[var_431_1]
		end

		SetActive(arg_431_1.tipsGo_, false)

		function arg_431_1.onSingleLineFinish_()
			arg_431_1.onSingleLineUpdate_ = nil
			arg_431_1.onSingleLineFinish_ = nil
			arg_431_1.state_ = "waiting"
		end

		function arg_431_1.playNext_(arg_433_0)
			if arg_433_0 == 1 then
				arg_431_0:Play120011108(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = arg_431_1.actors_["1084ui_story"]
			local var_434_1 = 0

			if var_434_1 < arg_431_1.time_ and arg_431_1.time_ <= var_434_1 + arg_434_0 and arg_431_1.var_.characterEffect1084ui_story == nil then
				arg_431_1.var_.characterEffect1084ui_story = var_434_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_2 = 0.2

			if var_434_1 <= arg_431_1.time_ and arg_431_1.time_ < var_434_1 + var_434_2 then
				local var_434_3 = (arg_431_1.time_ - var_434_1) / var_434_2

				if arg_431_1.var_.characterEffect1084ui_story then
					arg_431_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_431_1.time_ >= var_434_1 + var_434_2 and arg_431_1.time_ < var_434_1 + var_434_2 + arg_434_0 and arg_431_1.var_.characterEffect1084ui_story then
				arg_431_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_434_4 = arg_431_1.actors_["1071ui_story"]
			local var_434_5 = 0

			if var_434_5 < arg_431_1.time_ and arg_431_1.time_ <= var_434_5 + arg_434_0 and arg_431_1.var_.characterEffect1071ui_story == nil then
				arg_431_1.var_.characterEffect1071ui_story = var_434_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_6 = 0.2

			if var_434_5 <= arg_431_1.time_ and arg_431_1.time_ < var_434_5 + var_434_6 then
				local var_434_7 = (arg_431_1.time_ - var_434_5) / var_434_6

				if arg_431_1.var_.characterEffect1071ui_story then
					local var_434_8 = Mathf.Lerp(0, 0.5, var_434_7)

					arg_431_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_431_1.var_.characterEffect1071ui_story.fillRatio = var_434_8
				end
			end

			if arg_431_1.time_ >= var_434_5 + var_434_6 and arg_431_1.time_ < var_434_5 + var_434_6 + arg_434_0 and arg_431_1.var_.characterEffect1071ui_story then
				local var_434_9 = 0.5

				arg_431_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_431_1.var_.characterEffect1071ui_story.fillRatio = var_434_9
			end

			local var_434_10 = 0

			if var_434_10 < arg_431_1.time_ and arg_431_1.time_ <= var_434_10 + arg_434_0 then
				arg_431_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_434_11 = 0

			if var_434_11 < arg_431_1.time_ and arg_431_1.time_ <= var_434_11 + arg_434_0 then
				arg_431_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_434_12 = 0
			local var_434_13 = 0.25

			if var_434_12 < arg_431_1.time_ and arg_431_1.time_ <= var_434_12 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, true)

				local var_434_14 = arg_431_1:FormatText(StoryNameCfg[6].name)

				arg_431_1.leftNameTxt_.text = var_434_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_431_1.leftNameTxt_.transform)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1.leftNameTxt_.text)
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_15 = arg_431_1:GetWordFromCfg(120011107)
				local var_434_16 = arg_431_1:FormatText(var_434_15.content)

				arg_431_1.text_.text = var_434_16

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_17 = 10
				local var_434_18 = utf8.len(var_434_16)
				local var_434_19 = var_434_17 <= 0 and var_434_13 or var_434_13 * (var_434_18 / var_434_17)

				if var_434_19 > 0 and var_434_13 < var_434_19 then
					arg_431_1.talkMaxDuration = var_434_19

					if var_434_19 + var_434_12 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_19 + var_434_12
					end
				end

				arg_431_1.text_.text = var_434_16
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011107", "story_v_out_120011.awb") ~= 0 then
					local var_434_20 = manager.audio:GetVoiceLength("story_v_out_120011", "120011107", "story_v_out_120011.awb") / 1000

					if var_434_20 + var_434_12 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_20 + var_434_12
					end

					if var_434_15.prefab_name ~= "" and arg_431_1.actors_[var_434_15.prefab_name] ~= nil then
						local var_434_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_431_1.actors_[var_434_15.prefab_name].transform, "story_v_out_120011", "120011107", "story_v_out_120011.awb")

						arg_431_1:RecordAudio("120011107", var_434_21)
						arg_431_1:RecordAudio("120011107", var_434_21)
					else
						arg_431_1:AudioAction("play", "voice", "story_v_out_120011", "120011107", "story_v_out_120011.awb")
					end

					arg_431_1:RecordHistoryTalkVoice("story_v_out_120011", "120011107", "story_v_out_120011.awb")
				end

				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_22 = math.max(var_434_13, arg_431_1.talkMaxDuration)

			if var_434_12 <= arg_431_1.time_ and arg_431_1.time_ < var_434_12 + var_434_22 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_12) / var_434_22

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_12 + var_434_22 and arg_431_1.time_ < var_434_12 + var_434_22 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play120011108 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 120011108
		arg_435_1.duration_ = 1.6

		local var_435_0 = {
			zh = 1.6,
			ja = 1.4
		}
		local var_435_1 = manager.audio:GetLocalizationFlag()

		if var_435_0[var_435_1] ~= nil then
			arg_435_1.duration_ = var_435_0[var_435_1]
		end

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play120011109(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = arg_435_1.actors_["1071ui_story"].transform
			local var_438_1 = 0

			if var_438_1 < arg_435_1.time_ and arg_435_1.time_ <= var_438_1 + arg_438_0 then
				arg_435_1.var_.moveOldPos1071ui_story = var_438_0.localPosition
			end

			local var_438_2 = 0.001

			if var_438_1 <= arg_435_1.time_ and arg_435_1.time_ < var_438_1 + var_438_2 then
				local var_438_3 = (arg_435_1.time_ - var_438_1) / var_438_2
				local var_438_4 = Vector3.New(0.7, -1.05, -6.2)

				var_438_0.localPosition = Vector3.Lerp(arg_435_1.var_.moveOldPos1071ui_story, var_438_4, var_438_3)

				local var_438_5 = manager.ui.mainCamera.transform.position - var_438_0.position

				var_438_0.forward = Vector3.New(var_438_5.x, var_438_5.y, var_438_5.z)

				local var_438_6 = var_438_0.localEulerAngles

				var_438_6.z = 0
				var_438_6.x = 0
				var_438_0.localEulerAngles = var_438_6
			end

			if arg_435_1.time_ >= var_438_1 + var_438_2 and arg_435_1.time_ < var_438_1 + var_438_2 + arg_438_0 then
				var_438_0.localPosition = Vector3.New(0.7, -1.05, -6.2)

				local var_438_7 = manager.ui.mainCamera.transform.position - var_438_0.position

				var_438_0.forward = Vector3.New(var_438_7.x, var_438_7.y, var_438_7.z)

				local var_438_8 = var_438_0.localEulerAngles

				var_438_8.z = 0
				var_438_8.x = 0
				var_438_0.localEulerAngles = var_438_8
			end

			local var_438_9 = arg_435_1.actors_["1071ui_story"]
			local var_438_10 = 0

			if var_438_10 < arg_435_1.time_ and arg_435_1.time_ <= var_438_10 + arg_438_0 and arg_435_1.var_.characterEffect1071ui_story == nil then
				arg_435_1.var_.characterEffect1071ui_story = var_438_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_438_11 = 0.2

			if var_438_10 <= arg_435_1.time_ and arg_435_1.time_ < var_438_10 + var_438_11 then
				local var_438_12 = (arg_435_1.time_ - var_438_10) / var_438_11

				if arg_435_1.var_.characterEffect1071ui_story then
					arg_435_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_435_1.time_ >= var_438_10 + var_438_11 and arg_435_1.time_ < var_438_10 + var_438_11 + arg_438_0 and arg_435_1.var_.characterEffect1071ui_story then
				arg_435_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_438_13 = arg_435_1.actors_["1084ui_story"]
			local var_438_14 = 0

			if var_438_14 < arg_435_1.time_ and arg_435_1.time_ <= var_438_14 + arg_438_0 and arg_435_1.var_.characterEffect1084ui_story == nil then
				arg_435_1.var_.characterEffect1084ui_story = var_438_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_438_15 = 0.2

			if var_438_14 <= arg_435_1.time_ and arg_435_1.time_ < var_438_14 + var_438_15 then
				local var_438_16 = (arg_435_1.time_ - var_438_14) / var_438_15

				if arg_435_1.var_.characterEffect1084ui_story then
					local var_438_17 = Mathf.Lerp(0, 0.5, var_438_16)

					arg_435_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_435_1.var_.characterEffect1084ui_story.fillRatio = var_438_17
				end
			end

			if arg_435_1.time_ >= var_438_14 + var_438_15 and arg_435_1.time_ < var_438_14 + var_438_15 + arg_438_0 and arg_435_1.var_.characterEffect1084ui_story then
				local var_438_18 = 0.5

				arg_435_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_435_1.var_.characterEffect1084ui_story.fillRatio = var_438_18
			end

			local var_438_19 = 0
			local var_438_20 = 0.05

			if var_438_19 < arg_435_1.time_ and arg_435_1.time_ <= var_438_19 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, true)

				local var_438_21 = arg_435_1:FormatText(StoryNameCfg[376].name)

				arg_435_1.leftNameTxt_.text = var_438_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_435_1.leftNameTxt_.transform)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1.leftNameTxt_.text)
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_22 = arg_435_1:GetWordFromCfg(120011108)
				local var_438_23 = arg_435_1:FormatText(var_438_22.content)

				arg_435_1.text_.text = var_438_23

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_24 = 2
				local var_438_25 = utf8.len(var_438_23)
				local var_438_26 = var_438_24 <= 0 and var_438_20 or var_438_20 * (var_438_25 / var_438_24)

				if var_438_26 > 0 and var_438_20 < var_438_26 then
					arg_435_1.talkMaxDuration = var_438_26

					if var_438_26 + var_438_19 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_26 + var_438_19
					end
				end

				arg_435_1.text_.text = var_438_23
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011108", "story_v_out_120011.awb") ~= 0 then
					local var_438_27 = manager.audio:GetVoiceLength("story_v_out_120011", "120011108", "story_v_out_120011.awb") / 1000

					if var_438_27 + var_438_19 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_27 + var_438_19
					end

					if var_438_22.prefab_name ~= "" and arg_435_1.actors_[var_438_22.prefab_name] ~= nil then
						local var_438_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_435_1.actors_[var_438_22.prefab_name].transform, "story_v_out_120011", "120011108", "story_v_out_120011.awb")

						arg_435_1:RecordAudio("120011108", var_438_28)
						arg_435_1:RecordAudio("120011108", var_438_28)
					else
						arg_435_1:AudioAction("play", "voice", "story_v_out_120011", "120011108", "story_v_out_120011.awb")
					end

					arg_435_1:RecordHistoryTalkVoice("story_v_out_120011", "120011108", "story_v_out_120011.awb")
				end

				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_29 = math.max(var_438_20, arg_435_1.talkMaxDuration)

			if var_438_19 <= arg_435_1.time_ and arg_435_1.time_ < var_438_19 + var_438_29 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_19) / var_438_29

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_19 + var_438_29 and arg_435_1.time_ < var_438_19 + var_438_29 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play120011109 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 120011109
		arg_439_1.duration_ = 9.9

		local var_439_0 = {
			zh = 7.9,
			ja = 9.9
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
				arg_439_0:Play120011110(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = arg_439_1.actors_["1071ui_story"].transform
			local var_442_1 = 0

			if var_442_1 < arg_439_1.time_ and arg_439_1.time_ <= var_442_1 + arg_442_0 then
				arg_439_1.var_.moveOldPos1071ui_story = var_442_0.localPosition
			end

			local var_442_2 = 0.001

			if var_442_1 <= arg_439_1.time_ and arg_439_1.time_ < var_442_1 + var_442_2 then
				local var_442_3 = (arg_439_1.time_ - var_442_1) / var_442_2
				local var_442_4 = Vector3.New(0.7, -1.05, -6.2)

				var_442_0.localPosition = Vector3.Lerp(arg_439_1.var_.moveOldPos1071ui_story, var_442_4, var_442_3)

				local var_442_5 = manager.ui.mainCamera.transform.position - var_442_0.position

				var_442_0.forward = Vector3.New(var_442_5.x, var_442_5.y, var_442_5.z)

				local var_442_6 = var_442_0.localEulerAngles

				var_442_6.z = 0
				var_442_6.x = 0
				var_442_0.localEulerAngles = var_442_6
			end

			if arg_439_1.time_ >= var_442_1 + var_442_2 and arg_439_1.time_ < var_442_1 + var_442_2 + arg_442_0 then
				var_442_0.localPosition = Vector3.New(0.7, -1.05, -6.2)

				local var_442_7 = manager.ui.mainCamera.transform.position - var_442_0.position

				var_442_0.forward = Vector3.New(var_442_7.x, var_442_7.y, var_442_7.z)

				local var_442_8 = var_442_0.localEulerAngles

				var_442_8.z = 0
				var_442_8.x = 0
				var_442_0.localEulerAngles = var_442_8
			end

			local var_442_9 = 0

			if var_442_9 < arg_439_1.time_ and arg_439_1.time_ <= var_442_9 + arg_442_0 then
				arg_439_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action2_1")
			end

			local var_442_10 = 0
			local var_442_11 = 0.975

			if var_442_10 < arg_439_1.time_ and arg_439_1.time_ <= var_442_10 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_12 = arg_439_1:FormatText(StoryNameCfg[376].name)

				arg_439_1.leftNameTxt_.text = var_442_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_13 = arg_439_1:GetWordFromCfg(120011109)
				local var_442_14 = arg_439_1:FormatText(var_442_13.content)

				arg_439_1.text_.text = var_442_14

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_15 = 39
				local var_442_16 = utf8.len(var_442_14)
				local var_442_17 = var_442_15 <= 0 and var_442_11 or var_442_11 * (var_442_16 / var_442_15)

				if var_442_17 > 0 and var_442_11 < var_442_17 then
					arg_439_1.talkMaxDuration = var_442_17

					if var_442_17 + var_442_10 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_17 + var_442_10
					end
				end

				arg_439_1.text_.text = var_442_14
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011109", "story_v_out_120011.awb") ~= 0 then
					local var_442_18 = manager.audio:GetVoiceLength("story_v_out_120011", "120011109", "story_v_out_120011.awb") / 1000

					if var_442_18 + var_442_10 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_18 + var_442_10
					end

					if var_442_13.prefab_name ~= "" and arg_439_1.actors_[var_442_13.prefab_name] ~= nil then
						local var_442_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_13.prefab_name].transform, "story_v_out_120011", "120011109", "story_v_out_120011.awb")

						arg_439_1:RecordAudio("120011109", var_442_19)
						arg_439_1:RecordAudio("120011109", var_442_19)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_out_120011", "120011109", "story_v_out_120011.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_out_120011", "120011109", "story_v_out_120011.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_20 = math.max(var_442_11, arg_439_1.talkMaxDuration)

			if var_442_10 <= arg_439_1.time_ and arg_439_1.time_ < var_442_10 + var_442_20 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_10) / var_442_20

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_10 + var_442_20 and arg_439_1.time_ < var_442_10 + var_442_20 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play120011110 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 120011110
		arg_443_1.duration_ = 5

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play120011111(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = arg_443_1.actors_["1071ui_story"]
			local var_446_1 = 0

			if var_446_1 < arg_443_1.time_ and arg_443_1.time_ <= var_446_1 + arg_446_0 and arg_443_1.var_.characterEffect1071ui_story == nil then
				arg_443_1.var_.characterEffect1071ui_story = var_446_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_446_2 = 0.2

			if var_446_1 <= arg_443_1.time_ and arg_443_1.time_ < var_446_1 + var_446_2 then
				local var_446_3 = (arg_443_1.time_ - var_446_1) / var_446_2

				if arg_443_1.var_.characterEffect1071ui_story then
					local var_446_4 = Mathf.Lerp(0, 0.5, var_446_3)

					arg_443_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_443_1.var_.characterEffect1071ui_story.fillRatio = var_446_4
				end
			end

			if arg_443_1.time_ >= var_446_1 + var_446_2 and arg_443_1.time_ < var_446_1 + var_446_2 + arg_446_0 and arg_443_1.var_.characterEffect1071ui_story then
				local var_446_5 = 0.5

				arg_443_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_443_1.var_.characterEffect1071ui_story.fillRatio = var_446_5
			end

			local var_446_6 = 0

			if var_446_6 < arg_443_1.time_ and arg_443_1.time_ <= var_446_6 + arg_446_0 then
				arg_443_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_446_7 = 0

			if var_446_7 < arg_443_1.time_ and arg_443_1.time_ <= var_446_7 + arg_446_0 then
				arg_443_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_2")
			end

			local var_446_8 = 0
			local var_446_9 = 0.325

			if var_446_8 < arg_443_1.time_ and arg_443_1.time_ <= var_446_8 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, true)

				local var_446_10 = arg_443_1:FormatText(StoryNameCfg[7].name)

				arg_443_1.leftNameTxt_.text = var_446_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_443_1.leftNameTxt_.transform)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1.leftNameTxt_.text)
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_11 = arg_443_1:GetWordFromCfg(120011110)
				local var_446_12 = arg_443_1:FormatText(var_446_11.content)

				arg_443_1.text_.text = var_446_12

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_13 = 13
				local var_446_14 = utf8.len(var_446_12)
				local var_446_15 = var_446_13 <= 0 and var_446_9 or var_446_9 * (var_446_14 / var_446_13)

				if var_446_15 > 0 and var_446_9 < var_446_15 then
					arg_443_1.talkMaxDuration = var_446_15

					if var_446_15 + var_446_8 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_15 + var_446_8
					end
				end

				arg_443_1.text_.text = var_446_12
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)
				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_16 = math.max(var_446_9, arg_443_1.talkMaxDuration)

			if var_446_8 <= arg_443_1.time_ and arg_443_1.time_ < var_446_8 + var_446_16 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_8) / var_446_16

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_8 + var_446_16 and arg_443_1.time_ < var_446_8 + var_446_16 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play120011111 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 120011111
		arg_447_1.duration_ = 6.633

		local var_447_0 = {
			zh = 6.633,
			ja = 5.766
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
				arg_447_0:Play120011112(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = arg_447_1.actors_["1071ui_story"]
			local var_450_1 = 0

			if var_450_1 < arg_447_1.time_ and arg_447_1.time_ <= var_450_1 + arg_450_0 and arg_447_1.var_.characterEffect1071ui_story == nil then
				arg_447_1.var_.characterEffect1071ui_story = var_450_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_450_2 = 0.2

			if var_450_1 <= arg_447_1.time_ and arg_447_1.time_ < var_450_1 + var_450_2 then
				local var_450_3 = (arg_447_1.time_ - var_450_1) / var_450_2

				if arg_447_1.var_.characterEffect1071ui_story then
					arg_447_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_447_1.time_ >= var_450_1 + var_450_2 and arg_447_1.time_ < var_450_1 + var_450_2 + arg_450_0 and arg_447_1.var_.characterEffect1071ui_story then
				arg_447_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_450_4 = 0

			if var_450_4 < arg_447_1.time_ and arg_447_1.time_ <= var_450_4 + arg_450_0 then
				arg_447_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071actionlink/1071action423")
			end

			local var_450_5 = 0
			local var_450_6 = 0.6

			if var_450_5 < arg_447_1.time_ and arg_447_1.time_ <= var_450_5 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_7 = arg_447_1:FormatText(StoryNameCfg[376].name)

				arg_447_1.leftNameTxt_.text = var_450_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, false)
				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_8 = arg_447_1:GetWordFromCfg(120011111)
				local var_450_9 = arg_447_1:FormatText(var_450_8.content)

				arg_447_1.text_.text = var_450_9

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_10 = 24
				local var_450_11 = utf8.len(var_450_9)
				local var_450_12 = var_450_10 <= 0 and var_450_6 or var_450_6 * (var_450_11 / var_450_10)

				if var_450_12 > 0 and var_450_6 < var_450_12 then
					arg_447_1.talkMaxDuration = var_450_12

					if var_450_12 + var_450_5 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_12 + var_450_5
					end
				end

				arg_447_1.text_.text = var_450_9
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011111", "story_v_out_120011.awb") ~= 0 then
					local var_450_13 = manager.audio:GetVoiceLength("story_v_out_120011", "120011111", "story_v_out_120011.awb") / 1000

					if var_450_13 + var_450_5 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_13 + var_450_5
					end

					if var_450_8.prefab_name ~= "" and arg_447_1.actors_[var_450_8.prefab_name] ~= nil then
						local var_450_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_447_1.actors_[var_450_8.prefab_name].transform, "story_v_out_120011", "120011111", "story_v_out_120011.awb")

						arg_447_1:RecordAudio("120011111", var_450_14)
						arg_447_1:RecordAudio("120011111", var_450_14)
					else
						arg_447_1:AudioAction("play", "voice", "story_v_out_120011", "120011111", "story_v_out_120011.awb")
					end

					arg_447_1:RecordHistoryTalkVoice("story_v_out_120011", "120011111", "story_v_out_120011.awb")
				end

				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_15 = math.max(var_450_6, arg_447_1.talkMaxDuration)

			if var_450_5 <= arg_447_1.time_ and arg_447_1.time_ < var_450_5 + var_450_15 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_5) / var_450_15

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_5 + var_450_15 and arg_447_1.time_ < var_450_5 + var_450_15 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play120011112 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 120011112
		arg_451_1.duration_ = 13

		local var_451_0 = {
			zh = 8.233,
			ja = 13
		}
		local var_451_1 = manager.audio:GetLocalizationFlag()

		if var_451_0[var_451_1] ~= nil then
			arg_451_1.duration_ = var_451_0[var_451_1]
		end

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play120011113(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = 0
			local var_454_1 = 1.125

			if var_454_0 < arg_451_1.time_ and arg_451_1.time_ <= var_454_0 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, true)

				local var_454_2 = arg_451_1:FormatText(StoryNameCfg[376].name)

				arg_451_1.leftNameTxt_.text = var_454_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_451_1.leftNameTxt_.transform)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1.leftNameTxt_.text)
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_3 = arg_451_1:GetWordFromCfg(120011112)
				local var_454_4 = arg_451_1:FormatText(var_454_3.content)

				arg_451_1.text_.text = var_454_4

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_5 = 45
				local var_454_6 = utf8.len(var_454_4)
				local var_454_7 = var_454_5 <= 0 and var_454_1 or var_454_1 * (var_454_6 / var_454_5)

				if var_454_7 > 0 and var_454_1 < var_454_7 then
					arg_451_1.talkMaxDuration = var_454_7

					if var_454_7 + var_454_0 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_7 + var_454_0
					end
				end

				arg_451_1.text_.text = var_454_4
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011112", "story_v_out_120011.awb") ~= 0 then
					local var_454_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011112", "story_v_out_120011.awb") / 1000

					if var_454_8 + var_454_0 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_8 + var_454_0
					end

					if var_454_3.prefab_name ~= "" and arg_451_1.actors_[var_454_3.prefab_name] ~= nil then
						local var_454_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_451_1.actors_[var_454_3.prefab_name].transform, "story_v_out_120011", "120011112", "story_v_out_120011.awb")

						arg_451_1:RecordAudio("120011112", var_454_9)
						arg_451_1:RecordAudio("120011112", var_454_9)
					else
						arg_451_1:AudioAction("play", "voice", "story_v_out_120011", "120011112", "story_v_out_120011.awb")
					end

					arg_451_1:RecordHistoryTalkVoice("story_v_out_120011", "120011112", "story_v_out_120011.awb")
				end

				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_10 = math.max(var_454_1, arg_451_1.talkMaxDuration)

			if var_454_0 <= arg_451_1.time_ and arg_451_1.time_ < var_454_0 + var_454_10 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_0) / var_454_10

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_0 + var_454_10 and arg_451_1.time_ < var_454_0 + var_454_10 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play120011113 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 120011113
		arg_455_1.duration_ = 5

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play120011114(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = arg_455_1.actors_["1084ui_story"].transform
			local var_458_1 = 0

			if var_458_1 < arg_455_1.time_ and arg_455_1.time_ <= var_458_1 + arg_458_0 then
				arg_455_1.var_.moveOldPos1084ui_story = var_458_0.localPosition
			end

			local var_458_2 = 0.001

			if var_458_1 <= arg_455_1.time_ and arg_455_1.time_ < var_458_1 + var_458_2 then
				local var_458_3 = (arg_455_1.time_ - var_458_1) / var_458_2
				local var_458_4 = Vector3.New(0, 100, 0)

				var_458_0.localPosition = Vector3.Lerp(arg_455_1.var_.moveOldPos1084ui_story, var_458_4, var_458_3)

				local var_458_5 = manager.ui.mainCamera.transform.position - var_458_0.position

				var_458_0.forward = Vector3.New(var_458_5.x, var_458_5.y, var_458_5.z)

				local var_458_6 = var_458_0.localEulerAngles

				var_458_6.z = 0
				var_458_6.x = 0
				var_458_0.localEulerAngles = var_458_6
			end

			if arg_455_1.time_ >= var_458_1 + var_458_2 and arg_455_1.time_ < var_458_1 + var_458_2 + arg_458_0 then
				var_458_0.localPosition = Vector3.New(0, 100, 0)

				local var_458_7 = manager.ui.mainCamera.transform.position - var_458_0.position

				var_458_0.forward = Vector3.New(var_458_7.x, var_458_7.y, var_458_7.z)

				local var_458_8 = var_458_0.localEulerAngles

				var_458_8.z = 0
				var_458_8.x = 0
				var_458_0.localEulerAngles = var_458_8
			end

			local var_458_9 = arg_455_1.actors_["1071ui_story"].transform
			local var_458_10 = 0

			if var_458_10 < arg_455_1.time_ and arg_455_1.time_ <= var_458_10 + arg_458_0 then
				arg_455_1.var_.moveOldPos1071ui_story = var_458_9.localPosition
			end

			local var_458_11 = 0.001

			if var_458_10 <= arg_455_1.time_ and arg_455_1.time_ < var_458_10 + var_458_11 then
				local var_458_12 = (arg_455_1.time_ - var_458_10) / var_458_11
				local var_458_13 = Vector3.New(0, 100, 0)

				var_458_9.localPosition = Vector3.Lerp(arg_455_1.var_.moveOldPos1071ui_story, var_458_13, var_458_12)

				local var_458_14 = manager.ui.mainCamera.transform.position - var_458_9.position

				var_458_9.forward = Vector3.New(var_458_14.x, var_458_14.y, var_458_14.z)

				local var_458_15 = var_458_9.localEulerAngles

				var_458_15.z = 0
				var_458_15.x = 0
				var_458_9.localEulerAngles = var_458_15
			end

			if arg_455_1.time_ >= var_458_10 + var_458_11 and arg_455_1.time_ < var_458_10 + var_458_11 + arg_458_0 then
				var_458_9.localPosition = Vector3.New(0, 100, 0)

				local var_458_16 = manager.ui.mainCamera.transform.position - var_458_9.position

				var_458_9.forward = Vector3.New(var_458_16.x, var_458_16.y, var_458_16.z)

				local var_458_17 = var_458_9.localEulerAngles

				var_458_17.z = 0
				var_458_17.x = 0
				var_458_9.localEulerAngles = var_458_17
			end

			local var_458_18 = 0
			local var_458_19 = 0.4

			if var_458_18 < arg_455_1.time_ and arg_455_1.time_ <= var_458_18 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, false)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_20 = arg_455_1:GetWordFromCfg(120011113)
				local var_458_21 = arg_455_1:FormatText(var_458_20.content)

				arg_455_1.text_.text = var_458_21

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_22 = 16
				local var_458_23 = utf8.len(var_458_21)
				local var_458_24 = var_458_22 <= 0 and var_458_19 or var_458_19 * (var_458_23 / var_458_22)

				if var_458_24 > 0 and var_458_19 < var_458_24 then
					arg_455_1.talkMaxDuration = var_458_24

					if var_458_24 + var_458_18 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_24 + var_458_18
					end
				end

				arg_455_1.text_.text = var_458_21
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)
				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_25 = math.max(var_458_19, arg_455_1.talkMaxDuration)

			if var_458_18 <= arg_455_1.time_ and arg_455_1.time_ < var_458_18 + var_458_25 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_18) / var_458_25

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_18 + var_458_25 and arg_455_1.time_ < var_458_18 + var_458_25 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play120011114 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 120011114
		arg_459_1.duration_ = 4.8

		local var_459_0 = {
			zh = 4.133,
			ja = 4.8
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
				arg_459_0:Play120011115(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = arg_459_1.actors_["1084ui_story"].transform
			local var_462_1 = 0

			if var_462_1 < arg_459_1.time_ and arg_459_1.time_ <= var_462_1 + arg_462_0 then
				arg_459_1.var_.moveOldPos1084ui_story = var_462_0.localPosition
			end

			local var_462_2 = 0.001

			if var_462_1 <= arg_459_1.time_ and arg_459_1.time_ < var_462_1 + var_462_2 then
				local var_462_3 = (arg_459_1.time_ - var_462_1) / var_462_2
				local var_462_4 = Vector3.New(0, -0.97, -6)

				var_462_0.localPosition = Vector3.Lerp(arg_459_1.var_.moveOldPos1084ui_story, var_462_4, var_462_3)

				local var_462_5 = manager.ui.mainCamera.transform.position - var_462_0.position

				var_462_0.forward = Vector3.New(var_462_5.x, var_462_5.y, var_462_5.z)

				local var_462_6 = var_462_0.localEulerAngles

				var_462_6.z = 0
				var_462_6.x = 0
				var_462_0.localEulerAngles = var_462_6
			end

			if arg_459_1.time_ >= var_462_1 + var_462_2 and arg_459_1.time_ < var_462_1 + var_462_2 + arg_462_0 then
				var_462_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_462_7 = manager.ui.mainCamera.transform.position - var_462_0.position

				var_462_0.forward = Vector3.New(var_462_7.x, var_462_7.y, var_462_7.z)

				local var_462_8 = var_462_0.localEulerAngles

				var_462_8.z = 0
				var_462_8.x = 0
				var_462_0.localEulerAngles = var_462_8
			end

			local var_462_9 = arg_459_1.actors_["1084ui_story"]
			local var_462_10 = 0

			if var_462_10 < arg_459_1.time_ and arg_459_1.time_ <= var_462_10 + arg_462_0 and arg_459_1.var_.characterEffect1084ui_story == nil then
				arg_459_1.var_.characterEffect1084ui_story = var_462_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_462_11 = 0.2

			if var_462_10 <= arg_459_1.time_ and arg_459_1.time_ < var_462_10 + var_462_11 then
				local var_462_12 = (arg_459_1.time_ - var_462_10) / var_462_11

				if arg_459_1.var_.characterEffect1084ui_story then
					arg_459_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_459_1.time_ >= var_462_10 + var_462_11 and arg_459_1.time_ < var_462_10 + var_462_11 + arg_462_0 and arg_459_1.var_.characterEffect1084ui_story then
				arg_459_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_462_13 = 0

			if var_462_13 < arg_459_1.time_ and arg_459_1.time_ <= var_462_13 + arg_462_0 then
				arg_459_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_462_14 = 0

			if var_462_14 < arg_459_1.time_ and arg_459_1.time_ <= var_462_14 + arg_462_0 then
				arg_459_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_462_15 = 0
			local var_462_16 = 0.45

			if var_462_15 < arg_459_1.time_ and arg_459_1.time_ <= var_462_15 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, true)

				local var_462_17 = arg_459_1:FormatText(StoryNameCfg[6].name)

				arg_459_1.leftNameTxt_.text = var_462_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_459_1.leftNameTxt_.transform)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1.leftNameTxt_.text)
				SetActive(arg_459_1.iconTrs_.gameObject, false)
				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_18 = arg_459_1:GetWordFromCfg(120011114)
				local var_462_19 = arg_459_1:FormatText(var_462_18.content)

				arg_459_1.text_.text = var_462_19

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_20 = 18
				local var_462_21 = utf8.len(var_462_19)
				local var_462_22 = var_462_20 <= 0 and var_462_16 or var_462_16 * (var_462_21 / var_462_20)

				if var_462_22 > 0 and var_462_16 < var_462_22 then
					arg_459_1.talkMaxDuration = var_462_22

					if var_462_22 + var_462_15 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_22 + var_462_15
					end
				end

				arg_459_1.text_.text = var_462_19
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011114", "story_v_out_120011.awb") ~= 0 then
					local var_462_23 = manager.audio:GetVoiceLength("story_v_out_120011", "120011114", "story_v_out_120011.awb") / 1000

					if var_462_23 + var_462_15 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_23 + var_462_15
					end

					if var_462_18.prefab_name ~= "" and arg_459_1.actors_[var_462_18.prefab_name] ~= nil then
						local var_462_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_459_1.actors_[var_462_18.prefab_name].transform, "story_v_out_120011", "120011114", "story_v_out_120011.awb")

						arg_459_1:RecordAudio("120011114", var_462_24)
						arg_459_1:RecordAudio("120011114", var_462_24)
					else
						arg_459_1:AudioAction("play", "voice", "story_v_out_120011", "120011114", "story_v_out_120011.awb")
					end

					arg_459_1:RecordHistoryTalkVoice("story_v_out_120011", "120011114", "story_v_out_120011.awb")
				end

				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_25 = math.max(var_462_16, arg_459_1.talkMaxDuration)

			if var_462_15 <= arg_459_1.time_ and arg_459_1.time_ < var_462_15 + var_462_25 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_15) / var_462_25

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_15 + var_462_25 and arg_459_1.time_ < var_462_15 + var_462_25 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play120011115 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 120011115
		arg_463_1.duration_ = 5

		SetActive(arg_463_1.tipsGo_, false)

		function arg_463_1.onSingleLineFinish_()
			arg_463_1.onSingleLineUpdate_ = nil
			arg_463_1.onSingleLineFinish_ = nil
			arg_463_1.state_ = "waiting"
		end

		function arg_463_1.playNext_(arg_465_0)
			if arg_465_0 == 1 then
				arg_463_0:Play120011116(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = arg_463_1.actors_["1084ui_story"]
			local var_466_1 = 0

			if var_466_1 < arg_463_1.time_ and arg_463_1.time_ <= var_466_1 + arg_466_0 and arg_463_1.var_.characterEffect1084ui_story == nil then
				arg_463_1.var_.characterEffect1084ui_story = var_466_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_466_2 = 0.2

			if var_466_1 <= arg_463_1.time_ and arg_463_1.time_ < var_466_1 + var_466_2 then
				local var_466_3 = (arg_463_1.time_ - var_466_1) / var_466_2

				if arg_463_1.var_.characterEffect1084ui_story then
					local var_466_4 = Mathf.Lerp(0, 0.5, var_466_3)

					arg_463_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_463_1.var_.characterEffect1084ui_story.fillRatio = var_466_4
				end
			end

			if arg_463_1.time_ >= var_466_1 + var_466_2 and arg_463_1.time_ < var_466_1 + var_466_2 + arg_466_0 and arg_463_1.var_.characterEffect1084ui_story then
				local var_466_5 = 0.5

				arg_463_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_463_1.var_.characterEffect1084ui_story.fillRatio = var_466_5
			end

			local var_466_6 = 0
			local var_466_7 = 0.675

			if var_466_6 < arg_463_1.time_ and arg_463_1.time_ <= var_466_6 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, true)

				local var_466_8 = arg_463_1:FormatText(StoryNameCfg[7].name)

				arg_463_1.leftNameTxt_.text = var_466_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_463_1.leftNameTxt_.transform)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1.leftNameTxt_.text)
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_9 = arg_463_1:GetWordFromCfg(120011115)
				local var_466_10 = arg_463_1:FormatText(var_466_9.content)

				arg_463_1.text_.text = var_466_10

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_11 = 27
				local var_466_12 = utf8.len(var_466_10)
				local var_466_13 = var_466_11 <= 0 and var_466_7 or var_466_7 * (var_466_12 / var_466_11)

				if var_466_13 > 0 and var_466_7 < var_466_13 then
					arg_463_1.talkMaxDuration = var_466_13

					if var_466_13 + var_466_6 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_13 + var_466_6
					end
				end

				arg_463_1.text_.text = var_466_10
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)
				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_14 = math.max(var_466_7, arg_463_1.talkMaxDuration)

			if var_466_6 <= arg_463_1.time_ and arg_463_1.time_ < var_466_6 + var_466_14 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_6) / var_466_14

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_6 + var_466_14 and arg_463_1.time_ < var_466_6 + var_466_14 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play120011116 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 120011116
		arg_467_1.duration_ = 5

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play120011117(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = arg_467_1.actors_["1084ui_story"].transform
			local var_470_1 = 0

			if var_470_1 < arg_467_1.time_ and arg_467_1.time_ <= var_470_1 + arg_470_0 then
				arg_467_1.var_.moveOldPos1084ui_story = var_470_0.localPosition
			end

			local var_470_2 = 0.001

			if var_470_1 <= arg_467_1.time_ and arg_467_1.time_ < var_470_1 + var_470_2 then
				local var_470_3 = (arg_467_1.time_ - var_470_1) / var_470_2
				local var_470_4 = Vector3.New(0, 100, 0)

				var_470_0.localPosition = Vector3.Lerp(arg_467_1.var_.moveOldPos1084ui_story, var_470_4, var_470_3)

				local var_470_5 = manager.ui.mainCamera.transform.position - var_470_0.position

				var_470_0.forward = Vector3.New(var_470_5.x, var_470_5.y, var_470_5.z)

				local var_470_6 = var_470_0.localEulerAngles

				var_470_6.z = 0
				var_470_6.x = 0
				var_470_0.localEulerAngles = var_470_6
			end

			if arg_467_1.time_ >= var_470_1 + var_470_2 and arg_467_1.time_ < var_470_1 + var_470_2 + arg_470_0 then
				var_470_0.localPosition = Vector3.New(0, 100, 0)

				local var_470_7 = manager.ui.mainCamera.transform.position - var_470_0.position

				var_470_0.forward = Vector3.New(var_470_7.x, var_470_7.y, var_470_7.z)

				local var_470_8 = var_470_0.localEulerAngles

				var_470_8.z = 0
				var_470_8.x = 0
				var_470_0.localEulerAngles = var_470_8
			end

			local var_470_9 = 0
			local var_470_10 = 0.5

			if var_470_9 < arg_467_1.time_ and arg_467_1.time_ <= var_470_9 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, false)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_467_1.iconTrs_.gameObject, false)
				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_11 = arg_467_1:GetWordFromCfg(120011116)
				local var_470_12 = arg_467_1:FormatText(var_470_11.content)

				arg_467_1.text_.text = var_470_12

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_13 = 20
				local var_470_14 = utf8.len(var_470_12)
				local var_470_15 = var_470_13 <= 0 and var_470_10 or var_470_10 * (var_470_14 / var_470_13)

				if var_470_15 > 0 and var_470_10 < var_470_15 then
					arg_467_1.talkMaxDuration = var_470_15

					if var_470_15 + var_470_9 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_15 + var_470_9
					end
				end

				arg_467_1.text_.text = var_470_12
				arg_467_1.typewritter.percent = 0

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(false)
				arg_467_1:RecordContent(arg_467_1.text_.text)
			end

			local var_470_16 = math.max(var_470_10, arg_467_1.talkMaxDuration)

			if var_470_9 <= arg_467_1.time_ and arg_467_1.time_ < var_470_9 + var_470_16 then
				arg_467_1.typewritter.percent = (arg_467_1.time_ - var_470_9) / var_470_16

				arg_467_1.typewritter:SetDirty()
			end

			if arg_467_1.time_ >= var_470_9 + var_470_16 and arg_467_1.time_ < var_470_9 + var_470_16 + arg_470_0 then
				arg_467_1.typewritter.percent = 1

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(true)
			end
		end
	end,
	Play120011117 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 120011117
		arg_471_1.duration_ = 5

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play120011118(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = 0
			local var_474_1 = 0.5

			if var_474_0 < arg_471_1.time_ and arg_471_1.time_ <= var_474_0 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, false)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_2 = arg_471_1:GetWordFromCfg(120011117)
				local var_474_3 = arg_471_1:FormatText(var_474_2.content)

				arg_471_1.text_.text = var_474_3

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_4 = 20
				local var_474_5 = utf8.len(var_474_3)
				local var_474_6 = var_474_4 <= 0 and var_474_1 or var_474_1 * (var_474_5 / var_474_4)

				if var_474_6 > 0 and var_474_1 < var_474_6 then
					arg_471_1.talkMaxDuration = var_474_6

					if var_474_6 + var_474_0 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_6 + var_474_0
					end
				end

				arg_471_1.text_.text = var_474_3
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)
				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_7 = math.max(var_474_1, arg_471_1.talkMaxDuration)

			if var_474_0 <= arg_471_1.time_ and arg_471_1.time_ < var_474_0 + var_474_7 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_0) / var_474_7

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_0 + var_474_7 and arg_471_1.time_ < var_474_0 + var_474_7 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play120011118 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 120011118
		arg_475_1.duration_ = 5

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play120011119(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = 0
			local var_478_1 = 0.1

			if var_478_0 < arg_475_1.time_ and arg_475_1.time_ <= var_478_0 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, true)

				local var_478_2 = arg_475_1:FormatText(StoryNameCfg[7].name)

				arg_475_1.leftNameTxt_.text = var_478_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_475_1.leftNameTxt_.transform)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1.leftNameTxt_.text)
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_3 = arg_475_1:GetWordFromCfg(120011118)
				local var_478_4 = arg_475_1:FormatText(var_478_3.content)

				arg_475_1.text_.text = var_478_4

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_5 = 4
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
				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_8 = math.max(var_478_1, arg_475_1.talkMaxDuration)

			if var_478_0 <= arg_475_1.time_ and arg_475_1.time_ < var_478_0 + var_478_8 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_0) / var_478_8

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_0 + var_478_8 and arg_475_1.time_ < var_478_0 + var_478_8 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play120011119 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 120011119
		arg_479_1.duration_ = 7.6

		local var_479_0 = {
			zh = 6.333,
			ja = 7.6
		}
		local var_479_1 = manager.audio:GetLocalizationFlag()

		if var_479_0[var_479_1] ~= nil then
			arg_479_1.duration_ = var_479_0[var_479_1]
		end

		SetActive(arg_479_1.tipsGo_, false)

		function arg_479_1.onSingleLineFinish_()
			arg_479_1.onSingleLineUpdate_ = nil
			arg_479_1.onSingleLineFinish_ = nil
			arg_479_1.state_ = "waiting"
		end

		function arg_479_1.playNext_(arg_481_0)
			if arg_481_0 == 1 then
				arg_479_0:Play120011120(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = arg_479_1.actors_["1084ui_story"].transform
			local var_482_1 = 0

			if var_482_1 < arg_479_1.time_ and arg_479_1.time_ <= var_482_1 + arg_482_0 then
				arg_479_1.var_.moveOldPos1084ui_story = var_482_0.localPosition
			end

			local var_482_2 = 0.001

			if var_482_1 <= arg_479_1.time_ and arg_479_1.time_ < var_482_1 + var_482_2 then
				local var_482_3 = (arg_479_1.time_ - var_482_1) / var_482_2
				local var_482_4 = Vector3.New(0, -0.97, -6)

				var_482_0.localPosition = Vector3.Lerp(arg_479_1.var_.moveOldPos1084ui_story, var_482_4, var_482_3)

				local var_482_5 = manager.ui.mainCamera.transform.position - var_482_0.position

				var_482_0.forward = Vector3.New(var_482_5.x, var_482_5.y, var_482_5.z)

				local var_482_6 = var_482_0.localEulerAngles

				var_482_6.z = 0
				var_482_6.x = 0
				var_482_0.localEulerAngles = var_482_6
			end

			if arg_479_1.time_ >= var_482_1 + var_482_2 and arg_479_1.time_ < var_482_1 + var_482_2 + arg_482_0 then
				var_482_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_482_7 = manager.ui.mainCamera.transform.position - var_482_0.position

				var_482_0.forward = Vector3.New(var_482_7.x, var_482_7.y, var_482_7.z)

				local var_482_8 = var_482_0.localEulerAngles

				var_482_8.z = 0
				var_482_8.x = 0
				var_482_0.localEulerAngles = var_482_8
			end

			local var_482_9 = arg_479_1.actors_["1084ui_story"]
			local var_482_10 = 0

			if var_482_10 < arg_479_1.time_ and arg_479_1.time_ <= var_482_10 + arg_482_0 and arg_479_1.var_.characterEffect1084ui_story == nil then
				arg_479_1.var_.characterEffect1084ui_story = var_482_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_482_11 = 0.2

			if var_482_10 <= arg_479_1.time_ and arg_479_1.time_ < var_482_10 + var_482_11 then
				local var_482_12 = (arg_479_1.time_ - var_482_10) / var_482_11

				if arg_479_1.var_.characterEffect1084ui_story then
					arg_479_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_479_1.time_ >= var_482_10 + var_482_11 and arg_479_1.time_ < var_482_10 + var_482_11 + arg_482_0 and arg_479_1.var_.characterEffect1084ui_story then
				arg_479_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_482_13 = 0

			if var_482_13 < arg_479_1.time_ and arg_479_1.time_ <= var_482_13 + arg_482_0 then
				arg_479_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_482_14 = 0

			if var_482_14 < arg_479_1.time_ and arg_479_1.time_ <= var_482_14 + arg_482_0 then
				arg_479_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_482_15 = 0
			local var_482_16 = 0.65

			if var_482_15 < arg_479_1.time_ and arg_479_1.time_ <= var_482_15 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, true)

				local var_482_17 = arg_479_1:FormatText(StoryNameCfg[6].name)

				arg_479_1.leftNameTxt_.text = var_482_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_479_1.leftNameTxt_.transform)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1.leftNameTxt_.text)
				SetActive(arg_479_1.iconTrs_.gameObject, false)
				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_18 = arg_479_1:GetWordFromCfg(120011119)
				local var_482_19 = arg_479_1:FormatText(var_482_18.content)

				arg_479_1.text_.text = var_482_19

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_20 = 26
				local var_482_21 = utf8.len(var_482_19)
				local var_482_22 = var_482_20 <= 0 and var_482_16 or var_482_16 * (var_482_21 / var_482_20)

				if var_482_22 > 0 and var_482_16 < var_482_22 then
					arg_479_1.talkMaxDuration = var_482_22

					if var_482_22 + var_482_15 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_22 + var_482_15
					end
				end

				arg_479_1.text_.text = var_482_19
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011119", "story_v_out_120011.awb") ~= 0 then
					local var_482_23 = manager.audio:GetVoiceLength("story_v_out_120011", "120011119", "story_v_out_120011.awb") / 1000

					if var_482_23 + var_482_15 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_23 + var_482_15
					end

					if var_482_18.prefab_name ~= "" and arg_479_1.actors_[var_482_18.prefab_name] ~= nil then
						local var_482_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_479_1.actors_[var_482_18.prefab_name].transform, "story_v_out_120011", "120011119", "story_v_out_120011.awb")

						arg_479_1:RecordAudio("120011119", var_482_24)
						arg_479_1:RecordAudio("120011119", var_482_24)
					else
						arg_479_1:AudioAction("play", "voice", "story_v_out_120011", "120011119", "story_v_out_120011.awb")
					end

					arg_479_1:RecordHistoryTalkVoice("story_v_out_120011", "120011119", "story_v_out_120011.awb")
				end

				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_25 = math.max(var_482_16, arg_479_1.talkMaxDuration)

			if var_482_15 <= arg_479_1.time_ and arg_479_1.time_ < var_482_15 + var_482_25 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_15) / var_482_25

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_15 + var_482_25 and arg_479_1.time_ < var_482_15 + var_482_25 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play120011120 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 120011120
		arg_483_1.duration_ = 5

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play120011121(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = arg_483_1.actors_["1084ui_story"].transform
			local var_486_1 = 0

			if var_486_1 < arg_483_1.time_ and arg_483_1.time_ <= var_486_1 + arg_486_0 then
				arg_483_1.var_.moveOldPos1084ui_story = var_486_0.localPosition
			end

			local var_486_2 = 0.001

			if var_486_1 <= arg_483_1.time_ and arg_483_1.time_ < var_486_1 + var_486_2 then
				local var_486_3 = (arg_483_1.time_ - var_486_1) / var_486_2
				local var_486_4 = Vector3.New(0, 100, 0)

				var_486_0.localPosition = Vector3.Lerp(arg_483_1.var_.moveOldPos1084ui_story, var_486_4, var_486_3)

				local var_486_5 = manager.ui.mainCamera.transform.position - var_486_0.position

				var_486_0.forward = Vector3.New(var_486_5.x, var_486_5.y, var_486_5.z)

				local var_486_6 = var_486_0.localEulerAngles

				var_486_6.z = 0
				var_486_6.x = 0
				var_486_0.localEulerAngles = var_486_6
			end

			if arg_483_1.time_ >= var_486_1 + var_486_2 and arg_483_1.time_ < var_486_1 + var_486_2 + arg_486_0 then
				var_486_0.localPosition = Vector3.New(0, 100, 0)

				local var_486_7 = manager.ui.mainCamera.transform.position - var_486_0.position

				var_486_0.forward = Vector3.New(var_486_7.x, var_486_7.y, var_486_7.z)

				local var_486_8 = var_486_0.localEulerAngles

				var_486_8.z = 0
				var_486_8.x = 0
				var_486_0.localEulerAngles = var_486_8
			end

			local var_486_9 = 0
			local var_486_10 = 1.15

			if var_486_9 < arg_483_1.time_ and arg_483_1.time_ <= var_486_9 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, false)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_11 = arg_483_1:GetWordFromCfg(120011120)
				local var_486_12 = arg_483_1:FormatText(var_486_11.content)

				arg_483_1.text_.text = var_486_12

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_13 = 46
				local var_486_14 = utf8.len(var_486_12)
				local var_486_15 = var_486_13 <= 0 and var_486_10 or var_486_10 * (var_486_14 / var_486_13)

				if var_486_15 > 0 and var_486_10 < var_486_15 then
					arg_483_1.talkMaxDuration = var_486_15

					if var_486_15 + var_486_9 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_15 + var_486_9
					end
				end

				arg_483_1.text_.text = var_486_12
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)
				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_16 = math.max(var_486_10, arg_483_1.talkMaxDuration)

			if var_486_9 <= arg_483_1.time_ and arg_483_1.time_ < var_486_9 + var_486_16 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_9) / var_486_16

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_9 + var_486_16 and arg_483_1.time_ < var_486_9 + var_486_16 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play120011121 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 120011121
		arg_487_1.duration_ = 5

		SetActive(arg_487_1.tipsGo_, false)

		function arg_487_1.onSingleLineFinish_()
			arg_487_1.onSingleLineUpdate_ = nil
			arg_487_1.onSingleLineFinish_ = nil
			arg_487_1.state_ = "waiting"
		end

		function arg_487_1.playNext_(arg_489_0)
			if arg_489_0 == 1 then
				arg_487_0:Play120011122(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = 0
			local var_490_1 = 0.85

			if var_490_0 < arg_487_1.time_ and arg_487_1.time_ <= var_490_0 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0
				arg_487_1.dialogCg_.alpha = 1

				arg_487_1.dialog_:SetActive(true)
				SetActive(arg_487_1.leftNameGo_, false)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_2 = arg_487_1:GetWordFromCfg(120011121)
				local var_490_3 = arg_487_1:FormatText(var_490_2.content)

				arg_487_1.text_.text = var_490_3

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_4 = 34
				local var_490_5 = utf8.len(var_490_3)
				local var_490_6 = var_490_4 <= 0 and var_490_1 or var_490_1 * (var_490_5 / var_490_4)

				if var_490_6 > 0 and var_490_1 < var_490_6 then
					arg_487_1.talkMaxDuration = var_490_6

					if var_490_6 + var_490_0 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_6 + var_490_0
					end
				end

				arg_487_1.text_.text = var_490_3
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)
				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_7 = math.max(var_490_1, arg_487_1.talkMaxDuration)

			if var_490_0 <= arg_487_1.time_ and arg_487_1.time_ < var_490_0 + var_490_7 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_0) / var_490_7

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_0 + var_490_7 and arg_487_1.time_ < var_490_0 + var_490_7 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play120011122 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 120011122
		arg_491_1.duration_ = 9

		SetActive(arg_491_1.tipsGo_, false)

		function arg_491_1.onSingleLineFinish_()
			arg_491_1.onSingleLineUpdate_ = nil
			arg_491_1.onSingleLineFinish_ = nil
			arg_491_1.state_ = "waiting"
		end

		function arg_491_1.playNext_(arg_493_0)
			if arg_493_0 == 1 then
				arg_491_0:Play120011123(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = "XH0102a"

			if arg_491_1.bgs_[var_494_0] == nil then
				local var_494_1 = Object.Instantiate(arg_491_1.paintGo_)

				var_494_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_494_0)
				var_494_1.name = var_494_0
				var_494_1.transform.parent = arg_491_1.stage_.transform
				var_494_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_491_1.bgs_[var_494_0] = var_494_1
			end

			local var_494_2 = 2

			if var_494_2 < arg_491_1.time_ and arg_491_1.time_ <= var_494_2 + arg_494_0 then
				local var_494_3 = manager.ui.mainCamera.transform.localPosition
				local var_494_4 = Vector3.New(0, 0, 10) + Vector3.New(var_494_3.x, var_494_3.y, 0)
				local var_494_5 = arg_491_1.bgs_.XH0102a

				var_494_5.transform.localPosition = var_494_4
				var_494_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_494_6 = var_494_5:GetComponent("SpriteRenderer")

				if var_494_6 and var_494_6.sprite then
					local var_494_7 = (var_494_5.transform.localPosition - var_494_3).z
					local var_494_8 = manager.ui.mainCameraCom_
					local var_494_9 = 2 * var_494_7 * Mathf.Tan(var_494_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_494_10 = var_494_9 * var_494_8.aspect
					local var_494_11 = var_494_6.sprite.bounds.size.x
					local var_494_12 = var_494_6.sprite.bounds.size.y
					local var_494_13 = var_494_10 / var_494_11
					local var_494_14 = var_494_9 / var_494_12
					local var_494_15 = var_494_14 < var_494_13 and var_494_13 or var_494_14

					var_494_5.transform.localScale = Vector3.New(var_494_15, var_494_15, 0)
				end

				for iter_494_0, iter_494_1 in pairs(arg_491_1.bgs_) do
					if iter_494_0 ~= "XH0102a" then
						iter_494_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_494_16 = 0

			if var_494_16 < arg_491_1.time_ and arg_491_1.time_ <= var_494_16 + arg_494_0 then
				arg_491_1.mask_.enabled = true
				arg_491_1.mask_.raycastTarget = true

				arg_491_1:SetGaussion(false)
			end

			local var_494_17 = 2

			if var_494_16 <= arg_491_1.time_ and arg_491_1.time_ < var_494_16 + var_494_17 then
				local var_494_18 = (arg_491_1.time_ - var_494_16) / var_494_17
				local var_494_19 = Color.New(0, 0, 0)

				var_494_19.a = Mathf.Lerp(0, 1, var_494_18)
				arg_491_1.mask_.color = var_494_19
			end

			if arg_491_1.time_ >= var_494_16 + var_494_17 and arg_491_1.time_ < var_494_16 + var_494_17 + arg_494_0 then
				local var_494_20 = Color.New(0, 0, 0)

				var_494_20.a = 1
				arg_491_1.mask_.color = var_494_20
			end

			local var_494_21 = 2

			if var_494_21 < arg_491_1.time_ and arg_491_1.time_ <= var_494_21 + arg_494_0 then
				arg_491_1.mask_.enabled = true
				arg_491_1.mask_.raycastTarget = true

				arg_491_1:SetGaussion(false)
			end

			local var_494_22 = 2

			if var_494_21 <= arg_491_1.time_ and arg_491_1.time_ < var_494_21 + var_494_22 then
				local var_494_23 = (arg_491_1.time_ - var_494_21) / var_494_22
				local var_494_24 = Color.New(0, 0, 0)

				var_494_24.a = Mathf.Lerp(1, 0, var_494_23)
				arg_491_1.mask_.color = var_494_24
			end

			if arg_491_1.time_ >= var_494_21 + var_494_22 and arg_491_1.time_ < var_494_21 + var_494_22 + arg_494_0 then
				local var_494_25 = Color.New(0, 0, 0)
				local var_494_26 = 0

				arg_491_1.mask_.enabled = false
				var_494_25.a = var_494_26
				arg_491_1.mask_.color = var_494_25
			end

			local var_494_27 = arg_491_1.bgs_.XH0102a.transform
			local var_494_28 = 2.01666666666667

			if var_494_28 < arg_491_1.time_ and arg_491_1.time_ <= var_494_28 + arg_494_0 then
				arg_491_1.var_.moveOldPosXH0102a = var_494_27.localPosition
			end

			local var_494_29 = 2.5

			if var_494_28 <= arg_491_1.time_ and arg_491_1.time_ < var_494_28 + var_494_29 then
				local var_494_30 = (arg_491_1.time_ - var_494_28) / var_494_29
				local var_494_31 = Vector3.New(0, 0.5, 4.5)

				var_494_27.localPosition = Vector3.Lerp(arg_491_1.var_.moveOldPosXH0102a, var_494_31, var_494_30)
			end

			if arg_491_1.time_ >= var_494_28 + var_494_29 and arg_491_1.time_ < var_494_28 + var_494_29 + arg_494_0 then
				var_494_27.localPosition = Vector3.New(0, 0.5, 4.5)
			end

			local var_494_32 = arg_491_1.bgs_.XH0102a.transform
			local var_494_33 = 2

			if var_494_33 < arg_491_1.time_ and arg_491_1.time_ <= var_494_33 + arg_494_0 then
				arg_491_1.var_.moveOldPosXH0102a = var_494_32.localPosition
			end

			local var_494_34 = 0.001

			if var_494_33 <= arg_491_1.time_ and arg_491_1.time_ < var_494_33 + var_494_34 then
				local var_494_35 = (arg_491_1.time_ - var_494_33) / var_494_34
				local var_494_36 = Vector3.New(0, 1, 4)

				var_494_32.localPosition = Vector3.Lerp(arg_491_1.var_.moveOldPosXH0102a, var_494_36, var_494_35)
			end

			if arg_491_1.time_ >= var_494_33 + var_494_34 and arg_491_1.time_ < var_494_33 + var_494_34 + arg_494_0 then
				var_494_32.localPosition = Vector3.New(0, 1, 4)
			end

			local var_494_37 = 4

			if var_494_37 < arg_491_1.time_ and arg_491_1.time_ <= var_494_37 + arg_494_0 then
				arg_491_1.allBtn_.enabled = false
			end

			local var_494_38 = 1

			if arg_491_1.time_ >= var_494_37 + var_494_38 and arg_491_1.time_ < var_494_37 + var_494_38 + arg_494_0 then
				arg_491_1.allBtn_.enabled = true
			end

			if arg_491_1.frameCnt_ <= 1 then
				arg_491_1.dialog_:SetActive(false)
			end

			local var_494_39 = 4
			local var_494_40 = 1.3

			if var_494_39 < arg_491_1.time_ and arg_491_1.time_ <= var_494_39 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0

				arg_491_1.dialog_:SetActive(true)

				local var_494_41 = LeanTween.value(arg_491_1.dialog_, 0, 1, 0.3)

				var_494_41:setOnUpdate(LuaHelper.FloatAction(function(arg_495_0)
					arg_491_1.dialogCg_.alpha = arg_495_0
				end))
				var_494_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_491_1.dialog_)
					var_494_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_491_1.duration_ = arg_491_1.duration_ + 0.3

				SetActive(arg_491_1.leftNameGo_, false)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_42 = arg_491_1:GetWordFromCfg(120011122)
				local var_494_43 = arg_491_1:FormatText(var_494_42.content)

				arg_491_1.text_.text = var_494_43

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_44 = 52
				local var_494_45 = utf8.len(var_494_43)
				local var_494_46 = var_494_44 <= 0 and var_494_40 or var_494_40 * (var_494_45 / var_494_44)

				if var_494_46 > 0 and var_494_40 < var_494_46 then
					arg_491_1.talkMaxDuration = var_494_46
					var_494_39 = var_494_39 + 0.3

					if var_494_46 + var_494_39 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_46 + var_494_39
					end
				end

				arg_491_1.text_.text = var_494_43
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)
				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_47 = var_494_39 + 0.3
			local var_494_48 = math.max(var_494_40, arg_491_1.talkMaxDuration)

			if var_494_47 <= arg_491_1.time_ and arg_491_1.time_ < var_494_47 + var_494_48 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_47) / var_494_48

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_47 + var_494_48 and arg_491_1.time_ < var_494_47 + var_494_48 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play120011123 = function(arg_497_0, arg_497_1)
		arg_497_1.time_ = 0
		arg_497_1.frameCnt_ = 0
		arg_497_1.state_ = "playing"
		arg_497_1.curTalkId_ = 120011123
		arg_497_1.duration_ = 5

		SetActive(arg_497_1.tipsGo_, false)

		function arg_497_1.onSingleLineFinish_()
			arg_497_1.onSingleLineUpdate_ = nil
			arg_497_1.onSingleLineFinish_ = nil
			arg_497_1.state_ = "waiting"
		end

		function arg_497_1.playNext_(arg_499_0)
			if arg_499_0 == 1 then
				arg_497_0:Play120011124(arg_497_1)
			end
		end

		function arg_497_1.onSingleLineUpdate_(arg_500_0)
			local var_500_0 = 0
			local var_500_1 = 1.175

			if var_500_0 < arg_497_1.time_ and arg_497_1.time_ <= var_500_0 + arg_500_0 then
				arg_497_1.talkMaxDuration = 0
				arg_497_1.dialogCg_.alpha = 1

				arg_497_1.dialog_:SetActive(true)
				SetActive(arg_497_1.leftNameGo_, false)

				arg_497_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_497_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_497_1:RecordName(arg_497_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_497_1.iconTrs_.gameObject, false)
				arg_497_1.callingController_:SetSelectedState("normal")

				local var_500_2 = arg_497_1:GetWordFromCfg(120011123)
				local var_500_3 = arg_497_1:FormatText(var_500_2.content)

				arg_497_1.text_.text = var_500_3

				LuaForUtil.ClearLinePrefixSymbol(arg_497_1.text_)

				local var_500_4 = 47
				local var_500_5 = utf8.len(var_500_3)
				local var_500_6 = var_500_4 <= 0 and var_500_1 or var_500_1 * (var_500_5 / var_500_4)

				if var_500_6 > 0 and var_500_1 < var_500_6 then
					arg_497_1.talkMaxDuration = var_500_6

					if var_500_6 + var_500_0 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_6 + var_500_0
					end
				end

				arg_497_1.text_.text = var_500_3
				arg_497_1.typewritter.percent = 0

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(false)
				arg_497_1:RecordContent(arg_497_1.text_.text)
			end

			local var_500_7 = math.max(var_500_1, arg_497_1.talkMaxDuration)

			if var_500_0 <= arg_497_1.time_ and arg_497_1.time_ < var_500_0 + var_500_7 then
				arg_497_1.typewritter.percent = (arg_497_1.time_ - var_500_0) / var_500_7

				arg_497_1.typewritter:SetDirty()
			end

			if arg_497_1.time_ >= var_500_0 + var_500_7 and arg_497_1.time_ < var_500_0 + var_500_7 + arg_500_0 then
				arg_497_1.typewritter.percent = 1

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(true)
			end
		end
	end,
	Play120011124 = function(arg_501_0, arg_501_1)
		arg_501_1.time_ = 0
		arg_501_1.frameCnt_ = 0
		arg_501_1.state_ = "playing"
		arg_501_1.curTalkId_ = 120011124
		arg_501_1.duration_ = 5

		SetActive(arg_501_1.tipsGo_, false)

		function arg_501_1.onSingleLineFinish_()
			arg_501_1.onSingleLineUpdate_ = nil
			arg_501_1.onSingleLineFinish_ = nil
			arg_501_1.state_ = "waiting"
		end

		function arg_501_1.playNext_(arg_503_0)
			if arg_503_0 == 1 then
				arg_501_0:Play120011125(arg_501_1)
			end
		end

		function arg_501_1.onSingleLineUpdate_(arg_504_0)
			local var_504_0 = 0
			local var_504_1 = 0.85

			if var_504_0 < arg_501_1.time_ and arg_501_1.time_ <= var_504_0 + arg_504_0 then
				arg_501_1.talkMaxDuration = 0
				arg_501_1.dialogCg_.alpha = 1

				arg_501_1.dialog_:SetActive(true)
				SetActive(arg_501_1.leftNameGo_, true)

				local var_504_2 = arg_501_1:FormatText(StoryNameCfg[7].name)

				arg_501_1.leftNameTxt_.text = var_504_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_501_1.leftNameTxt_.transform)

				arg_501_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_501_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_501_1:RecordName(arg_501_1.leftNameTxt_.text)
				SetActive(arg_501_1.iconTrs_.gameObject, false)
				arg_501_1.callingController_:SetSelectedState("normal")

				local var_504_3 = arg_501_1:GetWordFromCfg(120011124)
				local var_504_4 = arg_501_1:FormatText(var_504_3.content)

				arg_501_1.text_.text = var_504_4

				LuaForUtil.ClearLinePrefixSymbol(arg_501_1.text_)

				local var_504_5 = 34
				local var_504_6 = utf8.len(var_504_4)
				local var_504_7 = var_504_5 <= 0 and var_504_1 or var_504_1 * (var_504_6 / var_504_5)

				if var_504_7 > 0 and var_504_1 < var_504_7 then
					arg_501_1.talkMaxDuration = var_504_7

					if var_504_7 + var_504_0 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_7 + var_504_0
					end
				end

				arg_501_1.text_.text = var_504_4
				arg_501_1.typewritter.percent = 0

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(false)
				arg_501_1:RecordContent(arg_501_1.text_.text)
			end

			local var_504_8 = math.max(var_504_1, arg_501_1.talkMaxDuration)

			if var_504_0 <= arg_501_1.time_ and arg_501_1.time_ < var_504_0 + var_504_8 then
				arg_501_1.typewritter.percent = (arg_501_1.time_ - var_504_0) / var_504_8

				arg_501_1.typewritter:SetDirty()
			end

			if arg_501_1.time_ >= var_504_0 + var_504_8 and arg_501_1.time_ < var_504_0 + var_504_8 + arg_504_0 then
				arg_501_1.typewritter.percent = 1

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(true)
			end
		end
	end,
	Play120011125 = function(arg_505_0, arg_505_1)
		arg_505_1.time_ = 0
		arg_505_1.frameCnt_ = 0
		arg_505_1.state_ = "playing"
		arg_505_1.curTalkId_ = 120011125
		arg_505_1.duration_ = 5

		SetActive(arg_505_1.tipsGo_, false)

		function arg_505_1.onSingleLineFinish_()
			arg_505_1.onSingleLineUpdate_ = nil
			arg_505_1.onSingleLineFinish_ = nil
			arg_505_1.state_ = "waiting"
		end

		function arg_505_1.playNext_(arg_507_0)
			if arg_507_0 == 1 then
				arg_505_0:Play120011126(arg_505_1)
			end
		end

		function arg_505_1.onSingleLineUpdate_(arg_508_0)
			local var_508_0 = 0
			local var_508_1 = 0.875

			if var_508_0 < arg_505_1.time_ and arg_505_1.time_ <= var_508_0 + arg_508_0 then
				arg_505_1.talkMaxDuration = 0
				arg_505_1.dialogCg_.alpha = 1

				arg_505_1.dialog_:SetActive(true)
				SetActive(arg_505_1.leftNameGo_, false)

				arg_505_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_505_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_505_1:RecordName(arg_505_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_505_1.iconTrs_.gameObject, false)
				arg_505_1.callingController_:SetSelectedState("normal")

				local var_508_2 = arg_505_1:GetWordFromCfg(120011125)
				local var_508_3 = arg_505_1:FormatText(var_508_2.content)

				arg_505_1.text_.text = var_508_3

				LuaForUtil.ClearLinePrefixSymbol(arg_505_1.text_)

				local var_508_4 = 35
				local var_508_5 = utf8.len(var_508_3)
				local var_508_6 = var_508_4 <= 0 and var_508_1 or var_508_1 * (var_508_5 / var_508_4)

				if var_508_6 > 0 and var_508_1 < var_508_6 then
					arg_505_1.talkMaxDuration = var_508_6

					if var_508_6 + var_508_0 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_6 + var_508_0
					end
				end

				arg_505_1.text_.text = var_508_3
				arg_505_1.typewritter.percent = 0

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(false)
				arg_505_1:RecordContent(arg_505_1.text_.text)
			end

			local var_508_7 = math.max(var_508_1, arg_505_1.talkMaxDuration)

			if var_508_0 <= arg_505_1.time_ and arg_505_1.time_ < var_508_0 + var_508_7 then
				arg_505_1.typewritter.percent = (arg_505_1.time_ - var_508_0) / var_508_7

				arg_505_1.typewritter:SetDirty()
			end

			if arg_505_1.time_ >= var_508_0 + var_508_7 and arg_505_1.time_ < var_508_0 + var_508_7 + arg_508_0 then
				arg_505_1.typewritter.percent = 1

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(true)
			end
		end
	end,
	Play120011126 = function(arg_509_0, arg_509_1)
		arg_509_1.time_ = 0
		arg_509_1.frameCnt_ = 0
		arg_509_1.state_ = "playing"
		arg_509_1.curTalkId_ = 120011126
		arg_509_1.duration_ = 7.533

		local var_509_0 = {
			zh = 7.533,
			ja = 5.1
		}
		local var_509_1 = manager.audio:GetLocalizationFlag()

		if var_509_0[var_509_1] ~= nil then
			arg_509_1.duration_ = var_509_0[var_509_1]
		end

		SetActive(arg_509_1.tipsGo_, false)

		function arg_509_1.onSingleLineFinish_()
			arg_509_1.onSingleLineUpdate_ = nil
			arg_509_1.onSingleLineFinish_ = nil
			arg_509_1.state_ = "waiting"
		end

		function arg_509_1.playNext_(arg_511_0)
			if arg_511_0 == 1 then
				arg_509_0:Play120011127(arg_509_1)
			end
		end

		function arg_509_1.onSingleLineUpdate_(arg_512_0)
			local var_512_0 = 0
			local var_512_1 = 0.875

			if var_512_0 < arg_509_1.time_ and arg_509_1.time_ <= var_512_0 + arg_512_0 then
				arg_509_1.talkMaxDuration = 0
				arg_509_1.dialogCg_.alpha = 1

				arg_509_1.dialog_:SetActive(true)
				SetActive(arg_509_1.leftNameGo_, true)

				local var_512_2 = arg_509_1:FormatText(StoryNameCfg[6].name)

				arg_509_1.leftNameTxt_.text = var_512_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_509_1.leftNameTxt_.transform)

				arg_509_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_509_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_509_1:RecordName(arg_509_1.leftNameTxt_.text)
				SetActive(arg_509_1.iconTrs_.gameObject, true)
				arg_509_1.iconController_:SetSelectedState("hero")

				arg_509_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_509_1.callingController_:SetSelectedState("normal")

				local var_512_3 = arg_509_1:GetWordFromCfg(120011126)
				local var_512_4 = arg_509_1:FormatText(var_512_3.content)

				arg_509_1.text_.text = var_512_4

				LuaForUtil.ClearLinePrefixSymbol(arg_509_1.text_)

				local var_512_5 = 35
				local var_512_6 = utf8.len(var_512_4)
				local var_512_7 = var_512_5 <= 0 and var_512_1 or var_512_1 * (var_512_6 / var_512_5)

				if var_512_7 > 0 and var_512_1 < var_512_7 then
					arg_509_1.talkMaxDuration = var_512_7

					if var_512_7 + var_512_0 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_7 + var_512_0
					end
				end

				arg_509_1.text_.text = var_512_4
				arg_509_1.typewritter.percent = 0

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011126", "story_v_out_120011.awb") ~= 0 then
					local var_512_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011126", "story_v_out_120011.awb") / 1000

					if var_512_8 + var_512_0 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_8 + var_512_0
					end

					if var_512_3.prefab_name ~= "" and arg_509_1.actors_[var_512_3.prefab_name] ~= nil then
						local var_512_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_509_1.actors_[var_512_3.prefab_name].transform, "story_v_out_120011", "120011126", "story_v_out_120011.awb")

						arg_509_1:RecordAudio("120011126", var_512_9)
						arg_509_1:RecordAudio("120011126", var_512_9)
					else
						arg_509_1:AudioAction("play", "voice", "story_v_out_120011", "120011126", "story_v_out_120011.awb")
					end

					arg_509_1:RecordHistoryTalkVoice("story_v_out_120011", "120011126", "story_v_out_120011.awb")
				end

				arg_509_1:RecordContent(arg_509_1.text_.text)
			end

			local var_512_10 = math.max(var_512_1, arg_509_1.talkMaxDuration)

			if var_512_0 <= arg_509_1.time_ and arg_509_1.time_ < var_512_0 + var_512_10 then
				arg_509_1.typewritter.percent = (arg_509_1.time_ - var_512_0) / var_512_10

				arg_509_1.typewritter:SetDirty()
			end

			if arg_509_1.time_ >= var_512_0 + var_512_10 and arg_509_1.time_ < var_512_0 + var_512_10 + arg_512_0 then
				arg_509_1.typewritter.percent = 1

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(true)
			end
		end
	end,
	Play120011127 = function(arg_513_0, arg_513_1)
		arg_513_1.time_ = 0
		arg_513_1.frameCnt_ = 0
		arg_513_1.state_ = "playing"
		arg_513_1.curTalkId_ = 120011127
		arg_513_1.duration_ = 11.366

		local var_513_0 = {
			zh = 10.066,
			ja = 11.366
		}
		local var_513_1 = manager.audio:GetLocalizationFlag()

		if var_513_0[var_513_1] ~= nil then
			arg_513_1.duration_ = var_513_0[var_513_1]
		end

		SetActive(arg_513_1.tipsGo_, false)

		function arg_513_1.onSingleLineFinish_()
			arg_513_1.onSingleLineUpdate_ = nil
			arg_513_1.onSingleLineFinish_ = nil
			arg_513_1.state_ = "waiting"
		end

		function arg_513_1.playNext_(arg_515_0)
			if arg_515_0 == 1 then
				arg_513_0:Play120011128(arg_513_1)
			end
		end

		function arg_513_1.onSingleLineUpdate_(arg_516_0)
			local var_516_0 = 0
			local var_516_1 = 1.075

			if var_516_0 < arg_513_1.time_ and arg_513_1.time_ <= var_516_0 + arg_516_0 then
				arg_513_1.talkMaxDuration = 0
				arg_513_1.dialogCg_.alpha = 1

				arg_513_1.dialog_:SetActive(true)
				SetActive(arg_513_1.leftNameGo_, true)

				local var_516_2 = arg_513_1:FormatText(StoryNameCfg[6].name)

				arg_513_1.leftNameTxt_.text = var_516_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_513_1.leftNameTxt_.transform)

				arg_513_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_513_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_513_1:RecordName(arg_513_1.leftNameTxt_.text)
				SetActive(arg_513_1.iconTrs_.gameObject, true)
				arg_513_1.iconController_:SetSelectedState("hero")

				arg_513_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_513_1.callingController_:SetSelectedState("normal")

				local var_516_3 = arg_513_1:GetWordFromCfg(120011127)
				local var_516_4 = arg_513_1:FormatText(var_516_3.content)

				arg_513_1.text_.text = var_516_4

				LuaForUtil.ClearLinePrefixSymbol(arg_513_1.text_)

				local var_516_5 = 43
				local var_516_6 = utf8.len(var_516_4)
				local var_516_7 = var_516_5 <= 0 and var_516_1 or var_516_1 * (var_516_6 / var_516_5)

				if var_516_7 > 0 and var_516_1 < var_516_7 then
					arg_513_1.talkMaxDuration = var_516_7

					if var_516_7 + var_516_0 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_7 + var_516_0
					end
				end

				arg_513_1.text_.text = var_516_4
				arg_513_1.typewritter.percent = 0

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011127", "story_v_out_120011.awb") ~= 0 then
					local var_516_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011127", "story_v_out_120011.awb") / 1000

					if var_516_8 + var_516_0 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_8 + var_516_0
					end

					if var_516_3.prefab_name ~= "" and arg_513_1.actors_[var_516_3.prefab_name] ~= nil then
						local var_516_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_513_1.actors_[var_516_3.prefab_name].transform, "story_v_out_120011", "120011127", "story_v_out_120011.awb")

						arg_513_1:RecordAudio("120011127", var_516_9)
						arg_513_1:RecordAudio("120011127", var_516_9)
					else
						arg_513_1:AudioAction("play", "voice", "story_v_out_120011", "120011127", "story_v_out_120011.awb")
					end

					arg_513_1:RecordHistoryTalkVoice("story_v_out_120011", "120011127", "story_v_out_120011.awb")
				end

				arg_513_1:RecordContent(arg_513_1.text_.text)
			end

			local var_516_10 = math.max(var_516_1, arg_513_1.talkMaxDuration)

			if var_516_0 <= arg_513_1.time_ and arg_513_1.time_ < var_516_0 + var_516_10 then
				arg_513_1.typewritter.percent = (arg_513_1.time_ - var_516_0) / var_516_10

				arg_513_1.typewritter:SetDirty()
			end

			if arg_513_1.time_ >= var_516_0 + var_516_10 and arg_513_1.time_ < var_516_0 + var_516_10 + arg_516_0 then
				arg_513_1.typewritter.percent = 1

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(true)
			end
		end
	end,
	Play120011128 = function(arg_517_0, arg_517_1)
		arg_517_1.time_ = 0
		arg_517_1.frameCnt_ = 0
		arg_517_1.state_ = "playing"
		arg_517_1.curTalkId_ = 120011128
		arg_517_1.duration_ = 5

		SetActive(arg_517_1.tipsGo_, false)

		function arg_517_1.onSingleLineFinish_()
			arg_517_1.onSingleLineUpdate_ = nil
			arg_517_1.onSingleLineFinish_ = nil
			arg_517_1.state_ = "waiting"
		end

		function arg_517_1.playNext_(arg_519_0)
			if arg_519_0 == 1 then
				arg_517_0:Play120011129(arg_517_1)
			end
		end

		function arg_517_1.onSingleLineUpdate_(arg_520_0)
			local var_520_0 = 0
			local var_520_1 = 1.175

			if var_520_0 < arg_517_1.time_ and arg_517_1.time_ <= var_520_0 + arg_520_0 then
				arg_517_1.talkMaxDuration = 0
				arg_517_1.dialogCg_.alpha = 1

				arg_517_1.dialog_:SetActive(true)
				SetActive(arg_517_1.leftNameGo_, true)

				local var_520_2 = arg_517_1:FormatText(StoryNameCfg[7].name)

				arg_517_1.leftNameTxt_.text = var_520_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_517_1.leftNameTxt_.transform)

				arg_517_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_517_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_517_1:RecordName(arg_517_1.leftNameTxt_.text)
				SetActive(arg_517_1.iconTrs_.gameObject, false)
				arg_517_1.callingController_:SetSelectedState("normal")

				local var_520_3 = arg_517_1:GetWordFromCfg(120011128)
				local var_520_4 = arg_517_1:FormatText(var_520_3.content)

				arg_517_1.text_.text = var_520_4

				LuaForUtil.ClearLinePrefixSymbol(arg_517_1.text_)

				local var_520_5 = 48
				local var_520_6 = utf8.len(var_520_4)
				local var_520_7 = var_520_5 <= 0 and var_520_1 or var_520_1 * (var_520_6 / var_520_5)

				if var_520_7 > 0 and var_520_1 < var_520_7 then
					arg_517_1.talkMaxDuration = var_520_7

					if var_520_7 + var_520_0 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_7 + var_520_0
					end
				end

				arg_517_1.text_.text = var_520_4
				arg_517_1.typewritter.percent = 0

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(false)
				arg_517_1:RecordContent(arg_517_1.text_.text)
			end

			local var_520_8 = math.max(var_520_1, arg_517_1.talkMaxDuration)

			if var_520_0 <= arg_517_1.time_ and arg_517_1.time_ < var_520_0 + var_520_8 then
				arg_517_1.typewritter.percent = (arg_517_1.time_ - var_520_0) / var_520_8

				arg_517_1.typewritter:SetDirty()
			end

			if arg_517_1.time_ >= var_520_0 + var_520_8 and arg_517_1.time_ < var_520_0 + var_520_8 + arg_520_0 then
				arg_517_1.typewritter.percent = 1

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(true)
			end
		end
	end,
	Play120011129 = function(arg_521_0, arg_521_1)
		arg_521_1.time_ = 0
		arg_521_1.frameCnt_ = 0
		arg_521_1.state_ = "playing"
		arg_521_1.curTalkId_ = 120011129
		arg_521_1.duration_ = 5

		SetActive(arg_521_1.tipsGo_, false)

		function arg_521_1.onSingleLineFinish_()
			arg_521_1.onSingleLineUpdate_ = nil
			arg_521_1.onSingleLineFinish_ = nil
			arg_521_1.state_ = "waiting"
		end

		function arg_521_1.playNext_(arg_523_0)
			if arg_523_0 == 1 then
				arg_521_0:Play120011130(arg_521_1)
			end
		end

		function arg_521_1.onSingleLineUpdate_(arg_524_0)
			local var_524_0 = 0
			local var_524_1 = 0.8

			if var_524_0 < arg_521_1.time_ and arg_521_1.time_ <= var_524_0 + arg_524_0 then
				arg_521_1.talkMaxDuration = 0
				arg_521_1.dialogCg_.alpha = 1

				arg_521_1.dialog_:SetActive(true)
				SetActive(arg_521_1.leftNameGo_, true)

				local var_524_2 = arg_521_1:FormatText(StoryNameCfg[7].name)

				arg_521_1.leftNameTxt_.text = var_524_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_521_1.leftNameTxt_.transform)

				arg_521_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_521_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_521_1:RecordName(arg_521_1.leftNameTxt_.text)
				SetActive(arg_521_1.iconTrs_.gameObject, false)
				arg_521_1.callingController_:SetSelectedState("normal")

				local var_524_3 = arg_521_1:GetWordFromCfg(120011129)
				local var_524_4 = arg_521_1:FormatText(var_524_3.content)

				arg_521_1.text_.text = var_524_4

				LuaForUtil.ClearLinePrefixSymbol(arg_521_1.text_)

				local var_524_5 = 32
				local var_524_6 = utf8.len(var_524_4)
				local var_524_7 = var_524_5 <= 0 and var_524_1 or var_524_1 * (var_524_6 / var_524_5)

				if var_524_7 > 0 and var_524_1 < var_524_7 then
					arg_521_1.talkMaxDuration = var_524_7

					if var_524_7 + var_524_0 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_7 + var_524_0
					end
				end

				arg_521_1.text_.text = var_524_4
				arg_521_1.typewritter.percent = 0

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(false)
				arg_521_1:RecordContent(arg_521_1.text_.text)
			end

			local var_524_8 = math.max(var_524_1, arg_521_1.talkMaxDuration)

			if var_524_0 <= arg_521_1.time_ and arg_521_1.time_ < var_524_0 + var_524_8 then
				arg_521_1.typewritter.percent = (arg_521_1.time_ - var_524_0) / var_524_8

				arg_521_1.typewritter:SetDirty()
			end

			if arg_521_1.time_ >= var_524_0 + var_524_8 and arg_521_1.time_ < var_524_0 + var_524_8 + arg_524_0 then
				arg_521_1.typewritter.percent = 1

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(true)
			end
		end
	end,
	Play120011130 = function(arg_525_0, arg_525_1)
		arg_525_1.time_ = 0
		arg_525_1.frameCnt_ = 0
		arg_525_1.state_ = "playing"
		arg_525_1.curTalkId_ = 120011130
		arg_525_1.duration_ = 6.833

		local var_525_0 = {
			zh = 4.966,
			ja = 6.833
		}
		local var_525_1 = manager.audio:GetLocalizationFlag()

		if var_525_0[var_525_1] ~= nil then
			arg_525_1.duration_ = var_525_0[var_525_1]
		end

		SetActive(arg_525_1.tipsGo_, false)

		function arg_525_1.onSingleLineFinish_()
			arg_525_1.onSingleLineUpdate_ = nil
			arg_525_1.onSingleLineFinish_ = nil
			arg_525_1.state_ = "waiting"
		end

		function arg_525_1.playNext_(arg_527_0)
			if arg_527_0 == 1 then
				arg_525_0:Play120011131(arg_525_1)
			end
		end

		function arg_525_1.onSingleLineUpdate_(arg_528_0)
			local var_528_0 = 0
			local var_528_1 = 0.325

			if var_528_0 < arg_525_1.time_ and arg_525_1.time_ <= var_528_0 + arg_528_0 then
				arg_525_1.talkMaxDuration = 0
				arg_525_1.dialogCg_.alpha = 1

				arg_525_1.dialog_:SetActive(true)
				SetActive(arg_525_1.leftNameGo_, true)

				local var_528_2 = arg_525_1:FormatText(StoryNameCfg[6].name)

				arg_525_1.leftNameTxt_.text = var_528_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_525_1.leftNameTxt_.transform)

				arg_525_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_525_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_525_1:RecordName(arg_525_1.leftNameTxt_.text)
				SetActive(arg_525_1.iconTrs_.gameObject, true)
				arg_525_1.iconController_:SetSelectedState("hero")

				arg_525_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_525_1.callingController_:SetSelectedState("normal")

				local var_528_3 = arg_525_1:GetWordFromCfg(120011130)
				local var_528_4 = arg_525_1:FormatText(var_528_3.content)

				arg_525_1.text_.text = var_528_4

				LuaForUtil.ClearLinePrefixSymbol(arg_525_1.text_)

				local var_528_5 = 13
				local var_528_6 = utf8.len(var_528_4)
				local var_528_7 = var_528_5 <= 0 and var_528_1 or var_528_1 * (var_528_6 / var_528_5)

				if var_528_7 > 0 and var_528_1 < var_528_7 then
					arg_525_1.talkMaxDuration = var_528_7

					if var_528_7 + var_528_0 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_7 + var_528_0
					end
				end

				arg_525_1.text_.text = var_528_4
				arg_525_1.typewritter.percent = 0

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011130", "story_v_out_120011.awb") ~= 0 then
					local var_528_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011130", "story_v_out_120011.awb") / 1000

					if var_528_8 + var_528_0 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_8 + var_528_0
					end

					if var_528_3.prefab_name ~= "" and arg_525_1.actors_[var_528_3.prefab_name] ~= nil then
						local var_528_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_525_1.actors_[var_528_3.prefab_name].transform, "story_v_out_120011", "120011130", "story_v_out_120011.awb")

						arg_525_1:RecordAudio("120011130", var_528_9)
						arg_525_1:RecordAudio("120011130", var_528_9)
					else
						arg_525_1:AudioAction("play", "voice", "story_v_out_120011", "120011130", "story_v_out_120011.awb")
					end

					arg_525_1:RecordHistoryTalkVoice("story_v_out_120011", "120011130", "story_v_out_120011.awb")
				end

				arg_525_1:RecordContent(arg_525_1.text_.text)
			end

			local var_528_10 = math.max(var_528_1, arg_525_1.talkMaxDuration)

			if var_528_0 <= arg_525_1.time_ and arg_525_1.time_ < var_528_0 + var_528_10 then
				arg_525_1.typewritter.percent = (arg_525_1.time_ - var_528_0) / var_528_10

				arg_525_1.typewritter:SetDirty()
			end

			if arg_525_1.time_ >= var_528_0 + var_528_10 and arg_525_1.time_ < var_528_0 + var_528_10 + arg_528_0 then
				arg_525_1.typewritter.percent = 1

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(true)
			end
		end
	end,
	Play120011131 = function(arg_529_0, arg_529_1)
		arg_529_1.time_ = 0
		arg_529_1.frameCnt_ = 0
		arg_529_1.state_ = "playing"
		arg_529_1.curTalkId_ = 120011131
		arg_529_1.duration_ = 5

		SetActive(arg_529_1.tipsGo_, false)

		function arg_529_1.onSingleLineFinish_()
			arg_529_1.onSingleLineUpdate_ = nil
			arg_529_1.onSingleLineFinish_ = nil
			arg_529_1.state_ = "waiting"
		end

		function arg_529_1.playNext_(arg_531_0)
			if arg_531_0 == 1 then
				arg_529_0:Play120011132(arg_529_1)
			end
		end

		function arg_529_1.onSingleLineUpdate_(arg_532_0)
			local var_532_0 = 0
			local var_532_1 = 0.4

			if var_532_0 < arg_529_1.time_ and arg_529_1.time_ <= var_532_0 + arg_532_0 then
				arg_529_1.talkMaxDuration = 0
				arg_529_1.dialogCg_.alpha = 1

				arg_529_1.dialog_:SetActive(true)
				SetActive(arg_529_1.leftNameGo_, true)

				local var_532_2 = arg_529_1:FormatText(StoryNameCfg[7].name)

				arg_529_1.leftNameTxt_.text = var_532_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_529_1.leftNameTxt_.transform)

				arg_529_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_529_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_529_1:RecordName(arg_529_1.leftNameTxt_.text)
				SetActive(arg_529_1.iconTrs_.gameObject, false)
				arg_529_1.callingController_:SetSelectedState("normal")

				local var_532_3 = arg_529_1:GetWordFromCfg(120011131)
				local var_532_4 = arg_529_1:FormatText(var_532_3.content)

				arg_529_1.text_.text = var_532_4

				LuaForUtil.ClearLinePrefixSymbol(arg_529_1.text_)

				local var_532_5 = 16
				local var_532_6 = utf8.len(var_532_4)
				local var_532_7 = var_532_5 <= 0 and var_532_1 or var_532_1 * (var_532_6 / var_532_5)

				if var_532_7 > 0 and var_532_1 < var_532_7 then
					arg_529_1.talkMaxDuration = var_532_7

					if var_532_7 + var_532_0 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_7 + var_532_0
					end
				end

				arg_529_1.text_.text = var_532_4
				arg_529_1.typewritter.percent = 0

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(false)
				arg_529_1:RecordContent(arg_529_1.text_.text)
			end

			local var_532_8 = math.max(var_532_1, arg_529_1.talkMaxDuration)

			if var_532_0 <= arg_529_1.time_ and arg_529_1.time_ < var_532_0 + var_532_8 then
				arg_529_1.typewritter.percent = (arg_529_1.time_ - var_532_0) / var_532_8

				arg_529_1.typewritter:SetDirty()
			end

			if arg_529_1.time_ >= var_532_0 + var_532_8 and arg_529_1.time_ < var_532_0 + var_532_8 + arg_532_0 then
				arg_529_1.typewritter.percent = 1

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(true)
			end
		end
	end,
	Play120011132 = function(arg_533_0, arg_533_1)
		arg_533_1.time_ = 0
		arg_533_1.frameCnt_ = 0
		arg_533_1.state_ = "playing"
		arg_533_1.curTalkId_ = 120011132
		arg_533_1.duration_ = 9

		SetActive(arg_533_1.tipsGo_, false)

		function arg_533_1.onSingleLineFinish_()
			arg_533_1.onSingleLineUpdate_ = nil
			arg_533_1.onSingleLineFinish_ = nil
			arg_533_1.state_ = "waiting"
		end

		function arg_533_1.playNext_(arg_535_0)
			if arg_535_0 == 1 then
				arg_533_0:Play120011133(arg_533_1)
			end
		end

		function arg_533_1.onSingleLineUpdate_(arg_536_0)
			local var_536_0 = 2

			if var_536_0 < arg_533_1.time_ and arg_533_1.time_ <= var_536_0 + arg_536_0 then
				local var_536_1 = manager.ui.mainCamera.transform.localPosition
				local var_536_2 = Vector3.New(0, 0, 10) + Vector3.New(var_536_1.x, var_536_1.y, 0)
				local var_536_3 = arg_533_1.bgs_.ST31

				var_536_3.transform.localPosition = var_536_2
				var_536_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_536_4 = var_536_3:GetComponent("SpriteRenderer")

				if var_536_4 and var_536_4.sprite then
					local var_536_5 = (var_536_3.transform.localPosition - var_536_1).z
					local var_536_6 = manager.ui.mainCameraCom_
					local var_536_7 = 2 * var_536_5 * Mathf.Tan(var_536_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_536_8 = var_536_7 * var_536_6.aspect
					local var_536_9 = var_536_4.sprite.bounds.size.x
					local var_536_10 = var_536_4.sprite.bounds.size.y
					local var_536_11 = var_536_8 / var_536_9
					local var_536_12 = var_536_7 / var_536_10
					local var_536_13 = var_536_12 < var_536_11 and var_536_11 or var_536_12

					var_536_3.transform.localScale = Vector3.New(var_536_13, var_536_13, 0)
				end

				for iter_536_0, iter_536_1 in pairs(arg_533_1.bgs_) do
					if iter_536_0 ~= "ST31" then
						iter_536_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_536_14 = 0

			if var_536_14 < arg_533_1.time_ and arg_533_1.time_ <= var_536_14 + arg_536_0 then
				arg_533_1.mask_.enabled = true
				arg_533_1.mask_.raycastTarget = true

				arg_533_1:SetGaussion(false)
			end

			local var_536_15 = 2

			if var_536_14 <= arg_533_1.time_ and arg_533_1.time_ < var_536_14 + var_536_15 then
				local var_536_16 = (arg_533_1.time_ - var_536_14) / var_536_15
				local var_536_17 = Color.New(0, 0, 0)

				var_536_17.a = Mathf.Lerp(0, 1, var_536_16)
				arg_533_1.mask_.color = var_536_17
			end

			if arg_533_1.time_ >= var_536_14 + var_536_15 and arg_533_1.time_ < var_536_14 + var_536_15 + arg_536_0 then
				local var_536_18 = Color.New(0, 0, 0)

				var_536_18.a = 1
				arg_533_1.mask_.color = var_536_18
			end

			local var_536_19 = 2

			if var_536_19 < arg_533_1.time_ and arg_533_1.time_ <= var_536_19 + arg_536_0 then
				arg_533_1.mask_.enabled = true
				arg_533_1.mask_.raycastTarget = true

				arg_533_1:SetGaussion(false)
			end

			local var_536_20 = 2

			if var_536_19 <= arg_533_1.time_ and arg_533_1.time_ < var_536_19 + var_536_20 then
				local var_536_21 = (arg_533_1.time_ - var_536_19) / var_536_20
				local var_536_22 = Color.New(0, 0, 0)

				var_536_22.a = Mathf.Lerp(1, 0, var_536_21)
				arg_533_1.mask_.color = var_536_22
			end

			if arg_533_1.time_ >= var_536_19 + var_536_20 and arg_533_1.time_ < var_536_19 + var_536_20 + arg_536_0 then
				local var_536_23 = Color.New(0, 0, 0)
				local var_536_24 = 0

				arg_533_1.mask_.enabled = false
				var_536_23.a = var_536_24
				arg_533_1.mask_.color = var_536_23
			end

			if arg_533_1.frameCnt_ <= 1 then
				arg_533_1.dialog_:SetActive(false)
			end

			local var_536_25 = 4
			local var_536_26 = 0.625

			if var_536_25 < arg_533_1.time_ and arg_533_1.time_ <= var_536_25 + arg_536_0 then
				arg_533_1.talkMaxDuration = 0

				arg_533_1.dialog_:SetActive(true)

				local var_536_27 = LeanTween.value(arg_533_1.dialog_, 0, 1, 0.3)

				var_536_27:setOnUpdate(LuaHelper.FloatAction(function(arg_537_0)
					arg_533_1.dialogCg_.alpha = arg_537_0
				end))
				var_536_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_533_1.dialog_)
					var_536_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_533_1.duration_ = arg_533_1.duration_ + 0.3

				SetActive(arg_533_1.leftNameGo_, false)

				arg_533_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_533_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_533_1:RecordName(arg_533_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_533_1.iconTrs_.gameObject, false)
				arg_533_1.callingController_:SetSelectedState("normal")

				local var_536_28 = arg_533_1:GetWordFromCfg(120011132)
				local var_536_29 = arg_533_1:FormatText(var_536_28.content)

				arg_533_1.text_.text = var_536_29

				LuaForUtil.ClearLinePrefixSymbol(arg_533_1.text_)

				local var_536_30 = 25
				local var_536_31 = utf8.len(var_536_29)
				local var_536_32 = var_536_30 <= 0 and var_536_26 or var_536_26 * (var_536_31 / var_536_30)

				if var_536_32 > 0 and var_536_26 < var_536_32 then
					arg_533_1.talkMaxDuration = var_536_32
					var_536_25 = var_536_25 + 0.3

					if var_536_32 + var_536_25 > arg_533_1.duration_ then
						arg_533_1.duration_ = var_536_32 + var_536_25
					end
				end

				arg_533_1.text_.text = var_536_29
				arg_533_1.typewritter.percent = 0

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(false)
				arg_533_1:RecordContent(arg_533_1.text_.text)
			end

			local var_536_33 = var_536_25 + 0.3
			local var_536_34 = math.max(var_536_26, arg_533_1.talkMaxDuration)

			if var_536_33 <= arg_533_1.time_ and arg_533_1.time_ < var_536_33 + var_536_34 then
				arg_533_1.typewritter.percent = (arg_533_1.time_ - var_536_33) / var_536_34

				arg_533_1.typewritter:SetDirty()
			end

			if arg_533_1.time_ >= var_536_33 + var_536_34 and arg_533_1.time_ < var_536_33 + var_536_34 + arg_536_0 then
				arg_533_1.typewritter.percent = 1

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(true)
			end
		end
	end,
	Play120011133 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 120011133
		arg_539_1.duration_ = 8.366

		local var_539_0 = {
			zh = 8.1,
			ja = 8.366
		}
		local var_539_1 = manager.audio:GetLocalizationFlag()

		if var_539_0[var_539_1] ~= nil then
			arg_539_1.duration_ = var_539_0[var_539_1]
		end

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play120011134(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = arg_539_1.actors_["1084ui_story"].transform
			local var_542_1 = 0

			if var_542_1 < arg_539_1.time_ and arg_539_1.time_ <= var_542_1 + arg_542_0 then
				arg_539_1.var_.moveOldPos1084ui_story = var_542_0.localPosition
			end

			local var_542_2 = 0.001

			if var_542_1 <= arg_539_1.time_ and arg_539_1.time_ < var_542_1 + var_542_2 then
				local var_542_3 = (arg_539_1.time_ - var_542_1) / var_542_2
				local var_542_4 = Vector3.New(0, -0.97, -6)

				var_542_0.localPosition = Vector3.Lerp(arg_539_1.var_.moveOldPos1084ui_story, var_542_4, var_542_3)

				local var_542_5 = manager.ui.mainCamera.transform.position - var_542_0.position

				var_542_0.forward = Vector3.New(var_542_5.x, var_542_5.y, var_542_5.z)

				local var_542_6 = var_542_0.localEulerAngles

				var_542_6.z = 0
				var_542_6.x = 0
				var_542_0.localEulerAngles = var_542_6
			end

			if arg_539_1.time_ >= var_542_1 + var_542_2 and arg_539_1.time_ < var_542_1 + var_542_2 + arg_542_0 then
				var_542_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_542_7 = manager.ui.mainCamera.transform.position - var_542_0.position

				var_542_0.forward = Vector3.New(var_542_7.x, var_542_7.y, var_542_7.z)

				local var_542_8 = var_542_0.localEulerAngles

				var_542_8.z = 0
				var_542_8.x = 0
				var_542_0.localEulerAngles = var_542_8
			end

			local var_542_9 = arg_539_1.actors_["1084ui_story"]
			local var_542_10 = 0

			if var_542_10 < arg_539_1.time_ and arg_539_1.time_ <= var_542_10 + arg_542_0 and arg_539_1.var_.characterEffect1084ui_story == nil then
				arg_539_1.var_.characterEffect1084ui_story = var_542_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_542_11 = 0.2

			if var_542_10 <= arg_539_1.time_ and arg_539_1.time_ < var_542_10 + var_542_11 then
				local var_542_12 = (arg_539_1.time_ - var_542_10) / var_542_11

				if arg_539_1.var_.characterEffect1084ui_story then
					arg_539_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_539_1.time_ >= var_542_10 + var_542_11 and arg_539_1.time_ < var_542_10 + var_542_11 + arg_542_0 and arg_539_1.var_.characterEffect1084ui_story then
				arg_539_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_542_13 = 0

			if var_542_13 < arg_539_1.time_ and arg_539_1.time_ <= var_542_13 + arg_542_0 then
				arg_539_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_1")
			end

			local var_542_14 = 0

			if var_542_14 < arg_539_1.time_ and arg_539_1.time_ <= var_542_14 + arg_542_0 then
				arg_539_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_542_15 = 0
			local var_542_16 = 0.9

			if var_542_15 < arg_539_1.time_ and arg_539_1.time_ <= var_542_15 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0
				arg_539_1.dialogCg_.alpha = 1

				arg_539_1.dialog_:SetActive(true)
				SetActive(arg_539_1.leftNameGo_, true)

				local var_542_17 = arg_539_1:FormatText(StoryNameCfg[6].name)

				arg_539_1.leftNameTxt_.text = var_542_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_539_1.leftNameTxt_.transform)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1.leftNameTxt_.text)
				SetActive(arg_539_1.iconTrs_.gameObject, false)
				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_18 = arg_539_1:GetWordFromCfg(120011133)
				local var_542_19 = arg_539_1:FormatText(var_542_18.content)

				arg_539_1.text_.text = var_542_19

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_20 = 36
				local var_542_21 = utf8.len(var_542_19)
				local var_542_22 = var_542_20 <= 0 and var_542_16 or var_542_16 * (var_542_21 / var_542_20)

				if var_542_22 > 0 and var_542_16 < var_542_22 then
					arg_539_1.talkMaxDuration = var_542_22

					if var_542_22 + var_542_15 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_22 + var_542_15
					end
				end

				arg_539_1.text_.text = var_542_19
				arg_539_1.typewritter.percent = 0

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011133", "story_v_out_120011.awb") ~= 0 then
					local var_542_23 = manager.audio:GetVoiceLength("story_v_out_120011", "120011133", "story_v_out_120011.awb") / 1000

					if var_542_23 + var_542_15 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_23 + var_542_15
					end

					if var_542_18.prefab_name ~= "" and arg_539_1.actors_[var_542_18.prefab_name] ~= nil then
						local var_542_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_539_1.actors_[var_542_18.prefab_name].transform, "story_v_out_120011", "120011133", "story_v_out_120011.awb")

						arg_539_1:RecordAudio("120011133", var_542_24)
						arg_539_1:RecordAudio("120011133", var_542_24)
					else
						arg_539_1:AudioAction("play", "voice", "story_v_out_120011", "120011133", "story_v_out_120011.awb")
					end

					arg_539_1:RecordHistoryTalkVoice("story_v_out_120011", "120011133", "story_v_out_120011.awb")
				end

				arg_539_1:RecordContent(arg_539_1.text_.text)
			end

			local var_542_25 = math.max(var_542_16, arg_539_1.talkMaxDuration)

			if var_542_15 <= arg_539_1.time_ and arg_539_1.time_ < var_542_15 + var_542_25 then
				arg_539_1.typewritter.percent = (arg_539_1.time_ - var_542_15) / var_542_25

				arg_539_1.typewritter:SetDirty()
			end

			if arg_539_1.time_ >= var_542_15 + var_542_25 and arg_539_1.time_ < var_542_15 + var_542_25 + arg_542_0 then
				arg_539_1.typewritter.percent = 1

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(true)
			end
		end
	end,
	Play120011134 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 120011134
		arg_543_1.duration_ = 5

		SetActive(arg_543_1.tipsGo_, false)

		function arg_543_1.onSingleLineFinish_()
			arg_543_1.onSingleLineUpdate_ = nil
			arg_543_1.onSingleLineFinish_ = nil
			arg_543_1.state_ = "waiting"
		end

		function arg_543_1.playNext_(arg_545_0)
			if arg_545_0 == 1 then
				arg_543_0:Play120011135(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = arg_543_1.actors_["1084ui_story"]
			local var_546_1 = 0

			if var_546_1 < arg_543_1.time_ and arg_543_1.time_ <= var_546_1 + arg_546_0 and arg_543_1.var_.characterEffect1084ui_story == nil then
				arg_543_1.var_.characterEffect1084ui_story = var_546_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_546_2 = 0.2

			if var_546_1 <= arg_543_1.time_ and arg_543_1.time_ < var_546_1 + var_546_2 then
				local var_546_3 = (arg_543_1.time_ - var_546_1) / var_546_2

				if arg_543_1.var_.characterEffect1084ui_story then
					local var_546_4 = Mathf.Lerp(0, 0.5, var_546_3)

					arg_543_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_543_1.var_.characterEffect1084ui_story.fillRatio = var_546_4
				end
			end

			if arg_543_1.time_ >= var_546_1 + var_546_2 and arg_543_1.time_ < var_546_1 + var_546_2 + arg_546_0 and arg_543_1.var_.characterEffect1084ui_story then
				local var_546_5 = 0.5

				arg_543_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_543_1.var_.characterEffect1084ui_story.fillRatio = var_546_5
			end

			local var_546_6 = 0
			local var_546_7 = 0.6

			if var_546_6 < arg_543_1.time_ and arg_543_1.time_ <= var_546_6 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, true)

				local var_546_8 = arg_543_1:FormatText(StoryNameCfg[7].name)

				arg_543_1.leftNameTxt_.text = var_546_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_543_1.leftNameTxt_.transform)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1.leftNameTxt_.text)
				SetActive(arg_543_1.iconTrs_.gameObject, false)
				arg_543_1.callingController_:SetSelectedState("normal")

				local var_546_9 = arg_543_1:GetWordFromCfg(120011134)
				local var_546_10 = arg_543_1:FormatText(var_546_9.content)

				arg_543_1.text_.text = var_546_10

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_11 = 24
				local var_546_12 = utf8.len(var_546_10)
				local var_546_13 = var_546_11 <= 0 and var_546_7 or var_546_7 * (var_546_12 / var_546_11)

				if var_546_13 > 0 and var_546_7 < var_546_13 then
					arg_543_1.talkMaxDuration = var_546_13

					if var_546_13 + var_546_6 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_13 + var_546_6
					end
				end

				arg_543_1.text_.text = var_546_10
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)
				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_14 = math.max(var_546_7, arg_543_1.talkMaxDuration)

			if var_546_6 <= arg_543_1.time_ and arg_543_1.time_ < var_546_6 + var_546_14 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_6) / var_546_14

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_6 + var_546_14 and arg_543_1.time_ < var_546_6 + var_546_14 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play120011135 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 120011135
		arg_547_1.duration_ = 5

		SetActive(arg_547_1.tipsGo_, false)

		function arg_547_1.onSingleLineFinish_()
			arg_547_1.onSingleLineUpdate_ = nil
			arg_547_1.onSingleLineFinish_ = nil
			arg_547_1.state_ = "waiting"
		end

		function arg_547_1.playNext_(arg_549_0)
			if arg_549_0 == 1 then
				arg_547_0:Play120011136(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = 0
			local var_550_1 = 0.925

			if var_550_0 < arg_547_1.time_ and arg_547_1.time_ <= var_550_0 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, true)

				local var_550_2 = arg_547_1:FormatText(StoryNameCfg[7].name)

				arg_547_1.leftNameTxt_.text = var_550_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_547_1.leftNameTxt_.transform)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1.leftNameTxt_.text)
				SetActive(arg_547_1.iconTrs_.gameObject, false)
				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_3 = arg_547_1:GetWordFromCfg(120011135)
				local var_550_4 = arg_547_1:FormatText(var_550_3.content)

				arg_547_1.text_.text = var_550_4

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_5 = 37
				local var_550_6 = utf8.len(var_550_4)
				local var_550_7 = var_550_5 <= 0 and var_550_1 or var_550_1 * (var_550_6 / var_550_5)

				if var_550_7 > 0 and var_550_1 < var_550_7 then
					arg_547_1.talkMaxDuration = var_550_7

					if var_550_7 + var_550_0 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_7 + var_550_0
					end
				end

				arg_547_1.text_.text = var_550_4
				arg_547_1.typewritter.percent = 0

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(false)
				arg_547_1:RecordContent(arg_547_1.text_.text)
			end

			local var_550_8 = math.max(var_550_1, arg_547_1.talkMaxDuration)

			if var_550_0 <= arg_547_1.time_ and arg_547_1.time_ < var_550_0 + var_550_8 then
				arg_547_1.typewritter.percent = (arg_547_1.time_ - var_550_0) / var_550_8

				arg_547_1.typewritter:SetDirty()
			end

			if arg_547_1.time_ >= var_550_0 + var_550_8 and arg_547_1.time_ < var_550_0 + var_550_8 + arg_550_0 then
				arg_547_1.typewritter.percent = 1

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(true)
			end
		end
	end,
	Play120011136 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 120011136
		arg_551_1.duration_ = 5.433

		local var_551_0 = {
			zh = 5.433,
			ja = 4.4
		}
		local var_551_1 = manager.audio:GetLocalizationFlag()

		if var_551_0[var_551_1] ~= nil then
			arg_551_1.duration_ = var_551_0[var_551_1]
		end

		SetActive(arg_551_1.tipsGo_, false)

		function arg_551_1.onSingleLineFinish_()
			arg_551_1.onSingleLineUpdate_ = nil
			arg_551_1.onSingleLineFinish_ = nil
			arg_551_1.state_ = "waiting"
		end

		function arg_551_1.playNext_(arg_553_0)
			if arg_553_0 == 1 then
				arg_551_0:Play120011137(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = arg_551_1.actors_["1084ui_story"].transform
			local var_554_1 = 0

			if var_554_1 < arg_551_1.time_ and arg_551_1.time_ <= var_554_1 + arg_554_0 then
				arg_551_1.var_.moveOldPos1084ui_story = var_554_0.localPosition
			end

			local var_554_2 = 0.001

			if var_554_1 <= arg_551_1.time_ and arg_551_1.time_ < var_554_1 + var_554_2 then
				local var_554_3 = (arg_551_1.time_ - var_554_1) / var_554_2
				local var_554_4 = Vector3.New(0, -0.97, -6)

				var_554_0.localPosition = Vector3.Lerp(arg_551_1.var_.moveOldPos1084ui_story, var_554_4, var_554_3)

				local var_554_5 = manager.ui.mainCamera.transform.position - var_554_0.position

				var_554_0.forward = Vector3.New(var_554_5.x, var_554_5.y, var_554_5.z)

				local var_554_6 = var_554_0.localEulerAngles

				var_554_6.z = 0
				var_554_6.x = 0
				var_554_0.localEulerAngles = var_554_6
			end

			if arg_551_1.time_ >= var_554_1 + var_554_2 and arg_551_1.time_ < var_554_1 + var_554_2 + arg_554_0 then
				var_554_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_554_7 = manager.ui.mainCamera.transform.position - var_554_0.position

				var_554_0.forward = Vector3.New(var_554_7.x, var_554_7.y, var_554_7.z)

				local var_554_8 = var_554_0.localEulerAngles

				var_554_8.z = 0
				var_554_8.x = 0
				var_554_0.localEulerAngles = var_554_8
			end

			local var_554_9 = arg_551_1.actors_["1084ui_story"]
			local var_554_10 = 0

			if var_554_10 < arg_551_1.time_ and arg_551_1.time_ <= var_554_10 + arg_554_0 and arg_551_1.var_.characterEffect1084ui_story == nil then
				arg_551_1.var_.characterEffect1084ui_story = var_554_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_554_11 = 0.2

			if var_554_10 <= arg_551_1.time_ and arg_551_1.time_ < var_554_10 + var_554_11 then
				local var_554_12 = (arg_551_1.time_ - var_554_10) / var_554_11

				if arg_551_1.var_.characterEffect1084ui_story then
					arg_551_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_551_1.time_ >= var_554_10 + var_554_11 and arg_551_1.time_ < var_554_10 + var_554_11 + arg_554_0 and arg_551_1.var_.characterEffect1084ui_story then
				arg_551_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_554_13 = 0

			if var_554_13 < arg_551_1.time_ and arg_551_1.time_ <= var_554_13 + arg_554_0 then
				arg_551_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action457")
			end

			local var_554_14 = 0

			if var_554_14 < arg_551_1.time_ and arg_551_1.time_ <= var_554_14 + arg_554_0 then
				arg_551_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_554_15 = 0
			local var_554_16 = 0.425

			if var_554_15 < arg_551_1.time_ and arg_551_1.time_ <= var_554_15 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, true)

				local var_554_17 = arg_551_1:FormatText(StoryNameCfg[6].name)

				arg_551_1.leftNameTxt_.text = var_554_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_551_1.leftNameTxt_.transform)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1.leftNameTxt_.text)
				SetActive(arg_551_1.iconTrs_.gameObject, false)
				arg_551_1.callingController_:SetSelectedState("normal")

				local var_554_18 = arg_551_1:GetWordFromCfg(120011136)
				local var_554_19 = arg_551_1:FormatText(var_554_18.content)

				arg_551_1.text_.text = var_554_19

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_20 = 17
				local var_554_21 = utf8.len(var_554_19)
				local var_554_22 = var_554_20 <= 0 and var_554_16 or var_554_16 * (var_554_21 / var_554_20)

				if var_554_22 > 0 and var_554_16 < var_554_22 then
					arg_551_1.talkMaxDuration = var_554_22

					if var_554_22 + var_554_15 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_22 + var_554_15
					end
				end

				arg_551_1.text_.text = var_554_19
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011136", "story_v_out_120011.awb") ~= 0 then
					local var_554_23 = manager.audio:GetVoiceLength("story_v_out_120011", "120011136", "story_v_out_120011.awb") / 1000

					if var_554_23 + var_554_15 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_23 + var_554_15
					end

					if var_554_18.prefab_name ~= "" and arg_551_1.actors_[var_554_18.prefab_name] ~= nil then
						local var_554_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_551_1.actors_[var_554_18.prefab_name].transform, "story_v_out_120011", "120011136", "story_v_out_120011.awb")

						arg_551_1:RecordAudio("120011136", var_554_24)
						arg_551_1:RecordAudio("120011136", var_554_24)
					else
						arg_551_1:AudioAction("play", "voice", "story_v_out_120011", "120011136", "story_v_out_120011.awb")
					end

					arg_551_1:RecordHistoryTalkVoice("story_v_out_120011", "120011136", "story_v_out_120011.awb")
				end

				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_25 = math.max(var_554_16, arg_551_1.talkMaxDuration)

			if var_554_15 <= arg_551_1.time_ and arg_551_1.time_ < var_554_15 + var_554_25 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_15) / var_554_25

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_15 + var_554_25 and arg_551_1.time_ < var_554_15 + var_554_25 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	Play120011137 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 120011137
		arg_555_1.duration_ = 5

		SetActive(arg_555_1.tipsGo_, false)

		function arg_555_1.onSingleLineFinish_()
			arg_555_1.onSingleLineUpdate_ = nil
			arg_555_1.onSingleLineFinish_ = nil
			arg_555_1.state_ = "waiting"
		end

		function arg_555_1.playNext_(arg_557_0)
			if arg_557_0 == 1 then
				arg_555_0:Play120011138(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = arg_555_1.actors_["1084ui_story"]
			local var_558_1 = 0

			if var_558_1 < arg_555_1.time_ and arg_555_1.time_ <= var_558_1 + arg_558_0 and arg_555_1.var_.characterEffect1084ui_story == nil then
				arg_555_1.var_.characterEffect1084ui_story = var_558_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_558_2 = 0.2

			if var_558_1 <= arg_555_1.time_ and arg_555_1.time_ < var_558_1 + var_558_2 then
				local var_558_3 = (arg_555_1.time_ - var_558_1) / var_558_2

				if arg_555_1.var_.characterEffect1084ui_story then
					local var_558_4 = Mathf.Lerp(0, 0.5, var_558_3)

					arg_555_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_555_1.var_.characterEffect1084ui_story.fillRatio = var_558_4
				end
			end

			if arg_555_1.time_ >= var_558_1 + var_558_2 and arg_555_1.time_ < var_558_1 + var_558_2 + arg_558_0 and arg_555_1.var_.characterEffect1084ui_story then
				local var_558_5 = 0.5

				arg_555_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_555_1.var_.characterEffect1084ui_story.fillRatio = var_558_5
			end

			local var_558_6 = 0
			local var_558_7 = 0.175

			if var_558_6 < arg_555_1.time_ and arg_555_1.time_ <= var_558_6 + arg_558_0 then
				arg_555_1.talkMaxDuration = 0
				arg_555_1.dialogCg_.alpha = 1

				arg_555_1.dialog_:SetActive(true)
				SetActive(arg_555_1.leftNameGo_, true)

				local var_558_8 = arg_555_1:FormatText(StoryNameCfg[7].name)

				arg_555_1.leftNameTxt_.text = var_558_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_555_1.leftNameTxt_.transform)

				arg_555_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_555_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_555_1:RecordName(arg_555_1.leftNameTxt_.text)
				SetActive(arg_555_1.iconTrs_.gameObject, false)
				arg_555_1.callingController_:SetSelectedState("normal")

				local var_558_9 = arg_555_1:GetWordFromCfg(120011137)
				local var_558_10 = arg_555_1:FormatText(var_558_9.content)

				arg_555_1.text_.text = var_558_10

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_11 = 7
				local var_558_12 = utf8.len(var_558_10)
				local var_558_13 = var_558_11 <= 0 and var_558_7 or var_558_7 * (var_558_12 / var_558_11)

				if var_558_13 > 0 and var_558_7 < var_558_13 then
					arg_555_1.talkMaxDuration = var_558_13

					if var_558_13 + var_558_6 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_13 + var_558_6
					end
				end

				arg_555_1.text_.text = var_558_10
				arg_555_1.typewritter.percent = 0

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(false)
				arg_555_1:RecordContent(arg_555_1.text_.text)
			end

			local var_558_14 = math.max(var_558_7, arg_555_1.talkMaxDuration)

			if var_558_6 <= arg_555_1.time_ and arg_555_1.time_ < var_558_6 + var_558_14 then
				arg_555_1.typewritter.percent = (arg_555_1.time_ - var_558_6) / var_558_14

				arg_555_1.typewritter:SetDirty()
			end

			if arg_555_1.time_ >= var_558_6 + var_558_14 and arg_555_1.time_ < var_558_6 + var_558_14 + arg_558_0 then
				arg_555_1.typewritter.percent = 1

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(true)
			end
		end
	end,
	Play120011138 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 120011138
		arg_559_1.duration_ = 2.633

		local var_559_0 = {
			zh = 1.999999999999,
			ja = 2.633
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
				arg_559_0:Play120011139(arg_559_1)
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

			local var_562_4 = 0

			if var_562_4 < arg_559_1.time_ and arg_559_1.time_ <= var_562_4 + arg_562_0 then
				arg_559_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action473")
			end

			local var_562_5 = 0

			if var_562_5 < arg_559_1.time_ and arg_559_1.time_ <= var_562_5 + arg_562_0 then
				arg_559_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_562_6 = 0
			local var_562_7 = 0.2

			if var_562_6 < arg_559_1.time_ and arg_559_1.time_ <= var_562_6 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, true)

				local var_562_8 = arg_559_1:FormatText(StoryNameCfg[6].name)

				arg_559_1.leftNameTxt_.text = var_562_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_559_1.leftNameTxt_.transform)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1.leftNameTxt_.text)
				SetActive(arg_559_1.iconTrs_.gameObject, false)
				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_9 = arg_559_1:GetWordFromCfg(120011138)
				local var_562_10 = arg_559_1:FormatText(var_562_9.content)

				arg_559_1.text_.text = var_562_10

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_11 = 8
				local var_562_12 = utf8.len(var_562_10)
				local var_562_13 = var_562_11 <= 0 and var_562_7 or var_562_7 * (var_562_12 / var_562_11)

				if var_562_13 > 0 and var_562_7 < var_562_13 then
					arg_559_1.talkMaxDuration = var_562_13

					if var_562_13 + var_562_6 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_13 + var_562_6
					end
				end

				arg_559_1.text_.text = var_562_10
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011138", "story_v_out_120011.awb") ~= 0 then
					local var_562_14 = manager.audio:GetVoiceLength("story_v_out_120011", "120011138", "story_v_out_120011.awb") / 1000

					if var_562_14 + var_562_6 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_14 + var_562_6
					end

					if var_562_9.prefab_name ~= "" and arg_559_1.actors_[var_562_9.prefab_name] ~= nil then
						local var_562_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_559_1.actors_[var_562_9.prefab_name].transform, "story_v_out_120011", "120011138", "story_v_out_120011.awb")

						arg_559_1:RecordAudio("120011138", var_562_15)
						arg_559_1:RecordAudio("120011138", var_562_15)
					else
						arg_559_1:AudioAction("play", "voice", "story_v_out_120011", "120011138", "story_v_out_120011.awb")
					end

					arg_559_1:RecordHistoryTalkVoice("story_v_out_120011", "120011138", "story_v_out_120011.awb")
				end

				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_16 = math.max(var_562_7, arg_559_1.talkMaxDuration)

			if var_562_6 <= arg_559_1.time_ and arg_559_1.time_ < var_562_6 + var_562_16 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_6) / var_562_16

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_6 + var_562_16 and arg_559_1.time_ < var_562_6 + var_562_16 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	Play120011139 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 120011139
		arg_563_1.duration_ = 5

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play120011140(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = arg_563_1.actors_["1084ui_story"].transform
			local var_566_1 = 0

			if var_566_1 < arg_563_1.time_ and arg_563_1.time_ <= var_566_1 + arg_566_0 then
				arg_563_1.var_.moveOldPos1084ui_story = var_566_0.localPosition
			end

			local var_566_2 = 0.001

			if var_566_1 <= arg_563_1.time_ and arg_563_1.time_ < var_566_1 + var_566_2 then
				local var_566_3 = (arg_563_1.time_ - var_566_1) / var_566_2
				local var_566_4 = Vector3.New(0, 100, 0)

				var_566_0.localPosition = Vector3.Lerp(arg_563_1.var_.moveOldPos1084ui_story, var_566_4, var_566_3)

				local var_566_5 = manager.ui.mainCamera.transform.position - var_566_0.position

				var_566_0.forward = Vector3.New(var_566_5.x, var_566_5.y, var_566_5.z)

				local var_566_6 = var_566_0.localEulerAngles

				var_566_6.z = 0
				var_566_6.x = 0
				var_566_0.localEulerAngles = var_566_6
			end

			if arg_563_1.time_ >= var_566_1 + var_566_2 and arg_563_1.time_ < var_566_1 + var_566_2 + arg_566_0 then
				var_566_0.localPosition = Vector3.New(0, 100, 0)

				local var_566_7 = manager.ui.mainCamera.transform.position - var_566_0.position

				var_566_0.forward = Vector3.New(var_566_7.x, var_566_7.y, var_566_7.z)

				local var_566_8 = var_566_0.localEulerAngles

				var_566_8.z = 0
				var_566_8.x = 0
				var_566_0.localEulerAngles = var_566_8
			end

			local var_566_9 = 0
			local var_566_10 = 0.725

			if var_566_9 < arg_563_1.time_ and arg_563_1.time_ <= var_566_9 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0
				arg_563_1.dialogCg_.alpha = 1

				arg_563_1.dialog_:SetActive(true)
				SetActive(arg_563_1.leftNameGo_, false)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_11 = arg_563_1:GetWordFromCfg(120011139)
				local var_566_12 = arg_563_1:FormatText(var_566_11.content)

				arg_563_1.text_.text = var_566_12

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_13 = 29
				local var_566_14 = utf8.len(var_566_12)
				local var_566_15 = var_566_13 <= 0 and var_566_10 or var_566_10 * (var_566_14 / var_566_13)

				if var_566_15 > 0 and var_566_10 < var_566_15 then
					arg_563_1.talkMaxDuration = var_566_15

					if var_566_15 + var_566_9 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_15 + var_566_9
					end
				end

				arg_563_1.text_.text = var_566_12
				arg_563_1.typewritter.percent = 0

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(false)
				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_16 = math.max(var_566_10, arg_563_1.talkMaxDuration)

			if var_566_9 <= arg_563_1.time_ and arg_563_1.time_ < var_566_9 + var_566_16 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_9) / var_566_16

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_9 + var_566_16 and arg_563_1.time_ < var_566_9 + var_566_16 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	Play120011140 = function(arg_567_0, arg_567_1)
		arg_567_1.time_ = 0
		arg_567_1.frameCnt_ = 0
		arg_567_1.state_ = "playing"
		arg_567_1.curTalkId_ = 120011140
		arg_567_1.duration_ = 3.9

		local var_567_0 = {
			zh = 3.9,
			ja = 2.633
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
				arg_567_0:Play120011141(arg_567_1)
			end
		end

		function arg_567_1.onSingleLineUpdate_(arg_570_0)
			local var_570_0 = arg_567_1.actors_["1084ui_story"].transform
			local var_570_1 = 0

			if var_570_1 < arg_567_1.time_ and arg_567_1.time_ <= var_570_1 + arg_570_0 then
				arg_567_1.var_.moveOldPos1084ui_story = var_570_0.localPosition
			end

			local var_570_2 = 0.001

			if var_570_1 <= arg_567_1.time_ and arg_567_1.time_ < var_570_1 + var_570_2 then
				local var_570_3 = (arg_567_1.time_ - var_570_1) / var_570_2
				local var_570_4 = Vector3.New(0, -0.97, -6)

				var_570_0.localPosition = Vector3.Lerp(arg_567_1.var_.moveOldPos1084ui_story, var_570_4, var_570_3)

				local var_570_5 = manager.ui.mainCamera.transform.position - var_570_0.position

				var_570_0.forward = Vector3.New(var_570_5.x, var_570_5.y, var_570_5.z)

				local var_570_6 = var_570_0.localEulerAngles

				var_570_6.z = 0
				var_570_6.x = 0
				var_570_0.localEulerAngles = var_570_6
			end

			if arg_567_1.time_ >= var_570_1 + var_570_2 and arg_567_1.time_ < var_570_1 + var_570_2 + arg_570_0 then
				var_570_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_570_7 = manager.ui.mainCamera.transform.position - var_570_0.position

				var_570_0.forward = Vector3.New(var_570_7.x, var_570_7.y, var_570_7.z)

				local var_570_8 = var_570_0.localEulerAngles

				var_570_8.z = 0
				var_570_8.x = 0
				var_570_0.localEulerAngles = var_570_8
			end

			local var_570_9 = arg_567_1.actors_["1084ui_story"]
			local var_570_10 = 0

			if var_570_10 < arg_567_1.time_ and arg_567_1.time_ <= var_570_10 + arg_570_0 and arg_567_1.var_.characterEffect1084ui_story == nil then
				arg_567_1.var_.characterEffect1084ui_story = var_570_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_570_11 = 0.2

			if var_570_10 <= arg_567_1.time_ and arg_567_1.time_ < var_570_10 + var_570_11 then
				local var_570_12 = (arg_567_1.time_ - var_570_10) / var_570_11

				if arg_567_1.var_.characterEffect1084ui_story then
					arg_567_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_567_1.time_ >= var_570_10 + var_570_11 and arg_567_1.time_ < var_570_10 + var_570_11 + arg_570_0 and arg_567_1.var_.characterEffect1084ui_story then
				arg_567_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_570_13 = 0

			if var_570_13 < arg_567_1.time_ and arg_567_1.time_ <= var_570_13 + arg_570_0 then
				arg_567_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_570_14 = 0

			if var_570_14 < arg_567_1.time_ and arg_567_1.time_ <= var_570_14 + arg_570_0 then
				arg_567_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_570_15 = 0
			local var_570_16 = 0.375

			if var_570_15 < arg_567_1.time_ and arg_567_1.time_ <= var_570_15 + arg_570_0 then
				arg_567_1.talkMaxDuration = 0
				arg_567_1.dialogCg_.alpha = 1

				arg_567_1.dialog_:SetActive(true)
				SetActive(arg_567_1.leftNameGo_, true)

				local var_570_17 = arg_567_1:FormatText(StoryNameCfg[6].name)

				arg_567_1.leftNameTxt_.text = var_570_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_567_1.leftNameTxt_.transform)

				arg_567_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_567_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_567_1:RecordName(arg_567_1.leftNameTxt_.text)
				SetActive(arg_567_1.iconTrs_.gameObject, false)
				arg_567_1.callingController_:SetSelectedState("normal")

				local var_570_18 = arg_567_1:GetWordFromCfg(120011140)
				local var_570_19 = arg_567_1:FormatText(var_570_18.content)

				arg_567_1.text_.text = var_570_19

				LuaForUtil.ClearLinePrefixSymbol(arg_567_1.text_)

				local var_570_20 = 15
				local var_570_21 = utf8.len(var_570_19)
				local var_570_22 = var_570_20 <= 0 and var_570_16 or var_570_16 * (var_570_21 / var_570_20)

				if var_570_22 > 0 and var_570_16 < var_570_22 then
					arg_567_1.talkMaxDuration = var_570_22

					if var_570_22 + var_570_15 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_22 + var_570_15
					end
				end

				arg_567_1.text_.text = var_570_19
				arg_567_1.typewritter.percent = 0

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011140", "story_v_out_120011.awb") ~= 0 then
					local var_570_23 = manager.audio:GetVoiceLength("story_v_out_120011", "120011140", "story_v_out_120011.awb") / 1000

					if var_570_23 + var_570_15 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_23 + var_570_15
					end

					if var_570_18.prefab_name ~= "" and arg_567_1.actors_[var_570_18.prefab_name] ~= nil then
						local var_570_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_567_1.actors_[var_570_18.prefab_name].transform, "story_v_out_120011", "120011140", "story_v_out_120011.awb")

						arg_567_1:RecordAudio("120011140", var_570_24)
						arg_567_1:RecordAudio("120011140", var_570_24)
					else
						arg_567_1:AudioAction("play", "voice", "story_v_out_120011", "120011140", "story_v_out_120011.awb")
					end

					arg_567_1:RecordHistoryTalkVoice("story_v_out_120011", "120011140", "story_v_out_120011.awb")
				end

				arg_567_1:RecordContent(arg_567_1.text_.text)
			end

			local var_570_25 = math.max(var_570_16, arg_567_1.talkMaxDuration)

			if var_570_15 <= arg_567_1.time_ and arg_567_1.time_ < var_570_15 + var_570_25 then
				arg_567_1.typewritter.percent = (arg_567_1.time_ - var_570_15) / var_570_25

				arg_567_1.typewritter:SetDirty()
			end

			if arg_567_1.time_ >= var_570_15 + var_570_25 and arg_567_1.time_ < var_570_15 + var_570_25 + arg_570_0 then
				arg_567_1.typewritter.percent = 1

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(true)
			end
		end
	end,
	Play120011141 = function(arg_571_0, arg_571_1)
		arg_571_1.time_ = 0
		arg_571_1.frameCnt_ = 0
		arg_571_1.state_ = "playing"
		arg_571_1.curTalkId_ = 120011141
		arg_571_1.duration_ = 5

		SetActive(arg_571_1.tipsGo_, false)

		function arg_571_1.onSingleLineFinish_()
			arg_571_1.onSingleLineUpdate_ = nil
			arg_571_1.onSingleLineFinish_ = nil
			arg_571_1.state_ = "waiting"
		end

		function arg_571_1.playNext_(arg_573_0)
			if arg_573_0 == 1 then
				arg_571_0:Play120011142(arg_571_1)
			end
		end

		function arg_571_1.onSingleLineUpdate_(arg_574_0)
			local var_574_0 = arg_571_1.actors_["1084ui_story"]
			local var_574_1 = 0

			if var_574_1 < arg_571_1.time_ and arg_571_1.time_ <= var_574_1 + arg_574_0 and arg_571_1.var_.characterEffect1084ui_story == nil then
				arg_571_1.var_.characterEffect1084ui_story = var_574_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_574_2 = 0.2

			if var_574_1 <= arg_571_1.time_ and arg_571_1.time_ < var_574_1 + var_574_2 then
				local var_574_3 = (arg_571_1.time_ - var_574_1) / var_574_2

				if arg_571_1.var_.characterEffect1084ui_story then
					local var_574_4 = Mathf.Lerp(0, 0.5, var_574_3)

					arg_571_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_571_1.var_.characterEffect1084ui_story.fillRatio = var_574_4
				end
			end

			if arg_571_1.time_ >= var_574_1 + var_574_2 and arg_571_1.time_ < var_574_1 + var_574_2 + arg_574_0 and arg_571_1.var_.characterEffect1084ui_story then
				local var_574_5 = 0.5

				arg_571_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_571_1.var_.characterEffect1084ui_story.fillRatio = var_574_5
			end

			local var_574_6 = 0
			local var_574_7 = 1.075

			if var_574_6 < arg_571_1.time_ and arg_571_1.time_ <= var_574_6 + arg_574_0 then
				arg_571_1.talkMaxDuration = 0
				arg_571_1.dialogCg_.alpha = 1

				arg_571_1.dialog_:SetActive(true)
				SetActive(arg_571_1.leftNameGo_, true)

				local var_574_8 = arg_571_1:FormatText(StoryNameCfg[7].name)

				arg_571_1.leftNameTxt_.text = var_574_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_571_1.leftNameTxt_.transform)

				arg_571_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_571_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_571_1:RecordName(arg_571_1.leftNameTxt_.text)
				SetActive(arg_571_1.iconTrs_.gameObject, false)
				arg_571_1.callingController_:SetSelectedState("normal")

				local var_574_9 = arg_571_1:GetWordFromCfg(120011141)
				local var_574_10 = arg_571_1:FormatText(var_574_9.content)

				arg_571_1.text_.text = var_574_10

				LuaForUtil.ClearLinePrefixSymbol(arg_571_1.text_)

				local var_574_11 = 43
				local var_574_12 = utf8.len(var_574_10)
				local var_574_13 = var_574_11 <= 0 and var_574_7 or var_574_7 * (var_574_12 / var_574_11)

				if var_574_13 > 0 and var_574_7 < var_574_13 then
					arg_571_1.talkMaxDuration = var_574_13

					if var_574_13 + var_574_6 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_13 + var_574_6
					end
				end

				arg_571_1.text_.text = var_574_10
				arg_571_1.typewritter.percent = 0

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(false)
				arg_571_1:RecordContent(arg_571_1.text_.text)
			end

			local var_574_14 = math.max(var_574_7, arg_571_1.talkMaxDuration)

			if var_574_6 <= arg_571_1.time_ and arg_571_1.time_ < var_574_6 + var_574_14 then
				arg_571_1.typewritter.percent = (arg_571_1.time_ - var_574_6) / var_574_14

				arg_571_1.typewritter:SetDirty()
			end

			if arg_571_1.time_ >= var_574_6 + var_574_14 and arg_571_1.time_ < var_574_6 + var_574_14 + arg_574_0 then
				arg_571_1.typewritter.percent = 1

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(true)
			end
		end
	end,
	Play120011142 = function(arg_575_0, arg_575_1)
		arg_575_1.time_ = 0
		arg_575_1.frameCnt_ = 0
		arg_575_1.state_ = "playing"
		arg_575_1.curTalkId_ = 120011142
		arg_575_1.duration_ = 3.966

		local var_575_0 = {
			zh = 1.233,
			ja = 3.966
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
				arg_575_0:Play120011143(arg_575_1)
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
				local var_578_4 = Vector3.New(0, 100, 0)

				var_578_0.localPosition = Vector3.Lerp(arg_575_1.var_.moveOldPos1084ui_story, var_578_4, var_578_3)

				local var_578_5 = manager.ui.mainCamera.transform.position - var_578_0.position

				var_578_0.forward = Vector3.New(var_578_5.x, var_578_5.y, var_578_5.z)

				local var_578_6 = var_578_0.localEulerAngles

				var_578_6.z = 0
				var_578_6.x = 0
				var_578_0.localEulerAngles = var_578_6
			end

			if arg_575_1.time_ >= var_578_1 + var_578_2 and arg_575_1.time_ < var_578_1 + var_578_2 + arg_578_0 then
				var_578_0.localPosition = Vector3.New(0, 100, 0)

				local var_578_7 = manager.ui.mainCamera.transform.position - var_578_0.position

				var_578_0.forward = Vector3.New(var_578_7.x, var_578_7.y, var_578_7.z)

				local var_578_8 = var_578_0.localEulerAngles

				var_578_8.z = 0
				var_578_8.x = 0
				var_578_0.localEulerAngles = var_578_8
			end

			local var_578_9 = 0
			local var_578_10 = 0.125

			if var_578_9 < arg_575_1.time_ and arg_575_1.time_ <= var_578_9 + arg_578_0 then
				arg_575_1.talkMaxDuration = 0
				arg_575_1.dialogCg_.alpha = 1

				arg_575_1.dialog_:SetActive(true)
				SetActive(arg_575_1.leftNameGo_, true)

				local var_578_11 = arg_575_1:FormatText(StoryNameCfg[377].name)

				arg_575_1.leftNameTxt_.text = var_578_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_575_1.leftNameTxt_.transform)

				arg_575_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_575_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_575_1:RecordName(arg_575_1.leftNameTxt_.text)
				SetActive(arg_575_1.iconTrs_.gameObject, true)
				arg_575_1.iconController_:SetSelectedState("hero")

				arg_575_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1069")

				arg_575_1.callingController_:SetSelectedState("normal")

				local var_578_12 = arg_575_1:GetWordFromCfg(120011142)
				local var_578_13 = arg_575_1:FormatText(var_578_12.content)

				arg_575_1.text_.text = var_578_13

				LuaForUtil.ClearLinePrefixSymbol(arg_575_1.text_)

				local var_578_14 = 5
				local var_578_15 = utf8.len(var_578_13)
				local var_578_16 = var_578_14 <= 0 and var_578_10 or var_578_10 * (var_578_15 / var_578_14)

				if var_578_16 > 0 and var_578_10 < var_578_16 then
					arg_575_1.talkMaxDuration = var_578_16

					if var_578_16 + var_578_9 > arg_575_1.duration_ then
						arg_575_1.duration_ = var_578_16 + var_578_9
					end
				end

				arg_575_1.text_.text = var_578_13
				arg_575_1.typewritter.percent = 0

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011142", "story_v_out_120011.awb") ~= 0 then
					local var_578_17 = manager.audio:GetVoiceLength("story_v_out_120011", "120011142", "story_v_out_120011.awb") / 1000

					if var_578_17 + var_578_9 > arg_575_1.duration_ then
						arg_575_1.duration_ = var_578_17 + var_578_9
					end

					if var_578_12.prefab_name ~= "" and arg_575_1.actors_[var_578_12.prefab_name] ~= nil then
						local var_578_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_575_1.actors_[var_578_12.prefab_name].transform, "story_v_out_120011", "120011142", "story_v_out_120011.awb")

						arg_575_1:RecordAudio("120011142", var_578_18)
						arg_575_1:RecordAudio("120011142", var_578_18)
					else
						arg_575_1:AudioAction("play", "voice", "story_v_out_120011", "120011142", "story_v_out_120011.awb")
					end

					arg_575_1:RecordHistoryTalkVoice("story_v_out_120011", "120011142", "story_v_out_120011.awb")
				end

				arg_575_1:RecordContent(arg_575_1.text_.text)
			end

			local var_578_19 = math.max(var_578_10, arg_575_1.talkMaxDuration)

			if var_578_9 <= arg_575_1.time_ and arg_575_1.time_ < var_578_9 + var_578_19 then
				arg_575_1.typewritter.percent = (arg_575_1.time_ - var_578_9) / var_578_19

				arg_575_1.typewritter:SetDirty()
			end

			if arg_575_1.time_ >= var_578_9 + var_578_19 and arg_575_1.time_ < var_578_9 + var_578_19 + arg_578_0 then
				arg_575_1.typewritter.percent = 1

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(true)
			end
		end
	end,
	Play120011143 = function(arg_579_0, arg_579_1)
		arg_579_1.time_ = 0
		arg_579_1.frameCnt_ = 0
		arg_579_1.state_ = "playing"
		arg_579_1.curTalkId_ = 120011143
		arg_579_1.duration_ = 5

		SetActive(arg_579_1.tipsGo_, false)

		function arg_579_1.onSingleLineFinish_()
			arg_579_1.onSingleLineUpdate_ = nil
			arg_579_1.onSingleLineFinish_ = nil
			arg_579_1.state_ = "waiting"
		end

		function arg_579_1.playNext_(arg_581_0)
			if arg_581_0 == 1 then
				arg_579_0:Play120011144(arg_579_1)
			end
		end

		function arg_579_1.onSingleLineUpdate_(arg_582_0)
			local var_582_0 = 0
			local var_582_1 = 0.95

			if var_582_0 < arg_579_1.time_ and arg_579_1.time_ <= var_582_0 + arg_582_0 then
				arg_579_1.talkMaxDuration = 0
				arg_579_1.dialogCg_.alpha = 1

				arg_579_1.dialog_:SetActive(true)
				SetActive(arg_579_1.leftNameGo_, false)

				arg_579_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_579_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_579_1:RecordName(arg_579_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_579_1.iconTrs_.gameObject, false)
				arg_579_1.callingController_:SetSelectedState("normal")

				local var_582_2 = arg_579_1:GetWordFromCfg(120011143)
				local var_582_3 = arg_579_1:FormatText(var_582_2.content)

				arg_579_1.text_.text = var_582_3

				LuaForUtil.ClearLinePrefixSymbol(arg_579_1.text_)

				local var_582_4 = 38
				local var_582_5 = utf8.len(var_582_3)
				local var_582_6 = var_582_4 <= 0 and var_582_1 or var_582_1 * (var_582_5 / var_582_4)

				if var_582_6 > 0 and var_582_1 < var_582_6 then
					arg_579_1.talkMaxDuration = var_582_6

					if var_582_6 + var_582_0 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_6 + var_582_0
					end
				end

				arg_579_1.text_.text = var_582_3
				arg_579_1.typewritter.percent = 0

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(false)
				arg_579_1:RecordContent(arg_579_1.text_.text)
			end

			local var_582_7 = math.max(var_582_1, arg_579_1.talkMaxDuration)

			if var_582_0 <= arg_579_1.time_ and arg_579_1.time_ < var_582_0 + var_582_7 then
				arg_579_1.typewritter.percent = (arg_579_1.time_ - var_582_0) / var_582_7

				arg_579_1.typewritter:SetDirty()
			end

			if arg_579_1.time_ >= var_582_0 + var_582_7 and arg_579_1.time_ < var_582_0 + var_582_7 + arg_582_0 then
				arg_579_1.typewritter.percent = 1

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(true)
			end
		end
	end,
	Play120011144 = function(arg_583_0, arg_583_1)
		arg_583_1.time_ = 0
		arg_583_1.frameCnt_ = 0
		arg_583_1.state_ = "playing"
		arg_583_1.curTalkId_ = 120011144
		arg_583_1.duration_ = 5

		SetActive(arg_583_1.tipsGo_, false)

		function arg_583_1.onSingleLineFinish_()
			arg_583_1.onSingleLineUpdate_ = nil
			arg_583_1.onSingleLineFinish_ = nil
			arg_583_1.state_ = "waiting"
		end

		function arg_583_1.playNext_(arg_585_0)
			if arg_585_0 == 1 then
				arg_583_0:Play120011145(arg_583_1)
			end
		end

		function arg_583_1.onSingleLineUpdate_(arg_586_0)
			local var_586_0 = 0
			local var_586_1 = 0.525

			if var_586_0 < arg_583_1.time_ and arg_583_1.time_ <= var_586_0 + arg_586_0 then
				arg_583_1.talkMaxDuration = 0
				arg_583_1.dialogCg_.alpha = 1

				arg_583_1.dialog_:SetActive(true)
				SetActive(arg_583_1.leftNameGo_, false)

				arg_583_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_583_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_583_1:RecordName(arg_583_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_583_1.iconTrs_.gameObject, false)
				arg_583_1.callingController_:SetSelectedState("normal")

				local var_586_2 = arg_583_1:GetWordFromCfg(120011144)
				local var_586_3 = arg_583_1:FormatText(var_586_2.content)

				arg_583_1.text_.text = var_586_3

				LuaForUtil.ClearLinePrefixSymbol(arg_583_1.text_)

				local var_586_4 = 21
				local var_586_5 = utf8.len(var_586_3)
				local var_586_6 = var_586_4 <= 0 and var_586_1 or var_586_1 * (var_586_5 / var_586_4)

				if var_586_6 > 0 and var_586_1 < var_586_6 then
					arg_583_1.talkMaxDuration = var_586_6

					if var_586_6 + var_586_0 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_6 + var_586_0
					end
				end

				arg_583_1.text_.text = var_586_3
				arg_583_1.typewritter.percent = 0

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(false)
				arg_583_1:RecordContent(arg_583_1.text_.text)
			end

			local var_586_7 = math.max(var_586_1, arg_583_1.talkMaxDuration)

			if var_586_0 <= arg_583_1.time_ and arg_583_1.time_ < var_586_0 + var_586_7 then
				arg_583_1.typewritter.percent = (arg_583_1.time_ - var_586_0) / var_586_7

				arg_583_1.typewritter:SetDirty()
			end

			if arg_583_1.time_ >= var_586_0 + var_586_7 and arg_583_1.time_ < var_586_0 + var_586_7 + arg_586_0 then
				arg_583_1.typewritter.percent = 1

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(true)
			end
		end
	end,
	Play120011145 = function(arg_587_0, arg_587_1)
		arg_587_1.time_ = 0
		arg_587_1.frameCnt_ = 0
		arg_587_1.state_ = "playing"
		arg_587_1.curTalkId_ = 120011145
		arg_587_1.duration_ = 3.333

		local var_587_0 = {
			zh = 1.999999999999,
			ja = 3.333
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
				arg_587_0:Play120011146(arg_587_1)
			end
		end

		function arg_587_1.onSingleLineUpdate_(arg_590_0)
			local var_590_0 = "1069ui_story"

			if arg_587_1.actors_[var_590_0] == nil then
				local var_590_1 = Object.Instantiate(Asset.Load("Char/" .. var_590_0), arg_587_1.stage_.transform)

				var_590_1.name = var_590_0
				var_590_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_587_1.actors_[var_590_0] = var_590_1

				local var_590_2 = var_590_1:GetComponentInChildren(typeof(CharacterEffect))

				var_590_2.enabled = true

				local var_590_3 = GameObjectTools.GetOrAddComponent(var_590_1, typeof(DynamicBoneHelper))

				if var_590_3 then
					var_590_3:EnableDynamicBone(false)
				end

				arg_587_1:ShowWeapon(var_590_2.transform, false)

				arg_587_1.var_[var_590_0 .. "Animator"] = var_590_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_587_1.var_[var_590_0 .. "Animator"].applyRootMotion = true
				arg_587_1.var_[var_590_0 .. "LipSync"] = var_590_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_590_4 = arg_587_1.actors_["1069ui_story"].transform
			local var_590_5 = 0

			if var_590_5 < arg_587_1.time_ and arg_587_1.time_ <= var_590_5 + arg_590_0 then
				arg_587_1.var_.moveOldPos1069ui_story = var_590_4.localPosition
			end

			local var_590_6 = 0.001

			if var_590_5 <= arg_587_1.time_ and arg_587_1.time_ < var_590_5 + var_590_6 then
				local var_590_7 = (arg_587_1.time_ - var_590_5) / var_590_6
				local var_590_8 = Vector3.New(0, -1, -6)

				var_590_4.localPosition = Vector3.Lerp(arg_587_1.var_.moveOldPos1069ui_story, var_590_8, var_590_7)

				local var_590_9 = manager.ui.mainCamera.transform.position - var_590_4.position

				var_590_4.forward = Vector3.New(var_590_9.x, var_590_9.y, var_590_9.z)

				local var_590_10 = var_590_4.localEulerAngles

				var_590_10.z = 0
				var_590_10.x = 0
				var_590_4.localEulerAngles = var_590_10
			end

			if arg_587_1.time_ >= var_590_5 + var_590_6 and arg_587_1.time_ < var_590_5 + var_590_6 + arg_590_0 then
				var_590_4.localPosition = Vector3.New(0, -1, -6)

				local var_590_11 = manager.ui.mainCamera.transform.position - var_590_4.position

				var_590_4.forward = Vector3.New(var_590_11.x, var_590_11.y, var_590_11.z)

				local var_590_12 = var_590_4.localEulerAngles

				var_590_12.z = 0
				var_590_12.x = 0
				var_590_4.localEulerAngles = var_590_12
			end

			local var_590_13 = arg_587_1.actors_["1069ui_story"]
			local var_590_14 = 0

			if var_590_14 < arg_587_1.time_ and arg_587_1.time_ <= var_590_14 + arg_590_0 and arg_587_1.var_.characterEffect1069ui_story == nil then
				arg_587_1.var_.characterEffect1069ui_story = var_590_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_590_15 = 0.2

			if var_590_14 <= arg_587_1.time_ and arg_587_1.time_ < var_590_14 + var_590_15 then
				local var_590_16 = (arg_587_1.time_ - var_590_14) / var_590_15

				if arg_587_1.var_.characterEffect1069ui_story then
					arg_587_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_587_1.time_ >= var_590_14 + var_590_15 and arg_587_1.time_ < var_590_14 + var_590_15 + arg_590_0 and arg_587_1.var_.characterEffect1069ui_story then
				arg_587_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_590_17 = 0

			if var_590_17 < arg_587_1.time_ and arg_587_1.time_ <= var_590_17 + arg_590_0 then
				arg_587_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_590_18 = 0

			if var_590_18 < arg_587_1.time_ and arg_587_1.time_ <= var_590_18 + arg_590_0 then
				arg_587_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action1_1")
			end

			local var_590_19 = 0
			local var_590_20 = 0.25

			if var_590_19 < arg_587_1.time_ and arg_587_1.time_ <= var_590_19 + arg_590_0 then
				arg_587_1.talkMaxDuration = 0
				arg_587_1.dialogCg_.alpha = 1

				arg_587_1.dialog_:SetActive(true)
				SetActive(arg_587_1.leftNameGo_, true)

				local var_590_21 = arg_587_1:FormatText(StoryNameCfg[377].name)

				arg_587_1.leftNameTxt_.text = var_590_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_587_1.leftNameTxt_.transform)

				arg_587_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_587_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_587_1:RecordName(arg_587_1.leftNameTxt_.text)
				SetActive(arg_587_1.iconTrs_.gameObject, false)
				arg_587_1.callingController_:SetSelectedState("normal")

				local var_590_22 = arg_587_1:GetWordFromCfg(120011145)
				local var_590_23 = arg_587_1:FormatText(var_590_22.content)

				arg_587_1.text_.text = var_590_23

				LuaForUtil.ClearLinePrefixSymbol(arg_587_1.text_)

				local var_590_24 = 10
				local var_590_25 = utf8.len(var_590_23)
				local var_590_26 = var_590_24 <= 0 and var_590_20 or var_590_20 * (var_590_25 / var_590_24)

				if var_590_26 > 0 and var_590_20 < var_590_26 then
					arg_587_1.talkMaxDuration = var_590_26

					if var_590_26 + var_590_19 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_26 + var_590_19
					end
				end

				arg_587_1.text_.text = var_590_23
				arg_587_1.typewritter.percent = 0

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011145", "story_v_out_120011.awb") ~= 0 then
					local var_590_27 = manager.audio:GetVoiceLength("story_v_out_120011", "120011145", "story_v_out_120011.awb") / 1000

					if var_590_27 + var_590_19 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_27 + var_590_19
					end

					if var_590_22.prefab_name ~= "" and arg_587_1.actors_[var_590_22.prefab_name] ~= nil then
						local var_590_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_587_1.actors_[var_590_22.prefab_name].transform, "story_v_out_120011", "120011145", "story_v_out_120011.awb")

						arg_587_1:RecordAudio("120011145", var_590_28)
						arg_587_1:RecordAudio("120011145", var_590_28)
					else
						arg_587_1:AudioAction("play", "voice", "story_v_out_120011", "120011145", "story_v_out_120011.awb")
					end

					arg_587_1:RecordHistoryTalkVoice("story_v_out_120011", "120011145", "story_v_out_120011.awb")
				end

				arg_587_1:RecordContent(arg_587_1.text_.text)
			end

			local var_590_29 = math.max(var_590_20, arg_587_1.talkMaxDuration)

			if var_590_19 <= arg_587_1.time_ and arg_587_1.time_ < var_590_19 + var_590_29 then
				arg_587_1.typewritter.percent = (arg_587_1.time_ - var_590_19) / var_590_29

				arg_587_1.typewritter:SetDirty()
			end

			if arg_587_1.time_ >= var_590_19 + var_590_29 and arg_587_1.time_ < var_590_19 + var_590_29 + arg_590_0 then
				arg_587_1.typewritter.percent = 1

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(true)
			end
		end
	end,
	Play120011146 = function(arg_591_0, arg_591_1)
		arg_591_1.time_ = 0
		arg_591_1.frameCnt_ = 0
		arg_591_1.state_ = "playing"
		arg_591_1.curTalkId_ = 120011146
		arg_591_1.duration_ = 2.033

		local var_591_0 = {
			zh = 1.333,
			ja = 2.033
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
				arg_591_0:Play120011147(arg_591_1)
			end
		end

		function arg_591_1.onSingleLineUpdate_(arg_594_0)
			local var_594_0 = 0
			local var_594_1 = 0.125

			if var_594_0 < arg_591_1.time_ and arg_591_1.time_ <= var_594_0 + arg_594_0 then
				arg_591_1.talkMaxDuration = 0
				arg_591_1.dialogCg_.alpha = 1

				arg_591_1.dialog_:SetActive(true)
				SetActive(arg_591_1.leftNameGo_, true)

				local var_594_2 = arg_591_1:FormatText(StoryNameCfg[377].name)

				arg_591_1.leftNameTxt_.text = var_594_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_591_1.leftNameTxt_.transform)

				arg_591_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_591_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_591_1:RecordName(arg_591_1.leftNameTxt_.text)
				SetActive(arg_591_1.iconTrs_.gameObject, false)
				arg_591_1.callingController_:SetSelectedState("normal")

				local var_594_3 = arg_591_1:GetWordFromCfg(120011146)
				local var_594_4 = arg_591_1:FormatText(var_594_3.content)

				arg_591_1.text_.text = var_594_4

				LuaForUtil.ClearLinePrefixSymbol(arg_591_1.text_)

				local var_594_5 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011146", "story_v_out_120011.awb") ~= 0 then
					local var_594_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011146", "story_v_out_120011.awb") / 1000

					if var_594_8 + var_594_0 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_8 + var_594_0
					end

					if var_594_3.prefab_name ~= "" and arg_591_1.actors_[var_594_3.prefab_name] ~= nil then
						local var_594_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_591_1.actors_[var_594_3.prefab_name].transform, "story_v_out_120011", "120011146", "story_v_out_120011.awb")

						arg_591_1:RecordAudio("120011146", var_594_9)
						arg_591_1:RecordAudio("120011146", var_594_9)
					else
						arg_591_1:AudioAction("play", "voice", "story_v_out_120011", "120011146", "story_v_out_120011.awb")
					end

					arg_591_1:RecordHistoryTalkVoice("story_v_out_120011", "120011146", "story_v_out_120011.awb")
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
	Play120011147 = function(arg_595_0, arg_595_1)
		arg_595_1.time_ = 0
		arg_595_1.frameCnt_ = 0
		arg_595_1.state_ = "playing"
		arg_595_1.curTalkId_ = 120011147
		arg_595_1.duration_ = 0.199999999999

		SetActive(arg_595_1.tipsGo_, false)

		function arg_595_1.onSingleLineFinish_()
			arg_595_1.onSingleLineUpdate_ = nil
			arg_595_1.onSingleLineFinish_ = nil
			arg_595_1.state_ = "waiting"

			SetActive(arg_595_1.choicesGo_, true)

			for iter_596_0, iter_596_1 in ipairs(arg_595_1.choices_) do
				local var_596_0 = iter_596_0 <= 2

				SetActive(iter_596_1.go, var_596_0)
			end

			arg_595_1.choices_[1].txt.text = arg_595_1:FormatText(StoryChoiceCfg[364].name)
			arg_595_1.choices_[2].txt.text = arg_595_1:FormatText(StoryChoiceCfg[365].name)
		end

		function arg_595_1.playNext_(arg_597_0)
			if arg_597_0 == 1 then
				arg_595_0:Play120011148(arg_595_1)
			end

			if arg_597_0 == 2 then
				arg_595_0:Play120011148(arg_595_1)
			end
		end

		function arg_595_1.onSingleLineUpdate_(arg_598_0)
			local var_598_0 = arg_595_1.actors_["1069ui_story"]
			local var_598_1 = 0

			if var_598_1 < arg_595_1.time_ and arg_595_1.time_ <= var_598_1 + arg_598_0 and arg_595_1.var_.characterEffect1069ui_story == nil then
				arg_595_1.var_.characterEffect1069ui_story = var_598_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_598_2 = 0.2

			if var_598_1 <= arg_595_1.time_ and arg_595_1.time_ < var_598_1 + var_598_2 then
				local var_598_3 = (arg_595_1.time_ - var_598_1) / var_598_2

				if arg_595_1.var_.characterEffect1069ui_story then
					local var_598_4 = Mathf.Lerp(0, 0.5, var_598_3)

					arg_595_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_595_1.var_.characterEffect1069ui_story.fillRatio = var_598_4
				end
			end

			if arg_595_1.time_ >= var_598_1 + var_598_2 and arg_595_1.time_ < var_598_1 + var_598_2 + arg_598_0 and arg_595_1.var_.characterEffect1069ui_story then
				local var_598_5 = 0.5

				arg_595_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_595_1.var_.characterEffect1069ui_story.fillRatio = var_598_5
			end
		end
	end,
	Play120011148 = function(arg_599_0, arg_599_1)
		arg_599_1.time_ = 0
		arg_599_1.frameCnt_ = 0
		arg_599_1.state_ = "playing"
		arg_599_1.curTalkId_ = 120011148
		arg_599_1.duration_ = 4.433

		local var_599_0 = {
			zh = 3.766,
			ja = 4.433
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
				arg_599_0:Play120011149(arg_599_1)
			end
		end

		function arg_599_1.onSingleLineUpdate_(arg_602_0)
			local var_602_0 = arg_599_1.actors_["1069ui_story"]
			local var_602_1 = 0

			if var_602_1 < arg_599_1.time_ and arg_599_1.time_ <= var_602_1 + arg_602_0 and arg_599_1.var_.characterEffect1069ui_story == nil then
				arg_599_1.var_.characterEffect1069ui_story = var_602_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_602_2 = 0.2

			if var_602_1 <= arg_599_1.time_ and arg_599_1.time_ < var_602_1 + var_602_2 then
				local var_602_3 = (arg_599_1.time_ - var_602_1) / var_602_2

				if arg_599_1.var_.characterEffect1069ui_story then
					arg_599_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_599_1.time_ >= var_602_1 + var_602_2 and arg_599_1.time_ < var_602_1 + var_602_2 + arg_602_0 and arg_599_1.var_.characterEffect1069ui_story then
				arg_599_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_602_4 = 0

			if var_602_4 < arg_599_1.time_ and arg_599_1.time_ <= var_602_4 + arg_602_0 then
				arg_599_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action4_1")
			end

			local var_602_5 = 0
			local var_602_6 = 0.4

			if var_602_5 < arg_599_1.time_ and arg_599_1.time_ <= var_602_5 + arg_602_0 then
				arg_599_1.talkMaxDuration = 0
				arg_599_1.dialogCg_.alpha = 1

				arg_599_1.dialog_:SetActive(true)
				SetActive(arg_599_1.leftNameGo_, true)

				local var_602_7 = arg_599_1:FormatText(StoryNameCfg[378].name)

				arg_599_1.leftNameTxt_.text = var_602_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_599_1.leftNameTxt_.transform)

				arg_599_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_599_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_599_1:RecordName(arg_599_1.leftNameTxt_.text)
				SetActive(arg_599_1.iconTrs_.gameObject, false)
				arg_599_1.callingController_:SetSelectedState("normal")

				local var_602_8 = arg_599_1:GetWordFromCfg(120011148)
				local var_602_9 = arg_599_1:FormatText(var_602_8.content)

				arg_599_1.text_.text = var_602_9

				LuaForUtil.ClearLinePrefixSymbol(arg_599_1.text_)

				local var_602_10 = 16
				local var_602_11 = utf8.len(var_602_9)
				local var_602_12 = var_602_10 <= 0 and var_602_6 or var_602_6 * (var_602_11 / var_602_10)

				if var_602_12 > 0 and var_602_6 < var_602_12 then
					arg_599_1.talkMaxDuration = var_602_12

					if var_602_12 + var_602_5 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_12 + var_602_5
					end
				end

				arg_599_1.text_.text = var_602_9
				arg_599_1.typewritter.percent = 0

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011148", "story_v_out_120011.awb") ~= 0 then
					local var_602_13 = manager.audio:GetVoiceLength("story_v_out_120011", "120011148", "story_v_out_120011.awb") / 1000

					if var_602_13 + var_602_5 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_13 + var_602_5
					end

					if var_602_8.prefab_name ~= "" and arg_599_1.actors_[var_602_8.prefab_name] ~= nil then
						local var_602_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_599_1.actors_[var_602_8.prefab_name].transform, "story_v_out_120011", "120011148", "story_v_out_120011.awb")

						arg_599_1:RecordAudio("120011148", var_602_14)
						arg_599_1:RecordAudio("120011148", var_602_14)
					else
						arg_599_1:AudioAction("play", "voice", "story_v_out_120011", "120011148", "story_v_out_120011.awb")
					end

					arg_599_1:RecordHistoryTalkVoice("story_v_out_120011", "120011148", "story_v_out_120011.awb")
				end

				arg_599_1:RecordContent(arg_599_1.text_.text)
			end

			local var_602_15 = math.max(var_602_6, arg_599_1.talkMaxDuration)

			if var_602_5 <= arg_599_1.time_ and arg_599_1.time_ < var_602_5 + var_602_15 then
				arg_599_1.typewritter.percent = (arg_599_1.time_ - var_602_5) / var_602_15

				arg_599_1.typewritter:SetDirty()
			end

			if arg_599_1.time_ >= var_602_5 + var_602_15 and arg_599_1.time_ < var_602_5 + var_602_15 + arg_602_0 then
				arg_599_1.typewritter.percent = 1

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(true)
			end
		end
	end,
	Play120011149 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 120011149
		arg_603_1.duration_ = 5

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play120011150(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = arg_603_1.actors_["1069ui_story"].transform
			local var_606_1 = 0

			if var_606_1 < arg_603_1.time_ and arg_603_1.time_ <= var_606_1 + arg_606_0 then
				arg_603_1.var_.moveOldPos1069ui_story = var_606_0.localPosition
			end

			local var_606_2 = 0.001

			if var_606_1 <= arg_603_1.time_ and arg_603_1.time_ < var_606_1 + var_606_2 then
				local var_606_3 = (arg_603_1.time_ - var_606_1) / var_606_2
				local var_606_4 = Vector3.New(0, 100, 0)

				var_606_0.localPosition = Vector3.Lerp(arg_603_1.var_.moveOldPos1069ui_story, var_606_4, var_606_3)

				local var_606_5 = manager.ui.mainCamera.transform.position - var_606_0.position

				var_606_0.forward = Vector3.New(var_606_5.x, var_606_5.y, var_606_5.z)

				local var_606_6 = var_606_0.localEulerAngles

				var_606_6.z = 0
				var_606_6.x = 0
				var_606_0.localEulerAngles = var_606_6
			end

			if arg_603_1.time_ >= var_606_1 + var_606_2 and arg_603_1.time_ < var_606_1 + var_606_2 + arg_606_0 then
				var_606_0.localPosition = Vector3.New(0, 100, 0)

				local var_606_7 = manager.ui.mainCamera.transform.position - var_606_0.position

				var_606_0.forward = Vector3.New(var_606_7.x, var_606_7.y, var_606_7.z)

				local var_606_8 = var_606_0.localEulerAngles

				var_606_8.z = 0
				var_606_8.x = 0
				var_606_0.localEulerAngles = var_606_8
			end

			local var_606_9 = 0
			local var_606_10 = 1.05

			if var_606_9 < arg_603_1.time_ and arg_603_1.time_ <= var_606_9 + arg_606_0 then
				arg_603_1.talkMaxDuration = 0
				arg_603_1.dialogCg_.alpha = 1

				arg_603_1.dialog_:SetActive(true)
				SetActive(arg_603_1.leftNameGo_, false)

				arg_603_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_603_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_603_1:RecordName(arg_603_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_603_1.iconTrs_.gameObject, false)
				arg_603_1.callingController_:SetSelectedState("normal")

				local var_606_11 = arg_603_1:GetWordFromCfg(120011149)
				local var_606_12 = arg_603_1:FormatText(var_606_11.content)

				arg_603_1.text_.text = var_606_12

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_13 = 42
				local var_606_14 = utf8.len(var_606_12)
				local var_606_15 = var_606_13 <= 0 and var_606_10 or var_606_10 * (var_606_14 / var_606_13)

				if var_606_15 > 0 and var_606_10 < var_606_15 then
					arg_603_1.talkMaxDuration = var_606_15

					if var_606_15 + var_606_9 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_15 + var_606_9
					end
				end

				arg_603_1.text_.text = var_606_12
				arg_603_1.typewritter.percent = 0

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(false)
				arg_603_1:RecordContent(arg_603_1.text_.text)
			end

			local var_606_16 = math.max(var_606_10, arg_603_1.talkMaxDuration)

			if var_606_9 <= arg_603_1.time_ and arg_603_1.time_ < var_606_9 + var_606_16 then
				arg_603_1.typewritter.percent = (arg_603_1.time_ - var_606_9) / var_606_16

				arg_603_1.typewritter:SetDirty()
			end

			if arg_603_1.time_ >= var_606_9 + var_606_16 and arg_603_1.time_ < var_606_9 + var_606_16 + arg_606_0 then
				arg_603_1.typewritter.percent = 1

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(true)
			end
		end
	end,
	Play120011150 = function(arg_607_0, arg_607_1)
		arg_607_1.time_ = 0
		arg_607_1.frameCnt_ = 0
		arg_607_1.state_ = "playing"
		arg_607_1.curTalkId_ = 120011150
		arg_607_1.duration_ = 5

		SetActive(arg_607_1.tipsGo_, false)

		function arg_607_1.onSingleLineFinish_()
			arg_607_1.onSingleLineUpdate_ = nil
			arg_607_1.onSingleLineFinish_ = nil
			arg_607_1.state_ = "waiting"
		end

		function arg_607_1.playNext_(arg_609_0)
			if arg_609_0 == 1 then
				arg_607_0:Play120011151(arg_607_1)
			end
		end

		function arg_607_1.onSingleLineUpdate_(arg_610_0)
			local var_610_0 = 0
			local var_610_1 = 0.725

			if var_610_0 < arg_607_1.time_ and arg_607_1.time_ <= var_610_0 + arg_610_0 then
				arg_607_1.talkMaxDuration = 0
				arg_607_1.dialogCg_.alpha = 1

				arg_607_1.dialog_:SetActive(true)
				SetActive(arg_607_1.leftNameGo_, false)

				arg_607_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_607_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_607_1:RecordName(arg_607_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_607_1.iconTrs_.gameObject, false)
				arg_607_1.callingController_:SetSelectedState("normal")

				local var_610_2 = arg_607_1:GetWordFromCfg(120011150)
				local var_610_3 = arg_607_1:FormatText(var_610_2.content)

				arg_607_1.text_.text = var_610_3

				LuaForUtil.ClearLinePrefixSymbol(arg_607_1.text_)

				local var_610_4 = 29
				local var_610_5 = utf8.len(var_610_3)
				local var_610_6 = var_610_4 <= 0 and var_610_1 or var_610_1 * (var_610_5 / var_610_4)

				if var_610_6 > 0 and var_610_1 < var_610_6 then
					arg_607_1.talkMaxDuration = var_610_6

					if var_610_6 + var_610_0 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_6 + var_610_0
					end
				end

				arg_607_1.text_.text = var_610_3
				arg_607_1.typewritter.percent = 0

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(false)
				arg_607_1:RecordContent(arg_607_1.text_.text)
			end

			local var_610_7 = math.max(var_610_1, arg_607_1.talkMaxDuration)

			if var_610_0 <= arg_607_1.time_ and arg_607_1.time_ < var_610_0 + var_610_7 then
				arg_607_1.typewritter.percent = (arg_607_1.time_ - var_610_0) / var_610_7

				arg_607_1.typewritter:SetDirty()
			end

			if arg_607_1.time_ >= var_610_0 + var_610_7 and arg_607_1.time_ < var_610_0 + var_610_7 + arg_610_0 then
				arg_607_1.typewritter.percent = 1

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(true)
			end
		end
	end,
	Play120011151 = function(arg_611_0, arg_611_1)
		arg_611_1.time_ = 0
		arg_611_1.frameCnt_ = 0
		arg_611_1.state_ = "playing"
		arg_611_1.curTalkId_ = 120011151
		arg_611_1.duration_ = 10.4

		local var_611_0 = {
			zh = 6.1,
			ja = 10.4
		}
		local var_611_1 = manager.audio:GetLocalizationFlag()

		if var_611_0[var_611_1] ~= nil then
			arg_611_1.duration_ = var_611_0[var_611_1]
		end

		SetActive(arg_611_1.tipsGo_, false)

		function arg_611_1.onSingleLineFinish_()
			arg_611_1.onSingleLineUpdate_ = nil
			arg_611_1.onSingleLineFinish_ = nil
			arg_611_1.state_ = "waiting"
		end

		function arg_611_1.playNext_(arg_613_0)
			if arg_613_0 == 1 then
				arg_611_0:Play120011152(arg_611_1)
			end
		end

		function arg_611_1.onSingleLineUpdate_(arg_614_0)
			local var_614_0 = arg_611_1.actors_["1084ui_story"].transform
			local var_614_1 = 0

			if var_614_1 < arg_611_1.time_ and arg_611_1.time_ <= var_614_1 + arg_614_0 then
				arg_611_1.var_.moveOldPos1084ui_story = var_614_0.localPosition
			end

			local var_614_2 = 0.001

			if var_614_1 <= arg_611_1.time_ and arg_611_1.time_ < var_614_1 + var_614_2 then
				local var_614_3 = (arg_611_1.time_ - var_614_1) / var_614_2
				local var_614_4 = Vector3.New(-0.7, -0.97, -6)

				var_614_0.localPosition = Vector3.Lerp(arg_611_1.var_.moveOldPos1084ui_story, var_614_4, var_614_3)

				local var_614_5 = manager.ui.mainCamera.transform.position - var_614_0.position

				var_614_0.forward = Vector3.New(var_614_5.x, var_614_5.y, var_614_5.z)

				local var_614_6 = var_614_0.localEulerAngles

				var_614_6.z = 0
				var_614_6.x = 0
				var_614_0.localEulerAngles = var_614_6
			end

			if arg_611_1.time_ >= var_614_1 + var_614_2 and arg_611_1.time_ < var_614_1 + var_614_2 + arg_614_0 then
				var_614_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_614_7 = manager.ui.mainCamera.transform.position - var_614_0.position

				var_614_0.forward = Vector3.New(var_614_7.x, var_614_7.y, var_614_7.z)

				local var_614_8 = var_614_0.localEulerAngles

				var_614_8.z = 0
				var_614_8.x = 0
				var_614_0.localEulerAngles = var_614_8
			end

			local var_614_9 = arg_611_1.actors_["1069ui_story"].transform
			local var_614_10 = 0

			if var_614_10 < arg_611_1.time_ and arg_611_1.time_ <= var_614_10 + arg_614_0 then
				arg_611_1.var_.moveOldPos1069ui_story = var_614_9.localPosition
			end

			local var_614_11 = 0.001

			if var_614_10 <= arg_611_1.time_ and arg_611_1.time_ < var_614_10 + var_614_11 then
				local var_614_12 = (arg_611_1.time_ - var_614_10) / var_614_11
				local var_614_13 = Vector3.New(0.7, -1, -6)

				var_614_9.localPosition = Vector3.Lerp(arg_611_1.var_.moveOldPos1069ui_story, var_614_13, var_614_12)

				local var_614_14 = manager.ui.mainCamera.transform.position - var_614_9.position

				var_614_9.forward = Vector3.New(var_614_14.x, var_614_14.y, var_614_14.z)

				local var_614_15 = var_614_9.localEulerAngles

				var_614_15.z = 0
				var_614_15.x = 0
				var_614_9.localEulerAngles = var_614_15
			end

			if arg_611_1.time_ >= var_614_10 + var_614_11 and arg_611_1.time_ < var_614_10 + var_614_11 + arg_614_0 then
				var_614_9.localPosition = Vector3.New(0.7, -1, -6)

				local var_614_16 = manager.ui.mainCamera.transform.position - var_614_9.position

				var_614_9.forward = Vector3.New(var_614_16.x, var_614_16.y, var_614_16.z)

				local var_614_17 = var_614_9.localEulerAngles

				var_614_17.z = 0
				var_614_17.x = 0
				var_614_9.localEulerAngles = var_614_17
			end

			local var_614_18 = arg_611_1.actors_["1084ui_story"]
			local var_614_19 = 0

			if var_614_19 < arg_611_1.time_ and arg_611_1.time_ <= var_614_19 + arg_614_0 and arg_611_1.var_.characterEffect1084ui_story == nil then
				arg_611_1.var_.characterEffect1084ui_story = var_614_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_614_20 = 0.2

			if var_614_19 <= arg_611_1.time_ and arg_611_1.time_ < var_614_19 + var_614_20 then
				local var_614_21 = (arg_611_1.time_ - var_614_19) / var_614_20

				if arg_611_1.var_.characterEffect1084ui_story then
					arg_611_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_611_1.time_ >= var_614_19 + var_614_20 and arg_611_1.time_ < var_614_19 + var_614_20 + arg_614_0 and arg_611_1.var_.characterEffect1084ui_story then
				arg_611_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_614_22 = arg_611_1.actors_["1069ui_story"]
			local var_614_23 = 0

			if var_614_23 < arg_611_1.time_ and arg_611_1.time_ <= var_614_23 + arg_614_0 and arg_611_1.var_.characterEffect1069ui_story == nil then
				arg_611_1.var_.characterEffect1069ui_story = var_614_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_614_24 = 0.034

			if var_614_23 <= arg_611_1.time_ and arg_611_1.time_ < var_614_23 + var_614_24 then
				local var_614_25 = (arg_611_1.time_ - var_614_23) / var_614_24

				if arg_611_1.var_.characterEffect1069ui_story then
					local var_614_26 = Mathf.Lerp(0, 0.5, var_614_25)

					arg_611_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_611_1.var_.characterEffect1069ui_story.fillRatio = var_614_26
				end
			end

			if arg_611_1.time_ >= var_614_23 + var_614_24 and arg_611_1.time_ < var_614_23 + var_614_24 + arg_614_0 and arg_611_1.var_.characterEffect1069ui_story then
				local var_614_27 = 0.5

				arg_611_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_611_1.var_.characterEffect1069ui_story.fillRatio = var_614_27
			end

			local var_614_28 = 0

			if var_614_28 < arg_611_1.time_ and arg_611_1.time_ <= var_614_28 + arg_614_0 then
				arg_611_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_1")
			end

			local var_614_29 = 0

			if var_614_29 < arg_611_1.time_ and arg_611_1.time_ <= var_614_29 + arg_614_0 then
				arg_611_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_614_30 = 0

			if var_614_30 < arg_611_1.time_ and arg_611_1.time_ <= var_614_30 + arg_614_0 then
				arg_611_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action1_1")
			end

			local var_614_31 = 0
			local var_614_32 = 0.55

			if var_614_31 < arg_611_1.time_ and arg_611_1.time_ <= var_614_31 + arg_614_0 then
				arg_611_1.talkMaxDuration = 0
				arg_611_1.dialogCg_.alpha = 1

				arg_611_1.dialog_:SetActive(true)
				SetActive(arg_611_1.leftNameGo_, true)

				local var_614_33 = arg_611_1:FormatText(StoryNameCfg[6].name)

				arg_611_1.leftNameTxt_.text = var_614_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_611_1.leftNameTxt_.transform)

				arg_611_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_611_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_611_1:RecordName(arg_611_1.leftNameTxt_.text)
				SetActive(arg_611_1.iconTrs_.gameObject, false)
				arg_611_1.callingController_:SetSelectedState("normal")

				local var_614_34 = arg_611_1:GetWordFromCfg(120011151)
				local var_614_35 = arg_611_1:FormatText(var_614_34.content)

				arg_611_1.text_.text = var_614_35

				LuaForUtil.ClearLinePrefixSymbol(arg_611_1.text_)

				local var_614_36 = 22
				local var_614_37 = utf8.len(var_614_35)
				local var_614_38 = var_614_36 <= 0 and var_614_32 or var_614_32 * (var_614_37 / var_614_36)

				if var_614_38 > 0 and var_614_32 < var_614_38 then
					arg_611_1.talkMaxDuration = var_614_38

					if var_614_38 + var_614_31 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_38 + var_614_31
					end
				end

				arg_611_1.text_.text = var_614_35
				arg_611_1.typewritter.percent = 0

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011151", "story_v_out_120011.awb") ~= 0 then
					local var_614_39 = manager.audio:GetVoiceLength("story_v_out_120011", "120011151", "story_v_out_120011.awb") / 1000

					if var_614_39 + var_614_31 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_39 + var_614_31
					end

					if var_614_34.prefab_name ~= "" and arg_611_1.actors_[var_614_34.prefab_name] ~= nil then
						local var_614_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_611_1.actors_[var_614_34.prefab_name].transform, "story_v_out_120011", "120011151", "story_v_out_120011.awb")

						arg_611_1:RecordAudio("120011151", var_614_40)
						arg_611_1:RecordAudio("120011151", var_614_40)
					else
						arg_611_1:AudioAction("play", "voice", "story_v_out_120011", "120011151", "story_v_out_120011.awb")
					end

					arg_611_1:RecordHistoryTalkVoice("story_v_out_120011", "120011151", "story_v_out_120011.awb")
				end

				arg_611_1:RecordContent(arg_611_1.text_.text)
			end

			local var_614_41 = math.max(var_614_32, arg_611_1.talkMaxDuration)

			if var_614_31 <= arg_611_1.time_ and arg_611_1.time_ < var_614_31 + var_614_41 then
				arg_611_1.typewritter.percent = (arg_611_1.time_ - var_614_31) / var_614_41

				arg_611_1.typewritter:SetDirty()
			end

			if arg_611_1.time_ >= var_614_31 + var_614_41 and arg_611_1.time_ < var_614_31 + var_614_41 + arg_614_0 then
				arg_611_1.typewritter.percent = 1

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(true)
			end
		end
	end,
	Play120011152 = function(arg_615_0, arg_615_1)
		arg_615_1.time_ = 0
		arg_615_1.frameCnt_ = 0
		arg_615_1.state_ = "playing"
		arg_615_1.curTalkId_ = 120011152
		arg_615_1.duration_ = 3.8

		local var_615_0 = {
			zh = 2,
			ja = 3.8
		}
		local var_615_1 = manager.audio:GetLocalizationFlag()

		if var_615_0[var_615_1] ~= nil then
			arg_615_1.duration_ = var_615_0[var_615_1]
		end

		SetActive(arg_615_1.tipsGo_, false)

		function arg_615_1.onSingleLineFinish_()
			arg_615_1.onSingleLineUpdate_ = nil
			arg_615_1.onSingleLineFinish_ = nil
			arg_615_1.state_ = "waiting"
		end

		function arg_615_1.playNext_(arg_617_0)
			if arg_617_0 == 1 then
				arg_615_0:Play120011153(arg_615_1)
			end
		end

		function arg_615_1.onSingleLineUpdate_(arg_618_0)
			local var_618_0 = arg_615_1.actors_["1084ui_story"]
			local var_618_1 = 0

			if var_618_1 < arg_615_1.time_ and arg_615_1.time_ <= var_618_1 + arg_618_0 and arg_615_1.var_.characterEffect1084ui_story == nil then
				arg_615_1.var_.characterEffect1084ui_story = var_618_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_618_2 = 0.2

			if var_618_1 <= arg_615_1.time_ and arg_615_1.time_ < var_618_1 + var_618_2 then
				local var_618_3 = (arg_615_1.time_ - var_618_1) / var_618_2

				if arg_615_1.var_.characterEffect1084ui_story then
					local var_618_4 = Mathf.Lerp(0, 0.5, var_618_3)

					arg_615_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_615_1.var_.characterEffect1084ui_story.fillRatio = var_618_4
				end
			end

			if arg_615_1.time_ >= var_618_1 + var_618_2 and arg_615_1.time_ < var_618_1 + var_618_2 + arg_618_0 and arg_615_1.var_.characterEffect1084ui_story then
				local var_618_5 = 0.5

				arg_615_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_615_1.var_.characterEffect1084ui_story.fillRatio = var_618_5
			end

			local var_618_6 = arg_615_1.actors_["1069ui_story"]
			local var_618_7 = 0

			if var_618_7 < arg_615_1.time_ and arg_615_1.time_ <= var_618_7 + arg_618_0 and arg_615_1.var_.characterEffect1069ui_story == nil then
				arg_615_1.var_.characterEffect1069ui_story = var_618_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_618_8 = 0.2

			if var_618_7 <= arg_615_1.time_ and arg_615_1.time_ < var_618_7 + var_618_8 then
				local var_618_9 = (arg_615_1.time_ - var_618_7) / var_618_8

				if arg_615_1.var_.characterEffect1069ui_story then
					arg_615_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_615_1.time_ >= var_618_7 + var_618_8 and arg_615_1.time_ < var_618_7 + var_618_8 + arg_618_0 and arg_615_1.var_.characterEffect1069ui_story then
				arg_615_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_618_10 = 0

			if var_618_10 < arg_615_1.time_ and arg_615_1.time_ <= var_618_10 + arg_618_0 then
				arg_615_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_618_11 = 0
			local var_618_12 = 0.275

			if var_618_11 < arg_615_1.time_ and arg_615_1.time_ <= var_618_11 + arg_618_0 then
				arg_615_1.talkMaxDuration = 0
				arg_615_1.dialogCg_.alpha = 1

				arg_615_1.dialog_:SetActive(true)
				SetActive(arg_615_1.leftNameGo_, true)

				local var_618_13 = arg_615_1:FormatText(StoryNameCfg[378].name)

				arg_615_1.leftNameTxt_.text = var_618_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_615_1.leftNameTxt_.transform)

				arg_615_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_615_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_615_1:RecordName(arg_615_1.leftNameTxt_.text)
				SetActive(arg_615_1.iconTrs_.gameObject, false)
				arg_615_1.callingController_:SetSelectedState("normal")

				local var_618_14 = arg_615_1:GetWordFromCfg(120011152)
				local var_618_15 = arg_615_1:FormatText(var_618_14.content)

				arg_615_1.text_.text = var_618_15

				LuaForUtil.ClearLinePrefixSymbol(arg_615_1.text_)

				local var_618_16 = 11
				local var_618_17 = utf8.len(var_618_15)
				local var_618_18 = var_618_16 <= 0 and var_618_12 or var_618_12 * (var_618_17 / var_618_16)

				if var_618_18 > 0 and var_618_12 < var_618_18 then
					arg_615_1.talkMaxDuration = var_618_18

					if var_618_18 + var_618_11 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_18 + var_618_11
					end
				end

				arg_615_1.text_.text = var_618_15
				arg_615_1.typewritter.percent = 0

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011152", "story_v_out_120011.awb") ~= 0 then
					local var_618_19 = manager.audio:GetVoiceLength("story_v_out_120011", "120011152", "story_v_out_120011.awb") / 1000

					if var_618_19 + var_618_11 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_19 + var_618_11
					end

					if var_618_14.prefab_name ~= "" and arg_615_1.actors_[var_618_14.prefab_name] ~= nil then
						local var_618_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_615_1.actors_[var_618_14.prefab_name].transform, "story_v_out_120011", "120011152", "story_v_out_120011.awb")

						arg_615_1:RecordAudio("120011152", var_618_20)
						arg_615_1:RecordAudio("120011152", var_618_20)
					else
						arg_615_1:AudioAction("play", "voice", "story_v_out_120011", "120011152", "story_v_out_120011.awb")
					end

					arg_615_1:RecordHistoryTalkVoice("story_v_out_120011", "120011152", "story_v_out_120011.awb")
				end

				arg_615_1:RecordContent(arg_615_1.text_.text)
			end

			local var_618_21 = math.max(var_618_12, arg_615_1.talkMaxDuration)

			if var_618_11 <= arg_615_1.time_ and arg_615_1.time_ < var_618_11 + var_618_21 then
				arg_615_1.typewritter.percent = (arg_615_1.time_ - var_618_11) / var_618_21

				arg_615_1.typewritter:SetDirty()
			end

			if arg_615_1.time_ >= var_618_11 + var_618_21 and arg_615_1.time_ < var_618_11 + var_618_21 + arg_618_0 then
				arg_615_1.typewritter.percent = 1

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(true)
			end
		end
	end,
	Play120011153 = function(arg_619_0, arg_619_1)
		arg_619_1.time_ = 0
		arg_619_1.frameCnt_ = 0
		arg_619_1.state_ = "playing"
		arg_619_1.curTalkId_ = 120011153
		arg_619_1.duration_ = 7.4

		local var_619_0 = {
			zh = 7.4,
			ja = 4
		}
		local var_619_1 = manager.audio:GetLocalizationFlag()

		if var_619_0[var_619_1] ~= nil then
			arg_619_1.duration_ = var_619_0[var_619_1]
		end

		SetActive(arg_619_1.tipsGo_, false)

		function arg_619_1.onSingleLineFinish_()
			arg_619_1.onSingleLineUpdate_ = nil
			arg_619_1.onSingleLineFinish_ = nil
			arg_619_1.state_ = "waiting"
		end

		function arg_619_1.playNext_(arg_621_0)
			if arg_621_0 == 1 then
				arg_619_0:Play120011154(arg_619_1)
			end
		end

		function arg_619_1.onSingleLineUpdate_(arg_622_0)
			local var_622_0 = 0

			if var_622_0 < arg_619_1.time_ and arg_619_1.time_ <= var_622_0 + arg_622_0 then
				arg_619_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action2_1")
			end

			local var_622_1 = 0

			if var_622_1 < arg_619_1.time_ and arg_619_1.time_ <= var_622_1 + arg_622_0 then
				arg_619_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action487")
			end

			local var_622_2 = 0

			if var_622_2 < arg_619_1.time_ and arg_619_1.time_ <= var_622_2 + arg_622_0 then
				arg_619_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_622_3 = 0
			local var_622_4 = 0.95

			if var_622_3 < arg_619_1.time_ and arg_619_1.time_ <= var_622_3 + arg_622_0 then
				arg_619_1.talkMaxDuration = 0
				arg_619_1.dialogCg_.alpha = 1

				arg_619_1.dialog_:SetActive(true)
				SetActive(arg_619_1.leftNameGo_, true)

				local var_622_5 = arg_619_1:FormatText(StoryNameCfg[378].name)

				arg_619_1.leftNameTxt_.text = var_622_5

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_619_1.leftNameTxt_.transform)

				arg_619_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_619_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_619_1:RecordName(arg_619_1.leftNameTxt_.text)
				SetActive(arg_619_1.iconTrs_.gameObject, false)
				arg_619_1.callingController_:SetSelectedState("normal")

				local var_622_6 = arg_619_1:GetWordFromCfg(120011153)
				local var_622_7 = arg_619_1:FormatText(var_622_6.content)

				arg_619_1.text_.text = var_622_7

				LuaForUtil.ClearLinePrefixSymbol(arg_619_1.text_)

				local var_622_8 = 38
				local var_622_9 = utf8.len(var_622_7)
				local var_622_10 = var_622_8 <= 0 and var_622_4 or var_622_4 * (var_622_9 / var_622_8)

				if var_622_10 > 0 and var_622_4 < var_622_10 then
					arg_619_1.talkMaxDuration = var_622_10

					if var_622_10 + var_622_3 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_10 + var_622_3
					end
				end

				arg_619_1.text_.text = var_622_7
				arg_619_1.typewritter.percent = 0

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011153", "story_v_out_120011.awb") ~= 0 then
					local var_622_11 = manager.audio:GetVoiceLength("story_v_out_120011", "120011153", "story_v_out_120011.awb") / 1000

					if var_622_11 + var_622_3 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_11 + var_622_3
					end

					if var_622_6.prefab_name ~= "" and arg_619_1.actors_[var_622_6.prefab_name] ~= nil then
						local var_622_12 = LuaForUtil.PlayVoiceWithCriLipsync(arg_619_1.actors_[var_622_6.prefab_name].transform, "story_v_out_120011", "120011153", "story_v_out_120011.awb")

						arg_619_1:RecordAudio("120011153", var_622_12)
						arg_619_1:RecordAudio("120011153", var_622_12)
					else
						arg_619_1:AudioAction("play", "voice", "story_v_out_120011", "120011153", "story_v_out_120011.awb")
					end

					arg_619_1:RecordHistoryTalkVoice("story_v_out_120011", "120011153", "story_v_out_120011.awb")
				end

				arg_619_1:RecordContent(arg_619_1.text_.text)
			end

			local var_622_13 = math.max(var_622_4, arg_619_1.talkMaxDuration)

			if var_622_3 <= arg_619_1.time_ and arg_619_1.time_ < var_622_3 + var_622_13 then
				arg_619_1.typewritter.percent = (arg_619_1.time_ - var_622_3) / var_622_13

				arg_619_1.typewritter:SetDirty()
			end

			if arg_619_1.time_ >= var_622_3 + var_622_13 and arg_619_1.time_ < var_622_3 + var_622_13 + arg_622_0 then
				arg_619_1.typewritter.percent = 1

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(true)
			end
		end
	end,
	Play120011154 = function(arg_623_0, arg_623_1)
		arg_623_1.time_ = 0
		arg_623_1.frameCnt_ = 0
		arg_623_1.state_ = "playing"
		arg_623_1.curTalkId_ = 120011154
		arg_623_1.duration_ = 5.033

		local var_623_0 = {
			zh = 4.333,
			ja = 5.033
		}
		local var_623_1 = manager.audio:GetLocalizationFlag()

		if var_623_0[var_623_1] ~= nil then
			arg_623_1.duration_ = var_623_0[var_623_1]
		end

		SetActive(arg_623_1.tipsGo_, false)

		function arg_623_1.onSingleLineFinish_()
			arg_623_1.onSingleLineUpdate_ = nil
			arg_623_1.onSingleLineFinish_ = nil
			arg_623_1.state_ = "waiting"
		end

		function arg_623_1.playNext_(arg_625_0)
			if arg_625_0 == 1 then
				arg_623_0:Play120011155(arg_623_1)
			end
		end

		function arg_623_1.onSingleLineUpdate_(arg_626_0)
			local var_626_0 = 0
			local var_626_1 = 0.4

			if var_626_0 < arg_623_1.time_ and arg_623_1.time_ <= var_626_0 + arg_626_0 then
				arg_623_1.talkMaxDuration = 0
				arg_623_1.dialogCg_.alpha = 1

				arg_623_1.dialog_:SetActive(true)
				SetActive(arg_623_1.leftNameGo_, true)

				local var_626_2 = arg_623_1:FormatText(StoryNameCfg[378].name)

				arg_623_1.leftNameTxt_.text = var_626_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_623_1.leftNameTxt_.transform)

				arg_623_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_623_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_623_1:RecordName(arg_623_1.leftNameTxt_.text)
				SetActive(arg_623_1.iconTrs_.gameObject, false)
				arg_623_1.callingController_:SetSelectedState("normal")

				local var_626_3 = arg_623_1:GetWordFromCfg(120011154)
				local var_626_4 = arg_623_1:FormatText(var_626_3.content)

				arg_623_1.text_.text = var_626_4

				LuaForUtil.ClearLinePrefixSymbol(arg_623_1.text_)

				local var_626_5 = 16
				local var_626_6 = utf8.len(var_626_4)
				local var_626_7 = var_626_5 <= 0 and var_626_1 or var_626_1 * (var_626_6 / var_626_5)

				if var_626_7 > 0 and var_626_1 < var_626_7 then
					arg_623_1.talkMaxDuration = var_626_7

					if var_626_7 + var_626_0 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_7 + var_626_0
					end
				end

				arg_623_1.text_.text = var_626_4
				arg_623_1.typewritter.percent = 0

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011154", "story_v_out_120011.awb") ~= 0 then
					local var_626_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011154", "story_v_out_120011.awb") / 1000

					if var_626_8 + var_626_0 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_8 + var_626_0
					end

					if var_626_3.prefab_name ~= "" and arg_623_1.actors_[var_626_3.prefab_name] ~= nil then
						local var_626_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_623_1.actors_[var_626_3.prefab_name].transform, "story_v_out_120011", "120011154", "story_v_out_120011.awb")

						arg_623_1:RecordAudio("120011154", var_626_9)
						arg_623_1:RecordAudio("120011154", var_626_9)
					else
						arg_623_1:AudioAction("play", "voice", "story_v_out_120011", "120011154", "story_v_out_120011.awb")
					end

					arg_623_1:RecordHistoryTalkVoice("story_v_out_120011", "120011154", "story_v_out_120011.awb")
				end

				arg_623_1:RecordContent(arg_623_1.text_.text)
			end

			local var_626_10 = math.max(var_626_1, arg_623_1.talkMaxDuration)

			if var_626_0 <= arg_623_1.time_ and arg_623_1.time_ < var_626_0 + var_626_10 then
				arg_623_1.typewritter.percent = (arg_623_1.time_ - var_626_0) / var_626_10

				arg_623_1.typewritter:SetDirty()
			end

			if arg_623_1.time_ >= var_626_0 + var_626_10 and arg_623_1.time_ < var_626_0 + var_626_10 + arg_626_0 then
				arg_623_1.typewritter.percent = 1

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(true)
			end
		end
	end,
	Play120011155 = function(arg_627_0, arg_627_1)
		arg_627_1.time_ = 0
		arg_627_1.frameCnt_ = 0
		arg_627_1.state_ = "playing"
		arg_627_1.curTalkId_ = 120011155
		arg_627_1.duration_ = 5

		SetActive(arg_627_1.tipsGo_, false)

		function arg_627_1.onSingleLineFinish_()
			arg_627_1.onSingleLineUpdate_ = nil
			arg_627_1.onSingleLineFinish_ = nil
			arg_627_1.state_ = "waiting"
		end

		function arg_627_1.playNext_(arg_629_0)
			if arg_629_0 == 1 then
				arg_627_0:Play120011156(arg_627_1)
			end
		end

		function arg_627_1.onSingleLineUpdate_(arg_630_0)
			local var_630_0 = arg_627_1.actors_["1069ui_story"]
			local var_630_1 = 0

			if var_630_1 < arg_627_1.time_ and arg_627_1.time_ <= var_630_1 + arg_630_0 and arg_627_1.var_.characterEffect1069ui_story == nil then
				arg_627_1.var_.characterEffect1069ui_story = var_630_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_630_2 = 0.2

			if var_630_1 <= arg_627_1.time_ and arg_627_1.time_ < var_630_1 + var_630_2 then
				local var_630_3 = (arg_627_1.time_ - var_630_1) / var_630_2

				if arg_627_1.var_.characterEffect1069ui_story then
					local var_630_4 = Mathf.Lerp(0, 0.5, var_630_3)

					arg_627_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_627_1.var_.characterEffect1069ui_story.fillRatio = var_630_4
				end
			end

			if arg_627_1.time_ >= var_630_1 + var_630_2 and arg_627_1.time_ < var_630_1 + var_630_2 + arg_630_0 and arg_627_1.var_.characterEffect1069ui_story then
				local var_630_5 = 0.5

				arg_627_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_627_1.var_.characterEffect1069ui_story.fillRatio = var_630_5
			end

			local var_630_6 = 0
			local var_630_7 = 0.925

			if var_630_6 < arg_627_1.time_ and arg_627_1.time_ <= var_630_6 + arg_630_0 then
				arg_627_1.talkMaxDuration = 0
				arg_627_1.dialogCg_.alpha = 1

				arg_627_1.dialog_:SetActive(true)
				SetActive(arg_627_1.leftNameGo_, true)

				local var_630_8 = arg_627_1:FormatText(StoryNameCfg[7].name)

				arg_627_1.leftNameTxt_.text = var_630_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_627_1.leftNameTxt_.transform)

				arg_627_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_627_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_627_1:RecordName(arg_627_1.leftNameTxt_.text)
				SetActive(arg_627_1.iconTrs_.gameObject, false)
				arg_627_1.callingController_:SetSelectedState("normal")

				local var_630_9 = arg_627_1:GetWordFromCfg(120011155)
				local var_630_10 = arg_627_1:FormatText(var_630_9.content)

				arg_627_1.text_.text = var_630_10

				LuaForUtil.ClearLinePrefixSymbol(arg_627_1.text_)

				local var_630_11 = 37
				local var_630_12 = utf8.len(var_630_10)
				local var_630_13 = var_630_11 <= 0 and var_630_7 or var_630_7 * (var_630_12 / var_630_11)

				if var_630_13 > 0 and var_630_7 < var_630_13 then
					arg_627_1.talkMaxDuration = var_630_13

					if var_630_13 + var_630_6 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_13 + var_630_6
					end
				end

				arg_627_1.text_.text = var_630_10
				arg_627_1.typewritter.percent = 0

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(false)
				arg_627_1:RecordContent(arg_627_1.text_.text)
			end

			local var_630_14 = math.max(var_630_7, arg_627_1.talkMaxDuration)

			if var_630_6 <= arg_627_1.time_ and arg_627_1.time_ < var_630_6 + var_630_14 then
				arg_627_1.typewritter.percent = (arg_627_1.time_ - var_630_6) / var_630_14

				arg_627_1.typewritter:SetDirty()
			end

			if arg_627_1.time_ >= var_630_6 + var_630_14 and arg_627_1.time_ < var_630_6 + var_630_14 + arg_630_0 then
				arg_627_1.typewritter.percent = 1

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(true)
			end
		end
	end,
	Play120011156 = function(arg_631_0, arg_631_1)
		arg_631_1.time_ = 0
		arg_631_1.frameCnt_ = 0
		arg_631_1.state_ = "playing"
		arg_631_1.curTalkId_ = 120011156
		arg_631_1.duration_ = 1.466

		local var_631_0 = {
			zh = 1.466,
			ja = 0.999999999999
		}
		local var_631_1 = manager.audio:GetLocalizationFlag()

		if var_631_0[var_631_1] ~= nil then
			arg_631_1.duration_ = var_631_0[var_631_1]
		end

		SetActive(arg_631_1.tipsGo_, false)

		function arg_631_1.onSingleLineFinish_()
			arg_631_1.onSingleLineUpdate_ = nil
			arg_631_1.onSingleLineFinish_ = nil
			arg_631_1.state_ = "waiting"
		end

		function arg_631_1.playNext_(arg_633_0)
			if arg_633_0 == 1 then
				arg_631_0:Play120011157(arg_631_1)
			end
		end

		function arg_631_1.onSingleLineUpdate_(arg_634_0)
			local var_634_0 = arg_631_1.actors_["1069ui_story"]
			local var_634_1 = 0

			if var_634_1 < arg_631_1.time_ and arg_631_1.time_ <= var_634_1 + arg_634_0 and arg_631_1.var_.characterEffect1069ui_story == nil then
				arg_631_1.var_.characterEffect1069ui_story = var_634_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_634_2 = 0.2

			if var_634_1 <= arg_631_1.time_ and arg_631_1.time_ < var_634_1 + var_634_2 then
				local var_634_3 = (arg_631_1.time_ - var_634_1) / var_634_2

				if arg_631_1.var_.characterEffect1069ui_story then
					arg_631_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_631_1.time_ >= var_634_1 + var_634_2 and arg_631_1.time_ < var_634_1 + var_634_2 + arg_634_0 and arg_631_1.var_.characterEffect1069ui_story then
				arg_631_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_634_4 = 0
			local var_634_5 = 0.125

			if var_634_4 < arg_631_1.time_ and arg_631_1.time_ <= var_634_4 + arg_634_0 then
				arg_631_1.talkMaxDuration = 0
				arg_631_1.dialogCg_.alpha = 1

				arg_631_1.dialog_:SetActive(true)
				SetActive(arg_631_1.leftNameGo_, true)

				local var_634_6 = arg_631_1:FormatText(StoryNameCfg[378].name)

				arg_631_1.leftNameTxt_.text = var_634_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_631_1.leftNameTxt_.transform)

				arg_631_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_631_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_631_1:RecordName(arg_631_1.leftNameTxt_.text)
				SetActive(arg_631_1.iconTrs_.gameObject, false)
				arg_631_1.callingController_:SetSelectedState("normal")

				local var_634_7 = arg_631_1:GetWordFromCfg(120011156)
				local var_634_8 = arg_631_1:FormatText(var_634_7.content)

				arg_631_1.text_.text = var_634_8

				LuaForUtil.ClearLinePrefixSymbol(arg_631_1.text_)

				local var_634_9 = 5
				local var_634_10 = utf8.len(var_634_8)
				local var_634_11 = var_634_9 <= 0 and var_634_5 or var_634_5 * (var_634_10 / var_634_9)

				if var_634_11 > 0 and var_634_5 < var_634_11 then
					arg_631_1.talkMaxDuration = var_634_11

					if var_634_11 + var_634_4 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_11 + var_634_4
					end
				end

				arg_631_1.text_.text = var_634_8
				arg_631_1.typewritter.percent = 0

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011156", "story_v_out_120011.awb") ~= 0 then
					local var_634_12 = manager.audio:GetVoiceLength("story_v_out_120011", "120011156", "story_v_out_120011.awb") / 1000

					if var_634_12 + var_634_4 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_12 + var_634_4
					end

					if var_634_7.prefab_name ~= "" and arg_631_1.actors_[var_634_7.prefab_name] ~= nil then
						local var_634_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_631_1.actors_[var_634_7.prefab_name].transform, "story_v_out_120011", "120011156", "story_v_out_120011.awb")

						arg_631_1:RecordAudio("120011156", var_634_13)
						arg_631_1:RecordAudio("120011156", var_634_13)
					else
						arg_631_1:AudioAction("play", "voice", "story_v_out_120011", "120011156", "story_v_out_120011.awb")
					end

					arg_631_1:RecordHistoryTalkVoice("story_v_out_120011", "120011156", "story_v_out_120011.awb")
				end

				arg_631_1:RecordContent(arg_631_1.text_.text)
			end

			local var_634_14 = math.max(var_634_5, arg_631_1.talkMaxDuration)

			if var_634_4 <= arg_631_1.time_ and arg_631_1.time_ < var_634_4 + var_634_14 then
				arg_631_1.typewritter.percent = (arg_631_1.time_ - var_634_4) / var_634_14

				arg_631_1.typewritter:SetDirty()
			end

			if arg_631_1.time_ >= var_634_4 + var_634_14 and arg_631_1.time_ < var_634_4 + var_634_14 + arg_634_0 then
				arg_631_1.typewritter.percent = 1

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(true)
			end
		end
	end,
	Play120011157 = function(arg_635_0, arg_635_1)
		arg_635_1.time_ = 0
		arg_635_1.frameCnt_ = 0
		arg_635_1.state_ = "playing"
		arg_635_1.curTalkId_ = 120011157
		arg_635_1.duration_ = 5

		SetActive(arg_635_1.tipsGo_, false)

		function arg_635_1.onSingleLineFinish_()
			arg_635_1.onSingleLineUpdate_ = nil
			arg_635_1.onSingleLineFinish_ = nil
			arg_635_1.state_ = "waiting"
		end

		function arg_635_1.playNext_(arg_637_0)
			if arg_637_0 == 1 then
				arg_635_0:Play120011158(arg_635_1)
			end
		end

		function arg_635_1.onSingleLineUpdate_(arg_638_0)
			local var_638_0 = arg_635_1.actors_["1084ui_story"].transform
			local var_638_1 = 0

			if var_638_1 < arg_635_1.time_ and arg_635_1.time_ <= var_638_1 + arg_638_0 then
				arg_635_1.var_.moveOldPos1084ui_story = var_638_0.localPosition
			end

			local var_638_2 = 0.001

			if var_638_1 <= arg_635_1.time_ and arg_635_1.time_ < var_638_1 + var_638_2 then
				local var_638_3 = (arg_635_1.time_ - var_638_1) / var_638_2
				local var_638_4 = Vector3.New(0, 100, 0)

				var_638_0.localPosition = Vector3.Lerp(arg_635_1.var_.moveOldPos1084ui_story, var_638_4, var_638_3)

				local var_638_5 = manager.ui.mainCamera.transform.position - var_638_0.position

				var_638_0.forward = Vector3.New(var_638_5.x, var_638_5.y, var_638_5.z)

				local var_638_6 = var_638_0.localEulerAngles

				var_638_6.z = 0
				var_638_6.x = 0
				var_638_0.localEulerAngles = var_638_6
			end

			if arg_635_1.time_ >= var_638_1 + var_638_2 and arg_635_1.time_ < var_638_1 + var_638_2 + arg_638_0 then
				var_638_0.localPosition = Vector3.New(0, 100, 0)

				local var_638_7 = manager.ui.mainCamera.transform.position - var_638_0.position

				var_638_0.forward = Vector3.New(var_638_7.x, var_638_7.y, var_638_7.z)

				local var_638_8 = var_638_0.localEulerAngles

				var_638_8.z = 0
				var_638_8.x = 0
				var_638_0.localEulerAngles = var_638_8
			end

			local var_638_9 = arg_635_1.actors_["1069ui_story"].transform
			local var_638_10 = 0

			if var_638_10 < arg_635_1.time_ and arg_635_1.time_ <= var_638_10 + arg_638_0 then
				arg_635_1.var_.moveOldPos1069ui_story = var_638_9.localPosition
			end

			local var_638_11 = 0.001

			if var_638_10 <= arg_635_1.time_ and arg_635_1.time_ < var_638_10 + var_638_11 then
				local var_638_12 = (arg_635_1.time_ - var_638_10) / var_638_11
				local var_638_13 = Vector3.New(0, 100, 0)

				var_638_9.localPosition = Vector3.Lerp(arg_635_1.var_.moveOldPos1069ui_story, var_638_13, var_638_12)

				local var_638_14 = manager.ui.mainCamera.transform.position - var_638_9.position

				var_638_9.forward = Vector3.New(var_638_14.x, var_638_14.y, var_638_14.z)

				local var_638_15 = var_638_9.localEulerAngles

				var_638_15.z = 0
				var_638_15.x = 0
				var_638_9.localEulerAngles = var_638_15
			end

			if arg_635_1.time_ >= var_638_10 + var_638_11 and arg_635_1.time_ < var_638_10 + var_638_11 + arg_638_0 then
				var_638_9.localPosition = Vector3.New(0, 100, 0)

				local var_638_16 = manager.ui.mainCamera.transform.position - var_638_9.position

				var_638_9.forward = Vector3.New(var_638_16.x, var_638_16.y, var_638_16.z)

				local var_638_17 = var_638_9.localEulerAngles

				var_638_17.z = 0
				var_638_17.x = 0
				var_638_9.localEulerAngles = var_638_17
			end

			local var_638_18 = 0
			local var_638_19 = 0.9

			if var_638_18 < arg_635_1.time_ and arg_635_1.time_ <= var_638_18 + arg_638_0 then
				arg_635_1.talkMaxDuration = 0
				arg_635_1.dialogCg_.alpha = 1

				arg_635_1.dialog_:SetActive(true)
				SetActive(arg_635_1.leftNameGo_, false)

				arg_635_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_635_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_635_1:RecordName(arg_635_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_635_1.iconTrs_.gameObject, false)
				arg_635_1.callingController_:SetSelectedState("normal")

				local var_638_20 = arg_635_1:GetWordFromCfg(120011157)
				local var_638_21 = arg_635_1:FormatText(var_638_20.content)

				arg_635_1.text_.text = var_638_21

				LuaForUtil.ClearLinePrefixSymbol(arg_635_1.text_)

				local var_638_22 = 36
				local var_638_23 = utf8.len(var_638_21)
				local var_638_24 = var_638_22 <= 0 and var_638_19 or var_638_19 * (var_638_23 / var_638_22)

				if var_638_24 > 0 and var_638_19 < var_638_24 then
					arg_635_1.talkMaxDuration = var_638_24

					if var_638_24 + var_638_18 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_24 + var_638_18
					end
				end

				arg_635_1.text_.text = var_638_21
				arg_635_1.typewritter.percent = 0

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(false)
				arg_635_1:RecordContent(arg_635_1.text_.text)
			end

			local var_638_25 = math.max(var_638_19, arg_635_1.talkMaxDuration)

			if var_638_18 <= arg_635_1.time_ and arg_635_1.time_ < var_638_18 + var_638_25 then
				arg_635_1.typewritter.percent = (arg_635_1.time_ - var_638_18) / var_638_25

				arg_635_1.typewritter:SetDirty()
			end

			if arg_635_1.time_ >= var_638_18 + var_638_25 and arg_635_1.time_ < var_638_18 + var_638_25 + arg_638_0 then
				arg_635_1.typewritter.percent = 1

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(true)
			end
		end
	end,
	Play120011158 = function(arg_639_0, arg_639_1)
		arg_639_1.time_ = 0
		arg_639_1.frameCnt_ = 0
		arg_639_1.state_ = "playing"
		arg_639_1.curTalkId_ = 120011158
		arg_639_1.duration_ = 5

		SetActive(arg_639_1.tipsGo_, false)

		function arg_639_1.onSingleLineFinish_()
			arg_639_1.onSingleLineUpdate_ = nil
			arg_639_1.onSingleLineFinish_ = nil
			arg_639_1.state_ = "waiting"
		end

		function arg_639_1.playNext_(arg_641_0)
			if arg_641_0 == 1 then
				arg_639_0:Play120011159(arg_639_1)
			end
		end

		function arg_639_1.onSingleLineUpdate_(arg_642_0)
			local var_642_0 = 0
			local var_642_1 = 0.15

			if var_642_0 < arg_639_1.time_ and arg_639_1.time_ <= var_642_0 + arg_642_0 then
				arg_639_1.talkMaxDuration = 0
				arg_639_1.dialogCg_.alpha = 1

				arg_639_1.dialog_:SetActive(true)
				SetActive(arg_639_1.leftNameGo_, true)

				local var_642_2 = arg_639_1:FormatText(StoryNameCfg[7].name)

				arg_639_1.leftNameTxt_.text = var_642_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_639_1.leftNameTxt_.transform)

				arg_639_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_639_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_639_1:RecordName(arg_639_1.leftNameTxt_.text)
				SetActive(arg_639_1.iconTrs_.gameObject, false)
				arg_639_1.callingController_:SetSelectedState("normal")

				local var_642_3 = arg_639_1:GetWordFromCfg(120011158)
				local var_642_4 = arg_639_1:FormatText(var_642_3.content)

				arg_639_1.text_.text = var_642_4

				LuaForUtil.ClearLinePrefixSymbol(arg_639_1.text_)

				local var_642_5 = 6
				local var_642_6 = utf8.len(var_642_4)
				local var_642_7 = var_642_5 <= 0 and var_642_1 or var_642_1 * (var_642_6 / var_642_5)

				if var_642_7 > 0 and var_642_1 < var_642_7 then
					arg_639_1.talkMaxDuration = var_642_7

					if var_642_7 + var_642_0 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_7 + var_642_0
					end
				end

				arg_639_1.text_.text = var_642_4
				arg_639_1.typewritter.percent = 0

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(false)
				arg_639_1:RecordContent(arg_639_1.text_.text)
			end

			local var_642_8 = math.max(var_642_1, arg_639_1.talkMaxDuration)

			if var_642_0 <= arg_639_1.time_ and arg_639_1.time_ < var_642_0 + var_642_8 then
				arg_639_1.typewritter.percent = (arg_639_1.time_ - var_642_0) / var_642_8

				arg_639_1.typewritter:SetDirty()
			end

			if arg_639_1.time_ >= var_642_0 + var_642_8 and arg_639_1.time_ < var_642_0 + var_642_8 + arg_642_0 then
				arg_639_1.typewritter.percent = 1

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(true)
			end
		end
	end,
	Play120011159 = function(arg_643_0, arg_643_1)
		arg_643_1.time_ = 0
		arg_643_1.frameCnt_ = 0
		arg_643_1.state_ = "playing"
		arg_643_1.curTalkId_ = 120011159
		arg_643_1.duration_ = 2.866

		local var_643_0 = {
			zh = 2.8,
			ja = 2.866
		}
		local var_643_1 = manager.audio:GetLocalizationFlag()

		if var_643_0[var_643_1] ~= nil then
			arg_643_1.duration_ = var_643_0[var_643_1]
		end

		SetActive(arg_643_1.tipsGo_, false)

		function arg_643_1.onSingleLineFinish_()
			arg_643_1.onSingleLineUpdate_ = nil
			arg_643_1.onSingleLineFinish_ = nil
			arg_643_1.state_ = "waiting"
		end

		function arg_643_1.playNext_(arg_645_0)
			if arg_645_0 == 1 then
				arg_643_0:Play120011160(arg_643_1)
			end
		end

		function arg_643_1.onSingleLineUpdate_(arg_646_0)
			local var_646_0 = arg_643_1.actors_["1069ui_story"].transform
			local var_646_1 = 0

			if var_646_1 < arg_643_1.time_ and arg_643_1.time_ <= var_646_1 + arg_646_0 then
				arg_643_1.var_.moveOldPos1069ui_story = var_646_0.localPosition
			end

			local var_646_2 = 0.001

			if var_646_1 <= arg_643_1.time_ and arg_643_1.time_ < var_646_1 + var_646_2 then
				local var_646_3 = (arg_643_1.time_ - var_646_1) / var_646_2
				local var_646_4 = Vector3.New(0, -1, -6)

				var_646_0.localPosition = Vector3.Lerp(arg_643_1.var_.moveOldPos1069ui_story, var_646_4, var_646_3)

				local var_646_5 = manager.ui.mainCamera.transform.position - var_646_0.position

				var_646_0.forward = Vector3.New(var_646_5.x, var_646_5.y, var_646_5.z)

				local var_646_6 = var_646_0.localEulerAngles

				var_646_6.z = 0
				var_646_6.x = 0
				var_646_0.localEulerAngles = var_646_6
			end

			if arg_643_1.time_ >= var_646_1 + var_646_2 and arg_643_1.time_ < var_646_1 + var_646_2 + arg_646_0 then
				var_646_0.localPosition = Vector3.New(0, -1, -6)

				local var_646_7 = manager.ui.mainCamera.transform.position - var_646_0.position

				var_646_0.forward = Vector3.New(var_646_7.x, var_646_7.y, var_646_7.z)

				local var_646_8 = var_646_0.localEulerAngles

				var_646_8.z = 0
				var_646_8.x = 0
				var_646_0.localEulerAngles = var_646_8
			end

			local var_646_9 = arg_643_1.actors_["1069ui_story"]
			local var_646_10 = 0

			if var_646_10 < arg_643_1.time_ and arg_643_1.time_ <= var_646_10 + arg_646_0 and arg_643_1.var_.characterEffect1069ui_story == nil then
				arg_643_1.var_.characterEffect1069ui_story = var_646_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_646_11 = 0.2

			if var_646_10 <= arg_643_1.time_ and arg_643_1.time_ < var_646_10 + var_646_11 then
				local var_646_12 = (arg_643_1.time_ - var_646_10) / var_646_11

				if arg_643_1.var_.characterEffect1069ui_story then
					arg_643_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_643_1.time_ >= var_646_10 + var_646_11 and arg_643_1.time_ < var_646_10 + var_646_11 + arg_646_0 and arg_643_1.var_.characterEffect1069ui_story then
				arg_643_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_646_13 = 0

			if var_646_13 < arg_643_1.time_ and arg_643_1.time_ <= var_646_13 + arg_646_0 then
				arg_643_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_646_14 = 0

			if var_646_14 < arg_643_1.time_ and arg_643_1.time_ <= var_646_14 + arg_646_0 then
				arg_643_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action1_1")
			end

			local var_646_15 = 0
			local var_646_16 = 0.225

			if var_646_15 < arg_643_1.time_ and arg_643_1.time_ <= var_646_15 + arg_646_0 then
				arg_643_1.talkMaxDuration = 0
				arg_643_1.dialogCg_.alpha = 1

				arg_643_1.dialog_:SetActive(true)
				SetActive(arg_643_1.leftNameGo_, true)

				local var_646_17 = arg_643_1:FormatText(StoryNameCfg[378].name)

				arg_643_1.leftNameTxt_.text = var_646_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_643_1.leftNameTxt_.transform)

				arg_643_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_643_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_643_1:RecordName(arg_643_1.leftNameTxt_.text)
				SetActive(arg_643_1.iconTrs_.gameObject, false)
				arg_643_1.callingController_:SetSelectedState("normal")

				local var_646_18 = arg_643_1:GetWordFromCfg(120011159)
				local var_646_19 = arg_643_1:FormatText(var_646_18.content)

				arg_643_1.text_.text = var_646_19

				LuaForUtil.ClearLinePrefixSymbol(arg_643_1.text_)

				local var_646_20 = 9
				local var_646_21 = utf8.len(var_646_19)
				local var_646_22 = var_646_20 <= 0 and var_646_16 or var_646_16 * (var_646_21 / var_646_20)

				if var_646_22 > 0 and var_646_16 < var_646_22 then
					arg_643_1.talkMaxDuration = var_646_22

					if var_646_22 + var_646_15 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_22 + var_646_15
					end
				end

				arg_643_1.text_.text = var_646_19
				arg_643_1.typewritter.percent = 0

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011159", "story_v_out_120011.awb") ~= 0 then
					local var_646_23 = manager.audio:GetVoiceLength("story_v_out_120011", "120011159", "story_v_out_120011.awb") / 1000

					if var_646_23 + var_646_15 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_23 + var_646_15
					end

					if var_646_18.prefab_name ~= "" and arg_643_1.actors_[var_646_18.prefab_name] ~= nil then
						local var_646_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_643_1.actors_[var_646_18.prefab_name].transform, "story_v_out_120011", "120011159", "story_v_out_120011.awb")

						arg_643_1:RecordAudio("120011159", var_646_24)
						arg_643_1:RecordAudio("120011159", var_646_24)
					else
						arg_643_1:AudioAction("play", "voice", "story_v_out_120011", "120011159", "story_v_out_120011.awb")
					end

					arg_643_1:RecordHistoryTalkVoice("story_v_out_120011", "120011159", "story_v_out_120011.awb")
				end

				arg_643_1:RecordContent(arg_643_1.text_.text)
			end

			local var_646_25 = math.max(var_646_16, arg_643_1.talkMaxDuration)

			if var_646_15 <= arg_643_1.time_ and arg_643_1.time_ < var_646_15 + var_646_25 then
				arg_643_1.typewritter.percent = (arg_643_1.time_ - var_646_15) / var_646_25

				arg_643_1.typewritter:SetDirty()
			end

			if arg_643_1.time_ >= var_646_15 + var_646_25 and arg_643_1.time_ < var_646_15 + var_646_25 + arg_646_0 then
				arg_643_1.typewritter.percent = 1

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(true)
			end
		end
	end,
	Play120011160 = function(arg_647_0, arg_647_1)
		arg_647_1.time_ = 0
		arg_647_1.frameCnt_ = 0
		arg_647_1.state_ = "playing"
		arg_647_1.curTalkId_ = 120011160
		arg_647_1.duration_ = 5.233

		local var_647_0 = {
			zh = 1.999999999999,
			ja = 5.233
		}
		local var_647_1 = manager.audio:GetLocalizationFlag()

		if var_647_0[var_647_1] ~= nil then
			arg_647_1.duration_ = var_647_0[var_647_1]
		end

		SetActive(arg_647_1.tipsGo_, false)

		function arg_647_1.onSingleLineFinish_()
			arg_647_1.onSingleLineUpdate_ = nil
			arg_647_1.onSingleLineFinish_ = nil
			arg_647_1.state_ = "waiting"
		end

		function arg_647_1.playNext_(arg_649_0)
			if arg_649_0 == 1 then
				arg_647_0:Play120011161(arg_647_1)
			end
		end

		function arg_647_1.onSingleLineUpdate_(arg_650_0)
			local var_650_0 = "1072ui_story"

			if arg_647_1.actors_[var_650_0] == nil then
				local var_650_1 = Object.Instantiate(Asset.Load("Char/" .. var_650_0), arg_647_1.stage_.transform)

				var_650_1.name = var_650_0
				var_650_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_647_1.actors_[var_650_0] = var_650_1

				local var_650_2 = var_650_1:GetComponentInChildren(typeof(CharacterEffect))

				var_650_2.enabled = true

				local var_650_3 = GameObjectTools.GetOrAddComponent(var_650_1, typeof(DynamicBoneHelper))

				if var_650_3 then
					var_650_3:EnableDynamicBone(false)
				end

				arg_647_1:ShowWeapon(var_650_2.transform, false)

				arg_647_1.var_[var_650_0 .. "Animator"] = var_650_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_647_1.var_[var_650_0 .. "Animator"].applyRootMotion = true
				arg_647_1.var_[var_650_0 .. "LipSync"] = var_650_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_650_4 = arg_647_1.actors_["1072ui_story"].transform
			local var_650_5 = 0

			if var_650_5 < arg_647_1.time_ and arg_647_1.time_ <= var_650_5 + arg_650_0 then
				arg_647_1.var_.moveOldPos1072ui_story = var_650_4.localPosition

				local var_650_6 = "1072ui_story"

				arg_647_1:ShowWeapon(arg_647_1.var_[var_650_6 .. "Animator"].transform, false)
			end

			local var_650_7 = 0.001

			if var_650_5 <= arg_647_1.time_ and arg_647_1.time_ < var_650_5 + var_650_7 then
				local var_650_8 = (arg_647_1.time_ - var_650_5) / var_650_7
				local var_650_9 = Vector3.New(0, -0.71, -6)

				var_650_4.localPosition = Vector3.Lerp(arg_647_1.var_.moveOldPos1072ui_story, var_650_9, var_650_8)

				local var_650_10 = manager.ui.mainCamera.transform.position - var_650_4.position

				var_650_4.forward = Vector3.New(var_650_10.x, var_650_10.y, var_650_10.z)

				local var_650_11 = var_650_4.localEulerAngles

				var_650_11.z = 0
				var_650_11.x = 0
				var_650_4.localEulerAngles = var_650_11
			end

			if arg_647_1.time_ >= var_650_5 + var_650_7 and arg_647_1.time_ < var_650_5 + var_650_7 + arg_650_0 then
				var_650_4.localPosition = Vector3.New(0, -0.71, -6)

				local var_650_12 = manager.ui.mainCamera.transform.position - var_650_4.position

				var_650_4.forward = Vector3.New(var_650_12.x, var_650_12.y, var_650_12.z)

				local var_650_13 = var_650_4.localEulerAngles

				var_650_13.z = 0
				var_650_13.x = 0
				var_650_4.localEulerAngles = var_650_13
			end

			local var_650_14 = arg_647_1.actors_["1072ui_story"]
			local var_650_15 = 0

			if var_650_15 < arg_647_1.time_ and arg_647_1.time_ <= var_650_15 + arg_650_0 and arg_647_1.var_.characterEffect1072ui_story == nil then
				arg_647_1.var_.characterEffect1072ui_story = var_650_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_650_16 = 0.2

			if var_650_15 <= arg_647_1.time_ and arg_647_1.time_ < var_650_15 + var_650_16 then
				local var_650_17 = (arg_647_1.time_ - var_650_15) / var_650_16

				if arg_647_1.var_.characterEffect1072ui_story then
					arg_647_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_647_1.time_ >= var_650_15 + var_650_16 and arg_647_1.time_ < var_650_15 + var_650_16 + arg_650_0 and arg_647_1.var_.characterEffect1072ui_story then
				arg_647_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_650_18 = arg_647_1.actors_["1069ui_story"].transform
			local var_650_19 = 0

			if var_650_19 < arg_647_1.time_ and arg_647_1.time_ <= var_650_19 + arg_650_0 then
				arg_647_1.var_.moveOldPos1069ui_story = var_650_18.localPosition
			end

			local var_650_20 = 0.001

			if var_650_19 <= arg_647_1.time_ and arg_647_1.time_ < var_650_19 + var_650_20 then
				local var_650_21 = (arg_647_1.time_ - var_650_19) / var_650_20
				local var_650_22 = Vector3.New(0, 100, 0)

				var_650_18.localPosition = Vector3.Lerp(arg_647_1.var_.moveOldPos1069ui_story, var_650_22, var_650_21)

				local var_650_23 = manager.ui.mainCamera.transform.position - var_650_18.position

				var_650_18.forward = Vector3.New(var_650_23.x, var_650_23.y, var_650_23.z)

				local var_650_24 = var_650_18.localEulerAngles

				var_650_24.z = 0
				var_650_24.x = 0
				var_650_18.localEulerAngles = var_650_24
			end

			if arg_647_1.time_ >= var_650_19 + var_650_20 and arg_647_1.time_ < var_650_19 + var_650_20 + arg_650_0 then
				var_650_18.localPosition = Vector3.New(0, 100, 0)

				local var_650_25 = manager.ui.mainCamera.transform.position - var_650_18.position

				var_650_18.forward = Vector3.New(var_650_25.x, var_650_25.y, var_650_25.z)

				local var_650_26 = var_650_18.localEulerAngles

				var_650_26.z = 0
				var_650_26.x = 0
				var_650_18.localEulerAngles = var_650_26
			end

			local var_650_27 = 0

			if var_650_27 < arg_647_1.time_ and arg_647_1.time_ <= var_650_27 + arg_650_0 then
				arg_647_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action5_1")
			end

			local var_650_28 = 0

			if var_650_28 < arg_647_1.time_ and arg_647_1.time_ <= var_650_28 + arg_650_0 then
				arg_647_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_650_29 = 0
			local var_650_30 = 0.15

			if var_650_29 < arg_647_1.time_ and arg_647_1.time_ <= var_650_29 + arg_650_0 then
				arg_647_1.talkMaxDuration = 0
				arg_647_1.dialogCg_.alpha = 1

				arg_647_1.dialog_:SetActive(true)
				SetActive(arg_647_1.leftNameGo_, true)

				local var_650_31 = arg_647_1:FormatText(StoryNameCfg[36].name)

				arg_647_1.leftNameTxt_.text = var_650_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_647_1.leftNameTxt_.transform)

				arg_647_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_647_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_647_1:RecordName(arg_647_1.leftNameTxt_.text)
				SetActive(arg_647_1.iconTrs_.gameObject, false)
				arg_647_1.callingController_:SetSelectedState("normal")

				local var_650_32 = arg_647_1:GetWordFromCfg(120011160)
				local var_650_33 = arg_647_1:FormatText(var_650_32.content)

				arg_647_1.text_.text = var_650_33

				LuaForUtil.ClearLinePrefixSymbol(arg_647_1.text_)

				local var_650_34 = 6
				local var_650_35 = utf8.len(var_650_33)
				local var_650_36 = var_650_34 <= 0 and var_650_30 or var_650_30 * (var_650_35 / var_650_34)

				if var_650_36 > 0 and var_650_30 < var_650_36 then
					arg_647_1.talkMaxDuration = var_650_36

					if var_650_36 + var_650_29 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_36 + var_650_29
					end
				end

				arg_647_1.text_.text = var_650_33
				arg_647_1.typewritter.percent = 0

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011160", "story_v_out_120011.awb") ~= 0 then
					local var_650_37 = manager.audio:GetVoiceLength("story_v_out_120011", "120011160", "story_v_out_120011.awb") / 1000

					if var_650_37 + var_650_29 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_37 + var_650_29
					end

					if var_650_32.prefab_name ~= "" and arg_647_1.actors_[var_650_32.prefab_name] ~= nil then
						local var_650_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_647_1.actors_[var_650_32.prefab_name].transform, "story_v_out_120011", "120011160", "story_v_out_120011.awb")

						arg_647_1:RecordAudio("120011160", var_650_38)
						arg_647_1:RecordAudio("120011160", var_650_38)
					else
						arg_647_1:AudioAction("play", "voice", "story_v_out_120011", "120011160", "story_v_out_120011.awb")
					end

					arg_647_1:RecordHistoryTalkVoice("story_v_out_120011", "120011160", "story_v_out_120011.awb")
				end

				arg_647_1:RecordContent(arg_647_1.text_.text)
			end

			local var_650_39 = math.max(var_650_30, arg_647_1.talkMaxDuration)

			if var_650_29 <= arg_647_1.time_ and arg_647_1.time_ < var_650_29 + var_650_39 then
				arg_647_1.typewritter.percent = (arg_647_1.time_ - var_650_29) / var_650_39

				arg_647_1.typewritter:SetDirty()
			end

			if arg_647_1.time_ >= var_650_29 + var_650_39 and arg_647_1.time_ < var_650_29 + var_650_39 + arg_650_0 then
				arg_647_1.typewritter.percent = 1

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(true)
			end
		end
	end,
	Play120011161 = function(arg_651_0, arg_651_1)
		arg_651_1.time_ = 0
		arg_651_1.frameCnt_ = 0
		arg_651_1.state_ = "playing"
		arg_651_1.curTalkId_ = 120011161
		arg_651_1.duration_ = 5

		SetActive(arg_651_1.tipsGo_, false)

		function arg_651_1.onSingleLineFinish_()
			arg_651_1.onSingleLineUpdate_ = nil
			arg_651_1.onSingleLineFinish_ = nil
			arg_651_1.state_ = "waiting"
		end

		function arg_651_1.playNext_(arg_653_0)
			if arg_653_0 == 1 then
				arg_651_0:Play120011162(arg_651_1)
			end
		end

		function arg_651_1.onSingleLineUpdate_(arg_654_0)
			local var_654_0 = arg_651_1.actors_["1072ui_story"]
			local var_654_1 = 0

			if var_654_1 < arg_651_1.time_ and arg_651_1.time_ <= var_654_1 + arg_654_0 and arg_651_1.var_.characterEffect1072ui_story == nil then
				arg_651_1.var_.characterEffect1072ui_story = var_654_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_654_2 = 0.2

			if var_654_1 <= arg_651_1.time_ and arg_651_1.time_ < var_654_1 + var_654_2 then
				local var_654_3 = (arg_651_1.time_ - var_654_1) / var_654_2

				if arg_651_1.var_.characterEffect1072ui_story then
					local var_654_4 = Mathf.Lerp(0, 0.5, var_654_3)

					arg_651_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_651_1.var_.characterEffect1072ui_story.fillRatio = var_654_4
				end
			end

			if arg_651_1.time_ >= var_654_1 + var_654_2 and arg_651_1.time_ < var_654_1 + var_654_2 + arg_654_0 and arg_651_1.var_.characterEffect1072ui_story then
				local var_654_5 = 0.5

				arg_651_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_651_1.var_.characterEffect1072ui_story.fillRatio = var_654_5
			end

			local var_654_6 = 0
			local var_654_7 = 0.475

			if var_654_6 < arg_651_1.time_ and arg_651_1.time_ <= var_654_6 + arg_654_0 then
				arg_651_1.talkMaxDuration = 0
				arg_651_1.dialogCg_.alpha = 1

				arg_651_1.dialog_:SetActive(true)
				SetActive(arg_651_1.leftNameGo_, false)

				arg_651_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_651_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_651_1:RecordName(arg_651_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_651_1.iconTrs_.gameObject, false)
				arg_651_1.callingController_:SetSelectedState("normal")

				local var_654_8 = arg_651_1:GetWordFromCfg(120011161)
				local var_654_9 = arg_651_1:FormatText(var_654_8.content)

				arg_651_1.text_.text = var_654_9

				LuaForUtil.ClearLinePrefixSymbol(arg_651_1.text_)

				local var_654_10 = 19
				local var_654_11 = utf8.len(var_654_9)
				local var_654_12 = var_654_10 <= 0 and var_654_7 or var_654_7 * (var_654_11 / var_654_10)

				if var_654_12 > 0 and var_654_7 < var_654_12 then
					arg_651_1.talkMaxDuration = var_654_12

					if var_654_12 + var_654_6 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_12 + var_654_6
					end
				end

				arg_651_1.text_.text = var_654_9
				arg_651_1.typewritter.percent = 0

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(false)
				arg_651_1:RecordContent(arg_651_1.text_.text)
			end

			local var_654_13 = math.max(var_654_7, arg_651_1.talkMaxDuration)

			if var_654_6 <= arg_651_1.time_ and arg_651_1.time_ < var_654_6 + var_654_13 then
				arg_651_1.typewritter.percent = (arg_651_1.time_ - var_654_6) / var_654_13

				arg_651_1.typewritter:SetDirty()
			end

			if arg_651_1.time_ >= var_654_6 + var_654_13 and arg_651_1.time_ < var_654_6 + var_654_13 + arg_654_0 then
				arg_651_1.typewritter.percent = 1

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(true)
			end
		end
	end,
	Play120011162 = function(arg_655_0, arg_655_1)
		arg_655_1.time_ = 0
		arg_655_1.frameCnt_ = 0
		arg_655_1.state_ = "playing"
		arg_655_1.curTalkId_ = 120011162
		arg_655_1.duration_ = 5

		SetActive(arg_655_1.tipsGo_, false)

		function arg_655_1.onSingleLineFinish_()
			arg_655_1.onSingleLineUpdate_ = nil
			arg_655_1.onSingleLineFinish_ = nil
			arg_655_1.state_ = "waiting"
		end

		function arg_655_1.playNext_(arg_657_0)
			if arg_657_0 == 1 then
				arg_655_0:Play120011163(arg_655_1)
			end
		end

		function arg_655_1.onSingleLineUpdate_(arg_658_0)
			local var_658_0 = arg_655_1.actors_["1072ui_story"].transform
			local var_658_1 = 0

			if var_658_1 < arg_655_1.time_ and arg_655_1.time_ <= var_658_1 + arg_658_0 then
				arg_655_1.var_.moveOldPos1072ui_story = var_658_0.localPosition

				local var_658_2 = "1072ui_story"

				arg_655_1:ShowWeapon(arg_655_1.var_[var_658_2 .. "Animator"].transform, false)
			end

			local var_658_3 = 0.001

			if var_658_1 <= arg_655_1.time_ and arg_655_1.time_ < var_658_1 + var_658_3 then
				local var_658_4 = (arg_655_1.time_ - var_658_1) / var_658_3
				local var_658_5 = Vector3.New(0, 100, 0)

				var_658_0.localPosition = Vector3.Lerp(arg_655_1.var_.moveOldPos1072ui_story, var_658_5, var_658_4)

				local var_658_6 = manager.ui.mainCamera.transform.position - var_658_0.position

				var_658_0.forward = Vector3.New(var_658_6.x, var_658_6.y, var_658_6.z)

				local var_658_7 = var_658_0.localEulerAngles

				var_658_7.z = 0
				var_658_7.x = 0
				var_658_0.localEulerAngles = var_658_7
			end

			if arg_655_1.time_ >= var_658_1 + var_658_3 and arg_655_1.time_ < var_658_1 + var_658_3 + arg_658_0 then
				var_658_0.localPosition = Vector3.New(0, 100, 0)

				local var_658_8 = manager.ui.mainCamera.transform.position - var_658_0.position

				var_658_0.forward = Vector3.New(var_658_8.x, var_658_8.y, var_658_8.z)

				local var_658_9 = var_658_0.localEulerAngles

				var_658_9.z = 0
				var_658_9.x = 0
				var_658_0.localEulerAngles = var_658_9
			end

			local var_658_10 = 0
			local var_658_11 = 1.2

			if var_658_10 < arg_655_1.time_ and arg_655_1.time_ <= var_658_10 + arg_658_0 then
				arg_655_1.talkMaxDuration = 0
				arg_655_1.dialogCg_.alpha = 1

				arg_655_1.dialog_:SetActive(true)
				SetActive(arg_655_1.leftNameGo_, false)

				arg_655_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_655_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_655_1:RecordName(arg_655_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_655_1.iconTrs_.gameObject, false)
				arg_655_1.callingController_:SetSelectedState("normal")

				local var_658_12 = arg_655_1:GetWordFromCfg(120011162)
				local var_658_13 = arg_655_1:FormatText(var_658_12.content)

				arg_655_1.text_.text = var_658_13

				LuaForUtil.ClearLinePrefixSymbol(arg_655_1.text_)

				local var_658_14 = 48
				local var_658_15 = utf8.len(var_658_13)
				local var_658_16 = var_658_14 <= 0 and var_658_11 or var_658_11 * (var_658_15 / var_658_14)

				if var_658_16 > 0 and var_658_11 < var_658_16 then
					arg_655_1.talkMaxDuration = var_658_16

					if var_658_16 + var_658_10 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_16 + var_658_10
					end
				end

				arg_655_1.text_.text = var_658_13
				arg_655_1.typewritter.percent = 0

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(false)
				arg_655_1:RecordContent(arg_655_1.text_.text)
			end

			local var_658_17 = math.max(var_658_11, arg_655_1.talkMaxDuration)

			if var_658_10 <= arg_655_1.time_ and arg_655_1.time_ < var_658_10 + var_658_17 then
				arg_655_1.typewritter.percent = (arg_655_1.time_ - var_658_10) / var_658_17

				arg_655_1.typewritter:SetDirty()
			end

			if arg_655_1.time_ >= var_658_10 + var_658_17 and arg_655_1.time_ < var_658_10 + var_658_17 + arg_658_0 then
				arg_655_1.typewritter.percent = 1

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(true)
			end
		end
	end,
	Play120011163 = function(arg_659_0, arg_659_1)
		arg_659_1.time_ = 0
		arg_659_1.frameCnt_ = 0
		arg_659_1.state_ = "playing"
		arg_659_1.curTalkId_ = 120011163
		arg_659_1.duration_ = 9.6

		local var_659_0 = {
			zh = 2.8,
			ja = 9.6
		}
		local var_659_1 = manager.audio:GetLocalizationFlag()

		if var_659_0[var_659_1] ~= nil then
			arg_659_1.duration_ = var_659_0[var_659_1]
		end

		SetActive(arg_659_1.tipsGo_, false)

		function arg_659_1.onSingleLineFinish_()
			arg_659_1.onSingleLineUpdate_ = nil
			arg_659_1.onSingleLineFinish_ = nil
			arg_659_1.state_ = "waiting"
		end

		function arg_659_1.playNext_(arg_661_0)
			if arg_661_0 == 1 then
				arg_659_0:Play120011164(arg_659_1)
			end
		end

		function arg_659_1.onSingleLineUpdate_(arg_662_0)
			local var_662_0 = arg_659_1.actors_["1072ui_story"]
			local var_662_1 = 0

			if var_662_1 < arg_659_1.time_ and arg_659_1.time_ <= var_662_1 + arg_662_0 and arg_659_1.var_.characterEffect1072ui_story == nil then
				arg_659_1.var_.characterEffect1072ui_story = var_662_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_662_2 = 0.2

			if var_662_1 <= arg_659_1.time_ and arg_659_1.time_ < var_662_1 + var_662_2 then
				local var_662_3 = (arg_659_1.time_ - var_662_1) / var_662_2

				if arg_659_1.var_.characterEffect1072ui_story then
					arg_659_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_659_1.time_ >= var_662_1 + var_662_2 and arg_659_1.time_ < var_662_1 + var_662_2 + arg_662_0 and arg_659_1.var_.characterEffect1072ui_story then
				arg_659_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_662_4 = arg_659_1.actors_["1072ui_story"].transform
			local var_662_5 = 0

			if var_662_5 < arg_659_1.time_ and arg_659_1.time_ <= var_662_5 + arg_662_0 then
				arg_659_1.var_.moveOldPos1072ui_story = var_662_4.localPosition

				local var_662_6 = "1072ui_story"

				arg_659_1:ShowWeapon(arg_659_1.var_[var_662_6 .. "Animator"].transform, false)
			end

			local var_662_7 = 0.001

			if var_662_5 <= arg_659_1.time_ and arg_659_1.time_ < var_662_5 + var_662_7 then
				local var_662_8 = (arg_659_1.time_ - var_662_5) / var_662_7
				local var_662_9 = Vector3.New(0, -0.71, -6)

				var_662_4.localPosition = Vector3.Lerp(arg_659_1.var_.moveOldPos1072ui_story, var_662_9, var_662_8)

				local var_662_10 = manager.ui.mainCamera.transform.position - var_662_4.position

				var_662_4.forward = Vector3.New(var_662_10.x, var_662_10.y, var_662_10.z)

				local var_662_11 = var_662_4.localEulerAngles

				var_662_11.z = 0
				var_662_11.x = 0
				var_662_4.localEulerAngles = var_662_11
			end

			if arg_659_1.time_ >= var_662_5 + var_662_7 and arg_659_1.time_ < var_662_5 + var_662_7 + arg_662_0 then
				var_662_4.localPosition = Vector3.New(0, -0.71, -6)

				local var_662_12 = manager.ui.mainCamera.transform.position - var_662_4.position

				var_662_4.forward = Vector3.New(var_662_12.x, var_662_12.y, var_662_12.z)

				local var_662_13 = var_662_4.localEulerAngles

				var_662_13.z = 0
				var_662_13.x = 0
				var_662_4.localEulerAngles = var_662_13
			end

			local var_662_14 = 0

			if var_662_14 < arg_659_1.time_ and arg_659_1.time_ <= var_662_14 + arg_662_0 then
				arg_659_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action6_1")
			end

			local var_662_15 = 0

			if var_662_15 < arg_659_1.time_ and arg_659_1.time_ <= var_662_15 + arg_662_0 then
				arg_659_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_662_16 = 0
			local var_662_17 = 0.25

			if var_662_16 < arg_659_1.time_ and arg_659_1.time_ <= var_662_16 + arg_662_0 then
				arg_659_1.talkMaxDuration = 0
				arg_659_1.dialogCg_.alpha = 1

				arg_659_1.dialog_:SetActive(true)
				SetActive(arg_659_1.leftNameGo_, true)

				local var_662_18 = arg_659_1:FormatText(StoryNameCfg[379].name)

				arg_659_1.leftNameTxt_.text = var_662_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_659_1.leftNameTxt_.transform)

				arg_659_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_659_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_659_1:RecordName(arg_659_1.leftNameTxt_.text)
				SetActive(arg_659_1.iconTrs_.gameObject, false)
				arg_659_1.callingController_:SetSelectedState("normal")

				local var_662_19 = arg_659_1:GetWordFromCfg(120011163)
				local var_662_20 = arg_659_1:FormatText(var_662_19.content)

				arg_659_1.text_.text = var_662_20

				LuaForUtil.ClearLinePrefixSymbol(arg_659_1.text_)

				local var_662_21 = 10
				local var_662_22 = utf8.len(var_662_20)
				local var_662_23 = var_662_21 <= 0 and var_662_17 or var_662_17 * (var_662_22 / var_662_21)

				if var_662_23 > 0 and var_662_17 < var_662_23 then
					arg_659_1.talkMaxDuration = var_662_23

					if var_662_23 + var_662_16 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_23 + var_662_16
					end
				end

				arg_659_1.text_.text = var_662_20
				arg_659_1.typewritter.percent = 0

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011163", "story_v_out_120011.awb") ~= 0 then
					local var_662_24 = manager.audio:GetVoiceLength("story_v_out_120011", "120011163", "story_v_out_120011.awb") / 1000

					if var_662_24 + var_662_16 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_24 + var_662_16
					end

					if var_662_19.prefab_name ~= "" and arg_659_1.actors_[var_662_19.prefab_name] ~= nil then
						local var_662_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_659_1.actors_[var_662_19.prefab_name].transform, "story_v_out_120011", "120011163", "story_v_out_120011.awb")

						arg_659_1:RecordAudio("120011163", var_662_25)
						arg_659_1:RecordAudio("120011163", var_662_25)
					else
						arg_659_1:AudioAction("play", "voice", "story_v_out_120011", "120011163", "story_v_out_120011.awb")
					end

					arg_659_1:RecordHistoryTalkVoice("story_v_out_120011", "120011163", "story_v_out_120011.awb")
				end

				arg_659_1:RecordContent(arg_659_1.text_.text)
			end

			local var_662_26 = math.max(var_662_17, arg_659_1.talkMaxDuration)

			if var_662_16 <= arg_659_1.time_ and arg_659_1.time_ < var_662_16 + var_662_26 then
				arg_659_1.typewritter.percent = (arg_659_1.time_ - var_662_16) / var_662_26

				arg_659_1.typewritter:SetDirty()
			end

			if arg_659_1.time_ >= var_662_16 + var_662_26 and arg_659_1.time_ < var_662_16 + var_662_26 + arg_662_0 then
				arg_659_1.typewritter.percent = 1

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(true)
			end
		end
	end,
	Play120011164 = function(arg_663_0, arg_663_1)
		arg_663_1.time_ = 0
		arg_663_1.frameCnt_ = 0
		arg_663_1.state_ = "playing"
		arg_663_1.curTalkId_ = 120011164
		arg_663_1.duration_ = 5

		SetActive(arg_663_1.tipsGo_, false)

		function arg_663_1.onSingleLineFinish_()
			arg_663_1.onSingleLineUpdate_ = nil
			arg_663_1.onSingleLineFinish_ = nil
			arg_663_1.state_ = "waiting"
		end

		function arg_663_1.playNext_(arg_665_0)
			if arg_665_0 == 1 then
				arg_663_0:Play120011165(arg_663_1)
			end
		end

		function arg_663_1.onSingleLineUpdate_(arg_666_0)
			local var_666_0 = arg_663_1.actors_["1072ui_story"]
			local var_666_1 = 0

			if var_666_1 < arg_663_1.time_ and arg_663_1.time_ <= var_666_1 + arg_666_0 and arg_663_1.var_.characterEffect1072ui_story == nil then
				arg_663_1.var_.characterEffect1072ui_story = var_666_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_666_2 = 0.2

			if var_666_1 <= arg_663_1.time_ and arg_663_1.time_ < var_666_1 + var_666_2 then
				local var_666_3 = (arg_663_1.time_ - var_666_1) / var_666_2

				if arg_663_1.var_.characterEffect1072ui_story then
					local var_666_4 = Mathf.Lerp(0, 0.5, var_666_3)

					arg_663_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_663_1.var_.characterEffect1072ui_story.fillRatio = var_666_4
				end
			end

			if arg_663_1.time_ >= var_666_1 + var_666_2 and arg_663_1.time_ < var_666_1 + var_666_2 + arg_666_0 and arg_663_1.var_.characterEffect1072ui_story then
				local var_666_5 = 0.5

				arg_663_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_663_1.var_.characterEffect1072ui_story.fillRatio = var_666_5
			end

			local var_666_6 = 0
			local var_666_7 = 0.875

			if var_666_6 < arg_663_1.time_ and arg_663_1.time_ <= var_666_6 + arg_666_0 then
				arg_663_1.talkMaxDuration = 0
				arg_663_1.dialogCg_.alpha = 1

				arg_663_1.dialog_:SetActive(true)
				SetActive(arg_663_1.leftNameGo_, true)

				local var_666_8 = arg_663_1:FormatText(StoryNameCfg[7].name)

				arg_663_1.leftNameTxt_.text = var_666_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_663_1.leftNameTxt_.transform)

				arg_663_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_663_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_663_1:RecordName(arg_663_1.leftNameTxt_.text)
				SetActive(arg_663_1.iconTrs_.gameObject, false)
				arg_663_1.callingController_:SetSelectedState("normal")

				local var_666_9 = arg_663_1:GetWordFromCfg(120011164)
				local var_666_10 = arg_663_1:FormatText(var_666_9.content)

				arg_663_1.text_.text = var_666_10

				LuaForUtil.ClearLinePrefixSymbol(arg_663_1.text_)

				local var_666_11 = 37
				local var_666_12 = utf8.len(var_666_10)
				local var_666_13 = var_666_11 <= 0 and var_666_7 or var_666_7 * (var_666_12 / var_666_11)

				if var_666_13 > 0 and var_666_7 < var_666_13 then
					arg_663_1.talkMaxDuration = var_666_13

					if var_666_13 + var_666_6 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_13 + var_666_6
					end
				end

				arg_663_1.text_.text = var_666_10
				arg_663_1.typewritter.percent = 0

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(false)
				arg_663_1:RecordContent(arg_663_1.text_.text)
			end

			local var_666_14 = math.max(var_666_7, arg_663_1.talkMaxDuration)

			if var_666_6 <= arg_663_1.time_ and arg_663_1.time_ < var_666_6 + var_666_14 then
				arg_663_1.typewritter.percent = (arg_663_1.time_ - var_666_6) / var_666_14

				arg_663_1.typewritter:SetDirty()
			end

			if arg_663_1.time_ >= var_666_6 + var_666_14 and arg_663_1.time_ < var_666_6 + var_666_14 + arg_666_0 then
				arg_663_1.typewritter.percent = 1

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(true)
			end
		end
	end,
	Play120011165 = function(arg_667_0, arg_667_1)
		arg_667_1.time_ = 0
		arg_667_1.frameCnt_ = 0
		arg_667_1.state_ = "playing"
		arg_667_1.curTalkId_ = 120011165
		arg_667_1.duration_ = 4.4

		local var_667_0 = {
			zh = 3.533,
			ja = 4.4
		}
		local var_667_1 = manager.audio:GetLocalizationFlag()

		if var_667_0[var_667_1] ~= nil then
			arg_667_1.duration_ = var_667_0[var_667_1]
		end

		SetActive(arg_667_1.tipsGo_, false)

		function arg_667_1.onSingleLineFinish_()
			arg_667_1.onSingleLineUpdate_ = nil
			arg_667_1.onSingleLineFinish_ = nil
			arg_667_1.state_ = "waiting"
		end

		function arg_667_1.playNext_(arg_669_0)
			if arg_669_0 == 1 then
				arg_667_0:Play120011166(arg_667_1)
			end
		end

		function arg_667_1.onSingleLineUpdate_(arg_670_0)
			local var_670_0 = arg_667_1.actors_["1072ui_story"]
			local var_670_1 = 0

			if var_670_1 < arg_667_1.time_ and arg_667_1.time_ <= var_670_1 + arg_670_0 and arg_667_1.var_.characterEffect1072ui_story == nil then
				arg_667_1.var_.characterEffect1072ui_story = var_670_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_670_2 = 0.2

			if var_670_1 <= arg_667_1.time_ and arg_667_1.time_ < var_670_1 + var_670_2 then
				local var_670_3 = (arg_667_1.time_ - var_670_1) / var_670_2

				if arg_667_1.var_.characterEffect1072ui_story then
					arg_667_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_667_1.time_ >= var_670_1 + var_670_2 and arg_667_1.time_ < var_670_1 + var_670_2 + arg_670_0 and arg_667_1.var_.characterEffect1072ui_story then
				arg_667_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_670_4 = 0
			local var_670_5 = 0.4

			if var_670_4 < arg_667_1.time_ and arg_667_1.time_ <= var_670_4 + arg_670_0 then
				arg_667_1.talkMaxDuration = 0
				arg_667_1.dialogCg_.alpha = 1

				arg_667_1.dialog_:SetActive(true)
				SetActive(arg_667_1.leftNameGo_, true)

				local var_670_6 = arg_667_1:FormatText(StoryNameCfg[379].name)

				arg_667_1.leftNameTxt_.text = var_670_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_667_1.leftNameTxt_.transform)

				arg_667_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_667_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_667_1:RecordName(arg_667_1.leftNameTxt_.text)
				SetActive(arg_667_1.iconTrs_.gameObject, false)
				arg_667_1.callingController_:SetSelectedState("normal")

				local var_670_7 = arg_667_1:GetWordFromCfg(120011165)
				local var_670_8 = arg_667_1:FormatText(var_670_7.content)

				arg_667_1.text_.text = var_670_8

				LuaForUtil.ClearLinePrefixSymbol(arg_667_1.text_)

				local var_670_9 = 16
				local var_670_10 = utf8.len(var_670_8)
				local var_670_11 = var_670_9 <= 0 and var_670_5 or var_670_5 * (var_670_10 / var_670_9)

				if var_670_11 > 0 and var_670_5 < var_670_11 then
					arg_667_1.talkMaxDuration = var_670_11

					if var_670_11 + var_670_4 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_11 + var_670_4
					end
				end

				arg_667_1.text_.text = var_670_8
				arg_667_1.typewritter.percent = 0

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011165", "story_v_out_120011.awb") ~= 0 then
					local var_670_12 = manager.audio:GetVoiceLength("story_v_out_120011", "120011165", "story_v_out_120011.awb") / 1000

					if var_670_12 + var_670_4 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_12 + var_670_4
					end

					if var_670_7.prefab_name ~= "" and arg_667_1.actors_[var_670_7.prefab_name] ~= nil then
						local var_670_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_667_1.actors_[var_670_7.prefab_name].transform, "story_v_out_120011", "120011165", "story_v_out_120011.awb")

						arg_667_1:RecordAudio("120011165", var_670_13)
						arg_667_1:RecordAudio("120011165", var_670_13)
					else
						arg_667_1:AudioAction("play", "voice", "story_v_out_120011", "120011165", "story_v_out_120011.awb")
					end

					arg_667_1:RecordHistoryTalkVoice("story_v_out_120011", "120011165", "story_v_out_120011.awb")
				end

				arg_667_1:RecordContent(arg_667_1.text_.text)
			end

			local var_670_14 = math.max(var_670_5, arg_667_1.talkMaxDuration)

			if var_670_4 <= arg_667_1.time_ and arg_667_1.time_ < var_670_4 + var_670_14 then
				arg_667_1.typewritter.percent = (arg_667_1.time_ - var_670_4) / var_670_14

				arg_667_1.typewritter:SetDirty()
			end

			if arg_667_1.time_ >= var_670_4 + var_670_14 and arg_667_1.time_ < var_670_4 + var_670_14 + arg_670_0 then
				arg_667_1.typewritter.percent = 1

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(true)
			end
		end
	end,
	Play120011166 = function(arg_671_0, arg_671_1)
		arg_671_1.time_ = 0
		arg_671_1.frameCnt_ = 0
		arg_671_1.state_ = "playing"
		arg_671_1.curTalkId_ = 120011166
		arg_671_1.duration_ = 0.199999999999

		SetActive(arg_671_1.tipsGo_, false)

		function arg_671_1.onSingleLineFinish_()
			arg_671_1.onSingleLineUpdate_ = nil
			arg_671_1.onSingleLineFinish_ = nil
			arg_671_1.state_ = "waiting"

			SetActive(arg_671_1.choicesGo_, true)

			for iter_672_0, iter_672_1 in ipairs(arg_671_1.choices_) do
				local var_672_0 = iter_672_0 <= 2

				SetActive(iter_672_1.go, var_672_0)
			end

			arg_671_1.choices_[1].txt.text = arg_671_1:FormatText(StoryChoiceCfg[366].name)
			arg_671_1.choices_[2].txt.text = arg_671_1:FormatText(StoryChoiceCfg[367].name)
		end

		function arg_671_1.playNext_(arg_673_0)
			if arg_673_0 == 1 then
				arg_671_0:Play120011167(arg_671_1)
			end

			if arg_673_0 == 2 then
				arg_671_0:Play120011167(arg_671_1)
			end
		end

		function arg_671_1.onSingleLineUpdate_(arg_674_0)
			local var_674_0 = arg_671_1.actors_["1072ui_story"]
			local var_674_1 = 0

			if var_674_1 < arg_671_1.time_ and arg_671_1.time_ <= var_674_1 + arg_674_0 and arg_671_1.var_.characterEffect1072ui_story == nil then
				arg_671_1.var_.characterEffect1072ui_story = var_674_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_674_2 = 0.2

			if var_674_1 <= arg_671_1.time_ and arg_671_1.time_ < var_674_1 + var_674_2 then
				local var_674_3 = (arg_671_1.time_ - var_674_1) / var_674_2

				if arg_671_1.var_.characterEffect1072ui_story then
					local var_674_4 = Mathf.Lerp(0, 0.5, var_674_3)

					arg_671_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_671_1.var_.characterEffect1072ui_story.fillRatio = var_674_4
				end
			end

			if arg_671_1.time_ >= var_674_1 + var_674_2 and arg_671_1.time_ < var_674_1 + var_674_2 + arg_674_0 and arg_671_1.var_.characterEffect1072ui_story then
				local var_674_5 = 0.5

				arg_671_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_671_1.var_.characterEffect1072ui_story.fillRatio = var_674_5
			end
		end
	end,
	Play120011167 = function(arg_675_0, arg_675_1)
		arg_675_1.time_ = 0
		arg_675_1.frameCnt_ = 0
		arg_675_1.state_ = "playing"
		arg_675_1.curTalkId_ = 120011167
		arg_675_1.duration_ = 9.7

		local var_675_0 = {
			zh = 9.266,
			ja = 9.7
		}
		local var_675_1 = manager.audio:GetLocalizationFlag()

		if var_675_0[var_675_1] ~= nil then
			arg_675_1.duration_ = var_675_0[var_675_1]
		end

		SetActive(arg_675_1.tipsGo_, false)

		function arg_675_1.onSingleLineFinish_()
			arg_675_1.onSingleLineUpdate_ = nil
			arg_675_1.onSingleLineFinish_ = nil
			arg_675_1.state_ = "waiting"
		end

		function arg_675_1.playNext_(arg_677_0)
			if arg_677_0 == 1 then
				arg_675_0:Play120011168(arg_675_1)
			end
		end

		function arg_675_1.onSingleLineUpdate_(arg_678_0)
			local var_678_0 = 0

			if var_678_0 < arg_675_1.time_ and arg_675_1.time_ <= var_678_0 + arg_678_0 then
				arg_675_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072actionlink/1072action462")
			end

			local var_678_1 = arg_675_1.actors_["1072ui_story"]
			local var_678_2 = 0

			if var_678_2 < arg_675_1.time_ and arg_675_1.time_ <= var_678_2 + arg_678_0 and arg_675_1.var_.characterEffect1072ui_story == nil then
				arg_675_1.var_.characterEffect1072ui_story = var_678_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_678_3 = 0.2

			if var_678_2 <= arg_675_1.time_ and arg_675_1.time_ < var_678_2 + var_678_3 then
				local var_678_4 = (arg_675_1.time_ - var_678_2) / var_678_3

				if arg_675_1.var_.characterEffect1072ui_story then
					arg_675_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_675_1.time_ >= var_678_2 + var_678_3 and arg_675_1.time_ < var_678_2 + var_678_3 + arg_678_0 and arg_675_1.var_.characterEffect1072ui_story then
				arg_675_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_678_5 = 0
			local var_678_6 = 1.05

			if var_678_5 < arg_675_1.time_ and arg_675_1.time_ <= var_678_5 + arg_678_0 then
				arg_675_1.talkMaxDuration = 0
				arg_675_1.dialogCg_.alpha = 1

				arg_675_1.dialog_:SetActive(true)
				SetActive(arg_675_1.leftNameGo_, true)

				local var_678_7 = arg_675_1:FormatText(StoryNameCfg[379].name)

				arg_675_1.leftNameTxt_.text = var_678_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_675_1.leftNameTxt_.transform)

				arg_675_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_675_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_675_1:RecordName(arg_675_1.leftNameTxt_.text)
				SetActive(arg_675_1.iconTrs_.gameObject, false)
				arg_675_1.callingController_:SetSelectedState("normal")

				local var_678_8 = arg_675_1:GetWordFromCfg(120011167)
				local var_678_9 = arg_675_1:FormatText(var_678_8.content)

				arg_675_1.text_.text = var_678_9

				LuaForUtil.ClearLinePrefixSymbol(arg_675_1.text_)

				local var_678_10 = 42
				local var_678_11 = utf8.len(var_678_9)
				local var_678_12 = var_678_10 <= 0 and var_678_6 or var_678_6 * (var_678_11 / var_678_10)

				if var_678_12 > 0 and var_678_6 < var_678_12 then
					arg_675_1.talkMaxDuration = var_678_12

					if var_678_12 + var_678_5 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_12 + var_678_5
					end
				end

				arg_675_1.text_.text = var_678_9
				arg_675_1.typewritter.percent = 0

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011167", "story_v_out_120011.awb") ~= 0 then
					local var_678_13 = manager.audio:GetVoiceLength("story_v_out_120011", "120011167", "story_v_out_120011.awb") / 1000

					if var_678_13 + var_678_5 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_13 + var_678_5
					end

					if var_678_8.prefab_name ~= "" and arg_675_1.actors_[var_678_8.prefab_name] ~= nil then
						local var_678_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_675_1.actors_[var_678_8.prefab_name].transform, "story_v_out_120011", "120011167", "story_v_out_120011.awb")

						arg_675_1:RecordAudio("120011167", var_678_14)
						arg_675_1:RecordAudio("120011167", var_678_14)
					else
						arg_675_1:AudioAction("play", "voice", "story_v_out_120011", "120011167", "story_v_out_120011.awb")
					end

					arg_675_1:RecordHistoryTalkVoice("story_v_out_120011", "120011167", "story_v_out_120011.awb")
				end

				arg_675_1:RecordContent(arg_675_1.text_.text)
			end

			local var_678_15 = math.max(var_678_6, arg_675_1.talkMaxDuration)

			if var_678_5 <= arg_675_1.time_ and arg_675_1.time_ < var_678_5 + var_678_15 then
				arg_675_1.typewritter.percent = (arg_675_1.time_ - var_678_5) / var_678_15

				arg_675_1.typewritter:SetDirty()
			end

			if arg_675_1.time_ >= var_678_5 + var_678_15 and arg_675_1.time_ < var_678_5 + var_678_15 + arg_678_0 then
				arg_675_1.typewritter.percent = 1

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(true)
			end
		end
	end,
	Play120011168 = function(arg_679_0, arg_679_1)
		arg_679_1.time_ = 0
		arg_679_1.frameCnt_ = 0
		arg_679_1.state_ = "playing"
		arg_679_1.curTalkId_ = 120011168
		arg_679_1.duration_ = 9

		local var_679_0 = {
			zh = 6.066,
			ja = 9
		}
		local var_679_1 = manager.audio:GetLocalizationFlag()

		if var_679_0[var_679_1] ~= nil then
			arg_679_1.duration_ = var_679_0[var_679_1]
		end

		SetActive(arg_679_1.tipsGo_, false)

		function arg_679_1.onSingleLineFinish_()
			arg_679_1.onSingleLineUpdate_ = nil
			arg_679_1.onSingleLineFinish_ = nil
			arg_679_1.state_ = "waiting"
		end

		function arg_679_1.playNext_(arg_681_0)
			if arg_681_0 == 1 then
				arg_679_0:Play120011169(arg_679_1)
			end
		end

		function arg_679_1.onSingleLineUpdate_(arg_682_0)
			local var_682_0 = 0
			local var_682_1 = 0.775

			if var_682_0 < arg_679_1.time_ and arg_679_1.time_ <= var_682_0 + arg_682_0 then
				arg_679_1.talkMaxDuration = 0
				arg_679_1.dialogCg_.alpha = 1

				arg_679_1.dialog_:SetActive(true)
				SetActive(arg_679_1.leftNameGo_, true)

				local var_682_2 = arg_679_1:FormatText(StoryNameCfg[379].name)

				arg_679_1.leftNameTxt_.text = var_682_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_679_1.leftNameTxt_.transform)

				arg_679_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_679_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_679_1:RecordName(arg_679_1.leftNameTxt_.text)
				SetActive(arg_679_1.iconTrs_.gameObject, false)
				arg_679_1.callingController_:SetSelectedState("normal")

				local var_682_3 = arg_679_1:GetWordFromCfg(120011168)
				local var_682_4 = arg_679_1:FormatText(var_682_3.content)

				arg_679_1.text_.text = var_682_4

				LuaForUtil.ClearLinePrefixSymbol(arg_679_1.text_)

				local var_682_5 = 31
				local var_682_6 = utf8.len(var_682_4)
				local var_682_7 = var_682_5 <= 0 and var_682_1 or var_682_1 * (var_682_6 / var_682_5)

				if var_682_7 > 0 and var_682_1 < var_682_7 then
					arg_679_1.talkMaxDuration = var_682_7

					if var_682_7 + var_682_0 > arg_679_1.duration_ then
						arg_679_1.duration_ = var_682_7 + var_682_0
					end
				end

				arg_679_1.text_.text = var_682_4
				arg_679_1.typewritter.percent = 0

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011168", "story_v_out_120011.awb") ~= 0 then
					local var_682_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011168", "story_v_out_120011.awb") / 1000

					if var_682_8 + var_682_0 > arg_679_1.duration_ then
						arg_679_1.duration_ = var_682_8 + var_682_0
					end

					if var_682_3.prefab_name ~= "" and arg_679_1.actors_[var_682_3.prefab_name] ~= nil then
						local var_682_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_679_1.actors_[var_682_3.prefab_name].transform, "story_v_out_120011", "120011168", "story_v_out_120011.awb")

						arg_679_1:RecordAudio("120011168", var_682_9)
						arg_679_1:RecordAudio("120011168", var_682_9)
					else
						arg_679_1:AudioAction("play", "voice", "story_v_out_120011", "120011168", "story_v_out_120011.awb")
					end

					arg_679_1:RecordHistoryTalkVoice("story_v_out_120011", "120011168", "story_v_out_120011.awb")
				end

				arg_679_1:RecordContent(arg_679_1.text_.text)
			end

			local var_682_10 = math.max(var_682_1, arg_679_1.talkMaxDuration)

			if var_682_0 <= arg_679_1.time_ and arg_679_1.time_ < var_682_0 + var_682_10 then
				arg_679_1.typewritter.percent = (arg_679_1.time_ - var_682_0) / var_682_10

				arg_679_1.typewritter:SetDirty()
			end

			if arg_679_1.time_ >= var_682_0 + var_682_10 and arg_679_1.time_ < var_682_0 + var_682_10 + arg_682_0 then
				arg_679_1.typewritter.percent = 1

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(true)
			end
		end
	end,
	Play120011169 = function(arg_683_0, arg_683_1)
		arg_683_1.time_ = 0
		arg_683_1.frameCnt_ = 0
		arg_683_1.state_ = "playing"
		arg_683_1.curTalkId_ = 120011169
		arg_683_1.duration_ = 4.5

		local var_683_0 = {
			zh = 3.866,
			ja = 4.5
		}
		local var_683_1 = manager.audio:GetLocalizationFlag()

		if var_683_0[var_683_1] ~= nil then
			arg_683_1.duration_ = var_683_0[var_683_1]
		end

		SetActive(arg_683_1.tipsGo_, false)

		function arg_683_1.onSingleLineFinish_()
			arg_683_1.onSingleLineUpdate_ = nil
			arg_683_1.onSingleLineFinish_ = nil
			arg_683_1.state_ = "waiting"
			arg_683_1.auto_ = false
		end

		function arg_683_1.playNext_(arg_685_0)
			arg_683_1.onStoryFinished_()
		end

		function arg_683_1.onSingleLineUpdate_(arg_686_0)
			local var_686_0 = 0
			local var_686_1 = 0.45

			if var_686_0 < arg_683_1.time_ and arg_683_1.time_ <= var_686_0 + arg_686_0 then
				arg_683_1.talkMaxDuration = 0
				arg_683_1.dialogCg_.alpha = 1

				arg_683_1.dialog_:SetActive(true)
				SetActive(arg_683_1.leftNameGo_, true)

				local var_686_2 = arg_683_1:FormatText(StoryNameCfg[379].name)

				arg_683_1.leftNameTxt_.text = var_686_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_683_1.leftNameTxt_.transform)

				arg_683_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_683_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_683_1:RecordName(arg_683_1.leftNameTxt_.text)
				SetActive(arg_683_1.iconTrs_.gameObject, false)
				arg_683_1.callingController_:SetSelectedState("normal")

				local var_686_3 = arg_683_1:GetWordFromCfg(120011169)
				local var_686_4 = arg_683_1:FormatText(var_686_3.content)

				arg_683_1.text_.text = var_686_4

				LuaForUtil.ClearLinePrefixSymbol(arg_683_1.text_)

				local var_686_5 = 18
				local var_686_6 = utf8.len(var_686_4)
				local var_686_7 = var_686_5 <= 0 and var_686_1 or var_686_1 * (var_686_6 / var_686_5)

				if var_686_7 > 0 and var_686_1 < var_686_7 then
					arg_683_1.talkMaxDuration = var_686_7

					if var_686_7 + var_686_0 > arg_683_1.duration_ then
						arg_683_1.duration_ = var_686_7 + var_686_0
					end
				end

				arg_683_1.text_.text = var_686_4
				arg_683_1.typewritter.percent = 0

				arg_683_1.typewritter:SetDirty()
				arg_683_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120011", "120011169", "story_v_out_120011.awb") ~= 0 then
					local var_686_8 = manager.audio:GetVoiceLength("story_v_out_120011", "120011169", "story_v_out_120011.awb") / 1000

					if var_686_8 + var_686_0 > arg_683_1.duration_ then
						arg_683_1.duration_ = var_686_8 + var_686_0
					end

					if var_686_3.prefab_name ~= "" and arg_683_1.actors_[var_686_3.prefab_name] ~= nil then
						local var_686_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_683_1.actors_[var_686_3.prefab_name].transform, "story_v_out_120011", "120011169", "story_v_out_120011.awb")

						arg_683_1:RecordAudio("120011169", var_686_9)
						arg_683_1:RecordAudio("120011169", var_686_9)
					else
						arg_683_1:AudioAction("play", "voice", "story_v_out_120011", "120011169", "story_v_out_120011.awb")
					end

					arg_683_1:RecordHistoryTalkVoice("story_v_out_120011", "120011169", "story_v_out_120011.awb")
				end

				arg_683_1:RecordContent(arg_683_1.text_.text)
			end

			local var_686_10 = math.max(var_686_1, arg_683_1.talkMaxDuration)

			if var_686_0 <= arg_683_1.time_ and arg_683_1.time_ < var_686_0 + var_686_10 then
				arg_683_1.typewritter.percent = (arg_683_1.time_ - var_686_0) / var_686_10

				arg_683_1.typewritter:SetDirty()
			end

			if arg_683_1.time_ >= var_686_0 + var_686_10 and arg_683_1.time_ < var_686_0 + var_686_10 + arg_686_0 then
				arg_683_1.typewritter.percent = 1

				arg_683_1.typewritter:SetDirty()
				arg_683_1:ShowNextGo(true)
			end
		end
	end,
	Play120011072 = function(arg_687_0, arg_687_1)
		arg_687_1.time_ = 0
		arg_687_1.frameCnt_ = 0
		arg_687_1.state_ = "playing"
		arg_687_1.curTalkId_ = 120011072
		arg_687_1.duration_ = 5

		SetActive(arg_687_1.tipsGo_, false)

		function arg_687_1.onSingleLineFinish_()
			arg_687_1.onSingleLineUpdate_ = nil
			arg_687_1.onSingleLineFinish_ = nil
			arg_687_1.state_ = "waiting"
		end

		function arg_687_1.playNext_(arg_689_0)
			if arg_689_0 == 1 then
				arg_687_0:Play120011073(arg_687_1)
			end
		end

		function arg_687_1.onSingleLineUpdate_(arg_690_0)
			local var_690_0 = 0
			local var_690_1 = 0.7

			if var_690_0 < arg_687_1.time_ and arg_687_1.time_ <= var_690_0 + arg_690_0 then
				arg_687_1.talkMaxDuration = 0
				arg_687_1.dialogCg_.alpha = 1

				arg_687_1.dialog_:SetActive(true)
				SetActive(arg_687_1.leftNameGo_, false)

				arg_687_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_687_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_687_1:RecordName(arg_687_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_687_1.iconTrs_.gameObject, false)
				arg_687_1.callingController_:SetSelectedState("normal")

				local var_690_2 = arg_687_1:GetWordFromCfg(120011072)
				local var_690_3 = arg_687_1:FormatText(var_690_2.content)

				arg_687_1.text_.text = var_690_3

				LuaForUtil.ClearLinePrefixSymbol(arg_687_1.text_)

				local var_690_4 = 28
				local var_690_5 = utf8.len(var_690_3)
				local var_690_6 = var_690_4 <= 0 and var_690_1 or var_690_1 * (var_690_5 / var_690_4)

				if var_690_6 > 0 and var_690_1 < var_690_6 then
					arg_687_1.talkMaxDuration = var_690_6

					if var_690_6 + var_690_0 > arg_687_1.duration_ then
						arg_687_1.duration_ = var_690_6 + var_690_0
					end
				end

				arg_687_1.text_.text = var_690_3
				arg_687_1.typewritter.percent = 0

				arg_687_1.typewritter:SetDirty()
				arg_687_1:ShowNextGo(false)
				arg_687_1:RecordContent(arg_687_1.text_.text)
			end

			local var_690_7 = math.max(var_690_1, arg_687_1.talkMaxDuration)

			if var_690_0 <= arg_687_1.time_ and arg_687_1.time_ < var_690_0 + var_690_7 then
				arg_687_1.typewritter.percent = (arg_687_1.time_ - var_690_0) / var_690_7

				arg_687_1.typewritter:SetDirty()
			end

			if arg_687_1.time_ >= var_690_0 + var_690_7 and arg_687_1.time_ < var_690_0 + var_690_7 + arg_690_0 then
				arg_687_1.typewritter.percent = 1

				arg_687_1.typewritter:SetDirty()
				arg_687_1:ShowNextGo(true)
			end
		end
	end,
	Play120011073 = function(arg_691_0, arg_691_1)
		arg_691_1.time_ = 0
		arg_691_1.frameCnt_ = 0
		arg_691_1.state_ = "playing"
		arg_691_1.curTalkId_ = 120011073
		arg_691_1.duration_ = 5

		SetActive(arg_691_1.tipsGo_, false)

		function arg_691_1.onSingleLineFinish_()
			arg_691_1.onSingleLineUpdate_ = nil
			arg_691_1.onSingleLineFinish_ = nil
			arg_691_1.state_ = "waiting"
		end

		function arg_691_1.playNext_(arg_693_0)
			if arg_693_0 == 1 then
				arg_691_0:Play120011074(arg_691_1)
			end
		end

		function arg_691_1.onSingleLineUpdate_(arg_694_0)
			local var_694_0 = 0
			local var_694_1 = 0.05

			if var_694_0 < arg_691_1.time_ and arg_691_1.time_ <= var_694_0 + arg_694_0 then
				arg_691_1.talkMaxDuration = 0
				arg_691_1.dialogCg_.alpha = 1

				arg_691_1.dialog_:SetActive(true)
				SetActive(arg_691_1.leftNameGo_, false)

				arg_691_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_691_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_691_1:RecordName(arg_691_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_691_1.iconTrs_.gameObject, false)
				arg_691_1.callingController_:SetSelectedState("normal")

				local var_694_2 = arg_691_1:GetWordFromCfg(120011073)
				local var_694_3 = arg_691_1:FormatText(var_694_2.content)

				arg_691_1.text_.text = var_694_3

				LuaForUtil.ClearLinePrefixSymbol(arg_691_1.text_)

				local var_694_4 = 2
				local var_694_5 = utf8.len(var_694_3)
				local var_694_6 = var_694_4 <= 0 and var_694_1 or var_694_1 * (var_694_5 / var_694_4)

				if var_694_6 > 0 and var_694_1 < var_694_6 then
					arg_691_1.talkMaxDuration = var_694_6

					if var_694_6 + var_694_0 > arg_691_1.duration_ then
						arg_691_1.duration_ = var_694_6 + var_694_0
					end
				end

				arg_691_1.text_.text = var_694_3
				arg_691_1.typewritter.percent = 0

				arg_691_1.typewritter:SetDirty()
				arg_691_1:ShowNextGo(false)
				arg_691_1:RecordContent(arg_691_1.text_.text)
			end

			local var_694_7 = math.max(var_694_1, arg_691_1.talkMaxDuration)

			if var_694_0 <= arg_691_1.time_ and arg_691_1.time_ < var_694_0 + var_694_7 then
				arg_691_1.typewritter.percent = (arg_691_1.time_ - var_694_0) / var_694_7

				arg_691_1.typewritter:SetDirty()
			end

			if arg_691_1.time_ >= var_694_0 + var_694_7 and arg_691_1.time_ < var_694_0 + var_694_7 + arg_694_0 then
				arg_691_1.typewritter.percent = 1

				arg_691_1.typewritter:SetDirty()
				arg_691_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0101",
		"SofdecAsset/story/101200101.usm",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST45",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST31",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0102a"
	},
	voices = {
		"story_v_out_120011.awb"
	},
	skipMarkers = {
		120011001
	}
}
