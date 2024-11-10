return {
	Play410241001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 410241001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play410241002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST67"

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
				local var_4_5 = arg_1_1.bgs_.ST67

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
					if iter_4_0 ~= "ST67" then
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
			local var_4_23 = 0.166666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.3
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_8_story_tara_building", "bgm_activity_2_8_story_tara_building", "bgm_activity_2_8_story_tara_building.awb")
			end

			local var_4_30 = 0
			local var_4_31 = 1

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "effect"

				arg_1_1:AudioAction(var_4_32, var_4_33, "se_story_side_1070", "se_story_1070_cave_drip", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.075

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

				local var_4_37 = arg_1_1:GetWordFromCfg(410241001)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_39 = 3
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
	Play410241002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 410241002
		arg_7_1.duration_ = 3.733

		local var_7_0 = {
			ja = 1.166,
			CriLanguages = 3.733,
			zh = 3.733
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
				arg_7_0:Play410241003(arg_7_1)
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

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[612].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1061_split_3")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(410241002)
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

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241002", "story_v_out_410241.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_410241", "410241002", "story_v_out_410241.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_410241", "410241002", "story_v_out_410241.awb")

						arg_7_1:RecordAudio("410241002", var_10_9)
						arg_7_1:RecordAudio("410241002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_410241", "410241002", "story_v_out_410241.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_410241", "410241002", "story_v_out_410241.awb")
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
	Play410241003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 410241003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play410241004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.825

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

				local var_14_2 = arg_11_1:GetWordFromCfg(410241003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 33
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
	Play410241004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 410241004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play410241005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1.375

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

				local var_18_2 = arg_15_1:GetWordFromCfg(410241004)
				local var_18_3 = arg_15_1:FormatText(var_18_2.content)

				arg_15_1.text_.text = var_18_3

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_4 = 55
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
	Play410241005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 410241005
		arg_19_1.duration_ = 6.733

		local var_19_0 = {
			ja = 6.733,
			CriLanguages = 5.2,
			zh = 5.2
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
				arg_19_0:Play410241006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "1061"

			if arg_19_1.actors_[var_22_0] == nil then
				local var_22_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_22_0), arg_19_1.canvasGo_.transform)

				var_22_1.transform:SetSiblingIndex(1)

				var_22_1.name = var_22_0
				var_22_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_19_1.actors_[var_22_0] = var_22_1
			end

			local var_22_2 = arg_19_1.actors_["1061"].transform
			local var_22_3 = 0

			if var_22_3 < arg_19_1.time_ and arg_19_1.time_ <= var_22_3 + arg_22_0 then
				arg_19_1.var_.moveOldPos1061 = var_22_2.localPosition
				var_22_2.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("1061", 3)

				local var_22_4 = var_22_2.childCount

				for iter_22_0 = 0, var_22_4 - 1 do
					local var_22_5 = var_22_2:GetChild(iter_22_0)

					if var_22_5.name == "" or not string.find(var_22_5.name, "split") then
						var_22_5.gameObject:SetActive(true)
					else
						var_22_5.gameObject:SetActive(false)
					end
				end
			end

			local var_22_6 = 0.001

			if var_22_3 <= arg_19_1.time_ and arg_19_1.time_ < var_22_3 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_3) / var_22_6
				local var_22_8 = Vector3.New(0, -490, 18)

				var_22_2.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1061, var_22_8, var_22_7)
			end

			if arg_19_1.time_ >= var_22_3 + var_22_6 and arg_19_1.time_ < var_22_3 + var_22_6 + arg_22_0 then
				var_22_2.localPosition = Vector3.New(0, -490, 18)
			end

			local var_22_9 = arg_19_1.actors_["1061"]
			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 and arg_19_1.var_.actorSpriteComps1061 == nil then
				arg_19_1.var_.actorSpriteComps1061 = var_22_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_11 = 0.034

			if var_22_10 <= arg_19_1.time_ and arg_19_1.time_ < var_22_10 + var_22_11 then
				local var_22_12 = (arg_19_1.time_ - var_22_10) / var_22_11

				if arg_19_1.var_.actorSpriteComps1061 then
					for iter_22_1, iter_22_2 in pairs(arg_19_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_22_2 then
							local var_22_13 = Mathf.Lerp(iter_22_2.color.r, 1, var_22_12)

							iter_22_2.color = Color.New(var_22_13, var_22_13, var_22_13)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_10 + var_22_11 and arg_19_1.time_ < var_22_10 + var_22_11 + arg_22_0 and arg_19_1.var_.actorSpriteComps1061 then
				local var_22_14 = 1

				for iter_22_3, iter_22_4 in pairs(arg_19_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_22_4 then
						iter_22_4.color = Color.New(var_22_14, var_22_14, var_22_14)
					end
				end

				arg_19_1.var_.actorSpriteComps1061 = nil
			end

			local var_22_15 = 0
			local var_22_16 = 0.166666666666667

			if var_22_15 < arg_19_1.time_ and arg_19_1.time_ <= var_22_15 + arg_22_0 then
				local var_22_17 = "stop"
				local var_22_18 = "effect"

				arg_19_1:AudioAction(var_22_17, var_22_18, "se_story_side_1070", "se_story_1070_cave_drip", "")
			end

			local var_22_19 = 0
			local var_22_20 = 0.275

			if var_22_19 < arg_19_1.time_ and arg_19_1.time_ <= var_22_19 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_21 = arg_19_1:FormatText(StoryNameCfg[612].name)

				arg_19_1.leftNameTxt_.text = var_22_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_22 = arg_19_1:GetWordFromCfg(410241005)
				local var_22_23 = arg_19_1:FormatText(var_22_22.content)

				arg_19_1.text_.text = var_22_23

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_24 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241005", "story_v_out_410241.awb") ~= 0 then
					local var_22_27 = manager.audio:GetVoiceLength("story_v_out_410241", "410241005", "story_v_out_410241.awb") / 1000

					if var_22_27 + var_22_19 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_27 + var_22_19
					end

					if var_22_22.prefab_name ~= "" and arg_19_1.actors_[var_22_22.prefab_name] ~= nil then
						local var_22_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_22.prefab_name].transform, "story_v_out_410241", "410241005", "story_v_out_410241.awb")

						arg_19_1:RecordAudio("410241005", var_22_28)
						arg_19_1:RecordAudio("410241005", var_22_28)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_410241", "410241005", "story_v_out_410241.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_410241", "410241005", "story_v_out_410241.awb")
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
	Play410241006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 410241006
		arg_23_1.duration_ = 4.033

		local var_23_0 = {
			ja = 4.033,
			CriLanguages = 2.2,
			zh = 2.2
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
				arg_23_0:Play410241007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "10060"

			if arg_23_1.actors_[var_26_0] == nil then
				local var_26_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_26_0), arg_23_1.canvasGo_.transform)

				var_26_1.transform:SetSiblingIndex(1)

				var_26_1.name = var_26_0
				var_26_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_23_1.actors_[var_26_0] = var_26_1
			end

			local var_26_2 = arg_23_1.actors_["10060"].transform
			local var_26_3 = 0

			if var_26_3 < arg_23_1.time_ and arg_23_1.time_ <= var_26_3 + arg_26_0 then
				arg_23_1.var_.moveOldPos10060 = var_26_2.localPosition
				var_26_2.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("10060", 3)

				local var_26_4 = var_26_2.childCount

				for iter_26_0 = 0, var_26_4 - 1 do
					local var_26_5 = var_26_2:GetChild(iter_26_0)

					if var_26_5.name == "" or not string.find(var_26_5.name, "split") then
						var_26_5.gameObject:SetActive(true)
					else
						var_26_5.gameObject:SetActive(false)
					end
				end
			end

			local var_26_6 = 0.001

			if var_26_3 <= arg_23_1.time_ and arg_23_1.time_ < var_26_3 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_3) / var_26_6
				local var_26_8 = Vector3.New(0, -400, 0)

				var_26_2.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos10060, var_26_8, var_26_7)
			end

			if arg_23_1.time_ >= var_26_3 + var_26_6 and arg_23_1.time_ < var_26_3 + var_26_6 + arg_26_0 then
				var_26_2.localPosition = Vector3.New(0, -400, 0)
			end

			local var_26_9 = arg_23_1.actors_["1061"].transform
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 then
				arg_23_1.var_.moveOldPos1061 = var_26_9.localPosition
				var_26_9.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("1061", 7)

				local var_26_11 = var_26_9.childCount

				for iter_26_1 = 0, var_26_11 - 1 do
					local var_26_12 = var_26_9:GetChild(iter_26_1)

					if var_26_12.name == "" or not string.find(var_26_12.name, "split") then
						var_26_12.gameObject:SetActive(true)
					else
						var_26_12.gameObject:SetActive(false)
					end
				end
			end

			local var_26_13 = 0.001

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_13 then
				local var_26_14 = (arg_23_1.time_ - var_26_10) / var_26_13
				local var_26_15 = Vector3.New(0, -2000, 18)

				var_26_9.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1061, var_26_15, var_26_14)
			end

			if arg_23_1.time_ >= var_26_10 + var_26_13 and arg_23_1.time_ < var_26_10 + var_26_13 + arg_26_0 then
				var_26_9.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_26_16 = arg_23_1.actors_["10060"]
			local var_26_17 = 0

			if var_26_17 < arg_23_1.time_ and arg_23_1.time_ <= var_26_17 + arg_26_0 and arg_23_1.var_.actorSpriteComps10060 == nil then
				arg_23_1.var_.actorSpriteComps10060 = var_26_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_18 = 0.034

			if var_26_17 <= arg_23_1.time_ and arg_23_1.time_ < var_26_17 + var_26_18 then
				local var_26_19 = (arg_23_1.time_ - var_26_17) / var_26_18

				if arg_23_1.var_.actorSpriteComps10060 then
					for iter_26_2, iter_26_3 in pairs(arg_23_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_26_3 then
							local var_26_20 = Mathf.Lerp(iter_26_3.color.r, 1, var_26_19)

							iter_26_3.color = Color.New(var_26_20, var_26_20, var_26_20)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_17 + var_26_18 and arg_23_1.time_ < var_26_17 + var_26_18 + arg_26_0 and arg_23_1.var_.actorSpriteComps10060 then
				local var_26_21 = 1

				for iter_26_4, iter_26_5 in pairs(arg_23_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_26_5 then
						iter_26_5.color = Color.New(var_26_21, var_26_21, var_26_21)
					end
				end

				arg_23_1.var_.actorSpriteComps10060 = nil
			end

			local var_26_22 = arg_23_1.actors_["1061"]
			local var_26_23 = 0

			if var_26_23 < arg_23_1.time_ and arg_23_1.time_ <= var_26_23 + arg_26_0 and arg_23_1.var_.actorSpriteComps1061 == nil then
				arg_23_1.var_.actorSpriteComps1061 = var_26_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_24 = 0.034

			if var_26_23 <= arg_23_1.time_ and arg_23_1.time_ < var_26_23 + var_26_24 then
				local var_26_25 = (arg_23_1.time_ - var_26_23) / var_26_24

				if arg_23_1.var_.actorSpriteComps1061 then
					for iter_26_6, iter_26_7 in pairs(arg_23_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_26_7 then
							local var_26_26 = Mathf.Lerp(iter_26_7.color.r, 0.5, var_26_25)

							iter_26_7.color = Color.New(var_26_26, var_26_26, var_26_26)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_23 + var_26_24 and arg_23_1.time_ < var_26_23 + var_26_24 + arg_26_0 and arg_23_1.var_.actorSpriteComps1061 then
				local var_26_27 = 0.5

				for iter_26_8, iter_26_9 in pairs(arg_23_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_26_9 then
						iter_26_9.color = Color.New(var_26_27, var_26_27, var_26_27)
					end
				end

				arg_23_1.var_.actorSpriteComps1061 = nil
			end

			local var_26_28 = 0
			local var_26_29 = 0.125

			if var_26_28 < arg_23_1.time_ and arg_23_1.time_ <= var_26_28 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_30 = arg_23_1:FormatText(StoryNameCfg[597].name)

				arg_23_1.leftNameTxt_.text = var_26_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_31 = arg_23_1:GetWordFromCfg(410241006)
				local var_26_32 = arg_23_1:FormatText(var_26_31.content)

				arg_23_1.text_.text = var_26_32

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_33 = 5
				local var_26_34 = utf8.len(var_26_32)
				local var_26_35 = var_26_33 <= 0 and var_26_29 or var_26_29 * (var_26_34 / var_26_33)

				if var_26_35 > 0 and var_26_29 < var_26_35 then
					arg_23_1.talkMaxDuration = var_26_35

					if var_26_35 + var_26_28 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_35 + var_26_28
					end
				end

				arg_23_1.text_.text = var_26_32
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241006", "story_v_out_410241.awb") ~= 0 then
					local var_26_36 = manager.audio:GetVoiceLength("story_v_out_410241", "410241006", "story_v_out_410241.awb") / 1000

					if var_26_36 + var_26_28 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_36 + var_26_28
					end

					if var_26_31.prefab_name ~= "" and arg_23_1.actors_[var_26_31.prefab_name] ~= nil then
						local var_26_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_31.prefab_name].transform, "story_v_out_410241", "410241006", "story_v_out_410241.awb")

						arg_23_1:RecordAudio("410241006", var_26_37)
						arg_23_1:RecordAudio("410241006", var_26_37)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_410241", "410241006", "story_v_out_410241.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_410241", "410241006", "story_v_out_410241.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_38 = math.max(var_26_29, arg_23_1.talkMaxDuration)

			if var_26_28 <= arg_23_1.time_ and arg_23_1.time_ < var_26_28 + var_26_38 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_28) / var_26_38

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_28 + var_26_38 and arg_23_1.time_ < var_26_28 + var_26_38 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play410241007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 410241007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play410241008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10060"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.actorSpriteComps10060 == nil then
				arg_27_1.var_.actorSpriteComps10060 = var_30_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_2 = 0.034

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.actorSpriteComps10060 then
					for iter_30_0, iter_30_1 in pairs(arg_27_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_30_1 then
							local var_30_4 = Mathf.Lerp(iter_30_1.color.r, 0.5, var_30_3)

							iter_30_1.color = Color.New(var_30_4, var_30_4, var_30_4)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.actorSpriteComps10060 then
				local var_30_5 = 0.5

				for iter_30_2, iter_30_3 in pairs(arg_27_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_30_3 then
						iter_30_3.color = Color.New(var_30_5, var_30_5, var_30_5)
					end
				end

				arg_27_1.var_.actorSpriteComps10060 = nil
			end

			local var_30_6 = 0
			local var_30_7 = 0.825

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_8 = arg_27_1:GetWordFromCfg(410241007)
				local var_30_9 = arg_27_1:FormatText(var_30_8.content)

				arg_27_1.text_.text = var_30_9

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_10 = 33
				local var_30_11 = utf8.len(var_30_9)
				local var_30_12 = var_30_10 <= 0 and var_30_7 or var_30_7 * (var_30_11 / var_30_10)

				if var_30_12 > 0 and var_30_7 < var_30_12 then
					arg_27_1.talkMaxDuration = var_30_12

					if var_30_12 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_12 + var_30_6
					end
				end

				arg_27_1.text_.text = var_30_9
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_13 = math.max(var_30_7, arg_27_1.talkMaxDuration)

			if var_30_6 <= arg_27_1.time_ and arg_27_1.time_ < var_30_6 + var_30_13 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_6) / var_30_13

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_6 + var_30_13 and arg_27_1.time_ < var_30_6 + var_30_13 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play410241008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 410241008
		arg_31_1.duration_ = 1.966

		local var_31_0 = {
			ja = 1.966,
			CriLanguages = 1.333,
			zh = 1.333
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
				arg_31_0:Play410241009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10060"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos10060 = var_34_0.localPosition
				var_34_0.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("10060", 3)

				local var_34_2 = var_34_0.childCount

				for iter_34_0 = 0, var_34_2 - 1 do
					local var_34_3 = var_34_0:GetChild(iter_34_0)

					if var_34_3.name == "split_5" or not string.find(var_34_3.name, "split") then
						var_34_3.gameObject:SetActive(true)
					else
						var_34_3.gameObject:SetActive(false)
					end
				end
			end

			local var_34_4 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_4 then
				local var_34_5 = (arg_31_1.time_ - var_34_1) / var_34_4
				local var_34_6 = Vector3.New(0, -400, 0)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10060, var_34_6, var_34_5)
			end

			if arg_31_1.time_ >= var_34_1 + var_34_4 and arg_31_1.time_ < var_34_1 + var_34_4 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, -400, 0)
			end

			local var_34_7 = arg_31_1.actors_["10060"]
			local var_34_8 = 0

			if var_34_8 < arg_31_1.time_ and arg_31_1.time_ <= var_34_8 + arg_34_0 and arg_31_1.var_.actorSpriteComps10060 == nil then
				arg_31_1.var_.actorSpriteComps10060 = var_34_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_9 = 0.034

			if var_34_8 <= arg_31_1.time_ and arg_31_1.time_ < var_34_8 + var_34_9 then
				local var_34_10 = (arg_31_1.time_ - var_34_8) / var_34_9

				if arg_31_1.var_.actorSpriteComps10060 then
					for iter_34_1, iter_34_2 in pairs(arg_31_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_34_2 then
							local var_34_11 = Mathf.Lerp(iter_34_2.color.r, 1, var_34_10)

							iter_34_2.color = Color.New(var_34_11, var_34_11, var_34_11)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_8 + var_34_9 and arg_31_1.time_ < var_34_8 + var_34_9 + arg_34_0 and arg_31_1.var_.actorSpriteComps10060 then
				local var_34_12 = 1

				for iter_34_3, iter_34_4 in pairs(arg_31_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_34_4 then
						iter_34_4.color = Color.New(var_34_12, var_34_12, var_34_12)
					end
				end

				arg_31_1.var_.actorSpriteComps10060 = nil
			end

			local var_34_13 = 0
			local var_34_14 = 0.25

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_15 = arg_31_1:FormatText(StoryNameCfg[597].name)

				arg_31_1.leftNameTxt_.text = var_34_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_16 = arg_31_1:GetWordFromCfg(410241008)
				local var_34_17 = arg_31_1:FormatText(var_34_16.content)

				arg_31_1.text_.text = var_34_17

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_18 = 10
				local var_34_19 = utf8.len(var_34_17)
				local var_34_20 = var_34_18 <= 0 and var_34_14 or var_34_14 * (var_34_19 / var_34_18)

				if var_34_20 > 0 and var_34_14 < var_34_20 then
					arg_31_1.talkMaxDuration = var_34_20

					if var_34_20 + var_34_13 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_20 + var_34_13
					end
				end

				arg_31_1.text_.text = var_34_17
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241008", "story_v_out_410241.awb") ~= 0 then
					local var_34_21 = manager.audio:GetVoiceLength("story_v_out_410241", "410241008", "story_v_out_410241.awb") / 1000

					if var_34_21 + var_34_13 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_21 + var_34_13
					end

					if var_34_16.prefab_name ~= "" and arg_31_1.actors_[var_34_16.prefab_name] ~= nil then
						local var_34_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_16.prefab_name].transform, "story_v_out_410241", "410241008", "story_v_out_410241.awb")

						arg_31_1:RecordAudio("410241008", var_34_22)
						arg_31_1:RecordAudio("410241008", var_34_22)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_410241", "410241008", "story_v_out_410241.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_410241", "410241008", "story_v_out_410241.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_23 = math.max(var_34_14, arg_31_1.talkMaxDuration)

			if var_34_13 <= arg_31_1.time_ and arg_31_1.time_ < var_34_13 + var_34_23 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_13) / var_34_23

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_13 + var_34_23 and arg_31_1.time_ < var_34_13 + var_34_23 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play410241009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 410241009
		arg_35_1.duration_ = 3.533

		local var_35_0 = {
			ja = 2.933,
			CriLanguages = 3.533,
			zh = 3.533
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
				arg_35_0:Play410241010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1061"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1061 = var_38_0.localPosition
				var_38_0.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("1061", 2)

				local var_38_2 = var_38_0.childCount

				for iter_38_0 = 0, var_38_2 - 1 do
					local var_38_3 = var_38_0:GetChild(iter_38_0)

					if var_38_3.name == "split_5" or not string.find(var_38_3.name, "split") then
						var_38_3.gameObject:SetActive(true)
					else
						var_38_3.gameObject:SetActive(false)
					end
				end
			end

			local var_38_4 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_4 then
				local var_38_5 = (arg_35_1.time_ - var_38_1) / var_38_4
				local var_38_6 = Vector3.New(-390, -490, 18)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1061, var_38_6, var_38_5)
			end

			if arg_35_1.time_ >= var_38_1 + var_38_4 and arg_35_1.time_ < var_38_1 + var_38_4 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_38_7 = arg_35_1.actors_["10060"].transform
			local var_38_8 = 0

			if var_38_8 < arg_35_1.time_ and arg_35_1.time_ <= var_38_8 + arg_38_0 then
				arg_35_1.var_.moveOldPos10060 = var_38_7.localPosition
				var_38_7.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("10060", 4)

				local var_38_9 = var_38_7.childCount

				for iter_38_1 = 0, var_38_9 - 1 do
					local var_38_10 = var_38_7:GetChild(iter_38_1)

					if var_38_10.name == "" or not string.find(var_38_10.name, "split") then
						var_38_10.gameObject:SetActive(true)
					else
						var_38_10.gameObject:SetActive(false)
					end
				end
			end

			local var_38_11 = 0.001

			if var_38_8 <= arg_35_1.time_ and arg_35_1.time_ < var_38_8 + var_38_11 then
				local var_38_12 = (arg_35_1.time_ - var_38_8) / var_38_11
				local var_38_13 = Vector3.New(390, -400, 0)

				var_38_7.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos10060, var_38_13, var_38_12)
			end

			if arg_35_1.time_ >= var_38_8 + var_38_11 and arg_35_1.time_ < var_38_8 + var_38_11 + arg_38_0 then
				var_38_7.localPosition = Vector3.New(390, -400, 0)
			end

			local var_38_14 = arg_35_1.actors_["1061"]
			local var_38_15 = 0

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 and arg_35_1.var_.actorSpriteComps1061 == nil then
				arg_35_1.var_.actorSpriteComps1061 = var_38_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_16 = 0.034

			if var_38_15 <= arg_35_1.time_ and arg_35_1.time_ < var_38_15 + var_38_16 then
				local var_38_17 = (arg_35_1.time_ - var_38_15) / var_38_16

				if arg_35_1.var_.actorSpriteComps1061 then
					for iter_38_2, iter_38_3 in pairs(arg_35_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_38_3 then
							local var_38_18 = Mathf.Lerp(iter_38_3.color.r, 1, var_38_17)

							iter_38_3.color = Color.New(var_38_18, var_38_18, var_38_18)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_15 + var_38_16 and arg_35_1.time_ < var_38_15 + var_38_16 + arg_38_0 and arg_35_1.var_.actorSpriteComps1061 then
				local var_38_19 = 1

				for iter_38_4, iter_38_5 in pairs(arg_35_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_38_5 then
						iter_38_5.color = Color.New(var_38_19, var_38_19, var_38_19)
					end
				end

				arg_35_1.var_.actorSpriteComps1061 = nil
			end

			local var_38_20 = arg_35_1.actors_["10060"]
			local var_38_21 = 0

			if var_38_21 < arg_35_1.time_ and arg_35_1.time_ <= var_38_21 + arg_38_0 and arg_35_1.var_.actorSpriteComps10060 == nil then
				arg_35_1.var_.actorSpriteComps10060 = var_38_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_22 = 0.034

			if var_38_21 <= arg_35_1.time_ and arg_35_1.time_ < var_38_21 + var_38_22 then
				local var_38_23 = (arg_35_1.time_ - var_38_21) / var_38_22

				if arg_35_1.var_.actorSpriteComps10060 then
					for iter_38_6, iter_38_7 in pairs(arg_35_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_38_7 then
							local var_38_24 = Mathf.Lerp(iter_38_7.color.r, 0.5, var_38_23)

							iter_38_7.color = Color.New(var_38_24, var_38_24, var_38_24)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_21 + var_38_22 and arg_35_1.time_ < var_38_21 + var_38_22 + arg_38_0 and arg_35_1.var_.actorSpriteComps10060 then
				local var_38_25 = 0.5

				for iter_38_8, iter_38_9 in pairs(arg_35_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_38_9 then
						iter_38_9.color = Color.New(var_38_25, var_38_25, var_38_25)
					end
				end

				arg_35_1.var_.actorSpriteComps10060 = nil
			end

			local var_38_26 = 0
			local var_38_27 = 0.2

			if var_38_26 < arg_35_1.time_ and arg_35_1.time_ <= var_38_26 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_28 = arg_35_1:FormatText(StoryNameCfg[612].name)

				arg_35_1.leftNameTxt_.text = var_38_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_29 = arg_35_1:GetWordFromCfg(410241009)
				local var_38_30 = arg_35_1:FormatText(var_38_29.content)

				arg_35_1.text_.text = var_38_30

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_31 = 8
				local var_38_32 = utf8.len(var_38_30)
				local var_38_33 = var_38_31 <= 0 and var_38_27 or var_38_27 * (var_38_32 / var_38_31)

				if var_38_33 > 0 and var_38_27 < var_38_33 then
					arg_35_1.talkMaxDuration = var_38_33

					if var_38_33 + var_38_26 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_33 + var_38_26
					end
				end

				arg_35_1.text_.text = var_38_30
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241009", "story_v_out_410241.awb") ~= 0 then
					local var_38_34 = manager.audio:GetVoiceLength("story_v_out_410241", "410241009", "story_v_out_410241.awb") / 1000

					if var_38_34 + var_38_26 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_34 + var_38_26
					end

					if var_38_29.prefab_name ~= "" and arg_35_1.actors_[var_38_29.prefab_name] ~= nil then
						local var_38_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_29.prefab_name].transform, "story_v_out_410241", "410241009", "story_v_out_410241.awb")

						arg_35_1:RecordAudio("410241009", var_38_35)
						arg_35_1:RecordAudio("410241009", var_38_35)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_410241", "410241009", "story_v_out_410241.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_410241", "410241009", "story_v_out_410241.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_36 = math.max(var_38_27, arg_35_1.talkMaxDuration)

			if var_38_26 <= arg_35_1.time_ and arg_35_1.time_ < var_38_26 + var_38_36 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_26) / var_38_36

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_26 + var_38_36 and arg_35_1.time_ < var_38_26 + var_38_36 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play410241010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 410241010
		arg_39_1.duration_ = 7.9

		local var_39_0 = {
			ja = 7.9,
			CriLanguages = 6.366,
			zh = 6.366
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
				arg_39_0:Play410241011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10060"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos10060 = var_42_0.localPosition
				var_42_0.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("10060", 4)

				local var_42_2 = var_42_0.childCount

				for iter_42_0 = 0, var_42_2 - 1 do
					local var_42_3 = var_42_0:GetChild(iter_42_0)

					if var_42_3.name == "" or not string.find(var_42_3.name, "split") then
						var_42_3.gameObject:SetActive(true)
					else
						var_42_3.gameObject:SetActive(false)
					end
				end
			end

			local var_42_4 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_4 then
				local var_42_5 = (arg_39_1.time_ - var_42_1) / var_42_4
				local var_42_6 = Vector3.New(390, -400, 0)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10060, var_42_6, var_42_5)
			end

			if arg_39_1.time_ >= var_42_1 + var_42_4 and arg_39_1.time_ < var_42_1 + var_42_4 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_42_7 = arg_39_1.actors_["10060"]
			local var_42_8 = 0

			if var_42_8 < arg_39_1.time_ and arg_39_1.time_ <= var_42_8 + arg_42_0 and arg_39_1.var_.actorSpriteComps10060 == nil then
				arg_39_1.var_.actorSpriteComps10060 = var_42_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_9 = 0.034

			if var_42_8 <= arg_39_1.time_ and arg_39_1.time_ < var_42_8 + var_42_9 then
				local var_42_10 = (arg_39_1.time_ - var_42_8) / var_42_9

				if arg_39_1.var_.actorSpriteComps10060 then
					for iter_42_1, iter_42_2 in pairs(arg_39_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_42_2 then
							local var_42_11 = Mathf.Lerp(iter_42_2.color.r, 1, var_42_10)

							iter_42_2.color = Color.New(var_42_11, var_42_11, var_42_11)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_8 + var_42_9 and arg_39_1.time_ < var_42_8 + var_42_9 + arg_42_0 and arg_39_1.var_.actorSpriteComps10060 then
				local var_42_12 = 1

				for iter_42_3, iter_42_4 in pairs(arg_39_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_42_4 then
						iter_42_4.color = Color.New(var_42_12, var_42_12, var_42_12)
					end
				end

				arg_39_1.var_.actorSpriteComps10060 = nil
			end

			local var_42_13 = arg_39_1.actors_["1061"]
			local var_42_14 = 0

			if var_42_14 < arg_39_1.time_ and arg_39_1.time_ <= var_42_14 + arg_42_0 and arg_39_1.var_.actorSpriteComps1061 == nil then
				arg_39_1.var_.actorSpriteComps1061 = var_42_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_15 = 0.034

			if var_42_14 <= arg_39_1.time_ and arg_39_1.time_ < var_42_14 + var_42_15 then
				local var_42_16 = (arg_39_1.time_ - var_42_14) / var_42_15

				if arg_39_1.var_.actorSpriteComps1061 then
					for iter_42_5, iter_42_6 in pairs(arg_39_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_42_6 then
							local var_42_17 = Mathf.Lerp(iter_42_6.color.r, 0.5, var_42_16)

							iter_42_6.color = Color.New(var_42_17, var_42_17, var_42_17)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_14 + var_42_15 and arg_39_1.time_ < var_42_14 + var_42_15 + arg_42_0 and arg_39_1.var_.actorSpriteComps1061 then
				local var_42_18 = 0.5

				for iter_42_7, iter_42_8 in pairs(arg_39_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_42_8 then
						iter_42_8.color = Color.New(var_42_18, var_42_18, var_42_18)
					end
				end

				arg_39_1.var_.actorSpriteComps1061 = nil
			end

			local var_42_19 = 0
			local var_42_20 = 0.3

			if var_42_19 < arg_39_1.time_ and arg_39_1.time_ <= var_42_19 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_21 = arg_39_1:FormatText(StoryNameCfg[597].name)

				arg_39_1.leftNameTxt_.text = var_42_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_22 = arg_39_1:GetWordFromCfg(410241010)
				local var_42_23 = arg_39_1:FormatText(var_42_22.content)

				arg_39_1.text_.text = var_42_23

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_24 = 12
				local var_42_25 = utf8.len(var_42_23)
				local var_42_26 = var_42_24 <= 0 and var_42_20 or var_42_20 * (var_42_25 / var_42_24)

				if var_42_26 > 0 and var_42_20 < var_42_26 then
					arg_39_1.talkMaxDuration = var_42_26

					if var_42_26 + var_42_19 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_26 + var_42_19
					end
				end

				arg_39_1.text_.text = var_42_23
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241010", "story_v_out_410241.awb") ~= 0 then
					local var_42_27 = manager.audio:GetVoiceLength("story_v_out_410241", "410241010", "story_v_out_410241.awb") / 1000

					if var_42_27 + var_42_19 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_27 + var_42_19
					end

					if var_42_22.prefab_name ~= "" and arg_39_1.actors_[var_42_22.prefab_name] ~= nil then
						local var_42_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_22.prefab_name].transform, "story_v_out_410241", "410241010", "story_v_out_410241.awb")

						arg_39_1:RecordAudio("410241010", var_42_28)
						arg_39_1:RecordAudio("410241010", var_42_28)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_410241", "410241010", "story_v_out_410241.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_410241", "410241010", "story_v_out_410241.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_29 = math.max(var_42_20, arg_39_1.talkMaxDuration)

			if var_42_19 <= arg_39_1.time_ and arg_39_1.time_ < var_42_19 + var_42_29 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_19) / var_42_29

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_19 + var_42_29 and arg_39_1.time_ < var_42_19 + var_42_29 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play410241011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 410241011
		arg_43_1.duration_ = 7.4

		local var_43_0 = {
			ja = 7.4,
			CriLanguages = 6.833,
			zh = 6.833
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
				arg_43_0:Play410241012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1061"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1061 = var_46_0.localPosition
				var_46_0.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("1061", 2)

				local var_46_2 = var_46_0.childCount

				for iter_46_0 = 0, var_46_2 - 1 do
					local var_46_3 = var_46_0:GetChild(iter_46_0)

					if var_46_3.name == "" or not string.find(var_46_3.name, "split") then
						var_46_3.gameObject:SetActive(true)
					else
						var_46_3.gameObject:SetActive(false)
					end
				end
			end

			local var_46_4 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_4 then
				local var_46_5 = (arg_43_1.time_ - var_46_1) / var_46_4
				local var_46_6 = Vector3.New(-390, -490, 18)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1061, var_46_6, var_46_5)
			end

			if arg_43_1.time_ >= var_46_1 + var_46_4 and arg_43_1.time_ < var_46_1 + var_46_4 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_46_7 = arg_43_1.actors_["10060"]
			local var_46_8 = 0

			if var_46_8 < arg_43_1.time_ and arg_43_1.time_ <= var_46_8 + arg_46_0 and arg_43_1.var_.actorSpriteComps10060 == nil then
				arg_43_1.var_.actorSpriteComps10060 = var_46_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_9 = 0.034

			if var_46_8 <= arg_43_1.time_ and arg_43_1.time_ < var_46_8 + var_46_9 then
				local var_46_10 = (arg_43_1.time_ - var_46_8) / var_46_9

				if arg_43_1.var_.actorSpriteComps10060 then
					for iter_46_1, iter_46_2 in pairs(arg_43_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_46_2 then
							local var_46_11 = Mathf.Lerp(iter_46_2.color.r, 0.5, var_46_10)

							iter_46_2.color = Color.New(var_46_11, var_46_11, var_46_11)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_8 + var_46_9 and arg_43_1.time_ < var_46_8 + var_46_9 + arg_46_0 and arg_43_1.var_.actorSpriteComps10060 then
				local var_46_12 = 0.5

				for iter_46_3, iter_46_4 in pairs(arg_43_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_46_4 then
						iter_46_4.color = Color.New(var_46_12, var_46_12, var_46_12)
					end
				end

				arg_43_1.var_.actorSpriteComps10060 = nil
			end

			local var_46_13 = arg_43_1.actors_["1061"]
			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 and arg_43_1.var_.actorSpriteComps1061 == nil then
				arg_43_1.var_.actorSpriteComps1061 = var_46_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_15 = 0.034

			if var_46_14 <= arg_43_1.time_ and arg_43_1.time_ < var_46_14 + var_46_15 then
				local var_46_16 = (arg_43_1.time_ - var_46_14) / var_46_15

				if arg_43_1.var_.actorSpriteComps1061 then
					for iter_46_5, iter_46_6 in pairs(arg_43_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_46_6 then
							local var_46_17 = Mathf.Lerp(iter_46_6.color.r, 1, var_46_16)

							iter_46_6.color = Color.New(var_46_17, var_46_17, var_46_17)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_14 + var_46_15 and arg_43_1.time_ < var_46_14 + var_46_15 + arg_46_0 and arg_43_1.var_.actorSpriteComps1061 then
				local var_46_18 = 1

				for iter_46_7, iter_46_8 in pairs(arg_43_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_46_8 then
						iter_46_8.color = Color.New(var_46_18, var_46_18, var_46_18)
					end
				end

				arg_43_1.var_.actorSpriteComps1061 = nil
			end

			local var_46_19 = 0
			local var_46_20 = 0.575

			if var_46_19 < arg_43_1.time_ and arg_43_1.time_ <= var_46_19 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_21 = arg_43_1:FormatText(StoryNameCfg[612].name)

				arg_43_1.leftNameTxt_.text = var_46_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_22 = arg_43_1:GetWordFromCfg(410241011)
				local var_46_23 = arg_43_1:FormatText(var_46_22.content)

				arg_43_1.text_.text = var_46_23

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_24 = 23
				local var_46_25 = utf8.len(var_46_23)
				local var_46_26 = var_46_24 <= 0 and var_46_20 or var_46_20 * (var_46_25 / var_46_24)

				if var_46_26 > 0 and var_46_20 < var_46_26 then
					arg_43_1.talkMaxDuration = var_46_26

					if var_46_26 + var_46_19 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_26 + var_46_19
					end
				end

				arg_43_1.text_.text = var_46_23
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241011", "story_v_out_410241.awb") ~= 0 then
					local var_46_27 = manager.audio:GetVoiceLength("story_v_out_410241", "410241011", "story_v_out_410241.awb") / 1000

					if var_46_27 + var_46_19 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_27 + var_46_19
					end

					if var_46_22.prefab_name ~= "" and arg_43_1.actors_[var_46_22.prefab_name] ~= nil then
						local var_46_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_22.prefab_name].transform, "story_v_out_410241", "410241011", "story_v_out_410241.awb")

						arg_43_1:RecordAudio("410241011", var_46_28)
						arg_43_1:RecordAudio("410241011", var_46_28)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_410241", "410241011", "story_v_out_410241.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_410241", "410241011", "story_v_out_410241.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_29 = math.max(var_46_20, arg_43_1.talkMaxDuration)

			if var_46_19 <= arg_43_1.time_ and arg_43_1.time_ < var_46_19 + var_46_29 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_19) / var_46_29

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_19 + var_46_29 and arg_43_1.time_ < var_46_19 + var_46_29 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play410241012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 410241012
		arg_47_1.duration_ = 3.2

		local var_47_0 = {
			ja = 3.2,
			CriLanguages = 2.1,
			zh = 2.1
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
				arg_47_0:Play410241013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10060"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos10060 = var_50_0.localPosition
				var_50_0.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("10060", 4)

				local var_50_2 = var_50_0.childCount

				for iter_50_0 = 0, var_50_2 - 1 do
					local var_50_3 = var_50_0:GetChild(iter_50_0)

					if var_50_3.name == "" or not string.find(var_50_3.name, "split") then
						var_50_3.gameObject:SetActive(true)
					else
						var_50_3.gameObject:SetActive(false)
					end
				end
			end

			local var_50_4 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_4 then
				local var_50_5 = (arg_47_1.time_ - var_50_1) / var_50_4
				local var_50_6 = Vector3.New(390, -400, 0)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos10060, var_50_6, var_50_5)
			end

			if arg_47_1.time_ >= var_50_1 + var_50_4 and arg_47_1.time_ < var_50_1 + var_50_4 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_50_7 = arg_47_1.actors_["10060"]
			local var_50_8 = 0

			if var_50_8 < arg_47_1.time_ and arg_47_1.time_ <= var_50_8 + arg_50_0 and arg_47_1.var_.actorSpriteComps10060 == nil then
				arg_47_1.var_.actorSpriteComps10060 = var_50_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_9 = 0.034

			if var_50_8 <= arg_47_1.time_ and arg_47_1.time_ < var_50_8 + var_50_9 then
				local var_50_10 = (arg_47_1.time_ - var_50_8) / var_50_9

				if arg_47_1.var_.actorSpriteComps10060 then
					for iter_50_1, iter_50_2 in pairs(arg_47_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_50_2 then
							local var_50_11 = Mathf.Lerp(iter_50_2.color.r, 1, var_50_10)

							iter_50_2.color = Color.New(var_50_11, var_50_11, var_50_11)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_8 + var_50_9 and arg_47_1.time_ < var_50_8 + var_50_9 + arg_50_0 and arg_47_1.var_.actorSpriteComps10060 then
				local var_50_12 = 1

				for iter_50_3, iter_50_4 in pairs(arg_47_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_50_4 then
						iter_50_4.color = Color.New(var_50_12, var_50_12, var_50_12)
					end
				end

				arg_47_1.var_.actorSpriteComps10060 = nil
			end

			local var_50_13 = arg_47_1.actors_["1061"]
			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 and arg_47_1.var_.actorSpriteComps1061 == nil then
				arg_47_1.var_.actorSpriteComps1061 = var_50_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_15 = 0.034

			if var_50_14 <= arg_47_1.time_ and arg_47_1.time_ < var_50_14 + var_50_15 then
				local var_50_16 = (arg_47_1.time_ - var_50_14) / var_50_15

				if arg_47_1.var_.actorSpriteComps1061 then
					for iter_50_5, iter_50_6 in pairs(arg_47_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_50_6 then
							local var_50_17 = Mathf.Lerp(iter_50_6.color.r, 0.5, var_50_16)

							iter_50_6.color = Color.New(var_50_17, var_50_17, var_50_17)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_14 + var_50_15 and arg_47_1.time_ < var_50_14 + var_50_15 + arg_50_0 and arg_47_1.var_.actorSpriteComps1061 then
				local var_50_18 = 0.5

				for iter_50_7, iter_50_8 in pairs(arg_47_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_50_8 then
						iter_50_8.color = Color.New(var_50_18, var_50_18, var_50_18)
					end
				end

				arg_47_1.var_.actorSpriteComps1061 = nil
			end

			local var_50_19 = 0
			local var_50_20 = 0.175

			if var_50_19 < arg_47_1.time_ and arg_47_1.time_ <= var_50_19 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_21 = arg_47_1:FormatText(StoryNameCfg[597].name)

				arg_47_1.leftNameTxt_.text = var_50_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_22 = arg_47_1:GetWordFromCfg(410241012)
				local var_50_23 = arg_47_1:FormatText(var_50_22.content)

				arg_47_1.text_.text = var_50_23

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_24 = 7
				local var_50_25 = utf8.len(var_50_23)
				local var_50_26 = var_50_24 <= 0 and var_50_20 or var_50_20 * (var_50_25 / var_50_24)

				if var_50_26 > 0 and var_50_20 < var_50_26 then
					arg_47_1.talkMaxDuration = var_50_26

					if var_50_26 + var_50_19 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_26 + var_50_19
					end
				end

				arg_47_1.text_.text = var_50_23
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241012", "story_v_out_410241.awb") ~= 0 then
					local var_50_27 = manager.audio:GetVoiceLength("story_v_out_410241", "410241012", "story_v_out_410241.awb") / 1000

					if var_50_27 + var_50_19 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_27 + var_50_19
					end

					if var_50_22.prefab_name ~= "" and arg_47_1.actors_[var_50_22.prefab_name] ~= nil then
						local var_50_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_22.prefab_name].transform, "story_v_out_410241", "410241012", "story_v_out_410241.awb")

						arg_47_1:RecordAudio("410241012", var_50_28)
						arg_47_1:RecordAudio("410241012", var_50_28)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_410241", "410241012", "story_v_out_410241.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_410241", "410241012", "story_v_out_410241.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_29 = math.max(var_50_20, arg_47_1.talkMaxDuration)

			if var_50_19 <= arg_47_1.time_ and arg_47_1.time_ < var_50_19 + var_50_29 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_19) / var_50_29

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_19 + var_50_29 and arg_47_1.time_ < var_50_19 + var_50_29 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play410241013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 410241013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play410241014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1061"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1061 = var_54_0.localPosition
				var_54_0.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("1061", 7)

				local var_54_2 = var_54_0.childCount

				for iter_54_0 = 0, var_54_2 - 1 do
					local var_54_3 = var_54_0:GetChild(iter_54_0)

					if var_54_3.name == "" or not string.find(var_54_3.name, "split") then
						var_54_3.gameObject:SetActive(true)
					else
						var_54_3.gameObject:SetActive(false)
					end
				end
			end

			local var_54_4 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_4 then
				local var_54_5 = (arg_51_1.time_ - var_54_1) / var_54_4
				local var_54_6 = Vector3.New(0, -2000, 18)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1061, var_54_6, var_54_5)
			end

			if arg_51_1.time_ >= var_54_1 + var_54_4 and arg_51_1.time_ < var_54_1 + var_54_4 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_54_7 = arg_51_1.actors_["10060"].transform
			local var_54_8 = 0

			if var_54_8 < arg_51_1.time_ and arg_51_1.time_ <= var_54_8 + arg_54_0 then
				arg_51_1.var_.moveOldPos10060 = var_54_7.localPosition
				var_54_7.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("10060", 7)

				local var_54_9 = var_54_7.childCount

				for iter_54_1 = 0, var_54_9 - 1 do
					local var_54_10 = var_54_7:GetChild(iter_54_1)

					if var_54_10.name == "" or not string.find(var_54_10.name, "split") then
						var_54_10.gameObject:SetActive(true)
					else
						var_54_10.gameObject:SetActive(false)
					end
				end
			end

			local var_54_11 = 0.001

			if var_54_8 <= arg_51_1.time_ and arg_51_1.time_ < var_54_8 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_8) / var_54_11
				local var_54_13 = Vector3.New(0, -2000, 0)

				var_54_7.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos10060, var_54_13, var_54_12)
			end

			if arg_51_1.time_ >= var_54_8 + var_54_11 and arg_51_1.time_ < var_54_8 + var_54_11 + arg_54_0 then
				var_54_7.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_54_14 = arg_51_1.actors_["1061"]
			local var_54_15 = 0

			if var_54_15 < arg_51_1.time_ and arg_51_1.time_ <= var_54_15 + arg_54_0 and arg_51_1.var_.actorSpriteComps1061 == nil then
				arg_51_1.var_.actorSpriteComps1061 = var_54_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_16 = 0.034

			if var_54_15 <= arg_51_1.time_ and arg_51_1.time_ < var_54_15 + var_54_16 then
				local var_54_17 = (arg_51_1.time_ - var_54_15) / var_54_16

				if arg_51_1.var_.actorSpriteComps1061 then
					for iter_54_2, iter_54_3 in pairs(arg_51_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_54_3 then
							local var_54_18 = Mathf.Lerp(iter_54_3.color.r, 0.5, var_54_17)

							iter_54_3.color = Color.New(var_54_18, var_54_18, var_54_18)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_15 + var_54_16 and arg_51_1.time_ < var_54_15 + var_54_16 + arg_54_0 and arg_51_1.var_.actorSpriteComps1061 then
				local var_54_19 = 0.5

				for iter_54_4, iter_54_5 in pairs(arg_51_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_54_5 then
						iter_54_5.color = Color.New(var_54_19, var_54_19, var_54_19)
					end
				end

				arg_51_1.var_.actorSpriteComps1061 = nil
			end

			local var_54_20 = arg_51_1.actors_["10060"]
			local var_54_21 = 0

			if var_54_21 < arg_51_1.time_ and arg_51_1.time_ <= var_54_21 + arg_54_0 and arg_51_1.var_.actorSpriteComps10060 == nil then
				arg_51_1.var_.actorSpriteComps10060 = var_54_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_22 = 0.034

			if var_54_21 <= arg_51_1.time_ and arg_51_1.time_ < var_54_21 + var_54_22 then
				local var_54_23 = (arg_51_1.time_ - var_54_21) / var_54_22

				if arg_51_1.var_.actorSpriteComps10060 then
					for iter_54_6, iter_54_7 in pairs(arg_51_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_54_7 then
							local var_54_24 = Mathf.Lerp(iter_54_7.color.r, 0.5, var_54_23)

							iter_54_7.color = Color.New(var_54_24, var_54_24, var_54_24)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_21 + var_54_22 and arg_51_1.time_ < var_54_21 + var_54_22 + arg_54_0 and arg_51_1.var_.actorSpriteComps10060 then
				local var_54_25 = 0.5

				for iter_54_8, iter_54_9 in pairs(arg_51_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_54_9 then
						iter_54_9.color = Color.New(var_54_25, var_54_25, var_54_25)
					end
				end

				arg_51_1.var_.actorSpriteComps10060 = nil
			end

			local var_54_26 = 0
			local var_54_27 = 0.8

			if var_54_26 < arg_51_1.time_ and arg_51_1.time_ <= var_54_26 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_28 = arg_51_1:GetWordFromCfg(410241013)
				local var_54_29 = arg_51_1:FormatText(var_54_28.content)

				arg_51_1.text_.text = var_54_29

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_30 = 32
				local var_54_31 = utf8.len(var_54_29)
				local var_54_32 = var_54_30 <= 0 and var_54_27 or var_54_27 * (var_54_31 / var_54_30)

				if var_54_32 > 0 and var_54_27 < var_54_32 then
					arg_51_1.talkMaxDuration = var_54_32

					if var_54_32 + var_54_26 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_32 + var_54_26
					end
				end

				arg_51_1.text_.text = var_54_29
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_33 = math.max(var_54_27, arg_51_1.talkMaxDuration)

			if var_54_26 <= arg_51_1.time_ and arg_51_1.time_ < var_54_26 + var_54_33 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_26) / var_54_33

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_26 + var_54_33 and arg_51_1.time_ < var_54_26 + var_54_33 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play410241014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 410241014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play410241015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 1.475

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_2 = arg_55_1:GetWordFromCfg(410241014)
				local var_58_3 = arg_55_1:FormatText(var_58_2.content)

				arg_55_1.text_.text = var_58_3

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_4 = 59
				local var_58_5 = utf8.len(var_58_3)
				local var_58_6 = var_58_4 <= 0 and var_58_1 or var_58_1 * (var_58_5 / var_58_4)

				if var_58_6 > 0 and var_58_1 < var_58_6 then
					arg_55_1.talkMaxDuration = var_58_6

					if var_58_6 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_6 + var_58_0
					end
				end

				arg_55_1.text_.text = var_58_3
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_7 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_7 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_7

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_7 and arg_55_1.time_ < var_58_0 + var_58_7 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play410241015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 410241015
		arg_59_1.duration_ = 4.3

		local var_59_0 = {
			ja = 4.3,
			CriLanguages = 2.466,
			zh = 2.466
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
				arg_59_0:Play410241016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1061"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos1061 = var_62_0.localPosition
				var_62_0.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("1061", 2)

				local var_62_2 = var_62_0.childCount

				for iter_62_0 = 0, var_62_2 - 1 do
					local var_62_3 = var_62_0:GetChild(iter_62_0)

					if var_62_3.name == "" or not string.find(var_62_3.name, "split") then
						var_62_3.gameObject:SetActive(true)
					else
						var_62_3.gameObject:SetActive(false)
					end
				end
			end

			local var_62_4 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_4 then
				local var_62_5 = (arg_59_1.time_ - var_62_1) / var_62_4
				local var_62_6 = Vector3.New(-390, -490, 18)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1061, var_62_6, var_62_5)
			end

			if arg_59_1.time_ >= var_62_1 + var_62_4 and arg_59_1.time_ < var_62_1 + var_62_4 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_62_7 = arg_59_1.actors_["10060"].transform
			local var_62_8 = 0

			if var_62_8 < arg_59_1.time_ and arg_59_1.time_ <= var_62_8 + arg_62_0 then
				arg_59_1.var_.moveOldPos10060 = var_62_7.localPosition
				var_62_7.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("10060", 4)

				local var_62_9 = var_62_7.childCount

				for iter_62_1 = 0, var_62_9 - 1 do
					local var_62_10 = var_62_7:GetChild(iter_62_1)

					if var_62_10.name == "" or not string.find(var_62_10.name, "split") then
						var_62_10.gameObject:SetActive(true)
					else
						var_62_10.gameObject:SetActive(false)
					end
				end
			end

			local var_62_11 = 0.001

			if var_62_8 <= arg_59_1.time_ and arg_59_1.time_ < var_62_8 + var_62_11 then
				local var_62_12 = (arg_59_1.time_ - var_62_8) / var_62_11
				local var_62_13 = Vector3.New(390, -400, 0)

				var_62_7.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos10060, var_62_13, var_62_12)
			end

			if arg_59_1.time_ >= var_62_8 + var_62_11 and arg_59_1.time_ < var_62_8 + var_62_11 + arg_62_0 then
				var_62_7.localPosition = Vector3.New(390, -400, 0)
			end

			local var_62_14 = arg_59_1.actors_["1061"]
			local var_62_15 = 0

			if var_62_15 < arg_59_1.time_ and arg_59_1.time_ <= var_62_15 + arg_62_0 and arg_59_1.var_.actorSpriteComps1061 == nil then
				arg_59_1.var_.actorSpriteComps1061 = var_62_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_16 = 0.034

			if var_62_15 <= arg_59_1.time_ and arg_59_1.time_ < var_62_15 + var_62_16 then
				local var_62_17 = (arg_59_1.time_ - var_62_15) / var_62_16

				if arg_59_1.var_.actorSpriteComps1061 then
					for iter_62_2, iter_62_3 in pairs(arg_59_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_62_3 then
							local var_62_18 = Mathf.Lerp(iter_62_3.color.r, 1, var_62_17)

							iter_62_3.color = Color.New(var_62_18, var_62_18, var_62_18)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_15 + var_62_16 and arg_59_1.time_ < var_62_15 + var_62_16 + arg_62_0 and arg_59_1.var_.actorSpriteComps1061 then
				local var_62_19 = 1

				for iter_62_4, iter_62_5 in pairs(arg_59_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_62_5 then
						iter_62_5.color = Color.New(var_62_19, var_62_19, var_62_19)
					end
				end

				arg_59_1.var_.actorSpriteComps1061 = nil
			end

			local var_62_20 = arg_59_1.actors_["10060"]
			local var_62_21 = 0

			if var_62_21 < arg_59_1.time_ and arg_59_1.time_ <= var_62_21 + arg_62_0 and arg_59_1.var_.actorSpriteComps10060 == nil then
				arg_59_1.var_.actorSpriteComps10060 = var_62_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_22 = 0.034

			if var_62_21 <= arg_59_1.time_ and arg_59_1.time_ < var_62_21 + var_62_22 then
				local var_62_23 = (arg_59_1.time_ - var_62_21) / var_62_22

				if arg_59_1.var_.actorSpriteComps10060 then
					for iter_62_6, iter_62_7 in pairs(arg_59_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_62_7 then
							local var_62_24 = Mathf.Lerp(iter_62_7.color.r, 0.5, var_62_23)

							iter_62_7.color = Color.New(var_62_24, var_62_24, var_62_24)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_21 + var_62_22 and arg_59_1.time_ < var_62_21 + var_62_22 + arg_62_0 and arg_59_1.var_.actorSpriteComps10060 then
				local var_62_25 = 0.5

				for iter_62_8, iter_62_9 in pairs(arg_59_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_62_9 then
						iter_62_9.color = Color.New(var_62_25, var_62_25, var_62_25)
					end
				end

				arg_59_1.var_.actorSpriteComps10060 = nil
			end

			local var_62_26 = 0
			local var_62_27 = 0.225

			if var_62_26 < arg_59_1.time_ and arg_59_1.time_ <= var_62_26 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_28 = arg_59_1:FormatText(StoryNameCfg[612].name)

				arg_59_1.leftNameTxt_.text = var_62_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_29 = arg_59_1:GetWordFromCfg(410241015)
				local var_62_30 = arg_59_1:FormatText(var_62_29.content)

				arg_59_1.text_.text = var_62_30

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_31 = 9
				local var_62_32 = utf8.len(var_62_30)
				local var_62_33 = var_62_31 <= 0 and var_62_27 or var_62_27 * (var_62_32 / var_62_31)

				if var_62_33 > 0 and var_62_27 < var_62_33 then
					arg_59_1.talkMaxDuration = var_62_33

					if var_62_33 + var_62_26 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_33 + var_62_26
					end
				end

				arg_59_1.text_.text = var_62_30
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241015", "story_v_out_410241.awb") ~= 0 then
					local var_62_34 = manager.audio:GetVoiceLength("story_v_out_410241", "410241015", "story_v_out_410241.awb") / 1000

					if var_62_34 + var_62_26 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_34 + var_62_26
					end

					if var_62_29.prefab_name ~= "" and arg_59_1.actors_[var_62_29.prefab_name] ~= nil then
						local var_62_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_29.prefab_name].transform, "story_v_out_410241", "410241015", "story_v_out_410241.awb")

						arg_59_1:RecordAudio("410241015", var_62_35)
						arg_59_1:RecordAudio("410241015", var_62_35)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_410241", "410241015", "story_v_out_410241.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_410241", "410241015", "story_v_out_410241.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_36 = math.max(var_62_27, arg_59_1.talkMaxDuration)

			if var_62_26 <= arg_59_1.time_ and arg_59_1.time_ < var_62_26 + var_62_36 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_26) / var_62_36

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_26 + var_62_36 and arg_59_1.time_ < var_62_26 + var_62_36 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play410241016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 410241016
		arg_63_1.duration_ = 9.6

		local var_63_0 = {
			ja = 9.6,
			CriLanguages = 7.533,
			zh = 7.533
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
				arg_63_0:Play410241017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["10060"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos10060 = var_66_0.localPosition
				var_66_0.localScale = Vector3.New(1, 1, 1)

				arg_63_1:CheckSpriteTmpPos("10060", 4)

				local var_66_2 = var_66_0.childCount

				for iter_66_0 = 0, var_66_2 - 1 do
					local var_66_3 = var_66_0:GetChild(iter_66_0)

					if var_66_3.name == "" or not string.find(var_66_3.name, "split") then
						var_66_3.gameObject:SetActive(true)
					else
						var_66_3.gameObject:SetActive(false)
					end
				end
			end

			local var_66_4 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_4 then
				local var_66_5 = (arg_63_1.time_ - var_66_1) / var_66_4
				local var_66_6 = Vector3.New(390, -400, 0)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos10060, var_66_6, var_66_5)
			end

			if arg_63_1.time_ >= var_66_1 + var_66_4 and arg_63_1.time_ < var_66_1 + var_66_4 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_66_7 = arg_63_1.actors_["10060"]
			local var_66_8 = 0

			if var_66_8 < arg_63_1.time_ and arg_63_1.time_ <= var_66_8 + arg_66_0 and arg_63_1.var_.actorSpriteComps10060 == nil then
				arg_63_1.var_.actorSpriteComps10060 = var_66_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_9 = 0.034

			if var_66_8 <= arg_63_1.time_ and arg_63_1.time_ < var_66_8 + var_66_9 then
				local var_66_10 = (arg_63_1.time_ - var_66_8) / var_66_9

				if arg_63_1.var_.actorSpriteComps10060 then
					for iter_66_1, iter_66_2 in pairs(arg_63_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_66_2 then
							local var_66_11 = Mathf.Lerp(iter_66_2.color.r, 1, var_66_10)

							iter_66_2.color = Color.New(var_66_11, var_66_11, var_66_11)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_8 + var_66_9 and arg_63_1.time_ < var_66_8 + var_66_9 + arg_66_0 and arg_63_1.var_.actorSpriteComps10060 then
				local var_66_12 = 1

				for iter_66_3, iter_66_4 in pairs(arg_63_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_66_4 then
						iter_66_4.color = Color.New(var_66_12, var_66_12, var_66_12)
					end
				end

				arg_63_1.var_.actorSpriteComps10060 = nil
			end

			local var_66_13 = arg_63_1.actors_["1061"]
			local var_66_14 = 0

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 and arg_63_1.var_.actorSpriteComps1061 == nil then
				arg_63_1.var_.actorSpriteComps1061 = var_66_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_15 = 0.034

			if var_66_14 <= arg_63_1.time_ and arg_63_1.time_ < var_66_14 + var_66_15 then
				local var_66_16 = (arg_63_1.time_ - var_66_14) / var_66_15

				if arg_63_1.var_.actorSpriteComps1061 then
					for iter_66_5, iter_66_6 in pairs(arg_63_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_66_6 then
							local var_66_17 = Mathf.Lerp(iter_66_6.color.r, 0.5, var_66_16)

							iter_66_6.color = Color.New(var_66_17, var_66_17, var_66_17)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_14 + var_66_15 and arg_63_1.time_ < var_66_14 + var_66_15 + arg_66_0 and arg_63_1.var_.actorSpriteComps1061 then
				local var_66_18 = 0.5

				for iter_66_7, iter_66_8 in pairs(arg_63_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_66_8 then
						iter_66_8.color = Color.New(var_66_18, var_66_18, var_66_18)
					end
				end

				arg_63_1.var_.actorSpriteComps1061 = nil
			end

			local var_66_19 = 0
			local var_66_20 = 0.825

			if var_66_19 < arg_63_1.time_ and arg_63_1.time_ <= var_66_19 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_21 = arg_63_1:FormatText(StoryNameCfg[597].name)

				arg_63_1.leftNameTxt_.text = var_66_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_22 = arg_63_1:GetWordFromCfg(410241016)
				local var_66_23 = arg_63_1:FormatText(var_66_22.content)

				arg_63_1.text_.text = var_66_23

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_24 = 32
				local var_66_25 = utf8.len(var_66_23)
				local var_66_26 = var_66_24 <= 0 and var_66_20 or var_66_20 * (var_66_25 / var_66_24)

				if var_66_26 > 0 and var_66_20 < var_66_26 then
					arg_63_1.talkMaxDuration = var_66_26

					if var_66_26 + var_66_19 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_26 + var_66_19
					end
				end

				arg_63_1.text_.text = var_66_23
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241016", "story_v_out_410241.awb") ~= 0 then
					local var_66_27 = manager.audio:GetVoiceLength("story_v_out_410241", "410241016", "story_v_out_410241.awb") / 1000

					if var_66_27 + var_66_19 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_27 + var_66_19
					end

					if var_66_22.prefab_name ~= "" and arg_63_1.actors_[var_66_22.prefab_name] ~= nil then
						local var_66_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_22.prefab_name].transform, "story_v_out_410241", "410241016", "story_v_out_410241.awb")

						arg_63_1:RecordAudio("410241016", var_66_28)
						arg_63_1:RecordAudio("410241016", var_66_28)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_410241", "410241016", "story_v_out_410241.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_410241", "410241016", "story_v_out_410241.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_29 = math.max(var_66_20, arg_63_1.talkMaxDuration)

			if var_66_19 <= arg_63_1.time_ and arg_63_1.time_ < var_66_19 + var_66_29 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_19) / var_66_29

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_19 + var_66_29 and arg_63_1.time_ < var_66_19 + var_66_29 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play410241017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 410241017
		arg_67_1.duration_ = 5.133

		local var_67_0 = {
			ja = 5.133,
			CriLanguages = 4.066,
			zh = 4.066
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
				arg_67_0:Play410241018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1061"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1061 = var_70_0.localPosition
				var_70_0.localScale = Vector3.New(1, 1, 1)

				arg_67_1:CheckSpriteTmpPos("1061", 2)

				local var_70_2 = var_70_0.childCount

				for iter_70_0 = 0, var_70_2 - 1 do
					local var_70_3 = var_70_0:GetChild(iter_70_0)

					if var_70_3.name == "" or not string.find(var_70_3.name, "split") then
						var_70_3.gameObject:SetActive(true)
					else
						var_70_3.gameObject:SetActive(false)
					end
				end
			end

			local var_70_4 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_4 then
				local var_70_5 = (arg_67_1.time_ - var_70_1) / var_70_4
				local var_70_6 = Vector3.New(-390, -490, 18)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1061, var_70_6, var_70_5)
			end

			if arg_67_1.time_ >= var_70_1 + var_70_4 and arg_67_1.time_ < var_70_1 + var_70_4 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_70_7 = arg_67_1.actors_["10060"]
			local var_70_8 = 0

			if var_70_8 < arg_67_1.time_ and arg_67_1.time_ <= var_70_8 + arg_70_0 and arg_67_1.var_.actorSpriteComps10060 == nil then
				arg_67_1.var_.actorSpriteComps10060 = var_70_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_9 = 0.034

			if var_70_8 <= arg_67_1.time_ and arg_67_1.time_ < var_70_8 + var_70_9 then
				local var_70_10 = (arg_67_1.time_ - var_70_8) / var_70_9

				if arg_67_1.var_.actorSpriteComps10060 then
					for iter_70_1, iter_70_2 in pairs(arg_67_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_70_2 then
							local var_70_11 = Mathf.Lerp(iter_70_2.color.r, 0.5, var_70_10)

							iter_70_2.color = Color.New(var_70_11, var_70_11, var_70_11)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_8 + var_70_9 and arg_67_1.time_ < var_70_8 + var_70_9 + arg_70_0 and arg_67_1.var_.actorSpriteComps10060 then
				local var_70_12 = 0.5

				for iter_70_3, iter_70_4 in pairs(arg_67_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_70_4 then
						iter_70_4.color = Color.New(var_70_12, var_70_12, var_70_12)
					end
				end

				arg_67_1.var_.actorSpriteComps10060 = nil
			end

			local var_70_13 = arg_67_1.actors_["1061"]
			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 and arg_67_1.var_.actorSpriteComps1061 == nil then
				arg_67_1.var_.actorSpriteComps1061 = var_70_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_15 = 0.034

			if var_70_14 <= arg_67_1.time_ and arg_67_1.time_ < var_70_14 + var_70_15 then
				local var_70_16 = (arg_67_1.time_ - var_70_14) / var_70_15

				if arg_67_1.var_.actorSpriteComps1061 then
					for iter_70_5, iter_70_6 in pairs(arg_67_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_70_6 then
							local var_70_17 = Mathf.Lerp(iter_70_6.color.r, 1, var_70_16)

							iter_70_6.color = Color.New(var_70_17, var_70_17, var_70_17)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_14 + var_70_15 and arg_67_1.time_ < var_70_14 + var_70_15 + arg_70_0 and arg_67_1.var_.actorSpriteComps1061 then
				local var_70_18 = 1

				for iter_70_7, iter_70_8 in pairs(arg_67_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_70_8 then
						iter_70_8.color = Color.New(var_70_18, var_70_18, var_70_18)
					end
				end

				arg_67_1.var_.actorSpriteComps1061 = nil
			end

			local var_70_19 = 0
			local var_70_20 = 0.375

			if var_70_19 < arg_67_1.time_ and arg_67_1.time_ <= var_70_19 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_21 = arg_67_1:FormatText(StoryNameCfg[612].name)

				arg_67_1.leftNameTxt_.text = var_70_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_22 = arg_67_1:GetWordFromCfg(410241017)
				local var_70_23 = arg_67_1:FormatText(var_70_22.content)

				arg_67_1.text_.text = var_70_23

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_24 = 15
				local var_70_25 = utf8.len(var_70_23)
				local var_70_26 = var_70_24 <= 0 and var_70_20 or var_70_20 * (var_70_25 / var_70_24)

				if var_70_26 > 0 and var_70_20 < var_70_26 then
					arg_67_1.talkMaxDuration = var_70_26

					if var_70_26 + var_70_19 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_26 + var_70_19
					end
				end

				arg_67_1.text_.text = var_70_23
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241017", "story_v_out_410241.awb") ~= 0 then
					local var_70_27 = manager.audio:GetVoiceLength("story_v_out_410241", "410241017", "story_v_out_410241.awb") / 1000

					if var_70_27 + var_70_19 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_27 + var_70_19
					end

					if var_70_22.prefab_name ~= "" and arg_67_1.actors_[var_70_22.prefab_name] ~= nil then
						local var_70_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_22.prefab_name].transform, "story_v_out_410241", "410241017", "story_v_out_410241.awb")

						arg_67_1:RecordAudio("410241017", var_70_28)
						arg_67_1:RecordAudio("410241017", var_70_28)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_410241", "410241017", "story_v_out_410241.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_410241", "410241017", "story_v_out_410241.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_29 = math.max(var_70_20, arg_67_1.talkMaxDuration)

			if var_70_19 <= arg_67_1.time_ and arg_67_1.time_ < var_70_19 + var_70_29 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_19) / var_70_29

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_19 + var_70_29 and arg_67_1.time_ < var_70_19 + var_70_29 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play410241018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 410241018
		arg_71_1.duration_ = 19.7

		local var_71_0 = {
			ja = 19.7,
			CriLanguages = 11.666,
			zh = 11.666
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
				arg_71_0:Play410241019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 1.125

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_2 = arg_71_1:FormatText(StoryNameCfg[612].name)

				arg_71_1.leftNameTxt_.text = var_74_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_3 = arg_71_1:GetWordFromCfg(410241018)
				local var_74_4 = arg_71_1:FormatText(var_74_3.content)

				arg_71_1.text_.text = var_74_4

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_5 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241018", "story_v_out_410241.awb") ~= 0 then
					local var_74_8 = manager.audio:GetVoiceLength("story_v_out_410241", "410241018", "story_v_out_410241.awb") / 1000

					if var_74_8 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_8 + var_74_0
					end

					if var_74_3.prefab_name ~= "" and arg_71_1.actors_[var_74_3.prefab_name] ~= nil then
						local var_74_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_3.prefab_name].transform, "story_v_out_410241", "410241018", "story_v_out_410241.awb")

						arg_71_1:RecordAudio("410241018", var_74_9)
						arg_71_1:RecordAudio("410241018", var_74_9)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_410241", "410241018", "story_v_out_410241.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_410241", "410241018", "story_v_out_410241.awb")
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
	Play410241019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 410241019
		arg_75_1.duration_ = 5.233

		local var_75_0 = {
			ja = 5.233,
			CriLanguages = 3.433,
			zh = 3.433
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
				arg_75_0:Play410241020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["10060"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos10060 = var_78_0.localPosition
				var_78_0.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("10060", 4)

				local var_78_2 = var_78_0.childCount

				for iter_78_0 = 0, var_78_2 - 1 do
					local var_78_3 = var_78_0:GetChild(iter_78_0)

					if var_78_3.name == "split_3" or not string.find(var_78_3.name, "split") then
						var_78_3.gameObject:SetActive(true)
					else
						var_78_3.gameObject:SetActive(false)
					end
				end
			end

			local var_78_4 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_4 then
				local var_78_5 = (arg_75_1.time_ - var_78_1) / var_78_4
				local var_78_6 = Vector3.New(390, -400, 0)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10060, var_78_6, var_78_5)
			end

			if arg_75_1.time_ >= var_78_1 + var_78_4 and arg_75_1.time_ < var_78_1 + var_78_4 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_78_7 = arg_75_1.actors_["10060"]
			local var_78_8 = 0

			if var_78_8 < arg_75_1.time_ and arg_75_1.time_ <= var_78_8 + arg_78_0 and arg_75_1.var_.actorSpriteComps10060 == nil then
				arg_75_1.var_.actorSpriteComps10060 = var_78_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_9 = 0.034

			if var_78_8 <= arg_75_1.time_ and arg_75_1.time_ < var_78_8 + var_78_9 then
				local var_78_10 = (arg_75_1.time_ - var_78_8) / var_78_9

				if arg_75_1.var_.actorSpriteComps10060 then
					for iter_78_1, iter_78_2 in pairs(arg_75_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_78_2 then
							local var_78_11 = Mathf.Lerp(iter_78_2.color.r, 1, var_78_10)

							iter_78_2.color = Color.New(var_78_11, var_78_11, var_78_11)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_8 + var_78_9 and arg_75_1.time_ < var_78_8 + var_78_9 + arg_78_0 and arg_75_1.var_.actorSpriteComps10060 then
				local var_78_12 = 1

				for iter_78_3, iter_78_4 in pairs(arg_75_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_78_4 then
						iter_78_4.color = Color.New(var_78_12, var_78_12, var_78_12)
					end
				end

				arg_75_1.var_.actorSpriteComps10060 = nil
			end

			local var_78_13 = arg_75_1.actors_["1061"]
			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 and arg_75_1.var_.actorSpriteComps1061 == nil then
				arg_75_1.var_.actorSpriteComps1061 = var_78_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_15 = 0.034

			if var_78_14 <= arg_75_1.time_ and arg_75_1.time_ < var_78_14 + var_78_15 then
				local var_78_16 = (arg_75_1.time_ - var_78_14) / var_78_15

				if arg_75_1.var_.actorSpriteComps1061 then
					for iter_78_5, iter_78_6 in pairs(arg_75_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_78_6 then
							local var_78_17 = Mathf.Lerp(iter_78_6.color.r, 0.5, var_78_16)

							iter_78_6.color = Color.New(var_78_17, var_78_17, var_78_17)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_14 + var_78_15 and arg_75_1.time_ < var_78_14 + var_78_15 + arg_78_0 and arg_75_1.var_.actorSpriteComps1061 then
				local var_78_18 = 0.5

				for iter_78_7, iter_78_8 in pairs(arg_75_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_78_8 then
						iter_78_8.color = Color.New(var_78_18, var_78_18, var_78_18)
					end
				end

				arg_75_1.var_.actorSpriteComps1061 = nil
			end

			local var_78_19 = 0
			local var_78_20 = 0.4

			if var_78_19 < arg_75_1.time_ and arg_75_1.time_ <= var_78_19 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_21 = arg_75_1:FormatText(StoryNameCfg[597].name)

				arg_75_1.leftNameTxt_.text = var_78_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_22 = arg_75_1:GetWordFromCfg(410241019)
				local var_78_23 = arg_75_1:FormatText(var_78_22.content)

				arg_75_1.text_.text = var_78_23

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_24 = 16
				local var_78_25 = utf8.len(var_78_23)
				local var_78_26 = var_78_24 <= 0 and var_78_20 or var_78_20 * (var_78_25 / var_78_24)

				if var_78_26 > 0 and var_78_20 < var_78_26 then
					arg_75_1.talkMaxDuration = var_78_26

					if var_78_26 + var_78_19 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_26 + var_78_19
					end
				end

				arg_75_1.text_.text = var_78_23
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241019", "story_v_out_410241.awb") ~= 0 then
					local var_78_27 = manager.audio:GetVoiceLength("story_v_out_410241", "410241019", "story_v_out_410241.awb") / 1000

					if var_78_27 + var_78_19 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_27 + var_78_19
					end

					if var_78_22.prefab_name ~= "" and arg_75_1.actors_[var_78_22.prefab_name] ~= nil then
						local var_78_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_22.prefab_name].transform, "story_v_out_410241", "410241019", "story_v_out_410241.awb")

						arg_75_1:RecordAudio("410241019", var_78_28)
						arg_75_1:RecordAudio("410241019", var_78_28)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_410241", "410241019", "story_v_out_410241.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_410241", "410241019", "story_v_out_410241.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_29 = math.max(var_78_20, arg_75_1.talkMaxDuration)

			if var_78_19 <= arg_75_1.time_ and arg_75_1.time_ < var_78_19 + var_78_29 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_19) / var_78_29

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_19 + var_78_29 and arg_75_1.time_ < var_78_19 + var_78_29 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play410241020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 410241020
		arg_79_1.duration_ = 11.333

		local var_79_0 = {
			ja = 11.333,
			CriLanguages = 8.466,
			zh = 8.466
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
				arg_79_0:Play410241021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 0.975

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_2 = arg_79_1:FormatText(StoryNameCfg[597].name)

				arg_79_1.leftNameTxt_.text = var_82_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_3 = arg_79_1:GetWordFromCfg(410241020)
				local var_82_4 = arg_79_1:FormatText(var_82_3.content)

				arg_79_1.text_.text = var_82_4

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_5 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241020", "story_v_out_410241.awb") ~= 0 then
					local var_82_8 = manager.audio:GetVoiceLength("story_v_out_410241", "410241020", "story_v_out_410241.awb") / 1000

					if var_82_8 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_8 + var_82_0
					end

					if var_82_3.prefab_name ~= "" and arg_79_1.actors_[var_82_3.prefab_name] ~= nil then
						local var_82_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_3.prefab_name].transform, "story_v_out_410241", "410241020", "story_v_out_410241.awb")

						arg_79_1:RecordAudio("410241020", var_82_9)
						arg_79_1:RecordAudio("410241020", var_82_9)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_410241", "410241020", "story_v_out_410241.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_410241", "410241020", "story_v_out_410241.awb")
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
	Play410241021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 410241021
		arg_83_1.duration_ = 8.133

		local var_83_0 = {
			ja = 8.133,
			CriLanguages = 4.5,
			zh = 4.5
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
				arg_83_0:Play410241022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1061"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1061 = var_86_0.localPosition
				var_86_0.localScale = Vector3.New(1, 1, 1)

				arg_83_1:CheckSpriteTmpPos("1061", 2)

				local var_86_2 = var_86_0.childCount

				for iter_86_0 = 0, var_86_2 - 1 do
					local var_86_3 = var_86_0:GetChild(iter_86_0)

					if var_86_3.name == "" or not string.find(var_86_3.name, "split") then
						var_86_3.gameObject:SetActive(true)
					else
						var_86_3.gameObject:SetActive(false)
					end
				end
			end

			local var_86_4 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_4 then
				local var_86_5 = (arg_83_1.time_ - var_86_1) / var_86_4
				local var_86_6 = Vector3.New(-390, -490, 18)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1061, var_86_6, var_86_5)
			end

			if arg_83_1.time_ >= var_86_1 + var_86_4 and arg_83_1.time_ < var_86_1 + var_86_4 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_86_7 = arg_83_1.actors_["10060"]
			local var_86_8 = 0

			if var_86_8 < arg_83_1.time_ and arg_83_1.time_ <= var_86_8 + arg_86_0 and arg_83_1.var_.actorSpriteComps10060 == nil then
				arg_83_1.var_.actorSpriteComps10060 = var_86_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_9 = 0.034

			if var_86_8 <= arg_83_1.time_ and arg_83_1.time_ < var_86_8 + var_86_9 then
				local var_86_10 = (arg_83_1.time_ - var_86_8) / var_86_9

				if arg_83_1.var_.actorSpriteComps10060 then
					for iter_86_1, iter_86_2 in pairs(arg_83_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_86_2 then
							local var_86_11 = Mathf.Lerp(iter_86_2.color.r, 0.5, var_86_10)

							iter_86_2.color = Color.New(var_86_11, var_86_11, var_86_11)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_8 + var_86_9 and arg_83_1.time_ < var_86_8 + var_86_9 + arg_86_0 and arg_83_1.var_.actorSpriteComps10060 then
				local var_86_12 = 0.5

				for iter_86_3, iter_86_4 in pairs(arg_83_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_86_4 then
						iter_86_4.color = Color.New(var_86_12, var_86_12, var_86_12)
					end
				end

				arg_83_1.var_.actorSpriteComps10060 = nil
			end

			local var_86_13 = arg_83_1.actors_["1061"]
			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 and arg_83_1.var_.actorSpriteComps1061 == nil then
				arg_83_1.var_.actorSpriteComps1061 = var_86_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_15 = 0.034

			if var_86_14 <= arg_83_1.time_ and arg_83_1.time_ < var_86_14 + var_86_15 then
				local var_86_16 = (arg_83_1.time_ - var_86_14) / var_86_15

				if arg_83_1.var_.actorSpriteComps1061 then
					for iter_86_5, iter_86_6 in pairs(arg_83_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_86_6 then
							local var_86_17 = Mathf.Lerp(iter_86_6.color.r, 1, var_86_16)

							iter_86_6.color = Color.New(var_86_17, var_86_17, var_86_17)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_14 + var_86_15 and arg_83_1.time_ < var_86_14 + var_86_15 + arg_86_0 and arg_83_1.var_.actorSpriteComps1061 then
				local var_86_18 = 1

				for iter_86_7, iter_86_8 in pairs(arg_83_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_86_8 then
						iter_86_8.color = Color.New(var_86_18, var_86_18, var_86_18)
					end
				end

				arg_83_1.var_.actorSpriteComps1061 = nil
			end

			local var_86_19 = 0
			local var_86_20 = 0.525

			if var_86_19 < arg_83_1.time_ and arg_83_1.time_ <= var_86_19 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_21 = arg_83_1:FormatText(StoryNameCfg[612].name)

				arg_83_1.leftNameTxt_.text = var_86_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_22 = arg_83_1:GetWordFromCfg(410241021)
				local var_86_23 = arg_83_1:FormatText(var_86_22.content)

				arg_83_1.text_.text = var_86_23

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_24 = 21
				local var_86_25 = utf8.len(var_86_23)
				local var_86_26 = var_86_24 <= 0 and var_86_20 or var_86_20 * (var_86_25 / var_86_24)

				if var_86_26 > 0 and var_86_20 < var_86_26 then
					arg_83_1.talkMaxDuration = var_86_26

					if var_86_26 + var_86_19 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_26 + var_86_19
					end
				end

				arg_83_1.text_.text = var_86_23
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241021", "story_v_out_410241.awb") ~= 0 then
					local var_86_27 = manager.audio:GetVoiceLength("story_v_out_410241", "410241021", "story_v_out_410241.awb") / 1000

					if var_86_27 + var_86_19 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_27 + var_86_19
					end

					if var_86_22.prefab_name ~= "" and arg_83_1.actors_[var_86_22.prefab_name] ~= nil then
						local var_86_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_22.prefab_name].transform, "story_v_out_410241", "410241021", "story_v_out_410241.awb")

						arg_83_1:RecordAudio("410241021", var_86_28)
						arg_83_1:RecordAudio("410241021", var_86_28)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_410241", "410241021", "story_v_out_410241.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_410241", "410241021", "story_v_out_410241.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_29 = math.max(var_86_20, arg_83_1.talkMaxDuration)

			if var_86_19 <= arg_83_1.time_ and arg_83_1.time_ < var_86_19 + var_86_29 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_19) / var_86_29

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_19 + var_86_29 and arg_83_1.time_ < var_86_19 + var_86_29 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play410241022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 410241022
		arg_87_1.duration_ = 11.8

		local var_87_0 = {
			ja = 11.8,
			CriLanguages = 10.733,
			zh = 10.733
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
				arg_87_0:Play410241023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["10060"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos10060 = var_90_0.localPosition
				var_90_0.localScale = Vector3.New(1, 1, 1)

				arg_87_1:CheckSpriteTmpPos("10060", 4)

				local var_90_2 = var_90_0.childCount

				for iter_90_0 = 0, var_90_2 - 1 do
					local var_90_3 = var_90_0:GetChild(iter_90_0)

					if var_90_3.name == "" or not string.find(var_90_3.name, "split") then
						var_90_3.gameObject:SetActive(true)
					else
						var_90_3.gameObject:SetActive(false)
					end
				end
			end

			local var_90_4 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_4 then
				local var_90_5 = (arg_87_1.time_ - var_90_1) / var_90_4
				local var_90_6 = Vector3.New(390, -400, 0)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos10060, var_90_6, var_90_5)
			end

			if arg_87_1.time_ >= var_90_1 + var_90_4 and arg_87_1.time_ < var_90_1 + var_90_4 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_90_7 = arg_87_1.actors_["10060"]
			local var_90_8 = 0

			if var_90_8 < arg_87_1.time_ and arg_87_1.time_ <= var_90_8 + arg_90_0 and arg_87_1.var_.actorSpriteComps10060 == nil then
				arg_87_1.var_.actorSpriteComps10060 = var_90_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_9 = 0.034

			if var_90_8 <= arg_87_1.time_ and arg_87_1.time_ < var_90_8 + var_90_9 then
				local var_90_10 = (arg_87_1.time_ - var_90_8) / var_90_9

				if arg_87_1.var_.actorSpriteComps10060 then
					for iter_90_1, iter_90_2 in pairs(arg_87_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_90_2 then
							local var_90_11 = Mathf.Lerp(iter_90_2.color.r, 1, var_90_10)

							iter_90_2.color = Color.New(var_90_11, var_90_11, var_90_11)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_8 + var_90_9 and arg_87_1.time_ < var_90_8 + var_90_9 + arg_90_0 and arg_87_1.var_.actorSpriteComps10060 then
				local var_90_12 = 1

				for iter_90_3, iter_90_4 in pairs(arg_87_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_90_4 then
						iter_90_4.color = Color.New(var_90_12, var_90_12, var_90_12)
					end
				end

				arg_87_1.var_.actorSpriteComps10060 = nil
			end

			local var_90_13 = arg_87_1.actors_["1061"]
			local var_90_14 = 0

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 and arg_87_1.var_.actorSpriteComps1061 == nil then
				arg_87_1.var_.actorSpriteComps1061 = var_90_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_15 = 0.034

			if var_90_14 <= arg_87_1.time_ and arg_87_1.time_ < var_90_14 + var_90_15 then
				local var_90_16 = (arg_87_1.time_ - var_90_14) / var_90_15

				if arg_87_1.var_.actorSpriteComps1061 then
					for iter_90_5, iter_90_6 in pairs(arg_87_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_90_6 then
							local var_90_17 = Mathf.Lerp(iter_90_6.color.r, 0.5, var_90_16)

							iter_90_6.color = Color.New(var_90_17, var_90_17, var_90_17)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_14 + var_90_15 and arg_87_1.time_ < var_90_14 + var_90_15 + arg_90_0 and arg_87_1.var_.actorSpriteComps1061 then
				local var_90_18 = 0.5

				for iter_90_7, iter_90_8 in pairs(arg_87_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_90_8 then
						iter_90_8.color = Color.New(var_90_18, var_90_18, var_90_18)
					end
				end

				arg_87_1.var_.actorSpriteComps1061 = nil
			end

			local var_90_19 = 0
			local var_90_20 = 1.175

			if var_90_19 < arg_87_1.time_ and arg_87_1.time_ <= var_90_19 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_21 = arg_87_1:FormatText(StoryNameCfg[597].name)

				arg_87_1.leftNameTxt_.text = var_90_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_22 = arg_87_1:GetWordFromCfg(410241022)
				local var_90_23 = arg_87_1:FormatText(var_90_22.content)

				arg_87_1.text_.text = var_90_23

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_24 = 47
				local var_90_25 = utf8.len(var_90_23)
				local var_90_26 = var_90_24 <= 0 and var_90_20 or var_90_20 * (var_90_25 / var_90_24)

				if var_90_26 > 0 and var_90_20 < var_90_26 then
					arg_87_1.talkMaxDuration = var_90_26

					if var_90_26 + var_90_19 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_26 + var_90_19
					end
				end

				arg_87_1.text_.text = var_90_23
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241022", "story_v_out_410241.awb") ~= 0 then
					local var_90_27 = manager.audio:GetVoiceLength("story_v_out_410241", "410241022", "story_v_out_410241.awb") / 1000

					if var_90_27 + var_90_19 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_27 + var_90_19
					end

					if var_90_22.prefab_name ~= "" and arg_87_1.actors_[var_90_22.prefab_name] ~= nil then
						local var_90_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_22.prefab_name].transform, "story_v_out_410241", "410241022", "story_v_out_410241.awb")

						arg_87_1:RecordAudio("410241022", var_90_28)
						arg_87_1:RecordAudio("410241022", var_90_28)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_410241", "410241022", "story_v_out_410241.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_410241", "410241022", "story_v_out_410241.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_29 = math.max(var_90_20, arg_87_1.talkMaxDuration)

			if var_90_19 <= arg_87_1.time_ and arg_87_1.time_ < var_90_19 + var_90_29 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_19) / var_90_29

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_19 + var_90_29 and arg_87_1.time_ < var_90_19 + var_90_29 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play410241023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 410241023
		arg_91_1.duration_ = 7.366

		local var_91_0 = {
			ja = 7.366,
			CriLanguages = 4.8,
			zh = 4.8
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
				arg_91_0:Play410241024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1061"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1061 = var_94_0.localPosition
				var_94_0.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("1061", 2)

				local var_94_2 = var_94_0.childCount

				for iter_94_0 = 0, var_94_2 - 1 do
					local var_94_3 = var_94_0:GetChild(iter_94_0)

					if var_94_3.name == "" or not string.find(var_94_3.name, "split") then
						var_94_3.gameObject:SetActive(true)
					else
						var_94_3.gameObject:SetActive(false)
					end
				end
			end

			local var_94_4 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_4 then
				local var_94_5 = (arg_91_1.time_ - var_94_1) / var_94_4
				local var_94_6 = Vector3.New(-390, -490, 18)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1061, var_94_6, var_94_5)
			end

			if arg_91_1.time_ >= var_94_1 + var_94_4 and arg_91_1.time_ < var_94_1 + var_94_4 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_94_7 = arg_91_1.actors_["10060"]
			local var_94_8 = 0

			if var_94_8 < arg_91_1.time_ and arg_91_1.time_ <= var_94_8 + arg_94_0 and arg_91_1.var_.actorSpriteComps10060 == nil then
				arg_91_1.var_.actorSpriteComps10060 = var_94_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_9 = 0.034

			if var_94_8 <= arg_91_1.time_ and arg_91_1.time_ < var_94_8 + var_94_9 then
				local var_94_10 = (arg_91_1.time_ - var_94_8) / var_94_9

				if arg_91_1.var_.actorSpriteComps10060 then
					for iter_94_1, iter_94_2 in pairs(arg_91_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_94_2 then
							local var_94_11 = Mathf.Lerp(iter_94_2.color.r, 0.5, var_94_10)

							iter_94_2.color = Color.New(var_94_11, var_94_11, var_94_11)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_8 + var_94_9 and arg_91_1.time_ < var_94_8 + var_94_9 + arg_94_0 and arg_91_1.var_.actorSpriteComps10060 then
				local var_94_12 = 0.5

				for iter_94_3, iter_94_4 in pairs(arg_91_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_94_4 then
						iter_94_4.color = Color.New(var_94_12, var_94_12, var_94_12)
					end
				end

				arg_91_1.var_.actorSpriteComps10060 = nil
			end

			local var_94_13 = arg_91_1.actors_["1061"]
			local var_94_14 = 0

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 and arg_91_1.var_.actorSpriteComps1061 == nil then
				arg_91_1.var_.actorSpriteComps1061 = var_94_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_15 = 0.034

			if var_94_14 <= arg_91_1.time_ and arg_91_1.time_ < var_94_14 + var_94_15 then
				local var_94_16 = (arg_91_1.time_ - var_94_14) / var_94_15

				if arg_91_1.var_.actorSpriteComps1061 then
					for iter_94_5, iter_94_6 in pairs(arg_91_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_94_6 then
							local var_94_17 = Mathf.Lerp(iter_94_6.color.r, 1, var_94_16)

							iter_94_6.color = Color.New(var_94_17, var_94_17, var_94_17)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_14 + var_94_15 and arg_91_1.time_ < var_94_14 + var_94_15 + arg_94_0 and arg_91_1.var_.actorSpriteComps1061 then
				local var_94_18 = 1

				for iter_94_7, iter_94_8 in pairs(arg_91_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_94_8 then
						iter_94_8.color = Color.New(var_94_18, var_94_18, var_94_18)
					end
				end

				arg_91_1.var_.actorSpriteComps1061 = nil
			end

			local var_94_19 = 0
			local var_94_20 = 0.525

			if var_94_19 < arg_91_1.time_ and arg_91_1.time_ <= var_94_19 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_21 = arg_91_1:FormatText(StoryNameCfg[612].name)

				arg_91_1.leftNameTxt_.text = var_94_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_22 = arg_91_1:GetWordFromCfg(410241023)
				local var_94_23 = arg_91_1:FormatText(var_94_22.content)

				arg_91_1.text_.text = var_94_23

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_24 = 21
				local var_94_25 = utf8.len(var_94_23)
				local var_94_26 = var_94_24 <= 0 and var_94_20 or var_94_20 * (var_94_25 / var_94_24)

				if var_94_26 > 0 and var_94_20 < var_94_26 then
					arg_91_1.talkMaxDuration = var_94_26

					if var_94_26 + var_94_19 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_26 + var_94_19
					end
				end

				arg_91_1.text_.text = var_94_23
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241023", "story_v_out_410241.awb") ~= 0 then
					local var_94_27 = manager.audio:GetVoiceLength("story_v_out_410241", "410241023", "story_v_out_410241.awb") / 1000

					if var_94_27 + var_94_19 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_27 + var_94_19
					end

					if var_94_22.prefab_name ~= "" and arg_91_1.actors_[var_94_22.prefab_name] ~= nil then
						local var_94_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_22.prefab_name].transform, "story_v_out_410241", "410241023", "story_v_out_410241.awb")

						arg_91_1:RecordAudio("410241023", var_94_28)
						arg_91_1:RecordAudio("410241023", var_94_28)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_410241", "410241023", "story_v_out_410241.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_410241", "410241023", "story_v_out_410241.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_29 = math.max(var_94_20, arg_91_1.talkMaxDuration)

			if var_94_19 <= arg_91_1.time_ and arg_91_1.time_ < var_94_19 + var_94_29 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_19) / var_94_29

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_19 + var_94_29 and arg_91_1.time_ < var_94_19 + var_94_29 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play410241024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 410241024
		arg_95_1.duration_ = 5.166

		local var_95_0 = {
			ja = 5.166,
			CriLanguages = 2.933,
			zh = 2.933
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
				arg_95_0:Play410241025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["10060"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos10060 = var_98_0.localPosition
				var_98_0.localScale = Vector3.New(1, 1, 1)

				arg_95_1:CheckSpriteTmpPos("10060", 4)

				local var_98_2 = var_98_0.childCount

				for iter_98_0 = 0, var_98_2 - 1 do
					local var_98_3 = var_98_0:GetChild(iter_98_0)

					if var_98_3.name == "" or not string.find(var_98_3.name, "split") then
						var_98_3.gameObject:SetActive(true)
					else
						var_98_3.gameObject:SetActive(false)
					end
				end
			end

			local var_98_4 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_4 then
				local var_98_5 = (arg_95_1.time_ - var_98_1) / var_98_4
				local var_98_6 = Vector3.New(390, -400, 0)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10060, var_98_6, var_98_5)
			end

			if arg_95_1.time_ >= var_98_1 + var_98_4 and arg_95_1.time_ < var_98_1 + var_98_4 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_98_7 = arg_95_1.actors_["10060"]
			local var_98_8 = 0

			if var_98_8 < arg_95_1.time_ and arg_95_1.time_ <= var_98_8 + arg_98_0 and arg_95_1.var_.actorSpriteComps10060 == nil then
				arg_95_1.var_.actorSpriteComps10060 = var_98_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_9 = 0.034

			if var_98_8 <= arg_95_1.time_ and arg_95_1.time_ < var_98_8 + var_98_9 then
				local var_98_10 = (arg_95_1.time_ - var_98_8) / var_98_9

				if arg_95_1.var_.actorSpriteComps10060 then
					for iter_98_1, iter_98_2 in pairs(arg_95_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_98_2 then
							local var_98_11 = Mathf.Lerp(iter_98_2.color.r, 1, var_98_10)

							iter_98_2.color = Color.New(var_98_11, var_98_11, var_98_11)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_8 + var_98_9 and arg_95_1.time_ < var_98_8 + var_98_9 + arg_98_0 and arg_95_1.var_.actorSpriteComps10060 then
				local var_98_12 = 1

				for iter_98_3, iter_98_4 in pairs(arg_95_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_98_4 then
						iter_98_4.color = Color.New(var_98_12, var_98_12, var_98_12)
					end
				end

				arg_95_1.var_.actorSpriteComps10060 = nil
			end

			local var_98_13 = arg_95_1.actors_["1061"]
			local var_98_14 = 0

			if var_98_14 < arg_95_1.time_ and arg_95_1.time_ <= var_98_14 + arg_98_0 and arg_95_1.var_.actorSpriteComps1061 == nil then
				arg_95_1.var_.actorSpriteComps1061 = var_98_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_15 = 0.034

			if var_98_14 <= arg_95_1.time_ and arg_95_1.time_ < var_98_14 + var_98_15 then
				local var_98_16 = (arg_95_1.time_ - var_98_14) / var_98_15

				if arg_95_1.var_.actorSpriteComps1061 then
					for iter_98_5, iter_98_6 in pairs(arg_95_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_98_6 then
							local var_98_17 = Mathf.Lerp(iter_98_6.color.r, 0.5, var_98_16)

							iter_98_6.color = Color.New(var_98_17, var_98_17, var_98_17)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_14 + var_98_15 and arg_95_1.time_ < var_98_14 + var_98_15 + arg_98_0 and arg_95_1.var_.actorSpriteComps1061 then
				local var_98_18 = 0.5

				for iter_98_7, iter_98_8 in pairs(arg_95_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_98_8 then
						iter_98_8.color = Color.New(var_98_18, var_98_18, var_98_18)
					end
				end

				arg_95_1.var_.actorSpriteComps1061 = nil
			end

			local var_98_19 = 0
			local var_98_20 = 0.125

			if var_98_19 < arg_95_1.time_ and arg_95_1.time_ <= var_98_19 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_21 = arg_95_1:FormatText(StoryNameCfg[597].name)

				arg_95_1.leftNameTxt_.text = var_98_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_22 = arg_95_1:GetWordFromCfg(410241024)
				local var_98_23 = arg_95_1:FormatText(var_98_22.content)

				arg_95_1.text_.text = var_98_23

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_24 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241024", "story_v_out_410241.awb") ~= 0 then
					local var_98_27 = manager.audio:GetVoiceLength("story_v_out_410241", "410241024", "story_v_out_410241.awb") / 1000

					if var_98_27 + var_98_19 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_27 + var_98_19
					end

					if var_98_22.prefab_name ~= "" and arg_95_1.actors_[var_98_22.prefab_name] ~= nil then
						local var_98_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_22.prefab_name].transform, "story_v_out_410241", "410241024", "story_v_out_410241.awb")

						arg_95_1:RecordAudio("410241024", var_98_28)
						arg_95_1:RecordAudio("410241024", var_98_28)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_410241", "410241024", "story_v_out_410241.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_410241", "410241024", "story_v_out_410241.awb")
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
	Play410241025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 410241025
		arg_99_1.duration_ = 10.733

		local var_99_0 = {
			ja = 10.733,
			CriLanguages = 5.566,
			zh = 5.566
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
				arg_99_0:Play410241026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1061"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1061 = var_102_0.localPosition
				var_102_0.localScale = Vector3.New(1, 1, 1)

				arg_99_1:CheckSpriteTmpPos("1061", 2)

				local var_102_2 = var_102_0.childCount

				for iter_102_0 = 0, var_102_2 - 1 do
					local var_102_3 = var_102_0:GetChild(iter_102_0)

					if var_102_3.name == "" or not string.find(var_102_3.name, "split") then
						var_102_3.gameObject:SetActive(true)
					else
						var_102_3.gameObject:SetActive(false)
					end
				end
			end

			local var_102_4 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_4 then
				local var_102_5 = (arg_99_1.time_ - var_102_1) / var_102_4
				local var_102_6 = Vector3.New(-390, -490, 18)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1061, var_102_6, var_102_5)
			end

			if arg_99_1.time_ >= var_102_1 + var_102_4 and arg_99_1.time_ < var_102_1 + var_102_4 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_102_7 = arg_99_1.actors_["10060"]
			local var_102_8 = 0

			if var_102_8 < arg_99_1.time_ and arg_99_1.time_ <= var_102_8 + arg_102_0 and arg_99_1.var_.actorSpriteComps10060 == nil then
				arg_99_1.var_.actorSpriteComps10060 = var_102_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_9 = 0.034

			if var_102_8 <= arg_99_1.time_ and arg_99_1.time_ < var_102_8 + var_102_9 then
				local var_102_10 = (arg_99_1.time_ - var_102_8) / var_102_9

				if arg_99_1.var_.actorSpriteComps10060 then
					for iter_102_1, iter_102_2 in pairs(arg_99_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_102_2 then
							local var_102_11 = Mathf.Lerp(iter_102_2.color.r, 0.5, var_102_10)

							iter_102_2.color = Color.New(var_102_11, var_102_11, var_102_11)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_8 + var_102_9 and arg_99_1.time_ < var_102_8 + var_102_9 + arg_102_0 and arg_99_1.var_.actorSpriteComps10060 then
				local var_102_12 = 0.5

				for iter_102_3, iter_102_4 in pairs(arg_99_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_102_4 then
						iter_102_4.color = Color.New(var_102_12, var_102_12, var_102_12)
					end
				end

				arg_99_1.var_.actorSpriteComps10060 = nil
			end

			local var_102_13 = arg_99_1.actors_["1061"]
			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 and arg_99_1.var_.actorSpriteComps1061 == nil then
				arg_99_1.var_.actorSpriteComps1061 = var_102_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_15 = 0.034

			if var_102_14 <= arg_99_1.time_ and arg_99_1.time_ < var_102_14 + var_102_15 then
				local var_102_16 = (arg_99_1.time_ - var_102_14) / var_102_15

				if arg_99_1.var_.actorSpriteComps1061 then
					for iter_102_5, iter_102_6 in pairs(arg_99_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_102_6 then
							local var_102_17 = Mathf.Lerp(iter_102_6.color.r, 1, var_102_16)

							iter_102_6.color = Color.New(var_102_17, var_102_17, var_102_17)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_14 + var_102_15 and arg_99_1.time_ < var_102_14 + var_102_15 + arg_102_0 and arg_99_1.var_.actorSpriteComps1061 then
				local var_102_18 = 1

				for iter_102_7, iter_102_8 in pairs(arg_99_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_102_8 then
						iter_102_8.color = Color.New(var_102_18, var_102_18, var_102_18)
					end
				end

				arg_99_1.var_.actorSpriteComps1061 = nil
			end

			local var_102_19 = 0
			local var_102_20 = 0.45

			if var_102_19 < arg_99_1.time_ and arg_99_1.time_ <= var_102_19 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_21 = arg_99_1:FormatText(StoryNameCfg[612].name)

				arg_99_1.leftNameTxt_.text = var_102_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_22 = arg_99_1:GetWordFromCfg(410241025)
				local var_102_23 = arg_99_1:FormatText(var_102_22.content)

				arg_99_1.text_.text = var_102_23

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_24 = 18
				local var_102_25 = utf8.len(var_102_23)
				local var_102_26 = var_102_24 <= 0 and var_102_20 or var_102_20 * (var_102_25 / var_102_24)

				if var_102_26 > 0 and var_102_20 < var_102_26 then
					arg_99_1.talkMaxDuration = var_102_26

					if var_102_26 + var_102_19 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_26 + var_102_19
					end
				end

				arg_99_1.text_.text = var_102_23
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241025", "story_v_out_410241.awb") ~= 0 then
					local var_102_27 = manager.audio:GetVoiceLength("story_v_out_410241", "410241025", "story_v_out_410241.awb") / 1000

					if var_102_27 + var_102_19 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_27 + var_102_19
					end

					if var_102_22.prefab_name ~= "" and arg_99_1.actors_[var_102_22.prefab_name] ~= nil then
						local var_102_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_22.prefab_name].transform, "story_v_out_410241", "410241025", "story_v_out_410241.awb")

						arg_99_1:RecordAudio("410241025", var_102_28)
						arg_99_1:RecordAudio("410241025", var_102_28)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_410241", "410241025", "story_v_out_410241.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_410241", "410241025", "story_v_out_410241.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_29 = math.max(var_102_20, arg_99_1.talkMaxDuration)

			if var_102_19 <= arg_99_1.time_ and arg_99_1.time_ < var_102_19 + var_102_29 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_19) / var_102_29

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_19 + var_102_29 and arg_99_1.time_ < var_102_19 + var_102_29 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play410241026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 410241026
		arg_103_1.duration_ = 4.433

		local var_103_0 = {
			ja = 4.3,
			CriLanguages = 4.433,
			zh = 4.433
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
				arg_103_0:Play410241027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["10060"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos10060 = var_106_0.localPosition
				var_106_0.localScale = Vector3.New(1, 1, 1)

				arg_103_1:CheckSpriteTmpPos("10060", 4)

				local var_106_2 = var_106_0.childCount

				for iter_106_0 = 0, var_106_2 - 1 do
					local var_106_3 = var_106_0:GetChild(iter_106_0)

					if var_106_3.name == "" or not string.find(var_106_3.name, "split") then
						var_106_3.gameObject:SetActive(true)
					else
						var_106_3.gameObject:SetActive(false)
					end
				end
			end

			local var_106_4 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_4 then
				local var_106_5 = (arg_103_1.time_ - var_106_1) / var_106_4
				local var_106_6 = Vector3.New(390, -400, 0)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos10060, var_106_6, var_106_5)
			end

			if arg_103_1.time_ >= var_106_1 + var_106_4 and arg_103_1.time_ < var_106_1 + var_106_4 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_106_7 = arg_103_1.actors_["10060"]
			local var_106_8 = 0

			if var_106_8 < arg_103_1.time_ and arg_103_1.time_ <= var_106_8 + arg_106_0 and arg_103_1.var_.actorSpriteComps10060 == nil then
				arg_103_1.var_.actorSpriteComps10060 = var_106_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_9 = 0.034

			if var_106_8 <= arg_103_1.time_ and arg_103_1.time_ < var_106_8 + var_106_9 then
				local var_106_10 = (arg_103_1.time_ - var_106_8) / var_106_9

				if arg_103_1.var_.actorSpriteComps10060 then
					for iter_106_1, iter_106_2 in pairs(arg_103_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_106_2 then
							local var_106_11 = Mathf.Lerp(iter_106_2.color.r, 1, var_106_10)

							iter_106_2.color = Color.New(var_106_11, var_106_11, var_106_11)
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_8 + var_106_9 and arg_103_1.time_ < var_106_8 + var_106_9 + arg_106_0 and arg_103_1.var_.actorSpriteComps10060 then
				local var_106_12 = 1

				for iter_106_3, iter_106_4 in pairs(arg_103_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_106_4 then
						iter_106_4.color = Color.New(var_106_12, var_106_12, var_106_12)
					end
				end

				arg_103_1.var_.actorSpriteComps10060 = nil
			end

			local var_106_13 = arg_103_1.actors_["1061"]
			local var_106_14 = 0

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 and arg_103_1.var_.actorSpriteComps1061 == nil then
				arg_103_1.var_.actorSpriteComps1061 = var_106_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_15 = 0.034

			if var_106_14 <= arg_103_1.time_ and arg_103_1.time_ < var_106_14 + var_106_15 then
				local var_106_16 = (arg_103_1.time_ - var_106_14) / var_106_15

				if arg_103_1.var_.actorSpriteComps1061 then
					for iter_106_5, iter_106_6 in pairs(arg_103_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_106_6 then
							local var_106_17 = Mathf.Lerp(iter_106_6.color.r, 0.5, var_106_16)

							iter_106_6.color = Color.New(var_106_17, var_106_17, var_106_17)
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_14 + var_106_15 and arg_103_1.time_ < var_106_14 + var_106_15 + arg_106_0 and arg_103_1.var_.actorSpriteComps1061 then
				local var_106_18 = 0.5

				for iter_106_7, iter_106_8 in pairs(arg_103_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_106_8 then
						iter_106_8.color = Color.New(var_106_18, var_106_18, var_106_18)
					end
				end

				arg_103_1.var_.actorSpriteComps1061 = nil
			end

			local var_106_19 = 0
			local var_106_20 = 0.675

			if var_106_19 < arg_103_1.time_ and arg_103_1.time_ <= var_106_19 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_21 = arg_103_1:FormatText(StoryNameCfg[597].name)

				arg_103_1.leftNameTxt_.text = var_106_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_22 = arg_103_1:GetWordFromCfg(410241026)
				local var_106_23 = arg_103_1:FormatText(var_106_22.content)

				arg_103_1.text_.text = var_106_23

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_24 = 27
				local var_106_25 = utf8.len(var_106_23)
				local var_106_26 = var_106_24 <= 0 and var_106_20 or var_106_20 * (var_106_25 / var_106_24)

				if var_106_26 > 0 and var_106_20 < var_106_26 then
					arg_103_1.talkMaxDuration = var_106_26

					if var_106_26 + var_106_19 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_26 + var_106_19
					end
				end

				arg_103_1.text_.text = var_106_23
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241026", "story_v_out_410241.awb") ~= 0 then
					local var_106_27 = manager.audio:GetVoiceLength("story_v_out_410241", "410241026", "story_v_out_410241.awb") / 1000

					if var_106_27 + var_106_19 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_27 + var_106_19
					end

					if var_106_22.prefab_name ~= "" and arg_103_1.actors_[var_106_22.prefab_name] ~= nil then
						local var_106_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_22.prefab_name].transform, "story_v_out_410241", "410241026", "story_v_out_410241.awb")

						arg_103_1:RecordAudio("410241026", var_106_28)
						arg_103_1:RecordAudio("410241026", var_106_28)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_410241", "410241026", "story_v_out_410241.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_410241", "410241026", "story_v_out_410241.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_29 = math.max(var_106_20, arg_103_1.talkMaxDuration)

			if var_106_19 <= arg_103_1.time_ and arg_103_1.time_ < var_106_19 + var_106_29 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_19) / var_106_29

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_19 + var_106_29 and arg_103_1.time_ < var_106_19 + var_106_29 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play410241027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 410241027
		arg_107_1.duration_ = 16.6

		local var_107_0 = {
			ja = 16.6,
			CriLanguages = 10.1,
			zh = 10.1
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
				arg_107_0:Play410241028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1061"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos1061 = var_110_0.localPosition
				var_110_0.localScale = Vector3.New(1, 1, 1)

				arg_107_1:CheckSpriteTmpPos("1061", 2)

				local var_110_2 = var_110_0.childCount

				for iter_110_0 = 0, var_110_2 - 1 do
					local var_110_3 = var_110_0:GetChild(iter_110_0)

					if var_110_3.name == "" or not string.find(var_110_3.name, "split") then
						var_110_3.gameObject:SetActive(true)
					else
						var_110_3.gameObject:SetActive(false)
					end
				end
			end

			local var_110_4 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_4 then
				local var_110_5 = (arg_107_1.time_ - var_110_1) / var_110_4
				local var_110_6 = Vector3.New(-390, -490, 18)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1061, var_110_6, var_110_5)
			end

			if arg_107_1.time_ >= var_110_1 + var_110_4 and arg_107_1.time_ < var_110_1 + var_110_4 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_110_7 = arg_107_1.actors_["10060"]
			local var_110_8 = 0

			if var_110_8 < arg_107_1.time_ and arg_107_1.time_ <= var_110_8 + arg_110_0 and arg_107_1.var_.actorSpriteComps10060 == nil then
				arg_107_1.var_.actorSpriteComps10060 = var_110_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_9 = 0.034

			if var_110_8 <= arg_107_1.time_ and arg_107_1.time_ < var_110_8 + var_110_9 then
				local var_110_10 = (arg_107_1.time_ - var_110_8) / var_110_9

				if arg_107_1.var_.actorSpriteComps10060 then
					for iter_110_1, iter_110_2 in pairs(arg_107_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_110_2 then
							local var_110_11 = Mathf.Lerp(iter_110_2.color.r, 0.5, var_110_10)

							iter_110_2.color = Color.New(var_110_11, var_110_11, var_110_11)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_8 + var_110_9 and arg_107_1.time_ < var_110_8 + var_110_9 + arg_110_0 and arg_107_1.var_.actorSpriteComps10060 then
				local var_110_12 = 0.5

				for iter_110_3, iter_110_4 in pairs(arg_107_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_110_4 then
						iter_110_4.color = Color.New(var_110_12, var_110_12, var_110_12)
					end
				end

				arg_107_1.var_.actorSpriteComps10060 = nil
			end

			local var_110_13 = arg_107_1.actors_["1061"]
			local var_110_14 = 0

			if var_110_14 < arg_107_1.time_ and arg_107_1.time_ <= var_110_14 + arg_110_0 and arg_107_1.var_.actorSpriteComps1061 == nil then
				arg_107_1.var_.actorSpriteComps1061 = var_110_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_15 = 0.034

			if var_110_14 <= arg_107_1.time_ and arg_107_1.time_ < var_110_14 + var_110_15 then
				local var_110_16 = (arg_107_1.time_ - var_110_14) / var_110_15

				if arg_107_1.var_.actorSpriteComps1061 then
					for iter_110_5, iter_110_6 in pairs(arg_107_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_110_6 then
							local var_110_17 = Mathf.Lerp(iter_110_6.color.r, 1, var_110_16)

							iter_110_6.color = Color.New(var_110_17, var_110_17, var_110_17)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_14 + var_110_15 and arg_107_1.time_ < var_110_14 + var_110_15 + arg_110_0 and arg_107_1.var_.actorSpriteComps1061 then
				local var_110_18 = 1

				for iter_110_7, iter_110_8 in pairs(arg_107_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_110_8 then
						iter_110_8.color = Color.New(var_110_18, var_110_18, var_110_18)
					end
				end

				arg_107_1.var_.actorSpriteComps1061 = nil
			end

			local var_110_19 = 0
			local var_110_20 = 1.05

			if var_110_19 < arg_107_1.time_ and arg_107_1.time_ <= var_110_19 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_21 = arg_107_1:FormatText(StoryNameCfg[612].name)

				arg_107_1.leftNameTxt_.text = var_110_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_22 = arg_107_1:GetWordFromCfg(410241027)
				local var_110_23 = arg_107_1:FormatText(var_110_22.content)

				arg_107_1.text_.text = var_110_23

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_24 = 42
				local var_110_25 = utf8.len(var_110_23)
				local var_110_26 = var_110_24 <= 0 and var_110_20 or var_110_20 * (var_110_25 / var_110_24)

				if var_110_26 > 0 and var_110_20 < var_110_26 then
					arg_107_1.talkMaxDuration = var_110_26

					if var_110_26 + var_110_19 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_26 + var_110_19
					end
				end

				arg_107_1.text_.text = var_110_23
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241027", "story_v_out_410241.awb") ~= 0 then
					local var_110_27 = manager.audio:GetVoiceLength("story_v_out_410241", "410241027", "story_v_out_410241.awb") / 1000

					if var_110_27 + var_110_19 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_27 + var_110_19
					end

					if var_110_22.prefab_name ~= "" and arg_107_1.actors_[var_110_22.prefab_name] ~= nil then
						local var_110_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_22.prefab_name].transform, "story_v_out_410241", "410241027", "story_v_out_410241.awb")

						arg_107_1:RecordAudio("410241027", var_110_28)
						arg_107_1:RecordAudio("410241027", var_110_28)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_410241", "410241027", "story_v_out_410241.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_410241", "410241027", "story_v_out_410241.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_29 = math.max(var_110_20, arg_107_1.talkMaxDuration)

			if var_110_19 <= arg_107_1.time_ and arg_107_1.time_ < var_110_19 + var_110_29 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_19) / var_110_29

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_19 + var_110_29 and arg_107_1.time_ < var_110_19 + var_110_29 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play410241028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 410241028
		arg_111_1.duration_ = 7.4

		local var_111_0 = {
			ja = 7.4,
			CriLanguages = 5.033,
			zh = 5.033
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
				arg_111_0:Play410241029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 0.45

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_2 = arg_111_1:FormatText(StoryNameCfg[612].name)

				arg_111_1.leftNameTxt_.text = var_114_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_3 = arg_111_1:GetWordFromCfg(410241028)
				local var_114_4 = arg_111_1:FormatText(var_114_3.content)

				arg_111_1.text_.text = var_114_4

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241028", "story_v_out_410241.awb") ~= 0 then
					local var_114_8 = manager.audio:GetVoiceLength("story_v_out_410241", "410241028", "story_v_out_410241.awb") / 1000

					if var_114_8 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_8 + var_114_0
					end

					if var_114_3.prefab_name ~= "" and arg_111_1.actors_[var_114_3.prefab_name] ~= nil then
						local var_114_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_3.prefab_name].transform, "story_v_out_410241", "410241028", "story_v_out_410241.awb")

						arg_111_1:RecordAudio("410241028", var_114_9)
						arg_111_1:RecordAudio("410241028", var_114_9)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_410241", "410241028", "story_v_out_410241.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_410241", "410241028", "story_v_out_410241.awb")
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
	Play410241029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 410241029
		arg_115_1.duration_ = 6.366

		local var_115_0 = {
			ja = 6.366,
			CriLanguages = 6.3,
			zh = 6.3
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
				arg_115_0:Play410241030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["10060"].transform
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.var_.moveOldPos10060 = var_118_0.localPosition
				var_118_0.localScale = Vector3.New(1, 1, 1)

				arg_115_1:CheckSpriteTmpPos("10060", 4)

				local var_118_2 = var_118_0.childCount

				for iter_118_0 = 0, var_118_2 - 1 do
					local var_118_3 = var_118_0:GetChild(iter_118_0)

					if var_118_3.name == "split_3" or not string.find(var_118_3.name, "split") then
						var_118_3.gameObject:SetActive(true)
					else
						var_118_3.gameObject:SetActive(false)
					end
				end
			end

			local var_118_4 = 0.001

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_4 then
				local var_118_5 = (arg_115_1.time_ - var_118_1) / var_118_4
				local var_118_6 = Vector3.New(390, -400, 0)

				var_118_0.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos10060, var_118_6, var_118_5)
			end

			if arg_115_1.time_ >= var_118_1 + var_118_4 and arg_115_1.time_ < var_118_1 + var_118_4 + arg_118_0 then
				var_118_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_118_7 = arg_115_1.actors_["10060"]
			local var_118_8 = 0

			if var_118_8 < arg_115_1.time_ and arg_115_1.time_ <= var_118_8 + arg_118_0 and arg_115_1.var_.actorSpriteComps10060 == nil then
				arg_115_1.var_.actorSpriteComps10060 = var_118_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_9 = 0.034

			if var_118_8 <= arg_115_1.time_ and arg_115_1.time_ < var_118_8 + var_118_9 then
				local var_118_10 = (arg_115_1.time_ - var_118_8) / var_118_9

				if arg_115_1.var_.actorSpriteComps10060 then
					for iter_118_1, iter_118_2 in pairs(arg_115_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_118_2 then
							local var_118_11 = Mathf.Lerp(iter_118_2.color.r, 1, var_118_10)

							iter_118_2.color = Color.New(var_118_11, var_118_11, var_118_11)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_8 + var_118_9 and arg_115_1.time_ < var_118_8 + var_118_9 + arg_118_0 and arg_115_1.var_.actorSpriteComps10060 then
				local var_118_12 = 1

				for iter_118_3, iter_118_4 in pairs(arg_115_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_118_4 then
						iter_118_4.color = Color.New(var_118_12, var_118_12, var_118_12)
					end
				end

				arg_115_1.var_.actorSpriteComps10060 = nil
			end

			local var_118_13 = arg_115_1.actors_["1061"]
			local var_118_14 = 0

			if var_118_14 < arg_115_1.time_ and arg_115_1.time_ <= var_118_14 + arg_118_0 and arg_115_1.var_.actorSpriteComps1061 == nil then
				arg_115_1.var_.actorSpriteComps1061 = var_118_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_15 = 0.034

			if var_118_14 <= arg_115_1.time_ and arg_115_1.time_ < var_118_14 + var_118_15 then
				local var_118_16 = (arg_115_1.time_ - var_118_14) / var_118_15

				if arg_115_1.var_.actorSpriteComps1061 then
					for iter_118_5, iter_118_6 in pairs(arg_115_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_118_6 then
							local var_118_17 = Mathf.Lerp(iter_118_6.color.r, 0.5, var_118_16)

							iter_118_6.color = Color.New(var_118_17, var_118_17, var_118_17)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_14 + var_118_15 and arg_115_1.time_ < var_118_14 + var_118_15 + arg_118_0 and arg_115_1.var_.actorSpriteComps1061 then
				local var_118_18 = 0.5

				for iter_118_7, iter_118_8 in pairs(arg_115_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_118_8 then
						iter_118_8.color = Color.New(var_118_18, var_118_18, var_118_18)
					end
				end

				arg_115_1.var_.actorSpriteComps1061 = nil
			end

			local var_118_19 = 0
			local var_118_20 = 0.575

			if var_118_19 < arg_115_1.time_ and arg_115_1.time_ <= var_118_19 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_21 = arg_115_1:FormatText(StoryNameCfg[597].name)

				arg_115_1.leftNameTxt_.text = var_118_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_22 = arg_115_1:GetWordFromCfg(410241029)
				local var_118_23 = arg_115_1:FormatText(var_118_22.content)

				arg_115_1.text_.text = var_118_23

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_24 = 23
				local var_118_25 = utf8.len(var_118_23)
				local var_118_26 = var_118_24 <= 0 and var_118_20 or var_118_20 * (var_118_25 / var_118_24)

				if var_118_26 > 0 and var_118_20 < var_118_26 then
					arg_115_1.talkMaxDuration = var_118_26

					if var_118_26 + var_118_19 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_26 + var_118_19
					end
				end

				arg_115_1.text_.text = var_118_23
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241029", "story_v_out_410241.awb") ~= 0 then
					local var_118_27 = manager.audio:GetVoiceLength("story_v_out_410241", "410241029", "story_v_out_410241.awb") / 1000

					if var_118_27 + var_118_19 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_27 + var_118_19
					end

					if var_118_22.prefab_name ~= "" and arg_115_1.actors_[var_118_22.prefab_name] ~= nil then
						local var_118_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_22.prefab_name].transform, "story_v_out_410241", "410241029", "story_v_out_410241.awb")

						arg_115_1:RecordAudio("410241029", var_118_28)
						arg_115_1:RecordAudio("410241029", var_118_28)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_410241", "410241029", "story_v_out_410241.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_410241", "410241029", "story_v_out_410241.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_29 = math.max(var_118_20, arg_115_1.talkMaxDuration)

			if var_118_19 <= arg_115_1.time_ and arg_115_1.time_ < var_118_19 + var_118_29 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_19) / var_118_29

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_19 + var_118_29 and arg_115_1.time_ < var_118_19 + var_118_29 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play410241030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 410241030
		arg_119_1.duration_ = 6.2

		local var_119_0 = {
			ja = 6.2,
			CriLanguages = 3.3,
			zh = 3.3
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
				arg_119_0:Play410241031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1061"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos1061 = var_122_0.localPosition
				var_122_0.localScale = Vector3.New(1, 1, 1)

				arg_119_1:CheckSpriteTmpPos("1061", 2)

				local var_122_2 = var_122_0.childCount

				for iter_122_0 = 0, var_122_2 - 1 do
					local var_122_3 = var_122_0:GetChild(iter_122_0)

					if var_122_3.name == "" or not string.find(var_122_3.name, "split") then
						var_122_3.gameObject:SetActive(true)
					else
						var_122_3.gameObject:SetActive(false)
					end
				end
			end

			local var_122_4 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_4 then
				local var_122_5 = (arg_119_1.time_ - var_122_1) / var_122_4
				local var_122_6 = Vector3.New(-390, -490, 18)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1061, var_122_6, var_122_5)
			end

			if arg_119_1.time_ >= var_122_1 + var_122_4 and arg_119_1.time_ < var_122_1 + var_122_4 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_122_7 = arg_119_1.actors_["10060"]
			local var_122_8 = 0

			if var_122_8 < arg_119_1.time_ and arg_119_1.time_ <= var_122_8 + arg_122_0 and arg_119_1.var_.actorSpriteComps10060 == nil then
				arg_119_1.var_.actorSpriteComps10060 = var_122_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_9 = 0.034

			if var_122_8 <= arg_119_1.time_ and arg_119_1.time_ < var_122_8 + var_122_9 then
				local var_122_10 = (arg_119_1.time_ - var_122_8) / var_122_9

				if arg_119_1.var_.actorSpriteComps10060 then
					for iter_122_1, iter_122_2 in pairs(arg_119_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_122_2 then
							local var_122_11 = Mathf.Lerp(iter_122_2.color.r, 0.5, var_122_10)

							iter_122_2.color = Color.New(var_122_11, var_122_11, var_122_11)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_8 + var_122_9 and arg_119_1.time_ < var_122_8 + var_122_9 + arg_122_0 and arg_119_1.var_.actorSpriteComps10060 then
				local var_122_12 = 0.5

				for iter_122_3, iter_122_4 in pairs(arg_119_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_122_4 then
						iter_122_4.color = Color.New(var_122_12, var_122_12, var_122_12)
					end
				end

				arg_119_1.var_.actorSpriteComps10060 = nil
			end

			local var_122_13 = arg_119_1.actors_["1061"]
			local var_122_14 = 0

			if var_122_14 < arg_119_1.time_ and arg_119_1.time_ <= var_122_14 + arg_122_0 and arg_119_1.var_.actorSpriteComps1061 == nil then
				arg_119_1.var_.actorSpriteComps1061 = var_122_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_15 = 0.034

			if var_122_14 <= arg_119_1.time_ and arg_119_1.time_ < var_122_14 + var_122_15 then
				local var_122_16 = (arg_119_1.time_ - var_122_14) / var_122_15

				if arg_119_1.var_.actorSpriteComps1061 then
					for iter_122_5, iter_122_6 in pairs(arg_119_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_122_6 then
							local var_122_17 = Mathf.Lerp(iter_122_6.color.r, 1, var_122_16)

							iter_122_6.color = Color.New(var_122_17, var_122_17, var_122_17)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_14 + var_122_15 and arg_119_1.time_ < var_122_14 + var_122_15 + arg_122_0 and arg_119_1.var_.actorSpriteComps1061 then
				local var_122_18 = 1

				for iter_122_7, iter_122_8 in pairs(arg_119_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_122_8 then
						iter_122_8.color = Color.New(var_122_18, var_122_18, var_122_18)
					end
				end

				arg_119_1.var_.actorSpriteComps1061 = nil
			end

			local var_122_19 = 0
			local var_122_20 = 0.2

			if var_122_19 < arg_119_1.time_ and arg_119_1.time_ <= var_122_19 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_21 = arg_119_1:FormatText(StoryNameCfg[612].name)

				arg_119_1.leftNameTxt_.text = var_122_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_22 = arg_119_1:GetWordFromCfg(410241030)
				local var_122_23 = arg_119_1:FormatText(var_122_22.content)

				arg_119_1.text_.text = var_122_23

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_24 = 8
				local var_122_25 = utf8.len(var_122_23)
				local var_122_26 = var_122_24 <= 0 and var_122_20 or var_122_20 * (var_122_25 / var_122_24)

				if var_122_26 > 0 and var_122_20 < var_122_26 then
					arg_119_1.talkMaxDuration = var_122_26

					if var_122_26 + var_122_19 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_26 + var_122_19
					end
				end

				arg_119_1.text_.text = var_122_23
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241030", "story_v_out_410241.awb") ~= 0 then
					local var_122_27 = manager.audio:GetVoiceLength("story_v_out_410241", "410241030", "story_v_out_410241.awb") / 1000

					if var_122_27 + var_122_19 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_27 + var_122_19
					end

					if var_122_22.prefab_name ~= "" and arg_119_1.actors_[var_122_22.prefab_name] ~= nil then
						local var_122_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_22.prefab_name].transform, "story_v_out_410241", "410241030", "story_v_out_410241.awb")

						arg_119_1:RecordAudio("410241030", var_122_28)
						arg_119_1:RecordAudio("410241030", var_122_28)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_410241", "410241030", "story_v_out_410241.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_410241", "410241030", "story_v_out_410241.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_29 = math.max(var_122_20, arg_119_1.talkMaxDuration)

			if var_122_19 <= arg_119_1.time_ and arg_119_1.time_ < var_122_19 + var_122_29 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_19) / var_122_29

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_19 + var_122_29 and arg_119_1.time_ < var_122_19 + var_122_29 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play410241031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 410241031
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play410241032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1061"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos1061 = var_126_0.localPosition
				var_126_0.localScale = Vector3.New(1, 1, 1)

				arg_123_1:CheckSpriteTmpPos("1061", 7)

				local var_126_2 = var_126_0.childCount

				for iter_126_0 = 0, var_126_2 - 1 do
					local var_126_3 = var_126_0:GetChild(iter_126_0)

					if var_126_3.name == "" or not string.find(var_126_3.name, "split") then
						var_126_3.gameObject:SetActive(true)
					else
						var_126_3.gameObject:SetActive(false)
					end
				end
			end

			local var_126_4 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_4 then
				local var_126_5 = (arg_123_1.time_ - var_126_1) / var_126_4
				local var_126_6 = Vector3.New(0, -2000, 18)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1061, var_126_6, var_126_5)
			end

			if arg_123_1.time_ >= var_126_1 + var_126_4 and arg_123_1.time_ < var_126_1 + var_126_4 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_126_7 = arg_123_1.actors_["10060"].transform
			local var_126_8 = 0

			if var_126_8 < arg_123_1.time_ and arg_123_1.time_ <= var_126_8 + arg_126_0 then
				arg_123_1.var_.moveOldPos10060 = var_126_7.localPosition
				var_126_7.localScale = Vector3.New(1, 1, 1)

				arg_123_1:CheckSpriteTmpPos("10060", 7)

				local var_126_9 = var_126_7.childCount

				for iter_126_1 = 0, var_126_9 - 1 do
					local var_126_10 = var_126_7:GetChild(iter_126_1)

					if var_126_10.name == "" or not string.find(var_126_10.name, "split") then
						var_126_10.gameObject:SetActive(true)
					else
						var_126_10.gameObject:SetActive(false)
					end
				end
			end

			local var_126_11 = 0.001

			if var_126_8 <= arg_123_1.time_ and arg_123_1.time_ < var_126_8 + var_126_11 then
				local var_126_12 = (arg_123_1.time_ - var_126_8) / var_126_11
				local var_126_13 = Vector3.New(0, -2000, 0)

				var_126_7.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos10060, var_126_13, var_126_12)
			end

			if arg_123_1.time_ >= var_126_8 + var_126_11 and arg_123_1.time_ < var_126_8 + var_126_11 + arg_126_0 then
				var_126_7.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_126_14 = arg_123_1.actors_["1061"]
			local var_126_15 = 0

			if var_126_15 < arg_123_1.time_ and arg_123_1.time_ <= var_126_15 + arg_126_0 and arg_123_1.var_.actorSpriteComps1061 == nil then
				arg_123_1.var_.actorSpriteComps1061 = var_126_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_16 = 0.034

			if var_126_15 <= arg_123_1.time_ and arg_123_1.time_ < var_126_15 + var_126_16 then
				local var_126_17 = (arg_123_1.time_ - var_126_15) / var_126_16

				if arg_123_1.var_.actorSpriteComps1061 then
					for iter_126_2, iter_126_3 in pairs(arg_123_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_126_3 then
							local var_126_18 = Mathf.Lerp(iter_126_3.color.r, 0.5, var_126_17)

							iter_126_3.color = Color.New(var_126_18, var_126_18, var_126_18)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_15 + var_126_16 and arg_123_1.time_ < var_126_15 + var_126_16 + arg_126_0 and arg_123_1.var_.actorSpriteComps1061 then
				local var_126_19 = 0.5

				for iter_126_4, iter_126_5 in pairs(arg_123_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_126_5 then
						iter_126_5.color = Color.New(var_126_19, var_126_19, var_126_19)
					end
				end

				arg_123_1.var_.actorSpriteComps1061 = nil
			end

			local var_126_20 = arg_123_1.actors_["10060"]
			local var_126_21 = 0

			if var_126_21 < arg_123_1.time_ and arg_123_1.time_ <= var_126_21 + arg_126_0 and arg_123_1.var_.actorSpriteComps10060 == nil then
				arg_123_1.var_.actorSpriteComps10060 = var_126_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_22 = 0.034

			if var_126_21 <= arg_123_1.time_ and arg_123_1.time_ < var_126_21 + var_126_22 then
				local var_126_23 = (arg_123_1.time_ - var_126_21) / var_126_22

				if arg_123_1.var_.actorSpriteComps10060 then
					for iter_126_6, iter_126_7 in pairs(arg_123_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_126_7 then
							local var_126_24 = Mathf.Lerp(iter_126_7.color.r, 0.5, var_126_23)

							iter_126_7.color = Color.New(var_126_24, var_126_24, var_126_24)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_21 + var_126_22 and arg_123_1.time_ < var_126_21 + var_126_22 + arg_126_0 and arg_123_1.var_.actorSpriteComps10060 then
				local var_126_25 = 0.5

				for iter_126_8, iter_126_9 in pairs(arg_123_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_126_9 then
						iter_126_9.color = Color.New(var_126_25, var_126_25, var_126_25)
					end
				end

				arg_123_1.var_.actorSpriteComps10060 = nil
			end

			local var_126_26 = 0
			local var_126_27 = 0.7

			if var_126_26 < arg_123_1.time_ and arg_123_1.time_ <= var_126_26 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, false)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_28 = arg_123_1:GetWordFromCfg(410241031)
				local var_126_29 = arg_123_1:FormatText(var_126_28.content)

				arg_123_1.text_.text = var_126_29

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_30 = 28
				local var_126_31 = utf8.len(var_126_29)
				local var_126_32 = var_126_30 <= 0 and var_126_27 or var_126_27 * (var_126_31 / var_126_30)

				if var_126_32 > 0 and var_126_27 < var_126_32 then
					arg_123_1.talkMaxDuration = var_126_32

					if var_126_32 + var_126_26 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_32 + var_126_26
					end
				end

				arg_123_1.text_.text = var_126_29
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_33 = math.max(var_126_27, arg_123_1.talkMaxDuration)

			if var_126_26 <= arg_123_1.time_ and arg_123_1.time_ < var_126_26 + var_126_33 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_26) / var_126_33

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_26 + var_126_33 and arg_123_1.time_ < var_126_26 + var_126_33 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play410241032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 410241032
		arg_127_1.duration_ = 23.3

		local var_127_0 = {
			ja = 23.3,
			CriLanguages = 20.3,
			zh = 20.3
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
				arg_127_0:Play410241033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1061"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos1061 = var_130_0.localPosition
				var_130_0.localScale = Vector3.New(1, 1, 1)

				arg_127_1:CheckSpriteTmpPos("1061", 3)

				local var_130_2 = var_130_0.childCount

				for iter_130_0 = 0, var_130_2 - 1 do
					local var_130_3 = var_130_0:GetChild(iter_130_0)

					if var_130_3.name == "split_7" or not string.find(var_130_3.name, "split") then
						var_130_3.gameObject:SetActive(true)
					else
						var_130_3.gameObject:SetActive(false)
					end
				end
			end

			local var_130_4 = 0.001

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_4 then
				local var_130_5 = (arg_127_1.time_ - var_130_1) / var_130_4
				local var_130_6 = Vector3.New(0, -490, 18)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1061, var_130_6, var_130_5)
			end

			if arg_127_1.time_ >= var_130_1 + var_130_4 and arg_127_1.time_ < var_130_1 + var_130_4 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_130_7 = arg_127_1.actors_["1061"]
			local var_130_8 = 0

			if var_130_8 < arg_127_1.time_ and arg_127_1.time_ <= var_130_8 + arg_130_0 and arg_127_1.var_.actorSpriteComps1061 == nil then
				arg_127_1.var_.actorSpriteComps1061 = var_130_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_130_9 = 0.034

			if var_130_8 <= arg_127_1.time_ and arg_127_1.time_ < var_130_8 + var_130_9 then
				local var_130_10 = (arg_127_1.time_ - var_130_8) / var_130_9

				if arg_127_1.var_.actorSpriteComps1061 then
					for iter_130_1, iter_130_2 in pairs(arg_127_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_130_2 then
							local var_130_11 = Mathf.Lerp(iter_130_2.color.r, 1, var_130_10)

							iter_130_2.color = Color.New(var_130_11, var_130_11, var_130_11)
						end
					end
				end
			end

			if arg_127_1.time_ >= var_130_8 + var_130_9 and arg_127_1.time_ < var_130_8 + var_130_9 + arg_130_0 and arg_127_1.var_.actorSpriteComps1061 then
				local var_130_12 = 1

				for iter_130_3, iter_130_4 in pairs(arg_127_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_130_4 then
						iter_130_4.color = Color.New(var_130_12, var_130_12, var_130_12)
					end
				end

				arg_127_1.var_.actorSpriteComps1061 = nil
			end

			local var_130_13 = 0
			local var_130_14 = 1.525

			if var_130_13 < arg_127_1.time_ and arg_127_1.time_ <= var_130_13 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_15 = arg_127_1:FormatText(StoryNameCfg[612].name)

				arg_127_1.leftNameTxt_.text = var_130_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_16 = arg_127_1:GetWordFromCfg(410241032)
				local var_130_17 = arg_127_1:FormatText(var_130_16.content)

				arg_127_1.text_.text = var_130_17

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_18 = 61
				local var_130_19 = utf8.len(var_130_17)
				local var_130_20 = var_130_18 <= 0 and var_130_14 or var_130_14 * (var_130_19 / var_130_18)

				if var_130_20 > 0 and var_130_14 < var_130_20 then
					arg_127_1.talkMaxDuration = var_130_20

					if var_130_20 + var_130_13 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_20 + var_130_13
					end
				end

				arg_127_1.text_.text = var_130_17
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241032", "story_v_out_410241.awb") ~= 0 then
					local var_130_21 = manager.audio:GetVoiceLength("story_v_out_410241", "410241032", "story_v_out_410241.awb") / 1000

					if var_130_21 + var_130_13 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_21 + var_130_13
					end

					if var_130_16.prefab_name ~= "" and arg_127_1.actors_[var_130_16.prefab_name] ~= nil then
						local var_130_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_16.prefab_name].transform, "story_v_out_410241", "410241032", "story_v_out_410241.awb")

						arg_127_1:RecordAudio("410241032", var_130_22)
						arg_127_1:RecordAudio("410241032", var_130_22)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_410241", "410241032", "story_v_out_410241.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_410241", "410241032", "story_v_out_410241.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_23 = math.max(var_130_14, arg_127_1.talkMaxDuration)

			if var_130_13 <= arg_127_1.time_ and arg_127_1.time_ < var_130_13 + var_130_23 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_13) / var_130_23

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_13 + var_130_23 and arg_127_1.time_ < var_130_13 + var_130_23 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play410241033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 410241033
		arg_131_1.duration_ = 14.966

		local var_131_0 = {
			ja = 14.966,
			CriLanguages = 9.466,
			zh = 9.466
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
				arg_131_0:Play410241034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1061"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos1061 = var_134_0.localPosition
				var_134_0.localScale = Vector3.New(1, 1, 1)

				arg_131_1:CheckSpriteTmpPos("1061", 3)

				local var_134_2 = var_134_0.childCount

				for iter_134_0 = 0, var_134_2 - 1 do
					local var_134_3 = var_134_0:GetChild(iter_134_0)

					if var_134_3.name == "split_7" or not string.find(var_134_3.name, "split") then
						var_134_3.gameObject:SetActive(true)
					else
						var_134_3.gameObject:SetActive(false)
					end
				end
			end

			local var_134_4 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_4 then
				local var_134_5 = (arg_131_1.time_ - var_134_1) / var_134_4
				local var_134_6 = Vector3.New(0, -490, 18)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1061, var_134_6, var_134_5)
			end

			if arg_131_1.time_ >= var_134_1 + var_134_4 and arg_131_1.time_ < var_134_1 + var_134_4 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_134_7 = arg_131_1.actors_["1061"]
			local var_134_8 = 0

			if var_134_8 < arg_131_1.time_ and arg_131_1.time_ <= var_134_8 + arg_134_0 and arg_131_1.var_.actorSpriteComps1061 == nil then
				arg_131_1.var_.actorSpriteComps1061 = var_134_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_134_9 = 0.034

			if var_134_8 <= arg_131_1.time_ and arg_131_1.time_ < var_134_8 + var_134_9 then
				local var_134_10 = (arg_131_1.time_ - var_134_8) / var_134_9

				if arg_131_1.var_.actorSpriteComps1061 then
					for iter_134_1, iter_134_2 in pairs(arg_131_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_134_2 then
							local var_134_11 = Mathf.Lerp(iter_134_2.color.r, 1, var_134_10)

							iter_134_2.color = Color.New(var_134_11, var_134_11, var_134_11)
						end
					end
				end
			end

			if arg_131_1.time_ >= var_134_8 + var_134_9 and arg_131_1.time_ < var_134_8 + var_134_9 + arg_134_0 and arg_131_1.var_.actorSpriteComps1061 then
				local var_134_12 = 1

				for iter_134_3, iter_134_4 in pairs(arg_131_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_134_4 then
						iter_134_4.color = Color.New(var_134_12, var_134_12, var_134_12)
					end
				end

				arg_131_1.var_.actorSpriteComps1061 = nil
			end

			local var_134_13 = 0
			local var_134_14 = 0.975

			if var_134_13 < arg_131_1.time_ and arg_131_1.time_ <= var_134_13 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_15 = arg_131_1:FormatText(StoryNameCfg[612].name)

				arg_131_1.leftNameTxt_.text = var_134_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_16 = arg_131_1:GetWordFromCfg(410241033)
				local var_134_17 = arg_131_1:FormatText(var_134_16.content)

				arg_131_1.text_.text = var_134_17

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_18 = 39
				local var_134_19 = utf8.len(var_134_17)
				local var_134_20 = var_134_18 <= 0 and var_134_14 or var_134_14 * (var_134_19 / var_134_18)

				if var_134_20 > 0 and var_134_14 < var_134_20 then
					arg_131_1.talkMaxDuration = var_134_20

					if var_134_20 + var_134_13 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_20 + var_134_13
					end
				end

				arg_131_1.text_.text = var_134_17
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241033", "story_v_out_410241.awb") ~= 0 then
					local var_134_21 = manager.audio:GetVoiceLength("story_v_out_410241", "410241033", "story_v_out_410241.awb") / 1000

					if var_134_21 + var_134_13 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_21 + var_134_13
					end

					if var_134_16.prefab_name ~= "" and arg_131_1.actors_[var_134_16.prefab_name] ~= nil then
						local var_134_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_16.prefab_name].transform, "story_v_out_410241", "410241033", "story_v_out_410241.awb")

						arg_131_1:RecordAudio("410241033", var_134_22)
						arg_131_1:RecordAudio("410241033", var_134_22)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_410241", "410241033", "story_v_out_410241.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_410241", "410241033", "story_v_out_410241.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_23 = math.max(var_134_14, arg_131_1.talkMaxDuration)

			if var_134_13 <= arg_131_1.time_ and arg_131_1.time_ < var_134_13 + var_134_23 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_13) / var_134_23

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_13 + var_134_23 and arg_131_1.time_ < var_134_13 + var_134_23 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play410241034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 410241034
		arg_135_1.duration_ = 18.366

		local var_135_0 = {
			ja = 18.366,
			CriLanguages = 17.066,
			zh = 17.066
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
				arg_135_0:Play410241035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1061"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos1061 = var_138_0.localPosition
				var_138_0.localScale = Vector3.New(1, 1, 1)

				arg_135_1:CheckSpriteTmpPos("1061", 3)

				local var_138_2 = var_138_0.childCount

				for iter_138_0 = 0, var_138_2 - 1 do
					local var_138_3 = var_138_0:GetChild(iter_138_0)

					if var_138_3.name == "split_7" or not string.find(var_138_3.name, "split") then
						var_138_3.gameObject:SetActive(true)
					else
						var_138_3.gameObject:SetActive(false)
					end
				end
			end

			local var_138_4 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_4 then
				local var_138_5 = (arg_135_1.time_ - var_138_1) / var_138_4
				local var_138_6 = Vector3.New(0, -490, 18)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1061, var_138_6, var_138_5)
			end

			if arg_135_1.time_ >= var_138_1 + var_138_4 and arg_135_1.time_ < var_138_1 + var_138_4 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_138_7 = arg_135_1.actors_["1061"]
			local var_138_8 = 0

			if var_138_8 < arg_135_1.time_ and arg_135_1.time_ <= var_138_8 + arg_138_0 and arg_135_1.var_.actorSpriteComps1061 == nil then
				arg_135_1.var_.actorSpriteComps1061 = var_138_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_138_9 = 0.034

			if var_138_8 <= arg_135_1.time_ and arg_135_1.time_ < var_138_8 + var_138_9 then
				local var_138_10 = (arg_135_1.time_ - var_138_8) / var_138_9

				if arg_135_1.var_.actorSpriteComps1061 then
					for iter_138_1, iter_138_2 in pairs(arg_135_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_138_2 then
							local var_138_11 = Mathf.Lerp(iter_138_2.color.r, 1, var_138_10)

							iter_138_2.color = Color.New(var_138_11, var_138_11, var_138_11)
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_8 + var_138_9 and arg_135_1.time_ < var_138_8 + var_138_9 + arg_138_0 and arg_135_1.var_.actorSpriteComps1061 then
				local var_138_12 = 1

				for iter_138_3, iter_138_4 in pairs(arg_135_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_138_4 then
						iter_138_4.color = Color.New(var_138_12, var_138_12, var_138_12)
					end
				end

				arg_135_1.var_.actorSpriteComps1061 = nil
			end

			local var_138_13 = 0
			local var_138_14 = 1.525

			if var_138_13 < arg_135_1.time_ and arg_135_1.time_ <= var_138_13 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_15 = arg_135_1:FormatText(StoryNameCfg[612].name)

				arg_135_1.leftNameTxt_.text = var_138_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_16 = arg_135_1:GetWordFromCfg(410241034)
				local var_138_17 = arg_135_1:FormatText(var_138_16.content)

				arg_135_1.text_.text = var_138_17

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_18 = 61
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

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241034", "story_v_out_410241.awb") ~= 0 then
					local var_138_21 = manager.audio:GetVoiceLength("story_v_out_410241", "410241034", "story_v_out_410241.awb") / 1000

					if var_138_21 + var_138_13 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_21 + var_138_13
					end

					if var_138_16.prefab_name ~= "" and arg_135_1.actors_[var_138_16.prefab_name] ~= nil then
						local var_138_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_16.prefab_name].transform, "story_v_out_410241", "410241034", "story_v_out_410241.awb")

						arg_135_1:RecordAudio("410241034", var_138_22)
						arg_135_1:RecordAudio("410241034", var_138_22)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_410241", "410241034", "story_v_out_410241.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_410241", "410241034", "story_v_out_410241.awb")
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
	Play410241035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 410241035
		arg_139_1.duration_ = 18.1

		local var_139_0 = {
			ja = 16.533,
			CriLanguages = 18.1,
			zh = 18.1
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
				arg_139_0:Play410241036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1061"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos1061 = var_142_0.localPosition
				var_142_0.localScale = Vector3.New(1, 1, 1)

				arg_139_1:CheckSpriteTmpPos("1061", 3)

				local var_142_2 = var_142_0.childCount

				for iter_142_0 = 0, var_142_2 - 1 do
					local var_142_3 = var_142_0:GetChild(iter_142_0)

					if var_142_3.name == "split_7" or not string.find(var_142_3.name, "split") then
						var_142_3.gameObject:SetActive(true)
					else
						var_142_3.gameObject:SetActive(false)
					end
				end
			end

			local var_142_4 = 0.001

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_4 then
				local var_142_5 = (arg_139_1.time_ - var_142_1) / var_142_4
				local var_142_6 = Vector3.New(0, -490, 18)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1061, var_142_6, var_142_5)
			end

			if arg_139_1.time_ >= var_142_1 + var_142_4 and arg_139_1.time_ < var_142_1 + var_142_4 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_142_7 = arg_139_1.actors_["1061"]
			local var_142_8 = 0

			if var_142_8 < arg_139_1.time_ and arg_139_1.time_ <= var_142_8 + arg_142_0 and arg_139_1.var_.actorSpriteComps1061 == nil then
				arg_139_1.var_.actorSpriteComps1061 = var_142_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_142_9 = 0.034

			if var_142_8 <= arg_139_1.time_ and arg_139_1.time_ < var_142_8 + var_142_9 then
				local var_142_10 = (arg_139_1.time_ - var_142_8) / var_142_9

				if arg_139_1.var_.actorSpriteComps1061 then
					for iter_142_1, iter_142_2 in pairs(arg_139_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_142_2 then
							local var_142_11 = Mathf.Lerp(iter_142_2.color.r, 1, var_142_10)

							iter_142_2.color = Color.New(var_142_11, var_142_11, var_142_11)
						end
					end
				end
			end

			if arg_139_1.time_ >= var_142_8 + var_142_9 and arg_139_1.time_ < var_142_8 + var_142_9 + arg_142_0 and arg_139_1.var_.actorSpriteComps1061 then
				local var_142_12 = 1

				for iter_142_3, iter_142_4 in pairs(arg_139_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_142_4 then
						iter_142_4.color = Color.New(var_142_12, var_142_12, var_142_12)
					end
				end

				arg_139_1.var_.actorSpriteComps1061 = nil
			end

			local var_142_13 = 0
			local var_142_14 = 1.225

			if var_142_13 < arg_139_1.time_ and arg_139_1.time_ <= var_142_13 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_15 = arg_139_1:FormatText(StoryNameCfg[612].name)

				arg_139_1.leftNameTxt_.text = var_142_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_16 = arg_139_1:GetWordFromCfg(410241035)
				local var_142_17 = arg_139_1:FormatText(var_142_16.content)

				arg_139_1.text_.text = var_142_17

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_18 = 48
				local var_142_19 = utf8.len(var_142_17)
				local var_142_20 = var_142_18 <= 0 and var_142_14 or var_142_14 * (var_142_19 / var_142_18)

				if var_142_20 > 0 and var_142_14 < var_142_20 then
					arg_139_1.talkMaxDuration = var_142_20

					if var_142_20 + var_142_13 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_20 + var_142_13
					end
				end

				arg_139_1.text_.text = var_142_17
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241035", "story_v_out_410241.awb") ~= 0 then
					local var_142_21 = manager.audio:GetVoiceLength("story_v_out_410241", "410241035", "story_v_out_410241.awb") / 1000

					if var_142_21 + var_142_13 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_21 + var_142_13
					end

					if var_142_16.prefab_name ~= "" and arg_139_1.actors_[var_142_16.prefab_name] ~= nil then
						local var_142_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_16.prefab_name].transform, "story_v_out_410241", "410241035", "story_v_out_410241.awb")

						arg_139_1:RecordAudio("410241035", var_142_22)
						arg_139_1:RecordAudio("410241035", var_142_22)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_410241", "410241035", "story_v_out_410241.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_410241", "410241035", "story_v_out_410241.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_23 = math.max(var_142_14, arg_139_1.talkMaxDuration)

			if var_142_13 <= arg_139_1.time_ and arg_139_1.time_ < var_142_13 + var_142_23 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_13) / var_142_23

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_13 + var_142_23 and arg_139_1.time_ < var_142_13 + var_142_23 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play410241036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 410241036
		arg_143_1.duration_ = 7.1

		local var_143_0 = {
			ja = 7.1,
			CriLanguages = 5.666,
			zh = 5.666
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
				arg_143_0:Play410241037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1061"].transform
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.var_.moveOldPos1061 = var_146_0.localPosition
				var_146_0.localScale = Vector3.New(1, 1, 1)

				arg_143_1:CheckSpriteTmpPos("1061", 3)

				local var_146_2 = var_146_0.childCount

				for iter_146_0 = 0, var_146_2 - 1 do
					local var_146_3 = var_146_0:GetChild(iter_146_0)

					if var_146_3.name == "split_7" or not string.find(var_146_3.name, "split") then
						var_146_3.gameObject:SetActive(true)
					else
						var_146_3.gameObject:SetActive(false)
					end
				end
			end

			local var_146_4 = 0.001

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_4 then
				local var_146_5 = (arg_143_1.time_ - var_146_1) / var_146_4
				local var_146_6 = Vector3.New(0, -490, 18)

				var_146_0.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1061, var_146_6, var_146_5)
			end

			if arg_143_1.time_ >= var_146_1 + var_146_4 and arg_143_1.time_ < var_146_1 + var_146_4 + arg_146_0 then
				var_146_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_146_7 = arg_143_1.actors_["1061"]
			local var_146_8 = 0

			if var_146_8 < arg_143_1.time_ and arg_143_1.time_ <= var_146_8 + arg_146_0 and arg_143_1.var_.actorSpriteComps1061 == nil then
				arg_143_1.var_.actorSpriteComps1061 = var_146_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_146_9 = 0.034

			if var_146_8 <= arg_143_1.time_ and arg_143_1.time_ < var_146_8 + var_146_9 then
				local var_146_10 = (arg_143_1.time_ - var_146_8) / var_146_9

				if arg_143_1.var_.actorSpriteComps1061 then
					for iter_146_1, iter_146_2 in pairs(arg_143_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_146_2 then
							local var_146_11 = Mathf.Lerp(iter_146_2.color.r, 1, var_146_10)

							iter_146_2.color = Color.New(var_146_11, var_146_11, var_146_11)
						end
					end
				end
			end

			if arg_143_1.time_ >= var_146_8 + var_146_9 and arg_143_1.time_ < var_146_8 + var_146_9 + arg_146_0 and arg_143_1.var_.actorSpriteComps1061 then
				local var_146_12 = 1

				for iter_146_3, iter_146_4 in pairs(arg_143_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_146_4 then
						iter_146_4.color = Color.New(var_146_12, var_146_12, var_146_12)
					end
				end

				arg_143_1.var_.actorSpriteComps1061 = nil
			end

			local var_146_13 = 0
			local var_146_14 = 0.4

			if var_146_13 < arg_143_1.time_ and arg_143_1.time_ <= var_146_13 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_15 = arg_143_1:FormatText(StoryNameCfg[612].name)

				arg_143_1.leftNameTxt_.text = var_146_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_16 = arg_143_1:GetWordFromCfg(410241036)
				local var_146_17 = arg_143_1:FormatText(var_146_16.content)

				arg_143_1.text_.text = var_146_17

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_18 = 16
				local var_146_19 = utf8.len(var_146_17)
				local var_146_20 = var_146_18 <= 0 and var_146_14 or var_146_14 * (var_146_19 / var_146_18)

				if var_146_20 > 0 and var_146_14 < var_146_20 then
					arg_143_1.talkMaxDuration = var_146_20

					if var_146_20 + var_146_13 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_20 + var_146_13
					end
				end

				arg_143_1.text_.text = var_146_17
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241036", "story_v_out_410241.awb") ~= 0 then
					local var_146_21 = manager.audio:GetVoiceLength("story_v_out_410241", "410241036", "story_v_out_410241.awb") / 1000

					if var_146_21 + var_146_13 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_21 + var_146_13
					end

					if var_146_16.prefab_name ~= "" and arg_143_1.actors_[var_146_16.prefab_name] ~= nil then
						local var_146_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_16.prefab_name].transform, "story_v_out_410241", "410241036", "story_v_out_410241.awb")

						arg_143_1:RecordAudio("410241036", var_146_22)
						arg_143_1:RecordAudio("410241036", var_146_22)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_410241", "410241036", "story_v_out_410241.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_410241", "410241036", "story_v_out_410241.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_23 = math.max(var_146_14, arg_143_1.talkMaxDuration)

			if var_146_13 <= arg_143_1.time_ and arg_143_1.time_ < var_146_13 + var_146_23 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_13) / var_146_23

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_13 + var_146_23 and arg_143_1.time_ < var_146_13 + var_146_23 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play410241037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 410241037
		arg_147_1.duration_ = 8.9

		local var_147_0 = {
			ja = 8.9,
			CriLanguages = 8.4,
			zh = 8.4
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
				arg_147_0:Play410241038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["10060"].transform
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1.var_.moveOldPos10060 = var_150_0.localPosition
				var_150_0.localScale = Vector3.New(1, 1, 1)

				arg_147_1:CheckSpriteTmpPos("10060", 3)

				local var_150_2 = var_150_0.childCount

				for iter_150_0 = 0, var_150_2 - 1 do
					local var_150_3 = var_150_0:GetChild(iter_150_0)

					if var_150_3.name == "split_3" or not string.find(var_150_3.name, "split") then
						var_150_3.gameObject:SetActive(true)
					else
						var_150_3.gameObject:SetActive(false)
					end
				end
			end

			local var_150_4 = 0.001

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_4 then
				local var_150_5 = (arg_147_1.time_ - var_150_1) / var_150_4
				local var_150_6 = Vector3.New(0, -400, 0)

				var_150_0.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos10060, var_150_6, var_150_5)
			end

			if arg_147_1.time_ >= var_150_1 + var_150_4 and arg_147_1.time_ < var_150_1 + var_150_4 + arg_150_0 then
				var_150_0.localPosition = Vector3.New(0, -400, 0)
			end

			local var_150_7 = arg_147_1.actors_["10060"]
			local var_150_8 = 0

			if var_150_8 < arg_147_1.time_ and arg_147_1.time_ <= var_150_8 + arg_150_0 and arg_147_1.var_.actorSpriteComps10060 == nil then
				arg_147_1.var_.actorSpriteComps10060 = var_150_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_150_9 = 0.034

			if var_150_8 <= arg_147_1.time_ and arg_147_1.time_ < var_150_8 + var_150_9 then
				local var_150_10 = (arg_147_1.time_ - var_150_8) / var_150_9

				if arg_147_1.var_.actorSpriteComps10060 then
					for iter_150_1, iter_150_2 in pairs(arg_147_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_150_2 then
							local var_150_11 = Mathf.Lerp(iter_150_2.color.r, 1, var_150_10)

							iter_150_2.color = Color.New(var_150_11, var_150_11, var_150_11)
						end
					end
				end
			end

			if arg_147_1.time_ >= var_150_8 + var_150_9 and arg_147_1.time_ < var_150_8 + var_150_9 + arg_150_0 and arg_147_1.var_.actorSpriteComps10060 then
				local var_150_12 = 1

				for iter_150_3, iter_150_4 in pairs(arg_147_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_150_4 then
						iter_150_4.color = Color.New(var_150_12, var_150_12, var_150_12)
					end
				end

				arg_147_1.var_.actorSpriteComps10060 = nil
			end

			local var_150_13 = arg_147_1.actors_["1061"].transform
			local var_150_14 = 0

			if var_150_14 < arg_147_1.time_ and arg_147_1.time_ <= var_150_14 + arg_150_0 then
				arg_147_1.var_.moveOldPos1061 = var_150_13.localPosition
				var_150_13.localScale = Vector3.New(1, 1, 1)

				arg_147_1:CheckSpriteTmpPos("1061", 7)

				local var_150_15 = var_150_13.childCount

				for iter_150_5 = 0, var_150_15 - 1 do
					local var_150_16 = var_150_13:GetChild(iter_150_5)

					if var_150_16.name == "" or not string.find(var_150_16.name, "split") then
						var_150_16.gameObject:SetActive(true)
					else
						var_150_16.gameObject:SetActive(false)
					end
				end
			end

			local var_150_17 = 0.001

			if var_150_14 <= arg_147_1.time_ and arg_147_1.time_ < var_150_14 + var_150_17 then
				local var_150_18 = (arg_147_1.time_ - var_150_14) / var_150_17
				local var_150_19 = Vector3.New(0, -2000, 18)

				var_150_13.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1061, var_150_19, var_150_18)
			end

			if arg_147_1.time_ >= var_150_14 + var_150_17 and arg_147_1.time_ < var_150_14 + var_150_17 + arg_150_0 then
				var_150_13.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_150_20 = arg_147_1.actors_["1061"]
			local var_150_21 = 0

			if var_150_21 < arg_147_1.time_ and arg_147_1.time_ <= var_150_21 + arg_150_0 and arg_147_1.var_.actorSpriteComps1061 == nil then
				arg_147_1.var_.actorSpriteComps1061 = var_150_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_150_22 = 0.034

			if var_150_21 <= arg_147_1.time_ and arg_147_1.time_ < var_150_21 + var_150_22 then
				local var_150_23 = (arg_147_1.time_ - var_150_21) / var_150_22

				if arg_147_1.var_.actorSpriteComps1061 then
					for iter_150_6, iter_150_7 in pairs(arg_147_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_150_7 then
							local var_150_24 = Mathf.Lerp(iter_150_7.color.r, 1, var_150_23)

							iter_150_7.color = Color.New(var_150_24, var_150_24, var_150_24)
						end
					end
				end
			end

			if arg_147_1.time_ >= var_150_21 + var_150_22 and arg_147_1.time_ < var_150_21 + var_150_22 + arg_150_0 and arg_147_1.var_.actorSpriteComps1061 then
				local var_150_25 = 1

				for iter_150_8, iter_150_9 in pairs(arg_147_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_150_9 then
						iter_150_9.color = Color.New(var_150_25, var_150_25, var_150_25)
					end
				end

				arg_147_1.var_.actorSpriteComps1061 = nil
			end

			local var_150_26 = 0
			local var_150_27 = 0.825

			if var_150_26 < arg_147_1.time_ and arg_147_1.time_ <= var_150_26 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_28 = arg_147_1:FormatText(StoryNameCfg[597].name)

				arg_147_1.leftNameTxt_.text = var_150_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_29 = arg_147_1:GetWordFromCfg(410241037)
				local var_150_30 = arg_147_1:FormatText(var_150_29.content)

				arg_147_1.text_.text = var_150_30

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_31 = 33
				local var_150_32 = utf8.len(var_150_30)
				local var_150_33 = var_150_31 <= 0 and var_150_27 or var_150_27 * (var_150_32 / var_150_31)

				if var_150_33 > 0 and var_150_27 < var_150_33 then
					arg_147_1.talkMaxDuration = var_150_33

					if var_150_33 + var_150_26 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_33 + var_150_26
					end
				end

				arg_147_1.text_.text = var_150_30
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241037", "story_v_out_410241.awb") ~= 0 then
					local var_150_34 = manager.audio:GetVoiceLength("story_v_out_410241", "410241037", "story_v_out_410241.awb") / 1000

					if var_150_34 + var_150_26 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_34 + var_150_26
					end

					if var_150_29.prefab_name ~= "" and arg_147_1.actors_[var_150_29.prefab_name] ~= nil then
						local var_150_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_29.prefab_name].transform, "story_v_out_410241", "410241037", "story_v_out_410241.awb")

						arg_147_1:RecordAudio("410241037", var_150_35)
						arg_147_1:RecordAudio("410241037", var_150_35)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_410241", "410241037", "story_v_out_410241.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_410241", "410241037", "story_v_out_410241.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_36 = math.max(var_150_27, arg_147_1.talkMaxDuration)

			if var_150_26 <= arg_147_1.time_ and arg_147_1.time_ < var_150_26 + var_150_36 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_26) / var_150_36

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_26 + var_150_36 and arg_147_1.time_ < var_150_26 + var_150_36 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play410241038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 410241038
		arg_151_1.duration_ = 7.833

		local var_151_0 = {
			ja = 5.4,
			CriLanguages = 7.833,
			zh = 7.833
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
				arg_151_0:Play410241039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 0.7

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_2 = arg_151_1:FormatText(StoryNameCfg[597].name)

				arg_151_1.leftNameTxt_.text = var_154_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_3 = arg_151_1:GetWordFromCfg(410241038)
				local var_154_4 = arg_151_1:FormatText(var_154_3.content)

				arg_151_1.text_.text = var_154_4

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_5 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241038", "story_v_out_410241.awb") ~= 0 then
					local var_154_8 = manager.audio:GetVoiceLength("story_v_out_410241", "410241038", "story_v_out_410241.awb") / 1000

					if var_154_8 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_0
					end

					if var_154_3.prefab_name ~= "" and arg_151_1.actors_[var_154_3.prefab_name] ~= nil then
						local var_154_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_3.prefab_name].transform, "story_v_out_410241", "410241038", "story_v_out_410241.awb")

						arg_151_1:RecordAudio("410241038", var_154_9)
						arg_151_1:RecordAudio("410241038", var_154_9)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_410241", "410241038", "story_v_out_410241.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_410241", "410241038", "story_v_out_410241.awb")
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
	Play410241039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 410241039
		arg_155_1.duration_ = 8.766

		local var_155_0 = {
			ja = 7.033,
			CriLanguages = 8.766,
			zh = 8.766
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
				arg_155_0:Play410241040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1061"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos1061 = var_158_0.localPosition
				var_158_0.localScale = Vector3.New(1, 1, 1)

				arg_155_1:CheckSpriteTmpPos("1061", 3)

				local var_158_2 = var_158_0.childCount

				for iter_158_0 = 0, var_158_2 - 1 do
					local var_158_3 = var_158_0:GetChild(iter_158_0)

					if var_158_3.name == "" or not string.find(var_158_3.name, "split") then
						var_158_3.gameObject:SetActive(true)
					else
						var_158_3.gameObject:SetActive(false)
					end
				end
			end

			local var_158_4 = 0.001

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_4 then
				local var_158_5 = (arg_155_1.time_ - var_158_1) / var_158_4
				local var_158_6 = Vector3.New(0, -490, 18)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos1061, var_158_6, var_158_5)
			end

			if arg_155_1.time_ >= var_158_1 + var_158_4 and arg_155_1.time_ < var_158_1 + var_158_4 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_158_7 = arg_155_1.actors_["1061"]
			local var_158_8 = 0

			if var_158_8 < arg_155_1.time_ and arg_155_1.time_ <= var_158_8 + arg_158_0 and arg_155_1.var_.actorSpriteComps1061 == nil then
				arg_155_1.var_.actorSpriteComps1061 = var_158_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_9 = 0.034

			if var_158_8 <= arg_155_1.time_ and arg_155_1.time_ < var_158_8 + var_158_9 then
				local var_158_10 = (arg_155_1.time_ - var_158_8) / var_158_9

				if arg_155_1.var_.actorSpriteComps1061 then
					for iter_158_1, iter_158_2 in pairs(arg_155_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_158_2 then
							local var_158_11 = Mathf.Lerp(iter_158_2.color.r, 1, var_158_10)

							iter_158_2.color = Color.New(var_158_11, var_158_11, var_158_11)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_8 + var_158_9 and arg_155_1.time_ < var_158_8 + var_158_9 + arg_158_0 and arg_155_1.var_.actorSpriteComps1061 then
				local var_158_12 = 1

				for iter_158_3, iter_158_4 in pairs(arg_155_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_158_4 then
						iter_158_4.color = Color.New(var_158_12, var_158_12, var_158_12)
					end
				end

				arg_155_1.var_.actorSpriteComps1061 = nil
			end

			local var_158_13 = arg_155_1.actors_["10060"].transform
			local var_158_14 = 0

			if var_158_14 < arg_155_1.time_ and arg_155_1.time_ <= var_158_14 + arg_158_0 then
				arg_155_1.var_.moveOldPos10060 = var_158_13.localPosition
				var_158_13.localScale = Vector3.New(1, 1, 1)

				arg_155_1:CheckSpriteTmpPos("10060", 7)

				local var_158_15 = var_158_13.childCount

				for iter_158_5 = 0, var_158_15 - 1 do
					local var_158_16 = var_158_13:GetChild(iter_158_5)

					if var_158_16.name == "split_3" or not string.find(var_158_16.name, "split") then
						var_158_16.gameObject:SetActive(true)
					else
						var_158_16.gameObject:SetActive(false)
					end
				end
			end

			local var_158_17 = 0.001

			if var_158_14 <= arg_155_1.time_ and arg_155_1.time_ < var_158_14 + var_158_17 then
				local var_158_18 = (arg_155_1.time_ - var_158_14) / var_158_17
				local var_158_19 = Vector3.New(0, -2000, 0)

				var_158_13.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos10060, var_158_19, var_158_18)
			end

			if arg_155_1.time_ >= var_158_14 + var_158_17 and arg_155_1.time_ < var_158_14 + var_158_17 + arg_158_0 then
				var_158_13.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_158_20 = 0
			local var_158_21 = 1

			if var_158_20 < arg_155_1.time_ and arg_155_1.time_ <= var_158_20 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_22 = arg_155_1:FormatText(StoryNameCfg[612].name)

				arg_155_1.leftNameTxt_.text = var_158_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_23 = arg_155_1:GetWordFromCfg(410241039)
				local var_158_24 = arg_155_1:FormatText(var_158_23.content)

				arg_155_1.text_.text = var_158_24

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_25 = 40
				local var_158_26 = utf8.len(var_158_24)
				local var_158_27 = var_158_25 <= 0 and var_158_21 or var_158_21 * (var_158_26 / var_158_25)

				if var_158_27 > 0 and var_158_21 < var_158_27 then
					arg_155_1.talkMaxDuration = var_158_27

					if var_158_27 + var_158_20 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_27 + var_158_20
					end
				end

				arg_155_1.text_.text = var_158_24
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241039", "story_v_out_410241.awb") ~= 0 then
					local var_158_28 = manager.audio:GetVoiceLength("story_v_out_410241", "410241039", "story_v_out_410241.awb") / 1000

					if var_158_28 + var_158_20 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_28 + var_158_20
					end

					if var_158_23.prefab_name ~= "" and arg_155_1.actors_[var_158_23.prefab_name] ~= nil then
						local var_158_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_23.prefab_name].transform, "story_v_out_410241", "410241039", "story_v_out_410241.awb")

						arg_155_1:RecordAudio("410241039", var_158_29)
						arg_155_1:RecordAudio("410241039", var_158_29)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_410241", "410241039", "story_v_out_410241.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_410241", "410241039", "story_v_out_410241.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_30 = math.max(var_158_21, arg_155_1.talkMaxDuration)

			if var_158_20 <= arg_155_1.time_ and arg_155_1.time_ < var_158_20 + var_158_30 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_20) / var_158_30

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_20 + var_158_30 and arg_155_1.time_ < var_158_20 + var_158_30 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play410241040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 410241040
		arg_159_1.duration_ = 8.933

		local var_159_0 = {
			ja = 8.933,
			CriLanguages = 5.633,
			zh = 5.633
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
				arg_159_0:Play410241041(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1061"].transform
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1.var_.moveOldPos1061 = var_162_0.localPosition
				var_162_0.localScale = Vector3.New(1, 1, 1)

				arg_159_1:CheckSpriteTmpPos("1061", 3)

				local var_162_2 = var_162_0.childCount

				for iter_162_0 = 0, var_162_2 - 1 do
					local var_162_3 = var_162_0:GetChild(iter_162_0)

					if var_162_3.name == "" or not string.find(var_162_3.name, "split") then
						var_162_3.gameObject:SetActive(true)
					else
						var_162_3.gameObject:SetActive(false)
					end
				end
			end

			local var_162_4 = 0.001

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_4 then
				local var_162_5 = (arg_159_1.time_ - var_162_1) / var_162_4
				local var_162_6 = Vector3.New(0, -490, 18)

				var_162_0.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos1061, var_162_6, var_162_5)
			end

			if arg_159_1.time_ >= var_162_1 + var_162_4 and arg_159_1.time_ < var_162_1 + var_162_4 + arg_162_0 then
				var_162_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_162_7 = arg_159_1.actors_["1061"]
			local var_162_8 = 0

			if var_162_8 < arg_159_1.time_ and arg_159_1.time_ <= var_162_8 + arg_162_0 and arg_159_1.var_.actorSpriteComps1061 == nil then
				arg_159_1.var_.actorSpriteComps1061 = var_162_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_162_9 = 0.034

			if var_162_8 <= arg_159_1.time_ and arg_159_1.time_ < var_162_8 + var_162_9 then
				local var_162_10 = (arg_159_1.time_ - var_162_8) / var_162_9

				if arg_159_1.var_.actorSpriteComps1061 then
					for iter_162_1, iter_162_2 in pairs(arg_159_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_162_2 then
							local var_162_11 = Mathf.Lerp(iter_162_2.color.r, 1, var_162_10)

							iter_162_2.color = Color.New(var_162_11, var_162_11, var_162_11)
						end
					end
				end
			end

			if arg_159_1.time_ >= var_162_8 + var_162_9 and arg_159_1.time_ < var_162_8 + var_162_9 + arg_162_0 and arg_159_1.var_.actorSpriteComps1061 then
				local var_162_12 = 1

				for iter_162_3, iter_162_4 in pairs(arg_159_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_162_4 then
						iter_162_4.color = Color.New(var_162_12, var_162_12, var_162_12)
					end
				end

				arg_159_1.var_.actorSpriteComps1061 = nil
			end

			local var_162_13 = 0
			local var_162_14 = 0.6

			if var_162_13 < arg_159_1.time_ and arg_159_1.time_ <= var_162_13 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_15 = arg_159_1:FormatText(StoryNameCfg[612].name)

				arg_159_1.leftNameTxt_.text = var_162_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_16 = arg_159_1:GetWordFromCfg(410241040)
				local var_162_17 = arg_159_1:FormatText(var_162_16.content)

				arg_159_1.text_.text = var_162_17

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_18 = 24
				local var_162_19 = utf8.len(var_162_17)
				local var_162_20 = var_162_18 <= 0 and var_162_14 or var_162_14 * (var_162_19 / var_162_18)

				if var_162_20 > 0 and var_162_14 < var_162_20 then
					arg_159_1.talkMaxDuration = var_162_20

					if var_162_20 + var_162_13 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_20 + var_162_13
					end
				end

				arg_159_1.text_.text = var_162_17
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241040", "story_v_out_410241.awb") ~= 0 then
					local var_162_21 = manager.audio:GetVoiceLength("story_v_out_410241", "410241040", "story_v_out_410241.awb") / 1000

					if var_162_21 + var_162_13 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_21 + var_162_13
					end

					if var_162_16.prefab_name ~= "" and arg_159_1.actors_[var_162_16.prefab_name] ~= nil then
						local var_162_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_16.prefab_name].transform, "story_v_out_410241", "410241040", "story_v_out_410241.awb")

						arg_159_1:RecordAudio("410241040", var_162_22)
						arg_159_1:RecordAudio("410241040", var_162_22)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_410241", "410241040", "story_v_out_410241.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_410241", "410241040", "story_v_out_410241.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_23 = math.max(var_162_14, arg_159_1.talkMaxDuration)

			if var_162_13 <= arg_159_1.time_ and arg_159_1.time_ < var_162_13 + var_162_23 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_13) / var_162_23

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_13 + var_162_23 and arg_159_1.time_ < var_162_13 + var_162_23 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play410241041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 410241041
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play410241042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1061"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos1061 = var_166_0.localPosition
				var_166_0.localScale = Vector3.New(1, 1, 1)

				arg_163_1:CheckSpriteTmpPos("1061", 7)

				local var_166_2 = var_166_0.childCount

				for iter_166_0 = 0, var_166_2 - 1 do
					local var_166_3 = var_166_0:GetChild(iter_166_0)

					if var_166_3.name == "" or not string.find(var_166_3.name, "split") then
						var_166_3.gameObject:SetActive(true)
					else
						var_166_3.gameObject:SetActive(false)
					end
				end
			end

			local var_166_4 = 0.001

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_4 then
				local var_166_5 = (arg_163_1.time_ - var_166_1) / var_166_4
				local var_166_6 = Vector3.New(0, -2000, 18)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1061, var_166_6, var_166_5)
			end

			if arg_163_1.time_ >= var_166_1 + var_166_4 and arg_163_1.time_ < var_166_1 + var_166_4 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_166_7 = arg_163_1.actors_["10060"].transform
			local var_166_8 = 0

			if var_166_8 < arg_163_1.time_ and arg_163_1.time_ <= var_166_8 + arg_166_0 then
				arg_163_1.var_.moveOldPos10060 = var_166_7.localPosition
				var_166_7.localScale = Vector3.New(1, 1, 1)

				arg_163_1:CheckSpriteTmpPos("10060", 7)

				local var_166_9 = var_166_7.childCount

				for iter_166_1 = 0, var_166_9 - 1 do
					local var_166_10 = var_166_7:GetChild(iter_166_1)

					if var_166_10.name == "" or not string.find(var_166_10.name, "split") then
						var_166_10.gameObject:SetActive(true)
					else
						var_166_10.gameObject:SetActive(false)
					end
				end
			end

			local var_166_11 = 0.001

			if var_166_8 <= arg_163_1.time_ and arg_163_1.time_ < var_166_8 + var_166_11 then
				local var_166_12 = (arg_163_1.time_ - var_166_8) / var_166_11
				local var_166_13 = Vector3.New(0, -2000, 0)

				var_166_7.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos10060, var_166_13, var_166_12)
			end

			if arg_163_1.time_ >= var_166_8 + var_166_11 and arg_163_1.time_ < var_166_8 + var_166_11 + arg_166_0 then
				var_166_7.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_166_14 = arg_163_1.actors_["1061"]
			local var_166_15 = 0

			if var_166_15 < arg_163_1.time_ and arg_163_1.time_ <= var_166_15 + arg_166_0 and arg_163_1.var_.actorSpriteComps1061 == nil then
				arg_163_1.var_.actorSpriteComps1061 = var_166_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_16 = 0.034

			if var_166_15 <= arg_163_1.time_ and arg_163_1.time_ < var_166_15 + var_166_16 then
				local var_166_17 = (arg_163_1.time_ - var_166_15) / var_166_16

				if arg_163_1.var_.actorSpriteComps1061 then
					for iter_166_2, iter_166_3 in pairs(arg_163_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_166_3 then
							local var_166_18 = Mathf.Lerp(iter_166_3.color.r, 0.5, var_166_17)

							iter_166_3.color = Color.New(var_166_18, var_166_18, var_166_18)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_15 + var_166_16 and arg_163_1.time_ < var_166_15 + var_166_16 + arg_166_0 and arg_163_1.var_.actorSpriteComps1061 then
				local var_166_19 = 0.5

				for iter_166_4, iter_166_5 in pairs(arg_163_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_166_5 then
						iter_166_5.color = Color.New(var_166_19, var_166_19, var_166_19)
					end
				end

				arg_163_1.var_.actorSpriteComps1061 = nil
			end

			local var_166_20 = arg_163_1.actors_["10060"]
			local var_166_21 = 0

			if var_166_21 < arg_163_1.time_ and arg_163_1.time_ <= var_166_21 + arg_166_0 and arg_163_1.var_.actorSpriteComps10060 == nil then
				arg_163_1.var_.actorSpriteComps10060 = var_166_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_22 = 0.034

			if var_166_21 <= arg_163_1.time_ and arg_163_1.time_ < var_166_21 + var_166_22 then
				local var_166_23 = (arg_163_1.time_ - var_166_21) / var_166_22

				if arg_163_1.var_.actorSpriteComps10060 then
					for iter_166_6, iter_166_7 in pairs(arg_163_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_166_7 then
							local var_166_24 = Mathf.Lerp(iter_166_7.color.r, 0.5, var_166_23)

							iter_166_7.color = Color.New(var_166_24, var_166_24, var_166_24)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_21 + var_166_22 and arg_163_1.time_ < var_166_21 + var_166_22 + arg_166_0 and arg_163_1.var_.actorSpriteComps10060 then
				local var_166_25 = 0.5

				for iter_166_8, iter_166_9 in pairs(arg_163_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_166_9 then
						iter_166_9.color = Color.New(var_166_25, var_166_25, var_166_25)
					end
				end

				arg_163_1.var_.actorSpriteComps10060 = nil
			end

			local var_166_26 = 0
			local var_166_27 = 0.775

			if var_166_26 < arg_163_1.time_ and arg_163_1.time_ <= var_166_26 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, false)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_28 = arg_163_1:GetWordFromCfg(410241041)
				local var_166_29 = arg_163_1:FormatText(var_166_28.content)

				arg_163_1.text_.text = var_166_29

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_30 = 31
				local var_166_31 = utf8.len(var_166_29)
				local var_166_32 = var_166_30 <= 0 and var_166_27 or var_166_27 * (var_166_31 / var_166_30)

				if var_166_32 > 0 and var_166_27 < var_166_32 then
					arg_163_1.talkMaxDuration = var_166_32

					if var_166_32 + var_166_26 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_32 + var_166_26
					end
				end

				arg_163_1.text_.text = var_166_29
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_33 = math.max(var_166_27, arg_163_1.talkMaxDuration)

			if var_166_26 <= arg_163_1.time_ and arg_163_1.time_ < var_166_26 + var_166_33 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_26) / var_166_33

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_26 + var_166_33 and arg_163_1.time_ < var_166_26 + var_166_33 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play410241042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 410241042
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play410241043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0
			local var_170_1 = 0.95

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, false)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_2 = arg_167_1:GetWordFromCfg(410241042)
				local var_170_3 = arg_167_1:FormatText(var_170_2.content)

				arg_167_1.text_.text = var_170_3

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_4 = 38
				local var_170_5 = utf8.len(var_170_3)
				local var_170_6 = var_170_4 <= 0 and var_170_1 or var_170_1 * (var_170_5 / var_170_4)

				if var_170_6 > 0 and var_170_1 < var_170_6 then
					arg_167_1.talkMaxDuration = var_170_6

					if var_170_6 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_6 + var_170_0
					end
				end

				arg_167_1.text_.text = var_170_3
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_7 = math.max(var_170_1, arg_167_1.talkMaxDuration)

			if var_170_0 <= arg_167_1.time_ and arg_167_1.time_ < var_170_0 + var_170_7 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_0) / var_170_7

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_0 + var_170_7 and arg_167_1.time_ < var_170_0 + var_170_7 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play410241043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 410241043
		arg_171_1.duration_ = 10.3

		local var_171_0 = {
			ja = 1.566,
			CriLanguages = 10.3,
			zh = 10.3
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
				arg_171_0:Play410241044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1061"].transform
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.var_.moveOldPos1061 = var_174_0.localPosition
				var_174_0.localScale = Vector3.New(1, 1, 1)

				arg_171_1:CheckSpriteTmpPos("1061", 3)

				local var_174_2 = var_174_0.childCount

				for iter_174_0 = 0, var_174_2 - 1 do
					local var_174_3 = var_174_0:GetChild(iter_174_0)

					if var_174_3.name == "" or not string.find(var_174_3.name, "split") then
						var_174_3.gameObject:SetActive(true)
					else
						var_174_3.gameObject:SetActive(false)
					end
				end
			end

			local var_174_4 = 0.001

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_4 then
				local var_174_5 = (arg_171_1.time_ - var_174_1) / var_174_4
				local var_174_6 = Vector3.New(0, -490, 18)

				var_174_0.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1061, var_174_6, var_174_5)
			end

			if arg_171_1.time_ >= var_174_1 + var_174_4 and arg_171_1.time_ < var_174_1 + var_174_4 + arg_174_0 then
				var_174_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_174_7 = arg_171_1.actors_["1061"]
			local var_174_8 = 0

			if var_174_8 < arg_171_1.time_ and arg_171_1.time_ <= var_174_8 + arg_174_0 and arg_171_1.var_.actorSpriteComps1061 == nil then
				arg_171_1.var_.actorSpriteComps1061 = var_174_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_9 = 0.034

			if var_174_8 <= arg_171_1.time_ and arg_171_1.time_ < var_174_8 + var_174_9 then
				local var_174_10 = (arg_171_1.time_ - var_174_8) / var_174_9

				if arg_171_1.var_.actorSpriteComps1061 then
					for iter_174_1, iter_174_2 in pairs(arg_171_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_174_2 then
							local var_174_11 = Mathf.Lerp(iter_174_2.color.r, 1, var_174_10)

							iter_174_2.color = Color.New(var_174_11, var_174_11, var_174_11)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_8 + var_174_9 and arg_171_1.time_ < var_174_8 + var_174_9 + arg_174_0 and arg_171_1.var_.actorSpriteComps1061 then
				local var_174_12 = 1

				for iter_174_3, iter_174_4 in pairs(arg_171_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_174_4 then
						iter_174_4.color = Color.New(var_174_12, var_174_12, var_174_12)
					end
				end

				arg_171_1.var_.actorSpriteComps1061 = nil
			end

			local var_174_13 = 0
			local var_174_14 = 0.05

			if var_174_13 < arg_171_1.time_ and arg_171_1.time_ <= var_174_13 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_15 = arg_171_1:FormatText(StoryNameCfg[612].name)

				arg_171_1.leftNameTxt_.text = var_174_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_16 = arg_171_1:GetWordFromCfg(410241043)
				local var_174_17 = arg_171_1:FormatText(var_174_16.content)

				arg_171_1.text_.text = var_174_17

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_18 = 2
				local var_174_19 = utf8.len(var_174_17)
				local var_174_20 = var_174_18 <= 0 and var_174_14 or var_174_14 * (var_174_19 / var_174_18)

				if var_174_20 > 0 and var_174_14 < var_174_20 then
					arg_171_1.talkMaxDuration = var_174_20

					if var_174_20 + var_174_13 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_20 + var_174_13
					end
				end

				arg_171_1.text_.text = var_174_17
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241043", "story_v_out_410241.awb") ~= 0 then
					local var_174_21 = manager.audio:GetVoiceLength("story_v_out_410241", "410241043", "story_v_out_410241.awb") / 1000

					if var_174_21 + var_174_13 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_21 + var_174_13
					end

					if var_174_16.prefab_name ~= "" and arg_171_1.actors_[var_174_16.prefab_name] ~= nil then
						local var_174_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_16.prefab_name].transform, "story_v_out_410241", "410241043", "story_v_out_410241.awb")

						arg_171_1:RecordAudio("410241043", var_174_22)
						arg_171_1:RecordAudio("410241043", var_174_22)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_410241", "410241043", "story_v_out_410241.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_410241", "410241043", "story_v_out_410241.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_23 = math.max(var_174_14, arg_171_1.talkMaxDuration)

			if var_174_13 <= arg_171_1.time_ and arg_171_1.time_ < var_174_13 + var_174_23 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_13) / var_174_23

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_13 + var_174_23 and arg_171_1.time_ < var_174_13 + var_174_23 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play410241044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 410241044
		arg_175_1.duration_ = 5

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play410241045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1061"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.actorSpriteComps1061 == nil then
				arg_175_1.var_.actorSpriteComps1061 = var_178_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_2 = 0.034

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.actorSpriteComps1061 then
					for iter_178_0, iter_178_1 in pairs(arg_175_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_178_1 then
							local var_178_4 = Mathf.Lerp(iter_178_1.color.r, 0.5, var_178_3)

							iter_178_1.color = Color.New(var_178_4, var_178_4, var_178_4)
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.actorSpriteComps1061 then
				local var_178_5 = 0.5

				for iter_178_2, iter_178_3 in pairs(arg_175_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_178_3 then
						iter_178_3.color = Color.New(var_178_5, var_178_5, var_178_5)
					end
				end

				arg_175_1.var_.actorSpriteComps1061 = nil
			end

			local var_178_6 = 0
			local var_178_7 = 1.175

			if var_178_6 < arg_175_1.time_ and arg_175_1.time_ <= var_178_6 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, false)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_8 = arg_175_1:GetWordFromCfg(410241044)
				local var_178_9 = arg_175_1:FormatText(var_178_8.content)

				arg_175_1.text_.text = var_178_9

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_10 = 47
				local var_178_11 = utf8.len(var_178_9)
				local var_178_12 = var_178_10 <= 0 and var_178_7 or var_178_7 * (var_178_11 / var_178_10)

				if var_178_12 > 0 and var_178_7 < var_178_12 then
					arg_175_1.talkMaxDuration = var_178_12

					if var_178_12 + var_178_6 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_12 + var_178_6
					end
				end

				arg_175_1.text_.text = var_178_9
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_13 = math.max(var_178_7, arg_175_1.talkMaxDuration)

			if var_178_6 <= arg_175_1.time_ and arg_175_1.time_ < var_178_6 + var_178_13 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_6) / var_178_13

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_6 + var_178_13 and arg_175_1.time_ < var_178_6 + var_178_13 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play410241045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 410241045
		arg_179_1.duration_ = 8.133

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play410241046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1061"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos1061 = var_182_0.localPosition
				var_182_0.localScale = Vector3.New(1, 1, 1)

				arg_179_1:CheckSpriteTmpPos("1061", 3)

				local var_182_2 = var_182_0.childCount

				for iter_182_0 = 0, var_182_2 - 1 do
					local var_182_3 = var_182_0:GetChild(iter_182_0)

					if var_182_3.name == "split_7" or not string.find(var_182_3.name, "split") then
						var_182_3.gameObject:SetActive(true)
					else
						var_182_3.gameObject:SetActive(false)
					end
				end
			end

			local var_182_4 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_4 then
				local var_182_5 = (arg_179_1.time_ - var_182_1) / var_182_4
				local var_182_6 = Vector3.New(0, -490, 18)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1061, var_182_6, var_182_5)
			end

			if arg_179_1.time_ >= var_182_1 + var_182_4 and arg_179_1.time_ < var_182_1 + var_182_4 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_182_7 = arg_179_1.actors_["1061"]
			local var_182_8 = 0

			if var_182_8 < arg_179_1.time_ and arg_179_1.time_ <= var_182_8 + arg_182_0 and arg_179_1.var_.actorSpriteComps1061 == nil then
				arg_179_1.var_.actorSpriteComps1061 = var_182_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_182_9 = 0.034

			if var_182_8 <= arg_179_1.time_ and arg_179_1.time_ < var_182_8 + var_182_9 then
				local var_182_10 = (arg_179_1.time_ - var_182_8) / var_182_9

				if arg_179_1.var_.actorSpriteComps1061 then
					for iter_182_1, iter_182_2 in pairs(arg_179_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_182_2 then
							local var_182_11 = Mathf.Lerp(iter_182_2.color.r, 1, var_182_10)

							iter_182_2.color = Color.New(var_182_11, var_182_11, var_182_11)
						end
					end
				end
			end

			if arg_179_1.time_ >= var_182_8 + var_182_9 and arg_179_1.time_ < var_182_8 + var_182_9 + arg_182_0 and arg_179_1.var_.actorSpriteComps1061 then
				local var_182_12 = 1

				for iter_182_3, iter_182_4 in pairs(arg_179_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_182_4 then
						iter_182_4.color = Color.New(var_182_12, var_182_12, var_182_12)
					end
				end

				arg_179_1.var_.actorSpriteComps1061 = nil
			end

			local var_182_13 = 0
			local var_182_14 = 0.675

			if var_182_13 < arg_179_1.time_ and arg_179_1.time_ <= var_182_13 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_15 = arg_179_1:FormatText(StoryNameCfg[612].name)

				arg_179_1.leftNameTxt_.text = var_182_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_16 = arg_179_1:GetWordFromCfg(410241045)
				local var_182_17 = arg_179_1:FormatText(var_182_16.content)

				arg_179_1.text_.text = var_182_17

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_18 = 27
				local var_182_19 = utf8.len(var_182_17)
				local var_182_20 = var_182_18 <= 0 and var_182_14 or var_182_14 * (var_182_19 / var_182_18)

				if var_182_20 > 0 and var_182_14 < var_182_20 then
					arg_179_1.talkMaxDuration = var_182_20

					if var_182_20 + var_182_13 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_20 + var_182_13
					end
				end

				arg_179_1.text_.text = var_182_17
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241045", "story_v_out_410241.awb") ~= 0 then
					local var_182_21 = manager.audio:GetVoiceLength("story_v_out_410241", "410241045", "story_v_out_410241.awb") / 1000

					if var_182_21 + var_182_13 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_21 + var_182_13
					end

					if var_182_16.prefab_name ~= "" and arg_179_1.actors_[var_182_16.prefab_name] ~= nil then
						local var_182_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_16.prefab_name].transform, "story_v_out_410241", "410241045", "story_v_out_410241.awb")

						arg_179_1:RecordAudio("410241045", var_182_22)
						arg_179_1:RecordAudio("410241045", var_182_22)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_410241", "410241045", "story_v_out_410241.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_410241", "410241045", "story_v_out_410241.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_23 = math.max(var_182_14, arg_179_1.talkMaxDuration)

			if var_182_13 <= arg_179_1.time_ and arg_179_1.time_ < var_182_13 + var_182_23 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_13) / var_182_23

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_13 + var_182_23 and arg_179_1.time_ < var_182_13 + var_182_23 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play410241046 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 410241046
		arg_183_1.duration_ = 13.666

		local var_183_0 = {
			ja = 8.533,
			CriLanguages = 13.666,
			zh = 13.666
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
				arg_183_0:Play410241047(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1061"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos1061 = var_186_0.localPosition
				var_186_0.localScale = Vector3.New(1, 1, 1)

				arg_183_1:CheckSpriteTmpPos("1061", 3)

				local var_186_2 = var_186_0.childCount

				for iter_186_0 = 0, var_186_2 - 1 do
					local var_186_3 = var_186_0:GetChild(iter_186_0)

					if var_186_3.name == "split_7" or not string.find(var_186_3.name, "split") then
						var_186_3.gameObject:SetActive(true)
					else
						var_186_3.gameObject:SetActive(false)
					end
				end
			end

			local var_186_4 = 0.001

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_4 then
				local var_186_5 = (arg_183_1.time_ - var_186_1) / var_186_4
				local var_186_6 = Vector3.New(0, -490, 18)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1061, var_186_6, var_186_5)
			end

			if arg_183_1.time_ >= var_186_1 + var_186_4 and arg_183_1.time_ < var_186_1 + var_186_4 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_186_7 = arg_183_1.actors_["1061"]
			local var_186_8 = 0

			if var_186_8 < arg_183_1.time_ and arg_183_1.time_ <= var_186_8 + arg_186_0 and arg_183_1.var_.actorSpriteComps1061 == nil then
				arg_183_1.var_.actorSpriteComps1061 = var_186_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_9 = 0.034

			if var_186_8 <= arg_183_1.time_ and arg_183_1.time_ < var_186_8 + var_186_9 then
				local var_186_10 = (arg_183_1.time_ - var_186_8) / var_186_9

				if arg_183_1.var_.actorSpriteComps1061 then
					for iter_186_1, iter_186_2 in pairs(arg_183_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_186_2 then
							local var_186_11 = Mathf.Lerp(iter_186_2.color.r, 1, var_186_10)

							iter_186_2.color = Color.New(var_186_11, var_186_11, var_186_11)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_8 + var_186_9 and arg_183_1.time_ < var_186_8 + var_186_9 + arg_186_0 and arg_183_1.var_.actorSpriteComps1061 then
				local var_186_12 = 1

				for iter_186_3, iter_186_4 in pairs(arg_183_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_186_4 then
						iter_186_4.color = Color.New(var_186_12, var_186_12, var_186_12)
					end
				end

				arg_183_1.var_.actorSpriteComps1061 = nil
			end

			local var_186_13 = 0
			local var_186_14 = 0.75

			if var_186_13 < arg_183_1.time_ and arg_183_1.time_ <= var_186_13 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_15 = arg_183_1:FormatText(StoryNameCfg[612].name)

				arg_183_1.leftNameTxt_.text = var_186_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_16 = arg_183_1:GetWordFromCfg(410241046)
				local var_186_17 = arg_183_1:FormatText(var_186_16.content)

				arg_183_1.text_.text = var_186_17

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_18 = 30
				local var_186_19 = utf8.len(var_186_17)
				local var_186_20 = var_186_18 <= 0 and var_186_14 or var_186_14 * (var_186_19 / var_186_18)

				if var_186_20 > 0 and var_186_14 < var_186_20 then
					arg_183_1.talkMaxDuration = var_186_20

					if var_186_20 + var_186_13 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_20 + var_186_13
					end
				end

				arg_183_1.text_.text = var_186_17
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241046", "story_v_out_410241.awb") ~= 0 then
					local var_186_21 = manager.audio:GetVoiceLength("story_v_out_410241", "410241046", "story_v_out_410241.awb") / 1000

					if var_186_21 + var_186_13 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_21 + var_186_13
					end

					if var_186_16.prefab_name ~= "" and arg_183_1.actors_[var_186_16.prefab_name] ~= nil then
						local var_186_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_16.prefab_name].transform, "story_v_out_410241", "410241046", "story_v_out_410241.awb")

						arg_183_1:RecordAudio("410241046", var_186_22)
						arg_183_1:RecordAudio("410241046", var_186_22)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_410241", "410241046", "story_v_out_410241.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_410241", "410241046", "story_v_out_410241.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_23 = math.max(var_186_14, arg_183_1.talkMaxDuration)

			if var_186_13 <= arg_183_1.time_ and arg_183_1.time_ < var_186_13 + var_186_23 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_13) / var_186_23

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_13 + var_186_23 and arg_183_1.time_ < var_186_13 + var_186_23 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play410241047 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 410241047
		arg_187_1.duration_ = 5.7

		local var_187_0 = {
			ja = 5.7,
			CriLanguages = 2.4,
			zh = 2.4
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
				arg_187_0:Play410241048(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1061"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos1061 = var_190_0.localPosition
				var_190_0.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("1061", 3)

				local var_190_2 = var_190_0.childCount

				for iter_190_0 = 0, var_190_2 - 1 do
					local var_190_3 = var_190_0:GetChild(iter_190_0)

					if var_190_3.name == "split_9" or not string.find(var_190_3.name, "split") then
						var_190_3.gameObject:SetActive(true)
					else
						var_190_3.gameObject:SetActive(false)
					end
				end
			end

			local var_190_4 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_4 then
				local var_190_5 = (arg_187_1.time_ - var_190_1) / var_190_4
				local var_190_6 = Vector3.New(0, -490, 18)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1061, var_190_6, var_190_5)
			end

			if arg_187_1.time_ >= var_190_1 + var_190_4 and arg_187_1.time_ < var_190_1 + var_190_4 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_190_7 = arg_187_1.actors_["1061"]
			local var_190_8 = 0

			if var_190_8 < arg_187_1.time_ and arg_187_1.time_ <= var_190_8 + arg_190_0 and arg_187_1.var_.actorSpriteComps1061 == nil then
				arg_187_1.var_.actorSpriteComps1061 = var_190_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_9 = 0.034

			if var_190_8 <= arg_187_1.time_ and arg_187_1.time_ < var_190_8 + var_190_9 then
				local var_190_10 = (arg_187_1.time_ - var_190_8) / var_190_9

				if arg_187_1.var_.actorSpriteComps1061 then
					for iter_190_1, iter_190_2 in pairs(arg_187_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_190_2 then
							local var_190_11 = Mathf.Lerp(iter_190_2.color.r, 1, var_190_10)

							iter_190_2.color = Color.New(var_190_11, var_190_11, var_190_11)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_8 + var_190_9 and arg_187_1.time_ < var_190_8 + var_190_9 + arg_190_0 and arg_187_1.var_.actorSpriteComps1061 then
				local var_190_12 = 1

				for iter_190_3, iter_190_4 in pairs(arg_187_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_190_4 then
						iter_190_4.color = Color.New(var_190_12, var_190_12, var_190_12)
					end
				end

				arg_187_1.var_.actorSpriteComps1061 = nil
			end

			local var_190_13 = 0
			local var_190_14 = 0.325

			if var_190_13 < arg_187_1.time_ and arg_187_1.time_ <= var_190_13 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_15 = arg_187_1:FormatText(StoryNameCfg[612].name)

				arg_187_1.leftNameTxt_.text = var_190_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_16 = arg_187_1:GetWordFromCfg(410241047)
				local var_190_17 = arg_187_1:FormatText(var_190_16.content)

				arg_187_1.text_.text = var_190_17

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_18 = 13
				local var_190_19 = utf8.len(var_190_17)
				local var_190_20 = var_190_18 <= 0 and var_190_14 or var_190_14 * (var_190_19 / var_190_18)

				if var_190_20 > 0 and var_190_14 < var_190_20 then
					arg_187_1.talkMaxDuration = var_190_20

					if var_190_20 + var_190_13 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_20 + var_190_13
					end
				end

				arg_187_1.text_.text = var_190_17
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241047", "story_v_out_410241.awb") ~= 0 then
					local var_190_21 = manager.audio:GetVoiceLength("story_v_out_410241", "410241047", "story_v_out_410241.awb") / 1000

					if var_190_21 + var_190_13 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_21 + var_190_13
					end

					if var_190_16.prefab_name ~= "" and arg_187_1.actors_[var_190_16.prefab_name] ~= nil then
						local var_190_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_16.prefab_name].transform, "story_v_out_410241", "410241047", "story_v_out_410241.awb")

						arg_187_1:RecordAudio("410241047", var_190_22)
						arg_187_1:RecordAudio("410241047", var_190_22)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_410241", "410241047", "story_v_out_410241.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_410241", "410241047", "story_v_out_410241.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_23 = math.max(var_190_14, arg_187_1.talkMaxDuration)

			if var_190_13 <= arg_187_1.time_ and arg_187_1.time_ < var_190_13 + var_190_23 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_13) / var_190_23

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_13 + var_190_23 and arg_187_1.time_ < var_190_13 + var_190_23 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play410241048 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 410241048
		arg_191_1.duration_ = 9

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play410241049(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 2

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				local var_194_1 = manager.ui.mainCamera.transform.localPosition
				local var_194_2 = Vector3.New(0, 0, 10) + Vector3.New(var_194_1.x, var_194_1.y, 0)
				local var_194_3 = arg_191_1.bgs_.ST67

				var_194_3.transform.localPosition = var_194_2
				var_194_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_194_4 = var_194_3:GetComponent("SpriteRenderer")

				if var_194_4 and var_194_4.sprite then
					local var_194_5 = (var_194_3.transform.localPosition - var_194_1).z
					local var_194_6 = manager.ui.mainCameraCom_
					local var_194_7 = 2 * var_194_5 * Mathf.Tan(var_194_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_194_8 = var_194_7 * var_194_6.aspect
					local var_194_9 = var_194_4.sprite.bounds.size.x
					local var_194_10 = var_194_4.sprite.bounds.size.y
					local var_194_11 = var_194_8 / var_194_9
					local var_194_12 = var_194_7 / var_194_10
					local var_194_13 = var_194_12 < var_194_11 and var_194_11 or var_194_12

					var_194_3.transform.localScale = Vector3.New(var_194_13, var_194_13, 0)
				end

				for iter_194_0, iter_194_1 in pairs(arg_191_1.bgs_) do
					if iter_194_0 ~= "ST67" then
						iter_194_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_194_14 = 0

			if var_194_14 < arg_191_1.time_ and arg_191_1.time_ <= var_194_14 + arg_194_0 then
				arg_191_1.mask_.enabled = true
				arg_191_1.mask_.raycastTarget = true

				arg_191_1:SetGaussion(false)
			end

			local var_194_15 = 2

			if var_194_14 <= arg_191_1.time_ and arg_191_1.time_ < var_194_14 + var_194_15 then
				local var_194_16 = (arg_191_1.time_ - var_194_14) / var_194_15
				local var_194_17 = Color.New(0, 0, 0)

				var_194_17.a = Mathf.Lerp(0, 1, var_194_16)
				arg_191_1.mask_.color = var_194_17
			end

			if arg_191_1.time_ >= var_194_14 + var_194_15 and arg_191_1.time_ < var_194_14 + var_194_15 + arg_194_0 then
				local var_194_18 = Color.New(0, 0, 0)

				var_194_18.a = 1
				arg_191_1.mask_.color = var_194_18
			end

			local var_194_19 = 2

			if var_194_19 < arg_191_1.time_ and arg_191_1.time_ <= var_194_19 + arg_194_0 then
				arg_191_1.mask_.enabled = true
				arg_191_1.mask_.raycastTarget = true

				arg_191_1:SetGaussion(false)
			end

			local var_194_20 = 2

			if var_194_19 <= arg_191_1.time_ and arg_191_1.time_ < var_194_19 + var_194_20 then
				local var_194_21 = (arg_191_1.time_ - var_194_19) / var_194_20
				local var_194_22 = Color.New(0, 0, 0)

				var_194_22.a = Mathf.Lerp(1, 0, var_194_21)
				arg_191_1.mask_.color = var_194_22
			end

			if arg_191_1.time_ >= var_194_19 + var_194_20 and arg_191_1.time_ < var_194_19 + var_194_20 + arg_194_0 then
				local var_194_23 = Color.New(0, 0, 0)
				local var_194_24 = 0

				arg_191_1.mask_.enabled = false
				var_194_23.a = var_194_24
				arg_191_1.mask_.color = var_194_23
			end

			local var_194_25 = arg_191_1.actors_["1061"].transform
			local var_194_26 = 2

			if var_194_26 < arg_191_1.time_ and arg_191_1.time_ <= var_194_26 + arg_194_0 then
				arg_191_1.var_.moveOldPos1061 = var_194_25.localPosition
				var_194_25.localScale = Vector3.New(1, 1, 1)

				arg_191_1:CheckSpriteTmpPos("1061", 7)

				local var_194_27 = var_194_25.childCount

				for iter_194_2 = 0, var_194_27 - 1 do
					local var_194_28 = var_194_25:GetChild(iter_194_2)

					if var_194_28.name == "" or not string.find(var_194_28.name, "split") then
						var_194_28.gameObject:SetActive(true)
					else
						var_194_28.gameObject:SetActive(false)
					end
				end
			end

			local var_194_29 = 0.001

			if var_194_26 <= arg_191_1.time_ and arg_191_1.time_ < var_194_26 + var_194_29 then
				local var_194_30 = (arg_191_1.time_ - var_194_26) / var_194_29
				local var_194_31 = Vector3.New(0, -2000, 18)

				var_194_25.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos1061, var_194_31, var_194_30)
			end

			if arg_191_1.time_ >= var_194_26 + var_194_29 and arg_191_1.time_ < var_194_26 + var_194_29 + arg_194_0 then
				var_194_25.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_194_32 = arg_191_1.actors_["1061"]
			local var_194_33 = 2

			if var_194_33 < arg_191_1.time_ and arg_191_1.time_ <= var_194_33 + arg_194_0 and arg_191_1.var_.actorSpriteComps1061 == nil then
				arg_191_1.var_.actorSpriteComps1061 = var_194_32:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_34 = 0.034

			if var_194_33 <= arg_191_1.time_ and arg_191_1.time_ < var_194_33 + var_194_34 then
				local var_194_35 = (arg_191_1.time_ - var_194_33) / var_194_34

				if arg_191_1.var_.actorSpriteComps1061 then
					for iter_194_3, iter_194_4 in pairs(arg_191_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_194_4 then
							local var_194_36 = Mathf.Lerp(iter_194_4.color.r, 0.5, var_194_35)

							iter_194_4.color = Color.New(var_194_36, var_194_36, var_194_36)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_33 + var_194_34 and arg_191_1.time_ < var_194_33 + var_194_34 + arg_194_0 and arg_191_1.var_.actorSpriteComps1061 then
				local var_194_37 = 0.5

				for iter_194_5, iter_194_6 in pairs(arg_191_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_194_6 then
						iter_194_6.color = Color.New(var_194_37, var_194_37, var_194_37)
					end
				end

				arg_191_1.var_.actorSpriteComps1061 = nil
			end

			if arg_191_1.frameCnt_ <= 1 then
				arg_191_1.dialog_:SetActive(false)
			end

			local var_194_38 = 4
			local var_194_39 = 1.35

			if var_194_38 < arg_191_1.time_ and arg_191_1.time_ <= var_194_38 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0

				arg_191_1.dialog_:SetActive(true)

				local var_194_40 = LeanTween.value(arg_191_1.dialog_, 0, 1, 0.3)

				var_194_40:setOnUpdate(LuaHelper.FloatAction(function(arg_195_0)
					arg_191_1.dialogCg_.alpha = arg_195_0
				end))
				var_194_40:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_191_1.dialog_)
					var_194_40:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_191_1.duration_ = arg_191_1.duration_ + 0.3

				SetActive(arg_191_1.leftNameGo_, false)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_41 = arg_191_1:GetWordFromCfg(410241048)
				local var_194_42 = arg_191_1:FormatText(var_194_41.content)

				arg_191_1.text_.text = var_194_42

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_43 = 54
				local var_194_44 = utf8.len(var_194_42)
				local var_194_45 = var_194_43 <= 0 and var_194_39 or var_194_39 * (var_194_44 / var_194_43)

				if var_194_45 > 0 and var_194_39 < var_194_45 then
					arg_191_1.talkMaxDuration = var_194_45
					var_194_38 = var_194_38 + 0.3

					if var_194_45 + var_194_38 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_45 + var_194_38
					end
				end

				arg_191_1.text_.text = var_194_42
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_46 = var_194_38 + 0.3
			local var_194_47 = math.max(var_194_39, arg_191_1.talkMaxDuration)

			if var_194_46 <= arg_191_1.time_ and arg_191_1.time_ < var_194_46 + var_194_47 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_46) / var_194_47

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_46 + var_194_47 and arg_191_1.time_ < var_194_46 + var_194_47 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play410241049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 410241049
		arg_197_1.duration_ = 2.7

		local var_197_0 = {
			ja = 2.7,
			CriLanguages = 1.2,
			zh = 1.2
		}
		local var_197_1 = manager.audio:GetLocalizationFlag()

		if var_197_0[var_197_1] ~= nil then
			arg_197_1.duration_ = var_197_0[var_197_1]
		end

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play410241050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["1061"].transform
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 then
				arg_197_1.var_.moveOldPos1061 = var_200_0.localPosition
				var_200_0.localScale = Vector3.New(1, 1, 1)

				arg_197_1:CheckSpriteTmpPos("1061", 3)

				local var_200_2 = var_200_0.childCount

				for iter_200_0 = 0, var_200_2 - 1 do
					local var_200_3 = var_200_0:GetChild(iter_200_0)

					if var_200_3.name == "" or not string.find(var_200_3.name, "split") then
						var_200_3.gameObject:SetActive(true)
					else
						var_200_3.gameObject:SetActive(false)
					end
				end
			end

			local var_200_4 = 0.001

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_4 then
				local var_200_5 = (arg_197_1.time_ - var_200_1) / var_200_4
				local var_200_6 = Vector3.New(0, -490, 18)

				var_200_0.localPosition = Vector3.Lerp(arg_197_1.var_.moveOldPos1061, var_200_6, var_200_5)
			end

			if arg_197_1.time_ >= var_200_1 + var_200_4 and arg_197_1.time_ < var_200_1 + var_200_4 + arg_200_0 then
				var_200_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_200_7 = arg_197_1.actors_["1061"]
			local var_200_8 = 0

			if var_200_8 < arg_197_1.time_ and arg_197_1.time_ <= var_200_8 + arg_200_0 and arg_197_1.var_.actorSpriteComps1061 == nil then
				arg_197_1.var_.actorSpriteComps1061 = var_200_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_200_9 = 0.034

			if var_200_8 <= arg_197_1.time_ and arg_197_1.time_ < var_200_8 + var_200_9 then
				local var_200_10 = (arg_197_1.time_ - var_200_8) / var_200_9

				if arg_197_1.var_.actorSpriteComps1061 then
					for iter_200_1, iter_200_2 in pairs(arg_197_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_200_2 then
							local var_200_11 = Mathf.Lerp(iter_200_2.color.r, 1, var_200_10)

							iter_200_2.color = Color.New(var_200_11, var_200_11, var_200_11)
						end
					end
				end
			end

			if arg_197_1.time_ >= var_200_8 + var_200_9 and arg_197_1.time_ < var_200_8 + var_200_9 + arg_200_0 and arg_197_1.var_.actorSpriteComps1061 then
				local var_200_12 = 1

				for iter_200_3, iter_200_4 in pairs(arg_197_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_200_4 then
						iter_200_4.color = Color.New(var_200_12, var_200_12, var_200_12)
					end
				end

				arg_197_1.var_.actorSpriteComps1061 = nil
			end

			local var_200_13 = 0
			local var_200_14 = 0.15

			if var_200_13 < arg_197_1.time_ and arg_197_1.time_ <= var_200_13 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_15 = arg_197_1:FormatText(StoryNameCfg[612].name)

				arg_197_1.leftNameTxt_.text = var_200_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_16 = arg_197_1:GetWordFromCfg(410241049)
				local var_200_17 = arg_197_1:FormatText(var_200_16.content)

				arg_197_1.text_.text = var_200_17

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_18 = 6
				local var_200_19 = utf8.len(var_200_17)
				local var_200_20 = var_200_18 <= 0 and var_200_14 or var_200_14 * (var_200_19 / var_200_18)

				if var_200_20 > 0 and var_200_14 < var_200_20 then
					arg_197_1.talkMaxDuration = var_200_20

					if var_200_20 + var_200_13 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_20 + var_200_13
					end
				end

				arg_197_1.text_.text = var_200_17
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241049", "story_v_out_410241.awb") ~= 0 then
					local var_200_21 = manager.audio:GetVoiceLength("story_v_out_410241", "410241049", "story_v_out_410241.awb") / 1000

					if var_200_21 + var_200_13 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_21 + var_200_13
					end

					if var_200_16.prefab_name ~= "" and arg_197_1.actors_[var_200_16.prefab_name] ~= nil then
						local var_200_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_16.prefab_name].transform, "story_v_out_410241", "410241049", "story_v_out_410241.awb")

						arg_197_1:RecordAudio("410241049", var_200_22)
						arg_197_1:RecordAudio("410241049", var_200_22)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_410241", "410241049", "story_v_out_410241.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_410241", "410241049", "story_v_out_410241.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_23 = math.max(var_200_14, arg_197_1.talkMaxDuration)

			if var_200_13 <= arg_197_1.time_ and arg_197_1.time_ < var_200_13 + var_200_23 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_13) / var_200_23

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_13 + var_200_23 and arg_197_1.time_ < var_200_13 + var_200_23 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play410241050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 410241050
		arg_201_1.duration_ = 5

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play410241051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["1061"]
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 and arg_201_1.var_.actorSpriteComps1061 == nil then
				arg_201_1.var_.actorSpriteComps1061 = var_204_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_204_2 = 0.034

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2

				if arg_201_1.var_.actorSpriteComps1061 then
					for iter_204_0, iter_204_1 in pairs(arg_201_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_204_1 then
							local var_204_4 = Mathf.Lerp(iter_204_1.color.r, 0.5, var_204_3)

							iter_204_1.color = Color.New(var_204_4, var_204_4, var_204_4)
						end
					end
				end
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 and arg_201_1.var_.actorSpriteComps1061 then
				local var_204_5 = 0.5

				for iter_204_2, iter_204_3 in pairs(arg_201_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_204_3 then
						iter_204_3.color = Color.New(var_204_5, var_204_5, var_204_5)
					end
				end

				arg_201_1.var_.actorSpriteComps1061 = nil
			end

			local var_204_6 = 0
			local var_204_7 = 1.15

			if var_204_6 < arg_201_1.time_ and arg_201_1.time_ <= var_204_6 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, false)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_8 = arg_201_1:GetWordFromCfg(410241050)
				local var_204_9 = arg_201_1:FormatText(var_204_8.content)

				arg_201_1.text_.text = var_204_9

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_10 = 46
				local var_204_11 = utf8.len(var_204_9)
				local var_204_12 = var_204_10 <= 0 and var_204_7 or var_204_7 * (var_204_11 / var_204_10)

				if var_204_12 > 0 and var_204_7 < var_204_12 then
					arg_201_1.talkMaxDuration = var_204_12

					if var_204_12 + var_204_6 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_12 + var_204_6
					end
				end

				arg_201_1.text_.text = var_204_9
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)
				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_13 = math.max(var_204_7, arg_201_1.talkMaxDuration)

			if var_204_6 <= arg_201_1.time_ and arg_201_1.time_ < var_204_6 + var_204_13 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_6) / var_204_13

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_6 + var_204_13 and arg_201_1.time_ < var_204_6 + var_204_13 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play410241051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 410241051
		arg_205_1.duration_ = 20.233

		local var_205_0 = {
			ja = 20.233,
			CriLanguages = 14.033,
			zh = 14.033
		}
		local var_205_1 = manager.audio:GetLocalizationFlag()

		if var_205_0[var_205_1] ~= nil then
			arg_205_1.duration_ = var_205_0[var_205_1]
		end

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play410241052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["1061"].transform
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				arg_205_1.var_.moveOldPos1061 = var_208_0.localPosition
				var_208_0.localScale = Vector3.New(1, 1, 1)

				arg_205_1:CheckSpriteTmpPos("1061", 3)

				local var_208_2 = var_208_0.childCount

				for iter_208_0 = 0, var_208_2 - 1 do
					local var_208_3 = var_208_0:GetChild(iter_208_0)

					if var_208_3.name == "" or not string.find(var_208_3.name, "split") then
						var_208_3.gameObject:SetActive(true)
					else
						var_208_3.gameObject:SetActive(false)
					end
				end
			end

			local var_208_4 = 0.001

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_4 then
				local var_208_5 = (arg_205_1.time_ - var_208_1) / var_208_4
				local var_208_6 = Vector3.New(0, -490, 18)

				var_208_0.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos1061, var_208_6, var_208_5)
			end

			if arg_205_1.time_ >= var_208_1 + var_208_4 and arg_205_1.time_ < var_208_1 + var_208_4 + arg_208_0 then
				var_208_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_208_7 = arg_205_1.actors_["1061"]
			local var_208_8 = 0

			if var_208_8 < arg_205_1.time_ and arg_205_1.time_ <= var_208_8 + arg_208_0 and arg_205_1.var_.actorSpriteComps1061 == nil then
				arg_205_1.var_.actorSpriteComps1061 = var_208_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_208_9 = 0.034

			if var_208_8 <= arg_205_1.time_ and arg_205_1.time_ < var_208_8 + var_208_9 then
				local var_208_10 = (arg_205_1.time_ - var_208_8) / var_208_9

				if arg_205_1.var_.actorSpriteComps1061 then
					for iter_208_1, iter_208_2 in pairs(arg_205_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_208_2 then
							local var_208_11 = Mathf.Lerp(iter_208_2.color.r, 1, var_208_10)

							iter_208_2.color = Color.New(var_208_11, var_208_11, var_208_11)
						end
					end
				end
			end

			if arg_205_1.time_ >= var_208_8 + var_208_9 and arg_205_1.time_ < var_208_8 + var_208_9 + arg_208_0 and arg_205_1.var_.actorSpriteComps1061 then
				local var_208_12 = 1

				for iter_208_3, iter_208_4 in pairs(arg_205_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_208_4 then
						iter_208_4.color = Color.New(var_208_12, var_208_12, var_208_12)
					end
				end

				arg_205_1.var_.actorSpriteComps1061 = nil
			end

			local var_208_13 = 0
			local var_208_14 = 1.2

			if var_208_13 < arg_205_1.time_ and arg_205_1.time_ <= var_208_13 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_15 = arg_205_1:FormatText(StoryNameCfg[612].name)

				arg_205_1.leftNameTxt_.text = var_208_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_16 = arg_205_1:GetWordFromCfg(410241051)
				local var_208_17 = arg_205_1:FormatText(var_208_16.content)

				arg_205_1.text_.text = var_208_17

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_18 = 48
				local var_208_19 = utf8.len(var_208_17)
				local var_208_20 = var_208_18 <= 0 and var_208_14 or var_208_14 * (var_208_19 / var_208_18)

				if var_208_20 > 0 and var_208_14 < var_208_20 then
					arg_205_1.talkMaxDuration = var_208_20

					if var_208_20 + var_208_13 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_20 + var_208_13
					end
				end

				arg_205_1.text_.text = var_208_17
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241051", "story_v_out_410241.awb") ~= 0 then
					local var_208_21 = manager.audio:GetVoiceLength("story_v_out_410241", "410241051", "story_v_out_410241.awb") / 1000

					if var_208_21 + var_208_13 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_21 + var_208_13
					end

					if var_208_16.prefab_name ~= "" and arg_205_1.actors_[var_208_16.prefab_name] ~= nil then
						local var_208_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_16.prefab_name].transform, "story_v_out_410241", "410241051", "story_v_out_410241.awb")

						arg_205_1:RecordAudio("410241051", var_208_22)
						arg_205_1:RecordAudio("410241051", var_208_22)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_410241", "410241051", "story_v_out_410241.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_410241", "410241051", "story_v_out_410241.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_23 = math.max(var_208_14, arg_205_1.talkMaxDuration)

			if var_208_13 <= arg_205_1.time_ and arg_205_1.time_ < var_208_13 + var_208_23 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_13) / var_208_23

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_13 + var_208_23 and arg_205_1.time_ < var_208_13 + var_208_23 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play410241052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 410241052
		arg_209_1.duration_ = 6.366

		local var_209_0 = {
			ja = 6.2,
			CriLanguages = 6.366,
			zh = 6.366
		}
		local var_209_1 = manager.audio:GetLocalizationFlag()

		if var_209_0[var_209_1] ~= nil then
			arg_209_1.duration_ = var_209_0[var_209_1]
		end

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play410241053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1061"].transform
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.var_.moveOldPos1061 = var_212_0.localPosition
				var_212_0.localScale = Vector3.New(1, 1, 1)

				arg_209_1:CheckSpriteTmpPos("1061", 3)

				local var_212_2 = var_212_0.childCount

				for iter_212_0 = 0, var_212_2 - 1 do
					local var_212_3 = var_212_0:GetChild(iter_212_0)

					if var_212_3.name == "" or not string.find(var_212_3.name, "split") then
						var_212_3.gameObject:SetActive(true)
					else
						var_212_3.gameObject:SetActive(false)
					end
				end
			end

			local var_212_4 = 0.001

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_4 then
				local var_212_5 = (arg_209_1.time_ - var_212_1) / var_212_4
				local var_212_6 = Vector3.New(0, -490, 18)

				var_212_0.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos1061, var_212_6, var_212_5)
			end

			if arg_209_1.time_ >= var_212_1 + var_212_4 and arg_209_1.time_ < var_212_1 + var_212_4 + arg_212_0 then
				var_212_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_212_7 = arg_209_1.actors_["1061"]
			local var_212_8 = 0

			if var_212_8 < arg_209_1.time_ and arg_209_1.time_ <= var_212_8 + arg_212_0 and arg_209_1.var_.actorSpriteComps1061 == nil then
				arg_209_1.var_.actorSpriteComps1061 = var_212_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_212_9 = 0.034

			if var_212_8 <= arg_209_1.time_ and arg_209_1.time_ < var_212_8 + var_212_9 then
				local var_212_10 = (arg_209_1.time_ - var_212_8) / var_212_9

				if arg_209_1.var_.actorSpriteComps1061 then
					for iter_212_1, iter_212_2 in pairs(arg_209_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_212_2 then
							local var_212_11 = Mathf.Lerp(iter_212_2.color.r, 1, var_212_10)

							iter_212_2.color = Color.New(var_212_11, var_212_11, var_212_11)
						end
					end
				end
			end

			if arg_209_1.time_ >= var_212_8 + var_212_9 and arg_209_1.time_ < var_212_8 + var_212_9 + arg_212_0 and arg_209_1.var_.actorSpriteComps1061 then
				local var_212_12 = 1

				for iter_212_3, iter_212_4 in pairs(arg_209_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_212_4 then
						iter_212_4.color = Color.New(var_212_12, var_212_12, var_212_12)
					end
				end

				arg_209_1.var_.actorSpriteComps1061 = nil
			end

			local var_212_13 = 0
			local var_212_14 = 0.55

			if var_212_13 < arg_209_1.time_ and arg_209_1.time_ <= var_212_13 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_15 = arg_209_1:FormatText(StoryNameCfg[612].name)

				arg_209_1.leftNameTxt_.text = var_212_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_16 = arg_209_1:GetWordFromCfg(410241052)
				local var_212_17 = arg_209_1:FormatText(var_212_16.content)

				arg_209_1.text_.text = var_212_17

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_18 = 22
				local var_212_19 = utf8.len(var_212_17)
				local var_212_20 = var_212_18 <= 0 and var_212_14 or var_212_14 * (var_212_19 / var_212_18)

				if var_212_20 > 0 and var_212_14 < var_212_20 then
					arg_209_1.talkMaxDuration = var_212_20

					if var_212_20 + var_212_13 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_20 + var_212_13
					end
				end

				arg_209_1.text_.text = var_212_17
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241052", "story_v_out_410241.awb") ~= 0 then
					local var_212_21 = manager.audio:GetVoiceLength("story_v_out_410241", "410241052", "story_v_out_410241.awb") / 1000

					if var_212_21 + var_212_13 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_21 + var_212_13
					end

					if var_212_16.prefab_name ~= "" and arg_209_1.actors_[var_212_16.prefab_name] ~= nil then
						local var_212_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_16.prefab_name].transform, "story_v_out_410241", "410241052", "story_v_out_410241.awb")

						arg_209_1:RecordAudio("410241052", var_212_22)
						arg_209_1:RecordAudio("410241052", var_212_22)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_410241", "410241052", "story_v_out_410241.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_410241", "410241052", "story_v_out_410241.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_23 = math.max(var_212_14, arg_209_1.talkMaxDuration)

			if var_212_13 <= arg_209_1.time_ and arg_209_1.time_ < var_212_13 + var_212_23 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_13) / var_212_23

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_13 + var_212_23 and arg_209_1.time_ < var_212_13 + var_212_23 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play410241053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 410241053
		arg_213_1.duration_ = 5.233

		local var_213_0 = {
			ja = 5.233,
			CriLanguages = 3.766,
			zh = 3.766
		}
		local var_213_1 = manager.audio:GetLocalizationFlag()

		if var_213_0[var_213_1] ~= nil then
			arg_213_1.duration_ = var_213_0[var_213_1]
		end

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play410241054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1061"].transform
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				arg_213_1.var_.moveOldPos1061 = var_216_0.localPosition
				var_216_0.localScale = Vector3.New(1, 1, 1)

				arg_213_1:CheckSpriteTmpPos("1061", 3)

				local var_216_2 = var_216_0.childCount

				for iter_216_0 = 0, var_216_2 - 1 do
					local var_216_3 = var_216_0:GetChild(iter_216_0)

					if var_216_3.name == "split_5" or not string.find(var_216_3.name, "split") then
						var_216_3.gameObject:SetActive(true)
					else
						var_216_3.gameObject:SetActive(false)
					end
				end
			end

			local var_216_4 = 0.001

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_4 then
				local var_216_5 = (arg_213_1.time_ - var_216_1) / var_216_4
				local var_216_6 = Vector3.New(0, -490, 18)

				var_216_0.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos1061, var_216_6, var_216_5)
			end

			if arg_213_1.time_ >= var_216_1 + var_216_4 and arg_213_1.time_ < var_216_1 + var_216_4 + arg_216_0 then
				var_216_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_216_7 = arg_213_1.actors_["1061"]
			local var_216_8 = 0

			if var_216_8 < arg_213_1.time_ and arg_213_1.time_ <= var_216_8 + arg_216_0 and arg_213_1.var_.actorSpriteComps1061 == nil then
				arg_213_1.var_.actorSpriteComps1061 = var_216_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_216_9 = 0.034

			if var_216_8 <= arg_213_1.time_ and arg_213_1.time_ < var_216_8 + var_216_9 then
				local var_216_10 = (arg_213_1.time_ - var_216_8) / var_216_9

				if arg_213_1.var_.actorSpriteComps1061 then
					for iter_216_1, iter_216_2 in pairs(arg_213_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_216_2 then
							local var_216_11 = Mathf.Lerp(iter_216_2.color.r, 1, var_216_10)

							iter_216_2.color = Color.New(var_216_11, var_216_11, var_216_11)
						end
					end
				end
			end

			if arg_213_1.time_ >= var_216_8 + var_216_9 and arg_213_1.time_ < var_216_8 + var_216_9 + arg_216_0 and arg_213_1.var_.actorSpriteComps1061 then
				local var_216_12 = 1

				for iter_216_3, iter_216_4 in pairs(arg_213_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_216_4 then
						iter_216_4.color = Color.New(var_216_12, var_216_12, var_216_12)
					end
				end

				arg_213_1.var_.actorSpriteComps1061 = nil
			end

			local var_216_13 = 0
			local var_216_14 = 0.25

			if var_216_13 < arg_213_1.time_ and arg_213_1.time_ <= var_216_13 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_15 = arg_213_1:FormatText(StoryNameCfg[612].name)

				arg_213_1.leftNameTxt_.text = var_216_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_16 = arg_213_1:GetWordFromCfg(410241053)
				local var_216_17 = arg_213_1:FormatText(var_216_16.content)

				arg_213_1.text_.text = var_216_17

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_18 = 10
				local var_216_19 = utf8.len(var_216_17)
				local var_216_20 = var_216_18 <= 0 and var_216_14 or var_216_14 * (var_216_19 / var_216_18)

				if var_216_20 > 0 and var_216_14 < var_216_20 then
					arg_213_1.talkMaxDuration = var_216_20

					if var_216_20 + var_216_13 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_20 + var_216_13
					end
				end

				arg_213_1.text_.text = var_216_17
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241053", "story_v_out_410241.awb") ~= 0 then
					local var_216_21 = manager.audio:GetVoiceLength("story_v_out_410241", "410241053", "story_v_out_410241.awb") / 1000

					if var_216_21 + var_216_13 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_21 + var_216_13
					end

					if var_216_16.prefab_name ~= "" and arg_213_1.actors_[var_216_16.prefab_name] ~= nil then
						local var_216_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_16.prefab_name].transform, "story_v_out_410241", "410241053", "story_v_out_410241.awb")

						arg_213_1:RecordAudio("410241053", var_216_22)
						arg_213_1:RecordAudio("410241053", var_216_22)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_410241", "410241053", "story_v_out_410241.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_410241", "410241053", "story_v_out_410241.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_23 = math.max(var_216_14, arg_213_1.talkMaxDuration)

			if var_216_13 <= arg_213_1.time_ and arg_213_1.time_ < var_216_13 + var_216_23 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_13) / var_216_23

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_13 + var_216_23 and arg_213_1.time_ < var_216_13 + var_216_23 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play410241054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 410241054
		arg_217_1.duration_ = 9

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play410241055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = "LZ0206"

			if arg_217_1.bgs_[var_220_0] == nil then
				local var_220_1 = Object.Instantiate(arg_217_1.paintGo_)

				var_220_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_220_0)
				var_220_1.name = var_220_0
				var_220_1.transform.parent = arg_217_1.stage_.transform
				var_220_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_217_1.bgs_[var_220_0] = var_220_1
			end

			local var_220_2 = 2

			if var_220_2 < arg_217_1.time_ and arg_217_1.time_ <= var_220_2 + arg_220_0 then
				local var_220_3 = manager.ui.mainCamera.transform.localPosition
				local var_220_4 = Vector3.New(0, 0, 10) + Vector3.New(var_220_3.x, var_220_3.y, 0)
				local var_220_5 = arg_217_1.bgs_.LZ0206

				var_220_5.transform.localPosition = var_220_4
				var_220_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_220_6 = var_220_5:GetComponent("SpriteRenderer")

				if var_220_6 and var_220_6.sprite then
					local var_220_7 = (var_220_5.transform.localPosition - var_220_3).z
					local var_220_8 = manager.ui.mainCameraCom_
					local var_220_9 = 2 * var_220_7 * Mathf.Tan(var_220_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_220_10 = var_220_9 * var_220_8.aspect
					local var_220_11 = var_220_6.sprite.bounds.size.x
					local var_220_12 = var_220_6.sprite.bounds.size.y
					local var_220_13 = var_220_10 / var_220_11
					local var_220_14 = var_220_9 / var_220_12
					local var_220_15 = var_220_14 < var_220_13 and var_220_13 or var_220_14

					var_220_5.transform.localScale = Vector3.New(var_220_15, var_220_15, 0)
				end

				for iter_220_0, iter_220_1 in pairs(arg_217_1.bgs_) do
					if iter_220_0 ~= "LZ0206" then
						iter_220_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_220_16 = 0

			if var_220_16 < arg_217_1.time_ and arg_217_1.time_ <= var_220_16 + arg_220_0 then
				arg_217_1.mask_.enabled = true
				arg_217_1.mask_.raycastTarget = true

				arg_217_1:SetGaussion(false)
			end

			local var_220_17 = 2

			if var_220_16 <= arg_217_1.time_ and arg_217_1.time_ < var_220_16 + var_220_17 then
				local var_220_18 = (arg_217_1.time_ - var_220_16) / var_220_17
				local var_220_19 = Color.New(0, 0, 0)

				var_220_19.a = Mathf.Lerp(0, 1, var_220_18)
				arg_217_1.mask_.color = var_220_19
			end

			if arg_217_1.time_ >= var_220_16 + var_220_17 and arg_217_1.time_ < var_220_16 + var_220_17 + arg_220_0 then
				local var_220_20 = Color.New(0, 0, 0)

				var_220_20.a = 1
				arg_217_1.mask_.color = var_220_20
			end

			local var_220_21 = 2

			if var_220_21 < arg_217_1.time_ and arg_217_1.time_ <= var_220_21 + arg_220_0 then
				arg_217_1.mask_.enabled = true
				arg_217_1.mask_.raycastTarget = true

				arg_217_1:SetGaussion(false)
			end

			local var_220_22 = 2

			if var_220_21 <= arg_217_1.time_ and arg_217_1.time_ < var_220_21 + var_220_22 then
				local var_220_23 = (arg_217_1.time_ - var_220_21) / var_220_22
				local var_220_24 = Color.New(0, 0, 0)

				var_220_24.a = Mathf.Lerp(1, 0, var_220_23)
				arg_217_1.mask_.color = var_220_24
			end

			if arg_217_1.time_ >= var_220_21 + var_220_22 and arg_217_1.time_ < var_220_21 + var_220_22 + arg_220_0 then
				local var_220_25 = Color.New(0, 0, 0)
				local var_220_26 = 0

				arg_217_1.mask_.enabled = false
				var_220_25.a = var_220_26
				arg_217_1.mask_.color = var_220_25
			end

			local var_220_27 = arg_217_1.actors_["1061"].transform
			local var_220_28 = 2

			if var_220_28 < arg_217_1.time_ and arg_217_1.time_ <= var_220_28 + arg_220_0 then
				arg_217_1.var_.moveOldPos1061 = var_220_27.localPosition
				var_220_27.localScale = Vector3.New(1, 1, 1)

				arg_217_1:CheckSpriteTmpPos("1061", 7)

				local var_220_29 = var_220_27.childCount

				for iter_220_2 = 0, var_220_29 - 1 do
					local var_220_30 = var_220_27:GetChild(iter_220_2)

					if var_220_30.name == "" or not string.find(var_220_30.name, "split") then
						var_220_30.gameObject:SetActive(true)
					else
						var_220_30.gameObject:SetActive(false)
					end
				end
			end

			local var_220_31 = 0.001

			if var_220_28 <= arg_217_1.time_ and arg_217_1.time_ < var_220_28 + var_220_31 then
				local var_220_32 = (arg_217_1.time_ - var_220_28) / var_220_31
				local var_220_33 = Vector3.New(0, -2000, 18)

				var_220_27.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos1061, var_220_33, var_220_32)
			end

			if arg_217_1.time_ >= var_220_28 + var_220_31 and arg_217_1.time_ < var_220_28 + var_220_31 + arg_220_0 then
				var_220_27.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_220_34 = arg_217_1.actors_["1061"]
			local var_220_35 = 2

			if var_220_35 < arg_217_1.time_ and arg_217_1.time_ <= var_220_35 + arg_220_0 and arg_217_1.var_.actorSpriteComps1061 == nil then
				arg_217_1.var_.actorSpriteComps1061 = var_220_34:GetComponentsInChildren(typeof(Image), true)
			end

			local var_220_36 = 0.034

			if var_220_35 <= arg_217_1.time_ and arg_217_1.time_ < var_220_35 + var_220_36 then
				local var_220_37 = (arg_217_1.time_ - var_220_35) / var_220_36

				if arg_217_1.var_.actorSpriteComps1061 then
					for iter_220_3, iter_220_4 in pairs(arg_217_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_220_4 then
							local var_220_38 = Mathf.Lerp(iter_220_4.color.r, 0.5, var_220_37)

							iter_220_4.color = Color.New(var_220_38, var_220_38, var_220_38)
						end
					end
				end
			end

			if arg_217_1.time_ >= var_220_35 + var_220_36 and arg_217_1.time_ < var_220_35 + var_220_36 + arg_220_0 and arg_217_1.var_.actorSpriteComps1061 then
				local var_220_39 = 0.5

				for iter_220_5, iter_220_6 in pairs(arg_217_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_220_6 then
						iter_220_6.color = Color.New(var_220_39, var_220_39, var_220_39)
					end
				end

				arg_217_1.var_.actorSpriteComps1061 = nil
			end

			local var_220_40 = 0
			local var_220_41 = 0.166666666666667

			if var_220_40 < arg_217_1.time_ and arg_217_1.time_ <= var_220_40 + arg_220_0 then
				local var_220_42 = "play"
				local var_220_43 = "effect"

				arg_217_1:AudioAction(var_220_42, var_220_43, "se_story_129", "se_story_129_information_magic", "")
			end

			local var_220_44 = arg_217_1.bgs_.LZ0206.transform
			local var_220_45 = 2.034

			if var_220_45 < arg_217_1.time_ and arg_217_1.time_ <= var_220_45 + arg_220_0 then
				arg_217_1.var_.moveOldPosLZ0206 = var_220_44.localPosition
			end

			local var_220_46 = 0.001

			if var_220_45 <= arg_217_1.time_ and arg_217_1.time_ < var_220_45 + var_220_46 then
				local var_220_47 = (arg_217_1.time_ - var_220_45) / var_220_46
				local var_220_48 = Vector3.New(0, 1, 10)

				var_220_44.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPosLZ0206, var_220_48, var_220_47)
			end

			if arg_217_1.time_ >= var_220_45 + var_220_46 and arg_217_1.time_ < var_220_45 + var_220_46 + arg_220_0 then
				var_220_44.localPosition = Vector3.New(0, 1, 10)
			end

			local var_220_49 = arg_217_1.bgs_.LZ0206.transform
			local var_220_50 = 2.068

			if var_220_50 < arg_217_1.time_ and arg_217_1.time_ <= var_220_50 + arg_220_0 then
				arg_217_1.var_.moveOldPosLZ0206 = var_220_49.localPosition
			end

			local var_220_51 = 5

			if var_220_50 <= arg_217_1.time_ and arg_217_1.time_ < var_220_50 + var_220_51 then
				local var_220_52 = (arg_217_1.time_ - var_220_50) / var_220_51
				local var_220_53 = Vector3.New(0, 1, 9)

				var_220_49.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPosLZ0206, var_220_53, var_220_52)
			end

			if arg_217_1.time_ >= var_220_50 + var_220_51 and arg_217_1.time_ < var_220_50 + var_220_51 + arg_220_0 then
				var_220_49.localPosition = Vector3.New(0, 1, 9)
			end

			local var_220_54 = 4

			if var_220_54 < arg_217_1.time_ and arg_217_1.time_ <= var_220_54 + arg_220_0 then
				arg_217_1.allBtn_.enabled = false
			end

			local var_220_55 = 3.068

			if arg_217_1.time_ >= var_220_54 + var_220_55 and arg_217_1.time_ < var_220_54 + var_220_55 + arg_220_0 then
				arg_217_1.allBtn_.enabled = true
			end

			if arg_217_1.frameCnt_ <= 1 then
				arg_217_1.dialog_:SetActive(false)
			end

			local var_220_56 = 4
			local var_220_57 = 1.7

			if var_220_56 < arg_217_1.time_ and arg_217_1.time_ <= var_220_56 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0

				arg_217_1.dialog_:SetActive(true)

				local var_220_58 = LeanTween.value(arg_217_1.dialog_, 0, 1, 0.3)

				var_220_58:setOnUpdate(LuaHelper.FloatAction(function(arg_221_0)
					arg_217_1.dialogCg_.alpha = arg_221_0
				end))
				var_220_58:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_217_1.dialog_)
					var_220_58:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_217_1.duration_ = arg_217_1.duration_ + 0.3

				SetActive(arg_217_1.leftNameGo_, false)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_59 = arg_217_1:GetWordFromCfg(410241054)
				local var_220_60 = arg_217_1:FormatText(var_220_59.content)

				arg_217_1.text_.text = var_220_60

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_61 = 68
				local var_220_62 = utf8.len(var_220_60)
				local var_220_63 = var_220_61 <= 0 and var_220_57 or var_220_57 * (var_220_62 / var_220_61)

				if var_220_63 > 0 and var_220_57 < var_220_63 then
					arg_217_1.talkMaxDuration = var_220_63
					var_220_56 = var_220_56 + 0.3

					if var_220_63 + var_220_56 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_63 + var_220_56
					end
				end

				arg_217_1.text_.text = var_220_60
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)
				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_64 = var_220_56 + 0.3
			local var_220_65 = math.max(var_220_57, arg_217_1.talkMaxDuration)

			if var_220_64 <= arg_217_1.time_ and arg_217_1.time_ < var_220_64 + var_220_65 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_64) / var_220_65

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_64 + var_220_65 and arg_217_1.time_ < var_220_64 + var_220_65 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play410241055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 410241055
		arg_223_1.duration_ = 14.3

		local var_223_0 = {
			ja = 14.3,
			CriLanguages = 11.7,
			zh = 11.7
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
				arg_223_0:Play410241056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = 0
			local var_226_1 = 0.875

			if var_226_0 < arg_223_1.time_ and arg_223_1.time_ <= var_226_0 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_2 = arg_223_1:FormatText(StoryNameCfg[612].name)

				arg_223_1.leftNameTxt_.text = var_226_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_3 = arg_223_1:GetWordFromCfg(410241055)
				local var_226_4 = arg_223_1:FormatText(var_226_3.content)

				arg_223_1.text_.text = var_226_4

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241055", "story_v_out_410241.awb") ~= 0 then
					local var_226_8 = manager.audio:GetVoiceLength("story_v_out_410241", "410241055", "story_v_out_410241.awb") / 1000

					if var_226_8 + var_226_0 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_8 + var_226_0
					end

					if var_226_3.prefab_name ~= "" and arg_223_1.actors_[var_226_3.prefab_name] ~= nil then
						local var_226_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_3.prefab_name].transform, "story_v_out_410241", "410241055", "story_v_out_410241.awb")

						arg_223_1:RecordAudio("410241055", var_226_9)
						arg_223_1:RecordAudio("410241055", var_226_9)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_410241", "410241055", "story_v_out_410241.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_410241", "410241055", "story_v_out_410241.awb")
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
	Play410241056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 410241056
		arg_227_1.duration_ = 6.8

		local var_227_0 = {
			ja = 6.8,
			CriLanguages = 6.5,
			zh = 6.5
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
				arg_227_0:Play410241057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0
			local var_230_1 = 0.575

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_2 = arg_227_1:FormatText(StoryNameCfg[612].name)

				arg_227_1.leftNameTxt_.text = var_230_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_3 = arg_227_1:GetWordFromCfg(410241056)
				local var_230_4 = arg_227_1:FormatText(var_230_3.content)

				arg_227_1.text_.text = var_230_4

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241056", "story_v_out_410241.awb") ~= 0 then
					local var_230_8 = manager.audio:GetVoiceLength("story_v_out_410241", "410241056", "story_v_out_410241.awb") / 1000

					if var_230_8 + var_230_0 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_8 + var_230_0
					end

					if var_230_3.prefab_name ~= "" and arg_227_1.actors_[var_230_3.prefab_name] ~= nil then
						local var_230_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_3.prefab_name].transform, "story_v_out_410241", "410241056", "story_v_out_410241.awb")

						arg_227_1:RecordAudio("410241056", var_230_9)
						arg_227_1:RecordAudio("410241056", var_230_9)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_410241", "410241056", "story_v_out_410241.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_410241", "410241056", "story_v_out_410241.awb")
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
	Play410241057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 410241057
		arg_231_1.duration_ = 5

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play410241058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0
			local var_234_1 = 1.625

			if var_234_0 < arg_231_1.time_ and arg_231_1.time_ <= var_234_0 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, false)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_2 = arg_231_1:GetWordFromCfg(410241057)
				local var_234_3 = arg_231_1:FormatText(var_234_2.content)

				arg_231_1.text_.text = var_234_3

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_4 = 65
				local var_234_5 = utf8.len(var_234_3)
				local var_234_6 = var_234_4 <= 0 and var_234_1 or var_234_1 * (var_234_5 / var_234_4)

				if var_234_6 > 0 and var_234_1 < var_234_6 then
					arg_231_1.talkMaxDuration = var_234_6

					if var_234_6 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_6 + var_234_0
					end
				end

				arg_231_1.text_.text = var_234_3
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)
				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_7 = math.max(var_234_1, arg_231_1.talkMaxDuration)

			if var_234_0 <= arg_231_1.time_ and arg_231_1.time_ < var_234_0 + var_234_7 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_0) / var_234_7

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_0 + var_234_7 and arg_231_1.time_ < var_234_0 + var_234_7 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play410241058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 410241058
		arg_235_1.duration_ = 5

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play410241059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0
			local var_238_1 = 1.45

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, false)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_2 = arg_235_1:GetWordFromCfg(410241058)
				local var_238_3 = arg_235_1:FormatText(var_238_2.content)

				arg_235_1.text_.text = var_238_3

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_4 = 58
				local var_238_5 = utf8.len(var_238_3)
				local var_238_6 = var_238_4 <= 0 and var_238_1 or var_238_1 * (var_238_5 / var_238_4)

				if var_238_6 > 0 and var_238_1 < var_238_6 then
					arg_235_1.talkMaxDuration = var_238_6

					if var_238_6 + var_238_0 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_6 + var_238_0
					end
				end

				arg_235_1.text_.text = var_238_3
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)
				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_7 = math.max(var_238_1, arg_235_1.talkMaxDuration)

			if var_238_0 <= arg_235_1.time_ and arg_235_1.time_ < var_238_0 + var_238_7 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_0) / var_238_7

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_0 + var_238_7 and arg_235_1.time_ < var_238_0 + var_238_7 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play410241059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 410241059
		arg_239_1.duration_ = 5

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play410241060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0
			local var_242_1 = 1.125

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, false)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_2 = arg_239_1:GetWordFromCfg(410241059)
				local var_242_3 = arg_239_1:FormatText(var_242_2.content)

				arg_239_1.text_.text = var_242_3

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_4 = 45
				local var_242_5 = utf8.len(var_242_3)
				local var_242_6 = var_242_4 <= 0 and var_242_1 or var_242_1 * (var_242_5 / var_242_4)

				if var_242_6 > 0 and var_242_1 < var_242_6 then
					arg_239_1.talkMaxDuration = var_242_6

					if var_242_6 + var_242_0 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_6 + var_242_0
					end
				end

				arg_239_1.text_.text = var_242_3
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)
				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_7 = math.max(var_242_1, arg_239_1.talkMaxDuration)

			if var_242_0 <= arg_239_1.time_ and arg_239_1.time_ < var_242_0 + var_242_7 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_0) / var_242_7

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_0 + var_242_7 and arg_239_1.time_ < var_242_0 + var_242_7 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play410241060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 410241060
		arg_243_1.duration_ = 2.633

		local var_243_0 = {
			ja = 2.266,
			CriLanguages = 2.633,
			zh = 2.633
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
				arg_243_0:Play410241061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 0.125

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_2 = arg_243_1:FormatText(StoryNameCfg[612].name)

				arg_243_1.leftNameTxt_.text = var_246_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_3 = arg_243_1:GetWordFromCfg(410241060)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241060", "story_v_out_410241.awb") ~= 0 then
					local var_246_8 = manager.audio:GetVoiceLength("story_v_out_410241", "410241060", "story_v_out_410241.awb") / 1000

					if var_246_8 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_8 + var_246_0
					end

					if var_246_3.prefab_name ~= "" and arg_243_1.actors_[var_246_3.prefab_name] ~= nil then
						local var_246_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_3.prefab_name].transform, "story_v_out_410241", "410241060", "story_v_out_410241.awb")

						arg_243_1:RecordAudio("410241060", var_246_9)
						arg_243_1:RecordAudio("410241060", var_246_9)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_410241", "410241060", "story_v_out_410241.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_410241", "410241060", "story_v_out_410241.awb")
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
	Play410241061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 410241061
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play410241062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = 0
			local var_250_1 = 0.925

			if var_250_0 < arg_247_1.time_ and arg_247_1.time_ <= var_250_0 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, false)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_2 = arg_247_1:GetWordFromCfg(410241061)
				local var_250_3 = arg_247_1:FormatText(var_250_2.content)

				arg_247_1.text_.text = var_250_3

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_4 = 37
				local var_250_5 = utf8.len(var_250_3)
				local var_250_6 = var_250_4 <= 0 and var_250_1 or var_250_1 * (var_250_5 / var_250_4)

				if var_250_6 > 0 and var_250_1 < var_250_6 then
					arg_247_1.talkMaxDuration = var_250_6

					if var_250_6 + var_250_0 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_6 + var_250_0
					end
				end

				arg_247_1.text_.text = var_250_3
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)
				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_7 = math.max(var_250_1, arg_247_1.talkMaxDuration)

			if var_250_0 <= arg_247_1.time_ and arg_247_1.time_ < var_250_0 + var_250_7 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_0) / var_250_7

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_0 + var_250_7 and arg_247_1.time_ < var_250_0 + var_250_7 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play410241062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 410241062
		arg_251_1.duration_ = 5

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play410241063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0
			local var_254_1 = 1.375

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, false)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_2 = arg_251_1:GetWordFromCfg(410241062)
				local var_254_3 = arg_251_1:FormatText(var_254_2.content)

				arg_251_1.text_.text = var_254_3

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_4 = 55
				local var_254_5 = utf8.len(var_254_3)
				local var_254_6 = var_254_4 <= 0 and var_254_1 or var_254_1 * (var_254_5 / var_254_4)

				if var_254_6 > 0 and var_254_1 < var_254_6 then
					arg_251_1.talkMaxDuration = var_254_6

					if var_254_6 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_6 + var_254_0
					end
				end

				arg_251_1.text_.text = var_254_3
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)
				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_7 = math.max(var_254_1, arg_251_1.talkMaxDuration)

			if var_254_0 <= arg_251_1.time_ and arg_251_1.time_ < var_254_0 + var_254_7 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_0) / var_254_7

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_0 + var_254_7 and arg_251_1.time_ < var_254_0 + var_254_7 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play410241063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 410241063
		arg_255_1.duration_ = 9

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play410241064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = "L04h"

			if arg_255_1.bgs_[var_258_0] == nil then
				local var_258_1 = Object.Instantiate(arg_255_1.paintGo_)

				var_258_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_258_0)
				var_258_1.name = var_258_0
				var_258_1.transform.parent = arg_255_1.stage_.transform
				var_258_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_255_1.bgs_[var_258_0] = var_258_1
			end

			local var_258_2 = 2

			if var_258_2 < arg_255_1.time_ and arg_255_1.time_ <= var_258_2 + arg_258_0 then
				local var_258_3 = manager.ui.mainCamera.transform.localPosition
				local var_258_4 = Vector3.New(0, 0, 10) + Vector3.New(var_258_3.x, var_258_3.y, 0)
				local var_258_5 = arg_255_1.bgs_.L04h

				var_258_5.transform.localPosition = var_258_4
				var_258_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_258_6 = var_258_5:GetComponent("SpriteRenderer")

				if var_258_6 and var_258_6.sprite then
					local var_258_7 = (var_258_5.transform.localPosition - var_258_3).z
					local var_258_8 = manager.ui.mainCameraCom_
					local var_258_9 = 2 * var_258_7 * Mathf.Tan(var_258_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_258_10 = var_258_9 * var_258_8.aspect
					local var_258_11 = var_258_6.sprite.bounds.size.x
					local var_258_12 = var_258_6.sprite.bounds.size.y
					local var_258_13 = var_258_10 / var_258_11
					local var_258_14 = var_258_9 / var_258_12
					local var_258_15 = var_258_14 < var_258_13 and var_258_13 or var_258_14

					var_258_5.transform.localScale = Vector3.New(var_258_15, var_258_15, 0)
				end

				for iter_258_0, iter_258_1 in pairs(arg_255_1.bgs_) do
					if iter_258_0 ~= "L04h" then
						iter_258_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_258_16 = 0

			if var_258_16 < arg_255_1.time_ and arg_255_1.time_ <= var_258_16 + arg_258_0 then
				arg_255_1.mask_.enabled = true
				arg_255_1.mask_.raycastTarget = true

				arg_255_1:SetGaussion(false)
			end

			local var_258_17 = 2

			if var_258_16 <= arg_255_1.time_ and arg_255_1.time_ < var_258_16 + var_258_17 then
				local var_258_18 = (arg_255_1.time_ - var_258_16) / var_258_17
				local var_258_19 = Color.New(0, 0, 0)

				var_258_19.a = Mathf.Lerp(0, 1, var_258_18)
				arg_255_1.mask_.color = var_258_19
			end

			if arg_255_1.time_ >= var_258_16 + var_258_17 and arg_255_1.time_ < var_258_16 + var_258_17 + arg_258_0 then
				local var_258_20 = Color.New(0, 0, 0)

				var_258_20.a = 1
				arg_255_1.mask_.color = var_258_20
			end

			local var_258_21 = 2

			if var_258_21 < arg_255_1.time_ and arg_255_1.time_ <= var_258_21 + arg_258_0 then
				arg_255_1.mask_.enabled = true
				arg_255_1.mask_.raycastTarget = true

				arg_255_1:SetGaussion(false)
			end

			local var_258_22 = 2

			if var_258_21 <= arg_255_1.time_ and arg_255_1.time_ < var_258_21 + var_258_22 then
				local var_258_23 = (arg_255_1.time_ - var_258_21) / var_258_22
				local var_258_24 = Color.New(0, 0, 0)

				var_258_24.a = Mathf.Lerp(1, 0, var_258_23)
				arg_255_1.mask_.color = var_258_24
			end

			if arg_255_1.time_ >= var_258_21 + var_258_22 and arg_255_1.time_ < var_258_21 + var_258_22 + arg_258_0 then
				local var_258_25 = Color.New(0, 0, 0)
				local var_258_26 = 0

				arg_255_1.mask_.enabled = false
				var_258_25.a = var_258_26
				arg_255_1.mask_.color = var_258_25
			end

			if arg_255_1.frameCnt_ <= 1 then
				arg_255_1.dialog_:SetActive(false)
			end

			local var_258_27 = 4
			local var_258_28 = 1.425

			if var_258_27 < arg_255_1.time_ and arg_255_1.time_ <= var_258_27 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0

				arg_255_1.dialog_:SetActive(true)

				local var_258_29 = LeanTween.value(arg_255_1.dialog_, 0, 1, 0.3)

				var_258_29:setOnUpdate(LuaHelper.FloatAction(function(arg_259_0)
					arg_255_1.dialogCg_.alpha = arg_259_0
				end))
				var_258_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_255_1.dialog_)
					var_258_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_255_1.duration_ = arg_255_1.duration_ + 0.3

				SetActive(arg_255_1.leftNameGo_, false)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_30 = arg_255_1:GetWordFromCfg(410241063)
				local var_258_31 = arg_255_1:FormatText(var_258_30.content)

				arg_255_1.text_.text = var_258_31

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_32 = 57
				local var_258_33 = utf8.len(var_258_31)
				local var_258_34 = var_258_32 <= 0 and var_258_28 or var_258_28 * (var_258_33 / var_258_32)

				if var_258_34 > 0 and var_258_28 < var_258_34 then
					arg_255_1.talkMaxDuration = var_258_34
					var_258_27 = var_258_27 + 0.3

					if var_258_34 + var_258_27 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_34 + var_258_27
					end
				end

				arg_255_1.text_.text = var_258_31
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)
				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_35 = var_258_27 + 0.3
			local var_258_36 = math.max(var_258_28, arg_255_1.talkMaxDuration)

			if var_258_35 <= arg_255_1.time_ and arg_255_1.time_ < var_258_35 + var_258_36 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_35) / var_258_36

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_35 + var_258_36 and arg_255_1.time_ < var_258_35 + var_258_36 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play410241064 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 410241064
		arg_261_1.duration_ = 2.366

		local var_261_0 = {
			ja = 2.366,
			CriLanguages = 1.6,
			zh = 1.6
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
				arg_261_0:Play410241065(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["1061"].transform
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 then
				arg_261_1.var_.moveOldPos1061 = var_264_0.localPosition
				var_264_0.localScale = Vector3.New(1, 1, 1)

				arg_261_1:CheckSpriteTmpPos("1061", 3)

				local var_264_2 = var_264_0.childCount

				for iter_264_0 = 0, var_264_2 - 1 do
					local var_264_3 = var_264_0:GetChild(iter_264_0)

					if var_264_3.name == "" or not string.find(var_264_3.name, "split") then
						var_264_3.gameObject:SetActive(true)
					else
						var_264_3.gameObject:SetActive(false)
					end
				end
			end

			local var_264_4 = 0.001

			if var_264_1 <= arg_261_1.time_ and arg_261_1.time_ < var_264_1 + var_264_4 then
				local var_264_5 = (arg_261_1.time_ - var_264_1) / var_264_4
				local var_264_6 = Vector3.New(0, -490, 18)

				var_264_0.localPosition = Vector3.Lerp(arg_261_1.var_.moveOldPos1061, var_264_6, var_264_5)
			end

			if arg_261_1.time_ >= var_264_1 + var_264_4 and arg_261_1.time_ < var_264_1 + var_264_4 + arg_264_0 then
				var_264_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_264_7 = arg_261_1.actors_["1061"]
			local var_264_8 = 0

			if var_264_8 < arg_261_1.time_ and arg_261_1.time_ <= var_264_8 + arg_264_0 and arg_261_1.var_.actorSpriteComps1061 == nil then
				arg_261_1.var_.actorSpriteComps1061 = var_264_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_264_9 = 0.034

			if var_264_8 <= arg_261_1.time_ and arg_261_1.time_ < var_264_8 + var_264_9 then
				local var_264_10 = (arg_261_1.time_ - var_264_8) / var_264_9

				if arg_261_1.var_.actorSpriteComps1061 then
					for iter_264_1, iter_264_2 in pairs(arg_261_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_264_2 then
							local var_264_11 = Mathf.Lerp(iter_264_2.color.r, 1, var_264_10)

							iter_264_2.color = Color.New(var_264_11, var_264_11, var_264_11)
						end
					end
				end
			end

			if arg_261_1.time_ >= var_264_8 + var_264_9 and arg_261_1.time_ < var_264_8 + var_264_9 + arg_264_0 and arg_261_1.var_.actorSpriteComps1061 then
				local var_264_12 = 1

				for iter_264_3, iter_264_4 in pairs(arg_261_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_264_4 then
						iter_264_4.color = Color.New(var_264_12, var_264_12, var_264_12)
					end
				end

				arg_261_1.var_.actorSpriteComps1061 = nil
			end

			local var_264_13 = 0
			local var_264_14 = 0.2

			if var_264_13 < arg_261_1.time_ and arg_261_1.time_ <= var_264_13 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_15 = arg_261_1:FormatText(StoryNameCfg[612].name)

				arg_261_1.leftNameTxt_.text = var_264_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_16 = arg_261_1:GetWordFromCfg(410241064)
				local var_264_17 = arg_261_1:FormatText(var_264_16.content)

				arg_261_1.text_.text = var_264_17

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_18 = 8
				local var_264_19 = utf8.len(var_264_17)
				local var_264_20 = var_264_18 <= 0 and var_264_14 or var_264_14 * (var_264_19 / var_264_18)

				if var_264_20 > 0 and var_264_14 < var_264_20 then
					arg_261_1.talkMaxDuration = var_264_20

					if var_264_20 + var_264_13 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_20 + var_264_13
					end
				end

				arg_261_1.text_.text = var_264_17
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241064", "story_v_out_410241.awb") ~= 0 then
					local var_264_21 = manager.audio:GetVoiceLength("story_v_out_410241", "410241064", "story_v_out_410241.awb") / 1000

					if var_264_21 + var_264_13 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_21 + var_264_13
					end

					if var_264_16.prefab_name ~= "" and arg_261_1.actors_[var_264_16.prefab_name] ~= nil then
						local var_264_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_16.prefab_name].transform, "story_v_out_410241", "410241064", "story_v_out_410241.awb")

						arg_261_1:RecordAudio("410241064", var_264_22)
						arg_261_1:RecordAudio("410241064", var_264_22)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_410241", "410241064", "story_v_out_410241.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_410241", "410241064", "story_v_out_410241.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_23 = math.max(var_264_14, arg_261_1.talkMaxDuration)

			if var_264_13 <= arg_261_1.time_ and arg_261_1.time_ < var_264_13 + var_264_23 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_13) / var_264_23

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_13 + var_264_23 and arg_261_1.time_ < var_264_13 + var_264_23 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play410241065 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 410241065
		arg_265_1.duration_ = 5.633

		local var_265_0 = {
			ja = 5.633,
			CriLanguages = 5.4,
			zh = 5.4
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
				arg_265_0:Play410241066(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["1061"].transform
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 then
				arg_265_1.var_.moveOldPos1061 = var_268_0.localPosition
				var_268_0.localScale = Vector3.New(1, 1, 1)

				arg_265_1:CheckSpriteTmpPos("1061", 3)

				local var_268_2 = var_268_0.childCount

				for iter_268_0 = 0, var_268_2 - 1 do
					local var_268_3 = var_268_0:GetChild(iter_268_0)

					if var_268_3.name == "" or not string.find(var_268_3.name, "split") then
						var_268_3.gameObject:SetActive(true)
					else
						var_268_3.gameObject:SetActive(false)
					end
				end
			end

			local var_268_4 = 0.001

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_4 then
				local var_268_5 = (arg_265_1.time_ - var_268_1) / var_268_4
				local var_268_6 = Vector3.New(0, -490, 18)

				var_268_0.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos1061, var_268_6, var_268_5)
			end

			if arg_265_1.time_ >= var_268_1 + var_268_4 and arg_265_1.time_ < var_268_1 + var_268_4 + arg_268_0 then
				var_268_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_268_7 = arg_265_1.actors_["1061"]
			local var_268_8 = 0

			if var_268_8 < arg_265_1.time_ and arg_265_1.time_ <= var_268_8 + arg_268_0 and arg_265_1.var_.actorSpriteComps1061 == nil then
				arg_265_1.var_.actorSpriteComps1061 = var_268_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_268_9 = 0.034

			if var_268_8 <= arg_265_1.time_ and arg_265_1.time_ < var_268_8 + var_268_9 then
				local var_268_10 = (arg_265_1.time_ - var_268_8) / var_268_9

				if arg_265_1.var_.actorSpriteComps1061 then
					for iter_268_1, iter_268_2 in pairs(arg_265_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_268_2 then
							local var_268_11 = Mathf.Lerp(iter_268_2.color.r, 1, var_268_10)

							iter_268_2.color = Color.New(var_268_11, var_268_11, var_268_11)
						end
					end
				end
			end

			if arg_265_1.time_ >= var_268_8 + var_268_9 and arg_265_1.time_ < var_268_8 + var_268_9 + arg_268_0 and arg_265_1.var_.actorSpriteComps1061 then
				local var_268_12 = 1

				for iter_268_3, iter_268_4 in pairs(arg_265_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_268_4 then
						iter_268_4.color = Color.New(var_268_12, var_268_12, var_268_12)
					end
				end

				arg_265_1.var_.actorSpriteComps1061 = nil
			end

			local var_268_13 = 0
			local var_268_14 = 0.55

			if var_268_13 < arg_265_1.time_ and arg_265_1.time_ <= var_268_13 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_15 = arg_265_1:FormatText(StoryNameCfg[612].name)

				arg_265_1.leftNameTxt_.text = var_268_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_16 = arg_265_1:GetWordFromCfg(410241065)
				local var_268_17 = arg_265_1:FormatText(var_268_16.content)

				arg_265_1.text_.text = var_268_17

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_18 = 22
				local var_268_19 = utf8.len(var_268_17)
				local var_268_20 = var_268_18 <= 0 and var_268_14 or var_268_14 * (var_268_19 / var_268_18)

				if var_268_20 > 0 and var_268_14 < var_268_20 then
					arg_265_1.talkMaxDuration = var_268_20

					if var_268_20 + var_268_13 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_20 + var_268_13
					end
				end

				arg_265_1.text_.text = var_268_17
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241065", "story_v_out_410241.awb") ~= 0 then
					local var_268_21 = manager.audio:GetVoiceLength("story_v_out_410241", "410241065", "story_v_out_410241.awb") / 1000

					if var_268_21 + var_268_13 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_21 + var_268_13
					end

					if var_268_16.prefab_name ~= "" and arg_265_1.actors_[var_268_16.prefab_name] ~= nil then
						local var_268_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_16.prefab_name].transform, "story_v_out_410241", "410241065", "story_v_out_410241.awb")

						arg_265_1:RecordAudio("410241065", var_268_22)
						arg_265_1:RecordAudio("410241065", var_268_22)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_410241", "410241065", "story_v_out_410241.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_410241", "410241065", "story_v_out_410241.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_23 = math.max(var_268_14, arg_265_1.talkMaxDuration)

			if var_268_13 <= arg_265_1.time_ and arg_265_1.time_ < var_268_13 + var_268_23 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_13) / var_268_23

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_13 + var_268_23 and arg_265_1.time_ < var_268_13 + var_268_23 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play410241066 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 410241066
		arg_269_1.duration_ = 5

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play410241067(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["1061"].transform
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 then
				arg_269_1.var_.moveOldPos1061 = var_272_0.localPosition
				var_272_0.localScale = Vector3.New(1, 1, 1)

				arg_269_1:CheckSpriteTmpPos("1061", 7)

				local var_272_2 = var_272_0.childCount

				for iter_272_0 = 0, var_272_2 - 1 do
					local var_272_3 = var_272_0:GetChild(iter_272_0)

					if var_272_3.name == "" or not string.find(var_272_3.name, "split") then
						var_272_3.gameObject:SetActive(true)
					else
						var_272_3.gameObject:SetActive(false)
					end
				end
			end

			local var_272_4 = 0.001

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_4 then
				local var_272_5 = (arg_269_1.time_ - var_272_1) / var_272_4
				local var_272_6 = Vector3.New(0, -2000, 18)

				var_272_0.localPosition = Vector3.Lerp(arg_269_1.var_.moveOldPos1061, var_272_6, var_272_5)
			end

			if arg_269_1.time_ >= var_272_1 + var_272_4 and arg_269_1.time_ < var_272_1 + var_272_4 + arg_272_0 then
				var_272_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_272_7 = arg_269_1.actors_["1061"]
			local var_272_8 = 0

			if var_272_8 < arg_269_1.time_ and arg_269_1.time_ <= var_272_8 + arg_272_0 and arg_269_1.var_.actorSpriteComps1061 == nil then
				arg_269_1.var_.actorSpriteComps1061 = var_272_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_272_9 = 0.034

			if var_272_8 <= arg_269_1.time_ and arg_269_1.time_ < var_272_8 + var_272_9 then
				local var_272_10 = (arg_269_1.time_ - var_272_8) / var_272_9

				if arg_269_1.var_.actorSpriteComps1061 then
					for iter_272_1, iter_272_2 in pairs(arg_269_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_272_2 then
							local var_272_11 = Mathf.Lerp(iter_272_2.color.r, 0.5, var_272_10)

							iter_272_2.color = Color.New(var_272_11, var_272_11, var_272_11)
						end
					end
				end
			end

			if arg_269_1.time_ >= var_272_8 + var_272_9 and arg_269_1.time_ < var_272_8 + var_272_9 + arg_272_0 and arg_269_1.var_.actorSpriteComps1061 then
				local var_272_12 = 0.5

				for iter_272_3, iter_272_4 in pairs(arg_269_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_272_4 then
						iter_272_4.color = Color.New(var_272_12, var_272_12, var_272_12)
					end
				end

				arg_269_1.var_.actorSpriteComps1061 = nil
			end

			local var_272_13 = 0
			local var_272_14 = 0.825

			if var_272_13 < arg_269_1.time_ and arg_269_1.time_ <= var_272_13 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, false)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_15 = arg_269_1:GetWordFromCfg(410241066)
				local var_272_16 = arg_269_1:FormatText(var_272_15.content)

				arg_269_1.text_.text = var_272_16

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_17 = 33
				local var_272_18 = utf8.len(var_272_16)
				local var_272_19 = var_272_17 <= 0 and var_272_14 or var_272_14 * (var_272_18 / var_272_17)

				if var_272_19 > 0 and var_272_14 < var_272_19 then
					arg_269_1.talkMaxDuration = var_272_19

					if var_272_19 + var_272_13 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_19 + var_272_13
					end
				end

				arg_269_1.text_.text = var_272_16
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)
				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_20 = math.max(var_272_14, arg_269_1.talkMaxDuration)

			if var_272_13 <= arg_269_1.time_ and arg_269_1.time_ < var_272_13 + var_272_20 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_13) / var_272_20

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_13 + var_272_20 and arg_269_1.time_ < var_272_13 + var_272_20 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play410241067 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 410241067
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play410241068(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = manager.ui.mainCamera.transform
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 then
				arg_273_1.var_.shakeOldPos = var_276_0.localPosition
			end

			local var_276_2 = 1

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / 0.066
				local var_276_4, var_276_5 = math.modf(var_276_3)

				var_276_0.localPosition = Vector3.New(var_276_5 * 0.13, var_276_5 * 0.13, var_276_5 * 0.13) + arg_273_1.var_.shakeOldPos
			end

			if arg_273_1.time_ >= var_276_1 + var_276_2 and arg_273_1.time_ < var_276_1 + var_276_2 + arg_276_0 then
				var_276_0.localPosition = arg_273_1.var_.shakeOldPos
			end

			local var_276_6 = 0

			if var_276_6 < arg_273_1.time_ and arg_273_1.time_ <= var_276_6 + arg_276_0 then
				arg_273_1.allBtn_.enabled = false
			end

			local var_276_7 = 1

			if arg_273_1.time_ >= var_276_6 + var_276_7 and arg_273_1.time_ < var_276_6 + var_276_7 + arg_276_0 then
				arg_273_1.allBtn_.enabled = true
			end

			local var_276_8 = 0
			local var_276_9 = 1.175

			if var_276_8 < arg_273_1.time_ and arg_273_1.time_ <= var_276_8 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, false)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_10 = arg_273_1:GetWordFromCfg(410241067)
				local var_276_11 = arg_273_1:FormatText(var_276_10.content)

				arg_273_1.text_.text = var_276_11

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_12 = 47
				local var_276_13 = utf8.len(var_276_11)
				local var_276_14 = var_276_12 <= 0 and var_276_9 or var_276_9 * (var_276_13 / var_276_12)

				if var_276_14 > 0 and var_276_9 < var_276_14 then
					arg_273_1.talkMaxDuration = var_276_14

					if var_276_14 + var_276_8 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_14 + var_276_8
					end
				end

				arg_273_1.text_.text = var_276_11
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)
				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_15 = math.max(var_276_9, arg_273_1.talkMaxDuration)

			if var_276_8 <= arg_273_1.time_ and arg_273_1.time_ < var_276_8 + var_276_15 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_8) / var_276_15

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_8 + var_276_15 and arg_273_1.time_ < var_276_8 + var_276_15 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play410241068 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 410241068
		arg_277_1.duration_ = 5.8

		local var_277_0 = {
			ja = 5.8,
			CriLanguages = 3.733,
			zh = 3.733
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
				arg_277_0:Play410241069(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = "10062"

			if arg_277_1.actors_[var_280_0] == nil then
				local var_280_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_280_0), arg_277_1.canvasGo_.transform)

				var_280_1.transform:SetSiblingIndex(1)

				var_280_1.name = var_280_0
				var_280_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_277_1.actors_[var_280_0] = var_280_1
			end

			local var_280_2 = arg_277_1.actors_["10062"].transform
			local var_280_3 = 0

			if var_280_3 < arg_277_1.time_ and arg_277_1.time_ <= var_280_3 + arg_280_0 then
				arg_277_1.var_.moveOldPos10062 = var_280_2.localPosition
				var_280_2.localScale = Vector3.New(1, 1, 1)

				arg_277_1:CheckSpriteTmpPos("10062", 3)

				local var_280_4 = var_280_2.childCount

				for iter_280_0 = 0, var_280_4 - 1 do
					local var_280_5 = var_280_2:GetChild(iter_280_0)

					if var_280_5.name == "split_5" or not string.find(var_280_5.name, "split") then
						var_280_5.gameObject:SetActive(true)
					else
						var_280_5.gameObject:SetActive(false)
					end
				end
			end

			local var_280_6 = 0.001

			if var_280_3 <= arg_277_1.time_ and arg_277_1.time_ < var_280_3 + var_280_6 then
				local var_280_7 = (arg_277_1.time_ - var_280_3) / var_280_6
				local var_280_8 = Vector3.New(0, -390, -290)

				var_280_2.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos10062, var_280_8, var_280_7)
			end

			if arg_277_1.time_ >= var_280_3 + var_280_6 and arg_277_1.time_ < var_280_3 + var_280_6 + arg_280_0 then
				var_280_2.localPosition = Vector3.New(0, -390, -290)
			end

			local var_280_9 = arg_277_1.actors_["10062"]
			local var_280_10 = 0

			if var_280_10 < arg_277_1.time_ and arg_277_1.time_ <= var_280_10 + arg_280_0 and arg_277_1.var_.actorSpriteComps10062 == nil then
				arg_277_1.var_.actorSpriteComps10062 = var_280_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_280_11 = 0.034

			if var_280_10 <= arg_277_1.time_ and arg_277_1.time_ < var_280_10 + var_280_11 then
				local var_280_12 = (arg_277_1.time_ - var_280_10) / var_280_11

				if arg_277_1.var_.actorSpriteComps10062 then
					for iter_280_1, iter_280_2 in pairs(arg_277_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_280_2 then
							local var_280_13 = Mathf.Lerp(iter_280_2.color.r, 1, var_280_12)

							iter_280_2.color = Color.New(var_280_13, var_280_13, var_280_13)
						end
					end
				end
			end

			if arg_277_1.time_ >= var_280_10 + var_280_11 and arg_277_1.time_ < var_280_10 + var_280_11 + arg_280_0 and arg_277_1.var_.actorSpriteComps10062 then
				local var_280_14 = 1

				for iter_280_3, iter_280_4 in pairs(arg_277_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_280_4 then
						iter_280_4.color = Color.New(var_280_14, var_280_14, var_280_14)
					end
				end

				arg_277_1.var_.actorSpriteComps10062 = nil
			end

			local var_280_15 = 0
			local var_280_16 = 0.275

			if var_280_15 < arg_277_1.time_ and arg_277_1.time_ <= var_280_15 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_17 = arg_277_1:FormatText(StoryNameCfg[600].name)

				arg_277_1.leftNameTxt_.text = var_280_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_18 = arg_277_1:GetWordFromCfg(410241068)
				local var_280_19 = arg_277_1:FormatText(var_280_18.content)

				arg_277_1.text_.text = var_280_19

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_20 = 11
				local var_280_21 = utf8.len(var_280_19)
				local var_280_22 = var_280_20 <= 0 and var_280_16 or var_280_16 * (var_280_21 / var_280_20)

				if var_280_22 > 0 and var_280_16 < var_280_22 then
					arg_277_1.talkMaxDuration = var_280_22

					if var_280_22 + var_280_15 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_22 + var_280_15
					end
				end

				arg_277_1.text_.text = var_280_19
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241068", "story_v_out_410241.awb") ~= 0 then
					local var_280_23 = manager.audio:GetVoiceLength("story_v_out_410241", "410241068", "story_v_out_410241.awb") / 1000

					if var_280_23 + var_280_15 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_23 + var_280_15
					end

					if var_280_18.prefab_name ~= "" and arg_277_1.actors_[var_280_18.prefab_name] ~= nil then
						local var_280_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_18.prefab_name].transform, "story_v_out_410241", "410241068", "story_v_out_410241.awb")

						arg_277_1:RecordAudio("410241068", var_280_24)
						arg_277_1:RecordAudio("410241068", var_280_24)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_410241", "410241068", "story_v_out_410241.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_410241", "410241068", "story_v_out_410241.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_25 = math.max(var_280_16, arg_277_1.talkMaxDuration)

			if var_280_15 <= arg_277_1.time_ and arg_277_1.time_ < var_280_15 + var_280_25 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_15) / var_280_25

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_15 + var_280_25 and arg_277_1.time_ < var_280_15 + var_280_25 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play410241069 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 410241069
		arg_281_1.duration_ = 9.033

		local var_281_0 = {
			ja = 9.033,
			CriLanguages = 2.033,
			zh = 2.033
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
				arg_281_0:Play410241070(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["10062"].transform
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 then
				arg_281_1.var_.moveOldPos10062 = var_284_0.localPosition
				var_284_0.localScale = Vector3.New(1, 1, 1)

				arg_281_1:CheckSpriteTmpPos("10062", 7)

				local var_284_2 = var_284_0.childCount

				for iter_284_0 = 0, var_284_2 - 1 do
					local var_284_3 = var_284_0:GetChild(iter_284_0)

					if var_284_3.name == "" or not string.find(var_284_3.name, "split") then
						var_284_3.gameObject:SetActive(true)
					else
						var_284_3.gameObject:SetActive(false)
					end
				end
			end

			local var_284_4 = 0.001

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_4 then
				local var_284_5 = (arg_281_1.time_ - var_284_1) / var_284_4
				local var_284_6 = Vector3.New(0, -2000, -290)

				var_284_0.localPosition = Vector3.Lerp(arg_281_1.var_.moveOldPos10062, var_284_6, var_284_5)
			end

			if arg_281_1.time_ >= var_284_1 + var_284_4 and arg_281_1.time_ < var_284_1 + var_284_4 + arg_284_0 then
				var_284_0.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_284_7 = arg_281_1.actors_["1061"].transform
			local var_284_8 = 0

			if var_284_8 < arg_281_1.time_ and arg_281_1.time_ <= var_284_8 + arg_284_0 then
				arg_281_1.var_.moveOldPos1061 = var_284_7.localPosition
				var_284_7.localScale = Vector3.New(1, 1, 1)

				arg_281_1:CheckSpriteTmpPos("1061", 3)

				local var_284_9 = var_284_7.childCount

				for iter_284_1 = 0, var_284_9 - 1 do
					local var_284_10 = var_284_7:GetChild(iter_284_1)

					if var_284_10.name == "split_2" or not string.find(var_284_10.name, "split") then
						var_284_10.gameObject:SetActive(true)
					else
						var_284_10.gameObject:SetActive(false)
					end
				end
			end

			local var_284_11 = 0.001

			if var_284_8 <= arg_281_1.time_ and arg_281_1.time_ < var_284_8 + var_284_11 then
				local var_284_12 = (arg_281_1.time_ - var_284_8) / var_284_11
				local var_284_13 = Vector3.New(0, -490, 18)

				var_284_7.localPosition = Vector3.Lerp(arg_281_1.var_.moveOldPos1061, var_284_13, var_284_12)
			end

			if arg_281_1.time_ >= var_284_8 + var_284_11 and arg_281_1.time_ < var_284_8 + var_284_11 + arg_284_0 then
				var_284_7.localPosition = Vector3.New(0, -490, 18)
			end

			local var_284_14 = arg_281_1.actors_["10062"]
			local var_284_15 = 0

			if var_284_15 < arg_281_1.time_ and arg_281_1.time_ <= var_284_15 + arg_284_0 and arg_281_1.var_.actorSpriteComps10062 == nil then
				arg_281_1.var_.actorSpriteComps10062 = var_284_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_284_16 = 0.034

			if var_284_15 <= arg_281_1.time_ and arg_281_1.time_ < var_284_15 + var_284_16 then
				local var_284_17 = (arg_281_1.time_ - var_284_15) / var_284_16

				if arg_281_1.var_.actorSpriteComps10062 then
					for iter_284_2, iter_284_3 in pairs(arg_281_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_284_3 then
							local var_284_18 = Mathf.Lerp(iter_284_3.color.r, 0.5, var_284_17)

							iter_284_3.color = Color.New(var_284_18, var_284_18, var_284_18)
						end
					end
				end
			end

			if arg_281_1.time_ >= var_284_15 + var_284_16 and arg_281_1.time_ < var_284_15 + var_284_16 + arg_284_0 and arg_281_1.var_.actorSpriteComps10062 then
				local var_284_19 = 0.5

				for iter_284_4, iter_284_5 in pairs(arg_281_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_284_5 then
						iter_284_5.color = Color.New(var_284_19, var_284_19, var_284_19)
					end
				end

				arg_281_1.var_.actorSpriteComps10062 = nil
			end

			local var_284_20 = arg_281_1.actors_["1061"]
			local var_284_21 = 0

			if var_284_21 < arg_281_1.time_ and arg_281_1.time_ <= var_284_21 + arg_284_0 and arg_281_1.var_.actorSpriteComps1061 == nil then
				arg_281_1.var_.actorSpriteComps1061 = var_284_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_284_22 = 0.034

			if var_284_21 <= arg_281_1.time_ and arg_281_1.time_ < var_284_21 + var_284_22 then
				local var_284_23 = (arg_281_1.time_ - var_284_21) / var_284_22

				if arg_281_1.var_.actorSpriteComps1061 then
					for iter_284_6, iter_284_7 in pairs(arg_281_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_284_7 then
							local var_284_24 = Mathf.Lerp(iter_284_7.color.r, 1, var_284_23)

							iter_284_7.color = Color.New(var_284_24, var_284_24, var_284_24)
						end
					end
				end
			end

			if arg_281_1.time_ >= var_284_21 + var_284_22 and arg_281_1.time_ < var_284_21 + var_284_22 + arg_284_0 and arg_281_1.var_.actorSpriteComps1061 then
				local var_284_25 = 1

				for iter_284_8, iter_284_9 in pairs(arg_281_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_284_9 then
						iter_284_9.color = Color.New(var_284_25, var_284_25, var_284_25)
					end
				end

				arg_281_1.var_.actorSpriteComps1061 = nil
			end

			local var_284_26 = 0
			local var_284_27 = 0.225

			if var_284_26 < arg_281_1.time_ and arg_281_1.time_ <= var_284_26 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_28 = arg_281_1:FormatText(StoryNameCfg[612].name)

				arg_281_1.leftNameTxt_.text = var_284_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_29 = arg_281_1:GetWordFromCfg(410241069)
				local var_284_30 = arg_281_1:FormatText(var_284_29.content)

				arg_281_1.text_.text = var_284_30

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_31 = 9
				local var_284_32 = utf8.len(var_284_30)
				local var_284_33 = var_284_31 <= 0 and var_284_27 or var_284_27 * (var_284_32 / var_284_31)

				if var_284_33 > 0 and var_284_27 < var_284_33 then
					arg_281_1.talkMaxDuration = var_284_33

					if var_284_33 + var_284_26 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_33 + var_284_26
					end
				end

				arg_281_1.text_.text = var_284_30
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241069", "story_v_out_410241.awb") ~= 0 then
					local var_284_34 = manager.audio:GetVoiceLength("story_v_out_410241", "410241069", "story_v_out_410241.awb") / 1000

					if var_284_34 + var_284_26 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_34 + var_284_26
					end

					if var_284_29.prefab_name ~= "" and arg_281_1.actors_[var_284_29.prefab_name] ~= nil then
						local var_284_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_29.prefab_name].transform, "story_v_out_410241", "410241069", "story_v_out_410241.awb")

						arg_281_1:RecordAudio("410241069", var_284_35)
						arg_281_1:RecordAudio("410241069", var_284_35)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_410241", "410241069", "story_v_out_410241.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_410241", "410241069", "story_v_out_410241.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_36 = math.max(var_284_27, arg_281_1.talkMaxDuration)

			if var_284_26 <= arg_281_1.time_ and arg_281_1.time_ < var_284_26 + var_284_36 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_26) / var_284_36

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_26 + var_284_36 and arg_281_1.time_ < var_284_26 + var_284_36 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play410241070 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 410241070
		arg_285_1.duration_ = 8.2

		local var_285_0 = {
			ja = 8.2,
			CriLanguages = 4.533,
			zh = 4.533
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
				arg_285_0:Play410241071(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["10062"].transform
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 then
				arg_285_1.var_.moveOldPos10062 = var_288_0.localPosition
				var_288_0.localScale = Vector3.New(1, 1, 1)

				arg_285_1:CheckSpriteTmpPos("10062", 3)

				local var_288_2 = var_288_0.childCount

				for iter_288_0 = 0, var_288_2 - 1 do
					local var_288_3 = var_288_0:GetChild(iter_288_0)

					if var_288_3.name == "split_5" or not string.find(var_288_3.name, "split") then
						var_288_3.gameObject:SetActive(true)
					else
						var_288_3.gameObject:SetActive(false)
					end
				end
			end

			local var_288_4 = 0.001

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_4 then
				local var_288_5 = (arg_285_1.time_ - var_288_1) / var_288_4
				local var_288_6 = Vector3.New(0, -390, -290)

				var_288_0.localPosition = Vector3.Lerp(arg_285_1.var_.moveOldPos10062, var_288_6, var_288_5)
			end

			if arg_285_1.time_ >= var_288_1 + var_288_4 and arg_285_1.time_ < var_288_1 + var_288_4 + arg_288_0 then
				var_288_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_288_7 = arg_285_1.actors_["1061"].transform
			local var_288_8 = 0

			if var_288_8 < arg_285_1.time_ and arg_285_1.time_ <= var_288_8 + arg_288_0 then
				arg_285_1.var_.moveOldPos1061 = var_288_7.localPosition
				var_288_7.localScale = Vector3.New(1, 1, 1)

				arg_285_1:CheckSpriteTmpPos("1061", 7)

				local var_288_9 = var_288_7.childCount

				for iter_288_1 = 0, var_288_9 - 1 do
					local var_288_10 = var_288_7:GetChild(iter_288_1)

					if var_288_10.name == "" or not string.find(var_288_10.name, "split") then
						var_288_10.gameObject:SetActive(true)
					else
						var_288_10.gameObject:SetActive(false)
					end
				end
			end

			local var_288_11 = 0.001

			if var_288_8 <= arg_285_1.time_ and arg_285_1.time_ < var_288_8 + var_288_11 then
				local var_288_12 = (arg_285_1.time_ - var_288_8) / var_288_11
				local var_288_13 = Vector3.New(0, -2000, 18)

				var_288_7.localPosition = Vector3.Lerp(arg_285_1.var_.moveOldPos1061, var_288_13, var_288_12)
			end

			if arg_285_1.time_ >= var_288_8 + var_288_11 and arg_285_1.time_ < var_288_8 + var_288_11 + arg_288_0 then
				var_288_7.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_288_14 = arg_285_1.actors_["10062"]
			local var_288_15 = 0

			if var_288_15 < arg_285_1.time_ and arg_285_1.time_ <= var_288_15 + arg_288_0 and arg_285_1.var_.actorSpriteComps10062 == nil then
				arg_285_1.var_.actorSpriteComps10062 = var_288_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_288_16 = 0.034

			if var_288_15 <= arg_285_1.time_ and arg_285_1.time_ < var_288_15 + var_288_16 then
				local var_288_17 = (arg_285_1.time_ - var_288_15) / var_288_16

				if arg_285_1.var_.actorSpriteComps10062 then
					for iter_288_2, iter_288_3 in pairs(arg_285_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_288_3 then
							local var_288_18 = Mathf.Lerp(iter_288_3.color.r, 1, var_288_17)

							iter_288_3.color = Color.New(var_288_18, var_288_18, var_288_18)
						end
					end
				end
			end

			if arg_285_1.time_ >= var_288_15 + var_288_16 and arg_285_1.time_ < var_288_15 + var_288_16 + arg_288_0 and arg_285_1.var_.actorSpriteComps10062 then
				local var_288_19 = 1

				for iter_288_4, iter_288_5 in pairs(arg_285_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_288_5 then
						iter_288_5.color = Color.New(var_288_19, var_288_19, var_288_19)
					end
				end

				arg_285_1.var_.actorSpriteComps10062 = nil
			end

			local var_288_20 = arg_285_1.actors_["1061"]
			local var_288_21 = 0

			if var_288_21 < arg_285_1.time_ and arg_285_1.time_ <= var_288_21 + arg_288_0 and arg_285_1.var_.actorSpriteComps1061 == nil then
				arg_285_1.var_.actorSpriteComps1061 = var_288_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_288_22 = 0.034

			if var_288_21 <= arg_285_1.time_ and arg_285_1.time_ < var_288_21 + var_288_22 then
				local var_288_23 = (arg_285_1.time_ - var_288_21) / var_288_22

				if arg_285_1.var_.actorSpriteComps1061 then
					for iter_288_6, iter_288_7 in pairs(arg_285_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_288_7 then
							local var_288_24 = Mathf.Lerp(iter_288_7.color.r, 0.5, var_288_23)

							iter_288_7.color = Color.New(var_288_24, var_288_24, var_288_24)
						end
					end
				end
			end

			if arg_285_1.time_ >= var_288_21 + var_288_22 and arg_285_1.time_ < var_288_21 + var_288_22 + arg_288_0 and arg_285_1.var_.actorSpriteComps1061 then
				local var_288_25 = 0.5

				for iter_288_8, iter_288_9 in pairs(arg_285_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_288_9 then
						iter_288_9.color = Color.New(var_288_25, var_288_25, var_288_25)
					end
				end

				arg_285_1.var_.actorSpriteComps1061 = nil
			end

			local var_288_26 = 0
			local var_288_27 = 0.425

			if var_288_26 < arg_285_1.time_ and arg_285_1.time_ <= var_288_26 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_28 = arg_285_1:FormatText(StoryNameCfg[600].name)

				arg_285_1.leftNameTxt_.text = var_288_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_29 = arg_285_1:GetWordFromCfg(410241070)
				local var_288_30 = arg_285_1:FormatText(var_288_29.content)

				arg_285_1.text_.text = var_288_30

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_31 = 17
				local var_288_32 = utf8.len(var_288_30)
				local var_288_33 = var_288_31 <= 0 and var_288_27 or var_288_27 * (var_288_32 / var_288_31)

				if var_288_33 > 0 and var_288_27 < var_288_33 then
					arg_285_1.talkMaxDuration = var_288_33

					if var_288_33 + var_288_26 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_33 + var_288_26
					end
				end

				arg_285_1.text_.text = var_288_30
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241070", "story_v_out_410241.awb") ~= 0 then
					local var_288_34 = manager.audio:GetVoiceLength("story_v_out_410241", "410241070", "story_v_out_410241.awb") / 1000

					if var_288_34 + var_288_26 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_34 + var_288_26
					end

					if var_288_29.prefab_name ~= "" and arg_285_1.actors_[var_288_29.prefab_name] ~= nil then
						local var_288_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_29.prefab_name].transform, "story_v_out_410241", "410241070", "story_v_out_410241.awb")

						arg_285_1:RecordAudio("410241070", var_288_35)
						arg_285_1:RecordAudio("410241070", var_288_35)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_410241", "410241070", "story_v_out_410241.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_410241", "410241070", "story_v_out_410241.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_36 = math.max(var_288_27, arg_285_1.talkMaxDuration)

			if var_288_26 <= arg_285_1.time_ and arg_285_1.time_ < var_288_26 + var_288_36 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_26) / var_288_36

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_26 + var_288_36 and arg_285_1.time_ < var_288_26 + var_288_36 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play410241071 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 410241071
		arg_289_1.duration_ = 11.1

		local var_289_0 = {
			ja = 11.1,
			CriLanguages = 4.5,
			zh = 4.5
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
				arg_289_0:Play410241072(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = arg_289_1.actors_["10062"].transform
			local var_292_1 = 0

			if var_292_1 < arg_289_1.time_ and arg_289_1.time_ <= var_292_1 + arg_292_0 then
				arg_289_1.var_.moveOldPos10062 = var_292_0.localPosition
				var_292_0.localScale = Vector3.New(1, 1, 1)

				arg_289_1:CheckSpriteTmpPos("10062", 3)

				local var_292_2 = var_292_0.childCount

				for iter_292_0 = 0, var_292_2 - 1 do
					local var_292_3 = var_292_0:GetChild(iter_292_0)

					if var_292_3.name == "split_2" or not string.find(var_292_3.name, "split") then
						var_292_3.gameObject:SetActive(true)
					else
						var_292_3.gameObject:SetActive(false)
					end
				end
			end

			local var_292_4 = 0.001

			if var_292_1 <= arg_289_1.time_ and arg_289_1.time_ < var_292_1 + var_292_4 then
				local var_292_5 = (arg_289_1.time_ - var_292_1) / var_292_4
				local var_292_6 = Vector3.New(0, -390, -290)

				var_292_0.localPosition = Vector3.Lerp(arg_289_1.var_.moveOldPos10062, var_292_6, var_292_5)
			end

			if arg_289_1.time_ >= var_292_1 + var_292_4 and arg_289_1.time_ < var_292_1 + var_292_4 + arg_292_0 then
				var_292_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_292_7 = arg_289_1.actors_["10062"]
			local var_292_8 = 0

			if var_292_8 < arg_289_1.time_ and arg_289_1.time_ <= var_292_8 + arg_292_0 and arg_289_1.var_.actorSpriteComps10062 == nil then
				arg_289_1.var_.actorSpriteComps10062 = var_292_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_292_9 = 0.034

			if var_292_8 <= arg_289_1.time_ and arg_289_1.time_ < var_292_8 + var_292_9 then
				local var_292_10 = (arg_289_1.time_ - var_292_8) / var_292_9

				if arg_289_1.var_.actorSpriteComps10062 then
					for iter_292_1, iter_292_2 in pairs(arg_289_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_292_2 then
							local var_292_11 = Mathf.Lerp(iter_292_2.color.r, 1, var_292_10)

							iter_292_2.color = Color.New(var_292_11, var_292_11, var_292_11)
						end
					end
				end
			end

			if arg_289_1.time_ >= var_292_8 + var_292_9 and arg_289_1.time_ < var_292_8 + var_292_9 + arg_292_0 and arg_289_1.var_.actorSpriteComps10062 then
				local var_292_12 = 1

				for iter_292_3, iter_292_4 in pairs(arg_289_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_292_4 then
						iter_292_4.color = Color.New(var_292_12, var_292_12, var_292_12)
					end
				end

				arg_289_1.var_.actorSpriteComps10062 = nil
			end

			local var_292_13 = 0
			local var_292_14 = 0.5

			if var_292_13 < arg_289_1.time_ and arg_289_1.time_ <= var_292_13 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_15 = arg_289_1:FormatText(StoryNameCfg[600].name)

				arg_289_1.leftNameTxt_.text = var_292_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_16 = arg_289_1:GetWordFromCfg(410241071)
				local var_292_17 = arg_289_1:FormatText(var_292_16.content)

				arg_289_1.text_.text = var_292_17

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_18 = 20
				local var_292_19 = utf8.len(var_292_17)
				local var_292_20 = var_292_18 <= 0 and var_292_14 or var_292_14 * (var_292_19 / var_292_18)

				if var_292_20 > 0 and var_292_14 < var_292_20 then
					arg_289_1.talkMaxDuration = var_292_20

					if var_292_20 + var_292_13 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_20 + var_292_13
					end
				end

				arg_289_1.text_.text = var_292_17
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410241", "410241071", "story_v_out_410241.awb") ~= 0 then
					local var_292_21 = manager.audio:GetVoiceLength("story_v_out_410241", "410241071", "story_v_out_410241.awb") / 1000

					if var_292_21 + var_292_13 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_21 + var_292_13
					end

					if var_292_16.prefab_name ~= "" and arg_289_1.actors_[var_292_16.prefab_name] ~= nil then
						local var_292_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_16.prefab_name].transform, "story_v_out_410241", "410241071", "story_v_out_410241.awb")

						arg_289_1:RecordAudio("410241071", var_292_22)
						arg_289_1:RecordAudio("410241071", var_292_22)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_410241", "410241071", "story_v_out_410241.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_410241", "410241071", "story_v_out_410241.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_23 = math.max(var_292_14, arg_289_1.talkMaxDuration)

			if var_292_13 <= arg_289_1.time_ and arg_289_1.time_ < var_292_13 + var_292_23 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_13) / var_292_23

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_13 + var_292_23 and arg_289_1.time_ < var_292_13 + var_292_23 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play410241072 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 410241072
		arg_293_1.duration_ = 5

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
			arg_293_1.auto_ = false
		end

		function arg_293_1.playNext_(arg_295_0)
			arg_293_1.onStoryFinished_()
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["10062"]
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 and arg_293_1.var_.actorSpriteComps10062 == nil then
				arg_293_1.var_.actorSpriteComps10062 = var_296_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_296_2 = 0.034

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_2 then
				local var_296_3 = (arg_293_1.time_ - var_296_1) / var_296_2

				if arg_293_1.var_.actorSpriteComps10062 then
					for iter_296_0, iter_296_1 in pairs(arg_293_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_296_1 then
							local var_296_4 = Mathf.Lerp(iter_296_1.color.r, 0.5, var_296_3)

							iter_296_1.color = Color.New(var_296_4, var_296_4, var_296_4)
						end
					end
				end
			end

			if arg_293_1.time_ >= var_296_1 + var_296_2 and arg_293_1.time_ < var_296_1 + var_296_2 + arg_296_0 and arg_293_1.var_.actorSpriteComps10062 then
				local var_296_5 = 0.5

				for iter_296_2, iter_296_3 in pairs(arg_293_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_296_3 then
						iter_296_3.color = Color.New(var_296_5, var_296_5, var_296_5)
					end
				end

				arg_293_1.var_.actorSpriteComps10062 = nil
			end

			local var_296_6 = 0
			local var_296_7 = 1.125

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

				local var_296_8 = arg_293_1:GetWordFromCfg(410241072)
				local var_296_9 = arg_293_1:FormatText(var_296_8.content)

				arg_293_1.text_.text = var_296_9

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_10 = 45
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
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST67",
		"Assets/UIResources/UI_AB/TextureConfig/Background/LZ0206",
		"Assets/UIResources/UI_AB/TextureConfig/Background/L04h"
	},
	voices = {
		"story_v_out_410241.awb"
	}
}
