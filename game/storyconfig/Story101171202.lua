return {
	Play117122001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 117122001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play117122002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I08a"

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
				local var_4_5 = arg_1_1.bgs_.I08a

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
					if iter_4_0 ~= "I08a" then
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

			local var_4_22 = manager.ui.mainCamera.transform
			local var_4_23 = 0

			if var_4_23 < arg_1_1.time_ and arg_1_1.time_ <= var_4_23 + arg_4_0 then
				arg_1_1.var_.shakeOldPos = var_4_22.localPosition
			end

			local var_4_24 = 2

			if var_4_23 <= arg_1_1.time_ and arg_1_1.time_ < var_4_23 + var_4_24 then
				local var_4_25 = (arg_1_1.time_ - var_4_23) / 0.066
				local var_4_26, var_4_27 = math.modf(var_4_25)

				var_4_22.localPosition = Vector3.New(var_4_27 * 0.13, var_4_27 * 0.13, var_4_27 * 0.13) + arg_1_1.var_.shakeOldPos
			end

			if arg_1_1.time_ >= var_4_23 + var_4_24 and arg_1_1.time_ < var_4_23 + var_4_24 + arg_4_0 then
				var_4_22.localPosition = arg_1_1.var_.shakeOldPos
			end

			local var_4_28 = 0
			local var_4_29 = 0.466666666666667

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				local var_4_30 = "play"
				local var_4_31 = "music"

				arg_1_1:AudioAction(var_4_30, var_4_31, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_32 = 2
			local var_4_33 = 0.55

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				local var_4_34 = "play"
				local var_4_35 = "music"

				arg_1_1:AudioAction(var_4_34, var_4_35, "bgm_activity_1_7_story_firehouse", "bgm_activity_1_7_story_firehouse", "bgm_activity_1_7_story_firehouse.awb")
			end

			local var_4_36 = 2
			local var_4_37 = 0.55

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0
				arg_1_1.dialogCg_.alpha = 1

				arg_1_1.dialog_:SetActive(true)
				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_38 = arg_1_1:GetWordFromCfg(117122001)
				local var_4_39 = arg_1_1:FormatText(var_4_38.content)

				arg_1_1.text_.text = var_4_39

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_40 = 22
				local var_4_41 = utf8.len(var_4_39)
				local var_4_42 = var_4_40 <= 0 and var_4_37 or var_4_37 * (var_4_41 / var_4_40)

				if var_4_42 > 0 and var_4_37 < var_4_42 then
					arg_1_1.talkMaxDuration = var_4_42

					if var_4_42 + var_4_36 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_42 + var_4_36
					end
				end

				arg_1_1.text_.text = var_4_39
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_43 = math.max(var_4_37, arg_1_1.talkMaxDuration)

			if var_4_36 <= arg_1_1.time_ and arg_1_1.time_ < var_4_36 + var_4_43 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_36) / var_4_43

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_36 + var_4_43 and arg_1_1.time_ < var_4_36 + var_4_43 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play117122002 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 117122002
		arg_5_1.duration_ = 5

		SetActive(arg_5_1.tipsGo_, false)

		function arg_5_1.onSingleLineFinish_()
			arg_5_1.onSingleLineUpdate_ = nil
			arg_5_1.onSingleLineFinish_ = nil
			arg_5_1.state_ = "waiting"
		end

		function arg_5_1.playNext_(arg_7_0)
			if arg_7_0 == 1 then
				arg_5_0:Play117122003(arg_5_1)
			end
		end

		function arg_5_1.onSingleLineUpdate_(arg_8_0)
			local var_8_0 = 0
			local var_8_1 = 1

			if var_8_0 < arg_5_1.time_ and arg_5_1.time_ <= var_8_0 + arg_8_0 then
				local var_8_2 = "play"
				local var_8_3 = "effect"

				arg_5_1:AudioAction(var_8_2, var_8_3, "se_story_17", "se_story_17_boss_hawk1", "")
			end

			local var_8_4 = 0
			local var_8_5 = 1.575

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

				local var_8_6 = arg_5_1:GetWordFromCfg(117122002)
				local var_8_7 = arg_5_1:FormatText(var_8_6.content)

				arg_5_1.text_.text = var_8_7

				LuaForUtil.ClearLinePrefixSymbol(arg_5_1.text_)

				local var_8_8 = 63
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
	Play117122003 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 117122003
		arg_9_1.duration_ = 5

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play117122004(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = 0
			local var_12_1 = 1

			if var_12_0 < arg_9_1.time_ and arg_9_1.time_ <= var_12_0 + arg_12_0 then
				local var_12_2 = "play"
				local var_12_3 = "effect"

				arg_9_1:AudioAction(var_12_2, var_12_3, "se_story_16", "se_story_16_fall02", "")
			end

			local var_12_4 = 0
			local var_12_5 = 1.175

			if var_12_4 < arg_9_1.time_ and arg_9_1.time_ <= var_12_4 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0
				arg_9_1.dialogCg_.alpha = 1

				arg_9_1.dialog_:SetActive(true)
				SetActive(arg_9_1.leftNameGo_, false)

				arg_9_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_9_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_9_1:RecordName(arg_9_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_9_1.iconTrs_.gameObject, false)
				arg_9_1.callingController_:SetSelectedState("normal")

				local var_12_6 = arg_9_1:GetWordFromCfg(117122003)
				local var_12_7 = arg_9_1:FormatText(var_12_6.content)

				arg_9_1.text_.text = var_12_7

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_8 = 47
				local var_12_9 = utf8.len(var_12_7)
				local var_12_10 = var_12_8 <= 0 and var_12_5 or var_12_5 * (var_12_9 / var_12_8)

				if var_12_10 > 0 and var_12_5 < var_12_10 then
					arg_9_1.talkMaxDuration = var_12_10

					if var_12_10 + var_12_4 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_10 + var_12_4
					end
				end

				arg_9_1.text_.text = var_12_7
				arg_9_1.typewritter.percent = 0

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(false)
				arg_9_1:RecordContent(arg_9_1.text_.text)
			end

			local var_12_11 = math.max(var_12_5, arg_9_1.talkMaxDuration)

			if var_12_4 <= arg_9_1.time_ and arg_9_1.time_ < var_12_4 + var_12_11 then
				arg_9_1.typewritter.percent = (arg_9_1.time_ - var_12_4) / var_12_11

				arg_9_1.typewritter:SetDirty()
			end

			if arg_9_1.time_ >= var_12_4 + var_12_11 and arg_9_1.time_ < var_12_4 + var_12_11 + arg_12_0 then
				arg_9_1.typewritter.percent = 1

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(true)
			end
		end
	end,
	Play117122004 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 117122004
		arg_13_1.duration_ = 5.766

		local var_13_0 = {
			zh = 5.766,
			ja = 4.166
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
				arg_13_0:Play117122005(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = "1132"

			if arg_13_1.actors_[var_16_0] == nil then
				local var_16_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_16_0), arg_13_1.canvasGo_.transform)

				var_16_1.transform:SetSiblingIndex(1)

				var_16_1.name = var_16_0
				var_16_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_13_1.actors_[var_16_0] = var_16_1
			end

			local var_16_2 = arg_13_1.actors_["1132"].transform
			local var_16_3 = 0

			if var_16_3 < arg_13_1.time_ and arg_13_1.time_ <= var_16_3 + arg_16_0 then
				arg_13_1.var_.moveOldPos1132 = var_16_2.localPosition
				var_16_2.localScale = Vector3.New(1, 1, 1)

				arg_13_1:CheckSpriteTmpPos("1132", 3)

				local var_16_4 = var_16_2.childCount

				for iter_16_0 = 0, var_16_4 - 1 do
					local var_16_5 = var_16_2:GetChild(iter_16_0)

					if var_16_5.name == "split_6" or not string.find(var_16_5.name, "split") then
						var_16_5.gameObject:SetActive(true)
					else
						var_16_5.gameObject:SetActive(false)
					end
				end
			end

			local var_16_6 = 0.001

			if var_16_3 <= arg_13_1.time_ and arg_13_1.time_ < var_16_3 + var_16_6 then
				local var_16_7 = (arg_13_1.time_ - var_16_3) / var_16_6
				local var_16_8 = Vector3.New(0, -413, -185)

				var_16_2.localPosition = Vector3.Lerp(arg_13_1.var_.moveOldPos1132, var_16_8, var_16_7)
			end

			if arg_13_1.time_ >= var_16_3 + var_16_6 and arg_13_1.time_ < var_16_3 + var_16_6 + arg_16_0 then
				var_16_2.localPosition = Vector3.New(0, -413, -185)
			end

			local var_16_9 = arg_13_1.actors_["1132"]
			local var_16_10 = 0

			if var_16_10 < arg_13_1.time_ and arg_13_1.time_ <= var_16_10 + arg_16_0 and arg_13_1.var_.actorSpriteComps1132 == nil then
				arg_13_1.var_.actorSpriteComps1132 = var_16_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_16_11 = 0.2

			if var_16_10 <= arg_13_1.time_ and arg_13_1.time_ < var_16_10 + var_16_11 then
				local var_16_12 = (arg_13_1.time_ - var_16_10) / var_16_11

				if arg_13_1.var_.actorSpriteComps1132 then
					for iter_16_1, iter_16_2 in pairs(arg_13_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_16_2 then
							local var_16_13 = Mathf.Lerp(iter_16_2.color.r, 1, var_16_12)

							iter_16_2.color = Color.New(var_16_13, var_16_13, var_16_13)
						end
					end
				end
			end

			if arg_13_1.time_ >= var_16_10 + var_16_11 and arg_13_1.time_ < var_16_10 + var_16_11 + arg_16_0 and arg_13_1.var_.actorSpriteComps1132 then
				local var_16_14 = 1

				for iter_16_3, iter_16_4 in pairs(arg_13_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_16_4 then
						iter_16_4.color = Color.New(var_16_14, var_16_14, var_16_14)
					end
				end

				arg_13_1.var_.actorSpriteComps1132 = nil
			end

			local var_16_15 = arg_13_1.actors_["1132"]
			local var_16_16 = 0

			if var_16_16 < arg_13_1.time_ and arg_13_1.time_ <= var_16_16 + arg_16_0 then
				local var_16_17 = var_16_15:GetComponentInChildren(typeof(CanvasGroup))

				if var_16_17 then
					arg_13_1.var_.alphaOldValue1132 = var_16_17.alpha
					arg_13_1.var_.characterEffect1132 = var_16_17
				end

				arg_13_1.var_.alphaOldValue1132 = 0
			end

			local var_16_18 = 0.5

			if var_16_16 <= arg_13_1.time_ and arg_13_1.time_ < var_16_16 + var_16_18 then
				local var_16_19 = (arg_13_1.time_ - var_16_16) / var_16_18
				local var_16_20 = Mathf.Lerp(arg_13_1.var_.alphaOldValue1132, 1, var_16_19)

				if arg_13_1.var_.characterEffect1132 then
					arg_13_1.var_.characterEffect1132.alpha = var_16_20
				end
			end

			if arg_13_1.time_ >= var_16_16 + var_16_18 and arg_13_1.time_ < var_16_16 + var_16_18 + arg_16_0 and arg_13_1.var_.characterEffect1132 then
				arg_13_1.var_.characterEffect1132.alpha = 1
			end

			local var_16_21 = 0
			local var_16_22 = 0.275

			if var_16_21 < arg_13_1.time_ and arg_13_1.time_ <= var_16_21 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, true)

				local var_16_23 = arg_13_1:FormatText(StoryNameCfg[61].name)

				arg_13_1.leftNameTxt_.text = var_16_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_13_1.leftNameTxt_.transform)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1.leftNameTxt_.text)
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_24 = arg_13_1:GetWordFromCfg(117122004)
				local var_16_25 = arg_13_1:FormatText(var_16_24.content)

				arg_13_1.text_.text = var_16_25

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_26 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122004", "story_v_out_117122.awb") ~= 0 then
					local var_16_29 = manager.audio:GetVoiceLength("story_v_out_117122", "117122004", "story_v_out_117122.awb") / 1000

					if var_16_29 + var_16_21 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_29 + var_16_21
					end

					if var_16_24.prefab_name ~= "" and arg_13_1.actors_[var_16_24.prefab_name] ~= nil then
						local var_16_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_13_1.actors_[var_16_24.prefab_name].transform, "story_v_out_117122", "117122004", "story_v_out_117122.awb")

						arg_13_1:RecordAudio("117122004", var_16_30)
						arg_13_1:RecordAudio("117122004", var_16_30)
					else
						arg_13_1:AudioAction("play", "voice", "story_v_out_117122", "117122004", "story_v_out_117122.awb")
					end

					arg_13_1:RecordHistoryTalkVoice("story_v_out_117122", "117122004", "story_v_out_117122.awb")
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
	Play117122005 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 117122005
		arg_17_1.duration_ = 1.9

		local var_17_0 = {
			zh = 1.9,
			ja = 1.433
		}
		local var_17_1 = manager.audio:GetLocalizationFlag()

		if var_17_0[var_17_1] ~= nil then
			arg_17_1.duration_ = var_17_0[var_17_1]
		end

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play117122006(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = arg_17_1.actors_["1132"]
			local var_20_1 = 0

			if var_20_1 < arg_17_1.time_ and arg_17_1.time_ <= var_20_1 + arg_20_0 and arg_17_1.var_.actorSpriteComps1132 == nil then
				arg_17_1.var_.actorSpriteComps1132 = var_20_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_20_2 = 0.2

			if var_20_1 <= arg_17_1.time_ and arg_17_1.time_ < var_20_1 + var_20_2 then
				local var_20_3 = (arg_17_1.time_ - var_20_1) / var_20_2

				if arg_17_1.var_.actorSpriteComps1132 then
					for iter_20_0, iter_20_1 in pairs(arg_17_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_20_1 then
							local var_20_4 = Mathf.Lerp(iter_20_1.color.r, 0.5, var_20_3)

							iter_20_1.color = Color.New(var_20_4, var_20_4, var_20_4)
						end
					end
				end
			end

			if arg_17_1.time_ >= var_20_1 + var_20_2 and arg_17_1.time_ < var_20_1 + var_20_2 + arg_20_0 and arg_17_1.var_.actorSpriteComps1132 then
				local var_20_5 = 0.5

				for iter_20_2, iter_20_3 in pairs(arg_17_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_20_3 then
						iter_20_3.color = Color.New(var_20_5, var_20_5, var_20_5)
					end
				end

				arg_17_1.var_.actorSpriteComps1132 = nil
			end

			local var_20_6 = 0
			local var_20_7 = 0.075

			if var_20_6 < arg_17_1.time_ and arg_17_1.time_ <= var_20_6 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_8 = arg_17_1:FormatText(StoryNameCfg[369].name)

				arg_17_1.leftNameTxt_.text = var_20_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, true)
				arg_17_1.iconController_:SetSelectedState("hero")

				arg_17_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10035_split_5")

				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_9 = arg_17_1:GetWordFromCfg(117122005)
				local var_20_10 = arg_17_1:FormatText(var_20_9.content)

				arg_17_1.text_.text = var_20_10

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_11 = 3
				local var_20_12 = utf8.len(var_20_10)
				local var_20_13 = var_20_11 <= 0 and var_20_7 or var_20_7 * (var_20_12 / var_20_11)

				if var_20_13 > 0 and var_20_7 < var_20_13 then
					arg_17_1.talkMaxDuration = var_20_13

					if var_20_13 + var_20_6 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_13 + var_20_6
					end
				end

				arg_17_1.text_.text = var_20_10
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122005", "story_v_out_117122.awb") ~= 0 then
					local var_20_14 = manager.audio:GetVoiceLength("story_v_out_117122", "117122005", "story_v_out_117122.awb") / 1000

					if var_20_14 + var_20_6 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_14 + var_20_6
					end

					if var_20_9.prefab_name ~= "" and arg_17_1.actors_[var_20_9.prefab_name] ~= nil then
						local var_20_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_17_1.actors_[var_20_9.prefab_name].transform, "story_v_out_117122", "117122005", "story_v_out_117122.awb")

						arg_17_1:RecordAudio("117122005", var_20_15)
						arg_17_1:RecordAudio("117122005", var_20_15)
					else
						arg_17_1:AudioAction("play", "voice", "story_v_out_117122", "117122005", "story_v_out_117122.awb")
					end

					arg_17_1:RecordHistoryTalkVoice("story_v_out_117122", "117122005", "story_v_out_117122.awb")
				end

				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_16 = math.max(var_20_7, arg_17_1.talkMaxDuration)

			if var_20_6 <= arg_17_1.time_ and arg_17_1.time_ < var_20_6 + var_20_16 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_6) / var_20_16

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_6 + var_20_16 and arg_17_1.time_ < var_20_6 + var_20_16 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play117122006 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 117122006
		arg_21_1.duration_ = 5

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play117122007(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = arg_21_1.actors_["1132"].transform
			local var_24_1 = 0

			if var_24_1 < arg_21_1.time_ and arg_21_1.time_ <= var_24_1 + arg_24_0 then
				arg_21_1.var_.moveOldPos1132 = var_24_0.localPosition
				var_24_0.localScale = Vector3.New(1, 1, 1)

				arg_21_1:CheckSpriteTmpPos("1132", 7)

				local var_24_2 = var_24_0.childCount

				for iter_24_0 = 0, var_24_2 - 1 do
					local var_24_3 = var_24_0:GetChild(iter_24_0)

					if var_24_3.name == "split_5" or not string.find(var_24_3.name, "split") then
						var_24_3.gameObject:SetActive(true)
					else
						var_24_3.gameObject:SetActive(false)
					end
				end
			end

			local var_24_4 = 0.001

			if var_24_1 <= arg_21_1.time_ and arg_21_1.time_ < var_24_1 + var_24_4 then
				local var_24_5 = (arg_21_1.time_ - var_24_1) / var_24_4
				local var_24_6 = Vector3.New(0, -2000, -185)

				var_24_0.localPosition = Vector3.Lerp(arg_21_1.var_.moveOldPos1132, var_24_6, var_24_5)
			end

			if arg_21_1.time_ >= var_24_1 + var_24_4 and arg_21_1.time_ < var_24_1 + var_24_4 + arg_24_0 then
				var_24_0.localPosition = Vector3.New(0, -2000, -185)
			end

			local var_24_7 = 0
			local var_24_8 = 0.8

			if var_24_7 < arg_21_1.time_ and arg_21_1.time_ <= var_24_7 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, false)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_9 = arg_21_1:GetWordFromCfg(117122006)
				local var_24_10 = arg_21_1:FormatText(var_24_9.content)

				arg_21_1.text_.text = var_24_10

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_11 = 32
				local var_24_12 = utf8.len(var_24_10)
				local var_24_13 = var_24_11 <= 0 and var_24_8 or var_24_8 * (var_24_12 / var_24_11)

				if var_24_13 > 0 and var_24_8 < var_24_13 then
					arg_21_1.talkMaxDuration = var_24_13

					if var_24_13 + var_24_7 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_13 + var_24_7
					end
				end

				arg_21_1.text_.text = var_24_10
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)
				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_14 = math.max(var_24_8, arg_21_1.talkMaxDuration)

			if var_24_7 <= arg_21_1.time_ and arg_21_1.time_ < var_24_7 + var_24_14 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_7) / var_24_14

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_7 + var_24_14 and arg_21_1.time_ < var_24_7 + var_24_14 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play117122007 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 117122007
		arg_25_1.duration_ = 2.666

		local var_25_0 = {
			zh = 1.5,
			ja = 2.666
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
				arg_25_0:Play117122008(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = "10035"

			if arg_25_1.actors_[var_28_0] == nil then
				local var_28_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_28_0), arg_25_1.canvasGo_.transform)

				var_28_1.transform:SetSiblingIndex(1)

				var_28_1.name = var_28_0
				var_28_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_25_1.actors_[var_28_0] = var_28_1
			end

			local var_28_2 = arg_25_1.actors_["10035"].transform
			local var_28_3 = 0

			if var_28_3 < arg_25_1.time_ and arg_25_1.time_ <= var_28_3 + arg_28_0 then
				arg_25_1.var_.moveOldPos10035 = var_28_2.localPosition
				var_28_2.localScale = Vector3.New(1, 1, 1)

				arg_25_1:CheckSpriteTmpPos("10035", 4)

				local var_28_4 = var_28_2.childCount

				for iter_28_0 = 0, var_28_4 - 1 do
					local var_28_5 = var_28_2:GetChild(iter_28_0)

					if var_28_5.name == "split_4" or not string.find(var_28_5.name, "split") then
						var_28_5.gameObject:SetActive(true)
					else
						var_28_5.gameObject:SetActive(false)
					end
				end
			end

			local var_28_6 = 0.001

			if var_28_3 <= arg_25_1.time_ and arg_25_1.time_ < var_28_3 + var_28_6 then
				local var_28_7 = (arg_25_1.time_ - var_28_3) / var_28_6
				local var_28_8 = Vector3.New(390, -410, -235)

				var_28_2.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos10035, var_28_8, var_28_7)
			end

			if arg_25_1.time_ >= var_28_3 + var_28_6 and arg_25_1.time_ < var_28_3 + var_28_6 + arg_28_0 then
				var_28_2.localPosition = Vector3.New(390, -410, -235)
			end

			local var_28_9 = "1033"

			if arg_25_1.actors_[var_28_9] == nil then
				local var_28_10 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_28_9), arg_25_1.canvasGo_.transform)

				var_28_10.transform:SetSiblingIndex(1)

				var_28_10.name = var_28_9
				var_28_10.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_25_1.actors_[var_28_9] = var_28_10
			end

			local var_28_11 = arg_25_1.actors_["1033"].transform
			local var_28_12 = 0

			if var_28_12 < arg_25_1.time_ and arg_25_1.time_ <= var_28_12 + arg_28_0 then
				arg_25_1.var_.moveOldPos1033 = var_28_11.localPosition
				var_28_11.localScale = Vector3.New(1, 1, 1)

				arg_25_1:CheckSpriteTmpPos("1033", 2)

				local var_28_13 = var_28_11.childCount

				for iter_28_1 = 0, var_28_13 - 1 do
					local var_28_14 = var_28_11:GetChild(iter_28_1)

					if var_28_14.name == "split_6" or not string.find(var_28_14.name, "split") then
						var_28_14.gameObject:SetActive(true)
					else
						var_28_14.gameObject:SetActive(false)
					end
				end
			end

			local var_28_15 = 0.001

			if var_28_12 <= arg_25_1.time_ and arg_25_1.time_ < var_28_12 + var_28_15 then
				local var_28_16 = (arg_25_1.time_ - var_28_12) / var_28_15
				local var_28_17 = Vector3.New(-390, -420, 0)

				var_28_11.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos1033, var_28_17, var_28_16)
			end

			if arg_25_1.time_ >= var_28_12 + var_28_15 and arg_25_1.time_ < var_28_12 + var_28_15 + arg_28_0 then
				var_28_11.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_28_18 = arg_25_1.actors_["1033"]
			local var_28_19 = 0

			if var_28_19 < arg_25_1.time_ and arg_25_1.time_ <= var_28_19 + arg_28_0 and arg_25_1.var_.actorSpriteComps1033 == nil then
				arg_25_1.var_.actorSpriteComps1033 = var_28_18:GetComponentsInChildren(typeof(Image), true)
			end

			local var_28_20 = 0.2

			if var_28_19 <= arg_25_1.time_ and arg_25_1.time_ < var_28_19 + var_28_20 then
				local var_28_21 = (arg_25_1.time_ - var_28_19) / var_28_20

				if arg_25_1.var_.actorSpriteComps1033 then
					for iter_28_2, iter_28_3 in pairs(arg_25_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_28_3 then
							local var_28_22 = Mathf.Lerp(iter_28_3.color.r, 1, var_28_21)

							iter_28_3.color = Color.New(var_28_22, var_28_22, var_28_22)
						end
					end
				end
			end

			if arg_25_1.time_ >= var_28_19 + var_28_20 and arg_25_1.time_ < var_28_19 + var_28_20 + arg_28_0 and arg_25_1.var_.actorSpriteComps1033 then
				local var_28_23 = 1

				for iter_28_4, iter_28_5 in pairs(arg_25_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_28_5 then
						iter_28_5.color = Color.New(var_28_23, var_28_23, var_28_23)
					end
				end

				arg_25_1.var_.actorSpriteComps1033 = nil
			end

			local var_28_24 = arg_25_1.actors_["10035"]
			local var_28_25 = 0

			if var_28_25 < arg_25_1.time_ and arg_25_1.time_ <= var_28_25 + arg_28_0 and arg_25_1.var_.actorSpriteComps10035 == nil then
				arg_25_1.var_.actorSpriteComps10035 = var_28_24:GetComponentsInChildren(typeof(Image), true)
			end

			local var_28_26 = 0.2

			if var_28_25 <= arg_25_1.time_ and arg_25_1.time_ < var_28_25 + var_28_26 then
				local var_28_27 = (arg_25_1.time_ - var_28_25) / var_28_26

				if arg_25_1.var_.actorSpriteComps10035 then
					for iter_28_6, iter_28_7 in pairs(arg_25_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_28_7 then
							local var_28_28 = Mathf.Lerp(iter_28_7.color.r, 0.5, var_28_27)

							iter_28_7.color = Color.New(var_28_28, var_28_28, var_28_28)
						end
					end
				end
			end

			if arg_25_1.time_ >= var_28_25 + var_28_26 and arg_25_1.time_ < var_28_25 + var_28_26 + arg_28_0 and arg_25_1.var_.actorSpriteComps10035 then
				local var_28_29 = 0.5

				for iter_28_8, iter_28_9 in pairs(arg_25_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_28_9 then
						iter_28_9.color = Color.New(var_28_29, var_28_29, var_28_29)
					end
				end

				arg_25_1.var_.actorSpriteComps10035 = nil
			end

			local var_28_30 = arg_25_1.actors_["1132"]
			local var_28_31 = 0

			if var_28_31 < arg_25_1.time_ and arg_25_1.time_ <= var_28_31 + arg_28_0 then
				local var_28_32 = var_28_30:GetComponentInChildren(typeof(CanvasGroup))

				if var_28_32 then
					arg_25_1.var_.alphaOldValue1132 = var_28_32.alpha
					arg_25_1.var_.characterEffect1132 = var_28_32
				end

				arg_25_1.var_.alphaOldValue1132 = 1
			end

			local var_28_33 = 0.5

			if var_28_31 <= arg_25_1.time_ and arg_25_1.time_ < var_28_31 + var_28_33 then
				local var_28_34 = (arg_25_1.time_ - var_28_31) / var_28_33
				local var_28_35 = Mathf.Lerp(arg_25_1.var_.alphaOldValue1132, 0, var_28_34)

				if arg_25_1.var_.characterEffect1132 then
					arg_25_1.var_.characterEffect1132.alpha = var_28_35
				end
			end

			if arg_25_1.time_ >= var_28_31 + var_28_33 and arg_25_1.time_ < var_28_31 + var_28_33 + arg_28_0 and arg_25_1.var_.characterEffect1132 then
				arg_25_1.var_.characterEffect1132.alpha = 0
			end

			local var_28_36 = arg_25_1.actors_["1033"]
			local var_28_37 = 0

			if var_28_37 < arg_25_1.time_ and arg_25_1.time_ <= var_28_37 + arg_28_0 then
				local var_28_38 = var_28_36:GetComponentInChildren(typeof(CanvasGroup))

				if var_28_38 then
					arg_25_1.var_.alphaOldValue1033 = var_28_38.alpha
					arg_25_1.var_.characterEffect1033 = var_28_38
				end

				arg_25_1.var_.alphaOldValue1033 = 0
			end

			local var_28_39 = 0.5

			if var_28_37 <= arg_25_1.time_ and arg_25_1.time_ < var_28_37 + var_28_39 then
				local var_28_40 = (arg_25_1.time_ - var_28_37) / var_28_39
				local var_28_41 = Mathf.Lerp(arg_25_1.var_.alphaOldValue1033, 1, var_28_40)

				if arg_25_1.var_.characterEffect1033 then
					arg_25_1.var_.characterEffect1033.alpha = var_28_41
				end
			end

			if arg_25_1.time_ >= var_28_37 + var_28_39 and arg_25_1.time_ < var_28_37 + var_28_39 + arg_28_0 and arg_25_1.var_.characterEffect1033 then
				arg_25_1.var_.characterEffect1033.alpha = 1
			end

			local var_28_42 = arg_25_1.actors_["10035"]
			local var_28_43 = 0

			if var_28_43 < arg_25_1.time_ and arg_25_1.time_ <= var_28_43 + arg_28_0 then
				local var_28_44 = var_28_42:GetComponentInChildren(typeof(CanvasGroup))

				if var_28_44 then
					arg_25_1.var_.alphaOldValue10035 = var_28_44.alpha
					arg_25_1.var_.characterEffect10035 = var_28_44
				end

				arg_25_1.var_.alphaOldValue10035 = 0
			end

			local var_28_45 = 0.5

			if var_28_43 <= arg_25_1.time_ and arg_25_1.time_ < var_28_43 + var_28_45 then
				local var_28_46 = (arg_25_1.time_ - var_28_43) / var_28_45
				local var_28_47 = Mathf.Lerp(arg_25_1.var_.alphaOldValue10035, 1, var_28_46)

				if arg_25_1.var_.characterEffect10035 then
					arg_25_1.var_.characterEffect10035.alpha = var_28_47
				end
			end

			if arg_25_1.time_ >= var_28_43 + var_28_45 and arg_25_1.time_ < var_28_43 + var_28_45 + arg_28_0 and arg_25_1.var_.characterEffect10035 then
				arg_25_1.var_.characterEffect10035.alpha = 1
			end

			local var_28_48 = 0
			local var_28_49 = 0.075

			if var_28_48 < arg_25_1.time_ and arg_25_1.time_ <= var_28_48 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_50 = arg_25_1:FormatText(StoryNameCfg[236].name)

				arg_25_1.leftNameTxt_.text = var_28_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_51 = arg_25_1:GetWordFromCfg(117122007)
				local var_28_52 = arg_25_1:FormatText(var_28_51.content)

				arg_25_1.text_.text = var_28_52

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_53 = 3
				local var_28_54 = utf8.len(var_28_52)
				local var_28_55 = var_28_53 <= 0 and var_28_49 or var_28_49 * (var_28_54 / var_28_53)

				if var_28_55 > 0 and var_28_49 < var_28_55 then
					arg_25_1.talkMaxDuration = var_28_55

					if var_28_55 + var_28_48 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_55 + var_28_48
					end
				end

				arg_25_1.text_.text = var_28_52
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122007", "story_v_out_117122.awb") ~= 0 then
					local var_28_56 = manager.audio:GetVoiceLength("story_v_out_117122", "117122007", "story_v_out_117122.awb") / 1000

					if var_28_56 + var_28_48 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_56 + var_28_48
					end

					if var_28_51.prefab_name ~= "" and arg_25_1.actors_[var_28_51.prefab_name] ~= nil then
						local var_28_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_51.prefab_name].transform, "story_v_out_117122", "117122007", "story_v_out_117122.awb")

						arg_25_1:RecordAudio("117122007", var_28_57)
						arg_25_1:RecordAudio("117122007", var_28_57)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_117122", "117122007", "story_v_out_117122.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_117122", "117122007", "story_v_out_117122.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_58 = math.max(var_28_49, arg_25_1.talkMaxDuration)

			if var_28_48 <= arg_25_1.time_ and arg_25_1.time_ < var_28_48 + var_28_58 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_48) / var_28_58

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_48 + var_28_58 and arg_25_1.time_ < var_28_48 + var_28_58 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play117122008 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 117122008
		arg_29_1.duration_ = 5.166

		local var_29_0 = {
			zh = 5.166,
			ja = 4.2
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
				arg_29_0:Play117122009(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["10035"].transform
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 then
				arg_29_1.var_.moveOldPos10035 = var_32_0.localPosition
				var_32_0.localScale = Vector3.New(1, 1, 1)

				arg_29_1:CheckSpriteTmpPos("10035", 4)

				local var_32_2 = var_32_0.childCount

				for iter_32_0 = 0, var_32_2 - 1 do
					local var_32_3 = var_32_0:GetChild(iter_32_0)

					if var_32_3.name == "split_5" or not string.find(var_32_3.name, "split") then
						var_32_3.gameObject:SetActive(true)
					else
						var_32_3.gameObject:SetActive(false)
					end
				end
			end

			local var_32_4 = 0.001

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_4 then
				local var_32_5 = (arg_29_1.time_ - var_32_1) / var_32_4
				local var_32_6 = Vector3.New(390, -410, -235)

				var_32_0.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos10035, var_32_6, var_32_5)
			end

			if arg_29_1.time_ >= var_32_1 + var_32_4 and arg_29_1.time_ < var_32_1 + var_32_4 + arg_32_0 then
				var_32_0.localPosition = Vector3.New(390, -410, -235)
			end

			local var_32_7 = arg_29_1.actors_["1033"].transform
			local var_32_8 = 0

			if var_32_8 < arg_29_1.time_ and arg_29_1.time_ <= var_32_8 + arg_32_0 then
				arg_29_1.var_.moveOldPos1033 = var_32_7.localPosition
				var_32_7.localScale = Vector3.New(1, 1, 1)

				arg_29_1:CheckSpriteTmpPos("1033", 2)

				local var_32_9 = var_32_7.childCount

				for iter_32_1 = 0, var_32_9 - 1 do
					local var_32_10 = var_32_7:GetChild(iter_32_1)

					if var_32_10.name == "split_6" or not string.find(var_32_10.name, "split") then
						var_32_10.gameObject:SetActive(true)
					else
						var_32_10.gameObject:SetActive(false)
					end
				end
			end

			local var_32_11 = 0.001

			if var_32_8 <= arg_29_1.time_ and arg_29_1.time_ < var_32_8 + var_32_11 then
				local var_32_12 = (arg_29_1.time_ - var_32_8) / var_32_11
				local var_32_13 = Vector3.New(-390, -420, 0)

				var_32_7.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos1033, var_32_13, var_32_12)
			end

			if arg_29_1.time_ >= var_32_8 + var_32_11 and arg_29_1.time_ < var_32_8 + var_32_11 + arg_32_0 then
				var_32_7.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_32_14 = arg_29_1.actors_["1033"]
			local var_32_15 = 0

			if var_32_15 < arg_29_1.time_ and arg_29_1.time_ <= var_32_15 + arg_32_0 and arg_29_1.var_.actorSpriteComps1033 == nil then
				arg_29_1.var_.actorSpriteComps1033 = var_32_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_32_16 = 0.2

			if var_32_15 <= arg_29_1.time_ and arg_29_1.time_ < var_32_15 + var_32_16 then
				local var_32_17 = (arg_29_1.time_ - var_32_15) / var_32_16

				if arg_29_1.var_.actorSpriteComps1033 then
					for iter_32_2, iter_32_3 in pairs(arg_29_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_32_3 then
							local var_32_18 = Mathf.Lerp(iter_32_3.color.r, 0.5, var_32_17)

							iter_32_3.color = Color.New(var_32_18, var_32_18, var_32_18)
						end
					end
				end
			end

			if arg_29_1.time_ >= var_32_15 + var_32_16 and arg_29_1.time_ < var_32_15 + var_32_16 + arg_32_0 and arg_29_1.var_.actorSpriteComps1033 then
				local var_32_19 = 0.5

				for iter_32_4, iter_32_5 in pairs(arg_29_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_32_5 then
						iter_32_5.color = Color.New(var_32_19, var_32_19, var_32_19)
					end
				end

				arg_29_1.var_.actorSpriteComps1033 = nil
			end

			local var_32_20 = arg_29_1.actors_["10035"]
			local var_32_21 = 0

			if var_32_21 < arg_29_1.time_ and arg_29_1.time_ <= var_32_21 + arg_32_0 and arg_29_1.var_.actorSpriteComps10035 == nil then
				arg_29_1.var_.actorSpriteComps10035 = var_32_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_32_22 = 0.2

			if var_32_21 <= arg_29_1.time_ and arg_29_1.time_ < var_32_21 + var_32_22 then
				local var_32_23 = (arg_29_1.time_ - var_32_21) / var_32_22

				if arg_29_1.var_.actorSpriteComps10035 then
					for iter_32_6, iter_32_7 in pairs(arg_29_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_32_7 then
							local var_32_24 = Mathf.Lerp(iter_32_7.color.r, 1, var_32_23)

							iter_32_7.color = Color.New(var_32_24, var_32_24, var_32_24)
						end
					end
				end
			end

			if arg_29_1.time_ >= var_32_21 + var_32_22 and arg_29_1.time_ < var_32_21 + var_32_22 + arg_32_0 and arg_29_1.var_.actorSpriteComps10035 then
				local var_32_25 = 1

				for iter_32_8, iter_32_9 in pairs(arg_29_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_32_9 then
						iter_32_9.color = Color.New(var_32_25, var_32_25, var_32_25)
					end
				end

				arg_29_1.var_.actorSpriteComps10035 = nil
			end

			local var_32_26 = 0
			local var_32_27 = 0.675

			if var_32_26 < arg_29_1.time_ and arg_29_1.time_ <= var_32_26 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_28 = arg_29_1:FormatText(StoryNameCfg[369].name)

				arg_29_1.leftNameTxt_.text = var_32_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_29 = arg_29_1:GetWordFromCfg(117122008)
				local var_32_30 = arg_29_1:FormatText(var_32_29.content)

				arg_29_1.text_.text = var_32_30

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_31 = 27
				local var_32_32 = utf8.len(var_32_30)
				local var_32_33 = var_32_31 <= 0 and var_32_27 or var_32_27 * (var_32_32 / var_32_31)

				if var_32_33 > 0 and var_32_27 < var_32_33 then
					arg_29_1.talkMaxDuration = var_32_33

					if var_32_33 + var_32_26 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_33 + var_32_26
					end
				end

				arg_29_1.text_.text = var_32_30
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122008", "story_v_out_117122.awb") ~= 0 then
					local var_32_34 = manager.audio:GetVoiceLength("story_v_out_117122", "117122008", "story_v_out_117122.awb") / 1000

					if var_32_34 + var_32_26 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_34 + var_32_26
					end

					if var_32_29.prefab_name ~= "" and arg_29_1.actors_[var_32_29.prefab_name] ~= nil then
						local var_32_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_29.prefab_name].transform, "story_v_out_117122", "117122008", "story_v_out_117122.awb")

						arg_29_1:RecordAudio("117122008", var_32_35)
						arg_29_1:RecordAudio("117122008", var_32_35)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_117122", "117122008", "story_v_out_117122.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_117122", "117122008", "story_v_out_117122.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_36 = math.max(var_32_27, arg_29_1.talkMaxDuration)

			if var_32_26 <= arg_29_1.time_ and arg_29_1.time_ < var_32_26 + var_32_36 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_26) / var_32_36

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_26 + var_32_36 and arg_29_1.time_ < var_32_26 + var_32_36 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play117122009 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 117122009
		arg_33_1.duration_ = 3.233

		local var_33_0 = {
			zh = 3.233,
			ja = 2.366
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
				arg_33_0:Play117122010(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["10035"].transform
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 then
				arg_33_1.var_.moveOldPos10035 = var_36_0.localPosition
				var_36_0.localScale = Vector3.New(1, 1, 1)

				arg_33_1:CheckSpriteTmpPos("10035", 4)

				local var_36_2 = var_36_0.childCount

				for iter_36_0 = 0, var_36_2 - 1 do
					local var_36_3 = var_36_0:GetChild(iter_36_0)

					if var_36_3.name == "split_5" or not string.find(var_36_3.name, "split") then
						var_36_3.gameObject:SetActive(true)
					else
						var_36_3.gameObject:SetActive(false)
					end
				end
			end

			local var_36_4 = 0.001

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_4 then
				local var_36_5 = (arg_33_1.time_ - var_36_1) / var_36_4
				local var_36_6 = Vector3.New(390, -410, -235)

				var_36_0.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos10035, var_36_6, var_36_5)
			end

			if arg_33_1.time_ >= var_36_1 + var_36_4 and arg_33_1.time_ < var_36_1 + var_36_4 + arg_36_0 then
				var_36_0.localPosition = Vector3.New(390, -410, -235)
			end

			local var_36_7 = arg_33_1.actors_["10035"]
			local var_36_8 = 0

			if var_36_8 < arg_33_1.time_ and arg_33_1.time_ <= var_36_8 + arg_36_0 and arg_33_1.var_.actorSpriteComps10035 == nil then
				arg_33_1.var_.actorSpriteComps10035 = var_36_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_36_9 = 0.2

			if var_36_8 <= arg_33_1.time_ and arg_33_1.time_ < var_36_8 + var_36_9 then
				local var_36_10 = (arg_33_1.time_ - var_36_8) / var_36_9

				if arg_33_1.var_.actorSpriteComps10035 then
					for iter_36_1, iter_36_2 in pairs(arg_33_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_36_2 then
							local var_36_11 = Mathf.Lerp(iter_36_2.color.r, 0.5, var_36_10)

							iter_36_2.color = Color.New(var_36_11, var_36_11, var_36_11)
						end
					end
				end
			end

			if arg_33_1.time_ >= var_36_8 + var_36_9 and arg_33_1.time_ < var_36_8 + var_36_9 + arg_36_0 and arg_33_1.var_.actorSpriteComps10035 then
				local var_36_12 = 0.5

				for iter_36_3, iter_36_4 in pairs(arg_33_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_36_4 then
						iter_36_4.color = Color.New(var_36_12, var_36_12, var_36_12)
					end
				end

				arg_33_1.var_.actorSpriteComps10035 = nil
			end

			local var_36_13 = arg_33_1.actors_["1033"]
			local var_36_14 = 0

			if var_36_14 < arg_33_1.time_ and arg_33_1.time_ <= var_36_14 + arg_36_0 and arg_33_1.var_.actorSpriteComps1033 == nil then
				arg_33_1.var_.actorSpriteComps1033 = var_36_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_36_15 = 0.2

			if var_36_14 <= arg_33_1.time_ and arg_33_1.time_ < var_36_14 + var_36_15 then
				local var_36_16 = (arg_33_1.time_ - var_36_14) / var_36_15

				if arg_33_1.var_.actorSpriteComps1033 then
					for iter_36_5, iter_36_6 in pairs(arg_33_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_36_6 then
							local var_36_17 = Mathf.Lerp(iter_36_6.color.r, 1, var_36_16)

							iter_36_6.color = Color.New(var_36_17, var_36_17, var_36_17)
						end
					end
				end
			end

			if arg_33_1.time_ >= var_36_14 + var_36_15 and arg_33_1.time_ < var_36_14 + var_36_15 + arg_36_0 and arg_33_1.var_.actorSpriteComps1033 then
				local var_36_18 = 1

				for iter_36_7, iter_36_8 in pairs(arg_33_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_36_8 then
						iter_36_8.color = Color.New(var_36_18, var_36_18, var_36_18)
					end
				end

				arg_33_1.var_.actorSpriteComps1033 = nil
			end

			local var_36_19 = 0
			local var_36_20 = 0.275

			if var_36_19 < arg_33_1.time_ and arg_33_1.time_ <= var_36_19 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_21 = arg_33_1:FormatText(StoryNameCfg[236].name)

				arg_33_1.leftNameTxt_.text = var_36_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_22 = arg_33_1:GetWordFromCfg(117122009)
				local var_36_23 = arg_33_1:FormatText(var_36_22.content)

				arg_33_1.text_.text = var_36_23

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_24 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122009", "story_v_out_117122.awb") ~= 0 then
					local var_36_27 = manager.audio:GetVoiceLength("story_v_out_117122", "117122009", "story_v_out_117122.awb") / 1000

					if var_36_27 + var_36_19 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_27 + var_36_19
					end

					if var_36_22.prefab_name ~= "" and arg_33_1.actors_[var_36_22.prefab_name] ~= nil then
						local var_36_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_22.prefab_name].transform, "story_v_out_117122", "117122009", "story_v_out_117122.awb")

						arg_33_1:RecordAudio("117122009", var_36_28)
						arg_33_1:RecordAudio("117122009", var_36_28)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_117122", "117122009", "story_v_out_117122.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_117122", "117122009", "story_v_out_117122.awb")
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
	Play117122010 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 117122010
		arg_37_1.duration_ = 5

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play117122011(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1033"]
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 then
				local var_40_2 = var_40_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_40_2 then
					arg_37_1.var_.alphaOldValue1033 = var_40_2.alpha
					arg_37_1.var_.characterEffect1033 = var_40_2
				end

				arg_37_1.var_.alphaOldValue1033 = 1
			end

			local var_40_3 = 0.3

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_3 then
				local var_40_4 = (arg_37_1.time_ - var_40_1) / var_40_3
				local var_40_5 = Mathf.Lerp(arg_37_1.var_.alphaOldValue1033, 0, var_40_4)

				if arg_37_1.var_.characterEffect1033 then
					arg_37_1.var_.characterEffect1033.alpha = var_40_5
				end
			end

			if arg_37_1.time_ >= var_40_1 + var_40_3 and arg_37_1.time_ < var_40_1 + var_40_3 + arg_40_0 and arg_37_1.var_.characterEffect1033 then
				arg_37_1.var_.characterEffect1033.alpha = 0
			end

			local var_40_6 = arg_37_1.actors_["10035"]
			local var_40_7 = 0

			if var_40_7 < arg_37_1.time_ and arg_37_1.time_ <= var_40_7 + arg_40_0 then
				local var_40_8 = var_40_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_40_8 then
					arg_37_1.var_.alphaOldValue10035 = var_40_8.alpha
					arg_37_1.var_.characterEffect10035 = var_40_8
				end

				arg_37_1.var_.alphaOldValue10035 = 1
			end

			local var_40_9 = 0.3

			if var_40_7 <= arg_37_1.time_ and arg_37_1.time_ < var_40_7 + var_40_9 then
				local var_40_10 = (arg_37_1.time_ - var_40_7) / var_40_9
				local var_40_11 = Mathf.Lerp(arg_37_1.var_.alphaOldValue10035, 0, var_40_10)

				if arg_37_1.var_.characterEffect10035 then
					arg_37_1.var_.characterEffect10035.alpha = var_40_11
				end
			end

			if arg_37_1.time_ >= var_40_7 + var_40_9 and arg_37_1.time_ < var_40_7 + var_40_9 + arg_40_0 and arg_37_1.var_.characterEffect10035 then
				arg_37_1.var_.characterEffect10035.alpha = 0
			end

			local var_40_12 = 0
			local var_40_13 = 0.5

			if var_40_12 < arg_37_1.time_ and arg_37_1.time_ <= var_40_12 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, false)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_14 = arg_37_1:GetWordFromCfg(117122010)
				local var_40_15 = arg_37_1:FormatText(var_40_14.content)

				arg_37_1.text_.text = var_40_15

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_16 = 20
				local var_40_17 = utf8.len(var_40_15)
				local var_40_18 = var_40_16 <= 0 and var_40_13 or var_40_13 * (var_40_17 / var_40_16)

				if var_40_18 > 0 and var_40_13 < var_40_18 then
					arg_37_1.talkMaxDuration = var_40_18

					if var_40_18 + var_40_12 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_18 + var_40_12
					end
				end

				arg_37_1.text_.text = var_40_15
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)
				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_19 = math.max(var_40_13, arg_37_1.talkMaxDuration)

			if var_40_12 <= arg_37_1.time_ and arg_37_1.time_ < var_40_12 + var_40_19 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_12) / var_40_19

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_12 + var_40_19 and arg_37_1.time_ < var_40_12 + var_40_19 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play117122011 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 117122011
		arg_41_1.duration_ = 5

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play117122012(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 0
			local var_44_1 = 0.775

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, false)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_2 = arg_41_1:GetWordFromCfg(117122011)
				local var_44_3 = arg_41_1:FormatText(var_44_2.content)

				arg_41_1.text_.text = var_44_3

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_4 = 31
				local var_44_5 = utf8.len(var_44_3)
				local var_44_6 = var_44_4 <= 0 and var_44_1 or var_44_1 * (var_44_5 / var_44_4)

				if var_44_6 > 0 and var_44_1 < var_44_6 then
					arg_41_1.talkMaxDuration = var_44_6

					if var_44_6 + var_44_0 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_6 + var_44_0
					end
				end

				arg_41_1.text_.text = var_44_3
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)
				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_7 = math.max(var_44_1, arg_41_1.talkMaxDuration)

			if var_44_0 <= arg_41_1.time_ and arg_41_1.time_ < var_44_0 + var_44_7 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_0) / var_44_7

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_0 + var_44_7 and arg_41_1.time_ < var_44_0 + var_44_7 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play117122012 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 117122012
		arg_45_1.duration_ = 5.766

		local var_45_0 = {
			zh = 5.766,
			ja = 3.366
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
				arg_45_0:Play117122013(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["1033"].transform
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 then
				arg_45_1.var_.moveOldPos1033 = var_48_0.localPosition
				var_48_0.localScale = Vector3.New(1, 1, 1)

				arg_45_1:CheckSpriteTmpPos("1033", 3)

				local var_48_2 = var_48_0.childCount

				for iter_48_0 = 0, var_48_2 - 1 do
					local var_48_3 = var_48_0:GetChild(iter_48_0)

					if var_48_3.name == "split_6" or not string.find(var_48_3.name, "split") then
						var_48_3.gameObject:SetActive(true)
					else
						var_48_3.gameObject:SetActive(false)
					end
				end
			end

			local var_48_4 = 0.001

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_4 then
				local var_48_5 = (arg_45_1.time_ - var_48_1) / var_48_4
				local var_48_6 = Vector3.New(0, -420, 0)

				var_48_0.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1033, var_48_6, var_48_5)
			end

			if arg_45_1.time_ >= var_48_1 + var_48_4 and arg_45_1.time_ < var_48_1 + var_48_4 + arg_48_0 then
				var_48_0.localPosition = Vector3.New(0, -420, 0)
			end

			local var_48_7 = arg_45_1.actors_["1033"]
			local var_48_8 = 0

			if var_48_8 < arg_45_1.time_ and arg_45_1.time_ <= var_48_8 + arg_48_0 and arg_45_1.var_.actorSpriteComps1033 == nil then
				arg_45_1.var_.actorSpriteComps1033 = var_48_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_48_9 = 0.2

			if var_48_8 <= arg_45_1.time_ and arg_45_1.time_ < var_48_8 + var_48_9 then
				local var_48_10 = (arg_45_1.time_ - var_48_8) / var_48_9

				if arg_45_1.var_.actorSpriteComps1033 then
					for iter_48_1, iter_48_2 in pairs(arg_45_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_48_2 then
							local var_48_11 = Mathf.Lerp(iter_48_2.color.r, 1, var_48_10)

							iter_48_2.color = Color.New(var_48_11, var_48_11, var_48_11)
						end
					end
				end
			end

			if arg_45_1.time_ >= var_48_8 + var_48_9 and arg_45_1.time_ < var_48_8 + var_48_9 + arg_48_0 and arg_45_1.var_.actorSpriteComps1033 then
				local var_48_12 = 1

				for iter_48_3, iter_48_4 in pairs(arg_45_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_48_4 then
						iter_48_4.color = Color.New(var_48_12, var_48_12, var_48_12)
					end
				end

				arg_45_1.var_.actorSpriteComps1033 = nil
			end

			local var_48_13 = arg_45_1.actors_["1033"]
			local var_48_14 = 0

			if var_48_14 < arg_45_1.time_ and arg_45_1.time_ <= var_48_14 + arg_48_0 then
				local var_48_15 = var_48_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_48_15 then
					arg_45_1.var_.alphaOldValue1033 = var_48_15.alpha
					arg_45_1.var_.characterEffect1033 = var_48_15
				end

				arg_45_1.var_.alphaOldValue1033 = 0
			end

			local var_48_16 = 0.5

			if var_48_14 <= arg_45_1.time_ and arg_45_1.time_ < var_48_14 + var_48_16 then
				local var_48_17 = (arg_45_1.time_ - var_48_14) / var_48_16
				local var_48_18 = Mathf.Lerp(arg_45_1.var_.alphaOldValue1033, 1, var_48_17)

				if arg_45_1.var_.characterEffect1033 then
					arg_45_1.var_.characterEffect1033.alpha = var_48_18
				end
			end

			if arg_45_1.time_ >= var_48_14 + var_48_16 and arg_45_1.time_ < var_48_14 + var_48_16 + arg_48_0 and arg_45_1.var_.characterEffect1033 then
				arg_45_1.var_.characterEffect1033.alpha = 1
			end

			local var_48_19 = 0
			local var_48_20 = 0.75

			if var_48_19 < arg_45_1.time_ and arg_45_1.time_ <= var_48_19 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_21 = arg_45_1:FormatText(StoryNameCfg[236].name)

				arg_45_1.leftNameTxt_.text = var_48_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_22 = arg_45_1:GetWordFromCfg(117122012)
				local var_48_23 = arg_45_1:FormatText(var_48_22.content)

				arg_45_1.text_.text = var_48_23

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_24 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122012", "story_v_out_117122.awb") ~= 0 then
					local var_48_27 = manager.audio:GetVoiceLength("story_v_out_117122", "117122012", "story_v_out_117122.awb") / 1000

					if var_48_27 + var_48_19 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_27 + var_48_19
					end

					if var_48_22.prefab_name ~= "" and arg_45_1.actors_[var_48_22.prefab_name] ~= nil then
						local var_48_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_22.prefab_name].transform, "story_v_out_117122", "117122012", "story_v_out_117122.awb")

						arg_45_1:RecordAudio("117122012", var_48_28)
						arg_45_1:RecordAudio("117122012", var_48_28)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_117122", "117122012", "story_v_out_117122.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_117122", "117122012", "story_v_out_117122.awb")
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
	Play117122013 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 117122013
		arg_49_1.duration_ = 14.666

		local var_49_0 = {
			zh = 10.7,
			ja = 14.666
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
				arg_49_0:Play117122014(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = 0
			local var_52_1 = 1.25

			if var_52_0 < arg_49_1.time_ and arg_49_1.time_ <= var_52_0 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_2 = arg_49_1:FormatText(StoryNameCfg[236].name)

				arg_49_1.leftNameTxt_.text = var_52_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_3 = arg_49_1:GetWordFromCfg(117122013)
				local var_52_4 = arg_49_1:FormatText(var_52_3.content)

				arg_49_1.text_.text = var_52_4

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_5 = 50
				local var_52_6 = utf8.len(var_52_4)
				local var_52_7 = var_52_5 <= 0 and var_52_1 or var_52_1 * (var_52_6 / var_52_5)

				if var_52_7 > 0 and var_52_1 < var_52_7 then
					arg_49_1.talkMaxDuration = var_52_7

					if var_52_7 + var_52_0 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_7 + var_52_0
					end
				end

				arg_49_1.text_.text = var_52_4
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122013", "story_v_out_117122.awb") ~= 0 then
					local var_52_8 = manager.audio:GetVoiceLength("story_v_out_117122", "117122013", "story_v_out_117122.awb") / 1000

					if var_52_8 + var_52_0 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_8 + var_52_0
					end

					if var_52_3.prefab_name ~= "" and arg_49_1.actors_[var_52_3.prefab_name] ~= nil then
						local var_52_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_3.prefab_name].transform, "story_v_out_117122", "117122013", "story_v_out_117122.awb")

						arg_49_1:RecordAudio("117122013", var_52_9)
						arg_49_1:RecordAudio("117122013", var_52_9)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_117122", "117122013", "story_v_out_117122.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_117122", "117122013", "story_v_out_117122.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_10 = math.max(var_52_1, arg_49_1.talkMaxDuration)

			if var_52_0 <= arg_49_1.time_ and arg_49_1.time_ < var_52_0 + var_52_10 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_0) / var_52_10

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_0 + var_52_10 and arg_49_1.time_ < var_52_0 + var_52_10 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play117122014 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 117122014
		arg_53_1.duration_ = 14.566

		local var_53_0 = {
			zh = 13.333,
			ja = 14.566
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
				arg_53_0:Play117122015(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0
			local var_56_1 = 1.675

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_2 = arg_53_1:FormatText(StoryNameCfg[236].name)

				arg_53_1.leftNameTxt_.text = var_56_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_3 = arg_53_1:GetWordFromCfg(117122014)
				local var_56_4 = arg_53_1:FormatText(var_56_3.content)

				arg_53_1.text_.text = var_56_4

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_5 = 67
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

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122014", "story_v_out_117122.awb") ~= 0 then
					local var_56_8 = manager.audio:GetVoiceLength("story_v_out_117122", "117122014", "story_v_out_117122.awb") / 1000

					if var_56_8 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_8 + var_56_0
					end

					if var_56_3.prefab_name ~= "" and arg_53_1.actors_[var_56_3.prefab_name] ~= nil then
						local var_56_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_3.prefab_name].transform, "story_v_out_117122", "117122014", "story_v_out_117122.awb")

						arg_53_1:RecordAudio("117122014", var_56_9)
						arg_53_1:RecordAudio("117122014", var_56_9)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_117122", "117122014", "story_v_out_117122.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_117122", "117122014", "story_v_out_117122.awb")
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
	Play117122015 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 117122015
		arg_57_1.duration_ = 11.666

		local var_57_0 = {
			zh = 9.766,
			ja = 11.666
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
				arg_57_0:Play117122016(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["1033"].transform
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 then
				arg_57_1.var_.moveOldPos1033 = var_60_0.localPosition
				var_60_0.localScale = Vector3.New(1, 1, 1)

				arg_57_1:CheckSpriteTmpPos("1033", 3)

				local var_60_2 = var_60_0.childCount

				for iter_60_0 = 0, var_60_2 - 1 do
					local var_60_3 = var_60_0:GetChild(iter_60_0)

					if var_60_3.name == "split_6" or not string.find(var_60_3.name, "split") then
						var_60_3.gameObject:SetActive(true)
					else
						var_60_3.gameObject:SetActive(false)
					end
				end
			end

			local var_60_4 = 0.001

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_4 then
				local var_60_5 = (arg_57_1.time_ - var_60_1) / var_60_4
				local var_60_6 = Vector3.New(0, -420, 0)

				var_60_0.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos1033, var_60_6, var_60_5)
			end

			if arg_57_1.time_ >= var_60_1 + var_60_4 and arg_57_1.time_ < var_60_1 + var_60_4 + arg_60_0 then
				var_60_0.localPosition = Vector3.New(0, -420, 0)
			end

			local var_60_7 = 0
			local var_60_8 = 1.275

			if var_60_7 < arg_57_1.time_ and arg_57_1.time_ <= var_60_7 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_9 = arg_57_1:FormatText(StoryNameCfg[236].name)

				arg_57_1.leftNameTxt_.text = var_60_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_10 = arg_57_1:GetWordFromCfg(117122015)
				local var_60_11 = arg_57_1:FormatText(var_60_10.content)

				arg_57_1.text_.text = var_60_11

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_12 = 51
				local var_60_13 = utf8.len(var_60_11)
				local var_60_14 = var_60_12 <= 0 and var_60_8 or var_60_8 * (var_60_13 / var_60_12)

				if var_60_14 > 0 and var_60_8 < var_60_14 then
					arg_57_1.talkMaxDuration = var_60_14

					if var_60_14 + var_60_7 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_14 + var_60_7
					end
				end

				arg_57_1.text_.text = var_60_11
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122015", "story_v_out_117122.awb") ~= 0 then
					local var_60_15 = manager.audio:GetVoiceLength("story_v_out_117122", "117122015", "story_v_out_117122.awb") / 1000

					if var_60_15 + var_60_7 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_15 + var_60_7
					end

					if var_60_10.prefab_name ~= "" and arg_57_1.actors_[var_60_10.prefab_name] ~= nil then
						local var_60_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_10.prefab_name].transform, "story_v_out_117122", "117122015", "story_v_out_117122.awb")

						arg_57_1:RecordAudio("117122015", var_60_16)
						arg_57_1:RecordAudio("117122015", var_60_16)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_117122", "117122015", "story_v_out_117122.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_117122", "117122015", "story_v_out_117122.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_17 = math.max(var_60_8, arg_57_1.talkMaxDuration)

			if var_60_7 <= arg_57_1.time_ and arg_57_1.time_ < var_60_7 + var_60_17 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_7) / var_60_17

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_7 + var_60_17 and arg_57_1.time_ < var_60_7 + var_60_17 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play117122016 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 117122016
		arg_61_1.duration_ = 6.7

		local var_61_0 = {
			zh = 6.066,
			ja = 6.7
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
				arg_61_0:Play117122017(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 0.75

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_2 = arg_61_1:FormatText(StoryNameCfg[236].name)

				arg_61_1.leftNameTxt_.text = var_64_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_3 = arg_61_1:GetWordFromCfg(117122016)
				local var_64_4 = arg_61_1:FormatText(var_64_3.content)

				arg_61_1.text_.text = var_64_4

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122016", "story_v_out_117122.awb") ~= 0 then
					local var_64_8 = manager.audio:GetVoiceLength("story_v_out_117122", "117122016", "story_v_out_117122.awb") / 1000

					if var_64_8 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_8 + var_64_0
					end

					if var_64_3.prefab_name ~= "" and arg_61_1.actors_[var_64_3.prefab_name] ~= nil then
						local var_64_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_3.prefab_name].transform, "story_v_out_117122", "117122016", "story_v_out_117122.awb")

						arg_61_1:RecordAudio("117122016", var_64_9)
						arg_61_1:RecordAudio("117122016", var_64_9)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_117122", "117122016", "story_v_out_117122.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_117122", "117122016", "story_v_out_117122.awb")
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
	Play117122017 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 117122017
		arg_65_1.duration_ = 3.133

		local var_65_0 = {
			zh = 2.933,
			ja = 3.133
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
				arg_65_0:Play117122018(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["1033"].transform
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 then
				arg_65_1.var_.moveOldPos1033 = var_68_0.localPosition
				var_68_0.localScale = Vector3.New(1, 1, 1)

				arg_65_1:CheckSpriteTmpPos("1033", 4)

				local var_68_2 = var_68_0.childCount

				for iter_68_0 = 0, var_68_2 - 1 do
					local var_68_3 = var_68_0:GetChild(iter_68_0)

					if var_68_3.name == "split_6" or not string.find(var_68_3.name, "split") then
						var_68_3.gameObject:SetActive(true)
					else
						var_68_3.gameObject:SetActive(false)
					end
				end
			end

			local var_68_4 = 0.001

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_4 then
				local var_68_5 = (arg_65_1.time_ - var_68_1) / var_68_4
				local var_68_6 = Vector3.New(390, -420, 0)

				var_68_0.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos1033, var_68_6, var_68_5)
			end

			if arg_65_1.time_ >= var_68_1 + var_68_4 and arg_65_1.time_ < var_68_1 + var_68_4 + arg_68_0 then
				var_68_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_68_7 = arg_65_1.actors_["1132"].transform
			local var_68_8 = 0

			if var_68_8 < arg_65_1.time_ and arg_65_1.time_ <= var_68_8 + arg_68_0 then
				arg_65_1.var_.moveOldPos1132 = var_68_7.localPosition
				var_68_7.localScale = Vector3.New(1, 1, 1)

				arg_65_1:CheckSpriteTmpPos("1132", 2)

				local var_68_9 = var_68_7.childCount

				for iter_68_1 = 0, var_68_9 - 1 do
					local var_68_10 = var_68_7:GetChild(iter_68_1)

					if var_68_10.name == "split_6" or not string.find(var_68_10.name, "split") then
						var_68_10.gameObject:SetActive(true)
					else
						var_68_10.gameObject:SetActive(false)
					end
				end
			end

			local var_68_11 = 0.001

			if var_68_8 <= arg_65_1.time_ and arg_65_1.time_ < var_68_8 + var_68_11 then
				local var_68_12 = (arg_65_1.time_ - var_68_8) / var_68_11
				local var_68_13 = Vector3.New(-390, -413, -185)

				var_68_7.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos1132, var_68_13, var_68_12)
			end

			if arg_65_1.time_ >= var_68_8 + var_68_11 and arg_65_1.time_ < var_68_8 + var_68_11 + arg_68_0 then
				var_68_7.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_68_14 = arg_65_1.actors_["1132"]
			local var_68_15 = 0

			if var_68_15 < arg_65_1.time_ and arg_65_1.time_ <= var_68_15 + arg_68_0 and arg_65_1.var_.actorSpriteComps1132 == nil then
				arg_65_1.var_.actorSpriteComps1132 = var_68_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_68_16 = 0.2

			if var_68_15 <= arg_65_1.time_ and arg_65_1.time_ < var_68_15 + var_68_16 then
				local var_68_17 = (arg_65_1.time_ - var_68_15) / var_68_16

				if arg_65_1.var_.actorSpriteComps1132 then
					for iter_68_2, iter_68_3 in pairs(arg_65_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_68_3 then
							local var_68_18 = Mathf.Lerp(iter_68_3.color.r, 1, var_68_17)

							iter_68_3.color = Color.New(var_68_18, var_68_18, var_68_18)
						end
					end
				end
			end

			if arg_65_1.time_ >= var_68_15 + var_68_16 and arg_65_1.time_ < var_68_15 + var_68_16 + arg_68_0 and arg_65_1.var_.actorSpriteComps1132 then
				local var_68_19 = 1

				for iter_68_4, iter_68_5 in pairs(arg_65_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_68_5 then
						iter_68_5.color = Color.New(var_68_19, var_68_19, var_68_19)
					end
				end

				arg_65_1.var_.actorSpriteComps1132 = nil
			end

			local var_68_20 = arg_65_1.actors_["1033"]
			local var_68_21 = 0

			if var_68_21 < arg_65_1.time_ and arg_65_1.time_ <= var_68_21 + arg_68_0 and arg_65_1.var_.actorSpriteComps1033 == nil then
				arg_65_1.var_.actorSpriteComps1033 = var_68_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_68_22 = 0.2

			if var_68_21 <= arg_65_1.time_ and arg_65_1.time_ < var_68_21 + var_68_22 then
				local var_68_23 = (arg_65_1.time_ - var_68_21) / var_68_22

				if arg_65_1.var_.actorSpriteComps1033 then
					for iter_68_6, iter_68_7 in pairs(arg_65_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_68_7 then
							local var_68_24 = Mathf.Lerp(iter_68_7.color.r, 0.5, var_68_23)

							iter_68_7.color = Color.New(var_68_24, var_68_24, var_68_24)
						end
					end
				end
			end

			if arg_65_1.time_ >= var_68_21 + var_68_22 and arg_65_1.time_ < var_68_21 + var_68_22 + arg_68_0 and arg_65_1.var_.actorSpriteComps1033 then
				local var_68_25 = 0.5

				for iter_68_8, iter_68_9 in pairs(arg_65_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_68_9 then
						iter_68_9.color = Color.New(var_68_25, var_68_25, var_68_25)
					end
				end

				arg_65_1.var_.actorSpriteComps1033 = nil
			end

			local var_68_26 = arg_65_1.actors_["1132"]
			local var_68_27 = 0

			if var_68_27 < arg_65_1.time_ and arg_65_1.time_ <= var_68_27 + arg_68_0 then
				local var_68_28 = var_68_26:GetComponentInChildren(typeof(CanvasGroup))

				if var_68_28 then
					arg_65_1.var_.alphaOldValue1132 = var_68_28.alpha
					arg_65_1.var_.characterEffect1132 = var_68_28
				end

				arg_65_1.var_.alphaOldValue1132 = 0
			end

			local var_68_29 = 0.5

			if var_68_27 <= arg_65_1.time_ and arg_65_1.time_ < var_68_27 + var_68_29 then
				local var_68_30 = (arg_65_1.time_ - var_68_27) / var_68_29
				local var_68_31 = Mathf.Lerp(arg_65_1.var_.alphaOldValue1132, 1, var_68_30)

				if arg_65_1.var_.characterEffect1132 then
					arg_65_1.var_.characterEffect1132.alpha = var_68_31
				end
			end

			if arg_65_1.time_ >= var_68_27 + var_68_29 and arg_65_1.time_ < var_68_27 + var_68_29 + arg_68_0 and arg_65_1.var_.characterEffect1132 then
				arg_65_1.var_.characterEffect1132.alpha = 1
			end

			local var_68_32 = arg_65_1.actors_["1033"]
			local var_68_33 = 0

			if var_68_33 < arg_65_1.time_ and arg_65_1.time_ <= var_68_33 + arg_68_0 then
				local var_68_34 = var_68_32:GetComponentInChildren(typeof(CanvasGroup))

				if var_68_34 then
					arg_65_1.var_.alphaOldValue1033 = var_68_34.alpha
					arg_65_1.var_.characterEffect1033 = var_68_34
				end

				arg_65_1.var_.alphaOldValue1033 = 0
			end

			local var_68_35 = 0.5

			if var_68_33 <= arg_65_1.time_ and arg_65_1.time_ < var_68_33 + var_68_35 then
				local var_68_36 = (arg_65_1.time_ - var_68_33) / var_68_35
				local var_68_37 = Mathf.Lerp(arg_65_1.var_.alphaOldValue1033, 1, var_68_36)

				if arg_65_1.var_.characterEffect1033 then
					arg_65_1.var_.characterEffect1033.alpha = var_68_37
				end
			end

			if arg_65_1.time_ >= var_68_33 + var_68_35 and arg_65_1.time_ < var_68_33 + var_68_35 + arg_68_0 and arg_65_1.var_.characterEffect1033 then
				arg_65_1.var_.characterEffect1033.alpha = 1
			end

			local var_68_38 = 0
			local var_68_39 = 0.2

			if var_68_38 < arg_65_1.time_ and arg_65_1.time_ <= var_68_38 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_40 = arg_65_1:FormatText(StoryNameCfg[61].name)

				arg_65_1.leftNameTxt_.text = var_68_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_41 = arg_65_1:GetWordFromCfg(117122017)
				local var_68_42 = arg_65_1:FormatText(var_68_41.content)

				arg_65_1.text_.text = var_68_42

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_43 = 8
				local var_68_44 = utf8.len(var_68_42)
				local var_68_45 = var_68_43 <= 0 and var_68_39 or var_68_39 * (var_68_44 / var_68_43)

				if var_68_45 > 0 and var_68_39 < var_68_45 then
					arg_65_1.talkMaxDuration = var_68_45

					if var_68_45 + var_68_38 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_45 + var_68_38
					end
				end

				arg_65_1.text_.text = var_68_42
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122017", "story_v_out_117122.awb") ~= 0 then
					local var_68_46 = manager.audio:GetVoiceLength("story_v_out_117122", "117122017", "story_v_out_117122.awb") / 1000

					if var_68_46 + var_68_38 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_46 + var_68_38
					end

					if var_68_41.prefab_name ~= "" and arg_65_1.actors_[var_68_41.prefab_name] ~= nil then
						local var_68_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_41.prefab_name].transform, "story_v_out_117122", "117122017", "story_v_out_117122.awb")

						arg_65_1:RecordAudio("117122017", var_68_47)
						arg_65_1:RecordAudio("117122017", var_68_47)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_117122", "117122017", "story_v_out_117122.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_117122", "117122017", "story_v_out_117122.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_48 = math.max(var_68_39, arg_65_1.talkMaxDuration)

			if var_68_38 <= arg_65_1.time_ and arg_65_1.time_ < var_68_38 + var_68_48 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_38) / var_68_48

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_38 + var_68_48 and arg_65_1.time_ < var_68_38 + var_68_48 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play117122018 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 117122018
		arg_69_1.duration_ = 10.2

		local var_69_0 = {
			zh = 5.633,
			ja = 10.2
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
				arg_69_0:Play117122019(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1033"].transform
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 then
				arg_69_1.var_.moveOldPos1033 = var_72_0.localPosition
				var_72_0.localScale = Vector3.New(1, 1, 1)

				arg_69_1:CheckSpriteTmpPos("1033", 4)

				local var_72_2 = var_72_0.childCount

				for iter_72_0 = 0, var_72_2 - 1 do
					local var_72_3 = var_72_0:GetChild(iter_72_0)

					if var_72_3.name == "split_6" or not string.find(var_72_3.name, "split") then
						var_72_3.gameObject:SetActive(true)
					else
						var_72_3.gameObject:SetActive(false)
					end
				end
			end

			local var_72_4 = 0.001

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_4 then
				local var_72_5 = (arg_69_1.time_ - var_72_1) / var_72_4
				local var_72_6 = Vector3.New(390, -420, 0)

				var_72_0.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1033, var_72_6, var_72_5)
			end

			if arg_69_1.time_ >= var_72_1 + var_72_4 and arg_69_1.time_ < var_72_1 + var_72_4 + arg_72_0 then
				var_72_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_72_7 = arg_69_1.actors_["1132"]
			local var_72_8 = 0

			if var_72_8 < arg_69_1.time_ and arg_69_1.time_ <= var_72_8 + arg_72_0 and arg_69_1.var_.actorSpriteComps1132 == nil then
				arg_69_1.var_.actorSpriteComps1132 = var_72_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_72_9 = 0.2

			if var_72_8 <= arg_69_1.time_ and arg_69_1.time_ < var_72_8 + var_72_9 then
				local var_72_10 = (arg_69_1.time_ - var_72_8) / var_72_9

				if arg_69_1.var_.actorSpriteComps1132 then
					for iter_72_1, iter_72_2 in pairs(arg_69_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_72_2 then
							local var_72_11 = Mathf.Lerp(iter_72_2.color.r, 0.5, var_72_10)

							iter_72_2.color = Color.New(var_72_11, var_72_11, var_72_11)
						end
					end
				end
			end

			if arg_69_1.time_ >= var_72_8 + var_72_9 and arg_69_1.time_ < var_72_8 + var_72_9 + arg_72_0 and arg_69_1.var_.actorSpriteComps1132 then
				local var_72_12 = 0.5

				for iter_72_3, iter_72_4 in pairs(arg_69_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_72_4 then
						iter_72_4.color = Color.New(var_72_12, var_72_12, var_72_12)
					end
				end

				arg_69_1.var_.actorSpriteComps1132 = nil
			end

			local var_72_13 = arg_69_1.actors_["1033"]
			local var_72_14 = 0

			if var_72_14 < arg_69_1.time_ and arg_69_1.time_ <= var_72_14 + arg_72_0 and arg_69_1.var_.actorSpriteComps1033 == nil then
				arg_69_1.var_.actorSpriteComps1033 = var_72_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_72_15 = 0.2

			if var_72_14 <= arg_69_1.time_ and arg_69_1.time_ < var_72_14 + var_72_15 then
				local var_72_16 = (arg_69_1.time_ - var_72_14) / var_72_15

				if arg_69_1.var_.actorSpriteComps1033 then
					for iter_72_5, iter_72_6 in pairs(arg_69_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_72_6 then
							local var_72_17 = Mathf.Lerp(iter_72_6.color.r, 1, var_72_16)

							iter_72_6.color = Color.New(var_72_17, var_72_17, var_72_17)
						end
					end
				end
			end

			if arg_69_1.time_ >= var_72_14 + var_72_15 and arg_69_1.time_ < var_72_14 + var_72_15 + arg_72_0 and arg_69_1.var_.actorSpriteComps1033 then
				local var_72_18 = 1

				for iter_72_7, iter_72_8 in pairs(arg_69_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_72_8 then
						iter_72_8.color = Color.New(var_72_18, var_72_18, var_72_18)
					end
				end

				arg_69_1.var_.actorSpriteComps1033 = nil
			end

			local var_72_19 = 0
			local var_72_20 = 0.75

			if var_72_19 < arg_69_1.time_ and arg_69_1.time_ <= var_72_19 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_21 = arg_69_1:FormatText(StoryNameCfg[236].name)

				arg_69_1.leftNameTxt_.text = var_72_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_22 = arg_69_1:GetWordFromCfg(117122018)
				local var_72_23 = arg_69_1:FormatText(var_72_22.content)

				arg_69_1.text_.text = var_72_23

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_24 = 30
				local var_72_25 = utf8.len(var_72_23)
				local var_72_26 = var_72_24 <= 0 and var_72_20 or var_72_20 * (var_72_25 / var_72_24)

				if var_72_26 > 0 and var_72_20 < var_72_26 then
					arg_69_1.talkMaxDuration = var_72_26

					if var_72_26 + var_72_19 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_26 + var_72_19
					end
				end

				arg_69_1.text_.text = var_72_23
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122018", "story_v_out_117122.awb") ~= 0 then
					local var_72_27 = manager.audio:GetVoiceLength("story_v_out_117122", "117122018", "story_v_out_117122.awb") / 1000

					if var_72_27 + var_72_19 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_27 + var_72_19
					end

					if var_72_22.prefab_name ~= "" and arg_69_1.actors_[var_72_22.prefab_name] ~= nil then
						local var_72_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_22.prefab_name].transform, "story_v_out_117122", "117122018", "story_v_out_117122.awb")

						arg_69_1:RecordAudio("117122018", var_72_28)
						arg_69_1:RecordAudio("117122018", var_72_28)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_117122", "117122018", "story_v_out_117122.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_117122", "117122018", "story_v_out_117122.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_29 = math.max(var_72_20, arg_69_1.talkMaxDuration)

			if var_72_19 <= arg_69_1.time_ and arg_69_1.time_ < var_72_19 + var_72_29 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_19) / var_72_29

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_19 + var_72_29 and arg_69_1.time_ < var_72_19 + var_72_29 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play117122019 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 117122019
		arg_73_1.duration_ = 2.833

		local var_73_0 = {
			zh = 2.233,
			ja = 2.833
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
				arg_73_0:Play117122020(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1132"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.actorSpriteComps1132 == nil then
				arg_73_1.var_.actorSpriteComps1132 = var_76_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_76_2 = 0.2

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.actorSpriteComps1132 then
					for iter_76_0, iter_76_1 in pairs(arg_73_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_76_1 then
							local var_76_4 = Mathf.Lerp(iter_76_1.color.r, 1, var_76_3)

							iter_76_1.color = Color.New(var_76_4, var_76_4, var_76_4)
						end
					end
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.actorSpriteComps1132 then
				local var_76_5 = 1

				for iter_76_2, iter_76_3 in pairs(arg_73_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_76_3 then
						iter_76_3.color = Color.New(var_76_5, var_76_5, var_76_5)
					end
				end

				arg_73_1.var_.actorSpriteComps1132 = nil
			end

			local var_76_6 = arg_73_1.actors_["1033"]
			local var_76_7 = 0

			if var_76_7 < arg_73_1.time_ and arg_73_1.time_ <= var_76_7 + arg_76_0 and arg_73_1.var_.actorSpriteComps1033 == nil then
				arg_73_1.var_.actorSpriteComps1033 = var_76_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_76_8 = 0.2

			if var_76_7 <= arg_73_1.time_ and arg_73_1.time_ < var_76_7 + var_76_8 then
				local var_76_9 = (arg_73_1.time_ - var_76_7) / var_76_8

				if arg_73_1.var_.actorSpriteComps1033 then
					for iter_76_4, iter_76_5 in pairs(arg_73_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_76_5 then
							local var_76_10 = Mathf.Lerp(iter_76_5.color.r, 0.5, var_76_9)

							iter_76_5.color = Color.New(var_76_10, var_76_10, var_76_10)
						end
					end
				end
			end

			if arg_73_1.time_ >= var_76_7 + var_76_8 and arg_73_1.time_ < var_76_7 + var_76_8 + arg_76_0 and arg_73_1.var_.actorSpriteComps1033 then
				local var_76_11 = 0.5

				for iter_76_6, iter_76_7 in pairs(arg_73_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_76_7 then
						iter_76_7.color = Color.New(var_76_11, var_76_11, var_76_11)
					end
				end

				arg_73_1.var_.actorSpriteComps1033 = nil
			end

			local var_76_12 = 0
			local var_76_13 = 0.175

			if var_76_12 < arg_73_1.time_ and arg_73_1.time_ <= var_76_12 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_14 = arg_73_1:FormatText(StoryNameCfg[61].name)

				arg_73_1.leftNameTxt_.text = var_76_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_15 = arg_73_1:GetWordFromCfg(117122019)
				local var_76_16 = arg_73_1:FormatText(var_76_15.content)

				arg_73_1.text_.text = var_76_16

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_17 = 7
				local var_76_18 = utf8.len(var_76_16)
				local var_76_19 = var_76_17 <= 0 and var_76_13 or var_76_13 * (var_76_18 / var_76_17)

				if var_76_19 > 0 and var_76_13 < var_76_19 then
					arg_73_1.talkMaxDuration = var_76_19

					if var_76_19 + var_76_12 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_19 + var_76_12
					end
				end

				arg_73_1.text_.text = var_76_16
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122019", "story_v_out_117122.awb") ~= 0 then
					local var_76_20 = manager.audio:GetVoiceLength("story_v_out_117122", "117122019", "story_v_out_117122.awb") / 1000

					if var_76_20 + var_76_12 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_20 + var_76_12
					end

					if var_76_15.prefab_name ~= "" and arg_73_1.actors_[var_76_15.prefab_name] ~= nil then
						local var_76_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_15.prefab_name].transform, "story_v_out_117122", "117122019", "story_v_out_117122.awb")

						arg_73_1:RecordAudio("117122019", var_76_21)
						arg_73_1:RecordAudio("117122019", var_76_21)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_117122", "117122019", "story_v_out_117122.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_117122", "117122019", "story_v_out_117122.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_22 = math.max(var_76_13, arg_73_1.talkMaxDuration)

			if var_76_12 <= arg_73_1.time_ and arg_73_1.time_ < var_76_12 + var_76_22 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_12) / var_76_22

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_12 + var_76_22 and arg_73_1.time_ < var_76_12 + var_76_22 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play117122020 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 117122020
		arg_77_1.duration_ = 5

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play117122021(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1132"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.actorSpriteComps1132 == nil then
				arg_77_1.var_.actorSpriteComps1132 = var_80_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_80_2 = 0.2

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.actorSpriteComps1132 then
					for iter_80_0, iter_80_1 in pairs(arg_77_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_80_1 then
							local var_80_4 = Mathf.Lerp(iter_80_1.color.r, 0.5, var_80_3)

							iter_80_1.color = Color.New(var_80_4, var_80_4, var_80_4)
						end
					end
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.actorSpriteComps1132 then
				local var_80_5 = 0.5

				for iter_80_2, iter_80_3 in pairs(arg_77_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_80_3 then
						iter_80_3.color = Color.New(var_80_5, var_80_5, var_80_5)
					end
				end

				arg_77_1.var_.actorSpriteComps1132 = nil
			end

			local var_80_6 = arg_77_1.actors_["1033"]
			local var_80_7 = 0

			if var_80_7 < arg_77_1.time_ and arg_77_1.time_ <= var_80_7 + arg_80_0 and arg_77_1.var_.actorSpriteComps1033 == nil then
				arg_77_1.var_.actorSpriteComps1033 = var_80_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_80_8 = 0.034

			if var_80_7 <= arg_77_1.time_ and arg_77_1.time_ < var_80_7 + var_80_8 then
				local var_80_9 = (arg_77_1.time_ - var_80_7) / var_80_8

				if arg_77_1.var_.actorSpriteComps1033 then
					for iter_80_4, iter_80_5 in pairs(arg_77_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_80_5 then
							local var_80_10 = Mathf.Lerp(iter_80_5.color.r, 0.5, var_80_9)

							iter_80_5.color = Color.New(var_80_10, var_80_10, var_80_10)
						end
					end
				end
			end

			if arg_77_1.time_ >= var_80_7 + var_80_8 and arg_77_1.time_ < var_80_7 + var_80_8 + arg_80_0 and arg_77_1.var_.actorSpriteComps1033 then
				local var_80_11 = 0.5

				for iter_80_6, iter_80_7 in pairs(arg_77_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_80_7 then
						iter_80_7.color = Color.New(var_80_11, var_80_11, var_80_11)
					end
				end

				arg_77_1.var_.actorSpriteComps1033 = nil
			end

			local var_80_12 = 0
			local var_80_13 = 0.2

			if var_80_12 < arg_77_1.time_ and arg_77_1.time_ <= var_80_12 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, false)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_14 = arg_77_1:GetWordFromCfg(117122020)
				local var_80_15 = arg_77_1:FormatText(var_80_14.content)

				arg_77_1.text_.text = var_80_15

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_16 = 8
				local var_80_17 = utf8.len(var_80_15)
				local var_80_18 = var_80_16 <= 0 and var_80_13 or var_80_13 * (var_80_17 / var_80_16)

				if var_80_18 > 0 and var_80_13 < var_80_18 then
					arg_77_1.talkMaxDuration = var_80_18

					if var_80_18 + var_80_12 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_18 + var_80_12
					end
				end

				arg_77_1.text_.text = var_80_15
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)
				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_19 = math.max(var_80_13, arg_77_1.talkMaxDuration)

			if var_80_12 <= arg_77_1.time_ and arg_77_1.time_ < var_80_12 + var_80_19 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_12) / var_80_19

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_12 + var_80_19 and arg_77_1.time_ < var_80_12 + var_80_19 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play117122021 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 117122021
		arg_81_1.duration_ = 11.233

		local var_81_0 = {
			zh = 11.233,
			ja = 6.266
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
				arg_81_0:Play117122022(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["1132"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.actorSpriteComps1132 == nil then
				arg_81_1.var_.actorSpriteComps1132 = var_84_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_84_2 = 0.2

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.actorSpriteComps1132 then
					for iter_84_0, iter_84_1 in pairs(arg_81_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_84_1 then
							local var_84_4 = Mathf.Lerp(iter_84_1.color.r, 1, var_84_3)

							iter_84_1.color = Color.New(var_84_4, var_84_4, var_84_4)
						end
					end
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.actorSpriteComps1132 then
				local var_84_5 = 1

				for iter_84_2, iter_84_3 in pairs(arg_81_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_84_3 then
						iter_84_3.color = Color.New(var_84_5, var_84_5, var_84_5)
					end
				end

				arg_81_1.var_.actorSpriteComps1132 = nil
			end

			local var_84_6 = 0
			local var_84_7 = 0.7

			if var_84_6 < arg_81_1.time_ and arg_81_1.time_ <= var_84_6 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_8 = arg_81_1:FormatText(StoryNameCfg[61].name)

				arg_81_1.leftNameTxt_.text = var_84_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_9 = arg_81_1:GetWordFromCfg(117122021)
				local var_84_10 = arg_81_1:FormatText(var_84_9.content)

				arg_81_1.text_.text = var_84_10

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_11 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122021", "story_v_out_117122.awb") ~= 0 then
					local var_84_14 = manager.audio:GetVoiceLength("story_v_out_117122", "117122021", "story_v_out_117122.awb") / 1000

					if var_84_14 + var_84_6 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_14 + var_84_6
					end

					if var_84_9.prefab_name ~= "" and arg_81_1.actors_[var_84_9.prefab_name] ~= nil then
						local var_84_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_9.prefab_name].transform, "story_v_out_117122", "117122021", "story_v_out_117122.awb")

						arg_81_1:RecordAudio("117122021", var_84_15)
						arg_81_1:RecordAudio("117122021", var_84_15)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_117122", "117122021", "story_v_out_117122.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_117122", "117122021", "story_v_out_117122.awb")
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
	Play117122022 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 117122022
		arg_85_1.duration_ = 10.833

		local var_85_0 = {
			zh = 10.833,
			ja = 7.5
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
				arg_85_0:Play117122023(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 0.925

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_2 = arg_85_1:FormatText(StoryNameCfg[61].name)

				arg_85_1.leftNameTxt_.text = var_88_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_3 = arg_85_1:GetWordFromCfg(117122022)
				local var_88_4 = arg_85_1:FormatText(var_88_3.content)

				arg_85_1.text_.text = var_88_4

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_5 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122022", "story_v_out_117122.awb") ~= 0 then
					local var_88_8 = manager.audio:GetVoiceLength("story_v_out_117122", "117122022", "story_v_out_117122.awb") / 1000

					if var_88_8 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_8 + var_88_0
					end

					if var_88_3.prefab_name ~= "" and arg_85_1.actors_[var_88_3.prefab_name] ~= nil then
						local var_88_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_3.prefab_name].transform, "story_v_out_117122", "117122022", "story_v_out_117122.awb")

						arg_85_1:RecordAudio("117122022", var_88_9)
						arg_85_1:RecordAudio("117122022", var_88_9)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_117122", "117122022", "story_v_out_117122.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_117122", "117122022", "story_v_out_117122.awb")
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
	Play117122023 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 117122023
		arg_89_1.duration_ = 11.166

		local var_89_0 = {
			zh = 11.166,
			ja = 6.2
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
				arg_89_0:Play117122024(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 1.175

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_2 = arg_89_1:FormatText(StoryNameCfg[61].name)

				arg_89_1.leftNameTxt_.text = var_92_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_3 = arg_89_1:GetWordFromCfg(117122023)
				local var_92_4 = arg_89_1:FormatText(var_92_3.content)

				arg_89_1.text_.text = var_92_4

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_5 = 47
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

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122023", "story_v_out_117122.awb") ~= 0 then
					local var_92_8 = manager.audio:GetVoiceLength("story_v_out_117122", "117122023", "story_v_out_117122.awb") / 1000

					if var_92_8 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_8 + var_92_0
					end

					if var_92_3.prefab_name ~= "" and arg_89_1.actors_[var_92_3.prefab_name] ~= nil then
						local var_92_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_3.prefab_name].transform, "story_v_out_117122", "117122023", "story_v_out_117122.awb")

						arg_89_1:RecordAudio("117122023", var_92_9)
						arg_89_1:RecordAudio("117122023", var_92_9)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_117122", "117122023", "story_v_out_117122.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_117122", "117122023", "story_v_out_117122.awb")
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
	Play117122024 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 117122024
		arg_93_1.duration_ = 7.533

		local var_93_0 = {
			zh = 7.533,
			ja = 5.433
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
				arg_93_0:Play117122025(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1033"].transform
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 then
				arg_93_1.var_.moveOldPos1033 = var_96_0.localPosition
				var_96_0.localScale = Vector3.New(1, 1, 1)

				arg_93_1:CheckSpriteTmpPos("1033", 4)

				local var_96_2 = var_96_0.childCount

				for iter_96_0 = 0, var_96_2 - 1 do
					local var_96_3 = var_96_0:GetChild(iter_96_0)

					if var_96_3.name == "split_6" or not string.find(var_96_3.name, "split") then
						var_96_3.gameObject:SetActive(true)
					else
						var_96_3.gameObject:SetActive(false)
					end
				end
			end

			local var_96_4 = 0.001

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_4 then
				local var_96_5 = (arg_93_1.time_ - var_96_1) / var_96_4
				local var_96_6 = Vector3.New(390, -420, 0)

				var_96_0.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1033, var_96_6, var_96_5)
			end

			if arg_93_1.time_ >= var_96_1 + var_96_4 and arg_93_1.time_ < var_96_1 + var_96_4 + arg_96_0 then
				var_96_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_96_7 = arg_93_1.actors_["1132"]
			local var_96_8 = 0

			if var_96_8 < arg_93_1.time_ and arg_93_1.time_ <= var_96_8 + arg_96_0 and arg_93_1.var_.actorSpriteComps1132 == nil then
				arg_93_1.var_.actorSpriteComps1132 = var_96_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_96_9 = 0.2

			if var_96_8 <= arg_93_1.time_ and arg_93_1.time_ < var_96_8 + var_96_9 then
				local var_96_10 = (arg_93_1.time_ - var_96_8) / var_96_9

				if arg_93_1.var_.actorSpriteComps1132 then
					for iter_96_1, iter_96_2 in pairs(arg_93_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_96_2 then
							local var_96_11 = Mathf.Lerp(iter_96_2.color.r, 0.5, var_96_10)

							iter_96_2.color = Color.New(var_96_11, var_96_11, var_96_11)
						end
					end
				end
			end

			if arg_93_1.time_ >= var_96_8 + var_96_9 and arg_93_1.time_ < var_96_8 + var_96_9 + arg_96_0 and arg_93_1.var_.actorSpriteComps1132 then
				local var_96_12 = 0.5

				for iter_96_3, iter_96_4 in pairs(arg_93_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_96_4 then
						iter_96_4.color = Color.New(var_96_12, var_96_12, var_96_12)
					end
				end

				arg_93_1.var_.actorSpriteComps1132 = nil
			end

			local var_96_13 = arg_93_1.actors_["1033"]
			local var_96_14 = 0

			if var_96_14 < arg_93_1.time_ and arg_93_1.time_ <= var_96_14 + arg_96_0 and arg_93_1.var_.actorSpriteComps1033 == nil then
				arg_93_1.var_.actorSpriteComps1033 = var_96_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_96_15 = 0.2

			if var_96_14 <= arg_93_1.time_ and arg_93_1.time_ < var_96_14 + var_96_15 then
				local var_96_16 = (arg_93_1.time_ - var_96_14) / var_96_15

				if arg_93_1.var_.actorSpriteComps1033 then
					for iter_96_5, iter_96_6 in pairs(arg_93_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_96_6 then
							local var_96_17 = Mathf.Lerp(iter_96_6.color.r, 1, var_96_16)

							iter_96_6.color = Color.New(var_96_17, var_96_17, var_96_17)
						end
					end
				end
			end

			if arg_93_1.time_ >= var_96_14 + var_96_15 and arg_93_1.time_ < var_96_14 + var_96_15 + arg_96_0 and arg_93_1.var_.actorSpriteComps1033 then
				local var_96_18 = 1

				for iter_96_7, iter_96_8 in pairs(arg_93_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_96_8 then
						iter_96_8.color = Color.New(var_96_18, var_96_18, var_96_18)
					end
				end

				arg_93_1.var_.actorSpriteComps1033 = nil
			end

			local var_96_19 = 0
			local var_96_20 = 1.05

			if var_96_19 < arg_93_1.time_ and arg_93_1.time_ <= var_96_19 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_21 = arg_93_1:FormatText(StoryNameCfg[236].name)

				arg_93_1.leftNameTxt_.text = var_96_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_22 = arg_93_1:GetWordFromCfg(117122024)
				local var_96_23 = arg_93_1:FormatText(var_96_22.content)

				arg_93_1.text_.text = var_96_23

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_24 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122024", "story_v_out_117122.awb") ~= 0 then
					local var_96_27 = manager.audio:GetVoiceLength("story_v_out_117122", "117122024", "story_v_out_117122.awb") / 1000

					if var_96_27 + var_96_19 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_27 + var_96_19
					end

					if var_96_22.prefab_name ~= "" and arg_93_1.actors_[var_96_22.prefab_name] ~= nil then
						local var_96_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_22.prefab_name].transform, "story_v_out_117122", "117122024", "story_v_out_117122.awb")

						arg_93_1:RecordAudio("117122024", var_96_28)
						arg_93_1:RecordAudio("117122024", var_96_28)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_117122", "117122024", "story_v_out_117122.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_117122", "117122024", "story_v_out_117122.awb")
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
	Play117122025 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 117122025
		arg_97_1.duration_ = 5.6

		local var_97_0 = {
			zh = 5.6,
			ja = 4.366
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
				arg_97_0:Play117122026(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 0.675

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_2 = arg_97_1:FormatText(StoryNameCfg[236].name)

				arg_97_1.leftNameTxt_.text = var_100_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_3 = arg_97_1:GetWordFromCfg(117122025)
				local var_100_4 = arg_97_1:FormatText(var_100_3.content)

				arg_97_1.text_.text = var_100_4

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_5 = 27
				local var_100_6 = utf8.len(var_100_4)
				local var_100_7 = var_100_5 <= 0 and var_100_1 or var_100_1 * (var_100_6 / var_100_5)

				if var_100_7 > 0 and var_100_1 < var_100_7 then
					arg_97_1.talkMaxDuration = var_100_7

					if var_100_7 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_7 + var_100_0
					end
				end

				arg_97_1.text_.text = var_100_4
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122025", "story_v_out_117122.awb") ~= 0 then
					local var_100_8 = manager.audio:GetVoiceLength("story_v_out_117122", "117122025", "story_v_out_117122.awb") / 1000

					if var_100_8 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_8 + var_100_0
					end

					if var_100_3.prefab_name ~= "" and arg_97_1.actors_[var_100_3.prefab_name] ~= nil then
						local var_100_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_3.prefab_name].transform, "story_v_out_117122", "117122025", "story_v_out_117122.awb")

						arg_97_1:RecordAudio("117122025", var_100_9)
						arg_97_1:RecordAudio("117122025", var_100_9)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_117122", "117122025", "story_v_out_117122.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_117122", "117122025", "story_v_out_117122.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_10 = math.max(var_100_1, arg_97_1.talkMaxDuration)

			if var_100_0 <= arg_97_1.time_ and arg_97_1.time_ < var_100_0 + var_100_10 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_0) / var_100_10

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_0 + var_100_10 and arg_97_1.time_ < var_100_0 + var_100_10 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play117122026 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 117122026
		arg_101_1.duration_ = 7.366

		local var_101_0 = {
			zh = 7.366,
			ja = 4.1
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
				arg_101_0:Play117122027(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1132"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.actorSpriteComps1132 == nil then
				arg_101_1.var_.actorSpriteComps1132 = var_104_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_104_2 = 0.2

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.actorSpriteComps1132 then
					for iter_104_0, iter_104_1 in pairs(arg_101_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_104_1 then
							local var_104_4 = Mathf.Lerp(iter_104_1.color.r, 1, var_104_3)

							iter_104_1.color = Color.New(var_104_4, var_104_4, var_104_4)
						end
					end
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.actorSpriteComps1132 then
				local var_104_5 = 1

				for iter_104_2, iter_104_3 in pairs(arg_101_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_104_3 then
						iter_104_3.color = Color.New(var_104_5, var_104_5, var_104_5)
					end
				end

				arg_101_1.var_.actorSpriteComps1132 = nil
			end

			local var_104_6 = arg_101_1.actors_["1033"]
			local var_104_7 = 0

			if var_104_7 < arg_101_1.time_ and arg_101_1.time_ <= var_104_7 + arg_104_0 and arg_101_1.var_.actorSpriteComps1033 == nil then
				arg_101_1.var_.actorSpriteComps1033 = var_104_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_104_8 = 0.2

			if var_104_7 <= arg_101_1.time_ and arg_101_1.time_ < var_104_7 + var_104_8 then
				local var_104_9 = (arg_101_1.time_ - var_104_7) / var_104_8

				if arg_101_1.var_.actorSpriteComps1033 then
					for iter_104_4, iter_104_5 in pairs(arg_101_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_104_5 then
							local var_104_10 = Mathf.Lerp(iter_104_5.color.r, 0.5, var_104_9)

							iter_104_5.color = Color.New(var_104_10, var_104_10, var_104_10)
						end
					end
				end
			end

			if arg_101_1.time_ >= var_104_7 + var_104_8 and arg_101_1.time_ < var_104_7 + var_104_8 + arg_104_0 and arg_101_1.var_.actorSpriteComps1033 then
				local var_104_11 = 0.5

				for iter_104_6, iter_104_7 in pairs(arg_101_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_104_7 then
						iter_104_7.color = Color.New(var_104_11, var_104_11, var_104_11)
					end
				end

				arg_101_1.var_.actorSpriteComps1033 = nil
			end

			local var_104_12 = 0
			local var_104_13 = 0.6

			if var_104_12 < arg_101_1.time_ and arg_101_1.time_ <= var_104_12 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_14 = arg_101_1:FormatText(StoryNameCfg[61].name)

				arg_101_1.leftNameTxt_.text = var_104_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_15 = arg_101_1:GetWordFromCfg(117122026)
				local var_104_16 = arg_101_1:FormatText(var_104_15.content)

				arg_101_1.text_.text = var_104_16

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_17 = 24
				local var_104_18 = utf8.len(var_104_16)
				local var_104_19 = var_104_17 <= 0 and var_104_13 or var_104_13 * (var_104_18 / var_104_17)

				if var_104_19 > 0 and var_104_13 < var_104_19 then
					arg_101_1.talkMaxDuration = var_104_19

					if var_104_19 + var_104_12 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_19 + var_104_12
					end
				end

				arg_101_1.text_.text = var_104_16
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122026", "story_v_out_117122.awb") ~= 0 then
					local var_104_20 = manager.audio:GetVoiceLength("story_v_out_117122", "117122026", "story_v_out_117122.awb") / 1000

					if var_104_20 + var_104_12 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_20 + var_104_12
					end

					if var_104_15.prefab_name ~= "" and arg_101_1.actors_[var_104_15.prefab_name] ~= nil then
						local var_104_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_15.prefab_name].transform, "story_v_out_117122", "117122026", "story_v_out_117122.awb")

						arg_101_1:RecordAudio("117122026", var_104_21)
						arg_101_1:RecordAudio("117122026", var_104_21)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_117122", "117122026", "story_v_out_117122.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_117122", "117122026", "story_v_out_117122.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_22 = math.max(var_104_13, arg_101_1.talkMaxDuration)

			if var_104_12 <= arg_101_1.time_ and arg_101_1.time_ < var_104_12 + var_104_22 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_12) / var_104_22

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_12 + var_104_22 and arg_101_1.time_ < var_104_12 + var_104_22 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play117122027 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 117122027
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play117122028(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1132"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.actorSpriteComps1132 == nil then
				arg_105_1.var_.actorSpriteComps1132 = var_108_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_108_2 = 0.2

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.actorSpriteComps1132 then
					for iter_108_0, iter_108_1 in pairs(arg_105_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_108_1 then
							local var_108_4 = Mathf.Lerp(iter_108_1.color.r, 0.5, var_108_3)

							iter_108_1.color = Color.New(var_108_4, var_108_4, var_108_4)
						end
					end
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.actorSpriteComps1132 then
				local var_108_5 = 0.5

				for iter_108_2, iter_108_3 in pairs(arg_105_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_108_3 then
						iter_108_3.color = Color.New(var_108_5, var_108_5, var_108_5)
					end
				end

				arg_105_1.var_.actorSpriteComps1132 = nil
			end

			local var_108_6 = 0
			local var_108_7 = 0.55

			if var_108_6 < arg_105_1.time_ and arg_105_1.time_ <= var_108_6 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, false)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_8 = arg_105_1:GetWordFromCfg(117122027)
				local var_108_9 = arg_105_1:FormatText(var_108_8.content)

				arg_105_1.text_.text = var_108_9

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_10 = 22
				local var_108_11 = utf8.len(var_108_9)
				local var_108_12 = var_108_10 <= 0 and var_108_7 or var_108_7 * (var_108_11 / var_108_10)

				if var_108_12 > 0 and var_108_7 < var_108_12 then
					arg_105_1.talkMaxDuration = var_108_12

					if var_108_12 + var_108_6 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_12 + var_108_6
					end
				end

				arg_105_1.text_.text = var_108_9
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_13 = math.max(var_108_7, arg_105_1.talkMaxDuration)

			if var_108_6 <= arg_105_1.time_ and arg_105_1.time_ < var_108_6 + var_108_13 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_6) / var_108_13

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_6 + var_108_13 and arg_105_1.time_ < var_108_6 + var_108_13 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play117122028 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 117122028
		arg_109_1.duration_ = 4.866

		local var_109_0 = {
			zh = 4.866,
			ja = 3.7
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
				arg_109_0:Play117122029(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1132"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.actorSpriteComps1132 == nil then
				arg_109_1.var_.actorSpriteComps1132 = var_112_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_112_2 = 0.2

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.actorSpriteComps1132 then
					for iter_112_0, iter_112_1 in pairs(arg_109_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_112_1 then
							local var_112_4 = Mathf.Lerp(iter_112_1.color.r, 1, var_112_3)

							iter_112_1.color = Color.New(var_112_4, var_112_4, var_112_4)
						end
					end
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.actorSpriteComps1132 then
				local var_112_5 = 1

				for iter_112_2, iter_112_3 in pairs(arg_109_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_112_3 then
						iter_112_3.color = Color.New(var_112_5, var_112_5, var_112_5)
					end
				end

				arg_109_1.var_.actorSpriteComps1132 = nil
			end

			local var_112_6 = 0
			local var_112_7 = 0.4

			if var_112_6 < arg_109_1.time_ and arg_109_1.time_ <= var_112_6 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_8 = arg_109_1:FormatText(StoryNameCfg[61].name)

				arg_109_1.leftNameTxt_.text = var_112_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_9 = arg_109_1:GetWordFromCfg(117122028)
				local var_112_10 = arg_109_1:FormatText(var_112_9.content)

				arg_109_1.text_.text = var_112_10

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_11 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122028", "story_v_out_117122.awb") ~= 0 then
					local var_112_14 = manager.audio:GetVoiceLength("story_v_out_117122", "117122028", "story_v_out_117122.awb") / 1000

					if var_112_14 + var_112_6 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_14 + var_112_6
					end

					if var_112_9.prefab_name ~= "" and arg_109_1.actors_[var_112_9.prefab_name] ~= nil then
						local var_112_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_9.prefab_name].transform, "story_v_out_117122", "117122028", "story_v_out_117122.awb")

						arg_109_1:RecordAudio("117122028", var_112_15)
						arg_109_1:RecordAudio("117122028", var_112_15)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_117122", "117122028", "story_v_out_117122.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_117122", "117122028", "story_v_out_117122.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_16 = math.max(var_112_7, arg_109_1.talkMaxDuration)

			if var_112_6 <= arg_109_1.time_ and arg_109_1.time_ < var_112_6 + var_112_16 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_6) / var_112_16

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_6 + var_112_16 and arg_109_1.time_ < var_112_6 + var_112_16 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play117122029 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 117122029
		arg_113_1.duration_ = 8.3

		local var_113_0 = {
			zh = 6.2,
			ja = 8.3
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
				arg_113_0:Play117122030(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1132"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.actorSpriteComps1132 == nil then
				arg_113_1.var_.actorSpriteComps1132 = var_116_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_116_2 = 0.2

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.actorSpriteComps1132 then
					for iter_116_0, iter_116_1 in pairs(arg_113_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_116_1 then
							local var_116_4 = Mathf.Lerp(iter_116_1.color.r, 0.5, var_116_3)

							iter_116_1.color = Color.New(var_116_4, var_116_4, var_116_4)
						end
					end
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.actorSpriteComps1132 then
				local var_116_5 = 0.5

				for iter_116_2, iter_116_3 in pairs(arg_113_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_116_3 then
						iter_116_3.color = Color.New(var_116_5, var_116_5, var_116_5)
					end
				end

				arg_113_1.var_.actorSpriteComps1132 = nil
			end

			local var_116_6 = arg_113_1.actors_["1033"]
			local var_116_7 = 0

			if var_116_7 < arg_113_1.time_ and arg_113_1.time_ <= var_116_7 + arg_116_0 and arg_113_1.var_.actorSpriteComps1033 == nil then
				arg_113_1.var_.actorSpriteComps1033 = var_116_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_116_8 = 0.2

			if var_116_7 <= arg_113_1.time_ and arg_113_1.time_ < var_116_7 + var_116_8 then
				local var_116_9 = (arg_113_1.time_ - var_116_7) / var_116_8

				if arg_113_1.var_.actorSpriteComps1033 then
					for iter_116_4, iter_116_5 in pairs(arg_113_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_116_5 then
							local var_116_10 = Mathf.Lerp(iter_116_5.color.r, 1, var_116_9)

							iter_116_5.color = Color.New(var_116_10, var_116_10, var_116_10)
						end
					end
				end
			end

			if arg_113_1.time_ >= var_116_7 + var_116_8 and arg_113_1.time_ < var_116_7 + var_116_8 + arg_116_0 and arg_113_1.var_.actorSpriteComps1033 then
				local var_116_11 = 1

				for iter_116_6, iter_116_7 in pairs(arg_113_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_116_7 then
						iter_116_7.color = Color.New(var_116_11, var_116_11, var_116_11)
					end
				end

				arg_113_1.var_.actorSpriteComps1033 = nil
			end

			local var_116_12 = 0
			local var_116_13 = 0.575

			if var_116_12 < arg_113_1.time_ and arg_113_1.time_ <= var_116_12 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_14 = arg_113_1:FormatText(StoryNameCfg[236].name)

				arg_113_1.leftNameTxt_.text = var_116_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_15 = arg_113_1:GetWordFromCfg(117122029)
				local var_116_16 = arg_113_1:FormatText(var_116_15.content)

				arg_113_1.text_.text = var_116_16

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_17 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122029", "story_v_out_117122.awb") ~= 0 then
					local var_116_20 = manager.audio:GetVoiceLength("story_v_out_117122", "117122029", "story_v_out_117122.awb") / 1000

					if var_116_20 + var_116_12 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_20 + var_116_12
					end

					if var_116_15.prefab_name ~= "" and arg_113_1.actors_[var_116_15.prefab_name] ~= nil then
						local var_116_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_15.prefab_name].transform, "story_v_out_117122", "117122029", "story_v_out_117122.awb")

						arg_113_1:RecordAudio("117122029", var_116_21)
						arg_113_1:RecordAudio("117122029", var_116_21)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_117122", "117122029", "story_v_out_117122.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_117122", "117122029", "story_v_out_117122.awb")
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
	Play117122030 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 117122030
		arg_117_1.duration_ = 5

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play117122031(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1033"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.actorSpriteComps1033 == nil then
				arg_117_1.var_.actorSpriteComps1033 = var_120_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_120_2 = 0.2

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.actorSpriteComps1033 then
					for iter_120_0, iter_120_1 in pairs(arg_117_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_120_1 then
							local var_120_4 = Mathf.Lerp(iter_120_1.color.r, 0.5, var_120_3)

							iter_120_1.color = Color.New(var_120_4, var_120_4, var_120_4)
						end
					end
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.actorSpriteComps1033 then
				local var_120_5 = 0.5

				for iter_120_2, iter_120_3 in pairs(arg_117_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_120_3 then
						iter_120_3.color = Color.New(var_120_5, var_120_5, var_120_5)
					end
				end

				arg_117_1.var_.actorSpriteComps1033 = nil
			end

			local var_120_6 = 0
			local var_120_7 = 1.025

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

				local var_120_8 = arg_117_1:GetWordFromCfg(117122030)
				local var_120_9 = arg_117_1:FormatText(var_120_8.content)

				arg_117_1.text_.text = var_120_9

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_10 = 41
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
	Play117122031 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 117122031
		arg_121_1.duration_ = 2.466

		local var_121_0 = {
			zh = 2.466,
			ja = 2.1
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
				arg_121_0:Play117122032(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1033"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos1033 = var_124_0.localPosition
				var_124_0.localScale = Vector3.New(1, 1, 1)

				arg_121_1:CheckSpriteTmpPos("1033", 7)

				local var_124_2 = var_124_0.childCount

				for iter_124_0 = 0, var_124_2 - 1 do
					local var_124_3 = var_124_0:GetChild(iter_124_0)

					if var_124_3.name == "split_4" or not string.find(var_124_3.name, "split") then
						var_124_3.gameObject:SetActive(true)
					else
						var_124_3.gameObject:SetActive(false)
					end
				end
			end

			local var_124_4 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_4 then
				local var_124_5 = (arg_121_1.time_ - var_124_1) / var_124_4
				local var_124_6 = Vector3.New(0, -2000, 0)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1033, var_124_6, var_124_5)
			end

			if arg_121_1.time_ >= var_124_1 + var_124_4 and arg_121_1.time_ < var_124_1 + var_124_4 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_124_7 = arg_121_1.actors_["10035"]
			local var_124_8 = 0

			if var_124_8 < arg_121_1.time_ and arg_121_1.time_ <= var_124_8 + arg_124_0 and arg_121_1.var_.actorSpriteComps10035 == nil then
				arg_121_1.var_.actorSpriteComps10035 = var_124_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_124_9 = 0.2

			if var_124_8 <= arg_121_1.time_ and arg_121_1.time_ < var_124_8 + var_124_9 then
				local var_124_10 = (arg_121_1.time_ - var_124_8) / var_124_9

				if arg_121_1.var_.actorSpriteComps10035 then
					for iter_124_1, iter_124_2 in pairs(arg_121_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_124_2 then
							local var_124_11 = Mathf.Lerp(iter_124_2.color.r, 1, var_124_10)

							iter_124_2.color = Color.New(var_124_11, var_124_11, var_124_11)
						end
					end
				end
			end

			if arg_121_1.time_ >= var_124_8 + var_124_9 and arg_121_1.time_ < var_124_8 + var_124_9 + arg_124_0 and arg_121_1.var_.actorSpriteComps10035 then
				local var_124_12 = 1

				for iter_124_3, iter_124_4 in pairs(arg_121_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_124_4 then
						iter_124_4.color = Color.New(var_124_12, var_124_12, var_124_12)
					end
				end

				arg_121_1.var_.actorSpriteComps10035 = nil
			end

			local var_124_13 = arg_121_1.actors_["10035"]
			local var_124_14 = 0

			if var_124_14 < arg_121_1.time_ and arg_121_1.time_ <= var_124_14 + arg_124_0 then
				local var_124_15 = var_124_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_124_15 then
					arg_121_1.var_.alphaOldValue10035 = var_124_15.alpha
					arg_121_1.var_.characterEffect10035 = var_124_15
				end

				arg_121_1.var_.alphaOldValue10035 = 0
			end

			local var_124_16 = 0.333333333333333

			if var_124_14 <= arg_121_1.time_ and arg_121_1.time_ < var_124_14 + var_124_16 then
				local var_124_17 = (arg_121_1.time_ - var_124_14) / var_124_16
				local var_124_18 = Mathf.Lerp(arg_121_1.var_.alphaOldValue10035, 1, var_124_17)

				if arg_121_1.var_.characterEffect10035 then
					arg_121_1.var_.characterEffect10035.alpha = var_124_18
				end
			end

			if arg_121_1.time_ >= var_124_14 + var_124_16 and arg_121_1.time_ < var_124_14 + var_124_16 + arg_124_0 and arg_121_1.var_.characterEffect10035 then
				arg_121_1.var_.characterEffect10035.alpha = 1
			end

			local var_124_19 = 0
			local var_124_20 = 0.25

			if var_124_19 < arg_121_1.time_ and arg_121_1.time_ <= var_124_19 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_21 = arg_121_1:FormatText(StoryNameCfg[369].name)

				arg_121_1.leftNameTxt_.text = var_124_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, true)
				arg_121_1.iconController_:SetSelectedState("hero")

				arg_121_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10035_split_4")

				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_22 = arg_121_1:GetWordFromCfg(117122031)
				local var_124_23 = arg_121_1:FormatText(var_124_22.content)

				arg_121_1.text_.text = var_124_23

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_24 = 10
				local var_124_25 = utf8.len(var_124_23)
				local var_124_26 = var_124_24 <= 0 and var_124_20 or var_124_20 * (var_124_25 / var_124_24)

				if var_124_26 > 0 and var_124_20 < var_124_26 then
					arg_121_1.talkMaxDuration = var_124_26

					if var_124_26 + var_124_19 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_26 + var_124_19
					end
				end

				arg_121_1.text_.text = var_124_23
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122031", "story_v_out_117122.awb") ~= 0 then
					local var_124_27 = manager.audio:GetVoiceLength("story_v_out_117122", "117122031", "story_v_out_117122.awb") / 1000

					if var_124_27 + var_124_19 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_27 + var_124_19
					end

					if var_124_22.prefab_name ~= "" and arg_121_1.actors_[var_124_22.prefab_name] ~= nil then
						local var_124_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_22.prefab_name].transform, "story_v_out_117122", "117122031", "story_v_out_117122.awb")

						arg_121_1:RecordAudio("117122031", var_124_28)
						arg_121_1:RecordAudio("117122031", var_124_28)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_117122", "117122031", "story_v_out_117122.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_117122", "117122031", "story_v_out_117122.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_29 = math.max(var_124_20, arg_121_1.talkMaxDuration)

			if var_124_19 <= arg_121_1.time_ and arg_121_1.time_ < var_124_19 + var_124_29 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_19) / var_124_29

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_19 + var_124_29 and arg_121_1.time_ < var_124_19 + var_124_29 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play117122032 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 117122032
		arg_125_1.duration_ = 1.8

		local var_125_0 = {
			zh = 1.8,
			ja = 1.433
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
				arg_125_0:Play117122033(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1132"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.actorSpriteComps1132 == nil then
				arg_125_1.var_.actorSpriteComps1132 = var_128_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_128_2 = 0.2

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.actorSpriteComps1132 then
					for iter_128_0, iter_128_1 in pairs(arg_125_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_128_1 then
							local var_128_4 = Mathf.Lerp(iter_128_1.color.r, 1, var_128_3)

							iter_128_1.color = Color.New(var_128_4, var_128_4, var_128_4)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.actorSpriteComps1132 then
				local var_128_5 = 1

				for iter_128_2, iter_128_3 in pairs(arg_125_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_128_3 then
						iter_128_3.color = Color.New(var_128_5, var_128_5, var_128_5)
					end
				end

				arg_125_1.var_.actorSpriteComps1132 = nil
			end

			local var_128_6 = arg_125_1.actors_["10035"]
			local var_128_7 = 0

			if var_128_7 < arg_125_1.time_ and arg_125_1.time_ <= var_128_7 + arg_128_0 and arg_125_1.var_.actorSpriteComps10035 == nil then
				arg_125_1.var_.actorSpriteComps10035 = var_128_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_128_8 = 0.2

			if var_128_7 <= arg_125_1.time_ and arg_125_1.time_ < var_128_7 + var_128_8 then
				local var_128_9 = (arg_125_1.time_ - var_128_7) / var_128_8

				if arg_125_1.var_.actorSpriteComps10035 then
					for iter_128_4, iter_128_5 in pairs(arg_125_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_128_5 then
							local var_128_10 = Mathf.Lerp(iter_128_5.color.r, 0.5, var_128_9)

							iter_128_5.color = Color.New(var_128_10, var_128_10, var_128_10)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_7 + var_128_8 and arg_125_1.time_ < var_128_7 + var_128_8 + arg_128_0 and arg_125_1.var_.actorSpriteComps10035 then
				local var_128_11 = 0.5

				for iter_128_6, iter_128_7 in pairs(arg_125_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_128_7 then
						iter_128_7.color = Color.New(var_128_11, var_128_11, var_128_11)
					end
				end

				arg_125_1.var_.actorSpriteComps10035 = nil
			end

			local var_128_12 = 0
			local var_128_13 = 0.1

			if var_128_12 < arg_125_1.time_ and arg_125_1.time_ <= var_128_12 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_14 = arg_125_1:FormatText(StoryNameCfg[61].name)

				arg_125_1.leftNameTxt_.text = var_128_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_15 = arg_125_1:GetWordFromCfg(117122032)
				local var_128_16 = arg_125_1:FormatText(var_128_15.content)

				arg_125_1.text_.text = var_128_16

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_17 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122032", "story_v_out_117122.awb") ~= 0 then
					local var_128_20 = manager.audio:GetVoiceLength("story_v_out_117122", "117122032", "story_v_out_117122.awb") / 1000

					if var_128_20 + var_128_12 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_20 + var_128_12
					end

					if var_128_15.prefab_name ~= "" and arg_125_1.actors_[var_128_15.prefab_name] ~= nil then
						local var_128_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_15.prefab_name].transform, "story_v_out_117122", "117122032", "story_v_out_117122.awb")

						arg_125_1:RecordAudio("117122032", var_128_21)
						arg_125_1:RecordAudio("117122032", var_128_21)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_117122", "117122032", "story_v_out_117122.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_117122", "117122032", "story_v_out_117122.awb")
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
	Play117122033 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 117122033
		arg_129_1.duration_ = 3.566

		local var_129_0 = {
			zh = 3.566,
			ja = 2.666
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
				arg_129_0:Play117122034(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0
			local var_132_1 = 0.325

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_2 = arg_129_1:FormatText(StoryNameCfg[61].name)

				arg_129_1.leftNameTxt_.text = var_132_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_3 = arg_129_1:GetWordFromCfg(117122033)
				local var_132_4 = arg_129_1:FormatText(var_132_3.content)

				arg_129_1.text_.text = var_132_4

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_5 = 13
				local var_132_6 = utf8.len(var_132_4)
				local var_132_7 = var_132_5 <= 0 and var_132_1 or var_132_1 * (var_132_6 / var_132_5)

				if var_132_7 > 0 and var_132_1 < var_132_7 then
					arg_129_1.talkMaxDuration = var_132_7

					if var_132_7 + var_132_0 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_7 + var_132_0
					end
				end

				arg_129_1.text_.text = var_132_4
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122033", "story_v_out_117122.awb") ~= 0 then
					local var_132_8 = manager.audio:GetVoiceLength("story_v_out_117122", "117122033", "story_v_out_117122.awb") / 1000

					if var_132_8 + var_132_0 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_8 + var_132_0
					end

					if var_132_3.prefab_name ~= "" and arg_129_1.actors_[var_132_3.prefab_name] ~= nil then
						local var_132_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_3.prefab_name].transform, "story_v_out_117122", "117122033", "story_v_out_117122.awb")

						arg_129_1:RecordAudio("117122033", var_132_9)
						arg_129_1:RecordAudio("117122033", var_132_9)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_117122", "117122033", "story_v_out_117122.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_117122", "117122033", "story_v_out_117122.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_10 = math.max(var_132_1, arg_129_1.talkMaxDuration)

			if var_132_0 <= arg_129_1.time_ and arg_129_1.time_ < var_132_0 + var_132_10 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_0) / var_132_10

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_0 + var_132_10 and arg_129_1.time_ < var_132_0 + var_132_10 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play117122034 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 117122034
		arg_133_1.duration_ = 9.433

		local var_133_0 = {
			zh = 6,
			ja = 9.433
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
				arg_133_0:Play117122035(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["10035"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos10035 = var_136_0.localPosition
				var_136_0.localScale = Vector3.New(1, 1, 1)

				arg_133_1:CheckSpriteTmpPos("10035", 4)

				local var_136_2 = var_136_0.childCount

				for iter_136_0 = 0, var_136_2 - 1 do
					local var_136_3 = var_136_0:GetChild(iter_136_0)

					if var_136_3.name == "split_5" or not string.find(var_136_3.name, "split") then
						var_136_3.gameObject:SetActive(true)
					else
						var_136_3.gameObject:SetActive(false)
					end
				end
			end

			local var_136_4 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_4 then
				local var_136_5 = (arg_133_1.time_ - var_136_1) / var_136_4
				local var_136_6 = Vector3.New(390, -410, -235)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos10035, var_136_6, var_136_5)
			end

			if arg_133_1.time_ >= var_136_1 + var_136_4 and arg_133_1.time_ < var_136_1 + var_136_4 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(390, -410, -235)
			end

			local var_136_7 = arg_133_1.actors_["1132"]
			local var_136_8 = 0

			if var_136_8 < arg_133_1.time_ and arg_133_1.time_ <= var_136_8 + arg_136_0 and arg_133_1.var_.actorSpriteComps1132 == nil then
				arg_133_1.var_.actorSpriteComps1132 = var_136_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_136_9 = 0.2

			if var_136_8 <= arg_133_1.time_ and arg_133_1.time_ < var_136_8 + var_136_9 then
				local var_136_10 = (arg_133_1.time_ - var_136_8) / var_136_9

				if arg_133_1.var_.actorSpriteComps1132 then
					for iter_136_1, iter_136_2 in pairs(arg_133_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_136_2 then
							local var_136_11 = Mathf.Lerp(iter_136_2.color.r, 0.5, var_136_10)

							iter_136_2.color = Color.New(var_136_11, var_136_11, var_136_11)
						end
					end
				end
			end

			if arg_133_1.time_ >= var_136_8 + var_136_9 and arg_133_1.time_ < var_136_8 + var_136_9 + arg_136_0 and arg_133_1.var_.actorSpriteComps1132 then
				local var_136_12 = 0.5

				for iter_136_3, iter_136_4 in pairs(arg_133_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_136_4 then
						iter_136_4.color = Color.New(var_136_12, var_136_12, var_136_12)
					end
				end

				arg_133_1.var_.actorSpriteComps1132 = nil
			end

			local var_136_13 = arg_133_1.actors_["10035"]
			local var_136_14 = 0

			if var_136_14 < arg_133_1.time_ and arg_133_1.time_ <= var_136_14 + arg_136_0 and arg_133_1.var_.actorSpriteComps10035 == nil then
				arg_133_1.var_.actorSpriteComps10035 = var_136_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_136_15 = 0.2

			if var_136_14 <= arg_133_1.time_ and arg_133_1.time_ < var_136_14 + var_136_15 then
				local var_136_16 = (arg_133_1.time_ - var_136_14) / var_136_15

				if arg_133_1.var_.actorSpriteComps10035 then
					for iter_136_5, iter_136_6 in pairs(arg_133_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_136_6 then
							local var_136_17 = Mathf.Lerp(iter_136_6.color.r, 1, var_136_16)

							iter_136_6.color = Color.New(var_136_17, var_136_17, var_136_17)
						end
					end
				end
			end

			if arg_133_1.time_ >= var_136_14 + var_136_15 and arg_133_1.time_ < var_136_14 + var_136_15 + arg_136_0 and arg_133_1.var_.actorSpriteComps10035 then
				local var_136_18 = 1

				for iter_136_7, iter_136_8 in pairs(arg_133_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_136_8 then
						iter_136_8.color = Color.New(var_136_18, var_136_18, var_136_18)
					end
				end

				arg_133_1.var_.actorSpriteComps10035 = nil
			end

			local var_136_19 = arg_133_1.actors_["10035"]
			local var_136_20 = 0

			if var_136_20 < arg_133_1.time_ and arg_133_1.time_ <= var_136_20 + arg_136_0 then
				local var_136_21 = var_136_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_136_21 then
					arg_133_1.var_.alphaOldValue10035 = var_136_21.alpha
					arg_133_1.var_.characterEffect10035 = var_136_21
				end

				arg_133_1.var_.alphaOldValue10035 = 0
			end

			local var_136_22 = 0.0166666666666667

			if var_136_20 <= arg_133_1.time_ and arg_133_1.time_ < var_136_20 + var_136_22 then
				local var_136_23 = (arg_133_1.time_ - var_136_20) / var_136_22
				local var_136_24 = Mathf.Lerp(arg_133_1.var_.alphaOldValue10035, 1, var_136_23)

				if arg_133_1.var_.characterEffect10035 then
					arg_133_1.var_.characterEffect10035.alpha = var_136_24
				end
			end

			if arg_133_1.time_ >= var_136_20 + var_136_22 and arg_133_1.time_ < var_136_20 + var_136_22 + arg_136_0 and arg_133_1.var_.characterEffect10035 then
				arg_133_1.var_.characterEffect10035.alpha = 1
			end

			local var_136_25 = 0
			local var_136_26 = 0.775

			if var_136_25 < arg_133_1.time_ and arg_133_1.time_ <= var_136_25 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_27 = arg_133_1:FormatText(StoryNameCfg[369].name)

				arg_133_1.leftNameTxt_.text = var_136_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_28 = arg_133_1:GetWordFromCfg(117122034)
				local var_136_29 = arg_133_1:FormatText(var_136_28.content)

				arg_133_1.text_.text = var_136_29

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_30 = 31
				local var_136_31 = utf8.len(var_136_29)
				local var_136_32 = var_136_30 <= 0 and var_136_26 or var_136_26 * (var_136_31 / var_136_30)

				if var_136_32 > 0 and var_136_26 < var_136_32 then
					arg_133_1.talkMaxDuration = var_136_32

					if var_136_32 + var_136_25 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_32 + var_136_25
					end
				end

				arg_133_1.text_.text = var_136_29
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122034", "story_v_out_117122.awb") ~= 0 then
					local var_136_33 = manager.audio:GetVoiceLength("story_v_out_117122", "117122034", "story_v_out_117122.awb") / 1000

					if var_136_33 + var_136_25 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_33 + var_136_25
					end

					if var_136_28.prefab_name ~= "" and arg_133_1.actors_[var_136_28.prefab_name] ~= nil then
						local var_136_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_28.prefab_name].transform, "story_v_out_117122", "117122034", "story_v_out_117122.awb")

						arg_133_1:RecordAudio("117122034", var_136_34)
						arg_133_1:RecordAudio("117122034", var_136_34)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_117122", "117122034", "story_v_out_117122.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_117122", "117122034", "story_v_out_117122.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_35 = math.max(var_136_26, arg_133_1.talkMaxDuration)

			if var_136_25 <= arg_133_1.time_ and arg_133_1.time_ < var_136_25 + var_136_35 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_25) / var_136_35

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_25 + var_136_35 and arg_133_1.time_ < var_136_25 + var_136_35 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play117122035 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 117122035
		arg_137_1.duration_ = 5

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play117122036(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1132"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				local var_140_2 = var_140_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_140_2 then
					arg_137_1.var_.alphaOldValue1132 = var_140_2.alpha
					arg_137_1.var_.characterEffect1132 = var_140_2
				end

				arg_137_1.var_.alphaOldValue1132 = 1
			end

			local var_140_3 = 0.5

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_3 then
				local var_140_4 = (arg_137_1.time_ - var_140_1) / var_140_3
				local var_140_5 = Mathf.Lerp(arg_137_1.var_.alphaOldValue1132, 0, var_140_4)

				if arg_137_1.var_.characterEffect1132 then
					arg_137_1.var_.characterEffect1132.alpha = var_140_5
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_3 and arg_137_1.time_ < var_140_1 + var_140_3 + arg_140_0 and arg_137_1.var_.characterEffect1132 then
				arg_137_1.var_.characterEffect1132.alpha = 0
			end

			local var_140_6 = arg_137_1.actors_["10035"]
			local var_140_7 = 0

			if var_140_7 < arg_137_1.time_ and arg_137_1.time_ <= var_140_7 + arg_140_0 then
				local var_140_8 = var_140_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_140_8 then
					arg_137_1.var_.alphaOldValue10035 = var_140_8.alpha
					arg_137_1.var_.characterEffect10035 = var_140_8
				end

				arg_137_1.var_.alphaOldValue10035 = 1
			end

			local var_140_9 = 0.5

			if var_140_7 <= arg_137_1.time_ and arg_137_1.time_ < var_140_7 + var_140_9 then
				local var_140_10 = (arg_137_1.time_ - var_140_7) / var_140_9
				local var_140_11 = Mathf.Lerp(arg_137_1.var_.alphaOldValue10035, 0, var_140_10)

				if arg_137_1.var_.characterEffect10035 then
					arg_137_1.var_.characterEffect10035.alpha = var_140_11
				end
			end

			if arg_137_1.time_ >= var_140_7 + var_140_9 and arg_137_1.time_ < var_140_7 + var_140_9 + arg_140_0 and arg_137_1.var_.characterEffect10035 then
				arg_137_1.var_.characterEffect10035.alpha = 0
			end

			local var_140_12 = 0
			local var_140_13 = 1.375

			if var_140_12 < arg_137_1.time_ and arg_137_1.time_ <= var_140_12 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, false)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_14 = arg_137_1:GetWordFromCfg(117122035)
				local var_140_15 = arg_137_1:FormatText(var_140_14.content)

				arg_137_1.text_.text = var_140_15

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_16 = 55
				local var_140_17 = utf8.len(var_140_15)
				local var_140_18 = var_140_16 <= 0 and var_140_13 or var_140_13 * (var_140_17 / var_140_16)

				if var_140_18 > 0 and var_140_13 < var_140_18 then
					arg_137_1.talkMaxDuration = var_140_18

					if var_140_18 + var_140_12 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_18 + var_140_12
					end
				end

				arg_137_1.text_.text = var_140_15
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_19 = math.max(var_140_13, arg_137_1.talkMaxDuration)

			if var_140_12 <= arg_137_1.time_ and arg_137_1.time_ < var_140_12 + var_140_19 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_12) / var_140_19

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_12 + var_140_19 and arg_137_1.time_ < var_140_12 + var_140_19 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play117122036 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 117122036
		arg_141_1.duration_ = 11.733

		local var_141_0 = {
			zh = 8.7,
			ja = 11.733
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
				arg_141_0:Play117122037(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["10035"].transform
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos10035 = var_144_0.localPosition
				var_144_0.localScale = Vector3.New(1, 1, 1)

				arg_141_1:CheckSpriteTmpPos("10035", 4)

				local var_144_2 = var_144_0.childCount

				for iter_144_0 = 0, var_144_2 - 1 do
					local var_144_3 = var_144_0:GetChild(iter_144_0)

					if var_144_3.name == "split_4" or not string.find(var_144_3.name, "split") then
						var_144_3.gameObject:SetActive(true)
					else
						var_144_3.gameObject:SetActive(false)
					end
				end
			end

			local var_144_4 = 0.001

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_4 then
				local var_144_5 = (arg_141_1.time_ - var_144_1) / var_144_4
				local var_144_6 = Vector3.New(390, -410, -235)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos10035, var_144_6, var_144_5)
			end

			if arg_141_1.time_ >= var_144_1 + var_144_4 and arg_141_1.time_ < var_144_1 + var_144_4 + arg_144_0 then
				var_144_0.localPosition = Vector3.New(390, -410, -235)
			end

			local var_144_7 = arg_141_1.actors_["1132"].transform
			local var_144_8 = 0

			if var_144_8 < arg_141_1.time_ and arg_141_1.time_ <= var_144_8 + arg_144_0 then
				arg_141_1.var_.moveOldPos1132 = var_144_7.localPosition
				var_144_7.localScale = Vector3.New(1, 1, 1)

				arg_141_1:CheckSpriteTmpPos("1132", 2)

				local var_144_9 = var_144_7.childCount

				for iter_144_1 = 0, var_144_9 - 1 do
					local var_144_10 = var_144_7:GetChild(iter_144_1)

					if var_144_10.name == "split_6" or not string.find(var_144_10.name, "split") then
						var_144_10.gameObject:SetActive(true)
					else
						var_144_10.gameObject:SetActive(false)
					end
				end
			end

			local var_144_11 = 0.001

			if var_144_8 <= arg_141_1.time_ and arg_141_1.time_ < var_144_8 + var_144_11 then
				local var_144_12 = (arg_141_1.time_ - var_144_8) / var_144_11
				local var_144_13 = Vector3.New(-390, -413, -185)

				var_144_7.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1132, var_144_13, var_144_12)
			end

			if arg_141_1.time_ >= var_144_8 + var_144_11 and arg_141_1.time_ < var_144_8 + var_144_11 + arg_144_0 then
				var_144_7.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_144_14 = arg_141_1.actors_["1132"]
			local var_144_15 = 0

			if var_144_15 < arg_141_1.time_ and arg_141_1.time_ <= var_144_15 + arg_144_0 and arg_141_1.var_.actorSpriteComps1132 == nil then
				arg_141_1.var_.actorSpriteComps1132 = var_144_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_144_16 = 0.2

			if var_144_15 <= arg_141_1.time_ and arg_141_1.time_ < var_144_15 + var_144_16 then
				local var_144_17 = (arg_141_1.time_ - var_144_15) / var_144_16

				if arg_141_1.var_.actorSpriteComps1132 then
					for iter_144_2, iter_144_3 in pairs(arg_141_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_144_3 then
							local var_144_18 = Mathf.Lerp(iter_144_3.color.r, 0.5, var_144_17)

							iter_144_3.color = Color.New(var_144_18, var_144_18, var_144_18)
						end
					end
				end
			end

			if arg_141_1.time_ >= var_144_15 + var_144_16 and arg_141_1.time_ < var_144_15 + var_144_16 + arg_144_0 and arg_141_1.var_.actorSpriteComps1132 then
				local var_144_19 = 0.5

				for iter_144_4, iter_144_5 in pairs(arg_141_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_144_5 then
						iter_144_5.color = Color.New(var_144_19, var_144_19, var_144_19)
					end
				end

				arg_141_1.var_.actorSpriteComps1132 = nil
			end

			local var_144_20 = arg_141_1.actors_["10035"]
			local var_144_21 = 0

			if var_144_21 < arg_141_1.time_ and arg_141_1.time_ <= var_144_21 + arg_144_0 and arg_141_1.var_.actorSpriteComps10035 == nil then
				arg_141_1.var_.actorSpriteComps10035 = var_144_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_144_22 = 0.2

			if var_144_21 <= arg_141_1.time_ and arg_141_1.time_ < var_144_21 + var_144_22 then
				local var_144_23 = (arg_141_1.time_ - var_144_21) / var_144_22

				if arg_141_1.var_.actorSpriteComps10035 then
					for iter_144_6, iter_144_7 in pairs(arg_141_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_144_7 then
							local var_144_24 = Mathf.Lerp(iter_144_7.color.r, 1, var_144_23)

							iter_144_7.color = Color.New(var_144_24, var_144_24, var_144_24)
						end
					end
				end
			end

			if arg_141_1.time_ >= var_144_21 + var_144_22 and arg_141_1.time_ < var_144_21 + var_144_22 + arg_144_0 and arg_141_1.var_.actorSpriteComps10035 then
				local var_144_25 = 1

				for iter_144_8, iter_144_9 in pairs(arg_141_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_144_9 then
						iter_144_9.color = Color.New(var_144_25, var_144_25, var_144_25)
					end
				end

				arg_141_1.var_.actorSpriteComps10035 = nil
			end

			local var_144_26 = arg_141_1.actors_["1132"]
			local var_144_27 = 0

			if var_144_27 < arg_141_1.time_ and arg_141_1.time_ <= var_144_27 + arg_144_0 then
				local var_144_28 = var_144_26:GetComponentInChildren(typeof(CanvasGroup))

				if var_144_28 then
					arg_141_1.var_.alphaOldValue1132 = var_144_28.alpha
					arg_141_1.var_.characterEffect1132 = var_144_28
				end

				arg_141_1.var_.alphaOldValue1132 = 0
			end

			local var_144_29 = 0.5

			if var_144_27 <= arg_141_1.time_ and arg_141_1.time_ < var_144_27 + var_144_29 then
				local var_144_30 = (arg_141_1.time_ - var_144_27) / var_144_29
				local var_144_31 = Mathf.Lerp(arg_141_1.var_.alphaOldValue1132, 1, var_144_30)

				if arg_141_1.var_.characterEffect1132 then
					arg_141_1.var_.characterEffect1132.alpha = var_144_31
				end
			end

			if arg_141_1.time_ >= var_144_27 + var_144_29 and arg_141_1.time_ < var_144_27 + var_144_29 + arg_144_0 and arg_141_1.var_.characterEffect1132 then
				arg_141_1.var_.characterEffect1132.alpha = 1
			end

			local var_144_32 = arg_141_1.actors_["10035"]
			local var_144_33 = 0

			if var_144_33 < arg_141_1.time_ and arg_141_1.time_ <= var_144_33 + arg_144_0 then
				local var_144_34 = var_144_32:GetComponentInChildren(typeof(CanvasGroup))

				if var_144_34 then
					arg_141_1.var_.alphaOldValue10035 = var_144_34.alpha
					arg_141_1.var_.characterEffect10035 = var_144_34
				end

				arg_141_1.var_.alphaOldValue10035 = 0
			end

			local var_144_35 = 0.5

			if var_144_33 <= arg_141_1.time_ and arg_141_1.time_ < var_144_33 + var_144_35 then
				local var_144_36 = (arg_141_1.time_ - var_144_33) / var_144_35
				local var_144_37 = Mathf.Lerp(arg_141_1.var_.alphaOldValue10035, 1, var_144_36)

				if arg_141_1.var_.characterEffect10035 then
					arg_141_1.var_.characterEffect10035.alpha = var_144_37
				end
			end

			if arg_141_1.time_ >= var_144_33 + var_144_35 and arg_141_1.time_ < var_144_33 + var_144_35 + arg_144_0 and arg_141_1.var_.characterEffect10035 then
				arg_141_1.var_.characterEffect10035.alpha = 1
			end

			local var_144_38 = 0
			local var_144_39 = 1.15

			if var_144_38 < arg_141_1.time_ and arg_141_1.time_ <= var_144_38 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_40 = arg_141_1:FormatText(StoryNameCfg[369].name)

				arg_141_1.leftNameTxt_.text = var_144_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_41 = arg_141_1:GetWordFromCfg(117122036)
				local var_144_42 = arg_141_1:FormatText(var_144_41.content)

				arg_141_1.text_.text = var_144_42

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_43 = 46
				local var_144_44 = utf8.len(var_144_42)
				local var_144_45 = var_144_43 <= 0 and var_144_39 or var_144_39 * (var_144_44 / var_144_43)

				if var_144_45 > 0 and var_144_39 < var_144_45 then
					arg_141_1.talkMaxDuration = var_144_45

					if var_144_45 + var_144_38 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_45 + var_144_38
					end
				end

				arg_141_1.text_.text = var_144_42
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122036", "story_v_out_117122.awb") ~= 0 then
					local var_144_46 = manager.audio:GetVoiceLength("story_v_out_117122", "117122036", "story_v_out_117122.awb") / 1000

					if var_144_46 + var_144_38 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_46 + var_144_38
					end

					if var_144_41.prefab_name ~= "" and arg_141_1.actors_[var_144_41.prefab_name] ~= nil then
						local var_144_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_41.prefab_name].transform, "story_v_out_117122", "117122036", "story_v_out_117122.awb")

						arg_141_1:RecordAudio("117122036", var_144_47)
						arg_141_1:RecordAudio("117122036", var_144_47)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_117122", "117122036", "story_v_out_117122.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_117122", "117122036", "story_v_out_117122.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_48 = math.max(var_144_39, arg_141_1.talkMaxDuration)

			if var_144_38 <= arg_141_1.time_ and arg_141_1.time_ < var_144_38 + var_144_48 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_38) / var_144_48

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_38 + var_144_48 and arg_141_1.time_ < var_144_38 + var_144_48 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play117122037 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 117122037
		arg_145_1.duration_ = 8.4

		local var_145_0 = {
			zh = 4.133,
			ja = 8.4
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
				arg_145_0:Play117122038(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 0.475

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_2 = arg_145_1:FormatText(StoryNameCfg[369].name)

				arg_145_1.leftNameTxt_.text = var_148_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_3 = arg_145_1:GetWordFromCfg(117122037)
				local var_148_4 = arg_145_1:FormatText(var_148_3.content)

				arg_145_1.text_.text = var_148_4

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_5 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122037", "story_v_out_117122.awb") ~= 0 then
					local var_148_8 = manager.audio:GetVoiceLength("story_v_out_117122", "117122037", "story_v_out_117122.awb") / 1000

					if var_148_8 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_8 + var_148_0
					end

					if var_148_3.prefab_name ~= "" and arg_145_1.actors_[var_148_3.prefab_name] ~= nil then
						local var_148_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_3.prefab_name].transform, "story_v_out_117122", "117122037", "story_v_out_117122.awb")

						arg_145_1:RecordAudio("117122037", var_148_9)
						arg_145_1:RecordAudio("117122037", var_148_9)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_117122", "117122037", "story_v_out_117122.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_117122", "117122037", "story_v_out_117122.awb")
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
	Play117122038 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 117122038
		arg_149_1.duration_ = 13.433

		local var_149_0 = {
			zh = 6.833,
			ja = 13.433
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
				arg_149_0:Play117122039(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 0.8

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_2 = arg_149_1:FormatText(StoryNameCfg[369].name)

				arg_149_1.leftNameTxt_.text = var_152_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_3 = arg_149_1:GetWordFromCfg(117122038)
				local var_152_4 = arg_149_1:FormatText(var_152_3.content)

				arg_149_1.text_.text = var_152_4

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_5 = 32
				local var_152_6 = utf8.len(var_152_4)
				local var_152_7 = var_152_5 <= 0 and var_152_1 or var_152_1 * (var_152_6 / var_152_5)

				if var_152_7 > 0 and var_152_1 < var_152_7 then
					arg_149_1.talkMaxDuration = var_152_7

					if var_152_7 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_7 + var_152_0
					end
				end

				arg_149_1.text_.text = var_152_4
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122038", "story_v_out_117122.awb") ~= 0 then
					local var_152_8 = manager.audio:GetVoiceLength("story_v_out_117122", "117122038", "story_v_out_117122.awb") / 1000

					if var_152_8 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_8 + var_152_0
					end

					if var_152_3.prefab_name ~= "" and arg_149_1.actors_[var_152_3.prefab_name] ~= nil then
						local var_152_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_3.prefab_name].transform, "story_v_out_117122", "117122038", "story_v_out_117122.awb")

						arg_149_1:RecordAudio("117122038", var_152_9)
						arg_149_1:RecordAudio("117122038", var_152_9)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_117122", "117122038", "story_v_out_117122.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_117122", "117122038", "story_v_out_117122.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_10 = math.max(var_152_1, arg_149_1.talkMaxDuration)

			if var_152_0 <= arg_149_1.time_ and arg_149_1.time_ < var_152_0 + var_152_10 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_0) / var_152_10

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_0 + var_152_10 and arg_149_1.time_ < var_152_0 + var_152_10 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play117122039 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 117122039
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play117122040(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["10035"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.actorSpriteComps10035 == nil then
				arg_153_1.var_.actorSpriteComps10035 = var_156_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_156_2 = 0.2

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.actorSpriteComps10035 then
					for iter_156_0, iter_156_1 in pairs(arg_153_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_156_1 then
							local var_156_4 = Mathf.Lerp(iter_156_1.color.r, 0.5, var_156_3)

							iter_156_1.color = Color.New(var_156_4, var_156_4, var_156_4)
						end
					end
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.actorSpriteComps10035 then
				local var_156_5 = 0.5

				for iter_156_2, iter_156_3 in pairs(arg_153_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_156_3 then
						iter_156_3.color = Color.New(var_156_5, var_156_5, var_156_5)
					end
				end

				arg_153_1.var_.actorSpriteComps10035 = nil
			end

			local var_156_6 = 0
			local var_156_7 = 1.15

			if var_156_6 < arg_153_1.time_ and arg_153_1.time_ <= var_156_6 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, false)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_8 = arg_153_1:GetWordFromCfg(117122039)
				local var_156_9 = arg_153_1:FormatText(var_156_8.content)

				arg_153_1.text_.text = var_156_9

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_10 = 46
				local var_156_11 = utf8.len(var_156_9)
				local var_156_12 = var_156_10 <= 0 and var_156_7 or var_156_7 * (var_156_11 / var_156_10)

				if var_156_12 > 0 and var_156_7 < var_156_12 then
					arg_153_1.talkMaxDuration = var_156_12

					if var_156_12 + var_156_6 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_12 + var_156_6
					end
				end

				arg_153_1.text_.text = var_156_9
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)
				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_13 = math.max(var_156_7, arg_153_1.talkMaxDuration)

			if var_156_6 <= arg_153_1.time_ and arg_153_1.time_ < var_156_6 + var_156_13 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_6) / var_156_13

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_6 + var_156_13 and arg_153_1.time_ < var_156_6 + var_156_13 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play117122040 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 117122040
		arg_157_1.duration_ = 5.333

		local var_157_0 = {
			zh = 5.333,
			ja = 3.333
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
				arg_157_0:Play117122041(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["10035"].transform
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1.var_.moveOldPos10035 = var_160_0.localPosition
				var_160_0.localScale = Vector3.New(1, 1, 1)

				arg_157_1:CheckSpriteTmpPos("10035", 4)

				local var_160_2 = var_160_0.childCount

				for iter_160_0 = 0, var_160_2 - 1 do
					local var_160_3 = var_160_0:GetChild(iter_160_0)

					if var_160_3.name == "split_4" or not string.find(var_160_3.name, "split") then
						var_160_3.gameObject:SetActive(true)
					else
						var_160_3.gameObject:SetActive(false)
					end
				end
			end

			local var_160_4 = 0.001

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_4 then
				local var_160_5 = (arg_157_1.time_ - var_160_1) / var_160_4
				local var_160_6 = Vector3.New(390, -410, -235)

				var_160_0.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos10035, var_160_6, var_160_5)
			end

			if arg_157_1.time_ >= var_160_1 + var_160_4 and arg_157_1.time_ < var_160_1 + var_160_4 + arg_160_0 then
				var_160_0.localPosition = Vector3.New(390, -410, -235)
			end

			local var_160_7 = arg_157_1.actors_["1132"].transform
			local var_160_8 = 0

			if var_160_8 < arg_157_1.time_ and arg_157_1.time_ <= var_160_8 + arg_160_0 then
				arg_157_1.var_.moveOldPos1132 = var_160_7.localPosition
				var_160_7.localScale = Vector3.New(1, 1, 1)

				arg_157_1:CheckSpriteTmpPos("1132", 2)

				local var_160_9 = var_160_7.childCount

				for iter_160_1 = 0, var_160_9 - 1 do
					local var_160_10 = var_160_7:GetChild(iter_160_1)

					if var_160_10.name == "split_1" or not string.find(var_160_10.name, "split") then
						var_160_10.gameObject:SetActive(true)
					else
						var_160_10.gameObject:SetActive(false)
					end
				end
			end

			local var_160_11 = 0.001

			if var_160_8 <= arg_157_1.time_ and arg_157_1.time_ < var_160_8 + var_160_11 then
				local var_160_12 = (arg_157_1.time_ - var_160_8) / var_160_11
				local var_160_13 = Vector3.New(-390, -413, -185)

				var_160_7.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1132, var_160_13, var_160_12)
			end

			if arg_157_1.time_ >= var_160_8 + var_160_11 and arg_157_1.time_ < var_160_8 + var_160_11 + arg_160_0 then
				var_160_7.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_160_14 = arg_157_1.actors_["1132"]
			local var_160_15 = 0

			if var_160_15 < arg_157_1.time_ and arg_157_1.time_ <= var_160_15 + arg_160_0 and arg_157_1.var_.actorSpriteComps1132 == nil then
				arg_157_1.var_.actorSpriteComps1132 = var_160_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_160_16 = 0.2

			if var_160_15 <= arg_157_1.time_ and arg_157_1.time_ < var_160_15 + var_160_16 then
				local var_160_17 = (arg_157_1.time_ - var_160_15) / var_160_16

				if arg_157_1.var_.actorSpriteComps1132 then
					for iter_160_2, iter_160_3 in pairs(arg_157_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_160_3 then
							local var_160_18 = Mathf.Lerp(iter_160_3.color.r, 1, var_160_17)

							iter_160_3.color = Color.New(var_160_18, var_160_18, var_160_18)
						end
					end
				end
			end

			if arg_157_1.time_ >= var_160_15 + var_160_16 and arg_157_1.time_ < var_160_15 + var_160_16 + arg_160_0 and arg_157_1.var_.actorSpriteComps1132 then
				local var_160_19 = 1

				for iter_160_4, iter_160_5 in pairs(arg_157_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_160_5 then
						iter_160_5.color = Color.New(var_160_19, var_160_19, var_160_19)
					end
				end

				arg_157_1.var_.actorSpriteComps1132 = nil
			end

			local var_160_20 = 0
			local var_160_21 = 0.525

			if var_160_20 < arg_157_1.time_ and arg_157_1.time_ <= var_160_20 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_22 = arg_157_1:FormatText(StoryNameCfg[61].name)

				arg_157_1.leftNameTxt_.text = var_160_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_23 = arg_157_1:GetWordFromCfg(117122040)
				local var_160_24 = arg_157_1:FormatText(var_160_23.content)

				arg_157_1.text_.text = var_160_24

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_25 = 20
				local var_160_26 = utf8.len(var_160_24)
				local var_160_27 = var_160_25 <= 0 and var_160_21 or var_160_21 * (var_160_26 / var_160_25)

				if var_160_27 > 0 and var_160_21 < var_160_27 then
					arg_157_1.talkMaxDuration = var_160_27

					if var_160_27 + var_160_20 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_27 + var_160_20
					end
				end

				arg_157_1.text_.text = var_160_24
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122040", "story_v_out_117122.awb") ~= 0 then
					local var_160_28 = manager.audio:GetVoiceLength("story_v_out_117122", "117122040", "story_v_out_117122.awb") / 1000

					if var_160_28 + var_160_20 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_28 + var_160_20
					end

					if var_160_23.prefab_name ~= "" and arg_157_1.actors_[var_160_23.prefab_name] ~= nil then
						local var_160_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_23.prefab_name].transform, "story_v_out_117122", "117122040", "story_v_out_117122.awb")

						arg_157_1:RecordAudio("117122040", var_160_29)
						arg_157_1:RecordAudio("117122040", var_160_29)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_117122", "117122040", "story_v_out_117122.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_117122", "117122040", "story_v_out_117122.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_30 = math.max(var_160_21, arg_157_1.talkMaxDuration)

			if var_160_20 <= arg_157_1.time_ and arg_157_1.time_ < var_160_20 + var_160_30 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_20) / var_160_30

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_20 + var_160_30 and arg_157_1.time_ < var_160_20 + var_160_30 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play117122041 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 117122041
		arg_161_1.duration_ = 5.133

		local var_161_0 = {
			zh = 3.5,
			ja = 5.133
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
				arg_161_0:Play117122042(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0
			local var_164_1 = 0.3

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_2 = arg_161_1:FormatText(StoryNameCfg[61].name)

				arg_161_1.leftNameTxt_.text = var_164_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_3 = arg_161_1:GetWordFromCfg(117122041)
				local var_164_4 = arg_161_1:FormatText(var_164_3.content)

				arg_161_1.text_.text = var_164_4

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_5 = 12
				local var_164_6 = utf8.len(var_164_4)
				local var_164_7 = var_164_5 <= 0 and var_164_1 or var_164_1 * (var_164_6 / var_164_5)

				if var_164_7 > 0 and var_164_1 < var_164_7 then
					arg_161_1.talkMaxDuration = var_164_7

					if var_164_7 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_7 + var_164_0
					end
				end

				arg_161_1.text_.text = var_164_4
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122041", "story_v_out_117122.awb") ~= 0 then
					local var_164_8 = manager.audio:GetVoiceLength("story_v_out_117122", "117122041", "story_v_out_117122.awb") / 1000

					if var_164_8 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_8 + var_164_0
					end

					if var_164_3.prefab_name ~= "" and arg_161_1.actors_[var_164_3.prefab_name] ~= nil then
						local var_164_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_3.prefab_name].transform, "story_v_out_117122", "117122041", "story_v_out_117122.awb")

						arg_161_1:RecordAudio("117122041", var_164_9)
						arg_161_1:RecordAudio("117122041", var_164_9)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_117122", "117122041", "story_v_out_117122.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_117122", "117122041", "story_v_out_117122.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_10 = math.max(var_164_1, arg_161_1.talkMaxDuration)

			if var_164_0 <= arg_161_1.time_ and arg_161_1.time_ < var_164_0 + var_164_10 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_0) / var_164_10

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_0 + var_164_10 and arg_161_1.time_ < var_164_0 + var_164_10 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play117122042 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 117122042
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play117122043(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["1132"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				local var_168_2 = var_168_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_168_2 then
					arg_165_1.var_.alphaOldValue1132 = var_168_2.alpha
					arg_165_1.var_.characterEffect1132 = var_168_2
				end

				arg_165_1.var_.alphaOldValue1132 = 1
			end

			local var_168_3 = 0.5

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_3 then
				local var_168_4 = (arg_165_1.time_ - var_168_1) / var_168_3
				local var_168_5 = Mathf.Lerp(arg_165_1.var_.alphaOldValue1132, 0, var_168_4)

				if arg_165_1.var_.characterEffect1132 then
					arg_165_1.var_.characterEffect1132.alpha = var_168_5
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_3 and arg_165_1.time_ < var_168_1 + var_168_3 + arg_168_0 and arg_165_1.var_.characterEffect1132 then
				arg_165_1.var_.characterEffect1132.alpha = 0
			end

			local var_168_6 = arg_165_1.actors_["10035"]
			local var_168_7 = 0

			if var_168_7 < arg_165_1.time_ and arg_165_1.time_ <= var_168_7 + arg_168_0 then
				local var_168_8 = var_168_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_168_8 then
					arg_165_1.var_.alphaOldValue10035 = var_168_8.alpha
					arg_165_1.var_.characterEffect10035 = var_168_8
				end

				arg_165_1.var_.alphaOldValue10035 = 1
			end

			local var_168_9 = 0.5

			if var_168_7 <= arg_165_1.time_ and arg_165_1.time_ < var_168_7 + var_168_9 then
				local var_168_10 = (arg_165_1.time_ - var_168_7) / var_168_9
				local var_168_11 = Mathf.Lerp(arg_165_1.var_.alphaOldValue10035, 0, var_168_10)

				if arg_165_1.var_.characterEffect10035 then
					arg_165_1.var_.characterEffect10035.alpha = var_168_11
				end
			end

			if arg_165_1.time_ >= var_168_7 + var_168_9 and arg_165_1.time_ < var_168_7 + var_168_9 + arg_168_0 and arg_165_1.var_.characterEffect10035 then
				arg_165_1.var_.characterEffect10035.alpha = 0
			end

			local var_168_12 = 0
			local var_168_13 = 0.525

			if var_168_12 < arg_165_1.time_ and arg_165_1.time_ <= var_168_12 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, false)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_14 = arg_165_1:GetWordFromCfg(117122042)
				local var_168_15 = arg_165_1:FormatText(var_168_14.content)

				arg_165_1.text_.text = var_168_15

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_16 = 21
				local var_168_17 = utf8.len(var_168_15)
				local var_168_18 = var_168_16 <= 0 and var_168_13 or var_168_13 * (var_168_17 / var_168_16)

				if var_168_18 > 0 and var_168_13 < var_168_18 then
					arg_165_1.talkMaxDuration = var_168_18

					if var_168_18 + var_168_12 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_18 + var_168_12
					end
				end

				arg_165_1.text_.text = var_168_15
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_19 = math.max(var_168_13, arg_165_1.talkMaxDuration)

			if var_168_12 <= arg_165_1.time_ and arg_165_1.time_ < var_168_12 + var_168_19 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_12) / var_168_19

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_12 + var_168_19 and arg_165_1.time_ < var_168_12 + var_168_19 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play117122043 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 117122043
		arg_169_1.duration_ = 7

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play117122044(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = "TI0106"

			if arg_169_1.bgs_[var_172_0] == nil then
				local var_172_1 = Object.Instantiate(arg_169_1.paintGo_)

				var_172_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_172_0)
				var_172_1.name = var_172_0
				var_172_1.transform.parent = arg_169_1.stage_.transform
				var_172_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_169_1.bgs_[var_172_0] = var_172_1
			end

			local var_172_2 = 0

			if var_172_2 < arg_169_1.time_ and arg_169_1.time_ <= var_172_2 + arg_172_0 then
				local var_172_3 = manager.ui.mainCamera.transform.localPosition
				local var_172_4 = Vector3.New(0, 0, 10) + Vector3.New(var_172_3.x, var_172_3.y, 0)
				local var_172_5 = arg_169_1.bgs_.TI0106

				var_172_5.transform.localPosition = var_172_4
				var_172_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_172_6 = var_172_5:GetComponent("SpriteRenderer")

				if var_172_6 and var_172_6.sprite then
					local var_172_7 = (var_172_5.transform.localPosition - var_172_3).z
					local var_172_8 = manager.ui.mainCameraCom_
					local var_172_9 = 2 * var_172_7 * Mathf.Tan(var_172_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_172_10 = var_172_9 * var_172_8.aspect
					local var_172_11 = var_172_6.sprite.bounds.size.x
					local var_172_12 = var_172_6.sprite.bounds.size.y
					local var_172_13 = var_172_10 / var_172_11
					local var_172_14 = var_172_9 / var_172_12
					local var_172_15 = var_172_14 < var_172_13 and var_172_13 or var_172_14

					var_172_5.transform.localScale = Vector3.New(var_172_15, var_172_15, 0)
				end

				for iter_172_0, iter_172_1 in pairs(arg_169_1.bgs_) do
					if iter_172_0 ~= "TI0106" then
						iter_172_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_172_16 = 0

			if var_172_16 < arg_169_1.time_ and arg_169_1.time_ <= var_172_16 + arg_172_0 then
				arg_169_1.mask_.enabled = true
				arg_169_1.mask_.raycastTarget = true

				arg_169_1:SetGaussion(false)
			end

			local var_172_17 = 2

			if var_172_16 <= arg_169_1.time_ and arg_169_1.time_ < var_172_16 + var_172_17 then
				local var_172_18 = (arg_169_1.time_ - var_172_16) / var_172_17
				local var_172_19 = Color.New(1, 1, 1)

				var_172_19.a = Mathf.Lerp(1, 0, var_172_18)
				arg_169_1.mask_.color = var_172_19
			end

			if arg_169_1.time_ >= var_172_16 + var_172_17 and arg_169_1.time_ < var_172_16 + var_172_17 + arg_172_0 then
				local var_172_20 = Color.New(1, 1, 1)
				local var_172_21 = 0

				arg_169_1.mask_.enabled = false
				var_172_20.a = var_172_21
				arg_169_1.mask_.color = var_172_20
			end

			local var_172_22 = arg_169_1.bgs_.TI0106.transform
			local var_172_23 = 0

			if var_172_23 < arg_169_1.time_ and arg_169_1.time_ <= var_172_23 + arg_172_0 then
				arg_169_1.var_.moveOldPosTI0106 = var_172_22.localPosition
			end

			local var_172_24 = 0.001

			if var_172_23 <= arg_169_1.time_ and arg_169_1.time_ < var_172_23 + var_172_24 then
				local var_172_25 = (arg_169_1.time_ - var_172_23) / var_172_24
				local var_172_26 = Vector3.New(0, 2.5, 1)

				var_172_22.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPosTI0106, var_172_26, var_172_25)
			end

			if arg_169_1.time_ >= var_172_23 + var_172_24 and arg_169_1.time_ < var_172_23 + var_172_24 + arg_172_0 then
				var_172_22.localPosition = Vector3.New(0, 2.5, 1)
			end

			local var_172_27 = arg_169_1.bgs_.TI0106.transform
			local var_172_28 = 0.0333333333333332

			if var_172_28 < arg_169_1.time_ and arg_169_1.time_ <= var_172_28 + arg_172_0 then
				arg_169_1.var_.moveOldPosTI0106 = var_172_27.localPosition
			end

			local var_172_29 = 3.33333333333333

			if var_172_28 <= arg_169_1.time_ and arg_169_1.time_ < var_172_28 + var_172_29 then
				local var_172_30 = (arg_169_1.time_ - var_172_28) / var_172_29
				local var_172_31 = Vector3.New(0, 2.5, 2)

				var_172_27.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPosTI0106, var_172_31, var_172_30)
			end

			if arg_169_1.time_ >= var_172_28 + var_172_29 and arg_169_1.time_ < var_172_28 + var_172_29 + arg_172_0 then
				var_172_27.localPosition = Vector3.New(0, 2.5, 2)
			end

			if arg_169_1.frameCnt_ <= 1 then
				arg_169_1.dialog_:SetActive(false)
			end

			local var_172_32 = 2
			local var_172_33 = 1.35

			if var_172_32 < arg_169_1.time_ and arg_169_1.time_ <= var_172_32 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0

				arg_169_1.dialog_:SetActive(true)

				local var_172_34 = LeanTween.value(arg_169_1.dialog_, 0, 1, 0.3)

				var_172_34:setOnUpdate(LuaHelper.FloatAction(function(arg_173_0)
					arg_169_1.dialogCg_.alpha = arg_173_0
				end))
				var_172_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_169_1.dialog_)
					var_172_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_169_1.duration_ = arg_169_1.duration_ + 0.3

				SetActive(arg_169_1.leftNameGo_, false)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_35 = arg_169_1:GetWordFromCfg(117122043)
				local var_172_36 = arg_169_1:FormatText(var_172_35.content)

				arg_169_1.text_.text = var_172_36

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_37 = 50
				local var_172_38 = utf8.len(var_172_36)
				local var_172_39 = var_172_37 <= 0 and var_172_33 or var_172_33 * (var_172_38 / var_172_37)

				if var_172_39 > 0 and var_172_33 < var_172_39 then
					arg_169_1.talkMaxDuration = var_172_39
					var_172_32 = var_172_32 + 0.3

					if var_172_39 + var_172_32 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_39 + var_172_32
					end
				end

				arg_169_1.text_.text = var_172_36
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)
				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_40 = var_172_32 + 0.3
			local var_172_41 = math.max(var_172_33, arg_169_1.talkMaxDuration)

			if var_172_40 <= arg_169_1.time_ and arg_169_1.time_ < var_172_40 + var_172_41 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_40) / var_172_41

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_40 + var_172_41 and arg_169_1.time_ < var_172_40 + var_172_41 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play117122044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 117122044
		arg_175_1.duration_ = 1.466

		local var_175_0 = {
			zh = 1.466,
			ja = 1.033
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
				arg_175_0:Play117122045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 0.1

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_2 = arg_175_1:FormatText(StoryNameCfg[61].name)

				arg_175_1.leftNameTxt_.text = var_178_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_3 = arg_175_1:GetWordFromCfg(117122044)
				local var_178_4 = arg_175_1:FormatText(var_178_3.content)

				arg_175_1.text_.text = var_178_4

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_5 = 4
				local var_178_6 = utf8.len(var_178_4)
				local var_178_7 = var_178_5 <= 0 and var_178_1 or var_178_1 * (var_178_6 / var_178_5)

				if var_178_7 > 0 and var_178_1 < var_178_7 then
					arg_175_1.talkMaxDuration = var_178_7

					if var_178_7 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_7 + var_178_0
					end
				end

				arg_175_1.text_.text = var_178_4
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122044", "story_v_out_117122.awb") ~= 0 then
					local var_178_8 = manager.audio:GetVoiceLength("story_v_out_117122", "117122044", "story_v_out_117122.awb") / 1000

					if var_178_8 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_8 + var_178_0
					end

					if var_178_3.prefab_name ~= "" and arg_175_1.actors_[var_178_3.prefab_name] ~= nil then
						local var_178_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_3.prefab_name].transform, "story_v_out_117122", "117122044", "story_v_out_117122.awb")

						arg_175_1:RecordAudio("117122044", var_178_9)
						arg_175_1:RecordAudio("117122044", var_178_9)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_117122", "117122044", "story_v_out_117122.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_117122", "117122044", "story_v_out_117122.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_10 = math.max(var_178_1, arg_175_1.talkMaxDuration)

			if var_178_0 <= arg_175_1.time_ and arg_175_1.time_ < var_178_0 + var_178_10 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_0) / var_178_10

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_0 + var_178_10 and arg_175_1.time_ < var_178_0 + var_178_10 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play117122045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 117122045
		arg_179_1.duration_ = 5.033

		local var_179_0 = {
			zh = 5.033,
			ja = 3.433
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
				arg_179_0:Play117122046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 0.45

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_2 = arg_179_1:FormatText(StoryNameCfg[372].name)

				arg_179_1.leftNameTxt_.text = var_182_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_3 = arg_179_1:GetWordFromCfg(117122045)
				local var_182_4 = arg_179_1:FormatText(var_182_3.content)

				arg_179_1.text_.text = var_182_4

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122045", "story_v_out_117122.awb") ~= 0 then
					local var_182_8 = manager.audio:GetVoiceLength("story_v_out_117122", "117122045", "story_v_out_117122.awb") / 1000

					if var_182_8 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_0
					end

					if var_182_3.prefab_name ~= "" and arg_179_1.actors_[var_182_3.prefab_name] ~= nil then
						local var_182_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_3.prefab_name].transform, "story_v_out_117122", "117122045", "story_v_out_117122.awb")

						arg_179_1:RecordAudio("117122045", var_182_9)
						arg_179_1:RecordAudio("117122045", var_182_9)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_117122", "117122045", "story_v_out_117122.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_117122", "117122045", "story_v_out_117122.awb")
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
	Play117122046 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 117122046
		arg_183_1.duration_ = 1.4

		local var_183_0 = {
			zh = 1.133,
			ja = 1.4
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
				arg_183_0:Play117122047(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 0.075

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_2 = arg_183_1:FormatText(StoryNameCfg[61].name)

				arg_183_1.leftNameTxt_.text = var_186_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_3 = arg_183_1:GetWordFromCfg(117122046)
				local var_186_4 = arg_183_1:FormatText(var_186_3.content)

				arg_183_1.text_.text = var_186_4

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_5 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122046", "story_v_out_117122.awb") ~= 0 then
					local var_186_8 = manager.audio:GetVoiceLength("story_v_out_117122", "117122046", "story_v_out_117122.awb") / 1000

					if var_186_8 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_8 + var_186_0
					end

					if var_186_3.prefab_name ~= "" and arg_183_1.actors_[var_186_3.prefab_name] ~= nil then
						local var_186_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_3.prefab_name].transform, "story_v_out_117122", "117122046", "story_v_out_117122.awb")

						arg_183_1:RecordAudio("117122046", var_186_9)
						arg_183_1:RecordAudio("117122046", var_186_9)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_117122", "117122046", "story_v_out_117122.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_117122", "117122046", "story_v_out_117122.awb")
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
	Play117122047 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 117122047
		arg_187_1.duration_ = 4.833

		local var_187_0 = {
			zh = 4.166,
			ja = 4.833
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
				arg_187_0:Play117122048(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0
			local var_190_1 = 0.375

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_2 = arg_187_1:FormatText(StoryNameCfg[372].name)

				arg_187_1.leftNameTxt_.text = var_190_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_3 = arg_187_1:GetWordFromCfg(117122047)
				local var_190_4 = arg_187_1:FormatText(var_190_3.content)

				arg_187_1.text_.text = var_190_4

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122047", "story_v_out_117122.awb") ~= 0 then
					local var_190_8 = manager.audio:GetVoiceLength("story_v_out_117122", "117122047", "story_v_out_117122.awb") / 1000

					if var_190_8 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_8 + var_190_0
					end

					if var_190_3.prefab_name ~= "" and arg_187_1.actors_[var_190_3.prefab_name] ~= nil then
						local var_190_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_3.prefab_name].transform, "story_v_out_117122", "117122047", "story_v_out_117122.awb")

						arg_187_1:RecordAudio("117122047", var_190_9)
						arg_187_1:RecordAudio("117122047", var_190_9)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_117122", "117122047", "story_v_out_117122.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_117122", "117122047", "story_v_out_117122.awb")
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
	Play117122048 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 117122048
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play117122049(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0
			local var_194_1 = 0.05

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_2 = arg_191_1:FormatText(StoryNameCfg[61].name)

				arg_191_1.leftNameTxt_.text = var_194_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_3 = arg_191_1:GetWordFromCfg(117122048)
				local var_194_4 = arg_191_1:FormatText(var_194_3.content)

				arg_191_1.text_.text = var_194_4

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_5 = 2
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
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_8 = math.max(var_194_1, arg_191_1.talkMaxDuration)

			if var_194_0 <= arg_191_1.time_ and arg_191_1.time_ < var_194_0 + var_194_8 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_0) / var_194_8

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_0 + var_194_8 and arg_191_1.time_ < var_194_0 + var_194_8 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play117122049 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 117122049
		arg_195_1.duration_ = 5

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play117122050(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 1.2

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

				local var_198_2 = arg_195_1:GetWordFromCfg(117122049)
				local var_198_3 = arg_195_1:FormatText(var_198_2.content)

				arg_195_1.text_.text = var_198_3

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_4 = 48
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
	Play117122050 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 117122050
		arg_199_1.duration_ = 8.5

		local var_199_0 = {
			zh = 2.566,
			ja = 8.5
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
				arg_199_0:Play117122051(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 0.3

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_2 = arg_199_1:FormatText(StoryNameCfg[61].name)

				arg_199_1.leftNameTxt_.text = var_202_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_3 = arg_199_1:GetWordFromCfg(117122050)
				local var_202_4 = arg_199_1:FormatText(var_202_3.content)

				arg_199_1.text_.text = var_202_4

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122050", "story_v_out_117122.awb") ~= 0 then
					local var_202_8 = manager.audio:GetVoiceLength("story_v_out_117122", "117122050", "story_v_out_117122.awb") / 1000

					if var_202_8 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_8 + var_202_0
					end

					if var_202_3.prefab_name ~= "" and arg_199_1.actors_[var_202_3.prefab_name] ~= nil then
						local var_202_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_3.prefab_name].transform, "story_v_out_117122", "117122050", "story_v_out_117122.awb")

						arg_199_1:RecordAudio("117122050", var_202_9)
						arg_199_1:RecordAudio("117122050", var_202_9)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_117122", "117122050", "story_v_out_117122.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_117122", "117122050", "story_v_out_117122.awb")
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
	Play117122051 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 117122051
		arg_203_1.duration_ = 3

		local var_203_0 = {
			zh = 2.033,
			ja = 3
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
				arg_203_0:Play117122052(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0
			local var_206_1 = 0.225

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_2 = arg_203_1:FormatText(StoryNameCfg[61].name)

				arg_203_1.leftNameTxt_.text = var_206_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_3 = arg_203_1:GetWordFromCfg(117122051)
				local var_206_4 = arg_203_1:FormatText(var_206_3.content)

				arg_203_1.text_.text = var_206_4

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_5 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122051", "story_v_out_117122.awb") ~= 0 then
					local var_206_8 = manager.audio:GetVoiceLength("story_v_out_117122", "117122051", "story_v_out_117122.awb") / 1000

					if var_206_8 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_8 + var_206_0
					end

					if var_206_3.prefab_name ~= "" and arg_203_1.actors_[var_206_3.prefab_name] ~= nil then
						local var_206_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_3.prefab_name].transform, "story_v_out_117122", "117122051", "story_v_out_117122.awb")

						arg_203_1:RecordAudio("117122051", var_206_9)
						arg_203_1:RecordAudio("117122051", var_206_9)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_117122", "117122051", "story_v_out_117122.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_117122", "117122051", "story_v_out_117122.awb")
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
	Play117122052 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 117122052
		arg_207_1.duration_ = 4.6

		local var_207_0 = {
			zh = 4.6,
			ja = 4.366
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
				arg_207_0:Play117122053(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 0.3

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_2 = arg_207_1:FormatText(StoryNameCfg[61].name)

				arg_207_1.leftNameTxt_.text = var_210_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_3 = arg_207_1:GetWordFromCfg(117122052)
				local var_210_4 = arg_207_1:FormatText(var_210_3.content)

				arg_207_1.text_.text = var_210_4

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122052", "story_v_out_117122.awb") ~= 0 then
					local var_210_8 = manager.audio:GetVoiceLength("story_v_out_117122", "117122052", "story_v_out_117122.awb") / 1000

					if var_210_8 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_8 + var_210_0
					end

					if var_210_3.prefab_name ~= "" and arg_207_1.actors_[var_210_3.prefab_name] ~= nil then
						local var_210_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_3.prefab_name].transform, "story_v_out_117122", "117122052", "story_v_out_117122.awb")

						arg_207_1:RecordAudio("117122052", var_210_9)
						arg_207_1:RecordAudio("117122052", var_210_9)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_117122", "117122052", "story_v_out_117122.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_117122", "117122052", "story_v_out_117122.awb")
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
	Play117122053 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 117122053
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play117122054(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 0.9

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, false)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_2 = arg_211_1:GetWordFromCfg(117122053)
				local var_214_3 = arg_211_1:FormatText(var_214_2.content)

				arg_211_1.text_.text = var_214_3

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_4 = 36
				local var_214_5 = utf8.len(var_214_3)
				local var_214_6 = var_214_4 <= 0 and var_214_1 or var_214_1 * (var_214_5 / var_214_4)

				if var_214_6 > 0 and var_214_1 < var_214_6 then
					arg_211_1.talkMaxDuration = var_214_6

					if var_214_6 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_6 + var_214_0
					end
				end

				arg_211_1.text_.text = var_214_3
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_7 = math.max(var_214_1, arg_211_1.talkMaxDuration)

			if var_214_0 <= arg_211_1.time_ and arg_211_1.time_ < var_214_0 + var_214_7 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_0) / var_214_7

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_0 + var_214_7 and arg_211_1.time_ < var_214_0 + var_214_7 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play117122054 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 117122054
		arg_215_1.duration_ = 9.2

		local var_215_0 = {
			zh = 9.2,
			ja = 7.6
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
				arg_215_0:Play117122055(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.mask_.enabled = true
				arg_215_1.mask_.raycastTarget = true

				arg_215_1:SetGaussion(false)
			end

			local var_218_1 = 2

			if var_218_0 <= arg_215_1.time_ and arg_215_1.time_ < var_218_0 + var_218_1 then
				local var_218_2 = (arg_215_1.time_ - var_218_0) / var_218_1
				local var_218_3 = Color.New(0, 0, 0)

				var_218_3.a = Mathf.Lerp(0, 1, var_218_2)
				arg_215_1.mask_.color = var_218_3
			end

			if arg_215_1.time_ >= var_218_0 + var_218_1 and arg_215_1.time_ < var_218_0 + var_218_1 + arg_218_0 then
				local var_218_4 = Color.New(0, 0, 0)

				var_218_4.a = 1
				arg_215_1.mask_.color = var_218_4
			end

			local var_218_5 = 2

			if var_218_5 < arg_215_1.time_ and arg_215_1.time_ <= var_218_5 + arg_218_0 then
				arg_215_1.mask_.enabled = true
				arg_215_1.mask_.raycastTarget = true

				arg_215_1:SetGaussion(false)
			end

			local var_218_6 = 2

			if var_218_5 <= arg_215_1.time_ and arg_215_1.time_ < var_218_5 + var_218_6 then
				local var_218_7 = (arg_215_1.time_ - var_218_5) / var_218_6
				local var_218_8 = Color.New(0, 0, 0)

				var_218_8.a = Mathf.Lerp(1, 0, var_218_7)
				arg_215_1.mask_.color = var_218_8
			end

			if arg_215_1.time_ >= var_218_5 + var_218_6 and arg_215_1.time_ < var_218_5 + var_218_6 + arg_218_0 then
				local var_218_9 = Color.New(0, 0, 0)
				local var_218_10 = 0

				arg_215_1.mask_.enabled = false
				var_218_9.a = var_218_10
				arg_215_1.mask_.color = var_218_9
			end

			local var_218_11 = arg_215_1.bgs_.TI0106.transform
			local var_218_12 = 2

			if var_218_12 < arg_215_1.time_ and arg_215_1.time_ <= var_218_12 + arg_218_0 then
				arg_215_1.var_.moveOldPosTI0106 = var_218_11.localPosition
			end

			local var_218_13 = 0.001

			if var_218_12 <= arg_215_1.time_ and arg_215_1.time_ < var_218_12 + var_218_13 then
				local var_218_14 = (arg_215_1.time_ - var_218_12) / var_218_13
				local var_218_15 = Vector3.New(0, 1, 9)

				var_218_11.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPosTI0106, var_218_15, var_218_14)
			end

			if arg_215_1.time_ >= var_218_12 + var_218_13 and arg_215_1.time_ < var_218_12 + var_218_13 + arg_218_0 then
				var_218_11.localPosition = Vector3.New(0, 1, 9)
			end

			local var_218_16 = arg_215_1.bgs_.TI0106.transform
			local var_218_17 = 2.01666666666667

			if var_218_17 < arg_215_1.time_ and arg_215_1.time_ <= var_218_17 + arg_218_0 then
				arg_215_1.var_.moveOldPosTI0106 = var_218_16.localPosition
			end

			local var_218_18 = 3

			if var_218_17 <= arg_215_1.time_ and arg_215_1.time_ < var_218_17 + var_218_18 then
				local var_218_19 = (arg_215_1.time_ - var_218_17) / var_218_18
				local var_218_20 = Vector3.New(0, 1, 9.5)

				var_218_16.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPosTI0106, var_218_20, var_218_19)
			end

			if arg_215_1.time_ >= var_218_17 + var_218_18 and arg_215_1.time_ < var_218_17 + var_218_18 + arg_218_0 then
				var_218_16.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_218_21 = 4

			if var_218_21 < arg_215_1.time_ and arg_215_1.time_ <= var_218_21 + arg_218_0 then
				arg_215_1.allBtn_.enabled = false
			end

			local var_218_22 = 1.01666666666667

			if arg_215_1.time_ >= var_218_21 + var_218_22 and arg_215_1.time_ < var_218_21 + var_218_22 + arg_218_0 then
				arg_215_1.allBtn_.enabled = true
			end

			if arg_215_1.frameCnt_ <= 1 then
				arg_215_1.dialog_:SetActive(false)
			end

			local var_218_23 = 4
			local var_218_24 = 0.425

			if var_218_23 < arg_215_1.time_ and arg_215_1.time_ <= var_218_23 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0

				arg_215_1.dialog_:SetActive(true)

				local var_218_25 = LeanTween.value(arg_215_1.dialog_, 0, 1, 0.3)

				var_218_25:setOnUpdate(LuaHelper.FloatAction(function(arg_219_0)
					arg_215_1.dialogCg_.alpha = arg_219_0
				end))
				var_218_25:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_215_1.dialog_)
					var_218_25:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_215_1.duration_ = arg_215_1.duration_ + 0.3

				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_26 = arg_215_1:FormatText(StoryNameCfg[372].name)

				arg_215_1.leftNameTxt_.text = var_218_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_27 = arg_215_1:GetWordFromCfg(117122054)
				local var_218_28 = arg_215_1:FormatText(var_218_27.content)

				arg_215_1.text_.text = var_218_28

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_29 = 17
				local var_218_30 = utf8.len(var_218_28)
				local var_218_31 = var_218_29 <= 0 and var_218_24 or var_218_24 * (var_218_30 / var_218_29)

				if var_218_31 > 0 and var_218_24 < var_218_31 then
					arg_215_1.talkMaxDuration = var_218_31
					var_218_23 = var_218_23 + 0.3

					if var_218_31 + var_218_23 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_31 + var_218_23
					end
				end

				arg_215_1.text_.text = var_218_28
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122054", "story_v_out_117122.awb") ~= 0 then
					local var_218_32 = manager.audio:GetVoiceLength("story_v_out_117122", "117122054", "story_v_out_117122.awb") / 1000

					if var_218_32 + var_218_23 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_32 + var_218_23
					end

					if var_218_27.prefab_name ~= "" and arg_215_1.actors_[var_218_27.prefab_name] ~= nil then
						local var_218_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_27.prefab_name].transform, "story_v_out_117122", "117122054", "story_v_out_117122.awb")

						arg_215_1:RecordAudio("117122054", var_218_33)
						arg_215_1:RecordAudio("117122054", var_218_33)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_117122", "117122054", "story_v_out_117122.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_117122", "117122054", "story_v_out_117122.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_34 = var_218_23 + 0.3
			local var_218_35 = math.max(var_218_24, arg_215_1.talkMaxDuration)

			if var_218_34 <= arg_215_1.time_ and arg_215_1.time_ < var_218_34 + var_218_35 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_34) / var_218_35

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_34 + var_218_35 and arg_215_1.time_ < var_218_34 + var_218_35 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play117122055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 117122055
		arg_221_1.duration_ = 17.933

		local var_221_0 = {
			zh = 6.1,
			ja = 17.933
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
				arg_221_0:Play117122056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = 0
			local var_224_1 = 0.525

			if var_224_0 < arg_221_1.time_ and arg_221_1.time_ <= var_224_0 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_2 = arg_221_1:FormatText(StoryNameCfg[372].name)

				arg_221_1.leftNameTxt_.text = var_224_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_3 = arg_221_1:GetWordFromCfg(117122055)
				local var_224_4 = arg_221_1:FormatText(var_224_3.content)

				arg_221_1.text_.text = var_224_4

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_5 = 21
				local var_224_6 = utf8.len(var_224_4)
				local var_224_7 = var_224_5 <= 0 and var_224_1 or var_224_1 * (var_224_6 / var_224_5)

				if var_224_7 > 0 and var_224_1 < var_224_7 then
					arg_221_1.talkMaxDuration = var_224_7

					if var_224_7 + var_224_0 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_7 + var_224_0
					end
				end

				arg_221_1.text_.text = var_224_4
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122055", "story_v_out_117122.awb") ~= 0 then
					local var_224_8 = manager.audio:GetVoiceLength("story_v_out_117122", "117122055", "story_v_out_117122.awb") / 1000

					if var_224_8 + var_224_0 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_8 + var_224_0
					end

					if var_224_3.prefab_name ~= "" and arg_221_1.actors_[var_224_3.prefab_name] ~= nil then
						local var_224_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_3.prefab_name].transform, "story_v_out_117122", "117122055", "story_v_out_117122.awb")

						arg_221_1:RecordAudio("117122055", var_224_9)
						arg_221_1:RecordAudio("117122055", var_224_9)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_117122", "117122055", "story_v_out_117122.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_117122", "117122055", "story_v_out_117122.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_10 = math.max(var_224_1, arg_221_1.talkMaxDuration)

			if var_224_0 <= arg_221_1.time_ and arg_221_1.time_ < var_224_0 + var_224_10 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_0) / var_224_10

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_0 + var_224_10 and arg_221_1.time_ < var_224_0 + var_224_10 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play117122056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 117122056
		arg_225_1.duration_ = 5.733

		local var_225_0 = {
			zh = 2.966,
			ja = 5.733
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
				arg_225_0:Play117122057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0
			local var_228_1 = 0.15

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_2 = arg_225_1:FormatText(StoryNameCfg[61].name)

				arg_225_1.leftNameTxt_.text = var_228_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_3 = arg_225_1:GetWordFromCfg(117122056)
				local var_228_4 = arg_225_1:FormatText(var_228_3.content)

				arg_225_1.text_.text = var_228_4

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_5 = 6
				local var_228_6 = utf8.len(var_228_4)
				local var_228_7 = var_228_5 <= 0 and var_228_1 or var_228_1 * (var_228_6 / var_228_5)

				if var_228_7 > 0 and var_228_1 < var_228_7 then
					arg_225_1.talkMaxDuration = var_228_7

					if var_228_7 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_7 + var_228_0
					end
				end

				arg_225_1.text_.text = var_228_4
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122056", "story_v_out_117122.awb") ~= 0 then
					local var_228_8 = manager.audio:GetVoiceLength("story_v_out_117122", "117122056", "story_v_out_117122.awb") / 1000

					if var_228_8 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_8 + var_228_0
					end

					if var_228_3.prefab_name ~= "" and arg_225_1.actors_[var_228_3.prefab_name] ~= nil then
						local var_228_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_3.prefab_name].transform, "story_v_out_117122", "117122056", "story_v_out_117122.awb")

						arg_225_1:RecordAudio("117122056", var_228_9)
						arg_225_1:RecordAudio("117122056", var_228_9)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_117122", "117122056", "story_v_out_117122.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_117122", "117122056", "story_v_out_117122.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_10 = math.max(var_228_1, arg_225_1.talkMaxDuration)

			if var_228_0 <= arg_225_1.time_ and arg_225_1.time_ < var_228_0 + var_228_10 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_0) / var_228_10

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_0 + var_228_10 and arg_225_1.time_ < var_228_0 + var_228_10 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play117122057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 117122057
		arg_229_1.duration_ = 5

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play117122058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = 0
			local var_232_1 = 0.875

			if var_232_0 < arg_229_1.time_ and arg_229_1.time_ <= var_232_0 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, false)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_2 = arg_229_1:GetWordFromCfg(117122057)
				local var_232_3 = arg_229_1:FormatText(var_232_2.content)

				arg_229_1.text_.text = var_232_3

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_4 = 35
				local var_232_5 = utf8.len(var_232_3)
				local var_232_6 = var_232_4 <= 0 and var_232_1 or var_232_1 * (var_232_5 / var_232_4)

				if var_232_6 > 0 and var_232_1 < var_232_6 then
					arg_229_1.talkMaxDuration = var_232_6

					if var_232_6 + var_232_0 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_6 + var_232_0
					end
				end

				arg_229_1.text_.text = var_232_3
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)
				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_7 = math.max(var_232_1, arg_229_1.talkMaxDuration)

			if var_232_0 <= arg_229_1.time_ and arg_229_1.time_ < var_232_0 + var_232_7 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_0) / var_232_7

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_0 + var_232_7 and arg_229_1.time_ < var_232_0 + var_232_7 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play117122058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 117122058
		arg_233_1.duration_ = 9

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play117122059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 2

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				local var_236_1 = manager.ui.mainCamera.transform.localPosition
				local var_236_2 = Vector3.New(0, 0, 10) + Vector3.New(var_236_1.x, var_236_1.y, 0)
				local var_236_3 = arg_233_1.bgs_.I08a

				var_236_3.transform.localPosition = var_236_2
				var_236_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_236_4 = var_236_3:GetComponent("SpriteRenderer")

				if var_236_4 and var_236_4.sprite then
					local var_236_5 = (var_236_3.transform.localPosition - var_236_1).z
					local var_236_6 = manager.ui.mainCameraCom_
					local var_236_7 = 2 * var_236_5 * Mathf.Tan(var_236_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_236_8 = var_236_7 * var_236_6.aspect
					local var_236_9 = var_236_4.sprite.bounds.size.x
					local var_236_10 = var_236_4.sprite.bounds.size.y
					local var_236_11 = var_236_8 / var_236_9
					local var_236_12 = var_236_7 / var_236_10
					local var_236_13 = var_236_12 < var_236_11 and var_236_11 or var_236_12

					var_236_3.transform.localScale = Vector3.New(var_236_13, var_236_13, 0)
				end

				for iter_236_0, iter_236_1 in pairs(arg_233_1.bgs_) do
					if iter_236_0 ~= "I08a" then
						iter_236_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_236_14 = 0

			if var_236_14 < arg_233_1.time_ and arg_233_1.time_ <= var_236_14 + arg_236_0 then
				arg_233_1.mask_.enabled = true
				arg_233_1.mask_.raycastTarget = true

				arg_233_1:SetGaussion(false)
			end

			local var_236_15 = 2

			if var_236_14 <= arg_233_1.time_ and arg_233_1.time_ < var_236_14 + var_236_15 then
				local var_236_16 = (arg_233_1.time_ - var_236_14) / var_236_15
				local var_236_17 = Color.New(0, 0, 0)

				var_236_17.a = Mathf.Lerp(0, 1, var_236_16)
				arg_233_1.mask_.color = var_236_17
			end

			if arg_233_1.time_ >= var_236_14 + var_236_15 and arg_233_1.time_ < var_236_14 + var_236_15 + arg_236_0 then
				local var_236_18 = Color.New(0, 0, 0)

				var_236_18.a = 1
				arg_233_1.mask_.color = var_236_18
			end

			local var_236_19 = 2

			if var_236_19 < arg_233_1.time_ and arg_233_1.time_ <= var_236_19 + arg_236_0 then
				arg_233_1.mask_.enabled = true
				arg_233_1.mask_.raycastTarget = true

				arg_233_1:SetGaussion(false)
			end

			local var_236_20 = 2

			if var_236_19 <= arg_233_1.time_ and arg_233_1.time_ < var_236_19 + var_236_20 then
				local var_236_21 = (arg_233_1.time_ - var_236_19) / var_236_20
				local var_236_22 = Color.New(0, 0, 0)

				var_236_22.a = Mathf.Lerp(1, 0, var_236_21)
				arg_233_1.mask_.color = var_236_22
			end

			if arg_233_1.time_ >= var_236_19 + var_236_20 and arg_233_1.time_ < var_236_19 + var_236_20 + arg_236_0 then
				local var_236_23 = Color.New(0, 0, 0)
				local var_236_24 = 0

				arg_233_1.mask_.enabled = false
				var_236_23.a = var_236_24
				arg_233_1.mask_.color = var_236_23
			end

			if arg_233_1.frameCnt_ <= 1 then
				arg_233_1.dialog_:SetActive(false)
			end

			local var_236_25 = 4
			local var_236_26 = 0.8

			if var_236_25 < arg_233_1.time_ and arg_233_1.time_ <= var_236_25 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0

				arg_233_1.dialog_:SetActive(true)

				local var_236_27 = LeanTween.value(arg_233_1.dialog_, 0, 1, 0.3)

				var_236_27:setOnUpdate(LuaHelper.FloatAction(function(arg_237_0)
					arg_233_1.dialogCg_.alpha = arg_237_0
				end))
				var_236_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_233_1.dialog_)
					var_236_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_233_1.duration_ = arg_233_1.duration_ + 0.3

				SetActive(arg_233_1.leftNameGo_, false)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_28 = arg_233_1:GetWordFromCfg(117122058)
				local var_236_29 = arg_233_1:FormatText(var_236_28.content)

				arg_233_1.text_.text = var_236_29

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_30 = 32
				local var_236_31 = utf8.len(var_236_29)
				local var_236_32 = var_236_30 <= 0 and var_236_26 or var_236_26 * (var_236_31 / var_236_30)

				if var_236_32 > 0 and var_236_26 < var_236_32 then
					arg_233_1.talkMaxDuration = var_236_32
					var_236_25 = var_236_25 + 0.3

					if var_236_32 + var_236_25 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_32 + var_236_25
					end
				end

				arg_233_1.text_.text = var_236_29
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)
				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_33 = var_236_25 + 0.3
			local var_236_34 = math.max(var_236_26, arg_233_1.talkMaxDuration)

			if var_236_33 <= arg_233_1.time_ and arg_233_1.time_ < var_236_33 + var_236_34 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_33) / var_236_34

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_33 + var_236_34 and arg_233_1.time_ < var_236_33 + var_236_34 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play117122059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 117122059
		arg_239_1.duration_ = 5.833

		local var_239_0 = {
			zh = 4.866,
			ja = 5.833
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
				arg_239_0:Play117122060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1033"].transform
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.var_.moveOldPos1033 = var_242_0.localPosition
				var_242_0.localScale = Vector3.New(1, 1, 1)

				arg_239_1:CheckSpriteTmpPos("1033", 3)

				local var_242_2 = var_242_0.childCount

				for iter_242_0 = 0, var_242_2 - 1 do
					local var_242_3 = var_242_0:GetChild(iter_242_0)

					if var_242_3.name == "split_6" or not string.find(var_242_3.name, "split") then
						var_242_3.gameObject:SetActive(true)
					else
						var_242_3.gameObject:SetActive(false)
					end
				end
			end

			local var_242_4 = 0.001

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_4 then
				local var_242_5 = (arg_239_1.time_ - var_242_1) / var_242_4
				local var_242_6 = Vector3.New(0, -420, 0)

				var_242_0.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1033, var_242_6, var_242_5)
			end

			if arg_239_1.time_ >= var_242_1 + var_242_4 and arg_239_1.time_ < var_242_1 + var_242_4 + arg_242_0 then
				var_242_0.localPosition = Vector3.New(0, -420, 0)
			end

			local var_242_7 = arg_239_1.actors_["1033"]
			local var_242_8 = 0

			if var_242_8 < arg_239_1.time_ and arg_239_1.time_ <= var_242_8 + arg_242_0 and arg_239_1.var_.actorSpriteComps1033 == nil then
				arg_239_1.var_.actorSpriteComps1033 = var_242_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_242_9 = 0.2

			if var_242_8 <= arg_239_1.time_ and arg_239_1.time_ < var_242_8 + var_242_9 then
				local var_242_10 = (arg_239_1.time_ - var_242_8) / var_242_9

				if arg_239_1.var_.actorSpriteComps1033 then
					for iter_242_1, iter_242_2 in pairs(arg_239_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_242_2 then
							local var_242_11 = Mathf.Lerp(iter_242_2.color.r, 1, var_242_10)

							iter_242_2.color = Color.New(var_242_11, var_242_11, var_242_11)
						end
					end
				end
			end

			if arg_239_1.time_ >= var_242_8 + var_242_9 and arg_239_1.time_ < var_242_8 + var_242_9 + arg_242_0 and arg_239_1.var_.actorSpriteComps1033 then
				local var_242_12 = 1

				for iter_242_3, iter_242_4 in pairs(arg_239_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_242_4 then
						iter_242_4.color = Color.New(var_242_12, var_242_12, var_242_12)
					end
				end

				arg_239_1.var_.actorSpriteComps1033 = nil
			end

			local var_242_13 = arg_239_1.actors_["1033"]
			local var_242_14 = 0

			if var_242_14 < arg_239_1.time_ and arg_239_1.time_ <= var_242_14 + arg_242_0 then
				local var_242_15 = var_242_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_242_15 then
					arg_239_1.var_.alphaOldValue1033 = var_242_15.alpha
					arg_239_1.var_.characterEffect1033 = var_242_15
				end

				arg_239_1.var_.alphaOldValue1033 = 0
			end

			local var_242_16 = 0.333333333333333

			if var_242_14 <= arg_239_1.time_ and arg_239_1.time_ < var_242_14 + var_242_16 then
				local var_242_17 = (arg_239_1.time_ - var_242_14) / var_242_16
				local var_242_18 = Mathf.Lerp(arg_239_1.var_.alphaOldValue1033, 1, var_242_17)

				if arg_239_1.var_.characterEffect1033 then
					arg_239_1.var_.characterEffect1033.alpha = var_242_18
				end
			end

			if arg_239_1.time_ >= var_242_14 + var_242_16 and arg_239_1.time_ < var_242_14 + var_242_16 + arg_242_0 and arg_239_1.var_.characterEffect1033 then
				arg_239_1.var_.characterEffect1033.alpha = 1
			end

			local var_242_19 = 0
			local var_242_20 = 0.375

			if var_242_19 < arg_239_1.time_ and arg_239_1.time_ <= var_242_19 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_21 = arg_239_1:FormatText(StoryNameCfg[236].name)

				arg_239_1.leftNameTxt_.text = var_242_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_22 = arg_239_1:GetWordFromCfg(117122059)
				local var_242_23 = arg_239_1:FormatText(var_242_22.content)

				arg_239_1.text_.text = var_242_23

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_24 = 15
				local var_242_25 = utf8.len(var_242_23)
				local var_242_26 = var_242_24 <= 0 and var_242_20 or var_242_20 * (var_242_25 / var_242_24)

				if var_242_26 > 0 and var_242_20 < var_242_26 then
					arg_239_1.talkMaxDuration = var_242_26

					if var_242_26 + var_242_19 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_26 + var_242_19
					end
				end

				arg_239_1.text_.text = var_242_23
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122059", "story_v_out_117122.awb") ~= 0 then
					local var_242_27 = manager.audio:GetVoiceLength("story_v_out_117122", "117122059", "story_v_out_117122.awb") / 1000

					if var_242_27 + var_242_19 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_27 + var_242_19
					end

					if var_242_22.prefab_name ~= "" and arg_239_1.actors_[var_242_22.prefab_name] ~= nil then
						local var_242_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_22.prefab_name].transform, "story_v_out_117122", "117122059", "story_v_out_117122.awb")

						arg_239_1:RecordAudio("117122059", var_242_28)
						arg_239_1:RecordAudio("117122059", var_242_28)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_117122", "117122059", "story_v_out_117122.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_117122", "117122059", "story_v_out_117122.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_29 = math.max(var_242_20, arg_239_1.talkMaxDuration)

			if var_242_19 <= arg_239_1.time_ and arg_239_1.time_ < var_242_19 + var_242_29 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_19) / var_242_29

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_19 + var_242_29 and arg_239_1.time_ < var_242_19 + var_242_29 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play117122060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 117122060
		arg_243_1.duration_ = 5

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play117122061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1033"]
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 then
				local var_246_2 = var_246_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_246_2 then
					arg_243_1.var_.alphaOldValue1033 = var_246_2.alpha
					arg_243_1.var_.characterEffect1033 = var_246_2
				end

				arg_243_1.var_.alphaOldValue1033 = 1
			end

			local var_246_3 = 0.5

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_3 then
				local var_246_4 = (arg_243_1.time_ - var_246_1) / var_246_3
				local var_246_5 = Mathf.Lerp(arg_243_1.var_.alphaOldValue1033, 0, var_246_4)

				if arg_243_1.var_.characterEffect1033 then
					arg_243_1.var_.characterEffect1033.alpha = var_246_5
				end
			end

			if arg_243_1.time_ >= var_246_1 + var_246_3 and arg_243_1.time_ < var_246_1 + var_246_3 + arg_246_0 and arg_243_1.var_.characterEffect1033 then
				arg_243_1.var_.characterEffect1033.alpha = 0
			end

			local var_246_6 = 0
			local var_246_7 = 0.925

			if var_246_6 < arg_243_1.time_ and arg_243_1.time_ <= var_246_6 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, false)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_8 = arg_243_1:GetWordFromCfg(117122060)
				local var_246_9 = arg_243_1:FormatText(var_246_8.content)

				arg_243_1.text_.text = var_246_9

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_10 = 37
				local var_246_11 = utf8.len(var_246_9)
				local var_246_12 = var_246_10 <= 0 and var_246_7 or var_246_7 * (var_246_11 / var_246_10)

				if var_246_12 > 0 and var_246_7 < var_246_12 then
					arg_243_1.talkMaxDuration = var_246_12

					if var_246_12 + var_246_6 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_12 + var_246_6
					end
				end

				arg_243_1.text_.text = var_246_9
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)
				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_13 = math.max(var_246_7, arg_243_1.talkMaxDuration)

			if var_246_6 <= arg_243_1.time_ and arg_243_1.time_ < var_246_6 + var_246_13 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_6) / var_246_13

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_6 + var_246_13 and arg_243_1.time_ < var_246_6 + var_246_13 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play117122061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 117122061
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play117122062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = 0
			local var_250_1 = 1.025

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

				local var_250_2 = arg_247_1:GetWordFromCfg(117122061)
				local var_250_3 = arg_247_1:FormatText(var_250_2.content)

				arg_247_1.text_.text = var_250_3

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_4 = 41
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
	Play117122062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 117122062
		arg_251_1.duration_ = 6.1

		local var_251_0 = {
			zh = 6.1,
			ja = 2.466
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
				arg_251_0:Play117122063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1132"].transform
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 then
				arg_251_1.var_.moveOldPos1132 = var_254_0.localPosition
				var_254_0.localScale = Vector3.New(1, 1, 1)

				arg_251_1:CheckSpriteTmpPos("1132", 2)

				local var_254_2 = var_254_0.childCount

				for iter_254_0 = 0, var_254_2 - 1 do
					local var_254_3 = var_254_0:GetChild(iter_254_0)

					if var_254_3.name == "split_6" or not string.find(var_254_3.name, "split") then
						var_254_3.gameObject:SetActive(true)
					else
						var_254_3.gameObject:SetActive(false)
					end
				end
			end

			local var_254_4 = 0.001

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_4 then
				local var_254_5 = (arg_251_1.time_ - var_254_1) / var_254_4
				local var_254_6 = Vector3.New(-390, -413, -185)

				var_254_0.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1132, var_254_6, var_254_5)
			end

			if arg_251_1.time_ >= var_254_1 + var_254_4 and arg_251_1.time_ < var_254_1 + var_254_4 + arg_254_0 then
				var_254_0.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_254_7 = arg_251_1.actors_["1132"]
			local var_254_8 = 0

			if var_254_8 < arg_251_1.time_ and arg_251_1.time_ <= var_254_8 + arg_254_0 and arg_251_1.var_.actorSpriteComps1132 == nil then
				arg_251_1.var_.actorSpriteComps1132 = var_254_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_9 = 0.2

			if var_254_8 <= arg_251_1.time_ and arg_251_1.time_ < var_254_8 + var_254_9 then
				local var_254_10 = (arg_251_1.time_ - var_254_8) / var_254_9

				if arg_251_1.var_.actorSpriteComps1132 then
					for iter_254_1, iter_254_2 in pairs(arg_251_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_254_2 then
							local var_254_11 = Mathf.Lerp(iter_254_2.color.r, 1, var_254_10)

							iter_254_2.color = Color.New(var_254_11, var_254_11, var_254_11)
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_8 + var_254_9 and arg_251_1.time_ < var_254_8 + var_254_9 + arg_254_0 and arg_251_1.var_.actorSpriteComps1132 then
				local var_254_12 = 1

				for iter_254_3, iter_254_4 in pairs(arg_251_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_254_4 then
						iter_254_4.color = Color.New(var_254_12, var_254_12, var_254_12)
					end
				end

				arg_251_1.var_.actorSpriteComps1132 = nil
			end

			local var_254_13 = arg_251_1.actors_["1132"]
			local var_254_14 = 0

			if var_254_14 < arg_251_1.time_ and arg_251_1.time_ <= var_254_14 + arg_254_0 then
				local var_254_15 = var_254_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_254_15 then
					arg_251_1.var_.alphaOldValue1132 = var_254_15.alpha
					arg_251_1.var_.characterEffect1132 = var_254_15
				end

				arg_251_1.var_.alphaOldValue1132 = 0
			end

			local var_254_16 = 0.5

			if var_254_14 <= arg_251_1.time_ and arg_251_1.time_ < var_254_14 + var_254_16 then
				local var_254_17 = (arg_251_1.time_ - var_254_14) / var_254_16
				local var_254_18 = Mathf.Lerp(arg_251_1.var_.alphaOldValue1132, 1, var_254_17)

				if arg_251_1.var_.characterEffect1132 then
					arg_251_1.var_.characterEffect1132.alpha = var_254_18
				end
			end

			if arg_251_1.time_ >= var_254_14 + var_254_16 and arg_251_1.time_ < var_254_14 + var_254_16 + arg_254_0 and arg_251_1.var_.characterEffect1132 then
				arg_251_1.var_.characterEffect1132.alpha = 1
			end

			local var_254_19 = 0
			local var_254_20 = 0.525

			if var_254_19 < arg_251_1.time_ and arg_251_1.time_ <= var_254_19 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_21 = arg_251_1:FormatText(StoryNameCfg[61].name)

				arg_251_1.leftNameTxt_.text = var_254_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_22 = arg_251_1:GetWordFromCfg(117122062)
				local var_254_23 = arg_251_1:FormatText(var_254_22.content)

				arg_251_1.text_.text = var_254_23

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_24 = 21
				local var_254_25 = utf8.len(var_254_23)
				local var_254_26 = var_254_24 <= 0 and var_254_20 or var_254_20 * (var_254_25 / var_254_24)

				if var_254_26 > 0 and var_254_20 < var_254_26 then
					arg_251_1.talkMaxDuration = var_254_26

					if var_254_26 + var_254_19 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_26 + var_254_19
					end
				end

				arg_251_1.text_.text = var_254_23
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122062", "story_v_out_117122.awb") ~= 0 then
					local var_254_27 = manager.audio:GetVoiceLength("story_v_out_117122", "117122062", "story_v_out_117122.awb") / 1000

					if var_254_27 + var_254_19 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_27 + var_254_19
					end

					if var_254_22.prefab_name ~= "" and arg_251_1.actors_[var_254_22.prefab_name] ~= nil then
						local var_254_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_22.prefab_name].transform, "story_v_out_117122", "117122062", "story_v_out_117122.awb")

						arg_251_1:RecordAudio("117122062", var_254_28)
						arg_251_1:RecordAudio("117122062", var_254_28)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_117122", "117122062", "story_v_out_117122.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_117122", "117122062", "story_v_out_117122.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_29 = math.max(var_254_20, arg_251_1.talkMaxDuration)

			if var_254_19 <= arg_251_1.time_ and arg_251_1.time_ < var_254_19 + var_254_29 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_19) / var_254_29

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_19 + var_254_29 and arg_251_1.time_ < var_254_19 + var_254_29 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play117122063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 117122063
		arg_255_1.duration_ = 2.1

		local var_255_0 = {
			zh = 2.1,
			ja = 1.366
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
				arg_255_0:Play117122064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["10035"].transform
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 then
				arg_255_1.var_.moveOldPos10035 = var_258_0.localPosition
				var_258_0.localScale = Vector3.New(1, 1, 1)

				arg_255_1:CheckSpriteTmpPos("10035", 4)

				local var_258_2 = var_258_0.childCount

				for iter_258_0 = 0, var_258_2 - 1 do
					local var_258_3 = var_258_0:GetChild(iter_258_0)

					if var_258_3.name == "split_4" or not string.find(var_258_3.name, "split") then
						var_258_3.gameObject:SetActive(true)
					else
						var_258_3.gameObject:SetActive(false)
					end
				end
			end

			local var_258_4 = 0.001

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_4 then
				local var_258_5 = (arg_255_1.time_ - var_258_1) / var_258_4
				local var_258_6 = Vector3.New(390, -410, -235)

				var_258_0.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos10035, var_258_6, var_258_5)
			end

			if arg_255_1.time_ >= var_258_1 + var_258_4 and arg_255_1.time_ < var_258_1 + var_258_4 + arg_258_0 then
				var_258_0.localPosition = Vector3.New(390, -410, -235)
			end

			local var_258_7 = arg_255_1.actors_["1132"]
			local var_258_8 = 0

			if var_258_8 < arg_255_1.time_ and arg_255_1.time_ <= var_258_8 + arg_258_0 and arg_255_1.var_.actorSpriteComps1132 == nil then
				arg_255_1.var_.actorSpriteComps1132 = var_258_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_258_9 = 0.2

			if var_258_8 <= arg_255_1.time_ and arg_255_1.time_ < var_258_8 + var_258_9 then
				local var_258_10 = (arg_255_1.time_ - var_258_8) / var_258_9

				if arg_255_1.var_.actorSpriteComps1132 then
					for iter_258_1, iter_258_2 in pairs(arg_255_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_258_2 then
							local var_258_11 = Mathf.Lerp(iter_258_2.color.r, 0.5, var_258_10)

							iter_258_2.color = Color.New(var_258_11, var_258_11, var_258_11)
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_8 + var_258_9 and arg_255_1.time_ < var_258_8 + var_258_9 + arg_258_0 and arg_255_1.var_.actorSpriteComps1132 then
				local var_258_12 = 0.5

				for iter_258_3, iter_258_4 in pairs(arg_255_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_258_4 then
						iter_258_4.color = Color.New(var_258_12, var_258_12, var_258_12)
					end
				end

				arg_255_1.var_.actorSpriteComps1132 = nil
			end

			local var_258_13 = arg_255_1.actors_["10035"]
			local var_258_14 = 0

			if var_258_14 < arg_255_1.time_ and arg_255_1.time_ <= var_258_14 + arg_258_0 and arg_255_1.var_.actorSpriteComps10035 == nil then
				arg_255_1.var_.actorSpriteComps10035 = var_258_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_258_15 = 0.2

			if var_258_14 <= arg_255_1.time_ and arg_255_1.time_ < var_258_14 + var_258_15 then
				local var_258_16 = (arg_255_1.time_ - var_258_14) / var_258_15

				if arg_255_1.var_.actorSpriteComps10035 then
					for iter_258_5, iter_258_6 in pairs(arg_255_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_258_6 then
							local var_258_17 = Mathf.Lerp(iter_258_6.color.r, 1, var_258_16)

							iter_258_6.color = Color.New(var_258_17, var_258_17, var_258_17)
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_14 + var_258_15 and arg_255_1.time_ < var_258_14 + var_258_15 + arg_258_0 and arg_255_1.var_.actorSpriteComps10035 then
				local var_258_18 = 1

				for iter_258_7, iter_258_8 in pairs(arg_255_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_258_8 then
						iter_258_8.color = Color.New(var_258_18, var_258_18, var_258_18)
					end
				end

				arg_255_1.var_.actorSpriteComps10035 = nil
			end

			local var_258_19 = arg_255_1.actors_["10035"]
			local var_258_20 = 0

			if var_258_20 < arg_255_1.time_ and arg_255_1.time_ <= var_258_20 + arg_258_0 then
				local var_258_21 = var_258_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_258_21 then
					arg_255_1.var_.alphaOldValue10035 = var_258_21.alpha
					arg_255_1.var_.characterEffect10035 = var_258_21
				end

				arg_255_1.var_.alphaOldValue10035 = 0
			end

			local var_258_22 = 0.5

			if var_258_20 <= arg_255_1.time_ and arg_255_1.time_ < var_258_20 + var_258_22 then
				local var_258_23 = (arg_255_1.time_ - var_258_20) / var_258_22
				local var_258_24 = Mathf.Lerp(arg_255_1.var_.alphaOldValue10035, 1, var_258_23)

				if arg_255_1.var_.characterEffect10035 then
					arg_255_1.var_.characterEffect10035.alpha = var_258_24
				end
			end

			if arg_255_1.time_ >= var_258_20 + var_258_22 and arg_255_1.time_ < var_258_20 + var_258_22 + arg_258_0 and arg_255_1.var_.characterEffect10035 then
				arg_255_1.var_.characterEffect10035.alpha = 1
			end

			local var_258_25 = 0
			local var_258_26 = 0.1

			if var_258_25 < arg_255_1.time_ and arg_255_1.time_ <= var_258_25 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_27 = arg_255_1:FormatText(StoryNameCfg[369].name)

				arg_255_1.leftNameTxt_.text = var_258_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_28 = arg_255_1:GetWordFromCfg(117122063)
				local var_258_29 = arg_255_1:FormatText(var_258_28.content)

				arg_255_1.text_.text = var_258_29

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_30 = 4
				local var_258_31 = utf8.len(var_258_29)
				local var_258_32 = var_258_30 <= 0 and var_258_26 or var_258_26 * (var_258_31 / var_258_30)

				if var_258_32 > 0 and var_258_26 < var_258_32 then
					arg_255_1.talkMaxDuration = var_258_32

					if var_258_32 + var_258_25 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_32 + var_258_25
					end
				end

				arg_255_1.text_.text = var_258_29
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122063", "story_v_out_117122.awb") ~= 0 then
					local var_258_33 = manager.audio:GetVoiceLength("story_v_out_117122", "117122063", "story_v_out_117122.awb") / 1000

					if var_258_33 + var_258_25 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_33 + var_258_25
					end

					if var_258_28.prefab_name ~= "" and arg_255_1.actors_[var_258_28.prefab_name] ~= nil then
						local var_258_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_28.prefab_name].transform, "story_v_out_117122", "117122063", "story_v_out_117122.awb")

						arg_255_1:RecordAudio("117122063", var_258_34)
						arg_255_1:RecordAudio("117122063", var_258_34)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_117122", "117122063", "story_v_out_117122.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_117122", "117122063", "story_v_out_117122.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_35 = math.max(var_258_26, arg_255_1.talkMaxDuration)

			if var_258_25 <= arg_255_1.time_ and arg_255_1.time_ < var_258_25 + var_258_35 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_25) / var_258_35

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_25 + var_258_35 and arg_255_1.time_ < var_258_25 + var_258_35 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play117122064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 117122064
		arg_259_1.duration_ = 5.033

		local var_259_0 = {
			zh = 3.5,
			ja = 5.033
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
				arg_259_0:Play117122065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["10035"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos10035 = var_262_0.localPosition
				var_262_0.localScale = Vector3.New(1, 1, 1)

				arg_259_1:CheckSpriteTmpPos("10035", 4)

				local var_262_2 = var_262_0.childCount

				for iter_262_0 = 0, var_262_2 - 1 do
					local var_262_3 = var_262_0:GetChild(iter_262_0)

					if var_262_3.name == "split_4" or not string.find(var_262_3.name, "split") then
						var_262_3.gameObject:SetActive(true)
					else
						var_262_3.gameObject:SetActive(false)
					end
				end
			end

			local var_262_4 = 0.001

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_4 then
				local var_262_5 = (arg_259_1.time_ - var_262_1) / var_262_4
				local var_262_6 = Vector3.New(390, -410, -235)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos10035, var_262_6, var_262_5)
			end

			if arg_259_1.time_ >= var_262_1 + var_262_4 and arg_259_1.time_ < var_262_1 + var_262_4 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(390, -410, -235)
			end

			local var_262_7 = arg_259_1.actors_["1132"].transform
			local var_262_8 = 0

			if var_262_8 < arg_259_1.time_ and arg_259_1.time_ <= var_262_8 + arg_262_0 then
				arg_259_1.var_.moveOldPos1132 = var_262_7.localPosition
				var_262_7.localScale = Vector3.New(1, 1, 1)

				arg_259_1:CheckSpriteTmpPos("1132", 2)

				local var_262_9 = var_262_7.childCount

				for iter_262_1 = 0, var_262_9 - 1 do
					local var_262_10 = var_262_7:GetChild(iter_262_1)

					if var_262_10.name == "split_1" or not string.find(var_262_10.name, "split") then
						var_262_10.gameObject:SetActive(true)
					else
						var_262_10.gameObject:SetActive(false)
					end
				end
			end

			local var_262_11 = 0.001

			if var_262_8 <= arg_259_1.time_ and arg_259_1.time_ < var_262_8 + var_262_11 then
				local var_262_12 = (arg_259_1.time_ - var_262_8) / var_262_11
				local var_262_13 = Vector3.New(-390, -413, -185)

				var_262_7.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1132, var_262_13, var_262_12)
			end

			if arg_259_1.time_ >= var_262_8 + var_262_11 and arg_259_1.time_ < var_262_8 + var_262_11 + arg_262_0 then
				var_262_7.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_262_14 = arg_259_1.actors_["1132"]
			local var_262_15 = 0

			if var_262_15 < arg_259_1.time_ and arg_259_1.time_ <= var_262_15 + arg_262_0 and arg_259_1.var_.actorSpriteComps1132 == nil then
				arg_259_1.var_.actorSpriteComps1132 = var_262_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_16 = 0.2

			if var_262_15 <= arg_259_1.time_ and arg_259_1.time_ < var_262_15 + var_262_16 then
				local var_262_17 = (arg_259_1.time_ - var_262_15) / var_262_16

				if arg_259_1.var_.actorSpriteComps1132 then
					for iter_262_2, iter_262_3 in pairs(arg_259_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_262_3 then
							local var_262_18 = Mathf.Lerp(iter_262_3.color.r, 1, var_262_17)

							iter_262_3.color = Color.New(var_262_18, var_262_18, var_262_18)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_15 + var_262_16 and arg_259_1.time_ < var_262_15 + var_262_16 + arg_262_0 and arg_259_1.var_.actorSpriteComps1132 then
				local var_262_19 = 1

				for iter_262_4, iter_262_5 in pairs(arg_259_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_262_5 then
						iter_262_5.color = Color.New(var_262_19, var_262_19, var_262_19)
					end
				end

				arg_259_1.var_.actorSpriteComps1132 = nil
			end

			local var_262_20 = arg_259_1.actors_["10035"]
			local var_262_21 = 0

			if var_262_21 < arg_259_1.time_ and arg_259_1.time_ <= var_262_21 + arg_262_0 and arg_259_1.var_.actorSpriteComps10035 == nil then
				arg_259_1.var_.actorSpriteComps10035 = var_262_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_22 = 0.2

			if var_262_21 <= arg_259_1.time_ and arg_259_1.time_ < var_262_21 + var_262_22 then
				local var_262_23 = (arg_259_1.time_ - var_262_21) / var_262_22

				if arg_259_1.var_.actorSpriteComps10035 then
					for iter_262_6, iter_262_7 in pairs(arg_259_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_262_7 then
							local var_262_24 = Mathf.Lerp(iter_262_7.color.r, 0.5, var_262_23)

							iter_262_7.color = Color.New(var_262_24, var_262_24, var_262_24)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_21 + var_262_22 and arg_259_1.time_ < var_262_21 + var_262_22 + arg_262_0 and arg_259_1.var_.actorSpriteComps10035 then
				local var_262_25 = 0.5

				for iter_262_8, iter_262_9 in pairs(arg_259_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_262_9 then
						iter_262_9.color = Color.New(var_262_25, var_262_25, var_262_25)
					end
				end

				arg_259_1.var_.actorSpriteComps10035 = nil
			end

			local var_262_26 = arg_259_1.actors_["1132"]
			local var_262_27 = 0

			if var_262_27 < arg_259_1.time_ and arg_259_1.time_ <= var_262_27 + arg_262_0 then
				local var_262_28 = var_262_26:GetComponentInChildren(typeof(CanvasGroup))

				if var_262_28 then
					arg_259_1.var_.alphaOldValue1132 = var_262_28.alpha
					arg_259_1.var_.characterEffect1132 = var_262_28
				end

				arg_259_1.var_.alphaOldValue1132 = 0
			end

			local var_262_29 = 0.0166666666666667

			if var_262_27 <= arg_259_1.time_ and arg_259_1.time_ < var_262_27 + var_262_29 then
				local var_262_30 = (arg_259_1.time_ - var_262_27) / var_262_29
				local var_262_31 = Mathf.Lerp(arg_259_1.var_.alphaOldValue1132, 1, var_262_30)

				if arg_259_1.var_.characterEffect1132 then
					arg_259_1.var_.characterEffect1132.alpha = var_262_31
				end
			end

			if arg_259_1.time_ >= var_262_27 + var_262_29 and arg_259_1.time_ < var_262_27 + var_262_29 + arg_262_0 and arg_259_1.var_.characterEffect1132 then
				arg_259_1.var_.characterEffect1132.alpha = 1
			end

			local var_262_32 = 0
			local var_262_33 = 0.25

			if var_262_32 < arg_259_1.time_ and arg_259_1.time_ <= var_262_32 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_34 = arg_259_1:FormatText(StoryNameCfg[61].name)

				arg_259_1.leftNameTxt_.text = var_262_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_35 = arg_259_1:GetWordFromCfg(117122064)
				local var_262_36 = arg_259_1:FormatText(var_262_35.content)

				arg_259_1.text_.text = var_262_36

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_37 = 10
				local var_262_38 = utf8.len(var_262_36)
				local var_262_39 = var_262_37 <= 0 and var_262_33 or var_262_33 * (var_262_38 / var_262_37)

				if var_262_39 > 0 and var_262_33 < var_262_39 then
					arg_259_1.talkMaxDuration = var_262_39

					if var_262_39 + var_262_32 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_39 + var_262_32
					end
				end

				arg_259_1.text_.text = var_262_36
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122064", "story_v_out_117122.awb") ~= 0 then
					local var_262_40 = manager.audio:GetVoiceLength("story_v_out_117122", "117122064", "story_v_out_117122.awb") / 1000

					if var_262_40 + var_262_32 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_40 + var_262_32
					end

					if var_262_35.prefab_name ~= "" and arg_259_1.actors_[var_262_35.prefab_name] ~= nil then
						local var_262_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_35.prefab_name].transform, "story_v_out_117122", "117122064", "story_v_out_117122.awb")

						arg_259_1:RecordAudio("117122064", var_262_41)
						arg_259_1:RecordAudio("117122064", var_262_41)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_117122", "117122064", "story_v_out_117122.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_117122", "117122064", "story_v_out_117122.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_42 = math.max(var_262_33, arg_259_1.talkMaxDuration)

			if var_262_32 <= arg_259_1.time_ and arg_259_1.time_ < var_262_32 + var_262_42 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_32) / var_262_42

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_32 + var_262_42 and arg_259_1.time_ < var_262_32 + var_262_42 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play117122065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 117122065
		arg_263_1.duration_ = 2.7

		local var_263_0 = {
			zh = 0.999999999999,
			ja = 2.7
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
			arg_263_1.auto_ = false
		end

		function arg_263_1.playNext_(arg_265_0)
			arg_263_1.onStoryFinished_()
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["10035"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos10035 = var_266_0.localPosition
				var_266_0.localScale = Vector3.New(1, 1, 1)

				arg_263_1:CheckSpriteTmpPos("10035", 4)

				local var_266_2 = var_266_0.childCount

				for iter_266_0 = 0, var_266_2 - 1 do
					local var_266_3 = var_266_0:GetChild(iter_266_0)

					if var_266_3.name == "split_2" or not string.find(var_266_3.name, "split") then
						var_266_3.gameObject:SetActive(true)
					else
						var_266_3.gameObject:SetActive(false)
					end
				end
			end

			local var_266_4 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_4 then
				local var_266_5 = (arg_263_1.time_ - var_266_1) / var_266_4
				local var_266_6 = Vector3.New(390, -410, -235)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos10035, var_266_6, var_266_5)
			end

			if arg_263_1.time_ >= var_266_1 + var_266_4 and arg_263_1.time_ < var_266_1 + var_266_4 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(390, -410, -235)
			end

			local var_266_7 = arg_263_1.actors_["1132"]
			local var_266_8 = 0

			if var_266_8 < arg_263_1.time_ and arg_263_1.time_ <= var_266_8 + arg_266_0 and arg_263_1.var_.actorSpriteComps1132 == nil then
				arg_263_1.var_.actorSpriteComps1132 = var_266_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_9 = 0.2

			if var_266_8 <= arg_263_1.time_ and arg_263_1.time_ < var_266_8 + var_266_9 then
				local var_266_10 = (arg_263_1.time_ - var_266_8) / var_266_9

				if arg_263_1.var_.actorSpriteComps1132 then
					for iter_266_1, iter_266_2 in pairs(arg_263_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_266_2 then
							local var_266_11 = Mathf.Lerp(iter_266_2.color.r, 0.5, var_266_10)

							iter_266_2.color = Color.New(var_266_11, var_266_11, var_266_11)
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_8 + var_266_9 and arg_263_1.time_ < var_266_8 + var_266_9 + arg_266_0 and arg_263_1.var_.actorSpriteComps1132 then
				local var_266_12 = 0.5

				for iter_266_3, iter_266_4 in pairs(arg_263_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_266_4 then
						iter_266_4.color = Color.New(var_266_12, var_266_12, var_266_12)
					end
				end

				arg_263_1.var_.actorSpriteComps1132 = nil
			end

			local var_266_13 = 0
			local var_266_14 = 0.05

			if var_266_13 < arg_263_1.time_ and arg_263_1.time_ <= var_266_13 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_15 = arg_263_1:FormatText(StoryNameCfg[369].name)

				arg_263_1.leftNameTxt_.text = var_266_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_16 = arg_263_1:GetWordFromCfg(117122065)
				local var_266_17 = arg_263_1:FormatText(var_266_16.content)

				arg_263_1.text_.text = var_266_17

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_18 = 2
				local var_266_19 = utf8.len(var_266_17)
				local var_266_20 = var_266_18 <= 0 and var_266_14 or var_266_14 * (var_266_19 / var_266_18)

				if var_266_20 > 0 and var_266_14 < var_266_20 then
					arg_263_1.talkMaxDuration = var_266_20

					if var_266_20 + var_266_13 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_20 + var_266_13
					end
				end

				arg_263_1.text_.text = var_266_17
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117122", "117122065", "story_v_out_117122.awb") ~= 0 then
					local var_266_21 = manager.audio:GetVoiceLength("story_v_out_117122", "117122065", "story_v_out_117122.awb") / 1000

					if var_266_21 + var_266_13 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_21 + var_266_13
					end

					if var_266_16.prefab_name ~= "" and arg_263_1.actors_[var_266_16.prefab_name] ~= nil then
						local var_266_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_16.prefab_name].transform, "story_v_out_117122", "117122065", "story_v_out_117122.awb")

						arg_263_1:RecordAudio("117122065", var_266_22)
						arg_263_1:RecordAudio("117122065", var_266_22)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_117122", "117122065", "story_v_out_117122.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_117122", "117122065", "story_v_out_117122.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_23 = math.max(var_266_14, arg_263_1.talkMaxDuration)

			if var_266_13 <= arg_263_1.time_ and arg_263_1.time_ < var_266_13 + var_266_23 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_13) / var_266_23

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_13 + var_266_23 and arg_263_1.time_ < var_266_13 + var_266_23 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I08a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/TI0106"
	},
	voices = {
		"story_v_out_117122.awb"
	}
}
