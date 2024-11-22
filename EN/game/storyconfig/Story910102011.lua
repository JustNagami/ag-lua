return {
	Play910109001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 910109001
		arg_1_1.duration_ = 5.66666666666667

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play910109002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I05b"

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
				local var_4_5 = arg_1_1.bgs_.I05b

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
					if iter_4_0 ~= "I05b" then
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

			local var_4_17 = 0.666666666666667

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

			local var_4_22 = "1039"

			if arg_1_1.actors_[var_4_22] == nil then
				local var_4_23 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_4_22), arg_1_1.canvasGo_.transform)

				var_4_23.transform:SetSiblingIndex(1)

				var_4_23.name = var_4_22
				var_4_23.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_22] = var_4_23
			end

			local var_4_24 = arg_1_1.actors_["1039"].transform
			local var_4_25 = 0

			if var_4_25 < arg_1_1.time_ and arg_1_1.time_ <= var_4_25 + arg_4_0 then
				arg_1_1.var_.moveOldPos1039 = var_4_24.localPosition
				var_4_24.localScale = Vector3.New(1, 1, 1)

				arg_1_1:CheckSpriteTmpPos("1039", 3)

				local var_4_26 = var_4_24.childCount

				for iter_4_2 = 0, var_4_26 - 1 do
					local var_4_27 = var_4_24:GetChild(iter_4_2)

					if var_4_27.name == "split_2" or not string.find(var_4_27.name, "split") then
						var_4_27.gameObject:SetActive(true)
					else
						var_4_27.gameObject:SetActive(false)
					end
				end
			end

			local var_4_28 = 0.001

			if var_4_25 <= arg_1_1.time_ and arg_1_1.time_ < var_4_25 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_25) / var_4_28
				local var_4_30 = Vector3.New(0, -350, -180)

				var_4_24.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1039, var_4_30, var_4_29)
			end

			if arg_1_1.time_ >= var_4_25 + var_4_28 and arg_1_1.time_ < var_4_25 + var_4_28 + arg_4_0 then
				var_4_24.localPosition = Vector3.New(0, -350, -180)
			end

			local var_4_31 = arg_1_1.actors_["1039"]
			local var_4_32 = 0

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				local var_4_33 = var_4_31:GetComponentInChildren(typeof(CanvasGroup))

				if var_4_33 then
					arg_1_1.var_.alphaOldValue1039 = var_4_33.alpha
					arg_1_1.var_.characterEffect1039 = var_4_33
				end

				arg_1_1.var_.alphaOldValue1039 = 0
			end

			local var_4_34 = 0.5

			if var_4_32 <= arg_1_1.time_ and arg_1_1.time_ < var_4_32 + var_4_34 then
				local var_4_35 = (arg_1_1.time_ - var_4_32) / var_4_34
				local var_4_36 = Mathf.Lerp(arg_1_1.var_.alphaOldValue1039, 1, var_4_35)

				if arg_1_1.var_.characterEffect1039 then
					arg_1_1.var_.characterEffect1039.alpha = var_4_36
				end
			end

			if arg_1_1.time_ >= var_4_32 + var_4_34 and arg_1_1.time_ < var_4_32 + var_4_34 + arg_4_0 and arg_1_1.var_.characterEffect1039 then
				arg_1_1.var_.characterEffect1039.alpha = 1
			end

			local var_4_37 = 0
			local var_4_38 = 0.133333333333333

			if var_4_37 < arg_1_1.time_ and arg_1_1.time_ <= var_4_37 + arg_4_0 then
				local var_4_39 = "play"
				local var_4_40 = "music"

				arg_1_1:AudioAction(var_4_39, var_4_40, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_41 = 0.2
			local var_4_42 = 0.891666666666667

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "music"

				arg_1_1:AudioAction(var_4_43, var_4_44, "bgm_activity_1_6_spring_ui", "bgm_activity_1_6_spring_ui", "bgm_activity_1_6_spring_ui.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_45 = 0.666666666666667
			local var_4_46 = 0.425

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_47 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_47:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_48 = arg_1_1:FormatText(StoryNameCfg[9].name)

				arg_1_1.leftNameTxt_.text = var_4_48

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_49 = arg_1_1:GetWordFromCfg(910109001)
				local var_4_50 = arg_1_1:FormatText(var_4_49.content)

				arg_1_1.text_.text = var_4_50

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_51 = 17
				local var_4_52 = utf8.len(var_4_50)
				local var_4_53 = var_4_51 <= 0 and var_4_46 or var_4_46 * (var_4_52 / var_4_51)

				if var_4_53 > 0 and var_4_46 < var_4_53 then
					arg_1_1.talkMaxDuration = var_4_53
					var_4_45 = var_4_45 + 0.3

					if var_4_53 + var_4_45 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_53 + var_4_45
					end
				end

				arg_1_1.text_.text = var_4_50
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_54 = var_4_45 + 0.3
			local var_4_55 = math.max(var_4_46, arg_1_1.talkMaxDuration)

			if var_4_54 <= arg_1_1.time_ and arg_1_1.time_ < var_4_54 + var_4_55 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_54) / var_4_55

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_54 + var_4_55 and arg_1_1.time_ < var_4_54 + var_4_55 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play910109002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 910109002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play910109003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1039"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.actorSpriteComps1039 == nil then
				arg_7_1.var_.actorSpriteComps1039 = var_10_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_2 = 0.2

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.actorSpriteComps1039 then
					for iter_10_0, iter_10_1 in pairs(arg_7_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_10_1 then
							local var_10_4 = Mathf.Lerp(iter_10_1.color.r, 0.5, var_10_3)

							iter_10_1.color = Color.New(var_10_4, var_10_4, var_10_4)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.actorSpriteComps1039 then
				local var_10_5 = 0.5

				for iter_10_2, iter_10_3 in pairs(arg_7_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_10_3 then
						iter_10_3.color = Color.New(var_10_5, var_10_5, var_10_5)
					end
				end

				arg_7_1.var_.actorSpriteComps1039 = nil
			end

			local var_10_6 = 0
			local var_10_7 = 0.05

			if var_10_6 < arg_7_1.time_ and arg_7_1.time_ <= var_10_6 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_8 = arg_7_1:FormatText(StoryNameCfg[7].name)

				arg_7_1.leftNameTxt_.text = var_10_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_9 = arg_7_1:GetWordFromCfg(910109002)
				local var_10_10 = arg_7_1:FormatText(var_10_9.content)

				arg_7_1.text_.text = var_10_10

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_11 = 2
				local var_10_12 = utf8.len(var_10_10)
				local var_10_13 = var_10_11 <= 0 and var_10_7 or var_10_7 * (var_10_12 / var_10_11)

				if var_10_13 > 0 and var_10_7 < var_10_13 then
					arg_7_1.talkMaxDuration = var_10_13

					if var_10_13 + var_10_6 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_13 + var_10_6
					end
				end

				arg_7_1.text_.text = var_10_10
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_14 = math.max(var_10_7, arg_7_1.talkMaxDuration)

			if var_10_6 <= arg_7_1.time_ and arg_7_1.time_ < var_10_6 + var_10_14 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_6) / var_10_14

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_6 + var_10_14 and arg_7_1.time_ < var_10_6 + var_10_14 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play910109003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 910109003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play910109004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1039"].transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPos1039 = var_14_0.localPosition
				var_14_0.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("1039", 3)

				local var_14_2 = var_14_0.childCount

				for iter_14_0 = 0, var_14_2 - 1 do
					local var_14_3 = var_14_0:GetChild(iter_14_0)

					if var_14_3.name == "split_1" or not string.find(var_14_3.name, "split") then
						var_14_3.gameObject:SetActive(true)
					else
						var_14_3.gameObject:SetActive(false)
					end
				end
			end

			local var_14_4 = 0.001

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_4 then
				local var_14_5 = (arg_11_1.time_ - var_14_1) / var_14_4
				local var_14_6 = Vector3.New(0, -350, -180)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1039, var_14_6, var_14_5)
			end

			if arg_11_1.time_ >= var_14_1 + var_14_4 and arg_11_1.time_ < var_14_1 + var_14_4 + arg_14_0 then
				var_14_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_14_7 = 0
			local var_14_8 = 0.875

			if var_14_7 < arg_11_1.time_ and arg_11_1.time_ <= var_14_7 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_9 = arg_11_1:FormatText(StoryNameCfg[9].name)

				arg_11_1.leftNameTxt_.text = var_14_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_10 = arg_11_1:GetWordFromCfg(910109003)
				local var_14_11 = arg_11_1:FormatText(var_14_10.content)

				arg_11_1.text_.text = var_14_11

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_12 = 35
				local var_14_13 = utf8.len(var_14_11)
				local var_14_14 = var_14_12 <= 0 and var_14_8 or var_14_8 * (var_14_13 / var_14_12)

				if var_14_14 > 0 and var_14_8 < var_14_14 then
					arg_11_1.talkMaxDuration = var_14_14

					if var_14_14 + var_14_7 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_14 + var_14_7
					end
				end

				arg_11_1.text_.text = var_14_11
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_15 = math.max(var_14_8, arg_11_1.talkMaxDuration)

			if var_14_7 <= arg_11_1.time_ and arg_11_1.time_ < var_14_7 + var_14_15 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_7) / var_14_15

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_7 + var_14_15 and arg_11_1.time_ < var_14_7 + var_14_15 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play910109004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 910109004
		arg_15_1.duration_ = 0.199999999999

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"

			SetActive(arg_15_1.choicesGo_, true)

			for iter_16_0, iter_16_1 in ipairs(arg_15_1.choices_) do
				local var_16_0 = iter_16_0 <= 2

				SetActive(iter_16_1.go, var_16_0)
			end

			arg_15_1.choices_[1].txt.text = arg_15_1:FormatText(StoryChoiceCfg[278].name)
			arg_15_1.choices_[2].txt.text = arg_15_1:FormatText(StoryChoiceCfg[279].name)
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play910109005(arg_15_1)
			end

			if arg_17_0 == 2 then
				arg_15_0:Play910109008(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1039"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.actorSpriteComps1039 == nil then
				arg_15_1.var_.actorSpriteComps1039 = var_18_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_2 = 0.2

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.actorSpriteComps1039 then
					for iter_18_0, iter_18_1 in pairs(arg_15_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_18_1 then
							local var_18_4 = Mathf.Lerp(iter_18_1.color.r, 0.5, var_18_3)

							iter_18_1.color = Color.New(var_18_4, var_18_4, var_18_4)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.actorSpriteComps1039 then
				local var_18_5 = 0.5

				for iter_18_2, iter_18_3 in pairs(arg_15_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_18_3 then
						iter_18_3.color = Color.New(var_18_5, var_18_5, var_18_5)
					end
				end

				arg_15_1.var_.actorSpriteComps1039 = nil
			end
		end
	end,
	Play910109005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 910109005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play910109006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1039"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.actorSpriteComps1039 == nil then
				arg_19_1.var_.actorSpriteComps1039 = var_22_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_2 = 0.2

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.actorSpriteComps1039 then
					for iter_22_0, iter_22_1 in pairs(arg_19_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_22_1 then
							local var_22_4 = Mathf.Lerp(iter_22_1.color.r, 1, var_22_3)

							iter_22_1.color = Color.New(var_22_4, var_22_4, var_22_4)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.actorSpriteComps1039 then
				local var_22_5 = 1

				for iter_22_2, iter_22_3 in pairs(arg_19_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_22_3 then
						iter_22_3.color = Color.New(var_22_5, var_22_5, var_22_5)
					end
				end

				arg_19_1.var_.actorSpriteComps1039 = nil
			end

			local var_22_6 = 0
			local var_22_7 = 0.35

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_8 = arg_19_1:FormatText(StoryNameCfg[9].name)

				arg_19_1.leftNameTxt_.text = var_22_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_9 = arg_19_1:GetWordFromCfg(910109005)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 14
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
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_14 = math.max(var_22_7, arg_19_1.talkMaxDuration)

			if var_22_6 <= arg_19_1.time_ and arg_19_1.time_ < var_22_6 + var_22_14 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_6) / var_22_14

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_6 + var_22_14 and arg_19_1.time_ < var_22_6 + var_22_14 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play910109006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 910109006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play910109007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 1.35

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[9].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(910109006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 54
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
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_8 = math.max(var_26_1, arg_23_1.talkMaxDuration)

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_8 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_0) / var_26_8

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_0 + var_26_8 and arg_23_1.time_ < var_26_0 + var_26_8 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play910109007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 910109007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play910109009(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1039"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1039 = var_30_0.localPosition
				var_30_0.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("1039", 3)

				local var_30_2 = var_30_0.childCount

				for iter_30_0 = 0, var_30_2 - 1 do
					local var_30_3 = var_30_0:GetChild(iter_30_0)

					if var_30_3.name == "split_1" or not string.find(var_30_3.name, "split") then
						var_30_3.gameObject:SetActive(true)
					else
						var_30_3.gameObject:SetActive(false)
					end
				end
			end

			local var_30_4 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_4 then
				local var_30_5 = (arg_27_1.time_ - var_30_1) / var_30_4
				local var_30_6 = Vector3.New(0, -350, -180)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1039, var_30_6, var_30_5)
			end

			if arg_27_1.time_ >= var_30_1 + var_30_4 and arg_27_1.time_ < var_30_1 + var_30_4 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_30_7 = arg_27_1.actors_["1039"]
			local var_30_8 = 0

			if var_30_8 < arg_27_1.time_ and arg_27_1.time_ <= var_30_8 + arg_30_0 and arg_27_1.var_.actorSpriteComps1039 == nil then
				arg_27_1.var_.actorSpriteComps1039 = var_30_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_9 = 0.0166666666666667

			if var_30_8 <= arg_27_1.time_ and arg_27_1.time_ < var_30_8 + var_30_9 then
				local var_30_10 = (arg_27_1.time_ - var_30_8) / var_30_9

				if arg_27_1.var_.actorSpriteComps1039 then
					for iter_30_1, iter_30_2 in pairs(arg_27_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_30_2 then
							local var_30_11 = Mathf.Lerp(iter_30_2.color.r, 1, var_30_10)

							iter_30_2.color = Color.New(var_30_11, var_30_11, var_30_11)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_8 + var_30_9 and arg_27_1.time_ < var_30_8 + var_30_9 + arg_30_0 and arg_27_1.var_.actorSpriteComps1039 then
				local var_30_12 = 1

				for iter_30_3, iter_30_4 in pairs(arg_27_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_30_4 then
						iter_30_4.color = Color.New(var_30_12, var_30_12, var_30_12)
					end
				end

				arg_27_1.var_.actorSpriteComps1039 = nil
			end

			local var_30_13 = 0
			local var_30_14 = 0.7

			if var_30_13 < arg_27_1.time_ and arg_27_1.time_ <= var_30_13 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_15 = arg_27_1:FormatText(StoryNameCfg[9].name)

				arg_27_1.leftNameTxt_.text = var_30_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_16 = arg_27_1:GetWordFromCfg(910109007)
				local var_30_17 = arg_27_1:FormatText(var_30_16.content)

				arg_27_1.text_.text = var_30_17

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_18 = 28
				local var_30_19 = utf8.len(var_30_17)
				local var_30_20 = var_30_18 <= 0 and var_30_14 or var_30_14 * (var_30_19 / var_30_18)

				if var_30_20 > 0 and var_30_14 < var_30_20 then
					arg_27_1.talkMaxDuration = var_30_20

					if var_30_20 + var_30_13 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_20 + var_30_13
					end
				end

				arg_27_1.text_.text = var_30_17
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_21 = math.max(var_30_14, arg_27_1.talkMaxDuration)

			if var_30_13 <= arg_27_1.time_ and arg_27_1.time_ < var_30_13 + var_30_21 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_13) / var_30_21

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_13 + var_30_21 and arg_27_1.time_ < var_30_13 + var_30_21 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play910109009 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 910109009
		arg_31_1.duration_ = 7

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play910109010(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = "NI0101"

			if arg_31_1.bgs_[var_34_0] == nil then
				local var_34_1 = Object.Instantiate(arg_31_1.paintGo_)

				var_34_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_34_0)
				var_34_1.name = var_34_0
				var_34_1.transform.parent = arg_31_1.stage_.transform
				var_34_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_31_1.bgs_[var_34_0] = var_34_1
			end

			local var_34_2 = 2

			if var_34_2 < arg_31_1.time_ and arg_31_1.time_ <= var_34_2 + arg_34_0 then
				local var_34_3 = manager.ui.mainCamera.transform.localPosition
				local var_34_4 = Vector3.New(0, 0, 10) + Vector3.New(var_34_3.x, var_34_3.y, 0)
				local var_34_5 = arg_31_1.bgs_.NI0101

				var_34_5.transform.localPosition = var_34_4
				var_34_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_34_6 = var_34_5:GetComponent("SpriteRenderer")

				if var_34_6 and var_34_6.sprite then
					local var_34_7 = (var_34_5.transform.localPosition - var_34_3).z
					local var_34_8 = manager.ui.mainCameraCom_
					local var_34_9 = 2 * var_34_7 * Mathf.Tan(var_34_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_34_10 = var_34_9 * var_34_8.aspect
					local var_34_11 = var_34_6.sprite.bounds.size.x
					local var_34_12 = var_34_6.sprite.bounds.size.y
					local var_34_13 = var_34_10 / var_34_11
					local var_34_14 = var_34_9 / var_34_12
					local var_34_15 = var_34_14 < var_34_13 and var_34_13 or var_34_14

					var_34_5.transform.localScale = Vector3.New(var_34_15, var_34_15, 0)
				end

				for iter_34_0, iter_34_1 in pairs(arg_31_1.bgs_) do
					if iter_34_0 ~= "NI0101" then
						iter_34_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_34_16 = arg_31_1.actors_["1039"]
			local var_34_17 = 2

			if var_34_17 < arg_31_1.time_ and arg_31_1.time_ <= var_34_17 + arg_34_0 and arg_31_1.var_.actorSpriteComps1039 == nil then
				arg_31_1.var_.actorSpriteComps1039 = var_34_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_18 = 0.0166666666666667

			if var_34_17 <= arg_31_1.time_ and arg_31_1.time_ < var_34_17 + var_34_18 then
				local var_34_19 = (arg_31_1.time_ - var_34_17) / var_34_18

				if arg_31_1.var_.actorSpriteComps1039 then
					for iter_34_2, iter_34_3 in pairs(arg_31_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_34_3 then
							local var_34_20 = Mathf.Lerp(iter_34_3.color.r, 0.5, var_34_19)

							iter_34_3.color = Color.New(var_34_20, var_34_20, var_34_20)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_17 + var_34_18 and arg_31_1.time_ < var_34_17 + var_34_18 + arg_34_0 and arg_31_1.var_.actorSpriteComps1039 then
				local var_34_21 = 0.5

				for iter_34_4, iter_34_5 in pairs(arg_31_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_34_5 then
						iter_34_5.color = Color.New(var_34_21, var_34_21, var_34_21)
					end
				end

				arg_31_1.var_.actorSpriteComps1039 = nil
			end

			local var_34_22 = arg_31_1.actors_["1039"].transform
			local var_34_23 = 2

			if var_34_23 < arg_31_1.time_ and arg_31_1.time_ <= var_34_23 + arg_34_0 then
				arg_31_1.var_.moveOldPos1039 = var_34_22.localPosition
				var_34_22.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("1039", 7)

				local var_34_24 = var_34_22.childCount

				for iter_34_6 = 0, var_34_24 - 1 do
					local var_34_25 = var_34_22:GetChild(iter_34_6)

					if var_34_25.name == "split_1" or not string.find(var_34_25.name, "split") then
						var_34_25.gameObject:SetActive(true)
					else
						var_34_25.gameObject:SetActive(false)
					end
				end
			end

			local var_34_26 = 0.001

			if var_34_23 <= arg_31_1.time_ and arg_31_1.time_ < var_34_23 + var_34_26 then
				local var_34_27 = (arg_31_1.time_ - var_34_23) / var_34_26
				local var_34_28 = Vector3.New(0, -2000, -180)

				var_34_22.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1039, var_34_28, var_34_27)
			end

			if arg_31_1.time_ >= var_34_23 + var_34_26 and arg_31_1.time_ < var_34_23 + var_34_26 + arg_34_0 then
				var_34_22.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_34_29 = 0

			if var_34_29 < arg_31_1.time_ and arg_31_1.time_ <= var_34_29 + arg_34_0 then
				arg_31_1.mask_.enabled = true
				arg_31_1.mask_.raycastTarget = true

				arg_31_1:SetGaussion(false)
			end

			local var_34_30 = 2

			if var_34_29 <= arg_31_1.time_ and arg_31_1.time_ < var_34_29 + var_34_30 then
				local var_34_31 = (arg_31_1.time_ - var_34_29) / var_34_30
				local var_34_32 = Color.New(1, 1, 1)

				var_34_32.a = Mathf.Lerp(0, 1, var_34_31)
				arg_31_1.mask_.color = var_34_32
			end

			if arg_31_1.time_ >= var_34_29 + var_34_30 and arg_31_1.time_ < var_34_29 + var_34_30 + arg_34_0 then
				local var_34_33 = Color.New(1, 1, 1)

				var_34_33.a = 1
				arg_31_1.mask_.color = var_34_33
			end

			local var_34_34 = 2

			if var_34_34 < arg_31_1.time_ and arg_31_1.time_ <= var_34_34 + arg_34_0 then
				arg_31_1.mask_.enabled = true
				arg_31_1.mask_.raycastTarget = true

				arg_31_1:SetGaussion(false)
			end

			local var_34_35 = 2

			if var_34_34 <= arg_31_1.time_ and arg_31_1.time_ < var_34_34 + var_34_35 then
				local var_34_36 = (arg_31_1.time_ - var_34_34) / var_34_35
				local var_34_37 = Color.New(0, 0, 0)

				var_34_37.a = Mathf.Lerp(1, 0, var_34_36)
				arg_31_1.mask_.color = var_34_37
			end

			if arg_31_1.time_ >= var_34_34 + var_34_35 and arg_31_1.time_ < var_34_34 + var_34_35 + arg_34_0 then
				local var_34_38 = Color.New(0, 0, 0)
				local var_34_39 = 0

				arg_31_1.mask_.enabled = false
				var_34_38.a = var_34_39
				arg_31_1.mask_.color = var_34_38
			end

			local var_34_40 = 2
			local var_34_41 = 0.15

			if var_34_40 < arg_31_1.time_ and arg_31_1.time_ <= var_34_40 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_42 = arg_31_1:FormatText(StoryNameCfg[7].name)

				arg_31_1.leftNameTxt_.text = var_34_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_43 = arg_31_1:GetWordFromCfg(910109009)
				local var_34_44 = arg_31_1:FormatText(var_34_43.content)

				arg_31_1.text_.text = var_34_44

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_45 = 6
				local var_34_46 = utf8.len(var_34_44)
				local var_34_47 = var_34_45 <= 0 and var_34_41 or var_34_41 * (var_34_46 / var_34_45)

				if var_34_47 > 0 and var_34_41 < var_34_47 then
					arg_31_1.talkMaxDuration = var_34_47

					if var_34_47 + var_34_40 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_47 + var_34_40
					end
				end

				arg_31_1.text_.text = var_34_44
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_48 = math.max(var_34_41, arg_31_1.talkMaxDuration)

			if var_34_40 <= arg_31_1.time_ and arg_31_1.time_ < var_34_40 + var_34_48 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_40) / var_34_48

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_40 + var_34_48 and arg_31_1.time_ < var_34_40 + var_34_48 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play910109010 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 910109010
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play910109011(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1039"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.actorSpriteComps1039 == nil then
				arg_35_1.var_.actorSpriteComps1039 = var_38_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_2 = 0.2

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.actorSpriteComps1039 then
					for iter_38_0, iter_38_1 in pairs(arg_35_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_38_1 then
							local var_38_4 = Mathf.Lerp(iter_38_1.color.r, 1, var_38_3)

							iter_38_1.color = Color.New(var_38_4, var_38_4, var_38_4)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.actorSpriteComps1039 then
				local var_38_5 = 1

				for iter_38_2, iter_38_3 in pairs(arg_35_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_38_3 then
						iter_38_3.color = Color.New(var_38_5, var_38_5, var_38_5)
					end
				end

				arg_35_1.var_.actorSpriteComps1039 = nil
			end

			local var_38_6 = 0
			local var_38_7 = 0.075

			if var_38_6 < arg_35_1.time_ and arg_35_1.time_ <= var_38_6 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_8 = arg_35_1:FormatText(StoryNameCfg[9].name)

				arg_35_1.leftNameTxt_.text = var_38_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, true)
				arg_35_1.iconController_:SetSelectedState("hero")

				arg_35_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1039_split_4")

				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_9 = arg_35_1:GetWordFromCfg(910109010)
				local var_38_10 = arg_35_1:FormatText(var_38_9.content)

				arg_35_1.text_.text = var_38_10

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_11 = 3
				local var_38_12 = utf8.len(var_38_10)
				local var_38_13 = var_38_11 <= 0 and var_38_7 or var_38_7 * (var_38_12 / var_38_11)

				if var_38_13 > 0 and var_38_7 < var_38_13 then
					arg_35_1.talkMaxDuration = var_38_13

					if var_38_13 + var_38_6 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_13 + var_38_6
					end
				end

				arg_35_1.text_.text = var_38_10
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_14 = math.max(var_38_7, arg_35_1.talkMaxDuration)

			if var_38_6 <= arg_35_1.time_ and arg_35_1.time_ < var_38_6 + var_38_14 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_6) / var_38_14

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_6 + var_38_14 and arg_35_1.time_ < var_38_6 + var_38_14 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play910109011 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 910109011
		arg_39_1.duration_ = 0.199999999999

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"

			SetActive(arg_39_1.choicesGo_, true)

			for iter_40_0, iter_40_1 in ipairs(arg_39_1.choices_) do
				local var_40_0 = iter_40_0 <= 2

				SetActive(iter_40_1.go, var_40_0)
			end

			arg_39_1.choices_[1].txt.text = arg_39_1:FormatText(StoryChoiceCfg[280].name)
			arg_39_1.choices_[2].txt.text = arg_39_1:FormatText(StoryChoiceCfg[281].name)
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play910109012(arg_39_1)
			end

			if arg_41_0 == 2 then
				arg_39_0:Play910109012(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = "1070"

			if arg_39_1.actors_[var_42_0] == nil then
				local var_42_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_42_0), arg_39_1.canvasGo_.transform)

				var_42_1.transform:SetSiblingIndex(1)

				var_42_1.name = var_42_0
				var_42_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_39_1.actors_[var_42_0] = var_42_1
			end

			local var_42_2 = arg_39_1.actors_["1070"]
			local var_42_3 = 0

			if var_42_3 < arg_39_1.time_ and arg_39_1.time_ <= var_42_3 + arg_42_0 and arg_39_1.var_.actorSpriteComps1070 == nil then
				arg_39_1.var_.actorSpriteComps1070 = var_42_2:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_4 = 0.2

			if var_42_3 <= arg_39_1.time_ and arg_39_1.time_ < var_42_3 + var_42_4 then
				local var_42_5 = (arg_39_1.time_ - var_42_3) / var_42_4

				if arg_39_1.var_.actorSpriteComps1070 then
					for iter_42_0, iter_42_1 in pairs(arg_39_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_42_1 then
							local var_42_6 = Mathf.Lerp(iter_42_1.color.r, 0.5, var_42_5)

							iter_42_1.color = Color.New(var_42_6, var_42_6, var_42_6)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_3 + var_42_4 and arg_39_1.time_ < var_42_3 + var_42_4 + arg_42_0 and arg_39_1.var_.actorSpriteComps1070 then
				local var_42_7 = 0.5

				for iter_42_2, iter_42_3 in pairs(arg_39_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_42_3 then
						iter_42_3.color = Color.New(var_42_7, var_42_7, var_42_7)
					end
				end

				arg_39_1.var_.actorSpriteComps1070 = nil
			end
		end
	end,
	Play910109012 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 910109012
		arg_43_1.duration_ = 6

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play910109013(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 1

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				local var_46_1 = manager.ui.mainCamera.transform.localPosition
				local var_46_2 = Vector3.New(0, 0, 10) + Vector3.New(var_46_1.x, var_46_1.y, 0)
				local var_46_3 = arg_43_1.bgs_.I05b

				var_46_3.transform.localPosition = var_46_2
				var_46_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_46_4 = var_46_3:GetComponent("SpriteRenderer")

				if var_46_4 and var_46_4.sprite then
					local var_46_5 = (var_46_3.transform.localPosition - var_46_1).z
					local var_46_6 = manager.ui.mainCameraCom_
					local var_46_7 = 2 * var_46_5 * Mathf.Tan(var_46_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_46_8 = var_46_7 * var_46_6.aspect
					local var_46_9 = var_46_4.sprite.bounds.size.x
					local var_46_10 = var_46_4.sprite.bounds.size.y
					local var_46_11 = var_46_8 / var_46_9
					local var_46_12 = var_46_7 / var_46_10
					local var_46_13 = var_46_12 < var_46_11 and var_46_11 or var_46_12

					var_46_3.transform.localScale = Vector3.New(var_46_13, var_46_13, 0)
				end

				for iter_46_0, iter_46_1 in pairs(arg_43_1.bgs_) do
					if iter_46_0 ~= "I05b" then
						iter_46_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_46_14 = arg_43_1.actors_["1070"].transform
			local var_46_15 = 1

			if var_46_15 < arg_43_1.time_ and arg_43_1.time_ <= var_46_15 + arg_46_0 then
				arg_43_1.var_.moveOldPos1070 = var_46_14.localPosition
				var_46_14.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("1070", 3)

				local var_46_16 = var_46_14.childCount

				for iter_46_2 = 0, var_46_16 - 1 do
					local var_46_17 = var_46_14:GetChild(iter_46_2)

					if var_46_17.name == "split_3" or not string.find(var_46_17.name, "split") then
						var_46_17.gameObject:SetActive(true)
					else
						var_46_17.gameObject:SetActive(false)
					end
				end
			end

			local var_46_18 = 0.001

			if var_46_15 <= arg_43_1.time_ and arg_43_1.time_ < var_46_15 + var_46_18 then
				local var_46_19 = (arg_43_1.time_ - var_46_15) / var_46_18
				local var_46_20 = Vector3.New(0, -350, -180)

				var_46_14.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1070, var_46_20, var_46_19)
			end

			if arg_43_1.time_ >= var_46_15 + var_46_18 and arg_43_1.time_ < var_46_15 + var_46_18 + arg_46_0 then
				var_46_14.localPosition = Vector3.New(0, -350, -180)
			end

			local var_46_21 = arg_43_1.actors_["1070"]
			local var_46_22 = 1

			if var_46_22 < arg_43_1.time_ and arg_43_1.time_ <= var_46_22 + arg_46_0 and arg_43_1.var_.actorSpriteComps1070 == nil then
				arg_43_1.var_.actorSpriteComps1070 = var_46_21:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_23 = 0.2

			if var_46_22 <= arg_43_1.time_ and arg_43_1.time_ < var_46_22 + var_46_23 then
				local var_46_24 = (arg_43_1.time_ - var_46_22) / var_46_23

				if arg_43_1.var_.actorSpriteComps1070 then
					for iter_46_3, iter_46_4 in pairs(arg_43_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_46_4 then
							local var_46_25 = Mathf.Lerp(iter_46_4.color.r, 1, var_46_24)

							iter_46_4.color = Color.New(var_46_25, var_46_25, var_46_25)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_22 + var_46_23 and arg_43_1.time_ < var_46_22 + var_46_23 + arg_46_0 and arg_43_1.var_.actorSpriteComps1070 then
				local var_46_26 = 1

				for iter_46_5, iter_46_6 in pairs(arg_43_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_46_6 then
						iter_46_6.color = Color.New(var_46_26, var_46_26, var_46_26)
					end
				end

				arg_43_1.var_.actorSpriteComps1070 = nil
			end

			local var_46_27 = arg_43_1.actors_["1070"]
			local var_46_28 = 1

			if var_46_28 < arg_43_1.time_ and arg_43_1.time_ <= var_46_28 + arg_46_0 then
				local var_46_29 = var_46_27:GetComponentInChildren(typeof(CanvasGroup))

				if var_46_29 then
					arg_43_1.var_.alphaOldValue1070 = var_46_29.alpha
					arg_43_1.var_.characterEffect1070 = var_46_29
				end

				arg_43_1.var_.alphaOldValue1070 = 0
			end

			local var_46_30 = 0.5

			if var_46_28 <= arg_43_1.time_ and arg_43_1.time_ < var_46_28 + var_46_30 then
				local var_46_31 = (arg_43_1.time_ - var_46_28) / var_46_30
				local var_46_32 = Mathf.Lerp(arg_43_1.var_.alphaOldValue1070, 1, var_46_31)

				if arg_43_1.var_.characterEffect1070 then
					arg_43_1.var_.characterEffect1070.alpha = var_46_32
				end
			end

			if arg_43_1.time_ >= var_46_28 + var_46_30 and arg_43_1.time_ < var_46_28 + var_46_30 + arg_46_0 and arg_43_1.var_.characterEffect1070 then
				arg_43_1.var_.characterEffect1070.alpha = 1
			end

			local var_46_33 = 0

			if var_46_33 < arg_43_1.time_ and arg_43_1.time_ <= var_46_33 + arg_46_0 then
				arg_43_1.mask_.enabled = true
				arg_43_1.mask_.raycastTarget = true

				arg_43_1:SetGaussion(false)
			end

			local var_46_34 = 1

			if var_46_33 <= arg_43_1.time_ and arg_43_1.time_ < var_46_33 + var_46_34 then
				local var_46_35 = (arg_43_1.time_ - var_46_33) / var_46_34
				local var_46_36 = Color.New(0, 0, 0)

				var_46_36.a = Mathf.Lerp(0, 1, var_46_35)
				arg_43_1.mask_.color = var_46_36
			end

			if arg_43_1.time_ >= var_46_33 + var_46_34 and arg_43_1.time_ < var_46_33 + var_46_34 + arg_46_0 then
				local var_46_37 = Color.New(0, 0, 0)

				var_46_37.a = 1
				arg_43_1.mask_.color = var_46_37
			end

			local var_46_38 = 1

			if var_46_38 < arg_43_1.time_ and arg_43_1.time_ <= var_46_38 + arg_46_0 then
				arg_43_1.mask_.enabled = true
				arg_43_1.mask_.raycastTarget = true

				arg_43_1:SetGaussion(false)
			end

			local var_46_39 = 1.55

			if var_46_38 <= arg_43_1.time_ and arg_43_1.time_ < var_46_38 + var_46_39 then
				local var_46_40 = (arg_43_1.time_ - var_46_38) / var_46_39
				local var_46_41 = Color.New(1, 1, 1)

				var_46_41.a = Mathf.Lerp(1, 0, var_46_40)
				arg_43_1.mask_.color = var_46_41
			end

			if arg_43_1.time_ >= var_46_38 + var_46_39 and arg_43_1.time_ < var_46_38 + var_46_39 + arg_46_0 then
				local var_46_42 = Color.New(1, 1, 1)
				local var_46_43 = 0

				arg_43_1.mask_.enabled = false
				var_46_42.a = var_46_43
				arg_43_1.mask_.color = var_46_42
			end

			local var_46_44 = 1
			local var_46_45 = 1.55

			if var_46_44 < arg_43_1.time_ and arg_43_1.time_ <= var_46_44 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_46 = arg_43_1:FormatText(StoryNameCfg[318].name)

				arg_43_1.leftNameTxt_.text = var_46_46

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_47 = arg_43_1:GetWordFromCfg(910109012)
				local var_46_48 = arg_43_1:FormatText(var_46_47.content)

				arg_43_1.text_.text = var_46_48

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_49 = 62
				local var_46_50 = utf8.len(var_46_48)
				local var_46_51 = var_46_49 <= 0 and var_46_45 or var_46_45 * (var_46_50 / var_46_49)

				if var_46_51 > 0 and var_46_45 < var_46_51 then
					arg_43_1.talkMaxDuration = var_46_51

					if var_46_51 + var_46_44 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_51 + var_46_44
					end
				end

				arg_43_1.text_.text = var_46_48
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_52 = math.max(var_46_45, arg_43_1.talkMaxDuration)

			if var_46_44 <= arg_43_1.time_ and arg_43_1.time_ < var_46_44 + var_46_52 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_44) / var_46_52

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_44 + var_46_52 and arg_43_1.time_ < var_46_44 + var_46_52 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play910109013 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 910109013
		arg_47_1.duration_ = 0.199999999999

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"

			SetActive(arg_47_1.choicesGo_, true)

			for iter_48_0, iter_48_1 in ipairs(arg_47_1.choices_) do
				local var_48_0 = iter_48_0 <= 2

				SetActive(iter_48_1.go, var_48_0)
			end

			arg_47_1.choices_[1].txt.text = arg_47_1:FormatText(StoryChoiceCfg[282].name)
			arg_47_1.choices_[2].txt.text = arg_47_1:FormatText(StoryChoiceCfg[283].name)
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play910109014(arg_47_1)
			end

			if arg_49_0 == 2 then
				arg_47_0:Play910109014(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1070"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.actorSpriteComps1070 == nil then
				arg_47_1.var_.actorSpriteComps1070 = var_50_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_2 = 0.2

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.actorSpriteComps1070 then
					for iter_50_0, iter_50_1 in pairs(arg_47_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_50_1 then
							local var_50_4 = Mathf.Lerp(iter_50_1.color.r, 0.5, var_50_3)

							iter_50_1.color = Color.New(var_50_4, var_50_4, var_50_4)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.actorSpriteComps1070 then
				local var_50_5 = 0.5

				for iter_50_2, iter_50_3 in pairs(arg_47_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_50_3 then
						iter_50_3.color = Color.New(var_50_5, var_50_5, var_50_5)
					end
				end

				arg_47_1.var_.actorSpriteComps1070 = nil
			end
		end
	end,
	Play910109014 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 910109014
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play910109015(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.425

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[7].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(910109014)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 17
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
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_8 = math.max(var_54_1, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_8 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_0) / var_54_8

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_8 and arg_51_1.time_ < var_54_0 + var_54_8 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play910109015 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 910109015
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play910109016(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1070"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.actorSpriteComps1070 == nil then
				arg_55_1.var_.actorSpriteComps1070 = var_58_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_2 = 0.2

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.actorSpriteComps1070 then
					for iter_58_0, iter_58_1 in pairs(arg_55_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_58_1 then
							local var_58_4 = Mathf.Lerp(iter_58_1.color.r, 1, var_58_3)

							iter_58_1.color = Color.New(var_58_4, var_58_4, var_58_4)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.actorSpriteComps1070 then
				local var_58_5 = 1

				for iter_58_2, iter_58_3 in pairs(arg_55_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_58_3 then
						iter_58_3.color = Color.New(var_58_5, var_58_5, var_58_5)
					end
				end

				arg_55_1.var_.actorSpriteComps1070 = nil
			end

			local var_58_6 = 0
			local var_58_7 = 0.35

			if var_58_6 < arg_55_1.time_ and arg_55_1.time_ <= var_58_6 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_8 = arg_55_1:FormatText(StoryNameCfg[318].name)

				arg_55_1.leftNameTxt_.text = var_58_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_9 = arg_55_1:GetWordFromCfg(910109015)
				local var_58_10 = arg_55_1:FormatText(var_58_9.content)

				arg_55_1.text_.text = var_58_10

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_11 = 14
				local var_58_12 = utf8.len(var_58_10)
				local var_58_13 = var_58_11 <= 0 and var_58_7 or var_58_7 * (var_58_12 / var_58_11)

				if var_58_13 > 0 and var_58_7 < var_58_13 then
					arg_55_1.talkMaxDuration = var_58_13

					if var_58_13 + var_58_6 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_13 + var_58_6
					end
				end

				arg_55_1.text_.text = var_58_10
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_14 = math.max(var_58_7, arg_55_1.talkMaxDuration)

			if var_58_6 <= arg_55_1.time_ and arg_55_1.time_ < var_58_6 + var_58_14 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_6) / var_58_14

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_6 + var_58_14 and arg_55_1.time_ < var_58_6 + var_58_14 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play910109016 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 910109016
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play910109017(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1070"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.actorSpriteComps1070 == nil then
				arg_59_1.var_.actorSpriteComps1070 = var_62_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_2 = 0.2

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.actorSpriteComps1070 then
					for iter_62_0, iter_62_1 in pairs(arg_59_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_62_1 then
							local var_62_4 = Mathf.Lerp(iter_62_1.color.r, 0.5, var_62_3)

							iter_62_1.color = Color.New(var_62_4, var_62_4, var_62_4)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.actorSpriteComps1070 then
				local var_62_5 = 0.5

				for iter_62_2, iter_62_3 in pairs(arg_59_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_62_3 then
						iter_62_3.color = Color.New(var_62_5, var_62_5, var_62_5)
					end
				end

				arg_59_1.var_.actorSpriteComps1070 = nil
			end

			local var_62_6 = 0
			local var_62_7 = 0.325

			if var_62_6 < arg_59_1.time_ and arg_59_1.time_ <= var_62_6 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_8 = arg_59_1:FormatText(StoryNameCfg[7].name)

				arg_59_1.leftNameTxt_.text = var_62_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_9 = arg_59_1:GetWordFromCfg(910109016)
				local var_62_10 = arg_59_1:FormatText(var_62_9.content)

				arg_59_1.text_.text = var_62_10

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_11 = 13
				local var_62_12 = utf8.len(var_62_10)
				local var_62_13 = var_62_11 <= 0 and var_62_7 or var_62_7 * (var_62_12 / var_62_11)

				if var_62_13 > 0 and var_62_7 < var_62_13 then
					arg_59_1.talkMaxDuration = var_62_13

					if var_62_13 + var_62_6 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_13 + var_62_6
					end
				end

				arg_59_1.text_.text = var_62_10
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_14 = math.max(var_62_7, arg_59_1.talkMaxDuration)

			if var_62_6 <= arg_59_1.time_ and arg_59_1.time_ < var_62_6 + var_62_14 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_6) / var_62_14

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_6 + var_62_14 and arg_59_1.time_ < var_62_6 + var_62_14 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play910109017 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 910109017
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play910109018(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1070"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1070 = var_66_0.localPosition
				var_66_0.localScale = Vector3.New(1, 1, 1)

				arg_63_1:CheckSpriteTmpPos("1070", 3)

				local var_66_2 = var_66_0.childCount

				for iter_66_0 = 0, var_66_2 - 1 do
					local var_66_3 = var_66_0:GetChild(iter_66_0)

					if var_66_3.name == "split_6" or not string.find(var_66_3.name, "split") then
						var_66_3.gameObject:SetActive(true)
					else
						var_66_3.gameObject:SetActive(false)
					end
				end
			end

			local var_66_4 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_4 then
				local var_66_5 = (arg_63_1.time_ - var_66_1) / var_66_4
				local var_66_6 = Vector3.New(0, -350, -180)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1070, var_66_6, var_66_5)
			end

			if arg_63_1.time_ >= var_66_1 + var_66_4 and arg_63_1.time_ < var_66_1 + var_66_4 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_66_7 = arg_63_1.actors_["1070"]
			local var_66_8 = 0

			if var_66_8 < arg_63_1.time_ and arg_63_1.time_ <= var_66_8 + arg_66_0 and arg_63_1.var_.actorSpriteComps1070 == nil then
				arg_63_1.var_.actorSpriteComps1070 = var_66_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_9 = 0.0166666666666667

			if var_66_8 <= arg_63_1.time_ and arg_63_1.time_ < var_66_8 + var_66_9 then
				local var_66_10 = (arg_63_1.time_ - var_66_8) / var_66_9

				if arg_63_1.var_.actorSpriteComps1070 then
					for iter_66_1, iter_66_2 in pairs(arg_63_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_66_2 then
							local var_66_11 = Mathf.Lerp(iter_66_2.color.r, 1, var_66_10)

							iter_66_2.color = Color.New(var_66_11, var_66_11, var_66_11)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_8 + var_66_9 and arg_63_1.time_ < var_66_8 + var_66_9 + arg_66_0 and arg_63_1.var_.actorSpriteComps1070 then
				local var_66_12 = 1

				for iter_66_3, iter_66_4 in pairs(arg_63_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_66_4 then
						iter_66_4.color = Color.New(var_66_12, var_66_12, var_66_12)
					end
				end

				arg_63_1.var_.actorSpriteComps1070 = nil
			end

			local var_66_13 = 0
			local var_66_14 = 0.325

			if var_66_13 < arg_63_1.time_ and arg_63_1.time_ <= var_66_13 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_15 = arg_63_1:FormatText(StoryNameCfg[318].name)

				arg_63_1.leftNameTxt_.text = var_66_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_16 = arg_63_1:GetWordFromCfg(910109017)
				local var_66_17 = arg_63_1:FormatText(var_66_16.content)

				arg_63_1.text_.text = var_66_17

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_18 = 13
				local var_66_19 = utf8.len(var_66_17)
				local var_66_20 = var_66_18 <= 0 and var_66_14 or var_66_14 * (var_66_19 / var_66_18)

				if var_66_20 > 0 and var_66_14 < var_66_20 then
					arg_63_1.talkMaxDuration = var_66_20

					if var_66_20 + var_66_13 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_20 + var_66_13
					end
				end

				arg_63_1.text_.text = var_66_17
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_21 = math.max(var_66_14, arg_63_1.talkMaxDuration)

			if var_66_13 <= arg_63_1.time_ and arg_63_1.time_ < var_66_13 + var_66_21 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_13) / var_66_21

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_13 + var_66_21 and arg_63_1.time_ < var_66_13 + var_66_21 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play910109018 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 910109018
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play910109019(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1070"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.actorSpriteComps1070 == nil then
				arg_67_1.var_.actorSpriteComps1070 = var_70_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_2 = 0.2

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.actorSpriteComps1070 then
					for iter_70_0, iter_70_1 in pairs(arg_67_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_70_1 then
							local var_70_4 = Mathf.Lerp(iter_70_1.color.r, 0.5, var_70_3)

							iter_70_1.color = Color.New(var_70_4, var_70_4, var_70_4)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.actorSpriteComps1070 then
				local var_70_5 = 0.5

				for iter_70_2, iter_70_3 in pairs(arg_67_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_70_3 then
						iter_70_3.color = Color.New(var_70_5, var_70_5, var_70_5)
					end
				end

				arg_67_1.var_.actorSpriteComps1070 = nil
			end

			local var_70_6 = 0
			local var_70_7 = 0.175

			if var_70_6 < arg_67_1.time_ and arg_67_1.time_ <= var_70_6 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_8 = arg_67_1:FormatText(StoryNameCfg[7].name)

				arg_67_1.leftNameTxt_.text = var_70_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_9 = arg_67_1:GetWordFromCfg(910109018)
				local var_70_10 = arg_67_1:FormatText(var_70_9.content)

				arg_67_1.text_.text = var_70_10

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_11 = 7
				local var_70_12 = utf8.len(var_70_10)
				local var_70_13 = var_70_11 <= 0 and var_70_7 or var_70_7 * (var_70_12 / var_70_11)

				if var_70_13 > 0 and var_70_7 < var_70_13 then
					arg_67_1.talkMaxDuration = var_70_13

					if var_70_13 + var_70_6 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_13 + var_70_6
					end
				end

				arg_67_1.text_.text = var_70_10
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_14 = math.max(var_70_7, arg_67_1.talkMaxDuration)

			if var_70_6 <= arg_67_1.time_ and arg_67_1.time_ < var_70_6 + var_70_14 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_6) / var_70_14

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_6 + var_70_14 and arg_67_1.time_ < var_70_6 + var_70_14 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play910109019 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 910109019
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play910109020(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1070"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1070 = var_74_0.localPosition
				var_74_0.localScale = Vector3.New(1, 1, 1)

				arg_71_1:CheckSpriteTmpPos("1070", 3)

				local var_74_2 = var_74_0.childCount

				for iter_74_0 = 0, var_74_2 - 1 do
					local var_74_3 = var_74_0:GetChild(iter_74_0)

					if var_74_3.name == "split_5" or not string.find(var_74_3.name, "split") then
						var_74_3.gameObject:SetActive(true)
					else
						var_74_3.gameObject:SetActive(false)
					end
				end
			end

			local var_74_4 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_4 then
				local var_74_5 = (arg_71_1.time_ - var_74_1) / var_74_4
				local var_74_6 = Vector3.New(0, -350, -180)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1070, var_74_6, var_74_5)
			end

			if arg_71_1.time_ >= var_74_1 + var_74_4 and arg_71_1.time_ < var_74_1 + var_74_4 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_74_7 = arg_71_1.actors_["1070"]
			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 and arg_71_1.var_.actorSpriteComps1070 == nil then
				arg_71_1.var_.actorSpriteComps1070 = var_74_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_9 = 0.0166666666666667

			if var_74_8 <= arg_71_1.time_ and arg_71_1.time_ < var_74_8 + var_74_9 then
				local var_74_10 = (arg_71_1.time_ - var_74_8) / var_74_9

				if arg_71_1.var_.actorSpriteComps1070 then
					for iter_74_1, iter_74_2 in pairs(arg_71_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_74_2 then
							local var_74_11 = Mathf.Lerp(iter_74_2.color.r, 1, var_74_10)

							iter_74_2.color = Color.New(var_74_11, var_74_11, var_74_11)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_8 + var_74_9 and arg_71_1.time_ < var_74_8 + var_74_9 + arg_74_0 and arg_71_1.var_.actorSpriteComps1070 then
				local var_74_12 = 1

				for iter_74_3, iter_74_4 in pairs(arg_71_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_74_4 then
						iter_74_4.color = Color.New(var_74_12, var_74_12, var_74_12)
					end
				end

				arg_71_1.var_.actorSpriteComps1070 = nil
			end

			local var_74_13 = 0
			local var_74_14 = 0.05

			if var_74_13 < arg_71_1.time_ and arg_71_1.time_ <= var_74_13 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_15 = arg_71_1:FormatText(StoryNameCfg[318].name)

				arg_71_1.leftNameTxt_.text = var_74_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_16 = arg_71_1:GetWordFromCfg(910109019)
				local var_74_17 = arg_71_1:FormatText(var_74_16.content)

				arg_71_1.text_.text = var_74_17

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_18 = 2
				local var_74_19 = utf8.len(var_74_17)
				local var_74_20 = var_74_18 <= 0 and var_74_14 or var_74_14 * (var_74_19 / var_74_18)

				if var_74_20 > 0 and var_74_14 < var_74_20 then
					arg_71_1.talkMaxDuration = var_74_20

					if var_74_20 + var_74_13 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_20 + var_74_13
					end
				end

				arg_71_1.text_.text = var_74_17
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_21 = math.max(var_74_14, arg_71_1.talkMaxDuration)

			if var_74_13 <= arg_71_1.time_ and arg_71_1.time_ < var_74_13 + var_74_21 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_13) / var_74_21

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_13 + var_74_21 and arg_71_1.time_ < var_74_13 + var_74_21 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play910109020 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 910109020
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play910109021(arg_75_1)
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

				local var_78_2 = arg_75_1:FormatText(StoryNameCfg[318].name)

				arg_75_1.leftNameTxt_.text = var_78_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_3 = arg_75_1:GetWordFromCfg(910109020)
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
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_8 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_8 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_8

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_8 and arg_75_1.time_ < var_78_0 + var_78_8 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play910109021 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 910109021
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play910109022(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1070"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1070 = var_82_0.localPosition
				var_82_0.localScale = Vector3.New(1, 1, 1)

				arg_79_1:CheckSpriteTmpPos("1070", 3)

				local var_82_2 = var_82_0.childCount

				for iter_82_0 = 0, var_82_2 - 1 do
					local var_82_3 = var_82_0:GetChild(iter_82_0)

					if var_82_3.name == "split_7" or not string.find(var_82_3.name, "split") then
						var_82_3.gameObject:SetActive(true)
					else
						var_82_3.gameObject:SetActive(false)
					end
				end
			end

			local var_82_4 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_4 then
				local var_82_5 = (arg_79_1.time_ - var_82_1) / var_82_4
				local var_82_6 = Vector3.New(0, -350, -180)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1070, var_82_6, var_82_5)
			end

			if arg_79_1.time_ >= var_82_1 + var_82_4 and arg_79_1.time_ < var_82_1 + var_82_4 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_82_7 = 0
			local var_82_8 = 0.05

			if var_82_7 < arg_79_1.time_ and arg_79_1.time_ <= var_82_7 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_9 = arg_79_1:FormatText(StoryNameCfg[318].name)

				arg_79_1.leftNameTxt_.text = var_82_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_10 = arg_79_1:GetWordFromCfg(910109021)
				local var_82_11 = arg_79_1:FormatText(var_82_10.content)

				arg_79_1.text_.text = var_82_11

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_12 = 2
				local var_82_13 = utf8.len(var_82_11)
				local var_82_14 = var_82_12 <= 0 and var_82_8 or var_82_8 * (var_82_13 / var_82_12)

				if var_82_14 > 0 and var_82_8 < var_82_14 then
					arg_79_1.talkMaxDuration = var_82_14

					if var_82_14 + var_82_7 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_14 + var_82_7
					end
				end

				arg_79_1.text_.text = var_82_11
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_15 = math.max(var_82_8, arg_79_1.talkMaxDuration)

			if var_82_7 <= arg_79_1.time_ and arg_79_1.time_ < var_82_7 + var_82_15 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_7) / var_82_15

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_7 + var_82_15 and arg_79_1.time_ < var_82_7 + var_82_15 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play910109022 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 910109022
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play910109023(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 0.425

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_2 = arg_83_1:FormatText(StoryNameCfg[318].name)

				arg_83_1.leftNameTxt_.text = var_86_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_3 = arg_83_1:GetWordFromCfg(910109022)
				local var_86_4 = arg_83_1:FormatText(var_86_3.content)

				arg_83_1.text_.text = var_86_4

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_5 = 17
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
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_8 = math.max(var_86_1, arg_83_1.talkMaxDuration)

			if var_86_0 <= arg_83_1.time_ and arg_83_1.time_ < var_86_0 + var_86_8 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_0) / var_86_8

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_0 + var_86_8 and arg_83_1.time_ < var_86_0 + var_86_8 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play910109023 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 910109023
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play910109024(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 0.2

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[318].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(910109023)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 8
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
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_8 = math.max(var_90_1, arg_87_1.talkMaxDuration)

			if var_90_0 <= arg_87_1.time_ and arg_87_1.time_ < var_90_0 + var_90_8 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_0) / var_90_8

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_0 + var_90_8 and arg_87_1.time_ < var_90_0 + var_90_8 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play910109024 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 910109024
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play910109025(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1070"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1070 = var_94_0.localPosition
				var_94_0.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("1070", 4)

				local var_94_2 = var_94_0.childCount

				for iter_94_0 = 0, var_94_2 - 1 do
					local var_94_3 = var_94_0:GetChild(iter_94_0)

					if var_94_3.name == "split_4" or not string.find(var_94_3.name, "split") then
						var_94_3.gameObject:SetActive(true)
					else
						var_94_3.gameObject:SetActive(false)
					end
				end
			end

			local var_94_4 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_4 then
				local var_94_5 = (arg_91_1.time_ - var_94_1) / var_94_4
				local var_94_6 = Vector3.New(390, -350, -180)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1070, var_94_6, var_94_5)
			end

			if arg_91_1.time_ >= var_94_1 + var_94_4 and arg_91_1.time_ < var_94_1 + var_94_4 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_94_7 = arg_91_1.actors_["1039"].transform
			local var_94_8 = 0

			if var_94_8 < arg_91_1.time_ and arg_91_1.time_ <= var_94_8 + arg_94_0 then
				arg_91_1.var_.moveOldPos1039 = var_94_7.localPosition
				var_94_7.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("1039", 2)

				local var_94_9 = var_94_7.childCount

				for iter_94_1 = 0, var_94_9 - 1 do
					local var_94_10 = var_94_7:GetChild(iter_94_1)

					if var_94_10.name == "split_2" or not string.find(var_94_10.name, "split") then
						var_94_10.gameObject:SetActive(true)
					else
						var_94_10.gameObject:SetActive(false)
					end
				end
			end

			local var_94_11 = 0.001

			if var_94_8 <= arg_91_1.time_ and arg_91_1.time_ < var_94_8 + var_94_11 then
				local var_94_12 = (arg_91_1.time_ - var_94_8) / var_94_11
				local var_94_13 = Vector3.New(-390, -350, -180)

				var_94_7.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1039, var_94_13, var_94_12)
			end

			if arg_91_1.time_ >= var_94_8 + var_94_11 and arg_91_1.time_ < var_94_8 + var_94_11 + arg_94_0 then
				var_94_7.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_94_14 = arg_91_1.actors_["1039"]
			local var_94_15 = 0

			if var_94_15 < arg_91_1.time_ and arg_91_1.time_ <= var_94_15 + arg_94_0 and arg_91_1.var_.actorSpriteComps1039 == nil then
				arg_91_1.var_.actorSpriteComps1039 = var_94_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_16 = 0.0166666666666667

			if var_94_15 <= arg_91_1.time_ and arg_91_1.time_ < var_94_15 + var_94_16 then
				local var_94_17 = (arg_91_1.time_ - var_94_15) / var_94_16

				if arg_91_1.var_.actorSpriteComps1039 then
					for iter_94_2, iter_94_3 in pairs(arg_91_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_94_3 then
							local var_94_18 = Mathf.Lerp(iter_94_3.color.r, 1, var_94_17)

							iter_94_3.color = Color.New(var_94_18, var_94_18, var_94_18)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_15 + var_94_16 and arg_91_1.time_ < var_94_15 + var_94_16 + arg_94_0 and arg_91_1.var_.actorSpriteComps1039 then
				local var_94_19 = 1

				for iter_94_4, iter_94_5 in pairs(arg_91_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_94_5 then
						iter_94_5.color = Color.New(var_94_19, var_94_19, var_94_19)
					end
				end

				arg_91_1.var_.actorSpriteComps1039 = nil
			end

			local var_94_20 = arg_91_1.actors_["1070"]
			local var_94_21 = 0

			if var_94_21 < arg_91_1.time_ and arg_91_1.time_ <= var_94_21 + arg_94_0 and arg_91_1.var_.actorSpriteComps1070 == nil then
				arg_91_1.var_.actorSpriteComps1070 = var_94_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_22 = 0.0166666666666667

			if var_94_21 <= arg_91_1.time_ and arg_91_1.time_ < var_94_21 + var_94_22 then
				local var_94_23 = (arg_91_1.time_ - var_94_21) / var_94_22

				if arg_91_1.var_.actorSpriteComps1070 then
					for iter_94_6, iter_94_7 in pairs(arg_91_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_94_7 then
							local var_94_24 = Mathf.Lerp(iter_94_7.color.r, 0.5, var_94_23)

							iter_94_7.color = Color.New(var_94_24, var_94_24, var_94_24)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_21 + var_94_22 and arg_91_1.time_ < var_94_21 + var_94_22 + arg_94_0 and arg_91_1.var_.actorSpriteComps1070 then
				local var_94_25 = 0.5

				for iter_94_8, iter_94_9 in pairs(arg_91_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_94_9 then
						iter_94_9.color = Color.New(var_94_25, var_94_25, var_94_25)
					end
				end

				arg_91_1.var_.actorSpriteComps1070 = nil
			end

			local var_94_26 = arg_91_1.actors_["1039"]
			local var_94_27 = 0

			if var_94_27 < arg_91_1.time_ and arg_91_1.time_ <= var_94_27 + arg_94_0 then
				local var_94_28 = var_94_26:GetComponentInChildren(typeof(CanvasGroup))

				if var_94_28 then
					arg_91_1.var_.alphaOldValue1039 = var_94_28.alpha
					arg_91_1.var_.characterEffect1039 = var_94_28
				end

				arg_91_1.var_.alphaOldValue1039 = 0
			end

			local var_94_29 = 0.5

			if var_94_27 <= arg_91_1.time_ and arg_91_1.time_ < var_94_27 + var_94_29 then
				local var_94_30 = (arg_91_1.time_ - var_94_27) / var_94_29
				local var_94_31 = Mathf.Lerp(arg_91_1.var_.alphaOldValue1039, 1, var_94_30)

				if arg_91_1.var_.characterEffect1039 then
					arg_91_1.var_.characterEffect1039.alpha = var_94_31
				end
			end

			if arg_91_1.time_ >= var_94_27 + var_94_29 and arg_91_1.time_ < var_94_27 + var_94_29 + arg_94_0 and arg_91_1.var_.characterEffect1039 then
				arg_91_1.var_.characterEffect1039.alpha = 1
			end

			local var_94_32 = arg_91_1.actors_["1070"]
			local var_94_33 = 0

			if var_94_33 < arg_91_1.time_ and arg_91_1.time_ <= var_94_33 + arg_94_0 then
				local var_94_34 = var_94_32:GetComponentInChildren(typeof(CanvasGroup))

				if var_94_34 then
					arg_91_1.var_.alphaOldValue1070 = var_94_34.alpha
					arg_91_1.var_.characterEffect1070 = var_94_34
				end

				arg_91_1.var_.alphaOldValue1070 = 0
			end

			local var_94_35 = 0.5

			if var_94_33 <= arg_91_1.time_ and arg_91_1.time_ < var_94_33 + var_94_35 then
				local var_94_36 = (arg_91_1.time_ - var_94_33) / var_94_35
				local var_94_37 = Mathf.Lerp(arg_91_1.var_.alphaOldValue1070, 1, var_94_36)

				if arg_91_1.var_.characterEffect1070 then
					arg_91_1.var_.characterEffect1070.alpha = var_94_37
				end
			end

			if arg_91_1.time_ >= var_94_33 + var_94_35 and arg_91_1.time_ < var_94_33 + var_94_35 + arg_94_0 and arg_91_1.var_.characterEffect1070 then
				arg_91_1.var_.characterEffect1070.alpha = 1
			end

			local var_94_38 = arg_91_1.actors_["1070"].transform
			local var_94_39 = 0

			if var_94_39 < arg_91_1.time_ and arg_91_1.time_ <= var_94_39 + arg_94_0 then
				arg_91_1.var_.moveOldPos1070 = var_94_38.localPosition
				var_94_38.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("1070", 7)

				local var_94_40 = var_94_38.childCount

				for iter_94_10 = 0, var_94_40 - 1 do
					local var_94_41 = var_94_38:GetChild(iter_94_10)

					if var_94_41.name == "split_7" or not string.find(var_94_41.name, "split") then
						var_94_41.gameObject:SetActive(true)
					else
						var_94_41.gameObject:SetActive(false)
					end
				end
			end

			local var_94_42 = 0.001

			if var_94_39 <= arg_91_1.time_ and arg_91_1.time_ < var_94_39 + var_94_42 then
				local var_94_43 = (arg_91_1.time_ - var_94_39) / var_94_42
				local var_94_44 = Vector3.New(0, -2000, -180)

				var_94_38.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1070, var_94_44, var_94_43)
			end

			if arg_91_1.time_ >= var_94_39 + var_94_42 and arg_91_1.time_ < var_94_39 + var_94_42 + arg_94_0 then
				var_94_38.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_94_45 = 0
			local var_94_46 = 1.225

			if var_94_45 < arg_91_1.time_ and arg_91_1.time_ <= var_94_45 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_47 = arg_91_1:FormatText(StoryNameCfg[9].name)

				arg_91_1.leftNameTxt_.text = var_94_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_48 = arg_91_1:GetWordFromCfg(910109024)
				local var_94_49 = arg_91_1:FormatText(var_94_48.content)

				arg_91_1.text_.text = var_94_49

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_50 = 49
				local var_94_51 = utf8.len(var_94_49)
				local var_94_52 = var_94_50 <= 0 and var_94_46 or var_94_46 * (var_94_51 / var_94_50)

				if var_94_52 > 0 and var_94_46 < var_94_52 then
					arg_91_1.talkMaxDuration = var_94_52

					if var_94_52 + var_94_45 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_52 + var_94_45
					end
				end

				arg_91_1.text_.text = var_94_49
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_53 = math.max(var_94_46, arg_91_1.talkMaxDuration)

			if var_94_45 <= arg_91_1.time_ and arg_91_1.time_ < var_94_45 + var_94_53 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_45) / var_94_53

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_45 + var_94_53 and arg_91_1.time_ < var_94_45 + var_94_53 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play910109025 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 910109025
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play910109026(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1039"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.actorSpriteComps1039 == nil then
				arg_95_1.var_.actorSpriteComps1039 = var_98_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_2 = 0.0166666666666667

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.actorSpriteComps1039 then
					for iter_98_0, iter_98_1 in pairs(arg_95_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_98_1 then
							local var_98_4 = Mathf.Lerp(iter_98_1.color.r, 0.5, var_98_3)

							iter_98_1.color = Color.New(var_98_4, var_98_4, var_98_4)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.actorSpriteComps1039 then
				local var_98_5 = 0.5

				for iter_98_2, iter_98_3 in pairs(arg_95_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_98_3 then
						iter_98_3.color = Color.New(var_98_5, var_98_5, var_98_5)
					end
				end

				arg_95_1.var_.actorSpriteComps1039 = nil
			end

			local var_98_6 = arg_95_1.actors_["1070"]
			local var_98_7 = 0

			if var_98_7 < arg_95_1.time_ and arg_95_1.time_ <= var_98_7 + arg_98_0 and arg_95_1.var_.actorSpriteComps1070 == nil then
				arg_95_1.var_.actorSpriteComps1070 = var_98_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_8 = 0.0166666666666667

			if var_98_7 <= arg_95_1.time_ and arg_95_1.time_ < var_98_7 + var_98_8 then
				local var_98_9 = (arg_95_1.time_ - var_98_7) / var_98_8

				if arg_95_1.var_.actorSpriteComps1070 then
					for iter_98_4, iter_98_5 in pairs(arg_95_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_98_5 then
							local var_98_10 = Mathf.Lerp(iter_98_5.color.r, 1, var_98_9)

							iter_98_5.color = Color.New(var_98_10, var_98_10, var_98_10)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_7 + var_98_8 and arg_95_1.time_ < var_98_7 + var_98_8 + arg_98_0 and arg_95_1.var_.actorSpriteComps1070 then
				local var_98_11 = 1

				for iter_98_6, iter_98_7 in pairs(arg_95_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_98_7 then
						iter_98_7.color = Color.New(var_98_11, var_98_11, var_98_11)
					end
				end

				arg_95_1.var_.actorSpriteComps1070 = nil
			end

			local var_98_12 = 0
			local var_98_13 = 0.325

			if var_98_12 < arg_95_1.time_ and arg_95_1.time_ <= var_98_12 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_14 = arg_95_1:FormatText(StoryNameCfg[318].name)

				arg_95_1.leftNameTxt_.text = var_98_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_15 = arg_95_1:GetWordFromCfg(910109025)
				local var_98_16 = arg_95_1:FormatText(var_98_15.content)

				arg_95_1.text_.text = var_98_16

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_17 = 13
				local var_98_18 = utf8.len(var_98_16)
				local var_98_19 = var_98_17 <= 0 and var_98_13 or var_98_13 * (var_98_18 / var_98_17)

				if var_98_19 > 0 and var_98_13 < var_98_19 then
					arg_95_1.talkMaxDuration = var_98_19

					if var_98_19 + var_98_12 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_19 + var_98_12
					end
				end

				arg_95_1.text_.text = var_98_16
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_20 = math.max(var_98_13, arg_95_1.talkMaxDuration)

			if var_98_12 <= arg_95_1.time_ and arg_95_1.time_ < var_98_12 + var_98_20 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_12) / var_98_20

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_12 + var_98_20 and arg_95_1.time_ < var_98_12 + var_98_20 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play910109026 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 910109026
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play910109027(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1070"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.actorSpriteComps1070 == nil then
				arg_99_1.var_.actorSpriteComps1070 = var_102_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_2 = 0.0166666666666667

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.actorSpriteComps1070 then
					for iter_102_0, iter_102_1 in pairs(arg_99_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_102_1 then
							local var_102_4 = Mathf.Lerp(iter_102_1.color.r, 0.5, var_102_3)

							iter_102_1.color = Color.New(var_102_4, var_102_4, var_102_4)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.actorSpriteComps1070 then
				local var_102_5 = 0.5

				for iter_102_2, iter_102_3 in pairs(arg_99_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_102_3 then
						iter_102_3.color = Color.New(var_102_5, var_102_5, var_102_5)
					end
				end

				arg_99_1.var_.actorSpriteComps1070 = nil
			end

			local var_102_6 = arg_99_1.actors_["1039"]
			local var_102_7 = 0

			if var_102_7 < arg_99_1.time_ and arg_99_1.time_ <= var_102_7 + arg_102_0 and arg_99_1.var_.actorSpriteComps1039 == nil then
				arg_99_1.var_.actorSpriteComps1039 = var_102_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_8 = 0.0166666666666667

			if var_102_7 <= arg_99_1.time_ and arg_99_1.time_ < var_102_7 + var_102_8 then
				local var_102_9 = (arg_99_1.time_ - var_102_7) / var_102_8

				if arg_99_1.var_.actorSpriteComps1039 then
					for iter_102_4, iter_102_5 in pairs(arg_99_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_102_5 then
							local var_102_10 = Mathf.Lerp(iter_102_5.color.r, 1, var_102_9)

							iter_102_5.color = Color.New(var_102_10, var_102_10, var_102_10)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_7 + var_102_8 and arg_99_1.time_ < var_102_7 + var_102_8 + arg_102_0 and arg_99_1.var_.actorSpriteComps1039 then
				local var_102_11 = 1

				for iter_102_6, iter_102_7 in pairs(arg_99_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_102_7 then
						iter_102_7.color = Color.New(var_102_11, var_102_11, var_102_11)
					end
				end

				arg_99_1.var_.actorSpriteComps1039 = nil
			end

			local var_102_12 = 0
			local var_102_13 = 0.675

			if var_102_12 < arg_99_1.time_ and arg_99_1.time_ <= var_102_12 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_14 = arg_99_1:FormatText(StoryNameCfg[9].name)

				arg_99_1.leftNameTxt_.text = var_102_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_15 = arg_99_1:GetWordFromCfg(910109026)
				local var_102_16 = arg_99_1:FormatText(var_102_15.content)

				arg_99_1.text_.text = var_102_16

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_17 = 27
				local var_102_18 = utf8.len(var_102_16)
				local var_102_19 = var_102_17 <= 0 and var_102_13 or var_102_13 * (var_102_18 / var_102_17)

				if var_102_19 > 0 and var_102_13 < var_102_19 then
					arg_99_1.talkMaxDuration = var_102_19

					if var_102_19 + var_102_12 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_19 + var_102_12
					end
				end

				arg_99_1.text_.text = var_102_16
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_20 = math.max(var_102_13, arg_99_1.talkMaxDuration)

			if var_102_12 <= arg_99_1.time_ and arg_99_1.time_ < var_102_12 + var_102_20 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_12) / var_102_20

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_12 + var_102_20 and arg_99_1.time_ < var_102_12 + var_102_20 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play910109027 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 910109027
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play910109028(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1070"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.actorSpriteComps1070 == nil then
				arg_103_1.var_.actorSpriteComps1070 = var_106_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_2 = 0.0166666666666667

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.actorSpriteComps1070 then
					for iter_106_0, iter_106_1 in pairs(arg_103_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_106_1 then
							local var_106_4 = Mathf.Lerp(iter_106_1.color.r, 1, var_106_3)

							iter_106_1.color = Color.New(var_106_4, var_106_4, var_106_4)
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.actorSpriteComps1070 then
				local var_106_5 = 1

				for iter_106_2, iter_106_3 in pairs(arg_103_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_106_3 then
						iter_106_3.color = Color.New(var_106_5, var_106_5, var_106_5)
					end
				end

				arg_103_1.var_.actorSpriteComps1070 = nil
			end

			local var_106_6 = arg_103_1.actors_["1039"]
			local var_106_7 = 0

			if var_106_7 < arg_103_1.time_ and arg_103_1.time_ <= var_106_7 + arg_106_0 and arg_103_1.var_.actorSpriteComps1039 == nil then
				arg_103_1.var_.actorSpriteComps1039 = var_106_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_8 = 0.0166666666666667

			if var_106_7 <= arg_103_1.time_ and arg_103_1.time_ < var_106_7 + var_106_8 then
				local var_106_9 = (arg_103_1.time_ - var_106_7) / var_106_8

				if arg_103_1.var_.actorSpriteComps1039 then
					for iter_106_4, iter_106_5 in pairs(arg_103_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_106_5 then
							local var_106_10 = Mathf.Lerp(iter_106_5.color.r, 0.5, var_106_9)

							iter_106_5.color = Color.New(var_106_10, var_106_10, var_106_10)
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_7 + var_106_8 and arg_103_1.time_ < var_106_7 + var_106_8 + arg_106_0 and arg_103_1.var_.actorSpriteComps1039 then
				local var_106_11 = 0.5

				for iter_106_6, iter_106_7 in pairs(arg_103_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_106_7 then
						iter_106_7.color = Color.New(var_106_11, var_106_11, var_106_11)
					end
				end

				arg_103_1.var_.actorSpriteComps1039 = nil
			end

			local var_106_12 = 0
			local var_106_13 = 0.6

			if var_106_12 < arg_103_1.time_ and arg_103_1.time_ <= var_106_12 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_14 = arg_103_1:FormatText(StoryNameCfg[318].name)

				arg_103_1.leftNameTxt_.text = var_106_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_15 = arg_103_1:GetWordFromCfg(910109027)
				local var_106_16 = arg_103_1:FormatText(var_106_15.content)

				arg_103_1.text_.text = var_106_16

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_17 = 24
				local var_106_18 = utf8.len(var_106_16)
				local var_106_19 = var_106_17 <= 0 and var_106_13 or var_106_13 * (var_106_18 / var_106_17)

				if var_106_19 > 0 and var_106_13 < var_106_19 then
					arg_103_1.talkMaxDuration = var_106_19

					if var_106_19 + var_106_12 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_19 + var_106_12
					end
				end

				arg_103_1.text_.text = var_106_16
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_20 = math.max(var_106_13, arg_103_1.talkMaxDuration)

			if var_106_12 <= arg_103_1.time_ and arg_103_1.time_ < var_106_12 + var_106_20 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_12) / var_106_20

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_12 + var_106_20 and arg_103_1.time_ < var_106_12 + var_106_20 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play910109028 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 910109028
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play910109029(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1070"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.actorSpriteComps1070 == nil then
				arg_107_1.var_.actorSpriteComps1070 = var_110_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_2 = 0.0166666666666667

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.actorSpriteComps1070 then
					for iter_110_0, iter_110_1 in pairs(arg_107_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_110_1 then
							local var_110_4 = Mathf.Lerp(iter_110_1.color.r, 0.5, var_110_3)

							iter_110_1.color = Color.New(var_110_4, var_110_4, var_110_4)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.actorSpriteComps1070 then
				local var_110_5 = 0.5

				for iter_110_2, iter_110_3 in pairs(arg_107_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_110_3 then
						iter_110_3.color = Color.New(var_110_5, var_110_5, var_110_5)
					end
				end

				arg_107_1.var_.actorSpriteComps1070 = nil
			end

			local var_110_6 = arg_107_1.actors_["1039"]
			local var_110_7 = 0

			if var_110_7 < arg_107_1.time_ and arg_107_1.time_ <= var_110_7 + arg_110_0 and arg_107_1.var_.actorSpriteComps1039 == nil then
				arg_107_1.var_.actorSpriteComps1039 = var_110_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_8 = 0.0166666666666667

			if var_110_7 <= arg_107_1.time_ and arg_107_1.time_ < var_110_7 + var_110_8 then
				local var_110_9 = (arg_107_1.time_ - var_110_7) / var_110_8

				if arg_107_1.var_.actorSpriteComps1039 then
					for iter_110_4, iter_110_5 in pairs(arg_107_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_110_5 then
							local var_110_10 = Mathf.Lerp(iter_110_5.color.r, 1, var_110_9)

							iter_110_5.color = Color.New(var_110_10, var_110_10, var_110_10)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_7 + var_110_8 and arg_107_1.time_ < var_110_7 + var_110_8 + arg_110_0 and arg_107_1.var_.actorSpriteComps1039 then
				local var_110_11 = 1

				for iter_110_6, iter_110_7 in pairs(arg_107_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_110_7 then
						iter_110_7.color = Color.New(var_110_11, var_110_11, var_110_11)
					end
				end

				arg_107_1.var_.actorSpriteComps1039 = nil
			end

			local var_110_12 = arg_107_1.actors_["1039"].transform
			local var_110_13 = 0

			if var_110_13 < arg_107_1.time_ and arg_107_1.time_ <= var_110_13 + arg_110_0 then
				arg_107_1.var_.moveOldPos1039 = var_110_12.localPosition
				var_110_12.localScale = Vector3.New(1, 1, 1)

				arg_107_1:CheckSpriteTmpPos("1039", 2)

				local var_110_14 = var_110_12.childCount

				for iter_110_8 = 0, var_110_14 - 1 do
					local var_110_15 = var_110_12:GetChild(iter_110_8)

					if var_110_15.name == "split_1" or not string.find(var_110_15.name, "split") then
						var_110_15.gameObject:SetActive(true)
					else
						var_110_15.gameObject:SetActive(false)
					end
				end
			end

			local var_110_16 = 0.001

			if var_110_13 <= arg_107_1.time_ and arg_107_1.time_ < var_110_13 + var_110_16 then
				local var_110_17 = (arg_107_1.time_ - var_110_13) / var_110_16
				local var_110_18 = Vector3.New(-390, -350, -180)

				var_110_12.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1039, var_110_18, var_110_17)
			end

			if arg_107_1.time_ >= var_110_13 + var_110_16 and arg_107_1.time_ < var_110_13 + var_110_16 + arg_110_0 then
				var_110_12.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_110_19 = 0
			local var_110_20 = 0.425

			if var_110_19 < arg_107_1.time_ and arg_107_1.time_ <= var_110_19 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_21 = arg_107_1:FormatText(StoryNameCfg[9].name)

				arg_107_1.leftNameTxt_.text = var_110_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_22 = arg_107_1:GetWordFromCfg(910109028)
				local var_110_23 = arg_107_1:FormatText(var_110_22.content)

				arg_107_1.text_.text = var_110_23

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_24 = 17
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
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_27 = math.max(var_110_20, arg_107_1.talkMaxDuration)

			if var_110_19 <= arg_107_1.time_ and arg_107_1.time_ < var_110_19 + var_110_27 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_19) / var_110_27

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_19 + var_110_27 and arg_107_1.time_ < var_110_19 + var_110_27 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play910109029 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 910109029
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play910109030(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1070"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.actorSpriteComps1070 == nil then
				arg_111_1.var_.actorSpriteComps1070 = var_114_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_2 = 0.0166666666666667

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.actorSpriteComps1070 then
					for iter_114_0, iter_114_1 in pairs(arg_111_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_114_1 then
							local var_114_4 = Mathf.Lerp(iter_114_1.color.r, 1, var_114_3)

							iter_114_1.color = Color.New(var_114_4, var_114_4, var_114_4)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.actorSpriteComps1070 then
				local var_114_5 = 1

				for iter_114_2, iter_114_3 in pairs(arg_111_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_114_3 then
						iter_114_3.color = Color.New(var_114_5, var_114_5, var_114_5)
					end
				end

				arg_111_1.var_.actorSpriteComps1070 = nil
			end

			local var_114_6 = arg_111_1.actors_["1039"]
			local var_114_7 = 0

			if var_114_7 < arg_111_1.time_ and arg_111_1.time_ <= var_114_7 + arg_114_0 and arg_111_1.var_.actorSpriteComps1039 == nil then
				arg_111_1.var_.actorSpriteComps1039 = var_114_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_8 = 0.0166666666666667

			if var_114_7 <= arg_111_1.time_ and arg_111_1.time_ < var_114_7 + var_114_8 then
				local var_114_9 = (arg_111_1.time_ - var_114_7) / var_114_8

				if arg_111_1.var_.actorSpriteComps1039 then
					for iter_114_4, iter_114_5 in pairs(arg_111_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_114_5 then
							local var_114_10 = Mathf.Lerp(iter_114_5.color.r, 0.5, var_114_9)

							iter_114_5.color = Color.New(var_114_10, var_114_10, var_114_10)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_7 + var_114_8 and arg_111_1.time_ < var_114_7 + var_114_8 + arg_114_0 and arg_111_1.var_.actorSpriteComps1039 then
				local var_114_11 = 0.5

				for iter_114_6, iter_114_7 in pairs(arg_111_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_114_7 then
						iter_114_7.color = Color.New(var_114_11, var_114_11, var_114_11)
					end
				end

				arg_111_1.var_.actorSpriteComps1039 = nil
			end

			local var_114_12 = arg_111_1.actors_["1070"].transform
			local var_114_13 = 0

			if var_114_13 < arg_111_1.time_ and arg_111_1.time_ <= var_114_13 + arg_114_0 then
				arg_111_1.var_.moveOldPos1070 = var_114_12.localPosition
				var_114_12.localScale = Vector3.New(1, 1, 1)

				arg_111_1:CheckSpriteTmpPos("1070", 4)

				local var_114_14 = var_114_12.childCount

				for iter_114_8 = 0, var_114_14 - 1 do
					local var_114_15 = var_114_12:GetChild(iter_114_8)

					if var_114_15.name == "split_3" or not string.find(var_114_15.name, "split") then
						var_114_15.gameObject:SetActive(true)
					else
						var_114_15.gameObject:SetActive(false)
					end
				end
			end

			local var_114_16 = 0.001

			if var_114_13 <= arg_111_1.time_ and arg_111_1.time_ < var_114_13 + var_114_16 then
				local var_114_17 = (arg_111_1.time_ - var_114_13) / var_114_16
				local var_114_18 = Vector3.New(390, -350, -180)

				var_114_12.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1070, var_114_18, var_114_17)
			end

			if arg_111_1.time_ >= var_114_13 + var_114_16 and arg_111_1.time_ < var_114_13 + var_114_16 + arg_114_0 then
				var_114_12.localPosition = Vector3.New(390, -350, -180)
			end

			local var_114_19 = 0
			local var_114_20 = 1.475

			if var_114_19 < arg_111_1.time_ and arg_111_1.time_ <= var_114_19 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_21 = arg_111_1:FormatText(StoryNameCfg[318].name)

				arg_111_1.leftNameTxt_.text = var_114_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_22 = arg_111_1:GetWordFromCfg(910109029)
				local var_114_23 = arg_111_1:FormatText(var_114_22.content)

				arg_111_1.text_.text = var_114_23

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_24 = 59
				local var_114_25 = utf8.len(var_114_23)
				local var_114_26 = var_114_24 <= 0 and var_114_20 or var_114_20 * (var_114_25 / var_114_24)

				if var_114_26 > 0 and var_114_20 < var_114_26 then
					arg_111_1.talkMaxDuration = var_114_26

					if var_114_26 + var_114_19 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_26 + var_114_19
					end
				end

				arg_111_1.text_.text = var_114_23
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_27 = math.max(var_114_20, arg_111_1.talkMaxDuration)

			if var_114_19 <= arg_111_1.time_ and arg_111_1.time_ < var_114_19 + var_114_27 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_19) / var_114_27

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_19 + var_114_27 and arg_111_1.time_ < var_114_19 + var_114_27 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play910109030 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 910109030
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play910109031(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1070"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.actorSpriteComps1070 == nil then
				arg_115_1.var_.actorSpriteComps1070 = var_118_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_2 = 0.0166666666666667

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.actorSpriteComps1070 then
					for iter_118_0, iter_118_1 in pairs(arg_115_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_118_1 then
							local var_118_4 = Mathf.Lerp(iter_118_1.color.r, 0.5, var_118_3)

							iter_118_1.color = Color.New(var_118_4, var_118_4, var_118_4)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.actorSpriteComps1070 then
				local var_118_5 = 0.5

				for iter_118_2, iter_118_3 in pairs(arg_115_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_118_3 then
						iter_118_3.color = Color.New(var_118_5, var_118_5, var_118_5)
					end
				end

				arg_115_1.var_.actorSpriteComps1070 = nil
			end

			local var_118_6 = arg_115_1.actors_["1039"]
			local var_118_7 = 0

			if var_118_7 < arg_115_1.time_ and arg_115_1.time_ <= var_118_7 + arg_118_0 and arg_115_1.var_.actorSpriteComps1039 == nil then
				arg_115_1.var_.actorSpriteComps1039 = var_118_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_8 = 0.0166666666666667

			if var_118_7 <= arg_115_1.time_ and arg_115_1.time_ < var_118_7 + var_118_8 then
				local var_118_9 = (arg_115_1.time_ - var_118_7) / var_118_8

				if arg_115_1.var_.actorSpriteComps1039 then
					for iter_118_4, iter_118_5 in pairs(arg_115_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_118_5 then
							local var_118_10 = Mathf.Lerp(iter_118_5.color.r, 1, var_118_9)

							iter_118_5.color = Color.New(var_118_10, var_118_10, var_118_10)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_7 + var_118_8 and arg_115_1.time_ < var_118_7 + var_118_8 + arg_118_0 and arg_115_1.var_.actorSpriteComps1039 then
				local var_118_11 = 1

				for iter_118_6, iter_118_7 in pairs(arg_115_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_118_7 then
						iter_118_7.color = Color.New(var_118_11, var_118_11, var_118_11)
					end
				end

				arg_115_1.var_.actorSpriteComps1039 = nil
			end

			local var_118_12 = 0
			local var_118_13 = 0.075

			if var_118_12 < arg_115_1.time_ and arg_115_1.time_ <= var_118_12 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_14 = arg_115_1:FormatText(StoryNameCfg[9].name)

				arg_115_1.leftNameTxt_.text = var_118_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_15 = arg_115_1:GetWordFromCfg(910109030)
				local var_118_16 = arg_115_1:FormatText(var_118_15.content)

				arg_115_1.text_.text = var_118_16

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_17 = 3
				local var_118_18 = utf8.len(var_118_16)
				local var_118_19 = var_118_17 <= 0 and var_118_13 or var_118_13 * (var_118_18 / var_118_17)

				if var_118_19 > 0 and var_118_13 < var_118_19 then
					arg_115_1.talkMaxDuration = var_118_19

					if var_118_19 + var_118_12 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_19 + var_118_12
					end
				end

				arg_115_1.text_.text = var_118_16
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_20 = math.max(var_118_13, arg_115_1.talkMaxDuration)

			if var_118_12 <= arg_115_1.time_ and arg_115_1.time_ < var_118_12 + var_118_20 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_12) / var_118_20

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_12 + var_118_20 and arg_115_1.time_ < var_118_12 + var_118_20 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play910109031 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 910109031
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play910109032(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1070"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.actorSpriteComps1070 == nil then
				arg_119_1.var_.actorSpriteComps1070 = var_122_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_2 = 0.0166666666666667

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.actorSpriteComps1070 then
					for iter_122_0, iter_122_1 in pairs(arg_119_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_122_1 then
							local var_122_4 = Mathf.Lerp(iter_122_1.color.r, 0.5, var_122_3)

							iter_122_1.color = Color.New(var_122_4, var_122_4, var_122_4)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.actorSpriteComps1070 then
				local var_122_5 = 0.5

				for iter_122_2, iter_122_3 in pairs(arg_119_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_122_3 then
						iter_122_3.color = Color.New(var_122_5, var_122_5, var_122_5)
					end
				end

				arg_119_1.var_.actorSpriteComps1070 = nil
			end

			local var_122_6 = arg_119_1.actors_["1039"]
			local var_122_7 = 0

			if var_122_7 < arg_119_1.time_ and arg_119_1.time_ <= var_122_7 + arg_122_0 and arg_119_1.var_.actorSpriteComps1039 == nil then
				arg_119_1.var_.actorSpriteComps1039 = var_122_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_8 = 0.0166666666666667

			if var_122_7 <= arg_119_1.time_ and arg_119_1.time_ < var_122_7 + var_122_8 then
				local var_122_9 = (arg_119_1.time_ - var_122_7) / var_122_8

				if arg_119_1.var_.actorSpriteComps1039 then
					for iter_122_4, iter_122_5 in pairs(arg_119_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_122_5 then
							local var_122_10 = Mathf.Lerp(iter_122_5.color.r, 0.5, var_122_9)

							iter_122_5.color = Color.New(var_122_10, var_122_10, var_122_10)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_7 + var_122_8 and arg_119_1.time_ < var_122_7 + var_122_8 + arg_122_0 and arg_119_1.var_.actorSpriteComps1039 then
				local var_122_11 = 0.5

				for iter_122_6, iter_122_7 in pairs(arg_119_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_122_7 then
						iter_122_7.color = Color.New(var_122_11, var_122_11, var_122_11)
					end
				end

				arg_119_1.var_.actorSpriteComps1039 = nil
			end

			local var_122_12 = 0
			local var_122_13 = 0.475

			if var_122_12 < arg_119_1.time_ and arg_119_1.time_ <= var_122_12 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_14 = arg_119_1:FormatText(StoryNameCfg[7].name)

				arg_119_1.leftNameTxt_.text = var_122_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_15 = arg_119_1:GetWordFromCfg(910109031)
				local var_122_16 = arg_119_1:FormatText(var_122_15.content)

				arg_119_1.text_.text = var_122_16

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_17 = 19
				local var_122_18 = utf8.len(var_122_16)
				local var_122_19 = var_122_17 <= 0 and var_122_13 or var_122_13 * (var_122_18 / var_122_17)

				if var_122_19 > 0 and var_122_13 < var_122_19 then
					arg_119_1.talkMaxDuration = var_122_19

					if var_122_19 + var_122_12 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_19 + var_122_12
					end
				end

				arg_119_1.text_.text = var_122_16
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_20 = math.max(var_122_13, arg_119_1.talkMaxDuration)

			if var_122_12 <= arg_119_1.time_ and arg_119_1.time_ < var_122_12 + var_122_20 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_12) / var_122_20

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_12 + var_122_20 and arg_119_1.time_ < var_122_12 + var_122_20 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play910109032 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 910109032
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play910109033(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1070"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos1070 = var_126_0.localPosition
				var_126_0.localScale = Vector3.New(1, 1, 1)

				arg_123_1:CheckSpriteTmpPos("1070", 4)

				local var_126_2 = var_126_0.childCount

				for iter_126_0 = 0, var_126_2 - 1 do
					local var_126_3 = var_126_0:GetChild(iter_126_0)

					if var_126_3.name == "split_6" or not string.find(var_126_3.name, "split") then
						var_126_3.gameObject:SetActive(true)
					else
						var_126_3.gameObject:SetActive(false)
					end
				end
			end

			local var_126_4 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_4 then
				local var_126_5 = (arg_123_1.time_ - var_126_1) / var_126_4
				local var_126_6 = Vector3.New(390, -350, -180)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1070, var_126_6, var_126_5)
			end

			if arg_123_1.time_ >= var_126_1 + var_126_4 and arg_123_1.time_ < var_126_1 + var_126_4 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_126_7 = arg_123_1.actors_["1070"]
			local var_126_8 = 0

			if var_126_8 < arg_123_1.time_ and arg_123_1.time_ <= var_126_8 + arg_126_0 and arg_123_1.var_.actorSpriteComps1070 == nil then
				arg_123_1.var_.actorSpriteComps1070 = var_126_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_9 = 0.0166666666666667

			if var_126_8 <= arg_123_1.time_ and arg_123_1.time_ < var_126_8 + var_126_9 then
				local var_126_10 = (arg_123_1.time_ - var_126_8) / var_126_9

				if arg_123_1.var_.actorSpriteComps1070 then
					for iter_126_1, iter_126_2 in pairs(arg_123_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_126_2 then
							local var_126_11 = Mathf.Lerp(iter_126_2.color.r, 1, var_126_10)

							iter_126_2.color = Color.New(var_126_11, var_126_11, var_126_11)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_8 + var_126_9 and arg_123_1.time_ < var_126_8 + var_126_9 + arg_126_0 and arg_123_1.var_.actorSpriteComps1070 then
				local var_126_12 = 1

				for iter_126_3, iter_126_4 in pairs(arg_123_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_126_4 then
						iter_126_4.color = Color.New(var_126_12, var_126_12, var_126_12)
					end
				end

				arg_123_1.var_.actorSpriteComps1070 = nil
			end

			local var_126_13 = arg_123_1.actors_["1039"]
			local var_126_14 = 0

			if var_126_14 < arg_123_1.time_ and arg_123_1.time_ <= var_126_14 + arg_126_0 and arg_123_1.var_.actorSpriteComps1039 == nil then
				arg_123_1.var_.actorSpriteComps1039 = var_126_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_15 = 0.0166666666666667

			if var_126_14 <= arg_123_1.time_ and arg_123_1.time_ < var_126_14 + var_126_15 then
				local var_126_16 = (arg_123_1.time_ - var_126_14) / var_126_15

				if arg_123_1.var_.actorSpriteComps1039 then
					for iter_126_5, iter_126_6 in pairs(arg_123_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_126_6 then
							local var_126_17 = Mathf.Lerp(iter_126_6.color.r, 0.5, var_126_16)

							iter_126_6.color = Color.New(var_126_17, var_126_17, var_126_17)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_14 + var_126_15 and arg_123_1.time_ < var_126_14 + var_126_15 + arg_126_0 and arg_123_1.var_.actorSpriteComps1039 then
				local var_126_18 = 0.5

				for iter_126_7, iter_126_8 in pairs(arg_123_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_126_8 then
						iter_126_8.color = Color.New(var_126_18, var_126_18, var_126_18)
					end
				end

				arg_123_1.var_.actorSpriteComps1039 = nil
			end

			local var_126_19 = 0
			local var_126_20 = 1.275

			if var_126_19 < arg_123_1.time_ and arg_123_1.time_ <= var_126_19 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_21 = arg_123_1:FormatText(StoryNameCfg[318].name)

				arg_123_1.leftNameTxt_.text = var_126_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_22 = arg_123_1:GetWordFromCfg(910109032)
				local var_126_23 = arg_123_1:FormatText(var_126_22.content)

				arg_123_1.text_.text = var_126_23

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_24 = 51
				local var_126_25 = utf8.len(var_126_23)
				local var_126_26 = var_126_24 <= 0 and var_126_20 or var_126_20 * (var_126_25 / var_126_24)

				if var_126_26 > 0 and var_126_20 < var_126_26 then
					arg_123_1.talkMaxDuration = var_126_26

					if var_126_26 + var_126_19 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_26 + var_126_19
					end
				end

				arg_123_1.text_.text = var_126_23
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_27 = math.max(var_126_20, arg_123_1.talkMaxDuration)

			if var_126_19 <= arg_123_1.time_ and arg_123_1.time_ < var_126_19 + var_126_27 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_19) / var_126_27

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_19 + var_126_27 and arg_123_1.time_ < var_126_19 + var_126_27 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play910109033 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 910109033
		arg_127_1.duration_ = 5

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play910109034(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1070"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.actorSpriteComps1070 == nil then
				arg_127_1.var_.actorSpriteComps1070 = var_130_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_130_2 = 0.0166666666666667

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.actorSpriteComps1070 then
					for iter_130_0, iter_130_1 in pairs(arg_127_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_130_1 then
							local var_130_4 = Mathf.Lerp(iter_130_1.color.r, 0.5, var_130_3)

							iter_130_1.color = Color.New(var_130_4, var_130_4, var_130_4)
						end
					end
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.actorSpriteComps1070 then
				local var_130_5 = 0.5

				for iter_130_2, iter_130_3 in pairs(arg_127_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_130_3 then
						iter_130_3.color = Color.New(var_130_5, var_130_5, var_130_5)
					end
				end

				arg_127_1.var_.actorSpriteComps1070 = nil
			end

			local var_130_6 = arg_127_1.actors_["1039"].transform
			local var_130_7 = 0

			if var_130_7 < arg_127_1.time_ and arg_127_1.time_ <= var_130_7 + arg_130_0 then
				arg_127_1.var_.moveOldPos1039 = var_130_6.localPosition
				var_130_6.localScale = Vector3.New(1, 1, 1)

				arg_127_1:CheckSpriteTmpPos("1039", 2)

				local var_130_8 = var_130_6.childCount

				for iter_130_4 = 0, var_130_8 - 1 do
					local var_130_9 = var_130_6:GetChild(iter_130_4)

					if var_130_9.name == "split_4_1" or not string.find(var_130_9.name, "split") then
						var_130_9.gameObject:SetActive(true)
					else
						var_130_9.gameObject:SetActive(false)
					end
				end
			end

			local var_130_10 = 0.001

			if var_130_7 <= arg_127_1.time_ and arg_127_1.time_ < var_130_7 + var_130_10 then
				local var_130_11 = (arg_127_1.time_ - var_130_7) / var_130_10
				local var_130_12 = Vector3.New(-390, -350, -180)

				var_130_6.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1039, var_130_12, var_130_11)
			end

			if arg_127_1.time_ >= var_130_7 + var_130_10 and arg_127_1.time_ < var_130_7 + var_130_10 + arg_130_0 then
				var_130_6.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_130_13 = arg_127_1.actors_["1039"]
			local var_130_14 = 0

			if var_130_14 < arg_127_1.time_ and arg_127_1.time_ <= var_130_14 + arg_130_0 and arg_127_1.var_.actorSpriteComps1039 == nil then
				arg_127_1.var_.actorSpriteComps1039 = var_130_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_130_15 = 0.0166666666666667

			if var_130_14 <= arg_127_1.time_ and arg_127_1.time_ < var_130_14 + var_130_15 then
				local var_130_16 = (arg_127_1.time_ - var_130_14) / var_130_15

				if arg_127_1.var_.actorSpriteComps1039 then
					for iter_130_5, iter_130_6 in pairs(arg_127_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_130_6 then
							local var_130_17 = Mathf.Lerp(iter_130_6.color.r, 1, var_130_16)

							iter_130_6.color = Color.New(var_130_17, var_130_17, var_130_17)
						end
					end
				end
			end

			if arg_127_1.time_ >= var_130_14 + var_130_15 and arg_127_1.time_ < var_130_14 + var_130_15 + arg_130_0 and arg_127_1.var_.actorSpriteComps1039 then
				local var_130_18 = 1

				for iter_130_7, iter_130_8 in pairs(arg_127_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_130_8 then
						iter_130_8.color = Color.New(var_130_18, var_130_18, var_130_18)
					end
				end

				arg_127_1.var_.actorSpriteComps1039 = nil
			end

			local var_130_19 = 0
			local var_130_20 = 0.15

			if var_130_19 < arg_127_1.time_ and arg_127_1.time_ <= var_130_19 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_21 = arg_127_1:FormatText(StoryNameCfg[9].name)

				arg_127_1.leftNameTxt_.text = var_130_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_22 = arg_127_1:GetWordFromCfg(910109033)
				local var_130_23 = arg_127_1:FormatText(var_130_22.content)

				arg_127_1.text_.text = var_130_23

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_24 = 6
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
				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_27 = math.max(var_130_20, arg_127_1.talkMaxDuration)

			if var_130_19 <= arg_127_1.time_ and arg_127_1.time_ < var_130_19 + var_130_27 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_19) / var_130_27

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_19 + var_130_27 and arg_127_1.time_ < var_130_19 + var_130_27 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play910109034 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 910109034
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play910109035(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1070"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos1070 = var_134_0.localPosition
				var_134_0.localScale = Vector3.New(1, 1, 1)

				arg_131_1:CheckSpriteTmpPos("1070", 4)

				local var_134_2 = var_134_0.childCount

				for iter_134_0 = 0, var_134_2 - 1 do
					local var_134_3 = var_134_0:GetChild(iter_134_0)

					if var_134_3.name == "split_4" or not string.find(var_134_3.name, "split") then
						var_134_3.gameObject:SetActive(true)
					else
						var_134_3.gameObject:SetActive(false)
					end
				end
			end

			local var_134_4 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_4 then
				local var_134_5 = (arg_131_1.time_ - var_134_1) / var_134_4
				local var_134_6 = Vector3.New(390, -350, -180)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1070, var_134_6, var_134_5)
			end

			if arg_131_1.time_ >= var_134_1 + var_134_4 and arg_131_1.time_ < var_134_1 + var_134_4 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_134_7 = arg_131_1.actors_["1070"]
			local var_134_8 = 0

			if var_134_8 < arg_131_1.time_ and arg_131_1.time_ <= var_134_8 + arg_134_0 and arg_131_1.var_.actorSpriteComps1070 == nil then
				arg_131_1.var_.actorSpriteComps1070 = var_134_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_134_9 = 0.0166666666666667

			if var_134_8 <= arg_131_1.time_ and arg_131_1.time_ < var_134_8 + var_134_9 then
				local var_134_10 = (arg_131_1.time_ - var_134_8) / var_134_9

				if arg_131_1.var_.actorSpriteComps1070 then
					for iter_134_1, iter_134_2 in pairs(arg_131_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_134_2 then
							local var_134_11 = Mathf.Lerp(iter_134_2.color.r, 1, var_134_10)

							iter_134_2.color = Color.New(var_134_11, var_134_11, var_134_11)
						end
					end
				end
			end

			if arg_131_1.time_ >= var_134_8 + var_134_9 and arg_131_1.time_ < var_134_8 + var_134_9 + arg_134_0 and arg_131_1.var_.actorSpriteComps1070 then
				local var_134_12 = 1

				for iter_134_3, iter_134_4 in pairs(arg_131_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_134_4 then
						iter_134_4.color = Color.New(var_134_12, var_134_12, var_134_12)
					end
				end

				arg_131_1.var_.actorSpriteComps1070 = nil
			end

			local var_134_13 = arg_131_1.actors_["1039"]
			local var_134_14 = 0

			if var_134_14 < arg_131_1.time_ and arg_131_1.time_ <= var_134_14 + arg_134_0 and arg_131_1.var_.actorSpriteComps1039 == nil then
				arg_131_1.var_.actorSpriteComps1039 = var_134_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_134_15 = 0.0166666666666667

			if var_134_14 <= arg_131_1.time_ and arg_131_1.time_ < var_134_14 + var_134_15 then
				local var_134_16 = (arg_131_1.time_ - var_134_14) / var_134_15

				if arg_131_1.var_.actorSpriteComps1039 then
					for iter_134_5, iter_134_6 in pairs(arg_131_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_134_6 then
							local var_134_17 = Mathf.Lerp(iter_134_6.color.r, 0.5, var_134_16)

							iter_134_6.color = Color.New(var_134_17, var_134_17, var_134_17)
						end
					end
				end
			end

			if arg_131_1.time_ >= var_134_14 + var_134_15 and arg_131_1.time_ < var_134_14 + var_134_15 + arg_134_0 and arg_131_1.var_.actorSpriteComps1039 then
				local var_134_18 = 0.5

				for iter_134_7, iter_134_8 in pairs(arg_131_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_134_8 then
						iter_134_8.color = Color.New(var_134_18, var_134_18, var_134_18)
					end
				end

				arg_131_1.var_.actorSpriteComps1039 = nil
			end

			local var_134_19 = 0
			local var_134_20 = 0.825

			if var_134_19 < arg_131_1.time_ and arg_131_1.time_ <= var_134_19 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_21 = arg_131_1:FormatText(StoryNameCfg[318].name)

				arg_131_1.leftNameTxt_.text = var_134_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_22 = arg_131_1:GetWordFromCfg(910109034)
				local var_134_23 = arg_131_1:FormatText(var_134_22.content)

				arg_131_1.text_.text = var_134_23

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_24 = 33
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
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_27 = math.max(var_134_20, arg_131_1.talkMaxDuration)

			if var_134_19 <= arg_131_1.time_ and arg_131_1.time_ < var_134_19 + var_134_27 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_19) / var_134_27

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_19 + var_134_27 and arg_131_1.time_ < var_134_19 + var_134_27 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play910109035 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 910109035
		arg_135_1.duration_ = 5

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play910109036(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1039"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.actorSpriteComps1039 == nil then
				arg_135_1.var_.actorSpriteComps1039 = var_138_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_138_2 = 0.0166666666666667

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.actorSpriteComps1039 then
					for iter_138_0, iter_138_1 in pairs(arg_135_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_138_1 then
							local var_138_4 = Mathf.Lerp(iter_138_1.color.r, 1, var_138_3)

							iter_138_1.color = Color.New(var_138_4, var_138_4, var_138_4)
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.actorSpriteComps1039 then
				local var_138_5 = 1

				for iter_138_2, iter_138_3 in pairs(arg_135_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_138_3 then
						iter_138_3.color = Color.New(var_138_5, var_138_5, var_138_5)
					end
				end

				arg_135_1.var_.actorSpriteComps1039 = nil
			end

			local var_138_6 = arg_135_1.actors_["1070"]
			local var_138_7 = 0

			if var_138_7 < arg_135_1.time_ and arg_135_1.time_ <= var_138_7 + arg_138_0 and arg_135_1.var_.actorSpriteComps1070 == nil then
				arg_135_1.var_.actorSpriteComps1070 = var_138_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_138_8 = 0.0166666666666667

			if var_138_7 <= arg_135_1.time_ and arg_135_1.time_ < var_138_7 + var_138_8 then
				local var_138_9 = (arg_135_1.time_ - var_138_7) / var_138_8

				if arg_135_1.var_.actorSpriteComps1070 then
					for iter_138_4, iter_138_5 in pairs(arg_135_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_138_5 then
							local var_138_10 = Mathf.Lerp(iter_138_5.color.r, 0.5, var_138_9)

							iter_138_5.color = Color.New(var_138_10, var_138_10, var_138_10)
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_7 + var_138_8 and arg_135_1.time_ < var_138_7 + var_138_8 + arg_138_0 and arg_135_1.var_.actorSpriteComps1070 then
				local var_138_11 = 0.5

				for iter_138_6, iter_138_7 in pairs(arg_135_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_138_7 then
						iter_138_7.color = Color.New(var_138_11, var_138_11, var_138_11)
					end
				end

				arg_135_1.var_.actorSpriteComps1070 = nil
			end

			local var_138_12 = 0
			local var_138_13 = 0.825

			if var_138_12 < arg_135_1.time_ and arg_135_1.time_ <= var_138_12 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_14 = arg_135_1:FormatText(StoryNameCfg[9].name)

				arg_135_1.leftNameTxt_.text = var_138_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_15 = arg_135_1:GetWordFromCfg(910109035)
				local var_138_16 = arg_135_1:FormatText(var_138_15.content)

				arg_135_1.text_.text = var_138_16

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_17 = 33
				local var_138_18 = utf8.len(var_138_16)
				local var_138_19 = var_138_17 <= 0 and var_138_13 or var_138_13 * (var_138_18 / var_138_17)

				if var_138_19 > 0 and var_138_13 < var_138_19 then
					arg_135_1.talkMaxDuration = var_138_19

					if var_138_19 + var_138_12 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_19 + var_138_12
					end
				end

				arg_135_1.text_.text = var_138_16
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_20 = math.max(var_138_13, arg_135_1.talkMaxDuration)

			if var_138_12 <= arg_135_1.time_ and arg_135_1.time_ < var_138_12 + var_138_20 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_12) / var_138_20

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_12 + var_138_20 and arg_135_1.time_ < var_138_12 + var_138_20 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play910109036 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 910109036
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play910109037(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1070"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos1070 = var_142_0.localPosition
				var_142_0.localScale = Vector3.New(1, 1, 1)

				arg_139_1:CheckSpriteTmpPos("1070", 3)

				local var_142_2 = var_142_0.childCount

				for iter_142_0 = 0, var_142_2 - 1 do
					local var_142_3 = var_142_0:GetChild(iter_142_0)

					if var_142_3.name == "split_1" or not string.find(var_142_3.name, "split") then
						var_142_3.gameObject:SetActive(true)
					else
						var_142_3.gameObject:SetActive(false)
					end
				end
			end

			local var_142_4 = 0.001

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_4 then
				local var_142_5 = (arg_139_1.time_ - var_142_1) / var_142_4
				local var_142_6 = Vector3.New(0, -350, -180)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1070, var_142_6, var_142_5)
			end

			if arg_139_1.time_ >= var_142_1 + var_142_4 and arg_139_1.time_ < var_142_1 + var_142_4 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_142_7 = arg_139_1.actors_["1039"].transform
			local var_142_8 = 0

			if var_142_8 < arg_139_1.time_ and arg_139_1.time_ <= var_142_8 + arg_142_0 then
				arg_139_1.var_.moveOldPos1039 = var_142_7.localPosition
				var_142_7.localScale = Vector3.New(1, 1, 1)

				arg_139_1:CheckSpriteTmpPos("1039", 7)

				local var_142_9 = var_142_7.childCount

				for iter_142_1 = 0, var_142_9 - 1 do
					local var_142_10 = var_142_7:GetChild(iter_142_1)

					if var_142_10.name == "split_4_1" or not string.find(var_142_10.name, "split") then
						var_142_10.gameObject:SetActive(true)
					else
						var_142_10.gameObject:SetActive(false)
					end
				end
			end

			local var_142_11 = 0.001

			if var_142_8 <= arg_139_1.time_ and arg_139_1.time_ < var_142_8 + var_142_11 then
				local var_142_12 = (arg_139_1.time_ - var_142_8) / var_142_11
				local var_142_13 = Vector3.New(0, -2000, -180)

				var_142_7.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1039, var_142_13, var_142_12)
			end

			if arg_139_1.time_ >= var_142_8 + var_142_11 and arg_139_1.time_ < var_142_8 + var_142_11 + arg_142_0 then
				var_142_7.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_142_14 = arg_139_1.actors_["1070"].transform
			local var_142_15 = 0

			if var_142_15 < arg_139_1.time_ and arg_139_1.time_ <= var_142_15 + arg_142_0 then
				arg_139_1.var_.moveOldPos1070 = var_142_14.localPosition
				var_142_14.localScale = Vector3.New(1, 1, 1)

				arg_139_1:CheckSpriteTmpPos("1070", 7)

				local var_142_16 = var_142_14.childCount

				for iter_142_2 = 0, var_142_16 - 1 do
					local var_142_17 = var_142_14:GetChild(iter_142_2)

					if var_142_17.name == "split_4" or not string.find(var_142_17.name, "split") then
						var_142_17.gameObject:SetActive(true)
					else
						var_142_17.gameObject:SetActive(false)
					end
				end
			end

			local var_142_18 = 0.001

			if var_142_15 <= arg_139_1.time_ and arg_139_1.time_ < var_142_15 + var_142_18 then
				local var_142_19 = (arg_139_1.time_ - var_142_15) / var_142_18
				local var_142_20 = Vector3.New(0, -2000, -180)

				var_142_14.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1070, var_142_20, var_142_19)
			end

			if arg_139_1.time_ >= var_142_15 + var_142_18 and arg_139_1.time_ < var_142_15 + var_142_18 + arg_142_0 then
				var_142_14.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_142_21 = arg_139_1.actors_["1070"]
			local var_142_22 = 0

			if var_142_22 < arg_139_1.time_ and arg_139_1.time_ <= var_142_22 + arg_142_0 then
				local var_142_23 = var_142_21:GetComponentInChildren(typeof(CanvasGroup))

				if var_142_23 then
					arg_139_1.var_.alphaOldValue1070 = var_142_23.alpha
					arg_139_1.var_.characterEffect1070 = var_142_23
				end

				arg_139_1.var_.alphaOldValue1070 = 0
			end

			local var_142_24 = 0.5

			if var_142_22 <= arg_139_1.time_ and arg_139_1.time_ < var_142_22 + var_142_24 then
				local var_142_25 = (arg_139_1.time_ - var_142_22) / var_142_24
				local var_142_26 = Mathf.Lerp(arg_139_1.var_.alphaOldValue1070, 1, var_142_25)

				if arg_139_1.var_.characterEffect1070 then
					arg_139_1.var_.characterEffect1070.alpha = var_142_26
				end
			end

			if arg_139_1.time_ >= var_142_22 + var_142_24 and arg_139_1.time_ < var_142_22 + var_142_24 + arg_142_0 and arg_139_1.var_.characterEffect1070 then
				arg_139_1.var_.characterEffect1070.alpha = 1
			end

			local var_142_27 = 0
			local var_142_28 = 0.15

			if var_142_27 < arg_139_1.time_ and arg_139_1.time_ <= var_142_27 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_29 = arg_139_1:FormatText(StoryNameCfg[318].name)

				arg_139_1.leftNameTxt_.text = var_142_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_30 = arg_139_1:GetWordFromCfg(910109036)
				local var_142_31 = arg_139_1:FormatText(var_142_30.content)

				arg_139_1.text_.text = var_142_31

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_32 = 6
				local var_142_33 = utf8.len(var_142_31)
				local var_142_34 = var_142_32 <= 0 and var_142_28 or var_142_28 * (var_142_33 / var_142_32)

				if var_142_34 > 0 and var_142_28 < var_142_34 then
					arg_139_1.talkMaxDuration = var_142_34

					if var_142_34 + var_142_27 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_34 + var_142_27
					end
				end

				arg_139_1.text_.text = var_142_31
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_35 = math.max(var_142_28, arg_139_1.talkMaxDuration)

			if var_142_27 <= arg_139_1.time_ and arg_139_1.time_ < var_142_27 + var_142_35 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_27) / var_142_35

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_27 + var_142_35 and arg_139_1.time_ < var_142_27 + var_142_35 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play910109037 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 910109037
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play910109038(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1070"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.actorSpriteComps1070 == nil then
				arg_143_1.var_.actorSpriteComps1070 = var_146_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_146_2 = 0.0166666666666667

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.actorSpriteComps1070 then
					for iter_146_0, iter_146_1 in pairs(arg_143_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_146_1 then
							local var_146_4 = Mathf.Lerp(iter_146_1.color.r, 0.5, var_146_3)

							iter_146_1.color = Color.New(var_146_4, var_146_4, var_146_4)
						end
					end
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.actorSpriteComps1070 then
				local var_146_5 = 0.5

				for iter_146_2, iter_146_3 in pairs(arg_143_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_146_3 then
						iter_146_3.color = Color.New(var_146_5, var_146_5, var_146_5)
					end
				end

				arg_143_1.var_.actorSpriteComps1070 = nil
			end

			local var_146_6 = 0
			local var_146_7 = 0.275

			if var_146_6 < arg_143_1.time_ and arg_143_1.time_ <= var_146_6 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_8 = arg_143_1:FormatText(StoryNameCfg[7].name)

				arg_143_1.leftNameTxt_.text = var_146_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_9 = arg_143_1:GetWordFromCfg(910109037)
				local var_146_10 = arg_143_1:FormatText(var_146_9.content)

				arg_143_1.text_.text = var_146_10

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_11 = 11
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
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_14 = math.max(var_146_7, arg_143_1.talkMaxDuration)

			if var_146_6 <= arg_143_1.time_ and arg_143_1.time_ < var_146_6 + var_146_14 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_6) / var_146_14

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_6 + var_146_14 and arg_143_1.time_ < var_146_6 + var_146_14 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play910109038 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 910109038
		arg_147_1.duration_ = 5

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play910109039(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1070"]
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 and arg_147_1.var_.actorSpriteComps1070 == nil then
				arg_147_1.var_.actorSpriteComps1070 = var_150_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_150_2 = 0.0166666666666667

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2

				if arg_147_1.var_.actorSpriteComps1070 then
					for iter_150_0, iter_150_1 in pairs(arg_147_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_150_1 then
							local var_150_4 = Mathf.Lerp(iter_150_1.color.r, 1, var_150_3)

							iter_150_1.color = Color.New(var_150_4, var_150_4, var_150_4)
						end
					end
				end
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 and arg_147_1.var_.actorSpriteComps1070 then
				local var_150_5 = 1

				for iter_150_2, iter_150_3 in pairs(arg_147_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_150_3 then
						iter_150_3.color = Color.New(var_150_5, var_150_5, var_150_5)
					end
				end

				arg_147_1.var_.actorSpriteComps1070 = nil
			end

			local var_150_6 = 0
			local var_150_7 = 0.85

			if var_150_6 < arg_147_1.time_ and arg_147_1.time_ <= var_150_6 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_8 = arg_147_1:FormatText(StoryNameCfg[318].name)

				arg_147_1.leftNameTxt_.text = var_150_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_9 = arg_147_1:GetWordFromCfg(910109038)
				local var_150_10 = arg_147_1:FormatText(var_150_9.content)

				arg_147_1.text_.text = var_150_10

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_11 = 34
				local var_150_12 = utf8.len(var_150_10)
				local var_150_13 = var_150_11 <= 0 and var_150_7 or var_150_7 * (var_150_12 / var_150_11)

				if var_150_13 > 0 and var_150_7 < var_150_13 then
					arg_147_1.talkMaxDuration = var_150_13

					if var_150_13 + var_150_6 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_13 + var_150_6
					end
				end

				arg_147_1.text_.text = var_150_10
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)
				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_14 = math.max(var_150_7, arg_147_1.talkMaxDuration)

			if var_150_6 <= arg_147_1.time_ and arg_147_1.time_ < var_150_6 + var_150_14 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_6) / var_150_14

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_6 + var_150_14 and arg_147_1.time_ < var_150_6 + var_150_14 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play910109039 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 910109039
		arg_151_1.duration_ = 5

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play910109040(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1070"].transform
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1.var_.moveOldPos1070 = var_154_0.localPosition
				var_154_0.localScale = Vector3.New(1, 1, 1)

				arg_151_1:CheckSpriteTmpPos("1070", 3)

				local var_154_2 = var_154_0.childCount

				for iter_154_0 = 0, var_154_2 - 1 do
					local var_154_3 = var_154_0:GetChild(iter_154_0)

					if var_154_3.name == "split_6" or not string.find(var_154_3.name, "split") then
						var_154_3.gameObject:SetActive(true)
					else
						var_154_3.gameObject:SetActive(false)
					end
				end
			end

			local var_154_4 = 0.001

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_4 then
				local var_154_5 = (arg_151_1.time_ - var_154_1) / var_154_4
				local var_154_6 = Vector3.New(0, -350, -180)

				var_154_0.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1070, var_154_6, var_154_5)
			end

			if arg_151_1.time_ >= var_154_1 + var_154_4 and arg_151_1.time_ < var_154_1 + var_154_4 + arg_154_0 then
				var_154_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_154_7 = arg_151_1.actors_["1070"]
			local var_154_8 = 0

			if var_154_8 < arg_151_1.time_ and arg_151_1.time_ <= var_154_8 + arg_154_0 and arg_151_1.var_.actorSpriteComps1070 == nil then
				arg_151_1.var_.actorSpriteComps1070 = var_154_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_9 = 0.0166666666666667

			if var_154_8 <= arg_151_1.time_ and arg_151_1.time_ < var_154_8 + var_154_9 then
				local var_154_10 = (arg_151_1.time_ - var_154_8) / var_154_9

				if arg_151_1.var_.actorSpriteComps1070 then
					for iter_154_1, iter_154_2 in pairs(arg_151_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_154_2 then
							local var_154_11 = Mathf.Lerp(iter_154_2.color.r, 1, var_154_10)

							iter_154_2.color = Color.New(var_154_11, var_154_11, var_154_11)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_8 + var_154_9 and arg_151_1.time_ < var_154_8 + var_154_9 + arg_154_0 and arg_151_1.var_.actorSpriteComps1070 then
				local var_154_12 = 1

				for iter_154_3, iter_154_4 in pairs(arg_151_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_154_4 then
						iter_154_4.color = Color.New(var_154_12, var_154_12, var_154_12)
					end
				end

				arg_151_1.var_.actorSpriteComps1070 = nil
			end

			local var_154_13 = 0
			local var_154_14 = 0.875

			if var_154_13 < arg_151_1.time_ and arg_151_1.time_ <= var_154_13 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_15 = arg_151_1:FormatText(StoryNameCfg[318].name)

				arg_151_1.leftNameTxt_.text = var_154_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_16 = arg_151_1:GetWordFromCfg(910109039)
				local var_154_17 = arg_151_1:FormatText(var_154_16.content)

				arg_151_1.text_.text = var_154_17

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_18 = 35
				local var_154_19 = utf8.len(var_154_17)
				local var_154_20 = var_154_18 <= 0 and var_154_14 or var_154_14 * (var_154_19 / var_154_18)

				if var_154_20 > 0 and var_154_14 < var_154_20 then
					arg_151_1.talkMaxDuration = var_154_20

					if var_154_20 + var_154_13 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_20 + var_154_13
					end
				end

				arg_151_1.text_.text = var_154_17
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)
				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_21 = math.max(var_154_14, arg_151_1.talkMaxDuration)

			if var_154_13 <= arg_151_1.time_ and arg_151_1.time_ < var_154_13 + var_154_21 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_13) / var_154_21

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_13 + var_154_21 and arg_151_1.time_ < var_154_13 + var_154_21 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play910109040 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 910109040
		arg_155_1.duration_ = 5

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play910109041(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1070"]
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 and arg_155_1.var_.actorSpriteComps1070 == nil then
				arg_155_1.var_.actorSpriteComps1070 = var_158_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_2 = 0.0166666666666667

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2

				if arg_155_1.var_.actorSpriteComps1070 then
					for iter_158_0, iter_158_1 in pairs(arg_155_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_158_1 then
							local var_158_4 = Mathf.Lerp(iter_158_1.color.r, 0.5, var_158_3)

							iter_158_1.color = Color.New(var_158_4, var_158_4, var_158_4)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 and arg_155_1.var_.actorSpriteComps1070 then
				local var_158_5 = 0.5

				for iter_158_2, iter_158_3 in pairs(arg_155_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_158_3 then
						iter_158_3.color = Color.New(var_158_5, var_158_5, var_158_5)
					end
				end

				arg_155_1.var_.actorSpriteComps1070 = nil
			end

			local var_158_6 = 0
			local var_158_7 = 1

			if var_158_6 < arg_155_1.time_ and arg_155_1.time_ <= var_158_6 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_8 = arg_155_1:FormatText(StoryNameCfg[7].name)

				arg_155_1.leftNameTxt_.text = var_158_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_9 = arg_155_1:GetWordFromCfg(910109040)
				local var_158_10 = arg_155_1:FormatText(var_158_9.content)

				arg_155_1.text_.text = var_158_10

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_11 = 40
				local var_158_12 = utf8.len(var_158_10)
				local var_158_13 = var_158_11 <= 0 and var_158_7 or var_158_7 * (var_158_12 / var_158_11)

				if var_158_13 > 0 and var_158_7 < var_158_13 then
					arg_155_1.talkMaxDuration = var_158_13

					if var_158_13 + var_158_6 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_13 + var_158_6
					end
				end

				arg_155_1.text_.text = var_158_10
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)
				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_14 = math.max(var_158_7, arg_155_1.talkMaxDuration)

			if var_158_6 <= arg_155_1.time_ and arg_155_1.time_ < var_158_6 + var_158_14 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_6) / var_158_14

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_6 + var_158_14 and arg_155_1.time_ < var_158_6 + var_158_14 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play910109041 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 910109041
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play910109042(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1070"].transform
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1.var_.moveOldPos1070 = var_162_0.localPosition
				var_162_0.localScale = Vector3.New(1, 1, 1)

				arg_159_1:CheckSpriteTmpPos("1070", 3)

				local var_162_2 = var_162_0.childCount

				for iter_162_0 = 0, var_162_2 - 1 do
					local var_162_3 = var_162_0:GetChild(iter_162_0)

					if var_162_3.name == "split_7" or not string.find(var_162_3.name, "split") then
						var_162_3.gameObject:SetActive(true)
					else
						var_162_3.gameObject:SetActive(false)
					end
				end
			end

			local var_162_4 = 0.001

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_4 then
				local var_162_5 = (arg_159_1.time_ - var_162_1) / var_162_4
				local var_162_6 = Vector3.New(0, -350, -180)

				var_162_0.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos1070, var_162_6, var_162_5)
			end

			if arg_159_1.time_ >= var_162_1 + var_162_4 and arg_159_1.time_ < var_162_1 + var_162_4 + arg_162_0 then
				var_162_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_162_7 = 0
			local var_162_8 = 0.15

			if var_162_7 < arg_159_1.time_ and arg_159_1.time_ <= var_162_7 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_9 = arg_159_1:FormatText(StoryNameCfg[318].name)

				arg_159_1.leftNameTxt_.text = var_162_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_10 = arg_159_1:GetWordFromCfg(910109041)
				local var_162_11 = arg_159_1:FormatText(var_162_10.content)

				arg_159_1.text_.text = var_162_11

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_12 = 6
				local var_162_13 = utf8.len(var_162_11)
				local var_162_14 = var_162_12 <= 0 and var_162_8 or var_162_8 * (var_162_13 / var_162_12)

				if var_162_14 > 0 and var_162_8 < var_162_14 then
					arg_159_1.talkMaxDuration = var_162_14

					if var_162_14 + var_162_7 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_14 + var_162_7
					end
				end

				arg_159_1.text_.text = var_162_11
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)
				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_15 = math.max(var_162_8, arg_159_1.talkMaxDuration)

			if var_162_7 <= arg_159_1.time_ and arg_159_1.time_ < var_162_7 + var_162_15 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_7) / var_162_15

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_7 + var_162_15 and arg_159_1.time_ < var_162_7 + var_162_15 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play910109042 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 910109042
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play910109043(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1070"]
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 and arg_163_1.var_.actorSpriteComps1070 == nil then
				arg_163_1.var_.actorSpriteComps1070 = var_166_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_2 = 0.0166666666666667

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2

				if arg_163_1.var_.actorSpriteComps1070 then
					for iter_166_0, iter_166_1 in pairs(arg_163_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_166_1 then
							local var_166_4 = Mathf.Lerp(iter_166_1.color.r, 0.5, var_166_3)

							iter_166_1.color = Color.New(var_166_4, var_166_4, var_166_4)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 and arg_163_1.var_.actorSpriteComps1070 then
				local var_166_5 = 0.5

				for iter_166_2, iter_166_3 in pairs(arg_163_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_166_3 then
						iter_166_3.color = Color.New(var_166_5, var_166_5, var_166_5)
					end
				end

				arg_163_1.var_.actorSpriteComps1070 = nil
			end

			local var_166_6 = 0
			local var_166_7 = 0.5

			if var_166_6 < arg_163_1.time_ and arg_163_1.time_ <= var_166_6 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_8 = arg_163_1:FormatText(StoryNameCfg[7].name)

				arg_163_1.leftNameTxt_.text = var_166_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_9 = arg_163_1:GetWordFromCfg(910109042)
				local var_166_10 = arg_163_1:FormatText(var_166_9.content)

				arg_163_1.text_.text = var_166_10

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_11 = 20
				local var_166_12 = utf8.len(var_166_10)
				local var_166_13 = var_166_11 <= 0 and var_166_7 or var_166_7 * (var_166_12 / var_166_11)

				if var_166_13 > 0 and var_166_7 < var_166_13 then
					arg_163_1.talkMaxDuration = var_166_13

					if var_166_13 + var_166_6 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_13 + var_166_6
					end
				end

				arg_163_1.text_.text = var_166_10
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_14 = math.max(var_166_7, arg_163_1.talkMaxDuration)

			if var_166_6 <= arg_163_1.time_ and arg_163_1.time_ < var_166_6 + var_166_14 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_6) / var_166_14

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_6 + var_166_14 and arg_163_1.time_ < var_166_6 + var_166_14 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play910109043 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 910109043
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play910109044(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1070"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos1070 = var_170_0.localPosition
				var_170_0.localScale = Vector3.New(1, 1, 1)

				arg_167_1:CheckSpriteTmpPos("1070", 3)

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
				local var_170_6 = Vector3.New(0, -350, -180)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1070, var_170_6, var_170_5)
			end

			if arg_167_1.time_ >= var_170_1 + var_170_4 and arg_167_1.time_ < var_170_1 + var_170_4 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_170_7 = arg_167_1.actors_["1070"]
			local var_170_8 = 0

			if var_170_8 < arg_167_1.time_ and arg_167_1.time_ <= var_170_8 + arg_170_0 and arg_167_1.var_.actorSpriteComps1070 == nil then
				arg_167_1.var_.actorSpriteComps1070 = var_170_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_9 = 0.0166666666666667

			if var_170_8 <= arg_167_1.time_ and arg_167_1.time_ < var_170_8 + var_170_9 then
				local var_170_10 = (arg_167_1.time_ - var_170_8) / var_170_9

				if arg_167_1.var_.actorSpriteComps1070 then
					for iter_170_1, iter_170_2 in pairs(arg_167_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_170_2 then
							local var_170_11 = Mathf.Lerp(iter_170_2.color.r, 1, var_170_10)

							iter_170_2.color = Color.New(var_170_11, var_170_11, var_170_11)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_8 + var_170_9 and arg_167_1.time_ < var_170_8 + var_170_9 + arg_170_0 and arg_167_1.var_.actorSpriteComps1070 then
				local var_170_12 = 1

				for iter_170_3, iter_170_4 in pairs(arg_167_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_170_4 then
						iter_170_4.color = Color.New(var_170_12, var_170_12, var_170_12)
					end
				end

				arg_167_1.var_.actorSpriteComps1070 = nil
			end

			local var_170_13 = 0
			local var_170_14 = 0.075

			if var_170_13 < arg_167_1.time_ and arg_167_1.time_ <= var_170_13 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_15 = arg_167_1:FormatText(StoryNameCfg[318].name)

				arg_167_1.leftNameTxt_.text = var_170_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_16 = arg_167_1:GetWordFromCfg(910109043)
				local var_170_17 = arg_167_1:FormatText(var_170_16.content)

				arg_167_1.text_.text = var_170_17

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_18 = 3
				local var_170_19 = utf8.len(var_170_17)
				local var_170_20 = var_170_18 <= 0 and var_170_14 or var_170_14 * (var_170_19 / var_170_18)

				if var_170_20 > 0 and var_170_14 < var_170_20 then
					arg_167_1.talkMaxDuration = var_170_20

					if var_170_20 + var_170_13 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_20 + var_170_13
					end
				end

				arg_167_1.text_.text = var_170_17
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_21 = math.max(var_170_14, arg_167_1.talkMaxDuration)

			if var_170_13 <= arg_167_1.time_ and arg_167_1.time_ < var_170_13 + var_170_21 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_13) / var_170_21

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_13 + var_170_21 and arg_167_1.time_ < var_170_13 + var_170_21 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play910109044 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 910109044
		arg_171_1.duration_ = 5

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play910109045(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1070"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.actorSpriteComps1070 == nil then
				arg_171_1.var_.actorSpriteComps1070 = var_174_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_2 = 0.0166666666666667

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.actorSpriteComps1070 then
					for iter_174_0, iter_174_1 in pairs(arg_171_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_174_1 then
							local var_174_4 = Mathf.Lerp(iter_174_1.color.r, 0.5, var_174_3)

							iter_174_1.color = Color.New(var_174_4, var_174_4, var_174_4)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.actorSpriteComps1070 then
				local var_174_5 = 0.5

				for iter_174_2, iter_174_3 in pairs(arg_171_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_174_3 then
						iter_174_3.color = Color.New(var_174_5, var_174_5, var_174_5)
					end
				end

				arg_171_1.var_.actorSpriteComps1070 = nil
			end

			local var_174_6 = 0
			local var_174_7 = 0.675

			if var_174_6 < arg_171_1.time_ and arg_171_1.time_ <= var_174_6 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_8 = arg_171_1:FormatText(StoryNameCfg[7].name)

				arg_171_1.leftNameTxt_.text = var_174_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_9 = arg_171_1:GetWordFromCfg(910109044)
				local var_174_10 = arg_171_1:FormatText(var_174_9.content)

				arg_171_1.text_.text = var_174_10

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_11 = 27
				local var_174_12 = utf8.len(var_174_10)
				local var_174_13 = var_174_11 <= 0 and var_174_7 or var_174_7 * (var_174_12 / var_174_11)

				if var_174_13 > 0 and var_174_7 < var_174_13 then
					arg_171_1.talkMaxDuration = var_174_13

					if var_174_13 + var_174_6 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_13 + var_174_6
					end
				end

				arg_171_1.text_.text = var_174_10
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)
				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_14 = math.max(var_174_7, arg_171_1.talkMaxDuration)

			if var_174_6 <= arg_171_1.time_ and arg_171_1.time_ < var_174_6 + var_174_14 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_6) / var_174_14

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_6 + var_174_14 and arg_171_1.time_ < var_174_6 + var_174_14 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play910109045 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 910109045
		arg_175_1.duration_ = 5

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play910109046(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1070"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos1070 = var_178_0.localPosition
				var_178_0.localScale = Vector3.New(1, 1, 1)

				arg_175_1:CheckSpriteTmpPos("1070", 3)

				local var_178_2 = var_178_0.childCount

				for iter_178_0 = 0, var_178_2 - 1 do
					local var_178_3 = var_178_0:GetChild(iter_178_0)

					if var_178_3.name == "split_7" or not string.find(var_178_3.name, "split") then
						var_178_3.gameObject:SetActive(true)
					else
						var_178_3.gameObject:SetActive(false)
					end
				end
			end

			local var_178_4 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_4 then
				local var_178_5 = (arg_175_1.time_ - var_178_1) / var_178_4
				local var_178_6 = Vector3.New(0, -350, -180)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1070, var_178_6, var_178_5)
			end

			if arg_175_1.time_ >= var_178_1 + var_178_4 and arg_175_1.time_ < var_178_1 + var_178_4 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_178_7 = arg_175_1.actors_["1070"]
			local var_178_8 = 0

			if var_178_8 < arg_175_1.time_ and arg_175_1.time_ <= var_178_8 + arg_178_0 and arg_175_1.var_.actorSpriteComps1070 == nil then
				arg_175_1.var_.actorSpriteComps1070 = var_178_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_9 = 0.0166666666666667

			if var_178_8 <= arg_175_1.time_ and arg_175_1.time_ < var_178_8 + var_178_9 then
				local var_178_10 = (arg_175_1.time_ - var_178_8) / var_178_9

				if arg_175_1.var_.actorSpriteComps1070 then
					for iter_178_1, iter_178_2 in pairs(arg_175_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_178_2 then
							local var_178_11 = Mathf.Lerp(iter_178_2.color.r, 1, var_178_10)

							iter_178_2.color = Color.New(var_178_11, var_178_11, var_178_11)
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_8 + var_178_9 and arg_175_1.time_ < var_178_8 + var_178_9 + arg_178_0 and arg_175_1.var_.actorSpriteComps1070 then
				local var_178_12 = 1

				for iter_178_3, iter_178_4 in pairs(arg_175_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_178_4 then
						iter_178_4.color = Color.New(var_178_12, var_178_12, var_178_12)
					end
				end

				arg_175_1.var_.actorSpriteComps1070 = nil
			end

			local var_178_13 = 0
			local var_178_14 = 0.25

			if var_178_13 < arg_175_1.time_ and arg_175_1.time_ <= var_178_13 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_15 = arg_175_1:FormatText(StoryNameCfg[318].name)

				arg_175_1.leftNameTxt_.text = var_178_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_16 = arg_175_1:GetWordFromCfg(910109045)
				local var_178_17 = arg_175_1:FormatText(var_178_16.content)

				arg_175_1.text_.text = var_178_17

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_18 = 10
				local var_178_19 = utf8.len(var_178_17)
				local var_178_20 = var_178_18 <= 0 and var_178_14 or var_178_14 * (var_178_19 / var_178_18)

				if var_178_20 > 0 and var_178_14 < var_178_20 then
					arg_175_1.talkMaxDuration = var_178_20

					if var_178_20 + var_178_13 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_20 + var_178_13
					end
				end

				arg_175_1.text_.text = var_178_17
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_21 = math.max(var_178_14, arg_175_1.talkMaxDuration)

			if var_178_13 <= arg_175_1.time_ and arg_175_1.time_ < var_178_13 + var_178_21 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_13) / var_178_21

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_13 + var_178_21 and arg_175_1.time_ < var_178_13 + var_178_21 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play910109046 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 910109046
		arg_179_1.duration_ = 5

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play910109047(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1039"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos1039 = var_182_0.localPosition
				var_182_0.localScale = Vector3.New(1, 1, 1)

				arg_179_1:CheckSpriteTmpPos("1039", 3)

				local var_182_2 = var_182_0.childCount

				for iter_182_0 = 0, var_182_2 - 1 do
					local var_182_3 = var_182_0:GetChild(iter_182_0)

					if var_182_3.name == "split_2" or not string.find(var_182_3.name, "split") then
						var_182_3.gameObject:SetActive(true)
					else
						var_182_3.gameObject:SetActive(false)
					end
				end
			end

			local var_182_4 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_4 then
				local var_182_5 = (arg_179_1.time_ - var_182_1) / var_182_4
				local var_182_6 = Vector3.New(0, -350, -180)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1039, var_182_6, var_182_5)
			end

			if arg_179_1.time_ >= var_182_1 + var_182_4 and arg_179_1.time_ < var_182_1 + var_182_4 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_182_7 = arg_179_1.actors_["1039"]
			local var_182_8 = 0

			if var_182_8 < arg_179_1.time_ and arg_179_1.time_ <= var_182_8 + arg_182_0 and arg_179_1.var_.actorSpriteComps1039 == nil then
				arg_179_1.var_.actorSpriteComps1039 = var_182_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_182_9 = 0.0166666666666667

			if var_182_8 <= arg_179_1.time_ and arg_179_1.time_ < var_182_8 + var_182_9 then
				local var_182_10 = (arg_179_1.time_ - var_182_8) / var_182_9

				if arg_179_1.var_.actorSpriteComps1039 then
					for iter_182_1, iter_182_2 in pairs(arg_179_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_182_2 then
							local var_182_11 = Mathf.Lerp(iter_182_2.color.r, 1, var_182_10)

							iter_182_2.color = Color.New(var_182_11, var_182_11, var_182_11)
						end
					end
				end
			end

			if arg_179_1.time_ >= var_182_8 + var_182_9 and arg_179_1.time_ < var_182_8 + var_182_9 + arg_182_0 and arg_179_1.var_.actorSpriteComps1039 then
				local var_182_12 = 1

				for iter_182_3, iter_182_4 in pairs(arg_179_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_182_4 then
						iter_182_4.color = Color.New(var_182_12, var_182_12, var_182_12)
					end
				end

				arg_179_1.var_.actorSpriteComps1039 = nil
			end

			local var_182_13 = 0
			local var_182_14 = 0.8

			if var_182_13 < arg_179_1.time_ and arg_179_1.time_ <= var_182_13 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_15 = arg_179_1:FormatText(StoryNameCfg[9].name)

				arg_179_1.leftNameTxt_.text = var_182_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_16 = arg_179_1:GetWordFromCfg(910109046)
				local var_182_17 = arg_179_1:FormatText(var_182_16.content)

				arg_179_1.text_.text = var_182_17

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_18 = 32
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
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_21 = math.max(var_182_14, arg_179_1.talkMaxDuration)

			if var_182_13 <= arg_179_1.time_ and arg_179_1.time_ < var_182_13 + var_182_21 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_13) / var_182_21

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_13 + var_182_21 and arg_179_1.time_ < var_182_13 + var_182_21 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play910109047 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 910109047
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play910109048(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1039"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.actorSpriteComps1039 == nil then
				arg_183_1.var_.actorSpriteComps1039 = var_186_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_2 = 0.2

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.actorSpriteComps1039 then
					for iter_186_0, iter_186_1 in pairs(arg_183_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_186_1 then
							local var_186_4 = Mathf.Lerp(iter_186_1.color.r, 0.5, var_186_3)

							iter_186_1.color = Color.New(var_186_4, var_186_4, var_186_4)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.actorSpriteComps1039 then
				local var_186_5 = 0.5

				for iter_186_2, iter_186_3 in pairs(arg_183_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_186_3 then
						iter_186_3.color = Color.New(var_186_5, var_186_5, var_186_5)
					end
				end

				arg_183_1.var_.actorSpriteComps1039 = nil
			end

			local var_186_6 = 0
			local var_186_7 = 0.25

			if var_186_6 < arg_183_1.time_ and arg_183_1.time_ <= var_186_6 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_8 = arg_183_1:FormatText(StoryNameCfg[7].name)

				arg_183_1.leftNameTxt_.text = var_186_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_9 = arg_183_1:GetWordFromCfg(910109047)
				local var_186_10 = arg_183_1:FormatText(var_186_9.content)

				arg_183_1.text_.text = var_186_10

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_11 = 10
				local var_186_12 = utf8.len(var_186_10)
				local var_186_13 = var_186_11 <= 0 and var_186_7 or var_186_7 * (var_186_12 / var_186_11)

				if var_186_13 > 0 and var_186_7 < var_186_13 then
					arg_183_1.talkMaxDuration = var_186_13

					if var_186_13 + var_186_6 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_13 + var_186_6
					end
				end

				arg_183_1.text_.text = var_186_10
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_14 = math.max(var_186_7, arg_183_1.talkMaxDuration)

			if var_186_6 <= arg_183_1.time_ and arg_183_1.time_ < var_186_6 + var_186_14 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_6) / var_186_14

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_6 + var_186_14 and arg_183_1.time_ < var_186_6 + var_186_14 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play910109048 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 910109048
		arg_187_1.duration_ = 5

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play910109049(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1070"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos1070 = var_190_0.localPosition
				var_190_0.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("1070", 3)

				local var_190_2 = var_190_0.childCount

				for iter_190_0 = 0, var_190_2 - 1 do
					local var_190_3 = var_190_0:GetChild(iter_190_0)

					if var_190_3.name == "split_5" or not string.find(var_190_3.name, "split") then
						var_190_3.gameObject:SetActive(true)
					else
						var_190_3.gameObject:SetActive(false)
					end
				end
			end

			local var_190_4 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_4 then
				local var_190_5 = (arg_187_1.time_ - var_190_1) / var_190_4
				local var_190_6 = Vector3.New(0, -350, -180)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1070, var_190_6, var_190_5)
			end

			if arg_187_1.time_ >= var_190_1 + var_190_4 and arg_187_1.time_ < var_190_1 + var_190_4 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_190_7 = 0
			local var_190_8 = 0.125

			if var_190_7 < arg_187_1.time_ and arg_187_1.time_ <= var_190_7 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_9 = arg_187_1:FormatText(StoryNameCfg[318].name)

				arg_187_1.leftNameTxt_.text = var_190_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_10 = arg_187_1:GetWordFromCfg(910109048)
				local var_190_11 = arg_187_1:FormatText(var_190_10.content)

				arg_187_1.text_.text = var_190_11

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_12 = 5
				local var_190_13 = utf8.len(var_190_11)
				local var_190_14 = var_190_12 <= 0 and var_190_8 or var_190_8 * (var_190_13 / var_190_12)

				if var_190_14 > 0 and var_190_8 < var_190_14 then
					arg_187_1.talkMaxDuration = var_190_14

					if var_190_14 + var_190_7 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_14 + var_190_7
					end
				end

				arg_187_1.text_.text = var_190_11
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_15 = math.max(var_190_8, arg_187_1.talkMaxDuration)

			if var_190_7 <= arg_187_1.time_ and arg_187_1.time_ < var_190_7 + var_190_15 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_7) / var_190_15

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_7 + var_190_15 and arg_187_1.time_ < var_190_7 + var_190_15 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play910109049 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 910109049
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play910109050(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1070"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.actorSpriteComps1070 == nil then
				arg_191_1.var_.actorSpriteComps1070 = var_194_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_2 = 0.2

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.actorSpriteComps1070 then
					for iter_194_0, iter_194_1 in pairs(arg_191_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_194_1 then
							local var_194_4 = Mathf.Lerp(iter_194_1.color.r, 0.5, var_194_3)

							iter_194_1.color = Color.New(var_194_4, var_194_4, var_194_4)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.actorSpriteComps1070 then
				local var_194_5 = 0.5

				for iter_194_2, iter_194_3 in pairs(arg_191_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_194_3 then
						iter_194_3.color = Color.New(var_194_5, var_194_5, var_194_5)
					end
				end

				arg_191_1.var_.actorSpriteComps1070 = nil
			end

			local var_194_6 = 0
			local var_194_7 = 0.275

			if var_194_6 < arg_191_1.time_ and arg_191_1.time_ <= var_194_6 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_8 = arg_191_1:FormatText(StoryNameCfg[7].name)

				arg_191_1.leftNameTxt_.text = var_194_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_9 = arg_191_1:GetWordFromCfg(910109049)
				local var_194_10 = arg_191_1:FormatText(var_194_9.content)

				arg_191_1.text_.text = var_194_10

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_11 = 11
				local var_194_12 = utf8.len(var_194_10)
				local var_194_13 = var_194_11 <= 0 and var_194_7 or var_194_7 * (var_194_12 / var_194_11)

				if var_194_13 > 0 and var_194_7 < var_194_13 then
					arg_191_1.talkMaxDuration = var_194_13

					if var_194_13 + var_194_6 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_13 + var_194_6
					end
				end

				arg_191_1.text_.text = var_194_10
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_14 = math.max(var_194_7, arg_191_1.talkMaxDuration)

			if var_194_6 <= arg_191_1.time_ and arg_191_1.time_ < var_194_6 + var_194_14 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_6) / var_194_14

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_6 + var_194_14 and arg_191_1.time_ < var_194_6 + var_194_14 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play910109050 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 910109050
		arg_195_1.duration_ = 5

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play910109051(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1070"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos1070 = var_198_0.localPosition
				var_198_0.localScale = Vector3.New(1, 1, 1)

				arg_195_1:CheckSpriteTmpPos("1070", 3)

				local var_198_2 = var_198_0.childCount

				for iter_198_0 = 0, var_198_2 - 1 do
					local var_198_3 = var_198_0:GetChild(iter_198_0)

					if var_198_3.name == "split_2" or not string.find(var_198_3.name, "split") then
						var_198_3.gameObject:SetActive(true)
					else
						var_198_3.gameObject:SetActive(false)
					end
				end
			end

			local var_198_4 = 0.001

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_4 then
				local var_198_5 = (arg_195_1.time_ - var_198_1) / var_198_4
				local var_198_6 = Vector3.New(0, -350, -180)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1070, var_198_6, var_198_5)
			end

			if arg_195_1.time_ >= var_198_1 + var_198_4 and arg_195_1.time_ < var_198_1 + var_198_4 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_198_7 = arg_195_1.actors_["1070"]
			local var_198_8 = 0

			if var_198_8 < arg_195_1.time_ and arg_195_1.time_ <= var_198_8 + arg_198_0 and arg_195_1.var_.actorSpriteComps1070 == nil then
				arg_195_1.var_.actorSpriteComps1070 = var_198_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_9 = 0.0166666666666667

			if var_198_8 <= arg_195_1.time_ and arg_195_1.time_ < var_198_8 + var_198_9 then
				local var_198_10 = (arg_195_1.time_ - var_198_8) / var_198_9

				if arg_195_1.var_.actorSpriteComps1070 then
					for iter_198_1, iter_198_2 in pairs(arg_195_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_198_2 then
							local var_198_11 = Mathf.Lerp(iter_198_2.color.r, 1, var_198_10)

							iter_198_2.color = Color.New(var_198_11, var_198_11, var_198_11)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_8 + var_198_9 and arg_195_1.time_ < var_198_8 + var_198_9 + arg_198_0 and arg_195_1.var_.actorSpriteComps1070 then
				local var_198_12 = 1

				for iter_198_3, iter_198_4 in pairs(arg_195_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_198_4 then
						iter_198_4.color = Color.New(var_198_12, var_198_12, var_198_12)
					end
				end

				arg_195_1.var_.actorSpriteComps1070 = nil
			end

			local var_198_13 = 0
			local var_198_14 = 0.4

			if var_198_13 < arg_195_1.time_ and arg_195_1.time_ <= var_198_13 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_15 = arg_195_1:FormatText(StoryNameCfg[318].name)

				arg_195_1.leftNameTxt_.text = var_198_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_16 = arg_195_1:GetWordFromCfg(910109050)
				local var_198_17 = arg_195_1:FormatText(var_198_16.content)

				arg_195_1.text_.text = var_198_17

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_18 = 16
				local var_198_19 = utf8.len(var_198_17)
				local var_198_20 = var_198_18 <= 0 and var_198_14 or var_198_14 * (var_198_19 / var_198_18)

				if var_198_20 > 0 and var_198_14 < var_198_20 then
					arg_195_1.talkMaxDuration = var_198_20

					if var_198_20 + var_198_13 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_20 + var_198_13
					end
				end

				arg_195_1.text_.text = var_198_17
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)
				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_21 = math.max(var_198_14, arg_195_1.talkMaxDuration)

			if var_198_13 <= arg_195_1.time_ and arg_195_1.time_ < var_198_13 + var_198_21 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_13) / var_198_21

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_13 + var_198_21 and arg_195_1.time_ < var_198_13 + var_198_21 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play910109051 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 910109051
		arg_199_1.duration_ = 5

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play910109052(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1039"].transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.moveOldPos1039 = var_202_0.localPosition
				var_202_0.localScale = Vector3.New(1, 1, 1)

				arg_199_1:CheckSpriteTmpPos("1039", 3)

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
				local var_202_6 = Vector3.New(0, -350, -180)

				var_202_0.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1039, var_202_6, var_202_5)
			end

			if arg_199_1.time_ >= var_202_1 + var_202_4 and arg_199_1.time_ < var_202_1 + var_202_4 + arg_202_0 then
				var_202_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_202_7 = arg_199_1.actors_["1039"]
			local var_202_8 = 0

			if var_202_8 < arg_199_1.time_ and arg_199_1.time_ <= var_202_8 + arg_202_0 and arg_199_1.var_.actorSpriteComps1039 == nil then
				arg_199_1.var_.actorSpriteComps1039 = var_202_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_9 = 0.0166666666666667

			if var_202_8 <= arg_199_1.time_ and arg_199_1.time_ < var_202_8 + var_202_9 then
				local var_202_10 = (arg_199_1.time_ - var_202_8) / var_202_9

				if arg_199_1.var_.actorSpriteComps1039 then
					for iter_202_1, iter_202_2 in pairs(arg_199_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_202_2 then
							local var_202_11 = Mathf.Lerp(iter_202_2.color.r, 1, var_202_10)

							iter_202_2.color = Color.New(var_202_11, var_202_11, var_202_11)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_8 + var_202_9 and arg_199_1.time_ < var_202_8 + var_202_9 + arg_202_0 and arg_199_1.var_.actorSpriteComps1039 then
				local var_202_12 = 1

				for iter_202_3, iter_202_4 in pairs(arg_199_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_202_4 then
						iter_202_4.color = Color.New(var_202_12, var_202_12, var_202_12)
					end
				end

				arg_199_1.var_.actorSpriteComps1039 = nil
			end

			local var_202_13 = 0
			local var_202_14 = 0.075

			if var_202_13 < arg_199_1.time_ and arg_199_1.time_ <= var_202_13 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_15 = arg_199_1:FormatText(StoryNameCfg[9].name)

				arg_199_1.leftNameTxt_.text = var_202_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_16 = arg_199_1:GetWordFromCfg(910109051)
				local var_202_17 = arg_199_1:FormatText(var_202_16.content)

				arg_199_1.text_.text = var_202_17

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_18 = 3
				local var_202_19 = utf8.len(var_202_17)
				local var_202_20 = var_202_18 <= 0 and var_202_14 or var_202_14 * (var_202_19 / var_202_18)

				if var_202_20 > 0 and var_202_14 < var_202_20 then
					arg_199_1.talkMaxDuration = var_202_20

					if var_202_20 + var_202_13 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_20 + var_202_13
					end
				end

				arg_199_1.text_.text = var_202_17
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)
				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_21 = math.max(var_202_14, arg_199_1.talkMaxDuration)

			if var_202_13 <= arg_199_1.time_ and arg_199_1.time_ < var_202_13 + var_202_21 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_13) / var_202_21

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_13 + var_202_21 and arg_199_1.time_ < var_202_13 + var_202_21 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play910109052 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 910109052
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play910109053(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1039"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.actorSpriteComps1039 == nil then
				arg_203_1.var_.actorSpriteComps1039 = var_206_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_2 = 0.2

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.actorSpriteComps1039 then
					for iter_206_0, iter_206_1 in pairs(arg_203_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_206_1 then
							local var_206_4 = Mathf.Lerp(iter_206_1.color.r, 0.5, var_206_3)

							iter_206_1.color = Color.New(var_206_4, var_206_4, var_206_4)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.actorSpriteComps1039 then
				local var_206_5 = 0.5

				for iter_206_2, iter_206_3 in pairs(arg_203_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_206_3 then
						iter_206_3.color = Color.New(var_206_5, var_206_5, var_206_5)
					end
				end

				arg_203_1.var_.actorSpriteComps1039 = nil
			end

			local var_206_6 = 0
			local var_206_7 = 0.3

			if var_206_6 < arg_203_1.time_ and arg_203_1.time_ <= var_206_6 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_8 = arg_203_1:FormatText(StoryNameCfg[7].name)

				arg_203_1.leftNameTxt_.text = var_206_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_9 = arg_203_1:GetWordFromCfg(910109052)
				local var_206_10 = arg_203_1:FormatText(var_206_9.content)

				arg_203_1.text_.text = var_206_10

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_11 = 12
				local var_206_12 = utf8.len(var_206_10)
				local var_206_13 = var_206_11 <= 0 and var_206_7 or var_206_7 * (var_206_12 / var_206_11)

				if var_206_13 > 0 and var_206_7 < var_206_13 then
					arg_203_1.talkMaxDuration = var_206_13

					if var_206_13 + var_206_6 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_13 + var_206_6
					end
				end

				arg_203_1.text_.text = var_206_10
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)
				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_14 = math.max(var_206_7, arg_203_1.talkMaxDuration)

			if var_206_6 <= arg_203_1.time_ and arg_203_1.time_ < var_206_6 + var_206_14 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_6) / var_206_14

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_6 + var_206_14 and arg_203_1.time_ < var_206_6 + var_206_14 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play910109053 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 910109053
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play910109054(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1039"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos1039 = var_210_0.localPosition
				var_210_0.localScale = Vector3.New(1, 1, 1)

				arg_207_1:CheckSpriteTmpPos("1039", 3)

				local var_210_2 = var_210_0.childCount

				for iter_210_0 = 0, var_210_2 - 1 do
					local var_210_3 = var_210_0:GetChild(iter_210_0)

					if var_210_3.name == "split_2" or not string.find(var_210_3.name, "split") then
						var_210_3.gameObject:SetActive(true)
					else
						var_210_3.gameObject:SetActive(false)
					end
				end
			end

			local var_210_4 = 0.001

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_4 then
				local var_210_5 = (arg_207_1.time_ - var_210_1) / var_210_4
				local var_210_6 = Vector3.New(0, -350, -180)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1039, var_210_6, var_210_5)
			end

			if arg_207_1.time_ >= var_210_1 + var_210_4 and arg_207_1.time_ < var_210_1 + var_210_4 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_210_7 = arg_207_1.actors_["1039"]
			local var_210_8 = 0

			if var_210_8 < arg_207_1.time_ and arg_207_1.time_ <= var_210_8 + arg_210_0 and arg_207_1.var_.actorSpriteComps1039 == nil then
				arg_207_1.var_.actorSpriteComps1039 = var_210_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_210_9 = 0.0166666666666667

			if var_210_8 <= arg_207_1.time_ and arg_207_1.time_ < var_210_8 + var_210_9 then
				local var_210_10 = (arg_207_1.time_ - var_210_8) / var_210_9

				if arg_207_1.var_.actorSpriteComps1039 then
					for iter_210_1, iter_210_2 in pairs(arg_207_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_210_2 then
							local var_210_11 = Mathf.Lerp(iter_210_2.color.r, 1, var_210_10)

							iter_210_2.color = Color.New(var_210_11, var_210_11, var_210_11)
						end
					end
				end
			end

			if arg_207_1.time_ >= var_210_8 + var_210_9 and arg_207_1.time_ < var_210_8 + var_210_9 + arg_210_0 and arg_207_1.var_.actorSpriteComps1039 then
				local var_210_12 = 1

				for iter_210_3, iter_210_4 in pairs(arg_207_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_210_4 then
						iter_210_4.color = Color.New(var_210_12, var_210_12, var_210_12)
					end
				end

				arg_207_1.var_.actorSpriteComps1039 = nil
			end

			local var_210_13 = 0
			local var_210_14 = 0.95

			if var_210_13 < arg_207_1.time_ and arg_207_1.time_ <= var_210_13 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_15 = arg_207_1:FormatText(StoryNameCfg[9].name)

				arg_207_1.leftNameTxt_.text = var_210_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_16 = arg_207_1:GetWordFromCfg(910109053)
				local var_210_17 = arg_207_1:FormatText(var_210_16.content)

				arg_207_1.text_.text = var_210_17

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_18 = 38
				local var_210_19 = utf8.len(var_210_17)
				local var_210_20 = var_210_18 <= 0 and var_210_14 or var_210_14 * (var_210_19 / var_210_18)

				if var_210_20 > 0 and var_210_14 < var_210_20 then
					arg_207_1.talkMaxDuration = var_210_20

					if var_210_20 + var_210_13 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_20 + var_210_13
					end
				end

				arg_207_1.text_.text = var_210_17
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_21 = math.max(var_210_14, arg_207_1.talkMaxDuration)

			if var_210_13 <= arg_207_1.time_ and arg_207_1.time_ < var_210_13 + var_210_21 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_13) / var_210_21

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_13 + var_210_21 and arg_207_1.time_ < var_210_13 + var_210_21 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play910109054 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 910109054
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play910109055(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1039"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.actorSpriteComps1039 == nil then
				arg_211_1.var_.actorSpriteComps1039 = var_214_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_214_2 = 0.2

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.actorSpriteComps1039 then
					for iter_214_0, iter_214_1 in pairs(arg_211_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_214_1 then
							local var_214_4 = Mathf.Lerp(iter_214_1.color.r, 0.5, var_214_3)

							iter_214_1.color = Color.New(var_214_4, var_214_4, var_214_4)
						end
					end
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.actorSpriteComps1039 then
				local var_214_5 = 0.5

				for iter_214_2, iter_214_3 in pairs(arg_211_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_214_3 then
						iter_214_3.color = Color.New(var_214_5, var_214_5, var_214_5)
					end
				end

				arg_211_1.var_.actorSpriteComps1039 = nil
			end

			local var_214_6 = 0
			local var_214_7 = 0.925

			if var_214_6 < arg_211_1.time_ and arg_211_1.time_ <= var_214_6 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_8 = arg_211_1:FormatText(StoryNameCfg[7].name)

				arg_211_1.leftNameTxt_.text = var_214_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_9 = arg_211_1:GetWordFromCfg(910109054)
				local var_214_10 = arg_211_1:FormatText(var_214_9.content)

				arg_211_1.text_.text = var_214_10

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_11 = 37
				local var_214_12 = utf8.len(var_214_10)
				local var_214_13 = var_214_11 <= 0 and var_214_7 or var_214_7 * (var_214_12 / var_214_11)

				if var_214_13 > 0 and var_214_7 < var_214_13 then
					arg_211_1.talkMaxDuration = var_214_13

					if var_214_13 + var_214_6 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_13 + var_214_6
					end
				end

				arg_211_1.text_.text = var_214_10
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_14 = math.max(var_214_7, arg_211_1.talkMaxDuration)

			if var_214_6 <= arg_211_1.time_ and arg_211_1.time_ < var_214_6 + var_214_14 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_6) / var_214_14

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_6 + var_214_14 and arg_211_1.time_ < var_214_6 + var_214_14 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play910109055 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 910109055
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play910109056(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1039"]
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 and arg_215_1.var_.actorSpriteComps1039 == nil then
				arg_215_1.var_.actorSpriteComps1039 = var_218_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_218_2 = 0.2

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2

				if arg_215_1.var_.actorSpriteComps1039 then
					for iter_218_0, iter_218_1 in pairs(arg_215_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_218_1 then
							local var_218_4 = Mathf.Lerp(iter_218_1.color.r, 1, var_218_3)

							iter_218_1.color = Color.New(var_218_4, var_218_4, var_218_4)
						end
					end
				end
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 and arg_215_1.var_.actorSpriteComps1039 then
				local var_218_5 = 1

				for iter_218_2, iter_218_3 in pairs(arg_215_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_218_3 then
						iter_218_3.color = Color.New(var_218_5, var_218_5, var_218_5)
					end
				end

				arg_215_1.var_.actorSpriteComps1039 = nil
			end

			local var_218_6 = 0
			local var_218_7 = 1.325

			if var_218_6 < arg_215_1.time_ and arg_215_1.time_ <= var_218_6 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_8 = arg_215_1:FormatText(StoryNameCfg[9].name)

				arg_215_1.leftNameTxt_.text = var_218_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_9 = arg_215_1:GetWordFromCfg(910109055)
				local var_218_10 = arg_215_1:FormatText(var_218_9.content)

				arg_215_1.text_.text = var_218_10

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_11 = 53
				local var_218_12 = utf8.len(var_218_10)
				local var_218_13 = var_218_11 <= 0 and var_218_7 or var_218_7 * (var_218_12 / var_218_11)

				if var_218_13 > 0 and var_218_7 < var_218_13 then
					arg_215_1.talkMaxDuration = var_218_13

					if var_218_13 + var_218_6 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_13 + var_218_6
					end
				end

				arg_215_1.text_.text = var_218_10
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)
				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_14 = math.max(var_218_7, arg_215_1.talkMaxDuration)

			if var_218_6 <= arg_215_1.time_ and arg_215_1.time_ < var_218_6 + var_218_14 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_6) / var_218_14

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_6 + var_218_14 and arg_215_1.time_ < var_218_6 + var_218_14 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play910109056 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 910109056
		arg_219_1.duration_ = 5

		SetActive(arg_219_1.tipsGo_, false)

		function arg_219_1.onSingleLineFinish_()
			arg_219_1.onSingleLineUpdate_ = nil
			arg_219_1.onSingleLineFinish_ = nil
			arg_219_1.state_ = "waiting"
		end

		function arg_219_1.playNext_(arg_221_0)
			if arg_221_0 == 1 then
				arg_219_0:Play910109057(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1070"].transform
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos1070 = var_222_0.localPosition
				var_222_0.localScale = Vector3.New(1, 1, 1)

				arg_219_1:CheckSpriteTmpPos("1070", 3)

				local var_222_2 = var_222_0.childCount

				for iter_222_0 = 0, var_222_2 - 1 do
					local var_222_3 = var_222_0:GetChild(iter_222_0)

					if var_222_3.name == "split_8" or not string.find(var_222_3.name, "split") then
						var_222_3.gameObject:SetActive(true)
					else
						var_222_3.gameObject:SetActive(false)
					end
				end
			end

			local var_222_4 = 0.001

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_4 then
				local var_222_5 = (arg_219_1.time_ - var_222_1) / var_222_4
				local var_222_6 = Vector3.New(0, -350, -180)

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1070, var_222_6, var_222_5)
			end

			if arg_219_1.time_ >= var_222_1 + var_222_4 and arg_219_1.time_ < var_222_1 + var_222_4 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_222_7 = 0
			local var_222_8 = 0.3

			if var_222_7 < arg_219_1.time_ and arg_219_1.time_ <= var_222_7 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_9 = arg_219_1:FormatText(StoryNameCfg[318].name)

				arg_219_1.leftNameTxt_.text = var_222_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_10 = arg_219_1:GetWordFromCfg(910109056)
				local var_222_11 = arg_219_1:FormatText(var_222_10.content)

				arg_219_1.text_.text = var_222_11

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_12 = 12
				local var_222_13 = utf8.len(var_222_11)
				local var_222_14 = var_222_12 <= 0 and var_222_8 or var_222_8 * (var_222_13 / var_222_12)

				if var_222_14 > 0 and var_222_8 < var_222_14 then
					arg_219_1.talkMaxDuration = var_222_14

					if var_222_14 + var_222_7 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_14 + var_222_7
					end
				end

				arg_219_1.text_.text = var_222_11
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)
				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_15 = math.max(var_222_8, arg_219_1.talkMaxDuration)

			if var_222_7 <= arg_219_1.time_ and arg_219_1.time_ < var_222_7 + var_222_15 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_7) / var_222_15

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_7 + var_222_15 and arg_219_1.time_ < var_222_7 + var_222_15 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play910109057 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 910109057
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play910109058(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = 0
			local var_226_1 = 0.425

			if var_226_0 < arg_223_1.time_ and arg_223_1.time_ <= var_226_0 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_2 = arg_223_1:FormatText(StoryNameCfg[318].name)

				arg_223_1.leftNameTxt_.text = var_226_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_3 = arg_223_1:GetWordFromCfg(910109057)
				local var_226_4 = arg_223_1:FormatText(var_226_3.content)

				arg_223_1.text_.text = var_226_4

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_5 = 17
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
				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_8 = math.max(var_226_1, arg_223_1.talkMaxDuration)

			if var_226_0 <= arg_223_1.time_ and arg_223_1.time_ < var_226_0 + var_226_8 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_0) / var_226_8

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_0 + var_226_8 and arg_223_1.time_ < var_226_0 + var_226_8 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play910109058 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 910109058
		arg_227_1.duration_ = 5

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play910109059(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1039"].transform
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1.var_.moveOldPos1039 = var_230_0.localPosition
				var_230_0.localScale = Vector3.New(1, 1, 1)

				arg_227_1:CheckSpriteTmpPos("1039", 3)

				local var_230_2 = var_230_0.childCount

				for iter_230_0 = 0, var_230_2 - 1 do
					local var_230_3 = var_230_0:GetChild(iter_230_0)

					if var_230_3.name == "split_1" or not string.find(var_230_3.name, "split") then
						var_230_3.gameObject:SetActive(true)
					else
						var_230_3.gameObject:SetActive(false)
					end
				end
			end

			local var_230_4 = 0.001

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_4 then
				local var_230_5 = (arg_227_1.time_ - var_230_1) / var_230_4
				local var_230_6 = Vector3.New(0, -350, -180)

				var_230_0.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos1039, var_230_6, var_230_5)
			end

			if arg_227_1.time_ >= var_230_1 + var_230_4 and arg_227_1.time_ < var_230_1 + var_230_4 + arg_230_0 then
				var_230_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_230_7 = arg_227_1.actors_["1039"]
			local var_230_8 = 0

			if var_230_8 < arg_227_1.time_ and arg_227_1.time_ <= var_230_8 + arg_230_0 and arg_227_1.var_.actorSpriteComps1039 == nil then
				arg_227_1.var_.actorSpriteComps1039 = var_230_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_230_9 = 0.0166666666666667

			if var_230_8 <= arg_227_1.time_ and arg_227_1.time_ < var_230_8 + var_230_9 then
				local var_230_10 = (arg_227_1.time_ - var_230_8) / var_230_9

				if arg_227_1.var_.actorSpriteComps1039 then
					for iter_230_1, iter_230_2 in pairs(arg_227_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_230_2 then
							local var_230_11 = Mathf.Lerp(iter_230_2.color.r, 1, var_230_10)

							iter_230_2.color = Color.New(var_230_11, var_230_11, var_230_11)
						end
					end
				end
			end

			if arg_227_1.time_ >= var_230_8 + var_230_9 and arg_227_1.time_ < var_230_8 + var_230_9 + arg_230_0 and arg_227_1.var_.actorSpriteComps1039 then
				local var_230_12 = 1

				for iter_230_3, iter_230_4 in pairs(arg_227_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_230_4 then
						iter_230_4.color = Color.New(var_230_12, var_230_12, var_230_12)
					end
				end

				arg_227_1.var_.actorSpriteComps1039 = nil
			end

			local var_230_13 = 0
			local var_230_14 = 0.45

			if var_230_13 < arg_227_1.time_ and arg_227_1.time_ <= var_230_13 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_15 = arg_227_1:FormatText(StoryNameCfg[9].name)

				arg_227_1.leftNameTxt_.text = var_230_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_16 = arg_227_1:GetWordFromCfg(910109058)
				local var_230_17 = arg_227_1:FormatText(var_230_16.content)

				arg_227_1.text_.text = var_230_17

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_18 = 18
				local var_230_19 = utf8.len(var_230_17)
				local var_230_20 = var_230_18 <= 0 and var_230_14 or var_230_14 * (var_230_19 / var_230_18)

				if var_230_20 > 0 and var_230_14 < var_230_20 then
					arg_227_1.talkMaxDuration = var_230_20

					if var_230_20 + var_230_13 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_20 + var_230_13
					end
				end

				arg_227_1.text_.text = var_230_17
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)
				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_21 = math.max(var_230_14, arg_227_1.talkMaxDuration)

			if var_230_13 <= arg_227_1.time_ and arg_227_1.time_ < var_230_13 + var_230_21 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_13) / var_230_21

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_13 + var_230_21 and arg_227_1.time_ < var_230_13 + var_230_21 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play910109059 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 910109059
		arg_231_1.duration_ = 5

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play910109060(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1070"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos1070 = var_234_0.localPosition
				var_234_0.localScale = Vector3.New(1, 1, 1)

				arg_231_1:CheckSpriteTmpPos("1070", 3)

				local var_234_2 = var_234_0.childCount

				for iter_234_0 = 0, var_234_2 - 1 do
					local var_234_3 = var_234_0:GetChild(iter_234_0)

					if var_234_3.name == "split_8" or not string.find(var_234_3.name, "split") then
						var_234_3.gameObject:SetActive(true)
					else
						var_234_3.gameObject:SetActive(false)
					end
				end
			end

			local var_234_4 = 0.001

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_4 then
				local var_234_5 = (arg_231_1.time_ - var_234_1) / var_234_4
				local var_234_6 = Vector3.New(0, -350, -180)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1070, var_234_6, var_234_5)
			end

			if arg_231_1.time_ >= var_234_1 + var_234_4 and arg_231_1.time_ < var_234_1 + var_234_4 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_234_7 = 0
			local var_234_8 = 0.5

			if var_234_7 < arg_231_1.time_ and arg_231_1.time_ <= var_234_7 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_9 = arg_231_1:FormatText(StoryNameCfg[318].name)

				arg_231_1.leftNameTxt_.text = var_234_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_10 = arg_231_1:GetWordFromCfg(910109059)
				local var_234_11 = arg_231_1:FormatText(var_234_10.content)

				arg_231_1.text_.text = var_234_11

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_12 = 20
				local var_234_13 = utf8.len(var_234_11)
				local var_234_14 = var_234_12 <= 0 and var_234_8 or var_234_8 * (var_234_13 / var_234_12)

				if var_234_14 > 0 and var_234_8 < var_234_14 then
					arg_231_1.talkMaxDuration = var_234_14

					if var_234_14 + var_234_7 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_14 + var_234_7
					end
				end

				arg_231_1.text_.text = var_234_11
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)
				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_15 = math.max(var_234_8, arg_231_1.talkMaxDuration)

			if var_234_7 <= arg_231_1.time_ and arg_231_1.time_ < var_234_7 + var_234_15 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_7) / var_234_15

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_7 + var_234_15 and arg_231_1.time_ < var_234_7 + var_234_15 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play910109060 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 910109060
		arg_235_1.duration_ = 5

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play910109061(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1039"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos1039 = var_238_0.localPosition
				var_238_0.localScale = Vector3.New(1, 1, 1)

				arg_235_1:CheckSpriteTmpPos("1039", 3)

				local var_238_2 = var_238_0.childCount

				for iter_238_0 = 0, var_238_2 - 1 do
					local var_238_3 = var_238_0:GetChild(iter_238_0)

					if var_238_3.name == "split_4" or not string.find(var_238_3.name, "split") then
						var_238_3.gameObject:SetActive(true)
					else
						var_238_3.gameObject:SetActive(false)
					end
				end
			end

			local var_238_4 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_4 then
				local var_238_5 = (arg_235_1.time_ - var_238_1) / var_238_4
				local var_238_6 = Vector3.New(0, -350, -180)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1039, var_238_6, var_238_5)
			end

			if arg_235_1.time_ >= var_238_1 + var_238_4 and arg_235_1.time_ < var_238_1 + var_238_4 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_238_7 = 0
			local var_238_8 = 0.575

			if var_238_7 < arg_235_1.time_ and arg_235_1.time_ <= var_238_7 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_9 = arg_235_1:FormatText(StoryNameCfg[9].name)

				arg_235_1.leftNameTxt_.text = var_238_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_10 = arg_235_1:GetWordFromCfg(910109060)
				local var_238_11 = arg_235_1:FormatText(var_238_10.content)

				arg_235_1.text_.text = var_238_11

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_12 = 23
				local var_238_13 = utf8.len(var_238_11)
				local var_238_14 = var_238_12 <= 0 and var_238_8 or var_238_8 * (var_238_13 / var_238_12)

				if var_238_14 > 0 and var_238_8 < var_238_14 then
					arg_235_1.talkMaxDuration = var_238_14

					if var_238_14 + var_238_7 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_14 + var_238_7
					end
				end

				arg_235_1.text_.text = var_238_11
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)
				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_15 = math.max(var_238_8, arg_235_1.talkMaxDuration)

			if var_238_7 <= arg_235_1.time_ and arg_235_1.time_ < var_238_7 + var_238_15 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_7) / var_238_15

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_7 + var_238_15 and arg_235_1.time_ < var_238_7 + var_238_15 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play910109061 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 910109061
		arg_239_1.duration_ = 5

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play910109062(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1070"].transform
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.var_.moveOldPos1070 = var_242_0.localPosition
				var_242_0.localScale = Vector3.New(1, 1, 1)

				arg_239_1:CheckSpriteTmpPos("1070", 3)

				local var_242_2 = var_242_0.childCount

				for iter_242_0 = 0, var_242_2 - 1 do
					local var_242_3 = var_242_0:GetChild(iter_242_0)

					if var_242_3.name == "split_2" or not string.find(var_242_3.name, "split") then
						var_242_3.gameObject:SetActive(true)
					else
						var_242_3.gameObject:SetActive(false)
					end
				end
			end

			local var_242_4 = 0.001

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_4 then
				local var_242_5 = (arg_239_1.time_ - var_242_1) / var_242_4
				local var_242_6 = Vector3.New(0, -350, -180)

				var_242_0.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1070, var_242_6, var_242_5)
			end

			if arg_239_1.time_ >= var_242_1 + var_242_4 and arg_239_1.time_ < var_242_1 + var_242_4 + arg_242_0 then
				var_242_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_242_7 = 0
			local var_242_8 = 0.2

			if var_242_7 < arg_239_1.time_ and arg_239_1.time_ <= var_242_7 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_9 = arg_239_1:FormatText(StoryNameCfg[318].name)

				arg_239_1.leftNameTxt_.text = var_242_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_10 = arg_239_1:GetWordFromCfg(910109061)
				local var_242_11 = arg_239_1:FormatText(var_242_10.content)

				arg_239_1.text_.text = var_242_11

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_12 = 8
				local var_242_13 = utf8.len(var_242_11)
				local var_242_14 = var_242_12 <= 0 and var_242_8 or var_242_8 * (var_242_13 / var_242_12)

				if var_242_14 > 0 and var_242_8 < var_242_14 then
					arg_239_1.talkMaxDuration = var_242_14

					if var_242_14 + var_242_7 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_14 + var_242_7
					end
				end

				arg_239_1.text_.text = var_242_11
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)
				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_15 = math.max(var_242_8, arg_239_1.talkMaxDuration)

			if var_242_7 <= arg_239_1.time_ and arg_239_1.time_ < var_242_7 + var_242_15 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_7) / var_242_15

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_7 + var_242_15 and arg_239_1.time_ < var_242_7 + var_242_15 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play910109062 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 910109062
		arg_243_1.duration_ = 5

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play910109063(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0.5
			local var_246_1 = 0.5

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				local var_246_2 = "play"
				local var_246_3 = "effect"

				arg_243_1:AudioAction(var_246_2, var_246_3, "minigame_activity_spring_festival", "minigame_activity_spring_festival_hungry", "")
			end

			local var_246_4 = 0
			local var_246_5 = 0.775

			if var_246_4 < arg_243_1.time_ and arg_243_1.time_ <= var_246_4 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, false)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_6 = arg_243_1:GetWordFromCfg(910109062)
				local var_246_7 = arg_243_1:FormatText(var_246_6.content)

				arg_243_1.text_.text = var_246_7

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_8 = 31
				local var_246_9 = utf8.len(var_246_7)
				local var_246_10 = var_246_8 <= 0 and var_246_5 or var_246_5 * (var_246_9 / var_246_8)

				if var_246_10 > 0 and var_246_5 < var_246_10 then
					arg_243_1.talkMaxDuration = var_246_10

					if var_246_10 + var_246_4 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_10 + var_246_4
					end
				end

				arg_243_1.text_.text = var_246_7
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)
				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_11 = math.max(var_246_5, arg_243_1.talkMaxDuration)

			if var_246_4 <= arg_243_1.time_ and arg_243_1.time_ < var_246_4 + var_246_11 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_4) / var_246_11

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_4 + var_246_11 and arg_243_1.time_ < var_246_4 + var_246_11 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play910109063 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 910109063
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play910109064(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1070"].transform
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 then
				arg_247_1.var_.moveOldPos1070 = var_250_0.localPosition
				var_250_0.localScale = Vector3.New(1, 1, 1)

				arg_247_1:CheckSpriteTmpPos("1070", 3)

				local var_250_2 = var_250_0.childCount

				for iter_250_0 = 0, var_250_2 - 1 do
					local var_250_3 = var_250_0:GetChild(iter_250_0)

					if var_250_3.name == "split_9" or not string.find(var_250_3.name, "split") then
						var_250_3.gameObject:SetActive(true)
					else
						var_250_3.gameObject:SetActive(false)
					end
				end
			end

			local var_250_4 = 0.001

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_4 then
				local var_250_5 = (arg_247_1.time_ - var_250_1) / var_250_4
				local var_250_6 = Vector3.New(0, -350, -180)

				var_250_0.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1070, var_250_6, var_250_5)
			end

			if arg_247_1.time_ >= var_250_1 + var_250_4 and arg_247_1.time_ < var_250_1 + var_250_4 + arg_250_0 then
				var_250_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_250_7 = 0
			local var_250_8 = 0.2

			if var_250_7 < arg_247_1.time_ and arg_247_1.time_ <= var_250_7 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_9 = arg_247_1:FormatText(StoryNameCfg[318].name)

				arg_247_1.leftNameTxt_.text = var_250_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_10 = arg_247_1:GetWordFromCfg(910109063)
				local var_250_11 = arg_247_1:FormatText(var_250_10.content)

				arg_247_1.text_.text = var_250_11

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_12 = 8
				local var_250_13 = utf8.len(var_250_11)
				local var_250_14 = var_250_12 <= 0 and var_250_8 or var_250_8 * (var_250_13 / var_250_12)

				if var_250_14 > 0 and var_250_8 < var_250_14 then
					arg_247_1.talkMaxDuration = var_250_14

					if var_250_14 + var_250_7 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_14 + var_250_7
					end
				end

				arg_247_1.text_.text = var_250_11
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)
				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_15 = math.max(var_250_8, arg_247_1.talkMaxDuration)

			if var_250_7 <= arg_247_1.time_ and arg_247_1.time_ < var_250_7 + var_250_15 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_7) / var_250_15

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_7 + var_250_15 and arg_247_1.time_ < var_250_7 + var_250_15 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play910109064 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 910109064
		arg_251_1.duration_ = 5

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play910109065(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1070"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.actorSpriteComps1070 == nil then
				arg_251_1.var_.actorSpriteComps1070 = var_254_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_2 = 0.2

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.actorSpriteComps1070 then
					for iter_254_0, iter_254_1 in pairs(arg_251_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_254_1 then
							local var_254_4 = Mathf.Lerp(iter_254_1.color.r, 0.5, var_254_3)

							iter_254_1.color = Color.New(var_254_4, var_254_4, var_254_4)
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.actorSpriteComps1070 then
				local var_254_5 = 0.5

				for iter_254_2, iter_254_3 in pairs(arg_251_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_254_3 then
						iter_254_3.color = Color.New(var_254_5, var_254_5, var_254_5)
					end
				end

				arg_251_1.var_.actorSpriteComps1070 = nil
			end

			local var_254_6 = 0
			local var_254_7 = 0.325

			if var_254_6 < arg_251_1.time_ and arg_251_1.time_ <= var_254_6 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_8 = arg_251_1:FormatText(StoryNameCfg[7].name)

				arg_251_1.leftNameTxt_.text = var_254_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_9 = arg_251_1:GetWordFromCfg(910109064)
				local var_254_10 = arg_251_1:FormatText(var_254_9.content)

				arg_251_1.text_.text = var_254_10

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_11 = 13
				local var_254_12 = utf8.len(var_254_10)
				local var_254_13 = var_254_11 <= 0 and var_254_7 or var_254_7 * (var_254_12 / var_254_11)

				if var_254_13 > 0 and var_254_7 < var_254_13 then
					arg_251_1.talkMaxDuration = var_254_13

					if var_254_13 + var_254_6 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_13 + var_254_6
					end
				end

				arg_251_1.text_.text = var_254_10
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)
				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_14 = math.max(var_254_7, arg_251_1.talkMaxDuration)

			if var_254_6 <= arg_251_1.time_ and arg_251_1.time_ < var_254_6 + var_254_14 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_6) / var_254_14

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_6 + var_254_14 and arg_251_1.time_ < var_254_6 + var_254_14 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play910109065 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 910109065
		arg_255_1.duration_ = 5

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play910109066(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1070"]
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 and arg_255_1.var_.actorSpriteComps1070 == nil then
				arg_255_1.var_.actorSpriteComps1070 = var_258_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_258_2 = 0.2

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2

				if arg_255_1.var_.actorSpriteComps1070 then
					for iter_258_0, iter_258_1 in pairs(arg_255_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_258_1 then
							local var_258_4 = Mathf.Lerp(iter_258_1.color.r, 1, var_258_3)

							iter_258_1.color = Color.New(var_258_4, var_258_4, var_258_4)
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 and arg_255_1.var_.actorSpriteComps1070 then
				local var_258_5 = 1

				for iter_258_2, iter_258_3 in pairs(arg_255_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_258_3 then
						iter_258_3.color = Color.New(var_258_5, var_258_5, var_258_5)
					end
				end

				arg_255_1.var_.actorSpriteComps1070 = nil
			end

			local var_258_6 = 0
			local var_258_7 = 0.1

			if var_258_6 < arg_255_1.time_ and arg_255_1.time_ <= var_258_6 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_8 = arg_255_1:FormatText(StoryNameCfg[318].name)

				arg_255_1.leftNameTxt_.text = var_258_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_9 = arg_255_1:GetWordFromCfg(910109065)
				local var_258_10 = arg_255_1:FormatText(var_258_9.content)

				arg_255_1.text_.text = var_258_10

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_11 = 4
				local var_258_12 = utf8.len(var_258_10)
				local var_258_13 = var_258_11 <= 0 and var_258_7 or var_258_7 * (var_258_12 / var_258_11)

				if var_258_13 > 0 and var_258_7 < var_258_13 then
					arg_255_1.talkMaxDuration = var_258_13

					if var_258_13 + var_258_6 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_13 + var_258_6
					end
				end

				arg_255_1.text_.text = var_258_10
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)
				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_14 = math.max(var_258_7, arg_255_1.talkMaxDuration)

			if var_258_6 <= arg_255_1.time_ and arg_255_1.time_ < var_258_6 + var_258_14 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_6) / var_258_14

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_6 + var_258_14 and arg_255_1.time_ < var_258_6 + var_258_14 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play910109066 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 910109066
		arg_259_1.duration_ = 0.199999999999

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"

			SetActive(arg_259_1.choicesGo_, true)

			for iter_260_0, iter_260_1 in ipairs(arg_259_1.choices_) do
				local var_260_0 = iter_260_0 <= 2

				SetActive(iter_260_1.go, var_260_0)
			end

			arg_259_1.choices_[1].txt.text = arg_259_1:FormatText(StoryChoiceCfg[284].name)
			arg_259_1.choices_[2].txt.text = arg_259_1:FormatText(StoryChoiceCfg[285].name)
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play910109067(arg_259_1)
			end

			if arg_261_0 == 2 then
				arg_259_0:Play910109067(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1070"]
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 and arg_259_1.var_.actorSpriteComps1070 == nil then
				arg_259_1.var_.actorSpriteComps1070 = var_262_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_2 = 0.2

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2

				if arg_259_1.var_.actorSpriteComps1070 then
					for iter_262_0, iter_262_1 in pairs(arg_259_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_262_1 then
							local var_262_4 = Mathf.Lerp(iter_262_1.color.r, 0.5, var_262_3)

							iter_262_1.color = Color.New(var_262_4, var_262_4, var_262_4)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 and arg_259_1.var_.actorSpriteComps1070 then
				local var_262_5 = 0.5

				for iter_262_2, iter_262_3 in pairs(arg_259_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_262_3 then
						iter_262_3.color = Color.New(var_262_5, var_262_5, var_262_5)
					end
				end

				arg_259_1.var_.actorSpriteComps1070 = nil
			end
		end
	end,
	Play910109067 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 910109067
		arg_263_1.duration_ = 5

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play910109068(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1070"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos1070 = var_266_0.localPosition
				var_266_0.localScale = Vector3.New(1, 1, 1)

				arg_263_1:CheckSpriteTmpPos("1070", 3)

				local var_266_2 = var_266_0.childCount

				for iter_266_0 = 0, var_266_2 - 1 do
					local var_266_3 = var_266_0:GetChild(iter_266_0)

					if var_266_3.name == "split_4" or not string.find(var_266_3.name, "split") then
						var_266_3.gameObject:SetActive(true)
					else
						var_266_3.gameObject:SetActive(false)
					end
				end
			end

			local var_266_4 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_4 then
				local var_266_5 = (arg_263_1.time_ - var_266_1) / var_266_4
				local var_266_6 = Vector3.New(0, -350, -180)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1070, var_266_6, var_266_5)
			end

			if arg_263_1.time_ >= var_266_1 + var_266_4 and arg_263_1.time_ < var_266_1 + var_266_4 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_266_7 = arg_263_1.actors_["1070"]
			local var_266_8 = 0

			if var_266_8 < arg_263_1.time_ and arg_263_1.time_ <= var_266_8 + arg_266_0 and arg_263_1.var_.actorSpriteComps1070 == nil then
				arg_263_1.var_.actorSpriteComps1070 = var_266_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_9 = 0.0166666666666667

			if var_266_8 <= arg_263_1.time_ and arg_263_1.time_ < var_266_8 + var_266_9 then
				local var_266_10 = (arg_263_1.time_ - var_266_8) / var_266_9

				if arg_263_1.var_.actorSpriteComps1070 then
					for iter_266_1, iter_266_2 in pairs(arg_263_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_266_2 then
							local var_266_11 = Mathf.Lerp(iter_266_2.color.r, 1, var_266_10)

							iter_266_2.color = Color.New(var_266_11, var_266_11, var_266_11)
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_8 + var_266_9 and arg_263_1.time_ < var_266_8 + var_266_9 + arg_266_0 and arg_263_1.var_.actorSpriteComps1070 then
				local var_266_12 = 1

				for iter_266_3, iter_266_4 in pairs(arg_263_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_266_4 then
						iter_266_4.color = Color.New(var_266_12, var_266_12, var_266_12)
					end
				end

				arg_263_1.var_.actorSpriteComps1070 = nil
			end

			local var_266_13 = 0
			local var_266_14 = 0.975

			if var_266_13 < arg_263_1.time_ and arg_263_1.time_ <= var_266_13 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, false)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_15 = arg_263_1:GetWordFromCfg(910109067)
				local var_266_16 = arg_263_1:FormatText(var_266_15.content)

				arg_263_1.text_.text = var_266_16

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_17 = 39
				local var_266_18 = utf8.len(var_266_16)
				local var_266_19 = var_266_17 <= 0 and var_266_14 or var_266_14 * (var_266_18 / var_266_17)

				if var_266_19 > 0 and var_266_14 < var_266_19 then
					arg_263_1.talkMaxDuration = var_266_19

					if var_266_19 + var_266_13 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_19 + var_266_13
					end
				end

				arg_263_1.text_.text = var_266_16
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)
				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_20 = math.max(var_266_14, arg_263_1.talkMaxDuration)

			if var_266_13 <= arg_263_1.time_ and arg_263_1.time_ < var_266_13 + var_266_20 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_13) / var_266_20

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_13 + var_266_20 and arg_263_1.time_ < var_266_13 + var_266_20 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play910109068 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 910109068
		arg_267_1.duration_ = 5

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play910109069(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1070"]
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 and arg_267_1.var_.actorSpriteComps1070 == nil then
				arg_267_1.var_.actorSpriteComps1070 = var_270_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_2 = 0.0166666666666667

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2

				if arg_267_1.var_.actorSpriteComps1070 then
					for iter_270_0, iter_270_1 in pairs(arg_267_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_270_1 then
							local var_270_4 = Mathf.Lerp(iter_270_1.color.r, 0.5, var_270_3)

							iter_270_1.color = Color.New(var_270_4, var_270_4, var_270_4)
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 and arg_267_1.var_.actorSpriteComps1070 then
				local var_270_5 = 0.5

				for iter_270_2, iter_270_3 in pairs(arg_267_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_270_3 then
						iter_270_3.color = Color.New(var_270_5, var_270_5, var_270_5)
					end
				end

				arg_267_1.var_.actorSpriteComps1070 = nil
			end

			local var_270_6 = 0
			local var_270_7 = 0.125

			if var_270_6 < arg_267_1.time_ and arg_267_1.time_ <= var_270_6 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_8 = arg_267_1:FormatText(StoryNameCfg[7].name)

				arg_267_1.leftNameTxt_.text = var_270_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_9 = arg_267_1:GetWordFromCfg(910109068)
				local var_270_10 = arg_267_1:FormatText(var_270_9.content)

				arg_267_1.text_.text = var_270_10

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_11 = 5
				local var_270_12 = utf8.len(var_270_10)
				local var_270_13 = var_270_11 <= 0 and var_270_7 or var_270_7 * (var_270_12 / var_270_11)

				if var_270_13 > 0 and var_270_7 < var_270_13 then
					arg_267_1.talkMaxDuration = var_270_13

					if var_270_13 + var_270_6 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_13 + var_270_6
					end
				end

				arg_267_1.text_.text = var_270_10
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_14 = math.max(var_270_7, arg_267_1.talkMaxDuration)

			if var_270_6 <= arg_267_1.time_ and arg_267_1.time_ < var_270_6 + var_270_14 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_6) / var_270_14

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_6 + var_270_14 and arg_267_1.time_ < var_270_6 + var_270_14 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play910109069 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 910109069
		arg_271_1.duration_ = 5

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play910109070(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1039"].transform
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1.var_.moveOldPos1039 = var_274_0.localPosition
				var_274_0.localScale = Vector3.New(1, 1, 1)

				arg_271_1:CheckSpriteTmpPos("1039", 3)

				local var_274_2 = var_274_0.childCount

				for iter_274_0 = 0, var_274_2 - 1 do
					local var_274_3 = var_274_0:GetChild(iter_274_0)

					if var_274_3.name == "split_2" or not string.find(var_274_3.name, "split") then
						var_274_3.gameObject:SetActive(true)
					else
						var_274_3.gameObject:SetActive(false)
					end
				end
			end

			local var_274_4 = 0.001

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_4 then
				local var_274_5 = (arg_271_1.time_ - var_274_1) / var_274_4
				local var_274_6 = Vector3.New(0, -350, -180)

				var_274_0.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos1039, var_274_6, var_274_5)
			end

			if arg_271_1.time_ >= var_274_1 + var_274_4 and arg_271_1.time_ < var_274_1 + var_274_4 + arg_274_0 then
				var_274_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_274_7 = arg_271_1.actors_["1039"]
			local var_274_8 = 0

			if var_274_8 < arg_271_1.time_ and arg_271_1.time_ <= var_274_8 + arg_274_0 and arg_271_1.var_.actorSpriteComps1039 == nil then
				arg_271_1.var_.actorSpriteComps1039 = var_274_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_274_9 = 0.0166666666666667

			if var_274_8 <= arg_271_1.time_ and arg_271_1.time_ < var_274_8 + var_274_9 then
				local var_274_10 = (arg_271_1.time_ - var_274_8) / var_274_9

				if arg_271_1.var_.actorSpriteComps1039 then
					for iter_274_1, iter_274_2 in pairs(arg_271_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_274_2 then
							local var_274_11 = Mathf.Lerp(iter_274_2.color.r, 1, var_274_10)

							iter_274_2.color = Color.New(var_274_11, var_274_11, var_274_11)
						end
					end
				end
			end

			if arg_271_1.time_ >= var_274_8 + var_274_9 and arg_271_1.time_ < var_274_8 + var_274_9 + arg_274_0 and arg_271_1.var_.actorSpriteComps1039 then
				local var_274_12 = 1

				for iter_274_3, iter_274_4 in pairs(arg_271_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_274_4 then
						iter_274_4.color = Color.New(var_274_12, var_274_12, var_274_12)
					end
				end

				arg_271_1.var_.actorSpriteComps1039 = nil
			end

			local var_274_13 = 0
			local var_274_14 = 0.6

			if var_274_13 < arg_271_1.time_ and arg_271_1.time_ <= var_274_13 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_15 = arg_271_1:FormatText(StoryNameCfg[9].name)

				arg_271_1.leftNameTxt_.text = var_274_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_16 = arg_271_1:GetWordFromCfg(910109069)
				local var_274_17 = arg_271_1:FormatText(var_274_16.content)

				arg_271_1.text_.text = var_274_17

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_18 = 24
				local var_274_19 = utf8.len(var_274_17)
				local var_274_20 = var_274_18 <= 0 and var_274_14 or var_274_14 * (var_274_19 / var_274_18)

				if var_274_20 > 0 and var_274_14 < var_274_20 then
					arg_271_1.talkMaxDuration = var_274_20

					if var_274_20 + var_274_13 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_20 + var_274_13
					end
				end

				arg_271_1.text_.text = var_274_17
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)
				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_21 = math.max(var_274_14, arg_271_1.talkMaxDuration)

			if var_274_13 <= arg_271_1.time_ and arg_271_1.time_ < var_274_13 + var_274_21 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_13) / var_274_21

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_13 + var_274_21 and arg_271_1.time_ < var_274_13 + var_274_21 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play910109070 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 910109070
		arg_275_1.duration_ = 5

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play910109071(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1070"].transform
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 then
				arg_275_1.var_.moveOldPos1070 = var_278_0.localPosition
				var_278_0.localScale = Vector3.New(1, 1, 1)

				arg_275_1:CheckSpriteTmpPos("1070", 3)

				local var_278_2 = var_278_0.childCount

				for iter_278_0 = 0, var_278_2 - 1 do
					local var_278_3 = var_278_0:GetChild(iter_278_0)

					if var_278_3.name == "split_2" or not string.find(var_278_3.name, "split") then
						var_278_3.gameObject:SetActive(true)
					else
						var_278_3.gameObject:SetActive(false)
					end
				end
			end

			local var_278_4 = 0.001

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_4 then
				local var_278_5 = (arg_275_1.time_ - var_278_1) / var_278_4
				local var_278_6 = Vector3.New(0, -350, -180)

				var_278_0.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1070, var_278_6, var_278_5)
			end

			if arg_275_1.time_ >= var_278_1 + var_278_4 and arg_275_1.time_ < var_278_1 + var_278_4 + arg_278_0 then
				var_278_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_278_7 = arg_275_1.actors_["1070"]
			local var_278_8 = 0

			if var_278_8 < arg_275_1.time_ and arg_275_1.time_ <= var_278_8 + arg_278_0 and arg_275_1.var_.actorSpriteComps1070 == nil then
				arg_275_1.var_.actorSpriteComps1070 = var_278_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_278_9 = 0.0166666666666667

			if var_278_8 <= arg_275_1.time_ and arg_275_1.time_ < var_278_8 + var_278_9 then
				local var_278_10 = (arg_275_1.time_ - var_278_8) / var_278_9

				if arg_275_1.var_.actorSpriteComps1070 then
					for iter_278_1, iter_278_2 in pairs(arg_275_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_278_2 then
							local var_278_11 = Mathf.Lerp(iter_278_2.color.r, 1, var_278_10)

							iter_278_2.color = Color.New(var_278_11, var_278_11, var_278_11)
						end
					end
				end
			end

			if arg_275_1.time_ >= var_278_8 + var_278_9 and arg_275_1.time_ < var_278_8 + var_278_9 + arg_278_0 and arg_275_1.var_.actorSpriteComps1070 then
				local var_278_12 = 1

				for iter_278_3, iter_278_4 in pairs(arg_275_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_278_4 then
						iter_278_4.color = Color.New(var_278_12, var_278_12, var_278_12)
					end
				end

				arg_275_1.var_.actorSpriteComps1070 = nil
			end

			local var_278_13 = 0
			local var_278_14 = 0.375

			if var_278_13 < arg_275_1.time_ and arg_275_1.time_ <= var_278_13 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_15 = arg_275_1:FormatText(StoryNameCfg[318].name)

				arg_275_1.leftNameTxt_.text = var_278_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_16 = arg_275_1:GetWordFromCfg(910109070)
				local var_278_17 = arg_275_1:FormatText(var_278_16.content)

				arg_275_1.text_.text = var_278_17

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_18 = 15
				local var_278_19 = utf8.len(var_278_17)
				local var_278_20 = var_278_18 <= 0 and var_278_14 or var_278_14 * (var_278_19 / var_278_18)

				if var_278_20 > 0 and var_278_14 < var_278_20 then
					arg_275_1.talkMaxDuration = var_278_20

					if var_278_20 + var_278_13 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_20 + var_278_13
					end
				end

				arg_275_1.text_.text = var_278_17
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)
				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_21 = math.max(var_278_14, arg_275_1.talkMaxDuration)

			if var_278_13 <= arg_275_1.time_ and arg_275_1.time_ < var_278_13 + var_278_21 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_13) / var_278_21

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_13 + var_278_21 and arg_275_1.time_ < var_278_13 + var_278_21 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play910109071 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 910109071
		arg_279_1.duration_ = 5

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play910109072(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1070"]
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 and arg_279_1.var_.actorSpriteComps1070 == nil then
				arg_279_1.var_.actorSpriteComps1070 = var_282_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_282_2 = 0.0166666666666667

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2

				if arg_279_1.var_.actorSpriteComps1070 then
					for iter_282_0, iter_282_1 in pairs(arg_279_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_282_1 then
							local var_282_4 = Mathf.Lerp(iter_282_1.color.r, 1, var_282_3)

							iter_282_1.color = Color.New(var_282_4, var_282_4, var_282_4)
						end
					end
				end
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 and arg_279_1.var_.actorSpriteComps1070 then
				local var_282_5 = 1

				for iter_282_2, iter_282_3 in pairs(arg_279_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_282_3 then
						iter_282_3.color = Color.New(var_282_5, var_282_5, var_282_5)
					end
				end

				arg_279_1.var_.actorSpriteComps1070 = nil
			end

			local var_282_6 = arg_279_1.actors_["1070"].transform
			local var_282_7 = 0

			if var_282_7 < arg_279_1.time_ and arg_279_1.time_ <= var_282_7 + arg_282_0 then
				arg_279_1.var_.moveOldPos1070 = var_282_6.localPosition
				var_282_6.localScale = Vector3.New(1, 1, 1)

				arg_279_1:CheckSpriteTmpPos("1070", 3)

				local var_282_8 = var_282_6.childCount

				for iter_282_4 = 0, var_282_8 - 1 do
					local var_282_9 = var_282_6:GetChild(iter_282_4)

					if var_282_9.name == "split_10" or not string.find(var_282_9.name, "split") then
						var_282_9.gameObject:SetActive(true)
					else
						var_282_9.gameObject:SetActive(false)
					end
				end
			end

			local var_282_10 = 0.001

			if var_282_7 <= arg_279_1.time_ and arg_279_1.time_ < var_282_7 + var_282_10 then
				local var_282_11 = (arg_279_1.time_ - var_282_7) / var_282_10
				local var_282_12 = Vector3.New(0, -350, -180)

				var_282_6.localPosition = Vector3.Lerp(arg_279_1.var_.moveOldPos1070, var_282_12, var_282_11)
			end

			if arg_279_1.time_ >= var_282_7 + var_282_10 and arg_279_1.time_ < var_282_7 + var_282_10 + arg_282_0 then
				var_282_6.localPosition = Vector3.New(0, -350, -180)
			end

			local var_282_13 = 0
			local var_282_14 = 0.65

			if var_282_13 < arg_279_1.time_ and arg_279_1.time_ <= var_282_13 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_15 = arg_279_1:FormatText(StoryNameCfg[318].name)

				arg_279_1.leftNameTxt_.text = var_282_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_16 = arg_279_1:GetWordFromCfg(910109071)
				local var_282_17 = arg_279_1:FormatText(var_282_16.content)

				arg_279_1.text_.text = var_282_17

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_18 = 26
				local var_282_19 = utf8.len(var_282_17)
				local var_282_20 = var_282_18 <= 0 and var_282_14 or var_282_14 * (var_282_19 / var_282_18)

				if var_282_20 > 0 and var_282_14 < var_282_20 then
					arg_279_1.talkMaxDuration = var_282_20

					if var_282_20 + var_282_13 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_20 + var_282_13
					end
				end

				arg_279_1.text_.text = var_282_17
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)
				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_21 = math.max(var_282_14, arg_279_1.talkMaxDuration)

			if var_282_13 <= arg_279_1.time_ and arg_279_1.time_ < var_282_13 + var_282_21 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_13) / var_282_21

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_13 + var_282_21 and arg_279_1.time_ < var_282_13 + var_282_21 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play910109072 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 910109072
		arg_283_1.duration_ = 5

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play910109073(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["1070"].transform
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 then
				arg_283_1.var_.moveOldPos1070 = var_286_0.localPosition
				var_286_0.localScale = Vector3.New(1, 1, 1)

				arg_283_1:CheckSpriteTmpPos("1070", 3)

				local var_286_2 = var_286_0.childCount

				for iter_286_0 = 0, var_286_2 - 1 do
					local var_286_3 = var_286_0:GetChild(iter_286_0)

					if var_286_3.name == "split_4" or not string.find(var_286_3.name, "split") then
						var_286_3.gameObject:SetActive(true)
					else
						var_286_3.gameObject:SetActive(false)
					end
				end
			end

			local var_286_4 = 0.001

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_4 then
				local var_286_5 = (arg_283_1.time_ - var_286_1) / var_286_4
				local var_286_6 = Vector3.New(0, -350, -180)

				var_286_0.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos1070, var_286_6, var_286_5)
			end

			if arg_283_1.time_ >= var_286_1 + var_286_4 and arg_283_1.time_ < var_286_1 + var_286_4 + arg_286_0 then
				var_286_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_286_7 = arg_283_1.actors_["1070"]
			local var_286_8 = 0

			if var_286_8 < arg_283_1.time_ and arg_283_1.time_ <= var_286_8 + arg_286_0 and arg_283_1.var_.actorSpriteComps1070 == nil then
				arg_283_1.var_.actorSpriteComps1070 = var_286_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_286_9 = 0.0166666666666667

			if var_286_8 <= arg_283_1.time_ and arg_283_1.time_ < var_286_8 + var_286_9 then
				local var_286_10 = (arg_283_1.time_ - var_286_8) / var_286_9

				if arg_283_1.var_.actorSpriteComps1070 then
					for iter_286_1, iter_286_2 in pairs(arg_283_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_286_2 then
							local var_286_11 = Mathf.Lerp(iter_286_2.color.r, 1, var_286_10)

							iter_286_2.color = Color.New(var_286_11, var_286_11, var_286_11)
						end
					end
				end
			end

			if arg_283_1.time_ >= var_286_8 + var_286_9 and arg_283_1.time_ < var_286_8 + var_286_9 + arg_286_0 and arg_283_1.var_.actorSpriteComps1070 then
				local var_286_12 = 1

				for iter_286_3, iter_286_4 in pairs(arg_283_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_286_4 then
						iter_286_4.color = Color.New(var_286_12, var_286_12, var_286_12)
					end
				end

				arg_283_1.var_.actorSpriteComps1070 = nil
			end

			local var_286_13 = 0
			local var_286_14 = 0.1

			if var_286_13 < arg_283_1.time_ and arg_283_1.time_ <= var_286_13 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_15 = arg_283_1:FormatText(StoryNameCfg[318].name)

				arg_283_1.leftNameTxt_.text = var_286_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_16 = arg_283_1:GetWordFromCfg(910109072)
				local var_286_17 = arg_283_1:FormatText(var_286_16.content)

				arg_283_1.text_.text = var_286_17

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_18 = 4
				local var_286_19 = utf8.len(var_286_17)
				local var_286_20 = var_286_18 <= 0 and var_286_14 or var_286_14 * (var_286_19 / var_286_18)

				if var_286_20 > 0 and var_286_14 < var_286_20 then
					arg_283_1.talkMaxDuration = var_286_20

					if var_286_20 + var_286_13 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_20 + var_286_13
					end
				end

				arg_283_1.text_.text = var_286_17
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)
				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_21 = math.max(var_286_14, arg_283_1.talkMaxDuration)

			if var_286_13 <= arg_283_1.time_ and arg_283_1.time_ < var_286_13 + var_286_21 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_13) / var_286_21

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_13 + var_286_21 and arg_283_1.time_ < var_286_13 + var_286_21 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play910109073 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 910109073
		arg_287_1.duration_ = 5

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play910109074(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0
			local var_290_1 = 0.25

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_2 = arg_287_1:FormatText(StoryNameCfg[318].name)

				arg_287_1.leftNameTxt_.text = var_290_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_3 = arg_287_1:GetWordFromCfg(910109073)
				local var_290_4 = arg_287_1:FormatText(var_290_3.content)

				arg_287_1.text_.text = var_290_4

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_5 = 10
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
				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_8 = math.max(var_290_1, arg_287_1.talkMaxDuration)

			if var_290_0 <= arg_287_1.time_ and arg_287_1.time_ < var_290_0 + var_290_8 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_0) / var_290_8

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_0 + var_290_8 and arg_287_1.time_ < var_290_0 + var_290_8 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play910109074 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 910109074
		arg_291_1.duration_ = 5

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play910109075(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["1039"].transform
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1.var_.moveOldPos1039 = var_294_0.localPosition
				var_294_0.localScale = Vector3.New(1, 1, 1)

				arg_291_1:CheckSpriteTmpPos("1039", 3)

				local var_294_2 = var_294_0.childCount

				for iter_294_0 = 0, var_294_2 - 1 do
					local var_294_3 = var_294_0:GetChild(iter_294_0)

					if var_294_3.name == "split_1" or not string.find(var_294_3.name, "split") then
						var_294_3.gameObject:SetActive(true)
					else
						var_294_3.gameObject:SetActive(false)
					end
				end
			end

			local var_294_4 = 0.001

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_4 then
				local var_294_5 = (arg_291_1.time_ - var_294_1) / var_294_4
				local var_294_6 = Vector3.New(0, -350, -180)

				var_294_0.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1039, var_294_6, var_294_5)
			end

			if arg_291_1.time_ >= var_294_1 + var_294_4 and arg_291_1.time_ < var_294_1 + var_294_4 + arg_294_0 then
				var_294_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_294_7 = arg_291_1.actors_["1039"]
			local var_294_8 = 0

			if var_294_8 < arg_291_1.time_ and arg_291_1.time_ <= var_294_8 + arg_294_0 and arg_291_1.var_.actorSpriteComps1039 == nil then
				arg_291_1.var_.actorSpriteComps1039 = var_294_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_294_9 = 0.0166666666666667

			if var_294_8 <= arg_291_1.time_ and arg_291_1.time_ < var_294_8 + var_294_9 then
				local var_294_10 = (arg_291_1.time_ - var_294_8) / var_294_9

				if arg_291_1.var_.actorSpriteComps1039 then
					for iter_294_1, iter_294_2 in pairs(arg_291_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_294_2 then
							local var_294_11 = Mathf.Lerp(iter_294_2.color.r, 1, var_294_10)

							iter_294_2.color = Color.New(var_294_11, var_294_11, var_294_11)
						end
					end
				end
			end

			if arg_291_1.time_ >= var_294_8 + var_294_9 and arg_291_1.time_ < var_294_8 + var_294_9 + arg_294_0 and arg_291_1.var_.actorSpriteComps1039 then
				local var_294_12 = 1

				for iter_294_3, iter_294_4 in pairs(arg_291_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_294_4 then
						iter_294_4.color = Color.New(var_294_12, var_294_12, var_294_12)
					end
				end

				arg_291_1.var_.actorSpriteComps1039 = nil
			end

			local var_294_13 = 0
			local var_294_14 = 0.825

			if var_294_13 < arg_291_1.time_ and arg_291_1.time_ <= var_294_13 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_15 = arg_291_1:FormatText(StoryNameCfg[9].name)

				arg_291_1.leftNameTxt_.text = var_294_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_16 = arg_291_1:GetWordFromCfg(910109074)
				local var_294_17 = arg_291_1:FormatText(var_294_16.content)

				arg_291_1.text_.text = var_294_17

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_18 = 33
				local var_294_19 = utf8.len(var_294_17)
				local var_294_20 = var_294_18 <= 0 and var_294_14 or var_294_14 * (var_294_19 / var_294_18)

				if var_294_20 > 0 and var_294_14 < var_294_20 then
					arg_291_1.talkMaxDuration = var_294_20

					if var_294_20 + var_294_13 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_20 + var_294_13
					end
				end

				arg_291_1.text_.text = var_294_17
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)
				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_21 = math.max(var_294_14, arg_291_1.talkMaxDuration)

			if var_294_13 <= arg_291_1.time_ and arg_291_1.time_ < var_294_13 + var_294_21 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_13) / var_294_21

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_13 + var_294_21 and arg_291_1.time_ < var_294_13 + var_294_21 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play910109075 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 910109075
		arg_295_1.duration_ = 5

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play910109076(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["1070"].transform
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 then
				arg_295_1.var_.moveOldPos1070 = var_298_0.localPosition
				var_298_0.localScale = Vector3.New(1, 1, 1)

				arg_295_1:CheckSpriteTmpPos("1070", 3)

				local var_298_2 = var_298_0.childCount

				for iter_298_0 = 0, var_298_2 - 1 do
					local var_298_3 = var_298_0:GetChild(iter_298_0)

					if var_298_3.name == "split_2" or not string.find(var_298_3.name, "split") then
						var_298_3.gameObject:SetActive(true)
					else
						var_298_3.gameObject:SetActive(false)
					end
				end
			end

			local var_298_4 = 0.001

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_4 then
				local var_298_5 = (arg_295_1.time_ - var_298_1) / var_298_4
				local var_298_6 = Vector3.New(0, -350, -180)

				var_298_0.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos1070, var_298_6, var_298_5)
			end

			if arg_295_1.time_ >= var_298_1 + var_298_4 and arg_295_1.time_ < var_298_1 + var_298_4 + arg_298_0 then
				var_298_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_298_7 = arg_295_1.actors_["1070"]
			local var_298_8 = 0

			if var_298_8 < arg_295_1.time_ and arg_295_1.time_ <= var_298_8 + arg_298_0 and arg_295_1.var_.actorSpriteComps1070 == nil then
				arg_295_1.var_.actorSpriteComps1070 = var_298_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_298_9 = 0.0166666666666667

			if var_298_8 <= arg_295_1.time_ and arg_295_1.time_ < var_298_8 + var_298_9 then
				local var_298_10 = (arg_295_1.time_ - var_298_8) / var_298_9

				if arg_295_1.var_.actorSpriteComps1070 then
					for iter_298_1, iter_298_2 in pairs(arg_295_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_298_2 then
							local var_298_11 = Mathf.Lerp(iter_298_2.color.r, 1, var_298_10)

							iter_298_2.color = Color.New(var_298_11, var_298_11, var_298_11)
						end
					end
				end
			end

			if arg_295_1.time_ >= var_298_8 + var_298_9 and arg_295_1.time_ < var_298_8 + var_298_9 + arg_298_0 and arg_295_1.var_.actorSpriteComps1070 then
				local var_298_12 = 1

				for iter_298_3, iter_298_4 in pairs(arg_295_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_298_4 then
						iter_298_4.color = Color.New(var_298_12, var_298_12, var_298_12)
					end
				end

				arg_295_1.var_.actorSpriteComps1070 = nil
			end

			local var_298_13 = 0
			local var_298_14 = 0.25

			if var_298_13 < arg_295_1.time_ and arg_295_1.time_ <= var_298_13 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_15 = arg_295_1:FormatText(StoryNameCfg[318].name)

				arg_295_1.leftNameTxt_.text = var_298_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_16 = arg_295_1:GetWordFromCfg(910109075)
				local var_298_17 = arg_295_1:FormatText(var_298_16.content)

				arg_295_1.text_.text = var_298_17

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_18 = 10
				local var_298_19 = utf8.len(var_298_17)
				local var_298_20 = var_298_18 <= 0 and var_298_14 or var_298_14 * (var_298_19 / var_298_18)

				if var_298_20 > 0 and var_298_14 < var_298_20 then
					arg_295_1.talkMaxDuration = var_298_20

					if var_298_20 + var_298_13 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_20 + var_298_13
					end
				end

				arg_295_1.text_.text = var_298_17
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)
				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_21 = math.max(var_298_14, arg_295_1.talkMaxDuration)

			if var_298_13 <= arg_295_1.time_ and arg_295_1.time_ < var_298_13 + var_298_21 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_13) / var_298_21

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_13 + var_298_21 and arg_295_1.time_ < var_298_13 + var_298_21 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play910109076 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 910109076
		arg_299_1.duration_ = 5

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play910109077(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = arg_299_1.actors_["1070"]
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 and arg_299_1.var_.actorSpriteComps1070 == nil then
				arg_299_1.var_.actorSpriteComps1070 = var_302_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_302_2 = 0.0166666666666667

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_2 then
				local var_302_3 = (arg_299_1.time_ - var_302_1) / var_302_2

				if arg_299_1.var_.actorSpriteComps1070 then
					for iter_302_0, iter_302_1 in pairs(arg_299_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_302_1 then
							local var_302_4 = Mathf.Lerp(iter_302_1.color.r, 0.5, var_302_3)

							iter_302_1.color = Color.New(var_302_4, var_302_4, var_302_4)
						end
					end
				end
			end

			if arg_299_1.time_ >= var_302_1 + var_302_2 and arg_299_1.time_ < var_302_1 + var_302_2 + arg_302_0 and arg_299_1.var_.actorSpriteComps1070 then
				local var_302_5 = 0.5

				for iter_302_2, iter_302_3 in pairs(arg_299_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_302_3 then
						iter_302_3.color = Color.New(var_302_5, var_302_5, var_302_5)
					end
				end

				arg_299_1.var_.actorSpriteComps1070 = nil
			end

			local var_302_6 = 0
			local var_302_7 = 1.25

			if var_302_6 < arg_299_1.time_ and arg_299_1.time_ <= var_302_6 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, false)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_8 = arg_299_1:GetWordFromCfg(910109076)
				local var_302_9 = arg_299_1:FormatText(var_302_8.content)

				arg_299_1.text_.text = var_302_9

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_10 = 49
				local var_302_11 = utf8.len(var_302_9)
				local var_302_12 = var_302_10 <= 0 and var_302_7 or var_302_7 * (var_302_11 / var_302_10)

				if var_302_12 > 0 and var_302_7 < var_302_12 then
					arg_299_1.talkMaxDuration = var_302_12

					if var_302_12 + var_302_6 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_12 + var_302_6
					end
				end

				arg_299_1.text_.text = var_302_9
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)
				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_13 = math.max(var_302_7, arg_299_1.talkMaxDuration)

			if var_302_6 <= arg_299_1.time_ and arg_299_1.time_ < var_302_6 + var_302_13 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_6) / var_302_13

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_6 + var_302_13 and arg_299_1.time_ < var_302_6 + var_302_13 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play910109077 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 910109077
		arg_303_1.duration_ = 6.3

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play910109078(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = "ST01"

			if arg_303_1.bgs_[var_306_0] == nil then
				local var_306_1 = Object.Instantiate(arg_303_1.paintGo_)

				var_306_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_306_0)
				var_306_1.name = var_306_0
				var_306_1.transform.parent = arg_303_1.stage_.transform
				var_306_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_303_1.bgs_[var_306_0] = var_306_1
			end

			local var_306_2 = 1.3

			if var_306_2 < arg_303_1.time_ and arg_303_1.time_ <= var_306_2 + arg_306_0 then
				local var_306_3 = manager.ui.mainCamera.transform.localPosition
				local var_306_4 = Vector3.New(0, 0, 10) + Vector3.New(var_306_3.x, var_306_3.y, 0)
				local var_306_5 = arg_303_1.bgs_.ST01

				var_306_5.transform.localPosition = var_306_4
				var_306_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_306_6 = var_306_5:GetComponent("SpriteRenderer")

				if var_306_6 and var_306_6.sprite then
					local var_306_7 = (var_306_5.transform.localPosition - var_306_3).z
					local var_306_8 = manager.ui.mainCameraCom_
					local var_306_9 = 2 * var_306_7 * Mathf.Tan(var_306_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_306_10 = var_306_9 * var_306_8.aspect
					local var_306_11 = var_306_6.sprite.bounds.size.x
					local var_306_12 = var_306_6.sprite.bounds.size.y
					local var_306_13 = var_306_10 / var_306_11
					local var_306_14 = var_306_9 / var_306_12
					local var_306_15 = var_306_14 < var_306_13 and var_306_13 or var_306_14

					var_306_5.transform.localScale = Vector3.New(var_306_15, var_306_15, 0)
				end

				for iter_306_0, iter_306_1 in pairs(arg_303_1.bgs_) do
					if iter_306_0 ~= "ST01" then
						iter_306_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_306_16 = 0

			if var_306_16 < arg_303_1.time_ and arg_303_1.time_ <= var_306_16 + arg_306_0 then
				arg_303_1.mask_.enabled = true
				arg_303_1.mask_.raycastTarget = true

				arg_303_1:SetGaussion(false)
			end

			local var_306_17 = 1.3

			if var_306_16 <= arg_303_1.time_ and arg_303_1.time_ < var_306_16 + var_306_17 then
				local var_306_18 = (arg_303_1.time_ - var_306_16) / var_306_17
				local var_306_19 = Color.New(0, 0, 0)

				var_306_19.a = Mathf.Lerp(0, 1, var_306_18)
				arg_303_1.mask_.color = var_306_19
			end

			if arg_303_1.time_ >= var_306_16 + var_306_17 and arg_303_1.time_ < var_306_16 + var_306_17 + arg_306_0 then
				local var_306_20 = Color.New(0, 0, 0)

				var_306_20.a = 1
				arg_303_1.mask_.color = var_306_20
			end

			local var_306_21 = 1.3

			if var_306_21 < arg_303_1.time_ and arg_303_1.time_ <= var_306_21 + arg_306_0 then
				arg_303_1.mask_.enabled = true
				arg_303_1.mask_.raycastTarget = true

				arg_303_1:SetGaussion(false)
			end

			local var_306_22 = 1.3

			if var_306_21 <= arg_303_1.time_ and arg_303_1.time_ < var_306_21 + var_306_22 then
				local var_306_23 = (arg_303_1.time_ - var_306_21) / var_306_22
				local var_306_24 = Color.New(0, 0, 0)

				var_306_24.a = Mathf.Lerp(1, 0, var_306_23)
				arg_303_1.mask_.color = var_306_24
			end

			if arg_303_1.time_ >= var_306_21 + var_306_22 and arg_303_1.time_ < var_306_21 + var_306_22 + arg_306_0 then
				local var_306_25 = Color.New(0, 0, 0)
				local var_306_26 = 0

				arg_303_1.mask_.enabled = false
				var_306_25.a = var_306_26
				arg_303_1.mask_.color = var_306_25
			end

			local var_306_27 = arg_303_1.actors_["1070"].transform
			local var_306_28 = 1.3

			if var_306_28 < arg_303_1.time_ and arg_303_1.time_ <= var_306_28 + arg_306_0 then
				arg_303_1.var_.moveOldPos1070 = var_306_27.localPosition
				var_306_27.localScale = Vector3.New(1, 1, 1)

				arg_303_1:CheckSpriteTmpPos("1070", 7)

				local var_306_29 = var_306_27.childCount

				for iter_306_2 = 0, var_306_29 - 1 do
					local var_306_30 = var_306_27:GetChild(iter_306_2)

					if var_306_30.name == "split_2" or not string.find(var_306_30.name, "split") then
						var_306_30.gameObject:SetActive(true)
					else
						var_306_30.gameObject:SetActive(false)
					end
				end
			end

			local var_306_31 = 0.001

			if var_306_28 <= arg_303_1.time_ and arg_303_1.time_ < var_306_28 + var_306_31 then
				local var_306_32 = (arg_303_1.time_ - var_306_28) / var_306_31
				local var_306_33 = Vector3.New(0, -2000, -180)

				var_306_27.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos1070, var_306_33, var_306_32)
			end

			if arg_303_1.time_ >= var_306_28 + var_306_31 and arg_303_1.time_ < var_306_28 + var_306_31 + arg_306_0 then
				var_306_27.localPosition = Vector3.New(0, -2000, -180)
			end

			if arg_303_1.frameCnt_ <= 1 then
				arg_303_1.dialog_:SetActive(false)
			end

			local var_306_34 = 1.3
			local var_306_35 = 1.3

			if var_306_34 < arg_303_1.time_ and arg_303_1.time_ <= var_306_34 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0

				arg_303_1.dialog_:SetActive(true)

				local var_306_36 = LeanTween.value(arg_303_1.dialog_, 0, 1, 0.3)

				var_306_36:setOnUpdate(LuaHelper.FloatAction(function(arg_307_0)
					arg_303_1.dialogCg_.alpha = arg_307_0
				end))
				var_306_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_303_1.dialog_)
					var_306_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_303_1.duration_ = arg_303_1.duration_ + 0.3

				SetActive(arg_303_1.leftNameGo_, false)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_37 = arg_303_1:GetWordFromCfg(910109077)
				local var_306_38 = arg_303_1:FormatText(var_306_37.content)

				arg_303_1.text_.text = var_306_38

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_39 = 52
				local var_306_40 = utf8.len(var_306_38)
				local var_306_41 = var_306_39 <= 0 and var_306_35 or var_306_35 * (var_306_40 / var_306_39)

				if var_306_41 > 0 and var_306_35 < var_306_41 then
					arg_303_1.talkMaxDuration = var_306_41
					var_306_34 = var_306_34 + 0.3

					if var_306_41 + var_306_34 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_41 + var_306_34
					end
				end

				arg_303_1.text_.text = var_306_38
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)
				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_42 = var_306_34 + 0.3
			local var_306_43 = math.max(var_306_35, arg_303_1.talkMaxDuration)

			if var_306_42 <= arg_303_1.time_ and arg_303_1.time_ < var_306_42 + var_306_43 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_42) / var_306_43

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_42 + var_306_43 and arg_303_1.time_ < var_306_42 + var_306_43 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play910109078 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 910109078
		arg_309_1.duration_ = 5

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play910109079(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1070"].transform
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 then
				arg_309_1.var_.moveOldPos1070 = var_312_0.localPosition
				var_312_0.localScale = Vector3.New(1, 1, 1)

				arg_309_1:CheckSpriteTmpPos("1070", 3)

				local var_312_2 = var_312_0.childCount

				for iter_312_0 = 0, var_312_2 - 1 do
					local var_312_3 = var_312_0:GetChild(iter_312_0)

					if var_312_3.name == "split_5" or not string.find(var_312_3.name, "split") then
						var_312_3.gameObject:SetActive(true)
					else
						var_312_3.gameObject:SetActive(false)
					end
				end
			end

			local var_312_4 = 0.001

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_4 then
				local var_312_5 = (arg_309_1.time_ - var_312_1) / var_312_4
				local var_312_6 = Vector3.New(0, -350, -180)

				var_312_0.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1070, var_312_6, var_312_5)
			end

			if arg_309_1.time_ >= var_312_1 + var_312_4 and arg_309_1.time_ < var_312_1 + var_312_4 + arg_312_0 then
				var_312_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_312_7 = arg_309_1.actors_["1070"]
			local var_312_8 = 0

			if var_312_8 < arg_309_1.time_ and arg_309_1.time_ <= var_312_8 + arg_312_0 and arg_309_1.var_.actorSpriteComps1070 == nil then
				arg_309_1.var_.actorSpriteComps1070 = var_312_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_312_9 = 0.0166666666666667

			if var_312_8 <= arg_309_1.time_ and arg_309_1.time_ < var_312_8 + var_312_9 then
				local var_312_10 = (arg_309_1.time_ - var_312_8) / var_312_9

				if arg_309_1.var_.actorSpriteComps1070 then
					for iter_312_1, iter_312_2 in pairs(arg_309_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_312_2 then
							local var_312_11 = Mathf.Lerp(iter_312_2.color.r, 1, var_312_10)

							iter_312_2.color = Color.New(var_312_11, var_312_11, var_312_11)
						end
					end
				end
			end

			if arg_309_1.time_ >= var_312_8 + var_312_9 and arg_309_1.time_ < var_312_8 + var_312_9 + arg_312_0 and arg_309_1.var_.actorSpriteComps1070 then
				local var_312_12 = 1

				for iter_312_3, iter_312_4 in pairs(arg_309_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_312_4 then
						iter_312_4.color = Color.New(var_312_12, var_312_12, var_312_12)
					end
				end

				arg_309_1.var_.actorSpriteComps1070 = nil
			end

			local var_312_13 = 0
			local var_312_14 = 0.325

			if var_312_13 < arg_309_1.time_ and arg_309_1.time_ <= var_312_13 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_15 = arg_309_1:FormatText(StoryNameCfg[318].name)

				arg_309_1.leftNameTxt_.text = var_312_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_16 = arg_309_1:GetWordFromCfg(910109078)
				local var_312_17 = arg_309_1:FormatText(var_312_16.content)

				arg_309_1.text_.text = var_312_17

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_18 = 13
				local var_312_19 = utf8.len(var_312_17)
				local var_312_20 = var_312_18 <= 0 and var_312_14 or var_312_14 * (var_312_19 / var_312_18)

				if var_312_20 > 0 and var_312_14 < var_312_20 then
					arg_309_1.talkMaxDuration = var_312_20

					if var_312_20 + var_312_13 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_20 + var_312_13
					end
				end

				arg_309_1.text_.text = var_312_17
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)
				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_21 = math.max(var_312_14, arg_309_1.talkMaxDuration)

			if var_312_13 <= arg_309_1.time_ and arg_309_1.time_ < var_312_13 + var_312_21 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_13) / var_312_21

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_13 + var_312_21 and arg_309_1.time_ < var_312_13 + var_312_21 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play910109079 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 910109079
		arg_313_1.duration_ = 5

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play910109080(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["1070"].transform
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 then
				arg_313_1.var_.moveOldPos1070 = var_316_0.localPosition
				var_316_0.localScale = Vector3.New(1, 1, 1)

				arg_313_1:CheckSpriteTmpPos("1070", 3)

				local var_316_2 = var_316_0.childCount

				for iter_316_0 = 0, var_316_2 - 1 do
					local var_316_3 = var_316_0:GetChild(iter_316_0)

					if var_316_3.name == "split_4" or not string.find(var_316_3.name, "split") then
						var_316_3.gameObject:SetActive(true)
					else
						var_316_3.gameObject:SetActive(false)
					end
				end
			end

			local var_316_4 = 0.001

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_4 then
				local var_316_5 = (arg_313_1.time_ - var_316_1) / var_316_4
				local var_316_6 = Vector3.New(0, -350, -180)

				var_316_0.localPosition = Vector3.Lerp(arg_313_1.var_.moveOldPos1070, var_316_6, var_316_5)
			end

			if arg_313_1.time_ >= var_316_1 + var_316_4 and arg_313_1.time_ < var_316_1 + var_316_4 + arg_316_0 then
				var_316_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_316_7 = arg_313_1.actors_["1070"]
			local var_316_8 = 0

			if var_316_8 < arg_313_1.time_ and arg_313_1.time_ <= var_316_8 + arg_316_0 and arg_313_1.var_.actorSpriteComps1070 == nil then
				arg_313_1.var_.actorSpriteComps1070 = var_316_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_316_9 = 0.0166666666666667

			if var_316_8 <= arg_313_1.time_ and arg_313_1.time_ < var_316_8 + var_316_9 then
				local var_316_10 = (arg_313_1.time_ - var_316_8) / var_316_9

				if arg_313_1.var_.actorSpriteComps1070 then
					for iter_316_1, iter_316_2 in pairs(arg_313_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_316_2 then
							local var_316_11 = Mathf.Lerp(iter_316_2.color.r, 1, var_316_10)

							iter_316_2.color = Color.New(var_316_11, var_316_11, var_316_11)
						end
					end
				end
			end

			if arg_313_1.time_ >= var_316_8 + var_316_9 and arg_313_1.time_ < var_316_8 + var_316_9 + arg_316_0 and arg_313_1.var_.actorSpriteComps1070 then
				local var_316_12 = 1

				for iter_316_3, iter_316_4 in pairs(arg_313_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_316_4 then
						iter_316_4.color = Color.New(var_316_12, var_316_12, var_316_12)
					end
				end

				arg_313_1.var_.actorSpriteComps1070 = nil
			end

			local var_316_13 = 0
			local var_316_14 = 0.999999999999

			if var_316_13 < arg_313_1.time_ and arg_313_1.time_ <= var_316_13 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_15 = arg_313_1:FormatText(StoryNameCfg[318].name)

				arg_313_1.leftNameTxt_.text = var_316_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_16 = arg_313_1:GetWordFromCfg(910109079)
				local var_316_17 = arg_313_1:FormatText(var_316_16.content)

				arg_313_1.text_.text = var_316_17

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_18 = 25
				local var_316_19 = utf8.len(var_316_17)
				local var_316_20 = var_316_18 <= 0 and var_316_14 or var_316_14 * (var_316_19 / var_316_18)

				if var_316_20 > 0 and var_316_14 < var_316_20 then
					arg_313_1.talkMaxDuration = var_316_20

					if var_316_20 + var_316_13 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_20 + var_316_13
					end
				end

				arg_313_1.text_.text = var_316_17
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)
				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_21 = math.max(var_316_14, arg_313_1.talkMaxDuration)

			if var_316_13 <= arg_313_1.time_ and arg_313_1.time_ < var_316_13 + var_316_21 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_13) / var_316_21

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_13 + var_316_21 and arg_313_1.time_ < var_316_13 + var_316_21 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play910109080 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 910109080
		arg_317_1.duration_ = 0.016666666666

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"

			SetActive(arg_317_1.choicesGo_, true)

			for iter_318_0, iter_318_1 in ipairs(arg_317_1.choices_) do
				local var_318_0 = iter_318_0 <= 2

				SetActive(iter_318_1.go, var_318_0)
			end

			arg_317_1.choices_[1].txt.text = arg_317_1:FormatText(StoryChoiceCfg[286].name)
			arg_317_1.choices_[2].txt.text = arg_317_1:FormatText(StoryChoiceCfg[287].name)
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play910109081(arg_317_1)
			end

			if arg_319_0 == 2 then
				arg_317_0:Play910109083(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["1070"]
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 and arg_317_1.var_.actorSpriteComps1070 == nil then
				arg_317_1.var_.actorSpriteComps1070 = var_320_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_320_2 = 0.0166666666666667

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2

				if arg_317_1.var_.actorSpriteComps1070 then
					for iter_320_0, iter_320_1 in pairs(arg_317_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_320_1 then
							local var_320_4 = Mathf.Lerp(iter_320_1.color.r, 0.5, var_320_3)

							iter_320_1.color = Color.New(var_320_4, var_320_4, var_320_4)
						end
					end
				end
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 and arg_317_1.var_.actorSpriteComps1070 then
				local var_320_5 = 0.5

				for iter_320_2, iter_320_3 in pairs(arg_317_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_320_3 then
						iter_320_3.color = Color.New(var_320_5, var_320_5, var_320_5)
					end
				end

				arg_317_1.var_.actorSpriteComps1070 = nil
			end
		end
	end,
	Play910109081 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 910109081
		arg_321_1.duration_ = 5

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play910109082(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["1070"]
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 and arg_321_1.var_.actorSpriteComps1070 == nil then
				arg_321_1.var_.actorSpriteComps1070 = var_324_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_324_2 = 0.0166666666666667

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2

				if arg_321_1.var_.actorSpriteComps1070 then
					for iter_324_0, iter_324_1 in pairs(arg_321_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_324_1 then
							local var_324_4 = Mathf.Lerp(iter_324_1.color.r, 1, var_324_3)

							iter_324_1.color = Color.New(var_324_4, var_324_4, var_324_4)
						end
					end
				end
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 and arg_321_1.var_.actorSpriteComps1070 then
				local var_324_5 = 1

				for iter_324_2, iter_324_3 in pairs(arg_321_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_324_3 then
						iter_324_3.color = Color.New(var_324_5, var_324_5, var_324_5)
					end
				end

				arg_321_1.var_.actorSpriteComps1070 = nil
			end

			local var_324_6 = 0
			local var_324_7 = 0.175

			if var_324_6 < arg_321_1.time_ and arg_321_1.time_ <= var_324_6 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_8 = arg_321_1:FormatText(StoryNameCfg[318].name)

				arg_321_1.leftNameTxt_.text = var_324_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_9 = arg_321_1:GetWordFromCfg(910109081)
				local var_324_10 = arg_321_1:FormatText(var_324_9.content)

				arg_321_1.text_.text = var_324_10

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_11 = 7
				local var_324_12 = utf8.len(var_324_10)
				local var_324_13 = var_324_11 <= 0 and var_324_7 or var_324_7 * (var_324_12 / var_324_11)

				if var_324_13 > 0 and var_324_7 < var_324_13 then
					arg_321_1.talkMaxDuration = var_324_13

					if var_324_13 + var_324_6 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_13 + var_324_6
					end
				end

				arg_321_1.text_.text = var_324_10
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)
				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_14 = math.max(var_324_7, arg_321_1.talkMaxDuration)

			if var_324_6 <= arg_321_1.time_ and arg_321_1.time_ < var_324_6 + var_324_14 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_6) / var_324_14

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_6 + var_324_14 and arg_321_1.time_ < var_324_6 + var_324_14 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play910109082 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 910109082
		arg_325_1.duration_ = 5

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play910109083(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["1070"]
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 and arg_325_1.var_.actorSpriteComps1070 == nil then
				arg_325_1.var_.actorSpriteComps1070 = var_328_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_328_2 = 0.0166666666666667

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_2 then
				local var_328_3 = (arg_325_1.time_ - var_328_1) / var_328_2

				if arg_325_1.var_.actorSpriteComps1070 then
					for iter_328_0, iter_328_1 in pairs(arg_325_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_328_1 then
							local var_328_4 = Mathf.Lerp(iter_328_1.color.r, 0.5, var_328_3)

							iter_328_1.color = Color.New(var_328_4, var_328_4, var_328_4)
						end
					end
				end
			end

			if arg_325_1.time_ >= var_328_1 + var_328_2 and arg_325_1.time_ < var_328_1 + var_328_2 + arg_328_0 and arg_325_1.var_.actorSpriteComps1070 then
				local var_328_5 = 0.5

				for iter_328_2, iter_328_3 in pairs(arg_325_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_328_3 then
						iter_328_3.color = Color.New(var_328_5, var_328_5, var_328_5)
					end
				end

				arg_325_1.var_.actorSpriteComps1070 = nil
			end

			local var_328_6 = 0
			local var_328_7 = 0.6

			if var_328_6 < arg_325_1.time_ and arg_325_1.time_ <= var_328_6 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_8 = arg_325_1:FormatText(StoryNameCfg[7].name)

				arg_325_1.leftNameTxt_.text = var_328_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_9 = arg_325_1:GetWordFromCfg(910109082)
				local var_328_10 = arg_325_1:FormatText(var_328_9.content)

				arg_325_1.text_.text = var_328_10

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_11 = 24
				local var_328_12 = utf8.len(var_328_10)
				local var_328_13 = var_328_11 <= 0 and var_328_7 or var_328_7 * (var_328_12 / var_328_11)

				if var_328_13 > 0 and var_328_7 < var_328_13 then
					arg_325_1.talkMaxDuration = var_328_13

					if var_328_13 + var_328_6 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_13 + var_328_6
					end
				end

				arg_325_1.text_.text = var_328_10
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)
				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_14 = math.max(var_328_7, arg_325_1.talkMaxDuration)

			if var_328_6 <= arg_325_1.time_ and arg_325_1.time_ < var_328_6 + var_328_14 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_6) / var_328_14

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_6 + var_328_14 and arg_325_1.time_ < var_328_6 + var_328_14 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play910109083 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 910109083
		arg_329_1.duration_ = 5

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play910109084(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["1070"].transform
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				arg_329_1.var_.moveOldPos1070 = var_332_0.localPosition
				var_332_0.localScale = Vector3.New(1, 1, 1)

				arg_329_1:CheckSpriteTmpPos("1070", 3)

				local var_332_2 = var_332_0.childCount

				for iter_332_0 = 0, var_332_2 - 1 do
					local var_332_3 = var_332_0:GetChild(iter_332_0)

					if var_332_3.name == "split_1" or not string.find(var_332_3.name, "split") then
						var_332_3.gameObject:SetActive(true)
					else
						var_332_3.gameObject:SetActive(false)
					end
				end
			end

			local var_332_4 = 0.001

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_4 then
				local var_332_5 = (arg_329_1.time_ - var_332_1) / var_332_4
				local var_332_6 = Vector3.New(0, -350, -180)

				var_332_0.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1070, var_332_6, var_332_5)
			end

			if arg_329_1.time_ >= var_332_1 + var_332_4 and arg_329_1.time_ < var_332_1 + var_332_4 + arg_332_0 then
				var_332_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_332_7 = arg_329_1.actors_["1070"]
			local var_332_8 = 0

			if var_332_8 < arg_329_1.time_ and arg_329_1.time_ <= var_332_8 + arg_332_0 and arg_329_1.var_.actorSpriteComps1070 == nil then
				arg_329_1.var_.actorSpriteComps1070 = var_332_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_332_9 = 0.0166666666666667

			if var_332_8 <= arg_329_1.time_ and arg_329_1.time_ < var_332_8 + var_332_9 then
				local var_332_10 = (arg_329_1.time_ - var_332_8) / var_332_9

				if arg_329_1.var_.actorSpriteComps1070 then
					for iter_332_1, iter_332_2 in pairs(arg_329_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_332_2 then
							local var_332_11 = Mathf.Lerp(iter_332_2.color.r, 1, var_332_10)

							iter_332_2.color = Color.New(var_332_11, var_332_11, var_332_11)
						end
					end
				end
			end

			if arg_329_1.time_ >= var_332_8 + var_332_9 and arg_329_1.time_ < var_332_8 + var_332_9 + arg_332_0 and arg_329_1.var_.actorSpriteComps1070 then
				local var_332_12 = 1

				for iter_332_3, iter_332_4 in pairs(arg_329_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_332_4 then
						iter_332_4.color = Color.New(var_332_12, var_332_12, var_332_12)
					end
				end

				arg_329_1.var_.actorSpriteComps1070 = nil
			end

			local var_332_13 = 0
			local var_332_14 = 1.175

			if var_332_13 < arg_329_1.time_ and arg_329_1.time_ <= var_332_13 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_15 = arg_329_1:FormatText(StoryNameCfg[318].name)

				arg_329_1.leftNameTxt_.text = var_332_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_16 = arg_329_1:GetWordFromCfg(910109083)
				local var_332_17 = arg_329_1:FormatText(var_332_16.content)

				arg_329_1.text_.text = var_332_17

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_18 = 47
				local var_332_19 = utf8.len(var_332_17)
				local var_332_20 = var_332_18 <= 0 and var_332_14 or var_332_14 * (var_332_19 / var_332_18)

				if var_332_20 > 0 and var_332_14 < var_332_20 then
					arg_329_1.talkMaxDuration = var_332_20

					if var_332_20 + var_332_13 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_20 + var_332_13
					end
				end

				arg_329_1.text_.text = var_332_17
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)
				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_21 = math.max(var_332_14, arg_329_1.talkMaxDuration)

			if var_332_13 <= arg_329_1.time_ and arg_329_1.time_ < var_332_13 + var_332_21 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_13) / var_332_21

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_13 + var_332_21 and arg_329_1.time_ < var_332_13 + var_332_21 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play910109084 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 910109084
		arg_333_1.duration_ = 5

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play910109085(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["1070"]
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 and arg_333_1.var_.actorSpriteComps1070 == nil then
				arg_333_1.var_.actorSpriteComps1070 = var_336_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_336_2 = 0.0166666666666667

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_2 then
				local var_336_3 = (arg_333_1.time_ - var_336_1) / var_336_2

				if arg_333_1.var_.actorSpriteComps1070 then
					for iter_336_0, iter_336_1 in pairs(arg_333_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_336_1 then
							local var_336_4 = Mathf.Lerp(iter_336_1.color.r, 0.5, var_336_3)

							iter_336_1.color = Color.New(var_336_4, var_336_4, var_336_4)
						end
					end
				end
			end

			if arg_333_1.time_ >= var_336_1 + var_336_2 and arg_333_1.time_ < var_336_1 + var_336_2 + arg_336_0 and arg_333_1.var_.actorSpriteComps1070 then
				local var_336_5 = 0.5

				for iter_336_2, iter_336_3 in pairs(arg_333_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_336_3 then
						iter_336_3.color = Color.New(var_336_5, var_336_5, var_336_5)
					end
				end

				arg_333_1.var_.actorSpriteComps1070 = nil
			end

			local var_336_6 = 0
			local var_336_7 = 0.75

			if var_336_6 < arg_333_1.time_ and arg_333_1.time_ <= var_336_6 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_8 = arg_333_1:FormatText(StoryNameCfg[7].name)

				arg_333_1.leftNameTxt_.text = var_336_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_9 = arg_333_1:GetWordFromCfg(910109084)
				local var_336_10 = arg_333_1:FormatText(var_336_9.content)

				arg_333_1.text_.text = var_336_10

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_11 = 30
				local var_336_12 = utf8.len(var_336_10)
				local var_336_13 = var_336_11 <= 0 and var_336_7 or var_336_7 * (var_336_12 / var_336_11)

				if var_336_13 > 0 and var_336_7 < var_336_13 then
					arg_333_1.talkMaxDuration = var_336_13

					if var_336_13 + var_336_6 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_13 + var_336_6
					end
				end

				arg_333_1.text_.text = var_336_10
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)
				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_14 = math.max(var_336_7, arg_333_1.talkMaxDuration)

			if var_336_6 <= arg_333_1.time_ and arg_333_1.time_ < var_336_6 + var_336_14 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_6) / var_336_14

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_6 + var_336_14 and arg_333_1.time_ < var_336_6 + var_336_14 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play910109085 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 910109085
		arg_337_1.duration_ = 5

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play910109086(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["1070"].transform
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 then
				arg_337_1.var_.moveOldPos1070 = var_340_0.localPosition
				var_340_0.localScale = Vector3.New(1, 1, 1)

				arg_337_1:CheckSpriteTmpPos("1070", 3)

				local var_340_2 = var_340_0.childCount

				for iter_340_0 = 0, var_340_2 - 1 do
					local var_340_3 = var_340_0:GetChild(iter_340_0)

					if var_340_3.name == "split_7" or not string.find(var_340_3.name, "split") then
						var_340_3.gameObject:SetActive(true)
					else
						var_340_3.gameObject:SetActive(false)
					end
				end
			end

			local var_340_4 = 0.001

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_4 then
				local var_340_5 = (arg_337_1.time_ - var_340_1) / var_340_4
				local var_340_6 = Vector3.New(0, -350, -180)

				var_340_0.localPosition = Vector3.Lerp(arg_337_1.var_.moveOldPos1070, var_340_6, var_340_5)
			end

			if arg_337_1.time_ >= var_340_1 + var_340_4 and arg_337_1.time_ < var_340_1 + var_340_4 + arg_340_0 then
				var_340_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_340_7 = arg_337_1.actors_["1070"]
			local var_340_8 = 0

			if var_340_8 < arg_337_1.time_ and arg_337_1.time_ <= var_340_8 + arg_340_0 and arg_337_1.var_.actorSpriteComps1070 == nil then
				arg_337_1.var_.actorSpriteComps1070 = var_340_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_340_9 = 0.0166666666666667

			if var_340_8 <= arg_337_1.time_ and arg_337_1.time_ < var_340_8 + var_340_9 then
				local var_340_10 = (arg_337_1.time_ - var_340_8) / var_340_9

				if arg_337_1.var_.actorSpriteComps1070 then
					for iter_340_1, iter_340_2 in pairs(arg_337_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_340_2 then
							local var_340_11 = Mathf.Lerp(iter_340_2.color.r, 1, var_340_10)

							iter_340_2.color = Color.New(var_340_11, var_340_11, var_340_11)
						end
					end
				end
			end

			if arg_337_1.time_ >= var_340_8 + var_340_9 and arg_337_1.time_ < var_340_8 + var_340_9 + arg_340_0 and arg_337_1.var_.actorSpriteComps1070 then
				local var_340_12 = 1

				for iter_340_3, iter_340_4 in pairs(arg_337_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_340_4 then
						iter_340_4.color = Color.New(var_340_12, var_340_12, var_340_12)
					end
				end

				arg_337_1.var_.actorSpriteComps1070 = nil
			end

			local var_340_13 = 0
			local var_340_14 = 0.725

			if var_340_13 < arg_337_1.time_ and arg_337_1.time_ <= var_340_13 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_15 = arg_337_1:FormatText(StoryNameCfg[318].name)

				arg_337_1.leftNameTxt_.text = var_340_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_16 = arg_337_1:GetWordFromCfg(910109085)
				local var_340_17 = arg_337_1:FormatText(var_340_16.content)

				arg_337_1.text_.text = var_340_17

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_18 = 29
				local var_340_19 = utf8.len(var_340_17)
				local var_340_20 = var_340_18 <= 0 and var_340_14 or var_340_14 * (var_340_19 / var_340_18)

				if var_340_20 > 0 and var_340_14 < var_340_20 then
					arg_337_1.talkMaxDuration = var_340_20

					if var_340_20 + var_340_13 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_20 + var_340_13
					end
				end

				arg_337_1.text_.text = var_340_17
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)
				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_21 = math.max(var_340_14, arg_337_1.talkMaxDuration)

			if var_340_13 <= arg_337_1.time_ and arg_337_1.time_ < var_340_13 + var_340_21 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_13) / var_340_21

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_13 + var_340_21 and arg_337_1.time_ < var_340_13 + var_340_21 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play910109086 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 910109086
		arg_341_1.duration_ = 5

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play910109087(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1070"]
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 and arg_341_1.var_.actorSpriteComps1070 == nil then
				arg_341_1.var_.actorSpriteComps1070 = var_344_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_344_2 = 0.0166666666666667

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2

				if arg_341_1.var_.actorSpriteComps1070 then
					for iter_344_0, iter_344_1 in pairs(arg_341_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_344_1 then
							local var_344_4 = Mathf.Lerp(iter_344_1.color.r, 0.5, var_344_3)

							iter_344_1.color = Color.New(var_344_4, var_344_4, var_344_4)
						end
					end
				end
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 and arg_341_1.var_.actorSpriteComps1070 then
				local var_344_5 = 0.5

				for iter_344_2, iter_344_3 in pairs(arg_341_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_344_3 then
						iter_344_3.color = Color.New(var_344_5, var_344_5, var_344_5)
					end
				end

				arg_341_1.var_.actorSpriteComps1070 = nil
			end

			local var_344_6 = 0
			local var_344_7 = 0.075

			if var_344_6 < arg_341_1.time_ and arg_341_1.time_ <= var_344_6 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_8 = arg_341_1:FormatText(StoryNameCfg[7].name)

				arg_341_1.leftNameTxt_.text = var_344_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_9 = arg_341_1:GetWordFromCfg(910109086)
				local var_344_10 = arg_341_1:FormatText(var_344_9.content)

				arg_341_1.text_.text = var_344_10

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_11 = 3
				local var_344_12 = utf8.len(var_344_10)
				local var_344_13 = var_344_11 <= 0 and var_344_7 or var_344_7 * (var_344_12 / var_344_11)

				if var_344_13 > 0 and var_344_7 < var_344_13 then
					arg_341_1.talkMaxDuration = var_344_13

					if var_344_13 + var_344_6 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_13 + var_344_6
					end
				end

				arg_341_1.text_.text = var_344_10
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)
				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_14 = math.max(var_344_7, arg_341_1.talkMaxDuration)

			if var_344_6 <= arg_341_1.time_ and arg_341_1.time_ < var_344_6 + var_344_14 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_6) / var_344_14

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_6 + var_344_14 and arg_341_1.time_ < var_344_6 + var_344_14 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play910109087 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 910109087
		arg_345_1.duration_ = 5

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play910109088(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["1070"].transform
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 then
				arg_345_1.var_.moveOldPos1070 = var_348_0.localPosition
				var_348_0.localScale = Vector3.New(1, 1, 1)

				arg_345_1:CheckSpriteTmpPos("1070", 3)

				local var_348_2 = var_348_0.childCount

				for iter_348_0 = 0, var_348_2 - 1 do
					local var_348_3 = var_348_0:GetChild(iter_348_0)

					if var_348_3.name == "split_1" or not string.find(var_348_3.name, "split") then
						var_348_3.gameObject:SetActive(true)
					else
						var_348_3.gameObject:SetActive(false)
					end
				end
			end

			local var_348_4 = 0.001

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_4 then
				local var_348_5 = (arg_345_1.time_ - var_348_1) / var_348_4
				local var_348_6 = Vector3.New(0, -350, -180)

				var_348_0.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos1070, var_348_6, var_348_5)
			end

			if arg_345_1.time_ >= var_348_1 + var_348_4 and arg_345_1.time_ < var_348_1 + var_348_4 + arg_348_0 then
				var_348_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_348_7 = arg_345_1.actors_["1070"]
			local var_348_8 = 0

			if var_348_8 < arg_345_1.time_ and arg_345_1.time_ <= var_348_8 + arg_348_0 and arg_345_1.var_.actorSpriteComps1070 == nil then
				arg_345_1.var_.actorSpriteComps1070 = var_348_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_348_9 = 0.0166666666666667

			if var_348_8 <= arg_345_1.time_ and arg_345_1.time_ < var_348_8 + var_348_9 then
				local var_348_10 = (arg_345_1.time_ - var_348_8) / var_348_9

				if arg_345_1.var_.actorSpriteComps1070 then
					for iter_348_1, iter_348_2 in pairs(arg_345_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_348_2 then
							local var_348_11 = Mathf.Lerp(iter_348_2.color.r, 1, var_348_10)

							iter_348_2.color = Color.New(var_348_11, var_348_11, var_348_11)
						end
					end
				end
			end

			if arg_345_1.time_ >= var_348_8 + var_348_9 and arg_345_1.time_ < var_348_8 + var_348_9 + arg_348_0 and arg_345_1.var_.actorSpriteComps1070 then
				local var_348_12 = 1

				for iter_348_3, iter_348_4 in pairs(arg_345_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_348_4 then
						iter_348_4.color = Color.New(var_348_12, var_348_12, var_348_12)
					end
				end

				arg_345_1.var_.actorSpriteComps1070 = nil
			end

			local var_348_13 = 0
			local var_348_14 = 0.175

			if var_348_13 < arg_345_1.time_ and arg_345_1.time_ <= var_348_13 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_15 = arg_345_1:FormatText(StoryNameCfg[318].name)

				arg_345_1.leftNameTxt_.text = var_348_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_16 = arg_345_1:GetWordFromCfg(910109087)
				local var_348_17 = arg_345_1:FormatText(var_348_16.content)

				arg_345_1.text_.text = var_348_17

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_18 = 7
				local var_348_19 = utf8.len(var_348_17)
				local var_348_20 = var_348_18 <= 0 and var_348_14 or var_348_14 * (var_348_19 / var_348_18)

				if var_348_20 > 0 and var_348_14 < var_348_20 then
					arg_345_1.talkMaxDuration = var_348_20

					if var_348_20 + var_348_13 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_20 + var_348_13
					end
				end

				arg_345_1.text_.text = var_348_17
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)
				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_21 = math.max(var_348_14, arg_345_1.talkMaxDuration)

			if var_348_13 <= arg_345_1.time_ and arg_345_1.time_ < var_348_13 + var_348_21 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_13) / var_348_21

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_13 + var_348_21 and arg_345_1.time_ < var_348_13 + var_348_21 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play910109088 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 910109088
		arg_349_1.duration_ = 5

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play910109089(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["1070"]
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 and arg_349_1.var_.actorSpriteComps1070 == nil then
				arg_349_1.var_.actorSpriteComps1070 = var_352_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_352_2 = 0.0166666666666667

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_2 then
				local var_352_3 = (arg_349_1.time_ - var_352_1) / var_352_2

				if arg_349_1.var_.actorSpriteComps1070 then
					for iter_352_0, iter_352_1 in pairs(arg_349_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_352_1 then
							local var_352_4 = Mathf.Lerp(iter_352_1.color.r, 0.5, var_352_3)

							iter_352_1.color = Color.New(var_352_4, var_352_4, var_352_4)
						end
					end
				end
			end

			if arg_349_1.time_ >= var_352_1 + var_352_2 and arg_349_1.time_ < var_352_1 + var_352_2 + arg_352_0 and arg_349_1.var_.actorSpriteComps1070 then
				local var_352_5 = 0.5

				for iter_352_2, iter_352_3 in pairs(arg_349_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_352_3 then
						iter_352_3.color = Color.New(var_352_5, var_352_5, var_352_5)
					end
				end

				arg_349_1.var_.actorSpriteComps1070 = nil
			end

			local var_352_6 = 0
			local var_352_7 = 0.8

			if var_352_6 < arg_349_1.time_ and arg_349_1.time_ <= var_352_6 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_8 = arg_349_1:FormatText(StoryNameCfg[7].name)

				arg_349_1.leftNameTxt_.text = var_352_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_9 = arg_349_1:GetWordFromCfg(910109088)
				local var_352_10 = arg_349_1:FormatText(var_352_9.content)

				arg_349_1.text_.text = var_352_10

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_11 = 32
				local var_352_12 = utf8.len(var_352_10)
				local var_352_13 = var_352_11 <= 0 and var_352_7 or var_352_7 * (var_352_12 / var_352_11)

				if var_352_13 > 0 and var_352_7 < var_352_13 then
					arg_349_1.talkMaxDuration = var_352_13

					if var_352_13 + var_352_6 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_13 + var_352_6
					end
				end

				arg_349_1.text_.text = var_352_10
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)
				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_14 = math.max(var_352_7, arg_349_1.talkMaxDuration)

			if var_352_6 <= arg_349_1.time_ and arg_349_1.time_ < var_352_6 + var_352_14 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_6) / var_352_14

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_6 + var_352_14 and arg_349_1.time_ < var_352_6 + var_352_14 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play910109089 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 910109089
		arg_353_1.duration_ = 5

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play910109090(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = arg_353_1.actors_["1070"].transform
			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 then
				arg_353_1.var_.moveOldPos1070 = var_356_0.localPosition
				var_356_0.localScale = Vector3.New(1, 1, 1)

				arg_353_1:CheckSpriteTmpPos("1070", 3)

				local var_356_2 = var_356_0.childCount

				for iter_356_0 = 0, var_356_2 - 1 do
					local var_356_3 = var_356_0:GetChild(iter_356_0)

					if var_356_3.name == "split_8" or not string.find(var_356_3.name, "split") then
						var_356_3.gameObject:SetActive(true)
					else
						var_356_3.gameObject:SetActive(false)
					end
				end
			end

			local var_356_4 = 0.001

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_4 then
				local var_356_5 = (arg_353_1.time_ - var_356_1) / var_356_4
				local var_356_6 = Vector3.New(0, -350, -180)

				var_356_0.localPosition = Vector3.Lerp(arg_353_1.var_.moveOldPos1070, var_356_6, var_356_5)
			end

			if arg_353_1.time_ >= var_356_1 + var_356_4 and arg_353_1.time_ < var_356_1 + var_356_4 + arg_356_0 then
				var_356_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_356_7 = arg_353_1.actors_["1070"]
			local var_356_8 = 0

			if var_356_8 < arg_353_1.time_ and arg_353_1.time_ <= var_356_8 + arg_356_0 and arg_353_1.var_.actorSpriteComps1070 == nil then
				arg_353_1.var_.actorSpriteComps1070 = var_356_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_356_9 = 0.0166666666666667

			if var_356_8 <= arg_353_1.time_ and arg_353_1.time_ < var_356_8 + var_356_9 then
				local var_356_10 = (arg_353_1.time_ - var_356_8) / var_356_9

				if arg_353_1.var_.actorSpriteComps1070 then
					for iter_356_1, iter_356_2 in pairs(arg_353_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_356_2 then
							local var_356_11 = Mathf.Lerp(iter_356_2.color.r, 1, var_356_10)

							iter_356_2.color = Color.New(var_356_11, var_356_11, var_356_11)
						end
					end
				end
			end

			if arg_353_1.time_ >= var_356_8 + var_356_9 and arg_353_1.time_ < var_356_8 + var_356_9 + arg_356_0 and arg_353_1.var_.actorSpriteComps1070 then
				local var_356_12 = 1

				for iter_356_3, iter_356_4 in pairs(arg_353_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_356_4 then
						iter_356_4.color = Color.New(var_356_12, var_356_12, var_356_12)
					end
				end

				arg_353_1.var_.actorSpriteComps1070 = nil
			end

			local var_356_13 = 0
			local var_356_14 = 1.075

			if var_356_13 < arg_353_1.time_ and arg_353_1.time_ <= var_356_13 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_15 = arg_353_1:FormatText(StoryNameCfg[318].name)

				arg_353_1.leftNameTxt_.text = var_356_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_16 = arg_353_1:GetWordFromCfg(910109089)
				local var_356_17 = arg_353_1:FormatText(var_356_16.content)

				arg_353_1.text_.text = var_356_17

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_18 = 43
				local var_356_19 = utf8.len(var_356_17)
				local var_356_20 = var_356_18 <= 0 and var_356_14 or var_356_14 * (var_356_19 / var_356_18)

				if var_356_20 > 0 and var_356_14 < var_356_20 then
					arg_353_1.talkMaxDuration = var_356_20

					if var_356_20 + var_356_13 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_20 + var_356_13
					end
				end

				arg_353_1.text_.text = var_356_17
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)
				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_21 = math.max(var_356_14, arg_353_1.talkMaxDuration)

			if var_356_13 <= arg_353_1.time_ and arg_353_1.time_ < var_356_13 + var_356_21 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_13) / var_356_21

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_13 + var_356_21 and arg_353_1.time_ < var_356_13 + var_356_21 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play910109090 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 910109090
		arg_357_1.duration_ = 5

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play910109091(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = 0
			local var_360_1 = 0.45

			if var_360_0 < arg_357_1.time_ and arg_357_1.time_ <= var_360_0 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_2 = arg_357_1:FormatText(StoryNameCfg[318].name)

				arg_357_1.leftNameTxt_.text = var_360_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_3 = arg_357_1:GetWordFromCfg(910109090)
				local var_360_4 = arg_357_1:FormatText(var_360_3.content)

				arg_357_1.text_.text = var_360_4

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_5 = 18
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
				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_8 = math.max(var_360_1, arg_357_1.talkMaxDuration)

			if var_360_0 <= arg_357_1.time_ and arg_357_1.time_ < var_360_0 + var_360_8 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_0) / var_360_8

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_0 + var_360_8 and arg_357_1.time_ < var_360_0 + var_360_8 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play910109091 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 910109091
		arg_361_1.duration_ = 0.199999999999

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"

			SetActive(arg_361_1.choicesGo_, true)

			for iter_362_0, iter_362_1 in ipairs(arg_361_1.choices_) do
				local var_362_0 = iter_362_0 <= 2

				SetActive(iter_362_1.go, var_362_0)
			end

			arg_361_1.choices_[1].txt.text = arg_361_1:FormatText(StoryChoiceCfg[288].name)
			arg_361_1.choices_[2].txt.text = arg_361_1:FormatText(StoryChoiceCfg[289].name)
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play910109092(arg_361_1)
			end

			if arg_363_0 == 2 then
				arg_361_0:Play910109092(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["1070"]
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 and arg_361_1.var_.actorSpriteComps1070 == nil then
				arg_361_1.var_.actorSpriteComps1070 = var_364_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_364_2 = 0.2

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_2 then
				local var_364_3 = (arg_361_1.time_ - var_364_1) / var_364_2

				if arg_361_1.var_.actorSpriteComps1070 then
					for iter_364_0, iter_364_1 in pairs(arg_361_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_364_1 then
							local var_364_4 = Mathf.Lerp(iter_364_1.color.r, 0.5, var_364_3)

							iter_364_1.color = Color.New(var_364_4, var_364_4, var_364_4)
						end
					end
				end
			end

			if arg_361_1.time_ >= var_364_1 + var_364_2 and arg_361_1.time_ < var_364_1 + var_364_2 + arg_364_0 and arg_361_1.var_.actorSpriteComps1070 then
				local var_364_5 = 0.5

				for iter_364_2, iter_364_3 in pairs(arg_361_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_364_3 then
						iter_364_3.color = Color.New(var_364_5, var_364_5, var_364_5)
					end
				end

				arg_361_1.var_.actorSpriteComps1070 = nil
			end
		end
	end,
	Play910109092 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 910109092
		arg_365_1.duration_ = 5

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play910109093(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["1070"].transform
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 then
				arg_365_1.var_.moveOldPos1070 = var_368_0.localPosition
				var_368_0.localScale = Vector3.New(1, 1, 1)

				arg_365_1:CheckSpriteTmpPos("1070", 3)

				local var_368_2 = var_368_0.childCount

				for iter_368_0 = 0, var_368_2 - 1 do
					local var_368_3 = var_368_0:GetChild(iter_368_0)

					if var_368_3.name == "split_2" or not string.find(var_368_3.name, "split") then
						var_368_3.gameObject:SetActive(true)
					else
						var_368_3.gameObject:SetActive(false)
					end
				end
			end

			local var_368_4 = 0.001

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_4 then
				local var_368_5 = (arg_365_1.time_ - var_368_1) / var_368_4
				local var_368_6 = Vector3.New(0, -350, -180)

				var_368_0.localPosition = Vector3.Lerp(arg_365_1.var_.moveOldPos1070, var_368_6, var_368_5)
			end

			if arg_365_1.time_ >= var_368_1 + var_368_4 and arg_365_1.time_ < var_368_1 + var_368_4 + arg_368_0 then
				var_368_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_368_7 = arg_365_1.actors_["1070"]
			local var_368_8 = 0

			if var_368_8 < arg_365_1.time_ and arg_365_1.time_ <= var_368_8 + arg_368_0 and arg_365_1.var_.actorSpriteComps1070 == nil then
				arg_365_1.var_.actorSpriteComps1070 = var_368_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_368_9 = 0.2

			if var_368_8 <= arg_365_1.time_ and arg_365_1.time_ < var_368_8 + var_368_9 then
				local var_368_10 = (arg_365_1.time_ - var_368_8) / var_368_9

				if arg_365_1.var_.actorSpriteComps1070 then
					for iter_368_1, iter_368_2 in pairs(arg_365_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_368_2 then
							local var_368_11 = Mathf.Lerp(iter_368_2.color.r, 1, var_368_10)

							iter_368_2.color = Color.New(var_368_11, var_368_11, var_368_11)
						end
					end
				end
			end

			if arg_365_1.time_ >= var_368_8 + var_368_9 and arg_365_1.time_ < var_368_8 + var_368_9 + arg_368_0 and arg_365_1.var_.actorSpriteComps1070 then
				local var_368_12 = 1

				for iter_368_3, iter_368_4 in pairs(arg_365_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_368_4 then
						iter_368_4.color = Color.New(var_368_12, var_368_12, var_368_12)
					end
				end

				arg_365_1.var_.actorSpriteComps1070 = nil
			end

			local var_368_13 = 0
			local var_368_14 = 0.675

			if var_368_13 < arg_365_1.time_ and arg_365_1.time_ <= var_368_13 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_15 = arg_365_1:FormatText(StoryNameCfg[318].name)

				arg_365_1.leftNameTxt_.text = var_368_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_16 = arg_365_1:GetWordFromCfg(910109092)
				local var_368_17 = arg_365_1:FormatText(var_368_16.content)

				arg_365_1.text_.text = var_368_17

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_18 = 27
				local var_368_19 = utf8.len(var_368_17)
				local var_368_20 = var_368_18 <= 0 and var_368_14 or var_368_14 * (var_368_19 / var_368_18)

				if var_368_20 > 0 and var_368_14 < var_368_20 then
					arg_365_1.talkMaxDuration = var_368_20

					if var_368_20 + var_368_13 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_20 + var_368_13
					end
				end

				arg_365_1.text_.text = var_368_17
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)
				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_21 = math.max(var_368_14, arg_365_1.talkMaxDuration)

			if var_368_13 <= arg_365_1.time_ and arg_365_1.time_ < var_368_13 + var_368_21 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_13) / var_368_21

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_13 + var_368_21 and arg_365_1.time_ < var_368_13 + var_368_21 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play910109093 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 910109093
		arg_369_1.duration_ = 5

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play910109094(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0
			local var_372_1 = 0.15

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_2 = arg_369_1:FormatText(StoryNameCfg[318].name)

				arg_369_1.leftNameTxt_.text = var_372_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_3 = arg_369_1:GetWordFromCfg(910109093)
				local var_372_4 = arg_369_1:FormatText(var_372_3.content)

				arg_369_1.text_.text = var_372_4

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_5 = 6
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
				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_8 = math.max(var_372_1, arg_369_1.talkMaxDuration)

			if var_372_0 <= arg_369_1.time_ and arg_369_1.time_ < var_372_0 + var_372_8 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_0) / var_372_8

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_0 + var_372_8 and arg_369_1.time_ < var_372_0 + var_372_8 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play910109094 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 910109094
		arg_373_1.duration_ = 5

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play910109095(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["1070"]
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 and arg_373_1.var_.actorSpriteComps1070 == nil then
				arg_373_1.var_.actorSpriteComps1070 = var_376_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_376_2 = 0.2

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_2 then
				local var_376_3 = (arg_373_1.time_ - var_376_1) / var_376_2

				if arg_373_1.var_.actorSpriteComps1070 then
					for iter_376_0, iter_376_1 in pairs(arg_373_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_376_1 then
							local var_376_4 = Mathf.Lerp(iter_376_1.color.r, 0.5, var_376_3)

							iter_376_1.color = Color.New(var_376_4, var_376_4, var_376_4)
						end
					end
				end
			end

			if arg_373_1.time_ >= var_376_1 + var_376_2 and arg_373_1.time_ < var_376_1 + var_376_2 + arg_376_0 and arg_373_1.var_.actorSpriteComps1070 then
				local var_376_5 = 0.5

				for iter_376_2, iter_376_3 in pairs(arg_373_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_376_3 then
						iter_376_3.color = Color.New(var_376_5, var_376_5, var_376_5)
					end
				end

				arg_373_1.var_.actorSpriteComps1070 = nil
			end

			local var_376_6 = 0
			local var_376_7 = 0.175

			if var_376_6 < arg_373_1.time_ and arg_373_1.time_ <= var_376_6 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_8 = arg_373_1:FormatText(StoryNameCfg[7].name)

				arg_373_1.leftNameTxt_.text = var_376_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_9 = arg_373_1:GetWordFromCfg(910109094)
				local var_376_10 = arg_373_1:FormatText(var_376_9.content)

				arg_373_1.text_.text = var_376_10

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_11 = 7
				local var_376_12 = utf8.len(var_376_10)
				local var_376_13 = var_376_11 <= 0 and var_376_7 or var_376_7 * (var_376_12 / var_376_11)

				if var_376_13 > 0 and var_376_7 < var_376_13 then
					arg_373_1.talkMaxDuration = var_376_13

					if var_376_13 + var_376_6 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_13 + var_376_6
					end
				end

				arg_373_1.text_.text = var_376_10
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)
				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_14 = math.max(var_376_7, arg_373_1.talkMaxDuration)

			if var_376_6 <= arg_373_1.time_ and arg_373_1.time_ < var_376_6 + var_376_14 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_6) / var_376_14

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_6 + var_376_14 and arg_373_1.time_ < var_376_6 + var_376_14 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play910109095 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 910109095
		arg_377_1.duration_ = 5

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play910109096(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["1070"]
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 and arg_377_1.var_.actorSpriteComps1070 == nil then
				arg_377_1.var_.actorSpriteComps1070 = var_380_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_380_2 = 0.2

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_2 then
				local var_380_3 = (arg_377_1.time_ - var_380_1) / var_380_2

				if arg_377_1.var_.actorSpriteComps1070 then
					for iter_380_0, iter_380_1 in pairs(arg_377_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_380_1 then
							local var_380_4 = Mathf.Lerp(iter_380_1.color.r, 1, var_380_3)

							iter_380_1.color = Color.New(var_380_4, var_380_4, var_380_4)
						end
					end
				end
			end

			if arg_377_1.time_ >= var_380_1 + var_380_2 and arg_377_1.time_ < var_380_1 + var_380_2 + arg_380_0 and arg_377_1.var_.actorSpriteComps1070 then
				local var_380_5 = 1

				for iter_380_2, iter_380_3 in pairs(arg_377_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_380_3 then
						iter_380_3.color = Color.New(var_380_5, var_380_5, var_380_5)
					end
				end

				arg_377_1.var_.actorSpriteComps1070 = nil
			end

			local var_380_6 = 0
			local var_380_7 = 1.325

			if var_380_6 < arg_377_1.time_ and arg_377_1.time_ <= var_380_6 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_8 = arg_377_1:FormatText(StoryNameCfg[318].name)

				arg_377_1.leftNameTxt_.text = var_380_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_9 = arg_377_1:GetWordFromCfg(910109095)
				local var_380_10 = arg_377_1:FormatText(var_380_9.content)

				arg_377_1.text_.text = var_380_10

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_11 = 53
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
				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_14 = math.max(var_380_7, arg_377_1.talkMaxDuration)

			if var_380_6 <= arg_377_1.time_ and arg_377_1.time_ < var_380_6 + var_380_14 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_6) / var_380_14

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_6 + var_380_14 and arg_377_1.time_ < var_380_6 + var_380_14 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play910109096 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 910109096
		arg_381_1.duration_ = 5

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play910109097(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = arg_381_1.actors_["1070"]
			local var_384_1 = 0

			if var_384_1 < arg_381_1.time_ and arg_381_1.time_ <= var_384_1 + arg_384_0 and arg_381_1.var_.actorSpriteComps1070 == nil then
				arg_381_1.var_.actorSpriteComps1070 = var_384_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_384_2 = 0.2

			if var_384_1 <= arg_381_1.time_ and arg_381_1.time_ < var_384_1 + var_384_2 then
				local var_384_3 = (arg_381_1.time_ - var_384_1) / var_384_2

				if arg_381_1.var_.actorSpriteComps1070 then
					for iter_384_0, iter_384_1 in pairs(arg_381_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_384_1 then
							local var_384_4 = Mathf.Lerp(iter_384_1.color.r, 0.5, var_384_3)

							iter_384_1.color = Color.New(var_384_4, var_384_4, var_384_4)
						end
					end
				end
			end

			if arg_381_1.time_ >= var_384_1 + var_384_2 and arg_381_1.time_ < var_384_1 + var_384_2 + arg_384_0 and arg_381_1.var_.actorSpriteComps1070 then
				local var_384_5 = 0.5

				for iter_384_2, iter_384_3 in pairs(arg_381_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_384_3 then
						iter_384_3.color = Color.New(var_384_5, var_384_5, var_384_5)
					end
				end

				arg_381_1.var_.actorSpriteComps1070 = nil
			end

			local var_384_6 = 0
			local var_384_7 = 0.1

			if var_384_6 < arg_381_1.time_ and arg_381_1.time_ <= var_384_6 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_8 = arg_381_1:FormatText(StoryNameCfg[7].name)

				arg_381_1.leftNameTxt_.text = var_384_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_9 = arg_381_1:GetWordFromCfg(910109096)
				local var_384_10 = arg_381_1:FormatText(var_384_9.content)

				arg_381_1.text_.text = var_384_10

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_11 = 4
				local var_384_12 = utf8.len(var_384_10)
				local var_384_13 = var_384_11 <= 0 and var_384_7 or var_384_7 * (var_384_12 / var_384_11)

				if var_384_13 > 0 and var_384_7 < var_384_13 then
					arg_381_1.talkMaxDuration = var_384_13

					if var_384_13 + var_384_6 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_13 + var_384_6
					end
				end

				arg_381_1.text_.text = var_384_10
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)
				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_14 = math.max(var_384_7, arg_381_1.talkMaxDuration)

			if var_384_6 <= arg_381_1.time_ and arg_381_1.time_ < var_384_6 + var_384_14 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_6) / var_384_14

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_6 + var_384_14 and arg_381_1.time_ < var_384_6 + var_384_14 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play910109097 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 910109097
		arg_385_1.duration_ = 5

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play910109098(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = 0
			local var_388_1 = 0.2

			if var_388_0 < arg_385_1.time_ and arg_385_1.time_ <= var_388_0 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_2 = arg_385_1:FormatText(StoryNameCfg[7].name)

				arg_385_1.leftNameTxt_.text = var_388_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_3 = arg_385_1:GetWordFromCfg(910109097)
				local var_388_4 = arg_385_1:FormatText(var_388_3.content)

				arg_385_1.text_.text = var_388_4

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_5 = 8
				local var_388_6 = utf8.len(var_388_4)
				local var_388_7 = var_388_5 <= 0 and var_388_1 or var_388_1 * (var_388_6 / var_388_5)

				if var_388_7 > 0 and var_388_1 < var_388_7 then
					arg_385_1.talkMaxDuration = var_388_7

					if var_388_7 + var_388_0 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_7 + var_388_0
					end
				end

				arg_385_1.text_.text = var_388_4
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)
				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_8 = math.max(var_388_1, arg_385_1.talkMaxDuration)

			if var_388_0 <= arg_385_1.time_ and arg_385_1.time_ < var_388_0 + var_388_8 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_0) / var_388_8

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_0 + var_388_8 and arg_385_1.time_ < var_388_0 + var_388_8 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play910109098 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 910109098
		arg_389_1.duration_ = 5

		SetActive(arg_389_1.tipsGo_, false)

		function arg_389_1.onSingleLineFinish_()
			arg_389_1.onSingleLineUpdate_ = nil
			arg_389_1.onSingleLineFinish_ = nil
			arg_389_1.state_ = "waiting"
		end

		function arg_389_1.playNext_(arg_391_0)
			if arg_391_0 == 1 then
				arg_389_0:Play910109099(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["1070"].transform
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 then
				arg_389_1.var_.moveOldPos1070 = var_392_0.localPosition
				var_392_0.localScale = Vector3.New(1, 1, 1)

				arg_389_1:CheckSpriteTmpPos("1070", 3)

				local var_392_2 = var_392_0.childCount

				for iter_392_0 = 0, var_392_2 - 1 do
					local var_392_3 = var_392_0:GetChild(iter_392_0)

					if var_392_3.name == "split_1" or not string.find(var_392_3.name, "split") then
						var_392_3.gameObject:SetActive(true)
					else
						var_392_3.gameObject:SetActive(false)
					end
				end
			end

			local var_392_4 = 0.001

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_4 then
				local var_392_5 = (arg_389_1.time_ - var_392_1) / var_392_4
				local var_392_6 = Vector3.New(0, -350, -180)

				var_392_0.localPosition = Vector3.Lerp(arg_389_1.var_.moveOldPos1070, var_392_6, var_392_5)
			end

			if arg_389_1.time_ >= var_392_1 + var_392_4 and arg_389_1.time_ < var_392_1 + var_392_4 + arg_392_0 then
				var_392_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_392_7 = arg_389_1.actors_["1070"]
			local var_392_8 = 0

			if var_392_8 < arg_389_1.time_ and arg_389_1.time_ <= var_392_8 + arg_392_0 and arg_389_1.var_.actorSpriteComps1070 == nil then
				arg_389_1.var_.actorSpriteComps1070 = var_392_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_392_9 = 0.0166666666666667

			if var_392_8 <= arg_389_1.time_ and arg_389_1.time_ < var_392_8 + var_392_9 then
				local var_392_10 = (arg_389_1.time_ - var_392_8) / var_392_9

				if arg_389_1.var_.actorSpriteComps1070 then
					for iter_392_1, iter_392_2 in pairs(arg_389_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_392_2 then
							local var_392_11 = Mathf.Lerp(iter_392_2.color.r, 1, var_392_10)

							iter_392_2.color = Color.New(var_392_11, var_392_11, var_392_11)
						end
					end
				end
			end

			if arg_389_1.time_ >= var_392_8 + var_392_9 and arg_389_1.time_ < var_392_8 + var_392_9 + arg_392_0 and arg_389_1.var_.actorSpriteComps1070 then
				local var_392_12 = 1

				for iter_392_3, iter_392_4 in pairs(arg_389_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_392_4 then
						iter_392_4.color = Color.New(var_392_12, var_392_12, var_392_12)
					end
				end

				arg_389_1.var_.actorSpriteComps1070 = nil
			end

			local var_392_13 = 0
			local var_392_14 = 1.95

			if var_392_13 < arg_389_1.time_ and arg_389_1.time_ <= var_392_13 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_15 = arg_389_1:FormatText(StoryNameCfg[318].name)

				arg_389_1.leftNameTxt_.text = var_392_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_16 = arg_389_1:GetWordFromCfg(910109098)
				local var_392_17 = arg_389_1:FormatText(var_392_16.content)

				arg_389_1.text_.text = var_392_17

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_18 = 86
				local var_392_19 = utf8.len(var_392_17)
				local var_392_20 = var_392_18 <= 0 and var_392_14 or var_392_14 * (var_392_19 / var_392_18)

				if var_392_20 > 0 and var_392_14 < var_392_20 then
					arg_389_1.talkMaxDuration = var_392_20

					if var_392_20 + var_392_13 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_20 + var_392_13
					end
				end

				arg_389_1.text_.text = var_392_17
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)
				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_21 = math.max(var_392_14, arg_389_1.talkMaxDuration)

			if var_392_13 <= arg_389_1.time_ and arg_389_1.time_ < var_392_13 + var_392_21 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_13) / var_392_21

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_13 + var_392_21 and arg_389_1.time_ < var_392_13 + var_392_21 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play910109099 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 910109099
		arg_393_1.duration_ = 5

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play910109100(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = arg_393_1.actors_["1070"]
			local var_396_1 = 0

			if var_396_1 < arg_393_1.time_ and arg_393_1.time_ <= var_396_1 + arg_396_0 and arg_393_1.var_.actorSpriteComps1070 == nil then
				arg_393_1.var_.actorSpriteComps1070 = var_396_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_396_2 = 0.0166666666666667

			if var_396_1 <= arg_393_1.time_ and arg_393_1.time_ < var_396_1 + var_396_2 then
				local var_396_3 = (arg_393_1.time_ - var_396_1) / var_396_2

				if arg_393_1.var_.actorSpriteComps1070 then
					for iter_396_0, iter_396_1 in pairs(arg_393_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_396_1 then
							local var_396_4 = Mathf.Lerp(iter_396_1.color.r, 0.5, var_396_3)

							iter_396_1.color = Color.New(var_396_4, var_396_4, var_396_4)
						end
					end
				end
			end

			if arg_393_1.time_ >= var_396_1 + var_396_2 and arg_393_1.time_ < var_396_1 + var_396_2 + arg_396_0 and arg_393_1.var_.actorSpriteComps1070 then
				local var_396_5 = 0.5

				for iter_396_2, iter_396_3 in pairs(arg_393_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_396_3 then
						iter_396_3.color = Color.New(var_396_5, var_396_5, var_396_5)
					end
				end

				arg_393_1.var_.actorSpriteComps1070 = nil
			end

			local var_396_6 = 0
			local var_396_7 = 0.275

			if var_396_6 < arg_393_1.time_ and arg_393_1.time_ <= var_396_6 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_8 = arg_393_1:FormatText(StoryNameCfg[7].name)

				arg_393_1.leftNameTxt_.text = var_396_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_9 = arg_393_1:GetWordFromCfg(910109099)
				local var_396_10 = arg_393_1:FormatText(var_396_9.content)

				arg_393_1.text_.text = var_396_10

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_11 = 11
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
				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_14 = math.max(var_396_7, arg_393_1.talkMaxDuration)

			if var_396_6 <= arg_393_1.time_ and arg_393_1.time_ < var_396_6 + var_396_14 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_6) / var_396_14

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_6 + var_396_14 and arg_393_1.time_ < var_396_6 + var_396_14 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play910109100 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 910109100
		arg_397_1.duration_ = 5

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play910109101(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = arg_397_1.actors_["1070"].transform
			local var_400_1 = 0

			if var_400_1 < arg_397_1.time_ and arg_397_1.time_ <= var_400_1 + arg_400_0 then
				arg_397_1.var_.moveOldPos1070 = var_400_0.localPosition
				var_400_0.localScale = Vector3.New(1, 1, 1)

				arg_397_1:CheckSpriteTmpPos("1070", 3)

				local var_400_2 = var_400_0.childCount

				for iter_400_0 = 0, var_400_2 - 1 do
					local var_400_3 = var_400_0:GetChild(iter_400_0)

					if var_400_3.name == "split_6" or not string.find(var_400_3.name, "split") then
						var_400_3.gameObject:SetActive(true)
					else
						var_400_3.gameObject:SetActive(false)
					end
				end
			end

			local var_400_4 = 0.001

			if var_400_1 <= arg_397_1.time_ and arg_397_1.time_ < var_400_1 + var_400_4 then
				local var_400_5 = (arg_397_1.time_ - var_400_1) / var_400_4
				local var_400_6 = Vector3.New(0, -350, -180)

				var_400_0.localPosition = Vector3.Lerp(arg_397_1.var_.moveOldPos1070, var_400_6, var_400_5)
			end

			if arg_397_1.time_ >= var_400_1 + var_400_4 and arg_397_1.time_ < var_400_1 + var_400_4 + arg_400_0 then
				var_400_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_400_7 = arg_397_1.actors_["1070"]
			local var_400_8 = 0

			if var_400_8 < arg_397_1.time_ and arg_397_1.time_ <= var_400_8 + arg_400_0 and arg_397_1.var_.actorSpriteComps1070 == nil then
				arg_397_1.var_.actorSpriteComps1070 = var_400_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_400_9 = 0.0166666666666667

			if var_400_8 <= arg_397_1.time_ and arg_397_1.time_ < var_400_8 + var_400_9 then
				local var_400_10 = (arg_397_1.time_ - var_400_8) / var_400_9

				if arg_397_1.var_.actorSpriteComps1070 then
					for iter_400_1, iter_400_2 in pairs(arg_397_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_400_2 then
							local var_400_11 = Mathf.Lerp(iter_400_2.color.r, 1, var_400_10)

							iter_400_2.color = Color.New(var_400_11, var_400_11, var_400_11)
						end
					end
				end
			end

			if arg_397_1.time_ >= var_400_8 + var_400_9 and arg_397_1.time_ < var_400_8 + var_400_9 + arg_400_0 and arg_397_1.var_.actorSpriteComps1070 then
				local var_400_12 = 1

				for iter_400_3, iter_400_4 in pairs(arg_397_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_400_4 then
						iter_400_4.color = Color.New(var_400_12, var_400_12, var_400_12)
					end
				end

				arg_397_1.var_.actorSpriteComps1070 = nil
			end

			local var_400_13 = 0
			local var_400_14 = 1.325

			if var_400_13 < arg_397_1.time_ and arg_397_1.time_ <= var_400_13 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_15 = arg_397_1:FormatText(StoryNameCfg[318].name)

				arg_397_1.leftNameTxt_.text = var_400_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_16 = arg_397_1:GetWordFromCfg(910109100)
				local var_400_17 = arg_397_1:FormatText(var_400_16.content)

				arg_397_1.text_.text = var_400_17

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_18 = 53
				local var_400_19 = utf8.len(var_400_17)
				local var_400_20 = var_400_18 <= 0 and var_400_14 or var_400_14 * (var_400_19 / var_400_18)

				if var_400_20 > 0 and var_400_14 < var_400_20 then
					arg_397_1.talkMaxDuration = var_400_20

					if var_400_20 + var_400_13 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_20 + var_400_13
					end
				end

				arg_397_1.text_.text = var_400_17
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)
				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_21 = math.max(var_400_14, arg_397_1.talkMaxDuration)

			if var_400_13 <= arg_397_1.time_ and arg_397_1.time_ < var_400_13 + var_400_21 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_13) / var_400_21

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_13 + var_400_21 and arg_397_1.time_ < var_400_13 + var_400_21 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play910109101 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 910109101
		arg_401_1.duration_ = 0.199999999999

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"

			SetActive(arg_401_1.choicesGo_, true)

			for iter_402_0, iter_402_1 in ipairs(arg_401_1.choices_) do
				local var_402_0 = iter_402_0 <= 2

				SetActive(iter_402_1.go, var_402_0)
			end

			arg_401_1.choices_[1].txt.text = arg_401_1:FormatText(StoryChoiceCfg[290].name)
			arg_401_1.choices_[2].txt.text = arg_401_1:FormatText(StoryChoiceCfg[291].name)
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play910109102(arg_401_1)
			end

			if arg_403_0 == 2 then
				arg_401_0:Play910109103(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["1070"]
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 and arg_401_1.var_.actorSpriteComps1070 == nil then
				arg_401_1.var_.actorSpriteComps1070 = var_404_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_404_2 = 0.2

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_2 then
				local var_404_3 = (arg_401_1.time_ - var_404_1) / var_404_2

				if arg_401_1.var_.actorSpriteComps1070 then
					for iter_404_0, iter_404_1 in pairs(arg_401_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_404_1 then
							local var_404_4 = Mathf.Lerp(iter_404_1.color.r, 0.5, var_404_3)

							iter_404_1.color = Color.New(var_404_4, var_404_4, var_404_4)
						end
					end
				end
			end

			if arg_401_1.time_ >= var_404_1 + var_404_2 and arg_401_1.time_ < var_404_1 + var_404_2 + arg_404_0 and arg_401_1.var_.actorSpriteComps1070 then
				local var_404_5 = 0.5

				for iter_404_2, iter_404_3 in pairs(arg_401_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_404_3 then
						iter_404_3.color = Color.New(var_404_5, var_404_5, var_404_5)
					end
				end

				arg_401_1.var_.actorSpriteComps1070 = nil
			end
		end
	end,
	Play910109102 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 910109102
		arg_405_1.duration_ = 5

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play910109103(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = arg_405_1.actors_["1070"]
			local var_408_1 = 0

			if var_408_1 < arg_405_1.time_ and arg_405_1.time_ <= var_408_1 + arg_408_0 and arg_405_1.var_.actorSpriteComps1070 == nil then
				arg_405_1.var_.actorSpriteComps1070 = var_408_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_408_2 = 0.2

			if var_408_1 <= arg_405_1.time_ and arg_405_1.time_ < var_408_1 + var_408_2 then
				local var_408_3 = (arg_405_1.time_ - var_408_1) / var_408_2

				if arg_405_1.var_.actorSpriteComps1070 then
					for iter_408_0, iter_408_1 in pairs(arg_405_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_408_1 then
							local var_408_4 = Mathf.Lerp(iter_408_1.color.r, 1, var_408_3)

							iter_408_1.color = Color.New(var_408_4, var_408_4, var_408_4)
						end
					end
				end
			end

			if arg_405_1.time_ >= var_408_1 + var_408_2 and arg_405_1.time_ < var_408_1 + var_408_2 + arg_408_0 and arg_405_1.var_.actorSpriteComps1070 then
				local var_408_5 = 1

				for iter_408_2, iter_408_3 in pairs(arg_405_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_408_3 then
						iter_408_3.color = Color.New(var_408_5, var_408_5, var_408_5)
					end
				end

				arg_405_1.var_.actorSpriteComps1070 = nil
			end

			local var_408_6 = 0
			local var_408_7 = 0.9

			if var_408_6 < arg_405_1.time_ and arg_405_1.time_ <= var_408_6 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_8 = arg_405_1:FormatText(StoryNameCfg[318].name)

				arg_405_1.leftNameTxt_.text = var_408_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_9 = arg_405_1:GetWordFromCfg(910109102)
				local var_408_10 = arg_405_1:FormatText(var_408_9.content)

				arg_405_1.text_.text = var_408_10

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_11 = 36
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
				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_14 = math.max(var_408_7, arg_405_1.talkMaxDuration)

			if var_408_6 <= arg_405_1.time_ and arg_405_1.time_ < var_408_6 + var_408_14 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_6) / var_408_14

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_6 + var_408_14 and arg_405_1.time_ < var_408_6 + var_408_14 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play910109103 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 910109103
		arg_409_1.duration_ = 5

		SetActive(arg_409_1.tipsGo_, false)

		function arg_409_1.onSingleLineFinish_()
			arg_409_1.onSingleLineUpdate_ = nil
			arg_409_1.onSingleLineFinish_ = nil
			arg_409_1.state_ = "waiting"
		end

		function arg_409_1.playNext_(arg_411_0)
			if arg_411_0 == 1 then
				arg_409_0:Play910109104(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["1070"].transform
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 then
				arg_409_1.var_.moveOldPos1070 = var_412_0.localPosition
				var_412_0.localScale = Vector3.New(1, 1, 1)

				arg_409_1:CheckSpriteTmpPos("1070", 3)

				local var_412_2 = var_412_0.childCount

				for iter_412_0 = 0, var_412_2 - 1 do
					local var_412_3 = var_412_0:GetChild(iter_412_0)

					if var_412_3.name == "split_2" or not string.find(var_412_3.name, "split") then
						var_412_3.gameObject:SetActive(true)
					else
						var_412_3.gameObject:SetActive(false)
					end
				end
			end

			local var_412_4 = 0.001

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_4 then
				local var_412_5 = (arg_409_1.time_ - var_412_1) / var_412_4
				local var_412_6 = Vector3.New(0, -350, -180)

				var_412_0.localPosition = Vector3.Lerp(arg_409_1.var_.moveOldPos1070, var_412_6, var_412_5)
			end

			if arg_409_1.time_ >= var_412_1 + var_412_4 and arg_409_1.time_ < var_412_1 + var_412_4 + arg_412_0 then
				var_412_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_412_7 = arg_409_1.actors_["1070"]
			local var_412_8 = 0

			if var_412_8 < arg_409_1.time_ and arg_409_1.time_ <= var_412_8 + arg_412_0 and arg_409_1.var_.actorSpriteComps1070 == nil then
				arg_409_1.var_.actorSpriteComps1070 = var_412_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_412_9 = 0.0166666666666667

			if var_412_8 <= arg_409_1.time_ and arg_409_1.time_ < var_412_8 + var_412_9 then
				local var_412_10 = (arg_409_1.time_ - var_412_8) / var_412_9

				if arg_409_1.var_.actorSpriteComps1070 then
					for iter_412_1, iter_412_2 in pairs(arg_409_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_412_2 then
							local var_412_11 = Mathf.Lerp(iter_412_2.color.r, 1, var_412_10)

							iter_412_2.color = Color.New(var_412_11, var_412_11, var_412_11)
						end
					end
				end
			end

			if arg_409_1.time_ >= var_412_8 + var_412_9 and arg_409_1.time_ < var_412_8 + var_412_9 + arg_412_0 and arg_409_1.var_.actorSpriteComps1070 then
				local var_412_12 = 1

				for iter_412_3, iter_412_4 in pairs(arg_409_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_412_4 then
						iter_412_4.color = Color.New(var_412_12, var_412_12, var_412_12)
					end
				end

				arg_409_1.var_.actorSpriteComps1070 = nil
			end

			local var_412_13 = 0
			local var_412_14 = 0.075

			if var_412_13 < arg_409_1.time_ and arg_409_1.time_ <= var_412_13 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_15 = arg_409_1:FormatText(StoryNameCfg[318].name)

				arg_409_1.leftNameTxt_.text = var_412_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_16 = arg_409_1:GetWordFromCfg(910109103)
				local var_412_17 = arg_409_1:FormatText(var_412_16.content)

				arg_409_1.text_.text = var_412_17

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_18 = 3
				local var_412_19 = utf8.len(var_412_17)
				local var_412_20 = var_412_18 <= 0 and var_412_14 or var_412_14 * (var_412_19 / var_412_18)

				if var_412_20 > 0 and var_412_14 < var_412_20 then
					arg_409_1.talkMaxDuration = var_412_20

					if var_412_20 + var_412_13 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_20 + var_412_13
					end
				end

				arg_409_1.text_.text = var_412_17
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)
				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_21 = math.max(var_412_14, arg_409_1.talkMaxDuration)

			if var_412_13 <= arg_409_1.time_ and arg_409_1.time_ < var_412_13 + var_412_21 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_13) / var_412_21

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_13 + var_412_21 and arg_409_1.time_ < var_412_13 + var_412_21 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play910109104 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 910109104
		arg_413_1.duration_ = 5

		SetActive(arg_413_1.tipsGo_, false)

		function arg_413_1.onSingleLineFinish_()
			arg_413_1.onSingleLineUpdate_ = nil
			arg_413_1.onSingleLineFinish_ = nil
			arg_413_1.state_ = "waiting"
		end

		function arg_413_1.playNext_(arg_415_0)
			if arg_415_0 == 1 then
				arg_413_0:Play910109105(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["1070"].transform
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 then
				arg_413_1.var_.moveOldPos1070 = var_416_0.localPosition
				var_416_0.localScale = Vector3.New(1, 1, 1)

				arg_413_1:CheckSpriteTmpPos("1070", 3)

				local var_416_2 = var_416_0.childCount

				for iter_416_0 = 0, var_416_2 - 1 do
					local var_416_3 = var_416_0:GetChild(iter_416_0)

					if var_416_3.name == "split_6" or not string.find(var_416_3.name, "split") then
						var_416_3.gameObject:SetActive(true)
					else
						var_416_3.gameObject:SetActive(false)
					end
				end
			end

			local var_416_4 = 0.001

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_4 then
				local var_416_5 = (arg_413_1.time_ - var_416_1) / var_416_4
				local var_416_6 = Vector3.New(0, -350, -180)

				var_416_0.localPosition = Vector3.Lerp(arg_413_1.var_.moveOldPos1070, var_416_6, var_416_5)
			end

			if arg_413_1.time_ >= var_416_1 + var_416_4 and arg_413_1.time_ < var_416_1 + var_416_4 + arg_416_0 then
				var_416_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_416_7 = arg_413_1.actors_["1070"]
			local var_416_8 = 0

			if var_416_8 < arg_413_1.time_ and arg_413_1.time_ <= var_416_8 + arg_416_0 and arg_413_1.var_.actorSpriteComps1070 == nil then
				arg_413_1.var_.actorSpriteComps1070 = var_416_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_416_9 = 0.0166666666666667

			if var_416_8 <= arg_413_1.time_ and arg_413_1.time_ < var_416_8 + var_416_9 then
				local var_416_10 = (arg_413_1.time_ - var_416_8) / var_416_9

				if arg_413_1.var_.actorSpriteComps1070 then
					for iter_416_1, iter_416_2 in pairs(arg_413_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_416_2 then
							local var_416_11 = Mathf.Lerp(iter_416_2.color.r, 1, var_416_10)

							iter_416_2.color = Color.New(var_416_11, var_416_11, var_416_11)
						end
					end
				end
			end

			if arg_413_1.time_ >= var_416_8 + var_416_9 and arg_413_1.time_ < var_416_8 + var_416_9 + arg_416_0 and arg_413_1.var_.actorSpriteComps1070 then
				local var_416_12 = 1

				for iter_416_3, iter_416_4 in pairs(arg_413_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_416_4 then
						iter_416_4.color = Color.New(var_416_12, var_416_12, var_416_12)
					end
				end

				arg_413_1.var_.actorSpriteComps1070 = nil
			end

			local var_416_13 = 0
			local var_416_14 = 1.175

			if var_416_13 < arg_413_1.time_ and arg_413_1.time_ <= var_416_13 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_15 = arg_413_1:FormatText(StoryNameCfg[318].name)

				arg_413_1.leftNameTxt_.text = var_416_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_16 = arg_413_1:GetWordFromCfg(910109104)
				local var_416_17 = arg_413_1:FormatText(var_416_16.content)

				arg_413_1.text_.text = var_416_17

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_18 = 47
				local var_416_19 = utf8.len(var_416_17)
				local var_416_20 = var_416_18 <= 0 and var_416_14 or var_416_14 * (var_416_19 / var_416_18)

				if var_416_20 > 0 and var_416_14 < var_416_20 then
					arg_413_1.talkMaxDuration = var_416_20

					if var_416_20 + var_416_13 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_20 + var_416_13
					end
				end

				arg_413_1.text_.text = var_416_17
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)
				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_21 = math.max(var_416_14, arg_413_1.talkMaxDuration)

			if var_416_13 <= arg_413_1.time_ and arg_413_1.time_ < var_416_13 + var_416_21 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_13) / var_416_21

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_13 + var_416_21 and arg_413_1.time_ < var_416_13 + var_416_21 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play910109105 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 910109105
		arg_417_1.duration_ = 5

		SetActive(arg_417_1.tipsGo_, false)

		function arg_417_1.onSingleLineFinish_()
			arg_417_1.onSingleLineUpdate_ = nil
			arg_417_1.onSingleLineFinish_ = nil
			arg_417_1.state_ = "waiting"
		end

		function arg_417_1.playNext_(arg_419_0)
			if arg_419_0 == 1 then
				arg_417_0:Play910109106(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["1070"]
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 and arg_417_1.var_.actorSpriteComps1070 == nil then
				arg_417_1.var_.actorSpriteComps1070 = var_420_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_420_2 = 0.0166666666666667

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2

				if arg_417_1.var_.actorSpriteComps1070 then
					for iter_420_0, iter_420_1 in pairs(arg_417_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_420_1 then
							local var_420_4 = Mathf.Lerp(iter_420_1.color.r, 0.5, var_420_3)

							iter_420_1.color = Color.New(var_420_4, var_420_4, var_420_4)
						end
					end
				end
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 and arg_417_1.var_.actorSpriteComps1070 then
				local var_420_5 = 0.5

				for iter_420_2, iter_420_3 in pairs(arg_417_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_420_3 then
						iter_420_3.color = Color.New(var_420_5, var_420_5, var_420_5)
					end
				end

				arg_417_1.var_.actorSpriteComps1070 = nil
			end

			local var_420_6 = 0
			local var_420_7 = 0.45

			if var_420_6 < arg_417_1.time_ and arg_417_1.time_ <= var_420_6 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_8 = arg_417_1:FormatText(StoryNameCfg[7].name)

				arg_417_1.leftNameTxt_.text = var_420_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_9 = arg_417_1:GetWordFromCfg(910109105)
				local var_420_10 = arg_417_1:FormatText(var_420_9.content)

				arg_417_1.text_.text = var_420_10

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_11 = 18
				local var_420_12 = utf8.len(var_420_10)
				local var_420_13 = var_420_11 <= 0 and var_420_7 or var_420_7 * (var_420_12 / var_420_11)

				if var_420_13 > 0 and var_420_7 < var_420_13 then
					arg_417_1.talkMaxDuration = var_420_13

					if var_420_13 + var_420_6 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_13 + var_420_6
					end
				end

				arg_417_1.text_.text = var_420_10
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)
				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_14 = math.max(var_420_7, arg_417_1.talkMaxDuration)

			if var_420_6 <= arg_417_1.time_ and arg_417_1.time_ < var_420_6 + var_420_14 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_6) / var_420_14

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_6 + var_420_14 and arg_417_1.time_ < var_420_6 + var_420_14 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play910109106 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 910109106
		arg_421_1.duration_ = 5

		SetActive(arg_421_1.tipsGo_, false)

		function arg_421_1.onSingleLineFinish_()
			arg_421_1.onSingleLineUpdate_ = nil
			arg_421_1.onSingleLineFinish_ = nil
			arg_421_1.state_ = "waiting"
		end

		function arg_421_1.playNext_(arg_423_0)
			if arg_423_0 == 1 then
				arg_421_0:Play910109107(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["1070"]
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 and arg_421_1.var_.actorSpriteComps1070 == nil then
				arg_421_1.var_.actorSpriteComps1070 = var_424_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_424_2 = 0.0166666666666667

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_2 then
				local var_424_3 = (arg_421_1.time_ - var_424_1) / var_424_2

				if arg_421_1.var_.actorSpriteComps1070 then
					for iter_424_0, iter_424_1 in pairs(arg_421_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_424_1 then
							local var_424_4 = Mathf.Lerp(iter_424_1.color.r, 1, var_424_3)

							iter_424_1.color = Color.New(var_424_4, var_424_4, var_424_4)
						end
					end
				end
			end

			if arg_421_1.time_ >= var_424_1 + var_424_2 and arg_421_1.time_ < var_424_1 + var_424_2 + arg_424_0 and arg_421_1.var_.actorSpriteComps1070 then
				local var_424_5 = 1

				for iter_424_2, iter_424_3 in pairs(arg_421_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_424_3 then
						iter_424_3.color = Color.New(var_424_5, var_424_5, var_424_5)
					end
				end

				arg_421_1.var_.actorSpriteComps1070 = nil
			end

			local var_424_6 = 0
			local var_424_7 = 0.875

			if var_424_6 < arg_421_1.time_ and arg_421_1.time_ <= var_424_6 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, true)

				local var_424_8 = arg_421_1:FormatText(StoryNameCfg[318].name)

				arg_421_1.leftNameTxt_.text = var_424_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_421_1.leftNameTxt_.transform)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1.leftNameTxt_.text)
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_9 = arg_421_1:GetWordFromCfg(910109106)
				local var_424_10 = arg_421_1:FormatText(var_424_9.content)

				arg_421_1.text_.text = var_424_10

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_11 = 35
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
				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_14 = math.max(var_424_7, arg_421_1.talkMaxDuration)

			if var_424_6 <= arg_421_1.time_ and arg_421_1.time_ < var_424_6 + var_424_14 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_6) / var_424_14

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_6 + var_424_14 and arg_421_1.time_ < var_424_6 + var_424_14 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play910109107 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 910109107
		arg_425_1.duration_ = 5

		SetActive(arg_425_1.tipsGo_, false)

		function arg_425_1.onSingleLineFinish_()
			arg_425_1.onSingleLineUpdate_ = nil
			arg_425_1.onSingleLineFinish_ = nil
			arg_425_1.state_ = "waiting"
		end

		function arg_425_1.playNext_(arg_427_0)
			if arg_427_0 == 1 then
				arg_425_0:Play910109108(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = 0
			local var_428_1 = 0.75

			if var_428_0 < arg_425_1.time_ and arg_425_1.time_ <= var_428_0 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_2 = arg_425_1:FormatText(StoryNameCfg[318].name)

				arg_425_1.leftNameTxt_.text = var_428_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_3 = arg_425_1:GetWordFromCfg(910109107)
				local var_428_4 = arg_425_1:FormatText(var_428_3.content)

				arg_425_1.text_.text = var_428_4

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_5 = 30
				local var_428_6 = utf8.len(var_428_4)
				local var_428_7 = var_428_5 <= 0 and var_428_1 or var_428_1 * (var_428_6 / var_428_5)

				if var_428_7 > 0 and var_428_1 < var_428_7 then
					arg_425_1.talkMaxDuration = var_428_7

					if var_428_7 + var_428_0 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_7 + var_428_0
					end
				end

				arg_425_1.text_.text = var_428_4
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)
				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_8 = math.max(var_428_1, arg_425_1.talkMaxDuration)

			if var_428_0 <= arg_425_1.time_ and arg_425_1.time_ < var_428_0 + var_428_8 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_0) / var_428_8

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_0 + var_428_8 and arg_425_1.time_ < var_428_0 + var_428_8 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play910109108 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 910109108
		arg_429_1.duration_ = 5

		SetActive(arg_429_1.tipsGo_, false)

		function arg_429_1.onSingleLineFinish_()
			arg_429_1.onSingleLineUpdate_ = nil
			arg_429_1.onSingleLineFinish_ = nil
			arg_429_1.state_ = "waiting"
		end

		function arg_429_1.playNext_(arg_431_0)
			if arg_431_0 == 1 then
				arg_429_0:Play910109109(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = arg_429_1.actors_["1070"]
			local var_432_1 = 0

			if var_432_1 < arg_429_1.time_ and arg_429_1.time_ <= var_432_1 + arg_432_0 and arg_429_1.var_.actorSpriteComps1070 == nil then
				arg_429_1.var_.actorSpriteComps1070 = var_432_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_432_2 = 0.0166666666666667

			if var_432_1 <= arg_429_1.time_ and arg_429_1.time_ < var_432_1 + var_432_2 then
				local var_432_3 = (arg_429_1.time_ - var_432_1) / var_432_2

				if arg_429_1.var_.actorSpriteComps1070 then
					for iter_432_0, iter_432_1 in pairs(arg_429_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_432_1 then
							local var_432_4 = Mathf.Lerp(iter_432_1.color.r, 0.5, var_432_3)

							iter_432_1.color = Color.New(var_432_4, var_432_4, var_432_4)
						end
					end
				end
			end

			if arg_429_1.time_ >= var_432_1 + var_432_2 and arg_429_1.time_ < var_432_1 + var_432_2 + arg_432_0 and arg_429_1.var_.actorSpriteComps1070 then
				local var_432_5 = 0.5

				for iter_432_2, iter_432_3 in pairs(arg_429_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_432_3 then
						iter_432_3.color = Color.New(var_432_5, var_432_5, var_432_5)
					end
				end

				arg_429_1.var_.actorSpriteComps1070 = nil
			end

			local var_432_6 = 0
			local var_432_7 = 0.225

			if var_432_6 < arg_429_1.time_ and arg_429_1.time_ <= var_432_6 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, true)

				local var_432_8 = arg_429_1:FormatText(StoryNameCfg[7].name)

				arg_429_1.leftNameTxt_.text = var_432_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_429_1.leftNameTxt_.transform)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1.leftNameTxt_.text)
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_9 = arg_429_1:GetWordFromCfg(910109108)
				local var_432_10 = arg_429_1:FormatText(var_432_9.content)

				arg_429_1.text_.text = var_432_10

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_11 = 9
				local var_432_12 = utf8.len(var_432_10)
				local var_432_13 = var_432_11 <= 0 and var_432_7 or var_432_7 * (var_432_12 / var_432_11)

				if var_432_13 > 0 and var_432_7 < var_432_13 then
					arg_429_1.talkMaxDuration = var_432_13

					if var_432_13 + var_432_6 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_13 + var_432_6
					end
				end

				arg_429_1.text_.text = var_432_10
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)
				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_14 = math.max(var_432_7, arg_429_1.talkMaxDuration)

			if var_432_6 <= arg_429_1.time_ and arg_429_1.time_ < var_432_6 + var_432_14 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_6) / var_432_14

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_6 + var_432_14 and arg_429_1.time_ < var_432_6 + var_432_14 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play910109109 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 910109109
		arg_433_1.duration_ = 5

		SetActive(arg_433_1.tipsGo_, false)

		function arg_433_1.onSingleLineFinish_()
			arg_433_1.onSingleLineUpdate_ = nil
			arg_433_1.onSingleLineFinish_ = nil
			arg_433_1.state_ = "waiting"
		end

		function arg_433_1.playNext_(arg_435_0)
			if arg_435_0 == 1 then
				arg_433_0:Play910109110(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = arg_433_1.actors_["1070"].transform
			local var_436_1 = 0

			if var_436_1 < arg_433_1.time_ and arg_433_1.time_ <= var_436_1 + arg_436_0 then
				arg_433_1.var_.moveOldPos1070 = var_436_0.localPosition
				var_436_0.localScale = Vector3.New(1, 1, 1)

				arg_433_1:CheckSpriteTmpPos("1070", 3)

				local var_436_2 = var_436_0.childCount

				for iter_436_0 = 0, var_436_2 - 1 do
					local var_436_3 = var_436_0:GetChild(iter_436_0)

					if var_436_3.name == "split_8" or not string.find(var_436_3.name, "split") then
						var_436_3.gameObject:SetActive(true)
					else
						var_436_3.gameObject:SetActive(false)
					end
				end
			end

			local var_436_4 = 0.001

			if var_436_1 <= arg_433_1.time_ and arg_433_1.time_ < var_436_1 + var_436_4 then
				local var_436_5 = (arg_433_1.time_ - var_436_1) / var_436_4
				local var_436_6 = Vector3.New(0, -350, -180)

				var_436_0.localPosition = Vector3.Lerp(arg_433_1.var_.moveOldPos1070, var_436_6, var_436_5)
			end

			if arg_433_1.time_ >= var_436_1 + var_436_4 and arg_433_1.time_ < var_436_1 + var_436_4 + arg_436_0 then
				var_436_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_436_7 = arg_433_1.actors_["1070"]
			local var_436_8 = 0

			if var_436_8 < arg_433_1.time_ and arg_433_1.time_ <= var_436_8 + arg_436_0 and arg_433_1.var_.actorSpriteComps1070 == nil then
				arg_433_1.var_.actorSpriteComps1070 = var_436_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_436_9 = 0.0166666666666667

			if var_436_8 <= arg_433_1.time_ and arg_433_1.time_ < var_436_8 + var_436_9 then
				local var_436_10 = (arg_433_1.time_ - var_436_8) / var_436_9

				if arg_433_1.var_.actorSpriteComps1070 then
					for iter_436_1, iter_436_2 in pairs(arg_433_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_436_2 then
							local var_436_11 = Mathf.Lerp(iter_436_2.color.r, 1, var_436_10)

							iter_436_2.color = Color.New(var_436_11, var_436_11, var_436_11)
						end
					end
				end
			end

			if arg_433_1.time_ >= var_436_8 + var_436_9 and arg_433_1.time_ < var_436_8 + var_436_9 + arg_436_0 and arg_433_1.var_.actorSpriteComps1070 then
				local var_436_12 = 1

				for iter_436_3, iter_436_4 in pairs(arg_433_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_436_4 then
						iter_436_4.color = Color.New(var_436_12, var_436_12, var_436_12)
					end
				end

				arg_433_1.var_.actorSpriteComps1070 = nil
			end

			local var_436_13 = 0
			local var_436_14 = 0.4

			if var_436_13 < arg_433_1.time_ and arg_433_1.time_ <= var_436_13 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, true)

				local var_436_15 = arg_433_1:FormatText(StoryNameCfg[318].name)

				arg_433_1.leftNameTxt_.text = var_436_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_433_1.leftNameTxt_.transform)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1.leftNameTxt_.text)
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_16 = arg_433_1:GetWordFromCfg(910109109)
				local var_436_17 = arg_433_1:FormatText(var_436_16.content)

				arg_433_1.text_.text = var_436_17

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_18 = 16
				local var_436_19 = utf8.len(var_436_17)
				local var_436_20 = var_436_18 <= 0 and var_436_14 or var_436_14 * (var_436_19 / var_436_18)

				if var_436_20 > 0 and var_436_14 < var_436_20 then
					arg_433_1.talkMaxDuration = var_436_20

					if var_436_20 + var_436_13 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_20 + var_436_13
					end
				end

				arg_433_1.text_.text = var_436_17
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)
				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_21 = math.max(var_436_14, arg_433_1.talkMaxDuration)

			if var_436_13 <= arg_433_1.time_ and arg_433_1.time_ < var_436_13 + var_436_21 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_13) / var_436_21

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_13 + var_436_21 and arg_433_1.time_ < var_436_13 + var_436_21 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	Play910109110 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 910109110
		arg_437_1.duration_ = 5

		SetActive(arg_437_1.tipsGo_, false)

		function arg_437_1.onSingleLineFinish_()
			arg_437_1.onSingleLineUpdate_ = nil
			arg_437_1.onSingleLineFinish_ = nil
			arg_437_1.state_ = "waiting"
		end

		function arg_437_1.playNext_(arg_439_0)
			if arg_439_0 == 1 then
				arg_437_0:Play910109111(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = arg_437_1.actors_["1070"]
			local var_440_1 = 0

			if var_440_1 < arg_437_1.time_ and arg_437_1.time_ <= var_440_1 + arg_440_0 and arg_437_1.var_.actorSpriteComps1070 == nil then
				arg_437_1.var_.actorSpriteComps1070 = var_440_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_440_2 = 0.0166666666666667

			if var_440_1 <= arg_437_1.time_ and arg_437_1.time_ < var_440_1 + var_440_2 then
				local var_440_3 = (arg_437_1.time_ - var_440_1) / var_440_2

				if arg_437_1.var_.actorSpriteComps1070 then
					for iter_440_0, iter_440_1 in pairs(arg_437_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_440_1 then
							local var_440_4 = Mathf.Lerp(iter_440_1.color.r, 0.5, var_440_3)

							iter_440_1.color = Color.New(var_440_4, var_440_4, var_440_4)
						end
					end
				end
			end

			if arg_437_1.time_ >= var_440_1 + var_440_2 and arg_437_1.time_ < var_440_1 + var_440_2 + arg_440_0 and arg_437_1.var_.actorSpriteComps1070 then
				local var_440_5 = 0.5

				for iter_440_2, iter_440_3 in pairs(arg_437_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_440_3 then
						iter_440_3.color = Color.New(var_440_5, var_440_5, var_440_5)
					end
				end

				arg_437_1.var_.actorSpriteComps1070 = nil
			end

			local var_440_6 = 0
			local var_440_7 = 0.475

			if var_440_6 < arg_437_1.time_ and arg_437_1.time_ <= var_440_6 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, true)

				local var_440_8 = arg_437_1:FormatText(StoryNameCfg[7].name)

				arg_437_1.leftNameTxt_.text = var_440_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_437_1.leftNameTxt_.transform)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1.leftNameTxt_.text)
				SetActive(arg_437_1.iconTrs_.gameObject, false)
				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_9 = arg_437_1:GetWordFromCfg(910109110)
				local var_440_10 = arg_437_1:FormatText(var_440_9.content)

				arg_437_1.text_.text = var_440_10

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_11 = 19
				local var_440_12 = utf8.len(var_440_10)
				local var_440_13 = var_440_11 <= 0 and var_440_7 or var_440_7 * (var_440_12 / var_440_11)

				if var_440_13 > 0 and var_440_7 < var_440_13 then
					arg_437_1.talkMaxDuration = var_440_13

					if var_440_13 + var_440_6 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_13 + var_440_6
					end
				end

				arg_437_1.text_.text = var_440_10
				arg_437_1.typewritter.percent = 0

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(false)
				arg_437_1:RecordContent(arg_437_1.text_.text)
			end

			local var_440_14 = math.max(var_440_7, arg_437_1.talkMaxDuration)

			if var_440_6 <= arg_437_1.time_ and arg_437_1.time_ < var_440_6 + var_440_14 then
				arg_437_1.typewritter.percent = (arg_437_1.time_ - var_440_6) / var_440_14

				arg_437_1.typewritter:SetDirty()
			end

			if arg_437_1.time_ >= var_440_6 + var_440_14 and arg_437_1.time_ < var_440_6 + var_440_14 + arg_440_0 then
				arg_437_1.typewritter.percent = 1

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(true)
			end
		end
	end,
	Play910109111 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 910109111
		arg_441_1.duration_ = 5

		SetActive(arg_441_1.tipsGo_, false)

		function arg_441_1.onSingleLineFinish_()
			arg_441_1.onSingleLineUpdate_ = nil
			arg_441_1.onSingleLineFinish_ = nil
			arg_441_1.state_ = "waiting"
		end

		function arg_441_1.playNext_(arg_443_0)
			if arg_443_0 == 1 then
				arg_441_0:Play910109112(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = arg_441_1.actors_["1070"].transform
			local var_444_1 = 0

			if var_444_1 < arg_441_1.time_ and arg_441_1.time_ <= var_444_1 + arg_444_0 then
				arg_441_1.var_.moveOldPos1070 = var_444_0.localPosition
				var_444_0.localScale = Vector3.New(1, 1, 1)

				arg_441_1:CheckSpriteTmpPos("1070", 3)

				local var_444_2 = var_444_0.childCount

				for iter_444_0 = 0, var_444_2 - 1 do
					local var_444_3 = var_444_0:GetChild(iter_444_0)

					if var_444_3.name == "split_1" or not string.find(var_444_3.name, "split") then
						var_444_3.gameObject:SetActive(true)
					else
						var_444_3.gameObject:SetActive(false)
					end
				end
			end

			local var_444_4 = 0.001

			if var_444_1 <= arg_441_1.time_ and arg_441_1.time_ < var_444_1 + var_444_4 then
				local var_444_5 = (arg_441_1.time_ - var_444_1) / var_444_4
				local var_444_6 = Vector3.New(0, -350, -180)

				var_444_0.localPosition = Vector3.Lerp(arg_441_1.var_.moveOldPos1070, var_444_6, var_444_5)
			end

			if arg_441_1.time_ >= var_444_1 + var_444_4 and arg_441_1.time_ < var_444_1 + var_444_4 + arg_444_0 then
				var_444_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_444_7 = arg_441_1.actors_["1070"]
			local var_444_8 = 0

			if var_444_8 < arg_441_1.time_ and arg_441_1.time_ <= var_444_8 + arg_444_0 and arg_441_1.var_.actorSpriteComps1070 == nil then
				arg_441_1.var_.actorSpriteComps1070 = var_444_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_444_9 = 0.0166666666666667

			if var_444_8 <= arg_441_1.time_ and arg_441_1.time_ < var_444_8 + var_444_9 then
				local var_444_10 = (arg_441_1.time_ - var_444_8) / var_444_9

				if arg_441_1.var_.actorSpriteComps1070 then
					for iter_444_1, iter_444_2 in pairs(arg_441_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_444_2 then
							local var_444_11 = Mathf.Lerp(iter_444_2.color.r, 1, var_444_10)

							iter_444_2.color = Color.New(var_444_11, var_444_11, var_444_11)
						end
					end
				end
			end

			if arg_441_1.time_ >= var_444_8 + var_444_9 and arg_441_1.time_ < var_444_8 + var_444_9 + arg_444_0 and arg_441_1.var_.actorSpriteComps1070 then
				local var_444_12 = 1

				for iter_444_3, iter_444_4 in pairs(arg_441_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_444_4 then
						iter_444_4.color = Color.New(var_444_12, var_444_12, var_444_12)
					end
				end

				arg_441_1.var_.actorSpriteComps1070 = nil
			end

			local var_444_13 = 0
			local var_444_14 = 1.075

			if var_444_13 < arg_441_1.time_ and arg_441_1.time_ <= var_444_13 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0
				arg_441_1.dialogCg_.alpha = 1

				arg_441_1.dialog_:SetActive(true)
				SetActive(arg_441_1.leftNameGo_, true)

				local var_444_15 = arg_441_1:FormatText(StoryNameCfg[318].name)

				arg_441_1.leftNameTxt_.text = var_444_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_441_1.leftNameTxt_.transform)

				arg_441_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_441_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_441_1:RecordName(arg_441_1.leftNameTxt_.text)
				SetActive(arg_441_1.iconTrs_.gameObject, false)
				arg_441_1.callingController_:SetSelectedState("normal")

				local var_444_16 = arg_441_1:GetWordFromCfg(910109111)
				local var_444_17 = arg_441_1:FormatText(var_444_16.content)

				arg_441_1.text_.text = var_444_17

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_18 = 43
				local var_444_19 = utf8.len(var_444_17)
				local var_444_20 = var_444_18 <= 0 and var_444_14 or var_444_14 * (var_444_19 / var_444_18)

				if var_444_20 > 0 and var_444_14 < var_444_20 then
					arg_441_1.talkMaxDuration = var_444_20

					if var_444_20 + var_444_13 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_20 + var_444_13
					end
				end

				arg_441_1.text_.text = var_444_17
				arg_441_1.typewritter.percent = 0

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(false)
				arg_441_1:RecordContent(arg_441_1.text_.text)
			end

			local var_444_21 = math.max(var_444_14, arg_441_1.talkMaxDuration)

			if var_444_13 <= arg_441_1.time_ and arg_441_1.time_ < var_444_13 + var_444_21 then
				arg_441_1.typewritter.percent = (arg_441_1.time_ - var_444_13) / var_444_21

				arg_441_1.typewritter:SetDirty()
			end

			if arg_441_1.time_ >= var_444_13 + var_444_21 and arg_441_1.time_ < var_444_13 + var_444_21 + arg_444_0 then
				arg_441_1.typewritter.percent = 1

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(true)
			end
		end
	end,
	Play910109112 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 910109112
		arg_445_1.duration_ = 5

		SetActive(arg_445_1.tipsGo_, false)

		function arg_445_1.onSingleLineFinish_()
			arg_445_1.onSingleLineUpdate_ = nil
			arg_445_1.onSingleLineFinish_ = nil
			arg_445_1.state_ = "waiting"
		end

		function arg_445_1.playNext_(arg_447_0)
			if arg_447_0 == 1 then
				arg_445_0:Play910109113(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = arg_445_1.actors_["1070"]
			local var_448_1 = 0

			if var_448_1 < arg_445_1.time_ and arg_445_1.time_ <= var_448_1 + arg_448_0 and arg_445_1.var_.actorSpriteComps1070 == nil then
				arg_445_1.var_.actorSpriteComps1070 = var_448_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_448_2 = 0.0166666666666667

			if var_448_1 <= arg_445_1.time_ and arg_445_1.time_ < var_448_1 + var_448_2 then
				local var_448_3 = (arg_445_1.time_ - var_448_1) / var_448_2

				if arg_445_1.var_.actorSpriteComps1070 then
					for iter_448_0, iter_448_1 in pairs(arg_445_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_448_1 then
							local var_448_4 = Mathf.Lerp(iter_448_1.color.r, 0.5, var_448_3)

							iter_448_1.color = Color.New(var_448_4, var_448_4, var_448_4)
						end
					end
				end
			end

			if arg_445_1.time_ >= var_448_1 + var_448_2 and arg_445_1.time_ < var_448_1 + var_448_2 + arg_448_0 and arg_445_1.var_.actorSpriteComps1070 then
				local var_448_5 = 0.5

				for iter_448_2, iter_448_3 in pairs(arg_445_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_448_3 then
						iter_448_3.color = Color.New(var_448_5, var_448_5, var_448_5)
					end
				end

				arg_445_1.var_.actorSpriteComps1070 = nil
			end

			local var_448_6 = 0
			local var_448_7 = 0.475

			if var_448_6 < arg_445_1.time_ and arg_445_1.time_ <= var_448_6 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0
				arg_445_1.dialogCg_.alpha = 1

				arg_445_1.dialog_:SetActive(true)
				SetActive(arg_445_1.leftNameGo_, true)

				local var_448_8 = arg_445_1:FormatText(StoryNameCfg[7].name)

				arg_445_1.leftNameTxt_.text = var_448_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_445_1.leftNameTxt_.transform)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1.leftNameTxt_.text)
				SetActive(arg_445_1.iconTrs_.gameObject, false)
				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_9 = arg_445_1:GetWordFromCfg(910109112)
				local var_448_10 = arg_445_1:FormatText(var_448_9.content)

				arg_445_1.text_.text = var_448_10

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_11 = 19
				local var_448_12 = utf8.len(var_448_10)
				local var_448_13 = var_448_11 <= 0 and var_448_7 or var_448_7 * (var_448_12 / var_448_11)

				if var_448_13 > 0 and var_448_7 < var_448_13 then
					arg_445_1.talkMaxDuration = var_448_13

					if var_448_13 + var_448_6 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_13 + var_448_6
					end
				end

				arg_445_1.text_.text = var_448_10
				arg_445_1.typewritter.percent = 0

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(false)
				arg_445_1:RecordContent(arg_445_1.text_.text)
			end

			local var_448_14 = math.max(var_448_7, arg_445_1.talkMaxDuration)

			if var_448_6 <= arg_445_1.time_ and arg_445_1.time_ < var_448_6 + var_448_14 then
				arg_445_1.typewritter.percent = (arg_445_1.time_ - var_448_6) / var_448_14

				arg_445_1.typewritter:SetDirty()
			end

			if arg_445_1.time_ >= var_448_6 + var_448_14 and arg_445_1.time_ < var_448_6 + var_448_14 + arg_448_0 then
				arg_445_1.typewritter.percent = 1

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(true)
			end
		end
	end,
	Play910109113 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 910109113
		arg_449_1.duration_ = 5

		SetActive(arg_449_1.tipsGo_, false)

		function arg_449_1.onSingleLineFinish_()
			arg_449_1.onSingleLineUpdate_ = nil
			arg_449_1.onSingleLineFinish_ = nil
			arg_449_1.state_ = "waiting"
		end

		function arg_449_1.playNext_(arg_451_0)
			if arg_451_0 == 1 then
				arg_449_0:Play910109114(arg_449_1)
			end
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = 0
			local var_452_1 = 0.45

			if var_452_0 < arg_449_1.time_ and arg_449_1.time_ <= var_452_0 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, true)

				local var_452_2 = arg_449_1:FormatText(StoryNameCfg[7].name)

				arg_449_1.leftNameTxt_.text = var_452_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_449_1.leftNameTxt_.transform)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1.leftNameTxt_.text)
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_3 = arg_449_1:GetWordFromCfg(910109113)
				local var_452_4 = arg_449_1:FormatText(var_452_3.content)

				arg_449_1.text_.text = var_452_4

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_5 = 18
				local var_452_6 = utf8.len(var_452_4)
				local var_452_7 = var_452_5 <= 0 and var_452_1 or var_452_1 * (var_452_6 / var_452_5)

				if var_452_7 > 0 and var_452_1 < var_452_7 then
					arg_449_1.talkMaxDuration = var_452_7

					if var_452_7 + var_452_0 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_7 + var_452_0
					end
				end

				arg_449_1.text_.text = var_452_4
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)
				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_8 = math.max(var_452_1, arg_449_1.talkMaxDuration)

			if var_452_0 <= arg_449_1.time_ and arg_449_1.time_ < var_452_0 + var_452_8 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_0) / var_452_8

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_0 + var_452_8 and arg_449_1.time_ < var_452_0 + var_452_8 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play910109114 = function(arg_453_0, arg_453_1)
		arg_453_1.time_ = 0
		arg_453_1.frameCnt_ = 0
		arg_453_1.state_ = "playing"
		arg_453_1.curTalkId_ = 910109114
		arg_453_1.duration_ = 5

		SetActive(arg_453_1.tipsGo_, false)

		function arg_453_1.onSingleLineFinish_()
			arg_453_1.onSingleLineUpdate_ = nil
			arg_453_1.onSingleLineFinish_ = nil
			arg_453_1.state_ = "waiting"
		end

		function arg_453_1.playNext_(arg_455_0)
			if arg_455_0 == 1 then
				arg_453_0:Play910109115(arg_453_1)
			end
		end

		function arg_453_1.onSingleLineUpdate_(arg_456_0)
			local var_456_0 = arg_453_1.actors_["1070"].transform
			local var_456_1 = 0

			if var_456_1 < arg_453_1.time_ and arg_453_1.time_ <= var_456_1 + arg_456_0 then
				arg_453_1.var_.moveOldPos1070 = var_456_0.localPosition
				var_456_0.localScale = Vector3.New(1, 1, 1)

				arg_453_1:CheckSpriteTmpPos("1070", 3)

				local var_456_2 = var_456_0.childCount

				for iter_456_0 = 0, var_456_2 - 1 do
					local var_456_3 = var_456_0:GetChild(iter_456_0)

					if var_456_3.name == "split_9" or not string.find(var_456_3.name, "split") then
						var_456_3.gameObject:SetActive(true)
					else
						var_456_3.gameObject:SetActive(false)
					end
				end
			end

			local var_456_4 = 0.001

			if var_456_1 <= arg_453_1.time_ and arg_453_1.time_ < var_456_1 + var_456_4 then
				local var_456_5 = (arg_453_1.time_ - var_456_1) / var_456_4
				local var_456_6 = Vector3.New(0, -350, -180)

				var_456_0.localPosition = Vector3.Lerp(arg_453_1.var_.moveOldPos1070, var_456_6, var_456_5)
			end

			if arg_453_1.time_ >= var_456_1 + var_456_4 and arg_453_1.time_ < var_456_1 + var_456_4 + arg_456_0 then
				var_456_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_456_7 = arg_453_1.actors_["1070"]
			local var_456_8 = 0

			if var_456_8 < arg_453_1.time_ and arg_453_1.time_ <= var_456_8 + arg_456_0 and arg_453_1.var_.actorSpriteComps1070 == nil then
				arg_453_1.var_.actorSpriteComps1070 = var_456_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_456_9 = 0.0166666666666667

			if var_456_8 <= arg_453_1.time_ and arg_453_1.time_ < var_456_8 + var_456_9 then
				local var_456_10 = (arg_453_1.time_ - var_456_8) / var_456_9

				if arg_453_1.var_.actorSpriteComps1070 then
					for iter_456_1, iter_456_2 in pairs(arg_453_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_456_2 then
							local var_456_11 = Mathf.Lerp(iter_456_2.color.r, 1, var_456_10)

							iter_456_2.color = Color.New(var_456_11, var_456_11, var_456_11)
						end
					end
				end
			end

			if arg_453_1.time_ >= var_456_8 + var_456_9 and arg_453_1.time_ < var_456_8 + var_456_9 + arg_456_0 and arg_453_1.var_.actorSpriteComps1070 then
				local var_456_12 = 1

				for iter_456_3, iter_456_4 in pairs(arg_453_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_456_4 then
						iter_456_4.color = Color.New(var_456_12, var_456_12, var_456_12)
					end
				end

				arg_453_1.var_.actorSpriteComps1070 = nil
			end

			local var_456_13 = 0
			local var_456_14 = 1.175

			if var_456_13 < arg_453_1.time_ and arg_453_1.time_ <= var_456_13 + arg_456_0 then
				arg_453_1.talkMaxDuration = 0
				arg_453_1.dialogCg_.alpha = 1

				arg_453_1.dialog_:SetActive(true)
				SetActive(arg_453_1.leftNameGo_, true)

				local var_456_15 = arg_453_1:FormatText(StoryNameCfg[318].name)

				arg_453_1.leftNameTxt_.text = var_456_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_453_1.leftNameTxt_.transform)

				arg_453_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_453_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_453_1:RecordName(arg_453_1.leftNameTxt_.text)
				SetActive(arg_453_1.iconTrs_.gameObject, false)
				arg_453_1.callingController_:SetSelectedState("normal")

				local var_456_16 = arg_453_1:GetWordFromCfg(910109114)
				local var_456_17 = arg_453_1:FormatText(var_456_16.content)

				arg_453_1.text_.text = var_456_17

				LuaForUtil.ClearLinePrefixSymbol(arg_453_1.text_)

				local var_456_18 = 47
				local var_456_19 = utf8.len(var_456_17)
				local var_456_20 = var_456_18 <= 0 and var_456_14 or var_456_14 * (var_456_19 / var_456_18)

				if var_456_20 > 0 and var_456_14 < var_456_20 then
					arg_453_1.talkMaxDuration = var_456_20

					if var_456_20 + var_456_13 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_20 + var_456_13
					end
				end

				arg_453_1.text_.text = var_456_17
				arg_453_1.typewritter.percent = 0

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(false)
				arg_453_1:RecordContent(arg_453_1.text_.text)
			end

			local var_456_21 = math.max(var_456_14, arg_453_1.talkMaxDuration)

			if var_456_13 <= arg_453_1.time_ and arg_453_1.time_ < var_456_13 + var_456_21 then
				arg_453_1.typewritter.percent = (arg_453_1.time_ - var_456_13) / var_456_21

				arg_453_1.typewritter:SetDirty()
			end

			if arg_453_1.time_ >= var_456_13 + var_456_21 and arg_453_1.time_ < var_456_13 + var_456_21 + arg_456_0 then
				arg_453_1.typewritter.percent = 1

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(true)
			end
		end
	end,
	Play910109115 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 910109115
		arg_457_1.duration_ = 5

		SetActive(arg_457_1.tipsGo_, false)

		function arg_457_1.onSingleLineFinish_()
			arg_457_1.onSingleLineUpdate_ = nil
			arg_457_1.onSingleLineFinish_ = nil
			arg_457_1.state_ = "waiting"
		end

		function arg_457_1.playNext_(arg_459_0)
			if arg_459_0 == 1 then
				arg_457_0:Play910109116(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = arg_457_1.actors_["1070"].transform
			local var_460_1 = 0

			if var_460_1 < arg_457_1.time_ and arg_457_1.time_ <= var_460_1 + arg_460_0 then
				arg_457_1.var_.moveOldPos1070 = var_460_0.localPosition
				var_460_0.localScale = Vector3.New(1, 1, 1)

				arg_457_1:CheckSpriteTmpPos("1070", 3)

				local var_460_2 = var_460_0.childCount

				for iter_460_0 = 0, var_460_2 - 1 do
					local var_460_3 = var_460_0:GetChild(iter_460_0)

					if var_460_3.name == "split_6" or not string.find(var_460_3.name, "split") then
						var_460_3.gameObject:SetActive(true)
					else
						var_460_3.gameObject:SetActive(false)
					end
				end
			end

			local var_460_4 = 0.001

			if var_460_1 <= arg_457_1.time_ and arg_457_1.time_ < var_460_1 + var_460_4 then
				local var_460_5 = (arg_457_1.time_ - var_460_1) / var_460_4
				local var_460_6 = Vector3.New(0, -350, -180)

				var_460_0.localPosition = Vector3.Lerp(arg_457_1.var_.moveOldPos1070, var_460_6, var_460_5)
			end

			if arg_457_1.time_ >= var_460_1 + var_460_4 and arg_457_1.time_ < var_460_1 + var_460_4 + arg_460_0 then
				var_460_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_460_7 = arg_457_1.actors_["1070"]
			local var_460_8 = 0

			if var_460_8 < arg_457_1.time_ and arg_457_1.time_ <= var_460_8 + arg_460_0 and arg_457_1.var_.actorSpriteComps1070 == nil then
				arg_457_1.var_.actorSpriteComps1070 = var_460_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_460_9 = 0.0166666666666667

			if var_460_8 <= arg_457_1.time_ and arg_457_1.time_ < var_460_8 + var_460_9 then
				local var_460_10 = (arg_457_1.time_ - var_460_8) / var_460_9

				if arg_457_1.var_.actorSpriteComps1070 then
					for iter_460_1, iter_460_2 in pairs(arg_457_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_460_2 then
							local var_460_11 = Mathf.Lerp(iter_460_2.color.r, 1, var_460_10)

							iter_460_2.color = Color.New(var_460_11, var_460_11, var_460_11)
						end
					end
				end
			end

			if arg_457_1.time_ >= var_460_8 + var_460_9 and arg_457_1.time_ < var_460_8 + var_460_9 + arg_460_0 and arg_457_1.var_.actorSpriteComps1070 then
				local var_460_12 = 1

				for iter_460_3, iter_460_4 in pairs(arg_457_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_460_4 then
						iter_460_4.color = Color.New(var_460_12, var_460_12, var_460_12)
					end
				end

				arg_457_1.var_.actorSpriteComps1070 = nil
			end

			local var_460_13 = 0
			local var_460_14 = 1.2

			if var_460_13 < arg_457_1.time_ and arg_457_1.time_ <= var_460_13 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, true)

				local var_460_15 = arg_457_1:FormatText(StoryNameCfg[318].name)

				arg_457_1.leftNameTxt_.text = var_460_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_457_1.leftNameTxt_.transform)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1.leftNameTxt_.text)
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_16 = arg_457_1:GetWordFromCfg(910109115)
				local var_460_17 = arg_457_1:FormatText(var_460_16.content)

				arg_457_1.text_.text = var_460_17

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_18 = 48
				local var_460_19 = utf8.len(var_460_17)
				local var_460_20 = var_460_18 <= 0 and var_460_14 or var_460_14 * (var_460_19 / var_460_18)

				if var_460_20 > 0 and var_460_14 < var_460_20 then
					arg_457_1.talkMaxDuration = var_460_20

					if var_460_20 + var_460_13 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_20 + var_460_13
					end
				end

				arg_457_1.text_.text = var_460_17
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)
				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_21 = math.max(var_460_14, arg_457_1.talkMaxDuration)

			if var_460_13 <= arg_457_1.time_ and arg_457_1.time_ < var_460_13 + var_460_21 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_13) / var_460_21

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_13 + var_460_21 and arg_457_1.time_ < var_460_13 + var_460_21 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play910109116 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 910109116
		arg_461_1.duration_ = 5

		SetActive(arg_461_1.tipsGo_, false)

		function arg_461_1.onSingleLineFinish_()
			arg_461_1.onSingleLineUpdate_ = nil
			arg_461_1.onSingleLineFinish_ = nil
			arg_461_1.state_ = "waiting"
		end

		function arg_461_1.playNext_(arg_463_0)
			if arg_463_0 == 1 then
				arg_461_0:Play910109117(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = arg_461_1.actors_["1070"]
			local var_464_1 = 0

			if var_464_1 < arg_461_1.time_ and arg_461_1.time_ <= var_464_1 + arg_464_0 and arg_461_1.var_.actorSpriteComps1070 == nil then
				arg_461_1.var_.actorSpriteComps1070 = var_464_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_464_2 = 0.0166666666666667

			if var_464_1 <= arg_461_1.time_ and arg_461_1.time_ < var_464_1 + var_464_2 then
				local var_464_3 = (arg_461_1.time_ - var_464_1) / var_464_2

				if arg_461_1.var_.actorSpriteComps1070 then
					for iter_464_0, iter_464_1 in pairs(arg_461_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_464_1 then
							local var_464_4 = Mathf.Lerp(iter_464_1.color.r, 0.5, var_464_3)

							iter_464_1.color = Color.New(var_464_4, var_464_4, var_464_4)
						end
					end
				end
			end

			if arg_461_1.time_ >= var_464_1 + var_464_2 and arg_461_1.time_ < var_464_1 + var_464_2 + arg_464_0 and arg_461_1.var_.actorSpriteComps1070 then
				local var_464_5 = 0.5

				for iter_464_2, iter_464_3 in pairs(arg_461_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_464_3 then
						iter_464_3.color = Color.New(var_464_5, var_464_5, var_464_5)
					end
				end

				arg_461_1.var_.actorSpriteComps1070 = nil
			end

			local var_464_6 = 0
			local var_464_7 = 0.15

			if var_464_6 < arg_461_1.time_ and arg_461_1.time_ <= var_464_6 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, true)

				local var_464_8 = arg_461_1:FormatText(StoryNameCfg[7].name)

				arg_461_1.leftNameTxt_.text = var_464_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_461_1.leftNameTxt_.transform)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1.leftNameTxt_.text)
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_9 = arg_461_1:GetWordFromCfg(910109116)
				local var_464_10 = arg_461_1:FormatText(var_464_9.content)

				arg_461_1.text_.text = var_464_10

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_11 = 6
				local var_464_12 = utf8.len(var_464_10)
				local var_464_13 = var_464_11 <= 0 and var_464_7 or var_464_7 * (var_464_12 / var_464_11)

				if var_464_13 > 0 and var_464_7 < var_464_13 then
					arg_461_1.talkMaxDuration = var_464_13

					if var_464_13 + var_464_6 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_13 + var_464_6
					end
				end

				arg_461_1.text_.text = var_464_10
				arg_461_1.typewritter.percent = 0

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(false)
				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_14 = math.max(var_464_7, arg_461_1.talkMaxDuration)

			if var_464_6 <= arg_461_1.time_ and arg_461_1.time_ < var_464_6 + var_464_14 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_6) / var_464_14

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_6 + var_464_14 and arg_461_1.time_ < var_464_6 + var_464_14 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play910109117 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 910109117
		arg_465_1.duration_ = 5

		SetActive(arg_465_1.tipsGo_, false)

		function arg_465_1.onSingleLineFinish_()
			arg_465_1.onSingleLineUpdate_ = nil
			arg_465_1.onSingleLineFinish_ = nil
			arg_465_1.state_ = "waiting"
		end

		function arg_465_1.playNext_(arg_467_0)
			if arg_467_0 == 1 then
				arg_465_0:Play910109118(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = 0
			local var_468_1 = 0.3

			if var_468_0 < arg_465_1.time_ and arg_465_1.time_ <= var_468_0 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0
				arg_465_1.dialogCg_.alpha = 1

				arg_465_1.dialog_:SetActive(true)
				SetActive(arg_465_1.leftNameGo_, true)

				local var_468_2 = arg_465_1:FormatText(StoryNameCfg[7].name)

				arg_465_1.leftNameTxt_.text = var_468_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_465_1.leftNameTxt_.transform)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1.leftNameTxt_.text)
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_3 = arg_465_1:GetWordFromCfg(910109117)
				local var_468_4 = arg_465_1:FormatText(var_468_3.content)

				arg_465_1.text_.text = var_468_4

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_5 = 12
				local var_468_6 = utf8.len(var_468_4)
				local var_468_7 = var_468_5 <= 0 and var_468_1 or var_468_1 * (var_468_6 / var_468_5)

				if var_468_7 > 0 and var_468_1 < var_468_7 then
					arg_465_1.talkMaxDuration = var_468_7

					if var_468_7 + var_468_0 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_7 + var_468_0
					end
				end

				arg_465_1.text_.text = var_468_4
				arg_465_1.typewritter.percent = 0

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(false)
				arg_465_1:RecordContent(arg_465_1.text_.text)
			end

			local var_468_8 = math.max(var_468_1, arg_465_1.talkMaxDuration)

			if var_468_0 <= arg_465_1.time_ and arg_465_1.time_ < var_468_0 + var_468_8 then
				arg_465_1.typewritter.percent = (arg_465_1.time_ - var_468_0) / var_468_8

				arg_465_1.typewritter:SetDirty()
			end

			if arg_465_1.time_ >= var_468_0 + var_468_8 and arg_465_1.time_ < var_468_0 + var_468_8 + arg_468_0 then
				arg_465_1.typewritter.percent = 1

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(true)
			end
		end
	end,
	Play910109118 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 910109118
		arg_469_1.duration_ = 5

		SetActive(arg_469_1.tipsGo_, false)

		function arg_469_1.onSingleLineFinish_()
			arg_469_1.onSingleLineUpdate_ = nil
			arg_469_1.onSingleLineFinish_ = nil
			arg_469_1.state_ = "waiting"
		end

		function arg_469_1.playNext_(arg_471_0)
			if arg_471_0 == 1 then
				arg_469_0:Play910109119(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = arg_469_1.actors_["1070"]
			local var_472_1 = 0

			if var_472_1 < arg_469_1.time_ and arg_469_1.time_ <= var_472_1 + arg_472_0 and arg_469_1.var_.actorSpriteComps1070 == nil then
				arg_469_1.var_.actorSpriteComps1070 = var_472_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_472_2 = 0.0166666666666667

			if var_472_1 <= arg_469_1.time_ and arg_469_1.time_ < var_472_1 + var_472_2 then
				local var_472_3 = (arg_469_1.time_ - var_472_1) / var_472_2

				if arg_469_1.var_.actorSpriteComps1070 then
					for iter_472_0, iter_472_1 in pairs(arg_469_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_472_1 then
							local var_472_4 = Mathf.Lerp(iter_472_1.color.r, 1, var_472_3)

							iter_472_1.color = Color.New(var_472_4, var_472_4, var_472_4)
						end
					end
				end
			end

			if arg_469_1.time_ >= var_472_1 + var_472_2 and arg_469_1.time_ < var_472_1 + var_472_2 + arg_472_0 and arg_469_1.var_.actorSpriteComps1070 then
				local var_472_5 = 1

				for iter_472_2, iter_472_3 in pairs(arg_469_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_472_3 then
						iter_472_3.color = Color.New(var_472_5, var_472_5, var_472_5)
					end
				end

				arg_469_1.var_.actorSpriteComps1070 = nil
			end

			local var_472_6 = 0
			local var_472_7 = 0.475

			if var_472_6 < arg_469_1.time_ and arg_469_1.time_ <= var_472_6 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, true)

				local var_472_8 = arg_469_1:FormatText(StoryNameCfg[318].name)

				arg_469_1.leftNameTxt_.text = var_472_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_469_1.leftNameTxt_.transform)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1.leftNameTxt_.text)
				SetActive(arg_469_1.iconTrs_.gameObject, false)
				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_9 = arg_469_1:GetWordFromCfg(910109118)
				local var_472_10 = arg_469_1:FormatText(var_472_9.content)

				arg_469_1.text_.text = var_472_10

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_11 = 19
				local var_472_12 = utf8.len(var_472_10)
				local var_472_13 = var_472_11 <= 0 and var_472_7 or var_472_7 * (var_472_12 / var_472_11)

				if var_472_13 > 0 and var_472_7 < var_472_13 then
					arg_469_1.talkMaxDuration = var_472_13

					if var_472_13 + var_472_6 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_13 + var_472_6
					end
				end

				arg_469_1.text_.text = var_472_10
				arg_469_1.typewritter.percent = 0

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(false)
				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_14 = math.max(var_472_7, arg_469_1.talkMaxDuration)

			if var_472_6 <= arg_469_1.time_ and arg_469_1.time_ < var_472_6 + var_472_14 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_6) / var_472_14

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_6 + var_472_14 and arg_469_1.time_ < var_472_6 + var_472_14 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	Play910109119 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 910109119
		arg_473_1.duration_ = 5

		SetActive(arg_473_1.tipsGo_, false)

		function arg_473_1.onSingleLineFinish_()
			arg_473_1.onSingleLineUpdate_ = nil
			arg_473_1.onSingleLineFinish_ = nil
			arg_473_1.state_ = "waiting"
		end

		function arg_473_1.playNext_(arg_475_0)
			if arg_475_0 == 1 then
				arg_473_0:Play910109120(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = 0
			local var_476_1 = 0.05

			if var_476_0 < arg_473_1.time_ and arg_473_1.time_ <= var_476_0 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0
				arg_473_1.dialogCg_.alpha = 1

				arg_473_1.dialog_:SetActive(true)
				SetActive(arg_473_1.leftNameGo_, true)

				local var_476_2 = arg_473_1:FormatText(StoryNameCfg[318].name)

				arg_473_1.leftNameTxt_.text = var_476_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_473_1.leftNameTxt_.transform)

				arg_473_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_473_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_473_1:RecordName(arg_473_1.leftNameTxt_.text)
				SetActive(arg_473_1.iconTrs_.gameObject, false)
				arg_473_1.callingController_:SetSelectedState("normal")

				local var_476_3 = arg_473_1:GetWordFromCfg(910109119)
				local var_476_4 = arg_473_1:FormatText(var_476_3.content)

				arg_473_1.text_.text = var_476_4

				LuaForUtil.ClearLinePrefixSymbol(arg_473_1.text_)

				local var_476_5 = 2
				local var_476_6 = utf8.len(var_476_4)
				local var_476_7 = var_476_5 <= 0 and var_476_1 or var_476_1 * (var_476_6 / var_476_5)

				if var_476_7 > 0 and var_476_1 < var_476_7 then
					arg_473_1.talkMaxDuration = var_476_7

					if var_476_7 + var_476_0 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_7 + var_476_0
					end
				end

				arg_473_1.text_.text = var_476_4
				arg_473_1.typewritter.percent = 0

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(false)
				arg_473_1:RecordContent(arg_473_1.text_.text)
			end

			local var_476_8 = math.max(var_476_1, arg_473_1.talkMaxDuration)

			if var_476_0 <= arg_473_1.time_ and arg_473_1.time_ < var_476_0 + var_476_8 then
				arg_473_1.typewritter.percent = (arg_473_1.time_ - var_476_0) / var_476_8

				arg_473_1.typewritter:SetDirty()
			end

			if arg_473_1.time_ >= var_476_0 + var_476_8 and arg_473_1.time_ < var_476_0 + var_476_8 + arg_476_0 then
				arg_473_1.typewritter.percent = 1

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(true)
			end
		end
	end,
	Play910109120 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 910109120
		arg_477_1.duration_ = 5

		SetActive(arg_477_1.tipsGo_, false)

		function arg_477_1.onSingleLineFinish_()
			arg_477_1.onSingleLineUpdate_ = nil
			arg_477_1.onSingleLineFinish_ = nil
			arg_477_1.state_ = "waiting"
		end

		function arg_477_1.playNext_(arg_479_0)
			if arg_479_0 == 1 then
				arg_477_0:Play910109121(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = arg_477_1.actors_["1070"].transform
			local var_480_1 = 0

			if var_480_1 < arg_477_1.time_ and arg_477_1.time_ <= var_480_1 + arg_480_0 then
				arg_477_1.var_.moveOldPos1070 = var_480_0.localPosition
				var_480_0.localScale = Vector3.New(1, 1, 1)

				arg_477_1:CheckSpriteTmpPos("1070", 7)

				local var_480_2 = var_480_0.childCount

				for iter_480_0 = 0, var_480_2 - 1 do
					local var_480_3 = var_480_0:GetChild(iter_480_0)

					if var_480_3.name == "split_6" or not string.find(var_480_3.name, "split") then
						var_480_3.gameObject:SetActive(true)
					else
						var_480_3.gameObject:SetActive(false)
					end
				end
			end

			local var_480_4 = 0.001

			if var_480_1 <= arg_477_1.time_ and arg_477_1.time_ < var_480_1 + var_480_4 then
				local var_480_5 = (arg_477_1.time_ - var_480_1) / var_480_4
				local var_480_6 = Vector3.New(0, -2000, -180)

				var_480_0.localPosition = Vector3.Lerp(arg_477_1.var_.moveOldPos1070, var_480_6, var_480_5)
			end

			if arg_477_1.time_ >= var_480_1 + var_480_4 and arg_477_1.time_ < var_480_1 + var_480_4 + arg_480_0 then
				var_480_0.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_480_7 = 0
			local var_480_8 = 1

			if var_480_7 < arg_477_1.time_ and arg_477_1.time_ <= var_480_7 + arg_480_0 then
				local var_480_9 = "play"
				local var_480_10 = "effect"

				arg_477_1:AudioAction(var_480_9, var_480_10, "se_story_16", "se_story_16_wind02", "")
			end

			local var_480_11 = 0.774999999999
			local var_480_12 = 1

			if var_480_11 < arg_477_1.time_ and arg_477_1.time_ <= var_480_11 + arg_480_0 then
				local var_480_13 = "play"
				local var_480_14 = "effect"

				arg_477_1:AudioAction(var_480_13, var_480_14, "se_story_7", "se_story_7_lift", "")
			end

			local var_480_15 = 0
			local var_480_16 = 1.775

			if var_480_15 < arg_477_1.time_ and arg_477_1.time_ <= var_480_15 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, false)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_17 = arg_477_1:GetWordFromCfg(910109120)
				local var_480_18 = arg_477_1:FormatText(var_480_17.content)

				arg_477_1.text_.text = var_480_18

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_19 = 71
				local var_480_20 = utf8.len(var_480_18)
				local var_480_21 = var_480_19 <= 0 and var_480_16 or var_480_16 * (var_480_20 / var_480_19)

				if var_480_21 > 0 and var_480_16 < var_480_21 then
					arg_477_1.talkMaxDuration = var_480_21

					if var_480_21 + var_480_15 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_21 + var_480_15
					end
				end

				arg_477_1.text_.text = var_480_18
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)
				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_22 = math.max(var_480_16, arg_477_1.talkMaxDuration)

			if var_480_15 <= arg_477_1.time_ and arg_477_1.time_ < var_480_15 + var_480_22 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_15) / var_480_22

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_15 + var_480_22 and arg_477_1.time_ < var_480_15 + var_480_22 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play910109121 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 910109121
		arg_481_1.duration_ = 5

		SetActive(arg_481_1.tipsGo_, false)

		function arg_481_1.onSingleLineFinish_()
			arg_481_1.onSingleLineUpdate_ = nil
			arg_481_1.onSingleLineFinish_ = nil
			arg_481_1.state_ = "waiting"
		end

		function arg_481_1.playNext_(arg_483_0)
			if arg_483_0 == 1 then
				arg_481_0:Play910109122(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = arg_481_1.actors_["1070"]
			local var_484_1 = 0

			if var_484_1 < arg_481_1.time_ and arg_481_1.time_ <= var_484_1 + arg_484_0 and arg_481_1.var_.actorSpriteComps1070 == nil then
				arg_481_1.var_.actorSpriteComps1070 = var_484_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_484_2 = 0.0166666666666667

			if var_484_1 <= arg_481_1.time_ and arg_481_1.time_ < var_484_1 + var_484_2 then
				local var_484_3 = (arg_481_1.time_ - var_484_1) / var_484_2

				if arg_481_1.var_.actorSpriteComps1070 then
					for iter_484_0, iter_484_1 in pairs(arg_481_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_484_1 then
							local var_484_4 = Mathf.Lerp(iter_484_1.color.r, 0.5, var_484_3)

							iter_484_1.color = Color.New(var_484_4, var_484_4, var_484_4)
						end
					end
				end
			end

			if arg_481_1.time_ >= var_484_1 + var_484_2 and arg_481_1.time_ < var_484_1 + var_484_2 + arg_484_0 and arg_481_1.var_.actorSpriteComps1070 then
				local var_484_5 = 0.5

				for iter_484_2, iter_484_3 in pairs(arg_481_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_484_3 then
						iter_484_3.color = Color.New(var_484_5, var_484_5, var_484_5)
					end
				end

				arg_481_1.var_.actorSpriteComps1070 = nil
			end

			local var_484_6 = 0
			local var_484_7 = 0.825

			if var_484_6 < arg_481_1.time_ and arg_481_1.time_ <= var_484_6 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0
				arg_481_1.dialogCg_.alpha = 1

				arg_481_1.dialog_:SetActive(true)
				SetActive(arg_481_1.leftNameGo_, false)

				arg_481_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_481_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_481_1:RecordName(arg_481_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_481_1.iconTrs_.gameObject, false)
				arg_481_1.callingController_:SetSelectedState("normal")

				local var_484_8 = arg_481_1:GetWordFromCfg(910109121)
				local var_484_9 = arg_481_1:FormatText(var_484_8.content)

				arg_481_1.text_.text = var_484_9

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_10 = 33
				local var_484_11 = utf8.len(var_484_9)
				local var_484_12 = var_484_10 <= 0 and var_484_7 or var_484_7 * (var_484_11 / var_484_10)

				if var_484_12 > 0 and var_484_7 < var_484_12 then
					arg_481_1.talkMaxDuration = var_484_12

					if var_484_12 + var_484_6 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_12 + var_484_6
					end
				end

				arg_481_1.text_.text = var_484_9
				arg_481_1.typewritter.percent = 0

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(false)
				arg_481_1:RecordContent(arg_481_1.text_.text)
			end

			local var_484_13 = math.max(var_484_7, arg_481_1.talkMaxDuration)

			if var_484_6 <= arg_481_1.time_ and arg_481_1.time_ < var_484_6 + var_484_13 then
				arg_481_1.typewritter.percent = (arg_481_1.time_ - var_484_6) / var_484_13

				arg_481_1.typewritter:SetDirty()
			end

			if arg_481_1.time_ >= var_484_6 + var_484_13 and arg_481_1.time_ < var_484_6 + var_484_13 + arg_484_0 then
				arg_481_1.typewritter.percent = 1

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(true)
			end
		end
	end,
	Play910109122 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 910109122
		arg_485_1.duration_ = 5

		SetActive(arg_485_1.tipsGo_, false)

		function arg_485_1.onSingleLineFinish_()
			arg_485_1.onSingleLineUpdate_ = nil
			arg_485_1.onSingleLineFinish_ = nil
			arg_485_1.state_ = "waiting"
		end

		function arg_485_1.playNext_(arg_487_0)
			if arg_487_0 == 1 then
				arg_485_0:Play910109123(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = 0
			local var_488_1 = 0.275

			if var_488_0 < arg_485_1.time_ and arg_485_1.time_ <= var_488_0 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0
				arg_485_1.dialogCg_.alpha = 1

				arg_485_1.dialog_:SetActive(true)
				SetActive(arg_485_1.leftNameGo_, true)

				local var_488_2 = arg_485_1:FormatText(StoryNameCfg[7].name)

				arg_485_1.leftNameTxt_.text = var_488_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_485_1.leftNameTxt_.transform)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1.leftNameTxt_.text)
				SetActive(arg_485_1.iconTrs_.gameObject, false)
				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_3 = arg_485_1:GetWordFromCfg(910109122)
				local var_488_4 = arg_485_1:FormatText(var_488_3.content)

				arg_485_1.text_.text = var_488_4

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_5 = 11
				local var_488_6 = utf8.len(var_488_4)
				local var_488_7 = var_488_5 <= 0 and var_488_1 or var_488_1 * (var_488_6 / var_488_5)

				if var_488_7 > 0 and var_488_1 < var_488_7 then
					arg_485_1.talkMaxDuration = var_488_7

					if var_488_7 + var_488_0 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_7 + var_488_0
					end
				end

				arg_485_1.text_.text = var_488_4
				arg_485_1.typewritter.percent = 0

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(false)
				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_8 = math.max(var_488_1, arg_485_1.talkMaxDuration)

			if var_488_0 <= arg_485_1.time_ and arg_485_1.time_ < var_488_0 + var_488_8 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_0) / var_488_8

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_0 + var_488_8 and arg_485_1.time_ < var_488_0 + var_488_8 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play910109123 = function(arg_489_0, arg_489_1)
		arg_489_1.time_ = 0
		arg_489_1.frameCnt_ = 0
		arg_489_1.state_ = "playing"
		arg_489_1.curTalkId_ = 910109123
		arg_489_1.duration_ = 5

		SetActive(arg_489_1.tipsGo_, false)

		function arg_489_1.onSingleLineFinish_()
			arg_489_1.onSingleLineUpdate_ = nil
			arg_489_1.onSingleLineFinish_ = nil
			arg_489_1.state_ = "waiting"
		end

		function arg_489_1.playNext_(arg_491_0)
			if arg_491_0 == 1 then
				arg_489_0:Play910109124(arg_489_1)
			end
		end

		function arg_489_1.onSingleLineUpdate_(arg_492_0)
			local var_492_0 = arg_489_1.actors_["1070"].transform
			local var_492_1 = 0

			if var_492_1 < arg_489_1.time_ and arg_489_1.time_ <= var_492_1 + arg_492_0 then
				arg_489_1.var_.moveOldPos1070 = var_492_0.localPosition
				var_492_0.localScale = Vector3.New(1, 1, 1)

				arg_489_1:CheckSpriteTmpPos("1070", 3)

				local var_492_2 = var_492_0.childCount

				for iter_492_0 = 0, var_492_2 - 1 do
					local var_492_3 = var_492_0:GetChild(iter_492_0)

					if var_492_3.name == "split_8" or not string.find(var_492_3.name, "split") then
						var_492_3.gameObject:SetActive(true)
					else
						var_492_3.gameObject:SetActive(false)
					end
				end
			end

			local var_492_4 = 0.001

			if var_492_1 <= arg_489_1.time_ and arg_489_1.time_ < var_492_1 + var_492_4 then
				local var_492_5 = (arg_489_1.time_ - var_492_1) / var_492_4
				local var_492_6 = Vector3.New(0, -350, -180)

				var_492_0.localPosition = Vector3.Lerp(arg_489_1.var_.moveOldPos1070, var_492_6, var_492_5)
			end

			if arg_489_1.time_ >= var_492_1 + var_492_4 and arg_489_1.time_ < var_492_1 + var_492_4 + arg_492_0 then
				var_492_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_492_7 = arg_489_1.actors_["1070"]
			local var_492_8 = 0

			if var_492_8 < arg_489_1.time_ and arg_489_1.time_ <= var_492_8 + arg_492_0 and arg_489_1.var_.actorSpriteComps1070 == nil then
				arg_489_1.var_.actorSpriteComps1070 = var_492_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_492_9 = 0.0166666666666667

			if var_492_8 <= arg_489_1.time_ and arg_489_1.time_ < var_492_8 + var_492_9 then
				local var_492_10 = (arg_489_1.time_ - var_492_8) / var_492_9

				if arg_489_1.var_.actorSpriteComps1070 then
					for iter_492_1, iter_492_2 in pairs(arg_489_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_492_2 then
							local var_492_11 = Mathf.Lerp(iter_492_2.color.r, 1, var_492_10)

							iter_492_2.color = Color.New(var_492_11, var_492_11, var_492_11)
						end
					end
				end
			end

			if arg_489_1.time_ >= var_492_8 + var_492_9 and arg_489_1.time_ < var_492_8 + var_492_9 + arg_492_0 and arg_489_1.var_.actorSpriteComps1070 then
				local var_492_12 = 1

				for iter_492_3, iter_492_4 in pairs(arg_489_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_492_4 then
						iter_492_4.color = Color.New(var_492_12, var_492_12, var_492_12)
					end
				end

				arg_489_1.var_.actorSpriteComps1070 = nil
			end

			local var_492_13 = 0
			local var_492_14 = 1

			if var_492_13 < arg_489_1.time_ and arg_489_1.time_ <= var_492_13 + arg_492_0 then
				arg_489_1.talkMaxDuration = 0
				arg_489_1.dialogCg_.alpha = 1

				arg_489_1.dialog_:SetActive(true)
				SetActive(arg_489_1.leftNameGo_, true)

				local var_492_15 = arg_489_1:FormatText(StoryNameCfg[318].name)

				arg_489_1.leftNameTxt_.text = var_492_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_489_1.leftNameTxt_.transform)

				arg_489_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_489_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_489_1:RecordName(arg_489_1.leftNameTxt_.text)
				SetActive(arg_489_1.iconTrs_.gameObject, false)
				arg_489_1.callingController_:SetSelectedState("normal")

				local var_492_16 = arg_489_1:GetWordFromCfg(910109123)
				local var_492_17 = arg_489_1:FormatText(var_492_16.content)

				arg_489_1.text_.text = var_492_17

				LuaForUtil.ClearLinePrefixSymbol(arg_489_1.text_)

				local var_492_18 = 40
				local var_492_19 = utf8.len(var_492_17)
				local var_492_20 = var_492_18 <= 0 and var_492_14 or var_492_14 * (var_492_19 / var_492_18)

				if var_492_20 > 0 and var_492_14 < var_492_20 then
					arg_489_1.talkMaxDuration = var_492_20

					if var_492_20 + var_492_13 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_20 + var_492_13
					end
				end

				arg_489_1.text_.text = var_492_17
				arg_489_1.typewritter.percent = 0

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(false)
				arg_489_1:RecordContent(arg_489_1.text_.text)
			end

			local var_492_21 = math.max(var_492_14, arg_489_1.talkMaxDuration)

			if var_492_13 <= arg_489_1.time_ and arg_489_1.time_ < var_492_13 + var_492_21 then
				arg_489_1.typewritter.percent = (arg_489_1.time_ - var_492_13) / var_492_21

				arg_489_1.typewritter:SetDirty()
			end

			if arg_489_1.time_ >= var_492_13 + var_492_21 and arg_489_1.time_ < var_492_13 + var_492_21 + arg_492_0 then
				arg_489_1.typewritter.percent = 1

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(true)
			end
		end
	end,
	Play910109124 = function(arg_493_0, arg_493_1)
		arg_493_1.time_ = 0
		arg_493_1.frameCnt_ = 0
		arg_493_1.state_ = "playing"
		arg_493_1.curTalkId_ = 910109124
		arg_493_1.duration_ = 5

		SetActive(arg_493_1.tipsGo_, false)

		function arg_493_1.onSingleLineFinish_()
			arg_493_1.onSingleLineUpdate_ = nil
			arg_493_1.onSingleLineFinish_ = nil
			arg_493_1.state_ = "waiting"
		end

		function arg_493_1.playNext_(arg_495_0)
			if arg_495_0 == 1 then
				arg_493_0:Play910109125(arg_493_1)
			end
		end

		function arg_493_1.onSingleLineUpdate_(arg_496_0)
			local var_496_0 = arg_493_1.actors_["1070"]
			local var_496_1 = 0

			if var_496_1 < arg_493_1.time_ and arg_493_1.time_ <= var_496_1 + arg_496_0 and arg_493_1.var_.actorSpriteComps1070 == nil then
				arg_493_1.var_.actorSpriteComps1070 = var_496_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_496_2 = 0.0166666666666667

			if var_496_1 <= arg_493_1.time_ and arg_493_1.time_ < var_496_1 + var_496_2 then
				local var_496_3 = (arg_493_1.time_ - var_496_1) / var_496_2

				if arg_493_1.var_.actorSpriteComps1070 then
					for iter_496_0, iter_496_1 in pairs(arg_493_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_496_1 then
							local var_496_4 = Mathf.Lerp(iter_496_1.color.r, 0.5, var_496_3)

							iter_496_1.color = Color.New(var_496_4, var_496_4, var_496_4)
						end
					end
				end
			end

			if arg_493_1.time_ >= var_496_1 + var_496_2 and arg_493_1.time_ < var_496_1 + var_496_2 + arg_496_0 and arg_493_1.var_.actorSpriteComps1070 then
				local var_496_5 = 0.5

				for iter_496_2, iter_496_3 in pairs(arg_493_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_496_3 then
						iter_496_3.color = Color.New(var_496_5, var_496_5, var_496_5)
					end
				end

				arg_493_1.var_.actorSpriteComps1070 = nil
			end

			local var_496_6 = 0
			local var_496_7 = 0.525

			if var_496_6 < arg_493_1.time_ and arg_493_1.time_ <= var_496_6 + arg_496_0 then
				arg_493_1.talkMaxDuration = 0
				arg_493_1.dialogCg_.alpha = 1

				arg_493_1.dialog_:SetActive(true)
				SetActive(arg_493_1.leftNameGo_, true)

				local var_496_8 = arg_493_1:FormatText(StoryNameCfg[7].name)

				arg_493_1.leftNameTxt_.text = var_496_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_493_1.leftNameTxt_.transform)

				arg_493_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_493_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_493_1:RecordName(arg_493_1.leftNameTxt_.text)
				SetActive(arg_493_1.iconTrs_.gameObject, false)
				arg_493_1.callingController_:SetSelectedState("normal")

				local var_496_9 = arg_493_1:GetWordFromCfg(910109124)
				local var_496_10 = arg_493_1:FormatText(var_496_9.content)

				arg_493_1.text_.text = var_496_10

				LuaForUtil.ClearLinePrefixSymbol(arg_493_1.text_)

				local var_496_11 = 21
				local var_496_12 = utf8.len(var_496_10)
				local var_496_13 = var_496_11 <= 0 and var_496_7 or var_496_7 * (var_496_12 / var_496_11)

				if var_496_13 > 0 and var_496_7 < var_496_13 then
					arg_493_1.talkMaxDuration = var_496_13

					if var_496_13 + var_496_6 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_13 + var_496_6
					end
				end

				arg_493_1.text_.text = var_496_10
				arg_493_1.typewritter.percent = 0

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(false)
				arg_493_1:RecordContent(arg_493_1.text_.text)
			end

			local var_496_14 = math.max(var_496_7, arg_493_1.talkMaxDuration)

			if var_496_6 <= arg_493_1.time_ and arg_493_1.time_ < var_496_6 + var_496_14 then
				arg_493_1.typewritter.percent = (arg_493_1.time_ - var_496_6) / var_496_14

				arg_493_1.typewritter:SetDirty()
			end

			if arg_493_1.time_ >= var_496_6 + var_496_14 and arg_493_1.time_ < var_496_6 + var_496_14 + arg_496_0 then
				arg_493_1.typewritter.percent = 1

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(true)
			end
		end
	end,
	Play910109125 = function(arg_497_0, arg_497_1)
		arg_497_1.time_ = 0
		arg_497_1.frameCnt_ = 0
		arg_497_1.state_ = "playing"
		arg_497_1.curTalkId_ = 910109125
		arg_497_1.duration_ = 5

		SetActive(arg_497_1.tipsGo_, false)

		function arg_497_1.onSingleLineFinish_()
			arg_497_1.onSingleLineUpdate_ = nil
			arg_497_1.onSingleLineFinish_ = nil
			arg_497_1.state_ = "waiting"
		end

		function arg_497_1.playNext_(arg_499_0)
			if arg_499_0 == 1 then
				arg_497_0:Play910109126(arg_497_1)
			end
		end

		function arg_497_1.onSingleLineUpdate_(arg_500_0)
			local var_500_0 = arg_497_1.actors_["1070"].transform
			local var_500_1 = 0

			if var_500_1 < arg_497_1.time_ and arg_497_1.time_ <= var_500_1 + arg_500_0 then
				arg_497_1.var_.moveOldPos1070 = var_500_0.localPosition
				var_500_0.localScale = Vector3.New(1, 1, 1)

				arg_497_1:CheckSpriteTmpPos("1070", 3)

				local var_500_2 = var_500_0.childCount

				for iter_500_0 = 0, var_500_2 - 1 do
					local var_500_3 = var_500_0:GetChild(iter_500_0)

					if var_500_3.name == "split_1" or not string.find(var_500_3.name, "split") then
						var_500_3.gameObject:SetActive(true)
					else
						var_500_3.gameObject:SetActive(false)
					end
				end
			end

			local var_500_4 = 0.001

			if var_500_1 <= arg_497_1.time_ and arg_497_1.time_ < var_500_1 + var_500_4 then
				local var_500_5 = (arg_497_1.time_ - var_500_1) / var_500_4
				local var_500_6 = Vector3.New(0, -350, -180)

				var_500_0.localPosition = Vector3.Lerp(arg_497_1.var_.moveOldPos1070, var_500_6, var_500_5)
			end

			if arg_497_1.time_ >= var_500_1 + var_500_4 and arg_497_1.time_ < var_500_1 + var_500_4 + arg_500_0 then
				var_500_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_500_7 = arg_497_1.actors_["1070"]
			local var_500_8 = 0

			if var_500_8 < arg_497_1.time_ and arg_497_1.time_ <= var_500_8 + arg_500_0 and arg_497_1.var_.actorSpriteComps1070 == nil then
				arg_497_1.var_.actorSpriteComps1070 = var_500_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_500_9 = 0.0166666666666667

			if var_500_8 <= arg_497_1.time_ and arg_497_1.time_ < var_500_8 + var_500_9 then
				local var_500_10 = (arg_497_1.time_ - var_500_8) / var_500_9

				if arg_497_1.var_.actorSpriteComps1070 then
					for iter_500_1, iter_500_2 in pairs(arg_497_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_500_2 then
							local var_500_11 = Mathf.Lerp(iter_500_2.color.r, 1, var_500_10)

							iter_500_2.color = Color.New(var_500_11, var_500_11, var_500_11)
						end
					end
				end
			end

			if arg_497_1.time_ >= var_500_8 + var_500_9 and arg_497_1.time_ < var_500_8 + var_500_9 + arg_500_0 and arg_497_1.var_.actorSpriteComps1070 then
				local var_500_12 = 1

				for iter_500_3, iter_500_4 in pairs(arg_497_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_500_4 then
						iter_500_4.color = Color.New(var_500_12, var_500_12, var_500_12)
					end
				end

				arg_497_1.var_.actorSpriteComps1070 = nil
			end

			local var_500_13 = 0
			local var_500_14 = 1.1

			if var_500_13 < arg_497_1.time_ and arg_497_1.time_ <= var_500_13 + arg_500_0 then
				arg_497_1.talkMaxDuration = 0
				arg_497_1.dialogCg_.alpha = 1

				arg_497_1.dialog_:SetActive(true)
				SetActive(arg_497_1.leftNameGo_, true)

				local var_500_15 = arg_497_1:FormatText(StoryNameCfg[318].name)

				arg_497_1.leftNameTxt_.text = var_500_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_497_1.leftNameTxt_.transform)

				arg_497_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_497_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_497_1:RecordName(arg_497_1.leftNameTxt_.text)
				SetActive(arg_497_1.iconTrs_.gameObject, false)
				arg_497_1.callingController_:SetSelectedState("normal")

				local var_500_16 = arg_497_1:GetWordFromCfg(910109125)
				local var_500_17 = arg_497_1:FormatText(var_500_16.content)

				arg_497_1.text_.text = var_500_17

				LuaForUtil.ClearLinePrefixSymbol(arg_497_1.text_)

				local var_500_18 = 44
				local var_500_19 = utf8.len(var_500_17)
				local var_500_20 = var_500_18 <= 0 and var_500_14 or var_500_14 * (var_500_19 / var_500_18)

				if var_500_20 > 0 and var_500_14 < var_500_20 then
					arg_497_1.talkMaxDuration = var_500_20

					if var_500_20 + var_500_13 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_20 + var_500_13
					end
				end

				arg_497_1.text_.text = var_500_17
				arg_497_1.typewritter.percent = 0

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(false)
				arg_497_1:RecordContent(arg_497_1.text_.text)
			end

			local var_500_21 = math.max(var_500_14, arg_497_1.talkMaxDuration)

			if var_500_13 <= arg_497_1.time_ and arg_497_1.time_ < var_500_13 + var_500_21 then
				arg_497_1.typewritter.percent = (arg_497_1.time_ - var_500_13) / var_500_21

				arg_497_1.typewritter:SetDirty()
			end

			if arg_497_1.time_ >= var_500_13 + var_500_21 and arg_497_1.time_ < var_500_13 + var_500_21 + arg_500_0 then
				arg_497_1.typewritter.percent = 1

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(true)
			end
		end
	end,
	Play910109126 = function(arg_501_0, arg_501_1)
		arg_501_1.time_ = 0
		arg_501_1.frameCnt_ = 0
		arg_501_1.state_ = "playing"
		arg_501_1.curTalkId_ = 910109126
		arg_501_1.duration_ = 5

		SetActive(arg_501_1.tipsGo_, false)

		function arg_501_1.onSingleLineFinish_()
			arg_501_1.onSingleLineUpdate_ = nil
			arg_501_1.onSingleLineFinish_ = nil
			arg_501_1.state_ = "waiting"
		end

		function arg_501_1.playNext_(arg_503_0)
			if arg_503_0 == 1 then
				arg_501_0:Play910109127(arg_501_1)
			end
		end

		function arg_501_1.onSingleLineUpdate_(arg_504_0)
			local var_504_0 = arg_501_1.actors_["1070"]
			local var_504_1 = 0

			if var_504_1 < arg_501_1.time_ and arg_501_1.time_ <= var_504_1 + arg_504_0 and arg_501_1.var_.actorSpriteComps1070 == nil then
				arg_501_1.var_.actorSpriteComps1070 = var_504_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_504_2 = 0.0166666666666667

			if var_504_1 <= arg_501_1.time_ and arg_501_1.time_ < var_504_1 + var_504_2 then
				local var_504_3 = (arg_501_1.time_ - var_504_1) / var_504_2

				if arg_501_1.var_.actorSpriteComps1070 then
					for iter_504_0, iter_504_1 in pairs(arg_501_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_504_1 then
							local var_504_4 = Mathf.Lerp(iter_504_1.color.r, 0.5, var_504_3)

							iter_504_1.color = Color.New(var_504_4, var_504_4, var_504_4)
						end
					end
				end
			end

			if arg_501_1.time_ >= var_504_1 + var_504_2 and arg_501_1.time_ < var_504_1 + var_504_2 + arg_504_0 and arg_501_1.var_.actorSpriteComps1070 then
				local var_504_5 = 0.5

				for iter_504_2, iter_504_3 in pairs(arg_501_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_504_3 then
						iter_504_3.color = Color.New(var_504_5, var_504_5, var_504_5)
					end
				end

				arg_501_1.var_.actorSpriteComps1070 = nil
			end

			local var_504_6 = 0
			local var_504_7 = 0.175

			if var_504_6 < arg_501_1.time_ and arg_501_1.time_ <= var_504_6 + arg_504_0 then
				arg_501_1.talkMaxDuration = 0
				arg_501_1.dialogCg_.alpha = 1

				arg_501_1.dialog_:SetActive(true)
				SetActive(arg_501_1.leftNameGo_, true)

				local var_504_8 = arg_501_1:FormatText(StoryNameCfg[7].name)

				arg_501_1.leftNameTxt_.text = var_504_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_501_1.leftNameTxt_.transform)

				arg_501_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_501_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_501_1:RecordName(arg_501_1.leftNameTxt_.text)
				SetActive(arg_501_1.iconTrs_.gameObject, false)
				arg_501_1.callingController_:SetSelectedState("normal")

				local var_504_9 = arg_501_1:GetWordFromCfg(910109126)
				local var_504_10 = arg_501_1:FormatText(var_504_9.content)

				arg_501_1.text_.text = var_504_10

				LuaForUtil.ClearLinePrefixSymbol(arg_501_1.text_)

				local var_504_11 = 7
				local var_504_12 = utf8.len(var_504_10)
				local var_504_13 = var_504_11 <= 0 and var_504_7 or var_504_7 * (var_504_12 / var_504_11)

				if var_504_13 > 0 and var_504_7 < var_504_13 then
					arg_501_1.talkMaxDuration = var_504_13

					if var_504_13 + var_504_6 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_13 + var_504_6
					end
				end

				arg_501_1.text_.text = var_504_10
				arg_501_1.typewritter.percent = 0

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(false)
				arg_501_1:RecordContent(arg_501_1.text_.text)
			end

			local var_504_14 = math.max(var_504_7, arg_501_1.talkMaxDuration)

			if var_504_6 <= arg_501_1.time_ and arg_501_1.time_ < var_504_6 + var_504_14 then
				arg_501_1.typewritter.percent = (arg_501_1.time_ - var_504_6) / var_504_14

				arg_501_1.typewritter:SetDirty()
			end

			if arg_501_1.time_ >= var_504_6 + var_504_14 and arg_501_1.time_ < var_504_6 + var_504_14 + arg_504_0 then
				arg_501_1.typewritter.percent = 1

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(true)
			end
		end
	end,
	Play910109127 = function(arg_505_0, arg_505_1)
		arg_505_1.time_ = 0
		arg_505_1.frameCnt_ = 0
		arg_505_1.state_ = "playing"
		arg_505_1.curTalkId_ = 910109127
		arg_505_1.duration_ = 5

		SetActive(arg_505_1.tipsGo_, false)

		function arg_505_1.onSingleLineFinish_()
			arg_505_1.onSingleLineUpdate_ = nil
			arg_505_1.onSingleLineFinish_ = nil
			arg_505_1.state_ = "waiting"
		end

		function arg_505_1.playNext_(arg_507_0)
			if arg_507_0 == 1 then
				arg_505_0:Play910109128(arg_505_1)
			end
		end

		function arg_505_1.onSingleLineUpdate_(arg_508_0)
			local var_508_0 = arg_505_1.actors_["1070"]
			local var_508_1 = 0

			if var_508_1 < arg_505_1.time_ and arg_505_1.time_ <= var_508_1 + arg_508_0 and arg_505_1.var_.actorSpriteComps1070 == nil then
				arg_505_1.var_.actorSpriteComps1070 = var_508_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_508_2 = 0.0166666666666667

			if var_508_1 <= arg_505_1.time_ and arg_505_1.time_ < var_508_1 + var_508_2 then
				local var_508_3 = (arg_505_1.time_ - var_508_1) / var_508_2

				if arg_505_1.var_.actorSpriteComps1070 then
					for iter_508_0, iter_508_1 in pairs(arg_505_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_508_1 then
							local var_508_4 = Mathf.Lerp(iter_508_1.color.r, 0.5, var_508_3)

							iter_508_1.color = Color.New(var_508_4, var_508_4, var_508_4)
						end
					end
				end
			end

			if arg_505_1.time_ >= var_508_1 + var_508_2 and arg_505_1.time_ < var_508_1 + var_508_2 + arg_508_0 and arg_505_1.var_.actorSpriteComps1070 then
				local var_508_5 = 0.5

				for iter_508_2, iter_508_3 in pairs(arg_505_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_508_3 then
						iter_508_3.color = Color.New(var_508_5, var_508_5, var_508_5)
					end
				end

				arg_505_1.var_.actorSpriteComps1070 = nil
			end

			local var_508_6 = 0
			local var_508_7 = 0.175

			if var_508_6 < arg_505_1.time_ and arg_505_1.time_ <= var_508_6 + arg_508_0 then
				arg_505_1.talkMaxDuration = 0
				arg_505_1.dialogCg_.alpha = 1

				arg_505_1.dialog_:SetActive(true)
				SetActive(arg_505_1.leftNameGo_, true)

				local var_508_8 = arg_505_1:FormatText(StoryNameCfg[7].name)

				arg_505_1.leftNameTxt_.text = var_508_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_505_1.leftNameTxt_.transform)

				arg_505_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_505_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_505_1:RecordName(arg_505_1.leftNameTxt_.text)
				SetActive(arg_505_1.iconTrs_.gameObject, false)
				arg_505_1.callingController_:SetSelectedState("normal")

				local var_508_9 = arg_505_1:GetWordFromCfg(910109127)
				local var_508_10 = arg_505_1:FormatText(var_508_9.content)

				arg_505_1.text_.text = var_508_10

				LuaForUtil.ClearLinePrefixSymbol(arg_505_1.text_)

				local var_508_11 = 7
				local var_508_12 = utf8.len(var_508_10)
				local var_508_13 = var_508_11 <= 0 and var_508_7 or var_508_7 * (var_508_12 / var_508_11)

				if var_508_13 > 0 and var_508_7 < var_508_13 then
					arg_505_1.talkMaxDuration = var_508_13

					if var_508_13 + var_508_6 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_13 + var_508_6
					end
				end

				arg_505_1.text_.text = var_508_10
				arg_505_1.typewritter.percent = 0

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(false)
				arg_505_1:RecordContent(arg_505_1.text_.text)
			end

			local var_508_14 = math.max(var_508_7, arg_505_1.talkMaxDuration)

			if var_508_6 <= arg_505_1.time_ and arg_505_1.time_ < var_508_6 + var_508_14 then
				arg_505_1.typewritter.percent = (arg_505_1.time_ - var_508_6) / var_508_14

				arg_505_1.typewritter:SetDirty()
			end

			if arg_505_1.time_ >= var_508_6 + var_508_14 and arg_505_1.time_ < var_508_6 + var_508_14 + arg_508_0 then
				arg_505_1.typewritter.percent = 1

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(true)
			end
		end
	end,
	Play910109128 = function(arg_509_0, arg_509_1)
		arg_509_1.time_ = 0
		arg_509_1.frameCnt_ = 0
		arg_509_1.state_ = "playing"
		arg_509_1.curTalkId_ = 910109128
		arg_509_1.duration_ = 5

		SetActive(arg_509_1.tipsGo_, false)

		function arg_509_1.onSingleLineFinish_()
			arg_509_1.onSingleLineUpdate_ = nil
			arg_509_1.onSingleLineFinish_ = nil
			arg_509_1.state_ = "waiting"
		end

		function arg_509_1.playNext_(arg_511_0)
			if arg_511_0 == 1 then
				arg_509_0:Play910109129(arg_509_1)
			end
		end

		function arg_509_1.onSingleLineUpdate_(arg_512_0)
			local var_512_0 = arg_509_1.actors_["1070"]
			local var_512_1 = 0

			if var_512_1 < arg_509_1.time_ and arg_509_1.time_ <= var_512_1 + arg_512_0 and arg_509_1.var_.actorSpriteComps1070 == nil then
				arg_509_1.var_.actorSpriteComps1070 = var_512_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_512_2 = 0.0166666666666667

			if var_512_1 <= arg_509_1.time_ and arg_509_1.time_ < var_512_1 + var_512_2 then
				local var_512_3 = (arg_509_1.time_ - var_512_1) / var_512_2

				if arg_509_1.var_.actorSpriteComps1070 then
					for iter_512_0, iter_512_1 in pairs(arg_509_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_512_1 then
							local var_512_4 = Mathf.Lerp(iter_512_1.color.r, 0.5, var_512_3)

							iter_512_1.color = Color.New(var_512_4, var_512_4, var_512_4)
						end
					end
				end
			end

			if arg_509_1.time_ >= var_512_1 + var_512_2 and arg_509_1.time_ < var_512_1 + var_512_2 + arg_512_0 and arg_509_1.var_.actorSpriteComps1070 then
				local var_512_5 = 0.5

				for iter_512_2, iter_512_3 in pairs(arg_509_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_512_3 then
						iter_512_3.color = Color.New(var_512_5, var_512_5, var_512_5)
					end
				end

				arg_509_1.var_.actorSpriteComps1070 = nil
			end

			local var_512_6 = 0
			local var_512_7 = 0.425

			if var_512_6 < arg_509_1.time_ and arg_509_1.time_ <= var_512_6 + arg_512_0 then
				arg_509_1.talkMaxDuration = 0
				arg_509_1.dialogCg_.alpha = 1

				arg_509_1.dialog_:SetActive(true)
				SetActive(arg_509_1.leftNameGo_, true)

				local var_512_8 = arg_509_1:FormatText(StoryNameCfg[9].name)

				arg_509_1.leftNameTxt_.text = var_512_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_509_1.leftNameTxt_.transform)

				arg_509_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_509_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_509_1:RecordName(arg_509_1.leftNameTxt_.text)
				SetActive(arg_509_1.iconTrs_.gameObject, true)
				arg_509_1.iconController_:SetSelectedState("hero")

				arg_509_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1039")

				arg_509_1.callingController_:SetSelectedState("normal")

				local var_512_9 = arg_509_1:GetWordFromCfg(910109128)
				local var_512_10 = arg_509_1:FormatText(var_512_9.content)

				arg_509_1.text_.text = var_512_10

				LuaForUtil.ClearLinePrefixSymbol(arg_509_1.text_)

				local var_512_11 = 17
				local var_512_12 = utf8.len(var_512_10)
				local var_512_13 = var_512_11 <= 0 and var_512_7 or var_512_7 * (var_512_12 / var_512_11)

				if var_512_13 > 0 and var_512_7 < var_512_13 then
					arg_509_1.talkMaxDuration = var_512_13

					if var_512_13 + var_512_6 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_13 + var_512_6
					end
				end

				arg_509_1.text_.text = var_512_10
				arg_509_1.typewritter.percent = 0

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(false)
				arg_509_1:RecordContent(arg_509_1.text_.text)
			end

			local var_512_14 = math.max(var_512_7, arg_509_1.talkMaxDuration)

			if var_512_6 <= arg_509_1.time_ and arg_509_1.time_ < var_512_6 + var_512_14 then
				arg_509_1.typewritter.percent = (arg_509_1.time_ - var_512_6) / var_512_14

				arg_509_1.typewritter:SetDirty()
			end

			if arg_509_1.time_ >= var_512_6 + var_512_14 and arg_509_1.time_ < var_512_6 + var_512_14 + arg_512_0 then
				arg_509_1.typewritter.percent = 1

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(true)
			end
		end
	end,
	Play910109129 = function(arg_513_0, arg_513_1)
		arg_513_1.time_ = 0
		arg_513_1.frameCnt_ = 0
		arg_513_1.state_ = "playing"
		arg_513_1.curTalkId_ = 910109129
		arg_513_1.duration_ = 5

		SetActive(arg_513_1.tipsGo_, false)

		function arg_513_1.onSingleLineFinish_()
			arg_513_1.onSingleLineUpdate_ = nil
			arg_513_1.onSingleLineFinish_ = nil
			arg_513_1.state_ = "waiting"
		end

		function arg_513_1.playNext_(arg_515_0)
			if arg_515_0 == 1 then
				arg_513_0:Play910109130(arg_513_1)
			end
		end

		function arg_513_1.onSingleLineUpdate_(arg_516_0)
			local var_516_0 = 0
			local var_516_1 = 0.15

			if var_516_0 < arg_513_1.time_ and arg_513_1.time_ <= var_516_0 + arg_516_0 then
				arg_513_1.talkMaxDuration = 0
				arg_513_1.dialogCg_.alpha = 1

				arg_513_1.dialog_:SetActive(true)
				SetActive(arg_513_1.leftNameGo_, true)

				local var_516_2 = arg_513_1:FormatText(StoryNameCfg[7].name)

				arg_513_1.leftNameTxt_.text = var_516_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_513_1.leftNameTxt_.transform)

				arg_513_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_513_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_513_1:RecordName(arg_513_1.leftNameTxt_.text)
				SetActive(arg_513_1.iconTrs_.gameObject, false)
				arg_513_1.callingController_:SetSelectedState("normal")

				local var_516_3 = arg_513_1:GetWordFromCfg(910109129)
				local var_516_4 = arg_513_1:FormatText(var_516_3.content)

				arg_513_1.text_.text = var_516_4

				LuaForUtil.ClearLinePrefixSymbol(arg_513_1.text_)

				local var_516_5 = 6
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
				arg_513_1:RecordContent(arg_513_1.text_.text)
			end

			local var_516_8 = math.max(var_516_1, arg_513_1.talkMaxDuration)

			if var_516_0 <= arg_513_1.time_ and arg_513_1.time_ < var_516_0 + var_516_8 then
				arg_513_1.typewritter.percent = (arg_513_1.time_ - var_516_0) / var_516_8

				arg_513_1.typewritter:SetDirty()
			end

			if arg_513_1.time_ >= var_516_0 + var_516_8 and arg_513_1.time_ < var_516_0 + var_516_8 + arg_516_0 then
				arg_513_1.typewritter.percent = 1

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(true)
			end
		end
	end,
	Play910109130 = function(arg_517_0, arg_517_1)
		arg_517_1.time_ = 0
		arg_517_1.frameCnt_ = 0
		arg_517_1.state_ = "playing"
		arg_517_1.curTalkId_ = 910109130
		arg_517_1.duration_ = 5

		SetActive(arg_517_1.tipsGo_, false)

		function arg_517_1.onSingleLineFinish_()
			arg_517_1.onSingleLineUpdate_ = nil
			arg_517_1.onSingleLineFinish_ = nil
			arg_517_1.state_ = "waiting"
			arg_517_1.auto_ = false
		end

		function arg_517_1.playNext_(arg_519_0)
			arg_517_1.onStoryFinished_()
		end

		function arg_517_1.onSingleLineUpdate_(arg_520_0)
			local var_520_0 = arg_517_1.actors_["1070"].transform
			local var_520_1 = 0

			if var_520_1 < arg_517_1.time_ and arg_517_1.time_ <= var_520_1 + arg_520_0 then
				arg_517_1.var_.moveOldPos1070 = var_520_0.localPosition
				var_520_0.localScale = Vector3.New(1, 1, 1)

				arg_517_1:CheckSpriteTmpPos("1070", 3)

				local var_520_2 = var_520_0.childCount

				for iter_520_0 = 0, var_520_2 - 1 do
					local var_520_3 = var_520_0:GetChild(iter_520_0)

					if var_520_3.name == "split_2" or not string.find(var_520_3.name, "split") then
						var_520_3.gameObject:SetActive(true)
					else
						var_520_3.gameObject:SetActive(false)
					end
				end
			end

			local var_520_4 = 0.001

			if var_520_1 <= arg_517_1.time_ and arg_517_1.time_ < var_520_1 + var_520_4 then
				local var_520_5 = (arg_517_1.time_ - var_520_1) / var_520_4
				local var_520_6 = Vector3.New(0, -350, -180)

				var_520_0.localPosition = Vector3.Lerp(arg_517_1.var_.moveOldPos1070, var_520_6, var_520_5)
			end

			if arg_517_1.time_ >= var_520_1 + var_520_4 and arg_517_1.time_ < var_520_1 + var_520_4 + arg_520_0 then
				var_520_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_520_7 = arg_517_1.actors_["1070"]
			local var_520_8 = 0

			if var_520_8 < arg_517_1.time_ and arg_517_1.time_ <= var_520_8 + arg_520_0 and arg_517_1.var_.actorSpriteComps1070 == nil then
				arg_517_1.var_.actorSpriteComps1070 = var_520_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_520_9 = 0.0166666666666667

			if var_520_8 <= arg_517_1.time_ and arg_517_1.time_ < var_520_8 + var_520_9 then
				local var_520_10 = (arg_517_1.time_ - var_520_8) / var_520_9

				if arg_517_1.var_.actorSpriteComps1070 then
					for iter_520_1, iter_520_2 in pairs(arg_517_1.var_.actorSpriteComps1070:ToTable()) do
						if iter_520_2 then
							local var_520_11 = Mathf.Lerp(iter_520_2.color.r, 1, var_520_10)

							iter_520_2.color = Color.New(var_520_11, var_520_11, var_520_11)
						end
					end
				end
			end

			if arg_517_1.time_ >= var_520_8 + var_520_9 and arg_517_1.time_ < var_520_8 + var_520_9 + arg_520_0 and arg_517_1.var_.actorSpriteComps1070 then
				local var_520_12 = 1

				for iter_520_3, iter_520_4 in pairs(arg_517_1.var_.actorSpriteComps1070:ToTable()) do
					if iter_520_4 then
						iter_520_4.color = Color.New(var_520_12, var_520_12, var_520_12)
					end
				end

				arg_517_1.var_.actorSpriteComps1070 = nil
			end

			local var_520_13 = 0
			local var_520_14 = 1.55

			if var_520_13 < arg_517_1.time_ and arg_517_1.time_ <= var_520_13 + arg_520_0 then
				arg_517_1.talkMaxDuration = 0
				arg_517_1.dialogCg_.alpha = 1

				arg_517_1.dialog_:SetActive(true)
				SetActive(arg_517_1.leftNameGo_, false)

				arg_517_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_517_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_517_1:RecordName(arg_517_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_517_1.iconTrs_.gameObject, false)
				arg_517_1.callingController_:SetSelectedState("normal")

				local var_520_15 = arg_517_1:GetWordFromCfg(910109130)
				local var_520_16 = arg_517_1:FormatText(var_520_15.content)

				arg_517_1.text_.text = var_520_16

				LuaForUtil.ClearLinePrefixSymbol(arg_517_1.text_)

				local var_520_17 = 62
				local var_520_18 = utf8.len(var_520_16)
				local var_520_19 = var_520_17 <= 0 and var_520_14 or var_520_14 * (var_520_18 / var_520_17)

				if var_520_19 > 0 and var_520_14 < var_520_19 then
					arg_517_1.talkMaxDuration = var_520_19

					if var_520_19 + var_520_13 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_19 + var_520_13
					end
				end

				arg_517_1.text_.text = var_520_16
				arg_517_1.typewritter.percent = 0

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(false)
				arg_517_1:RecordContent(arg_517_1.text_.text)
			end

			local var_520_20 = math.max(var_520_14, arg_517_1.talkMaxDuration)

			if var_520_13 <= arg_517_1.time_ and arg_517_1.time_ < var_520_13 + var_520_20 then
				arg_517_1.typewritter.percent = (arg_517_1.time_ - var_520_13) / var_520_20

				arg_517_1.typewritter:SetDirty()
			end

			if arg_517_1.time_ >= var_520_13 + var_520_20 and arg_517_1.time_ < var_520_13 + var_520_20 + arg_520_0 then
				arg_517_1.typewritter.percent = 1

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(true)
			end
		end
	end,
	Play910109008 = function(arg_521_0, arg_521_1)
		arg_521_1.time_ = 0
		arg_521_1.frameCnt_ = 0
		arg_521_1.state_ = "playing"
		arg_521_1.curTalkId_ = 910109008
		arg_521_1.duration_ = 5

		SetActive(arg_521_1.tipsGo_, false)

		function arg_521_1.onSingleLineFinish_()
			arg_521_1.onSingleLineUpdate_ = nil
			arg_521_1.onSingleLineFinish_ = nil
			arg_521_1.state_ = "waiting"
		end

		function arg_521_1.playNext_(arg_523_0)
			if arg_523_0 == 1 then
				arg_521_0:Play910109009(arg_521_1)
			end
		end

		function arg_521_1.onSingleLineUpdate_(arg_524_0)
			local var_524_0 = arg_521_1.actors_["1039"]
			local var_524_1 = 0

			if var_524_1 < arg_521_1.time_ and arg_521_1.time_ <= var_524_1 + arg_524_0 and arg_521_1.var_.actorSpriteComps1039 == nil then
				arg_521_1.var_.actorSpriteComps1039 = var_524_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_524_2 = 0.2

			if var_524_1 <= arg_521_1.time_ and arg_521_1.time_ < var_524_1 + var_524_2 then
				local var_524_3 = (arg_521_1.time_ - var_524_1) / var_524_2

				if arg_521_1.var_.actorSpriteComps1039 then
					for iter_524_0, iter_524_1 in pairs(arg_521_1.var_.actorSpriteComps1039:ToTable()) do
						if iter_524_1 then
							local var_524_4 = Mathf.Lerp(iter_524_1.color.r, 1, var_524_3)

							iter_524_1.color = Color.New(var_524_4, var_524_4, var_524_4)
						end
					end
				end
			end

			if arg_521_1.time_ >= var_524_1 + var_524_2 and arg_521_1.time_ < var_524_1 + var_524_2 + arg_524_0 and arg_521_1.var_.actorSpriteComps1039 then
				local var_524_5 = 1

				for iter_524_2, iter_524_3 in pairs(arg_521_1.var_.actorSpriteComps1039:ToTable()) do
					if iter_524_3 then
						iter_524_3.color = Color.New(var_524_5, var_524_5, var_524_5)
					end
				end

				arg_521_1.var_.actorSpriteComps1039 = nil
			end

			local var_524_6 = 0
			local var_524_7 = 0.475

			if var_524_6 < arg_521_1.time_ and arg_521_1.time_ <= var_524_6 + arg_524_0 then
				arg_521_1.talkMaxDuration = 0
				arg_521_1.dialogCg_.alpha = 1

				arg_521_1.dialog_:SetActive(true)
				SetActive(arg_521_1.leftNameGo_, true)

				local var_524_8 = arg_521_1:FormatText(StoryNameCfg[9].name)

				arg_521_1.leftNameTxt_.text = var_524_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_521_1.leftNameTxt_.transform)

				arg_521_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_521_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_521_1:RecordName(arg_521_1.leftNameTxt_.text)
				SetActive(arg_521_1.iconTrs_.gameObject, false)
				arg_521_1.callingController_:SetSelectedState("normal")

				local var_524_9 = arg_521_1:GetWordFromCfg(910109008)
				local var_524_10 = arg_521_1:FormatText(var_524_9.content)

				arg_521_1.text_.text = var_524_10

				LuaForUtil.ClearLinePrefixSymbol(arg_521_1.text_)

				local var_524_11 = 19
				local var_524_12 = utf8.len(var_524_10)
				local var_524_13 = var_524_11 <= 0 and var_524_7 or var_524_7 * (var_524_12 / var_524_11)

				if var_524_13 > 0 and var_524_7 < var_524_13 then
					arg_521_1.talkMaxDuration = var_524_13

					if var_524_13 + var_524_6 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_13 + var_524_6
					end
				end

				arg_521_1.text_.text = var_524_10
				arg_521_1.typewritter.percent = 0

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(false)
				arg_521_1:RecordContent(arg_521_1.text_.text)
			end

			local var_524_14 = math.max(var_524_7, arg_521_1.talkMaxDuration)

			if var_524_6 <= arg_521_1.time_ and arg_521_1.time_ < var_524_6 + var_524_14 then
				arg_521_1.typewritter.percent = (arg_521_1.time_ - var_524_6) / var_524_14

				arg_521_1.typewritter:SetDirty()
			end

			if arg_521_1.time_ >= var_524_6 + var_524_14 and arg_521_1.time_ < var_524_6 + var_524_14 + arg_524_0 then
				arg_521_1.typewritter.percent = 1

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I05b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/NI0101",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST01"
	},
	voices = {}
}
