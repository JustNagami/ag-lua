return {
	Play122462001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 122462001
		arg_1_1.duration_ = 12.9

		local var_1_0 = {
			ja = 12.9,
			ko = 11.5,
			zh = 11.5
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
				arg_1_0:Play122462002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "J10h"

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
				local var_4_5 = arg_1_1.bgs_.J10h

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
					if iter_4_0 ~= "J10h" then
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
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 1.5
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_1_story_city", "bgm_activity_2_1_story_city", "bgm_activity_2_1_story_city.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.925

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

				local var_4_33 = arg_1_1:FormatText(StoryNameCfg[469].name)

				arg_1_1.leftNameTxt_.text = var_4_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2079")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_34 = arg_1_1:GetWordFromCfg(122462001)
				local var_4_35 = arg_1_1:FormatText(var_4_34.content)

				arg_1_1.text_.text = var_4_35

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_36 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_122462", "122462001", "story_v_out_122462.awb") ~= 0 then
					local var_4_39 = manager.audio:GetVoiceLength("story_v_out_122462", "122462001", "story_v_out_122462.awb") / 1000

					if var_4_39 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_39 + var_4_30
					end

					if var_4_34.prefab_name ~= "" and arg_1_1.actors_[var_4_34.prefab_name] ~= nil then
						local var_4_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_34.prefab_name].transform, "story_v_out_122462", "122462001", "story_v_out_122462.awb")

						arg_1_1:RecordAudio("122462001", var_4_40)
						arg_1_1:RecordAudio("122462001", var_4_40)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_122462", "122462001", "story_v_out_122462.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_122462", "122462001", "story_v_out_122462.awb")
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
	Play122462002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 122462002
		arg_7_1.duration_ = 2.233

		local var_7_0 = {
			ja = 2.233,
			ko = 1.766,
			zh = 1.766
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
				arg_7_0:Play122462003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.175

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[469].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2079")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(122462002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_122462", "122462002", "story_v_out_122462.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_122462", "122462002", "story_v_out_122462.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_122462", "122462002", "story_v_out_122462.awb")

						arg_7_1:RecordAudio("122462002", var_10_9)
						arg_7_1:RecordAudio("122462002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_122462", "122462002", "story_v_out_122462.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_122462", "122462002", "story_v_out_122462.awb")
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
	Play122462003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 122462003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play122462004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1.325

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_2 = arg_11_1:GetWordFromCfg(122462003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 53
				local var_14_5 = utf8.len(var_14_3)
				local var_14_6 = var_14_4 <= 0 and var_14_1 or var_14_1 * (var_14_5 / var_14_4)

				if var_14_6 > 0 and var_14_1 < var_14_6 then
					arg_11_1.talkMaxDuration = var_14_6

					if var_14_6 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_6 + var_14_0
					end
				end

				arg_11_1.text_.text = var_14_3
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_7 = math.max(var_14_1, arg_11_1.talkMaxDuration)

			if var_14_0 <= arg_11_1.time_ and arg_11_1.time_ < var_14_0 + var_14_7 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_0) / var_14_7

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_0 + var_14_7 and arg_11_1.time_ < var_14_0 + var_14_7 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play122462004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 122462004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play122462005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				local var_18_2 = "play"
				local var_18_3 = "effect"

				arg_15_1:AudioAction(var_18_2, var_18_3, "se_story_122_03", "se_story_122_03_cheer", "")
			end

			local var_18_4 = 0
			local var_18_5 = 1.175

			if var_18_4 < arg_15_1.time_ and arg_15_1.time_ <= var_18_4 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_6 = arg_15_1:GetWordFromCfg(122462004)
				local var_18_7 = arg_15_1:FormatText(var_18_6.content)

				arg_15_1.text_.text = var_18_7

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_8 = 47
				local var_18_9 = utf8.len(var_18_7)
				local var_18_10 = var_18_8 <= 0 and var_18_5 or var_18_5 * (var_18_9 / var_18_8)

				if var_18_10 > 0 and var_18_5 < var_18_10 then
					arg_15_1.talkMaxDuration = var_18_10

					if var_18_10 + var_18_4 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_10 + var_18_4
					end
				end

				arg_15_1.text_.text = var_18_7
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_11 = math.max(var_18_5, arg_15_1.talkMaxDuration)

			if var_18_4 <= arg_15_1.time_ and arg_15_1.time_ < var_18_4 + var_18_11 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_4) / var_18_11

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_4 + var_18_11 and arg_15_1.time_ < var_18_4 + var_18_11 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play122462005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 122462005
		arg_19_1.duration_ = 10.366

		local var_19_0 = {
			ja = 10.366,
			ko = 8.3,
			zh = 8.3
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
				arg_19_0:Play122462006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "1072ui_story"

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

			local var_22_4 = arg_19_1.actors_["1072ui_story"].transform
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1.var_.moveOldPos1072ui_story = var_22_4.localPosition
			end

			local var_22_6 = 0.001

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6
				local var_22_8 = Vector3.New(0, -0.71, -6)

				var_22_4.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1072ui_story, var_22_8, var_22_7)

				local var_22_9 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_9.x, var_22_9.y, var_22_9.z)

				local var_22_10 = var_22_4.localEulerAngles

				var_22_10.z = 0
				var_22_10.x = 0
				var_22_4.localEulerAngles = var_22_10
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 then
				var_22_4.localPosition = Vector3.New(0, -0.71, -6)

				local var_22_11 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_11.x, var_22_11.y, var_22_11.z)

				local var_22_12 = var_22_4.localEulerAngles

				var_22_12.z = 0
				var_22_12.x = 0
				var_22_4.localEulerAngles = var_22_12
			end

			local var_22_13 = arg_19_1.actors_["1072ui_story"]
			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 and arg_19_1.var_.characterEffect1072ui_story == nil then
				arg_19_1.var_.characterEffect1072ui_story = var_22_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_15 = 0.200000002980232

			if var_22_14 <= arg_19_1.time_ and arg_19_1.time_ < var_22_14 + var_22_15 then
				local var_22_16 = (arg_19_1.time_ - var_22_14) / var_22_15

				if arg_19_1.var_.characterEffect1072ui_story then
					arg_19_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_14 + var_22_15 and arg_19_1.time_ < var_22_14 + var_22_15 + arg_22_0 and arg_19_1.var_.characterEffect1072ui_story then
				arg_19_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_22_17 = 0

			if var_22_17 < arg_19_1.time_ and arg_19_1.time_ <= var_22_17 + arg_22_0 then
				arg_19_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_22_18 = 0

			if var_22_18 < arg_19_1.time_ and arg_19_1.time_ <= var_22_18 + arg_22_0 then
				arg_19_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_22_19 = 0
			local var_22_20 = 0.95

			if var_22_19 < arg_19_1.time_ and arg_19_1.time_ <= var_22_19 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_21 = arg_19_1:FormatText(StoryNameCfg[379].name)

				arg_19_1.leftNameTxt_.text = var_22_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_22 = arg_19_1:GetWordFromCfg(122462005)
				local var_22_23 = arg_19_1:FormatText(var_22_22.content)

				arg_19_1.text_.text = var_22_23

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_24 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_122462", "122462005", "story_v_out_122462.awb") ~= 0 then
					local var_22_27 = manager.audio:GetVoiceLength("story_v_out_122462", "122462005", "story_v_out_122462.awb") / 1000

					if var_22_27 + var_22_19 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_27 + var_22_19
					end

					if var_22_22.prefab_name ~= "" and arg_19_1.actors_[var_22_22.prefab_name] ~= nil then
						local var_22_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_22.prefab_name].transform, "story_v_out_122462", "122462005", "story_v_out_122462.awb")

						arg_19_1:RecordAudio("122462005", var_22_28)
						arg_19_1:RecordAudio("122462005", var_22_28)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_122462", "122462005", "story_v_out_122462.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_122462", "122462005", "story_v_out_122462.awb")
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
	Play122462006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 122462006
		arg_23_1.duration_ = 5.633

		local var_23_0 = {
			ja = 5.633,
			ko = 4.766,
			zh = 4.766
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
				arg_23_0:Play122462007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "2079ui_story"

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

			local var_26_4 = arg_23_1.actors_["2079ui_story"].transform
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 then
				arg_23_1.var_.moveOldPos2079ui_story = var_26_4.localPosition
			end

			local var_26_6 = 0.001

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6
				local var_26_8 = Vector3.New(-0.7, -1.28, -5.6)

				var_26_4.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos2079ui_story, var_26_8, var_26_7)

				local var_26_9 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_9.x, var_26_9.y, var_26_9.z)

				local var_26_10 = var_26_4.localEulerAngles

				var_26_10.z = 0
				var_26_10.x = 0
				var_26_4.localEulerAngles = var_26_10
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 then
				var_26_4.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_26_11 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_11.x, var_26_11.y, var_26_11.z)

				local var_26_12 = var_26_4.localEulerAngles

				var_26_12.z = 0
				var_26_12.x = 0
				var_26_4.localEulerAngles = var_26_12
			end

			local var_26_13 = arg_23_1.actors_["2079ui_story"]
			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 and arg_23_1.var_.characterEffect2079ui_story == nil then
				arg_23_1.var_.characterEffect2079ui_story = var_26_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_15 = 0.200000002980232

			if var_26_14 <= arg_23_1.time_ and arg_23_1.time_ < var_26_14 + var_26_15 then
				local var_26_16 = (arg_23_1.time_ - var_26_14) / var_26_15

				if arg_23_1.var_.characterEffect2079ui_story then
					arg_23_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_14 + var_26_15 and arg_23_1.time_ < var_26_14 + var_26_15 + arg_26_0 and arg_23_1.var_.characterEffect2079ui_story then
				arg_23_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_26_17 = 0

			if var_26_17 < arg_23_1.time_ and arg_23_1.time_ <= var_26_17 + arg_26_0 then
				arg_23_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_26_18 = 0

			if var_26_18 < arg_23_1.time_ and arg_23_1.time_ <= var_26_18 + arg_26_0 then
				arg_23_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_19 = arg_23_1.actors_["1072ui_story"].transform
			local var_26_20 = 0

			if var_26_20 < arg_23_1.time_ and arg_23_1.time_ <= var_26_20 + arg_26_0 then
				arg_23_1.var_.moveOldPos1072ui_story = var_26_19.localPosition
			end

			local var_26_21 = 0.001

			if var_26_20 <= arg_23_1.time_ and arg_23_1.time_ < var_26_20 + var_26_21 then
				local var_26_22 = (arg_23_1.time_ - var_26_20) / var_26_21
				local var_26_23 = Vector3.New(0.7, -0.71, -6)

				var_26_19.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1072ui_story, var_26_23, var_26_22)

				local var_26_24 = manager.ui.mainCamera.transform.position - var_26_19.position

				var_26_19.forward = Vector3.New(var_26_24.x, var_26_24.y, var_26_24.z)

				local var_26_25 = var_26_19.localEulerAngles

				var_26_25.z = 0
				var_26_25.x = 0
				var_26_19.localEulerAngles = var_26_25
			end

			if arg_23_1.time_ >= var_26_20 + var_26_21 and arg_23_1.time_ < var_26_20 + var_26_21 + arg_26_0 then
				var_26_19.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_26_26 = manager.ui.mainCamera.transform.position - var_26_19.position

				var_26_19.forward = Vector3.New(var_26_26.x, var_26_26.y, var_26_26.z)

				local var_26_27 = var_26_19.localEulerAngles

				var_26_27.z = 0
				var_26_27.x = 0
				var_26_19.localEulerAngles = var_26_27
			end

			local var_26_28 = arg_23_1.actors_["1072ui_story"]
			local var_26_29 = 0

			if var_26_29 < arg_23_1.time_ and arg_23_1.time_ <= var_26_29 + arg_26_0 and arg_23_1.var_.characterEffect1072ui_story == nil then
				arg_23_1.var_.characterEffect1072ui_story = var_26_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_30 = 0.200000002980232

			if var_26_29 <= arg_23_1.time_ and arg_23_1.time_ < var_26_29 + var_26_30 then
				local var_26_31 = (arg_23_1.time_ - var_26_29) / var_26_30

				if arg_23_1.var_.characterEffect1072ui_story then
					local var_26_32 = Mathf.Lerp(0, 0.5, var_26_31)

					arg_23_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1072ui_story.fillRatio = var_26_32
				end
			end

			if arg_23_1.time_ >= var_26_29 + var_26_30 and arg_23_1.time_ < var_26_29 + var_26_30 + arg_26_0 and arg_23_1.var_.characterEffect1072ui_story then
				local var_26_33 = 0.5

				arg_23_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1072ui_story.fillRatio = var_26_33
			end

			local var_26_34 = 0
			local var_26_35 = 0.675

			if var_26_34 < arg_23_1.time_ and arg_23_1.time_ <= var_26_34 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_36 = arg_23_1:FormatText(StoryNameCfg[469].name)

				arg_23_1.leftNameTxt_.text = var_26_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_37 = arg_23_1:GetWordFromCfg(122462006)
				local var_26_38 = arg_23_1:FormatText(var_26_37.content)

				arg_23_1.text_.text = var_26_38

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_39 = 27
				local var_26_40 = utf8.len(var_26_38)
				local var_26_41 = var_26_39 <= 0 and var_26_35 or var_26_35 * (var_26_40 / var_26_39)

				if var_26_41 > 0 and var_26_35 < var_26_41 then
					arg_23_1.talkMaxDuration = var_26_41

					if var_26_41 + var_26_34 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_41 + var_26_34
					end
				end

				arg_23_1.text_.text = var_26_38
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122462", "122462006", "story_v_out_122462.awb") ~= 0 then
					local var_26_42 = manager.audio:GetVoiceLength("story_v_out_122462", "122462006", "story_v_out_122462.awb") / 1000

					if var_26_42 + var_26_34 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_42 + var_26_34
					end

					if var_26_37.prefab_name ~= "" and arg_23_1.actors_[var_26_37.prefab_name] ~= nil then
						local var_26_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_37.prefab_name].transform, "story_v_out_122462", "122462006", "story_v_out_122462.awb")

						arg_23_1:RecordAudio("122462006", var_26_43)
						arg_23_1:RecordAudio("122462006", var_26_43)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_122462", "122462006", "story_v_out_122462.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_122462", "122462006", "story_v_out_122462.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_44 = math.max(var_26_35, arg_23_1.talkMaxDuration)

			if var_26_34 <= arg_23_1.time_ and arg_23_1.time_ < var_26_34 + var_26_44 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_34) / var_26_44

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_34 + var_26_44 and arg_23_1.time_ < var_26_34 + var_26_44 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play122462007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 122462007
		arg_27_1.duration_ = 12.266

		local var_27_0 = {
			ja = 12.266,
			ko = 4.7,
			zh = 4.7
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
				arg_27_0:Play122462008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.725

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_2 = arg_27_1:FormatText(StoryNameCfg[469].name)

				arg_27_1.leftNameTxt_.text = var_30_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_3 = arg_27_1:GetWordFromCfg(122462007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_122462", "122462007", "story_v_out_122462.awb") ~= 0 then
					local var_30_8 = manager.audio:GetVoiceLength("story_v_out_122462", "122462007", "story_v_out_122462.awb") / 1000

					if var_30_8 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_8 + var_30_0
					end

					if var_30_3.prefab_name ~= "" and arg_27_1.actors_[var_30_3.prefab_name] ~= nil then
						local var_30_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_3.prefab_name].transform, "story_v_out_122462", "122462007", "story_v_out_122462.awb")

						arg_27_1:RecordAudio("122462007", var_30_9)
						arg_27_1:RecordAudio("122462007", var_30_9)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_122462", "122462007", "story_v_out_122462.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_122462", "122462007", "story_v_out_122462.awb")
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
	Play122462008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 122462008
		arg_31_1.duration_ = 3.633

		local var_31_0 = {
			ja = 3.633,
			ko = 3.1,
			zh = 3.1
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
				arg_31_0:Play122462009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1072ui_story"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1072ui_story = var_34_0.localPosition
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(0.7, -0.71, -6)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1072ui_story, var_34_4, var_34_3)

				local var_34_5 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_5.x, var_34_5.y, var_34_5.z)

				local var_34_6 = var_34_0.localEulerAngles

				var_34_6.z = 0
				var_34_6.x = 0
				var_34_0.localEulerAngles = var_34_6
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_34_7 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_7.x, var_34_7.y, var_34_7.z)

				local var_34_8 = var_34_0.localEulerAngles

				var_34_8.z = 0
				var_34_8.x = 0
				var_34_0.localEulerAngles = var_34_8
			end

			local var_34_9 = arg_31_1.actors_["1072ui_story"]
			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 and arg_31_1.var_.characterEffect1072ui_story == nil then
				arg_31_1.var_.characterEffect1072ui_story = var_34_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_11 = 0.200000002980232

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_11 then
				local var_34_12 = (arg_31_1.time_ - var_34_10) / var_34_11

				if arg_31_1.var_.characterEffect1072ui_story then
					arg_31_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_10 + var_34_11 and arg_31_1.time_ < var_34_10 + var_34_11 + arg_34_0 and arg_31_1.var_.characterEffect1072ui_story then
				arg_31_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_34_13 = 0

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action3_1")
			end

			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_34_15 = arg_31_1.actors_["2079ui_story"]
			local var_34_16 = 0

			if var_34_16 < arg_31_1.time_ and arg_31_1.time_ <= var_34_16 + arg_34_0 and arg_31_1.var_.characterEffect2079ui_story == nil then
				arg_31_1.var_.characterEffect2079ui_story = var_34_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_17 = 0.200000002980232

			if var_34_16 <= arg_31_1.time_ and arg_31_1.time_ < var_34_16 + var_34_17 then
				local var_34_18 = (arg_31_1.time_ - var_34_16) / var_34_17

				if arg_31_1.var_.characterEffect2079ui_story then
					local var_34_19 = Mathf.Lerp(0, 0.5, var_34_18)

					arg_31_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_31_1.var_.characterEffect2079ui_story.fillRatio = var_34_19
				end
			end

			if arg_31_1.time_ >= var_34_16 + var_34_17 and arg_31_1.time_ < var_34_16 + var_34_17 + arg_34_0 and arg_31_1.var_.characterEffect2079ui_story then
				local var_34_20 = 0.5

				arg_31_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_31_1.var_.characterEffect2079ui_story.fillRatio = var_34_20
			end

			local var_34_21 = 0
			local var_34_22 = 0.175

			if var_34_21 < arg_31_1.time_ and arg_31_1.time_ <= var_34_21 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_23 = arg_31_1:FormatText(StoryNameCfg[379].name)

				arg_31_1.leftNameTxt_.text = var_34_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_24 = arg_31_1:GetWordFromCfg(122462008)
				local var_34_25 = arg_31_1:FormatText(var_34_24.content)

				arg_31_1.text_.text = var_34_25

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_26 = 7
				local var_34_27 = utf8.len(var_34_25)
				local var_34_28 = var_34_26 <= 0 and var_34_22 or var_34_22 * (var_34_27 / var_34_26)

				if var_34_28 > 0 and var_34_22 < var_34_28 then
					arg_31_1.talkMaxDuration = var_34_28

					if var_34_28 + var_34_21 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_28 + var_34_21
					end
				end

				arg_31_1.text_.text = var_34_25
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122462", "122462008", "story_v_out_122462.awb") ~= 0 then
					local var_34_29 = manager.audio:GetVoiceLength("story_v_out_122462", "122462008", "story_v_out_122462.awb") / 1000

					if var_34_29 + var_34_21 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_29 + var_34_21
					end

					if var_34_24.prefab_name ~= "" and arg_31_1.actors_[var_34_24.prefab_name] ~= nil then
						local var_34_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_24.prefab_name].transform, "story_v_out_122462", "122462008", "story_v_out_122462.awb")

						arg_31_1:RecordAudio("122462008", var_34_30)
						arg_31_1:RecordAudio("122462008", var_34_30)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_122462", "122462008", "story_v_out_122462.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_122462", "122462008", "story_v_out_122462.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_31 = math.max(var_34_22, arg_31_1.talkMaxDuration)

			if var_34_21 <= arg_31_1.time_ and arg_31_1.time_ < var_34_21 + var_34_31 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_21) / var_34_31

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_21 + var_34_31 and arg_31_1.time_ < var_34_21 + var_34_31 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play122462009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 122462009
		arg_35_1.duration_ = 6.1

		local var_35_0 = {
			ja = 6.1,
			ko = 4.266,
			zh = 4.266
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
				arg_35_0:Play122462010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072actionlink/1072action437")
			end

			local var_38_1 = 0
			local var_38_2 = 0.4

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_3 = arg_35_1:FormatText(StoryNameCfg[379].name)

				arg_35_1.leftNameTxt_.text = var_38_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_4 = arg_35_1:GetWordFromCfg(122462009)
				local var_38_5 = arg_35_1:FormatText(var_38_4.content)

				arg_35_1.text_.text = var_38_5

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_6 = 16
				local var_38_7 = utf8.len(var_38_5)
				local var_38_8 = var_38_6 <= 0 and var_38_2 or var_38_2 * (var_38_7 / var_38_6)

				if var_38_8 > 0 and var_38_2 < var_38_8 then
					arg_35_1.talkMaxDuration = var_38_8

					if var_38_8 + var_38_1 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_1
					end
				end

				arg_35_1.text_.text = var_38_5
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122462", "122462009", "story_v_out_122462.awb") ~= 0 then
					local var_38_9 = manager.audio:GetVoiceLength("story_v_out_122462", "122462009", "story_v_out_122462.awb") / 1000

					if var_38_9 + var_38_1 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_9 + var_38_1
					end

					if var_38_4.prefab_name ~= "" and arg_35_1.actors_[var_38_4.prefab_name] ~= nil then
						local var_38_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_4.prefab_name].transform, "story_v_out_122462", "122462009", "story_v_out_122462.awb")

						arg_35_1:RecordAudio("122462009", var_38_10)
						arg_35_1:RecordAudio("122462009", var_38_10)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_122462", "122462009", "story_v_out_122462.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_122462", "122462009", "story_v_out_122462.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_11 = math.max(var_38_2, arg_35_1.talkMaxDuration)

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_11 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_1) / var_38_11

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_1 + var_38_11 and arg_35_1.time_ < var_38_1 + var_38_11 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play122462010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 122462010
		arg_39_1.duration_ = 8.133

		local var_39_0 = {
			ja = 8.133,
			ko = 6.7,
			zh = 6.7
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
				arg_39_0:Play122462011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action7_2")
			end

			local var_42_1 = 0
			local var_42_2 = 0.675

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_3 = arg_39_1:FormatText(StoryNameCfg[379].name)

				arg_39_1.leftNameTxt_.text = var_42_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_4 = arg_39_1:GetWordFromCfg(122462010)
				local var_42_5 = arg_39_1:FormatText(var_42_4.content)

				arg_39_1.text_.text = var_42_5

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_6 = 27
				local var_42_7 = utf8.len(var_42_5)
				local var_42_8 = var_42_6 <= 0 and var_42_2 or var_42_2 * (var_42_7 / var_42_6)

				if var_42_8 > 0 and var_42_2 < var_42_8 then
					arg_39_1.talkMaxDuration = var_42_8

					if var_42_8 + var_42_1 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_8 + var_42_1
					end
				end

				arg_39_1.text_.text = var_42_5
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122462", "122462010", "story_v_out_122462.awb") ~= 0 then
					local var_42_9 = manager.audio:GetVoiceLength("story_v_out_122462", "122462010", "story_v_out_122462.awb") / 1000

					if var_42_9 + var_42_1 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_9 + var_42_1
					end

					if var_42_4.prefab_name ~= "" and arg_39_1.actors_[var_42_4.prefab_name] ~= nil then
						local var_42_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_4.prefab_name].transform, "story_v_out_122462", "122462010", "story_v_out_122462.awb")

						arg_39_1:RecordAudio("122462010", var_42_10)
						arg_39_1:RecordAudio("122462010", var_42_10)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_122462", "122462010", "story_v_out_122462.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_122462", "122462010", "story_v_out_122462.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_11 = math.max(var_42_2, arg_39_1.talkMaxDuration)

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_11 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_1) / var_42_11

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_1 + var_42_11 and arg_39_1.time_ < var_42_1 + var_42_11 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play122462011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 122462011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play122462012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["2079ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos2079ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(0, 100, 0)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos2079ui_story, var_46_4, var_46_3)

				local var_46_5 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_5.x, var_46_5.y, var_46_5.z)

				local var_46_6 = var_46_0.localEulerAngles

				var_46_6.z = 0
				var_46_6.x = 0
				var_46_0.localEulerAngles = var_46_6
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(0, 100, 0)

				local var_46_7 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_7.x, var_46_7.y, var_46_7.z)

				local var_46_8 = var_46_0.localEulerAngles

				var_46_8.z = 0
				var_46_8.x = 0
				var_46_0.localEulerAngles = var_46_8
			end

			local var_46_9 = arg_43_1.actors_["1072ui_story"].transform
			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 then
				arg_43_1.var_.moveOldPos1072ui_story = var_46_9.localPosition
			end

			local var_46_11 = 0.001

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_10) / var_46_11
				local var_46_13 = Vector3.New(0, 100, 0)

				var_46_9.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1072ui_story, var_46_13, var_46_12)

				local var_46_14 = manager.ui.mainCamera.transform.position - var_46_9.position

				var_46_9.forward = Vector3.New(var_46_14.x, var_46_14.y, var_46_14.z)

				local var_46_15 = var_46_9.localEulerAngles

				var_46_15.z = 0
				var_46_15.x = 0
				var_46_9.localEulerAngles = var_46_15
			end

			if arg_43_1.time_ >= var_46_10 + var_46_11 and arg_43_1.time_ < var_46_10 + var_46_11 + arg_46_0 then
				var_46_9.localPosition = Vector3.New(0, 100, 0)

				local var_46_16 = manager.ui.mainCamera.transform.position - var_46_9.position

				var_46_9.forward = Vector3.New(var_46_16.x, var_46_16.y, var_46_16.z)

				local var_46_17 = var_46_9.localEulerAngles

				var_46_17.z = 0
				var_46_17.x = 0
				var_46_9.localEulerAngles = var_46_17
			end

			local var_46_18 = 0
			local var_46_19 = 0.775

			if var_46_18 < arg_43_1.time_ and arg_43_1.time_ <= var_46_18 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_20 = arg_43_1:GetWordFromCfg(122462011)
				local var_46_21 = arg_43_1:FormatText(var_46_20.content)

				arg_43_1.text_.text = var_46_21

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_22 = 31
				local var_46_23 = utf8.len(var_46_21)
				local var_46_24 = var_46_22 <= 0 and var_46_19 or var_46_19 * (var_46_23 / var_46_22)

				if var_46_24 > 0 and var_46_19 < var_46_24 then
					arg_43_1.talkMaxDuration = var_46_24

					if var_46_24 + var_46_18 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_24 + var_46_18
					end
				end

				arg_43_1.text_.text = var_46_21
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_25 = math.max(var_46_19, arg_43_1.talkMaxDuration)

			if var_46_18 <= arg_43_1.time_ and arg_43_1.time_ < var_46_18 + var_46_25 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_18) / var_46_25

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_18 + var_46_25 and arg_43_1.time_ < var_46_18 + var_46_25 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play122462012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 122462012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play122462013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 1.725

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_2 = arg_47_1:GetWordFromCfg(122462012)
				local var_50_3 = arg_47_1:FormatText(var_50_2.content)

				arg_47_1.text_.text = var_50_3

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_4 = 69
				local var_50_5 = utf8.len(var_50_3)
				local var_50_6 = var_50_4 <= 0 and var_50_1 or var_50_1 * (var_50_5 / var_50_4)

				if var_50_6 > 0 and var_50_1 < var_50_6 then
					arg_47_1.talkMaxDuration = var_50_6

					if var_50_6 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_6 + var_50_0
					end
				end

				arg_47_1.text_.text = var_50_3
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_7 = math.max(var_50_1, arg_47_1.talkMaxDuration)

			if var_50_0 <= arg_47_1.time_ and arg_47_1.time_ < var_50_0 + var_50_7 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_0) / var_50_7

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_0 + var_50_7 and arg_47_1.time_ < var_50_0 + var_50_7 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play122462013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 122462013
		arg_51_1.duration_ = 4.466

		local var_51_0 = {
			ja = 4.466,
			ko = 2.3,
			zh = 2.3
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
				arg_51_0:Play122462014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["2079ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos2079ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos2079ui_story, var_54_4, var_54_3)

				local var_54_5 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_5.x, var_54_5.y, var_54_5.z)

				local var_54_6 = var_54_0.localEulerAngles

				var_54_6.z = 0
				var_54_6.x = 0
				var_54_0.localEulerAngles = var_54_6
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_54_7 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_7.x, var_54_7.y, var_54_7.z)

				local var_54_8 = var_54_0.localEulerAngles

				var_54_8.z = 0
				var_54_8.x = 0
				var_54_0.localEulerAngles = var_54_8
			end

			local var_54_9 = arg_51_1.actors_["2079ui_story"]
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 and arg_51_1.var_.characterEffect2079ui_story == nil then
				arg_51_1.var_.characterEffect2079ui_story = var_54_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_11 = 0.200000002980232

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_10) / var_54_11

				if arg_51_1.var_.characterEffect2079ui_story then
					local var_54_13 = Mathf.Lerp(0, 0.5, var_54_12)

					arg_51_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_51_1.var_.characterEffect2079ui_story.fillRatio = var_54_13
				end
			end

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 and arg_51_1.var_.characterEffect2079ui_story then
				local var_54_14 = 0.5

				arg_51_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_51_1.var_.characterEffect2079ui_story.fillRatio = var_54_14
			end

			local var_54_15 = arg_51_1.actors_["1072ui_story"].transform
			local var_54_16 = 0

			if var_54_16 < arg_51_1.time_ and arg_51_1.time_ <= var_54_16 + arg_54_0 then
				arg_51_1.var_.moveOldPos1072ui_story = var_54_15.localPosition
			end

			local var_54_17 = 0.001

			if var_54_16 <= arg_51_1.time_ and arg_51_1.time_ < var_54_16 + var_54_17 then
				local var_54_18 = (arg_51_1.time_ - var_54_16) / var_54_17
				local var_54_19 = Vector3.New(0.7, -0.71, -6)

				var_54_15.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1072ui_story, var_54_19, var_54_18)

				local var_54_20 = manager.ui.mainCamera.transform.position - var_54_15.position

				var_54_15.forward = Vector3.New(var_54_20.x, var_54_20.y, var_54_20.z)

				local var_54_21 = var_54_15.localEulerAngles

				var_54_21.z = 0
				var_54_21.x = 0
				var_54_15.localEulerAngles = var_54_21
			end

			if arg_51_1.time_ >= var_54_16 + var_54_17 and arg_51_1.time_ < var_54_16 + var_54_17 + arg_54_0 then
				var_54_15.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_54_22 = manager.ui.mainCamera.transform.position - var_54_15.position

				var_54_15.forward = Vector3.New(var_54_22.x, var_54_22.y, var_54_22.z)

				local var_54_23 = var_54_15.localEulerAngles

				var_54_23.z = 0
				var_54_23.x = 0
				var_54_15.localEulerAngles = var_54_23
			end

			local var_54_24 = arg_51_1.actors_["1072ui_story"]
			local var_54_25 = 0

			if var_54_25 < arg_51_1.time_ and arg_51_1.time_ <= var_54_25 + arg_54_0 and arg_51_1.var_.characterEffect1072ui_story == nil then
				arg_51_1.var_.characterEffect1072ui_story = var_54_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_26 = 0.200000002980232

			if var_54_25 <= arg_51_1.time_ and arg_51_1.time_ < var_54_25 + var_54_26 then
				local var_54_27 = (arg_51_1.time_ - var_54_25) / var_54_26

				if arg_51_1.var_.characterEffect1072ui_story then
					arg_51_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_25 + var_54_26 and arg_51_1.time_ < var_54_25 + var_54_26 + arg_54_0 and arg_51_1.var_.characterEffect1072ui_story then
				arg_51_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_54_28 = 0

			if var_54_28 < arg_51_1.time_ and arg_51_1.time_ <= var_54_28 + arg_54_0 then
				arg_51_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_54_29 = 0

			if var_54_29 < arg_51_1.time_ and arg_51_1.time_ <= var_54_29 + arg_54_0 then
				arg_51_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_54_30 = 0
			local var_54_31 = 0.2

			if var_54_30 < arg_51_1.time_ and arg_51_1.time_ <= var_54_30 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_32 = arg_51_1:FormatText(StoryNameCfg[379].name)

				arg_51_1.leftNameTxt_.text = var_54_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_33 = arg_51_1:GetWordFromCfg(122462013)
				local var_54_34 = arg_51_1:FormatText(var_54_33.content)

				arg_51_1.text_.text = var_54_34

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_35 = 8
				local var_54_36 = utf8.len(var_54_34)
				local var_54_37 = var_54_35 <= 0 and var_54_31 or var_54_31 * (var_54_36 / var_54_35)

				if var_54_37 > 0 and var_54_31 < var_54_37 then
					arg_51_1.talkMaxDuration = var_54_37

					if var_54_37 + var_54_30 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_37 + var_54_30
					end
				end

				arg_51_1.text_.text = var_54_34
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122462", "122462013", "story_v_out_122462.awb") ~= 0 then
					local var_54_38 = manager.audio:GetVoiceLength("story_v_out_122462", "122462013", "story_v_out_122462.awb") / 1000

					if var_54_38 + var_54_30 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_38 + var_54_30
					end

					if var_54_33.prefab_name ~= "" and arg_51_1.actors_[var_54_33.prefab_name] ~= nil then
						local var_54_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_33.prefab_name].transform, "story_v_out_122462", "122462013", "story_v_out_122462.awb")

						arg_51_1:RecordAudio("122462013", var_54_39)
						arg_51_1:RecordAudio("122462013", var_54_39)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_122462", "122462013", "story_v_out_122462.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_122462", "122462013", "story_v_out_122462.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_40 = math.max(var_54_31, arg_51_1.talkMaxDuration)

			if var_54_30 <= arg_51_1.time_ and arg_51_1.time_ < var_54_30 + var_54_40 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_30) / var_54_40

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_30 + var_54_40 and arg_51_1.time_ < var_54_30 + var_54_40 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play122462014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 122462014
		arg_55_1.duration_ = 14.1

		local var_55_0 = {
			ja = 14.1,
			ko = 7.633,
			zh = 7.633
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
				arg_55_0:Play122462015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["2079ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect2079ui_story == nil then
				arg_55_1.var_.characterEffect2079ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.200000002980232

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect2079ui_story then
					arg_55_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect2079ui_story then
				arg_55_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_58_4 = 0

			if var_58_4 < arg_55_1.time_ and arg_55_1.time_ <= var_58_4 + arg_58_0 then
				arg_55_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 then
				arg_55_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_58_6 = arg_55_1.actors_["1072ui_story"]
			local var_58_7 = 0

			if var_58_7 < arg_55_1.time_ and arg_55_1.time_ <= var_58_7 + arg_58_0 and arg_55_1.var_.characterEffect1072ui_story == nil then
				arg_55_1.var_.characterEffect1072ui_story = var_58_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_8 = 0.200000002980232

			if var_58_7 <= arg_55_1.time_ and arg_55_1.time_ < var_58_7 + var_58_8 then
				local var_58_9 = (arg_55_1.time_ - var_58_7) / var_58_8

				if arg_55_1.var_.characterEffect1072ui_story then
					local var_58_10 = Mathf.Lerp(0, 0.5, var_58_9)

					arg_55_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1072ui_story.fillRatio = var_58_10
				end
			end

			if arg_55_1.time_ >= var_58_7 + var_58_8 and arg_55_1.time_ < var_58_7 + var_58_8 + arg_58_0 and arg_55_1.var_.characterEffect1072ui_story then
				local var_58_11 = 0.5

				arg_55_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1072ui_story.fillRatio = var_58_11
			end

			local var_58_12 = 0
			local var_58_13 = 0.875

			if var_58_12 < arg_55_1.time_ and arg_55_1.time_ <= var_58_12 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_14 = arg_55_1:FormatText(StoryNameCfg[469].name)

				arg_55_1.leftNameTxt_.text = var_58_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_15 = arg_55_1:GetWordFromCfg(122462014)
				local var_58_16 = arg_55_1:FormatText(var_58_15.content)

				arg_55_1.text_.text = var_58_16

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_17 = 35
				local var_58_18 = utf8.len(var_58_16)
				local var_58_19 = var_58_17 <= 0 and var_58_13 or var_58_13 * (var_58_18 / var_58_17)

				if var_58_19 > 0 and var_58_13 < var_58_19 then
					arg_55_1.talkMaxDuration = var_58_19

					if var_58_19 + var_58_12 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_19 + var_58_12
					end
				end

				arg_55_1.text_.text = var_58_16
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122462", "122462014", "story_v_out_122462.awb") ~= 0 then
					local var_58_20 = manager.audio:GetVoiceLength("story_v_out_122462", "122462014", "story_v_out_122462.awb") / 1000

					if var_58_20 + var_58_12 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_20 + var_58_12
					end

					if var_58_15.prefab_name ~= "" and arg_55_1.actors_[var_58_15.prefab_name] ~= nil then
						local var_58_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_15.prefab_name].transform, "story_v_out_122462", "122462014", "story_v_out_122462.awb")

						arg_55_1:RecordAudio("122462014", var_58_21)
						arg_55_1:RecordAudio("122462014", var_58_21)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_122462", "122462014", "story_v_out_122462.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_122462", "122462014", "story_v_out_122462.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_22 = math.max(var_58_13, arg_55_1.talkMaxDuration)

			if var_58_12 <= arg_55_1.time_ and arg_55_1.time_ < var_58_12 + var_58_22 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_12) / var_58_22

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_12 + var_58_22 and arg_55_1.time_ < var_58_12 + var_58_22 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play122462015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 122462015
		arg_59_1.duration_ = 16.533

		local var_59_0 = {
			ja = 16.533,
			ko = 9.4,
			zh = 9.4
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
				arg_59_0:Play122462016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 1.3

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[469].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(122462015)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 52
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

				if manager.audio:GetVoiceLength("story_v_out_122462", "122462015", "story_v_out_122462.awb") ~= 0 then
					local var_62_8 = manager.audio:GetVoiceLength("story_v_out_122462", "122462015", "story_v_out_122462.awb") / 1000

					if var_62_8 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_0
					end

					if var_62_3.prefab_name ~= "" and arg_59_1.actors_[var_62_3.prefab_name] ~= nil then
						local var_62_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_3.prefab_name].transform, "story_v_out_122462", "122462015", "story_v_out_122462.awb")

						arg_59_1:RecordAudio("122462015", var_62_9)
						arg_59_1:RecordAudio("122462015", var_62_9)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_122462", "122462015", "story_v_out_122462.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_122462", "122462015", "story_v_out_122462.awb")
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
	Play122462016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 122462016
		arg_63_1.duration_ = 8.066

		local var_63_0 = {
			ja = 8.066,
			ko = 5,
			zh = 5
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
				arg_63_0:Play122462017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1072ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1072ui_story == nil then
				arg_63_1.var_.characterEffect1072ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.200000002980232

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1072ui_story then
					arg_63_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1072ui_story then
				arg_63_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_66_4 = 0

			if var_66_4 < arg_63_1.time_ and arg_63_1.time_ <= var_66_4 + arg_66_0 then
				arg_63_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 then
				arg_63_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_66_6 = arg_63_1.actors_["2079ui_story"]
			local var_66_7 = 0

			if var_66_7 < arg_63_1.time_ and arg_63_1.time_ <= var_66_7 + arg_66_0 and arg_63_1.var_.characterEffect2079ui_story == nil then
				arg_63_1.var_.characterEffect2079ui_story = var_66_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_8 = 0.200000002980232

			if var_66_7 <= arg_63_1.time_ and arg_63_1.time_ < var_66_7 + var_66_8 then
				local var_66_9 = (arg_63_1.time_ - var_66_7) / var_66_8

				if arg_63_1.var_.characterEffect2079ui_story then
					local var_66_10 = Mathf.Lerp(0, 0.5, var_66_9)

					arg_63_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_63_1.var_.characterEffect2079ui_story.fillRatio = var_66_10
				end
			end

			if arg_63_1.time_ >= var_66_7 + var_66_8 and arg_63_1.time_ < var_66_7 + var_66_8 + arg_66_0 and arg_63_1.var_.characterEffect2079ui_story then
				local var_66_11 = 0.5

				arg_63_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_63_1.var_.characterEffect2079ui_story.fillRatio = var_66_11
			end

			local var_66_12 = 0
			local var_66_13 = 0.575

			if var_66_12 < arg_63_1.time_ and arg_63_1.time_ <= var_66_12 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_14 = arg_63_1:FormatText(StoryNameCfg[379].name)

				arg_63_1.leftNameTxt_.text = var_66_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_15 = arg_63_1:GetWordFromCfg(122462016)
				local var_66_16 = arg_63_1:FormatText(var_66_15.content)

				arg_63_1.text_.text = var_66_16

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_17 = 23
				local var_66_18 = utf8.len(var_66_16)
				local var_66_19 = var_66_17 <= 0 and var_66_13 or var_66_13 * (var_66_18 / var_66_17)

				if var_66_19 > 0 and var_66_13 < var_66_19 then
					arg_63_1.talkMaxDuration = var_66_19

					if var_66_19 + var_66_12 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_19 + var_66_12
					end
				end

				arg_63_1.text_.text = var_66_16
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122462", "122462016", "story_v_out_122462.awb") ~= 0 then
					local var_66_20 = manager.audio:GetVoiceLength("story_v_out_122462", "122462016", "story_v_out_122462.awb") / 1000

					if var_66_20 + var_66_12 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_20 + var_66_12
					end

					if var_66_15.prefab_name ~= "" and arg_63_1.actors_[var_66_15.prefab_name] ~= nil then
						local var_66_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_15.prefab_name].transform, "story_v_out_122462", "122462016", "story_v_out_122462.awb")

						arg_63_1:RecordAudio("122462016", var_66_21)
						arg_63_1:RecordAudio("122462016", var_66_21)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_122462", "122462016", "story_v_out_122462.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_122462", "122462016", "story_v_out_122462.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_22 = math.max(var_66_13, arg_63_1.talkMaxDuration)

			if var_66_12 <= arg_63_1.time_ and arg_63_1.time_ < var_66_12 + var_66_22 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_12) / var_66_22

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_12 + var_66_22 and arg_63_1.time_ < var_66_12 + var_66_22 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play122462017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 122462017
		arg_67_1.duration_ = 8.666

		local var_67_0 = {
			ja = 6.466,
			ko = 8.666,
			zh = 8.666
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
				arg_67_0:Play122462018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["2079ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect2079ui_story == nil then
				arg_67_1.var_.characterEffect2079ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.200000002980232

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect2079ui_story then
					arg_67_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect2079ui_story then
				arg_67_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_70_4 = 0

			if var_70_4 < arg_67_1.time_ and arg_67_1.time_ <= var_70_4 + arg_70_0 then
				arg_67_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 then
				arg_67_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_70_6 = arg_67_1.actors_["1072ui_story"]
			local var_70_7 = 0

			if var_70_7 < arg_67_1.time_ and arg_67_1.time_ <= var_70_7 + arg_70_0 and arg_67_1.var_.characterEffect1072ui_story == nil then
				arg_67_1.var_.characterEffect1072ui_story = var_70_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_8 = 0.200000002980232

			if var_70_7 <= arg_67_1.time_ and arg_67_1.time_ < var_70_7 + var_70_8 then
				local var_70_9 = (arg_67_1.time_ - var_70_7) / var_70_8

				if arg_67_1.var_.characterEffect1072ui_story then
					local var_70_10 = Mathf.Lerp(0, 0.5, var_70_9)

					arg_67_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1072ui_story.fillRatio = var_70_10
				end
			end

			if arg_67_1.time_ >= var_70_7 + var_70_8 and arg_67_1.time_ < var_70_7 + var_70_8 + arg_70_0 and arg_67_1.var_.characterEffect1072ui_story then
				local var_70_11 = 0.5

				arg_67_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1072ui_story.fillRatio = var_70_11
			end

			local var_70_12 = 0
			local var_70_13 = 1.2

			if var_70_12 < arg_67_1.time_ and arg_67_1.time_ <= var_70_12 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_14 = arg_67_1:FormatText(StoryNameCfg[469].name)

				arg_67_1.leftNameTxt_.text = var_70_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_15 = arg_67_1:GetWordFromCfg(122462017)
				local var_70_16 = arg_67_1:FormatText(var_70_15.content)

				arg_67_1.text_.text = var_70_16

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_17 = 48
				local var_70_18 = utf8.len(var_70_16)
				local var_70_19 = var_70_17 <= 0 and var_70_13 or var_70_13 * (var_70_18 / var_70_17)

				if var_70_19 > 0 and var_70_13 < var_70_19 then
					arg_67_1.talkMaxDuration = var_70_19

					if var_70_19 + var_70_12 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_19 + var_70_12
					end
				end

				arg_67_1.text_.text = var_70_16
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122462", "122462017", "story_v_out_122462.awb") ~= 0 then
					local var_70_20 = manager.audio:GetVoiceLength("story_v_out_122462", "122462017", "story_v_out_122462.awb") / 1000

					if var_70_20 + var_70_12 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_20 + var_70_12
					end

					if var_70_15.prefab_name ~= "" and arg_67_1.actors_[var_70_15.prefab_name] ~= nil then
						local var_70_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_15.prefab_name].transform, "story_v_out_122462", "122462017", "story_v_out_122462.awb")

						arg_67_1:RecordAudio("122462017", var_70_21)
						arg_67_1:RecordAudio("122462017", var_70_21)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_122462", "122462017", "story_v_out_122462.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_122462", "122462017", "story_v_out_122462.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_22 = math.max(var_70_13, arg_67_1.talkMaxDuration)

			if var_70_12 <= arg_67_1.time_ and arg_67_1.time_ < var_70_12 + var_70_22 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_12) / var_70_22

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_12 + var_70_22 and arg_67_1.time_ < var_70_12 + var_70_22 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play122462018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 122462018
		arg_71_1.duration_ = 3.13333333333333

		local var_71_0 = {
			ja = 3.13333333333333,
			ko = 2.333333333332,
			zh = 2.333333333332
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
				arg_71_0:Play122462019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["2079ui_story"].transform
			local var_74_1 = 0.333333333333333

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos2079ui_story = var_74_0.localPosition
			end

			local var_74_2 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2
				local var_74_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos2079ui_story, var_74_4, var_74_3)

				local var_74_5 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_5.x, var_74_5.y, var_74_5.z)

				local var_74_6 = var_74_0.localEulerAngles

				var_74_6.z = 0
				var_74_6.x = 0
				var_74_0.localEulerAngles = var_74_6
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_74_7 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_7.x, var_74_7.y, var_74_7.z)

				local var_74_8 = var_74_0.localEulerAngles

				var_74_8.z = 0
				var_74_8.x = 0
				var_74_0.localEulerAngles = var_74_8
			end

			local var_74_9 = arg_71_1.actors_["2079ui_story"]
			local var_74_10 = 0.333333333333333

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 and arg_71_1.var_.characterEffect2079ui_story == nil then
				arg_71_1.var_.characterEffect2079ui_story = var_74_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_11 = 0.200000002980232

			if var_74_10 <= arg_71_1.time_ and arg_71_1.time_ < var_74_10 + var_74_11 then
				local var_74_12 = (arg_71_1.time_ - var_74_10) / var_74_11

				if arg_71_1.var_.characterEffect2079ui_story then
					arg_71_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_10 + var_74_11 and arg_71_1.time_ < var_74_10 + var_74_11 + arg_74_0 and arg_71_1.var_.characterEffect2079ui_story then
				arg_71_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_74_13 = 0.333333333333333

			if var_74_13 < arg_71_1.time_ and arg_71_1.time_ <= var_74_13 + arg_74_0 then
				arg_71_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_74_14 = 0.333333333333333

			if var_74_14 < arg_71_1.time_ and arg_71_1.time_ <= var_74_14 + arg_74_0 then
				arg_71_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_74_15 = manager.ui.mainCamera.transform
			local var_74_16 = 0

			if var_74_16 < arg_71_1.time_ and arg_71_1.time_ <= var_74_16 + arg_74_0 then
				arg_71_1.var_.shakeOldPos = var_74_15.localPosition
			end

			local var_74_17 = 0.333333333333333

			if var_74_16 <= arg_71_1.time_ and arg_71_1.time_ < var_74_16 + var_74_17 then
				local var_74_18 = (arg_71_1.time_ - var_74_16) / 0.066
				local var_74_19, var_74_20 = math.modf(var_74_18)

				var_74_15.localPosition = Vector3.New(var_74_20 * 0.13, var_74_20 * 0.13, var_74_20 * 0.13) + arg_71_1.var_.shakeOldPos
			end

			if arg_71_1.time_ >= var_74_16 + var_74_17 and arg_71_1.time_ < var_74_16 + var_74_17 + arg_74_0 then
				var_74_15.localPosition = arg_71_1.var_.shakeOldPos
			end

			local var_74_21 = 0

			if var_74_21 < arg_71_1.time_ and arg_71_1.time_ <= var_74_21 + arg_74_0 then
				arg_71_1.allBtn_.enabled = false
			end

			local var_74_22 = 0.333333333333333

			if arg_71_1.time_ >= var_74_21 + var_74_22 and arg_71_1.time_ < var_74_21 + var_74_22 + arg_74_0 then
				arg_71_1.allBtn_.enabled = true
			end

			local var_74_23 = 0
			local var_74_24 = 1

			if var_74_23 < arg_71_1.time_ and arg_71_1.time_ <= var_74_23 + arg_74_0 then
				local var_74_25 = "play"
				local var_74_26 = "effect"

				arg_71_1:AudioAction(var_74_25, var_74_26, "se_story_121_04", "se_story_121_04_earthquake_loop", "")
			end

			local var_74_27 = 0
			local var_74_28 = 1

			if var_74_27 < arg_71_1.time_ and arg_71_1.time_ <= var_74_27 + arg_74_0 then
				local var_74_29 = "play"
				local var_74_30 = "effect"

				arg_71_1:AudioAction(var_74_29, var_74_30, "se_story_121_04", "se_story_121_04_rock", "")
			end

			local var_74_31 = 0.333333333333333
			local var_74_32 = 0.15

			if var_74_31 < arg_71_1.time_ and arg_71_1.time_ <= var_74_31 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_33 = arg_71_1:FormatText(StoryNameCfg[469].name)

				arg_71_1.leftNameTxt_.text = var_74_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_34 = arg_71_1:GetWordFromCfg(122462018)
				local var_74_35 = arg_71_1:FormatText(var_74_34.content)

				arg_71_1.text_.text = var_74_35

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_36 = 6
				local var_74_37 = utf8.len(var_74_35)
				local var_74_38 = var_74_36 <= 0 and var_74_32 or var_74_32 * (var_74_37 / var_74_36)

				if var_74_38 > 0 and var_74_32 < var_74_38 then
					arg_71_1.talkMaxDuration = var_74_38

					if var_74_38 + var_74_31 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_38 + var_74_31
					end
				end

				arg_71_1.text_.text = var_74_35
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122462", "122462018", "story_v_out_122462.awb") ~= 0 then
					local var_74_39 = manager.audio:GetVoiceLength("story_v_out_122462", "122462018", "story_v_out_122462.awb") / 1000

					if var_74_39 + var_74_31 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_39 + var_74_31
					end

					if var_74_34.prefab_name ~= "" and arg_71_1.actors_[var_74_34.prefab_name] ~= nil then
						local var_74_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_34.prefab_name].transform, "story_v_out_122462", "122462018", "story_v_out_122462.awb")

						arg_71_1:RecordAudio("122462018", var_74_40)
						arg_71_1:RecordAudio("122462018", var_74_40)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_122462", "122462018", "story_v_out_122462.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_122462", "122462018", "story_v_out_122462.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_41 = math.max(var_74_32, arg_71_1.talkMaxDuration)

			if var_74_31 <= arg_71_1.time_ and arg_71_1.time_ < var_74_31 + var_74_41 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_31) / var_74_41

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_31 + var_74_41 and arg_71_1.time_ < var_74_31 + var_74_41 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play122462019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 122462019
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play122462020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["2079ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos2079ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(0, 100, 0)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos2079ui_story, var_78_4, var_78_3)

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

			local var_78_9 = arg_75_1.actors_["1072ui_story"].transform
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 then
				arg_75_1.var_.moveOldPos1072ui_story = var_78_9.localPosition
			end

			local var_78_11 = 0.001

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11
				local var_78_13 = Vector3.New(0, 100, 0)

				var_78_9.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1072ui_story, var_78_13, var_78_12)

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
			local var_78_19 = 1.4

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

				local var_78_20 = arg_75_1:GetWordFromCfg(122462019)
				local var_78_21 = arg_75_1:FormatText(var_78_20.content)

				arg_75_1.text_.text = var_78_21

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_22 = 56
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
	Play122462020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 122462020
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play122462021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 1.85

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_2 = arg_79_1:GetWordFromCfg(122462020)
				local var_82_3 = arg_79_1:FormatText(var_82_2.content)

				arg_79_1.text_.text = var_82_3

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_4 = 74
				local var_82_5 = utf8.len(var_82_3)
				local var_82_6 = var_82_4 <= 0 and var_82_1 or var_82_1 * (var_82_5 / var_82_4)

				if var_82_6 > 0 and var_82_1 < var_82_6 then
					arg_79_1.talkMaxDuration = var_82_6

					if var_82_6 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_6 + var_82_0
					end
				end

				arg_79_1.text_.text = var_82_3
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_7 = math.max(var_82_1, arg_79_1.talkMaxDuration)

			if var_82_0 <= arg_79_1.time_ and arg_79_1.time_ < var_82_0 + var_82_7 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_0) / var_82_7

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_0 + var_82_7 and arg_79_1.time_ < var_82_0 + var_82_7 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play122462021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 122462021
		arg_83_1.duration_ = 7

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play122462022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = "XH0102b"

			if arg_83_1.bgs_[var_86_0] == nil then
				local var_86_1 = Object.Instantiate(arg_83_1.paintGo_)

				var_86_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_86_0)
				var_86_1.name = var_86_0
				var_86_1.transform.parent = arg_83_1.stage_.transform
				var_86_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_83_1.bgs_[var_86_0] = var_86_1
			end

			local var_86_2 = 1

			if var_86_2 < arg_83_1.time_ and arg_83_1.time_ <= var_86_2 + arg_86_0 then
				local var_86_3 = manager.ui.mainCamera.transform.localPosition
				local var_86_4 = Vector3.New(0, 0, 10) + Vector3.New(var_86_3.x, var_86_3.y, 0)
				local var_86_5 = arg_83_1.bgs_.XH0102b

				var_86_5.transform.localPosition = var_86_4
				var_86_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_86_6 = var_86_5:GetComponent("SpriteRenderer")

				if var_86_6 and var_86_6.sprite then
					local var_86_7 = (var_86_5.transform.localPosition - var_86_3).z
					local var_86_8 = manager.ui.mainCameraCom_
					local var_86_9 = 2 * var_86_7 * Mathf.Tan(var_86_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_86_10 = var_86_9 * var_86_8.aspect
					local var_86_11 = var_86_6.sprite.bounds.size.x
					local var_86_12 = var_86_6.sprite.bounds.size.y
					local var_86_13 = var_86_10 / var_86_11
					local var_86_14 = var_86_9 / var_86_12
					local var_86_15 = var_86_14 < var_86_13 and var_86_13 or var_86_14

					var_86_5.transform.localScale = Vector3.New(var_86_15, var_86_15, 0)
				end

				for iter_86_0, iter_86_1 in pairs(arg_83_1.bgs_) do
					if iter_86_0 ~= "XH0102b" then
						iter_86_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_86_16 = 0

			if var_86_16 < arg_83_1.time_ and arg_83_1.time_ <= var_86_16 + arg_86_0 then
				arg_83_1.mask_.enabled = true
				arg_83_1.mask_.raycastTarget = true

				arg_83_1:SetGaussion(false)
			end

			local var_86_17 = 1

			if var_86_16 <= arg_83_1.time_ and arg_83_1.time_ < var_86_16 + var_86_17 then
				local var_86_18 = (arg_83_1.time_ - var_86_16) / var_86_17
				local var_86_19 = Color.New(0, 0, 0)

				var_86_19.a = Mathf.Lerp(0, 1, var_86_18)
				arg_83_1.mask_.color = var_86_19
			end

			if arg_83_1.time_ >= var_86_16 + var_86_17 and arg_83_1.time_ < var_86_16 + var_86_17 + arg_86_0 then
				local var_86_20 = Color.New(0, 0, 0)

				var_86_20.a = 1
				arg_83_1.mask_.color = var_86_20
			end

			local var_86_21 = 1

			if var_86_21 < arg_83_1.time_ and arg_83_1.time_ <= var_86_21 + arg_86_0 then
				arg_83_1.mask_.enabled = true
				arg_83_1.mask_.raycastTarget = true

				arg_83_1:SetGaussion(false)
			end

			local var_86_22 = 1

			if var_86_21 <= arg_83_1.time_ and arg_83_1.time_ < var_86_21 + var_86_22 then
				local var_86_23 = (arg_83_1.time_ - var_86_21) / var_86_22
				local var_86_24 = Color.New(0, 0, 0)

				var_86_24.a = Mathf.Lerp(1, 0, var_86_23)
				arg_83_1.mask_.color = var_86_24
			end

			if arg_83_1.time_ >= var_86_21 + var_86_22 and arg_83_1.time_ < var_86_21 + var_86_22 + arg_86_0 then
				local var_86_25 = Color.New(0, 0, 0)
				local var_86_26 = 0

				arg_83_1.mask_.enabled = false
				var_86_25.a = var_86_26
				arg_83_1.mask_.color = var_86_25
			end

			local var_86_27 = 0
			local var_86_28 = 1

			if var_86_27 < arg_83_1.time_ and arg_83_1.time_ <= var_86_27 + arg_86_0 then
				local var_86_29 = "stop"
				local var_86_30 = "effect"

				arg_83_1:AudioAction(var_86_29, var_86_30, "se_story_121_04", "se_story_121_04_earthquake_loop", "")
			end

			if arg_83_1.frameCnt_ <= 1 then
				arg_83_1.dialog_:SetActive(false)
			end

			local var_86_31 = 2
			local var_86_32 = 1.4

			if var_86_31 < arg_83_1.time_ and arg_83_1.time_ <= var_86_31 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0

				arg_83_1.dialog_:SetActive(true)

				local var_86_33 = LeanTween.value(arg_83_1.dialog_, 0, 1, 0.3)

				var_86_33:setOnUpdate(LuaHelper.FloatAction(function(arg_87_0)
					arg_83_1.dialogCg_.alpha = arg_87_0
				end))
				var_86_33:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_83_1.dialog_)
					var_86_33:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_83_1.duration_ = arg_83_1.duration_ + 0.3

				SetActive(arg_83_1.leftNameGo_, false)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_34 = arg_83_1:GetWordFromCfg(122462021)
				local var_86_35 = arg_83_1:FormatText(var_86_34.content)

				arg_83_1.text_.text = var_86_35

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_36 = 56
				local var_86_37 = utf8.len(var_86_35)
				local var_86_38 = var_86_36 <= 0 and var_86_32 or var_86_32 * (var_86_37 / var_86_36)

				if var_86_38 > 0 and var_86_32 < var_86_38 then
					arg_83_1.talkMaxDuration = var_86_38
					var_86_31 = var_86_31 + 0.3

					if var_86_38 + var_86_31 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_38 + var_86_31
					end
				end

				arg_83_1.text_.text = var_86_35
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_39 = var_86_31 + 0.3
			local var_86_40 = math.max(var_86_32, arg_83_1.talkMaxDuration)

			if var_86_39 <= arg_83_1.time_ and arg_83_1.time_ < var_86_39 + var_86_40 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_39) / var_86_40

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_39 + var_86_40 and arg_83_1.time_ < var_86_39 + var_86_40 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play122462022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 122462022
		arg_89_1.duration_ = 5

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play122462023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 1.425

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, false)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_2 = arg_89_1:GetWordFromCfg(122462022)
				local var_92_3 = arg_89_1:FormatText(var_92_2.content)

				arg_89_1.text_.text = var_92_3

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_4 = 57
				local var_92_5 = utf8.len(var_92_3)
				local var_92_6 = var_92_4 <= 0 and var_92_1 or var_92_1 * (var_92_5 / var_92_4)

				if var_92_6 > 0 and var_92_1 < var_92_6 then
					arg_89_1.talkMaxDuration = var_92_6

					if var_92_6 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_6 + var_92_0
					end
				end

				arg_89_1.text_.text = var_92_3
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)
				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_7 = math.max(var_92_1, arg_89_1.talkMaxDuration)

			if var_92_0 <= arg_89_1.time_ and arg_89_1.time_ < var_92_0 + var_92_7 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_0) / var_92_7

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_0 + var_92_7 and arg_89_1.time_ < var_92_0 + var_92_7 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play122462023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 122462023
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play122462024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 0.85

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, false)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_2 = arg_93_1:GetWordFromCfg(122462023)
				local var_96_3 = arg_93_1:FormatText(var_96_2.content)

				arg_93_1.text_.text = var_96_3

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_4 = 34
				local var_96_5 = utf8.len(var_96_3)
				local var_96_6 = var_96_4 <= 0 and var_96_1 or var_96_1 * (var_96_5 / var_96_4)

				if var_96_6 > 0 and var_96_1 < var_96_6 then
					arg_93_1.talkMaxDuration = var_96_6

					if var_96_6 + var_96_0 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_6 + var_96_0
					end
				end

				arg_93_1.text_.text = var_96_3
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_7 = math.max(var_96_1, arg_93_1.talkMaxDuration)

			if var_96_0 <= arg_93_1.time_ and arg_93_1.time_ < var_96_0 + var_96_7 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_0) / var_96_7

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_0 + var_96_7 and arg_93_1.time_ < var_96_0 + var_96_7 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play122462024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 122462024
		arg_97_1.duration_ = 7.7

		local var_97_0 = {
			ja = 7.7,
			ko = 4.433,
			zh = 4.433
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
				arg_97_0:Play122462025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 1

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				local var_100_1 = manager.ui.mainCamera.transform.localPosition
				local var_100_2 = Vector3.New(0, 0, 10) + Vector3.New(var_100_1.x, var_100_1.y, 0)
				local var_100_3 = arg_97_1.bgs_.J10h

				var_100_3.transform.localPosition = var_100_2
				var_100_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_100_4 = var_100_3:GetComponent("SpriteRenderer")

				if var_100_4 and var_100_4.sprite then
					local var_100_5 = (var_100_3.transform.localPosition - var_100_1).z
					local var_100_6 = manager.ui.mainCameraCom_
					local var_100_7 = 2 * var_100_5 * Mathf.Tan(var_100_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_100_8 = var_100_7 * var_100_6.aspect
					local var_100_9 = var_100_4.sprite.bounds.size.x
					local var_100_10 = var_100_4.sprite.bounds.size.y
					local var_100_11 = var_100_8 / var_100_9
					local var_100_12 = var_100_7 / var_100_10
					local var_100_13 = var_100_12 < var_100_11 and var_100_11 or var_100_12

					var_100_3.transform.localScale = Vector3.New(var_100_13, var_100_13, 0)
				end

				for iter_100_0, iter_100_1 in pairs(arg_97_1.bgs_) do
					if iter_100_0 ~= "J10h" then
						iter_100_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_100_14 = 0

			if var_100_14 < arg_97_1.time_ and arg_97_1.time_ <= var_100_14 + arg_100_0 then
				arg_97_1.mask_.enabled = true
				arg_97_1.mask_.raycastTarget = true

				arg_97_1:SetGaussion(false)
			end

			local var_100_15 = 1

			if var_100_14 <= arg_97_1.time_ and arg_97_1.time_ < var_100_14 + var_100_15 then
				local var_100_16 = (arg_97_1.time_ - var_100_14) / var_100_15
				local var_100_17 = Color.New(0, 0, 0)

				var_100_17.a = Mathf.Lerp(0, 1, var_100_16)
				arg_97_1.mask_.color = var_100_17
			end

			if arg_97_1.time_ >= var_100_14 + var_100_15 and arg_97_1.time_ < var_100_14 + var_100_15 + arg_100_0 then
				local var_100_18 = Color.New(0, 0, 0)

				var_100_18.a = 1
				arg_97_1.mask_.color = var_100_18
			end

			local var_100_19 = 1

			if var_100_19 < arg_97_1.time_ and arg_97_1.time_ <= var_100_19 + arg_100_0 then
				arg_97_1.mask_.enabled = true
				arg_97_1.mask_.raycastTarget = true

				arg_97_1:SetGaussion(false)
			end

			local var_100_20 = 1

			if var_100_19 <= arg_97_1.time_ and arg_97_1.time_ < var_100_19 + var_100_20 then
				local var_100_21 = (arg_97_1.time_ - var_100_19) / var_100_20
				local var_100_22 = Color.New(0, 0, 0)

				var_100_22.a = Mathf.Lerp(1, 0, var_100_21)
				arg_97_1.mask_.color = var_100_22
			end

			if arg_97_1.time_ >= var_100_19 + var_100_20 and arg_97_1.time_ < var_100_19 + var_100_20 + arg_100_0 then
				local var_100_23 = Color.New(0, 0, 0)
				local var_100_24 = 0

				arg_97_1.mask_.enabled = false
				var_100_23.a = var_100_24
				arg_97_1.mask_.color = var_100_23
			end

			local var_100_25 = arg_97_1.actors_["1072ui_story"].transform
			local var_100_26 = 2

			if var_100_26 < arg_97_1.time_ and arg_97_1.time_ <= var_100_26 + arg_100_0 then
				arg_97_1.var_.moveOldPos1072ui_story = var_100_25.localPosition
			end

			local var_100_27 = 0.001

			if var_100_26 <= arg_97_1.time_ and arg_97_1.time_ < var_100_26 + var_100_27 then
				local var_100_28 = (arg_97_1.time_ - var_100_26) / var_100_27
				local var_100_29 = Vector3.New(0, -0.71, -6)

				var_100_25.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1072ui_story, var_100_29, var_100_28)

				local var_100_30 = manager.ui.mainCamera.transform.position - var_100_25.position

				var_100_25.forward = Vector3.New(var_100_30.x, var_100_30.y, var_100_30.z)

				local var_100_31 = var_100_25.localEulerAngles

				var_100_31.z = 0
				var_100_31.x = 0
				var_100_25.localEulerAngles = var_100_31
			end

			if arg_97_1.time_ >= var_100_26 + var_100_27 and arg_97_1.time_ < var_100_26 + var_100_27 + arg_100_0 then
				var_100_25.localPosition = Vector3.New(0, -0.71, -6)

				local var_100_32 = manager.ui.mainCamera.transform.position - var_100_25.position

				var_100_25.forward = Vector3.New(var_100_32.x, var_100_32.y, var_100_32.z)

				local var_100_33 = var_100_25.localEulerAngles

				var_100_33.z = 0
				var_100_33.x = 0
				var_100_25.localEulerAngles = var_100_33
			end

			local var_100_34 = arg_97_1.actors_["1072ui_story"]
			local var_100_35 = 2

			if var_100_35 < arg_97_1.time_ and arg_97_1.time_ <= var_100_35 + arg_100_0 and arg_97_1.var_.characterEffect1072ui_story == nil then
				arg_97_1.var_.characterEffect1072ui_story = var_100_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_36 = 0.200000002980232

			if var_100_35 <= arg_97_1.time_ and arg_97_1.time_ < var_100_35 + var_100_36 then
				local var_100_37 = (arg_97_1.time_ - var_100_35) / var_100_36

				if arg_97_1.var_.characterEffect1072ui_story then
					arg_97_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_35 + var_100_36 and arg_97_1.time_ < var_100_35 + var_100_36 + arg_100_0 and arg_97_1.var_.characterEffect1072ui_story then
				arg_97_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_100_38 = 2

			if var_100_38 < arg_97_1.time_ and arg_97_1.time_ <= var_100_38 + arg_100_0 then
				arg_97_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_100_39 = 2

			if var_100_39 < arg_97_1.time_ and arg_97_1.time_ <= var_100_39 + arg_100_0 then
				arg_97_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			if arg_97_1.frameCnt_ <= 1 then
				arg_97_1.dialog_:SetActive(false)
			end

			local var_100_40 = 2
			local var_100_41 = 0.35

			if var_100_40 < arg_97_1.time_ and arg_97_1.time_ <= var_100_40 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0

				arg_97_1.dialog_:SetActive(true)

				local var_100_42 = LeanTween.value(arg_97_1.dialog_, 0, 1, 0.3)

				var_100_42:setOnUpdate(LuaHelper.FloatAction(function(arg_101_0)
					arg_97_1.dialogCg_.alpha = arg_101_0
				end))
				var_100_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_97_1.dialog_)
					var_100_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_97_1.duration_ = arg_97_1.duration_ + 0.3

				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_43 = arg_97_1:FormatText(StoryNameCfg[379].name)

				arg_97_1.leftNameTxt_.text = var_100_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_44 = arg_97_1:GetWordFromCfg(122462024)
				local var_100_45 = arg_97_1:FormatText(var_100_44.content)

				arg_97_1.text_.text = var_100_45

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_46 = 13
				local var_100_47 = utf8.len(var_100_45)
				local var_100_48 = var_100_46 <= 0 and var_100_41 or var_100_41 * (var_100_47 / var_100_46)

				if var_100_48 > 0 and var_100_41 < var_100_48 then
					arg_97_1.talkMaxDuration = var_100_48
					var_100_40 = var_100_40 + 0.3

					if var_100_48 + var_100_40 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_48 + var_100_40
					end
				end

				arg_97_1.text_.text = var_100_45
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122462", "122462024", "story_v_out_122462.awb") ~= 0 then
					local var_100_49 = manager.audio:GetVoiceLength("story_v_out_122462", "122462024", "story_v_out_122462.awb") / 1000

					if var_100_49 + var_100_40 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_49 + var_100_40
					end

					if var_100_44.prefab_name ~= "" and arg_97_1.actors_[var_100_44.prefab_name] ~= nil then
						local var_100_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_44.prefab_name].transform, "story_v_out_122462", "122462024", "story_v_out_122462.awb")

						arg_97_1:RecordAudio("122462024", var_100_50)
						arg_97_1:RecordAudio("122462024", var_100_50)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_122462", "122462024", "story_v_out_122462.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_122462", "122462024", "story_v_out_122462.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_51 = var_100_40 + 0.3
			local var_100_52 = math.max(var_100_41, arg_97_1.talkMaxDuration)

			if var_100_51 <= arg_97_1.time_ and arg_97_1.time_ < var_100_51 + var_100_52 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_51) / var_100_52

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_51 + var_100_52 and arg_97_1.time_ < var_100_51 + var_100_52 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play122462025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 122462025
		arg_103_1.duration_ = 6.63333333333333

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play122462026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1072ui_story"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos1072ui_story = var_106_0.localPosition
			end

			local var_106_2 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(0, 100, 0)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1072ui_story, var_106_4, var_106_3)

				local var_106_5 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_5.x, var_106_5.y, var_106_5.z)

				local var_106_6 = var_106_0.localEulerAngles

				var_106_6.z = 0
				var_106_6.x = 0
				var_106_0.localEulerAngles = var_106_6
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(0, 100, 0)

				local var_106_7 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_7.x, var_106_7.y, var_106_7.z)

				local var_106_8 = var_106_0.localEulerAngles

				var_106_8.z = 0
				var_106_8.x = 0
				var_106_0.localEulerAngles = var_106_8
			end

			local var_106_9 = 0

			if var_106_9 < arg_103_1.time_ and arg_103_1.time_ <= var_106_9 + arg_106_0 then
				arg_103_1.mask_.enabled = true
				arg_103_1.mask_.raycastTarget = true

				arg_103_1:SetGaussion(false)
			end

			local var_106_10 = 2

			if var_106_9 <= arg_103_1.time_ and arg_103_1.time_ < var_106_9 + var_106_10 then
				local var_106_11 = (arg_103_1.time_ - var_106_9) / var_106_10
				local var_106_12 = Color.New(1, 1, 1)

				var_106_12.a = Mathf.Lerp(1, 0, var_106_11)
				arg_103_1.mask_.color = var_106_12
			end

			if arg_103_1.time_ >= var_106_9 + var_106_10 and arg_103_1.time_ < var_106_9 + var_106_10 + arg_106_0 then
				local var_106_13 = Color.New(1, 1, 1)
				local var_106_14 = 0

				arg_103_1.mask_.enabled = false
				var_106_13.a = var_106_14
				arg_103_1.mask_.color = var_106_13
			end

			local var_106_15 = manager.ui.mainCamera.transform
			local var_106_16 = 0

			if var_106_16 < arg_103_1.time_ and arg_103_1.time_ <= var_106_16 + arg_106_0 then
				arg_103_1.var_.shakeOldPos = var_106_15.localPosition
			end

			local var_106_17 = 2

			if var_106_16 <= arg_103_1.time_ and arg_103_1.time_ < var_106_16 + var_106_17 then
				local var_106_18 = (arg_103_1.time_ - var_106_16) / 0.066
				local var_106_19, var_106_20 = math.modf(var_106_18)

				var_106_15.localPosition = Vector3.New(var_106_20 * 0.13, var_106_20 * 0.13, var_106_20 * 0.13) + arg_103_1.var_.shakeOldPos
			end

			if arg_103_1.time_ >= var_106_16 + var_106_17 and arg_103_1.time_ < var_106_16 + var_106_17 + arg_106_0 then
				var_106_15.localPosition = arg_103_1.var_.shakeOldPos
			end

			local var_106_21 = 1.63333333333333
			local var_106_22 = 1

			if var_106_21 < arg_103_1.time_ and arg_103_1.time_ <= var_106_21 + arg_106_0 then
				local var_106_23 = "play"
				local var_106_24 = "music"

				arg_103_1:AudioAction(var_106_23, var_106_24, "se_story_122_01", "se_story_122_01_crack_start", "")
			end

			if arg_103_1.frameCnt_ <= 1 then
				arg_103_1.dialog_:SetActive(false)
			end

			local var_106_25 = 1.63333333333333
			local var_106_26 = 1.35

			if var_106_25 < arg_103_1.time_ and arg_103_1.time_ <= var_106_25 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0

				arg_103_1.dialog_:SetActive(true)

				local var_106_27 = LeanTween.value(arg_103_1.dialog_, 0, 1, 0.3)

				var_106_27:setOnUpdate(LuaHelper.FloatAction(function(arg_107_0)
					arg_103_1.dialogCg_.alpha = arg_107_0
				end))
				var_106_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_103_1.dialog_)
					var_106_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_103_1.duration_ = arg_103_1.duration_ + 0.3

				SetActive(arg_103_1.leftNameGo_, false)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_28 = arg_103_1:GetWordFromCfg(122462025)
				local var_106_29 = arg_103_1:FormatText(var_106_28.content)

				arg_103_1.text_.text = var_106_29

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_30 = 54
				local var_106_31 = utf8.len(var_106_29)
				local var_106_32 = var_106_30 <= 0 and var_106_26 or var_106_26 * (var_106_31 / var_106_30)

				if var_106_32 > 0 and var_106_26 < var_106_32 then
					arg_103_1.talkMaxDuration = var_106_32
					var_106_25 = var_106_25 + 0.3

					if var_106_32 + var_106_25 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_32 + var_106_25
					end
				end

				arg_103_1.text_.text = var_106_29
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_33 = var_106_25 + 0.3
			local var_106_34 = math.max(var_106_26, arg_103_1.talkMaxDuration)

			if var_106_33 <= arg_103_1.time_ and arg_103_1.time_ < var_106_33 + var_106_34 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_33) / var_106_34

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_33 + var_106_34 and arg_103_1.time_ < var_106_33 + var_106_34 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play122462026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 122462026
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play122462027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 0.65

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, false)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_2 = arg_109_1:GetWordFromCfg(122462026)
				local var_112_3 = arg_109_1:FormatText(var_112_2.content)

				arg_109_1.text_.text = var_112_3

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_4 = 26
				local var_112_5 = utf8.len(var_112_3)
				local var_112_6 = var_112_4 <= 0 and var_112_1 or var_112_1 * (var_112_5 / var_112_4)

				if var_112_6 > 0 and var_112_1 < var_112_6 then
					arg_109_1.talkMaxDuration = var_112_6

					if var_112_6 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_6 + var_112_0
					end
				end

				arg_109_1.text_.text = var_112_3
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)
				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_7 = math.max(var_112_1, arg_109_1.talkMaxDuration)

			if var_112_0 <= arg_109_1.time_ and arg_109_1.time_ < var_112_0 + var_112_7 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_0) / var_112_7

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_0 + var_112_7 and arg_109_1.time_ < var_112_0 + var_112_7 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play122462027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 122462027
		arg_113_1.duration_ = 12.566

		local var_113_0 = {
			ja = 12.566,
			ko = 8.7,
			zh = 8.7
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
				arg_113_0:Play122462028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = "J08h"

			if arg_113_1.bgs_[var_116_0] == nil then
				local var_116_1 = Object.Instantiate(arg_113_1.paintGo_)

				var_116_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_116_0)
				var_116_1.name = var_116_0
				var_116_1.transform.parent = arg_113_1.stage_.transform
				var_116_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_113_1.bgs_[var_116_0] = var_116_1
			end

			local var_116_2 = 2

			if var_116_2 < arg_113_1.time_ and arg_113_1.time_ <= var_116_2 + arg_116_0 then
				local var_116_3 = manager.ui.mainCamera.transform.localPosition
				local var_116_4 = Vector3.New(0, 0, 10) + Vector3.New(var_116_3.x, var_116_3.y, 0)
				local var_116_5 = arg_113_1.bgs_.J08h

				var_116_5.transform.localPosition = var_116_4
				var_116_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_116_6 = var_116_5:GetComponent("SpriteRenderer")

				if var_116_6 and var_116_6.sprite then
					local var_116_7 = (var_116_5.transform.localPosition - var_116_3).z
					local var_116_8 = manager.ui.mainCameraCom_
					local var_116_9 = 2 * var_116_7 * Mathf.Tan(var_116_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_116_10 = var_116_9 * var_116_8.aspect
					local var_116_11 = var_116_6.sprite.bounds.size.x
					local var_116_12 = var_116_6.sprite.bounds.size.y
					local var_116_13 = var_116_10 / var_116_11
					local var_116_14 = var_116_9 / var_116_12
					local var_116_15 = var_116_14 < var_116_13 and var_116_13 or var_116_14

					var_116_5.transform.localScale = Vector3.New(var_116_15, var_116_15, 0)
				end

				for iter_116_0, iter_116_1 in pairs(arg_113_1.bgs_) do
					if iter_116_0 ~= "J08h" then
						iter_116_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_116_16 = 0

			if var_116_16 < arg_113_1.time_ and arg_113_1.time_ <= var_116_16 + arg_116_0 then
				arg_113_1.mask_.enabled = true
				arg_113_1.mask_.raycastTarget = true

				arg_113_1:SetGaussion(false)
			end

			local var_116_17 = 2

			if var_116_16 <= arg_113_1.time_ and arg_113_1.time_ < var_116_16 + var_116_17 then
				local var_116_18 = (arg_113_1.time_ - var_116_16) / var_116_17
				local var_116_19 = Color.New(0, 0, 0)

				var_116_19.a = Mathf.Lerp(0, 1, var_116_18)
				arg_113_1.mask_.color = var_116_19
			end

			if arg_113_1.time_ >= var_116_16 + var_116_17 and arg_113_1.time_ < var_116_16 + var_116_17 + arg_116_0 then
				local var_116_20 = Color.New(0, 0, 0)

				var_116_20.a = 1
				arg_113_1.mask_.color = var_116_20
			end

			local var_116_21 = 2

			if var_116_21 < arg_113_1.time_ and arg_113_1.time_ <= var_116_21 + arg_116_0 then
				arg_113_1.mask_.enabled = true
				arg_113_1.mask_.raycastTarget = true

				arg_113_1:SetGaussion(false)
			end

			local var_116_22 = 2

			if var_116_21 <= arg_113_1.time_ and arg_113_1.time_ < var_116_21 + var_116_22 then
				local var_116_23 = (arg_113_1.time_ - var_116_21) / var_116_22
				local var_116_24 = Color.New(0, 0, 0)

				var_116_24.a = Mathf.Lerp(1, 0, var_116_23)
				arg_113_1.mask_.color = var_116_24
			end

			if arg_113_1.time_ >= var_116_21 + var_116_22 and arg_113_1.time_ < var_116_21 + var_116_22 + arg_116_0 then
				local var_116_25 = Color.New(0, 0, 0)
				local var_116_26 = 0

				arg_113_1.mask_.enabled = false
				var_116_25.a = var_116_26
				arg_113_1.mask_.color = var_116_25
			end

			local var_116_27 = "4037ui_story"

			if arg_113_1.actors_[var_116_27] == nil then
				local var_116_28 = Object.Instantiate(Asset.Load("Char/" .. var_116_27), arg_113_1.stage_.transform)

				var_116_28.name = var_116_27
				var_116_28.transform.localPosition = Vector3.New(0, 100, 0)
				arg_113_1.actors_[var_116_27] = var_116_28

				local var_116_29 = var_116_28:GetComponentInChildren(typeof(CharacterEffect))

				var_116_29.enabled = true

				local var_116_30 = GameObjectTools.GetOrAddComponent(var_116_28, typeof(DynamicBoneHelper))

				if var_116_30 then
					var_116_30:EnableDynamicBone(false)
				end

				arg_113_1:ShowWeapon(var_116_29.transform, false)

				arg_113_1.var_[var_116_27 .. "Animator"] = var_116_29.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_113_1.var_[var_116_27 .. "Animator"].applyRootMotion = true
				arg_113_1.var_[var_116_27 .. "LipSync"] = var_116_29.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_116_31 = arg_113_1.actors_["4037ui_story"].transform
			local var_116_32 = 4

			if var_116_32 < arg_113_1.time_ and arg_113_1.time_ <= var_116_32 + arg_116_0 then
				arg_113_1.var_.moveOldPos4037ui_story = var_116_31.localPosition
			end

			local var_116_33 = 0.001

			if var_116_32 <= arg_113_1.time_ and arg_113_1.time_ < var_116_32 + var_116_33 then
				local var_116_34 = (arg_113_1.time_ - var_116_32) / var_116_33
				local var_116_35 = Vector3.New(0, -1.12, -6.2)

				var_116_31.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos4037ui_story, var_116_35, var_116_34)

				local var_116_36 = manager.ui.mainCamera.transform.position - var_116_31.position

				var_116_31.forward = Vector3.New(var_116_36.x, var_116_36.y, var_116_36.z)

				local var_116_37 = var_116_31.localEulerAngles

				var_116_37.z = 0
				var_116_37.x = 0
				var_116_31.localEulerAngles = var_116_37
			end

			if arg_113_1.time_ >= var_116_32 + var_116_33 and arg_113_1.time_ < var_116_32 + var_116_33 + arg_116_0 then
				var_116_31.localPosition = Vector3.New(0, -1.12, -6.2)

				local var_116_38 = manager.ui.mainCamera.transform.position - var_116_31.position

				var_116_31.forward = Vector3.New(var_116_38.x, var_116_38.y, var_116_38.z)

				local var_116_39 = var_116_31.localEulerAngles

				var_116_39.z = 0
				var_116_39.x = 0
				var_116_31.localEulerAngles = var_116_39
			end

			local var_116_40 = arg_113_1.actors_["4037ui_story"]
			local var_116_41 = 4

			if var_116_41 < arg_113_1.time_ and arg_113_1.time_ <= var_116_41 + arg_116_0 and arg_113_1.var_.characterEffect4037ui_story == nil then
				arg_113_1.var_.characterEffect4037ui_story = var_116_40:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_42 = 0.200000002980232

			if var_116_41 <= arg_113_1.time_ and arg_113_1.time_ < var_116_41 + var_116_42 then
				local var_116_43 = (arg_113_1.time_ - var_116_41) / var_116_42

				if arg_113_1.var_.characterEffect4037ui_story then
					arg_113_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_41 + var_116_42 and arg_113_1.time_ < var_116_41 + var_116_42 + arg_116_0 and arg_113_1.var_.characterEffect4037ui_story then
				arg_113_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_116_44 = 4

			if var_116_44 < arg_113_1.time_ and arg_113_1.time_ <= var_116_44 + arg_116_0 then
				arg_113_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action1_1")
			end

			local var_116_45 = 4

			if var_116_45 < arg_113_1.time_ and arg_113_1.time_ <= var_116_45 + arg_116_0 then
				arg_113_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			if arg_113_1.frameCnt_ <= 1 then
				arg_113_1.dialog_:SetActive(false)
			end

			local var_116_46 = 4
			local var_116_47 = 0.45

			if var_116_46 < arg_113_1.time_ and arg_113_1.time_ <= var_116_46 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0

				arg_113_1.dialog_:SetActive(true)

				local var_116_48 = LeanTween.value(arg_113_1.dialog_, 0, 1, 0.3)

				var_116_48:setOnUpdate(LuaHelper.FloatAction(function(arg_117_0)
					arg_113_1.dialogCg_.alpha = arg_117_0
				end))
				var_116_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_113_1.dialog_)
					var_116_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_113_1.duration_ = arg_113_1.duration_ + 0.3

				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_49 = arg_113_1:FormatText(StoryNameCfg[453].name)

				arg_113_1.leftNameTxt_.text = var_116_49

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_50 = arg_113_1:GetWordFromCfg(122462027)
				local var_116_51 = arg_113_1:FormatText(var_116_50.content)

				arg_113_1.text_.text = var_116_51

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_52 = 18
				local var_116_53 = utf8.len(var_116_51)
				local var_116_54 = var_116_52 <= 0 and var_116_47 or var_116_47 * (var_116_53 / var_116_52)

				if var_116_54 > 0 and var_116_47 < var_116_54 then
					arg_113_1.talkMaxDuration = var_116_54
					var_116_46 = var_116_46 + 0.3

					if var_116_54 + var_116_46 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_54 + var_116_46
					end
				end

				arg_113_1.text_.text = var_116_51
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122462", "122462027", "story_v_out_122462.awb") ~= 0 then
					local var_116_55 = manager.audio:GetVoiceLength("story_v_out_122462", "122462027", "story_v_out_122462.awb") / 1000

					if var_116_55 + var_116_46 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_55 + var_116_46
					end

					if var_116_50.prefab_name ~= "" and arg_113_1.actors_[var_116_50.prefab_name] ~= nil then
						local var_116_56 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_50.prefab_name].transform, "story_v_out_122462", "122462027", "story_v_out_122462.awb")

						arg_113_1:RecordAudio("122462027", var_116_56)
						arg_113_1:RecordAudio("122462027", var_116_56)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_122462", "122462027", "story_v_out_122462.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_122462", "122462027", "story_v_out_122462.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_57 = var_116_46 + 0.3
			local var_116_58 = math.max(var_116_47, arg_113_1.talkMaxDuration)

			if var_116_57 <= arg_113_1.time_ and arg_113_1.time_ < var_116_57 + var_116_58 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_57) / var_116_58

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_57 + var_116_58 and arg_113_1.time_ < var_116_57 + var_116_58 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play122462028 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 122462028
		arg_119_1.duration_ = 7.333

		local var_119_0 = {
			ja = 7.333,
			ko = 7.066,
			zh = 7.066
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
				arg_119_0:Play122462029(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["4037ui_story"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.characterEffect4037ui_story == nil then
				arg_119_1.var_.characterEffect4037ui_story = var_122_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_2 = 0.200000002980232

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.characterEffect4037ui_story then
					local var_122_4 = Mathf.Lerp(0, 0.5, var_122_3)

					arg_119_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_119_1.var_.characterEffect4037ui_story.fillRatio = var_122_4
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.characterEffect4037ui_story then
				local var_122_5 = 0.5

				arg_119_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_119_1.var_.characterEffect4037ui_story.fillRatio = var_122_5
			end

			local var_122_6 = 0
			local var_122_7 = 0.425

			if var_122_6 < arg_119_1.time_ and arg_119_1.time_ <= var_122_6 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_8 = arg_119_1:FormatText(StoryNameCfg[384].name)

				arg_119_1.leftNameTxt_.text = var_122_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, true)
				arg_119_1.iconController_:SetSelectedState("hero")

				arg_119_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1071")

				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_9 = arg_119_1:GetWordFromCfg(122462028)
				local var_122_10 = arg_119_1:FormatText(var_122_9.content)

				arg_119_1.text_.text = var_122_10

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_11 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_122462", "122462028", "story_v_out_122462.awb") ~= 0 then
					local var_122_14 = manager.audio:GetVoiceLength("story_v_out_122462", "122462028", "story_v_out_122462.awb") / 1000

					if var_122_14 + var_122_6 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_14 + var_122_6
					end

					if var_122_9.prefab_name ~= "" and arg_119_1.actors_[var_122_9.prefab_name] ~= nil then
						local var_122_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_9.prefab_name].transform, "story_v_out_122462", "122462028", "story_v_out_122462.awb")

						arg_119_1:RecordAudio("122462028", var_122_15)
						arg_119_1:RecordAudio("122462028", var_122_15)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_122462", "122462028", "story_v_out_122462.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_122462", "122462028", "story_v_out_122462.awb")
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
	Play122462029 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 122462029
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play122462030(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["4037ui_story"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos4037ui_story = var_126_0.localPosition
			end

			local var_126_2 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2
				local var_126_4 = Vector3.New(0, 100, 0)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos4037ui_story, var_126_4, var_126_3)

				local var_126_5 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_5.x, var_126_5.y, var_126_5.z)

				local var_126_6 = var_126_0.localEulerAngles

				var_126_6.z = 0
				var_126_6.x = 0
				var_126_0.localEulerAngles = var_126_6
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(0, 100, 0)

				local var_126_7 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_7.x, var_126_7.y, var_126_7.z)

				local var_126_8 = var_126_0.localEulerAngles

				var_126_8.z = 0
				var_126_8.x = 0
				var_126_0.localEulerAngles = var_126_8
			end

			local var_126_9 = 0
			local var_126_10 = 1.175

			if var_126_9 < arg_123_1.time_ and arg_123_1.time_ <= var_126_9 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, false)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_11 = arg_123_1:GetWordFromCfg(122462029)
				local var_126_12 = arg_123_1:FormatText(var_126_11.content)

				arg_123_1.text_.text = var_126_12

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_13 = 47
				local var_126_14 = utf8.len(var_126_12)
				local var_126_15 = var_126_13 <= 0 and var_126_10 or var_126_10 * (var_126_14 / var_126_13)

				if var_126_15 > 0 and var_126_10 < var_126_15 then
					arg_123_1.talkMaxDuration = var_126_15

					if var_126_15 + var_126_9 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_15 + var_126_9
					end
				end

				arg_123_1.text_.text = var_126_12
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_16 = math.max(var_126_10, arg_123_1.talkMaxDuration)

			if var_126_9 <= arg_123_1.time_ and arg_123_1.time_ < var_126_9 + var_126_16 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_9) / var_126_16

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_9 + var_126_16 and arg_123_1.time_ < var_126_9 + var_126_16 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play122462030 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 122462030
		arg_127_1.duration_ = 5

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play122462031(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 1.25

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, false)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_2 = arg_127_1:GetWordFromCfg(122462030)
				local var_130_3 = arg_127_1:FormatText(var_130_2.content)

				arg_127_1.text_.text = var_130_3

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_4 = 50
				local var_130_5 = utf8.len(var_130_3)
				local var_130_6 = var_130_4 <= 0 and var_130_1 or var_130_1 * (var_130_5 / var_130_4)

				if var_130_6 > 0 and var_130_1 < var_130_6 then
					arg_127_1.talkMaxDuration = var_130_6

					if var_130_6 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_6 + var_130_0
					end
				end

				arg_127_1.text_.text = var_130_3
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)
				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_7 = math.max(var_130_1, arg_127_1.talkMaxDuration)

			if var_130_0 <= arg_127_1.time_ and arg_127_1.time_ < var_130_0 + var_130_7 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_0) / var_130_7

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_0 + var_130_7 and arg_127_1.time_ < var_130_0 + var_130_7 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play122462031 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 122462031
		arg_131_1.duration_ = 7

		local var_131_0 = {
			ja = 7,
			ko = 4.3,
			zh = 4.3
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
				arg_131_0:Play122462032(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["4037ui_story"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos4037ui_story = var_134_0.localPosition
			end

			local var_134_2 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2
				local var_134_4 = Vector3.New(0, -1.12, -6.2)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos4037ui_story, var_134_4, var_134_3)

				local var_134_5 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_5.x, var_134_5.y, var_134_5.z)

				local var_134_6 = var_134_0.localEulerAngles

				var_134_6.z = 0
				var_134_6.x = 0
				var_134_0.localEulerAngles = var_134_6
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(0, -1.12, -6.2)

				local var_134_7 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_7.x, var_134_7.y, var_134_7.z)

				local var_134_8 = var_134_0.localEulerAngles

				var_134_8.z = 0
				var_134_8.x = 0
				var_134_0.localEulerAngles = var_134_8
			end

			local var_134_9 = arg_131_1.actors_["4037ui_story"]
			local var_134_10 = 0

			if var_134_10 < arg_131_1.time_ and arg_131_1.time_ <= var_134_10 + arg_134_0 and arg_131_1.var_.characterEffect4037ui_story == nil then
				arg_131_1.var_.characterEffect4037ui_story = var_134_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_11 = 0.200000002980232

			if var_134_10 <= arg_131_1.time_ and arg_131_1.time_ < var_134_10 + var_134_11 then
				local var_134_12 = (arg_131_1.time_ - var_134_10) / var_134_11

				if arg_131_1.var_.characterEffect4037ui_story then
					arg_131_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_10 + var_134_11 and arg_131_1.time_ < var_134_10 + var_134_11 + arg_134_0 and arg_131_1.var_.characterEffect4037ui_story then
				arg_131_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_134_13 = 0

			if var_134_13 < arg_131_1.time_ and arg_131_1.time_ <= var_134_13 + arg_134_0 then
				arg_131_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action1_1")
			end

			local var_134_14 = 0

			if var_134_14 < arg_131_1.time_ and arg_131_1.time_ <= var_134_14 + arg_134_0 then
				arg_131_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_134_15 = 0
			local var_134_16 = 1

			if var_134_15 < arg_131_1.time_ and arg_131_1.time_ <= var_134_15 + arg_134_0 then
				local var_134_17 = "play"
				local var_134_18 = "music"

				arg_131_1:AudioAction(var_134_17, var_134_18, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_134_19 = 0
			local var_134_20 = 0.425

			if var_134_19 < arg_131_1.time_ and arg_131_1.time_ <= var_134_19 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_21 = arg_131_1:FormatText(StoryNameCfg[453].name)

				arg_131_1.leftNameTxt_.text = var_134_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_22 = arg_131_1:GetWordFromCfg(122462031)
				local var_134_23 = arg_131_1:FormatText(var_134_22.content)

				arg_131_1.text_.text = var_134_23

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_24 = 17
				local var_134_25 = utf8.len(var_134_23)
				local var_134_26 = var_134_24 <= 0 and var_134_20 or var_134_20 * (var_134_25 / var_134_24)

				if var_134_26 > 0 and var_134_20 < var_134_26 then
					arg_131_1.talkMaxDuration = var_134_26

					if var_134_26 + var_134_19 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_26 + var_134_19
					end
				end

				arg_131_1.text_.text = var_134_23
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122462", "122462031", "story_v_out_122462.awb") ~= 0 then
					local var_134_27 = manager.audio:GetVoiceLength("story_v_out_122462", "122462031", "story_v_out_122462.awb") / 1000

					if var_134_27 + var_134_19 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_27 + var_134_19
					end

					if var_134_22.prefab_name ~= "" and arg_131_1.actors_[var_134_22.prefab_name] ~= nil then
						local var_134_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_22.prefab_name].transform, "story_v_out_122462", "122462031", "story_v_out_122462.awb")

						arg_131_1:RecordAudio("122462031", var_134_28)
						arg_131_1:RecordAudio("122462031", var_134_28)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_122462", "122462031", "story_v_out_122462.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_122462", "122462031", "story_v_out_122462.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_29 = math.max(var_134_20, arg_131_1.talkMaxDuration)

			if var_134_19 <= arg_131_1.time_ and arg_131_1.time_ < var_134_19 + var_134_29 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_19) / var_134_29

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_19 + var_134_29 and arg_131_1.time_ < var_134_19 + var_134_29 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play122462032 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 122462032
		arg_135_1.duration_ = 6.4

		local var_135_0 = {
			ja = 6.133,
			ko = 6.4,
			zh = 6.4
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
				arg_135_0:Play122462033(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["4037ui_story"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.characterEffect4037ui_story == nil then
				arg_135_1.var_.characterEffect4037ui_story = var_138_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_2 = 0.200000002980232

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.characterEffect4037ui_story then
					local var_138_4 = Mathf.Lerp(0, 0.5, var_138_3)

					arg_135_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_135_1.var_.characterEffect4037ui_story.fillRatio = var_138_4
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect4037ui_story then
				local var_138_5 = 0.5

				arg_135_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_135_1.var_.characterEffect4037ui_story.fillRatio = var_138_5
			end

			local var_138_6 = 0
			local var_138_7 = 0.325

			if var_138_6 < arg_135_1.time_ and arg_135_1.time_ <= var_138_6 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_8 = arg_135_1:FormatText(StoryNameCfg[384].name)

				arg_135_1.leftNameTxt_.text = var_138_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, true)
				arg_135_1.iconController_:SetSelectedState("hero")

				arg_135_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1071")

				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_9 = arg_135_1:GetWordFromCfg(122462032)
				local var_138_10 = arg_135_1:FormatText(var_138_9.content)

				arg_135_1.text_.text = var_138_10

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_11 = 13
				local var_138_12 = utf8.len(var_138_10)
				local var_138_13 = var_138_11 <= 0 and var_138_7 or var_138_7 * (var_138_12 / var_138_11)

				if var_138_13 > 0 and var_138_7 < var_138_13 then
					arg_135_1.talkMaxDuration = var_138_13

					if var_138_13 + var_138_6 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_13 + var_138_6
					end
				end

				arg_135_1.text_.text = var_138_10
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122462", "122462032", "story_v_out_122462.awb") ~= 0 then
					local var_138_14 = manager.audio:GetVoiceLength("story_v_out_122462", "122462032", "story_v_out_122462.awb") / 1000

					if var_138_14 + var_138_6 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_14 + var_138_6
					end

					if var_138_9.prefab_name ~= "" and arg_135_1.actors_[var_138_9.prefab_name] ~= nil then
						local var_138_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_9.prefab_name].transform, "story_v_out_122462", "122462032", "story_v_out_122462.awb")

						arg_135_1:RecordAudio("122462032", var_138_15)
						arg_135_1:RecordAudio("122462032", var_138_15)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_122462", "122462032", "story_v_out_122462.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_122462", "122462032", "story_v_out_122462.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_16 = math.max(var_138_7, arg_135_1.talkMaxDuration)

			if var_138_6 <= arg_135_1.time_ and arg_135_1.time_ < var_138_6 + var_138_16 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_6) / var_138_16

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_6 + var_138_16 and arg_135_1.time_ < var_138_6 + var_138_16 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play122462033 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 122462033
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play122462034(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["4037ui_story"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos4037ui_story = var_142_0.localPosition
			end

			local var_142_2 = 0.001

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2
				local var_142_4 = Vector3.New(0, 100, 0)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos4037ui_story, var_142_4, var_142_3)

				local var_142_5 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_5.x, var_142_5.y, var_142_5.z)

				local var_142_6 = var_142_0.localEulerAngles

				var_142_6.z = 0
				var_142_6.x = 0
				var_142_0.localEulerAngles = var_142_6
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(0, 100, 0)

				local var_142_7 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_7.x, var_142_7.y, var_142_7.z)

				local var_142_8 = var_142_0.localEulerAngles

				var_142_8.z = 0
				var_142_8.x = 0
				var_142_0.localEulerAngles = var_142_8
			end

			local var_142_9 = manager.ui.mainCamera.transform
			local var_142_10 = 0

			if var_142_10 < arg_139_1.time_ and arg_139_1.time_ <= var_142_10 + arg_142_0 then
				arg_139_1.var_.shakeOldPos = var_142_9.localPosition
			end

			local var_142_11 = 0.6

			if var_142_10 <= arg_139_1.time_ and arg_139_1.time_ < var_142_10 + var_142_11 then
				local var_142_12 = (arg_139_1.time_ - var_142_10) / 0.066
				local var_142_13, var_142_14 = math.modf(var_142_12)

				var_142_9.localPosition = Vector3.New(var_142_14 * 0.13, var_142_14 * 0.13, var_142_14 * 0.13) + arg_139_1.var_.shakeOldPos
			end

			if arg_139_1.time_ >= var_142_10 + var_142_11 and arg_139_1.time_ < var_142_10 + var_142_11 + arg_142_0 then
				var_142_9.localPosition = arg_139_1.var_.shakeOldPos
			end

			local var_142_15 = 0

			if var_142_15 < arg_139_1.time_ and arg_139_1.time_ <= var_142_15 + arg_142_0 then
				arg_139_1.allBtn_.enabled = false
			end

			local var_142_16 = 0.6

			if arg_139_1.time_ >= var_142_15 + var_142_16 and arg_139_1.time_ < var_142_15 + var_142_16 + arg_142_0 then
				arg_139_1.allBtn_.enabled = true
			end

			local var_142_17 = 0
			local var_142_18 = 0.666666666666667

			if var_142_17 < arg_139_1.time_ and arg_139_1.time_ <= var_142_17 + arg_142_0 then
				local var_142_19 = "play"
				local var_142_20 = "effect"

				arg_139_1:AudioAction(var_142_19, var_142_20, "se_story_122_03", "se_story_122_03_impale", "")
			end

			local var_142_21 = 0
			local var_142_22 = 1.175

			if var_142_21 < arg_139_1.time_ and arg_139_1.time_ <= var_142_21 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, false)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_23 = arg_139_1:GetWordFromCfg(122462033)
				local var_142_24 = arg_139_1:FormatText(var_142_23.content)

				arg_139_1.text_.text = var_142_24

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_25 = 47
				local var_142_26 = utf8.len(var_142_24)
				local var_142_27 = var_142_25 <= 0 and var_142_22 or var_142_22 * (var_142_26 / var_142_25)

				if var_142_27 > 0 and var_142_22 < var_142_27 then
					arg_139_1.talkMaxDuration = var_142_27

					if var_142_27 + var_142_21 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_27 + var_142_21
					end
				end

				arg_139_1.text_.text = var_142_24
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_28 = math.max(var_142_22, arg_139_1.talkMaxDuration)

			if var_142_21 <= arg_139_1.time_ and arg_139_1.time_ < var_142_21 + var_142_28 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_21) / var_142_28

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_21 + var_142_28 and arg_139_1.time_ < var_142_21 + var_142_28 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play122462034 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 122462034
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play122462035(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 1.875

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_2 = arg_143_1:GetWordFromCfg(122462034)
				local var_146_3 = arg_143_1:FormatText(var_146_2.content)

				arg_143_1.text_.text = var_146_3

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_4 = 75
				local var_146_5 = utf8.len(var_146_3)
				local var_146_6 = var_146_4 <= 0 and var_146_1 or var_146_1 * (var_146_5 / var_146_4)

				if var_146_6 > 0 and var_146_1 < var_146_6 then
					arg_143_1.talkMaxDuration = var_146_6

					if var_146_6 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_6 + var_146_0
					end
				end

				arg_143_1.text_.text = var_146_3
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_7 = math.max(var_146_1, arg_143_1.talkMaxDuration)

			if var_146_0 <= arg_143_1.time_ and arg_143_1.time_ < var_146_0 + var_146_7 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_0) / var_146_7

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_0 + var_146_7 and arg_143_1.time_ < var_146_0 + var_146_7 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play122462035 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 122462035
		arg_147_1.duration_ = 5

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play122462036(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = "J08h_blur"

			if arg_147_1.bgs_[var_150_0] == nil then
				local var_150_1 = Object.Instantiate(arg_147_1.blurPaintGo_)
				local var_150_2 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_150_0)

				var_150_1:GetComponent("SpriteRenderer").sprite = var_150_2
				var_150_1.name = var_150_0
				var_150_1.transform.parent = arg_147_1.stage_.transform
				var_150_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_147_1.bgs_[var_150_0] = var_150_1
			end

			local var_150_3 = 0
			local var_150_4 = arg_147_1.bgs_[var_150_0]

			if var_150_3 < arg_147_1.time_ and arg_147_1.time_ <= var_150_3 + arg_150_0 then
				local var_150_5 = manager.ui.mainCamera.transform.localPosition
				local var_150_6 = Vector3.New(0, 0, 10) + Vector3.New(var_150_5.x, var_150_5.y, 0)

				var_150_4.transform.localPosition = var_150_6
				var_150_4.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_150_7 = var_150_4:GetComponent("SpriteRenderer")

				if var_150_7 and var_150_7.sprite then
					local var_150_8 = (var_150_4.transform.localPosition - var_150_5).z
					local var_150_9 = manager.ui.mainCameraCom_
					local var_150_10 = 2 * var_150_8 * Mathf.Tan(var_150_9.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_150_11 = var_150_10 * var_150_9.aspect
					local var_150_12 = var_150_7.sprite.bounds.size.x
					local var_150_13 = var_150_7.sprite.bounds.size.y
					local var_150_14 = var_150_11 / var_150_12
					local var_150_15 = var_150_10 / var_150_13
					local var_150_16 = var_150_15 < var_150_14 and var_150_14 or var_150_15

					var_150_4.transform.localScale = Vector3.New(var_150_16, var_150_16, 0)
				end
			end

			local var_150_17 = 2

			if var_150_3 <= arg_147_1.time_ and arg_147_1.time_ < var_150_3 + var_150_17 then
				local var_150_18 = (arg_147_1.time_ - var_150_3) / var_150_17
				local var_150_19 = Color.New(1, 1, 1)

				var_150_19.a = Mathf.Lerp(0, 1, var_150_18)

				var_150_4:GetComponent("SpriteRenderer").material:SetColor("_Color", var_150_19)
			end

			local var_150_20 = 0

			if var_150_20 < arg_147_1.time_ and arg_147_1.time_ <= var_150_20 + arg_150_0 then
				arg_147_1.allBtn_.enabled = false
			end

			local var_150_21 = 2

			if arg_147_1.time_ >= var_150_20 + var_150_21 and arg_147_1.time_ < var_150_20 + var_150_21 + arg_150_0 then
				arg_147_1.allBtn_.enabled = true
			end

			local var_150_22 = 0
			local var_150_23 = 1

			if var_150_22 < arg_147_1.time_ and arg_147_1.time_ <= var_150_22 + arg_150_0 then
				local var_150_24 = "play"
				local var_150_25 = "effect"

				arg_147_1:AudioAction(var_150_24, var_150_25, "se_story_122_03", "se_story_122_03_impale", "")
			end

			local var_150_26 = 0
			local var_150_27 = 1.85

			if var_150_26 < arg_147_1.time_ and arg_147_1.time_ <= var_150_26 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, false)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_28 = arg_147_1:GetWordFromCfg(122462035)
				local var_150_29 = arg_147_1:FormatText(var_150_28.content)

				arg_147_1.text_.text = var_150_29

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_30 = 74
				local var_150_31 = utf8.len(var_150_29)
				local var_150_32 = var_150_30 <= 0 and var_150_27 or var_150_27 * (var_150_31 / var_150_30)

				if var_150_32 > 0 and var_150_27 < var_150_32 then
					arg_147_1.talkMaxDuration = var_150_32

					if var_150_32 + var_150_26 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_32 + var_150_26
					end
				end

				arg_147_1.text_.text = var_150_29
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)
				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_33 = math.max(var_150_27, arg_147_1.talkMaxDuration)

			if var_150_26 <= arg_147_1.time_ and arg_147_1.time_ < var_150_26 + var_150_33 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_26) / var_150_33

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_26 + var_150_33 and arg_147_1.time_ < var_150_26 + var_150_33 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play122462036 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 122462036
		arg_151_1.duration_ = 11.0666666666667

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play122462037(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.mask_.enabled = true
				arg_151_1.mask_.raycastTarget = true

				arg_151_1:SetGaussion(false)
			end

			local var_154_1 = 1.5

			if var_154_0 <= arg_151_1.time_ and arg_151_1.time_ < var_154_0 + var_154_1 then
				local var_154_2 = (arg_151_1.time_ - var_154_0) / var_154_1
				local var_154_3 = Color.New(0, 0, 0)

				var_154_3.a = Mathf.Lerp(0, 1, var_154_2)
				arg_151_1.mask_.color = var_154_3
			end

			if arg_151_1.time_ >= var_154_0 + var_154_1 and arg_151_1.time_ < var_154_0 + var_154_1 + arg_154_0 then
				local var_154_4 = Color.New(0, 0, 0)

				var_154_4.a = 1
				arg_151_1.mask_.color = var_154_4
			end

			local var_154_5 = 1.5

			if var_154_5 < arg_151_1.time_ and arg_151_1.time_ <= var_154_5 + arg_154_0 then
				arg_151_1.mask_.enabled = true
				arg_151_1.mask_.raycastTarget = true

				arg_151_1:SetGaussion(false)
			end

			local var_154_6 = 2

			if var_154_5 <= arg_151_1.time_ and arg_151_1.time_ < var_154_5 + var_154_6 then
				local var_154_7 = (arg_151_1.time_ - var_154_5) / var_154_6
				local var_154_8 = Color.New(0, 0, 0)

				var_154_8.a = Mathf.Lerp(1, 0, var_154_7)
				arg_151_1.mask_.color = var_154_8
			end

			if arg_151_1.time_ >= var_154_5 + var_154_6 and arg_151_1.time_ < var_154_5 + var_154_6 + arg_154_0 then
				local var_154_9 = Color.New(0, 0, 0)
				local var_154_10 = 0

				arg_151_1.mask_.enabled = false
				var_154_9.a = var_154_10
				arg_151_1.mask_.color = var_154_9
			end

			local var_154_11 = 6.06666666666667

			if var_154_11 < arg_151_1.time_ and arg_151_1.time_ <= var_154_11 + arg_154_0 then
				arg_151_1.mask_.enabled = true
				arg_151_1.mask_.raycastTarget = true

				arg_151_1:SetGaussion(false)
			end

			local var_154_12 = 1

			if var_154_11 <= arg_151_1.time_ and arg_151_1.time_ < var_154_11 + var_154_12 then
				local var_154_13 = (arg_151_1.time_ - var_154_11) / var_154_12
				local var_154_14 = Color.New(0, 0, 0)

				var_154_14.a = Mathf.Lerp(1, 0, var_154_13)
				arg_151_1.mask_.color = var_154_14
			end

			if arg_151_1.time_ >= var_154_11 + var_154_12 and arg_151_1.time_ < var_154_11 + var_154_12 + arg_154_0 then
				local var_154_15 = Color.New(0, 0, 0)
				local var_154_16 = 0

				arg_151_1.mask_.enabled = false
				var_154_15.a = var_154_16
				arg_151_1.mask_.color = var_154_15
			end

			local var_154_17 = 4.06666666666667

			if var_154_17 < arg_151_1.time_ and arg_151_1.time_ <= var_154_17 + arg_154_0 then
				arg_151_1.mask_.enabled = true
				arg_151_1.mask_.raycastTarget = true

				arg_151_1:SetGaussion(false)
			end

			local var_154_18 = 2

			if var_154_17 <= arg_151_1.time_ and arg_151_1.time_ < var_154_17 + var_154_18 then
				local var_154_19 = (arg_151_1.time_ - var_154_17) / var_154_18
				local var_154_20 = Color.New(0, 0, 0)

				var_154_20.a = Mathf.Lerp(0, 1, var_154_19)
				arg_151_1.mask_.color = var_154_20
			end

			if arg_151_1.time_ >= var_154_17 + var_154_18 and arg_151_1.time_ < var_154_17 + var_154_18 + arg_154_0 then
				local var_154_21 = Color.New(0, 0, 0)

				var_154_21.a = 1
				arg_151_1.mask_.color = var_154_21
			end

			local var_154_22 = manager.ui.mainCamera.transform
			local var_154_23 = 0

			if var_154_23 < arg_151_1.time_ and arg_151_1.time_ <= var_154_23 + arg_154_0 then
				local var_154_24 = arg_151_1.var_.effectmengzhangmohu1

				if not var_154_24 then
					var_154_24 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ripple"))
					var_154_24.name = "mengzhangmohu1"
					arg_151_1.var_.effectmengzhangmohu1 = var_154_24
				end

				local var_154_25 = var_154_22:Find("")

				if var_154_25 then
					var_154_24.transform.parent = var_154_25
				else
					var_154_24.transform.parent = var_154_22
				end

				var_154_24.transform.localPosition = Vector3.New(0, 0, 0)
				var_154_24.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_154_26 = "STblack"

			if arg_151_1.bgs_[var_154_26] == nil then
				local var_154_27 = Object.Instantiate(arg_151_1.paintGo_)

				var_154_27:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_154_26)
				var_154_27.name = var_154_26
				var_154_27.transform.parent = arg_151_1.stage_.transform
				var_154_27.transform.localPosition = Vector3.New(0, 100, 0)
				arg_151_1.bgs_[var_154_26] = var_154_27
			end

			local var_154_28 = 6.06666666666667

			if var_154_28 < arg_151_1.time_ and arg_151_1.time_ <= var_154_28 + arg_154_0 then
				local var_154_29 = manager.ui.mainCamera.transform.localPosition
				local var_154_30 = Vector3.New(0, 0, 10) + Vector3.New(var_154_29.x, var_154_29.y, 0)
				local var_154_31 = arg_151_1.bgs_.STblack

				var_154_31.transform.localPosition = var_154_30
				var_154_31.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_154_32 = var_154_31:GetComponent("SpriteRenderer")

				if var_154_32 and var_154_32.sprite then
					local var_154_33 = (var_154_31.transform.localPosition - var_154_29).z
					local var_154_34 = manager.ui.mainCameraCom_
					local var_154_35 = 2 * var_154_33 * Mathf.Tan(var_154_34.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_154_36 = var_154_35 * var_154_34.aspect
					local var_154_37 = var_154_32.sprite.bounds.size.x
					local var_154_38 = var_154_32.sprite.bounds.size.y
					local var_154_39 = var_154_36 / var_154_37
					local var_154_40 = var_154_35 / var_154_38
					local var_154_41 = var_154_40 < var_154_39 and var_154_39 or var_154_40

					var_154_31.transform.localScale = Vector3.New(var_154_41, var_154_41, 0)
				end

				for iter_154_0, iter_154_1 in pairs(arg_151_1.bgs_) do
					if iter_154_0 ~= "STblack" then
						iter_154_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_151_1.frameCnt_ <= 1 then
				arg_151_1.dialog_:SetActive(false)
			end

			local var_154_42 = 6.06666666666667
			local var_154_43 = 1.325

			if var_154_42 < arg_151_1.time_ and arg_151_1.time_ <= var_154_42 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0

				arg_151_1.dialog_:SetActive(true)

				local var_154_44 = LeanTween.value(arg_151_1.dialog_, 0, 1, 0.3)

				var_154_44:setOnUpdate(LuaHelper.FloatAction(function(arg_155_0)
					arg_151_1.dialogCg_.alpha = arg_155_0
				end))
				var_154_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_151_1.dialog_)
					var_154_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_151_1.duration_ = arg_151_1.duration_ + 0.3

				SetActive(arg_151_1.leftNameGo_, false)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_45 = arg_151_1:GetWordFromCfg(122462036)
				local var_154_46 = arg_151_1:FormatText(var_154_45.content)

				arg_151_1.text_.text = var_154_46

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_47 = 53
				local var_154_48 = utf8.len(var_154_46)
				local var_154_49 = var_154_47 <= 0 and var_154_43 or var_154_43 * (var_154_48 / var_154_47)

				if var_154_49 > 0 and var_154_43 < var_154_49 then
					arg_151_1.talkMaxDuration = var_154_49
					var_154_42 = var_154_42 + 0.3

					if var_154_49 + var_154_42 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_49 + var_154_42
					end
				end

				arg_151_1.text_.text = var_154_46
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)
				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_50 = var_154_42 + 0.3
			local var_154_51 = math.max(var_154_43, arg_151_1.talkMaxDuration)

			if var_154_50 <= arg_151_1.time_ and arg_151_1.time_ < var_154_50 + var_154_51 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_50) / var_154_51

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_50 + var_154_51 and arg_151_1.time_ < var_154_50 + var_154_51 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play122462037 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 122462037
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
			arg_157_1.auto_ = false
		end

		function arg_157_1.playNext_(arg_159_0)
			arg_157_1.onStoryFinished_()
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = manager.ui.mainCamera.transform
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				local var_160_2 = arg_157_1.var_.effectmengzhangmohu1

				if var_160_2 then
					Object.Destroy(var_160_2)

					arg_157_1.var_.effectmengzhangmohu1 = nil
				end
			end

			local var_160_3 = 0
			local var_160_4 = 0.225

			if var_160_3 < arg_157_1.time_ and arg_157_1.time_ <= var_160_3 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_5 = arg_157_1:GetWordFromCfg(122462037)
				local var_160_6 = arg_157_1:FormatText(var_160_5.content)

				arg_157_1.text_.text = var_160_6

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_7 = 9
				local var_160_8 = utf8.len(var_160_6)
				local var_160_9 = var_160_7 <= 0 and var_160_4 or var_160_4 * (var_160_8 / var_160_7)

				if var_160_9 > 0 and var_160_4 < var_160_9 then
					arg_157_1.talkMaxDuration = var_160_9

					if var_160_9 + var_160_3 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_9 + var_160_3
					end
				end

				arg_157_1.text_.text = var_160_6
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_10 = math.max(var_160_4, arg_157_1.talkMaxDuration)

			if var_160_3 <= arg_157_1.time_ and arg_157_1.time_ < var_160_3 + var_160_10 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_3) / var_160_10

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_3 + var_160_10 and arg_157_1.time_ < var_160_3 + var_160_10 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/J10h",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0102b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/J08h",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack"
	},
	voices = {
		"story_v_out_122462.awb"
	}
}
