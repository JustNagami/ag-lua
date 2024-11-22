return {
	Play117101001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 117101001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play117101002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST24a"

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
				local var_4_5 = arg_1_1.bgs_.ST24a

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
					if iter_4_0 ~= "ST24a" then
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
			local var_4_23 = 0.3

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 2
			local var_4_27 = 0.725

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.725

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

				local var_4_33 = arg_1_1:GetWordFromCfg(117101001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 29
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
	Play117101002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 117101002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play117101003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.425

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

				local var_10_2 = arg_7_1:GetWordFromCfg(117101002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 17
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
	Play117101003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 117101003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play117101004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				local var_14_2 = "play"
				local var_14_3 = "effect"

				arg_11_1:AudioAction(var_14_2, var_14_3, "se_story_side_1080", "se_story_1080_knock", "")
			end

			local var_14_4 = 0
			local var_14_5 = 0.25

			if var_14_4 < arg_11_1.time_ and arg_11_1.time_ <= var_14_4 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_6 = arg_11_1:GetWordFromCfg(117101003)
				local var_14_7 = arg_11_1:FormatText(var_14_6.content)

				arg_11_1.text_.text = var_14_7

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_8 = 10
				local var_14_9 = utf8.len(var_14_7)
				local var_14_10 = var_14_8 <= 0 and var_14_5 or var_14_5 * (var_14_9 / var_14_8)

				if var_14_10 > 0 and var_14_5 < var_14_10 then
					arg_11_1.talkMaxDuration = var_14_10

					if var_14_10 + var_14_4 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_10 + var_14_4
					end
				end

				arg_11_1.text_.text = var_14_7
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_11 = math.max(var_14_5, arg_11_1.talkMaxDuration)

			if var_14_4 <= arg_11_1.time_ and arg_11_1.time_ < var_14_4 + var_14_11 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_4) / var_14_11

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_4 + var_14_11 and arg_11_1.time_ < var_14_4 + var_14_11 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play117101004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 117101004
		arg_15_1.duration_ = 2.466

		local var_15_0 = {
			zh = 2.166,
			ja = 2.466
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
				arg_15_0:Play117101005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "10035"

			if arg_15_1.actors_[var_18_0] == nil then
				local var_18_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_18_0), arg_15_1.canvasGo_.transform)

				var_18_1.transform:SetSiblingIndex(1)

				var_18_1.name = var_18_0
				var_18_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_15_1.actors_[var_18_0] = var_18_1
			end

			local var_18_2 = arg_15_1.actors_["10035"].transform
			local var_18_3 = 0

			if var_18_3 < arg_15_1.time_ and arg_15_1.time_ <= var_18_3 + arg_18_0 then
				arg_15_1.var_.moveOldPos10035 = var_18_2.localPosition
				var_18_2.localScale = Vector3.New(1, 1, 1)

				arg_15_1:CheckSpriteTmpPos("10035", 3)

				local var_18_4 = var_18_2.childCount

				for iter_18_0 = 0, var_18_4 - 1 do
					local var_18_5 = var_18_2:GetChild(iter_18_0)

					if var_18_5.name == "split_1" or not string.find(var_18_5.name, "split") then
						var_18_5.gameObject:SetActive(true)
					else
						var_18_5.gameObject:SetActive(false)
					end
				end
			end

			local var_18_6 = 0.001

			if var_18_3 <= arg_15_1.time_ and arg_15_1.time_ < var_18_3 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_3) / var_18_6
				local var_18_8 = Vector3.New(0, -410, -235)

				var_18_2.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10035, var_18_8, var_18_7)
			end

			if arg_15_1.time_ >= var_18_3 + var_18_6 and arg_15_1.time_ < var_18_3 + var_18_6 + arg_18_0 then
				var_18_2.localPosition = Vector3.New(0, -410, -235)
			end

			local var_18_9 = arg_15_1.actors_["10035"]
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 and arg_15_1.var_.actorSpriteComps10035 == nil then
				arg_15_1.var_.actorSpriteComps10035 = var_18_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_11 = 0.2

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11

				if arg_15_1.var_.actorSpriteComps10035 then
					for iter_18_1, iter_18_2 in pairs(arg_15_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_18_2 then
							local var_18_13 = Mathf.Lerp(iter_18_2.color.r, 1, var_18_12)

							iter_18_2.color = Color.New(var_18_13, var_18_13, var_18_13)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 and arg_15_1.var_.actorSpriteComps10035 then
				local var_18_14 = 1

				for iter_18_3, iter_18_4 in pairs(arg_15_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_18_4 then
						iter_18_4.color = Color.New(var_18_14, var_18_14, var_18_14)
					end
				end

				arg_15_1.var_.actorSpriteComps10035 = nil
			end

			local var_18_15 = arg_15_1.actors_["10035"]
			local var_18_16 = 0

			if var_18_16 < arg_15_1.time_ and arg_15_1.time_ <= var_18_16 + arg_18_0 then
				local var_18_17 = var_18_15:GetComponentInChildren(typeof(CanvasGroup))

				if var_18_17 then
					arg_15_1.var_.alphaOldValue10035 = var_18_17.alpha
					arg_15_1.var_.characterEffect10035 = var_18_17
				end

				arg_15_1.var_.alphaOldValue10035 = 0
			end

			local var_18_18 = 0.5

			if var_18_16 <= arg_15_1.time_ and arg_15_1.time_ < var_18_16 + var_18_18 then
				local var_18_19 = (arg_15_1.time_ - var_18_16) / var_18_18
				local var_18_20 = Mathf.Lerp(arg_15_1.var_.alphaOldValue10035, 1, var_18_19)

				if arg_15_1.var_.characterEffect10035 then
					arg_15_1.var_.characterEffect10035.alpha = var_18_20
				end
			end

			if arg_15_1.time_ >= var_18_16 + var_18_18 and arg_15_1.time_ < var_18_16 + var_18_18 + arg_18_0 and arg_15_1.var_.characterEffect10035 then
				arg_15_1.var_.characterEffect10035.alpha = 1
			end

			local var_18_21 = 0
			local var_18_22 = 0.125

			if var_18_21 < arg_15_1.time_ and arg_15_1.time_ <= var_18_21 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_23 = arg_15_1:FormatText(StoryNameCfg[369].name)

				arg_15_1.leftNameTxt_.text = var_18_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_24 = arg_15_1:GetWordFromCfg(117101004)
				local var_18_25 = arg_15_1:FormatText(var_18_24.content)

				arg_15_1.text_.text = var_18_25

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_26 = 5
				local var_18_27 = utf8.len(var_18_25)
				local var_18_28 = var_18_26 <= 0 and var_18_22 or var_18_22 * (var_18_27 / var_18_26)

				if var_18_28 > 0 and var_18_22 < var_18_28 then
					arg_15_1.talkMaxDuration = var_18_28

					if var_18_28 + var_18_21 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_28 + var_18_21
					end
				end

				arg_15_1.text_.text = var_18_25
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101004", "story_v_out_117101.awb") ~= 0 then
					local var_18_29 = manager.audio:GetVoiceLength("story_v_out_117101", "117101004", "story_v_out_117101.awb") / 1000

					if var_18_29 + var_18_21 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_29 + var_18_21
					end

					if var_18_24.prefab_name ~= "" and arg_15_1.actors_[var_18_24.prefab_name] ~= nil then
						local var_18_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_24.prefab_name].transform, "story_v_out_117101", "117101004", "story_v_out_117101.awb")

						arg_15_1:RecordAudio("117101004", var_18_30)
						arg_15_1:RecordAudio("117101004", var_18_30)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_117101", "117101004", "story_v_out_117101.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_117101", "117101004", "story_v_out_117101.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_31 = math.max(var_18_22, arg_15_1.talkMaxDuration)

			if var_18_21 <= arg_15_1.time_ and arg_15_1.time_ < var_18_21 + var_18_31 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_21) / var_18_31

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_21 + var_18_31 and arg_15_1.time_ < var_18_21 + var_18_31 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play117101005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 117101005
		arg_19_1.duration_ = 3.166

		local var_19_0 = {
			zh = 3.166,
			ja = 1.566
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
				arg_19_0:Play117101006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10035"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos10035 = var_22_0.localPosition
				var_22_0.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("10035", 3)

				local var_22_2 = var_22_0.childCount

				for iter_22_0 = 0, var_22_2 - 1 do
					local var_22_3 = var_22_0:GetChild(iter_22_0)

					if var_22_3.name == "split_4" or not string.find(var_22_3.name, "split") then
						var_22_3.gameObject:SetActive(true)
					else
						var_22_3.gameObject:SetActive(false)
					end
				end
			end

			local var_22_4 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_4 then
				local var_22_5 = (arg_19_1.time_ - var_22_1) / var_22_4
				local var_22_6 = Vector3.New(0, -410, -235)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos10035, var_22_6, var_22_5)
			end

			if arg_19_1.time_ >= var_22_1 + var_22_4 and arg_19_1.time_ < var_22_1 + var_22_4 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0, -410, -235)
			end

			local var_22_7 = 0
			local var_22_8 = 0.1

			if var_22_7 < arg_19_1.time_ and arg_19_1.time_ <= var_22_7 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_9 = arg_19_1:FormatText(StoryNameCfg[369].name)

				arg_19_1.leftNameTxt_.text = var_22_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_10 = arg_19_1:GetWordFromCfg(117101005)
				local var_22_11 = arg_19_1:FormatText(var_22_10.content)

				arg_19_1.text_.text = var_22_11

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_12 = 4
				local var_22_13 = utf8.len(var_22_11)
				local var_22_14 = var_22_12 <= 0 and var_22_8 or var_22_8 * (var_22_13 / var_22_12)

				if var_22_14 > 0 and var_22_8 < var_22_14 then
					arg_19_1.talkMaxDuration = var_22_14

					if var_22_14 + var_22_7 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_14 + var_22_7
					end
				end

				arg_19_1.text_.text = var_22_11
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101005", "story_v_out_117101.awb") ~= 0 then
					local var_22_15 = manager.audio:GetVoiceLength("story_v_out_117101", "117101005", "story_v_out_117101.awb") / 1000

					if var_22_15 + var_22_7 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_15 + var_22_7
					end

					if var_22_10.prefab_name ~= "" and arg_19_1.actors_[var_22_10.prefab_name] ~= nil then
						local var_22_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_10.prefab_name].transform, "story_v_out_117101", "117101005", "story_v_out_117101.awb")

						arg_19_1:RecordAudio("117101005", var_22_16)
						arg_19_1:RecordAudio("117101005", var_22_16)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_117101", "117101005", "story_v_out_117101.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_117101", "117101005", "story_v_out_117101.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_17 = math.max(var_22_8, arg_19_1.talkMaxDuration)

			if var_22_7 <= arg_19_1.time_ and arg_19_1.time_ < var_22_7 + var_22_17 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_7) / var_22_17

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_7 + var_22_17 and arg_19_1.time_ < var_22_7 + var_22_17 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play117101006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 117101006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play117101007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["10035"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				local var_26_2 = var_26_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_26_2 then
					arg_23_1.var_.alphaOldValue10035 = var_26_2.alpha
					arg_23_1.var_.characterEffect10035 = var_26_2
				end

				arg_23_1.var_.alphaOldValue10035 = 1
			end

			local var_26_3 = 0.5

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_3 then
				local var_26_4 = (arg_23_1.time_ - var_26_1) / var_26_3
				local var_26_5 = Mathf.Lerp(arg_23_1.var_.alphaOldValue10035, 0, var_26_4)

				if arg_23_1.var_.characterEffect10035 then
					arg_23_1.var_.characterEffect10035.alpha = var_26_5
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_3 and arg_23_1.time_ < var_26_1 + var_26_3 + arg_26_0 and arg_23_1.var_.characterEffect10035 then
				arg_23_1.var_.characterEffect10035.alpha = 0
			end

			local var_26_6 = 0
			local var_26_7 = 0.925

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_8 = arg_23_1:GetWordFromCfg(117101006)
				local var_26_9 = arg_23_1:FormatText(var_26_8.content)

				arg_23_1.text_.text = var_26_9

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_10 = 37
				local var_26_11 = utf8.len(var_26_9)
				local var_26_12 = var_26_10 <= 0 and var_26_7 or var_26_7 * (var_26_11 / var_26_10)

				if var_26_12 > 0 and var_26_7 < var_26_12 then
					arg_23_1.talkMaxDuration = var_26_12

					if var_26_12 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_12 + var_26_6
					end
				end

				arg_23_1.text_.text = var_26_9
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_13 = math.max(var_26_7, arg_23_1.talkMaxDuration)

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_13 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_6) / var_26_13

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_6 + var_26_13 and arg_23_1.time_ < var_26_6 + var_26_13 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play117101007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 117101007
		arg_27_1.duration_ = 2

		local var_27_0 = {
			zh = 1.833,
			ja = 2
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
				arg_27_0:Play117101008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10035"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos10035 = var_30_0.localPosition
				var_30_0.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("10035", 2)

				local var_30_2 = var_30_0.childCount

				for iter_30_0 = 0, var_30_2 - 1 do
					local var_30_3 = var_30_0:GetChild(iter_30_0)

					if var_30_3.name == "split_4" or not string.find(var_30_3.name, "split") then
						var_30_3.gameObject:SetActive(true)
					else
						var_30_3.gameObject:SetActive(false)
					end
				end
			end

			local var_30_4 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_4 then
				local var_30_5 = (arg_27_1.time_ - var_30_1) / var_30_4
				local var_30_6 = Vector3.New(-390, -410, -235)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10035, var_30_6, var_30_5)
			end

			if arg_27_1.time_ >= var_30_1 + var_30_4 and arg_27_1.time_ < var_30_1 + var_30_4 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(-390, -410, -235)
			end

			local var_30_7 = arg_27_1.actors_["10035"]
			local var_30_8 = 0

			if var_30_8 < arg_27_1.time_ and arg_27_1.time_ <= var_30_8 + arg_30_0 and arg_27_1.var_.actorSpriteComps10035 == nil then
				arg_27_1.var_.actorSpriteComps10035 = var_30_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_9 = 0.2

			if var_30_8 <= arg_27_1.time_ and arg_27_1.time_ < var_30_8 + var_30_9 then
				local var_30_10 = (arg_27_1.time_ - var_30_8) / var_30_9

				if arg_27_1.var_.actorSpriteComps10035 then
					for iter_30_1, iter_30_2 in pairs(arg_27_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_30_2 then
							local var_30_11 = Mathf.Lerp(iter_30_2.color.r, 1, var_30_10)

							iter_30_2.color = Color.New(var_30_11, var_30_11, var_30_11)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_8 + var_30_9 and arg_27_1.time_ < var_30_8 + var_30_9 + arg_30_0 and arg_27_1.var_.actorSpriteComps10035 then
				local var_30_12 = 1

				for iter_30_3, iter_30_4 in pairs(arg_27_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_30_4 then
						iter_30_4.color = Color.New(var_30_12, var_30_12, var_30_12)
					end
				end

				arg_27_1.var_.actorSpriteComps10035 = nil
			end

			local var_30_13 = arg_27_1.actors_["10035"]
			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 then
				local var_30_15 = var_30_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_30_15 then
					arg_27_1.var_.alphaOldValue10035 = var_30_15.alpha
					arg_27_1.var_.characterEffect10035 = var_30_15
				end

				arg_27_1.var_.alphaOldValue10035 = 0
			end

			local var_30_16 = 0.5

			if var_30_14 <= arg_27_1.time_ and arg_27_1.time_ < var_30_14 + var_30_16 then
				local var_30_17 = (arg_27_1.time_ - var_30_14) / var_30_16
				local var_30_18 = Mathf.Lerp(arg_27_1.var_.alphaOldValue10035, 1, var_30_17)

				if arg_27_1.var_.characterEffect10035 then
					arg_27_1.var_.characterEffect10035.alpha = var_30_18
				end
			end

			if arg_27_1.time_ >= var_30_14 + var_30_16 and arg_27_1.time_ < var_30_14 + var_30_16 + arg_30_0 and arg_27_1.var_.characterEffect10035 then
				arg_27_1.var_.characterEffect10035.alpha = 1
			end

			local var_30_19 = 0
			local var_30_20 = 0.1

			if var_30_19 < arg_27_1.time_ and arg_27_1.time_ <= var_30_19 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_21 = arg_27_1:FormatText(StoryNameCfg[369].name)

				arg_27_1.leftNameTxt_.text = var_30_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_22 = arg_27_1:GetWordFromCfg(117101007)
				local var_30_23 = arg_27_1:FormatText(var_30_22.content)

				arg_27_1.text_.text = var_30_23

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_24 = 3
				local var_30_25 = utf8.len(var_30_23)
				local var_30_26 = var_30_24 <= 0 and var_30_20 or var_30_20 * (var_30_25 / var_30_24)

				if var_30_26 > 0 and var_30_20 < var_30_26 then
					arg_27_1.talkMaxDuration = var_30_26

					if var_30_26 + var_30_19 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_26 + var_30_19
					end
				end

				arg_27_1.text_.text = var_30_23
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101007", "story_v_out_117101.awb") ~= 0 then
					local var_30_27 = manager.audio:GetVoiceLength("story_v_out_117101", "117101007", "story_v_out_117101.awb") / 1000

					if var_30_27 + var_30_19 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_27 + var_30_19
					end

					if var_30_22.prefab_name ~= "" and arg_27_1.actors_[var_30_22.prefab_name] ~= nil then
						local var_30_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_22.prefab_name].transform, "story_v_out_117101", "117101007", "story_v_out_117101.awb")

						arg_27_1:RecordAudio("117101007", var_30_28)
						arg_27_1:RecordAudio("117101007", var_30_28)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_117101", "117101007", "story_v_out_117101.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_117101", "117101007", "story_v_out_117101.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_29 = math.max(var_30_20, arg_27_1.talkMaxDuration)

			if var_30_19 <= arg_27_1.time_ and arg_27_1.time_ < var_30_19 + var_30_29 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_19) / var_30_29

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_19 + var_30_29 and arg_27_1.time_ < var_30_19 + var_30_29 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play117101008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 117101008
		arg_31_1.duration_ = 8.1

		local var_31_0 = {
			zh = 6.266,
			ja = 8.1
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
				arg_31_0:Play117101009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = "1033"

			if arg_31_1.actors_[var_34_0] == nil then
				local var_34_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_34_0), arg_31_1.canvasGo_.transform)

				var_34_1.transform:SetSiblingIndex(1)

				var_34_1.name = var_34_0
				var_34_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_31_1.actors_[var_34_0] = var_34_1
			end

			local var_34_2 = arg_31_1.actors_["1033"].transform
			local var_34_3 = 0

			if var_34_3 < arg_31_1.time_ and arg_31_1.time_ <= var_34_3 + arg_34_0 then
				arg_31_1.var_.moveOldPos1033 = var_34_2.localPosition
				var_34_2.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("1033", 4)

				local var_34_4 = var_34_2.childCount

				for iter_34_0 = 0, var_34_4 - 1 do
					local var_34_5 = var_34_2:GetChild(iter_34_0)

					if var_34_5.name == "split_6" or not string.find(var_34_5.name, "split") then
						var_34_5.gameObject:SetActive(true)
					else
						var_34_5.gameObject:SetActive(false)
					end
				end
			end

			local var_34_6 = 0.001

			if var_34_3 <= arg_31_1.time_ and arg_31_1.time_ < var_34_3 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_3) / var_34_6
				local var_34_8 = Vector3.New(390, -420, 0)

				var_34_2.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1033, var_34_8, var_34_7)
			end

			if arg_31_1.time_ >= var_34_3 + var_34_6 and arg_31_1.time_ < var_34_3 + var_34_6 + arg_34_0 then
				var_34_2.localPosition = Vector3.New(390, -420, 0)
			end

			local var_34_9 = arg_31_1.actors_["10035"].transform
			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1.var_.moveOldPos10035 = var_34_9.localPosition
				var_34_9.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("10035", 2)

				local var_34_11 = var_34_9.childCount

				for iter_34_1 = 0, var_34_11 - 1 do
					local var_34_12 = var_34_9:GetChild(iter_34_1)

					if var_34_12.name == "split_4" or not string.find(var_34_12.name, "split") then
						var_34_12.gameObject:SetActive(true)
					else
						var_34_12.gameObject:SetActive(false)
					end
				end
			end

			local var_34_13 = 0.001

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_13 then
				local var_34_14 = (arg_31_1.time_ - var_34_10) / var_34_13
				local var_34_15 = Vector3.New(-390, -410, -235)

				var_34_9.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10035, var_34_15, var_34_14)
			end

			if arg_31_1.time_ >= var_34_10 + var_34_13 and arg_31_1.time_ < var_34_10 + var_34_13 + arg_34_0 then
				var_34_9.localPosition = Vector3.New(-390, -410, -235)
			end

			local var_34_16 = arg_31_1.actors_["10035"]
			local var_34_17 = 0

			if var_34_17 < arg_31_1.time_ and arg_31_1.time_ <= var_34_17 + arg_34_0 and arg_31_1.var_.actorSpriteComps10035 == nil then
				arg_31_1.var_.actorSpriteComps10035 = var_34_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_18 = 0.2

			if var_34_17 <= arg_31_1.time_ and arg_31_1.time_ < var_34_17 + var_34_18 then
				local var_34_19 = (arg_31_1.time_ - var_34_17) / var_34_18

				if arg_31_1.var_.actorSpriteComps10035 then
					for iter_34_2, iter_34_3 in pairs(arg_31_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_34_3 then
							local var_34_20 = Mathf.Lerp(iter_34_3.color.r, 0.5, var_34_19)

							iter_34_3.color = Color.New(var_34_20, var_34_20, var_34_20)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_17 + var_34_18 and arg_31_1.time_ < var_34_17 + var_34_18 + arg_34_0 and arg_31_1.var_.actorSpriteComps10035 then
				local var_34_21 = 0.5

				for iter_34_4, iter_34_5 in pairs(arg_31_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_34_5 then
						iter_34_5.color = Color.New(var_34_21, var_34_21, var_34_21)
					end
				end

				arg_31_1.var_.actorSpriteComps10035 = nil
			end

			local var_34_22 = arg_31_1.actors_["1033"]
			local var_34_23 = 0

			if var_34_23 < arg_31_1.time_ and arg_31_1.time_ <= var_34_23 + arg_34_0 and arg_31_1.var_.actorSpriteComps1033 == nil then
				arg_31_1.var_.actorSpriteComps1033 = var_34_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_24 = 0.2

			if var_34_23 <= arg_31_1.time_ and arg_31_1.time_ < var_34_23 + var_34_24 then
				local var_34_25 = (arg_31_1.time_ - var_34_23) / var_34_24

				if arg_31_1.var_.actorSpriteComps1033 then
					for iter_34_6, iter_34_7 in pairs(arg_31_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_34_7 then
							local var_34_26 = Mathf.Lerp(iter_34_7.color.r, 1, var_34_25)

							iter_34_7.color = Color.New(var_34_26, var_34_26, var_34_26)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_23 + var_34_24 and arg_31_1.time_ < var_34_23 + var_34_24 + arg_34_0 and arg_31_1.var_.actorSpriteComps1033 then
				local var_34_27 = 1

				for iter_34_8, iter_34_9 in pairs(arg_31_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_34_9 then
						iter_34_9.color = Color.New(var_34_27, var_34_27, var_34_27)
					end
				end

				arg_31_1.var_.actorSpriteComps1033 = nil
			end

			local var_34_28 = arg_31_1.actors_["1033"]
			local var_34_29 = 0

			if var_34_29 < arg_31_1.time_ and arg_31_1.time_ <= var_34_29 + arg_34_0 then
				local var_34_30 = var_34_28:GetComponentInChildren(typeof(CanvasGroup))

				if var_34_30 then
					arg_31_1.var_.alphaOldValue1033 = var_34_30.alpha
					arg_31_1.var_.characterEffect1033 = var_34_30
				end

				arg_31_1.var_.alphaOldValue1033 = 0
			end

			local var_34_31 = 0.5

			if var_34_29 <= arg_31_1.time_ and arg_31_1.time_ < var_34_29 + var_34_31 then
				local var_34_32 = (arg_31_1.time_ - var_34_29) / var_34_31
				local var_34_33 = Mathf.Lerp(arg_31_1.var_.alphaOldValue1033, 1, var_34_32)

				if arg_31_1.var_.characterEffect1033 then
					arg_31_1.var_.characterEffect1033.alpha = var_34_33
				end
			end

			if arg_31_1.time_ >= var_34_29 + var_34_31 and arg_31_1.time_ < var_34_29 + var_34_31 + arg_34_0 and arg_31_1.var_.characterEffect1033 then
				arg_31_1.var_.characterEffect1033.alpha = 1
			end

			local var_34_34 = 0
			local var_34_35 = 0.725

			if var_34_34 < arg_31_1.time_ and arg_31_1.time_ <= var_34_34 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_36 = arg_31_1:FormatText(StoryNameCfg[236].name)

				arg_31_1.leftNameTxt_.text = var_34_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_37 = arg_31_1:GetWordFromCfg(117101008)
				local var_34_38 = arg_31_1:FormatText(var_34_37.content)

				arg_31_1.text_.text = var_34_38

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_39 = 29
				local var_34_40 = utf8.len(var_34_38)
				local var_34_41 = var_34_39 <= 0 and var_34_35 or var_34_35 * (var_34_40 / var_34_39)

				if var_34_41 > 0 and var_34_35 < var_34_41 then
					arg_31_1.talkMaxDuration = var_34_41

					if var_34_41 + var_34_34 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_41 + var_34_34
					end
				end

				arg_31_1.text_.text = var_34_38
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101008", "story_v_out_117101.awb") ~= 0 then
					local var_34_42 = manager.audio:GetVoiceLength("story_v_out_117101", "117101008", "story_v_out_117101.awb") / 1000

					if var_34_42 + var_34_34 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_42 + var_34_34
					end

					if var_34_37.prefab_name ~= "" and arg_31_1.actors_[var_34_37.prefab_name] ~= nil then
						local var_34_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_37.prefab_name].transform, "story_v_out_117101", "117101008", "story_v_out_117101.awb")

						arg_31_1:RecordAudio("117101008", var_34_43)
						arg_31_1:RecordAudio("117101008", var_34_43)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_117101", "117101008", "story_v_out_117101.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_117101", "117101008", "story_v_out_117101.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_44 = math.max(var_34_35, arg_31_1.talkMaxDuration)

			if var_34_34 <= arg_31_1.time_ and arg_31_1.time_ < var_34_34 + var_34_44 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_34) / var_34_44

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_34 + var_34_44 and arg_31_1.time_ < var_34_34 + var_34_44 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play117101009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 117101009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play117101010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1033"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.actorSpriteComps1033 == nil then
				arg_35_1.var_.actorSpriteComps1033 = var_38_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_2 = 0.2

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.actorSpriteComps1033 then
					for iter_38_0, iter_38_1 in pairs(arg_35_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_38_1 then
							local var_38_4 = Mathf.Lerp(iter_38_1.color.r, 0.5, var_38_3)

							iter_38_1.color = Color.New(var_38_4, var_38_4, var_38_4)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.actorSpriteComps1033 then
				local var_38_5 = 0.5

				for iter_38_2, iter_38_3 in pairs(arg_35_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_38_3 then
						iter_38_3.color = Color.New(var_38_5, var_38_5, var_38_5)
					end
				end

				arg_35_1.var_.actorSpriteComps1033 = nil
			end

			local var_38_6 = 0
			local var_38_7 = 0.625

			if var_38_6 < arg_35_1.time_ and arg_35_1.time_ <= var_38_6 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_8 = arg_35_1:GetWordFromCfg(117101009)
				local var_38_9 = arg_35_1:FormatText(var_38_8.content)

				arg_35_1.text_.text = var_38_9

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_10 = 25
				local var_38_11 = utf8.len(var_38_9)
				local var_38_12 = var_38_10 <= 0 and var_38_7 or var_38_7 * (var_38_11 / var_38_10)

				if var_38_12 > 0 and var_38_7 < var_38_12 then
					arg_35_1.talkMaxDuration = var_38_12

					if var_38_12 + var_38_6 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_12 + var_38_6
					end
				end

				arg_35_1.text_.text = var_38_9
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_13 = math.max(var_38_7, arg_35_1.talkMaxDuration)

			if var_38_6 <= arg_35_1.time_ and arg_35_1.time_ < var_38_6 + var_38_13 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_6) / var_38_13

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_6 + var_38_13 and arg_35_1.time_ < var_38_6 + var_38_13 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play117101010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 117101010
		arg_39_1.duration_ = 4.6

		local var_39_0 = {
			zh = 4.2,
			ja = 4.6
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
				arg_39_0:Play117101011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10035"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos10035 = var_42_0.localPosition
				var_42_0.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("10035", 7)

				local var_42_2 = var_42_0.childCount

				for iter_42_0 = 0, var_42_2 - 1 do
					local var_42_3 = var_42_0:GetChild(iter_42_0)

					if var_42_3.name == "split_4" or not string.find(var_42_3.name, "split") then
						var_42_3.gameObject:SetActive(true)
					else
						var_42_3.gameObject:SetActive(false)
					end
				end
			end

			local var_42_4 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_4 then
				local var_42_5 = (arg_39_1.time_ - var_42_1) / var_42_4
				local var_42_6 = Vector3.New(0, -2000, -235)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10035, var_42_6, var_42_5)
			end

			if arg_39_1.time_ >= var_42_1 + var_42_4 and arg_39_1.time_ < var_42_1 + var_42_4 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(0, -2000, -235)
			end

			local var_42_7 = "10034"

			if arg_39_1.actors_[var_42_7] == nil then
				local var_42_8 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_42_7), arg_39_1.canvasGo_.transform)

				var_42_8.transform:SetSiblingIndex(1)

				var_42_8.name = var_42_7
				var_42_8.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_39_1.actors_[var_42_7] = var_42_8
			end

			local var_42_9 = arg_39_1.actors_["10034"].transform
			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1.var_.moveOldPos10034 = var_42_9.localPosition
				var_42_9.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("10034", 2)

				local var_42_11 = var_42_9.childCount

				for iter_42_1 = 0, var_42_11 - 1 do
					local var_42_12 = var_42_9:GetChild(iter_42_1)

					if var_42_12.name == "split_2" or not string.find(var_42_12.name, "split") then
						var_42_12.gameObject:SetActive(true)
					else
						var_42_12.gameObject:SetActive(false)
					end
				end
			end

			local var_42_13 = 0.001

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_13 then
				local var_42_14 = (arg_39_1.time_ - var_42_10) / var_42_13
				local var_42_15 = Vector3.New(-390, -415, -290)

				var_42_9.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10034, var_42_15, var_42_14)
			end

			if arg_39_1.time_ >= var_42_10 + var_42_13 and arg_39_1.time_ < var_42_10 + var_42_13 + arg_42_0 then
				var_42_9.localPosition = Vector3.New(-390, -415, -290)
			end

			local var_42_16 = arg_39_1.actors_["10034"]
			local var_42_17 = 0

			if var_42_17 < arg_39_1.time_ and arg_39_1.time_ <= var_42_17 + arg_42_0 and arg_39_1.var_.actorSpriteComps10034 == nil then
				arg_39_1.var_.actorSpriteComps10034 = var_42_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_18 = 0.2

			if var_42_17 <= arg_39_1.time_ and arg_39_1.time_ < var_42_17 + var_42_18 then
				local var_42_19 = (arg_39_1.time_ - var_42_17) / var_42_18

				if arg_39_1.var_.actorSpriteComps10034 then
					for iter_42_2, iter_42_3 in pairs(arg_39_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_42_3 then
							local var_42_20 = Mathf.Lerp(iter_42_3.color.r, 1, var_42_19)

							iter_42_3.color = Color.New(var_42_20, var_42_20, var_42_20)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_17 + var_42_18 and arg_39_1.time_ < var_42_17 + var_42_18 + arg_42_0 and arg_39_1.var_.actorSpriteComps10034 then
				local var_42_21 = 1

				for iter_42_4, iter_42_5 in pairs(arg_39_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_42_5 then
						iter_42_5.color = Color.New(var_42_21, var_42_21, var_42_21)
					end
				end

				arg_39_1.var_.actorSpriteComps10034 = nil
			end

			local var_42_22 = arg_39_1.actors_["10034"]
			local var_42_23 = 0

			if var_42_23 < arg_39_1.time_ and arg_39_1.time_ <= var_42_23 + arg_42_0 then
				local var_42_24 = var_42_22:GetComponentInChildren(typeof(CanvasGroup))

				if var_42_24 then
					arg_39_1.var_.alphaOldValue10034 = var_42_24.alpha
					arg_39_1.var_.characterEffect10034 = var_42_24
				end

				arg_39_1.var_.alphaOldValue10034 = 0
			end

			local var_42_25 = 0.5

			if var_42_23 <= arg_39_1.time_ and arg_39_1.time_ < var_42_23 + var_42_25 then
				local var_42_26 = (arg_39_1.time_ - var_42_23) / var_42_25
				local var_42_27 = Mathf.Lerp(arg_39_1.var_.alphaOldValue10034, 1, var_42_26)

				if arg_39_1.var_.characterEffect10034 then
					arg_39_1.var_.characterEffect10034.alpha = var_42_27
				end
			end

			if arg_39_1.time_ >= var_42_23 + var_42_25 and arg_39_1.time_ < var_42_23 + var_42_25 + arg_42_0 and arg_39_1.var_.characterEffect10034 then
				arg_39_1.var_.characterEffect10034.alpha = 1
			end

			local var_42_28 = 0
			local var_42_29 = 0.5

			if var_42_28 < arg_39_1.time_ and arg_39_1.time_ <= var_42_28 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_30 = arg_39_1:FormatText(StoryNameCfg[367].name)

				arg_39_1.leftNameTxt_.text = var_42_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_31 = arg_39_1:GetWordFromCfg(117101010)
				local var_42_32 = arg_39_1:FormatText(var_42_31.content)

				arg_39_1.text_.text = var_42_32

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_33 = 20
				local var_42_34 = utf8.len(var_42_32)
				local var_42_35 = var_42_33 <= 0 and var_42_29 or var_42_29 * (var_42_34 / var_42_33)

				if var_42_35 > 0 and var_42_29 < var_42_35 then
					arg_39_1.talkMaxDuration = var_42_35

					if var_42_35 + var_42_28 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_35 + var_42_28
					end
				end

				arg_39_1.text_.text = var_42_32
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101010", "story_v_out_117101.awb") ~= 0 then
					local var_42_36 = manager.audio:GetVoiceLength("story_v_out_117101", "117101010", "story_v_out_117101.awb") / 1000

					if var_42_36 + var_42_28 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_36 + var_42_28
					end

					if var_42_31.prefab_name ~= "" and arg_39_1.actors_[var_42_31.prefab_name] ~= nil then
						local var_42_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_31.prefab_name].transform, "story_v_out_117101", "117101010", "story_v_out_117101.awb")

						arg_39_1:RecordAudio("117101010", var_42_37)
						arg_39_1:RecordAudio("117101010", var_42_37)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_117101", "117101010", "story_v_out_117101.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_117101", "117101010", "story_v_out_117101.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_38 = math.max(var_42_29, arg_39_1.talkMaxDuration)

			if var_42_28 <= arg_39_1.time_ and arg_39_1.time_ < var_42_28 + var_42_38 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_28) / var_42_38

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_28 + var_42_38 and arg_39_1.time_ < var_42_28 + var_42_38 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play117101011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 117101011
		arg_43_1.duration_ = 1.9

		local var_43_0 = {
			zh = 1.4,
			ja = 1.9
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
				arg_43_0:Play117101012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10034"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.actorSpriteComps10034 == nil then
				arg_43_1.var_.actorSpriteComps10034 = var_46_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_2 = 0.2

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.actorSpriteComps10034 then
					for iter_46_0, iter_46_1 in pairs(arg_43_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_46_1 then
							local var_46_4 = Mathf.Lerp(iter_46_1.color.r, 0.5, var_46_3)

							iter_46_1.color = Color.New(var_46_4, var_46_4, var_46_4)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.actorSpriteComps10034 then
				local var_46_5 = 0.5

				for iter_46_2, iter_46_3 in pairs(arg_43_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_46_3 then
						iter_46_3.color = Color.New(var_46_5, var_46_5, var_46_5)
					end
				end

				arg_43_1.var_.actorSpriteComps10034 = nil
			end

			local var_46_6 = 0
			local var_46_7 = 0.1

			if var_46_6 < arg_43_1.time_ and arg_43_1.time_ <= var_46_6 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_8 = arg_43_1:FormatText(StoryNameCfg[369].name)

				arg_43_1.leftNameTxt_.text = var_46_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, true)
				arg_43_1.iconController_:SetSelectedState("hero")

				arg_43_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10035_split_5")

				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_9 = arg_43_1:GetWordFromCfg(117101011)
				local var_46_10 = arg_43_1:FormatText(var_46_9.content)

				arg_43_1.text_.text = var_46_10

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_11 = 4
				local var_46_12 = utf8.len(var_46_10)
				local var_46_13 = var_46_11 <= 0 and var_46_7 or var_46_7 * (var_46_12 / var_46_11)

				if var_46_13 > 0 and var_46_7 < var_46_13 then
					arg_43_1.talkMaxDuration = var_46_13

					if var_46_13 + var_46_6 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_13 + var_46_6
					end
				end

				arg_43_1.text_.text = var_46_10
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101011", "story_v_out_117101.awb") ~= 0 then
					local var_46_14 = manager.audio:GetVoiceLength("story_v_out_117101", "117101011", "story_v_out_117101.awb") / 1000

					if var_46_14 + var_46_6 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_14 + var_46_6
					end

					if var_46_9.prefab_name ~= "" and arg_43_1.actors_[var_46_9.prefab_name] ~= nil then
						local var_46_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_9.prefab_name].transform, "story_v_out_117101", "117101011", "story_v_out_117101.awb")

						arg_43_1:RecordAudio("117101011", var_46_15)
						arg_43_1:RecordAudio("117101011", var_46_15)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_117101", "117101011", "story_v_out_117101.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_117101", "117101011", "story_v_out_117101.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_16 = math.max(var_46_7, arg_43_1.talkMaxDuration)

			if var_46_6 <= arg_43_1.time_ and arg_43_1.time_ < var_46_6 + var_46_16 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_6) / var_46_16

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_6 + var_46_16 and arg_43_1.time_ < var_46_6 + var_46_16 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play117101012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 117101012
		arg_47_1.duration_ = 3.833

		local var_47_0 = {
			zh = 2.6,
			ja = 3.833
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
				arg_47_0:Play117101013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10034"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.actorSpriteComps10034 == nil then
				arg_47_1.var_.actorSpriteComps10034 = var_50_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_2 = 0.2

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.actorSpriteComps10034 then
					for iter_50_0, iter_50_1 in pairs(arg_47_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_50_1 then
							local var_50_4 = Mathf.Lerp(iter_50_1.color.r, 1, var_50_3)

							iter_50_1.color = Color.New(var_50_4, var_50_4, var_50_4)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.actorSpriteComps10034 then
				local var_50_5 = 1

				for iter_50_2, iter_50_3 in pairs(arg_47_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_50_3 then
						iter_50_3.color = Color.New(var_50_5, var_50_5, var_50_5)
					end
				end

				arg_47_1.var_.actorSpriteComps10034 = nil
			end

			local var_50_6 = 0
			local var_50_7 = 0.3

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_8 = arg_47_1:FormatText(StoryNameCfg[367].name)

				arg_47_1.leftNameTxt_.text = var_50_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_9 = arg_47_1:GetWordFromCfg(117101012)
				local var_50_10 = arg_47_1:FormatText(var_50_9.content)

				arg_47_1.text_.text = var_50_10

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_11 = 12
				local var_50_12 = utf8.len(var_50_10)
				local var_50_13 = var_50_11 <= 0 and var_50_7 or var_50_7 * (var_50_12 / var_50_11)

				if var_50_13 > 0 and var_50_7 < var_50_13 then
					arg_47_1.talkMaxDuration = var_50_13

					if var_50_13 + var_50_6 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_13 + var_50_6
					end
				end

				arg_47_1.text_.text = var_50_10
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101012", "story_v_out_117101.awb") ~= 0 then
					local var_50_14 = manager.audio:GetVoiceLength("story_v_out_117101", "117101012", "story_v_out_117101.awb") / 1000

					if var_50_14 + var_50_6 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_14 + var_50_6
					end

					if var_50_9.prefab_name ~= "" and arg_47_1.actors_[var_50_9.prefab_name] ~= nil then
						local var_50_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_9.prefab_name].transform, "story_v_out_117101", "117101012", "story_v_out_117101.awb")

						arg_47_1:RecordAudio("117101012", var_50_15)
						arg_47_1:RecordAudio("117101012", var_50_15)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_117101", "117101012", "story_v_out_117101.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_117101", "117101012", "story_v_out_117101.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_16 = math.max(var_50_7, arg_47_1.talkMaxDuration)

			if var_50_6 <= arg_47_1.time_ and arg_47_1.time_ < var_50_6 + var_50_16 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_6) / var_50_16

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_6 + var_50_16 and arg_47_1.time_ < var_50_6 + var_50_16 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play117101013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 117101013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play117101014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["10034"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.actorSpriteComps10034 == nil then
				arg_51_1.var_.actorSpriteComps10034 = var_54_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_2 = 0.2

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.actorSpriteComps10034 then
					for iter_54_0, iter_54_1 in pairs(arg_51_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_54_1 then
							local var_54_4 = Mathf.Lerp(iter_54_1.color.r, 0.5, var_54_3)

							iter_54_1.color = Color.New(var_54_4, var_54_4, var_54_4)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.actorSpriteComps10034 then
				local var_54_5 = 0.5

				for iter_54_2, iter_54_3 in pairs(arg_51_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_54_3 then
						iter_54_3.color = Color.New(var_54_5, var_54_5, var_54_5)
					end
				end

				arg_51_1.var_.actorSpriteComps10034 = nil
			end

			local var_54_6 = 0
			local var_54_7 = 0.925

			if var_54_6 < arg_51_1.time_ and arg_51_1.time_ <= var_54_6 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_8 = arg_51_1:GetWordFromCfg(117101013)
				local var_54_9 = arg_51_1:FormatText(var_54_8.content)

				arg_51_1.text_.text = var_54_9

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_10 = 37
				local var_54_11 = utf8.len(var_54_9)
				local var_54_12 = var_54_10 <= 0 and var_54_7 or var_54_7 * (var_54_11 / var_54_10)

				if var_54_12 > 0 and var_54_7 < var_54_12 then
					arg_51_1.talkMaxDuration = var_54_12

					if var_54_12 + var_54_6 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_12 + var_54_6
					end
				end

				arg_51_1.text_.text = var_54_9
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_13 = math.max(var_54_7, arg_51_1.talkMaxDuration)

			if var_54_6 <= arg_51_1.time_ and arg_51_1.time_ < var_54_6 + var_54_13 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_6) / var_54_13

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_6 + var_54_13 and arg_51_1.time_ < var_54_6 + var_54_13 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play117101014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 117101014
		arg_55_1.duration_ = 2.033

		local var_55_0 = {
			zh = 1.766,
			ja = 2.033
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
				arg_55_0:Play117101015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1033"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1033 = var_58_0.localPosition
				var_58_0.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("1033", 4)

				local var_58_2 = var_58_0.childCount

				for iter_58_0 = 0, var_58_2 - 1 do
					local var_58_3 = var_58_0:GetChild(iter_58_0)

					if var_58_3.name == "split_6" or not string.find(var_58_3.name, "split") then
						var_58_3.gameObject:SetActive(true)
					else
						var_58_3.gameObject:SetActive(false)
					end
				end
			end

			local var_58_4 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_4 then
				local var_58_5 = (arg_55_1.time_ - var_58_1) / var_58_4
				local var_58_6 = Vector3.New(390, -420, 0)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1033, var_58_6, var_58_5)
			end

			if arg_55_1.time_ >= var_58_1 + var_58_4 and arg_55_1.time_ < var_58_1 + var_58_4 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_58_7 = arg_55_1.actors_["1033"]
			local var_58_8 = 0

			if var_58_8 < arg_55_1.time_ and arg_55_1.time_ <= var_58_8 + arg_58_0 and arg_55_1.var_.actorSpriteComps1033 == nil then
				arg_55_1.var_.actorSpriteComps1033 = var_58_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_9 = 0.2

			if var_58_8 <= arg_55_1.time_ and arg_55_1.time_ < var_58_8 + var_58_9 then
				local var_58_10 = (arg_55_1.time_ - var_58_8) / var_58_9

				if arg_55_1.var_.actorSpriteComps1033 then
					for iter_58_1, iter_58_2 in pairs(arg_55_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_58_2 then
							local var_58_11 = Mathf.Lerp(iter_58_2.color.r, 1, var_58_10)

							iter_58_2.color = Color.New(var_58_11, var_58_11, var_58_11)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_8 + var_58_9 and arg_55_1.time_ < var_58_8 + var_58_9 + arg_58_0 and arg_55_1.var_.actorSpriteComps1033 then
				local var_58_12 = 1

				for iter_58_3, iter_58_4 in pairs(arg_55_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_58_4 then
						iter_58_4.color = Color.New(var_58_12, var_58_12, var_58_12)
					end
				end

				arg_55_1.var_.actorSpriteComps1033 = nil
			end

			local var_58_13 = 0
			local var_58_14 = 0.075

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_15 = arg_55_1:FormatText(StoryNameCfg[236].name)

				arg_55_1.leftNameTxt_.text = var_58_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_16 = arg_55_1:GetWordFromCfg(117101014)
				local var_58_17 = arg_55_1:FormatText(var_58_16.content)

				arg_55_1.text_.text = var_58_17

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_18 = 3
				local var_58_19 = utf8.len(var_58_17)
				local var_58_20 = var_58_18 <= 0 and var_58_14 or var_58_14 * (var_58_19 / var_58_18)

				if var_58_20 > 0 and var_58_14 < var_58_20 then
					arg_55_1.talkMaxDuration = var_58_20

					if var_58_20 + var_58_13 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_20 + var_58_13
					end
				end

				arg_55_1.text_.text = var_58_17
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101014", "story_v_out_117101.awb") ~= 0 then
					local var_58_21 = manager.audio:GetVoiceLength("story_v_out_117101", "117101014", "story_v_out_117101.awb") / 1000

					if var_58_21 + var_58_13 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_21 + var_58_13
					end

					if var_58_16.prefab_name ~= "" and arg_55_1.actors_[var_58_16.prefab_name] ~= nil then
						local var_58_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_16.prefab_name].transform, "story_v_out_117101", "117101014", "story_v_out_117101.awb")

						arg_55_1:RecordAudio("117101014", var_58_22)
						arg_55_1:RecordAudio("117101014", var_58_22)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_117101", "117101014", "story_v_out_117101.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_117101", "117101014", "story_v_out_117101.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_23 = math.max(var_58_14, arg_55_1.talkMaxDuration)

			if var_58_13 <= arg_55_1.time_ and arg_55_1.time_ < var_58_13 + var_58_23 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_13) / var_58_23

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_13 + var_58_23 and arg_55_1.time_ < var_58_13 + var_58_23 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play117101015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 117101015
		arg_59_1.duration_ = 7.566

		local var_59_0 = {
			zh = 7.566,
			ja = 4.466
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
				arg_59_0:Play117101016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["10034"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.actorSpriteComps10034 == nil then
				arg_59_1.var_.actorSpriteComps10034 = var_62_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_2 = 0.2

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.actorSpriteComps10034 then
					for iter_62_0, iter_62_1 in pairs(arg_59_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_62_1 then
							local var_62_4 = Mathf.Lerp(iter_62_1.color.r, 1, var_62_3)

							iter_62_1.color = Color.New(var_62_4, var_62_4, var_62_4)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.actorSpriteComps10034 then
				local var_62_5 = 1

				for iter_62_2, iter_62_3 in pairs(arg_59_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_62_3 then
						iter_62_3.color = Color.New(var_62_5, var_62_5, var_62_5)
					end
				end

				arg_59_1.var_.actorSpriteComps10034 = nil
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

				local var_62_14 = arg_59_1:FormatText(StoryNameCfg[367].name)

				arg_59_1.leftNameTxt_.text = var_62_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_15 = arg_59_1:GetWordFromCfg(117101015)
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

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101015", "story_v_out_117101.awb") ~= 0 then
					local var_62_20 = manager.audio:GetVoiceLength("story_v_out_117101", "117101015", "story_v_out_117101.awb") / 1000

					if var_62_20 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_20 + var_62_12
					end

					if var_62_15.prefab_name ~= "" and arg_59_1.actors_[var_62_15.prefab_name] ~= nil then
						local var_62_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_15.prefab_name].transform, "story_v_out_117101", "117101015", "story_v_out_117101.awb")

						arg_59_1:RecordAudio("117101015", var_62_21)
						arg_59_1:RecordAudio("117101015", var_62_21)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_117101", "117101015", "story_v_out_117101.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_117101", "117101015", "story_v_out_117101.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_22 = math.max(var_62_13, arg_59_1.talkMaxDuration)

			if var_62_12 <= arg_59_1.time_ and arg_59_1.time_ < var_62_12 + var_62_22 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_12) / var_62_22

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_12 + var_62_22 and arg_59_1.time_ < var_62_12 + var_62_22 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play117101016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 117101016
		arg_63_1.duration_ = 6.9

		local var_63_0 = {
			zh = 6.9,
			ja = 4.733
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
				arg_63_0:Play117101017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["10034"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.actorSpriteComps10034 == nil then
				arg_63_1.var_.actorSpriteComps10034 = var_66_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_2 = 0.2

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.actorSpriteComps10034 then
					for iter_66_0, iter_66_1 in pairs(arg_63_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_66_1 then
							local var_66_4 = Mathf.Lerp(iter_66_1.color.r, 0.5, var_66_3)

							iter_66_1.color = Color.New(var_66_4, var_66_4, var_66_4)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.actorSpriteComps10034 then
				local var_66_5 = 0.5

				for iter_66_2, iter_66_3 in pairs(arg_63_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_66_3 then
						iter_66_3.color = Color.New(var_66_5, var_66_5, var_66_5)
					end
				end

				arg_63_1.var_.actorSpriteComps10034 = nil
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
			local var_66_13 = 0.6

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

				local var_66_15 = arg_63_1:GetWordFromCfg(117101016)
				local var_66_16 = arg_63_1:FormatText(var_66_15.content)

				arg_63_1.text_.text = var_66_16

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_17 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101016", "story_v_out_117101.awb") ~= 0 then
					local var_66_20 = manager.audio:GetVoiceLength("story_v_out_117101", "117101016", "story_v_out_117101.awb") / 1000

					if var_66_20 + var_66_12 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_20 + var_66_12
					end

					if var_66_15.prefab_name ~= "" and arg_63_1.actors_[var_66_15.prefab_name] ~= nil then
						local var_66_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_15.prefab_name].transform, "story_v_out_117101", "117101016", "story_v_out_117101.awb")

						arg_63_1:RecordAudio("117101016", var_66_21)
						arg_63_1:RecordAudio("117101016", var_66_21)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_117101", "117101016", "story_v_out_117101.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_117101", "117101016", "story_v_out_117101.awb")
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
	Play117101017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 117101017
		arg_67_1.duration_ = 8.333

		local var_67_0 = {
			zh = 8.333,
			ja = 4.533
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
				arg_67_0:Play117101018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["10034"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.actorSpriteComps10034 == nil then
				arg_67_1.var_.actorSpriteComps10034 = var_70_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_2 = 0.2

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.actorSpriteComps10034 then
					for iter_70_0, iter_70_1 in pairs(arg_67_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_70_1 then
							local var_70_4 = Mathf.Lerp(iter_70_1.color.r, 1, var_70_3)

							iter_70_1.color = Color.New(var_70_4, var_70_4, var_70_4)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.actorSpriteComps10034 then
				local var_70_5 = 1

				for iter_70_2, iter_70_3 in pairs(arg_67_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_70_3 then
						iter_70_3.color = Color.New(var_70_5, var_70_5, var_70_5)
					end
				end

				arg_67_1.var_.actorSpriteComps10034 = nil
			end

			local var_70_6 = arg_67_1.actors_["1033"]
			local var_70_7 = 0

			if var_70_7 < arg_67_1.time_ and arg_67_1.time_ <= var_70_7 + arg_70_0 and arg_67_1.var_.actorSpriteComps1033 == nil then
				arg_67_1.var_.actorSpriteComps1033 = var_70_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_8 = 0.2

			if var_70_7 <= arg_67_1.time_ and arg_67_1.time_ < var_70_7 + var_70_8 then
				local var_70_9 = (arg_67_1.time_ - var_70_7) / var_70_8

				if arg_67_1.var_.actorSpriteComps1033 then
					for iter_70_4, iter_70_5 in pairs(arg_67_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_70_5 then
							local var_70_10 = Mathf.Lerp(iter_70_5.color.r, 0.5, var_70_9)

							iter_70_5.color = Color.New(var_70_10, var_70_10, var_70_10)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_7 + var_70_8 and arg_67_1.time_ < var_70_7 + var_70_8 + arg_70_0 and arg_67_1.var_.actorSpriteComps1033 then
				local var_70_11 = 0.5

				for iter_70_6, iter_70_7 in pairs(arg_67_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_70_7 then
						iter_70_7.color = Color.New(var_70_11, var_70_11, var_70_11)
					end
				end

				arg_67_1.var_.actorSpriteComps1033 = nil
			end

			local var_70_12 = 0
			local var_70_13 = 0.85

			if var_70_12 < arg_67_1.time_ and arg_67_1.time_ <= var_70_12 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_14 = arg_67_1:FormatText(StoryNameCfg[367].name)

				arg_67_1.leftNameTxt_.text = var_70_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_15 = arg_67_1:GetWordFromCfg(117101017)
				local var_70_16 = arg_67_1:FormatText(var_70_15.content)

				arg_67_1.text_.text = var_70_16

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_17 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101017", "story_v_out_117101.awb") ~= 0 then
					local var_70_20 = manager.audio:GetVoiceLength("story_v_out_117101", "117101017", "story_v_out_117101.awb") / 1000

					if var_70_20 + var_70_12 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_20 + var_70_12
					end

					if var_70_15.prefab_name ~= "" and arg_67_1.actors_[var_70_15.prefab_name] ~= nil then
						local var_70_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_15.prefab_name].transform, "story_v_out_117101", "117101017", "story_v_out_117101.awb")

						arg_67_1:RecordAudio("117101017", var_70_21)
						arg_67_1:RecordAudio("117101017", var_70_21)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_117101", "117101017", "story_v_out_117101.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_117101", "117101017", "story_v_out_117101.awb")
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
	Play117101018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 117101018
		arg_71_1.duration_ = 6.666

		local var_71_0 = {
			zh = 4.533,
			ja = 6.666
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
				arg_71_0:Play117101019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1033"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1033 = var_74_0.localPosition
				var_74_0.localScale = Vector3.New(1, 1, 1)

				arg_71_1:CheckSpriteTmpPos("1033", 4)

				local var_74_2 = var_74_0.childCount

				for iter_74_0 = 0, var_74_2 - 1 do
					local var_74_3 = var_74_0:GetChild(iter_74_0)

					if var_74_3.name == "split_6" or not string.find(var_74_3.name, "split") then
						var_74_3.gameObject:SetActive(true)
					else
						var_74_3.gameObject:SetActive(false)
					end
				end
			end

			local var_74_4 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_4 then
				local var_74_5 = (arg_71_1.time_ - var_74_1) / var_74_4
				local var_74_6 = Vector3.New(390, -420, 0)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1033, var_74_6, var_74_5)
			end

			if arg_71_1.time_ >= var_74_1 + var_74_4 and arg_71_1.time_ < var_74_1 + var_74_4 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_74_7 = arg_71_1.actors_["10034"]
			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 and arg_71_1.var_.actorSpriteComps10034 == nil then
				arg_71_1.var_.actorSpriteComps10034 = var_74_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_9 = 0.2

			if var_74_8 <= arg_71_1.time_ and arg_71_1.time_ < var_74_8 + var_74_9 then
				local var_74_10 = (arg_71_1.time_ - var_74_8) / var_74_9

				if arg_71_1.var_.actorSpriteComps10034 then
					for iter_74_1, iter_74_2 in pairs(arg_71_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_74_2 then
							local var_74_11 = Mathf.Lerp(iter_74_2.color.r, 0.5, var_74_10)

							iter_74_2.color = Color.New(var_74_11, var_74_11, var_74_11)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_8 + var_74_9 and arg_71_1.time_ < var_74_8 + var_74_9 + arg_74_0 and arg_71_1.var_.actorSpriteComps10034 then
				local var_74_12 = 0.5

				for iter_74_3, iter_74_4 in pairs(arg_71_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_74_4 then
						iter_74_4.color = Color.New(var_74_12, var_74_12, var_74_12)
					end
				end

				arg_71_1.var_.actorSpriteComps10034 = nil
			end

			local var_74_13 = arg_71_1.actors_["1033"]
			local var_74_14 = 0

			if var_74_14 < arg_71_1.time_ and arg_71_1.time_ <= var_74_14 + arg_74_0 and arg_71_1.var_.actorSpriteComps1033 == nil then
				arg_71_1.var_.actorSpriteComps1033 = var_74_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_15 = 0.2

			if var_74_14 <= arg_71_1.time_ and arg_71_1.time_ < var_74_14 + var_74_15 then
				local var_74_16 = (arg_71_1.time_ - var_74_14) / var_74_15

				if arg_71_1.var_.actorSpriteComps1033 then
					for iter_74_5, iter_74_6 in pairs(arg_71_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_74_6 then
							local var_74_17 = Mathf.Lerp(iter_74_6.color.r, 1, var_74_16)

							iter_74_6.color = Color.New(var_74_17, var_74_17, var_74_17)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_14 + var_74_15 and arg_71_1.time_ < var_74_14 + var_74_15 + arg_74_0 and arg_71_1.var_.actorSpriteComps1033 then
				local var_74_18 = 1

				for iter_74_7, iter_74_8 in pairs(arg_71_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_74_8 then
						iter_74_8.color = Color.New(var_74_18, var_74_18, var_74_18)
					end
				end

				arg_71_1.var_.actorSpriteComps1033 = nil
			end

			local var_74_19 = 0
			local var_74_20 = 0.45

			if var_74_19 < arg_71_1.time_ and arg_71_1.time_ <= var_74_19 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_21 = arg_71_1:FormatText(StoryNameCfg[236].name)

				arg_71_1.leftNameTxt_.text = var_74_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_22 = arg_71_1:GetWordFromCfg(117101018)
				local var_74_23 = arg_71_1:FormatText(var_74_22.content)

				arg_71_1.text_.text = var_74_23

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_24 = 18
				local var_74_25 = utf8.len(var_74_23)
				local var_74_26 = var_74_24 <= 0 and var_74_20 or var_74_20 * (var_74_25 / var_74_24)

				if var_74_26 > 0 and var_74_20 < var_74_26 then
					arg_71_1.talkMaxDuration = var_74_26

					if var_74_26 + var_74_19 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_26 + var_74_19
					end
				end

				arg_71_1.text_.text = var_74_23
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101018", "story_v_out_117101.awb") ~= 0 then
					local var_74_27 = manager.audio:GetVoiceLength("story_v_out_117101", "117101018", "story_v_out_117101.awb") / 1000

					if var_74_27 + var_74_19 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_27 + var_74_19
					end

					if var_74_22.prefab_name ~= "" and arg_71_1.actors_[var_74_22.prefab_name] ~= nil then
						local var_74_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_22.prefab_name].transform, "story_v_out_117101", "117101018", "story_v_out_117101.awb")

						arg_71_1:RecordAudio("117101018", var_74_28)
						arg_71_1:RecordAudio("117101018", var_74_28)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_117101", "117101018", "story_v_out_117101.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_117101", "117101018", "story_v_out_117101.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_29 = math.max(var_74_20, arg_71_1.talkMaxDuration)

			if var_74_19 <= arg_71_1.time_ and arg_71_1.time_ < var_74_19 + var_74_29 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_19) / var_74_29

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_19 + var_74_29 and arg_71_1.time_ < var_74_19 + var_74_29 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play117101019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 117101019
		arg_75_1.duration_ = 12

		local var_75_0 = {
			zh = 6.5,
			ja = 12
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
				arg_75_0:Play117101020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["10034"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.actorSpriteComps10034 == nil then
				arg_75_1.var_.actorSpriteComps10034 = var_78_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_2 = 0.2

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.actorSpriteComps10034 then
					for iter_78_0, iter_78_1 in pairs(arg_75_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_78_1 then
							local var_78_4 = Mathf.Lerp(iter_78_1.color.r, 1, var_78_3)

							iter_78_1.color = Color.New(var_78_4, var_78_4, var_78_4)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.actorSpriteComps10034 then
				local var_78_5 = 1

				for iter_78_2, iter_78_3 in pairs(arg_75_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_78_3 then
						iter_78_3.color = Color.New(var_78_5, var_78_5, var_78_5)
					end
				end

				arg_75_1.var_.actorSpriteComps10034 = nil
			end

			local var_78_6 = arg_75_1.actors_["1033"]
			local var_78_7 = 0

			if var_78_7 < arg_75_1.time_ and arg_75_1.time_ <= var_78_7 + arg_78_0 and arg_75_1.var_.actorSpriteComps1033 == nil then
				arg_75_1.var_.actorSpriteComps1033 = var_78_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_8 = 0.2

			if var_78_7 <= arg_75_1.time_ and arg_75_1.time_ < var_78_7 + var_78_8 then
				local var_78_9 = (arg_75_1.time_ - var_78_7) / var_78_8

				if arg_75_1.var_.actorSpriteComps1033 then
					for iter_78_4, iter_78_5 in pairs(arg_75_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_78_5 then
							local var_78_10 = Mathf.Lerp(iter_78_5.color.r, 0.5, var_78_9)

							iter_78_5.color = Color.New(var_78_10, var_78_10, var_78_10)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_7 + var_78_8 and arg_75_1.time_ < var_78_7 + var_78_8 + arg_78_0 and arg_75_1.var_.actorSpriteComps1033 then
				local var_78_11 = 0.5

				for iter_78_6, iter_78_7 in pairs(arg_75_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_78_7 then
						iter_78_7.color = Color.New(var_78_11, var_78_11, var_78_11)
					end
				end

				arg_75_1.var_.actorSpriteComps1033 = nil
			end

			local var_78_12 = 0
			local var_78_13 = 0.675

			if var_78_12 < arg_75_1.time_ and arg_75_1.time_ <= var_78_12 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_14 = arg_75_1:FormatText(StoryNameCfg[367].name)

				arg_75_1.leftNameTxt_.text = var_78_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_15 = arg_75_1:GetWordFromCfg(117101019)
				local var_78_16 = arg_75_1:FormatText(var_78_15.content)

				arg_75_1.text_.text = var_78_16

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_17 = 27
				local var_78_18 = utf8.len(var_78_16)
				local var_78_19 = var_78_17 <= 0 and var_78_13 or var_78_13 * (var_78_18 / var_78_17)

				if var_78_19 > 0 and var_78_13 < var_78_19 then
					arg_75_1.talkMaxDuration = var_78_19

					if var_78_19 + var_78_12 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_19 + var_78_12
					end
				end

				arg_75_1.text_.text = var_78_16
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101019", "story_v_out_117101.awb") ~= 0 then
					local var_78_20 = manager.audio:GetVoiceLength("story_v_out_117101", "117101019", "story_v_out_117101.awb") / 1000

					if var_78_20 + var_78_12 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_20 + var_78_12
					end

					if var_78_15.prefab_name ~= "" and arg_75_1.actors_[var_78_15.prefab_name] ~= nil then
						local var_78_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_15.prefab_name].transform, "story_v_out_117101", "117101019", "story_v_out_117101.awb")

						arg_75_1:RecordAudio("117101019", var_78_21)
						arg_75_1:RecordAudio("117101019", var_78_21)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_117101", "117101019", "story_v_out_117101.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_117101", "117101019", "story_v_out_117101.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_22 = math.max(var_78_13, arg_75_1.talkMaxDuration)

			if var_78_12 <= arg_75_1.time_ and arg_75_1.time_ < var_78_12 + var_78_22 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_12) / var_78_22

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_12 + var_78_22 and arg_75_1.time_ < var_78_12 + var_78_22 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play117101020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 117101020
		arg_79_1.duration_ = 7.4

		local var_79_0 = {
			zh = 6.5,
			ja = 7.4
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
				arg_79_0:Play117101021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1033"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1033 = var_82_0.localPosition
				var_82_0.localScale = Vector3.New(1, 1, 1)

				arg_79_1:CheckSpriteTmpPos("1033", 4)

				local var_82_2 = var_82_0.childCount

				for iter_82_0 = 0, var_82_2 - 1 do
					local var_82_3 = var_82_0:GetChild(iter_82_0)

					if var_82_3.name == "split_4" or not string.find(var_82_3.name, "split") then
						var_82_3.gameObject:SetActive(true)
					else
						var_82_3.gameObject:SetActive(false)
					end
				end
			end

			local var_82_4 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_4 then
				local var_82_5 = (arg_79_1.time_ - var_82_1) / var_82_4
				local var_82_6 = Vector3.New(390, -420, 0)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1033, var_82_6, var_82_5)
			end

			if arg_79_1.time_ >= var_82_1 + var_82_4 and arg_79_1.time_ < var_82_1 + var_82_4 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_82_7 = arg_79_1.actors_["10034"]
			local var_82_8 = 0

			if var_82_8 < arg_79_1.time_ and arg_79_1.time_ <= var_82_8 + arg_82_0 and arg_79_1.var_.actorSpriteComps10034 == nil then
				arg_79_1.var_.actorSpriteComps10034 = var_82_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_9 = 0.2

			if var_82_8 <= arg_79_1.time_ and arg_79_1.time_ < var_82_8 + var_82_9 then
				local var_82_10 = (arg_79_1.time_ - var_82_8) / var_82_9

				if arg_79_1.var_.actorSpriteComps10034 then
					for iter_82_1, iter_82_2 in pairs(arg_79_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_82_2 then
							local var_82_11 = Mathf.Lerp(iter_82_2.color.r, 0.5, var_82_10)

							iter_82_2.color = Color.New(var_82_11, var_82_11, var_82_11)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_8 + var_82_9 and arg_79_1.time_ < var_82_8 + var_82_9 + arg_82_0 and arg_79_1.var_.actorSpriteComps10034 then
				local var_82_12 = 0.5

				for iter_82_3, iter_82_4 in pairs(arg_79_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_82_4 then
						iter_82_4.color = Color.New(var_82_12, var_82_12, var_82_12)
					end
				end

				arg_79_1.var_.actorSpriteComps10034 = nil
			end

			local var_82_13 = arg_79_1.actors_["1033"]
			local var_82_14 = 0

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 and arg_79_1.var_.actorSpriteComps1033 == nil then
				arg_79_1.var_.actorSpriteComps1033 = var_82_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_15 = 0.2

			if var_82_14 <= arg_79_1.time_ and arg_79_1.time_ < var_82_14 + var_82_15 then
				local var_82_16 = (arg_79_1.time_ - var_82_14) / var_82_15

				if arg_79_1.var_.actorSpriteComps1033 then
					for iter_82_5, iter_82_6 in pairs(arg_79_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_82_6 then
							local var_82_17 = Mathf.Lerp(iter_82_6.color.r, 1, var_82_16)

							iter_82_6.color = Color.New(var_82_17, var_82_17, var_82_17)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_14 + var_82_15 and arg_79_1.time_ < var_82_14 + var_82_15 + arg_82_0 and arg_79_1.var_.actorSpriteComps1033 then
				local var_82_18 = 1

				for iter_82_7, iter_82_8 in pairs(arg_79_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_82_8 then
						iter_82_8.color = Color.New(var_82_18, var_82_18, var_82_18)
					end
				end

				arg_79_1.var_.actorSpriteComps1033 = nil
			end

			local var_82_19 = 0
			local var_82_20 = 0.75

			if var_82_19 < arg_79_1.time_ and arg_79_1.time_ <= var_82_19 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_21 = arg_79_1:FormatText(StoryNameCfg[236].name)

				arg_79_1.leftNameTxt_.text = var_82_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_22 = arg_79_1:GetWordFromCfg(117101020)
				local var_82_23 = arg_79_1:FormatText(var_82_22.content)

				arg_79_1.text_.text = var_82_23

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_24 = 30
				local var_82_25 = utf8.len(var_82_23)
				local var_82_26 = var_82_24 <= 0 and var_82_20 or var_82_20 * (var_82_25 / var_82_24)

				if var_82_26 > 0 and var_82_20 < var_82_26 then
					arg_79_1.talkMaxDuration = var_82_26

					if var_82_26 + var_82_19 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_26 + var_82_19
					end
				end

				arg_79_1.text_.text = var_82_23
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101020", "story_v_out_117101.awb") ~= 0 then
					local var_82_27 = manager.audio:GetVoiceLength("story_v_out_117101", "117101020", "story_v_out_117101.awb") / 1000

					if var_82_27 + var_82_19 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_27 + var_82_19
					end

					if var_82_22.prefab_name ~= "" and arg_79_1.actors_[var_82_22.prefab_name] ~= nil then
						local var_82_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_22.prefab_name].transform, "story_v_out_117101", "117101020", "story_v_out_117101.awb")

						arg_79_1:RecordAudio("117101020", var_82_28)
						arg_79_1:RecordAudio("117101020", var_82_28)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_117101", "117101020", "story_v_out_117101.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_117101", "117101020", "story_v_out_117101.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_29 = math.max(var_82_20, arg_79_1.talkMaxDuration)

			if var_82_19 <= arg_79_1.time_ and arg_79_1.time_ < var_82_19 + var_82_29 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_19) / var_82_29

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_19 + var_82_29 and arg_79_1.time_ < var_82_19 + var_82_29 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play117101021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 117101021
		arg_83_1.duration_ = 6.466

		local var_83_0 = {
			zh = 6.466,
			ja = 5.3
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
				arg_83_0:Play117101022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["10034"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos10034 = var_86_0.localPosition
				var_86_0.localScale = Vector3.New(1, 1, 1)

				arg_83_1:CheckSpriteTmpPos("10034", 2)

				local var_86_2 = var_86_0.childCount

				for iter_86_0 = 0, var_86_2 - 1 do
					local var_86_3 = var_86_0:GetChild(iter_86_0)

					if var_86_3.name == "split_5" or not string.find(var_86_3.name, "split") then
						var_86_3.gameObject:SetActive(true)
					else
						var_86_3.gameObject:SetActive(false)
					end
				end
			end

			local var_86_4 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_4 then
				local var_86_5 = (arg_83_1.time_ - var_86_1) / var_86_4
				local var_86_6 = Vector3.New(-390, -415, -290)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos10034, var_86_6, var_86_5)
			end

			if arg_83_1.time_ >= var_86_1 + var_86_4 and arg_83_1.time_ < var_86_1 + var_86_4 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(-390, -415, -290)
			end

			local var_86_7 = arg_83_1.actors_["10034"]
			local var_86_8 = 0

			if var_86_8 < arg_83_1.time_ and arg_83_1.time_ <= var_86_8 + arg_86_0 and arg_83_1.var_.actorSpriteComps10034 == nil then
				arg_83_1.var_.actorSpriteComps10034 = var_86_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_9 = 0.2

			if var_86_8 <= arg_83_1.time_ and arg_83_1.time_ < var_86_8 + var_86_9 then
				local var_86_10 = (arg_83_1.time_ - var_86_8) / var_86_9

				if arg_83_1.var_.actorSpriteComps10034 then
					for iter_86_1, iter_86_2 in pairs(arg_83_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_86_2 then
							local var_86_11 = Mathf.Lerp(iter_86_2.color.r, 1, var_86_10)

							iter_86_2.color = Color.New(var_86_11, var_86_11, var_86_11)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_8 + var_86_9 and arg_83_1.time_ < var_86_8 + var_86_9 + arg_86_0 and arg_83_1.var_.actorSpriteComps10034 then
				local var_86_12 = 1

				for iter_86_3, iter_86_4 in pairs(arg_83_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_86_4 then
						iter_86_4.color = Color.New(var_86_12, var_86_12, var_86_12)
					end
				end

				arg_83_1.var_.actorSpriteComps10034 = nil
			end

			local var_86_13 = arg_83_1.actors_["1033"]
			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 and arg_83_1.var_.actorSpriteComps1033 == nil then
				arg_83_1.var_.actorSpriteComps1033 = var_86_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_15 = 0.2

			if var_86_14 <= arg_83_1.time_ and arg_83_1.time_ < var_86_14 + var_86_15 then
				local var_86_16 = (arg_83_1.time_ - var_86_14) / var_86_15

				if arg_83_1.var_.actorSpriteComps1033 then
					for iter_86_5, iter_86_6 in pairs(arg_83_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_86_6 then
							local var_86_17 = Mathf.Lerp(iter_86_6.color.r, 0.5, var_86_16)

							iter_86_6.color = Color.New(var_86_17, var_86_17, var_86_17)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_14 + var_86_15 and arg_83_1.time_ < var_86_14 + var_86_15 + arg_86_0 and arg_83_1.var_.actorSpriteComps1033 then
				local var_86_18 = 0.5

				for iter_86_7, iter_86_8 in pairs(arg_83_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_86_8 then
						iter_86_8.color = Color.New(var_86_18, var_86_18, var_86_18)
					end
				end

				arg_83_1.var_.actorSpriteComps1033 = nil
			end

			local var_86_19 = 0
			local var_86_20 = 0.7

			if var_86_19 < arg_83_1.time_ and arg_83_1.time_ <= var_86_19 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_21 = arg_83_1:FormatText(StoryNameCfg[367].name)

				arg_83_1.leftNameTxt_.text = var_86_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_22 = arg_83_1:GetWordFromCfg(117101021)
				local var_86_23 = arg_83_1:FormatText(var_86_22.content)

				arg_83_1.text_.text = var_86_23

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_24 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101021", "story_v_out_117101.awb") ~= 0 then
					local var_86_27 = manager.audio:GetVoiceLength("story_v_out_117101", "117101021", "story_v_out_117101.awb") / 1000

					if var_86_27 + var_86_19 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_27 + var_86_19
					end

					if var_86_22.prefab_name ~= "" and arg_83_1.actors_[var_86_22.prefab_name] ~= nil then
						local var_86_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_22.prefab_name].transform, "story_v_out_117101", "117101021", "story_v_out_117101.awb")

						arg_83_1:RecordAudio("117101021", var_86_28)
						arg_83_1:RecordAudio("117101021", var_86_28)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_117101", "117101021", "story_v_out_117101.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_117101", "117101021", "story_v_out_117101.awb")
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
	Play117101022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 117101022
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play117101023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1033"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1033 = var_90_0.localPosition
				var_90_0.localScale = Vector3.New(1, 1, 1)

				arg_87_1:CheckSpriteTmpPos("1033", 4)

				local var_90_2 = var_90_0.childCount

				for iter_90_0 = 0, var_90_2 - 1 do
					local var_90_3 = var_90_0:GetChild(iter_90_0)

					if var_90_3.name == "split_6" or not string.find(var_90_3.name, "split") then
						var_90_3.gameObject:SetActive(true)
					else
						var_90_3.gameObject:SetActive(false)
					end
				end
			end

			local var_90_4 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_4 then
				local var_90_5 = (arg_87_1.time_ - var_90_1) / var_90_4
				local var_90_6 = Vector3.New(390, -420, 0)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1033, var_90_6, var_90_5)
			end

			if arg_87_1.time_ >= var_90_1 + var_90_4 and arg_87_1.time_ < var_90_1 + var_90_4 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_90_7 = arg_87_1.actors_["10034"]
			local var_90_8 = 0

			if var_90_8 < arg_87_1.time_ and arg_87_1.time_ <= var_90_8 + arg_90_0 and arg_87_1.var_.actorSpriteComps10034 == nil then
				arg_87_1.var_.actorSpriteComps10034 = var_90_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_9 = 0.2

			if var_90_8 <= arg_87_1.time_ and arg_87_1.time_ < var_90_8 + var_90_9 then
				local var_90_10 = (arg_87_1.time_ - var_90_8) / var_90_9

				if arg_87_1.var_.actorSpriteComps10034 then
					for iter_90_1, iter_90_2 in pairs(arg_87_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_90_2 then
							local var_90_11 = Mathf.Lerp(iter_90_2.color.r, 0.5, var_90_10)

							iter_90_2.color = Color.New(var_90_11, var_90_11, var_90_11)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_8 + var_90_9 and arg_87_1.time_ < var_90_8 + var_90_9 + arg_90_0 and arg_87_1.var_.actorSpriteComps10034 then
				local var_90_12 = 0.5

				for iter_90_3, iter_90_4 in pairs(arg_87_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_90_4 then
						iter_90_4.color = Color.New(var_90_12, var_90_12, var_90_12)
					end
				end

				arg_87_1.var_.actorSpriteComps10034 = nil
			end

			local var_90_13 = 0
			local var_90_14 = 0.7

			if var_90_13 < arg_87_1.time_ and arg_87_1.time_ <= var_90_13 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, false)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_15 = arg_87_1:GetWordFromCfg(117101022)
				local var_90_16 = arg_87_1:FormatText(var_90_15.content)

				arg_87_1.text_.text = var_90_16

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_17 = 28
				local var_90_18 = utf8.len(var_90_16)
				local var_90_19 = var_90_17 <= 0 and var_90_14 or var_90_14 * (var_90_18 / var_90_17)

				if var_90_19 > 0 and var_90_14 < var_90_19 then
					arg_87_1.talkMaxDuration = var_90_19

					if var_90_19 + var_90_13 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_19 + var_90_13
					end
				end

				arg_87_1.text_.text = var_90_16
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_20 = math.max(var_90_14, arg_87_1.talkMaxDuration)

			if var_90_13 <= arg_87_1.time_ and arg_87_1.time_ < var_90_13 + var_90_20 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_13) / var_90_20

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_13 + var_90_20 and arg_87_1.time_ < var_90_13 + var_90_20 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play117101023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 117101023
		arg_91_1.duration_ = 5.4

		local var_91_0 = {
			zh = 5.4,
			ja = 3.133
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
				arg_91_0:Play117101024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1033"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1033 = var_94_0.localPosition
				var_94_0.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("1033", 4)

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
				local var_94_6 = Vector3.New(390, -420, 0)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1033, var_94_6, var_94_5)
			end

			if arg_91_1.time_ >= var_94_1 + var_94_4 and arg_91_1.time_ < var_94_1 + var_94_4 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_94_7 = arg_91_1.actors_["1033"]
			local var_94_8 = 0

			if var_94_8 < arg_91_1.time_ and arg_91_1.time_ <= var_94_8 + arg_94_0 and arg_91_1.var_.actorSpriteComps1033 == nil then
				arg_91_1.var_.actorSpriteComps1033 = var_94_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_9 = 0.2

			if var_94_8 <= arg_91_1.time_ and arg_91_1.time_ < var_94_8 + var_94_9 then
				local var_94_10 = (arg_91_1.time_ - var_94_8) / var_94_9

				if arg_91_1.var_.actorSpriteComps1033 then
					for iter_94_1, iter_94_2 in pairs(arg_91_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_94_2 then
							local var_94_11 = Mathf.Lerp(iter_94_2.color.r, 1, var_94_10)

							iter_94_2.color = Color.New(var_94_11, var_94_11, var_94_11)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_8 + var_94_9 and arg_91_1.time_ < var_94_8 + var_94_9 + arg_94_0 and arg_91_1.var_.actorSpriteComps1033 then
				local var_94_12 = 1

				for iter_94_3, iter_94_4 in pairs(arg_91_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_94_4 then
						iter_94_4.color = Color.New(var_94_12, var_94_12, var_94_12)
					end
				end

				arg_91_1.var_.actorSpriteComps1033 = nil
			end

			local var_94_13 = 0
			local var_94_14 = 0.725

			if var_94_13 < arg_91_1.time_ and arg_91_1.time_ <= var_94_13 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_15 = arg_91_1:FormatText(StoryNameCfg[236].name)

				arg_91_1.leftNameTxt_.text = var_94_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_16 = arg_91_1:GetWordFromCfg(117101023)
				local var_94_17 = arg_91_1:FormatText(var_94_16.content)

				arg_91_1.text_.text = var_94_17

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_18 = 29
				local var_94_19 = utf8.len(var_94_17)
				local var_94_20 = var_94_18 <= 0 and var_94_14 or var_94_14 * (var_94_19 / var_94_18)

				if var_94_20 > 0 and var_94_14 < var_94_20 then
					arg_91_1.talkMaxDuration = var_94_20

					if var_94_20 + var_94_13 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_20 + var_94_13
					end
				end

				arg_91_1.text_.text = var_94_17
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101023", "story_v_out_117101.awb") ~= 0 then
					local var_94_21 = manager.audio:GetVoiceLength("story_v_out_117101", "117101023", "story_v_out_117101.awb") / 1000

					if var_94_21 + var_94_13 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_21 + var_94_13
					end

					if var_94_16.prefab_name ~= "" and arg_91_1.actors_[var_94_16.prefab_name] ~= nil then
						local var_94_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_16.prefab_name].transform, "story_v_out_117101", "117101023", "story_v_out_117101.awb")

						arg_91_1:RecordAudio("117101023", var_94_22)
						arg_91_1:RecordAudio("117101023", var_94_22)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_117101", "117101023", "story_v_out_117101.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_117101", "117101023", "story_v_out_117101.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_23 = math.max(var_94_14, arg_91_1.talkMaxDuration)

			if var_94_13 <= arg_91_1.time_ and arg_91_1.time_ < var_94_13 + var_94_23 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_13) / var_94_23

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_13 + var_94_23 and arg_91_1.time_ < var_94_13 + var_94_23 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play117101024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 117101024
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play117101025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1033"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.actorSpriteComps1033 == nil then
				arg_95_1.var_.actorSpriteComps1033 = var_98_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_2 = 0.2

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.actorSpriteComps1033 then
					for iter_98_0, iter_98_1 in pairs(arg_95_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_98_1 then
							local var_98_4 = Mathf.Lerp(iter_98_1.color.r, 0.5, var_98_3)

							iter_98_1.color = Color.New(var_98_4, var_98_4, var_98_4)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.actorSpriteComps1033 then
				local var_98_5 = 0.5

				for iter_98_2, iter_98_3 in pairs(arg_95_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_98_3 then
						iter_98_3.color = Color.New(var_98_5, var_98_5, var_98_5)
					end
				end

				arg_95_1.var_.actorSpriteComps1033 = nil
			end

			local var_98_6 = 0
			local var_98_7 = 0.75

			if var_98_6 < arg_95_1.time_ and arg_95_1.time_ <= var_98_6 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_8 = arg_95_1:GetWordFromCfg(117101024)
				local var_98_9 = arg_95_1:FormatText(var_98_8.content)

				arg_95_1.text_.text = var_98_9

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_10 = 30
				local var_98_11 = utf8.len(var_98_9)
				local var_98_12 = var_98_10 <= 0 and var_98_7 or var_98_7 * (var_98_11 / var_98_10)

				if var_98_12 > 0 and var_98_7 < var_98_12 then
					arg_95_1.talkMaxDuration = var_98_12

					if var_98_12 + var_98_6 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_12 + var_98_6
					end
				end

				arg_95_1.text_.text = var_98_9
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_13 = math.max(var_98_7, arg_95_1.talkMaxDuration)

			if var_98_6 <= arg_95_1.time_ and arg_95_1.time_ < var_98_6 + var_98_13 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_6) / var_98_13

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_6 + var_98_13 and arg_95_1.time_ < var_98_6 + var_98_13 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play117101025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 117101025
		arg_99_1.duration_ = 5.566

		local var_99_0 = {
			zh = 3.033,
			ja = 5.566
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
				arg_99_0:Play117101026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1033"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1033 = var_102_0.localPosition
				var_102_0.localScale = Vector3.New(1, 1, 1)

				arg_99_1:CheckSpriteTmpPos("1033", 4)

				local var_102_2 = var_102_0.childCount

				for iter_102_0 = 0, var_102_2 - 1 do
					local var_102_3 = var_102_0:GetChild(iter_102_0)

					if var_102_3.name == "split_6" or not string.find(var_102_3.name, "split") then
						var_102_3.gameObject:SetActive(true)
					else
						var_102_3.gameObject:SetActive(false)
					end
				end
			end

			local var_102_4 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_4 then
				local var_102_5 = (arg_99_1.time_ - var_102_1) / var_102_4
				local var_102_6 = Vector3.New(390, -420, 0)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1033, var_102_6, var_102_5)
			end

			if arg_99_1.time_ >= var_102_1 + var_102_4 and arg_99_1.time_ < var_102_1 + var_102_4 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_102_7 = arg_99_1.actors_["1033"]
			local var_102_8 = 0

			if var_102_8 < arg_99_1.time_ and arg_99_1.time_ <= var_102_8 + arg_102_0 and arg_99_1.var_.actorSpriteComps1033 == nil then
				arg_99_1.var_.actorSpriteComps1033 = var_102_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_9 = 0.2

			if var_102_8 <= arg_99_1.time_ and arg_99_1.time_ < var_102_8 + var_102_9 then
				local var_102_10 = (arg_99_1.time_ - var_102_8) / var_102_9

				if arg_99_1.var_.actorSpriteComps1033 then
					for iter_102_1, iter_102_2 in pairs(arg_99_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_102_2 then
							local var_102_11 = Mathf.Lerp(iter_102_2.color.r, 1, var_102_10)

							iter_102_2.color = Color.New(var_102_11, var_102_11, var_102_11)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_8 + var_102_9 and arg_99_1.time_ < var_102_8 + var_102_9 + arg_102_0 and arg_99_1.var_.actorSpriteComps1033 then
				local var_102_12 = 1

				for iter_102_3, iter_102_4 in pairs(arg_99_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_102_4 then
						iter_102_4.color = Color.New(var_102_12, var_102_12, var_102_12)
					end
				end

				arg_99_1.var_.actorSpriteComps1033 = nil
			end

			local var_102_13 = 0
			local var_102_14 = 0.375

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_15 = arg_99_1:FormatText(StoryNameCfg[236].name)

				arg_99_1.leftNameTxt_.text = var_102_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_16 = arg_99_1:GetWordFromCfg(117101025)
				local var_102_17 = arg_99_1:FormatText(var_102_16.content)

				arg_99_1.text_.text = var_102_17

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_18 = 15
				local var_102_19 = utf8.len(var_102_17)
				local var_102_20 = var_102_18 <= 0 and var_102_14 or var_102_14 * (var_102_19 / var_102_18)

				if var_102_20 > 0 and var_102_14 < var_102_20 then
					arg_99_1.talkMaxDuration = var_102_20

					if var_102_20 + var_102_13 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_20 + var_102_13
					end
				end

				arg_99_1.text_.text = var_102_17
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101025", "story_v_out_117101.awb") ~= 0 then
					local var_102_21 = manager.audio:GetVoiceLength("story_v_out_117101", "117101025", "story_v_out_117101.awb") / 1000

					if var_102_21 + var_102_13 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_21 + var_102_13
					end

					if var_102_16.prefab_name ~= "" and arg_99_1.actors_[var_102_16.prefab_name] ~= nil then
						local var_102_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_16.prefab_name].transform, "story_v_out_117101", "117101025", "story_v_out_117101.awb")

						arg_99_1:RecordAudio("117101025", var_102_22)
						arg_99_1:RecordAudio("117101025", var_102_22)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_117101", "117101025", "story_v_out_117101.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_117101", "117101025", "story_v_out_117101.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_23 = math.max(var_102_14, arg_99_1.talkMaxDuration)

			if var_102_13 <= arg_99_1.time_ and arg_99_1.time_ < var_102_13 + var_102_23 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_13) / var_102_23

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_13 + var_102_23 and arg_99_1.time_ < var_102_13 + var_102_23 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play117101026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 117101026
		arg_103_1.duration_ = 4.833

		local var_103_0 = {
			zh = 2,
			ja = 4.833
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
				arg_103_0:Play117101027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["10034"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos10034 = var_106_0.localPosition
				var_106_0.localScale = Vector3.New(1, 1, 1)

				arg_103_1:CheckSpriteTmpPos("10034", 2)

				local var_106_2 = var_106_0.childCount

				for iter_106_0 = 0, var_106_2 - 1 do
					local var_106_3 = var_106_0:GetChild(iter_106_0)

					if var_106_3.name == "split_2" or not string.find(var_106_3.name, "split") then
						var_106_3.gameObject:SetActive(true)
					else
						var_106_3.gameObject:SetActive(false)
					end
				end
			end

			local var_106_4 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_4 then
				local var_106_5 = (arg_103_1.time_ - var_106_1) / var_106_4
				local var_106_6 = Vector3.New(-390, -415, -290)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos10034, var_106_6, var_106_5)
			end

			if arg_103_1.time_ >= var_106_1 + var_106_4 and arg_103_1.time_ < var_106_1 + var_106_4 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(-390, -415, -290)
			end

			local var_106_7 = arg_103_1.actors_["10034"]
			local var_106_8 = 0

			if var_106_8 < arg_103_1.time_ and arg_103_1.time_ <= var_106_8 + arg_106_0 and arg_103_1.var_.actorSpriteComps10034 == nil then
				arg_103_1.var_.actorSpriteComps10034 = var_106_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_9 = 0.2

			if var_106_8 <= arg_103_1.time_ and arg_103_1.time_ < var_106_8 + var_106_9 then
				local var_106_10 = (arg_103_1.time_ - var_106_8) / var_106_9

				if arg_103_1.var_.actorSpriteComps10034 then
					for iter_106_1, iter_106_2 in pairs(arg_103_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_106_2 then
							local var_106_11 = Mathf.Lerp(iter_106_2.color.r, 1, var_106_10)

							iter_106_2.color = Color.New(var_106_11, var_106_11, var_106_11)
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_8 + var_106_9 and arg_103_1.time_ < var_106_8 + var_106_9 + arg_106_0 and arg_103_1.var_.actorSpriteComps10034 then
				local var_106_12 = 1

				for iter_106_3, iter_106_4 in pairs(arg_103_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_106_4 then
						iter_106_4.color = Color.New(var_106_12, var_106_12, var_106_12)
					end
				end

				arg_103_1.var_.actorSpriteComps10034 = nil
			end

			local var_106_13 = arg_103_1.actors_["1033"]
			local var_106_14 = 0

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 and arg_103_1.var_.actorSpriteComps1033 == nil then
				arg_103_1.var_.actorSpriteComps1033 = var_106_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_15 = 0.2

			if var_106_14 <= arg_103_1.time_ and arg_103_1.time_ < var_106_14 + var_106_15 then
				local var_106_16 = (arg_103_1.time_ - var_106_14) / var_106_15

				if arg_103_1.var_.actorSpriteComps1033 then
					for iter_106_5, iter_106_6 in pairs(arg_103_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_106_6 then
							local var_106_17 = Mathf.Lerp(iter_106_6.color.r, 0.5, var_106_16)

							iter_106_6.color = Color.New(var_106_17, var_106_17, var_106_17)
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_14 + var_106_15 and arg_103_1.time_ < var_106_14 + var_106_15 + arg_106_0 and arg_103_1.var_.actorSpriteComps1033 then
				local var_106_18 = 0.5

				for iter_106_7, iter_106_8 in pairs(arg_103_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_106_8 then
						iter_106_8.color = Color.New(var_106_18, var_106_18, var_106_18)
					end
				end

				arg_103_1.var_.actorSpriteComps1033 = nil
			end

			local var_106_19 = 0
			local var_106_20 = 0.225

			if var_106_19 < arg_103_1.time_ and arg_103_1.time_ <= var_106_19 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_21 = arg_103_1:FormatText(StoryNameCfg[367].name)

				arg_103_1.leftNameTxt_.text = var_106_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_22 = arg_103_1:GetWordFromCfg(117101026)
				local var_106_23 = arg_103_1:FormatText(var_106_22.content)

				arg_103_1.text_.text = var_106_23

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_24 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101026", "story_v_out_117101.awb") ~= 0 then
					local var_106_27 = manager.audio:GetVoiceLength("story_v_out_117101", "117101026", "story_v_out_117101.awb") / 1000

					if var_106_27 + var_106_19 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_27 + var_106_19
					end

					if var_106_22.prefab_name ~= "" and arg_103_1.actors_[var_106_22.prefab_name] ~= nil then
						local var_106_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_22.prefab_name].transform, "story_v_out_117101", "117101026", "story_v_out_117101.awb")

						arg_103_1:RecordAudio("117101026", var_106_28)
						arg_103_1:RecordAudio("117101026", var_106_28)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_117101", "117101026", "story_v_out_117101.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_117101", "117101026", "story_v_out_117101.awb")
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
	Play117101027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 117101027
		arg_107_1.duration_ = 6.033

		local var_107_0 = {
			zh = 5.366,
			ja = 6.033
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
				arg_107_0:Play117101028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["10034"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.actorSpriteComps10034 == nil then
				arg_107_1.var_.actorSpriteComps10034 = var_110_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_2 = 0.2

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.actorSpriteComps10034 then
					for iter_110_0, iter_110_1 in pairs(arg_107_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_110_1 then
							local var_110_4 = Mathf.Lerp(iter_110_1.color.r, 0.5, var_110_3)

							iter_110_1.color = Color.New(var_110_4, var_110_4, var_110_4)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.actorSpriteComps10034 then
				local var_110_5 = 0.5

				for iter_110_2, iter_110_3 in pairs(arg_107_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_110_3 then
						iter_110_3.color = Color.New(var_110_5, var_110_5, var_110_5)
					end
				end

				arg_107_1.var_.actorSpriteComps10034 = nil
			end

			local var_110_6 = arg_107_1.actors_["1033"]
			local var_110_7 = 0

			if var_110_7 < arg_107_1.time_ and arg_107_1.time_ <= var_110_7 + arg_110_0 and arg_107_1.var_.actorSpriteComps1033 == nil then
				arg_107_1.var_.actorSpriteComps1033 = var_110_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_8 = 0.2

			if var_110_7 <= arg_107_1.time_ and arg_107_1.time_ < var_110_7 + var_110_8 then
				local var_110_9 = (arg_107_1.time_ - var_110_7) / var_110_8

				if arg_107_1.var_.actorSpriteComps1033 then
					for iter_110_4, iter_110_5 in pairs(arg_107_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_110_5 then
							local var_110_10 = Mathf.Lerp(iter_110_5.color.r, 1, var_110_9)

							iter_110_5.color = Color.New(var_110_10, var_110_10, var_110_10)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_7 + var_110_8 and arg_107_1.time_ < var_110_7 + var_110_8 + arg_110_0 and arg_107_1.var_.actorSpriteComps1033 then
				local var_110_11 = 1

				for iter_110_6, iter_110_7 in pairs(arg_107_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_110_7 then
						iter_110_7.color = Color.New(var_110_11, var_110_11, var_110_11)
					end
				end

				arg_107_1.var_.actorSpriteComps1033 = nil
			end

			local var_110_12 = 0
			local var_110_13 = 0.8

			if var_110_12 < arg_107_1.time_ and arg_107_1.time_ <= var_110_12 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_14 = arg_107_1:FormatText(StoryNameCfg[236].name)

				arg_107_1.leftNameTxt_.text = var_110_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_15 = arg_107_1:GetWordFromCfg(117101027)
				local var_110_16 = arg_107_1:FormatText(var_110_15.content)

				arg_107_1.text_.text = var_110_16

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_17 = 32
				local var_110_18 = utf8.len(var_110_16)
				local var_110_19 = var_110_17 <= 0 and var_110_13 or var_110_13 * (var_110_18 / var_110_17)

				if var_110_19 > 0 and var_110_13 < var_110_19 then
					arg_107_1.talkMaxDuration = var_110_19

					if var_110_19 + var_110_12 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_19 + var_110_12
					end
				end

				arg_107_1.text_.text = var_110_16
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101027", "story_v_out_117101.awb") ~= 0 then
					local var_110_20 = manager.audio:GetVoiceLength("story_v_out_117101", "117101027", "story_v_out_117101.awb") / 1000

					if var_110_20 + var_110_12 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_20 + var_110_12
					end

					if var_110_15.prefab_name ~= "" and arg_107_1.actors_[var_110_15.prefab_name] ~= nil then
						local var_110_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_15.prefab_name].transform, "story_v_out_117101", "117101027", "story_v_out_117101.awb")

						arg_107_1:RecordAudio("117101027", var_110_21)
						arg_107_1:RecordAudio("117101027", var_110_21)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_117101", "117101027", "story_v_out_117101.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_117101", "117101027", "story_v_out_117101.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_22 = math.max(var_110_13, arg_107_1.talkMaxDuration)

			if var_110_12 <= arg_107_1.time_ and arg_107_1.time_ < var_110_12 + var_110_22 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_12) / var_110_22

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_12 + var_110_22 and arg_107_1.time_ < var_110_12 + var_110_22 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play117101028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 117101028
		arg_111_1.duration_ = 1.5

		local var_111_0 = {
			zh = 1.5,
			ja = 1.2
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
				arg_111_0:Play117101029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["10034"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.actorSpriteComps10034 == nil then
				arg_111_1.var_.actorSpriteComps10034 = var_114_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_2 = 0.2

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.actorSpriteComps10034 then
					for iter_114_0, iter_114_1 in pairs(arg_111_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_114_1 then
							local var_114_4 = Mathf.Lerp(iter_114_1.color.r, 1, var_114_3)

							iter_114_1.color = Color.New(var_114_4, var_114_4, var_114_4)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.actorSpriteComps10034 then
				local var_114_5 = 1

				for iter_114_2, iter_114_3 in pairs(arg_111_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_114_3 then
						iter_114_3.color = Color.New(var_114_5, var_114_5, var_114_5)
					end
				end

				arg_111_1.var_.actorSpriteComps10034 = nil
			end

			local var_114_6 = arg_111_1.actors_["1033"]
			local var_114_7 = 0

			if var_114_7 < arg_111_1.time_ and arg_111_1.time_ <= var_114_7 + arg_114_0 and arg_111_1.var_.actorSpriteComps1033 == nil then
				arg_111_1.var_.actorSpriteComps1033 = var_114_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_8 = 0.2

			if var_114_7 <= arg_111_1.time_ and arg_111_1.time_ < var_114_7 + var_114_8 then
				local var_114_9 = (arg_111_1.time_ - var_114_7) / var_114_8

				if arg_111_1.var_.actorSpriteComps1033 then
					for iter_114_4, iter_114_5 in pairs(arg_111_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_114_5 then
							local var_114_10 = Mathf.Lerp(iter_114_5.color.r, 0.5, var_114_9)

							iter_114_5.color = Color.New(var_114_10, var_114_10, var_114_10)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_7 + var_114_8 and arg_111_1.time_ < var_114_7 + var_114_8 + arg_114_0 and arg_111_1.var_.actorSpriteComps1033 then
				local var_114_11 = 0.5

				for iter_114_6, iter_114_7 in pairs(arg_111_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_114_7 then
						iter_114_7.color = Color.New(var_114_11, var_114_11, var_114_11)
					end
				end

				arg_111_1.var_.actorSpriteComps1033 = nil
			end

			local var_114_12 = 0
			local var_114_13 = 0.075

			if var_114_12 < arg_111_1.time_ and arg_111_1.time_ <= var_114_12 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_14 = arg_111_1:FormatText(StoryNameCfg[367].name)

				arg_111_1.leftNameTxt_.text = var_114_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_15 = arg_111_1:GetWordFromCfg(117101028)
				local var_114_16 = arg_111_1:FormatText(var_114_15.content)

				arg_111_1.text_.text = var_114_16

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_17 = 3
				local var_114_18 = utf8.len(var_114_16)
				local var_114_19 = var_114_17 <= 0 and var_114_13 or var_114_13 * (var_114_18 / var_114_17)

				if var_114_19 > 0 and var_114_13 < var_114_19 then
					arg_111_1.talkMaxDuration = var_114_19

					if var_114_19 + var_114_12 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_19 + var_114_12
					end
				end

				arg_111_1.text_.text = var_114_16
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101028", "story_v_out_117101.awb") ~= 0 then
					local var_114_20 = manager.audio:GetVoiceLength("story_v_out_117101", "117101028", "story_v_out_117101.awb") / 1000

					if var_114_20 + var_114_12 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_20 + var_114_12
					end

					if var_114_15.prefab_name ~= "" and arg_111_1.actors_[var_114_15.prefab_name] ~= nil then
						local var_114_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_15.prefab_name].transform, "story_v_out_117101", "117101028", "story_v_out_117101.awb")

						arg_111_1:RecordAudio("117101028", var_114_21)
						arg_111_1:RecordAudio("117101028", var_114_21)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_117101", "117101028", "story_v_out_117101.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_117101", "117101028", "story_v_out_117101.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_22 = math.max(var_114_13, arg_111_1.talkMaxDuration)

			if var_114_12 <= arg_111_1.time_ and arg_111_1.time_ < var_114_12 + var_114_22 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_12) / var_114_22

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_12 + var_114_22 and arg_111_1.time_ < var_114_12 + var_114_22 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play117101029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 117101029
		arg_115_1.duration_ = 9.6

		local var_115_0 = {
			zh = 9.033,
			ja = 9.6
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
				arg_115_0:Play117101030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1033"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.actorSpriteComps1033 == nil then
				arg_115_1.var_.actorSpriteComps1033 = var_118_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_2 = 0.2

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.actorSpriteComps1033 then
					for iter_118_0, iter_118_1 in pairs(arg_115_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_118_1 then
							local var_118_4 = Mathf.Lerp(iter_118_1.color.r, 1, var_118_3)

							iter_118_1.color = Color.New(var_118_4, var_118_4, var_118_4)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.actorSpriteComps1033 then
				local var_118_5 = 1

				for iter_118_2, iter_118_3 in pairs(arg_115_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_118_3 then
						iter_118_3.color = Color.New(var_118_5, var_118_5, var_118_5)
					end
				end

				arg_115_1.var_.actorSpriteComps1033 = nil
			end

			local var_118_6 = arg_115_1.actors_["10034"]
			local var_118_7 = 0

			if var_118_7 < arg_115_1.time_ and arg_115_1.time_ <= var_118_7 + arg_118_0 and arg_115_1.var_.actorSpriteComps10034 == nil then
				arg_115_1.var_.actorSpriteComps10034 = var_118_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_8 = 0.2

			if var_118_7 <= arg_115_1.time_ and arg_115_1.time_ < var_118_7 + var_118_8 then
				local var_118_9 = (arg_115_1.time_ - var_118_7) / var_118_8

				if arg_115_1.var_.actorSpriteComps10034 then
					for iter_118_4, iter_118_5 in pairs(arg_115_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_118_5 then
							local var_118_10 = Mathf.Lerp(iter_118_5.color.r, 0.5, var_118_9)

							iter_118_5.color = Color.New(var_118_10, var_118_10, var_118_10)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_7 + var_118_8 and arg_115_1.time_ < var_118_7 + var_118_8 + arg_118_0 and arg_115_1.var_.actorSpriteComps10034 then
				local var_118_11 = 0.5

				for iter_118_6, iter_118_7 in pairs(arg_115_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_118_7 then
						iter_118_7.color = Color.New(var_118_11, var_118_11, var_118_11)
					end
				end

				arg_115_1.var_.actorSpriteComps10034 = nil
			end

			local var_118_12 = 0
			local var_118_13 = 1

			if var_118_12 < arg_115_1.time_ and arg_115_1.time_ <= var_118_12 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_14 = arg_115_1:FormatText(StoryNameCfg[236].name)

				arg_115_1.leftNameTxt_.text = var_118_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_15 = arg_115_1:GetWordFromCfg(117101029)
				local var_118_16 = arg_115_1:FormatText(var_118_15.content)

				arg_115_1.text_.text = var_118_16

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_17 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101029", "story_v_out_117101.awb") ~= 0 then
					local var_118_20 = manager.audio:GetVoiceLength("story_v_out_117101", "117101029", "story_v_out_117101.awb") / 1000

					if var_118_20 + var_118_12 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_20 + var_118_12
					end

					if var_118_15.prefab_name ~= "" and arg_115_1.actors_[var_118_15.prefab_name] ~= nil then
						local var_118_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_15.prefab_name].transform, "story_v_out_117101", "117101029", "story_v_out_117101.awb")

						arg_115_1:RecordAudio("117101029", var_118_21)
						arg_115_1:RecordAudio("117101029", var_118_21)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_117101", "117101029", "story_v_out_117101.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_117101", "117101029", "story_v_out_117101.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_22 = math.max(var_118_13, arg_115_1.talkMaxDuration)

			if var_118_12 <= arg_115_1.time_ and arg_115_1.time_ < var_118_12 + var_118_22 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_12) / var_118_22

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_12 + var_118_22 and arg_115_1.time_ < var_118_12 + var_118_22 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play117101030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 117101030
		arg_119_1.duration_ = 7.733

		local var_119_0 = {
			zh = 7.733,
			ja = 5.866
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
				arg_119_0:Play117101031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1033"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.actorSpriteComps1033 == nil then
				arg_119_1.var_.actorSpriteComps1033 = var_122_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_2 = 0.2

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.actorSpriteComps1033 then
					for iter_122_0, iter_122_1 in pairs(arg_119_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_122_1 then
							local var_122_4 = Mathf.Lerp(iter_122_1.color.r, 0.5, var_122_3)

							iter_122_1.color = Color.New(var_122_4, var_122_4, var_122_4)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.actorSpriteComps1033 then
				local var_122_5 = 0.5

				for iter_122_2, iter_122_3 in pairs(arg_119_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_122_3 then
						iter_122_3.color = Color.New(var_122_5, var_122_5, var_122_5)
					end
				end

				arg_119_1.var_.actorSpriteComps1033 = nil
			end

			local var_122_6 = arg_119_1.actors_["10034"]
			local var_122_7 = 0

			if var_122_7 < arg_119_1.time_ and arg_119_1.time_ <= var_122_7 + arg_122_0 and arg_119_1.var_.actorSpriteComps10034 == nil then
				arg_119_1.var_.actorSpriteComps10034 = var_122_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_8 = 0.2

			if var_122_7 <= arg_119_1.time_ and arg_119_1.time_ < var_122_7 + var_122_8 then
				local var_122_9 = (arg_119_1.time_ - var_122_7) / var_122_8

				if arg_119_1.var_.actorSpriteComps10034 then
					for iter_122_4, iter_122_5 in pairs(arg_119_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_122_5 then
							local var_122_10 = Mathf.Lerp(iter_122_5.color.r, 1, var_122_9)

							iter_122_5.color = Color.New(var_122_10, var_122_10, var_122_10)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_7 + var_122_8 and arg_119_1.time_ < var_122_7 + var_122_8 + arg_122_0 and arg_119_1.var_.actorSpriteComps10034 then
				local var_122_11 = 1

				for iter_122_6, iter_122_7 in pairs(arg_119_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_122_7 then
						iter_122_7.color = Color.New(var_122_11, var_122_11, var_122_11)
					end
				end

				arg_119_1.var_.actorSpriteComps10034 = nil
			end

			local var_122_12 = 0
			local var_122_13 = 0.575

			if var_122_12 < arg_119_1.time_ and arg_119_1.time_ <= var_122_12 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_14 = arg_119_1:FormatText(StoryNameCfg[367].name)

				arg_119_1.leftNameTxt_.text = var_122_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_15 = arg_119_1:GetWordFromCfg(117101030)
				local var_122_16 = arg_119_1:FormatText(var_122_15.content)

				arg_119_1.text_.text = var_122_16

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_17 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101030", "story_v_out_117101.awb") ~= 0 then
					local var_122_20 = manager.audio:GetVoiceLength("story_v_out_117101", "117101030", "story_v_out_117101.awb") / 1000

					if var_122_20 + var_122_12 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_20 + var_122_12
					end

					if var_122_15.prefab_name ~= "" and arg_119_1.actors_[var_122_15.prefab_name] ~= nil then
						local var_122_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_15.prefab_name].transform, "story_v_out_117101", "117101030", "story_v_out_117101.awb")

						arg_119_1:RecordAudio("117101030", var_122_21)
						arg_119_1:RecordAudio("117101030", var_122_21)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_117101", "117101030", "story_v_out_117101.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_117101", "117101030", "story_v_out_117101.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_22 = math.max(var_122_13, arg_119_1.talkMaxDuration)

			if var_122_12 <= arg_119_1.time_ and arg_119_1.time_ < var_122_12 + var_122_22 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_12) / var_122_22

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_12 + var_122_22 and arg_119_1.time_ < var_122_12 + var_122_22 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play117101031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 117101031
		arg_123_1.duration_ = 2.066

		local var_123_0 = {
			zh = 1.233,
			ja = 2.066
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
				arg_123_0:Play117101032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["10034"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.actorSpriteComps10034 == nil then
				arg_123_1.var_.actorSpriteComps10034 = var_126_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_2 = 0.2

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.actorSpriteComps10034 then
					for iter_126_0, iter_126_1 in pairs(arg_123_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_126_1 then
							local var_126_4 = Mathf.Lerp(iter_126_1.color.r, 0.5, var_126_3)

							iter_126_1.color = Color.New(var_126_4, var_126_4, var_126_4)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.actorSpriteComps10034 then
				local var_126_5 = 0.5

				for iter_126_2, iter_126_3 in pairs(arg_123_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_126_3 then
						iter_126_3.color = Color.New(var_126_5, var_126_5, var_126_5)
					end
				end

				arg_123_1.var_.actorSpriteComps10034 = nil
			end

			local var_126_6 = 0
			local var_126_7 = 0.1

			if var_126_6 < arg_123_1.time_ and arg_123_1.time_ <= var_126_6 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_8 = arg_123_1:FormatText(StoryNameCfg[369].name)

				arg_123_1.leftNameTxt_.text = var_126_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, true)
				arg_123_1.iconController_:SetSelectedState("hero")

				arg_123_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10035_split_1")

				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_9 = arg_123_1:GetWordFromCfg(117101031)
				local var_126_10 = arg_123_1:FormatText(var_126_9.content)

				arg_123_1.text_.text = var_126_10

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_11 = 4
				local var_126_12 = utf8.len(var_126_10)
				local var_126_13 = var_126_11 <= 0 and var_126_7 or var_126_7 * (var_126_12 / var_126_11)

				if var_126_13 > 0 and var_126_7 < var_126_13 then
					arg_123_1.talkMaxDuration = var_126_13

					if var_126_13 + var_126_6 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_13 + var_126_6
					end
				end

				arg_123_1.text_.text = var_126_10
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101031", "story_v_out_117101.awb") ~= 0 then
					local var_126_14 = manager.audio:GetVoiceLength("story_v_out_117101", "117101031", "story_v_out_117101.awb") / 1000

					if var_126_14 + var_126_6 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_14 + var_126_6
					end

					if var_126_9.prefab_name ~= "" and arg_123_1.actors_[var_126_9.prefab_name] ~= nil then
						local var_126_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_9.prefab_name].transform, "story_v_out_117101", "117101031", "story_v_out_117101.awb")

						arg_123_1:RecordAudio("117101031", var_126_15)
						arg_123_1:RecordAudio("117101031", var_126_15)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_117101", "117101031", "story_v_out_117101.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_117101", "117101031", "story_v_out_117101.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_16 = math.max(var_126_7, arg_123_1.talkMaxDuration)

			if var_126_6 <= arg_123_1.time_ and arg_123_1.time_ < var_126_6 + var_126_16 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_6) / var_126_16

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_6 + var_126_16 and arg_123_1.time_ < var_126_6 + var_126_16 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play117101032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 117101032
		arg_127_1.duration_ = 5

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play117101033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.35

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

				local var_130_2 = arg_127_1:GetWordFromCfg(117101032)
				local var_130_3 = arg_127_1:FormatText(var_130_2.content)

				arg_127_1.text_.text = var_130_3

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_4 = 14
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
	Play117101033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 117101033
		arg_131_1.duration_ = 5.833

		local var_131_0 = {
			zh = 5.833,
			ja = 5.6
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
				arg_131_0:Play117101034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["10034"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos10034 = var_134_0.localPosition
				var_134_0.localScale = Vector3.New(1, 1, 1)

				arg_131_1:CheckSpriteTmpPos("10034", 2)

				local var_134_2 = var_134_0.childCount

				for iter_134_0 = 0, var_134_2 - 1 do
					local var_134_3 = var_134_0:GetChild(iter_134_0)

					if var_134_3.name == "split_2" or not string.find(var_134_3.name, "split") then
						var_134_3.gameObject:SetActive(true)
					else
						var_134_3.gameObject:SetActive(false)
					end
				end
			end

			local var_134_4 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_4 then
				local var_134_5 = (arg_131_1.time_ - var_134_1) / var_134_4
				local var_134_6 = Vector3.New(-390, -415, -290)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10034, var_134_6, var_134_5)
			end

			if arg_131_1.time_ >= var_134_1 + var_134_4 and arg_131_1.time_ < var_134_1 + var_134_4 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(-390, -415, -290)
			end

			local var_134_7 = arg_131_1.actors_["10034"]
			local var_134_8 = 0

			if var_134_8 < arg_131_1.time_ and arg_131_1.time_ <= var_134_8 + arg_134_0 and arg_131_1.var_.actorSpriteComps10034 == nil then
				arg_131_1.var_.actorSpriteComps10034 = var_134_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_134_9 = 0.2

			if var_134_8 <= arg_131_1.time_ and arg_131_1.time_ < var_134_8 + var_134_9 then
				local var_134_10 = (arg_131_1.time_ - var_134_8) / var_134_9

				if arg_131_1.var_.actorSpriteComps10034 then
					for iter_134_1, iter_134_2 in pairs(arg_131_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_134_2 then
							local var_134_11 = Mathf.Lerp(iter_134_2.color.r, 1, var_134_10)

							iter_134_2.color = Color.New(var_134_11, var_134_11, var_134_11)
						end
					end
				end
			end

			if arg_131_1.time_ >= var_134_8 + var_134_9 and arg_131_1.time_ < var_134_8 + var_134_9 + arg_134_0 and arg_131_1.var_.actorSpriteComps10034 then
				local var_134_12 = 1

				for iter_134_3, iter_134_4 in pairs(arg_131_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_134_4 then
						iter_134_4.color = Color.New(var_134_12, var_134_12, var_134_12)
					end
				end

				arg_131_1.var_.actorSpriteComps10034 = nil
			end

			local var_134_13 = 0
			local var_134_14 = 0.45

			if var_134_13 < arg_131_1.time_ and arg_131_1.time_ <= var_134_13 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_15 = arg_131_1:FormatText(StoryNameCfg[367].name)

				arg_131_1.leftNameTxt_.text = var_134_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_16 = arg_131_1:GetWordFromCfg(117101033)
				local var_134_17 = arg_131_1:FormatText(var_134_16.content)

				arg_131_1.text_.text = var_134_17

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_18 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101033", "story_v_out_117101.awb") ~= 0 then
					local var_134_21 = manager.audio:GetVoiceLength("story_v_out_117101", "117101033", "story_v_out_117101.awb") / 1000

					if var_134_21 + var_134_13 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_21 + var_134_13
					end

					if var_134_16.prefab_name ~= "" and arg_131_1.actors_[var_134_16.prefab_name] ~= nil then
						local var_134_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_16.prefab_name].transform, "story_v_out_117101", "117101033", "story_v_out_117101.awb")

						arg_131_1:RecordAudio("117101033", var_134_22)
						arg_131_1:RecordAudio("117101033", var_134_22)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_117101", "117101033", "story_v_out_117101.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_117101", "117101033", "story_v_out_117101.awb")
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
	Play117101034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 117101034
		arg_135_1.duration_ = 7.033

		local var_135_0 = {
			zh = 7.033,
			ja = 6.533
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
				arg_135_0:Play117101035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1033"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos1033 = var_138_0.localPosition
				var_138_0.localScale = Vector3.New(1, 1, 1)

				arg_135_1:CheckSpriteTmpPos("1033", 4)

				local var_138_2 = var_138_0.childCount

				for iter_138_0 = 0, var_138_2 - 1 do
					local var_138_3 = var_138_0:GetChild(iter_138_0)

					if var_138_3.name == "split_6" or not string.find(var_138_3.name, "split") then
						var_138_3.gameObject:SetActive(true)
					else
						var_138_3.gameObject:SetActive(false)
					end
				end
			end

			local var_138_4 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_4 then
				local var_138_5 = (arg_135_1.time_ - var_138_1) / var_138_4
				local var_138_6 = Vector3.New(390, -420, 0)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1033, var_138_6, var_138_5)
			end

			if arg_135_1.time_ >= var_138_1 + var_138_4 and arg_135_1.time_ < var_138_1 + var_138_4 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_138_7 = arg_135_1.actors_["10034"]
			local var_138_8 = 0

			if var_138_8 < arg_135_1.time_ and arg_135_1.time_ <= var_138_8 + arg_138_0 and arg_135_1.var_.actorSpriteComps10034 == nil then
				arg_135_1.var_.actorSpriteComps10034 = var_138_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_138_9 = 0.2

			if var_138_8 <= arg_135_1.time_ and arg_135_1.time_ < var_138_8 + var_138_9 then
				local var_138_10 = (arg_135_1.time_ - var_138_8) / var_138_9

				if arg_135_1.var_.actorSpriteComps10034 then
					for iter_138_1, iter_138_2 in pairs(arg_135_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_138_2 then
							local var_138_11 = Mathf.Lerp(iter_138_2.color.r, 0.5, var_138_10)

							iter_138_2.color = Color.New(var_138_11, var_138_11, var_138_11)
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_8 + var_138_9 and arg_135_1.time_ < var_138_8 + var_138_9 + arg_138_0 and arg_135_1.var_.actorSpriteComps10034 then
				local var_138_12 = 0.5

				for iter_138_3, iter_138_4 in pairs(arg_135_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_138_4 then
						iter_138_4.color = Color.New(var_138_12, var_138_12, var_138_12)
					end
				end

				arg_135_1.var_.actorSpriteComps10034 = nil
			end

			local var_138_13 = arg_135_1.actors_["1033"]
			local var_138_14 = 0

			if var_138_14 < arg_135_1.time_ and arg_135_1.time_ <= var_138_14 + arg_138_0 and arg_135_1.var_.actorSpriteComps1033 == nil then
				arg_135_1.var_.actorSpriteComps1033 = var_138_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_138_15 = 0.2

			if var_138_14 <= arg_135_1.time_ and arg_135_1.time_ < var_138_14 + var_138_15 then
				local var_138_16 = (arg_135_1.time_ - var_138_14) / var_138_15

				if arg_135_1.var_.actorSpriteComps1033 then
					for iter_138_5, iter_138_6 in pairs(arg_135_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_138_6 then
							local var_138_17 = Mathf.Lerp(iter_138_6.color.r, 1, var_138_16)

							iter_138_6.color = Color.New(var_138_17, var_138_17, var_138_17)
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_14 + var_138_15 and arg_135_1.time_ < var_138_14 + var_138_15 + arg_138_0 and arg_135_1.var_.actorSpriteComps1033 then
				local var_138_18 = 1

				for iter_138_7, iter_138_8 in pairs(arg_135_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_138_8 then
						iter_138_8.color = Color.New(var_138_18, var_138_18, var_138_18)
					end
				end

				arg_135_1.var_.actorSpriteComps1033 = nil
			end

			local var_138_19 = 0
			local var_138_20 = 0.875

			if var_138_19 < arg_135_1.time_ and arg_135_1.time_ <= var_138_19 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_21 = arg_135_1:FormatText(StoryNameCfg[236].name)

				arg_135_1.leftNameTxt_.text = var_138_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_22 = arg_135_1:GetWordFromCfg(117101034)
				local var_138_23 = arg_135_1:FormatText(var_138_22.content)

				arg_135_1.text_.text = var_138_23

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_24 = 35
				local var_138_25 = utf8.len(var_138_23)
				local var_138_26 = var_138_24 <= 0 and var_138_20 or var_138_20 * (var_138_25 / var_138_24)

				if var_138_26 > 0 and var_138_20 < var_138_26 then
					arg_135_1.talkMaxDuration = var_138_26

					if var_138_26 + var_138_19 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_26 + var_138_19
					end
				end

				arg_135_1.text_.text = var_138_23
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101034", "story_v_out_117101.awb") ~= 0 then
					local var_138_27 = manager.audio:GetVoiceLength("story_v_out_117101", "117101034", "story_v_out_117101.awb") / 1000

					if var_138_27 + var_138_19 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_27 + var_138_19
					end

					if var_138_22.prefab_name ~= "" and arg_135_1.actors_[var_138_22.prefab_name] ~= nil then
						local var_138_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_22.prefab_name].transform, "story_v_out_117101", "117101034", "story_v_out_117101.awb")

						arg_135_1:RecordAudio("117101034", var_138_28)
						arg_135_1:RecordAudio("117101034", var_138_28)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_117101", "117101034", "story_v_out_117101.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_117101", "117101034", "story_v_out_117101.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_29 = math.max(var_138_20, arg_135_1.talkMaxDuration)

			if var_138_19 <= arg_135_1.time_ and arg_135_1.time_ < var_138_19 + var_138_29 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_19) / var_138_29

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_19 + var_138_29 and arg_135_1.time_ < var_138_19 + var_138_29 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play117101035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 117101035
		arg_139_1.duration_ = 12.2

		local var_139_0 = {
			zh = 8.166,
			ja = 12.2
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
				arg_139_0:Play117101036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1033"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.actorSpriteComps1033 == nil then
				arg_139_1.var_.actorSpriteComps1033 = var_142_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_142_2 = 0.2

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.actorSpriteComps1033 then
					for iter_142_0, iter_142_1 in pairs(arg_139_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_142_1 then
							local var_142_4 = Mathf.Lerp(iter_142_1.color.r, 0.5, var_142_3)

							iter_142_1.color = Color.New(var_142_4, var_142_4, var_142_4)
						end
					end
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.actorSpriteComps1033 then
				local var_142_5 = 0.5

				for iter_142_2, iter_142_3 in pairs(arg_139_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_142_3 then
						iter_142_3.color = Color.New(var_142_5, var_142_5, var_142_5)
					end
				end

				arg_139_1.var_.actorSpriteComps1033 = nil
			end

			local var_142_6 = 0
			local var_142_7 = 1.025

			if var_142_6 < arg_139_1.time_ and arg_139_1.time_ <= var_142_6 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_8 = arg_139_1:FormatText(StoryNameCfg[369].name)

				arg_139_1.leftNameTxt_.text = var_142_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, true)
				arg_139_1.iconController_:SetSelectedState("hero")

				arg_139_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10035_split_1")

				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_9 = arg_139_1:GetWordFromCfg(117101035)
				local var_142_10 = arg_139_1:FormatText(var_142_9.content)

				arg_139_1.text_.text = var_142_10

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_11 = 41
				local var_142_12 = utf8.len(var_142_10)
				local var_142_13 = var_142_11 <= 0 and var_142_7 or var_142_7 * (var_142_12 / var_142_11)

				if var_142_13 > 0 and var_142_7 < var_142_13 then
					arg_139_1.talkMaxDuration = var_142_13

					if var_142_13 + var_142_6 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_13 + var_142_6
					end
				end

				arg_139_1.text_.text = var_142_10
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101035", "story_v_out_117101.awb") ~= 0 then
					local var_142_14 = manager.audio:GetVoiceLength("story_v_out_117101", "117101035", "story_v_out_117101.awb") / 1000

					if var_142_14 + var_142_6 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_14 + var_142_6
					end

					if var_142_9.prefab_name ~= "" and arg_139_1.actors_[var_142_9.prefab_name] ~= nil then
						local var_142_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_9.prefab_name].transform, "story_v_out_117101", "117101035", "story_v_out_117101.awb")

						arg_139_1:RecordAudio("117101035", var_142_15)
						arg_139_1:RecordAudio("117101035", var_142_15)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_117101", "117101035", "story_v_out_117101.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_117101", "117101035", "story_v_out_117101.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_16 = math.max(var_142_7, arg_139_1.talkMaxDuration)

			if var_142_6 <= arg_139_1.time_ and arg_139_1.time_ < var_142_6 + var_142_16 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_6) / var_142_16

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_6 + var_142_16 and arg_139_1.time_ < var_142_6 + var_142_16 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play117101036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 117101036
		arg_143_1.duration_ = 1.7

		local var_143_0 = {
			zh = 1.333,
			ja = 1.7
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
				arg_143_0:Play117101037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1033"].transform
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.var_.moveOldPos1033 = var_146_0.localPosition
				var_146_0.localScale = Vector3.New(1, 1, 1)

				arg_143_1:CheckSpriteTmpPos("1033", 4)

				local var_146_2 = var_146_0.childCount

				for iter_146_0 = 0, var_146_2 - 1 do
					local var_146_3 = var_146_0:GetChild(iter_146_0)

					if var_146_3.name == "split_4" or not string.find(var_146_3.name, "split") then
						var_146_3.gameObject:SetActive(true)
					else
						var_146_3.gameObject:SetActive(false)
					end
				end
			end

			local var_146_4 = 0.001

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_4 then
				local var_146_5 = (arg_143_1.time_ - var_146_1) / var_146_4
				local var_146_6 = Vector3.New(390, -420, 0)

				var_146_0.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1033, var_146_6, var_146_5)
			end

			if arg_143_1.time_ >= var_146_1 + var_146_4 and arg_143_1.time_ < var_146_1 + var_146_4 + arg_146_0 then
				var_146_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_146_7 = arg_143_1.actors_["10034"].transform
			local var_146_8 = 0

			if var_146_8 < arg_143_1.time_ and arg_143_1.time_ <= var_146_8 + arg_146_0 then
				arg_143_1.var_.moveOldPos10034 = var_146_7.localPosition
				var_146_7.localScale = Vector3.New(1, 1, 1)

				arg_143_1:CheckSpriteTmpPos("10034", 2)

				local var_146_9 = var_146_7.childCount

				for iter_146_1 = 0, var_146_9 - 1 do
					local var_146_10 = var_146_7:GetChild(iter_146_1)

					if var_146_10.name == "split_2" or not string.find(var_146_10.name, "split") then
						var_146_10.gameObject:SetActive(true)
					else
						var_146_10.gameObject:SetActive(false)
					end
				end
			end

			local var_146_11 = 0.001

			if var_146_8 <= arg_143_1.time_ and arg_143_1.time_ < var_146_8 + var_146_11 then
				local var_146_12 = (arg_143_1.time_ - var_146_8) / var_146_11
				local var_146_13 = Vector3.New(-390, -415, -290)

				var_146_7.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos10034, var_146_13, var_146_12)
			end

			if arg_143_1.time_ >= var_146_8 + var_146_11 and arg_143_1.time_ < var_146_8 + var_146_11 + arg_146_0 then
				var_146_7.localPosition = Vector3.New(-390, -415, -290)
			end

			local var_146_14 = arg_143_1.actors_["1033"]
			local var_146_15 = 0

			if var_146_15 < arg_143_1.time_ and arg_143_1.time_ <= var_146_15 + arg_146_0 and arg_143_1.var_.actorSpriteComps1033 == nil then
				arg_143_1.var_.actorSpriteComps1033 = var_146_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_146_16 = 0.2

			if var_146_15 <= arg_143_1.time_ and arg_143_1.time_ < var_146_15 + var_146_16 then
				local var_146_17 = (arg_143_1.time_ - var_146_15) / var_146_16

				if arg_143_1.var_.actorSpriteComps1033 then
					for iter_146_2, iter_146_3 in pairs(arg_143_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_146_3 then
							local var_146_18 = Mathf.Lerp(iter_146_3.color.r, 1, var_146_17)

							iter_146_3.color = Color.New(var_146_18, var_146_18, var_146_18)
						end
					end
				end
			end

			if arg_143_1.time_ >= var_146_15 + var_146_16 and arg_143_1.time_ < var_146_15 + var_146_16 + arg_146_0 and arg_143_1.var_.actorSpriteComps1033 then
				local var_146_19 = 1

				for iter_146_4, iter_146_5 in pairs(arg_143_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_146_5 then
						iter_146_5.color = Color.New(var_146_19, var_146_19, var_146_19)
					end
				end

				arg_143_1.var_.actorSpriteComps1033 = nil
			end

			local var_146_20 = 0
			local var_146_21 = 0.1

			if var_146_20 < arg_143_1.time_ and arg_143_1.time_ <= var_146_20 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_22 = arg_143_1:FormatText(StoryNameCfg[236].name)

				arg_143_1.leftNameTxt_.text = var_146_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_23 = arg_143_1:GetWordFromCfg(117101036)
				local var_146_24 = arg_143_1:FormatText(var_146_23.content)

				arg_143_1.text_.text = var_146_24

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_25 = 4
				local var_146_26 = utf8.len(var_146_24)
				local var_146_27 = var_146_25 <= 0 and var_146_21 or var_146_21 * (var_146_26 / var_146_25)

				if var_146_27 > 0 and var_146_21 < var_146_27 then
					arg_143_1.talkMaxDuration = var_146_27

					if var_146_27 + var_146_20 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_27 + var_146_20
					end
				end

				arg_143_1.text_.text = var_146_24
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101036", "story_v_out_117101.awb") ~= 0 then
					local var_146_28 = manager.audio:GetVoiceLength("story_v_out_117101", "117101036", "story_v_out_117101.awb") / 1000

					if var_146_28 + var_146_20 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_28 + var_146_20
					end

					if var_146_23.prefab_name ~= "" and arg_143_1.actors_[var_146_23.prefab_name] ~= nil then
						local var_146_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_23.prefab_name].transform, "story_v_out_117101", "117101036", "story_v_out_117101.awb")

						arg_143_1:RecordAudio("117101036", var_146_29)
						arg_143_1:RecordAudio("117101036", var_146_29)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_117101", "117101036", "story_v_out_117101.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_117101", "117101036", "story_v_out_117101.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_30 = math.max(var_146_21, arg_143_1.talkMaxDuration)

			if var_146_20 <= arg_143_1.time_ and arg_143_1.time_ < var_146_20 + var_146_30 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_20) / var_146_30

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_20 + var_146_30 and arg_143_1.time_ < var_146_20 + var_146_30 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play117101037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 117101037
		arg_147_1.duration_ = 5

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play117101038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1033"]
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				local var_150_2 = var_150_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_150_2 then
					arg_147_1.var_.alphaOldValue1033 = var_150_2.alpha
					arg_147_1.var_.characterEffect1033 = var_150_2
				end

				arg_147_1.var_.alphaOldValue1033 = 1
			end

			local var_150_3 = 0.333333333333333

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_3 then
				local var_150_4 = (arg_147_1.time_ - var_150_1) / var_150_3
				local var_150_5 = Mathf.Lerp(arg_147_1.var_.alphaOldValue1033, 0, var_150_4)

				if arg_147_1.var_.characterEffect1033 then
					arg_147_1.var_.characterEffect1033.alpha = var_150_5
				end
			end

			if arg_147_1.time_ >= var_150_1 + var_150_3 and arg_147_1.time_ < var_150_1 + var_150_3 + arg_150_0 and arg_147_1.var_.characterEffect1033 then
				arg_147_1.var_.characterEffect1033.alpha = 0
			end

			local var_150_6 = arg_147_1.actors_["10034"]
			local var_150_7 = 0

			if var_150_7 < arg_147_1.time_ and arg_147_1.time_ <= var_150_7 + arg_150_0 then
				local var_150_8 = var_150_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_150_8 then
					arg_147_1.var_.alphaOldValue10034 = var_150_8.alpha
					arg_147_1.var_.characterEffect10034 = var_150_8
				end

				arg_147_1.var_.alphaOldValue10034 = 1
			end

			local var_150_9 = 0.333333333333333

			if var_150_7 <= arg_147_1.time_ and arg_147_1.time_ < var_150_7 + var_150_9 then
				local var_150_10 = (arg_147_1.time_ - var_150_7) / var_150_9
				local var_150_11 = Mathf.Lerp(arg_147_1.var_.alphaOldValue10034, 0, var_150_10)

				if arg_147_1.var_.characterEffect10034 then
					arg_147_1.var_.characterEffect10034.alpha = var_150_11
				end
			end

			if arg_147_1.time_ >= var_150_7 + var_150_9 and arg_147_1.time_ < var_150_7 + var_150_9 + arg_150_0 and arg_147_1.var_.characterEffect10034 then
				arg_147_1.var_.characterEffect10034.alpha = 0
			end

			local var_150_12 = 0
			local var_150_13 = 1.275

			if var_150_12 < arg_147_1.time_ and arg_147_1.time_ <= var_150_12 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, false)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_14 = arg_147_1:GetWordFromCfg(117101037)
				local var_150_15 = arg_147_1:FormatText(var_150_14.content)

				arg_147_1.text_.text = var_150_15

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_16 = 51
				local var_150_17 = utf8.len(var_150_15)
				local var_150_18 = var_150_16 <= 0 and var_150_13 or var_150_13 * (var_150_17 / var_150_16)

				if var_150_18 > 0 and var_150_13 < var_150_18 then
					arg_147_1.talkMaxDuration = var_150_18

					if var_150_18 + var_150_12 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_18 + var_150_12
					end
				end

				arg_147_1.text_.text = var_150_15
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)
				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_19 = math.max(var_150_13, arg_147_1.talkMaxDuration)

			if var_150_12 <= arg_147_1.time_ and arg_147_1.time_ < var_150_12 + var_150_19 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_12) / var_150_19

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_12 + var_150_19 and arg_147_1.time_ < var_150_12 + var_150_19 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play117101038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 117101038
		arg_151_1.duration_ = 5

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play117101039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 0.825

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, false)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_2 = arg_151_1:GetWordFromCfg(117101038)
				local var_154_3 = arg_151_1:FormatText(var_154_2.content)

				arg_151_1.text_.text = var_154_3

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_4 = 33
				local var_154_5 = utf8.len(var_154_3)
				local var_154_6 = var_154_4 <= 0 and var_154_1 or var_154_1 * (var_154_5 / var_154_4)

				if var_154_6 > 0 and var_154_1 < var_154_6 then
					arg_151_1.talkMaxDuration = var_154_6

					if var_154_6 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_6 + var_154_0
					end
				end

				arg_151_1.text_.text = var_154_3
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)
				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_7 = math.max(var_154_1, arg_151_1.talkMaxDuration)

			if var_154_0 <= arg_151_1.time_ and arg_151_1.time_ < var_154_0 + var_154_7 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_0) / var_154_7

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_0 + var_154_7 and arg_151_1.time_ < var_154_0 + var_154_7 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play117101039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 117101039
		arg_155_1.duration_ = 5

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play117101040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 1.725

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, false)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_2 = arg_155_1:GetWordFromCfg(117101039)
				local var_158_3 = arg_155_1:FormatText(var_158_2.content)

				arg_155_1.text_.text = var_158_3

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_4 = 69
				local var_158_5 = utf8.len(var_158_3)
				local var_158_6 = var_158_4 <= 0 and var_158_1 or var_158_1 * (var_158_5 / var_158_4)

				if var_158_6 > 0 and var_158_1 < var_158_6 then
					arg_155_1.talkMaxDuration = var_158_6

					if var_158_6 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_6 + var_158_0
					end
				end

				arg_155_1.text_.text = var_158_3
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)
				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_7 = math.max(var_158_1, arg_155_1.talkMaxDuration)

			if var_158_0 <= arg_155_1.time_ and arg_155_1.time_ < var_158_0 + var_158_7 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_0) / var_158_7

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_0 + var_158_7 and arg_155_1.time_ < var_158_0 + var_158_7 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play117101040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 117101040
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play117101041(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 0.9

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, false)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_2 = arg_159_1:GetWordFromCfg(117101040)
				local var_162_3 = arg_159_1:FormatText(var_162_2.content)

				arg_159_1.text_.text = var_162_3

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_4 = 36
				local var_162_5 = utf8.len(var_162_3)
				local var_162_6 = var_162_4 <= 0 and var_162_1 or var_162_1 * (var_162_5 / var_162_4)

				if var_162_6 > 0 and var_162_1 < var_162_6 then
					arg_159_1.talkMaxDuration = var_162_6

					if var_162_6 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_6 + var_162_0
					end
				end

				arg_159_1.text_.text = var_162_3
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)
				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_7 = math.max(var_162_1, arg_159_1.talkMaxDuration)

			if var_162_0 <= arg_159_1.time_ and arg_159_1.time_ < var_162_0 + var_162_7 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_0) / var_162_7

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_0 + var_162_7 and arg_159_1.time_ < var_162_0 + var_162_7 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play117101041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 117101041
		arg_163_1.duration_ = 7.6

		local var_163_0 = {
			zh = 5.8,
			ja = 7.6
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
				arg_163_0:Play117101042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1033"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos1033 = var_166_0.localPosition
				var_166_0.localScale = Vector3.New(1, 1, 1)

				arg_163_1:CheckSpriteTmpPos("1033", 2)

				local var_166_2 = var_166_0.childCount

				for iter_166_0 = 0, var_166_2 - 1 do
					local var_166_3 = var_166_0:GetChild(iter_166_0)

					if var_166_3.name == "split_6" or not string.find(var_166_3.name, "split") then
						var_166_3.gameObject:SetActive(true)
					else
						var_166_3.gameObject:SetActive(false)
					end
				end
			end

			local var_166_4 = 0.001

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_4 then
				local var_166_5 = (arg_163_1.time_ - var_166_1) / var_166_4
				local var_166_6 = Vector3.New(-390, -420, 0)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1033, var_166_6, var_166_5)
			end

			if arg_163_1.time_ >= var_166_1 + var_166_4 and arg_163_1.time_ < var_166_1 + var_166_4 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_166_7 = arg_163_1.actors_["1033"]
			local var_166_8 = 0

			if var_166_8 < arg_163_1.time_ and arg_163_1.time_ <= var_166_8 + arg_166_0 and arg_163_1.var_.actorSpriteComps1033 == nil then
				arg_163_1.var_.actorSpriteComps1033 = var_166_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_9 = 0.2

			if var_166_8 <= arg_163_1.time_ and arg_163_1.time_ < var_166_8 + var_166_9 then
				local var_166_10 = (arg_163_1.time_ - var_166_8) / var_166_9

				if arg_163_1.var_.actorSpriteComps1033 then
					for iter_166_1, iter_166_2 in pairs(arg_163_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_166_2 then
							local var_166_11 = Mathf.Lerp(iter_166_2.color.r, 1, var_166_10)

							iter_166_2.color = Color.New(var_166_11, var_166_11, var_166_11)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_8 + var_166_9 and arg_163_1.time_ < var_166_8 + var_166_9 + arg_166_0 and arg_163_1.var_.actorSpriteComps1033 then
				local var_166_12 = 1

				for iter_166_3, iter_166_4 in pairs(arg_163_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_166_4 then
						iter_166_4.color = Color.New(var_166_12, var_166_12, var_166_12)
					end
				end

				arg_163_1.var_.actorSpriteComps1033 = nil
			end

			local var_166_13 = arg_163_1.actors_["1033"]
			local var_166_14 = 0

			if var_166_14 < arg_163_1.time_ and arg_163_1.time_ <= var_166_14 + arg_166_0 then
				local var_166_15 = var_166_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_166_15 then
					arg_163_1.var_.alphaOldValue1033 = var_166_15.alpha
					arg_163_1.var_.characterEffect1033 = var_166_15
				end

				arg_163_1.var_.alphaOldValue1033 = 0
			end

			local var_166_16 = 0.333333333333333

			if var_166_14 <= arg_163_1.time_ and arg_163_1.time_ < var_166_14 + var_166_16 then
				local var_166_17 = (arg_163_1.time_ - var_166_14) / var_166_16
				local var_166_18 = Mathf.Lerp(arg_163_1.var_.alphaOldValue1033, 1, var_166_17)

				if arg_163_1.var_.characterEffect1033 then
					arg_163_1.var_.characterEffect1033.alpha = var_166_18
				end
			end

			if arg_163_1.time_ >= var_166_14 + var_166_16 and arg_163_1.time_ < var_166_14 + var_166_16 + arg_166_0 and arg_163_1.var_.characterEffect1033 then
				arg_163_1.var_.characterEffect1033.alpha = 1
			end

			local var_166_19 = arg_163_1.actors_["10034"].transform
			local var_166_20 = 0

			if var_166_20 < arg_163_1.time_ and arg_163_1.time_ <= var_166_20 + arg_166_0 then
				arg_163_1.var_.moveOldPos10034 = var_166_19.localPosition
				var_166_19.localScale = Vector3.New(1, 1, 1)

				arg_163_1:CheckSpriteTmpPos("10034", 4)

				local var_166_21 = var_166_19.childCount

				for iter_166_5 = 0, var_166_21 - 1 do
					local var_166_22 = var_166_19:GetChild(iter_166_5)

					if var_166_22.name == "split_2" or not string.find(var_166_22.name, "split") then
						var_166_22.gameObject:SetActive(true)
					else
						var_166_22.gameObject:SetActive(false)
					end
				end
			end

			local var_166_23 = 0.001

			if var_166_20 <= arg_163_1.time_ and arg_163_1.time_ < var_166_20 + var_166_23 then
				local var_166_24 = (arg_163_1.time_ - var_166_20) / var_166_23
				local var_166_25 = Vector3.New(390, -415, -290)

				var_166_19.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos10034, var_166_25, var_166_24)
			end

			if arg_163_1.time_ >= var_166_20 + var_166_23 and arg_163_1.time_ < var_166_20 + var_166_23 + arg_166_0 then
				var_166_19.localPosition = Vector3.New(390, -415, -290)
			end

			local var_166_26 = arg_163_1.actors_["10034"]
			local var_166_27 = 0

			if var_166_27 < arg_163_1.time_ and arg_163_1.time_ <= var_166_27 + arg_166_0 then
				local var_166_28 = var_166_26:GetComponentInChildren(typeof(CanvasGroup))

				if var_166_28 then
					arg_163_1.var_.alphaOldValue10034 = var_166_28.alpha
					arg_163_1.var_.characterEffect10034 = var_166_28
				end

				arg_163_1.var_.alphaOldValue10034 = 0
			end

			local var_166_29 = 0.333333333333333

			if var_166_27 <= arg_163_1.time_ and arg_163_1.time_ < var_166_27 + var_166_29 then
				local var_166_30 = (arg_163_1.time_ - var_166_27) / var_166_29
				local var_166_31 = Mathf.Lerp(arg_163_1.var_.alphaOldValue10034, 1, var_166_30)

				if arg_163_1.var_.characterEffect10034 then
					arg_163_1.var_.characterEffect10034.alpha = var_166_31
				end
			end

			if arg_163_1.time_ >= var_166_27 + var_166_29 and arg_163_1.time_ < var_166_27 + var_166_29 + arg_166_0 and arg_163_1.var_.characterEffect10034 then
				arg_163_1.var_.characterEffect10034.alpha = 1
			end

			local var_166_32 = arg_163_1.actors_["10034"]
			local var_166_33 = 0

			if var_166_33 < arg_163_1.time_ and arg_163_1.time_ <= var_166_33 + arg_166_0 and arg_163_1.var_.actorSpriteComps10034 == nil then
				arg_163_1.var_.actorSpriteComps10034 = var_166_32:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_34 = 0.2

			if var_166_33 <= arg_163_1.time_ and arg_163_1.time_ < var_166_33 + var_166_34 then
				local var_166_35 = (arg_163_1.time_ - var_166_33) / var_166_34

				if arg_163_1.var_.actorSpriteComps10034 then
					for iter_166_6, iter_166_7 in pairs(arg_163_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_166_7 then
							local var_166_36 = Mathf.Lerp(iter_166_7.color.r, 0.5, var_166_35)

							iter_166_7.color = Color.New(var_166_36, var_166_36, var_166_36)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_33 + var_166_34 and arg_163_1.time_ < var_166_33 + var_166_34 + arg_166_0 and arg_163_1.var_.actorSpriteComps10034 then
				local var_166_37 = 0.5

				for iter_166_8, iter_166_9 in pairs(arg_163_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_166_9 then
						iter_166_9.color = Color.New(var_166_37, var_166_37, var_166_37)
					end
				end

				arg_163_1.var_.actorSpriteComps10034 = nil
			end

			local var_166_38 = 0
			local var_166_39 = 0.8

			if var_166_38 < arg_163_1.time_ and arg_163_1.time_ <= var_166_38 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_40 = arg_163_1:FormatText(StoryNameCfg[236].name)

				arg_163_1.leftNameTxt_.text = var_166_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_41 = arg_163_1:GetWordFromCfg(117101041)
				local var_166_42 = arg_163_1:FormatText(var_166_41.content)

				arg_163_1.text_.text = var_166_42

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_43 = 32
				local var_166_44 = utf8.len(var_166_42)
				local var_166_45 = var_166_43 <= 0 and var_166_39 or var_166_39 * (var_166_44 / var_166_43)

				if var_166_45 > 0 and var_166_39 < var_166_45 then
					arg_163_1.talkMaxDuration = var_166_45

					if var_166_45 + var_166_38 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_45 + var_166_38
					end
				end

				arg_163_1.text_.text = var_166_42
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101041", "story_v_out_117101.awb") ~= 0 then
					local var_166_46 = manager.audio:GetVoiceLength("story_v_out_117101", "117101041", "story_v_out_117101.awb") / 1000

					if var_166_46 + var_166_38 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_46 + var_166_38
					end

					if var_166_41.prefab_name ~= "" and arg_163_1.actors_[var_166_41.prefab_name] ~= nil then
						local var_166_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_41.prefab_name].transform, "story_v_out_117101", "117101041", "story_v_out_117101.awb")

						arg_163_1:RecordAudio("117101041", var_166_47)
						arg_163_1:RecordAudio("117101041", var_166_47)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_117101", "117101041", "story_v_out_117101.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_117101", "117101041", "story_v_out_117101.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_48 = math.max(var_166_39, arg_163_1.talkMaxDuration)

			if var_166_38 <= arg_163_1.time_ and arg_163_1.time_ < var_166_38 + var_166_48 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_38) / var_166_48

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_38 + var_166_48 and arg_163_1.time_ < var_166_38 + var_166_48 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play117101042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 117101042
		arg_167_1.duration_ = 11.833

		local var_167_0 = {
			zh = 11.833,
			ja = 11.133
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
				arg_167_0:Play117101043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0
			local var_170_1 = 1.4

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_2 = arg_167_1:FormatText(StoryNameCfg[236].name)

				arg_167_1.leftNameTxt_.text = var_170_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_3 = arg_167_1:GetWordFromCfg(117101042)
				local var_170_4 = arg_167_1:FormatText(var_170_3.content)

				arg_167_1.text_.text = var_170_4

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_5 = 56
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

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101042", "story_v_out_117101.awb") ~= 0 then
					local var_170_8 = manager.audio:GetVoiceLength("story_v_out_117101", "117101042", "story_v_out_117101.awb") / 1000

					if var_170_8 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_8 + var_170_0
					end

					if var_170_3.prefab_name ~= "" and arg_167_1.actors_[var_170_3.prefab_name] ~= nil then
						local var_170_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_3.prefab_name].transform, "story_v_out_117101", "117101042", "story_v_out_117101.awb")

						arg_167_1:RecordAudio("117101042", var_170_9)
						arg_167_1:RecordAudio("117101042", var_170_9)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_117101", "117101042", "story_v_out_117101.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_117101", "117101042", "story_v_out_117101.awb")
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
	Play117101043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 117101043
		arg_171_1.duration_ = 5

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play117101044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1033"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.actorSpriteComps1033 == nil then
				arg_171_1.var_.actorSpriteComps1033 = var_174_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_2 = 0.2

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.actorSpriteComps1033 then
					for iter_174_0, iter_174_1 in pairs(arg_171_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_174_1 then
							local var_174_4 = Mathf.Lerp(iter_174_1.color.r, 0.5, var_174_3)

							iter_174_1.color = Color.New(var_174_4, var_174_4, var_174_4)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.actorSpriteComps1033 then
				local var_174_5 = 0.5

				for iter_174_2, iter_174_3 in pairs(arg_171_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_174_3 then
						iter_174_3.color = Color.New(var_174_5, var_174_5, var_174_5)
					end
				end

				arg_171_1.var_.actorSpriteComps1033 = nil
			end

			local var_174_6 = 0
			local var_174_7 = 0.85

			if var_174_6 < arg_171_1.time_ and arg_171_1.time_ <= var_174_6 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, false)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_8 = arg_171_1:GetWordFromCfg(117101043)
				local var_174_9 = arg_171_1:FormatText(var_174_8.content)

				arg_171_1.text_.text = var_174_9

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_10 = 34
				local var_174_11 = utf8.len(var_174_9)
				local var_174_12 = var_174_10 <= 0 and var_174_7 or var_174_7 * (var_174_11 / var_174_10)

				if var_174_12 > 0 and var_174_7 < var_174_12 then
					arg_171_1.talkMaxDuration = var_174_12

					if var_174_12 + var_174_6 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_12 + var_174_6
					end
				end

				arg_171_1.text_.text = var_174_9
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)
				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_13 = math.max(var_174_7, arg_171_1.talkMaxDuration)

			if var_174_6 <= arg_171_1.time_ and arg_171_1.time_ < var_174_6 + var_174_13 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_6) / var_174_13

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_6 + var_174_13 and arg_171_1.time_ < var_174_6 + var_174_13 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play117101044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 117101044
		arg_175_1.duration_ = 6.7

		local var_175_0 = {
			zh = 4.933,
			ja = 6.7
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
				arg_175_0:Play117101045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["10034"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.actorSpriteComps10034 == nil then
				arg_175_1.var_.actorSpriteComps10034 = var_178_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_2 = 0.2

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.actorSpriteComps10034 then
					for iter_178_0, iter_178_1 in pairs(arg_175_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_178_1 then
							local var_178_4 = Mathf.Lerp(iter_178_1.color.r, 1, var_178_3)

							iter_178_1.color = Color.New(var_178_4, var_178_4, var_178_4)
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.actorSpriteComps10034 then
				local var_178_5 = 1

				for iter_178_2, iter_178_3 in pairs(arg_175_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_178_3 then
						iter_178_3.color = Color.New(var_178_5, var_178_5, var_178_5)
					end
				end

				arg_175_1.var_.actorSpriteComps10034 = nil
			end

			local var_178_6 = 0
			local var_178_7 = 0.475

			if var_178_6 < arg_175_1.time_ and arg_175_1.time_ <= var_178_6 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_8 = arg_175_1:FormatText(StoryNameCfg[367].name)

				arg_175_1.leftNameTxt_.text = var_178_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_9 = arg_175_1:GetWordFromCfg(117101044)
				local var_178_10 = arg_175_1:FormatText(var_178_9.content)

				arg_175_1.text_.text = var_178_10

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_11 = 19
				local var_178_12 = utf8.len(var_178_10)
				local var_178_13 = var_178_11 <= 0 and var_178_7 or var_178_7 * (var_178_12 / var_178_11)

				if var_178_13 > 0 and var_178_7 < var_178_13 then
					arg_175_1.talkMaxDuration = var_178_13

					if var_178_13 + var_178_6 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_13 + var_178_6
					end
				end

				arg_175_1.text_.text = var_178_10
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101044", "story_v_out_117101.awb") ~= 0 then
					local var_178_14 = manager.audio:GetVoiceLength("story_v_out_117101", "117101044", "story_v_out_117101.awb") / 1000

					if var_178_14 + var_178_6 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_14 + var_178_6
					end

					if var_178_9.prefab_name ~= "" and arg_175_1.actors_[var_178_9.prefab_name] ~= nil then
						local var_178_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_9.prefab_name].transform, "story_v_out_117101", "117101044", "story_v_out_117101.awb")

						arg_175_1:RecordAudio("117101044", var_178_15)
						arg_175_1:RecordAudio("117101044", var_178_15)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_117101", "117101044", "story_v_out_117101.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_117101", "117101044", "story_v_out_117101.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_16 = math.max(var_178_7, arg_175_1.talkMaxDuration)

			if var_178_6 <= arg_175_1.time_ and arg_175_1.time_ < var_178_6 + var_178_16 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_6) / var_178_16

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_6 + var_178_16 and arg_175_1.time_ < var_178_6 + var_178_16 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play117101045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 117101045
		arg_179_1.duration_ = 3.533

		local var_179_0 = {
			zh = 1.966,
			ja = 3.533
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
				arg_179_0:Play117101046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1033"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 and arg_179_1.var_.actorSpriteComps1033 == nil then
				arg_179_1.var_.actorSpriteComps1033 = var_182_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_182_2 = 0.2

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2

				if arg_179_1.var_.actorSpriteComps1033 then
					for iter_182_0, iter_182_1 in pairs(arg_179_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_182_1 then
							local var_182_4 = Mathf.Lerp(iter_182_1.color.r, 1, var_182_3)

							iter_182_1.color = Color.New(var_182_4, var_182_4, var_182_4)
						end
					end
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 and arg_179_1.var_.actorSpriteComps1033 then
				local var_182_5 = 1

				for iter_182_2, iter_182_3 in pairs(arg_179_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_182_3 then
						iter_182_3.color = Color.New(var_182_5, var_182_5, var_182_5)
					end
				end

				arg_179_1.var_.actorSpriteComps1033 = nil
			end

			local var_182_6 = arg_179_1.actors_["10034"]
			local var_182_7 = 0

			if var_182_7 < arg_179_1.time_ and arg_179_1.time_ <= var_182_7 + arg_182_0 and arg_179_1.var_.actorSpriteComps10034 == nil then
				arg_179_1.var_.actorSpriteComps10034 = var_182_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_182_8 = 0.2

			if var_182_7 <= arg_179_1.time_ and arg_179_1.time_ < var_182_7 + var_182_8 then
				local var_182_9 = (arg_179_1.time_ - var_182_7) / var_182_8

				if arg_179_1.var_.actorSpriteComps10034 then
					for iter_182_4, iter_182_5 in pairs(arg_179_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_182_5 then
							local var_182_10 = Mathf.Lerp(iter_182_5.color.r, 0.5, var_182_9)

							iter_182_5.color = Color.New(var_182_10, var_182_10, var_182_10)
						end
					end
				end
			end

			if arg_179_1.time_ >= var_182_7 + var_182_8 and arg_179_1.time_ < var_182_7 + var_182_8 + arg_182_0 and arg_179_1.var_.actorSpriteComps10034 then
				local var_182_11 = 0.5

				for iter_182_6, iter_182_7 in pairs(arg_179_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_182_7 then
						iter_182_7.color = Color.New(var_182_11, var_182_11, var_182_11)
					end
				end

				arg_179_1.var_.actorSpriteComps10034 = nil
			end

			local var_182_12 = 0
			local var_182_13 = 0.225

			if var_182_12 < arg_179_1.time_ and arg_179_1.time_ <= var_182_12 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_14 = arg_179_1:FormatText(StoryNameCfg[236].name)

				arg_179_1.leftNameTxt_.text = var_182_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_15 = arg_179_1:GetWordFromCfg(117101045)
				local var_182_16 = arg_179_1:FormatText(var_182_15.content)

				arg_179_1.text_.text = var_182_16

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_17 = 9
				local var_182_18 = utf8.len(var_182_16)
				local var_182_19 = var_182_17 <= 0 and var_182_13 or var_182_13 * (var_182_18 / var_182_17)

				if var_182_19 > 0 and var_182_13 < var_182_19 then
					arg_179_1.talkMaxDuration = var_182_19

					if var_182_19 + var_182_12 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_19 + var_182_12
					end
				end

				arg_179_1.text_.text = var_182_16
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101045", "story_v_out_117101.awb") ~= 0 then
					local var_182_20 = manager.audio:GetVoiceLength("story_v_out_117101", "117101045", "story_v_out_117101.awb") / 1000

					if var_182_20 + var_182_12 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_20 + var_182_12
					end

					if var_182_15.prefab_name ~= "" and arg_179_1.actors_[var_182_15.prefab_name] ~= nil then
						local var_182_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_15.prefab_name].transform, "story_v_out_117101", "117101045", "story_v_out_117101.awb")

						arg_179_1:RecordAudio("117101045", var_182_21)
						arg_179_1:RecordAudio("117101045", var_182_21)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_117101", "117101045", "story_v_out_117101.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_117101", "117101045", "story_v_out_117101.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_22 = math.max(var_182_13, arg_179_1.talkMaxDuration)

			if var_182_12 <= arg_179_1.time_ and arg_179_1.time_ < var_182_12 + var_182_22 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_12) / var_182_22

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_12 + var_182_22 and arg_179_1.time_ < var_182_12 + var_182_22 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play117101046 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 117101046
		arg_183_1.duration_ = 11.366

		local var_183_0 = {
			zh = 5.033,
			ja = 11.366
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
				arg_183_0:Play117101047(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1033"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.actorSpriteComps1033 == nil then
				arg_183_1.var_.actorSpriteComps1033 = var_186_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_2 = 0.2

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.actorSpriteComps1033 then
					for iter_186_0, iter_186_1 in pairs(arg_183_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_186_1 then
							local var_186_4 = Mathf.Lerp(iter_186_1.color.r, 0.5, var_186_3)

							iter_186_1.color = Color.New(var_186_4, var_186_4, var_186_4)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.actorSpriteComps1033 then
				local var_186_5 = 0.5

				for iter_186_2, iter_186_3 in pairs(arg_183_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_186_3 then
						iter_186_3.color = Color.New(var_186_5, var_186_5, var_186_5)
					end
				end

				arg_183_1.var_.actorSpriteComps1033 = nil
			end

			local var_186_6 = arg_183_1.actors_["10034"]
			local var_186_7 = 0

			if var_186_7 < arg_183_1.time_ and arg_183_1.time_ <= var_186_7 + arg_186_0 and arg_183_1.var_.actorSpriteComps10034 == nil then
				arg_183_1.var_.actorSpriteComps10034 = var_186_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_8 = 0.2

			if var_186_7 <= arg_183_1.time_ and arg_183_1.time_ < var_186_7 + var_186_8 then
				local var_186_9 = (arg_183_1.time_ - var_186_7) / var_186_8

				if arg_183_1.var_.actorSpriteComps10034 then
					for iter_186_4, iter_186_5 in pairs(arg_183_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_186_5 then
							local var_186_10 = Mathf.Lerp(iter_186_5.color.r, 1, var_186_9)

							iter_186_5.color = Color.New(var_186_10, var_186_10, var_186_10)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_7 + var_186_8 and arg_183_1.time_ < var_186_7 + var_186_8 + arg_186_0 and arg_183_1.var_.actorSpriteComps10034 then
				local var_186_11 = 1

				for iter_186_6, iter_186_7 in pairs(arg_183_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_186_7 then
						iter_186_7.color = Color.New(var_186_11, var_186_11, var_186_11)
					end
				end

				arg_183_1.var_.actorSpriteComps10034 = nil
			end

			local var_186_12 = arg_183_1.actors_["10034"].transform
			local var_186_13 = 0

			if var_186_13 < arg_183_1.time_ and arg_183_1.time_ <= var_186_13 + arg_186_0 then
				arg_183_1.var_.moveOldPos10034 = var_186_12.localPosition
				var_186_12.localScale = Vector3.New(1, 1, 1)

				arg_183_1:CheckSpriteTmpPos("10034", 4)

				local var_186_14 = var_186_12.childCount

				for iter_186_8 = 0, var_186_14 - 1 do
					local var_186_15 = var_186_12:GetChild(iter_186_8)

					if var_186_15.name == "split_5" or not string.find(var_186_15.name, "split") then
						var_186_15.gameObject:SetActive(true)
					else
						var_186_15.gameObject:SetActive(false)
					end
				end
			end

			local var_186_16 = 0.001

			if var_186_13 <= arg_183_1.time_ and arg_183_1.time_ < var_186_13 + var_186_16 then
				local var_186_17 = (arg_183_1.time_ - var_186_13) / var_186_16
				local var_186_18 = Vector3.New(390, -415, -290)

				var_186_12.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos10034, var_186_18, var_186_17)
			end

			if arg_183_1.time_ >= var_186_13 + var_186_16 and arg_183_1.time_ < var_186_13 + var_186_16 + arg_186_0 then
				var_186_12.localPosition = Vector3.New(390, -415, -290)
			end

			local var_186_19 = 0
			local var_186_20 = 0.55

			if var_186_19 < arg_183_1.time_ and arg_183_1.time_ <= var_186_19 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_21 = arg_183_1:FormatText(StoryNameCfg[367].name)

				arg_183_1.leftNameTxt_.text = var_186_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_22 = arg_183_1:GetWordFromCfg(117101046)
				local var_186_23 = arg_183_1:FormatText(var_186_22.content)

				arg_183_1.text_.text = var_186_23

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_24 = 22
				local var_186_25 = utf8.len(var_186_23)
				local var_186_26 = var_186_24 <= 0 and var_186_20 or var_186_20 * (var_186_25 / var_186_24)

				if var_186_26 > 0 and var_186_20 < var_186_26 then
					arg_183_1.talkMaxDuration = var_186_26

					if var_186_26 + var_186_19 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_26 + var_186_19
					end
				end

				arg_183_1.text_.text = var_186_23
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101046", "story_v_out_117101.awb") ~= 0 then
					local var_186_27 = manager.audio:GetVoiceLength("story_v_out_117101", "117101046", "story_v_out_117101.awb") / 1000

					if var_186_27 + var_186_19 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_27 + var_186_19
					end

					if var_186_22.prefab_name ~= "" and arg_183_1.actors_[var_186_22.prefab_name] ~= nil then
						local var_186_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_22.prefab_name].transform, "story_v_out_117101", "117101046", "story_v_out_117101.awb")

						arg_183_1:RecordAudio("117101046", var_186_28)
						arg_183_1:RecordAudio("117101046", var_186_28)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_117101", "117101046", "story_v_out_117101.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_117101", "117101046", "story_v_out_117101.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_29 = math.max(var_186_20, arg_183_1.talkMaxDuration)

			if var_186_19 <= arg_183_1.time_ and arg_183_1.time_ < var_186_19 + var_186_29 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_19) / var_186_29

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_19 + var_186_29 and arg_183_1.time_ < var_186_19 + var_186_29 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play117101047 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 117101047
		arg_187_1.duration_ = 9.366

		local var_187_0 = {
			zh = 5.966,
			ja = 9.366
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
				arg_187_0:Play117101048(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1033"]
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 and arg_187_1.var_.actorSpriteComps1033 == nil then
				arg_187_1.var_.actorSpriteComps1033 = var_190_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_2 = 0.2

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2

				if arg_187_1.var_.actorSpriteComps1033 then
					for iter_190_0, iter_190_1 in pairs(arg_187_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_190_1 then
							local var_190_4 = Mathf.Lerp(iter_190_1.color.r, 1, var_190_3)

							iter_190_1.color = Color.New(var_190_4, var_190_4, var_190_4)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.actorSpriteComps1033 then
				local var_190_5 = 1

				for iter_190_2, iter_190_3 in pairs(arg_187_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_190_3 then
						iter_190_3.color = Color.New(var_190_5, var_190_5, var_190_5)
					end
				end

				arg_187_1.var_.actorSpriteComps1033 = nil
			end

			local var_190_6 = arg_187_1.actors_["10034"]
			local var_190_7 = 0

			if var_190_7 < arg_187_1.time_ and arg_187_1.time_ <= var_190_7 + arg_190_0 and arg_187_1.var_.actorSpriteComps10034 == nil then
				arg_187_1.var_.actorSpriteComps10034 = var_190_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_8 = 0.2

			if var_190_7 <= arg_187_1.time_ and arg_187_1.time_ < var_190_7 + var_190_8 then
				local var_190_9 = (arg_187_1.time_ - var_190_7) / var_190_8

				if arg_187_1.var_.actorSpriteComps10034 then
					for iter_190_4, iter_190_5 in pairs(arg_187_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_190_5 then
							local var_190_10 = Mathf.Lerp(iter_190_5.color.r, 0.5, var_190_9)

							iter_190_5.color = Color.New(var_190_10, var_190_10, var_190_10)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_7 + var_190_8 and arg_187_1.time_ < var_190_7 + var_190_8 + arg_190_0 and arg_187_1.var_.actorSpriteComps10034 then
				local var_190_11 = 0.5

				for iter_190_6, iter_190_7 in pairs(arg_187_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_190_7 then
						iter_190_7.color = Color.New(var_190_11, var_190_11, var_190_11)
					end
				end

				arg_187_1.var_.actorSpriteComps10034 = nil
			end

			local var_190_12 = 0
			local var_190_13 = 0.725

			if var_190_12 < arg_187_1.time_ and arg_187_1.time_ <= var_190_12 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_14 = arg_187_1:FormatText(StoryNameCfg[236].name)

				arg_187_1.leftNameTxt_.text = var_190_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_15 = arg_187_1:GetWordFromCfg(117101047)
				local var_190_16 = arg_187_1:FormatText(var_190_15.content)

				arg_187_1.text_.text = var_190_16

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_17 = 29
				local var_190_18 = utf8.len(var_190_16)
				local var_190_19 = var_190_17 <= 0 and var_190_13 or var_190_13 * (var_190_18 / var_190_17)

				if var_190_19 > 0 and var_190_13 < var_190_19 then
					arg_187_1.talkMaxDuration = var_190_19

					if var_190_19 + var_190_12 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_19 + var_190_12
					end
				end

				arg_187_1.text_.text = var_190_16
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101047", "story_v_out_117101.awb") ~= 0 then
					local var_190_20 = manager.audio:GetVoiceLength("story_v_out_117101", "117101047", "story_v_out_117101.awb") / 1000

					if var_190_20 + var_190_12 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_20 + var_190_12
					end

					if var_190_15.prefab_name ~= "" and arg_187_1.actors_[var_190_15.prefab_name] ~= nil then
						local var_190_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_15.prefab_name].transform, "story_v_out_117101", "117101047", "story_v_out_117101.awb")

						arg_187_1:RecordAudio("117101047", var_190_21)
						arg_187_1:RecordAudio("117101047", var_190_21)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_117101", "117101047", "story_v_out_117101.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_117101", "117101047", "story_v_out_117101.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_22 = math.max(var_190_13, arg_187_1.talkMaxDuration)

			if var_190_12 <= arg_187_1.time_ and arg_187_1.time_ < var_190_12 + var_190_22 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_12) / var_190_22

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_12 + var_190_22 and arg_187_1.time_ < var_190_12 + var_190_22 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play117101048 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 117101048
		arg_191_1.duration_ = 14.5

		local var_191_0 = {
			zh = 11,
			ja = 14.5
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
				arg_191_0:Play117101049(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10034"].transform
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.var_.moveOldPos10034 = var_194_0.localPosition
				var_194_0.localScale = Vector3.New(1, 1, 1)

				arg_191_1:CheckSpriteTmpPos("10034", 4)

				local var_194_2 = var_194_0.childCount

				for iter_194_0 = 0, var_194_2 - 1 do
					local var_194_3 = var_194_0:GetChild(iter_194_0)

					if var_194_3.name == "split_5" or not string.find(var_194_3.name, "split") then
						var_194_3.gameObject:SetActive(true)
					else
						var_194_3.gameObject:SetActive(false)
					end
				end
			end

			local var_194_4 = 0.001

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_4 then
				local var_194_5 = (arg_191_1.time_ - var_194_1) / var_194_4
				local var_194_6 = Vector3.New(390, -415, -290)

				var_194_0.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos10034, var_194_6, var_194_5)
			end

			if arg_191_1.time_ >= var_194_1 + var_194_4 and arg_191_1.time_ < var_194_1 + var_194_4 + arg_194_0 then
				var_194_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_194_7 = arg_191_1.actors_["1033"].transform
			local var_194_8 = 0

			if var_194_8 < arg_191_1.time_ and arg_191_1.time_ <= var_194_8 + arg_194_0 then
				arg_191_1.var_.moveOldPos1033 = var_194_7.localPosition
				var_194_7.localScale = Vector3.New(1, 1, 1)

				arg_191_1:CheckSpriteTmpPos("1033", 2)

				local var_194_9 = var_194_7.childCount

				for iter_194_1 = 0, var_194_9 - 1 do
					local var_194_10 = var_194_7:GetChild(iter_194_1)

					if var_194_10.name == "split_6" or not string.find(var_194_10.name, "split") then
						var_194_10.gameObject:SetActive(true)
					else
						var_194_10.gameObject:SetActive(false)
					end
				end
			end

			local var_194_11 = 0.001

			if var_194_8 <= arg_191_1.time_ and arg_191_1.time_ < var_194_8 + var_194_11 then
				local var_194_12 = (arg_191_1.time_ - var_194_8) / var_194_11
				local var_194_13 = Vector3.New(-390, -420, 0)

				var_194_7.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos1033, var_194_13, var_194_12)
			end

			if arg_191_1.time_ >= var_194_8 + var_194_11 and arg_191_1.time_ < var_194_8 + var_194_11 + arg_194_0 then
				var_194_7.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_194_14 = arg_191_1.actors_["1033"]
			local var_194_15 = 0

			if var_194_15 < arg_191_1.time_ and arg_191_1.time_ <= var_194_15 + arg_194_0 and arg_191_1.var_.actorSpriteComps1033 == nil then
				arg_191_1.var_.actorSpriteComps1033 = var_194_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_16 = 0.2

			if var_194_15 <= arg_191_1.time_ and arg_191_1.time_ < var_194_15 + var_194_16 then
				local var_194_17 = (arg_191_1.time_ - var_194_15) / var_194_16

				if arg_191_1.var_.actorSpriteComps1033 then
					for iter_194_2, iter_194_3 in pairs(arg_191_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_194_3 then
							local var_194_18 = Mathf.Lerp(iter_194_3.color.r, 0.5, var_194_17)

							iter_194_3.color = Color.New(var_194_18, var_194_18, var_194_18)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_15 + var_194_16 and arg_191_1.time_ < var_194_15 + var_194_16 + arg_194_0 and arg_191_1.var_.actorSpriteComps1033 then
				local var_194_19 = 0.5

				for iter_194_4, iter_194_5 in pairs(arg_191_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_194_5 then
						iter_194_5.color = Color.New(var_194_19, var_194_19, var_194_19)
					end
				end

				arg_191_1.var_.actorSpriteComps1033 = nil
			end

			local var_194_20 = arg_191_1.actors_["10034"]
			local var_194_21 = 0

			if var_194_21 < arg_191_1.time_ and arg_191_1.time_ <= var_194_21 + arg_194_0 and arg_191_1.var_.actorSpriteComps10034 == nil then
				arg_191_1.var_.actorSpriteComps10034 = var_194_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_22 = 0.2

			if var_194_21 <= arg_191_1.time_ and arg_191_1.time_ < var_194_21 + var_194_22 then
				local var_194_23 = (arg_191_1.time_ - var_194_21) / var_194_22

				if arg_191_1.var_.actorSpriteComps10034 then
					for iter_194_6, iter_194_7 in pairs(arg_191_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_194_7 then
							local var_194_24 = Mathf.Lerp(iter_194_7.color.r, 1, var_194_23)

							iter_194_7.color = Color.New(var_194_24, var_194_24, var_194_24)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_21 + var_194_22 and arg_191_1.time_ < var_194_21 + var_194_22 + arg_194_0 and arg_191_1.var_.actorSpriteComps10034 then
				local var_194_25 = 1

				for iter_194_8, iter_194_9 in pairs(arg_191_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_194_9 then
						iter_194_9.color = Color.New(var_194_25, var_194_25, var_194_25)
					end
				end

				arg_191_1.var_.actorSpriteComps10034 = nil
			end

			local var_194_26 = 0
			local var_194_27 = 1.2

			if var_194_26 < arg_191_1.time_ and arg_191_1.time_ <= var_194_26 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_28 = arg_191_1:FormatText(StoryNameCfg[367].name)

				arg_191_1.leftNameTxt_.text = var_194_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_29 = arg_191_1:GetWordFromCfg(117101048)
				local var_194_30 = arg_191_1:FormatText(var_194_29.content)

				arg_191_1.text_.text = var_194_30

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_31 = 48
				local var_194_32 = utf8.len(var_194_30)
				local var_194_33 = var_194_31 <= 0 and var_194_27 or var_194_27 * (var_194_32 / var_194_31)

				if var_194_33 > 0 and var_194_27 < var_194_33 then
					arg_191_1.talkMaxDuration = var_194_33

					if var_194_33 + var_194_26 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_33 + var_194_26
					end
				end

				arg_191_1.text_.text = var_194_30
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101048", "story_v_out_117101.awb") ~= 0 then
					local var_194_34 = manager.audio:GetVoiceLength("story_v_out_117101", "117101048", "story_v_out_117101.awb") / 1000

					if var_194_34 + var_194_26 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_34 + var_194_26
					end

					if var_194_29.prefab_name ~= "" and arg_191_1.actors_[var_194_29.prefab_name] ~= nil then
						local var_194_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_29.prefab_name].transform, "story_v_out_117101", "117101048", "story_v_out_117101.awb")

						arg_191_1:RecordAudio("117101048", var_194_35)
						arg_191_1:RecordAudio("117101048", var_194_35)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_117101", "117101048", "story_v_out_117101.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_117101", "117101048", "story_v_out_117101.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_36 = math.max(var_194_27, arg_191_1.talkMaxDuration)

			if var_194_26 <= arg_191_1.time_ and arg_191_1.time_ < var_194_26 + var_194_36 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_26) / var_194_36

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_26 + var_194_36 and arg_191_1.time_ < var_194_26 + var_194_36 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play117101049 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 117101049
		arg_195_1.duration_ = 9.333

		local var_195_0 = {
			zh = 4.966,
			ja = 9.333
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
				arg_195_0:Play117101050(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1033"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos1033 = var_198_0.localPosition
				var_198_0.localScale = Vector3.New(1, 1, 1)

				arg_195_1:CheckSpriteTmpPos("1033", 2)

				local var_198_2 = var_198_0.childCount

				for iter_198_0 = 0, var_198_2 - 1 do
					local var_198_3 = var_198_0:GetChild(iter_198_0)

					if var_198_3.name == "split_4" or not string.find(var_198_3.name, "split") then
						var_198_3.gameObject:SetActive(true)
					else
						var_198_3.gameObject:SetActive(false)
					end
				end
			end

			local var_198_4 = 0.001

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_4 then
				local var_198_5 = (arg_195_1.time_ - var_198_1) / var_198_4
				local var_198_6 = Vector3.New(-390, -420, 0)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1033, var_198_6, var_198_5)
			end

			if arg_195_1.time_ >= var_198_1 + var_198_4 and arg_195_1.time_ < var_198_1 + var_198_4 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_198_7 = arg_195_1.actors_["1033"]
			local var_198_8 = 0

			if var_198_8 < arg_195_1.time_ and arg_195_1.time_ <= var_198_8 + arg_198_0 and arg_195_1.var_.actorSpriteComps1033 == nil then
				arg_195_1.var_.actorSpriteComps1033 = var_198_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_9 = 0.2

			if var_198_8 <= arg_195_1.time_ and arg_195_1.time_ < var_198_8 + var_198_9 then
				local var_198_10 = (arg_195_1.time_ - var_198_8) / var_198_9

				if arg_195_1.var_.actorSpriteComps1033 then
					for iter_198_1, iter_198_2 in pairs(arg_195_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_198_2 then
							local var_198_11 = Mathf.Lerp(iter_198_2.color.r, 1, var_198_10)

							iter_198_2.color = Color.New(var_198_11, var_198_11, var_198_11)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_8 + var_198_9 and arg_195_1.time_ < var_198_8 + var_198_9 + arg_198_0 and arg_195_1.var_.actorSpriteComps1033 then
				local var_198_12 = 1

				for iter_198_3, iter_198_4 in pairs(arg_195_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_198_4 then
						iter_198_4.color = Color.New(var_198_12, var_198_12, var_198_12)
					end
				end

				arg_195_1.var_.actorSpriteComps1033 = nil
			end

			local var_198_13 = arg_195_1.actors_["10034"]
			local var_198_14 = 0

			if var_198_14 < arg_195_1.time_ and arg_195_1.time_ <= var_198_14 + arg_198_0 and arg_195_1.var_.actorSpriteComps10034 == nil then
				arg_195_1.var_.actorSpriteComps10034 = var_198_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_15 = 0.2

			if var_198_14 <= arg_195_1.time_ and arg_195_1.time_ < var_198_14 + var_198_15 then
				local var_198_16 = (arg_195_1.time_ - var_198_14) / var_198_15

				if arg_195_1.var_.actorSpriteComps10034 then
					for iter_198_5, iter_198_6 in pairs(arg_195_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_198_6 then
							local var_198_17 = Mathf.Lerp(iter_198_6.color.r, 0.5, var_198_16)

							iter_198_6.color = Color.New(var_198_17, var_198_17, var_198_17)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_14 + var_198_15 and arg_195_1.time_ < var_198_14 + var_198_15 + arg_198_0 and arg_195_1.var_.actorSpriteComps10034 then
				local var_198_18 = 0.5

				for iter_198_7, iter_198_8 in pairs(arg_195_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_198_8 then
						iter_198_8.color = Color.New(var_198_18, var_198_18, var_198_18)
					end
				end

				arg_195_1.var_.actorSpriteComps10034 = nil
			end

			local var_198_19 = arg_195_1.actors_["1033"]
			local var_198_20 = 0

			if var_198_20 < arg_195_1.time_ and arg_195_1.time_ <= var_198_20 + arg_198_0 then
				local var_198_21 = var_198_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_198_21 then
					arg_195_1.var_.alphaOldValue1033 = var_198_21.alpha
					arg_195_1.var_.characterEffect1033 = var_198_21
				end

				arg_195_1.var_.alphaOldValue1033 = 0
			end

			local var_198_22 = 0.0166666666666667

			if var_198_20 <= arg_195_1.time_ and arg_195_1.time_ < var_198_20 + var_198_22 then
				local var_198_23 = (arg_195_1.time_ - var_198_20) / var_198_22
				local var_198_24 = Mathf.Lerp(arg_195_1.var_.alphaOldValue1033, 1, var_198_23)

				if arg_195_1.var_.characterEffect1033 then
					arg_195_1.var_.characterEffect1033.alpha = var_198_24
				end
			end

			if arg_195_1.time_ >= var_198_20 + var_198_22 and arg_195_1.time_ < var_198_20 + var_198_22 + arg_198_0 and arg_195_1.var_.characterEffect1033 then
				arg_195_1.var_.characterEffect1033.alpha = 1
			end

			local var_198_25 = 0
			local var_198_26 = 0.55

			if var_198_25 < arg_195_1.time_ and arg_195_1.time_ <= var_198_25 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_27 = arg_195_1:FormatText(StoryNameCfg[236].name)

				arg_195_1.leftNameTxt_.text = var_198_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_28 = arg_195_1:GetWordFromCfg(117101049)
				local var_198_29 = arg_195_1:FormatText(var_198_28.content)

				arg_195_1.text_.text = var_198_29

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_30 = 22
				local var_198_31 = utf8.len(var_198_29)
				local var_198_32 = var_198_30 <= 0 and var_198_26 or var_198_26 * (var_198_31 / var_198_30)

				if var_198_32 > 0 and var_198_26 < var_198_32 then
					arg_195_1.talkMaxDuration = var_198_32

					if var_198_32 + var_198_25 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_32 + var_198_25
					end
				end

				arg_195_1.text_.text = var_198_29
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101049", "story_v_out_117101.awb") ~= 0 then
					local var_198_33 = manager.audio:GetVoiceLength("story_v_out_117101", "117101049", "story_v_out_117101.awb") / 1000

					if var_198_33 + var_198_25 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_33 + var_198_25
					end

					if var_198_28.prefab_name ~= "" and arg_195_1.actors_[var_198_28.prefab_name] ~= nil then
						local var_198_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_28.prefab_name].transform, "story_v_out_117101", "117101049", "story_v_out_117101.awb")

						arg_195_1:RecordAudio("117101049", var_198_34)
						arg_195_1:RecordAudio("117101049", var_198_34)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_117101", "117101049", "story_v_out_117101.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_117101", "117101049", "story_v_out_117101.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_35 = math.max(var_198_26, arg_195_1.talkMaxDuration)

			if var_198_25 <= arg_195_1.time_ and arg_195_1.time_ < var_198_25 + var_198_35 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_25) / var_198_35

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_25 + var_198_35 and arg_195_1.time_ < var_198_25 + var_198_35 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play117101050 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 117101050
		arg_199_1.duration_ = 5

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play117101051(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1033"]
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 and arg_199_1.var_.actorSpriteComps1033 == nil then
				arg_199_1.var_.actorSpriteComps1033 = var_202_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_2 = 0.2

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2

				if arg_199_1.var_.actorSpriteComps1033 then
					for iter_202_0, iter_202_1 in pairs(arg_199_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_202_1 then
							local var_202_4 = Mathf.Lerp(iter_202_1.color.r, 0.5, var_202_3)

							iter_202_1.color = Color.New(var_202_4, var_202_4, var_202_4)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 and arg_199_1.var_.actorSpriteComps1033 then
				local var_202_5 = 0.5

				for iter_202_2, iter_202_3 in pairs(arg_199_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_202_3 then
						iter_202_3.color = Color.New(var_202_5, var_202_5, var_202_5)
					end
				end

				arg_199_1.var_.actorSpriteComps1033 = nil
			end

			local var_202_6 = 0
			local var_202_7 = 1.675

			if var_202_6 < arg_199_1.time_ and arg_199_1.time_ <= var_202_6 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, false)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_8 = arg_199_1:GetWordFromCfg(117101050)
				local var_202_9 = arg_199_1:FormatText(var_202_8.content)

				arg_199_1.text_.text = var_202_9

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_10 = 67
				local var_202_11 = utf8.len(var_202_9)
				local var_202_12 = var_202_10 <= 0 and var_202_7 or var_202_7 * (var_202_11 / var_202_10)

				if var_202_12 > 0 and var_202_7 < var_202_12 then
					arg_199_1.talkMaxDuration = var_202_12

					if var_202_12 + var_202_6 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_12 + var_202_6
					end
				end

				arg_199_1.text_.text = var_202_9
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)
				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_13 = math.max(var_202_7, arg_199_1.talkMaxDuration)

			if var_202_6 <= arg_199_1.time_ and arg_199_1.time_ < var_202_6 + var_202_13 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_6) / var_202_13

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_6 + var_202_13 and arg_199_1.time_ < var_202_6 + var_202_13 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play117101051 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 117101051
		arg_203_1.duration_ = 2.4

		local var_203_0 = {
			zh = 2.4,
			ja = 1.966
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
				arg_203_0:Play117101052(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["10034"].transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPos10034 = var_206_0.localPosition
				var_206_0.localScale = Vector3.New(1, 1, 1)

				arg_203_1:CheckSpriteTmpPos("10034", 4)

				local var_206_2 = var_206_0.childCount

				for iter_206_0 = 0, var_206_2 - 1 do
					local var_206_3 = var_206_0:GetChild(iter_206_0)

					if var_206_3.name == "split_5" or not string.find(var_206_3.name, "split") then
						var_206_3.gameObject:SetActive(true)
					else
						var_206_3.gameObject:SetActive(false)
					end
				end
			end

			local var_206_4 = 0.001

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_4 then
				local var_206_5 = (arg_203_1.time_ - var_206_1) / var_206_4
				local var_206_6 = Vector3.New(390, -415, -290)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos10034, var_206_6, var_206_5)
			end

			if arg_203_1.time_ >= var_206_1 + var_206_4 and arg_203_1.time_ < var_206_1 + var_206_4 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_206_7 = arg_203_1.actors_["10034"]
			local var_206_8 = 0

			if var_206_8 < arg_203_1.time_ and arg_203_1.time_ <= var_206_8 + arg_206_0 and arg_203_1.var_.actorSpriteComps10034 == nil then
				arg_203_1.var_.actorSpriteComps10034 = var_206_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_9 = 0.2

			if var_206_8 <= arg_203_1.time_ and arg_203_1.time_ < var_206_8 + var_206_9 then
				local var_206_10 = (arg_203_1.time_ - var_206_8) / var_206_9

				if arg_203_1.var_.actorSpriteComps10034 then
					for iter_206_1, iter_206_2 in pairs(arg_203_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_206_2 then
							local var_206_11 = Mathf.Lerp(iter_206_2.color.r, 1, var_206_10)

							iter_206_2.color = Color.New(var_206_11, var_206_11, var_206_11)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_8 + var_206_9 and arg_203_1.time_ < var_206_8 + var_206_9 + arg_206_0 and arg_203_1.var_.actorSpriteComps10034 then
				local var_206_12 = 1

				for iter_206_3, iter_206_4 in pairs(arg_203_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_206_4 then
						iter_206_4.color = Color.New(var_206_12, var_206_12, var_206_12)
					end
				end

				arg_203_1.var_.actorSpriteComps10034 = nil
			end

			local var_206_13 = 0
			local var_206_14 = 0.275

			if var_206_13 < arg_203_1.time_ and arg_203_1.time_ <= var_206_13 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_15 = arg_203_1:FormatText(StoryNameCfg[367].name)

				arg_203_1.leftNameTxt_.text = var_206_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_16 = arg_203_1:GetWordFromCfg(117101051)
				local var_206_17 = arg_203_1:FormatText(var_206_16.content)

				arg_203_1.text_.text = var_206_17

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_18 = 11
				local var_206_19 = utf8.len(var_206_17)
				local var_206_20 = var_206_18 <= 0 and var_206_14 or var_206_14 * (var_206_19 / var_206_18)

				if var_206_20 > 0 and var_206_14 < var_206_20 then
					arg_203_1.talkMaxDuration = var_206_20

					if var_206_20 + var_206_13 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_20 + var_206_13
					end
				end

				arg_203_1.text_.text = var_206_17
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101051", "story_v_out_117101.awb") ~= 0 then
					local var_206_21 = manager.audio:GetVoiceLength("story_v_out_117101", "117101051", "story_v_out_117101.awb") / 1000

					if var_206_21 + var_206_13 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_21 + var_206_13
					end

					if var_206_16.prefab_name ~= "" and arg_203_1.actors_[var_206_16.prefab_name] ~= nil then
						local var_206_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_16.prefab_name].transform, "story_v_out_117101", "117101051", "story_v_out_117101.awb")

						arg_203_1:RecordAudio("117101051", var_206_22)
						arg_203_1:RecordAudio("117101051", var_206_22)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_117101", "117101051", "story_v_out_117101.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_117101", "117101051", "story_v_out_117101.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_23 = math.max(var_206_14, arg_203_1.talkMaxDuration)

			if var_206_13 <= arg_203_1.time_ and arg_203_1.time_ < var_206_13 + var_206_23 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_13) / var_206_23

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_13 + var_206_23 and arg_203_1.time_ < var_206_13 + var_206_23 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play117101052 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 117101052
		arg_207_1.duration_ = 9.2

		local var_207_0 = {
			zh = 9.2,
			ja = 8.933
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
				arg_207_0:Play117101053(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1033"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos1033 = var_210_0.localPosition
				var_210_0.localScale = Vector3.New(1, 1, 1)

				arg_207_1:CheckSpriteTmpPos("1033", 2)

				local var_210_2 = var_210_0.childCount

				for iter_210_0 = 0, var_210_2 - 1 do
					local var_210_3 = var_210_0:GetChild(iter_210_0)

					if var_210_3.name == "split_6" or not string.find(var_210_3.name, "split") then
						var_210_3.gameObject:SetActive(true)
					else
						var_210_3.gameObject:SetActive(false)
					end
				end
			end

			local var_210_4 = 0.001

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_4 then
				local var_210_5 = (arg_207_1.time_ - var_210_1) / var_210_4
				local var_210_6 = Vector3.New(-390, -420, 0)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1033, var_210_6, var_210_5)
			end

			if arg_207_1.time_ >= var_210_1 + var_210_4 and arg_207_1.time_ < var_210_1 + var_210_4 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_210_7 = arg_207_1.actors_["1033"]
			local var_210_8 = 0

			if var_210_8 < arg_207_1.time_ and arg_207_1.time_ <= var_210_8 + arg_210_0 and arg_207_1.var_.actorSpriteComps1033 == nil then
				arg_207_1.var_.actorSpriteComps1033 = var_210_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_210_9 = 0.2

			if var_210_8 <= arg_207_1.time_ and arg_207_1.time_ < var_210_8 + var_210_9 then
				local var_210_10 = (arg_207_1.time_ - var_210_8) / var_210_9

				if arg_207_1.var_.actorSpriteComps1033 then
					for iter_210_1, iter_210_2 in pairs(arg_207_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_210_2 then
							local var_210_11 = Mathf.Lerp(iter_210_2.color.r, 1, var_210_10)

							iter_210_2.color = Color.New(var_210_11, var_210_11, var_210_11)
						end
					end
				end
			end

			if arg_207_1.time_ >= var_210_8 + var_210_9 and arg_207_1.time_ < var_210_8 + var_210_9 + arg_210_0 and arg_207_1.var_.actorSpriteComps1033 then
				local var_210_12 = 1

				for iter_210_3, iter_210_4 in pairs(arg_207_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_210_4 then
						iter_210_4.color = Color.New(var_210_12, var_210_12, var_210_12)
					end
				end

				arg_207_1.var_.actorSpriteComps1033 = nil
			end

			local var_210_13 = arg_207_1.actors_["10034"]
			local var_210_14 = 0

			if var_210_14 < arg_207_1.time_ and arg_207_1.time_ <= var_210_14 + arg_210_0 and arg_207_1.var_.actorSpriteComps10034 == nil then
				arg_207_1.var_.actorSpriteComps10034 = var_210_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_210_15 = 0.2

			if var_210_14 <= arg_207_1.time_ and arg_207_1.time_ < var_210_14 + var_210_15 then
				local var_210_16 = (arg_207_1.time_ - var_210_14) / var_210_15

				if arg_207_1.var_.actorSpriteComps10034 then
					for iter_210_5, iter_210_6 in pairs(arg_207_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_210_6 then
							local var_210_17 = Mathf.Lerp(iter_210_6.color.r, 0.5, var_210_16)

							iter_210_6.color = Color.New(var_210_17, var_210_17, var_210_17)
						end
					end
				end
			end

			if arg_207_1.time_ >= var_210_14 + var_210_15 and arg_207_1.time_ < var_210_14 + var_210_15 + arg_210_0 and arg_207_1.var_.actorSpriteComps10034 then
				local var_210_18 = 0.5

				for iter_210_7, iter_210_8 in pairs(arg_207_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_210_8 then
						iter_210_8.color = Color.New(var_210_18, var_210_18, var_210_18)
					end
				end

				arg_207_1.var_.actorSpriteComps10034 = nil
			end

			local var_210_19 = 0
			local var_210_20 = 1.15

			if var_210_19 < arg_207_1.time_ and arg_207_1.time_ <= var_210_19 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_21 = arg_207_1:FormatText(StoryNameCfg[236].name)

				arg_207_1.leftNameTxt_.text = var_210_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_22 = arg_207_1:GetWordFromCfg(117101052)
				local var_210_23 = arg_207_1:FormatText(var_210_22.content)

				arg_207_1.text_.text = var_210_23

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_24 = 46
				local var_210_25 = utf8.len(var_210_23)
				local var_210_26 = var_210_24 <= 0 and var_210_20 or var_210_20 * (var_210_25 / var_210_24)

				if var_210_26 > 0 and var_210_20 < var_210_26 then
					arg_207_1.talkMaxDuration = var_210_26

					if var_210_26 + var_210_19 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_26 + var_210_19
					end
				end

				arg_207_1.text_.text = var_210_23
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101052", "story_v_out_117101.awb") ~= 0 then
					local var_210_27 = manager.audio:GetVoiceLength("story_v_out_117101", "117101052", "story_v_out_117101.awb") / 1000

					if var_210_27 + var_210_19 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_27 + var_210_19
					end

					if var_210_22.prefab_name ~= "" and arg_207_1.actors_[var_210_22.prefab_name] ~= nil then
						local var_210_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_22.prefab_name].transform, "story_v_out_117101", "117101052", "story_v_out_117101.awb")

						arg_207_1:RecordAudio("117101052", var_210_28)
						arg_207_1:RecordAudio("117101052", var_210_28)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_117101", "117101052", "story_v_out_117101.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_117101", "117101052", "story_v_out_117101.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_29 = math.max(var_210_20, arg_207_1.talkMaxDuration)

			if var_210_19 <= arg_207_1.time_ and arg_207_1.time_ < var_210_19 + var_210_29 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_19) / var_210_29

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_19 + var_210_29 and arg_207_1.time_ < var_210_19 + var_210_29 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play117101053 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 117101053
		arg_211_1.duration_ = 11.7

		local var_211_0 = {
			zh = 7.966,
			ja = 11.7
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
				arg_211_0:Play117101054(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 1.05

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_2 = arg_211_1:FormatText(StoryNameCfg[236].name)

				arg_211_1.leftNameTxt_.text = var_214_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_3 = arg_211_1:GetWordFromCfg(117101053)
				local var_214_4 = arg_211_1:FormatText(var_214_3.content)

				arg_211_1.text_.text = var_214_4

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_5 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101053", "story_v_out_117101.awb") ~= 0 then
					local var_214_8 = manager.audio:GetVoiceLength("story_v_out_117101", "117101053", "story_v_out_117101.awb") / 1000

					if var_214_8 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_8 + var_214_0
					end

					if var_214_3.prefab_name ~= "" and arg_211_1.actors_[var_214_3.prefab_name] ~= nil then
						local var_214_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_3.prefab_name].transform, "story_v_out_117101", "117101053", "story_v_out_117101.awb")

						arg_211_1:RecordAudio("117101053", var_214_9)
						arg_211_1:RecordAudio("117101053", var_214_9)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_117101", "117101053", "story_v_out_117101.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_117101", "117101053", "story_v_out_117101.awb")
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
	Play117101054 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 117101054
		arg_215_1.duration_ = 3.066

		local var_215_0 = {
			zh = 2.4,
			ja = 3.066
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
				arg_215_0:Play117101055(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["10034"].transform
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 then
				arg_215_1.var_.moveOldPos10034 = var_218_0.localPosition
				var_218_0.localScale = Vector3.New(1, 1, 1)

				arg_215_1:CheckSpriteTmpPos("10034", 4)

				local var_218_2 = var_218_0.childCount

				for iter_218_0 = 0, var_218_2 - 1 do
					local var_218_3 = var_218_0:GetChild(iter_218_0)

					if var_218_3.name == "split_3" or not string.find(var_218_3.name, "split") then
						var_218_3.gameObject:SetActive(true)
					else
						var_218_3.gameObject:SetActive(false)
					end
				end
			end

			local var_218_4 = 0.001

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_4 then
				local var_218_5 = (arg_215_1.time_ - var_218_1) / var_218_4
				local var_218_6 = Vector3.New(390, -415, -290)

				var_218_0.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos10034, var_218_6, var_218_5)
			end

			if arg_215_1.time_ >= var_218_1 + var_218_4 and arg_215_1.time_ < var_218_1 + var_218_4 + arg_218_0 then
				var_218_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_218_7 = arg_215_1.actors_["1033"]
			local var_218_8 = 0

			if var_218_8 < arg_215_1.time_ and arg_215_1.time_ <= var_218_8 + arg_218_0 and arg_215_1.var_.actorSpriteComps1033 == nil then
				arg_215_1.var_.actorSpriteComps1033 = var_218_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_218_9 = 0.2

			if var_218_8 <= arg_215_1.time_ and arg_215_1.time_ < var_218_8 + var_218_9 then
				local var_218_10 = (arg_215_1.time_ - var_218_8) / var_218_9

				if arg_215_1.var_.actorSpriteComps1033 then
					for iter_218_1, iter_218_2 in pairs(arg_215_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_218_2 then
							local var_218_11 = Mathf.Lerp(iter_218_2.color.r, 0.5, var_218_10)

							iter_218_2.color = Color.New(var_218_11, var_218_11, var_218_11)
						end
					end
				end
			end

			if arg_215_1.time_ >= var_218_8 + var_218_9 and arg_215_1.time_ < var_218_8 + var_218_9 + arg_218_0 and arg_215_1.var_.actorSpriteComps1033 then
				local var_218_12 = 0.5

				for iter_218_3, iter_218_4 in pairs(arg_215_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_218_4 then
						iter_218_4.color = Color.New(var_218_12, var_218_12, var_218_12)
					end
				end

				arg_215_1.var_.actorSpriteComps1033 = nil
			end

			local var_218_13 = arg_215_1.actors_["10034"]
			local var_218_14 = 0

			if var_218_14 < arg_215_1.time_ and arg_215_1.time_ <= var_218_14 + arg_218_0 and arg_215_1.var_.actorSpriteComps10034 == nil then
				arg_215_1.var_.actorSpriteComps10034 = var_218_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_218_15 = 0.2

			if var_218_14 <= arg_215_1.time_ and arg_215_1.time_ < var_218_14 + var_218_15 then
				local var_218_16 = (arg_215_1.time_ - var_218_14) / var_218_15

				if arg_215_1.var_.actorSpriteComps10034 then
					for iter_218_5, iter_218_6 in pairs(arg_215_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_218_6 then
							local var_218_17 = Mathf.Lerp(iter_218_6.color.r, 1, var_218_16)

							iter_218_6.color = Color.New(var_218_17, var_218_17, var_218_17)
						end
					end
				end
			end

			if arg_215_1.time_ >= var_218_14 + var_218_15 and arg_215_1.time_ < var_218_14 + var_218_15 + arg_218_0 and arg_215_1.var_.actorSpriteComps10034 then
				local var_218_18 = 1

				for iter_218_7, iter_218_8 in pairs(arg_215_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_218_8 then
						iter_218_8.color = Color.New(var_218_18, var_218_18, var_218_18)
					end
				end

				arg_215_1.var_.actorSpriteComps10034 = nil
			end

			local var_218_19 = 0
			local var_218_20 = 0.275

			if var_218_19 < arg_215_1.time_ and arg_215_1.time_ <= var_218_19 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_21 = arg_215_1:FormatText(StoryNameCfg[367].name)

				arg_215_1.leftNameTxt_.text = var_218_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_22 = arg_215_1:GetWordFromCfg(117101054)
				local var_218_23 = arg_215_1:FormatText(var_218_22.content)

				arg_215_1.text_.text = var_218_23

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_24 = 11
				local var_218_25 = utf8.len(var_218_23)
				local var_218_26 = var_218_24 <= 0 and var_218_20 or var_218_20 * (var_218_25 / var_218_24)

				if var_218_26 > 0 and var_218_20 < var_218_26 then
					arg_215_1.talkMaxDuration = var_218_26

					if var_218_26 + var_218_19 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_26 + var_218_19
					end
				end

				arg_215_1.text_.text = var_218_23
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101054", "story_v_out_117101.awb") ~= 0 then
					local var_218_27 = manager.audio:GetVoiceLength("story_v_out_117101", "117101054", "story_v_out_117101.awb") / 1000

					if var_218_27 + var_218_19 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_27 + var_218_19
					end

					if var_218_22.prefab_name ~= "" and arg_215_1.actors_[var_218_22.prefab_name] ~= nil then
						local var_218_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_22.prefab_name].transform, "story_v_out_117101", "117101054", "story_v_out_117101.awb")

						arg_215_1:RecordAudio("117101054", var_218_28)
						arg_215_1:RecordAudio("117101054", var_218_28)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_117101", "117101054", "story_v_out_117101.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_117101", "117101054", "story_v_out_117101.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_29 = math.max(var_218_20, arg_215_1.talkMaxDuration)

			if var_218_19 <= arg_215_1.time_ and arg_215_1.time_ < var_218_19 + var_218_29 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_19) / var_218_29

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_19 + var_218_29 and arg_215_1.time_ < var_218_19 + var_218_29 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play117101055 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 117101055
		arg_219_1.duration_ = 4.5

		local var_219_0 = {
			zh = 3.633,
			ja = 4.5
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
				arg_219_0:Play117101056(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1033"]
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 and arg_219_1.var_.actorSpriteComps1033 == nil then
				arg_219_1.var_.actorSpriteComps1033 = var_222_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_2 = 0.2

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2

				if arg_219_1.var_.actorSpriteComps1033 then
					for iter_222_0, iter_222_1 in pairs(arg_219_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_222_1 then
							local var_222_4 = Mathf.Lerp(iter_222_1.color.r, 1, var_222_3)

							iter_222_1.color = Color.New(var_222_4, var_222_4, var_222_4)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 and arg_219_1.var_.actorSpriteComps1033 then
				local var_222_5 = 1

				for iter_222_2, iter_222_3 in pairs(arg_219_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_222_3 then
						iter_222_3.color = Color.New(var_222_5, var_222_5, var_222_5)
					end
				end

				arg_219_1.var_.actorSpriteComps1033 = nil
			end

			local var_222_6 = arg_219_1.actors_["10034"]
			local var_222_7 = 0

			if var_222_7 < arg_219_1.time_ and arg_219_1.time_ <= var_222_7 + arg_222_0 and arg_219_1.var_.actorSpriteComps10034 == nil then
				arg_219_1.var_.actorSpriteComps10034 = var_222_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_8 = 0.2

			if var_222_7 <= arg_219_1.time_ and arg_219_1.time_ < var_222_7 + var_222_8 then
				local var_222_9 = (arg_219_1.time_ - var_222_7) / var_222_8

				if arg_219_1.var_.actorSpriteComps10034 then
					for iter_222_4, iter_222_5 in pairs(arg_219_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_222_5 then
							local var_222_10 = Mathf.Lerp(iter_222_5.color.r, 0.5, var_222_9)

							iter_222_5.color = Color.New(var_222_10, var_222_10, var_222_10)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_7 + var_222_8 and arg_219_1.time_ < var_222_7 + var_222_8 + arg_222_0 and arg_219_1.var_.actorSpriteComps10034 then
				local var_222_11 = 0.5

				for iter_222_6, iter_222_7 in pairs(arg_219_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_222_7 then
						iter_222_7.color = Color.New(var_222_11, var_222_11, var_222_11)
					end
				end

				arg_219_1.var_.actorSpriteComps10034 = nil
			end

			local var_222_12 = 0
			local var_222_13 = 0.375

			if var_222_12 < arg_219_1.time_ and arg_219_1.time_ <= var_222_12 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_14 = arg_219_1:FormatText(StoryNameCfg[236].name)

				arg_219_1.leftNameTxt_.text = var_222_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_15 = arg_219_1:GetWordFromCfg(117101055)
				local var_222_16 = arg_219_1:FormatText(var_222_15.content)

				arg_219_1.text_.text = var_222_16

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_17 = 15
				local var_222_18 = utf8.len(var_222_16)
				local var_222_19 = var_222_17 <= 0 and var_222_13 or var_222_13 * (var_222_18 / var_222_17)

				if var_222_19 > 0 and var_222_13 < var_222_19 then
					arg_219_1.talkMaxDuration = var_222_19

					if var_222_19 + var_222_12 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_19 + var_222_12
					end
				end

				arg_219_1.text_.text = var_222_16
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101055", "story_v_out_117101.awb") ~= 0 then
					local var_222_20 = manager.audio:GetVoiceLength("story_v_out_117101", "117101055", "story_v_out_117101.awb") / 1000

					if var_222_20 + var_222_12 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_20 + var_222_12
					end

					if var_222_15.prefab_name ~= "" and arg_219_1.actors_[var_222_15.prefab_name] ~= nil then
						local var_222_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_15.prefab_name].transform, "story_v_out_117101", "117101055", "story_v_out_117101.awb")

						arg_219_1:RecordAudio("117101055", var_222_21)
						arg_219_1:RecordAudio("117101055", var_222_21)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_117101", "117101055", "story_v_out_117101.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_117101", "117101055", "story_v_out_117101.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_22 = math.max(var_222_13, arg_219_1.talkMaxDuration)

			if var_222_12 <= arg_219_1.time_ and arg_219_1.time_ < var_222_12 + var_222_22 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_12) / var_222_22

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_12 + var_222_22 and arg_219_1.time_ < var_222_12 + var_222_22 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play117101056 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 117101056
		arg_223_1.duration_ = 1.6

		local var_223_0 = {
			zh = 1.133,
			ja = 1.6
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
				arg_223_0:Play117101057(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["10034"].transform
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.var_.moveOldPos10034 = var_226_0.localPosition
				var_226_0.localScale = Vector3.New(1, 1, 1)

				arg_223_1:CheckSpriteTmpPos("10034", 4)

				local var_226_2 = var_226_0.childCount

				for iter_226_0 = 0, var_226_2 - 1 do
					local var_226_3 = var_226_0:GetChild(iter_226_0)

					if var_226_3.name == "split_2" or not string.find(var_226_3.name, "split") then
						var_226_3.gameObject:SetActive(true)
					else
						var_226_3.gameObject:SetActive(false)
					end
				end
			end

			local var_226_4 = 0.001

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_4 then
				local var_226_5 = (arg_223_1.time_ - var_226_1) / var_226_4
				local var_226_6 = Vector3.New(390, -415, -290)

				var_226_0.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos10034, var_226_6, var_226_5)
			end

			if arg_223_1.time_ >= var_226_1 + var_226_4 and arg_223_1.time_ < var_226_1 + var_226_4 + arg_226_0 then
				var_226_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_226_7 = arg_223_1.actors_["1033"]
			local var_226_8 = 0

			if var_226_8 < arg_223_1.time_ and arg_223_1.time_ <= var_226_8 + arg_226_0 and arg_223_1.var_.actorSpriteComps1033 == nil then
				arg_223_1.var_.actorSpriteComps1033 = var_226_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_226_9 = 0.2

			if var_226_8 <= arg_223_1.time_ and arg_223_1.time_ < var_226_8 + var_226_9 then
				local var_226_10 = (arg_223_1.time_ - var_226_8) / var_226_9

				if arg_223_1.var_.actorSpriteComps1033 then
					for iter_226_1, iter_226_2 in pairs(arg_223_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_226_2 then
							local var_226_11 = Mathf.Lerp(iter_226_2.color.r, 0.5, var_226_10)

							iter_226_2.color = Color.New(var_226_11, var_226_11, var_226_11)
						end
					end
				end
			end

			if arg_223_1.time_ >= var_226_8 + var_226_9 and arg_223_1.time_ < var_226_8 + var_226_9 + arg_226_0 and arg_223_1.var_.actorSpriteComps1033 then
				local var_226_12 = 0.5

				for iter_226_3, iter_226_4 in pairs(arg_223_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_226_4 then
						iter_226_4.color = Color.New(var_226_12, var_226_12, var_226_12)
					end
				end

				arg_223_1.var_.actorSpriteComps1033 = nil
			end

			local var_226_13 = arg_223_1.actors_["10034"]
			local var_226_14 = 0

			if var_226_14 < arg_223_1.time_ and arg_223_1.time_ <= var_226_14 + arg_226_0 and arg_223_1.var_.actorSpriteComps10034 == nil then
				arg_223_1.var_.actorSpriteComps10034 = var_226_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_226_15 = 0.2

			if var_226_14 <= arg_223_1.time_ and arg_223_1.time_ < var_226_14 + var_226_15 then
				local var_226_16 = (arg_223_1.time_ - var_226_14) / var_226_15

				if arg_223_1.var_.actorSpriteComps10034 then
					for iter_226_5, iter_226_6 in pairs(arg_223_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_226_6 then
							local var_226_17 = Mathf.Lerp(iter_226_6.color.r, 1, var_226_16)

							iter_226_6.color = Color.New(var_226_17, var_226_17, var_226_17)
						end
					end
				end
			end

			if arg_223_1.time_ >= var_226_14 + var_226_15 and arg_223_1.time_ < var_226_14 + var_226_15 + arg_226_0 and arg_223_1.var_.actorSpriteComps10034 then
				local var_226_18 = 1

				for iter_226_7, iter_226_8 in pairs(arg_223_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_226_8 then
						iter_226_8.color = Color.New(var_226_18, var_226_18, var_226_18)
					end
				end

				arg_223_1.var_.actorSpriteComps10034 = nil
			end

			local var_226_19 = 0
			local var_226_20 = 0.1

			if var_226_19 < arg_223_1.time_ and arg_223_1.time_ <= var_226_19 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_21 = arg_223_1:FormatText(StoryNameCfg[367].name)

				arg_223_1.leftNameTxt_.text = var_226_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_22 = arg_223_1:GetWordFromCfg(117101056)
				local var_226_23 = arg_223_1:FormatText(var_226_22.content)

				arg_223_1.text_.text = var_226_23

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_24 = 4
				local var_226_25 = utf8.len(var_226_23)
				local var_226_26 = var_226_24 <= 0 and var_226_20 or var_226_20 * (var_226_25 / var_226_24)

				if var_226_26 > 0 and var_226_20 < var_226_26 then
					arg_223_1.talkMaxDuration = var_226_26

					if var_226_26 + var_226_19 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_26 + var_226_19
					end
				end

				arg_223_1.text_.text = var_226_23
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101056", "story_v_out_117101.awb") ~= 0 then
					local var_226_27 = manager.audio:GetVoiceLength("story_v_out_117101", "117101056", "story_v_out_117101.awb") / 1000

					if var_226_27 + var_226_19 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_27 + var_226_19
					end

					if var_226_22.prefab_name ~= "" and arg_223_1.actors_[var_226_22.prefab_name] ~= nil then
						local var_226_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_22.prefab_name].transform, "story_v_out_117101", "117101056", "story_v_out_117101.awb")

						arg_223_1:RecordAudio("117101056", var_226_28)
						arg_223_1:RecordAudio("117101056", var_226_28)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_117101", "117101056", "story_v_out_117101.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_117101", "117101056", "story_v_out_117101.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_29 = math.max(var_226_20, arg_223_1.talkMaxDuration)

			if var_226_19 <= arg_223_1.time_ and arg_223_1.time_ < var_226_19 + var_226_29 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_19) / var_226_29

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_19 + var_226_29 and arg_223_1.time_ < var_226_19 + var_226_29 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play117101057 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 117101057
		arg_227_1.duration_ = 12.2

		local var_227_0 = {
			zh = 11,
			ja = 12.2
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
				arg_227_0:Play117101058(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1033"].transform
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1.var_.moveOldPos1033 = var_230_0.localPosition
				var_230_0.localScale = Vector3.New(1, 1, 1)

				arg_227_1:CheckSpriteTmpPos("1033", 2)

				local var_230_2 = var_230_0.childCount

				for iter_230_0 = 0, var_230_2 - 1 do
					local var_230_3 = var_230_0:GetChild(iter_230_0)

					if var_230_3.name == "split_6" or not string.find(var_230_3.name, "split") then
						var_230_3.gameObject:SetActive(true)
					else
						var_230_3.gameObject:SetActive(false)
					end
				end
			end

			local var_230_4 = 0.001

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_4 then
				local var_230_5 = (arg_227_1.time_ - var_230_1) / var_230_4
				local var_230_6 = Vector3.New(-390, -420, 0)

				var_230_0.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos1033, var_230_6, var_230_5)
			end

			if arg_227_1.time_ >= var_230_1 + var_230_4 and arg_227_1.time_ < var_230_1 + var_230_4 + arg_230_0 then
				var_230_0.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_230_7 = arg_227_1.actors_["1033"]
			local var_230_8 = 0

			if var_230_8 < arg_227_1.time_ and arg_227_1.time_ <= var_230_8 + arg_230_0 and arg_227_1.var_.actorSpriteComps1033 == nil then
				arg_227_1.var_.actorSpriteComps1033 = var_230_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_230_9 = 0.2

			if var_230_8 <= arg_227_1.time_ and arg_227_1.time_ < var_230_8 + var_230_9 then
				local var_230_10 = (arg_227_1.time_ - var_230_8) / var_230_9

				if arg_227_1.var_.actorSpriteComps1033 then
					for iter_230_1, iter_230_2 in pairs(arg_227_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_230_2 then
							local var_230_11 = Mathf.Lerp(iter_230_2.color.r, 1, var_230_10)

							iter_230_2.color = Color.New(var_230_11, var_230_11, var_230_11)
						end
					end
				end
			end

			if arg_227_1.time_ >= var_230_8 + var_230_9 and arg_227_1.time_ < var_230_8 + var_230_9 + arg_230_0 and arg_227_1.var_.actorSpriteComps1033 then
				local var_230_12 = 1

				for iter_230_3, iter_230_4 in pairs(arg_227_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_230_4 then
						iter_230_4.color = Color.New(var_230_12, var_230_12, var_230_12)
					end
				end

				arg_227_1.var_.actorSpriteComps1033 = nil
			end

			local var_230_13 = arg_227_1.actors_["10034"]
			local var_230_14 = 0

			if var_230_14 < arg_227_1.time_ and arg_227_1.time_ <= var_230_14 + arg_230_0 and arg_227_1.var_.actorSpriteComps10034 == nil then
				arg_227_1.var_.actorSpriteComps10034 = var_230_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_230_15 = 0.2

			if var_230_14 <= arg_227_1.time_ and arg_227_1.time_ < var_230_14 + var_230_15 then
				local var_230_16 = (arg_227_1.time_ - var_230_14) / var_230_15

				if arg_227_1.var_.actorSpriteComps10034 then
					for iter_230_5, iter_230_6 in pairs(arg_227_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_230_6 then
							local var_230_17 = Mathf.Lerp(iter_230_6.color.r, 0.5, var_230_16)

							iter_230_6.color = Color.New(var_230_17, var_230_17, var_230_17)
						end
					end
				end
			end

			if arg_227_1.time_ >= var_230_14 + var_230_15 and arg_227_1.time_ < var_230_14 + var_230_15 + arg_230_0 and arg_227_1.var_.actorSpriteComps10034 then
				local var_230_18 = 0.5

				for iter_230_7, iter_230_8 in pairs(arg_227_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_230_8 then
						iter_230_8.color = Color.New(var_230_18, var_230_18, var_230_18)
					end
				end

				arg_227_1.var_.actorSpriteComps10034 = nil
			end

			local var_230_19 = 0
			local var_230_20 = 1.5

			if var_230_19 < arg_227_1.time_ and arg_227_1.time_ <= var_230_19 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_21 = arg_227_1:FormatText(StoryNameCfg[236].name)

				arg_227_1.leftNameTxt_.text = var_230_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_22 = arg_227_1:GetWordFromCfg(117101057)
				local var_230_23 = arg_227_1:FormatText(var_230_22.content)

				arg_227_1.text_.text = var_230_23

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_24 = 60
				local var_230_25 = utf8.len(var_230_23)
				local var_230_26 = var_230_24 <= 0 and var_230_20 or var_230_20 * (var_230_25 / var_230_24)

				if var_230_26 > 0 and var_230_20 < var_230_26 then
					arg_227_1.talkMaxDuration = var_230_26

					if var_230_26 + var_230_19 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_26 + var_230_19
					end
				end

				arg_227_1.text_.text = var_230_23
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101057", "story_v_out_117101.awb") ~= 0 then
					local var_230_27 = manager.audio:GetVoiceLength("story_v_out_117101", "117101057", "story_v_out_117101.awb") / 1000

					if var_230_27 + var_230_19 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_27 + var_230_19
					end

					if var_230_22.prefab_name ~= "" and arg_227_1.actors_[var_230_22.prefab_name] ~= nil then
						local var_230_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_22.prefab_name].transform, "story_v_out_117101", "117101057", "story_v_out_117101.awb")

						arg_227_1:RecordAudio("117101057", var_230_28)
						arg_227_1:RecordAudio("117101057", var_230_28)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_117101", "117101057", "story_v_out_117101.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_117101", "117101057", "story_v_out_117101.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_29 = math.max(var_230_20, arg_227_1.talkMaxDuration)

			if var_230_19 <= arg_227_1.time_ and arg_227_1.time_ < var_230_19 + var_230_29 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_19) / var_230_29

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_19 + var_230_29 and arg_227_1.time_ < var_230_19 + var_230_29 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play117101058 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 117101058
		arg_231_1.duration_ = 7.333

		local var_231_0 = {
			zh = 5.333,
			ja = 7.333
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
				arg_231_0:Play117101059(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0
			local var_234_1 = 0.75

			if var_234_0 < arg_231_1.time_ and arg_231_1.time_ <= var_234_0 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_2 = arg_231_1:FormatText(StoryNameCfg[236].name)

				arg_231_1.leftNameTxt_.text = var_234_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_3 = arg_231_1:GetWordFromCfg(117101058)
				local var_234_4 = arg_231_1:FormatText(var_234_3.content)

				arg_231_1.text_.text = var_234_4

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101058", "story_v_out_117101.awb") ~= 0 then
					local var_234_8 = manager.audio:GetVoiceLength("story_v_out_117101", "117101058", "story_v_out_117101.awb") / 1000

					if var_234_8 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_8 + var_234_0
					end

					if var_234_3.prefab_name ~= "" and arg_231_1.actors_[var_234_3.prefab_name] ~= nil then
						local var_234_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_3.prefab_name].transform, "story_v_out_117101", "117101058", "story_v_out_117101.awb")

						arg_231_1:RecordAudio("117101058", var_234_9)
						arg_231_1:RecordAudio("117101058", var_234_9)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_117101", "117101058", "story_v_out_117101.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_117101", "117101058", "story_v_out_117101.awb")
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
	Play117101059 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 117101059
		arg_235_1.duration_ = 1.466

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play117101060(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["10034"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos10034 = var_238_0.localPosition
				var_238_0.localScale = Vector3.New(1, 1, 1)

				arg_235_1:CheckSpriteTmpPos("10034", 4)

				local var_238_2 = var_238_0.childCount

				for iter_238_0 = 0, var_238_2 - 1 do
					local var_238_3 = var_238_0:GetChild(iter_238_0)

					if var_238_3.name == "split_2" or not string.find(var_238_3.name, "split") then
						var_238_3.gameObject:SetActive(true)
					else
						var_238_3.gameObject:SetActive(false)
					end
				end
			end

			local var_238_4 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_4 then
				local var_238_5 = (arg_235_1.time_ - var_238_1) / var_238_4
				local var_238_6 = Vector3.New(390, -415, -290)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos10034, var_238_6, var_238_5)
			end

			if arg_235_1.time_ >= var_238_1 + var_238_4 and arg_235_1.time_ < var_238_1 + var_238_4 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_238_7 = arg_235_1.actors_["1033"]
			local var_238_8 = 0

			if var_238_8 < arg_235_1.time_ and arg_235_1.time_ <= var_238_8 + arg_238_0 and arg_235_1.var_.actorSpriteComps1033 == nil then
				arg_235_1.var_.actorSpriteComps1033 = var_238_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_238_9 = 0.2

			if var_238_8 <= arg_235_1.time_ and arg_235_1.time_ < var_238_8 + var_238_9 then
				local var_238_10 = (arg_235_1.time_ - var_238_8) / var_238_9

				if arg_235_1.var_.actorSpriteComps1033 then
					for iter_238_1, iter_238_2 in pairs(arg_235_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_238_2 then
							local var_238_11 = Mathf.Lerp(iter_238_2.color.r, 0.5, var_238_10)

							iter_238_2.color = Color.New(var_238_11, var_238_11, var_238_11)
						end
					end
				end
			end

			if arg_235_1.time_ >= var_238_8 + var_238_9 and arg_235_1.time_ < var_238_8 + var_238_9 + arg_238_0 and arg_235_1.var_.actorSpriteComps1033 then
				local var_238_12 = 0.5

				for iter_238_3, iter_238_4 in pairs(arg_235_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_238_4 then
						iter_238_4.color = Color.New(var_238_12, var_238_12, var_238_12)
					end
				end

				arg_235_1.var_.actorSpriteComps1033 = nil
			end

			local var_238_13 = arg_235_1.actors_["10034"]
			local var_238_14 = 0

			if var_238_14 < arg_235_1.time_ and arg_235_1.time_ <= var_238_14 + arg_238_0 and arg_235_1.var_.actorSpriteComps10034 == nil then
				arg_235_1.var_.actorSpriteComps10034 = var_238_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_238_15 = 0.2

			if var_238_14 <= arg_235_1.time_ and arg_235_1.time_ < var_238_14 + var_238_15 then
				local var_238_16 = (arg_235_1.time_ - var_238_14) / var_238_15

				if arg_235_1.var_.actorSpriteComps10034 then
					for iter_238_5, iter_238_6 in pairs(arg_235_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_238_6 then
							local var_238_17 = Mathf.Lerp(iter_238_6.color.r, 1, var_238_16)

							iter_238_6.color = Color.New(var_238_17, var_238_17, var_238_17)
						end
					end
				end
			end

			if arg_235_1.time_ >= var_238_14 + var_238_15 and arg_235_1.time_ < var_238_14 + var_238_15 + arg_238_0 and arg_235_1.var_.actorSpriteComps10034 then
				local var_238_18 = 1

				for iter_238_7, iter_238_8 in pairs(arg_235_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_238_8 then
						iter_238_8.color = Color.New(var_238_18, var_238_18, var_238_18)
					end
				end

				arg_235_1.var_.actorSpriteComps10034 = nil
			end

			local var_238_19 = 0
			local var_238_20 = 0.175

			if var_238_19 < arg_235_1.time_ and arg_235_1.time_ <= var_238_19 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_21 = arg_235_1:FormatText(StoryNameCfg[367].name)

				arg_235_1.leftNameTxt_.text = var_238_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_22 = arg_235_1:GetWordFromCfg(117101059)
				local var_238_23 = arg_235_1:FormatText(var_238_22.content)

				arg_235_1.text_.text = var_238_23

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_24 = 7
				local var_238_25 = utf8.len(var_238_23)
				local var_238_26 = var_238_24 <= 0 and var_238_20 or var_238_20 * (var_238_25 / var_238_24)

				if var_238_26 > 0 and var_238_20 < var_238_26 then
					arg_235_1.talkMaxDuration = var_238_26

					if var_238_26 + var_238_19 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_26 + var_238_19
					end
				end

				arg_235_1.text_.text = var_238_23
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101059", "story_v_out_117101.awb") ~= 0 then
					local var_238_27 = manager.audio:GetVoiceLength("story_v_out_117101", "117101059", "story_v_out_117101.awb") / 1000

					if var_238_27 + var_238_19 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_27 + var_238_19
					end

					if var_238_22.prefab_name ~= "" and arg_235_1.actors_[var_238_22.prefab_name] ~= nil then
						local var_238_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_22.prefab_name].transform, "story_v_out_117101", "117101059", "story_v_out_117101.awb")

						arg_235_1:RecordAudio("117101059", var_238_28)
						arg_235_1:RecordAudio("117101059", var_238_28)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_117101", "117101059", "story_v_out_117101.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_117101", "117101059", "story_v_out_117101.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_29 = math.max(var_238_20, arg_235_1.talkMaxDuration)

			if var_238_19 <= arg_235_1.time_ and arg_235_1.time_ < var_238_19 + var_238_29 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_19) / var_238_29

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_19 + var_238_29 and arg_235_1.time_ < var_238_19 + var_238_29 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play117101060 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 117101060
		arg_239_1.duration_ = 5

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play117101061(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["10034"]
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				local var_242_2 = var_242_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_242_2 then
					arg_239_1.var_.alphaOldValue10034 = var_242_2.alpha
					arg_239_1.var_.characterEffect10034 = var_242_2
				end

				arg_239_1.var_.alphaOldValue10034 = 1
			end

			local var_242_3 = 0.333333333333333

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_3 then
				local var_242_4 = (arg_239_1.time_ - var_242_1) / var_242_3
				local var_242_5 = Mathf.Lerp(arg_239_1.var_.alphaOldValue10034, 0, var_242_4)

				if arg_239_1.var_.characterEffect10034 then
					arg_239_1.var_.characterEffect10034.alpha = var_242_5
				end
			end

			if arg_239_1.time_ >= var_242_1 + var_242_3 and arg_239_1.time_ < var_242_1 + var_242_3 + arg_242_0 and arg_239_1.var_.characterEffect10034 then
				arg_239_1.var_.characterEffect10034.alpha = 0
			end

			local var_242_6 = arg_239_1.actors_["1033"]
			local var_242_7 = 0

			if var_242_7 < arg_239_1.time_ and arg_239_1.time_ <= var_242_7 + arg_242_0 then
				local var_242_8 = var_242_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_242_8 then
					arg_239_1.var_.alphaOldValue1033 = var_242_8.alpha
					arg_239_1.var_.characterEffect1033 = var_242_8
				end

				arg_239_1.var_.alphaOldValue1033 = 1
			end

			local var_242_9 = 0.333333333333333

			if var_242_7 <= arg_239_1.time_ and arg_239_1.time_ < var_242_7 + var_242_9 then
				local var_242_10 = (arg_239_1.time_ - var_242_7) / var_242_9
				local var_242_11 = Mathf.Lerp(arg_239_1.var_.alphaOldValue1033, 0, var_242_10)

				if arg_239_1.var_.characterEffect1033 then
					arg_239_1.var_.characterEffect1033.alpha = var_242_11
				end
			end

			if arg_239_1.time_ >= var_242_7 + var_242_9 and arg_239_1.time_ < var_242_7 + var_242_9 + arg_242_0 and arg_239_1.var_.characterEffect1033 then
				arg_239_1.var_.characterEffect1033.alpha = 0
			end

			local var_242_12 = 0
			local var_242_13 = 0.475

			if var_242_12 < arg_239_1.time_ and arg_239_1.time_ <= var_242_12 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, false)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_14 = arg_239_1:GetWordFromCfg(117101060)
				local var_242_15 = arg_239_1:FormatText(var_242_14.content)

				arg_239_1.text_.text = var_242_15

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_16 = 19
				local var_242_17 = utf8.len(var_242_15)
				local var_242_18 = var_242_16 <= 0 and var_242_13 or var_242_13 * (var_242_17 / var_242_16)

				if var_242_18 > 0 and var_242_13 < var_242_18 then
					arg_239_1.talkMaxDuration = var_242_18

					if var_242_18 + var_242_12 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_18 + var_242_12
					end
				end

				arg_239_1.text_.text = var_242_15
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)
				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_19 = math.max(var_242_13, arg_239_1.talkMaxDuration)

			if var_242_12 <= arg_239_1.time_ and arg_239_1.time_ < var_242_12 + var_242_19 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_12) / var_242_19

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_12 + var_242_19 and arg_239_1.time_ < var_242_12 + var_242_19 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play117101061 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 117101061
		arg_243_1.duration_ = 6.166

		local var_243_0 = {
			zh = 2.9,
			ja = 6.166
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
				arg_243_0:Play117101062(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["10034"].transform
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 then
				arg_243_1.var_.moveOldPos10034 = var_246_0.localPosition
				var_246_0.localScale = Vector3.New(1, 1, 1)

				arg_243_1:CheckSpriteTmpPos("10034", 4)

				local var_246_2 = var_246_0.childCount

				for iter_246_0 = 0, var_246_2 - 1 do
					local var_246_3 = var_246_0:GetChild(iter_246_0)

					if var_246_3.name == "split_2" or not string.find(var_246_3.name, "split") then
						var_246_3.gameObject:SetActive(true)
					else
						var_246_3.gameObject:SetActive(false)
					end
				end
			end

			local var_246_4 = 0.001

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_4 then
				local var_246_5 = (arg_243_1.time_ - var_246_1) / var_246_4
				local var_246_6 = Vector3.New(390, -415, -290)

				var_246_0.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos10034, var_246_6, var_246_5)
			end

			if arg_243_1.time_ >= var_246_1 + var_246_4 and arg_243_1.time_ < var_246_1 + var_246_4 + arg_246_0 then
				var_246_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_246_7 = arg_243_1.actors_["1033"].transform
			local var_246_8 = 0

			if var_246_8 < arg_243_1.time_ and arg_243_1.time_ <= var_246_8 + arg_246_0 then
				arg_243_1.var_.moveOldPos1033 = var_246_7.localPosition
				var_246_7.localScale = Vector3.New(1, 1, 1)

				arg_243_1:CheckSpriteTmpPos("1033", 2)

				local var_246_9 = var_246_7.childCount

				for iter_246_1 = 0, var_246_9 - 1 do
					local var_246_10 = var_246_7:GetChild(iter_246_1)

					if var_246_10.name == "split_4" or not string.find(var_246_10.name, "split") then
						var_246_10.gameObject:SetActive(true)
					else
						var_246_10.gameObject:SetActive(false)
					end
				end
			end

			local var_246_11 = 0.001

			if var_246_8 <= arg_243_1.time_ and arg_243_1.time_ < var_246_8 + var_246_11 then
				local var_246_12 = (arg_243_1.time_ - var_246_8) / var_246_11
				local var_246_13 = Vector3.New(-390, -420, 0)

				var_246_7.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos1033, var_246_13, var_246_12)
			end

			if arg_243_1.time_ >= var_246_8 + var_246_11 and arg_243_1.time_ < var_246_8 + var_246_11 + arg_246_0 then
				var_246_7.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_246_14 = arg_243_1.actors_["1033"]
			local var_246_15 = 0

			if var_246_15 < arg_243_1.time_ and arg_243_1.time_ <= var_246_15 + arg_246_0 and arg_243_1.var_.actorSpriteComps1033 == nil then
				arg_243_1.var_.actorSpriteComps1033 = var_246_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_246_16 = 0.2

			if var_246_15 <= arg_243_1.time_ and arg_243_1.time_ < var_246_15 + var_246_16 then
				local var_246_17 = (arg_243_1.time_ - var_246_15) / var_246_16

				if arg_243_1.var_.actorSpriteComps1033 then
					for iter_246_2, iter_246_3 in pairs(arg_243_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_246_3 then
							local var_246_18 = Mathf.Lerp(iter_246_3.color.r, 1, var_246_17)

							iter_246_3.color = Color.New(var_246_18, var_246_18, var_246_18)
						end
					end
				end
			end

			if arg_243_1.time_ >= var_246_15 + var_246_16 and arg_243_1.time_ < var_246_15 + var_246_16 + arg_246_0 and arg_243_1.var_.actorSpriteComps1033 then
				local var_246_19 = 1

				for iter_246_4, iter_246_5 in pairs(arg_243_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_246_5 then
						iter_246_5.color = Color.New(var_246_19, var_246_19, var_246_19)
					end
				end

				arg_243_1.var_.actorSpriteComps1033 = nil
			end

			local var_246_20 = arg_243_1.actors_["10034"]
			local var_246_21 = 0

			if var_246_21 < arg_243_1.time_ and arg_243_1.time_ <= var_246_21 + arg_246_0 then
				local var_246_22 = var_246_20:GetComponentInChildren(typeof(CanvasGroup))

				if var_246_22 then
					arg_243_1.var_.alphaOldValue10034 = var_246_22.alpha
					arg_243_1.var_.characterEffect10034 = var_246_22
				end

				arg_243_1.var_.alphaOldValue10034 = 0
			end

			local var_246_23 = 0.333333333333333

			if var_246_21 <= arg_243_1.time_ and arg_243_1.time_ < var_246_21 + var_246_23 then
				local var_246_24 = (arg_243_1.time_ - var_246_21) / var_246_23
				local var_246_25 = Mathf.Lerp(arg_243_1.var_.alphaOldValue10034, 1, var_246_24)

				if arg_243_1.var_.characterEffect10034 then
					arg_243_1.var_.characterEffect10034.alpha = var_246_25
				end
			end

			if arg_243_1.time_ >= var_246_21 + var_246_23 and arg_243_1.time_ < var_246_21 + var_246_23 + arg_246_0 and arg_243_1.var_.characterEffect10034 then
				arg_243_1.var_.characterEffect10034.alpha = 1
			end

			local var_246_26 = arg_243_1.actors_["1033"]
			local var_246_27 = 0

			if var_246_27 < arg_243_1.time_ and arg_243_1.time_ <= var_246_27 + arg_246_0 then
				local var_246_28 = var_246_26:GetComponentInChildren(typeof(CanvasGroup))

				if var_246_28 then
					arg_243_1.var_.alphaOldValue1033 = var_246_28.alpha
					arg_243_1.var_.characterEffect1033 = var_246_28
				end

				arg_243_1.var_.alphaOldValue1033 = 0
			end

			local var_246_29 = 0.333333333333333

			if var_246_27 <= arg_243_1.time_ and arg_243_1.time_ < var_246_27 + var_246_29 then
				local var_246_30 = (arg_243_1.time_ - var_246_27) / var_246_29
				local var_246_31 = Mathf.Lerp(arg_243_1.var_.alphaOldValue1033, 1, var_246_30)

				if arg_243_1.var_.characterEffect1033 then
					arg_243_1.var_.characterEffect1033.alpha = var_246_31
				end
			end

			if arg_243_1.time_ >= var_246_27 + var_246_29 and arg_243_1.time_ < var_246_27 + var_246_29 + arg_246_0 and arg_243_1.var_.characterEffect1033 then
				arg_243_1.var_.characterEffect1033.alpha = 1
			end

			local var_246_32 = arg_243_1.actors_["10034"]
			local var_246_33 = 0

			if var_246_33 < arg_243_1.time_ and arg_243_1.time_ <= var_246_33 + arg_246_0 and arg_243_1.var_.actorSpriteComps10034 == nil then
				arg_243_1.var_.actorSpriteComps10034 = var_246_32:GetComponentsInChildren(typeof(Image), true)
			end

			local var_246_34 = 0.2

			if var_246_33 <= arg_243_1.time_ and arg_243_1.time_ < var_246_33 + var_246_34 then
				local var_246_35 = (arg_243_1.time_ - var_246_33) / var_246_34

				if arg_243_1.var_.actorSpriteComps10034 then
					for iter_246_6, iter_246_7 in pairs(arg_243_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_246_7 then
							local var_246_36 = Mathf.Lerp(iter_246_7.color.r, 0.5, var_246_35)

							iter_246_7.color = Color.New(var_246_36, var_246_36, var_246_36)
						end
					end
				end
			end

			if arg_243_1.time_ >= var_246_33 + var_246_34 and arg_243_1.time_ < var_246_33 + var_246_34 + arg_246_0 and arg_243_1.var_.actorSpriteComps10034 then
				local var_246_37 = 0.5

				for iter_246_8, iter_246_9 in pairs(arg_243_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_246_9 then
						iter_246_9.color = Color.New(var_246_37, var_246_37, var_246_37)
					end
				end

				arg_243_1.var_.actorSpriteComps10034 = nil
			end

			local var_246_38 = 0
			local var_246_39 = 0.425

			if var_246_38 < arg_243_1.time_ and arg_243_1.time_ <= var_246_38 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_40 = arg_243_1:FormatText(StoryNameCfg[236].name)

				arg_243_1.leftNameTxt_.text = var_246_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_41 = arg_243_1:GetWordFromCfg(117101061)
				local var_246_42 = arg_243_1:FormatText(var_246_41.content)

				arg_243_1.text_.text = var_246_42

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_43 = 17
				local var_246_44 = utf8.len(var_246_42)
				local var_246_45 = var_246_43 <= 0 and var_246_39 or var_246_39 * (var_246_44 / var_246_43)

				if var_246_45 > 0 and var_246_39 < var_246_45 then
					arg_243_1.talkMaxDuration = var_246_45

					if var_246_45 + var_246_38 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_45 + var_246_38
					end
				end

				arg_243_1.text_.text = var_246_42
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101061", "story_v_out_117101.awb") ~= 0 then
					local var_246_46 = manager.audio:GetVoiceLength("story_v_out_117101", "117101061", "story_v_out_117101.awb") / 1000

					if var_246_46 + var_246_38 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_46 + var_246_38
					end

					if var_246_41.prefab_name ~= "" and arg_243_1.actors_[var_246_41.prefab_name] ~= nil then
						local var_246_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_41.prefab_name].transform, "story_v_out_117101", "117101061", "story_v_out_117101.awb")

						arg_243_1:RecordAudio("117101061", var_246_47)
						arg_243_1:RecordAudio("117101061", var_246_47)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_117101", "117101061", "story_v_out_117101.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_117101", "117101061", "story_v_out_117101.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_48 = math.max(var_246_39, arg_243_1.talkMaxDuration)

			if var_246_38 <= arg_243_1.time_ and arg_243_1.time_ < var_246_38 + var_246_48 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_38) / var_246_48

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_38 + var_246_48 and arg_243_1.time_ < var_246_38 + var_246_48 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play117101062 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 117101062
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play117101063(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["10034"].transform
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 then
				arg_247_1.var_.moveOldPos10034 = var_250_0.localPosition
				var_250_0.localScale = Vector3.New(1, 1, 1)

				arg_247_1:CheckSpriteTmpPos("10034", 4)

				local var_250_2 = var_250_0.childCount

				for iter_250_0 = 0, var_250_2 - 1 do
					local var_250_3 = var_250_0:GetChild(iter_250_0)

					if var_250_3.name == "split_2" or not string.find(var_250_3.name, "split") then
						var_250_3.gameObject:SetActive(true)
					else
						var_250_3.gameObject:SetActive(false)
					end
				end
			end

			local var_250_4 = 0.001

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_4 then
				local var_250_5 = (arg_247_1.time_ - var_250_1) / var_250_4
				local var_250_6 = Vector3.New(390, -415, -290)

				var_250_0.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos10034, var_250_6, var_250_5)
			end

			if arg_247_1.time_ >= var_250_1 + var_250_4 and arg_247_1.time_ < var_250_1 + var_250_4 + arg_250_0 then
				var_250_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_250_7 = arg_247_1.actors_["1033"].transform
			local var_250_8 = 0

			if var_250_8 < arg_247_1.time_ and arg_247_1.time_ <= var_250_8 + arg_250_0 then
				arg_247_1.var_.moveOldPos1033 = var_250_7.localPosition
				var_250_7.localScale = Vector3.New(1, 1, 1)

				arg_247_1:CheckSpriteTmpPos("1033", 2)

				local var_250_9 = var_250_7.childCount

				for iter_250_1 = 0, var_250_9 - 1 do
					local var_250_10 = var_250_7:GetChild(iter_250_1)

					if var_250_10.name == "split_4" or not string.find(var_250_10.name, "split") then
						var_250_10.gameObject:SetActive(true)
					else
						var_250_10.gameObject:SetActive(false)
					end
				end
			end

			local var_250_11 = 0.001

			if var_250_8 <= arg_247_1.time_ and arg_247_1.time_ < var_250_8 + var_250_11 then
				local var_250_12 = (arg_247_1.time_ - var_250_8) / var_250_11
				local var_250_13 = Vector3.New(-390, -420, 0)

				var_250_7.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1033, var_250_13, var_250_12)
			end

			if arg_247_1.time_ >= var_250_8 + var_250_11 and arg_247_1.time_ < var_250_8 + var_250_11 + arg_250_0 then
				var_250_7.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_250_14 = arg_247_1.actors_["1033"]
			local var_250_15 = 0

			if var_250_15 < arg_247_1.time_ and arg_247_1.time_ <= var_250_15 + arg_250_0 and arg_247_1.var_.actorSpriteComps1033 == nil then
				arg_247_1.var_.actorSpriteComps1033 = var_250_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_250_16 = 0.2

			if var_250_15 <= arg_247_1.time_ and arg_247_1.time_ < var_250_15 + var_250_16 then
				local var_250_17 = (arg_247_1.time_ - var_250_15) / var_250_16

				if arg_247_1.var_.actorSpriteComps1033 then
					for iter_250_2, iter_250_3 in pairs(arg_247_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_250_3 then
							local var_250_18 = Mathf.Lerp(iter_250_3.color.r, 0.5, var_250_17)

							iter_250_3.color = Color.New(var_250_18, var_250_18, var_250_18)
						end
					end
				end
			end

			if arg_247_1.time_ >= var_250_15 + var_250_16 and arg_247_1.time_ < var_250_15 + var_250_16 + arg_250_0 and arg_247_1.var_.actorSpriteComps1033 then
				local var_250_19 = 0.5

				for iter_250_4, iter_250_5 in pairs(arg_247_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_250_5 then
						iter_250_5.color = Color.New(var_250_19, var_250_19, var_250_19)
					end
				end

				arg_247_1.var_.actorSpriteComps1033 = nil
			end

			local var_250_20 = 0
			local var_250_21 = 0.75

			if var_250_20 < arg_247_1.time_ and arg_247_1.time_ <= var_250_20 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, false)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_22 = arg_247_1:GetWordFromCfg(117101062)
				local var_250_23 = arg_247_1:FormatText(var_250_22.content)

				arg_247_1.text_.text = var_250_23

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_24 = 30
				local var_250_25 = utf8.len(var_250_23)
				local var_250_26 = var_250_24 <= 0 and var_250_21 or var_250_21 * (var_250_25 / var_250_24)

				if var_250_26 > 0 and var_250_21 < var_250_26 then
					arg_247_1.talkMaxDuration = var_250_26

					if var_250_26 + var_250_20 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_26 + var_250_20
					end
				end

				arg_247_1.text_.text = var_250_23
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)
				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_27 = math.max(var_250_21, arg_247_1.talkMaxDuration)

			if var_250_20 <= arg_247_1.time_ and arg_247_1.time_ < var_250_20 + var_250_27 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_20) / var_250_27

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_20 + var_250_27 and arg_247_1.time_ < var_250_20 + var_250_27 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play117101063 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 117101063
		arg_251_1.duration_ = 4.066

		local var_251_0 = {
			zh = 4.066,
			ja = 4
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
				arg_251_0:Play117101064(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0
			local var_254_1 = 0.425

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_2 = arg_251_1:FormatText(StoryNameCfg[369].name)

				arg_251_1.leftNameTxt_.text = var_254_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, true)
				arg_251_1.iconController_:SetSelectedState("hero")

				arg_251_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10035_split_4")

				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_3 = arg_251_1:GetWordFromCfg(117101063)
				local var_254_4 = arg_251_1:FormatText(var_254_3.content)

				arg_251_1.text_.text = var_254_4

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101063", "story_v_out_117101.awb") ~= 0 then
					local var_254_8 = manager.audio:GetVoiceLength("story_v_out_117101", "117101063", "story_v_out_117101.awb") / 1000

					if var_254_8 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_8 + var_254_0
					end

					if var_254_3.prefab_name ~= "" and arg_251_1.actors_[var_254_3.prefab_name] ~= nil then
						local var_254_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_3.prefab_name].transform, "story_v_out_117101", "117101063", "story_v_out_117101.awb")

						arg_251_1:RecordAudio("117101063", var_254_9)
						arg_251_1:RecordAudio("117101063", var_254_9)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_117101", "117101063", "story_v_out_117101.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_117101", "117101063", "story_v_out_117101.awb")
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
	Play117101064 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 117101064
		arg_255_1.duration_ = 3.666

		local var_255_0 = {
			zh = 3.666,
			ja = 2.4
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
				arg_255_0:Play117101065(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["10034"].transform
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 then
				arg_255_1.var_.moveOldPos10034 = var_258_0.localPosition
				var_258_0.localScale = Vector3.New(1, 1, 1)

				arg_255_1:CheckSpriteTmpPos("10034", 4)

				local var_258_2 = var_258_0.childCount

				for iter_258_0 = 0, var_258_2 - 1 do
					local var_258_3 = var_258_0:GetChild(iter_258_0)

					if var_258_3.name == "split_5" or not string.find(var_258_3.name, "split") then
						var_258_3.gameObject:SetActive(true)
					else
						var_258_3.gameObject:SetActive(false)
					end
				end
			end

			local var_258_4 = 0.001

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_4 then
				local var_258_5 = (arg_255_1.time_ - var_258_1) / var_258_4
				local var_258_6 = Vector3.New(390, -415, -290)

				var_258_0.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos10034, var_258_6, var_258_5)
			end

			if arg_255_1.time_ >= var_258_1 + var_258_4 and arg_255_1.time_ < var_258_1 + var_258_4 + arg_258_0 then
				var_258_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_258_7 = arg_255_1.actors_["10034"]
			local var_258_8 = 0

			if var_258_8 < arg_255_1.time_ and arg_255_1.time_ <= var_258_8 + arg_258_0 and arg_255_1.var_.actorSpriteComps10034 == nil then
				arg_255_1.var_.actorSpriteComps10034 = var_258_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_258_9 = 0.2

			if var_258_8 <= arg_255_1.time_ and arg_255_1.time_ < var_258_8 + var_258_9 then
				local var_258_10 = (arg_255_1.time_ - var_258_8) / var_258_9

				if arg_255_1.var_.actorSpriteComps10034 then
					for iter_258_1, iter_258_2 in pairs(arg_255_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_258_2 then
							local var_258_11 = Mathf.Lerp(iter_258_2.color.r, 1, var_258_10)

							iter_258_2.color = Color.New(var_258_11, var_258_11, var_258_11)
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_8 + var_258_9 and arg_255_1.time_ < var_258_8 + var_258_9 + arg_258_0 and arg_255_1.var_.actorSpriteComps10034 then
				local var_258_12 = 1

				for iter_258_3, iter_258_4 in pairs(arg_255_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_258_4 then
						iter_258_4.color = Color.New(var_258_12, var_258_12, var_258_12)
					end
				end

				arg_255_1.var_.actorSpriteComps10034 = nil
			end

			local var_258_13 = 0
			local var_258_14 = 0.4

			if var_258_13 < arg_255_1.time_ and arg_255_1.time_ <= var_258_13 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_15 = arg_255_1:FormatText(StoryNameCfg[367].name)

				arg_255_1.leftNameTxt_.text = var_258_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_16 = arg_255_1:GetWordFromCfg(117101064)
				local var_258_17 = arg_255_1:FormatText(var_258_16.content)

				arg_255_1.text_.text = var_258_17

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_18 = 16
				local var_258_19 = utf8.len(var_258_17)
				local var_258_20 = var_258_18 <= 0 and var_258_14 or var_258_14 * (var_258_19 / var_258_18)

				if var_258_20 > 0 and var_258_14 < var_258_20 then
					arg_255_1.talkMaxDuration = var_258_20

					if var_258_20 + var_258_13 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_20 + var_258_13
					end
				end

				arg_255_1.text_.text = var_258_17
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101064", "story_v_out_117101.awb") ~= 0 then
					local var_258_21 = manager.audio:GetVoiceLength("story_v_out_117101", "117101064", "story_v_out_117101.awb") / 1000

					if var_258_21 + var_258_13 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_21 + var_258_13
					end

					if var_258_16.prefab_name ~= "" and arg_255_1.actors_[var_258_16.prefab_name] ~= nil then
						local var_258_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_16.prefab_name].transform, "story_v_out_117101", "117101064", "story_v_out_117101.awb")

						arg_255_1:RecordAudio("117101064", var_258_22)
						arg_255_1:RecordAudio("117101064", var_258_22)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_117101", "117101064", "story_v_out_117101.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_117101", "117101064", "story_v_out_117101.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_23 = math.max(var_258_14, arg_255_1.talkMaxDuration)

			if var_258_13 <= arg_255_1.time_ and arg_255_1.time_ < var_258_13 + var_258_23 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_13) / var_258_23

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_13 + var_258_23 and arg_255_1.time_ < var_258_13 + var_258_23 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play117101065 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 117101065
		arg_259_1.duration_ = 10.233

		local var_259_0 = {
			zh = 9.1,
			ja = 10.233
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
				arg_259_0:Play117101066(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1033"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos1033 = var_262_0.localPosition
				var_262_0.localScale = Vector3.New(1, 1, 1)

				arg_259_1:CheckSpriteTmpPos("1033", 2)

				local var_262_2 = var_262_0.childCount

				for iter_262_0 = 0, var_262_2 - 1 do
					local var_262_3 = var_262_0:GetChild(iter_262_0)

					if var_262_3.name == "split_6" or not string.find(var_262_3.name, "split") then
						var_262_3.gameObject:SetActive(true)
					else
						var_262_3.gameObject:SetActive(false)
					end
				end
			end

			local var_262_4 = 0.001

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_4 then
				local var_262_5 = (arg_259_1.time_ - var_262_1) / var_262_4
				local var_262_6 = Vector3.New(-390, -420, 0)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1033, var_262_6, var_262_5)
			end

			if arg_259_1.time_ >= var_262_1 + var_262_4 and arg_259_1.time_ < var_262_1 + var_262_4 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_262_7 = arg_259_1.actors_["1033"]
			local var_262_8 = 0

			if var_262_8 < arg_259_1.time_ and arg_259_1.time_ <= var_262_8 + arg_262_0 and arg_259_1.var_.actorSpriteComps1033 == nil then
				arg_259_1.var_.actorSpriteComps1033 = var_262_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_9 = 0.0166666666666667

			if var_262_8 <= arg_259_1.time_ and arg_259_1.time_ < var_262_8 + var_262_9 then
				local var_262_10 = (arg_259_1.time_ - var_262_8) / var_262_9

				if arg_259_1.var_.actorSpriteComps1033 then
					for iter_262_1, iter_262_2 in pairs(arg_259_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_262_2 then
							local var_262_11 = Mathf.Lerp(iter_262_2.color.r, 1, var_262_10)

							iter_262_2.color = Color.New(var_262_11, var_262_11, var_262_11)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_8 + var_262_9 and arg_259_1.time_ < var_262_8 + var_262_9 + arg_262_0 and arg_259_1.var_.actorSpriteComps1033 then
				local var_262_12 = 1

				for iter_262_3, iter_262_4 in pairs(arg_259_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_262_4 then
						iter_262_4.color = Color.New(var_262_12, var_262_12, var_262_12)
					end
				end

				arg_259_1.var_.actorSpriteComps1033 = nil
			end

			local var_262_13 = arg_259_1.actors_["10034"]
			local var_262_14 = 0

			if var_262_14 < arg_259_1.time_ and arg_259_1.time_ <= var_262_14 + arg_262_0 and arg_259_1.var_.actorSpriteComps10034 == nil then
				arg_259_1.var_.actorSpriteComps10034 = var_262_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_15 = 0.2

			if var_262_14 <= arg_259_1.time_ and arg_259_1.time_ < var_262_14 + var_262_15 then
				local var_262_16 = (arg_259_1.time_ - var_262_14) / var_262_15

				if arg_259_1.var_.actorSpriteComps10034 then
					for iter_262_5, iter_262_6 in pairs(arg_259_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_262_6 then
							local var_262_17 = Mathf.Lerp(iter_262_6.color.r, 0.5, var_262_16)

							iter_262_6.color = Color.New(var_262_17, var_262_17, var_262_17)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_14 + var_262_15 and arg_259_1.time_ < var_262_14 + var_262_15 + arg_262_0 and arg_259_1.var_.actorSpriteComps10034 then
				local var_262_18 = 0.5

				for iter_262_7, iter_262_8 in pairs(arg_259_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_262_8 then
						iter_262_8.color = Color.New(var_262_18, var_262_18, var_262_18)
					end
				end

				arg_259_1.var_.actorSpriteComps10034 = nil
			end

			local var_262_19 = arg_259_1.actors_["1033"]
			local var_262_20 = 0

			if var_262_20 < arg_259_1.time_ and arg_259_1.time_ <= var_262_20 + arg_262_0 then
				local var_262_21 = var_262_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_262_21 then
					arg_259_1.var_.alphaOldValue1033 = var_262_21.alpha
					arg_259_1.var_.characterEffect1033 = var_262_21
				end

				arg_259_1.var_.alphaOldValue1033 = 0
			end

			local var_262_22 = 0.333333333333333

			if var_262_20 <= arg_259_1.time_ and arg_259_1.time_ < var_262_20 + var_262_22 then
				local var_262_23 = (arg_259_1.time_ - var_262_20) / var_262_22
				local var_262_24 = Mathf.Lerp(arg_259_1.var_.alphaOldValue1033, 1, var_262_23)

				if arg_259_1.var_.characterEffect1033 then
					arg_259_1.var_.characterEffect1033.alpha = var_262_24
				end
			end

			if arg_259_1.time_ >= var_262_20 + var_262_22 and arg_259_1.time_ < var_262_20 + var_262_22 + arg_262_0 and arg_259_1.var_.characterEffect1033 then
				arg_259_1.var_.characterEffect1033.alpha = 1
			end

			local var_262_25 = 0
			local var_262_26 = 1.325

			if var_262_25 < arg_259_1.time_ and arg_259_1.time_ <= var_262_25 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_27 = arg_259_1:FormatText(StoryNameCfg[236].name)

				arg_259_1.leftNameTxt_.text = var_262_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_28 = arg_259_1:GetWordFromCfg(117101065)
				local var_262_29 = arg_259_1:FormatText(var_262_28.content)

				arg_259_1.text_.text = var_262_29

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_30 = 52
				local var_262_31 = utf8.len(var_262_29)
				local var_262_32 = var_262_30 <= 0 and var_262_26 or var_262_26 * (var_262_31 / var_262_30)

				if var_262_32 > 0 and var_262_26 < var_262_32 then
					arg_259_1.talkMaxDuration = var_262_32

					if var_262_32 + var_262_25 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_32 + var_262_25
					end
				end

				arg_259_1.text_.text = var_262_29
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101065", "story_v_out_117101.awb") ~= 0 then
					local var_262_33 = manager.audio:GetVoiceLength("story_v_out_117101", "117101065", "story_v_out_117101.awb") / 1000

					if var_262_33 + var_262_25 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_33 + var_262_25
					end

					if var_262_28.prefab_name ~= "" and arg_259_1.actors_[var_262_28.prefab_name] ~= nil then
						local var_262_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_28.prefab_name].transform, "story_v_out_117101", "117101065", "story_v_out_117101.awb")

						arg_259_1:RecordAudio("117101065", var_262_34)
						arg_259_1:RecordAudio("117101065", var_262_34)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_117101", "117101065", "story_v_out_117101.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_117101", "117101065", "story_v_out_117101.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_35 = math.max(var_262_26, arg_259_1.talkMaxDuration)

			if var_262_25 <= arg_259_1.time_ and arg_259_1.time_ < var_262_25 + var_262_35 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_25) / var_262_35

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_25 + var_262_35 and arg_259_1.time_ < var_262_25 + var_262_35 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play117101066 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 117101066
		arg_263_1.duration_ = 5

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play117101067(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1033"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos1033 = var_266_0.localPosition
				var_266_0.localScale = Vector3.New(1, 1, 1)

				arg_263_1:CheckSpriteTmpPos("1033", 7)

				local var_266_2 = var_266_0.childCount

				for iter_266_0 = 0, var_266_2 - 1 do
					local var_266_3 = var_266_0:GetChild(iter_266_0)

					if var_266_3.name == "split_6" or not string.find(var_266_3.name, "split") then
						var_266_3.gameObject:SetActive(true)
					else
						var_266_3.gameObject:SetActive(false)
					end
				end
			end

			local var_266_4 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_4 then
				local var_266_5 = (arg_263_1.time_ - var_266_1) / var_266_4
				local var_266_6 = Vector3.New(0, -2000, 0)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1033, var_266_6, var_266_5)
			end

			if arg_263_1.time_ >= var_266_1 + var_266_4 and arg_263_1.time_ < var_266_1 + var_266_4 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_266_7 = arg_263_1.actors_["10034"].transform
			local var_266_8 = 0

			if var_266_8 < arg_263_1.time_ and arg_263_1.time_ <= var_266_8 + arg_266_0 then
				arg_263_1.var_.moveOldPos10034 = var_266_7.localPosition
				var_266_7.localScale = Vector3.New(1, 1, 1)

				arg_263_1:CheckSpriteTmpPos("10034", 7)

				local var_266_9 = var_266_7.childCount

				for iter_266_1 = 0, var_266_9 - 1 do
					local var_266_10 = var_266_7:GetChild(iter_266_1)

					if var_266_10.name == "split_5" or not string.find(var_266_10.name, "split") then
						var_266_10.gameObject:SetActive(true)
					else
						var_266_10.gameObject:SetActive(false)
					end
				end
			end

			local var_266_11 = 0.001

			if var_266_8 <= arg_263_1.time_ and arg_263_1.time_ < var_266_8 + var_266_11 then
				local var_266_12 = (arg_263_1.time_ - var_266_8) / var_266_11
				local var_266_13 = Vector3.New(0, -2000, -290)

				var_266_7.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos10034, var_266_13, var_266_12)
			end

			if arg_263_1.time_ >= var_266_8 + var_266_11 and arg_263_1.time_ < var_266_8 + var_266_11 + arg_266_0 then
				var_266_7.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_266_14 = 0
			local var_266_15 = 1.375

			if var_266_14 < arg_263_1.time_ and arg_263_1.time_ <= var_266_14 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, false)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_16 = arg_263_1:GetWordFromCfg(117101066)
				local var_266_17 = arg_263_1:FormatText(var_266_16.content)

				arg_263_1.text_.text = var_266_17

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_18 = 55
				local var_266_19 = utf8.len(var_266_17)
				local var_266_20 = var_266_18 <= 0 and var_266_15 or var_266_15 * (var_266_19 / var_266_18)

				if var_266_20 > 0 and var_266_15 < var_266_20 then
					arg_263_1.talkMaxDuration = var_266_20

					if var_266_20 + var_266_14 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_20 + var_266_14
					end
				end

				arg_263_1.text_.text = var_266_17
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)
				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_21 = math.max(var_266_15, arg_263_1.talkMaxDuration)

			if var_266_14 <= arg_263_1.time_ and arg_263_1.time_ < var_266_14 + var_266_21 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_14) / var_266_21

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_14 + var_266_21 and arg_263_1.time_ < var_266_14 + var_266_21 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play117101067 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 117101067
		arg_267_1.duration_ = 7.966

		local var_267_0 = {
			zh = 7.966,
			ja = 7.133
		}
		local var_267_1 = manager.audio:GetLocalizationFlag()

		if var_267_0[var_267_1] ~= nil then
			arg_267_1.duration_ = var_267_0[var_267_1]
		end

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play117101068(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 0
			local var_270_1 = 0.95

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_2 = arg_267_1:FormatText(StoryNameCfg[369].name)

				arg_267_1.leftNameTxt_.text = var_270_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, true)
				arg_267_1.iconController_:SetSelectedState("hero")

				arg_267_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10035_split_5")

				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_3 = arg_267_1:GetWordFromCfg(117101067)
				local var_270_4 = arg_267_1:FormatText(var_270_3.content)

				arg_267_1.text_.text = var_270_4

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_5 = 38
				local var_270_6 = utf8.len(var_270_4)
				local var_270_7 = var_270_5 <= 0 and var_270_1 or var_270_1 * (var_270_6 / var_270_5)

				if var_270_7 > 0 and var_270_1 < var_270_7 then
					arg_267_1.talkMaxDuration = var_270_7

					if var_270_7 + var_270_0 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_7 + var_270_0
					end
				end

				arg_267_1.text_.text = var_270_4
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101067", "story_v_out_117101.awb") ~= 0 then
					local var_270_8 = manager.audio:GetVoiceLength("story_v_out_117101", "117101067", "story_v_out_117101.awb") / 1000

					if var_270_8 + var_270_0 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_8 + var_270_0
					end

					if var_270_3.prefab_name ~= "" and arg_267_1.actors_[var_270_3.prefab_name] ~= nil then
						local var_270_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_3.prefab_name].transform, "story_v_out_117101", "117101067", "story_v_out_117101.awb")

						arg_267_1:RecordAudio("117101067", var_270_9)
						arg_267_1:RecordAudio("117101067", var_270_9)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_117101", "117101067", "story_v_out_117101.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_117101", "117101067", "story_v_out_117101.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_10 = math.max(var_270_1, arg_267_1.talkMaxDuration)

			if var_270_0 <= arg_267_1.time_ and arg_267_1.time_ < var_270_0 + var_270_10 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_0) / var_270_10

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_0 + var_270_10 and arg_267_1.time_ < var_270_0 + var_270_10 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play117101068 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 117101068
		arg_271_1.duration_ = 5

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play117101069(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 0
			local var_274_1 = 1.475

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, false)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_2 = arg_271_1:GetWordFromCfg(117101068)
				local var_274_3 = arg_271_1:FormatText(var_274_2.content)

				arg_271_1.text_.text = var_274_3

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_4 = 59
				local var_274_5 = utf8.len(var_274_3)
				local var_274_6 = var_274_4 <= 0 and var_274_1 or var_274_1 * (var_274_5 / var_274_4)

				if var_274_6 > 0 and var_274_1 < var_274_6 then
					arg_271_1.talkMaxDuration = var_274_6

					if var_274_6 + var_274_0 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_6 + var_274_0
					end
				end

				arg_271_1.text_.text = var_274_3
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)
				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_7 = math.max(var_274_1, arg_271_1.talkMaxDuration)

			if var_274_0 <= arg_271_1.time_ and arg_271_1.time_ < var_274_0 + var_274_7 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_0) / var_274_7

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_0 + var_274_7 and arg_271_1.time_ < var_274_0 + var_274_7 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play117101069 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 117101069
		arg_275_1.duration_ = 7.133

		local var_275_0 = {
			zh = 5.4,
			ja = 7.133
		}
		local var_275_1 = manager.audio:GetLocalizationFlag()

		if var_275_0[var_275_1] ~= nil then
			arg_275_1.duration_ = var_275_0[var_275_1]
		end

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play117101070(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1033"].transform
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 then
				arg_275_1.var_.moveOldPos1033 = var_278_0.localPosition
				var_278_0.localScale = Vector3.New(1, 1, 1)

				arg_275_1:CheckSpriteTmpPos("1033", 3)

				local var_278_2 = var_278_0.childCount

				for iter_278_0 = 0, var_278_2 - 1 do
					local var_278_3 = var_278_0:GetChild(iter_278_0)

					if var_278_3.name == "split_4" or not string.find(var_278_3.name, "split") then
						var_278_3.gameObject:SetActive(true)
					else
						var_278_3.gameObject:SetActive(false)
					end
				end
			end

			local var_278_4 = 0.001

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_4 then
				local var_278_5 = (arg_275_1.time_ - var_278_1) / var_278_4
				local var_278_6 = Vector3.New(0, -420, 0)

				var_278_0.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1033, var_278_6, var_278_5)
			end

			if arg_275_1.time_ >= var_278_1 + var_278_4 and arg_275_1.time_ < var_278_1 + var_278_4 + arg_278_0 then
				var_278_0.localPosition = Vector3.New(0, -420, 0)
			end

			local var_278_7 = arg_275_1.actors_["1033"]
			local var_278_8 = 0

			if var_278_8 < arg_275_1.time_ and arg_275_1.time_ <= var_278_8 + arg_278_0 and arg_275_1.var_.actorSpriteComps1033 == nil then
				arg_275_1.var_.actorSpriteComps1033 = var_278_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_278_9 = 0.2

			if var_278_8 <= arg_275_1.time_ and arg_275_1.time_ < var_278_8 + var_278_9 then
				local var_278_10 = (arg_275_1.time_ - var_278_8) / var_278_9

				if arg_275_1.var_.actorSpriteComps1033 then
					for iter_278_1, iter_278_2 in pairs(arg_275_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_278_2 then
							local var_278_11 = Mathf.Lerp(iter_278_2.color.r, 1, var_278_10)

							iter_278_2.color = Color.New(var_278_11, var_278_11, var_278_11)
						end
					end
				end
			end

			if arg_275_1.time_ >= var_278_8 + var_278_9 and arg_275_1.time_ < var_278_8 + var_278_9 + arg_278_0 and arg_275_1.var_.actorSpriteComps1033 then
				local var_278_12 = 1

				for iter_278_3, iter_278_4 in pairs(arg_275_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_278_4 then
						iter_278_4.color = Color.New(var_278_12, var_278_12, var_278_12)
					end
				end

				arg_275_1.var_.actorSpriteComps1033 = nil
			end

			local var_278_13 = 0
			local var_278_14 = 0.5

			if var_278_13 < arg_275_1.time_ and arg_275_1.time_ <= var_278_13 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_15 = arg_275_1:FormatText(StoryNameCfg[236].name)

				arg_275_1.leftNameTxt_.text = var_278_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_16 = arg_275_1:GetWordFromCfg(117101069)
				local var_278_17 = arg_275_1:FormatText(var_278_16.content)

				arg_275_1.text_.text = var_278_17

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_18 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101069", "story_v_out_117101.awb") ~= 0 then
					local var_278_21 = manager.audio:GetVoiceLength("story_v_out_117101", "117101069", "story_v_out_117101.awb") / 1000

					if var_278_21 + var_278_13 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_21 + var_278_13
					end

					if var_278_16.prefab_name ~= "" and arg_275_1.actors_[var_278_16.prefab_name] ~= nil then
						local var_278_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_16.prefab_name].transform, "story_v_out_117101", "117101069", "story_v_out_117101.awb")

						arg_275_1:RecordAudio("117101069", var_278_22)
						arg_275_1:RecordAudio("117101069", var_278_22)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_117101", "117101069", "story_v_out_117101.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_117101", "117101069", "story_v_out_117101.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_23 = math.max(var_278_14, arg_275_1.talkMaxDuration)

			if var_278_13 <= arg_275_1.time_ and arg_275_1.time_ < var_278_13 + var_278_23 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_13) / var_278_23

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_13 + var_278_23 and arg_275_1.time_ < var_278_13 + var_278_23 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play117101070 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 117101070
		arg_279_1.duration_ = 5

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play117101071(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1033"]
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 and arg_279_1.var_.actorSpriteComps1033 == nil then
				arg_279_1.var_.actorSpriteComps1033 = var_282_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_282_2 = 0.2

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2

				if arg_279_1.var_.actorSpriteComps1033 then
					for iter_282_0, iter_282_1 in pairs(arg_279_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_282_1 then
							local var_282_4 = Mathf.Lerp(iter_282_1.color.r, 0.5, var_282_3)

							iter_282_1.color = Color.New(var_282_4, var_282_4, var_282_4)
						end
					end
				end
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 and arg_279_1.var_.actorSpriteComps1033 then
				local var_282_5 = 0.5

				for iter_282_2, iter_282_3 in pairs(arg_279_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_282_3 then
						iter_282_3.color = Color.New(var_282_5, var_282_5, var_282_5)
					end
				end

				arg_279_1.var_.actorSpriteComps1033 = nil
			end

			local var_282_6 = 0
			local var_282_7 = 0.475

			if var_282_6 < arg_279_1.time_ and arg_279_1.time_ <= var_282_6 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, false)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_8 = arg_279_1:GetWordFromCfg(117101070)
				local var_282_9 = arg_279_1:FormatText(var_282_8.content)

				arg_279_1.text_.text = var_282_9

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_10 = 19
				local var_282_11 = utf8.len(var_282_9)
				local var_282_12 = var_282_10 <= 0 and var_282_7 or var_282_7 * (var_282_11 / var_282_10)

				if var_282_12 > 0 and var_282_7 < var_282_12 then
					arg_279_1.talkMaxDuration = var_282_12

					if var_282_12 + var_282_6 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_12 + var_282_6
					end
				end

				arg_279_1.text_.text = var_282_9
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)
				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_13 = math.max(var_282_7, arg_279_1.talkMaxDuration)

			if var_282_6 <= arg_279_1.time_ and arg_279_1.time_ < var_282_6 + var_282_13 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_6) / var_282_13

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_6 + var_282_13 and arg_279_1.time_ < var_282_6 + var_282_13 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play117101071 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 117101071
		arg_283_1.duration_ = 6.3

		local var_283_0 = {
			zh = 6.3,
			ja = 5.733
		}
		local var_283_1 = manager.audio:GetLocalizationFlag()

		if var_283_0[var_283_1] ~= nil then
			arg_283_1.duration_ = var_283_0[var_283_1]
		end

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play117101072(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["1033"]
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 and arg_283_1.var_.actorSpriteComps1033 == nil then
				arg_283_1.var_.actorSpriteComps1033 = var_286_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_286_2 = 0.2

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2

				if arg_283_1.var_.actorSpriteComps1033 then
					for iter_286_0, iter_286_1 in pairs(arg_283_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_286_1 then
							local var_286_4 = Mathf.Lerp(iter_286_1.color.r, 1, var_286_3)

							iter_286_1.color = Color.New(var_286_4, var_286_4, var_286_4)
						end
					end
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 and arg_283_1.var_.actorSpriteComps1033 then
				local var_286_5 = 1

				for iter_286_2, iter_286_3 in pairs(arg_283_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_286_3 then
						iter_286_3.color = Color.New(var_286_5, var_286_5, var_286_5)
					end
				end

				arg_283_1.var_.actorSpriteComps1033 = nil
			end

			local var_286_6 = arg_283_1.actors_["1033"].transform
			local var_286_7 = 0

			if var_286_7 < arg_283_1.time_ and arg_283_1.time_ <= var_286_7 + arg_286_0 then
				arg_283_1.var_.moveOldPos1033 = var_286_6.localPosition
				var_286_6.localScale = Vector3.New(1, 1, 1)

				arg_283_1:CheckSpriteTmpPos("1033", 3)

				local var_286_8 = var_286_6.childCount

				for iter_286_4 = 0, var_286_8 - 1 do
					local var_286_9 = var_286_6:GetChild(iter_286_4)

					if var_286_9.name == "split_6" or not string.find(var_286_9.name, "split") then
						var_286_9.gameObject:SetActive(true)
					else
						var_286_9.gameObject:SetActive(false)
					end
				end
			end

			local var_286_10 = 0.001

			if var_286_7 <= arg_283_1.time_ and arg_283_1.time_ < var_286_7 + var_286_10 then
				local var_286_11 = (arg_283_1.time_ - var_286_7) / var_286_10
				local var_286_12 = Vector3.New(0, -420, 0)

				var_286_6.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos1033, var_286_12, var_286_11)
			end

			if arg_283_1.time_ >= var_286_7 + var_286_10 and arg_283_1.time_ < var_286_7 + var_286_10 + arg_286_0 then
				var_286_6.localPosition = Vector3.New(0, -420, 0)
			end

			local var_286_13 = 0
			local var_286_14 = 0.725

			if var_286_13 < arg_283_1.time_ and arg_283_1.time_ <= var_286_13 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_15 = arg_283_1:FormatText(StoryNameCfg[236].name)

				arg_283_1.leftNameTxt_.text = var_286_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_16 = arg_283_1:GetWordFromCfg(117101071)
				local var_286_17 = arg_283_1:FormatText(var_286_16.content)

				arg_283_1.text_.text = var_286_17

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_18 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101071", "story_v_out_117101.awb") ~= 0 then
					local var_286_21 = manager.audio:GetVoiceLength("story_v_out_117101", "117101071", "story_v_out_117101.awb") / 1000

					if var_286_21 + var_286_13 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_21 + var_286_13
					end

					if var_286_16.prefab_name ~= "" and arg_283_1.actors_[var_286_16.prefab_name] ~= nil then
						local var_286_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_16.prefab_name].transform, "story_v_out_117101", "117101071", "story_v_out_117101.awb")

						arg_283_1:RecordAudio("117101071", var_286_22)
						arg_283_1:RecordAudio("117101071", var_286_22)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_117101", "117101071", "story_v_out_117101.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_117101", "117101071", "story_v_out_117101.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_23 = math.max(var_286_14, arg_283_1.talkMaxDuration)

			if var_286_13 <= arg_283_1.time_ and arg_283_1.time_ < var_286_13 + var_286_23 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_13) / var_286_23

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_13 + var_286_23 and arg_283_1.time_ < var_286_13 + var_286_23 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play117101072 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 117101072
		arg_287_1.duration_ = 7.366

		local var_287_0 = {
			zh = 5.8,
			ja = 7.366
		}
		local var_287_1 = manager.audio:GetLocalizationFlag()

		if var_287_0[var_287_1] ~= nil then
			arg_287_1.duration_ = var_287_0[var_287_1]
		end

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play117101073(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["10034"].transform
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 then
				arg_287_1.var_.moveOldPos10034 = var_290_0.localPosition
				var_290_0.localScale = Vector3.New(1, 1, 1)

				arg_287_1:CheckSpriteTmpPos("10034", 4)

				local var_290_2 = var_290_0.childCount

				for iter_290_0 = 0, var_290_2 - 1 do
					local var_290_3 = var_290_0:GetChild(iter_290_0)

					if var_290_3.name == "split_3" or not string.find(var_290_3.name, "split") then
						var_290_3.gameObject:SetActive(true)
					else
						var_290_3.gameObject:SetActive(false)
					end
				end
			end

			local var_290_4 = 0.001

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_4 then
				local var_290_5 = (arg_287_1.time_ - var_290_1) / var_290_4
				local var_290_6 = Vector3.New(390, -415, -290)

				var_290_0.localPosition = Vector3.Lerp(arg_287_1.var_.moveOldPos10034, var_290_6, var_290_5)
			end

			if arg_287_1.time_ >= var_290_1 + var_290_4 and arg_287_1.time_ < var_290_1 + var_290_4 + arg_290_0 then
				var_290_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_290_7 = arg_287_1.actors_["1033"]
			local var_290_8 = 0

			if var_290_8 < arg_287_1.time_ and arg_287_1.time_ <= var_290_8 + arg_290_0 and arg_287_1.var_.actorSpriteComps1033 == nil then
				arg_287_1.var_.actorSpriteComps1033 = var_290_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_290_9 = 0.2

			if var_290_8 <= arg_287_1.time_ and arg_287_1.time_ < var_290_8 + var_290_9 then
				local var_290_10 = (arg_287_1.time_ - var_290_8) / var_290_9

				if arg_287_1.var_.actorSpriteComps1033 then
					for iter_290_1, iter_290_2 in pairs(arg_287_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_290_2 then
							local var_290_11 = Mathf.Lerp(iter_290_2.color.r, 0.5, var_290_10)

							iter_290_2.color = Color.New(var_290_11, var_290_11, var_290_11)
						end
					end
				end
			end

			if arg_287_1.time_ >= var_290_8 + var_290_9 and arg_287_1.time_ < var_290_8 + var_290_9 + arg_290_0 and arg_287_1.var_.actorSpriteComps1033 then
				local var_290_12 = 0.5

				for iter_290_3, iter_290_4 in pairs(arg_287_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_290_4 then
						iter_290_4.color = Color.New(var_290_12, var_290_12, var_290_12)
					end
				end

				arg_287_1.var_.actorSpriteComps1033 = nil
			end

			local var_290_13 = arg_287_1.actors_["10034"]
			local var_290_14 = 0

			if var_290_14 < arg_287_1.time_ and arg_287_1.time_ <= var_290_14 + arg_290_0 and arg_287_1.var_.actorSpriteComps10034 == nil then
				arg_287_1.var_.actorSpriteComps10034 = var_290_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_290_15 = 0.2

			if var_290_14 <= arg_287_1.time_ and arg_287_1.time_ < var_290_14 + var_290_15 then
				local var_290_16 = (arg_287_1.time_ - var_290_14) / var_290_15

				if arg_287_1.var_.actorSpriteComps10034 then
					for iter_290_5, iter_290_6 in pairs(arg_287_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_290_6 then
							local var_290_17 = Mathf.Lerp(iter_290_6.color.r, 1, var_290_16)

							iter_290_6.color = Color.New(var_290_17, var_290_17, var_290_17)
						end
					end
				end
			end

			if arg_287_1.time_ >= var_290_14 + var_290_15 and arg_287_1.time_ < var_290_14 + var_290_15 + arg_290_0 and arg_287_1.var_.actorSpriteComps10034 then
				local var_290_18 = 1

				for iter_290_7, iter_290_8 in pairs(arg_287_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_290_8 then
						iter_290_8.color = Color.New(var_290_18, var_290_18, var_290_18)
					end
				end

				arg_287_1.var_.actorSpriteComps10034 = nil
			end

			local var_290_19 = arg_287_1.actors_["1033"].transform
			local var_290_20 = 0

			if var_290_20 < arg_287_1.time_ and arg_287_1.time_ <= var_290_20 + arg_290_0 then
				arg_287_1.var_.moveOldPos1033 = var_290_19.localPosition
				var_290_19.localScale = Vector3.New(1, 1, 1)

				arg_287_1:CheckSpriteTmpPos("1033", 2)

				local var_290_21 = var_290_19.childCount

				for iter_290_9 = 0, var_290_21 - 1 do
					local var_290_22 = var_290_19:GetChild(iter_290_9)

					if var_290_22.name == "split_6" or not string.find(var_290_22.name, "split") then
						var_290_22.gameObject:SetActive(true)
					else
						var_290_22.gameObject:SetActive(false)
					end
				end
			end

			local var_290_23 = 0.001

			if var_290_20 <= arg_287_1.time_ and arg_287_1.time_ < var_290_20 + var_290_23 then
				local var_290_24 = (arg_287_1.time_ - var_290_20) / var_290_23
				local var_290_25 = Vector3.New(-390, -420, 0)

				var_290_19.localPosition = Vector3.Lerp(arg_287_1.var_.moveOldPos1033, var_290_25, var_290_24)
			end

			if arg_287_1.time_ >= var_290_20 + var_290_23 and arg_287_1.time_ < var_290_20 + var_290_23 + arg_290_0 then
				var_290_19.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_290_26 = 0
			local var_290_27 = 0.65

			if var_290_26 < arg_287_1.time_ and arg_287_1.time_ <= var_290_26 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_28 = arg_287_1:FormatText(StoryNameCfg[367].name)

				arg_287_1.leftNameTxt_.text = var_290_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_29 = arg_287_1:GetWordFromCfg(117101072)
				local var_290_30 = arg_287_1:FormatText(var_290_29.content)

				arg_287_1.text_.text = var_290_30

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_31 = 26
				local var_290_32 = utf8.len(var_290_30)
				local var_290_33 = var_290_31 <= 0 and var_290_27 or var_290_27 * (var_290_32 / var_290_31)

				if var_290_33 > 0 and var_290_27 < var_290_33 then
					arg_287_1.talkMaxDuration = var_290_33

					if var_290_33 + var_290_26 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_33 + var_290_26
					end
				end

				arg_287_1.text_.text = var_290_30
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101072", "story_v_out_117101.awb") ~= 0 then
					local var_290_34 = manager.audio:GetVoiceLength("story_v_out_117101", "117101072", "story_v_out_117101.awb") / 1000

					if var_290_34 + var_290_26 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_34 + var_290_26
					end

					if var_290_29.prefab_name ~= "" and arg_287_1.actors_[var_290_29.prefab_name] ~= nil then
						local var_290_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_29.prefab_name].transform, "story_v_out_117101", "117101072", "story_v_out_117101.awb")

						arg_287_1:RecordAudio("117101072", var_290_35)
						arg_287_1:RecordAudio("117101072", var_290_35)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_117101", "117101072", "story_v_out_117101.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_117101", "117101072", "story_v_out_117101.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_36 = math.max(var_290_27, arg_287_1.talkMaxDuration)

			if var_290_26 <= arg_287_1.time_ and arg_287_1.time_ < var_290_26 + var_290_36 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_26) / var_290_36

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_26 + var_290_36 and arg_287_1.time_ < var_290_26 + var_290_36 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play117101073 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 117101073
		arg_291_1.duration_ = 8.033

		local var_291_0 = {
			zh = 8.033,
			ja = 5.666
		}
		local var_291_1 = manager.audio:GetLocalizationFlag()

		if var_291_0[var_291_1] ~= nil then
			arg_291_1.duration_ = var_291_0[var_291_1]
		end

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play117101074(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["1033"].transform
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1.var_.moveOldPos1033 = var_294_0.localPosition
				var_294_0.localScale = Vector3.New(1, 1, 1)

				arg_291_1:CheckSpriteTmpPos("1033", 2)

				local var_294_2 = var_294_0.childCount

				for iter_294_0 = 0, var_294_2 - 1 do
					local var_294_3 = var_294_0:GetChild(iter_294_0)

					if var_294_3.name == "split_6" or not string.find(var_294_3.name, "split") then
						var_294_3.gameObject:SetActive(true)
					else
						var_294_3.gameObject:SetActive(false)
					end
				end
			end

			local var_294_4 = 0.001

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_4 then
				local var_294_5 = (arg_291_1.time_ - var_294_1) / var_294_4
				local var_294_6 = Vector3.New(-390, -420, 0)

				var_294_0.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1033, var_294_6, var_294_5)
			end

			if arg_291_1.time_ >= var_294_1 + var_294_4 and arg_291_1.time_ < var_294_1 + var_294_4 + arg_294_0 then
				var_294_0.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_294_7 = arg_291_1.actors_["10034"]
			local var_294_8 = 0

			if var_294_8 < arg_291_1.time_ and arg_291_1.time_ <= var_294_8 + arg_294_0 and arg_291_1.var_.actorSpriteComps10034 == nil then
				arg_291_1.var_.actorSpriteComps10034 = var_294_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_294_9 = 0.2

			if var_294_8 <= arg_291_1.time_ and arg_291_1.time_ < var_294_8 + var_294_9 then
				local var_294_10 = (arg_291_1.time_ - var_294_8) / var_294_9

				if arg_291_1.var_.actorSpriteComps10034 then
					for iter_294_1, iter_294_2 in pairs(arg_291_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_294_2 then
							local var_294_11 = Mathf.Lerp(iter_294_2.color.r, 0.5, var_294_10)

							iter_294_2.color = Color.New(var_294_11, var_294_11, var_294_11)
						end
					end
				end
			end

			if arg_291_1.time_ >= var_294_8 + var_294_9 and arg_291_1.time_ < var_294_8 + var_294_9 + arg_294_0 and arg_291_1.var_.actorSpriteComps10034 then
				local var_294_12 = 0.5

				for iter_294_3, iter_294_4 in pairs(arg_291_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_294_4 then
						iter_294_4.color = Color.New(var_294_12, var_294_12, var_294_12)
					end
				end

				arg_291_1.var_.actorSpriteComps10034 = nil
			end

			local var_294_13 = 0
			local var_294_14 = 0.8

			if var_294_13 < arg_291_1.time_ and arg_291_1.time_ <= var_294_13 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_15 = arg_291_1:FormatText(StoryNameCfg[369].name)

				arg_291_1.leftNameTxt_.text = var_294_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, true)
				arg_291_1.iconController_:SetSelectedState("hero")

				arg_291_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10035_split_5")

				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_16 = arg_291_1:GetWordFromCfg(117101073)
				local var_294_17 = arg_291_1:FormatText(var_294_16.content)

				arg_291_1.text_.text = var_294_17

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_18 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101073", "story_v_out_117101.awb") ~= 0 then
					local var_294_21 = manager.audio:GetVoiceLength("story_v_out_117101", "117101073", "story_v_out_117101.awb") / 1000

					if var_294_21 + var_294_13 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_21 + var_294_13
					end

					if var_294_16.prefab_name ~= "" and arg_291_1.actors_[var_294_16.prefab_name] ~= nil then
						local var_294_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_16.prefab_name].transform, "story_v_out_117101", "117101073", "story_v_out_117101.awb")

						arg_291_1:RecordAudio("117101073", var_294_22)
						arg_291_1:RecordAudio("117101073", var_294_22)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_117101", "117101073", "story_v_out_117101.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_117101", "117101073", "story_v_out_117101.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_23 = math.max(var_294_14, arg_291_1.talkMaxDuration)

			if var_294_13 <= arg_291_1.time_ and arg_291_1.time_ < var_294_13 + var_294_23 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_13) / var_294_23

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_13 + var_294_23 and arg_291_1.time_ < var_294_13 + var_294_23 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play117101074 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 117101074
		arg_295_1.duration_ = 2.4

		local var_295_0 = {
			zh = 1.333,
			ja = 2.4
		}
		local var_295_1 = manager.audio:GetLocalizationFlag()

		if var_295_0[var_295_1] ~= nil then
			arg_295_1.duration_ = var_295_0[var_295_1]
		end

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play117101075(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["10034"].transform
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 then
				arg_295_1.var_.moveOldPos10034 = var_298_0.localPosition
				var_298_0.localScale = Vector3.New(1, 1, 1)

				arg_295_1:CheckSpriteTmpPos("10034", 4)

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
				local var_298_6 = Vector3.New(390, -415, -290)

				var_298_0.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos10034, var_298_6, var_298_5)
			end

			if arg_295_1.time_ >= var_298_1 + var_298_4 and arg_295_1.time_ < var_298_1 + var_298_4 + arg_298_0 then
				var_298_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_298_7 = arg_295_1.actors_["10034"]
			local var_298_8 = 0

			if var_298_8 < arg_295_1.time_ and arg_295_1.time_ <= var_298_8 + arg_298_0 and arg_295_1.var_.actorSpriteComps10034 == nil then
				arg_295_1.var_.actorSpriteComps10034 = var_298_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_298_9 = 0.2

			if var_298_8 <= arg_295_1.time_ and arg_295_1.time_ < var_298_8 + var_298_9 then
				local var_298_10 = (arg_295_1.time_ - var_298_8) / var_298_9

				if arg_295_1.var_.actorSpriteComps10034 then
					for iter_298_1, iter_298_2 in pairs(arg_295_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_298_2 then
							local var_298_11 = Mathf.Lerp(iter_298_2.color.r, 1, var_298_10)

							iter_298_2.color = Color.New(var_298_11, var_298_11, var_298_11)
						end
					end
				end
			end

			if arg_295_1.time_ >= var_298_8 + var_298_9 and arg_295_1.time_ < var_298_8 + var_298_9 + arg_298_0 and arg_295_1.var_.actorSpriteComps10034 then
				local var_298_12 = 1

				for iter_298_3, iter_298_4 in pairs(arg_295_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_298_4 then
						iter_298_4.color = Color.New(var_298_12, var_298_12, var_298_12)
					end
				end

				arg_295_1.var_.actorSpriteComps10034 = nil
			end

			local var_298_13 = arg_295_1.actors_["1033"].transform
			local var_298_14 = 0

			if var_298_14 < arg_295_1.time_ and arg_295_1.time_ <= var_298_14 + arg_298_0 then
				arg_295_1.var_.moveOldPos1033 = var_298_13.localPosition
				var_298_13.localScale = Vector3.New(1, 1, 1)

				arg_295_1:CheckSpriteTmpPos("1033", 2)

				local var_298_15 = var_298_13.childCount

				for iter_298_5 = 0, var_298_15 - 1 do
					local var_298_16 = var_298_13:GetChild(iter_298_5)

					if var_298_16.name == "split_6" or not string.find(var_298_16.name, "split") then
						var_298_16.gameObject:SetActive(true)
					else
						var_298_16.gameObject:SetActive(false)
					end
				end
			end

			local var_298_17 = 0.001

			if var_298_14 <= arg_295_1.time_ and arg_295_1.time_ < var_298_14 + var_298_17 then
				local var_298_18 = (arg_295_1.time_ - var_298_14) / var_298_17
				local var_298_19 = Vector3.New(-390, -420, 0)

				var_298_13.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos1033, var_298_19, var_298_18)
			end

			if arg_295_1.time_ >= var_298_14 + var_298_17 and arg_295_1.time_ < var_298_14 + var_298_17 + arg_298_0 then
				var_298_13.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_298_20 = 0
			local var_298_21 = 0.125

			if var_298_20 < arg_295_1.time_ and arg_295_1.time_ <= var_298_20 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_22 = arg_295_1:FormatText(StoryNameCfg[367].name)

				arg_295_1.leftNameTxt_.text = var_298_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_23 = arg_295_1:GetWordFromCfg(117101074)
				local var_298_24 = arg_295_1:FormatText(var_298_23.content)

				arg_295_1.text_.text = var_298_24

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_25 = 5
				local var_298_26 = utf8.len(var_298_24)
				local var_298_27 = var_298_25 <= 0 and var_298_21 or var_298_21 * (var_298_26 / var_298_25)

				if var_298_27 > 0 and var_298_21 < var_298_27 then
					arg_295_1.talkMaxDuration = var_298_27

					if var_298_27 + var_298_20 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_27 + var_298_20
					end
				end

				arg_295_1.text_.text = var_298_24
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101074", "story_v_out_117101.awb") ~= 0 then
					local var_298_28 = manager.audio:GetVoiceLength("story_v_out_117101", "117101074", "story_v_out_117101.awb") / 1000

					if var_298_28 + var_298_20 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_28 + var_298_20
					end

					if var_298_23.prefab_name ~= "" and arg_295_1.actors_[var_298_23.prefab_name] ~= nil then
						local var_298_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_23.prefab_name].transform, "story_v_out_117101", "117101074", "story_v_out_117101.awb")

						arg_295_1:RecordAudio("117101074", var_298_29)
						arg_295_1:RecordAudio("117101074", var_298_29)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_117101", "117101074", "story_v_out_117101.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_117101", "117101074", "story_v_out_117101.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_30 = math.max(var_298_21, arg_295_1.talkMaxDuration)

			if var_298_20 <= arg_295_1.time_ and arg_295_1.time_ < var_298_20 + var_298_30 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_20) / var_298_30

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_20 + var_298_30 and arg_295_1.time_ < var_298_20 + var_298_30 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play117101075 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 117101075
		arg_299_1.duration_ = 14.033

		local var_299_0 = {
			zh = 14.033,
			ja = 11.366
		}
		local var_299_1 = manager.audio:GetLocalizationFlag()

		if var_299_0[var_299_1] ~= nil then
			arg_299_1.duration_ = var_299_0[var_299_1]
		end

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play117101076(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = arg_299_1.actors_["10034"].transform
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 then
				arg_299_1.var_.moveOldPos10034 = var_302_0.localPosition
				var_302_0.localScale = Vector3.New(1, 1, 1)

				arg_299_1:CheckSpriteTmpPos("10034", 4)

				local var_302_2 = var_302_0.childCount

				for iter_302_0 = 0, var_302_2 - 1 do
					local var_302_3 = var_302_0:GetChild(iter_302_0)

					if var_302_3.name == "split_2" or not string.find(var_302_3.name, "split") then
						var_302_3.gameObject:SetActive(true)
					else
						var_302_3.gameObject:SetActive(false)
					end
				end
			end

			local var_302_4 = 0.001

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_4 then
				local var_302_5 = (arg_299_1.time_ - var_302_1) / var_302_4
				local var_302_6 = Vector3.New(390, -415, -290)

				var_302_0.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos10034, var_302_6, var_302_5)
			end

			if arg_299_1.time_ >= var_302_1 + var_302_4 and arg_299_1.time_ < var_302_1 + var_302_4 + arg_302_0 then
				var_302_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_302_7 = arg_299_1.actors_["10034"]
			local var_302_8 = 0

			if var_302_8 < arg_299_1.time_ and arg_299_1.time_ <= var_302_8 + arg_302_0 and arg_299_1.var_.actorSpriteComps10034 == nil then
				arg_299_1.var_.actorSpriteComps10034 = var_302_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_302_9 = 0.2

			if var_302_8 <= arg_299_1.time_ and arg_299_1.time_ < var_302_8 + var_302_9 then
				local var_302_10 = (arg_299_1.time_ - var_302_8) / var_302_9

				if arg_299_1.var_.actorSpriteComps10034 then
					for iter_302_1, iter_302_2 in pairs(arg_299_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_302_2 then
							local var_302_11 = Mathf.Lerp(iter_302_2.color.r, 0.5, var_302_10)

							iter_302_2.color = Color.New(var_302_11, var_302_11, var_302_11)
						end
					end
				end
			end

			if arg_299_1.time_ >= var_302_8 + var_302_9 and arg_299_1.time_ < var_302_8 + var_302_9 + arg_302_0 and arg_299_1.var_.actorSpriteComps10034 then
				local var_302_12 = 0.5

				for iter_302_3, iter_302_4 in pairs(arg_299_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_302_4 then
						iter_302_4.color = Color.New(var_302_12, var_302_12, var_302_12)
					end
				end

				arg_299_1.var_.actorSpriteComps10034 = nil
			end

			local var_302_13 = arg_299_1.actors_["1033"].transform
			local var_302_14 = 0

			if var_302_14 < arg_299_1.time_ and arg_299_1.time_ <= var_302_14 + arg_302_0 then
				arg_299_1.var_.moveOldPos1033 = var_302_13.localPosition
				var_302_13.localScale = Vector3.New(1, 1, 1)

				arg_299_1:CheckSpriteTmpPos("1033", 2)

				local var_302_15 = var_302_13.childCount

				for iter_302_5 = 0, var_302_15 - 1 do
					local var_302_16 = var_302_13:GetChild(iter_302_5)

					if var_302_16.name == "split_6" or not string.find(var_302_16.name, "split") then
						var_302_16.gameObject:SetActive(true)
					else
						var_302_16.gameObject:SetActive(false)
					end
				end
			end

			local var_302_17 = 0.001

			if var_302_14 <= arg_299_1.time_ and arg_299_1.time_ < var_302_14 + var_302_17 then
				local var_302_18 = (arg_299_1.time_ - var_302_14) / var_302_17
				local var_302_19 = Vector3.New(-390, -420, 0)

				var_302_13.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos1033, var_302_19, var_302_18)
			end

			if arg_299_1.time_ >= var_302_14 + var_302_17 and arg_299_1.time_ < var_302_14 + var_302_17 + arg_302_0 then
				var_302_13.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_302_20 = 0
			local var_302_21 = 1.9

			if var_302_20 < arg_299_1.time_ and arg_299_1.time_ <= var_302_20 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_22 = arg_299_1:FormatText(StoryNameCfg[369].name)

				arg_299_1.leftNameTxt_.text = var_302_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, true)
				arg_299_1.iconController_:SetSelectedState("hero")

				arg_299_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10035_split_5")

				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_23 = arg_299_1:GetWordFromCfg(117101075)
				local var_302_24 = arg_299_1:FormatText(var_302_23.content)

				arg_299_1.text_.text = var_302_24

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_25 = 76
				local var_302_26 = utf8.len(var_302_24)
				local var_302_27 = var_302_25 <= 0 and var_302_21 or var_302_21 * (var_302_26 / var_302_25)

				if var_302_27 > 0 and var_302_21 < var_302_27 then
					arg_299_1.talkMaxDuration = var_302_27

					if var_302_27 + var_302_20 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_27 + var_302_20
					end
				end

				arg_299_1.text_.text = var_302_24
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101075", "story_v_out_117101.awb") ~= 0 then
					local var_302_28 = manager.audio:GetVoiceLength("story_v_out_117101", "117101075", "story_v_out_117101.awb") / 1000

					if var_302_28 + var_302_20 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_28 + var_302_20
					end

					if var_302_23.prefab_name ~= "" and arg_299_1.actors_[var_302_23.prefab_name] ~= nil then
						local var_302_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_23.prefab_name].transform, "story_v_out_117101", "117101075", "story_v_out_117101.awb")

						arg_299_1:RecordAudio("117101075", var_302_29)
						arg_299_1:RecordAudio("117101075", var_302_29)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_117101", "117101075", "story_v_out_117101.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_117101", "117101075", "story_v_out_117101.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_30 = math.max(var_302_21, arg_299_1.talkMaxDuration)

			if var_302_20 <= arg_299_1.time_ and arg_299_1.time_ < var_302_20 + var_302_30 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_20) / var_302_30

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_20 + var_302_30 and arg_299_1.time_ < var_302_20 + var_302_30 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play117101076 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 117101076
		arg_303_1.duration_ = 5.9

		local var_303_0 = {
			zh = 3.633,
			ja = 5.9
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
				arg_303_0:Play117101077(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 0
			local var_306_1 = 0.375

			if var_306_0 < arg_303_1.time_ and arg_303_1.time_ <= var_306_0 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_2 = arg_303_1:FormatText(StoryNameCfg[369].name)

				arg_303_1.leftNameTxt_.text = var_306_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, true)
				arg_303_1.iconController_:SetSelectedState("hero")

				arg_303_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10035_split_5")

				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_3 = arg_303_1:GetWordFromCfg(117101076)
				local var_306_4 = arg_303_1:FormatText(var_306_3.content)

				arg_303_1.text_.text = var_306_4

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101076", "story_v_out_117101.awb") ~= 0 then
					local var_306_8 = manager.audio:GetVoiceLength("story_v_out_117101", "117101076", "story_v_out_117101.awb") / 1000

					if var_306_8 + var_306_0 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_8 + var_306_0
					end

					if var_306_3.prefab_name ~= "" and arg_303_1.actors_[var_306_3.prefab_name] ~= nil then
						local var_306_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_3.prefab_name].transform, "story_v_out_117101", "117101076", "story_v_out_117101.awb")

						arg_303_1:RecordAudio("117101076", var_306_9)
						arg_303_1:RecordAudio("117101076", var_306_9)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_117101", "117101076", "story_v_out_117101.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_117101", "117101076", "story_v_out_117101.awb")
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
	Play117101077 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 117101077
		arg_307_1.duration_ = 5

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play117101078(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = 0
			local var_310_1 = 1.1

			if var_310_0 < arg_307_1.time_ and arg_307_1.time_ <= var_310_0 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, false)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_2 = arg_307_1:GetWordFromCfg(117101077)
				local var_310_3 = arg_307_1:FormatText(var_310_2.content)

				arg_307_1.text_.text = var_310_3

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_4 = 44
				local var_310_5 = utf8.len(var_310_3)
				local var_310_6 = var_310_4 <= 0 and var_310_1 or var_310_1 * (var_310_5 / var_310_4)

				if var_310_6 > 0 and var_310_1 < var_310_6 then
					arg_307_1.talkMaxDuration = var_310_6

					if var_310_6 + var_310_0 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_6 + var_310_0
					end
				end

				arg_307_1.text_.text = var_310_3
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)
				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_7 = math.max(var_310_1, arg_307_1.talkMaxDuration)

			if var_310_0 <= arg_307_1.time_ and arg_307_1.time_ < var_310_0 + var_310_7 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_0) / var_310_7

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_0 + var_310_7 and arg_307_1.time_ < var_310_0 + var_310_7 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play117101078 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 117101078
		arg_311_1.duration_ = 5.466

		local var_311_0 = {
			zh = 4.833,
			ja = 5.466
		}
		local var_311_1 = manager.audio:GetLocalizationFlag()

		if var_311_0[var_311_1] ~= nil then
			arg_311_1.duration_ = var_311_0[var_311_1]
		end

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play117101079(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["10034"].transform
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 then
				arg_311_1.var_.moveOldPos10034 = var_314_0.localPosition
				var_314_0.localScale = Vector3.New(1, 1, 1)

				arg_311_1:CheckSpriteTmpPos("10034", 4)

				local var_314_2 = var_314_0.childCount

				for iter_314_0 = 0, var_314_2 - 1 do
					local var_314_3 = var_314_0:GetChild(iter_314_0)

					if var_314_3.name == "split_2" or not string.find(var_314_3.name, "split") then
						var_314_3.gameObject:SetActive(true)
					else
						var_314_3.gameObject:SetActive(false)
					end
				end
			end

			local var_314_4 = 0.001

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_4 then
				local var_314_5 = (arg_311_1.time_ - var_314_1) / var_314_4
				local var_314_6 = Vector3.New(390, -415, -290)

				var_314_0.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos10034, var_314_6, var_314_5)
			end

			if arg_311_1.time_ >= var_314_1 + var_314_4 and arg_311_1.time_ < var_314_1 + var_314_4 + arg_314_0 then
				var_314_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_314_7 = arg_311_1.actors_["10034"]
			local var_314_8 = 0

			if var_314_8 < arg_311_1.time_ and arg_311_1.time_ <= var_314_8 + arg_314_0 and arg_311_1.var_.actorSpriteComps10034 == nil then
				arg_311_1.var_.actorSpriteComps10034 = var_314_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_314_9 = 0.2

			if var_314_8 <= arg_311_1.time_ and arg_311_1.time_ < var_314_8 + var_314_9 then
				local var_314_10 = (arg_311_1.time_ - var_314_8) / var_314_9

				if arg_311_1.var_.actorSpriteComps10034 then
					for iter_314_1, iter_314_2 in pairs(arg_311_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_314_2 then
							local var_314_11 = Mathf.Lerp(iter_314_2.color.r, 1, var_314_10)

							iter_314_2.color = Color.New(var_314_11, var_314_11, var_314_11)
						end
					end
				end
			end

			if arg_311_1.time_ >= var_314_8 + var_314_9 and arg_311_1.time_ < var_314_8 + var_314_9 + arg_314_0 and arg_311_1.var_.actorSpriteComps10034 then
				local var_314_12 = 1

				for iter_314_3, iter_314_4 in pairs(arg_311_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_314_4 then
						iter_314_4.color = Color.New(var_314_12, var_314_12, var_314_12)
					end
				end

				arg_311_1.var_.actorSpriteComps10034 = nil
			end

			local var_314_13 = arg_311_1.actors_["1033"].transform
			local var_314_14 = 0

			if var_314_14 < arg_311_1.time_ and arg_311_1.time_ <= var_314_14 + arg_314_0 then
				arg_311_1.var_.moveOldPos1033 = var_314_13.localPosition
				var_314_13.localScale = Vector3.New(1, 1, 1)

				arg_311_1:CheckSpriteTmpPos("1033", 2)

				local var_314_15 = var_314_13.childCount

				for iter_314_5 = 0, var_314_15 - 1 do
					local var_314_16 = var_314_13:GetChild(iter_314_5)

					if var_314_16.name == "split_6" or not string.find(var_314_16.name, "split") then
						var_314_16.gameObject:SetActive(true)
					else
						var_314_16.gameObject:SetActive(false)
					end
				end
			end

			local var_314_17 = 0.001

			if var_314_14 <= arg_311_1.time_ and arg_311_1.time_ < var_314_14 + var_314_17 then
				local var_314_18 = (arg_311_1.time_ - var_314_14) / var_314_17
				local var_314_19 = Vector3.New(-390, -420, 0)

				var_314_13.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos1033, var_314_19, var_314_18)
			end

			if arg_311_1.time_ >= var_314_14 + var_314_17 and arg_311_1.time_ < var_314_14 + var_314_17 + arg_314_0 then
				var_314_13.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_314_20 = 0
			local var_314_21 = 0.55

			if var_314_20 < arg_311_1.time_ and arg_311_1.time_ <= var_314_20 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_22 = arg_311_1:FormatText(StoryNameCfg[367].name)

				arg_311_1.leftNameTxt_.text = var_314_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_23 = arg_311_1:GetWordFromCfg(117101078)
				local var_314_24 = arg_311_1:FormatText(var_314_23.content)

				arg_311_1.text_.text = var_314_24

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_25 = 22
				local var_314_26 = utf8.len(var_314_24)
				local var_314_27 = var_314_25 <= 0 and var_314_21 or var_314_21 * (var_314_26 / var_314_25)

				if var_314_27 > 0 and var_314_21 < var_314_27 then
					arg_311_1.talkMaxDuration = var_314_27

					if var_314_27 + var_314_20 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_27 + var_314_20
					end
				end

				arg_311_1.text_.text = var_314_24
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101078", "story_v_out_117101.awb") ~= 0 then
					local var_314_28 = manager.audio:GetVoiceLength("story_v_out_117101", "117101078", "story_v_out_117101.awb") / 1000

					if var_314_28 + var_314_20 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_28 + var_314_20
					end

					if var_314_23.prefab_name ~= "" and arg_311_1.actors_[var_314_23.prefab_name] ~= nil then
						local var_314_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_23.prefab_name].transform, "story_v_out_117101", "117101078", "story_v_out_117101.awb")

						arg_311_1:RecordAudio("117101078", var_314_29)
						arg_311_1:RecordAudio("117101078", var_314_29)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_117101", "117101078", "story_v_out_117101.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_117101", "117101078", "story_v_out_117101.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_30 = math.max(var_314_21, arg_311_1.talkMaxDuration)

			if var_314_20 <= arg_311_1.time_ and arg_311_1.time_ < var_314_20 + var_314_30 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_20) / var_314_30

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_20 + var_314_30 and arg_311_1.time_ < var_314_20 + var_314_30 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play117101079 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 117101079
		arg_315_1.duration_ = 9

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play117101080(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = "B01c"

			if arg_315_1.bgs_[var_318_0] == nil then
				local var_318_1 = Object.Instantiate(arg_315_1.paintGo_)

				var_318_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_318_0)
				var_318_1.name = var_318_0
				var_318_1.transform.parent = arg_315_1.stage_.transform
				var_318_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_315_1.bgs_[var_318_0] = var_318_1
			end

			local var_318_2 = 2

			if var_318_2 < arg_315_1.time_ and arg_315_1.time_ <= var_318_2 + arg_318_0 then
				local var_318_3 = manager.ui.mainCamera.transform.localPosition
				local var_318_4 = Vector3.New(0, 0, 10) + Vector3.New(var_318_3.x, var_318_3.y, 0)
				local var_318_5 = arg_315_1.bgs_.B01c

				var_318_5.transform.localPosition = var_318_4
				var_318_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_318_6 = var_318_5:GetComponent("SpriteRenderer")

				if var_318_6 and var_318_6.sprite then
					local var_318_7 = (var_318_5.transform.localPosition - var_318_3).z
					local var_318_8 = manager.ui.mainCameraCom_
					local var_318_9 = 2 * var_318_7 * Mathf.Tan(var_318_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_318_10 = var_318_9 * var_318_8.aspect
					local var_318_11 = var_318_6.sprite.bounds.size.x
					local var_318_12 = var_318_6.sprite.bounds.size.y
					local var_318_13 = var_318_10 / var_318_11
					local var_318_14 = var_318_9 / var_318_12
					local var_318_15 = var_318_14 < var_318_13 and var_318_13 or var_318_14

					var_318_5.transform.localScale = Vector3.New(var_318_15, var_318_15, 0)
				end

				for iter_318_0, iter_318_1 in pairs(arg_315_1.bgs_) do
					if iter_318_0 ~= "B01c" then
						iter_318_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_318_16 = 0

			if var_318_16 < arg_315_1.time_ and arg_315_1.time_ <= var_318_16 + arg_318_0 then
				arg_315_1.mask_.enabled = true
				arg_315_1.mask_.raycastTarget = true

				arg_315_1:SetGaussion(false)
			end

			local var_318_17 = 2

			if var_318_16 <= arg_315_1.time_ and arg_315_1.time_ < var_318_16 + var_318_17 then
				local var_318_18 = (arg_315_1.time_ - var_318_16) / var_318_17
				local var_318_19 = Color.New(0, 0, 0)

				var_318_19.a = Mathf.Lerp(0, 1, var_318_18)
				arg_315_1.mask_.color = var_318_19
			end

			if arg_315_1.time_ >= var_318_16 + var_318_17 and arg_315_1.time_ < var_318_16 + var_318_17 + arg_318_0 then
				local var_318_20 = Color.New(0, 0, 0)

				var_318_20.a = 1
				arg_315_1.mask_.color = var_318_20
			end

			local var_318_21 = 2

			if var_318_21 < arg_315_1.time_ and arg_315_1.time_ <= var_318_21 + arg_318_0 then
				arg_315_1.mask_.enabled = true
				arg_315_1.mask_.raycastTarget = true

				arg_315_1:SetGaussion(false)
			end

			local var_318_22 = 2

			if var_318_21 <= arg_315_1.time_ and arg_315_1.time_ < var_318_21 + var_318_22 then
				local var_318_23 = (arg_315_1.time_ - var_318_21) / var_318_22
				local var_318_24 = Color.New(0, 0, 0)

				var_318_24.a = Mathf.Lerp(1, 0, var_318_23)
				arg_315_1.mask_.color = var_318_24
			end

			if arg_315_1.time_ >= var_318_21 + var_318_22 and arg_315_1.time_ < var_318_21 + var_318_22 + arg_318_0 then
				local var_318_25 = Color.New(0, 0, 0)
				local var_318_26 = 0

				arg_315_1.mask_.enabled = false
				var_318_25.a = var_318_26
				arg_315_1.mask_.color = var_318_25
			end

			local var_318_27 = arg_315_1.actors_["10034"].transform
			local var_318_28 = 1.966

			if var_318_28 < arg_315_1.time_ and arg_315_1.time_ <= var_318_28 + arg_318_0 then
				arg_315_1.var_.moveOldPos10034 = var_318_27.localPosition
				var_318_27.localScale = Vector3.New(1, 1, 1)

				arg_315_1:CheckSpriteTmpPos("10034", 7)

				local var_318_29 = var_318_27.childCount

				for iter_318_2 = 0, var_318_29 - 1 do
					local var_318_30 = var_318_27:GetChild(iter_318_2)

					if var_318_30.name == "split_2" or not string.find(var_318_30.name, "split") then
						var_318_30.gameObject:SetActive(true)
					else
						var_318_30.gameObject:SetActive(false)
					end
				end
			end

			local var_318_31 = 0.001

			if var_318_28 <= arg_315_1.time_ and arg_315_1.time_ < var_318_28 + var_318_31 then
				local var_318_32 = (arg_315_1.time_ - var_318_28) / var_318_31
				local var_318_33 = Vector3.New(0, -2000, -290)

				var_318_27.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos10034, var_318_33, var_318_32)
			end

			if arg_315_1.time_ >= var_318_28 + var_318_31 and arg_315_1.time_ < var_318_28 + var_318_31 + arg_318_0 then
				var_318_27.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_318_34 = arg_315_1.actors_["1033"].transform
			local var_318_35 = 1.966

			if var_318_35 < arg_315_1.time_ and arg_315_1.time_ <= var_318_35 + arg_318_0 then
				arg_315_1.var_.moveOldPos1033 = var_318_34.localPosition
				var_318_34.localScale = Vector3.New(1, 1, 1)

				arg_315_1:CheckSpriteTmpPos("1033", 7)

				local var_318_36 = var_318_34.childCount

				for iter_318_3 = 0, var_318_36 - 1 do
					local var_318_37 = var_318_34:GetChild(iter_318_3)

					if var_318_37.name == "split_6" or not string.find(var_318_37.name, "split") then
						var_318_37.gameObject:SetActive(true)
					else
						var_318_37.gameObject:SetActive(false)
					end
				end
			end

			local var_318_38 = 0.001

			if var_318_35 <= arg_315_1.time_ and arg_315_1.time_ < var_318_35 + var_318_38 then
				local var_318_39 = (arg_315_1.time_ - var_318_35) / var_318_38
				local var_318_40 = Vector3.New(0, -2000, 0)

				var_318_34.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1033, var_318_40, var_318_39)
			end

			if arg_315_1.time_ >= var_318_35 + var_318_38 and arg_315_1.time_ < var_318_35 + var_318_38 + arg_318_0 then
				var_318_34.localPosition = Vector3.New(0, -2000, 0)
			end

			if arg_315_1.frameCnt_ <= 1 then
				arg_315_1.dialog_:SetActive(false)
			end

			local var_318_41 = 4
			local var_318_42 = 0.65

			if var_318_41 < arg_315_1.time_ and arg_315_1.time_ <= var_318_41 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0

				arg_315_1.dialog_:SetActive(true)

				local var_318_43 = LeanTween.value(arg_315_1.dialog_, 0, 1, 0.3)

				var_318_43:setOnUpdate(LuaHelper.FloatAction(function(arg_319_0)
					arg_315_1.dialogCg_.alpha = arg_319_0
				end))
				var_318_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_315_1.dialog_)
					var_318_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_315_1.duration_ = arg_315_1.duration_ + 0.3

				SetActive(arg_315_1.leftNameGo_, false)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_44 = arg_315_1:GetWordFromCfg(117101079)
				local var_318_45 = arg_315_1:FormatText(var_318_44.content)

				arg_315_1.text_.text = var_318_45

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_46 = 26
				local var_318_47 = utf8.len(var_318_45)
				local var_318_48 = var_318_46 <= 0 and var_318_42 or var_318_42 * (var_318_47 / var_318_46)

				if var_318_48 > 0 and var_318_42 < var_318_48 then
					arg_315_1.talkMaxDuration = var_318_48
					var_318_41 = var_318_41 + 0.3

					if var_318_48 + var_318_41 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_48 + var_318_41
					end
				end

				arg_315_1.text_.text = var_318_45
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)
				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_49 = var_318_41 + 0.3
			local var_318_50 = math.max(var_318_42, arg_315_1.talkMaxDuration)

			if var_318_49 <= arg_315_1.time_ and arg_315_1.time_ < var_318_49 + var_318_50 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_49) / var_318_50

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_49 + var_318_50 and arg_315_1.time_ < var_318_49 + var_318_50 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play117101080 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 117101080
		arg_321_1.duration_ = 5

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play117101081(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = 0
			local var_324_1 = 0.95

			if var_324_0 < arg_321_1.time_ and arg_321_1.time_ <= var_324_0 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, false)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_2 = arg_321_1:GetWordFromCfg(117101080)
				local var_324_3 = arg_321_1:FormatText(var_324_2.content)

				arg_321_1.text_.text = var_324_3

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_4 = 38
				local var_324_5 = utf8.len(var_324_3)
				local var_324_6 = var_324_4 <= 0 and var_324_1 or var_324_1 * (var_324_5 / var_324_4)

				if var_324_6 > 0 and var_324_1 < var_324_6 then
					arg_321_1.talkMaxDuration = var_324_6

					if var_324_6 + var_324_0 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_6 + var_324_0
					end
				end

				arg_321_1.text_.text = var_324_3
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)
				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_7 = math.max(var_324_1, arg_321_1.talkMaxDuration)

			if var_324_0 <= arg_321_1.time_ and arg_321_1.time_ < var_324_0 + var_324_7 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_0) / var_324_7

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_0 + var_324_7 and arg_321_1.time_ < var_324_0 + var_324_7 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play117101081 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 117101081
		arg_325_1.duration_ = 7

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play117101082(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = "B01b"

			if arg_325_1.bgs_[var_328_0] == nil then
				local var_328_1 = Object.Instantiate(arg_325_1.paintGo_)

				var_328_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_328_0)
				var_328_1.name = var_328_0
				var_328_1.transform.parent = arg_325_1.stage_.transform
				var_328_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_325_1.bgs_[var_328_0] = var_328_1
			end

			local var_328_2 = 0

			if var_328_2 < arg_325_1.time_ and arg_325_1.time_ <= var_328_2 + arg_328_0 then
				local var_328_3 = manager.ui.mainCamera.transform.localPosition
				local var_328_4 = Vector3.New(0, 0, 10) + Vector3.New(var_328_3.x, var_328_3.y, 0)
				local var_328_5 = arg_325_1.bgs_.B01b

				var_328_5.transform.localPosition = var_328_4
				var_328_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_328_6 = var_328_5:GetComponent("SpriteRenderer")

				if var_328_6 and var_328_6.sprite then
					local var_328_7 = (var_328_5.transform.localPosition - var_328_3).z
					local var_328_8 = manager.ui.mainCameraCom_
					local var_328_9 = 2 * var_328_7 * Mathf.Tan(var_328_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_328_10 = var_328_9 * var_328_8.aspect
					local var_328_11 = var_328_6.sprite.bounds.size.x
					local var_328_12 = var_328_6.sprite.bounds.size.y
					local var_328_13 = var_328_10 / var_328_11
					local var_328_14 = var_328_9 / var_328_12
					local var_328_15 = var_328_14 < var_328_13 and var_328_13 or var_328_14

					var_328_5.transform.localScale = Vector3.New(var_328_15, var_328_15, 0)
				end

				for iter_328_0, iter_328_1 in pairs(arg_325_1.bgs_) do
					if iter_328_0 ~= "B01b" then
						iter_328_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_328_16 = 0

			if var_328_16 < arg_325_1.time_ and arg_325_1.time_ <= var_328_16 + arg_328_0 then
				arg_325_1.mask_.enabled = true
				arg_325_1.mask_.raycastTarget = true

				arg_325_1:SetGaussion(false)
			end

			local var_328_17 = 2

			if var_328_16 <= arg_325_1.time_ and arg_325_1.time_ < var_328_16 + var_328_17 then
				local var_328_18 = (arg_325_1.time_ - var_328_16) / var_328_17
				local var_328_19 = Color.New(1, 1, 1)

				var_328_19.a = Mathf.Lerp(1, 0, var_328_18)
				arg_325_1.mask_.color = var_328_19
			end

			if arg_325_1.time_ >= var_328_16 + var_328_17 and arg_325_1.time_ < var_328_16 + var_328_17 + arg_328_0 then
				local var_328_20 = Color.New(1, 1, 1)
				local var_328_21 = 0

				arg_325_1.mask_.enabled = false
				var_328_20.a = var_328_21
				arg_325_1.mask_.color = var_328_20
			end

			local var_328_22 = 0
			local var_328_23 = 1

			if var_328_22 < arg_325_1.time_ and arg_325_1.time_ <= var_328_22 + arg_328_0 then
				local var_328_24 = "play"
				local var_328_25 = "effect"

				arg_325_1:AudioAction(var_328_24, var_328_25, "se_story_17", "se_story_17_headlamps", "")
			end

			if arg_325_1.frameCnt_ <= 1 then
				arg_325_1.dialog_:SetActive(false)
			end

			local var_328_26 = 2
			local var_328_27 = 1.175

			if var_328_26 < arg_325_1.time_ and arg_325_1.time_ <= var_328_26 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0

				arg_325_1.dialog_:SetActive(true)

				local var_328_28 = LeanTween.value(arg_325_1.dialog_, 0, 1, 0.3)

				var_328_28:setOnUpdate(LuaHelper.FloatAction(function(arg_329_0)
					arg_325_1.dialogCg_.alpha = arg_329_0
				end))
				var_328_28:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_325_1.dialog_)
					var_328_28:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_325_1.duration_ = arg_325_1.duration_ + 0.3

				SetActive(arg_325_1.leftNameGo_, false)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_29 = arg_325_1:GetWordFromCfg(117101081)
				local var_328_30 = arg_325_1:FormatText(var_328_29.content)

				arg_325_1.text_.text = var_328_30

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_31 = 47
				local var_328_32 = utf8.len(var_328_30)
				local var_328_33 = var_328_31 <= 0 and var_328_27 or var_328_27 * (var_328_32 / var_328_31)

				if var_328_33 > 0 and var_328_27 < var_328_33 then
					arg_325_1.talkMaxDuration = var_328_33
					var_328_26 = var_328_26 + 0.3

					if var_328_33 + var_328_26 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_33 + var_328_26
					end
				end

				arg_325_1.text_.text = var_328_30
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)
				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_34 = var_328_26 + 0.3
			local var_328_35 = math.max(var_328_27, arg_325_1.talkMaxDuration)

			if var_328_34 <= arg_325_1.time_ and arg_325_1.time_ < var_328_34 + var_328_35 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_34) / var_328_35

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_34 + var_328_35 and arg_325_1.time_ < var_328_34 + var_328_35 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play117101082 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 117101082
		arg_331_1.duration_ = 7.933

		local var_331_0 = {
			zh = 7.933,
			ja = 7.666
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
				arg_331_0:Play117101083(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = "10036"

			if arg_331_1.actors_[var_334_0] == nil then
				local var_334_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_334_0), arg_331_1.canvasGo_.transform)

				var_334_1.transform:SetSiblingIndex(1)

				var_334_1.name = var_334_0
				var_334_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_331_1.actors_[var_334_0] = var_334_1
			end

			local var_334_2 = arg_331_1.actors_["10036"].transform
			local var_334_3 = 0

			if var_334_3 < arg_331_1.time_ and arg_331_1.time_ <= var_334_3 + arg_334_0 then
				arg_331_1.var_.moveOldPos10036 = var_334_2.localPosition
				var_334_2.localScale = Vector3.New(1, 1, 1)

				arg_331_1:CheckSpriteTmpPos("10036", 2)

				local var_334_4 = var_334_2.childCount

				for iter_334_0 = 0, var_334_4 - 1 do
					local var_334_5 = var_334_2:GetChild(iter_334_0)

					if var_334_5.name == "split_1" or not string.find(var_334_5.name, "split") then
						var_334_5.gameObject:SetActive(true)
					else
						var_334_5.gameObject:SetActive(false)
					end
				end
			end

			local var_334_6 = 0.001

			if var_334_3 <= arg_331_1.time_ and arg_331_1.time_ < var_334_3 + var_334_6 then
				local var_334_7 = (arg_331_1.time_ - var_334_3) / var_334_6
				local var_334_8 = Vector3.New(-390, -445, -290)

				var_334_2.localPosition = Vector3.Lerp(arg_331_1.var_.moveOldPos10036, var_334_8, var_334_7)
			end

			if arg_331_1.time_ >= var_334_3 + var_334_6 and arg_331_1.time_ < var_334_3 + var_334_6 + arg_334_0 then
				var_334_2.localPosition = Vector3.New(-390, -445, -290)
			end

			local var_334_9 = arg_331_1.actors_["10036"]
			local var_334_10 = 0

			if var_334_10 < arg_331_1.time_ and arg_331_1.time_ <= var_334_10 + arg_334_0 and arg_331_1.var_.actorSpriteComps10036 == nil then
				arg_331_1.var_.actorSpriteComps10036 = var_334_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_334_11 = 0.2

			if var_334_10 <= arg_331_1.time_ and arg_331_1.time_ < var_334_10 + var_334_11 then
				local var_334_12 = (arg_331_1.time_ - var_334_10) / var_334_11

				if arg_331_1.var_.actorSpriteComps10036 then
					for iter_334_1, iter_334_2 in pairs(arg_331_1.var_.actorSpriteComps10036:ToTable()) do
						if iter_334_2 then
							local var_334_13 = Mathf.Lerp(iter_334_2.color.r, 1, var_334_12)

							iter_334_2.color = Color.New(var_334_13, var_334_13, var_334_13)
						end
					end
				end
			end

			if arg_331_1.time_ >= var_334_10 + var_334_11 and arg_331_1.time_ < var_334_10 + var_334_11 + arg_334_0 and arg_331_1.var_.actorSpriteComps10036 then
				local var_334_14 = 1

				for iter_334_3, iter_334_4 in pairs(arg_331_1.var_.actorSpriteComps10036:ToTable()) do
					if iter_334_4 then
						iter_334_4.color = Color.New(var_334_14, var_334_14, var_334_14)
					end
				end

				arg_331_1.var_.actorSpriteComps10036 = nil
			end

			local var_334_15 = arg_331_1.actors_["10036"]
			local var_334_16 = 0

			if var_334_16 < arg_331_1.time_ and arg_331_1.time_ <= var_334_16 + arg_334_0 then
				local var_334_17 = var_334_15:GetComponentInChildren(typeof(CanvasGroup))

				if var_334_17 then
					arg_331_1.var_.alphaOldValue10036 = var_334_17.alpha
					arg_331_1.var_.characterEffect10036 = var_334_17
				end

				arg_331_1.var_.alphaOldValue10036 = 0
			end

			local var_334_18 = 0.5

			if var_334_16 <= arg_331_1.time_ and arg_331_1.time_ < var_334_16 + var_334_18 then
				local var_334_19 = (arg_331_1.time_ - var_334_16) / var_334_18
				local var_334_20 = Mathf.Lerp(arg_331_1.var_.alphaOldValue10036, 1, var_334_19)

				if arg_331_1.var_.characterEffect10036 then
					arg_331_1.var_.characterEffect10036.alpha = var_334_20
				end
			end

			if arg_331_1.time_ >= var_334_16 + var_334_18 and arg_331_1.time_ < var_334_16 + var_334_18 + arg_334_0 and arg_331_1.var_.characterEffect10036 then
				arg_331_1.var_.characterEffect10036.alpha = 1
			end

			local var_334_21 = 0
			local var_334_22 = 0.8

			if var_334_21 < arg_331_1.time_ and arg_331_1.time_ <= var_334_21 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_23 = arg_331_1:FormatText(StoryNameCfg[370].name)

				arg_331_1.leftNameTxt_.text = var_334_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_24 = arg_331_1:GetWordFromCfg(117101082)
				local var_334_25 = arg_331_1:FormatText(var_334_24.content)

				arg_331_1.text_.text = var_334_25

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_26 = 32
				local var_334_27 = utf8.len(var_334_25)
				local var_334_28 = var_334_26 <= 0 and var_334_22 or var_334_22 * (var_334_27 / var_334_26)

				if var_334_28 > 0 and var_334_22 < var_334_28 then
					arg_331_1.talkMaxDuration = var_334_28

					if var_334_28 + var_334_21 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_28 + var_334_21
					end
				end

				arg_331_1.text_.text = var_334_25
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101082", "story_v_out_117101.awb") ~= 0 then
					local var_334_29 = manager.audio:GetVoiceLength("story_v_out_117101", "117101082", "story_v_out_117101.awb") / 1000

					if var_334_29 + var_334_21 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_29 + var_334_21
					end

					if var_334_24.prefab_name ~= "" and arg_331_1.actors_[var_334_24.prefab_name] ~= nil then
						local var_334_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_24.prefab_name].transform, "story_v_out_117101", "117101082", "story_v_out_117101.awb")

						arg_331_1:RecordAudio("117101082", var_334_30)
						arg_331_1:RecordAudio("117101082", var_334_30)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_117101", "117101082", "story_v_out_117101.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_117101", "117101082", "story_v_out_117101.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_31 = math.max(var_334_22, arg_331_1.talkMaxDuration)

			if var_334_21 <= arg_331_1.time_ and arg_331_1.time_ < var_334_21 + var_334_31 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_21) / var_334_31

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_21 + var_334_31 and arg_331_1.time_ < var_334_21 + var_334_31 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play117101083 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 117101083
		arg_335_1.duration_ = 11.866

		local var_335_0 = {
			zh = 8.2,
			ja = 11.866
		}
		local var_335_1 = manager.audio:GetLocalizationFlag()

		if var_335_0[var_335_1] ~= nil then
			arg_335_1.duration_ = var_335_0[var_335_1]
		end

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play117101084(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = 0
			local var_338_1 = 0.95

			if var_338_0 < arg_335_1.time_ and arg_335_1.time_ <= var_338_0 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_2 = arg_335_1:FormatText(StoryNameCfg[370].name)

				arg_335_1.leftNameTxt_.text = var_338_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_3 = arg_335_1:GetWordFromCfg(117101083)
				local var_338_4 = arg_335_1:FormatText(var_338_3.content)

				arg_335_1.text_.text = var_338_4

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_5 = 38
				local var_338_6 = utf8.len(var_338_4)
				local var_338_7 = var_338_5 <= 0 and var_338_1 or var_338_1 * (var_338_6 / var_338_5)

				if var_338_7 > 0 and var_338_1 < var_338_7 then
					arg_335_1.talkMaxDuration = var_338_7

					if var_338_7 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_7 + var_338_0
					end
				end

				arg_335_1.text_.text = var_338_4
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101083", "story_v_out_117101.awb") ~= 0 then
					local var_338_8 = manager.audio:GetVoiceLength("story_v_out_117101", "117101083", "story_v_out_117101.awb") / 1000

					if var_338_8 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_8 + var_338_0
					end

					if var_338_3.prefab_name ~= "" and arg_335_1.actors_[var_338_3.prefab_name] ~= nil then
						local var_338_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_3.prefab_name].transform, "story_v_out_117101", "117101083", "story_v_out_117101.awb")

						arg_335_1:RecordAudio("117101083", var_338_9)
						arg_335_1:RecordAudio("117101083", var_338_9)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_117101", "117101083", "story_v_out_117101.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_117101", "117101083", "story_v_out_117101.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_10 = math.max(var_338_1, arg_335_1.talkMaxDuration)

			if var_338_0 <= arg_335_1.time_ and arg_335_1.time_ < var_338_0 + var_338_10 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_0) / var_338_10

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_0 + var_338_10 and arg_335_1.time_ < var_338_0 + var_338_10 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play117101084 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 117101084
		arg_339_1.duration_ = 7.2

		local var_339_0 = {
			zh = 6.6,
			ja = 7.2
		}
		local var_339_1 = manager.audio:GetLocalizationFlag()

		if var_339_0[var_339_1] ~= nil then
			arg_339_1.duration_ = var_339_0[var_339_1]
		end

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play117101085(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = "1132"

			if arg_339_1.actors_[var_342_0] == nil then
				local var_342_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_342_0), arg_339_1.canvasGo_.transform)

				var_342_1.transform:SetSiblingIndex(1)

				var_342_1.name = var_342_0
				var_342_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_339_1.actors_[var_342_0] = var_342_1
			end

			local var_342_2 = arg_339_1.actors_["1132"].transform
			local var_342_3 = 0

			if var_342_3 < arg_339_1.time_ and arg_339_1.time_ <= var_342_3 + arg_342_0 then
				arg_339_1.var_.moveOldPos1132 = var_342_2.localPosition
				var_342_2.localScale = Vector3.New(1, 1, 1)

				arg_339_1:CheckSpriteTmpPos("1132", 4)

				local var_342_4 = var_342_2.childCount

				for iter_342_0 = 0, var_342_4 - 1 do
					local var_342_5 = var_342_2:GetChild(iter_342_0)

					if var_342_5.name == "split_6" or not string.find(var_342_5.name, "split") then
						var_342_5.gameObject:SetActive(true)
					else
						var_342_5.gameObject:SetActive(false)
					end
				end
			end

			local var_342_6 = 0.001

			if var_342_3 <= arg_339_1.time_ and arg_339_1.time_ < var_342_3 + var_342_6 then
				local var_342_7 = (arg_339_1.time_ - var_342_3) / var_342_6
				local var_342_8 = Vector3.New(390, -413, -185)

				var_342_2.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1132, var_342_8, var_342_7)
			end

			if arg_339_1.time_ >= var_342_3 + var_342_6 and arg_339_1.time_ < var_342_3 + var_342_6 + arg_342_0 then
				var_342_2.localPosition = Vector3.New(390, -413, -185)
			end

			local var_342_9 = arg_339_1.actors_["10036"]
			local var_342_10 = 0

			if var_342_10 < arg_339_1.time_ and arg_339_1.time_ <= var_342_10 + arg_342_0 and arg_339_1.var_.actorSpriteComps10036 == nil then
				arg_339_1.var_.actorSpriteComps10036 = var_342_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_342_11 = 0.2

			if var_342_10 <= arg_339_1.time_ and arg_339_1.time_ < var_342_10 + var_342_11 then
				local var_342_12 = (arg_339_1.time_ - var_342_10) / var_342_11

				if arg_339_1.var_.actorSpriteComps10036 then
					for iter_342_1, iter_342_2 in pairs(arg_339_1.var_.actorSpriteComps10036:ToTable()) do
						if iter_342_2 then
							local var_342_13 = Mathf.Lerp(iter_342_2.color.r, 0.5, var_342_12)

							iter_342_2.color = Color.New(var_342_13, var_342_13, var_342_13)
						end
					end
				end
			end

			if arg_339_1.time_ >= var_342_10 + var_342_11 and arg_339_1.time_ < var_342_10 + var_342_11 + arg_342_0 and arg_339_1.var_.actorSpriteComps10036 then
				local var_342_14 = 0.5

				for iter_342_3, iter_342_4 in pairs(arg_339_1.var_.actorSpriteComps10036:ToTable()) do
					if iter_342_4 then
						iter_342_4.color = Color.New(var_342_14, var_342_14, var_342_14)
					end
				end

				arg_339_1.var_.actorSpriteComps10036 = nil
			end

			local var_342_15 = arg_339_1.actors_["1132"]
			local var_342_16 = 0

			if var_342_16 < arg_339_1.time_ and arg_339_1.time_ <= var_342_16 + arg_342_0 and arg_339_1.var_.actorSpriteComps1132 == nil then
				arg_339_1.var_.actorSpriteComps1132 = var_342_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_342_17 = 0.2

			if var_342_16 <= arg_339_1.time_ and arg_339_1.time_ < var_342_16 + var_342_17 then
				local var_342_18 = (arg_339_1.time_ - var_342_16) / var_342_17

				if arg_339_1.var_.actorSpriteComps1132 then
					for iter_342_5, iter_342_6 in pairs(arg_339_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_342_6 then
							local var_342_19 = Mathf.Lerp(iter_342_6.color.r, 1, var_342_18)

							iter_342_6.color = Color.New(var_342_19, var_342_19, var_342_19)
						end
					end
				end
			end

			if arg_339_1.time_ >= var_342_16 + var_342_17 and arg_339_1.time_ < var_342_16 + var_342_17 + arg_342_0 and arg_339_1.var_.actorSpriteComps1132 then
				local var_342_20 = 1

				for iter_342_7, iter_342_8 in pairs(arg_339_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_342_8 then
						iter_342_8.color = Color.New(var_342_20, var_342_20, var_342_20)
					end
				end

				arg_339_1.var_.actorSpriteComps1132 = nil
			end

			local var_342_21 = 0
			local var_342_22 = 0.875

			if var_342_21 < arg_339_1.time_ and arg_339_1.time_ <= var_342_21 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_23 = arg_339_1:FormatText(StoryNameCfg[61].name)

				arg_339_1.leftNameTxt_.text = var_342_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_24 = arg_339_1:GetWordFromCfg(117101084)
				local var_342_25 = arg_339_1:FormatText(var_342_24.content)

				arg_339_1.text_.text = var_342_25

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_26 = 35
				local var_342_27 = utf8.len(var_342_25)
				local var_342_28 = var_342_26 <= 0 and var_342_22 or var_342_22 * (var_342_27 / var_342_26)

				if var_342_28 > 0 and var_342_22 < var_342_28 then
					arg_339_1.talkMaxDuration = var_342_28

					if var_342_28 + var_342_21 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_28 + var_342_21
					end
				end

				arg_339_1.text_.text = var_342_25
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101084", "story_v_out_117101.awb") ~= 0 then
					local var_342_29 = manager.audio:GetVoiceLength("story_v_out_117101", "117101084", "story_v_out_117101.awb") / 1000

					if var_342_29 + var_342_21 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_29 + var_342_21
					end

					if var_342_24.prefab_name ~= "" and arg_339_1.actors_[var_342_24.prefab_name] ~= nil then
						local var_342_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_24.prefab_name].transform, "story_v_out_117101", "117101084", "story_v_out_117101.awb")

						arg_339_1:RecordAudio("117101084", var_342_30)
						arg_339_1:RecordAudio("117101084", var_342_30)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_117101", "117101084", "story_v_out_117101.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_117101", "117101084", "story_v_out_117101.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_31 = math.max(var_342_22, arg_339_1.talkMaxDuration)

			if var_342_21 <= arg_339_1.time_ and arg_339_1.time_ < var_342_21 + var_342_31 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_21) / var_342_31

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_21 + var_342_31 and arg_339_1.time_ < var_342_21 + var_342_31 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play117101085 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 117101085
		arg_343_1.duration_ = 17.633

		local var_343_0 = {
			zh = 17.633,
			ja = 12.8
		}
		local var_343_1 = manager.audio:GetLocalizationFlag()

		if var_343_0[var_343_1] ~= nil then
			arg_343_1.duration_ = var_343_0[var_343_1]
		end

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play117101086(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["10036"]
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 and arg_343_1.var_.actorSpriteComps10036 == nil then
				arg_343_1.var_.actorSpriteComps10036 = var_346_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_346_2 = 0.2

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2

				if arg_343_1.var_.actorSpriteComps10036 then
					for iter_346_0, iter_346_1 in pairs(arg_343_1.var_.actorSpriteComps10036:ToTable()) do
						if iter_346_1 then
							local var_346_4 = Mathf.Lerp(iter_346_1.color.r, 1, var_346_3)

							iter_346_1.color = Color.New(var_346_4, var_346_4, var_346_4)
						end
					end
				end
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 and arg_343_1.var_.actorSpriteComps10036 then
				local var_346_5 = 1

				for iter_346_2, iter_346_3 in pairs(arg_343_1.var_.actorSpriteComps10036:ToTable()) do
					if iter_346_3 then
						iter_346_3.color = Color.New(var_346_5, var_346_5, var_346_5)
					end
				end

				arg_343_1.var_.actorSpriteComps10036 = nil
			end

			local var_346_6 = arg_343_1.actors_["1132"]
			local var_346_7 = 0

			if var_346_7 < arg_343_1.time_ and arg_343_1.time_ <= var_346_7 + arg_346_0 and arg_343_1.var_.actorSpriteComps1132 == nil then
				arg_343_1.var_.actorSpriteComps1132 = var_346_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_346_8 = 0.2

			if var_346_7 <= arg_343_1.time_ and arg_343_1.time_ < var_346_7 + var_346_8 then
				local var_346_9 = (arg_343_1.time_ - var_346_7) / var_346_8

				if arg_343_1.var_.actorSpriteComps1132 then
					for iter_346_4, iter_346_5 in pairs(arg_343_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_346_5 then
							local var_346_10 = Mathf.Lerp(iter_346_5.color.r, 0.5, var_346_9)

							iter_346_5.color = Color.New(var_346_10, var_346_10, var_346_10)
						end
					end
				end
			end

			if arg_343_1.time_ >= var_346_7 + var_346_8 and arg_343_1.time_ < var_346_7 + var_346_8 + arg_346_0 and arg_343_1.var_.actorSpriteComps1132 then
				local var_346_11 = 0.5

				for iter_346_6, iter_346_7 in pairs(arg_343_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_346_7 then
						iter_346_7.color = Color.New(var_346_11, var_346_11, var_346_11)
					end
				end

				arg_343_1.var_.actorSpriteComps1132 = nil
			end

			local var_346_12 = 0
			local var_346_13 = 1.5

			if var_346_12 < arg_343_1.time_ and arg_343_1.time_ <= var_346_12 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_14 = arg_343_1:FormatText(StoryNameCfg[370].name)

				arg_343_1.leftNameTxt_.text = var_346_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_15 = arg_343_1:GetWordFromCfg(117101085)
				local var_346_16 = arg_343_1:FormatText(var_346_15.content)

				arg_343_1.text_.text = var_346_16

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_17 = 60
				local var_346_18 = utf8.len(var_346_16)
				local var_346_19 = var_346_17 <= 0 and var_346_13 or var_346_13 * (var_346_18 / var_346_17)

				if var_346_19 > 0 and var_346_13 < var_346_19 then
					arg_343_1.talkMaxDuration = var_346_19

					if var_346_19 + var_346_12 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_19 + var_346_12
					end
				end

				arg_343_1.text_.text = var_346_16
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101085", "story_v_out_117101.awb") ~= 0 then
					local var_346_20 = manager.audio:GetVoiceLength("story_v_out_117101", "117101085", "story_v_out_117101.awb") / 1000

					if var_346_20 + var_346_12 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_20 + var_346_12
					end

					if var_346_15.prefab_name ~= "" and arg_343_1.actors_[var_346_15.prefab_name] ~= nil then
						local var_346_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_15.prefab_name].transform, "story_v_out_117101", "117101085", "story_v_out_117101.awb")

						arg_343_1:RecordAudio("117101085", var_346_21)
						arg_343_1:RecordAudio("117101085", var_346_21)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_out_117101", "117101085", "story_v_out_117101.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_out_117101", "117101085", "story_v_out_117101.awb")
				end

				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_22 = math.max(var_346_13, arg_343_1.talkMaxDuration)

			if var_346_12 <= arg_343_1.time_ and arg_343_1.time_ < var_346_12 + var_346_22 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_12) / var_346_22

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_12 + var_346_22 and arg_343_1.time_ < var_346_12 + var_346_22 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play117101086 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 117101086
		arg_347_1.duration_ = 6.733

		local var_347_0 = {
			zh = 4.233,
			ja = 6.733
		}
		local var_347_1 = manager.audio:GetLocalizationFlag()

		if var_347_0[var_347_1] ~= nil then
			arg_347_1.duration_ = var_347_0[var_347_1]
		end

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play117101087(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["10036"]
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 and arg_347_1.var_.actorSpriteComps10036 == nil then
				arg_347_1.var_.actorSpriteComps10036 = var_350_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_350_2 = 0.2

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2

				if arg_347_1.var_.actorSpriteComps10036 then
					for iter_350_0, iter_350_1 in pairs(arg_347_1.var_.actorSpriteComps10036:ToTable()) do
						if iter_350_1 then
							local var_350_4 = Mathf.Lerp(iter_350_1.color.r, 0.5, var_350_3)

							iter_350_1.color = Color.New(var_350_4, var_350_4, var_350_4)
						end
					end
				end
			end

			if arg_347_1.time_ >= var_350_1 + var_350_2 and arg_347_1.time_ < var_350_1 + var_350_2 + arg_350_0 and arg_347_1.var_.actorSpriteComps10036 then
				local var_350_5 = 0.5

				for iter_350_2, iter_350_3 in pairs(arg_347_1.var_.actorSpriteComps10036:ToTable()) do
					if iter_350_3 then
						iter_350_3.color = Color.New(var_350_5, var_350_5, var_350_5)
					end
				end

				arg_347_1.var_.actorSpriteComps10036 = nil
			end

			local var_350_6 = arg_347_1.actors_["1132"]
			local var_350_7 = 0

			if var_350_7 < arg_347_1.time_ and arg_347_1.time_ <= var_350_7 + arg_350_0 and arg_347_1.var_.actorSpriteComps1132 == nil then
				arg_347_1.var_.actorSpriteComps1132 = var_350_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_350_8 = 0.2

			if var_350_7 <= arg_347_1.time_ and arg_347_1.time_ < var_350_7 + var_350_8 then
				local var_350_9 = (arg_347_1.time_ - var_350_7) / var_350_8

				if arg_347_1.var_.actorSpriteComps1132 then
					for iter_350_4, iter_350_5 in pairs(arg_347_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_350_5 then
							local var_350_10 = Mathf.Lerp(iter_350_5.color.r, 1, var_350_9)

							iter_350_5.color = Color.New(var_350_10, var_350_10, var_350_10)
						end
					end
				end
			end

			if arg_347_1.time_ >= var_350_7 + var_350_8 and arg_347_1.time_ < var_350_7 + var_350_8 + arg_350_0 and arg_347_1.var_.actorSpriteComps1132 then
				local var_350_11 = 1

				for iter_350_6, iter_350_7 in pairs(arg_347_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_350_7 then
						iter_350_7.color = Color.New(var_350_11, var_350_11, var_350_11)
					end
				end

				arg_347_1.var_.actorSpriteComps1132 = nil
			end

			local var_350_12 = 0
			local var_350_13 = 0.45

			if var_350_12 < arg_347_1.time_ and arg_347_1.time_ <= var_350_12 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_14 = arg_347_1:FormatText(StoryNameCfg[61].name)

				arg_347_1.leftNameTxt_.text = var_350_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_15 = arg_347_1:GetWordFromCfg(117101086)
				local var_350_16 = arg_347_1:FormatText(var_350_15.content)

				arg_347_1.text_.text = var_350_16

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_17 = 18
				local var_350_18 = utf8.len(var_350_16)
				local var_350_19 = var_350_17 <= 0 and var_350_13 or var_350_13 * (var_350_18 / var_350_17)

				if var_350_19 > 0 and var_350_13 < var_350_19 then
					arg_347_1.talkMaxDuration = var_350_19

					if var_350_19 + var_350_12 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_19 + var_350_12
					end
				end

				arg_347_1.text_.text = var_350_16
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101086", "story_v_out_117101.awb") ~= 0 then
					local var_350_20 = manager.audio:GetVoiceLength("story_v_out_117101", "117101086", "story_v_out_117101.awb") / 1000

					if var_350_20 + var_350_12 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_20 + var_350_12
					end

					if var_350_15.prefab_name ~= "" and arg_347_1.actors_[var_350_15.prefab_name] ~= nil then
						local var_350_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_15.prefab_name].transform, "story_v_out_117101", "117101086", "story_v_out_117101.awb")

						arg_347_1:RecordAudio("117101086", var_350_21)
						arg_347_1:RecordAudio("117101086", var_350_21)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_117101", "117101086", "story_v_out_117101.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_117101", "117101086", "story_v_out_117101.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_22 = math.max(var_350_13, arg_347_1.talkMaxDuration)

			if var_350_12 <= arg_347_1.time_ and arg_347_1.time_ < var_350_12 + var_350_22 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_12) / var_350_22

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_12 + var_350_22 and arg_347_1.time_ < var_350_12 + var_350_22 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play117101087 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 117101087
		arg_351_1.duration_ = 12

		local var_351_0 = {
			zh = 10.1,
			ja = 12
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
				arg_351_0:Play117101088(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["10036"]
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 and arg_351_1.var_.actorSpriteComps10036 == nil then
				arg_351_1.var_.actorSpriteComps10036 = var_354_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_354_2 = 0.2

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_2 then
				local var_354_3 = (arg_351_1.time_ - var_354_1) / var_354_2

				if arg_351_1.var_.actorSpriteComps10036 then
					for iter_354_0, iter_354_1 in pairs(arg_351_1.var_.actorSpriteComps10036:ToTable()) do
						if iter_354_1 then
							local var_354_4 = Mathf.Lerp(iter_354_1.color.r, 1, var_354_3)

							iter_354_1.color = Color.New(var_354_4, var_354_4, var_354_4)
						end
					end
				end
			end

			if arg_351_1.time_ >= var_354_1 + var_354_2 and arg_351_1.time_ < var_354_1 + var_354_2 + arg_354_0 and arg_351_1.var_.actorSpriteComps10036 then
				local var_354_5 = 1

				for iter_354_2, iter_354_3 in pairs(arg_351_1.var_.actorSpriteComps10036:ToTable()) do
					if iter_354_3 then
						iter_354_3.color = Color.New(var_354_5, var_354_5, var_354_5)
					end
				end

				arg_351_1.var_.actorSpriteComps10036 = nil
			end

			local var_354_6 = arg_351_1.actors_["1132"]
			local var_354_7 = 0

			if var_354_7 < arg_351_1.time_ and arg_351_1.time_ <= var_354_7 + arg_354_0 and arg_351_1.var_.actorSpriteComps1132 == nil then
				arg_351_1.var_.actorSpriteComps1132 = var_354_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_354_8 = 0.2

			if var_354_7 <= arg_351_1.time_ and arg_351_1.time_ < var_354_7 + var_354_8 then
				local var_354_9 = (arg_351_1.time_ - var_354_7) / var_354_8

				if arg_351_1.var_.actorSpriteComps1132 then
					for iter_354_4, iter_354_5 in pairs(arg_351_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_354_5 then
							local var_354_10 = Mathf.Lerp(iter_354_5.color.r, 0.5, var_354_9)

							iter_354_5.color = Color.New(var_354_10, var_354_10, var_354_10)
						end
					end
				end
			end

			if arg_351_1.time_ >= var_354_7 + var_354_8 and arg_351_1.time_ < var_354_7 + var_354_8 + arg_354_0 and arg_351_1.var_.actorSpriteComps1132 then
				local var_354_11 = 0.5

				for iter_354_6, iter_354_7 in pairs(arg_351_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_354_7 then
						iter_354_7.color = Color.New(var_354_11, var_354_11, var_354_11)
					end
				end

				arg_351_1.var_.actorSpriteComps1132 = nil
			end

			local var_354_12 = 0
			local var_354_13 = 1.075

			if var_354_12 < arg_351_1.time_ and arg_351_1.time_ <= var_354_12 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_14 = arg_351_1:FormatText(StoryNameCfg[370].name)

				arg_351_1.leftNameTxt_.text = var_354_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_15 = arg_351_1:GetWordFromCfg(117101087)
				local var_354_16 = arg_351_1:FormatText(var_354_15.content)

				arg_351_1.text_.text = var_354_16

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_17 = 43
				local var_354_18 = utf8.len(var_354_16)
				local var_354_19 = var_354_17 <= 0 and var_354_13 or var_354_13 * (var_354_18 / var_354_17)

				if var_354_19 > 0 and var_354_13 < var_354_19 then
					arg_351_1.talkMaxDuration = var_354_19

					if var_354_19 + var_354_12 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_19 + var_354_12
					end
				end

				arg_351_1.text_.text = var_354_16
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101087", "story_v_out_117101.awb") ~= 0 then
					local var_354_20 = manager.audio:GetVoiceLength("story_v_out_117101", "117101087", "story_v_out_117101.awb") / 1000

					if var_354_20 + var_354_12 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_20 + var_354_12
					end

					if var_354_15.prefab_name ~= "" and arg_351_1.actors_[var_354_15.prefab_name] ~= nil then
						local var_354_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_15.prefab_name].transform, "story_v_out_117101", "117101087", "story_v_out_117101.awb")

						arg_351_1:RecordAudio("117101087", var_354_21)
						arg_351_1:RecordAudio("117101087", var_354_21)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_out_117101", "117101087", "story_v_out_117101.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_out_117101", "117101087", "story_v_out_117101.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_22 = math.max(var_354_13, arg_351_1.talkMaxDuration)

			if var_354_12 <= arg_351_1.time_ and arg_351_1.time_ < var_354_12 + var_354_22 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_12) / var_354_22

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_12 + var_354_22 and arg_351_1.time_ < var_354_12 + var_354_22 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play117101088 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 117101088
		arg_355_1.duration_ = 9.9

		local var_355_0 = {
			zh = 7.8,
			ja = 9.9
		}
		local var_355_1 = manager.audio:GetLocalizationFlag()

		if var_355_0[var_355_1] ~= nil then
			arg_355_1.duration_ = var_355_0[var_355_1]
		end

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play117101089(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["10036"]
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 and arg_355_1.var_.actorSpriteComps10036 == nil then
				arg_355_1.var_.actorSpriteComps10036 = var_358_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_358_2 = 0.2

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2

				if arg_355_1.var_.actorSpriteComps10036 then
					for iter_358_0, iter_358_1 in pairs(arg_355_1.var_.actorSpriteComps10036:ToTable()) do
						if iter_358_1 then
							local var_358_4 = Mathf.Lerp(iter_358_1.color.r, 0.5, var_358_3)

							iter_358_1.color = Color.New(var_358_4, var_358_4, var_358_4)
						end
					end
				end
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 and arg_355_1.var_.actorSpriteComps10036 then
				local var_358_5 = 0.5

				for iter_358_2, iter_358_3 in pairs(arg_355_1.var_.actorSpriteComps10036:ToTable()) do
					if iter_358_3 then
						iter_358_3.color = Color.New(var_358_5, var_358_5, var_358_5)
					end
				end

				arg_355_1.var_.actorSpriteComps10036 = nil
			end

			local var_358_6 = arg_355_1.actors_["1132"]
			local var_358_7 = 0

			if var_358_7 < arg_355_1.time_ and arg_355_1.time_ <= var_358_7 + arg_358_0 and arg_355_1.var_.actorSpriteComps1132 == nil then
				arg_355_1.var_.actorSpriteComps1132 = var_358_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_358_8 = 0.2

			if var_358_7 <= arg_355_1.time_ and arg_355_1.time_ < var_358_7 + var_358_8 then
				local var_358_9 = (arg_355_1.time_ - var_358_7) / var_358_8

				if arg_355_1.var_.actorSpriteComps1132 then
					for iter_358_4, iter_358_5 in pairs(arg_355_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_358_5 then
							local var_358_10 = Mathf.Lerp(iter_358_5.color.r, 1, var_358_9)

							iter_358_5.color = Color.New(var_358_10, var_358_10, var_358_10)
						end
					end
				end
			end

			if arg_355_1.time_ >= var_358_7 + var_358_8 and arg_355_1.time_ < var_358_7 + var_358_8 + arg_358_0 and arg_355_1.var_.actorSpriteComps1132 then
				local var_358_11 = 1

				for iter_358_6, iter_358_7 in pairs(arg_355_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_358_7 then
						iter_358_7.color = Color.New(var_358_11, var_358_11, var_358_11)
					end
				end

				arg_355_1.var_.actorSpriteComps1132 = nil
			end

			local var_358_12 = 0
			local var_358_13 = 0.875

			if var_358_12 < arg_355_1.time_ and arg_355_1.time_ <= var_358_12 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_14 = arg_355_1:FormatText(StoryNameCfg[61].name)

				arg_355_1.leftNameTxt_.text = var_358_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_15 = arg_355_1:GetWordFromCfg(117101088)
				local var_358_16 = arg_355_1:FormatText(var_358_15.content)

				arg_355_1.text_.text = var_358_16

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_17 = 35
				local var_358_18 = utf8.len(var_358_16)
				local var_358_19 = var_358_17 <= 0 and var_358_13 or var_358_13 * (var_358_18 / var_358_17)

				if var_358_19 > 0 and var_358_13 < var_358_19 then
					arg_355_1.talkMaxDuration = var_358_19

					if var_358_19 + var_358_12 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_19 + var_358_12
					end
				end

				arg_355_1.text_.text = var_358_16
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101088", "story_v_out_117101.awb") ~= 0 then
					local var_358_20 = manager.audio:GetVoiceLength("story_v_out_117101", "117101088", "story_v_out_117101.awb") / 1000

					if var_358_20 + var_358_12 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_20 + var_358_12
					end

					if var_358_15.prefab_name ~= "" and arg_355_1.actors_[var_358_15.prefab_name] ~= nil then
						local var_358_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_355_1.actors_[var_358_15.prefab_name].transform, "story_v_out_117101", "117101088", "story_v_out_117101.awb")

						arg_355_1:RecordAudio("117101088", var_358_21)
						arg_355_1:RecordAudio("117101088", var_358_21)
					else
						arg_355_1:AudioAction("play", "voice", "story_v_out_117101", "117101088", "story_v_out_117101.awb")
					end

					arg_355_1:RecordHistoryTalkVoice("story_v_out_117101", "117101088", "story_v_out_117101.awb")
				end

				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_22 = math.max(var_358_13, arg_355_1.talkMaxDuration)

			if var_358_12 <= arg_355_1.time_ and arg_355_1.time_ < var_358_12 + var_358_22 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_12) / var_358_22

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_12 + var_358_22 and arg_355_1.time_ < var_358_12 + var_358_22 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play117101089 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 117101089
		arg_359_1.duration_ = 10.633

		local var_359_0 = {
			zh = 6.666,
			ja = 10.633
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
				arg_359_0:Play117101090(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = 0
			local var_362_1 = 0.675

			if var_362_0 < arg_359_1.time_ and arg_359_1.time_ <= var_362_0 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_2 = arg_359_1:FormatText(StoryNameCfg[61].name)

				arg_359_1.leftNameTxt_.text = var_362_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_3 = arg_359_1:GetWordFromCfg(117101089)
				local var_362_4 = arg_359_1:FormatText(var_362_3.content)

				arg_359_1.text_.text = var_362_4

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_5 = 27
				local var_362_6 = utf8.len(var_362_4)
				local var_362_7 = var_362_5 <= 0 and var_362_1 or var_362_1 * (var_362_6 / var_362_5)

				if var_362_7 > 0 and var_362_1 < var_362_7 then
					arg_359_1.talkMaxDuration = var_362_7

					if var_362_7 + var_362_0 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_7 + var_362_0
					end
				end

				arg_359_1.text_.text = var_362_4
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101089", "story_v_out_117101.awb") ~= 0 then
					local var_362_8 = manager.audio:GetVoiceLength("story_v_out_117101", "117101089", "story_v_out_117101.awb") / 1000

					if var_362_8 + var_362_0 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_8 + var_362_0
					end

					if var_362_3.prefab_name ~= "" and arg_359_1.actors_[var_362_3.prefab_name] ~= nil then
						local var_362_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_359_1.actors_[var_362_3.prefab_name].transform, "story_v_out_117101", "117101089", "story_v_out_117101.awb")

						arg_359_1:RecordAudio("117101089", var_362_9)
						arg_359_1:RecordAudio("117101089", var_362_9)
					else
						arg_359_1:AudioAction("play", "voice", "story_v_out_117101", "117101089", "story_v_out_117101.awb")
					end

					arg_359_1:RecordHistoryTalkVoice("story_v_out_117101", "117101089", "story_v_out_117101.awb")
				end

				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_10 = math.max(var_362_1, arg_359_1.talkMaxDuration)

			if var_362_0 <= arg_359_1.time_ and arg_359_1.time_ < var_362_0 + var_362_10 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_0) / var_362_10

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_0 + var_362_10 and arg_359_1.time_ < var_362_0 + var_362_10 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play117101090 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 117101090
		arg_363_1.duration_ = 5

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play117101091(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["1132"]
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 then
				local var_366_2 = var_366_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_366_2 then
					arg_363_1.var_.alphaOldValue1132 = var_366_2.alpha
					arg_363_1.var_.characterEffect1132 = var_366_2
				end

				arg_363_1.var_.alphaOldValue1132 = 1
			end

			local var_366_3 = 0.333333333333333

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_3 then
				local var_366_4 = (arg_363_1.time_ - var_366_1) / var_366_3
				local var_366_5 = Mathf.Lerp(arg_363_1.var_.alphaOldValue1132, 0, var_366_4)

				if arg_363_1.var_.characterEffect1132 then
					arg_363_1.var_.characterEffect1132.alpha = var_366_5
				end
			end

			if arg_363_1.time_ >= var_366_1 + var_366_3 and arg_363_1.time_ < var_366_1 + var_366_3 + arg_366_0 and arg_363_1.var_.characterEffect1132 then
				arg_363_1.var_.characterEffect1132.alpha = 0
			end

			local var_366_6 = arg_363_1.actors_["10036"]
			local var_366_7 = 0

			if var_366_7 < arg_363_1.time_ and arg_363_1.time_ <= var_366_7 + arg_366_0 then
				local var_366_8 = var_366_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_366_8 then
					arg_363_1.var_.alphaOldValue10036 = var_366_8.alpha
					arg_363_1.var_.characterEffect10036 = var_366_8
				end

				arg_363_1.var_.alphaOldValue10036 = 1
			end

			local var_366_9 = 0.333333333333333

			if var_366_7 <= arg_363_1.time_ and arg_363_1.time_ < var_366_7 + var_366_9 then
				local var_366_10 = (arg_363_1.time_ - var_366_7) / var_366_9
				local var_366_11 = Mathf.Lerp(arg_363_1.var_.alphaOldValue10036, 0, var_366_10)

				if arg_363_1.var_.characterEffect10036 then
					arg_363_1.var_.characterEffect10036.alpha = var_366_11
				end
			end

			if arg_363_1.time_ >= var_366_7 + var_366_9 and arg_363_1.time_ < var_366_7 + var_366_9 + arg_366_0 and arg_363_1.var_.characterEffect10036 then
				arg_363_1.var_.characterEffect10036.alpha = 0
			end

			local var_366_12 = 0
			local var_366_13 = 1.025

			if var_366_12 < arg_363_1.time_ and arg_363_1.time_ <= var_366_12 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, false)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_14 = arg_363_1:GetWordFromCfg(117101090)
				local var_366_15 = arg_363_1:FormatText(var_366_14.content)

				arg_363_1.text_.text = var_366_15

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_16 = 41
				local var_366_17 = utf8.len(var_366_15)
				local var_366_18 = var_366_16 <= 0 and var_366_13 or var_366_13 * (var_366_17 / var_366_16)

				if var_366_18 > 0 and var_366_13 < var_366_18 then
					arg_363_1.talkMaxDuration = var_366_18

					if var_366_18 + var_366_12 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_18 + var_366_12
					end
				end

				arg_363_1.text_.text = var_366_15
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)
				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_19 = math.max(var_366_13, arg_363_1.talkMaxDuration)

			if var_366_12 <= arg_363_1.time_ and arg_363_1.time_ < var_366_12 + var_366_19 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_12) / var_366_19

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_12 + var_366_19 and arg_363_1.time_ < var_366_12 + var_366_19 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play117101091 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 117101091
		arg_367_1.duration_ = 1.833

		local var_367_0 = {
			zh = 1.4,
			ja = 1.833
		}
		local var_367_1 = manager.audio:GetLocalizationFlag()

		if var_367_0[var_367_1] ~= nil then
			arg_367_1.duration_ = var_367_0[var_367_1]
		end

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play117101092(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["1132"].transform
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 then
				arg_367_1.var_.moveOldPos1132 = var_370_0.localPosition
				var_370_0.localScale = Vector3.New(1, 1, 1)

				arg_367_1:CheckSpriteTmpPos("1132", 4)

				local var_370_2 = var_370_0.childCount

				for iter_370_0 = 0, var_370_2 - 1 do
					local var_370_3 = var_370_0:GetChild(iter_370_0)

					if var_370_3.name == "split_6" or not string.find(var_370_3.name, "split") then
						var_370_3.gameObject:SetActive(true)
					else
						var_370_3.gameObject:SetActive(false)
					end
				end
			end

			local var_370_4 = 0.001

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_4 then
				local var_370_5 = (arg_367_1.time_ - var_370_1) / var_370_4
				local var_370_6 = Vector3.New(390, -413, -185)

				var_370_0.localPosition = Vector3.Lerp(arg_367_1.var_.moveOldPos1132, var_370_6, var_370_5)
			end

			if arg_367_1.time_ >= var_370_1 + var_370_4 and arg_367_1.time_ < var_370_1 + var_370_4 + arg_370_0 then
				var_370_0.localPosition = Vector3.New(390, -413, -185)
			end

			local var_370_7 = arg_367_1.actors_["10036"].transform
			local var_370_8 = 0

			if var_370_8 < arg_367_1.time_ and arg_367_1.time_ <= var_370_8 + arg_370_0 then
				arg_367_1.var_.moveOldPos10036 = var_370_7.localPosition
				var_370_7.localScale = Vector3.New(1, 1, 1)

				arg_367_1:CheckSpriteTmpPos("10036", 2)

				local var_370_9 = var_370_7.childCount

				for iter_370_1 = 0, var_370_9 - 1 do
					local var_370_10 = var_370_7:GetChild(iter_370_1)

					if var_370_10.name == "split_1" or not string.find(var_370_10.name, "split") then
						var_370_10.gameObject:SetActive(true)
					else
						var_370_10.gameObject:SetActive(false)
					end
				end
			end

			local var_370_11 = 0.001

			if var_370_8 <= arg_367_1.time_ and arg_367_1.time_ < var_370_8 + var_370_11 then
				local var_370_12 = (arg_367_1.time_ - var_370_8) / var_370_11
				local var_370_13 = Vector3.New(-390, -445, -290)

				var_370_7.localPosition = Vector3.Lerp(arg_367_1.var_.moveOldPos10036, var_370_13, var_370_12)
			end

			if arg_367_1.time_ >= var_370_8 + var_370_11 and arg_367_1.time_ < var_370_8 + var_370_11 + arg_370_0 then
				var_370_7.localPosition = Vector3.New(-390, -445, -290)
			end

			local var_370_14 = arg_367_1.actors_["10036"]
			local var_370_15 = 0

			if var_370_15 < arg_367_1.time_ and arg_367_1.time_ <= var_370_15 + arg_370_0 and arg_367_1.var_.actorSpriteComps10036 == nil then
				arg_367_1.var_.actorSpriteComps10036 = var_370_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_370_16 = 0.2

			if var_370_15 <= arg_367_1.time_ and arg_367_1.time_ < var_370_15 + var_370_16 then
				local var_370_17 = (arg_367_1.time_ - var_370_15) / var_370_16

				if arg_367_1.var_.actorSpriteComps10036 then
					for iter_370_2, iter_370_3 in pairs(arg_367_1.var_.actorSpriteComps10036:ToTable()) do
						if iter_370_3 then
							local var_370_18 = Mathf.Lerp(iter_370_3.color.r, 1, var_370_17)

							iter_370_3.color = Color.New(var_370_18, var_370_18, var_370_18)
						end
					end
				end
			end

			if arg_367_1.time_ >= var_370_15 + var_370_16 and arg_367_1.time_ < var_370_15 + var_370_16 + arg_370_0 and arg_367_1.var_.actorSpriteComps10036 then
				local var_370_19 = 1

				for iter_370_4, iter_370_5 in pairs(arg_367_1.var_.actorSpriteComps10036:ToTable()) do
					if iter_370_5 then
						iter_370_5.color = Color.New(var_370_19, var_370_19, var_370_19)
					end
				end

				arg_367_1.var_.actorSpriteComps10036 = nil
			end

			local var_370_20 = arg_367_1.actors_["1132"]
			local var_370_21 = 0

			if var_370_21 < arg_367_1.time_ and arg_367_1.time_ <= var_370_21 + arg_370_0 then
				local var_370_22 = var_370_20:GetComponentInChildren(typeof(CanvasGroup))

				if var_370_22 then
					arg_367_1.var_.alphaOldValue1132 = var_370_22.alpha
					arg_367_1.var_.characterEffect1132 = var_370_22
				end

				arg_367_1.var_.alphaOldValue1132 = 0
			end

			local var_370_23 = 0.333333333333333

			if var_370_21 <= arg_367_1.time_ and arg_367_1.time_ < var_370_21 + var_370_23 then
				local var_370_24 = (arg_367_1.time_ - var_370_21) / var_370_23
				local var_370_25 = Mathf.Lerp(arg_367_1.var_.alphaOldValue1132, 1, var_370_24)

				if arg_367_1.var_.characterEffect1132 then
					arg_367_1.var_.characterEffect1132.alpha = var_370_25
				end
			end

			if arg_367_1.time_ >= var_370_21 + var_370_23 and arg_367_1.time_ < var_370_21 + var_370_23 + arg_370_0 and arg_367_1.var_.characterEffect1132 then
				arg_367_1.var_.characterEffect1132.alpha = 1
			end

			local var_370_26 = arg_367_1.actors_["10036"]
			local var_370_27 = 0

			if var_370_27 < arg_367_1.time_ and arg_367_1.time_ <= var_370_27 + arg_370_0 then
				local var_370_28 = var_370_26:GetComponentInChildren(typeof(CanvasGroup))

				if var_370_28 then
					arg_367_1.var_.alphaOldValue10036 = var_370_28.alpha
					arg_367_1.var_.characterEffect10036 = var_370_28
				end

				arg_367_1.var_.alphaOldValue10036 = 0
			end

			local var_370_29 = 0.333333333333333

			if var_370_27 <= arg_367_1.time_ and arg_367_1.time_ < var_370_27 + var_370_29 then
				local var_370_30 = (arg_367_1.time_ - var_370_27) / var_370_29
				local var_370_31 = Mathf.Lerp(arg_367_1.var_.alphaOldValue10036, 1, var_370_30)

				if arg_367_1.var_.characterEffect10036 then
					arg_367_1.var_.characterEffect10036.alpha = var_370_31
				end
			end

			if arg_367_1.time_ >= var_370_27 + var_370_29 and arg_367_1.time_ < var_370_27 + var_370_29 + arg_370_0 and arg_367_1.var_.characterEffect10036 then
				arg_367_1.var_.characterEffect10036.alpha = 1
			end

			local var_370_32 = arg_367_1.actors_["1132"]
			local var_370_33 = 0

			if var_370_33 < arg_367_1.time_ and arg_367_1.time_ <= var_370_33 + arg_370_0 and arg_367_1.var_.actorSpriteComps1132 == nil then
				arg_367_1.var_.actorSpriteComps1132 = var_370_32:GetComponentsInChildren(typeof(Image), true)
			end

			local var_370_34 = 0.2

			if var_370_33 <= arg_367_1.time_ and arg_367_1.time_ < var_370_33 + var_370_34 then
				local var_370_35 = (arg_367_1.time_ - var_370_33) / var_370_34

				if arg_367_1.var_.actorSpriteComps1132 then
					for iter_370_6, iter_370_7 in pairs(arg_367_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_370_7 then
							local var_370_36 = Mathf.Lerp(iter_370_7.color.r, 0.5, var_370_35)

							iter_370_7.color = Color.New(var_370_36, var_370_36, var_370_36)
						end
					end
				end
			end

			if arg_367_1.time_ >= var_370_33 + var_370_34 and arg_367_1.time_ < var_370_33 + var_370_34 + arg_370_0 and arg_367_1.var_.actorSpriteComps1132 then
				local var_370_37 = 0.5

				for iter_370_8, iter_370_9 in pairs(arg_367_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_370_9 then
						iter_370_9.color = Color.New(var_370_37, var_370_37, var_370_37)
					end
				end

				arg_367_1.var_.actorSpriteComps1132 = nil
			end

			local var_370_38 = 0
			local var_370_39 = 0.1

			if var_370_38 < arg_367_1.time_ and arg_367_1.time_ <= var_370_38 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_40 = arg_367_1:FormatText(StoryNameCfg[370].name)

				arg_367_1.leftNameTxt_.text = var_370_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_41 = arg_367_1:GetWordFromCfg(117101091)
				local var_370_42 = arg_367_1:FormatText(var_370_41.content)

				arg_367_1.text_.text = var_370_42

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_43 = 4
				local var_370_44 = utf8.len(var_370_42)
				local var_370_45 = var_370_43 <= 0 and var_370_39 or var_370_39 * (var_370_44 / var_370_43)

				if var_370_45 > 0 and var_370_39 < var_370_45 then
					arg_367_1.talkMaxDuration = var_370_45

					if var_370_45 + var_370_38 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_45 + var_370_38
					end
				end

				arg_367_1.text_.text = var_370_42
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101091", "story_v_out_117101.awb") ~= 0 then
					local var_370_46 = manager.audio:GetVoiceLength("story_v_out_117101", "117101091", "story_v_out_117101.awb") / 1000

					if var_370_46 + var_370_38 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_46 + var_370_38
					end

					if var_370_41.prefab_name ~= "" and arg_367_1.actors_[var_370_41.prefab_name] ~= nil then
						local var_370_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_367_1.actors_[var_370_41.prefab_name].transform, "story_v_out_117101", "117101091", "story_v_out_117101.awb")

						arg_367_1:RecordAudio("117101091", var_370_47)
						arg_367_1:RecordAudio("117101091", var_370_47)
					else
						arg_367_1:AudioAction("play", "voice", "story_v_out_117101", "117101091", "story_v_out_117101.awb")
					end

					arg_367_1:RecordHistoryTalkVoice("story_v_out_117101", "117101091", "story_v_out_117101.awb")
				end

				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_48 = math.max(var_370_39, arg_367_1.talkMaxDuration)

			if var_370_38 <= arg_367_1.time_ and arg_367_1.time_ < var_370_38 + var_370_48 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_38) / var_370_48

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_38 + var_370_48 and arg_367_1.time_ < var_370_38 + var_370_48 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play117101092 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 117101092
		arg_371_1.duration_ = 10.5

		local var_371_0 = {
			zh = 10.5,
			ja = 4.233
		}
		local var_371_1 = manager.audio:GetLocalizationFlag()

		if var_371_0[var_371_1] ~= nil then
			arg_371_1.duration_ = var_371_0[var_371_1]
		end

		SetActive(arg_371_1.tipsGo_, false)

		function arg_371_1.onSingleLineFinish_()
			arg_371_1.onSingleLineUpdate_ = nil
			arg_371_1.onSingleLineFinish_ = nil
			arg_371_1.state_ = "waiting"
		end

		function arg_371_1.playNext_(arg_373_0)
			if arg_373_0 == 1 then
				arg_371_0:Play117101093(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = arg_371_1.actors_["10036"]
			local var_374_1 = 0

			if var_374_1 < arg_371_1.time_ and arg_371_1.time_ <= var_374_1 + arg_374_0 and arg_371_1.var_.actorSpriteComps10036 == nil then
				arg_371_1.var_.actorSpriteComps10036 = var_374_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_374_2 = 0.2

			if var_374_1 <= arg_371_1.time_ and arg_371_1.time_ < var_374_1 + var_374_2 then
				local var_374_3 = (arg_371_1.time_ - var_374_1) / var_374_2

				if arg_371_1.var_.actorSpriteComps10036 then
					for iter_374_0, iter_374_1 in pairs(arg_371_1.var_.actorSpriteComps10036:ToTable()) do
						if iter_374_1 then
							local var_374_4 = Mathf.Lerp(iter_374_1.color.r, 0.5, var_374_3)

							iter_374_1.color = Color.New(var_374_4, var_374_4, var_374_4)
						end
					end
				end
			end

			if arg_371_1.time_ >= var_374_1 + var_374_2 and arg_371_1.time_ < var_374_1 + var_374_2 + arg_374_0 and arg_371_1.var_.actorSpriteComps10036 then
				local var_374_5 = 0.5

				for iter_374_2, iter_374_3 in pairs(arg_371_1.var_.actorSpriteComps10036:ToTable()) do
					if iter_374_3 then
						iter_374_3.color = Color.New(var_374_5, var_374_5, var_374_5)
					end
				end

				arg_371_1.var_.actorSpriteComps10036 = nil
			end

			local var_374_6 = arg_371_1.actors_["1132"]
			local var_374_7 = 0

			if var_374_7 < arg_371_1.time_ and arg_371_1.time_ <= var_374_7 + arg_374_0 and arg_371_1.var_.actorSpriteComps1132 == nil then
				arg_371_1.var_.actorSpriteComps1132 = var_374_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_374_8 = 0.2

			if var_374_7 <= arg_371_1.time_ and arg_371_1.time_ < var_374_7 + var_374_8 then
				local var_374_9 = (arg_371_1.time_ - var_374_7) / var_374_8

				if arg_371_1.var_.actorSpriteComps1132 then
					for iter_374_4, iter_374_5 in pairs(arg_371_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_374_5 then
							local var_374_10 = Mathf.Lerp(iter_374_5.color.r, 1, var_374_9)

							iter_374_5.color = Color.New(var_374_10, var_374_10, var_374_10)
						end
					end
				end
			end

			if arg_371_1.time_ >= var_374_7 + var_374_8 and arg_371_1.time_ < var_374_7 + var_374_8 + arg_374_0 and arg_371_1.var_.actorSpriteComps1132 then
				local var_374_11 = 1

				for iter_374_6, iter_374_7 in pairs(arg_371_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_374_7 then
						iter_374_7.color = Color.New(var_374_11, var_374_11, var_374_11)
					end
				end

				arg_371_1.var_.actorSpriteComps1132 = nil
			end

			local var_374_12 = 0
			local var_374_13 = 1.1

			if var_374_12 < arg_371_1.time_ and arg_371_1.time_ <= var_374_12 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, true)

				local var_374_14 = arg_371_1:FormatText(StoryNameCfg[61].name)

				arg_371_1.leftNameTxt_.text = var_374_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_371_1.leftNameTxt_.transform)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1.leftNameTxt_.text)
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_15 = arg_371_1:GetWordFromCfg(117101092)
				local var_374_16 = arg_371_1:FormatText(var_374_15.content)

				arg_371_1.text_.text = var_374_16

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_17 = 44
				local var_374_18 = utf8.len(var_374_16)
				local var_374_19 = var_374_17 <= 0 and var_374_13 or var_374_13 * (var_374_18 / var_374_17)

				if var_374_19 > 0 and var_374_13 < var_374_19 then
					arg_371_1.talkMaxDuration = var_374_19

					if var_374_19 + var_374_12 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_19 + var_374_12
					end
				end

				arg_371_1.text_.text = var_374_16
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101092", "story_v_out_117101.awb") ~= 0 then
					local var_374_20 = manager.audio:GetVoiceLength("story_v_out_117101", "117101092", "story_v_out_117101.awb") / 1000

					if var_374_20 + var_374_12 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_20 + var_374_12
					end

					if var_374_15.prefab_name ~= "" and arg_371_1.actors_[var_374_15.prefab_name] ~= nil then
						local var_374_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_371_1.actors_[var_374_15.prefab_name].transform, "story_v_out_117101", "117101092", "story_v_out_117101.awb")

						arg_371_1:RecordAudio("117101092", var_374_21)
						arg_371_1:RecordAudio("117101092", var_374_21)
					else
						arg_371_1:AudioAction("play", "voice", "story_v_out_117101", "117101092", "story_v_out_117101.awb")
					end

					arg_371_1:RecordHistoryTalkVoice("story_v_out_117101", "117101092", "story_v_out_117101.awb")
				end

				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_22 = math.max(var_374_13, arg_371_1.talkMaxDuration)

			if var_374_12 <= arg_371_1.time_ and arg_371_1.time_ < var_374_12 + var_374_22 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_12) / var_374_22

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_12 + var_374_22 and arg_371_1.time_ < var_374_12 + var_374_22 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play117101093 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 117101093
		arg_375_1.duration_ = 2.266

		local var_375_0 = {
			zh = 1.4,
			ja = 2.266
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
				arg_375_0:Play117101094(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = 0
			local var_378_1 = 0.15

			if var_378_0 < arg_375_1.time_ and arg_375_1.time_ <= var_378_0 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_2 = arg_375_1:FormatText(StoryNameCfg[61].name)

				arg_375_1.leftNameTxt_.text = var_378_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_3 = arg_375_1:GetWordFromCfg(117101093)
				local var_378_4 = arg_375_1:FormatText(var_378_3.content)

				arg_375_1.text_.text = var_378_4

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_5 = 6
				local var_378_6 = utf8.len(var_378_4)
				local var_378_7 = var_378_5 <= 0 and var_378_1 or var_378_1 * (var_378_6 / var_378_5)

				if var_378_7 > 0 and var_378_1 < var_378_7 then
					arg_375_1.talkMaxDuration = var_378_7

					if var_378_7 + var_378_0 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_7 + var_378_0
					end
				end

				arg_375_1.text_.text = var_378_4
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101093", "story_v_out_117101.awb") ~= 0 then
					local var_378_8 = manager.audio:GetVoiceLength("story_v_out_117101", "117101093", "story_v_out_117101.awb") / 1000

					if var_378_8 + var_378_0 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_8 + var_378_0
					end

					if var_378_3.prefab_name ~= "" and arg_375_1.actors_[var_378_3.prefab_name] ~= nil then
						local var_378_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_3.prefab_name].transform, "story_v_out_117101", "117101093", "story_v_out_117101.awb")

						arg_375_1:RecordAudio("117101093", var_378_9)
						arg_375_1:RecordAudio("117101093", var_378_9)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_out_117101", "117101093", "story_v_out_117101.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_out_117101", "117101093", "story_v_out_117101.awb")
				end

				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_10 = math.max(var_378_1, arg_375_1.talkMaxDuration)

			if var_378_0 <= arg_375_1.time_ and arg_375_1.time_ < var_378_0 + var_378_10 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_0) / var_378_10

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_0 + var_378_10 and arg_375_1.time_ < var_378_0 + var_378_10 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play117101094 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 117101094
		arg_379_1.duration_ = 8.766

		local var_379_0 = {
			zh = 4.466,
			ja = 8.766
		}
		local var_379_1 = manager.audio:GetLocalizationFlag()

		if var_379_0[var_379_1] ~= nil then
			arg_379_1.duration_ = var_379_0[var_379_1]
		end

		SetActive(arg_379_1.tipsGo_, false)

		function arg_379_1.onSingleLineFinish_()
			arg_379_1.onSingleLineUpdate_ = nil
			arg_379_1.onSingleLineFinish_ = nil
			arg_379_1.state_ = "waiting"
		end

		function arg_379_1.playNext_(arg_381_0)
			if arg_381_0 == 1 then
				arg_379_0:Play117101095(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = arg_379_1.actors_["10036"]
			local var_382_1 = 0

			if var_382_1 < arg_379_1.time_ and arg_379_1.time_ <= var_382_1 + arg_382_0 and arg_379_1.var_.actorSpriteComps10036 == nil then
				arg_379_1.var_.actorSpriteComps10036 = var_382_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_382_2 = 0.2

			if var_382_1 <= arg_379_1.time_ and arg_379_1.time_ < var_382_1 + var_382_2 then
				local var_382_3 = (arg_379_1.time_ - var_382_1) / var_382_2

				if arg_379_1.var_.actorSpriteComps10036 then
					for iter_382_0, iter_382_1 in pairs(arg_379_1.var_.actorSpriteComps10036:ToTable()) do
						if iter_382_1 then
							local var_382_4 = Mathf.Lerp(iter_382_1.color.r, 1, var_382_3)

							iter_382_1.color = Color.New(var_382_4, var_382_4, var_382_4)
						end
					end
				end
			end

			if arg_379_1.time_ >= var_382_1 + var_382_2 and arg_379_1.time_ < var_382_1 + var_382_2 + arg_382_0 and arg_379_1.var_.actorSpriteComps10036 then
				local var_382_5 = 1

				for iter_382_2, iter_382_3 in pairs(arg_379_1.var_.actorSpriteComps10036:ToTable()) do
					if iter_382_3 then
						iter_382_3.color = Color.New(var_382_5, var_382_5, var_382_5)
					end
				end

				arg_379_1.var_.actorSpriteComps10036 = nil
			end

			local var_382_6 = arg_379_1.actors_["1132"]
			local var_382_7 = 0

			if var_382_7 < arg_379_1.time_ and arg_379_1.time_ <= var_382_7 + arg_382_0 and arg_379_1.var_.actorSpriteComps1132 == nil then
				arg_379_1.var_.actorSpriteComps1132 = var_382_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_382_8 = 0.2

			if var_382_7 <= arg_379_1.time_ and arg_379_1.time_ < var_382_7 + var_382_8 then
				local var_382_9 = (arg_379_1.time_ - var_382_7) / var_382_8

				if arg_379_1.var_.actorSpriteComps1132 then
					for iter_382_4, iter_382_5 in pairs(arg_379_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_382_5 then
							local var_382_10 = Mathf.Lerp(iter_382_5.color.r, 0.5, var_382_9)

							iter_382_5.color = Color.New(var_382_10, var_382_10, var_382_10)
						end
					end
				end
			end

			if arg_379_1.time_ >= var_382_7 + var_382_8 and arg_379_1.time_ < var_382_7 + var_382_8 + arg_382_0 and arg_379_1.var_.actorSpriteComps1132 then
				local var_382_11 = 0.5

				for iter_382_6, iter_382_7 in pairs(arg_379_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_382_7 then
						iter_382_7.color = Color.New(var_382_11, var_382_11, var_382_11)
					end
				end

				arg_379_1.var_.actorSpriteComps1132 = nil
			end

			local var_382_12 = 0
			local var_382_13 = 0.45

			if var_382_12 < arg_379_1.time_ and arg_379_1.time_ <= var_382_12 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, true)

				local var_382_14 = arg_379_1:FormatText(StoryNameCfg[370].name)

				arg_379_1.leftNameTxt_.text = var_382_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_379_1.leftNameTxt_.transform)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1.leftNameTxt_.text)
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_15 = arg_379_1:GetWordFromCfg(117101094)
				local var_382_16 = arg_379_1:FormatText(var_382_15.content)

				arg_379_1.text_.text = var_382_16

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_17 = 18
				local var_382_18 = utf8.len(var_382_16)
				local var_382_19 = var_382_17 <= 0 and var_382_13 or var_382_13 * (var_382_18 / var_382_17)

				if var_382_19 > 0 and var_382_13 < var_382_19 then
					arg_379_1.talkMaxDuration = var_382_19

					if var_382_19 + var_382_12 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_19 + var_382_12
					end
				end

				arg_379_1.text_.text = var_382_16
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101094", "story_v_out_117101.awb") ~= 0 then
					local var_382_20 = manager.audio:GetVoiceLength("story_v_out_117101", "117101094", "story_v_out_117101.awb") / 1000

					if var_382_20 + var_382_12 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_20 + var_382_12
					end

					if var_382_15.prefab_name ~= "" and arg_379_1.actors_[var_382_15.prefab_name] ~= nil then
						local var_382_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_379_1.actors_[var_382_15.prefab_name].transform, "story_v_out_117101", "117101094", "story_v_out_117101.awb")

						arg_379_1:RecordAudio("117101094", var_382_21)
						arg_379_1:RecordAudio("117101094", var_382_21)
					else
						arg_379_1:AudioAction("play", "voice", "story_v_out_117101", "117101094", "story_v_out_117101.awb")
					end

					arg_379_1:RecordHistoryTalkVoice("story_v_out_117101", "117101094", "story_v_out_117101.awb")
				end

				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_22 = math.max(var_382_13, arg_379_1.talkMaxDuration)

			if var_382_12 <= arg_379_1.time_ and arg_379_1.time_ < var_382_12 + var_382_22 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_12) / var_382_22

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_12 + var_382_22 and arg_379_1.time_ < var_382_12 + var_382_22 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play117101095 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 117101095
		arg_383_1.duration_ = 7.433

		local var_383_0 = {
			zh = 7.433,
			ja = 2.1
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
				arg_383_0:Play117101096(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = arg_383_1.actors_["10036"]
			local var_386_1 = 0

			if var_386_1 < arg_383_1.time_ and arg_383_1.time_ <= var_386_1 + arg_386_0 and arg_383_1.var_.actorSpriteComps10036 == nil then
				arg_383_1.var_.actorSpriteComps10036 = var_386_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_386_2 = 0.2

			if var_386_1 <= arg_383_1.time_ and arg_383_1.time_ < var_386_1 + var_386_2 then
				local var_386_3 = (arg_383_1.time_ - var_386_1) / var_386_2

				if arg_383_1.var_.actorSpriteComps10036 then
					for iter_386_0, iter_386_1 in pairs(arg_383_1.var_.actorSpriteComps10036:ToTable()) do
						if iter_386_1 then
							local var_386_4 = Mathf.Lerp(iter_386_1.color.r, 0.5, var_386_3)

							iter_386_1.color = Color.New(var_386_4, var_386_4, var_386_4)
						end
					end
				end
			end

			if arg_383_1.time_ >= var_386_1 + var_386_2 and arg_383_1.time_ < var_386_1 + var_386_2 + arg_386_0 and arg_383_1.var_.actorSpriteComps10036 then
				local var_386_5 = 0.5

				for iter_386_2, iter_386_3 in pairs(arg_383_1.var_.actorSpriteComps10036:ToTable()) do
					if iter_386_3 then
						iter_386_3.color = Color.New(var_386_5, var_386_5, var_386_5)
					end
				end

				arg_383_1.var_.actorSpriteComps10036 = nil
			end

			local var_386_6 = arg_383_1.actors_["1132"]
			local var_386_7 = 0

			if var_386_7 < arg_383_1.time_ and arg_383_1.time_ <= var_386_7 + arg_386_0 and arg_383_1.var_.actorSpriteComps1132 == nil then
				arg_383_1.var_.actorSpriteComps1132 = var_386_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_386_8 = 0.2

			if var_386_7 <= arg_383_1.time_ and arg_383_1.time_ < var_386_7 + var_386_8 then
				local var_386_9 = (arg_383_1.time_ - var_386_7) / var_386_8

				if arg_383_1.var_.actorSpriteComps1132 then
					for iter_386_4, iter_386_5 in pairs(arg_383_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_386_5 then
							local var_386_10 = Mathf.Lerp(iter_386_5.color.r, 1, var_386_9)

							iter_386_5.color = Color.New(var_386_10, var_386_10, var_386_10)
						end
					end
				end
			end

			if arg_383_1.time_ >= var_386_7 + var_386_8 and arg_383_1.time_ < var_386_7 + var_386_8 + arg_386_0 and arg_383_1.var_.actorSpriteComps1132 then
				local var_386_11 = 1

				for iter_386_6, iter_386_7 in pairs(arg_383_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_386_7 then
						iter_386_7.color = Color.New(var_386_11, var_386_11, var_386_11)
					end
				end

				arg_383_1.var_.actorSpriteComps1132 = nil
			end

			local var_386_12 = 0
			local var_386_13 = 0.85

			if var_386_12 < arg_383_1.time_ and arg_383_1.time_ <= var_386_12 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, true)

				local var_386_14 = arg_383_1:FormatText(StoryNameCfg[61].name)

				arg_383_1.leftNameTxt_.text = var_386_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_383_1.leftNameTxt_.transform)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1.leftNameTxt_.text)
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_15 = arg_383_1:GetWordFromCfg(117101095)
				local var_386_16 = arg_383_1:FormatText(var_386_15.content)

				arg_383_1.text_.text = var_386_16

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_17 = 34
				local var_386_18 = utf8.len(var_386_16)
				local var_386_19 = var_386_17 <= 0 and var_386_13 or var_386_13 * (var_386_18 / var_386_17)

				if var_386_19 > 0 and var_386_13 < var_386_19 then
					arg_383_1.talkMaxDuration = var_386_19

					if var_386_19 + var_386_12 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_19 + var_386_12
					end
				end

				arg_383_1.text_.text = var_386_16
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101095", "story_v_out_117101.awb") ~= 0 then
					local var_386_20 = manager.audio:GetVoiceLength("story_v_out_117101", "117101095", "story_v_out_117101.awb") / 1000

					if var_386_20 + var_386_12 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_20 + var_386_12
					end

					if var_386_15.prefab_name ~= "" and arg_383_1.actors_[var_386_15.prefab_name] ~= nil then
						local var_386_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_383_1.actors_[var_386_15.prefab_name].transform, "story_v_out_117101", "117101095", "story_v_out_117101.awb")

						arg_383_1:RecordAudio("117101095", var_386_21)
						arg_383_1:RecordAudio("117101095", var_386_21)
					else
						arg_383_1:AudioAction("play", "voice", "story_v_out_117101", "117101095", "story_v_out_117101.awb")
					end

					arg_383_1:RecordHistoryTalkVoice("story_v_out_117101", "117101095", "story_v_out_117101.awb")
				end

				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_22 = math.max(var_386_13, arg_383_1.talkMaxDuration)

			if var_386_12 <= arg_383_1.time_ and arg_383_1.time_ < var_386_12 + var_386_22 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_12) / var_386_22

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_12 + var_386_22 and arg_383_1.time_ < var_386_12 + var_386_22 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play117101096 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 117101096
		arg_387_1.duration_ = 7.733

		local var_387_0 = {
			zh = 6.1,
			ja = 7.733
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
				arg_387_0:Play117101097(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = 0
			local var_390_1 = 0.75

			if var_390_0 < arg_387_1.time_ and arg_387_1.time_ <= var_390_0 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_2 = arg_387_1:FormatText(StoryNameCfg[61].name)

				arg_387_1.leftNameTxt_.text = var_390_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_3 = arg_387_1:GetWordFromCfg(117101096)
				local var_390_4 = arg_387_1:FormatText(var_390_3.content)

				arg_387_1.text_.text = var_390_4

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_5 = 30
				local var_390_6 = utf8.len(var_390_4)
				local var_390_7 = var_390_5 <= 0 and var_390_1 or var_390_1 * (var_390_6 / var_390_5)

				if var_390_7 > 0 and var_390_1 < var_390_7 then
					arg_387_1.talkMaxDuration = var_390_7

					if var_390_7 + var_390_0 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_7 + var_390_0
					end
				end

				arg_387_1.text_.text = var_390_4
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101096", "story_v_out_117101.awb") ~= 0 then
					local var_390_8 = manager.audio:GetVoiceLength("story_v_out_117101", "117101096", "story_v_out_117101.awb") / 1000

					if var_390_8 + var_390_0 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_8 + var_390_0
					end

					if var_390_3.prefab_name ~= "" and arg_387_1.actors_[var_390_3.prefab_name] ~= nil then
						local var_390_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_387_1.actors_[var_390_3.prefab_name].transform, "story_v_out_117101", "117101096", "story_v_out_117101.awb")

						arg_387_1:RecordAudio("117101096", var_390_9)
						arg_387_1:RecordAudio("117101096", var_390_9)
					else
						arg_387_1:AudioAction("play", "voice", "story_v_out_117101", "117101096", "story_v_out_117101.awb")
					end

					arg_387_1:RecordHistoryTalkVoice("story_v_out_117101", "117101096", "story_v_out_117101.awb")
				end

				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_10 = math.max(var_390_1, arg_387_1.talkMaxDuration)

			if var_390_0 <= arg_387_1.time_ and arg_387_1.time_ < var_390_0 + var_390_10 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_0) / var_390_10

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_0 + var_390_10 and arg_387_1.time_ < var_390_0 + var_390_10 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play117101097 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 117101097
		arg_391_1.duration_ = 4.366

		local var_391_0 = {
			zh = 4.366,
			ja = 4.133
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
				arg_391_0:Play117101098(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = 0
			local var_394_1 = 0.375

			if var_394_0 < arg_391_1.time_ and arg_391_1.time_ <= var_394_0 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, true)

				local var_394_2 = arg_391_1:FormatText(StoryNameCfg[61].name)

				arg_391_1.leftNameTxt_.text = var_394_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_391_1.leftNameTxt_.transform)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1.leftNameTxt_.text)
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_3 = arg_391_1:GetWordFromCfg(117101097)
				local var_394_4 = arg_391_1:FormatText(var_394_3.content)

				arg_391_1.text_.text = var_394_4

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_5 = 15
				local var_394_6 = utf8.len(var_394_4)
				local var_394_7 = var_394_5 <= 0 and var_394_1 or var_394_1 * (var_394_6 / var_394_5)

				if var_394_7 > 0 and var_394_1 < var_394_7 then
					arg_391_1.talkMaxDuration = var_394_7

					if var_394_7 + var_394_0 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_7 + var_394_0
					end
				end

				arg_391_1.text_.text = var_394_4
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101097", "story_v_out_117101.awb") ~= 0 then
					local var_394_8 = manager.audio:GetVoiceLength("story_v_out_117101", "117101097", "story_v_out_117101.awb") / 1000

					if var_394_8 + var_394_0 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_8 + var_394_0
					end

					if var_394_3.prefab_name ~= "" and arg_391_1.actors_[var_394_3.prefab_name] ~= nil then
						local var_394_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_391_1.actors_[var_394_3.prefab_name].transform, "story_v_out_117101", "117101097", "story_v_out_117101.awb")

						arg_391_1:RecordAudio("117101097", var_394_9)
						arg_391_1:RecordAudio("117101097", var_394_9)
					else
						arg_391_1:AudioAction("play", "voice", "story_v_out_117101", "117101097", "story_v_out_117101.awb")
					end

					arg_391_1:RecordHistoryTalkVoice("story_v_out_117101", "117101097", "story_v_out_117101.awb")
				end

				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_10 = math.max(var_394_1, arg_391_1.talkMaxDuration)

			if var_394_0 <= arg_391_1.time_ and arg_391_1.time_ < var_394_0 + var_394_10 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_0) / var_394_10

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_0 + var_394_10 and arg_391_1.time_ < var_394_0 + var_394_10 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play117101098 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 117101098
		arg_395_1.duration_ = 3.433

		local var_395_0 = {
			zh = 2.966,
			ja = 3.433
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
				arg_395_0:Play117101099(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = arg_395_1.actors_["10036"].transform
			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 then
				arg_395_1.var_.moveOldPos10036 = var_398_0.localPosition
				var_398_0.localScale = Vector3.New(1, 1, 1)

				arg_395_1:CheckSpriteTmpPos("10036", 2)

				local var_398_2 = var_398_0.childCount

				for iter_398_0 = 0, var_398_2 - 1 do
					local var_398_3 = var_398_0:GetChild(iter_398_0)

					if var_398_3.name == "split_5" or not string.find(var_398_3.name, "split") then
						var_398_3.gameObject:SetActive(true)
					else
						var_398_3.gameObject:SetActive(false)
					end
				end
			end

			local var_398_4 = 0.001

			if var_398_1 <= arg_395_1.time_ and arg_395_1.time_ < var_398_1 + var_398_4 then
				local var_398_5 = (arg_395_1.time_ - var_398_1) / var_398_4
				local var_398_6 = Vector3.New(-390, -445, -290)

				var_398_0.localPosition = Vector3.Lerp(arg_395_1.var_.moveOldPos10036, var_398_6, var_398_5)
			end

			if arg_395_1.time_ >= var_398_1 + var_398_4 and arg_395_1.time_ < var_398_1 + var_398_4 + arg_398_0 then
				var_398_0.localPosition = Vector3.New(-390, -445, -290)
			end

			local var_398_7 = arg_395_1.actors_["10036"]
			local var_398_8 = 0

			if var_398_8 < arg_395_1.time_ and arg_395_1.time_ <= var_398_8 + arg_398_0 and arg_395_1.var_.actorSpriteComps10036 == nil then
				arg_395_1.var_.actorSpriteComps10036 = var_398_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_398_9 = 0.2

			if var_398_8 <= arg_395_1.time_ and arg_395_1.time_ < var_398_8 + var_398_9 then
				local var_398_10 = (arg_395_1.time_ - var_398_8) / var_398_9

				if arg_395_1.var_.actorSpriteComps10036 then
					for iter_398_1, iter_398_2 in pairs(arg_395_1.var_.actorSpriteComps10036:ToTable()) do
						if iter_398_2 then
							local var_398_11 = Mathf.Lerp(iter_398_2.color.r, 1, var_398_10)

							iter_398_2.color = Color.New(var_398_11, var_398_11, var_398_11)
						end
					end
				end
			end

			if arg_395_1.time_ >= var_398_8 + var_398_9 and arg_395_1.time_ < var_398_8 + var_398_9 + arg_398_0 and arg_395_1.var_.actorSpriteComps10036 then
				local var_398_12 = 1

				for iter_398_3, iter_398_4 in pairs(arg_395_1.var_.actorSpriteComps10036:ToTable()) do
					if iter_398_4 then
						iter_398_4.color = Color.New(var_398_12, var_398_12, var_398_12)
					end
				end

				arg_395_1.var_.actorSpriteComps10036 = nil
			end

			local var_398_13 = arg_395_1.actors_["1132"]
			local var_398_14 = 0

			if var_398_14 < arg_395_1.time_ and arg_395_1.time_ <= var_398_14 + arg_398_0 and arg_395_1.var_.actorSpriteComps1132 == nil then
				arg_395_1.var_.actorSpriteComps1132 = var_398_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_398_15 = 0.2

			if var_398_14 <= arg_395_1.time_ and arg_395_1.time_ < var_398_14 + var_398_15 then
				local var_398_16 = (arg_395_1.time_ - var_398_14) / var_398_15

				if arg_395_1.var_.actorSpriteComps1132 then
					for iter_398_5, iter_398_6 in pairs(arg_395_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_398_6 then
							local var_398_17 = Mathf.Lerp(iter_398_6.color.r, 0.5, var_398_16)

							iter_398_6.color = Color.New(var_398_17, var_398_17, var_398_17)
						end
					end
				end
			end

			if arg_395_1.time_ >= var_398_14 + var_398_15 and arg_395_1.time_ < var_398_14 + var_398_15 + arg_398_0 and arg_395_1.var_.actorSpriteComps1132 then
				local var_398_18 = 0.5

				for iter_398_7, iter_398_8 in pairs(arg_395_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_398_8 then
						iter_398_8.color = Color.New(var_398_18, var_398_18, var_398_18)
					end
				end

				arg_395_1.var_.actorSpriteComps1132 = nil
			end

			local var_398_19 = manager.ui.mainCamera.transform
			local var_398_20 = 0

			if var_398_20 < arg_395_1.time_ and arg_395_1.time_ <= var_398_20 + arg_398_0 then
				arg_395_1.var_.shakeOldPos = var_398_19.localPosition
			end

			local var_398_21 = 0.6

			if var_398_20 <= arg_395_1.time_ and arg_395_1.time_ < var_398_20 + var_398_21 then
				local var_398_22 = (arg_395_1.time_ - var_398_20) / 0.066
				local var_398_23, var_398_24 = math.modf(var_398_22)

				var_398_19.localPosition = Vector3.New(var_398_24 * 0.13, var_398_24 * 0.13, var_398_24 * 0.13) + arg_395_1.var_.shakeOldPos
			end

			if arg_395_1.time_ >= var_398_20 + var_398_21 and arg_395_1.time_ < var_398_20 + var_398_21 + arg_398_0 then
				var_398_19.localPosition = arg_395_1.var_.shakeOldPos
			end

			local var_398_25 = 0

			if var_398_25 < arg_395_1.time_ and arg_395_1.time_ <= var_398_25 + arg_398_0 then
				arg_395_1.allBtn_.enabled = false
			end

			local var_398_26 = 0.6

			if arg_395_1.time_ >= var_398_25 + var_398_26 and arg_395_1.time_ < var_398_25 + var_398_26 + arg_398_0 then
				arg_395_1.allBtn_.enabled = true
			end

			local var_398_27 = 0
			local var_398_28 = 0.225

			if var_398_27 < arg_395_1.time_ and arg_395_1.time_ <= var_398_27 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, true)

				local var_398_29 = arg_395_1:FormatText(StoryNameCfg[370].name)

				arg_395_1.leftNameTxt_.text = var_398_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_395_1.leftNameTxt_.transform)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1.leftNameTxt_.text)
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_30 = arg_395_1:GetWordFromCfg(117101098)
				local var_398_31 = arg_395_1:FormatText(var_398_30.content)

				arg_395_1.text_.text = var_398_31

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_32 = 9
				local var_398_33 = utf8.len(var_398_31)
				local var_398_34 = var_398_32 <= 0 and var_398_28 or var_398_28 * (var_398_33 / var_398_32)

				if var_398_34 > 0 and var_398_28 < var_398_34 then
					arg_395_1.talkMaxDuration = var_398_34

					if var_398_34 + var_398_27 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_34 + var_398_27
					end
				end

				arg_395_1.text_.text = var_398_31
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117101", "117101098", "story_v_out_117101.awb") ~= 0 then
					local var_398_35 = manager.audio:GetVoiceLength("story_v_out_117101", "117101098", "story_v_out_117101.awb") / 1000

					if var_398_35 + var_398_27 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_35 + var_398_27
					end

					if var_398_30.prefab_name ~= "" and arg_395_1.actors_[var_398_30.prefab_name] ~= nil then
						local var_398_36 = LuaForUtil.PlayVoiceWithCriLipsync(arg_395_1.actors_[var_398_30.prefab_name].transform, "story_v_out_117101", "117101098", "story_v_out_117101.awb")

						arg_395_1:RecordAudio("117101098", var_398_36)
						arg_395_1:RecordAudio("117101098", var_398_36)
					else
						arg_395_1:AudioAction("play", "voice", "story_v_out_117101", "117101098", "story_v_out_117101.awb")
					end

					arg_395_1:RecordHistoryTalkVoice("story_v_out_117101", "117101098", "story_v_out_117101.awb")
				end

				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_37 = math.max(var_398_28, arg_395_1.talkMaxDuration)

			if var_398_27 <= arg_395_1.time_ and arg_395_1.time_ < var_398_27 + var_398_37 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_27) / var_398_37

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_27 + var_398_37 and arg_395_1.time_ < var_398_27 + var_398_37 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play117101099 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 117101099
		arg_399_1.duration_ = 5

		SetActive(arg_399_1.tipsGo_, false)

		function arg_399_1.onSingleLineFinish_()
			arg_399_1.onSingleLineUpdate_ = nil
			arg_399_1.onSingleLineFinish_ = nil
			arg_399_1.state_ = "waiting"
		end

		function arg_399_1.playNext_(arg_401_0)
			if arg_401_0 == 1 then
				arg_399_0:Play117101100(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = arg_399_1.actors_["1132"]
			local var_402_1 = 0

			if var_402_1 < arg_399_1.time_ and arg_399_1.time_ <= var_402_1 + arg_402_0 then
				local var_402_2 = var_402_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_402_2 then
					arg_399_1.var_.alphaOldValue1132 = var_402_2.alpha
					arg_399_1.var_.characterEffect1132 = var_402_2
				end

				arg_399_1.var_.alphaOldValue1132 = 1
			end

			local var_402_3 = 0.333333333333333

			if var_402_1 <= arg_399_1.time_ and arg_399_1.time_ < var_402_1 + var_402_3 then
				local var_402_4 = (arg_399_1.time_ - var_402_1) / var_402_3
				local var_402_5 = Mathf.Lerp(arg_399_1.var_.alphaOldValue1132, 0, var_402_4)

				if arg_399_1.var_.characterEffect1132 then
					arg_399_1.var_.characterEffect1132.alpha = var_402_5
				end
			end

			if arg_399_1.time_ >= var_402_1 + var_402_3 and arg_399_1.time_ < var_402_1 + var_402_3 + arg_402_0 and arg_399_1.var_.characterEffect1132 then
				arg_399_1.var_.characterEffect1132.alpha = 0
			end

			local var_402_6 = arg_399_1.actors_["10036"]
			local var_402_7 = 0

			if var_402_7 < arg_399_1.time_ and arg_399_1.time_ <= var_402_7 + arg_402_0 then
				local var_402_8 = var_402_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_402_8 then
					arg_399_1.var_.alphaOldValue10036 = var_402_8.alpha
					arg_399_1.var_.characterEffect10036 = var_402_8
				end

				arg_399_1.var_.alphaOldValue10036 = 1
			end

			local var_402_9 = 0.333333333333333

			if var_402_7 <= arg_399_1.time_ and arg_399_1.time_ < var_402_7 + var_402_9 then
				local var_402_10 = (arg_399_1.time_ - var_402_7) / var_402_9
				local var_402_11 = Mathf.Lerp(arg_399_1.var_.alphaOldValue10036, 0, var_402_10)

				if arg_399_1.var_.characterEffect10036 then
					arg_399_1.var_.characterEffect10036.alpha = var_402_11
				end
			end

			if arg_399_1.time_ >= var_402_7 + var_402_9 and arg_399_1.time_ < var_402_7 + var_402_9 + arg_402_0 and arg_399_1.var_.characterEffect10036 then
				arg_399_1.var_.characterEffect10036.alpha = 0
			end

			local var_402_12 = 0
			local var_402_13 = 0.975

			if var_402_12 < arg_399_1.time_ and arg_399_1.time_ <= var_402_12 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, false)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_14 = arg_399_1:GetWordFromCfg(117101099)
				local var_402_15 = arg_399_1:FormatText(var_402_14.content)

				arg_399_1.text_.text = var_402_15

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_16 = 39
				local var_402_17 = utf8.len(var_402_15)
				local var_402_18 = var_402_16 <= 0 and var_402_13 or var_402_13 * (var_402_17 / var_402_16)

				if var_402_18 > 0 and var_402_13 < var_402_18 then
					arg_399_1.talkMaxDuration = var_402_18

					if var_402_18 + var_402_12 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_18 + var_402_12
					end
				end

				arg_399_1.text_.text = var_402_15
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)
				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_19 = math.max(var_402_13, arg_399_1.talkMaxDuration)

			if var_402_12 <= arg_399_1.time_ and arg_399_1.time_ < var_402_12 + var_402_19 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_12) / var_402_19

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_12 + var_402_19 and arg_399_1.time_ < var_402_12 + var_402_19 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play117101100 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 117101100
		arg_403_1.duration_ = 5

		SetActive(arg_403_1.tipsGo_, false)

		function arg_403_1.onSingleLineFinish_()
			arg_403_1.onSingleLineUpdate_ = nil
			arg_403_1.onSingleLineFinish_ = nil
			arg_403_1.state_ = "waiting"
		end

		function arg_403_1.playNext_(arg_405_0)
			if arg_405_0 == 1 then
				arg_403_0:Play117101101(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = manager.ui.mainCamera.transform
			local var_406_1 = 0

			if var_406_1 < arg_403_1.time_ and arg_403_1.time_ <= var_406_1 + arg_406_0 then
				local var_406_2 = arg_403_1.var_.effectniuqu1

				if not var_406_2 then
					var_406_2 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ripple"))
					var_406_2.name = "niuqu1"
					arg_403_1.var_.effectniuqu1 = var_406_2
				end

				local var_406_3 = var_406_0:Find("")

				if var_406_3 then
					var_406_2.transform.parent = var_406_3
				else
					var_406_2.transform.parent = var_406_0
				end

				var_406_2.transform.localPosition = Vector3.New(0, 0, 0)
				var_406_2.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_406_4 = 0

			if var_406_4 < arg_403_1.time_ and arg_403_1.time_ <= var_406_4 + arg_406_0 then
				arg_403_1.mask_.enabled = true
				arg_403_1.mask_.raycastTarget = true

				arg_403_1:SetGaussion(false)
			end

			local var_406_5 = 2

			if var_406_4 <= arg_403_1.time_ and arg_403_1.time_ < var_406_4 + var_406_5 then
				local var_406_6 = (arg_403_1.time_ - var_406_4) / var_406_5
				local var_406_7 = Color.New(0.735849, 0.1910944, 0.03818085)

				var_406_7.a = Mathf.Lerp(1, 0, var_406_6)
				arg_403_1.mask_.color = var_406_7
			end

			if arg_403_1.time_ >= var_406_4 + var_406_5 and arg_403_1.time_ < var_406_4 + var_406_5 + arg_406_0 then
				local var_406_8 = Color.New(0.735849, 0.1910944, 0.03818085)
				local var_406_9 = 0

				arg_403_1.mask_.enabled = false
				var_406_8.a = var_406_9
				arg_403_1.mask_.color = var_406_8
			end

			local var_406_10 = manager.ui.mainCamera.transform
			local var_406_11 = 0

			if var_406_11 < arg_403_1.time_ and arg_403_1.time_ <= var_406_11 + arg_406_0 then
				local var_406_12 = arg_403_1.var_.effectred

				if not var_406_12 then
					var_406_12 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ui_red"))
					var_406_12.name = "red"
					arg_403_1.var_.effectred = var_406_12
				end

				local var_406_13 = var_406_10:Find("")

				if var_406_13 then
					var_406_12.transform.parent = var_406_13
				else
					var_406_12.transform.parent = var_406_10
				end

				var_406_12.transform.localPosition = Vector3.New(0, 0.06, 0.18)
				var_406_12.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_406_14 = 0
			local var_406_15 = 1

			if var_406_14 < arg_403_1.time_ and arg_403_1.time_ <= var_406_14 + arg_406_0 then
				local var_406_16 = "play"
				local var_406_17 = "effect"

				arg_403_1:AudioAction(var_406_16, var_406_17, "se_story_17", "se_story_17_bell", "")
			end

			local var_406_18 = 0
			local var_406_19 = 1

			if var_406_18 < arg_403_1.time_ and arg_403_1.time_ <= var_406_18 + arg_406_0 then
				local var_406_20 = "play"
				local var_406_21 = "effect"

				arg_403_1:AudioAction(var_406_20, var_406_21, "se_story_17", "se_story_17_fire_loop", "")
			end

			local var_406_22 = 0
			local var_406_23 = 1.3

			if var_406_22 < arg_403_1.time_ and arg_403_1.time_ <= var_406_22 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, false)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_24 = arg_403_1:GetWordFromCfg(117101100)
				local var_406_25 = arg_403_1:FormatText(var_406_24.content)

				arg_403_1.text_.text = var_406_25

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_26 = 52
				local var_406_27 = utf8.len(var_406_25)
				local var_406_28 = var_406_26 <= 0 and var_406_23 or var_406_23 * (var_406_27 / var_406_26)

				if var_406_28 > 0 and var_406_23 < var_406_28 then
					arg_403_1.talkMaxDuration = var_406_28

					if var_406_28 + var_406_22 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_28 + var_406_22
					end
				end

				arg_403_1.text_.text = var_406_25
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)
				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_29 = math.max(var_406_23, arg_403_1.talkMaxDuration)

			if var_406_22 <= arg_403_1.time_ and arg_403_1.time_ < var_406_22 + var_406_29 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_22) / var_406_29

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_22 + var_406_29 and arg_403_1.time_ < var_406_22 + var_406_29 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play117101101 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 117101101
		arg_407_1.duration_ = 5

		SetActive(arg_407_1.tipsGo_, false)

		function arg_407_1.onSingleLineFinish_()
			arg_407_1.onSingleLineUpdate_ = nil
			arg_407_1.onSingleLineFinish_ = nil
			arg_407_1.state_ = "waiting"
			arg_407_1.auto_ = false
		end

		function arg_407_1.playNext_(arg_409_0)
			arg_407_1.onStoryFinished_()
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = manager.ui.mainCamera.transform
			local var_410_1 = 0

			if var_410_1 < arg_407_1.time_ and arg_407_1.time_ <= var_410_1 + arg_410_0 then
				arg_407_1.var_.shakeOldPos = var_410_0.localPosition
			end

			local var_410_2 = 0.6

			if var_410_1 <= arg_407_1.time_ and arg_407_1.time_ < var_410_1 + var_410_2 then
				local var_410_3 = (arg_407_1.time_ - var_410_1) / 0.066
				local var_410_4, var_410_5 = math.modf(var_410_3)

				var_410_0.localPosition = Vector3.New(var_410_5 * 0.13, var_410_5 * 0.13, var_410_5 * 0.13) + arg_407_1.var_.shakeOldPos
			end

			if arg_407_1.time_ >= var_410_1 + var_410_2 and arg_407_1.time_ < var_410_1 + var_410_2 + arg_410_0 then
				var_410_0.localPosition = arg_407_1.var_.shakeOldPos
			end

			local var_410_6 = 0

			if var_410_6 < arg_407_1.time_ and arg_407_1.time_ <= var_410_6 + arg_410_0 then
				arg_407_1.allBtn_.enabled = false
			end

			local var_410_7 = 0.6

			if arg_407_1.time_ >= var_410_6 + var_410_7 and arg_407_1.time_ < var_410_6 + var_410_7 + arg_410_0 then
				arg_407_1.allBtn_.enabled = true
			end

			local var_410_8 = 0
			local var_410_9 = 1

			if var_410_8 < arg_407_1.time_ and arg_407_1.time_ <= var_410_8 + arg_410_0 then
				local var_410_10 = "play"
				local var_410_11 = "effect"

				arg_407_1:AudioAction(var_410_10, var_410_11, "se_story_9", "se_story_9_monster03", "")
			end

			local var_410_12 = 0
			local var_410_13 = 0.075

			if var_410_12 < arg_407_1.time_ and arg_407_1.time_ <= var_410_12 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, true)

				local var_410_14 = arg_407_1:FormatText(StoryNameCfg[68].name)

				arg_407_1.leftNameTxt_.text = var_410_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_407_1.leftNameTxt_.transform)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1.leftNameTxt_.text)
				SetActive(arg_407_1.iconTrs_.gameObject, true)
				arg_407_1.iconController_:SetSelectedState("hero")

				arg_407_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2037")

				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_15 = arg_407_1:GetWordFromCfg(117101101)
				local var_410_16 = arg_407_1:FormatText(var_410_15.content)

				arg_407_1.text_.text = var_410_16

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_17 = 3
				local var_410_18 = utf8.len(var_410_16)
				local var_410_19 = var_410_17 <= 0 and var_410_13 or var_410_13 * (var_410_18 / var_410_17)

				if var_410_19 > 0 and var_410_13 < var_410_19 then
					arg_407_1.talkMaxDuration = var_410_19

					if var_410_19 + var_410_12 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_19 + var_410_12
					end
				end

				arg_407_1.text_.text = var_410_16
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)
				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_20 = math.max(var_410_13, arg_407_1.talkMaxDuration)

			if var_410_12 <= arg_407_1.time_ and arg_407_1.time_ < var_410_12 + var_410_20 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_12) / var_410_20

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_12 + var_410_20 and arg_407_1.time_ < var_410_12 + var_410_20 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST24a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B01c",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B01b"
	},
	voices = {
		"story_v_out_117101.awb"
	}
}
