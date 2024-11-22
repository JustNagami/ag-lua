return {
	Play104011001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 104011001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play104011002(arg_1_1)
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

			local var_4_4 = 0
			local var_4_5 = 1

			if var_4_4 < arg_1_1.time_ and arg_1_1.time_ <= var_4_4 + arg_4_0 then
				local var_4_6 = "play"
				local var_4_7 = "effect"

				arg_1_1:AudioAction(var_4_6, var_4_7, "se_story_v1_environment_factory", "se_story_v1_environment_factory", "se_story_v1_environment_factory")
			end

			local var_4_8 = "S0103"

			if arg_1_1.bgs_[var_4_8] == nil then
				local var_4_9 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_8)
				var_4_9.name = var_4_8
				var_4_9.transform.parent = arg_1_1.stage_.transform
				var_4_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_8] = var_4_9
			end

			local var_4_10 = arg_1_1.bgs_.S0103
			local var_4_11 = 0

			if var_4_11 < arg_1_1.time_ and arg_1_1.time_ <= var_4_11 + arg_4_0 then
				local var_4_12 = var_4_10:GetComponent("SpriteRenderer")

				if var_4_12 then
					var_4_12.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_13 = var_4_12.material
					local var_4_14 = var_4_13:GetColor("_Color")

					arg_1_1.var_.alphaOldValueS0103 = var_4_14.a
					arg_1_1.var_.alphaMatValueS0103 = var_4_13
				end

				arg_1_1.var_.alphaOldValueS0103 = 0
			end

			local var_4_15 = 1.5

			if var_4_11 <= arg_1_1.time_ and arg_1_1.time_ < var_4_11 + var_4_15 then
				local var_4_16 = (arg_1_1.time_ - var_4_11) / var_4_15
				local var_4_17 = Mathf.Lerp(arg_1_1.var_.alphaOldValueS0103, 1, var_4_16)

				if arg_1_1.var_.alphaMatValueS0103 then
					local var_4_18 = arg_1_1.var_.alphaMatValueS0103
					local var_4_19 = var_4_18:GetColor("_Color")

					var_4_19.a = var_4_17

					var_4_18:SetColor("_Color", var_4_19)
				end
			end

			if arg_1_1.time_ >= var_4_11 + var_4_15 and arg_1_1.time_ < var_4_11 + var_4_15 + arg_4_0 and arg_1_1.var_.alphaMatValueS0103 then
				local var_4_20 = arg_1_1.var_.alphaMatValueS0103
				local var_4_21 = var_4_20:GetColor("_Color")

				var_4_21.a = 1

				var_4_20:SetColor("_Color", var_4_21)
			end

			local var_4_22 = 0

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_23 = manager.ui.mainCamera.transform.localPosition
				local var_4_24 = Vector3.New(0, 0, 10) + Vector3.New(var_4_23.x, var_4_23.y, 0)
				local var_4_25 = arg_1_1.bgs_.S0103

				var_4_25.transform.localPosition = var_4_24
				var_4_25.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_26 = var_4_25:GetComponent("SpriteRenderer")

				if var_4_26 and var_4_26.sprite then
					local var_4_27 = (var_4_25.transform.localPosition - var_4_23).z
					local var_4_28 = manager.ui.mainCameraCom_
					local var_4_29 = 2 * var_4_27 * Mathf.Tan(var_4_28.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_30 = var_4_29 * var_4_28.aspect
					local var_4_31 = var_4_26.sprite.bounds.size.x
					local var_4_32 = var_4_26.sprite.bounds.size.y
					local var_4_33 = var_4_30 / var_4_31
					local var_4_34 = var_4_29 / var_4_32
					local var_4_35 = var_4_34 < var_4_33 and var_4_33 or var_4_34

					var_4_25.transform.localScale = Vector3.New(var_4_35, var_4_35, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "S0103" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_36 = 0

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_37 = 2

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_38 = 2
			local var_4_39 = 0.8

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

				local var_4_41 = arg_1_1:GetWordFromCfg(104011001)
				local var_4_42 = arg_1_1:FormatText(var_4_41.content)

				arg_1_1.text_.text = var_4_42

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_43 = 32
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
	Play104011002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 104011002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play104011003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.4

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[7].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(104011002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 16
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
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_8 = math.max(var_10_1, arg_7_1.talkMaxDuration)

			if var_10_0 <= arg_7_1.time_ and arg_7_1.time_ < var_10_0 + var_10_8 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_0) / var_10_8

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_0 + var_10_8 and arg_7_1.time_ < var_10_0 + var_10_8 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play104011003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 104011003
		arg_11_1.duration_ = 5.666

		local var_11_0 = {
			ja = 3.9,
			ko = 5.566,
			zh = 5.666,
			en = 5.6
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
				arg_11_0:Play104011004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.675

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[5].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1036")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(104011003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011003", "story_v_out_104011.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_104011", "104011003", "story_v_out_104011.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_104011", "104011003", "story_v_out_104011.awb")

						arg_11_1:RecordAudio("104011003", var_14_9)
						arg_11_1:RecordAudio("104011003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_104011", "104011003", "story_v_out_104011.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_104011", "104011003", "story_v_out_104011.awb")
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
	Play104011004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 104011004
		arg_15_1.duration_ = 13.466

		local var_15_0 = {
			ja = 11.066,
			ko = 11.6,
			zh = 10.9,
			en = 13.466
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
				arg_15_0:Play104011005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1.425

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[5].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1036")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(104011004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 57
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

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011004", "story_v_out_104011.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_104011", "104011004", "story_v_out_104011.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_104011", "104011004", "story_v_out_104011.awb")

						arg_15_1:RecordAudio("104011004", var_18_9)
						arg_15_1:RecordAudio("104011004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_104011", "104011004", "story_v_out_104011.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_104011", "104011004", "story_v_out_104011.awb")
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
	Play104011005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 104011005
		arg_19_1.duration_ = 1.433

		local var_19_0 = {
			ja = 1.366,
			ko = 1.033,
			zh = 1.433,
			en = 0.966
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
				arg_19_0:Play104011006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.1

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[13].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(104011005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011005", "story_v_out_104011.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_104011", "104011005", "story_v_out_104011.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_104011", "104011005", "story_v_out_104011.awb")

						arg_19_1:RecordAudio("104011005", var_22_9)
						arg_19_1:RecordAudio("104011005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_104011", "104011005", "story_v_out_104011.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_104011", "104011005", "story_v_out_104011.awb")
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
	Play104011006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 104011006
		arg_23_1.duration_ = 11.166

		local var_23_0 = {
			ja = 11.166,
			ko = 8.766,
			zh = 8.7,
			en = 10.566
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
				arg_23_0:Play104011007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 1.2

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[5].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1036")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(104011006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 48
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

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011006", "story_v_out_104011.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_104011", "104011006", "story_v_out_104011.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_104011", "104011006", "story_v_out_104011.awb")

						arg_23_1:RecordAudio("104011006", var_26_9)
						arg_23_1:RecordAudio("104011006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_104011", "104011006", "story_v_out_104011.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_104011", "104011006", "story_v_out_104011.awb")
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
	Play104011007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 104011007
		arg_27_1.duration_ = 6.966

		local var_27_0 = {
			ja = 6.8,
			ko = 3.9,
			zh = 4.3,
			en = 6.966
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
				arg_27_0:Play104011008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.525

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_2 = arg_27_1:FormatText(StoryNameCfg[5].name)

				arg_27_1.leftNameTxt_.text = var_30_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, true)
				arg_27_1.iconController_:SetSelectedState("hero")

				arg_27_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1036")

				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_3 = arg_27_1:GetWordFromCfg(104011007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011007", "story_v_out_104011.awb") ~= 0 then
					local var_30_8 = manager.audio:GetVoiceLength("story_v_out_104011", "104011007", "story_v_out_104011.awb") / 1000

					if var_30_8 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_8 + var_30_0
					end

					if var_30_3.prefab_name ~= "" and arg_27_1.actors_[var_30_3.prefab_name] ~= nil then
						local var_30_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_3.prefab_name].transform, "story_v_out_104011", "104011007", "story_v_out_104011.awb")

						arg_27_1:RecordAudio("104011007", var_30_9)
						arg_27_1:RecordAudio("104011007", var_30_9)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_104011", "104011007", "story_v_out_104011.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_104011", "104011007", "story_v_out_104011.awb")
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
	Play104011008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 104011008
		arg_31_1.duration_ = 5.6

		local var_31_0 = {
			ja = 5,
			ko = 4,
			zh = 5.6,
			en = 4
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
				arg_31_0:Play104011009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.4

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[6].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(104011008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011008", "story_v_out_104011.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_104011", "104011008", "story_v_out_104011.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_104011", "104011008", "story_v_out_104011.awb")

						arg_31_1:RecordAudio("104011008", var_34_9)
						arg_31_1:RecordAudio("104011008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_104011", "104011008", "story_v_out_104011.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_104011", "104011008", "story_v_out_104011.awb")
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
	Play104011009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 104011009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play104011010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.475

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[7].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(104011009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 19
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
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_8 = math.max(var_38_1, arg_35_1.talkMaxDuration)

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_8 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_0) / var_38_8

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_0 + var_38_8 and arg_35_1.time_ < var_38_0 + var_38_8 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play104011010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 104011010
		arg_39_1.duration_ = 9.6

		local var_39_0 = {
			ja = 9.6,
			ko = 6.833,
			zh = 9.4,
			en = 6.466
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
				arg_39_0:Play104011011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 0.875

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_2 = arg_39_1:FormatText(StoryNameCfg[5].name)

				arg_39_1.leftNameTxt_.text = var_42_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, true)
				arg_39_1.iconController_:SetSelectedState("hero")

				arg_39_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1036")

				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(104011010)
				local var_42_4 = arg_39_1:FormatText(var_42_3.content)

				arg_39_1.text_.text = var_42_4

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011010", "story_v_out_104011.awb") ~= 0 then
					local var_42_8 = manager.audio:GetVoiceLength("story_v_out_104011", "104011010", "story_v_out_104011.awb") / 1000

					if var_42_8 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_8 + var_42_0
					end

					if var_42_3.prefab_name ~= "" and arg_39_1.actors_[var_42_3.prefab_name] ~= nil then
						local var_42_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_3.prefab_name].transform, "story_v_out_104011", "104011010", "story_v_out_104011.awb")

						arg_39_1:RecordAudio("104011010", var_42_9)
						arg_39_1:RecordAudio("104011010", var_42_9)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_104011", "104011010", "story_v_out_104011.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_104011", "104011010", "story_v_out_104011.awb")
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
	Play104011011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 104011011
		arg_43_1.duration_ = 4.466

		local var_43_0 = {
			ja = 4.466,
			ko = 3.133,
			zh = 3.2,
			en = 3.7
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
				arg_43_0:Play104011012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.375

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[13].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, true)
				arg_43_1.iconController_:SetSelectedState("hero")

				arg_43_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(104011011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011011", "story_v_out_104011.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_104011", "104011011", "story_v_out_104011.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_104011", "104011011", "story_v_out_104011.awb")

						arg_43_1:RecordAudio("104011011", var_46_9)
						arg_43_1:RecordAudio("104011011", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_104011", "104011011", "story_v_out_104011.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_104011", "104011011", "story_v_out_104011.awb")
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
	Play104011012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 104011012
		arg_47_1.duration_ = 3.666

		local var_47_0 = {
			ja = 3.666,
			ko = 1.7,
			zh = 1.466,
			en = 2.033
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
				arg_47_0:Play104011013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.2

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_2 = arg_47_1:FormatText(StoryNameCfg[5].name)

				arg_47_1.leftNameTxt_.text = var_50_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, true)
				arg_47_1.iconController_:SetSelectedState("hero")

				arg_47_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1036")

				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_3 = arg_47_1:GetWordFromCfg(104011012)
				local var_50_4 = arg_47_1:FormatText(var_50_3.content)

				arg_47_1.text_.text = var_50_4

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011012", "story_v_out_104011.awb") ~= 0 then
					local var_50_8 = manager.audio:GetVoiceLength("story_v_out_104011", "104011012", "story_v_out_104011.awb") / 1000

					if var_50_8 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_8 + var_50_0
					end

					if var_50_3.prefab_name ~= "" and arg_47_1.actors_[var_50_3.prefab_name] ~= nil then
						local var_50_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_3.prefab_name].transform, "story_v_out_104011", "104011012", "story_v_out_104011.awb")

						arg_47_1:RecordAudio("104011012", var_50_9)
						arg_47_1:RecordAudio("104011012", var_50_9)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_104011", "104011012", "story_v_out_104011.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_104011", "104011012", "story_v_out_104011.awb")
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
	Play104011013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 104011013
		arg_51_1.duration_ = 14.2

		local var_51_0 = {
			ja = 14.2,
			ko = 10.066,
			zh = 10.066,
			en = 12
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
				arg_51_0:Play104011014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 1.4

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[5].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1036")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(104011013)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 56
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

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011013", "story_v_out_104011.awb") ~= 0 then
					local var_54_8 = manager.audio:GetVoiceLength("story_v_out_104011", "104011013", "story_v_out_104011.awb") / 1000

					if var_54_8 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_0
					end

					if var_54_3.prefab_name ~= "" and arg_51_1.actors_[var_54_3.prefab_name] ~= nil then
						local var_54_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_3.prefab_name].transform, "story_v_out_104011", "104011013", "story_v_out_104011.awb")

						arg_51_1:RecordAudio("104011013", var_54_9)
						arg_51_1:RecordAudio("104011013", var_54_9)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_104011", "104011013", "story_v_out_104011.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_104011", "104011013", "story_v_out_104011.awb")
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
	Play104011014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 104011014
		arg_55_1.duration_ = 7

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play104011015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = "1019ui_story"

			if arg_55_1.actors_[var_58_0] == nil then
				local var_58_1 = Object.Instantiate(Asset.Load("Char/" .. var_58_0), arg_55_1.stage_.transform)

				var_58_1.name = var_58_0
				var_58_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_55_1.actors_[var_58_0] = var_58_1

				local var_58_2 = var_58_1:GetComponentInChildren(typeof(CharacterEffect))

				var_58_2.enabled = true

				local var_58_3 = GameObjectTools.GetOrAddComponent(var_58_1, typeof(DynamicBoneHelper))

				if var_58_3 then
					var_58_3:EnableDynamicBone(false)
				end

				arg_55_1:ShowWeapon(var_58_2.transform, false)

				arg_55_1.var_[var_58_0 .. "Animator"] = var_58_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_55_1.var_[var_58_0 .. "Animator"].applyRootMotion = true
				arg_55_1.var_[var_58_0 .. "LipSync"] = var_58_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_58_4 = arg_55_1.actors_["1019ui_story"]
			local var_58_5 = 2

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 and arg_55_1.var_.characterEffect1019ui_story == nil then
				arg_55_1.var_.characterEffect1019ui_story = var_58_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_6 = 0.1

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6

				if arg_55_1.var_.characterEffect1019ui_story then
					arg_55_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 and arg_55_1.var_.characterEffect1019ui_story then
				arg_55_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_58_8 = "1036ui_story"

			if arg_55_1.actors_[var_58_8] == nil then
				local var_58_9 = Object.Instantiate(Asset.Load("Char/" .. var_58_8), arg_55_1.stage_.transform)

				var_58_9.name = var_58_8
				var_58_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_55_1.actors_[var_58_8] = var_58_9

				local var_58_10 = var_58_9:GetComponentInChildren(typeof(CharacterEffect))

				var_58_10.enabled = true

				local var_58_11 = GameObjectTools.GetOrAddComponent(var_58_9, typeof(DynamicBoneHelper))

				if var_58_11 then
					var_58_11:EnableDynamicBone(false)
				end

				arg_55_1:ShowWeapon(var_58_10.transform, false)

				arg_55_1.var_[var_58_8 .. "Animator"] = var_58_10.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_55_1.var_[var_58_8 .. "Animator"].applyRootMotion = true
				arg_55_1.var_[var_58_8 .. "LipSync"] = var_58_10.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_58_12 = arg_55_1.actors_["1036ui_story"]
			local var_58_13 = 2

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 and arg_55_1.var_.characterEffect1036ui_story == nil then
				arg_55_1.var_.characterEffect1036ui_story = var_58_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_14 = 0.1

			if var_58_13 <= arg_55_1.time_ and arg_55_1.time_ < var_58_13 + var_58_14 then
				local var_58_15 = (arg_55_1.time_ - var_58_13) / var_58_14

				if arg_55_1.var_.characterEffect1036ui_story then
					local var_58_16 = Mathf.Lerp(0, 0.5, var_58_15)

					arg_55_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1036ui_story.fillRatio = var_58_16
				end
			end

			if arg_55_1.time_ >= var_58_13 + var_58_14 and arg_55_1.time_ < var_58_13 + var_58_14 + arg_58_0 and arg_55_1.var_.characterEffect1036ui_story then
				local var_58_17 = 0.5

				arg_55_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1036ui_story.fillRatio = var_58_17
			end

			local var_58_18 = arg_55_1.bgs_.S0103
			local var_58_19 = 0

			if var_58_19 < arg_55_1.time_ and arg_55_1.time_ <= var_58_19 + arg_58_0 then
				local var_58_20 = var_58_18:GetComponent("SpriteRenderer")

				if var_58_20 then
					var_58_20.material = arg_55_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_58_21 = var_58_20.material
					local var_58_22 = var_58_21:GetColor("_Color")

					arg_55_1.var_.alphaOldValueS0103 = var_58_22.a
					arg_55_1.var_.alphaMatValueS0103 = var_58_21
				end

				arg_55_1.var_.alphaOldValueS0103 = 1
			end

			local var_58_23 = 1.5

			if var_58_19 <= arg_55_1.time_ and arg_55_1.time_ < var_58_19 + var_58_23 then
				local var_58_24 = (arg_55_1.time_ - var_58_19) / var_58_23
				local var_58_25 = Mathf.Lerp(arg_55_1.var_.alphaOldValueS0103, 0, var_58_24)

				if arg_55_1.var_.alphaMatValueS0103 then
					local var_58_26 = arg_55_1.var_.alphaMatValueS0103
					local var_58_27 = var_58_26:GetColor("_Color")

					var_58_27.a = var_58_25

					var_58_26:SetColor("_Color", var_58_27)
				end
			end

			if arg_55_1.time_ >= var_58_19 + var_58_23 and arg_55_1.time_ < var_58_19 + var_58_23 + arg_58_0 and arg_55_1.var_.alphaMatValueS0103 then
				local var_58_28 = arg_55_1.var_.alphaMatValueS0103
				local var_58_29 = var_58_28:GetColor("_Color")

				var_58_29.a = 0

				var_58_28:SetColor("_Color", var_58_29)
			end

			local var_58_30 = arg_55_1.bgs_.S0103.transform
			local var_58_31 = 1.5

			if var_58_31 < arg_55_1.time_ and arg_55_1.time_ <= var_58_31 + arg_58_0 then
				arg_55_1.var_.moveOldPosS0103 = var_58_30.localPosition
			end

			local var_58_32 = 0.001

			if var_58_31 <= arg_55_1.time_ and arg_55_1.time_ < var_58_31 + var_58_32 then
				local var_58_33 = (arg_55_1.time_ - var_58_31) / var_58_32
				local var_58_34 = Vector3.New(0, -100, 10)

				var_58_30.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPosS0103, var_58_34, var_58_33)
			end

			if arg_55_1.time_ >= var_58_31 + var_58_32 and arg_55_1.time_ < var_58_31 + var_58_32 + arg_58_0 then
				var_58_30.localPosition = Vector3.New(0, -100, 10)
			end

			local var_58_35 = "B03d"

			if arg_55_1.bgs_[var_58_35] == nil then
				local var_58_36 = Object.Instantiate(arg_55_1.paintGo_)

				var_58_36:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_58_35)
				var_58_36.name = var_58_35
				var_58_36.transform.parent = arg_55_1.stage_.transform
				var_58_36.transform.localPosition = Vector3.New(0, 100, 0)
				arg_55_1.bgs_[var_58_35] = var_58_36
			end

			local var_58_37 = arg_55_1.bgs_.B03d
			local var_58_38 = 1.5

			if var_58_38 < arg_55_1.time_ and arg_55_1.time_ <= var_58_38 + arg_58_0 then
				local var_58_39 = var_58_37:GetComponent("SpriteRenderer")

				if var_58_39 then
					var_58_39.material = arg_55_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_58_40 = var_58_39.material
					local var_58_41 = var_58_40:GetColor("_Color")

					arg_55_1.var_.alphaOldValueB03d = var_58_41.a
					arg_55_1.var_.alphaMatValueB03d = var_58_40
				end

				arg_55_1.var_.alphaOldValueB03d = 0
			end

			local var_58_42 = 1.5

			if var_58_38 <= arg_55_1.time_ and arg_55_1.time_ < var_58_38 + var_58_42 then
				local var_58_43 = (arg_55_1.time_ - var_58_38) / var_58_42
				local var_58_44 = Mathf.Lerp(arg_55_1.var_.alphaOldValueB03d, 1, var_58_43)

				if arg_55_1.var_.alphaMatValueB03d then
					local var_58_45 = arg_55_1.var_.alphaMatValueB03d
					local var_58_46 = var_58_45:GetColor("_Color")

					var_58_46.a = var_58_44

					var_58_45:SetColor("_Color", var_58_46)
				end
			end

			if arg_55_1.time_ >= var_58_38 + var_58_42 and arg_55_1.time_ < var_58_38 + var_58_42 + arg_58_0 and arg_55_1.var_.alphaMatValueB03d then
				local var_58_47 = arg_55_1.var_.alphaMatValueB03d
				local var_58_48 = var_58_47:GetColor("_Color")

				var_58_48.a = 1

				var_58_47:SetColor("_Color", var_58_48)
			end

			local var_58_49 = 1.5

			if var_58_49 < arg_55_1.time_ and arg_55_1.time_ <= var_58_49 + arg_58_0 then
				local var_58_50 = manager.ui.mainCamera.transform.localPosition
				local var_58_51 = Vector3.New(0, 0, 10) + Vector3.New(var_58_50.x, var_58_50.y, 0)
				local var_58_52 = arg_55_1.bgs_.B03d

				var_58_52.transform.localPosition = var_58_51
				var_58_52.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_58_53 = var_58_52:GetComponent("SpriteRenderer")

				if var_58_53 and var_58_53.sprite then
					local var_58_54 = (var_58_52.transform.localPosition - var_58_50).z
					local var_58_55 = manager.ui.mainCameraCom_
					local var_58_56 = 2 * var_58_54 * Mathf.Tan(var_58_55.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_58_57 = var_58_56 * var_58_55.aspect
					local var_58_58 = var_58_53.sprite.bounds.size.x
					local var_58_59 = var_58_53.sprite.bounds.size.y
					local var_58_60 = var_58_57 / var_58_58
					local var_58_61 = var_58_56 / var_58_59
					local var_58_62 = var_58_61 < var_58_60 and var_58_60 or var_58_61

					var_58_52.transform.localScale = Vector3.New(var_58_62, var_58_62, 0)
				end

				for iter_58_0, iter_58_1 in pairs(arg_55_1.bgs_) do
					if iter_58_0 ~= "B03d" then
						iter_58_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_58_63 = 0

			if var_58_63 < arg_55_1.time_ and arg_55_1.time_ <= var_58_63 + arg_58_0 then
				arg_55_1.allBtn_.enabled = false
			end

			local var_58_64 = 2

			if arg_55_1.time_ >= var_58_63 + var_58_64 and arg_55_1.time_ < var_58_63 + var_58_64 + arg_58_0 then
				arg_55_1.allBtn_.enabled = true
			end

			if arg_55_1.frameCnt_ <= 1 then
				arg_55_1.dialog_:SetActive(false)
			end

			local var_58_65 = 2
			local var_58_66 = 0.825

			if var_58_65 < arg_55_1.time_ and arg_55_1.time_ <= var_58_65 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0

				arg_55_1.dialog_:SetActive(true)

				local var_58_67 = LeanTween.value(arg_55_1.dialog_, 0, 1, 0.3)

				var_58_67:setOnUpdate(LuaHelper.FloatAction(function(arg_59_0)
					arg_55_1.dialogCg_.alpha = arg_59_0
				end))
				var_58_67:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_55_1.dialog_)
					var_58_67:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_55_1.duration_ = arg_55_1.duration_ + 0.3

				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_68 = arg_55_1:GetWordFromCfg(104011014)
				local var_58_69 = arg_55_1:FormatText(var_58_68.content)

				arg_55_1.text_.text = var_58_69

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_70 = 33
				local var_58_71 = utf8.len(var_58_69)
				local var_58_72 = var_58_70 <= 0 and var_58_66 or var_58_66 * (var_58_71 / var_58_70)

				if var_58_72 > 0 and var_58_66 < var_58_72 then
					arg_55_1.talkMaxDuration = var_58_72
					var_58_65 = var_58_65 + 0.3

					if var_58_72 + var_58_65 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_72 + var_58_65
					end
				end

				arg_55_1.text_.text = var_58_69
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_73 = var_58_65 + 0.3
			local var_58_74 = math.max(var_58_66, arg_55_1.talkMaxDuration)

			if var_58_73 <= arg_55_1.time_ and arg_55_1.time_ < var_58_73 + var_58_74 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_73) / var_58_74

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_73 + var_58_74 and arg_55_1.time_ < var_58_73 + var_58_74 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play104011015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 104011015
		arg_61_1.duration_ = 8.3

		local var_61_0 = {
			ja = 8.3,
			ko = 5.666,
			zh = 7.8,
			en = 6.6
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
				arg_61_0:Play104011016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["1019ui_story"].transform
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 then
				arg_61_1.var_.moveOldPos1019ui_story = var_64_0.localPosition
			end

			local var_64_2 = 0.001

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2
				local var_64_4 = Vector3.New(0, -1.08, -5.9)

				var_64_0.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos1019ui_story, var_64_4, var_64_3)

				local var_64_5 = manager.ui.mainCamera.transform.position - var_64_0.position

				var_64_0.forward = Vector3.New(var_64_5.x, var_64_5.y, var_64_5.z)

				local var_64_6 = var_64_0.localEulerAngles

				var_64_6.z = 0
				var_64_6.x = 0
				var_64_0.localEulerAngles = var_64_6
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 then
				var_64_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_64_7 = manager.ui.mainCamera.transform.position - var_64_0.position

				var_64_0.forward = Vector3.New(var_64_7.x, var_64_7.y, var_64_7.z)

				local var_64_8 = var_64_0.localEulerAngles

				var_64_8.z = 0
				var_64_8.x = 0
				var_64_0.localEulerAngles = var_64_8
			end

			local var_64_9 = 0

			if var_64_9 < arg_61_1.time_ and arg_61_1.time_ <= var_64_9 + arg_64_0 then
				arg_61_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_64_10 = 0

			if var_64_10 < arg_61_1.time_ and arg_61_1.time_ <= var_64_10 + arg_64_0 then
				arg_61_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_64_11 = 0
			local var_64_12 = 1.025

			if var_64_11 < arg_61_1.time_ and arg_61_1.time_ <= var_64_11 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_13 = arg_61_1:FormatText(StoryNameCfg[13].name)

				arg_61_1.leftNameTxt_.text = var_64_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_14 = arg_61_1:GetWordFromCfg(104011015)
				local var_64_15 = arg_61_1:FormatText(var_64_14.content)

				arg_61_1.text_.text = var_64_15

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_16 = 41
				local var_64_17 = utf8.len(var_64_15)
				local var_64_18 = var_64_16 <= 0 and var_64_12 or var_64_12 * (var_64_17 / var_64_16)

				if var_64_18 > 0 and var_64_12 < var_64_18 then
					arg_61_1.talkMaxDuration = var_64_18

					if var_64_18 + var_64_11 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_18 + var_64_11
					end
				end

				arg_61_1.text_.text = var_64_15
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011015", "story_v_out_104011.awb") ~= 0 then
					local var_64_19 = manager.audio:GetVoiceLength("story_v_out_104011", "104011015", "story_v_out_104011.awb") / 1000

					if var_64_19 + var_64_11 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_19 + var_64_11
					end

					if var_64_14.prefab_name ~= "" and arg_61_1.actors_[var_64_14.prefab_name] ~= nil then
						local var_64_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_14.prefab_name].transform, "story_v_out_104011", "104011015", "story_v_out_104011.awb")

						arg_61_1:RecordAudio("104011015", var_64_20)
						arg_61_1:RecordAudio("104011015", var_64_20)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_104011", "104011015", "story_v_out_104011.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_104011", "104011015", "story_v_out_104011.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_21 = math.max(var_64_12, arg_61_1.talkMaxDuration)

			if var_64_11 <= arg_61_1.time_ and arg_61_1.time_ < var_64_11 + var_64_21 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_11) / var_64_21

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_11 + var_64_21 and arg_61_1.time_ < var_64_11 + var_64_21 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play104011016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 104011016
		arg_65_1.duration_ = 1.499999999999

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play104011017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = "1084ui_story"

			if arg_65_1.actors_[var_68_0] == nil then
				local var_68_1 = Object.Instantiate(Asset.Load("Char/" .. var_68_0), arg_65_1.stage_.transform)

				var_68_1.name = var_68_0
				var_68_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_65_1.actors_[var_68_0] = var_68_1

				local var_68_2 = var_68_1:GetComponentInChildren(typeof(CharacterEffect))

				var_68_2.enabled = true

				local var_68_3 = GameObjectTools.GetOrAddComponent(var_68_1, typeof(DynamicBoneHelper))

				if var_68_3 then
					var_68_3:EnableDynamicBone(false)
				end

				arg_65_1:ShowWeapon(var_68_2.transform, false)

				arg_65_1.var_[var_68_0 .. "Animator"] = var_68_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_65_1.var_[var_68_0 .. "Animator"].applyRootMotion = true
				arg_65_1.var_[var_68_0 .. "LipSync"] = var_68_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_68_4 = arg_65_1.actors_["1084ui_story"]
			local var_68_5 = 0

			if var_68_5 < arg_65_1.time_ and arg_65_1.time_ <= var_68_5 + arg_68_0 and arg_65_1.var_.characterEffect1084ui_story == nil then
				arg_65_1.var_.characterEffect1084ui_story = var_68_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_6 = 0.1

			if var_68_5 <= arg_65_1.time_ and arg_65_1.time_ < var_68_5 + var_68_6 then
				local var_68_7 = (arg_65_1.time_ - var_68_5) / var_68_6

				if arg_65_1.var_.characterEffect1084ui_story then
					arg_65_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_65_1.time_ >= var_68_5 + var_68_6 and arg_65_1.time_ < var_68_5 + var_68_6 + arg_68_0 and arg_65_1.var_.characterEffect1084ui_story then
				arg_65_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_68_8 = arg_65_1.actors_["1019ui_story"]
			local var_68_9 = 0

			if var_68_9 < arg_65_1.time_ and arg_65_1.time_ <= var_68_9 + arg_68_0 and arg_65_1.var_.characterEffect1019ui_story == nil then
				arg_65_1.var_.characterEffect1019ui_story = var_68_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_10 = 0.1

			if var_68_9 <= arg_65_1.time_ and arg_65_1.time_ < var_68_9 + var_68_10 then
				local var_68_11 = (arg_65_1.time_ - var_68_9) / var_68_10

				if arg_65_1.var_.characterEffect1019ui_story then
					local var_68_12 = Mathf.Lerp(0, 0.5, var_68_11)

					arg_65_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_65_1.var_.characterEffect1019ui_story.fillRatio = var_68_12
				end
			end

			if arg_65_1.time_ >= var_68_9 + var_68_10 and arg_65_1.time_ < var_68_9 + var_68_10 + arg_68_0 and arg_65_1.var_.characterEffect1019ui_story then
				local var_68_13 = 0.5

				arg_65_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_65_1.var_.characterEffect1019ui_story.fillRatio = var_68_13
			end

			local var_68_14 = arg_65_1.actors_["1019ui_story"].transform
			local var_68_15 = 0

			if var_68_15 < arg_65_1.time_ and arg_65_1.time_ <= var_68_15 + arg_68_0 then
				arg_65_1.var_.moveOldPos1019ui_story = var_68_14.localPosition
			end

			local var_68_16 = 0.001

			if var_68_15 <= arg_65_1.time_ and arg_65_1.time_ < var_68_15 + var_68_16 then
				local var_68_17 = (arg_65_1.time_ - var_68_15) / var_68_16
				local var_68_18 = Vector3.New(0, 100, 0)

				var_68_14.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos1019ui_story, var_68_18, var_68_17)

				local var_68_19 = manager.ui.mainCamera.transform.position - var_68_14.position

				var_68_14.forward = Vector3.New(var_68_19.x, var_68_19.y, var_68_19.z)

				local var_68_20 = var_68_14.localEulerAngles

				var_68_20.z = 0
				var_68_20.x = 0
				var_68_14.localEulerAngles = var_68_20
			end

			if arg_65_1.time_ >= var_68_15 + var_68_16 and arg_65_1.time_ < var_68_15 + var_68_16 + arg_68_0 then
				var_68_14.localPosition = Vector3.New(0, 100, 0)

				local var_68_21 = manager.ui.mainCamera.transform.position - var_68_14.position

				var_68_14.forward = Vector3.New(var_68_21.x, var_68_21.y, var_68_21.z)

				local var_68_22 = var_68_14.localEulerAngles

				var_68_22.z = 0
				var_68_22.x = 0
				var_68_14.localEulerAngles = var_68_22
			end

			local var_68_23 = arg_65_1.actors_["1084ui_story"].transform
			local var_68_24 = 0

			if var_68_24 < arg_65_1.time_ and arg_65_1.time_ <= var_68_24 + arg_68_0 then
				arg_65_1.var_.moveOldPos1084ui_story = var_68_23.localPosition
			end

			local var_68_25 = 0.001

			if var_68_24 <= arg_65_1.time_ and arg_65_1.time_ < var_68_24 + var_68_25 then
				local var_68_26 = (arg_65_1.time_ - var_68_24) / var_68_25
				local var_68_27 = Vector3.New(-0.7, -0.97, -6)

				var_68_23.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos1084ui_story, var_68_27, var_68_26)

				local var_68_28 = manager.ui.mainCamera.transform.position - var_68_23.position

				var_68_23.forward = Vector3.New(var_68_28.x, var_68_28.y, var_68_28.z)

				local var_68_29 = var_68_23.localEulerAngles

				var_68_29.z = 0
				var_68_29.x = 0
				var_68_23.localEulerAngles = var_68_29
			end

			if arg_65_1.time_ >= var_68_24 + var_68_25 and arg_65_1.time_ < var_68_24 + var_68_25 + arg_68_0 then
				var_68_23.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_68_30 = manager.ui.mainCamera.transform.position - var_68_23.position

				var_68_23.forward = Vector3.New(var_68_30.x, var_68_30.y, var_68_30.z)

				local var_68_31 = var_68_23.localEulerAngles

				var_68_31.z = 0
				var_68_31.x = 0
				var_68_23.localEulerAngles = var_68_31
			end

			local var_68_32 = 0

			if var_68_32 < arg_65_1.time_ and arg_65_1.time_ <= var_68_32 + arg_68_0 then
				arg_65_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_68_33 = 0

			if var_68_33 < arg_65_1.time_ and arg_65_1.time_ <= var_68_33 + arg_68_0 then
				arg_65_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_68_34 = 0
			local var_68_35 = 0.05

			if var_68_34 < arg_65_1.time_ and arg_65_1.time_ <= var_68_34 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_36 = arg_65_1:FormatText(StoryNameCfg[6].name)

				arg_65_1.leftNameTxt_.text = var_68_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_37 = arg_65_1:GetWordFromCfg(104011016)
				local var_68_38 = arg_65_1:FormatText(var_68_37.content)

				arg_65_1.text_.text = var_68_38

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_39 = 2
				local var_68_40 = utf8.len(var_68_38)
				local var_68_41 = var_68_39 <= 0 and var_68_35 or var_68_35 * (var_68_40 / var_68_39)

				if var_68_41 > 0 and var_68_35 < var_68_41 then
					arg_65_1.talkMaxDuration = var_68_41

					if var_68_41 + var_68_34 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_41 + var_68_34
					end
				end

				arg_65_1.text_.text = var_68_38
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011016", "story_v_out_104011.awb") ~= 0 then
					local var_68_42 = manager.audio:GetVoiceLength("story_v_out_104011", "104011016", "story_v_out_104011.awb") / 1000

					if var_68_42 + var_68_34 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_42 + var_68_34
					end

					if var_68_37.prefab_name ~= "" and arg_65_1.actors_[var_68_37.prefab_name] ~= nil then
						local var_68_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_37.prefab_name].transform, "story_v_out_104011", "104011016", "story_v_out_104011.awb")

						arg_65_1:RecordAudio("104011016", var_68_43)
						arg_65_1:RecordAudio("104011016", var_68_43)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_104011", "104011016", "story_v_out_104011.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_104011", "104011016", "story_v_out_104011.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_44 = math.max(var_68_35, arg_65_1.talkMaxDuration)

			if var_68_34 <= arg_65_1.time_ and arg_65_1.time_ < var_68_34 + var_68_44 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_34) / var_68_44

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_34 + var_68_44 and arg_65_1.time_ < var_68_34 + var_68_44 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play104011017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 104011017
		arg_69_1.duration_ = 2.133

		local var_69_0 = {
			ja = 1.7,
			ko = 1.499999999999,
			zh = 2.133,
			en = 1.6
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
				arg_69_0:Play104011018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = "1011ui_story"

			if arg_69_1.actors_[var_72_0] == nil then
				local var_72_1 = Object.Instantiate(Asset.Load("Char/" .. var_72_0), arg_69_1.stage_.transform)

				var_72_1.name = var_72_0
				var_72_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_69_1.actors_[var_72_0] = var_72_1

				local var_72_2 = var_72_1:GetComponentInChildren(typeof(CharacterEffect))

				var_72_2.enabled = true

				local var_72_3 = GameObjectTools.GetOrAddComponent(var_72_1, typeof(DynamicBoneHelper))

				if var_72_3 then
					var_72_3:EnableDynamicBone(false)
				end

				arg_69_1:ShowWeapon(var_72_2.transform, false)

				arg_69_1.var_[var_72_0 .. "Animator"] = var_72_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_69_1.var_[var_72_0 .. "Animator"].applyRootMotion = true
				arg_69_1.var_[var_72_0 .. "LipSync"] = var_72_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_72_4 = arg_69_1.actors_["1011ui_story"]
			local var_72_5 = 0

			if var_72_5 < arg_69_1.time_ and arg_69_1.time_ <= var_72_5 + arg_72_0 and arg_69_1.var_.characterEffect1011ui_story == nil then
				arg_69_1.var_.characterEffect1011ui_story = var_72_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_6 = 0.1

			if var_72_5 <= arg_69_1.time_ and arg_69_1.time_ < var_72_5 + var_72_6 then
				local var_72_7 = (arg_69_1.time_ - var_72_5) / var_72_6

				if arg_69_1.var_.characterEffect1011ui_story then
					arg_69_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_5 + var_72_6 and arg_69_1.time_ < var_72_5 + var_72_6 + arg_72_0 and arg_69_1.var_.characterEffect1011ui_story then
				arg_69_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_72_8 = arg_69_1.actors_["1084ui_story"]
			local var_72_9 = 0

			if var_72_9 < arg_69_1.time_ and arg_69_1.time_ <= var_72_9 + arg_72_0 and arg_69_1.var_.characterEffect1084ui_story == nil then
				arg_69_1.var_.characterEffect1084ui_story = var_72_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_10 = 0.1

			if var_72_9 <= arg_69_1.time_ and arg_69_1.time_ < var_72_9 + var_72_10 then
				local var_72_11 = (arg_69_1.time_ - var_72_9) / var_72_10

				if arg_69_1.var_.characterEffect1084ui_story then
					local var_72_12 = Mathf.Lerp(0, 0.5, var_72_11)

					arg_69_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_69_1.var_.characterEffect1084ui_story.fillRatio = var_72_12
				end
			end

			if arg_69_1.time_ >= var_72_9 + var_72_10 and arg_69_1.time_ < var_72_9 + var_72_10 + arg_72_0 and arg_69_1.var_.characterEffect1084ui_story then
				local var_72_13 = 0.5

				arg_69_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_69_1.var_.characterEffect1084ui_story.fillRatio = var_72_13
			end

			local var_72_14 = arg_69_1.actors_["1011ui_story"].transform
			local var_72_15 = 0

			if var_72_15 < arg_69_1.time_ and arg_69_1.time_ <= var_72_15 + arg_72_0 then
				arg_69_1.var_.moveOldPos1011ui_story = var_72_14.localPosition
			end

			local var_72_16 = 0.001

			if var_72_15 <= arg_69_1.time_ and arg_69_1.time_ < var_72_15 + var_72_16 then
				local var_72_17 = (arg_69_1.time_ - var_72_15) / var_72_16
				local var_72_18 = Vector3.New(0.7, -0.71, -6)

				var_72_14.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1011ui_story, var_72_18, var_72_17)

				local var_72_19 = manager.ui.mainCamera.transform.position - var_72_14.position

				var_72_14.forward = Vector3.New(var_72_19.x, var_72_19.y, var_72_19.z)

				local var_72_20 = var_72_14.localEulerAngles

				var_72_20.z = 0
				var_72_20.x = 0
				var_72_14.localEulerAngles = var_72_20
			end

			if arg_69_1.time_ >= var_72_15 + var_72_16 and arg_69_1.time_ < var_72_15 + var_72_16 + arg_72_0 then
				var_72_14.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_72_21 = manager.ui.mainCamera.transform.position - var_72_14.position

				var_72_14.forward = Vector3.New(var_72_21.x, var_72_21.y, var_72_21.z)

				local var_72_22 = var_72_14.localEulerAngles

				var_72_22.z = 0
				var_72_22.x = 0
				var_72_14.localEulerAngles = var_72_22
			end

			local var_72_23 = 0

			if var_72_23 < arg_69_1.time_ and arg_69_1.time_ <= var_72_23 + arg_72_0 then
				arg_69_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_72_24 = 0

			if var_72_24 < arg_69_1.time_ and arg_69_1.time_ <= var_72_24 + arg_72_0 then
				arg_69_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_72_25 = 0

			if var_72_25 < arg_69_1.time_ and arg_69_1.time_ <= var_72_25 + arg_72_0 then
				arg_69_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_72_26 = 0
			local var_72_27 = 0.125

			if var_72_26 < arg_69_1.time_ and arg_69_1.time_ <= var_72_26 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_28 = arg_69_1:FormatText(StoryNameCfg[37].name)

				arg_69_1.leftNameTxt_.text = var_72_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_29 = arg_69_1:GetWordFromCfg(104011017)
				local var_72_30 = arg_69_1:FormatText(var_72_29.content)

				arg_69_1.text_.text = var_72_30

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_31 = 5
				local var_72_32 = utf8.len(var_72_30)
				local var_72_33 = var_72_31 <= 0 and var_72_27 or var_72_27 * (var_72_32 / var_72_31)

				if var_72_33 > 0 and var_72_27 < var_72_33 then
					arg_69_1.talkMaxDuration = var_72_33

					if var_72_33 + var_72_26 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_33 + var_72_26
					end
				end

				arg_69_1.text_.text = var_72_30
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011017", "story_v_out_104011.awb") ~= 0 then
					local var_72_34 = manager.audio:GetVoiceLength("story_v_out_104011", "104011017", "story_v_out_104011.awb") / 1000

					if var_72_34 + var_72_26 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_34 + var_72_26
					end

					if var_72_29.prefab_name ~= "" and arg_69_1.actors_[var_72_29.prefab_name] ~= nil then
						local var_72_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_29.prefab_name].transform, "story_v_out_104011", "104011017", "story_v_out_104011.awb")

						arg_69_1:RecordAudio("104011017", var_72_35)
						arg_69_1:RecordAudio("104011017", var_72_35)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_104011", "104011017", "story_v_out_104011.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_104011", "104011017", "story_v_out_104011.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_36 = math.max(var_72_27, arg_69_1.talkMaxDuration)

			if var_72_26 <= arg_69_1.time_ and arg_69_1.time_ < var_72_26 + var_72_36 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_26) / var_72_36

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_26 + var_72_36 and arg_69_1.time_ < var_72_26 + var_72_36 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play104011018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 104011018
		arg_73_1.duration_ = 10.6

		local var_73_0 = {
			ja = 10.4,
			ko = 10.5,
			zh = 8.566,
			en = 10.6
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
				arg_73_0:Play104011019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1036ui_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect1036ui_story == nil then
				arg_73_1.var_.characterEffect1036ui_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.1

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect1036ui_story then
					arg_73_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect1036ui_story then
				arg_73_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_76_4 = arg_73_1.actors_["1011ui_story"]
			local var_76_5 = 0

			if var_76_5 < arg_73_1.time_ and arg_73_1.time_ <= var_76_5 + arg_76_0 and arg_73_1.var_.characterEffect1011ui_story == nil then
				arg_73_1.var_.characterEffect1011ui_story = var_76_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_6 = 0.1

			if var_76_5 <= arg_73_1.time_ and arg_73_1.time_ < var_76_5 + var_76_6 then
				local var_76_7 = (arg_73_1.time_ - var_76_5) / var_76_6

				if arg_73_1.var_.characterEffect1011ui_story then
					local var_76_8 = Mathf.Lerp(0, 0.5, var_76_7)

					arg_73_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_73_1.var_.characterEffect1011ui_story.fillRatio = var_76_8
				end
			end

			if arg_73_1.time_ >= var_76_5 + var_76_6 and arg_73_1.time_ < var_76_5 + var_76_6 + arg_76_0 and arg_73_1.var_.characterEffect1011ui_story then
				local var_76_9 = 0.5

				arg_73_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_73_1.var_.characterEffect1011ui_story.fillRatio = var_76_9
			end

			local var_76_10 = arg_73_1.actors_["1011ui_story"].transform
			local var_76_11 = 0

			if var_76_11 < arg_73_1.time_ and arg_73_1.time_ <= var_76_11 + arg_76_0 then
				arg_73_1.var_.moveOldPos1011ui_story = var_76_10.localPosition
			end

			local var_76_12 = 0.001

			if var_76_11 <= arg_73_1.time_ and arg_73_1.time_ < var_76_11 + var_76_12 then
				local var_76_13 = (arg_73_1.time_ - var_76_11) / var_76_12
				local var_76_14 = Vector3.New(0, 100, 0)

				var_76_10.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1011ui_story, var_76_14, var_76_13)

				local var_76_15 = manager.ui.mainCamera.transform.position - var_76_10.position

				var_76_10.forward = Vector3.New(var_76_15.x, var_76_15.y, var_76_15.z)

				local var_76_16 = var_76_10.localEulerAngles

				var_76_16.z = 0
				var_76_16.x = 0
				var_76_10.localEulerAngles = var_76_16
			end

			if arg_73_1.time_ >= var_76_11 + var_76_12 and arg_73_1.time_ < var_76_11 + var_76_12 + arg_76_0 then
				var_76_10.localPosition = Vector3.New(0, 100, 0)

				local var_76_17 = manager.ui.mainCamera.transform.position - var_76_10.position

				var_76_10.forward = Vector3.New(var_76_17.x, var_76_17.y, var_76_17.z)

				local var_76_18 = var_76_10.localEulerAngles

				var_76_18.z = 0
				var_76_18.x = 0
				var_76_10.localEulerAngles = var_76_18
			end

			local var_76_19 = arg_73_1.actors_["1084ui_story"].transform
			local var_76_20 = 0

			if var_76_20 < arg_73_1.time_ and arg_73_1.time_ <= var_76_20 + arg_76_0 then
				arg_73_1.var_.moveOldPos1084ui_story = var_76_19.localPosition
			end

			local var_76_21 = 0.001

			if var_76_20 <= arg_73_1.time_ and arg_73_1.time_ < var_76_20 + var_76_21 then
				local var_76_22 = (arg_73_1.time_ - var_76_20) / var_76_21
				local var_76_23 = Vector3.New(0, 100, 0)

				var_76_19.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1084ui_story, var_76_23, var_76_22)

				local var_76_24 = manager.ui.mainCamera.transform.position - var_76_19.position

				var_76_19.forward = Vector3.New(var_76_24.x, var_76_24.y, var_76_24.z)

				local var_76_25 = var_76_19.localEulerAngles

				var_76_25.z = 0
				var_76_25.x = 0
				var_76_19.localEulerAngles = var_76_25
			end

			if arg_73_1.time_ >= var_76_20 + var_76_21 and arg_73_1.time_ < var_76_20 + var_76_21 + arg_76_0 then
				var_76_19.localPosition = Vector3.New(0, 100, 0)

				local var_76_26 = manager.ui.mainCamera.transform.position - var_76_19.position

				var_76_19.forward = Vector3.New(var_76_26.x, var_76_26.y, var_76_26.z)

				local var_76_27 = var_76_19.localEulerAngles

				var_76_27.z = 0
				var_76_27.x = 0
				var_76_19.localEulerAngles = var_76_27
			end

			local var_76_28 = arg_73_1.actors_["1036ui_story"].transform
			local var_76_29 = 0

			if var_76_29 < arg_73_1.time_ and arg_73_1.time_ <= var_76_29 + arg_76_0 then
				arg_73_1.var_.moveOldPos1036ui_story = var_76_28.localPosition
			end

			local var_76_30 = 0.001

			if var_76_29 <= arg_73_1.time_ and arg_73_1.time_ < var_76_29 + var_76_30 then
				local var_76_31 = (arg_73_1.time_ - var_76_29) / var_76_30
				local var_76_32 = Vector3.New(0, -1.09, -5.78)

				var_76_28.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1036ui_story, var_76_32, var_76_31)

				local var_76_33 = manager.ui.mainCamera.transform.position - var_76_28.position

				var_76_28.forward = Vector3.New(var_76_33.x, var_76_33.y, var_76_33.z)

				local var_76_34 = var_76_28.localEulerAngles

				var_76_34.z = 0
				var_76_34.x = 0
				var_76_28.localEulerAngles = var_76_34
			end

			if arg_73_1.time_ >= var_76_29 + var_76_30 and arg_73_1.time_ < var_76_29 + var_76_30 + arg_76_0 then
				var_76_28.localPosition = Vector3.New(0, -1.09, -5.78)

				local var_76_35 = manager.ui.mainCamera.transform.position - var_76_28.position

				var_76_28.forward = Vector3.New(var_76_35.x, var_76_35.y, var_76_35.z)

				local var_76_36 = var_76_28.localEulerAngles

				var_76_36.z = 0
				var_76_36.x = 0
				var_76_28.localEulerAngles = var_76_36
			end

			local var_76_37 = 0

			if var_76_37 < arg_73_1.time_ and arg_73_1.time_ <= var_76_37 + arg_76_0 then
				arg_73_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action5_1")
			end

			local var_76_38 = 0

			if var_76_38 < arg_73_1.time_ and arg_73_1.time_ <= var_76_38 + arg_76_0 then
				arg_73_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_76_39 = 0
			local var_76_40 = 1.25

			if var_76_39 < arg_73_1.time_ and arg_73_1.time_ <= var_76_39 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_41 = arg_73_1:FormatText(StoryNameCfg[5].name)

				arg_73_1.leftNameTxt_.text = var_76_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_42 = arg_73_1:GetWordFromCfg(104011018)
				local var_76_43 = arg_73_1:FormatText(var_76_42.content)

				arg_73_1.text_.text = var_76_43

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_44 = 50
				local var_76_45 = utf8.len(var_76_43)
				local var_76_46 = var_76_44 <= 0 and var_76_40 or var_76_40 * (var_76_45 / var_76_44)

				if var_76_46 > 0 and var_76_40 < var_76_46 then
					arg_73_1.talkMaxDuration = var_76_46

					if var_76_46 + var_76_39 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_46 + var_76_39
					end
				end

				arg_73_1.text_.text = var_76_43
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011018", "story_v_out_104011.awb") ~= 0 then
					local var_76_47 = manager.audio:GetVoiceLength("story_v_out_104011", "104011018", "story_v_out_104011.awb") / 1000

					if var_76_47 + var_76_39 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_47 + var_76_39
					end

					if var_76_42.prefab_name ~= "" and arg_73_1.actors_[var_76_42.prefab_name] ~= nil then
						local var_76_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_42.prefab_name].transform, "story_v_out_104011", "104011018", "story_v_out_104011.awb")

						arg_73_1:RecordAudio("104011018", var_76_48)
						arg_73_1:RecordAudio("104011018", var_76_48)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_104011", "104011018", "story_v_out_104011.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_104011", "104011018", "story_v_out_104011.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_49 = math.max(var_76_40, arg_73_1.talkMaxDuration)

			if var_76_39 <= arg_73_1.time_ and arg_73_1.time_ < var_76_39 + var_76_49 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_39) / var_76_49

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_39 + var_76_49 and arg_73_1.time_ < var_76_39 + var_76_49 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play104011019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 104011019
		arg_77_1.duration_ = 8.1

		local var_77_0 = {
			ja = 8.1,
			ko = 4.733,
			zh = 4.533,
			en = 5.7
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
				arg_77_0:Play104011020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036actionlink/1036action454")
			end

			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_80_2 = 0

			if var_80_2 < arg_77_1.time_ and arg_77_1.time_ <= var_80_2 + arg_80_0 then
				arg_77_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_80_3 = 0
			local var_80_4 = 0.6

			if var_80_3 < arg_77_1.time_ and arg_77_1.time_ <= var_80_3 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_5 = arg_77_1:FormatText(StoryNameCfg[5].name)

				arg_77_1.leftNameTxt_.text = var_80_5

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_6 = arg_77_1:GetWordFromCfg(104011019)
				local var_80_7 = arg_77_1:FormatText(var_80_6.content)

				arg_77_1.text_.text = var_80_7

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_8 = 24
				local var_80_9 = utf8.len(var_80_7)
				local var_80_10 = var_80_8 <= 0 and var_80_4 or var_80_4 * (var_80_9 / var_80_8)

				if var_80_10 > 0 and var_80_4 < var_80_10 then
					arg_77_1.talkMaxDuration = var_80_10

					if var_80_10 + var_80_3 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_10 + var_80_3
					end
				end

				arg_77_1.text_.text = var_80_7
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011019", "story_v_out_104011.awb") ~= 0 then
					local var_80_11 = manager.audio:GetVoiceLength("story_v_out_104011", "104011019", "story_v_out_104011.awb") / 1000

					if var_80_11 + var_80_3 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_11 + var_80_3
					end

					if var_80_6.prefab_name ~= "" and arg_77_1.actors_[var_80_6.prefab_name] ~= nil then
						local var_80_12 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_6.prefab_name].transform, "story_v_out_104011", "104011019", "story_v_out_104011.awb")

						arg_77_1:RecordAudio("104011019", var_80_12)
						arg_77_1:RecordAudio("104011019", var_80_12)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_104011", "104011019", "story_v_out_104011.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_104011", "104011019", "story_v_out_104011.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_13 = math.max(var_80_4, arg_77_1.talkMaxDuration)

			if var_80_3 <= arg_77_1.time_ and arg_77_1.time_ < var_80_3 + var_80_13 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_3) / var_80_13

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_3 + var_80_13 and arg_77_1.time_ < var_80_3 + var_80_13 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play104011020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 104011020
		arg_81_1.duration_ = 1.666

		local var_81_0 = {
			ja = 1.666,
			ko = 1.433,
			zh = 1.266,
			en = 1.4
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
				arg_81_0:Play104011021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["1019ui_story"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.characterEffect1019ui_story == nil then
				arg_81_1.var_.characterEffect1019ui_story = var_84_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_2 = 0.1

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.characterEffect1019ui_story then
					arg_81_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.characterEffect1019ui_story then
				arg_81_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_84_4 = arg_81_1.actors_["1036ui_story"]
			local var_84_5 = 0

			if var_84_5 < arg_81_1.time_ and arg_81_1.time_ <= var_84_5 + arg_84_0 and arg_81_1.var_.characterEffect1036ui_story == nil then
				arg_81_1.var_.characterEffect1036ui_story = var_84_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_6 = 0.1

			if var_84_5 <= arg_81_1.time_ and arg_81_1.time_ < var_84_5 + var_84_6 then
				local var_84_7 = (arg_81_1.time_ - var_84_5) / var_84_6

				if arg_81_1.var_.characterEffect1036ui_story then
					local var_84_8 = Mathf.Lerp(0, 0.5, var_84_7)

					arg_81_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_81_1.var_.characterEffect1036ui_story.fillRatio = var_84_8
				end
			end

			if arg_81_1.time_ >= var_84_5 + var_84_6 and arg_81_1.time_ < var_84_5 + var_84_6 + arg_84_0 and arg_81_1.var_.characterEffect1036ui_story then
				local var_84_9 = 0.5

				arg_81_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_81_1.var_.characterEffect1036ui_story.fillRatio = var_84_9
			end

			local var_84_10 = 0

			if var_84_10 < arg_81_1.time_ and arg_81_1.time_ <= var_84_10 + arg_84_0 then
				arg_81_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_84_11 = 0
			local var_84_12 = 0.05

			if var_84_11 < arg_81_1.time_ and arg_81_1.time_ <= var_84_11 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_13 = arg_81_1:FormatText(StoryNameCfg[13].name)

				arg_81_1.leftNameTxt_.text = var_84_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, true)
				arg_81_1.iconController_:SetSelectedState("hero")

				arg_81_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_14 = arg_81_1:GetWordFromCfg(104011020)
				local var_84_15 = arg_81_1:FormatText(var_84_14.content)

				arg_81_1.text_.text = var_84_15

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_16 = 2
				local var_84_17 = utf8.len(var_84_15)
				local var_84_18 = var_84_16 <= 0 and var_84_12 or var_84_12 * (var_84_17 / var_84_16)

				if var_84_18 > 0 and var_84_12 < var_84_18 then
					arg_81_1.talkMaxDuration = var_84_18

					if var_84_18 + var_84_11 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_18 + var_84_11
					end
				end

				arg_81_1.text_.text = var_84_15
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011020", "story_v_out_104011.awb") ~= 0 then
					local var_84_19 = manager.audio:GetVoiceLength("story_v_out_104011", "104011020", "story_v_out_104011.awb") / 1000

					if var_84_19 + var_84_11 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_19 + var_84_11
					end

					if var_84_14.prefab_name ~= "" and arg_81_1.actors_[var_84_14.prefab_name] ~= nil then
						local var_84_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_14.prefab_name].transform, "story_v_out_104011", "104011020", "story_v_out_104011.awb")

						arg_81_1:RecordAudio("104011020", var_84_20)
						arg_81_1:RecordAudio("104011020", var_84_20)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_104011", "104011020", "story_v_out_104011.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_104011", "104011020", "story_v_out_104011.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_21 = math.max(var_84_12, arg_81_1.talkMaxDuration)

			if var_84_11 <= arg_81_1.time_ and arg_81_1.time_ < var_84_11 + var_84_21 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_11) / var_84_21

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_11 + var_84_21 and arg_81_1.time_ < var_84_11 + var_84_21 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play104011021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 104011021
		arg_85_1.duration_ = 8.733

		local var_85_0 = {
			ja = 8.733,
			ko = 4.433,
			zh = 4.833,
			en = 8.2
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
				arg_85_0:Play104011022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1084ui_story"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.characterEffect1084ui_story == nil then
				arg_85_1.var_.characterEffect1084ui_story = var_88_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_2 = 0.1

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.characterEffect1084ui_story then
					arg_85_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.characterEffect1084ui_story then
				arg_85_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_88_4 = arg_85_1.actors_["1019ui_story"]
			local var_88_5 = 0

			if var_88_5 < arg_85_1.time_ and arg_85_1.time_ <= var_88_5 + arg_88_0 and arg_85_1.var_.characterEffect1019ui_story == nil then
				arg_85_1.var_.characterEffect1019ui_story = var_88_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_6 = 0.1

			if var_88_5 <= arg_85_1.time_ and arg_85_1.time_ < var_88_5 + var_88_6 then
				local var_88_7 = (arg_85_1.time_ - var_88_5) / var_88_6

				if arg_85_1.var_.characterEffect1019ui_story then
					local var_88_8 = Mathf.Lerp(0, 0.5, var_88_7)

					arg_85_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_85_1.var_.characterEffect1019ui_story.fillRatio = var_88_8
				end
			end

			if arg_85_1.time_ >= var_88_5 + var_88_6 and arg_85_1.time_ < var_88_5 + var_88_6 + arg_88_0 and arg_85_1.var_.characterEffect1019ui_story then
				local var_88_9 = 0.5

				arg_85_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_85_1.var_.characterEffect1019ui_story.fillRatio = var_88_9
			end

			local var_88_10 = arg_85_1.actors_["1036ui_story"].transform
			local var_88_11 = 0

			if var_88_11 < arg_85_1.time_ and arg_85_1.time_ <= var_88_11 + arg_88_0 then
				arg_85_1.var_.moveOldPos1036ui_story = var_88_10.localPosition
			end

			local var_88_12 = 0.001

			if var_88_11 <= arg_85_1.time_ and arg_85_1.time_ < var_88_11 + var_88_12 then
				local var_88_13 = (arg_85_1.time_ - var_88_11) / var_88_12
				local var_88_14 = Vector3.New(0, 100, 0)

				var_88_10.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos1036ui_story, var_88_14, var_88_13)

				local var_88_15 = manager.ui.mainCamera.transform.position - var_88_10.position

				var_88_10.forward = Vector3.New(var_88_15.x, var_88_15.y, var_88_15.z)

				local var_88_16 = var_88_10.localEulerAngles

				var_88_16.z = 0
				var_88_16.x = 0
				var_88_10.localEulerAngles = var_88_16
			end

			if arg_85_1.time_ >= var_88_11 + var_88_12 and arg_85_1.time_ < var_88_11 + var_88_12 + arg_88_0 then
				var_88_10.localPosition = Vector3.New(0, 100, 0)

				local var_88_17 = manager.ui.mainCamera.transform.position - var_88_10.position

				var_88_10.forward = Vector3.New(var_88_17.x, var_88_17.y, var_88_17.z)

				local var_88_18 = var_88_10.localEulerAngles

				var_88_18.z = 0
				var_88_18.x = 0
				var_88_10.localEulerAngles = var_88_18
			end

			local var_88_19 = arg_85_1.actors_["1036ui_story"].transform
			local var_88_20 = 0

			if var_88_20 < arg_85_1.time_ and arg_85_1.time_ <= var_88_20 + arg_88_0 then
				arg_85_1.var_.moveOldPos1036ui_story = var_88_19.localPosition
			end

			local var_88_21 = 0.001

			if var_88_20 <= arg_85_1.time_ and arg_85_1.time_ < var_88_20 + var_88_21 then
				local var_88_22 = (arg_85_1.time_ - var_88_20) / var_88_21
				local var_88_23 = Vector3.New(0, 100, 0)

				var_88_19.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos1036ui_story, var_88_23, var_88_22)

				local var_88_24 = manager.ui.mainCamera.transform.position - var_88_19.position

				var_88_19.forward = Vector3.New(var_88_24.x, var_88_24.y, var_88_24.z)

				local var_88_25 = var_88_19.localEulerAngles

				var_88_25.z = 0
				var_88_25.x = 0
				var_88_19.localEulerAngles = var_88_25
			end

			if arg_85_1.time_ >= var_88_20 + var_88_21 and arg_85_1.time_ < var_88_20 + var_88_21 + arg_88_0 then
				var_88_19.localPosition = Vector3.New(0, 100, 0)

				local var_88_26 = manager.ui.mainCamera.transform.position - var_88_19.position

				var_88_19.forward = Vector3.New(var_88_26.x, var_88_26.y, var_88_26.z)

				local var_88_27 = var_88_19.localEulerAngles

				var_88_27.z = 0
				var_88_27.x = 0
				var_88_19.localEulerAngles = var_88_27
			end

			local var_88_28 = arg_85_1.actors_["1084ui_story"].transform
			local var_88_29 = 0

			if var_88_29 < arg_85_1.time_ and arg_85_1.time_ <= var_88_29 + arg_88_0 then
				arg_85_1.var_.moveOldPos1084ui_story = var_88_28.localPosition
			end

			local var_88_30 = 0.001

			if var_88_29 <= arg_85_1.time_ and arg_85_1.time_ < var_88_29 + var_88_30 then
				local var_88_31 = (arg_85_1.time_ - var_88_29) / var_88_30
				local var_88_32 = Vector3.New(-0.7, -0.97, -6)

				var_88_28.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos1084ui_story, var_88_32, var_88_31)

				local var_88_33 = manager.ui.mainCamera.transform.position - var_88_28.position

				var_88_28.forward = Vector3.New(var_88_33.x, var_88_33.y, var_88_33.z)

				local var_88_34 = var_88_28.localEulerAngles

				var_88_34.z = 0
				var_88_34.x = 0
				var_88_28.localEulerAngles = var_88_34
			end

			if arg_85_1.time_ >= var_88_29 + var_88_30 and arg_85_1.time_ < var_88_29 + var_88_30 + arg_88_0 then
				var_88_28.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_88_35 = manager.ui.mainCamera.transform.position - var_88_28.position

				var_88_28.forward = Vector3.New(var_88_35.x, var_88_35.y, var_88_35.z)

				local var_88_36 = var_88_28.localEulerAngles

				var_88_36.z = 0
				var_88_36.x = 0
				var_88_28.localEulerAngles = var_88_36
			end

			local var_88_37 = 0

			if var_88_37 < arg_85_1.time_ and arg_85_1.time_ <= var_88_37 + arg_88_0 then
				arg_85_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_1")
			end

			local var_88_38 = 0

			if var_88_38 < arg_85_1.time_ and arg_85_1.time_ <= var_88_38 + arg_88_0 then
				arg_85_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_88_39 = 0
			local var_88_40 = 0.6

			if var_88_39 < arg_85_1.time_ and arg_85_1.time_ <= var_88_39 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_41 = arg_85_1:FormatText(StoryNameCfg[6].name)

				arg_85_1.leftNameTxt_.text = var_88_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_42 = arg_85_1:GetWordFromCfg(104011021)
				local var_88_43 = arg_85_1:FormatText(var_88_42.content)

				arg_85_1.text_.text = var_88_43

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_44 = 21
				local var_88_45 = utf8.len(var_88_43)
				local var_88_46 = var_88_44 <= 0 and var_88_40 or var_88_40 * (var_88_45 / var_88_44)

				if var_88_46 > 0 and var_88_40 < var_88_46 then
					arg_85_1.talkMaxDuration = var_88_46

					if var_88_46 + var_88_39 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_46 + var_88_39
					end
				end

				arg_85_1.text_.text = var_88_43
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011021", "story_v_out_104011.awb") ~= 0 then
					local var_88_47 = manager.audio:GetVoiceLength("story_v_out_104011", "104011021", "story_v_out_104011.awb") / 1000

					if var_88_47 + var_88_39 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_47 + var_88_39
					end

					if var_88_42.prefab_name ~= "" and arg_85_1.actors_[var_88_42.prefab_name] ~= nil then
						local var_88_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_42.prefab_name].transform, "story_v_out_104011", "104011021", "story_v_out_104011.awb")

						arg_85_1:RecordAudio("104011021", var_88_48)
						arg_85_1:RecordAudio("104011021", var_88_48)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_104011", "104011021", "story_v_out_104011.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_104011", "104011021", "story_v_out_104011.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_49 = math.max(var_88_40, arg_85_1.talkMaxDuration)

			if var_88_39 <= arg_85_1.time_ and arg_85_1.time_ < var_88_39 + var_88_49 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_39) / var_88_49

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_39 + var_88_49 and arg_85_1.time_ < var_88_39 + var_88_49 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play104011022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 104011022
		arg_89_1.duration_ = 7.966

		local var_89_0 = {
			ja = 7.966,
			ko = 3.733,
			zh = 4.633,
			en = 4.3
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
				arg_89_0:Play104011023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1011ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect1011ui_story == nil then
				arg_89_1.var_.characterEffect1011ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.1

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect1011ui_story then
					arg_89_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect1011ui_story then
				arg_89_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_92_4 = arg_89_1.actors_["1084ui_story"]
			local var_92_5 = 0

			if var_92_5 < arg_89_1.time_ and arg_89_1.time_ <= var_92_5 + arg_92_0 and arg_89_1.var_.characterEffect1084ui_story == nil then
				arg_89_1.var_.characterEffect1084ui_story = var_92_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_6 = 0.1

			if var_92_5 <= arg_89_1.time_ and arg_89_1.time_ < var_92_5 + var_92_6 then
				local var_92_7 = (arg_89_1.time_ - var_92_5) / var_92_6

				if arg_89_1.var_.characterEffect1084ui_story then
					local var_92_8 = Mathf.Lerp(0, 0.5, var_92_7)

					arg_89_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_89_1.var_.characterEffect1084ui_story.fillRatio = var_92_8
				end
			end

			if arg_89_1.time_ >= var_92_5 + var_92_6 and arg_89_1.time_ < var_92_5 + var_92_6 + arg_92_0 and arg_89_1.var_.characterEffect1084ui_story then
				local var_92_9 = 0.5

				arg_89_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_89_1.var_.characterEffect1084ui_story.fillRatio = var_92_9
			end

			local var_92_10 = arg_89_1.actors_["1011ui_story"].transform
			local var_92_11 = 0

			if var_92_11 < arg_89_1.time_ and arg_89_1.time_ <= var_92_11 + arg_92_0 then
				arg_89_1.var_.moveOldPos1011ui_story = var_92_10.localPosition
			end

			local var_92_12 = 0.001

			if var_92_11 <= arg_89_1.time_ and arg_89_1.time_ < var_92_11 + var_92_12 then
				local var_92_13 = (arg_89_1.time_ - var_92_11) / var_92_12
				local var_92_14 = Vector3.New(0.7, -0.71, -6)

				var_92_10.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1011ui_story, var_92_14, var_92_13)

				local var_92_15 = manager.ui.mainCamera.transform.position - var_92_10.position

				var_92_10.forward = Vector3.New(var_92_15.x, var_92_15.y, var_92_15.z)

				local var_92_16 = var_92_10.localEulerAngles

				var_92_16.z = 0
				var_92_16.x = 0
				var_92_10.localEulerAngles = var_92_16
			end

			if arg_89_1.time_ >= var_92_11 + var_92_12 and arg_89_1.time_ < var_92_11 + var_92_12 + arg_92_0 then
				var_92_10.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_92_17 = manager.ui.mainCamera.transform.position - var_92_10.position

				var_92_10.forward = Vector3.New(var_92_17.x, var_92_17.y, var_92_17.z)

				local var_92_18 = var_92_10.localEulerAngles

				var_92_18.z = 0
				var_92_18.x = 0
				var_92_10.localEulerAngles = var_92_18
			end

			local var_92_19 = 0

			if var_92_19 < arg_89_1.time_ and arg_89_1.time_ <= var_92_19 + arg_92_0 then
				arg_89_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_92_20 = 0

			if var_92_20 < arg_89_1.time_ and arg_89_1.time_ <= var_92_20 + arg_92_0 then
				arg_89_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_92_21 = 0
			local var_92_22 = 0.375

			if var_92_21 < arg_89_1.time_ and arg_89_1.time_ <= var_92_21 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_23 = arg_89_1:FormatText(StoryNameCfg[37].name)

				arg_89_1.leftNameTxt_.text = var_92_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_24 = arg_89_1:GetWordFromCfg(104011022)
				local var_92_25 = arg_89_1:FormatText(var_92_24.content)

				arg_89_1.text_.text = var_92_25

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_26 = 15
				local var_92_27 = utf8.len(var_92_25)
				local var_92_28 = var_92_26 <= 0 and var_92_22 or var_92_22 * (var_92_27 / var_92_26)

				if var_92_28 > 0 and var_92_22 < var_92_28 then
					arg_89_1.talkMaxDuration = var_92_28

					if var_92_28 + var_92_21 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_28 + var_92_21
					end
				end

				arg_89_1.text_.text = var_92_25
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011022", "story_v_out_104011.awb") ~= 0 then
					local var_92_29 = manager.audio:GetVoiceLength("story_v_out_104011", "104011022", "story_v_out_104011.awb") / 1000

					if var_92_29 + var_92_21 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_29 + var_92_21
					end

					if var_92_24.prefab_name ~= "" and arg_89_1.actors_[var_92_24.prefab_name] ~= nil then
						local var_92_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_24.prefab_name].transform, "story_v_out_104011", "104011022", "story_v_out_104011.awb")

						arg_89_1:RecordAudio("104011022", var_92_30)
						arg_89_1:RecordAudio("104011022", var_92_30)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_104011", "104011022", "story_v_out_104011.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_104011", "104011022", "story_v_out_104011.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_31 = math.max(var_92_22, arg_89_1.talkMaxDuration)

			if var_92_21 <= arg_89_1.time_ and arg_89_1.time_ < var_92_21 + var_92_31 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_21) / var_92_31

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_21 + var_92_31 and arg_89_1.time_ < var_92_21 + var_92_31 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play104011023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 104011023
		arg_93_1.duration_ = 11.7

		local var_93_0 = {
			ja = 11.7,
			ko = 6.3,
			zh = 6.566,
			en = 7.5
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
				arg_93_0:Play104011024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1019ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.characterEffect1019ui_story == nil then
				arg_93_1.var_.characterEffect1019ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.1

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect1019ui_story then
					arg_93_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect1019ui_story then
				arg_93_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_96_4 = arg_93_1.actors_["1011ui_story"]
			local var_96_5 = 0

			if var_96_5 < arg_93_1.time_ and arg_93_1.time_ <= var_96_5 + arg_96_0 and arg_93_1.var_.characterEffect1011ui_story == nil then
				arg_93_1.var_.characterEffect1011ui_story = var_96_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_6 = 0.1

			if var_96_5 <= arg_93_1.time_ and arg_93_1.time_ < var_96_5 + var_96_6 then
				local var_96_7 = (arg_93_1.time_ - var_96_5) / var_96_6

				if arg_93_1.var_.characterEffect1011ui_story then
					local var_96_8 = Mathf.Lerp(0, 0.5, var_96_7)

					arg_93_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_93_1.var_.characterEffect1011ui_story.fillRatio = var_96_8
				end
			end

			if arg_93_1.time_ >= var_96_5 + var_96_6 and arg_93_1.time_ < var_96_5 + var_96_6 + arg_96_0 and arg_93_1.var_.characterEffect1011ui_story then
				local var_96_9 = 0.5

				arg_93_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_93_1.var_.characterEffect1011ui_story.fillRatio = var_96_9
			end

			local var_96_10 = arg_93_1.actors_["1011ui_story"].transform
			local var_96_11 = 0

			if var_96_11 < arg_93_1.time_ and arg_93_1.time_ <= var_96_11 + arg_96_0 then
				arg_93_1.var_.moveOldPos1011ui_story = var_96_10.localPosition
			end

			local var_96_12 = 0.001

			if var_96_11 <= arg_93_1.time_ and arg_93_1.time_ < var_96_11 + var_96_12 then
				local var_96_13 = (arg_93_1.time_ - var_96_11) / var_96_12
				local var_96_14 = Vector3.New(0, 100, 0)

				var_96_10.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1011ui_story, var_96_14, var_96_13)

				local var_96_15 = manager.ui.mainCamera.transform.position - var_96_10.position

				var_96_10.forward = Vector3.New(var_96_15.x, var_96_15.y, var_96_15.z)

				local var_96_16 = var_96_10.localEulerAngles

				var_96_16.z = 0
				var_96_16.x = 0
				var_96_10.localEulerAngles = var_96_16
			end

			if arg_93_1.time_ >= var_96_11 + var_96_12 and arg_93_1.time_ < var_96_11 + var_96_12 + arg_96_0 then
				var_96_10.localPosition = Vector3.New(0, 100, 0)

				local var_96_17 = manager.ui.mainCamera.transform.position - var_96_10.position

				var_96_10.forward = Vector3.New(var_96_17.x, var_96_17.y, var_96_17.z)

				local var_96_18 = var_96_10.localEulerAngles

				var_96_18.z = 0
				var_96_18.x = 0
				var_96_10.localEulerAngles = var_96_18
			end

			local var_96_19 = arg_93_1.actors_["1084ui_story"].transform
			local var_96_20 = 0

			if var_96_20 < arg_93_1.time_ and arg_93_1.time_ <= var_96_20 + arg_96_0 then
				arg_93_1.var_.moveOldPos1084ui_story = var_96_19.localPosition
			end

			local var_96_21 = 0.001

			if var_96_20 <= arg_93_1.time_ and arg_93_1.time_ < var_96_20 + var_96_21 then
				local var_96_22 = (arg_93_1.time_ - var_96_20) / var_96_21
				local var_96_23 = Vector3.New(0, 100, 0)

				var_96_19.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1084ui_story, var_96_23, var_96_22)

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

			local var_96_28 = arg_93_1.actors_["1019ui_story"].transform
			local var_96_29 = 0

			if var_96_29 < arg_93_1.time_ and arg_93_1.time_ <= var_96_29 + arg_96_0 then
				arg_93_1.var_.moveOldPos1019ui_story = var_96_28.localPosition
			end

			local var_96_30 = 0.001

			if var_96_29 <= arg_93_1.time_ and arg_93_1.time_ < var_96_29 + var_96_30 then
				local var_96_31 = (arg_93_1.time_ - var_96_29) / var_96_30
				local var_96_32 = Vector3.New(0, -1.08, -5.9)

				var_96_28.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1019ui_story, var_96_32, var_96_31)

				local var_96_33 = manager.ui.mainCamera.transform.position - var_96_28.position

				var_96_28.forward = Vector3.New(var_96_33.x, var_96_33.y, var_96_33.z)

				local var_96_34 = var_96_28.localEulerAngles

				var_96_34.z = 0
				var_96_34.x = 0
				var_96_28.localEulerAngles = var_96_34
			end

			if arg_93_1.time_ >= var_96_29 + var_96_30 and arg_93_1.time_ < var_96_29 + var_96_30 + arg_96_0 then
				var_96_28.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_96_35 = manager.ui.mainCamera.transform.position - var_96_28.position

				var_96_28.forward = Vector3.New(var_96_35.x, var_96_35.y, var_96_35.z)

				local var_96_36 = var_96_28.localEulerAngles

				var_96_36.z = 0
				var_96_36.x = 0
				var_96_28.localEulerAngles = var_96_36
			end

			local var_96_37 = 0

			if var_96_37 < arg_93_1.time_ and arg_93_1.time_ <= var_96_37 + arg_96_0 then
				arg_93_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_96_38 = 0

			if var_96_38 < arg_93_1.time_ and arg_93_1.time_ <= var_96_38 + arg_96_0 then
				arg_93_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_96_39 = 0
			local var_96_40 = 0.8

			if var_96_39 < arg_93_1.time_ and arg_93_1.time_ <= var_96_39 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_41 = arg_93_1:FormatText(StoryNameCfg[13].name)

				arg_93_1.leftNameTxt_.text = var_96_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_42 = arg_93_1:GetWordFromCfg(104011023)
				local var_96_43 = arg_93_1:FormatText(var_96_42.content)

				arg_93_1.text_.text = var_96_43

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_44 = 32
				local var_96_45 = utf8.len(var_96_43)
				local var_96_46 = var_96_44 <= 0 and var_96_40 or var_96_40 * (var_96_45 / var_96_44)

				if var_96_46 > 0 and var_96_40 < var_96_46 then
					arg_93_1.talkMaxDuration = var_96_46

					if var_96_46 + var_96_39 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_46 + var_96_39
					end
				end

				arg_93_1.text_.text = var_96_43
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011023", "story_v_out_104011.awb") ~= 0 then
					local var_96_47 = manager.audio:GetVoiceLength("story_v_out_104011", "104011023", "story_v_out_104011.awb") / 1000

					if var_96_47 + var_96_39 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_47 + var_96_39
					end

					if var_96_42.prefab_name ~= "" and arg_93_1.actors_[var_96_42.prefab_name] ~= nil then
						local var_96_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_42.prefab_name].transform, "story_v_out_104011", "104011023", "story_v_out_104011.awb")

						arg_93_1:RecordAudio("104011023", var_96_48)
						arg_93_1:RecordAudio("104011023", var_96_48)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_104011", "104011023", "story_v_out_104011.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_104011", "104011023", "story_v_out_104011.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_49 = math.max(var_96_40, arg_93_1.talkMaxDuration)

			if var_96_39 <= arg_93_1.time_ and arg_93_1.time_ < var_96_39 + var_96_49 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_39) / var_96_49

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_39 + var_96_49 and arg_93_1.time_ < var_96_39 + var_96_49 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play104011024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 104011024
		arg_97_1.duration_ = 5.233

		local var_97_0 = {
			ja = 5.233,
			ko = 2.2,
			zh = 2.366,
			en = 1.999999999999
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
				arg_97_0:Play104011025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1036ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect1036ui_story == nil then
				arg_97_1.var_.characterEffect1036ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.1

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect1036ui_story then
					arg_97_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect1036ui_story then
				arg_97_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_100_4 = arg_97_1.actors_["1019ui_story"]
			local var_100_5 = 0

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 and arg_97_1.var_.characterEffect1019ui_story == nil then
				arg_97_1.var_.characterEffect1019ui_story = var_100_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_6 = 0.1

			if var_100_5 <= arg_97_1.time_ and arg_97_1.time_ < var_100_5 + var_100_6 then
				local var_100_7 = (arg_97_1.time_ - var_100_5) / var_100_6

				if arg_97_1.var_.characterEffect1019ui_story then
					local var_100_8 = Mathf.Lerp(0, 0.5, var_100_7)

					arg_97_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_97_1.var_.characterEffect1019ui_story.fillRatio = var_100_8
				end
			end

			if arg_97_1.time_ >= var_100_5 + var_100_6 and arg_97_1.time_ < var_100_5 + var_100_6 + arg_100_0 and arg_97_1.var_.characterEffect1019ui_story then
				local var_100_9 = 0.5

				arg_97_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_97_1.var_.characterEffect1019ui_story.fillRatio = var_100_9
			end

			local var_100_10 = arg_97_1.actors_["1019ui_story"].transform
			local var_100_11 = 0

			if var_100_11 < arg_97_1.time_ and arg_97_1.time_ <= var_100_11 + arg_100_0 then
				arg_97_1.var_.moveOldPos1019ui_story = var_100_10.localPosition
			end

			local var_100_12 = 0.001

			if var_100_11 <= arg_97_1.time_ and arg_97_1.time_ < var_100_11 + var_100_12 then
				local var_100_13 = (arg_97_1.time_ - var_100_11) / var_100_12
				local var_100_14 = Vector3.New(0, 100, 0)

				var_100_10.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1019ui_story, var_100_14, var_100_13)

				local var_100_15 = manager.ui.mainCamera.transform.position - var_100_10.position

				var_100_10.forward = Vector3.New(var_100_15.x, var_100_15.y, var_100_15.z)

				local var_100_16 = var_100_10.localEulerAngles

				var_100_16.z = 0
				var_100_16.x = 0
				var_100_10.localEulerAngles = var_100_16
			end

			if arg_97_1.time_ >= var_100_11 + var_100_12 and arg_97_1.time_ < var_100_11 + var_100_12 + arg_100_0 then
				var_100_10.localPosition = Vector3.New(0, 100, 0)

				local var_100_17 = manager.ui.mainCamera.transform.position - var_100_10.position

				var_100_10.forward = Vector3.New(var_100_17.x, var_100_17.y, var_100_17.z)

				local var_100_18 = var_100_10.localEulerAngles

				var_100_18.z = 0
				var_100_18.x = 0
				var_100_10.localEulerAngles = var_100_18
			end

			local var_100_19 = arg_97_1.actors_["1036ui_story"].transform
			local var_100_20 = 0

			if var_100_20 < arg_97_1.time_ and arg_97_1.time_ <= var_100_20 + arg_100_0 then
				arg_97_1.var_.moveOldPos1036ui_story = var_100_19.localPosition
			end

			local var_100_21 = 0.001

			if var_100_20 <= arg_97_1.time_ and arg_97_1.time_ < var_100_20 + var_100_21 then
				local var_100_22 = (arg_97_1.time_ - var_100_20) / var_100_21
				local var_100_23 = Vector3.New(0, -1.09, -5.78)

				var_100_19.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1036ui_story, var_100_23, var_100_22)

				local var_100_24 = manager.ui.mainCamera.transform.position - var_100_19.position

				var_100_19.forward = Vector3.New(var_100_24.x, var_100_24.y, var_100_24.z)

				local var_100_25 = var_100_19.localEulerAngles

				var_100_25.z = 0
				var_100_25.x = 0
				var_100_19.localEulerAngles = var_100_25
			end

			if arg_97_1.time_ >= var_100_20 + var_100_21 and arg_97_1.time_ < var_100_20 + var_100_21 + arg_100_0 then
				var_100_19.localPosition = Vector3.New(0, -1.09, -5.78)

				local var_100_26 = manager.ui.mainCamera.transform.position - var_100_19.position

				var_100_19.forward = Vector3.New(var_100_26.x, var_100_26.y, var_100_26.z)

				local var_100_27 = var_100_19.localEulerAngles

				var_100_27.z = 0
				var_100_27.x = 0
				var_100_19.localEulerAngles = var_100_27
			end

			local var_100_28 = 0

			if var_100_28 < arg_97_1.time_ and arg_97_1.time_ <= var_100_28 + arg_100_0 then
				arg_97_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action4_1")
			end

			local var_100_29 = 0

			if var_100_29 < arg_97_1.time_ and arg_97_1.time_ <= var_100_29 + arg_100_0 then
				arg_97_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_100_30 = 0
			local var_100_31 = 0.225

			if var_100_30 < arg_97_1.time_ and arg_97_1.time_ <= var_100_30 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_32 = arg_97_1:FormatText(StoryNameCfg[5].name)

				arg_97_1.leftNameTxt_.text = var_100_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_33 = arg_97_1:GetWordFromCfg(104011024)
				local var_100_34 = arg_97_1:FormatText(var_100_33.content)

				arg_97_1.text_.text = var_100_34

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_35 = 9
				local var_100_36 = utf8.len(var_100_34)
				local var_100_37 = var_100_35 <= 0 and var_100_31 or var_100_31 * (var_100_36 / var_100_35)

				if var_100_37 > 0 and var_100_31 < var_100_37 then
					arg_97_1.talkMaxDuration = var_100_37

					if var_100_37 + var_100_30 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_37 + var_100_30
					end
				end

				arg_97_1.text_.text = var_100_34
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011024", "story_v_out_104011.awb") ~= 0 then
					local var_100_38 = manager.audio:GetVoiceLength("story_v_out_104011", "104011024", "story_v_out_104011.awb") / 1000

					if var_100_38 + var_100_30 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_38 + var_100_30
					end

					if var_100_33.prefab_name ~= "" and arg_97_1.actors_[var_100_33.prefab_name] ~= nil then
						local var_100_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_33.prefab_name].transform, "story_v_out_104011", "104011024", "story_v_out_104011.awb")

						arg_97_1:RecordAudio("104011024", var_100_39)
						arg_97_1:RecordAudio("104011024", var_100_39)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_104011", "104011024", "story_v_out_104011.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_104011", "104011024", "story_v_out_104011.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_40 = math.max(var_100_31, arg_97_1.talkMaxDuration)

			if var_100_30 <= arg_97_1.time_ and arg_97_1.time_ < var_100_30 + var_100_40 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_30) / var_100_40

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_30 + var_100_40 and arg_97_1.time_ < var_100_30 + var_100_40 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play104011025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 104011025
		arg_101_1.duration_ = 0.100000001489

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"

			SetActive(arg_101_1.choicesGo_, true)

			for iter_102_0, iter_102_1 in ipairs(arg_101_1.choices_) do
				local var_102_0 = iter_102_0 <= 2

				SetActive(iter_102_1.go, var_102_0)
			end

			arg_101_1.choices_[1].txt.text = arg_101_1:FormatText(StoryChoiceCfg[20].name)
			arg_101_1.choices_[2].txt.text = arg_101_1:FormatText(StoryChoiceCfg[21].name)
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play104011026(arg_101_1)
			end

			if arg_103_0 == 2 then
				arg_101_0:Play104011029(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1036ui_story"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.characterEffect1036ui_story == nil then
				arg_101_1.var_.characterEffect1036ui_story = var_104_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_2 = 0.1

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.characterEffect1036ui_story then
					local var_104_4 = Mathf.Lerp(0, 0.5, var_104_3)

					arg_101_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1036ui_story.fillRatio = var_104_4
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.characterEffect1036ui_story then
				local var_104_5 = 0.5

				arg_101_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1036ui_story.fillRatio = var_104_5
			end
		end
	end,
	Play104011026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 104011026
		arg_105_1.duration_ = 2.166

		local var_105_0 = {
			ja = 1.999999999999,
			ko = 1.999999999999,
			zh = 2.166,
			en = 1.999999999999
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
				arg_105_0:Play104011027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1036ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.characterEffect1036ui_story == nil then
				arg_105_1.var_.characterEffect1036ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.1

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect1036ui_story then
					arg_105_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.characterEffect1036ui_story then
				arg_105_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_108_4 = 0

			if var_108_4 < arg_105_1.time_ and arg_105_1.time_ <= var_108_4 + arg_108_0 then
				arg_105_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036actionlink/1036action442")
			end

			local var_108_5 = 0

			if var_108_5 < arg_105_1.time_ and arg_105_1.time_ <= var_108_5 + arg_108_0 then
				arg_105_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_108_6 = 0
			local var_108_7 = 0.25

			if var_108_6 < arg_105_1.time_ and arg_105_1.time_ <= var_108_6 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_8 = arg_105_1:FormatText(StoryNameCfg[5].name)

				arg_105_1.leftNameTxt_.text = var_108_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_9 = arg_105_1:GetWordFromCfg(104011026)
				local var_108_10 = arg_105_1:FormatText(var_108_9.content)

				arg_105_1.text_.text = var_108_10

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_11 = 10
				local var_108_12 = utf8.len(var_108_10)
				local var_108_13 = var_108_11 <= 0 and var_108_7 or var_108_7 * (var_108_12 / var_108_11)

				if var_108_13 > 0 and var_108_7 < var_108_13 then
					arg_105_1.talkMaxDuration = var_108_13

					if var_108_13 + var_108_6 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_13 + var_108_6
					end
				end

				arg_105_1.text_.text = var_108_10
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011026", "story_v_out_104011.awb") ~= 0 then
					local var_108_14 = manager.audio:GetVoiceLength("story_v_out_104011", "104011026", "story_v_out_104011.awb") / 1000

					if var_108_14 + var_108_6 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_14 + var_108_6
					end

					if var_108_9.prefab_name ~= "" and arg_105_1.actors_[var_108_9.prefab_name] ~= nil then
						local var_108_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_9.prefab_name].transform, "story_v_out_104011", "104011026", "story_v_out_104011.awb")

						arg_105_1:RecordAudio("104011026", var_108_15)
						arg_105_1:RecordAudio("104011026", var_108_15)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_104011", "104011026", "story_v_out_104011.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_104011", "104011026", "story_v_out_104011.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_16 = math.max(var_108_7, arg_105_1.talkMaxDuration)

			if var_108_6 <= arg_105_1.time_ and arg_105_1.time_ < var_108_6 + var_108_16 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_6) / var_108_16

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_6 + var_108_16 and arg_105_1.time_ < var_108_6 + var_108_16 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play104011027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 104011027
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play104011028(arg_109_1)
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
					local var_112_4 = Mathf.Lerp(0, 0.5, var_112_3)

					arg_109_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1036ui_story.fillRatio = var_112_4
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.characterEffect1036ui_story then
				local var_112_5 = 0.5

				arg_109_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1036ui_story.fillRatio = var_112_5
			end

			local var_112_6 = 0
			local var_112_7 = 0.775

			if var_112_6 < arg_109_1.time_ and arg_109_1.time_ <= var_112_6 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_8 = arg_109_1:FormatText(StoryNameCfg[7].name)

				arg_109_1.leftNameTxt_.text = var_112_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_9 = arg_109_1:GetWordFromCfg(104011027)
				local var_112_10 = arg_109_1:FormatText(var_112_9.content)

				arg_109_1.text_.text = var_112_10

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_11 = 31
				local var_112_12 = utf8.len(var_112_10)
				local var_112_13 = var_112_11 <= 0 and var_112_7 or var_112_7 * (var_112_12 / var_112_11)

				if var_112_13 > 0 and var_112_7 < var_112_13 then
					arg_109_1.talkMaxDuration = var_112_13

					if var_112_13 + var_112_6 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_13 + var_112_6
					end
				end

				arg_109_1.text_.text = var_112_10
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)
				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_14 = math.max(var_112_7, arg_109_1.talkMaxDuration)

			if var_112_6 <= arg_109_1.time_ and arg_109_1.time_ < var_112_6 + var_112_14 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_6) / var_112_14

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_6 + var_112_14 and arg_109_1.time_ < var_112_6 + var_112_14 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play104011028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 104011028
		arg_113_1.duration_ = 4.4

		local var_113_0 = {
			ja = 4.4,
			ko = 2.166,
			zh = 3.833,
			en = 2.966
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
				arg_113_0:Play104011033(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1036ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect1036ui_story == nil then
				arg_113_1.var_.characterEffect1036ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.1

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1036ui_story then
					arg_113_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect1036ui_story then
				arg_113_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_116_4 = 0

			if var_116_4 < arg_113_1.time_ and arg_113_1.time_ <= var_116_4 + arg_116_0 then
				arg_113_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036actionlink/1036action425")
			end

			local var_116_5 = 0

			if var_116_5 < arg_113_1.time_ and arg_113_1.time_ <= var_116_5 + arg_116_0 then
				arg_113_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_116_6 = 0
			local var_116_7 = 0.425

			if var_116_6 < arg_113_1.time_ and arg_113_1.time_ <= var_116_6 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_8 = arg_113_1:FormatText(StoryNameCfg[5].name)

				arg_113_1.leftNameTxt_.text = var_116_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_9 = arg_113_1:GetWordFromCfg(104011028)
				local var_116_10 = arg_113_1:FormatText(var_116_9.content)

				arg_113_1.text_.text = var_116_10

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_11 = 16
				local var_116_12 = utf8.len(var_116_10)
				local var_116_13 = var_116_11 <= 0 and var_116_7 or var_116_7 * (var_116_12 / var_116_11)

				if var_116_13 > 0 and var_116_7 < var_116_13 then
					arg_113_1.talkMaxDuration = var_116_13

					if var_116_13 + var_116_6 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_13 + var_116_6
					end
				end

				arg_113_1.text_.text = var_116_10
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011028", "story_v_out_104011.awb") ~= 0 then
					local var_116_14 = manager.audio:GetVoiceLength("story_v_out_104011", "104011028", "story_v_out_104011.awb") / 1000

					if var_116_14 + var_116_6 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_14 + var_116_6
					end

					if var_116_9.prefab_name ~= "" and arg_113_1.actors_[var_116_9.prefab_name] ~= nil then
						local var_116_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_9.prefab_name].transform, "story_v_out_104011", "104011028", "story_v_out_104011.awb")

						arg_113_1:RecordAudio("104011028", var_116_15)
						arg_113_1:RecordAudio("104011028", var_116_15)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_104011", "104011028", "story_v_out_104011.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_104011", "104011028", "story_v_out_104011.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_16 = math.max(var_116_7, arg_113_1.talkMaxDuration)

			if var_116_6 <= arg_113_1.time_ and arg_113_1.time_ < var_116_6 + var_116_16 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_6) / var_116_16

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_6 + var_116_16 and arg_113_1.time_ < var_116_6 + var_116_16 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play104011033 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 104011033
		arg_117_1.duration_ = 4

		local var_117_0 = {
			ja = 4,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_117_0:Play104011034(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1019ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect1019ui_story == nil then
				arg_117_1.var_.characterEffect1019ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.1

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect1019ui_story then
					arg_117_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect1019ui_story then
				arg_117_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_120_4 = arg_117_1.actors_["1036ui_story"].transform
			local var_120_5 = 0

			if var_120_5 < arg_117_1.time_ and arg_117_1.time_ <= var_120_5 + arg_120_0 then
				arg_117_1.var_.moveOldPos1036ui_story = var_120_4.localPosition
			end

			local var_120_6 = 0.001

			if var_120_5 <= arg_117_1.time_ and arg_117_1.time_ < var_120_5 + var_120_6 then
				local var_120_7 = (arg_117_1.time_ - var_120_5) / var_120_6
				local var_120_8 = Vector3.New(0, 100, 0)

				var_120_4.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1036ui_story, var_120_8, var_120_7)

				local var_120_9 = manager.ui.mainCamera.transform.position - var_120_4.position

				var_120_4.forward = Vector3.New(var_120_9.x, var_120_9.y, var_120_9.z)

				local var_120_10 = var_120_4.localEulerAngles

				var_120_10.z = 0
				var_120_10.x = 0
				var_120_4.localEulerAngles = var_120_10
			end

			if arg_117_1.time_ >= var_120_5 + var_120_6 and arg_117_1.time_ < var_120_5 + var_120_6 + arg_120_0 then
				var_120_4.localPosition = Vector3.New(0, 100, 0)

				local var_120_11 = manager.ui.mainCamera.transform.position - var_120_4.position

				var_120_4.forward = Vector3.New(var_120_11.x, var_120_11.y, var_120_11.z)

				local var_120_12 = var_120_4.localEulerAngles

				var_120_12.z = 0
				var_120_12.x = 0
				var_120_4.localEulerAngles = var_120_12
			end

			local var_120_13 = arg_117_1.actors_["1019ui_story"].transform
			local var_120_14 = 0

			if var_120_14 < arg_117_1.time_ and arg_117_1.time_ <= var_120_14 + arg_120_0 then
				arg_117_1.var_.moveOldPos1019ui_story = var_120_13.localPosition
			end

			local var_120_15 = 0.001

			if var_120_14 <= arg_117_1.time_ and arg_117_1.time_ < var_120_14 + var_120_15 then
				local var_120_16 = (arg_117_1.time_ - var_120_14) / var_120_15
				local var_120_17 = Vector3.New(0, -1.08, -5.9)

				var_120_13.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1019ui_story, var_120_17, var_120_16)

				local var_120_18 = manager.ui.mainCamera.transform.position - var_120_13.position

				var_120_13.forward = Vector3.New(var_120_18.x, var_120_18.y, var_120_18.z)

				local var_120_19 = var_120_13.localEulerAngles

				var_120_19.z = 0
				var_120_19.x = 0
				var_120_13.localEulerAngles = var_120_19
			end

			if arg_117_1.time_ >= var_120_14 + var_120_15 and arg_117_1.time_ < var_120_14 + var_120_15 + arg_120_0 then
				var_120_13.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_120_20 = manager.ui.mainCamera.transform.position - var_120_13.position

				var_120_13.forward = Vector3.New(var_120_20.x, var_120_20.y, var_120_20.z)

				local var_120_21 = var_120_13.localEulerAngles

				var_120_21.z = 0
				var_120_21.x = 0
				var_120_13.localEulerAngles = var_120_21
			end

			local var_120_22 = 0

			if var_120_22 < arg_117_1.time_ and arg_117_1.time_ <= var_120_22 + arg_120_0 then
				arg_117_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action7_1")
			end

			local var_120_23 = 0

			if var_120_23 < arg_117_1.time_ and arg_117_1.time_ <= var_120_23 + arg_120_0 then
				arg_117_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_120_24 = 0
			local var_120_25 = 0.15

			if var_120_24 < arg_117_1.time_ and arg_117_1.time_ <= var_120_24 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_26 = arg_117_1:FormatText(StoryNameCfg[13].name)

				arg_117_1.leftNameTxt_.text = var_120_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_27 = arg_117_1:GetWordFromCfg(104011033)
				local var_120_28 = arg_117_1:FormatText(var_120_27.content)

				arg_117_1.text_.text = var_120_28

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_29 = 6
				local var_120_30 = utf8.len(var_120_28)
				local var_120_31 = var_120_29 <= 0 and var_120_25 or var_120_25 * (var_120_30 / var_120_29)

				if var_120_31 > 0 and var_120_25 < var_120_31 then
					arg_117_1.talkMaxDuration = var_120_31

					if var_120_31 + var_120_24 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_31 + var_120_24
					end
				end

				arg_117_1.text_.text = var_120_28
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011033", "story_v_out_104011.awb") ~= 0 then
					local var_120_32 = manager.audio:GetVoiceLength("story_v_out_104011", "104011033", "story_v_out_104011.awb") / 1000

					if var_120_32 + var_120_24 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_32 + var_120_24
					end

					if var_120_27.prefab_name ~= "" and arg_117_1.actors_[var_120_27.prefab_name] ~= nil then
						local var_120_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_27.prefab_name].transform, "story_v_out_104011", "104011033", "story_v_out_104011.awb")

						arg_117_1:RecordAudio("104011033", var_120_33)
						arg_117_1:RecordAudio("104011033", var_120_33)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_104011", "104011033", "story_v_out_104011.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_104011", "104011033", "story_v_out_104011.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_34 = math.max(var_120_25, arg_117_1.talkMaxDuration)

			if var_120_24 <= arg_117_1.time_ and arg_117_1.time_ < var_120_24 + var_120_34 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_24) / var_120_34

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_24 + var_120_34 and arg_117_1.time_ < var_120_24 + var_120_34 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play104011034 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 104011034
		arg_121_1.duration_ = 15.666

		local var_121_0 = {
			ja = 15.666,
			ko = 9.166,
			zh = 9.633,
			en = 13.066
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
				arg_121_0:Play104011035(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action475")
			end

			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_124_2 = 0
			local var_124_3 = 1.25

			if var_124_2 < arg_121_1.time_ and arg_121_1.time_ <= var_124_2 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_4 = arg_121_1:FormatText(StoryNameCfg[13].name)

				arg_121_1.leftNameTxt_.text = var_124_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_5 = arg_121_1:GetWordFromCfg(104011034)
				local var_124_6 = arg_121_1:FormatText(var_124_5.content)

				arg_121_1.text_.text = var_124_6

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_7 = 49
				local var_124_8 = utf8.len(var_124_6)
				local var_124_9 = var_124_7 <= 0 and var_124_3 or var_124_3 * (var_124_8 / var_124_7)

				if var_124_9 > 0 and var_124_3 < var_124_9 then
					arg_121_1.talkMaxDuration = var_124_9

					if var_124_9 + var_124_2 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_9 + var_124_2
					end
				end

				arg_121_1.text_.text = var_124_6
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011034", "story_v_out_104011.awb") ~= 0 then
					local var_124_10 = manager.audio:GetVoiceLength("story_v_out_104011", "104011034", "story_v_out_104011.awb") / 1000

					if var_124_10 + var_124_2 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_10 + var_124_2
					end

					if var_124_5.prefab_name ~= "" and arg_121_1.actors_[var_124_5.prefab_name] ~= nil then
						local var_124_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_5.prefab_name].transform, "story_v_out_104011", "104011034", "story_v_out_104011.awb")

						arg_121_1:RecordAudio("104011034", var_124_11)
						arg_121_1:RecordAudio("104011034", var_124_11)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_104011", "104011034", "story_v_out_104011.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_104011", "104011034", "story_v_out_104011.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_12 = math.max(var_124_3, arg_121_1.talkMaxDuration)

			if var_124_2 <= arg_121_1.time_ and arg_121_1.time_ < var_124_2 + var_124_12 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_2) / var_124_12

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_2 + var_124_12 and arg_121_1.time_ < var_124_2 + var_124_12 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play104011035 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 104011035
		arg_125_1.duration_ = 1.999999999999

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play104011036(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1011ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect1011ui_story == nil then
				arg_125_1.var_.characterEffect1011ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.1

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect1011ui_story then
					arg_125_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect1011ui_story then
				arg_125_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_128_4 = arg_125_1.actors_["1084ui_story"]
			local var_128_5 = 0

			if var_128_5 < arg_125_1.time_ and arg_125_1.time_ <= var_128_5 + arg_128_0 and arg_125_1.var_.characterEffect1084ui_story == nil then
				arg_125_1.var_.characterEffect1084ui_story = var_128_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_6 = 0.1

			if var_128_5 <= arg_125_1.time_ and arg_125_1.time_ < var_128_5 + var_128_6 then
				local var_128_7 = (arg_125_1.time_ - var_128_5) / var_128_6

				if arg_125_1.var_.characterEffect1084ui_story then
					arg_125_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_5 + var_128_6 and arg_125_1.time_ < var_128_5 + var_128_6 + arg_128_0 and arg_125_1.var_.characterEffect1084ui_story then
				arg_125_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_128_8 = arg_125_1.actors_["1019ui_story"]
			local var_128_9 = 0

			if var_128_9 < arg_125_1.time_ and arg_125_1.time_ <= var_128_9 + arg_128_0 and arg_125_1.var_.characterEffect1019ui_story == nil then
				arg_125_1.var_.characterEffect1019ui_story = var_128_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_10 = 0.1

			if var_128_9 <= arg_125_1.time_ and arg_125_1.time_ < var_128_9 + var_128_10 then
				local var_128_11 = (arg_125_1.time_ - var_128_9) / var_128_10

				if arg_125_1.var_.characterEffect1019ui_story then
					local var_128_12 = Mathf.Lerp(0, 0.5, var_128_11)

					arg_125_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1019ui_story.fillRatio = var_128_12
				end
			end

			if arg_125_1.time_ >= var_128_9 + var_128_10 and arg_125_1.time_ < var_128_9 + var_128_10 + arg_128_0 and arg_125_1.var_.characterEffect1019ui_story then
				local var_128_13 = 0.5

				arg_125_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1019ui_story.fillRatio = var_128_13
			end

			local var_128_14 = arg_125_1.actors_["1019ui_story"].transform
			local var_128_15 = 0

			if var_128_15 < arg_125_1.time_ and arg_125_1.time_ <= var_128_15 + arg_128_0 then
				arg_125_1.var_.moveOldPos1019ui_story = var_128_14.localPosition
			end

			local var_128_16 = 0.001

			if var_128_15 <= arg_125_1.time_ and arg_125_1.time_ < var_128_15 + var_128_16 then
				local var_128_17 = (arg_125_1.time_ - var_128_15) / var_128_16
				local var_128_18 = Vector3.New(0, 100, 0)

				var_128_14.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1019ui_story, var_128_18, var_128_17)

				local var_128_19 = manager.ui.mainCamera.transform.position - var_128_14.position

				var_128_14.forward = Vector3.New(var_128_19.x, var_128_19.y, var_128_19.z)

				local var_128_20 = var_128_14.localEulerAngles

				var_128_20.z = 0
				var_128_20.x = 0
				var_128_14.localEulerAngles = var_128_20
			end

			if arg_125_1.time_ >= var_128_15 + var_128_16 and arg_125_1.time_ < var_128_15 + var_128_16 + arg_128_0 then
				var_128_14.localPosition = Vector3.New(0, 100, 0)

				local var_128_21 = manager.ui.mainCamera.transform.position - var_128_14.position

				var_128_14.forward = Vector3.New(var_128_21.x, var_128_21.y, var_128_21.z)

				local var_128_22 = var_128_14.localEulerAngles

				var_128_22.z = 0
				var_128_22.x = 0
				var_128_14.localEulerAngles = var_128_22
			end

			local var_128_23 = arg_125_1.actors_["1084ui_story"].transform
			local var_128_24 = 0

			if var_128_24 < arg_125_1.time_ and arg_125_1.time_ <= var_128_24 + arg_128_0 then
				arg_125_1.var_.moveOldPos1084ui_story = var_128_23.localPosition
			end

			local var_128_25 = 0.001

			if var_128_24 <= arg_125_1.time_ and arg_125_1.time_ < var_128_24 + var_128_25 then
				local var_128_26 = (arg_125_1.time_ - var_128_24) / var_128_25
				local var_128_27 = Vector3.New(-0.7, -0.97, -6)

				var_128_23.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1084ui_story, var_128_27, var_128_26)

				local var_128_28 = manager.ui.mainCamera.transform.position - var_128_23.position

				var_128_23.forward = Vector3.New(var_128_28.x, var_128_28.y, var_128_28.z)

				local var_128_29 = var_128_23.localEulerAngles

				var_128_29.z = 0
				var_128_29.x = 0
				var_128_23.localEulerAngles = var_128_29
			end

			if arg_125_1.time_ >= var_128_24 + var_128_25 and arg_125_1.time_ < var_128_24 + var_128_25 + arg_128_0 then
				var_128_23.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_128_30 = manager.ui.mainCamera.transform.position - var_128_23.position

				var_128_23.forward = Vector3.New(var_128_30.x, var_128_30.y, var_128_30.z)

				local var_128_31 = var_128_23.localEulerAngles

				var_128_31.z = 0
				var_128_31.x = 0
				var_128_23.localEulerAngles = var_128_31
			end

			local var_128_32 = arg_125_1.actors_["1011ui_story"].transform
			local var_128_33 = 0

			if var_128_33 < arg_125_1.time_ and arg_125_1.time_ <= var_128_33 + arg_128_0 then
				arg_125_1.var_.moveOldPos1011ui_story = var_128_32.localPosition
			end

			local var_128_34 = 0.001

			if var_128_33 <= arg_125_1.time_ and arg_125_1.time_ < var_128_33 + var_128_34 then
				local var_128_35 = (arg_125_1.time_ - var_128_33) / var_128_34
				local var_128_36 = Vector3.New(0.7, -0.71, -6)

				var_128_32.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1011ui_story, var_128_36, var_128_35)

				local var_128_37 = manager.ui.mainCamera.transform.position - var_128_32.position

				var_128_32.forward = Vector3.New(var_128_37.x, var_128_37.y, var_128_37.z)

				local var_128_38 = var_128_32.localEulerAngles

				var_128_38.z = 0
				var_128_38.x = 0
				var_128_32.localEulerAngles = var_128_38
			end

			if arg_125_1.time_ >= var_128_33 + var_128_34 and arg_125_1.time_ < var_128_33 + var_128_34 + arg_128_0 then
				var_128_32.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_128_39 = manager.ui.mainCamera.transform.position - var_128_32.position

				var_128_32.forward = Vector3.New(var_128_39.x, var_128_39.y, var_128_39.z)

				local var_128_40 = var_128_32.localEulerAngles

				var_128_40.z = 0
				var_128_40.x = 0
				var_128_32.localEulerAngles = var_128_40
			end

			local var_128_41 = 0

			if var_128_41 < arg_125_1.time_ and arg_125_1.time_ <= var_128_41 + arg_128_0 then
				arg_125_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action9_1")
			end

			local var_128_42 = 0

			if var_128_42 < arg_125_1.time_ and arg_125_1.time_ <= var_128_42 + arg_128_0 then
				arg_125_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_1")
			end

			local var_128_43 = 0

			if var_128_43 < arg_125_1.time_ and arg_125_1.time_ <= var_128_43 + arg_128_0 then
				arg_125_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_128_44 = 0
			local var_128_45 = 0.05

			if var_128_44 < arg_125_1.time_ and arg_125_1.time_ <= var_128_44 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_46 = arg_125_1:FormatText(StoryNameCfg[54].name)

				arg_125_1.leftNameTxt_.text = var_128_46

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_47 = arg_125_1:GetWordFromCfg(104011035)
				local var_128_48 = arg_125_1:FormatText(var_128_47.content)

				arg_125_1.text_.text = var_128_48

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_49 = 2
				local var_128_50 = utf8.len(var_128_48)
				local var_128_51 = var_128_49 <= 0 and var_128_45 or var_128_45 * (var_128_50 / var_128_49)

				if var_128_51 > 0 and var_128_45 < var_128_51 then
					arg_125_1.talkMaxDuration = var_128_51

					if var_128_51 + var_128_44 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_51 + var_128_44
					end
				end

				arg_125_1.text_.text = var_128_48
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011035", "story_v_out_104011.awb") ~= 0 then
					local var_128_52 = manager.audio:GetVoiceLength("story_v_out_104011", "104011035", "story_v_out_104011.awb") / 1000

					if var_128_52 + var_128_44 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_52 + var_128_44
					end

					if var_128_47.prefab_name ~= "" and arg_125_1.actors_[var_128_47.prefab_name] ~= nil then
						local var_128_53 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_47.prefab_name].transform, "story_v_out_104011", "104011035", "story_v_out_104011.awb")

						arg_125_1:RecordAudio("104011035", var_128_53)
						arg_125_1:RecordAudio("104011035", var_128_53)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_104011", "104011035", "story_v_out_104011.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_104011", "104011035", "story_v_out_104011.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_54 = math.max(var_128_45, arg_125_1.talkMaxDuration)

			if var_128_44 <= arg_125_1.time_ and arg_125_1.time_ < var_128_44 + var_128_54 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_44) / var_128_54

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_44 + var_128_54 and arg_125_1.time_ < var_128_44 + var_128_54 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play104011036 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 104011036
		arg_129_1.duration_ = 3.5

		local var_129_0 = {
			ja = 3.5,
			ko = 2.1,
			zh = 2.433,
			en = 2.866
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
				arg_129_0:Play104011037(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1019ui_story"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.characterEffect1019ui_story == nil then
				arg_129_1.var_.characterEffect1019ui_story = var_132_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_2 = 0.1

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.characterEffect1019ui_story then
					arg_129_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.characterEffect1019ui_story then
				arg_129_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_132_4 = arg_129_1.actors_["1011ui_story"].transform
			local var_132_5 = 0

			if var_132_5 < arg_129_1.time_ and arg_129_1.time_ <= var_132_5 + arg_132_0 then
				arg_129_1.var_.moveOldPos1011ui_story = var_132_4.localPosition
			end

			local var_132_6 = 0.001

			if var_132_5 <= arg_129_1.time_ and arg_129_1.time_ < var_132_5 + var_132_6 then
				local var_132_7 = (arg_129_1.time_ - var_132_5) / var_132_6
				local var_132_8 = Vector3.New(0, 100, 0)

				var_132_4.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1011ui_story, var_132_8, var_132_7)

				local var_132_9 = manager.ui.mainCamera.transform.position - var_132_4.position

				var_132_4.forward = Vector3.New(var_132_9.x, var_132_9.y, var_132_9.z)

				local var_132_10 = var_132_4.localEulerAngles

				var_132_10.z = 0
				var_132_10.x = 0
				var_132_4.localEulerAngles = var_132_10
			end

			if arg_129_1.time_ >= var_132_5 + var_132_6 and arg_129_1.time_ < var_132_5 + var_132_6 + arg_132_0 then
				var_132_4.localPosition = Vector3.New(0, 100, 0)

				local var_132_11 = manager.ui.mainCamera.transform.position - var_132_4.position

				var_132_4.forward = Vector3.New(var_132_11.x, var_132_11.y, var_132_11.z)

				local var_132_12 = var_132_4.localEulerAngles

				var_132_12.z = 0
				var_132_12.x = 0
				var_132_4.localEulerAngles = var_132_12
			end

			local var_132_13 = arg_129_1.actors_["1084ui_story"].transform
			local var_132_14 = 0

			if var_132_14 < arg_129_1.time_ and arg_129_1.time_ <= var_132_14 + arg_132_0 then
				arg_129_1.var_.moveOldPos1084ui_story = var_132_13.localPosition
			end

			local var_132_15 = 0.001

			if var_132_14 <= arg_129_1.time_ and arg_129_1.time_ < var_132_14 + var_132_15 then
				local var_132_16 = (arg_129_1.time_ - var_132_14) / var_132_15
				local var_132_17 = Vector3.New(0, 100, 0)

				var_132_13.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1084ui_story, var_132_17, var_132_16)

				local var_132_18 = manager.ui.mainCamera.transform.position - var_132_13.position

				var_132_13.forward = Vector3.New(var_132_18.x, var_132_18.y, var_132_18.z)

				local var_132_19 = var_132_13.localEulerAngles

				var_132_19.z = 0
				var_132_19.x = 0
				var_132_13.localEulerAngles = var_132_19
			end

			if arg_129_1.time_ >= var_132_14 + var_132_15 and arg_129_1.time_ < var_132_14 + var_132_15 + arg_132_0 then
				var_132_13.localPosition = Vector3.New(0, 100, 0)

				local var_132_20 = manager.ui.mainCamera.transform.position - var_132_13.position

				var_132_13.forward = Vector3.New(var_132_20.x, var_132_20.y, var_132_20.z)

				local var_132_21 = var_132_13.localEulerAngles

				var_132_21.z = 0
				var_132_21.x = 0
				var_132_13.localEulerAngles = var_132_21
			end

			local var_132_22 = arg_129_1.actors_["1019ui_story"].transform
			local var_132_23 = 0

			if var_132_23 < arg_129_1.time_ and arg_129_1.time_ <= var_132_23 + arg_132_0 then
				arg_129_1.var_.moveOldPos1019ui_story = var_132_22.localPosition
			end

			local var_132_24 = 0.001

			if var_132_23 <= arg_129_1.time_ and arg_129_1.time_ < var_132_23 + var_132_24 then
				local var_132_25 = (arg_129_1.time_ - var_132_23) / var_132_24
				local var_132_26 = Vector3.New(0, -1.08, -5.9)

				var_132_22.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1019ui_story, var_132_26, var_132_25)

				local var_132_27 = manager.ui.mainCamera.transform.position - var_132_22.position

				var_132_22.forward = Vector3.New(var_132_27.x, var_132_27.y, var_132_27.z)

				local var_132_28 = var_132_22.localEulerAngles

				var_132_28.z = 0
				var_132_28.x = 0
				var_132_22.localEulerAngles = var_132_28
			end

			if arg_129_1.time_ >= var_132_23 + var_132_24 and arg_129_1.time_ < var_132_23 + var_132_24 + arg_132_0 then
				var_132_22.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_132_29 = manager.ui.mainCamera.transform.position - var_132_22.position

				var_132_22.forward = Vector3.New(var_132_29.x, var_132_29.y, var_132_29.z)

				local var_132_30 = var_132_22.localEulerAngles

				var_132_30.z = 0
				var_132_30.x = 0
				var_132_22.localEulerAngles = var_132_30
			end

			local var_132_31 = 0

			if var_132_31 < arg_129_1.time_ and arg_129_1.time_ <= var_132_31 + arg_132_0 then
				arg_129_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			local var_132_32 = 0

			if var_132_32 < arg_129_1.time_ and arg_129_1.time_ <= var_132_32 + arg_132_0 then
				arg_129_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_132_33 = 0
			local var_132_34 = 0.25

			if var_132_33 < arg_129_1.time_ and arg_129_1.time_ <= var_132_33 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_35 = arg_129_1:FormatText(StoryNameCfg[13].name)

				arg_129_1.leftNameTxt_.text = var_132_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_36 = arg_129_1:GetWordFromCfg(104011036)
				local var_132_37 = arg_129_1:FormatText(var_132_36.content)

				arg_129_1.text_.text = var_132_37

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_38 = 10
				local var_132_39 = utf8.len(var_132_37)
				local var_132_40 = var_132_38 <= 0 and var_132_34 or var_132_34 * (var_132_39 / var_132_38)

				if var_132_40 > 0 and var_132_34 < var_132_40 then
					arg_129_1.talkMaxDuration = var_132_40

					if var_132_40 + var_132_33 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_40 + var_132_33
					end
				end

				arg_129_1.text_.text = var_132_37
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011036", "story_v_out_104011.awb") ~= 0 then
					local var_132_41 = manager.audio:GetVoiceLength("story_v_out_104011", "104011036", "story_v_out_104011.awb") / 1000

					if var_132_41 + var_132_33 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_41 + var_132_33
					end

					if var_132_36.prefab_name ~= "" and arg_129_1.actors_[var_132_36.prefab_name] ~= nil then
						local var_132_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_36.prefab_name].transform, "story_v_out_104011", "104011036", "story_v_out_104011.awb")

						arg_129_1:RecordAudio("104011036", var_132_42)
						arg_129_1:RecordAudio("104011036", var_132_42)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_104011", "104011036", "story_v_out_104011.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_104011", "104011036", "story_v_out_104011.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_43 = math.max(var_132_34, arg_129_1.talkMaxDuration)

			if var_132_33 <= arg_129_1.time_ and arg_129_1.time_ < var_132_33 + var_132_43 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_33) / var_132_43

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_33 + var_132_43 and arg_129_1.time_ < var_132_33 + var_132_43 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play104011037 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 104011037
		arg_133_1.duration_ = 5.025

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
			arg_133_1.auto_ = false
		end

		function arg_133_1.playNext_(arg_135_0)
			arg_133_1.onStoryFinished_()
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1019ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect1019ui_story == nil then
				arg_133_1.var_.characterEffect1019ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.2

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1019ui_story then
					local var_136_4 = Mathf.Lerp(0, 0.5, var_136_3)

					arg_133_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_133_1.var_.characterEffect1019ui_story.fillRatio = var_136_4
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect1019ui_story then
				local var_136_5 = 0.5

				arg_133_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_133_1.var_.characterEffect1019ui_story.fillRatio = var_136_5
			end

			local var_136_6 = 0
			local var_136_7 = 4.94065645841247e-324

			if var_136_6 < arg_133_1.time_ and arg_133_1.time_ <= var_136_6 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_8 = arg_133_1:FormatText(StoryNameCfg[7].name)

				arg_133_1.leftNameTxt_.text = var_136_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_9 = arg_133_1:GetWordFromCfg(104011037)
				local var_136_10 = arg_133_1:FormatText(var_136_9.content)

				arg_133_1.text_.text = var_136_10

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_11 = 7
				local var_136_12 = utf8.len(var_136_10)
				local var_136_13 = var_136_11 <= 0 and var_136_7 or var_136_7 * (var_136_12 / var_136_11)

				if var_136_13 > 0 and var_136_7 < var_136_13 then
					arg_133_1.talkMaxDuration = var_136_13

					if var_136_13 + var_136_6 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_13 + var_136_6
					end
				end

				arg_133_1.text_.text = var_136_10
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)
				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_14 = math.max(var_136_7, arg_133_1.talkMaxDuration)

			if var_136_6 <= arg_133_1.time_ and arg_133_1.time_ < var_136_6 + var_136_14 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_6) / var_136_14

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_6 + var_136_14 and arg_133_1.time_ < var_136_6 + var_136_14 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end

			local var_136_15 = 0.025
			local var_136_16 = 0.175

			if var_136_15 < arg_133_1.time_ and arg_133_1.time_ <= var_136_15 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_17 = arg_133_1:FormatText(StoryNameCfg[7].name)

				arg_133_1.leftNameTxt_.text = var_136_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_18 = arg_133_1:GetWordFromCfg(104011037)
				local var_136_19 = arg_133_1:FormatText(var_136_18.content)

				arg_133_1.text_.text = var_136_19

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_20 = 7
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
				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_23 = math.max(var_136_16, arg_133_1.talkMaxDuration)

			if var_136_15 <= arg_133_1.time_ and arg_133_1.time_ < var_136_15 + var_136_23 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_15) / var_136_23

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_15 + var_136_23 and arg_133_1.time_ < var_136_15 + var_136_23 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play104011029 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 104011029
		arg_137_1.duration_ = 2.133

		local var_137_0 = {
			ja = 1.999999999999,
			ko = 2,
			zh = 2.133,
			en = 1.999999999999
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
				arg_137_0:Play104011030(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1036ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect1036ui_story == nil then
				arg_137_1.var_.characterEffect1036ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.1

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect1036ui_story then
					arg_137_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect1036ui_story then
				arg_137_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_140_4 = 0

			if var_140_4 < arg_137_1.time_ and arg_137_1.time_ <= var_140_4 + arg_140_0 then
				arg_137_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036actionlink/1036action442")
			end

			local var_140_5 = 0

			if var_140_5 < arg_137_1.time_ and arg_137_1.time_ <= var_140_5 + arg_140_0 then
				arg_137_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_140_6 = 0
			local var_140_7 = 0.25

			if var_140_6 < arg_137_1.time_ and arg_137_1.time_ <= var_140_6 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_8 = arg_137_1:FormatText(StoryNameCfg[5].name)

				arg_137_1.leftNameTxt_.text = var_140_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_9 = arg_137_1:GetWordFromCfg(104011029)
				local var_140_10 = arg_137_1:FormatText(var_140_9.content)

				arg_137_1.text_.text = var_140_10

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_11 = 10
				local var_140_12 = utf8.len(var_140_10)
				local var_140_13 = var_140_11 <= 0 and var_140_7 or var_140_7 * (var_140_12 / var_140_11)

				if var_140_13 > 0 and var_140_7 < var_140_13 then
					arg_137_1.talkMaxDuration = var_140_13

					if var_140_13 + var_140_6 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_13 + var_140_6
					end
				end

				arg_137_1.text_.text = var_140_10
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011029", "story_v_out_104011.awb") ~= 0 then
					local var_140_14 = manager.audio:GetVoiceLength("story_v_out_104011", "104011029", "story_v_out_104011.awb") / 1000

					if var_140_14 + var_140_6 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_14 + var_140_6
					end

					if var_140_9.prefab_name ~= "" and arg_137_1.actors_[var_140_9.prefab_name] ~= nil then
						local var_140_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_9.prefab_name].transform, "story_v_out_104011", "104011029", "story_v_out_104011.awb")

						arg_137_1:RecordAudio("104011029", var_140_15)
						arg_137_1:RecordAudio("104011029", var_140_15)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_104011", "104011029", "story_v_out_104011.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_104011", "104011029", "story_v_out_104011.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_16 = math.max(var_140_7, arg_137_1.talkMaxDuration)

			if var_140_6 <= arg_137_1.time_ and arg_137_1.time_ < var_140_6 + var_140_16 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_6) / var_140_16

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_6 + var_140_16 and arg_137_1.time_ < var_140_6 + var_140_16 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play104011030 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 104011030
		arg_141_1.duration_ = 7.8

		local var_141_0 = {
			ja = 7.8,
			ko = 5.5,
			zh = 6.033,
			en = 6.766
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
				arg_141_0:Play104011031(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_144_1 = 0
			local var_144_2 = 0.875

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_3 = arg_141_1:FormatText(StoryNameCfg[5].name)

				arg_141_1.leftNameTxt_.text = var_144_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_4 = arg_141_1:GetWordFromCfg(104011030)
				local var_144_5 = arg_141_1:FormatText(var_144_4.content)

				arg_141_1.text_.text = var_144_5

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_6 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011030", "story_v_out_104011.awb") ~= 0 then
					local var_144_9 = manager.audio:GetVoiceLength("story_v_out_104011", "104011030", "story_v_out_104011.awb") / 1000

					if var_144_9 + var_144_1 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_9 + var_144_1
					end

					if var_144_4.prefab_name ~= "" and arg_141_1.actors_[var_144_4.prefab_name] ~= nil then
						local var_144_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_4.prefab_name].transform, "story_v_out_104011", "104011030", "story_v_out_104011.awb")

						arg_141_1:RecordAudio("104011030", var_144_10)
						arg_141_1:RecordAudio("104011030", var_144_10)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_104011", "104011030", "story_v_out_104011.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_104011", "104011030", "story_v_out_104011.awb")
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
	Play104011031 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 104011031
		arg_145_1.duration_ = 2.8

		local var_145_0 = {
			ja = 2.8,
			ko = 2.8,
			zh = 2.6,
			en = 2.633
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
				arg_145_0:Play104011032(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1084ui_story"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.characterEffect1084ui_story == nil then
				arg_145_1.var_.characterEffect1084ui_story = var_148_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_2 = 0.1

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.characterEffect1084ui_story then
					arg_145_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and arg_145_1.var_.characterEffect1084ui_story then
				arg_145_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_148_4 = arg_145_1.actors_["1036ui_story"].transform
			local var_148_5 = 0

			if var_148_5 < arg_145_1.time_ and arg_145_1.time_ <= var_148_5 + arg_148_0 then
				arg_145_1.var_.moveOldPos1036ui_story = var_148_4.localPosition
			end

			local var_148_6 = 0.001

			if var_148_5 <= arg_145_1.time_ and arg_145_1.time_ < var_148_5 + var_148_6 then
				local var_148_7 = (arg_145_1.time_ - var_148_5) / var_148_6
				local var_148_8 = Vector3.New(0, 100, 0)

				var_148_4.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1036ui_story, var_148_8, var_148_7)

				local var_148_9 = manager.ui.mainCamera.transform.position - var_148_4.position

				var_148_4.forward = Vector3.New(var_148_9.x, var_148_9.y, var_148_9.z)

				local var_148_10 = var_148_4.localEulerAngles

				var_148_10.z = 0
				var_148_10.x = 0
				var_148_4.localEulerAngles = var_148_10
			end

			if arg_145_1.time_ >= var_148_5 + var_148_6 and arg_145_1.time_ < var_148_5 + var_148_6 + arg_148_0 then
				var_148_4.localPosition = Vector3.New(0, 100, 0)

				local var_148_11 = manager.ui.mainCamera.transform.position - var_148_4.position

				var_148_4.forward = Vector3.New(var_148_11.x, var_148_11.y, var_148_11.z)

				local var_148_12 = var_148_4.localEulerAngles

				var_148_12.z = 0
				var_148_12.x = 0
				var_148_4.localEulerAngles = var_148_12
			end

			local var_148_13 = arg_145_1.actors_["1084ui_story"].transform
			local var_148_14 = 0

			if var_148_14 < arg_145_1.time_ and arg_145_1.time_ <= var_148_14 + arg_148_0 then
				arg_145_1.var_.moveOldPos1084ui_story = var_148_13.localPosition
			end

			local var_148_15 = 0.001

			if var_148_14 <= arg_145_1.time_ and arg_145_1.time_ < var_148_14 + var_148_15 then
				local var_148_16 = (arg_145_1.time_ - var_148_14) / var_148_15
				local var_148_17 = Vector3.New(0, -0.97, -6)

				var_148_13.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1084ui_story, var_148_17, var_148_16)

				local var_148_18 = manager.ui.mainCamera.transform.position - var_148_13.position

				var_148_13.forward = Vector3.New(var_148_18.x, var_148_18.y, var_148_18.z)

				local var_148_19 = var_148_13.localEulerAngles

				var_148_19.z = 0
				var_148_19.x = 0
				var_148_13.localEulerAngles = var_148_19
			end

			if arg_145_1.time_ >= var_148_14 + var_148_15 and arg_145_1.time_ < var_148_14 + var_148_15 + arg_148_0 then
				var_148_13.localPosition = Vector3.New(0, -0.97, -6)

				local var_148_20 = manager.ui.mainCamera.transform.position - var_148_13.position

				var_148_13.forward = Vector3.New(var_148_20.x, var_148_20.y, var_148_20.z)

				local var_148_21 = var_148_13.localEulerAngles

				var_148_21.z = 0
				var_148_21.x = 0
				var_148_13.localEulerAngles = var_148_21
			end

			local var_148_22 = 0

			if var_148_22 < arg_145_1.time_ and arg_145_1.time_ <= var_148_22 + arg_148_0 then
				arg_145_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_148_23 = 0

			if var_148_23 < arg_145_1.time_ and arg_145_1.time_ <= var_148_23 + arg_148_0 then
				arg_145_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_148_24 = 0
			local var_148_25 = 0.175

			if var_148_24 < arg_145_1.time_ and arg_145_1.time_ <= var_148_24 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_26 = arg_145_1:FormatText(StoryNameCfg[6].name)

				arg_145_1.leftNameTxt_.text = var_148_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_27 = arg_145_1:GetWordFromCfg(104011031)
				local var_148_28 = arg_145_1:FormatText(var_148_27.content)

				arg_145_1.text_.text = var_148_28

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_29 = 7
				local var_148_30 = utf8.len(var_148_28)
				local var_148_31 = var_148_29 <= 0 and var_148_25 or var_148_25 * (var_148_30 / var_148_29)

				if var_148_31 > 0 and var_148_25 < var_148_31 then
					arg_145_1.talkMaxDuration = var_148_31

					if var_148_31 + var_148_24 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_31 + var_148_24
					end
				end

				arg_145_1.text_.text = var_148_28
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011031", "story_v_out_104011.awb") ~= 0 then
					local var_148_32 = manager.audio:GetVoiceLength("story_v_out_104011", "104011031", "story_v_out_104011.awb") / 1000

					if var_148_32 + var_148_24 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_32 + var_148_24
					end

					if var_148_27.prefab_name ~= "" and arg_145_1.actors_[var_148_27.prefab_name] ~= nil then
						local var_148_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_27.prefab_name].transform, "story_v_out_104011", "104011031", "story_v_out_104011.awb")

						arg_145_1:RecordAudio("104011031", var_148_33)
						arg_145_1:RecordAudio("104011031", var_148_33)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_104011", "104011031", "story_v_out_104011.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_104011", "104011031", "story_v_out_104011.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_34 = math.max(var_148_25, arg_145_1.talkMaxDuration)

			if var_148_24 <= arg_145_1.time_ and arg_145_1.time_ < var_148_24 + var_148_34 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_24) / var_148_34

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_24 + var_148_34 and arg_145_1.time_ < var_148_24 + var_148_34 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play104011032 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 104011032
		arg_149_1.duration_ = 4.4

		local var_149_0 = {
			ja = 4.4,
			ko = 2.566,
			zh = 3.833,
			en = 2.833
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
				arg_149_0:Play104011033(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1036ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect1036ui_story == nil then
				arg_149_1.var_.characterEffect1036ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.1

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect1036ui_story then
					arg_149_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect1036ui_story then
				arg_149_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_152_4 = arg_149_1.actors_["1084ui_story"]
			local var_152_5 = 0

			if var_152_5 < arg_149_1.time_ and arg_149_1.time_ <= var_152_5 + arg_152_0 and arg_149_1.var_.characterEffect1084ui_story == nil then
				arg_149_1.var_.characterEffect1084ui_story = var_152_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_6 = 0.1

			if var_152_5 <= arg_149_1.time_ and arg_149_1.time_ < var_152_5 + var_152_6 then
				local var_152_7 = (arg_149_1.time_ - var_152_5) / var_152_6

				if arg_149_1.var_.characterEffect1084ui_story then
					local var_152_8 = Mathf.Lerp(0, 0.5, var_152_7)

					arg_149_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_149_1.var_.characterEffect1084ui_story.fillRatio = var_152_8
				end
			end

			if arg_149_1.time_ >= var_152_5 + var_152_6 and arg_149_1.time_ < var_152_5 + var_152_6 + arg_152_0 and arg_149_1.var_.characterEffect1084ui_story then
				local var_152_9 = 0.5

				arg_149_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_149_1.var_.characterEffect1084ui_story.fillRatio = var_152_9
			end

			local var_152_10 = arg_149_1.actors_["1084ui_story"].transform
			local var_152_11 = 0

			if var_152_11 < arg_149_1.time_ and arg_149_1.time_ <= var_152_11 + arg_152_0 then
				arg_149_1.var_.moveOldPos1084ui_story = var_152_10.localPosition
			end

			local var_152_12 = 0.001

			if var_152_11 <= arg_149_1.time_ and arg_149_1.time_ < var_152_11 + var_152_12 then
				local var_152_13 = (arg_149_1.time_ - var_152_11) / var_152_12
				local var_152_14 = Vector3.New(0, 100, 0)

				var_152_10.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos1084ui_story, var_152_14, var_152_13)

				local var_152_15 = manager.ui.mainCamera.transform.position - var_152_10.position

				var_152_10.forward = Vector3.New(var_152_15.x, var_152_15.y, var_152_15.z)

				local var_152_16 = var_152_10.localEulerAngles

				var_152_16.z = 0
				var_152_16.x = 0
				var_152_10.localEulerAngles = var_152_16
			end

			if arg_149_1.time_ >= var_152_11 + var_152_12 and arg_149_1.time_ < var_152_11 + var_152_12 + arg_152_0 then
				var_152_10.localPosition = Vector3.New(0, 100, 0)

				local var_152_17 = manager.ui.mainCamera.transform.position - var_152_10.position

				var_152_10.forward = Vector3.New(var_152_17.x, var_152_17.y, var_152_17.z)

				local var_152_18 = var_152_10.localEulerAngles

				var_152_18.z = 0
				var_152_18.x = 0
				var_152_10.localEulerAngles = var_152_18
			end

			local var_152_19 = 0

			if var_152_19 < arg_149_1.time_ and arg_149_1.time_ <= var_152_19 + arg_152_0 then
				arg_149_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action5_1")
			end

			local var_152_20 = arg_149_1.actors_["1036ui_story"].transform
			local var_152_21 = 0

			if var_152_21 < arg_149_1.time_ and arg_149_1.time_ <= var_152_21 + arg_152_0 then
				arg_149_1.var_.moveOldPos1036ui_story = var_152_20.localPosition
			end

			local var_152_22 = 0.001

			if var_152_21 <= arg_149_1.time_ and arg_149_1.time_ < var_152_21 + var_152_22 then
				local var_152_23 = (arg_149_1.time_ - var_152_21) / var_152_22
				local var_152_24 = Vector3.New(0, -1.09, -5.78)

				var_152_20.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos1036ui_story, var_152_24, var_152_23)

				local var_152_25 = manager.ui.mainCamera.transform.position - var_152_20.position

				var_152_20.forward = Vector3.New(var_152_25.x, var_152_25.y, var_152_25.z)

				local var_152_26 = var_152_20.localEulerAngles

				var_152_26.z = 0
				var_152_26.x = 0
				var_152_20.localEulerAngles = var_152_26
			end

			if arg_149_1.time_ >= var_152_21 + var_152_22 and arg_149_1.time_ < var_152_21 + var_152_22 + arg_152_0 then
				var_152_20.localPosition = Vector3.New(0, -1.09, -5.78)

				local var_152_27 = manager.ui.mainCamera.transform.position - var_152_20.position

				var_152_20.forward = Vector3.New(var_152_27.x, var_152_27.y, var_152_27.z)

				local var_152_28 = var_152_20.localEulerAngles

				var_152_28.z = 0
				var_152_28.x = 0
				var_152_20.localEulerAngles = var_152_28
			end

			local var_152_29 = 0

			if var_152_29 < arg_149_1.time_ and arg_149_1.time_ <= var_152_29 + arg_152_0 then
				arg_149_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action7_1")
			end

			local var_152_30 = 0

			if var_152_30 < arg_149_1.time_ and arg_149_1.time_ <= var_152_30 + arg_152_0 then
				arg_149_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_152_31 = 0
			local var_152_32 = 0.475

			if var_152_31 < arg_149_1.time_ and arg_149_1.time_ <= var_152_31 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_33 = arg_149_1:FormatText(StoryNameCfg[5].name)

				arg_149_1.leftNameTxt_.text = var_152_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_34 = arg_149_1:GetWordFromCfg(104011032)
				local var_152_35 = arg_149_1:FormatText(var_152_34.content)

				arg_149_1.text_.text = var_152_35

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_36 = 16
				local var_152_37 = utf8.len(var_152_35)
				local var_152_38 = var_152_36 <= 0 and var_152_32 or var_152_32 * (var_152_37 / var_152_36)

				if var_152_38 > 0 and var_152_32 < var_152_38 then
					arg_149_1.talkMaxDuration = var_152_38

					if var_152_38 + var_152_31 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_38 + var_152_31
					end
				end

				arg_149_1.text_.text = var_152_35
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104011", "104011032", "story_v_out_104011.awb") ~= 0 then
					local var_152_39 = manager.audio:GetVoiceLength("story_v_out_104011", "104011032", "story_v_out_104011.awb") / 1000

					if var_152_39 + var_152_31 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_39 + var_152_31
					end

					if var_152_34.prefab_name ~= "" and arg_149_1.actors_[var_152_34.prefab_name] ~= nil then
						local var_152_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_34.prefab_name].transform, "story_v_out_104011", "104011032", "story_v_out_104011.awb")

						arg_149_1:RecordAudio("104011032", var_152_40)
						arg_149_1:RecordAudio("104011032", var_152_40)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_104011", "104011032", "story_v_out_104011.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_104011", "104011032", "story_v_out_104011.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_41 = math.max(var_152_32, arg_149_1.talkMaxDuration)

			if var_152_31 <= arg_149_1.time_ and arg_149_1.time_ < var_152_31 + var_152_41 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_31) / var_152_41

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_31 + var_152_41 and arg_149_1.time_ < var_152_31 + var_152_41 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0103",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B03d"
	},
	voices = {
		"story_v_out_104011.awb"
	}
}
