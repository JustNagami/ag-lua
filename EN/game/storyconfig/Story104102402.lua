return {
	Play410242001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 410242001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play410242002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "L04h"

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
				local var_4_5 = arg_1_1.bgs_.L04h

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
					if iter_4_0 ~= "L04h" then
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

			local var_4_30 = 2
			local var_4_31 = 1

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "effect"

				arg_1_1:AudioAction(var_4_32, var_4_33, "se_story_122_03", "se_story_122_03_hit", "")
			end

			local var_4_34 = 2

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = false

				arg_1_1:SetGaussion(false)
			end

			local var_4_35 = 1

			if var_4_34 <= arg_1_1.time_ and arg_1_1.time_ < var_4_34 + var_4_35 then
				local var_4_36 = (arg_1_1.time_ - var_4_34) / var_4_35
				local var_4_37 = Color.New(1, 1, 1)

				var_4_37.a = Mathf.Lerp(1, 0, var_4_36)
				arg_1_1.mask_.color = var_4_37
			end

			if arg_1_1.time_ >= var_4_34 + var_4_35 and arg_1_1.time_ < var_4_34 + var_4_35 + arg_4_0 then
				local var_4_38 = Color.New(1, 1, 1)
				local var_4_39 = 0

				arg_1_1.mask_.enabled = false
				var_4_38.a = var_4_39
				arg_1_1.mask_.color = var_4_38
			end

			local var_4_40 = manager.ui.mainCamera.transform
			local var_4_41 = 2

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				arg_1_1.var_.shakeOldPos = var_4_40.localPosition
			end

			local var_4_42 = 1.5

			if var_4_41 <= arg_1_1.time_ and arg_1_1.time_ < var_4_41 + var_4_42 then
				local var_4_43 = (arg_1_1.time_ - var_4_41) / 0.066
				local var_4_44, var_4_45 = math.modf(var_4_43)

				var_4_40.localPosition = Vector3.New(var_4_45 * 0.13, var_4_45 * 0.13, var_4_45 * 0.13) + arg_1_1.var_.shakeOldPos
			end

			if arg_1_1.time_ >= var_4_41 + var_4_42 and arg_1_1.time_ < var_4_41 + var_4_42 + arg_4_0 then
				var_4_40.localPosition = arg_1_1.var_.shakeOldPos
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_46 = 2
			local var_4_47 = 0.1

			if var_4_46 < arg_1_1.time_ and arg_1_1.time_ <= var_4_46 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_48 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_48:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_49 = arg_1_1:GetWordFromCfg(410242001)
				local var_4_50 = arg_1_1:FormatText(var_4_49.content)

				arg_1_1.text_.text = var_4_50

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_51 = 4
				local var_4_52 = utf8.len(var_4_50)
				local var_4_53 = var_4_51 <= 0 and var_4_47 or var_4_47 * (var_4_52 / var_4_51)

				if var_4_53 > 0 and var_4_47 < var_4_53 then
					arg_1_1.talkMaxDuration = var_4_53
					var_4_46 = var_4_46 + 0.3

					if var_4_53 + var_4_46 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_53 + var_4_46
					end
				end

				arg_1_1.text_.text = var_4_50
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_54 = var_4_46 + 0.3
			local var_4_55 = math.max(var_4_47, arg_1_1.talkMaxDuration)

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
	Play410242002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 410242002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play410242003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.25

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

				local var_10_2 = arg_7_1:GetWordFromCfg(410242002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 50
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
	Play410242003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 410242003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play410242004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1.6

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

				local var_14_2 = arg_11_1:GetWordFromCfg(410242003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 64
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
	Play410242004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 410242004
		arg_15_1.duration_ = 2.166

		local var_15_0 = {
			ja = 1.066,
			CriLanguages = 2.166,
			zh = 2.166
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
				arg_15_0:Play410242005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "1061"

			if arg_15_1.actors_[var_18_0] == nil then
				local var_18_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_18_0), arg_15_1.canvasGo_.transform)

				var_18_1.transform:SetSiblingIndex(1)

				var_18_1.name = var_18_0
				var_18_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_15_1.actors_[var_18_0] = var_18_1
			end

			local var_18_2 = arg_15_1.actors_["1061"].transform
			local var_18_3 = 0

			if var_18_3 < arg_15_1.time_ and arg_15_1.time_ <= var_18_3 + arg_18_0 then
				arg_15_1.var_.moveOldPos1061 = var_18_2.localPosition
				var_18_2.localScale = Vector3.New(1, 1, 1)

				arg_15_1:CheckSpriteTmpPos("1061", 3)

				local var_18_4 = var_18_2.childCount

				for iter_18_0 = 0, var_18_4 - 1 do
					local var_18_5 = var_18_2:GetChild(iter_18_0)

					if var_18_5.name == "split_5" or not string.find(var_18_5.name, "split") then
						var_18_5.gameObject:SetActive(true)
					else
						var_18_5.gameObject:SetActive(false)
					end
				end
			end

			local var_18_6 = 0.001

			if var_18_3 <= arg_15_1.time_ and arg_15_1.time_ < var_18_3 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_3) / var_18_6
				local var_18_8 = Vector3.New(0, -490, 18)

				var_18_2.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1061, var_18_8, var_18_7)
			end

			if arg_15_1.time_ >= var_18_3 + var_18_6 and arg_15_1.time_ < var_18_3 + var_18_6 + arg_18_0 then
				var_18_2.localPosition = Vector3.New(0, -490, 18)
			end

			local var_18_9 = arg_15_1.actors_["1061"]
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 and arg_15_1.var_.actorSpriteComps1061 == nil then
				arg_15_1.var_.actorSpriteComps1061 = var_18_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_11 = 0.034

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11

				if arg_15_1.var_.actorSpriteComps1061 then
					for iter_18_1, iter_18_2 in pairs(arg_15_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_18_2 then
							local var_18_13 = Mathf.Lerp(iter_18_2.color.r, 1, var_18_12)

							iter_18_2.color = Color.New(var_18_13, var_18_13, var_18_13)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 and arg_15_1.var_.actorSpriteComps1061 then
				local var_18_14 = 1

				for iter_18_3, iter_18_4 in pairs(arg_15_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_18_4 then
						iter_18_4.color = Color.New(var_18_14, var_18_14, var_18_14)
					end
				end

				arg_15_1.var_.actorSpriteComps1061 = nil
			end

			local var_18_15 = 0
			local var_18_16 = 0.1

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_17 = arg_15_1:FormatText(StoryNameCfg[612].name)

				arg_15_1.leftNameTxt_.text = var_18_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_18 = arg_15_1:GetWordFromCfg(410242004)
				local var_18_19 = arg_15_1:FormatText(var_18_18.content)

				arg_15_1.text_.text = var_18_19

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_20 = 4
				local var_18_21 = utf8.len(var_18_19)
				local var_18_22 = var_18_20 <= 0 and var_18_16 or var_18_16 * (var_18_21 / var_18_20)

				if var_18_22 > 0 and var_18_16 < var_18_22 then
					arg_15_1.talkMaxDuration = var_18_22

					if var_18_22 + var_18_15 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_22 + var_18_15
					end
				end

				arg_15_1.text_.text = var_18_19
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242004", "story_v_out_410242.awb") ~= 0 then
					local var_18_23 = manager.audio:GetVoiceLength("story_v_out_410242", "410242004", "story_v_out_410242.awb") / 1000

					if var_18_23 + var_18_15 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_23 + var_18_15
					end

					if var_18_18.prefab_name ~= "" and arg_15_1.actors_[var_18_18.prefab_name] ~= nil then
						local var_18_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_18.prefab_name].transform, "story_v_out_410242", "410242004", "story_v_out_410242.awb")

						arg_15_1:RecordAudio("410242004", var_18_24)
						arg_15_1:RecordAudio("410242004", var_18_24)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_410242", "410242004", "story_v_out_410242.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_410242", "410242004", "story_v_out_410242.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_25 = math.max(var_18_16, arg_15_1.talkMaxDuration)

			if var_18_15 <= arg_15_1.time_ and arg_15_1.time_ < var_18_15 + var_18_25 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_15) / var_18_25

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_15 + var_18_25 and arg_15_1.time_ < var_18_15 + var_18_25 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play410242005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 410242005
		arg_19_1.duration_ = 3.433

		local var_19_0 = {
			ja = 3.433,
			CriLanguages = 1.933,
			zh = 1.933
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
				arg_19_0:Play410242006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1061"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1061 = var_22_0.localPosition
				var_22_0.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("1061", 7)

				local var_22_2 = var_22_0.childCount

				for iter_22_0 = 0, var_22_2 - 1 do
					local var_22_3 = var_22_0:GetChild(iter_22_0)

					if var_22_3.name == "" or not string.find(var_22_3.name, "split") then
						var_22_3.gameObject:SetActive(true)
					else
						var_22_3.gameObject:SetActive(false)
					end
				end
			end

			local var_22_4 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_4 then
				local var_22_5 = (arg_19_1.time_ - var_22_1) / var_22_4
				local var_22_6 = Vector3.New(0, -2000, 18)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1061, var_22_6, var_22_5)
			end

			if arg_19_1.time_ >= var_22_1 + var_22_4 and arg_19_1.time_ < var_22_1 + var_22_4 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_22_7 = "10062"

			if arg_19_1.actors_[var_22_7] == nil then
				local var_22_8 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_22_7), arg_19_1.canvasGo_.transform)

				var_22_8.transform:SetSiblingIndex(1)

				var_22_8.name = var_22_7
				var_22_8.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_19_1.actors_[var_22_7] = var_22_8
			end

			local var_22_9 = arg_19_1.actors_["10062"].transform
			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 then
				arg_19_1.var_.moveOldPos10062 = var_22_9.localPosition
				var_22_9.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("10062", 3)

				local var_22_11 = var_22_9.childCount

				for iter_22_1 = 0, var_22_11 - 1 do
					local var_22_12 = var_22_9:GetChild(iter_22_1)

					if var_22_12.name == "split_2" or not string.find(var_22_12.name, "split") then
						var_22_12.gameObject:SetActive(true)
					else
						var_22_12.gameObject:SetActive(false)
					end
				end
			end

			local var_22_13 = 0.001

			if var_22_10 <= arg_19_1.time_ and arg_19_1.time_ < var_22_10 + var_22_13 then
				local var_22_14 = (arg_19_1.time_ - var_22_10) / var_22_13
				local var_22_15 = Vector3.New(0, -390, -290)

				var_22_9.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos10062, var_22_15, var_22_14)
			end

			if arg_19_1.time_ >= var_22_10 + var_22_13 and arg_19_1.time_ < var_22_10 + var_22_13 + arg_22_0 then
				var_22_9.localPosition = Vector3.New(0, -390, -290)
			end

			local var_22_16 = arg_19_1.actors_["1061"]
			local var_22_17 = 0

			if var_22_17 < arg_19_1.time_ and arg_19_1.time_ <= var_22_17 + arg_22_0 and arg_19_1.var_.actorSpriteComps1061 == nil then
				arg_19_1.var_.actorSpriteComps1061 = var_22_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_18 = 0.034

			if var_22_17 <= arg_19_1.time_ and arg_19_1.time_ < var_22_17 + var_22_18 then
				local var_22_19 = (arg_19_1.time_ - var_22_17) / var_22_18

				if arg_19_1.var_.actorSpriteComps1061 then
					for iter_22_2, iter_22_3 in pairs(arg_19_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_22_3 then
							local var_22_20 = Mathf.Lerp(iter_22_3.color.r, 0.5, var_22_19)

							iter_22_3.color = Color.New(var_22_20, var_22_20, var_22_20)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_17 + var_22_18 and arg_19_1.time_ < var_22_17 + var_22_18 + arg_22_0 and arg_19_1.var_.actorSpriteComps1061 then
				local var_22_21 = 0.5

				for iter_22_4, iter_22_5 in pairs(arg_19_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_22_5 then
						iter_22_5.color = Color.New(var_22_21, var_22_21, var_22_21)
					end
				end

				arg_19_1.var_.actorSpriteComps1061 = nil
			end

			local var_22_22 = arg_19_1.actors_["10062"]
			local var_22_23 = 0

			if var_22_23 < arg_19_1.time_ and arg_19_1.time_ <= var_22_23 + arg_22_0 and arg_19_1.var_.actorSpriteComps10062 == nil then
				arg_19_1.var_.actorSpriteComps10062 = var_22_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_24 = 0.034

			if var_22_23 <= arg_19_1.time_ and arg_19_1.time_ < var_22_23 + var_22_24 then
				local var_22_25 = (arg_19_1.time_ - var_22_23) / var_22_24

				if arg_19_1.var_.actorSpriteComps10062 then
					for iter_22_6, iter_22_7 in pairs(arg_19_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_22_7 then
							local var_22_26 = Mathf.Lerp(iter_22_7.color.r, 1, var_22_25)

							iter_22_7.color = Color.New(var_22_26, var_22_26, var_22_26)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_23 + var_22_24 and arg_19_1.time_ < var_22_23 + var_22_24 + arg_22_0 and arg_19_1.var_.actorSpriteComps10062 then
				local var_22_27 = 1

				for iter_22_8, iter_22_9 in pairs(arg_19_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_22_9 then
						iter_22_9.color = Color.New(var_22_27, var_22_27, var_22_27)
					end
				end

				arg_19_1.var_.actorSpriteComps10062 = nil
			end

			local var_22_28 = 0
			local var_22_29 = 0.175

			if var_22_28 < arg_19_1.time_ and arg_19_1.time_ <= var_22_28 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_30 = arg_19_1:FormatText(StoryNameCfg[600].name)

				arg_19_1.leftNameTxt_.text = var_22_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_31 = arg_19_1:GetWordFromCfg(410242005)
				local var_22_32 = arg_19_1:FormatText(var_22_31.content)

				arg_19_1.text_.text = var_22_32

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_33 = 7
				local var_22_34 = utf8.len(var_22_32)
				local var_22_35 = var_22_33 <= 0 and var_22_29 or var_22_29 * (var_22_34 / var_22_33)

				if var_22_35 > 0 and var_22_29 < var_22_35 then
					arg_19_1.talkMaxDuration = var_22_35

					if var_22_35 + var_22_28 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_35 + var_22_28
					end
				end

				arg_19_1.text_.text = var_22_32
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242005", "story_v_out_410242.awb") ~= 0 then
					local var_22_36 = manager.audio:GetVoiceLength("story_v_out_410242", "410242005", "story_v_out_410242.awb") / 1000

					if var_22_36 + var_22_28 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_36 + var_22_28
					end

					if var_22_31.prefab_name ~= "" and arg_19_1.actors_[var_22_31.prefab_name] ~= nil then
						local var_22_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_31.prefab_name].transform, "story_v_out_410242", "410242005", "story_v_out_410242.awb")

						arg_19_1:RecordAudio("410242005", var_22_37)
						arg_19_1:RecordAudio("410242005", var_22_37)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_410242", "410242005", "story_v_out_410242.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_410242", "410242005", "story_v_out_410242.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_38 = math.max(var_22_29, arg_19_1.talkMaxDuration)

			if var_22_28 <= arg_19_1.time_ and arg_19_1.time_ < var_22_28 + var_22_38 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_28) / var_22_38

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_28 + var_22_38 and arg_19_1.time_ < var_22_28 + var_22_38 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play410242006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 410242006
		arg_23_1.duration_ = 5.4

		local var_23_0 = {
			ja = 5.4,
			CriLanguages = 3.866,
			zh = 3.866
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
				arg_23_0:Play410242007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1061"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1061 = var_26_0.localPosition
				var_26_0.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("1061", 3)

				local var_26_2 = var_26_0.childCount

				for iter_26_0 = 0, var_26_2 - 1 do
					local var_26_3 = var_26_0:GetChild(iter_26_0)

					if var_26_3.name == "split_2" or not string.find(var_26_3.name, "split") then
						var_26_3.gameObject:SetActive(true)
					else
						var_26_3.gameObject:SetActive(false)
					end
				end
			end

			local var_26_4 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_4 then
				local var_26_5 = (arg_23_1.time_ - var_26_1) / var_26_4
				local var_26_6 = Vector3.New(0, -490, 18)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1061, var_26_6, var_26_5)
			end

			if arg_23_1.time_ >= var_26_1 + var_26_4 and arg_23_1.time_ < var_26_1 + var_26_4 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_26_7 = arg_23_1.actors_["10062"].transform
			local var_26_8 = 0

			if var_26_8 < arg_23_1.time_ and arg_23_1.time_ <= var_26_8 + arg_26_0 then
				arg_23_1.var_.moveOldPos10062 = var_26_7.localPosition
				var_26_7.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("10062", 7)

				local var_26_9 = var_26_7.childCount

				for iter_26_1 = 0, var_26_9 - 1 do
					local var_26_10 = var_26_7:GetChild(iter_26_1)

					if var_26_10.name == "" or not string.find(var_26_10.name, "split") then
						var_26_10.gameObject:SetActive(true)
					else
						var_26_10.gameObject:SetActive(false)
					end
				end
			end

			local var_26_11 = 0.001

			if var_26_8 <= arg_23_1.time_ and arg_23_1.time_ < var_26_8 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_8) / var_26_11
				local var_26_13 = Vector3.New(0, -2000, -290)

				var_26_7.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos10062, var_26_13, var_26_12)
			end

			if arg_23_1.time_ >= var_26_8 + var_26_11 and arg_23_1.time_ < var_26_8 + var_26_11 + arg_26_0 then
				var_26_7.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_26_14 = arg_23_1.actors_["1061"]
			local var_26_15 = 0

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 and arg_23_1.var_.actorSpriteComps1061 == nil then
				arg_23_1.var_.actorSpriteComps1061 = var_26_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_16 = 0.034

			if var_26_15 <= arg_23_1.time_ and arg_23_1.time_ < var_26_15 + var_26_16 then
				local var_26_17 = (arg_23_1.time_ - var_26_15) / var_26_16

				if arg_23_1.var_.actorSpriteComps1061 then
					for iter_26_2, iter_26_3 in pairs(arg_23_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_26_3 then
							local var_26_18 = Mathf.Lerp(iter_26_3.color.r, 1, var_26_17)

							iter_26_3.color = Color.New(var_26_18, var_26_18, var_26_18)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_15 + var_26_16 and arg_23_1.time_ < var_26_15 + var_26_16 + arg_26_0 and arg_23_1.var_.actorSpriteComps1061 then
				local var_26_19 = 1

				for iter_26_4, iter_26_5 in pairs(arg_23_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_26_5 then
						iter_26_5.color = Color.New(var_26_19, var_26_19, var_26_19)
					end
				end

				arg_23_1.var_.actorSpriteComps1061 = nil
			end

			local var_26_20 = arg_23_1.actors_["10062"]
			local var_26_21 = 0

			if var_26_21 < arg_23_1.time_ and arg_23_1.time_ <= var_26_21 + arg_26_0 and arg_23_1.var_.actorSpriteComps10062 == nil then
				arg_23_1.var_.actorSpriteComps10062 = var_26_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_22 = 0.034

			if var_26_21 <= arg_23_1.time_ and arg_23_1.time_ < var_26_21 + var_26_22 then
				local var_26_23 = (arg_23_1.time_ - var_26_21) / var_26_22

				if arg_23_1.var_.actorSpriteComps10062 then
					for iter_26_6, iter_26_7 in pairs(arg_23_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_26_7 then
							local var_26_24 = Mathf.Lerp(iter_26_7.color.r, 0.5, var_26_23)

							iter_26_7.color = Color.New(var_26_24, var_26_24, var_26_24)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_21 + var_26_22 and arg_23_1.time_ < var_26_21 + var_26_22 + arg_26_0 and arg_23_1.var_.actorSpriteComps10062 then
				local var_26_25 = 0.5

				for iter_26_8, iter_26_9 in pairs(arg_23_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_26_9 then
						iter_26_9.color = Color.New(var_26_25, var_26_25, var_26_25)
					end
				end

				arg_23_1.var_.actorSpriteComps10062 = nil
			end

			local var_26_26 = 0
			local var_26_27 = 0.3

			if var_26_26 < arg_23_1.time_ and arg_23_1.time_ <= var_26_26 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_28 = arg_23_1:FormatText(StoryNameCfg[612].name)

				arg_23_1.leftNameTxt_.text = var_26_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_29 = arg_23_1:GetWordFromCfg(410242006)
				local var_26_30 = arg_23_1:FormatText(var_26_29.content)

				arg_23_1.text_.text = var_26_30

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_31 = 12
				local var_26_32 = utf8.len(var_26_30)
				local var_26_33 = var_26_31 <= 0 and var_26_27 or var_26_27 * (var_26_32 / var_26_31)

				if var_26_33 > 0 and var_26_27 < var_26_33 then
					arg_23_1.talkMaxDuration = var_26_33

					if var_26_33 + var_26_26 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_33 + var_26_26
					end
				end

				arg_23_1.text_.text = var_26_30
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242006", "story_v_out_410242.awb") ~= 0 then
					local var_26_34 = manager.audio:GetVoiceLength("story_v_out_410242", "410242006", "story_v_out_410242.awb") / 1000

					if var_26_34 + var_26_26 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_34 + var_26_26
					end

					if var_26_29.prefab_name ~= "" and arg_23_1.actors_[var_26_29.prefab_name] ~= nil then
						local var_26_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_29.prefab_name].transform, "story_v_out_410242", "410242006", "story_v_out_410242.awb")

						arg_23_1:RecordAudio("410242006", var_26_35)
						arg_23_1:RecordAudio("410242006", var_26_35)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_410242", "410242006", "story_v_out_410242.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_410242", "410242006", "story_v_out_410242.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_36 = math.max(var_26_27, arg_23_1.talkMaxDuration)

			if var_26_26 <= arg_23_1.time_ and arg_23_1.time_ < var_26_26 + var_26_36 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_26) / var_26_36

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_26 + var_26_36 and arg_23_1.time_ < var_26_26 + var_26_36 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play410242007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 410242007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play410242008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1061"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1061 = var_30_0.localPosition
				var_30_0.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("1061", 7)

				local var_30_2 = var_30_0.childCount

				for iter_30_0 = 0, var_30_2 - 1 do
					local var_30_3 = var_30_0:GetChild(iter_30_0)

					if var_30_3.name == "" or not string.find(var_30_3.name, "split") then
						var_30_3.gameObject:SetActive(true)
					else
						var_30_3.gameObject:SetActive(false)
					end
				end
			end

			local var_30_4 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_4 then
				local var_30_5 = (arg_27_1.time_ - var_30_1) / var_30_4
				local var_30_6 = Vector3.New(0, -2000, 18)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1061, var_30_6, var_30_5)
			end

			if arg_27_1.time_ >= var_30_1 + var_30_4 and arg_27_1.time_ < var_30_1 + var_30_4 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_30_7 = arg_27_1.actors_["1061"]
			local var_30_8 = 0

			if var_30_8 < arg_27_1.time_ and arg_27_1.time_ <= var_30_8 + arg_30_0 and arg_27_1.var_.actorSpriteComps1061 == nil then
				arg_27_1.var_.actorSpriteComps1061 = var_30_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_9 = 0.034

			if var_30_8 <= arg_27_1.time_ and arg_27_1.time_ < var_30_8 + var_30_9 then
				local var_30_10 = (arg_27_1.time_ - var_30_8) / var_30_9

				if arg_27_1.var_.actorSpriteComps1061 then
					for iter_30_1, iter_30_2 in pairs(arg_27_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_30_2 then
							local var_30_11 = Mathf.Lerp(iter_30_2.color.r, 0.5, var_30_10)

							iter_30_2.color = Color.New(var_30_11, var_30_11, var_30_11)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_8 + var_30_9 and arg_27_1.time_ < var_30_8 + var_30_9 + arg_30_0 and arg_27_1.var_.actorSpriteComps1061 then
				local var_30_12 = 0.5

				for iter_30_3, iter_30_4 in pairs(arg_27_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_30_4 then
						iter_30_4.color = Color.New(var_30_12, var_30_12, var_30_12)
					end
				end

				arg_27_1.var_.actorSpriteComps1061 = nil
			end

			local var_30_13 = 0
			local var_30_14 = 1.025

			if var_30_13 < arg_27_1.time_ and arg_27_1.time_ <= var_30_13 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_15 = arg_27_1:GetWordFromCfg(410242007)
				local var_30_16 = arg_27_1:FormatText(var_30_15.content)

				arg_27_1.text_.text = var_30_16

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_17 = 41
				local var_30_18 = utf8.len(var_30_16)
				local var_30_19 = var_30_17 <= 0 and var_30_14 or var_30_14 * (var_30_18 / var_30_17)

				if var_30_19 > 0 and var_30_14 < var_30_19 then
					arg_27_1.talkMaxDuration = var_30_19

					if var_30_19 + var_30_13 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_19 + var_30_13
					end
				end

				arg_27_1.text_.text = var_30_16
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_20 = math.max(var_30_14, arg_27_1.talkMaxDuration)

			if var_30_13 <= arg_27_1.time_ and arg_27_1.time_ < var_30_13 + var_30_20 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_13) / var_30_20

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_13 + var_30_20 and arg_27_1.time_ < var_30_13 + var_30_20 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play410242008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 410242008
		arg_31_1.duration_ = 5.866

		local var_31_0 = {
			ja = 5.866,
			CriLanguages = 2.966,
			zh = 2.966
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
				arg_31_0:Play410242009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10062"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos10062 = var_34_0.localPosition
				var_34_0.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("10062", 3)

				local var_34_2 = var_34_0.childCount

				for iter_34_0 = 0, var_34_2 - 1 do
					local var_34_3 = var_34_0:GetChild(iter_34_0)

					if var_34_3.name == "" or not string.find(var_34_3.name, "split") then
						var_34_3.gameObject:SetActive(true)
					else
						var_34_3.gameObject:SetActive(false)
					end
				end
			end

			local var_34_4 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_4 then
				local var_34_5 = (arg_31_1.time_ - var_34_1) / var_34_4
				local var_34_6 = Vector3.New(0, -390, -290)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10062, var_34_6, var_34_5)
			end

			if arg_31_1.time_ >= var_34_1 + var_34_4 and arg_31_1.time_ < var_34_1 + var_34_4 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_34_7 = arg_31_1.actors_["10062"]
			local var_34_8 = 0

			if var_34_8 < arg_31_1.time_ and arg_31_1.time_ <= var_34_8 + arg_34_0 and arg_31_1.var_.actorSpriteComps10062 == nil then
				arg_31_1.var_.actorSpriteComps10062 = var_34_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_9 = 0.034

			if var_34_8 <= arg_31_1.time_ and arg_31_1.time_ < var_34_8 + var_34_9 then
				local var_34_10 = (arg_31_1.time_ - var_34_8) / var_34_9

				if arg_31_1.var_.actorSpriteComps10062 then
					for iter_34_1, iter_34_2 in pairs(arg_31_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_34_2 then
							local var_34_11 = Mathf.Lerp(iter_34_2.color.r, 1, var_34_10)

							iter_34_2.color = Color.New(var_34_11, var_34_11, var_34_11)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_8 + var_34_9 and arg_31_1.time_ < var_34_8 + var_34_9 + arg_34_0 and arg_31_1.var_.actorSpriteComps10062 then
				local var_34_12 = 1

				for iter_34_3, iter_34_4 in pairs(arg_31_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_34_4 then
						iter_34_4.color = Color.New(var_34_12, var_34_12, var_34_12)
					end
				end

				arg_31_1.var_.actorSpriteComps10062 = nil
			end

			local var_34_13 = 0
			local var_34_14 = 0.325

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_15 = arg_31_1:FormatText(StoryNameCfg[600].name)

				arg_31_1.leftNameTxt_.text = var_34_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_16 = arg_31_1:GetWordFromCfg(410242008)
				local var_34_17 = arg_31_1:FormatText(var_34_16.content)

				arg_31_1.text_.text = var_34_17

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_18 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242008", "story_v_out_410242.awb") ~= 0 then
					local var_34_21 = manager.audio:GetVoiceLength("story_v_out_410242", "410242008", "story_v_out_410242.awb") / 1000

					if var_34_21 + var_34_13 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_21 + var_34_13
					end

					if var_34_16.prefab_name ~= "" and arg_31_1.actors_[var_34_16.prefab_name] ~= nil then
						local var_34_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_16.prefab_name].transform, "story_v_out_410242", "410242008", "story_v_out_410242.awb")

						arg_31_1:RecordAudio("410242008", var_34_22)
						arg_31_1:RecordAudio("410242008", var_34_22)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_410242", "410242008", "story_v_out_410242.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_410242", "410242008", "story_v_out_410242.awb")
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
	Play410242009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 410242009
		arg_35_1.duration_ = 13.2

		local var_35_0 = {
			ja = 13.2,
			CriLanguages = 9.333,
			zh = 9.333
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
				arg_35_0:Play410242010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1061"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1061 = var_38_0.localPosition
				var_38_0.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("1061", 3)

				local var_38_2 = var_38_0.childCount

				for iter_38_0 = 0, var_38_2 - 1 do
					local var_38_3 = var_38_0:GetChild(iter_38_0)

					if var_38_3.name == "" or not string.find(var_38_3.name, "split") then
						var_38_3.gameObject:SetActive(true)
					else
						var_38_3.gameObject:SetActive(false)
					end
				end
			end

			local var_38_4 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_4 then
				local var_38_5 = (arg_35_1.time_ - var_38_1) / var_38_4
				local var_38_6 = Vector3.New(0, -490, 18)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1061, var_38_6, var_38_5)
			end

			if arg_35_1.time_ >= var_38_1 + var_38_4 and arg_35_1.time_ < var_38_1 + var_38_4 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_38_7 = arg_35_1.actors_["10062"].transform
			local var_38_8 = 0

			if var_38_8 < arg_35_1.time_ and arg_35_1.time_ <= var_38_8 + arg_38_0 then
				arg_35_1.var_.moveOldPos10062 = var_38_7.localPosition
				var_38_7.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("10062", 7)

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
				local var_38_13 = Vector3.New(0, -2000, -290)

				var_38_7.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos10062, var_38_13, var_38_12)
			end

			if arg_35_1.time_ >= var_38_8 + var_38_11 and arg_35_1.time_ < var_38_8 + var_38_11 + arg_38_0 then
				var_38_7.localPosition = Vector3.New(0, -2000, -290)
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

			local var_38_20 = arg_35_1.actors_["10062"]
			local var_38_21 = 0

			if var_38_21 < arg_35_1.time_ and arg_35_1.time_ <= var_38_21 + arg_38_0 and arg_35_1.var_.actorSpriteComps10062 == nil then
				arg_35_1.var_.actorSpriteComps10062 = var_38_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_22 = 0.034

			if var_38_21 <= arg_35_1.time_ and arg_35_1.time_ < var_38_21 + var_38_22 then
				local var_38_23 = (arg_35_1.time_ - var_38_21) / var_38_22

				if arg_35_1.var_.actorSpriteComps10062 then
					for iter_38_6, iter_38_7 in pairs(arg_35_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_38_7 then
							local var_38_24 = Mathf.Lerp(iter_38_7.color.r, 0.5, var_38_23)

							iter_38_7.color = Color.New(var_38_24, var_38_24, var_38_24)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_21 + var_38_22 and arg_35_1.time_ < var_38_21 + var_38_22 + arg_38_0 and arg_35_1.var_.actorSpriteComps10062 then
				local var_38_25 = 0.5

				for iter_38_8, iter_38_9 in pairs(arg_35_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_38_9 then
						iter_38_9.color = Color.New(var_38_25, var_38_25, var_38_25)
					end
				end

				arg_35_1.var_.actorSpriteComps10062 = nil
			end

			local var_38_26 = 0
			local var_38_27 = 1.1

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

				local var_38_29 = arg_35_1:GetWordFromCfg(410242009)
				local var_38_30 = arg_35_1:FormatText(var_38_29.content)

				arg_35_1.text_.text = var_38_30

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_31 = 44
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

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242009", "story_v_out_410242.awb") ~= 0 then
					local var_38_34 = manager.audio:GetVoiceLength("story_v_out_410242", "410242009", "story_v_out_410242.awb") / 1000

					if var_38_34 + var_38_26 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_34 + var_38_26
					end

					if var_38_29.prefab_name ~= "" and arg_35_1.actors_[var_38_29.prefab_name] ~= nil then
						local var_38_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_29.prefab_name].transform, "story_v_out_410242", "410242009", "story_v_out_410242.awb")

						arg_35_1:RecordAudio("410242009", var_38_35)
						arg_35_1:RecordAudio("410242009", var_38_35)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_410242", "410242009", "story_v_out_410242.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_410242", "410242009", "story_v_out_410242.awb")
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
	Play410242010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 410242010
		arg_39_1.duration_ = 10.966

		local var_39_0 = {
			ja = 10.5,
			CriLanguages = 10.966,
			zh = 10.966
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
				arg_39_0:Play410242011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 1.1

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_2 = arg_39_1:FormatText(StoryNameCfg[612].name)

				arg_39_1.leftNameTxt_.text = var_42_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(410242010)
				local var_42_4 = arg_39_1:FormatText(var_42_3.content)

				arg_39_1.text_.text = var_42_4

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_5 = 44
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

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242010", "story_v_out_410242.awb") ~= 0 then
					local var_42_8 = manager.audio:GetVoiceLength("story_v_out_410242", "410242010", "story_v_out_410242.awb") / 1000

					if var_42_8 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_8 + var_42_0
					end

					if var_42_3.prefab_name ~= "" and arg_39_1.actors_[var_42_3.prefab_name] ~= nil then
						local var_42_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_3.prefab_name].transform, "story_v_out_410242", "410242010", "story_v_out_410242.awb")

						arg_39_1:RecordAudio("410242010", var_42_9)
						arg_39_1:RecordAudio("410242010", var_42_9)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_410242", "410242010", "story_v_out_410242.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_410242", "410242010", "story_v_out_410242.awb")
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
	Play410242011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 410242011
		arg_43_1.duration_ = 6.466

		local var_43_0 = {
			ja = 6.466,
			CriLanguages = 3.833,
			zh = 3.833
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
				arg_43_0:Play410242012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10062"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos10062 = var_46_0.localPosition
				var_46_0.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("10062", 3)

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
				local var_46_6 = Vector3.New(0, -390, -290)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos10062, var_46_6, var_46_5)
			end

			if arg_43_1.time_ >= var_46_1 + var_46_4 and arg_43_1.time_ < var_46_1 + var_46_4 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_46_7 = arg_43_1.actors_["1061"].transform
			local var_46_8 = 0

			if var_46_8 < arg_43_1.time_ and arg_43_1.time_ <= var_46_8 + arg_46_0 then
				arg_43_1.var_.moveOldPos1061 = var_46_7.localPosition
				var_46_7.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("1061", 7)

				local var_46_9 = var_46_7.childCount

				for iter_46_1 = 0, var_46_9 - 1 do
					local var_46_10 = var_46_7:GetChild(iter_46_1)

					if var_46_10.name == "" or not string.find(var_46_10.name, "split") then
						var_46_10.gameObject:SetActive(true)
					else
						var_46_10.gameObject:SetActive(false)
					end
				end
			end

			local var_46_11 = 0.001

			if var_46_8 <= arg_43_1.time_ and arg_43_1.time_ < var_46_8 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_8) / var_46_11
				local var_46_13 = Vector3.New(0, -2000, 18)

				var_46_7.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1061, var_46_13, var_46_12)
			end

			if arg_43_1.time_ >= var_46_8 + var_46_11 and arg_43_1.time_ < var_46_8 + var_46_11 + arg_46_0 then
				var_46_7.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_46_14 = arg_43_1.actors_["10062"]
			local var_46_15 = 0

			if var_46_15 < arg_43_1.time_ and arg_43_1.time_ <= var_46_15 + arg_46_0 and arg_43_1.var_.actorSpriteComps10062 == nil then
				arg_43_1.var_.actorSpriteComps10062 = var_46_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_16 = 0.034

			if var_46_15 <= arg_43_1.time_ and arg_43_1.time_ < var_46_15 + var_46_16 then
				local var_46_17 = (arg_43_1.time_ - var_46_15) / var_46_16

				if arg_43_1.var_.actorSpriteComps10062 then
					for iter_46_2, iter_46_3 in pairs(arg_43_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_46_3 then
							local var_46_18 = Mathf.Lerp(iter_46_3.color.r, 1, var_46_17)

							iter_46_3.color = Color.New(var_46_18, var_46_18, var_46_18)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_15 + var_46_16 and arg_43_1.time_ < var_46_15 + var_46_16 + arg_46_0 and arg_43_1.var_.actorSpriteComps10062 then
				local var_46_19 = 1

				for iter_46_4, iter_46_5 in pairs(arg_43_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_46_5 then
						iter_46_5.color = Color.New(var_46_19, var_46_19, var_46_19)
					end
				end

				arg_43_1.var_.actorSpriteComps10062 = nil
			end

			local var_46_20 = arg_43_1.actors_["1061"]
			local var_46_21 = 0

			if var_46_21 < arg_43_1.time_ and arg_43_1.time_ <= var_46_21 + arg_46_0 and arg_43_1.var_.actorSpriteComps1061 == nil then
				arg_43_1.var_.actorSpriteComps1061 = var_46_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_22 = 0.034

			if var_46_21 <= arg_43_1.time_ and arg_43_1.time_ < var_46_21 + var_46_22 then
				local var_46_23 = (arg_43_1.time_ - var_46_21) / var_46_22

				if arg_43_1.var_.actorSpriteComps1061 then
					for iter_46_6, iter_46_7 in pairs(arg_43_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_46_7 then
							local var_46_24 = Mathf.Lerp(iter_46_7.color.r, 0.5, var_46_23)

							iter_46_7.color = Color.New(var_46_24, var_46_24, var_46_24)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_21 + var_46_22 and arg_43_1.time_ < var_46_21 + var_46_22 + arg_46_0 and arg_43_1.var_.actorSpriteComps1061 then
				local var_46_25 = 0.5

				for iter_46_8, iter_46_9 in pairs(arg_43_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_46_9 then
						iter_46_9.color = Color.New(var_46_25, var_46_25, var_46_25)
					end
				end

				arg_43_1.var_.actorSpriteComps1061 = nil
			end

			local var_46_26 = 0
			local var_46_27 = 0.4

			if var_46_26 < arg_43_1.time_ and arg_43_1.time_ <= var_46_26 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_28 = arg_43_1:FormatText(StoryNameCfg[600].name)

				arg_43_1.leftNameTxt_.text = var_46_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_29 = arg_43_1:GetWordFromCfg(410242011)
				local var_46_30 = arg_43_1:FormatText(var_46_29.content)

				arg_43_1.text_.text = var_46_30

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_31 = 16
				local var_46_32 = utf8.len(var_46_30)
				local var_46_33 = var_46_31 <= 0 and var_46_27 or var_46_27 * (var_46_32 / var_46_31)

				if var_46_33 > 0 and var_46_27 < var_46_33 then
					arg_43_1.talkMaxDuration = var_46_33

					if var_46_33 + var_46_26 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_33 + var_46_26
					end
				end

				arg_43_1.text_.text = var_46_30
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242011", "story_v_out_410242.awb") ~= 0 then
					local var_46_34 = manager.audio:GetVoiceLength("story_v_out_410242", "410242011", "story_v_out_410242.awb") / 1000

					if var_46_34 + var_46_26 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_34 + var_46_26
					end

					if var_46_29.prefab_name ~= "" and arg_43_1.actors_[var_46_29.prefab_name] ~= nil then
						local var_46_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_29.prefab_name].transform, "story_v_out_410242", "410242011", "story_v_out_410242.awb")

						arg_43_1:RecordAudio("410242011", var_46_35)
						arg_43_1:RecordAudio("410242011", var_46_35)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_410242", "410242011", "story_v_out_410242.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_410242", "410242011", "story_v_out_410242.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_36 = math.max(var_46_27, arg_43_1.talkMaxDuration)

			if var_46_26 <= arg_43_1.time_ and arg_43_1.time_ < var_46_26 + var_46_36 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_26) / var_46_36

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_26 + var_46_36 and arg_43_1.time_ < var_46_26 + var_46_36 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play410242012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 410242012
		arg_47_1.duration_ = 5

		local var_47_0 = {
			ja = 2.566,
			CriLanguages = 5,
			zh = 5
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
				arg_47_0:Play410242013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1061"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1061 = var_50_0.localPosition
				var_50_0.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("1061", 3)

				local var_50_2 = var_50_0.childCount

				for iter_50_0 = 0, var_50_2 - 1 do
					local var_50_3 = var_50_0:GetChild(iter_50_0)

					if var_50_3.name == "split_2" or not string.find(var_50_3.name, "split") then
						var_50_3.gameObject:SetActive(true)
					else
						var_50_3.gameObject:SetActive(false)
					end
				end
			end

			local var_50_4 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_4 then
				local var_50_5 = (arg_47_1.time_ - var_50_1) / var_50_4
				local var_50_6 = Vector3.New(0, -490, 18)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1061, var_50_6, var_50_5)
			end

			if arg_47_1.time_ >= var_50_1 + var_50_4 and arg_47_1.time_ < var_50_1 + var_50_4 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_50_7 = arg_47_1.actors_["10062"].transform
			local var_50_8 = 0

			if var_50_8 < arg_47_1.time_ and arg_47_1.time_ <= var_50_8 + arg_50_0 then
				arg_47_1.var_.moveOldPos10062 = var_50_7.localPosition
				var_50_7.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("10062", 7)

				local var_50_9 = var_50_7.childCount

				for iter_50_1 = 0, var_50_9 - 1 do
					local var_50_10 = var_50_7:GetChild(iter_50_1)

					if var_50_10.name == "" or not string.find(var_50_10.name, "split") then
						var_50_10.gameObject:SetActive(true)
					else
						var_50_10.gameObject:SetActive(false)
					end
				end
			end

			local var_50_11 = 0.001

			if var_50_8 <= arg_47_1.time_ and arg_47_1.time_ < var_50_8 + var_50_11 then
				local var_50_12 = (arg_47_1.time_ - var_50_8) / var_50_11
				local var_50_13 = Vector3.New(0, -2000, -290)

				var_50_7.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos10062, var_50_13, var_50_12)
			end

			if arg_47_1.time_ >= var_50_8 + var_50_11 and arg_47_1.time_ < var_50_8 + var_50_11 + arg_50_0 then
				var_50_7.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_50_14 = arg_47_1.actors_["1061"]
			local var_50_15 = 0

			if var_50_15 < arg_47_1.time_ and arg_47_1.time_ <= var_50_15 + arg_50_0 and arg_47_1.var_.actorSpriteComps1061 == nil then
				arg_47_1.var_.actorSpriteComps1061 = var_50_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_16 = 0.034

			if var_50_15 <= arg_47_1.time_ and arg_47_1.time_ < var_50_15 + var_50_16 then
				local var_50_17 = (arg_47_1.time_ - var_50_15) / var_50_16

				if arg_47_1.var_.actorSpriteComps1061 then
					for iter_50_2, iter_50_3 in pairs(arg_47_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_50_3 then
							local var_50_18 = Mathf.Lerp(iter_50_3.color.r, 1, var_50_17)

							iter_50_3.color = Color.New(var_50_18, var_50_18, var_50_18)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_15 + var_50_16 and arg_47_1.time_ < var_50_15 + var_50_16 + arg_50_0 and arg_47_1.var_.actorSpriteComps1061 then
				local var_50_19 = 1

				for iter_50_4, iter_50_5 in pairs(arg_47_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_50_5 then
						iter_50_5.color = Color.New(var_50_19, var_50_19, var_50_19)
					end
				end

				arg_47_1.var_.actorSpriteComps1061 = nil
			end

			local var_50_20 = arg_47_1.actors_["10062"]
			local var_50_21 = 0

			if var_50_21 < arg_47_1.time_ and arg_47_1.time_ <= var_50_21 + arg_50_0 and arg_47_1.var_.actorSpriteComps10062 == nil then
				arg_47_1.var_.actorSpriteComps10062 = var_50_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_22 = 0.034

			if var_50_21 <= arg_47_1.time_ and arg_47_1.time_ < var_50_21 + var_50_22 then
				local var_50_23 = (arg_47_1.time_ - var_50_21) / var_50_22

				if arg_47_1.var_.actorSpriteComps10062 then
					for iter_50_6, iter_50_7 in pairs(arg_47_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_50_7 then
							local var_50_24 = Mathf.Lerp(iter_50_7.color.r, 0.5, var_50_23)

							iter_50_7.color = Color.New(var_50_24, var_50_24, var_50_24)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_21 + var_50_22 and arg_47_1.time_ < var_50_21 + var_50_22 + arg_50_0 and arg_47_1.var_.actorSpriteComps10062 then
				local var_50_25 = 0.5

				for iter_50_8, iter_50_9 in pairs(arg_47_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_50_9 then
						iter_50_9.color = Color.New(var_50_25, var_50_25, var_50_25)
					end
				end

				arg_47_1.var_.actorSpriteComps10062 = nil
			end

			local var_50_26 = 0
			local var_50_27 = 0.375

			if var_50_26 < arg_47_1.time_ and arg_47_1.time_ <= var_50_26 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_28 = arg_47_1:FormatText(StoryNameCfg[612].name)

				arg_47_1.leftNameTxt_.text = var_50_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_29 = arg_47_1:GetWordFromCfg(410242012)
				local var_50_30 = arg_47_1:FormatText(var_50_29.content)

				arg_47_1.text_.text = var_50_30

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_31 = 15
				local var_50_32 = utf8.len(var_50_30)
				local var_50_33 = var_50_31 <= 0 and var_50_27 or var_50_27 * (var_50_32 / var_50_31)

				if var_50_33 > 0 and var_50_27 < var_50_33 then
					arg_47_1.talkMaxDuration = var_50_33

					if var_50_33 + var_50_26 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_33 + var_50_26
					end
				end

				arg_47_1.text_.text = var_50_30
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242012", "story_v_out_410242.awb") ~= 0 then
					local var_50_34 = manager.audio:GetVoiceLength("story_v_out_410242", "410242012", "story_v_out_410242.awb") / 1000

					if var_50_34 + var_50_26 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_34 + var_50_26
					end

					if var_50_29.prefab_name ~= "" and arg_47_1.actors_[var_50_29.prefab_name] ~= nil then
						local var_50_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_29.prefab_name].transform, "story_v_out_410242", "410242012", "story_v_out_410242.awb")

						arg_47_1:RecordAudio("410242012", var_50_35)
						arg_47_1:RecordAudio("410242012", var_50_35)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_410242", "410242012", "story_v_out_410242.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_410242", "410242012", "story_v_out_410242.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_36 = math.max(var_50_27, arg_47_1.talkMaxDuration)

			if var_50_26 <= arg_47_1.time_ and arg_47_1.time_ < var_50_26 + var_50_36 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_26) / var_50_36

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_26 + var_50_36 and arg_47_1.time_ < var_50_26 + var_50_36 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play410242013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 410242013
		arg_51_1.duration_ = 8.3

		local var_51_0 = {
			ja = 8.3,
			CriLanguages = 7.1,
			zh = 7.1
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
				arg_51_0:Play410242014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["10062"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos10062 = var_54_0.localPosition
				var_54_0.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("10062", 3)

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
				local var_54_6 = Vector3.New(0, -390, -290)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos10062, var_54_6, var_54_5)
			end

			if arg_51_1.time_ >= var_54_1 + var_54_4 and arg_51_1.time_ < var_54_1 + var_54_4 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_54_7 = arg_51_1.actors_["1061"].transform
			local var_54_8 = 0

			if var_54_8 < arg_51_1.time_ and arg_51_1.time_ <= var_54_8 + arg_54_0 then
				arg_51_1.var_.moveOldPos1061 = var_54_7.localPosition
				var_54_7.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("1061", 7)

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
				local var_54_13 = Vector3.New(0, -2000, 18)

				var_54_7.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1061, var_54_13, var_54_12)
			end

			if arg_51_1.time_ >= var_54_8 + var_54_11 and arg_51_1.time_ < var_54_8 + var_54_11 + arg_54_0 then
				var_54_7.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_54_14 = arg_51_1.actors_["10062"]
			local var_54_15 = 0

			if var_54_15 < arg_51_1.time_ and arg_51_1.time_ <= var_54_15 + arg_54_0 and arg_51_1.var_.actorSpriteComps10062 == nil then
				arg_51_1.var_.actorSpriteComps10062 = var_54_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_16 = 0.034

			if var_54_15 <= arg_51_1.time_ and arg_51_1.time_ < var_54_15 + var_54_16 then
				local var_54_17 = (arg_51_1.time_ - var_54_15) / var_54_16

				if arg_51_1.var_.actorSpriteComps10062 then
					for iter_54_2, iter_54_3 in pairs(arg_51_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_54_3 then
							local var_54_18 = Mathf.Lerp(iter_54_3.color.r, 1, var_54_17)

							iter_54_3.color = Color.New(var_54_18, var_54_18, var_54_18)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_15 + var_54_16 and arg_51_1.time_ < var_54_15 + var_54_16 + arg_54_0 and arg_51_1.var_.actorSpriteComps10062 then
				local var_54_19 = 1

				for iter_54_4, iter_54_5 in pairs(arg_51_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_54_5 then
						iter_54_5.color = Color.New(var_54_19, var_54_19, var_54_19)
					end
				end

				arg_51_1.var_.actorSpriteComps10062 = nil
			end

			local var_54_20 = arg_51_1.actors_["1061"]
			local var_54_21 = 0

			if var_54_21 < arg_51_1.time_ and arg_51_1.time_ <= var_54_21 + arg_54_0 and arg_51_1.var_.actorSpriteComps1061 == nil then
				arg_51_1.var_.actorSpriteComps1061 = var_54_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_22 = 0.034

			if var_54_21 <= arg_51_1.time_ and arg_51_1.time_ < var_54_21 + var_54_22 then
				local var_54_23 = (arg_51_1.time_ - var_54_21) / var_54_22

				if arg_51_1.var_.actorSpriteComps1061 then
					for iter_54_6, iter_54_7 in pairs(arg_51_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_54_7 then
							local var_54_24 = Mathf.Lerp(iter_54_7.color.r, 0.5, var_54_23)

							iter_54_7.color = Color.New(var_54_24, var_54_24, var_54_24)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_21 + var_54_22 and arg_51_1.time_ < var_54_21 + var_54_22 + arg_54_0 and arg_51_1.var_.actorSpriteComps1061 then
				local var_54_25 = 0.5

				for iter_54_8, iter_54_9 in pairs(arg_51_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_54_9 then
						iter_54_9.color = Color.New(var_54_25, var_54_25, var_54_25)
					end
				end

				arg_51_1.var_.actorSpriteComps1061 = nil
			end

			local var_54_26 = 0
			local var_54_27 = 0.225

			if var_54_26 < arg_51_1.time_ and arg_51_1.time_ <= var_54_26 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_28 = arg_51_1:FormatText(StoryNameCfg[600].name)

				arg_51_1.leftNameTxt_.text = var_54_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_29 = arg_51_1:GetWordFromCfg(410242013)
				local var_54_30 = arg_51_1:FormatText(var_54_29.content)

				arg_51_1.text_.text = var_54_30

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_31 = 9
				local var_54_32 = utf8.len(var_54_30)
				local var_54_33 = var_54_31 <= 0 and var_54_27 or var_54_27 * (var_54_32 / var_54_31)

				if var_54_33 > 0 and var_54_27 < var_54_33 then
					arg_51_1.talkMaxDuration = var_54_33

					if var_54_33 + var_54_26 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_33 + var_54_26
					end
				end

				arg_51_1.text_.text = var_54_30
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242013", "story_v_out_410242.awb") ~= 0 then
					local var_54_34 = manager.audio:GetVoiceLength("story_v_out_410242", "410242013", "story_v_out_410242.awb") / 1000

					if var_54_34 + var_54_26 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_34 + var_54_26
					end

					if var_54_29.prefab_name ~= "" and arg_51_1.actors_[var_54_29.prefab_name] ~= nil then
						local var_54_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_29.prefab_name].transform, "story_v_out_410242", "410242013", "story_v_out_410242.awb")

						arg_51_1:RecordAudio("410242013", var_54_35)
						arg_51_1:RecordAudio("410242013", var_54_35)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_410242", "410242013", "story_v_out_410242.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_410242", "410242013", "story_v_out_410242.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_36 = math.max(var_54_27, arg_51_1.talkMaxDuration)

			if var_54_26 <= arg_51_1.time_ and arg_51_1.time_ < var_54_26 + var_54_36 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_26) / var_54_36

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_26 + var_54_36 and arg_51_1.time_ < var_54_26 + var_54_36 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play410242014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 410242014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play410242015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["10062"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos10062 = var_58_0.localPosition
				var_58_0.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("10062", 7)

				local var_58_2 = var_58_0.childCount

				for iter_58_0 = 0, var_58_2 - 1 do
					local var_58_3 = var_58_0:GetChild(iter_58_0)

					if var_58_3.name == "" or not string.find(var_58_3.name, "split") then
						var_58_3.gameObject:SetActive(true)
					else
						var_58_3.gameObject:SetActive(false)
					end
				end
			end

			local var_58_4 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_4 then
				local var_58_5 = (arg_55_1.time_ - var_58_1) / var_58_4
				local var_58_6 = Vector3.New(0, -2000, -290)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos10062, var_58_6, var_58_5)
			end

			if arg_55_1.time_ >= var_58_1 + var_58_4 and arg_55_1.time_ < var_58_1 + var_58_4 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_58_7 = arg_55_1.actors_["10062"]
			local var_58_8 = 0

			if var_58_8 < arg_55_1.time_ and arg_55_1.time_ <= var_58_8 + arg_58_0 and arg_55_1.var_.actorSpriteComps10062 == nil then
				arg_55_1.var_.actorSpriteComps10062 = var_58_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_9 = 0.034

			if var_58_8 <= arg_55_1.time_ and arg_55_1.time_ < var_58_8 + var_58_9 then
				local var_58_10 = (arg_55_1.time_ - var_58_8) / var_58_9

				if arg_55_1.var_.actorSpriteComps10062 then
					for iter_58_1, iter_58_2 in pairs(arg_55_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_58_2 then
							local var_58_11 = Mathf.Lerp(iter_58_2.color.r, 0.5, var_58_10)

							iter_58_2.color = Color.New(var_58_11, var_58_11, var_58_11)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_8 + var_58_9 and arg_55_1.time_ < var_58_8 + var_58_9 + arg_58_0 and arg_55_1.var_.actorSpriteComps10062 then
				local var_58_12 = 0.5

				for iter_58_3, iter_58_4 in pairs(arg_55_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_58_4 then
						iter_58_4.color = Color.New(var_58_12, var_58_12, var_58_12)
					end
				end

				arg_55_1.var_.actorSpriteComps10062 = nil
			end

			local var_58_13 = 0
			local var_58_14 = 0.625

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_15 = arg_55_1:GetWordFromCfg(410242014)
				local var_58_16 = arg_55_1:FormatText(var_58_15.content)

				arg_55_1.text_.text = var_58_16

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_17 = 25
				local var_58_18 = utf8.len(var_58_16)
				local var_58_19 = var_58_17 <= 0 and var_58_14 or var_58_14 * (var_58_18 / var_58_17)

				if var_58_19 > 0 and var_58_14 < var_58_19 then
					arg_55_1.talkMaxDuration = var_58_19

					if var_58_19 + var_58_13 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_19 + var_58_13
					end
				end

				arg_55_1.text_.text = var_58_16
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_20 = math.max(var_58_14, arg_55_1.talkMaxDuration)

			if var_58_13 <= arg_55_1.time_ and arg_55_1.time_ < var_58_13 + var_58_20 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_13) / var_58_20

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_13 + var_58_20 and arg_55_1.time_ < var_58_13 + var_58_20 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play410242015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 410242015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play410242016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 1.05

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_2 = arg_59_1:GetWordFromCfg(410242015)
				local var_62_3 = arg_59_1:FormatText(var_62_2.content)

				arg_59_1.text_.text = var_62_3

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_4 = 42
				local var_62_5 = utf8.len(var_62_3)
				local var_62_6 = var_62_4 <= 0 and var_62_1 or var_62_1 * (var_62_5 / var_62_4)

				if var_62_6 > 0 and var_62_1 < var_62_6 then
					arg_59_1.talkMaxDuration = var_62_6

					if var_62_6 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_6 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_3
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_7 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_7 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_7

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_7 and arg_59_1.time_ < var_62_0 + var_62_7 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play410242016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 410242016
		arg_63_1.duration_ = 6

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play410242017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.mask_.enabled = true
				arg_63_1.mask_.raycastTarget = false

				arg_63_1:SetGaussion(false)
			end

			local var_66_1 = 1

			if var_66_0 <= arg_63_1.time_ and arg_63_1.time_ < var_66_0 + var_66_1 then
				local var_66_2 = (arg_63_1.time_ - var_66_0) / var_66_1
				local var_66_3 = Color.New(1, 1, 1)

				var_66_3.a = Mathf.Lerp(1, 0, var_66_2)
				arg_63_1.mask_.color = var_66_3
			end

			if arg_63_1.time_ >= var_66_0 + var_66_1 and arg_63_1.time_ < var_66_0 + var_66_1 + arg_66_0 then
				local var_66_4 = Color.New(1, 1, 1)
				local var_66_5 = 0

				arg_63_1.mask_.enabled = false
				var_66_4.a = var_66_5
				arg_63_1.mask_.color = var_66_4
			end

			local var_66_6 = manager.ui.mainCamera.transform
			local var_66_7 = 0

			if var_66_7 < arg_63_1.time_ and arg_63_1.time_ <= var_66_7 + arg_66_0 then
				arg_63_1.var_.shakeOldPos = var_66_6.localPosition
			end

			local var_66_8 = 1

			if var_66_7 <= arg_63_1.time_ and arg_63_1.time_ < var_66_7 + var_66_8 then
				local var_66_9 = (arg_63_1.time_ - var_66_7) / 0.066
				local var_66_10, var_66_11 = math.modf(var_66_9)

				var_66_6.localPosition = Vector3.New(var_66_11 * 0.13, var_66_11 * 0.13, var_66_11 * 0.13) + arg_63_1.var_.shakeOldPos
			end

			if arg_63_1.time_ >= var_66_7 + var_66_8 and arg_63_1.time_ < var_66_7 + var_66_8 + arg_66_0 then
				var_66_6.localPosition = arg_63_1.var_.shakeOldPos
			end

			local var_66_12 = manager.ui.mainCamera.transform
			local var_66_13 = 0

			if var_66_13 < arg_63_1.time_ and arg_63_1.time_ <= var_66_13 + arg_66_0 then
				local var_66_14 = arg_63_1.var_.effectluobonaquantou1

				if not var_66_14 then
					var_66_14 = Object.Instantiate(Asset.Load("Effect/Scene/fx_scence_pingmu_niuqu"))
					var_66_14.name = "luobonaquantou1"
					arg_63_1.var_.effectluobonaquantou1 = var_66_14
				end

				local var_66_15 = var_66_12:Find("")

				if var_66_15 then
					var_66_14.transform.parent = var_66_15
				else
					var_66_14.transform.parent = var_66_12
				end

				var_66_14.transform.localPosition = Vector3.New(0, 0, 0)
				var_66_14.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_66_16 = manager.ui.mainCamera.transform
			local var_66_17 = 1

			if var_66_17 < arg_63_1.time_ and arg_63_1.time_ <= var_66_17 + arg_66_0 then
				local var_66_18 = arg_63_1.var_.effectluobonaquantou1

				if var_66_18 then
					Object.Destroy(var_66_18)

					arg_63_1.var_.effectluobonaquantou1 = nil
				end
			end

			local var_66_19 = 1
			local var_66_20 = 1.15

			if var_66_19 < arg_63_1.time_ and arg_63_1.time_ <= var_66_19 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_21 = arg_63_1:GetWordFromCfg(410242016)
				local var_66_22 = arg_63_1:FormatText(var_66_21.content)

				arg_63_1.text_.text = var_66_22

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_23 = 46
				local var_66_24 = utf8.len(var_66_22)
				local var_66_25 = var_66_23 <= 0 and var_66_20 or var_66_20 * (var_66_24 / var_66_23)

				if var_66_25 > 0 and var_66_20 < var_66_25 then
					arg_63_1.talkMaxDuration = var_66_25

					if var_66_25 + var_66_19 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_25 + var_66_19
					end
				end

				arg_63_1.text_.text = var_66_22
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_26 = math.max(var_66_20, arg_63_1.talkMaxDuration)

			if var_66_19 <= arg_63_1.time_ and arg_63_1.time_ < var_66_19 + var_66_26 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_19) / var_66_26

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_19 + var_66_26 and arg_63_1.time_ < var_66_19 + var_66_26 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play410242017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 410242017
		arg_67_1.duration_ = 10.7

		local var_67_0 = {
			ja = 10.7,
			CriLanguages = 9.366,
			zh = 9.366
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
				arg_67_0:Play410242018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["10062"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos10062 = var_70_0.localPosition
				var_70_0.localScale = Vector3.New(1, 1, 1)

				arg_67_1:CheckSpriteTmpPos("10062", 3)

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
				local var_70_6 = Vector3.New(0, -390, -290)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos10062, var_70_6, var_70_5)
			end

			if arg_67_1.time_ >= var_70_1 + var_70_4 and arg_67_1.time_ < var_70_1 + var_70_4 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_70_7 = arg_67_1.actors_["10062"]
			local var_70_8 = 0

			if var_70_8 < arg_67_1.time_ and arg_67_1.time_ <= var_70_8 + arg_70_0 and arg_67_1.var_.actorSpriteComps10062 == nil then
				arg_67_1.var_.actorSpriteComps10062 = var_70_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_9 = 0.034

			if var_70_8 <= arg_67_1.time_ and arg_67_1.time_ < var_70_8 + var_70_9 then
				local var_70_10 = (arg_67_1.time_ - var_70_8) / var_70_9

				if arg_67_1.var_.actorSpriteComps10062 then
					for iter_70_1, iter_70_2 in pairs(arg_67_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_70_2 then
							local var_70_11 = Mathf.Lerp(iter_70_2.color.r, 1, var_70_10)

							iter_70_2.color = Color.New(var_70_11, var_70_11, var_70_11)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_8 + var_70_9 and arg_67_1.time_ < var_70_8 + var_70_9 + arg_70_0 and arg_67_1.var_.actorSpriteComps10062 then
				local var_70_12 = 1

				for iter_70_3, iter_70_4 in pairs(arg_67_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_70_4 then
						iter_70_4.color = Color.New(var_70_12, var_70_12, var_70_12)
					end
				end

				arg_67_1.var_.actorSpriteComps10062 = nil
			end

			local var_70_13 = 0
			local var_70_14 = 0.9

			if var_70_13 < arg_67_1.time_ and arg_67_1.time_ <= var_70_13 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_15 = arg_67_1:FormatText(StoryNameCfg[600].name)

				arg_67_1.leftNameTxt_.text = var_70_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_16 = arg_67_1:GetWordFromCfg(410242017)
				local var_70_17 = arg_67_1:FormatText(var_70_16.content)

				arg_67_1.text_.text = var_70_17

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_18 = 36
				local var_70_19 = utf8.len(var_70_17)
				local var_70_20 = var_70_18 <= 0 and var_70_14 or var_70_14 * (var_70_19 / var_70_18)

				if var_70_20 > 0 and var_70_14 < var_70_20 then
					arg_67_1.talkMaxDuration = var_70_20

					if var_70_20 + var_70_13 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_20 + var_70_13
					end
				end

				arg_67_1.text_.text = var_70_17
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242017", "story_v_out_410242.awb") ~= 0 then
					local var_70_21 = manager.audio:GetVoiceLength("story_v_out_410242", "410242017", "story_v_out_410242.awb") / 1000

					if var_70_21 + var_70_13 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_21 + var_70_13
					end

					if var_70_16.prefab_name ~= "" and arg_67_1.actors_[var_70_16.prefab_name] ~= nil then
						local var_70_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_16.prefab_name].transform, "story_v_out_410242", "410242017", "story_v_out_410242.awb")

						arg_67_1:RecordAudio("410242017", var_70_22)
						arg_67_1:RecordAudio("410242017", var_70_22)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_410242", "410242017", "story_v_out_410242.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_410242", "410242017", "story_v_out_410242.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_23 = math.max(var_70_14, arg_67_1.talkMaxDuration)

			if var_70_13 <= arg_67_1.time_ and arg_67_1.time_ < var_70_13 + var_70_23 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_13) / var_70_23

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_13 + var_70_23 and arg_67_1.time_ < var_70_13 + var_70_23 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play410242018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 410242018
		arg_71_1.duration_ = 19.1

		local var_71_0 = {
			ja = 19.1,
			CriLanguages = 11.2,
			zh = 11.2
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
				arg_71_0:Play410242019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["10062"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos10062 = var_74_0.localPosition
				var_74_0.localScale = Vector3.New(1, 1, 1)

				arg_71_1:CheckSpriteTmpPos("10062", 3)

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
				local var_74_6 = Vector3.New(0, -390, -290)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos10062, var_74_6, var_74_5)
			end

			if arg_71_1.time_ >= var_74_1 + var_74_4 and arg_71_1.time_ < var_74_1 + var_74_4 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_74_7 = arg_71_1.actors_["10062"]
			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 and arg_71_1.var_.actorSpriteComps10062 == nil then
				arg_71_1.var_.actorSpriteComps10062 = var_74_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_9 = 0.034

			if var_74_8 <= arg_71_1.time_ and arg_71_1.time_ < var_74_8 + var_74_9 then
				local var_74_10 = (arg_71_1.time_ - var_74_8) / var_74_9

				if arg_71_1.var_.actorSpriteComps10062 then
					for iter_74_1, iter_74_2 in pairs(arg_71_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_74_2 then
							local var_74_11 = Mathf.Lerp(iter_74_2.color.r, 1, var_74_10)

							iter_74_2.color = Color.New(var_74_11, var_74_11, var_74_11)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_8 + var_74_9 and arg_71_1.time_ < var_74_8 + var_74_9 + arg_74_0 and arg_71_1.var_.actorSpriteComps10062 then
				local var_74_12 = 1

				for iter_74_3, iter_74_4 in pairs(arg_71_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_74_4 then
						iter_74_4.color = Color.New(var_74_12, var_74_12, var_74_12)
					end
				end

				arg_71_1.var_.actorSpriteComps10062 = nil
			end

			local var_74_13 = 0
			local var_74_14 = 1.05

			if var_74_13 < arg_71_1.time_ and arg_71_1.time_ <= var_74_13 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_15 = arg_71_1:FormatText(StoryNameCfg[600].name)

				arg_71_1.leftNameTxt_.text = var_74_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_16 = arg_71_1:GetWordFromCfg(410242018)
				local var_74_17 = arg_71_1:FormatText(var_74_16.content)

				arg_71_1.text_.text = var_74_17

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_18 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242018", "story_v_out_410242.awb") ~= 0 then
					local var_74_21 = manager.audio:GetVoiceLength("story_v_out_410242", "410242018", "story_v_out_410242.awb") / 1000

					if var_74_21 + var_74_13 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_21 + var_74_13
					end

					if var_74_16.prefab_name ~= "" and arg_71_1.actors_[var_74_16.prefab_name] ~= nil then
						local var_74_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_16.prefab_name].transform, "story_v_out_410242", "410242018", "story_v_out_410242.awb")

						arg_71_1:RecordAudio("410242018", var_74_22)
						arg_71_1:RecordAudio("410242018", var_74_22)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_410242", "410242018", "story_v_out_410242.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_410242", "410242018", "story_v_out_410242.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_23 = math.max(var_74_14, arg_71_1.talkMaxDuration)

			if var_74_13 <= arg_71_1.time_ and arg_71_1.time_ < var_74_13 + var_74_23 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_13) / var_74_23

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_13 + var_74_23 and arg_71_1.time_ < var_74_13 + var_74_23 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play410242019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 410242019
		arg_75_1.duration_ = 20.366

		local var_75_0 = {
			ja = 20.366,
			CriLanguages = 11.6,
			zh = 11.6
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
				arg_75_0:Play410242020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["10062"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos10062 = var_78_0.localPosition
				var_78_0.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("10062", 3)

				local var_78_2 = var_78_0.childCount

				for iter_78_0 = 0, var_78_2 - 1 do
					local var_78_3 = var_78_0:GetChild(iter_78_0)

					if var_78_3.name == "split_5" or not string.find(var_78_3.name, "split") then
						var_78_3.gameObject:SetActive(true)
					else
						var_78_3.gameObject:SetActive(false)
					end
				end
			end

			local var_78_4 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_4 then
				local var_78_5 = (arg_75_1.time_ - var_78_1) / var_78_4
				local var_78_6 = Vector3.New(0, -390, -290)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10062, var_78_6, var_78_5)
			end

			if arg_75_1.time_ >= var_78_1 + var_78_4 and arg_75_1.time_ < var_78_1 + var_78_4 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_78_7 = arg_75_1.actors_["10062"]
			local var_78_8 = 0

			if var_78_8 < arg_75_1.time_ and arg_75_1.time_ <= var_78_8 + arg_78_0 and arg_75_1.var_.actorSpriteComps10062 == nil then
				arg_75_1.var_.actorSpriteComps10062 = var_78_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_9 = 0.034

			if var_78_8 <= arg_75_1.time_ and arg_75_1.time_ < var_78_8 + var_78_9 then
				local var_78_10 = (arg_75_1.time_ - var_78_8) / var_78_9

				if arg_75_1.var_.actorSpriteComps10062 then
					for iter_78_1, iter_78_2 in pairs(arg_75_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_78_2 then
							local var_78_11 = Mathf.Lerp(iter_78_2.color.r, 1, var_78_10)

							iter_78_2.color = Color.New(var_78_11, var_78_11, var_78_11)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_8 + var_78_9 and arg_75_1.time_ < var_78_8 + var_78_9 + arg_78_0 and arg_75_1.var_.actorSpriteComps10062 then
				local var_78_12 = 1

				for iter_78_3, iter_78_4 in pairs(arg_75_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_78_4 then
						iter_78_4.color = Color.New(var_78_12, var_78_12, var_78_12)
					end
				end

				arg_75_1.var_.actorSpriteComps10062 = nil
			end

			local var_78_13 = 0
			local var_78_14 = 1.2

			if var_78_13 < arg_75_1.time_ and arg_75_1.time_ <= var_78_13 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_15 = arg_75_1:FormatText(StoryNameCfg[600].name)

				arg_75_1.leftNameTxt_.text = var_78_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_16 = arg_75_1:GetWordFromCfg(410242019)
				local var_78_17 = arg_75_1:FormatText(var_78_16.content)

				arg_75_1.text_.text = var_78_17

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_18 = 48
				local var_78_19 = utf8.len(var_78_17)
				local var_78_20 = var_78_18 <= 0 and var_78_14 or var_78_14 * (var_78_19 / var_78_18)

				if var_78_20 > 0 and var_78_14 < var_78_20 then
					arg_75_1.talkMaxDuration = var_78_20

					if var_78_20 + var_78_13 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_20 + var_78_13
					end
				end

				arg_75_1.text_.text = var_78_17
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242019", "story_v_out_410242.awb") ~= 0 then
					local var_78_21 = manager.audio:GetVoiceLength("story_v_out_410242", "410242019", "story_v_out_410242.awb") / 1000

					if var_78_21 + var_78_13 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_21 + var_78_13
					end

					if var_78_16.prefab_name ~= "" and arg_75_1.actors_[var_78_16.prefab_name] ~= nil then
						local var_78_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_16.prefab_name].transform, "story_v_out_410242", "410242019", "story_v_out_410242.awb")

						arg_75_1:RecordAudio("410242019", var_78_22)
						arg_75_1:RecordAudio("410242019", var_78_22)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_410242", "410242019", "story_v_out_410242.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_410242", "410242019", "story_v_out_410242.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_23 = math.max(var_78_14, arg_75_1.talkMaxDuration)

			if var_78_13 <= arg_75_1.time_ and arg_75_1.time_ < var_78_13 + var_78_23 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_13) / var_78_23

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_13 + var_78_23 and arg_75_1.time_ < var_78_13 + var_78_23 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play410242020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 410242020
		arg_79_1.duration_ = 10.133

		local var_79_0 = {
			ja = 10.133,
			CriLanguages = 3.166,
			zh = 3.166
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
				arg_79_0:Play410242021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["10062"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos10062 = var_82_0.localPosition
				var_82_0.localScale = Vector3.New(1, 1, 1)

				arg_79_1:CheckSpriteTmpPos("10062", 3)

				local var_82_2 = var_82_0.childCount

				for iter_82_0 = 0, var_82_2 - 1 do
					local var_82_3 = var_82_0:GetChild(iter_82_0)

					if var_82_3.name == "split_2" or not string.find(var_82_3.name, "split") then
						var_82_3.gameObject:SetActive(true)
					else
						var_82_3.gameObject:SetActive(false)
					end
				end
			end

			local var_82_4 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_4 then
				local var_82_5 = (arg_79_1.time_ - var_82_1) / var_82_4
				local var_82_6 = Vector3.New(0, -390, -290)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos10062, var_82_6, var_82_5)
			end

			if arg_79_1.time_ >= var_82_1 + var_82_4 and arg_79_1.time_ < var_82_1 + var_82_4 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_82_7 = arg_79_1.actors_["10062"]
			local var_82_8 = 0

			if var_82_8 < arg_79_1.time_ and arg_79_1.time_ <= var_82_8 + arg_82_0 and arg_79_1.var_.actorSpriteComps10062 == nil then
				arg_79_1.var_.actorSpriteComps10062 = var_82_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_9 = 0.034

			if var_82_8 <= arg_79_1.time_ and arg_79_1.time_ < var_82_8 + var_82_9 then
				local var_82_10 = (arg_79_1.time_ - var_82_8) / var_82_9

				if arg_79_1.var_.actorSpriteComps10062 then
					for iter_82_1, iter_82_2 in pairs(arg_79_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_82_2 then
							local var_82_11 = Mathf.Lerp(iter_82_2.color.r, 1, var_82_10)

							iter_82_2.color = Color.New(var_82_11, var_82_11, var_82_11)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_8 + var_82_9 and arg_79_1.time_ < var_82_8 + var_82_9 + arg_82_0 and arg_79_1.var_.actorSpriteComps10062 then
				local var_82_12 = 1

				for iter_82_3, iter_82_4 in pairs(arg_79_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_82_4 then
						iter_82_4.color = Color.New(var_82_12, var_82_12, var_82_12)
					end
				end

				arg_79_1.var_.actorSpriteComps10062 = nil
			end

			local var_82_13 = 0
			local var_82_14 = 0.175

			if var_82_13 < arg_79_1.time_ and arg_79_1.time_ <= var_82_13 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_15 = arg_79_1:FormatText(StoryNameCfg[600].name)

				arg_79_1.leftNameTxt_.text = var_82_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_16 = arg_79_1:GetWordFromCfg(410242020)
				local var_82_17 = arg_79_1:FormatText(var_82_16.content)

				arg_79_1.text_.text = var_82_17

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_18 = 7
				local var_82_19 = utf8.len(var_82_17)
				local var_82_20 = var_82_18 <= 0 and var_82_14 or var_82_14 * (var_82_19 / var_82_18)

				if var_82_20 > 0 and var_82_14 < var_82_20 then
					arg_79_1.talkMaxDuration = var_82_20

					if var_82_20 + var_82_13 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_20 + var_82_13
					end
				end

				arg_79_1.text_.text = var_82_17
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242020", "story_v_out_410242.awb") ~= 0 then
					local var_82_21 = manager.audio:GetVoiceLength("story_v_out_410242", "410242020", "story_v_out_410242.awb") / 1000

					if var_82_21 + var_82_13 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_21 + var_82_13
					end

					if var_82_16.prefab_name ~= "" and arg_79_1.actors_[var_82_16.prefab_name] ~= nil then
						local var_82_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_16.prefab_name].transform, "story_v_out_410242", "410242020", "story_v_out_410242.awb")

						arg_79_1:RecordAudio("410242020", var_82_22)
						arg_79_1:RecordAudio("410242020", var_82_22)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_410242", "410242020", "story_v_out_410242.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_410242", "410242020", "story_v_out_410242.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_23 = math.max(var_82_14, arg_79_1.talkMaxDuration)

			if var_82_13 <= arg_79_1.time_ and arg_79_1.time_ < var_82_13 + var_82_23 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_13) / var_82_23

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_13 + var_82_23 and arg_79_1.time_ < var_82_13 + var_82_23 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play410242021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 410242021
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play410242022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["10062"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos10062 = var_86_0.localPosition
				var_86_0.localScale = Vector3.New(1, 1, 1)

				arg_83_1:CheckSpriteTmpPos("10062", 7)

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
				local var_86_6 = Vector3.New(0, -2000, -290)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos10062, var_86_6, var_86_5)
			end

			if arg_83_1.time_ >= var_86_1 + var_86_4 and arg_83_1.time_ < var_86_1 + var_86_4 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_86_7 = arg_83_1.actors_["10062"]
			local var_86_8 = 0

			if var_86_8 < arg_83_1.time_ and arg_83_1.time_ <= var_86_8 + arg_86_0 and arg_83_1.var_.actorSpriteComps10062 == nil then
				arg_83_1.var_.actorSpriteComps10062 = var_86_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_9 = 0.034

			if var_86_8 <= arg_83_1.time_ and arg_83_1.time_ < var_86_8 + var_86_9 then
				local var_86_10 = (arg_83_1.time_ - var_86_8) / var_86_9

				if arg_83_1.var_.actorSpriteComps10062 then
					for iter_86_1, iter_86_2 in pairs(arg_83_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_86_2 then
							local var_86_11 = Mathf.Lerp(iter_86_2.color.r, 0.5, var_86_10)

							iter_86_2.color = Color.New(var_86_11, var_86_11, var_86_11)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_8 + var_86_9 and arg_83_1.time_ < var_86_8 + var_86_9 + arg_86_0 and arg_83_1.var_.actorSpriteComps10062 then
				local var_86_12 = 0.5

				for iter_86_3, iter_86_4 in pairs(arg_83_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_86_4 then
						iter_86_4.color = Color.New(var_86_12, var_86_12, var_86_12)
					end
				end

				arg_83_1.var_.actorSpriteComps10062 = nil
			end

			local var_86_13 = 0
			local var_86_14 = 1.1

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, false)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_15 = arg_83_1:GetWordFromCfg(410242021)
				local var_86_16 = arg_83_1:FormatText(var_86_15.content)

				arg_83_1.text_.text = var_86_16

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_17 = 44
				local var_86_18 = utf8.len(var_86_16)
				local var_86_19 = var_86_17 <= 0 and var_86_14 or var_86_14 * (var_86_18 / var_86_17)

				if var_86_19 > 0 and var_86_14 < var_86_19 then
					arg_83_1.talkMaxDuration = var_86_19

					if var_86_19 + var_86_13 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_19 + var_86_13
					end
				end

				arg_83_1.text_.text = var_86_16
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_20 = math.max(var_86_14, arg_83_1.talkMaxDuration)

			if var_86_13 <= arg_83_1.time_ and arg_83_1.time_ < var_86_13 + var_86_20 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_13) / var_86_20

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_13 + var_86_20 and arg_83_1.time_ < var_86_13 + var_86_20 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play410242022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 410242022
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play410242023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 1.05

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, false)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_2 = arg_87_1:GetWordFromCfg(410242022)
				local var_90_3 = arg_87_1:FormatText(var_90_2.content)

				arg_87_1.text_.text = var_90_3

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_4 = 42
				local var_90_5 = utf8.len(var_90_3)
				local var_90_6 = var_90_4 <= 0 and var_90_1 or var_90_1 * (var_90_5 / var_90_4)

				if var_90_6 > 0 and var_90_1 < var_90_6 then
					arg_87_1.talkMaxDuration = var_90_6

					if var_90_6 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_6 + var_90_0
					end
				end

				arg_87_1.text_.text = var_90_3
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_7 = math.max(var_90_1, arg_87_1.talkMaxDuration)

			if var_90_0 <= arg_87_1.time_ and arg_87_1.time_ < var_90_0 + var_90_7 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_0) / var_90_7

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_0 + var_90_7 and arg_87_1.time_ < var_90_0 + var_90_7 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play410242023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 410242023
		arg_91_1.duration_ = 9.233

		local var_91_0 = {
			ja = 6.933,
			CriLanguages = 9.233,
			zh = 9.233
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
				arg_91_0:Play410242024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = "STblack"

			if arg_91_1.bgs_[var_94_0] == nil then
				local var_94_1 = Object.Instantiate(arg_91_1.paintGo_)

				var_94_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_94_0)
				var_94_1.name = var_94_0
				var_94_1.transform.parent = arg_91_1.stage_.transform
				var_94_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_91_1.bgs_[var_94_0] = var_94_1
			end

			local var_94_2 = 2

			if var_94_2 < arg_91_1.time_ and arg_91_1.time_ <= var_94_2 + arg_94_0 then
				local var_94_3 = manager.ui.mainCamera.transform.localPosition
				local var_94_4 = Vector3.New(0, 0, 10) + Vector3.New(var_94_3.x, var_94_3.y, 0)
				local var_94_5 = arg_91_1.bgs_.STblack

				var_94_5.transform.localPosition = var_94_4
				var_94_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_94_6 = var_94_5:GetComponent("SpriteRenderer")

				if var_94_6 and var_94_6.sprite then
					local var_94_7 = (var_94_5.transform.localPosition - var_94_3).z
					local var_94_8 = manager.ui.mainCameraCom_
					local var_94_9 = 2 * var_94_7 * Mathf.Tan(var_94_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_94_10 = var_94_9 * var_94_8.aspect
					local var_94_11 = var_94_6.sprite.bounds.size.x
					local var_94_12 = var_94_6.sprite.bounds.size.y
					local var_94_13 = var_94_10 / var_94_11
					local var_94_14 = var_94_9 / var_94_12
					local var_94_15 = var_94_14 < var_94_13 and var_94_13 or var_94_14

					var_94_5.transform.localScale = Vector3.New(var_94_15, var_94_15, 0)
				end

				for iter_94_0, iter_94_1 in pairs(arg_91_1.bgs_) do
					if iter_94_0 ~= "STblack" then
						iter_94_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_94_16 = 0

			if var_94_16 < arg_91_1.time_ and arg_91_1.time_ <= var_94_16 + arg_94_0 then
				arg_91_1.mask_.enabled = true
				arg_91_1.mask_.raycastTarget = true

				arg_91_1:SetGaussion(false)
			end

			local var_94_17 = 2

			if var_94_16 <= arg_91_1.time_ and arg_91_1.time_ < var_94_16 + var_94_17 then
				local var_94_18 = (arg_91_1.time_ - var_94_16) / var_94_17
				local var_94_19 = Color.New(0, 0, 0)

				var_94_19.a = Mathf.Lerp(0, 1, var_94_18)
				arg_91_1.mask_.color = var_94_19
			end

			if arg_91_1.time_ >= var_94_16 + var_94_17 and arg_91_1.time_ < var_94_16 + var_94_17 + arg_94_0 then
				local var_94_20 = Color.New(0, 0, 0)

				var_94_20.a = 1
				arg_91_1.mask_.color = var_94_20
			end

			local var_94_21 = 2

			if var_94_21 < arg_91_1.time_ and arg_91_1.time_ <= var_94_21 + arg_94_0 then
				arg_91_1.mask_.enabled = true
				arg_91_1.mask_.raycastTarget = true

				arg_91_1:SetGaussion(false)
			end

			local var_94_22 = 2

			if var_94_21 <= arg_91_1.time_ and arg_91_1.time_ < var_94_21 + var_94_22 then
				local var_94_23 = (arg_91_1.time_ - var_94_21) / var_94_22
				local var_94_24 = Color.New(0, 0, 0)

				var_94_24.a = Mathf.Lerp(1, 0, var_94_23)
				arg_91_1.mask_.color = var_94_24
			end

			if arg_91_1.time_ >= var_94_21 + var_94_22 and arg_91_1.time_ < var_94_21 + var_94_22 + arg_94_0 then
				local var_94_25 = Color.New(0, 0, 0)
				local var_94_26 = 0

				arg_91_1.mask_.enabled = false
				var_94_25.a = var_94_26
				arg_91_1.mask_.color = var_94_25
			end

			if arg_91_1.frameCnt_ <= 1 then
				arg_91_1.dialog_:SetActive(false)
			end

			local var_94_27 = 4
			local var_94_28 = 0.45

			if var_94_27 < arg_91_1.time_ and arg_91_1.time_ <= var_94_27 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0

				arg_91_1.dialog_:SetActive(true)

				local var_94_29 = LeanTween.value(arg_91_1.dialog_, 0, 1, 0.3)

				var_94_29:setOnUpdate(LuaHelper.FloatAction(function(arg_95_0)
					arg_91_1.dialogCg_.alpha = arg_95_0
				end))
				var_94_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_91_1.dialog_)
					var_94_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_91_1.duration_ = arg_91_1.duration_ + 0.3

				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_30 = arg_91_1:FormatText(StoryNameCfg[612].name)

				arg_91_1.leftNameTxt_.text = var_94_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, true)
				arg_91_1.iconController_:SetSelectedState("hero")

				arg_91_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1061")

				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_31 = arg_91_1:GetWordFromCfg(410242023)
				local var_94_32 = arg_91_1:FormatText(var_94_31.content)

				arg_91_1.text_.text = var_94_32

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_33 = 18
				local var_94_34 = utf8.len(var_94_32)
				local var_94_35 = var_94_33 <= 0 and var_94_28 or var_94_28 * (var_94_34 / var_94_33)

				if var_94_35 > 0 and var_94_28 < var_94_35 then
					arg_91_1.talkMaxDuration = var_94_35
					var_94_27 = var_94_27 + 0.3

					if var_94_35 + var_94_27 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_35 + var_94_27
					end
				end

				arg_91_1.text_.text = var_94_32
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242023", "story_v_out_410242.awb") ~= 0 then
					local var_94_36 = manager.audio:GetVoiceLength("story_v_out_410242", "410242023", "story_v_out_410242.awb") / 1000

					if var_94_36 + var_94_27 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_36 + var_94_27
					end

					if var_94_31.prefab_name ~= "" and arg_91_1.actors_[var_94_31.prefab_name] ~= nil then
						local var_94_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_31.prefab_name].transform, "story_v_out_410242", "410242023", "story_v_out_410242.awb")

						arg_91_1:RecordAudio("410242023", var_94_37)
						arg_91_1:RecordAudio("410242023", var_94_37)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_410242", "410242023", "story_v_out_410242.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_410242", "410242023", "story_v_out_410242.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_38 = var_94_27 + 0.3
			local var_94_39 = math.max(var_94_28, arg_91_1.talkMaxDuration)

			if var_94_38 <= arg_91_1.time_ and arg_91_1.time_ < var_94_38 + var_94_39 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_38) / var_94_39

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_38 + var_94_39 and arg_91_1.time_ < var_94_38 + var_94_39 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play410242024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 410242024
		arg_97_1.duration_ = 7

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play410242025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				local var_100_1 = manager.ui.mainCamera.transform.localPosition
				local var_100_2 = Vector3.New(0, 0, 10) + Vector3.New(var_100_1.x, var_100_1.y, 0)
				local var_100_3 = arg_97_1.bgs_.L04h

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
					if iter_100_0 ~= "L04h" then
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

			local var_100_15 = 2

			if var_100_14 <= arg_97_1.time_ and arg_97_1.time_ < var_100_14 + var_100_15 then
				local var_100_16 = (arg_97_1.time_ - var_100_14) / var_100_15
				local var_100_17 = Color.New(0, 0, 0)

				var_100_17.a = Mathf.Lerp(1, 0, var_100_16)
				arg_97_1.mask_.color = var_100_17
			end

			if arg_97_1.time_ >= var_100_14 + var_100_15 and arg_97_1.time_ < var_100_14 + var_100_15 + arg_100_0 then
				local var_100_18 = Color.New(0, 0, 0)
				local var_100_19 = 0

				arg_97_1.mask_.enabled = false
				var_100_18.a = var_100_19
				arg_97_1.mask_.color = var_100_18
			end

			if arg_97_1.frameCnt_ <= 1 then
				arg_97_1.dialog_:SetActive(false)
			end

			local var_100_20 = 2
			local var_100_21 = 0.85

			if var_100_20 < arg_97_1.time_ and arg_97_1.time_ <= var_100_20 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0

				arg_97_1.dialog_:SetActive(true)

				local var_100_22 = LeanTween.value(arg_97_1.dialog_, 0, 1, 0.3)

				var_100_22:setOnUpdate(LuaHelper.FloatAction(function(arg_101_0)
					arg_97_1.dialogCg_.alpha = arg_101_0
				end))
				var_100_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_97_1.dialog_)
					var_100_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_97_1.duration_ = arg_97_1.duration_ + 0.3

				SetActive(arg_97_1.leftNameGo_, false)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_23 = arg_97_1:GetWordFromCfg(410242024)
				local var_100_24 = arg_97_1:FormatText(var_100_23.content)

				arg_97_1.text_.text = var_100_24

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_25 = 34
				local var_100_26 = utf8.len(var_100_24)
				local var_100_27 = var_100_25 <= 0 and var_100_21 or var_100_21 * (var_100_26 / var_100_25)

				if var_100_27 > 0 and var_100_21 < var_100_27 then
					arg_97_1.talkMaxDuration = var_100_27
					var_100_20 = var_100_20 + 0.3

					if var_100_27 + var_100_20 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_27 + var_100_20
					end
				end

				arg_97_1.text_.text = var_100_24
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)
				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_28 = var_100_20 + 0.3
			local var_100_29 = math.max(var_100_21, arg_97_1.talkMaxDuration)

			if var_100_28 <= arg_97_1.time_ and arg_97_1.time_ < var_100_28 + var_100_29 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_28) / var_100_29

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_28 + var_100_29 and arg_97_1.time_ < var_100_28 + var_100_29 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play410242025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 410242025
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play410242026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 1

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, false)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_2 = arg_103_1:GetWordFromCfg(410242025)
				local var_106_3 = arg_103_1:FormatText(var_106_2.content)

				arg_103_1.text_.text = var_106_3

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_4 = 40
				local var_106_5 = utf8.len(var_106_3)
				local var_106_6 = var_106_4 <= 0 and var_106_1 or var_106_1 * (var_106_5 / var_106_4)

				if var_106_6 > 0 and var_106_1 < var_106_6 then
					arg_103_1.talkMaxDuration = var_106_6

					if var_106_6 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_6 + var_106_0
					end
				end

				arg_103_1.text_.text = var_106_3
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_7 = math.max(var_106_1, arg_103_1.talkMaxDuration)

			if var_106_0 <= arg_103_1.time_ and arg_103_1.time_ < var_106_0 + var_106_7 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_0) / var_106_7

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_0 + var_106_7 and arg_103_1.time_ < var_106_0 + var_106_7 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play410242026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 410242026
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play410242027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 1.075

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, false)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_2 = arg_107_1:GetWordFromCfg(410242026)
				local var_110_3 = arg_107_1:FormatText(var_110_2.content)

				arg_107_1.text_.text = var_110_3

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_4 = 43
				local var_110_5 = utf8.len(var_110_3)
				local var_110_6 = var_110_4 <= 0 and var_110_1 or var_110_1 * (var_110_5 / var_110_4)

				if var_110_6 > 0 and var_110_1 < var_110_6 then
					arg_107_1.talkMaxDuration = var_110_6

					if var_110_6 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_6 + var_110_0
					end
				end

				arg_107_1.text_.text = var_110_3
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_7 = math.max(var_110_1, arg_107_1.talkMaxDuration)

			if var_110_0 <= arg_107_1.time_ and arg_107_1.time_ < var_110_0 + var_110_7 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_0) / var_110_7

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_0 + var_110_7 and arg_107_1.time_ < var_110_0 + var_110_7 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play410242027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 410242027
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play410242028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 1.225

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, false)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_2 = arg_111_1:GetWordFromCfg(410242027)
				local var_114_3 = arg_111_1:FormatText(var_114_2.content)

				arg_111_1.text_.text = var_114_3

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_4 = 49
				local var_114_5 = utf8.len(var_114_3)
				local var_114_6 = var_114_4 <= 0 and var_114_1 or var_114_1 * (var_114_5 / var_114_4)

				if var_114_6 > 0 and var_114_1 < var_114_6 then
					arg_111_1.talkMaxDuration = var_114_6

					if var_114_6 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_6 + var_114_0
					end
				end

				arg_111_1.text_.text = var_114_3
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_7 = math.max(var_114_1, arg_111_1.talkMaxDuration)

			if var_114_0 <= arg_111_1.time_ and arg_111_1.time_ < var_114_0 + var_114_7 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_0) / var_114_7

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_0 + var_114_7 and arg_111_1.time_ < var_114_0 + var_114_7 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play410242028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 410242028
		arg_115_1.duration_ = 8.433

		local var_115_0 = {
			ja = 7.933,
			CriLanguages = 8.433,
			zh = 8.433
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
				arg_115_0:Play410242029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1061"].transform
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.var_.moveOldPos1061 = var_118_0.localPosition
				var_118_0.localScale = Vector3.New(1, 1, 1)

				arg_115_1:CheckSpriteTmpPos("1061", 3)

				local var_118_2 = var_118_0.childCount

				for iter_118_0 = 0, var_118_2 - 1 do
					local var_118_3 = var_118_0:GetChild(iter_118_0)

					if var_118_3.name == "" or not string.find(var_118_3.name, "split") then
						var_118_3.gameObject:SetActive(true)
					else
						var_118_3.gameObject:SetActive(false)
					end
				end
			end

			local var_118_4 = 0.001

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_4 then
				local var_118_5 = (arg_115_1.time_ - var_118_1) / var_118_4
				local var_118_6 = Vector3.New(0, -490, 18)

				var_118_0.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1061, var_118_6, var_118_5)
			end

			if arg_115_1.time_ >= var_118_1 + var_118_4 and arg_115_1.time_ < var_118_1 + var_118_4 + arg_118_0 then
				var_118_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_118_7 = arg_115_1.actors_["1061"]
			local var_118_8 = 0

			if var_118_8 < arg_115_1.time_ and arg_115_1.time_ <= var_118_8 + arg_118_0 and arg_115_1.var_.actorSpriteComps1061 == nil then
				arg_115_1.var_.actorSpriteComps1061 = var_118_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_9 = 0.034

			if var_118_8 <= arg_115_1.time_ and arg_115_1.time_ < var_118_8 + var_118_9 then
				local var_118_10 = (arg_115_1.time_ - var_118_8) / var_118_9

				if arg_115_1.var_.actorSpriteComps1061 then
					for iter_118_1, iter_118_2 in pairs(arg_115_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_118_2 then
							local var_118_11 = Mathf.Lerp(iter_118_2.color.r, 1, var_118_10)

							iter_118_2.color = Color.New(var_118_11, var_118_11, var_118_11)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_8 + var_118_9 and arg_115_1.time_ < var_118_8 + var_118_9 + arg_118_0 and arg_115_1.var_.actorSpriteComps1061 then
				local var_118_12 = 1

				for iter_118_3, iter_118_4 in pairs(arg_115_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_118_4 then
						iter_118_4.color = Color.New(var_118_12, var_118_12, var_118_12)
					end
				end

				arg_115_1.var_.actorSpriteComps1061 = nil
			end

			local var_118_13 = 0
			local var_118_14 = 1.15

			if var_118_13 < arg_115_1.time_ and arg_115_1.time_ <= var_118_13 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_15 = arg_115_1:FormatText(StoryNameCfg[612].name)

				arg_115_1.leftNameTxt_.text = var_118_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_16 = arg_115_1:GetWordFromCfg(410242028)
				local var_118_17 = arg_115_1:FormatText(var_118_16.content)

				arg_115_1.text_.text = var_118_17

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_18 = 46
				local var_118_19 = utf8.len(var_118_17)
				local var_118_20 = var_118_18 <= 0 and var_118_14 or var_118_14 * (var_118_19 / var_118_18)

				if var_118_20 > 0 and var_118_14 < var_118_20 then
					arg_115_1.talkMaxDuration = var_118_20

					if var_118_20 + var_118_13 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_20 + var_118_13
					end
				end

				arg_115_1.text_.text = var_118_17
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242028", "story_v_out_410242.awb") ~= 0 then
					local var_118_21 = manager.audio:GetVoiceLength("story_v_out_410242", "410242028", "story_v_out_410242.awb") / 1000

					if var_118_21 + var_118_13 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_21 + var_118_13
					end

					if var_118_16.prefab_name ~= "" and arg_115_1.actors_[var_118_16.prefab_name] ~= nil then
						local var_118_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_16.prefab_name].transform, "story_v_out_410242", "410242028", "story_v_out_410242.awb")

						arg_115_1:RecordAudio("410242028", var_118_22)
						arg_115_1:RecordAudio("410242028", var_118_22)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_410242", "410242028", "story_v_out_410242.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_410242", "410242028", "story_v_out_410242.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_23 = math.max(var_118_14, arg_115_1.talkMaxDuration)

			if var_118_13 <= arg_115_1.time_ and arg_115_1.time_ < var_118_13 + var_118_23 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_13) / var_118_23

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_13 + var_118_23 and arg_115_1.time_ < var_118_13 + var_118_23 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play410242029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 410242029
		arg_119_1.duration_ = 6.3

		local var_119_0 = {
			ja = 5.166,
			CriLanguages = 6.3,
			zh = 6.3
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
				arg_119_0:Play410242030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1061"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos1061 = var_122_0.localPosition
				var_122_0.localScale = Vector3.New(1, 1, 1)

				arg_119_1:CheckSpriteTmpPos("1061", 3)

				local var_122_2 = var_122_0.childCount

				for iter_122_0 = 0, var_122_2 - 1 do
					local var_122_3 = var_122_0:GetChild(iter_122_0)

					if var_122_3.name == "split_5" or not string.find(var_122_3.name, "split") then
						var_122_3.gameObject:SetActive(true)
					else
						var_122_3.gameObject:SetActive(false)
					end
				end
			end

			local var_122_4 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_4 then
				local var_122_5 = (arg_119_1.time_ - var_122_1) / var_122_4
				local var_122_6 = Vector3.New(0, -490, 18)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1061, var_122_6, var_122_5)
			end

			if arg_119_1.time_ >= var_122_1 + var_122_4 and arg_119_1.time_ < var_122_1 + var_122_4 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_122_7 = arg_119_1.actors_["1061"]
			local var_122_8 = 0

			if var_122_8 < arg_119_1.time_ and arg_119_1.time_ <= var_122_8 + arg_122_0 and arg_119_1.var_.actorSpriteComps1061 == nil then
				arg_119_1.var_.actorSpriteComps1061 = var_122_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_9 = 0.034

			if var_122_8 <= arg_119_1.time_ and arg_119_1.time_ < var_122_8 + var_122_9 then
				local var_122_10 = (arg_119_1.time_ - var_122_8) / var_122_9

				if arg_119_1.var_.actorSpriteComps1061 then
					for iter_122_1, iter_122_2 in pairs(arg_119_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_122_2 then
							local var_122_11 = Mathf.Lerp(iter_122_2.color.r, 1, var_122_10)

							iter_122_2.color = Color.New(var_122_11, var_122_11, var_122_11)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_8 + var_122_9 and arg_119_1.time_ < var_122_8 + var_122_9 + arg_122_0 and arg_119_1.var_.actorSpriteComps1061 then
				local var_122_12 = 1

				for iter_122_3, iter_122_4 in pairs(arg_119_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_122_4 then
						iter_122_4.color = Color.New(var_122_12, var_122_12, var_122_12)
					end
				end

				arg_119_1.var_.actorSpriteComps1061 = nil
			end

			local var_122_13 = 0
			local var_122_14 = 0.45

			if var_122_13 < arg_119_1.time_ and arg_119_1.time_ <= var_122_13 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_15 = arg_119_1:FormatText(StoryNameCfg[612].name)

				arg_119_1.leftNameTxt_.text = var_122_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_16 = arg_119_1:GetWordFromCfg(410242029)
				local var_122_17 = arg_119_1:FormatText(var_122_16.content)

				arg_119_1.text_.text = var_122_17

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_18 = 18
				local var_122_19 = utf8.len(var_122_17)
				local var_122_20 = var_122_18 <= 0 and var_122_14 or var_122_14 * (var_122_19 / var_122_18)

				if var_122_20 > 0 and var_122_14 < var_122_20 then
					arg_119_1.talkMaxDuration = var_122_20

					if var_122_20 + var_122_13 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_20 + var_122_13
					end
				end

				arg_119_1.text_.text = var_122_17
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242029", "story_v_out_410242.awb") ~= 0 then
					local var_122_21 = manager.audio:GetVoiceLength("story_v_out_410242", "410242029", "story_v_out_410242.awb") / 1000

					if var_122_21 + var_122_13 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_21 + var_122_13
					end

					if var_122_16.prefab_name ~= "" and arg_119_1.actors_[var_122_16.prefab_name] ~= nil then
						local var_122_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_16.prefab_name].transform, "story_v_out_410242", "410242029", "story_v_out_410242.awb")

						arg_119_1:RecordAudio("410242029", var_122_22)
						arg_119_1:RecordAudio("410242029", var_122_22)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_410242", "410242029", "story_v_out_410242.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_410242", "410242029", "story_v_out_410242.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_23 = math.max(var_122_14, arg_119_1.talkMaxDuration)

			if var_122_13 <= arg_119_1.time_ and arg_119_1.time_ < var_122_13 + var_122_23 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_13) / var_122_23

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_13 + var_122_23 and arg_119_1.time_ < var_122_13 + var_122_23 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play410242030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 410242030
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play410242031(arg_123_1)
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

			local var_126_7 = arg_123_1.actors_["1061"]
			local var_126_8 = 0

			if var_126_8 < arg_123_1.time_ and arg_123_1.time_ <= var_126_8 + arg_126_0 and arg_123_1.var_.actorSpriteComps1061 == nil then
				arg_123_1.var_.actorSpriteComps1061 = var_126_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_9 = 0.034

			if var_126_8 <= arg_123_1.time_ and arg_123_1.time_ < var_126_8 + var_126_9 then
				local var_126_10 = (arg_123_1.time_ - var_126_8) / var_126_9

				if arg_123_1.var_.actorSpriteComps1061 then
					for iter_126_1, iter_126_2 in pairs(arg_123_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_126_2 then
							local var_126_11 = Mathf.Lerp(iter_126_2.color.r, 0.5, var_126_10)

							iter_126_2.color = Color.New(var_126_11, var_126_11, var_126_11)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_8 + var_126_9 and arg_123_1.time_ < var_126_8 + var_126_9 + arg_126_0 and arg_123_1.var_.actorSpriteComps1061 then
				local var_126_12 = 0.5

				for iter_126_3, iter_126_4 in pairs(arg_123_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_126_4 then
						iter_126_4.color = Color.New(var_126_12, var_126_12, var_126_12)
					end
				end

				arg_123_1.var_.actorSpriteComps1061 = nil
			end

			local var_126_13 = 0
			local var_126_14 = 0.75

			if var_126_13 < arg_123_1.time_ and arg_123_1.time_ <= var_126_13 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, false)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_15 = arg_123_1:GetWordFromCfg(410242030)
				local var_126_16 = arg_123_1:FormatText(var_126_15.content)

				arg_123_1.text_.text = var_126_16

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_17 = 30
				local var_126_18 = utf8.len(var_126_16)
				local var_126_19 = var_126_17 <= 0 and var_126_14 or var_126_14 * (var_126_18 / var_126_17)

				if var_126_19 > 0 and var_126_14 < var_126_19 then
					arg_123_1.talkMaxDuration = var_126_19

					if var_126_19 + var_126_13 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_19 + var_126_13
					end
				end

				arg_123_1.text_.text = var_126_16
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_20 = math.max(var_126_14, arg_123_1.talkMaxDuration)

			if var_126_13 <= arg_123_1.time_ and arg_123_1.time_ < var_126_13 + var_126_20 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_13) / var_126_20

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_13 + var_126_20 and arg_123_1.time_ < var_126_13 + var_126_20 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play410242031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 410242031
		arg_127_1.duration_ = 3.4

		local var_127_0 = {
			ja = 3.4,
			CriLanguages = 2.366,
			zh = 2.366
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
				arg_127_0:Play410242032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["10062"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos10062 = var_130_0.localPosition
				var_130_0.localScale = Vector3.New(1, 1, 1)

				arg_127_1:CheckSpriteTmpPos("10062", 2)

				local var_130_2 = var_130_0.childCount

				for iter_130_0 = 0, var_130_2 - 1 do
					local var_130_3 = var_130_0:GetChild(iter_130_0)

					if var_130_3.name == "" or not string.find(var_130_3.name, "split") then
						var_130_3.gameObject:SetActive(true)
					else
						var_130_3.gameObject:SetActive(false)
					end
				end
			end

			local var_130_4 = 0.001

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_4 then
				local var_130_5 = (arg_127_1.time_ - var_130_1) / var_130_4
				local var_130_6 = Vector3.New(-370, -390, -290)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos10062, var_130_6, var_130_5)
			end

			if arg_127_1.time_ >= var_130_1 + var_130_4 and arg_127_1.time_ < var_130_1 + var_130_4 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(-370, -390, -290)
			end

			local var_130_7 = arg_127_1.actors_["1061"].transform
			local var_130_8 = 0

			if var_130_8 < arg_127_1.time_ and arg_127_1.time_ <= var_130_8 + arg_130_0 then
				arg_127_1.var_.moveOldPos1061 = var_130_7.localPosition
				var_130_7.localScale = Vector3.New(1, 1, 1)

				arg_127_1:CheckSpriteTmpPos("1061", 4)

				local var_130_9 = var_130_7.childCount

				for iter_130_1 = 0, var_130_9 - 1 do
					local var_130_10 = var_130_7:GetChild(iter_130_1)

					if var_130_10.name == "" or not string.find(var_130_10.name, "split") then
						var_130_10.gameObject:SetActive(true)
					else
						var_130_10.gameObject:SetActive(false)
					end
				end
			end

			local var_130_11 = 0.001

			if var_130_8 <= arg_127_1.time_ and arg_127_1.time_ < var_130_8 + var_130_11 then
				local var_130_12 = (arg_127_1.time_ - var_130_8) / var_130_11
				local var_130_13 = Vector3.New(390, -490, 18)

				var_130_7.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1061, var_130_13, var_130_12)
			end

			if arg_127_1.time_ >= var_130_8 + var_130_11 and arg_127_1.time_ < var_130_8 + var_130_11 + arg_130_0 then
				var_130_7.localPosition = Vector3.New(390, -490, 18)
			end

			local var_130_14 = arg_127_1.actors_["10062"]
			local var_130_15 = 0

			if var_130_15 < arg_127_1.time_ and arg_127_1.time_ <= var_130_15 + arg_130_0 and arg_127_1.var_.actorSpriteComps10062 == nil then
				arg_127_1.var_.actorSpriteComps10062 = var_130_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_130_16 = 0.034

			if var_130_15 <= arg_127_1.time_ and arg_127_1.time_ < var_130_15 + var_130_16 then
				local var_130_17 = (arg_127_1.time_ - var_130_15) / var_130_16

				if arg_127_1.var_.actorSpriteComps10062 then
					for iter_130_2, iter_130_3 in pairs(arg_127_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_130_3 then
							local var_130_18 = Mathf.Lerp(iter_130_3.color.r, 1, var_130_17)

							iter_130_3.color = Color.New(var_130_18, var_130_18, var_130_18)
						end
					end
				end
			end

			if arg_127_1.time_ >= var_130_15 + var_130_16 and arg_127_1.time_ < var_130_15 + var_130_16 + arg_130_0 and arg_127_1.var_.actorSpriteComps10062 then
				local var_130_19 = 1

				for iter_130_4, iter_130_5 in pairs(arg_127_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_130_5 then
						iter_130_5.color = Color.New(var_130_19, var_130_19, var_130_19)
					end
				end

				arg_127_1.var_.actorSpriteComps10062 = nil
			end

			local var_130_20 = arg_127_1.actors_["1061"]
			local var_130_21 = 0

			if var_130_21 < arg_127_1.time_ and arg_127_1.time_ <= var_130_21 + arg_130_0 and arg_127_1.var_.actorSpriteComps1061 == nil then
				arg_127_1.var_.actorSpriteComps1061 = var_130_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_130_22 = 0.034

			if var_130_21 <= arg_127_1.time_ and arg_127_1.time_ < var_130_21 + var_130_22 then
				local var_130_23 = (arg_127_1.time_ - var_130_21) / var_130_22

				if arg_127_1.var_.actorSpriteComps1061 then
					for iter_130_6, iter_130_7 in pairs(arg_127_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_130_7 then
							local var_130_24 = Mathf.Lerp(iter_130_7.color.r, 0.5, var_130_23)

							iter_130_7.color = Color.New(var_130_24, var_130_24, var_130_24)
						end
					end
				end
			end

			if arg_127_1.time_ >= var_130_21 + var_130_22 and arg_127_1.time_ < var_130_21 + var_130_22 + arg_130_0 and arg_127_1.var_.actorSpriteComps1061 then
				local var_130_25 = 0.5

				for iter_130_8, iter_130_9 in pairs(arg_127_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_130_9 then
						iter_130_9.color = Color.New(var_130_25, var_130_25, var_130_25)
					end
				end

				arg_127_1.var_.actorSpriteComps1061 = nil
			end

			local var_130_26 = 0
			local var_130_27 = 0.125

			if var_130_26 < arg_127_1.time_ and arg_127_1.time_ <= var_130_26 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_28 = arg_127_1:FormatText(StoryNameCfg[600].name)

				arg_127_1.leftNameTxt_.text = var_130_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_29 = arg_127_1:GetWordFromCfg(410242031)
				local var_130_30 = arg_127_1:FormatText(var_130_29.content)

				arg_127_1.text_.text = var_130_30

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_31 = 5
				local var_130_32 = utf8.len(var_130_30)
				local var_130_33 = var_130_31 <= 0 and var_130_27 or var_130_27 * (var_130_32 / var_130_31)

				if var_130_33 > 0 and var_130_27 < var_130_33 then
					arg_127_1.talkMaxDuration = var_130_33

					if var_130_33 + var_130_26 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_33 + var_130_26
					end
				end

				arg_127_1.text_.text = var_130_30
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242031", "story_v_out_410242.awb") ~= 0 then
					local var_130_34 = manager.audio:GetVoiceLength("story_v_out_410242", "410242031", "story_v_out_410242.awb") / 1000

					if var_130_34 + var_130_26 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_34 + var_130_26
					end

					if var_130_29.prefab_name ~= "" and arg_127_1.actors_[var_130_29.prefab_name] ~= nil then
						local var_130_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_29.prefab_name].transform, "story_v_out_410242", "410242031", "story_v_out_410242.awb")

						arg_127_1:RecordAudio("410242031", var_130_35)
						arg_127_1:RecordAudio("410242031", var_130_35)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_410242", "410242031", "story_v_out_410242.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_410242", "410242031", "story_v_out_410242.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_36 = math.max(var_130_27, arg_127_1.talkMaxDuration)

			if var_130_26 <= arg_127_1.time_ and arg_127_1.time_ < var_130_26 + var_130_36 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_26) / var_130_36

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_26 + var_130_36 and arg_127_1.time_ < var_130_26 + var_130_36 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play410242032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 410242032
		arg_131_1.duration_ = 7.5

		local var_131_0 = {
			ja = 7.5,
			CriLanguages = 3.7,
			zh = 3.7
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
				arg_131_0:Play410242033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 0.425

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_2 = arg_131_1:FormatText(StoryNameCfg[600].name)

				arg_131_1.leftNameTxt_.text = var_134_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_3 = arg_131_1:GetWordFromCfg(410242032)
				local var_134_4 = arg_131_1:FormatText(var_134_3.content)

				arg_131_1.text_.text = var_134_4

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242032", "story_v_out_410242.awb") ~= 0 then
					local var_134_8 = manager.audio:GetVoiceLength("story_v_out_410242", "410242032", "story_v_out_410242.awb") / 1000

					if var_134_8 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_8 + var_134_0
					end

					if var_134_3.prefab_name ~= "" and arg_131_1.actors_[var_134_3.prefab_name] ~= nil then
						local var_134_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_3.prefab_name].transform, "story_v_out_410242", "410242032", "story_v_out_410242.awb")

						arg_131_1:RecordAudio("410242032", var_134_9)
						arg_131_1:RecordAudio("410242032", var_134_9)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_410242", "410242032", "story_v_out_410242.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_410242", "410242032", "story_v_out_410242.awb")
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
	Play410242033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 410242033
		arg_135_1.duration_ = 6.033

		local var_135_0 = {
			ja = 6.033,
			CriLanguages = 1.666,
			zh = 1.666
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
				arg_135_0:Play410242034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1061"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos1061 = var_138_0.localPosition
				var_138_0.localScale = Vector3.New(1, 1, 1)

				arg_135_1:CheckSpriteTmpPos("1061", 4)

				local var_138_2 = var_138_0.childCount

				for iter_138_0 = 0, var_138_2 - 1 do
					local var_138_3 = var_138_0:GetChild(iter_138_0)

					if var_138_3.name == "" or not string.find(var_138_3.name, "split") then
						var_138_3.gameObject:SetActive(true)
					else
						var_138_3.gameObject:SetActive(false)
					end
				end
			end

			local var_138_4 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_4 then
				local var_138_5 = (arg_135_1.time_ - var_138_1) / var_138_4
				local var_138_6 = Vector3.New(390, -490, 18)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1061, var_138_6, var_138_5)
			end

			if arg_135_1.time_ >= var_138_1 + var_138_4 and arg_135_1.time_ < var_138_1 + var_138_4 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(390, -490, 18)
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

			local var_138_13 = arg_135_1.actors_["10062"]
			local var_138_14 = 0

			if var_138_14 < arg_135_1.time_ and arg_135_1.time_ <= var_138_14 + arg_138_0 and arg_135_1.var_.actorSpriteComps10062 == nil then
				arg_135_1.var_.actorSpriteComps10062 = var_138_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_138_15 = 0.034

			if var_138_14 <= arg_135_1.time_ and arg_135_1.time_ < var_138_14 + var_138_15 then
				local var_138_16 = (arg_135_1.time_ - var_138_14) / var_138_15

				if arg_135_1.var_.actorSpriteComps10062 then
					for iter_138_5, iter_138_6 in pairs(arg_135_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_138_6 then
							local var_138_17 = Mathf.Lerp(iter_138_6.color.r, 0.5, var_138_16)

							iter_138_6.color = Color.New(var_138_17, var_138_17, var_138_17)
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_14 + var_138_15 and arg_135_1.time_ < var_138_14 + var_138_15 + arg_138_0 and arg_135_1.var_.actorSpriteComps10062 then
				local var_138_18 = 0.5

				for iter_138_7, iter_138_8 in pairs(arg_135_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_138_8 then
						iter_138_8.color = Color.New(var_138_18, var_138_18, var_138_18)
					end
				end

				arg_135_1.var_.actorSpriteComps10062 = nil
			end

			local var_138_19 = 0
			local var_138_20 = 0.2

			if var_138_19 < arg_135_1.time_ and arg_135_1.time_ <= var_138_19 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_21 = arg_135_1:FormatText(StoryNameCfg[612].name)

				arg_135_1.leftNameTxt_.text = var_138_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_22 = arg_135_1:GetWordFromCfg(410242033)
				local var_138_23 = arg_135_1:FormatText(var_138_22.content)

				arg_135_1.text_.text = var_138_23

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_24 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242033", "story_v_out_410242.awb") ~= 0 then
					local var_138_27 = manager.audio:GetVoiceLength("story_v_out_410242", "410242033", "story_v_out_410242.awb") / 1000

					if var_138_27 + var_138_19 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_27 + var_138_19
					end

					if var_138_22.prefab_name ~= "" and arg_135_1.actors_[var_138_22.prefab_name] ~= nil then
						local var_138_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_22.prefab_name].transform, "story_v_out_410242", "410242033", "story_v_out_410242.awb")

						arg_135_1:RecordAudio("410242033", var_138_28)
						arg_135_1:RecordAudio("410242033", var_138_28)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_410242", "410242033", "story_v_out_410242.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_410242", "410242033", "story_v_out_410242.awb")
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
	Play410242034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 410242034
		arg_139_1.duration_ = 8.9

		local var_139_0 = {
			ja = 8.9,
			CriLanguages = 5.766,
			zh = 5.766
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
				arg_139_0:Play410242035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["10062"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos10062 = var_142_0.localPosition
				var_142_0.localScale = Vector3.New(1, 1, 1)

				arg_139_1:CheckSpriteTmpPos("10062", 2)

				local var_142_2 = var_142_0.childCount

				for iter_142_0 = 0, var_142_2 - 1 do
					local var_142_3 = var_142_0:GetChild(iter_142_0)

					if var_142_3.name == "" or not string.find(var_142_3.name, "split") then
						var_142_3.gameObject:SetActive(true)
					else
						var_142_3.gameObject:SetActive(false)
					end
				end
			end

			local var_142_4 = 0.001

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_4 then
				local var_142_5 = (arg_139_1.time_ - var_142_1) / var_142_4
				local var_142_6 = Vector3.New(-370, -390, -290)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos10062, var_142_6, var_142_5)
			end

			if arg_139_1.time_ >= var_142_1 + var_142_4 and arg_139_1.time_ < var_142_1 + var_142_4 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(-370, -390, -290)
			end

			local var_142_7 = arg_139_1.actors_["10062"]
			local var_142_8 = 0

			if var_142_8 < arg_139_1.time_ and arg_139_1.time_ <= var_142_8 + arg_142_0 and arg_139_1.var_.actorSpriteComps10062 == nil then
				arg_139_1.var_.actorSpriteComps10062 = var_142_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_142_9 = 0.034

			if var_142_8 <= arg_139_1.time_ and arg_139_1.time_ < var_142_8 + var_142_9 then
				local var_142_10 = (arg_139_1.time_ - var_142_8) / var_142_9

				if arg_139_1.var_.actorSpriteComps10062 then
					for iter_142_1, iter_142_2 in pairs(arg_139_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_142_2 then
							local var_142_11 = Mathf.Lerp(iter_142_2.color.r, 1, var_142_10)

							iter_142_2.color = Color.New(var_142_11, var_142_11, var_142_11)
						end
					end
				end
			end

			if arg_139_1.time_ >= var_142_8 + var_142_9 and arg_139_1.time_ < var_142_8 + var_142_9 + arg_142_0 and arg_139_1.var_.actorSpriteComps10062 then
				local var_142_12 = 1

				for iter_142_3, iter_142_4 in pairs(arg_139_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_142_4 then
						iter_142_4.color = Color.New(var_142_12, var_142_12, var_142_12)
					end
				end

				arg_139_1.var_.actorSpriteComps10062 = nil
			end

			local var_142_13 = arg_139_1.actors_["1061"]
			local var_142_14 = 0

			if var_142_14 < arg_139_1.time_ and arg_139_1.time_ <= var_142_14 + arg_142_0 and arg_139_1.var_.actorSpriteComps1061 == nil then
				arg_139_1.var_.actorSpriteComps1061 = var_142_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_142_15 = 0.034

			if var_142_14 <= arg_139_1.time_ and arg_139_1.time_ < var_142_14 + var_142_15 then
				local var_142_16 = (arg_139_1.time_ - var_142_14) / var_142_15

				if arg_139_1.var_.actorSpriteComps1061 then
					for iter_142_5, iter_142_6 in pairs(arg_139_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_142_6 then
							local var_142_17 = Mathf.Lerp(iter_142_6.color.r, 0.5, var_142_16)

							iter_142_6.color = Color.New(var_142_17, var_142_17, var_142_17)
						end
					end
				end
			end

			if arg_139_1.time_ >= var_142_14 + var_142_15 and arg_139_1.time_ < var_142_14 + var_142_15 + arg_142_0 and arg_139_1.var_.actorSpriteComps1061 then
				local var_142_18 = 0.5

				for iter_142_7, iter_142_8 in pairs(arg_139_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_142_8 then
						iter_142_8.color = Color.New(var_142_18, var_142_18, var_142_18)
					end
				end

				arg_139_1.var_.actorSpriteComps1061 = nil
			end

			local var_142_19 = 0
			local var_142_20 = 0.525

			if var_142_19 < arg_139_1.time_ and arg_139_1.time_ <= var_142_19 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_21 = arg_139_1:FormatText(StoryNameCfg[600].name)

				arg_139_1.leftNameTxt_.text = var_142_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_22 = arg_139_1:GetWordFromCfg(410242034)
				local var_142_23 = arg_139_1:FormatText(var_142_22.content)

				arg_139_1.text_.text = var_142_23

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_24 = 21
				local var_142_25 = utf8.len(var_142_23)
				local var_142_26 = var_142_24 <= 0 and var_142_20 or var_142_20 * (var_142_25 / var_142_24)

				if var_142_26 > 0 and var_142_20 < var_142_26 then
					arg_139_1.talkMaxDuration = var_142_26

					if var_142_26 + var_142_19 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_26 + var_142_19
					end
				end

				arg_139_1.text_.text = var_142_23
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242034", "story_v_out_410242.awb") ~= 0 then
					local var_142_27 = manager.audio:GetVoiceLength("story_v_out_410242", "410242034", "story_v_out_410242.awb") / 1000

					if var_142_27 + var_142_19 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_27 + var_142_19
					end

					if var_142_22.prefab_name ~= "" and arg_139_1.actors_[var_142_22.prefab_name] ~= nil then
						local var_142_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_22.prefab_name].transform, "story_v_out_410242", "410242034", "story_v_out_410242.awb")

						arg_139_1:RecordAudio("410242034", var_142_28)
						arg_139_1:RecordAudio("410242034", var_142_28)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_410242", "410242034", "story_v_out_410242.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_410242", "410242034", "story_v_out_410242.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_29 = math.max(var_142_20, arg_139_1.talkMaxDuration)

			if var_142_19 <= arg_139_1.time_ and arg_139_1.time_ < var_142_19 + var_142_29 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_19) / var_142_29

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_19 + var_142_29 and arg_139_1.time_ < var_142_19 + var_142_29 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play410242035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 410242035
		arg_143_1.duration_ = 12

		local var_143_0 = {
			ja = 12,
			CriLanguages = 5.766,
			zh = 5.766
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
				arg_143_0:Play410242036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1061"].transform
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.var_.moveOldPos1061 = var_146_0.localPosition
				var_146_0.localScale = Vector3.New(1, 1, 1)

				arg_143_1:CheckSpriteTmpPos("1061", 4)

				local var_146_2 = var_146_0.childCount

				for iter_146_0 = 0, var_146_2 - 1 do
					local var_146_3 = var_146_0:GetChild(iter_146_0)

					if var_146_3.name == "split_5" or not string.find(var_146_3.name, "split") then
						var_146_3.gameObject:SetActive(true)
					else
						var_146_3.gameObject:SetActive(false)
					end
				end
			end

			local var_146_4 = 0.001

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_4 then
				local var_146_5 = (arg_143_1.time_ - var_146_1) / var_146_4
				local var_146_6 = Vector3.New(390, -490, 18)

				var_146_0.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1061, var_146_6, var_146_5)
			end

			if arg_143_1.time_ >= var_146_1 + var_146_4 and arg_143_1.time_ < var_146_1 + var_146_4 + arg_146_0 then
				var_146_0.localPosition = Vector3.New(390, -490, 18)
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

			local var_146_13 = arg_143_1.actors_["10062"]
			local var_146_14 = 0

			if var_146_14 < arg_143_1.time_ and arg_143_1.time_ <= var_146_14 + arg_146_0 and arg_143_1.var_.actorSpriteComps10062 == nil then
				arg_143_1.var_.actorSpriteComps10062 = var_146_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_146_15 = 0.034

			if var_146_14 <= arg_143_1.time_ and arg_143_1.time_ < var_146_14 + var_146_15 then
				local var_146_16 = (arg_143_1.time_ - var_146_14) / var_146_15

				if arg_143_1.var_.actorSpriteComps10062 then
					for iter_146_5, iter_146_6 in pairs(arg_143_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_146_6 then
							local var_146_17 = Mathf.Lerp(iter_146_6.color.r, 0.5, var_146_16)

							iter_146_6.color = Color.New(var_146_17, var_146_17, var_146_17)
						end
					end
				end
			end

			if arg_143_1.time_ >= var_146_14 + var_146_15 and arg_143_1.time_ < var_146_14 + var_146_15 + arg_146_0 and arg_143_1.var_.actorSpriteComps10062 then
				local var_146_18 = 0.5

				for iter_146_7, iter_146_8 in pairs(arg_143_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_146_8 then
						iter_146_8.color = Color.New(var_146_18, var_146_18, var_146_18)
					end
				end

				arg_143_1.var_.actorSpriteComps10062 = nil
			end

			local var_146_19 = 0
			local var_146_20 = 0.525

			if var_146_19 < arg_143_1.time_ and arg_143_1.time_ <= var_146_19 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_21 = arg_143_1:FormatText(StoryNameCfg[612].name)

				arg_143_1.leftNameTxt_.text = var_146_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_22 = arg_143_1:GetWordFromCfg(410242035)
				local var_146_23 = arg_143_1:FormatText(var_146_22.content)

				arg_143_1.text_.text = var_146_23

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_24 = 21
				local var_146_25 = utf8.len(var_146_23)
				local var_146_26 = var_146_24 <= 0 and var_146_20 or var_146_20 * (var_146_25 / var_146_24)

				if var_146_26 > 0 and var_146_20 < var_146_26 then
					arg_143_1.talkMaxDuration = var_146_26

					if var_146_26 + var_146_19 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_26 + var_146_19
					end
				end

				arg_143_1.text_.text = var_146_23
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242035", "story_v_out_410242.awb") ~= 0 then
					local var_146_27 = manager.audio:GetVoiceLength("story_v_out_410242", "410242035", "story_v_out_410242.awb") / 1000

					if var_146_27 + var_146_19 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_27 + var_146_19
					end

					if var_146_22.prefab_name ~= "" and arg_143_1.actors_[var_146_22.prefab_name] ~= nil then
						local var_146_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_22.prefab_name].transform, "story_v_out_410242", "410242035", "story_v_out_410242.awb")

						arg_143_1:RecordAudio("410242035", var_146_28)
						arg_143_1:RecordAudio("410242035", var_146_28)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_410242", "410242035", "story_v_out_410242.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_410242", "410242035", "story_v_out_410242.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_29 = math.max(var_146_20, arg_143_1.talkMaxDuration)

			if var_146_19 <= arg_143_1.time_ and arg_143_1.time_ < var_146_19 + var_146_29 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_19) / var_146_29

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_19 + var_146_29 and arg_143_1.time_ < var_146_19 + var_146_29 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play410242036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 410242036
		arg_147_1.duration_ = 3.8

		local var_147_0 = {
			ja = 3.8,
			CriLanguages = 1.733,
			zh = 1.733
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
				arg_147_0:Play410242037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["10062"].transform
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1.var_.moveOldPos10062 = var_150_0.localPosition
				var_150_0.localScale = Vector3.New(1, 1, 1)

				arg_147_1:CheckSpriteTmpPos("10062", 2)

				local var_150_2 = var_150_0.childCount

				for iter_150_0 = 0, var_150_2 - 1 do
					local var_150_3 = var_150_0:GetChild(iter_150_0)

					if var_150_3.name == "" or not string.find(var_150_3.name, "split") then
						var_150_3.gameObject:SetActive(true)
					else
						var_150_3.gameObject:SetActive(false)
					end
				end
			end

			local var_150_4 = 0.001

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_4 then
				local var_150_5 = (arg_147_1.time_ - var_150_1) / var_150_4
				local var_150_6 = Vector3.New(-370, -390, -290)

				var_150_0.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos10062, var_150_6, var_150_5)
			end

			if arg_147_1.time_ >= var_150_1 + var_150_4 and arg_147_1.time_ < var_150_1 + var_150_4 + arg_150_0 then
				var_150_0.localPosition = Vector3.New(-370, -390, -290)
			end

			local var_150_7 = arg_147_1.actors_["10062"]
			local var_150_8 = 0

			if var_150_8 < arg_147_1.time_ and arg_147_1.time_ <= var_150_8 + arg_150_0 and arg_147_1.var_.actorSpriteComps10062 == nil then
				arg_147_1.var_.actorSpriteComps10062 = var_150_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_150_9 = 0.034

			if var_150_8 <= arg_147_1.time_ and arg_147_1.time_ < var_150_8 + var_150_9 then
				local var_150_10 = (arg_147_1.time_ - var_150_8) / var_150_9

				if arg_147_1.var_.actorSpriteComps10062 then
					for iter_150_1, iter_150_2 in pairs(arg_147_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_150_2 then
							local var_150_11 = Mathf.Lerp(iter_150_2.color.r, 1, var_150_10)

							iter_150_2.color = Color.New(var_150_11, var_150_11, var_150_11)
						end
					end
				end
			end

			if arg_147_1.time_ >= var_150_8 + var_150_9 and arg_147_1.time_ < var_150_8 + var_150_9 + arg_150_0 and arg_147_1.var_.actorSpriteComps10062 then
				local var_150_12 = 1

				for iter_150_3, iter_150_4 in pairs(arg_147_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_150_4 then
						iter_150_4.color = Color.New(var_150_12, var_150_12, var_150_12)
					end
				end

				arg_147_1.var_.actorSpriteComps10062 = nil
			end

			local var_150_13 = arg_147_1.actors_["1061"]
			local var_150_14 = 0

			if var_150_14 < arg_147_1.time_ and arg_147_1.time_ <= var_150_14 + arg_150_0 and arg_147_1.var_.actorSpriteComps1061 == nil then
				arg_147_1.var_.actorSpriteComps1061 = var_150_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_150_15 = 0.034

			if var_150_14 <= arg_147_1.time_ and arg_147_1.time_ < var_150_14 + var_150_15 then
				local var_150_16 = (arg_147_1.time_ - var_150_14) / var_150_15

				if arg_147_1.var_.actorSpriteComps1061 then
					for iter_150_5, iter_150_6 in pairs(arg_147_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_150_6 then
							local var_150_17 = Mathf.Lerp(iter_150_6.color.r, 0.5, var_150_16)

							iter_150_6.color = Color.New(var_150_17, var_150_17, var_150_17)
						end
					end
				end
			end

			if arg_147_1.time_ >= var_150_14 + var_150_15 and arg_147_1.time_ < var_150_14 + var_150_15 + arg_150_0 and arg_147_1.var_.actorSpriteComps1061 then
				local var_150_18 = 0.5

				for iter_150_7, iter_150_8 in pairs(arg_147_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_150_8 then
						iter_150_8.color = Color.New(var_150_18, var_150_18, var_150_18)
					end
				end

				arg_147_1.var_.actorSpriteComps1061 = nil
			end

			local var_150_19 = 0
			local var_150_20 = 0.075

			if var_150_19 < arg_147_1.time_ and arg_147_1.time_ <= var_150_19 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_21 = arg_147_1:FormatText(StoryNameCfg[600].name)

				arg_147_1.leftNameTxt_.text = var_150_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_22 = arg_147_1:GetWordFromCfg(410242036)
				local var_150_23 = arg_147_1:FormatText(var_150_22.content)

				arg_147_1.text_.text = var_150_23

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_24 = 3
				local var_150_25 = utf8.len(var_150_23)
				local var_150_26 = var_150_24 <= 0 and var_150_20 or var_150_20 * (var_150_25 / var_150_24)

				if var_150_26 > 0 and var_150_20 < var_150_26 then
					arg_147_1.talkMaxDuration = var_150_26

					if var_150_26 + var_150_19 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_26 + var_150_19
					end
				end

				arg_147_1.text_.text = var_150_23
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242036", "story_v_out_410242.awb") ~= 0 then
					local var_150_27 = manager.audio:GetVoiceLength("story_v_out_410242", "410242036", "story_v_out_410242.awb") / 1000

					if var_150_27 + var_150_19 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_27 + var_150_19
					end

					if var_150_22.prefab_name ~= "" and arg_147_1.actors_[var_150_22.prefab_name] ~= nil then
						local var_150_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_22.prefab_name].transform, "story_v_out_410242", "410242036", "story_v_out_410242.awb")

						arg_147_1:RecordAudio("410242036", var_150_28)
						arg_147_1:RecordAudio("410242036", var_150_28)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_410242", "410242036", "story_v_out_410242.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_410242", "410242036", "story_v_out_410242.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_29 = math.max(var_150_20, arg_147_1.talkMaxDuration)

			if var_150_19 <= arg_147_1.time_ and arg_147_1.time_ < var_150_19 + var_150_29 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_19) / var_150_29

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_19 + var_150_29 and arg_147_1.time_ < var_150_19 + var_150_29 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play410242037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 410242037
		arg_151_1.duration_ = 5

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play410242038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["10062"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.actorSpriteComps10062 == nil then
				arg_151_1.var_.actorSpriteComps10062 = var_154_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_2 = 0.034

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.actorSpriteComps10062 then
					for iter_154_0, iter_154_1 in pairs(arg_151_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_154_1 then
							local var_154_4 = Mathf.Lerp(iter_154_1.color.r, 0.5, var_154_3)

							iter_154_1.color = Color.New(var_154_4, var_154_4, var_154_4)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.actorSpriteComps10062 then
				local var_154_5 = 0.5

				for iter_154_2, iter_154_3 in pairs(arg_151_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_154_3 then
						iter_154_3.color = Color.New(var_154_5, var_154_5, var_154_5)
					end
				end

				arg_151_1.var_.actorSpriteComps10062 = nil
			end

			local var_154_6 = 0
			local var_154_7 = 0.8

			if var_154_6 < arg_151_1.time_ and arg_151_1.time_ <= var_154_6 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, false)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_8 = arg_151_1:GetWordFromCfg(410242037)
				local var_154_9 = arg_151_1:FormatText(var_154_8.content)

				arg_151_1.text_.text = var_154_9

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_10 = 32
				local var_154_11 = utf8.len(var_154_9)
				local var_154_12 = var_154_10 <= 0 and var_154_7 or var_154_7 * (var_154_11 / var_154_10)

				if var_154_12 > 0 and var_154_7 < var_154_12 then
					arg_151_1.talkMaxDuration = var_154_12

					if var_154_12 + var_154_6 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_12 + var_154_6
					end
				end

				arg_151_1.text_.text = var_154_9
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)
				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_13 = math.max(var_154_7, arg_151_1.talkMaxDuration)

			if var_154_6 <= arg_151_1.time_ and arg_151_1.time_ < var_154_6 + var_154_13 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_6) / var_154_13

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_6 + var_154_13 and arg_151_1.time_ < var_154_6 + var_154_13 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play410242038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 410242038
		arg_155_1.duration_ = 22.533

		local var_155_0 = {
			ja = 22.533,
			CriLanguages = 10.9,
			zh = 10.9
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
				arg_155_0:Play410242039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["10062"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos10062 = var_158_0.localPosition
				var_158_0.localScale = Vector3.New(1, 1, 1)

				arg_155_1:CheckSpriteTmpPos("10062", 2)

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
				local var_158_6 = Vector3.New(-370, -390, -290)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos10062, var_158_6, var_158_5)
			end

			if arg_155_1.time_ >= var_158_1 + var_158_4 and arg_155_1.time_ < var_158_1 + var_158_4 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(-370, -390, -290)
			end

			local var_158_7 = arg_155_1.actors_["10062"]
			local var_158_8 = 0

			if var_158_8 < arg_155_1.time_ and arg_155_1.time_ <= var_158_8 + arg_158_0 and arg_155_1.var_.actorSpriteComps10062 == nil then
				arg_155_1.var_.actorSpriteComps10062 = var_158_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_9 = 0.034

			if var_158_8 <= arg_155_1.time_ and arg_155_1.time_ < var_158_8 + var_158_9 then
				local var_158_10 = (arg_155_1.time_ - var_158_8) / var_158_9

				if arg_155_1.var_.actorSpriteComps10062 then
					for iter_158_1, iter_158_2 in pairs(arg_155_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_158_2 then
							local var_158_11 = Mathf.Lerp(iter_158_2.color.r, 1, var_158_10)

							iter_158_2.color = Color.New(var_158_11, var_158_11, var_158_11)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_8 + var_158_9 and arg_155_1.time_ < var_158_8 + var_158_9 + arg_158_0 and arg_155_1.var_.actorSpriteComps10062 then
				local var_158_12 = 1

				for iter_158_3, iter_158_4 in pairs(arg_155_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_158_4 then
						iter_158_4.color = Color.New(var_158_12, var_158_12, var_158_12)
					end
				end

				arg_155_1.var_.actorSpriteComps10062 = nil
			end

			local var_158_13 = 0
			local var_158_14 = 1.025

			if var_158_13 < arg_155_1.time_ and arg_155_1.time_ <= var_158_13 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_15 = arg_155_1:FormatText(StoryNameCfg[600].name)

				arg_155_1.leftNameTxt_.text = var_158_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_16 = arg_155_1:GetWordFromCfg(410242038)
				local var_158_17 = arg_155_1:FormatText(var_158_16.content)

				arg_155_1.text_.text = var_158_17

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_18 = 41
				local var_158_19 = utf8.len(var_158_17)
				local var_158_20 = var_158_18 <= 0 and var_158_14 or var_158_14 * (var_158_19 / var_158_18)

				if var_158_20 > 0 and var_158_14 < var_158_20 then
					arg_155_1.talkMaxDuration = var_158_20

					if var_158_20 + var_158_13 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_20 + var_158_13
					end
				end

				arg_155_1.text_.text = var_158_17
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242038", "story_v_out_410242.awb") ~= 0 then
					local var_158_21 = manager.audio:GetVoiceLength("story_v_out_410242", "410242038", "story_v_out_410242.awb") / 1000

					if var_158_21 + var_158_13 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_21 + var_158_13
					end

					if var_158_16.prefab_name ~= "" and arg_155_1.actors_[var_158_16.prefab_name] ~= nil then
						local var_158_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_16.prefab_name].transform, "story_v_out_410242", "410242038", "story_v_out_410242.awb")

						arg_155_1:RecordAudio("410242038", var_158_22)
						arg_155_1:RecordAudio("410242038", var_158_22)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_410242", "410242038", "story_v_out_410242.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_410242", "410242038", "story_v_out_410242.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_23 = math.max(var_158_14, arg_155_1.talkMaxDuration)

			if var_158_13 <= arg_155_1.time_ and arg_155_1.time_ < var_158_13 + var_158_23 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_13) / var_158_23

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_13 + var_158_23 and arg_155_1.time_ < var_158_13 + var_158_23 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play410242039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 410242039
		arg_159_1.duration_ = 11

		local var_159_0 = {
			ja = 11,
			CriLanguages = 6.5,
			zh = 6.5
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
				arg_159_0:Play410242040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["10062"].transform
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1.var_.moveOldPos10062 = var_162_0.localPosition
				var_162_0.localScale = Vector3.New(1, 1, 1)

				arg_159_1:CheckSpriteTmpPos("10062", 2)

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
				local var_162_6 = Vector3.New(-370, -390, -290)

				var_162_0.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos10062, var_162_6, var_162_5)
			end

			if arg_159_1.time_ >= var_162_1 + var_162_4 and arg_159_1.time_ < var_162_1 + var_162_4 + arg_162_0 then
				var_162_0.localPosition = Vector3.New(-370, -390, -290)
			end

			local var_162_7 = arg_159_1.actors_["10062"]
			local var_162_8 = 0

			if var_162_8 < arg_159_1.time_ and arg_159_1.time_ <= var_162_8 + arg_162_0 and arg_159_1.var_.actorSpriteComps10062 == nil then
				arg_159_1.var_.actorSpriteComps10062 = var_162_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_162_9 = 0.034

			if var_162_8 <= arg_159_1.time_ and arg_159_1.time_ < var_162_8 + var_162_9 then
				local var_162_10 = (arg_159_1.time_ - var_162_8) / var_162_9

				if arg_159_1.var_.actorSpriteComps10062 then
					for iter_162_1, iter_162_2 in pairs(arg_159_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_162_2 then
							local var_162_11 = Mathf.Lerp(iter_162_2.color.r, 1, var_162_10)

							iter_162_2.color = Color.New(var_162_11, var_162_11, var_162_11)
						end
					end
				end
			end

			if arg_159_1.time_ >= var_162_8 + var_162_9 and arg_159_1.time_ < var_162_8 + var_162_9 + arg_162_0 and arg_159_1.var_.actorSpriteComps10062 then
				local var_162_12 = 1

				for iter_162_3, iter_162_4 in pairs(arg_159_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_162_4 then
						iter_162_4.color = Color.New(var_162_12, var_162_12, var_162_12)
					end
				end

				arg_159_1.var_.actorSpriteComps10062 = nil
			end

			local var_162_13 = 0
			local var_162_14 = 0.7

			if var_162_13 < arg_159_1.time_ and arg_159_1.time_ <= var_162_13 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_15 = arg_159_1:FormatText(StoryNameCfg[600].name)

				arg_159_1.leftNameTxt_.text = var_162_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_16 = arg_159_1:GetWordFromCfg(410242039)
				local var_162_17 = arg_159_1:FormatText(var_162_16.content)

				arg_159_1.text_.text = var_162_17

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_18 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242039", "story_v_out_410242.awb") ~= 0 then
					local var_162_21 = manager.audio:GetVoiceLength("story_v_out_410242", "410242039", "story_v_out_410242.awb") / 1000

					if var_162_21 + var_162_13 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_21 + var_162_13
					end

					if var_162_16.prefab_name ~= "" and arg_159_1.actors_[var_162_16.prefab_name] ~= nil then
						local var_162_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_16.prefab_name].transform, "story_v_out_410242", "410242039", "story_v_out_410242.awb")

						arg_159_1:RecordAudio("410242039", var_162_22)
						arg_159_1:RecordAudio("410242039", var_162_22)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_410242", "410242039", "story_v_out_410242.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_410242", "410242039", "story_v_out_410242.awb")
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
	Play410242040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 410242040
		arg_163_1.duration_ = 9.1

		local var_163_0 = {
			ja = 9.1,
			CriLanguages = 5.566,
			zh = 5.566
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
			arg_163_1.auto_ = false
		end

		function arg_163_1.playNext_(arg_165_0)
			arg_163_1.onStoryFinished_()
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["10062"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos10062 = var_166_0.localPosition
				var_166_0.localScale = Vector3.New(1, 1, 1)

				arg_163_1:CheckSpriteTmpPos("10062", 2)

				local var_166_2 = var_166_0.childCount

				for iter_166_0 = 0, var_166_2 - 1 do
					local var_166_3 = var_166_0:GetChild(iter_166_0)

					if var_166_3.name == "split_2" or not string.find(var_166_3.name, "split") then
						var_166_3.gameObject:SetActive(true)
					else
						var_166_3.gameObject:SetActive(false)
					end
				end
			end

			local var_166_4 = 0.001

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_4 then
				local var_166_5 = (arg_163_1.time_ - var_166_1) / var_166_4
				local var_166_6 = Vector3.New(-370, -390, -290)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos10062, var_166_6, var_166_5)
			end

			if arg_163_1.time_ >= var_166_1 + var_166_4 and arg_163_1.time_ < var_166_1 + var_166_4 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(-370, -390, -290)
			end

			local var_166_7 = arg_163_1.actors_["10062"]
			local var_166_8 = 0

			if var_166_8 < arg_163_1.time_ and arg_163_1.time_ <= var_166_8 + arg_166_0 and arg_163_1.var_.actorSpriteComps10062 == nil then
				arg_163_1.var_.actorSpriteComps10062 = var_166_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_9 = 0.034

			if var_166_8 <= arg_163_1.time_ and arg_163_1.time_ < var_166_8 + var_166_9 then
				local var_166_10 = (arg_163_1.time_ - var_166_8) / var_166_9

				if arg_163_1.var_.actorSpriteComps10062 then
					for iter_166_1, iter_166_2 in pairs(arg_163_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_166_2 then
							local var_166_11 = Mathf.Lerp(iter_166_2.color.r, 1, var_166_10)

							iter_166_2.color = Color.New(var_166_11, var_166_11, var_166_11)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_8 + var_166_9 and arg_163_1.time_ < var_166_8 + var_166_9 + arg_166_0 and arg_163_1.var_.actorSpriteComps10062 then
				local var_166_12 = 1

				for iter_166_3, iter_166_4 in pairs(arg_163_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_166_4 then
						iter_166_4.color = Color.New(var_166_12, var_166_12, var_166_12)
					end
				end

				arg_163_1.var_.actorSpriteComps10062 = nil
			end

			local var_166_13 = 0
			local var_166_14 = 0.525

			if var_166_13 < arg_163_1.time_ and arg_163_1.time_ <= var_166_13 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_15 = arg_163_1:FormatText(StoryNameCfg[600].name)

				arg_163_1.leftNameTxt_.text = var_166_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_16 = arg_163_1:GetWordFromCfg(410242040)
				local var_166_17 = arg_163_1:FormatText(var_166_16.content)

				arg_163_1.text_.text = var_166_17

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_18 = 21
				local var_166_19 = utf8.len(var_166_17)
				local var_166_20 = var_166_18 <= 0 and var_166_14 or var_166_14 * (var_166_19 / var_166_18)

				if var_166_20 > 0 and var_166_14 < var_166_20 then
					arg_163_1.talkMaxDuration = var_166_20

					if var_166_20 + var_166_13 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_20 + var_166_13
					end
				end

				arg_163_1.text_.text = var_166_17
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410242", "410242040", "story_v_out_410242.awb") ~= 0 then
					local var_166_21 = manager.audio:GetVoiceLength("story_v_out_410242", "410242040", "story_v_out_410242.awb") / 1000

					if var_166_21 + var_166_13 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_21 + var_166_13
					end

					if var_166_16.prefab_name ~= "" and arg_163_1.actors_[var_166_16.prefab_name] ~= nil then
						local var_166_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_16.prefab_name].transform, "story_v_out_410242", "410242040", "story_v_out_410242.awb")

						arg_163_1:RecordAudio("410242040", var_166_22)
						arg_163_1:RecordAudio("410242040", var_166_22)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_410242", "410242040", "story_v_out_410242.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_410242", "410242040", "story_v_out_410242.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_23 = math.max(var_166_14, arg_163_1.talkMaxDuration)

			if var_166_13 <= arg_163_1.time_ and arg_163_1.time_ < var_166_13 + var_166_23 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_13) / var_166_23

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_13 + var_166_23 and arg_163_1.time_ < var_166_13 + var_166_23 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/L04h",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack"
	},
	voices = {
		"story_v_out_410242.awb"
	}
}
