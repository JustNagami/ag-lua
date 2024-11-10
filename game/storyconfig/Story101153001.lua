return {
	Play115301001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 115301001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play115301002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "F01"

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
				local var_4_5 = arg_1_1.bgs_.F01

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
					if iter_4_0 ~= "F01" then
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

			local var_4_22 = 0
			local var_4_23 = 0.266666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 2
			local var_4_27 = 0.6

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")
			end

			local var_4_30 = 0

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_31 = 3

			if arg_1_1.time_ >= var_4_30 + var_4_31 and arg_1_1.time_ < var_4_30 + var_4_31 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_32 = 2
			local var_4_33 = 1.3

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0
				arg_1_1.dialogCg_.alpha = 1

				arg_1_1.dialog_:SetActive(true)
				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_34 = arg_1_1:GetWordFromCfg(115301001)
				local var_4_35 = arg_1_1:FormatText(var_4_34.content)

				arg_1_1.text_.text = var_4_35

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_36 = 52
				local var_4_37 = utf8.len(var_4_35)
				local var_4_38 = var_4_36 <= 0 and var_4_33 or var_4_33 * (var_4_37 / var_4_36)

				if var_4_38 > 0 and var_4_33 < var_4_38 then
					arg_1_1.talkMaxDuration = var_4_38

					if var_4_38 + var_4_32 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_38 + var_4_32
					end
				end

				arg_1_1.text_.text = var_4_35
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_39 = math.max(var_4_33, arg_1_1.talkMaxDuration)

			if var_4_32 <= arg_1_1.time_ and arg_1_1.time_ < var_4_32 + var_4_39 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_32) / var_4_39

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_32 + var_4_39 and arg_1_1.time_ < var_4_32 + var_4_39 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play115301002 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 115301002
		arg_5_1.duration_ = 5

		SetActive(arg_5_1.tipsGo_, false)

		function arg_5_1.onSingleLineFinish_()
			arg_5_1.onSingleLineUpdate_ = nil
			arg_5_1.onSingleLineFinish_ = nil
			arg_5_1.state_ = "waiting"
		end

		function arg_5_1.playNext_(arg_7_0)
			if arg_7_0 == 1 then
				arg_5_0:Play115301003(arg_5_1)
			end
		end

		function arg_5_1.onSingleLineUpdate_(arg_8_0)
			local var_8_0 = 0
			local var_8_1 = 1

			if var_8_0 < arg_5_1.time_ and arg_5_1.time_ <= var_8_0 + arg_8_0 then
				local var_8_2 = "play"
				local var_8_3 = "music"

				arg_5_1:AudioAction(var_8_2, var_8_3, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")
			end

			local var_8_4 = 0
			local var_8_5 = 1.325

			if var_8_4 < arg_5_1.time_ and arg_5_1.time_ <= var_8_4 + arg_8_0 then
				arg_5_1.talkMaxDuration = 0
				arg_5_1.dialogCg_.alpha = 1

				arg_5_1.dialog_:SetActive(true)
				SetActive(arg_5_1.leftNameGo_, false)

				arg_5_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_5_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_5_1:RecordName(arg_5_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_5_1.iconTrs_.gameObject, false)
				arg_5_1.callingController_:SetSelectedState("normal")

				local var_8_6 = arg_5_1:GetWordFromCfg(115301002)
				local var_8_7 = arg_5_1:FormatText(var_8_6.content)

				arg_5_1.text_.text = var_8_7

				LuaForUtil.ClearLinePrefixSymbol(arg_5_1.text_)

				local var_8_8 = 53
				local var_8_9 = utf8.len(var_8_7)
				local var_8_10 = var_8_8 <= 0 and var_8_5 or var_8_5 * (var_8_9 / var_8_8)

				if var_8_10 > 0 and var_8_5 < var_8_10 then
					arg_5_1.talkMaxDuration = var_8_10

					if var_8_10 + var_8_4 > arg_5_1.duration_ then
						arg_5_1.duration_ = var_8_10 + var_8_4
					end
				end

				arg_5_1.text_.text = var_8_7
				arg_5_1.typewritter.percent = 0

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(false)
				arg_5_1:RecordContent(arg_5_1.text_.text)
			end

			local var_8_11 = math.max(var_8_5, arg_5_1.talkMaxDuration)

			if var_8_4 <= arg_5_1.time_ and arg_5_1.time_ < var_8_4 + var_8_11 then
				arg_5_1.typewritter.percent = (arg_5_1.time_ - var_8_4) / var_8_11

				arg_5_1.typewritter:SetDirty()
			end

			if arg_5_1.time_ >= var_8_4 + var_8_11 and arg_5_1.time_ < var_8_4 + var_8_11 + arg_8_0 then
				arg_5_1.typewritter.percent = 1

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(true)
			end
		end
	end,
	Play115301003 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 115301003
		arg_9_1.duration_ = 5.6

		local var_9_0 = {
			ja = 2.1,
			ko = 3.933,
			zh = 5.6,
			en = 3.833
		}
		local var_9_1 = manager.audio:GetLocalizationFlag()

		if var_9_0[var_9_1] ~= nil then
			arg_9_1.duration_ = var_9_0[var_9_1]
		end

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play115301004(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = "1038"

			if arg_9_1.actors_[var_12_0] == nil then
				local var_12_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_12_0), arg_9_1.canvasGo_.transform)

				var_12_1.transform:SetSiblingIndex(1)

				var_12_1.name = var_12_0
				var_12_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_9_1.actors_[var_12_0] = var_12_1
			end

			local var_12_2 = arg_9_1.actors_["1038"].transform
			local var_12_3 = 0

			if var_12_3 < arg_9_1.time_ and arg_9_1.time_ <= var_12_3 + arg_12_0 then
				arg_9_1.var_.moveOldPos1038 = var_12_2.localPosition
				var_12_2.localScale = Vector3.New(1, 1, 1)

				arg_9_1:CheckSpriteTmpPos("1038", 2)

				local var_12_4 = var_12_2.childCount

				for iter_12_0 = 0, var_12_4 - 1 do
					local var_12_5 = var_12_2:GetChild(iter_12_0)

					if var_12_5.name == "split_1" or not string.find(var_12_5.name, "split") then
						var_12_5.gameObject:SetActive(true)
					else
						var_12_5.gameObject:SetActive(false)
					end
				end
			end

			local var_12_6 = 0.001

			if var_12_3 <= arg_9_1.time_ and arg_9_1.time_ < var_12_3 + var_12_6 then
				local var_12_7 = (arg_9_1.time_ - var_12_3) / var_12_6
				local var_12_8 = Vector3.New(-390, -400, 0)

				var_12_2.localPosition = Vector3.Lerp(arg_9_1.var_.moveOldPos1038, var_12_8, var_12_7)
			end

			if arg_9_1.time_ >= var_12_3 + var_12_6 and arg_9_1.time_ < var_12_3 + var_12_6 + arg_12_0 then
				var_12_2.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_12_9 = arg_9_1.actors_["1038"]
			local var_12_10 = 0

			if var_12_10 < arg_9_1.time_ and arg_9_1.time_ <= var_12_10 + arg_12_0 then
				local var_12_11 = var_12_9:GetComponentInChildren(typeof(CanvasGroup))

				if var_12_11 then
					arg_9_1.var_.alphaOldValue1038 = var_12_11.alpha
					arg_9_1.var_.characterEffect1038 = var_12_11
				end

				arg_9_1.var_.alphaOldValue1038 = 0
			end

			local var_12_12 = 0.333333333333333

			if var_12_10 <= arg_9_1.time_ and arg_9_1.time_ < var_12_10 + var_12_12 then
				local var_12_13 = (arg_9_1.time_ - var_12_10) / var_12_12
				local var_12_14 = Mathf.Lerp(arg_9_1.var_.alphaOldValue1038, 1, var_12_13)

				if arg_9_1.var_.characterEffect1038 then
					arg_9_1.var_.characterEffect1038.alpha = var_12_14
				end
			end

			if arg_9_1.time_ >= var_12_10 + var_12_12 and arg_9_1.time_ < var_12_10 + var_12_12 + arg_12_0 and arg_9_1.var_.characterEffect1038 then
				arg_9_1.var_.characterEffect1038.alpha = 1
			end

			local var_12_15 = 0
			local var_12_16 = 0.4

			if var_12_15 < arg_9_1.time_ and arg_9_1.time_ <= var_12_15 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0
				arg_9_1.dialogCg_.alpha = 1

				arg_9_1.dialog_:SetActive(true)
				SetActive(arg_9_1.leftNameGo_, true)

				local var_12_17 = arg_9_1:FormatText(StoryNameCfg[94].name)

				arg_9_1.leftNameTxt_.text = var_12_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_1.leftNameTxt_.transform)

				arg_9_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_9_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_9_1:RecordName(arg_9_1.leftNameTxt_.text)
				SetActive(arg_9_1.iconTrs_.gameObject, false)
				arg_9_1.callingController_:SetSelectedState("normal")

				local var_12_18 = arg_9_1:GetWordFromCfg(115301003)
				local var_12_19 = arg_9_1:FormatText(var_12_18.content)

				arg_9_1.text_.text = var_12_19

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_20 = 16
				local var_12_21 = utf8.len(var_12_19)
				local var_12_22 = var_12_20 <= 0 and var_12_16 or var_12_16 * (var_12_21 / var_12_20)

				if var_12_22 > 0 and var_12_16 < var_12_22 then
					arg_9_1.talkMaxDuration = var_12_22

					if var_12_22 + var_12_15 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_22 + var_12_15
					end
				end

				arg_9_1.text_.text = var_12_19
				arg_9_1.typewritter.percent = 0

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301003", "story_v_out_115301.awb") ~= 0 then
					local var_12_23 = manager.audio:GetVoiceLength("story_v_out_115301", "115301003", "story_v_out_115301.awb") / 1000

					if var_12_23 + var_12_15 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_23 + var_12_15
					end

					if var_12_18.prefab_name ~= "" and arg_9_1.actors_[var_12_18.prefab_name] ~= nil then
						local var_12_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_9_1.actors_[var_12_18.prefab_name].transform, "story_v_out_115301", "115301003", "story_v_out_115301.awb")

						arg_9_1:RecordAudio("115301003", var_12_24)
						arg_9_1:RecordAudio("115301003", var_12_24)
					else
						arg_9_1:AudioAction("play", "voice", "story_v_out_115301", "115301003", "story_v_out_115301.awb")
					end

					arg_9_1:RecordHistoryTalkVoice("story_v_out_115301", "115301003", "story_v_out_115301.awb")
				end

				arg_9_1:RecordContent(arg_9_1.text_.text)
			end

			local var_12_25 = math.max(var_12_16, arg_9_1.talkMaxDuration)

			if var_12_15 <= arg_9_1.time_ and arg_9_1.time_ < var_12_15 + var_12_25 then
				arg_9_1.typewritter.percent = (arg_9_1.time_ - var_12_15) / var_12_25

				arg_9_1.typewritter:SetDirty()
			end

			if arg_9_1.time_ >= var_12_15 + var_12_25 and arg_9_1.time_ < var_12_15 + var_12_25 + arg_12_0 then
				arg_9_1.typewritter.percent = 1

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(true)
			end
		end
	end,
	Play115301004 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 115301004
		arg_13_1.duration_ = 3.433

		local var_13_0 = {
			ja = 3.433,
			ko = 1.966,
			zh = 2.233,
			en = 2.266
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
				arg_13_0:Play115301005(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = "10030"

			if arg_13_1.actors_[var_16_0] == nil then
				local var_16_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_16_0), arg_13_1.canvasGo_.transform)

				var_16_1.transform:SetSiblingIndex(1)

				var_16_1.name = var_16_0
				var_16_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_13_1.actors_[var_16_0] = var_16_1
			end

			local var_16_2 = arg_13_1.actors_["10030"].transform
			local var_16_3 = 0

			if var_16_3 < arg_13_1.time_ and arg_13_1.time_ <= var_16_3 + arg_16_0 then
				arg_13_1.var_.moveOldPos10030 = var_16_2.localPosition
				var_16_2.localScale = Vector3.New(1, 1, 1)

				arg_13_1:CheckSpriteTmpPos("10030", 4)

				local var_16_4 = var_16_2.childCount

				for iter_16_0 = 0, var_16_4 - 1 do
					local var_16_5 = var_16_2:GetChild(iter_16_0)

					if var_16_5.name == "split_1" or not string.find(var_16_5.name, "split") then
						var_16_5.gameObject:SetActive(true)
					else
						var_16_5.gameObject:SetActive(false)
					end
				end
			end

			local var_16_6 = 0.001

			if var_16_3 <= arg_13_1.time_ and arg_13_1.time_ < var_16_3 + var_16_6 then
				local var_16_7 = (arg_13_1.time_ - var_16_3) / var_16_6
				local var_16_8 = Vector3.New(390, -390, 150)

				var_16_2.localPosition = Vector3.Lerp(arg_13_1.var_.moveOldPos10030, var_16_8, var_16_7)
			end

			if arg_13_1.time_ >= var_16_3 + var_16_6 and arg_13_1.time_ < var_16_3 + var_16_6 + arg_16_0 then
				var_16_2.localPosition = Vector3.New(390, -390, 150)
			end

			local var_16_9 = arg_13_1.actors_["1038"]
			local var_16_10 = 0

			if var_16_10 < arg_13_1.time_ and arg_13_1.time_ <= var_16_10 + arg_16_0 and arg_13_1.var_.actorSpriteComps1038 == nil then
				arg_13_1.var_.actorSpriteComps1038 = var_16_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_16_11 = 0.2

			if var_16_10 <= arg_13_1.time_ and arg_13_1.time_ < var_16_10 + var_16_11 then
				local var_16_12 = (arg_13_1.time_ - var_16_10) / var_16_11

				if arg_13_1.var_.actorSpriteComps1038 then
					for iter_16_1, iter_16_2 in pairs(arg_13_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_16_2 then
							local var_16_13 = Mathf.Lerp(iter_16_2.color.r, 0.5, var_16_12)

							iter_16_2.color = Color.New(var_16_13, var_16_13, var_16_13)
						end
					end
				end
			end

			if arg_13_1.time_ >= var_16_10 + var_16_11 and arg_13_1.time_ < var_16_10 + var_16_11 + arg_16_0 and arg_13_1.var_.actorSpriteComps1038 then
				local var_16_14 = 0.5

				for iter_16_3, iter_16_4 in pairs(arg_13_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_16_4 then
						iter_16_4.color = Color.New(var_16_14, var_16_14, var_16_14)
					end
				end

				arg_13_1.var_.actorSpriteComps1038 = nil
			end

			local var_16_15 = arg_13_1.actors_["10030"]
			local var_16_16 = 0

			if var_16_16 < arg_13_1.time_ and arg_13_1.time_ <= var_16_16 + arg_16_0 then
				local var_16_17 = var_16_15:GetComponentInChildren(typeof(CanvasGroup))

				if var_16_17 then
					arg_13_1.var_.alphaOldValue10030 = var_16_17.alpha
					arg_13_1.var_.characterEffect10030 = var_16_17
				end

				arg_13_1.var_.alphaOldValue10030 = 0
			end

			local var_16_18 = 0.333333333333333

			if var_16_16 <= arg_13_1.time_ and arg_13_1.time_ < var_16_16 + var_16_18 then
				local var_16_19 = (arg_13_1.time_ - var_16_16) / var_16_18
				local var_16_20 = Mathf.Lerp(arg_13_1.var_.alphaOldValue10030, 1, var_16_19)

				if arg_13_1.var_.characterEffect10030 then
					arg_13_1.var_.characterEffect10030.alpha = var_16_20
				end
			end

			if arg_13_1.time_ >= var_16_16 + var_16_18 and arg_13_1.time_ < var_16_16 + var_16_18 + arg_16_0 and arg_13_1.var_.characterEffect10030 then
				arg_13_1.var_.characterEffect10030.alpha = 1
			end

			local var_16_21 = 0
			local var_16_22 = 0.15

			if var_16_21 < arg_13_1.time_ and arg_13_1.time_ <= var_16_21 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, true)

				local var_16_23 = arg_13_1:FormatText(StoryNameCfg[309].name)

				arg_13_1.leftNameTxt_.text = var_16_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_13_1.leftNameTxt_.transform)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1.leftNameTxt_.text)
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_24 = arg_13_1:GetWordFromCfg(115301004)
				local var_16_25 = arg_13_1:FormatText(var_16_24.content)

				arg_13_1.text_.text = var_16_25

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_26 = 6
				local var_16_27 = utf8.len(var_16_25)
				local var_16_28 = var_16_26 <= 0 and var_16_22 or var_16_22 * (var_16_27 / var_16_26)

				if var_16_28 > 0 and var_16_22 < var_16_28 then
					arg_13_1.talkMaxDuration = var_16_28

					if var_16_28 + var_16_21 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_28 + var_16_21
					end
				end

				arg_13_1.text_.text = var_16_25
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301004", "story_v_out_115301.awb") ~= 0 then
					local var_16_29 = manager.audio:GetVoiceLength("story_v_out_115301", "115301004", "story_v_out_115301.awb") / 1000

					if var_16_29 + var_16_21 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_29 + var_16_21
					end

					if var_16_24.prefab_name ~= "" and arg_13_1.actors_[var_16_24.prefab_name] ~= nil then
						local var_16_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_13_1.actors_[var_16_24.prefab_name].transform, "story_v_out_115301", "115301004", "story_v_out_115301.awb")

						arg_13_1:RecordAudio("115301004", var_16_30)
						arg_13_1:RecordAudio("115301004", var_16_30)
					else
						arg_13_1:AudioAction("play", "voice", "story_v_out_115301", "115301004", "story_v_out_115301.awb")
					end

					arg_13_1:RecordHistoryTalkVoice("story_v_out_115301", "115301004", "story_v_out_115301.awb")
				end

				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_31 = math.max(var_16_22, arg_13_1.talkMaxDuration)

			if var_16_21 <= arg_13_1.time_ and arg_13_1.time_ < var_16_21 + var_16_31 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_21) / var_16_31

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_21 + var_16_31 and arg_13_1.time_ < var_16_21 + var_16_31 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play115301005 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 115301005
		arg_17_1.duration_ = 5

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play115301006(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = arg_17_1.actors_["10030"]
			local var_20_1 = 0

			if var_20_1 < arg_17_1.time_ and arg_17_1.time_ <= var_20_1 + arg_20_0 then
				local var_20_2 = var_20_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_20_2 then
					arg_17_1.var_.alphaOldValue10030 = var_20_2.alpha
					arg_17_1.var_.characterEffect10030 = var_20_2
				end

				arg_17_1.var_.alphaOldValue10030 = 1
			end

			local var_20_3 = 0.333333333333333

			if var_20_1 <= arg_17_1.time_ and arg_17_1.time_ < var_20_1 + var_20_3 then
				local var_20_4 = (arg_17_1.time_ - var_20_1) / var_20_3
				local var_20_5 = Mathf.Lerp(arg_17_1.var_.alphaOldValue10030, 0, var_20_4)

				if arg_17_1.var_.characterEffect10030 then
					arg_17_1.var_.characterEffect10030.alpha = var_20_5
				end
			end

			if arg_17_1.time_ >= var_20_1 + var_20_3 and arg_17_1.time_ < var_20_1 + var_20_3 + arg_20_0 and arg_17_1.var_.characterEffect10030 then
				arg_17_1.var_.characterEffect10030.alpha = 0
			end

			local var_20_6 = arg_17_1.actors_["1038"]
			local var_20_7 = 0

			if var_20_7 < arg_17_1.time_ and arg_17_1.time_ <= var_20_7 + arg_20_0 then
				local var_20_8 = var_20_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_20_8 then
					arg_17_1.var_.alphaOldValue1038 = var_20_8.alpha
					arg_17_1.var_.characterEffect1038 = var_20_8
				end

				arg_17_1.var_.alphaOldValue1038 = 1
			end

			local var_20_9 = 0.333333333333333

			if var_20_7 <= arg_17_1.time_ and arg_17_1.time_ < var_20_7 + var_20_9 then
				local var_20_10 = (arg_17_1.time_ - var_20_7) / var_20_9
				local var_20_11 = Mathf.Lerp(arg_17_1.var_.alphaOldValue1038, 0, var_20_10)

				if arg_17_1.var_.characterEffect1038 then
					arg_17_1.var_.characterEffect1038.alpha = var_20_11
				end
			end

			if arg_17_1.time_ >= var_20_7 + var_20_9 and arg_17_1.time_ < var_20_7 + var_20_9 + arg_20_0 and arg_17_1.var_.characterEffect1038 then
				arg_17_1.var_.characterEffect1038.alpha = 0
			end

			local var_20_12 = 0
			local var_20_13 = 0.5

			if var_20_12 < arg_17_1.time_ and arg_17_1.time_ <= var_20_12 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, false)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_14 = arg_17_1:GetWordFromCfg(115301005)
				local var_20_15 = arg_17_1:FormatText(var_20_14.content)

				arg_17_1.text_.text = var_20_15

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_16 = 20
				local var_20_17 = utf8.len(var_20_15)
				local var_20_18 = var_20_16 <= 0 and var_20_13 or var_20_13 * (var_20_17 / var_20_16)

				if var_20_18 > 0 and var_20_13 < var_20_18 then
					arg_17_1.talkMaxDuration = var_20_18

					if var_20_18 + var_20_12 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_18 + var_20_12
					end
				end

				arg_17_1.text_.text = var_20_15
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)
				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_19 = math.max(var_20_13, arg_17_1.talkMaxDuration)

			if var_20_12 <= arg_17_1.time_ and arg_17_1.time_ < var_20_12 + var_20_19 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_12) / var_20_19

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_12 + var_20_19 and arg_17_1.time_ < var_20_12 + var_20_19 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play115301006 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 115301006
		arg_21_1.duration_ = 5.766

		local var_21_0 = {
			ja = 3.233,
			ko = 4.566,
			zh = 4.366,
			en = 5.766
		}
		local var_21_1 = manager.audio:GetLocalizationFlag()

		if var_21_0[var_21_1] ~= nil then
			arg_21_1.duration_ = var_21_0[var_21_1]
		end

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play115301007(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = arg_21_1.actors_["10030"].transform
			local var_24_1 = 0

			if var_24_1 < arg_21_1.time_ and arg_21_1.time_ <= var_24_1 + arg_24_0 then
				arg_21_1.var_.moveOldPos10030 = var_24_0.localPosition
				var_24_0.localScale = Vector3.New(1, 1, 1)

				arg_21_1:CheckSpriteTmpPos("10030", 3)

				local var_24_2 = var_24_0.childCount

				for iter_24_0 = 0, var_24_2 - 1 do
					local var_24_3 = var_24_0:GetChild(iter_24_0)

					if var_24_3.name == "split_2" or not string.find(var_24_3.name, "split") then
						var_24_3.gameObject:SetActive(true)
					else
						var_24_3.gameObject:SetActive(false)
					end
				end
			end

			local var_24_4 = 0.001

			if var_24_1 <= arg_21_1.time_ and arg_21_1.time_ < var_24_1 + var_24_4 then
				local var_24_5 = (arg_21_1.time_ - var_24_1) / var_24_4
				local var_24_6 = Vector3.New(0, -390, 150)

				var_24_0.localPosition = Vector3.Lerp(arg_21_1.var_.moveOldPos10030, var_24_6, var_24_5)
			end

			if arg_21_1.time_ >= var_24_1 + var_24_4 and arg_21_1.time_ < var_24_1 + var_24_4 + arg_24_0 then
				var_24_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_24_7 = arg_21_1.actors_["10030"]
			local var_24_8 = 0

			if var_24_8 < arg_21_1.time_ and arg_21_1.time_ <= var_24_8 + arg_24_0 then
				local var_24_9 = var_24_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_24_9 then
					arg_21_1.var_.alphaOldValue10030 = var_24_9.alpha
					arg_21_1.var_.characterEffect10030 = var_24_9
				end

				arg_21_1.var_.alphaOldValue10030 = 0
			end

			local var_24_10 = 0.333333333333333

			if var_24_8 <= arg_21_1.time_ and arg_21_1.time_ < var_24_8 + var_24_10 then
				local var_24_11 = (arg_21_1.time_ - var_24_8) / var_24_10
				local var_24_12 = Mathf.Lerp(arg_21_1.var_.alphaOldValue10030, 1, var_24_11)

				if arg_21_1.var_.characterEffect10030 then
					arg_21_1.var_.characterEffect10030.alpha = var_24_12
				end
			end

			if arg_21_1.time_ >= var_24_8 + var_24_10 and arg_21_1.time_ < var_24_8 + var_24_10 + arg_24_0 and arg_21_1.var_.characterEffect10030 then
				arg_21_1.var_.characterEffect10030.alpha = 1
			end

			local var_24_13 = 0
			local var_24_14 = 0.25

			if var_24_13 < arg_21_1.time_ and arg_21_1.time_ <= var_24_13 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_15 = arg_21_1:FormatText(StoryNameCfg[309].name)

				arg_21_1.leftNameTxt_.text = var_24_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_16 = arg_21_1:GetWordFromCfg(115301006)
				local var_24_17 = arg_21_1:FormatText(var_24_16.content)

				arg_21_1.text_.text = var_24_17

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_18 = 10
				local var_24_19 = utf8.len(var_24_17)
				local var_24_20 = var_24_18 <= 0 and var_24_14 or var_24_14 * (var_24_19 / var_24_18)

				if var_24_20 > 0 and var_24_14 < var_24_20 then
					arg_21_1.talkMaxDuration = var_24_20

					if var_24_20 + var_24_13 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_20 + var_24_13
					end
				end

				arg_21_1.text_.text = var_24_17
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301006", "story_v_out_115301.awb") ~= 0 then
					local var_24_21 = manager.audio:GetVoiceLength("story_v_out_115301", "115301006", "story_v_out_115301.awb") / 1000

					if var_24_21 + var_24_13 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_21 + var_24_13
					end

					if var_24_16.prefab_name ~= "" and arg_21_1.actors_[var_24_16.prefab_name] ~= nil then
						local var_24_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_16.prefab_name].transform, "story_v_out_115301", "115301006", "story_v_out_115301.awb")

						arg_21_1:RecordAudio("115301006", var_24_22)
						arg_21_1:RecordAudio("115301006", var_24_22)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_out_115301", "115301006", "story_v_out_115301.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_out_115301", "115301006", "story_v_out_115301.awb")
				end

				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_23 = math.max(var_24_14, arg_21_1.talkMaxDuration)

			if var_24_13 <= arg_21_1.time_ and arg_21_1.time_ < var_24_13 + var_24_23 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_13) / var_24_23

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_13 + var_24_23 and arg_21_1.time_ < var_24_13 + var_24_23 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play115301007 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 115301007
		arg_25_1.duration_ = 5

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play115301008(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["10030"]
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 then
				local var_28_2 = var_28_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_28_2 then
					arg_25_1.var_.alphaOldValue10030 = var_28_2.alpha
					arg_25_1.var_.characterEffect10030 = var_28_2
				end

				arg_25_1.var_.alphaOldValue10030 = 1
			end

			local var_28_3 = 0.333333333333333

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_3 then
				local var_28_4 = (arg_25_1.time_ - var_28_1) / var_28_3
				local var_28_5 = Mathf.Lerp(arg_25_1.var_.alphaOldValue10030, 0, var_28_4)

				if arg_25_1.var_.characterEffect10030 then
					arg_25_1.var_.characterEffect10030.alpha = var_28_5
				end
			end

			if arg_25_1.time_ >= var_28_1 + var_28_3 and arg_25_1.time_ < var_28_1 + var_28_3 + arg_28_0 and arg_25_1.var_.characterEffect10030 then
				arg_25_1.var_.characterEffect10030.alpha = 0
			end

			local var_28_6 = 0
			local var_28_7 = 0.975

			if var_28_6 < arg_25_1.time_ and arg_25_1.time_ <= var_28_6 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, false)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_8 = arg_25_1:GetWordFromCfg(115301007)
				local var_28_9 = arg_25_1:FormatText(var_28_8.content)

				arg_25_1.text_.text = var_28_9

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_10 = 39
				local var_28_11 = utf8.len(var_28_9)
				local var_28_12 = var_28_10 <= 0 and var_28_7 or var_28_7 * (var_28_11 / var_28_10)

				if var_28_12 > 0 and var_28_7 < var_28_12 then
					arg_25_1.talkMaxDuration = var_28_12

					if var_28_12 + var_28_6 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_12 + var_28_6
					end
				end

				arg_25_1.text_.text = var_28_9
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)
				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_13 = math.max(var_28_7, arg_25_1.talkMaxDuration)

			if var_28_6 <= arg_25_1.time_ and arg_25_1.time_ < var_28_6 + var_28_13 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_6) / var_28_13

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_6 + var_28_13 and arg_25_1.time_ < var_28_6 + var_28_13 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play115301008 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 115301008
		arg_29_1.duration_ = 5.933

		local var_29_0 = {
			ja = 5.933,
			ko = 3.166,
			zh = 4.3,
			en = 5.6
		}
		local var_29_1 = manager.audio:GetLocalizationFlag()

		if var_29_0[var_29_1] ~= nil then
			arg_29_1.duration_ = var_29_0[var_29_1]
		end

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play115301009(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["10030"].transform
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 then
				arg_29_1.var_.moveOldPos10030 = var_32_0.localPosition
				var_32_0.localScale = Vector3.New(1, 1, 1)

				arg_29_1:CheckSpriteTmpPos("10030", 3)

				local var_32_2 = var_32_0.childCount

				for iter_32_0 = 0, var_32_2 - 1 do
					local var_32_3 = var_32_0:GetChild(iter_32_0)

					if var_32_3.name == "split_1" or not string.find(var_32_3.name, "split") then
						var_32_3.gameObject:SetActive(true)
					else
						var_32_3.gameObject:SetActive(false)
					end
				end
			end

			local var_32_4 = 0.001

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_4 then
				local var_32_5 = (arg_29_1.time_ - var_32_1) / var_32_4
				local var_32_6 = Vector3.New(0, -390, 150)

				var_32_0.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos10030, var_32_6, var_32_5)
			end

			if arg_29_1.time_ >= var_32_1 + var_32_4 and arg_29_1.time_ < var_32_1 + var_32_4 + arg_32_0 then
				var_32_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_32_7 = arg_29_1.actors_["10030"]
			local var_32_8 = 0

			if var_32_8 < arg_29_1.time_ and arg_29_1.time_ <= var_32_8 + arg_32_0 then
				local var_32_9 = var_32_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_32_9 then
					arg_29_1.var_.alphaOldValue10030 = var_32_9.alpha
					arg_29_1.var_.characterEffect10030 = var_32_9
				end

				arg_29_1.var_.alphaOldValue10030 = 0
			end

			local var_32_10 = 0.333333333333333

			if var_32_8 <= arg_29_1.time_ and arg_29_1.time_ < var_32_8 + var_32_10 then
				local var_32_11 = (arg_29_1.time_ - var_32_8) / var_32_10
				local var_32_12 = Mathf.Lerp(arg_29_1.var_.alphaOldValue10030, 1, var_32_11)

				if arg_29_1.var_.characterEffect10030 then
					arg_29_1.var_.characterEffect10030.alpha = var_32_12
				end
			end

			if arg_29_1.time_ >= var_32_8 + var_32_10 and arg_29_1.time_ < var_32_8 + var_32_10 + arg_32_0 and arg_29_1.var_.characterEffect10030 then
				arg_29_1.var_.characterEffect10030.alpha = 1
			end

			local var_32_13 = 0
			local var_32_14 = 0.35

			if var_32_13 < arg_29_1.time_ and arg_29_1.time_ <= var_32_13 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_15 = arg_29_1:FormatText(StoryNameCfg[309].name)

				arg_29_1.leftNameTxt_.text = var_32_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_16 = arg_29_1:GetWordFromCfg(115301008)
				local var_32_17 = arg_29_1:FormatText(var_32_16.content)

				arg_29_1.text_.text = var_32_17

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_18 = 14
				local var_32_19 = utf8.len(var_32_17)
				local var_32_20 = var_32_18 <= 0 and var_32_14 or var_32_14 * (var_32_19 / var_32_18)

				if var_32_20 > 0 and var_32_14 < var_32_20 then
					arg_29_1.talkMaxDuration = var_32_20

					if var_32_20 + var_32_13 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_20 + var_32_13
					end
				end

				arg_29_1.text_.text = var_32_17
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301008", "story_v_out_115301.awb") ~= 0 then
					local var_32_21 = manager.audio:GetVoiceLength("story_v_out_115301", "115301008", "story_v_out_115301.awb") / 1000

					if var_32_21 + var_32_13 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_21 + var_32_13
					end

					if var_32_16.prefab_name ~= "" and arg_29_1.actors_[var_32_16.prefab_name] ~= nil then
						local var_32_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_16.prefab_name].transform, "story_v_out_115301", "115301008", "story_v_out_115301.awb")

						arg_29_1:RecordAudio("115301008", var_32_22)
						arg_29_1:RecordAudio("115301008", var_32_22)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_115301", "115301008", "story_v_out_115301.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_115301", "115301008", "story_v_out_115301.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_23 = math.max(var_32_14, arg_29_1.talkMaxDuration)

			if var_32_13 <= arg_29_1.time_ and arg_29_1.time_ < var_32_13 + var_32_23 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_13) / var_32_23

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_13 + var_32_23 and arg_29_1.time_ < var_32_13 + var_32_23 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play115301009 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 115301009
		arg_33_1.duration_ = 5

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play115301010(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["10030"]
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 then
				local var_36_2 = var_36_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_36_2 then
					arg_33_1.var_.alphaOldValue10030 = var_36_2.alpha
					arg_33_1.var_.characterEffect10030 = var_36_2
				end

				arg_33_1.var_.alphaOldValue10030 = 1
			end

			local var_36_3 = 0.333333333333333

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_3 then
				local var_36_4 = (arg_33_1.time_ - var_36_1) / var_36_3
				local var_36_5 = Mathf.Lerp(arg_33_1.var_.alphaOldValue10030, 0, var_36_4)

				if arg_33_1.var_.characterEffect10030 then
					arg_33_1.var_.characterEffect10030.alpha = var_36_5
				end
			end

			if arg_33_1.time_ >= var_36_1 + var_36_3 and arg_33_1.time_ < var_36_1 + var_36_3 + arg_36_0 and arg_33_1.var_.characterEffect10030 then
				arg_33_1.var_.characterEffect10030.alpha = 0
			end

			local var_36_6 = 0
			local var_36_7 = 1.375

			if var_36_6 < arg_33_1.time_ and arg_33_1.time_ <= var_36_6 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, false)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_8 = arg_33_1:GetWordFromCfg(115301009)
				local var_36_9 = arg_33_1:FormatText(var_36_8.content)

				arg_33_1.text_.text = var_36_9

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_10 = 55
				local var_36_11 = utf8.len(var_36_9)
				local var_36_12 = var_36_10 <= 0 and var_36_7 or var_36_7 * (var_36_11 / var_36_10)

				if var_36_12 > 0 and var_36_7 < var_36_12 then
					arg_33_1.talkMaxDuration = var_36_12

					if var_36_12 + var_36_6 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_12 + var_36_6
					end
				end

				arg_33_1.text_.text = var_36_9
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)
				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_13 = math.max(var_36_7, arg_33_1.talkMaxDuration)

			if var_36_6 <= arg_33_1.time_ and arg_33_1.time_ < var_36_6 + var_36_13 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_6) / var_36_13

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_6 + var_36_13 and arg_33_1.time_ < var_36_6 + var_36_13 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play115301010 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 115301010
		arg_37_1.duration_ = 5.566

		local var_37_0 = {
			ja = 5.566,
			ko = 2.433,
			zh = 3.166,
			en = 1.766
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
				arg_37_0:Play115301011(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1038"].transform
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 then
				arg_37_1.var_.moveOldPos1038 = var_40_0.localPosition
				var_40_0.localScale = Vector3.New(1, 1, 1)

				arg_37_1:CheckSpriteTmpPos("1038", 3)

				local var_40_2 = var_40_0.childCount

				for iter_40_0 = 0, var_40_2 - 1 do
					local var_40_3 = var_40_0:GetChild(iter_40_0)

					if var_40_3.name == "split_1" or not string.find(var_40_3.name, "split") then
						var_40_3.gameObject:SetActive(true)
					else
						var_40_3.gameObject:SetActive(false)
					end
				end
			end

			local var_40_4 = 0.001

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_4 then
				local var_40_5 = (arg_37_1.time_ - var_40_1) / var_40_4
				local var_40_6 = Vector3.New(0, -400, 0)

				var_40_0.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1038, var_40_6, var_40_5)
			end

			if arg_37_1.time_ >= var_40_1 + var_40_4 and arg_37_1.time_ < var_40_1 + var_40_4 + arg_40_0 then
				var_40_0.localPosition = Vector3.New(0, -400, 0)
			end

			local var_40_7 = arg_37_1.actors_["1038"]
			local var_40_8 = 0

			if var_40_8 < arg_37_1.time_ and arg_37_1.time_ <= var_40_8 + arg_40_0 then
				local var_40_9 = var_40_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_40_9 then
					arg_37_1.var_.alphaOldValue1038 = var_40_9.alpha
					arg_37_1.var_.characterEffect1038 = var_40_9
				end

				arg_37_1.var_.alphaOldValue1038 = 0
			end

			local var_40_10 = 0.333333333333333

			if var_40_8 <= arg_37_1.time_ and arg_37_1.time_ < var_40_8 + var_40_10 then
				local var_40_11 = (arg_37_1.time_ - var_40_8) / var_40_10
				local var_40_12 = Mathf.Lerp(arg_37_1.var_.alphaOldValue1038, 1, var_40_11)

				if arg_37_1.var_.characterEffect1038 then
					arg_37_1.var_.characterEffect1038.alpha = var_40_12
				end
			end

			if arg_37_1.time_ >= var_40_8 + var_40_10 and arg_37_1.time_ < var_40_8 + var_40_10 + arg_40_0 and arg_37_1.var_.characterEffect1038 then
				arg_37_1.var_.characterEffect1038.alpha = 1
			end

			local var_40_13 = arg_37_1.actors_["1038"]
			local var_40_14 = 0

			if var_40_14 < arg_37_1.time_ and arg_37_1.time_ <= var_40_14 + arg_40_0 and arg_37_1.var_.actorSpriteComps1038 == nil then
				arg_37_1.var_.actorSpriteComps1038 = var_40_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_40_15 = 0.2

			if var_40_14 <= arg_37_1.time_ and arg_37_1.time_ < var_40_14 + var_40_15 then
				local var_40_16 = (arg_37_1.time_ - var_40_14) / var_40_15

				if arg_37_1.var_.actorSpriteComps1038 then
					for iter_40_1, iter_40_2 in pairs(arg_37_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_40_2 then
							local var_40_17 = Mathf.Lerp(iter_40_2.color.r, 1, var_40_16)

							iter_40_2.color = Color.New(var_40_17, var_40_17, var_40_17)
						end
					end
				end
			end

			if arg_37_1.time_ >= var_40_14 + var_40_15 and arg_37_1.time_ < var_40_14 + var_40_15 + arg_40_0 and arg_37_1.var_.actorSpriteComps1038 then
				local var_40_18 = 1

				for iter_40_3, iter_40_4 in pairs(arg_37_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_40_4 then
						iter_40_4.color = Color.New(var_40_18, var_40_18, var_40_18)
					end
				end

				arg_37_1.var_.actorSpriteComps1038 = nil
			end

			local var_40_19 = 0
			local var_40_20 = 0.2

			if var_40_19 < arg_37_1.time_ and arg_37_1.time_ <= var_40_19 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_21 = arg_37_1:FormatText(StoryNameCfg[94].name)

				arg_37_1.leftNameTxt_.text = var_40_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_22 = arg_37_1:GetWordFromCfg(115301010)
				local var_40_23 = arg_37_1:FormatText(var_40_22.content)

				arg_37_1.text_.text = var_40_23

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_24 = 8
				local var_40_25 = utf8.len(var_40_23)
				local var_40_26 = var_40_24 <= 0 and var_40_20 or var_40_20 * (var_40_25 / var_40_24)

				if var_40_26 > 0 and var_40_20 < var_40_26 then
					arg_37_1.talkMaxDuration = var_40_26

					if var_40_26 + var_40_19 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_26 + var_40_19
					end
				end

				arg_37_1.text_.text = var_40_23
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301010", "story_v_out_115301.awb") ~= 0 then
					local var_40_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301010", "story_v_out_115301.awb") / 1000

					if var_40_27 + var_40_19 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_27 + var_40_19
					end

					if var_40_22.prefab_name ~= "" and arg_37_1.actors_[var_40_22.prefab_name] ~= nil then
						local var_40_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_22.prefab_name].transform, "story_v_out_115301", "115301010", "story_v_out_115301.awb")

						arg_37_1:RecordAudio("115301010", var_40_28)
						arg_37_1:RecordAudio("115301010", var_40_28)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_115301", "115301010", "story_v_out_115301.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_115301", "115301010", "story_v_out_115301.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_29 = math.max(var_40_20, arg_37_1.talkMaxDuration)

			if var_40_19 <= arg_37_1.time_ and arg_37_1.time_ < var_40_19 + var_40_29 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_19) / var_40_29

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_19 + var_40_29 and arg_37_1.time_ < var_40_19 + var_40_29 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play115301011 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 115301011
		arg_41_1.duration_ = 5

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play115301012(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1038"]
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 then
				local var_44_2 = var_44_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_44_2 then
					arg_41_1.var_.alphaOldValue1038 = var_44_2.alpha
					arg_41_1.var_.characterEffect1038 = var_44_2
				end

				arg_41_1.var_.alphaOldValue1038 = 1
			end

			local var_44_3 = 0.333333333333333

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_3 then
				local var_44_4 = (arg_41_1.time_ - var_44_1) / var_44_3
				local var_44_5 = Mathf.Lerp(arg_41_1.var_.alphaOldValue1038, 0, var_44_4)

				if arg_41_1.var_.characterEffect1038 then
					arg_41_1.var_.characterEffect1038.alpha = var_44_5
				end
			end

			if arg_41_1.time_ >= var_44_1 + var_44_3 and arg_41_1.time_ < var_44_1 + var_44_3 + arg_44_0 and arg_41_1.var_.characterEffect1038 then
				arg_41_1.var_.characterEffect1038.alpha = 0
			end

			local var_44_6 = 0
			local var_44_7 = 1.35

			if var_44_6 < arg_41_1.time_ and arg_41_1.time_ <= var_44_6 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, false)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_8 = arg_41_1:GetWordFromCfg(115301011)
				local var_44_9 = arg_41_1:FormatText(var_44_8.content)

				arg_41_1.text_.text = var_44_9

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_10 = 53
				local var_44_11 = utf8.len(var_44_9)
				local var_44_12 = var_44_10 <= 0 and var_44_7 or var_44_7 * (var_44_11 / var_44_10)

				if var_44_12 > 0 and var_44_7 < var_44_12 then
					arg_41_1.talkMaxDuration = var_44_12

					if var_44_12 + var_44_6 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_12 + var_44_6
					end
				end

				arg_41_1.text_.text = var_44_9
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)
				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_13 = math.max(var_44_7, arg_41_1.talkMaxDuration)

			if var_44_6 <= arg_41_1.time_ and arg_41_1.time_ < var_44_6 + var_44_13 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_6) / var_44_13

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_6 + var_44_13 and arg_41_1.time_ < var_44_6 + var_44_13 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play115301012 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 115301012
		arg_45_1.duration_ = 4.466

		local var_45_0 = {
			ja = 4.4,
			ko = 3.1,
			zh = 4.466,
			en = 2.7
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
				arg_45_0:Play115301013(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["10030"].transform
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 then
				arg_45_1.var_.moveOldPos10030 = var_48_0.localPosition
				var_48_0.localScale = Vector3.New(1, 1, 1)

				arg_45_1:CheckSpriteTmpPos("10030", 4)

				local var_48_2 = var_48_0.childCount

				for iter_48_0 = 0, var_48_2 - 1 do
					local var_48_3 = var_48_0:GetChild(iter_48_0)

					if var_48_3.name == "split_3" or not string.find(var_48_3.name, "split") then
						var_48_3.gameObject:SetActive(true)
					else
						var_48_3.gameObject:SetActive(false)
					end
				end
			end

			local var_48_4 = 0.001

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_4 then
				local var_48_5 = (arg_45_1.time_ - var_48_1) / var_48_4
				local var_48_6 = Vector3.New(390, -390, 150)

				var_48_0.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos10030, var_48_6, var_48_5)
			end

			if arg_45_1.time_ >= var_48_1 + var_48_4 and arg_45_1.time_ < var_48_1 + var_48_4 + arg_48_0 then
				var_48_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_48_7 = arg_45_1.actors_["10030"]
			local var_48_8 = 0

			if var_48_8 < arg_45_1.time_ and arg_45_1.time_ <= var_48_8 + arg_48_0 then
				local var_48_9 = var_48_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_48_9 then
					arg_45_1.var_.alphaOldValue10030 = var_48_9.alpha
					arg_45_1.var_.characterEffect10030 = var_48_9
				end

				arg_45_1.var_.alphaOldValue10030 = 0
			end

			local var_48_10 = 0.333333333333333

			if var_48_8 <= arg_45_1.time_ and arg_45_1.time_ < var_48_8 + var_48_10 then
				local var_48_11 = (arg_45_1.time_ - var_48_8) / var_48_10
				local var_48_12 = Mathf.Lerp(arg_45_1.var_.alphaOldValue10030, 1, var_48_11)

				if arg_45_1.var_.characterEffect10030 then
					arg_45_1.var_.characterEffect10030.alpha = var_48_12
				end
			end

			if arg_45_1.time_ >= var_48_8 + var_48_10 and arg_45_1.time_ < var_48_8 + var_48_10 + arg_48_0 and arg_45_1.var_.characterEffect10030 then
				arg_45_1.var_.characterEffect10030.alpha = 1
			end

			local var_48_13 = arg_45_1.actors_["10030"]
			local var_48_14 = 0

			if var_48_14 < arg_45_1.time_ and arg_45_1.time_ <= var_48_14 + arg_48_0 and arg_45_1.var_.actorSpriteComps10030 == nil then
				arg_45_1.var_.actorSpriteComps10030 = var_48_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_48_15 = 0.2

			if var_48_14 <= arg_45_1.time_ and arg_45_1.time_ < var_48_14 + var_48_15 then
				local var_48_16 = (arg_45_1.time_ - var_48_14) / var_48_15

				if arg_45_1.var_.actorSpriteComps10030 then
					for iter_48_1, iter_48_2 in pairs(arg_45_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_48_2 then
							local var_48_17 = Mathf.Lerp(iter_48_2.color.r, 1, var_48_16)

							iter_48_2.color = Color.New(var_48_17, var_48_17, var_48_17)
						end
					end
				end
			end

			if arg_45_1.time_ >= var_48_14 + var_48_15 and arg_45_1.time_ < var_48_14 + var_48_15 + arg_48_0 and arg_45_1.var_.actorSpriteComps10030 then
				local var_48_18 = 1

				for iter_48_3, iter_48_4 in pairs(arg_45_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_48_4 then
						iter_48_4.color = Color.New(var_48_18, var_48_18, var_48_18)
					end
				end

				arg_45_1.var_.actorSpriteComps10030 = nil
			end

			local var_48_19 = 0
			local var_48_20 = 1

			if var_48_19 < arg_45_1.time_ and arg_45_1.time_ <= var_48_19 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_21 = arg_45_1:FormatText(StoryNameCfg[309].name)

				arg_45_1.leftNameTxt_.text = var_48_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_22 = arg_45_1:GetWordFromCfg(115301012)
				local var_48_23 = arg_45_1:FormatText(var_48_22.content)

				arg_45_1.text_.text = var_48_23

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_24 = 11
				local var_48_25 = utf8.len(var_48_23)
				local var_48_26 = var_48_24 <= 0 and var_48_20 or var_48_20 * (var_48_25 / var_48_24)

				if var_48_26 > 0 and var_48_20 < var_48_26 then
					arg_45_1.talkMaxDuration = var_48_26

					if var_48_26 + var_48_19 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_26 + var_48_19
					end
				end

				arg_45_1.text_.text = var_48_23
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301012", "story_v_out_115301.awb") ~= 0 then
					local var_48_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301012", "story_v_out_115301.awb") / 1000

					if var_48_27 + var_48_19 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_27 + var_48_19
					end

					if var_48_22.prefab_name ~= "" and arg_45_1.actors_[var_48_22.prefab_name] ~= nil then
						local var_48_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_22.prefab_name].transform, "story_v_out_115301", "115301012", "story_v_out_115301.awb")

						arg_45_1:RecordAudio("115301012", var_48_28)
						arg_45_1:RecordAudio("115301012", var_48_28)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_115301", "115301012", "story_v_out_115301.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_115301", "115301012", "story_v_out_115301.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_29 = math.max(var_48_20, arg_45_1.talkMaxDuration)

			if var_48_19 <= arg_45_1.time_ and arg_45_1.time_ < var_48_19 + var_48_29 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_19) / var_48_29

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_19 + var_48_29 and arg_45_1.time_ < var_48_19 + var_48_29 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play115301013 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 115301013
		arg_49_1.duration_ = 3.266

		local var_49_0 = {
			ja = 1.733,
			ko = 1.466,
			zh = 2.533,
			en = 3.266
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
				arg_49_0:Play115301014(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1038"].transform
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 then
				arg_49_1.var_.moveOldPos1038 = var_52_0.localPosition
				var_52_0.localScale = Vector3.New(1, 1, 1)

				arg_49_1:CheckSpriteTmpPos("1038", 2)

				local var_52_2 = var_52_0.childCount

				for iter_52_0 = 0, var_52_2 - 1 do
					local var_52_3 = var_52_0:GetChild(iter_52_0)

					if var_52_3.name == "split_1" or not string.find(var_52_3.name, "split") then
						var_52_3.gameObject:SetActive(true)
					else
						var_52_3.gameObject:SetActive(false)
					end
				end
			end

			local var_52_4 = 0.001

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_4 then
				local var_52_5 = (arg_49_1.time_ - var_52_1) / var_52_4
				local var_52_6 = Vector3.New(-390, -400, 0)

				var_52_0.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos1038, var_52_6, var_52_5)
			end

			if arg_49_1.time_ >= var_52_1 + var_52_4 and arg_49_1.time_ < var_52_1 + var_52_4 + arg_52_0 then
				var_52_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_52_7 = arg_49_1.actors_["10030"]
			local var_52_8 = 0

			if var_52_8 < arg_49_1.time_ and arg_49_1.time_ <= var_52_8 + arg_52_0 and arg_49_1.var_.actorSpriteComps10030 == nil then
				arg_49_1.var_.actorSpriteComps10030 = var_52_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_52_9 = 0.2

			if var_52_8 <= arg_49_1.time_ and arg_49_1.time_ < var_52_8 + var_52_9 then
				local var_52_10 = (arg_49_1.time_ - var_52_8) / var_52_9

				if arg_49_1.var_.actorSpriteComps10030 then
					for iter_52_1, iter_52_2 in pairs(arg_49_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_52_2 then
							local var_52_11 = Mathf.Lerp(iter_52_2.color.r, 0.5, var_52_10)

							iter_52_2.color = Color.New(var_52_11, var_52_11, var_52_11)
						end
					end
				end
			end

			if arg_49_1.time_ >= var_52_8 + var_52_9 and arg_49_1.time_ < var_52_8 + var_52_9 + arg_52_0 and arg_49_1.var_.actorSpriteComps10030 then
				local var_52_12 = 0.5

				for iter_52_3, iter_52_4 in pairs(arg_49_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_52_4 then
						iter_52_4.color = Color.New(var_52_12, var_52_12, var_52_12)
					end
				end

				arg_49_1.var_.actorSpriteComps10030 = nil
			end

			local var_52_13 = arg_49_1.actors_["1038"]
			local var_52_14 = 0

			if var_52_14 < arg_49_1.time_ and arg_49_1.time_ <= var_52_14 + arg_52_0 then
				local var_52_15 = var_52_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_52_15 then
					arg_49_1.var_.alphaOldValue1038 = var_52_15.alpha
					arg_49_1.var_.characterEffect1038 = var_52_15
				end

				arg_49_1.var_.alphaOldValue1038 = 0
			end

			local var_52_16 = 0.333333333333333

			if var_52_14 <= arg_49_1.time_ and arg_49_1.time_ < var_52_14 + var_52_16 then
				local var_52_17 = (arg_49_1.time_ - var_52_14) / var_52_16
				local var_52_18 = Mathf.Lerp(arg_49_1.var_.alphaOldValue1038, 1, var_52_17)

				if arg_49_1.var_.characterEffect1038 then
					arg_49_1.var_.characterEffect1038.alpha = var_52_18
				end
			end

			if arg_49_1.time_ >= var_52_14 + var_52_16 and arg_49_1.time_ < var_52_14 + var_52_16 + arg_52_0 and arg_49_1.var_.characterEffect1038 then
				arg_49_1.var_.characterEffect1038.alpha = 1
			end

			local var_52_19 = arg_49_1.actors_["1038"]
			local var_52_20 = 0

			if var_52_20 < arg_49_1.time_ and arg_49_1.time_ <= var_52_20 + arg_52_0 and arg_49_1.var_.actorSpriteComps1038 == nil then
				arg_49_1.var_.actorSpriteComps1038 = var_52_19:GetComponentsInChildren(typeof(Image), true)
			end

			local var_52_21 = 0.2

			if var_52_20 <= arg_49_1.time_ and arg_49_1.time_ < var_52_20 + var_52_21 then
				local var_52_22 = (arg_49_1.time_ - var_52_20) / var_52_21

				if arg_49_1.var_.actorSpriteComps1038 then
					for iter_52_5, iter_52_6 in pairs(arg_49_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_52_6 then
							local var_52_23 = Mathf.Lerp(iter_52_6.color.r, 1, var_52_22)

							iter_52_6.color = Color.New(var_52_23, var_52_23, var_52_23)
						end
					end
				end
			end

			if arg_49_1.time_ >= var_52_20 + var_52_21 and arg_49_1.time_ < var_52_20 + var_52_21 + arg_52_0 and arg_49_1.var_.actorSpriteComps1038 then
				local var_52_24 = 1

				for iter_52_7, iter_52_8 in pairs(arg_49_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_52_8 then
						iter_52_8.color = Color.New(var_52_24, var_52_24, var_52_24)
					end
				end

				arg_49_1.var_.actorSpriteComps1038 = nil
			end

			local var_52_25 = 0
			local var_52_26 = 0.15

			if var_52_25 < arg_49_1.time_ and arg_49_1.time_ <= var_52_25 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_27 = arg_49_1:FormatText(StoryNameCfg[94].name)

				arg_49_1.leftNameTxt_.text = var_52_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_28 = arg_49_1:GetWordFromCfg(115301013)
				local var_52_29 = arg_49_1:FormatText(var_52_28.content)

				arg_49_1.text_.text = var_52_29

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_30 = 6
				local var_52_31 = utf8.len(var_52_29)
				local var_52_32 = var_52_30 <= 0 and var_52_26 or var_52_26 * (var_52_31 / var_52_30)

				if var_52_32 > 0 and var_52_26 < var_52_32 then
					arg_49_1.talkMaxDuration = var_52_32

					if var_52_32 + var_52_25 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_32 + var_52_25
					end
				end

				arg_49_1.text_.text = var_52_29
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301013", "story_v_out_115301.awb") ~= 0 then
					local var_52_33 = manager.audio:GetVoiceLength("story_v_out_115301", "115301013", "story_v_out_115301.awb") / 1000

					if var_52_33 + var_52_25 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_33 + var_52_25
					end

					if var_52_28.prefab_name ~= "" and arg_49_1.actors_[var_52_28.prefab_name] ~= nil then
						local var_52_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_28.prefab_name].transform, "story_v_out_115301", "115301013", "story_v_out_115301.awb")

						arg_49_1:RecordAudio("115301013", var_52_34)
						arg_49_1:RecordAudio("115301013", var_52_34)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_115301", "115301013", "story_v_out_115301.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_115301", "115301013", "story_v_out_115301.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_35 = math.max(var_52_26, arg_49_1.talkMaxDuration)

			if var_52_25 <= arg_49_1.time_ and arg_49_1.time_ < var_52_25 + var_52_35 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_25) / var_52_35

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_25 + var_52_35 and arg_49_1.time_ < var_52_25 + var_52_35 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play115301014 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 115301014
		arg_53_1.duration_ = 2.733

		local var_53_0 = {
			ja = 2.733,
			ko = 1.8,
			zh = 2.066,
			en = 2.533
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
				arg_53_0:Play115301015(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["1038"]
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 and arg_53_1.var_.actorSpriteComps1038 == nil then
				arg_53_1.var_.actorSpriteComps1038 = var_56_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_56_2 = 0.2

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2

				if arg_53_1.var_.actorSpriteComps1038 then
					for iter_56_0, iter_56_1 in pairs(arg_53_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_56_1 then
							local var_56_4 = Mathf.Lerp(iter_56_1.color.r, 0.5, var_56_3)

							iter_56_1.color = Color.New(var_56_4, var_56_4, var_56_4)
						end
					end
				end
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 and arg_53_1.var_.actorSpriteComps1038 then
				local var_56_5 = 0.5

				for iter_56_2, iter_56_3 in pairs(arg_53_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_56_3 then
						iter_56_3.color = Color.New(var_56_5, var_56_5, var_56_5)
					end
				end

				arg_53_1.var_.actorSpriteComps1038 = nil
			end

			local var_56_6 = arg_53_1.actors_["10030"]
			local var_56_7 = 0

			if var_56_7 < arg_53_1.time_ and arg_53_1.time_ <= var_56_7 + arg_56_0 and arg_53_1.var_.actorSpriteComps10030 == nil then
				arg_53_1.var_.actorSpriteComps10030 = var_56_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_56_8 = 0.2

			if var_56_7 <= arg_53_1.time_ and arg_53_1.time_ < var_56_7 + var_56_8 then
				local var_56_9 = (arg_53_1.time_ - var_56_7) / var_56_8

				if arg_53_1.var_.actorSpriteComps10030 then
					for iter_56_4, iter_56_5 in pairs(arg_53_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_56_5 then
							local var_56_10 = Mathf.Lerp(iter_56_5.color.r, 1, var_56_9)

							iter_56_5.color = Color.New(var_56_10, var_56_10, var_56_10)
						end
					end
				end
			end

			if arg_53_1.time_ >= var_56_7 + var_56_8 and arg_53_1.time_ < var_56_7 + var_56_8 + arg_56_0 and arg_53_1.var_.actorSpriteComps10030 then
				local var_56_11 = 1

				for iter_56_6, iter_56_7 in pairs(arg_53_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_56_7 then
						iter_56_7.color = Color.New(var_56_11, var_56_11, var_56_11)
					end
				end

				arg_53_1.var_.actorSpriteComps10030 = nil
			end

			local var_56_12 = 0
			local var_56_13 = 0.2

			if var_56_12 < arg_53_1.time_ and arg_53_1.time_ <= var_56_12 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_14 = arg_53_1:FormatText(StoryNameCfg[309].name)

				arg_53_1.leftNameTxt_.text = var_56_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_15 = arg_53_1:GetWordFromCfg(115301014)
				local var_56_16 = arg_53_1:FormatText(var_56_15.content)

				arg_53_1.text_.text = var_56_16

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_17 = 8
				local var_56_18 = utf8.len(var_56_16)
				local var_56_19 = var_56_17 <= 0 and var_56_13 or var_56_13 * (var_56_18 / var_56_17)

				if var_56_19 > 0 and var_56_13 < var_56_19 then
					arg_53_1.talkMaxDuration = var_56_19

					if var_56_19 + var_56_12 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_19 + var_56_12
					end
				end

				arg_53_1.text_.text = var_56_16
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301014", "story_v_out_115301.awb") ~= 0 then
					local var_56_20 = manager.audio:GetVoiceLength("story_v_out_115301", "115301014", "story_v_out_115301.awb") / 1000

					if var_56_20 + var_56_12 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_20 + var_56_12
					end

					if var_56_15.prefab_name ~= "" and arg_53_1.actors_[var_56_15.prefab_name] ~= nil then
						local var_56_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_15.prefab_name].transform, "story_v_out_115301", "115301014", "story_v_out_115301.awb")

						arg_53_1:RecordAudio("115301014", var_56_21)
						arg_53_1:RecordAudio("115301014", var_56_21)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_115301", "115301014", "story_v_out_115301.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_115301", "115301014", "story_v_out_115301.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_22 = math.max(var_56_13, arg_53_1.talkMaxDuration)

			if var_56_12 <= arg_53_1.time_ and arg_53_1.time_ < var_56_12 + var_56_22 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_12) / var_56_22

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_12 + var_56_22 and arg_53_1.time_ < var_56_12 + var_56_22 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play115301015 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 115301015
		arg_57_1.duration_ = 10.1

		local var_57_0 = {
			ja = 10.1,
			ko = 8,
			zh = 5.033,
			en = 5.533
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
				arg_57_0:Play115301016(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0
			local var_60_1 = 0.575

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_2 = arg_57_1:FormatText(StoryNameCfg[309].name)

				arg_57_1.leftNameTxt_.text = var_60_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_3 = arg_57_1:GetWordFromCfg(115301015)
				local var_60_4 = arg_57_1:FormatText(var_60_3.content)

				arg_57_1.text_.text = var_60_4

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301015", "story_v_out_115301.awb") ~= 0 then
					local var_60_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301015", "story_v_out_115301.awb") / 1000

					if var_60_8 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_8 + var_60_0
					end

					if var_60_3.prefab_name ~= "" and arg_57_1.actors_[var_60_3.prefab_name] ~= nil then
						local var_60_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_3.prefab_name].transform, "story_v_out_115301", "115301015", "story_v_out_115301.awb")

						arg_57_1:RecordAudio("115301015", var_60_9)
						arg_57_1:RecordAudio("115301015", var_60_9)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_115301", "115301015", "story_v_out_115301.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_115301", "115301015", "story_v_out_115301.awb")
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
	Play115301016 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 115301016
		arg_61_1.duration_ = 9.7

		local var_61_0 = {
			ja = 3.5,
			ko = 5.833,
			zh = 9.7,
			en = 7.1
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
				arg_61_0:Play115301017(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["1038"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and arg_61_1.var_.actorSpriteComps1038 == nil then
				arg_61_1.var_.actorSpriteComps1038 = var_64_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_64_2 = 0.2

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.actorSpriteComps1038 then
					for iter_64_0, iter_64_1 in pairs(arg_61_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_64_1 then
							local var_64_4 = Mathf.Lerp(iter_64_1.color.r, 1, var_64_3)

							iter_64_1.color = Color.New(var_64_4, var_64_4, var_64_4)
						end
					end
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and arg_61_1.var_.actorSpriteComps1038 then
				local var_64_5 = 1

				for iter_64_2, iter_64_3 in pairs(arg_61_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_64_3 then
						iter_64_3.color = Color.New(var_64_5, var_64_5, var_64_5)
					end
				end

				arg_61_1.var_.actorSpriteComps1038 = nil
			end

			local var_64_6 = arg_61_1.actors_["10030"]
			local var_64_7 = 0

			if var_64_7 < arg_61_1.time_ and arg_61_1.time_ <= var_64_7 + arg_64_0 and arg_61_1.var_.actorSpriteComps10030 == nil then
				arg_61_1.var_.actorSpriteComps10030 = var_64_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_64_8 = 0.2

			if var_64_7 <= arg_61_1.time_ and arg_61_1.time_ < var_64_7 + var_64_8 then
				local var_64_9 = (arg_61_1.time_ - var_64_7) / var_64_8

				if arg_61_1.var_.actorSpriteComps10030 then
					for iter_64_4, iter_64_5 in pairs(arg_61_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_64_5 then
							local var_64_10 = Mathf.Lerp(iter_64_5.color.r, 0.5, var_64_9)

							iter_64_5.color = Color.New(var_64_10, var_64_10, var_64_10)
						end
					end
				end
			end

			if arg_61_1.time_ >= var_64_7 + var_64_8 and arg_61_1.time_ < var_64_7 + var_64_8 + arg_64_0 and arg_61_1.var_.actorSpriteComps10030 then
				local var_64_11 = 0.5

				for iter_64_6, iter_64_7 in pairs(arg_61_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_64_7 then
						iter_64_7.color = Color.New(var_64_11, var_64_11, var_64_11)
					end
				end

				arg_61_1.var_.actorSpriteComps10030 = nil
			end

			local var_64_12 = 0
			local var_64_13 = 0.725

			if var_64_12 < arg_61_1.time_ and arg_61_1.time_ <= var_64_12 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_14 = arg_61_1:FormatText(StoryNameCfg[94].name)

				arg_61_1.leftNameTxt_.text = var_64_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_15 = arg_61_1:GetWordFromCfg(115301016)
				local var_64_16 = arg_61_1:FormatText(var_64_15.content)

				arg_61_1.text_.text = var_64_16

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_17 = 28
				local var_64_18 = utf8.len(var_64_16)
				local var_64_19 = var_64_17 <= 0 and var_64_13 or var_64_13 * (var_64_18 / var_64_17)

				if var_64_19 > 0 and var_64_13 < var_64_19 then
					arg_61_1.talkMaxDuration = var_64_19

					if var_64_19 + var_64_12 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_19 + var_64_12
					end
				end

				arg_61_1.text_.text = var_64_16
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301016", "story_v_out_115301.awb") ~= 0 then
					local var_64_20 = manager.audio:GetVoiceLength("story_v_out_115301", "115301016", "story_v_out_115301.awb") / 1000

					if var_64_20 + var_64_12 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_20 + var_64_12
					end

					if var_64_15.prefab_name ~= "" and arg_61_1.actors_[var_64_15.prefab_name] ~= nil then
						local var_64_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_15.prefab_name].transform, "story_v_out_115301", "115301016", "story_v_out_115301.awb")

						arg_61_1:RecordAudio("115301016", var_64_21)
						arg_61_1:RecordAudio("115301016", var_64_21)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_115301", "115301016", "story_v_out_115301.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_115301", "115301016", "story_v_out_115301.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_22 = math.max(var_64_13, arg_61_1.talkMaxDuration)

			if var_64_12 <= arg_61_1.time_ and arg_61_1.time_ < var_64_12 + var_64_22 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_12) / var_64_22

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_12 + var_64_22 and arg_61_1.time_ < var_64_12 + var_64_22 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play115301017 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 115301017
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play115301018(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["1038"]
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 and arg_65_1.var_.actorSpriteComps1038 == nil then
				arg_65_1.var_.actorSpriteComps1038 = var_68_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_68_2 = 0.2

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2

				if arg_65_1.var_.actorSpriteComps1038 then
					for iter_68_0, iter_68_1 in pairs(arg_65_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_68_1 then
							local var_68_4 = Mathf.Lerp(iter_68_1.color.r, 0.5, var_68_3)

							iter_68_1.color = Color.New(var_68_4, var_68_4, var_68_4)
						end
					end
				end
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 and arg_65_1.var_.actorSpriteComps1038 then
				local var_68_5 = 0.5

				for iter_68_2, iter_68_3 in pairs(arg_65_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_68_3 then
						iter_68_3.color = Color.New(var_68_5, var_68_5, var_68_5)
					end
				end

				arg_65_1.var_.actorSpriteComps1038 = nil
			end

			local var_68_6 = 0
			local var_68_7 = 0.9

			if var_68_6 < arg_65_1.time_ and arg_65_1.time_ <= var_68_6 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, false)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_8 = arg_65_1:GetWordFromCfg(115301017)
				local var_68_9 = arg_65_1:FormatText(var_68_8.content)

				arg_65_1.text_.text = var_68_9

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_10 = 36
				local var_68_11 = utf8.len(var_68_9)
				local var_68_12 = var_68_10 <= 0 and var_68_7 or var_68_7 * (var_68_11 / var_68_10)

				if var_68_12 > 0 and var_68_7 < var_68_12 then
					arg_65_1.talkMaxDuration = var_68_12

					if var_68_12 + var_68_6 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_12 + var_68_6
					end
				end

				arg_65_1.text_.text = var_68_9
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_13 = math.max(var_68_7, arg_65_1.talkMaxDuration)

			if var_68_6 <= arg_65_1.time_ and arg_65_1.time_ < var_68_6 + var_68_13 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_6) / var_68_13

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_6 + var_68_13 and arg_65_1.time_ < var_68_6 + var_68_13 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play115301018 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 115301018
		arg_69_1.duration_ = 5.833

		local var_69_0 = {
			ja = 5.833,
			ko = 4.5,
			zh = 4.866,
			en = 3.166
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
				arg_69_0:Play115301019(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["10030"].transform
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 then
				arg_69_1.var_.moveOldPos10030 = var_72_0.localPosition
				var_72_0.localScale = Vector3.New(1, 1, 1)

				arg_69_1:CheckSpriteTmpPos("10030", 4)

				local var_72_2 = var_72_0.childCount

				for iter_72_0 = 0, var_72_2 - 1 do
					local var_72_3 = var_72_0:GetChild(iter_72_0)

					if var_72_3.name == "split_5" or not string.find(var_72_3.name, "split") then
						var_72_3.gameObject:SetActive(true)
					else
						var_72_3.gameObject:SetActive(false)
					end
				end
			end

			local var_72_4 = 0.001

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_4 then
				local var_72_5 = (arg_69_1.time_ - var_72_1) / var_72_4
				local var_72_6 = Vector3.New(390, -390, 150)

				var_72_0.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos10030, var_72_6, var_72_5)
			end

			if arg_69_1.time_ >= var_72_1 + var_72_4 and arg_69_1.time_ < var_72_1 + var_72_4 + arg_72_0 then
				var_72_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_72_7 = arg_69_1.actors_["10030"]
			local var_72_8 = 0

			if var_72_8 < arg_69_1.time_ and arg_69_1.time_ <= var_72_8 + arg_72_0 and arg_69_1.var_.actorSpriteComps10030 == nil then
				arg_69_1.var_.actorSpriteComps10030 = var_72_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_72_9 = 0.2

			if var_72_8 <= arg_69_1.time_ and arg_69_1.time_ < var_72_8 + var_72_9 then
				local var_72_10 = (arg_69_1.time_ - var_72_8) / var_72_9

				if arg_69_1.var_.actorSpriteComps10030 then
					for iter_72_1, iter_72_2 in pairs(arg_69_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_72_2 then
							local var_72_11 = Mathf.Lerp(iter_72_2.color.r, 1, var_72_10)

							iter_72_2.color = Color.New(var_72_11, var_72_11, var_72_11)
						end
					end
				end
			end

			if arg_69_1.time_ >= var_72_8 + var_72_9 and arg_69_1.time_ < var_72_8 + var_72_9 + arg_72_0 and arg_69_1.var_.actorSpriteComps10030 then
				local var_72_12 = 1

				for iter_72_3, iter_72_4 in pairs(arg_69_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_72_4 then
						iter_72_4.color = Color.New(var_72_12, var_72_12, var_72_12)
					end
				end

				arg_69_1.var_.actorSpriteComps10030 = nil
			end

			local var_72_13 = 0
			local var_72_14 = 0.45

			if var_72_13 < arg_69_1.time_ and arg_69_1.time_ <= var_72_13 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_15 = arg_69_1:FormatText(StoryNameCfg[309].name)

				arg_69_1.leftNameTxt_.text = var_72_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_16 = arg_69_1:GetWordFromCfg(115301018)
				local var_72_17 = arg_69_1:FormatText(var_72_16.content)

				arg_69_1.text_.text = var_72_17

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_18 = 18
				local var_72_19 = utf8.len(var_72_17)
				local var_72_20 = var_72_18 <= 0 and var_72_14 or var_72_14 * (var_72_19 / var_72_18)

				if var_72_20 > 0 and var_72_14 < var_72_20 then
					arg_69_1.talkMaxDuration = var_72_20

					if var_72_20 + var_72_13 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_20 + var_72_13
					end
				end

				arg_69_1.text_.text = var_72_17
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301018", "story_v_out_115301.awb") ~= 0 then
					local var_72_21 = manager.audio:GetVoiceLength("story_v_out_115301", "115301018", "story_v_out_115301.awb") / 1000

					if var_72_21 + var_72_13 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_21 + var_72_13
					end

					if var_72_16.prefab_name ~= "" and arg_69_1.actors_[var_72_16.prefab_name] ~= nil then
						local var_72_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_16.prefab_name].transform, "story_v_out_115301", "115301018", "story_v_out_115301.awb")

						arg_69_1:RecordAudio("115301018", var_72_22)
						arg_69_1:RecordAudio("115301018", var_72_22)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_115301", "115301018", "story_v_out_115301.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_115301", "115301018", "story_v_out_115301.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_23 = math.max(var_72_14, arg_69_1.talkMaxDuration)

			if var_72_13 <= arg_69_1.time_ and arg_69_1.time_ < var_72_13 + var_72_23 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_13) / var_72_23

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_13 + var_72_23 and arg_69_1.time_ < var_72_13 + var_72_23 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play115301019 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 115301019
		arg_73_1.duration_ = 7.766

		local var_73_0 = {
			ja = 7.766,
			ko = 6.166,
			zh = 6.366,
			en = 4.466
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
				arg_73_0:Play115301020(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["10030"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.actorSpriteComps10030 == nil then
				arg_73_1.var_.actorSpriteComps10030 = var_76_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_76_2 = 0.2

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.actorSpriteComps10030 then
					for iter_76_0, iter_76_1 in pairs(arg_73_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_76_1 then
							local var_76_4 = Mathf.Lerp(iter_76_1.color.r, 0.5, var_76_3)

							iter_76_1.color = Color.New(var_76_4, var_76_4, var_76_4)
						end
					end
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.actorSpriteComps10030 then
				local var_76_5 = 0.5

				for iter_76_2, iter_76_3 in pairs(arg_73_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_76_3 then
						iter_76_3.color = Color.New(var_76_5, var_76_5, var_76_5)
					end
				end

				arg_73_1.var_.actorSpriteComps10030 = nil
			end

			local var_76_6 = arg_73_1.actors_["1038"].transform
			local var_76_7 = 0

			if var_76_7 < arg_73_1.time_ and arg_73_1.time_ <= var_76_7 + arg_76_0 then
				arg_73_1.var_.moveOldPos1038 = var_76_6.localPosition
				var_76_6.localScale = Vector3.New(1, 1, 1)

				arg_73_1:CheckSpriteTmpPos("1038", 2)

				local var_76_8 = var_76_6.childCount

				for iter_76_4 = 0, var_76_8 - 1 do
					local var_76_9 = var_76_6:GetChild(iter_76_4)

					if var_76_9.name == "split_1" or not string.find(var_76_9.name, "split") then
						var_76_9.gameObject:SetActive(true)
					else
						var_76_9.gameObject:SetActive(false)
					end
				end
			end

			local var_76_10 = 0.001

			if var_76_7 <= arg_73_1.time_ and arg_73_1.time_ < var_76_7 + var_76_10 then
				local var_76_11 = (arg_73_1.time_ - var_76_7) / var_76_10
				local var_76_12 = Vector3.New(-390, -400, 0)

				var_76_6.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1038, var_76_12, var_76_11)
			end

			if arg_73_1.time_ >= var_76_7 + var_76_10 and arg_73_1.time_ < var_76_7 + var_76_10 + arg_76_0 then
				var_76_6.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_76_13 = arg_73_1.actors_["1038"]
			local var_76_14 = 0

			if var_76_14 < arg_73_1.time_ and arg_73_1.time_ <= var_76_14 + arg_76_0 and arg_73_1.var_.actorSpriteComps1038 == nil then
				arg_73_1.var_.actorSpriteComps1038 = var_76_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_76_15 = 0.2

			if var_76_14 <= arg_73_1.time_ and arg_73_1.time_ < var_76_14 + var_76_15 then
				local var_76_16 = (arg_73_1.time_ - var_76_14) / var_76_15

				if arg_73_1.var_.actorSpriteComps1038 then
					for iter_76_5, iter_76_6 in pairs(arg_73_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_76_6 then
							local var_76_17 = Mathf.Lerp(iter_76_6.color.r, 1, var_76_16)

							iter_76_6.color = Color.New(var_76_17, var_76_17, var_76_17)
						end
					end
				end
			end

			if arg_73_1.time_ >= var_76_14 + var_76_15 and arg_73_1.time_ < var_76_14 + var_76_15 + arg_76_0 and arg_73_1.var_.actorSpriteComps1038 then
				local var_76_18 = 1

				for iter_76_7, iter_76_8 in pairs(arg_73_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_76_8 then
						iter_76_8.color = Color.New(var_76_18, var_76_18, var_76_18)
					end
				end

				arg_73_1.var_.actorSpriteComps1038 = nil
			end

			local var_76_19 = 0
			local var_76_20 = 0.475

			if var_76_19 < arg_73_1.time_ and arg_73_1.time_ <= var_76_19 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_21 = arg_73_1:FormatText(StoryNameCfg[94].name)

				arg_73_1.leftNameTxt_.text = var_76_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_22 = arg_73_1:GetWordFromCfg(115301019)
				local var_76_23 = arg_73_1:FormatText(var_76_22.content)

				arg_73_1.text_.text = var_76_23

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_24 = 19
				local var_76_25 = utf8.len(var_76_23)
				local var_76_26 = var_76_24 <= 0 and var_76_20 or var_76_20 * (var_76_25 / var_76_24)

				if var_76_26 > 0 and var_76_20 < var_76_26 then
					arg_73_1.talkMaxDuration = var_76_26

					if var_76_26 + var_76_19 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_26 + var_76_19
					end
				end

				arg_73_1.text_.text = var_76_23
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301019", "story_v_out_115301.awb") ~= 0 then
					local var_76_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301019", "story_v_out_115301.awb") / 1000

					if var_76_27 + var_76_19 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_27 + var_76_19
					end

					if var_76_22.prefab_name ~= "" and arg_73_1.actors_[var_76_22.prefab_name] ~= nil then
						local var_76_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_22.prefab_name].transform, "story_v_out_115301", "115301019", "story_v_out_115301.awb")

						arg_73_1:RecordAudio("115301019", var_76_28)
						arg_73_1:RecordAudio("115301019", var_76_28)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_115301", "115301019", "story_v_out_115301.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_115301", "115301019", "story_v_out_115301.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_29 = math.max(var_76_20, arg_73_1.talkMaxDuration)

			if var_76_19 <= arg_73_1.time_ and arg_73_1.time_ < var_76_19 + var_76_29 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_19) / var_76_29

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_19 + var_76_29 and arg_73_1.time_ < var_76_19 + var_76_29 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play115301020 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 115301020
		arg_77_1.duration_ = 4.033

		local var_77_0 = {
			ja = 2.733,
			ko = 3.366,
			zh = 4.033,
			en = 3.3
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
				arg_77_0:Play115301021(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1038"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.actorSpriteComps1038 == nil then
				arg_77_1.var_.actorSpriteComps1038 = var_80_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_80_2 = 0.2

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.actorSpriteComps1038 then
					for iter_80_0, iter_80_1 in pairs(arg_77_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_80_1 then
							local var_80_4 = Mathf.Lerp(iter_80_1.color.r, 0.5, var_80_3)

							iter_80_1.color = Color.New(var_80_4, var_80_4, var_80_4)
						end
					end
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.actorSpriteComps1038 then
				local var_80_5 = 0.5

				for iter_80_2, iter_80_3 in pairs(arg_77_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_80_3 then
						iter_80_3.color = Color.New(var_80_5, var_80_5, var_80_5)
					end
				end

				arg_77_1.var_.actorSpriteComps1038 = nil
			end

			local var_80_6 = arg_77_1.actors_["10030"]
			local var_80_7 = 0

			if var_80_7 < arg_77_1.time_ and arg_77_1.time_ <= var_80_7 + arg_80_0 and arg_77_1.var_.actorSpriteComps10030 == nil then
				arg_77_1.var_.actorSpriteComps10030 = var_80_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_80_8 = 0.2

			if var_80_7 <= arg_77_1.time_ and arg_77_1.time_ < var_80_7 + var_80_8 then
				local var_80_9 = (arg_77_1.time_ - var_80_7) / var_80_8

				if arg_77_1.var_.actorSpriteComps10030 then
					for iter_80_4, iter_80_5 in pairs(arg_77_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_80_5 then
							local var_80_10 = Mathf.Lerp(iter_80_5.color.r, 1, var_80_9)

							iter_80_5.color = Color.New(var_80_10, var_80_10, var_80_10)
						end
					end
				end
			end

			if arg_77_1.time_ >= var_80_7 + var_80_8 and arg_77_1.time_ < var_80_7 + var_80_8 + arg_80_0 and arg_77_1.var_.actorSpriteComps10030 then
				local var_80_11 = 1

				for iter_80_6, iter_80_7 in pairs(arg_77_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_80_7 then
						iter_80_7.color = Color.New(var_80_11, var_80_11, var_80_11)
					end
				end

				arg_77_1.var_.actorSpriteComps10030 = nil
			end

			local var_80_12 = 0
			local var_80_13 = 0.35

			if var_80_12 < arg_77_1.time_ and arg_77_1.time_ <= var_80_12 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_14 = arg_77_1:FormatText(StoryNameCfg[309].name)

				arg_77_1.leftNameTxt_.text = var_80_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_15 = arg_77_1:GetWordFromCfg(115301020)
				local var_80_16 = arg_77_1:FormatText(var_80_15.content)

				arg_77_1.text_.text = var_80_16

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_17 = 14
				local var_80_18 = utf8.len(var_80_16)
				local var_80_19 = var_80_17 <= 0 and var_80_13 or var_80_13 * (var_80_18 / var_80_17)

				if var_80_19 > 0 and var_80_13 < var_80_19 then
					arg_77_1.talkMaxDuration = var_80_19

					if var_80_19 + var_80_12 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_19 + var_80_12
					end
				end

				arg_77_1.text_.text = var_80_16
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301020", "story_v_out_115301.awb") ~= 0 then
					local var_80_20 = manager.audio:GetVoiceLength("story_v_out_115301", "115301020", "story_v_out_115301.awb") / 1000

					if var_80_20 + var_80_12 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_20 + var_80_12
					end

					if var_80_15.prefab_name ~= "" and arg_77_1.actors_[var_80_15.prefab_name] ~= nil then
						local var_80_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_15.prefab_name].transform, "story_v_out_115301", "115301020", "story_v_out_115301.awb")

						arg_77_1:RecordAudio("115301020", var_80_21)
						arg_77_1:RecordAudio("115301020", var_80_21)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_115301", "115301020", "story_v_out_115301.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_115301", "115301020", "story_v_out_115301.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_22 = math.max(var_80_13, arg_77_1.talkMaxDuration)

			if var_80_12 <= arg_77_1.time_ and arg_77_1.time_ < var_80_12 + var_80_22 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_12) / var_80_22

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_12 + var_80_22 and arg_77_1.time_ < var_80_12 + var_80_22 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play115301021 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 115301021
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play115301022(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["10030"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				local var_84_2 = var_84_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_84_2 then
					arg_81_1.var_.alphaOldValue10030 = var_84_2.alpha
					arg_81_1.var_.characterEffect10030 = var_84_2
				end

				arg_81_1.var_.alphaOldValue10030 = 1
			end

			local var_84_3 = 0.333333333333333

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_3 then
				local var_84_4 = (arg_81_1.time_ - var_84_1) / var_84_3
				local var_84_5 = Mathf.Lerp(arg_81_1.var_.alphaOldValue10030, 0, var_84_4)

				if arg_81_1.var_.characterEffect10030 then
					arg_81_1.var_.characterEffect10030.alpha = var_84_5
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_3 and arg_81_1.time_ < var_84_1 + var_84_3 + arg_84_0 and arg_81_1.var_.characterEffect10030 then
				arg_81_1.var_.characterEffect10030.alpha = 0
			end

			local var_84_6 = arg_81_1.actors_["1038"]
			local var_84_7 = 0

			if var_84_7 < arg_81_1.time_ and arg_81_1.time_ <= var_84_7 + arg_84_0 then
				local var_84_8 = var_84_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_84_8 then
					arg_81_1.var_.alphaOldValue1038 = var_84_8.alpha
					arg_81_1.var_.characterEffect1038 = var_84_8
				end

				arg_81_1.var_.alphaOldValue1038 = 1
			end

			local var_84_9 = 0.333333333333333

			if var_84_7 <= arg_81_1.time_ and arg_81_1.time_ < var_84_7 + var_84_9 then
				local var_84_10 = (arg_81_1.time_ - var_84_7) / var_84_9
				local var_84_11 = Mathf.Lerp(arg_81_1.var_.alphaOldValue1038, 0, var_84_10)

				if arg_81_1.var_.characterEffect1038 then
					arg_81_1.var_.characterEffect1038.alpha = var_84_11
				end
			end

			if arg_81_1.time_ >= var_84_7 + var_84_9 and arg_81_1.time_ < var_84_7 + var_84_9 + arg_84_0 and arg_81_1.var_.characterEffect1038 then
				arg_81_1.var_.characterEffect1038.alpha = 0
			end

			local var_84_12 = 0
			local var_84_13 = 0.925

			if var_84_12 < arg_81_1.time_ and arg_81_1.time_ <= var_84_12 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, false)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_14 = arg_81_1:GetWordFromCfg(115301021)
				local var_84_15 = arg_81_1:FormatText(var_84_14.content)

				arg_81_1.text_.text = var_84_15

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_16 = 37
				local var_84_17 = utf8.len(var_84_15)
				local var_84_18 = var_84_16 <= 0 and var_84_13 or var_84_13 * (var_84_17 / var_84_16)

				if var_84_18 > 0 and var_84_13 < var_84_18 then
					arg_81_1.talkMaxDuration = var_84_18

					if var_84_18 + var_84_12 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_18 + var_84_12
					end
				end

				arg_81_1.text_.text = var_84_15
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_19 = math.max(var_84_13, arg_81_1.talkMaxDuration)

			if var_84_12 <= arg_81_1.time_ and arg_81_1.time_ < var_84_12 + var_84_19 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_12) / var_84_19

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_12 + var_84_19 and arg_81_1.time_ < var_84_12 + var_84_19 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play115301022 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 115301022
		arg_85_1.duration_ = 8.366

		local var_85_0 = {
			ja = 6.2,
			ko = 8.333,
			zh = 8.366,
			en = 8.266
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
				arg_85_0:Play115301023(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["10030"].transform
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 then
				arg_85_1.var_.moveOldPos10030 = var_88_0.localPosition
				var_88_0.localScale = Vector3.New(1, 1, 1)

				arg_85_1:CheckSpriteTmpPos("10030", 3)

				local var_88_2 = var_88_0.childCount

				for iter_88_0 = 0, var_88_2 - 1 do
					local var_88_3 = var_88_0:GetChild(iter_88_0)

					if var_88_3.name == "split_5" or not string.find(var_88_3.name, "split") then
						var_88_3.gameObject:SetActive(true)
					else
						var_88_3.gameObject:SetActive(false)
					end
				end
			end

			local var_88_4 = 0.001

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_4 then
				local var_88_5 = (arg_85_1.time_ - var_88_1) / var_88_4
				local var_88_6 = Vector3.New(0, -390, 150)

				var_88_0.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos10030, var_88_6, var_88_5)
			end

			if arg_85_1.time_ >= var_88_1 + var_88_4 and arg_85_1.time_ < var_88_1 + var_88_4 + arg_88_0 then
				var_88_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_88_7 = arg_85_1.actors_["10030"]
			local var_88_8 = 0

			if var_88_8 < arg_85_1.time_ and arg_85_1.time_ <= var_88_8 + arg_88_0 then
				local var_88_9 = var_88_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_88_9 then
					arg_85_1.var_.alphaOldValue10030 = var_88_9.alpha
					arg_85_1.var_.characterEffect10030 = var_88_9
				end

				arg_85_1.var_.alphaOldValue10030 = 0
			end

			local var_88_10 = 0.333333333333333

			if var_88_8 <= arg_85_1.time_ and arg_85_1.time_ < var_88_8 + var_88_10 then
				local var_88_11 = (arg_85_1.time_ - var_88_8) / var_88_10
				local var_88_12 = Mathf.Lerp(arg_85_1.var_.alphaOldValue10030, 1, var_88_11)

				if arg_85_1.var_.characterEffect10030 then
					arg_85_1.var_.characterEffect10030.alpha = var_88_12
				end
			end

			if arg_85_1.time_ >= var_88_8 + var_88_10 and arg_85_1.time_ < var_88_8 + var_88_10 + arg_88_0 and arg_85_1.var_.characterEffect10030 then
				arg_85_1.var_.characterEffect10030.alpha = 1
			end

			local var_88_13 = 0
			local var_88_14 = 1.125

			if var_88_13 < arg_85_1.time_ and arg_85_1.time_ <= var_88_13 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_15 = arg_85_1:FormatText(StoryNameCfg[309].name)

				arg_85_1.leftNameTxt_.text = var_88_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_16 = arg_85_1:GetWordFromCfg(115301022)
				local var_88_17 = arg_85_1:FormatText(var_88_16.content)

				arg_85_1.text_.text = var_88_17

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_18 = 45
				local var_88_19 = utf8.len(var_88_17)
				local var_88_20 = var_88_18 <= 0 and var_88_14 or var_88_14 * (var_88_19 / var_88_18)

				if var_88_20 > 0 and var_88_14 < var_88_20 then
					arg_85_1.talkMaxDuration = var_88_20

					if var_88_20 + var_88_13 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_20 + var_88_13
					end
				end

				arg_85_1.text_.text = var_88_17
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301022", "story_v_out_115301.awb") ~= 0 then
					local var_88_21 = manager.audio:GetVoiceLength("story_v_out_115301", "115301022", "story_v_out_115301.awb") / 1000

					if var_88_21 + var_88_13 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_21 + var_88_13
					end

					if var_88_16.prefab_name ~= "" and arg_85_1.actors_[var_88_16.prefab_name] ~= nil then
						local var_88_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_16.prefab_name].transform, "story_v_out_115301", "115301022", "story_v_out_115301.awb")

						arg_85_1:RecordAudio("115301022", var_88_22)
						arg_85_1:RecordAudio("115301022", var_88_22)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_115301", "115301022", "story_v_out_115301.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_115301", "115301022", "story_v_out_115301.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_23 = math.max(var_88_14, arg_85_1.talkMaxDuration)

			if var_88_13 <= arg_85_1.time_ and arg_85_1.time_ < var_88_13 + var_88_23 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_13) / var_88_23

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_13 + var_88_23 and arg_85_1.time_ < var_88_13 + var_88_23 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play115301023 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 115301023
		arg_89_1.duration_ = 11.866

		local var_89_0 = {
			ja = 9.766,
			ko = 11.866,
			zh = 9.6,
			en = 11.433
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
				arg_89_0:Play115301024(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 1.25

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_2 = arg_89_1:FormatText(StoryNameCfg[309].name)

				arg_89_1.leftNameTxt_.text = var_92_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_3 = arg_89_1:GetWordFromCfg(115301023)
				local var_92_4 = arg_89_1:FormatText(var_92_3.content)

				arg_89_1.text_.text = var_92_4

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_5 = 50
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

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301023", "story_v_out_115301.awb") ~= 0 then
					local var_92_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301023", "story_v_out_115301.awb") / 1000

					if var_92_8 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_8 + var_92_0
					end

					if var_92_3.prefab_name ~= "" and arg_89_1.actors_[var_92_3.prefab_name] ~= nil then
						local var_92_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_3.prefab_name].transform, "story_v_out_115301", "115301023", "story_v_out_115301.awb")

						arg_89_1:RecordAudio("115301023", var_92_9)
						arg_89_1:RecordAudio("115301023", var_92_9)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_115301", "115301023", "story_v_out_115301.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_115301", "115301023", "story_v_out_115301.awb")
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
	Play115301024 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 115301024
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play115301025(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["10030"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 then
				local var_96_2 = var_96_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_96_2 then
					arg_93_1.var_.alphaOldValue10030 = var_96_2.alpha
					arg_93_1.var_.characterEffect10030 = var_96_2
				end

				arg_93_1.var_.alphaOldValue10030 = 1
			end

			local var_96_3 = 0.333333333333333

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_3 then
				local var_96_4 = (arg_93_1.time_ - var_96_1) / var_96_3
				local var_96_5 = Mathf.Lerp(arg_93_1.var_.alphaOldValue10030, 0, var_96_4)

				if arg_93_1.var_.characterEffect10030 then
					arg_93_1.var_.characterEffect10030.alpha = var_96_5
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_3 and arg_93_1.time_ < var_96_1 + var_96_3 + arg_96_0 and arg_93_1.var_.characterEffect10030 then
				arg_93_1.var_.characterEffect10030.alpha = 0
			end

			local var_96_6 = 0
			local var_96_7 = 0.55

			if var_96_6 < arg_93_1.time_ and arg_93_1.time_ <= var_96_6 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, false)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_8 = arg_93_1:GetWordFromCfg(115301024)
				local var_96_9 = arg_93_1:FormatText(var_96_8.content)

				arg_93_1.text_.text = var_96_9

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_10 = 22
				local var_96_11 = utf8.len(var_96_9)
				local var_96_12 = var_96_10 <= 0 and var_96_7 or var_96_7 * (var_96_11 / var_96_10)

				if var_96_12 > 0 and var_96_7 < var_96_12 then
					arg_93_1.talkMaxDuration = var_96_12

					if var_96_12 + var_96_6 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_12 + var_96_6
					end
				end

				arg_93_1.text_.text = var_96_9
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_13 = math.max(var_96_7, arg_93_1.talkMaxDuration)

			if var_96_6 <= arg_93_1.time_ and arg_93_1.time_ < var_96_6 + var_96_13 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_6) / var_96_13

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_6 + var_96_13 and arg_93_1.time_ < var_96_6 + var_96_13 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play115301025 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 115301025
		arg_97_1.duration_ = 4.1

		local var_97_0 = {
			ja = 4.1,
			ko = 1.4,
			zh = 2.866,
			en = 1.366
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
				arg_97_0:Play115301026(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1038"].transform
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 then
				arg_97_1.var_.moveOldPos1038 = var_100_0.localPosition
				var_100_0.localScale = Vector3.New(1, 1, 1)

				arg_97_1:CheckSpriteTmpPos("1038", 3)

				local var_100_2 = var_100_0.childCount

				for iter_100_0 = 0, var_100_2 - 1 do
					local var_100_3 = var_100_0:GetChild(iter_100_0)

					if var_100_3.name == "split_1" or not string.find(var_100_3.name, "split") then
						var_100_3.gameObject:SetActive(true)
					else
						var_100_3.gameObject:SetActive(false)
					end
				end
			end

			local var_100_4 = 0.001

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_4 then
				local var_100_5 = (arg_97_1.time_ - var_100_1) / var_100_4
				local var_100_6 = Vector3.New(0, -400, 0)

				var_100_0.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1038, var_100_6, var_100_5)
			end

			if arg_97_1.time_ >= var_100_1 + var_100_4 and arg_97_1.time_ < var_100_1 + var_100_4 + arg_100_0 then
				var_100_0.localPosition = Vector3.New(0, -400, 0)
			end

			local var_100_7 = arg_97_1.actors_["1038"]
			local var_100_8 = 0

			if var_100_8 < arg_97_1.time_ and arg_97_1.time_ <= var_100_8 + arg_100_0 then
				local var_100_9 = var_100_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_100_9 then
					arg_97_1.var_.alphaOldValue1038 = var_100_9.alpha
					arg_97_1.var_.characterEffect1038 = var_100_9
				end

				arg_97_1.var_.alphaOldValue1038 = 0
			end

			local var_100_10 = 0.333333333333333

			if var_100_8 <= arg_97_1.time_ and arg_97_1.time_ < var_100_8 + var_100_10 then
				local var_100_11 = (arg_97_1.time_ - var_100_8) / var_100_10
				local var_100_12 = Mathf.Lerp(arg_97_1.var_.alphaOldValue1038, 1, var_100_11)

				if arg_97_1.var_.characterEffect1038 then
					arg_97_1.var_.characterEffect1038.alpha = var_100_12
				end
			end

			if arg_97_1.time_ >= var_100_8 + var_100_10 and arg_97_1.time_ < var_100_8 + var_100_10 + arg_100_0 and arg_97_1.var_.characterEffect1038 then
				arg_97_1.var_.characterEffect1038.alpha = 1
			end

			local var_100_13 = arg_97_1.actors_["1038"]
			local var_100_14 = 0

			if var_100_14 < arg_97_1.time_ and arg_97_1.time_ <= var_100_14 + arg_100_0 and arg_97_1.var_.actorSpriteComps1038 == nil then
				arg_97_1.var_.actorSpriteComps1038 = var_100_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_100_15 = 0.2

			if var_100_14 <= arg_97_1.time_ and arg_97_1.time_ < var_100_14 + var_100_15 then
				local var_100_16 = (arg_97_1.time_ - var_100_14) / var_100_15

				if arg_97_1.var_.actorSpriteComps1038 then
					for iter_100_1, iter_100_2 in pairs(arg_97_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_100_2 then
							local var_100_17 = Mathf.Lerp(iter_100_2.color.r, 1, var_100_16)

							iter_100_2.color = Color.New(var_100_17, var_100_17, var_100_17)
						end
					end
				end
			end

			if arg_97_1.time_ >= var_100_14 + var_100_15 and arg_97_1.time_ < var_100_14 + var_100_15 + arg_100_0 and arg_97_1.var_.actorSpriteComps1038 then
				local var_100_18 = 1

				for iter_100_3, iter_100_4 in pairs(arg_97_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_100_4 then
						iter_100_4.color = Color.New(var_100_18, var_100_18, var_100_18)
					end
				end

				arg_97_1.var_.actorSpriteComps1038 = nil
			end

			local var_100_19 = 0
			local var_100_20 = 0.125

			if var_100_19 < arg_97_1.time_ and arg_97_1.time_ <= var_100_19 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_21 = arg_97_1:FormatText(StoryNameCfg[94].name)

				arg_97_1.leftNameTxt_.text = var_100_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_22 = arg_97_1:GetWordFromCfg(115301025)
				local var_100_23 = arg_97_1:FormatText(var_100_22.content)

				arg_97_1.text_.text = var_100_23

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_24 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301025", "story_v_out_115301.awb") ~= 0 then
					local var_100_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301025", "story_v_out_115301.awb") / 1000

					if var_100_27 + var_100_19 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_27 + var_100_19
					end

					if var_100_22.prefab_name ~= "" and arg_97_1.actors_[var_100_22.prefab_name] ~= nil then
						local var_100_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_22.prefab_name].transform, "story_v_out_115301", "115301025", "story_v_out_115301.awb")

						arg_97_1:RecordAudio("115301025", var_100_28)
						arg_97_1:RecordAudio("115301025", var_100_28)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_115301", "115301025", "story_v_out_115301.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_115301", "115301025", "story_v_out_115301.awb")
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
	Play115301026 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 115301026
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play115301027(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1038"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				local var_104_2 = var_104_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_104_2 then
					arg_101_1.var_.alphaOldValue1038 = var_104_2.alpha
					arg_101_1.var_.characterEffect1038 = var_104_2
				end

				arg_101_1.var_.alphaOldValue1038 = 1
			end

			local var_104_3 = 0.333333333333333

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_3 then
				local var_104_4 = (arg_101_1.time_ - var_104_1) / var_104_3
				local var_104_5 = Mathf.Lerp(arg_101_1.var_.alphaOldValue1038, 0, var_104_4)

				if arg_101_1.var_.characterEffect1038 then
					arg_101_1.var_.characterEffect1038.alpha = var_104_5
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_3 and arg_101_1.time_ < var_104_1 + var_104_3 + arg_104_0 and arg_101_1.var_.characterEffect1038 then
				arg_101_1.var_.characterEffect1038.alpha = 0
			end

			local var_104_6 = 0
			local var_104_7 = 1.675

			if var_104_6 < arg_101_1.time_ and arg_101_1.time_ <= var_104_6 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, false)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_8 = arg_101_1:GetWordFromCfg(115301026)
				local var_104_9 = arg_101_1:FormatText(var_104_8.content)

				arg_101_1.text_.text = var_104_9

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_10 = 67
				local var_104_11 = utf8.len(var_104_9)
				local var_104_12 = var_104_10 <= 0 and var_104_7 or var_104_7 * (var_104_11 / var_104_10)

				if var_104_12 > 0 and var_104_7 < var_104_12 then
					arg_101_1.talkMaxDuration = var_104_12

					if var_104_12 + var_104_6 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_12 + var_104_6
					end
				end

				arg_101_1.text_.text = var_104_9
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)
				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_13 = math.max(var_104_7, arg_101_1.talkMaxDuration)

			if var_104_6 <= arg_101_1.time_ and arg_101_1.time_ < var_104_6 + var_104_13 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_6) / var_104_13

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_6 + var_104_13 and arg_101_1.time_ < var_104_6 + var_104_13 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play115301027 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 115301027
		arg_105_1.duration_ = 8.733

		local var_105_0 = {
			ja = 5.066,
			ko = 7.4,
			zh = 8.733,
			en = 5.433
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
				arg_105_0:Play115301028(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["10030"].transform
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1.var_.moveOldPos10030 = var_108_0.localPosition
				var_108_0.localScale = Vector3.New(1, 1, 1)

				arg_105_1:CheckSpriteTmpPos("10030", 3)

				local var_108_2 = var_108_0.childCount

				for iter_108_0 = 0, var_108_2 - 1 do
					local var_108_3 = var_108_0:GetChild(iter_108_0)

					if var_108_3.name == "split_3" or not string.find(var_108_3.name, "split") then
						var_108_3.gameObject:SetActive(true)
					else
						var_108_3.gameObject:SetActive(false)
					end
				end
			end

			local var_108_4 = 0.001

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_4 then
				local var_108_5 = (arg_105_1.time_ - var_108_1) / var_108_4
				local var_108_6 = Vector3.New(0, -390, 150)

				var_108_0.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos10030, var_108_6, var_108_5)
			end

			if arg_105_1.time_ >= var_108_1 + var_108_4 and arg_105_1.time_ < var_108_1 + var_108_4 + arg_108_0 then
				var_108_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_108_7 = arg_105_1.actors_["10030"]
			local var_108_8 = 0

			if var_108_8 < arg_105_1.time_ and arg_105_1.time_ <= var_108_8 + arg_108_0 and arg_105_1.var_.actorSpriteComps10030 == nil then
				arg_105_1.var_.actorSpriteComps10030 = var_108_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_108_9 = 0.2

			if var_108_8 <= arg_105_1.time_ and arg_105_1.time_ < var_108_8 + var_108_9 then
				local var_108_10 = (arg_105_1.time_ - var_108_8) / var_108_9

				if arg_105_1.var_.actorSpriteComps10030 then
					for iter_108_1, iter_108_2 in pairs(arg_105_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_108_2 then
							local var_108_11 = Mathf.Lerp(iter_108_2.color.r, 1, var_108_10)

							iter_108_2.color = Color.New(var_108_11, var_108_11, var_108_11)
						end
					end
				end
			end

			if arg_105_1.time_ >= var_108_8 + var_108_9 and arg_105_1.time_ < var_108_8 + var_108_9 + arg_108_0 and arg_105_1.var_.actorSpriteComps10030 then
				local var_108_12 = 1

				for iter_108_3, iter_108_4 in pairs(arg_105_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_108_4 then
						iter_108_4.color = Color.New(var_108_12, var_108_12, var_108_12)
					end
				end

				arg_105_1.var_.actorSpriteComps10030 = nil
			end

			local var_108_13 = arg_105_1.actors_["10030"]
			local var_108_14 = 0

			if var_108_14 < arg_105_1.time_ and arg_105_1.time_ <= var_108_14 + arg_108_0 then
				local var_108_15 = var_108_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_108_15 then
					arg_105_1.var_.alphaOldValue10030 = var_108_15.alpha
					arg_105_1.var_.characterEffect10030 = var_108_15
				end

				arg_105_1.var_.alphaOldValue10030 = 0
			end

			local var_108_16 = 0.333333333333333

			if var_108_14 <= arg_105_1.time_ and arg_105_1.time_ < var_108_14 + var_108_16 then
				local var_108_17 = (arg_105_1.time_ - var_108_14) / var_108_16
				local var_108_18 = Mathf.Lerp(arg_105_1.var_.alphaOldValue10030, 1, var_108_17)

				if arg_105_1.var_.characterEffect10030 then
					arg_105_1.var_.characterEffect10030.alpha = var_108_18
				end
			end

			if arg_105_1.time_ >= var_108_14 + var_108_16 and arg_105_1.time_ < var_108_14 + var_108_16 + arg_108_0 and arg_105_1.var_.characterEffect10030 then
				arg_105_1.var_.characterEffect10030.alpha = 1
			end

			local var_108_19 = 0
			local var_108_20 = 0.65

			if var_108_19 < arg_105_1.time_ and arg_105_1.time_ <= var_108_19 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_21 = arg_105_1:FormatText(StoryNameCfg[309].name)

				arg_105_1.leftNameTxt_.text = var_108_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_22 = arg_105_1:GetWordFromCfg(115301027)
				local var_108_23 = arg_105_1:FormatText(var_108_22.content)

				arg_105_1.text_.text = var_108_23

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_24 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301027", "story_v_out_115301.awb") ~= 0 then
					local var_108_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301027", "story_v_out_115301.awb") / 1000

					if var_108_27 + var_108_19 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_27 + var_108_19
					end

					if var_108_22.prefab_name ~= "" and arg_105_1.actors_[var_108_22.prefab_name] ~= nil then
						local var_108_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_22.prefab_name].transform, "story_v_out_115301", "115301027", "story_v_out_115301.awb")

						arg_105_1:RecordAudio("115301027", var_108_28)
						arg_105_1:RecordAudio("115301027", var_108_28)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_115301", "115301027", "story_v_out_115301.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_115301", "115301027", "story_v_out_115301.awb")
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
	Play115301028 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 115301028
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play115301029(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["10030"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.actorSpriteComps10030 == nil then
				arg_109_1.var_.actorSpriteComps10030 = var_112_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_112_2 = 0.2

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.actorSpriteComps10030 then
					for iter_112_0, iter_112_1 in pairs(arg_109_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_112_1 then
							local var_112_4 = Mathf.Lerp(iter_112_1.color.r, 0.5, var_112_3)

							iter_112_1.color = Color.New(var_112_4, var_112_4, var_112_4)
						end
					end
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.actorSpriteComps10030 then
				local var_112_5 = 0.5

				for iter_112_2, iter_112_3 in pairs(arg_109_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_112_3 then
						iter_112_3.color = Color.New(var_112_5, var_112_5, var_112_5)
					end
				end

				arg_109_1.var_.actorSpriteComps10030 = nil
			end

			local var_112_6 = 0
			local var_112_7 = 0.5

			if var_112_6 < arg_109_1.time_ and arg_109_1.time_ <= var_112_6 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, false)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_8 = arg_109_1:GetWordFromCfg(115301028)
				local var_112_9 = arg_109_1:FormatText(var_112_8.content)

				arg_109_1.text_.text = var_112_9

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_10 = 20
				local var_112_11 = utf8.len(var_112_9)
				local var_112_12 = var_112_10 <= 0 and var_112_7 or var_112_7 * (var_112_11 / var_112_10)

				if var_112_12 > 0 and var_112_7 < var_112_12 then
					arg_109_1.talkMaxDuration = var_112_12

					if var_112_12 + var_112_6 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_12 + var_112_6
					end
				end

				arg_109_1.text_.text = var_112_9
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)
				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_13 = math.max(var_112_7, arg_109_1.talkMaxDuration)

			if var_112_6 <= arg_109_1.time_ and arg_109_1.time_ < var_112_6 + var_112_13 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_6) / var_112_13

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_6 + var_112_13 and arg_109_1.time_ < var_112_6 + var_112_13 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play115301029 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 115301029
		arg_113_1.duration_ = 13.366

		local var_113_0 = {
			ja = 13.366,
			ko = 8.9,
			zh = 11.7,
			en = 9.1
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
				arg_113_0:Play115301030(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1038"].transform
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 then
				arg_113_1.var_.moveOldPos1038 = var_116_0.localPosition
				var_116_0.localScale = Vector3.New(1, 1, 1)

				arg_113_1:CheckSpriteTmpPos("1038", 2)

				local var_116_2 = var_116_0.childCount

				for iter_116_0 = 0, var_116_2 - 1 do
					local var_116_3 = var_116_0:GetChild(iter_116_0)

					if var_116_3.name == "split_1" or not string.find(var_116_3.name, "split") then
						var_116_3.gameObject:SetActive(true)
					else
						var_116_3.gameObject:SetActive(false)
					end
				end
			end

			local var_116_4 = 0.001

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_4 then
				local var_116_5 = (arg_113_1.time_ - var_116_1) / var_116_4
				local var_116_6 = Vector3.New(-390, -400, 0)

				var_116_0.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1038, var_116_6, var_116_5)
			end

			if arg_113_1.time_ >= var_116_1 + var_116_4 and arg_113_1.time_ < var_116_1 + var_116_4 + arg_116_0 then
				var_116_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_116_7 = arg_113_1.actors_["10030"].transform
			local var_116_8 = 0

			if var_116_8 < arg_113_1.time_ and arg_113_1.time_ <= var_116_8 + arg_116_0 then
				arg_113_1.var_.moveOldPos10030 = var_116_7.localPosition
				var_116_7.localScale = Vector3.New(1, 1, 1)

				arg_113_1:CheckSpriteTmpPos("10030", 4)

				local var_116_9 = var_116_7.childCount

				for iter_116_1 = 0, var_116_9 - 1 do
					local var_116_10 = var_116_7:GetChild(iter_116_1)

					if var_116_10.name == "split_3" or not string.find(var_116_10.name, "split") then
						var_116_10.gameObject:SetActive(true)
					else
						var_116_10.gameObject:SetActive(false)
					end
				end
			end

			local var_116_11 = 0.001

			if var_116_8 <= arg_113_1.time_ and arg_113_1.time_ < var_116_8 + var_116_11 then
				local var_116_12 = (arg_113_1.time_ - var_116_8) / var_116_11
				local var_116_13 = Vector3.New(390, -390, 150)

				var_116_7.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos10030, var_116_13, var_116_12)
			end

			if arg_113_1.time_ >= var_116_8 + var_116_11 and arg_113_1.time_ < var_116_8 + var_116_11 + arg_116_0 then
				var_116_7.localPosition = Vector3.New(390, -390, 150)
			end

			local var_116_14 = arg_113_1.actors_["1038"]
			local var_116_15 = 0

			if var_116_15 < arg_113_1.time_ and arg_113_1.time_ <= var_116_15 + arg_116_0 then
				local var_116_16 = var_116_14:GetComponentInChildren(typeof(CanvasGroup))

				if var_116_16 then
					arg_113_1.var_.alphaOldValue1038 = var_116_16.alpha
					arg_113_1.var_.characterEffect1038 = var_116_16
				end

				arg_113_1.var_.alphaOldValue1038 = 0
			end

			local var_116_17 = 0.333333333333333

			if var_116_15 <= arg_113_1.time_ and arg_113_1.time_ < var_116_15 + var_116_17 then
				local var_116_18 = (arg_113_1.time_ - var_116_15) / var_116_17
				local var_116_19 = Mathf.Lerp(arg_113_1.var_.alphaOldValue1038, 1, var_116_18)

				if arg_113_1.var_.characterEffect1038 then
					arg_113_1.var_.characterEffect1038.alpha = var_116_19
				end
			end

			if arg_113_1.time_ >= var_116_15 + var_116_17 and arg_113_1.time_ < var_116_15 + var_116_17 + arg_116_0 and arg_113_1.var_.characterEffect1038 then
				arg_113_1.var_.characterEffect1038.alpha = 1
			end

			local var_116_20 = arg_113_1.actors_["1038"]
			local var_116_21 = 0

			if var_116_21 < arg_113_1.time_ and arg_113_1.time_ <= var_116_21 + arg_116_0 and arg_113_1.var_.actorSpriteComps1038 == nil then
				arg_113_1.var_.actorSpriteComps1038 = var_116_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_116_22 = 0.2

			if var_116_21 <= arg_113_1.time_ and arg_113_1.time_ < var_116_21 + var_116_22 then
				local var_116_23 = (arg_113_1.time_ - var_116_21) / var_116_22

				if arg_113_1.var_.actorSpriteComps1038 then
					for iter_116_2, iter_116_3 in pairs(arg_113_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_116_3 then
							local var_116_24 = Mathf.Lerp(iter_116_3.color.r, 1, var_116_23)

							iter_116_3.color = Color.New(var_116_24, var_116_24, var_116_24)
						end
					end
				end
			end

			if arg_113_1.time_ >= var_116_21 + var_116_22 and arg_113_1.time_ < var_116_21 + var_116_22 + arg_116_0 and arg_113_1.var_.actorSpriteComps1038 then
				local var_116_25 = 1

				for iter_116_4, iter_116_5 in pairs(arg_113_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_116_5 then
						iter_116_5.color = Color.New(var_116_25, var_116_25, var_116_25)
					end
				end

				arg_113_1.var_.actorSpriteComps1038 = nil
			end

			local var_116_26 = 0
			local var_116_27 = 1.125

			if var_116_26 < arg_113_1.time_ and arg_113_1.time_ <= var_116_26 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_28 = arg_113_1:FormatText(StoryNameCfg[94].name)

				arg_113_1.leftNameTxt_.text = var_116_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_29 = arg_113_1:GetWordFromCfg(115301029)
				local var_116_30 = arg_113_1:FormatText(var_116_29.content)

				arg_113_1.text_.text = var_116_30

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_31 = 45
				local var_116_32 = utf8.len(var_116_30)
				local var_116_33 = var_116_31 <= 0 and var_116_27 or var_116_27 * (var_116_32 / var_116_31)

				if var_116_33 > 0 and var_116_27 < var_116_33 then
					arg_113_1.talkMaxDuration = var_116_33

					if var_116_33 + var_116_26 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_33 + var_116_26
					end
				end

				arg_113_1.text_.text = var_116_30
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301029", "story_v_out_115301.awb") ~= 0 then
					local var_116_34 = manager.audio:GetVoiceLength("story_v_out_115301", "115301029", "story_v_out_115301.awb") / 1000

					if var_116_34 + var_116_26 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_34 + var_116_26
					end

					if var_116_29.prefab_name ~= "" and arg_113_1.actors_[var_116_29.prefab_name] ~= nil then
						local var_116_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_29.prefab_name].transform, "story_v_out_115301", "115301029", "story_v_out_115301.awb")

						arg_113_1:RecordAudio("115301029", var_116_35)
						arg_113_1:RecordAudio("115301029", var_116_35)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_115301", "115301029", "story_v_out_115301.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_115301", "115301029", "story_v_out_115301.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_36 = math.max(var_116_27, arg_113_1.talkMaxDuration)

			if var_116_26 <= arg_113_1.time_ and arg_113_1.time_ < var_116_26 + var_116_36 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_26) / var_116_36

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_26 + var_116_36 and arg_113_1.time_ < var_116_26 + var_116_36 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play115301030 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 115301030
		arg_117_1.duration_ = 16.6

		local var_117_0 = {
			ja = 16.6,
			ko = 12.066,
			zh = 12.6,
			en = 10.333
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
				arg_117_0:Play115301031(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1038"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos1038 = var_120_0.localPosition
				var_120_0.localScale = Vector3.New(1, 1, 1)

				arg_117_1:CheckSpriteTmpPos("1038", 2)

				local var_120_2 = var_120_0.childCount

				for iter_120_0 = 0, var_120_2 - 1 do
					local var_120_3 = var_120_0:GetChild(iter_120_0)

					if var_120_3.name == "split_9" or not string.find(var_120_3.name, "split") then
						var_120_3.gameObject:SetActive(true)
					else
						var_120_3.gameObject:SetActive(false)
					end
				end
			end

			local var_120_4 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_4 then
				local var_120_5 = (arg_117_1.time_ - var_120_1) / var_120_4
				local var_120_6 = Vector3.New(-390, -400, 0)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1038, var_120_6, var_120_5)
			end

			if arg_117_1.time_ >= var_120_1 + var_120_4 and arg_117_1.time_ < var_120_1 + var_120_4 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_120_7 = 0
			local var_120_8 = 1.1

			if var_120_7 < arg_117_1.time_ and arg_117_1.time_ <= var_120_7 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_9 = arg_117_1:FormatText(StoryNameCfg[94].name)

				arg_117_1.leftNameTxt_.text = var_120_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_10 = arg_117_1:GetWordFromCfg(115301030)
				local var_120_11 = arg_117_1:FormatText(var_120_10.content)

				arg_117_1.text_.text = var_120_11

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_12 = 44
				local var_120_13 = utf8.len(var_120_11)
				local var_120_14 = var_120_12 <= 0 and var_120_8 or var_120_8 * (var_120_13 / var_120_12)

				if var_120_14 > 0 and var_120_8 < var_120_14 then
					arg_117_1.talkMaxDuration = var_120_14

					if var_120_14 + var_120_7 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_14 + var_120_7
					end
				end

				arg_117_1.text_.text = var_120_11
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301030", "story_v_out_115301.awb") ~= 0 then
					local var_120_15 = manager.audio:GetVoiceLength("story_v_out_115301", "115301030", "story_v_out_115301.awb") / 1000

					if var_120_15 + var_120_7 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_15 + var_120_7
					end

					if var_120_10.prefab_name ~= "" and arg_117_1.actors_[var_120_10.prefab_name] ~= nil then
						local var_120_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_10.prefab_name].transform, "story_v_out_115301", "115301030", "story_v_out_115301.awb")

						arg_117_1:RecordAudio("115301030", var_120_16)
						arg_117_1:RecordAudio("115301030", var_120_16)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_115301", "115301030", "story_v_out_115301.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_115301", "115301030", "story_v_out_115301.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_17 = math.max(var_120_8, arg_117_1.talkMaxDuration)

			if var_120_7 <= arg_117_1.time_ and arg_117_1.time_ < var_120_7 + var_120_17 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_7) / var_120_17

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_7 + var_120_17 and arg_117_1.time_ < var_120_7 + var_120_17 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play115301031 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 115301031
		arg_121_1.duration_ = 5

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play115301032(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1038"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 and arg_121_1.var_.actorSpriteComps1038 == nil then
				arg_121_1.var_.actorSpriteComps1038 = var_124_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_124_2 = 0.2

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2

				if arg_121_1.var_.actorSpriteComps1038 then
					for iter_124_0, iter_124_1 in pairs(arg_121_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_124_1 then
							local var_124_4 = Mathf.Lerp(iter_124_1.color.r, 0.5, var_124_3)

							iter_124_1.color = Color.New(var_124_4, var_124_4, var_124_4)
						end
					end
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and arg_121_1.var_.actorSpriteComps1038 then
				local var_124_5 = 0.5

				for iter_124_2, iter_124_3 in pairs(arg_121_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_124_3 then
						iter_124_3.color = Color.New(var_124_5, var_124_5, var_124_5)
					end
				end

				arg_121_1.var_.actorSpriteComps1038 = nil
			end

			local var_124_6 = 0
			local var_124_7 = 0.775

			if var_124_6 < arg_121_1.time_ and arg_121_1.time_ <= var_124_6 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, false)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_8 = arg_121_1:GetWordFromCfg(115301031)
				local var_124_9 = arg_121_1:FormatText(var_124_8.content)

				arg_121_1.text_.text = var_124_9

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_10 = 31
				local var_124_11 = utf8.len(var_124_9)
				local var_124_12 = var_124_10 <= 0 and var_124_7 or var_124_7 * (var_124_11 / var_124_10)

				if var_124_12 > 0 and var_124_7 < var_124_12 then
					arg_121_1.talkMaxDuration = var_124_12

					if var_124_12 + var_124_6 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_12 + var_124_6
					end
				end

				arg_121_1.text_.text = var_124_9
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_13 = math.max(var_124_7, arg_121_1.talkMaxDuration)

			if var_124_6 <= arg_121_1.time_ and arg_121_1.time_ < var_124_6 + var_124_13 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_6) / var_124_13

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_6 + var_124_13 and arg_121_1.time_ < var_124_6 + var_124_13 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play115301032 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 115301032
		arg_125_1.duration_ = 3.933

		local var_125_0 = {
			ja = 3.3,
			ko = 3.933,
			zh = 3.133,
			en = 3.433
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
				arg_125_0:Play115301033(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["10030"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos10030 = var_128_0.localPosition
				var_128_0.localScale = Vector3.New(1, 1, 1)

				arg_125_1:CheckSpriteTmpPos("10030", 4)

				local var_128_2 = var_128_0.childCount

				for iter_128_0 = 0, var_128_2 - 1 do
					local var_128_3 = var_128_0:GetChild(iter_128_0)

					if var_128_3.name == "split_5" or not string.find(var_128_3.name, "split") then
						var_128_3.gameObject:SetActive(true)
					else
						var_128_3.gameObject:SetActive(false)
					end
				end
			end

			local var_128_4 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_4 then
				local var_128_5 = (arg_125_1.time_ - var_128_1) / var_128_4
				local var_128_6 = Vector3.New(390, -390, 150)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos10030, var_128_6, var_128_5)
			end

			if arg_125_1.time_ >= var_128_1 + var_128_4 and arg_125_1.time_ < var_128_1 + var_128_4 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_128_7 = arg_125_1.actors_["10030"]
			local var_128_8 = 0

			if var_128_8 < arg_125_1.time_ and arg_125_1.time_ <= var_128_8 + arg_128_0 and arg_125_1.var_.actorSpriteComps10030 == nil then
				arg_125_1.var_.actorSpriteComps10030 = var_128_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_128_9 = 0.2

			if var_128_8 <= arg_125_1.time_ and arg_125_1.time_ < var_128_8 + var_128_9 then
				local var_128_10 = (arg_125_1.time_ - var_128_8) / var_128_9

				if arg_125_1.var_.actorSpriteComps10030 then
					for iter_128_1, iter_128_2 in pairs(arg_125_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_128_2 then
							local var_128_11 = Mathf.Lerp(iter_128_2.color.r, 1, var_128_10)

							iter_128_2.color = Color.New(var_128_11, var_128_11, var_128_11)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_8 + var_128_9 and arg_125_1.time_ < var_128_8 + var_128_9 + arg_128_0 and arg_125_1.var_.actorSpriteComps10030 then
				local var_128_12 = 1

				for iter_128_3, iter_128_4 in pairs(arg_125_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_128_4 then
						iter_128_4.color = Color.New(var_128_12, var_128_12, var_128_12)
					end
				end

				arg_125_1.var_.actorSpriteComps10030 = nil
			end

			local var_128_13 = arg_125_1.actors_["10030"]
			local var_128_14 = 0

			if var_128_14 < arg_125_1.time_ and arg_125_1.time_ <= var_128_14 + arg_128_0 then
				local var_128_15 = var_128_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_128_15 then
					arg_125_1.var_.alphaOldValue10030 = var_128_15.alpha
					arg_125_1.var_.characterEffect10030 = var_128_15
				end

				arg_125_1.var_.alphaOldValue10030 = 0
			end

			local var_128_16 = 0.0166666666666667

			if var_128_14 <= arg_125_1.time_ and arg_125_1.time_ < var_128_14 + var_128_16 then
				local var_128_17 = (arg_125_1.time_ - var_128_14) / var_128_16
				local var_128_18 = Mathf.Lerp(arg_125_1.var_.alphaOldValue10030, 1, var_128_17)

				if arg_125_1.var_.characterEffect10030 then
					arg_125_1.var_.characterEffect10030.alpha = var_128_18
				end
			end

			if arg_125_1.time_ >= var_128_14 + var_128_16 and arg_125_1.time_ < var_128_14 + var_128_16 + arg_128_0 and arg_125_1.var_.characterEffect10030 then
				arg_125_1.var_.characterEffect10030.alpha = 1
			end

			local var_128_19 = 0
			local var_128_20 = 0.475

			if var_128_19 < arg_125_1.time_ and arg_125_1.time_ <= var_128_19 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_21 = arg_125_1:FormatText(StoryNameCfg[309].name)

				arg_125_1.leftNameTxt_.text = var_128_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_22 = arg_125_1:GetWordFromCfg(115301032)
				local var_128_23 = arg_125_1:FormatText(var_128_22.content)

				arg_125_1.text_.text = var_128_23

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_24 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301032", "story_v_out_115301.awb") ~= 0 then
					local var_128_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301032", "story_v_out_115301.awb") / 1000

					if var_128_27 + var_128_19 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_27 + var_128_19
					end

					if var_128_22.prefab_name ~= "" and arg_125_1.actors_[var_128_22.prefab_name] ~= nil then
						local var_128_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_22.prefab_name].transform, "story_v_out_115301", "115301032", "story_v_out_115301.awb")

						arg_125_1:RecordAudio("115301032", var_128_28)
						arg_125_1:RecordAudio("115301032", var_128_28)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_115301", "115301032", "story_v_out_115301.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_115301", "115301032", "story_v_out_115301.awb")
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
	Play115301033 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 115301033
		arg_129_1.duration_ = 6.6

		local var_129_0 = {
			ja = 4.633,
			ko = 6.6,
			zh = 6.366,
			en = 6.266
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
				arg_129_0:Play115301034(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["10030"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos10030 = var_132_0.localPosition
				var_132_0.localScale = Vector3.New(1, 1, 1)

				arg_129_1:CheckSpriteTmpPos("10030", 4)

				local var_132_2 = var_132_0.childCount

				for iter_132_0 = 0, var_132_2 - 1 do
					local var_132_3 = var_132_0:GetChild(iter_132_0)

					if var_132_3.name == "split_5" or not string.find(var_132_3.name, "split") then
						var_132_3.gameObject:SetActive(true)
					else
						var_132_3.gameObject:SetActive(false)
					end
				end
			end

			local var_132_4 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_4 then
				local var_132_5 = (arg_129_1.time_ - var_132_1) / var_132_4
				local var_132_6 = Vector3.New(390, -390, 150)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos10030, var_132_6, var_132_5)
			end

			if arg_129_1.time_ >= var_132_1 + var_132_4 and arg_129_1.time_ < var_132_1 + var_132_4 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_132_7 = 0
			local var_132_8 = 0.65

			if var_132_7 < arg_129_1.time_ and arg_129_1.time_ <= var_132_7 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_9 = arg_129_1:FormatText(StoryNameCfg[309].name)

				arg_129_1.leftNameTxt_.text = var_132_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_10 = arg_129_1:GetWordFromCfg(115301033)
				local var_132_11 = arg_129_1:FormatText(var_132_10.content)

				arg_129_1.text_.text = var_132_11

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_12 = 26
				local var_132_13 = utf8.len(var_132_11)
				local var_132_14 = var_132_12 <= 0 and var_132_8 or var_132_8 * (var_132_13 / var_132_12)

				if var_132_14 > 0 and var_132_8 < var_132_14 then
					arg_129_1.talkMaxDuration = var_132_14

					if var_132_14 + var_132_7 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_14 + var_132_7
					end
				end

				arg_129_1.text_.text = var_132_11
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301033", "story_v_out_115301.awb") ~= 0 then
					local var_132_15 = manager.audio:GetVoiceLength("story_v_out_115301", "115301033", "story_v_out_115301.awb") / 1000

					if var_132_15 + var_132_7 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_15 + var_132_7
					end

					if var_132_10.prefab_name ~= "" and arg_129_1.actors_[var_132_10.prefab_name] ~= nil then
						local var_132_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_10.prefab_name].transform, "story_v_out_115301", "115301033", "story_v_out_115301.awb")

						arg_129_1:RecordAudio("115301033", var_132_16)
						arg_129_1:RecordAudio("115301033", var_132_16)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_115301", "115301033", "story_v_out_115301.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_115301", "115301033", "story_v_out_115301.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_17 = math.max(var_132_8, arg_129_1.talkMaxDuration)

			if var_132_7 <= arg_129_1.time_ and arg_129_1.time_ < var_132_7 + var_132_17 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_7) / var_132_17

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_7 + var_132_17 and arg_129_1.time_ < var_132_7 + var_132_17 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play115301034 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 115301034
		arg_133_1.duration_ = 6.733

		local var_133_0 = {
			ja = 6.733,
			ko = 4.166,
			zh = 5.366,
			en = 4
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
				arg_133_0:Play115301035(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1038"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos1038 = var_136_0.localPosition
				var_136_0.localScale = Vector3.New(1, 1, 1)

				arg_133_1:CheckSpriteTmpPos("1038", 2)

				local var_136_2 = var_136_0.childCount

				for iter_136_0 = 0, var_136_2 - 1 do
					local var_136_3 = var_136_0:GetChild(iter_136_0)

					if var_136_3.name == "split_1" or not string.find(var_136_3.name, "split") then
						var_136_3.gameObject:SetActive(true)
					else
						var_136_3.gameObject:SetActive(false)
					end
				end
			end

			local var_136_4 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_4 then
				local var_136_5 = (arg_133_1.time_ - var_136_1) / var_136_4
				local var_136_6 = Vector3.New(-390, -400, 0)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1038, var_136_6, var_136_5)
			end

			if arg_133_1.time_ >= var_136_1 + var_136_4 and arg_133_1.time_ < var_136_1 + var_136_4 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_136_7 = arg_133_1.actors_["10030"]
			local var_136_8 = 0

			if var_136_8 < arg_133_1.time_ and arg_133_1.time_ <= var_136_8 + arg_136_0 and arg_133_1.var_.actorSpriteComps10030 == nil then
				arg_133_1.var_.actorSpriteComps10030 = var_136_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_136_9 = 0.2

			if var_136_8 <= arg_133_1.time_ and arg_133_1.time_ < var_136_8 + var_136_9 then
				local var_136_10 = (arg_133_1.time_ - var_136_8) / var_136_9

				if arg_133_1.var_.actorSpriteComps10030 then
					for iter_136_1, iter_136_2 in pairs(arg_133_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_136_2 then
							local var_136_11 = Mathf.Lerp(iter_136_2.color.r, 0.5, var_136_10)

							iter_136_2.color = Color.New(var_136_11, var_136_11, var_136_11)
						end
					end
				end
			end

			if arg_133_1.time_ >= var_136_8 + var_136_9 and arg_133_1.time_ < var_136_8 + var_136_9 + arg_136_0 and arg_133_1.var_.actorSpriteComps10030 then
				local var_136_12 = 0.5

				for iter_136_3, iter_136_4 in pairs(arg_133_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_136_4 then
						iter_136_4.color = Color.New(var_136_12, var_136_12, var_136_12)
					end
				end

				arg_133_1.var_.actorSpriteComps10030 = nil
			end

			local var_136_13 = 0
			local var_136_14 = 0.55

			if var_136_13 < arg_133_1.time_ and arg_133_1.time_ <= var_136_13 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_15 = arg_133_1:FormatText(StoryNameCfg[94].name)

				arg_133_1.leftNameTxt_.text = var_136_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_16 = arg_133_1:GetWordFromCfg(115301034)
				local var_136_17 = arg_133_1:FormatText(var_136_16.content)

				arg_133_1.text_.text = var_136_17

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_18 = 22
				local var_136_19 = utf8.len(var_136_17)
				local var_136_20 = var_136_18 <= 0 and var_136_14 or var_136_14 * (var_136_19 / var_136_18)

				if var_136_20 > 0 and var_136_14 < var_136_20 then
					arg_133_1.talkMaxDuration = var_136_20

					if var_136_20 + var_136_13 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_20 + var_136_13
					end
				end

				arg_133_1.text_.text = var_136_17
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301034", "story_v_out_115301.awb") ~= 0 then
					local var_136_21 = manager.audio:GetVoiceLength("story_v_out_115301", "115301034", "story_v_out_115301.awb") / 1000

					if var_136_21 + var_136_13 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_21 + var_136_13
					end

					if var_136_16.prefab_name ~= "" and arg_133_1.actors_[var_136_16.prefab_name] ~= nil then
						local var_136_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_16.prefab_name].transform, "story_v_out_115301", "115301034", "story_v_out_115301.awb")

						arg_133_1:RecordAudio("115301034", var_136_22)
						arg_133_1:RecordAudio("115301034", var_136_22)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_115301", "115301034", "story_v_out_115301.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_115301", "115301034", "story_v_out_115301.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_23 = math.max(var_136_14, arg_133_1.talkMaxDuration)

			if var_136_13 <= arg_133_1.time_ and arg_133_1.time_ < var_136_13 + var_136_23 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_13) / var_136_23

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_13 + var_136_23 and arg_133_1.time_ < var_136_13 + var_136_23 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play115301035 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 115301035
		arg_137_1.duration_ = 4.166

		local var_137_0 = {
			ja = 2.3,
			ko = 4.166,
			zh = 2.3,
			en = 1.533
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
				arg_137_0:Play115301036(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["10030"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.actorSpriteComps10030 == nil then
				arg_137_1.var_.actorSpriteComps10030 = var_140_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_140_2 = 0.2

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.actorSpriteComps10030 then
					for iter_140_0, iter_140_1 in pairs(arg_137_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_140_1 then
							local var_140_4 = Mathf.Lerp(iter_140_1.color.r, 1, var_140_3)

							iter_140_1.color = Color.New(var_140_4, var_140_4, var_140_4)
						end
					end
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.actorSpriteComps10030 then
				local var_140_5 = 1

				for iter_140_2, iter_140_3 in pairs(arg_137_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_140_3 then
						iter_140_3.color = Color.New(var_140_5, var_140_5, var_140_5)
					end
				end

				arg_137_1.var_.actorSpriteComps10030 = nil
			end

			local var_140_6 = arg_137_1.actors_["1038"]
			local var_140_7 = 0

			if var_140_7 < arg_137_1.time_ and arg_137_1.time_ <= var_140_7 + arg_140_0 and arg_137_1.var_.actorSpriteComps1038 == nil then
				arg_137_1.var_.actorSpriteComps1038 = var_140_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_140_8 = 0.2

			if var_140_7 <= arg_137_1.time_ and arg_137_1.time_ < var_140_7 + var_140_8 then
				local var_140_9 = (arg_137_1.time_ - var_140_7) / var_140_8

				if arg_137_1.var_.actorSpriteComps1038 then
					for iter_140_4, iter_140_5 in pairs(arg_137_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_140_5 then
							local var_140_10 = Mathf.Lerp(iter_140_5.color.r, 0.5, var_140_9)

							iter_140_5.color = Color.New(var_140_10, var_140_10, var_140_10)
						end
					end
				end
			end

			if arg_137_1.time_ >= var_140_7 + var_140_8 and arg_137_1.time_ < var_140_7 + var_140_8 + arg_140_0 and arg_137_1.var_.actorSpriteComps1038 then
				local var_140_11 = 0.5

				for iter_140_6, iter_140_7 in pairs(arg_137_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_140_7 then
						iter_140_7.color = Color.New(var_140_11, var_140_11, var_140_11)
					end
				end

				arg_137_1.var_.actorSpriteComps1038 = nil
			end

			local var_140_12 = arg_137_1.actors_["10030"].transform
			local var_140_13 = 0

			if var_140_13 < arg_137_1.time_ and arg_137_1.time_ <= var_140_13 + arg_140_0 then
				arg_137_1.var_.moveOldPos10030 = var_140_12.localPosition
				var_140_12.localScale = Vector3.New(1, 1, 1)

				arg_137_1:CheckSpriteTmpPos("10030", 4)

				local var_140_14 = var_140_12.childCount

				for iter_140_8 = 0, var_140_14 - 1 do
					local var_140_15 = var_140_12:GetChild(iter_140_8)

					if var_140_15.name == "split_1" or not string.find(var_140_15.name, "split") then
						var_140_15.gameObject:SetActive(true)
					else
						var_140_15.gameObject:SetActive(false)
					end
				end
			end

			local var_140_16 = 0.001

			if var_140_13 <= arg_137_1.time_ and arg_137_1.time_ < var_140_13 + var_140_16 then
				local var_140_17 = (arg_137_1.time_ - var_140_13) / var_140_16
				local var_140_18 = Vector3.New(390, -390, 150)

				var_140_12.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos10030, var_140_18, var_140_17)
			end

			if arg_137_1.time_ >= var_140_13 + var_140_16 and arg_137_1.time_ < var_140_13 + var_140_16 + arg_140_0 then
				var_140_12.localPosition = Vector3.New(390, -390, 150)
			end

			local var_140_19 = arg_137_1.actors_["10030"]
			local var_140_20 = 0

			if var_140_20 < arg_137_1.time_ and arg_137_1.time_ <= var_140_20 + arg_140_0 then
				local var_140_21 = var_140_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_140_21 then
					arg_137_1.var_.alphaOldValue10030 = var_140_21.alpha
					arg_137_1.var_.characterEffect10030 = var_140_21
				end

				arg_137_1.var_.alphaOldValue10030 = 0
			end

			local var_140_22 = 0.0166666666666667

			if var_140_20 <= arg_137_1.time_ and arg_137_1.time_ < var_140_20 + var_140_22 then
				local var_140_23 = (arg_137_1.time_ - var_140_20) / var_140_22
				local var_140_24 = Mathf.Lerp(arg_137_1.var_.alphaOldValue10030, 1, var_140_23)

				if arg_137_1.var_.characterEffect10030 then
					arg_137_1.var_.characterEffect10030.alpha = var_140_24
				end
			end

			if arg_137_1.time_ >= var_140_20 + var_140_22 and arg_137_1.time_ < var_140_20 + var_140_22 + arg_140_0 and arg_137_1.var_.characterEffect10030 then
				arg_137_1.var_.characterEffect10030.alpha = 1
			end

			local var_140_25 = 0
			local var_140_26 = 0.3

			if var_140_25 < arg_137_1.time_ and arg_137_1.time_ <= var_140_25 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_27 = arg_137_1:FormatText(StoryNameCfg[309].name)

				arg_137_1.leftNameTxt_.text = var_140_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_28 = arg_137_1:GetWordFromCfg(115301035)
				local var_140_29 = arg_137_1:FormatText(var_140_28.content)

				arg_137_1.text_.text = var_140_29

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_30 = 12
				local var_140_31 = utf8.len(var_140_29)
				local var_140_32 = var_140_30 <= 0 and var_140_26 or var_140_26 * (var_140_31 / var_140_30)

				if var_140_32 > 0 and var_140_26 < var_140_32 then
					arg_137_1.talkMaxDuration = var_140_32

					if var_140_32 + var_140_25 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_32 + var_140_25
					end
				end

				arg_137_1.text_.text = var_140_29
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301035", "story_v_out_115301.awb") ~= 0 then
					local var_140_33 = manager.audio:GetVoiceLength("story_v_out_115301", "115301035", "story_v_out_115301.awb") / 1000

					if var_140_33 + var_140_25 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_33 + var_140_25
					end

					if var_140_28.prefab_name ~= "" and arg_137_1.actors_[var_140_28.prefab_name] ~= nil then
						local var_140_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_28.prefab_name].transform, "story_v_out_115301", "115301035", "story_v_out_115301.awb")

						arg_137_1:RecordAudio("115301035", var_140_34)
						arg_137_1:RecordAudio("115301035", var_140_34)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_115301", "115301035", "story_v_out_115301.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_115301", "115301035", "story_v_out_115301.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_35 = math.max(var_140_26, arg_137_1.talkMaxDuration)

			if var_140_25 <= arg_137_1.time_ and arg_137_1.time_ < var_140_25 + var_140_35 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_25) / var_140_35

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_25 + var_140_35 and arg_137_1.time_ < var_140_25 + var_140_35 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play115301036 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 115301036
		arg_141_1.duration_ = 9.033

		local var_141_0 = {
			ja = 8.5,
			ko = 8.366,
			zh = 9.033,
			en = 7.733
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
				arg_141_0:Play115301037(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["10030"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and arg_141_1.var_.actorSpriteComps10030 == nil then
				arg_141_1.var_.actorSpriteComps10030 = var_144_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_144_2 = 0.2

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.actorSpriteComps10030 then
					for iter_144_0, iter_144_1 in pairs(arg_141_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_144_1 then
							local var_144_4 = Mathf.Lerp(iter_144_1.color.r, 0.5, var_144_3)

							iter_144_1.color = Color.New(var_144_4, var_144_4, var_144_4)
						end
					end
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and arg_141_1.var_.actorSpriteComps10030 then
				local var_144_5 = 0.5

				for iter_144_2, iter_144_3 in pairs(arg_141_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_144_3 then
						iter_144_3.color = Color.New(var_144_5, var_144_5, var_144_5)
					end
				end

				arg_141_1.var_.actorSpriteComps10030 = nil
			end

			local var_144_6 = arg_141_1.actors_["1038"]
			local var_144_7 = 0

			if var_144_7 < arg_141_1.time_ and arg_141_1.time_ <= var_144_7 + arg_144_0 and arg_141_1.var_.actorSpriteComps1038 == nil then
				arg_141_1.var_.actorSpriteComps1038 = var_144_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_144_8 = 0.2

			if var_144_7 <= arg_141_1.time_ and arg_141_1.time_ < var_144_7 + var_144_8 then
				local var_144_9 = (arg_141_1.time_ - var_144_7) / var_144_8

				if arg_141_1.var_.actorSpriteComps1038 then
					for iter_144_4, iter_144_5 in pairs(arg_141_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_144_5 then
							local var_144_10 = Mathf.Lerp(iter_144_5.color.r, 1, var_144_9)

							iter_144_5.color = Color.New(var_144_10, var_144_10, var_144_10)
						end
					end
				end
			end

			if arg_141_1.time_ >= var_144_7 + var_144_8 and arg_141_1.time_ < var_144_7 + var_144_8 + arg_144_0 and arg_141_1.var_.actorSpriteComps1038 then
				local var_144_11 = 1

				for iter_144_6, iter_144_7 in pairs(arg_141_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_144_7 then
						iter_144_7.color = Color.New(var_144_11, var_144_11, var_144_11)
					end
				end

				arg_141_1.var_.actorSpriteComps1038 = nil
			end

			local var_144_12 = arg_141_1.actors_["1038"].transform
			local var_144_13 = 0

			if var_144_13 < arg_141_1.time_ and arg_141_1.time_ <= var_144_13 + arg_144_0 then
				arg_141_1.var_.moveOldPos1038 = var_144_12.localPosition
				var_144_12.localScale = Vector3.New(1, 1, 1)

				arg_141_1:CheckSpriteTmpPos("1038", 2)

				local var_144_14 = var_144_12.childCount

				for iter_144_8 = 0, var_144_14 - 1 do
					local var_144_15 = var_144_12:GetChild(iter_144_8)

					if var_144_15.name == "split_9" or not string.find(var_144_15.name, "split") then
						var_144_15.gameObject:SetActive(true)
					else
						var_144_15.gameObject:SetActive(false)
					end
				end
			end

			local var_144_16 = 0.001

			if var_144_13 <= arg_141_1.time_ and arg_141_1.time_ < var_144_13 + var_144_16 then
				local var_144_17 = (arg_141_1.time_ - var_144_13) / var_144_16
				local var_144_18 = Vector3.New(-390, -400, 0)

				var_144_12.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1038, var_144_18, var_144_17)
			end

			if arg_141_1.time_ >= var_144_13 + var_144_16 and arg_141_1.time_ < var_144_13 + var_144_16 + arg_144_0 then
				var_144_12.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_144_19 = 0
			local var_144_20 = 0.825

			if var_144_19 < arg_141_1.time_ and arg_141_1.time_ <= var_144_19 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_21 = arg_141_1:FormatText(StoryNameCfg[94].name)

				arg_141_1.leftNameTxt_.text = var_144_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_22 = arg_141_1:GetWordFromCfg(115301036)
				local var_144_23 = arg_141_1:FormatText(var_144_22.content)

				arg_141_1.text_.text = var_144_23

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_24 = 33
				local var_144_25 = utf8.len(var_144_23)
				local var_144_26 = var_144_24 <= 0 and var_144_20 or var_144_20 * (var_144_25 / var_144_24)

				if var_144_26 > 0 and var_144_20 < var_144_26 then
					arg_141_1.talkMaxDuration = var_144_26

					if var_144_26 + var_144_19 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_26 + var_144_19
					end
				end

				arg_141_1.text_.text = var_144_23
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301036", "story_v_out_115301.awb") ~= 0 then
					local var_144_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301036", "story_v_out_115301.awb") / 1000

					if var_144_27 + var_144_19 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_27 + var_144_19
					end

					if var_144_22.prefab_name ~= "" and arg_141_1.actors_[var_144_22.prefab_name] ~= nil then
						local var_144_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_22.prefab_name].transform, "story_v_out_115301", "115301036", "story_v_out_115301.awb")

						arg_141_1:RecordAudio("115301036", var_144_28)
						arg_141_1:RecordAudio("115301036", var_144_28)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_115301", "115301036", "story_v_out_115301.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_115301", "115301036", "story_v_out_115301.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_29 = math.max(var_144_20, arg_141_1.talkMaxDuration)

			if var_144_19 <= arg_141_1.time_ and arg_141_1.time_ < var_144_19 + var_144_29 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_19) / var_144_29

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_19 + var_144_29 and arg_141_1.time_ < var_144_19 + var_144_29 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play115301037 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 115301037
		arg_145_1.duration_ = 16.633

		local var_145_0 = {
			ja = 16.633,
			ko = 10.733,
			zh = 14.666,
			en = 13.8
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
				arg_145_0:Play115301038(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 1.3

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_2 = arg_145_1:FormatText(StoryNameCfg[94].name)

				arg_145_1.leftNameTxt_.text = var_148_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_3 = arg_145_1:GetWordFromCfg(115301037)
				local var_148_4 = arg_145_1:FormatText(var_148_3.content)

				arg_145_1.text_.text = var_148_4

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_5 = 52
				local var_148_6 = utf8.len(var_148_4)
				local var_148_7 = var_148_5 <= 0 and var_148_1 or var_148_1 * (var_148_6 / var_148_5)

				if var_148_7 > 0 and var_148_1 < var_148_7 then
					arg_145_1.talkMaxDuration = var_148_7

					if var_148_7 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_7 + var_148_0
					end
				end

				arg_145_1.text_.text = var_148_4
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301037", "story_v_out_115301.awb") ~= 0 then
					local var_148_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301037", "story_v_out_115301.awb") / 1000

					if var_148_8 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_8 + var_148_0
					end

					if var_148_3.prefab_name ~= "" and arg_145_1.actors_[var_148_3.prefab_name] ~= nil then
						local var_148_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_3.prefab_name].transform, "story_v_out_115301", "115301037", "story_v_out_115301.awb")

						arg_145_1:RecordAudio("115301037", var_148_9)
						arg_145_1:RecordAudio("115301037", var_148_9)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_115301", "115301037", "story_v_out_115301.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_115301", "115301037", "story_v_out_115301.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_10 = math.max(var_148_1, arg_145_1.talkMaxDuration)

			if var_148_0 <= arg_145_1.time_ and arg_145_1.time_ < var_148_0 + var_148_10 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_0) / var_148_10

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_0 + var_148_10 and arg_145_1.time_ < var_148_0 + var_148_10 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play115301038 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 115301038
		arg_149_1.duration_ = 5

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play115301039(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["10030"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				local var_152_2 = var_152_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_152_2 then
					arg_149_1.var_.alphaOldValue10030 = var_152_2.alpha
					arg_149_1.var_.characterEffect10030 = var_152_2
				end

				arg_149_1.var_.alphaOldValue10030 = 1
			end

			local var_152_3 = 0.333333333333333

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_3 then
				local var_152_4 = (arg_149_1.time_ - var_152_1) / var_152_3
				local var_152_5 = Mathf.Lerp(arg_149_1.var_.alphaOldValue10030, 0, var_152_4)

				if arg_149_1.var_.characterEffect10030 then
					arg_149_1.var_.characterEffect10030.alpha = var_152_5
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_3 and arg_149_1.time_ < var_152_1 + var_152_3 + arg_152_0 and arg_149_1.var_.characterEffect10030 then
				arg_149_1.var_.characterEffect10030.alpha = 0
			end

			local var_152_6 = arg_149_1.actors_["1038"]
			local var_152_7 = 0

			if var_152_7 < arg_149_1.time_ and arg_149_1.time_ <= var_152_7 + arg_152_0 then
				local var_152_8 = var_152_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_152_8 then
					arg_149_1.var_.alphaOldValue1038 = var_152_8.alpha
					arg_149_1.var_.characterEffect1038 = var_152_8
				end

				arg_149_1.var_.alphaOldValue1038 = 1
			end

			local var_152_9 = 0.333333333333333

			if var_152_7 <= arg_149_1.time_ and arg_149_1.time_ < var_152_7 + var_152_9 then
				local var_152_10 = (arg_149_1.time_ - var_152_7) / var_152_9
				local var_152_11 = Mathf.Lerp(arg_149_1.var_.alphaOldValue1038, 0, var_152_10)

				if arg_149_1.var_.characterEffect1038 then
					arg_149_1.var_.characterEffect1038.alpha = var_152_11
				end
			end

			if arg_149_1.time_ >= var_152_7 + var_152_9 and arg_149_1.time_ < var_152_7 + var_152_9 + arg_152_0 and arg_149_1.var_.characterEffect1038 then
				arg_149_1.var_.characterEffect1038.alpha = 0
			end

			local var_152_12 = 0
			local var_152_13 = 0.825

			if var_152_12 < arg_149_1.time_ and arg_149_1.time_ <= var_152_12 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, false)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_14 = arg_149_1:GetWordFromCfg(115301038)
				local var_152_15 = arg_149_1:FormatText(var_152_14.content)

				arg_149_1.text_.text = var_152_15

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_16 = 33
				local var_152_17 = utf8.len(var_152_15)
				local var_152_18 = var_152_16 <= 0 and var_152_13 or var_152_13 * (var_152_17 / var_152_16)

				if var_152_18 > 0 and var_152_13 < var_152_18 then
					arg_149_1.talkMaxDuration = var_152_18

					if var_152_18 + var_152_12 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_18 + var_152_12
					end
				end

				arg_149_1.text_.text = var_152_15
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)
				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_19 = math.max(var_152_13, arg_149_1.talkMaxDuration)

			if var_152_12 <= arg_149_1.time_ and arg_149_1.time_ < var_152_12 + var_152_19 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_12) / var_152_19

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_12 + var_152_19 and arg_149_1.time_ < var_152_12 + var_152_19 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play115301039 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 115301039
		arg_153_1.duration_ = 11.266

		local var_153_0 = {
			ja = 11.266,
			ko = 10.866,
			zh = 9.533,
			en = 9.1
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
				arg_153_0:Play115301040(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["10030"].transform
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 then
				arg_153_1.var_.moveOldPos10030 = var_156_0.localPosition
				var_156_0.localScale = Vector3.New(1, 1, 1)

				arg_153_1:CheckSpriteTmpPos("10030", 3)

				local var_156_2 = var_156_0.childCount

				for iter_156_0 = 0, var_156_2 - 1 do
					local var_156_3 = var_156_0:GetChild(iter_156_0)

					if var_156_3.name == "split_3" or not string.find(var_156_3.name, "split") then
						var_156_3.gameObject:SetActive(true)
					else
						var_156_3.gameObject:SetActive(false)
					end
				end
			end

			local var_156_4 = 0.001

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_4 then
				local var_156_5 = (arg_153_1.time_ - var_156_1) / var_156_4
				local var_156_6 = Vector3.New(0, -390, 150)

				var_156_0.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos10030, var_156_6, var_156_5)
			end

			if arg_153_1.time_ >= var_156_1 + var_156_4 and arg_153_1.time_ < var_156_1 + var_156_4 + arg_156_0 then
				var_156_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_156_7 = arg_153_1.actors_["10030"]
			local var_156_8 = 0

			if var_156_8 < arg_153_1.time_ and arg_153_1.time_ <= var_156_8 + arg_156_0 and arg_153_1.var_.actorSpriteComps10030 == nil then
				arg_153_1.var_.actorSpriteComps10030 = var_156_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_156_9 = 0.2

			if var_156_8 <= arg_153_1.time_ and arg_153_1.time_ < var_156_8 + var_156_9 then
				local var_156_10 = (arg_153_1.time_ - var_156_8) / var_156_9

				if arg_153_1.var_.actorSpriteComps10030 then
					for iter_156_1, iter_156_2 in pairs(arg_153_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_156_2 then
							local var_156_11 = Mathf.Lerp(iter_156_2.color.r, 1, var_156_10)

							iter_156_2.color = Color.New(var_156_11, var_156_11, var_156_11)
						end
					end
				end
			end

			if arg_153_1.time_ >= var_156_8 + var_156_9 and arg_153_1.time_ < var_156_8 + var_156_9 + arg_156_0 and arg_153_1.var_.actorSpriteComps10030 then
				local var_156_12 = 1

				for iter_156_3, iter_156_4 in pairs(arg_153_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_156_4 then
						iter_156_4.color = Color.New(var_156_12, var_156_12, var_156_12)
					end
				end

				arg_153_1.var_.actorSpriteComps10030 = nil
			end

			local var_156_13 = arg_153_1.actors_["10030"]
			local var_156_14 = 0

			if var_156_14 < arg_153_1.time_ and arg_153_1.time_ <= var_156_14 + arg_156_0 then
				local var_156_15 = var_156_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_156_15 then
					arg_153_1.var_.alphaOldValue10030 = var_156_15.alpha
					arg_153_1.var_.characterEffect10030 = var_156_15
				end

				arg_153_1.var_.alphaOldValue10030 = 0
			end

			local var_156_16 = 0.333333333333333

			if var_156_14 <= arg_153_1.time_ and arg_153_1.time_ < var_156_14 + var_156_16 then
				local var_156_17 = (arg_153_1.time_ - var_156_14) / var_156_16
				local var_156_18 = Mathf.Lerp(arg_153_1.var_.alphaOldValue10030, 1, var_156_17)

				if arg_153_1.var_.characterEffect10030 then
					arg_153_1.var_.characterEffect10030.alpha = var_156_18
				end
			end

			if arg_153_1.time_ >= var_156_14 + var_156_16 and arg_153_1.time_ < var_156_14 + var_156_16 + arg_156_0 and arg_153_1.var_.characterEffect10030 then
				arg_153_1.var_.characterEffect10030.alpha = 1
			end

			local var_156_19 = 0
			local var_156_20 = 1.025

			if var_156_19 < arg_153_1.time_ and arg_153_1.time_ <= var_156_19 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_21 = arg_153_1:FormatText(StoryNameCfg[309].name)

				arg_153_1.leftNameTxt_.text = var_156_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_22 = arg_153_1:GetWordFromCfg(115301039)
				local var_156_23 = arg_153_1:FormatText(var_156_22.content)

				arg_153_1.text_.text = var_156_23

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_24 = 41
				local var_156_25 = utf8.len(var_156_23)
				local var_156_26 = var_156_24 <= 0 and var_156_20 or var_156_20 * (var_156_25 / var_156_24)

				if var_156_26 > 0 and var_156_20 < var_156_26 then
					arg_153_1.talkMaxDuration = var_156_26

					if var_156_26 + var_156_19 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_26 + var_156_19
					end
				end

				arg_153_1.text_.text = var_156_23
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301039", "story_v_out_115301.awb") ~= 0 then
					local var_156_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301039", "story_v_out_115301.awb") / 1000

					if var_156_27 + var_156_19 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_27 + var_156_19
					end

					if var_156_22.prefab_name ~= "" and arg_153_1.actors_[var_156_22.prefab_name] ~= nil then
						local var_156_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_22.prefab_name].transform, "story_v_out_115301", "115301039", "story_v_out_115301.awb")

						arg_153_1:RecordAudio("115301039", var_156_28)
						arg_153_1:RecordAudio("115301039", var_156_28)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_115301", "115301039", "story_v_out_115301.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_115301", "115301039", "story_v_out_115301.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_29 = math.max(var_156_20, arg_153_1.talkMaxDuration)

			if var_156_19 <= arg_153_1.time_ and arg_153_1.time_ < var_156_19 + var_156_29 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_19) / var_156_29

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_19 + var_156_29 and arg_153_1.time_ < var_156_19 + var_156_29 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play115301040 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 115301040
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play115301041(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["10030"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				local var_160_2 = var_160_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_160_2 then
					arg_157_1.var_.alphaOldValue10030 = var_160_2.alpha
					arg_157_1.var_.characterEffect10030 = var_160_2
				end

				arg_157_1.var_.alphaOldValue10030 = 1
			end

			local var_160_3 = 0.333333333333333

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_3 then
				local var_160_4 = (arg_157_1.time_ - var_160_1) / var_160_3
				local var_160_5 = Mathf.Lerp(arg_157_1.var_.alphaOldValue10030, 0, var_160_4)

				if arg_157_1.var_.characterEffect10030 then
					arg_157_1.var_.characterEffect10030.alpha = var_160_5
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_3 and arg_157_1.time_ < var_160_1 + var_160_3 + arg_160_0 and arg_157_1.var_.characterEffect10030 then
				arg_157_1.var_.characterEffect10030.alpha = 0
			end

			local var_160_6 = 0
			local var_160_7 = 1.175

			if var_160_6 < arg_157_1.time_ and arg_157_1.time_ <= var_160_6 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_8 = arg_157_1:GetWordFromCfg(115301040)
				local var_160_9 = arg_157_1:FormatText(var_160_8.content)

				arg_157_1.text_.text = var_160_9

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_10 = 47
				local var_160_11 = utf8.len(var_160_9)
				local var_160_12 = var_160_10 <= 0 and var_160_7 or var_160_7 * (var_160_11 / var_160_10)

				if var_160_12 > 0 and var_160_7 < var_160_12 then
					arg_157_1.talkMaxDuration = var_160_12

					if var_160_12 + var_160_6 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_12 + var_160_6
					end
				end

				arg_157_1.text_.text = var_160_9
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_13 = math.max(var_160_7, arg_157_1.talkMaxDuration)

			if var_160_6 <= arg_157_1.time_ and arg_157_1.time_ < var_160_6 + var_160_13 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_6) / var_160_13

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_6 + var_160_13 and arg_157_1.time_ < var_160_6 + var_160_13 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play115301041 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 115301041
		arg_161_1.duration_ = 4.9

		local var_161_0 = {
			ja = 4.233,
			ko = 4.9,
			zh = 3.433,
			en = 4.1
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
				arg_161_0:Play115301042(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["10030"].transform
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPos10030 = var_164_0.localPosition
				var_164_0.localScale = Vector3.New(1, 1, 1)

				arg_161_1:CheckSpriteTmpPos("10030", 4)

				local var_164_2 = var_164_0.childCount

				for iter_164_0 = 0, var_164_2 - 1 do
					local var_164_3 = var_164_0:GetChild(iter_164_0)

					if var_164_3.name == "split_5" or not string.find(var_164_3.name, "split") then
						var_164_3.gameObject:SetActive(true)
					else
						var_164_3.gameObject:SetActive(false)
					end
				end
			end

			local var_164_4 = 0.001

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_4 then
				local var_164_5 = (arg_161_1.time_ - var_164_1) / var_164_4
				local var_164_6 = Vector3.New(390, -390, 150)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos10030, var_164_6, var_164_5)
			end

			if arg_161_1.time_ >= var_164_1 + var_164_4 and arg_161_1.time_ < var_164_1 + var_164_4 + arg_164_0 then
				var_164_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_164_7 = arg_161_1.actors_["10030"]
			local var_164_8 = 0

			if var_164_8 < arg_161_1.time_ and arg_161_1.time_ <= var_164_8 + arg_164_0 then
				local var_164_9 = var_164_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_164_9 then
					arg_161_1.var_.alphaOldValue10030 = var_164_9.alpha
					arg_161_1.var_.characterEffect10030 = var_164_9
				end

				arg_161_1.var_.alphaOldValue10030 = 0
			end

			local var_164_10 = 0.333333333333333

			if var_164_8 <= arg_161_1.time_ and arg_161_1.time_ < var_164_8 + var_164_10 then
				local var_164_11 = (arg_161_1.time_ - var_164_8) / var_164_10
				local var_164_12 = Mathf.Lerp(arg_161_1.var_.alphaOldValue10030, 1, var_164_11)

				if arg_161_1.var_.characterEffect10030 then
					arg_161_1.var_.characterEffect10030.alpha = var_164_12
				end
			end

			if arg_161_1.time_ >= var_164_8 + var_164_10 and arg_161_1.time_ < var_164_8 + var_164_10 + arg_164_0 and arg_161_1.var_.characterEffect10030 then
				arg_161_1.var_.characterEffect10030.alpha = 1
			end

			local var_164_13 = arg_161_1.actors_["10030"]
			local var_164_14 = 0

			if var_164_14 < arg_161_1.time_ and arg_161_1.time_ <= var_164_14 + arg_164_0 and arg_161_1.var_.actorSpriteComps10030 == nil then
				arg_161_1.var_.actorSpriteComps10030 = var_164_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_164_15 = 0.2

			if var_164_14 <= arg_161_1.time_ and arg_161_1.time_ < var_164_14 + var_164_15 then
				local var_164_16 = (arg_161_1.time_ - var_164_14) / var_164_15

				if arg_161_1.var_.actorSpriteComps10030 then
					for iter_164_1, iter_164_2 in pairs(arg_161_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_164_2 then
							local var_164_17 = Mathf.Lerp(iter_164_2.color.r, 1, var_164_16)

							iter_164_2.color = Color.New(var_164_17, var_164_17, var_164_17)
						end
					end
				end
			end

			if arg_161_1.time_ >= var_164_14 + var_164_15 and arg_161_1.time_ < var_164_14 + var_164_15 + arg_164_0 and arg_161_1.var_.actorSpriteComps10030 then
				local var_164_18 = 1

				for iter_164_3, iter_164_4 in pairs(arg_161_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_164_4 then
						iter_164_4.color = Color.New(var_164_18, var_164_18, var_164_18)
					end
				end

				arg_161_1.var_.actorSpriteComps10030 = nil
			end

			local var_164_19 = 0
			local var_164_20 = 0.3

			if var_164_19 < arg_161_1.time_ and arg_161_1.time_ <= var_164_19 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_21 = arg_161_1:FormatText(StoryNameCfg[309].name)

				arg_161_1.leftNameTxt_.text = var_164_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_22 = arg_161_1:GetWordFromCfg(115301041)
				local var_164_23 = arg_161_1:FormatText(var_164_22.content)

				arg_161_1.text_.text = var_164_23

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_24 = 12
				local var_164_25 = utf8.len(var_164_23)
				local var_164_26 = var_164_24 <= 0 and var_164_20 or var_164_20 * (var_164_25 / var_164_24)

				if var_164_26 > 0 and var_164_20 < var_164_26 then
					arg_161_1.talkMaxDuration = var_164_26

					if var_164_26 + var_164_19 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_26 + var_164_19
					end
				end

				arg_161_1.text_.text = var_164_23
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301041", "story_v_out_115301.awb") ~= 0 then
					local var_164_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301041", "story_v_out_115301.awb") / 1000

					if var_164_27 + var_164_19 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_27 + var_164_19
					end

					if var_164_22.prefab_name ~= "" and arg_161_1.actors_[var_164_22.prefab_name] ~= nil then
						local var_164_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_22.prefab_name].transform, "story_v_out_115301", "115301041", "story_v_out_115301.awb")

						arg_161_1:RecordAudio("115301041", var_164_28)
						arg_161_1:RecordAudio("115301041", var_164_28)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_115301", "115301041", "story_v_out_115301.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_115301", "115301041", "story_v_out_115301.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_29 = math.max(var_164_20, arg_161_1.talkMaxDuration)

			if var_164_19 <= arg_161_1.time_ and arg_161_1.time_ < var_164_19 + var_164_29 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_19) / var_164_29

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_19 + var_164_29 and arg_161_1.time_ < var_164_19 + var_164_29 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play115301042 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 115301042
		arg_165_1.duration_ = 5.2

		local var_165_0 = {
			ja = 5.2,
			ko = 2.666,
			zh = 4.766,
			en = 3.7
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
				arg_165_0:Play115301043(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["1038"].transform
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				arg_165_1.var_.moveOldPos1038 = var_168_0.localPosition
				var_168_0.localScale = Vector3.New(1, 1, 1)

				arg_165_1:CheckSpriteTmpPos("1038", 2)

				local var_168_2 = var_168_0.childCount

				for iter_168_0 = 0, var_168_2 - 1 do
					local var_168_3 = var_168_0:GetChild(iter_168_0)

					if var_168_3.name == "split_7" or not string.find(var_168_3.name, "split") then
						var_168_3.gameObject:SetActive(true)
					else
						var_168_3.gameObject:SetActive(false)
					end
				end
			end

			local var_168_4 = 0.001

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_4 then
				local var_168_5 = (arg_165_1.time_ - var_168_1) / var_168_4
				local var_168_6 = Vector3.New(-390, -400, 0)

				var_168_0.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1038, var_168_6, var_168_5)
			end

			if arg_165_1.time_ >= var_168_1 + var_168_4 and arg_165_1.time_ < var_168_1 + var_168_4 + arg_168_0 then
				var_168_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_168_7 = arg_165_1.actors_["10030"]
			local var_168_8 = 0

			if var_168_8 < arg_165_1.time_ and arg_165_1.time_ <= var_168_8 + arg_168_0 and arg_165_1.var_.actorSpriteComps10030 == nil then
				arg_165_1.var_.actorSpriteComps10030 = var_168_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_168_9 = 0.2

			if var_168_8 <= arg_165_1.time_ and arg_165_1.time_ < var_168_8 + var_168_9 then
				local var_168_10 = (arg_165_1.time_ - var_168_8) / var_168_9

				if arg_165_1.var_.actorSpriteComps10030 then
					for iter_168_1, iter_168_2 in pairs(arg_165_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_168_2 then
							local var_168_11 = Mathf.Lerp(iter_168_2.color.r, 0.5, var_168_10)

							iter_168_2.color = Color.New(var_168_11, var_168_11, var_168_11)
						end
					end
				end
			end

			if arg_165_1.time_ >= var_168_8 + var_168_9 and arg_165_1.time_ < var_168_8 + var_168_9 + arg_168_0 and arg_165_1.var_.actorSpriteComps10030 then
				local var_168_12 = 0.5

				for iter_168_3, iter_168_4 in pairs(arg_165_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_168_4 then
						iter_168_4.color = Color.New(var_168_12, var_168_12, var_168_12)
					end
				end

				arg_165_1.var_.actorSpriteComps10030 = nil
			end

			local var_168_13 = arg_165_1.actors_["1038"]
			local var_168_14 = 0

			if var_168_14 < arg_165_1.time_ and arg_165_1.time_ <= var_168_14 + arg_168_0 then
				local var_168_15 = var_168_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_168_15 then
					arg_165_1.var_.alphaOldValue1038 = var_168_15.alpha
					arg_165_1.var_.characterEffect1038 = var_168_15
				end

				arg_165_1.var_.alphaOldValue1038 = 0
			end

			local var_168_16 = 0.333333333333333

			if var_168_14 <= arg_165_1.time_ and arg_165_1.time_ < var_168_14 + var_168_16 then
				local var_168_17 = (arg_165_1.time_ - var_168_14) / var_168_16
				local var_168_18 = Mathf.Lerp(arg_165_1.var_.alphaOldValue1038, 1, var_168_17)

				if arg_165_1.var_.characterEffect1038 then
					arg_165_1.var_.characterEffect1038.alpha = var_168_18
				end
			end

			if arg_165_1.time_ >= var_168_14 + var_168_16 and arg_165_1.time_ < var_168_14 + var_168_16 + arg_168_0 and arg_165_1.var_.characterEffect1038 then
				arg_165_1.var_.characterEffect1038.alpha = 1
			end

			local var_168_19 = arg_165_1.actors_["1038"]
			local var_168_20 = 0

			if var_168_20 < arg_165_1.time_ and arg_165_1.time_ <= var_168_20 + arg_168_0 and arg_165_1.var_.actorSpriteComps1038 == nil then
				arg_165_1.var_.actorSpriteComps1038 = var_168_19:GetComponentsInChildren(typeof(Image), true)
			end

			local var_168_21 = 0.2

			if var_168_20 <= arg_165_1.time_ and arg_165_1.time_ < var_168_20 + var_168_21 then
				local var_168_22 = (arg_165_1.time_ - var_168_20) / var_168_21

				if arg_165_1.var_.actorSpriteComps1038 then
					for iter_168_5, iter_168_6 in pairs(arg_165_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_168_6 then
							local var_168_23 = Mathf.Lerp(iter_168_6.color.r, 1, var_168_22)

							iter_168_6.color = Color.New(var_168_23, var_168_23, var_168_23)
						end
					end
				end
			end

			if arg_165_1.time_ >= var_168_20 + var_168_21 and arg_165_1.time_ < var_168_20 + var_168_21 + arg_168_0 and arg_165_1.var_.actorSpriteComps1038 then
				local var_168_24 = 1

				for iter_168_7, iter_168_8 in pairs(arg_165_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_168_8 then
						iter_168_8.color = Color.New(var_168_24, var_168_24, var_168_24)
					end
				end

				arg_165_1.var_.actorSpriteComps1038 = nil
			end

			local var_168_25 = 0
			local var_168_26 = 1

			if var_168_25 < arg_165_1.time_ and arg_165_1.time_ <= var_168_25 + arg_168_0 then
				local var_168_27 = "play"
				local var_168_28 = "music"

				arg_165_1:AudioAction(var_168_27, var_168_28, "bgm_activity_1_3_warchess", "bgm_activity_1_3_warchess", "bgm_activity_1_3_warchess.awb")
			end

			local var_168_29 = 0
			local var_168_30 = 0.25

			if var_168_29 < arg_165_1.time_ and arg_165_1.time_ <= var_168_29 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_31 = arg_165_1:FormatText(StoryNameCfg[94].name)

				arg_165_1.leftNameTxt_.text = var_168_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_32 = arg_165_1:GetWordFromCfg(115301042)
				local var_168_33 = arg_165_1:FormatText(var_168_32.content)

				arg_165_1.text_.text = var_168_33

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_34 = 10
				local var_168_35 = utf8.len(var_168_33)
				local var_168_36 = var_168_34 <= 0 and var_168_30 or var_168_30 * (var_168_35 / var_168_34)

				if var_168_36 > 0 and var_168_30 < var_168_36 then
					arg_165_1.talkMaxDuration = var_168_36

					if var_168_36 + var_168_29 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_36 + var_168_29
					end
				end

				arg_165_1.text_.text = var_168_33
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301042", "story_v_out_115301.awb") ~= 0 then
					local var_168_37 = manager.audio:GetVoiceLength("story_v_out_115301", "115301042", "story_v_out_115301.awb") / 1000

					if var_168_37 + var_168_29 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_37 + var_168_29
					end

					if var_168_32.prefab_name ~= "" and arg_165_1.actors_[var_168_32.prefab_name] ~= nil then
						local var_168_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_32.prefab_name].transform, "story_v_out_115301", "115301042", "story_v_out_115301.awb")

						arg_165_1:RecordAudio("115301042", var_168_38)
						arg_165_1:RecordAudio("115301042", var_168_38)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_115301", "115301042", "story_v_out_115301.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_115301", "115301042", "story_v_out_115301.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_39 = math.max(var_168_30, arg_165_1.talkMaxDuration)

			if var_168_29 <= arg_165_1.time_ and arg_165_1.time_ < var_168_29 + var_168_39 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_29) / var_168_39

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_29 + var_168_39 and arg_165_1.time_ < var_168_29 + var_168_39 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play115301043 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 115301043
		arg_169_1.duration_ = 5

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play115301044(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1038"]
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 and arg_169_1.var_.actorSpriteComps1038 == nil then
				arg_169_1.var_.actorSpriteComps1038 = var_172_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_172_2 = 0.2

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2

				if arg_169_1.var_.actorSpriteComps1038 then
					for iter_172_0, iter_172_1 in pairs(arg_169_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_172_1 then
							local var_172_4 = Mathf.Lerp(iter_172_1.color.r, 0.5, var_172_3)

							iter_172_1.color = Color.New(var_172_4, var_172_4, var_172_4)
						end
					end
				end
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 and arg_169_1.var_.actorSpriteComps1038 then
				local var_172_5 = 0.5

				for iter_172_2, iter_172_3 in pairs(arg_169_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_172_3 then
						iter_172_3.color = Color.New(var_172_5, var_172_5, var_172_5)
					end
				end

				arg_169_1.var_.actorSpriteComps1038 = nil
			end

			local var_172_6 = 0
			local var_172_7 = 0.65

			if var_172_6 < arg_169_1.time_ and arg_169_1.time_ <= var_172_6 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, false)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_8 = arg_169_1:GetWordFromCfg(115301043)
				local var_172_9 = arg_169_1:FormatText(var_172_8.content)

				arg_169_1.text_.text = var_172_9

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_10 = 26
				local var_172_11 = utf8.len(var_172_9)
				local var_172_12 = var_172_10 <= 0 and var_172_7 or var_172_7 * (var_172_11 / var_172_10)

				if var_172_12 > 0 and var_172_7 < var_172_12 then
					arg_169_1.talkMaxDuration = var_172_12

					if var_172_12 + var_172_6 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_12 + var_172_6
					end
				end

				arg_169_1.text_.text = var_172_9
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)
				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_13 = math.max(var_172_7, arg_169_1.talkMaxDuration)

			if var_172_6 <= arg_169_1.time_ and arg_169_1.time_ < var_172_6 + var_172_13 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_6) / var_172_13

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_6 + var_172_13 and arg_169_1.time_ < var_172_6 + var_172_13 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play115301044 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 115301044
		arg_173_1.duration_ = 4.566

		local var_173_0 = {
			ja = 4.566,
			ko = 3.666,
			zh = 3.933,
			en = 4.133
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
				arg_173_0:Play115301045(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["10030"]
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 and arg_173_1.var_.actorSpriteComps10030 == nil then
				arg_173_1.var_.actorSpriteComps10030 = var_176_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_176_2 = 0.2

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2

				if arg_173_1.var_.actorSpriteComps10030 then
					for iter_176_0, iter_176_1 in pairs(arg_173_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_176_1 then
							local var_176_4 = Mathf.Lerp(iter_176_1.color.r, 1, var_176_3)

							iter_176_1.color = Color.New(var_176_4, var_176_4, var_176_4)
						end
					end
				end
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 and arg_173_1.var_.actorSpriteComps10030 then
				local var_176_5 = 1

				for iter_176_2, iter_176_3 in pairs(arg_173_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_176_3 then
						iter_176_3.color = Color.New(var_176_5, var_176_5, var_176_5)
					end
				end

				arg_173_1.var_.actorSpriteComps10030 = nil
			end

			local var_176_6 = arg_173_1.actors_["10030"].transform
			local var_176_7 = 0

			if var_176_7 < arg_173_1.time_ and arg_173_1.time_ <= var_176_7 + arg_176_0 then
				arg_173_1.var_.moveOldPos10030 = var_176_6.localPosition
				var_176_6.localScale = Vector3.New(1, 1, 1)

				arg_173_1:CheckSpriteTmpPos("10030", 4)

				local var_176_8 = var_176_6.childCount

				for iter_176_4 = 0, var_176_8 - 1 do
					local var_176_9 = var_176_6:GetChild(iter_176_4)

					if var_176_9.name == "split_1" or not string.find(var_176_9.name, "split") then
						var_176_9.gameObject:SetActive(true)
					else
						var_176_9.gameObject:SetActive(false)
					end
				end
			end

			local var_176_10 = 0.001

			if var_176_7 <= arg_173_1.time_ and arg_173_1.time_ < var_176_7 + var_176_10 then
				local var_176_11 = (arg_173_1.time_ - var_176_7) / var_176_10
				local var_176_12 = Vector3.New(390, -390, 150)

				var_176_6.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos10030, var_176_12, var_176_11)
			end

			if arg_173_1.time_ >= var_176_7 + var_176_10 and arg_173_1.time_ < var_176_7 + var_176_10 + arg_176_0 then
				var_176_6.localPosition = Vector3.New(390, -390, 150)
			end

			local var_176_13 = arg_173_1.actors_["10030"]
			local var_176_14 = 0

			if var_176_14 < arg_173_1.time_ and arg_173_1.time_ <= var_176_14 + arg_176_0 then
				local var_176_15 = var_176_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_176_15 then
					arg_173_1.var_.alphaOldValue10030 = var_176_15.alpha
					arg_173_1.var_.characterEffect10030 = var_176_15
				end

				arg_173_1.var_.alphaOldValue10030 = 0
			end

			local var_176_16 = 0.0166666666666667

			if var_176_14 <= arg_173_1.time_ and arg_173_1.time_ < var_176_14 + var_176_16 then
				local var_176_17 = (arg_173_1.time_ - var_176_14) / var_176_16
				local var_176_18 = Mathf.Lerp(arg_173_1.var_.alphaOldValue10030, 1, var_176_17)

				if arg_173_1.var_.characterEffect10030 then
					arg_173_1.var_.characterEffect10030.alpha = var_176_18
				end
			end

			if arg_173_1.time_ >= var_176_14 + var_176_16 and arg_173_1.time_ < var_176_14 + var_176_16 + arg_176_0 and arg_173_1.var_.characterEffect10030 then
				arg_173_1.var_.characterEffect10030.alpha = 1
			end

			local var_176_19 = 0
			local var_176_20 = 0.35

			if var_176_19 < arg_173_1.time_ and arg_173_1.time_ <= var_176_19 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_21 = arg_173_1:FormatText(StoryNameCfg[309].name)

				arg_173_1.leftNameTxt_.text = var_176_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_22 = arg_173_1:GetWordFromCfg(115301044)
				local var_176_23 = arg_173_1:FormatText(var_176_22.content)

				arg_173_1.text_.text = var_176_23

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_24 = 14
				local var_176_25 = utf8.len(var_176_23)
				local var_176_26 = var_176_24 <= 0 and var_176_20 or var_176_20 * (var_176_25 / var_176_24)

				if var_176_26 > 0 and var_176_20 < var_176_26 then
					arg_173_1.talkMaxDuration = var_176_26

					if var_176_26 + var_176_19 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_26 + var_176_19
					end
				end

				arg_173_1.text_.text = var_176_23
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301044", "story_v_out_115301.awb") ~= 0 then
					local var_176_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301044", "story_v_out_115301.awb") / 1000

					if var_176_27 + var_176_19 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_27 + var_176_19
					end

					if var_176_22.prefab_name ~= "" and arg_173_1.actors_[var_176_22.prefab_name] ~= nil then
						local var_176_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_22.prefab_name].transform, "story_v_out_115301", "115301044", "story_v_out_115301.awb")

						arg_173_1:RecordAudio("115301044", var_176_28)
						arg_173_1:RecordAudio("115301044", var_176_28)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_115301", "115301044", "story_v_out_115301.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_115301", "115301044", "story_v_out_115301.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_29 = math.max(var_176_20, arg_173_1.talkMaxDuration)

			if var_176_19 <= arg_173_1.time_ and arg_173_1.time_ < var_176_19 + var_176_29 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_19) / var_176_29

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_19 + var_176_29 and arg_173_1.time_ < var_176_19 + var_176_29 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play115301045 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 115301045
		arg_177_1.duration_ = 2.8

		local var_177_0 = {
			ja = 2.4,
			ko = 1.166,
			zh = 2.8,
			en = 1.3
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
				arg_177_0:Play115301046(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["1038"].transform
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 then
				arg_177_1.var_.moveOldPos1038 = var_180_0.localPosition
				var_180_0.localScale = Vector3.New(1, 1, 1)

				arg_177_1:CheckSpriteTmpPos("1038", 2)

				local var_180_2 = var_180_0.childCount

				for iter_180_0 = 0, var_180_2 - 1 do
					local var_180_3 = var_180_0:GetChild(iter_180_0)

					if var_180_3.name == "split_1" or not string.find(var_180_3.name, "split") then
						var_180_3.gameObject:SetActive(true)
					else
						var_180_3.gameObject:SetActive(false)
					end
				end
			end

			local var_180_4 = 0.001

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_4 then
				local var_180_5 = (arg_177_1.time_ - var_180_1) / var_180_4
				local var_180_6 = Vector3.New(-390, -400, 0)

				var_180_0.localPosition = Vector3.Lerp(arg_177_1.var_.moveOldPos1038, var_180_6, var_180_5)
			end

			if arg_177_1.time_ >= var_180_1 + var_180_4 and arg_177_1.time_ < var_180_1 + var_180_4 + arg_180_0 then
				var_180_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_180_7 = arg_177_1.actors_["10030"]
			local var_180_8 = 0

			if var_180_8 < arg_177_1.time_ and arg_177_1.time_ <= var_180_8 + arg_180_0 and arg_177_1.var_.actorSpriteComps10030 == nil then
				arg_177_1.var_.actorSpriteComps10030 = var_180_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_180_9 = 0.2

			if var_180_8 <= arg_177_1.time_ and arg_177_1.time_ < var_180_8 + var_180_9 then
				local var_180_10 = (arg_177_1.time_ - var_180_8) / var_180_9

				if arg_177_1.var_.actorSpriteComps10030 then
					for iter_180_1, iter_180_2 in pairs(arg_177_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_180_2 then
							local var_180_11 = Mathf.Lerp(iter_180_2.color.r, 0.5, var_180_10)

							iter_180_2.color = Color.New(var_180_11, var_180_11, var_180_11)
						end
					end
				end
			end

			if arg_177_1.time_ >= var_180_8 + var_180_9 and arg_177_1.time_ < var_180_8 + var_180_9 + arg_180_0 and arg_177_1.var_.actorSpriteComps10030 then
				local var_180_12 = 0.5

				for iter_180_3, iter_180_4 in pairs(arg_177_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_180_4 then
						iter_180_4.color = Color.New(var_180_12, var_180_12, var_180_12)
					end
				end

				arg_177_1.var_.actorSpriteComps10030 = nil
			end

			local var_180_13 = arg_177_1.actors_["1038"]
			local var_180_14 = 0

			if var_180_14 < arg_177_1.time_ and arg_177_1.time_ <= var_180_14 + arg_180_0 and arg_177_1.var_.actorSpriteComps1038 == nil then
				arg_177_1.var_.actorSpriteComps1038 = var_180_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_180_15 = 0.2

			if var_180_14 <= arg_177_1.time_ and arg_177_1.time_ < var_180_14 + var_180_15 then
				local var_180_16 = (arg_177_1.time_ - var_180_14) / var_180_15

				if arg_177_1.var_.actorSpriteComps1038 then
					for iter_180_5, iter_180_6 in pairs(arg_177_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_180_6 then
							local var_180_17 = Mathf.Lerp(iter_180_6.color.r, 1, var_180_16)

							iter_180_6.color = Color.New(var_180_17, var_180_17, var_180_17)
						end
					end
				end
			end

			if arg_177_1.time_ >= var_180_14 + var_180_15 and arg_177_1.time_ < var_180_14 + var_180_15 + arg_180_0 and arg_177_1.var_.actorSpriteComps1038 then
				local var_180_18 = 1

				for iter_180_7, iter_180_8 in pairs(arg_177_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_180_8 then
						iter_180_8.color = Color.New(var_180_18, var_180_18, var_180_18)
					end
				end

				arg_177_1.var_.actorSpriteComps1038 = nil
			end

			local var_180_19 = 0
			local var_180_20 = 0.125

			if var_180_19 < arg_177_1.time_ and arg_177_1.time_ <= var_180_19 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_21 = arg_177_1:FormatText(StoryNameCfg[94].name)

				arg_177_1.leftNameTxt_.text = var_180_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_22 = arg_177_1:GetWordFromCfg(115301045)
				local var_180_23 = arg_177_1:FormatText(var_180_22.content)

				arg_177_1.text_.text = var_180_23

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_24 = 5
				local var_180_25 = utf8.len(var_180_23)
				local var_180_26 = var_180_24 <= 0 and var_180_20 or var_180_20 * (var_180_25 / var_180_24)

				if var_180_26 > 0 and var_180_20 < var_180_26 then
					arg_177_1.talkMaxDuration = var_180_26

					if var_180_26 + var_180_19 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_26 + var_180_19
					end
				end

				arg_177_1.text_.text = var_180_23
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301045", "story_v_out_115301.awb") ~= 0 then
					local var_180_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301045", "story_v_out_115301.awb") / 1000

					if var_180_27 + var_180_19 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_27 + var_180_19
					end

					if var_180_22.prefab_name ~= "" and arg_177_1.actors_[var_180_22.prefab_name] ~= nil then
						local var_180_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_22.prefab_name].transform, "story_v_out_115301", "115301045", "story_v_out_115301.awb")

						arg_177_1:RecordAudio("115301045", var_180_28)
						arg_177_1:RecordAudio("115301045", var_180_28)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_115301", "115301045", "story_v_out_115301.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_115301", "115301045", "story_v_out_115301.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_29 = math.max(var_180_20, arg_177_1.talkMaxDuration)

			if var_180_19 <= arg_177_1.time_ and arg_177_1.time_ < var_180_19 + var_180_29 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_19) / var_180_29

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_19 + var_180_29 and arg_177_1.time_ < var_180_19 + var_180_29 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play115301046 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 115301046
		arg_181_1.duration_ = 5

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play115301047(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["10030"]
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 then
				local var_184_2 = var_184_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_184_2 then
					arg_181_1.var_.alphaOldValue10030 = var_184_2.alpha
					arg_181_1.var_.characterEffect10030 = var_184_2
				end

				arg_181_1.var_.alphaOldValue10030 = 1
			end

			local var_184_3 = 0.333333333333333

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_3 then
				local var_184_4 = (arg_181_1.time_ - var_184_1) / var_184_3
				local var_184_5 = Mathf.Lerp(arg_181_1.var_.alphaOldValue10030, 0, var_184_4)

				if arg_181_1.var_.characterEffect10030 then
					arg_181_1.var_.characterEffect10030.alpha = var_184_5
				end
			end

			if arg_181_1.time_ >= var_184_1 + var_184_3 and arg_181_1.time_ < var_184_1 + var_184_3 + arg_184_0 and arg_181_1.var_.characterEffect10030 then
				arg_181_1.var_.characterEffect10030.alpha = 0
			end

			local var_184_6 = arg_181_1.actors_["1038"]
			local var_184_7 = 0

			if var_184_7 < arg_181_1.time_ and arg_181_1.time_ <= var_184_7 + arg_184_0 then
				local var_184_8 = var_184_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_184_8 then
					arg_181_1.var_.alphaOldValue1038 = var_184_8.alpha
					arg_181_1.var_.characterEffect1038 = var_184_8
				end

				arg_181_1.var_.alphaOldValue1038 = 1
			end

			local var_184_9 = 0.333333333333333

			if var_184_7 <= arg_181_1.time_ and arg_181_1.time_ < var_184_7 + var_184_9 then
				local var_184_10 = (arg_181_1.time_ - var_184_7) / var_184_9
				local var_184_11 = Mathf.Lerp(arg_181_1.var_.alphaOldValue1038, 0, var_184_10)

				if arg_181_1.var_.characterEffect1038 then
					arg_181_1.var_.characterEffect1038.alpha = var_184_11
				end
			end

			if arg_181_1.time_ >= var_184_7 + var_184_9 and arg_181_1.time_ < var_184_7 + var_184_9 + arg_184_0 and arg_181_1.var_.characterEffect1038 then
				arg_181_1.var_.characterEffect1038.alpha = 0
			end

			local var_184_12 = 0
			local var_184_13 = 0.6

			if var_184_12 < arg_181_1.time_ and arg_181_1.time_ <= var_184_12 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, false)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_14 = arg_181_1:GetWordFromCfg(115301046)
				local var_184_15 = arg_181_1:FormatText(var_184_14.content)

				arg_181_1.text_.text = var_184_15

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_16 = 24
				local var_184_17 = utf8.len(var_184_15)
				local var_184_18 = var_184_16 <= 0 and var_184_13 or var_184_13 * (var_184_17 / var_184_16)

				if var_184_18 > 0 and var_184_13 < var_184_18 then
					arg_181_1.talkMaxDuration = var_184_18

					if var_184_18 + var_184_12 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_18 + var_184_12
					end
				end

				arg_181_1.text_.text = var_184_15
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)
				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_19 = math.max(var_184_13, arg_181_1.talkMaxDuration)

			if var_184_12 <= arg_181_1.time_ and arg_181_1.time_ < var_184_12 + var_184_19 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_12) / var_184_19

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_12 + var_184_19 and arg_181_1.time_ < var_184_12 + var_184_19 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play115301047 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 115301047
		arg_185_1.duration_ = 5

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play115301048(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0
			local var_188_1 = 0.9

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, false)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_2 = arg_185_1:GetWordFromCfg(115301047)
				local var_188_3 = arg_185_1:FormatText(var_188_2.content)

				arg_185_1.text_.text = var_188_3

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_4 = 36
				local var_188_5 = utf8.len(var_188_3)
				local var_188_6 = var_188_4 <= 0 and var_188_1 or var_188_1 * (var_188_5 / var_188_4)

				if var_188_6 > 0 and var_188_1 < var_188_6 then
					arg_185_1.talkMaxDuration = var_188_6

					if var_188_6 + var_188_0 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_6 + var_188_0
					end
				end

				arg_185_1.text_.text = var_188_3
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)
				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_7 = math.max(var_188_1, arg_185_1.talkMaxDuration)

			if var_188_0 <= arg_185_1.time_ and arg_185_1.time_ < var_188_0 + var_188_7 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_0) / var_188_7

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_0 + var_188_7 and arg_185_1.time_ < var_188_0 + var_188_7 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play115301048 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 115301048
		arg_189_1.duration_ = 16.033

		local var_189_0 = {
			ja = 16.033,
			ko = 6.833,
			zh = 8.3,
			en = 8.766
		}
		local var_189_1 = manager.audio:GetLocalizationFlag()

		if var_189_0[var_189_1] ~= nil then
			arg_189_1.duration_ = var_189_0[var_189_1]
		end

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play115301049(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["10030"].transform
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 then
				arg_189_1.var_.moveOldPos10030 = var_192_0.localPosition
				var_192_0.localScale = Vector3.New(1, 1, 1)

				arg_189_1:CheckSpriteTmpPos("10030", 3)

				local var_192_2 = var_192_0.childCount

				for iter_192_0 = 0, var_192_2 - 1 do
					local var_192_3 = var_192_0:GetChild(iter_192_0)

					if var_192_3.name == "split_1" or not string.find(var_192_3.name, "split") then
						var_192_3.gameObject:SetActive(true)
					else
						var_192_3.gameObject:SetActive(false)
					end
				end
			end

			local var_192_4 = 0.001

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_4 then
				local var_192_5 = (arg_189_1.time_ - var_192_1) / var_192_4
				local var_192_6 = Vector3.New(0, -390, 150)

				var_192_0.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos10030, var_192_6, var_192_5)
			end

			if arg_189_1.time_ >= var_192_1 + var_192_4 and arg_189_1.time_ < var_192_1 + var_192_4 + arg_192_0 then
				var_192_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_192_7 = arg_189_1.actors_["10030"]
			local var_192_8 = 0

			if var_192_8 < arg_189_1.time_ and arg_189_1.time_ <= var_192_8 + arg_192_0 and arg_189_1.var_.actorSpriteComps10030 == nil then
				arg_189_1.var_.actorSpriteComps10030 = var_192_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_192_9 = 0.2

			if var_192_8 <= arg_189_1.time_ and arg_189_1.time_ < var_192_8 + var_192_9 then
				local var_192_10 = (arg_189_1.time_ - var_192_8) / var_192_9

				if arg_189_1.var_.actorSpriteComps10030 then
					for iter_192_1, iter_192_2 in pairs(arg_189_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_192_2 then
							local var_192_11 = Mathf.Lerp(iter_192_2.color.r, 1, var_192_10)

							iter_192_2.color = Color.New(var_192_11, var_192_11, var_192_11)
						end
					end
				end
			end

			if arg_189_1.time_ >= var_192_8 + var_192_9 and arg_189_1.time_ < var_192_8 + var_192_9 + arg_192_0 and arg_189_1.var_.actorSpriteComps10030 then
				local var_192_12 = 1

				for iter_192_3, iter_192_4 in pairs(arg_189_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_192_4 then
						iter_192_4.color = Color.New(var_192_12, var_192_12, var_192_12)
					end
				end

				arg_189_1.var_.actorSpriteComps10030 = nil
			end

			local var_192_13 = arg_189_1.actors_["10030"]
			local var_192_14 = 0

			if var_192_14 < arg_189_1.time_ and arg_189_1.time_ <= var_192_14 + arg_192_0 then
				local var_192_15 = var_192_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_192_15 then
					arg_189_1.var_.alphaOldValue10030 = var_192_15.alpha
					arg_189_1.var_.characterEffect10030 = var_192_15
				end

				arg_189_1.var_.alphaOldValue10030 = 0
			end

			local var_192_16 = 0.333333333333333

			if var_192_14 <= arg_189_1.time_ and arg_189_1.time_ < var_192_14 + var_192_16 then
				local var_192_17 = (arg_189_1.time_ - var_192_14) / var_192_16
				local var_192_18 = Mathf.Lerp(arg_189_1.var_.alphaOldValue10030, 1, var_192_17)

				if arg_189_1.var_.characterEffect10030 then
					arg_189_1.var_.characterEffect10030.alpha = var_192_18
				end
			end

			if arg_189_1.time_ >= var_192_14 + var_192_16 and arg_189_1.time_ < var_192_14 + var_192_16 + arg_192_0 and arg_189_1.var_.characterEffect10030 then
				arg_189_1.var_.characterEffect10030.alpha = 1
			end

			local var_192_19 = 0
			local var_192_20 = 0.575

			if var_192_19 < arg_189_1.time_ and arg_189_1.time_ <= var_192_19 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_21 = arg_189_1:FormatText(StoryNameCfg[309].name)

				arg_189_1.leftNameTxt_.text = var_192_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_22 = arg_189_1:GetWordFromCfg(115301048)
				local var_192_23 = arg_189_1:FormatText(var_192_22.content)

				arg_189_1.text_.text = var_192_23

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_24 = 23
				local var_192_25 = utf8.len(var_192_23)
				local var_192_26 = var_192_24 <= 0 and var_192_20 or var_192_20 * (var_192_25 / var_192_24)

				if var_192_26 > 0 and var_192_20 < var_192_26 then
					arg_189_1.talkMaxDuration = var_192_26

					if var_192_26 + var_192_19 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_26 + var_192_19
					end
				end

				arg_189_1.text_.text = var_192_23
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301048", "story_v_out_115301.awb") ~= 0 then
					local var_192_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301048", "story_v_out_115301.awb") / 1000

					if var_192_27 + var_192_19 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_27 + var_192_19
					end

					if var_192_22.prefab_name ~= "" and arg_189_1.actors_[var_192_22.prefab_name] ~= nil then
						local var_192_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_22.prefab_name].transform, "story_v_out_115301", "115301048", "story_v_out_115301.awb")

						arg_189_1:RecordAudio("115301048", var_192_28)
						arg_189_1:RecordAudio("115301048", var_192_28)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_115301", "115301048", "story_v_out_115301.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_115301", "115301048", "story_v_out_115301.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_29 = math.max(var_192_20, arg_189_1.talkMaxDuration)

			if var_192_19 <= arg_189_1.time_ and arg_189_1.time_ < var_192_19 + var_192_29 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_19) / var_192_29

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_19 + var_192_29 and arg_189_1.time_ < var_192_19 + var_192_29 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play115301049 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 115301049
		arg_193_1.duration_ = 9.166

		local var_193_0 = {
			ja = 8.3,
			ko = 6.566,
			zh = 7.233,
			en = 9.166
		}
		local var_193_1 = manager.audio:GetLocalizationFlag()

		if var_193_0[var_193_1] ~= nil then
			arg_193_1.duration_ = var_193_0[var_193_1]
		end

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play115301050(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 0.725

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_2 = arg_193_1:FormatText(StoryNameCfg[309].name)

				arg_193_1.leftNameTxt_.text = var_196_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_3 = arg_193_1:GetWordFromCfg(115301049)
				local var_196_4 = arg_193_1:FormatText(var_196_3.content)

				arg_193_1.text_.text = var_196_4

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_5 = 29
				local var_196_6 = utf8.len(var_196_4)
				local var_196_7 = var_196_5 <= 0 and var_196_1 or var_196_1 * (var_196_6 / var_196_5)

				if var_196_7 > 0 and var_196_1 < var_196_7 then
					arg_193_1.talkMaxDuration = var_196_7

					if var_196_7 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_7 + var_196_0
					end
				end

				arg_193_1.text_.text = var_196_4
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301049", "story_v_out_115301.awb") ~= 0 then
					local var_196_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301049", "story_v_out_115301.awb") / 1000

					if var_196_8 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_8 + var_196_0
					end

					if var_196_3.prefab_name ~= "" and arg_193_1.actors_[var_196_3.prefab_name] ~= nil then
						local var_196_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_3.prefab_name].transform, "story_v_out_115301", "115301049", "story_v_out_115301.awb")

						arg_193_1:RecordAudio("115301049", var_196_9)
						arg_193_1:RecordAudio("115301049", var_196_9)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_115301", "115301049", "story_v_out_115301.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_115301", "115301049", "story_v_out_115301.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_10 = math.max(var_196_1, arg_193_1.talkMaxDuration)

			if var_196_0 <= arg_193_1.time_ and arg_193_1.time_ < var_196_0 + var_196_10 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_0) / var_196_10

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_0 + var_196_10 and arg_193_1.time_ < var_196_0 + var_196_10 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play115301050 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 115301050
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play115301051(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["10030"]
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 then
				local var_200_2 = var_200_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_200_2 then
					arg_197_1.var_.alphaOldValue10030 = var_200_2.alpha
					arg_197_1.var_.characterEffect10030 = var_200_2
				end

				arg_197_1.var_.alphaOldValue10030 = 1
			end

			local var_200_3 = 0.333333333333333

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_3 then
				local var_200_4 = (arg_197_1.time_ - var_200_1) / var_200_3
				local var_200_5 = Mathf.Lerp(arg_197_1.var_.alphaOldValue10030, 0, var_200_4)

				if arg_197_1.var_.characterEffect10030 then
					arg_197_1.var_.characterEffect10030.alpha = var_200_5
				end
			end

			if arg_197_1.time_ >= var_200_1 + var_200_3 and arg_197_1.time_ < var_200_1 + var_200_3 + arg_200_0 and arg_197_1.var_.characterEffect10030 then
				arg_197_1.var_.characterEffect10030.alpha = 0
			end

			local var_200_6 = 0
			local var_200_7 = 1.575

			if var_200_6 < arg_197_1.time_ and arg_197_1.time_ <= var_200_6 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, false)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_8 = arg_197_1:GetWordFromCfg(115301050)
				local var_200_9 = arg_197_1:FormatText(var_200_8.content)

				arg_197_1.text_.text = var_200_9

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_10 = 63
				local var_200_11 = utf8.len(var_200_9)
				local var_200_12 = var_200_10 <= 0 and var_200_7 or var_200_7 * (var_200_11 / var_200_10)

				if var_200_12 > 0 and var_200_7 < var_200_12 then
					arg_197_1.talkMaxDuration = var_200_12

					if var_200_12 + var_200_6 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_12 + var_200_6
					end
				end

				arg_197_1.text_.text = var_200_9
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)
				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_13 = math.max(var_200_7, arg_197_1.talkMaxDuration)

			if var_200_6 <= arg_197_1.time_ and arg_197_1.time_ < var_200_6 + var_200_13 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_6) / var_200_13

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_6 + var_200_13 and arg_197_1.time_ < var_200_6 + var_200_13 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play115301051 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 115301051
		arg_201_1.duration_ = 5

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play115301052(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = 0
			local var_204_1 = 1.075

			if var_204_0 < arg_201_1.time_ and arg_201_1.time_ <= var_204_0 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, false)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_2 = arg_201_1:GetWordFromCfg(115301051)
				local var_204_3 = arg_201_1:FormatText(var_204_2.content)

				arg_201_1.text_.text = var_204_3

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_4 = 43
				local var_204_5 = utf8.len(var_204_3)
				local var_204_6 = var_204_4 <= 0 and var_204_1 or var_204_1 * (var_204_5 / var_204_4)

				if var_204_6 > 0 and var_204_1 < var_204_6 then
					arg_201_1.talkMaxDuration = var_204_6

					if var_204_6 + var_204_0 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_6 + var_204_0
					end
				end

				arg_201_1.text_.text = var_204_3
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)
				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_7 = math.max(var_204_1, arg_201_1.talkMaxDuration)

			if var_204_0 <= arg_201_1.time_ and arg_201_1.time_ < var_204_0 + var_204_7 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_0) / var_204_7

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_0 + var_204_7 and arg_201_1.time_ < var_204_0 + var_204_7 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play115301052 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 115301052
		arg_205_1.duration_ = 5

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play115301053(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0
			local var_208_1 = 1.6

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, false)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_2 = arg_205_1:GetWordFromCfg(115301052)
				local var_208_3 = arg_205_1:FormatText(var_208_2.content)

				arg_205_1.text_.text = var_208_3

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_4 = 64
				local var_208_5 = utf8.len(var_208_3)
				local var_208_6 = var_208_4 <= 0 and var_208_1 or var_208_1 * (var_208_5 / var_208_4)

				if var_208_6 > 0 and var_208_1 < var_208_6 then
					arg_205_1.talkMaxDuration = var_208_6

					if var_208_6 + var_208_0 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_6 + var_208_0
					end
				end

				arg_205_1.text_.text = var_208_3
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)
				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_7 = math.max(var_208_1, arg_205_1.talkMaxDuration)

			if var_208_0 <= arg_205_1.time_ and arg_205_1.time_ < var_208_0 + var_208_7 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_0) / var_208_7

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_0 + var_208_7 and arg_205_1.time_ < var_208_0 + var_208_7 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play115301053 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 115301053
		arg_209_1.duration_ = 7.8

		local var_209_0 = {
			ja = 7.8,
			ko = 6.866,
			zh = 6.933,
			en = 7.366
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
				arg_209_0:Play115301054(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["10030"].transform
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.var_.moveOldPos10030 = var_212_0.localPosition
				var_212_0.localScale = Vector3.New(1, 1, 1)

				arg_209_1:CheckSpriteTmpPos("10030", 3)

				local var_212_2 = var_212_0.childCount

				for iter_212_0 = 0, var_212_2 - 1 do
					local var_212_3 = var_212_0:GetChild(iter_212_0)

					if var_212_3.name == "split_3" or not string.find(var_212_3.name, "split") then
						var_212_3.gameObject:SetActive(true)
					else
						var_212_3.gameObject:SetActive(false)
					end
				end
			end

			local var_212_4 = 0.001

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_4 then
				local var_212_5 = (arg_209_1.time_ - var_212_1) / var_212_4
				local var_212_6 = Vector3.New(0, -390, 150)

				var_212_0.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos10030, var_212_6, var_212_5)
			end

			if arg_209_1.time_ >= var_212_1 + var_212_4 and arg_209_1.time_ < var_212_1 + var_212_4 + arg_212_0 then
				var_212_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_212_7 = arg_209_1.actors_["10030"]
			local var_212_8 = 0

			if var_212_8 < arg_209_1.time_ and arg_209_1.time_ <= var_212_8 + arg_212_0 and arg_209_1.var_.actorSpriteComps10030 == nil then
				arg_209_1.var_.actorSpriteComps10030 = var_212_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_212_9 = 0.2

			if var_212_8 <= arg_209_1.time_ and arg_209_1.time_ < var_212_8 + var_212_9 then
				local var_212_10 = (arg_209_1.time_ - var_212_8) / var_212_9

				if arg_209_1.var_.actorSpriteComps10030 then
					for iter_212_1, iter_212_2 in pairs(arg_209_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_212_2 then
							local var_212_11 = Mathf.Lerp(iter_212_2.color.r, 1, var_212_10)

							iter_212_2.color = Color.New(var_212_11, var_212_11, var_212_11)
						end
					end
				end
			end

			if arg_209_1.time_ >= var_212_8 + var_212_9 and arg_209_1.time_ < var_212_8 + var_212_9 + arg_212_0 and arg_209_1.var_.actorSpriteComps10030 then
				local var_212_12 = 1

				for iter_212_3, iter_212_4 in pairs(arg_209_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_212_4 then
						iter_212_4.color = Color.New(var_212_12, var_212_12, var_212_12)
					end
				end

				arg_209_1.var_.actorSpriteComps10030 = nil
			end

			local var_212_13 = arg_209_1.actors_["10030"]
			local var_212_14 = 0

			if var_212_14 < arg_209_1.time_ and arg_209_1.time_ <= var_212_14 + arg_212_0 then
				local var_212_15 = var_212_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_212_15 then
					arg_209_1.var_.alphaOldValue10030 = var_212_15.alpha
					arg_209_1.var_.characterEffect10030 = var_212_15
				end

				arg_209_1.var_.alphaOldValue10030 = 0
			end

			local var_212_16 = 0.333333333333333

			if var_212_14 <= arg_209_1.time_ and arg_209_1.time_ < var_212_14 + var_212_16 then
				local var_212_17 = (arg_209_1.time_ - var_212_14) / var_212_16
				local var_212_18 = Mathf.Lerp(arg_209_1.var_.alphaOldValue10030, 1, var_212_17)

				if arg_209_1.var_.characterEffect10030 then
					arg_209_1.var_.characterEffect10030.alpha = var_212_18
				end
			end

			if arg_209_1.time_ >= var_212_14 + var_212_16 and arg_209_1.time_ < var_212_14 + var_212_16 + arg_212_0 and arg_209_1.var_.characterEffect10030 then
				arg_209_1.var_.characterEffect10030.alpha = 1
			end

			local var_212_19 = 0
			local var_212_20 = 0.775

			if var_212_19 < arg_209_1.time_ and arg_209_1.time_ <= var_212_19 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_21 = arg_209_1:FormatText(StoryNameCfg[309].name)

				arg_209_1.leftNameTxt_.text = var_212_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_22 = arg_209_1:GetWordFromCfg(115301053)
				local var_212_23 = arg_209_1:FormatText(var_212_22.content)

				arg_209_1.text_.text = var_212_23

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_24 = 31
				local var_212_25 = utf8.len(var_212_23)
				local var_212_26 = var_212_24 <= 0 and var_212_20 or var_212_20 * (var_212_25 / var_212_24)

				if var_212_26 > 0 and var_212_20 < var_212_26 then
					arg_209_1.talkMaxDuration = var_212_26

					if var_212_26 + var_212_19 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_26 + var_212_19
					end
				end

				arg_209_1.text_.text = var_212_23
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301053", "story_v_out_115301.awb") ~= 0 then
					local var_212_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301053", "story_v_out_115301.awb") / 1000

					if var_212_27 + var_212_19 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_27 + var_212_19
					end

					if var_212_22.prefab_name ~= "" and arg_209_1.actors_[var_212_22.prefab_name] ~= nil then
						local var_212_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_22.prefab_name].transform, "story_v_out_115301", "115301053", "story_v_out_115301.awb")

						arg_209_1:RecordAudio("115301053", var_212_28)
						arg_209_1:RecordAudio("115301053", var_212_28)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_115301", "115301053", "story_v_out_115301.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_115301", "115301053", "story_v_out_115301.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_29 = math.max(var_212_20, arg_209_1.talkMaxDuration)

			if var_212_19 <= arg_209_1.time_ and arg_209_1.time_ < var_212_19 + var_212_29 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_19) / var_212_29

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_19 + var_212_29 and arg_209_1.time_ < var_212_19 + var_212_29 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play115301054 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 115301054
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play115301055(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["10030"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				local var_216_2 = var_216_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_216_2 then
					arg_213_1.var_.alphaOldValue10030 = var_216_2.alpha
					arg_213_1.var_.characterEffect10030 = var_216_2
				end

				arg_213_1.var_.alphaOldValue10030 = 1
			end

			local var_216_3 = 0.333333333333333

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_3 then
				local var_216_4 = (arg_213_1.time_ - var_216_1) / var_216_3
				local var_216_5 = Mathf.Lerp(arg_213_1.var_.alphaOldValue10030, 0, var_216_4)

				if arg_213_1.var_.characterEffect10030 then
					arg_213_1.var_.characterEffect10030.alpha = var_216_5
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_3 and arg_213_1.time_ < var_216_1 + var_216_3 + arg_216_0 and arg_213_1.var_.characterEffect10030 then
				arg_213_1.var_.characterEffect10030.alpha = 0
			end

			local var_216_6 = 0
			local var_216_7 = 1.575

			if var_216_6 < arg_213_1.time_ and arg_213_1.time_ <= var_216_6 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, false)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_8 = arg_213_1:GetWordFromCfg(115301054)
				local var_216_9 = arg_213_1:FormatText(var_216_8.content)

				arg_213_1.text_.text = var_216_9

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_10 = 63
				local var_216_11 = utf8.len(var_216_9)
				local var_216_12 = var_216_10 <= 0 and var_216_7 or var_216_7 * (var_216_11 / var_216_10)

				if var_216_12 > 0 and var_216_7 < var_216_12 then
					arg_213_1.talkMaxDuration = var_216_12

					if var_216_12 + var_216_6 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_12 + var_216_6
					end
				end

				arg_213_1.text_.text = var_216_9
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_13 = math.max(var_216_7, arg_213_1.talkMaxDuration)

			if var_216_6 <= arg_213_1.time_ and arg_213_1.time_ < var_216_6 + var_216_13 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_6) / var_216_13

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_6 + var_216_13 and arg_213_1.time_ < var_216_6 + var_216_13 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play115301055 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 115301055
		arg_217_1.duration_ = 14.333

		local var_217_0 = {
			ja = 14.333,
			ko = 9.4,
			zh = 9.6,
			en = 12.2
		}
		local var_217_1 = manager.audio:GetLocalizationFlag()

		if var_217_0[var_217_1] ~= nil then
			arg_217_1.duration_ = var_217_0[var_217_1]
		end

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play115301056(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["1038"].transform
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 then
				arg_217_1.var_.moveOldPos1038 = var_220_0.localPosition
				var_220_0.localScale = Vector3.New(1, 1, 1)

				arg_217_1:CheckSpriteTmpPos("1038", 2)

				local var_220_2 = var_220_0.childCount

				for iter_220_0 = 0, var_220_2 - 1 do
					local var_220_3 = var_220_0:GetChild(iter_220_0)

					if var_220_3.name == "split_1" or not string.find(var_220_3.name, "split") then
						var_220_3.gameObject:SetActive(true)
					else
						var_220_3.gameObject:SetActive(false)
					end
				end
			end

			local var_220_4 = 0.001

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_4 then
				local var_220_5 = (arg_217_1.time_ - var_220_1) / var_220_4
				local var_220_6 = Vector3.New(-390, -400, 0)

				var_220_0.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos1038, var_220_6, var_220_5)
			end

			if arg_217_1.time_ >= var_220_1 + var_220_4 and arg_217_1.time_ < var_220_1 + var_220_4 + arg_220_0 then
				var_220_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_220_7 = arg_217_1.actors_["1038"]
			local var_220_8 = 0

			if var_220_8 < arg_217_1.time_ and arg_217_1.time_ <= var_220_8 + arg_220_0 then
				local var_220_9 = var_220_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_220_9 then
					arg_217_1.var_.alphaOldValue1038 = var_220_9.alpha
					arg_217_1.var_.characterEffect1038 = var_220_9
				end

				arg_217_1.var_.alphaOldValue1038 = 0
			end

			local var_220_10 = 0.333333333333333

			if var_220_8 <= arg_217_1.time_ and arg_217_1.time_ < var_220_8 + var_220_10 then
				local var_220_11 = (arg_217_1.time_ - var_220_8) / var_220_10
				local var_220_12 = Mathf.Lerp(arg_217_1.var_.alphaOldValue1038, 1, var_220_11)

				if arg_217_1.var_.characterEffect1038 then
					arg_217_1.var_.characterEffect1038.alpha = var_220_12
				end
			end

			if arg_217_1.time_ >= var_220_8 + var_220_10 and arg_217_1.time_ < var_220_8 + var_220_10 + arg_220_0 and arg_217_1.var_.characterEffect1038 then
				arg_217_1.var_.characterEffect1038.alpha = 1
			end

			local var_220_13 = 0
			local var_220_14 = 0.9

			if var_220_13 < arg_217_1.time_ and arg_217_1.time_ <= var_220_13 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_15 = arg_217_1:FormatText(StoryNameCfg[94].name)

				arg_217_1.leftNameTxt_.text = var_220_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_16 = arg_217_1:GetWordFromCfg(115301055)
				local var_220_17 = arg_217_1:FormatText(var_220_16.content)

				arg_217_1.text_.text = var_220_17

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_18 = 36
				local var_220_19 = utf8.len(var_220_17)
				local var_220_20 = var_220_18 <= 0 and var_220_14 or var_220_14 * (var_220_19 / var_220_18)

				if var_220_20 > 0 and var_220_14 < var_220_20 then
					arg_217_1.talkMaxDuration = var_220_20

					if var_220_20 + var_220_13 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_20 + var_220_13
					end
				end

				arg_217_1.text_.text = var_220_17
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301055", "story_v_out_115301.awb") ~= 0 then
					local var_220_21 = manager.audio:GetVoiceLength("story_v_out_115301", "115301055", "story_v_out_115301.awb") / 1000

					if var_220_21 + var_220_13 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_21 + var_220_13
					end

					if var_220_16.prefab_name ~= "" and arg_217_1.actors_[var_220_16.prefab_name] ~= nil then
						local var_220_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_16.prefab_name].transform, "story_v_out_115301", "115301055", "story_v_out_115301.awb")

						arg_217_1:RecordAudio("115301055", var_220_22)
						arg_217_1:RecordAudio("115301055", var_220_22)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_115301", "115301055", "story_v_out_115301.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_115301", "115301055", "story_v_out_115301.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_23 = math.max(var_220_14, arg_217_1.talkMaxDuration)

			if var_220_13 <= arg_217_1.time_ and arg_217_1.time_ < var_220_13 + var_220_23 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_13) / var_220_23

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_13 + var_220_23 and arg_217_1.time_ < var_220_13 + var_220_23 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play115301056 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 115301056
		arg_221_1.duration_ = 1.3

		local var_221_0 = {
			ja = 0.999999999999,
			ko = 1,
			zh = 1.233,
			en = 1.3
		}
		local var_221_1 = manager.audio:GetLocalizationFlag()

		if var_221_0[var_221_1] ~= nil then
			arg_221_1.duration_ = var_221_0[var_221_1]
		end

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play115301057(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["10030"].transform
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.var_.moveOldPos10030 = var_224_0.localPosition
				var_224_0.localScale = Vector3.New(1, 1, 1)

				arg_221_1:CheckSpriteTmpPos("10030", 4)

				local var_224_2 = var_224_0.childCount

				for iter_224_0 = 0, var_224_2 - 1 do
					local var_224_3 = var_224_0:GetChild(iter_224_0)

					if var_224_3.name == "split_1" or not string.find(var_224_3.name, "split") then
						var_224_3.gameObject:SetActive(true)
					else
						var_224_3.gameObject:SetActive(false)
					end
				end
			end

			local var_224_4 = 0.001

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_4 then
				local var_224_5 = (arg_221_1.time_ - var_224_1) / var_224_4
				local var_224_6 = Vector3.New(390, -390, 150)

				var_224_0.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos10030, var_224_6, var_224_5)
			end

			if arg_221_1.time_ >= var_224_1 + var_224_4 and arg_221_1.time_ < var_224_1 + var_224_4 + arg_224_0 then
				var_224_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_224_7 = arg_221_1.actors_["1038"]
			local var_224_8 = 0

			if var_224_8 < arg_221_1.time_ and arg_221_1.time_ <= var_224_8 + arg_224_0 and arg_221_1.var_.actorSpriteComps1038 == nil then
				arg_221_1.var_.actorSpriteComps1038 = var_224_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_224_9 = 0.2

			if var_224_8 <= arg_221_1.time_ and arg_221_1.time_ < var_224_8 + var_224_9 then
				local var_224_10 = (arg_221_1.time_ - var_224_8) / var_224_9

				if arg_221_1.var_.actorSpriteComps1038 then
					for iter_224_1, iter_224_2 in pairs(arg_221_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_224_2 then
							local var_224_11 = Mathf.Lerp(iter_224_2.color.r, 0.5, var_224_10)

							iter_224_2.color = Color.New(var_224_11, var_224_11, var_224_11)
						end
					end
				end
			end

			if arg_221_1.time_ >= var_224_8 + var_224_9 and arg_221_1.time_ < var_224_8 + var_224_9 + arg_224_0 and arg_221_1.var_.actorSpriteComps1038 then
				local var_224_12 = 0.5

				for iter_224_3, iter_224_4 in pairs(arg_221_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_224_4 then
						iter_224_4.color = Color.New(var_224_12, var_224_12, var_224_12)
					end
				end

				arg_221_1.var_.actorSpriteComps1038 = nil
			end

			local var_224_13 = arg_221_1.actors_["10030"]
			local var_224_14 = 0

			if var_224_14 < arg_221_1.time_ and arg_221_1.time_ <= var_224_14 + arg_224_0 then
				local var_224_15 = var_224_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_224_15 then
					arg_221_1.var_.alphaOldValue10030 = var_224_15.alpha
					arg_221_1.var_.characterEffect10030 = var_224_15
				end

				arg_221_1.var_.alphaOldValue10030 = 0
			end

			local var_224_16 = 0.333333333333333

			if var_224_14 <= arg_221_1.time_ and arg_221_1.time_ < var_224_14 + var_224_16 then
				local var_224_17 = (arg_221_1.time_ - var_224_14) / var_224_16
				local var_224_18 = Mathf.Lerp(arg_221_1.var_.alphaOldValue10030, 1, var_224_17)

				if arg_221_1.var_.characterEffect10030 then
					arg_221_1.var_.characterEffect10030.alpha = var_224_18
				end
			end

			if arg_221_1.time_ >= var_224_14 + var_224_16 and arg_221_1.time_ < var_224_14 + var_224_16 + arg_224_0 and arg_221_1.var_.characterEffect10030 then
				arg_221_1.var_.characterEffect10030.alpha = 1
			end

			local var_224_19 = 0
			local var_224_20 = 0.1

			if var_224_19 < arg_221_1.time_ and arg_221_1.time_ <= var_224_19 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_21 = arg_221_1:FormatText(StoryNameCfg[309].name)

				arg_221_1.leftNameTxt_.text = var_224_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_22 = arg_221_1:GetWordFromCfg(115301056)
				local var_224_23 = arg_221_1:FormatText(var_224_22.content)

				arg_221_1.text_.text = var_224_23

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_24 = 4
				local var_224_25 = utf8.len(var_224_23)
				local var_224_26 = var_224_24 <= 0 and var_224_20 or var_224_20 * (var_224_25 / var_224_24)

				if var_224_26 > 0 and var_224_20 < var_224_26 then
					arg_221_1.talkMaxDuration = var_224_26

					if var_224_26 + var_224_19 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_26 + var_224_19
					end
				end

				arg_221_1.text_.text = var_224_23
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301056", "story_v_out_115301.awb") ~= 0 then
					local var_224_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301056", "story_v_out_115301.awb") / 1000

					if var_224_27 + var_224_19 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_27 + var_224_19
					end

					if var_224_22.prefab_name ~= "" and arg_221_1.actors_[var_224_22.prefab_name] ~= nil then
						local var_224_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_22.prefab_name].transform, "story_v_out_115301", "115301056", "story_v_out_115301.awb")

						arg_221_1:RecordAudio("115301056", var_224_28)
						arg_221_1:RecordAudio("115301056", var_224_28)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_115301", "115301056", "story_v_out_115301.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_115301", "115301056", "story_v_out_115301.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_29 = math.max(var_224_20, arg_221_1.talkMaxDuration)

			if var_224_19 <= arg_221_1.time_ and arg_221_1.time_ < var_224_19 + var_224_29 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_19) / var_224_29

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_19 + var_224_29 and arg_221_1.time_ < var_224_19 + var_224_29 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play115301057 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 115301057
		arg_225_1.duration_ = 8.3

		local var_225_0 = {
			ja = 8.3,
			ko = 5.033,
			zh = 6.2,
			en = 6.766
		}
		local var_225_1 = manager.audio:GetLocalizationFlag()

		if var_225_0[var_225_1] ~= nil then
			arg_225_1.duration_ = var_225_0[var_225_1]
		end

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play115301058(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["10030"]
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 and arg_225_1.var_.actorSpriteComps10030 == nil then
				arg_225_1.var_.actorSpriteComps10030 = var_228_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_228_2 = 0.2

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2

				if arg_225_1.var_.actorSpriteComps10030 then
					for iter_228_0, iter_228_1 in pairs(arg_225_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_228_1 then
							local var_228_4 = Mathf.Lerp(iter_228_1.color.r, 0.5, var_228_3)

							iter_228_1.color = Color.New(var_228_4, var_228_4, var_228_4)
						end
					end
				end
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 and arg_225_1.var_.actorSpriteComps10030 then
				local var_228_5 = 0.5

				for iter_228_2, iter_228_3 in pairs(arg_225_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_228_3 then
						iter_228_3.color = Color.New(var_228_5, var_228_5, var_228_5)
					end
				end

				arg_225_1.var_.actorSpriteComps10030 = nil
			end

			local var_228_6 = arg_225_1.actors_["1038"]
			local var_228_7 = 0

			if var_228_7 < arg_225_1.time_ and arg_225_1.time_ <= var_228_7 + arg_228_0 and arg_225_1.var_.actorSpriteComps1038 == nil then
				arg_225_1.var_.actorSpriteComps1038 = var_228_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_228_8 = 0.2

			if var_228_7 <= arg_225_1.time_ and arg_225_1.time_ < var_228_7 + var_228_8 then
				local var_228_9 = (arg_225_1.time_ - var_228_7) / var_228_8

				if arg_225_1.var_.actorSpriteComps1038 then
					for iter_228_4, iter_228_5 in pairs(arg_225_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_228_5 then
							local var_228_10 = Mathf.Lerp(iter_228_5.color.r, 1, var_228_9)

							iter_228_5.color = Color.New(var_228_10, var_228_10, var_228_10)
						end
					end
				end
			end

			if arg_225_1.time_ >= var_228_7 + var_228_8 and arg_225_1.time_ < var_228_7 + var_228_8 + arg_228_0 and arg_225_1.var_.actorSpriteComps1038 then
				local var_228_11 = 1

				for iter_228_6, iter_228_7 in pairs(arg_225_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_228_7 then
						iter_228_7.color = Color.New(var_228_11, var_228_11, var_228_11)
					end
				end

				arg_225_1.var_.actorSpriteComps1038 = nil
			end

			local var_228_12 = 0
			local var_228_13 = 0.6

			if var_228_12 < arg_225_1.time_ and arg_225_1.time_ <= var_228_12 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_14 = arg_225_1:FormatText(StoryNameCfg[94].name)

				arg_225_1.leftNameTxt_.text = var_228_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_15 = arg_225_1:GetWordFromCfg(115301057)
				local var_228_16 = arg_225_1:FormatText(var_228_15.content)

				arg_225_1.text_.text = var_228_16

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_17 = 24
				local var_228_18 = utf8.len(var_228_16)
				local var_228_19 = var_228_17 <= 0 and var_228_13 or var_228_13 * (var_228_18 / var_228_17)

				if var_228_19 > 0 and var_228_13 < var_228_19 then
					arg_225_1.talkMaxDuration = var_228_19

					if var_228_19 + var_228_12 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_19 + var_228_12
					end
				end

				arg_225_1.text_.text = var_228_16
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301057", "story_v_out_115301.awb") ~= 0 then
					local var_228_20 = manager.audio:GetVoiceLength("story_v_out_115301", "115301057", "story_v_out_115301.awb") / 1000

					if var_228_20 + var_228_12 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_20 + var_228_12
					end

					if var_228_15.prefab_name ~= "" and arg_225_1.actors_[var_228_15.prefab_name] ~= nil then
						local var_228_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_15.prefab_name].transform, "story_v_out_115301", "115301057", "story_v_out_115301.awb")

						arg_225_1:RecordAudio("115301057", var_228_21)
						arg_225_1:RecordAudio("115301057", var_228_21)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_115301", "115301057", "story_v_out_115301.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_115301", "115301057", "story_v_out_115301.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_22 = math.max(var_228_13, arg_225_1.talkMaxDuration)

			if var_228_12 <= arg_225_1.time_ and arg_225_1.time_ < var_228_12 + var_228_22 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_12) / var_228_22

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_12 + var_228_22 and arg_225_1.time_ < var_228_12 + var_228_22 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play115301058 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 115301058
		arg_229_1.duration_ = 10.4

		local var_229_0 = {
			ja = 10.4,
			ko = 7.3,
			zh = 7.566,
			en = 7.7
		}
		local var_229_1 = manager.audio:GetLocalizationFlag()

		if var_229_0[var_229_1] ~= nil then
			arg_229_1.duration_ = var_229_0[var_229_1]
		end

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play115301059(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["10030"]
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 and arg_229_1.var_.actorSpriteComps10030 == nil then
				arg_229_1.var_.actorSpriteComps10030 = var_232_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_232_2 = 0.2

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2

				if arg_229_1.var_.actorSpriteComps10030 then
					for iter_232_0, iter_232_1 in pairs(arg_229_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_232_1 then
							local var_232_4 = Mathf.Lerp(iter_232_1.color.r, 1, var_232_3)

							iter_232_1.color = Color.New(var_232_4, var_232_4, var_232_4)
						end
					end
				end
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 and arg_229_1.var_.actorSpriteComps10030 then
				local var_232_5 = 1

				for iter_232_2, iter_232_3 in pairs(arg_229_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_232_3 then
						iter_232_3.color = Color.New(var_232_5, var_232_5, var_232_5)
					end
				end

				arg_229_1.var_.actorSpriteComps10030 = nil
			end

			local var_232_6 = arg_229_1.actors_["1038"]
			local var_232_7 = 0

			if var_232_7 < arg_229_1.time_ and arg_229_1.time_ <= var_232_7 + arg_232_0 and arg_229_1.var_.actorSpriteComps1038 == nil then
				arg_229_1.var_.actorSpriteComps1038 = var_232_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_232_8 = 0.2

			if var_232_7 <= arg_229_1.time_ and arg_229_1.time_ < var_232_7 + var_232_8 then
				local var_232_9 = (arg_229_1.time_ - var_232_7) / var_232_8

				if arg_229_1.var_.actorSpriteComps1038 then
					for iter_232_4, iter_232_5 in pairs(arg_229_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_232_5 then
							local var_232_10 = Mathf.Lerp(iter_232_5.color.r, 0.5, var_232_9)

							iter_232_5.color = Color.New(var_232_10, var_232_10, var_232_10)
						end
					end
				end
			end

			if arg_229_1.time_ >= var_232_7 + var_232_8 and arg_229_1.time_ < var_232_7 + var_232_8 + arg_232_0 and arg_229_1.var_.actorSpriteComps1038 then
				local var_232_11 = 0.5

				for iter_232_6, iter_232_7 in pairs(arg_229_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_232_7 then
						iter_232_7.color = Color.New(var_232_11, var_232_11, var_232_11)
					end
				end

				arg_229_1.var_.actorSpriteComps1038 = nil
			end

			local var_232_12 = 0
			local var_232_13 = 0.775

			if var_232_12 < arg_229_1.time_ and arg_229_1.time_ <= var_232_12 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_14 = arg_229_1:FormatText(StoryNameCfg[309].name)

				arg_229_1.leftNameTxt_.text = var_232_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_15 = arg_229_1:GetWordFromCfg(115301058)
				local var_232_16 = arg_229_1:FormatText(var_232_15.content)

				arg_229_1.text_.text = var_232_16

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_17 = 31
				local var_232_18 = utf8.len(var_232_16)
				local var_232_19 = var_232_17 <= 0 and var_232_13 or var_232_13 * (var_232_18 / var_232_17)

				if var_232_19 > 0 and var_232_13 < var_232_19 then
					arg_229_1.talkMaxDuration = var_232_19

					if var_232_19 + var_232_12 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_19 + var_232_12
					end
				end

				arg_229_1.text_.text = var_232_16
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301058", "story_v_out_115301.awb") ~= 0 then
					local var_232_20 = manager.audio:GetVoiceLength("story_v_out_115301", "115301058", "story_v_out_115301.awb") / 1000

					if var_232_20 + var_232_12 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_20 + var_232_12
					end

					if var_232_15.prefab_name ~= "" and arg_229_1.actors_[var_232_15.prefab_name] ~= nil then
						local var_232_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_15.prefab_name].transform, "story_v_out_115301", "115301058", "story_v_out_115301.awb")

						arg_229_1:RecordAudio("115301058", var_232_21)
						arg_229_1:RecordAudio("115301058", var_232_21)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_115301", "115301058", "story_v_out_115301.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_115301", "115301058", "story_v_out_115301.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_22 = math.max(var_232_13, arg_229_1.talkMaxDuration)

			if var_232_12 <= arg_229_1.time_ and arg_229_1.time_ < var_232_12 + var_232_22 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_12) / var_232_22

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_12 + var_232_22 and arg_229_1.time_ < var_232_12 + var_232_22 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play115301059 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 115301059
		arg_233_1.duration_ = 2.4

		local var_233_0 = {
			ja = 1.766,
			ko = 1.333,
			zh = 2.4,
			en = 1.366
		}
		local var_233_1 = manager.audio:GetLocalizationFlag()

		if var_233_0[var_233_1] ~= nil then
			arg_233_1.duration_ = var_233_0[var_233_1]
		end

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play115301060(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["10030"]
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 and arg_233_1.var_.actorSpriteComps10030 == nil then
				arg_233_1.var_.actorSpriteComps10030 = var_236_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_236_2 = 0.2

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2

				if arg_233_1.var_.actorSpriteComps10030 then
					for iter_236_0, iter_236_1 in pairs(arg_233_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_236_1 then
							local var_236_4 = Mathf.Lerp(iter_236_1.color.r, 0.5, var_236_3)

							iter_236_1.color = Color.New(var_236_4, var_236_4, var_236_4)
						end
					end
				end
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 and arg_233_1.var_.actorSpriteComps10030 then
				local var_236_5 = 0.5

				for iter_236_2, iter_236_3 in pairs(arg_233_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_236_3 then
						iter_236_3.color = Color.New(var_236_5, var_236_5, var_236_5)
					end
				end

				arg_233_1.var_.actorSpriteComps10030 = nil
			end

			local var_236_6 = arg_233_1.actors_["1038"]
			local var_236_7 = 0

			if var_236_7 < arg_233_1.time_ and arg_233_1.time_ <= var_236_7 + arg_236_0 and arg_233_1.var_.actorSpriteComps1038 == nil then
				arg_233_1.var_.actorSpriteComps1038 = var_236_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_236_8 = 0.2

			if var_236_7 <= arg_233_1.time_ and arg_233_1.time_ < var_236_7 + var_236_8 then
				local var_236_9 = (arg_233_1.time_ - var_236_7) / var_236_8

				if arg_233_1.var_.actorSpriteComps1038 then
					for iter_236_4, iter_236_5 in pairs(arg_233_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_236_5 then
							local var_236_10 = Mathf.Lerp(iter_236_5.color.r, 1, var_236_9)

							iter_236_5.color = Color.New(var_236_10, var_236_10, var_236_10)
						end
					end
				end
			end

			if arg_233_1.time_ >= var_236_7 + var_236_8 and arg_233_1.time_ < var_236_7 + var_236_8 + arg_236_0 and arg_233_1.var_.actorSpriteComps1038 then
				local var_236_11 = 1

				for iter_236_6, iter_236_7 in pairs(arg_233_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_236_7 then
						iter_236_7.color = Color.New(var_236_11, var_236_11, var_236_11)
					end
				end

				arg_233_1.var_.actorSpriteComps1038 = nil
			end

			local var_236_12 = arg_233_1.actors_["1038"].transform
			local var_236_13 = 0

			if var_236_13 < arg_233_1.time_ and arg_233_1.time_ <= var_236_13 + arg_236_0 then
				arg_233_1.var_.moveOldPos1038 = var_236_12.localPosition
				var_236_12.localScale = Vector3.New(1, 1, 1)

				arg_233_1:CheckSpriteTmpPos("1038", 2)

				local var_236_14 = var_236_12.childCount

				for iter_236_8 = 0, var_236_14 - 1 do
					local var_236_15 = var_236_12:GetChild(iter_236_8)

					if var_236_15.name == "split_7" or not string.find(var_236_15.name, "split") then
						var_236_15.gameObject:SetActive(true)
					else
						var_236_15.gameObject:SetActive(false)
					end
				end
			end

			local var_236_16 = 0.001

			if var_236_13 <= arg_233_1.time_ and arg_233_1.time_ < var_236_13 + var_236_16 then
				local var_236_17 = (arg_233_1.time_ - var_236_13) / var_236_16
				local var_236_18 = Vector3.New(-390, -400, 0)

				var_236_12.localPosition = Vector3.Lerp(arg_233_1.var_.moveOldPos1038, var_236_18, var_236_17)
			end

			if arg_233_1.time_ >= var_236_13 + var_236_16 and arg_233_1.time_ < var_236_13 + var_236_16 + arg_236_0 then
				var_236_12.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_236_19 = 0
			local var_236_20 = 0.075

			if var_236_19 < arg_233_1.time_ and arg_233_1.time_ <= var_236_19 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_21 = arg_233_1:FormatText(StoryNameCfg[94].name)

				arg_233_1.leftNameTxt_.text = var_236_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_22 = arg_233_1:GetWordFromCfg(115301059)
				local var_236_23 = arg_233_1:FormatText(var_236_22.content)

				arg_233_1.text_.text = var_236_23

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_24 = 3
				local var_236_25 = utf8.len(var_236_23)
				local var_236_26 = var_236_24 <= 0 and var_236_20 or var_236_20 * (var_236_25 / var_236_24)

				if var_236_26 > 0 and var_236_20 < var_236_26 then
					arg_233_1.talkMaxDuration = var_236_26

					if var_236_26 + var_236_19 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_26 + var_236_19
					end
				end

				arg_233_1.text_.text = var_236_23
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301059", "story_v_out_115301.awb") ~= 0 then
					local var_236_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301059", "story_v_out_115301.awb") / 1000

					if var_236_27 + var_236_19 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_27 + var_236_19
					end

					if var_236_22.prefab_name ~= "" and arg_233_1.actors_[var_236_22.prefab_name] ~= nil then
						local var_236_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_22.prefab_name].transform, "story_v_out_115301", "115301059", "story_v_out_115301.awb")

						arg_233_1:RecordAudio("115301059", var_236_28)
						arg_233_1:RecordAudio("115301059", var_236_28)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_115301", "115301059", "story_v_out_115301.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_115301", "115301059", "story_v_out_115301.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_29 = math.max(var_236_20, arg_233_1.talkMaxDuration)

			if var_236_19 <= arg_233_1.time_ and arg_233_1.time_ < var_236_19 + var_236_29 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_19) / var_236_29

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_19 + var_236_29 and arg_233_1.time_ < var_236_19 + var_236_29 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play115301060 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 115301060
		arg_237_1.duration_ = 2.266

		local var_237_0 = {
			ja = 2.266,
			ko = 1.7,
			zh = 1.933,
			en = 1.333
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
				arg_237_0:Play115301061(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["10030"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.actorSpriteComps10030 == nil then
				arg_237_1.var_.actorSpriteComps10030 = var_240_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_240_2 = 0.2

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.actorSpriteComps10030 then
					for iter_240_0, iter_240_1 in pairs(arg_237_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_240_1 then
							local var_240_4 = Mathf.Lerp(iter_240_1.color.r, 1, var_240_3)

							iter_240_1.color = Color.New(var_240_4, var_240_4, var_240_4)
						end
					end
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.actorSpriteComps10030 then
				local var_240_5 = 1

				for iter_240_2, iter_240_3 in pairs(arg_237_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_240_3 then
						iter_240_3.color = Color.New(var_240_5, var_240_5, var_240_5)
					end
				end

				arg_237_1.var_.actorSpriteComps10030 = nil
			end

			local var_240_6 = arg_237_1.actors_["1038"]
			local var_240_7 = 0

			if var_240_7 < arg_237_1.time_ and arg_237_1.time_ <= var_240_7 + arg_240_0 and arg_237_1.var_.actorSpriteComps1038 == nil then
				arg_237_1.var_.actorSpriteComps1038 = var_240_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_240_8 = 0.2

			if var_240_7 <= arg_237_1.time_ and arg_237_1.time_ < var_240_7 + var_240_8 then
				local var_240_9 = (arg_237_1.time_ - var_240_7) / var_240_8

				if arg_237_1.var_.actorSpriteComps1038 then
					for iter_240_4, iter_240_5 in pairs(arg_237_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_240_5 then
							local var_240_10 = Mathf.Lerp(iter_240_5.color.r, 0.5, var_240_9)

							iter_240_5.color = Color.New(var_240_10, var_240_10, var_240_10)
						end
					end
				end
			end

			if arg_237_1.time_ >= var_240_7 + var_240_8 and arg_237_1.time_ < var_240_7 + var_240_8 + arg_240_0 and arg_237_1.var_.actorSpriteComps1038 then
				local var_240_11 = 0.5

				for iter_240_6, iter_240_7 in pairs(arg_237_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_240_7 then
						iter_240_7.color = Color.New(var_240_11, var_240_11, var_240_11)
					end
				end

				arg_237_1.var_.actorSpriteComps1038 = nil
			end

			local var_240_12 = arg_237_1.actors_["10030"].transform
			local var_240_13 = 0

			if var_240_13 < arg_237_1.time_ and arg_237_1.time_ <= var_240_13 + arg_240_0 then
				arg_237_1.var_.moveOldPos10030 = var_240_12.localPosition
				var_240_12.localScale = Vector3.New(1, 1, 1)

				arg_237_1:CheckSpriteTmpPos("10030", 4)

				local var_240_14 = var_240_12.childCount

				for iter_240_8 = 0, var_240_14 - 1 do
					local var_240_15 = var_240_12:GetChild(iter_240_8)

					if var_240_15.name == "split_4" or not string.find(var_240_15.name, "split") then
						var_240_15.gameObject:SetActive(true)
					else
						var_240_15.gameObject:SetActive(false)
					end
				end
			end

			local var_240_16 = 0.001

			if var_240_13 <= arg_237_1.time_ and arg_237_1.time_ < var_240_13 + var_240_16 then
				local var_240_17 = (arg_237_1.time_ - var_240_13) / var_240_16
				local var_240_18 = Vector3.New(390, -390, 150)

				var_240_12.localPosition = Vector3.Lerp(arg_237_1.var_.moveOldPos10030, var_240_18, var_240_17)
			end

			if arg_237_1.time_ >= var_240_13 + var_240_16 and arg_237_1.time_ < var_240_13 + var_240_16 + arg_240_0 then
				var_240_12.localPosition = Vector3.New(390, -390, 150)
			end

			local var_240_19 = 0
			local var_240_20 = 0.075

			if var_240_19 < arg_237_1.time_ and arg_237_1.time_ <= var_240_19 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_21 = arg_237_1:FormatText(StoryNameCfg[309].name)

				arg_237_1.leftNameTxt_.text = var_240_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_22 = arg_237_1:GetWordFromCfg(115301060)
				local var_240_23 = arg_237_1:FormatText(var_240_22.content)

				arg_237_1.text_.text = var_240_23

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_24 = 3
				local var_240_25 = utf8.len(var_240_23)
				local var_240_26 = var_240_24 <= 0 and var_240_20 or var_240_20 * (var_240_25 / var_240_24)

				if var_240_26 > 0 and var_240_20 < var_240_26 then
					arg_237_1.talkMaxDuration = var_240_26

					if var_240_26 + var_240_19 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_26 + var_240_19
					end
				end

				arg_237_1.text_.text = var_240_23
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301060", "story_v_out_115301.awb") ~= 0 then
					local var_240_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301060", "story_v_out_115301.awb") / 1000

					if var_240_27 + var_240_19 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_27 + var_240_19
					end

					if var_240_22.prefab_name ~= "" and arg_237_1.actors_[var_240_22.prefab_name] ~= nil then
						local var_240_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_22.prefab_name].transform, "story_v_out_115301", "115301060", "story_v_out_115301.awb")

						arg_237_1:RecordAudio("115301060", var_240_28)
						arg_237_1:RecordAudio("115301060", var_240_28)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_115301", "115301060", "story_v_out_115301.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_115301", "115301060", "story_v_out_115301.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_29 = math.max(var_240_20, arg_237_1.talkMaxDuration)

			if var_240_19 <= arg_237_1.time_ and arg_237_1.time_ < var_240_19 + var_240_29 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_19) / var_240_29

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_19 + var_240_29 and arg_237_1.time_ < var_240_19 + var_240_29 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play115301061 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 115301061
		arg_241_1.duration_ = 8.133

		local var_241_0 = {
			ja = 6.8,
			ko = 4.533,
			zh = 8.133,
			en = 5.566
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
				arg_241_0:Play115301062(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["10030"]
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 and arg_241_1.var_.actorSpriteComps10030 == nil then
				arg_241_1.var_.actorSpriteComps10030 = var_244_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_244_2 = 0.2

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2

				if arg_241_1.var_.actorSpriteComps10030 then
					for iter_244_0, iter_244_1 in pairs(arg_241_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_244_1 then
							local var_244_4 = Mathf.Lerp(iter_244_1.color.r, 0.5, var_244_3)

							iter_244_1.color = Color.New(var_244_4, var_244_4, var_244_4)
						end
					end
				end
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 and arg_241_1.var_.actorSpriteComps10030 then
				local var_244_5 = 0.5

				for iter_244_2, iter_244_3 in pairs(arg_241_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_244_3 then
						iter_244_3.color = Color.New(var_244_5, var_244_5, var_244_5)
					end
				end

				arg_241_1.var_.actorSpriteComps10030 = nil
			end

			local var_244_6 = arg_241_1.actors_["1038"]
			local var_244_7 = 0

			if var_244_7 < arg_241_1.time_ and arg_241_1.time_ <= var_244_7 + arg_244_0 and arg_241_1.var_.actorSpriteComps1038 == nil then
				arg_241_1.var_.actorSpriteComps1038 = var_244_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_244_8 = 0.2

			if var_244_7 <= arg_241_1.time_ and arg_241_1.time_ < var_244_7 + var_244_8 then
				local var_244_9 = (arg_241_1.time_ - var_244_7) / var_244_8

				if arg_241_1.var_.actorSpriteComps1038 then
					for iter_244_4, iter_244_5 in pairs(arg_241_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_244_5 then
							local var_244_10 = Mathf.Lerp(iter_244_5.color.r, 1, var_244_9)

							iter_244_5.color = Color.New(var_244_10, var_244_10, var_244_10)
						end
					end
				end
			end

			if arg_241_1.time_ >= var_244_7 + var_244_8 and arg_241_1.time_ < var_244_7 + var_244_8 + arg_244_0 and arg_241_1.var_.actorSpriteComps1038 then
				local var_244_11 = 1

				for iter_244_6, iter_244_7 in pairs(arg_241_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_244_7 then
						iter_244_7.color = Color.New(var_244_11, var_244_11, var_244_11)
					end
				end

				arg_241_1.var_.actorSpriteComps1038 = nil
			end

			local var_244_12 = 0
			local var_244_13 = 0.775

			if var_244_12 < arg_241_1.time_ and arg_241_1.time_ <= var_244_12 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_14 = arg_241_1:FormatText(StoryNameCfg[94].name)

				arg_241_1.leftNameTxt_.text = var_244_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_15 = arg_241_1:GetWordFromCfg(115301061)
				local var_244_16 = arg_241_1:FormatText(var_244_15.content)

				arg_241_1.text_.text = var_244_16

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_17 = 31
				local var_244_18 = utf8.len(var_244_16)
				local var_244_19 = var_244_17 <= 0 and var_244_13 or var_244_13 * (var_244_18 / var_244_17)

				if var_244_19 > 0 and var_244_13 < var_244_19 then
					arg_241_1.talkMaxDuration = var_244_19

					if var_244_19 + var_244_12 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_19 + var_244_12
					end
				end

				arg_241_1.text_.text = var_244_16
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301061", "story_v_out_115301.awb") ~= 0 then
					local var_244_20 = manager.audio:GetVoiceLength("story_v_out_115301", "115301061", "story_v_out_115301.awb") / 1000

					if var_244_20 + var_244_12 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_20 + var_244_12
					end

					if var_244_15.prefab_name ~= "" and arg_241_1.actors_[var_244_15.prefab_name] ~= nil then
						local var_244_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_15.prefab_name].transform, "story_v_out_115301", "115301061", "story_v_out_115301.awb")

						arg_241_1:RecordAudio("115301061", var_244_21)
						arg_241_1:RecordAudio("115301061", var_244_21)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_115301", "115301061", "story_v_out_115301.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_115301", "115301061", "story_v_out_115301.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_22 = math.max(var_244_13, arg_241_1.talkMaxDuration)

			if var_244_12 <= arg_241_1.time_ and arg_241_1.time_ < var_244_12 + var_244_22 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_12) / var_244_22

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_12 + var_244_22 and arg_241_1.time_ < var_244_12 + var_244_22 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play115301062 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 115301062
		arg_245_1.duration_ = 1.8

		local var_245_0 = {
			ja = 1.2,
			ko = 0.999999999999,
			zh = 1.8,
			en = 1.1
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
				arg_245_0:Play115301063(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["10030"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 and arg_245_1.var_.actorSpriteComps10030 == nil then
				arg_245_1.var_.actorSpriteComps10030 = var_248_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_248_2 = 0.2

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2

				if arg_245_1.var_.actorSpriteComps10030 then
					for iter_248_0, iter_248_1 in pairs(arg_245_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_248_1 then
							local var_248_4 = Mathf.Lerp(iter_248_1.color.r, 1, var_248_3)

							iter_248_1.color = Color.New(var_248_4, var_248_4, var_248_4)
						end
					end
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 and arg_245_1.var_.actorSpriteComps10030 then
				local var_248_5 = 1

				for iter_248_2, iter_248_3 in pairs(arg_245_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_248_3 then
						iter_248_3.color = Color.New(var_248_5, var_248_5, var_248_5)
					end
				end

				arg_245_1.var_.actorSpriteComps10030 = nil
			end

			local var_248_6 = arg_245_1.actors_["1038"]
			local var_248_7 = 0

			if var_248_7 < arg_245_1.time_ and arg_245_1.time_ <= var_248_7 + arg_248_0 and arg_245_1.var_.actorSpriteComps1038 == nil then
				arg_245_1.var_.actorSpriteComps1038 = var_248_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_248_8 = 0.2

			if var_248_7 <= arg_245_1.time_ and arg_245_1.time_ < var_248_7 + var_248_8 then
				local var_248_9 = (arg_245_1.time_ - var_248_7) / var_248_8

				if arg_245_1.var_.actorSpriteComps1038 then
					for iter_248_4, iter_248_5 in pairs(arg_245_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_248_5 then
							local var_248_10 = Mathf.Lerp(iter_248_5.color.r, 0.5, var_248_9)

							iter_248_5.color = Color.New(var_248_10, var_248_10, var_248_10)
						end
					end
				end
			end

			if arg_245_1.time_ >= var_248_7 + var_248_8 and arg_245_1.time_ < var_248_7 + var_248_8 + arg_248_0 and arg_245_1.var_.actorSpriteComps1038 then
				local var_248_11 = 0.5

				for iter_248_6, iter_248_7 in pairs(arg_245_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_248_7 then
						iter_248_7.color = Color.New(var_248_11, var_248_11, var_248_11)
					end
				end

				arg_245_1.var_.actorSpriteComps1038 = nil
			end

			local var_248_12 = arg_245_1.actors_["10030"].transform
			local var_248_13 = 0

			if var_248_13 < arg_245_1.time_ and arg_245_1.time_ <= var_248_13 + arg_248_0 then
				arg_245_1.var_.moveOldPos10030 = var_248_12.localPosition
				var_248_12.localScale = Vector3.New(1, 1, 1)

				arg_245_1:CheckSpriteTmpPos("10030", 4)

				local var_248_14 = var_248_12.childCount

				for iter_248_8 = 0, var_248_14 - 1 do
					local var_248_15 = var_248_12:GetChild(iter_248_8)

					if var_248_15.name == "split_1" or not string.find(var_248_15.name, "split") then
						var_248_15.gameObject:SetActive(true)
					else
						var_248_15.gameObject:SetActive(false)
					end
				end
			end

			local var_248_16 = 0.001

			if var_248_13 <= arg_245_1.time_ and arg_245_1.time_ < var_248_13 + var_248_16 then
				local var_248_17 = (arg_245_1.time_ - var_248_13) / var_248_16
				local var_248_18 = Vector3.New(390, -390, 150)

				var_248_12.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos10030, var_248_18, var_248_17)
			end

			if arg_245_1.time_ >= var_248_13 + var_248_16 and arg_245_1.time_ < var_248_13 + var_248_16 + arg_248_0 then
				var_248_12.localPosition = Vector3.New(390, -390, 150)
			end

			local var_248_19 = 0
			local var_248_20 = 0.1

			if var_248_19 < arg_245_1.time_ and arg_245_1.time_ <= var_248_19 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_21 = arg_245_1:FormatText(StoryNameCfg[309].name)

				arg_245_1.leftNameTxt_.text = var_248_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_22 = arg_245_1:GetWordFromCfg(115301062)
				local var_248_23 = arg_245_1:FormatText(var_248_22.content)

				arg_245_1.text_.text = var_248_23

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_24 = 4
				local var_248_25 = utf8.len(var_248_23)
				local var_248_26 = var_248_24 <= 0 and var_248_20 or var_248_20 * (var_248_25 / var_248_24)

				if var_248_26 > 0 and var_248_20 < var_248_26 then
					arg_245_1.talkMaxDuration = var_248_26

					if var_248_26 + var_248_19 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_26 + var_248_19
					end
				end

				arg_245_1.text_.text = var_248_23
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301062", "story_v_out_115301.awb") ~= 0 then
					local var_248_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301062", "story_v_out_115301.awb") / 1000

					if var_248_27 + var_248_19 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_27 + var_248_19
					end

					if var_248_22.prefab_name ~= "" and arg_245_1.actors_[var_248_22.prefab_name] ~= nil then
						local var_248_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_22.prefab_name].transform, "story_v_out_115301", "115301062", "story_v_out_115301.awb")

						arg_245_1:RecordAudio("115301062", var_248_28)
						arg_245_1:RecordAudio("115301062", var_248_28)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_115301", "115301062", "story_v_out_115301.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_115301", "115301062", "story_v_out_115301.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_29 = math.max(var_248_20, arg_245_1.talkMaxDuration)

			if var_248_19 <= arg_245_1.time_ and arg_245_1.time_ < var_248_19 + var_248_29 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_19) / var_248_29

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_19 + var_248_29 and arg_245_1.time_ < var_248_19 + var_248_29 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play115301063 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 115301063
		arg_249_1.duration_ = 12.566

		local var_249_0 = {
			ja = 9.766,
			ko = 7.6,
			zh = 11.666,
			en = 12.566
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
				arg_249_0:Play115301064(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["10030"]
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 and arg_249_1.var_.actorSpriteComps10030 == nil then
				arg_249_1.var_.actorSpriteComps10030 = var_252_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_252_2 = 0.2

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2

				if arg_249_1.var_.actorSpriteComps10030 then
					for iter_252_0, iter_252_1 in pairs(arg_249_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_252_1 then
							local var_252_4 = Mathf.Lerp(iter_252_1.color.r, 0.5, var_252_3)

							iter_252_1.color = Color.New(var_252_4, var_252_4, var_252_4)
						end
					end
				end
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 and arg_249_1.var_.actorSpriteComps10030 then
				local var_252_5 = 0.5

				for iter_252_2, iter_252_3 in pairs(arg_249_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_252_3 then
						iter_252_3.color = Color.New(var_252_5, var_252_5, var_252_5)
					end
				end

				arg_249_1.var_.actorSpriteComps10030 = nil
			end

			local var_252_6 = arg_249_1.actors_["1038"]
			local var_252_7 = 0

			if var_252_7 < arg_249_1.time_ and arg_249_1.time_ <= var_252_7 + arg_252_0 and arg_249_1.var_.actorSpriteComps1038 == nil then
				arg_249_1.var_.actorSpriteComps1038 = var_252_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_252_8 = 0.2

			if var_252_7 <= arg_249_1.time_ and arg_249_1.time_ < var_252_7 + var_252_8 then
				local var_252_9 = (arg_249_1.time_ - var_252_7) / var_252_8

				if arg_249_1.var_.actorSpriteComps1038 then
					for iter_252_4, iter_252_5 in pairs(arg_249_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_252_5 then
							local var_252_10 = Mathf.Lerp(iter_252_5.color.r, 1, var_252_9)

							iter_252_5.color = Color.New(var_252_10, var_252_10, var_252_10)
						end
					end
				end
			end

			if arg_249_1.time_ >= var_252_7 + var_252_8 and arg_249_1.time_ < var_252_7 + var_252_8 + arg_252_0 and arg_249_1.var_.actorSpriteComps1038 then
				local var_252_11 = 1

				for iter_252_6, iter_252_7 in pairs(arg_249_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_252_7 then
						iter_252_7.color = Color.New(var_252_11, var_252_11, var_252_11)
					end
				end

				arg_249_1.var_.actorSpriteComps1038 = nil
			end

			local var_252_12 = 0
			local var_252_13 = 1.125

			if var_252_12 < arg_249_1.time_ and arg_249_1.time_ <= var_252_12 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_14 = arg_249_1:FormatText(StoryNameCfg[94].name)

				arg_249_1.leftNameTxt_.text = var_252_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_15 = arg_249_1:GetWordFromCfg(115301063)
				local var_252_16 = arg_249_1:FormatText(var_252_15.content)

				arg_249_1.text_.text = var_252_16

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_17 = 45
				local var_252_18 = utf8.len(var_252_16)
				local var_252_19 = var_252_17 <= 0 and var_252_13 or var_252_13 * (var_252_18 / var_252_17)

				if var_252_19 > 0 and var_252_13 < var_252_19 then
					arg_249_1.talkMaxDuration = var_252_19

					if var_252_19 + var_252_12 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_19 + var_252_12
					end
				end

				arg_249_1.text_.text = var_252_16
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301063", "story_v_out_115301.awb") ~= 0 then
					local var_252_20 = manager.audio:GetVoiceLength("story_v_out_115301", "115301063", "story_v_out_115301.awb") / 1000

					if var_252_20 + var_252_12 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_20 + var_252_12
					end

					if var_252_15.prefab_name ~= "" and arg_249_1.actors_[var_252_15.prefab_name] ~= nil then
						local var_252_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_15.prefab_name].transform, "story_v_out_115301", "115301063", "story_v_out_115301.awb")

						arg_249_1:RecordAudio("115301063", var_252_21)
						arg_249_1:RecordAudio("115301063", var_252_21)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_115301", "115301063", "story_v_out_115301.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_115301", "115301063", "story_v_out_115301.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_22 = math.max(var_252_13, arg_249_1.talkMaxDuration)

			if var_252_12 <= arg_249_1.time_ and arg_249_1.time_ < var_252_12 + var_252_22 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_12) / var_252_22

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_12 + var_252_22 and arg_249_1.time_ < var_252_12 + var_252_22 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play115301064 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 115301064
		arg_253_1.duration_ = 13.166

		local var_253_0 = {
			ja = 13.166,
			ko = 11.9,
			zh = 12.5,
			en = 12.366
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
				arg_253_0:Play115301065(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0
			local var_256_1 = 1.2

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_2 = arg_253_1:FormatText(StoryNameCfg[94].name)

				arg_253_1.leftNameTxt_.text = var_256_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_3 = arg_253_1:GetWordFromCfg(115301064)
				local var_256_4 = arg_253_1:FormatText(var_256_3.content)

				arg_253_1.text_.text = var_256_4

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_5 = 48
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

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301064", "story_v_out_115301.awb") ~= 0 then
					local var_256_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301064", "story_v_out_115301.awb") / 1000

					if var_256_8 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_8 + var_256_0
					end

					if var_256_3.prefab_name ~= "" and arg_253_1.actors_[var_256_3.prefab_name] ~= nil then
						local var_256_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_3.prefab_name].transform, "story_v_out_115301", "115301064", "story_v_out_115301.awb")

						arg_253_1:RecordAudio("115301064", var_256_9)
						arg_253_1:RecordAudio("115301064", var_256_9)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_115301", "115301064", "story_v_out_115301.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_115301", "115301064", "story_v_out_115301.awb")
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
	Play115301065 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 115301065
		arg_257_1.duration_ = 9.933

		local var_257_0 = {
			ja = 9.933,
			ko = 5.966,
			zh = 7.6,
			en = 5.6
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
				arg_257_0:Play115301066(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0
			local var_260_1 = 0.7

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_2 = arg_257_1:FormatText(StoryNameCfg[94].name)

				arg_257_1.leftNameTxt_.text = var_260_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_3 = arg_257_1:GetWordFromCfg(115301065)
				local var_260_4 = arg_257_1:FormatText(var_260_3.content)

				arg_257_1.text_.text = var_260_4

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_5 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301065", "story_v_out_115301.awb") ~= 0 then
					local var_260_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301065", "story_v_out_115301.awb") / 1000

					if var_260_8 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_8 + var_260_0
					end

					if var_260_3.prefab_name ~= "" and arg_257_1.actors_[var_260_3.prefab_name] ~= nil then
						local var_260_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_3.prefab_name].transform, "story_v_out_115301", "115301065", "story_v_out_115301.awb")

						arg_257_1:RecordAudio("115301065", var_260_9)
						arg_257_1:RecordAudio("115301065", var_260_9)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_115301", "115301065", "story_v_out_115301.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_115301", "115301065", "story_v_out_115301.awb")
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
	Play115301066 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 115301066
		arg_261_1.duration_ = 5

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play115301067(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["1038"]
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 and arg_261_1.var_.actorSpriteComps1038 == nil then
				arg_261_1.var_.actorSpriteComps1038 = var_264_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_264_2 = 0.2

			if var_264_1 <= arg_261_1.time_ and arg_261_1.time_ < var_264_1 + var_264_2 then
				local var_264_3 = (arg_261_1.time_ - var_264_1) / var_264_2

				if arg_261_1.var_.actorSpriteComps1038 then
					for iter_264_0, iter_264_1 in pairs(arg_261_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_264_1 then
							local var_264_4 = Mathf.Lerp(iter_264_1.color.r, 0.5, var_264_3)

							iter_264_1.color = Color.New(var_264_4, var_264_4, var_264_4)
						end
					end
				end
			end

			if arg_261_1.time_ >= var_264_1 + var_264_2 and arg_261_1.time_ < var_264_1 + var_264_2 + arg_264_0 and arg_261_1.var_.actorSpriteComps1038 then
				local var_264_5 = 0.5

				for iter_264_2, iter_264_3 in pairs(arg_261_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_264_3 then
						iter_264_3.color = Color.New(var_264_5, var_264_5, var_264_5)
					end
				end

				arg_261_1.var_.actorSpriteComps1038 = nil
			end

			local var_264_6 = 0
			local var_264_7 = 1.125

			if var_264_6 < arg_261_1.time_ and arg_261_1.time_ <= var_264_6 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, false)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_8 = arg_261_1:GetWordFromCfg(115301066)
				local var_264_9 = arg_261_1:FormatText(var_264_8.content)

				arg_261_1.text_.text = var_264_9

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_10 = 45
				local var_264_11 = utf8.len(var_264_9)
				local var_264_12 = var_264_10 <= 0 and var_264_7 or var_264_7 * (var_264_11 / var_264_10)

				if var_264_12 > 0 and var_264_7 < var_264_12 then
					arg_261_1.talkMaxDuration = var_264_12

					if var_264_12 + var_264_6 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_12 + var_264_6
					end
				end

				arg_261_1.text_.text = var_264_9
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)
				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_13 = math.max(var_264_7, arg_261_1.talkMaxDuration)

			if var_264_6 <= arg_261_1.time_ and arg_261_1.time_ < var_264_6 + var_264_13 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_6) / var_264_13

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_6 + var_264_13 and arg_261_1.time_ < var_264_6 + var_264_13 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play115301067 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 115301067
		arg_265_1.duration_ = 3.766

		local var_265_0 = {
			ja = 1.033,
			ko = 2.133,
			zh = 3.766,
			en = 1.6
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
				arg_265_0:Play115301068(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["10030"].transform
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 then
				arg_265_1.var_.moveOldPos10030 = var_268_0.localPosition
				var_268_0.localScale = Vector3.New(1, 1, 1)

				arg_265_1:CheckSpriteTmpPos("10030", 4)

				local var_268_2 = var_268_0.childCount

				for iter_268_0 = 0, var_268_2 - 1 do
					local var_268_3 = var_268_0:GetChild(iter_268_0)

					if var_268_3.name == "split_3" or not string.find(var_268_3.name, "split") then
						var_268_3.gameObject:SetActive(true)
					else
						var_268_3.gameObject:SetActive(false)
					end
				end
			end

			local var_268_4 = 0.001

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_4 then
				local var_268_5 = (arg_265_1.time_ - var_268_1) / var_268_4
				local var_268_6 = Vector3.New(390, -390, 150)

				var_268_0.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos10030, var_268_6, var_268_5)
			end

			if arg_265_1.time_ >= var_268_1 + var_268_4 and arg_265_1.time_ < var_268_1 + var_268_4 + arg_268_0 then
				var_268_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_268_7 = arg_265_1.actors_["10030"]
			local var_268_8 = 0

			if var_268_8 < arg_265_1.time_ and arg_265_1.time_ <= var_268_8 + arg_268_0 and arg_265_1.var_.actorSpriteComps10030 == nil then
				arg_265_1.var_.actorSpriteComps10030 = var_268_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_268_9 = 0.2

			if var_268_8 <= arg_265_1.time_ and arg_265_1.time_ < var_268_8 + var_268_9 then
				local var_268_10 = (arg_265_1.time_ - var_268_8) / var_268_9

				if arg_265_1.var_.actorSpriteComps10030 then
					for iter_268_1, iter_268_2 in pairs(arg_265_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_268_2 then
							local var_268_11 = Mathf.Lerp(iter_268_2.color.r, 1, var_268_10)

							iter_268_2.color = Color.New(var_268_11, var_268_11, var_268_11)
						end
					end
				end
			end

			if arg_265_1.time_ >= var_268_8 + var_268_9 and arg_265_1.time_ < var_268_8 + var_268_9 + arg_268_0 and arg_265_1.var_.actorSpriteComps10030 then
				local var_268_12 = 1

				for iter_268_3, iter_268_4 in pairs(arg_265_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_268_4 then
						iter_268_4.color = Color.New(var_268_12, var_268_12, var_268_12)
					end
				end

				arg_265_1.var_.actorSpriteComps10030 = nil
			end

			local var_268_13 = arg_265_1.actors_["10030"]
			local var_268_14 = 0

			if var_268_14 < arg_265_1.time_ and arg_265_1.time_ <= var_268_14 + arg_268_0 then
				local var_268_15 = var_268_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_268_15 then
					arg_265_1.var_.alphaOldValue10030 = var_268_15.alpha
					arg_265_1.var_.characterEffect10030 = var_268_15
				end

				arg_265_1.var_.alphaOldValue10030 = 0
			end

			local var_268_16 = 0.0166666666666667

			if var_268_14 <= arg_265_1.time_ and arg_265_1.time_ < var_268_14 + var_268_16 then
				local var_268_17 = (arg_265_1.time_ - var_268_14) / var_268_16
				local var_268_18 = Mathf.Lerp(arg_265_1.var_.alphaOldValue10030, 1, var_268_17)

				if arg_265_1.var_.characterEffect10030 then
					arg_265_1.var_.characterEffect10030.alpha = var_268_18
				end
			end

			if arg_265_1.time_ >= var_268_14 + var_268_16 and arg_265_1.time_ < var_268_14 + var_268_16 + arg_268_0 and arg_265_1.var_.characterEffect10030 then
				arg_265_1.var_.characterEffect10030.alpha = 1
			end

			local var_268_19 = 0
			local var_268_20 = 0.125

			if var_268_19 < arg_265_1.time_ and arg_265_1.time_ <= var_268_19 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_21 = arg_265_1:FormatText(StoryNameCfg[309].name)

				arg_265_1.leftNameTxt_.text = var_268_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_22 = arg_265_1:GetWordFromCfg(115301067)
				local var_268_23 = arg_265_1:FormatText(var_268_22.content)

				arg_265_1.text_.text = var_268_23

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_24 = 5
				local var_268_25 = utf8.len(var_268_23)
				local var_268_26 = var_268_24 <= 0 and var_268_20 or var_268_20 * (var_268_25 / var_268_24)

				if var_268_26 > 0 and var_268_20 < var_268_26 then
					arg_265_1.talkMaxDuration = var_268_26

					if var_268_26 + var_268_19 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_26 + var_268_19
					end
				end

				arg_265_1.text_.text = var_268_23
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301067", "story_v_out_115301.awb") ~= 0 then
					local var_268_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301067", "story_v_out_115301.awb") / 1000

					if var_268_27 + var_268_19 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_27 + var_268_19
					end

					if var_268_22.prefab_name ~= "" and arg_265_1.actors_[var_268_22.prefab_name] ~= nil then
						local var_268_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_22.prefab_name].transform, "story_v_out_115301", "115301067", "story_v_out_115301.awb")

						arg_265_1:RecordAudio("115301067", var_268_28)
						arg_265_1:RecordAudio("115301067", var_268_28)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_115301", "115301067", "story_v_out_115301.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_115301", "115301067", "story_v_out_115301.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_29 = math.max(var_268_20, arg_265_1.talkMaxDuration)

			if var_268_19 <= arg_265_1.time_ and arg_265_1.time_ < var_268_19 + var_268_29 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_19) / var_268_29

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_19 + var_268_29 and arg_265_1.time_ < var_268_19 + var_268_29 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play115301068 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 115301068
		arg_269_1.duration_ = 5

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play115301069(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["10030"]
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 then
				local var_272_2 = var_272_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_272_2 then
					arg_269_1.var_.alphaOldValue10030 = var_272_2.alpha
					arg_269_1.var_.characterEffect10030 = var_272_2
				end

				arg_269_1.var_.alphaOldValue10030 = 1
			end

			local var_272_3 = 0.333333333333333

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_3 then
				local var_272_4 = (arg_269_1.time_ - var_272_1) / var_272_3
				local var_272_5 = Mathf.Lerp(arg_269_1.var_.alphaOldValue10030, 0, var_272_4)

				if arg_269_1.var_.characterEffect10030 then
					arg_269_1.var_.characterEffect10030.alpha = var_272_5
				end
			end

			if arg_269_1.time_ >= var_272_1 + var_272_3 and arg_269_1.time_ < var_272_1 + var_272_3 + arg_272_0 and arg_269_1.var_.characterEffect10030 then
				arg_269_1.var_.characterEffect10030.alpha = 0
			end

			local var_272_6 = arg_269_1.actors_["1038"]
			local var_272_7 = 0

			if var_272_7 < arg_269_1.time_ and arg_269_1.time_ <= var_272_7 + arg_272_0 then
				local var_272_8 = var_272_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_272_8 then
					arg_269_1.var_.alphaOldValue1038 = var_272_8.alpha
					arg_269_1.var_.characterEffect1038 = var_272_8
				end

				arg_269_1.var_.alphaOldValue1038 = 1
			end

			local var_272_9 = 0.333333333333333

			if var_272_7 <= arg_269_1.time_ and arg_269_1.time_ < var_272_7 + var_272_9 then
				local var_272_10 = (arg_269_1.time_ - var_272_7) / var_272_9
				local var_272_11 = Mathf.Lerp(arg_269_1.var_.alphaOldValue1038, 0, var_272_10)

				if arg_269_1.var_.characterEffect1038 then
					arg_269_1.var_.characterEffect1038.alpha = var_272_11
				end
			end

			if arg_269_1.time_ >= var_272_7 + var_272_9 and arg_269_1.time_ < var_272_7 + var_272_9 + arg_272_0 and arg_269_1.var_.characterEffect1038 then
				arg_269_1.var_.characterEffect1038.alpha = 0
			end

			local var_272_12 = 0
			local var_272_13 = 0.85

			if var_272_12 < arg_269_1.time_ and arg_269_1.time_ <= var_272_12 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, false)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_14 = arg_269_1:GetWordFromCfg(115301068)
				local var_272_15 = arg_269_1:FormatText(var_272_14.content)

				arg_269_1.text_.text = var_272_15

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_16 = 34
				local var_272_17 = utf8.len(var_272_15)
				local var_272_18 = var_272_16 <= 0 and var_272_13 or var_272_13 * (var_272_17 / var_272_16)

				if var_272_18 > 0 and var_272_13 < var_272_18 then
					arg_269_1.talkMaxDuration = var_272_18

					if var_272_18 + var_272_12 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_18 + var_272_12
					end
				end

				arg_269_1.text_.text = var_272_15
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)
				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_19 = math.max(var_272_13, arg_269_1.talkMaxDuration)

			if var_272_12 <= arg_269_1.time_ and arg_269_1.time_ < var_272_12 + var_272_19 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_12) / var_272_19

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_12 + var_272_19 and arg_269_1.time_ < var_272_12 + var_272_19 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play115301069 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 115301069
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play115301070(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 0.95

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, false)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_2 = arg_273_1:GetWordFromCfg(115301069)
				local var_276_3 = arg_273_1:FormatText(var_276_2.content)

				arg_273_1.text_.text = var_276_3

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_4 = 38
				local var_276_5 = utf8.len(var_276_3)
				local var_276_6 = var_276_4 <= 0 and var_276_1 or var_276_1 * (var_276_5 / var_276_4)

				if var_276_6 > 0 and var_276_1 < var_276_6 then
					arg_273_1.talkMaxDuration = var_276_6

					if var_276_6 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_6 + var_276_0
					end
				end

				arg_273_1.text_.text = var_276_3
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)
				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_7 = math.max(var_276_1, arg_273_1.talkMaxDuration)

			if var_276_0 <= arg_273_1.time_ and arg_273_1.time_ < var_276_0 + var_276_7 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_0) / var_276_7

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_0 + var_276_7 and arg_273_1.time_ < var_276_0 + var_276_7 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play115301070 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 115301070
		arg_277_1.duration_ = 15.966

		local var_277_0 = {
			ja = 15.966,
			ko = 12.466,
			zh = 12.333,
			en = 12.833
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
				arg_277_0:Play115301071(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["1038"].transform
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 then
				arg_277_1.var_.moveOldPos1038 = var_280_0.localPosition
				var_280_0.localScale = Vector3.New(1, 1, 1)

				arg_277_1:CheckSpriteTmpPos("1038", 3)

				local var_280_2 = var_280_0.childCount

				for iter_280_0 = 0, var_280_2 - 1 do
					local var_280_3 = var_280_0:GetChild(iter_280_0)

					if var_280_3.name == "split_1" or not string.find(var_280_3.name, "split") then
						var_280_3.gameObject:SetActive(true)
					else
						var_280_3.gameObject:SetActive(false)
					end
				end
			end

			local var_280_4 = 0.001

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_4 then
				local var_280_5 = (arg_277_1.time_ - var_280_1) / var_280_4
				local var_280_6 = Vector3.New(0, -400, 0)

				var_280_0.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos1038, var_280_6, var_280_5)
			end

			if arg_277_1.time_ >= var_280_1 + var_280_4 and arg_277_1.time_ < var_280_1 + var_280_4 + arg_280_0 then
				var_280_0.localPosition = Vector3.New(0, -400, 0)
			end

			local var_280_7 = arg_277_1.actors_["1038"]
			local var_280_8 = 0

			if var_280_8 < arg_277_1.time_ and arg_277_1.time_ <= var_280_8 + arg_280_0 and arg_277_1.var_.actorSpriteComps1038 == nil then
				arg_277_1.var_.actorSpriteComps1038 = var_280_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_280_9 = 0.2

			if var_280_8 <= arg_277_1.time_ and arg_277_1.time_ < var_280_8 + var_280_9 then
				local var_280_10 = (arg_277_1.time_ - var_280_8) / var_280_9

				if arg_277_1.var_.actorSpriteComps1038 then
					for iter_280_1, iter_280_2 in pairs(arg_277_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_280_2 then
							local var_280_11 = Mathf.Lerp(iter_280_2.color.r, 1, var_280_10)

							iter_280_2.color = Color.New(var_280_11, var_280_11, var_280_11)
						end
					end
				end
			end

			if arg_277_1.time_ >= var_280_8 + var_280_9 and arg_277_1.time_ < var_280_8 + var_280_9 + arg_280_0 and arg_277_1.var_.actorSpriteComps1038 then
				local var_280_12 = 1

				for iter_280_3, iter_280_4 in pairs(arg_277_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_280_4 then
						iter_280_4.color = Color.New(var_280_12, var_280_12, var_280_12)
					end
				end

				arg_277_1.var_.actorSpriteComps1038 = nil
			end

			local var_280_13 = arg_277_1.actors_["1038"]
			local var_280_14 = 0

			if var_280_14 < arg_277_1.time_ and arg_277_1.time_ <= var_280_14 + arg_280_0 then
				local var_280_15 = var_280_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_280_15 then
					arg_277_1.var_.alphaOldValue1038 = var_280_15.alpha
					arg_277_1.var_.characterEffect1038 = var_280_15
				end

				arg_277_1.var_.alphaOldValue1038 = 0
			end

			local var_280_16 = 0.333333333333333

			if var_280_14 <= arg_277_1.time_ and arg_277_1.time_ < var_280_14 + var_280_16 then
				local var_280_17 = (arg_277_1.time_ - var_280_14) / var_280_16
				local var_280_18 = Mathf.Lerp(arg_277_1.var_.alphaOldValue1038, 1, var_280_17)

				if arg_277_1.var_.characterEffect1038 then
					arg_277_1.var_.characterEffect1038.alpha = var_280_18
				end
			end

			if arg_277_1.time_ >= var_280_14 + var_280_16 and arg_277_1.time_ < var_280_14 + var_280_16 + arg_280_0 and arg_277_1.var_.characterEffect1038 then
				arg_277_1.var_.characterEffect1038.alpha = 1
			end

			local var_280_19 = 0
			local var_280_20 = 1.15

			if var_280_19 < arg_277_1.time_ and arg_277_1.time_ <= var_280_19 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_21 = arg_277_1:FormatText(StoryNameCfg[94].name)

				arg_277_1.leftNameTxt_.text = var_280_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_22 = arg_277_1:GetWordFromCfg(115301070)
				local var_280_23 = arg_277_1:FormatText(var_280_22.content)

				arg_277_1.text_.text = var_280_23

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_24 = 46
				local var_280_25 = utf8.len(var_280_23)
				local var_280_26 = var_280_24 <= 0 and var_280_20 or var_280_20 * (var_280_25 / var_280_24)

				if var_280_26 > 0 and var_280_20 < var_280_26 then
					arg_277_1.talkMaxDuration = var_280_26

					if var_280_26 + var_280_19 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_26 + var_280_19
					end
				end

				arg_277_1.text_.text = var_280_23
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301070", "story_v_out_115301.awb") ~= 0 then
					local var_280_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301070", "story_v_out_115301.awb") / 1000

					if var_280_27 + var_280_19 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_27 + var_280_19
					end

					if var_280_22.prefab_name ~= "" and arg_277_1.actors_[var_280_22.prefab_name] ~= nil then
						local var_280_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_22.prefab_name].transform, "story_v_out_115301", "115301070", "story_v_out_115301.awb")

						arg_277_1:RecordAudio("115301070", var_280_28)
						arg_277_1:RecordAudio("115301070", var_280_28)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_115301", "115301070", "story_v_out_115301.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_115301", "115301070", "story_v_out_115301.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_29 = math.max(var_280_20, arg_277_1.talkMaxDuration)

			if var_280_19 <= arg_277_1.time_ and arg_277_1.time_ < var_280_19 + var_280_29 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_19) / var_280_29

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_19 + var_280_29 and arg_277_1.time_ < var_280_19 + var_280_29 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play115301071 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 115301071
		arg_281_1.duration_ = 11.6

		local var_281_0 = {
			ja = 11.6,
			ko = 8.766,
			zh = 10.266,
			en = 8.966
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
				arg_281_0:Play115301072(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = 0
			local var_284_1 = 0.9

			if var_284_0 < arg_281_1.time_ and arg_281_1.time_ <= var_284_0 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_2 = arg_281_1:FormatText(StoryNameCfg[94].name)

				arg_281_1.leftNameTxt_.text = var_284_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_3 = arg_281_1:GetWordFromCfg(115301071)
				local var_284_4 = arg_281_1:FormatText(var_284_3.content)

				arg_281_1.text_.text = var_284_4

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_5 = 36
				local var_284_6 = utf8.len(var_284_4)
				local var_284_7 = var_284_5 <= 0 and var_284_1 or var_284_1 * (var_284_6 / var_284_5)

				if var_284_7 > 0 and var_284_1 < var_284_7 then
					arg_281_1.talkMaxDuration = var_284_7

					if var_284_7 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_7 + var_284_0
					end
				end

				arg_281_1.text_.text = var_284_4
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301071", "story_v_out_115301.awb") ~= 0 then
					local var_284_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301071", "story_v_out_115301.awb") / 1000

					if var_284_8 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_8 + var_284_0
					end

					if var_284_3.prefab_name ~= "" and arg_281_1.actors_[var_284_3.prefab_name] ~= nil then
						local var_284_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_3.prefab_name].transform, "story_v_out_115301", "115301071", "story_v_out_115301.awb")

						arg_281_1:RecordAudio("115301071", var_284_9)
						arg_281_1:RecordAudio("115301071", var_284_9)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_115301", "115301071", "story_v_out_115301.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_115301", "115301071", "story_v_out_115301.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_10 = math.max(var_284_1, arg_281_1.talkMaxDuration)

			if var_284_0 <= arg_281_1.time_ and arg_281_1.time_ < var_284_0 + var_284_10 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_0) / var_284_10

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_0 + var_284_10 and arg_281_1.time_ < var_284_0 + var_284_10 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play115301072 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 115301072
		arg_285_1.duration_ = 5

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play115301073(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["1038"]
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 then
				local var_288_2 = var_288_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_288_2 then
					arg_285_1.var_.alphaOldValue1038 = var_288_2.alpha
					arg_285_1.var_.characterEffect1038 = var_288_2
				end

				arg_285_1.var_.alphaOldValue1038 = 1
			end

			local var_288_3 = 0.333333333333333

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_3 then
				local var_288_4 = (arg_285_1.time_ - var_288_1) / var_288_3
				local var_288_5 = Mathf.Lerp(arg_285_1.var_.alphaOldValue1038, 0, var_288_4)

				if arg_285_1.var_.characterEffect1038 then
					arg_285_1.var_.characterEffect1038.alpha = var_288_5
				end
			end

			if arg_285_1.time_ >= var_288_1 + var_288_3 and arg_285_1.time_ < var_288_1 + var_288_3 + arg_288_0 and arg_285_1.var_.characterEffect1038 then
				arg_285_1.var_.characterEffect1038.alpha = 0
			end

			local var_288_6 = 0
			local var_288_7 = 0.675

			if var_288_6 < arg_285_1.time_ and arg_285_1.time_ <= var_288_6 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, false)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_8 = arg_285_1:GetWordFromCfg(115301072)
				local var_288_9 = arg_285_1:FormatText(var_288_8.content)

				arg_285_1.text_.text = var_288_9

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_10 = 27
				local var_288_11 = utf8.len(var_288_9)
				local var_288_12 = var_288_10 <= 0 and var_288_7 or var_288_7 * (var_288_11 / var_288_10)

				if var_288_12 > 0 and var_288_7 < var_288_12 then
					arg_285_1.talkMaxDuration = var_288_12

					if var_288_12 + var_288_6 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_12 + var_288_6
					end
				end

				arg_285_1.text_.text = var_288_9
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)
				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_13 = math.max(var_288_7, arg_285_1.talkMaxDuration)

			if var_288_6 <= arg_285_1.time_ and arg_285_1.time_ < var_288_6 + var_288_13 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_6) / var_288_13

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_6 + var_288_13 and arg_285_1.time_ < var_288_6 + var_288_13 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play115301073 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 115301073
		arg_289_1.duration_ = 13.1

		local var_289_0 = {
			ja = 13.1,
			ko = 9.6,
			zh = 11,
			en = 10.166
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
				arg_289_0:Play115301074(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = arg_289_1.actors_["1038"].transform
			local var_292_1 = 0

			if var_292_1 < arg_289_1.time_ and arg_289_1.time_ <= var_292_1 + arg_292_0 then
				arg_289_1.var_.moveOldPos1038 = var_292_0.localPosition
				var_292_0.localScale = Vector3.New(1, 1, 1)

				arg_289_1:CheckSpriteTmpPos("1038", 2)

				local var_292_2 = var_292_0.childCount

				for iter_292_0 = 0, var_292_2 - 1 do
					local var_292_3 = var_292_0:GetChild(iter_292_0)

					if var_292_3.name == "split_1" or not string.find(var_292_3.name, "split") then
						var_292_3.gameObject:SetActive(true)
					else
						var_292_3.gameObject:SetActive(false)
					end
				end
			end

			local var_292_4 = 0.001

			if var_292_1 <= arg_289_1.time_ and arg_289_1.time_ < var_292_1 + var_292_4 then
				local var_292_5 = (arg_289_1.time_ - var_292_1) / var_292_4
				local var_292_6 = Vector3.New(-390, -400, 0)

				var_292_0.localPosition = Vector3.Lerp(arg_289_1.var_.moveOldPos1038, var_292_6, var_292_5)
			end

			if arg_289_1.time_ >= var_292_1 + var_292_4 and arg_289_1.time_ < var_292_1 + var_292_4 + arg_292_0 then
				var_292_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_292_7 = arg_289_1.actors_["1038"]
			local var_292_8 = 0

			if var_292_8 < arg_289_1.time_ and arg_289_1.time_ <= var_292_8 + arg_292_0 then
				local var_292_9 = var_292_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_292_9 then
					arg_289_1.var_.alphaOldValue1038 = var_292_9.alpha
					arg_289_1.var_.characterEffect1038 = var_292_9
				end

				arg_289_1.var_.alphaOldValue1038 = 0
			end

			local var_292_10 = 0.333333333333333

			if var_292_8 <= arg_289_1.time_ and arg_289_1.time_ < var_292_8 + var_292_10 then
				local var_292_11 = (arg_289_1.time_ - var_292_8) / var_292_10
				local var_292_12 = Mathf.Lerp(arg_289_1.var_.alphaOldValue1038, 1, var_292_11)

				if arg_289_1.var_.characterEffect1038 then
					arg_289_1.var_.characterEffect1038.alpha = var_292_12
				end
			end

			if arg_289_1.time_ >= var_292_8 + var_292_10 and arg_289_1.time_ < var_292_8 + var_292_10 + arg_292_0 and arg_289_1.var_.characterEffect1038 then
				arg_289_1.var_.characterEffect1038.alpha = 1
			end

			local var_292_13 = arg_289_1.actors_["1038"]
			local var_292_14 = 0

			if var_292_14 < arg_289_1.time_ and arg_289_1.time_ <= var_292_14 + arg_292_0 and arg_289_1.var_.actorSpriteComps1038 == nil then
				arg_289_1.var_.actorSpriteComps1038 = var_292_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_292_15 = 0.2

			if var_292_14 <= arg_289_1.time_ and arg_289_1.time_ < var_292_14 + var_292_15 then
				local var_292_16 = (arg_289_1.time_ - var_292_14) / var_292_15

				if arg_289_1.var_.actorSpriteComps1038 then
					for iter_292_1, iter_292_2 in pairs(arg_289_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_292_2 then
							local var_292_17 = Mathf.Lerp(iter_292_2.color.r, 1, var_292_16)

							iter_292_2.color = Color.New(var_292_17, var_292_17, var_292_17)
						end
					end
				end
			end

			if arg_289_1.time_ >= var_292_14 + var_292_15 and arg_289_1.time_ < var_292_14 + var_292_15 + arg_292_0 and arg_289_1.var_.actorSpriteComps1038 then
				local var_292_18 = 1

				for iter_292_3, iter_292_4 in pairs(arg_289_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_292_4 then
						iter_292_4.color = Color.New(var_292_18, var_292_18, var_292_18)
					end
				end

				arg_289_1.var_.actorSpriteComps1038 = nil
			end

			local var_292_19 = 0
			local var_292_20 = 0.95

			if var_292_19 < arg_289_1.time_ and arg_289_1.time_ <= var_292_19 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_21 = arg_289_1:FormatText(StoryNameCfg[94].name)

				arg_289_1.leftNameTxt_.text = var_292_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_22 = arg_289_1:GetWordFromCfg(115301073)
				local var_292_23 = arg_289_1:FormatText(var_292_22.content)

				arg_289_1.text_.text = var_292_23

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_24 = 38
				local var_292_25 = utf8.len(var_292_23)
				local var_292_26 = var_292_24 <= 0 and var_292_20 or var_292_20 * (var_292_25 / var_292_24)

				if var_292_26 > 0 and var_292_20 < var_292_26 then
					arg_289_1.talkMaxDuration = var_292_26

					if var_292_26 + var_292_19 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_26 + var_292_19
					end
				end

				arg_289_1.text_.text = var_292_23
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301073", "story_v_out_115301.awb") ~= 0 then
					local var_292_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301073", "story_v_out_115301.awb") / 1000

					if var_292_27 + var_292_19 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_27 + var_292_19
					end

					if var_292_22.prefab_name ~= "" and arg_289_1.actors_[var_292_22.prefab_name] ~= nil then
						local var_292_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_22.prefab_name].transform, "story_v_out_115301", "115301073", "story_v_out_115301.awb")

						arg_289_1:RecordAudio("115301073", var_292_28)
						arg_289_1:RecordAudio("115301073", var_292_28)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_115301", "115301073", "story_v_out_115301.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_115301", "115301073", "story_v_out_115301.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_29 = math.max(var_292_20, arg_289_1.talkMaxDuration)

			if var_292_19 <= arg_289_1.time_ and arg_289_1.time_ < var_292_19 + var_292_29 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_19) / var_292_29

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_19 + var_292_29 and arg_289_1.time_ < var_292_19 + var_292_29 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play115301074 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 115301074
		arg_293_1.duration_ = 7.1

		local var_293_0 = {
			ja = 5.266,
			ko = 5,
			zh = 7.1,
			en = 6.333
		}
		local var_293_1 = manager.audio:GetLocalizationFlag()

		if var_293_0[var_293_1] ~= nil then
			arg_293_1.duration_ = var_293_0[var_293_1]
		end

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play115301075(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["10030"].transform
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 then
				arg_293_1.var_.moveOldPos10030 = var_296_0.localPosition
				var_296_0.localScale = Vector3.New(1, 1, 1)

				arg_293_1:CheckSpriteTmpPos("10030", 4)

				local var_296_2 = var_296_0.childCount

				for iter_296_0 = 0, var_296_2 - 1 do
					local var_296_3 = var_296_0:GetChild(iter_296_0)

					if var_296_3.name == "split_3" or not string.find(var_296_3.name, "split") then
						var_296_3.gameObject:SetActive(true)
					else
						var_296_3.gameObject:SetActive(false)
					end
				end
			end

			local var_296_4 = 0.001

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_4 then
				local var_296_5 = (arg_293_1.time_ - var_296_1) / var_296_4
				local var_296_6 = Vector3.New(390, -390, 150)

				var_296_0.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos10030, var_296_6, var_296_5)
			end

			if arg_293_1.time_ >= var_296_1 + var_296_4 and arg_293_1.time_ < var_296_1 + var_296_4 + arg_296_0 then
				var_296_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_296_7 = arg_293_1.actors_["1038"]
			local var_296_8 = 0

			if var_296_8 < arg_293_1.time_ and arg_293_1.time_ <= var_296_8 + arg_296_0 and arg_293_1.var_.actorSpriteComps1038 == nil then
				arg_293_1.var_.actorSpriteComps1038 = var_296_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_296_9 = 0.2

			if var_296_8 <= arg_293_1.time_ and arg_293_1.time_ < var_296_8 + var_296_9 then
				local var_296_10 = (arg_293_1.time_ - var_296_8) / var_296_9

				if arg_293_1.var_.actorSpriteComps1038 then
					for iter_296_1, iter_296_2 in pairs(arg_293_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_296_2 then
							local var_296_11 = Mathf.Lerp(iter_296_2.color.r, 0.5, var_296_10)

							iter_296_2.color = Color.New(var_296_11, var_296_11, var_296_11)
						end
					end
				end
			end

			if arg_293_1.time_ >= var_296_8 + var_296_9 and arg_293_1.time_ < var_296_8 + var_296_9 + arg_296_0 and arg_293_1.var_.actorSpriteComps1038 then
				local var_296_12 = 0.5

				for iter_296_3, iter_296_4 in pairs(arg_293_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_296_4 then
						iter_296_4.color = Color.New(var_296_12, var_296_12, var_296_12)
					end
				end

				arg_293_1.var_.actorSpriteComps1038 = nil
			end

			local var_296_13 = arg_293_1.actors_["10030"]
			local var_296_14 = 0

			if var_296_14 < arg_293_1.time_ and arg_293_1.time_ <= var_296_14 + arg_296_0 then
				local var_296_15 = var_296_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_296_15 then
					arg_293_1.var_.alphaOldValue10030 = var_296_15.alpha
					arg_293_1.var_.characterEffect10030 = var_296_15
				end

				arg_293_1.var_.alphaOldValue10030 = 0
			end

			local var_296_16 = 0.333333333333333

			if var_296_14 <= arg_293_1.time_ and arg_293_1.time_ < var_296_14 + var_296_16 then
				local var_296_17 = (arg_293_1.time_ - var_296_14) / var_296_16
				local var_296_18 = Mathf.Lerp(arg_293_1.var_.alphaOldValue10030, 1, var_296_17)

				if arg_293_1.var_.characterEffect10030 then
					arg_293_1.var_.characterEffect10030.alpha = var_296_18
				end
			end

			if arg_293_1.time_ >= var_296_14 + var_296_16 and arg_293_1.time_ < var_296_14 + var_296_16 + arg_296_0 and arg_293_1.var_.characterEffect10030 then
				arg_293_1.var_.characterEffect10030.alpha = 1
			end

			local var_296_19 = 0
			local var_296_20 = 0.35

			if var_296_19 < arg_293_1.time_ and arg_293_1.time_ <= var_296_19 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_21 = arg_293_1:FormatText(StoryNameCfg[309].name)

				arg_293_1.leftNameTxt_.text = var_296_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_22 = arg_293_1:GetWordFromCfg(115301074)
				local var_296_23 = arg_293_1:FormatText(var_296_22.content)

				arg_293_1.text_.text = var_296_23

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_24 = 14
				local var_296_25 = utf8.len(var_296_23)
				local var_296_26 = var_296_24 <= 0 and var_296_20 or var_296_20 * (var_296_25 / var_296_24)

				if var_296_26 > 0 and var_296_20 < var_296_26 then
					arg_293_1.talkMaxDuration = var_296_26

					if var_296_26 + var_296_19 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_26 + var_296_19
					end
				end

				arg_293_1.text_.text = var_296_23
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301074", "story_v_out_115301.awb") ~= 0 then
					local var_296_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301074", "story_v_out_115301.awb") / 1000

					if var_296_27 + var_296_19 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_27 + var_296_19
					end

					if var_296_22.prefab_name ~= "" and arg_293_1.actors_[var_296_22.prefab_name] ~= nil then
						local var_296_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_22.prefab_name].transform, "story_v_out_115301", "115301074", "story_v_out_115301.awb")

						arg_293_1:RecordAudio("115301074", var_296_28)
						arg_293_1:RecordAudio("115301074", var_296_28)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_115301", "115301074", "story_v_out_115301.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_115301", "115301074", "story_v_out_115301.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_29 = math.max(var_296_20, arg_293_1.talkMaxDuration)

			if var_296_19 <= arg_293_1.time_ and arg_293_1.time_ < var_296_19 + var_296_29 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_19) / var_296_29

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_19 + var_296_29 and arg_293_1.time_ < var_296_19 + var_296_29 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play115301075 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 115301075
		arg_297_1.duration_ = 6.9

		local var_297_0 = {
			ja = 4.3,
			ko = 4.8,
			zh = 6.9,
			en = 5.733
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
				arg_297_0:Play115301076(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = arg_297_1.actors_["10030"]
			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 and arg_297_1.var_.actorSpriteComps10030 == nil then
				arg_297_1.var_.actorSpriteComps10030 = var_300_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_300_2 = 0.2

			if var_300_1 <= arg_297_1.time_ and arg_297_1.time_ < var_300_1 + var_300_2 then
				local var_300_3 = (arg_297_1.time_ - var_300_1) / var_300_2

				if arg_297_1.var_.actorSpriteComps10030 then
					for iter_300_0, iter_300_1 in pairs(arg_297_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_300_1 then
							local var_300_4 = Mathf.Lerp(iter_300_1.color.r, 0.5, var_300_3)

							iter_300_1.color = Color.New(var_300_4, var_300_4, var_300_4)
						end
					end
				end
			end

			if arg_297_1.time_ >= var_300_1 + var_300_2 and arg_297_1.time_ < var_300_1 + var_300_2 + arg_300_0 and arg_297_1.var_.actorSpriteComps10030 then
				local var_300_5 = 0.5

				for iter_300_2, iter_300_3 in pairs(arg_297_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_300_3 then
						iter_300_3.color = Color.New(var_300_5, var_300_5, var_300_5)
					end
				end

				arg_297_1.var_.actorSpriteComps10030 = nil
			end

			local var_300_6 = arg_297_1.actors_["1038"]
			local var_300_7 = 0

			if var_300_7 < arg_297_1.time_ and arg_297_1.time_ <= var_300_7 + arg_300_0 and arg_297_1.var_.actorSpriteComps1038 == nil then
				arg_297_1.var_.actorSpriteComps1038 = var_300_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_300_8 = 0.2

			if var_300_7 <= arg_297_1.time_ and arg_297_1.time_ < var_300_7 + var_300_8 then
				local var_300_9 = (arg_297_1.time_ - var_300_7) / var_300_8

				if arg_297_1.var_.actorSpriteComps1038 then
					for iter_300_4, iter_300_5 in pairs(arg_297_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_300_5 then
							local var_300_10 = Mathf.Lerp(iter_300_5.color.r, 1, var_300_9)

							iter_300_5.color = Color.New(var_300_10, var_300_10, var_300_10)
						end
					end
				end
			end

			if arg_297_1.time_ >= var_300_7 + var_300_8 and arg_297_1.time_ < var_300_7 + var_300_8 + arg_300_0 and arg_297_1.var_.actorSpriteComps1038 then
				local var_300_11 = 1

				for iter_300_6, iter_300_7 in pairs(arg_297_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_300_7 then
						iter_300_7.color = Color.New(var_300_11, var_300_11, var_300_11)
					end
				end

				arg_297_1.var_.actorSpriteComps1038 = nil
			end

			local var_300_12 = 0
			local var_300_13 = 0.475

			if var_300_12 < arg_297_1.time_ and arg_297_1.time_ <= var_300_12 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_14 = arg_297_1:FormatText(StoryNameCfg[94].name)

				arg_297_1.leftNameTxt_.text = var_300_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_15 = arg_297_1:GetWordFromCfg(115301075)
				local var_300_16 = arg_297_1:FormatText(var_300_15.content)

				arg_297_1.text_.text = var_300_16

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_17 = 19
				local var_300_18 = utf8.len(var_300_16)
				local var_300_19 = var_300_17 <= 0 and var_300_13 or var_300_13 * (var_300_18 / var_300_17)

				if var_300_19 > 0 and var_300_13 < var_300_19 then
					arg_297_1.talkMaxDuration = var_300_19

					if var_300_19 + var_300_12 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_19 + var_300_12
					end
				end

				arg_297_1.text_.text = var_300_16
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301075", "story_v_out_115301.awb") ~= 0 then
					local var_300_20 = manager.audio:GetVoiceLength("story_v_out_115301", "115301075", "story_v_out_115301.awb") / 1000

					if var_300_20 + var_300_12 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_20 + var_300_12
					end

					if var_300_15.prefab_name ~= "" and arg_297_1.actors_[var_300_15.prefab_name] ~= nil then
						local var_300_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_15.prefab_name].transform, "story_v_out_115301", "115301075", "story_v_out_115301.awb")

						arg_297_1:RecordAudio("115301075", var_300_21)
						arg_297_1:RecordAudio("115301075", var_300_21)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_115301", "115301075", "story_v_out_115301.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_115301", "115301075", "story_v_out_115301.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_22 = math.max(var_300_13, arg_297_1.talkMaxDuration)

			if var_300_12 <= arg_297_1.time_ and arg_297_1.time_ < var_300_12 + var_300_22 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_12) / var_300_22

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_12 + var_300_22 and arg_297_1.time_ < var_300_12 + var_300_22 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play115301076 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 115301076
		arg_301_1.duration_ = 11.233

		local var_301_0 = {
			ja = 11.233,
			ko = 7.566,
			zh = 10.6,
			en = 9.733
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
				arg_301_0:Play115301077(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["1038"].transform
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 then
				arg_301_1.var_.moveOldPos1038 = var_304_0.localPosition
				var_304_0.localScale = Vector3.New(1, 1, 1)

				arg_301_1:CheckSpriteTmpPos("1038", 2)

				local var_304_2 = var_304_0.childCount

				for iter_304_0 = 0, var_304_2 - 1 do
					local var_304_3 = var_304_0:GetChild(iter_304_0)

					if var_304_3.name == "split_1" or not string.find(var_304_3.name, "split") then
						var_304_3.gameObject:SetActive(true)
					else
						var_304_3.gameObject:SetActive(false)
					end
				end
			end

			local var_304_4 = 0.001

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_4 then
				local var_304_5 = (arg_301_1.time_ - var_304_1) / var_304_4
				local var_304_6 = Vector3.New(-390, -400, 0)

				var_304_0.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos1038, var_304_6, var_304_5)
			end

			if arg_301_1.time_ >= var_304_1 + var_304_4 and arg_301_1.time_ < var_304_1 + var_304_4 + arg_304_0 then
				var_304_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_304_7 = arg_301_1.actors_["1038"].transform
			local var_304_8 = 0

			if var_304_8 < arg_301_1.time_ and arg_301_1.time_ <= var_304_8 + arg_304_0 then
				arg_301_1.var_.moveOldPos1038 = var_304_7.localPosition
				var_304_7.localScale = Vector3.New(1, 1, 1)

				arg_301_1:CheckSpriteTmpPos("1038", 2)

				local var_304_9 = var_304_7.childCount

				for iter_304_1 = 0, var_304_9 - 1 do
					local var_304_10 = var_304_7:GetChild(iter_304_1)

					if var_304_10.name == "split_7" or not string.find(var_304_10.name, "split") then
						var_304_10.gameObject:SetActive(true)
					else
						var_304_10.gameObject:SetActive(false)
					end
				end
			end

			local var_304_11 = 0.001

			if var_304_8 <= arg_301_1.time_ and arg_301_1.time_ < var_304_8 + var_304_11 then
				local var_304_12 = (arg_301_1.time_ - var_304_8) / var_304_11
				local var_304_13 = Vector3.New(-390, -400, 0)

				var_304_7.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos1038, var_304_13, var_304_12)
			end

			if arg_301_1.time_ >= var_304_8 + var_304_11 and arg_301_1.time_ < var_304_8 + var_304_11 + arg_304_0 then
				var_304_7.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_304_14 = arg_301_1.actors_["1038"]
			local var_304_15 = 0

			if var_304_15 < arg_301_1.time_ and arg_301_1.time_ <= var_304_15 + arg_304_0 then
				local var_304_16 = var_304_14:GetComponentInChildren(typeof(CanvasGroup))

				if var_304_16 then
					arg_301_1.var_.alphaOldValue1038 = var_304_16.alpha
					arg_301_1.var_.characterEffect1038 = var_304_16
				end

				arg_301_1.var_.alphaOldValue1038 = 0
			end

			local var_304_17 = 0.0166666666666667

			if var_304_15 <= arg_301_1.time_ and arg_301_1.time_ < var_304_15 + var_304_17 then
				local var_304_18 = (arg_301_1.time_ - var_304_15) / var_304_17
				local var_304_19 = Mathf.Lerp(arg_301_1.var_.alphaOldValue1038, 1, var_304_18)

				if arg_301_1.var_.characterEffect1038 then
					arg_301_1.var_.characterEffect1038.alpha = var_304_19
				end
			end

			if arg_301_1.time_ >= var_304_15 + var_304_17 and arg_301_1.time_ < var_304_15 + var_304_17 + arg_304_0 and arg_301_1.var_.characterEffect1038 then
				arg_301_1.var_.characterEffect1038.alpha = 1
			end

			local var_304_20 = arg_301_1.actors_["1038"]
			local var_304_21 = 0

			if var_304_21 < arg_301_1.time_ and arg_301_1.time_ <= var_304_21 + arg_304_0 and arg_301_1.var_.actorSpriteComps1038 == nil then
				arg_301_1.var_.actorSpriteComps1038 = var_304_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_304_22 = 0.0166666666666667

			if var_304_21 <= arg_301_1.time_ and arg_301_1.time_ < var_304_21 + var_304_22 then
				local var_304_23 = (arg_301_1.time_ - var_304_21) / var_304_22

				if arg_301_1.var_.actorSpriteComps1038 then
					for iter_304_2, iter_304_3 in pairs(arg_301_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_304_3 then
							local var_304_24 = Mathf.Lerp(iter_304_3.color.r, 1, var_304_23)

							iter_304_3.color = Color.New(var_304_24, var_304_24, var_304_24)
						end
					end
				end
			end

			if arg_301_1.time_ >= var_304_21 + var_304_22 and arg_301_1.time_ < var_304_21 + var_304_22 + arg_304_0 and arg_301_1.var_.actorSpriteComps1038 then
				local var_304_25 = 1

				for iter_304_4, iter_304_5 in pairs(arg_301_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_304_5 then
						iter_304_5.color = Color.New(var_304_25, var_304_25, var_304_25)
					end
				end

				arg_301_1.var_.actorSpriteComps1038 = nil
			end

			local var_304_26 = 0
			local var_304_27 = 1

			if var_304_26 < arg_301_1.time_ and arg_301_1.time_ <= var_304_26 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_28 = arg_301_1:FormatText(StoryNameCfg[94].name)

				arg_301_1.leftNameTxt_.text = var_304_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_29 = arg_301_1:GetWordFromCfg(115301076)
				local var_304_30 = arg_301_1:FormatText(var_304_29.content)

				arg_301_1.text_.text = var_304_30

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_31 = 40
				local var_304_32 = utf8.len(var_304_30)
				local var_304_33 = var_304_31 <= 0 and var_304_27 or var_304_27 * (var_304_32 / var_304_31)

				if var_304_33 > 0 and var_304_27 < var_304_33 then
					arg_301_1.talkMaxDuration = var_304_33

					if var_304_33 + var_304_26 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_33 + var_304_26
					end
				end

				arg_301_1.text_.text = var_304_30
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301076", "story_v_out_115301.awb") ~= 0 then
					local var_304_34 = manager.audio:GetVoiceLength("story_v_out_115301", "115301076", "story_v_out_115301.awb") / 1000

					if var_304_34 + var_304_26 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_34 + var_304_26
					end

					if var_304_29.prefab_name ~= "" and arg_301_1.actors_[var_304_29.prefab_name] ~= nil then
						local var_304_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_29.prefab_name].transform, "story_v_out_115301", "115301076", "story_v_out_115301.awb")

						arg_301_1:RecordAudio("115301076", var_304_35)
						arg_301_1:RecordAudio("115301076", var_304_35)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_115301", "115301076", "story_v_out_115301.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_115301", "115301076", "story_v_out_115301.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_36 = math.max(var_304_27, arg_301_1.talkMaxDuration)

			if var_304_26 <= arg_301_1.time_ and arg_301_1.time_ < var_304_26 + var_304_36 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_26) / var_304_36

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_26 + var_304_36 and arg_301_1.time_ < var_304_26 + var_304_36 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play115301077 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 115301077
		arg_305_1.duration_ = 5.733

		local var_305_0 = {
			ja = 5.6,
			ko = 4.9,
			zh = 5.733,
			en = 5.266
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
				arg_305_0:Play115301078(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0
			local var_308_1 = 0.55

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_2 = arg_305_1:FormatText(StoryNameCfg[94].name)

				arg_305_1.leftNameTxt_.text = var_308_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_3 = arg_305_1:GetWordFromCfg(115301077)
				local var_308_4 = arg_305_1:FormatText(var_308_3.content)

				arg_305_1.text_.text = var_308_4

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_5 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301077", "story_v_out_115301.awb") ~= 0 then
					local var_308_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301077", "story_v_out_115301.awb") / 1000

					if var_308_8 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_8 + var_308_0
					end

					if var_308_3.prefab_name ~= "" and arg_305_1.actors_[var_308_3.prefab_name] ~= nil then
						local var_308_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_3.prefab_name].transform, "story_v_out_115301", "115301077", "story_v_out_115301.awb")

						arg_305_1:RecordAudio("115301077", var_308_9)
						arg_305_1:RecordAudio("115301077", var_308_9)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_115301", "115301077", "story_v_out_115301.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_115301", "115301077", "story_v_out_115301.awb")
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
	Play115301078 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 115301078
		arg_309_1.duration_ = 8

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play115301079(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = "STblack"

			if arg_309_1.bgs_[var_312_0] == nil then
				local var_312_1 = Object.Instantiate(arg_309_1.paintGo_)

				var_312_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_312_0)
				var_312_1.name = var_312_0
				var_312_1.transform.parent = arg_309_1.stage_.transform
				var_312_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_309_1.bgs_[var_312_0] = var_312_1
			end

			local var_312_2 = 1

			if var_312_2 < arg_309_1.time_ and arg_309_1.time_ <= var_312_2 + arg_312_0 then
				local var_312_3 = manager.ui.mainCamera.transform.localPosition
				local var_312_4 = Vector3.New(0, 0, 10) + Vector3.New(var_312_3.x, var_312_3.y, 0)
				local var_312_5 = arg_309_1.bgs_.STblack

				var_312_5.transform.localPosition = var_312_4
				var_312_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_312_6 = var_312_5:GetComponent("SpriteRenderer")

				if var_312_6 and var_312_6.sprite then
					local var_312_7 = (var_312_5.transform.localPosition - var_312_3).z
					local var_312_8 = manager.ui.mainCameraCom_
					local var_312_9 = 2 * var_312_7 * Mathf.Tan(var_312_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_312_10 = var_312_9 * var_312_8.aspect
					local var_312_11 = var_312_6.sprite.bounds.size.x
					local var_312_12 = var_312_6.sprite.bounds.size.y
					local var_312_13 = var_312_10 / var_312_11
					local var_312_14 = var_312_9 / var_312_12
					local var_312_15 = var_312_14 < var_312_13 and var_312_13 or var_312_14

					var_312_5.transform.localScale = Vector3.New(var_312_15, var_312_15, 0)
				end

				for iter_312_0, iter_312_1 in pairs(arg_309_1.bgs_) do
					if iter_312_0 ~= "STblack" then
						iter_312_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_312_16 = 0

			if var_312_16 < arg_309_1.time_ and arg_309_1.time_ <= var_312_16 + arg_312_0 then
				arg_309_1.mask_.enabled = true
				arg_309_1.mask_.raycastTarget = false

				arg_309_1:SetGaussion(false)
			end

			local var_312_17 = 1

			if var_312_16 <= arg_309_1.time_ and arg_309_1.time_ < var_312_16 + var_312_17 then
				local var_312_18 = (arg_309_1.time_ - var_312_16) / var_312_17
				local var_312_19 = Color.New(0, 0, 0)

				var_312_19.a = Mathf.Lerp(0, 1, var_312_18)
				arg_309_1.mask_.color = var_312_19
			end

			if arg_309_1.time_ >= var_312_16 + var_312_17 and arg_309_1.time_ < var_312_16 + var_312_17 + arg_312_0 then
				local var_312_20 = Color.New(0, 0, 0)

				var_312_20.a = 1
				arg_309_1.mask_.color = var_312_20
			end

			local var_312_21 = 1

			if var_312_21 < arg_309_1.time_ and arg_309_1.time_ <= var_312_21 + arg_312_0 then
				arg_309_1.mask_.enabled = true
				arg_309_1.mask_.raycastTarget = false

				arg_309_1:SetGaussion(false)
			end

			local var_312_22 = 2

			if var_312_21 <= arg_309_1.time_ and arg_309_1.time_ < var_312_21 + var_312_22 then
				local var_312_23 = (arg_309_1.time_ - var_312_21) / var_312_22
				local var_312_24 = Color.New(0, 0, 0)

				var_312_24.a = Mathf.Lerp(1, 0, var_312_23)
				arg_309_1.mask_.color = var_312_24
			end

			if arg_309_1.time_ >= var_312_21 + var_312_22 and arg_309_1.time_ < var_312_21 + var_312_22 + arg_312_0 then
				local var_312_25 = Color.New(0, 0, 0)
				local var_312_26 = 0

				arg_309_1.mask_.enabled = false
				var_312_25.a = var_312_26
				arg_309_1.mask_.color = var_312_25
			end

			local var_312_27 = arg_309_1.actors_["1038"].transform
			local var_312_28 = 1

			if var_312_28 < arg_309_1.time_ and arg_309_1.time_ <= var_312_28 + arg_312_0 then
				arg_309_1.var_.moveOldPos1038 = var_312_27.localPosition
				var_312_27.localScale = Vector3.New(1, 1, 1)

				arg_309_1:CheckSpriteTmpPos("1038", 0)

				local var_312_29 = var_312_27.childCount

				for iter_312_2 = 0, var_312_29 - 1 do
					local var_312_30 = var_312_27:GetChild(iter_312_2)

					if var_312_30.name == "split_7" or not string.find(var_312_30.name, "split") then
						var_312_30.gameObject:SetActive(true)
					else
						var_312_30.gameObject:SetActive(false)
					end
				end
			end

			local var_312_31 = 0.001

			if var_312_28 <= arg_309_1.time_ and arg_309_1.time_ < var_312_28 + var_312_31 then
				local var_312_32 = (arg_309_1.time_ - var_312_28) / var_312_31
				local var_312_33 = Vector3.New(-2000, -400, 0)

				var_312_27.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1038, var_312_33, var_312_32)
			end

			if arg_309_1.time_ >= var_312_28 + var_312_31 and arg_309_1.time_ < var_312_28 + var_312_31 + arg_312_0 then
				var_312_27.localPosition = Vector3.New(-2000, -400, 0)
			end

			local var_312_34 = arg_309_1.actors_["10030"].transform
			local var_312_35 = 1

			if var_312_35 < arg_309_1.time_ and arg_309_1.time_ <= var_312_35 + arg_312_0 then
				arg_309_1.var_.moveOldPos10030 = var_312_34.localPosition
				var_312_34.localScale = Vector3.New(1, 1, 1)

				arg_309_1:CheckSpriteTmpPos("10030", 0)

				local var_312_36 = var_312_34.childCount

				for iter_312_3 = 0, var_312_36 - 1 do
					local var_312_37 = var_312_34:GetChild(iter_312_3)

					if var_312_37.name == "split_3" or not string.find(var_312_37.name, "split") then
						var_312_37.gameObject:SetActive(true)
					else
						var_312_37.gameObject:SetActive(false)
					end
				end
			end

			local var_312_38 = 0.001

			if var_312_35 <= arg_309_1.time_ and arg_309_1.time_ < var_312_35 + var_312_38 then
				local var_312_39 = (arg_309_1.time_ - var_312_35) / var_312_38
				local var_312_40 = Vector3.New(-2000, -390, 150)

				var_312_34.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos10030, var_312_40, var_312_39)
			end

			if arg_309_1.time_ >= var_312_35 + var_312_38 and arg_309_1.time_ < var_312_35 + var_312_38 + arg_312_0 then
				var_312_34.localPosition = Vector3.New(-2000, -390, 150)
			end

			if arg_309_1.frameCnt_ <= 1 then
				arg_309_1.dialog_:SetActive(false)
			end

			local var_312_41 = 3
			local var_312_42 = 0.4

			if var_312_41 < arg_309_1.time_ and arg_309_1.time_ <= var_312_41 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0

				arg_309_1.dialog_:SetActive(true)

				local var_312_43 = LeanTween.value(arg_309_1.dialog_, 0, 1, 0.3)

				var_312_43:setOnUpdate(LuaHelper.FloatAction(function(arg_313_0)
					arg_309_1.dialogCg_.alpha = arg_313_0
				end))
				var_312_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_309_1.dialog_)
					var_312_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_309_1.duration_ = arg_309_1.duration_ + 0.3

				SetActive(arg_309_1.leftNameGo_, false)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_44 = arg_309_1:GetWordFromCfg(115301078)
				local var_312_45 = arg_309_1:FormatText(var_312_44.content)

				arg_309_1.text_.text = var_312_45

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_46 = 16
				local var_312_47 = utf8.len(var_312_45)
				local var_312_48 = var_312_46 <= 0 and var_312_42 or var_312_42 * (var_312_47 / var_312_46)

				if var_312_48 > 0 and var_312_42 < var_312_48 then
					arg_309_1.talkMaxDuration = var_312_48
					var_312_41 = var_312_41 + 0.3

					if var_312_48 + var_312_41 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_48 + var_312_41
					end
				end

				arg_309_1.text_.text = var_312_45
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)
				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_49 = var_312_41 + 0.3
			local var_312_50 = math.max(var_312_42, arg_309_1.talkMaxDuration)

			if var_312_49 <= arg_309_1.time_ and arg_309_1.time_ < var_312_49 + var_312_50 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_49) / var_312_50

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_49 + var_312_50 and arg_309_1.time_ < var_312_49 + var_312_50 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play115301079 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 115301079
		arg_315_1.duration_ = 6.333

		local var_315_0 = {
			ja = 6.333,
			ko = 1.333,
			zh = 2.3,
			en = 1.233
		}
		local var_315_1 = manager.audio:GetLocalizationFlag()

		if var_315_0[var_315_1] ~= nil then
			arg_315_1.duration_ = var_315_0[var_315_1]
		end

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play115301080(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = 0
			local var_318_1 = 0.075

			if var_318_0 < arg_315_1.time_ and arg_315_1.time_ <= var_318_0 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_2 = arg_315_1:FormatText(StoryNameCfg[309].name)

				arg_315_1.leftNameTxt_.text = var_318_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, true)
				arg_315_1.iconController_:SetSelectedState("hero")

				arg_315_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10030_split_3")

				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_3 = arg_315_1:GetWordFromCfg(115301079)
				local var_318_4 = arg_315_1:FormatText(var_318_3.content)

				arg_315_1.text_.text = var_318_4

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_5 = 3
				local var_318_6 = utf8.len(var_318_4)
				local var_318_7 = var_318_5 <= 0 and var_318_1 or var_318_1 * (var_318_6 / var_318_5)

				if var_318_7 > 0 and var_318_1 < var_318_7 then
					arg_315_1.talkMaxDuration = var_318_7

					if var_318_7 + var_318_0 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_7 + var_318_0
					end
				end

				arg_315_1.text_.text = var_318_4
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301079", "story_v_out_115301.awb") ~= 0 then
					local var_318_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301079", "story_v_out_115301.awb") / 1000

					if var_318_8 + var_318_0 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_8 + var_318_0
					end

					if var_318_3.prefab_name ~= "" and arg_315_1.actors_[var_318_3.prefab_name] ~= nil then
						local var_318_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_3.prefab_name].transform, "story_v_out_115301", "115301079", "story_v_out_115301.awb")

						arg_315_1:RecordAudio("115301079", var_318_9)
						arg_315_1:RecordAudio("115301079", var_318_9)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_115301", "115301079", "story_v_out_115301.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_115301", "115301079", "story_v_out_115301.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_10 = math.max(var_318_1, arg_315_1.talkMaxDuration)

			if var_318_0 <= arg_315_1.time_ and arg_315_1.time_ < var_318_0 + var_318_10 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_0) / var_318_10

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_0 + var_318_10 and arg_315_1.time_ < var_318_0 + var_318_10 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play115301080 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 115301080
		arg_319_1.duration_ = 5

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play115301081(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = 0
			local var_322_1 = 0.525

			if var_322_0 < arg_319_1.time_ and arg_319_1.time_ <= var_322_0 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, false)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_2 = arg_319_1:GetWordFromCfg(115301080)
				local var_322_3 = arg_319_1:FormatText(var_322_2.content)

				arg_319_1.text_.text = var_322_3

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_4 = 21
				local var_322_5 = utf8.len(var_322_3)
				local var_322_6 = var_322_4 <= 0 and var_322_1 or var_322_1 * (var_322_5 / var_322_4)

				if var_322_6 > 0 and var_322_1 < var_322_6 then
					arg_319_1.talkMaxDuration = var_322_6

					if var_322_6 + var_322_0 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_6 + var_322_0
					end
				end

				arg_319_1.text_.text = var_322_3
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)
				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_7 = math.max(var_322_1, arg_319_1.talkMaxDuration)

			if var_322_0 <= arg_319_1.time_ and arg_319_1.time_ < var_322_0 + var_322_7 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_0) / var_322_7

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_0 + var_322_7 and arg_319_1.time_ < var_322_0 + var_322_7 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play115301081 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 115301081
		arg_323_1.duration_ = 5

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play115301082(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = 0
			local var_326_1 = 1.05

			if var_326_0 < arg_323_1.time_ and arg_323_1.time_ <= var_326_0 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, false)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_2 = arg_323_1:GetWordFromCfg(115301081)
				local var_326_3 = arg_323_1:FormatText(var_326_2.content)

				arg_323_1.text_.text = var_326_3

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_4 = 42
				local var_326_5 = utf8.len(var_326_3)
				local var_326_6 = var_326_4 <= 0 and var_326_1 or var_326_1 * (var_326_5 / var_326_4)

				if var_326_6 > 0 and var_326_1 < var_326_6 then
					arg_323_1.talkMaxDuration = var_326_6

					if var_326_6 + var_326_0 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_6 + var_326_0
					end
				end

				arg_323_1.text_.text = var_326_3
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)
				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_7 = math.max(var_326_1, arg_323_1.talkMaxDuration)

			if var_326_0 <= arg_323_1.time_ and arg_323_1.time_ < var_326_0 + var_326_7 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_0) / var_326_7

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_0 + var_326_7 and arg_323_1.time_ < var_326_0 + var_326_7 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play115301082 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 115301082
		arg_327_1.duration_ = 5

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play115301083(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = 0
			local var_330_1 = 0.625

			if var_330_0 < arg_327_1.time_ and arg_327_1.time_ <= var_330_0 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, false)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_2 = arg_327_1:GetWordFromCfg(115301082)
				local var_330_3 = arg_327_1:FormatText(var_330_2.content)

				arg_327_1.text_.text = var_330_3

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_4 = 25
				local var_330_5 = utf8.len(var_330_3)
				local var_330_6 = var_330_4 <= 0 and var_330_1 or var_330_1 * (var_330_5 / var_330_4)

				if var_330_6 > 0 and var_330_1 < var_330_6 then
					arg_327_1.talkMaxDuration = var_330_6

					if var_330_6 + var_330_0 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_6 + var_330_0
					end
				end

				arg_327_1.text_.text = var_330_3
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)
				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_7 = math.max(var_330_1, arg_327_1.talkMaxDuration)

			if var_330_0 <= arg_327_1.time_ and arg_327_1.time_ < var_330_0 + var_330_7 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_0) / var_330_7

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_0 + var_330_7 and arg_327_1.time_ < var_330_0 + var_330_7 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play115301083 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 115301083
		arg_331_1.duration_ = 5.9

		local var_331_0 = {
			ja = 5.8,
			ko = 5.9,
			zh = 5.833,
			en = 5.5
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
				arg_331_0:Play115301084(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = "RO0503"

			if arg_331_1.bgs_[var_334_0] == nil then
				local var_334_1 = Object.Instantiate(arg_331_1.paintGo_)

				var_334_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_334_0)
				var_334_1.name = var_334_0
				var_334_1.transform.parent = arg_331_1.stage_.transform
				var_334_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_331_1.bgs_[var_334_0] = var_334_1
			end

			local var_334_2 = 2

			if var_334_2 < arg_331_1.time_ and arg_331_1.time_ <= var_334_2 + arg_334_0 then
				local var_334_3 = manager.ui.mainCamera.transform.localPosition
				local var_334_4 = Vector3.New(0, 0, 10) + Vector3.New(var_334_3.x, var_334_3.y, 0)
				local var_334_5 = arg_331_1.bgs_.RO0503

				var_334_5.transform.localPosition = var_334_4
				var_334_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_334_6 = var_334_5:GetComponent("SpriteRenderer")

				if var_334_6 and var_334_6.sprite then
					local var_334_7 = (var_334_5.transform.localPosition - var_334_3).z
					local var_334_8 = manager.ui.mainCameraCom_
					local var_334_9 = 2 * var_334_7 * Mathf.Tan(var_334_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_334_10 = var_334_9 * var_334_8.aspect
					local var_334_11 = var_334_6.sprite.bounds.size.x
					local var_334_12 = var_334_6.sprite.bounds.size.y
					local var_334_13 = var_334_10 / var_334_11
					local var_334_14 = var_334_9 / var_334_12
					local var_334_15 = var_334_14 < var_334_13 and var_334_13 or var_334_14

					var_334_5.transform.localScale = Vector3.New(var_334_15, var_334_15, 0)
				end

				for iter_334_0, iter_334_1 in pairs(arg_331_1.bgs_) do
					if iter_334_0 ~= "RO0503" then
						iter_334_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_334_16 = 0

			if var_334_16 < arg_331_1.time_ and arg_331_1.time_ <= var_334_16 + arg_334_0 then
				arg_331_1.mask_.enabled = true
				arg_331_1.mask_.raycastTarget = false

				arg_331_1:SetGaussion(false)
			end

			local var_334_17 = 2

			if var_334_16 <= arg_331_1.time_ and arg_331_1.time_ < var_334_16 + var_334_17 then
				local var_334_18 = (arg_331_1.time_ - var_334_16) / var_334_17
				local var_334_19 = Color.New(0, 0, 0)

				var_334_19.a = Mathf.Lerp(0, 1, var_334_18)
				arg_331_1.mask_.color = var_334_19
			end

			if arg_331_1.time_ >= var_334_16 + var_334_17 and arg_331_1.time_ < var_334_16 + var_334_17 + arg_334_0 then
				local var_334_20 = Color.New(0, 0, 0)

				var_334_20.a = 1
				arg_331_1.mask_.color = var_334_20
			end

			local var_334_21 = 2

			if var_334_21 < arg_331_1.time_ and arg_331_1.time_ <= var_334_21 + arg_334_0 then
				arg_331_1.mask_.enabled = true
				arg_331_1.mask_.raycastTarget = false

				arg_331_1:SetGaussion(false)
			end

			local var_334_22 = 2

			if var_334_21 <= arg_331_1.time_ and arg_331_1.time_ < var_334_21 + var_334_22 then
				local var_334_23 = (arg_331_1.time_ - var_334_21) / var_334_22
				local var_334_24 = Color.New(0, 0, 0)

				var_334_24.a = Mathf.Lerp(1, 0, var_334_23)
				arg_331_1.mask_.color = var_334_24
			end

			if arg_331_1.time_ >= var_334_21 + var_334_22 and arg_331_1.time_ < var_334_21 + var_334_22 + arg_334_0 then
				local var_334_25 = Color.New(0, 0, 0)
				local var_334_26 = 0

				arg_331_1.mask_.enabled = false
				var_334_25.a = var_334_26
				arg_331_1.mask_.color = var_334_25
			end

			if arg_331_1.frameCnt_ <= 1 then
				arg_331_1.dialog_:SetActive(false)
			end

			local var_334_27 = 4
			local var_334_28 = 0.075

			if var_334_27 < arg_331_1.time_ and arg_331_1.time_ <= var_334_27 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0

				arg_331_1.dialog_:SetActive(true)

				local var_334_29 = LeanTween.value(arg_331_1.dialog_, 0, 1, 0.3)

				var_334_29:setOnUpdate(LuaHelper.FloatAction(function(arg_335_0)
					arg_331_1.dialogCg_.alpha = arg_335_0
				end))
				var_334_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_331_1.dialog_)
					var_334_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_331_1.duration_ = arg_331_1.duration_ + 0.3

				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_30 = arg_331_1:FormatText(StoryNameCfg[309].name)

				arg_331_1.leftNameTxt_.text = var_334_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_31 = arg_331_1:GetWordFromCfg(115301083)
				local var_334_32 = arg_331_1:FormatText(var_334_31.content)

				arg_331_1.text_.text = var_334_32

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_33 = 3
				local var_334_34 = utf8.len(var_334_32)
				local var_334_35 = var_334_33 <= 0 and var_334_28 or var_334_28 * (var_334_34 / var_334_33)

				if var_334_35 > 0 and var_334_28 < var_334_35 then
					arg_331_1.talkMaxDuration = var_334_35
					var_334_27 = var_334_27 + 0.3

					if var_334_35 + var_334_27 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_35 + var_334_27
					end
				end

				arg_331_1.text_.text = var_334_32
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301083", "story_v_out_115301.awb") ~= 0 then
					local var_334_36 = manager.audio:GetVoiceLength("story_v_out_115301", "115301083", "story_v_out_115301.awb") / 1000

					if var_334_36 + var_334_27 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_36 + var_334_27
					end

					if var_334_31.prefab_name ~= "" and arg_331_1.actors_[var_334_31.prefab_name] ~= nil then
						local var_334_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_31.prefab_name].transform, "story_v_out_115301", "115301083", "story_v_out_115301.awb")

						arg_331_1:RecordAudio("115301083", var_334_37)
						arg_331_1:RecordAudio("115301083", var_334_37)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_115301", "115301083", "story_v_out_115301.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_115301", "115301083", "story_v_out_115301.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_38 = var_334_27 + 0.3
			local var_334_39 = math.max(var_334_28, arg_331_1.talkMaxDuration)

			if var_334_38 <= arg_331_1.time_ and arg_331_1.time_ < var_334_38 + var_334_39 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_38) / var_334_39

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_38 + var_334_39 and arg_331_1.time_ < var_334_38 + var_334_39 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play115301084 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 115301084
		arg_337_1.duration_ = 5

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play115301085(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = 0
			local var_340_1 = 0.875

			if var_340_0 < arg_337_1.time_ and arg_337_1.time_ <= var_340_0 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, false)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_2 = arg_337_1:GetWordFromCfg(115301084)
				local var_340_3 = arg_337_1:FormatText(var_340_2.content)

				arg_337_1.text_.text = var_340_3

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_4 = 35
				local var_340_5 = utf8.len(var_340_3)
				local var_340_6 = var_340_4 <= 0 and var_340_1 or var_340_1 * (var_340_5 / var_340_4)

				if var_340_6 > 0 and var_340_1 < var_340_6 then
					arg_337_1.talkMaxDuration = var_340_6

					if var_340_6 + var_340_0 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_6 + var_340_0
					end
				end

				arg_337_1.text_.text = var_340_3
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)
				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_7 = math.max(var_340_1, arg_337_1.talkMaxDuration)

			if var_340_0 <= arg_337_1.time_ and arg_337_1.time_ < var_340_0 + var_340_7 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_0) / var_340_7

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_0 + var_340_7 and arg_337_1.time_ < var_340_0 + var_340_7 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play115301085 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 115301085
		arg_341_1.duration_ = 3.633

		local var_341_0 = {
			ja = 3.633,
			ko = 3.166,
			zh = 2.866,
			en = 1.9
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
				arg_341_0:Play115301086(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = 0
			local var_344_1 = 0.275

			if var_344_0 < arg_341_1.time_ and arg_341_1.time_ <= var_344_0 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_2 = arg_341_1:FormatText(StoryNameCfg[309].name)

				arg_341_1.leftNameTxt_.text = var_344_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_3 = arg_341_1:GetWordFromCfg(115301085)
				local var_344_4 = arg_341_1:FormatText(var_344_3.content)

				arg_341_1.text_.text = var_344_4

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_5 = 11
				local var_344_6 = utf8.len(var_344_4)
				local var_344_7 = var_344_5 <= 0 and var_344_1 or var_344_1 * (var_344_6 / var_344_5)

				if var_344_7 > 0 and var_344_1 < var_344_7 then
					arg_341_1.talkMaxDuration = var_344_7

					if var_344_7 + var_344_0 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_7 + var_344_0
					end
				end

				arg_341_1.text_.text = var_344_4
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301085", "story_v_out_115301.awb") ~= 0 then
					local var_344_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301085", "story_v_out_115301.awb") / 1000

					if var_344_8 + var_344_0 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_8 + var_344_0
					end

					if var_344_3.prefab_name ~= "" and arg_341_1.actors_[var_344_3.prefab_name] ~= nil then
						local var_344_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_3.prefab_name].transform, "story_v_out_115301", "115301085", "story_v_out_115301.awb")

						arg_341_1:RecordAudio("115301085", var_344_9)
						arg_341_1:RecordAudio("115301085", var_344_9)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_115301", "115301085", "story_v_out_115301.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_115301", "115301085", "story_v_out_115301.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_10 = math.max(var_344_1, arg_341_1.talkMaxDuration)

			if var_344_0 <= arg_341_1.time_ and arg_341_1.time_ < var_344_0 + var_344_10 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_0) / var_344_10

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_0 + var_344_10 and arg_341_1.time_ < var_344_0 + var_344_10 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play115301086 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 115301086
		arg_345_1.duration_ = 6.9

		local var_345_0 = {
			ja = 2.6,
			ko = 3.166,
			zh = 3.766,
			en = 6.9
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
				arg_345_0:Play115301087(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = 0
			local var_348_1 = 0.325

			if var_348_0 < arg_345_1.time_ and arg_345_1.time_ <= var_348_0 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_2 = arg_345_1:FormatText(StoryNameCfg[317].name)

				arg_345_1.leftNameTxt_.text = var_348_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_3 = arg_345_1:GetWordFromCfg(115301086)
				local var_348_4 = arg_345_1:FormatText(var_348_3.content)

				arg_345_1.text_.text = var_348_4

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_5 = 13
				local var_348_6 = utf8.len(var_348_4)
				local var_348_7 = var_348_5 <= 0 and var_348_1 or var_348_1 * (var_348_6 / var_348_5)

				if var_348_7 > 0 and var_348_1 < var_348_7 then
					arg_345_1.talkMaxDuration = var_348_7

					if var_348_7 + var_348_0 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_7 + var_348_0
					end
				end

				arg_345_1.text_.text = var_348_4
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301086", "story_v_out_115301.awb") ~= 0 then
					local var_348_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301086", "story_v_out_115301.awb") / 1000

					if var_348_8 + var_348_0 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_8 + var_348_0
					end

					if var_348_3.prefab_name ~= "" and arg_345_1.actors_[var_348_3.prefab_name] ~= nil then
						local var_348_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_3.prefab_name].transform, "story_v_out_115301", "115301086", "story_v_out_115301.awb")

						arg_345_1:RecordAudio("115301086", var_348_9)
						arg_345_1:RecordAudio("115301086", var_348_9)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_115301", "115301086", "story_v_out_115301.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_115301", "115301086", "story_v_out_115301.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_10 = math.max(var_348_1, arg_345_1.talkMaxDuration)

			if var_348_0 <= arg_345_1.time_ and arg_345_1.time_ < var_348_0 + var_348_10 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_0) / var_348_10

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_0 + var_348_10 and arg_345_1.time_ < var_348_0 + var_348_10 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play115301087 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 115301087
		arg_349_1.duration_ = 5.766

		local var_349_0 = {
			ja = 5.766,
			ko = 4,
			zh = 4.1,
			en = 5.033
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
				arg_349_0:Play115301088(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = 0
			local var_352_1 = 0.375

			if var_352_0 < arg_349_1.time_ and arg_349_1.time_ <= var_352_0 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_2 = arg_349_1:FormatText(StoryNameCfg[309].name)

				arg_349_1.leftNameTxt_.text = var_352_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_3 = arg_349_1:GetWordFromCfg(115301087)
				local var_352_4 = arg_349_1:FormatText(var_352_3.content)

				arg_349_1.text_.text = var_352_4

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_5 = 15
				local var_352_6 = utf8.len(var_352_4)
				local var_352_7 = var_352_5 <= 0 and var_352_1 or var_352_1 * (var_352_6 / var_352_5)

				if var_352_7 > 0 and var_352_1 < var_352_7 then
					arg_349_1.talkMaxDuration = var_352_7

					if var_352_7 + var_352_0 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_7 + var_352_0
					end
				end

				arg_349_1.text_.text = var_352_4
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301087", "story_v_out_115301.awb") ~= 0 then
					local var_352_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301087", "story_v_out_115301.awb") / 1000

					if var_352_8 + var_352_0 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_8 + var_352_0
					end

					if var_352_3.prefab_name ~= "" and arg_349_1.actors_[var_352_3.prefab_name] ~= nil then
						local var_352_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_3.prefab_name].transform, "story_v_out_115301", "115301087", "story_v_out_115301.awb")

						arg_349_1:RecordAudio("115301087", var_352_9)
						arg_349_1:RecordAudio("115301087", var_352_9)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_115301", "115301087", "story_v_out_115301.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_115301", "115301087", "story_v_out_115301.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_10 = math.max(var_352_1, arg_349_1.talkMaxDuration)

			if var_352_0 <= arg_349_1.time_ and arg_349_1.time_ < var_352_0 + var_352_10 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_0) / var_352_10

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_0 + var_352_10 and arg_349_1.time_ < var_352_0 + var_352_10 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play115301088 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 115301088
		arg_353_1.duration_ = 7.066

		local var_353_0 = {
			ja = 5.166,
			ko = 6.733,
			zh = 5.866,
			en = 7.066
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
				arg_353_0:Play115301089(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = 0
			local var_356_1 = 0.525

			if var_356_0 < arg_353_1.time_ and arg_353_1.time_ <= var_356_0 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_2 = arg_353_1:FormatText(StoryNameCfg[317].name)

				arg_353_1.leftNameTxt_.text = var_356_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_3 = arg_353_1:GetWordFromCfg(115301088)
				local var_356_4 = arg_353_1:FormatText(var_356_3.content)

				arg_353_1.text_.text = var_356_4

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_5 = 21
				local var_356_6 = utf8.len(var_356_4)
				local var_356_7 = var_356_5 <= 0 and var_356_1 or var_356_1 * (var_356_6 / var_356_5)

				if var_356_7 > 0 and var_356_1 < var_356_7 then
					arg_353_1.talkMaxDuration = var_356_7

					if var_356_7 + var_356_0 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_7 + var_356_0
					end
				end

				arg_353_1.text_.text = var_356_4
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301088", "story_v_out_115301.awb") ~= 0 then
					local var_356_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301088", "story_v_out_115301.awb") / 1000

					if var_356_8 + var_356_0 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_8 + var_356_0
					end

					if var_356_3.prefab_name ~= "" and arg_353_1.actors_[var_356_3.prefab_name] ~= nil then
						local var_356_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_3.prefab_name].transform, "story_v_out_115301", "115301088", "story_v_out_115301.awb")

						arg_353_1:RecordAudio("115301088", var_356_9)
						arg_353_1:RecordAudio("115301088", var_356_9)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_115301", "115301088", "story_v_out_115301.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_115301", "115301088", "story_v_out_115301.awb")
				end

				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_10 = math.max(var_356_1, arg_353_1.talkMaxDuration)

			if var_356_0 <= arg_353_1.time_ and arg_353_1.time_ < var_356_0 + var_356_10 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_0) / var_356_10

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_0 + var_356_10 and arg_353_1.time_ < var_356_0 + var_356_10 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play115301089 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 115301089
		arg_357_1.duration_ = 15.5

		local var_357_0 = {
			ja = 9.466,
			ko = 11.533,
			zh = 11.833,
			en = 15.5
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
				arg_357_0:Play115301090(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = 0
			local var_360_1 = 1.2

			if var_360_0 < arg_357_1.time_ and arg_357_1.time_ <= var_360_0 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_2 = arg_357_1:FormatText(StoryNameCfg[317].name)

				arg_357_1.leftNameTxt_.text = var_360_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_3 = arg_357_1:GetWordFromCfg(115301089)
				local var_360_4 = arg_357_1:FormatText(var_360_3.content)

				arg_357_1.text_.text = var_360_4

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_5 = 48
				local var_360_6 = utf8.len(var_360_4)
				local var_360_7 = var_360_5 <= 0 and var_360_1 or var_360_1 * (var_360_6 / var_360_5)

				if var_360_7 > 0 and var_360_1 < var_360_7 then
					arg_357_1.talkMaxDuration = var_360_7

					if var_360_7 + var_360_0 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_7 + var_360_0
					end
				end

				arg_357_1.text_.text = var_360_4
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301089", "story_v_out_115301.awb") ~= 0 then
					local var_360_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301089", "story_v_out_115301.awb") / 1000

					if var_360_8 + var_360_0 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_8 + var_360_0
					end

					if var_360_3.prefab_name ~= "" and arg_357_1.actors_[var_360_3.prefab_name] ~= nil then
						local var_360_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_3.prefab_name].transform, "story_v_out_115301", "115301089", "story_v_out_115301.awb")

						arg_357_1:RecordAudio("115301089", var_360_9)
						arg_357_1:RecordAudio("115301089", var_360_9)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_115301", "115301089", "story_v_out_115301.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_115301", "115301089", "story_v_out_115301.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_10 = math.max(var_360_1, arg_357_1.talkMaxDuration)

			if var_360_0 <= arg_357_1.time_ and arg_357_1.time_ < var_360_0 + var_360_10 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_0) / var_360_10

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_0 + var_360_10 and arg_357_1.time_ < var_360_0 + var_360_10 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play115301090 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 115301090
		arg_361_1.duration_ = 5.633

		local var_361_0 = {
			ja = 5.633,
			ko = 2.9,
			zh = 2.633,
			en = 3.733
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
				arg_361_0:Play115301091(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = 0
			local var_364_1 = 0.3

			if var_364_0 < arg_361_1.time_ and arg_361_1.time_ <= var_364_0 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_2 = arg_361_1:FormatText(StoryNameCfg[309].name)

				arg_361_1.leftNameTxt_.text = var_364_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_3 = arg_361_1:GetWordFromCfg(115301090)
				local var_364_4 = arg_361_1:FormatText(var_364_3.content)

				arg_361_1.text_.text = var_364_4

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_5 = 12
				local var_364_6 = utf8.len(var_364_4)
				local var_364_7 = var_364_5 <= 0 and var_364_1 or var_364_1 * (var_364_6 / var_364_5)

				if var_364_7 > 0 and var_364_1 < var_364_7 then
					arg_361_1.talkMaxDuration = var_364_7

					if var_364_7 + var_364_0 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_7 + var_364_0
					end
				end

				arg_361_1.text_.text = var_364_4
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301090", "story_v_out_115301.awb") ~= 0 then
					local var_364_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301090", "story_v_out_115301.awb") / 1000

					if var_364_8 + var_364_0 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_8 + var_364_0
					end

					if var_364_3.prefab_name ~= "" and arg_361_1.actors_[var_364_3.prefab_name] ~= nil then
						local var_364_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_3.prefab_name].transform, "story_v_out_115301", "115301090", "story_v_out_115301.awb")

						arg_361_1:RecordAudio("115301090", var_364_9)
						arg_361_1:RecordAudio("115301090", var_364_9)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_115301", "115301090", "story_v_out_115301.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_115301", "115301090", "story_v_out_115301.awb")
				end

				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_10 = math.max(var_364_1, arg_361_1.talkMaxDuration)

			if var_364_0 <= arg_361_1.time_ and arg_361_1.time_ < var_364_0 + var_364_10 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_0) / var_364_10

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_0 + var_364_10 and arg_361_1.time_ < var_364_0 + var_364_10 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play115301091 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 115301091
		arg_365_1.duration_ = 11.6

		local var_365_0 = {
			ja = 11.6,
			ko = 7.333,
			zh = 6.8,
			en = 8.9
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
				arg_365_0:Play115301092(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = 0
			local var_368_1 = 0.825

			if var_368_0 < arg_365_1.time_ and arg_365_1.time_ <= var_368_0 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_2 = arg_365_1:FormatText(StoryNameCfg[317].name)

				arg_365_1.leftNameTxt_.text = var_368_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_3 = arg_365_1:GetWordFromCfg(115301091)
				local var_368_4 = arg_365_1:FormatText(var_368_3.content)

				arg_365_1.text_.text = var_368_4

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_5 = 33
				local var_368_6 = utf8.len(var_368_4)
				local var_368_7 = var_368_5 <= 0 and var_368_1 or var_368_1 * (var_368_6 / var_368_5)

				if var_368_7 > 0 and var_368_1 < var_368_7 then
					arg_365_1.talkMaxDuration = var_368_7

					if var_368_7 + var_368_0 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_7 + var_368_0
					end
				end

				arg_365_1.text_.text = var_368_4
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301091", "story_v_out_115301.awb") ~= 0 then
					local var_368_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301091", "story_v_out_115301.awb") / 1000

					if var_368_8 + var_368_0 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_8 + var_368_0
					end

					if var_368_3.prefab_name ~= "" and arg_365_1.actors_[var_368_3.prefab_name] ~= nil then
						local var_368_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_3.prefab_name].transform, "story_v_out_115301", "115301091", "story_v_out_115301.awb")

						arg_365_1:RecordAudio("115301091", var_368_9)
						arg_365_1:RecordAudio("115301091", var_368_9)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_out_115301", "115301091", "story_v_out_115301.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_out_115301", "115301091", "story_v_out_115301.awb")
				end

				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_10 = math.max(var_368_1, arg_365_1.talkMaxDuration)

			if var_368_0 <= arg_365_1.time_ and arg_365_1.time_ < var_368_0 + var_368_10 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_0) / var_368_10

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_0 + var_368_10 and arg_365_1.time_ < var_368_0 + var_368_10 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play115301092 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 115301092
		arg_369_1.duration_ = 7.433

		local var_369_0 = {
			ja = 7.433,
			ko = 5.566,
			zh = 4.1,
			en = 4.533
		}
		local var_369_1 = manager.audio:GetLocalizationFlag()

		if var_369_0[var_369_1] ~= nil then
			arg_369_1.duration_ = var_369_0[var_369_1]
		end

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play115301093(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0
			local var_372_1 = 0.475

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_2 = arg_369_1:FormatText(StoryNameCfg[309].name)

				arg_369_1.leftNameTxt_.text = var_372_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_3 = arg_369_1:GetWordFromCfg(115301092)
				local var_372_4 = arg_369_1:FormatText(var_372_3.content)

				arg_369_1.text_.text = var_372_4

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_5 = 19
				local var_372_6 = utf8.len(var_372_4)
				local var_372_7 = var_372_5 <= 0 and var_372_1 or var_372_1 * (var_372_6 / var_372_5)

				if var_372_7 > 0 and var_372_1 < var_372_7 then
					arg_369_1.talkMaxDuration = var_372_7

					if var_372_7 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_7 + var_372_0
					end
				end

				arg_369_1.text_.text = var_372_4
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301092", "story_v_out_115301.awb") ~= 0 then
					local var_372_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301092", "story_v_out_115301.awb") / 1000

					if var_372_8 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_8 + var_372_0
					end

					if var_372_3.prefab_name ~= "" and arg_369_1.actors_[var_372_3.prefab_name] ~= nil then
						local var_372_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_3.prefab_name].transform, "story_v_out_115301", "115301092", "story_v_out_115301.awb")

						arg_369_1:RecordAudio("115301092", var_372_9)
						arg_369_1:RecordAudio("115301092", var_372_9)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_115301", "115301092", "story_v_out_115301.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_115301", "115301092", "story_v_out_115301.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_10 = math.max(var_372_1, arg_369_1.talkMaxDuration)

			if var_372_0 <= arg_369_1.time_ and arg_369_1.time_ < var_372_0 + var_372_10 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_0) / var_372_10

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_0 + var_372_10 and arg_369_1.time_ < var_372_0 + var_372_10 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play115301093 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 115301093
		arg_373_1.duration_ = 5.933

		local var_373_0 = {
			ja = 3.7,
			ko = 5.8,
			zh = 4.766,
			en = 5.933
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
				arg_373_0:Play115301094(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = 0
			local var_376_1 = 0.45

			if var_376_0 < arg_373_1.time_ and arg_373_1.time_ <= var_376_0 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_2 = arg_373_1:FormatText(StoryNameCfg[317].name)

				arg_373_1.leftNameTxt_.text = var_376_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_3 = arg_373_1:GetWordFromCfg(115301093)
				local var_376_4 = arg_373_1:FormatText(var_376_3.content)

				arg_373_1.text_.text = var_376_4

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_5 = 18
				local var_376_6 = utf8.len(var_376_4)
				local var_376_7 = var_376_5 <= 0 and var_376_1 or var_376_1 * (var_376_6 / var_376_5)

				if var_376_7 > 0 and var_376_1 < var_376_7 then
					arg_373_1.talkMaxDuration = var_376_7

					if var_376_7 + var_376_0 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_7 + var_376_0
					end
				end

				arg_373_1.text_.text = var_376_4
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301093", "story_v_out_115301.awb") ~= 0 then
					local var_376_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301093", "story_v_out_115301.awb") / 1000

					if var_376_8 + var_376_0 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_8 + var_376_0
					end

					if var_376_3.prefab_name ~= "" and arg_373_1.actors_[var_376_3.prefab_name] ~= nil then
						local var_376_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_3.prefab_name].transform, "story_v_out_115301", "115301093", "story_v_out_115301.awb")

						arg_373_1:RecordAudio("115301093", var_376_9)
						arg_373_1:RecordAudio("115301093", var_376_9)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_115301", "115301093", "story_v_out_115301.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_115301", "115301093", "story_v_out_115301.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_10 = math.max(var_376_1, arg_373_1.talkMaxDuration)

			if var_376_0 <= arg_373_1.time_ and arg_373_1.time_ < var_376_0 + var_376_10 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_0) / var_376_10

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_0 + var_376_10 and arg_373_1.time_ < var_376_0 + var_376_10 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play115301094 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 115301094
		arg_377_1.duration_ = 7.466

		local var_377_0 = {
			ja = 7.466,
			ko = 6,
			zh = 5.7,
			en = 5.933
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
				arg_377_0:Play115301095(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = 0
			local var_380_1 = 0.65

			if var_380_0 < arg_377_1.time_ and arg_377_1.time_ <= var_380_0 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_2 = arg_377_1:FormatText(StoryNameCfg[317].name)

				arg_377_1.leftNameTxt_.text = var_380_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_3 = arg_377_1:GetWordFromCfg(115301094)
				local var_380_4 = arg_377_1:FormatText(var_380_3.content)

				arg_377_1.text_.text = var_380_4

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_5 = 26
				local var_380_6 = utf8.len(var_380_4)
				local var_380_7 = var_380_5 <= 0 and var_380_1 or var_380_1 * (var_380_6 / var_380_5)

				if var_380_7 > 0 and var_380_1 < var_380_7 then
					arg_377_1.talkMaxDuration = var_380_7

					if var_380_7 + var_380_0 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_7 + var_380_0
					end
				end

				arg_377_1.text_.text = var_380_4
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301094", "story_v_out_115301.awb") ~= 0 then
					local var_380_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301094", "story_v_out_115301.awb") / 1000

					if var_380_8 + var_380_0 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_8 + var_380_0
					end

					if var_380_3.prefab_name ~= "" and arg_377_1.actors_[var_380_3.prefab_name] ~= nil then
						local var_380_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_377_1.actors_[var_380_3.prefab_name].transform, "story_v_out_115301", "115301094", "story_v_out_115301.awb")

						arg_377_1:RecordAudio("115301094", var_380_9)
						arg_377_1:RecordAudio("115301094", var_380_9)
					else
						arg_377_1:AudioAction("play", "voice", "story_v_out_115301", "115301094", "story_v_out_115301.awb")
					end

					arg_377_1:RecordHistoryTalkVoice("story_v_out_115301", "115301094", "story_v_out_115301.awb")
				end

				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_10 = math.max(var_380_1, arg_377_1.talkMaxDuration)

			if var_380_0 <= arg_377_1.time_ and arg_377_1.time_ < var_380_0 + var_380_10 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_0) / var_380_10

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_0 + var_380_10 and arg_377_1.time_ < var_380_0 + var_380_10 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play115301095 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 115301095
		arg_381_1.duration_ = 9

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play115301096(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = 2

			if var_384_0 < arg_381_1.time_ and arg_381_1.time_ <= var_384_0 + arg_384_0 then
				local var_384_1 = manager.ui.mainCamera.transform.localPosition
				local var_384_2 = Vector3.New(0, 0, 10) + Vector3.New(var_384_1.x, var_384_1.y, 0)
				local var_384_3 = arg_381_1.bgs_.F01

				var_384_3.transform.localPosition = var_384_2
				var_384_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_384_4 = var_384_3:GetComponent("SpriteRenderer")

				if var_384_4 and var_384_4.sprite then
					local var_384_5 = (var_384_3.transform.localPosition - var_384_1).z
					local var_384_6 = manager.ui.mainCameraCom_
					local var_384_7 = 2 * var_384_5 * Mathf.Tan(var_384_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_384_8 = var_384_7 * var_384_6.aspect
					local var_384_9 = var_384_4.sprite.bounds.size.x
					local var_384_10 = var_384_4.sprite.bounds.size.y
					local var_384_11 = var_384_8 / var_384_9
					local var_384_12 = var_384_7 / var_384_10
					local var_384_13 = var_384_12 < var_384_11 and var_384_11 or var_384_12

					var_384_3.transform.localScale = Vector3.New(var_384_13, var_384_13, 0)
				end

				for iter_384_0, iter_384_1 in pairs(arg_381_1.bgs_) do
					if iter_384_0 ~= "F01" then
						iter_384_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_384_14 = 0

			if var_384_14 < arg_381_1.time_ and arg_381_1.time_ <= var_384_14 + arg_384_0 then
				arg_381_1.mask_.enabled = true
				arg_381_1.mask_.raycastTarget = false

				arg_381_1:SetGaussion(false)
			end

			local var_384_15 = 2

			if var_384_14 <= arg_381_1.time_ and arg_381_1.time_ < var_384_14 + var_384_15 then
				local var_384_16 = (arg_381_1.time_ - var_384_14) / var_384_15
				local var_384_17 = Color.New(0, 0, 0)

				var_384_17.a = Mathf.Lerp(0, 1, var_384_16)
				arg_381_1.mask_.color = var_384_17
			end

			if arg_381_1.time_ >= var_384_14 + var_384_15 and arg_381_1.time_ < var_384_14 + var_384_15 + arg_384_0 then
				local var_384_18 = Color.New(0, 0, 0)

				var_384_18.a = 1
				arg_381_1.mask_.color = var_384_18
			end

			local var_384_19 = 2

			if var_384_19 < arg_381_1.time_ and arg_381_1.time_ <= var_384_19 + arg_384_0 then
				arg_381_1.mask_.enabled = true
				arg_381_1.mask_.raycastTarget = false

				arg_381_1:SetGaussion(false)
			end

			local var_384_20 = 2

			if var_384_19 <= arg_381_1.time_ and arg_381_1.time_ < var_384_19 + var_384_20 then
				local var_384_21 = (arg_381_1.time_ - var_384_19) / var_384_20
				local var_384_22 = Color.New(0, 0, 0)

				var_384_22.a = Mathf.Lerp(1, 0, var_384_21)
				arg_381_1.mask_.color = var_384_22
			end

			if arg_381_1.time_ >= var_384_19 + var_384_20 and arg_381_1.time_ < var_384_19 + var_384_20 + arg_384_0 then
				local var_384_23 = Color.New(0, 0, 0)
				local var_384_24 = 0

				arg_381_1.mask_.enabled = false
				var_384_23.a = var_384_24
				arg_381_1.mask_.color = var_384_23
			end

			if arg_381_1.frameCnt_ <= 1 then
				arg_381_1.dialog_:SetActive(false)
			end

			local var_384_25 = 4
			local var_384_26 = 0.875

			if var_384_25 < arg_381_1.time_ and arg_381_1.time_ <= var_384_25 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0

				arg_381_1.dialog_:SetActive(true)

				local var_384_27 = LeanTween.value(arg_381_1.dialog_, 0, 1, 0.3)

				var_384_27:setOnUpdate(LuaHelper.FloatAction(function(arg_385_0)
					arg_381_1.dialogCg_.alpha = arg_385_0
				end))
				var_384_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_381_1.dialog_)
					var_384_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_381_1.duration_ = arg_381_1.duration_ + 0.3

				SetActive(arg_381_1.leftNameGo_, false)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_28 = arg_381_1:GetWordFromCfg(115301095)
				local var_384_29 = arg_381_1:FormatText(var_384_28.content)

				arg_381_1.text_.text = var_384_29

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_30 = 35
				local var_384_31 = utf8.len(var_384_29)
				local var_384_32 = var_384_30 <= 0 and var_384_26 or var_384_26 * (var_384_31 / var_384_30)

				if var_384_32 > 0 and var_384_26 < var_384_32 then
					arg_381_1.talkMaxDuration = var_384_32
					var_384_25 = var_384_25 + 0.3

					if var_384_32 + var_384_25 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_32 + var_384_25
					end
				end

				arg_381_1.text_.text = var_384_29
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)
				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_33 = var_384_25 + 0.3
			local var_384_34 = math.max(var_384_26, arg_381_1.talkMaxDuration)

			if var_384_33 <= arg_381_1.time_ and arg_381_1.time_ < var_384_33 + var_384_34 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_33) / var_384_34

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_33 + var_384_34 and arg_381_1.time_ < var_384_33 + var_384_34 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play115301096 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 115301096
		arg_387_1.duration_ = 5

		SetActive(arg_387_1.tipsGo_, false)

		function arg_387_1.onSingleLineFinish_()
			arg_387_1.onSingleLineUpdate_ = nil
			arg_387_1.onSingleLineFinish_ = nil
			arg_387_1.state_ = "waiting"
		end

		function arg_387_1.playNext_(arg_389_0)
			if arg_389_0 == 1 then
				arg_387_0:Play115301097(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = 0
			local var_390_1 = 1.5

			if var_390_0 < arg_387_1.time_ and arg_387_1.time_ <= var_390_0 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, false)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_2 = arg_387_1:GetWordFromCfg(115301096)
				local var_390_3 = arg_387_1:FormatText(var_390_2.content)

				arg_387_1.text_.text = var_390_3

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_4 = 60
				local var_390_5 = utf8.len(var_390_3)
				local var_390_6 = var_390_4 <= 0 and var_390_1 or var_390_1 * (var_390_5 / var_390_4)

				if var_390_6 > 0 and var_390_1 < var_390_6 then
					arg_387_1.talkMaxDuration = var_390_6

					if var_390_6 + var_390_0 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_6 + var_390_0
					end
				end

				arg_387_1.text_.text = var_390_3
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)
				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_7 = math.max(var_390_1, arg_387_1.talkMaxDuration)

			if var_390_0 <= arg_387_1.time_ and arg_387_1.time_ < var_390_0 + var_390_7 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_0) / var_390_7

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_0 + var_390_7 and arg_387_1.time_ < var_390_0 + var_390_7 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play115301097 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 115301097
		arg_391_1.duration_ = 10.4

		local var_391_0 = {
			ja = 4.7,
			ko = 8.266,
			zh = 8.166,
			en = 10.4
		}
		local var_391_1 = manager.audio:GetLocalizationFlag()

		if var_391_0[var_391_1] ~= nil then
			arg_391_1.duration_ = var_391_0[var_391_1]
		end

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play115301098(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = arg_391_1.actors_["10030"].transform
			local var_394_1 = 0

			if var_394_1 < arg_391_1.time_ and arg_391_1.time_ <= var_394_1 + arg_394_0 then
				arg_391_1.var_.moveOldPos10030 = var_394_0.localPosition
				var_394_0.localScale = Vector3.New(1, 1, 1)

				arg_391_1:CheckSpriteTmpPos("10030", 3)

				local var_394_2 = var_394_0.childCount

				for iter_394_0 = 0, var_394_2 - 1 do
					local var_394_3 = var_394_0:GetChild(iter_394_0)

					if var_394_3.name == "split_3" or not string.find(var_394_3.name, "split") then
						var_394_3.gameObject:SetActive(true)
					else
						var_394_3.gameObject:SetActive(false)
					end
				end
			end

			local var_394_4 = 0.001

			if var_394_1 <= arg_391_1.time_ and arg_391_1.time_ < var_394_1 + var_394_4 then
				local var_394_5 = (arg_391_1.time_ - var_394_1) / var_394_4
				local var_394_6 = Vector3.New(0, -390, 150)

				var_394_0.localPosition = Vector3.Lerp(arg_391_1.var_.moveOldPos10030, var_394_6, var_394_5)
			end

			if arg_391_1.time_ >= var_394_1 + var_394_4 and arg_391_1.time_ < var_394_1 + var_394_4 + arg_394_0 then
				var_394_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_394_7 = arg_391_1.actors_["10030"]
			local var_394_8 = 0

			if var_394_8 < arg_391_1.time_ and arg_391_1.time_ <= var_394_8 + arg_394_0 and arg_391_1.var_.actorSpriteComps10030 == nil then
				arg_391_1.var_.actorSpriteComps10030 = var_394_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_394_9 = 0.2

			if var_394_8 <= arg_391_1.time_ and arg_391_1.time_ < var_394_8 + var_394_9 then
				local var_394_10 = (arg_391_1.time_ - var_394_8) / var_394_9

				if arg_391_1.var_.actorSpriteComps10030 then
					for iter_394_1, iter_394_2 in pairs(arg_391_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_394_2 then
							local var_394_11 = Mathf.Lerp(iter_394_2.color.r, 1, var_394_10)

							iter_394_2.color = Color.New(var_394_11, var_394_11, var_394_11)
						end
					end
				end
			end

			if arg_391_1.time_ >= var_394_8 + var_394_9 and arg_391_1.time_ < var_394_8 + var_394_9 + arg_394_0 and arg_391_1.var_.actorSpriteComps10030 then
				local var_394_12 = 1

				for iter_394_3, iter_394_4 in pairs(arg_391_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_394_4 then
						iter_394_4.color = Color.New(var_394_12, var_394_12, var_394_12)
					end
				end

				arg_391_1.var_.actorSpriteComps10030 = nil
			end

			local var_394_13 = arg_391_1.actors_["10030"]
			local var_394_14 = 0

			if var_394_14 < arg_391_1.time_ and arg_391_1.time_ <= var_394_14 + arg_394_0 then
				local var_394_15 = var_394_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_394_15 then
					arg_391_1.var_.alphaOldValue10030 = var_394_15.alpha
					arg_391_1.var_.characterEffect10030 = var_394_15
				end

				arg_391_1.var_.alphaOldValue10030 = 0
			end

			local var_394_16 = 0.333333333333333

			if var_394_14 <= arg_391_1.time_ and arg_391_1.time_ < var_394_14 + var_394_16 then
				local var_394_17 = (arg_391_1.time_ - var_394_14) / var_394_16
				local var_394_18 = Mathf.Lerp(arg_391_1.var_.alphaOldValue10030, 1, var_394_17)

				if arg_391_1.var_.characterEffect10030 then
					arg_391_1.var_.characterEffect10030.alpha = var_394_18
				end
			end

			if arg_391_1.time_ >= var_394_14 + var_394_16 and arg_391_1.time_ < var_394_14 + var_394_16 + arg_394_0 and arg_391_1.var_.characterEffect10030 then
				arg_391_1.var_.characterEffect10030.alpha = 1
			end

			local var_394_19 = 0
			local var_394_20 = 0.725

			if var_394_19 < arg_391_1.time_ and arg_391_1.time_ <= var_394_19 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, true)

				local var_394_21 = arg_391_1:FormatText(StoryNameCfg[309].name)

				arg_391_1.leftNameTxt_.text = var_394_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_391_1.leftNameTxt_.transform)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1.leftNameTxt_.text)
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_22 = arg_391_1:GetWordFromCfg(115301097)
				local var_394_23 = arg_391_1:FormatText(var_394_22.content)

				arg_391_1.text_.text = var_394_23

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_24 = 29
				local var_394_25 = utf8.len(var_394_23)
				local var_394_26 = var_394_24 <= 0 and var_394_20 or var_394_20 * (var_394_25 / var_394_24)

				if var_394_26 > 0 and var_394_20 < var_394_26 then
					arg_391_1.talkMaxDuration = var_394_26

					if var_394_26 + var_394_19 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_26 + var_394_19
					end
				end

				arg_391_1.text_.text = var_394_23
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301097", "story_v_out_115301.awb") ~= 0 then
					local var_394_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301097", "story_v_out_115301.awb") / 1000

					if var_394_27 + var_394_19 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_27 + var_394_19
					end

					if var_394_22.prefab_name ~= "" and arg_391_1.actors_[var_394_22.prefab_name] ~= nil then
						local var_394_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_391_1.actors_[var_394_22.prefab_name].transform, "story_v_out_115301", "115301097", "story_v_out_115301.awb")

						arg_391_1:RecordAudio("115301097", var_394_28)
						arg_391_1:RecordAudio("115301097", var_394_28)
					else
						arg_391_1:AudioAction("play", "voice", "story_v_out_115301", "115301097", "story_v_out_115301.awb")
					end

					arg_391_1:RecordHistoryTalkVoice("story_v_out_115301", "115301097", "story_v_out_115301.awb")
				end

				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_29 = math.max(var_394_20, arg_391_1.talkMaxDuration)

			if var_394_19 <= arg_391_1.time_ and arg_391_1.time_ < var_394_19 + var_394_29 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_19) / var_394_29

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_19 + var_394_29 and arg_391_1.time_ < var_394_19 + var_394_29 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play115301098 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 115301098
		arg_395_1.duration_ = 14.3

		local var_395_0 = {
			ja = 14.3,
			ko = 8.466,
			zh = 7.233,
			en = 8.233
		}
		local var_395_1 = manager.audio:GetLocalizationFlag()

		if var_395_0[var_395_1] ~= nil then
			arg_395_1.duration_ = var_395_0[var_395_1]
		end

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play115301099(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = 0
			local var_398_1 = 0.675

			if var_398_0 < arg_395_1.time_ and arg_395_1.time_ <= var_398_0 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, true)

				local var_398_2 = arg_395_1:FormatText(StoryNameCfg[309].name)

				arg_395_1.leftNameTxt_.text = var_398_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_395_1.leftNameTxt_.transform)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1.leftNameTxt_.text)
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_3 = arg_395_1:GetWordFromCfg(115301098)
				local var_398_4 = arg_395_1:FormatText(var_398_3.content)

				arg_395_1.text_.text = var_398_4

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_5 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301098", "story_v_out_115301.awb") ~= 0 then
					local var_398_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301098", "story_v_out_115301.awb") / 1000

					if var_398_8 + var_398_0 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_8 + var_398_0
					end

					if var_398_3.prefab_name ~= "" and arg_395_1.actors_[var_398_3.prefab_name] ~= nil then
						local var_398_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_395_1.actors_[var_398_3.prefab_name].transform, "story_v_out_115301", "115301098", "story_v_out_115301.awb")

						arg_395_1:RecordAudio("115301098", var_398_9)
						arg_395_1:RecordAudio("115301098", var_398_9)
					else
						arg_395_1:AudioAction("play", "voice", "story_v_out_115301", "115301098", "story_v_out_115301.awb")
					end

					arg_395_1:RecordHistoryTalkVoice("story_v_out_115301", "115301098", "story_v_out_115301.awb")
				end

				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_10 = math.max(var_398_1, arg_395_1.talkMaxDuration)

			if var_398_0 <= arg_395_1.time_ and arg_395_1.time_ < var_398_0 + var_398_10 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_0) / var_398_10

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_0 + var_398_10 and arg_395_1.time_ < var_398_0 + var_398_10 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play115301099 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 115301099
		arg_399_1.duration_ = 5

		SetActive(arg_399_1.tipsGo_, false)

		function arg_399_1.onSingleLineFinish_()
			arg_399_1.onSingleLineUpdate_ = nil
			arg_399_1.onSingleLineFinish_ = nil
			arg_399_1.state_ = "waiting"
		end

		function arg_399_1.playNext_(arg_401_0)
			if arg_401_0 == 1 then
				arg_399_0:Play115301100(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = arg_399_1.actors_["10030"]
			local var_402_1 = 0

			if var_402_1 < arg_399_1.time_ and arg_399_1.time_ <= var_402_1 + arg_402_0 then
				local var_402_2 = var_402_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_402_2 then
					arg_399_1.var_.alphaOldValue10030 = var_402_2.alpha
					arg_399_1.var_.characterEffect10030 = var_402_2
				end

				arg_399_1.var_.alphaOldValue10030 = 1
			end

			local var_402_3 = 0.333333333333333

			if var_402_1 <= arg_399_1.time_ and arg_399_1.time_ < var_402_1 + var_402_3 then
				local var_402_4 = (arg_399_1.time_ - var_402_1) / var_402_3
				local var_402_5 = Mathf.Lerp(arg_399_1.var_.alphaOldValue10030, 0, var_402_4)

				if arg_399_1.var_.characterEffect10030 then
					arg_399_1.var_.characterEffect10030.alpha = var_402_5
				end
			end

			if arg_399_1.time_ >= var_402_1 + var_402_3 and arg_399_1.time_ < var_402_1 + var_402_3 + arg_402_0 and arg_399_1.var_.characterEffect10030 then
				arg_399_1.var_.characterEffect10030.alpha = 0
			end

			local var_402_6 = 0
			local var_402_7 = 0.925

			if var_402_6 < arg_399_1.time_ and arg_399_1.time_ <= var_402_6 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, false)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_8 = arg_399_1:GetWordFromCfg(115301099)
				local var_402_9 = arg_399_1:FormatText(var_402_8.content)

				arg_399_1.text_.text = var_402_9

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_10 = 37
				local var_402_11 = utf8.len(var_402_9)
				local var_402_12 = var_402_10 <= 0 and var_402_7 or var_402_7 * (var_402_11 / var_402_10)

				if var_402_12 > 0 and var_402_7 < var_402_12 then
					arg_399_1.talkMaxDuration = var_402_12

					if var_402_12 + var_402_6 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_12 + var_402_6
					end
				end

				arg_399_1.text_.text = var_402_9
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)
				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_13 = math.max(var_402_7, arg_399_1.talkMaxDuration)

			if var_402_6 <= arg_399_1.time_ and arg_399_1.time_ < var_402_6 + var_402_13 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_6) / var_402_13

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_6 + var_402_13 and arg_399_1.time_ < var_402_6 + var_402_13 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play115301100 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 115301100
		arg_403_1.duration_ = 10.1

		local var_403_0 = {
			ja = 10.1,
			ko = 8.066,
			zh = 5.833,
			en = 5.466
		}
		local var_403_1 = manager.audio:GetLocalizationFlag()

		if var_403_0[var_403_1] ~= nil then
			arg_403_1.duration_ = var_403_0[var_403_1]
		end

		SetActive(arg_403_1.tipsGo_, false)

		function arg_403_1.onSingleLineFinish_()
			arg_403_1.onSingleLineUpdate_ = nil
			arg_403_1.onSingleLineFinish_ = nil
			arg_403_1.state_ = "waiting"
		end

		function arg_403_1.playNext_(arg_405_0)
			if arg_405_0 == 1 then
				arg_403_0:Play115301101(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = arg_403_1.actors_["10030"].transform
			local var_406_1 = 0

			if var_406_1 < arg_403_1.time_ and arg_403_1.time_ <= var_406_1 + arg_406_0 then
				arg_403_1.var_.moveOldPos10030 = var_406_0.localPosition
				var_406_0.localScale = Vector3.New(1, 1, 1)

				arg_403_1:CheckSpriteTmpPos("10030", 4)

				local var_406_2 = var_406_0.childCount

				for iter_406_0 = 0, var_406_2 - 1 do
					local var_406_3 = var_406_0:GetChild(iter_406_0)

					if var_406_3.name == "split_3" or not string.find(var_406_3.name, "split") then
						var_406_3.gameObject:SetActive(true)
					else
						var_406_3.gameObject:SetActive(false)
					end
				end
			end

			local var_406_4 = 0.001

			if var_406_1 <= arg_403_1.time_ and arg_403_1.time_ < var_406_1 + var_406_4 then
				local var_406_5 = (arg_403_1.time_ - var_406_1) / var_406_4
				local var_406_6 = Vector3.New(390, -390, 150)

				var_406_0.localPosition = Vector3.Lerp(arg_403_1.var_.moveOldPos10030, var_406_6, var_406_5)
			end

			if arg_403_1.time_ >= var_406_1 + var_406_4 and arg_403_1.time_ < var_406_1 + var_406_4 + arg_406_0 then
				var_406_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_406_7 = arg_403_1.actors_["10030"]
			local var_406_8 = 0

			if var_406_8 < arg_403_1.time_ and arg_403_1.time_ <= var_406_8 + arg_406_0 then
				local var_406_9 = var_406_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_406_9 then
					arg_403_1.var_.alphaOldValue10030 = var_406_9.alpha
					arg_403_1.var_.characterEffect10030 = var_406_9
				end

				arg_403_1.var_.alphaOldValue10030 = 0
			end

			local var_406_10 = 0.333333333333333

			if var_406_8 <= arg_403_1.time_ and arg_403_1.time_ < var_406_8 + var_406_10 then
				local var_406_11 = (arg_403_1.time_ - var_406_8) / var_406_10
				local var_406_12 = Mathf.Lerp(arg_403_1.var_.alphaOldValue10030, 1, var_406_11)

				if arg_403_1.var_.characterEffect10030 then
					arg_403_1.var_.characterEffect10030.alpha = var_406_12
				end
			end

			if arg_403_1.time_ >= var_406_8 + var_406_10 and arg_403_1.time_ < var_406_8 + var_406_10 + arg_406_0 and arg_403_1.var_.characterEffect10030 then
				arg_403_1.var_.characterEffect10030.alpha = 1
			end

			local var_406_13 = 0
			local var_406_14 = 0.6

			if var_406_13 < arg_403_1.time_ and arg_403_1.time_ <= var_406_13 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, true)

				local var_406_15 = arg_403_1:FormatText(StoryNameCfg[309].name)

				arg_403_1.leftNameTxt_.text = var_406_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_403_1.leftNameTxt_.transform)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1.leftNameTxt_.text)
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_16 = arg_403_1:GetWordFromCfg(115301100)
				local var_406_17 = arg_403_1:FormatText(var_406_16.content)

				arg_403_1.text_.text = var_406_17

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_18 = 24
				local var_406_19 = utf8.len(var_406_17)
				local var_406_20 = var_406_18 <= 0 and var_406_14 or var_406_14 * (var_406_19 / var_406_18)

				if var_406_20 > 0 and var_406_14 < var_406_20 then
					arg_403_1.talkMaxDuration = var_406_20

					if var_406_20 + var_406_13 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_20 + var_406_13
					end
				end

				arg_403_1.text_.text = var_406_17
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301100", "story_v_out_115301.awb") ~= 0 then
					local var_406_21 = manager.audio:GetVoiceLength("story_v_out_115301", "115301100", "story_v_out_115301.awb") / 1000

					if var_406_21 + var_406_13 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_21 + var_406_13
					end

					if var_406_16.prefab_name ~= "" and arg_403_1.actors_[var_406_16.prefab_name] ~= nil then
						local var_406_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_403_1.actors_[var_406_16.prefab_name].transform, "story_v_out_115301", "115301100", "story_v_out_115301.awb")

						arg_403_1:RecordAudio("115301100", var_406_22)
						arg_403_1:RecordAudio("115301100", var_406_22)
					else
						arg_403_1:AudioAction("play", "voice", "story_v_out_115301", "115301100", "story_v_out_115301.awb")
					end

					arg_403_1:RecordHistoryTalkVoice("story_v_out_115301", "115301100", "story_v_out_115301.awb")
				end

				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_23 = math.max(var_406_14, arg_403_1.talkMaxDuration)

			if var_406_13 <= arg_403_1.time_ and arg_403_1.time_ < var_406_13 + var_406_23 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_13) / var_406_23

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_13 + var_406_23 and arg_403_1.time_ < var_406_13 + var_406_23 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play115301101 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 115301101
		arg_407_1.duration_ = 9.933

		local var_407_0 = {
			ja = 8.566,
			ko = 6.8,
			zh = 9.933,
			en = 7.066
		}
		local var_407_1 = manager.audio:GetLocalizationFlag()

		if var_407_0[var_407_1] ~= nil then
			arg_407_1.duration_ = var_407_0[var_407_1]
		end

		SetActive(arg_407_1.tipsGo_, false)

		function arg_407_1.onSingleLineFinish_()
			arg_407_1.onSingleLineUpdate_ = nil
			arg_407_1.onSingleLineFinish_ = nil
			arg_407_1.state_ = "waiting"
		end

		function arg_407_1.playNext_(arg_409_0)
			if arg_409_0 == 1 then
				arg_407_0:Play115301102(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = arg_407_1.actors_["1038"].transform
			local var_410_1 = 0

			if var_410_1 < arg_407_1.time_ and arg_407_1.time_ <= var_410_1 + arg_410_0 then
				arg_407_1.var_.moveOldPos1038 = var_410_0.localPosition
				var_410_0.localScale = Vector3.New(1, 1, 1)

				arg_407_1:CheckSpriteTmpPos("1038", 2)

				local var_410_2 = var_410_0.childCount

				for iter_410_0 = 0, var_410_2 - 1 do
					local var_410_3 = var_410_0:GetChild(iter_410_0)

					if var_410_3.name == "split_1" or not string.find(var_410_3.name, "split") then
						var_410_3.gameObject:SetActive(true)
					else
						var_410_3.gameObject:SetActive(false)
					end
				end
			end

			local var_410_4 = 0.001

			if var_410_1 <= arg_407_1.time_ and arg_407_1.time_ < var_410_1 + var_410_4 then
				local var_410_5 = (arg_407_1.time_ - var_410_1) / var_410_4
				local var_410_6 = Vector3.New(-390, -400, 0)

				var_410_0.localPosition = Vector3.Lerp(arg_407_1.var_.moveOldPos1038, var_410_6, var_410_5)
			end

			if arg_407_1.time_ >= var_410_1 + var_410_4 and arg_407_1.time_ < var_410_1 + var_410_4 + arg_410_0 then
				var_410_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_410_7 = arg_407_1.actors_["10030"]
			local var_410_8 = 0

			if var_410_8 < arg_407_1.time_ and arg_407_1.time_ <= var_410_8 + arg_410_0 and arg_407_1.var_.actorSpriteComps10030 == nil then
				arg_407_1.var_.actorSpriteComps10030 = var_410_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_410_9 = 0.2

			if var_410_8 <= arg_407_1.time_ and arg_407_1.time_ < var_410_8 + var_410_9 then
				local var_410_10 = (arg_407_1.time_ - var_410_8) / var_410_9

				if arg_407_1.var_.actorSpriteComps10030 then
					for iter_410_1, iter_410_2 in pairs(arg_407_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_410_2 then
							local var_410_11 = Mathf.Lerp(iter_410_2.color.r, 0.5, var_410_10)

							iter_410_2.color = Color.New(var_410_11, var_410_11, var_410_11)
						end
					end
				end
			end

			if arg_407_1.time_ >= var_410_8 + var_410_9 and arg_407_1.time_ < var_410_8 + var_410_9 + arg_410_0 and arg_407_1.var_.actorSpriteComps10030 then
				local var_410_12 = 0.5

				for iter_410_3, iter_410_4 in pairs(arg_407_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_410_4 then
						iter_410_4.color = Color.New(var_410_12, var_410_12, var_410_12)
					end
				end

				arg_407_1.var_.actorSpriteComps10030 = nil
			end

			local var_410_13 = arg_407_1.actors_["1038"]
			local var_410_14 = 0

			if var_410_14 < arg_407_1.time_ and arg_407_1.time_ <= var_410_14 + arg_410_0 then
				local var_410_15 = var_410_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_410_15 then
					arg_407_1.var_.alphaOldValue1038 = var_410_15.alpha
					arg_407_1.var_.characterEffect1038 = var_410_15
				end

				arg_407_1.var_.alphaOldValue1038 = 0
			end

			local var_410_16 = 0.333333333333333

			if var_410_14 <= arg_407_1.time_ and arg_407_1.time_ < var_410_14 + var_410_16 then
				local var_410_17 = (arg_407_1.time_ - var_410_14) / var_410_16
				local var_410_18 = Mathf.Lerp(arg_407_1.var_.alphaOldValue1038, 1, var_410_17)

				if arg_407_1.var_.characterEffect1038 then
					arg_407_1.var_.characterEffect1038.alpha = var_410_18
				end
			end

			if arg_407_1.time_ >= var_410_14 + var_410_16 and arg_407_1.time_ < var_410_14 + var_410_16 + arg_410_0 and arg_407_1.var_.characterEffect1038 then
				arg_407_1.var_.characterEffect1038.alpha = 1
			end

			local var_410_19 = arg_407_1.actors_["1038"]
			local var_410_20 = 0

			if var_410_20 < arg_407_1.time_ and arg_407_1.time_ <= var_410_20 + arg_410_0 and arg_407_1.var_.actorSpriteComps1038 == nil then
				arg_407_1.var_.actorSpriteComps1038 = var_410_19:GetComponentsInChildren(typeof(Image), true)
			end

			local var_410_21 = 0.2

			if var_410_20 <= arg_407_1.time_ and arg_407_1.time_ < var_410_20 + var_410_21 then
				local var_410_22 = (arg_407_1.time_ - var_410_20) / var_410_21

				if arg_407_1.var_.actorSpriteComps1038 then
					for iter_410_5, iter_410_6 in pairs(arg_407_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_410_6 then
							local var_410_23 = Mathf.Lerp(iter_410_6.color.r, 1, var_410_22)

							iter_410_6.color = Color.New(var_410_23, var_410_23, var_410_23)
						end
					end
				end
			end

			if arg_407_1.time_ >= var_410_20 + var_410_21 and arg_407_1.time_ < var_410_20 + var_410_21 + arg_410_0 and arg_407_1.var_.actorSpriteComps1038 then
				local var_410_24 = 1

				for iter_410_7, iter_410_8 in pairs(arg_407_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_410_8 then
						iter_410_8.color = Color.New(var_410_24, var_410_24, var_410_24)
					end
				end

				arg_407_1.var_.actorSpriteComps1038 = nil
			end

			local var_410_25 = 0
			local var_410_26 = 0.725

			if var_410_25 < arg_407_1.time_ and arg_407_1.time_ <= var_410_25 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, true)

				local var_410_27 = arg_407_1:FormatText(StoryNameCfg[94].name)

				arg_407_1.leftNameTxt_.text = var_410_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_407_1.leftNameTxt_.transform)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1.leftNameTxt_.text)
				SetActive(arg_407_1.iconTrs_.gameObject, false)
				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_28 = arg_407_1:GetWordFromCfg(115301101)
				local var_410_29 = arg_407_1:FormatText(var_410_28.content)

				arg_407_1.text_.text = var_410_29

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_30 = 29
				local var_410_31 = utf8.len(var_410_29)
				local var_410_32 = var_410_30 <= 0 and var_410_26 or var_410_26 * (var_410_31 / var_410_30)

				if var_410_32 > 0 and var_410_26 < var_410_32 then
					arg_407_1.talkMaxDuration = var_410_32

					if var_410_32 + var_410_25 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_32 + var_410_25
					end
				end

				arg_407_1.text_.text = var_410_29
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301101", "story_v_out_115301.awb") ~= 0 then
					local var_410_33 = manager.audio:GetVoiceLength("story_v_out_115301", "115301101", "story_v_out_115301.awb") / 1000

					if var_410_33 + var_410_25 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_33 + var_410_25
					end

					if var_410_28.prefab_name ~= "" and arg_407_1.actors_[var_410_28.prefab_name] ~= nil then
						local var_410_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_407_1.actors_[var_410_28.prefab_name].transform, "story_v_out_115301", "115301101", "story_v_out_115301.awb")

						arg_407_1:RecordAudio("115301101", var_410_34)
						arg_407_1:RecordAudio("115301101", var_410_34)
					else
						arg_407_1:AudioAction("play", "voice", "story_v_out_115301", "115301101", "story_v_out_115301.awb")
					end

					arg_407_1:RecordHistoryTalkVoice("story_v_out_115301", "115301101", "story_v_out_115301.awb")
				end

				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_35 = math.max(var_410_26, arg_407_1.talkMaxDuration)

			if var_410_25 <= arg_407_1.time_ and arg_407_1.time_ < var_410_25 + var_410_35 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_25) / var_410_35

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_25 + var_410_35 and arg_407_1.time_ < var_410_25 + var_410_35 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play115301102 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 115301102
		arg_411_1.duration_ = 5

		SetActive(arg_411_1.tipsGo_, false)

		function arg_411_1.onSingleLineFinish_()
			arg_411_1.onSingleLineUpdate_ = nil
			arg_411_1.onSingleLineFinish_ = nil
			arg_411_1.state_ = "waiting"
		end

		function arg_411_1.playNext_(arg_413_0)
			if arg_413_0 == 1 then
				arg_411_0:Play115301103(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = arg_411_1.actors_["1038"]
			local var_414_1 = 0

			if var_414_1 < arg_411_1.time_ and arg_411_1.time_ <= var_414_1 + arg_414_0 and arg_411_1.var_.actorSpriteComps1038 == nil then
				arg_411_1.var_.actorSpriteComps1038 = var_414_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_414_2 = 0.2

			if var_414_1 <= arg_411_1.time_ and arg_411_1.time_ < var_414_1 + var_414_2 then
				local var_414_3 = (arg_411_1.time_ - var_414_1) / var_414_2

				if arg_411_1.var_.actorSpriteComps1038 then
					for iter_414_0, iter_414_1 in pairs(arg_411_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_414_1 then
							local var_414_4 = Mathf.Lerp(iter_414_1.color.r, 0.5, var_414_3)

							iter_414_1.color = Color.New(var_414_4, var_414_4, var_414_4)
						end
					end
				end
			end

			if arg_411_1.time_ >= var_414_1 + var_414_2 and arg_411_1.time_ < var_414_1 + var_414_2 + arg_414_0 and arg_411_1.var_.actorSpriteComps1038 then
				local var_414_5 = 0.5

				for iter_414_2, iter_414_3 in pairs(arg_411_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_414_3 then
						iter_414_3.color = Color.New(var_414_5, var_414_5, var_414_5)
					end
				end

				arg_411_1.var_.actorSpriteComps1038 = nil
			end

			local var_414_6 = 0
			local var_414_7 = 1

			if var_414_6 < arg_411_1.time_ and arg_411_1.time_ <= var_414_6 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, false)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_8 = arg_411_1:GetWordFromCfg(115301102)
				local var_414_9 = arg_411_1:FormatText(var_414_8.content)

				arg_411_1.text_.text = var_414_9

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_10 = 40
				local var_414_11 = utf8.len(var_414_9)
				local var_414_12 = var_414_10 <= 0 and var_414_7 or var_414_7 * (var_414_11 / var_414_10)

				if var_414_12 > 0 and var_414_7 < var_414_12 then
					arg_411_1.talkMaxDuration = var_414_12

					if var_414_12 + var_414_6 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_12 + var_414_6
					end
				end

				arg_411_1.text_.text = var_414_9
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)
				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_13 = math.max(var_414_7, arg_411_1.talkMaxDuration)

			if var_414_6 <= arg_411_1.time_ and arg_411_1.time_ < var_414_6 + var_414_13 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_6) / var_414_13

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_6 + var_414_13 and arg_411_1.time_ < var_414_6 + var_414_13 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play115301103 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 115301103
		arg_415_1.duration_ = 19.8

		local var_415_0 = {
			ja = 12.733,
			ko = 13.8,
			zh = 13.8,
			en = 19.8
		}
		local var_415_1 = manager.audio:GetLocalizationFlag()

		if var_415_0[var_415_1] ~= nil then
			arg_415_1.duration_ = var_415_0[var_415_1]
		end

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play115301104(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = arg_415_1.actors_["1038"]
			local var_418_1 = 0

			if var_418_1 < arg_415_1.time_ and arg_415_1.time_ <= var_418_1 + arg_418_0 and arg_415_1.var_.actorSpriteComps1038 == nil then
				arg_415_1.var_.actorSpriteComps1038 = var_418_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_418_2 = 0.2

			if var_418_1 <= arg_415_1.time_ and arg_415_1.time_ < var_418_1 + var_418_2 then
				local var_418_3 = (arg_415_1.time_ - var_418_1) / var_418_2

				if arg_415_1.var_.actorSpriteComps1038 then
					for iter_418_0, iter_418_1 in pairs(arg_415_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_418_1 then
							local var_418_4 = Mathf.Lerp(iter_418_1.color.r, 1, var_418_3)

							iter_418_1.color = Color.New(var_418_4, var_418_4, var_418_4)
						end
					end
				end
			end

			if arg_415_1.time_ >= var_418_1 + var_418_2 and arg_415_1.time_ < var_418_1 + var_418_2 + arg_418_0 and arg_415_1.var_.actorSpriteComps1038 then
				local var_418_5 = 1

				for iter_418_2, iter_418_3 in pairs(arg_415_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_418_3 then
						iter_418_3.color = Color.New(var_418_5, var_418_5, var_418_5)
					end
				end

				arg_415_1.var_.actorSpriteComps1038 = nil
			end

			local var_418_6 = 0
			local var_418_7 = 1.225

			if var_418_6 < arg_415_1.time_ and arg_415_1.time_ <= var_418_6 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0
				arg_415_1.dialogCg_.alpha = 1

				arg_415_1.dialog_:SetActive(true)
				SetActive(arg_415_1.leftNameGo_, true)

				local var_418_8 = arg_415_1:FormatText(StoryNameCfg[94].name)

				arg_415_1.leftNameTxt_.text = var_418_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_415_1.leftNameTxt_.transform)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1.leftNameTxt_.text)
				SetActive(arg_415_1.iconTrs_.gameObject, false)
				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_9 = arg_415_1:GetWordFromCfg(115301103)
				local var_418_10 = arg_415_1:FormatText(var_418_9.content)

				arg_415_1.text_.text = var_418_10

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_11 = 49
				local var_418_12 = utf8.len(var_418_10)
				local var_418_13 = var_418_11 <= 0 and var_418_7 or var_418_7 * (var_418_12 / var_418_11)

				if var_418_13 > 0 and var_418_7 < var_418_13 then
					arg_415_1.talkMaxDuration = var_418_13

					if var_418_13 + var_418_6 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_13 + var_418_6
					end
				end

				arg_415_1.text_.text = var_418_10
				arg_415_1.typewritter.percent = 0

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301103", "story_v_out_115301.awb") ~= 0 then
					local var_418_14 = manager.audio:GetVoiceLength("story_v_out_115301", "115301103", "story_v_out_115301.awb") / 1000

					if var_418_14 + var_418_6 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_14 + var_418_6
					end

					if var_418_9.prefab_name ~= "" and arg_415_1.actors_[var_418_9.prefab_name] ~= nil then
						local var_418_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_415_1.actors_[var_418_9.prefab_name].transform, "story_v_out_115301", "115301103", "story_v_out_115301.awb")

						arg_415_1:RecordAudio("115301103", var_418_15)
						arg_415_1:RecordAudio("115301103", var_418_15)
					else
						arg_415_1:AudioAction("play", "voice", "story_v_out_115301", "115301103", "story_v_out_115301.awb")
					end

					arg_415_1:RecordHistoryTalkVoice("story_v_out_115301", "115301103", "story_v_out_115301.awb")
				end

				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_16 = math.max(var_418_7, arg_415_1.talkMaxDuration)

			if var_418_6 <= arg_415_1.time_ and arg_415_1.time_ < var_418_6 + var_418_16 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_6) / var_418_16

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_6 + var_418_16 and arg_415_1.time_ < var_418_6 + var_418_16 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play115301104 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 115301104
		arg_419_1.duration_ = 13.8

		local var_419_0 = {
			ja = 12.8,
			ko = 9.666,
			zh = 11.2,
			en = 13.8
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
				arg_419_0:Play115301105(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = 0
			local var_422_1 = 1.075

			if var_422_0 < arg_419_1.time_ and arg_419_1.time_ <= var_422_0 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, true)

				local var_422_2 = arg_419_1:FormatText(StoryNameCfg[94].name)

				arg_419_1.leftNameTxt_.text = var_422_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_419_1.leftNameTxt_.transform)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1.leftNameTxt_.text)
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_3 = arg_419_1:GetWordFromCfg(115301104)
				local var_422_4 = arg_419_1:FormatText(var_422_3.content)

				arg_419_1.text_.text = var_422_4

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_5 = 43
				local var_422_6 = utf8.len(var_422_4)
				local var_422_7 = var_422_5 <= 0 and var_422_1 or var_422_1 * (var_422_6 / var_422_5)

				if var_422_7 > 0 and var_422_1 < var_422_7 then
					arg_419_1.talkMaxDuration = var_422_7

					if var_422_7 + var_422_0 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_7 + var_422_0
					end
				end

				arg_419_1.text_.text = var_422_4
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301104", "story_v_out_115301.awb") ~= 0 then
					local var_422_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301104", "story_v_out_115301.awb") / 1000

					if var_422_8 + var_422_0 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_8 + var_422_0
					end

					if var_422_3.prefab_name ~= "" and arg_419_1.actors_[var_422_3.prefab_name] ~= nil then
						local var_422_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_419_1.actors_[var_422_3.prefab_name].transform, "story_v_out_115301", "115301104", "story_v_out_115301.awb")

						arg_419_1:RecordAudio("115301104", var_422_9)
						arg_419_1:RecordAudio("115301104", var_422_9)
					else
						arg_419_1:AudioAction("play", "voice", "story_v_out_115301", "115301104", "story_v_out_115301.awb")
					end

					arg_419_1:RecordHistoryTalkVoice("story_v_out_115301", "115301104", "story_v_out_115301.awb")
				end

				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_10 = math.max(var_422_1, arg_419_1.talkMaxDuration)

			if var_422_0 <= arg_419_1.time_ and arg_419_1.time_ < var_422_0 + var_422_10 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_0) / var_422_10

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_0 + var_422_10 and arg_419_1.time_ < var_422_0 + var_422_10 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play115301105 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 115301105
		arg_423_1.duration_ = 18.5

		local var_423_0 = {
			ja = 14.033,
			ko = 17.466,
			zh = 18.5,
			en = 18
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
				arg_423_0:Play115301106(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = 0
			local var_426_1 = 1.55

			if var_426_0 < arg_423_1.time_ and arg_423_1.time_ <= var_426_0 + arg_426_0 then
				arg_423_1.talkMaxDuration = 0
				arg_423_1.dialogCg_.alpha = 1

				arg_423_1.dialog_:SetActive(true)
				SetActive(arg_423_1.leftNameGo_, true)

				local var_426_2 = arg_423_1:FormatText(StoryNameCfg[94].name)

				arg_423_1.leftNameTxt_.text = var_426_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_423_1.leftNameTxt_.transform)

				arg_423_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_423_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_423_1:RecordName(arg_423_1.leftNameTxt_.text)
				SetActive(arg_423_1.iconTrs_.gameObject, false)
				arg_423_1.callingController_:SetSelectedState("normal")

				local var_426_3 = arg_423_1:GetWordFromCfg(115301105)
				local var_426_4 = arg_423_1:FormatText(var_426_3.content)

				arg_423_1.text_.text = var_426_4

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_5 = 62
				local var_426_6 = utf8.len(var_426_4)
				local var_426_7 = var_426_5 <= 0 and var_426_1 or var_426_1 * (var_426_6 / var_426_5)

				if var_426_7 > 0 and var_426_1 < var_426_7 then
					arg_423_1.talkMaxDuration = var_426_7

					if var_426_7 + var_426_0 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_7 + var_426_0
					end
				end

				arg_423_1.text_.text = var_426_4
				arg_423_1.typewritter.percent = 0

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301105", "story_v_out_115301.awb") ~= 0 then
					local var_426_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301105", "story_v_out_115301.awb") / 1000

					if var_426_8 + var_426_0 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_8 + var_426_0
					end

					if var_426_3.prefab_name ~= "" and arg_423_1.actors_[var_426_3.prefab_name] ~= nil then
						local var_426_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_423_1.actors_[var_426_3.prefab_name].transform, "story_v_out_115301", "115301105", "story_v_out_115301.awb")

						arg_423_1:RecordAudio("115301105", var_426_9)
						arg_423_1:RecordAudio("115301105", var_426_9)
					else
						arg_423_1:AudioAction("play", "voice", "story_v_out_115301", "115301105", "story_v_out_115301.awb")
					end

					arg_423_1:RecordHistoryTalkVoice("story_v_out_115301", "115301105", "story_v_out_115301.awb")
				end

				arg_423_1:RecordContent(arg_423_1.text_.text)
			end

			local var_426_10 = math.max(var_426_1, arg_423_1.talkMaxDuration)

			if var_426_0 <= arg_423_1.time_ and arg_423_1.time_ < var_426_0 + var_426_10 then
				arg_423_1.typewritter.percent = (arg_423_1.time_ - var_426_0) / var_426_10

				arg_423_1.typewritter:SetDirty()
			end

			if arg_423_1.time_ >= var_426_0 + var_426_10 and arg_423_1.time_ < var_426_0 + var_426_10 + arg_426_0 then
				arg_423_1.typewritter.percent = 1

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(true)
			end
		end
	end,
	Play115301106 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 115301106
		arg_427_1.duration_ = 16.5

		local var_427_0 = {
			ja = 14.9,
			ko = 16.5,
			zh = 16.433,
			en = 13.3
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
				arg_427_0:Play115301107(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = 0
			local var_430_1 = 1.625

			if var_430_0 < arg_427_1.time_ and arg_427_1.time_ <= var_430_0 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, true)

				local var_430_2 = arg_427_1:FormatText(StoryNameCfg[94].name)

				arg_427_1.leftNameTxt_.text = var_430_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_427_1.leftNameTxt_.transform)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1.leftNameTxt_.text)
				SetActive(arg_427_1.iconTrs_.gameObject, false)
				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_3 = arg_427_1:GetWordFromCfg(115301106)
				local var_430_4 = arg_427_1:FormatText(var_430_3.content)

				arg_427_1.text_.text = var_430_4

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_5 = 65
				local var_430_6 = utf8.len(var_430_4)
				local var_430_7 = var_430_5 <= 0 and var_430_1 or var_430_1 * (var_430_6 / var_430_5)

				if var_430_7 > 0 and var_430_1 < var_430_7 then
					arg_427_1.talkMaxDuration = var_430_7

					if var_430_7 + var_430_0 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_7 + var_430_0
					end
				end

				arg_427_1.text_.text = var_430_4
				arg_427_1.typewritter.percent = 0

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301106", "story_v_out_115301.awb") ~= 0 then
					local var_430_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301106", "story_v_out_115301.awb") / 1000

					if var_430_8 + var_430_0 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_8 + var_430_0
					end

					if var_430_3.prefab_name ~= "" and arg_427_1.actors_[var_430_3.prefab_name] ~= nil then
						local var_430_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_427_1.actors_[var_430_3.prefab_name].transform, "story_v_out_115301", "115301106", "story_v_out_115301.awb")

						arg_427_1:RecordAudio("115301106", var_430_9)
						arg_427_1:RecordAudio("115301106", var_430_9)
					else
						arg_427_1:AudioAction("play", "voice", "story_v_out_115301", "115301106", "story_v_out_115301.awb")
					end

					arg_427_1:RecordHistoryTalkVoice("story_v_out_115301", "115301106", "story_v_out_115301.awb")
				end

				arg_427_1:RecordContent(arg_427_1.text_.text)
			end

			local var_430_10 = math.max(var_430_1, arg_427_1.talkMaxDuration)

			if var_430_0 <= arg_427_1.time_ and arg_427_1.time_ < var_430_0 + var_430_10 then
				arg_427_1.typewritter.percent = (arg_427_1.time_ - var_430_0) / var_430_10

				arg_427_1.typewritter:SetDirty()
			end

			if arg_427_1.time_ >= var_430_0 + var_430_10 and arg_427_1.time_ < var_430_0 + var_430_10 + arg_430_0 then
				arg_427_1.typewritter.percent = 1

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(true)
			end
		end
	end,
	Play115301107 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 115301107
		arg_431_1.duration_ = 7.233

		local var_431_0 = {
			ja = 7.233,
			ko = 5.2,
			zh = 6.166,
			en = 5.733
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
				arg_431_0:Play115301108(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = 0
			local var_434_1 = 0.625

			if var_434_0 < arg_431_1.time_ and arg_431_1.time_ <= var_434_0 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, true)

				local var_434_2 = arg_431_1:FormatText(StoryNameCfg[94].name)

				arg_431_1.leftNameTxt_.text = var_434_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_431_1.leftNameTxt_.transform)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1.leftNameTxt_.text)
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_3 = arg_431_1:GetWordFromCfg(115301107)
				local var_434_4 = arg_431_1:FormatText(var_434_3.content)

				arg_431_1.text_.text = var_434_4

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_5 = 25
				local var_434_6 = utf8.len(var_434_4)
				local var_434_7 = var_434_5 <= 0 and var_434_1 or var_434_1 * (var_434_6 / var_434_5)

				if var_434_7 > 0 and var_434_1 < var_434_7 then
					arg_431_1.talkMaxDuration = var_434_7

					if var_434_7 + var_434_0 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_7 + var_434_0
					end
				end

				arg_431_1.text_.text = var_434_4
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301107", "story_v_out_115301.awb") ~= 0 then
					local var_434_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301107", "story_v_out_115301.awb") / 1000

					if var_434_8 + var_434_0 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_8 + var_434_0
					end

					if var_434_3.prefab_name ~= "" and arg_431_1.actors_[var_434_3.prefab_name] ~= nil then
						local var_434_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_431_1.actors_[var_434_3.prefab_name].transform, "story_v_out_115301", "115301107", "story_v_out_115301.awb")

						arg_431_1:RecordAudio("115301107", var_434_9)
						arg_431_1:RecordAudio("115301107", var_434_9)
					else
						arg_431_1:AudioAction("play", "voice", "story_v_out_115301", "115301107", "story_v_out_115301.awb")
					end

					arg_431_1:RecordHistoryTalkVoice("story_v_out_115301", "115301107", "story_v_out_115301.awb")
				end

				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_10 = math.max(var_434_1, arg_431_1.talkMaxDuration)

			if var_434_0 <= arg_431_1.time_ and arg_431_1.time_ < var_434_0 + var_434_10 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_0) / var_434_10

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_0 + var_434_10 and arg_431_1.time_ < var_434_0 + var_434_10 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play115301108 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 115301108
		arg_435_1.duration_ = 5

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play115301109(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = arg_435_1.actors_["1038"]
			local var_438_1 = 0

			if var_438_1 < arg_435_1.time_ and arg_435_1.time_ <= var_438_1 + arg_438_0 and arg_435_1.var_.actorSpriteComps1038 == nil then
				arg_435_1.var_.actorSpriteComps1038 = var_438_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_438_2 = 0.2

			if var_438_1 <= arg_435_1.time_ and arg_435_1.time_ < var_438_1 + var_438_2 then
				local var_438_3 = (arg_435_1.time_ - var_438_1) / var_438_2

				if arg_435_1.var_.actorSpriteComps1038 then
					for iter_438_0, iter_438_1 in pairs(arg_435_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_438_1 then
							local var_438_4 = Mathf.Lerp(iter_438_1.color.r, 0.5, var_438_3)

							iter_438_1.color = Color.New(var_438_4, var_438_4, var_438_4)
						end
					end
				end
			end

			if arg_435_1.time_ >= var_438_1 + var_438_2 and arg_435_1.time_ < var_438_1 + var_438_2 + arg_438_0 and arg_435_1.var_.actorSpriteComps1038 then
				local var_438_5 = 0.5

				for iter_438_2, iter_438_3 in pairs(arg_435_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_438_3 then
						iter_438_3.color = Color.New(var_438_5, var_438_5, var_438_5)
					end
				end

				arg_435_1.var_.actorSpriteComps1038 = nil
			end

			local var_438_6 = 0
			local var_438_7 = 0.975

			if var_438_6 < arg_435_1.time_ and arg_435_1.time_ <= var_438_6 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, false)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_8 = arg_435_1:GetWordFromCfg(115301108)
				local var_438_9 = arg_435_1:FormatText(var_438_8.content)

				arg_435_1.text_.text = var_438_9

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_10 = 39
				local var_438_11 = utf8.len(var_438_9)
				local var_438_12 = var_438_10 <= 0 and var_438_7 or var_438_7 * (var_438_11 / var_438_10)

				if var_438_12 > 0 and var_438_7 < var_438_12 then
					arg_435_1.talkMaxDuration = var_438_12

					if var_438_12 + var_438_6 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_12 + var_438_6
					end
				end

				arg_435_1.text_.text = var_438_9
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)
				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_13 = math.max(var_438_7, arg_435_1.talkMaxDuration)

			if var_438_6 <= arg_435_1.time_ and arg_435_1.time_ < var_438_6 + var_438_13 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_6) / var_438_13

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_6 + var_438_13 and arg_435_1.time_ < var_438_6 + var_438_13 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play115301109 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 115301109
		arg_439_1.duration_ = 6.4

		local var_439_0 = {
			ja = 6.4,
			ko = 4.633,
			zh = 6.133,
			en = 4.066
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
				arg_439_0:Play115301110(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = arg_439_1.actors_["1038"]
			local var_442_1 = 0

			if var_442_1 < arg_439_1.time_ and arg_439_1.time_ <= var_442_1 + arg_442_0 and arg_439_1.var_.actorSpriteComps1038 == nil then
				arg_439_1.var_.actorSpriteComps1038 = var_442_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_442_2 = 0.2

			if var_442_1 <= arg_439_1.time_ and arg_439_1.time_ < var_442_1 + var_442_2 then
				local var_442_3 = (arg_439_1.time_ - var_442_1) / var_442_2

				if arg_439_1.var_.actorSpriteComps1038 then
					for iter_442_0, iter_442_1 in pairs(arg_439_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_442_1 then
							local var_442_4 = Mathf.Lerp(iter_442_1.color.r, 1, var_442_3)

							iter_442_1.color = Color.New(var_442_4, var_442_4, var_442_4)
						end
					end
				end
			end

			if arg_439_1.time_ >= var_442_1 + var_442_2 and arg_439_1.time_ < var_442_1 + var_442_2 + arg_442_0 and arg_439_1.var_.actorSpriteComps1038 then
				local var_442_5 = 1

				for iter_442_2, iter_442_3 in pairs(arg_439_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_442_3 then
						iter_442_3.color = Color.New(var_442_5, var_442_5, var_442_5)
					end
				end

				arg_439_1.var_.actorSpriteComps1038 = nil
			end

			local var_442_6 = 0
			local var_442_7 = 0.525

			if var_442_6 < arg_439_1.time_ and arg_439_1.time_ <= var_442_6 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_8 = arg_439_1:FormatText(StoryNameCfg[94].name)

				arg_439_1.leftNameTxt_.text = var_442_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_9 = arg_439_1:GetWordFromCfg(115301109)
				local var_442_10 = arg_439_1:FormatText(var_442_9.content)

				arg_439_1.text_.text = var_442_10

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_11 = 21
				local var_442_12 = utf8.len(var_442_10)
				local var_442_13 = var_442_11 <= 0 and var_442_7 or var_442_7 * (var_442_12 / var_442_11)

				if var_442_13 > 0 and var_442_7 < var_442_13 then
					arg_439_1.talkMaxDuration = var_442_13

					if var_442_13 + var_442_6 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_13 + var_442_6
					end
				end

				arg_439_1.text_.text = var_442_10
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301109", "story_v_out_115301.awb") ~= 0 then
					local var_442_14 = manager.audio:GetVoiceLength("story_v_out_115301", "115301109", "story_v_out_115301.awb") / 1000

					if var_442_14 + var_442_6 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_14 + var_442_6
					end

					if var_442_9.prefab_name ~= "" and arg_439_1.actors_[var_442_9.prefab_name] ~= nil then
						local var_442_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_9.prefab_name].transform, "story_v_out_115301", "115301109", "story_v_out_115301.awb")

						arg_439_1:RecordAudio("115301109", var_442_15)
						arg_439_1:RecordAudio("115301109", var_442_15)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_out_115301", "115301109", "story_v_out_115301.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_out_115301", "115301109", "story_v_out_115301.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_16 = math.max(var_442_7, arg_439_1.talkMaxDuration)

			if var_442_6 <= arg_439_1.time_ and arg_439_1.time_ < var_442_6 + var_442_16 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_6) / var_442_16

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_6 + var_442_16 and arg_439_1.time_ < var_442_6 + var_442_16 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play115301110 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 115301110
		arg_443_1.duration_ = 5

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play115301111(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = arg_443_1.actors_["1038"]
			local var_446_1 = 0

			if var_446_1 < arg_443_1.time_ and arg_443_1.time_ <= var_446_1 + arg_446_0 then
				local var_446_2 = var_446_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_446_2 then
					arg_443_1.var_.alphaOldValue1038 = var_446_2.alpha
					arg_443_1.var_.characterEffect1038 = var_446_2
				end

				arg_443_1.var_.alphaOldValue1038 = 1
			end

			local var_446_3 = 0.333333333333333

			if var_446_1 <= arg_443_1.time_ and arg_443_1.time_ < var_446_1 + var_446_3 then
				local var_446_4 = (arg_443_1.time_ - var_446_1) / var_446_3
				local var_446_5 = Mathf.Lerp(arg_443_1.var_.alphaOldValue1038, 0, var_446_4)

				if arg_443_1.var_.characterEffect1038 then
					arg_443_1.var_.characterEffect1038.alpha = var_446_5
				end
			end

			if arg_443_1.time_ >= var_446_1 + var_446_3 and arg_443_1.time_ < var_446_1 + var_446_3 + arg_446_0 and arg_443_1.var_.characterEffect1038 then
				arg_443_1.var_.characterEffect1038.alpha = 0
			end

			local var_446_6 = arg_443_1.actors_["10030"]
			local var_446_7 = 0

			if var_446_7 < arg_443_1.time_ and arg_443_1.time_ <= var_446_7 + arg_446_0 then
				local var_446_8 = var_446_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_446_8 then
					arg_443_1.var_.alphaOldValue10030 = var_446_8.alpha
					arg_443_1.var_.characterEffect10030 = var_446_8
				end

				arg_443_1.var_.alphaOldValue10030 = 1
			end

			local var_446_9 = 0.333333333333333

			if var_446_7 <= arg_443_1.time_ and arg_443_1.time_ < var_446_7 + var_446_9 then
				local var_446_10 = (arg_443_1.time_ - var_446_7) / var_446_9
				local var_446_11 = Mathf.Lerp(arg_443_1.var_.alphaOldValue10030, 0, var_446_10)

				if arg_443_1.var_.characterEffect10030 then
					arg_443_1.var_.characterEffect10030.alpha = var_446_11
				end
			end

			if arg_443_1.time_ >= var_446_7 + var_446_9 and arg_443_1.time_ < var_446_7 + var_446_9 + arg_446_0 and arg_443_1.var_.characterEffect10030 then
				arg_443_1.var_.characterEffect10030.alpha = 0
			end

			local var_446_12 = 0
			local var_446_13 = 1.175

			if var_446_12 < arg_443_1.time_ and arg_443_1.time_ <= var_446_12 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, false)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_14 = arg_443_1:GetWordFromCfg(115301110)
				local var_446_15 = arg_443_1:FormatText(var_446_14.content)

				arg_443_1.text_.text = var_446_15

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_16 = 47
				local var_446_17 = utf8.len(var_446_15)
				local var_446_18 = var_446_16 <= 0 and var_446_13 or var_446_13 * (var_446_17 / var_446_16)

				if var_446_18 > 0 and var_446_13 < var_446_18 then
					arg_443_1.talkMaxDuration = var_446_18

					if var_446_18 + var_446_12 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_18 + var_446_12
					end
				end

				arg_443_1.text_.text = var_446_15
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)
				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_19 = math.max(var_446_13, arg_443_1.talkMaxDuration)

			if var_446_12 <= arg_443_1.time_ and arg_443_1.time_ < var_446_12 + var_446_19 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_12) / var_446_19

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_12 + var_446_19 and arg_443_1.time_ < var_446_12 + var_446_19 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play115301111 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 115301111
		arg_447_1.duration_ = 5

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play115301112(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = 0
			local var_450_1 = 0.975

			if var_450_0 < arg_447_1.time_ and arg_447_1.time_ <= var_450_0 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, false)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_447_1.iconTrs_.gameObject, false)
				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_2 = arg_447_1:GetWordFromCfg(115301111)
				local var_450_3 = arg_447_1:FormatText(var_450_2.content)

				arg_447_1.text_.text = var_450_3

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_4 = 39
				local var_450_5 = utf8.len(var_450_3)
				local var_450_6 = var_450_4 <= 0 and var_450_1 or var_450_1 * (var_450_5 / var_450_4)

				if var_450_6 > 0 and var_450_1 < var_450_6 then
					arg_447_1.talkMaxDuration = var_450_6

					if var_450_6 + var_450_0 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_6 + var_450_0
					end
				end

				arg_447_1.text_.text = var_450_3
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)
				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_7 = math.max(var_450_1, arg_447_1.talkMaxDuration)

			if var_450_0 <= arg_447_1.time_ and arg_447_1.time_ < var_450_0 + var_450_7 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_0) / var_450_7

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_0 + var_450_7 and arg_447_1.time_ < var_450_0 + var_450_7 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play115301112 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 115301112
		arg_451_1.duration_ = 11.066

		local var_451_0 = {
			ja = 11.066,
			ko = 5.1,
			zh = 6,
			en = 4.666
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
				arg_451_0:Play115301113(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = arg_451_1.actors_["10030"].transform
			local var_454_1 = 0

			if var_454_1 < arg_451_1.time_ and arg_451_1.time_ <= var_454_1 + arg_454_0 then
				arg_451_1.var_.moveOldPos10030 = var_454_0.localPosition
				var_454_0.localScale = Vector3.New(1, 1, 1)

				arg_451_1:CheckSpriteTmpPos("10030", 3)

				local var_454_2 = var_454_0.childCount

				for iter_454_0 = 0, var_454_2 - 1 do
					local var_454_3 = var_454_0:GetChild(iter_454_0)

					if var_454_3.name == "split_3" or not string.find(var_454_3.name, "split") then
						var_454_3.gameObject:SetActive(true)
					else
						var_454_3.gameObject:SetActive(false)
					end
				end
			end

			local var_454_4 = 0.001

			if var_454_1 <= arg_451_1.time_ and arg_451_1.time_ < var_454_1 + var_454_4 then
				local var_454_5 = (arg_451_1.time_ - var_454_1) / var_454_4
				local var_454_6 = Vector3.New(0, -390, 150)

				var_454_0.localPosition = Vector3.Lerp(arg_451_1.var_.moveOldPos10030, var_454_6, var_454_5)
			end

			if arg_451_1.time_ >= var_454_1 + var_454_4 and arg_451_1.time_ < var_454_1 + var_454_4 + arg_454_0 then
				var_454_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_454_7 = arg_451_1.actors_["10030"]
			local var_454_8 = 0

			if var_454_8 < arg_451_1.time_ and arg_451_1.time_ <= var_454_8 + arg_454_0 and arg_451_1.var_.actorSpriteComps10030 == nil then
				arg_451_1.var_.actorSpriteComps10030 = var_454_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_454_9 = 0.2

			if var_454_8 <= arg_451_1.time_ and arg_451_1.time_ < var_454_8 + var_454_9 then
				local var_454_10 = (arg_451_1.time_ - var_454_8) / var_454_9

				if arg_451_1.var_.actorSpriteComps10030 then
					for iter_454_1, iter_454_2 in pairs(arg_451_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_454_2 then
							local var_454_11 = Mathf.Lerp(iter_454_2.color.r, 1, var_454_10)

							iter_454_2.color = Color.New(var_454_11, var_454_11, var_454_11)
						end
					end
				end
			end

			if arg_451_1.time_ >= var_454_8 + var_454_9 and arg_451_1.time_ < var_454_8 + var_454_9 + arg_454_0 and arg_451_1.var_.actorSpriteComps10030 then
				local var_454_12 = 1

				for iter_454_3, iter_454_4 in pairs(arg_451_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_454_4 then
						iter_454_4.color = Color.New(var_454_12, var_454_12, var_454_12)
					end
				end

				arg_451_1.var_.actorSpriteComps10030 = nil
			end

			local var_454_13 = arg_451_1.actors_["10030"]
			local var_454_14 = 0

			if var_454_14 < arg_451_1.time_ and arg_451_1.time_ <= var_454_14 + arg_454_0 then
				local var_454_15 = var_454_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_454_15 then
					arg_451_1.var_.alphaOldValue10030 = var_454_15.alpha
					arg_451_1.var_.characterEffect10030 = var_454_15
				end

				arg_451_1.var_.alphaOldValue10030 = 0
			end

			local var_454_16 = 0.333333333333333

			if var_454_14 <= arg_451_1.time_ and arg_451_1.time_ < var_454_14 + var_454_16 then
				local var_454_17 = (arg_451_1.time_ - var_454_14) / var_454_16
				local var_454_18 = Mathf.Lerp(arg_451_1.var_.alphaOldValue10030, 1, var_454_17)

				if arg_451_1.var_.characterEffect10030 then
					arg_451_1.var_.characterEffect10030.alpha = var_454_18
				end
			end

			if arg_451_1.time_ >= var_454_14 + var_454_16 and arg_451_1.time_ < var_454_14 + var_454_16 + arg_454_0 and arg_451_1.var_.characterEffect10030 then
				arg_451_1.var_.characterEffect10030.alpha = 1
			end

			local var_454_19 = 0
			local var_454_20 = 0.3

			if var_454_19 < arg_451_1.time_ and arg_451_1.time_ <= var_454_19 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, true)

				local var_454_21 = arg_451_1:FormatText(StoryNameCfg[309].name)

				arg_451_1.leftNameTxt_.text = var_454_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_451_1.leftNameTxt_.transform)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1.leftNameTxt_.text)
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_22 = arg_451_1:GetWordFromCfg(115301112)
				local var_454_23 = arg_451_1:FormatText(var_454_22.content)

				arg_451_1.text_.text = var_454_23

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_24 = 12
				local var_454_25 = utf8.len(var_454_23)
				local var_454_26 = var_454_24 <= 0 and var_454_20 or var_454_20 * (var_454_25 / var_454_24)

				if var_454_26 > 0 and var_454_20 < var_454_26 then
					arg_451_1.talkMaxDuration = var_454_26

					if var_454_26 + var_454_19 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_26 + var_454_19
					end
				end

				arg_451_1.text_.text = var_454_23
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301112", "story_v_out_115301.awb") ~= 0 then
					local var_454_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301112", "story_v_out_115301.awb") / 1000

					if var_454_27 + var_454_19 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_27 + var_454_19
					end

					if var_454_22.prefab_name ~= "" and arg_451_1.actors_[var_454_22.prefab_name] ~= nil then
						local var_454_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_451_1.actors_[var_454_22.prefab_name].transform, "story_v_out_115301", "115301112", "story_v_out_115301.awb")

						arg_451_1:RecordAudio("115301112", var_454_28)
						arg_451_1:RecordAudio("115301112", var_454_28)
					else
						arg_451_1:AudioAction("play", "voice", "story_v_out_115301", "115301112", "story_v_out_115301.awb")
					end

					arg_451_1:RecordHistoryTalkVoice("story_v_out_115301", "115301112", "story_v_out_115301.awb")
				end

				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_29 = math.max(var_454_20, arg_451_1.talkMaxDuration)

			if var_454_19 <= arg_451_1.time_ and arg_451_1.time_ < var_454_19 + var_454_29 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_19) / var_454_29

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_19 + var_454_29 and arg_451_1.time_ < var_454_19 + var_454_29 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play115301113 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 115301113
		arg_455_1.duration_ = 5

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play115301114(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = arg_455_1.actors_["10030"]
			local var_458_1 = 0

			if var_458_1 < arg_455_1.time_ and arg_455_1.time_ <= var_458_1 + arg_458_0 then
				local var_458_2 = var_458_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_458_2 then
					arg_455_1.var_.alphaOldValue10030 = var_458_2.alpha
					arg_455_1.var_.characterEffect10030 = var_458_2
				end

				arg_455_1.var_.alphaOldValue10030 = 1
			end

			local var_458_3 = 0.333333333333333

			if var_458_1 <= arg_455_1.time_ and arg_455_1.time_ < var_458_1 + var_458_3 then
				local var_458_4 = (arg_455_1.time_ - var_458_1) / var_458_3
				local var_458_5 = Mathf.Lerp(arg_455_1.var_.alphaOldValue10030, 0, var_458_4)

				if arg_455_1.var_.characterEffect10030 then
					arg_455_1.var_.characterEffect10030.alpha = var_458_5
				end
			end

			if arg_455_1.time_ >= var_458_1 + var_458_3 and arg_455_1.time_ < var_458_1 + var_458_3 + arg_458_0 and arg_455_1.var_.characterEffect10030 then
				arg_455_1.var_.characterEffect10030.alpha = 0
			end

			local var_458_6 = 0
			local var_458_7 = 0.725

			if var_458_6 < arg_455_1.time_ and arg_455_1.time_ <= var_458_6 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, false)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_8 = arg_455_1:GetWordFromCfg(115301113)
				local var_458_9 = arg_455_1:FormatText(var_458_8.content)

				arg_455_1.text_.text = var_458_9

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_10 = 29
				local var_458_11 = utf8.len(var_458_9)
				local var_458_12 = var_458_10 <= 0 and var_458_7 or var_458_7 * (var_458_11 / var_458_10)

				if var_458_12 > 0 and var_458_7 < var_458_12 then
					arg_455_1.talkMaxDuration = var_458_12

					if var_458_12 + var_458_6 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_12 + var_458_6
					end
				end

				arg_455_1.text_.text = var_458_9
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)
				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_13 = math.max(var_458_7, arg_455_1.talkMaxDuration)

			if var_458_6 <= arg_455_1.time_ and arg_455_1.time_ < var_458_6 + var_458_13 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_6) / var_458_13

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_6 + var_458_13 and arg_455_1.time_ < var_458_6 + var_458_13 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play115301114 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 115301114
		arg_459_1.duration_ = 14.833

		local var_459_0 = {
			ja = 14.833,
			ko = 11.566,
			zh = 7.533,
			en = 10.2
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
				arg_459_0:Play115301115(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = arg_459_1.actors_["10030"].transform
			local var_462_1 = 0

			if var_462_1 < arg_459_1.time_ and arg_459_1.time_ <= var_462_1 + arg_462_0 then
				arg_459_1.var_.moveOldPos10030 = var_462_0.localPosition
				var_462_0.localScale = Vector3.New(1, 1, 1)

				arg_459_1:CheckSpriteTmpPos("10030", 3)

				local var_462_2 = var_462_0.childCount

				for iter_462_0 = 0, var_462_2 - 1 do
					local var_462_3 = var_462_0:GetChild(iter_462_0)

					if var_462_3.name == "split_3" or not string.find(var_462_3.name, "split") then
						var_462_3.gameObject:SetActive(true)
					else
						var_462_3.gameObject:SetActive(false)
					end
				end
			end

			local var_462_4 = 0.001

			if var_462_1 <= arg_459_1.time_ and arg_459_1.time_ < var_462_1 + var_462_4 then
				local var_462_5 = (arg_459_1.time_ - var_462_1) / var_462_4
				local var_462_6 = Vector3.New(0, -390, 150)

				var_462_0.localPosition = Vector3.Lerp(arg_459_1.var_.moveOldPos10030, var_462_6, var_462_5)
			end

			if arg_459_1.time_ >= var_462_1 + var_462_4 and arg_459_1.time_ < var_462_1 + var_462_4 + arg_462_0 then
				var_462_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_462_7 = arg_459_1.actors_["10030"]
			local var_462_8 = 0

			if var_462_8 < arg_459_1.time_ and arg_459_1.time_ <= var_462_8 + arg_462_0 then
				local var_462_9 = var_462_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_462_9 then
					arg_459_1.var_.alphaOldValue10030 = var_462_9.alpha
					arg_459_1.var_.characterEffect10030 = var_462_9
				end

				arg_459_1.var_.alphaOldValue10030 = 0
			end

			local var_462_10 = 0.333333333333333

			if var_462_8 <= arg_459_1.time_ and arg_459_1.time_ < var_462_8 + var_462_10 then
				local var_462_11 = (arg_459_1.time_ - var_462_8) / var_462_10
				local var_462_12 = Mathf.Lerp(arg_459_1.var_.alphaOldValue10030, 1, var_462_11)

				if arg_459_1.var_.characterEffect10030 then
					arg_459_1.var_.characterEffect10030.alpha = var_462_12
				end
			end

			if arg_459_1.time_ >= var_462_8 + var_462_10 and arg_459_1.time_ < var_462_8 + var_462_10 + arg_462_0 and arg_459_1.var_.characterEffect10030 then
				arg_459_1.var_.characterEffect10030.alpha = 1
			end

			local var_462_13 = 0
			local var_462_14 = 0.825

			if var_462_13 < arg_459_1.time_ and arg_459_1.time_ <= var_462_13 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, true)

				local var_462_15 = arg_459_1:FormatText(StoryNameCfg[309].name)

				arg_459_1.leftNameTxt_.text = var_462_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_459_1.leftNameTxt_.transform)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1.leftNameTxt_.text)
				SetActive(arg_459_1.iconTrs_.gameObject, false)
				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_16 = arg_459_1:GetWordFromCfg(115301114)
				local var_462_17 = arg_459_1:FormatText(var_462_16.content)

				arg_459_1.text_.text = var_462_17

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_18 = 33
				local var_462_19 = utf8.len(var_462_17)
				local var_462_20 = var_462_18 <= 0 and var_462_14 or var_462_14 * (var_462_19 / var_462_18)

				if var_462_20 > 0 and var_462_14 < var_462_20 then
					arg_459_1.talkMaxDuration = var_462_20

					if var_462_20 + var_462_13 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_20 + var_462_13
					end
				end

				arg_459_1.text_.text = var_462_17
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301114", "story_v_out_115301.awb") ~= 0 then
					local var_462_21 = manager.audio:GetVoiceLength("story_v_out_115301", "115301114", "story_v_out_115301.awb") / 1000

					if var_462_21 + var_462_13 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_21 + var_462_13
					end

					if var_462_16.prefab_name ~= "" and arg_459_1.actors_[var_462_16.prefab_name] ~= nil then
						local var_462_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_459_1.actors_[var_462_16.prefab_name].transform, "story_v_out_115301", "115301114", "story_v_out_115301.awb")

						arg_459_1:RecordAudio("115301114", var_462_22)
						arg_459_1:RecordAudio("115301114", var_462_22)
					else
						arg_459_1:AudioAction("play", "voice", "story_v_out_115301", "115301114", "story_v_out_115301.awb")
					end

					arg_459_1:RecordHistoryTalkVoice("story_v_out_115301", "115301114", "story_v_out_115301.awb")
				end

				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_23 = math.max(var_462_14, arg_459_1.talkMaxDuration)

			if var_462_13 <= arg_459_1.time_ and arg_459_1.time_ < var_462_13 + var_462_23 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_13) / var_462_23

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_13 + var_462_23 and arg_459_1.time_ < var_462_13 + var_462_23 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play115301115 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 115301115
		arg_463_1.duration_ = 12.233

		local var_463_0 = {
			ja = 6.066,
			ko = 9.933,
			zh = 8.966,
			en = 12.233
		}
		local var_463_1 = manager.audio:GetLocalizationFlag()

		if var_463_0[var_463_1] ~= nil then
			arg_463_1.duration_ = var_463_0[var_463_1]
		end

		SetActive(arg_463_1.tipsGo_, false)

		function arg_463_1.onSingleLineFinish_()
			arg_463_1.onSingleLineUpdate_ = nil
			arg_463_1.onSingleLineFinish_ = nil
			arg_463_1.state_ = "waiting"
		end

		function arg_463_1.playNext_(arg_465_0)
			if arg_465_0 == 1 then
				arg_463_0:Play115301116(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = 0
			local var_466_1 = 1

			if var_466_0 < arg_463_1.time_ and arg_463_1.time_ <= var_466_0 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, true)

				local var_466_2 = arg_463_1:FormatText(StoryNameCfg[309].name)

				arg_463_1.leftNameTxt_.text = var_466_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_463_1.leftNameTxt_.transform)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1.leftNameTxt_.text)
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_3 = arg_463_1:GetWordFromCfg(115301115)
				local var_466_4 = arg_463_1:FormatText(var_466_3.content)

				arg_463_1.text_.text = var_466_4

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_5 = 40
				local var_466_6 = utf8.len(var_466_4)
				local var_466_7 = var_466_5 <= 0 and var_466_1 or var_466_1 * (var_466_6 / var_466_5)

				if var_466_7 > 0 and var_466_1 < var_466_7 then
					arg_463_1.talkMaxDuration = var_466_7

					if var_466_7 + var_466_0 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_7 + var_466_0
					end
				end

				arg_463_1.text_.text = var_466_4
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301115", "story_v_out_115301.awb") ~= 0 then
					local var_466_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301115", "story_v_out_115301.awb") / 1000

					if var_466_8 + var_466_0 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_8 + var_466_0
					end

					if var_466_3.prefab_name ~= "" and arg_463_1.actors_[var_466_3.prefab_name] ~= nil then
						local var_466_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_463_1.actors_[var_466_3.prefab_name].transform, "story_v_out_115301", "115301115", "story_v_out_115301.awb")

						arg_463_1:RecordAudio("115301115", var_466_9)
						arg_463_1:RecordAudio("115301115", var_466_9)
					else
						arg_463_1:AudioAction("play", "voice", "story_v_out_115301", "115301115", "story_v_out_115301.awb")
					end

					arg_463_1:RecordHistoryTalkVoice("story_v_out_115301", "115301115", "story_v_out_115301.awb")
				end

				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_10 = math.max(var_466_1, arg_463_1.talkMaxDuration)

			if var_466_0 <= arg_463_1.time_ and arg_463_1.time_ < var_466_0 + var_466_10 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_0) / var_466_10

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_0 + var_466_10 and arg_463_1.time_ < var_466_0 + var_466_10 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play115301116 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 115301116
		arg_467_1.duration_ = 5

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play115301117(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = arg_467_1.actors_["10030"]
			local var_470_1 = 0

			if var_470_1 < arg_467_1.time_ and arg_467_1.time_ <= var_470_1 + arg_470_0 then
				local var_470_2 = var_470_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_470_2 then
					arg_467_1.var_.alphaOldValue10030 = var_470_2.alpha
					arg_467_1.var_.characterEffect10030 = var_470_2
				end

				arg_467_1.var_.alphaOldValue10030 = 1
			end

			local var_470_3 = 0.333333333333333

			if var_470_1 <= arg_467_1.time_ and arg_467_1.time_ < var_470_1 + var_470_3 then
				local var_470_4 = (arg_467_1.time_ - var_470_1) / var_470_3
				local var_470_5 = Mathf.Lerp(arg_467_1.var_.alphaOldValue10030, 0, var_470_4)

				if arg_467_1.var_.characterEffect10030 then
					arg_467_1.var_.characterEffect10030.alpha = var_470_5
				end
			end

			if arg_467_1.time_ >= var_470_1 + var_470_3 and arg_467_1.time_ < var_470_1 + var_470_3 + arg_470_0 and arg_467_1.var_.characterEffect10030 then
				arg_467_1.var_.characterEffect10030.alpha = 0
			end

			local var_470_6 = 0
			local var_470_7 = 1.25

			if var_470_6 < arg_467_1.time_ and arg_467_1.time_ <= var_470_6 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, false)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_467_1.iconTrs_.gameObject, false)
				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_8 = arg_467_1:GetWordFromCfg(115301116)
				local var_470_9 = arg_467_1:FormatText(var_470_8.content)

				arg_467_1.text_.text = var_470_9

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_10 = 50
				local var_470_11 = utf8.len(var_470_9)
				local var_470_12 = var_470_10 <= 0 and var_470_7 or var_470_7 * (var_470_11 / var_470_10)

				if var_470_12 > 0 and var_470_7 < var_470_12 then
					arg_467_1.talkMaxDuration = var_470_12

					if var_470_12 + var_470_6 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_12 + var_470_6
					end
				end

				arg_467_1.text_.text = var_470_9
				arg_467_1.typewritter.percent = 0

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(false)
				arg_467_1:RecordContent(arg_467_1.text_.text)
			end

			local var_470_13 = math.max(var_470_7, arg_467_1.talkMaxDuration)

			if var_470_6 <= arg_467_1.time_ and arg_467_1.time_ < var_470_6 + var_470_13 then
				arg_467_1.typewritter.percent = (arg_467_1.time_ - var_470_6) / var_470_13

				arg_467_1.typewritter:SetDirty()
			end

			if arg_467_1.time_ >= var_470_6 + var_470_13 and arg_467_1.time_ < var_470_6 + var_470_13 + arg_470_0 then
				arg_467_1.typewritter.percent = 1

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(true)
			end
		end
	end,
	Play115301117 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 115301117
		arg_471_1.duration_ = 3.233

		local var_471_0 = {
			ja = 3.166,
			ko = 3.233,
			zh = 3.1,
			en = 3.033
		}
		local var_471_1 = manager.audio:GetLocalizationFlag()

		if var_471_0[var_471_1] ~= nil then
			arg_471_1.duration_ = var_471_0[var_471_1]
		end

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play115301118(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = arg_471_1.actors_["10030"].transform
			local var_474_1 = 0

			if var_474_1 < arg_471_1.time_ and arg_471_1.time_ <= var_474_1 + arg_474_0 then
				arg_471_1.var_.moveOldPos10030 = var_474_0.localPosition
				var_474_0.localScale = Vector3.New(1, 1, 1)

				arg_471_1:CheckSpriteTmpPos("10030", 4)

				local var_474_2 = var_474_0.childCount

				for iter_474_0 = 0, var_474_2 - 1 do
					local var_474_3 = var_474_0:GetChild(iter_474_0)

					if var_474_3.name == "split_2" or not string.find(var_474_3.name, "split") then
						var_474_3.gameObject:SetActive(true)
					else
						var_474_3.gameObject:SetActive(false)
					end
				end
			end

			local var_474_4 = 0.001

			if var_474_1 <= arg_471_1.time_ and arg_471_1.time_ < var_474_1 + var_474_4 then
				local var_474_5 = (arg_471_1.time_ - var_474_1) / var_474_4
				local var_474_6 = Vector3.New(390, -390, 150)

				var_474_0.localPosition = Vector3.Lerp(arg_471_1.var_.moveOldPos10030, var_474_6, var_474_5)
			end

			if arg_471_1.time_ >= var_474_1 + var_474_4 and arg_471_1.time_ < var_474_1 + var_474_4 + arg_474_0 then
				var_474_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_474_7 = arg_471_1.actors_["10030"]
			local var_474_8 = 0

			if var_474_8 < arg_471_1.time_ and arg_471_1.time_ <= var_474_8 + arg_474_0 then
				local var_474_9 = var_474_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_474_9 then
					arg_471_1.var_.alphaOldValue10030 = var_474_9.alpha
					arg_471_1.var_.characterEffect10030 = var_474_9
				end

				arg_471_1.var_.alphaOldValue10030 = 0
			end

			local var_474_10 = 0.333333333333333

			if var_474_8 <= arg_471_1.time_ and arg_471_1.time_ < var_474_8 + var_474_10 then
				local var_474_11 = (arg_471_1.time_ - var_474_8) / var_474_10
				local var_474_12 = Mathf.Lerp(arg_471_1.var_.alphaOldValue10030, 1, var_474_11)

				if arg_471_1.var_.characterEffect10030 then
					arg_471_1.var_.characterEffect10030.alpha = var_474_12
				end
			end

			if arg_471_1.time_ >= var_474_8 + var_474_10 and arg_471_1.time_ < var_474_8 + var_474_10 + arg_474_0 and arg_471_1.var_.characterEffect10030 then
				arg_471_1.var_.characterEffect10030.alpha = 1
			end

			local var_474_13 = 0
			local var_474_14 = 0.275

			if var_474_13 < arg_471_1.time_ and arg_471_1.time_ <= var_474_13 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, true)

				local var_474_15 = arg_471_1:FormatText(StoryNameCfg[309].name)

				arg_471_1.leftNameTxt_.text = var_474_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_471_1.leftNameTxt_.transform)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1.leftNameTxt_.text)
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_16 = arg_471_1:GetWordFromCfg(115301117)
				local var_474_17 = arg_471_1:FormatText(var_474_16.content)

				arg_471_1.text_.text = var_474_17

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_18 = 11
				local var_474_19 = utf8.len(var_474_17)
				local var_474_20 = var_474_18 <= 0 and var_474_14 or var_474_14 * (var_474_19 / var_474_18)

				if var_474_20 > 0 and var_474_14 < var_474_20 then
					arg_471_1.talkMaxDuration = var_474_20

					if var_474_20 + var_474_13 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_20 + var_474_13
					end
				end

				arg_471_1.text_.text = var_474_17
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301117", "story_v_out_115301.awb") ~= 0 then
					local var_474_21 = manager.audio:GetVoiceLength("story_v_out_115301", "115301117", "story_v_out_115301.awb") / 1000

					if var_474_21 + var_474_13 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_21 + var_474_13
					end

					if var_474_16.prefab_name ~= "" and arg_471_1.actors_[var_474_16.prefab_name] ~= nil then
						local var_474_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_471_1.actors_[var_474_16.prefab_name].transform, "story_v_out_115301", "115301117", "story_v_out_115301.awb")

						arg_471_1:RecordAudio("115301117", var_474_22)
						arg_471_1:RecordAudio("115301117", var_474_22)
					else
						arg_471_1:AudioAction("play", "voice", "story_v_out_115301", "115301117", "story_v_out_115301.awb")
					end

					arg_471_1:RecordHistoryTalkVoice("story_v_out_115301", "115301117", "story_v_out_115301.awb")
				end

				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_23 = math.max(var_474_14, arg_471_1.talkMaxDuration)

			if var_474_13 <= arg_471_1.time_ and arg_471_1.time_ < var_474_13 + var_474_23 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_13) / var_474_23

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_13 + var_474_23 and arg_471_1.time_ < var_474_13 + var_474_23 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play115301118 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 115301118
		arg_475_1.duration_ = 2.2

		local var_475_0 = {
			ja = 2.133,
			ko = 1.333,
			zh = 2.2,
			en = 1.4
		}
		local var_475_1 = manager.audio:GetLocalizationFlag()

		if var_475_0[var_475_1] ~= nil then
			arg_475_1.duration_ = var_475_0[var_475_1]
		end

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play115301119(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = arg_475_1.actors_["1038"].transform
			local var_478_1 = 0

			if var_478_1 < arg_475_1.time_ and arg_475_1.time_ <= var_478_1 + arg_478_0 then
				arg_475_1.var_.moveOldPos1038 = var_478_0.localPosition
				var_478_0.localScale = Vector3.New(1, 1, 1)

				arg_475_1:CheckSpriteTmpPos("1038", 2)

				local var_478_2 = var_478_0.childCount

				for iter_478_0 = 0, var_478_2 - 1 do
					local var_478_3 = var_478_0:GetChild(iter_478_0)

					if var_478_3.name == "split_1" or not string.find(var_478_3.name, "split") then
						var_478_3.gameObject:SetActive(true)
					else
						var_478_3.gameObject:SetActive(false)
					end
				end
			end

			local var_478_4 = 0.001

			if var_478_1 <= arg_475_1.time_ and arg_475_1.time_ < var_478_1 + var_478_4 then
				local var_478_5 = (arg_475_1.time_ - var_478_1) / var_478_4
				local var_478_6 = Vector3.New(-390, -400, 0)

				var_478_0.localPosition = Vector3.Lerp(arg_475_1.var_.moveOldPos1038, var_478_6, var_478_5)
			end

			if arg_475_1.time_ >= var_478_1 + var_478_4 and arg_475_1.time_ < var_478_1 + var_478_4 + arg_478_0 then
				var_478_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_478_7 = arg_475_1.actors_["10030"]
			local var_478_8 = 0

			if var_478_8 < arg_475_1.time_ and arg_475_1.time_ <= var_478_8 + arg_478_0 and arg_475_1.var_.actorSpriteComps10030 == nil then
				arg_475_1.var_.actorSpriteComps10030 = var_478_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_478_9 = 0.2

			if var_478_8 <= arg_475_1.time_ and arg_475_1.time_ < var_478_8 + var_478_9 then
				local var_478_10 = (arg_475_1.time_ - var_478_8) / var_478_9

				if arg_475_1.var_.actorSpriteComps10030 then
					for iter_478_1, iter_478_2 in pairs(arg_475_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_478_2 then
							local var_478_11 = Mathf.Lerp(iter_478_2.color.r, 0.5, var_478_10)

							iter_478_2.color = Color.New(var_478_11, var_478_11, var_478_11)
						end
					end
				end
			end

			if arg_475_1.time_ >= var_478_8 + var_478_9 and arg_475_1.time_ < var_478_8 + var_478_9 + arg_478_0 and arg_475_1.var_.actorSpriteComps10030 then
				local var_478_12 = 0.5

				for iter_478_3, iter_478_4 in pairs(arg_475_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_478_4 then
						iter_478_4.color = Color.New(var_478_12, var_478_12, var_478_12)
					end
				end

				arg_475_1.var_.actorSpriteComps10030 = nil
			end

			local var_478_13 = arg_475_1.actors_["1038"]
			local var_478_14 = 0

			if var_478_14 < arg_475_1.time_ and arg_475_1.time_ <= var_478_14 + arg_478_0 then
				local var_478_15 = var_478_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_478_15 then
					arg_475_1.var_.alphaOldValue1038 = var_478_15.alpha
					arg_475_1.var_.characterEffect1038 = var_478_15
				end

				arg_475_1.var_.alphaOldValue1038 = 0
			end

			local var_478_16 = 0.333333333333333

			if var_478_14 <= arg_475_1.time_ and arg_475_1.time_ < var_478_14 + var_478_16 then
				local var_478_17 = (arg_475_1.time_ - var_478_14) / var_478_16
				local var_478_18 = Mathf.Lerp(arg_475_1.var_.alphaOldValue1038, 1, var_478_17)

				if arg_475_1.var_.characterEffect1038 then
					arg_475_1.var_.characterEffect1038.alpha = var_478_18
				end
			end

			if arg_475_1.time_ >= var_478_14 + var_478_16 and arg_475_1.time_ < var_478_14 + var_478_16 + arg_478_0 and arg_475_1.var_.characterEffect1038 then
				arg_475_1.var_.characterEffect1038.alpha = 1
			end

			local var_478_19 = arg_475_1.actors_["1038"]
			local var_478_20 = 0

			if var_478_20 < arg_475_1.time_ and arg_475_1.time_ <= var_478_20 + arg_478_0 and arg_475_1.var_.actorSpriteComps1038 == nil then
				arg_475_1.var_.actorSpriteComps1038 = var_478_19:GetComponentsInChildren(typeof(Image), true)
			end

			local var_478_21 = 0.2

			if var_478_20 <= arg_475_1.time_ and arg_475_1.time_ < var_478_20 + var_478_21 then
				local var_478_22 = (arg_475_1.time_ - var_478_20) / var_478_21

				if arg_475_1.var_.actorSpriteComps1038 then
					for iter_478_5, iter_478_6 in pairs(arg_475_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_478_6 then
							local var_478_23 = Mathf.Lerp(iter_478_6.color.r, 1, var_478_22)

							iter_478_6.color = Color.New(var_478_23, var_478_23, var_478_23)
						end
					end
				end
			end

			if arg_475_1.time_ >= var_478_20 + var_478_21 and arg_475_1.time_ < var_478_20 + var_478_21 + arg_478_0 and arg_475_1.var_.actorSpriteComps1038 then
				local var_478_24 = 1

				for iter_478_7, iter_478_8 in pairs(arg_475_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_478_8 then
						iter_478_8.color = Color.New(var_478_24, var_478_24, var_478_24)
					end
				end

				arg_475_1.var_.actorSpriteComps1038 = nil
			end

			local var_478_25 = 0
			local var_478_26 = 0.075

			if var_478_25 < arg_475_1.time_ and arg_475_1.time_ <= var_478_25 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, true)

				local var_478_27 = arg_475_1:FormatText(StoryNameCfg[94].name)

				arg_475_1.leftNameTxt_.text = var_478_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_475_1.leftNameTxt_.transform)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1.leftNameTxt_.text)
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_28 = arg_475_1:GetWordFromCfg(115301118)
				local var_478_29 = arg_475_1:FormatText(var_478_28.content)

				arg_475_1.text_.text = var_478_29

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_30 = 3
				local var_478_31 = utf8.len(var_478_29)
				local var_478_32 = var_478_30 <= 0 and var_478_26 or var_478_26 * (var_478_31 / var_478_30)

				if var_478_32 > 0 and var_478_26 < var_478_32 then
					arg_475_1.talkMaxDuration = var_478_32

					if var_478_32 + var_478_25 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_32 + var_478_25
					end
				end

				arg_475_1.text_.text = var_478_29
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301118", "story_v_out_115301.awb") ~= 0 then
					local var_478_33 = manager.audio:GetVoiceLength("story_v_out_115301", "115301118", "story_v_out_115301.awb") / 1000

					if var_478_33 + var_478_25 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_33 + var_478_25
					end

					if var_478_28.prefab_name ~= "" and arg_475_1.actors_[var_478_28.prefab_name] ~= nil then
						local var_478_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_475_1.actors_[var_478_28.prefab_name].transform, "story_v_out_115301", "115301118", "story_v_out_115301.awb")

						arg_475_1:RecordAudio("115301118", var_478_34)
						arg_475_1:RecordAudio("115301118", var_478_34)
					else
						arg_475_1:AudioAction("play", "voice", "story_v_out_115301", "115301118", "story_v_out_115301.awb")
					end

					arg_475_1:RecordHistoryTalkVoice("story_v_out_115301", "115301118", "story_v_out_115301.awb")
				end

				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_35 = math.max(var_478_26, arg_475_1.talkMaxDuration)

			if var_478_25 <= arg_475_1.time_ and arg_475_1.time_ < var_478_25 + var_478_35 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_25) / var_478_35

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_25 + var_478_35 and arg_475_1.time_ < var_478_25 + var_478_35 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play115301119 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 115301119
		arg_479_1.duration_ = 4

		local var_479_0 = {
			ja = 2.866,
			ko = 3.866,
			zh = 2.933,
			en = 4
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
				arg_479_0:Play115301120(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = arg_479_1.actors_["10030"]
			local var_482_1 = 0

			if var_482_1 < arg_479_1.time_ and arg_479_1.time_ <= var_482_1 + arg_482_0 and arg_479_1.var_.actorSpriteComps10030 == nil then
				arg_479_1.var_.actorSpriteComps10030 = var_482_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_482_2 = 0.2

			if var_482_1 <= arg_479_1.time_ and arg_479_1.time_ < var_482_1 + var_482_2 then
				local var_482_3 = (arg_479_1.time_ - var_482_1) / var_482_2

				if arg_479_1.var_.actorSpriteComps10030 then
					for iter_482_0, iter_482_1 in pairs(arg_479_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_482_1 then
							local var_482_4 = Mathf.Lerp(iter_482_1.color.r, 1, var_482_3)

							iter_482_1.color = Color.New(var_482_4, var_482_4, var_482_4)
						end
					end
				end
			end

			if arg_479_1.time_ >= var_482_1 + var_482_2 and arg_479_1.time_ < var_482_1 + var_482_2 + arg_482_0 and arg_479_1.var_.actorSpriteComps10030 then
				local var_482_5 = 1

				for iter_482_2, iter_482_3 in pairs(arg_479_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_482_3 then
						iter_482_3.color = Color.New(var_482_5, var_482_5, var_482_5)
					end
				end

				arg_479_1.var_.actorSpriteComps10030 = nil
			end

			local var_482_6 = arg_479_1.actors_["1038"]
			local var_482_7 = 0

			if var_482_7 < arg_479_1.time_ and arg_479_1.time_ <= var_482_7 + arg_482_0 and arg_479_1.var_.actorSpriteComps1038 == nil then
				arg_479_1.var_.actorSpriteComps1038 = var_482_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_482_8 = 0.2

			if var_482_7 <= arg_479_1.time_ and arg_479_1.time_ < var_482_7 + var_482_8 then
				local var_482_9 = (arg_479_1.time_ - var_482_7) / var_482_8

				if arg_479_1.var_.actorSpriteComps1038 then
					for iter_482_4, iter_482_5 in pairs(arg_479_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_482_5 then
							local var_482_10 = Mathf.Lerp(iter_482_5.color.r, 0.5, var_482_9)

							iter_482_5.color = Color.New(var_482_10, var_482_10, var_482_10)
						end
					end
				end
			end

			if arg_479_1.time_ >= var_482_7 + var_482_8 and arg_479_1.time_ < var_482_7 + var_482_8 + arg_482_0 and arg_479_1.var_.actorSpriteComps1038 then
				local var_482_11 = 0.5

				for iter_482_6, iter_482_7 in pairs(arg_479_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_482_7 then
						iter_482_7.color = Color.New(var_482_11, var_482_11, var_482_11)
					end
				end

				arg_479_1.var_.actorSpriteComps1038 = nil
			end

			local var_482_12 = 0
			local var_482_13 = 0.25

			if var_482_12 < arg_479_1.time_ and arg_479_1.time_ <= var_482_12 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, true)

				local var_482_14 = arg_479_1:FormatText(StoryNameCfg[309].name)

				arg_479_1.leftNameTxt_.text = var_482_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_479_1.leftNameTxt_.transform)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1.leftNameTxt_.text)
				SetActive(arg_479_1.iconTrs_.gameObject, false)
				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_15 = arg_479_1:GetWordFromCfg(115301119)
				local var_482_16 = arg_479_1:FormatText(var_482_15.content)

				arg_479_1.text_.text = var_482_16

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_17 = 10
				local var_482_18 = utf8.len(var_482_16)
				local var_482_19 = var_482_17 <= 0 and var_482_13 or var_482_13 * (var_482_18 / var_482_17)

				if var_482_19 > 0 and var_482_13 < var_482_19 then
					arg_479_1.talkMaxDuration = var_482_19

					if var_482_19 + var_482_12 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_19 + var_482_12
					end
				end

				arg_479_1.text_.text = var_482_16
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301119", "story_v_out_115301.awb") ~= 0 then
					local var_482_20 = manager.audio:GetVoiceLength("story_v_out_115301", "115301119", "story_v_out_115301.awb") / 1000

					if var_482_20 + var_482_12 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_20 + var_482_12
					end

					if var_482_15.prefab_name ~= "" and arg_479_1.actors_[var_482_15.prefab_name] ~= nil then
						local var_482_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_479_1.actors_[var_482_15.prefab_name].transform, "story_v_out_115301", "115301119", "story_v_out_115301.awb")

						arg_479_1:RecordAudio("115301119", var_482_21)
						arg_479_1:RecordAudio("115301119", var_482_21)
					else
						arg_479_1:AudioAction("play", "voice", "story_v_out_115301", "115301119", "story_v_out_115301.awb")
					end

					arg_479_1:RecordHistoryTalkVoice("story_v_out_115301", "115301119", "story_v_out_115301.awb")
				end

				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_22 = math.max(var_482_13, arg_479_1.talkMaxDuration)

			if var_482_12 <= arg_479_1.time_ and arg_479_1.time_ < var_482_12 + var_482_22 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_12) / var_482_22

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_12 + var_482_22 and arg_479_1.time_ < var_482_12 + var_482_22 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play115301120 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 115301120
		arg_483_1.duration_ = 5

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play115301121(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = arg_483_1.actors_["10030"]
			local var_486_1 = 0

			if var_486_1 < arg_483_1.time_ and arg_483_1.time_ <= var_486_1 + arg_486_0 and arg_483_1.var_.actorSpriteComps10030 == nil then
				arg_483_1.var_.actorSpriteComps10030 = var_486_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_486_2 = 0.2

			if var_486_1 <= arg_483_1.time_ and arg_483_1.time_ < var_486_1 + var_486_2 then
				local var_486_3 = (arg_483_1.time_ - var_486_1) / var_486_2

				if arg_483_1.var_.actorSpriteComps10030 then
					for iter_486_0, iter_486_1 in pairs(arg_483_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_486_1 then
							local var_486_4 = Mathf.Lerp(iter_486_1.color.r, 0.5, var_486_3)

							iter_486_1.color = Color.New(var_486_4, var_486_4, var_486_4)
						end
					end
				end
			end

			if arg_483_1.time_ >= var_486_1 + var_486_2 and arg_483_1.time_ < var_486_1 + var_486_2 + arg_486_0 and arg_483_1.var_.actorSpriteComps10030 then
				local var_486_5 = 0.5

				for iter_486_2, iter_486_3 in pairs(arg_483_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_486_3 then
						iter_486_3.color = Color.New(var_486_5, var_486_5, var_486_5)
					end
				end

				arg_483_1.var_.actorSpriteComps10030 = nil
			end

			local var_486_6 = arg_483_1.actors_["1038"]
			local var_486_7 = 0

			if var_486_7 < arg_483_1.time_ and arg_483_1.time_ <= var_486_7 + arg_486_0 and arg_483_1.var_.actorSpriteComps1038 == nil then
				arg_483_1.var_.actorSpriteComps1038 = var_486_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_486_8 = 0.2

			if var_486_7 <= arg_483_1.time_ and arg_483_1.time_ < var_486_7 + var_486_8 then
				local var_486_9 = (arg_483_1.time_ - var_486_7) / var_486_8

				if arg_483_1.var_.actorSpriteComps1038 then
					for iter_486_4, iter_486_5 in pairs(arg_483_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_486_5 then
							local var_486_10 = Mathf.Lerp(iter_486_5.color.r, 0.5, var_486_9)

							iter_486_5.color = Color.New(var_486_10, var_486_10, var_486_10)
						end
					end
				end
			end

			if arg_483_1.time_ >= var_486_7 + var_486_8 and arg_483_1.time_ < var_486_7 + var_486_8 + arg_486_0 and arg_483_1.var_.actorSpriteComps1038 then
				local var_486_11 = 0.5

				for iter_486_6, iter_486_7 in pairs(arg_483_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_486_7 then
						iter_486_7.color = Color.New(var_486_11, var_486_11, var_486_11)
					end
				end

				arg_483_1.var_.actorSpriteComps1038 = nil
			end

			local var_486_12 = 0
			local var_486_13 = 0.65

			if var_486_12 < arg_483_1.time_ and arg_483_1.time_ <= var_486_12 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, false)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_14 = arg_483_1:GetWordFromCfg(115301120)
				local var_486_15 = arg_483_1:FormatText(var_486_14.content)

				arg_483_1.text_.text = var_486_15

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_16 = 26
				local var_486_17 = utf8.len(var_486_15)
				local var_486_18 = var_486_16 <= 0 and var_486_13 or var_486_13 * (var_486_17 / var_486_16)

				if var_486_18 > 0 and var_486_13 < var_486_18 then
					arg_483_1.talkMaxDuration = var_486_18

					if var_486_18 + var_486_12 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_18 + var_486_12
					end
				end

				arg_483_1.text_.text = var_486_15
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)
				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_19 = math.max(var_486_13, arg_483_1.talkMaxDuration)

			if var_486_12 <= arg_483_1.time_ and arg_483_1.time_ < var_486_12 + var_486_19 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_12) / var_486_19

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_12 + var_486_19 and arg_483_1.time_ < var_486_12 + var_486_19 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play115301121 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 115301121
		arg_487_1.duration_ = 8.9

		local var_487_0 = {
			ja = 8.9,
			ko = 7.166,
			zh = 7.566,
			en = 5.766
		}
		local var_487_1 = manager.audio:GetLocalizationFlag()

		if var_487_0[var_487_1] ~= nil then
			arg_487_1.duration_ = var_487_0[var_487_1]
		end

		SetActive(arg_487_1.tipsGo_, false)

		function arg_487_1.onSingleLineFinish_()
			arg_487_1.onSingleLineUpdate_ = nil
			arg_487_1.onSingleLineFinish_ = nil
			arg_487_1.state_ = "waiting"
		end

		function arg_487_1.playNext_(arg_489_0)
			if arg_489_0 == 1 then
				arg_487_0:Play115301122(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = arg_487_1.actors_["1038"]
			local var_490_1 = 0

			if var_490_1 < arg_487_1.time_ and arg_487_1.time_ <= var_490_1 + arg_490_0 and arg_487_1.var_.actorSpriteComps1038 == nil then
				arg_487_1.var_.actorSpriteComps1038 = var_490_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_490_2 = 0.2

			if var_490_1 <= arg_487_1.time_ and arg_487_1.time_ < var_490_1 + var_490_2 then
				local var_490_3 = (arg_487_1.time_ - var_490_1) / var_490_2

				if arg_487_1.var_.actorSpriteComps1038 then
					for iter_490_0, iter_490_1 in pairs(arg_487_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_490_1 then
							local var_490_4 = Mathf.Lerp(iter_490_1.color.r, 1, var_490_3)

							iter_490_1.color = Color.New(var_490_4, var_490_4, var_490_4)
						end
					end
				end
			end

			if arg_487_1.time_ >= var_490_1 + var_490_2 and arg_487_1.time_ < var_490_1 + var_490_2 + arg_490_0 and arg_487_1.var_.actorSpriteComps1038 then
				local var_490_5 = 1

				for iter_490_2, iter_490_3 in pairs(arg_487_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_490_3 then
						iter_490_3.color = Color.New(var_490_5, var_490_5, var_490_5)
					end
				end

				arg_487_1.var_.actorSpriteComps1038 = nil
			end

			local var_490_6 = arg_487_1.actors_["1038"].transform
			local var_490_7 = 0

			if var_490_7 < arg_487_1.time_ and arg_487_1.time_ <= var_490_7 + arg_490_0 then
				arg_487_1.var_.moveOldPos1038 = var_490_6.localPosition
				var_490_6.localScale = Vector3.New(1, 1, 1)

				arg_487_1:CheckSpriteTmpPos("1038", 2)

				local var_490_8 = var_490_6.childCount

				for iter_490_4 = 0, var_490_8 - 1 do
					local var_490_9 = var_490_6:GetChild(iter_490_4)

					if var_490_9.name == "split_9" or not string.find(var_490_9.name, "split") then
						var_490_9.gameObject:SetActive(true)
					else
						var_490_9.gameObject:SetActive(false)
					end
				end
			end

			local var_490_10 = 0.001

			if var_490_7 <= arg_487_1.time_ and arg_487_1.time_ < var_490_7 + var_490_10 then
				local var_490_11 = (arg_487_1.time_ - var_490_7) / var_490_10
				local var_490_12 = Vector3.New(-390, -400, 0)

				var_490_6.localPosition = Vector3.Lerp(arg_487_1.var_.moveOldPos1038, var_490_12, var_490_11)
			end

			if arg_487_1.time_ >= var_490_7 + var_490_10 and arg_487_1.time_ < var_490_7 + var_490_10 + arg_490_0 then
				var_490_6.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_490_13 = arg_487_1.actors_["1038"]
			local var_490_14 = 0

			if var_490_14 < arg_487_1.time_ and arg_487_1.time_ <= var_490_14 + arg_490_0 then
				local var_490_15 = var_490_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_490_15 then
					arg_487_1.var_.alphaOldValue1038 = var_490_15.alpha
					arg_487_1.var_.characterEffect1038 = var_490_15
				end

				arg_487_1.var_.alphaOldValue1038 = 0
			end

			local var_490_16 = 0.0166666666666667

			if var_490_14 <= arg_487_1.time_ and arg_487_1.time_ < var_490_14 + var_490_16 then
				local var_490_17 = (arg_487_1.time_ - var_490_14) / var_490_16
				local var_490_18 = Mathf.Lerp(arg_487_1.var_.alphaOldValue1038, 1, var_490_17)

				if arg_487_1.var_.characterEffect1038 then
					arg_487_1.var_.characterEffect1038.alpha = var_490_18
				end
			end

			if arg_487_1.time_ >= var_490_14 + var_490_16 and arg_487_1.time_ < var_490_14 + var_490_16 + arg_490_0 and arg_487_1.var_.characterEffect1038 then
				arg_487_1.var_.characterEffect1038.alpha = 1
			end

			local var_490_19 = 0
			local var_490_20 = 0.7

			if var_490_19 < arg_487_1.time_ and arg_487_1.time_ <= var_490_19 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0
				arg_487_1.dialogCg_.alpha = 1

				arg_487_1.dialog_:SetActive(true)
				SetActive(arg_487_1.leftNameGo_, true)

				local var_490_21 = arg_487_1:FormatText(StoryNameCfg[94].name)

				arg_487_1.leftNameTxt_.text = var_490_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_487_1.leftNameTxt_.transform)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1.leftNameTxt_.text)
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_22 = arg_487_1:GetWordFromCfg(115301121)
				local var_490_23 = arg_487_1:FormatText(var_490_22.content)

				arg_487_1.text_.text = var_490_23

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_24 = 28
				local var_490_25 = utf8.len(var_490_23)
				local var_490_26 = var_490_24 <= 0 and var_490_20 or var_490_20 * (var_490_25 / var_490_24)

				if var_490_26 > 0 and var_490_20 < var_490_26 then
					arg_487_1.talkMaxDuration = var_490_26

					if var_490_26 + var_490_19 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_26 + var_490_19
					end
				end

				arg_487_1.text_.text = var_490_23
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301121", "story_v_out_115301.awb") ~= 0 then
					local var_490_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301121", "story_v_out_115301.awb") / 1000

					if var_490_27 + var_490_19 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_27 + var_490_19
					end

					if var_490_22.prefab_name ~= "" and arg_487_1.actors_[var_490_22.prefab_name] ~= nil then
						local var_490_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_487_1.actors_[var_490_22.prefab_name].transform, "story_v_out_115301", "115301121", "story_v_out_115301.awb")

						arg_487_1:RecordAudio("115301121", var_490_28)
						arg_487_1:RecordAudio("115301121", var_490_28)
					else
						arg_487_1:AudioAction("play", "voice", "story_v_out_115301", "115301121", "story_v_out_115301.awb")
					end

					arg_487_1:RecordHistoryTalkVoice("story_v_out_115301", "115301121", "story_v_out_115301.awb")
				end

				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_29 = math.max(var_490_20, arg_487_1.talkMaxDuration)

			if var_490_19 <= arg_487_1.time_ and arg_487_1.time_ < var_490_19 + var_490_29 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_19) / var_490_29

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_19 + var_490_29 and arg_487_1.time_ < var_490_19 + var_490_29 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play115301122 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 115301122
		arg_491_1.duration_ = 4.266

		local var_491_0 = {
			ja = 4.266,
			ko = 3.466,
			zh = 3.3,
			en = 3.433
		}
		local var_491_1 = manager.audio:GetLocalizationFlag()

		if var_491_0[var_491_1] ~= nil then
			arg_491_1.duration_ = var_491_0[var_491_1]
		end

		SetActive(arg_491_1.tipsGo_, false)

		function arg_491_1.onSingleLineFinish_()
			arg_491_1.onSingleLineUpdate_ = nil
			arg_491_1.onSingleLineFinish_ = nil
			arg_491_1.state_ = "waiting"
		end

		function arg_491_1.playNext_(arg_493_0)
			if arg_493_0 == 1 then
				arg_491_0:Play115301123(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = arg_491_1.actors_["1038"]
			local var_494_1 = 0

			if var_494_1 < arg_491_1.time_ and arg_491_1.time_ <= var_494_1 + arg_494_0 and arg_491_1.var_.actorSpriteComps1038 == nil then
				arg_491_1.var_.actorSpriteComps1038 = var_494_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_494_2 = 0.2

			if var_494_1 <= arg_491_1.time_ and arg_491_1.time_ < var_494_1 + var_494_2 then
				local var_494_3 = (arg_491_1.time_ - var_494_1) / var_494_2

				if arg_491_1.var_.actorSpriteComps1038 then
					for iter_494_0, iter_494_1 in pairs(arg_491_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_494_1 then
							local var_494_4 = Mathf.Lerp(iter_494_1.color.r, 0.5, var_494_3)

							iter_494_1.color = Color.New(var_494_4, var_494_4, var_494_4)
						end
					end
				end
			end

			if arg_491_1.time_ >= var_494_1 + var_494_2 and arg_491_1.time_ < var_494_1 + var_494_2 + arg_494_0 and arg_491_1.var_.actorSpriteComps1038 then
				local var_494_5 = 0.5

				for iter_494_2, iter_494_3 in pairs(arg_491_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_494_3 then
						iter_494_3.color = Color.New(var_494_5, var_494_5, var_494_5)
					end
				end

				arg_491_1.var_.actorSpriteComps1038 = nil
			end

			local var_494_6 = arg_491_1.actors_["10030"]
			local var_494_7 = 0

			if var_494_7 < arg_491_1.time_ and arg_491_1.time_ <= var_494_7 + arg_494_0 and arg_491_1.var_.actorSpriteComps10030 == nil then
				arg_491_1.var_.actorSpriteComps10030 = var_494_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_494_8 = 0.2

			if var_494_7 <= arg_491_1.time_ and arg_491_1.time_ < var_494_7 + var_494_8 then
				local var_494_9 = (arg_491_1.time_ - var_494_7) / var_494_8

				if arg_491_1.var_.actorSpriteComps10030 then
					for iter_494_4, iter_494_5 in pairs(arg_491_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_494_5 then
							local var_494_10 = Mathf.Lerp(iter_494_5.color.r, 1, var_494_9)

							iter_494_5.color = Color.New(var_494_10, var_494_10, var_494_10)
						end
					end
				end
			end

			if arg_491_1.time_ >= var_494_7 + var_494_8 and arg_491_1.time_ < var_494_7 + var_494_8 + arg_494_0 and arg_491_1.var_.actorSpriteComps10030 then
				local var_494_11 = 1

				for iter_494_6, iter_494_7 in pairs(arg_491_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_494_7 then
						iter_494_7.color = Color.New(var_494_11, var_494_11, var_494_11)
					end
				end

				arg_491_1.var_.actorSpriteComps10030 = nil
			end

			local var_494_12 = 0
			local var_494_13 = 0.3

			if var_494_12 < arg_491_1.time_ and arg_491_1.time_ <= var_494_12 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, true)

				local var_494_14 = arg_491_1:FormatText(StoryNameCfg[309].name)

				arg_491_1.leftNameTxt_.text = var_494_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_491_1.leftNameTxt_.transform)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1.leftNameTxt_.text)
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_15 = arg_491_1:GetWordFromCfg(115301122)
				local var_494_16 = arg_491_1:FormatText(var_494_15.content)

				arg_491_1.text_.text = var_494_16

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_17 = 12
				local var_494_18 = utf8.len(var_494_16)
				local var_494_19 = var_494_17 <= 0 and var_494_13 or var_494_13 * (var_494_18 / var_494_17)

				if var_494_19 > 0 and var_494_13 < var_494_19 then
					arg_491_1.talkMaxDuration = var_494_19

					if var_494_19 + var_494_12 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_19 + var_494_12
					end
				end

				arg_491_1.text_.text = var_494_16
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301122", "story_v_out_115301.awb") ~= 0 then
					local var_494_20 = manager.audio:GetVoiceLength("story_v_out_115301", "115301122", "story_v_out_115301.awb") / 1000

					if var_494_20 + var_494_12 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_20 + var_494_12
					end

					if var_494_15.prefab_name ~= "" and arg_491_1.actors_[var_494_15.prefab_name] ~= nil then
						local var_494_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_491_1.actors_[var_494_15.prefab_name].transform, "story_v_out_115301", "115301122", "story_v_out_115301.awb")

						arg_491_1:RecordAudio("115301122", var_494_21)
						arg_491_1:RecordAudio("115301122", var_494_21)
					else
						arg_491_1:AudioAction("play", "voice", "story_v_out_115301", "115301122", "story_v_out_115301.awb")
					end

					arg_491_1:RecordHistoryTalkVoice("story_v_out_115301", "115301122", "story_v_out_115301.awb")
				end

				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_22 = math.max(var_494_13, arg_491_1.talkMaxDuration)

			if var_494_12 <= arg_491_1.time_ and arg_491_1.time_ < var_494_12 + var_494_22 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_12) / var_494_22

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_12 + var_494_22 and arg_491_1.time_ < var_494_12 + var_494_22 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play115301123 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 115301123
		arg_495_1.duration_ = 3.733

		local var_495_0 = {
			ja = 3.733,
			ko = 3.3,
			zh = 3.466,
			en = 3.1
		}
		local var_495_1 = manager.audio:GetLocalizationFlag()

		if var_495_0[var_495_1] ~= nil then
			arg_495_1.duration_ = var_495_0[var_495_1]
		end

		SetActive(arg_495_1.tipsGo_, false)

		function arg_495_1.onSingleLineFinish_()
			arg_495_1.onSingleLineUpdate_ = nil
			arg_495_1.onSingleLineFinish_ = nil
			arg_495_1.state_ = "waiting"
		end

		function arg_495_1.playNext_(arg_497_0)
			if arg_497_0 == 1 then
				arg_495_0:Play115301124(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = 0
			local var_498_1 = 0.4

			if var_498_0 < arg_495_1.time_ and arg_495_1.time_ <= var_498_0 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0
				arg_495_1.dialogCg_.alpha = 1

				arg_495_1.dialog_:SetActive(true)
				SetActive(arg_495_1.leftNameGo_, true)

				local var_498_2 = arg_495_1:FormatText(StoryNameCfg[309].name)

				arg_495_1.leftNameTxt_.text = var_498_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_495_1.leftNameTxt_.transform)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1.leftNameTxt_.text)
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_3 = arg_495_1:GetWordFromCfg(115301123)
				local var_498_4 = arg_495_1:FormatText(var_498_3.content)

				arg_495_1.text_.text = var_498_4

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_5 = 16
				local var_498_6 = utf8.len(var_498_4)
				local var_498_7 = var_498_5 <= 0 and var_498_1 or var_498_1 * (var_498_6 / var_498_5)

				if var_498_7 > 0 and var_498_1 < var_498_7 then
					arg_495_1.talkMaxDuration = var_498_7

					if var_498_7 + var_498_0 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_7 + var_498_0
					end
				end

				arg_495_1.text_.text = var_498_4
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301123", "story_v_out_115301.awb") ~= 0 then
					local var_498_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301123", "story_v_out_115301.awb") / 1000

					if var_498_8 + var_498_0 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_8 + var_498_0
					end

					if var_498_3.prefab_name ~= "" and arg_495_1.actors_[var_498_3.prefab_name] ~= nil then
						local var_498_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_495_1.actors_[var_498_3.prefab_name].transform, "story_v_out_115301", "115301123", "story_v_out_115301.awb")

						arg_495_1:RecordAudio("115301123", var_498_9)
						arg_495_1:RecordAudio("115301123", var_498_9)
					else
						arg_495_1:AudioAction("play", "voice", "story_v_out_115301", "115301123", "story_v_out_115301.awb")
					end

					arg_495_1:RecordHistoryTalkVoice("story_v_out_115301", "115301123", "story_v_out_115301.awb")
				end

				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_10 = math.max(var_498_1, arg_495_1.talkMaxDuration)

			if var_498_0 <= arg_495_1.time_ and arg_495_1.time_ < var_498_0 + var_498_10 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_0) / var_498_10

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_0 + var_498_10 and arg_495_1.time_ < var_498_0 + var_498_10 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play115301124 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 115301124
		arg_499_1.duration_ = 5

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
		end

		function arg_499_1.playNext_(arg_501_0)
			if arg_501_0 == 1 then
				arg_499_0:Play115301125(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = arg_499_1.actors_["10030"]
			local var_502_1 = 0

			if var_502_1 < arg_499_1.time_ and arg_499_1.time_ <= var_502_1 + arg_502_0 then
				local var_502_2 = var_502_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_502_2 then
					arg_499_1.var_.alphaOldValue10030 = var_502_2.alpha
					arg_499_1.var_.characterEffect10030 = var_502_2
				end

				arg_499_1.var_.alphaOldValue10030 = 1
			end

			local var_502_3 = 0.333333333333333

			if var_502_1 <= arg_499_1.time_ and arg_499_1.time_ < var_502_1 + var_502_3 then
				local var_502_4 = (arg_499_1.time_ - var_502_1) / var_502_3
				local var_502_5 = Mathf.Lerp(arg_499_1.var_.alphaOldValue10030, 0, var_502_4)

				if arg_499_1.var_.characterEffect10030 then
					arg_499_1.var_.characterEffect10030.alpha = var_502_5
				end
			end

			if arg_499_1.time_ >= var_502_1 + var_502_3 and arg_499_1.time_ < var_502_1 + var_502_3 + arg_502_0 and arg_499_1.var_.characterEffect10030 then
				arg_499_1.var_.characterEffect10030.alpha = 0
			end

			local var_502_6 = arg_499_1.actors_["1038"]
			local var_502_7 = 0

			if var_502_7 < arg_499_1.time_ and arg_499_1.time_ <= var_502_7 + arg_502_0 then
				local var_502_8 = var_502_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_502_8 then
					arg_499_1.var_.alphaOldValue1038 = var_502_8.alpha
					arg_499_1.var_.characterEffect1038 = var_502_8
				end

				arg_499_1.var_.alphaOldValue1038 = 1
			end

			local var_502_9 = 0.333333333333333

			if var_502_7 <= arg_499_1.time_ and arg_499_1.time_ < var_502_7 + var_502_9 then
				local var_502_10 = (arg_499_1.time_ - var_502_7) / var_502_9
				local var_502_11 = Mathf.Lerp(arg_499_1.var_.alphaOldValue1038, 0, var_502_10)

				if arg_499_1.var_.characterEffect1038 then
					arg_499_1.var_.characterEffect1038.alpha = var_502_11
				end
			end

			if arg_499_1.time_ >= var_502_7 + var_502_9 and arg_499_1.time_ < var_502_7 + var_502_9 + arg_502_0 and arg_499_1.var_.characterEffect1038 then
				arg_499_1.var_.characterEffect1038.alpha = 0
			end

			local var_502_12 = 0
			local var_502_13 = 0.45

			if var_502_12 < arg_499_1.time_ and arg_499_1.time_ <= var_502_12 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, false)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_14 = arg_499_1:GetWordFromCfg(115301124)
				local var_502_15 = arg_499_1:FormatText(var_502_14.content)

				arg_499_1.text_.text = var_502_15

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_16 = 18
				local var_502_17 = utf8.len(var_502_15)
				local var_502_18 = var_502_16 <= 0 and var_502_13 or var_502_13 * (var_502_17 / var_502_16)

				if var_502_18 > 0 and var_502_13 < var_502_18 then
					arg_499_1.talkMaxDuration = var_502_18

					if var_502_18 + var_502_12 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_18 + var_502_12
					end
				end

				arg_499_1.text_.text = var_502_15
				arg_499_1.typewritter.percent = 0

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(false)
				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_19 = math.max(var_502_13, arg_499_1.talkMaxDuration)

			if var_502_12 <= arg_499_1.time_ and arg_499_1.time_ < var_502_12 + var_502_19 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_12) / var_502_19

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_12 + var_502_19 and arg_499_1.time_ < var_502_12 + var_502_19 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	Play115301125 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 115301125
		arg_503_1.duration_ = 4.466

		local var_503_0 = {
			ja = 2.7,
			ko = 3.733,
			zh = 4.466,
			en = 4.2
		}
		local var_503_1 = manager.audio:GetLocalizationFlag()

		if var_503_0[var_503_1] ~= nil then
			arg_503_1.duration_ = var_503_0[var_503_1]
		end

		SetActive(arg_503_1.tipsGo_, false)

		function arg_503_1.onSingleLineFinish_()
			arg_503_1.onSingleLineUpdate_ = nil
			arg_503_1.onSingleLineFinish_ = nil
			arg_503_1.state_ = "waiting"
		end

		function arg_503_1.playNext_(arg_505_0)
			if arg_505_0 == 1 then
				arg_503_0:Play115301126(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = 0
			local var_506_1 = 0.35

			if var_506_0 < arg_503_1.time_ and arg_503_1.time_ <= var_506_0 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0
				arg_503_1.dialogCg_.alpha = 1

				arg_503_1.dialog_:SetActive(true)
				SetActive(arg_503_1.leftNameGo_, true)

				local var_506_2 = arg_503_1:FormatText(StoryNameCfg[94].name)

				arg_503_1.leftNameTxt_.text = var_506_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_503_1.leftNameTxt_.transform)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1.leftNameTxt_.text)
				SetActive(arg_503_1.iconTrs_.gameObject, true)
				arg_503_1.iconController_:SetSelectedState("hero")

				arg_503_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1038_split_9")

				arg_503_1.callingController_:SetSelectedState("normal")

				local var_506_3 = arg_503_1:GetWordFromCfg(115301125)
				local var_506_4 = arg_503_1:FormatText(var_506_3.content)

				arg_503_1.text_.text = var_506_4

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_5 = 14
				local var_506_6 = utf8.len(var_506_4)
				local var_506_7 = var_506_5 <= 0 and var_506_1 or var_506_1 * (var_506_6 / var_506_5)

				if var_506_7 > 0 and var_506_1 < var_506_7 then
					arg_503_1.talkMaxDuration = var_506_7

					if var_506_7 + var_506_0 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_7 + var_506_0
					end
				end

				arg_503_1.text_.text = var_506_4
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301125", "story_v_out_115301.awb") ~= 0 then
					local var_506_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301125", "story_v_out_115301.awb") / 1000

					if var_506_8 + var_506_0 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_8 + var_506_0
					end

					if var_506_3.prefab_name ~= "" and arg_503_1.actors_[var_506_3.prefab_name] ~= nil then
						local var_506_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_503_1.actors_[var_506_3.prefab_name].transform, "story_v_out_115301", "115301125", "story_v_out_115301.awb")

						arg_503_1:RecordAudio("115301125", var_506_9)
						arg_503_1:RecordAudio("115301125", var_506_9)
					else
						arg_503_1:AudioAction("play", "voice", "story_v_out_115301", "115301125", "story_v_out_115301.awb")
					end

					arg_503_1:RecordHistoryTalkVoice("story_v_out_115301", "115301125", "story_v_out_115301.awb")
				end

				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_10 = math.max(var_506_1, arg_503_1.talkMaxDuration)

			if var_506_0 <= arg_503_1.time_ and arg_503_1.time_ < var_506_0 + var_506_10 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_0) / var_506_10

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_0 + var_506_10 and arg_503_1.time_ < var_506_0 + var_506_10 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play115301126 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 115301126
		arg_507_1.duration_ = 5

		SetActive(arg_507_1.tipsGo_, false)

		function arg_507_1.onSingleLineFinish_()
			arg_507_1.onSingleLineUpdate_ = nil
			arg_507_1.onSingleLineFinish_ = nil
			arg_507_1.state_ = "waiting"
		end

		function arg_507_1.playNext_(arg_509_0)
			if arg_509_0 == 1 then
				arg_507_0:Play115301127(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = 0
			local var_510_1 = 0.575

			if var_510_0 < arg_507_1.time_ and arg_507_1.time_ <= var_510_0 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, false)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_2 = arg_507_1:GetWordFromCfg(115301126)
				local var_510_3 = arg_507_1:FormatText(var_510_2.content)

				arg_507_1.text_.text = var_510_3

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_4 = 23
				local var_510_5 = utf8.len(var_510_3)
				local var_510_6 = var_510_4 <= 0 and var_510_1 or var_510_1 * (var_510_5 / var_510_4)

				if var_510_6 > 0 and var_510_1 < var_510_6 then
					arg_507_1.talkMaxDuration = var_510_6

					if var_510_6 + var_510_0 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_6 + var_510_0
					end
				end

				arg_507_1.text_.text = var_510_3
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)
				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_7 = math.max(var_510_1, arg_507_1.talkMaxDuration)

			if var_510_0 <= arg_507_1.time_ and arg_507_1.time_ < var_510_0 + var_510_7 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_0) / var_510_7

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_0 + var_510_7 and arg_507_1.time_ < var_510_0 + var_510_7 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play115301127 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 115301127
		arg_511_1.duration_ = 4.566

		local var_511_0 = {
			ja = 2.433,
			ko = 2.833,
			zh = 4.566,
			en = 2.533
		}
		local var_511_1 = manager.audio:GetLocalizationFlag()

		if var_511_0[var_511_1] ~= nil then
			arg_511_1.duration_ = var_511_0[var_511_1]
		end

		SetActive(arg_511_1.tipsGo_, false)

		function arg_511_1.onSingleLineFinish_()
			arg_511_1.onSingleLineUpdate_ = nil
			arg_511_1.onSingleLineFinish_ = nil
			arg_511_1.state_ = "waiting"
		end

		function arg_511_1.playNext_(arg_513_0)
			if arg_513_0 == 1 then
				arg_511_0:Play115301128(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = arg_511_1.actors_["1038"].transform
			local var_514_1 = 0

			if var_514_1 < arg_511_1.time_ and arg_511_1.time_ <= var_514_1 + arg_514_0 then
				arg_511_1.var_.moveOldPos1038 = var_514_0.localPosition
				var_514_0.localScale = Vector3.New(1, 1, 1)

				arg_511_1:CheckSpriteTmpPos("1038", 2)

				local var_514_2 = var_514_0.childCount

				for iter_514_0 = 0, var_514_2 - 1 do
					local var_514_3 = var_514_0:GetChild(iter_514_0)

					if var_514_3.name == "split_1" or not string.find(var_514_3.name, "split") then
						var_514_3.gameObject:SetActive(true)
					else
						var_514_3.gameObject:SetActive(false)
					end
				end
			end

			local var_514_4 = 0.001

			if var_514_1 <= arg_511_1.time_ and arg_511_1.time_ < var_514_1 + var_514_4 then
				local var_514_5 = (arg_511_1.time_ - var_514_1) / var_514_4
				local var_514_6 = Vector3.New(-390, -400, 0)

				var_514_0.localPosition = Vector3.Lerp(arg_511_1.var_.moveOldPos1038, var_514_6, var_514_5)
			end

			if arg_511_1.time_ >= var_514_1 + var_514_4 and arg_511_1.time_ < var_514_1 + var_514_4 + arg_514_0 then
				var_514_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_514_7 = arg_511_1.actors_["1038"]
			local var_514_8 = 0

			if var_514_8 < arg_511_1.time_ and arg_511_1.time_ <= var_514_8 + arg_514_0 and arg_511_1.var_.actorSpriteComps1038 == nil then
				arg_511_1.var_.actorSpriteComps1038 = var_514_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_514_9 = 0.2

			if var_514_8 <= arg_511_1.time_ and arg_511_1.time_ < var_514_8 + var_514_9 then
				local var_514_10 = (arg_511_1.time_ - var_514_8) / var_514_9

				if arg_511_1.var_.actorSpriteComps1038 then
					for iter_514_1, iter_514_2 in pairs(arg_511_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_514_2 then
							local var_514_11 = Mathf.Lerp(iter_514_2.color.r, 1, var_514_10)

							iter_514_2.color = Color.New(var_514_11, var_514_11, var_514_11)
						end
					end
				end
			end

			if arg_511_1.time_ >= var_514_8 + var_514_9 and arg_511_1.time_ < var_514_8 + var_514_9 + arg_514_0 and arg_511_1.var_.actorSpriteComps1038 then
				local var_514_12 = 1

				for iter_514_3, iter_514_4 in pairs(arg_511_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_514_4 then
						iter_514_4.color = Color.New(var_514_12, var_514_12, var_514_12)
					end
				end

				arg_511_1.var_.actorSpriteComps1038 = nil
			end

			local var_514_13 = arg_511_1.actors_["1038"]
			local var_514_14 = 0

			if var_514_14 < arg_511_1.time_ and arg_511_1.time_ <= var_514_14 + arg_514_0 then
				local var_514_15 = var_514_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_514_15 then
					arg_511_1.var_.alphaOldValue1038 = var_514_15.alpha
					arg_511_1.var_.characterEffect1038 = var_514_15
				end

				arg_511_1.var_.alphaOldValue1038 = 0
			end

			local var_514_16 = 0.333333333333333

			if var_514_14 <= arg_511_1.time_ and arg_511_1.time_ < var_514_14 + var_514_16 then
				local var_514_17 = (arg_511_1.time_ - var_514_14) / var_514_16
				local var_514_18 = Mathf.Lerp(arg_511_1.var_.alphaOldValue1038, 1, var_514_17)

				if arg_511_1.var_.characterEffect1038 then
					arg_511_1.var_.characterEffect1038.alpha = var_514_18
				end
			end

			if arg_511_1.time_ >= var_514_14 + var_514_16 and arg_511_1.time_ < var_514_14 + var_514_16 + arg_514_0 and arg_511_1.var_.characterEffect1038 then
				arg_511_1.var_.characterEffect1038.alpha = 1
			end

			local var_514_19 = 0
			local var_514_20 = 0.4

			if var_514_19 < arg_511_1.time_ and arg_511_1.time_ <= var_514_19 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, true)

				local var_514_21 = arg_511_1:FormatText(StoryNameCfg[94].name)

				arg_511_1.leftNameTxt_.text = var_514_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_511_1.leftNameTxt_.transform)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1.leftNameTxt_.text)
				SetActive(arg_511_1.iconTrs_.gameObject, false)
				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_22 = arg_511_1:GetWordFromCfg(115301127)
				local var_514_23 = arg_511_1:FormatText(var_514_22.content)

				arg_511_1.text_.text = var_514_23

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_24 = 16
				local var_514_25 = utf8.len(var_514_23)
				local var_514_26 = var_514_24 <= 0 and var_514_20 or var_514_20 * (var_514_25 / var_514_24)

				if var_514_26 > 0 and var_514_20 < var_514_26 then
					arg_511_1.talkMaxDuration = var_514_26

					if var_514_26 + var_514_19 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_26 + var_514_19
					end
				end

				arg_511_1.text_.text = var_514_23
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301127", "story_v_out_115301.awb") ~= 0 then
					local var_514_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301127", "story_v_out_115301.awb") / 1000

					if var_514_27 + var_514_19 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_27 + var_514_19
					end

					if var_514_22.prefab_name ~= "" and arg_511_1.actors_[var_514_22.prefab_name] ~= nil then
						local var_514_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_511_1.actors_[var_514_22.prefab_name].transform, "story_v_out_115301", "115301127", "story_v_out_115301.awb")

						arg_511_1:RecordAudio("115301127", var_514_28)
						arg_511_1:RecordAudio("115301127", var_514_28)
					else
						arg_511_1:AudioAction("play", "voice", "story_v_out_115301", "115301127", "story_v_out_115301.awb")
					end

					arg_511_1:RecordHistoryTalkVoice("story_v_out_115301", "115301127", "story_v_out_115301.awb")
				end

				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_29 = math.max(var_514_20, arg_511_1.talkMaxDuration)

			if var_514_19 <= arg_511_1.time_ and arg_511_1.time_ < var_514_19 + var_514_29 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_19) / var_514_29

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_19 + var_514_29 and arg_511_1.time_ < var_514_19 + var_514_29 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play115301128 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 115301128
		arg_515_1.duration_ = 7.233

		local var_515_0 = {
			ja = 5.3,
			ko = 6.7,
			zh = 5.433,
			en = 7.233
		}
		local var_515_1 = manager.audio:GetLocalizationFlag()

		if var_515_0[var_515_1] ~= nil then
			arg_515_1.duration_ = var_515_0[var_515_1]
		end

		SetActive(arg_515_1.tipsGo_, false)

		function arg_515_1.onSingleLineFinish_()
			arg_515_1.onSingleLineUpdate_ = nil
			arg_515_1.onSingleLineFinish_ = nil
			arg_515_1.state_ = "waiting"
		end

		function arg_515_1.playNext_(arg_517_0)
			if arg_517_0 == 1 then
				arg_515_0:Play115301129(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = arg_515_1.actors_["10030"].transform
			local var_518_1 = 0

			if var_518_1 < arg_515_1.time_ and arg_515_1.time_ <= var_518_1 + arg_518_0 then
				arg_515_1.var_.moveOldPos10030 = var_518_0.localPosition
				var_518_0.localScale = Vector3.New(1, 1, 1)

				arg_515_1:CheckSpriteTmpPos("10030", 4)

				local var_518_2 = var_518_0.childCount

				for iter_518_0 = 0, var_518_2 - 1 do
					local var_518_3 = var_518_0:GetChild(iter_518_0)

					if var_518_3.name == "split_1" or not string.find(var_518_3.name, "split") then
						var_518_3.gameObject:SetActive(true)
					else
						var_518_3.gameObject:SetActive(false)
					end
				end
			end

			local var_518_4 = 0.001

			if var_518_1 <= arg_515_1.time_ and arg_515_1.time_ < var_518_1 + var_518_4 then
				local var_518_5 = (arg_515_1.time_ - var_518_1) / var_518_4
				local var_518_6 = Vector3.New(390, -390, 150)

				var_518_0.localPosition = Vector3.Lerp(arg_515_1.var_.moveOldPos10030, var_518_6, var_518_5)
			end

			if arg_515_1.time_ >= var_518_1 + var_518_4 and arg_515_1.time_ < var_518_1 + var_518_4 + arg_518_0 then
				var_518_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_518_7 = arg_515_1.actors_["1038"]
			local var_518_8 = 0

			if var_518_8 < arg_515_1.time_ and arg_515_1.time_ <= var_518_8 + arg_518_0 and arg_515_1.var_.actorSpriteComps1038 == nil then
				arg_515_1.var_.actorSpriteComps1038 = var_518_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_518_9 = 0.2

			if var_518_8 <= arg_515_1.time_ and arg_515_1.time_ < var_518_8 + var_518_9 then
				local var_518_10 = (arg_515_1.time_ - var_518_8) / var_518_9

				if arg_515_1.var_.actorSpriteComps1038 then
					for iter_518_1, iter_518_2 in pairs(arg_515_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_518_2 then
							local var_518_11 = Mathf.Lerp(iter_518_2.color.r, 0.5, var_518_10)

							iter_518_2.color = Color.New(var_518_11, var_518_11, var_518_11)
						end
					end
				end
			end

			if arg_515_1.time_ >= var_518_8 + var_518_9 and arg_515_1.time_ < var_518_8 + var_518_9 + arg_518_0 and arg_515_1.var_.actorSpriteComps1038 then
				local var_518_12 = 0.5

				for iter_518_3, iter_518_4 in pairs(arg_515_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_518_4 then
						iter_518_4.color = Color.New(var_518_12, var_518_12, var_518_12)
					end
				end

				arg_515_1.var_.actorSpriteComps1038 = nil
			end

			local var_518_13 = arg_515_1.actors_["10030"]
			local var_518_14 = 0

			if var_518_14 < arg_515_1.time_ and arg_515_1.time_ <= var_518_14 + arg_518_0 and arg_515_1.var_.actorSpriteComps10030 == nil then
				arg_515_1.var_.actorSpriteComps10030 = var_518_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_518_15 = 0.2

			if var_518_14 <= arg_515_1.time_ and arg_515_1.time_ < var_518_14 + var_518_15 then
				local var_518_16 = (arg_515_1.time_ - var_518_14) / var_518_15

				if arg_515_1.var_.actorSpriteComps10030 then
					for iter_518_5, iter_518_6 in pairs(arg_515_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_518_6 then
							local var_518_17 = Mathf.Lerp(iter_518_6.color.r, 1, var_518_16)

							iter_518_6.color = Color.New(var_518_17, var_518_17, var_518_17)
						end
					end
				end
			end

			if arg_515_1.time_ >= var_518_14 + var_518_15 and arg_515_1.time_ < var_518_14 + var_518_15 + arg_518_0 and arg_515_1.var_.actorSpriteComps10030 then
				local var_518_18 = 1

				for iter_518_7, iter_518_8 in pairs(arg_515_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_518_8 then
						iter_518_8.color = Color.New(var_518_18, var_518_18, var_518_18)
					end
				end

				arg_515_1.var_.actorSpriteComps10030 = nil
			end

			local var_518_19 = arg_515_1.actors_["10030"]
			local var_518_20 = 0

			if var_518_20 < arg_515_1.time_ and arg_515_1.time_ <= var_518_20 + arg_518_0 then
				local var_518_21 = var_518_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_518_21 then
					arg_515_1.var_.alphaOldValue10030 = var_518_21.alpha
					arg_515_1.var_.characterEffect10030 = var_518_21
				end

				arg_515_1.var_.alphaOldValue10030 = 0
			end

			local var_518_22 = 0.333333333333333

			if var_518_20 <= arg_515_1.time_ and arg_515_1.time_ < var_518_20 + var_518_22 then
				local var_518_23 = (arg_515_1.time_ - var_518_20) / var_518_22
				local var_518_24 = Mathf.Lerp(arg_515_1.var_.alphaOldValue10030, 1, var_518_23)

				if arg_515_1.var_.characterEffect10030 then
					arg_515_1.var_.characterEffect10030.alpha = var_518_24
				end
			end

			if arg_515_1.time_ >= var_518_20 + var_518_22 and arg_515_1.time_ < var_518_20 + var_518_22 + arg_518_0 and arg_515_1.var_.characterEffect10030 then
				arg_515_1.var_.characterEffect10030.alpha = 1
			end

			local var_518_25 = 0
			local var_518_26 = 0.525

			if var_518_25 < arg_515_1.time_ and arg_515_1.time_ <= var_518_25 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0
				arg_515_1.dialogCg_.alpha = 1

				arg_515_1.dialog_:SetActive(true)
				SetActive(arg_515_1.leftNameGo_, true)

				local var_518_27 = arg_515_1:FormatText(StoryNameCfg[309].name)

				arg_515_1.leftNameTxt_.text = var_518_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_515_1.leftNameTxt_.transform)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1.leftNameTxt_.text)
				SetActive(arg_515_1.iconTrs_.gameObject, false)
				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_28 = arg_515_1:GetWordFromCfg(115301128)
				local var_518_29 = arg_515_1:FormatText(var_518_28.content)

				arg_515_1.text_.text = var_518_29

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_30 = 21
				local var_518_31 = utf8.len(var_518_29)
				local var_518_32 = var_518_30 <= 0 and var_518_26 or var_518_26 * (var_518_31 / var_518_30)

				if var_518_32 > 0 and var_518_26 < var_518_32 then
					arg_515_1.talkMaxDuration = var_518_32

					if var_518_32 + var_518_25 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_32 + var_518_25
					end
				end

				arg_515_1.text_.text = var_518_29
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301128", "story_v_out_115301.awb") ~= 0 then
					local var_518_33 = manager.audio:GetVoiceLength("story_v_out_115301", "115301128", "story_v_out_115301.awb") / 1000

					if var_518_33 + var_518_25 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_33 + var_518_25
					end

					if var_518_28.prefab_name ~= "" and arg_515_1.actors_[var_518_28.prefab_name] ~= nil then
						local var_518_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_515_1.actors_[var_518_28.prefab_name].transform, "story_v_out_115301", "115301128", "story_v_out_115301.awb")

						arg_515_1:RecordAudio("115301128", var_518_34)
						arg_515_1:RecordAudio("115301128", var_518_34)
					else
						arg_515_1:AudioAction("play", "voice", "story_v_out_115301", "115301128", "story_v_out_115301.awb")
					end

					arg_515_1:RecordHistoryTalkVoice("story_v_out_115301", "115301128", "story_v_out_115301.awb")
				end

				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_35 = math.max(var_518_26, arg_515_1.talkMaxDuration)

			if var_518_25 <= arg_515_1.time_ and arg_515_1.time_ < var_518_25 + var_518_35 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_25) / var_518_35

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_25 + var_518_35 and arg_515_1.time_ < var_518_25 + var_518_35 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play115301129 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 115301129
		arg_519_1.duration_ = 11.066

		local var_519_0 = {
			ja = 6.666,
			ko = 6.6,
			zh = 8.1,
			en = 11.066
		}
		local var_519_1 = manager.audio:GetLocalizationFlag()

		if var_519_0[var_519_1] ~= nil then
			arg_519_1.duration_ = var_519_0[var_519_1]
		end

		SetActive(arg_519_1.tipsGo_, false)

		function arg_519_1.onSingleLineFinish_()
			arg_519_1.onSingleLineUpdate_ = nil
			arg_519_1.onSingleLineFinish_ = nil
			arg_519_1.state_ = "waiting"
		end

		function arg_519_1.playNext_(arg_521_0)
			if arg_521_0 == 1 then
				arg_519_0:Play115301130(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = arg_519_1.actors_["10030"]
			local var_522_1 = 0

			if var_522_1 < arg_519_1.time_ and arg_519_1.time_ <= var_522_1 + arg_522_0 and arg_519_1.var_.actorSpriteComps10030 == nil then
				arg_519_1.var_.actorSpriteComps10030 = var_522_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_522_2 = 0.2

			if var_522_1 <= arg_519_1.time_ and arg_519_1.time_ < var_522_1 + var_522_2 then
				local var_522_3 = (arg_519_1.time_ - var_522_1) / var_522_2

				if arg_519_1.var_.actorSpriteComps10030 then
					for iter_522_0, iter_522_1 in pairs(arg_519_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_522_1 then
							local var_522_4 = Mathf.Lerp(iter_522_1.color.r, 0.5, var_522_3)

							iter_522_1.color = Color.New(var_522_4, var_522_4, var_522_4)
						end
					end
				end
			end

			if arg_519_1.time_ >= var_522_1 + var_522_2 and arg_519_1.time_ < var_522_1 + var_522_2 + arg_522_0 and arg_519_1.var_.actorSpriteComps10030 then
				local var_522_5 = 0.5

				for iter_522_2, iter_522_3 in pairs(arg_519_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_522_3 then
						iter_522_3.color = Color.New(var_522_5, var_522_5, var_522_5)
					end
				end

				arg_519_1.var_.actorSpriteComps10030 = nil
			end

			local var_522_6 = arg_519_1.actors_["1038"]
			local var_522_7 = 0

			if var_522_7 < arg_519_1.time_ and arg_519_1.time_ <= var_522_7 + arg_522_0 and arg_519_1.var_.actorSpriteComps1038 == nil then
				arg_519_1.var_.actorSpriteComps1038 = var_522_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_522_8 = 0.2

			if var_522_7 <= arg_519_1.time_ and arg_519_1.time_ < var_522_7 + var_522_8 then
				local var_522_9 = (arg_519_1.time_ - var_522_7) / var_522_8

				if arg_519_1.var_.actorSpriteComps1038 then
					for iter_522_4, iter_522_5 in pairs(arg_519_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_522_5 then
							local var_522_10 = Mathf.Lerp(iter_522_5.color.r, 1, var_522_9)

							iter_522_5.color = Color.New(var_522_10, var_522_10, var_522_10)
						end
					end
				end
			end

			if arg_519_1.time_ >= var_522_7 + var_522_8 and arg_519_1.time_ < var_522_7 + var_522_8 + arg_522_0 and arg_519_1.var_.actorSpriteComps1038 then
				local var_522_11 = 1

				for iter_522_6, iter_522_7 in pairs(arg_519_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_522_7 then
						iter_522_7.color = Color.New(var_522_11, var_522_11, var_522_11)
					end
				end

				arg_519_1.var_.actorSpriteComps1038 = nil
			end

			local var_522_12 = 0
			local var_522_13 = 0.75

			if var_522_12 < arg_519_1.time_ and arg_519_1.time_ <= var_522_12 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0
				arg_519_1.dialogCg_.alpha = 1

				arg_519_1.dialog_:SetActive(true)
				SetActive(arg_519_1.leftNameGo_, true)

				local var_522_14 = arg_519_1:FormatText(StoryNameCfg[94].name)

				arg_519_1.leftNameTxt_.text = var_522_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_519_1.leftNameTxt_.transform)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1.leftNameTxt_.text)
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_15 = arg_519_1:GetWordFromCfg(115301129)
				local var_522_16 = arg_519_1:FormatText(var_522_15.content)

				arg_519_1.text_.text = var_522_16

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_17 = 29
				local var_522_18 = utf8.len(var_522_16)
				local var_522_19 = var_522_17 <= 0 and var_522_13 or var_522_13 * (var_522_18 / var_522_17)

				if var_522_19 > 0 and var_522_13 < var_522_19 then
					arg_519_1.talkMaxDuration = var_522_19

					if var_522_19 + var_522_12 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_19 + var_522_12
					end
				end

				arg_519_1.text_.text = var_522_16
				arg_519_1.typewritter.percent = 0

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301129", "story_v_out_115301.awb") ~= 0 then
					local var_522_20 = manager.audio:GetVoiceLength("story_v_out_115301", "115301129", "story_v_out_115301.awb") / 1000

					if var_522_20 + var_522_12 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_20 + var_522_12
					end

					if var_522_15.prefab_name ~= "" and arg_519_1.actors_[var_522_15.prefab_name] ~= nil then
						local var_522_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_519_1.actors_[var_522_15.prefab_name].transform, "story_v_out_115301", "115301129", "story_v_out_115301.awb")

						arg_519_1:RecordAudio("115301129", var_522_21)
						arg_519_1:RecordAudio("115301129", var_522_21)
					else
						arg_519_1:AudioAction("play", "voice", "story_v_out_115301", "115301129", "story_v_out_115301.awb")
					end

					arg_519_1:RecordHistoryTalkVoice("story_v_out_115301", "115301129", "story_v_out_115301.awb")
				end

				arg_519_1:RecordContent(arg_519_1.text_.text)
			end

			local var_522_22 = math.max(var_522_13, arg_519_1.talkMaxDuration)

			if var_522_12 <= arg_519_1.time_ and arg_519_1.time_ < var_522_12 + var_522_22 then
				arg_519_1.typewritter.percent = (arg_519_1.time_ - var_522_12) / var_522_22

				arg_519_1.typewritter:SetDirty()
			end

			if arg_519_1.time_ >= var_522_12 + var_522_22 and arg_519_1.time_ < var_522_12 + var_522_22 + arg_522_0 then
				arg_519_1.typewritter.percent = 1

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(true)
			end
		end
	end,
	Play115301130 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 115301130
		arg_523_1.duration_ = 5

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play115301131(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = arg_523_1.actors_["1038"]
			local var_526_1 = 0

			if var_526_1 < arg_523_1.time_ and arg_523_1.time_ <= var_526_1 + arg_526_0 and arg_523_1.var_.actorSpriteComps1038 == nil then
				arg_523_1.var_.actorSpriteComps1038 = var_526_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_526_2 = 0.2

			if var_526_1 <= arg_523_1.time_ and arg_523_1.time_ < var_526_1 + var_526_2 then
				local var_526_3 = (arg_523_1.time_ - var_526_1) / var_526_2

				if arg_523_1.var_.actorSpriteComps1038 then
					for iter_526_0, iter_526_1 in pairs(arg_523_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_526_1 then
							local var_526_4 = Mathf.Lerp(iter_526_1.color.r, 0.5, var_526_3)

							iter_526_1.color = Color.New(var_526_4, var_526_4, var_526_4)
						end
					end
				end
			end

			if arg_523_1.time_ >= var_526_1 + var_526_2 and arg_523_1.time_ < var_526_1 + var_526_2 + arg_526_0 and arg_523_1.var_.actorSpriteComps1038 then
				local var_526_5 = 0.5

				for iter_526_2, iter_526_3 in pairs(arg_523_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_526_3 then
						iter_526_3.color = Color.New(var_526_5, var_526_5, var_526_5)
					end
				end

				arg_523_1.var_.actorSpriteComps1038 = nil
			end

			local var_526_6 = 0
			local var_526_7 = 0.825

			if var_526_6 < arg_523_1.time_ and arg_523_1.time_ <= var_526_6 + arg_526_0 then
				arg_523_1.talkMaxDuration = 0
				arg_523_1.dialogCg_.alpha = 1

				arg_523_1.dialog_:SetActive(true)
				SetActive(arg_523_1.leftNameGo_, false)

				arg_523_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_523_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_523_1:RecordName(arg_523_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_523_1.iconTrs_.gameObject, false)
				arg_523_1.callingController_:SetSelectedState("normal")

				local var_526_8 = arg_523_1:GetWordFromCfg(115301130)
				local var_526_9 = arg_523_1:FormatText(var_526_8.content)

				arg_523_1.text_.text = var_526_9

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_10 = 33
				local var_526_11 = utf8.len(var_526_9)
				local var_526_12 = var_526_10 <= 0 and var_526_7 or var_526_7 * (var_526_11 / var_526_10)

				if var_526_12 > 0 and var_526_7 < var_526_12 then
					arg_523_1.talkMaxDuration = var_526_12

					if var_526_12 + var_526_6 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_12 + var_526_6
					end
				end

				arg_523_1.text_.text = var_526_9
				arg_523_1.typewritter.percent = 0

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(false)
				arg_523_1:RecordContent(arg_523_1.text_.text)
			end

			local var_526_13 = math.max(var_526_7, arg_523_1.talkMaxDuration)

			if var_526_6 <= arg_523_1.time_ and arg_523_1.time_ < var_526_6 + var_526_13 then
				arg_523_1.typewritter.percent = (arg_523_1.time_ - var_526_6) / var_526_13

				arg_523_1.typewritter:SetDirty()
			end

			if arg_523_1.time_ >= var_526_6 + var_526_13 and arg_523_1.time_ < var_526_6 + var_526_13 + arg_526_0 then
				arg_523_1.typewritter.percent = 1

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(true)
			end
		end
	end,
	Play115301131 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 115301131
		arg_527_1.duration_ = 4.3

		local var_527_0 = {
			ja = 4.3,
			ko = 2.5,
			zh = 3.333,
			en = 3.1
		}
		local var_527_1 = manager.audio:GetLocalizationFlag()

		if var_527_0[var_527_1] ~= nil then
			arg_527_1.duration_ = var_527_0[var_527_1]
		end

		SetActive(arg_527_1.tipsGo_, false)

		function arg_527_1.onSingleLineFinish_()
			arg_527_1.onSingleLineUpdate_ = nil
			arg_527_1.onSingleLineFinish_ = nil
			arg_527_1.state_ = "waiting"
		end

		function arg_527_1.playNext_(arg_529_0)
			if arg_529_0 == 1 then
				arg_527_0:Play115301132(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = arg_527_1.actors_["10030"]
			local var_530_1 = 0

			if var_530_1 < arg_527_1.time_ and arg_527_1.time_ <= var_530_1 + arg_530_0 and arg_527_1.var_.actorSpriteComps10030 == nil then
				arg_527_1.var_.actorSpriteComps10030 = var_530_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_530_2 = 0.2

			if var_530_1 <= arg_527_1.time_ and arg_527_1.time_ < var_530_1 + var_530_2 then
				local var_530_3 = (arg_527_1.time_ - var_530_1) / var_530_2

				if arg_527_1.var_.actorSpriteComps10030 then
					for iter_530_0, iter_530_1 in pairs(arg_527_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_530_1 then
							local var_530_4 = Mathf.Lerp(iter_530_1.color.r, 1, var_530_3)

							iter_530_1.color = Color.New(var_530_4, var_530_4, var_530_4)
						end
					end
				end
			end

			if arg_527_1.time_ >= var_530_1 + var_530_2 and arg_527_1.time_ < var_530_1 + var_530_2 + arg_530_0 and arg_527_1.var_.actorSpriteComps10030 then
				local var_530_5 = 1

				for iter_530_2, iter_530_3 in pairs(arg_527_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_530_3 then
						iter_530_3.color = Color.New(var_530_5, var_530_5, var_530_5)
					end
				end

				arg_527_1.var_.actorSpriteComps10030 = nil
			end

			local var_530_6 = 0
			local var_530_7 = 0.275

			if var_530_6 < arg_527_1.time_ and arg_527_1.time_ <= var_530_6 + arg_530_0 then
				arg_527_1.talkMaxDuration = 0
				arg_527_1.dialogCg_.alpha = 1

				arg_527_1.dialog_:SetActive(true)
				SetActive(arg_527_1.leftNameGo_, true)

				local var_530_8 = arg_527_1:FormatText(StoryNameCfg[309].name)

				arg_527_1.leftNameTxt_.text = var_530_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_527_1.leftNameTxt_.transform)

				arg_527_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_527_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_527_1:RecordName(arg_527_1.leftNameTxt_.text)
				SetActive(arg_527_1.iconTrs_.gameObject, false)
				arg_527_1.callingController_:SetSelectedState("normal")

				local var_530_9 = arg_527_1:GetWordFromCfg(115301131)
				local var_530_10 = arg_527_1:FormatText(var_530_9.content)

				arg_527_1.text_.text = var_530_10

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_11 = 11
				local var_530_12 = utf8.len(var_530_10)
				local var_530_13 = var_530_11 <= 0 and var_530_7 or var_530_7 * (var_530_12 / var_530_11)

				if var_530_13 > 0 and var_530_7 < var_530_13 then
					arg_527_1.talkMaxDuration = var_530_13

					if var_530_13 + var_530_6 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_13 + var_530_6
					end
				end

				arg_527_1.text_.text = var_530_10
				arg_527_1.typewritter.percent = 0

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301131", "story_v_out_115301.awb") ~= 0 then
					local var_530_14 = manager.audio:GetVoiceLength("story_v_out_115301", "115301131", "story_v_out_115301.awb") / 1000

					if var_530_14 + var_530_6 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_14 + var_530_6
					end

					if var_530_9.prefab_name ~= "" and arg_527_1.actors_[var_530_9.prefab_name] ~= nil then
						local var_530_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_527_1.actors_[var_530_9.prefab_name].transform, "story_v_out_115301", "115301131", "story_v_out_115301.awb")

						arg_527_1:RecordAudio("115301131", var_530_15)
						arg_527_1:RecordAudio("115301131", var_530_15)
					else
						arg_527_1:AudioAction("play", "voice", "story_v_out_115301", "115301131", "story_v_out_115301.awb")
					end

					arg_527_1:RecordHistoryTalkVoice("story_v_out_115301", "115301131", "story_v_out_115301.awb")
				end

				arg_527_1:RecordContent(arg_527_1.text_.text)
			end

			local var_530_16 = math.max(var_530_7, arg_527_1.talkMaxDuration)

			if var_530_6 <= arg_527_1.time_ and arg_527_1.time_ < var_530_6 + var_530_16 then
				arg_527_1.typewritter.percent = (arg_527_1.time_ - var_530_6) / var_530_16

				arg_527_1.typewritter:SetDirty()
			end

			if arg_527_1.time_ >= var_530_6 + var_530_16 and arg_527_1.time_ < var_530_6 + var_530_16 + arg_530_0 then
				arg_527_1.typewritter.percent = 1

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(true)
			end
		end
	end,
	Play115301132 = function(arg_531_0, arg_531_1)
		arg_531_1.time_ = 0
		arg_531_1.frameCnt_ = 0
		arg_531_1.state_ = "playing"
		arg_531_1.curTalkId_ = 115301132
		arg_531_1.duration_ = 9.9

		local var_531_0 = {
			ja = 9.9,
			ko = 4.466,
			zh = 5.1,
			en = 4.766
		}
		local var_531_1 = manager.audio:GetLocalizationFlag()

		if var_531_0[var_531_1] ~= nil then
			arg_531_1.duration_ = var_531_0[var_531_1]
		end

		SetActive(arg_531_1.tipsGo_, false)

		function arg_531_1.onSingleLineFinish_()
			arg_531_1.onSingleLineUpdate_ = nil
			arg_531_1.onSingleLineFinish_ = nil
			arg_531_1.state_ = "waiting"
		end

		function arg_531_1.playNext_(arg_533_0)
			if arg_533_0 == 1 then
				arg_531_0:Play115301133(arg_531_1)
			end
		end

		function arg_531_1.onSingleLineUpdate_(arg_534_0)
			local var_534_0 = arg_531_1.actors_["10030"]
			local var_534_1 = 0

			if var_534_1 < arg_531_1.time_ and arg_531_1.time_ <= var_534_1 + arg_534_0 and arg_531_1.var_.actorSpriteComps10030 == nil then
				arg_531_1.var_.actorSpriteComps10030 = var_534_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_534_2 = 0.2

			if var_534_1 <= arg_531_1.time_ and arg_531_1.time_ < var_534_1 + var_534_2 then
				local var_534_3 = (arg_531_1.time_ - var_534_1) / var_534_2

				if arg_531_1.var_.actorSpriteComps10030 then
					for iter_534_0, iter_534_1 in pairs(arg_531_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_534_1 then
							local var_534_4 = Mathf.Lerp(iter_534_1.color.r, 0.5, var_534_3)

							iter_534_1.color = Color.New(var_534_4, var_534_4, var_534_4)
						end
					end
				end
			end

			if arg_531_1.time_ >= var_534_1 + var_534_2 and arg_531_1.time_ < var_534_1 + var_534_2 + arg_534_0 and arg_531_1.var_.actorSpriteComps10030 then
				local var_534_5 = 0.5

				for iter_534_2, iter_534_3 in pairs(arg_531_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_534_3 then
						iter_534_3.color = Color.New(var_534_5, var_534_5, var_534_5)
					end
				end

				arg_531_1.var_.actorSpriteComps10030 = nil
			end

			local var_534_6 = arg_531_1.actors_["1038"].transform
			local var_534_7 = 0

			if var_534_7 < arg_531_1.time_ and arg_531_1.time_ <= var_534_7 + arg_534_0 then
				arg_531_1.var_.moveOldPos1038 = var_534_6.localPosition
				var_534_6.localScale = Vector3.New(1, 1, 1)

				arg_531_1:CheckSpriteTmpPos("1038", 2)

				local var_534_8 = var_534_6.childCount

				for iter_534_4 = 0, var_534_8 - 1 do
					local var_534_9 = var_534_6:GetChild(iter_534_4)

					if var_534_9.name == "split_7" or not string.find(var_534_9.name, "split") then
						var_534_9.gameObject:SetActive(true)
					else
						var_534_9.gameObject:SetActive(false)
					end
				end
			end

			local var_534_10 = 0.001

			if var_534_7 <= arg_531_1.time_ and arg_531_1.time_ < var_534_7 + var_534_10 then
				local var_534_11 = (arg_531_1.time_ - var_534_7) / var_534_10
				local var_534_12 = Vector3.New(-390, -400, 0)

				var_534_6.localPosition = Vector3.Lerp(arg_531_1.var_.moveOldPos1038, var_534_12, var_534_11)
			end

			if arg_531_1.time_ >= var_534_7 + var_534_10 and arg_531_1.time_ < var_534_7 + var_534_10 + arg_534_0 then
				var_534_6.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_534_13 = arg_531_1.actors_["1038"]
			local var_534_14 = 0

			if var_534_14 < arg_531_1.time_ and arg_531_1.time_ <= var_534_14 + arg_534_0 then
				local var_534_15 = var_534_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_534_15 then
					arg_531_1.var_.alphaOldValue1038 = var_534_15.alpha
					arg_531_1.var_.characterEffect1038 = var_534_15
				end

				arg_531_1.var_.alphaOldValue1038 = 0
			end

			local var_534_16 = 0.0166666666666667

			if var_534_14 <= arg_531_1.time_ and arg_531_1.time_ < var_534_14 + var_534_16 then
				local var_534_17 = (arg_531_1.time_ - var_534_14) / var_534_16
				local var_534_18 = Mathf.Lerp(arg_531_1.var_.alphaOldValue1038, 1, var_534_17)

				if arg_531_1.var_.characterEffect1038 then
					arg_531_1.var_.characterEffect1038.alpha = var_534_18
				end
			end

			if arg_531_1.time_ >= var_534_14 + var_534_16 and arg_531_1.time_ < var_534_14 + var_534_16 + arg_534_0 and arg_531_1.var_.characterEffect1038 then
				arg_531_1.var_.characterEffect1038.alpha = 1
			end

			local var_534_19 = 0
			local var_534_20 = 0.5

			if var_534_19 < arg_531_1.time_ and arg_531_1.time_ <= var_534_19 + arg_534_0 then
				arg_531_1.talkMaxDuration = 0
				arg_531_1.dialogCg_.alpha = 1

				arg_531_1.dialog_:SetActive(true)
				SetActive(arg_531_1.leftNameGo_, true)

				local var_534_21 = arg_531_1:FormatText(StoryNameCfg[94].name)

				arg_531_1.leftNameTxt_.text = var_534_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_531_1.leftNameTxt_.transform)

				arg_531_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_531_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_531_1:RecordName(arg_531_1.leftNameTxt_.text)
				SetActive(arg_531_1.iconTrs_.gameObject, false)
				arg_531_1.callingController_:SetSelectedState("normal")

				local var_534_22 = arg_531_1:GetWordFromCfg(115301132)
				local var_534_23 = arg_531_1:FormatText(var_534_22.content)

				arg_531_1.text_.text = var_534_23

				LuaForUtil.ClearLinePrefixSymbol(arg_531_1.text_)

				local var_534_24 = 20
				local var_534_25 = utf8.len(var_534_23)
				local var_534_26 = var_534_24 <= 0 and var_534_20 or var_534_20 * (var_534_25 / var_534_24)

				if var_534_26 > 0 and var_534_20 < var_534_26 then
					arg_531_1.talkMaxDuration = var_534_26

					if var_534_26 + var_534_19 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_26 + var_534_19
					end
				end

				arg_531_1.text_.text = var_534_23
				arg_531_1.typewritter.percent = 0

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301132", "story_v_out_115301.awb") ~= 0 then
					local var_534_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301132", "story_v_out_115301.awb") / 1000

					if var_534_27 + var_534_19 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_27 + var_534_19
					end

					if var_534_22.prefab_name ~= "" and arg_531_1.actors_[var_534_22.prefab_name] ~= nil then
						local var_534_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_531_1.actors_[var_534_22.prefab_name].transform, "story_v_out_115301", "115301132", "story_v_out_115301.awb")

						arg_531_1:RecordAudio("115301132", var_534_28)
						arg_531_1:RecordAudio("115301132", var_534_28)
					else
						arg_531_1:AudioAction("play", "voice", "story_v_out_115301", "115301132", "story_v_out_115301.awb")
					end

					arg_531_1:RecordHistoryTalkVoice("story_v_out_115301", "115301132", "story_v_out_115301.awb")
				end

				arg_531_1:RecordContent(arg_531_1.text_.text)
			end

			local var_534_29 = math.max(var_534_20, arg_531_1.talkMaxDuration)

			if var_534_19 <= arg_531_1.time_ and arg_531_1.time_ < var_534_19 + var_534_29 then
				arg_531_1.typewritter.percent = (arg_531_1.time_ - var_534_19) / var_534_29

				arg_531_1.typewritter:SetDirty()
			end

			if arg_531_1.time_ >= var_534_19 + var_534_29 and arg_531_1.time_ < var_534_19 + var_534_29 + arg_534_0 then
				arg_531_1.typewritter.percent = 1

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(true)
			end
		end
	end,
	Play115301133 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 115301133
		arg_535_1.duration_ = 3.999999999999

		SetActive(arg_535_1.tipsGo_, false)

		function arg_535_1.onSingleLineFinish_()
			arg_535_1.onSingleLineUpdate_ = nil
			arg_535_1.onSingleLineFinish_ = nil
			arg_535_1.state_ = "waiting"
		end

		function arg_535_1.playNext_(arg_537_0)
			if arg_537_0 == 1 then
				arg_535_0:Play115301134(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = 1

			if var_538_0 < arg_535_1.time_ and arg_535_1.time_ <= var_538_0 + arg_538_0 then
				local var_538_1 = manager.ui.mainCamera.transform.localPosition
				local var_538_2 = Vector3.New(0, 0, 10) + Vector3.New(var_538_1.x, var_538_1.y, 0)
				local var_538_3 = arg_535_1.bgs_.STblack

				var_538_3.transform.localPosition = var_538_2
				var_538_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_538_4 = var_538_3:GetComponent("SpriteRenderer")

				if var_538_4 and var_538_4.sprite then
					local var_538_5 = (var_538_3.transform.localPosition - var_538_1).z
					local var_538_6 = manager.ui.mainCameraCom_
					local var_538_7 = 2 * var_538_5 * Mathf.Tan(var_538_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_538_8 = var_538_7 * var_538_6.aspect
					local var_538_9 = var_538_4.sprite.bounds.size.x
					local var_538_10 = var_538_4.sprite.bounds.size.y
					local var_538_11 = var_538_8 / var_538_9
					local var_538_12 = var_538_7 / var_538_10
					local var_538_13 = var_538_12 < var_538_11 and var_538_11 or var_538_12

					var_538_3.transform.localScale = Vector3.New(var_538_13, var_538_13, 0)
				end

				for iter_538_0, iter_538_1 in pairs(arg_535_1.bgs_) do
					if iter_538_0 ~= "STblack" then
						iter_538_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_538_14 = 0

			if var_538_14 < arg_535_1.time_ and arg_535_1.time_ <= var_538_14 + arg_538_0 then
				arg_535_1.mask_.enabled = true
				arg_535_1.mask_.raycastTarget = true

				arg_535_1:SetGaussion(false)
			end

			local var_538_15 = 1

			if var_538_14 <= arg_535_1.time_ and arg_535_1.time_ < var_538_14 + var_538_15 then
				local var_538_16 = (arg_535_1.time_ - var_538_14) / var_538_15
				local var_538_17 = Color.New(0, 0, 0)

				var_538_17.a = Mathf.Lerp(0, 1, var_538_16)
				arg_535_1.mask_.color = var_538_17
			end

			if arg_535_1.time_ >= var_538_14 + var_538_15 and arg_535_1.time_ < var_538_14 + var_538_15 + arg_538_0 then
				local var_538_18 = Color.New(0, 0, 0)

				var_538_18.a = 1
				arg_535_1.mask_.color = var_538_18
			end

			local var_538_19 = 1

			if var_538_19 < arg_535_1.time_ and arg_535_1.time_ <= var_538_19 + arg_538_0 then
				arg_535_1.mask_.enabled = true
				arg_535_1.mask_.raycastTarget = false

				arg_535_1:SetGaussion(false)
			end

			local var_538_20 = 0.0333333333333333

			if var_538_19 <= arg_535_1.time_ and arg_535_1.time_ < var_538_19 + var_538_20 then
				local var_538_21 = (arg_535_1.time_ - var_538_19) / var_538_20
				local var_538_22 = Color.New(0, 0, 0)

				var_538_22.a = Mathf.Lerp(1, 0, var_538_21)
				arg_535_1.mask_.color = var_538_22
			end

			if arg_535_1.time_ >= var_538_19 + var_538_20 and arg_535_1.time_ < var_538_19 + var_538_20 + arg_538_0 then
				local var_538_23 = Color.New(0, 0, 0)
				local var_538_24 = 0

				arg_535_1.mask_.enabled = false
				var_538_23.a = var_538_24
				arg_535_1.mask_.color = var_538_23
			end

			local var_538_25 = 1.01666666666667

			if var_538_25 < arg_535_1.time_ and arg_535_1.time_ <= var_538_25 + arg_538_0 then
				arg_535_1.var_.oldValueTypewriter = arg_535_1.fswtw_.percent

				arg_535_1:ShowNextGo(false)
			end

			local var_538_26 = 14
			local var_538_27 = 0.933333333333333
			local var_538_28 = arg_535_1:GetWordFromCfg(115301133)
			local var_538_29 = arg_535_1:FormatText(var_538_28.content)
			local var_538_30, var_538_31 = arg_535_1:GetPercentByPara(var_538_29, 1)

			if var_538_25 < arg_535_1.time_ and arg_535_1.time_ <= var_538_25 + arg_538_0 then
				arg_535_1.talkMaxDuration = 0

				local var_538_32 = var_538_26 <= 0 and var_538_27 or var_538_27 * ((var_538_31 - arg_535_1.typewritterCharCountI18N) / var_538_26)

				if var_538_32 > 0 and var_538_27 < var_538_32 then
					arg_535_1.talkMaxDuration = var_538_32

					if var_538_32 + var_538_25 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_32 + var_538_25
					end
				end
			end

			local var_538_33 = 0.933333333333333
			local var_538_34 = math.max(var_538_33, arg_535_1.talkMaxDuration)

			if var_538_25 <= arg_535_1.time_ and arg_535_1.time_ < var_538_25 + var_538_34 then
				local var_538_35 = (arg_535_1.time_ - var_538_25) / var_538_34

				arg_535_1.fswtw_.percent = Mathf.Lerp(arg_535_1.var_.oldValueTypewriter, var_538_30, var_538_35)
				arg_535_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_535_1.fswtw_:SetDirty()
			end

			if arg_535_1.time_ >= var_538_25 + var_538_34 and arg_535_1.time_ < var_538_25 + var_538_34 + arg_538_0 then
				arg_535_1.fswtw_.percent = var_538_30

				arg_535_1.fswtw_:SetDirty()
				arg_535_1:ShowNextGo(true)

				arg_535_1.typewritterCharCountI18N = var_538_31
			end

			local var_538_36 = 1

			if var_538_36 < arg_535_1.time_ and arg_535_1.time_ <= var_538_36 + arg_538_0 then
				arg_535_1.fswbg_:SetActive(true)
				arg_535_1.dialog_:SetActive(false)

				arg_535_1.fswtw_.percent = 0

				local var_538_37 = arg_535_1:GetWordFromCfg(115301133)
				local var_538_38 = arg_535_1:FormatText(var_538_37.content)

				arg_535_1.fswt_.text = var_538_38

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.fswt_)

				arg_535_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_535_1.fswtw_:SetDirty()

				arg_535_1.typewritterCharCountI18N = 0

				arg_535_1:ShowNextGo(false)
			end

			local var_538_39 = arg_535_1.actors_["10030"].transform
			local var_538_40 = 1

			if var_538_40 < arg_535_1.time_ and arg_535_1.time_ <= var_538_40 + arg_538_0 then
				arg_535_1.var_.moveOldPos10030 = var_538_39.localPosition
				var_538_39.localScale = Vector3.New(1, 1, 1)

				arg_535_1:CheckSpriteTmpPos("10030", 0)

				local var_538_41 = var_538_39.childCount

				for iter_538_2 = 0, var_538_41 - 1 do
					local var_538_42 = var_538_39:GetChild(iter_538_2)

					if var_538_42.name == "split_1" or not string.find(var_538_42.name, "split") then
						var_538_42.gameObject:SetActive(true)
					else
						var_538_42.gameObject:SetActive(false)
					end
				end
			end

			local var_538_43 = 0.001

			if var_538_40 <= arg_535_1.time_ and arg_535_1.time_ < var_538_40 + var_538_43 then
				local var_538_44 = (arg_535_1.time_ - var_538_40) / var_538_43
				local var_538_45 = Vector3.New(-1500, -350, -180)

				var_538_39.localPosition = Vector3.Lerp(arg_535_1.var_.moveOldPos10030, var_538_45, var_538_44)
			end

			if arg_535_1.time_ >= var_538_40 + var_538_43 and arg_535_1.time_ < var_538_40 + var_538_43 + arg_538_0 then
				var_538_39.localPosition = Vector3.New(-1500, -350, -180)
			end

			local var_538_46 = arg_535_1.actors_["1038"].transform
			local var_538_47 = 1

			if var_538_47 < arg_535_1.time_ and arg_535_1.time_ <= var_538_47 + arg_538_0 then
				arg_535_1.var_.moveOldPos1038 = var_538_46.localPosition
				var_538_46.localScale = Vector3.New(1, 1, 1)

				arg_535_1:CheckSpriteTmpPos("1038", 0)

				local var_538_48 = var_538_46.childCount

				for iter_538_3 = 0, var_538_48 - 1 do
					local var_538_49 = var_538_46:GetChild(iter_538_3)

					if var_538_49.name == "split_7" or not string.find(var_538_49.name, "split") then
						var_538_49.gameObject:SetActive(true)
					else
						var_538_49.gameObject:SetActive(false)
					end
				end
			end

			local var_538_50 = 0.001

			if var_538_47 <= arg_535_1.time_ and arg_535_1.time_ < var_538_47 + var_538_50 then
				local var_538_51 = (arg_535_1.time_ - var_538_47) / var_538_50
				local var_538_52 = Vector3.New(-1500, -350, -180)

				var_538_46.localPosition = Vector3.Lerp(arg_535_1.var_.moveOldPos1038, var_538_52, var_538_51)
			end

			if arg_535_1.time_ >= var_538_47 + var_538_50 and arg_535_1.time_ < var_538_47 + var_538_50 + arg_538_0 then
				var_538_46.localPosition = Vector3.New(-1500, -350, -180)
			end
		end
	end,
	Play115301134 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 115301134
		arg_539_1.duration_ = 0.999999999999

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play115301135(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = 0

			if var_542_0 < arg_539_1.time_ and arg_539_1.time_ <= var_542_0 + arg_542_0 then
				arg_539_1.var_.oldValueTypewriter = arg_539_1.fswtw_.percent

				arg_539_1:ShowNextGo(false)
			end

			local var_542_1 = 26
			local var_542_2 = 0.8
			local var_542_3 = arg_539_1:GetWordFromCfg(115301133)
			local var_542_4 = arg_539_1:FormatText(var_542_3.content)
			local var_542_5, var_542_6 = arg_539_1:GetPercentByPara(var_542_4, 2)

			if var_542_0 < arg_539_1.time_ and arg_539_1.time_ <= var_542_0 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0

				local var_542_7 = var_542_1 <= 0 and var_542_2 or var_542_2 * ((var_542_6 - arg_539_1.typewritterCharCountI18N) / var_542_1)

				if var_542_7 > 0 and var_542_2 < var_542_7 then
					arg_539_1.talkMaxDuration = var_542_7

					if var_542_7 + var_542_0 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_7 + var_542_0
					end
				end
			end

			local var_542_8 = 0.8
			local var_542_9 = math.max(var_542_8, arg_539_1.talkMaxDuration)

			if var_542_0 <= arg_539_1.time_ and arg_539_1.time_ < var_542_0 + var_542_9 then
				local var_542_10 = (arg_539_1.time_ - var_542_0) / var_542_9

				arg_539_1.fswtw_.percent = Mathf.Lerp(arg_539_1.var_.oldValueTypewriter, var_542_5, var_542_10)
				arg_539_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_539_1.fswtw_:SetDirty()
			end

			if arg_539_1.time_ >= var_542_0 + var_542_9 and arg_539_1.time_ < var_542_0 + var_542_9 + arg_542_0 then
				arg_539_1.fswtw_.percent = var_542_5

				arg_539_1.fswtw_:SetDirty()
				arg_539_1:ShowNextGo(true)

				arg_539_1.typewritterCharCountI18N = var_542_6
			end
		end
	end,
	Play115301135 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 115301135
		arg_543_1.duration_ = 0.999999999999

		SetActive(arg_543_1.tipsGo_, false)

		function arg_543_1.onSingleLineFinish_()
			arg_543_1.onSingleLineUpdate_ = nil
			arg_543_1.onSingleLineFinish_ = nil
			arg_543_1.state_ = "waiting"
		end

		function arg_543_1.playNext_(arg_545_0)
			if arg_545_0 == 1 then
				arg_543_0:Play115301136(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = 0

			if var_546_0 < arg_543_1.time_ and arg_543_1.time_ <= var_546_0 + arg_546_0 then
				arg_543_1.var_.oldValueTypewriter = arg_543_1.fswtw_.percent

				arg_543_1:ShowNextGo(false)
			end

			local var_546_1 = 12
			local var_546_2 = 0.8
			local var_546_3 = arg_543_1:GetWordFromCfg(115301133)
			local var_546_4 = arg_543_1:FormatText(var_546_3.content)
			local var_546_5, var_546_6 = arg_543_1:GetPercentByPara(var_546_4, 3)

			if var_546_0 < arg_543_1.time_ and arg_543_1.time_ <= var_546_0 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0

				local var_546_7 = var_546_1 <= 0 and var_546_2 or var_546_2 * ((var_546_6 - arg_543_1.typewritterCharCountI18N) / var_546_1)

				if var_546_7 > 0 and var_546_2 < var_546_7 then
					arg_543_1.talkMaxDuration = var_546_7

					if var_546_7 + var_546_0 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_7 + var_546_0
					end
				end
			end

			local var_546_8 = 0.8
			local var_546_9 = math.max(var_546_8, arg_543_1.talkMaxDuration)

			if var_546_0 <= arg_543_1.time_ and arg_543_1.time_ < var_546_0 + var_546_9 then
				local var_546_10 = (arg_543_1.time_ - var_546_0) / var_546_9

				arg_543_1.fswtw_.percent = Mathf.Lerp(arg_543_1.var_.oldValueTypewriter, var_546_5, var_546_10)
				arg_543_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_543_1.fswtw_:SetDirty()
			end

			if arg_543_1.time_ >= var_546_0 + var_546_9 and arg_543_1.time_ < var_546_0 + var_546_9 + arg_546_0 then
				arg_543_1.fswtw_.percent = var_546_5

				arg_543_1.fswtw_:SetDirty()
				arg_543_1:ShowNextGo(true)

				arg_543_1.typewritterCharCountI18N = var_546_6
			end
		end
	end,
	Play115301136 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 115301136
		arg_547_1.duration_ = 0.999999999999

		SetActive(arg_547_1.tipsGo_, false)

		function arg_547_1.onSingleLineFinish_()
			arg_547_1.onSingleLineUpdate_ = nil
			arg_547_1.onSingleLineFinish_ = nil
			arg_547_1.state_ = "waiting"
		end

		function arg_547_1.playNext_(arg_549_0)
			if arg_549_0 == 1 then
				arg_547_0:Play115301137(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = 0

			if var_550_0 < arg_547_1.time_ and arg_547_1.time_ <= var_550_0 + arg_550_0 then
				arg_547_1.var_.oldValueTypewriter = arg_547_1.fswtw_.percent

				arg_547_1:ShowNextGo(false)
			end

			local var_550_1 = 13
			local var_550_2 = 0.866666666666667
			local var_550_3 = arg_547_1:GetWordFromCfg(115301133)
			local var_550_4 = arg_547_1:FormatText(var_550_3.content)
			local var_550_5, var_550_6 = arg_547_1:GetPercentByPara(var_550_4, 4)

			if var_550_0 < arg_547_1.time_ and arg_547_1.time_ <= var_550_0 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0

				local var_550_7 = var_550_1 <= 0 and var_550_2 or var_550_2 * ((var_550_6 - arg_547_1.typewritterCharCountI18N) / var_550_1)

				if var_550_7 > 0 and var_550_2 < var_550_7 then
					arg_547_1.talkMaxDuration = var_550_7

					if var_550_7 + var_550_0 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_7 + var_550_0
					end
				end
			end

			local var_550_8 = 0.866666666666667
			local var_550_9 = math.max(var_550_8, arg_547_1.talkMaxDuration)

			if var_550_0 <= arg_547_1.time_ and arg_547_1.time_ < var_550_0 + var_550_9 then
				local var_550_10 = (arg_547_1.time_ - var_550_0) / var_550_9

				arg_547_1.fswtw_.percent = Mathf.Lerp(arg_547_1.var_.oldValueTypewriter, var_550_5, var_550_10)
				arg_547_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_547_1.fswtw_:SetDirty()
			end

			if arg_547_1.time_ >= var_550_0 + var_550_9 and arg_547_1.time_ < var_550_0 + var_550_9 + arg_550_0 then
				arg_547_1.fswtw_.percent = var_550_5

				arg_547_1.fswtw_:SetDirty()
				arg_547_1:ShowNextGo(true)

				arg_547_1.typewritterCharCountI18N = var_550_6
			end
		end
	end,
	Play115301137 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 115301137
		arg_551_1.duration_ = 1.066666666666

		SetActive(arg_551_1.tipsGo_, false)

		function arg_551_1.onSingleLineFinish_()
			arg_551_1.onSingleLineUpdate_ = nil
			arg_551_1.onSingleLineFinish_ = nil
			arg_551_1.state_ = "waiting"
		end

		function arg_551_1.playNext_(arg_553_0)
			if arg_553_0 == 1 then
				arg_551_0:Play115301138(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = 0

			if var_554_0 < arg_551_1.time_ and arg_551_1.time_ <= var_554_0 + arg_554_0 then
				arg_551_1.var_.oldValueTypewriter = arg_551_1.fswtw_.percent

				arg_551_1:ShowNextGo(false)
			end

			local var_554_1 = 16
			local var_554_2 = 1.06666666666667
			local var_554_3 = arg_551_1:GetWordFromCfg(115301133)
			local var_554_4 = arg_551_1:FormatText(var_554_3.content)
			local var_554_5, var_554_6 = arg_551_1:GetPercentByPara(var_554_4, 5)

			if var_554_0 < arg_551_1.time_ and arg_551_1.time_ <= var_554_0 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0

				local var_554_7 = var_554_1 <= 0 and var_554_2 or var_554_2 * ((var_554_6 - arg_551_1.typewritterCharCountI18N) / var_554_1)

				if var_554_7 > 0 and var_554_2 < var_554_7 then
					arg_551_1.talkMaxDuration = var_554_7

					if var_554_7 + var_554_0 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_7 + var_554_0
					end
				end
			end

			local var_554_8 = 1.06666666666667
			local var_554_9 = math.max(var_554_8, arg_551_1.talkMaxDuration)

			if var_554_0 <= arg_551_1.time_ and arg_551_1.time_ < var_554_0 + var_554_9 then
				local var_554_10 = (arg_551_1.time_ - var_554_0) / var_554_9

				arg_551_1.fswtw_.percent = Mathf.Lerp(arg_551_1.var_.oldValueTypewriter, var_554_5, var_554_10)
				arg_551_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_551_1.fswtw_:SetDirty()
			end

			if arg_551_1.time_ >= var_554_0 + var_554_9 and arg_551_1.time_ < var_554_0 + var_554_9 + arg_554_0 then
				arg_551_1.fswtw_.percent = var_554_5

				arg_551_1.fswtw_:SetDirty()
				arg_551_1:ShowNextGo(true)

				arg_551_1.typewritterCharCountI18N = var_554_6
			end
		end
	end,
	Play115301138 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 115301138
		arg_555_1.duration_ = 1.066666666666

		SetActive(arg_555_1.tipsGo_, false)

		function arg_555_1.onSingleLineFinish_()
			arg_555_1.onSingleLineUpdate_ = nil
			arg_555_1.onSingleLineFinish_ = nil
			arg_555_1.state_ = "waiting"
		end

		function arg_555_1.playNext_(arg_557_0)
			if arg_557_0 == 1 then
				arg_555_0:Play115301139(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = 0

			if var_558_0 < arg_555_1.time_ and arg_555_1.time_ <= var_558_0 + arg_558_0 then
				arg_555_1.var_.oldValueTypewriter = arg_555_1.fswtw_.percent

				arg_555_1:ShowNextGo(false)
			end

			local var_558_1 = 16
			local var_558_2 = 1.06666666666667
			local var_558_3 = arg_555_1:GetWordFromCfg(115301133)
			local var_558_4 = arg_555_1:FormatText(var_558_3.content)
			local var_558_5, var_558_6 = arg_555_1:GetPercentByPara(var_558_4, 6)

			if var_558_0 < arg_555_1.time_ and arg_555_1.time_ <= var_558_0 + arg_558_0 then
				arg_555_1.talkMaxDuration = 0

				local var_558_7 = var_558_1 <= 0 and var_558_2 or var_558_2 * ((var_558_6 - arg_555_1.typewritterCharCountI18N) / var_558_1)

				if var_558_7 > 0 and var_558_2 < var_558_7 then
					arg_555_1.talkMaxDuration = var_558_7

					if var_558_7 + var_558_0 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_7 + var_558_0
					end
				end
			end

			local var_558_8 = 1.06666666666667
			local var_558_9 = math.max(var_558_8, arg_555_1.talkMaxDuration)

			if var_558_0 <= arg_555_1.time_ and arg_555_1.time_ < var_558_0 + var_558_9 then
				local var_558_10 = (arg_555_1.time_ - var_558_0) / var_558_9

				arg_555_1.fswtw_.percent = Mathf.Lerp(arg_555_1.var_.oldValueTypewriter, var_558_5, var_558_10)
				arg_555_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_555_1.fswtw_:SetDirty()
			end

			if arg_555_1.time_ >= var_558_0 + var_558_9 and arg_555_1.time_ < var_558_0 + var_558_9 + arg_558_0 then
				arg_555_1.fswtw_.percent = var_558_5

				arg_555_1.fswtw_:SetDirty()
				arg_555_1:ShowNextGo(true)

				arg_555_1.typewritterCharCountI18N = var_558_6
			end
		end
	end,
	Play115301139 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 115301139
		arg_559_1.duration_ = 1.399999999999

		SetActive(arg_559_1.tipsGo_, false)

		function arg_559_1.onSingleLineFinish_()
			arg_559_1.onSingleLineUpdate_ = nil
			arg_559_1.onSingleLineFinish_ = nil
			arg_559_1.state_ = "waiting"
		end

		function arg_559_1.playNext_(arg_561_0)
			if arg_561_0 == 1 then
				arg_559_0:Play115301140(arg_559_1)
			end
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = 0

			if var_562_0 < arg_559_1.time_ and arg_559_1.time_ <= var_562_0 + arg_562_0 then
				arg_559_1.var_.oldValueTypewriter = arg_559_1.fswtw_.percent

				arg_559_1:ShowNextGo(false)
			end

			local var_562_1 = 21
			local var_562_2 = 1.4
			local var_562_3 = arg_559_1:GetWordFromCfg(115301133)
			local var_562_4 = arg_559_1:FormatText(var_562_3.content)
			local var_562_5, var_562_6 = arg_559_1:GetPercentByPara(var_562_4, 7)

			if var_562_0 < arg_559_1.time_ and arg_559_1.time_ <= var_562_0 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0

				local var_562_7 = var_562_1 <= 0 and var_562_2 or var_562_2 * ((var_562_6 - arg_559_1.typewritterCharCountI18N) / var_562_1)

				if var_562_7 > 0 and var_562_2 < var_562_7 then
					arg_559_1.talkMaxDuration = var_562_7

					if var_562_7 + var_562_0 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_7 + var_562_0
					end
				end
			end

			local var_562_8 = 1.4
			local var_562_9 = math.max(var_562_8, arg_559_1.talkMaxDuration)

			if var_562_0 <= arg_559_1.time_ and arg_559_1.time_ < var_562_0 + var_562_9 then
				local var_562_10 = (arg_559_1.time_ - var_562_0) / var_562_9

				arg_559_1.fswtw_.percent = Mathf.Lerp(arg_559_1.var_.oldValueTypewriter, var_562_5, var_562_10)
				arg_559_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_559_1.fswtw_:SetDirty()
			end

			if arg_559_1.time_ >= var_562_0 + var_562_9 and arg_559_1.time_ < var_562_0 + var_562_9 + arg_562_0 then
				arg_559_1.fswtw_.percent = var_562_5

				arg_559_1.fswtw_:SetDirty()
				arg_559_1:ShowNextGo(true)

				arg_559_1.typewritterCharCountI18N = var_562_6
			end
		end
	end,
	Play115301140 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 115301140
		arg_563_1.duration_ = 8.566

		local var_563_0 = {
			ja = 7.4,
			ko = 8.566,
			zh = 7.766,
			en = 7.933
		}
		local var_563_1 = manager.audio:GetLocalizationFlag()

		if var_563_0[var_563_1] ~= nil then
			arg_563_1.duration_ = var_563_0[var_563_1]
		end

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play115301141(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = "ST22"

			if arg_563_1.bgs_[var_566_0] == nil then
				local var_566_1 = Object.Instantiate(arg_563_1.paintGo_)

				var_566_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_566_0)
				var_566_1.name = var_566_0
				var_566_1.transform.parent = arg_563_1.stage_.transform
				var_566_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_563_1.bgs_[var_566_0] = var_566_1
			end

			local var_566_2 = 2

			if var_566_2 < arg_563_1.time_ and arg_563_1.time_ <= var_566_2 + arg_566_0 then
				local var_566_3 = manager.ui.mainCamera.transform.localPosition
				local var_566_4 = Vector3.New(0, 0, 10) + Vector3.New(var_566_3.x, var_566_3.y, 0)
				local var_566_5 = arg_563_1.bgs_.ST22

				var_566_5.transform.localPosition = var_566_4
				var_566_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_566_6 = var_566_5:GetComponent("SpriteRenderer")

				if var_566_6 and var_566_6.sprite then
					local var_566_7 = (var_566_5.transform.localPosition - var_566_3).z
					local var_566_8 = manager.ui.mainCameraCom_
					local var_566_9 = 2 * var_566_7 * Mathf.Tan(var_566_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_566_10 = var_566_9 * var_566_8.aspect
					local var_566_11 = var_566_6.sprite.bounds.size.x
					local var_566_12 = var_566_6.sprite.bounds.size.y
					local var_566_13 = var_566_10 / var_566_11
					local var_566_14 = var_566_9 / var_566_12
					local var_566_15 = var_566_14 < var_566_13 and var_566_13 or var_566_14

					var_566_5.transform.localScale = Vector3.New(var_566_15, var_566_15, 0)
				end

				for iter_566_0, iter_566_1 in pairs(arg_563_1.bgs_) do
					if iter_566_0 ~= "ST22" then
						iter_566_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_566_16 = 2

			if var_566_16 < arg_563_1.time_ and arg_563_1.time_ <= var_566_16 + arg_566_0 then
				arg_563_1.mask_.enabled = true
				arg_563_1.mask_.raycastTarget = false

				arg_563_1:SetGaussion(false)
			end

			local var_566_17 = 2

			if var_566_16 <= arg_563_1.time_ and arg_563_1.time_ < var_566_16 + var_566_17 then
				local var_566_18 = (arg_563_1.time_ - var_566_16) / var_566_17
				local var_566_19 = Color.New(0, 0, 0)

				var_566_19.a = Mathf.Lerp(1, 0, var_566_18)
				arg_563_1.mask_.color = var_566_19
			end

			if arg_563_1.time_ >= var_566_16 + var_566_17 and arg_563_1.time_ < var_566_16 + var_566_17 + arg_566_0 then
				local var_566_20 = Color.New(0, 0, 0)
				local var_566_21 = 0

				arg_563_1.mask_.enabled = false
				var_566_20.a = var_566_21
				arg_563_1.mask_.color = var_566_20
			end

			local var_566_22 = 0

			if var_566_22 < arg_563_1.time_ and arg_563_1.time_ <= var_566_22 + arg_566_0 then
				arg_563_1.fswbg_:SetActive(false)
				arg_563_1.dialog_:SetActive(true)
				arg_563_1:ShowNextGo(false)
			end

			local var_566_23 = 0

			if var_566_23 < arg_563_1.time_ and arg_563_1.time_ <= var_566_23 + arg_566_0 then
				arg_563_1.allBtn_.enabled = false
			end

			local var_566_24 = 4

			if arg_563_1.time_ >= var_566_23 + var_566_24 and arg_563_1.time_ < var_566_23 + var_566_24 + arg_566_0 then
				arg_563_1.allBtn_.enabled = true
			end

			if arg_563_1.frameCnt_ <= 1 then
				arg_563_1.dialog_:SetActive(false)
			end

			local var_566_25 = 4
			local var_566_26 = 0.3

			if var_566_25 < arg_563_1.time_ and arg_563_1.time_ <= var_566_25 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0

				arg_563_1.dialog_:SetActive(true)

				local var_566_27 = LeanTween.value(arg_563_1.dialog_, 0, 1, 0.3)

				var_566_27:setOnUpdate(LuaHelper.FloatAction(function(arg_567_0)
					arg_563_1.dialogCg_.alpha = arg_567_0
				end))
				var_566_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_563_1.dialog_)
					var_566_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_563_1.duration_ = arg_563_1.duration_ + 0.3

				SetActive(arg_563_1.leftNameGo_, true)

				local var_566_28 = arg_563_1:FormatText(StoryNameCfg[306].name)

				arg_563_1.leftNameTxt_.text = var_566_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_563_1.leftNameTxt_.transform)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1.leftNameTxt_.text)
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_29 = arg_563_1:GetWordFromCfg(115301140)
				local var_566_30 = arg_563_1:FormatText(var_566_29.content)

				arg_563_1.text_.text = var_566_30

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_31 = 12
				local var_566_32 = utf8.len(var_566_30)
				local var_566_33 = var_566_31 <= 0 and var_566_26 or var_566_26 * (var_566_32 / var_566_31)

				if var_566_33 > 0 and var_566_26 < var_566_33 then
					arg_563_1.talkMaxDuration = var_566_33
					var_566_25 = var_566_25 + 0.3

					if var_566_33 + var_566_25 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_33 + var_566_25
					end
				end

				arg_563_1.text_.text = var_566_30
				arg_563_1.typewritter.percent = 0

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301140", "story_v_out_115301.awb") ~= 0 then
					local var_566_34 = manager.audio:GetVoiceLength("story_v_out_115301", "115301140", "story_v_out_115301.awb") / 1000

					if var_566_34 + var_566_25 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_34 + var_566_25
					end

					if var_566_29.prefab_name ~= "" and arg_563_1.actors_[var_566_29.prefab_name] ~= nil then
						local var_566_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_563_1.actors_[var_566_29.prefab_name].transform, "story_v_out_115301", "115301140", "story_v_out_115301.awb")

						arg_563_1:RecordAudio("115301140", var_566_35)
						arg_563_1:RecordAudio("115301140", var_566_35)
					else
						arg_563_1:AudioAction("play", "voice", "story_v_out_115301", "115301140", "story_v_out_115301.awb")
					end

					arg_563_1:RecordHistoryTalkVoice("story_v_out_115301", "115301140", "story_v_out_115301.awb")
				end

				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_36 = var_566_25 + 0.3
			local var_566_37 = math.max(var_566_26, arg_563_1.talkMaxDuration)

			if var_566_36 <= arg_563_1.time_ and arg_563_1.time_ < var_566_36 + var_566_37 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_36) / var_566_37

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_36 + var_566_37 and arg_563_1.time_ < var_566_36 + var_566_37 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	Play115301141 = function(arg_569_0, arg_569_1)
		arg_569_1.time_ = 0
		arg_569_1.frameCnt_ = 0
		arg_569_1.state_ = "playing"
		arg_569_1.curTalkId_ = 115301141
		arg_569_1.duration_ = 5.5

		local var_569_0 = {
			ja = 3.333,
			ko = 5.5,
			zh = 3.5,
			en = 3.7
		}
		local var_569_1 = manager.audio:GetLocalizationFlag()

		if var_569_0[var_569_1] ~= nil then
			arg_569_1.duration_ = var_569_0[var_569_1]
		end

		SetActive(arg_569_1.tipsGo_, false)

		function arg_569_1.onSingleLineFinish_()
			arg_569_1.onSingleLineUpdate_ = nil
			arg_569_1.onSingleLineFinish_ = nil
			arg_569_1.state_ = "waiting"
		end

		function arg_569_1.playNext_(arg_571_0)
			if arg_571_0 == 1 then
				arg_569_0:Play115301142(arg_569_1)
			end
		end

		function arg_569_1.onSingleLineUpdate_(arg_572_0)
			local var_572_0 = 0
			local var_572_1 = 0.3

			if var_572_0 < arg_569_1.time_ and arg_569_1.time_ <= var_572_0 + arg_572_0 then
				arg_569_1.talkMaxDuration = 0
				arg_569_1.dialogCg_.alpha = 1

				arg_569_1.dialog_:SetActive(true)
				SetActive(arg_569_1.leftNameGo_, true)

				local var_572_2 = arg_569_1:FormatText(StoryNameCfg[306].name)

				arg_569_1.leftNameTxt_.text = var_572_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_569_1.leftNameTxt_.transform)

				arg_569_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_569_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_569_1:RecordName(arg_569_1.leftNameTxt_.text)
				SetActive(arg_569_1.iconTrs_.gameObject, false)
				arg_569_1.callingController_:SetSelectedState("normal")

				local var_572_3 = arg_569_1:GetWordFromCfg(115301141)
				local var_572_4 = arg_569_1:FormatText(var_572_3.content)

				arg_569_1.text_.text = var_572_4

				LuaForUtil.ClearLinePrefixSymbol(arg_569_1.text_)

				local var_572_5 = 12
				local var_572_6 = utf8.len(var_572_4)
				local var_572_7 = var_572_5 <= 0 and var_572_1 or var_572_1 * (var_572_6 / var_572_5)

				if var_572_7 > 0 and var_572_1 < var_572_7 then
					arg_569_1.talkMaxDuration = var_572_7

					if var_572_7 + var_572_0 > arg_569_1.duration_ then
						arg_569_1.duration_ = var_572_7 + var_572_0
					end
				end

				arg_569_1.text_.text = var_572_4
				arg_569_1.typewritter.percent = 0

				arg_569_1.typewritter:SetDirty()
				arg_569_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301141", "story_v_out_115301.awb") ~= 0 then
					local var_572_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301141", "story_v_out_115301.awb") / 1000

					if var_572_8 + var_572_0 > arg_569_1.duration_ then
						arg_569_1.duration_ = var_572_8 + var_572_0
					end

					if var_572_3.prefab_name ~= "" and arg_569_1.actors_[var_572_3.prefab_name] ~= nil then
						local var_572_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_569_1.actors_[var_572_3.prefab_name].transform, "story_v_out_115301", "115301141", "story_v_out_115301.awb")

						arg_569_1:RecordAudio("115301141", var_572_9)
						arg_569_1:RecordAudio("115301141", var_572_9)
					else
						arg_569_1:AudioAction("play", "voice", "story_v_out_115301", "115301141", "story_v_out_115301.awb")
					end

					arg_569_1:RecordHistoryTalkVoice("story_v_out_115301", "115301141", "story_v_out_115301.awb")
				end

				arg_569_1:RecordContent(arg_569_1.text_.text)
			end

			local var_572_10 = math.max(var_572_1, arg_569_1.talkMaxDuration)

			if var_572_0 <= arg_569_1.time_ and arg_569_1.time_ < var_572_0 + var_572_10 then
				arg_569_1.typewritter.percent = (arg_569_1.time_ - var_572_0) / var_572_10

				arg_569_1.typewritter:SetDirty()
			end

			if arg_569_1.time_ >= var_572_0 + var_572_10 and arg_569_1.time_ < var_572_0 + var_572_10 + arg_572_0 then
				arg_569_1.typewritter.percent = 1

				arg_569_1.typewritter:SetDirty()
				arg_569_1:ShowNextGo(true)
			end
		end
	end,
	Play115301142 = function(arg_573_0, arg_573_1)
		arg_573_1.time_ = 0
		arg_573_1.frameCnt_ = 0
		arg_573_1.state_ = "playing"
		arg_573_1.curTalkId_ = 115301142
		arg_573_1.duration_ = 5

		SetActive(arg_573_1.tipsGo_, false)

		function arg_573_1.onSingleLineFinish_()
			arg_573_1.onSingleLineUpdate_ = nil
			arg_573_1.onSingleLineFinish_ = nil
			arg_573_1.state_ = "waiting"
		end

		function arg_573_1.playNext_(arg_575_0)
			if arg_575_0 == 1 then
				arg_573_0:Play115301143(arg_573_1)
			end
		end

		function arg_573_1.onSingleLineUpdate_(arg_576_0)
			local var_576_0 = 0
			local var_576_1 = 1.425

			if var_576_0 < arg_573_1.time_ and arg_573_1.time_ <= var_576_0 + arg_576_0 then
				arg_573_1.talkMaxDuration = 0
				arg_573_1.dialogCg_.alpha = 1

				arg_573_1.dialog_:SetActive(true)
				SetActive(arg_573_1.leftNameGo_, false)

				arg_573_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_573_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_573_1:RecordName(arg_573_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_573_1.iconTrs_.gameObject, false)
				arg_573_1.callingController_:SetSelectedState("normal")

				local var_576_2 = arg_573_1:GetWordFromCfg(115301142)
				local var_576_3 = arg_573_1:FormatText(var_576_2.content)

				arg_573_1.text_.text = var_576_3

				LuaForUtil.ClearLinePrefixSymbol(arg_573_1.text_)

				local var_576_4 = 57
				local var_576_5 = utf8.len(var_576_3)
				local var_576_6 = var_576_4 <= 0 and var_576_1 or var_576_1 * (var_576_5 / var_576_4)

				if var_576_6 > 0 and var_576_1 < var_576_6 then
					arg_573_1.talkMaxDuration = var_576_6

					if var_576_6 + var_576_0 > arg_573_1.duration_ then
						arg_573_1.duration_ = var_576_6 + var_576_0
					end
				end

				arg_573_1.text_.text = var_576_3
				arg_573_1.typewritter.percent = 0

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(false)
				arg_573_1:RecordContent(arg_573_1.text_.text)
			end

			local var_576_7 = math.max(var_576_1, arg_573_1.talkMaxDuration)

			if var_576_0 <= arg_573_1.time_ and arg_573_1.time_ < var_576_0 + var_576_7 then
				arg_573_1.typewritter.percent = (arg_573_1.time_ - var_576_0) / var_576_7

				arg_573_1.typewritter:SetDirty()
			end

			if arg_573_1.time_ >= var_576_0 + var_576_7 and arg_573_1.time_ < var_576_0 + var_576_7 + arg_576_0 then
				arg_573_1.typewritter.percent = 1

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(true)
			end
		end
	end,
	Play115301143 = function(arg_577_0, arg_577_1)
		arg_577_1.time_ = 0
		arg_577_1.frameCnt_ = 0
		arg_577_1.state_ = "playing"
		arg_577_1.curTalkId_ = 115301143
		arg_577_1.duration_ = 5

		SetActive(arg_577_1.tipsGo_, false)

		function arg_577_1.onSingleLineFinish_()
			arg_577_1.onSingleLineUpdate_ = nil
			arg_577_1.onSingleLineFinish_ = nil
			arg_577_1.state_ = "waiting"
		end

		function arg_577_1.playNext_(arg_579_0)
			if arg_579_0 == 1 then
				arg_577_0:Play115301144(arg_577_1)
			end
		end

		function arg_577_1.onSingleLineUpdate_(arg_580_0)
			local var_580_0 = 0
			local var_580_1 = 1.15

			if var_580_0 < arg_577_1.time_ and arg_577_1.time_ <= var_580_0 + arg_580_0 then
				arg_577_1.talkMaxDuration = 0
				arg_577_1.dialogCg_.alpha = 1

				arg_577_1.dialog_:SetActive(true)
				SetActive(arg_577_1.leftNameGo_, false)

				arg_577_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_577_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_577_1:RecordName(arg_577_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_577_1.iconTrs_.gameObject, false)
				arg_577_1.callingController_:SetSelectedState("normal")

				local var_580_2 = arg_577_1:GetWordFromCfg(115301143)
				local var_580_3 = arg_577_1:FormatText(var_580_2.content)

				arg_577_1.text_.text = var_580_3

				LuaForUtil.ClearLinePrefixSymbol(arg_577_1.text_)

				local var_580_4 = 46
				local var_580_5 = utf8.len(var_580_3)
				local var_580_6 = var_580_4 <= 0 and var_580_1 or var_580_1 * (var_580_5 / var_580_4)

				if var_580_6 > 0 and var_580_1 < var_580_6 then
					arg_577_1.talkMaxDuration = var_580_6

					if var_580_6 + var_580_0 > arg_577_1.duration_ then
						arg_577_1.duration_ = var_580_6 + var_580_0
					end
				end

				arg_577_1.text_.text = var_580_3
				arg_577_1.typewritter.percent = 0

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(false)
				arg_577_1:RecordContent(arg_577_1.text_.text)
			end

			local var_580_7 = math.max(var_580_1, arg_577_1.talkMaxDuration)

			if var_580_0 <= arg_577_1.time_ and arg_577_1.time_ < var_580_0 + var_580_7 then
				arg_577_1.typewritter.percent = (arg_577_1.time_ - var_580_0) / var_580_7

				arg_577_1.typewritter:SetDirty()
			end

			if arg_577_1.time_ >= var_580_0 + var_580_7 and arg_577_1.time_ < var_580_0 + var_580_7 + arg_580_0 then
				arg_577_1.typewritter.percent = 1

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(true)
			end
		end
	end,
	Play115301144 = function(arg_581_0, arg_581_1)
		arg_581_1.time_ = 0
		arg_581_1.frameCnt_ = 0
		arg_581_1.state_ = "playing"
		arg_581_1.curTalkId_ = 115301144
		arg_581_1.duration_ = 5

		SetActive(arg_581_1.tipsGo_, false)

		function arg_581_1.onSingleLineFinish_()
			arg_581_1.onSingleLineUpdate_ = nil
			arg_581_1.onSingleLineFinish_ = nil
			arg_581_1.state_ = "waiting"
		end

		function arg_581_1.playNext_(arg_583_0)
			if arg_583_0 == 1 then
				arg_581_0:Play115301145(arg_581_1)
			end
		end

		function arg_581_1.onSingleLineUpdate_(arg_584_0)
			local var_584_0 = 0
			local var_584_1 = 0.925

			if var_584_0 < arg_581_1.time_ and arg_581_1.time_ <= var_584_0 + arg_584_0 then
				arg_581_1.talkMaxDuration = 0
				arg_581_1.dialogCg_.alpha = 1

				arg_581_1.dialog_:SetActive(true)
				SetActive(arg_581_1.leftNameGo_, false)

				arg_581_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_581_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_581_1:RecordName(arg_581_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_581_1.iconTrs_.gameObject, false)
				arg_581_1.callingController_:SetSelectedState("normal")

				local var_584_2 = arg_581_1:GetWordFromCfg(115301144)
				local var_584_3 = arg_581_1:FormatText(var_584_2.content)

				arg_581_1.text_.text = var_584_3

				LuaForUtil.ClearLinePrefixSymbol(arg_581_1.text_)

				local var_584_4 = 37
				local var_584_5 = utf8.len(var_584_3)
				local var_584_6 = var_584_4 <= 0 and var_584_1 or var_584_1 * (var_584_5 / var_584_4)

				if var_584_6 > 0 and var_584_1 < var_584_6 then
					arg_581_1.talkMaxDuration = var_584_6

					if var_584_6 + var_584_0 > arg_581_1.duration_ then
						arg_581_1.duration_ = var_584_6 + var_584_0
					end
				end

				arg_581_1.text_.text = var_584_3
				arg_581_1.typewritter.percent = 0

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(false)
				arg_581_1:RecordContent(arg_581_1.text_.text)
			end

			local var_584_7 = math.max(var_584_1, arg_581_1.talkMaxDuration)

			if var_584_0 <= arg_581_1.time_ and arg_581_1.time_ < var_584_0 + var_584_7 then
				arg_581_1.typewritter.percent = (arg_581_1.time_ - var_584_0) / var_584_7

				arg_581_1.typewritter:SetDirty()
			end

			if arg_581_1.time_ >= var_584_0 + var_584_7 and arg_581_1.time_ < var_584_0 + var_584_7 + arg_584_0 then
				arg_581_1.typewritter.percent = 1

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(true)
			end
		end
	end,
	Play115301145 = function(arg_585_0, arg_585_1)
		arg_585_1.time_ = 0
		arg_585_1.frameCnt_ = 0
		arg_585_1.state_ = "playing"
		arg_585_1.curTalkId_ = 115301145
		arg_585_1.duration_ = 4.3

		local var_585_0 = {
			ja = 4.1,
			ko = 3.333,
			zh = 2.1,
			en = 4.3
		}
		local var_585_1 = manager.audio:GetLocalizationFlag()

		if var_585_0[var_585_1] ~= nil then
			arg_585_1.duration_ = var_585_0[var_585_1]
		end

		SetActive(arg_585_1.tipsGo_, false)

		function arg_585_1.onSingleLineFinish_()
			arg_585_1.onSingleLineUpdate_ = nil
			arg_585_1.onSingleLineFinish_ = nil
			arg_585_1.state_ = "waiting"
		end

		function arg_585_1.playNext_(arg_587_0)
			if arg_587_0 == 1 then
				arg_585_0:Play115301146(arg_585_1)
			end
		end

		function arg_585_1.onSingleLineUpdate_(arg_588_0)
			local var_588_0 = arg_585_1.actors_["10030"].transform
			local var_588_1 = 0

			if var_588_1 < arg_585_1.time_ and arg_585_1.time_ <= var_588_1 + arg_588_0 then
				arg_585_1.var_.moveOldPos10030 = var_588_0.localPosition
				var_588_0.localScale = Vector3.New(1, 1, 1)

				arg_585_1:CheckSpriteTmpPos("10030", 3)

				local var_588_2 = var_588_0.childCount

				for iter_588_0 = 0, var_588_2 - 1 do
					local var_588_3 = var_588_0:GetChild(iter_588_0)

					if var_588_3.name == "split_1" or not string.find(var_588_3.name, "split") then
						var_588_3.gameObject:SetActive(true)
					else
						var_588_3.gameObject:SetActive(false)
					end
				end
			end

			local var_588_4 = 0.001

			if var_588_1 <= arg_585_1.time_ and arg_585_1.time_ < var_588_1 + var_588_4 then
				local var_588_5 = (arg_585_1.time_ - var_588_1) / var_588_4
				local var_588_6 = Vector3.New(0, -390, 150)

				var_588_0.localPosition = Vector3.Lerp(arg_585_1.var_.moveOldPos10030, var_588_6, var_588_5)
			end

			if arg_585_1.time_ >= var_588_1 + var_588_4 and arg_585_1.time_ < var_588_1 + var_588_4 + arg_588_0 then
				var_588_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_588_7 = arg_585_1.actors_["10030"]
			local var_588_8 = 0

			if var_588_8 < arg_585_1.time_ and arg_585_1.time_ <= var_588_8 + arg_588_0 and arg_585_1.var_.actorSpriteComps10030 == nil then
				arg_585_1.var_.actorSpriteComps10030 = var_588_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_588_9 = 0.2

			if var_588_8 <= arg_585_1.time_ and arg_585_1.time_ < var_588_8 + var_588_9 then
				local var_588_10 = (arg_585_1.time_ - var_588_8) / var_588_9

				if arg_585_1.var_.actorSpriteComps10030 then
					for iter_588_1, iter_588_2 in pairs(arg_585_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_588_2 then
							local var_588_11 = Mathf.Lerp(iter_588_2.color.r, 1, var_588_10)

							iter_588_2.color = Color.New(var_588_11, var_588_11, var_588_11)
						end
					end
				end
			end

			if arg_585_1.time_ >= var_588_8 + var_588_9 and arg_585_1.time_ < var_588_8 + var_588_9 + arg_588_0 and arg_585_1.var_.actorSpriteComps10030 then
				local var_588_12 = 1

				for iter_588_3, iter_588_4 in pairs(arg_585_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_588_4 then
						iter_588_4.color = Color.New(var_588_12, var_588_12, var_588_12)
					end
				end

				arg_585_1.var_.actorSpriteComps10030 = nil
			end

			local var_588_13 = arg_585_1.actors_["10030"]
			local var_588_14 = 0

			if var_588_14 < arg_585_1.time_ and arg_585_1.time_ <= var_588_14 + arg_588_0 then
				local var_588_15 = var_588_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_588_15 then
					arg_585_1.var_.alphaOldValue10030 = var_588_15.alpha
					arg_585_1.var_.characterEffect10030 = var_588_15
				end

				arg_585_1.var_.alphaOldValue10030 = 0
			end

			local var_588_16 = 0.333333333333333

			if var_588_14 <= arg_585_1.time_ and arg_585_1.time_ < var_588_14 + var_588_16 then
				local var_588_17 = (arg_585_1.time_ - var_588_14) / var_588_16
				local var_588_18 = Mathf.Lerp(arg_585_1.var_.alphaOldValue10030, 1, var_588_17)

				if arg_585_1.var_.characterEffect10030 then
					arg_585_1.var_.characterEffect10030.alpha = var_588_18
				end
			end

			if arg_585_1.time_ >= var_588_14 + var_588_16 and arg_585_1.time_ < var_588_14 + var_588_16 + arg_588_0 and arg_585_1.var_.characterEffect10030 then
				arg_585_1.var_.characterEffect10030.alpha = 1
			end

			local var_588_19 = 0
			local var_588_20 = 0.25

			if var_588_19 < arg_585_1.time_ and arg_585_1.time_ <= var_588_19 + arg_588_0 then
				arg_585_1.talkMaxDuration = 0
				arg_585_1.dialogCg_.alpha = 1

				arg_585_1.dialog_:SetActive(true)
				SetActive(arg_585_1.leftNameGo_, true)

				local var_588_21 = arg_585_1:FormatText(StoryNameCfg[309].name)

				arg_585_1.leftNameTxt_.text = var_588_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_585_1.leftNameTxt_.transform)

				arg_585_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_585_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_585_1:RecordName(arg_585_1.leftNameTxt_.text)
				SetActive(arg_585_1.iconTrs_.gameObject, false)
				arg_585_1.callingController_:SetSelectedState("normal")

				local var_588_22 = arg_585_1:GetWordFromCfg(115301145)
				local var_588_23 = arg_585_1:FormatText(var_588_22.content)

				arg_585_1.text_.text = var_588_23

				LuaForUtil.ClearLinePrefixSymbol(arg_585_1.text_)

				local var_588_24 = 10
				local var_588_25 = utf8.len(var_588_23)
				local var_588_26 = var_588_24 <= 0 and var_588_20 or var_588_20 * (var_588_25 / var_588_24)

				if var_588_26 > 0 and var_588_20 < var_588_26 then
					arg_585_1.talkMaxDuration = var_588_26

					if var_588_26 + var_588_19 > arg_585_1.duration_ then
						arg_585_1.duration_ = var_588_26 + var_588_19
					end
				end

				arg_585_1.text_.text = var_588_23
				arg_585_1.typewritter.percent = 0

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301145", "story_v_out_115301.awb") ~= 0 then
					local var_588_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301145", "story_v_out_115301.awb") / 1000

					if var_588_27 + var_588_19 > arg_585_1.duration_ then
						arg_585_1.duration_ = var_588_27 + var_588_19
					end

					if var_588_22.prefab_name ~= "" and arg_585_1.actors_[var_588_22.prefab_name] ~= nil then
						local var_588_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_585_1.actors_[var_588_22.prefab_name].transform, "story_v_out_115301", "115301145", "story_v_out_115301.awb")

						arg_585_1:RecordAudio("115301145", var_588_28)
						arg_585_1:RecordAudio("115301145", var_588_28)
					else
						arg_585_1:AudioAction("play", "voice", "story_v_out_115301", "115301145", "story_v_out_115301.awb")
					end

					arg_585_1:RecordHistoryTalkVoice("story_v_out_115301", "115301145", "story_v_out_115301.awb")
				end

				arg_585_1:RecordContent(arg_585_1.text_.text)
			end

			local var_588_29 = math.max(var_588_20, arg_585_1.talkMaxDuration)

			if var_588_19 <= arg_585_1.time_ and arg_585_1.time_ < var_588_19 + var_588_29 then
				arg_585_1.typewritter.percent = (arg_585_1.time_ - var_588_19) / var_588_29

				arg_585_1.typewritter:SetDirty()
			end

			if arg_585_1.time_ >= var_588_19 + var_588_29 and arg_585_1.time_ < var_588_19 + var_588_29 + arg_588_0 then
				arg_585_1.typewritter.percent = 1

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(true)
			end
		end
	end,
	Play115301146 = function(arg_589_0, arg_589_1)
		arg_589_1.time_ = 0
		arg_589_1.frameCnt_ = 0
		arg_589_1.state_ = "playing"
		arg_589_1.curTalkId_ = 115301146
		arg_589_1.duration_ = 5

		SetActive(arg_589_1.tipsGo_, false)

		function arg_589_1.onSingleLineFinish_()
			arg_589_1.onSingleLineUpdate_ = nil
			arg_589_1.onSingleLineFinish_ = nil
			arg_589_1.state_ = "waiting"
		end

		function arg_589_1.playNext_(arg_591_0)
			if arg_591_0 == 1 then
				arg_589_0:Play115301147(arg_589_1)
			end
		end

		function arg_589_1.onSingleLineUpdate_(arg_592_0)
			local var_592_0 = arg_589_1.actors_["10030"]
			local var_592_1 = 0

			if var_592_1 < arg_589_1.time_ and arg_589_1.time_ <= var_592_1 + arg_592_0 then
				local var_592_2 = var_592_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_592_2 then
					arg_589_1.var_.alphaOldValue10030 = var_592_2.alpha
					arg_589_1.var_.characterEffect10030 = var_592_2
				end

				arg_589_1.var_.alphaOldValue10030 = 1
			end

			local var_592_3 = 0.333333333333333

			if var_592_1 <= arg_589_1.time_ and arg_589_1.time_ < var_592_1 + var_592_3 then
				local var_592_4 = (arg_589_1.time_ - var_592_1) / var_592_3
				local var_592_5 = Mathf.Lerp(arg_589_1.var_.alphaOldValue10030, 0, var_592_4)

				if arg_589_1.var_.characterEffect10030 then
					arg_589_1.var_.characterEffect10030.alpha = var_592_5
				end
			end

			if arg_589_1.time_ >= var_592_1 + var_592_3 and arg_589_1.time_ < var_592_1 + var_592_3 + arg_592_0 and arg_589_1.var_.characterEffect10030 then
				arg_589_1.var_.characterEffect10030.alpha = 0
			end

			local var_592_6 = 0
			local var_592_7 = 0.7

			if var_592_6 < arg_589_1.time_ and arg_589_1.time_ <= var_592_6 + arg_592_0 then
				arg_589_1.talkMaxDuration = 0
				arg_589_1.dialogCg_.alpha = 1

				arg_589_1.dialog_:SetActive(true)
				SetActive(arg_589_1.leftNameGo_, false)

				arg_589_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_589_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_589_1:RecordName(arg_589_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_589_1.iconTrs_.gameObject, false)
				arg_589_1.callingController_:SetSelectedState("normal")

				local var_592_8 = arg_589_1:GetWordFromCfg(115301146)
				local var_592_9 = arg_589_1:FormatText(var_592_8.content)

				arg_589_1.text_.text = var_592_9

				LuaForUtil.ClearLinePrefixSymbol(arg_589_1.text_)

				local var_592_10 = 28
				local var_592_11 = utf8.len(var_592_9)
				local var_592_12 = var_592_10 <= 0 and var_592_7 or var_592_7 * (var_592_11 / var_592_10)

				if var_592_12 > 0 and var_592_7 < var_592_12 then
					arg_589_1.talkMaxDuration = var_592_12

					if var_592_12 + var_592_6 > arg_589_1.duration_ then
						arg_589_1.duration_ = var_592_12 + var_592_6
					end
				end

				arg_589_1.text_.text = var_592_9
				arg_589_1.typewritter.percent = 0

				arg_589_1.typewritter:SetDirty()
				arg_589_1:ShowNextGo(false)
				arg_589_1:RecordContent(arg_589_1.text_.text)
			end

			local var_592_13 = math.max(var_592_7, arg_589_1.talkMaxDuration)

			if var_592_6 <= arg_589_1.time_ and arg_589_1.time_ < var_592_6 + var_592_13 then
				arg_589_1.typewritter.percent = (arg_589_1.time_ - var_592_6) / var_592_13

				arg_589_1.typewritter:SetDirty()
			end

			if arg_589_1.time_ >= var_592_6 + var_592_13 and arg_589_1.time_ < var_592_6 + var_592_13 + arg_592_0 then
				arg_589_1.typewritter.percent = 1

				arg_589_1.typewritter:SetDirty()
				arg_589_1:ShowNextGo(true)
			end
		end
	end,
	Play115301147 = function(arg_593_0, arg_593_1)
		arg_593_1.time_ = 0
		arg_593_1.frameCnt_ = 0
		arg_593_1.state_ = "playing"
		arg_593_1.curTalkId_ = 115301147
		arg_593_1.duration_ = 8

		local var_593_0 = {
			ja = 8,
			ko = 4.966,
			zh = 5.266,
			en = 4.9
		}
		local var_593_1 = manager.audio:GetLocalizationFlag()

		if var_593_0[var_593_1] ~= nil then
			arg_593_1.duration_ = var_593_0[var_593_1]
		end

		SetActive(arg_593_1.tipsGo_, false)

		function arg_593_1.onSingleLineFinish_()
			arg_593_1.onSingleLineUpdate_ = nil
			arg_593_1.onSingleLineFinish_ = nil
			arg_593_1.state_ = "waiting"
		end

		function arg_593_1.playNext_(arg_595_0)
			if arg_595_0 == 1 then
				arg_593_0:Play115301148(arg_593_1)
			end
		end

		function arg_593_1.onSingleLineUpdate_(arg_596_0)
			local var_596_0 = arg_593_1.actors_["10030"].transform
			local var_596_1 = 0

			if var_596_1 < arg_593_1.time_ and arg_593_1.time_ <= var_596_1 + arg_596_0 then
				arg_593_1.var_.moveOldPos10030 = var_596_0.localPosition
				var_596_0.localScale = Vector3.New(1, 1, 1)

				arg_593_1:CheckSpriteTmpPos("10030", 3)

				local var_596_2 = var_596_0.childCount

				for iter_596_0 = 0, var_596_2 - 1 do
					local var_596_3 = var_596_0:GetChild(iter_596_0)

					if var_596_3.name == "split_3" or not string.find(var_596_3.name, "split") then
						var_596_3.gameObject:SetActive(true)
					else
						var_596_3.gameObject:SetActive(false)
					end
				end
			end

			local var_596_4 = 0.001

			if var_596_1 <= arg_593_1.time_ and arg_593_1.time_ < var_596_1 + var_596_4 then
				local var_596_5 = (arg_593_1.time_ - var_596_1) / var_596_4
				local var_596_6 = Vector3.New(0, -390, 150)

				var_596_0.localPosition = Vector3.Lerp(arg_593_1.var_.moveOldPos10030, var_596_6, var_596_5)
			end

			if arg_593_1.time_ >= var_596_1 + var_596_4 and arg_593_1.time_ < var_596_1 + var_596_4 + arg_596_0 then
				var_596_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_596_7 = arg_593_1.actors_["10030"]
			local var_596_8 = 0

			if var_596_8 < arg_593_1.time_ and arg_593_1.time_ <= var_596_8 + arg_596_0 then
				local var_596_9 = var_596_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_596_9 then
					arg_593_1.var_.alphaOldValue10030 = var_596_9.alpha
					arg_593_1.var_.characterEffect10030 = var_596_9
				end

				arg_593_1.var_.alphaOldValue10030 = 0
			end

			local var_596_10 = 0.333333333333333

			if var_596_8 <= arg_593_1.time_ and arg_593_1.time_ < var_596_8 + var_596_10 then
				local var_596_11 = (arg_593_1.time_ - var_596_8) / var_596_10
				local var_596_12 = Mathf.Lerp(arg_593_1.var_.alphaOldValue10030, 1, var_596_11)

				if arg_593_1.var_.characterEffect10030 then
					arg_593_1.var_.characterEffect10030.alpha = var_596_12
				end
			end

			if arg_593_1.time_ >= var_596_8 + var_596_10 and arg_593_1.time_ < var_596_8 + var_596_10 + arg_596_0 and arg_593_1.var_.characterEffect10030 then
				arg_593_1.var_.characterEffect10030.alpha = 1
			end

			local var_596_13 = 0
			local var_596_14 = 0.45

			if var_596_13 < arg_593_1.time_ and arg_593_1.time_ <= var_596_13 + arg_596_0 then
				arg_593_1.talkMaxDuration = 0
				arg_593_1.dialogCg_.alpha = 1

				arg_593_1.dialog_:SetActive(true)
				SetActive(arg_593_1.leftNameGo_, true)

				local var_596_15 = arg_593_1:FormatText(StoryNameCfg[309].name)

				arg_593_1.leftNameTxt_.text = var_596_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_593_1.leftNameTxt_.transform)

				arg_593_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_593_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_593_1:RecordName(arg_593_1.leftNameTxt_.text)
				SetActive(arg_593_1.iconTrs_.gameObject, false)
				arg_593_1.callingController_:SetSelectedState("normal")

				local var_596_16 = arg_593_1:GetWordFromCfg(115301147)
				local var_596_17 = arg_593_1:FormatText(var_596_16.content)

				arg_593_1.text_.text = var_596_17

				LuaForUtil.ClearLinePrefixSymbol(arg_593_1.text_)

				local var_596_18 = 18
				local var_596_19 = utf8.len(var_596_17)
				local var_596_20 = var_596_18 <= 0 and var_596_14 or var_596_14 * (var_596_19 / var_596_18)

				if var_596_20 > 0 and var_596_14 < var_596_20 then
					arg_593_1.talkMaxDuration = var_596_20

					if var_596_20 + var_596_13 > arg_593_1.duration_ then
						arg_593_1.duration_ = var_596_20 + var_596_13
					end
				end

				arg_593_1.text_.text = var_596_17
				arg_593_1.typewritter.percent = 0

				arg_593_1.typewritter:SetDirty()
				arg_593_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301147", "story_v_out_115301.awb") ~= 0 then
					local var_596_21 = manager.audio:GetVoiceLength("story_v_out_115301", "115301147", "story_v_out_115301.awb") / 1000

					if var_596_21 + var_596_13 > arg_593_1.duration_ then
						arg_593_1.duration_ = var_596_21 + var_596_13
					end

					if var_596_16.prefab_name ~= "" and arg_593_1.actors_[var_596_16.prefab_name] ~= nil then
						local var_596_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_593_1.actors_[var_596_16.prefab_name].transform, "story_v_out_115301", "115301147", "story_v_out_115301.awb")

						arg_593_1:RecordAudio("115301147", var_596_22)
						arg_593_1:RecordAudio("115301147", var_596_22)
					else
						arg_593_1:AudioAction("play", "voice", "story_v_out_115301", "115301147", "story_v_out_115301.awb")
					end

					arg_593_1:RecordHistoryTalkVoice("story_v_out_115301", "115301147", "story_v_out_115301.awb")
				end

				arg_593_1:RecordContent(arg_593_1.text_.text)
			end

			local var_596_23 = math.max(var_596_14, arg_593_1.talkMaxDuration)

			if var_596_13 <= arg_593_1.time_ and arg_593_1.time_ < var_596_13 + var_596_23 then
				arg_593_1.typewritter.percent = (arg_593_1.time_ - var_596_13) / var_596_23

				arg_593_1.typewritter:SetDirty()
			end

			if arg_593_1.time_ >= var_596_13 + var_596_23 and arg_593_1.time_ < var_596_13 + var_596_23 + arg_596_0 then
				arg_593_1.typewritter.percent = 1

				arg_593_1.typewritter:SetDirty()
				arg_593_1:ShowNextGo(true)
			end
		end
	end,
	Play115301148 = function(arg_597_0, arg_597_1)
		arg_597_1.time_ = 0
		arg_597_1.frameCnt_ = 0
		arg_597_1.state_ = "playing"
		arg_597_1.curTalkId_ = 115301148
		arg_597_1.duration_ = 5

		SetActive(arg_597_1.tipsGo_, false)

		function arg_597_1.onSingleLineFinish_()
			arg_597_1.onSingleLineUpdate_ = nil
			arg_597_1.onSingleLineFinish_ = nil
			arg_597_1.state_ = "waiting"
		end

		function arg_597_1.playNext_(arg_599_0)
			if arg_599_0 == 1 then
				arg_597_0:Play115301149(arg_597_1)
			end
		end

		function arg_597_1.onSingleLineUpdate_(arg_600_0)
			local var_600_0 = arg_597_1.actors_["10030"]
			local var_600_1 = 0

			if var_600_1 < arg_597_1.time_ and arg_597_1.time_ <= var_600_1 + arg_600_0 then
				local var_600_2 = var_600_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_600_2 then
					arg_597_1.var_.alphaOldValue10030 = var_600_2.alpha
					arg_597_1.var_.characterEffect10030 = var_600_2
				end

				arg_597_1.var_.alphaOldValue10030 = 1
			end

			local var_600_3 = 0.333333333333333

			if var_600_1 <= arg_597_1.time_ and arg_597_1.time_ < var_600_1 + var_600_3 then
				local var_600_4 = (arg_597_1.time_ - var_600_1) / var_600_3
				local var_600_5 = Mathf.Lerp(arg_597_1.var_.alphaOldValue10030, 0, var_600_4)

				if arg_597_1.var_.characterEffect10030 then
					arg_597_1.var_.characterEffect10030.alpha = var_600_5
				end
			end

			if arg_597_1.time_ >= var_600_1 + var_600_3 and arg_597_1.time_ < var_600_1 + var_600_3 + arg_600_0 and arg_597_1.var_.characterEffect10030 then
				arg_597_1.var_.characterEffect10030.alpha = 0
			end

			local var_600_6 = 0
			local var_600_7 = 0.75

			if var_600_6 < arg_597_1.time_ and arg_597_1.time_ <= var_600_6 + arg_600_0 then
				arg_597_1.talkMaxDuration = 0
				arg_597_1.dialogCg_.alpha = 1

				arg_597_1.dialog_:SetActive(true)
				SetActive(arg_597_1.leftNameGo_, false)

				arg_597_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_597_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_597_1:RecordName(arg_597_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_597_1.iconTrs_.gameObject, false)
				arg_597_1.callingController_:SetSelectedState("normal")

				local var_600_8 = arg_597_1:GetWordFromCfg(115301148)
				local var_600_9 = arg_597_1:FormatText(var_600_8.content)

				arg_597_1.text_.text = var_600_9

				LuaForUtil.ClearLinePrefixSymbol(arg_597_1.text_)

				local var_600_10 = 30
				local var_600_11 = utf8.len(var_600_9)
				local var_600_12 = var_600_10 <= 0 and var_600_7 or var_600_7 * (var_600_11 / var_600_10)

				if var_600_12 > 0 and var_600_7 < var_600_12 then
					arg_597_1.talkMaxDuration = var_600_12

					if var_600_12 + var_600_6 > arg_597_1.duration_ then
						arg_597_1.duration_ = var_600_12 + var_600_6
					end
				end

				arg_597_1.text_.text = var_600_9
				arg_597_1.typewritter.percent = 0

				arg_597_1.typewritter:SetDirty()
				arg_597_1:ShowNextGo(false)
				arg_597_1:RecordContent(arg_597_1.text_.text)
			end

			local var_600_13 = math.max(var_600_7, arg_597_1.talkMaxDuration)

			if var_600_6 <= arg_597_1.time_ and arg_597_1.time_ < var_600_6 + var_600_13 then
				arg_597_1.typewritter.percent = (arg_597_1.time_ - var_600_6) / var_600_13

				arg_597_1.typewritter:SetDirty()
			end

			if arg_597_1.time_ >= var_600_6 + var_600_13 and arg_597_1.time_ < var_600_6 + var_600_13 + arg_600_0 then
				arg_597_1.typewritter.percent = 1

				arg_597_1.typewritter:SetDirty()
				arg_597_1:ShowNextGo(true)
			end
		end
	end,
	Play115301149 = function(arg_601_0, arg_601_1)
		arg_601_1.time_ = 0
		arg_601_1.frameCnt_ = 0
		arg_601_1.state_ = "playing"
		arg_601_1.curTalkId_ = 115301149
		arg_601_1.duration_ = 3.4

		local var_601_0 = {
			ja = 3.4,
			ko = 1.9,
			zh = 1.666,
			en = 2.866
		}
		local var_601_1 = manager.audio:GetLocalizationFlag()

		if var_601_0[var_601_1] ~= nil then
			arg_601_1.duration_ = var_601_0[var_601_1]
		end

		SetActive(arg_601_1.tipsGo_, false)

		function arg_601_1.onSingleLineFinish_()
			arg_601_1.onSingleLineUpdate_ = nil
			arg_601_1.onSingleLineFinish_ = nil
			arg_601_1.state_ = "waiting"
		end

		function arg_601_1.playNext_(arg_603_0)
			if arg_603_0 == 1 then
				arg_601_0:Play115301150(arg_601_1)
			end
		end

		function arg_601_1.onSingleLineUpdate_(arg_604_0)
			local var_604_0 = arg_601_1.actors_["10030"].transform
			local var_604_1 = 0

			if var_604_1 < arg_601_1.time_ and arg_601_1.time_ <= var_604_1 + arg_604_0 then
				arg_601_1.var_.moveOldPos10030 = var_604_0.localPosition
				var_604_0.localScale = Vector3.New(1, 1, 1)

				arg_601_1:CheckSpriteTmpPos("10030", 3)

				local var_604_2 = var_604_0.childCount

				for iter_604_0 = 0, var_604_2 - 1 do
					local var_604_3 = var_604_0:GetChild(iter_604_0)

					if var_604_3.name == "split_3" or not string.find(var_604_3.name, "split") then
						var_604_3.gameObject:SetActive(true)
					else
						var_604_3.gameObject:SetActive(false)
					end
				end
			end

			local var_604_4 = 0.001

			if var_604_1 <= arg_601_1.time_ and arg_601_1.time_ < var_604_1 + var_604_4 then
				local var_604_5 = (arg_601_1.time_ - var_604_1) / var_604_4
				local var_604_6 = Vector3.New(0, -390, 150)

				var_604_0.localPosition = Vector3.Lerp(arg_601_1.var_.moveOldPos10030, var_604_6, var_604_5)
			end

			if arg_601_1.time_ >= var_604_1 + var_604_4 and arg_601_1.time_ < var_604_1 + var_604_4 + arg_604_0 then
				var_604_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_604_7 = arg_601_1.actors_["10030"]
			local var_604_8 = 0

			if var_604_8 < arg_601_1.time_ and arg_601_1.time_ <= var_604_8 + arg_604_0 then
				local var_604_9 = var_604_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_604_9 then
					arg_601_1.var_.alphaOldValue10030 = var_604_9.alpha
					arg_601_1.var_.characterEffect10030 = var_604_9
				end

				arg_601_1.var_.alphaOldValue10030 = 0
			end

			local var_604_10 = 0.333333333333333

			if var_604_8 <= arg_601_1.time_ and arg_601_1.time_ < var_604_8 + var_604_10 then
				local var_604_11 = (arg_601_1.time_ - var_604_8) / var_604_10
				local var_604_12 = Mathf.Lerp(arg_601_1.var_.alphaOldValue10030, 1, var_604_11)

				if arg_601_1.var_.characterEffect10030 then
					arg_601_1.var_.characterEffect10030.alpha = var_604_12
				end
			end

			if arg_601_1.time_ >= var_604_8 + var_604_10 and arg_601_1.time_ < var_604_8 + var_604_10 + arg_604_0 and arg_601_1.var_.characterEffect10030 then
				arg_601_1.var_.characterEffect10030.alpha = 1
			end

			local var_604_13 = 0
			local var_604_14 = 0.15

			if var_604_13 < arg_601_1.time_ and arg_601_1.time_ <= var_604_13 + arg_604_0 then
				arg_601_1.talkMaxDuration = 0
				arg_601_1.dialogCg_.alpha = 1

				arg_601_1.dialog_:SetActive(true)
				SetActive(arg_601_1.leftNameGo_, true)

				local var_604_15 = arg_601_1:FormatText(StoryNameCfg[309].name)

				arg_601_1.leftNameTxt_.text = var_604_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_601_1.leftNameTxt_.transform)

				arg_601_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_601_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_601_1:RecordName(arg_601_1.leftNameTxt_.text)
				SetActive(arg_601_1.iconTrs_.gameObject, false)
				arg_601_1.callingController_:SetSelectedState("normal")

				local var_604_16 = arg_601_1:GetWordFromCfg(115301149)
				local var_604_17 = arg_601_1:FormatText(var_604_16.content)

				arg_601_1.text_.text = var_604_17

				LuaForUtil.ClearLinePrefixSymbol(arg_601_1.text_)

				local var_604_18 = 6
				local var_604_19 = utf8.len(var_604_17)
				local var_604_20 = var_604_18 <= 0 and var_604_14 or var_604_14 * (var_604_19 / var_604_18)

				if var_604_20 > 0 and var_604_14 < var_604_20 then
					arg_601_1.talkMaxDuration = var_604_20

					if var_604_20 + var_604_13 > arg_601_1.duration_ then
						arg_601_1.duration_ = var_604_20 + var_604_13
					end
				end

				arg_601_1.text_.text = var_604_17
				arg_601_1.typewritter.percent = 0

				arg_601_1.typewritter:SetDirty()
				arg_601_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301149", "story_v_out_115301.awb") ~= 0 then
					local var_604_21 = manager.audio:GetVoiceLength("story_v_out_115301", "115301149", "story_v_out_115301.awb") / 1000

					if var_604_21 + var_604_13 > arg_601_1.duration_ then
						arg_601_1.duration_ = var_604_21 + var_604_13
					end

					if var_604_16.prefab_name ~= "" and arg_601_1.actors_[var_604_16.prefab_name] ~= nil then
						local var_604_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_601_1.actors_[var_604_16.prefab_name].transform, "story_v_out_115301", "115301149", "story_v_out_115301.awb")

						arg_601_1:RecordAudio("115301149", var_604_22)
						arg_601_1:RecordAudio("115301149", var_604_22)
					else
						arg_601_1:AudioAction("play", "voice", "story_v_out_115301", "115301149", "story_v_out_115301.awb")
					end

					arg_601_1:RecordHistoryTalkVoice("story_v_out_115301", "115301149", "story_v_out_115301.awb")
				end

				arg_601_1:RecordContent(arg_601_1.text_.text)
			end

			local var_604_23 = math.max(var_604_14, arg_601_1.talkMaxDuration)

			if var_604_13 <= arg_601_1.time_ and arg_601_1.time_ < var_604_13 + var_604_23 then
				arg_601_1.typewritter.percent = (arg_601_1.time_ - var_604_13) / var_604_23

				arg_601_1.typewritter:SetDirty()
			end

			if arg_601_1.time_ >= var_604_13 + var_604_23 and arg_601_1.time_ < var_604_13 + var_604_23 + arg_604_0 then
				arg_601_1.typewritter.percent = 1

				arg_601_1.typewritter:SetDirty()
				arg_601_1:ShowNextGo(true)
			end
		end
	end,
	Play115301150 = function(arg_605_0, arg_605_1)
		arg_605_1.time_ = 0
		arg_605_1.frameCnt_ = 0
		arg_605_1.state_ = "playing"
		arg_605_1.curTalkId_ = 115301150
		arg_605_1.duration_ = 5

		SetActive(arg_605_1.tipsGo_, false)

		function arg_605_1.onSingleLineFinish_()
			arg_605_1.onSingleLineUpdate_ = nil
			arg_605_1.onSingleLineFinish_ = nil
			arg_605_1.state_ = "waiting"
		end

		function arg_605_1.playNext_(arg_607_0)
			if arg_607_0 == 1 then
				arg_605_0:Play115301151(arg_605_1)
			end
		end

		function arg_605_1.onSingleLineUpdate_(arg_608_0)
			local var_608_0 = arg_605_1.actors_["10030"]
			local var_608_1 = 0

			if var_608_1 < arg_605_1.time_ and arg_605_1.time_ <= var_608_1 + arg_608_0 then
				local var_608_2 = var_608_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_608_2 then
					arg_605_1.var_.alphaOldValue10030 = var_608_2.alpha
					arg_605_1.var_.characterEffect10030 = var_608_2
				end

				arg_605_1.var_.alphaOldValue10030 = 1
			end

			local var_608_3 = 0.333333333333333

			if var_608_1 <= arg_605_1.time_ and arg_605_1.time_ < var_608_1 + var_608_3 then
				local var_608_4 = (arg_605_1.time_ - var_608_1) / var_608_3
				local var_608_5 = Mathf.Lerp(arg_605_1.var_.alphaOldValue10030, 0, var_608_4)

				if arg_605_1.var_.characterEffect10030 then
					arg_605_1.var_.characterEffect10030.alpha = var_608_5
				end
			end

			if arg_605_1.time_ >= var_608_1 + var_608_3 and arg_605_1.time_ < var_608_1 + var_608_3 + arg_608_0 and arg_605_1.var_.characterEffect10030 then
				arg_605_1.var_.characterEffect10030.alpha = 0
			end

			local var_608_6 = 0
			local var_608_7 = 0.875

			if var_608_6 < arg_605_1.time_ and arg_605_1.time_ <= var_608_6 + arg_608_0 then
				arg_605_1.talkMaxDuration = 0
				arg_605_1.dialogCg_.alpha = 1

				arg_605_1.dialog_:SetActive(true)
				SetActive(arg_605_1.leftNameGo_, false)

				arg_605_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_605_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_605_1:RecordName(arg_605_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_605_1.iconTrs_.gameObject, false)
				arg_605_1.callingController_:SetSelectedState("normal")

				local var_608_8 = arg_605_1:GetWordFromCfg(115301150)
				local var_608_9 = arg_605_1:FormatText(var_608_8.content)

				arg_605_1.text_.text = var_608_9

				LuaForUtil.ClearLinePrefixSymbol(arg_605_1.text_)

				local var_608_10 = 35
				local var_608_11 = utf8.len(var_608_9)
				local var_608_12 = var_608_10 <= 0 and var_608_7 or var_608_7 * (var_608_11 / var_608_10)

				if var_608_12 > 0 and var_608_7 < var_608_12 then
					arg_605_1.talkMaxDuration = var_608_12

					if var_608_12 + var_608_6 > arg_605_1.duration_ then
						arg_605_1.duration_ = var_608_12 + var_608_6
					end
				end

				arg_605_1.text_.text = var_608_9
				arg_605_1.typewritter.percent = 0

				arg_605_1.typewritter:SetDirty()
				arg_605_1:ShowNextGo(false)
				arg_605_1:RecordContent(arg_605_1.text_.text)
			end

			local var_608_13 = math.max(var_608_7, arg_605_1.talkMaxDuration)

			if var_608_6 <= arg_605_1.time_ and arg_605_1.time_ < var_608_6 + var_608_13 then
				arg_605_1.typewritter.percent = (arg_605_1.time_ - var_608_6) / var_608_13

				arg_605_1.typewritter:SetDirty()
			end

			if arg_605_1.time_ >= var_608_6 + var_608_13 and arg_605_1.time_ < var_608_6 + var_608_13 + arg_608_0 then
				arg_605_1.typewritter.percent = 1

				arg_605_1.typewritter:SetDirty()
				arg_605_1:ShowNextGo(true)
			end
		end
	end,
	Play115301151 = function(arg_609_0, arg_609_1)
		arg_609_1.time_ = 0
		arg_609_1.frameCnt_ = 0
		arg_609_1.state_ = "playing"
		arg_609_1.curTalkId_ = 115301151
		arg_609_1.duration_ = 5.166

		local var_609_0 = {
			ja = 3.866,
			ko = 5.166,
			zh = 4.6,
			en = 4.466
		}
		local var_609_1 = manager.audio:GetLocalizationFlag()

		if var_609_0[var_609_1] ~= nil then
			arg_609_1.duration_ = var_609_0[var_609_1]
		end

		SetActive(arg_609_1.tipsGo_, false)

		function arg_609_1.onSingleLineFinish_()
			arg_609_1.onSingleLineUpdate_ = nil
			arg_609_1.onSingleLineFinish_ = nil
			arg_609_1.state_ = "waiting"
		end

		function arg_609_1.playNext_(arg_611_0)
			if arg_611_0 == 1 then
				arg_609_0:Play115301152(arg_609_1)
			end
		end

		function arg_609_1.onSingleLineUpdate_(arg_612_0)
			local var_612_0 = arg_609_1.actors_["10030"].transform
			local var_612_1 = 0

			if var_612_1 < arg_609_1.time_ and arg_609_1.time_ <= var_612_1 + arg_612_0 then
				arg_609_1.var_.moveOldPos10030 = var_612_0.localPosition
				var_612_0.localScale = Vector3.New(1, 1, 1)

				arg_609_1:CheckSpriteTmpPos("10030", 3)

				local var_612_2 = var_612_0.childCount

				for iter_612_0 = 0, var_612_2 - 1 do
					local var_612_3 = var_612_0:GetChild(iter_612_0)

					if var_612_3.name == "split_2" or not string.find(var_612_3.name, "split") then
						var_612_3.gameObject:SetActive(true)
					else
						var_612_3.gameObject:SetActive(false)
					end
				end
			end

			local var_612_4 = 0.001

			if var_612_1 <= arg_609_1.time_ and arg_609_1.time_ < var_612_1 + var_612_4 then
				local var_612_5 = (arg_609_1.time_ - var_612_1) / var_612_4
				local var_612_6 = Vector3.New(0, -390, 150)

				var_612_0.localPosition = Vector3.Lerp(arg_609_1.var_.moveOldPos10030, var_612_6, var_612_5)
			end

			if arg_609_1.time_ >= var_612_1 + var_612_4 and arg_609_1.time_ < var_612_1 + var_612_4 + arg_612_0 then
				var_612_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_612_7 = arg_609_1.actors_["10030"]
			local var_612_8 = 0

			if var_612_8 < arg_609_1.time_ and arg_609_1.time_ <= var_612_8 + arg_612_0 then
				local var_612_9 = var_612_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_612_9 then
					arg_609_1.var_.alphaOldValue10030 = var_612_9.alpha
					arg_609_1.var_.characterEffect10030 = var_612_9
				end

				arg_609_1.var_.alphaOldValue10030 = 0
			end

			local var_612_10 = 0.333333333333333

			if var_612_8 <= arg_609_1.time_ and arg_609_1.time_ < var_612_8 + var_612_10 then
				local var_612_11 = (arg_609_1.time_ - var_612_8) / var_612_10
				local var_612_12 = Mathf.Lerp(arg_609_1.var_.alphaOldValue10030, 1, var_612_11)

				if arg_609_1.var_.characterEffect10030 then
					arg_609_1.var_.characterEffect10030.alpha = var_612_12
				end
			end

			if arg_609_1.time_ >= var_612_8 + var_612_10 and arg_609_1.time_ < var_612_8 + var_612_10 + arg_612_0 and arg_609_1.var_.characterEffect10030 then
				arg_609_1.var_.characterEffect10030.alpha = 1
			end

			local var_612_13 = 0
			local var_612_14 = 0.275

			if var_612_13 < arg_609_1.time_ and arg_609_1.time_ <= var_612_13 + arg_612_0 then
				arg_609_1.talkMaxDuration = 0
				arg_609_1.dialogCg_.alpha = 1

				arg_609_1.dialog_:SetActive(true)
				SetActive(arg_609_1.leftNameGo_, true)

				local var_612_15 = arg_609_1:FormatText(StoryNameCfg[309].name)

				arg_609_1.leftNameTxt_.text = var_612_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_609_1.leftNameTxt_.transform)

				arg_609_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_609_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_609_1:RecordName(arg_609_1.leftNameTxt_.text)
				SetActive(arg_609_1.iconTrs_.gameObject, false)
				arg_609_1.callingController_:SetSelectedState("normal")

				local var_612_16 = arg_609_1:GetWordFromCfg(115301151)
				local var_612_17 = arg_609_1:FormatText(var_612_16.content)

				arg_609_1.text_.text = var_612_17

				LuaForUtil.ClearLinePrefixSymbol(arg_609_1.text_)

				local var_612_18 = 11
				local var_612_19 = utf8.len(var_612_17)
				local var_612_20 = var_612_18 <= 0 and var_612_14 or var_612_14 * (var_612_19 / var_612_18)

				if var_612_20 > 0 and var_612_14 < var_612_20 then
					arg_609_1.talkMaxDuration = var_612_20

					if var_612_20 + var_612_13 > arg_609_1.duration_ then
						arg_609_1.duration_ = var_612_20 + var_612_13
					end
				end

				arg_609_1.text_.text = var_612_17
				arg_609_1.typewritter.percent = 0

				arg_609_1.typewritter:SetDirty()
				arg_609_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301151", "story_v_out_115301.awb") ~= 0 then
					local var_612_21 = manager.audio:GetVoiceLength("story_v_out_115301", "115301151", "story_v_out_115301.awb") / 1000

					if var_612_21 + var_612_13 > arg_609_1.duration_ then
						arg_609_1.duration_ = var_612_21 + var_612_13
					end

					if var_612_16.prefab_name ~= "" and arg_609_1.actors_[var_612_16.prefab_name] ~= nil then
						local var_612_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_609_1.actors_[var_612_16.prefab_name].transform, "story_v_out_115301", "115301151", "story_v_out_115301.awb")

						arg_609_1:RecordAudio("115301151", var_612_22)
						arg_609_1:RecordAudio("115301151", var_612_22)
					else
						arg_609_1:AudioAction("play", "voice", "story_v_out_115301", "115301151", "story_v_out_115301.awb")
					end

					arg_609_1:RecordHistoryTalkVoice("story_v_out_115301", "115301151", "story_v_out_115301.awb")
				end

				arg_609_1:RecordContent(arg_609_1.text_.text)
			end

			local var_612_23 = math.max(var_612_14, arg_609_1.talkMaxDuration)

			if var_612_13 <= arg_609_1.time_ and arg_609_1.time_ < var_612_13 + var_612_23 then
				arg_609_1.typewritter.percent = (arg_609_1.time_ - var_612_13) / var_612_23

				arg_609_1.typewritter:SetDirty()
			end

			if arg_609_1.time_ >= var_612_13 + var_612_23 and arg_609_1.time_ < var_612_13 + var_612_23 + arg_612_0 then
				arg_609_1.typewritter.percent = 1

				arg_609_1.typewritter:SetDirty()
				arg_609_1:ShowNextGo(true)
			end
		end
	end,
	Play115301152 = function(arg_613_0, arg_613_1)
		arg_613_1.time_ = 0
		arg_613_1.frameCnt_ = 0
		arg_613_1.state_ = "playing"
		arg_613_1.curTalkId_ = 115301152
		arg_613_1.duration_ = 5

		SetActive(arg_613_1.tipsGo_, false)

		function arg_613_1.onSingleLineFinish_()
			arg_613_1.onSingleLineUpdate_ = nil
			arg_613_1.onSingleLineFinish_ = nil
			arg_613_1.state_ = "waiting"
		end

		function arg_613_1.playNext_(arg_615_0)
			if arg_615_0 == 1 then
				arg_613_0:Play115301153(arg_613_1)
			end
		end

		function arg_613_1.onSingleLineUpdate_(arg_616_0)
			local var_616_0 = arg_613_1.actors_["10030"]
			local var_616_1 = 0

			if var_616_1 < arg_613_1.time_ and arg_613_1.time_ <= var_616_1 + arg_616_0 then
				local var_616_2 = var_616_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_616_2 then
					arg_613_1.var_.alphaOldValue10030 = var_616_2.alpha
					arg_613_1.var_.characterEffect10030 = var_616_2
				end

				arg_613_1.var_.alphaOldValue10030 = 1
			end

			local var_616_3 = 0.333333333333333

			if var_616_1 <= arg_613_1.time_ and arg_613_1.time_ < var_616_1 + var_616_3 then
				local var_616_4 = (arg_613_1.time_ - var_616_1) / var_616_3
				local var_616_5 = Mathf.Lerp(arg_613_1.var_.alphaOldValue10030, 0, var_616_4)

				if arg_613_1.var_.characterEffect10030 then
					arg_613_1.var_.characterEffect10030.alpha = var_616_5
				end
			end

			if arg_613_1.time_ >= var_616_1 + var_616_3 and arg_613_1.time_ < var_616_1 + var_616_3 + arg_616_0 and arg_613_1.var_.characterEffect10030 then
				arg_613_1.var_.characterEffect10030.alpha = 0
			end

			local var_616_6 = 0
			local var_616_7 = 0.8

			if var_616_6 < arg_613_1.time_ and arg_613_1.time_ <= var_616_6 + arg_616_0 then
				arg_613_1.talkMaxDuration = 0
				arg_613_1.dialogCg_.alpha = 1

				arg_613_1.dialog_:SetActive(true)
				SetActive(arg_613_1.leftNameGo_, false)

				arg_613_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_613_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_613_1:RecordName(arg_613_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_613_1.iconTrs_.gameObject, false)
				arg_613_1.callingController_:SetSelectedState("normal")

				local var_616_8 = arg_613_1:GetWordFromCfg(115301152)
				local var_616_9 = arg_613_1:FormatText(var_616_8.content)

				arg_613_1.text_.text = var_616_9

				LuaForUtil.ClearLinePrefixSymbol(arg_613_1.text_)

				local var_616_10 = 32
				local var_616_11 = utf8.len(var_616_9)
				local var_616_12 = var_616_10 <= 0 and var_616_7 or var_616_7 * (var_616_11 / var_616_10)

				if var_616_12 > 0 and var_616_7 < var_616_12 then
					arg_613_1.talkMaxDuration = var_616_12

					if var_616_12 + var_616_6 > arg_613_1.duration_ then
						arg_613_1.duration_ = var_616_12 + var_616_6
					end
				end

				arg_613_1.text_.text = var_616_9
				arg_613_1.typewritter.percent = 0

				arg_613_1.typewritter:SetDirty()
				arg_613_1:ShowNextGo(false)
				arg_613_1:RecordContent(arg_613_1.text_.text)
			end

			local var_616_13 = math.max(var_616_7, arg_613_1.talkMaxDuration)

			if var_616_6 <= arg_613_1.time_ and arg_613_1.time_ < var_616_6 + var_616_13 then
				arg_613_1.typewritter.percent = (arg_613_1.time_ - var_616_6) / var_616_13

				arg_613_1.typewritter:SetDirty()
			end

			if arg_613_1.time_ >= var_616_6 + var_616_13 and arg_613_1.time_ < var_616_6 + var_616_13 + arg_616_0 then
				arg_613_1.typewritter.percent = 1

				arg_613_1.typewritter:SetDirty()
				arg_613_1:ShowNextGo(true)
			end
		end
	end,
	Play115301153 = function(arg_617_0, arg_617_1)
		arg_617_1.time_ = 0
		arg_617_1.frameCnt_ = 0
		arg_617_1.state_ = "playing"
		arg_617_1.curTalkId_ = 115301153
		arg_617_1.duration_ = 10.133

		local var_617_0 = {
			ja = 6.3,
			ko = 6.9,
			zh = 8.566,
			en = 10.133
		}
		local var_617_1 = manager.audio:GetLocalizationFlag()

		if var_617_0[var_617_1] ~= nil then
			arg_617_1.duration_ = var_617_0[var_617_1]
		end

		SetActive(arg_617_1.tipsGo_, false)

		function arg_617_1.onSingleLineFinish_()
			arg_617_1.onSingleLineUpdate_ = nil
			arg_617_1.onSingleLineFinish_ = nil
			arg_617_1.state_ = "waiting"
		end

		function arg_617_1.playNext_(arg_619_0)
			if arg_619_0 == 1 then
				arg_617_0:Play115301154(arg_617_1)
			end
		end

		function arg_617_1.onSingleLineUpdate_(arg_620_0)
			local var_620_0 = "F01a"

			if arg_617_1.bgs_[var_620_0] == nil then
				local var_620_1 = Object.Instantiate(arg_617_1.paintGo_)

				var_620_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_620_0)
				var_620_1.name = var_620_0
				var_620_1.transform.parent = arg_617_1.stage_.transform
				var_620_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_617_1.bgs_[var_620_0] = var_620_1
			end

			local var_620_2 = 2

			if var_620_2 < arg_617_1.time_ and arg_617_1.time_ <= var_620_2 + arg_620_0 then
				local var_620_3 = manager.ui.mainCamera.transform.localPosition
				local var_620_4 = Vector3.New(0, 0, 10) + Vector3.New(var_620_3.x, var_620_3.y, 0)
				local var_620_5 = arg_617_1.bgs_.F01a

				var_620_5.transform.localPosition = var_620_4
				var_620_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_620_6 = var_620_5:GetComponent("SpriteRenderer")

				if var_620_6 and var_620_6.sprite then
					local var_620_7 = (var_620_5.transform.localPosition - var_620_3).z
					local var_620_8 = manager.ui.mainCameraCom_
					local var_620_9 = 2 * var_620_7 * Mathf.Tan(var_620_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_620_10 = var_620_9 * var_620_8.aspect
					local var_620_11 = var_620_6.sprite.bounds.size.x
					local var_620_12 = var_620_6.sprite.bounds.size.y
					local var_620_13 = var_620_10 / var_620_11
					local var_620_14 = var_620_9 / var_620_12
					local var_620_15 = var_620_14 < var_620_13 and var_620_13 or var_620_14

					var_620_5.transform.localScale = Vector3.New(var_620_15, var_620_15, 0)
				end

				for iter_620_0, iter_620_1 in pairs(arg_617_1.bgs_) do
					if iter_620_0 ~= "F01a" then
						iter_620_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_620_16 = 0

			if var_620_16 < arg_617_1.time_ and arg_617_1.time_ <= var_620_16 + arg_620_0 then
				arg_617_1.mask_.enabled = true
				arg_617_1.mask_.raycastTarget = false

				arg_617_1:SetGaussion(false)
			end

			local var_620_17 = 2

			if var_620_16 <= arg_617_1.time_ and arg_617_1.time_ < var_620_16 + var_620_17 then
				local var_620_18 = (arg_617_1.time_ - var_620_16) / var_620_17
				local var_620_19 = Color.New(0, 0, 0)

				var_620_19.a = Mathf.Lerp(0, 1, var_620_18)
				arg_617_1.mask_.color = var_620_19
			end

			if arg_617_1.time_ >= var_620_16 + var_620_17 and arg_617_1.time_ < var_620_16 + var_620_17 + arg_620_0 then
				local var_620_20 = Color.New(0, 0, 0)

				var_620_20.a = 1
				arg_617_1.mask_.color = var_620_20
			end

			local var_620_21 = 2

			if var_620_21 < arg_617_1.time_ and arg_617_1.time_ <= var_620_21 + arg_620_0 then
				arg_617_1.mask_.enabled = true
				arg_617_1.mask_.raycastTarget = false

				arg_617_1:SetGaussion(false)
			end

			local var_620_22 = 2

			if var_620_21 <= arg_617_1.time_ and arg_617_1.time_ < var_620_21 + var_620_22 then
				local var_620_23 = (arg_617_1.time_ - var_620_21) / var_620_22
				local var_620_24 = Color.New(0, 0, 0)

				var_620_24.a = Mathf.Lerp(1, 0, var_620_23)
				arg_617_1.mask_.color = var_620_24
			end

			if arg_617_1.time_ >= var_620_21 + var_620_22 and arg_617_1.time_ < var_620_21 + var_620_22 + arg_620_0 then
				local var_620_25 = Color.New(0, 0, 0)
				local var_620_26 = 0

				arg_617_1.mask_.enabled = false
				var_620_25.a = var_620_26
				arg_617_1.mask_.color = var_620_25
			end

			local var_620_27 = arg_617_1.actors_["1038"].transform
			local var_620_28 = 4

			if var_620_28 < arg_617_1.time_ and arg_617_1.time_ <= var_620_28 + arg_620_0 then
				arg_617_1.var_.moveOldPos1038 = var_620_27.localPosition
				var_620_27.localScale = Vector3.New(1, 1, 1)

				arg_617_1:CheckSpriteTmpPos("1038", 3)

				local var_620_29 = var_620_27.childCount

				for iter_620_2 = 0, var_620_29 - 1 do
					local var_620_30 = var_620_27:GetChild(iter_620_2)

					if var_620_30.name == "split_5" or not string.find(var_620_30.name, "split") then
						var_620_30.gameObject:SetActive(true)
					else
						var_620_30.gameObject:SetActive(false)
					end
				end
			end

			local var_620_31 = 0.001

			if var_620_28 <= arg_617_1.time_ and arg_617_1.time_ < var_620_28 + var_620_31 then
				local var_620_32 = (arg_617_1.time_ - var_620_28) / var_620_31
				local var_620_33 = Vector3.New(0, -400, 0)

				var_620_27.localPosition = Vector3.Lerp(arg_617_1.var_.moveOldPos1038, var_620_33, var_620_32)
			end

			if arg_617_1.time_ >= var_620_28 + var_620_31 and arg_617_1.time_ < var_620_28 + var_620_31 + arg_620_0 then
				var_620_27.localPosition = Vector3.New(0, -400, 0)
			end

			local var_620_34 = 0

			if var_620_34 < arg_617_1.time_ and arg_617_1.time_ <= var_620_34 + arg_620_0 then
				arg_617_1.screenFilterGo_:SetActive(true)

				arg_617_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_620_35 = 5.5

			if var_620_34 <= arg_617_1.time_ and arg_617_1.time_ < var_620_34 + var_620_35 then
				local var_620_36 = (arg_617_1.time_ - var_620_34) / var_620_35

				arg_617_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_620_36)
			end

			if arg_617_1.time_ >= var_620_34 + var_620_35 and arg_617_1.time_ < var_620_34 + var_620_35 + arg_620_0 then
				arg_617_1.screenFilterEffect_.weight = 1
			end

			local var_620_37 = arg_617_1.actors_["1038"]
			local var_620_38 = 4

			if var_620_38 < arg_617_1.time_ and arg_617_1.time_ <= var_620_38 + arg_620_0 then
				local var_620_39 = var_620_37:GetComponentInChildren(typeof(CanvasGroup))

				if var_620_39 then
					arg_617_1.var_.alphaOldValue1038 = var_620_39.alpha
					arg_617_1.var_.characterEffect1038 = var_620_39
				end

				arg_617_1.var_.alphaOldValue1038 = 0
			end

			local var_620_40 = 0.333333333333333

			if var_620_38 <= arg_617_1.time_ and arg_617_1.time_ < var_620_38 + var_620_40 then
				local var_620_41 = (arg_617_1.time_ - var_620_38) / var_620_40
				local var_620_42 = Mathf.Lerp(arg_617_1.var_.alphaOldValue1038, 1, var_620_41)

				if arg_617_1.var_.characterEffect1038 then
					arg_617_1.var_.characterEffect1038.alpha = var_620_42
				end
			end

			if arg_617_1.time_ >= var_620_38 + var_620_40 and arg_617_1.time_ < var_620_38 + var_620_40 + arg_620_0 and arg_617_1.var_.characterEffect1038 then
				arg_617_1.var_.characterEffect1038.alpha = 1
			end

			if arg_617_1.frameCnt_ <= 1 then
				arg_617_1.dialog_:SetActive(false)
			end

			local var_620_43 = 4
			local var_620_44 = 0.3

			if var_620_43 < arg_617_1.time_ and arg_617_1.time_ <= var_620_43 + arg_620_0 then
				arg_617_1.talkMaxDuration = 0

				arg_617_1.dialog_:SetActive(true)

				local var_620_45 = LeanTween.value(arg_617_1.dialog_, 0, 1, 0.3)

				var_620_45:setOnUpdate(LuaHelper.FloatAction(function(arg_621_0)
					arg_617_1.dialogCg_.alpha = arg_621_0
				end))
				var_620_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_617_1.dialog_)
					var_620_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_617_1.duration_ = arg_617_1.duration_ + 0.3

				SetActive(arg_617_1.leftNameGo_, true)

				local var_620_46 = arg_617_1:FormatText(StoryNameCfg[94].name)

				arg_617_1.leftNameTxt_.text = var_620_46

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_617_1.leftNameTxt_.transform)

				arg_617_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_617_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_617_1:RecordName(arg_617_1.leftNameTxt_.text)
				SetActive(arg_617_1.iconTrs_.gameObject, false)
				arg_617_1.callingController_:SetSelectedState("normal")

				local var_620_47 = arg_617_1:GetWordFromCfg(115301153)
				local var_620_48 = arg_617_1:FormatText(var_620_47.content)

				arg_617_1.text_.text = var_620_48

				LuaForUtil.ClearLinePrefixSymbol(arg_617_1.text_)

				local var_620_49 = 12
				local var_620_50 = utf8.len(var_620_48)
				local var_620_51 = var_620_49 <= 0 and var_620_44 or var_620_44 * (var_620_50 / var_620_49)

				if var_620_51 > 0 and var_620_44 < var_620_51 then
					arg_617_1.talkMaxDuration = var_620_51
					var_620_43 = var_620_43 + 0.3

					if var_620_51 + var_620_43 > arg_617_1.duration_ then
						arg_617_1.duration_ = var_620_51 + var_620_43
					end
				end

				arg_617_1.text_.text = var_620_48
				arg_617_1.typewritter.percent = 0

				arg_617_1.typewritter:SetDirty()
				arg_617_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301153", "story_v_out_115301.awb") ~= 0 then
					local var_620_52 = manager.audio:GetVoiceLength("story_v_out_115301", "115301153", "story_v_out_115301.awb") / 1000

					if var_620_52 + var_620_43 > arg_617_1.duration_ then
						arg_617_1.duration_ = var_620_52 + var_620_43
					end

					if var_620_47.prefab_name ~= "" and arg_617_1.actors_[var_620_47.prefab_name] ~= nil then
						local var_620_53 = LuaForUtil.PlayVoiceWithCriLipsync(arg_617_1.actors_[var_620_47.prefab_name].transform, "story_v_out_115301", "115301153", "story_v_out_115301.awb")

						arg_617_1:RecordAudio("115301153", var_620_53)
						arg_617_1:RecordAudio("115301153", var_620_53)
					else
						arg_617_1:AudioAction("play", "voice", "story_v_out_115301", "115301153", "story_v_out_115301.awb")
					end

					arg_617_1:RecordHistoryTalkVoice("story_v_out_115301", "115301153", "story_v_out_115301.awb")
				end

				arg_617_1:RecordContent(arg_617_1.text_.text)
			end

			local var_620_54 = var_620_43 + 0.3
			local var_620_55 = math.max(var_620_44, arg_617_1.talkMaxDuration)

			if var_620_54 <= arg_617_1.time_ and arg_617_1.time_ < var_620_54 + var_620_55 then
				arg_617_1.typewritter.percent = (arg_617_1.time_ - var_620_54) / var_620_55

				arg_617_1.typewritter:SetDirty()
			end

			if arg_617_1.time_ >= var_620_54 + var_620_55 and arg_617_1.time_ < var_620_54 + var_620_55 + arg_620_0 then
				arg_617_1.typewritter.percent = 1

				arg_617_1.typewritter:SetDirty()
				arg_617_1:ShowNextGo(true)
			end
		end
	end,
	Play115301154 = function(arg_623_0, arg_623_1)
		arg_623_1.time_ = 0
		arg_623_1.frameCnt_ = 0
		arg_623_1.state_ = "playing"
		arg_623_1.curTalkId_ = 115301154
		arg_623_1.duration_ = 6.4

		local var_623_0 = {
			ja = 3.766,
			ko = 5.433,
			zh = 5.833,
			en = 6.4
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
				arg_623_0:Play115301155(arg_623_1)
			end
		end

		function arg_623_1.onSingleLineUpdate_(arg_626_0)
			local var_626_0 = arg_623_1.actors_["1038"]
			local var_626_1 = 0

			if var_626_1 < arg_623_1.time_ and arg_623_1.time_ <= var_626_1 + arg_626_0 and arg_623_1.var_.actorSpriteComps1038 == nil then
				arg_623_1.var_.actorSpriteComps1038 = var_626_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_626_2 = 0.2

			if var_626_1 <= arg_623_1.time_ and arg_623_1.time_ < var_626_1 + var_626_2 then
				local var_626_3 = (arg_623_1.time_ - var_626_1) / var_626_2

				if arg_623_1.var_.actorSpriteComps1038 then
					for iter_626_0, iter_626_1 in pairs(arg_623_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_626_1 then
							local var_626_4 = Mathf.Lerp(iter_626_1.color.r, 0.5, var_626_3)

							iter_626_1.color = Color.New(var_626_4, var_626_4, var_626_4)
						end
					end
				end
			end

			if arg_623_1.time_ >= var_626_1 + var_626_2 and arg_623_1.time_ < var_626_1 + var_626_2 + arg_626_0 and arg_623_1.var_.actorSpriteComps1038 then
				local var_626_5 = 0.5

				for iter_626_2, iter_626_3 in pairs(arg_623_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_626_3 then
						iter_626_3.color = Color.New(var_626_5, var_626_5, var_626_5)
					end
				end

				arg_623_1.var_.actorSpriteComps1038 = nil
			end

			local var_626_6 = 0
			local var_626_7 = 0.475

			if var_626_6 < arg_623_1.time_ and arg_623_1.time_ <= var_626_6 + arg_626_0 then
				arg_623_1.talkMaxDuration = 0
				arg_623_1.dialogCg_.alpha = 1

				arg_623_1.dialog_:SetActive(true)
				SetActive(arg_623_1.leftNameGo_, true)

				local var_626_8 = arg_623_1:FormatText(StoryNameCfg[36].name)

				arg_623_1.leftNameTxt_.text = var_626_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_623_1.leftNameTxt_.transform)

				arg_623_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_623_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_623_1:RecordName(arg_623_1.leftNameTxt_.text)
				SetActive(arg_623_1.iconTrs_.gameObject, false)
				arg_623_1.callingController_:SetSelectedState("normal")

				local var_626_9 = arg_623_1:GetWordFromCfg(115301154)
				local var_626_10 = arg_623_1:FormatText(var_626_9.content)

				arg_623_1.text_.text = var_626_10

				LuaForUtil.ClearLinePrefixSymbol(arg_623_1.text_)

				local var_626_11 = 19
				local var_626_12 = utf8.len(var_626_10)
				local var_626_13 = var_626_11 <= 0 and var_626_7 or var_626_7 * (var_626_12 / var_626_11)

				if var_626_13 > 0 and var_626_7 < var_626_13 then
					arg_623_1.talkMaxDuration = var_626_13

					if var_626_13 + var_626_6 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_13 + var_626_6
					end
				end

				arg_623_1.text_.text = var_626_10
				arg_623_1.typewritter.percent = 0

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301154", "story_v_out_115301.awb") ~= 0 then
					local var_626_14 = manager.audio:GetVoiceLength("story_v_out_115301", "115301154", "story_v_out_115301.awb") / 1000

					if var_626_14 + var_626_6 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_14 + var_626_6
					end

					if var_626_9.prefab_name ~= "" and arg_623_1.actors_[var_626_9.prefab_name] ~= nil then
						local var_626_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_623_1.actors_[var_626_9.prefab_name].transform, "story_v_out_115301", "115301154", "story_v_out_115301.awb")

						arg_623_1:RecordAudio("115301154", var_626_15)
						arg_623_1:RecordAudio("115301154", var_626_15)
					else
						arg_623_1:AudioAction("play", "voice", "story_v_out_115301", "115301154", "story_v_out_115301.awb")
					end

					arg_623_1:RecordHistoryTalkVoice("story_v_out_115301", "115301154", "story_v_out_115301.awb")
				end

				arg_623_1:RecordContent(arg_623_1.text_.text)
			end

			local var_626_16 = math.max(var_626_7, arg_623_1.talkMaxDuration)

			if var_626_6 <= arg_623_1.time_ and arg_623_1.time_ < var_626_6 + var_626_16 then
				arg_623_1.typewritter.percent = (arg_623_1.time_ - var_626_6) / var_626_16

				arg_623_1.typewritter:SetDirty()
			end

			if arg_623_1.time_ >= var_626_6 + var_626_16 and arg_623_1.time_ < var_626_6 + var_626_16 + arg_626_0 then
				arg_623_1.typewritter.percent = 1

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(true)
			end
		end
	end,
	Play115301155 = function(arg_627_0, arg_627_1)
		arg_627_1.time_ = 0
		arg_627_1.frameCnt_ = 0
		arg_627_1.state_ = "playing"
		arg_627_1.curTalkId_ = 115301155
		arg_627_1.duration_ = 8.733

		local var_627_0 = {
			ja = 7.666,
			ko = 8.133,
			zh = 8.733,
			en = 8.733
		}
		local var_627_1 = manager.audio:GetLocalizationFlag()

		if var_627_0[var_627_1] ~= nil then
			arg_627_1.duration_ = var_627_0[var_627_1]
		end

		SetActive(arg_627_1.tipsGo_, false)

		function arg_627_1.onSingleLineFinish_()
			arg_627_1.onSingleLineUpdate_ = nil
			arg_627_1.onSingleLineFinish_ = nil
			arg_627_1.state_ = "waiting"
		end

		function arg_627_1.playNext_(arg_629_0)
			if arg_629_0 == 1 then
				arg_627_0:Play115301156(arg_627_1)
			end
		end

		function arg_627_1.onSingleLineUpdate_(arg_630_0)
			local var_630_0 = 0
			local var_630_1 = 0.825

			if var_630_0 < arg_627_1.time_ and arg_627_1.time_ <= var_630_0 + arg_630_0 then
				arg_627_1.talkMaxDuration = 0
				arg_627_1.dialogCg_.alpha = 1

				arg_627_1.dialog_:SetActive(true)
				SetActive(arg_627_1.leftNameGo_, true)

				local var_630_2 = arg_627_1:FormatText(StoryNameCfg[36].name)

				arg_627_1.leftNameTxt_.text = var_630_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_627_1.leftNameTxt_.transform)

				arg_627_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_627_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_627_1:RecordName(arg_627_1.leftNameTxt_.text)
				SetActive(arg_627_1.iconTrs_.gameObject, false)
				arg_627_1.callingController_:SetSelectedState("normal")

				local var_630_3 = arg_627_1:GetWordFromCfg(115301155)
				local var_630_4 = arg_627_1:FormatText(var_630_3.content)

				arg_627_1.text_.text = var_630_4

				LuaForUtil.ClearLinePrefixSymbol(arg_627_1.text_)

				local var_630_5 = 33
				local var_630_6 = utf8.len(var_630_4)
				local var_630_7 = var_630_5 <= 0 and var_630_1 or var_630_1 * (var_630_6 / var_630_5)

				if var_630_7 > 0 and var_630_1 < var_630_7 then
					arg_627_1.talkMaxDuration = var_630_7

					if var_630_7 + var_630_0 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_7 + var_630_0
					end
				end

				arg_627_1.text_.text = var_630_4
				arg_627_1.typewritter.percent = 0

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301155", "story_v_out_115301.awb") ~= 0 then
					local var_630_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301155", "story_v_out_115301.awb") / 1000

					if var_630_8 + var_630_0 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_8 + var_630_0
					end

					if var_630_3.prefab_name ~= "" and arg_627_1.actors_[var_630_3.prefab_name] ~= nil then
						local var_630_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_627_1.actors_[var_630_3.prefab_name].transform, "story_v_out_115301", "115301155", "story_v_out_115301.awb")

						arg_627_1:RecordAudio("115301155", var_630_9)
						arg_627_1:RecordAudio("115301155", var_630_9)
					else
						arg_627_1:AudioAction("play", "voice", "story_v_out_115301", "115301155", "story_v_out_115301.awb")
					end

					arg_627_1:RecordHistoryTalkVoice("story_v_out_115301", "115301155", "story_v_out_115301.awb")
				end

				arg_627_1:RecordContent(arg_627_1.text_.text)
			end

			local var_630_10 = math.max(var_630_1, arg_627_1.talkMaxDuration)

			if var_630_0 <= arg_627_1.time_ and arg_627_1.time_ < var_630_0 + var_630_10 then
				arg_627_1.typewritter.percent = (arg_627_1.time_ - var_630_0) / var_630_10

				arg_627_1.typewritter:SetDirty()
			end

			if arg_627_1.time_ >= var_630_0 + var_630_10 and arg_627_1.time_ < var_630_0 + var_630_10 + arg_630_0 then
				arg_627_1.typewritter.percent = 1

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(true)
			end
		end
	end,
	Play115301156 = function(arg_631_0, arg_631_1)
		arg_631_1.time_ = 0
		arg_631_1.frameCnt_ = 0
		arg_631_1.state_ = "playing"
		arg_631_1.curTalkId_ = 115301156
		arg_631_1.duration_ = 4.4

		local var_631_0 = {
			ja = 3.833,
			ko = 3,
			zh = 4.4,
			en = 4.333
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
				arg_631_0:Play115301157(arg_631_1)
			end
		end

		function arg_631_1.onSingleLineUpdate_(arg_634_0)
			local var_634_0 = arg_631_1.actors_["1038"].transform
			local var_634_1 = 0

			if var_634_1 < arg_631_1.time_ and arg_631_1.time_ <= var_634_1 + arg_634_0 then
				arg_631_1.var_.moveOldPos1038 = var_634_0.localPosition
				var_634_0.localScale = Vector3.New(1, 1, 1)

				arg_631_1:CheckSpriteTmpPos("1038", 3)

				local var_634_2 = var_634_0.childCount

				for iter_634_0 = 0, var_634_2 - 1 do
					local var_634_3 = var_634_0:GetChild(iter_634_0)

					if var_634_3.name == "split_9" or not string.find(var_634_3.name, "split") then
						var_634_3.gameObject:SetActive(true)
					else
						var_634_3.gameObject:SetActive(false)
					end
				end
			end

			local var_634_4 = 0.001

			if var_634_1 <= arg_631_1.time_ and arg_631_1.time_ < var_634_1 + var_634_4 then
				local var_634_5 = (arg_631_1.time_ - var_634_1) / var_634_4
				local var_634_6 = Vector3.New(0, -400, 0)

				var_634_0.localPosition = Vector3.Lerp(arg_631_1.var_.moveOldPos1038, var_634_6, var_634_5)
			end

			if arg_631_1.time_ >= var_634_1 + var_634_4 and arg_631_1.time_ < var_634_1 + var_634_4 + arg_634_0 then
				var_634_0.localPosition = Vector3.New(0, -400, 0)
			end

			local var_634_7 = arg_631_1.actors_["1038"]
			local var_634_8 = 0

			if var_634_8 < arg_631_1.time_ and arg_631_1.time_ <= var_634_8 + arg_634_0 then
				local var_634_9 = var_634_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_634_9 then
					arg_631_1.var_.alphaOldValue1038 = var_634_9.alpha
					arg_631_1.var_.characterEffect1038 = var_634_9
				end

				arg_631_1.var_.alphaOldValue1038 = 0
			end

			local var_634_10 = 0.0166666666666667

			if var_634_8 <= arg_631_1.time_ and arg_631_1.time_ < var_634_8 + var_634_10 then
				local var_634_11 = (arg_631_1.time_ - var_634_8) / var_634_10
				local var_634_12 = Mathf.Lerp(arg_631_1.var_.alphaOldValue1038, 1, var_634_11)

				if arg_631_1.var_.characterEffect1038 then
					arg_631_1.var_.characterEffect1038.alpha = var_634_12
				end
			end

			if arg_631_1.time_ >= var_634_8 + var_634_10 and arg_631_1.time_ < var_634_8 + var_634_10 + arg_634_0 and arg_631_1.var_.characterEffect1038 then
				arg_631_1.var_.characterEffect1038.alpha = 1
			end

			local var_634_13 = arg_631_1.actors_["1038"]
			local var_634_14 = 0

			if var_634_14 < arg_631_1.time_ and arg_631_1.time_ <= var_634_14 + arg_634_0 and arg_631_1.var_.actorSpriteComps1038 == nil then
				arg_631_1.var_.actorSpriteComps1038 = var_634_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_634_15 = 0.2

			if var_634_14 <= arg_631_1.time_ and arg_631_1.time_ < var_634_14 + var_634_15 then
				local var_634_16 = (arg_631_1.time_ - var_634_14) / var_634_15

				if arg_631_1.var_.actorSpriteComps1038 then
					for iter_634_1, iter_634_2 in pairs(arg_631_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_634_2 then
							local var_634_17 = Mathf.Lerp(iter_634_2.color.r, 1, var_634_16)

							iter_634_2.color = Color.New(var_634_17, var_634_17, var_634_17)
						end
					end
				end
			end

			if arg_631_1.time_ >= var_634_14 + var_634_15 and arg_631_1.time_ < var_634_14 + var_634_15 + arg_634_0 and arg_631_1.var_.actorSpriteComps1038 then
				local var_634_18 = 1

				for iter_634_3, iter_634_4 in pairs(arg_631_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_634_4 then
						iter_634_4.color = Color.New(var_634_18, var_634_18, var_634_18)
					end
				end

				arg_631_1.var_.actorSpriteComps1038 = nil
			end

			local var_634_19 = 0
			local var_634_20 = 0.4

			if var_634_19 < arg_631_1.time_ and arg_631_1.time_ <= var_634_19 + arg_634_0 then
				arg_631_1.talkMaxDuration = 0
				arg_631_1.dialogCg_.alpha = 1

				arg_631_1.dialog_:SetActive(true)
				SetActive(arg_631_1.leftNameGo_, true)

				local var_634_21 = arg_631_1:FormatText(StoryNameCfg[94].name)

				arg_631_1.leftNameTxt_.text = var_634_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_631_1.leftNameTxt_.transform)

				arg_631_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_631_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_631_1:RecordName(arg_631_1.leftNameTxt_.text)
				SetActive(arg_631_1.iconTrs_.gameObject, false)
				arg_631_1.callingController_:SetSelectedState("normal")

				local var_634_22 = arg_631_1:GetWordFromCfg(115301156)
				local var_634_23 = arg_631_1:FormatText(var_634_22.content)

				arg_631_1.text_.text = var_634_23

				LuaForUtil.ClearLinePrefixSymbol(arg_631_1.text_)

				local var_634_24 = 16
				local var_634_25 = utf8.len(var_634_23)
				local var_634_26 = var_634_24 <= 0 and var_634_20 or var_634_20 * (var_634_25 / var_634_24)

				if var_634_26 > 0 and var_634_20 < var_634_26 then
					arg_631_1.talkMaxDuration = var_634_26

					if var_634_26 + var_634_19 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_26 + var_634_19
					end
				end

				arg_631_1.text_.text = var_634_23
				arg_631_1.typewritter.percent = 0

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301156", "story_v_out_115301.awb") ~= 0 then
					local var_634_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301156", "story_v_out_115301.awb") / 1000

					if var_634_27 + var_634_19 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_27 + var_634_19
					end

					if var_634_22.prefab_name ~= "" and arg_631_1.actors_[var_634_22.prefab_name] ~= nil then
						local var_634_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_631_1.actors_[var_634_22.prefab_name].transform, "story_v_out_115301", "115301156", "story_v_out_115301.awb")

						arg_631_1:RecordAudio("115301156", var_634_28)
						arg_631_1:RecordAudio("115301156", var_634_28)
					else
						arg_631_1:AudioAction("play", "voice", "story_v_out_115301", "115301156", "story_v_out_115301.awb")
					end

					arg_631_1:RecordHistoryTalkVoice("story_v_out_115301", "115301156", "story_v_out_115301.awb")
				end

				arg_631_1:RecordContent(arg_631_1.text_.text)
			end

			local var_634_29 = math.max(var_634_20, arg_631_1.talkMaxDuration)

			if var_634_19 <= arg_631_1.time_ and arg_631_1.time_ < var_634_19 + var_634_29 then
				arg_631_1.typewritter.percent = (arg_631_1.time_ - var_634_19) / var_634_29

				arg_631_1.typewritter:SetDirty()
			end

			if arg_631_1.time_ >= var_634_19 + var_634_29 and arg_631_1.time_ < var_634_19 + var_634_29 + arg_634_0 then
				arg_631_1.typewritter.percent = 1

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(true)
			end
		end
	end,
	Play115301157 = function(arg_635_0, arg_635_1)
		arg_635_1.time_ = 0
		arg_635_1.frameCnt_ = 0
		arg_635_1.state_ = "playing"
		arg_635_1.curTalkId_ = 115301157
		arg_635_1.duration_ = 7.266

		local var_635_0 = {
			ja = 4.4,
			ko = 5.6,
			zh = 5.166,
			en = 7.266
		}
		local var_635_1 = manager.audio:GetLocalizationFlag()

		if var_635_0[var_635_1] ~= nil then
			arg_635_1.duration_ = var_635_0[var_635_1]
		end

		SetActive(arg_635_1.tipsGo_, false)

		function arg_635_1.onSingleLineFinish_()
			arg_635_1.onSingleLineUpdate_ = nil
			arg_635_1.onSingleLineFinish_ = nil
			arg_635_1.state_ = "waiting"
		end

		function arg_635_1.playNext_(arg_637_0)
			if arg_637_0 == 1 then
				arg_635_0:Play115301158(arg_635_1)
			end
		end

		function arg_635_1.onSingleLineUpdate_(arg_638_0)
			local var_638_0 = arg_635_1.actors_["1038"]
			local var_638_1 = 0

			if var_638_1 < arg_635_1.time_ and arg_635_1.time_ <= var_638_1 + arg_638_0 and arg_635_1.var_.actorSpriteComps1038 == nil then
				arg_635_1.var_.actorSpriteComps1038 = var_638_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_638_2 = 0.2

			if var_638_1 <= arg_635_1.time_ and arg_635_1.time_ < var_638_1 + var_638_2 then
				local var_638_3 = (arg_635_1.time_ - var_638_1) / var_638_2

				if arg_635_1.var_.actorSpriteComps1038 then
					for iter_638_0, iter_638_1 in pairs(arg_635_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_638_1 then
							local var_638_4 = Mathf.Lerp(iter_638_1.color.r, 0.5, var_638_3)

							iter_638_1.color = Color.New(var_638_4, var_638_4, var_638_4)
						end
					end
				end
			end

			if arg_635_1.time_ >= var_638_1 + var_638_2 and arg_635_1.time_ < var_638_1 + var_638_2 + arg_638_0 and arg_635_1.var_.actorSpriteComps1038 then
				local var_638_5 = 0.5

				for iter_638_2, iter_638_3 in pairs(arg_635_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_638_3 then
						iter_638_3.color = Color.New(var_638_5, var_638_5, var_638_5)
					end
				end

				arg_635_1.var_.actorSpriteComps1038 = nil
			end

			local var_638_6 = 0
			local var_638_7 = 0.525

			if var_638_6 < arg_635_1.time_ and arg_635_1.time_ <= var_638_6 + arg_638_0 then
				arg_635_1.talkMaxDuration = 0
				arg_635_1.dialogCg_.alpha = 1

				arg_635_1.dialog_:SetActive(true)
				SetActive(arg_635_1.leftNameGo_, true)

				local var_638_8 = arg_635_1:FormatText(StoryNameCfg[36].name)

				arg_635_1.leftNameTxt_.text = var_638_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_635_1.leftNameTxt_.transform)

				arg_635_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_635_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_635_1:RecordName(arg_635_1.leftNameTxt_.text)
				SetActive(arg_635_1.iconTrs_.gameObject, false)
				arg_635_1.callingController_:SetSelectedState("normal")

				local var_638_9 = arg_635_1:GetWordFromCfg(115301157)
				local var_638_10 = arg_635_1:FormatText(var_638_9.content)

				arg_635_1.text_.text = var_638_10

				LuaForUtil.ClearLinePrefixSymbol(arg_635_1.text_)

				local var_638_11 = 21
				local var_638_12 = utf8.len(var_638_10)
				local var_638_13 = var_638_11 <= 0 and var_638_7 or var_638_7 * (var_638_12 / var_638_11)

				if var_638_13 > 0 and var_638_7 < var_638_13 then
					arg_635_1.talkMaxDuration = var_638_13

					if var_638_13 + var_638_6 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_13 + var_638_6
					end
				end

				arg_635_1.text_.text = var_638_10
				arg_635_1.typewritter.percent = 0

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301157", "story_v_out_115301.awb") ~= 0 then
					local var_638_14 = manager.audio:GetVoiceLength("story_v_out_115301", "115301157", "story_v_out_115301.awb") / 1000

					if var_638_14 + var_638_6 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_14 + var_638_6
					end

					if var_638_9.prefab_name ~= "" and arg_635_1.actors_[var_638_9.prefab_name] ~= nil then
						local var_638_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_635_1.actors_[var_638_9.prefab_name].transform, "story_v_out_115301", "115301157", "story_v_out_115301.awb")

						arg_635_1:RecordAudio("115301157", var_638_15)
						arg_635_1:RecordAudio("115301157", var_638_15)
					else
						arg_635_1:AudioAction("play", "voice", "story_v_out_115301", "115301157", "story_v_out_115301.awb")
					end

					arg_635_1:RecordHistoryTalkVoice("story_v_out_115301", "115301157", "story_v_out_115301.awb")
				end

				arg_635_1:RecordContent(arg_635_1.text_.text)
			end

			local var_638_16 = math.max(var_638_7, arg_635_1.talkMaxDuration)

			if var_638_6 <= arg_635_1.time_ and arg_635_1.time_ < var_638_6 + var_638_16 then
				arg_635_1.typewritter.percent = (arg_635_1.time_ - var_638_6) / var_638_16

				arg_635_1.typewritter:SetDirty()
			end

			if arg_635_1.time_ >= var_638_6 + var_638_16 and arg_635_1.time_ < var_638_6 + var_638_16 + arg_638_0 then
				arg_635_1.typewritter.percent = 1

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(true)
			end
		end
	end,
	Play115301158 = function(arg_639_0, arg_639_1)
		arg_639_1.time_ = 0
		arg_639_1.frameCnt_ = 0
		arg_639_1.state_ = "playing"
		arg_639_1.curTalkId_ = 115301158
		arg_639_1.duration_ = 16.366

		local var_639_0 = {
			ja = 14.333,
			ko = 11.666,
			zh = 12.7,
			en = 16.366
		}
		local var_639_1 = manager.audio:GetLocalizationFlag()

		if var_639_0[var_639_1] ~= nil then
			arg_639_1.duration_ = var_639_0[var_639_1]
		end

		SetActive(arg_639_1.tipsGo_, false)

		function arg_639_1.onSingleLineFinish_()
			arg_639_1.onSingleLineUpdate_ = nil
			arg_639_1.onSingleLineFinish_ = nil
			arg_639_1.state_ = "waiting"
		end

		function arg_639_1.playNext_(arg_641_0)
			if arg_641_0 == 1 then
				arg_639_0:Play115301159(arg_639_1)
			end
		end

		function arg_639_1.onSingleLineUpdate_(arg_642_0)
			local var_642_0 = 0
			local var_642_1 = 1.125

			if var_642_0 < arg_639_1.time_ and arg_639_1.time_ <= var_642_0 + arg_642_0 then
				arg_639_1.talkMaxDuration = 0
				arg_639_1.dialogCg_.alpha = 1

				arg_639_1.dialog_:SetActive(true)
				SetActive(arg_639_1.leftNameGo_, true)

				local var_642_2 = arg_639_1:FormatText(StoryNameCfg[36].name)

				arg_639_1.leftNameTxt_.text = var_642_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_639_1.leftNameTxt_.transform)

				arg_639_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_639_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_639_1:RecordName(arg_639_1.leftNameTxt_.text)
				SetActive(arg_639_1.iconTrs_.gameObject, false)
				arg_639_1.callingController_:SetSelectedState("normal")

				local var_642_3 = arg_639_1:GetWordFromCfg(115301158)
				local var_642_4 = arg_639_1:FormatText(var_642_3.content)

				arg_639_1.text_.text = var_642_4

				LuaForUtil.ClearLinePrefixSymbol(arg_639_1.text_)

				local var_642_5 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301158", "story_v_out_115301.awb") ~= 0 then
					local var_642_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301158", "story_v_out_115301.awb") / 1000

					if var_642_8 + var_642_0 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_8 + var_642_0
					end

					if var_642_3.prefab_name ~= "" and arg_639_1.actors_[var_642_3.prefab_name] ~= nil then
						local var_642_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_639_1.actors_[var_642_3.prefab_name].transform, "story_v_out_115301", "115301158", "story_v_out_115301.awb")

						arg_639_1:RecordAudio("115301158", var_642_9)
						arg_639_1:RecordAudio("115301158", var_642_9)
					else
						arg_639_1:AudioAction("play", "voice", "story_v_out_115301", "115301158", "story_v_out_115301.awb")
					end

					arg_639_1:RecordHistoryTalkVoice("story_v_out_115301", "115301158", "story_v_out_115301.awb")
				end

				arg_639_1:RecordContent(arg_639_1.text_.text)
			end

			local var_642_10 = math.max(var_642_1, arg_639_1.talkMaxDuration)

			if var_642_0 <= arg_639_1.time_ and arg_639_1.time_ < var_642_0 + var_642_10 then
				arg_639_1.typewritter.percent = (arg_639_1.time_ - var_642_0) / var_642_10

				arg_639_1.typewritter:SetDirty()
			end

			if arg_639_1.time_ >= var_642_0 + var_642_10 and arg_639_1.time_ < var_642_0 + var_642_10 + arg_642_0 then
				arg_639_1.typewritter.percent = 1

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(true)
			end
		end
	end,
	Play115301159 = function(arg_643_0, arg_643_1)
		arg_643_1.time_ = 0
		arg_643_1.frameCnt_ = 0
		arg_643_1.state_ = "playing"
		arg_643_1.curTalkId_ = 115301159
		arg_643_1.duration_ = 5.5

		local var_643_0 = {
			ja = 5.5,
			ko = 3.4,
			zh = 4.7,
			en = 3.833
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
				arg_643_0:Play115301160(arg_643_1)
			end
		end

		function arg_643_1.onSingleLineUpdate_(arg_646_0)
			local var_646_0 = arg_643_1.actors_["1038"]
			local var_646_1 = 0

			if var_646_1 < arg_643_1.time_ and arg_643_1.time_ <= var_646_1 + arg_646_0 and arg_643_1.var_.actorSpriteComps1038 == nil then
				arg_643_1.var_.actorSpriteComps1038 = var_646_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_646_2 = 0.2

			if var_646_1 <= arg_643_1.time_ and arg_643_1.time_ < var_646_1 + var_646_2 then
				local var_646_3 = (arg_643_1.time_ - var_646_1) / var_646_2

				if arg_643_1.var_.actorSpriteComps1038 then
					for iter_646_0, iter_646_1 in pairs(arg_643_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_646_1 then
							local var_646_4 = Mathf.Lerp(iter_646_1.color.r, 1, var_646_3)

							iter_646_1.color = Color.New(var_646_4, var_646_4, var_646_4)
						end
					end
				end
			end

			if arg_643_1.time_ >= var_646_1 + var_646_2 and arg_643_1.time_ < var_646_1 + var_646_2 + arg_646_0 and arg_643_1.var_.actorSpriteComps1038 then
				local var_646_5 = 1

				for iter_646_2, iter_646_3 in pairs(arg_643_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_646_3 then
						iter_646_3.color = Color.New(var_646_5, var_646_5, var_646_5)
					end
				end

				arg_643_1.var_.actorSpriteComps1038 = nil
			end

			local var_646_6 = arg_643_1.actors_["1038"].transform
			local var_646_7 = 0

			if var_646_7 < arg_643_1.time_ and arg_643_1.time_ <= var_646_7 + arg_646_0 then
				arg_643_1.var_.moveOldPos1038 = var_646_6.localPosition
				var_646_6.localScale = Vector3.New(1, 1, 1)

				arg_643_1:CheckSpriteTmpPos("1038", 3)

				local var_646_8 = var_646_6.childCount

				for iter_646_4 = 0, var_646_8 - 1 do
					local var_646_9 = var_646_6:GetChild(iter_646_4)

					if var_646_9.name == "split_1" or not string.find(var_646_9.name, "split") then
						var_646_9.gameObject:SetActive(true)
					else
						var_646_9.gameObject:SetActive(false)
					end
				end
			end

			local var_646_10 = 0.001

			if var_646_7 <= arg_643_1.time_ and arg_643_1.time_ < var_646_7 + var_646_10 then
				local var_646_11 = (arg_643_1.time_ - var_646_7) / var_646_10
				local var_646_12 = Vector3.New(0, -400, 0)

				var_646_6.localPosition = Vector3.Lerp(arg_643_1.var_.moveOldPos1038, var_646_12, var_646_11)
			end

			if arg_643_1.time_ >= var_646_7 + var_646_10 and arg_643_1.time_ < var_646_7 + var_646_10 + arg_646_0 then
				var_646_6.localPosition = Vector3.New(0, -400, 0)
			end

			local var_646_13 = 0
			local var_646_14 = 0.425

			if var_646_13 < arg_643_1.time_ and arg_643_1.time_ <= var_646_13 + arg_646_0 then
				arg_643_1.talkMaxDuration = 0
				arg_643_1.dialogCg_.alpha = 1

				arg_643_1.dialog_:SetActive(true)
				SetActive(arg_643_1.leftNameGo_, true)

				local var_646_15 = arg_643_1:FormatText(StoryNameCfg[94].name)

				arg_643_1.leftNameTxt_.text = var_646_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_643_1.leftNameTxt_.transform)

				arg_643_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_643_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_643_1:RecordName(arg_643_1.leftNameTxt_.text)
				SetActive(arg_643_1.iconTrs_.gameObject, false)
				arg_643_1.callingController_:SetSelectedState("normal")

				local var_646_16 = arg_643_1:GetWordFromCfg(115301159)
				local var_646_17 = arg_643_1:FormatText(var_646_16.content)

				arg_643_1.text_.text = var_646_17

				LuaForUtil.ClearLinePrefixSymbol(arg_643_1.text_)

				local var_646_18 = 17
				local var_646_19 = utf8.len(var_646_17)
				local var_646_20 = var_646_18 <= 0 and var_646_14 or var_646_14 * (var_646_19 / var_646_18)

				if var_646_20 > 0 and var_646_14 < var_646_20 then
					arg_643_1.talkMaxDuration = var_646_20

					if var_646_20 + var_646_13 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_20 + var_646_13
					end
				end

				arg_643_1.text_.text = var_646_17
				arg_643_1.typewritter.percent = 0

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301159", "story_v_out_115301.awb") ~= 0 then
					local var_646_21 = manager.audio:GetVoiceLength("story_v_out_115301", "115301159", "story_v_out_115301.awb") / 1000

					if var_646_21 + var_646_13 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_21 + var_646_13
					end

					if var_646_16.prefab_name ~= "" and arg_643_1.actors_[var_646_16.prefab_name] ~= nil then
						local var_646_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_643_1.actors_[var_646_16.prefab_name].transform, "story_v_out_115301", "115301159", "story_v_out_115301.awb")

						arg_643_1:RecordAudio("115301159", var_646_22)
						arg_643_1:RecordAudio("115301159", var_646_22)
					else
						arg_643_1:AudioAction("play", "voice", "story_v_out_115301", "115301159", "story_v_out_115301.awb")
					end

					arg_643_1:RecordHistoryTalkVoice("story_v_out_115301", "115301159", "story_v_out_115301.awb")
				end

				arg_643_1:RecordContent(arg_643_1.text_.text)
			end

			local var_646_23 = math.max(var_646_14, arg_643_1.talkMaxDuration)

			if var_646_13 <= arg_643_1.time_ and arg_643_1.time_ < var_646_13 + var_646_23 then
				arg_643_1.typewritter.percent = (arg_643_1.time_ - var_646_13) / var_646_23

				arg_643_1.typewritter:SetDirty()
			end

			if arg_643_1.time_ >= var_646_13 + var_646_23 and arg_643_1.time_ < var_646_13 + var_646_23 + arg_646_0 then
				arg_643_1.typewritter.percent = 1

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(true)
			end
		end
	end,
	Play115301160 = function(arg_647_0, arg_647_1)
		arg_647_1.time_ = 0
		arg_647_1.frameCnt_ = 0
		arg_647_1.state_ = "playing"
		arg_647_1.curTalkId_ = 115301160
		arg_647_1.duration_ = 7.566

		local var_647_0 = {
			ja = 6.6,
			ko = 5.8,
			zh = 5.5,
			en = 7.566
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
				arg_647_0:Play115301161(arg_647_1)
			end
		end

		function arg_647_1.onSingleLineUpdate_(arg_650_0)
			local var_650_0 = arg_647_1.actors_["1038"]
			local var_650_1 = 0

			if var_650_1 < arg_647_1.time_ and arg_647_1.time_ <= var_650_1 + arg_650_0 and arg_647_1.var_.actorSpriteComps1038 == nil then
				arg_647_1.var_.actorSpriteComps1038 = var_650_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_650_2 = 0.2

			if var_650_1 <= arg_647_1.time_ and arg_647_1.time_ < var_650_1 + var_650_2 then
				local var_650_3 = (arg_647_1.time_ - var_650_1) / var_650_2

				if arg_647_1.var_.actorSpriteComps1038 then
					for iter_650_0, iter_650_1 in pairs(arg_647_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_650_1 then
							local var_650_4 = Mathf.Lerp(iter_650_1.color.r, 0.5, var_650_3)

							iter_650_1.color = Color.New(var_650_4, var_650_4, var_650_4)
						end
					end
				end
			end

			if arg_647_1.time_ >= var_650_1 + var_650_2 and arg_647_1.time_ < var_650_1 + var_650_2 + arg_650_0 and arg_647_1.var_.actorSpriteComps1038 then
				local var_650_5 = 0.5

				for iter_650_2, iter_650_3 in pairs(arg_647_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_650_3 then
						iter_650_3.color = Color.New(var_650_5, var_650_5, var_650_5)
					end
				end

				arg_647_1.var_.actorSpriteComps1038 = nil
			end

			local var_650_6 = 0
			local var_650_7 = 0.6

			if var_650_6 < arg_647_1.time_ and arg_647_1.time_ <= var_650_6 + arg_650_0 then
				arg_647_1.talkMaxDuration = 0
				arg_647_1.dialogCg_.alpha = 1

				arg_647_1.dialog_:SetActive(true)
				SetActive(arg_647_1.leftNameGo_, true)

				local var_650_8 = arg_647_1:FormatText(StoryNameCfg[36].name)

				arg_647_1.leftNameTxt_.text = var_650_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_647_1.leftNameTxt_.transform)

				arg_647_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_647_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_647_1:RecordName(arg_647_1.leftNameTxt_.text)
				SetActive(arg_647_1.iconTrs_.gameObject, false)
				arg_647_1.callingController_:SetSelectedState("normal")

				local var_650_9 = arg_647_1:GetWordFromCfg(115301160)
				local var_650_10 = arg_647_1:FormatText(var_650_9.content)

				arg_647_1.text_.text = var_650_10

				LuaForUtil.ClearLinePrefixSymbol(arg_647_1.text_)

				local var_650_11 = 24
				local var_650_12 = utf8.len(var_650_10)
				local var_650_13 = var_650_11 <= 0 and var_650_7 or var_650_7 * (var_650_12 / var_650_11)

				if var_650_13 > 0 and var_650_7 < var_650_13 then
					arg_647_1.talkMaxDuration = var_650_13

					if var_650_13 + var_650_6 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_13 + var_650_6
					end
				end

				arg_647_1.text_.text = var_650_10
				arg_647_1.typewritter.percent = 0

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301160", "story_v_out_115301.awb") ~= 0 then
					local var_650_14 = manager.audio:GetVoiceLength("story_v_out_115301", "115301160", "story_v_out_115301.awb") / 1000

					if var_650_14 + var_650_6 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_14 + var_650_6
					end

					if var_650_9.prefab_name ~= "" and arg_647_1.actors_[var_650_9.prefab_name] ~= nil then
						local var_650_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_647_1.actors_[var_650_9.prefab_name].transform, "story_v_out_115301", "115301160", "story_v_out_115301.awb")

						arg_647_1:RecordAudio("115301160", var_650_15)
						arg_647_1:RecordAudio("115301160", var_650_15)
					else
						arg_647_1:AudioAction("play", "voice", "story_v_out_115301", "115301160", "story_v_out_115301.awb")
					end

					arg_647_1:RecordHistoryTalkVoice("story_v_out_115301", "115301160", "story_v_out_115301.awb")
				end

				arg_647_1:RecordContent(arg_647_1.text_.text)
			end

			local var_650_16 = math.max(var_650_7, arg_647_1.talkMaxDuration)

			if var_650_6 <= arg_647_1.time_ and arg_647_1.time_ < var_650_6 + var_650_16 then
				arg_647_1.typewritter.percent = (arg_647_1.time_ - var_650_6) / var_650_16

				arg_647_1.typewritter:SetDirty()
			end

			if arg_647_1.time_ >= var_650_6 + var_650_16 and arg_647_1.time_ < var_650_6 + var_650_16 + arg_650_0 then
				arg_647_1.typewritter.percent = 1

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(true)
			end
		end
	end,
	Play115301161 = function(arg_651_0, arg_651_1)
		arg_651_1.time_ = 0
		arg_651_1.frameCnt_ = 0
		arg_651_1.state_ = "playing"
		arg_651_1.curTalkId_ = 115301161
		arg_651_1.duration_ = 14.466

		local var_651_0 = {
			ja = 14.466,
			ko = 10,
			zh = 10.933,
			en = 10.9
		}
		local var_651_1 = manager.audio:GetLocalizationFlag()

		if var_651_0[var_651_1] ~= nil then
			arg_651_1.duration_ = var_651_0[var_651_1]
		end

		SetActive(arg_651_1.tipsGo_, false)

		function arg_651_1.onSingleLineFinish_()
			arg_651_1.onSingleLineUpdate_ = nil
			arg_651_1.onSingleLineFinish_ = nil
			arg_651_1.state_ = "waiting"
		end

		function arg_651_1.playNext_(arg_653_0)
			if arg_653_0 == 1 then
				arg_651_0:Play115301162(arg_651_1)
			end
		end

		function arg_651_1.onSingleLineUpdate_(arg_654_0)
			local var_654_0 = 0
			local var_654_1 = 1.075

			if var_654_0 < arg_651_1.time_ and arg_651_1.time_ <= var_654_0 + arg_654_0 then
				arg_651_1.talkMaxDuration = 0
				arg_651_1.dialogCg_.alpha = 1

				arg_651_1.dialog_:SetActive(true)
				SetActive(arg_651_1.leftNameGo_, true)

				local var_654_2 = arg_651_1:FormatText(StoryNameCfg[36].name)

				arg_651_1.leftNameTxt_.text = var_654_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_651_1.leftNameTxt_.transform)

				arg_651_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_651_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_651_1:RecordName(arg_651_1.leftNameTxt_.text)
				SetActive(arg_651_1.iconTrs_.gameObject, false)
				arg_651_1.callingController_:SetSelectedState("normal")

				local var_654_3 = arg_651_1:GetWordFromCfg(115301161)
				local var_654_4 = arg_651_1:FormatText(var_654_3.content)

				arg_651_1.text_.text = var_654_4

				LuaForUtil.ClearLinePrefixSymbol(arg_651_1.text_)

				local var_654_5 = 43
				local var_654_6 = utf8.len(var_654_4)
				local var_654_7 = var_654_5 <= 0 and var_654_1 or var_654_1 * (var_654_6 / var_654_5)

				if var_654_7 > 0 and var_654_1 < var_654_7 then
					arg_651_1.talkMaxDuration = var_654_7

					if var_654_7 + var_654_0 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_7 + var_654_0
					end
				end

				arg_651_1.text_.text = var_654_4
				arg_651_1.typewritter.percent = 0

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301161", "story_v_out_115301.awb") ~= 0 then
					local var_654_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301161", "story_v_out_115301.awb") / 1000

					if var_654_8 + var_654_0 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_8 + var_654_0
					end

					if var_654_3.prefab_name ~= "" and arg_651_1.actors_[var_654_3.prefab_name] ~= nil then
						local var_654_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_651_1.actors_[var_654_3.prefab_name].transform, "story_v_out_115301", "115301161", "story_v_out_115301.awb")

						arg_651_1:RecordAudio("115301161", var_654_9)
						arg_651_1:RecordAudio("115301161", var_654_9)
					else
						arg_651_1:AudioAction("play", "voice", "story_v_out_115301", "115301161", "story_v_out_115301.awb")
					end

					arg_651_1:RecordHistoryTalkVoice("story_v_out_115301", "115301161", "story_v_out_115301.awb")
				end

				arg_651_1:RecordContent(arg_651_1.text_.text)
			end

			local var_654_10 = math.max(var_654_1, arg_651_1.talkMaxDuration)

			if var_654_0 <= arg_651_1.time_ and arg_651_1.time_ < var_654_0 + var_654_10 then
				arg_651_1.typewritter.percent = (arg_651_1.time_ - var_654_0) / var_654_10

				arg_651_1.typewritter:SetDirty()
			end

			if arg_651_1.time_ >= var_654_0 + var_654_10 and arg_651_1.time_ < var_654_0 + var_654_10 + arg_654_0 then
				arg_651_1.typewritter.percent = 1

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(true)
			end
		end
	end,
	Play115301162 = function(arg_655_0, arg_655_1)
		arg_655_1.time_ = 0
		arg_655_1.frameCnt_ = 0
		arg_655_1.state_ = "playing"
		arg_655_1.curTalkId_ = 115301162
		arg_655_1.duration_ = 4.233

		local var_655_0 = {
			ja = 3.166,
			ko = 2.633,
			zh = 4.233,
			en = 3.466
		}
		local var_655_1 = manager.audio:GetLocalizationFlag()

		if var_655_0[var_655_1] ~= nil then
			arg_655_1.duration_ = var_655_0[var_655_1]
		end

		SetActive(arg_655_1.tipsGo_, false)

		function arg_655_1.onSingleLineFinish_()
			arg_655_1.onSingleLineUpdate_ = nil
			arg_655_1.onSingleLineFinish_ = nil
			arg_655_1.state_ = "waiting"
		end

		function arg_655_1.playNext_(arg_657_0)
			if arg_657_0 == 1 then
				arg_655_0:Play115301163(arg_655_1)
			end
		end

		function arg_655_1.onSingleLineUpdate_(arg_658_0)
			local var_658_0 = 0
			local var_658_1 = 0.275

			if var_658_0 < arg_655_1.time_ and arg_655_1.time_ <= var_658_0 + arg_658_0 then
				arg_655_1.talkMaxDuration = 0
				arg_655_1.dialogCg_.alpha = 1

				arg_655_1.dialog_:SetActive(true)
				SetActive(arg_655_1.leftNameGo_, true)

				local var_658_2 = arg_655_1:FormatText(StoryNameCfg[36].name)

				arg_655_1.leftNameTxt_.text = var_658_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_655_1.leftNameTxt_.transform)

				arg_655_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_655_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_655_1:RecordName(arg_655_1.leftNameTxt_.text)
				SetActive(arg_655_1.iconTrs_.gameObject, false)
				arg_655_1.callingController_:SetSelectedState("normal")

				local var_658_3 = arg_655_1:GetWordFromCfg(115301162)
				local var_658_4 = arg_655_1:FormatText(var_658_3.content)

				arg_655_1.text_.text = var_658_4

				LuaForUtil.ClearLinePrefixSymbol(arg_655_1.text_)

				local var_658_5 = 11
				local var_658_6 = utf8.len(var_658_4)
				local var_658_7 = var_658_5 <= 0 and var_658_1 or var_658_1 * (var_658_6 / var_658_5)

				if var_658_7 > 0 and var_658_1 < var_658_7 then
					arg_655_1.talkMaxDuration = var_658_7

					if var_658_7 + var_658_0 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_7 + var_658_0
					end
				end

				arg_655_1.text_.text = var_658_4
				arg_655_1.typewritter.percent = 0

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301162", "story_v_out_115301.awb") ~= 0 then
					local var_658_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301162", "story_v_out_115301.awb") / 1000

					if var_658_8 + var_658_0 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_8 + var_658_0
					end

					if var_658_3.prefab_name ~= "" and arg_655_1.actors_[var_658_3.prefab_name] ~= nil then
						local var_658_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_655_1.actors_[var_658_3.prefab_name].transform, "story_v_out_115301", "115301162", "story_v_out_115301.awb")

						arg_655_1:RecordAudio("115301162", var_658_9)
						arg_655_1:RecordAudio("115301162", var_658_9)
					else
						arg_655_1:AudioAction("play", "voice", "story_v_out_115301", "115301162", "story_v_out_115301.awb")
					end

					arg_655_1:RecordHistoryTalkVoice("story_v_out_115301", "115301162", "story_v_out_115301.awb")
				end

				arg_655_1:RecordContent(arg_655_1.text_.text)
			end

			local var_658_10 = math.max(var_658_1, arg_655_1.talkMaxDuration)

			if var_658_0 <= arg_655_1.time_ and arg_655_1.time_ < var_658_0 + var_658_10 then
				arg_655_1.typewritter.percent = (arg_655_1.time_ - var_658_0) / var_658_10

				arg_655_1.typewritter:SetDirty()
			end

			if arg_655_1.time_ >= var_658_0 + var_658_10 and arg_655_1.time_ < var_658_0 + var_658_10 + arg_658_0 then
				arg_655_1.typewritter.percent = 1

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(true)
			end
		end
	end,
	Play115301163 = function(arg_659_0, arg_659_1)
		arg_659_1.time_ = 0
		arg_659_1.frameCnt_ = 0
		arg_659_1.state_ = "playing"
		arg_659_1.curTalkId_ = 115301163
		arg_659_1.duration_ = 9.233

		local var_659_0 = {
			ja = 8.233,
			ko = 8.4,
			zh = 9.233,
			en = 8.666
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
				arg_659_0:Play115301164(arg_659_1)
			end
		end

		function arg_659_1.onSingleLineUpdate_(arg_662_0)
			local var_662_0 = arg_659_1.actors_["1038"]
			local var_662_1 = 0

			if var_662_1 < arg_659_1.time_ and arg_659_1.time_ <= var_662_1 + arg_662_0 and arg_659_1.var_.actorSpriteComps1038 == nil then
				arg_659_1.var_.actorSpriteComps1038 = var_662_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_662_2 = 0.2

			if var_662_1 <= arg_659_1.time_ and arg_659_1.time_ < var_662_1 + var_662_2 then
				local var_662_3 = (arg_659_1.time_ - var_662_1) / var_662_2

				if arg_659_1.var_.actorSpriteComps1038 then
					for iter_662_0, iter_662_1 in pairs(arg_659_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_662_1 then
							local var_662_4 = Mathf.Lerp(iter_662_1.color.r, 1, var_662_3)

							iter_662_1.color = Color.New(var_662_4, var_662_4, var_662_4)
						end
					end
				end
			end

			if arg_659_1.time_ >= var_662_1 + var_662_2 and arg_659_1.time_ < var_662_1 + var_662_2 + arg_662_0 and arg_659_1.var_.actorSpriteComps1038 then
				local var_662_5 = 1

				for iter_662_2, iter_662_3 in pairs(arg_659_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_662_3 then
						iter_662_3.color = Color.New(var_662_5, var_662_5, var_662_5)
					end
				end

				arg_659_1.var_.actorSpriteComps1038 = nil
			end

			local var_662_6 = 0
			local var_662_7 = 0.8

			if var_662_6 < arg_659_1.time_ and arg_659_1.time_ <= var_662_6 + arg_662_0 then
				arg_659_1.talkMaxDuration = 0
				arg_659_1.dialogCg_.alpha = 1

				arg_659_1.dialog_:SetActive(true)
				SetActive(arg_659_1.leftNameGo_, true)

				local var_662_8 = arg_659_1:FormatText(StoryNameCfg[94].name)

				arg_659_1.leftNameTxt_.text = var_662_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_659_1.leftNameTxt_.transform)

				arg_659_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_659_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_659_1:RecordName(arg_659_1.leftNameTxt_.text)
				SetActive(arg_659_1.iconTrs_.gameObject, false)
				arg_659_1.callingController_:SetSelectedState("normal")

				local var_662_9 = arg_659_1:GetWordFromCfg(115301163)
				local var_662_10 = arg_659_1:FormatText(var_662_9.content)

				arg_659_1.text_.text = var_662_10

				LuaForUtil.ClearLinePrefixSymbol(arg_659_1.text_)

				local var_662_11 = 32
				local var_662_12 = utf8.len(var_662_10)
				local var_662_13 = var_662_11 <= 0 and var_662_7 or var_662_7 * (var_662_12 / var_662_11)

				if var_662_13 > 0 and var_662_7 < var_662_13 then
					arg_659_1.talkMaxDuration = var_662_13

					if var_662_13 + var_662_6 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_13 + var_662_6
					end
				end

				arg_659_1.text_.text = var_662_10
				arg_659_1.typewritter.percent = 0

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301163", "story_v_out_115301.awb") ~= 0 then
					local var_662_14 = manager.audio:GetVoiceLength("story_v_out_115301", "115301163", "story_v_out_115301.awb") / 1000

					if var_662_14 + var_662_6 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_14 + var_662_6
					end

					if var_662_9.prefab_name ~= "" and arg_659_1.actors_[var_662_9.prefab_name] ~= nil then
						local var_662_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_659_1.actors_[var_662_9.prefab_name].transform, "story_v_out_115301", "115301163", "story_v_out_115301.awb")

						arg_659_1:RecordAudio("115301163", var_662_15)
						arg_659_1:RecordAudio("115301163", var_662_15)
					else
						arg_659_1:AudioAction("play", "voice", "story_v_out_115301", "115301163", "story_v_out_115301.awb")
					end

					arg_659_1:RecordHistoryTalkVoice("story_v_out_115301", "115301163", "story_v_out_115301.awb")
				end

				arg_659_1:RecordContent(arg_659_1.text_.text)
			end

			local var_662_16 = math.max(var_662_7, arg_659_1.talkMaxDuration)

			if var_662_6 <= arg_659_1.time_ and arg_659_1.time_ < var_662_6 + var_662_16 then
				arg_659_1.typewritter.percent = (arg_659_1.time_ - var_662_6) / var_662_16

				arg_659_1.typewritter:SetDirty()
			end

			if arg_659_1.time_ >= var_662_6 + var_662_16 and arg_659_1.time_ < var_662_6 + var_662_16 + arg_662_0 then
				arg_659_1.typewritter.percent = 1

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(true)
			end
		end
	end,
	Play115301164 = function(arg_663_0, arg_663_1)
		arg_663_1.time_ = 0
		arg_663_1.frameCnt_ = 0
		arg_663_1.state_ = "playing"
		arg_663_1.curTalkId_ = 115301164
		arg_663_1.duration_ = 6.3

		local var_663_0 = {
			ja = 6.3,
			ko = 6.266,
			zh = 5.433,
			en = 5.633
		}
		local var_663_1 = manager.audio:GetLocalizationFlag()

		if var_663_0[var_663_1] ~= nil then
			arg_663_1.duration_ = var_663_0[var_663_1]
		end

		SetActive(arg_663_1.tipsGo_, false)

		function arg_663_1.onSingleLineFinish_()
			arg_663_1.onSingleLineUpdate_ = nil
			arg_663_1.onSingleLineFinish_ = nil
			arg_663_1.state_ = "waiting"
		end

		function arg_663_1.playNext_(arg_665_0)
			if arg_665_0 == 1 then
				arg_663_0:Play115301165(arg_663_1)
			end
		end

		function arg_663_1.onSingleLineUpdate_(arg_666_0)
			local var_666_0 = 0
			local var_666_1 = 0.525

			if var_666_0 < arg_663_1.time_ and arg_663_1.time_ <= var_666_0 + arg_666_0 then
				arg_663_1.talkMaxDuration = 0
				arg_663_1.dialogCg_.alpha = 1

				arg_663_1.dialog_:SetActive(true)
				SetActive(arg_663_1.leftNameGo_, true)

				local var_666_2 = arg_663_1:FormatText(StoryNameCfg[94].name)

				arg_663_1.leftNameTxt_.text = var_666_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_663_1.leftNameTxt_.transform)

				arg_663_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_663_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_663_1:RecordName(arg_663_1.leftNameTxt_.text)
				SetActive(arg_663_1.iconTrs_.gameObject, false)
				arg_663_1.callingController_:SetSelectedState("normal")

				local var_666_3 = arg_663_1:GetWordFromCfg(115301164)
				local var_666_4 = arg_663_1:FormatText(var_666_3.content)

				arg_663_1.text_.text = var_666_4

				LuaForUtil.ClearLinePrefixSymbol(arg_663_1.text_)

				local var_666_5 = 21
				local var_666_6 = utf8.len(var_666_4)
				local var_666_7 = var_666_5 <= 0 and var_666_1 or var_666_1 * (var_666_6 / var_666_5)

				if var_666_7 > 0 and var_666_1 < var_666_7 then
					arg_663_1.talkMaxDuration = var_666_7

					if var_666_7 + var_666_0 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_7 + var_666_0
					end
				end

				arg_663_1.text_.text = var_666_4
				arg_663_1.typewritter.percent = 0

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301164", "story_v_out_115301.awb") ~= 0 then
					local var_666_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301164", "story_v_out_115301.awb") / 1000

					if var_666_8 + var_666_0 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_8 + var_666_0
					end

					if var_666_3.prefab_name ~= "" and arg_663_1.actors_[var_666_3.prefab_name] ~= nil then
						local var_666_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_663_1.actors_[var_666_3.prefab_name].transform, "story_v_out_115301", "115301164", "story_v_out_115301.awb")

						arg_663_1:RecordAudio("115301164", var_666_9)
						arg_663_1:RecordAudio("115301164", var_666_9)
					else
						arg_663_1:AudioAction("play", "voice", "story_v_out_115301", "115301164", "story_v_out_115301.awb")
					end

					arg_663_1:RecordHistoryTalkVoice("story_v_out_115301", "115301164", "story_v_out_115301.awb")
				end

				arg_663_1:RecordContent(arg_663_1.text_.text)
			end

			local var_666_10 = math.max(var_666_1, arg_663_1.talkMaxDuration)

			if var_666_0 <= arg_663_1.time_ and arg_663_1.time_ < var_666_0 + var_666_10 then
				arg_663_1.typewritter.percent = (arg_663_1.time_ - var_666_0) / var_666_10

				arg_663_1.typewritter:SetDirty()
			end

			if arg_663_1.time_ >= var_666_0 + var_666_10 and arg_663_1.time_ < var_666_0 + var_666_10 + arg_666_0 then
				arg_663_1.typewritter.percent = 1

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(true)
			end
		end
	end,
	Play115301165 = function(arg_667_0, arg_667_1)
		arg_667_1.time_ = 0
		arg_667_1.frameCnt_ = 0
		arg_667_1.state_ = "playing"
		arg_667_1.curTalkId_ = 115301165
		arg_667_1.duration_ = 6.1

		local var_667_0 = {
			ja = 4.9,
			ko = 5.233,
			zh = 6.1,
			en = 4.866
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
				arg_667_0:Play115301166(arg_667_1)
			end
		end

		function arg_667_1.onSingleLineUpdate_(arg_670_0)
			local var_670_0 = arg_667_1.actors_["1038"]
			local var_670_1 = 0

			if var_670_1 < arg_667_1.time_ and arg_667_1.time_ <= var_670_1 + arg_670_0 and arg_667_1.var_.actorSpriteComps1038 == nil then
				arg_667_1.var_.actorSpriteComps1038 = var_670_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_670_2 = 0.2

			if var_670_1 <= arg_667_1.time_ and arg_667_1.time_ < var_670_1 + var_670_2 then
				local var_670_3 = (arg_667_1.time_ - var_670_1) / var_670_2

				if arg_667_1.var_.actorSpriteComps1038 then
					for iter_670_0, iter_670_1 in pairs(arg_667_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_670_1 then
							local var_670_4 = Mathf.Lerp(iter_670_1.color.r, 0.5, var_670_3)

							iter_670_1.color = Color.New(var_670_4, var_670_4, var_670_4)
						end
					end
				end
			end

			if arg_667_1.time_ >= var_670_1 + var_670_2 and arg_667_1.time_ < var_670_1 + var_670_2 + arg_670_0 and arg_667_1.var_.actorSpriteComps1038 then
				local var_670_5 = 0.5

				for iter_670_2, iter_670_3 in pairs(arg_667_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_670_3 then
						iter_670_3.color = Color.New(var_670_5, var_670_5, var_670_5)
					end
				end

				arg_667_1.var_.actorSpriteComps1038 = nil
			end

			local var_670_6 = 0
			local var_670_7 = 0.45

			if var_670_6 < arg_667_1.time_ and arg_667_1.time_ <= var_670_6 + arg_670_0 then
				arg_667_1.talkMaxDuration = 0
				arg_667_1.dialogCg_.alpha = 1

				arg_667_1.dialog_:SetActive(true)
				SetActive(arg_667_1.leftNameGo_, true)

				local var_670_8 = arg_667_1:FormatText(StoryNameCfg[36].name)

				arg_667_1.leftNameTxt_.text = var_670_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_667_1.leftNameTxt_.transform)

				arg_667_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_667_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_667_1:RecordName(arg_667_1.leftNameTxt_.text)
				SetActive(arg_667_1.iconTrs_.gameObject, false)
				arg_667_1.callingController_:SetSelectedState("normal")

				local var_670_9 = arg_667_1:GetWordFromCfg(115301165)
				local var_670_10 = arg_667_1:FormatText(var_670_9.content)

				arg_667_1.text_.text = var_670_10

				LuaForUtil.ClearLinePrefixSymbol(arg_667_1.text_)

				local var_670_11 = 18
				local var_670_12 = utf8.len(var_670_10)
				local var_670_13 = var_670_11 <= 0 and var_670_7 or var_670_7 * (var_670_12 / var_670_11)

				if var_670_13 > 0 and var_670_7 < var_670_13 then
					arg_667_1.talkMaxDuration = var_670_13

					if var_670_13 + var_670_6 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_13 + var_670_6
					end
				end

				arg_667_1.text_.text = var_670_10
				arg_667_1.typewritter.percent = 0

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301165", "story_v_out_115301.awb") ~= 0 then
					local var_670_14 = manager.audio:GetVoiceLength("story_v_out_115301", "115301165", "story_v_out_115301.awb") / 1000

					if var_670_14 + var_670_6 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_14 + var_670_6
					end

					if var_670_9.prefab_name ~= "" and arg_667_1.actors_[var_670_9.prefab_name] ~= nil then
						local var_670_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_667_1.actors_[var_670_9.prefab_name].transform, "story_v_out_115301", "115301165", "story_v_out_115301.awb")

						arg_667_1:RecordAudio("115301165", var_670_15)
						arg_667_1:RecordAudio("115301165", var_670_15)
					else
						arg_667_1:AudioAction("play", "voice", "story_v_out_115301", "115301165", "story_v_out_115301.awb")
					end

					arg_667_1:RecordHistoryTalkVoice("story_v_out_115301", "115301165", "story_v_out_115301.awb")
				end

				arg_667_1:RecordContent(arg_667_1.text_.text)
			end

			local var_670_16 = math.max(var_670_7, arg_667_1.talkMaxDuration)

			if var_670_6 <= arg_667_1.time_ and arg_667_1.time_ < var_670_6 + var_670_16 then
				arg_667_1.typewritter.percent = (arg_667_1.time_ - var_670_6) / var_670_16

				arg_667_1.typewritter:SetDirty()
			end

			if arg_667_1.time_ >= var_670_6 + var_670_16 and arg_667_1.time_ < var_670_6 + var_670_16 + arg_670_0 then
				arg_667_1.typewritter.percent = 1

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(true)
			end
		end
	end,
	Play115301166 = function(arg_671_0, arg_671_1)
		arg_671_1.time_ = 0
		arg_671_1.frameCnt_ = 0
		arg_671_1.state_ = "playing"
		arg_671_1.curTalkId_ = 115301166
		arg_671_1.duration_ = 18.433

		local var_671_0 = {
			ja = 12.6,
			ko = 14.066,
			zh = 13.6,
			en = 18.433
		}
		local var_671_1 = manager.audio:GetLocalizationFlag()

		if var_671_0[var_671_1] ~= nil then
			arg_671_1.duration_ = var_671_0[var_671_1]
		end

		SetActive(arg_671_1.tipsGo_, false)

		function arg_671_1.onSingleLineFinish_()
			arg_671_1.onSingleLineUpdate_ = nil
			arg_671_1.onSingleLineFinish_ = nil
			arg_671_1.state_ = "waiting"
		end

		function arg_671_1.playNext_(arg_673_0)
			if arg_673_0 == 1 then
				arg_671_0:Play115301167(arg_671_1)
			end
		end

		function arg_671_1.onSingleLineUpdate_(arg_674_0)
			local var_674_0 = 0
			local var_674_1 = 1.25

			if var_674_0 < arg_671_1.time_ and arg_671_1.time_ <= var_674_0 + arg_674_0 then
				arg_671_1.talkMaxDuration = 0
				arg_671_1.dialogCg_.alpha = 1

				arg_671_1.dialog_:SetActive(true)
				SetActive(arg_671_1.leftNameGo_, true)

				local var_674_2 = arg_671_1:FormatText(StoryNameCfg[36].name)

				arg_671_1.leftNameTxt_.text = var_674_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_671_1.leftNameTxt_.transform)

				arg_671_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_671_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_671_1:RecordName(arg_671_1.leftNameTxt_.text)
				SetActive(arg_671_1.iconTrs_.gameObject, false)
				arg_671_1.callingController_:SetSelectedState("normal")

				local var_674_3 = arg_671_1:GetWordFromCfg(115301166)
				local var_674_4 = arg_671_1:FormatText(var_674_3.content)

				arg_671_1.text_.text = var_674_4

				LuaForUtil.ClearLinePrefixSymbol(arg_671_1.text_)

				local var_674_5 = 50
				local var_674_6 = utf8.len(var_674_4)
				local var_674_7 = var_674_5 <= 0 and var_674_1 or var_674_1 * (var_674_6 / var_674_5)

				if var_674_7 > 0 and var_674_1 < var_674_7 then
					arg_671_1.talkMaxDuration = var_674_7

					if var_674_7 + var_674_0 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_7 + var_674_0
					end
				end

				arg_671_1.text_.text = var_674_4
				arg_671_1.typewritter.percent = 0

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301166", "story_v_out_115301.awb") ~= 0 then
					local var_674_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301166", "story_v_out_115301.awb") / 1000

					if var_674_8 + var_674_0 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_8 + var_674_0
					end

					if var_674_3.prefab_name ~= "" and arg_671_1.actors_[var_674_3.prefab_name] ~= nil then
						local var_674_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_671_1.actors_[var_674_3.prefab_name].transform, "story_v_out_115301", "115301166", "story_v_out_115301.awb")

						arg_671_1:RecordAudio("115301166", var_674_9)
						arg_671_1:RecordAudio("115301166", var_674_9)
					else
						arg_671_1:AudioAction("play", "voice", "story_v_out_115301", "115301166", "story_v_out_115301.awb")
					end

					arg_671_1:RecordHistoryTalkVoice("story_v_out_115301", "115301166", "story_v_out_115301.awb")
				end

				arg_671_1:RecordContent(arg_671_1.text_.text)
			end

			local var_674_10 = math.max(var_674_1, arg_671_1.talkMaxDuration)

			if var_674_0 <= arg_671_1.time_ and arg_671_1.time_ < var_674_0 + var_674_10 then
				arg_671_1.typewritter.percent = (arg_671_1.time_ - var_674_0) / var_674_10

				arg_671_1.typewritter:SetDirty()
			end

			if arg_671_1.time_ >= var_674_0 + var_674_10 and arg_671_1.time_ < var_674_0 + var_674_10 + arg_674_0 then
				arg_671_1.typewritter.percent = 1

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(true)
			end
		end
	end,
	Play115301167 = function(arg_675_0, arg_675_1)
		arg_675_1.time_ = 0
		arg_675_1.frameCnt_ = 0
		arg_675_1.state_ = "playing"
		arg_675_1.curTalkId_ = 115301167
		arg_675_1.duration_ = 9.966

		local var_675_0 = {
			ja = 9.2,
			ko = 9.133,
			zh = 9.966,
			en = 9.466
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
				arg_675_0:Play115301168(arg_675_1)
			end
		end

		function arg_675_1.onSingleLineUpdate_(arg_678_0)
			local var_678_0 = 0
			local var_678_1 = 0.925

			if var_678_0 < arg_675_1.time_ and arg_675_1.time_ <= var_678_0 + arg_678_0 then
				arg_675_1.talkMaxDuration = 0
				arg_675_1.dialogCg_.alpha = 1

				arg_675_1.dialog_:SetActive(true)
				SetActive(arg_675_1.leftNameGo_, true)

				local var_678_2 = arg_675_1:FormatText(StoryNameCfg[36].name)

				arg_675_1.leftNameTxt_.text = var_678_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_675_1.leftNameTxt_.transform)

				arg_675_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_675_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_675_1:RecordName(arg_675_1.leftNameTxt_.text)
				SetActive(arg_675_1.iconTrs_.gameObject, false)
				arg_675_1.callingController_:SetSelectedState("normal")

				local var_678_3 = arg_675_1:GetWordFromCfg(115301167)
				local var_678_4 = arg_675_1:FormatText(var_678_3.content)

				arg_675_1.text_.text = var_678_4

				LuaForUtil.ClearLinePrefixSymbol(arg_675_1.text_)

				local var_678_5 = 37
				local var_678_6 = utf8.len(var_678_4)
				local var_678_7 = var_678_5 <= 0 and var_678_1 or var_678_1 * (var_678_6 / var_678_5)

				if var_678_7 > 0 and var_678_1 < var_678_7 then
					arg_675_1.talkMaxDuration = var_678_7

					if var_678_7 + var_678_0 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_7 + var_678_0
					end
				end

				arg_675_1.text_.text = var_678_4
				arg_675_1.typewritter.percent = 0

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301167", "story_v_out_115301.awb") ~= 0 then
					local var_678_8 = manager.audio:GetVoiceLength("story_v_out_115301", "115301167", "story_v_out_115301.awb") / 1000

					if var_678_8 + var_678_0 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_8 + var_678_0
					end

					if var_678_3.prefab_name ~= "" and arg_675_1.actors_[var_678_3.prefab_name] ~= nil then
						local var_678_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_675_1.actors_[var_678_3.prefab_name].transform, "story_v_out_115301", "115301167", "story_v_out_115301.awb")

						arg_675_1:RecordAudio("115301167", var_678_9)
						arg_675_1:RecordAudio("115301167", var_678_9)
					else
						arg_675_1:AudioAction("play", "voice", "story_v_out_115301", "115301167", "story_v_out_115301.awb")
					end

					arg_675_1:RecordHistoryTalkVoice("story_v_out_115301", "115301167", "story_v_out_115301.awb")
				end

				arg_675_1:RecordContent(arg_675_1.text_.text)
			end

			local var_678_10 = math.max(var_678_1, arg_675_1.talkMaxDuration)

			if var_678_0 <= arg_675_1.time_ and arg_675_1.time_ < var_678_0 + var_678_10 then
				arg_675_1.typewritter.percent = (arg_675_1.time_ - var_678_0) / var_678_10

				arg_675_1.typewritter:SetDirty()
			end

			if arg_675_1.time_ >= var_678_0 + var_678_10 and arg_675_1.time_ < var_678_0 + var_678_10 + arg_678_0 then
				arg_675_1.typewritter.percent = 1

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(true)
			end
		end
	end,
	Play115301168 = function(arg_679_0, arg_679_1)
		arg_679_1.time_ = 0
		arg_679_1.frameCnt_ = 0
		arg_679_1.state_ = "playing"
		arg_679_1.curTalkId_ = 115301168
		arg_679_1.duration_ = 9

		SetActive(arg_679_1.tipsGo_, false)

		function arg_679_1.onSingleLineFinish_()
			arg_679_1.onSingleLineUpdate_ = nil
			arg_679_1.onSingleLineFinish_ = nil
			arg_679_1.state_ = "waiting"
		end

		function arg_679_1.playNext_(arg_681_0)
			if arg_681_0 == 1 then
				arg_679_0:Play115301169(arg_679_1)
			end
		end

		function arg_679_1.onSingleLineUpdate_(arg_682_0)
			local var_682_0 = 2

			if var_682_0 < arg_679_1.time_ and arg_679_1.time_ <= var_682_0 + arg_682_0 then
				local var_682_1 = manager.ui.mainCamera.transform.localPosition
				local var_682_2 = Vector3.New(0, 0, 10) + Vector3.New(var_682_1.x, var_682_1.y, 0)
				local var_682_3 = arg_679_1.bgs_.F01

				var_682_3.transform.localPosition = var_682_2
				var_682_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_682_4 = var_682_3:GetComponent("SpriteRenderer")

				if var_682_4 and var_682_4.sprite then
					local var_682_5 = (var_682_3.transform.localPosition - var_682_1).z
					local var_682_6 = manager.ui.mainCameraCom_
					local var_682_7 = 2 * var_682_5 * Mathf.Tan(var_682_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_682_8 = var_682_7 * var_682_6.aspect
					local var_682_9 = var_682_4.sprite.bounds.size.x
					local var_682_10 = var_682_4.sprite.bounds.size.y
					local var_682_11 = var_682_8 / var_682_9
					local var_682_12 = var_682_7 / var_682_10
					local var_682_13 = var_682_12 < var_682_11 and var_682_11 or var_682_12

					var_682_3.transform.localScale = Vector3.New(var_682_13, var_682_13, 0)
				end

				for iter_682_0, iter_682_1 in pairs(arg_679_1.bgs_) do
					if iter_682_0 ~= "F01" then
						iter_682_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_682_14 = 0

			if var_682_14 < arg_679_1.time_ and arg_679_1.time_ <= var_682_14 + arg_682_0 then
				arg_679_1.mask_.enabled = true
				arg_679_1.mask_.raycastTarget = false

				arg_679_1:SetGaussion(false)
			end

			local var_682_15 = 2

			if var_682_14 <= arg_679_1.time_ and arg_679_1.time_ < var_682_14 + var_682_15 then
				local var_682_16 = (arg_679_1.time_ - var_682_14) / var_682_15
				local var_682_17 = Color.New(0, 0, 0)

				var_682_17.a = Mathf.Lerp(0, 1, var_682_16)
				arg_679_1.mask_.color = var_682_17
			end

			if arg_679_1.time_ >= var_682_14 + var_682_15 and arg_679_1.time_ < var_682_14 + var_682_15 + arg_682_0 then
				local var_682_18 = Color.New(0, 0, 0)

				var_682_18.a = 1
				arg_679_1.mask_.color = var_682_18
			end

			local var_682_19 = 2

			if var_682_19 < arg_679_1.time_ and arg_679_1.time_ <= var_682_19 + arg_682_0 then
				arg_679_1.mask_.enabled = true
				arg_679_1.mask_.raycastTarget = false

				arg_679_1:SetGaussion(false)
			end

			local var_682_20 = 2

			if var_682_19 <= arg_679_1.time_ and arg_679_1.time_ < var_682_19 + var_682_20 then
				local var_682_21 = (arg_679_1.time_ - var_682_19) / var_682_20
				local var_682_22 = Color.New(0, 0, 0)

				var_682_22.a = Mathf.Lerp(1, 0, var_682_21)
				arg_679_1.mask_.color = var_682_22
			end

			if arg_679_1.time_ >= var_682_19 + var_682_20 and arg_679_1.time_ < var_682_19 + var_682_20 + arg_682_0 then
				local var_682_23 = Color.New(0, 0, 0)
				local var_682_24 = 0

				arg_679_1.mask_.enabled = false
				var_682_23.a = var_682_24
				arg_679_1.mask_.color = var_682_23
			end

			local var_682_25 = arg_679_1.actors_["1038"].transform
			local var_682_26 = 2

			if var_682_26 < arg_679_1.time_ and arg_679_1.time_ <= var_682_26 + arg_682_0 then
				arg_679_1.var_.moveOldPos1038 = var_682_25.localPosition
				var_682_25.localScale = Vector3.New(1, 1, 1)

				arg_679_1:CheckSpriteTmpPos("1038", 0)

				local var_682_27 = var_682_25.childCount

				for iter_682_2 = 0, var_682_27 - 1 do
					local var_682_28 = var_682_25:GetChild(iter_682_2)

					if var_682_28.name == "split_1" or not string.find(var_682_28.name, "split") then
						var_682_28.gameObject:SetActive(true)
					else
						var_682_28.gameObject:SetActive(false)
					end
				end
			end

			local var_682_29 = 0.001

			if var_682_26 <= arg_679_1.time_ and arg_679_1.time_ < var_682_26 + var_682_29 then
				local var_682_30 = (arg_679_1.time_ - var_682_26) / var_682_29
				local var_682_31 = Vector3.New(-2000, -400, 0)

				var_682_25.localPosition = Vector3.Lerp(arg_679_1.var_.moveOldPos1038, var_682_31, var_682_30)
			end

			if arg_679_1.time_ >= var_682_26 + var_682_29 and arg_679_1.time_ < var_682_26 + var_682_29 + arg_682_0 then
				var_682_25.localPosition = Vector3.New(-2000, -400, 0)
			end

			local var_682_32 = 2

			if var_682_32 < arg_679_1.time_ and arg_679_1.time_ <= var_682_32 + arg_682_0 then
				arg_679_1.screenFilterGo_:SetActive(false)
			end

			local var_682_33 = 0.0166666666666667

			if var_682_32 <= arg_679_1.time_ and arg_679_1.time_ < var_682_32 + var_682_33 then
				local var_682_34 = (arg_679_1.time_ - var_682_32) / var_682_33

				arg_679_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_682_34)
			end

			if arg_679_1.time_ >= var_682_32 + var_682_33 and arg_679_1.time_ < var_682_32 + var_682_33 + arg_682_0 then
				arg_679_1.screenFilterEffect_.weight = 0
			end

			if arg_679_1.frameCnt_ <= 1 then
				arg_679_1.dialog_:SetActive(false)
			end

			local var_682_35 = 4
			local var_682_36 = 0.625

			if var_682_35 < arg_679_1.time_ and arg_679_1.time_ <= var_682_35 + arg_682_0 then
				arg_679_1.talkMaxDuration = 0

				arg_679_1.dialog_:SetActive(true)

				local var_682_37 = LeanTween.value(arg_679_1.dialog_, 0, 1, 0.3)

				var_682_37:setOnUpdate(LuaHelper.FloatAction(function(arg_683_0)
					arg_679_1.dialogCg_.alpha = arg_683_0
				end))
				var_682_37:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_679_1.dialog_)
					var_682_37:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_679_1.duration_ = arg_679_1.duration_ + 0.3

				SetActive(arg_679_1.leftNameGo_, false)

				arg_679_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_679_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_679_1:RecordName(arg_679_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_679_1.iconTrs_.gameObject, false)
				arg_679_1.callingController_:SetSelectedState("normal")

				local var_682_38 = arg_679_1:GetWordFromCfg(115301168)
				local var_682_39 = arg_679_1:FormatText(var_682_38.content)

				arg_679_1.text_.text = var_682_39

				LuaForUtil.ClearLinePrefixSymbol(arg_679_1.text_)

				local var_682_40 = 25
				local var_682_41 = utf8.len(var_682_39)
				local var_682_42 = var_682_40 <= 0 and var_682_36 or var_682_36 * (var_682_41 / var_682_40)

				if var_682_42 > 0 and var_682_36 < var_682_42 then
					arg_679_1.talkMaxDuration = var_682_42
					var_682_35 = var_682_35 + 0.3

					if var_682_42 + var_682_35 > arg_679_1.duration_ then
						arg_679_1.duration_ = var_682_42 + var_682_35
					end
				end

				arg_679_1.text_.text = var_682_39
				arg_679_1.typewritter.percent = 0

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(false)
				arg_679_1:RecordContent(arg_679_1.text_.text)
			end

			local var_682_43 = var_682_35 + 0.3
			local var_682_44 = math.max(var_682_36, arg_679_1.talkMaxDuration)

			if var_682_43 <= arg_679_1.time_ and arg_679_1.time_ < var_682_43 + var_682_44 then
				arg_679_1.typewritter.percent = (arg_679_1.time_ - var_682_43) / var_682_44

				arg_679_1.typewritter:SetDirty()
			end

			if arg_679_1.time_ >= var_682_43 + var_682_44 and arg_679_1.time_ < var_682_43 + var_682_44 + arg_682_0 then
				arg_679_1.typewritter.percent = 1

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(true)
			end
		end
	end,
	Play115301169 = function(arg_685_0, arg_685_1)
		arg_685_1.time_ = 0
		arg_685_1.frameCnt_ = 0
		arg_685_1.state_ = "playing"
		arg_685_1.curTalkId_ = 115301169
		arg_685_1.duration_ = 9.766

		local var_685_0 = {
			ja = 8.466,
			ko = 9.233,
			zh = 9.766,
			en = 6.9
		}
		local var_685_1 = manager.audio:GetLocalizationFlag()

		if var_685_0[var_685_1] ~= nil then
			arg_685_1.duration_ = var_685_0[var_685_1]
		end

		SetActive(arg_685_1.tipsGo_, false)

		function arg_685_1.onSingleLineFinish_()
			arg_685_1.onSingleLineUpdate_ = nil
			arg_685_1.onSingleLineFinish_ = nil
			arg_685_1.state_ = "waiting"
			arg_685_1.auto_ = false
		end

		function arg_685_1.playNext_(arg_687_0)
			arg_685_1.onStoryFinished_()
		end

		function arg_685_1.onSingleLineUpdate_(arg_688_0)
			local var_688_0 = arg_685_1.actors_["1038"].transform
			local var_688_1 = 0

			if var_688_1 < arg_685_1.time_ and arg_685_1.time_ <= var_688_1 + arg_688_0 then
				arg_685_1.var_.moveOldPos1038 = var_688_0.localPosition
				var_688_0.localScale = Vector3.New(1, 1, 1)

				arg_685_1:CheckSpriteTmpPos("1038", 3)

				local var_688_2 = var_688_0.childCount

				for iter_688_0 = 0, var_688_2 - 1 do
					local var_688_3 = var_688_0:GetChild(iter_688_0)

					if var_688_3.name == "split_9" or not string.find(var_688_3.name, "split") then
						var_688_3.gameObject:SetActive(true)
					else
						var_688_3.gameObject:SetActive(false)
					end
				end
			end

			local var_688_4 = 0.001

			if var_688_1 <= arg_685_1.time_ and arg_685_1.time_ < var_688_1 + var_688_4 then
				local var_688_5 = (arg_685_1.time_ - var_688_1) / var_688_4
				local var_688_6 = Vector3.New(0, -400, 0)

				var_688_0.localPosition = Vector3.Lerp(arg_685_1.var_.moveOldPos1038, var_688_6, var_688_5)
			end

			if arg_685_1.time_ >= var_688_1 + var_688_4 and arg_685_1.time_ < var_688_1 + var_688_4 + arg_688_0 then
				var_688_0.localPosition = Vector3.New(0, -400, 0)
			end

			local var_688_7 = arg_685_1.actors_["1038"]
			local var_688_8 = 0

			if var_688_8 < arg_685_1.time_ and arg_685_1.time_ <= var_688_8 + arg_688_0 and arg_685_1.var_.actorSpriteComps1038 == nil then
				arg_685_1.var_.actorSpriteComps1038 = var_688_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_688_9 = 0.2

			if var_688_8 <= arg_685_1.time_ and arg_685_1.time_ < var_688_8 + var_688_9 then
				local var_688_10 = (arg_685_1.time_ - var_688_8) / var_688_9

				if arg_685_1.var_.actorSpriteComps1038 then
					for iter_688_1, iter_688_2 in pairs(arg_685_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_688_2 then
							local var_688_11 = Mathf.Lerp(iter_688_2.color.r, 1, var_688_10)

							iter_688_2.color = Color.New(var_688_11, var_688_11, var_688_11)
						end
					end
				end
			end

			if arg_685_1.time_ >= var_688_8 + var_688_9 and arg_685_1.time_ < var_688_8 + var_688_9 + arg_688_0 and arg_685_1.var_.actorSpriteComps1038 then
				local var_688_12 = 1

				for iter_688_3, iter_688_4 in pairs(arg_685_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_688_4 then
						iter_688_4.color = Color.New(var_688_12, var_688_12, var_688_12)
					end
				end

				arg_685_1.var_.actorSpriteComps1038 = nil
			end

			local var_688_13 = arg_685_1.actors_["1038"]
			local var_688_14 = 0

			if var_688_14 < arg_685_1.time_ and arg_685_1.time_ <= var_688_14 + arg_688_0 then
				local var_688_15 = var_688_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_688_15 then
					arg_685_1.var_.alphaOldValue1038 = var_688_15.alpha
					arg_685_1.var_.characterEffect1038 = var_688_15
				end

				arg_685_1.var_.alphaOldValue1038 = 0
			end

			local var_688_16 = 0.333333333333333

			if var_688_14 <= arg_685_1.time_ and arg_685_1.time_ < var_688_14 + var_688_16 then
				local var_688_17 = (arg_685_1.time_ - var_688_14) / var_688_16
				local var_688_18 = Mathf.Lerp(arg_685_1.var_.alphaOldValue1038, 1, var_688_17)

				if arg_685_1.var_.characterEffect1038 then
					arg_685_1.var_.characterEffect1038.alpha = var_688_18
				end
			end

			if arg_685_1.time_ >= var_688_14 + var_688_16 and arg_685_1.time_ < var_688_14 + var_688_16 + arg_688_0 and arg_685_1.var_.characterEffect1038 then
				arg_685_1.var_.characterEffect1038.alpha = 1
			end

			local var_688_19 = 0
			local var_688_20 = 0.7

			if var_688_19 < arg_685_1.time_ and arg_685_1.time_ <= var_688_19 + arg_688_0 then
				arg_685_1.talkMaxDuration = 0
				arg_685_1.dialogCg_.alpha = 1

				arg_685_1.dialog_:SetActive(true)
				SetActive(arg_685_1.leftNameGo_, true)

				local var_688_21 = arg_685_1:FormatText(StoryNameCfg[94].name)

				arg_685_1.leftNameTxt_.text = var_688_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_685_1.leftNameTxt_.transform)

				arg_685_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_685_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_685_1:RecordName(arg_685_1.leftNameTxt_.text)
				SetActive(arg_685_1.iconTrs_.gameObject, false)
				arg_685_1.callingController_:SetSelectedState("normal")

				local var_688_22 = arg_685_1:GetWordFromCfg(115301169)
				local var_688_23 = arg_685_1:FormatText(var_688_22.content)

				arg_685_1.text_.text = var_688_23

				LuaForUtil.ClearLinePrefixSymbol(arg_685_1.text_)

				local var_688_24 = 28
				local var_688_25 = utf8.len(var_688_23)
				local var_688_26 = var_688_24 <= 0 and var_688_20 or var_688_20 * (var_688_25 / var_688_24)

				if var_688_26 > 0 and var_688_20 < var_688_26 then
					arg_685_1.talkMaxDuration = var_688_26

					if var_688_26 + var_688_19 > arg_685_1.duration_ then
						arg_685_1.duration_ = var_688_26 + var_688_19
					end
				end

				arg_685_1.text_.text = var_688_23
				arg_685_1.typewritter.percent = 0

				arg_685_1.typewritter:SetDirty()
				arg_685_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115301", "115301169", "story_v_out_115301.awb") ~= 0 then
					local var_688_27 = manager.audio:GetVoiceLength("story_v_out_115301", "115301169", "story_v_out_115301.awb") / 1000

					if var_688_27 + var_688_19 > arg_685_1.duration_ then
						arg_685_1.duration_ = var_688_27 + var_688_19
					end

					if var_688_22.prefab_name ~= "" and arg_685_1.actors_[var_688_22.prefab_name] ~= nil then
						local var_688_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_685_1.actors_[var_688_22.prefab_name].transform, "story_v_out_115301", "115301169", "story_v_out_115301.awb")

						arg_685_1:RecordAudio("115301169", var_688_28)
						arg_685_1:RecordAudio("115301169", var_688_28)
					else
						arg_685_1:AudioAction("play", "voice", "story_v_out_115301", "115301169", "story_v_out_115301.awb")
					end

					arg_685_1:RecordHistoryTalkVoice("story_v_out_115301", "115301169", "story_v_out_115301.awb")
				end

				arg_685_1:RecordContent(arg_685_1.text_.text)
			end

			local var_688_29 = math.max(var_688_20, arg_685_1.talkMaxDuration)

			if var_688_19 <= arg_685_1.time_ and arg_685_1.time_ < var_688_19 + var_688_29 then
				arg_685_1.typewritter.percent = (arg_685_1.time_ - var_688_19) / var_688_29

				arg_685_1.typewritter:SetDirty()
			end

			if arg_685_1.time_ >= var_688_19 + var_688_29 and arg_685_1.time_ < var_688_19 + var_688_29 + arg_688_0 then
				arg_685_1.typewritter.percent = 1

				arg_685_1.typewritter:SetDirty()
				arg_685_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/F01",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/RO0503",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST22",
		"Assets/UIResources/UI_AB/TextureConfig/Background/F01a"
	},
	voices = {
		"story_v_out_115301.awb"
	}
}
