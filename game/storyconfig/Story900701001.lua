return {
	Play900701001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 900701001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play900701002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST22a"

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
				local var_4_5 = arg_1_1.bgs_.ST22a

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
					if iter_4_0 ~= "ST22a" then
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

			local var_4_26 = 1.96666666666667
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 1.125

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

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_33 = arg_1_1:GetWordFromCfg(900701001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 45
				local var_4_36 = utf8.len(var_4_34)
				local var_4_37 = var_4_35 <= 0 and var_4_31 or var_4_31 * (var_4_36 / var_4_35)

				if var_4_37 > 0 and var_4_31 < var_4_37 then
					arg_1_1.talkMaxDuration = var_4_37
					var_4_30 = var_4_30 + 0.3

					if var_4_37 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_37 + var_4_30
					end
				end

				arg_1_1.text_.text = var_4_34
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_38 = var_4_30 + 0.3
			local var_4_39 = math.max(var_4_31, arg_1_1.talkMaxDuration)

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_39 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_38) / var_4_39

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_38 + var_4_39 and arg_1_1.time_ < var_4_38 + var_4_39 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play900701002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 900701002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play900701003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.5

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

				local var_10_2 = arg_7_1:GetWordFromCfg(900701002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 20
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
	Play900701003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 900701003
		arg_11_1.duration_ = 5.2

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play900701004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "10022"

			if arg_11_1.actors_[var_14_0] == nil then
				local var_14_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_14_0), arg_11_1.canvasGo_.transform)

				var_14_1.transform:SetSiblingIndex(1)

				var_14_1.name = var_14_0
				var_14_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_11_1.actors_[var_14_0] = var_14_1
			end

			local var_14_2 = arg_11_1.actors_["10022"].transform
			local var_14_3 = 0

			if var_14_3 < arg_11_1.time_ and arg_11_1.time_ <= var_14_3 + arg_14_0 then
				arg_11_1.var_.moveOldPos10022 = var_14_2.localPosition
				var_14_2.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("10022", 2)

				local var_14_4 = var_14_2.childCount

				for iter_14_0 = 0, var_14_4 - 1 do
					local var_14_5 = var_14_2:GetChild(iter_14_0)

					if var_14_5.name == "split_6" or not string.find(var_14_5.name, "split") then
						var_14_5.gameObject:SetActive(true)
					else
						var_14_5.gameObject:SetActive(false)
					end
				end
			end

			local var_14_6 = 0.001

			if var_14_3 <= arg_11_1.time_ and arg_11_1.time_ < var_14_3 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_3) / var_14_6
				local var_14_8 = Vector3.New(-390, -350, -180)

				var_14_2.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos10022, var_14_8, var_14_7)
			end

			if arg_11_1.time_ >= var_14_3 + var_14_6 and arg_11_1.time_ < var_14_3 + var_14_6 + arg_14_0 then
				var_14_2.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_14_9 = arg_11_1.actors_["10022"]
			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 then
				local var_14_11 = var_14_9:GetComponentInChildren(typeof(CanvasGroup))

				if var_14_11 then
					arg_11_1.var_.alphaOldValue10022 = var_14_11.alpha
					arg_11_1.var_.characterEffect10022 = var_14_11
				end

				arg_11_1.var_.alphaOldValue10022 = 0
			end

			local var_14_12 = 0.2

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_12 then
				local var_14_13 = (arg_11_1.time_ - var_14_10) / var_14_12
				local var_14_14 = Mathf.Lerp(arg_11_1.var_.alphaOldValue10022, 1, var_14_13)

				if arg_11_1.var_.characterEffect10022 then
					arg_11_1.var_.characterEffect10022.alpha = var_14_14
				end
			end

			if arg_11_1.time_ >= var_14_10 + var_14_12 and arg_11_1.time_ < var_14_10 + var_14_12 + arg_14_0 and arg_11_1.var_.characterEffect10022 then
				arg_11_1.var_.characterEffect10022.alpha = 1
			end

			local var_14_15 = arg_11_1.actors_["10022"]
			local var_14_16 = 0

			if var_14_16 < arg_11_1.time_ and arg_11_1.time_ <= var_14_16 + arg_14_0 and arg_11_1.var_.actorSpriteComps10022 == nil then
				arg_11_1.var_.actorSpriteComps10022 = var_14_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_17 = 0.2

			if var_14_16 <= arg_11_1.time_ and arg_11_1.time_ < var_14_16 + var_14_17 then
				local var_14_18 = (arg_11_1.time_ - var_14_16) / var_14_17

				if arg_11_1.var_.actorSpriteComps10022 then
					for iter_14_1, iter_14_2 in pairs(arg_11_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_14_2 then
							local var_14_19 = Mathf.Lerp(iter_14_2.color.r, 1, var_14_18)

							iter_14_2.color = Color.New(var_14_19, var_14_19, var_14_19)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_16 + var_14_17 and arg_11_1.time_ < var_14_16 + var_14_17 + arg_14_0 and arg_11_1.var_.actorSpriteComps10022 then
				local var_14_20 = 1

				for iter_14_3, iter_14_4 in pairs(arg_11_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_14_4 then
						iter_14_4.color = Color.New(var_14_20, var_14_20, var_14_20)
					end
				end

				arg_11_1.var_.actorSpriteComps10022 = nil
			end

			if arg_11_1.frameCnt_ <= 1 then
				arg_11_1.dialog_:SetActive(false)
			end

			local var_14_21 = 0.2
			local var_14_22 = 0.3

			if var_14_21 < arg_11_1.time_ and arg_11_1.time_ <= var_14_21 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0

				arg_11_1.dialog_:SetActive(true)

				local var_14_23 = LeanTween.value(arg_11_1.dialog_, 0, 1, 0.3)

				var_14_23:setOnUpdate(LuaHelper.FloatAction(function(arg_15_0)
					arg_11_1.dialogCg_.alpha = arg_15_0
				end))
				var_14_23:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_11_1.dialog_)
					var_14_23:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_11_1.duration_ = arg_11_1.duration_ + 0.3

				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_24 = arg_11_1:FormatText(StoryNameCfg[235].name)

				arg_11_1.leftNameTxt_.text = var_14_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_25 = arg_11_1:GetWordFromCfg(900701003)
				local var_14_26 = arg_11_1:FormatText(var_14_25.content)

				arg_11_1.text_.text = var_14_26

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_27 = 12
				local var_14_28 = utf8.len(var_14_26)
				local var_14_29 = var_14_27 <= 0 and var_14_22 or var_14_22 * (var_14_28 / var_14_27)

				if var_14_29 > 0 and var_14_22 < var_14_29 then
					arg_11_1.talkMaxDuration = var_14_29
					var_14_21 = var_14_21 + 0.3

					if var_14_29 + var_14_21 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_29 + var_14_21
					end
				end

				arg_11_1.text_.text = var_14_26
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_30 = var_14_21 + 0.3
			local var_14_31 = math.max(var_14_22, arg_11_1.talkMaxDuration)

			if var_14_30 <= arg_11_1.time_ and arg_11_1.time_ < var_14_30 + var_14_31 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_30) / var_14_31

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_30 + var_14_31 and arg_11_1.time_ < var_14_30 + var_14_31 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play900701004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 900701004
		arg_17_1.duration_ = 5

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play900701005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = "1033"

			if arg_17_1.actors_[var_20_0] == nil then
				local var_20_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_20_0), arg_17_1.canvasGo_.transform)

				var_20_1.transform:SetSiblingIndex(1)

				var_20_1.name = var_20_0
				var_20_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_17_1.actors_[var_20_0] = var_20_1
			end

			local var_20_2 = arg_17_1.actors_["1033"].transform
			local var_20_3 = 0

			if var_20_3 < arg_17_1.time_ and arg_17_1.time_ <= var_20_3 + arg_20_0 then
				arg_17_1.var_.moveOldPos1033 = var_20_2.localPosition
				var_20_2.localScale = Vector3.New(1, 1, 1)

				arg_17_1:CheckSpriteTmpPos("1033", 4)

				local var_20_4 = var_20_2.childCount

				for iter_20_0 = 0, var_20_4 - 1 do
					local var_20_5 = var_20_2:GetChild(iter_20_0)

					if var_20_5.name == "split_5" or not string.find(var_20_5.name, "split") then
						var_20_5.gameObject:SetActive(true)
					else
						var_20_5.gameObject:SetActive(false)
					end
				end
			end

			local var_20_6 = 0.001

			if var_20_3 <= arg_17_1.time_ and arg_17_1.time_ < var_20_3 + var_20_6 then
				local var_20_7 = (arg_17_1.time_ - var_20_3) / var_20_6
				local var_20_8 = Vector3.New(390, -420, 0)

				var_20_2.localPosition = Vector3.Lerp(arg_17_1.var_.moveOldPos1033, var_20_8, var_20_7)
			end

			if arg_17_1.time_ >= var_20_3 + var_20_6 and arg_17_1.time_ < var_20_3 + var_20_6 + arg_20_0 then
				var_20_2.localPosition = Vector3.New(390, -420, 0)
			end

			local var_20_9 = arg_17_1.actors_["1033"]
			local var_20_10 = 0

			if var_20_10 < arg_17_1.time_ and arg_17_1.time_ <= var_20_10 + arg_20_0 then
				local var_20_11 = var_20_9:GetComponentInChildren(typeof(CanvasGroup))

				if var_20_11 then
					arg_17_1.var_.alphaOldValue1033 = var_20_11.alpha
					arg_17_1.var_.characterEffect1033 = var_20_11
				end

				arg_17_1.var_.alphaOldValue1033 = 0
			end

			local var_20_12 = 0.2

			if var_20_10 <= arg_17_1.time_ and arg_17_1.time_ < var_20_10 + var_20_12 then
				local var_20_13 = (arg_17_1.time_ - var_20_10) / var_20_12
				local var_20_14 = Mathf.Lerp(arg_17_1.var_.alphaOldValue1033, 1, var_20_13)

				if arg_17_1.var_.characterEffect1033 then
					arg_17_1.var_.characterEffect1033.alpha = var_20_14
				end
			end

			if arg_17_1.time_ >= var_20_10 + var_20_12 and arg_17_1.time_ < var_20_10 + var_20_12 + arg_20_0 and arg_17_1.var_.characterEffect1033 then
				arg_17_1.var_.characterEffect1033.alpha = 1
			end

			local var_20_15 = arg_17_1.actors_["1033"]
			local var_20_16 = 0

			if var_20_16 < arg_17_1.time_ and arg_17_1.time_ <= var_20_16 + arg_20_0 and arg_17_1.var_.actorSpriteComps1033 == nil then
				arg_17_1.var_.actorSpriteComps1033 = var_20_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_20_17 = 0.2

			if var_20_16 <= arg_17_1.time_ and arg_17_1.time_ < var_20_16 + var_20_17 then
				local var_20_18 = (arg_17_1.time_ - var_20_16) / var_20_17

				if arg_17_1.var_.actorSpriteComps1033 then
					for iter_20_1, iter_20_2 in pairs(arg_17_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_20_2 then
							local var_20_19 = Mathf.Lerp(iter_20_2.color.r, 1, var_20_18)

							iter_20_2.color = Color.New(var_20_19, var_20_19, var_20_19)
						end
					end
				end
			end

			if arg_17_1.time_ >= var_20_16 + var_20_17 and arg_17_1.time_ < var_20_16 + var_20_17 + arg_20_0 and arg_17_1.var_.actorSpriteComps1033 then
				local var_20_20 = 1

				for iter_20_3, iter_20_4 in pairs(arg_17_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_20_4 then
						iter_20_4.color = Color.New(var_20_20, var_20_20, var_20_20)
					end
				end

				arg_17_1.var_.actorSpriteComps1033 = nil
			end

			local var_20_21 = arg_17_1.actors_["10022"]
			local var_20_22 = 0

			if var_20_22 < arg_17_1.time_ and arg_17_1.time_ <= var_20_22 + arg_20_0 and arg_17_1.var_.actorSpriteComps10022 == nil then
				arg_17_1.var_.actorSpriteComps10022 = var_20_21:GetComponentsInChildren(typeof(Image), true)
			end

			local var_20_23 = 0.2

			if var_20_22 <= arg_17_1.time_ and arg_17_1.time_ < var_20_22 + var_20_23 then
				local var_20_24 = (arg_17_1.time_ - var_20_22) / var_20_23

				if arg_17_1.var_.actorSpriteComps10022 then
					for iter_20_5, iter_20_6 in pairs(arg_17_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_20_6 then
							local var_20_25 = Mathf.Lerp(iter_20_6.color.r, 0.5, var_20_24)

							iter_20_6.color = Color.New(var_20_25, var_20_25, var_20_25)
						end
					end
				end
			end

			if arg_17_1.time_ >= var_20_22 + var_20_23 and arg_17_1.time_ < var_20_22 + var_20_23 + arg_20_0 and arg_17_1.var_.actorSpriteComps10022 then
				local var_20_26 = 0.5

				for iter_20_7, iter_20_8 in pairs(arg_17_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_20_8 then
						iter_20_8.color = Color.New(var_20_26, var_20_26, var_20_26)
					end
				end

				arg_17_1.var_.actorSpriteComps10022 = nil
			end

			local var_20_27 = 0
			local var_20_28 = 0.875

			if var_20_27 < arg_17_1.time_ and arg_17_1.time_ <= var_20_27 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_29 = arg_17_1:FormatText(StoryNameCfg[236].name)

				arg_17_1.leftNameTxt_.text = var_20_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_30 = arg_17_1:GetWordFromCfg(900701004)
				local var_20_31 = arg_17_1:FormatText(var_20_30.content)

				arg_17_1.text_.text = var_20_31

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_32 = 35
				local var_20_33 = utf8.len(var_20_31)
				local var_20_34 = var_20_32 <= 0 and var_20_28 or var_20_28 * (var_20_33 / var_20_32)

				if var_20_34 > 0 and var_20_28 < var_20_34 then
					arg_17_1.talkMaxDuration = var_20_34

					if var_20_34 + var_20_27 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_34 + var_20_27
					end
				end

				arg_17_1.text_.text = var_20_31
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)
				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_35 = math.max(var_20_28, arg_17_1.talkMaxDuration)

			if var_20_27 <= arg_17_1.time_ and arg_17_1.time_ < var_20_27 + var_20_35 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_27) / var_20_35

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_27 + var_20_35 and arg_17_1.time_ < var_20_27 + var_20_35 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play900701005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 900701005
		arg_21_1.duration_ = 5

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play900701006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0
			local var_24_1 = 0.75

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_2 = arg_21_1:FormatText(StoryNameCfg[236].name)

				arg_21_1.leftNameTxt_.text = var_24_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_3 = arg_21_1:GetWordFromCfg(900701005)
				local var_24_4 = arg_21_1:FormatText(var_24_3.content)

				arg_21_1.text_.text = var_24_4

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_5 = 30
				local var_24_6 = utf8.len(var_24_4)
				local var_24_7 = var_24_5 <= 0 and var_24_1 or var_24_1 * (var_24_6 / var_24_5)

				if var_24_7 > 0 and var_24_1 < var_24_7 then
					arg_21_1.talkMaxDuration = var_24_7

					if var_24_7 + var_24_0 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_7 + var_24_0
					end
				end

				arg_21_1.text_.text = var_24_4
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)
				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_8 = math.max(var_24_1, arg_21_1.talkMaxDuration)

			if var_24_0 <= arg_21_1.time_ and arg_21_1.time_ < var_24_0 + var_24_8 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_0) / var_24_8

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_0 + var_24_8 and arg_21_1.time_ < var_24_0 + var_24_8 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play900701006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 900701006
		arg_25_1.duration_ = 5

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play900701007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["1033"]
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 and arg_25_1.var_.actorSpriteComps1033 == nil then
				arg_25_1.var_.actorSpriteComps1033 = var_28_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_28_2 = 0.2

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2

				if arg_25_1.var_.actorSpriteComps1033 then
					for iter_28_0, iter_28_1 in pairs(arg_25_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_28_1 then
							local var_28_4 = Mathf.Lerp(iter_28_1.color.r, 0.5, var_28_3)

							iter_28_1.color = Color.New(var_28_4, var_28_4, var_28_4)
						end
					end
				end
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 and arg_25_1.var_.actorSpriteComps1033 then
				local var_28_5 = 0.5

				for iter_28_2, iter_28_3 in pairs(arg_25_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_28_3 then
						iter_28_3.color = Color.New(var_28_5, var_28_5, var_28_5)
					end
				end

				arg_25_1.var_.actorSpriteComps1033 = nil
			end

			local var_28_6 = arg_25_1.actors_["10022"]
			local var_28_7 = 0

			if var_28_7 < arg_25_1.time_ and arg_25_1.time_ <= var_28_7 + arg_28_0 and arg_25_1.var_.actorSpriteComps10022 == nil then
				arg_25_1.var_.actorSpriteComps10022 = var_28_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_28_8 = 0.2

			if var_28_7 <= arg_25_1.time_ and arg_25_1.time_ < var_28_7 + var_28_8 then
				local var_28_9 = (arg_25_1.time_ - var_28_7) / var_28_8

				if arg_25_1.var_.actorSpriteComps10022 then
					for iter_28_4, iter_28_5 in pairs(arg_25_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_28_5 then
							local var_28_10 = Mathf.Lerp(iter_28_5.color.r, 1, var_28_9)

							iter_28_5.color = Color.New(var_28_10, var_28_10, var_28_10)
						end
					end
				end
			end

			if arg_25_1.time_ >= var_28_7 + var_28_8 and arg_25_1.time_ < var_28_7 + var_28_8 + arg_28_0 and arg_25_1.var_.actorSpriteComps10022 then
				local var_28_11 = 1

				for iter_28_6, iter_28_7 in pairs(arg_25_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_28_7 then
						iter_28_7.color = Color.New(var_28_11, var_28_11, var_28_11)
					end
				end

				arg_25_1.var_.actorSpriteComps10022 = nil
			end

			local var_28_12 = 0
			local var_28_13 = 0.675

			if var_28_12 < arg_25_1.time_ and arg_25_1.time_ <= var_28_12 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_14 = arg_25_1:FormatText(StoryNameCfg[235].name)

				arg_25_1.leftNameTxt_.text = var_28_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_15 = arg_25_1:GetWordFromCfg(900701006)
				local var_28_16 = arg_25_1:FormatText(var_28_15.content)

				arg_25_1.text_.text = var_28_16

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_17 = 27
				local var_28_18 = utf8.len(var_28_16)
				local var_28_19 = var_28_17 <= 0 and var_28_13 or var_28_13 * (var_28_18 / var_28_17)

				if var_28_19 > 0 and var_28_13 < var_28_19 then
					arg_25_1.talkMaxDuration = var_28_19

					if var_28_19 + var_28_12 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_19 + var_28_12
					end
				end

				arg_25_1.text_.text = var_28_16
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)
				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_20 = math.max(var_28_13, arg_25_1.talkMaxDuration)

			if var_28_12 <= arg_25_1.time_ and arg_25_1.time_ < var_28_12 + var_28_20 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_12) / var_28_20

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_12 + var_28_20 and arg_25_1.time_ < var_28_12 + var_28_20 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play900701007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 900701007
		arg_29_1.duration_ = 5

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play900701008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["1033"]
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 and arg_29_1.var_.actorSpriteComps1033 == nil then
				arg_29_1.var_.actorSpriteComps1033 = var_32_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_32_2 = 0.2

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_2 then
				local var_32_3 = (arg_29_1.time_ - var_32_1) / var_32_2

				if arg_29_1.var_.actorSpriteComps1033 then
					for iter_32_0, iter_32_1 in pairs(arg_29_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_32_1 then
							local var_32_4 = Mathf.Lerp(iter_32_1.color.r, 1, var_32_3)

							iter_32_1.color = Color.New(var_32_4, var_32_4, var_32_4)
						end
					end
				end
			end

			if arg_29_1.time_ >= var_32_1 + var_32_2 and arg_29_1.time_ < var_32_1 + var_32_2 + arg_32_0 and arg_29_1.var_.actorSpriteComps1033 then
				local var_32_5 = 1

				for iter_32_2, iter_32_3 in pairs(arg_29_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_32_3 then
						iter_32_3.color = Color.New(var_32_5, var_32_5, var_32_5)
					end
				end

				arg_29_1.var_.actorSpriteComps1033 = nil
			end

			local var_32_6 = arg_29_1.actors_["10022"]
			local var_32_7 = 0

			if var_32_7 < arg_29_1.time_ and arg_29_1.time_ <= var_32_7 + arg_32_0 and arg_29_1.var_.actorSpriteComps10022 == nil then
				arg_29_1.var_.actorSpriteComps10022 = var_32_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_32_8 = 0.2

			if var_32_7 <= arg_29_1.time_ and arg_29_1.time_ < var_32_7 + var_32_8 then
				local var_32_9 = (arg_29_1.time_ - var_32_7) / var_32_8

				if arg_29_1.var_.actorSpriteComps10022 then
					for iter_32_4, iter_32_5 in pairs(arg_29_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_32_5 then
							local var_32_10 = Mathf.Lerp(iter_32_5.color.r, 0.5, var_32_9)

							iter_32_5.color = Color.New(var_32_10, var_32_10, var_32_10)
						end
					end
				end
			end

			if arg_29_1.time_ >= var_32_7 + var_32_8 and arg_29_1.time_ < var_32_7 + var_32_8 + arg_32_0 and arg_29_1.var_.actorSpriteComps10022 then
				local var_32_11 = 0.5

				for iter_32_6, iter_32_7 in pairs(arg_29_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_32_7 then
						iter_32_7.color = Color.New(var_32_11, var_32_11, var_32_11)
					end
				end

				arg_29_1.var_.actorSpriteComps10022 = nil
			end

			local var_32_12 = 0
			local var_32_13 = 0.975

			if var_32_12 < arg_29_1.time_ and arg_29_1.time_ <= var_32_12 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_14 = arg_29_1:FormatText(StoryNameCfg[236].name)

				arg_29_1.leftNameTxt_.text = var_32_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_15 = arg_29_1:GetWordFromCfg(900701007)
				local var_32_16 = arg_29_1:FormatText(var_32_15.content)

				arg_29_1.text_.text = var_32_16

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_17 = 39
				local var_32_18 = utf8.len(var_32_16)
				local var_32_19 = var_32_17 <= 0 and var_32_13 or var_32_13 * (var_32_18 / var_32_17)

				if var_32_19 > 0 and var_32_13 < var_32_19 then
					arg_29_1.talkMaxDuration = var_32_19

					if var_32_19 + var_32_12 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_19 + var_32_12
					end
				end

				arg_29_1.text_.text = var_32_16
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)
				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_20 = math.max(var_32_13, arg_29_1.talkMaxDuration)

			if var_32_12 <= arg_29_1.time_ and arg_29_1.time_ < var_32_12 + var_32_20 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_12) / var_32_20

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_12 + var_32_20 and arg_29_1.time_ < var_32_12 + var_32_20 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play900701008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 900701008
		arg_33_1.duration_ = 5

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play900701009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = 0
			local var_36_1 = 0.6

			if var_36_0 < arg_33_1.time_ and arg_33_1.time_ <= var_36_0 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_2 = arg_33_1:FormatText(StoryNameCfg[236].name)

				arg_33_1.leftNameTxt_.text = var_36_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_3 = arg_33_1:GetWordFromCfg(900701008)
				local var_36_4 = arg_33_1:FormatText(var_36_3.content)

				arg_33_1.text_.text = var_36_4

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_5 = 24
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
				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_8 = math.max(var_36_1, arg_33_1.talkMaxDuration)

			if var_36_0 <= arg_33_1.time_ and arg_33_1.time_ < var_36_0 + var_36_8 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_0) / var_36_8

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_0 + var_36_8 and arg_33_1.time_ < var_36_0 + var_36_8 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play900701009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 900701009
		arg_37_1.duration_ = 5

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play900701010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1033"].transform
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 then
				arg_37_1.var_.moveOldPos1033 = var_40_0.localPosition
				var_40_0.localScale = Vector3.New(1, 1, 1)

				arg_37_1:CheckSpriteTmpPos("1033", 4)

				local var_40_2 = var_40_0.childCount

				for iter_40_0 = 0, var_40_2 - 1 do
					local var_40_3 = var_40_0:GetChild(iter_40_0)

					if var_40_3.name == "split_5" or not string.find(var_40_3.name, "split") then
						var_40_3.gameObject:SetActive(true)
					else
						var_40_3.gameObject:SetActive(false)
					end
				end
			end

			local var_40_4 = 0.001

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_4 then
				local var_40_5 = (arg_37_1.time_ - var_40_1) / var_40_4
				local var_40_6 = Vector3.New(390, -420, 0)

				var_40_0.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1033, var_40_6, var_40_5)
			end

			if arg_37_1.time_ >= var_40_1 + var_40_4 and arg_37_1.time_ < var_40_1 + var_40_4 + arg_40_0 then
				var_40_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_40_7 = 0
			local var_40_8 = 0.875

			if var_40_7 < arg_37_1.time_ and arg_37_1.time_ <= var_40_7 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_9 = arg_37_1:FormatText(StoryNameCfg[236].name)

				arg_37_1.leftNameTxt_.text = var_40_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_10 = arg_37_1:GetWordFromCfg(900701009)
				local var_40_11 = arg_37_1:FormatText(var_40_10.content)

				arg_37_1.text_.text = var_40_11

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_12 = 35
				local var_40_13 = utf8.len(var_40_11)
				local var_40_14 = var_40_12 <= 0 and var_40_8 or var_40_8 * (var_40_13 / var_40_12)

				if var_40_14 > 0 and var_40_8 < var_40_14 then
					arg_37_1.talkMaxDuration = var_40_14

					if var_40_14 + var_40_7 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_14 + var_40_7
					end
				end

				arg_37_1.text_.text = var_40_11
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)
				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_15 = math.max(var_40_8, arg_37_1.talkMaxDuration)

			if var_40_7 <= arg_37_1.time_ and arg_37_1.time_ < var_40_7 + var_40_15 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_7) / var_40_15

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_7 + var_40_15 and arg_37_1.time_ < var_40_7 + var_40_15 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play900701010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 900701010
		arg_41_1.duration_ = 5

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play900701011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["10022"].transform
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 then
				arg_41_1.var_.moveOldPos10022 = var_44_0.localPosition
				var_44_0.localScale = Vector3.New(1, 1, 1)

				arg_41_1:CheckSpriteTmpPos("10022", 2)

				local var_44_2 = var_44_0.childCount

				for iter_44_0 = 0, var_44_2 - 1 do
					local var_44_3 = var_44_0:GetChild(iter_44_0)

					if var_44_3.name == "split_3" or not string.find(var_44_3.name, "split") then
						var_44_3.gameObject:SetActive(true)
					else
						var_44_3.gameObject:SetActive(false)
					end
				end
			end

			local var_44_4 = 0.001

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_4 then
				local var_44_5 = (arg_41_1.time_ - var_44_1) / var_44_4
				local var_44_6 = Vector3.New(-390, -350, -180)

				var_44_0.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos10022, var_44_6, var_44_5)
			end

			if arg_41_1.time_ >= var_44_1 + var_44_4 and arg_41_1.time_ < var_44_1 + var_44_4 + arg_44_0 then
				var_44_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_44_7 = arg_41_1.actors_["10022"]
			local var_44_8 = 0

			if var_44_8 < arg_41_1.time_ and arg_41_1.time_ <= var_44_8 + arg_44_0 and arg_41_1.var_.actorSpriteComps10022 == nil then
				arg_41_1.var_.actorSpriteComps10022 = var_44_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_44_9 = 0.2

			if var_44_8 <= arg_41_1.time_ and arg_41_1.time_ < var_44_8 + var_44_9 then
				local var_44_10 = (arg_41_1.time_ - var_44_8) / var_44_9

				if arg_41_1.var_.actorSpriteComps10022 then
					for iter_44_1, iter_44_2 in pairs(arg_41_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_44_2 then
							local var_44_11 = Mathf.Lerp(iter_44_2.color.r, 1, var_44_10)

							iter_44_2.color = Color.New(var_44_11, var_44_11, var_44_11)
						end
					end
				end
			end

			if arg_41_1.time_ >= var_44_8 + var_44_9 and arg_41_1.time_ < var_44_8 + var_44_9 + arg_44_0 and arg_41_1.var_.actorSpriteComps10022 then
				local var_44_12 = 1

				for iter_44_3, iter_44_4 in pairs(arg_41_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_44_4 then
						iter_44_4.color = Color.New(var_44_12, var_44_12, var_44_12)
					end
				end

				arg_41_1.var_.actorSpriteComps10022 = nil
			end

			local var_44_13 = arg_41_1.actors_["1033"]
			local var_44_14 = 0

			if var_44_14 < arg_41_1.time_ and arg_41_1.time_ <= var_44_14 + arg_44_0 and arg_41_1.var_.actorSpriteComps1033 == nil then
				arg_41_1.var_.actorSpriteComps1033 = var_44_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_44_15 = 0.2

			if var_44_14 <= arg_41_1.time_ and arg_41_1.time_ < var_44_14 + var_44_15 then
				local var_44_16 = (arg_41_1.time_ - var_44_14) / var_44_15

				if arg_41_1.var_.actorSpriteComps1033 then
					for iter_44_5, iter_44_6 in pairs(arg_41_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_44_6 then
							local var_44_17 = Mathf.Lerp(iter_44_6.color.r, 0.5, var_44_16)

							iter_44_6.color = Color.New(var_44_17, var_44_17, var_44_17)
						end
					end
				end
			end

			if arg_41_1.time_ >= var_44_14 + var_44_15 and arg_41_1.time_ < var_44_14 + var_44_15 + arg_44_0 and arg_41_1.var_.actorSpriteComps1033 then
				local var_44_18 = 0.5

				for iter_44_7, iter_44_8 in pairs(arg_41_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_44_8 then
						iter_44_8.color = Color.New(var_44_18, var_44_18, var_44_18)
					end
				end

				arg_41_1.var_.actorSpriteComps1033 = nil
			end

			local var_44_19 = 0
			local var_44_20 = 0.25

			if var_44_19 < arg_41_1.time_ and arg_41_1.time_ <= var_44_19 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_21 = arg_41_1:FormatText(StoryNameCfg[235].name)

				arg_41_1.leftNameTxt_.text = var_44_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_22 = arg_41_1:GetWordFromCfg(900701010)
				local var_44_23 = arg_41_1:FormatText(var_44_22.content)

				arg_41_1.text_.text = var_44_23

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_24 = 10
				local var_44_25 = utf8.len(var_44_23)
				local var_44_26 = var_44_24 <= 0 and var_44_20 or var_44_20 * (var_44_25 / var_44_24)

				if var_44_26 > 0 and var_44_20 < var_44_26 then
					arg_41_1.talkMaxDuration = var_44_26

					if var_44_26 + var_44_19 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_26 + var_44_19
					end
				end

				arg_41_1.text_.text = var_44_23
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)
				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_27 = math.max(var_44_20, arg_41_1.talkMaxDuration)

			if var_44_19 <= arg_41_1.time_ and arg_41_1.time_ < var_44_19 + var_44_27 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_19) / var_44_27

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_19 + var_44_27 and arg_41_1.time_ < var_44_19 + var_44_27 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play900701011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 900701011
		arg_45_1.duration_ = 5

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play900701012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["1033"].transform
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 then
				arg_45_1.var_.moveOldPos1033 = var_48_0.localPosition
				var_48_0.localScale = Vector3.New(1, 1, 1)

				arg_45_1:CheckSpriteTmpPos("1033", 4)

				local var_48_2 = var_48_0.childCount

				for iter_48_0 = 0, var_48_2 - 1 do
					local var_48_3 = var_48_0:GetChild(iter_48_0)

					if var_48_3.name == "split_4" or not string.find(var_48_3.name, "split") then
						var_48_3.gameObject:SetActive(true)
					else
						var_48_3.gameObject:SetActive(false)
					end
				end
			end

			local var_48_4 = 0.001

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_4 then
				local var_48_5 = (arg_45_1.time_ - var_48_1) / var_48_4
				local var_48_6 = Vector3.New(390, -420, 0)

				var_48_0.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1033, var_48_6, var_48_5)
			end

			if arg_45_1.time_ >= var_48_1 + var_48_4 and arg_45_1.time_ < var_48_1 + var_48_4 + arg_48_0 then
				var_48_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_48_7 = arg_45_1.actors_["10022"]
			local var_48_8 = 0

			if var_48_8 < arg_45_1.time_ and arg_45_1.time_ <= var_48_8 + arg_48_0 and arg_45_1.var_.actorSpriteComps10022 == nil then
				arg_45_1.var_.actorSpriteComps10022 = var_48_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_48_9 = 0.2

			if var_48_8 <= arg_45_1.time_ and arg_45_1.time_ < var_48_8 + var_48_9 then
				local var_48_10 = (arg_45_1.time_ - var_48_8) / var_48_9

				if arg_45_1.var_.actorSpriteComps10022 then
					for iter_48_1, iter_48_2 in pairs(arg_45_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_48_2 then
							local var_48_11 = Mathf.Lerp(iter_48_2.color.r, 0.5, var_48_10)

							iter_48_2.color = Color.New(var_48_11, var_48_11, var_48_11)
						end
					end
				end
			end

			if arg_45_1.time_ >= var_48_8 + var_48_9 and arg_45_1.time_ < var_48_8 + var_48_9 + arg_48_0 and arg_45_1.var_.actorSpriteComps10022 then
				local var_48_12 = 0.5

				for iter_48_3, iter_48_4 in pairs(arg_45_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_48_4 then
						iter_48_4.color = Color.New(var_48_12, var_48_12, var_48_12)
					end
				end

				arg_45_1.var_.actorSpriteComps10022 = nil
			end

			local var_48_13 = arg_45_1.actors_["1033"]
			local var_48_14 = 0

			if var_48_14 < arg_45_1.time_ and arg_45_1.time_ <= var_48_14 + arg_48_0 and arg_45_1.var_.actorSpriteComps1033 == nil then
				arg_45_1.var_.actorSpriteComps1033 = var_48_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_48_15 = 0.2

			if var_48_14 <= arg_45_1.time_ and arg_45_1.time_ < var_48_14 + var_48_15 then
				local var_48_16 = (arg_45_1.time_ - var_48_14) / var_48_15

				if arg_45_1.var_.actorSpriteComps1033 then
					for iter_48_5, iter_48_6 in pairs(arg_45_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_48_6 then
							local var_48_17 = Mathf.Lerp(iter_48_6.color.r, 1, var_48_16)

							iter_48_6.color = Color.New(var_48_17, var_48_17, var_48_17)
						end
					end
				end
			end

			if arg_45_1.time_ >= var_48_14 + var_48_15 and arg_45_1.time_ < var_48_14 + var_48_15 + arg_48_0 and arg_45_1.var_.actorSpriteComps1033 then
				local var_48_18 = 1

				for iter_48_7, iter_48_8 in pairs(arg_45_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_48_8 then
						iter_48_8.color = Color.New(var_48_18, var_48_18, var_48_18)
					end
				end

				arg_45_1.var_.actorSpriteComps1033 = nil
			end

			local var_48_19 = 0
			local var_48_20 = 0.075

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

				local var_48_22 = arg_45_1:GetWordFromCfg(900701011)
				local var_48_23 = arg_45_1:FormatText(var_48_22.content)

				arg_45_1.text_.text = var_48_23

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_24 = 3
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
				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_27 = math.max(var_48_20, arg_45_1.talkMaxDuration)

			if var_48_19 <= arg_45_1.time_ and arg_45_1.time_ < var_48_19 + var_48_27 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_19) / var_48_27

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_19 + var_48_27 and arg_45_1.time_ < var_48_19 + var_48_27 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play900701012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 900701012
		arg_49_1.duration_ = 5

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play900701013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1033"].transform
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 then
				arg_49_1.var_.moveOldPos1033 = var_52_0.localPosition
				var_52_0.localScale = Vector3.New(1, 1, 1)

				arg_49_1:CheckSpriteTmpPos("1033", 4)

				local var_52_2 = var_52_0.childCount

				for iter_52_0 = 0, var_52_2 - 1 do
					local var_52_3 = var_52_0:GetChild(iter_52_0)

					if var_52_3.name == "split_2" or not string.find(var_52_3.name, "split") then
						var_52_3.gameObject:SetActive(true)
					else
						var_52_3.gameObject:SetActive(false)
					end
				end
			end

			local var_52_4 = 0.001

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_4 then
				local var_52_5 = (arg_49_1.time_ - var_52_1) / var_52_4
				local var_52_6 = Vector3.New(390, -420, 0)

				var_52_0.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos1033, var_52_6, var_52_5)
			end

			if arg_49_1.time_ >= var_52_1 + var_52_4 and arg_49_1.time_ < var_52_1 + var_52_4 + arg_52_0 then
				var_52_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_52_7 = arg_49_1.actors_["1033"]
			local var_52_8 = 0

			if var_52_8 < arg_49_1.time_ and arg_49_1.time_ <= var_52_8 + arg_52_0 and arg_49_1.var_.actorSpriteComps1033 == nil then
				arg_49_1.var_.actorSpriteComps1033 = var_52_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_52_9 = 0.2

			if var_52_8 <= arg_49_1.time_ and arg_49_1.time_ < var_52_8 + var_52_9 then
				local var_52_10 = (arg_49_1.time_ - var_52_8) / var_52_9

				if arg_49_1.var_.actorSpriteComps1033 then
					for iter_52_1, iter_52_2 in pairs(arg_49_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_52_2 then
							local var_52_11 = Mathf.Lerp(iter_52_2.color.r, 1, var_52_10)

							iter_52_2.color = Color.New(var_52_11, var_52_11, var_52_11)
						end
					end
				end
			end

			if arg_49_1.time_ >= var_52_8 + var_52_9 and arg_49_1.time_ < var_52_8 + var_52_9 + arg_52_0 and arg_49_1.var_.actorSpriteComps1033 then
				local var_52_12 = 1

				for iter_52_3, iter_52_4 in pairs(arg_49_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_52_4 then
						iter_52_4.color = Color.New(var_52_12, var_52_12, var_52_12)
					end
				end

				arg_49_1.var_.actorSpriteComps1033 = nil
			end

			local var_52_13 = arg_49_1.actors_["10022"].transform
			local var_52_14 = 0

			if var_52_14 < arg_49_1.time_ and arg_49_1.time_ <= var_52_14 + arg_52_0 then
				arg_49_1.var_.moveOldPos10022 = var_52_13.localPosition
				var_52_13.localScale = Vector3.New(1, 1, 1)

				arg_49_1:CheckSpriteTmpPos("10022", 2)

				local var_52_15 = var_52_13.childCount

				for iter_52_5 = 0, var_52_15 - 1 do
					local var_52_16 = var_52_13:GetChild(iter_52_5)

					if var_52_16.name == "split_6" or not string.find(var_52_16.name, "split") then
						var_52_16.gameObject:SetActive(true)
					else
						var_52_16.gameObject:SetActive(false)
					end
				end
			end

			local var_52_17 = 0.001

			if var_52_14 <= arg_49_1.time_ and arg_49_1.time_ < var_52_14 + var_52_17 then
				local var_52_18 = (arg_49_1.time_ - var_52_14) / var_52_17
				local var_52_19 = Vector3.New(-390, -350, -180)

				var_52_13.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos10022, var_52_19, var_52_18)
			end

			if arg_49_1.time_ >= var_52_14 + var_52_17 and arg_49_1.time_ < var_52_14 + var_52_17 + arg_52_0 then
				var_52_13.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_52_20 = arg_49_1.actors_["10022"]
			local var_52_21 = 0

			if var_52_21 < arg_49_1.time_ and arg_49_1.time_ <= var_52_21 + arg_52_0 and arg_49_1.var_.actorSpriteComps10022 == nil then
				arg_49_1.var_.actorSpriteComps10022 = var_52_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_52_22 = 0.2

			if var_52_21 <= arg_49_1.time_ and arg_49_1.time_ < var_52_21 + var_52_22 then
				local var_52_23 = (arg_49_1.time_ - var_52_21) / var_52_22

				if arg_49_1.var_.actorSpriteComps10022 then
					for iter_52_6, iter_52_7 in pairs(arg_49_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_52_7 then
							local var_52_24 = Mathf.Lerp(iter_52_7.color.r, 0.5, var_52_23)

							iter_52_7.color = Color.New(var_52_24, var_52_24, var_52_24)
						end
					end
				end
			end

			if arg_49_1.time_ >= var_52_21 + var_52_22 and arg_49_1.time_ < var_52_21 + var_52_22 + arg_52_0 and arg_49_1.var_.actorSpriteComps10022 then
				local var_52_25 = 0.5

				for iter_52_8, iter_52_9 in pairs(arg_49_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_52_9 then
						iter_52_9.color = Color.New(var_52_25, var_52_25, var_52_25)
					end
				end

				arg_49_1.var_.actorSpriteComps10022 = nil
			end

			local var_52_26 = 0
			local var_52_27 = 0.15

			if var_52_26 < arg_49_1.time_ and arg_49_1.time_ <= var_52_26 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_28 = arg_49_1:FormatText(StoryNameCfg[236].name)

				arg_49_1.leftNameTxt_.text = var_52_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_29 = arg_49_1:GetWordFromCfg(900701012)
				local var_52_30 = arg_49_1:FormatText(var_52_29.content)

				arg_49_1.text_.text = var_52_30

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_31 = 6
				local var_52_32 = utf8.len(var_52_30)
				local var_52_33 = var_52_31 <= 0 and var_52_27 or var_52_27 * (var_52_32 / var_52_31)

				if var_52_33 > 0 and var_52_27 < var_52_33 then
					arg_49_1.talkMaxDuration = var_52_33

					if var_52_33 + var_52_26 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_33 + var_52_26
					end
				end

				arg_49_1.text_.text = var_52_30
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)
				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_34 = math.max(var_52_27, arg_49_1.talkMaxDuration)

			if var_52_26 <= arg_49_1.time_ and arg_49_1.time_ < var_52_26 + var_52_34 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_26) / var_52_34

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_26 + var_52_34 and arg_49_1.time_ < var_52_26 + var_52_34 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play900701013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 900701013
		arg_53_1.duration_ = 6.50066666666667

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play900701014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = "F01a"

			if arg_53_1.bgs_[var_56_0] == nil then
				local var_56_1 = Object.Instantiate(arg_53_1.paintGo_)

				var_56_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_56_0)
				var_56_1.name = var_56_0
				var_56_1.transform.parent = arg_53_1.stage_.transform
				var_56_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_53_1.bgs_[var_56_0] = var_56_1
			end

			local var_56_2 = 0.500666666666667

			if var_56_2 < arg_53_1.time_ and arg_53_1.time_ <= var_56_2 + arg_56_0 then
				local var_56_3 = manager.ui.mainCamera.transform.localPosition
				local var_56_4 = Vector3.New(0, 0, 10) + Vector3.New(var_56_3.x, var_56_3.y, 0)
				local var_56_5 = arg_53_1.bgs_.F01a

				var_56_5.transform.localPosition = var_56_4
				var_56_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_56_6 = var_56_5:GetComponent("SpriteRenderer")

				if var_56_6 and var_56_6.sprite then
					local var_56_7 = (var_56_5.transform.localPosition - var_56_3).z
					local var_56_8 = manager.ui.mainCameraCom_
					local var_56_9 = 2 * var_56_7 * Mathf.Tan(var_56_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_56_10 = var_56_9 * var_56_8.aspect
					local var_56_11 = var_56_6.sprite.bounds.size.x
					local var_56_12 = var_56_6.sprite.bounds.size.y
					local var_56_13 = var_56_10 / var_56_11
					local var_56_14 = var_56_9 / var_56_12
					local var_56_15 = var_56_14 < var_56_13 and var_56_13 or var_56_14

					var_56_5.transform.localScale = Vector3.New(var_56_15, var_56_15, 0)
				end

				for iter_56_0, iter_56_1 in pairs(arg_53_1.bgs_) do
					if iter_56_0 ~= "F01a" then
						iter_56_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_56_16 = 0

			if var_56_16 < arg_53_1.time_ and arg_53_1.time_ <= var_56_16 + arg_56_0 then
				arg_53_1.mask_.enabled = true
				arg_53_1.mask_.raycastTarget = true

				arg_53_1:SetGaussion(false)
			end

			local var_56_17 = 0.5

			if var_56_16 <= arg_53_1.time_ and arg_53_1.time_ < var_56_16 + var_56_17 then
				local var_56_18 = (arg_53_1.time_ - var_56_16) / var_56_17
				local var_56_19 = Color.New(1, 1, 1)

				var_56_19.a = Mathf.Lerp(0, 1, var_56_18)
				arg_53_1.mask_.color = var_56_19
			end

			if arg_53_1.time_ >= var_56_16 + var_56_17 and arg_53_1.time_ < var_56_16 + var_56_17 + arg_56_0 then
				local var_56_20 = Color.New(1, 1, 1)

				var_56_20.a = 1
				arg_53_1.mask_.color = var_56_20
			end

			local var_56_21 = 0.500666666666667

			if var_56_21 < arg_53_1.time_ and arg_53_1.time_ <= var_56_21 + arg_56_0 then
				arg_53_1.mask_.enabled = true
				arg_53_1.mask_.raycastTarget = true

				arg_53_1:SetGaussion(false)
			end

			local var_56_22 = 1

			if var_56_21 <= arg_53_1.time_ and arg_53_1.time_ < var_56_21 + var_56_22 then
				local var_56_23 = (arg_53_1.time_ - var_56_21) / var_56_22
				local var_56_24 = Color.New(1, 1, 1)

				var_56_24.a = Mathf.Lerp(1, 0, var_56_23)
				arg_53_1.mask_.color = var_56_24
			end

			if arg_53_1.time_ >= var_56_21 + var_56_22 and arg_53_1.time_ < var_56_21 + var_56_22 + arg_56_0 then
				local var_56_25 = Color.New(1, 1, 1)
				local var_56_26 = 0

				arg_53_1.mask_.enabled = false
				var_56_25.a = var_56_26
				arg_53_1.mask_.color = var_56_25
			end

			local var_56_27 = arg_53_1.actors_["1033"].transform
			local var_56_28 = 0.466666666666667

			if var_56_28 < arg_53_1.time_ and arg_53_1.time_ <= var_56_28 + arg_56_0 then
				arg_53_1.var_.moveOldPos1033 = var_56_27.localPosition
				var_56_27.localScale = Vector3.New(1, 1, 1)

				arg_53_1:CheckSpriteTmpPos("1033", 7)

				local var_56_29 = var_56_27.childCount

				for iter_56_2 = 0, var_56_29 - 1 do
					local var_56_30 = var_56_27:GetChild(iter_56_2)

					if var_56_30.name == "split_2" or not string.find(var_56_30.name, "split") then
						var_56_30.gameObject:SetActive(true)
					else
						var_56_30.gameObject:SetActive(false)
					end
				end
			end

			local var_56_31 = 0.001

			if var_56_28 <= arg_53_1.time_ and arg_53_1.time_ < var_56_28 + var_56_31 then
				local var_56_32 = (arg_53_1.time_ - var_56_28) / var_56_31
				local var_56_33 = Vector3.New(0, -2000, 0)

				var_56_27.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos1033, var_56_33, var_56_32)
			end

			if arg_53_1.time_ >= var_56_28 + var_56_31 and arg_53_1.time_ < var_56_28 + var_56_31 + arg_56_0 then
				var_56_27.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_56_34 = arg_53_1.actors_["1033"].transform
			local var_56_35 = 1.36666666666667

			if var_56_35 < arg_53_1.time_ and arg_53_1.time_ <= var_56_35 + arg_56_0 then
				arg_53_1.var_.moveOldPos1033 = var_56_34.localPosition
				var_56_34.localScale = Vector3.New(1, 1, 1)

				arg_53_1:CheckSpriteTmpPos("1033", 2)

				local var_56_36 = var_56_34.childCount

				for iter_56_3 = 0, var_56_36 - 1 do
					local var_56_37 = var_56_34:GetChild(iter_56_3)

					if var_56_37.name == "split_1" or not string.find(var_56_37.name, "split") then
						var_56_37.gameObject:SetActive(true)
					else
						var_56_37.gameObject:SetActive(false)
					end
				end
			end

			local var_56_38 = 0.001

			if var_56_35 <= arg_53_1.time_ and arg_53_1.time_ < var_56_35 + var_56_38 then
				local var_56_39 = (arg_53_1.time_ - var_56_35) / var_56_38
				local var_56_40 = Vector3.New(-390, -420, 0)

				var_56_34.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos1033, var_56_40, var_56_39)
			end

			if arg_53_1.time_ >= var_56_35 + var_56_38 and arg_53_1.time_ < var_56_35 + var_56_38 + arg_56_0 then
				var_56_34.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_56_41 = arg_53_1.actors_["10022"].transform
			local var_56_42 = 0.466666666666667

			if var_56_42 < arg_53_1.time_ and arg_53_1.time_ <= var_56_42 + arg_56_0 then
				arg_53_1.var_.moveOldPos10022 = var_56_41.localPosition
				var_56_41.localScale = Vector3.New(1, 1, 1)

				arg_53_1:CheckSpriteTmpPos("10022", 7)

				local var_56_43 = var_56_41.childCount

				for iter_56_4 = 0, var_56_43 - 1 do
					local var_56_44 = var_56_41:GetChild(iter_56_4)

					if var_56_44.name == "split_6" or not string.find(var_56_44.name, "split") then
						var_56_44.gameObject:SetActive(true)
					else
						var_56_44.gameObject:SetActive(false)
					end
				end
			end

			local var_56_45 = 0.001

			if var_56_42 <= arg_53_1.time_ and arg_53_1.time_ < var_56_42 + var_56_45 then
				local var_56_46 = (arg_53_1.time_ - var_56_42) / var_56_45
				local var_56_47 = Vector3.New(0, -2000, -180)

				var_56_41.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos10022, var_56_47, var_56_46)
			end

			if arg_53_1.time_ >= var_56_42 + var_56_45 and arg_53_1.time_ < var_56_42 + var_56_45 + arg_56_0 then
				var_56_41.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_56_48 = "1038"

			if arg_53_1.actors_[var_56_48] == nil then
				local var_56_49 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_56_48), arg_53_1.canvasGo_.transform)

				var_56_49.transform:SetSiblingIndex(1)

				var_56_49.name = var_56_48
				var_56_49.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_53_1.actors_[var_56_48] = var_56_49
			end

			local var_56_50 = arg_53_1.actors_["1038"].transform
			local var_56_51 = 1.36666666666667

			if var_56_51 < arg_53_1.time_ and arg_53_1.time_ <= var_56_51 + arg_56_0 then
				arg_53_1.var_.moveOldPos1038 = var_56_50.localPosition
				var_56_50.localScale = Vector3.New(1, 1, 1)

				arg_53_1:CheckSpriteTmpPos("1038", 4)

				local var_56_52 = var_56_50.childCount

				for iter_56_5 = 0, var_56_52 - 1 do
					local var_56_53 = var_56_50:GetChild(iter_56_5)

					if var_56_53.name == "split_1" or not string.find(var_56_53.name, "split") then
						var_56_53.gameObject:SetActive(true)
					else
						var_56_53.gameObject:SetActive(false)
					end
				end
			end

			local var_56_54 = 0.001

			if var_56_51 <= arg_53_1.time_ and arg_53_1.time_ < var_56_51 + var_56_54 then
				local var_56_55 = (arg_53_1.time_ - var_56_51) / var_56_54
				local var_56_56 = Vector3.New(390, -400, 0)

				var_56_50.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos1038, var_56_56, var_56_55)
			end

			if arg_53_1.time_ >= var_56_51 + var_56_54 and arg_53_1.time_ < var_56_51 + var_56_54 + arg_56_0 then
				var_56_50.localPosition = Vector3.New(390, -400, 0)
			end

			local var_56_57 = arg_53_1.actors_["1038"]
			local var_56_58 = 1.36666666666667

			if var_56_58 < arg_53_1.time_ and arg_53_1.time_ <= var_56_58 + arg_56_0 and arg_53_1.var_.actorSpriteComps1038 == nil then
				arg_53_1.var_.actorSpriteComps1038 = var_56_57:GetComponentsInChildren(typeof(Image), true)
			end

			local var_56_59 = 0.034

			if var_56_58 <= arg_53_1.time_ and arg_53_1.time_ < var_56_58 + var_56_59 then
				local var_56_60 = (arg_53_1.time_ - var_56_58) / var_56_59

				if arg_53_1.var_.actorSpriteComps1038 then
					for iter_56_6, iter_56_7 in pairs(arg_53_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_56_7 then
							local var_56_61 = Mathf.Lerp(iter_56_7.color.r, 0.5, var_56_60)

							iter_56_7.color = Color.New(var_56_61, var_56_61, var_56_61)
						end
					end
				end
			end

			if arg_53_1.time_ >= var_56_58 + var_56_59 and arg_53_1.time_ < var_56_58 + var_56_59 + arg_56_0 and arg_53_1.var_.actorSpriteComps1038 then
				local var_56_62 = 0.5

				for iter_56_8, iter_56_9 in pairs(arg_53_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_56_9 then
						iter_56_9.color = Color.New(var_56_62, var_56_62, var_56_62)
					end
				end

				arg_53_1.var_.actorSpriteComps1038 = nil
			end

			local var_56_63 = arg_53_1.actors_["1033"]
			local var_56_64 = 1.36666666666667

			if var_56_64 < arg_53_1.time_ and arg_53_1.time_ <= var_56_64 + arg_56_0 and arg_53_1.var_.actorSpriteComps1033 == nil then
				arg_53_1.var_.actorSpriteComps1033 = var_56_63:GetComponentsInChildren(typeof(Image), true)
			end

			local var_56_65 = 0.034

			if var_56_64 <= arg_53_1.time_ and arg_53_1.time_ < var_56_64 + var_56_65 then
				local var_56_66 = (arg_53_1.time_ - var_56_64) / var_56_65

				if arg_53_1.var_.actorSpriteComps1033 then
					for iter_56_10, iter_56_11 in pairs(arg_53_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_56_11 then
							local var_56_67 = Mathf.Lerp(iter_56_11.color.r, 1, var_56_66)

							iter_56_11.color = Color.New(var_56_67, var_56_67, var_56_67)
						end
					end
				end
			end

			if arg_53_1.time_ >= var_56_64 + var_56_65 and arg_53_1.time_ < var_56_64 + var_56_65 + arg_56_0 and arg_53_1.var_.actorSpriteComps1033 then
				local var_56_68 = 1

				for iter_56_12, iter_56_13 in pairs(arg_53_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_56_13 then
						iter_56_13.color = Color.New(var_56_68, var_56_68, var_56_68)
					end
				end

				arg_53_1.var_.actorSpriteComps1033 = nil
			end

			local var_56_69 = arg_53_1.actors_["1033"]
			local var_56_70 = 1.36666666666667

			if var_56_70 < arg_53_1.time_ and arg_53_1.time_ <= var_56_70 + arg_56_0 then
				local var_56_71 = var_56_69:GetComponentInChildren(typeof(CanvasGroup))

				if var_56_71 then
					arg_53_1.var_.alphaOldValue1033 = var_56_71.alpha
					arg_53_1.var_.characterEffect1033 = var_56_71
				end

				arg_53_1.var_.alphaOldValue1033 = 0
			end

			local var_56_72 = 0.2

			if var_56_70 <= arg_53_1.time_ and arg_53_1.time_ < var_56_70 + var_56_72 then
				local var_56_73 = (arg_53_1.time_ - var_56_70) / var_56_72
				local var_56_74 = Mathf.Lerp(arg_53_1.var_.alphaOldValue1033, 1, var_56_73)

				if arg_53_1.var_.characterEffect1033 then
					arg_53_1.var_.characterEffect1033.alpha = var_56_74
				end
			end

			if arg_53_1.time_ >= var_56_70 + var_56_72 and arg_53_1.time_ < var_56_70 + var_56_72 + arg_56_0 and arg_53_1.var_.characterEffect1033 then
				arg_53_1.var_.characterEffect1033.alpha = 1
			end

			local var_56_75 = arg_53_1.actors_["1038"]
			local var_56_76 = 1.36666666666667

			if var_56_76 < arg_53_1.time_ and arg_53_1.time_ <= var_56_76 + arg_56_0 then
				local var_56_77 = var_56_75:GetComponentInChildren(typeof(CanvasGroup))

				if var_56_77 then
					arg_53_1.var_.alphaOldValue1038 = var_56_77.alpha
					arg_53_1.var_.characterEffect1038 = var_56_77
				end

				arg_53_1.var_.alphaOldValue1038 = 0
			end

			local var_56_78 = 0.2

			if var_56_76 <= arg_53_1.time_ and arg_53_1.time_ < var_56_76 + var_56_78 then
				local var_56_79 = (arg_53_1.time_ - var_56_76) / var_56_78
				local var_56_80 = Mathf.Lerp(arg_53_1.var_.alphaOldValue1038, 1, var_56_79)

				if arg_53_1.var_.characterEffect1038 then
					arg_53_1.var_.characterEffect1038.alpha = var_56_80
				end
			end

			if arg_53_1.time_ >= var_56_76 + var_56_78 and arg_53_1.time_ < var_56_76 + var_56_78 + arg_56_0 and arg_53_1.var_.characterEffect1038 then
				arg_53_1.var_.characterEffect1038.alpha = 1
			end

			if arg_53_1.frameCnt_ <= 1 then
				arg_53_1.dialog_:SetActive(false)
			end

			local var_56_81 = 1.50066666666667
			local var_56_82 = 0.675

			if var_56_81 < arg_53_1.time_ and arg_53_1.time_ <= var_56_81 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0

				arg_53_1.dialog_:SetActive(true)

				local var_56_83 = LeanTween.value(arg_53_1.dialog_, 0, 1, 0.3)

				var_56_83:setOnUpdate(LuaHelper.FloatAction(function(arg_57_0)
					arg_53_1.dialogCg_.alpha = arg_57_0
				end))
				var_56_83:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_53_1.dialog_)
					var_56_83:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_53_1.duration_ = arg_53_1.duration_ + 0.3

				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_84 = arg_53_1:FormatText(StoryNameCfg[236].name)

				arg_53_1.leftNameTxt_.text = var_56_84

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_85 = arg_53_1:GetWordFromCfg(900701013)
				local var_56_86 = arg_53_1:FormatText(var_56_85.content)

				arg_53_1.text_.text = var_56_86

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_87 = 27
				local var_56_88 = utf8.len(var_56_86)
				local var_56_89 = var_56_87 <= 0 and var_56_82 or var_56_82 * (var_56_88 / var_56_87)

				if var_56_89 > 0 and var_56_82 < var_56_89 then
					arg_53_1.talkMaxDuration = var_56_89
					var_56_81 = var_56_81 + 0.3

					if var_56_89 + var_56_81 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_89 + var_56_81
					end
				end

				arg_53_1.text_.text = var_56_86
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)
				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_90 = var_56_81 + 0.3
			local var_56_91 = math.max(var_56_82, arg_53_1.talkMaxDuration)

			if var_56_90 <= arg_53_1.time_ and arg_53_1.time_ < var_56_90 + var_56_91 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_90) / var_56_91

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_90 + var_56_91 and arg_53_1.time_ < var_56_90 + var_56_91 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play900701014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 900701014
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play900701015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1038"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.actorSpriteComps1038 == nil then
				arg_59_1.var_.actorSpriteComps1038 = var_62_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_2 = 0.2

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.actorSpriteComps1038 then
					for iter_62_0, iter_62_1 in pairs(arg_59_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_62_1 then
							local var_62_4 = Mathf.Lerp(iter_62_1.color.r, 1, var_62_3)

							iter_62_1.color = Color.New(var_62_4, var_62_4, var_62_4)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.actorSpriteComps1038 then
				local var_62_5 = 1

				for iter_62_2, iter_62_3 in pairs(arg_59_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_62_3 then
						iter_62_3.color = Color.New(var_62_5, var_62_5, var_62_5)
					end
				end

				arg_59_1.var_.actorSpriteComps1038 = nil
			end

			local var_62_6 = arg_59_1.actors_["1033"]
			local var_62_7 = 0

			if var_62_7 < arg_59_1.time_ and arg_59_1.time_ <= var_62_7 + arg_62_0 and arg_59_1.var_.actorSpriteComps1033 == nil then
				arg_59_1.var_.actorSpriteComps1033 = var_62_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_8 = 0.2

			if var_62_7 <= arg_59_1.time_ and arg_59_1.time_ < var_62_7 + var_62_8 then
				local var_62_9 = (arg_59_1.time_ - var_62_7) / var_62_8

				if arg_59_1.var_.actorSpriteComps1033 then
					for iter_62_4, iter_62_5 in pairs(arg_59_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_62_5 then
							local var_62_10 = Mathf.Lerp(iter_62_5.color.r, 0.5, var_62_9)

							iter_62_5.color = Color.New(var_62_10, var_62_10, var_62_10)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_7 + var_62_8 and arg_59_1.time_ < var_62_7 + var_62_8 + arg_62_0 and arg_59_1.var_.actorSpriteComps1033 then
				local var_62_11 = 0.5

				for iter_62_6, iter_62_7 in pairs(arg_59_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_62_7 then
						iter_62_7.color = Color.New(var_62_11, var_62_11, var_62_11)
					end
				end

				arg_59_1.var_.actorSpriteComps1033 = nil
			end

			local var_62_12 = 0
			local var_62_13 = 0.7

			if var_62_12 < arg_59_1.time_ and arg_59_1.time_ <= var_62_12 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_14 = arg_59_1:FormatText(StoryNameCfg[94].name)

				arg_59_1.leftNameTxt_.text = var_62_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_15 = arg_59_1:GetWordFromCfg(900701014)
				local var_62_16 = arg_59_1:FormatText(var_62_15.content)

				arg_59_1.text_.text = var_62_16

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_17 = 28
				local var_62_18 = utf8.len(var_62_16)
				local var_62_19 = var_62_17 <= 0 and var_62_13 or var_62_13 * (var_62_18 / var_62_17)

				if var_62_19 > 0 and var_62_13 < var_62_19 then
					arg_59_1.talkMaxDuration = var_62_19

					if var_62_19 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_19 + var_62_12
					end
				end

				arg_59_1.text_.text = var_62_16
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_20 = math.max(var_62_13, arg_59_1.talkMaxDuration)

			if var_62_12 <= arg_59_1.time_ and arg_59_1.time_ < var_62_12 + var_62_20 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_12) / var_62_20

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_12 + var_62_20 and arg_59_1.time_ < var_62_12 + var_62_20 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play900701015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 900701015
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play900701016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1038"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.actorSpriteComps1038 == nil then
				arg_63_1.var_.actorSpriteComps1038 = var_66_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_2 = 0.2

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.actorSpriteComps1038 then
					for iter_66_0, iter_66_1 in pairs(arg_63_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_66_1 then
							local var_66_4 = Mathf.Lerp(iter_66_1.color.r, 0.5, var_66_3)

							iter_66_1.color = Color.New(var_66_4, var_66_4, var_66_4)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.actorSpriteComps1038 then
				local var_66_5 = 0.5

				for iter_66_2, iter_66_3 in pairs(arg_63_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_66_3 then
						iter_66_3.color = Color.New(var_66_5, var_66_5, var_66_5)
					end
				end

				arg_63_1.var_.actorSpriteComps1038 = nil
			end

			local var_66_6 = arg_63_1.actors_["1033"]
			local var_66_7 = 0

			if var_66_7 < arg_63_1.time_ and arg_63_1.time_ <= var_66_7 + arg_66_0 and arg_63_1.var_.actorSpriteComps1033 == nil then
				arg_63_1.var_.actorSpriteComps1033 = var_66_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_8 = 0.2

			if var_66_7 <= arg_63_1.time_ and arg_63_1.time_ < var_66_7 + var_66_8 then
				local var_66_9 = (arg_63_1.time_ - var_66_7) / var_66_8

				if arg_63_1.var_.actorSpriteComps1033 then
					for iter_66_4, iter_66_5 in pairs(arg_63_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_66_5 then
							local var_66_10 = Mathf.Lerp(iter_66_5.color.r, 1, var_66_9)

							iter_66_5.color = Color.New(var_66_10, var_66_10, var_66_10)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_7 + var_66_8 and arg_63_1.time_ < var_66_7 + var_66_8 + arg_66_0 and arg_63_1.var_.actorSpriteComps1033 then
				local var_66_11 = 1

				for iter_66_6, iter_66_7 in pairs(arg_63_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_66_7 then
						iter_66_7.color = Color.New(var_66_11, var_66_11, var_66_11)
					end
				end

				arg_63_1.var_.actorSpriteComps1033 = nil
			end

			local var_66_12 = 0
			local var_66_13 = 0.975

			if var_66_12 < arg_63_1.time_ and arg_63_1.time_ <= var_66_12 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_14 = arg_63_1:FormatText(StoryNameCfg[236].name)

				arg_63_1.leftNameTxt_.text = var_66_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_15 = arg_63_1:GetWordFromCfg(900701015)
				local var_66_16 = arg_63_1:FormatText(var_66_15.content)

				arg_63_1.text_.text = var_66_16

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_17 = 39
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
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_20 = math.max(var_66_13, arg_63_1.talkMaxDuration)

			if var_66_12 <= arg_63_1.time_ and arg_63_1.time_ < var_66_12 + var_66_20 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_12) / var_66_20

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_12 + var_66_20 and arg_63_1.time_ < var_66_12 + var_66_20 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play900701016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 900701016
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play900701017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 1.025

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_2 = arg_67_1:FormatText(StoryNameCfg[236].name)

				arg_67_1.leftNameTxt_.text = var_70_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_3 = arg_67_1:GetWordFromCfg(900701016)
				local var_70_4 = arg_67_1:FormatText(var_70_3.content)

				arg_67_1.text_.text = var_70_4

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_5 = 41
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
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_8 = math.max(var_70_1, arg_67_1.talkMaxDuration)

			if var_70_0 <= arg_67_1.time_ and arg_67_1.time_ < var_70_0 + var_70_8 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_0) / var_70_8

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_0 + var_70_8 and arg_67_1.time_ < var_70_0 + var_70_8 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play900701017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 900701017
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play900701018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1033"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1033 = var_74_0.localPosition
				var_74_0.localScale = Vector3.New(1, 1, 1)

				arg_71_1:CheckSpriteTmpPos("1033", 2)

				local var_74_2 = var_74_0.childCount

				for iter_74_0 = 0, var_74_2 - 1 do
					local var_74_3 = var_74_0:GetChild(iter_74_0)

					if var_74_3.name == "split_2" or not string.find(var_74_3.name, "split") then
						var_74_3.gameObject:SetActive(true)
					else
						var_74_3.gameObject:SetActive(false)
					end
				end
			end

			local var_74_4 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_4 then
				local var_74_5 = (arg_71_1.time_ - var_74_1) / var_74_4
				local var_74_6 = Vector3.New(-390, -420, 0)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1033, var_74_6, var_74_5)
			end

			if arg_71_1.time_ >= var_74_1 + var_74_4 and arg_71_1.time_ < var_74_1 + var_74_4 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_74_7 = 0
			local var_74_8 = 0.175

			if var_74_7 < arg_71_1.time_ and arg_71_1.time_ <= var_74_7 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_9 = arg_71_1:FormatText(StoryNameCfg[236].name)

				arg_71_1.leftNameTxt_.text = var_74_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_10 = arg_71_1:GetWordFromCfg(900701017)
				local var_74_11 = arg_71_1:FormatText(var_74_10.content)

				arg_71_1.text_.text = var_74_11

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_12 = 7
				local var_74_13 = utf8.len(var_74_11)
				local var_74_14 = var_74_12 <= 0 and var_74_8 or var_74_8 * (var_74_13 / var_74_12)

				if var_74_14 > 0 and var_74_8 < var_74_14 then
					arg_71_1.talkMaxDuration = var_74_14

					if var_74_14 + var_74_7 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_14 + var_74_7
					end
				end

				arg_71_1.text_.text = var_74_11
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_15 = math.max(var_74_8, arg_71_1.talkMaxDuration)

			if var_74_7 <= arg_71_1.time_ and arg_71_1.time_ < var_74_7 + var_74_15 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_7) / var_74_15

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_7 + var_74_15 and arg_71_1.time_ < var_74_7 + var_74_15 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play900701018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 900701018
		arg_75_1.duration_ = 6.33333333333333

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play900701019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0.5

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				local var_78_1 = manager.ui.mainCamera.transform.localPosition
				local var_78_2 = Vector3.New(0, 0, 10) + Vector3.New(var_78_1.x, var_78_1.y, 0)
				local var_78_3 = arg_75_1.bgs_.ST22a

				var_78_3.transform.localPosition = var_78_2
				var_78_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_78_4 = var_78_3:GetComponent("SpriteRenderer")

				if var_78_4 and var_78_4.sprite then
					local var_78_5 = (var_78_3.transform.localPosition - var_78_1).z
					local var_78_6 = manager.ui.mainCameraCom_
					local var_78_7 = 2 * var_78_5 * Mathf.Tan(var_78_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_78_8 = var_78_7 * var_78_6.aspect
					local var_78_9 = var_78_4.sprite.bounds.size.x
					local var_78_10 = var_78_4.sprite.bounds.size.y
					local var_78_11 = var_78_8 / var_78_9
					local var_78_12 = var_78_7 / var_78_10
					local var_78_13 = var_78_12 < var_78_11 and var_78_11 or var_78_12

					var_78_3.transform.localScale = Vector3.New(var_78_13, var_78_13, 0)
				end

				for iter_78_0, iter_78_1 in pairs(arg_75_1.bgs_) do
					if iter_78_0 ~= "ST22a" then
						iter_78_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 then
				arg_75_1.mask_.enabled = true
				arg_75_1.mask_.raycastTarget = true

				arg_75_1:SetGaussion(false)
			end

			local var_78_15 = 0.5

			if var_78_14 <= arg_75_1.time_ and arg_75_1.time_ < var_78_14 + var_78_15 then
				local var_78_16 = (arg_75_1.time_ - var_78_14) / var_78_15
				local var_78_17 = Color.New(1, 1, 1)

				var_78_17.a = Mathf.Lerp(0, 1, var_78_16)
				arg_75_1.mask_.color = var_78_17
			end

			if arg_75_1.time_ >= var_78_14 + var_78_15 and arg_75_1.time_ < var_78_14 + var_78_15 + arg_78_0 then
				local var_78_18 = Color.New(1, 1, 1)

				var_78_18.a = 1
				arg_75_1.mask_.color = var_78_18
			end

			local var_78_19 = 0.5

			if var_78_19 < arg_75_1.time_ and arg_75_1.time_ <= var_78_19 + arg_78_0 then
				arg_75_1.mask_.enabled = true
				arg_75_1.mask_.raycastTarget = true

				arg_75_1:SetGaussion(false)
			end

			local var_78_20 = 1

			if var_78_19 <= arg_75_1.time_ and arg_75_1.time_ < var_78_19 + var_78_20 then
				local var_78_21 = (arg_75_1.time_ - var_78_19) / var_78_20
				local var_78_22 = Color.New(1, 1, 1)

				var_78_22.a = Mathf.Lerp(1, 0, var_78_21)
				arg_75_1.mask_.color = var_78_22
			end

			if arg_75_1.time_ >= var_78_19 + var_78_20 and arg_75_1.time_ < var_78_19 + var_78_20 + arg_78_0 then
				local var_78_23 = Color.New(1, 1, 1)
				local var_78_24 = 0

				arg_75_1.mask_.enabled = false
				var_78_23.a = var_78_24
				arg_75_1.mask_.color = var_78_23
			end

			local var_78_25 = arg_75_1.actors_["1033"].transform
			local var_78_26 = 0.466666666666667

			if var_78_26 < arg_75_1.time_ and arg_75_1.time_ <= var_78_26 + arg_78_0 then
				arg_75_1.var_.moveOldPos1033 = var_78_25.localPosition
				var_78_25.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("1033", 7)

				local var_78_27 = var_78_25.childCount

				for iter_78_2 = 0, var_78_27 - 1 do
					local var_78_28 = var_78_25:GetChild(iter_78_2)

					if var_78_28.name == "split_1" or not string.find(var_78_28.name, "split") then
						var_78_28.gameObject:SetActive(true)
					else
						var_78_28.gameObject:SetActive(false)
					end
				end
			end

			local var_78_29 = 0.001

			if var_78_26 <= arg_75_1.time_ and arg_75_1.time_ < var_78_26 + var_78_29 then
				local var_78_30 = (arg_75_1.time_ - var_78_26) / var_78_29
				local var_78_31 = Vector3.New(0, -2000, 0)

				var_78_25.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1033, var_78_31, var_78_30)
			end

			if arg_75_1.time_ >= var_78_26 + var_78_29 and arg_75_1.time_ < var_78_26 + var_78_29 + arg_78_0 then
				var_78_25.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_78_32 = arg_75_1.actors_["1033"].transform
			local var_78_33 = 0.500666666666667

			if var_78_33 < arg_75_1.time_ and arg_75_1.time_ <= var_78_33 + arg_78_0 then
				arg_75_1.var_.moveOldPos1033 = var_78_32.localPosition
				var_78_32.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("1033", 4)

				local var_78_34 = var_78_32.childCount

				for iter_78_3 = 0, var_78_34 - 1 do
					local var_78_35 = var_78_32:GetChild(iter_78_3)

					if var_78_35.name == "split_2" or not string.find(var_78_35.name, "split") then
						var_78_35.gameObject:SetActive(true)
					else
						var_78_35.gameObject:SetActive(false)
					end
				end
			end

			local var_78_36 = 0.001

			if var_78_33 <= arg_75_1.time_ and arg_75_1.time_ < var_78_33 + var_78_36 then
				local var_78_37 = (arg_75_1.time_ - var_78_33) / var_78_36
				local var_78_38 = Vector3.New(390, -420, 0)

				var_78_32.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1033, var_78_38, var_78_37)
			end

			if arg_75_1.time_ >= var_78_33 + var_78_36 and arg_75_1.time_ < var_78_33 + var_78_36 + arg_78_0 then
				var_78_32.localPosition = Vector3.New(390, -420, 0)
			end

			local var_78_39 = arg_75_1.actors_["1038"].transform
			local var_78_40 = 0.466666666666667

			if var_78_40 < arg_75_1.time_ and arg_75_1.time_ <= var_78_40 + arg_78_0 then
				arg_75_1.var_.moveOldPos1038 = var_78_39.localPosition
				var_78_39.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("1038", 7)

				local var_78_41 = var_78_39.childCount

				for iter_78_4 = 0, var_78_41 - 1 do
					local var_78_42 = var_78_39:GetChild(iter_78_4)

					if var_78_42.name == "split_1" or not string.find(var_78_42.name, "split") then
						var_78_42.gameObject:SetActive(true)
					else
						var_78_42.gameObject:SetActive(false)
					end
				end
			end

			local var_78_43 = 0.001

			if var_78_40 <= arg_75_1.time_ and arg_75_1.time_ < var_78_40 + var_78_43 then
				local var_78_44 = (arg_75_1.time_ - var_78_40) / var_78_43
				local var_78_45 = Vector3.New(0, -2000, 0)

				var_78_39.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1038, var_78_45, var_78_44)
			end

			if arg_75_1.time_ >= var_78_40 + var_78_43 and arg_75_1.time_ < var_78_40 + var_78_43 + arg_78_0 then
				var_78_39.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_78_46 = arg_75_1.actors_["10022"].transform
			local var_78_47 = 0.500666666666667

			if var_78_47 < arg_75_1.time_ and arg_75_1.time_ <= var_78_47 + arg_78_0 then
				arg_75_1.var_.moveOldPos10022 = var_78_46.localPosition
				var_78_46.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("10022", 2)

				local var_78_48 = var_78_46.childCount

				for iter_78_5 = 0, var_78_48 - 1 do
					local var_78_49 = var_78_46:GetChild(iter_78_5)

					if var_78_49.name == "split_6" or not string.find(var_78_49.name, "split") then
						var_78_49.gameObject:SetActive(true)
					else
						var_78_49.gameObject:SetActive(false)
					end
				end
			end

			local var_78_50 = 0.001

			if var_78_47 <= arg_75_1.time_ and arg_75_1.time_ < var_78_47 + var_78_50 then
				local var_78_51 = (arg_75_1.time_ - var_78_47) / var_78_50
				local var_78_52 = Vector3.New(-390, -350, -180)

				var_78_46.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10022, var_78_52, var_78_51)
			end

			if arg_75_1.time_ >= var_78_47 + var_78_50 and arg_75_1.time_ < var_78_47 + var_78_50 + arg_78_0 then
				var_78_46.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_78_53 = arg_75_1.actors_["10022"]
			local var_78_54 = 0.5

			if var_78_54 < arg_75_1.time_ and arg_75_1.time_ <= var_78_54 + arg_78_0 and arg_75_1.var_.actorSpriteComps10022 == nil then
				arg_75_1.var_.actorSpriteComps10022 = var_78_53:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_55 = 0.0346666666666666

			if var_78_54 <= arg_75_1.time_ and arg_75_1.time_ < var_78_54 + var_78_55 then
				local var_78_56 = (arg_75_1.time_ - var_78_54) / var_78_55

				if arg_75_1.var_.actorSpriteComps10022 then
					for iter_78_6, iter_78_7 in pairs(arg_75_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_78_7 then
							local var_78_57 = Mathf.Lerp(iter_78_7.color.r, 0.5, var_78_56)

							iter_78_7.color = Color.New(var_78_57, var_78_57, var_78_57)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_54 + var_78_55 and arg_75_1.time_ < var_78_54 + var_78_55 + arg_78_0 and arg_75_1.var_.actorSpriteComps10022 then
				local var_78_58 = 0.5

				for iter_78_8, iter_78_9 in pairs(arg_75_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_78_9 then
						iter_78_9.color = Color.New(var_78_58, var_78_58, var_78_58)
					end
				end

				arg_75_1.var_.actorSpriteComps10022 = nil
			end

			local var_78_59 = arg_75_1.actors_["1033"]
			local var_78_60 = 0.5

			if var_78_60 < arg_75_1.time_ and arg_75_1.time_ <= var_78_60 + arg_78_0 and arg_75_1.var_.actorSpriteComps1033 == nil then
				arg_75_1.var_.actorSpriteComps1033 = var_78_59:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_61 = 0.034

			if var_78_60 <= arg_75_1.time_ and arg_75_1.time_ < var_78_60 + var_78_61 then
				local var_78_62 = (arg_75_1.time_ - var_78_60) / var_78_61

				if arg_75_1.var_.actorSpriteComps1033 then
					for iter_78_10, iter_78_11 in pairs(arg_75_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_78_11 then
							local var_78_63 = Mathf.Lerp(iter_78_11.color.r, 1, var_78_62)

							iter_78_11.color = Color.New(var_78_63, var_78_63, var_78_63)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_60 + var_78_61 and arg_75_1.time_ < var_78_60 + var_78_61 + arg_78_0 and arg_75_1.var_.actorSpriteComps1033 then
				local var_78_64 = 1

				for iter_78_12, iter_78_13 in pairs(arg_75_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_78_13 then
						iter_78_13.color = Color.New(var_78_64, var_78_64, var_78_64)
					end
				end

				arg_75_1.var_.actorSpriteComps1033 = nil
			end

			if arg_75_1.frameCnt_ <= 1 then
				arg_75_1.dialog_:SetActive(false)
			end

			local var_78_65 = 1.33333333333333
			local var_78_66 = 0.825

			if var_78_65 < arg_75_1.time_ and arg_75_1.time_ <= var_78_65 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0

				arg_75_1.dialog_:SetActive(true)

				local var_78_67 = LeanTween.value(arg_75_1.dialog_, 0, 1, 0.3)

				var_78_67:setOnUpdate(LuaHelper.FloatAction(function(arg_79_0)
					arg_75_1.dialogCg_.alpha = arg_79_0
				end))
				var_78_67:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_75_1.dialog_)
					var_78_67:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_75_1.duration_ = arg_75_1.duration_ + 0.3

				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_68 = arg_75_1:FormatText(StoryNameCfg[236].name)

				arg_75_1.leftNameTxt_.text = var_78_68

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_69 = arg_75_1:GetWordFromCfg(900701018)
				local var_78_70 = arg_75_1:FormatText(var_78_69.content)

				arg_75_1.text_.text = var_78_70

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_71 = 33
				local var_78_72 = utf8.len(var_78_70)
				local var_78_73 = var_78_71 <= 0 and var_78_66 or var_78_66 * (var_78_72 / var_78_71)

				if var_78_73 > 0 and var_78_66 < var_78_73 then
					arg_75_1.talkMaxDuration = var_78_73
					var_78_65 = var_78_65 + 0.3

					if var_78_73 + var_78_65 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_73 + var_78_65
					end
				end

				arg_75_1.text_.text = var_78_70
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_74 = var_78_65 + 0.3
			local var_78_75 = math.max(var_78_66, arg_75_1.talkMaxDuration)

			if var_78_74 <= arg_75_1.time_ and arg_75_1.time_ < var_78_74 + var_78_75 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_74) / var_78_75

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_74 + var_78_75 and arg_75_1.time_ < var_78_74 + var_78_75 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play900701019 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 900701019
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play900701020(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["1033"].transform
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				arg_81_1.var_.moveOldPos1033 = var_84_0.localPosition
				var_84_0.localScale = Vector3.New(1, 1, 1)

				arg_81_1:CheckSpriteTmpPos("1033", 4)

				local var_84_2 = var_84_0.childCount

				for iter_84_0 = 0, var_84_2 - 1 do
					local var_84_3 = var_84_0:GetChild(iter_84_0)

					if var_84_3.name == "split_5" or not string.find(var_84_3.name, "split") then
						var_84_3.gameObject:SetActive(true)
					else
						var_84_3.gameObject:SetActive(false)
					end
				end
			end

			local var_84_4 = 0.001

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_4 then
				local var_84_5 = (arg_81_1.time_ - var_84_1) / var_84_4
				local var_84_6 = Vector3.New(390, -420, 0)

				var_84_0.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos1033, var_84_6, var_84_5)
			end

			if arg_81_1.time_ >= var_84_1 + var_84_4 and arg_81_1.time_ < var_84_1 + var_84_4 + arg_84_0 then
				var_84_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_84_7 = arg_81_1.actors_["1033"]
			local var_84_8 = 0

			if var_84_8 < arg_81_1.time_ and arg_81_1.time_ <= var_84_8 + arg_84_0 and arg_81_1.var_.actorSpriteComps1033 == nil then
				arg_81_1.var_.actorSpriteComps1033 = var_84_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_84_9 = 0.034

			if var_84_8 <= arg_81_1.time_ and arg_81_1.time_ < var_84_8 + var_84_9 then
				local var_84_10 = (arg_81_1.time_ - var_84_8) / var_84_9

				if arg_81_1.var_.actorSpriteComps1033 then
					for iter_84_1, iter_84_2 in pairs(arg_81_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_84_2 then
							local var_84_11 = Mathf.Lerp(iter_84_2.color.r, 1, var_84_10)

							iter_84_2.color = Color.New(var_84_11, var_84_11, var_84_11)
						end
					end
				end
			end

			if arg_81_1.time_ >= var_84_8 + var_84_9 and arg_81_1.time_ < var_84_8 + var_84_9 + arg_84_0 and arg_81_1.var_.actorSpriteComps1033 then
				local var_84_12 = 1

				for iter_84_3, iter_84_4 in pairs(arg_81_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_84_4 then
						iter_84_4.color = Color.New(var_84_12, var_84_12, var_84_12)
					end
				end

				arg_81_1.var_.actorSpriteComps1033 = nil
			end

			local var_84_13 = 0
			local var_84_14 = 0.1

			if var_84_13 < arg_81_1.time_ and arg_81_1.time_ <= var_84_13 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_15 = arg_81_1:FormatText(StoryNameCfg[236].name)

				arg_81_1.leftNameTxt_.text = var_84_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_16 = arg_81_1:GetWordFromCfg(900701019)
				local var_84_17 = arg_81_1:FormatText(var_84_16.content)

				arg_81_1.text_.text = var_84_17

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_18 = 4
				local var_84_19 = utf8.len(var_84_17)
				local var_84_20 = var_84_18 <= 0 and var_84_14 or var_84_14 * (var_84_19 / var_84_18)

				if var_84_20 > 0 and var_84_14 < var_84_20 then
					arg_81_1.talkMaxDuration = var_84_20

					if var_84_20 + var_84_13 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_20 + var_84_13
					end
				end

				arg_81_1.text_.text = var_84_17
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_21 = math.max(var_84_14, arg_81_1.talkMaxDuration)

			if var_84_13 <= arg_81_1.time_ and arg_81_1.time_ < var_84_13 + var_84_21 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_13) / var_84_21

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_13 + var_84_21 and arg_81_1.time_ < var_84_13 + var_84_21 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play900701020 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 900701020
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play900701021(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["10022"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.actorSpriteComps10022 == nil then
				arg_85_1.var_.actorSpriteComps10022 = var_88_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_88_2 = 0.1

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.actorSpriteComps10022 then
					for iter_88_0, iter_88_1 in pairs(arg_85_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_88_1 then
							local var_88_4 = Mathf.Lerp(iter_88_1.color.r, 1, var_88_3)

							iter_88_1.color = Color.New(var_88_4, var_88_4, var_88_4)
						end
					end
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.actorSpriteComps10022 then
				local var_88_5 = 1

				for iter_88_2, iter_88_3 in pairs(arg_85_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_88_3 then
						iter_88_3.color = Color.New(var_88_5, var_88_5, var_88_5)
					end
				end

				arg_85_1.var_.actorSpriteComps10022 = nil
			end

			local var_88_6 = arg_85_1.actors_["1033"]
			local var_88_7 = 0

			if var_88_7 < arg_85_1.time_ and arg_85_1.time_ <= var_88_7 + arg_88_0 and arg_85_1.var_.actorSpriteComps1033 == nil then
				arg_85_1.var_.actorSpriteComps1033 = var_88_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_88_8 = 0.1

			if var_88_7 <= arg_85_1.time_ and arg_85_1.time_ < var_88_7 + var_88_8 then
				local var_88_9 = (arg_85_1.time_ - var_88_7) / var_88_8

				if arg_85_1.var_.actorSpriteComps1033 then
					for iter_88_4, iter_88_5 in pairs(arg_85_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_88_5 then
							local var_88_10 = Mathf.Lerp(iter_88_5.color.r, 0.5, var_88_9)

							iter_88_5.color = Color.New(var_88_10, var_88_10, var_88_10)
						end
					end
				end
			end

			if arg_85_1.time_ >= var_88_7 + var_88_8 and arg_85_1.time_ < var_88_7 + var_88_8 + arg_88_0 and arg_85_1.var_.actorSpriteComps1033 then
				local var_88_11 = 0.5

				for iter_88_6, iter_88_7 in pairs(arg_85_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_88_7 then
						iter_88_7.color = Color.New(var_88_11, var_88_11, var_88_11)
					end
				end

				arg_85_1.var_.actorSpriteComps1033 = nil
			end

			local var_88_12 = 0
			local var_88_13 = 0.1

			if var_88_12 < arg_85_1.time_ and arg_85_1.time_ <= var_88_12 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_14 = arg_85_1:FormatText(StoryNameCfg[235].name)

				arg_85_1.leftNameTxt_.text = var_88_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_15 = arg_85_1:GetWordFromCfg(900701020)
				local var_88_16 = arg_85_1:FormatText(var_88_15.content)

				arg_85_1.text_.text = var_88_16

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_17 = 4
				local var_88_18 = utf8.len(var_88_16)
				local var_88_19 = var_88_17 <= 0 and var_88_13 or var_88_13 * (var_88_18 / var_88_17)

				if var_88_19 > 0 and var_88_13 < var_88_19 then
					arg_85_1.talkMaxDuration = var_88_19

					if var_88_19 + var_88_12 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_19 + var_88_12
					end
				end

				arg_85_1.text_.text = var_88_16
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_20 = math.max(var_88_13, arg_85_1.talkMaxDuration)

			if var_88_12 <= arg_85_1.time_ and arg_85_1.time_ < var_88_12 + var_88_20 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_12) / var_88_20

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_12 + var_88_20 and arg_85_1.time_ < var_88_12 + var_88_20 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play900701021 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 900701021
		arg_89_1.duration_ = 5

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play900701022(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["10022"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.actorSpriteComps10022 == nil then
				arg_89_1.var_.actorSpriteComps10022 = var_92_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_92_2 = 0.1

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.actorSpriteComps10022 then
					for iter_92_0, iter_92_1 in pairs(arg_89_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_92_1 then
							local var_92_4 = Mathf.Lerp(iter_92_1.color.r, 0.5, var_92_3)

							iter_92_1.color = Color.New(var_92_4, var_92_4, var_92_4)
						end
					end
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.actorSpriteComps10022 then
				local var_92_5 = 0.5

				for iter_92_2, iter_92_3 in pairs(arg_89_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_92_3 then
						iter_92_3.color = Color.New(var_92_5, var_92_5, var_92_5)
					end
				end

				arg_89_1.var_.actorSpriteComps10022 = nil
			end

			local var_92_6 = arg_89_1.actors_["1033"]
			local var_92_7 = 0

			if var_92_7 < arg_89_1.time_ and arg_89_1.time_ <= var_92_7 + arg_92_0 and arg_89_1.var_.actorSpriteComps1033 == nil then
				arg_89_1.var_.actorSpriteComps1033 = var_92_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_92_8 = 0.1

			if var_92_7 <= arg_89_1.time_ and arg_89_1.time_ < var_92_7 + var_92_8 then
				local var_92_9 = (arg_89_1.time_ - var_92_7) / var_92_8

				if arg_89_1.var_.actorSpriteComps1033 then
					for iter_92_4, iter_92_5 in pairs(arg_89_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_92_5 then
							local var_92_10 = Mathf.Lerp(iter_92_5.color.r, 1, var_92_9)

							iter_92_5.color = Color.New(var_92_10, var_92_10, var_92_10)
						end
					end
				end
			end

			if arg_89_1.time_ >= var_92_7 + var_92_8 and arg_89_1.time_ < var_92_7 + var_92_8 + arg_92_0 and arg_89_1.var_.actorSpriteComps1033 then
				local var_92_11 = 1

				for iter_92_6, iter_92_7 in pairs(arg_89_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_92_7 then
						iter_92_7.color = Color.New(var_92_11, var_92_11, var_92_11)
					end
				end

				arg_89_1.var_.actorSpriteComps1033 = nil
			end

			local var_92_12 = 0
			local var_92_13 = 0.875

			if var_92_12 < arg_89_1.time_ and arg_89_1.time_ <= var_92_12 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_14 = arg_89_1:FormatText(StoryNameCfg[236].name)

				arg_89_1.leftNameTxt_.text = var_92_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_15 = arg_89_1:GetWordFromCfg(900701021)
				local var_92_16 = arg_89_1:FormatText(var_92_15.content)

				arg_89_1.text_.text = var_92_16

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_17 = 35
				local var_92_18 = utf8.len(var_92_16)
				local var_92_19 = var_92_17 <= 0 and var_92_13 or var_92_13 * (var_92_18 / var_92_17)

				if var_92_19 > 0 and var_92_13 < var_92_19 then
					arg_89_1.talkMaxDuration = var_92_19

					if var_92_19 + var_92_12 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_19 + var_92_12
					end
				end

				arg_89_1.text_.text = var_92_16
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)
				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_20 = math.max(var_92_13, arg_89_1.talkMaxDuration)

			if var_92_12 <= arg_89_1.time_ and arg_89_1.time_ < var_92_12 + var_92_20 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_12) / var_92_20

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_12 + var_92_20 and arg_89_1.time_ < var_92_12 + var_92_20 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play900701022 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 900701022
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play900701023(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 0.325

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_2 = arg_93_1:FormatText(StoryNameCfg[236].name)

				arg_93_1.leftNameTxt_.text = var_96_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_3 = arg_93_1:GetWordFromCfg(900701022)
				local var_96_4 = arg_93_1:FormatText(var_96_3.content)

				arg_93_1.text_.text = var_96_4

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_5 = 13
				local var_96_6 = utf8.len(var_96_4)
				local var_96_7 = var_96_5 <= 0 and var_96_1 or var_96_1 * (var_96_6 / var_96_5)

				if var_96_7 > 0 and var_96_1 < var_96_7 then
					arg_93_1.talkMaxDuration = var_96_7

					if var_96_7 + var_96_0 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_7 + var_96_0
					end
				end

				arg_93_1.text_.text = var_96_4
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_8 = math.max(var_96_1, arg_93_1.talkMaxDuration)

			if var_96_0 <= arg_93_1.time_ and arg_93_1.time_ < var_96_0 + var_96_8 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_0) / var_96_8

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_0 + var_96_8 and arg_93_1.time_ < var_96_0 + var_96_8 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play900701023 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 900701023
		arg_97_1.duration_ = 5

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play900701024(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["10022"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.actorSpriteComps10022 == nil then
				arg_97_1.var_.actorSpriteComps10022 = var_100_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_100_2 = 0.1

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.actorSpriteComps10022 then
					for iter_100_0, iter_100_1 in pairs(arg_97_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_100_1 then
							local var_100_4 = Mathf.Lerp(iter_100_1.color.r, 1, var_100_3)

							iter_100_1.color = Color.New(var_100_4, var_100_4, var_100_4)
						end
					end
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.actorSpriteComps10022 then
				local var_100_5 = 1

				for iter_100_2, iter_100_3 in pairs(arg_97_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_100_3 then
						iter_100_3.color = Color.New(var_100_5, var_100_5, var_100_5)
					end
				end

				arg_97_1.var_.actorSpriteComps10022 = nil
			end

			local var_100_6 = arg_97_1.actors_["1033"]
			local var_100_7 = 0

			if var_100_7 < arg_97_1.time_ and arg_97_1.time_ <= var_100_7 + arg_100_0 and arg_97_1.var_.actorSpriteComps1033 == nil then
				arg_97_1.var_.actorSpriteComps1033 = var_100_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_100_8 = 0.1

			if var_100_7 <= arg_97_1.time_ and arg_97_1.time_ < var_100_7 + var_100_8 then
				local var_100_9 = (arg_97_1.time_ - var_100_7) / var_100_8

				if arg_97_1.var_.actorSpriteComps1033 then
					for iter_100_4, iter_100_5 in pairs(arg_97_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_100_5 then
							local var_100_10 = Mathf.Lerp(iter_100_5.color.r, 0.5, var_100_9)

							iter_100_5.color = Color.New(var_100_10, var_100_10, var_100_10)
						end
					end
				end
			end

			if arg_97_1.time_ >= var_100_7 + var_100_8 and arg_97_1.time_ < var_100_7 + var_100_8 + arg_100_0 and arg_97_1.var_.actorSpriteComps1033 then
				local var_100_11 = 0.5

				for iter_100_6, iter_100_7 in pairs(arg_97_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_100_7 then
						iter_100_7.color = Color.New(var_100_11, var_100_11, var_100_11)
					end
				end

				arg_97_1.var_.actorSpriteComps1033 = nil
			end

			local var_100_12 = 0
			local var_100_13 = 0.525

			if var_100_12 < arg_97_1.time_ and arg_97_1.time_ <= var_100_12 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_14 = arg_97_1:FormatText(StoryNameCfg[235].name)

				arg_97_1.leftNameTxt_.text = var_100_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_15 = arg_97_1:GetWordFromCfg(900701023)
				local var_100_16 = arg_97_1:FormatText(var_100_15.content)

				arg_97_1.text_.text = var_100_16

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_17 = 21
				local var_100_18 = utf8.len(var_100_16)
				local var_100_19 = var_100_17 <= 0 and var_100_13 or var_100_13 * (var_100_18 / var_100_17)

				if var_100_19 > 0 and var_100_13 < var_100_19 then
					arg_97_1.talkMaxDuration = var_100_19

					if var_100_19 + var_100_12 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_19 + var_100_12
					end
				end

				arg_97_1.text_.text = var_100_16
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)
				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_20 = math.max(var_100_13, arg_97_1.talkMaxDuration)

			if var_100_12 <= arg_97_1.time_ and arg_97_1.time_ < var_100_12 + var_100_20 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_12) / var_100_20

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_12 + var_100_20 and arg_97_1.time_ < var_100_12 + var_100_20 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play900701024 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 900701024
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play900701025(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["10022"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.actorSpriteComps10022 == nil then
				arg_101_1.var_.actorSpriteComps10022 = var_104_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_104_2 = 0.1

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.actorSpriteComps10022 then
					for iter_104_0, iter_104_1 in pairs(arg_101_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_104_1 then
							local var_104_4 = Mathf.Lerp(iter_104_1.color.r, 0.5, var_104_3)

							iter_104_1.color = Color.New(var_104_4, var_104_4, var_104_4)
						end
					end
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.actorSpriteComps10022 then
				local var_104_5 = 0.5

				for iter_104_2, iter_104_3 in pairs(arg_101_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_104_3 then
						iter_104_3.color = Color.New(var_104_5, var_104_5, var_104_5)
					end
				end

				arg_101_1.var_.actorSpriteComps10022 = nil
			end

			local var_104_6 = arg_101_1.actors_["1033"]
			local var_104_7 = 0

			if var_104_7 < arg_101_1.time_ and arg_101_1.time_ <= var_104_7 + arg_104_0 and arg_101_1.var_.actorSpriteComps1033 == nil then
				arg_101_1.var_.actorSpriteComps1033 = var_104_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_104_8 = 0.1

			if var_104_7 <= arg_101_1.time_ and arg_101_1.time_ < var_104_7 + var_104_8 then
				local var_104_9 = (arg_101_1.time_ - var_104_7) / var_104_8

				if arg_101_1.var_.actorSpriteComps1033 then
					for iter_104_4, iter_104_5 in pairs(arg_101_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_104_5 then
							local var_104_10 = Mathf.Lerp(iter_104_5.color.r, 1, var_104_9)

							iter_104_5.color = Color.New(var_104_10, var_104_10, var_104_10)
						end
					end
				end
			end

			if arg_101_1.time_ >= var_104_7 + var_104_8 and arg_101_1.time_ < var_104_7 + var_104_8 + arg_104_0 and arg_101_1.var_.actorSpriteComps1033 then
				local var_104_11 = 1

				for iter_104_6, iter_104_7 in pairs(arg_101_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_104_7 then
						iter_104_7.color = Color.New(var_104_11, var_104_11, var_104_11)
					end
				end

				arg_101_1.var_.actorSpriteComps1033 = nil
			end

			local var_104_12 = 0
			local var_104_13 = 0.5

			if var_104_12 < arg_101_1.time_ and arg_101_1.time_ <= var_104_12 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_14 = arg_101_1:FormatText(StoryNameCfg[236].name)

				arg_101_1.leftNameTxt_.text = var_104_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_15 = arg_101_1:GetWordFromCfg(900701024)
				local var_104_16 = arg_101_1:FormatText(var_104_15.content)

				arg_101_1.text_.text = var_104_16

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_17 = 20
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
				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_20 = math.max(var_104_13, arg_101_1.talkMaxDuration)

			if var_104_12 <= arg_101_1.time_ and arg_101_1.time_ < var_104_12 + var_104_20 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_12) / var_104_20

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_12 + var_104_20 and arg_101_1.time_ < var_104_12 + var_104_20 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play900701025 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 900701025
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play900701026(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["10022"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.actorSpriteComps10022 == nil then
				arg_105_1.var_.actorSpriteComps10022 = var_108_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_108_2 = 0.1

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.actorSpriteComps10022 then
					for iter_108_0, iter_108_1 in pairs(arg_105_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_108_1 then
							local var_108_4 = Mathf.Lerp(iter_108_1.color.r, 1, var_108_3)

							iter_108_1.color = Color.New(var_108_4, var_108_4, var_108_4)
						end
					end
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.actorSpriteComps10022 then
				local var_108_5 = 1

				for iter_108_2, iter_108_3 in pairs(arg_105_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_108_3 then
						iter_108_3.color = Color.New(var_108_5, var_108_5, var_108_5)
					end
				end

				arg_105_1.var_.actorSpriteComps10022 = nil
			end

			local var_108_6 = arg_105_1.actors_["1033"]
			local var_108_7 = 0

			if var_108_7 < arg_105_1.time_ and arg_105_1.time_ <= var_108_7 + arg_108_0 and arg_105_1.var_.actorSpriteComps1033 == nil then
				arg_105_1.var_.actorSpriteComps1033 = var_108_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_108_8 = 0.1

			if var_108_7 <= arg_105_1.time_ and arg_105_1.time_ < var_108_7 + var_108_8 then
				local var_108_9 = (arg_105_1.time_ - var_108_7) / var_108_8

				if arg_105_1.var_.actorSpriteComps1033 then
					for iter_108_4, iter_108_5 in pairs(arg_105_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_108_5 then
							local var_108_10 = Mathf.Lerp(iter_108_5.color.r, 0.5, var_108_9)

							iter_108_5.color = Color.New(var_108_10, var_108_10, var_108_10)
						end
					end
				end
			end

			if arg_105_1.time_ >= var_108_7 + var_108_8 and arg_105_1.time_ < var_108_7 + var_108_8 + arg_108_0 and arg_105_1.var_.actorSpriteComps1033 then
				local var_108_11 = 0.5

				for iter_108_6, iter_108_7 in pairs(arg_105_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_108_7 then
						iter_108_7.color = Color.New(var_108_11, var_108_11, var_108_11)
					end
				end

				arg_105_1.var_.actorSpriteComps1033 = nil
			end

			local var_108_12 = 0
			local var_108_13 = 0.95

			if var_108_12 < arg_105_1.time_ and arg_105_1.time_ <= var_108_12 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_14 = arg_105_1:FormatText(StoryNameCfg[235].name)

				arg_105_1.leftNameTxt_.text = var_108_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_15 = arg_105_1:GetWordFromCfg(900701025)
				local var_108_16 = arg_105_1:FormatText(var_108_15.content)

				arg_105_1.text_.text = var_108_16

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_17 = 38
				local var_108_18 = utf8.len(var_108_16)
				local var_108_19 = var_108_17 <= 0 and var_108_13 or var_108_13 * (var_108_18 / var_108_17)

				if var_108_19 > 0 and var_108_13 < var_108_19 then
					arg_105_1.talkMaxDuration = var_108_19

					if var_108_19 + var_108_12 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_19 + var_108_12
					end
				end

				arg_105_1.text_.text = var_108_16
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_20 = math.max(var_108_13, arg_105_1.talkMaxDuration)

			if var_108_12 <= arg_105_1.time_ and arg_105_1.time_ < var_108_12 + var_108_20 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_12) / var_108_20

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_12 + var_108_20 and arg_105_1.time_ < var_108_12 + var_108_20 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play900701026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 900701026
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play900701027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 0.925

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_2 = arg_109_1:FormatText(StoryNameCfg[235].name)

				arg_109_1.leftNameTxt_.text = var_112_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_3 = arg_109_1:GetWordFromCfg(900701026)
				local var_112_4 = arg_109_1:FormatText(var_112_3.content)

				arg_109_1.text_.text = var_112_4

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_5 = 37
				local var_112_6 = utf8.len(var_112_4)
				local var_112_7 = var_112_5 <= 0 and var_112_1 or var_112_1 * (var_112_6 / var_112_5)

				if var_112_7 > 0 and var_112_1 < var_112_7 then
					arg_109_1.talkMaxDuration = var_112_7

					if var_112_7 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_7 + var_112_0
					end
				end

				arg_109_1.text_.text = var_112_4
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)
				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_8 = math.max(var_112_1, arg_109_1.talkMaxDuration)

			if var_112_0 <= arg_109_1.time_ and arg_109_1.time_ < var_112_0 + var_112_8 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_0) / var_112_8

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_0 + var_112_8 and arg_109_1.time_ < var_112_0 + var_112_8 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play900701027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 900701027
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play900701028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 0.95

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_2 = arg_113_1:FormatText(StoryNameCfg[235].name)

				arg_113_1.leftNameTxt_.text = var_116_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_3 = arg_113_1:GetWordFromCfg(900701027)
				local var_116_4 = arg_113_1:FormatText(var_116_3.content)

				arg_113_1.text_.text = var_116_4

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_5 = 38
				local var_116_6 = utf8.len(var_116_4)
				local var_116_7 = var_116_5 <= 0 and var_116_1 or var_116_1 * (var_116_6 / var_116_5)

				if var_116_7 > 0 and var_116_1 < var_116_7 then
					arg_113_1.talkMaxDuration = var_116_7

					if var_116_7 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_7 + var_116_0
					end
				end

				arg_113_1.text_.text = var_116_4
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_8 = math.max(var_116_1, arg_113_1.talkMaxDuration)

			if var_116_0 <= arg_113_1.time_ and arg_113_1.time_ < var_116_0 + var_116_8 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_0) / var_116_8

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_0 + var_116_8 and arg_113_1.time_ < var_116_0 + var_116_8 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play900701028 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 900701028
		arg_117_1.duration_ = 5

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play900701029(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["10022"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos10022 = var_120_0.localPosition
				var_120_0.localScale = Vector3.New(1, 1, 1)

				arg_117_1:CheckSpriteTmpPos("10022", 2)

				local var_120_2 = var_120_0.childCount

				for iter_120_0 = 0, var_120_2 - 1 do
					local var_120_3 = var_120_0:GetChild(iter_120_0)

					if var_120_3.name == "split_7" or not string.find(var_120_3.name, "split") then
						var_120_3.gameObject:SetActive(true)
					else
						var_120_3.gameObject:SetActive(false)
					end
				end
			end

			local var_120_4 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_4 then
				local var_120_5 = (arg_117_1.time_ - var_120_1) / var_120_4
				local var_120_6 = Vector3.New(-390, -350, -180)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos10022, var_120_6, var_120_5)
			end

			if arg_117_1.time_ >= var_120_1 + var_120_4 and arg_117_1.time_ < var_120_1 + var_120_4 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_120_7 = 0
			local var_120_8 = 0.325

			if var_120_7 < arg_117_1.time_ and arg_117_1.time_ <= var_120_7 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_9 = arg_117_1:FormatText(StoryNameCfg[235].name)

				arg_117_1.leftNameTxt_.text = var_120_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_10 = arg_117_1:GetWordFromCfg(900701028)
				local var_120_11 = arg_117_1:FormatText(var_120_10.content)

				arg_117_1.text_.text = var_120_11

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_12 = 13
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
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_15 = math.max(var_120_8, arg_117_1.talkMaxDuration)

			if var_120_7 <= arg_117_1.time_ and arg_117_1.time_ < var_120_7 + var_120_15 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_7) / var_120_15

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_7 + var_120_15 and arg_117_1.time_ < var_120_7 + var_120_15 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play900701029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 900701029
		arg_121_1.duration_ = 5

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play900701030(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1033"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos1033 = var_124_0.localPosition
				var_124_0.localScale = Vector3.New(1, 1, 1)

				arg_121_1:CheckSpriteTmpPos("1033", 4)

				local var_124_2 = var_124_0.childCount

				for iter_124_0 = 0, var_124_2 - 1 do
					local var_124_3 = var_124_0:GetChild(iter_124_0)

					if var_124_3.name == "split_6" or not string.find(var_124_3.name, "split") then
						var_124_3.gameObject:SetActive(true)
					else
						var_124_3.gameObject:SetActive(false)
					end
				end
			end

			local var_124_4 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_4 then
				local var_124_5 = (arg_121_1.time_ - var_124_1) / var_124_4
				local var_124_6 = Vector3.New(390, -420, 0)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1033, var_124_6, var_124_5)
			end

			if arg_121_1.time_ >= var_124_1 + var_124_4 and arg_121_1.time_ < var_124_1 + var_124_4 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_124_7 = arg_121_1.actors_["10022"]
			local var_124_8 = 0

			if var_124_8 < arg_121_1.time_ and arg_121_1.time_ <= var_124_8 + arg_124_0 and arg_121_1.var_.actorSpriteComps10022 == nil then
				arg_121_1.var_.actorSpriteComps10022 = var_124_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_124_9 = 0.1

			if var_124_8 <= arg_121_1.time_ and arg_121_1.time_ < var_124_8 + var_124_9 then
				local var_124_10 = (arg_121_1.time_ - var_124_8) / var_124_9

				if arg_121_1.var_.actorSpriteComps10022 then
					for iter_124_1, iter_124_2 in pairs(arg_121_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_124_2 then
							local var_124_11 = Mathf.Lerp(iter_124_2.color.r, 0.5, var_124_10)

							iter_124_2.color = Color.New(var_124_11, var_124_11, var_124_11)
						end
					end
				end
			end

			if arg_121_1.time_ >= var_124_8 + var_124_9 and arg_121_1.time_ < var_124_8 + var_124_9 + arg_124_0 and arg_121_1.var_.actorSpriteComps10022 then
				local var_124_12 = 0.5

				for iter_124_3, iter_124_4 in pairs(arg_121_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_124_4 then
						iter_124_4.color = Color.New(var_124_12, var_124_12, var_124_12)
					end
				end

				arg_121_1.var_.actorSpriteComps10022 = nil
			end

			local var_124_13 = arg_121_1.actors_["1033"]
			local var_124_14 = 0

			if var_124_14 < arg_121_1.time_ and arg_121_1.time_ <= var_124_14 + arg_124_0 and arg_121_1.var_.actorSpriteComps1033 == nil then
				arg_121_1.var_.actorSpriteComps1033 = var_124_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_124_15 = 0.1

			if var_124_14 <= arg_121_1.time_ and arg_121_1.time_ < var_124_14 + var_124_15 then
				local var_124_16 = (arg_121_1.time_ - var_124_14) / var_124_15

				if arg_121_1.var_.actorSpriteComps1033 then
					for iter_124_5, iter_124_6 in pairs(arg_121_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_124_6 then
							local var_124_17 = Mathf.Lerp(iter_124_6.color.r, 1, var_124_16)

							iter_124_6.color = Color.New(var_124_17, var_124_17, var_124_17)
						end
					end
				end
			end

			if arg_121_1.time_ >= var_124_14 + var_124_15 and arg_121_1.time_ < var_124_14 + var_124_15 + arg_124_0 and arg_121_1.var_.actorSpriteComps1033 then
				local var_124_18 = 1

				for iter_124_7, iter_124_8 in pairs(arg_121_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_124_8 then
						iter_124_8.color = Color.New(var_124_18, var_124_18, var_124_18)
					end
				end

				arg_121_1.var_.actorSpriteComps1033 = nil
			end

			local var_124_19 = 0
			local var_124_20 = 0.175

			if var_124_19 < arg_121_1.time_ and arg_121_1.time_ <= var_124_19 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_21 = arg_121_1:FormatText(StoryNameCfg[236].name)

				arg_121_1.leftNameTxt_.text = var_124_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_22 = arg_121_1:GetWordFromCfg(900701029)
				local var_124_23 = arg_121_1:FormatText(var_124_22.content)

				arg_121_1.text_.text = var_124_23

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_24 = 7
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
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_27 = math.max(var_124_20, arg_121_1.talkMaxDuration)

			if var_124_19 <= arg_121_1.time_ and arg_121_1.time_ < var_124_19 + var_124_27 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_19) / var_124_27

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_19 + var_124_27 and arg_121_1.time_ < var_124_19 + var_124_27 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play900701030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 900701030
		arg_125_1.duration_ = 8

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play900701031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = "OM0602"

			if arg_125_1.bgs_[var_128_0] == nil then
				local var_128_1 = Object.Instantiate(arg_125_1.paintGo_)

				var_128_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_128_0)
				var_128_1.name = var_128_0
				var_128_1.transform.parent = arg_125_1.stage_.transform
				var_128_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_125_1.bgs_[var_128_0] = var_128_1
			end

			local var_128_2 = 2

			if var_128_2 < arg_125_1.time_ and arg_125_1.time_ <= var_128_2 + arg_128_0 then
				local var_128_3 = manager.ui.mainCamera.transform.localPosition
				local var_128_4 = Vector3.New(0, 0, 10) + Vector3.New(var_128_3.x, var_128_3.y, 0)
				local var_128_5 = arg_125_1.bgs_.OM0602

				var_128_5.transform.localPosition = var_128_4
				var_128_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_128_6 = var_128_5:GetComponent("SpriteRenderer")

				if var_128_6 and var_128_6.sprite then
					local var_128_7 = (var_128_5.transform.localPosition - var_128_3).z
					local var_128_8 = manager.ui.mainCameraCom_
					local var_128_9 = 2 * var_128_7 * Mathf.Tan(var_128_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_128_10 = var_128_9 * var_128_8.aspect
					local var_128_11 = var_128_6.sprite.bounds.size.x
					local var_128_12 = var_128_6.sprite.bounds.size.y
					local var_128_13 = var_128_10 / var_128_11
					local var_128_14 = var_128_9 / var_128_12
					local var_128_15 = var_128_14 < var_128_13 and var_128_13 or var_128_14

					var_128_5.transform.localScale = Vector3.New(var_128_15, var_128_15, 0)
				end

				for iter_128_0, iter_128_1 in pairs(arg_125_1.bgs_) do
					if iter_128_0 ~= "OM0602" then
						iter_128_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_128_16 = 0

			if var_128_16 < arg_125_1.time_ and arg_125_1.time_ <= var_128_16 + arg_128_0 then
				arg_125_1.mask_.enabled = true
				arg_125_1.mask_.raycastTarget = true

				arg_125_1:SetGaussion(false)
			end

			local var_128_17 = 2

			if var_128_16 <= arg_125_1.time_ and arg_125_1.time_ < var_128_16 + var_128_17 then
				local var_128_18 = (arg_125_1.time_ - var_128_16) / var_128_17
				local var_128_19 = Color.New(0, 0, 0)

				var_128_19.a = Mathf.Lerp(0, 1, var_128_18)
				arg_125_1.mask_.color = var_128_19
			end

			if arg_125_1.time_ >= var_128_16 + var_128_17 and arg_125_1.time_ < var_128_16 + var_128_17 + arg_128_0 then
				local var_128_20 = Color.New(0, 0, 0)

				var_128_20.a = 1
				arg_125_1.mask_.color = var_128_20
			end

			local var_128_21 = 2

			if var_128_21 < arg_125_1.time_ and arg_125_1.time_ <= var_128_21 + arg_128_0 then
				arg_125_1.mask_.enabled = true
				arg_125_1.mask_.raycastTarget = true

				arg_125_1:SetGaussion(false)
			end

			local var_128_22 = 1

			if var_128_21 <= arg_125_1.time_ and arg_125_1.time_ < var_128_21 + var_128_22 then
				local var_128_23 = (arg_125_1.time_ - var_128_21) / var_128_22
				local var_128_24 = Color.New(0, 0, 0)

				var_128_24.a = Mathf.Lerp(1, 0, var_128_23)
				arg_125_1.mask_.color = var_128_24
			end

			if arg_125_1.time_ >= var_128_21 + var_128_22 and arg_125_1.time_ < var_128_21 + var_128_22 + arg_128_0 then
				local var_128_25 = Color.New(0, 0, 0)
				local var_128_26 = 0

				arg_125_1.mask_.enabled = false
				var_128_25.a = var_128_26
				arg_125_1.mask_.color = var_128_25
			end

			local var_128_27 = arg_125_1.actors_["1033"].transform
			local var_128_28 = 1.966

			if var_128_28 < arg_125_1.time_ and arg_125_1.time_ <= var_128_28 + arg_128_0 then
				arg_125_1.var_.moveOldPos1033 = var_128_27.localPosition
				var_128_27.localScale = Vector3.New(1, 1, 1)

				arg_125_1:CheckSpriteTmpPos("1033", 7)

				local var_128_29 = var_128_27.childCount

				for iter_128_2 = 0, var_128_29 - 1 do
					local var_128_30 = var_128_27:GetChild(iter_128_2)

					if var_128_30.name == "split_6" or not string.find(var_128_30.name, "split") then
						var_128_30.gameObject:SetActive(true)
					else
						var_128_30.gameObject:SetActive(false)
					end
				end
			end

			local var_128_31 = 0.001

			if var_128_28 <= arg_125_1.time_ and arg_125_1.time_ < var_128_28 + var_128_31 then
				local var_128_32 = (arg_125_1.time_ - var_128_28) / var_128_31
				local var_128_33 = Vector3.New(0, -2000, 0)

				var_128_27.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1033, var_128_33, var_128_32)
			end

			if arg_125_1.time_ >= var_128_28 + var_128_31 and arg_125_1.time_ < var_128_28 + var_128_31 + arg_128_0 then
				var_128_27.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_128_34 = arg_125_1.actors_["10022"].transform
			local var_128_35 = 1.966

			if var_128_35 < arg_125_1.time_ and arg_125_1.time_ <= var_128_35 + arg_128_0 then
				arg_125_1.var_.moveOldPos10022 = var_128_34.localPosition
				var_128_34.localScale = Vector3.New(1, 1, 1)

				arg_125_1:CheckSpriteTmpPos("10022", 7)

				local var_128_36 = var_128_34.childCount

				for iter_128_3 = 0, var_128_36 - 1 do
					local var_128_37 = var_128_34:GetChild(iter_128_3)

					if var_128_37.name == "split_7" or not string.find(var_128_37.name, "split") then
						var_128_37.gameObject:SetActive(true)
					else
						var_128_37.gameObject:SetActive(false)
					end
				end
			end

			local var_128_38 = 0.001

			if var_128_35 <= arg_125_1.time_ and arg_125_1.time_ < var_128_35 + var_128_38 then
				local var_128_39 = (arg_125_1.time_ - var_128_35) / var_128_38
				local var_128_40 = Vector3.New(0, -2000, 0)

				var_128_34.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos10022, var_128_40, var_128_39)
			end

			if arg_125_1.time_ >= var_128_35 + var_128_38 and arg_125_1.time_ < var_128_35 + var_128_38 + arg_128_0 then
				var_128_34.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_128_41 = manager.ui.mainCamera.transform
			local var_128_42 = 2.034

			if var_128_42 < arg_125_1.time_ and arg_125_1.time_ <= var_128_42 + arg_128_0 then
				arg_125_1.var_.shakeOldPos = var_128_41.localPosition
			end

			local var_128_43 = 1.166

			if var_128_42 <= arg_125_1.time_ and arg_125_1.time_ < var_128_42 + var_128_43 then
				local var_128_44 = (arg_125_1.time_ - var_128_42) / 0.066
				local var_128_45, var_128_46 = math.modf(var_128_44)

				var_128_41.localPosition = Vector3.New(var_128_46 * 0.13, var_128_46 * 0.13, var_128_46 * 0.13) + arg_125_1.var_.shakeOldPos
			end

			if arg_125_1.time_ >= var_128_42 + var_128_43 and arg_125_1.time_ < var_128_42 + var_128_43 + arg_128_0 then
				var_128_41.localPosition = arg_125_1.var_.shakeOldPos
			end

			local var_128_47 = arg_125_1.bgs_.OM0602.transform
			local var_128_48 = 2

			if var_128_48 < arg_125_1.time_ and arg_125_1.time_ <= var_128_48 + arg_128_0 then
				arg_125_1.var_.moveOldPosOM0602 = var_128_47.localPosition
				var_128_47.localScale = Vector3.New(1, 1, 1)
			end

			local var_128_49 = 0.001

			if var_128_48 <= arg_125_1.time_ and arg_125_1.time_ < var_128_48 + var_128_49 then
				local var_128_50 = (arg_125_1.time_ - var_128_48) / var_128_49
				local var_128_51 = Vector3.New(3.79, -0.64, 4.5)

				var_128_47.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPosOM0602, var_128_51, var_128_50)
			end

			if arg_125_1.time_ >= var_128_48 + var_128_49 and arg_125_1.time_ < var_128_48 + var_128_49 + arg_128_0 then
				var_128_47.localPosition = Vector3.New(3.79, -0.64, 4.5)
			end

			local var_128_52 = 3.1

			if var_128_52 < arg_125_1.time_ and arg_125_1.time_ <= var_128_52 + arg_128_0 then
				arg_125_1.mask_.enabled = true
				arg_125_1.mask_.raycastTarget = true

				arg_125_1:SetGaussion(false)
			end

			local var_128_53 = 0.3

			if var_128_52 <= arg_125_1.time_ and arg_125_1.time_ < var_128_52 + var_128_53 then
				local var_128_54 = (arg_125_1.time_ - var_128_52) / var_128_53
				local var_128_55 = Color.New(1, 1, 1)

				var_128_55.a = Mathf.Lerp(1, 0, var_128_54)
				arg_125_1.mask_.color = var_128_55
			end

			if arg_125_1.time_ >= var_128_52 + var_128_53 and arg_125_1.time_ < var_128_52 + var_128_53 + arg_128_0 then
				local var_128_56 = Color.New(1, 1, 1)
				local var_128_57 = 0

				arg_125_1.mask_.enabled = false
				var_128_56.a = var_128_57
				arg_125_1.mask_.color = var_128_56
			end

			if arg_125_1.frameCnt_ <= 1 then
				arg_125_1.dialog_:SetActive(false)
			end

			local var_128_58 = 3
			local var_128_59 = 0.2

			if var_128_58 < arg_125_1.time_ and arg_125_1.time_ <= var_128_58 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0

				arg_125_1.dialog_:SetActive(true)

				local var_128_60 = LeanTween.value(arg_125_1.dialog_, 0, 1, 0.3)

				var_128_60:setOnUpdate(LuaHelper.FloatAction(function(arg_129_0)
					arg_125_1.dialogCg_.alpha = arg_129_0
				end))
				var_128_60:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_125_1.dialog_)
					var_128_60:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_125_1.duration_ = arg_125_1.duration_ + 0.3

				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_61 = arg_125_1:FormatText(StoryNameCfg[236].name)

				arg_125_1.leftNameTxt_.text = var_128_61

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_62 = arg_125_1:GetWordFromCfg(900701030)
				local var_128_63 = arg_125_1:FormatText(var_128_62.content)

				arg_125_1.text_.text = var_128_63

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_64 = 8
				local var_128_65 = utf8.len(var_128_63)
				local var_128_66 = var_128_64 <= 0 and var_128_59 or var_128_59 * (var_128_65 / var_128_64)

				if var_128_66 > 0 and var_128_59 < var_128_66 then
					arg_125_1.talkMaxDuration = var_128_66
					var_128_58 = var_128_58 + 0.3

					if var_128_66 + var_128_58 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_66 + var_128_58
					end
				end

				arg_125_1.text_.text = var_128_63
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_67 = var_128_58 + 0.3
			local var_128_68 = math.max(var_128_59, arg_125_1.talkMaxDuration)

			if var_128_67 <= arg_125_1.time_ and arg_125_1.time_ < var_128_67 + var_128_68 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_67) / var_128_68

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_67 + var_128_68 and arg_125_1.time_ < var_128_67 + var_128_68 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play900701031 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 900701031
		arg_131_1.duration_ = 5.56666666666667

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play900701032(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.bgs_.OM0602.transform
			local var_134_1 = 0.0339999999999998

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPosOM0602 = var_134_0.localPosition
			end

			local var_134_2 = 1.091

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2
				local var_134_4 = Vector3.New(0, 1, 10)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPosOM0602, var_134_4, var_134_3)
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(0, 1, 10)
			end

			local var_134_5 = arg_131_1.bgs_.OM0602.transform
			local var_134_6 = 0

			if var_134_6 < arg_131_1.time_ and arg_131_1.time_ <= var_134_6 + arg_134_0 then
				arg_131_1.var_.moveOldPosOM0602 = var_134_5.localPosition
				var_134_5.localScale = Vector3.New(1, 1, 1)
			end

			local var_134_7 = 0.001

			if var_134_6 <= arg_131_1.time_ and arg_131_1.time_ < var_134_6 + var_134_7 then
				local var_134_8 = (arg_131_1.time_ - var_134_6) / var_134_7
				local var_134_9 = Vector3.New(3.79, -0.64, 4.5)

				var_134_5.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPosOM0602, var_134_9, var_134_8)
			end

			if arg_131_1.time_ >= var_134_6 + var_134_7 and arg_131_1.time_ < var_134_6 + var_134_7 + arg_134_0 then
				var_134_5.localPosition = Vector3.New(3.79, -0.64, 4.5)
			end

			if arg_131_1.frameCnt_ <= 1 then
				arg_131_1.dialog_:SetActive(false)
			end

			local var_134_10 = 0.566666666666667
			local var_134_11 = 0.125

			if var_134_10 < arg_131_1.time_ and arg_131_1.time_ <= var_134_10 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0

				arg_131_1.dialog_:SetActive(true)

				local var_134_12 = LeanTween.value(arg_131_1.dialog_, 0, 1, 0.3)

				var_134_12:setOnUpdate(LuaHelper.FloatAction(function(arg_135_0)
					arg_131_1.dialogCg_.alpha = arg_135_0
				end))
				var_134_12:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_131_1.dialog_)
					var_134_12:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_131_1.duration_ = arg_131_1.duration_ + 0.3

				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_13 = arg_131_1:FormatText(StoryNameCfg[235].name)

				arg_131_1.leftNameTxt_.text = var_134_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_14 = arg_131_1:GetWordFromCfg(900701031)
				local var_134_15 = arg_131_1:FormatText(var_134_14.content)

				arg_131_1.text_.text = var_134_15

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_16 = 5
				local var_134_17 = utf8.len(var_134_15)
				local var_134_18 = var_134_16 <= 0 and var_134_11 or var_134_11 * (var_134_17 / var_134_16)

				if var_134_18 > 0 and var_134_11 < var_134_18 then
					arg_131_1.talkMaxDuration = var_134_18
					var_134_10 = var_134_10 + 0.3

					if var_134_18 + var_134_10 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_18 + var_134_10
					end
				end

				arg_131_1.text_.text = var_134_15
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_19 = var_134_10 + 0.3
			local var_134_20 = math.max(var_134_11, arg_131_1.talkMaxDuration)

			if var_134_19 <= arg_131_1.time_ and arg_131_1.time_ < var_134_19 + var_134_20 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_19) / var_134_20

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_19 + var_134_20 and arg_131_1.time_ < var_134_19 + var_134_20 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play900701032 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 900701032
		arg_137_1.duration_ = 5

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play900701033(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 0.15

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_2 = arg_137_1:FormatText(StoryNameCfg[13].name)

				arg_137_1.leftNameTxt_.text = var_140_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, true)
				arg_137_1.iconController_:SetSelectedState("hero")

				arg_137_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1119_1_split_1")

				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_3 = arg_137_1:GetWordFromCfg(900701032)
				local var_140_4 = arg_137_1:FormatText(var_140_3.content)

				arg_137_1.text_.text = var_140_4

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_5 = 6
				local var_140_6 = utf8.len(var_140_4)
				local var_140_7 = var_140_5 <= 0 and var_140_1 or var_140_1 * (var_140_6 / var_140_5)

				if var_140_7 > 0 and var_140_1 < var_140_7 then
					arg_137_1.talkMaxDuration = var_140_7

					if var_140_7 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_7 + var_140_0
					end
				end

				arg_137_1.text_.text = var_140_4
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_8 = math.max(var_140_1, arg_137_1.talkMaxDuration)

			if var_140_0 <= arg_137_1.time_ and arg_137_1.time_ < var_140_0 + var_140_8 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_0) / var_140_8

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_0 + var_140_8 and arg_137_1.time_ < var_140_0 + var_140_8 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play900701033 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 900701033
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play900701034(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 0.425

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_2 = arg_141_1:FormatText(StoryNameCfg[68].name)

				arg_141_1.leftNameTxt_.text = var_144_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, true)
				arg_141_1.iconController_:SetSelectedState("hero")

				arg_141_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3021")

				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_3 = arg_141_1:GetWordFromCfg(900701033)
				local var_144_4 = arg_141_1:FormatText(var_144_3.content)

				arg_141_1.text_.text = var_144_4

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_5 = 17
				local var_144_6 = utf8.len(var_144_4)
				local var_144_7 = var_144_5 <= 0 and var_144_1 or var_144_1 * (var_144_6 / var_144_5)

				if var_144_7 > 0 and var_144_1 < var_144_7 then
					arg_141_1.talkMaxDuration = var_144_7

					if var_144_7 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_7 + var_144_0
					end
				end

				arg_141_1.text_.text = var_144_4
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)
				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_8 = math.max(var_144_1, arg_141_1.talkMaxDuration)

			if var_144_0 <= arg_141_1.time_ and arg_141_1.time_ < var_144_0 + var_144_8 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_0) / var_144_8

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_0 + var_144_8 and arg_141_1.time_ < var_144_0 + var_144_8 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play900701034 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 900701034
		arg_145_1.duration_ = 5

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play900701035(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 0.325

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_2 = arg_145_1:FormatText(StoryNameCfg[236].name)

				arg_145_1.leftNameTxt_.text = var_148_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_3 = arg_145_1:GetWordFromCfg(900701034)
				local var_148_4 = arg_145_1:FormatText(var_148_3.content)

				arg_145_1.text_.text = var_148_4

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_5 = 13
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
				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_8 = math.max(var_148_1, arg_145_1.talkMaxDuration)

			if var_148_0 <= arg_145_1.time_ and arg_145_1.time_ < var_148_0 + var_148_8 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_0) / var_148_8

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_0 + var_148_8 and arg_145_1.time_ < var_148_0 + var_148_8 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play900701035 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 900701035
		arg_149_1.duration_ = 5

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play900701036(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 0.6

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_2 = arg_149_1:FormatText(StoryNameCfg[235].name)

				arg_149_1.leftNameTxt_.text = var_152_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_3 = arg_149_1:GetWordFromCfg(900701035)
				local var_152_4 = arg_149_1:FormatText(var_152_3.content)

				arg_149_1.text_.text = var_152_4

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_5 = 24
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
				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_8 = math.max(var_152_1, arg_149_1.talkMaxDuration)

			if var_152_0 <= arg_149_1.time_ and arg_149_1.time_ < var_152_0 + var_152_8 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_0) / var_152_8

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_0 + var_152_8 and arg_149_1.time_ < var_152_0 + var_152_8 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play900701036 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 900701036
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play900701037(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 0.2

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_2 = arg_153_1:FormatText(StoryNameCfg[94].name)

				arg_153_1.leftNameTxt_.text = var_156_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, true)
				arg_153_1.iconController_:SetSelectedState("hero")

				arg_153_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1138_split_7")

				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_3 = arg_153_1:GetWordFromCfg(900701036)
				local var_156_4 = arg_153_1:FormatText(var_156_3.content)

				arg_153_1.text_.text = var_156_4

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_5 = 8
				local var_156_6 = utf8.len(var_156_4)
				local var_156_7 = var_156_5 <= 0 and var_156_1 or var_156_1 * (var_156_6 / var_156_5)

				if var_156_7 > 0 and var_156_1 < var_156_7 then
					arg_153_1.talkMaxDuration = var_156_7

					if var_156_7 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_7 + var_156_0
					end
				end

				arg_153_1.text_.text = var_156_4
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)
				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_8 = math.max(var_156_1, arg_153_1.talkMaxDuration)

			if var_156_0 <= arg_153_1.time_ and arg_153_1.time_ < var_156_0 + var_156_8 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_0) / var_156_8

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_0 + var_156_8 and arg_153_1.time_ < var_156_0 + var_156_8 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play900701037 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 900701037
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play900701038(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0
			local var_160_1 = 0.075

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_2 = arg_157_1:FormatText(StoryNameCfg[236].name)

				arg_157_1.leftNameTxt_.text = var_160_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_3 = arg_157_1:GetWordFromCfg(900701037)
				local var_160_4 = arg_157_1:FormatText(var_160_3.content)

				arg_157_1.text_.text = var_160_4

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_5 = 3
				local var_160_6 = utf8.len(var_160_4)
				local var_160_7 = var_160_5 <= 0 and var_160_1 or var_160_1 * (var_160_6 / var_160_5)

				if var_160_7 > 0 and var_160_1 < var_160_7 then
					arg_157_1.talkMaxDuration = var_160_7

					if var_160_7 + var_160_0 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_7 + var_160_0
					end
				end

				arg_157_1.text_.text = var_160_4
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_8 = math.max(var_160_1, arg_157_1.talkMaxDuration)

			if var_160_0 <= arg_157_1.time_ and arg_157_1.time_ < var_160_0 + var_160_8 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_0) / var_160_8

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_0 + var_160_8 and arg_157_1.time_ < var_160_0 + var_160_8 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play900701038 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 900701038
		arg_161_1.duration_ = 5

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play900701039(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0
			local var_164_1 = 0.625

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_2 = arg_161_1:FormatText(StoryNameCfg[235].name)

				arg_161_1.leftNameTxt_.text = var_164_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_3 = arg_161_1:GetWordFromCfg(900701038)
				local var_164_4 = arg_161_1:FormatText(var_164_3.content)

				arg_161_1.text_.text = var_164_4

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_5 = 25
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
				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_8 = math.max(var_164_1, arg_161_1.talkMaxDuration)

			if var_164_0 <= arg_161_1.time_ and arg_161_1.time_ < var_164_0 + var_164_8 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_0) / var_164_8

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_0 + var_164_8 and arg_161_1.time_ < var_164_0 + var_164_8 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play900701039 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 900701039
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play900701040(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0
			local var_168_1 = 0.375

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_2 = arg_165_1:FormatText(StoryNameCfg[235].name)

				arg_165_1.leftNameTxt_.text = var_168_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_3 = arg_165_1:GetWordFromCfg(900701039)
				local var_168_4 = arg_165_1:FormatText(var_168_3.content)

				arg_165_1.text_.text = var_168_4

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_5 = 15
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
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_8 = math.max(var_168_1, arg_165_1.talkMaxDuration)

			if var_168_0 <= arg_165_1.time_ and arg_165_1.time_ < var_168_0 + var_168_8 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_0) / var_168_8

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_0 + var_168_8 and arg_165_1.time_ < var_168_0 + var_168_8 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play900701040 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 900701040
		arg_169_1.duration_ = 5

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play900701041(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = 0
			local var_172_1 = 0.175

			if var_172_0 < arg_169_1.time_ and arg_169_1.time_ <= var_172_0 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_2 = arg_169_1:FormatText(StoryNameCfg[236].name)

				arg_169_1.leftNameTxt_.text = var_172_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_3 = arg_169_1:GetWordFromCfg(900701040)
				local var_172_4 = arg_169_1:FormatText(var_172_3.content)

				arg_169_1.text_.text = var_172_4

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_5 = 7
				local var_172_6 = utf8.len(var_172_4)
				local var_172_7 = var_172_5 <= 0 and var_172_1 or var_172_1 * (var_172_6 / var_172_5)

				if var_172_7 > 0 and var_172_1 < var_172_7 then
					arg_169_1.talkMaxDuration = var_172_7

					if var_172_7 + var_172_0 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_7 + var_172_0
					end
				end

				arg_169_1.text_.text = var_172_4
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)
				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_8 = math.max(var_172_1, arg_169_1.talkMaxDuration)

			if var_172_0 <= arg_169_1.time_ and arg_169_1.time_ < var_172_0 + var_172_8 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_0) / var_172_8

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_0 + var_172_8 and arg_169_1.time_ < var_172_0 + var_172_8 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play900701041 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 900701041
		arg_173_1.duration_ = 5

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play900701042(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0
			local var_176_1 = 0.45

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_2 = arg_173_1:FormatText(StoryNameCfg[13].name)

				arg_173_1.leftNameTxt_.text = var_176_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, true)
				arg_173_1.iconController_:SetSelectedState("hero")

				arg_173_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1119_1_split_6")

				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_3 = arg_173_1:GetWordFromCfg(900701041)
				local var_176_4 = arg_173_1:FormatText(var_176_3.content)

				arg_173_1.text_.text = var_176_4

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_5 = 16
				local var_176_6 = utf8.len(var_176_4)
				local var_176_7 = var_176_5 <= 0 and var_176_1 or var_176_1 * (var_176_6 / var_176_5)

				if var_176_7 > 0 and var_176_1 < var_176_7 then
					arg_173_1.talkMaxDuration = var_176_7

					if var_176_7 + var_176_0 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_7 + var_176_0
					end
				end

				arg_173_1.text_.text = var_176_4
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)
				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_8 = math.max(var_176_1, arg_173_1.talkMaxDuration)

			if var_176_0 <= arg_173_1.time_ and arg_173_1.time_ < var_176_0 + var_176_8 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_0) / var_176_8

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_0 + var_176_8 and arg_173_1.time_ < var_176_0 + var_176_8 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play900701042 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 900701042
		arg_177_1.duration_ = 7

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play900701043(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = "OM0601"

			if arg_177_1.bgs_[var_180_0] == nil then
				local var_180_1 = Object.Instantiate(arg_177_1.paintGo_)

				var_180_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_180_0)
				var_180_1.name = var_180_0
				var_180_1.transform.parent = arg_177_1.stage_.transform
				var_180_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_177_1.bgs_[var_180_0] = var_180_1
			end

			local var_180_2 = 1

			if var_180_2 < arg_177_1.time_ and arg_177_1.time_ <= var_180_2 + arg_180_0 then
				local var_180_3 = manager.ui.mainCamera.transform.localPosition
				local var_180_4 = Vector3.New(0, 0, 10) + Vector3.New(var_180_3.x, var_180_3.y, 0)
				local var_180_5 = arg_177_1.bgs_.OM0601

				var_180_5.transform.localPosition = var_180_4
				var_180_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_180_6 = var_180_5:GetComponent("SpriteRenderer")

				if var_180_6 and var_180_6.sprite then
					local var_180_7 = (var_180_5.transform.localPosition - var_180_3).z
					local var_180_8 = manager.ui.mainCameraCom_
					local var_180_9 = 2 * var_180_7 * Mathf.Tan(var_180_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_180_10 = var_180_9 * var_180_8.aspect
					local var_180_11 = var_180_6.sprite.bounds.size.x
					local var_180_12 = var_180_6.sprite.bounds.size.y
					local var_180_13 = var_180_10 / var_180_11
					local var_180_14 = var_180_9 / var_180_12
					local var_180_15 = var_180_14 < var_180_13 and var_180_13 or var_180_14

					var_180_5.transform.localScale = Vector3.New(var_180_15, var_180_15, 0)
				end

				for iter_180_0, iter_180_1 in pairs(arg_177_1.bgs_) do
					if iter_180_0 ~= "OM0601" then
						iter_180_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_180_16 = 0

			if var_180_16 < arg_177_1.time_ and arg_177_1.time_ <= var_180_16 + arg_180_0 then
				arg_177_1.mask_.enabled = true
				arg_177_1.mask_.raycastTarget = true

				arg_177_1:SetGaussion(false)
			end

			local var_180_17 = 1

			if var_180_16 <= arg_177_1.time_ and arg_177_1.time_ < var_180_16 + var_180_17 then
				local var_180_18 = (arg_177_1.time_ - var_180_16) / var_180_17
				local var_180_19 = Color.New(1, 1, 1)

				var_180_19.a = Mathf.Lerp(0, 1, var_180_18)
				arg_177_1.mask_.color = var_180_19
			end

			if arg_177_1.time_ >= var_180_16 + var_180_17 and arg_177_1.time_ < var_180_16 + var_180_17 + arg_180_0 then
				local var_180_20 = Color.New(1, 1, 1)

				var_180_20.a = 1
				arg_177_1.mask_.color = var_180_20
			end

			local var_180_21 = 1

			if var_180_21 < arg_177_1.time_ and arg_177_1.time_ <= var_180_21 + arg_180_0 then
				arg_177_1.mask_.enabled = true
				arg_177_1.mask_.raycastTarget = true

				arg_177_1:SetGaussion(false)
			end

			local var_180_22 = 1

			if var_180_21 <= arg_177_1.time_ and arg_177_1.time_ < var_180_21 + var_180_22 then
				local var_180_23 = (arg_177_1.time_ - var_180_21) / var_180_22
				local var_180_24 = Color.New(1, 1, 1)

				var_180_24.a = Mathf.Lerp(1, 0, var_180_23)
				arg_177_1.mask_.color = var_180_24
			end

			if arg_177_1.time_ >= var_180_21 + var_180_22 and arg_177_1.time_ < var_180_21 + var_180_22 + arg_180_0 then
				local var_180_25 = Color.New(1, 1, 1)
				local var_180_26 = 0

				arg_177_1.mask_.enabled = false
				var_180_25.a = var_180_26
				arg_177_1.mask_.color = var_180_25
			end

			local var_180_27 = arg_177_1.bgs_.OM0602.transform
			local var_180_28 = 0.966

			if var_180_28 < arg_177_1.time_ and arg_177_1.time_ <= var_180_28 + arg_180_0 then
				arg_177_1.var_.moveOldPosOM0602 = var_180_27.localPosition
			end

			local var_180_29 = 0.001

			if var_180_28 <= arg_177_1.time_ and arg_177_1.time_ < var_180_28 + var_180_29 then
				local var_180_30 = (arg_177_1.time_ - var_180_28) / var_180_29
				local var_180_31 = Vector3.New(0, 100, 10)

				var_180_27.localPosition = Vector3.Lerp(arg_177_1.var_.moveOldPosOM0602, var_180_31, var_180_30)
			end

			if arg_177_1.time_ >= var_180_28 + var_180_29 and arg_177_1.time_ < var_180_28 + var_180_29 + arg_180_0 then
				var_180_27.localPosition = Vector3.New(0, 100, 10)
			end

			local var_180_32 = arg_177_1.bgs_.OM0601.transform
			local var_180_33 = 1

			if var_180_33 < arg_177_1.time_ and arg_177_1.time_ <= var_180_33 + arg_180_0 then
				arg_177_1.var_.moveOldPosOM0601 = var_180_32.localPosition
			end

			local var_180_34 = 0.001

			if var_180_33 <= arg_177_1.time_ and arg_177_1.time_ < var_180_33 + var_180_34 then
				local var_180_35 = (arg_177_1.time_ - var_180_33) / var_180_34
				local var_180_36 = Vector3.New(-3.43, 1.67, 3.5)

				var_180_32.localPosition = Vector3.Lerp(arg_177_1.var_.moveOldPosOM0601, var_180_36, var_180_35)
			end

			if arg_177_1.time_ >= var_180_33 + var_180_34 and arg_177_1.time_ < var_180_33 + var_180_34 + arg_180_0 then
				var_180_32.localPosition = Vector3.New(-3.43, 1.67, 3.5)
			end

			local var_180_37 = arg_177_1.bgs_.OM0601.transform
			local var_180_38 = 1.034

			if var_180_38 < arg_177_1.time_ and arg_177_1.time_ <= var_180_38 + arg_180_0 then
				arg_177_1.var_.moveOldPosOM0601 = var_180_37.localPosition
			end

			local var_180_39 = 1.291

			if var_180_38 <= arg_177_1.time_ and arg_177_1.time_ < var_180_38 + var_180_39 then
				local var_180_40 = (arg_177_1.time_ - var_180_38) / var_180_39
				local var_180_41 = Vector3.New(-3.43, -0.25, 3.5)

				var_180_37.localPosition = Vector3.Lerp(arg_177_1.var_.moveOldPosOM0601, var_180_41, var_180_40)
			end

			if arg_177_1.time_ >= var_180_38 + var_180_39 and arg_177_1.time_ < var_180_38 + var_180_39 + arg_180_0 then
				var_180_37.localPosition = Vector3.New(-3.43, -0.25, 3.5)
			end

			if arg_177_1.frameCnt_ <= 1 then
				arg_177_1.dialog_:SetActive(false)
			end

			local var_180_42 = 2
			local var_180_43 = 0.325

			if var_180_42 < arg_177_1.time_ and arg_177_1.time_ <= var_180_42 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0

				arg_177_1.dialog_:SetActive(true)

				local var_180_44 = LeanTween.value(arg_177_1.dialog_, 0, 1, 0.3)

				var_180_44:setOnUpdate(LuaHelper.FloatAction(function(arg_181_0)
					arg_177_1.dialogCg_.alpha = arg_181_0
				end))
				var_180_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_177_1.dialog_)
					var_180_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_177_1.duration_ = arg_177_1.duration_ + 0.3

				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_45 = arg_177_1:FormatText(StoryNameCfg[13].name)

				arg_177_1.leftNameTxt_.text = var_180_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_46 = arg_177_1:GetWordFromCfg(900701042)
				local var_180_47 = arg_177_1:FormatText(var_180_46.content)

				arg_177_1.text_.text = var_180_47

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_48 = 13
				local var_180_49 = utf8.len(var_180_47)
				local var_180_50 = var_180_48 <= 0 and var_180_43 or var_180_43 * (var_180_49 / var_180_48)

				if var_180_50 > 0 and var_180_43 < var_180_50 then
					arg_177_1.talkMaxDuration = var_180_50
					var_180_42 = var_180_42 + 0.3

					if var_180_50 + var_180_42 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_50 + var_180_42
					end
				end

				arg_177_1.text_.text = var_180_47
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)
				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_51 = var_180_42 + 0.3
			local var_180_52 = math.max(var_180_43, arg_177_1.talkMaxDuration)

			if var_180_51 <= arg_177_1.time_ and arg_177_1.time_ < var_180_51 + var_180_52 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_51) / var_180_52

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_51 + var_180_52 and arg_177_1.time_ < var_180_51 + var_180_52 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play900701043 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 900701043
		arg_183_1.duration_ = 5.625

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play900701044(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.bgs_.OM0601.transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPosOM0601 = var_186_0.localPosition
			end

			local var_186_2 = 1.5

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2
				local var_186_4 = Vector3.New(3.75, 0.07, 3)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPosOM0601, var_186_4, var_186_3)
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(3.75, 0.07, 3)
			end

			local var_186_5 = 0.625
			local var_186_6 = 0.375

			if var_186_5 < arg_183_1.time_ and arg_183_1.time_ <= var_186_5 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_7 = arg_183_1:FormatText(StoryNameCfg[94].name)

				arg_183_1.leftNameTxt_.text = var_186_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_8 = arg_183_1:GetWordFromCfg(900701043)
				local var_186_9 = arg_183_1:FormatText(var_186_8.content)

				arg_183_1.text_.text = var_186_9

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_10 = 15
				local var_186_11 = utf8.len(var_186_9)
				local var_186_12 = var_186_10 <= 0 and var_186_6 or var_186_6 * (var_186_11 / var_186_10)

				if var_186_12 > 0 and var_186_6 < var_186_12 then
					arg_183_1.talkMaxDuration = var_186_12

					if var_186_12 + var_186_5 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_12 + var_186_5
					end
				end

				arg_183_1.text_.text = var_186_9
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_13 = math.max(var_186_6, arg_183_1.talkMaxDuration)

			if var_186_5 <= arg_183_1.time_ and arg_183_1.time_ < var_186_5 + var_186_13 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_5) / var_186_13

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_5 + var_186_13 and arg_183_1.time_ < var_186_5 + var_186_13 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play900701044 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 900701044
		arg_187_1.duration_ = 5

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play900701045(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0
			local var_190_1 = 0.25

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_2 = arg_187_1:FormatText(StoryNameCfg[94].name)

				arg_187_1.leftNameTxt_.text = var_190_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_3 = arg_187_1:GetWordFromCfg(900701044)
				local var_190_4 = arg_187_1:FormatText(var_190_3.content)

				arg_187_1.text_.text = var_190_4

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_5 = 10
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
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_8 = math.max(var_190_1, arg_187_1.talkMaxDuration)

			if var_190_0 <= arg_187_1.time_ and arg_187_1.time_ < var_190_0 + var_190_8 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_0) / var_190_8

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_0 + var_190_8 and arg_187_1.time_ < var_190_0 + var_190_8 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play900701045 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 900701045
		arg_191_1.duration_ = 5.36733333333333

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play900701046(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.bgs_.OM0601.transform
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.var_.moveOldPosOM0601 = var_194_0.localPosition
			end

			local var_194_2 = 0.533333333333333

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2
				local var_194_4 = Vector3.New(0, 1, 10)

				var_194_0.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPosOM0601, var_194_4, var_194_3)
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 then
				var_194_0.localPosition = Vector3.New(0, 1, 10)
			end

			local var_194_5 = 0.367333333333333
			local var_194_6 = 0.2

			if var_194_5 < arg_191_1.time_ and arg_191_1.time_ <= var_194_5 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_7 = arg_191_1:FormatText(StoryNameCfg[13].name)

				arg_191_1.leftNameTxt_.text = var_194_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_8 = arg_191_1:GetWordFromCfg(900701045)
				local var_194_9 = arg_191_1:FormatText(var_194_8.content)

				arg_191_1.text_.text = var_194_9

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_10 = 8
				local var_194_11 = utf8.len(var_194_9)
				local var_194_12 = var_194_10 <= 0 and var_194_6 or var_194_6 * (var_194_11 / var_194_10)

				if var_194_12 > 0 and var_194_6 < var_194_12 then
					arg_191_1.talkMaxDuration = var_194_12

					if var_194_12 + var_194_5 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_12 + var_194_5
					end
				end

				arg_191_1.text_.text = var_194_9
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_13 = math.max(var_194_6, arg_191_1.talkMaxDuration)

			if var_194_5 <= arg_191_1.time_ and arg_191_1.time_ < var_194_5 + var_194_13 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_5) / var_194_13

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_5 + var_194_13 and arg_191_1.time_ < var_194_5 + var_194_13 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play900701046 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 900701046
		arg_195_1.duration_ = 7.38333333333333

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play900701047(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				local var_198_1 = manager.ui.mainCamera.transform.localPosition
				local var_198_2 = Vector3.New(0, 0, 10) + Vector3.New(var_198_1.x, var_198_1.y, 0)
				local var_198_3 = arg_195_1.bgs_.OM0601

				var_198_3.transform.localPosition = var_198_2
				var_198_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_198_4 = var_198_3:GetComponent("SpriteRenderer")

				if var_198_4 and var_198_4.sprite then
					local var_198_5 = (var_198_3.transform.localPosition - var_198_1).z
					local var_198_6 = manager.ui.mainCameraCom_
					local var_198_7 = 2 * var_198_5 * Mathf.Tan(var_198_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_198_8 = var_198_7 * var_198_6.aspect
					local var_198_9 = var_198_4.sprite.bounds.size.x
					local var_198_10 = var_198_4.sprite.bounds.size.y
					local var_198_11 = var_198_8 / var_198_9
					local var_198_12 = var_198_7 / var_198_10
					local var_198_13 = var_198_12 < var_198_11 and var_198_11 or var_198_12

					var_198_3.transform.localScale = Vector3.New(var_198_13, var_198_13, 0)
				end

				for iter_198_0, iter_198_1 in pairs(arg_195_1.bgs_) do
					if iter_198_0 ~= "OM0601" then
						iter_198_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_198_14 = manager.ui.mainCamera.transform
			local var_198_15 = 0

			if var_198_15 < arg_195_1.time_ and arg_195_1.time_ <= var_198_15 + arg_198_0 then
				arg_195_1.var_.shakeOldPos = var_198_14.localPosition
			end

			local var_198_16 = 2.53333333333333

			if var_198_15 <= arg_195_1.time_ and arg_195_1.time_ < var_198_15 + var_198_16 then
				local var_198_17 = (arg_195_1.time_ - var_198_15) / 0.066
				local var_198_18, var_198_19 = math.modf(var_198_17)

				var_198_14.localPosition = Vector3.New(var_198_19 * 0.13, var_198_19 * 0.13, var_198_19 * 0.13) + arg_195_1.var_.shakeOldPos
			end

			if arg_195_1.time_ >= var_198_15 + var_198_16 and arg_195_1.time_ < var_198_15 + var_198_16 + arg_198_0 then
				var_198_14.localPosition = arg_195_1.var_.shakeOldPos
			end

			local var_198_20 = arg_195_1.bgs_.OM0601
			local var_198_21 = 0

			if var_198_21 < arg_195_1.time_ and arg_195_1.time_ <= var_198_21 + arg_198_0 then
				local var_198_22 = var_198_20:GetComponent("SpriteRenderer")

				if var_198_22 then
					var_198_22.material = arg_195_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_198_23 = var_198_22.material
					local var_198_24 = var_198_23:GetColor("_Color")

					arg_195_1.var_.alphaOldValueOM0601 = var_198_24.a
					arg_195_1.var_.alphaMatValueOM0601 = var_198_23
				end

				arg_195_1.var_.alphaOldValueOM0601 = 1
			end

			local var_198_25 = 1.6

			if var_198_21 <= arg_195_1.time_ and arg_195_1.time_ < var_198_21 + var_198_25 then
				local var_198_26 = (arg_195_1.time_ - var_198_21) / var_198_25
				local var_198_27 = Mathf.Lerp(arg_195_1.var_.alphaOldValueOM0601, 0, var_198_26)

				if arg_195_1.var_.alphaMatValueOM0601 then
					local var_198_28 = arg_195_1.var_.alphaMatValueOM0601
					local var_198_29 = var_198_28:GetColor("_Color")

					var_198_29.a = var_198_27

					var_198_28:SetColor("_Color", var_198_29)
				end
			end

			if arg_195_1.time_ >= var_198_21 + var_198_25 and arg_195_1.time_ < var_198_21 + var_198_25 + arg_198_0 and arg_195_1.var_.alphaMatValueOM0601 then
				local var_198_30 = arg_195_1.var_.alphaMatValueOM0601
				local var_198_31 = var_198_30:GetColor("_Color")

				var_198_31.a = 0

				var_198_30:SetColor("_Color", var_198_31)
			end

			local var_198_32 = 0

			if var_198_32 < arg_195_1.time_ and arg_195_1.time_ <= var_198_32 + arg_198_0 then
				arg_195_1.mask_.enabled = true
				arg_195_1.mask_.raycastTarget = true

				arg_195_1:SetGaussion(false)
			end

			local var_198_33 = 0.15

			if var_198_32 <= arg_195_1.time_ and arg_195_1.time_ < var_198_32 + var_198_33 then
				local var_198_34 = (arg_195_1.time_ - var_198_32) / var_198_33
				local var_198_35 = Color.New(1, 1, 1)

				var_198_35.a = Mathf.Lerp(1, 0, var_198_34)
				arg_195_1.mask_.color = var_198_35
			end

			if arg_195_1.time_ >= var_198_32 + var_198_33 and arg_195_1.time_ < var_198_32 + var_198_33 + arg_198_0 then
				local var_198_36 = Color.New(1, 1, 1)
				local var_198_37 = 0

				arg_195_1.mask_.enabled = false
				var_198_36.a = var_198_37
				arg_195_1.mask_.color = var_198_36
			end

			local var_198_38 = 0.6

			if var_198_38 < arg_195_1.time_ and arg_195_1.time_ <= var_198_38 + arg_198_0 then
				arg_195_1.mask_.enabled = true
				arg_195_1.mask_.raycastTarget = true

				arg_195_1:SetGaussion(false)
			end

			local var_198_39 = 1

			if var_198_38 <= arg_195_1.time_ and arg_195_1.time_ < var_198_38 + var_198_39 then
				local var_198_40 = (arg_195_1.time_ - var_198_38) / var_198_39
				local var_198_41 = Color.New(1, 1, 1)

				var_198_41.a = Mathf.Lerp(0, 1, var_198_40)
				arg_195_1.mask_.color = var_198_41
			end

			if arg_195_1.time_ >= var_198_38 + var_198_39 and arg_195_1.time_ < var_198_38 + var_198_39 + arg_198_0 then
				local var_198_42 = Color.New(1, 1, 1)

				var_198_42.a = 1
				arg_195_1.mask_.color = var_198_42
			end

			local var_198_43 = 1.6

			if var_198_43 < arg_195_1.time_ and arg_195_1.time_ <= var_198_43 + arg_198_0 then
				arg_195_1.mask_.enabled = true
				arg_195_1.mask_.raycastTarget = true

				arg_195_1:SetGaussion(false)
			end

			local var_198_44 = 1

			if var_198_43 <= arg_195_1.time_ and arg_195_1.time_ < var_198_43 + var_198_44 then
				local var_198_45 = (arg_195_1.time_ - var_198_43) / var_198_44
				local var_198_46 = Color.New(1, 1, 1)

				var_198_46.a = Mathf.Lerp(1, 0, var_198_45)
				arg_195_1.mask_.color = var_198_46
			end

			if arg_195_1.time_ >= var_198_43 + var_198_44 and arg_195_1.time_ < var_198_43 + var_198_44 + arg_198_0 then
				local var_198_47 = Color.New(1, 1, 1)
				local var_198_48 = 0

				arg_195_1.mask_.enabled = false
				var_198_47.a = var_198_48
				arg_195_1.mask_.color = var_198_47
			end

			local var_198_49 = "STwhite"

			if arg_195_1.bgs_[var_198_49] == nil then
				local var_198_50 = Object.Instantiate(arg_195_1.paintGo_)

				var_198_50:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_198_49)
				var_198_50.name = var_198_49
				var_198_50.transform.parent = arg_195_1.stage_.transform
				var_198_50.transform.localPosition = Vector3.New(0, 100, 0)
				arg_195_1.bgs_[var_198_49] = var_198_50
			end

			local var_198_51 = arg_195_1.bgs_.STwhite.transform
			local var_198_52 = 1.6

			if var_198_52 < arg_195_1.time_ and arg_195_1.time_ <= var_198_52 + arg_198_0 then
				arg_195_1.var_.moveOldPosSTwhite = var_198_51.localPosition
				var_198_51.localScale = Vector3.New(13, 13, 13)
			end

			local var_198_53 = 0.001

			if var_198_52 <= arg_195_1.time_ and arg_195_1.time_ < var_198_52 + var_198_53 then
				local var_198_54 = (arg_195_1.time_ - var_198_52) / var_198_53
				local var_198_55 = Vector3.New(0, 0, 0)

				var_198_51.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPosSTwhite, var_198_55, var_198_54)
			end

			if arg_195_1.time_ >= var_198_52 + var_198_53 and arg_195_1.time_ < var_198_52 + var_198_53 + arg_198_0 then
				var_198_51.localPosition = Vector3.New(0, 0, 0)
			end

			if arg_195_1.frameCnt_ <= 1 then
				arg_195_1.dialog_:SetActive(false)
			end

			local var_198_56 = 2.38333333333333
			local var_198_57 = 0.15

			if var_198_56 < arg_195_1.time_ and arg_195_1.time_ <= var_198_56 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0

				arg_195_1.dialog_:SetActive(true)

				local var_198_58 = LeanTween.value(arg_195_1.dialog_, 0, 1, 0.3)

				var_198_58:setOnUpdate(LuaHelper.FloatAction(function(arg_199_0)
					arg_195_1.dialogCg_.alpha = arg_199_0
				end))
				var_198_58:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_195_1.dialog_)
					var_198_58:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_195_1.duration_ = arg_195_1.duration_ + 0.3

				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_59 = arg_195_1:FormatText(StoryNameCfg[68].name)

				arg_195_1.leftNameTxt_.text = var_198_59

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, true)
				arg_195_1.iconController_:SetSelectedState("hero")

				arg_195_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3021")

				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_60 = arg_195_1:GetWordFromCfg(900701046)
				local var_198_61 = arg_195_1:FormatText(var_198_60.content)

				arg_195_1.text_.text = var_198_61

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_62 = 6
				local var_198_63 = utf8.len(var_198_61)
				local var_198_64 = var_198_62 <= 0 and var_198_57 or var_198_57 * (var_198_63 / var_198_62)

				if var_198_64 > 0 and var_198_57 < var_198_64 then
					arg_195_1.talkMaxDuration = var_198_64
					var_198_56 = var_198_56 + 0.3

					if var_198_64 + var_198_56 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_64 + var_198_56
					end
				end

				arg_195_1.text_.text = var_198_61
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)
				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_65 = var_198_56 + 0.3
			local var_198_66 = math.max(var_198_57, arg_195_1.talkMaxDuration)

			if var_198_65 <= arg_195_1.time_ and arg_195_1.time_ < var_198_65 + var_198_66 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_65) / var_198_66

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_65 + var_198_66 and arg_195_1.time_ < var_198_65 + var_198_66 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play900701047 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 900701047
		arg_201_1.duration_ = 7.5

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play900701048(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = 1.5

			if var_204_0 < arg_201_1.time_ and arg_201_1.time_ <= var_204_0 + arg_204_0 then
				local var_204_1 = manager.ui.mainCamera.transform.localPosition
				local var_204_2 = Vector3.New(0, 0, 10) + Vector3.New(var_204_1.x, var_204_1.y, 0)
				local var_204_3 = arg_201_1.bgs_.OM0602

				var_204_3.transform.localPosition = var_204_2
				var_204_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_204_4 = var_204_3:GetComponent("SpriteRenderer")

				if var_204_4 and var_204_4.sprite then
					local var_204_5 = (var_204_3.transform.localPosition - var_204_1).z
					local var_204_6 = manager.ui.mainCameraCom_
					local var_204_7 = 2 * var_204_5 * Mathf.Tan(var_204_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_204_8 = var_204_7 * var_204_6.aspect
					local var_204_9 = var_204_4.sprite.bounds.size.x
					local var_204_10 = var_204_4.sprite.bounds.size.y
					local var_204_11 = var_204_8 / var_204_9
					local var_204_12 = var_204_7 / var_204_10
					local var_204_13 = var_204_12 < var_204_11 and var_204_11 or var_204_12

					var_204_3.transform.localScale = Vector3.New(var_204_13, var_204_13, 0)
				end

				for iter_204_0, iter_204_1 in pairs(arg_201_1.bgs_) do
					if iter_204_0 ~= "OM0602" then
						iter_204_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_204_14 = 0

			if var_204_14 < arg_201_1.time_ and arg_201_1.time_ <= var_204_14 + arg_204_0 then
				arg_201_1.mask_.enabled = true
				arg_201_1.mask_.raycastTarget = true

				arg_201_1:SetGaussion(false)
			end

			local var_204_15 = 1.5

			if var_204_14 <= arg_201_1.time_ and arg_201_1.time_ < var_204_14 + var_204_15 then
				local var_204_16 = (arg_201_1.time_ - var_204_14) / var_204_15
				local var_204_17 = Color.New(0, 0, 0)

				var_204_17.a = Mathf.Lerp(0, 1, var_204_16)
				arg_201_1.mask_.color = var_204_17
			end

			if arg_201_1.time_ >= var_204_14 + var_204_15 and arg_201_1.time_ < var_204_14 + var_204_15 + arg_204_0 then
				local var_204_18 = Color.New(0, 0, 0)

				var_204_18.a = 1
				arg_201_1.mask_.color = var_204_18
			end

			local var_204_19 = 1.5

			if var_204_19 < arg_201_1.time_ and arg_201_1.time_ <= var_204_19 + arg_204_0 then
				arg_201_1.mask_.enabled = true
				arg_201_1.mask_.raycastTarget = false

				arg_201_1:SetGaussion(false)
			end

			local var_204_20 = 1

			if var_204_19 <= arg_201_1.time_ and arg_201_1.time_ < var_204_19 + var_204_20 then
				local var_204_21 = (arg_201_1.time_ - var_204_19) / var_204_20
				local var_204_22 = Color.New(0, 0, 0)

				var_204_22.a = Mathf.Lerp(1, 0, var_204_21)
				arg_201_1.mask_.color = var_204_22
			end

			if arg_201_1.time_ >= var_204_19 + var_204_20 and arg_201_1.time_ < var_204_19 + var_204_20 + arg_204_0 then
				local var_204_23 = Color.New(0, 0, 0)
				local var_204_24 = 0

				arg_201_1.mask_.enabled = false
				var_204_23.a = var_204_24
				arg_201_1.mask_.color = var_204_23
			end

			local var_204_25 = manager.ui.mainCamera.transform
			local var_204_26 = 1.5

			if var_204_26 < arg_201_1.time_ and arg_201_1.time_ <= var_204_26 + arg_204_0 then
				local var_204_27 = arg_201_1.var_.effect1234

				if not var_204_27 then
					var_204_27 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ui_red"))
					var_204_27.name = "1234"
					arg_201_1.var_.effect1234 = var_204_27
				end

				local var_204_28 = var_204_25:Find("")

				if var_204_28 then
					var_204_27.transform.parent = var_204_28
				else
					var_204_27.transform.parent = var_204_25
				end

				var_204_27.transform.localPosition = Vector3.New(0, 0, 0.4)
				var_204_27.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_204_29 = 2.03333333333333

			if var_204_29 < arg_201_1.time_ and arg_201_1.time_ <= var_204_29 + arg_204_0 then
				arg_201_1.mask_.enabled = true
				arg_201_1.mask_.raycastTarget = true

				arg_201_1:SetGaussion(false)
			end

			local var_204_30 = 0.466666666666666

			if var_204_29 <= arg_201_1.time_ and arg_201_1.time_ < var_204_29 + var_204_30 then
				local var_204_31 = (arg_201_1.time_ - var_204_29) / var_204_30
				local var_204_32 = Color.New(1, 1, 1)

				var_204_32.a = Mathf.Lerp(1, 0, var_204_31)
				arg_201_1.mask_.color = var_204_32
			end

			if arg_201_1.time_ >= var_204_29 + var_204_30 and arg_201_1.time_ < var_204_29 + var_204_30 + arg_204_0 then
				local var_204_33 = Color.New(1, 1, 1)
				local var_204_34 = 0

				arg_201_1.mask_.enabled = false
				var_204_33.a = var_204_34
				arg_201_1.mask_.color = var_204_33
			end

			local var_204_35 = arg_201_1.bgs_.OM0602.transform
			local var_204_36 = 1.5

			if var_204_36 < arg_201_1.time_ and arg_201_1.time_ <= var_204_36 + arg_204_0 then
				arg_201_1.var_.moveOldPosOM0602 = var_204_35.localPosition
			end

			local var_204_37 = 0.001

			if var_204_36 <= arg_201_1.time_ and arg_201_1.time_ < var_204_36 + var_204_37 then
				local var_204_38 = (arg_201_1.time_ - var_204_36) / var_204_37
				local var_204_39 = Vector3.New(0.5, 1.96, 8)

				var_204_35.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPosOM0602, var_204_39, var_204_38)
			end

			if arg_201_1.time_ >= var_204_36 + var_204_37 and arg_201_1.time_ < var_204_36 + var_204_37 + arg_204_0 then
				var_204_35.localPosition = Vector3.New(0.5, 1.96, 8)
			end

			local var_204_40 = arg_201_1.bgs_.OM0602.transform
			local var_204_41 = 1.534

			if var_204_41 < arg_201_1.time_ and arg_201_1.time_ <= var_204_41 + arg_204_0 then
				arg_201_1.var_.moveOldPosOM0602 = var_204_40.localPosition
			end

			local var_204_42 = 0.499333333333334

			if var_204_41 <= arg_201_1.time_ and arg_201_1.time_ < var_204_41 + var_204_42 then
				local var_204_43 = (arg_201_1.time_ - var_204_41) / var_204_42
				local var_204_44 = Vector3.New(-2.1, 0.45, 8)

				var_204_40.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPosOM0602, var_204_44, var_204_43)
			end

			if arg_201_1.time_ >= var_204_41 + var_204_42 and arg_201_1.time_ < var_204_41 + var_204_42 + arg_204_0 then
				var_204_40.localPosition = Vector3.New(-2.1, 0.45, 8)
			end

			if arg_201_1.frameCnt_ <= 1 then
				arg_201_1.dialog_:SetActive(false)
			end

			local var_204_45 = 2.5
			local var_204_46 = 0.275

			if var_204_45 < arg_201_1.time_ and arg_201_1.time_ <= var_204_45 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0

				arg_201_1.dialog_:SetActive(true)

				local var_204_47 = LeanTween.value(arg_201_1.dialog_, 0, 1, 0.3)

				var_204_47:setOnUpdate(LuaHelper.FloatAction(function(arg_205_0)
					arg_201_1.dialogCg_.alpha = arg_205_0
				end))
				var_204_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_201_1.dialog_)
					var_204_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_201_1.duration_ = arg_201_1.duration_ + 0.3

				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_48 = arg_201_1:FormatText(StoryNameCfg[235].name)

				arg_201_1.leftNameTxt_.text = var_204_48

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_49 = arg_201_1:GetWordFromCfg(900701047)
				local var_204_50 = arg_201_1:FormatText(var_204_49.content)

				arg_201_1.text_.text = var_204_50

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_51 = 11
				local var_204_52 = utf8.len(var_204_50)
				local var_204_53 = var_204_51 <= 0 and var_204_46 or var_204_46 * (var_204_52 / var_204_51)

				if var_204_53 > 0 and var_204_46 < var_204_53 then
					arg_201_1.talkMaxDuration = var_204_53
					var_204_45 = var_204_45 + 0.3

					if var_204_53 + var_204_45 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_53 + var_204_45
					end
				end

				arg_201_1.text_.text = var_204_50
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)
				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_54 = var_204_45 + 0.3
			local var_204_55 = math.max(var_204_46, arg_201_1.talkMaxDuration)

			if var_204_54 <= arg_201_1.time_ and arg_201_1.time_ < var_204_54 + var_204_55 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_54) / var_204_55

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_54 + var_204_55 and arg_201_1.time_ < var_204_54 + var_204_55 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play900701048 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 900701048
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play900701049(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 0.225

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_2 = arg_207_1:FormatText(StoryNameCfg[235].name)

				arg_207_1.leftNameTxt_.text = var_210_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_3 = arg_207_1:GetWordFromCfg(900701048)
				local var_210_4 = arg_207_1:FormatText(var_210_3.content)

				arg_207_1.text_.text = var_210_4

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_5 = 9
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
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_8 = math.max(var_210_1, arg_207_1.talkMaxDuration)

			if var_210_0 <= arg_207_1.time_ and arg_207_1.time_ < var_210_0 + var_210_8 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_0) / var_210_8

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_0 + var_210_8 and arg_207_1.time_ < var_210_0 + var_210_8 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play900701049 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 900701049
		arg_211_1.duration_ = 5.2

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play900701050(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = manager.ui.mainCamera.transform
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 then
				arg_211_1.var_.shakeOldPos = var_214_0.localPosition
			end

			local var_214_2 = 0.2

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / 0.099
				local var_214_4, var_214_5 = math.modf(var_214_3)

				var_214_0.localPosition = Vector3.New(var_214_5 * 0.13, var_214_5 * 0.13, var_214_5 * 0.13) + arg_211_1.var_.shakeOldPos
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 then
				var_214_0.localPosition = arg_211_1.var_.shakeOldPos
			end

			local var_214_6 = arg_211_1.bgs_.OM0602.transform
			local var_214_7 = 0.2

			if var_214_7 < arg_211_1.time_ and arg_211_1.time_ <= var_214_7 + arg_214_0 then
				arg_211_1.var_.moveOldPosOM0602 = var_214_6.localPosition
			end

			local var_214_8 = 0.001

			if var_214_7 <= arg_211_1.time_ and arg_211_1.time_ < var_214_7 + var_214_8 then
				local var_214_9 = (arg_211_1.time_ - var_214_7) / var_214_8
				local var_214_10 = Vector3.New(3.73, -0.25, 3)

				var_214_6.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPosOM0602, var_214_10, var_214_9)
			end

			if arg_211_1.time_ >= var_214_7 + var_214_8 and arg_211_1.time_ < var_214_7 + var_214_8 + arg_214_0 then
				var_214_6.localPosition = Vector3.New(3.73, -0.25, 3)
			end

			if arg_211_1.frameCnt_ <= 1 then
				arg_211_1.dialog_:SetActive(false)
			end

			local var_214_11 = 0.2
			local var_214_12 = 0.2

			if var_214_11 < arg_211_1.time_ and arg_211_1.time_ <= var_214_11 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0

				arg_211_1.dialog_:SetActive(true)

				local var_214_13 = LeanTween.value(arg_211_1.dialog_, 0, 1, 0.3)

				var_214_13:setOnUpdate(LuaHelper.FloatAction(function(arg_215_0)
					arg_211_1.dialogCg_.alpha = arg_215_0
				end))
				var_214_13:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_211_1.dialog_)
					var_214_13:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_211_1.duration_ = arg_211_1.duration_ + 0.3

				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_14 = arg_211_1:FormatText(StoryNameCfg[236].name)

				arg_211_1.leftNameTxt_.text = var_214_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_15 = arg_211_1:GetWordFromCfg(900701049)
				local var_214_16 = arg_211_1:FormatText(var_214_15.content)

				arg_211_1.text_.text = var_214_16

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_17 = 8
				local var_214_18 = utf8.len(var_214_16)
				local var_214_19 = var_214_17 <= 0 and var_214_12 or var_214_12 * (var_214_18 / var_214_17)

				if var_214_19 > 0 and var_214_12 < var_214_19 then
					arg_211_1.talkMaxDuration = var_214_19
					var_214_11 = var_214_11 + 0.3

					if var_214_19 + var_214_11 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_19 + var_214_11
					end
				end

				arg_211_1.text_.text = var_214_16
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_20 = var_214_11 + 0.3
			local var_214_21 = math.max(var_214_12, arg_211_1.talkMaxDuration)

			if var_214_20 <= arg_211_1.time_ and arg_211_1.time_ < var_214_20 + var_214_21 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_20) / var_214_21

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_20 + var_214_21 and arg_211_1.time_ < var_214_20 + var_214_21 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play900701050 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 900701050
		arg_217_1.duration_ = 7

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play900701051(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.mask_.enabled = true
				arg_217_1.mask_.raycastTarget = true

				arg_217_1:SetGaussion(false)
			end

			local var_220_1 = 1

			if var_220_0 <= arg_217_1.time_ and arg_217_1.time_ < var_220_0 + var_220_1 then
				local var_220_2 = (arg_217_1.time_ - var_220_0) / var_220_1
				local var_220_3 = Color.New(1, 1, 1)

				var_220_3.a = Mathf.Lerp(0, 1, var_220_2)
				arg_217_1.mask_.color = var_220_3
			end

			if arg_217_1.time_ >= var_220_0 + var_220_1 and arg_217_1.time_ < var_220_0 + var_220_1 + arg_220_0 then
				local var_220_4 = Color.New(1, 1, 1)

				var_220_4.a = 1
				arg_217_1.mask_.color = var_220_4
			end

			local var_220_5 = 1

			if var_220_5 < arg_217_1.time_ and arg_217_1.time_ <= var_220_5 + arg_220_0 then
				arg_217_1.mask_.enabled = true
				arg_217_1.mask_.raycastTarget = true

				arg_217_1:SetGaussion(false)
			end

			local var_220_6 = 1

			if var_220_5 <= arg_217_1.time_ and arg_217_1.time_ < var_220_5 + var_220_6 then
				local var_220_7 = (arg_217_1.time_ - var_220_5) / var_220_6
				local var_220_8 = Color.New(1, 1, 1)

				var_220_8.a = Mathf.Lerp(1, 0, var_220_7)
				arg_217_1.mask_.color = var_220_8
			end

			if arg_217_1.time_ >= var_220_5 + var_220_6 and arg_217_1.time_ < var_220_5 + var_220_6 + arg_220_0 then
				local var_220_9 = Color.New(1, 1, 1)
				local var_220_10 = 0

				arg_217_1.mask_.enabled = false
				var_220_9.a = var_220_10
				arg_217_1.mask_.color = var_220_9
			end

			local var_220_11 = manager.ui.mainCamera.transform
			local var_220_12 = 0

			if var_220_12 < arg_217_1.time_ and arg_217_1.time_ <= var_220_12 + arg_220_0 then
				local var_220_13 = arg_217_1.var_.effect1234

				if var_220_13 then
					Object.Destroy(var_220_13)

					arg_217_1.var_.effect1234 = nil
				end
			end

			local var_220_14 = arg_217_1.bgs_.STwhite.transform
			local var_220_15 = 1

			if var_220_15 < arg_217_1.time_ and arg_217_1.time_ <= var_220_15 + arg_220_0 then
				arg_217_1.var_.moveOldPosSTwhite = var_220_14.localPosition
				var_220_14.localScale = Vector3.New(10, 10, 10)
			end

			local var_220_16 = 0.001

			if var_220_15 <= arg_217_1.time_ and arg_217_1.time_ < var_220_15 + var_220_16 then
				local var_220_17 = (arg_217_1.time_ - var_220_15) / var_220_16
				local var_220_18 = Vector3.New(0, 0, 0)

				var_220_14.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPosSTwhite, var_220_18, var_220_17)
			end

			if arg_217_1.time_ >= var_220_15 + var_220_16 and arg_217_1.time_ < var_220_15 + var_220_16 + arg_220_0 then
				var_220_14.localPosition = Vector3.New(0, 0, 0)
			end

			if arg_217_1.frameCnt_ <= 1 then
				arg_217_1.dialog_:SetActive(false)
			end

			local var_220_19 = 2
			local var_220_20 = 1.15

			if var_220_19 < arg_217_1.time_ and arg_217_1.time_ <= var_220_19 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0

				arg_217_1.dialog_:SetActive(true)

				local var_220_21 = LeanTween.value(arg_217_1.dialog_, 0, 1, 0.3)

				var_220_21:setOnUpdate(LuaHelper.FloatAction(function(arg_221_0)
					arg_217_1.dialogCg_.alpha = arg_221_0
				end))
				var_220_21:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_217_1.dialog_)
					var_220_21:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_217_1.duration_ = arg_217_1.duration_ + 0.3

				SetActive(arg_217_1.leftNameGo_, false)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_22 = arg_217_1:GetWordFromCfg(900701050)
				local var_220_23 = arg_217_1:FormatText(var_220_22.content)

				arg_217_1.text_.text = var_220_23

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_24 = 46
				local var_220_25 = utf8.len(var_220_23)
				local var_220_26 = var_220_24 <= 0 and var_220_20 or var_220_20 * (var_220_25 / var_220_24)

				if var_220_26 > 0 and var_220_20 < var_220_26 then
					arg_217_1.talkMaxDuration = var_220_26
					var_220_19 = var_220_19 + 0.3

					if var_220_26 + var_220_19 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_26 + var_220_19
					end
				end

				arg_217_1.text_.text = var_220_23
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)
				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_27 = var_220_19 + 0.3
			local var_220_28 = math.max(var_220_20, arg_217_1.talkMaxDuration)

			if var_220_27 <= arg_217_1.time_ and arg_217_1.time_ < var_220_27 + var_220_28 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_27) / var_220_28

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_27 + var_220_28 and arg_217_1.time_ < var_220_27 + var_220_28 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play900701051 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 900701051
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play900701052(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = 0
			local var_226_1 = 1

			if var_226_0 < arg_223_1.time_ and arg_223_1.time_ <= var_226_0 + arg_226_0 then
				local var_226_2 = "play"
				local var_226_3 = "music"

				arg_223_1:AudioAction(var_226_2, var_226_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_226_4 = 0
			local var_226_5 = 0.75

			if var_226_4 < arg_223_1.time_ and arg_223_1.time_ <= var_226_4 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, false)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_6 = arg_223_1:GetWordFromCfg(900701051)
				local var_226_7 = arg_223_1:FormatText(var_226_6.content)

				arg_223_1.text_.text = var_226_7

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_8 = 30
				local var_226_9 = utf8.len(var_226_7)
				local var_226_10 = var_226_8 <= 0 and var_226_5 or var_226_5 * (var_226_9 / var_226_8)

				if var_226_10 > 0 and var_226_5 < var_226_10 then
					arg_223_1.talkMaxDuration = var_226_10

					if var_226_10 + var_226_4 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_10 + var_226_4
					end
				end

				arg_223_1.text_.text = var_226_7
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)
				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_11 = math.max(var_226_5, arg_223_1.talkMaxDuration)

			if var_226_4 <= arg_223_1.time_ and arg_223_1.time_ < var_226_4 + var_226_11 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_4) / var_226_11

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_4 + var_226_11 and arg_223_1.time_ < var_226_4 + var_226_11 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play900701052 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 900701052
		arg_227_1.duration_ = 7

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play900701053(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				local var_230_1 = manager.ui.mainCamera.transform.localPosition
				local var_230_2 = Vector3.New(0, 0, 10) + Vector3.New(var_230_1.x, var_230_1.y, 0)
				local var_230_3 = arg_227_1.bgs_.ST22a

				var_230_3.transform.localPosition = var_230_2
				var_230_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_230_4 = var_230_3:GetComponent("SpriteRenderer")

				if var_230_4 and var_230_4.sprite then
					local var_230_5 = (var_230_3.transform.localPosition - var_230_1).z
					local var_230_6 = manager.ui.mainCameraCom_
					local var_230_7 = 2 * var_230_5 * Mathf.Tan(var_230_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_230_8 = var_230_7 * var_230_6.aspect
					local var_230_9 = var_230_4.sprite.bounds.size.x
					local var_230_10 = var_230_4.sprite.bounds.size.y
					local var_230_11 = var_230_8 / var_230_9
					local var_230_12 = var_230_7 / var_230_10
					local var_230_13 = var_230_12 < var_230_11 and var_230_11 or var_230_12

					var_230_3.transform.localScale = Vector3.New(var_230_13, var_230_13, 0)
				end

				for iter_230_0, iter_230_1 in pairs(arg_227_1.bgs_) do
					if iter_230_0 ~= "ST22a" then
						iter_230_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_230_14 = 0

			if var_230_14 < arg_227_1.time_ and arg_227_1.time_ <= var_230_14 + arg_230_0 then
				arg_227_1.mask_.enabled = true
				arg_227_1.mask_.raycastTarget = true

				arg_227_1:SetGaussion(false)
			end

			local var_230_15 = 2

			if var_230_14 <= arg_227_1.time_ and arg_227_1.time_ < var_230_14 + var_230_15 then
				local var_230_16 = (arg_227_1.time_ - var_230_14) / var_230_15
				local var_230_17 = Color.New(1, 1, 1)

				var_230_17.a = Mathf.Lerp(1, 0, var_230_16)
				arg_227_1.mask_.color = var_230_17
			end

			if arg_227_1.time_ >= var_230_14 + var_230_15 and arg_227_1.time_ < var_230_14 + var_230_15 + arg_230_0 then
				local var_230_18 = Color.New(1, 1, 1)
				local var_230_19 = 0

				arg_227_1.mask_.enabled = false
				var_230_18.a = var_230_19
				arg_227_1.mask_.color = var_230_18
			end

			if arg_227_1.frameCnt_ <= 1 then
				arg_227_1.dialog_:SetActive(false)
			end

			local var_230_20 = 2
			local var_230_21 = 0.85

			if var_230_20 < arg_227_1.time_ and arg_227_1.time_ <= var_230_20 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0

				arg_227_1.dialog_:SetActive(true)

				local var_230_22 = LeanTween.value(arg_227_1.dialog_, 0, 1, 0.3)

				var_230_22:setOnUpdate(LuaHelper.FloatAction(function(arg_231_0)
					arg_227_1.dialogCg_.alpha = arg_231_0
				end))
				var_230_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_227_1.dialog_)
					var_230_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_227_1.duration_ = arg_227_1.duration_ + 0.3

				SetActive(arg_227_1.leftNameGo_, false)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_23 = arg_227_1:GetWordFromCfg(900701052)
				local var_230_24 = arg_227_1:FormatText(var_230_23.content)

				arg_227_1.text_.text = var_230_24

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_25 = 34
				local var_230_26 = utf8.len(var_230_24)
				local var_230_27 = var_230_25 <= 0 and var_230_21 or var_230_21 * (var_230_26 / var_230_25)

				if var_230_27 > 0 and var_230_21 < var_230_27 then
					arg_227_1.talkMaxDuration = var_230_27
					var_230_20 = var_230_20 + 0.3

					if var_230_27 + var_230_20 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_27 + var_230_20
					end
				end

				arg_227_1.text_.text = var_230_24
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)
				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_28 = var_230_20 + 0.3
			local var_230_29 = math.max(var_230_21, arg_227_1.talkMaxDuration)

			if var_230_28 <= arg_227_1.time_ and arg_227_1.time_ < var_230_28 + var_230_29 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_28) / var_230_29

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_28 + var_230_29 and arg_227_1.time_ < var_230_28 + var_230_29 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play900701053 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 900701053
		arg_233_1.duration_ = 5

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play900701054(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["1033"].transform
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				arg_233_1.var_.moveOldPos1033 = var_236_0.localPosition
				var_236_0.localScale = Vector3.New(1, 1, 1)

				arg_233_1:CheckSpriteTmpPos("1033", 2)

				local var_236_2 = var_236_0.childCount

				for iter_236_0 = 0, var_236_2 - 1 do
					local var_236_3 = var_236_0:GetChild(iter_236_0)

					if var_236_3.name == "split_5" or not string.find(var_236_3.name, "split") then
						var_236_3.gameObject:SetActive(true)
					else
						var_236_3.gameObject:SetActive(false)
					end
				end
			end

			local var_236_4 = 0.001

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_4 then
				local var_236_5 = (arg_233_1.time_ - var_236_1) / var_236_4
				local var_236_6 = Vector3.New(-390, -420, 0)

				var_236_0.localPosition = Vector3.Lerp(arg_233_1.var_.moveOldPos1033, var_236_6, var_236_5)
			end

			if arg_233_1.time_ >= var_236_1 + var_236_4 and arg_233_1.time_ < var_236_1 + var_236_4 + arg_236_0 then
				var_236_0.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_236_7 = arg_233_1.actors_["1033"]
			local var_236_8 = 0

			if var_236_8 < arg_233_1.time_ and arg_233_1.time_ <= var_236_8 + arg_236_0 and arg_233_1.var_.actorSpriteComps1033 == nil then
				arg_233_1.var_.actorSpriteComps1033 = var_236_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_236_9 = 0.2

			if var_236_8 <= arg_233_1.time_ and arg_233_1.time_ < var_236_8 + var_236_9 then
				local var_236_10 = (arg_233_1.time_ - var_236_8) / var_236_9

				if arg_233_1.var_.actorSpriteComps1033 then
					for iter_236_1, iter_236_2 in pairs(arg_233_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_236_2 then
							local var_236_11 = Mathf.Lerp(iter_236_2.color.r, 0.5, var_236_10)

							iter_236_2.color = Color.New(var_236_11, var_236_11, var_236_11)
						end
					end
				end
			end

			if arg_233_1.time_ >= var_236_8 + var_236_9 and arg_233_1.time_ < var_236_8 + var_236_9 + arg_236_0 and arg_233_1.var_.actorSpriteComps1033 then
				local var_236_12 = 0.5

				for iter_236_3, iter_236_4 in pairs(arg_233_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_236_4 then
						iter_236_4.color = Color.New(var_236_12, var_236_12, var_236_12)
					end
				end

				arg_233_1.var_.actorSpriteComps1033 = nil
			end

			local var_236_13 = arg_233_1.actors_["10022"].transform
			local var_236_14 = 0

			if var_236_14 < arg_233_1.time_ and arg_233_1.time_ <= var_236_14 + arg_236_0 then
				arg_233_1.var_.moveOldPos10022 = var_236_13.localPosition
				var_236_13.localScale = Vector3.New(1, 1, 1)

				arg_233_1:CheckSpriteTmpPos("10022", 4)

				local var_236_15 = var_236_13.childCount

				for iter_236_5 = 0, var_236_15 - 1 do
					local var_236_16 = var_236_13:GetChild(iter_236_5)

					if var_236_16.name == "split_3" or not string.find(var_236_16.name, "split") then
						var_236_16.gameObject:SetActive(true)
					else
						var_236_16.gameObject:SetActive(false)
					end
				end
			end

			local var_236_17 = 0.001

			if var_236_14 <= arg_233_1.time_ and arg_233_1.time_ < var_236_14 + var_236_17 then
				local var_236_18 = (arg_233_1.time_ - var_236_14) / var_236_17
				local var_236_19 = Vector3.New(390, -350, -180)

				var_236_13.localPosition = Vector3.Lerp(arg_233_1.var_.moveOldPos10022, var_236_19, var_236_18)
			end

			if arg_233_1.time_ >= var_236_14 + var_236_17 and arg_233_1.time_ < var_236_14 + var_236_17 + arg_236_0 then
				var_236_13.localPosition = Vector3.New(390, -350, -180)
			end

			local var_236_20 = arg_233_1.actors_["10022"]
			local var_236_21 = 0

			if var_236_21 < arg_233_1.time_ and arg_233_1.time_ <= var_236_21 + arg_236_0 and arg_233_1.var_.actorSpriteComps10022 == nil then
				arg_233_1.var_.actorSpriteComps10022 = var_236_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_236_22 = 0.2

			if var_236_21 <= arg_233_1.time_ and arg_233_1.time_ < var_236_21 + var_236_22 then
				local var_236_23 = (arg_233_1.time_ - var_236_21) / var_236_22

				if arg_233_1.var_.actorSpriteComps10022 then
					for iter_236_6, iter_236_7 in pairs(arg_233_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_236_7 then
							local var_236_24 = Mathf.Lerp(iter_236_7.color.r, 1, var_236_23)

							iter_236_7.color = Color.New(var_236_24, var_236_24, var_236_24)
						end
					end
				end
			end

			if arg_233_1.time_ >= var_236_21 + var_236_22 and arg_233_1.time_ < var_236_21 + var_236_22 + arg_236_0 and arg_233_1.var_.actorSpriteComps10022 then
				local var_236_25 = 1

				for iter_236_8, iter_236_9 in pairs(arg_233_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_236_9 then
						iter_236_9.color = Color.New(var_236_25, var_236_25, var_236_25)
					end
				end

				arg_233_1.var_.actorSpriteComps10022 = nil
			end

			local var_236_26 = arg_233_1.actors_["1033"]
			local var_236_27 = 0

			if var_236_27 < arg_233_1.time_ and arg_233_1.time_ <= var_236_27 + arg_236_0 then
				local var_236_28 = var_236_26:GetComponentInChildren(typeof(CanvasGroup))

				if var_236_28 then
					arg_233_1.var_.alphaOldValue1033 = var_236_28.alpha
					arg_233_1.var_.characterEffect1033 = var_236_28
				end

				arg_233_1.var_.alphaOldValue1033 = 0
			end

			local var_236_29 = 0.2

			if var_236_27 <= arg_233_1.time_ and arg_233_1.time_ < var_236_27 + var_236_29 then
				local var_236_30 = (arg_233_1.time_ - var_236_27) / var_236_29
				local var_236_31 = Mathf.Lerp(arg_233_1.var_.alphaOldValue1033, 1, var_236_30)

				if arg_233_1.var_.characterEffect1033 then
					arg_233_1.var_.characterEffect1033.alpha = var_236_31
				end
			end

			if arg_233_1.time_ >= var_236_27 + var_236_29 and arg_233_1.time_ < var_236_27 + var_236_29 + arg_236_0 and arg_233_1.var_.characterEffect1033 then
				arg_233_1.var_.characterEffect1033.alpha = 1
			end

			local var_236_32 = arg_233_1.actors_["10022"]
			local var_236_33 = 0

			if var_236_33 < arg_233_1.time_ and arg_233_1.time_ <= var_236_33 + arg_236_0 then
				local var_236_34 = var_236_32:GetComponentInChildren(typeof(CanvasGroup))

				if var_236_34 then
					arg_233_1.var_.alphaOldValue10022 = var_236_34.alpha
					arg_233_1.var_.characterEffect10022 = var_236_34
				end

				arg_233_1.var_.alphaOldValue10022 = 0
			end

			local var_236_35 = 0.2

			if var_236_33 <= arg_233_1.time_ and arg_233_1.time_ < var_236_33 + var_236_35 then
				local var_236_36 = (arg_233_1.time_ - var_236_33) / var_236_35
				local var_236_37 = Mathf.Lerp(arg_233_1.var_.alphaOldValue10022, 1, var_236_36)

				if arg_233_1.var_.characterEffect10022 then
					arg_233_1.var_.characterEffect10022.alpha = var_236_37
				end
			end

			if arg_233_1.time_ >= var_236_33 + var_236_35 and arg_233_1.time_ < var_236_33 + var_236_35 + arg_236_0 and arg_233_1.var_.characterEffect10022 then
				arg_233_1.var_.characterEffect10022.alpha = 1
			end

			local var_236_38 = 0
			local var_236_39 = 0.275

			if var_236_38 < arg_233_1.time_ and arg_233_1.time_ <= var_236_38 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_40 = arg_233_1:FormatText(StoryNameCfg[235].name)

				arg_233_1.leftNameTxt_.text = var_236_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_41 = arg_233_1:GetWordFromCfg(900701053)
				local var_236_42 = arg_233_1:FormatText(var_236_41.content)

				arg_233_1.text_.text = var_236_42

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_43 = 11
				local var_236_44 = utf8.len(var_236_42)
				local var_236_45 = var_236_43 <= 0 and var_236_39 or var_236_39 * (var_236_44 / var_236_43)

				if var_236_45 > 0 and var_236_39 < var_236_45 then
					arg_233_1.talkMaxDuration = var_236_45

					if var_236_45 + var_236_38 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_45 + var_236_38
					end
				end

				arg_233_1.text_.text = var_236_42
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)
				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_46 = math.max(var_236_39, arg_233_1.talkMaxDuration)

			if var_236_38 <= arg_233_1.time_ and arg_233_1.time_ < var_236_38 + var_236_46 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_38) / var_236_46

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_38 + var_236_46 and arg_233_1.time_ < var_236_38 + var_236_46 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play900701054 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 900701054
		arg_237_1.duration_ = 5

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play900701055(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1033"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.actorSpriteComps1033 == nil then
				arg_237_1.var_.actorSpriteComps1033 = var_240_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_240_2 = 0.2

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.actorSpriteComps1033 then
					for iter_240_0, iter_240_1 in pairs(arg_237_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_240_1 then
							local var_240_4 = Mathf.Lerp(iter_240_1.color.r, 1, var_240_3)

							iter_240_1.color = Color.New(var_240_4, var_240_4, var_240_4)
						end
					end
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.actorSpriteComps1033 then
				local var_240_5 = 1

				for iter_240_2, iter_240_3 in pairs(arg_237_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_240_3 then
						iter_240_3.color = Color.New(var_240_5, var_240_5, var_240_5)
					end
				end

				arg_237_1.var_.actorSpriteComps1033 = nil
			end

			local var_240_6 = arg_237_1.actors_["10022"]
			local var_240_7 = 0

			if var_240_7 < arg_237_1.time_ and arg_237_1.time_ <= var_240_7 + arg_240_0 and arg_237_1.var_.actorSpriteComps10022 == nil then
				arg_237_1.var_.actorSpriteComps10022 = var_240_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_240_8 = 0.2

			if var_240_7 <= arg_237_1.time_ and arg_237_1.time_ < var_240_7 + var_240_8 then
				local var_240_9 = (arg_237_1.time_ - var_240_7) / var_240_8

				if arg_237_1.var_.actorSpriteComps10022 then
					for iter_240_4, iter_240_5 in pairs(arg_237_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_240_5 then
							local var_240_10 = Mathf.Lerp(iter_240_5.color.r, 0.5, var_240_9)

							iter_240_5.color = Color.New(var_240_10, var_240_10, var_240_10)
						end
					end
				end
			end

			if arg_237_1.time_ >= var_240_7 + var_240_8 and arg_237_1.time_ < var_240_7 + var_240_8 + arg_240_0 and arg_237_1.var_.actorSpriteComps10022 then
				local var_240_11 = 0.5

				for iter_240_6, iter_240_7 in pairs(arg_237_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_240_7 then
						iter_240_7.color = Color.New(var_240_11, var_240_11, var_240_11)
					end
				end

				arg_237_1.var_.actorSpriteComps10022 = nil
			end

			local var_240_12 = 0
			local var_240_13 = 0.675

			if var_240_12 < arg_237_1.time_ and arg_237_1.time_ <= var_240_12 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_14 = arg_237_1:FormatText(StoryNameCfg[236].name)

				arg_237_1.leftNameTxt_.text = var_240_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_15 = arg_237_1:GetWordFromCfg(900701054)
				local var_240_16 = arg_237_1:FormatText(var_240_15.content)

				arg_237_1.text_.text = var_240_16

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_17 = 27
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
				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_20 = math.max(var_240_13, arg_237_1.talkMaxDuration)

			if var_240_12 <= arg_237_1.time_ and arg_237_1.time_ < var_240_12 + var_240_20 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_12) / var_240_20

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_12 + var_240_20 and arg_237_1.time_ < var_240_12 + var_240_20 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play900701055 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 900701055
		arg_241_1.duration_ = 5

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play900701056(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["1033"].transform
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				arg_241_1.var_.moveOldPos1033 = var_244_0.localPosition
				var_244_0.localScale = Vector3.New(1, 1, 1)

				arg_241_1:CheckSpriteTmpPos("1033", 7)

				local var_244_2 = var_244_0.childCount

				for iter_244_0 = 0, var_244_2 - 1 do
					local var_244_3 = var_244_0:GetChild(iter_244_0)

					if var_244_3.name == "split_5" or not string.find(var_244_3.name, "split") then
						var_244_3.gameObject:SetActive(true)
					else
						var_244_3.gameObject:SetActive(false)
					end
				end
			end

			local var_244_4 = 0.001

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_4 then
				local var_244_5 = (arg_241_1.time_ - var_244_1) / var_244_4
				local var_244_6 = Vector3.New(0, -2000, 0)

				var_244_0.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos1033, var_244_6, var_244_5)
			end

			if arg_241_1.time_ >= var_244_1 + var_244_4 and arg_241_1.time_ < var_244_1 + var_244_4 + arg_244_0 then
				var_244_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_244_7 = arg_241_1.actors_["10022"].transform
			local var_244_8 = 0

			if var_244_8 < arg_241_1.time_ and arg_241_1.time_ <= var_244_8 + arg_244_0 then
				arg_241_1.var_.moveOldPos10022 = var_244_7.localPosition
				var_244_7.localScale = Vector3.New(1, 1, 1)

				arg_241_1:CheckSpriteTmpPos("10022", 7)

				local var_244_9 = var_244_7.childCount

				for iter_244_1 = 0, var_244_9 - 1 do
					local var_244_10 = var_244_7:GetChild(iter_244_1)

					if var_244_10.name == "split_3" or not string.find(var_244_10.name, "split") then
						var_244_10.gameObject:SetActive(true)
					else
						var_244_10.gameObject:SetActive(false)
					end
				end
			end

			local var_244_11 = 0.001

			if var_244_8 <= arg_241_1.time_ and arg_241_1.time_ < var_244_8 + var_244_11 then
				local var_244_12 = (arg_241_1.time_ - var_244_8) / var_244_11
				local var_244_13 = Vector3.New(0, -2000, -180)

				var_244_7.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos10022, var_244_13, var_244_12)
			end

			if arg_241_1.time_ >= var_244_8 + var_244_11 and arg_241_1.time_ < var_244_8 + var_244_11 + arg_244_0 then
				var_244_7.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_244_14 = 0
			local var_244_15 = 0.675

			if var_244_14 < arg_241_1.time_ and arg_241_1.time_ <= var_244_14 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, false)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_16 = arg_241_1:GetWordFromCfg(900701055)
				local var_244_17 = arg_241_1:FormatText(var_244_16.content)

				arg_241_1.text_.text = var_244_17

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_18 = 27
				local var_244_19 = utf8.len(var_244_17)
				local var_244_20 = var_244_18 <= 0 and var_244_15 or var_244_15 * (var_244_19 / var_244_18)

				if var_244_20 > 0 and var_244_15 < var_244_20 then
					arg_241_1.talkMaxDuration = var_244_20

					if var_244_20 + var_244_14 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_20 + var_244_14
					end
				end

				arg_241_1.text_.text = var_244_17
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)
				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_21 = math.max(var_244_15, arg_241_1.talkMaxDuration)

			if var_244_14 <= arg_241_1.time_ and arg_241_1.time_ < var_244_14 + var_244_21 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_14) / var_244_21

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_14 + var_244_21 and arg_241_1.time_ < var_244_14 + var_244_21 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play900701056 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 900701056
		arg_245_1.duration_ = 5

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play900701057(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["1038"].transform
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 then
				arg_245_1.var_.moveOldPos1038 = var_248_0.localPosition
				var_248_0.localScale = Vector3.New(-1, 1, 1)

				arg_245_1:CheckSpriteTmpPos("1038", 4)

				local var_248_2 = var_248_0.childCount

				for iter_248_0 = 0, var_248_2 - 1 do
					local var_248_3 = var_248_0:GetChild(iter_248_0)

					if var_248_3.name == "split_1" or not string.find(var_248_3.name, "split") then
						var_248_3.gameObject:SetActive(true)
					else
						var_248_3.gameObject:SetActive(false)
					end
				end
			end

			local var_248_4 = 0.001

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_4 then
				local var_248_5 = (arg_245_1.time_ - var_248_1) / var_248_4
				local var_248_6 = Vector3.New(390, -400, 0)

				var_248_0.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos1038, var_248_6, var_248_5)
			end

			if arg_245_1.time_ >= var_248_1 + var_248_4 and arg_245_1.time_ < var_248_1 + var_248_4 + arg_248_0 then
				var_248_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_248_7 = arg_245_1.actors_["1038"]
			local var_248_8 = 0

			if var_248_8 < arg_245_1.time_ and arg_245_1.time_ <= var_248_8 + arg_248_0 and arg_245_1.var_.actorSpriteComps1038 == nil then
				arg_245_1.var_.actorSpriteComps1038 = var_248_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_248_9 = 0.2

			if var_248_8 <= arg_245_1.time_ and arg_245_1.time_ < var_248_8 + var_248_9 then
				local var_248_10 = (arg_245_1.time_ - var_248_8) / var_248_9

				if arg_245_1.var_.actorSpriteComps1038 then
					for iter_248_1, iter_248_2 in pairs(arg_245_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_248_2 then
							local var_248_11 = Mathf.Lerp(iter_248_2.color.r, 1, var_248_10)

							iter_248_2.color = Color.New(var_248_11, var_248_11, var_248_11)
						end
					end
				end
			end

			if arg_245_1.time_ >= var_248_8 + var_248_9 and arg_245_1.time_ < var_248_8 + var_248_9 + arg_248_0 and arg_245_1.var_.actorSpriteComps1038 then
				local var_248_12 = 1

				for iter_248_3, iter_248_4 in pairs(arg_245_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_248_4 then
						iter_248_4.color = Color.New(var_248_12, var_248_12, var_248_12)
					end
				end

				arg_245_1.var_.actorSpriteComps1038 = nil
			end

			local var_248_13 = arg_245_1.actors_["1038"]
			local var_248_14 = 0

			if var_248_14 < arg_245_1.time_ and arg_245_1.time_ <= var_248_14 + arg_248_0 then
				local var_248_15 = var_248_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_248_15 then
					arg_245_1.var_.alphaOldValue1038 = var_248_15.alpha
					arg_245_1.var_.characterEffect1038 = var_248_15
				end

				arg_245_1.var_.alphaOldValue1038 = 0
			end

			local var_248_16 = 0.2

			if var_248_14 <= arg_245_1.time_ and arg_245_1.time_ < var_248_14 + var_248_16 then
				local var_248_17 = (arg_245_1.time_ - var_248_14) / var_248_16
				local var_248_18 = Mathf.Lerp(arg_245_1.var_.alphaOldValue1038, 1, var_248_17)

				if arg_245_1.var_.characterEffect1038 then
					arg_245_1.var_.characterEffect1038.alpha = var_248_18
				end
			end

			if arg_245_1.time_ >= var_248_14 + var_248_16 and arg_245_1.time_ < var_248_14 + var_248_16 + arg_248_0 and arg_245_1.var_.characterEffect1038 then
				arg_245_1.var_.characterEffect1038.alpha = 1
			end

			local var_248_19 = 0
			local var_248_20 = 0.25

			if var_248_19 < arg_245_1.time_ and arg_245_1.time_ <= var_248_19 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0

				arg_245_1.dialog_:SetActive(true)

				local var_248_21 = LeanTween.value(arg_245_1.dialog_, 0, 1, 0.3)

				var_248_21:setOnUpdate(LuaHelper.FloatAction(function(arg_249_0)
					arg_245_1.dialogCg_.alpha = arg_249_0
				end))
				var_248_21:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_245_1.dialog_)
					var_248_21:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_245_1.duration_ = arg_245_1.duration_ + 0.3

				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_22 = arg_245_1:FormatText(StoryNameCfg[94].name)

				arg_245_1.leftNameTxt_.text = var_248_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_23 = arg_245_1:GetWordFromCfg(900701056)
				local var_248_24 = arg_245_1:FormatText(var_248_23.content)

				arg_245_1.text_.text = var_248_24

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_25 = 10
				local var_248_26 = utf8.len(var_248_24)
				local var_248_27 = var_248_25 <= 0 and var_248_20 or var_248_20 * (var_248_26 / var_248_25)

				if var_248_27 > 0 and var_248_20 < var_248_27 then
					arg_245_1.talkMaxDuration = var_248_27
					var_248_19 = var_248_19 + 0.3

					if var_248_27 + var_248_19 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_27 + var_248_19
					end
				end

				arg_245_1.text_.text = var_248_24
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)
				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_28 = var_248_19 + 0.3
			local var_248_29 = math.max(var_248_20, arg_245_1.talkMaxDuration)

			if var_248_28 <= arg_245_1.time_ and arg_245_1.time_ < var_248_28 + var_248_29 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_28) / var_248_29

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_28 + var_248_29 and arg_245_1.time_ < var_248_28 + var_248_29 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play900701057 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 900701057
		arg_251_1.duration_ = 5

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play900701058(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = "1019"

			if arg_251_1.actors_[var_254_0] == nil then
				local var_254_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_254_0), arg_251_1.canvasGo_.transform)

				var_254_1.transform:SetSiblingIndex(1)

				var_254_1.name = var_254_0
				var_254_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_251_1.actors_[var_254_0] = var_254_1
			end

			local var_254_2 = arg_251_1.actors_["1019"].transform
			local var_254_3 = 0

			if var_254_3 < arg_251_1.time_ and arg_251_1.time_ <= var_254_3 + arg_254_0 then
				arg_251_1.var_.moveOldPos1019 = var_254_2.localPosition
				var_254_2.localScale = Vector3.New(1, 1, 1)

				arg_251_1:CheckSpriteTmpPos("1019", 2)

				local var_254_4 = var_254_2.childCount

				for iter_254_0 = 0, var_254_4 - 1 do
					local var_254_5 = var_254_2:GetChild(iter_254_0)

					if var_254_5.name == "split_1" or not string.find(var_254_5.name, "split") then
						var_254_5.gameObject:SetActive(true)
					else
						var_254_5.gameObject:SetActive(false)
					end
				end
			end

			local var_254_6 = 0.001

			if var_254_3 <= arg_251_1.time_ and arg_251_1.time_ < var_254_3 + var_254_6 then
				local var_254_7 = (arg_251_1.time_ - var_254_3) / var_254_6
				local var_254_8 = Vector3.New(-600, -340, 200)

				var_254_2.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1019, var_254_8, var_254_7)
			end

			if arg_251_1.time_ >= var_254_3 + var_254_6 and arg_251_1.time_ < var_254_3 + var_254_6 + arg_254_0 then
				var_254_2.localPosition = Vector3.New(-600, -340, 200)
			end

			local var_254_9 = arg_251_1.actors_["1019"]
			local var_254_10 = 0

			if var_254_10 < arg_251_1.time_ and arg_251_1.time_ <= var_254_10 + arg_254_0 and arg_251_1.var_.actorSpriteComps1019 == nil then
				arg_251_1.var_.actorSpriteComps1019 = var_254_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_11 = 0.2

			if var_254_10 <= arg_251_1.time_ and arg_251_1.time_ < var_254_10 + var_254_11 then
				local var_254_12 = (arg_251_1.time_ - var_254_10) / var_254_11

				if arg_251_1.var_.actorSpriteComps1019 then
					for iter_254_1, iter_254_2 in pairs(arg_251_1.var_.actorSpriteComps1019:ToTable()) do
						if iter_254_2 then
							local var_254_13 = Mathf.Lerp(iter_254_2.color.r, 1, var_254_12)

							iter_254_2.color = Color.New(var_254_13, var_254_13, var_254_13)
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_10 + var_254_11 and arg_251_1.time_ < var_254_10 + var_254_11 + arg_254_0 and arg_251_1.var_.actorSpriteComps1019 then
				local var_254_14 = 1

				for iter_254_3, iter_254_4 in pairs(arg_251_1.var_.actorSpriteComps1019:ToTable()) do
					if iter_254_4 then
						iter_254_4.color = Color.New(var_254_14, var_254_14, var_254_14)
					end
				end

				arg_251_1.var_.actorSpriteComps1019 = nil
			end

			local var_254_15 = arg_251_1.actors_["1038"]
			local var_254_16 = 0

			if var_254_16 < arg_251_1.time_ and arg_251_1.time_ <= var_254_16 + arg_254_0 and arg_251_1.var_.actorSpriteComps1038 == nil then
				arg_251_1.var_.actorSpriteComps1038 = var_254_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_17 = 0.2

			if var_254_16 <= arg_251_1.time_ and arg_251_1.time_ < var_254_16 + var_254_17 then
				local var_254_18 = (arg_251_1.time_ - var_254_16) / var_254_17

				if arg_251_1.var_.actorSpriteComps1038 then
					for iter_254_5, iter_254_6 in pairs(arg_251_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_254_6 then
							local var_254_19 = Mathf.Lerp(iter_254_6.color.r, 0.5, var_254_18)

							iter_254_6.color = Color.New(var_254_19, var_254_19, var_254_19)
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_16 + var_254_17 and arg_251_1.time_ < var_254_16 + var_254_17 + arg_254_0 and arg_251_1.var_.actorSpriteComps1038 then
				local var_254_20 = 0.5

				for iter_254_7, iter_254_8 in pairs(arg_251_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_254_8 then
						iter_254_8.color = Color.New(var_254_20, var_254_20, var_254_20)
					end
				end

				arg_251_1.var_.actorSpriteComps1038 = nil
			end

			local var_254_21 = arg_251_1.actors_["1019"]
			local var_254_22 = 0

			if var_254_22 < arg_251_1.time_ and arg_251_1.time_ <= var_254_22 + arg_254_0 then
				local var_254_23 = var_254_21:GetComponentInChildren(typeof(CanvasGroup))

				if var_254_23 then
					arg_251_1.var_.alphaOldValue1019 = var_254_23.alpha
					arg_251_1.var_.characterEffect1019 = var_254_23
				end

				arg_251_1.var_.alphaOldValue1019 = 0
			end

			local var_254_24 = 0.2

			if var_254_22 <= arg_251_1.time_ and arg_251_1.time_ < var_254_22 + var_254_24 then
				local var_254_25 = (arg_251_1.time_ - var_254_22) / var_254_24
				local var_254_26 = Mathf.Lerp(arg_251_1.var_.alphaOldValue1019, 1, var_254_25)

				if arg_251_1.var_.characterEffect1019 then
					arg_251_1.var_.characterEffect1019.alpha = var_254_26
				end
			end

			if arg_251_1.time_ >= var_254_22 + var_254_24 and arg_251_1.time_ < var_254_22 + var_254_24 + arg_254_0 and arg_251_1.var_.characterEffect1019 then
				arg_251_1.var_.characterEffect1019.alpha = 1
			end

			local var_254_27 = 0
			local var_254_28 = 0.25

			if var_254_27 < arg_251_1.time_ and arg_251_1.time_ <= var_254_27 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_29 = arg_251_1:FormatText(StoryNameCfg[13].name)

				arg_251_1.leftNameTxt_.text = var_254_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_30 = arg_251_1:GetWordFromCfg(900701057)
				local var_254_31 = arg_251_1:FormatText(var_254_30.content)

				arg_251_1.text_.text = var_254_31

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_32 = 10
				local var_254_33 = utf8.len(var_254_31)
				local var_254_34 = var_254_32 <= 0 and var_254_28 or var_254_28 * (var_254_33 / var_254_32)

				if var_254_34 > 0 and var_254_28 < var_254_34 then
					arg_251_1.talkMaxDuration = var_254_34

					if var_254_34 + var_254_27 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_34 + var_254_27
					end
				end

				arg_251_1.text_.text = var_254_31
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)
				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_35 = math.max(var_254_28, arg_251_1.talkMaxDuration)

			if var_254_27 <= arg_251_1.time_ and arg_251_1.time_ < var_254_27 + var_254_35 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_27) / var_254_35

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_27 + var_254_35 and arg_251_1.time_ < var_254_27 + var_254_35 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play900701058 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 900701058
		arg_255_1.duration_ = 5

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play900701059(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1019"].transform
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 then
				arg_255_1.var_.moveOldPos1019 = var_258_0.localPosition
				var_258_0.localScale = Vector3.New(1, 1, 1)

				arg_255_1:CheckSpriteTmpPos("1019", 7)

				local var_258_2 = var_258_0.childCount

				for iter_258_0 = 0, var_258_2 - 1 do
					local var_258_3 = var_258_0:GetChild(iter_258_0)

					if var_258_3.name == "split_1" or not string.find(var_258_3.name, "split") then
						var_258_3.gameObject:SetActive(true)
					else
						var_258_3.gameObject:SetActive(false)
					end
				end
			end

			local var_258_4 = 0.001

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_4 then
				local var_258_5 = (arg_255_1.time_ - var_258_1) / var_258_4
				local var_258_6 = Vector3.New(0, -2000, 200)

				var_258_0.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1019, var_258_6, var_258_5)
			end

			if arg_255_1.time_ >= var_258_1 + var_258_4 and arg_255_1.time_ < var_258_1 + var_258_4 + arg_258_0 then
				var_258_0.localPosition = Vector3.New(0, -2000, 200)
			end

			local var_258_7 = arg_255_1.actors_["1038"].transform
			local var_258_8 = 0

			if var_258_8 < arg_255_1.time_ and arg_255_1.time_ <= var_258_8 + arg_258_0 then
				arg_255_1.var_.moveOldPos1038 = var_258_7.localPosition
				var_258_7.localScale = Vector3.New(-1, 1, 1)

				arg_255_1:CheckSpriteTmpPos("1038", 7)

				local var_258_9 = var_258_7.childCount

				for iter_258_1 = 0, var_258_9 - 1 do
					local var_258_10 = var_258_7:GetChild(iter_258_1)

					if var_258_10.name == "split_1" or not string.find(var_258_10.name, "split") then
						var_258_10.gameObject:SetActive(true)
					else
						var_258_10.gameObject:SetActive(false)
					end
				end
			end

			local var_258_11 = 0.001

			if var_258_8 <= arg_255_1.time_ and arg_255_1.time_ < var_258_8 + var_258_11 then
				local var_258_12 = (arg_255_1.time_ - var_258_8) / var_258_11
				local var_258_13 = Vector3.New(0, -2000, 0)

				var_258_7.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1038, var_258_13, var_258_12)
			end

			if arg_255_1.time_ >= var_258_8 + var_258_11 and arg_255_1.time_ < var_258_8 + var_258_11 + arg_258_0 then
				var_258_7.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_258_14 = arg_255_1.actors_["1033"].transform
			local var_258_15 = 0

			if var_258_15 < arg_255_1.time_ and arg_255_1.time_ <= var_258_15 + arg_258_0 then
				arg_255_1.var_.moveOldPos1033 = var_258_14.localPosition
				var_258_14.localScale = Vector3.New(1, 1, 1)

				arg_255_1:CheckSpriteTmpPos("1033", 3)

				local var_258_16 = var_258_14.childCount

				for iter_258_2 = 0, var_258_16 - 1 do
					local var_258_17 = var_258_14:GetChild(iter_258_2)

					if var_258_17.name == "split_4" or not string.find(var_258_17.name, "split") then
						var_258_17.gameObject:SetActive(true)
					else
						var_258_17.gameObject:SetActive(false)
					end
				end
			end

			local var_258_18 = 0.001

			if var_258_15 <= arg_255_1.time_ and arg_255_1.time_ < var_258_15 + var_258_18 then
				local var_258_19 = (arg_255_1.time_ - var_258_15) / var_258_18
				local var_258_20 = Vector3.New(0, -420, 0)

				var_258_14.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1033, var_258_20, var_258_19)
			end

			if arg_255_1.time_ >= var_258_15 + var_258_18 and arg_255_1.time_ < var_258_15 + var_258_18 + arg_258_0 then
				var_258_14.localPosition = Vector3.New(0, -420, 0)
			end

			local var_258_21 = arg_255_1.actors_["1033"]
			local var_258_22 = 0

			if var_258_22 < arg_255_1.time_ and arg_255_1.time_ <= var_258_22 + arg_258_0 and arg_255_1.var_.actorSpriteComps1033 == nil then
				arg_255_1.var_.actorSpriteComps1033 = var_258_21:GetComponentsInChildren(typeof(Image), true)
			end

			local var_258_23 = 0.2

			if var_258_22 <= arg_255_1.time_ and arg_255_1.time_ < var_258_22 + var_258_23 then
				local var_258_24 = (arg_255_1.time_ - var_258_22) / var_258_23

				if arg_255_1.var_.actorSpriteComps1033 then
					for iter_258_3, iter_258_4 in pairs(arg_255_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_258_4 then
							local var_258_25 = Mathf.Lerp(iter_258_4.color.r, 1, var_258_24)

							iter_258_4.color = Color.New(var_258_25, var_258_25, var_258_25)
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_22 + var_258_23 and arg_255_1.time_ < var_258_22 + var_258_23 + arg_258_0 and arg_255_1.var_.actorSpriteComps1033 then
				local var_258_26 = 1

				for iter_258_5, iter_258_6 in pairs(arg_255_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_258_6 then
						iter_258_6.color = Color.New(var_258_26, var_258_26, var_258_26)
					end
				end

				arg_255_1.var_.actorSpriteComps1033 = nil
			end

			local var_258_27 = 0
			local var_258_28 = 0.325

			if var_258_27 < arg_255_1.time_ and arg_255_1.time_ <= var_258_27 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_29 = arg_255_1:FormatText(StoryNameCfg[236].name)

				arg_255_1.leftNameTxt_.text = var_258_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_30 = arg_255_1:GetWordFromCfg(900701058)
				local var_258_31 = arg_255_1:FormatText(var_258_30.content)

				arg_255_1.text_.text = var_258_31

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_32 = 13
				local var_258_33 = utf8.len(var_258_31)
				local var_258_34 = var_258_32 <= 0 and var_258_28 or var_258_28 * (var_258_33 / var_258_32)

				if var_258_34 > 0 and var_258_28 < var_258_34 then
					arg_255_1.talkMaxDuration = var_258_34

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

			local var_258_35 = math.max(var_258_28, arg_255_1.talkMaxDuration)

			if var_258_27 <= arg_255_1.time_ and arg_255_1.time_ < var_258_27 + var_258_35 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_27) / var_258_35

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_27 + var_258_35 and arg_255_1.time_ < var_258_27 + var_258_35 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play900701059 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 900701059
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play900701060(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1019"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos1019 = var_262_0.localPosition
				var_262_0.localScale = Vector3.New(1, 1, 1)

				arg_259_1:CheckSpriteTmpPos("1019", 2)

				local var_262_2 = var_262_0.childCount

				for iter_262_0 = 0, var_262_2 - 1 do
					local var_262_3 = var_262_0:GetChild(iter_262_0)

					if var_262_3.name == "split_1" or not string.find(var_262_3.name, "split") then
						var_262_3.gameObject:SetActive(true)
					else
						var_262_3.gameObject:SetActive(false)
					end
				end
			end

			local var_262_4 = 0.001

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_4 then
				local var_262_5 = (arg_259_1.time_ - var_262_1) / var_262_4
				local var_262_6 = Vector3.New(-600, -340, 200)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1019, var_262_6, var_262_5)
			end

			if arg_259_1.time_ >= var_262_1 + var_262_4 and arg_259_1.time_ < var_262_1 + var_262_4 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(-600, -340, 200)
			end

			local var_262_7 = arg_259_1.actors_["1038"].transform
			local var_262_8 = 0

			if var_262_8 < arg_259_1.time_ and arg_259_1.time_ <= var_262_8 + arg_262_0 then
				arg_259_1.var_.moveOldPos1038 = var_262_7.localPosition
				var_262_7.localScale = Vector3.New(-1, 1, 1)

				arg_259_1:CheckSpriteTmpPos("1038", 4)

				local var_262_9 = var_262_7.childCount

				for iter_262_1 = 0, var_262_9 - 1 do
					local var_262_10 = var_262_7:GetChild(iter_262_1)

					if var_262_10.name == "split_2" or not string.find(var_262_10.name, "split") then
						var_262_10.gameObject:SetActive(true)
					else
						var_262_10.gameObject:SetActive(false)
					end
				end
			end

			local var_262_11 = 0.001

			if var_262_8 <= arg_259_1.time_ and arg_259_1.time_ < var_262_8 + var_262_11 then
				local var_262_12 = (arg_259_1.time_ - var_262_8) / var_262_11
				local var_262_13 = Vector3.New(390, -400, 0)

				var_262_7.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1038, var_262_13, var_262_12)
			end

			if arg_259_1.time_ >= var_262_8 + var_262_11 and arg_259_1.time_ < var_262_8 + var_262_11 + arg_262_0 then
				var_262_7.localPosition = Vector3.New(390, -400, 0)
			end

			local var_262_14 = arg_259_1.actors_["1019"]
			local var_262_15 = 0

			if var_262_15 < arg_259_1.time_ and arg_259_1.time_ <= var_262_15 + arg_262_0 and arg_259_1.var_.actorSpriteComps1019 == nil then
				arg_259_1.var_.actorSpriteComps1019 = var_262_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_16 = 0.2

			if var_262_15 <= arg_259_1.time_ and arg_259_1.time_ < var_262_15 + var_262_16 then
				local var_262_17 = (arg_259_1.time_ - var_262_15) / var_262_16

				if arg_259_1.var_.actorSpriteComps1019 then
					for iter_262_2, iter_262_3 in pairs(arg_259_1.var_.actorSpriteComps1019:ToTable()) do
						if iter_262_3 then
							local var_262_18 = Mathf.Lerp(iter_262_3.color.r, 0.5, var_262_17)

							iter_262_3.color = Color.New(var_262_18, var_262_18, var_262_18)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_15 + var_262_16 and arg_259_1.time_ < var_262_15 + var_262_16 + arg_262_0 and arg_259_1.var_.actorSpriteComps1019 then
				local var_262_19 = 0.5

				for iter_262_4, iter_262_5 in pairs(arg_259_1.var_.actorSpriteComps1019:ToTable()) do
					if iter_262_5 then
						iter_262_5.color = Color.New(var_262_19, var_262_19, var_262_19)
					end
				end

				arg_259_1.var_.actorSpriteComps1019 = nil
			end

			local var_262_20 = arg_259_1.actors_["1038"]
			local var_262_21 = 0

			if var_262_21 < arg_259_1.time_ and arg_259_1.time_ <= var_262_21 + arg_262_0 and arg_259_1.var_.actorSpriteComps1038 == nil then
				arg_259_1.var_.actorSpriteComps1038 = var_262_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_22 = 0.2

			if var_262_21 <= arg_259_1.time_ and arg_259_1.time_ < var_262_21 + var_262_22 then
				local var_262_23 = (arg_259_1.time_ - var_262_21) / var_262_22

				if arg_259_1.var_.actorSpriteComps1038 then
					for iter_262_6, iter_262_7 in pairs(arg_259_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_262_7 then
							local var_262_24 = Mathf.Lerp(iter_262_7.color.r, 1, var_262_23)

							iter_262_7.color = Color.New(var_262_24, var_262_24, var_262_24)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_21 + var_262_22 and arg_259_1.time_ < var_262_21 + var_262_22 + arg_262_0 and arg_259_1.var_.actorSpriteComps1038 then
				local var_262_25 = 1

				for iter_262_8, iter_262_9 in pairs(arg_259_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_262_9 then
						iter_262_9.color = Color.New(var_262_25, var_262_25, var_262_25)
					end
				end

				arg_259_1.var_.actorSpriteComps1038 = nil
			end

			local var_262_26 = arg_259_1.actors_["1033"].transform
			local var_262_27 = 0

			if var_262_27 < arg_259_1.time_ and arg_259_1.time_ <= var_262_27 + arg_262_0 then
				arg_259_1.var_.moveOldPos1033 = var_262_26.localPosition
				var_262_26.localScale = Vector3.New(1, 1, 1)

				arg_259_1:CheckSpriteTmpPos("1033", 7)

				local var_262_28 = var_262_26.childCount

				for iter_262_10 = 0, var_262_28 - 1 do
					local var_262_29 = var_262_26:GetChild(iter_262_10)

					if var_262_29.name == "split_4" or not string.find(var_262_29.name, "split") then
						var_262_29.gameObject:SetActive(true)
					else
						var_262_29.gameObject:SetActive(false)
					end
				end
			end

			local var_262_30 = 0.001

			if var_262_27 <= arg_259_1.time_ and arg_259_1.time_ < var_262_27 + var_262_30 then
				local var_262_31 = (arg_259_1.time_ - var_262_27) / var_262_30
				local var_262_32 = Vector3.New(0, -2000, 0)

				var_262_26.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1033, var_262_32, var_262_31)
			end

			if arg_259_1.time_ >= var_262_27 + var_262_30 and arg_259_1.time_ < var_262_27 + var_262_30 + arg_262_0 then
				var_262_26.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_262_33 = 0
			local var_262_34 = 0.475

			if var_262_33 < arg_259_1.time_ and arg_259_1.time_ <= var_262_33 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_35 = arg_259_1:FormatText(StoryNameCfg[94].name)

				arg_259_1.leftNameTxt_.text = var_262_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_36 = arg_259_1:GetWordFromCfg(900701059)
				local var_262_37 = arg_259_1:FormatText(var_262_36.content)

				arg_259_1.text_.text = var_262_37

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_38 = 19
				local var_262_39 = utf8.len(var_262_37)
				local var_262_40 = var_262_38 <= 0 and var_262_34 or var_262_34 * (var_262_39 / var_262_38)

				if var_262_40 > 0 and var_262_34 < var_262_40 then
					arg_259_1.talkMaxDuration = var_262_40

					if var_262_40 + var_262_33 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_40 + var_262_33
					end
				end

				arg_259_1.text_.text = var_262_37
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_41 = math.max(var_262_34, arg_259_1.talkMaxDuration)

			if var_262_33 <= arg_259_1.time_ and arg_259_1.time_ < var_262_33 + var_262_41 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_33) / var_262_41

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_33 + var_262_41 and arg_259_1.time_ < var_262_33 + var_262_41 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play900701060 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 900701060
		arg_263_1.duration_ = 5

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play900701061(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1019"]
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 and arg_263_1.var_.actorSpriteComps1019 == nil then
				arg_263_1.var_.actorSpriteComps1019 = var_266_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_2 = 0.2

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2

				if arg_263_1.var_.actorSpriteComps1019 then
					for iter_266_0, iter_266_1 in pairs(arg_263_1.var_.actorSpriteComps1019:ToTable()) do
						if iter_266_1 then
							local var_266_4 = Mathf.Lerp(iter_266_1.color.r, 1, var_266_3)

							iter_266_1.color = Color.New(var_266_4, var_266_4, var_266_4)
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 and arg_263_1.var_.actorSpriteComps1019 then
				local var_266_5 = 1

				for iter_266_2, iter_266_3 in pairs(arg_263_1.var_.actorSpriteComps1019:ToTable()) do
					if iter_266_3 then
						iter_266_3.color = Color.New(var_266_5, var_266_5, var_266_5)
					end
				end

				arg_263_1.var_.actorSpriteComps1019 = nil
			end

			local var_266_6 = arg_263_1.actors_["1038"]
			local var_266_7 = 0

			if var_266_7 < arg_263_1.time_ and arg_263_1.time_ <= var_266_7 + arg_266_0 and arg_263_1.var_.actorSpriteComps1038 == nil then
				arg_263_1.var_.actorSpriteComps1038 = var_266_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_8 = 0.2

			if var_266_7 <= arg_263_1.time_ and arg_263_1.time_ < var_266_7 + var_266_8 then
				local var_266_9 = (arg_263_1.time_ - var_266_7) / var_266_8

				if arg_263_1.var_.actorSpriteComps1038 then
					for iter_266_4, iter_266_5 in pairs(arg_263_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_266_5 then
							local var_266_10 = Mathf.Lerp(iter_266_5.color.r, 0.5, var_266_9)

							iter_266_5.color = Color.New(var_266_10, var_266_10, var_266_10)
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_7 + var_266_8 and arg_263_1.time_ < var_266_7 + var_266_8 + arg_266_0 and arg_263_1.var_.actorSpriteComps1038 then
				local var_266_11 = 0.5

				for iter_266_6, iter_266_7 in pairs(arg_263_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_266_7 then
						iter_266_7.color = Color.New(var_266_11, var_266_11, var_266_11)
					end
				end

				arg_263_1.var_.actorSpriteComps1038 = nil
			end

			local var_266_12 = 0
			local var_266_13 = 0.275

			if var_266_12 < arg_263_1.time_ and arg_263_1.time_ <= var_266_12 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_14 = arg_263_1:FormatText(StoryNameCfg[13].name)

				arg_263_1.leftNameTxt_.text = var_266_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_15 = arg_263_1:GetWordFromCfg(900701060)
				local var_266_16 = arg_263_1:FormatText(var_266_15.content)

				arg_263_1.text_.text = var_266_16

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_17 = 11
				local var_266_18 = utf8.len(var_266_16)
				local var_266_19 = var_266_17 <= 0 and var_266_13 or var_266_13 * (var_266_18 / var_266_17)

				if var_266_19 > 0 and var_266_13 < var_266_19 then
					arg_263_1.talkMaxDuration = var_266_19

					if var_266_19 + var_266_12 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_19 + var_266_12
					end
				end

				arg_263_1.text_.text = var_266_16
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)
				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_20 = math.max(var_266_13, arg_263_1.talkMaxDuration)

			if var_266_12 <= arg_263_1.time_ and arg_263_1.time_ < var_266_12 + var_266_20 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_12) / var_266_20

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_12 + var_266_20 and arg_263_1.time_ < var_266_12 + var_266_20 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play900701061 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 900701061
		arg_267_1.duration_ = 5

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play900701062(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1033"].transform
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 then
				arg_267_1.var_.moveOldPos1033 = var_270_0.localPosition
				var_270_0.localScale = Vector3.New(1, 1, 1)

				arg_267_1:CheckSpriteTmpPos("1033", 3)

				local var_270_2 = var_270_0.childCount

				for iter_270_0 = 0, var_270_2 - 1 do
					local var_270_3 = var_270_0:GetChild(iter_270_0)

					if var_270_3.name == "split_2" or not string.find(var_270_3.name, "split") then
						var_270_3.gameObject:SetActive(true)
					else
						var_270_3.gameObject:SetActive(false)
					end
				end
			end

			local var_270_4 = 0.001

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_4 then
				local var_270_5 = (arg_267_1.time_ - var_270_1) / var_270_4
				local var_270_6 = Vector3.New(0, -420, 0)

				var_270_0.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1033, var_270_6, var_270_5)
			end

			if arg_267_1.time_ >= var_270_1 + var_270_4 and arg_267_1.time_ < var_270_1 + var_270_4 + arg_270_0 then
				var_270_0.localPosition = Vector3.New(0, -420, 0)
			end

			local var_270_7 = arg_267_1.actors_["1033"]
			local var_270_8 = 0

			if var_270_8 < arg_267_1.time_ and arg_267_1.time_ <= var_270_8 + arg_270_0 and arg_267_1.var_.actorSpriteComps1033 == nil then
				arg_267_1.var_.actorSpriteComps1033 = var_270_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_9 = 0.2

			if var_270_8 <= arg_267_1.time_ and arg_267_1.time_ < var_270_8 + var_270_9 then
				local var_270_10 = (arg_267_1.time_ - var_270_8) / var_270_9

				if arg_267_1.var_.actorSpriteComps1033 then
					for iter_270_1, iter_270_2 in pairs(arg_267_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_270_2 then
							local var_270_11 = Mathf.Lerp(iter_270_2.color.r, 1, var_270_10)

							iter_270_2.color = Color.New(var_270_11, var_270_11, var_270_11)
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_8 + var_270_9 and arg_267_1.time_ < var_270_8 + var_270_9 + arg_270_0 and arg_267_1.var_.actorSpriteComps1033 then
				local var_270_12 = 1

				for iter_270_3, iter_270_4 in pairs(arg_267_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_270_4 then
						iter_270_4.color = Color.New(var_270_12, var_270_12, var_270_12)
					end
				end

				arg_267_1.var_.actorSpriteComps1033 = nil
			end

			local var_270_13 = arg_267_1.actors_["1019"].transform
			local var_270_14 = 0

			if var_270_14 < arg_267_1.time_ and arg_267_1.time_ <= var_270_14 + arg_270_0 then
				arg_267_1.var_.moveOldPos1019 = var_270_13.localPosition
				var_270_13.localScale = Vector3.New(1, 1, 1)

				arg_267_1:CheckSpriteTmpPos("1019", 7)

				local var_270_15 = var_270_13.childCount

				for iter_270_5 = 0, var_270_15 - 1 do
					local var_270_16 = var_270_13:GetChild(iter_270_5)

					if var_270_16.name == "split_1" or not string.find(var_270_16.name, "split") then
						var_270_16.gameObject:SetActive(true)
					else
						var_270_16.gameObject:SetActive(false)
					end
				end
			end

			local var_270_17 = 0.001

			if var_270_14 <= arg_267_1.time_ and arg_267_1.time_ < var_270_14 + var_270_17 then
				local var_270_18 = (arg_267_1.time_ - var_270_14) / var_270_17
				local var_270_19 = Vector3.New(0, -2000, 200)

				var_270_13.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1019, var_270_19, var_270_18)
			end

			if arg_267_1.time_ >= var_270_14 + var_270_17 and arg_267_1.time_ < var_270_14 + var_270_17 + arg_270_0 then
				var_270_13.localPosition = Vector3.New(0, -2000, 200)
			end

			local var_270_20 = arg_267_1.actors_["1038"].transform
			local var_270_21 = 0

			if var_270_21 < arg_267_1.time_ and arg_267_1.time_ <= var_270_21 + arg_270_0 then
				arg_267_1.var_.moveOldPos1038 = var_270_20.localPosition
				var_270_20.localScale = Vector3.New(-1, 1, 1)

				arg_267_1:CheckSpriteTmpPos("1038", 7)

				local var_270_22 = var_270_20.childCount

				for iter_270_6 = 0, var_270_22 - 1 do
					local var_270_23 = var_270_20:GetChild(iter_270_6)

					if var_270_23.name == "split_2" or not string.find(var_270_23.name, "split") then
						var_270_23.gameObject:SetActive(true)
					else
						var_270_23.gameObject:SetActive(false)
					end
				end
			end

			local var_270_24 = 0.001

			if var_270_21 <= arg_267_1.time_ and arg_267_1.time_ < var_270_21 + var_270_24 then
				local var_270_25 = (arg_267_1.time_ - var_270_21) / var_270_24
				local var_270_26 = Vector3.New(0, -2000, 0)

				var_270_20.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1038, var_270_26, var_270_25)
			end

			if arg_267_1.time_ >= var_270_21 + var_270_24 and arg_267_1.time_ < var_270_21 + var_270_24 + arg_270_0 then
				var_270_20.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_270_27 = 0
			local var_270_28 = 0.3

			if var_270_27 < arg_267_1.time_ and arg_267_1.time_ <= var_270_27 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_29 = arg_267_1:FormatText(StoryNameCfg[236].name)

				arg_267_1.leftNameTxt_.text = var_270_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_30 = arg_267_1:GetWordFromCfg(900701061)
				local var_270_31 = arg_267_1:FormatText(var_270_30.content)

				arg_267_1.text_.text = var_270_31

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_32 = 12
				local var_270_33 = utf8.len(var_270_31)
				local var_270_34 = var_270_32 <= 0 and var_270_28 or var_270_28 * (var_270_33 / var_270_32)

				if var_270_34 > 0 and var_270_28 < var_270_34 then
					arg_267_1.talkMaxDuration = var_270_34

					if var_270_34 + var_270_27 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_34 + var_270_27
					end
				end

				arg_267_1.text_.text = var_270_31
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_35 = math.max(var_270_28, arg_267_1.talkMaxDuration)

			if var_270_27 <= arg_267_1.time_ and arg_267_1.time_ < var_270_27 + var_270_35 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_27) / var_270_35

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_27 + var_270_35 and arg_267_1.time_ < var_270_27 + var_270_35 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play900701062 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 900701062
		arg_271_1.duration_ = 5

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play900701063(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1033"].transform
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1.var_.moveOldPos1033 = var_274_0.localPosition
				var_274_0.localScale = Vector3.New(1, 1, 1)

				arg_271_1:CheckSpriteTmpPos("1033", 7)

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
				local var_274_6 = Vector3.New(0, -2000, 0)

				var_274_0.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos1033, var_274_6, var_274_5)
			end

			if arg_271_1.time_ >= var_274_1 + var_274_4 and arg_271_1.time_ < var_274_1 + var_274_4 + arg_274_0 then
				var_274_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_274_7 = arg_271_1.actors_["1038"]
			local var_274_8 = 0

			if var_274_8 < arg_271_1.time_ and arg_271_1.time_ <= var_274_8 + arg_274_0 and arg_271_1.var_.actorSpriteComps1038 == nil then
				arg_271_1.var_.actorSpriteComps1038 = var_274_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_274_9 = 0.2

			if var_274_8 <= arg_271_1.time_ and arg_271_1.time_ < var_274_8 + var_274_9 then
				local var_274_10 = (arg_271_1.time_ - var_274_8) / var_274_9

				if arg_271_1.var_.actorSpriteComps1038 then
					for iter_274_1, iter_274_2 in pairs(arg_271_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_274_2 then
							local var_274_11 = Mathf.Lerp(iter_274_2.color.r, 1, var_274_10)

							iter_274_2.color = Color.New(var_274_11, var_274_11, var_274_11)
						end
					end
				end
			end

			if arg_271_1.time_ >= var_274_8 + var_274_9 and arg_271_1.time_ < var_274_8 + var_274_9 + arg_274_0 and arg_271_1.var_.actorSpriteComps1038 then
				local var_274_12 = 1

				for iter_274_3, iter_274_4 in pairs(arg_271_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_274_4 then
						iter_274_4.color = Color.New(var_274_12, var_274_12, var_274_12)
					end
				end

				arg_271_1.var_.actorSpriteComps1038 = nil
			end

			local var_274_13 = arg_271_1.actors_["1019"].transform
			local var_274_14 = 0

			if var_274_14 < arg_271_1.time_ and arg_271_1.time_ <= var_274_14 + arg_274_0 then
				arg_271_1.var_.moveOldPos1019 = var_274_13.localPosition
				var_274_13.localScale = Vector3.New(1, 1, 1)

				arg_271_1:CheckSpriteTmpPos("1019", 7)

				local var_274_15 = var_274_13.childCount

				for iter_274_5 = 0, var_274_15 - 1 do
					local var_274_16 = var_274_13:GetChild(iter_274_5)

					if var_274_16.name == "split_1" or not string.find(var_274_16.name, "split") then
						var_274_16.gameObject:SetActive(true)
					else
						var_274_16.gameObject:SetActive(false)
					end
				end
			end

			local var_274_17 = 0.001

			if var_274_14 <= arg_271_1.time_ and arg_271_1.time_ < var_274_14 + var_274_17 then
				local var_274_18 = (arg_271_1.time_ - var_274_14) / var_274_17
				local var_274_19 = Vector3.New(0, -2000, 200)

				var_274_13.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos1019, var_274_19, var_274_18)
			end

			if arg_271_1.time_ >= var_274_14 + var_274_17 and arg_271_1.time_ < var_274_14 + var_274_17 + arg_274_0 then
				var_274_13.localPosition = Vector3.New(0, -2000, 200)
			end

			local var_274_20 = arg_271_1.actors_["1038"].transform
			local var_274_21 = 0

			if var_274_21 < arg_271_1.time_ and arg_271_1.time_ <= var_274_21 + arg_274_0 then
				arg_271_1.var_.moveOldPos1038 = var_274_20.localPosition
				var_274_20.localScale = Vector3.New(-1, 1, 1)

				arg_271_1:CheckSpriteTmpPos("1038", 4)

				local var_274_22 = var_274_20.childCount

				for iter_274_6 = 0, var_274_22 - 1 do
					local var_274_23 = var_274_20:GetChild(iter_274_6)

					if var_274_23.name == "split_9" or not string.find(var_274_23.name, "split") then
						var_274_23.gameObject:SetActive(true)
					else
						var_274_23.gameObject:SetActive(false)
					end
				end
			end

			local var_274_24 = 0.001

			if var_274_21 <= arg_271_1.time_ and arg_271_1.time_ < var_274_21 + var_274_24 then
				local var_274_25 = (arg_271_1.time_ - var_274_21) / var_274_24
				local var_274_26 = Vector3.New(390, -400, 0)

				var_274_20.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos1038, var_274_26, var_274_25)
			end

			if arg_271_1.time_ >= var_274_21 + var_274_24 and arg_271_1.time_ < var_274_21 + var_274_24 + arg_274_0 then
				var_274_20.localPosition = Vector3.New(390, -400, 0)
			end

			local var_274_27 = 0
			local var_274_28 = 0.65

			if var_274_27 < arg_271_1.time_ and arg_271_1.time_ <= var_274_27 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_29 = arg_271_1:FormatText(StoryNameCfg[94].name)

				arg_271_1.leftNameTxt_.text = var_274_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_30 = arg_271_1:GetWordFromCfg(900701062)
				local var_274_31 = arg_271_1:FormatText(var_274_30.content)

				arg_271_1.text_.text = var_274_31

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_32 = 26
				local var_274_33 = utf8.len(var_274_31)
				local var_274_34 = var_274_32 <= 0 and var_274_28 or var_274_28 * (var_274_33 / var_274_32)

				if var_274_34 > 0 and var_274_28 < var_274_34 then
					arg_271_1.talkMaxDuration = var_274_34

					if var_274_34 + var_274_27 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_34 + var_274_27
					end
				end

				arg_271_1.text_.text = var_274_31
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)
				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_35 = math.max(var_274_28, arg_271_1.talkMaxDuration)

			if var_274_27 <= arg_271_1.time_ and arg_271_1.time_ < var_274_27 + var_274_35 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_27) / var_274_35

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_27 + var_274_35 and arg_271_1.time_ < var_274_27 + var_274_35 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play900701063 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 900701063
		arg_275_1.duration_ = 5

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play900701064(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1019"].transform
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 then
				arg_275_1.var_.moveOldPos1019 = var_278_0.localPosition
				var_278_0.localScale = Vector3.New(1, 1, 1)

				arg_275_1:CheckSpriteTmpPos("1019", 2)

				local var_278_2 = var_278_0.childCount

				for iter_278_0 = 0, var_278_2 - 1 do
					local var_278_3 = var_278_0:GetChild(iter_278_0)

					if var_278_3.name == "split_1" or not string.find(var_278_3.name, "split") then
						var_278_3.gameObject:SetActive(true)
					else
						var_278_3.gameObject:SetActive(false)
					end
				end
			end

			local var_278_4 = 0.001

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_4 then
				local var_278_5 = (arg_275_1.time_ - var_278_1) / var_278_4
				local var_278_6 = Vector3.New(-600, -340, 200)

				var_278_0.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1019, var_278_6, var_278_5)
			end

			if arg_275_1.time_ >= var_278_1 + var_278_4 and arg_275_1.time_ < var_278_1 + var_278_4 + arg_278_0 then
				var_278_0.localPosition = Vector3.New(-600, -340, 200)
			end

			local var_278_7 = arg_275_1.actors_["1019"]
			local var_278_8 = 0

			if var_278_8 < arg_275_1.time_ and arg_275_1.time_ <= var_278_8 + arg_278_0 and arg_275_1.var_.actorSpriteComps1019 == nil then
				arg_275_1.var_.actorSpriteComps1019 = var_278_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_278_9 = 0.2

			if var_278_8 <= arg_275_1.time_ and arg_275_1.time_ < var_278_8 + var_278_9 then
				local var_278_10 = (arg_275_1.time_ - var_278_8) / var_278_9

				if arg_275_1.var_.actorSpriteComps1019 then
					for iter_278_1, iter_278_2 in pairs(arg_275_1.var_.actorSpriteComps1019:ToTable()) do
						if iter_278_2 then
							local var_278_11 = Mathf.Lerp(iter_278_2.color.r, 1, var_278_10)

							iter_278_2.color = Color.New(var_278_11, var_278_11, var_278_11)
						end
					end
				end
			end

			if arg_275_1.time_ >= var_278_8 + var_278_9 and arg_275_1.time_ < var_278_8 + var_278_9 + arg_278_0 and arg_275_1.var_.actorSpriteComps1019 then
				local var_278_12 = 1

				for iter_278_3, iter_278_4 in pairs(arg_275_1.var_.actorSpriteComps1019:ToTable()) do
					if iter_278_4 then
						iter_278_4.color = Color.New(var_278_12, var_278_12, var_278_12)
					end
				end

				arg_275_1.var_.actorSpriteComps1019 = nil
			end

			local var_278_13 = arg_275_1.actors_["1038"]
			local var_278_14 = 0

			if var_278_14 < arg_275_1.time_ and arg_275_1.time_ <= var_278_14 + arg_278_0 and arg_275_1.var_.actorSpriteComps1038 == nil then
				arg_275_1.var_.actorSpriteComps1038 = var_278_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_278_15 = 0.2

			if var_278_14 <= arg_275_1.time_ and arg_275_1.time_ < var_278_14 + var_278_15 then
				local var_278_16 = (arg_275_1.time_ - var_278_14) / var_278_15

				if arg_275_1.var_.actorSpriteComps1038 then
					for iter_278_5, iter_278_6 in pairs(arg_275_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_278_6 then
							local var_278_17 = Mathf.Lerp(iter_278_6.color.r, 0.5, var_278_16)

							iter_278_6.color = Color.New(var_278_17, var_278_17, var_278_17)
						end
					end
				end
			end

			if arg_275_1.time_ >= var_278_14 + var_278_15 and arg_275_1.time_ < var_278_14 + var_278_15 + arg_278_0 and arg_275_1.var_.actorSpriteComps1038 then
				local var_278_18 = 0.5

				for iter_278_7, iter_278_8 in pairs(arg_275_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_278_8 then
						iter_278_8.color = Color.New(var_278_18, var_278_18, var_278_18)
					end
				end

				arg_275_1.var_.actorSpriteComps1038 = nil
			end

			local var_278_19 = 0
			local var_278_20 = 0.2

			if var_278_19 < arg_275_1.time_ and arg_275_1.time_ <= var_278_19 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_21 = arg_275_1:FormatText(StoryNameCfg[13].name)

				arg_275_1.leftNameTxt_.text = var_278_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_22 = arg_275_1:GetWordFromCfg(900701063)
				local var_278_23 = arg_275_1:FormatText(var_278_22.content)

				arg_275_1.text_.text = var_278_23

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_24 = 8
				local var_278_25 = utf8.len(var_278_23)
				local var_278_26 = var_278_24 <= 0 and var_278_20 or var_278_20 * (var_278_25 / var_278_24)

				if var_278_26 > 0 and var_278_20 < var_278_26 then
					arg_275_1.talkMaxDuration = var_278_26

					if var_278_26 + var_278_19 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_26 + var_278_19
					end
				end

				arg_275_1.text_.text = var_278_23
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)
				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_27 = math.max(var_278_20, arg_275_1.talkMaxDuration)

			if var_278_19 <= arg_275_1.time_ and arg_275_1.time_ < var_278_19 + var_278_27 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_19) / var_278_27

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_19 + var_278_27 and arg_275_1.time_ < var_278_19 + var_278_27 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play900701064 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 900701064
		arg_279_1.duration_ = 5

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play900701065(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1038"].transform
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 then
				arg_279_1.var_.moveOldPos1038 = var_282_0.localPosition
				var_282_0.localScale = Vector3.New(-1, 1, 1)

				arg_279_1:CheckSpriteTmpPos("1038", 4)

				local var_282_2 = var_282_0.childCount

				for iter_282_0 = 0, var_282_2 - 1 do
					local var_282_3 = var_282_0:GetChild(iter_282_0)

					if var_282_3.name == "split_5" or not string.find(var_282_3.name, "split") then
						var_282_3.gameObject:SetActive(true)
					else
						var_282_3.gameObject:SetActive(false)
					end
				end
			end

			local var_282_4 = 0.001

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_4 then
				local var_282_5 = (arg_279_1.time_ - var_282_1) / var_282_4
				local var_282_6 = Vector3.New(390, -400, 0)

				var_282_0.localPosition = Vector3.Lerp(arg_279_1.var_.moveOldPos1038, var_282_6, var_282_5)
			end

			if arg_279_1.time_ >= var_282_1 + var_282_4 and arg_279_1.time_ < var_282_1 + var_282_4 + arg_282_0 then
				var_282_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_282_7 = arg_279_1.actors_["1038"]
			local var_282_8 = 0

			if var_282_8 < arg_279_1.time_ and arg_279_1.time_ <= var_282_8 + arg_282_0 and arg_279_1.var_.actorSpriteComps1038 == nil then
				arg_279_1.var_.actorSpriteComps1038 = var_282_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_282_9 = 0.2

			if var_282_8 <= arg_279_1.time_ and arg_279_1.time_ < var_282_8 + var_282_9 then
				local var_282_10 = (arg_279_1.time_ - var_282_8) / var_282_9

				if arg_279_1.var_.actorSpriteComps1038 then
					for iter_282_1, iter_282_2 in pairs(arg_279_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_282_2 then
							local var_282_11 = Mathf.Lerp(iter_282_2.color.r, 1, var_282_10)

							iter_282_2.color = Color.New(var_282_11, var_282_11, var_282_11)
						end
					end
				end
			end

			if arg_279_1.time_ >= var_282_8 + var_282_9 and arg_279_1.time_ < var_282_8 + var_282_9 + arg_282_0 and arg_279_1.var_.actorSpriteComps1038 then
				local var_282_12 = 1

				for iter_282_3, iter_282_4 in pairs(arg_279_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_282_4 then
						iter_282_4.color = Color.New(var_282_12, var_282_12, var_282_12)
					end
				end

				arg_279_1.var_.actorSpriteComps1038 = nil
			end

			local var_282_13 = arg_279_1.actors_["1019"]
			local var_282_14 = 0

			if var_282_14 < arg_279_1.time_ and arg_279_1.time_ <= var_282_14 + arg_282_0 and arg_279_1.var_.actorSpriteComps1019 == nil then
				arg_279_1.var_.actorSpriteComps1019 = var_282_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_282_15 = 0.2

			if var_282_14 <= arg_279_1.time_ and arg_279_1.time_ < var_282_14 + var_282_15 then
				local var_282_16 = (arg_279_1.time_ - var_282_14) / var_282_15

				if arg_279_1.var_.actorSpriteComps1019 then
					for iter_282_5, iter_282_6 in pairs(arg_279_1.var_.actorSpriteComps1019:ToTable()) do
						if iter_282_6 then
							local var_282_17 = Mathf.Lerp(iter_282_6.color.r, 0.5, var_282_16)

							iter_282_6.color = Color.New(var_282_17, var_282_17, var_282_17)
						end
					end
				end
			end

			if arg_279_1.time_ >= var_282_14 + var_282_15 and arg_279_1.time_ < var_282_14 + var_282_15 + arg_282_0 and arg_279_1.var_.actorSpriteComps1019 then
				local var_282_18 = 0.5

				for iter_282_7, iter_282_8 in pairs(arg_279_1.var_.actorSpriteComps1019:ToTable()) do
					if iter_282_8 then
						iter_282_8.color = Color.New(var_282_18, var_282_18, var_282_18)
					end
				end

				arg_279_1.var_.actorSpriteComps1019 = nil
			end

			local var_282_19 = 0
			local var_282_20 = 0.125

			if var_282_19 < arg_279_1.time_ and arg_279_1.time_ <= var_282_19 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_21 = arg_279_1:FormatText(StoryNameCfg[94].name)

				arg_279_1.leftNameTxt_.text = var_282_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_22 = arg_279_1:GetWordFromCfg(900701064)
				local var_282_23 = arg_279_1:FormatText(var_282_22.content)

				arg_279_1.text_.text = var_282_23

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_24 = 6
				local var_282_25 = utf8.len(var_282_23)
				local var_282_26 = var_282_24 <= 0 and var_282_20 or var_282_20 * (var_282_25 / var_282_24)

				if var_282_26 > 0 and var_282_20 < var_282_26 then
					arg_279_1.talkMaxDuration = var_282_26

					if var_282_26 + var_282_19 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_26 + var_282_19
					end
				end

				arg_279_1.text_.text = var_282_23
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)
				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_27 = math.max(var_282_20, arg_279_1.talkMaxDuration)

			if var_282_19 <= arg_279_1.time_ and arg_279_1.time_ < var_282_19 + var_282_27 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_19) / var_282_27

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_19 + var_282_27 and arg_279_1.time_ < var_282_19 + var_282_27 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play900701065 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 900701065
		arg_283_1.duration_ = 5

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
			arg_283_1.auto_ = false
		end

		function arg_283_1.playNext_(arg_285_0)
			arg_283_1.onStoryFinished_()
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = 0
			local var_286_1 = 0.75

			if var_286_0 < arg_283_1.time_ and arg_283_1.time_ <= var_286_0 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_2 = arg_283_1:FormatText(StoryNameCfg[13].name)

				arg_283_1.leftNameTxt_.text = var_286_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_3 = arg_283_1:GetWordFromCfg(900701065)
				local var_286_4 = arg_283_1:FormatText(var_286_3.content)

				arg_283_1.text_.text = var_286_4

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_5 = 30
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
				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_8 = math.max(var_286_1, arg_283_1.talkMaxDuration)

			if var_286_0 <= arg_283_1.time_ and arg_283_1.time_ < var_286_0 + var_286_8 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_0) / var_286_8

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_0 + var_286_8 and arg_283_1.time_ < var_286_0 + var_286_8 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST22a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/F01a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/OM0602",
		"Assets/UIResources/UI_AB/TextureConfig/Background/OM0601"
	},
	voices = {}
}
