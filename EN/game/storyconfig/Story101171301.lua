return {
	Play117131001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 117131001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play117131002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST12"

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
				local var_4_5 = arg_1_1.bgs_.ST12

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
					if iter_4_0 ~= "ST12" then
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
			local var_4_23 = 0.466666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 2
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_side_daily05", "bgm_side_daily05", "bgm_side_daily05.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 1.3

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

				local var_4_33 = arg_1_1:GetWordFromCfg(117131001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 52
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
	Play117131002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 117131002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play117131003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.55

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

				local var_10_2 = arg_7_1:GetWordFromCfg(117131002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 22
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
	Play117131003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 117131003
		arg_11_1.duration_ = 10.866

		local var_11_0 = {
			zh = 7.6,
			ja = 10.866
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
				arg_11_0:Play117131004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1029"

			if arg_11_1.actors_[var_14_0] == nil then
				local var_14_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_14_0), arg_11_1.canvasGo_.transform)

				var_14_1.transform:SetSiblingIndex(1)

				var_14_1.name = var_14_0
				var_14_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_11_1.actors_[var_14_0] = var_14_1
			end

			local var_14_2 = arg_11_1.actors_["1029"].transform
			local var_14_3 = 0

			if var_14_3 < arg_11_1.time_ and arg_11_1.time_ <= var_14_3 + arg_14_0 then
				arg_11_1.var_.moveOldPos1029 = var_14_2.localPosition
				var_14_2.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("1029", 2)

				local var_14_4 = var_14_2.childCount

				for iter_14_0 = 0, var_14_4 - 1 do
					local var_14_5 = var_14_2:GetChild(iter_14_0)

					if var_14_5.name == "split_1" or not string.find(var_14_5.name, "split") then
						var_14_5.gameObject:SetActive(true)
					else
						var_14_5.gameObject:SetActive(false)
					end
				end
			end

			local var_14_6 = 0.001

			if var_14_3 <= arg_11_1.time_ and arg_11_1.time_ < var_14_3 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_3) / var_14_6
				local var_14_8 = Vector3.New(-390, -355, -140)

				var_14_2.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1029, var_14_8, var_14_7)
			end

			if arg_11_1.time_ >= var_14_3 + var_14_6 and arg_11_1.time_ < var_14_3 + var_14_6 + arg_14_0 then
				var_14_2.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_14_9 = "1033"

			if arg_11_1.actors_[var_14_9] == nil then
				local var_14_10 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_14_9), arg_11_1.canvasGo_.transform)

				var_14_10.transform:SetSiblingIndex(1)

				var_14_10.name = var_14_9
				var_14_10.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_11_1.actors_[var_14_9] = var_14_10
			end

			local var_14_11 = arg_11_1.actors_["1033"].transform
			local var_14_12 = 0

			if var_14_12 < arg_11_1.time_ and arg_11_1.time_ <= var_14_12 + arg_14_0 then
				arg_11_1.var_.moveOldPos1033 = var_14_11.localPosition
				var_14_11.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("1033", 4)

				local var_14_13 = var_14_11.childCount

				for iter_14_1 = 0, var_14_13 - 1 do
					local var_14_14 = var_14_11:GetChild(iter_14_1)

					if var_14_14.name == "split_6" or not string.find(var_14_14.name, "split") then
						var_14_14.gameObject:SetActive(true)
					else
						var_14_14.gameObject:SetActive(false)
					end
				end
			end

			local var_14_15 = 0.001

			if var_14_12 <= arg_11_1.time_ and arg_11_1.time_ < var_14_12 + var_14_15 then
				local var_14_16 = (arg_11_1.time_ - var_14_12) / var_14_15
				local var_14_17 = Vector3.New(390, -355, -140)

				var_14_11.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1033, var_14_17, var_14_16)
			end

			if arg_11_1.time_ >= var_14_12 + var_14_15 and arg_11_1.time_ < var_14_12 + var_14_15 + arg_14_0 then
				var_14_11.localPosition = Vector3.New(390, -355, -140)
			end

			local var_14_18 = arg_11_1.actors_["1029"]
			local var_14_19 = 0

			if var_14_19 < arg_11_1.time_ and arg_11_1.time_ <= var_14_19 + arg_14_0 and arg_11_1.var_.actorSpriteComps1029 == nil then
				arg_11_1.var_.actorSpriteComps1029 = var_14_18:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_20 = 0.034

			if var_14_19 <= arg_11_1.time_ and arg_11_1.time_ < var_14_19 + var_14_20 then
				local var_14_21 = (arg_11_1.time_ - var_14_19) / var_14_20

				if arg_11_1.var_.actorSpriteComps1029 then
					for iter_14_2, iter_14_3 in pairs(arg_11_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_14_3 then
							local var_14_22 = Mathf.Lerp(iter_14_3.color.r, 0.5, var_14_21)

							iter_14_3.color = Color.New(var_14_22, var_14_22, var_14_22)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_19 + var_14_20 and arg_11_1.time_ < var_14_19 + var_14_20 + arg_14_0 and arg_11_1.var_.actorSpriteComps1029 then
				local var_14_23 = 0.5

				for iter_14_4, iter_14_5 in pairs(arg_11_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_14_5 then
						iter_14_5.color = Color.New(var_14_23, var_14_23, var_14_23)
					end
				end

				arg_11_1.var_.actorSpriteComps1029 = nil
			end

			local var_14_24 = arg_11_1.actors_["1033"]
			local var_14_25 = 0

			if var_14_25 < arg_11_1.time_ and arg_11_1.time_ <= var_14_25 + arg_14_0 and arg_11_1.var_.actorSpriteComps1033 == nil then
				arg_11_1.var_.actorSpriteComps1033 = var_14_24:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_26 = 0.2

			if var_14_25 <= arg_11_1.time_ and arg_11_1.time_ < var_14_25 + var_14_26 then
				local var_14_27 = (arg_11_1.time_ - var_14_25) / var_14_26

				if arg_11_1.var_.actorSpriteComps1033 then
					for iter_14_6, iter_14_7 in pairs(arg_11_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_14_7 then
							local var_14_28 = Mathf.Lerp(iter_14_7.color.r, 1, var_14_27)

							iter_14_7.color = Color.New(var_14_28, var_14_28, var_14_28)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_25 + var_14_26 and arg_11_1.time_ < var_14_25 + var_14_26 + arg_14_0 and arg_11_1.var_.actorSpriteComps1033 then
				local var_14_29 = 1

				for iter_14_8, iter_14_9 in pairs(arg_11_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_14_9 then
						iter_14_9.color = Color.New(var_14_29, var_14_29, var_14_29)
					end
				end

				arg_11_1.var_.actorSpriteComps1033 = nil
			end

			local var_14_30 = arg_11_1.actors_["1033"]
			local var_14_31 = 0

			if var_14_31 < arg_11_1.time_ and arg_11_1.time_ <= var_14_31 + arg_14_0 then
				local var_14_32 = var_14_30:GetComponentInChildren(typeof(CanvasGroup))

				if var_14_32 then
					arg_11_1.var_.alphaOldValue1033 = var_14_32.alpha
					arg_11_1.var_.characterEffect1033 = var_14_32
				end

				arg_11_1.var_.alphaOldValue1033 = 0
			end

			local var_14_33 = 0.5

			if var_14_31 <= arg_11_1.time_ and arg_11_1.time_ < var_14_31 + var_14_33 then
				local var_14_34 = (arg_11_1.time_ - var_14_31) / var_14_33
				local var_14_35 = Mathf.Lerp(arg_11_1.var_.alphaOldValue1033, 1, var_14_34)

				if arg_11_1.var_.characterEffect1033 then
					arg_11_1.var_.characterEffect1033.alpha = var_14_35
				end
			end

			if arg_11_1.time_ >= var_14_31 + var_14_33 and arg_11_1.time_ < var_14_31 + var_14_33 + arg_14_0 and arg_11_1.var_.characterEffect1033 then
				arg_11_1.var_.characterEffect1033.alpha = 1
			end

			local var_14_36 = arg_11_1.actors_["1029"]
			local var_14_37 = 0

			if var_14_37 < arg_11_1.time_ and arg_11_1.time_ <= var_14_37 + arg_14_0 then
				local var_14_38 = var_14_36:GetComponentInChildren(typeof(CanvasGroup))

				if var_14_38 then
					arg_11_1.var_.alphaOldValue1029 = var_14_38.alpha
					arg_11_1.var_.characterEffect1029 = var_14_38
				end

				arg_11_1.var_.alphaOldValue1029 = 0
			end

			local var_14_39 = 0.5

			if var_14_37 <= arg_11_1.time_ and arg_11_1.time_ < var_14_37 + var_14_39 then
				local var_14_40 = (arg_11_1.time_ - var_14_37) / var_14_39
				local var_14_41 = Mathf.Lerp(arg_11_1.var_.alphaOldValue1029, 1, var_14_40)

				if arg_11_1.var_.characterEffect1029 then
					arg_11_1.var_.characterEffect1029.alpha = var_14_41
				end
			end

			if arg_11_1.time_ >= var_14_37 + var_14_39 and arg_11_1.time_ < var_14_37 + var_14_39 + arg_14_0 and arg_11_1.var_.characterEffect1029 then
				arg_11_1.var_.characterEffect1029.alpha = 1
			end

			local var_14_42 = 0
			local var_14_43 = 1.05

			if var_14_42 < arg_11_1.time_ and arg_11_1.time_ <= var_14_42 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_44 = arg_11_1:FormatText(StoryNameCfg[236].name)

				arg_11_1.leftNameTxt_.text = var_14_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_45 = arg_11_1:GetWordFromCfg(117131003)
				local var_14_46 = arg_11_1:FormatText(var_14_45.content)

				arg_11_1.text_.text = var_14_46

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_47 = 42
				local var_14_48 = utf8.len(var_14_46)
				local var_14_49 = var_14_47 <= 0 and var_14_43 or var_14_43 * (var_14_48 / var_14_47)

				if var_14_49 > 0 and var_14_43 < var_14_49 then
					arg_11_1.talkMaxDuration = var_14_49

					if var_14_49 + var_14_42 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_49 + var_14_42
					end
				end

				arg_11_1.text_.text = var_14_46
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131003", "story_v_out_117131.awb") ~= 0 then
					local var_14_50 = manager.audio:GetVoiceLength("story_v_out_117131", "117131003", "story_v_out_117131.awb") / 1000

					if var_14_50 + var_14_42 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_50 + var_14_42
					end

					if var_14_45.prefab_name ~= "" and arg_11_1.actors_[var_14_45.prefab_name] ~= nil then
						local var_14_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_45.prefab_name].transform, "story_v_out_117131", "117131003", "story_v_out_117131.awb")

						arg_11_1:RecordAudio("117131003", var_14_51)
						arg_11_1:RecordAudio("117131003", var_14_51)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_117131", "117131003", "story_v_out_117131.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_117131", "117131003", "story_v_out_117131.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_52 = math.max(var_14_43, arg_11_1.talkMaxDuration)

			if var_14_42 <= arg_11_1.time_ and arg_11_1.time_ < var_14_42 + var_14_52 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_42) / var_14_52

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_42 + var_14_52 and arg_11_1.time_ < var_14_42 + var_14_52 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play117131004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 117131004
		arg_15_1.duration_ = 3.766

		local var_15_0 = {
			zh = 1.866,
			ja = 3.766
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
				arg_15_0:Play117131005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1029"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1029 = var_18_0.localPosition
				var_18_0.localScale = Vector3.New(1, 1, 1)

				arg_15_1:CheckSpriteTmpPos("1029", 2)

				local var_18_2 = var_18_0.childCount

				for iter_18_0 = 0, var_18_2 - 1 do
					local var_18_3 = var_18_0:GetChild(iter_18_0)

					if var_18_3.name == "split_1" or not string.find(var_18_3.name, "split") then
						var_18_3.gameObject:SetActive(true)
					else
						var_18_3.gameObject:SetActive(false)
					end
				end
			end

			local var_18_4 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_4 then
				local var_18_5 = (arg_15_1.time_ - var_18_1) / var_18_4
				local var_18_6 = Vector3.New(-390, -355, -140)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1029, var_18_6, var_18_5)
			end

			if arg_15_1.time_ >= var_18_1 + var_18_4 and arg_15_1.time_ < var_18_1 + var_18_4 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_18_7 = arg_15_1.actors_["1033"].transform
			local var_18_8 = 0

			if var_18_8 < arg_15_1.time_ and arg_15_1.time_ <= var_18_8 + arg_18_0 then
				arg_15_1.var_.moveOldPos1033 = var_18_7.localPosition
				var_18_7.localScale = Vector3.New(1, 1, 1)

				arg_15_1:CheckSpriteTmpPos("1033", 4)

				local var_18_9 = var_18_7.childCount

				for iter_18_1 = 0, var_18_9 - 1 do
					local var_18_10 = var_18_7:GetChild(iter_18_1)

					if var_18_10.name == "split_6" or not string.find(var_18_10.name, "split") then
						var_18_10.gameObject:SetActive(true)
					else
						var_18_10.gameObject:SetActive(false)
					end
				end
			end

			local var_18_11 = 0.001

			if var_18_8 <= arg_15_1.time_ and arg_15_1.time_ < var_18_8 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_8) / var_18_11
				local var_18_13 = Vector3.New(390, -355, -140)

				var_18_7.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1033, var_18_13, var_18_12)
			end

			if arg_15_1.time_ >= var_18_8 + var_18_11 and arg_15_1.time_ < var_18_8 + var_18_11 + arg_18_0 then
				var_18_7.localPosition = Vector3.New(390, -355, -140)
			end

			local var_18_14 = arg_15_1.actors_["1029"]
			local var_18_15 = 0

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 and arg_15_1.var_.actorSpriteComps1029 == nil then
				arg_15_1.var_.actorSpriteComps1029 = var_18_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_16 = 0.2

			if var_18_15 <= arg_15_1.time_ and arg_15_1.time_ < var_18_15 + var_18_16 then
				local var_18_17 = (arg_15_1.time_ - var_18_15) / var_18_16

				if arg_15_1.var_.actorSpriteComps1029 then
					for iter_18_2, iter_18_3 in pairs(arg_15_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_18_3 then
							local var_18_18 = Mathf.Lerp(iter_18_3.color.r, 1, var_18_17)

							iter_18_3.color = Color.New(var_18_18, var_18_18, var_18_18)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_15 + var_18_16 and arg_15_1.time_ < var_18_15 + var_18_16 + arg_18_0 and arg_15_1.var_.actorSpriteComps1029 then
				local var_18_19 = 1

				for iter_18_4, iter_18_5 in pairs(arg_15_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_18_5 then
						iter_18_5.color = Color.New(var_18_19, var_18_19, var_18_19)
					end
				end

				arg_15_1.var_.actorSpriteComps1029 = nil
			end

			local var_18_20 = arg_15_1.actors_["1033"]
			local var_18_21 = 0

			if var_18_21 < arg_15_1.time_ and arg_15_1.time_ <= var_18_21 + arg_18_0 and arg_15_1.var_.actorSpriteComps1033 == nil then
				arg_15_1.var_.actorSpriteComps1033 = var_18_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_22 = 0.2

			if var_18_21 <= arg_15_1.time_ and arg_15_1.time_ < var_18_21 + var_18_22 then
				local var_18_23 = (arg_15_1.time_ - var_18_21) / var_18_22

				if arg_15_1.var_.actorSpriteComps1033 then
					for iter_18_6, iter_18_7 in pairs(arg_15_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_18_7 then
							local var_18_24 = Mathf.Lerp(iter_18_7.color.r, 0.5, var_18_23)

							iter_18_7.color = Color.New(var_18_24, var_18_24, var_18_24)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_21 + var_18_22 and arg_15_1.time_ < var_18_21 + var_18_22 + arg_18_0 and arg_15_1.var_.actorSpriteComps1033 then
				local var_18_25 = 0.5

				for iter_18_8, iter_18_9 in pairs(arg_15_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_18_9 then
						iter_18_9.color = Color.New(var_18_25, var_18_25, var_18_25)
					end
				end

				arg_15_1.var_.actorSpriteComps1033 = nil
			end

			local var_18_26 = 0
			local var_18_27 = 0.225

			if var_18_26 < arg_15_1.time_ and arg_15_1.time_ <= var_18_26 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_28 = arg_15_1:FormatText(StoryNameCfg[319].name)

				arg_15_1.leftNameTxt_.text = var_18_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_29 = arg_15_1:GetWordFromCfg(117131004)
				local var_18_30 = arg_15_1:FormatText(var_18_29.content)

				arg_15_1.text_.text = var_18_30

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_31 = 9
				local var_18_32 = utf8.len(var_18_30)
				local var_18_33 = var_18_31 <= 0 and var_18_27 or var_18_27 * (var_18_32 / var_18_31)

				if var_18_33 > 0 and var_18_27 < var_18_33 then
					arg_15_1.talkMaxDuration = var_18_33

					if var_18_33 + var_18_26 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_33 + var_18_26
					end
				end

				arg_15_1.text_.text = var_18_30
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131004", "story_v_out_117131.awb") ~= 0 then
					local var_18_34 = manager.audio:GetVoiceLength("story_v_out_117131", "117131004", "story_v_out_117131.awb") / 1000

					if var_18_34 + var_18_26 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_34 + var_18_26
					end

					if var_18_29.prefab_name ~= "" and arg_15_1.actors_[var_18_29.prefab_name] ~= nil then
						local var_18_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_29.prefab_name].transform, "story_v_out_117131", "117131004", "story_v_out_117131.awb")

						arg_15_1:RecordAudio("117131004", var_18_35)
						arg_15_1:RecordAudio("117131004", var_18_35)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_117131", "117131004", "story_v_out_117131.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_117131", "117131004", "story_v_out_117131.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_36 = math.max(var_18_27, arg_15_1.talkMaxDuration)

			if var_18_26 <= arg_15_1.time_ and arg_15_1.time_ < var_18_26 + var_18_36 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_26) / var_18_36

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_26 + var_18_36 and arg_15_1.time_ < var_18_26 + var_18_36 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play117131005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 117131005
		arg_19_1.duration_ = 3.833

		local var_19_0 = {
			zh = 3.133,
			ja = 3.833
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
				arg_19_0:Play117131006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1029"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1029 = var_22_0.localPosition
				var_22_0.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("1029", 2)

				local var_22_2 = var_22_0.childCount

				for iter_22_0 = 0, var_22_2 - 1 do
					local var_22_3 = var_22_0:GetChild(iter_22_0)

					if var_22_3.name == "split_1" or not string.find(var_22_3.name, "split") then
						var_22_3.gameObject:SetActive(true)
					else
						var_22_3.gameObject:SetActive(false)
					end
				end
			end

			local var_22_4 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_4 then
				local var_22_5 = (arg_19_1.time_ - var_22_1) / var_22_4
				local var_22_6 = Vector3.New(-390, -355, -140)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1029, var_22_6, var_22_5)
			end

			if arg_19_1.time_ >= var_22_1 + var_22_4 and arg_19_1.time_ < var_22_1 + var_22_4 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_22_7 = arg_19_1.actors_["1029"]
			local var_22_8 = 0

			if var_22_8 < arg_19_1.time_ and arg_19_1.time_ <= var_22_8 + arg_22_0 and arg_19_1.var_.actorSpriteComps1029 == nil then
				arg_19_1.var_.actorSpriteComps1029 = var_22_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_9 = 0.2

			if var_22_8 <= arg_19_1.time_ and arg_19_1.time_ < var_22_8 + var_22_9 then
				local var_22_10 = (arg_19_1.time_ - var_22_8) / var_22_9

				if arg_19_1.var_.actorSpriteComps1029 then
					for iter_22_1, iter_22_2 in pairs(arg_19_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_22_2 then
							local var_22_11 = Mathf.Lerp(iter_22_2.color.r, 0.5, var_22_10)

							iter_22_2.color = Color.New(var_22_11, var_22_11, var_22_11)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_8 + var_22_9 and arg_19_1.time_ < var_22_8 + var_22_9 + arg_22_0 and arg_19_1.var_.actorSpriteComps1029 then
				local var_22_12 = 0.5

				for iter_22_3, iter_22_4 in pairs(arg_19_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_22_4 then
						iter_22_4.color = Color.New(var_22_12, var_22_12, var_22_12)
					end
				end

				arg_19_1.var_.actorSpriteComps1029 = nil
			end

			local var_22_13 = arg_19_1.actors_["1033"]
			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 and arg_19_1.var_.actorSpriteComps1033 == nil then
				arg_19_1.var_.actorSpriteComps1033 = var_22_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_15 = 0.2

			if var_22_14 <= arg_19_1.time_ and arg_19_1.time_ < var_22_14 + var_22_15 then
				local var_22_16 = (arg_19_1.time_ - var_22_14) / var_22_15

				if arg_19_1.var_.actorSpriteComps1033 then
					for iter_22_5, iter_22_6 in pairs(arg_19_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_22_6 then
							local var_22_17 = Mathf.Lerp(iter_22_6.color.r, 1, var_22_16)

							iter_22_6.color = Color.New(var_22_17, var_22_17, var_22_17)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_14 + var_22_15 and arg_19_1.time_ < var_22_14 + var_22_15 + arg_22_0 and arg_19_1.var_.actorSpriteComps1033 then
				local var_22_18 = 1

				for iter_22_7, iter_22_8 in pairs(arg_19_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_22_8 then
						iter_22_8.color = Color.New(var_22_18, var_22_18, var_22_18)
					end
				end

				arg_19_1.var_.actorSpriteComps1033 = nil
			end

			local var_22_19 = 0
			local var_22_20 = 0.325

			if var_22_19 < arg_19_1.time_ and arg_19_1.time_ <= var_22_19 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_21 = arg_19_1:FormatText(StoryNameCfg[236].name)

				arg_19_1.leftNameTxt_.text = var_22_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_22 = arg_19_1:GetWordFromCfg(117131005)
				local var_22_23 = arg_19_1:FormatText(var_22_22.content)

				arg_19_1.text_.text = var_22_23

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_24 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131005", "story_v_out_117131.awb") ~= 0 then
					local var_22_27 = manager.audio:GetVoiceLength("story_v_out_117131", "117131005", "story_v_out_117131.awb") / 1000

					if var_22_27 + var_22_19 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_27 + var_22_19
					end

					if var_22_22.prefab_name ~= "" and arg_19_1.actors_[var_22_22.prefab_name] ~= nil then
						local var_22_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_22.prefab_name].transform, "story_v_out_117131", "117131005", "story_v_out_117131.awb")

						arg_19_1:RecordAudio("117131005", var_22_28)
						arg_19_1:RecordAudio("117131005", var_22_28)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_117131", "117131005", "story_v_out_117131.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_117131", "117131005", "story_v_out_117131.awb")
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
	Play117131006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 117131006
		arg_23_1.duration_ = 6.433

		local var_23_0 = {
			zh = 6.433,
			ja = 4.266
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
				arg_23_0:Play117131007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.9

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[236].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(117131006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131006", "story_v_out_117131.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131006", "story_v_out_117131.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_117131", "117131006", "story_v_out_117131.awb")

						arg_23_1:RecordAudio("117131006", var_26_9)
						arg_23_1:RecordAudio("117131006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_117131", "117131006", "story_v_out_117131.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_117131", "117131006", "story_v_out_117131.awb")
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
	Play117131007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 117131007
		arg_27_1.duration_ = 8.666

		local var_27_0 = {
			zh = 7.433,
			ja = 8.666
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
				arg_27_0:Play117131008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1029"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1029 = var_30_0.localPosition
				var_30_0.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("1029", 2)

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
				local var_30_6 = Vector3.New(-390, -355, -140)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1029, var_30_6, var_30_5)
			end

			if arg_27_1.time_ >= var_30_1 + var_30_4 and arg_27_1.time_ < var_30_1 + var_30_4 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_30_7 = arg_27_1.actors_["1029"]
			local var_30_8 = 0

			if var_30_8 < arg_27_1.time_ and arg_27_1.time_ <= var_30_8 + arg_30_0 and arg_27_1.var_.actorSpriteComps1029 == nil then
				arg_27_1.var_.actorSpriteComps1029 = var_30_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_9 = 0.2

			if var_30_8 <= arg_27_1.time_ and arg_27_1.time_ < var_30_8 + var_30_9 then
				local var_30_10 = (arg_27_1.time_ - var_30_8) / var_30_9

				if arg_27_1.var_.actorSpriteComps1029 then
					for iter_30_1, iter_30_2 in pairs(arg_27_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_30_2 then
							local var_30_11 = Mathf.Lerp(iter_30_2.color.r, 1, var_30_10)

							iter_30_2.color = Color.New(var_30_11, var_30_11, var_30_11)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_8 + var_30_9 and arg_27_1.time_ < var_30_8 + var_30_9 + arg_30_0 and arg_27_1.var_.actorSpriteComps1029 then
				local var_30_12 = 1

				for iter_30_3, iter_30_4 in pairs(arg_27_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_30_4 then
						iter_30_4.color = Color.New(var_30_12, var_30_12, var_30_12)
					end
				end

				arg_27_1.var_.actorSpriteComps1029 = nil
			end

			local var_30_13 = arg_27_1.actors_["1033"]
			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 and arg_27_1.var_.actorSpriteComps1033 == nil then
				arg_27_1.var_.actorSpriteComps1033 = var_30_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_15 = 0.2

			if var_30_14 <= arg_27_1.time_ and arg_27_1.time_ < var_30_14 + var_30_15 then
				local var_30_16 = (arg_27_1.time_ - var_30_14) / var_30_15

				if arg_27_1.var_.actorSpriteComps1033 then
					for iter_30_5, iter_30_6 in pairs(arg_27_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_30_6 then
							local var_30_17 = Mathf.Lerp(iter_30_6.color.r, 0.5, var_30_16)

							iter_30_6.color = Color.New(var_30_17, var_30_17, var_30_17)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_14 + var_30_15 and arg_27_1.time_ < var_30_14 + var_30_15 + arg_30_0 and arg_27_1.var_.actorSpriteComps1033 then
				local var_30_18 = 0.5

				for iter_30_7, iter_30_8 in pairs(arg_27_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_30_8 then
						iter_30_8.color = Color.New(var_30_18, var_30_18, var_30_18)
					end
				end

				arg_27_1.var_.actorSpriteComps1033 = nil
			end

			local var_30_19 = 0
			local var_30_20 = 0.725

			if var_30_19 < arg_27_1.time_ and arg_27_1.time_ <= var_30_19 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_21 = arg_27_1:FormatText(StoryNameCfg[319].name)

				arg_27_1.leftNameTxt_.text = var_30_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_22 = arg_27_1:GetWordFromCfg(117131007)
				local var_30_23 = arg_27_1:FormatText(var_30_22.content)

				arg_27_1.text_.text = var_30_23

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_24 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131007", "story_v_out_117131.awb") ~= 0 then
					local var_30_27 = manager.audio:GetVoiceLength("story_v_out_117131", "117131007", "story_v_out_117131.awb") / 1000

					if var_30_27 + var_30_19 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_27 + var_30_19
					end

					if var_30_22.prefab_name ~= "" and arg_27_1.actors_[var_30_22.prefab_name] ~= nil then
						local var_30_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_22.prefab_name].transform, "story_v_out_117131", "117131007", "story_v_out_117131.awb")

						arg_27_1:RecordAudio("117131007", var_30_28)
						arg_27_1:RecordAudio("117131007", var_30_28)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_117131", "117131007", "story_v_out_117131.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_117131", "117131007", "story_v_out_117131.awb")
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
	Play117131008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 117131008
		arg_31_1.duration_ = 13.366

		local var_31_0 = {
			zh = 13.366,
			ja = 9.4
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
				arg_31_0:Play117131009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1029"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1029 = var_34_0.localPosition
				var_34_0.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("1029", 2)

				local var_34_2 = var_34_0.childCount

				for iter_34_0 = 0, var_34_2 - 1 do
					local var_34_3 = var_34_0:GetChild(iter_34_0)

					if var_34_3.name == "split_1" or not string.find(var_34_3.name, "split") then
						var_34_3.gameObject:SetActive(true)
					else
						var_34_3.gameObject:SetActive(false)
					end
				end
			end

			local var_34_4 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_4 then
				local var_34_5 = (arg_31_1.time_ - var_34_1) / var_34_4
				local var_34_6 = Vector3.New(-390, -355, -140)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1029, var_34_6, var_34_5)
			end

			if arg_31_1.time_ >= var_34_1 + var_34_4 and arg_31_1.time_ < var_34_1 + var_34_4 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_34_7 = arg_31_1.actors_["1033"].transform
			local var_34_8 = 0

			if var_34_8 < arg_31_1.time_ and arg_31_1.time_ <= var_34_8 + arg_34_0 then
				arg_31_1.var_.moveOldPos1033 = var_34_7.localPosition
				var_34_7.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("1033", 4)

				local var_34_9 = var_34_7.childCount

				for iter_34_1 = 0, var_34_9 - 1 do
					local var_34_10 = var_34_7:GetChild(iter_34_1)

					if var_34_10.name == "split_6" or not string.find(var_34_10.name, "split") then
						var_34_10.gameObject:SetActive(true)
					else
						var_34_10.gameObject:SetActive(false)
					end
				end
			end

			local var_34_11 = 0.001

			if var_34_8 <= arg_31_1.time_ and arg_31_1.time_ < var_34_8 + var_34_11 then
				local var_34_12 = (arg_31_1.time_ - var_34_8) / var_34_11
				local var_34_13 = Vector3.New(390, -355, -140)

				var_34_7.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1033, var_34_13, var_34_12)
			end

			if arg_31_1.time_ >= var_34_8 + var_34_11 and arg_31_1.time_ < var_34_8 + var_34_11 + arg_34_0 then
				var_34_7.localPosition = Vector3.New(390, -355, -140)
			end

			local var_34_14 = arg_31_1.actors_["1029"]
			local var_34_15 = 0

			if var_34_15 < arg_31_1.time_ and arg_31_1.time_ <= var_34_15 + arg_34_0 and arg_31_1.var_.actorSpriteComps1029 == nil then
				arg_31_1.var_.actorSpriteComps1029 = var_34_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_16 = 0.2

			if var_34_15 <= arg_31_1.time_ and arg_31_1.time_ < var_34_15 + var_34_16 then
				local var_34_17 = (arg_31_1.time_ - var_34_15) / var_34_16

				if arg_31_1.var_.actorSpriteComps1029 then
					for iter_34_2, iter_34_3 in pairs(arg_31_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_34_3 then
							local var_34_18 = Mathf.Lerp(iter_34_3.color.r, 0.5, var_34_17)

							iter_34_3.color = Color.New(var_34_18, var_34_18, var_34_18)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_15 + var_34_16 and arg_31_1.time_ < var_34_15 + var_34_16 + arg_34_0 and arg_31_1.var_.actorSpriteComps1029 then
				local var_34_19 = 0.5

				for iter_34_4, iter_34_5 in pairs(arg_31_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_34_5 then
						iter_34_5.color = Color.New(var_34_19, var_34_19, var_34_19)
					end
				end

				arg_31_1.var_.actorSpriteComps1029 = nil
			end

			local var_34_20 = arg_31_1.actors_["1033"]
			local var_34_21 = 0

			if var_34_21 < arg_31_1.time_ and arg_31_1.time_ <= var_34_21 + arg_34_0 and arg_31_1.var_.actorSpriteComps1033 == nil then
				arg_31_1.var_.actorSpriteComps1033 = var_34_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_22 = 0.2

			if var_34_21 <= arg_31_1.time_ and arg_31_1.time_ < var_34_21 + var_34_22 then
				local var_34_23 = (arg_31_1.time_ - var_34_21) / var_34_22

				if arg_31_1.var_.actorSpriteComps1033 then
					for iter_34_6, iter_34_7 in pairs(arg_31_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_34_7 then
							local var_34_24 = Mathf.Lerp(iter_34_7.color.r, 1, var_34_23)

							iter_34_7.color = Color.New(var_34_24, var_34_24, var_34_24)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_21 + var_34_22 and arg_31_1.time_ < var_34_21 + var_34_22 + arg_34_0 and arg_31_1.var_.actorSpriteComps1033 then
				local var_34_25 = 1

				for iter_34_8, iter_34_9 in pairs(arg_31_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_34_9 then
						iter_34_9.color = Color.New(var_34_25, var_34_25, var_34_25)
					end
				end

				arg_31_1.var_.actorSpriteComps1033 = nil
			end

			local var_34_26 = 0
			local var_34_27 = 1.775

			if var_34_26 < arg_31_1.time_ and arg_31_1.time_ <= var_34_26 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_28 = arg_31_1:FormatText(StoryNameCfg[236].name)

				arg_31_1.leftNameTxt_.text = var_34_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_29 = arg_31_1:GetWordFromCfg(117131008)
				local var_34_30 = arg_31_1:FormatText(var_34_29.content)

				arg_31_1.text_.text = var_34_30

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_31 = 71
				local var_34_32 = utf8.len(var_34_30)
				local var_34_33 = var_34_31 <= 0 and var_34_27 or var_34_27 * (var_34_32 / var_34_31)

				if var_34_33 > 0 and var_34_27 < var_34_33 then
					arg_31_1.talkMaxDuration = var_34_33

					if var_34_33 + var_34_26 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_33 + var_34_26
					end
				end

				arg_31_1.text_.text = var_34_30
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131008", "story_v_out_117131.awb") ~= 0 then
					local var_34_34 = manager.audio:GetVoiceLength("story_v_out_117131", "117131008", "story_v_out_117131.awb") / 1000

					if var_34_34 + var_34_26 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_34 + var_34_26
					end

					if var_34_29.prefab_name ~= "" and arg_31_1.actors_[var_34_29.prefab_name] ~= nil then
						local var_34_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_29.prefab_name].transform, "story_v_out_117131", "117131008", "story_v_out_117131.awb")

						arg_31_1:RecordAudio("117131008", var_34_35)
						arg_31_1:RecordAudio("117131008", var_34_35)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_117131", "117131008", "story_v_out_117131.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_117131", "117131008", "story_v_out_117131.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_36 = math.max(var_34_27, arg_31_1.talkMaxDuration)

			if var_34_26 <= arg_31_1.time_ and arg_31_1.time_ < var_34_26 + var_34_36 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_26) / var_34_36

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_26 + var_34_36 and arg_31_1.time_ < var_34_26 + var_34_36 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play117131009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 117131009
		arg_35_1.duration_ = 14.433

		local var_35_0 = {
			zh = 14.433,
			ja = 11.133
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
				arg_35_0:Play117131010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 1.8

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[236].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(117131009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 72
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131009", "story_v_out_117131.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131009", "story_v_out_117131.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_117131", "117131009", "story_v_out_117131.awb")

						arg_35_1:RecordAudio("117131009", var_38_9)
						arg_35_1:RecordAudio("117131009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_117131", "117131009", "story_v_out_117131.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_117131", "117131009", "story_v_out_117131.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_10 = math.max(var_38_1, arg_35_1.talkMaxDuration)

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_10 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_0) / var_38_10

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_0 + var_38_10 and arg_35_1.time_ < var_38_0 + var_38_10 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play117131010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 117131010
		arg_39_1.duration_ = 6.466

		local var_39_0 = {
			zh = 5.933,
			ja = 6.466
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
				arg_39_0:Play117131011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 0.825

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_2 = arg_39_1:FormatText(StoryNameCfg[236].name)

				arg_39_1.leftNameTxt_.text = var_42_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(117131010)
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131010", "story_v_out_117131.awb") ~= 0 then
					local var_42_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131010", "story_v_out_117131.awb") / 1000

					if var_42_8 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_8 + var_42_0
					end

					if var_42_3.prefab_name ~= "" and arg_39_1.actors_[var_42_3.prefab_name] ~= nil then
						local var_42_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_3.prefab_name].transform, "story_v_out_117131", "117131010", "story_v_out_117131.awb")

						arg_39_1:RecordAudio("117131010", var_42_9)
						arg_39_1:RecordAudio("117131010", var_42_9)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_117131", "117131010", "story_v_out_117131.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_117131", "117131010", "story_v_out_117131.awb")
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
	Play117131011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 117131011
		arg_43_1.duration_ = 5.233

		local var_43_0 = {
			zh = 3.533,
			ja = 5.233
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
				arg_43_0:Play117131012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1029"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1029 = var_46_0.localPosition
				var_46_0.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("1029", 2)

				local var_46_2 = var_46_0.childCount

				for iter_46_0 = 0, var_46_2 - 1 do
					local var_46_3 = var_46_0:GetChild(iter_46_0)

					if var_46_3.name == "split_1" or not string.find(var_46_3.name, "split") then
						var_46_3.gameObject:SetActive(true)
					else
						var_46_3.gameObject:SetActive(false)
					end
				end
			end

			local var_46_4 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_4 then
				local var_46_5 = (arg_43_1.time_ - var_46_1) / var_46_4
				local var_46_6 = Vector3.New(-390, -355, -140)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1029, var_46_6, var_46_5)
			end

			if arg_43_1.time_ >= var_46_1 + var_46_4 and arg_43_1.time_ < var_46_1 + var_46_4 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_46_7 = arg_43_1.actors_["1029"]
			local var_46_8 = 0

			if var_46_8 < arg_43_1.time_ and arg_43_1.time_ <= var_46_8 + arg_46_0 and arg_43_1.var_.actorSpriteComps1029 == nil then
				arg_43_1.var_.actorSpriteComps1029 = var_46_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_9 = 0.2

			if var_46_8 <= arg_43_1.time_ and arg_43_1.time_ < var_46_8 + var_46_9 then
				local var_46_10 = (arg_43_1.time_ - var_46_8) / var_46_9

				if arg_43_1.var_.actorSpriteComps1029 then
					for iter_46_1, iter_46_2 in pairs(arg_43_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_46_2 then
							local var_46_11 = Mathf.Lerp(iter_46_2.color.r, 1, var_46_10)

							iter_46_2.color = Color.New(var_46_11, var_46_11, var_46_11)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_8 + var_46_9 and arg_43_1.time_ < var_46_8 + var_46_9 + arg_46_0 and arg_43_1.var_.actorSpriteComps1029 then
				local var_46_12 = 1

				for iter_46_3, iter_46_4 in pairs(arg_43_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_46_4 then
						iter_46_4.color = Color.New(var_46_12, var_46_12, var_46_12)
					end
				end

				arg_43_1.var_.actorSpriteComps1029 = nil
			end

			local var_46_13 = arg_43_1.actors_["1033"]
			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 and arg_43_1.var_.actorSpriteComps1033 == nil then
				arg_43_1.var_.actorSpriteComps1033 = var_46_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_15 = 0.2

			if var_46_14 <= arg_43_1.time_ and arg_43_1.time_ < var_46_14 + var_46_15 then
				local var_46_16 = (arg_43_1.time_ - var_46_14) / var_46_15

				if arg_43_1.var_.actorSpriteComps1033 then
					for iter_46_5, iter_46_6 in pairs(arg_43_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_46_6 then
							local var_46_17 = Mathf.Lerp(iter_46_6.color.r, 0.5, var_46_16)

							iter_46_6.color = Color.New(var_46_17, var_46_17, var_46_17)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_14 + var_46_15 and arg_43_1.time_ < var_46_14 + var_46_15 + arg_46_0 and arg_43_1.var_.actorSpriteComps1033 then
				local var_46_18 = 0.5

				for iter_46_7, iter_46_8 in pairs(arg_43_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_46_8 then
						iter_46_8.color = Color.New(var_46_18, var_46_18, var_46_18)
					end
				end

				arg_43_1.var_.actorSpriteComps1033 = nil
			end

			local var_46_19 = 0
			local var_46_20 = 0.55

			if var_46_19 < arg_43_1.time_ and arg_43_1.time_ <= var_46_19 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_21 = arg_43_1:FormatText(StoryNameCfg[319].name)

				arg_43_1.leftNameTxt_.text = var_46_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_22 = arg_43_1:GetWordFromCfg(117131011)
				local var_46_23 = arg_43_1:FormatText(var_46_22.content)

				arg_43_1.text_.text = var_46_23

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_24 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131011", "story_v_out_117131.awb") ~= 0 then
					local var_46_27 = manager.audio:GetVoiceLength("story_v_out_117131", "117131011", "story_v_out_117131.awb") / 1000

					if var_46_27 + var_46_19 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_27 + var_46_19
					end

					if var_46_22.prefab_name ~= "" and arg_43_1.actors_[var_46_22.prefab_name] ~= nil then
						local var_46_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_22.prefab_name].transform, "story_v_out_117131", "117131011", "story_v_out_117131.awb")

						arg_43_1:RecordAudio("117131011", var_46_28)
						arg_43_1:RecordAudio("117131011", var_46_28)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_117131", "117131011", "story_v_out_117131.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_117131", "117131011", "story_v_out_117131.awb")
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
	Play117131012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 117131012
		arg_47_1.duration_ = 7.166

		local var_47_0 = {
			zh = 5.333,
			ja = 7.166
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
				arg_47_0:Play117131013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1029"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1029 = var_50_0.localPosition
				var_50_0.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("1029", 2)

				local var_50_2 = var_50_0.childCount

				for iter_50_0 = 0, var_50_2 - 1 do
					local var_50_3 = var_50_0:GetChild(iter_50_0)

					if var_50_3.name == "split_1" or not string.find(var_50_3.name, "split") then
						var_50_3.gameObject:SetActive(true)
					else
						var_50_3.gameObject:SetActive(false)
					end
				end
			end

			local var_50_4 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_4 then
				local var_50_5 = (arg_47_1.time_ - var_50_1) / var_50_4
				local var_50_6 = Vector3.New(-390, -355, -140)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1029, var_50_6, var_50_5)
			end

			if arg_47_1.time_ >= var_50_1 + var_50_4 and arg_47_1.time_ < var_50_1 + var_50_4 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_50_7 = arg_47_1.actors_["1033"].transform
			local var_50_8 = 0

			if var_50_8 < arg_47_1.time_ and arg_47_1.time_ <= var_50_8 + arg_50_0 then
				arg_47_1.var_.moveOldPos1033 = var_50_7.localPosition
				var_50_7.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("1033", 4)

				local var_50_9 = var_50_7.childCount

				for iter_50_1 = 0, var_50_9 - 1 do
					local var_50_10 = var_50_7:GetChild(iter_50_1)

					if var_50_10.name == "split_4" or not string.find(var_50_10.name, "split") then
						var_50_10.gameObject:SetActive(true)
					else
						var_50_10.gameObject:SetActive(false)
					end
				end
			end

			local var_50_11 = 0.001

			if var_50_8 <= arg_47_1.time_ and arg_47_1.time_ < var_50_8 + var_50_11 then
				local var_50_12 = (arg_47_1.time_ - var_50_8) / var_50_11
				local var_50_13 = Vector3.New(390, -355, -140)

				var_50_7.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1033, var_50_13, var_50_12)
			end

			if arg_47_1.time_ >= var_50_8 + var_50_11 and arg_47_1.time_ < var_50_8 + var_50_11 + arg_50_0 then
				var_50_7.localPosition = Vector3.New(390, -355, -140)
			end

			local var_50_14 = arg_47_1.actors_["1029"]
			local var_50_15 = 0

			if var_50_15 < arg_47_1.time_ and arg_47_1.time_ <= var_50_15 + arg_50_0 and arg_47_1.var_.actorSpriteComps1029 == nil then
				arg_47_1.var_.actorSpriteComps1029 = var_50_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_16 = 0.2

			if var_50_15 <= arg_47_1.time_ and arg_47_1.time_ < var_50_15 + var_50_16 then
				local var_50_17 = (arg_47_1.time_ - var_50_15) / var_50_16

				if arg_47_1.var_.actorSpriteComps1029 then
					for iter_50_2, iter_50_3 in pairs(arg_47_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_50_3 then
							local var_50_18 = Mathf.Lerp(iter_50_3.color.r, 0.5, var_50_17)

							iter_50_3.color = Color.New(var_50_18, var_50_18, var_50_18)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_15 + var_50_16 and arg_47_1.time_ < var_50_15 + var_50_16 + arg_50_0 and arg_47_1.var_.actorSpriteComps1029 then
				local var_50_19 = 0.5

				for iter_50_4, iter_50_5 in pairs(arg_47_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_50_5 then
						iter_50_5.color = Color.New(var_50_19, var_50_19, var_50_19)
					end
				end

				arg_47_1.var_.actorSpriteComps1029 = nil
			end

			local var_50_20 = arg_47_1.actors_["1033"]
			local var_50_21 = 0

			if var_50_21 < arg_47_1.time_ and arg_47_1.time_ <= var_50_21 + arg_50_0 and arg_47_1.var_.actorSpriteComps1033 == nil then
				arg_47_1.var_.actorSpriteComps1033 = var_50_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_22 = 0.2

			if var_50_21 <= arg_47_1.time_ and arg_47_1.time_ < var_50_21 + var_50_22 then
				local var_50_23 = (arg_47_1.time_ - var_50_21) / var_50_22

				if arg_47_1.var_.actorSpriteComps1033 then
					for iter_50_6, iter_50_7 in pairs(arg_47_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_50_7 then
							local var_50_24 = Mathf.Lerp(iter_50_7.color.r, 1, var_50_23)

							iter_50_7.color = Color.New(var_50_24, var_50_24, var_50_24)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_21 + var_50_22 and arg_47_1.time_ < var_50_21 + var_50_22 + arg_50_0 and arg_47_1.var_.actorSpriteComps1033 then
				local var_50_25 = 1

				for iter_50_8, iter_50_9 in pairs(arg_47_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_50_9 then
						iter_50_9.color = Color.New(var_50_25, var_50_25, var_50_25)
					end
				end

				arg_47_1.var_.actorSpriteComps1033 = nil
			end

			local var_50_26 = 0
			local var_50_27 = 0.675

			if var_50_26 < arg_47_1.time_ and arg_47_1.time_ <= var_50_26 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_28 = arg_47_1:FormatText(StoryNameCfg[236].name)

				arg_47_1.leftNameTxt_.text = var_50_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_29 = arg_47_1:GetWordFromCfg(117131012)
				local var_50_30 = arg_47_1:FormatText(var_50_29.content)

				arg_47_1.text_.text = var_50_30

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_31 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131012", "story_v_out_117131.awb") ~= 0 then
					local var_50_34 = manager.audio:GetVoiceLength("story_v_out_117131", "117131012", "story_v_out_117131.awb") / 1000

					if var_50_34 + var_50_26 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_34 + var_50_26
					end

					if var_50_29.prefab_name ~= "" and arg_47_1.actors_[var_50_29.prefab_name] ~= nil then
						local var_50_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_29.prefab_name].transform, "story_v_out_117131", "117131012", "story_v_out_117131.awb")

						arg_47_1:RecordAudio("117131012", var_50_35)
						arg_47_1:RecordAudio("117131012", var_50_35)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_117131", "117131012", "story_v_out_117131.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_117131", "117131012", "story_v_out_117131.awb")
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
	Play117131013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 117131013
		arg_51_1.duration_ = 14

		local var_51_0 = {
			zh = 14,
			ja = 11.266
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
				arg_51_0:Play117131014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1033"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1033 = var_54_0.localPosition
				var_54_0.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("1033", 4)

				local var_54_2 = var_54_0.childCount

				for iter_54_0 = 0, var_54_2 - 1 do
					local var_54_3 = var_54_0:GetChild(iter_54_0)

					if var_54_3.name == "split_6" or not string.find(var_54_3.name, "split") then
						var_54_3.gameObject:SetActive(true)
					else
						var_54_3.gameObject:SetActive(false)
					end
				end
			end

			local var_54_4 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_4 then
				local var_54_5 = (arg_51_1.time_ - var_54_1) / var_54_4
				local var_54_6 = Vector3.New(390, -355, -140)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1033, var_54_6, var_54_5)
			end

			if arg_51_1.time_ >= var_54_1 + var_54_4 and arg_51_1.time_ < var_54_1 + var_54_4 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(390, -355, -140)
			end

			local var_54_7 = arg_51_1.actors_["1033"]
			local var_54_8 = 0

			if var_54_8 < arg_51_1.time_ and arg_51_1.time_ <= var_54_8 + arg_54_0 and arg_51_1.var_.actorSpriteComps1033 == nil then
				arg_51_1.var_.actorSpriteComps1033 = var_54_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_9 = 0.0166666666666667

			if var_54_8 <= arg_51_1.time_ and arg_51_1.time_ < var_54_8 + var_54_9 then
				local var_54_10 = (arg_51_1.time_ - var_54_8) / var_54_9

				if arg_51_1.var_.actorSpriteComps1033 then
					for iter_54_1, iter_54_2 in pairs(arg_51_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_54_2 then
							local var_54_11 = Mathf.Lerp(iter_54_2.color.r, 1, var_54_10)

							iter_54_2.color = Color.New(var_54_11, var_54_11, var_54_11)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_8 + var_54_9 and arg_51_1.time_ < var_54_8 + var_54_9 + arg_54_0 and arg_51_1.var_.actorSpriteComps1033 then
				local var_54_12 = 1

				for iter_54_3, iter_54_4 in pairs(arg_51_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_54_4 then
						iter_54_4.color = Color.New(var_54_12, var_54_12, var_54_12)
					end
				end

				arg_51_1.var_.actorSpriteComps1033 = nil
			end

			local var_54_13 = 0
			local var_54_14 = 1.75

			if var_54_13 < arg_51_1.time_ and arg_51_1.time_ <= var_54_13 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_15 = arg_51_1:FormatText(StoryNameCfg[236].name)

				arg_51_1.leftNameTxt_.text = var_54_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_16 = arg_51_1:GetWordFromCfg(117131013)
				local var_54_17 = arg_51_1:FormatText(var_54_16.content)

				arg_51_1.text_.text = var_54_17

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_18 = 70
				local var_54_19 = utf8.len(var_54_17)
				local var_54_20 = var_54_18 <= 0 and var_54_14 or var_54_14 * (var_54_19 / var_54_18)

				if var_54_20 > 0 and var_54_14 < var_54_20 then
					arg_51_1.talkMaxDuration = var_54_20

					if var_54_20 + var_54_13 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_20 + var_54_13
					end
				end

				arg_51_1.text_.text = var_54_17
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131013", "story_v_out_117131.awb") ~= 0 then
					local var_54_21 = manager.audio:GetVoiceLength("story_v_out_117131", "117131013", "story_v_out_117131.awb") / 1000

					if var_54_21 + var_54_13 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_21 + var_54_13
					end

					if var_54_16.prefab_name ~= "" and arg_51_1.actors_[var_54_16.prefab_name] ~= nil then
						local var_54_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_16.prefab_name].transform, "story_v_out_117131", "117131013", "story_v_out_117131.awb")

						arg_51_1:RecordAudio("117131013", var_54_22)
						arg_51_1:RecordAudio("117131013", var_54_22)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_117131", "117131013", "story_v_out_117131.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_117131", "117131013", "story_v_out_117131.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_23 = math.max(var_54_14, arg_51_1.talkMaxDuration)

			if var_54_13 <= arg_51_1.time_ and arg_51_1.time_ < var_54_13 + var_54_23 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_13) / var_54_23

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_13 + var_54_23 and arg_51_1.time_ < var_54_13 + var_54_23 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play117131014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 117131014
		arg_55_1.duration_ = 5.2

		local var_55_0 = {
			zh = 5.2,
			ja = 5.166
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
				arg_55_0:Play117131015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1029"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1029 = var_58_0.localPosition
				var_58_0.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("1029", 2)

				local var_58_2 = var_58_0.childCount

				for iter_58_0 = 0, var_58_2 - 1 do
					local var_58_3 = var_58_0:GetChild(iter_58_0)

					if var_58_3.name == "split_1" or not string.find(var_58_3.name, "split") then
						var_58_3.gameObject:SetActive(true)
					else
						var_58_3.gameObject:SetActive(false)
					end
				end
			end

			local var_58_4 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_4 then
				local var_58_5 = (arg_55_1.time_ - var_58_1) / var_58_4
				local var_58_6 = Vector3.New(-390, -355, -140)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1029, var_58_6, var_58_5)
			end

			if arg_55_1.time_ >= var_58_1 + var_58_4 and arg_55_1.time_ < var_58_1 + var_58_4 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_58_7 = arg_55_1.actors_["1029"]
			local var_58_8 = 0

			if var_58_8 < arg_55_1.time_ and arg_55_1.time_ <= var_58_8 + arg_58_0 and arg_55_1.var_.actorSpriteComps1029 == nil then
				arg_55_1.var_.actorSpriteComps1029 = var_58_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_9 = 0.2

			if var_58_8 <= arg_55_1.time_ and arg_55_1.time_ < var_58_8 + var_58_9 then
				local var_58_10 = (arg_55_1.time_ - var_58_8) / var_58_9

				if arg_55_1.var_.actorSpriteComps1029 then
					for iter_58_1, iter_58_2 in pairs(arg_55_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_58_2 then
							local var_58_11 = Mathf.Lerp(iter_58_2.color.r, 1, var_58_10)

							iter_58_2.color = Color.New(var_58_11, var_58_11, var_58_11)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_8 + var_58_9 and arg_55_1.time_ < var_58_8 + var_58_9 + arg_58_0 and arg_55_1.var_.actorSpriteComps1029 then
				local var_58_12 = 1

				for iter_58_3, iter_58_4 in pairs(arg_55_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_58_4 then
						iter_58_4.color = Color.New(var_58_12, var_58_12, var_58_12)
					end
				end

				arg_55_1.var_.actorSpriteComps1029 = nil
			end

			local var_58_13 = arg_55_1.actors_["1033"]
			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 and arg_55_1.var_.actorSpriteComps1033 == nil then
				arg_55_1.var_.actorSpriteComps1033 = var_58_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_15 = 0.2

			if var_58_14 <= arg_55_1.time_ and arg_55_1.time_ < var_58_14 + var_58_15 then
				local var_58_16 = (arg_55_1.time_ - var_58_14) / var_58_15

				if arg_55_1.var_.actorSpriteComps1033 then
					for iter_58_5, iter_58_6 in pairs(arg_55_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_58_6 then
							local var_58_17 = Mathf.Lerp(iter_58_6.color.r, 0.5, var_58_16)

							iter_58_6.color = Color.New(var_58_17, var_58_17, var_58_17)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_14 + var_58_15 and arg_55_1.time_ < var_58_14 + var_58_15 + arg_58_0 and arg_55_1.var_.actorSpriteComps1033 then
				local var_58_18 = 0.5

				for iter_58_7, iter_58_8 in pairs(arg_55_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_58_8 then
						iter_58_8.color = Color.New(var_58_18, var_58_18, var_58_18)
					end
				end

				arg_55_1.var_.actorSpriteComps1033 = nil
			end

			local var_58_19 = 0
			local var_58_20 = 0.625

			if var_58_19 < arg_55_1.time_ and arg_55_1.time_ <= var_58_19 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_21 = arg_55_1:FormatText(StoryNameCfg[319].name)

				arg_55_1.leftNameTxt_.text = var_58_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_22 = arg_55_1:GetWordFromCfg(117131014)
				local var_58_23 = arg_55_1:FormatText(var_58_22.content)

				arg_55_1.text_.text = var_58_23

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_24 = 25
				local var_58_25 = utf8.len(var_58_23)
				local var_58_26 = var_58_24 <= 0 and var_58_20 or var_58_20 * (var_58_25 / var_58_24)

				if var_58_26 > 0 and var_58_20 < var_58_26 then
					arg_55_1.talkMaxDuration = var_58_26

					if var_58_26 + var_58_19 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_26 + var_58_19
					end
				end

				arg_55_1.text_.text = var_58_23
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131014", "story_v_out_117131.awb") ~= 0 then
					local var_58_27 = manager.audio:GetVoiceLength("story_v_out_117131", "117131014", "story_v_out_117131.awb") / 1000

					if var_58_27 + var_58_19 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_27 + var_58_19
					end

					if var_58_22.prefab_name ~= "" and arg_55_1.actors_[var_58_22.prefab_name] ~= nil then
						local var_58_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_22.prefab_name].transform, "story_v_out_117131", "117131014", "story_v_out_117131.awb")

						arg_55_1:RecordAudio("117131014", var_58_28)
						arg_55_1:RecordAudio("117131014", var_58_28)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_117131", "117131014", "story_v_out_117131.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_117131", "117131014", "story_v_out_117131.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_29 = math.max(var_58_20, arg_55_1.talkMaxDuration)

			if var_58_19 <= arg_55_1.time_ and arg_55_1.time_ < var_58_19 + var_58_29 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_19) / var_58_29

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_19 + var_58_29 and arg_55_1.time_ < var_58_19 + var_58_29 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play117131015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 117131015
		arg_59_1.duration_ = 1.6

		local var_59_0 = {
			zh = 1.033,
			ja = 1.6
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
				arg_59_0:Play117131016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1029"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos1029 = var_62_0.localPosition
				var_62_0.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("1029", 2)

				local var_62_2 = var_62_0.childCount

				for iter_62_0 = 0, var_62_2 - 1 do
					local var_62_3 = var_62_0:GetChild(iter_62_0)

					if var_62_3.name == "split_1" or not string.find(var_62_3.name, "split") then
						var_62_3.gameObject:SetActive(true)
					else
						var_62_3.gameObject:SetActive(false)
					end
				end
			end

			local var_62_4 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_4 then
				local var_62_5 = (arg_59_1.time_ - var_62_1) / var_62_4
				local var_62_6 = Vector3.New(-390, -355, -140)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1029, var_62_6, var_62_5)
			end

			if arg_59_1.time_ >= var_62_1 + var_62_4 and arg_59_1.time_ < var_62_1 + var_62_4 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_62_7 = arg_59_1.actors_["1029"]
			local var_62_8 = 0

			if var_62_8 < arg_59_1.time_ and arg_59_1.time_ <= var_62_8 + arg_62_0 and arg_59_1.var_.actorSpriteComps1029 == nil then
				arg_59_1.var_.actorSpriteComps1029 = var_62_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_9 = 0.2

			if var_62_8 <= arg_59_1.time_ and arg_59_1.time_ < var_62_8 + var_62_9 then
				local var_62_10 = (arg_59_1.time_ - var_62_8) / var_62_9

				if arg_59_1.var_.actorSpriteComps1029 then
					for iter_62_1, iter_62_2 in pairs(arg_59_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_62_2 then
							local var_62_11 = Mathf.Lerp(iter_62_2.color.r, 0.5, var_62_10)

							iter_62_2.color = Color.New(var_62_11, var_62_11, var_62_11)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_8 + var_62_9 and arg_59_1.time_ < var_62_8 + var_62_9 + arg_62_0 and arg_59_1.var_.actorSpriteComps1029 then
				local var_62_12 = 0.5

				for iter_62_3, iter_62_4 in pairs(arg_59_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_62_4 then
						iter_62_4.color = Color.New(var_62_12, var_62_12, var_62_12)
					end
				end

				arg_59_1.var_.actorSpriteComps1029 = nil
			end

			local var_62_13 = arg_59_1.actors_["1033"]
			local var_62_14 = 0

			if var_62_14 < arg_59_1.time_ and arg_59_1.time_ <= var_62_14 + arg_62_0 and arg_59_1.var_.actorSpriteComps1033 == nil then
				arg_59_1.var_.actorSpriteComps1033 = var_62_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_15 = 0.2

			if var_62_14 <= arg_59_1.time_ and arg_59_1.time_ < var_62_14 + var_62_15 then
				local var_62_16 = (arg_59_1.time_ - var_62_14) / var_62_15

				if arg_59_1.var_.actorSpriteComps1033 then
					for iter_62_5, iter_62_6 in pairs(arg_59_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_62_6 then
							local var_62_17 = Mathf.Lerp(iter_62_6.color.r, 1, var_62_16)

							iter_62_6.color = Color.New(var_62_17, var_62_17, var_62_17)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_14 + var_62_15 and arg_59_1.time_ < var_62_14 + var_62_15 + arg_62_0 and arg_59_1.var_.actorSpriteComps1033 then
				local var_62_18 = 1

				for iter_62_7, iter_62_8 in pairs(arg_59_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_62_8 then
						iter_62_8.color = Color.New(var_62_18, var_62_18, var_62_18)
					end
				end

				arg_59_1.var_.actorSpriteComps1033 = nil
			end

			local var_62_19 = 0
			local var_62_20 = 0.075

			if var_62_19 < arg_59_1.time_ and arg_59_1.time_ <= var_62_19 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_21 = arg_59_1:FormatText(StoryNameCfg[236].name)

				arg_59_1.leftNameTxt_.text = var_62_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_22 = arg_59_1:GetWordFromCfg(117131015)
				local var_62_23 = arg_59_1:FormatText(var_62_22.content)

				arg_59_1.text_.text = var_62_23

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_24 = 3
				local var_62_25 = utf8.len(var_62_23)
				local var_62_26 = var_62_24 <= 0 and var_62_20 or var_62_20 * (var_62_25 / var_62_24)

				if var_62_26 > 0 and var_62_20 < var_62_26 then
					arg_59_1.talkMaxDuration = var_62_26

					if var_62_26 + var_62_19 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_26 + var_62_19
					end
				end

				arg_59_1.text_.text = var_62_23
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131015", "story_v_out_117131.awb") ~= 0 then
					local var_62_27 = manager.audio:GetVoiceLength("story_v_out_117131", "117131015", "story_v_out_117131.awb") / 1000

					if var_62_27 + var_62_19 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_27 + var_62_19
					end

					if var_62_22.prefab_name ~= "" and arg_59_1.actors_[var_62_22.prefab_name] ~= nil then
						local var_62_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_22.prefab_name].transform, "story_v_out_117131", "117131015", "story_v_out_117131.awb")

						arg_59_1:RecordAudio("117131015", var_62_28)
						arg_59_1:RecordAudio("117131015", var_62_28)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_117131", "117131015", "story_v_out_117131.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_117131", "117131015", "story_v_out_117131.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_29 = math.max(var_62_20, arg_59_1.talkMaxDuration)

			if var_62_19 <= arg_59_1.time_ and arg_59_1.time_ < var_62_19 + var_62_29 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_19) / var_62_29

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_19 + var_62_29 and arg_59_1.time_ < var_62_19 + var_62_29 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play117131016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 117131016
		arg_63_1.duration_ = 8.566

		local var_63_0 = {
			zh = 7.433,
			ja = 8.566
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
				arg_63_0:Play117131017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1029"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1029 = var_66_0.localPosition
				var_66_0.localScale = Vector3.New(1, 1, 1)

				arg_63_1:CheckSpriteTmpPos("1029", 2)

				local var_66_2 = var_66_0.childCount

				for iter_66_0 = 0, var_66_2 - 1 do
					local var_66_3 = var_66_0:GetChild(iter_66_0)

					if var_66_3.name == "split_1" or not string.find(var_66_3.name, "split") then
						var_66_3.gameObject:SetActive(true)
					else
						var_66_3.gameObject:SetActive(false)
					end
				end
			end

			local var_66_4 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_4 then
				local var_66_5 = (arg_63_1.time_ - var_66_1) / var_66_4
				local var_66_6 = Vector3.New(-390, -355, -140)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1029, var_66_6, var_66_5)
			end

			if arg_63_1.time_ >= var_66_1 + var_66_4 and arg_63_1.time_ < var_66_1 + var_66_4 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_66_7 = arg_63_1.actors_["1033"].transform
			local var_66_8 = 0

			if var_66_8 < arg_63_1.time_ and arg_63_1.time_ <= var_66_8 + arg_66_0 then
				arg_63_1.var_.moveOldPos1033 = var_66_7.localPosition
				var_66_7.localScale = Vector3.New(1, 1, 1)

				arg_63_1:CheckSpriteTmpPos("1033", 4)

				local var_66_9 = var_66_7.childCount

				for iter_66_1 = 0, var_66_9 - 1 do
					local var_66_10 = var_66_7:GetChild(iter_66_1)

					if var_66_10.name == "split_6" or not string.find(var_66_10.name, "split") then
						var_66_10.gameObject:SetActive(true)
					else
						var_66_10.gameObject:SetActive(false)
					end
				end
			end

			local var_66_11 = 0.001

			if var_66_8 <= arg_63_1.time_ and arg_63_1.time_ < var_66_8 + var_66_11 then
				local var_66_12 = (arg_63_1.time_ - var_66_8) / var_66_11
				local var_66_13 = Vector3.New(390, -355, -140)

				var_66_7.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1033, var_66_13, var_66_12)
			end

			if arg_63_1.time_ >= var_66_8 + var_66_11 and arg_63_1.time_ < var_66_8 + var_66_11 + arg_66_0 then
				var_66_7.localPosition = Vector3.New(390, -355, -140)
			end

			local var_66_14 = arg_63_1.actors_["1029"]
			local var_66_15 = 0

			if var_66_15 < arg_63_1.time_ and arg_63_1.time_ <= var_66_15 + arg_66_0 and arg_63_1.var_.actorSpriteComps1029 == nil then
				arg_63_1.var_.actorSpriteComps1029 = var_66_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_16 = 0.2

			if var_66_15 <= arg_63_1.time_ and arg_63_1.time_ < var_66_15 + var_66_16 then
				local var_66_17 = (arg_63_1.time_ - var_66_15) / var_66_16

				if arg_63_1.var_.actorSpriteComps1029 then
					for iter_66_2, iter_66_3 in pairs(arg_63_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_66_3 then
							local var_66_18 = Mathf.Lerp(iter_66_3.color.r, 1, var_66_17)

							iter_66_3.color = Color.New(var_66_18, var_66_18, var_66_18)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_15 + var_66_16 and arg_63_1.time_ < var_66_15 + var_66_16 + arg_66_0 and arg_63_1.var_.actorSpriteComps1029 then
				local var_66_19 = 1

				for iter_66_4, iter_66_5 in pairs(arg_63_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_66_5 then
						iter_66_5.color = Color.New(var_66_19, var_66_19, var_66_19)
					end
				end

				arg_63_1.var_.actorSpriteComps1029 = nil
			end

			local var_66_20 = arg_63_1.actors_["1033"]
			local var_66_21 = 0

			if var_66_21 < arg_63_1.time_ and arg_63_1.time_ <= var_66_21 + arg_66_0 and arg_63_1.var_.actorSpriteComps1033 == nil then
				arg_63_1.var_.actorSpriteComps1033 = var_66_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_22 = 0.2

			if var_66_21 <= arg_63_1.time_ and arg_63_1.time_ < var_66_21 + var_66_22 then
				local var_66_23 = (arg_63_1.time_ - var_66_21) / var_66_22

				if arg_63_1.var_.actorSpriteComps1033 then
					for iter_66_6, iter_66_7 in pairs(arg_63_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_66_7 then
							local var_66_24 = Mathf.Lerp(iter_66_7.color.r, 0.5, var_66_23)

							iter_66_7.color = Color.New(var_66_24, var_66_24, var_66_24)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_21 + var_66_22 and arg_63_1.time_ < var_66_21 + var_66_22 + arg_66_0 and arg_63_1.var_.actorSpriteComps1033 then
				local var_66_25 = 0.5

				for iter_66_8, iter_66_9 in pairs(arg_63_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_66_9 then
						iter_66_9.color = Color.New(var_66_25, var_66_25, var_66_25)
					end
				end

				arg_63_1.var_.actorSpriteComps1033 = nil
			end

			local var_66_26 = 0
			local var_66_27 = 0.725

			if var_66_26 < arg_63_1.time_ and arg_63_1.time_ <= var_66_26 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_28 = arg_63_1:FormatText(StoryNameCfg[319].name)

				arg_63_1.leftNameTxt_.text = var_66_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_29 = arg_63_1:GetWordFromCfg(117131016)
				local var_66_30 = arg_63_1:FormatText(var_66_29.content)

				arg_63_1.text_.text = var_66_30

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_31 = 29
				local var_66_32 = utf8.len(var_66_30)
				local var_66_33 = var_66_31 <= 0 and var_66_27 or var_66_27 * (var_66_32 / var_66_31)

				if var_66_33 > 0 and var_66_27 < var_66_33 then
					arg_63_1.talkMaxDuration = var_66_33

					if var_66_33 + var_66_26 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_33 + var_66_26
					end
				end

				arg_63_1.text_.text = var_66_30
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131016", "story_v_out_117131.awb") ~= 0 then
					local var_66_34 = manager.audio:GetVoiceLength("story_v_out_117131", "117131016", "story_v_out_117131.awb") / 1000

					if var_66_34 + var_66_26 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_34 + var_66_26
					end

					if var_66_29.prefab_name ~= "" and arg_63_1.actors_[var_66_29.prefab_name] ~= nil then
						local var_66_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_29.prefab_name].transform, "story_v_out_117131", "117131016", "story_v_out_117131.awb")

						arg_63_1:RecordAudio("117131016", var_66_35)
						arg_63_1:RecordAudio("117131016", var_66_35)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_117131", "117131016", "story_v_out_117131.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_117131", "117131016", "story_v_out_117131.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_36 = math.max(var_66_27, arg_63_1.talkMaxDuration)

			if var_66_26 <= arg_63_1.time_ and arg_63_1.time_ < var_66_26 + var_66_36 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_26) / var_66_36

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_26 + var_66_36 and arg_63_1.time_ < var_66_26 + var_66_36 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play117131017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 117131017
		arg_67_1.duration_ = 7.4

		local var_67_0 = {
			zh = 7.4,
			ja = 6.3
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
				arg_67_0:Play117131018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1029"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1029 = var_70_0.localPosition
				var_70_0.localScale = Vector3.New(1, 1, 1)

				arg_67_1:CheckSpriteTmpPos("1029", 2)

				local var_70_2 = var_70_0.childCount

				for iter_70_0 = 0, var_70_2 - 1 do
					local var_70_3 = var_70_0:GetChild(iter_70_0)

					if var_70_3.name == "split_1" or not string.find(var_70_3.name, "split") then
						var_70_3.gameObject:SetActive(true)
					else
						var_70_3.gameObject:SetActive(false)
					end
				end
			end

			local var_70_4 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_4 then
				local var_70_5 = (arg_67_1.time_ - var_70_1) / var_70_4
				local var_70_6 = Vector3.New(-390, -355, -140)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1029, var_70_6, var_70_5)
			end

			if arg_67_1.time_ >= var_70_1 + var_70_4 and arg_67_1.time_ < var_70_1 + var_70_4 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_70_7 = arg_67_1.actors_["1033"].transform
			local var_70_8 = 0

			if var_70_8 < arg_67_1.time_ and arg_67_1.time_ <= var_70_8 + arg_70_0 then
				arg_67_1.var_.moveOldPos1033 = var_70_7.localPosition
				var_70_7.localScale = Vector3.New(1, 1, 1)

				arg_67_1:CheckSpriteTmpPos("1033", 4)

				local var_70_9 = var_70_7.childCount

				for iter_70_1 = 0, var_70_9 - 1 do
					local var_70_10 = var_70_7:GetChild(iter_70_1)

					if var_70_10.name == "split_1" or not string.find(var_70_10.name, "split") then
						var_70_10.gameObject:SetActive(true)
					else
						var_70_10.gameObject:SetActive(false)
					end
				end
			end

			local var_70_11 = 0.001

			if var_70_8 <= arg_67_1.time_ and arg_67_1.time_ < var_70_8 + var_70_11 then
				local var_70_12 = (arg_67_1.time_ - var_70_8) / var_70_11
				local var_70_13 = Vector3.New(390, -355, -140)

				var_70_7.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1033, var_70_13, var_70_12)
			end

			if arg_67_1.time_ >= var_70_8 + var_70_11 and arg_67_1.time_ < var_70_8 + var_70_11 + arg_70_0 then
				var_70_7.localPosition = Vector3.New(390, -355, -140)
			end

			local var_70_14 = arg_67_1.actors_["1029"]
			local var_70_15 = 0

			if var_70_15 < arg_67_1.time_ and arg_67_1.time_ <= var_70_15 + arg_70_0 and arg_67_1.var_.actorSpriteComps1029 == nil then
				arg_67_1.var_.actorSpriteComps1029 = var_70_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_16 = 0.2

			if var_70_15 <= arg_67_1.time_ and arg_67_1.time_ < var_70_15 + var_70_16 then
				local var_70_17 = (arg_67_1.time_ - var_70_15) / var_70_16

				if arg_67_1.var_.actorSpriteComps1029 then
					for iter_70_2, iter_70_3 in pairs(arg_67_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_70_3 then
							local var_70_18 = Mathf.Lerp(iter_70_3.color.r, 0.5, var_70_17)

							iter_70_3.color = Color.New(var_70_18, var_70_18, var_70_18)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_15 + var_70_16 and arg_67_1.time_ < var_70_15 + var_70_16 + arg_70_0 and arg_67_1.var_.actorSpriteComps1029 then
				local var_70_19 = 0.5

				for iter_70_4, iter_70_5 in pairs(arg_67_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_70_5 then
						iter_70_5.color = Color.New(var_70_19, var_70_19, var_70_19)
					end
				end

				arg_67_1.var_.actorSpriteComps1029 = nil
			end

			local var_70_20 = arg_67_1.actors_["1033"]
			local var_70_21 = 0

			if var_70_21 < arg_67_1.time_ and arg_67_1.time_ <= var_70_21 + arg_70_0 and arg_67_1.var_.actorSpriteComps1033 == nil then
				arg_67_1.var_.actorSpriteComps1033 = var_70_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_22 = 0.2

			if var_70_21 <= arg_67_1.time_ and arg_67_1.time_ < var_70_21 + var_70_22 then
				local var_70_23 = (arg_67_1.time_ - var_70_21) / var_70_22

				if arg_67_1.var_.actorSpriteComps1033 then
					for iter_70_6, iter_70_7 in pairs(arg_67_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_70_7 then
							local var_70_24 = Mathf.Lerp(iter_70_7.color.r, 1, var_70_23)

							iter_70_7.color = Color.New(var_70_24, var_70_24, var_70_24)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_21 + var_70_22 and arg_67_1.time_ < var_70_21 + var_70_22 + arg_70_0 and arg_67_1.var_.actorSpriteComps1033 then
				local var_70_25 = 1

				for iter_70_8, iter_70_9 in pairs(arg_67_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_70_9 then
						iter_70_9.color = Color.New(var_70_25, var_70_25, var_70_25)
					end
				end

				arg_67_1.var_.actorSpriteComps1033 = nil
			end

			local var_70_26 = 0
			local var_70_27 = 0.9

			if var_70_26 < arg_67_1.time_ and arg_67_1.time_ <= var_70_26 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_28 = arg_67_1:FormatText(StoryNameCfg[236].name)

				arg_67_1.leftNameTxt_.text = var_70_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_29 = arg_67_1:GetWordFromCfg(117131017)
				local var_70_30 = arg_67_1:FormatText(var_70_29.content)

				arg_67_1.text_.text = var_70_30

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_31 = 36
				local var_70_32 = utf8.len(var_70_30)
				local var_70_33 = var_70_31 <= 0 and var_70_27 or var_70_27 * (var_70_32 / var_70_31)

				if var_70_33 > 0 and var_70_27 < var_70_33 then
					arg_67_1.talkMaxDuration = var_70_33

					if var_70_33 + var_70_26 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_33 + var_70_26
					end
				end

				arg_67_1.text_.text = var_70_30
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131017", "story_v_out_117131.awb") ~= 0 then
					local var_70_34 = manager.audio:GetVoiceLength("story_v_out_117131", "117131017", "story_v_out_117131.awb") / 1000

					if var_70_34 + var_70_26 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_34 + var_70_26
					end

					if var_70_29.prefab_name ~= "" and arg_67_1.actors_[var_70_29.prefab_name] ~= nil then
						local var_70_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_29.prefab_name].transform, "story_v_out_117131", "117131017", "story_v_out_117131.awb")

						arg_67_1:RecordAudio("117131017", var_70_35)
						arg_67_1:RecordAudio("117131017", var_70_35)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_117131", "117131017", "story_v_out_117131.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_117131", "117131017", "story_v_out_117131.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_36 = math.max(var_70_27, arg_67_1.talkMaxDuration)

			if var_70_26 <= arg_67_1.time_ and arg_67_1.time_ < var_70_26 + var_70_36 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_26) / var_70_36

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_26 + var_70_36 and arg_67_1.time_ < var_70_26 + var_70_36 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play117131018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 117131018
		arg_71_1.duration_ = 4.866

		local var_71_0 = {
			zh = 1.366,
			ja = 4.866
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
				arg_71_0:Play117131019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1029"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1029 = var_74_0.localPosition
				var_74_0.localScale = Vector3.New(1, 1, 1)

				arg_71_1:CheckSpriteTmpPos("1029", 2)

				local var_74_2 = var_74_0.childCount

				for iter_74_0 = 0, var_74_2 - 1 do
					local var_74_3 = var_74_0:GetChild(iter_74_0)

					if var_74_3.name == "split_1" or not string.find(var_74_3.name, "split") then
						var_74_3.gameObject:SetActive(true)
					else
						var_74_3.gameObject:SetActive(false)
					end
				end
			end

			local var_74_4 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_4 then
				local var_74_5 = (arg_71_1.time_ - var_74_1) / var_74_4
				local var_74_6 = Vector3.New(-390, -355, -140)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1029, var_74_6, var_74_5)
			end

			if arg_71_1.time_ >= var_74_1 + var_74_4 and arg_71_1.time_ < var_74_1 + var_74_4 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_74_7 = arg_71_1.actors_["1029"]
			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 and arg_71_1.var_.actorSpriteComps1029 == nil then
				arg_71_1.var_.actorSpriteComps1029 = var_74_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_9 = 0.2

			if var_74_8 <= arg_71_1.time_ and arg_71_1.time_ < var_74_8 + var_74_9 then
				local var_74_10 = (arg_71_1.time_ - var_74_8) / var_74_9

				if arg_71_1.var_.actorSpriteComps1029 then
					for iter_74_1, iter_74_2 in pairs(arg_71_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_74_2 then
							local var_74_11 = Mathf.Lerp(iter_74_2.color.r, 1, var_74_10)

							iter_74_2.color = Color.New(var_74_11, var_74_11, var_74_11)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_8 + var_74_9 and arg_71_1.time_ < var_74_8 + var_74_9 + arg_74_0 and arg_71_1.var_.actorSpriteComps1029 then
				local var_74_12 = 1

				for iter_74_3, iter_74_4 in pairs(arg_71_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_74_4 then
						iter_74_4.color = Color.New(var_74_12, var_74_12, var_74_12)
					end
				end

				arg_71_1.var_.actorSpriteComps1029 = nil
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
							local var_74_17 = Mathf.Lerp(iter_74_6.color.r, 0.5, var_74_16)

							iter_74_6.color = Color.New(var_74_17, var_74_17, var_74_17)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_14 + var_74_15 and arg_71_1.time_ < var_74_14 + var_74_15 + arg_74_0 and arg_71_1.var_.actorSpriteComps1033 then
				local var_74_18 = 0.5

				for iter_74_7, iter_74_8 in pairs(arg_71_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_74_8 then
						iter_74_8.color = Color.New(var_74_18, var_74_18, var_74_18)
					end
				end

				arg_71_1.var_.actorSpriteComps1033 = nil
			end

			local var_74_19 = 0
			local var_74_20 = 0.125

			if var_74_19 < arg_71_1.time_ and arg_71_1.time_ <= var_74_19 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_21 = arg_71_1:FormatText(StoryNameCfg[319].name)

				arg_71_1.leftNameTxt_.text = var_74_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_22 = arg_71_1:GetWordFromCfg(117131018)
				local var_74_23 = arg_71_1:FormatText(var_74_22.content)

				arg_71_1.text_.text = var_74_23

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_24 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131018", "story_v_out_117131.awb") ~= 0 then
					local var_74_27 = manager.audio:GetVoiceLength("story_v_out_117131", "117131018", "story_v_out_117131.awb") / 1000

					if var_74_27 + var_74_19 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_27 + var_74_19
					end

					if var_74_22.prefab_name ~= "" and arg_71_1.actors_[var_74_22.prefab_name] ~= nil then
						local var_74_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_22.prefab_name].transform, "story_v_out_117131", "117131018", "story_v_out_117131.awb")

						arg_71_1:RecordAudio("117131018", var_74_28)
						arg_71_1:RecordAudio("117131018", var_74_28)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_117131", "117131018", "story_v_out_117131.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_117131", "117131018", "story_v_out_117131.awb")
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
	Play117131019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 117131019
		arg_75_1.duration_ = 16.033

		local var_75_0 = {
			zh = 10.7,
			ja = 16.033
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
				arg_75_0:Play117131020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1029"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1029 = var_78_0.localPosition
				var_78_0.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("1029", 2)

				local var_78_2 = var_78_0.childCount

				for iter_78_0 = 0, var_78_2 - 1 do
					local var_78_3 = var_78_0:GetChild(iter_78_0)

					if var_78_3.name == "split_1" or not string.find(var_78_3.name, "split") then
						var_78_3.gameObject:SetActive(true)
					else
						var_78_3.gameObject:SetActive(false)
					end
				end
			end

			local var_78_4 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_4 then
				local var_78_5 = (arg_75_1.time_ - var_78_1) / var_78_4
				local var_78_6 = Vector3.New(-390, -355, -140)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1029, var_78_6, var_78_5)
			end

			if arg_75_1.time_ >= var_78_1 + var_78_4 and arg_75_1.time_ < var_78_1 + var_78_4 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_78_7 = arg_75_1.actors_["1033"].transform
			local var_78_8 = 0

			if var_78_8 < arg_75_1.time_ and arg_75_1.time_ <= var_78_8 + arg_78_0 then
				arg_75_1.var_.moveOldPos1033 = var_78_7.localPosition
				var_78_7.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("1033", 4)

				local var_78_9 = var_78_7.childCount

				for iter_78_1 = 0, var_78_9 - 1 do
					local var_78_10 = var_78_7:GetChild(iter_78_1)

					if var_78_10.name == "split_6" or not string.find(var_78_10.name, "split") then
						var_78_10.gameObject:SetActive(true)
					else
						var_78_10.gameObject:SetActive(false)
					end
				end
			end

			local var_78_11 = 0.001

			if var_78_8 <= arg_75_1.time_ and arg_75_1.time_ < var_78_8 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_8) / var_78_11
				local var_78_13 = Vector3.New(390, -355, -140)

				var_78_7.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1033, var_78_13, var_78_12)
			end

			if arg_75_1.time_ >= var_78_8 + var_78_11 and arg_75_1.time_ < var_78_8 + var_78_11 + arg_78_0 then
				var_78_7.localPosition = Vector3.New(390, -355, -140)
			end

			local var_78_14 = arg_75_1.actors_["1029"]
			local var_78_15 = 0

			if var_78_15 < arg_75_1.time_ and arg_75_1.time_ <= var_78_15 + arg_78_0 and arg_75_1.var_.actorSpriteComps1029 == nil then
				arg_75_1.var_.actorSpriteComps1029 = var_78_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_16 = 0.2

			if var_78_15 <= arg_75_1.time_ and arg_75_1.time_ < var_78_15 + var_78_16 then
				local var_78_17 = (arg_75_1.time_ - var_78_15) / var_78_16

				if arg_75_1.var_.actorSpriteComps1029 then
					for iter_78_2, iter_78_3 in pairs(arg_75_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_78_3 then
							local var_78_18 = Mathf.Lerp(iter_78_3.color.r, 0.5, var_78_17)

							iter_78_3.color = Color.New(var_78_18, var_78_18, var_78_18)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_15 + var_78_16 and arg_75_1.time_ < var_78_15 + var_78_16 + arg_78_0 and arg_75_1.var_.actorSpriteComps1029 then
				local var_78_19 = 0.5

				for iter_78_4, iter_78_5 in pairs(arg_75_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_78_5 then
						iter_78_5.color = Color.New(var_78_19, var_78_19, var_78_19)
					end
				end

				arg_75_1.var_.actorSpriteComps1029 = nil
			end

			local var_78_20 = arg_75_1.actors_["1033"]
			local var_78_21 = 0

			if var_78_21 < arg_75_1.time_ and arg_75_1.time_ <= var_78_21 + arg_78_0 and arg_75_1.var_.actorSpriteComps1033 == nil then
				arg_75_1.var_.actorSpriteComps1033 = var_78_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_22 = 0.2

			if var_78_21 <= arg_75_1.time_ and arg_75_1.time_ < var_78_21 + var_78_22 then
				local var_78_23 = (arg_75_1.time_ - var_78_21) / var_78_22

				if arg_75_1.var_.actorSpriteComps1033 then
					for iter_78_6, iter_78_7 in pairs(arg_75_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_78_7 then
							local var_78_24 = Mathf.Lerp(iter_78_7.color.r, 1, var_78_23)

							iter_78_7.color = Color.New(var_78_24, var_78_24, var_78_24)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_21 + var_78_22 and arg_75_1.time_ < var_78_21 + var_78_22 + arg_78_0 and arg_75_1.var_.actorSpriteComps1033 then
				local var_78_25 = 1

				for iter_78_8, iter_78_9 in pairs(arg_75_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_78_9 then
						iter_78_9.color = Color.New(var_78_25, var_78_25, var_78_25)
					end
				end

				arg_75_1.var_.actorSpriteComps1033 = nil
			end

			local var_78_26 = 0
			local var_78_27 = 1.375

			if var_78_26 < arg_75_1.time_ and arg_75_1.time_ <= var_78_26 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_28 = arg_75_1:FormatText(StoryNameCfg[236].name)

				arg_75_1.leftNameTxt_.text = var_78_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_29 = arg_75_1:GetWordFromCfg(117131019)
				local var_78_30 = arg_75_1:FormatText(var_78_29.content)

				arg_75_1.text_.text = var_78_30

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_31 = 55
				local var_78_32 = utf8.len(var_78_30)
				local var_78_33 = var_78_31 <= 0 and var_78_27 or var_78_27 * (var_78_32 / var_78_31)

				if var_78_33 > 0 and var_78_27 < var_78_33 then
					arg_75_1.talkMaxDuration = var_78_33

					if var_78_33 + var_78_26 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_33 + var_78_26
					end
				end

				arg_75_1.text_.text = var_78_30
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131019", "story_v_out_117131.awb") ~= 0 then
					local var_78_34 = manager.audio:GetVoiceLength("story_v_out_117131", "117131019", "story_v_out_117131.awb") / 1000

					if var_78_34 + var_78_26 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_34 + var_78_26
					end

					if var_78_29.prefab_name ~= "" and arg_75_1.actors_[var_78_29.prefab_name] ~= nil then
						local var_78_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_29.prefab_name].transform, "story_v_out_117131", "117131019", "story_v_out_117131.awb")

						arg_75_1:RecordAudio("117131019", var_78_35)
						arg_75_1:RecordAudio("117131019", var_78_35)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_117131", "117131019", "story_v_out_117131.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_117131", "117131019", "story_v_out_117131.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_36 = math.max(var_78_27, arg_75_1.talkMaxDuration)

			if var_78_26 <= arg_75_1.time_ and arg_75_1.time_ < var_78_26 + var_78_36 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_26) / var_78_36

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_26 + var_78_36 and arg_75_1.time_ < var_78_26 + var_78_36 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play117131020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 117131020
		arg_79_1.duration_ = 18.3

		local var_79_0 = {
			zh = 14.7,
			ja = 18.3
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
				arg_79_0:Play117131021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1029"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1029 = var_82_0.localPosition
				var_82_0.localScale = Vector3.New(1, 1, 1)

				arg_79_1:CheckSpriteTmpPos("1029", 2)

				local var_82_2 = var_82_0.childCount

				for iter_82_0 = 0, var_82_2 - 1 do
					local var_82_3 = var_82_0:GetChild(iter_82_0)

					if var_82_3.name == "split_1" or not string.find(var_82_3.name, "split") then
						var_82_3.gameObject:SetActive(true)
					else
						var_82_3.gameObject:SetActive(false)
					end
				end
			end

			local var_82_4 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_4 then
				local var_82_5 = (arg_79_1.time_ - var_82_1) / var_82_4
				local var_82_6 = Vector3.New(-390, -355, -140)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1029, var_82_6, var_82_5)
			end

			if arg_79_1.time_ >= var_82_1 + var_82_4 and arg_79_1.time_ < var_82_1 + var_82_4 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_82_7 = arg_79_1.actors_["1033"]
			local var_82_8 = 0

			if var_82_8 < arg_79_1.time_ and arg_79_1.time_ <= var_82_8 + arg_82_0 and arg_79_1.var_.actorSpriteComps1033 == nil then
				arg_79_1.var_.actorSpriteComps1033 = var_82_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_9 = 0.0166666666666667

			if var_82_8 <= arg_79_1.time_ and arg_79_1.time_ < var_82_8 + var_82_9 then
				local var_82_10 = (arg_79_1.time_ - var_82_8) / var_82_9

				if arg_79_1.var_.actorSpriteComps1033 then
					for iter_82_1, iter_82_2 in pairs(arg_79_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_82_2 then
							local var_82_11 = Mathf.Lerp(iter_82_2.color.r, 1, var_82_10)

							iter_82_2.color = Color.New(var_82_11, var_82_11, var_82_11)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_8 + var_82_9 and arg_79_1.time_ < var_82_8 + var_82_9 + arg_82_0 and arg_79_1.var_.actorSpriteComps1033 then
				local var_82_12 = 1

				for iter_82_3, iter_82_4 in pairs(arg_79_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_82_4 then
						iter_82_4.color = Color.New(var_82_12, var_82_12, var_82_12)
					end
				end

				arg_79_1.var_.actorSpriteComps1033 = nil
			end

			local var_82_13 = 0
			local var_82_14 = 1.95

			if var_82_13 < arg_79_1.time_ and arg_79_1.time_ <= var_82_13 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_15 = arg_79_1:FormatText(StoryNameCfg[236].name)

				arg_79_1.leftNameTxt_.text = var_82_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_16 = arg_79_1:GetWordFromCfg(117131020)
				local var_82_17 = arg_79_1:FormatText(var_82_16.content)

				arg_79_1.text_.text = var_82_17

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_18 = 78
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131020", "story_v_out_117131.awb") ~= 0 then
					local var_82_21 = manager.audio:GetVoiceLength("story_v_out_117131", "117131020", "story_v_out_117131.awb") / 1000

					if var_82_21 + var_82_13 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_21 + var_82_13
					end

					if var_82_16.prefab_name ~= "" and arg_79_1.actors_[var_82_16.prefab_name] ~= nil then
						local var_82_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_16.prefab_name].transform, "story_v_out_117131", "117131020", "story_v_out_117131.awb")

						arg_79_1:RecordAudio("117131020", var_82_22)
						arg_79_1:RecordAudio("117131020", var_82_22)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_117131", "117131020", "story_v_out_117131.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_117131", "117131020", "story_v_out_117131.awb")
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
	Play117131021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 117131021
		arg_83_1.duration_ = 10.366

		local var_83_0 = {
			zh = 10.366,
			ja = 9.5
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
				arg_83_0:Play117131022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 1.3

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_2 = arg_83_1:FormatText(StoryNameCfg[236].name)

				arg_83_1.leftNameTxt_.text = var_86_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_3 = arg_83_1:GetWordFromCfg(117131021)
				local var_86_4 = arg_83_1:FormatText(var_86_3.content)

				arg_83_1.text_.text = var_86_4

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_5 = 52
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131021", "story_v_out_117131.awb") ~= 0 then
					local var_86_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131021", "story_v_out_117131.awb") / 1000

					if var_86_8 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_8 + var_86_0
					end

					if var_86_3.prefab_name ~= "" and arg_83_1.actors_[var_86_3.prefab_name] ~= nil then
						local var_86_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_3.prefab_name].transform, "story_v_out_117131", "117131021", "story_v_out_117131.awb")

						arg_83_1:RecordAudio("117131021", var_86_9)
						arg_83_1:RecordAudio("117131021", var_86_9)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_117131", "117131021", "story_v_out_117131.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_117131", "117131021", "story_v_out_117131.awb")
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
	Play117131022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 117131022
		arg_87_1.duration_ = 9.5

		local var_87_0 = {
			zh = 9.5,
			ja = 8.1
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
				arg_87_0:Play117131023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 1.225

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[236].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(117131022)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 49
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131022", "story_v_out_117131.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131022", "story_v_out_117131.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_117131", "117131022", "story_v_out_117131.awb")

						arg_87_1:RecordAudio("117131022", var_90_9)
						arg_87_1:RecordAudio("117131022", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_117131", "117131022", "story_v_out_117131.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_117131", "117131022", "story_v_out_117131.awb")
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
	Play117131023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 117131023
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play117131024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1033"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1033 = var_94_0.localPosition
				var_94_0.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("1033", 7)

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
				local var_94_6 = Vector3.New(0, -2000, 0)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1033, var_94_6, var_94_5)
			end

			if arg_91_1.time_ >= var_94_1 + var_94_4 and arg_91_1.time_ < var_94_1 + var_94_4 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(0, -2000, 0)
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
							local var_94_11 = Mathf.Lerp(iter_94_2.color.r, 0.5, var_94_10)

							iter_94_2.color = Color.New(var_94_11, var_94_11, var_94_11)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_8 + var_94_9 and arg_91_1.time_ < var_94_8 + var_94_9 + arg_94_0 and arg_91_1.var_.actorSpriteComps1033 then
				local var_94_12 = 0.5

				for iter_94_3, iter_94_4 in pairs(arg_91_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_94_4 then
						iter_94_4.color = Color.New(var_94_12, var_94_12, var_94_12)
					end
				end

				arg_91_1.var_.actorSpriteComps1033 = nil
			end

			local var_94_13 = 0
			local var_94_14 = 0.975

			if var_94_13 < arg_91_1.time_ and arg_91_1.time_ <= var_94_13 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, false)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_15 = arg_91_1:GetWordFromCfg(117131023)
				local var_94_16 = arg_91_1:FormatText(var_94_15.content)

				arg_91_1.text_.text = var_94_16

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_17 = 39
				local var_94_18 = utf8.len(var_94_16)
				local var_94_19 = var_94_17 <= 0 and var_94_14 or var_94_14 * (var_94_18 / var_94_17)

				if var_94_19 > 0 and var_94_14 < var_94_19 then
					arg_91_1.talkMaxDuration = var_94_19

					if var_94_19 + var_94_13 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_19 + var_94_13
					end
				end

				arg_91_1.text_.text = var_94_16
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_20 = math.max(var_94_14, arg_91_1.talkMaxDuration)

			if var_94_13 <= arg_91_1.time_ and arg_91_1.time_ < var_94_13 + var_94_20 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_13) / var_94_20

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_13 + var_94_20 and arg_91_1.time_ < var_94_13 + var_94_20 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play117131024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 117131024
		arg_95_1.duration_ = 8.966

		local var_95_0 = {
			zh = 8.966,
			ja = 5.766
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
				arg_95_0:Play117131025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1029"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos1029 = var_98_0.localPosition
				var_98_0.localScale = Vector3.New(1, 1, 1)

				arg_95_1:CheckSpriteTmpPos("1029", 2)

				local var_98_2 = var_98_0.childCount

				for iter_98_0 = 0, var_98_2 - 1 do
					local var_98_3 = var_98_0:GetChild(iter_98_0)

					if var_98_3.name == "split_1" or not string.find(var_98_3.name, "split") then
						var_98_3.gameObject:SetActive(true)
					else
						var_98_3.gameObject:SetActive(false)
					end
				end
			end

			local var_98_4 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_4 then
				local var_98_5 = (arg_95_1.time_ - var_98_1) / var_98_4
				local var_98_6 = Vector3.New(-390, -355, -140)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1029, var_98_6, var_98_5)
			end

			if arg_95_1.time_ >= var_98_1 + var_98_4 and arg_95_1.time_ < var_98_1 + var_98_4 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_98_7 = arg_95_1.actors_["1029"]
			local var_98_8 = 0

			if var_98_8 < arg_95_1.time_ and arg_95_1.time_ <= var_98_8 + arg_98_0 and arg_95_1.var_.actorSpriteComps1029 == nil then
				arg_95_1.var_.actorSpriteComps1029 = var_98_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_9 = 0.2

			if var_98_8 <= arg_95_1.time_ and arg_95_1.time_ < var_98_8 + var_98_9 then
				local var_98_10 = (arg_95_1.time_ - var_98_8) / var_98_9

				if arg_95_1.var_.actorSpriteComps1029 then
					for iter_98_1, iter_98_2 in pairs(arg_95_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_98_2 then
							local var_98_11 = Mathf.Lerp(iter_98_2.color.r, 1, var_98_10)

							iter_98_2.color = Color.New(var_98_11, var_98_11, var_98_11)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_8 + var_98_9 and arg_95_1.time_ < var_98_8 + var_98_9 + arg_98_0 and arg_95_1.var_.actorSpriteComps1029 then
				local var_98_12 = 1

				for iter_98_3, iter_98_4 in pairs(arg_95_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_98_4 then
						iter_98_4.color = Color.New(var_98_12, var_98_12, var_98_12)
					end
				end

				arg_95_1.var_.actorSpriteComps1029 = nil
			end

			local var_98_13 = 0
			local var_98_14 = 1

			if var_98_13 < arg_95_1.time_ and arg_95_1.time_ <= var_98_13 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_15 = arg_95_1:FormatText(StoryNameCfg[319].name)

				arg_95_1.leftNameTxt_.text = var_98_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_16 = arg_95_1:GetWordFromCfg(117131024)
				local var_98_17 = arg_95_1:FormatText(var_98_16.content)

				arg_95_1.text_.text = var_98_17

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_18 = 40
				local var_98_19 = utf8.len(var_98_17)
				local var_98_20 = var_98_18 <= 0 and var_98_14 or var_98_14 * (var_98_19 / var_98_18)

				if var_98_20 > 0 and var_98_14 < var_98_20 then
					arg_95_1.talkMaxDuration = var_98_20

					if var_98_20 + var_98_13 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_20 + var_98_13
					end
				end

				arg_95_1.text_.text = var_98_17
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131024", "story_v_out_117131.awb") ~= 0 then
					local var_98_21 = manager.audio:GetVoiceLength("story_v_out_117131", "117131024", "story_v_out_117131.awb") / 1000

					if var_98_21 + var_98_13 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_21 + var_98_13
					end

					if var_98_16.prefab_name ~= "" and arg_95_1.actors_[var_98_16.prefab_name] ~= nil then
						local var_98_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_16.prefab_name].transform, "story_v_out_117131", "117131024", "story_v_out_117131.awb")

						arg_95_1:RecordAudio("117131024", var_98_22)
						arg_95_1:RecordAudio("117131024", var_98_22)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_117131", "117131024", "story_v_out_117131.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_117131", "117131024", "story_v_out_117131.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_23 = math.max(var_98_14, arg_95_1.talkMaxDuration)

			if var_98_13 <= arg_95_1.time_ and arg_95_1.time_ < var_98_13 + var_98_23 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_13) / var_98_23

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_13 + var_98_23 and arg_95_1.time_ < var_98_13 + var_98_23 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play117131025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 117131025
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play117131026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1029"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1029 = var_102_0.localPosition
				var_102_0.localScale = Vector3.New(1, 1, 1)

				arg_99_1:CheckSpriteTmpPos("1029", 2)

				local var_102_2 = var_102_0.childCount

				for iter_102_0 = 0, var_102_2 - 1 do
					local var_102_3 = var_102_0:GetChild(iter_102_0)

					if var_102_3.name == "split_1" or not string.find(var_102_3.name, "split") then
						var_102_3.gameObject:SetActive(true)
					else
						var_102_3.gameObject:SetActive(false)
					end
				end
			end

			local var_102_4 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_4 then
				local var_102_5 = (arg_99_1.time_ - var_102_1) / var_102_4
				local var_102_6 = Vector3.New(-390, -355, -140)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1029, var_102_6, var_102_5)
			end

			if arg_99_1.time_ >= var_102_1 + var_102_4 and arg_99_1.time_ < var_102_1 + var_102_4 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_102_7 = arg_99_1.actors_["1033"].transform
			local var_102_8 = 0

			if var_102_8 < arg_99_1.time_ and arg_99_1.time_ <= var_102_8 + arg_102_0 then
				arg_99_1.var_.moveOldPos1033 = var_102_7.localPosition
				var_102_7.localScale = Vector3.New(1, 1, 1)

				arg_99_1:CheckSpriteTmpPos("1033", 4)

				local var_102_9 = var_102_7.childCount

				for iter_102_1 = 0, var_102_9 - 1 do
					local var_102_10 = var_102_7:GetChild(iter_102_1)

					if var_102_10.name == "split_4" or not string.find(var_102_10.name, "split") then
						var_102_10.gameObject:SetActive(true)
					else
						var_102_10.gameObject:SetActive(false)
					end
				end
			end

			local var_102_11 = 0.001

			if var_102_8 <= arg_99_1.time_ and arg_99_1.time_ < var_102_8 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_8) / var_102_11
				local var_102_13 = Vector3.New(390, -355, -140)

				var_102_7.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1033, var_102_13, var_102_12)
			end

			if arg_99_1.time_ >= var_102_8 + var_102_11 and arg_99_1.time_ < var_102_8 + var_102_11 + arg_102_0 then
				var_102_7.localPosition = Vector3.New(390, -355, -140)
			end

			local var_102_14 = arg_99_1.actors_["1029"]
			local var_102_15 = 0

			if var_102_15 < arg_99_1.time_ and arg_99_1.time_ <= var_102_15 + arg_102_0 and arg_99_1.var_.actorSpriteComps1029 == nil then
				arg_99_1.var_.actorSpriteComps1029 = var_102_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_16 = 0.2

			if var_102_15 <= arg_99_1.time_ and arg_99_1.time_ < var_102_15 + var_102_16 then
				local var_102_17 = (arg_99_1.time_ - var_102_15) / var_102_16

				if arg_99_1.var_.actorSpriteComps1029 then
					for iter_102_2, iter_102_3 in pairs(arg_99_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_102_3 then
							local var_102_18 = Mathf.Lerp(iter_102_3.color.r, 0.5, var_102_17)

							iter_102_3.color = Color.New(var_102_18, var_102_18, var_102_18)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_15 + var_102_16 and arg_99_1.time_ < var_102_15 + var_102_16 + arg_102_0 and arg_99_1.var_.actorSpriteComps1029 then
				local var_102_19 = 0.5

				for iter_102_4, iter_102_5 in pairs(arg_99_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_102_5 then
						iter_102_5.color = Color.New(var_102_19, var_102_19, var_102_19)
					end
				end

				arg_99_1.var_.actorSpriteComps1029 = nil
			end

			local var_102_20 = 0
			local var_102_21 = 0.475

			if var_102_20 < arg_99_1.time_ and arg_99_1.time_ <= var_102_20 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, false)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_22 = arg_99_1:GetWordFromCfg(117131025)
				local var_102_23 = arg_99_1:FormatText(var_102_22.content)

				arg_99_1.text_.text = var_102_23

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_24 = 19
				local var_102_25 = utf8.len(var_102_23)
				local var_102_26 = var_102_24 <= 0 and var_102_21 or var_102_21 * (var_102_25 / var_102_24)

				if var_102_26 > 0 and var_102_21 < var_102_26 then
					arg_99_1.talkMaxDuration = var_102_26

					if var_102_26 + var_102_20 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_26 + var_102_20
					end
				end

				arg_99_1.text_.text = var_102_23
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_27 = math.max(var_102_21, arg_99_1.talkMaxDuration)

			if var_102_20 <= arg_99_1.time_ and arg_99_1.time_ < var_102_20 + var_102_27 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_20) / var_102_27

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_20 + var_102_27 and arg_99_1.time_ < var_102_20 + var_102_27 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play117131026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 117131026
		arg_103_1.duration_ = 9.666

		local var_103_0 = {
			zh = 6.666,
			ja = 9.666
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
				arg_103_0:Play117131027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1029"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos1029 = var_106_0.localPosition
				var_106_0.localScale = Vector3.New(1, 1, 1)

				arg_103_1:CheckSpriteTmpPos("1029", 2)

				local var_106_2 = var_106_0.childCount

				for iter_106_0 = 0, var_106_2 - 1 do
					local var_106_3 = var_106_0:GetChild(iter_106_0)

					if var_106_3.name == "split_1" or not string.find(var_106_3.name, "split") then
						var_106_3.gameObject:SetActive(true)
					else
						var_106_3.gameObject:SetActive(false)
					end
				end
			end

			local var_106_4 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_4 then
				local var_106_5 = (arg_103_1.time_ - var_106_1) / var_106_4
				local var_106_6 = Vector3.New(-390, -355, -140)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1029, var_106_6, var_106_5)
			end

			if arg_103_1.time_ >= var_106_1 + var_106_4 and arg_103_1.time_ < var_106_1 + var_106_4 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_106_7 = arg_103_1.actors_["1033"].transform
			local var_106_8 = 0

			if var_106_8 < arg_103_1.time_ and arg_103_1.time_ <= var_106_8 + arg_106_0 then
				arg_103_1.var_.moveOldPos1033 = var_106_7.localPosition
				var_106_7.localScale = Vector3.New(1, 1, 1)

				arg_103_1:CheckSpriteTmpPos("1033", 4)

				local var_106_9 = var_106_7.childCount

				for iter_106_1 = 0, var_106_9 - 1 do
					local var_106_10 = var_106_7:GetChild(iter_106_1)

					if var_106_10.name == "split_6" or not string.find(var_106_10.name, "split") then
						var_106_10.gameObject:SetActive(true)
					else
						var_106_10.gameObject:SetActive(false)
					end
				end
			end

			local var_106_11 = 0.001

			if var_106_8 <= arg_103_1.time_ and arg_103_1.time_ < var_106_8 + var_106_11 then
				local var_106_12 = (arg_103_1.time_ - var_106_8) / var_106_11
				local var_106_13 = Vector3.New(390, -355, -140)

				var_106_7.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1033, var_106_13, var_106_12)
			end

			if arg_103_1.time_ >= var_106_8 + var_106_11 and arg_103_1.time_ < var_106_8 + var_106_11 + arg_106_0 then
				var_106_7.localPosition = Vector3.New(390, -355, -140)
			end

			local var_106_14 = arg_103_1.actors_["1033"]
			local var_106_15 = 0

			if var_106_15 < arg_103_1.time_ and arg_103_1.time_ <= var_106_15 + arg_106_0 and arg_103_1.var_.actorSpriteComps1033 == nil then
				arg_103_1.var_.actorSpriteComps1033 = var_106_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_16 = 0.0166666666666667

			if var_106_15 <= arg_103_1.time_ and arg_103_1.time_ < var_106_15 + var_106_16 then
				local var_106_17 = (arg_103_1.time_ - var_106_15) / var_106_16

				if arg_103_1.var_.actorSpriteComps1033 then
					for iter_106_2, iter_106_3 in pairs(arg_103_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_106_3 then
							local var_106_18 = Mathf.Lerp(iter_106_3.color.r, 1, var_106_17)

							iter_106_3.color = Color.New(var_106_18, var_106_18, var_106_18)
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_15 + var_106_16 and arg_103_1.time_ < var_106_15 + var_106_16 + arg_106_0 and arg_103_1.var_.actorSpriteComps1033 then
				local var_106_19 = 1

				for iter_106_4, iter_106_5 in pairs(arg_103_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_106_5 then
						iter_106_5.color = Color.New(var_106_19, var_106_19, var_106_19)
					end
				end

				arg_103_1.var_.actorSpriteComps1033 = nil
			end

			local var_106_20 = 0
			local var_106_21 = 0.775

			if var_106_20 < arg_103_1.time_ and arg_103_1.time_ <= var_106_20 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_22 = arg_103_1:FormatText(StoryNameCfg[236].name)

				arg_103_1.leftNameTxt_.text = var_106_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_23 = arg_103_1:GetWordFromCfg(117131026)
				local var_106_24 = arg_103_1:FormatText(var_106_23.content)

				arg_103_1.text_.text = var_106_24

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_25 = 31
				local var_106_26 = utf8.len(var_106_24)
				local var_106_27 = var_106_25 <= 0 and var_106_21 or var_106_21 * (var_106_26 / var_106_25)

				if var_106_27 > 0 and var_106_21 < var_106_27 then
					arg_103_1.talkMaxDuration = var_106_27

					if var_106_27 + var_106_20 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_27 + var_106_20
					end
				end

				arg_103_1.text_.text = var_106_24
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131026", "story_v_out_117131.awb") ~= 0 then
					local var_106_28 = manager.audio:GetVoiceLength("story_v_out_117131", "117131026", "story_v_out_117131.awb") / 1000

					if var_106_28 + var_106_20 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_28 + var_106_20
					end

					if var_106_23.prefab_name ~= "" and arg_103_1.actors_[var_106_23.prefab_name] ~= nil then
						local var_106_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_23.prefab_name].transform, "story_v_out_117131", "117131026", "story_v_out_117131.awb")

						arg_103_1:RecordAudio("117131026", var_106_29)
						arg_103_1:RecordAudio("117131026", var_106_29)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_117131", "117131026", "story_v_out_117131.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_117131", "117131026", "story_v_out_117131.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_30 = math.max(var_106_21, arg_103_1.talkMaxDuration)

			if var_106_20 <= arg_103_1.time_ and arg_103_1.time_ < var_106_20 + var_106_30 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_20) / var_106_30

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_20 + var_106_30 and arg_103_1.time_ < var_106_20 + var_106_30 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play117131027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 117131027
		arg_107_1.duration_ = 12.866

		local var_107_0 = {
			zh = 10.2,
			ja = 12.866
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
				arg_107_0:Play117131028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1029"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos1029 = var_110_0.localPosition
				var_110_0.localScale = Vector3.New(1, 1, 1)

				arg_107_1:CheckSpriteTmpPos("1029", 2)

				local var_110_2 = var_110_0.childCount

				for iter_110_0 = 0, var_110_2 - 1 do
					local var_110_3 = var_110_0:GetChild(iter_110_0)

					if var_110_3.name == "split_5" or not string.find(var_110_3.name, "split") then
						var_110_3.gameObject:SetActive(true)
					else
						var_110_3.gameObject:SetActive(false)
					end
				end
			end

			local var_110_4 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_4 then
				local var_110_5 = (arg_107_1.time_ - var_110_1) / var_110_4
				local var_110_6 = Vector3.New(-390, -355, -140)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1029, var_110_6, var_110_5)
			end

			if arg_107_1.time_ >= var_110_1 + var_110_4 and arg_107_1.time_ < var_110_1 + var_110_4 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_110_7 = arg_107_1.actors_["1029"]
			local var_110_8 = 0

			if var_110_8 < arg_107_1.time_ and arg_107_1.time_ <= var_110_8 + arg_110_0 and arg_107_1.var_.actorSpriteComps1029 == nil then
				arg_107_1.var_.actorSpriteComps1029 = var_110_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_9 = 0.2

			if var_110_8 <= arg_107_1.time_ and arg_107_1.time_ < var_110_8 + var_110_9 then
				local var_110_10 = (arg_107_1.time_ - var_110_8) / var_110_9

				if arg_107_1.var_.actorSpriteComps1029 then
					for iter_110_1, iter_110_2 in pairs(arg_107_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_110_2 then
							local var_110_11 = Mathf.Lerp(iter_110_2.color.r, 1, var_110_10)

							iter_110_2.color = Color.New(var_110_11, var_110_11, var_110_11)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_8 + var_110_9 and arg_107_1.time_ < var_110_8 + var_110_9 + arg_110_0 and arg_107_1.var_.actorSpriteComps1029 then
				local var_110_12 = 1

				for iter_110_3, iter_110_4 in pairs(arg_107_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_110_4 then
						iter_110_4.color = Color.New(var_110_12, var_110_12, var_110_12)
					end
				end

				arg_107_1.var_.actorSpriteComps1029 = nil
			end

			local var_110_13 = arg_107_1.actors_["1033"]
			local var_110_14 = 0

			if var_110_14 < arg_107_1.time_ and arg_107_1.time_ <= var_110_14 + arg_110_0 and arg_107_1.var_.actorSpriteComps1033 == nil then
				arg_107_1.var_.actorSpriteComps1033 = var_110_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_15 = 0.2

			if var_110_14 <= arg_107_1.time_ and arg_107_1.time_ < var_110_14 + var_110_15 then
				local var_110_16 = (arg_107_1.time_ - var_110_14) / var_110_15

				if arg_107_1.var_.actorSpriteComps1033 then
					for iter_110_5, iter_110_6 in pairs(arg_107_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_110_6 then
							local var_110_17 = Mathf.Lerp(iter_110_6.color.r, 0.5, var_110_16)

							iter_110_6.color = Color.New(var_110_17, var_110_17, var_110_17)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_14 + var_110_15 and arg_107_1.time_ < var_110_14 + var_110_15 + arg_110_0 and arg_107_1.var_.actorSpriteComps1033 then
				local var_110_18 = 0.5

				for iter_110_7, iter_110_8 in pairs(arg_107_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_110_8 then
						iter_110_8.color = Color.New(var_110_18, var_110_18, var_110_18)
					end
				end

				arg_107_1.var_.actorSpriteComps1033 = nil
			end

			local var_110_19 = 0
			local var_110_20 = 1.225

			if var_110_19 < arg_107_1.time_ and arg_107_1.time_ <= var_110_19 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_21 = arg_107_1:FormatText(StoryNameCfg[319].name)

				arg_107_1.leftNameTxt_.text = var_110_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_22 = arg_107_1:GetWordFromCfg(117131027)
				local var_110_23 = arg_107_1:FormatText(var_110_22.content)

				arg_107_1.text_.text = var_110_23

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_24 = 49
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131027", "story_v_out_117131.awb") ~= 0 then
					local var_110_27 = manager.audio:GetVoiceLength("story_v_out_117131", "117131027", "story_v_out_117131.awb") / 1000

					if var_110_27 + var_110_19 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_27 + var_110_19
					end

					if var_110_22.prefab_name ~= "" and arg_107_1.actors_[var_110_22.prefab_name] ~= nil then
						local var_110_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_22.prefab_name].transform, "story_v_out_117131", "117131027", "story_v_out_117131.awb")

						arg_107_1:RecordAudio("117131027", var_110_28)
						arg_107_1:RecordAudio("117131027", var_110_28)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_117131", "117131027", "story_v_out_117131.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_117131", "117131027", "story_v_out_117131.awb")
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
	Play117131028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 117131028
		arg_111_1.duration_ = 6.133

		local var_111_0 = {
			zh = 2.866,
			ja = 6.133
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
				arg_111_0:Play117131029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1029"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos1029 = var_114_0.localPosition
				var_114_0.localScale = Vector3.New(1, 1, 1)

				arg_111_1:CheckSpriteTmpPos("1029", 2)

				local var_114_2 = var_114_0.childCount

				for iter_114_0 = 0, var_114_2 - 1 do
					local var_114_3 = var_114_0:GetChild(iter_114_0)

					if var_114_3.name == "split_5" or not string.find(var_114_3.name, "split") then
						var_114_3.gameObject:SetActive(true)
					else
						var_114_3.gameObject:SetActive(false)
					end
				end
			end

			local var_114_4 = 0.001

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_4 then
				local var_114_5 = (arg_111_1.time_ - var_114_1) / var_114_4
				local var_114_6 = Vector3.New(-390, -355, -140)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1029, var_114_6, var_114_5)
			end

			if arg_111_1.time_ >= var_114_1 + var_114_4 and arg_111_1.time_ < var_114_1 + var_114_4 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_114_7 = arg_111_1.actors_["1033"].transform
			local var_114_8 = 0

			if var_114_8 < arg_111_1.time_ and arg_111_1.time_ <= var_114_8 + arg_114_0 then
				arg_111_1.var_.moveOldPos1033 = var_114_7.localPosition
				var_114_7.localScale = Vector3.New(1, 1, 1)

				arg_111_1:CheckSpriteTmpPos("1033", 4)

				local var_114_9 = var_114_7.childCount

				for iter_114_1 = 0, var_114_9 - 1 do
					local var_114_10 = var_114_7:GetChild(iter_114_1)

					if var_114_10.name == "split_6" or not string.find(var_114_10.name, "split") then
						var_114_10.gameObject:SetActive(true)
					else
						var_114_10.gameObject:SetActive(false)
					end
				end
			end

			local var_114_11 = 0.001

			if var_114_8 <= arg_111_1.time_ and arg_111_1.time_ < var_114_8 + var_114_11 then
				local var_114_12 = (arg_111_1.time_ - var_114_8) / var_114_11
				local var_114_13 = Vector3.New(390, -355, -140)

				var_114_7.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1033, var_114_13, var_114_12)
			end

			if arg_111_1.time_ >= var_114_8 + var_114_11 and arg_111_1.time_ < var_114_8 + var_114_11 + arg_114_0 then
				var_114_7.localPosition = Vector3.New(390, -355, -140)
			end

			local var_114_14 = arg_111_1.actors_["1029"]
			local var_114_15 = 0

			if var_114_15 < arg_111_1.time_ and arg_111_1.time_ <= var_114_15 + arg_114_0 and arg_111_1.var_.actorSpriteComps1029 == nil then
				arg_111_1.var_.actorSpriteComps1029 = var_114_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_16 = 0.2

			if var_114_15 <= arg_111_1.time_ and arg_111_1.time_ < var_114_15 + var_114_16 then
				local var_114_17 = (arg_111_1.time_ - var_114_15) / var_114_16

				if arg_111_1.var_.actorSpriteComps1029 then
					for iter_114_2, iter_114_3 in pairs(arg_111_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_114_3 then
							local var_114_18 = Mathf.Lerp(iter_114_3.color.r, 0.5, var_114_17)

							iter_114_3.color = Color.New(var_114_18, var_114_18, var_114_18)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_15 + var_114_16 and arg_111_1.time_ < var_114_15 + var_114_16 + arg_114_0 and arg_111_1.var_.actorSpriteComps1029 then
				local var_114_19 = 0.5

				for iter_114_4, iter_114_5 in pairs(arg_111_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_114_5 then
						iter_114_5.color = Color.New(var_114_19, var_114_19, var_114_19)
					end
				end

				arg_111_1.var_.actorSpriteComps1029 = nil
			end

			local var_114_20 = arg_111_1.actors_["1033"]
			local var_114_21 = 0

			if var_114_21 < arg_111_1.time_ and arg_111_1.time_ <= var_114_21 + arg_114_0 and arg_111_1.var_.actorSpriteComps1033 == nil then
				arg_111_1.var_.actorSpriteComps1033 = var_114_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_22 = 0.2

			if var_114_21 <= arg_111_1.time_ and arg_111_1.time_ < var_114_21 + var_114_22 then
				local var_114_23 = (arg_111_1.time_ - var_114_21) / var_114_22

				if arg_111_1.var_.actorSpriteComps1033 then
					for iter_114_6, iter_114_7 in pairs(arg_111_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_114_7 then
							local var_114_24 = Mathf.Lerp(iter_114_7.color.r, 1, var_114_23)

							iter_114_7.color = Color.New(var_114_24, var_114_24, var_114_24)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_21 + var_114_22 and arg_111_1.time_ < var_114_21 + var_114_22 + arg_114_0 and arg_111_1.var_.actorSpriteComps1033 then
				local var_114_25 = 1

				for iter_114_8, iter_114_9 in pairs(arg_111_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_114_9 then
						iter_114_9.color = Color.New(var_114_25, var_114_25, var_114_25)
					end
				end

				arg_111_1.var_.actorSpriteComps1033 = nil
			end

			local var_114_26 = 0
			local var_114_27 = 0.325

			if var_114_26 < arg_111_1.time_ and arg_111_1.time_ <= var_114_26 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_28 = arg_111_1:FormatText(StoryNameCfg[236].name)

				arg_111_1.leftNameTxt_.text = var_114_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_29 = arg_111_1:GetWordFromCfg(117131028)
				local var_114_30 = arg_111_1:FormatText(var_114_29.content)

				arg_111_1.text_.text = var_114_30

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_31 = 13
				local var_114_32 = utf8.len(var_114_30)
				local var_114_33 = var_114_31 <= 0 and var_114_27 or var_114_27 * (var_114_32 / var_114_31)

				if var_114_33 > 0 and var_114_27 < var_114_33 then
					arg_111_1.talkMaxDuration = var_114_33

					if var_114_33 + var_114_26 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_33 + var_114_26
					end
				end

				arg_111_1.text_.text = var_114_30
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131028", "story_v_out_117131.awb") ~= 0 then
					local var_114_34 = manager.audio:GetVoiceLength("story_v_out_117131", "117131028", "story_v_out_117131.awb") / 1000

					if var_114_34 + var_114_26 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_34 + var_114_26
					end

					if var_114_29.prefab_name ~= "" and arg_111_1.actors_[var_114_29.prefab_name] ~= nil then
						local var_114_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_29.prefab_name].transform, "story_v_out_117131", "117131028", "story_v_out_117131.awb")

						arg_111_1:RecordAudio("117131028", var_114_35)
						arg_111_1:RecordAudio("117131028", var_114_35)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_117131", "117131028", "story_v_out_117131.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_117131", "117131028", "story_v_out_117131.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_36 = math.max(var_114_27, arg_111_1.talkMaxDuration)

			if var_114_26 <= arg_111_1.time_ and arg_111_1.time_ < var_114_26 + var_114_36 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_26) / var_114_36

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_26 + var_114_36 and arg_111_1.time_ < var_114_26 + var_114_36 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play117131029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 117131029
		arg_115_1.duration_ = 2.2

		local var_115_0 = {
			zh = 2.2,
			ja = 1.8
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
				arg_115_0:Play117131030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1029"].transform
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.var_.moveOldPos1029 = var_118_0.localPosition
				var_118_0.localScale = Vector3.New(1, 1, 1)

				arg_115_1:CheckSpriteTmpPos("1029", 2)

				local var_118_2 = var_118_0.childCount

				for iter_118_0 = 0, var_118_2 - 1 do
					local var_118_3 = var_118_0:GetChild(iter_118_0)

					if var_118_3.name == "split_1" or not string.find(var_118_3.name, "split") then
						var_118_3.gameObject:SetActive(true)
					else
						var_118_3.gameObject:SetActive(false)
					end
				end
			end

			local var_118_4 = 0.001

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_4 then
				local var_118_5 = (arg_115_1.time_ - var_118_1) / var_118_4
				local var_118_6 = Vector3.New(-390, -355, -140)

				var_118_0.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1029, var_118_6, var_118_5)
			end

			if arg_115_1.time_ >= var_118_1 + var_118_4 and arg_115_1.time_ < var_118_1 + var_118_4 + arg_118_0 then
				var_118_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_118_7 = arg_115_1.actors_["1029"]
			local var_118_8 = 0

			if var_118_8 < arg_115_1.time_ and arg_115_1.time_ <= var_118_8 + arg_118_0 and arg_115_1.var_.actorSpriteComps1029 == nil then
				arg_115_1.var_.actorSpriteComps1029 = var_118_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_9 = 0.2

			if var_118_8 <= arg_115_1.time_ and arg_115_1.time_ < var_118_8 + var_118_9 then
				local var_118_10 = (arg_115_1.time_ - var_118_8) / var_118_9

				if arg_115_1.var_.actorSpriteComps1029 then
					for iter_118_1, iter_118_2 in pairs(arg_115_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_118_2 then
							local var_118_11 = Mathf.Lerp(iter_118_2.color.r, 1, var_118_10)

							iter_118_2.color = Color.New(var_118_11, var_118_11, var_118_11)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_8 + var_118_9 and arg_115_1.time_ < var_118_8 + var_118_9 + arg_118_0 and arg_115_1.var_.actorSpriteComps1029 then
				local var_118_12 = 1

				for iter_118_3, iter_118_4 in pairs(arg_115_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_118_4 then
						iter_118_4.color = Color.New(var_118_12, var_118_12, var_118_12)
					end
				end

				arg_115_1.var_.actorSpriteComps1029 = nil
			end

			local var_118_13 = arg_115_1.actors_["1033"]
			local var_118_14 = 0

			if var_118_14 < arg_115_1.time_ and arg_115_1.time_ <= var_118_14 + arg_118_0 and arg_115_1.var_.actorSpriteComps1033 == nil then
				arg_115_1.var_.actorSpriteComps1033 = var_118_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_15 = 0.2

			if var_118_14 <= arg_115_1.time_ and arg_115_1.time_ < var_118_14 + var_118_15 then
				local var_118_16 = (arg_115_1.time_ - var_118_14) / var_118_15

				if arg_115_1.var_.actorSpriteComps1033 then
					for iter_118_5, iter_118_6 in pairs(arg_115_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_118_6 then
							local var_118_17 = Mathf.Lerp(iter_118_6.color.r, 0.5, var_118_16)

							iter_118_6.color = Color.New(var_118_17, var_118_17, var_118_17)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_14 + var_118_15 and arg_115_1.time_ < var_118_14 + var_118_15 + arg_118_0 and arg_115_1.var_.actorSpriteComps1033 then
				local var_118_18 = 0.5

				for iter_118_7, iter_118_8 in pairs(arg_115_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_118_8 then
						iter_118_8.color = Color.New(var_118_18, var_118_18, var_118_18)
					end
				end

				arg_115_1.var_.actorSpriteComps1033 = nil
			end

			local var_118_19 = 0
			local var_118_20 = 0.225

			if var_118_19 < arg_115_1.time_ and arg_115_1.time_ <= var_118_19 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_21 = arg_115_1:FormatText(StoryNameCfg[319].name)

				arg_115_1.leftNameTxt_.text = var_118_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_22 = arg_115_1:GetWordFromCfg(117131029)
				local var_118_23 = arg_115_1:FormatText(var_118_22.content)

				arg_115_1.text_.text = var_118_23

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_24 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131029", "story_v_out_117131.awb") ~= 0 then
					local var_118_27 = manager.audio:GetVoiceLength("story_v_out_117131", "117131029", "story_v_out_117131.awb") / 1000

					if var_118_27 + var_118_19 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_27 + var_118_19
					end

					if var_118_22.prefab_name ~= "" and arg_115_1.actors_[var_118_22.prefab_name] ~= nil then
						local var_118_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_22.prefab_name].transform, "story_v_out_117131", "117131029", "story_v_out_117131.awb")

						arg_115_1:RecordAudio("117131029", var_118_28)
						arg_115_1:RecordAudio("117131029", var_118_28)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_117131", "117131029", "story_v_out_117131.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_117131", "117131029", "story_v_out_117131.awb")
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
	Play117131030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 117131030
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play117131031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1029"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				local var_122_2 = var_122_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_122_2 then
					arg_119_1.var_.alphaOldValue1029 = var_122_2.alpha
					arg_119_1.var_.characterEffect1029 = var_122_2
				end

				arg_119_1.var_.alphaOldValue1029 = 1
			end

			local var_122_3 = 0.333333333333333

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_3 then
				local var_122_4 = (arg_119_1.time_ - var_122_1) / var_122_3
				local var_122_5 = Mathf.Lerp(arg_119_1.var_.alphaOldValue1029, 0, var_122_4)

				if arg_119_1.var_.characterEffect1029 then
					arg_119_1.var_.characterEffect1029.alpha = var_122_5
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_3 and arg_119_1.time_ < var_122_1 + var_122_3 + arg_122_0 and arg_119_1.var_.characterEffect1029 then
				arg_119_1.var_.characterEffect1029.alpha = 0
			end

			local var_122_6 = arg_119_1.actors_["1033"]
			local var_122_7 = 0

			if var_122_7 < arg_119_1.time_ and arg_119_1.time_ <= var_122_7 + arg_122_0 then
				local var_122_8 = var_122_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_122_8 then
					arg_119_1.var_.alphaOldValue1033 = var_122_8.alpha
					arg_119_1.var_.characterEffect1033 = var_122_8
				end

				arg_119_1.var_.alphaOldValue1033 = 1
			end

			local var_122_9 = 0.333333333333333

			if var_122_7 <= arg_119_1.time_ and arg_119_1.time_ < var_122_7 + var_122_9 then
				local var_122_10 = (arg_119_1.time_ - var_122_7) / var_122_9
				local var_122_11 = Mathf.Lerp(arg_119_1.var_.alphaOldValue1033, 0, var_122_10)

				if arg_119_1.var_.characterEffect1033 then
					arg_119_1.var_.characterEffect1033.alpha = var_122_11
				end
			end

			if arg_119_1.time_ >= var_122_7 + var_122_9 and arg_119_1.time_ < var_122_7 + var_122_9 + arg_122_0 and arg_119_1.var_.characterEffect1033 then
				arg_119_1.var_.characterEffect1033.alpha = 0
			end

			local var_122_12 = 0
			local var_122_13 = 1.125

			if var_122_12 < arg_119_1.time_ and arg_119_1.time_ <= var_122_12 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, false)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_14 = arg_119_1:GetWordFromCfg(117131030)
				local var_122_15 = arg_119_1:FormatText(var_122_14.content)

				arg_119_1.text_.text = var_122_15

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_16 = 45
				local var_122_17 = utf8.len(var_122_15)
				local var_122_18 = var_122_16 <= 0 and var_122_13 or var_122_13 * (var_122_17 / var_122_16)

				if var_122_18 > 0 and var_122_13 < var_122_18 then
					arg_119_1.talkMaxDuration = var_122_18

					if var_122_18 + var_122_12 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_18 + var_122_12
					end
				end

				arg_119_1.text_.text = var_122_15
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_19 = math.max(var_122_13, arg_119_1.talkMaxDuration)

			if var_122_12 <= arg_119_1.time_ and arg_119_1.time_ < var_122_12 + var_122_19 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_12) / var_122_19

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_12 + var_122_19 and arg_119_1.time_ < var_122_12 + var_122_19 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play117131031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 117131031
		arg_123_1.duration_ = 9

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play117131032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = "ST04a"

			if arg_123_1.bgs_[var_126_0] == nil then
				local var_126_1 = Object.Instantiate(arg_123_1.paintGo_)

				var_126_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_126_0)
				var_126_1.name = var_126_0
				var_126_1.transform.parent = arg_123_1.stage_.transform
				var_126_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_123_1.bgs_[var_126_0] = var_126_1
			end

			local var_126_2 = 2

			if var_126_2 < arg_123_1.time_ and arg_123_1.time_ <= var_126_2 + arg_126_0 then
				local var_126_3 = manager.ui.mainCamera.transform.localPosition
				local var_126_4 = Vector3.New(0, 0, 10) + Vector3.New(var_126_3.x, var_126_3.y, 0)
				local var_126_5 = arg_123_1.bgs_.ST04a

				var_126_5.transform.localPosition = var_126_4
				var_126_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_126_6 = var_126_5:GetComponent("SpriteRenderer")

				if var_126_6 and var_126_6.sprite then
					local var_126_7 = (var_126_5.transform.localPosition - var_126_3).z
					local var_126_8 = manager.ui.mainCameraCom_
					local var_126_9 = 2 * var_126_7 * Mathf.Tan(var_126_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_126_10 = var_126_9 * var_126_8.aspect
					local var_126_11 = var_126_6.sprite.bounds.size.x
					local var_126_12 = var_126_6.sprite.bounds.size.y
					local var_126_13 = var_126_10 / var_126_11
					local var_126_14 = var_126_9 / var_126_12
					local var_126_15 = var_126_14 < var_126_13 and var_126_13 or var_126_14

					var_126_5.transform.localScale = Vector3.New(var_126_15, var_126_15, 0)
				end

				for iter_126_0, iter_126_1 in pairs(arg_123_1.bgs_) do
					if iter_126_0 ~= "ST04a" then
						iter_126_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_126_16 = 0

			if var_126_16 < arg_123_1.time_ and arg_123_1.time_ <= var_126_16 + arg_126_0 then
				arg_123_1.mask_.enabled = true
				arg_123_1.mask_.raycastTarget = true

				arg_123_1:SetGaussion(false)
			end

			local var_126_17 = 2

			if var_126_16 <= arg_123_1.time_ and arg_123_1.time_ < var_126_16 + var_126_17 then
				local var_126_18 = (arg_123_1.time_ - var_126_16) / var_126_17
				local var_126_19 = Color.New(0, 0, 0)

				var_126_19.a = Mathf.Lerp(0, 1, var_126_18)
				arg_123_1.mask_.color = var_126_19
			end

			if arg_123_1.time_ >= var_126_16 + var_126_17 and arg_123_1.time_ < var_126_16 + var_126_17 + arg_126_0 then
				local var_126_20 = Color.New(0, 0, 0)

				var_126_20.a = 1
				arg_123_1.mask_.color = var_126_20
			end

			local var_126_21 = 2

			if var_126_21 < arg_123_1.time_ and arg_123_1.time_ <= var_126_21 + arg_126_0 then
				arg_123_1.mask_.enabled = true
				arg_123_1.mask_.raycastTarget = true

				arg_123_1:SetGaussion(false)
			end

			local var_126_22 = 2

			if var_126_21 <= arg_123_1.time_ and arg_123_1.time_ < var_126_21 + var_126_22 then
				local var_126_23 = (arg_123_1.time_ - var_126_21) / var_126_22
				local var_126_24 = Color.New(0, 0, 0)

				var_126_24.a = Mathf.Lerp(1, 0, var_126_23)
				arg_123_1.mask_.color = var_126_24
			end

			if arg_123_1.time_ >= var_126_21 + var_126_22 and arg_123_1.time_ < var_126_21 + var_126_22 + arg_126_0 then
				local var_126_25 = Color.New(0, 0, 0)
				local var_126_26 = 0

				arg_123_1.mask_.enabled = false
				var_126_25.a = var_126_26
				arg_123_1.mask_.color = var_126_25
			end

			if arg_123_1.frameCnt_ <= 1 then
				arg_123_1.dialog_:SetActive(false)
			end

			local var_126_27 = 4
			local var_126_28 = 1.225

			if var_126_27 < arg_123_1.time_ and arg_123_1.time_ <= var_126_27 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0

				arg_123_1.dialog_:SetActive(true)

				local var_126_29 = LeanTween.value(arg_123_1.dialog_, 0, 1, 0.3)

				var_126_29:setOnUpdate(LuaHelper.FloatAction(function(arg_127_0)
					arg_123_1.dialogCg_.alpha = arg_127_0
				end))
				var_126_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_123_1.dialog_)
					var_126_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_123_1.duration_ = arg_123_1.duration_ + 0.3

				SetActive(arg_123_1.leftNameGo_, false)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_30 = arg_123_1:GetWordFromCfg(117131031)
				local var_126_31 = arg_123_1:FormatText(var_126_30.content)

				arg_123_1.text_.text = var_126_31

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_32 = 49
				local var_126_33 = utf8.len(var_126_31)
				local var_126_34 = var_126_32 <= 0 and var_126_28 or var_126_28 * (var_126_33 / var_126_32)

				if var_126_34 > 0 and var_126_28 < var_126_34 then
					arg_123_1.talkMaxDuration = var_126_34
					var_126_27 = var_126_27 + 0.3

					if var_126_34 + var_126_27 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_34 + var_126_27
					end
				end

				arg_123_1.text_.text = var_126_31
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_35 = var_126_27 + 0.3
			local var_126_36 = math.max(var_126_28, arg_123_1.talkMaxDuration)

			if var_126_35 <= arg_123_1.time_ and arg_123_1.time_ < var_126_35 + var_126_36 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_35) / var_126_36

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_35 + var_126_36 and arg_123_1.time_ < var_126_35 + var_126_36 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play117131032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 117131032
		arg_129_1.duration_ = 4.7

		local var_129_0 = {
			zh = 3.633,
			ja = 4.7
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
				arg_129_0:Play117131033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1029"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos1029 = var_132_0.localPosition
				var_132_0.localScale = Vector3.New(1, 1, 1)

				arg_129_1:CheckSpriteTmpPos("1029", 2)

				local var_132_2 = var_132_0.childCount

				for iter_132_0 = 0, var_132_2 - 1 do
					local var_132_3 = var_132_0:GetChild(iter_132_0)

					if var_132_3.name == "split_1" or not string.find(var_132_3.name, "split") then
						var_132_3.gameObject:SetActive(true)
					else
						var_132_3.gameObject:SetActive(false)
					end
				end
			end

			local var_132_4 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_4 then
				local var_132_5 = (arg_129_1.time_ - var_132_1) / var_132_4
				local var_132_6 = Vector3.New(-390, -355, -140)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1029, var_132_6, var_132_5)
			end

			if arg_129_1.time_ >= var_132_1 + var_132_4 and arg_129_1.time_ < var_132_1 + var_132_4 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_132_7 = arg_129_1.actors_["1029"]
			local var_132_8 = 0

			if var_132_8 < arg_129_1.time_ and arg_129_1.time_ <= var_132_8 + arg_132_0 and arg_129_1.var_.actorSpriteComps1029 == nil then
				arg_129_1.var_.actorSpriteComps1029 = var_132_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_132_9 = 0.2

			if var_132_8 <= arg_129_1.time_ and arg_129_1.time_ < var_132_8 + var_132_9 then
				local var_132_10 = (arg_129_1.time_ - var_132_8) / var_132_9

				if arg_129_1.var_.actorSpriteComps1029 then
					for iter_132_1, iter_132_2 in pairs(arg_129_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_132_2 then
							local var_132_11 = Mathf.Lerp(iter_132_2.color.r, 1, var_132_10)

							iter_132_2.color = Color.New(var_132_11, var_132_11, var_132_11)
						end
					end
				end
			end

			if arg_129_1.time_ >= var_132_8 + var_132_9 and arg_129_1.time_ < var_132_8 + var_132_9 + arg_132_0 and arg_129_1.var_.actorSpriteComps1029 then
				local var_132_12 = 1

				for iter_132_3, iter_132_4 in pairs(arg_129_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_132_4 then
						iter_132_4.color = Color.New(var_132_12, var_132_12, var_132_12)
					end
				end

				arg_129_1.var_.actorSpriteComps1029 = nil
			end

			local var_132_13 = arg_129_1.actors_["1029"]
			local var_132_14 = 0

			if var_132_14 < arg_129_1.time_ and arg_129_1.time_ <= var_132_14 + arg_132_0 then
				local var_132_15 = var_132_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_132_15 then
					arg_129_1.var_.alphaOldValue1029 = var_132_15.alpha
					arg_129_1.var_.characterEffect1029 = var_132_15
				end

				arg_129_1.var_.alphaOldValue1029 = 0
			end

			local var_132_16 = 0.333333333333333

			if var_132_14 <= arg_129_1.time_ and arg_129_1.time_ < var_132_14 + var_132_16 then
				local var_132_17 = (arg_129_1.time_ - var_132_14) / var_132_16
				local var_132_18 = Mathf.Lerp(arg_129_1.var_.alphaOldValue1029, 1, var_132_17)

				if arg_129_1.var_.characterEffect1029 then
					arg_129_1.var_.characterEffect1029.alpha = var_132_18
				end
			end

			if arg_129_1.time_ >= var_132_14 + var_132_16 and arg_129_1.time_ < var_132_14 + var_132_16 + arg_132_0 and arg_129_1.var_.characterEffect1029 then
				arg_129_1.var_.characterEffect1029.alpha = 1
			end

			local var_132_19 = 0
			local var_132_20 = 0.325

			if var_132_19 < arg_129_1.time_ and arg_129_1.time_ <= var_132_19 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_21 = arg_129_1:FormatText(StoryNameCfg[319].name)

				arg_129_1.leftNameTxt_.text = var_132_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_22 = arg_129_1:GetWordFromCfg(117131032)
				local var_132_23 = arg_129_1:FormatText(var_132_22.content)

				arg_129_1.text_.text = var_132_23

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_24 = 13
				local var_132_25 = utf8.len(var_132_23)
				local var_132_26 = var_132_24 <= 0 and var_132_20 or var_132_20 * (var_132_25 / var_132_24)

				if var_132_26 > 0 and var_132_20 < var_132_26 then
					arg_129_1.talkMaxDuration = var_132_26

					if var_132_26 + var_132_19 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_26 + var_132_19
					end
				end

				arg_129_1.text_.text = var_132_23
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131032", "story_v_out_117131.awb") ~= 0 then
					local var_132_27 = manager.audio:GetVoiceLength("story_v_out_117131", "117131032", "story_v_out_117131.awb") / 1000

					if var_132_27 + var_132_19 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_27 + var_132_19
					end

					if var_132_22.prefab_name ~= "" and arg_129_1.actors_[var_132_22.prefab_name] ~= nil then
						local var_132_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_22.prefab_name].transform, "story_v_out_117131", "117131032", "story_v_out_117131.awb")

						arg_129_1:RecordAudio("117131032", var_132_28)
						arg_129_1:RecordAudio("117131032", var_132_28)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_117131", "117131032", "story_v_out_117131.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_117131", "117131032", "story_v_out_117131.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_29 = math.max(var_132_20, arg_129_1.talkMaxDuration)

			if var_132_19 <= arg_129_1.time_ and arg_129_1.time_ < var_132_19 + var_132_29 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_19) / var_132_29

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_19 + var_132_29 and arg_129_1.time_ < var_132_19 + var_132_29 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play117131033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 117131033
		arg_133_1.duration_ = 7.866

		local var_133_0 = {
			zh = 7.866,
			ja = 7.7
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
				arg_133_0:Play117131034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = "10034"

			if arg_133_1.actors_[var_136_0] == nil then
				local var_136_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_136_0), arg_133_1.canvasGo_.transform)

				var_136_1.transform:SetSiblingIndex(1)

				var_136_1.name = var_136_0
				var_136_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_133_1.actors_[var_136_0] = var_136_1
			end

			local var_136_2 = arg_133_1.actors_["10034"].transform
			local var_136_3 = 0

			if var_136_3 < arg_133_1.time_ and arg_133_1.time_ <= var_136_3 + arg_136_0 then
				arg_133_1.var_.moveOldPos10034 = var_136_2.localPosition
				var_136_2.localScale = Vector3.New(1, 1, 1)

				arg_133_1:CheckSpriteTmpPos("10034", 4)

				local var_136_4 = var_136_2.childCount

				for iter_136_0 = 0, var_136_4 - 1 do
					local var_136_5 = var_136_2:GetChild(iter_136_0)

					if var_136_5.name == "split_2" or not string.find(var_136_5.name, "split") then
						var_136_5.gameObject:SetActive(true)
					else
						var_136_5.gameObject:SetActive(false)
					end
				end
			end

			local var_136_6 = 0.001

			if var_136_3 <= arg_133_1.time_ and arg_133_1.time_ < var_136_3 + var_136_6 then
				local var_136_7 = (arg_133_1.time_ - var_136_3) / var_136_6
				local var_136_8 = Vector3.New(390, -415, -290)

				var_136_2.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos10034, var_136_8, var_136_7)
			end

			if arg_133_1.time_ >= var_136_3 + var_136_6 and arg_133_1.time_ < var_136_3 + var_136_6 + arg_136_0 then
				var_136_2.localPosition = Vector3.New(390, -415, -290)
			end

			local var_136_9 = arg_133_1.actors_["1029"].transform
			local var_136_10 = 0

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 then
				arg_133_1.var_.moveOldPos1029 = var_136_9.localPosition
				var_136_9.localScale = Vector3.New(1, 1, 1)

				arg_133_1:CheckSpriteTmpPos("1029", 2)

				local var_136_11 = var_136_9.childCount

				for iter_136_1 = 0, var_136_11 - 1 do
					local var_136_12 = var_136_9:GetChild(iter_136_1)

					if var_136_12.name == "split_1" or not string.find(var_136_12.name, "split") then
						var_136_12.gameObject:SetActive(true)
					else
						var_136_12.gameObject:SetActive(false)
					end
				end
			end

			local var_136_13 = 0.001

			if var_136_10 <= arg_133_1.time_ and arg_133_1.time_ < var_136_10 + var_136_13 then
				local var_136_14 = (arg_133_1.time_ - var_136_10) / var_136_13
				local var_136_15 = Vector3.New(-390, -355, -140)

				var_136_9.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1029, var_136_15, var_136_14)
			end

			if arg_133_1.time_ >= var_136_10 + var_136_13 and arg_133_1.time_ < var_136_10 + var_136_13 + arg_136_0 then
				var_136_9.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_136_16 = arg_133_1.actors_["1029"]
			local var_136_17 = 0

			if var_136_17 < arg_133_1.time_ and arg_133_1.time_ <= var_136_17 + arg_136_0 and arg_133_1.var_.actorSpriteComps1029 == nil then
				arg_133_1.var_.actorSpriteComps1029 = var_136_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_136_18 = 0.2

			if var_136_17 <= arg_133_1.time_ and arg_133_1.time_ < var_136_17 + var_136_18 then
				local var_136_19 = (arg_133_1.time_ - var_136_17) / var_136_18

				if arg_133_1.var_.actorSpriteComps1029 then
					for iter_136_2, iter_136_3 in pairs(arg_133_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_136_3 then
							local var_136_20 = Mathf.Lerp(iter_136_3.color.r, 0.5, var_136_19)

							iter_136_3.color = Color.New(var_136_20, var_136_20, var_136_20)
						end
					end
				end
			end

			if arg_133_1.time_ >= var_136_17 + var_136_18 and arg_133_1.time_ < var_136_17 + var_136_18 + arg_136_0 and arg_133_1.var_.actorSpriteComps1029 then
				local var_136_21 = 0.5

				for iter_136_4, iter_136_5 in pairs(arg_133_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_136_5 then
						iter_136_5.color = Color.New(var_136_21, var_136_21, var_136_21)
					end
				end

				arg_133_1.var_.actorSpriteComps1029 = nil
			end

			local var_136_22 = arg_133_1.actors_["10034"]
			local var_136_23 = 0

			if var_136_23 < arg_133_1.time_ and arg_133_1.time_ <= var_136_23 + arg_136_0 and arg_133_1.var_.actorSpriteComps10034 == nil then
				arg_133_1.var_.actorSpriteComps10034 = var_136_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_136_24 = 0.2

			if var_136_23 <= arg_133_1.time_ and arg_133_1.time_ < var_136_23 + var_136_24 then
				local var_136_25 = (arg_133_1.time_ - var_136_23) / var_136_24

				if arg_133_1.var_.actorSpriteComps10034 then
					for iter_136_6, iter_136_7 in pairs(arg_133_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_136_7 then
							local var_136_26 = Mathf.Lerp(iter_136_7.color.r, 1, var_136_25)

							iter_136_7.color = Color.New(var_136_26, var_136_26, var_136_26)
						end
					end
				end
			end

			if arg_133_1.time_ >= var_136_23 + var_136_24 and arg_133_1.time_ < var_136_23 + var_136_24 + arg_136_0 and arg_133_1.var_.actorSpriteComps10034 then
				local var_136_27 = 1

				for iter_136_8, iter_136_9 in pairs(arg_133_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_136_9 then
						iter_136_9.color = Color.New(var_136_27, var_136_27, var_136_27)
					end
				end

				arg_133_1.var_.actorSpriteComps10034 = nil
			end

			local var_136_28 = 0
			local var_136_29 = 0.725

			if var_136_28 < arg_133_1.time_ and arg_133_1.time_ <= var_136_28 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_30 = arg_133_1:FormatText(StoryNameCfg[367].name)

				arg_133_1.leftNameTxt_.text = var_136_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_31 = arg_133_1:GetWordFromCfg(117131033)
				local var_136_32 = arg_133_1:FormatText(var_136_31.content)

				arg_133_1.text_.text = var_136_32

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_33 = 29
				local var_136_34 = utf8.len(var_136_32)
				local var_136_35 = var_136_33 <= 0 and var_136_29 or var_136_29 * (var_136_34 / var_136_33)

				if var_136_35 > 0 and var_136_29 < var_136_35 then
					arg_133_1.talkMaxDuration = var_136_35

					if var_136_35 + var_136_28 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_35 + var_136_28
					end
				end

				arg_133_1.text_.text = var_136_32
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131033", "story_v_out_117131.awb") ~= 0 then
					local var_136_36 = manager.audio:GetVoiceLength("story_v_out_117131", "117131033", "story_v_out_117131.awb") / 1000

					if var_136_36 + var_136_28 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_36 + var_136_28
					end

					if var_136_31.prefab_name ~= "" and arg_133_1.actors_[var_136_31.prefab_name] ~= nil then
						local var_136_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_31.prefab_name].transform, "story_v_out_117131", "117131033", "story_v_out_117131.awb")

						arg_133_1:RecordAudio("117131033", var_136_37)
						arg_133_1:RecordAudio("117131033", var_136_37)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_117131", "117131033", "story_v_out_117131.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_117131", "117131033", "story_v_out_117131.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_38 = math.max(var_136_29, arg_133_1.talkMaxDuration)

			if var_136_28 <= arg_133_1.time_ and arg_133_1.time_ < var_136_28 + var_136_38 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_28) / var_136_38

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_28 + var_136_38 and arg_133_1.time_ < var_136_28 + var_136_38 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play117131034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 117131034
		arg_137_1.duration_ = 7.066

		local var_137_0 = {
			zh = 6.2,
			ja = 7.066
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
				arg_137_0:Play117131035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 0.6

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_2 = arg_137_1:FormatText(StoryNameCfg[367].name)

				arg_137_1.leftNameTxt_.text = var_140_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_3 = arg_137_1:GetWordFromCfg(117131034)
				local var_140_4 = arg_137_1:FormatText(var_140_3.content)

				arg_137_1.text_.text = var_140_4

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_5 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131034", "story_v_out_117131.awb") ~= 0 then
					local var_140_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131034", "story_v_out_117131.awb") / 1000

					if var_140_8 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_8 + var_140_0
					end

					if var_140_3.prefab_name ~= "" and arg_137_1.actors_[var_140_3.prefab_name] ~= nil then
						local var_140_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_3.prefab_name].transform, "story_v_out_117131", "117131034", "story_v_out_117131.awb")

						arg_137_1:RecordAudio("117131034", var_140_9)
						arg_137_1:RecordAudio("117131034", var_140_9)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_117131", "117131034", "story_v_out_117131.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_117131", "117131034", "story_v_out_117131.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_10 = math.max(var_140_1, arg_137_1.talkMaxDuration)

			if var_140_0 <= arg_137_1.time_ and arg_137_1.time_ < var_140_0 + var_140_10 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_0) / var_140_10

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_0 + var_140_10 and arg_137_1.time_ < var_140_0 + var_140_10 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play117131035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 117131035
		arg_141_1.duration_ = 12

		local var_141_0 = {
			zh = 10.933,
			ja = 12
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
				arg_141_0:Play117131036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["10034"].transform
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos10034 = var_144_0.localPosition
				var_144_0.localScale = Vector3.New(1, 1, 1)

				arg_141_1:CheckSpriteTmpPos("10034", 4)

				local var_144_2 = var_144_0.childCount

				for iter_144_0 = 0, var_144_2 - 1 do
					local var_144_3 = var_144_0:GetChild(iter_144_0)

					if var_144_3.name == "split_2" or not string.find(var_144_3.name, "split") then
						var_144_3.gameObject:SetActive(true)
					else
						var_144_3.gameObject:SetActive(false)
					end
				end
			end

			local var_144_4 = 0.001

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_4 then
				local var_144_5 = (arg_141_1.time_ - var_144_1) / var_144_4
				local var_144_6 = Vector3.New(390, -415, -290)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos10034, var_144_6, var_144_5)
			end

			if arg_141_1.time_ >= var_144_1 + var_144_4 and arg_141_1.time_ < var_144_1 + var_144_4 + arg_144_0 then
				var_144_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_144_7 = arg_141_1.actors_["1029"].transform
			local var_144_8 = 0

			if var_144_8 < arg_141_1.time_ and arg_141_1.time_ <= var_144_8 + arg_144_0 then
				arg_141_1.var_.moveOldPos1029 = var_144_7.localPosition
				var_144_7.localScale = Vector3.New(1, 1, 1)

				arg_141_1:CheckSpriteTmpPos("1029", 2)

				local var_144_9 = var_144_7.childCount

				for iter_144_1 = 0, var_144_9 - 1 do
					local var_144_10 = var_144_7:GetChild(iter_144_1)

					if var_144_10.name == "split_1" or not string.find(var_144_10.name, "split") then
						var_144_10.gameObject:SetActive(true)
					else
						var_144_10.gameObject:SetActive(false)
					end
				end
			end

			local var_144_11 = 0.001

			if var_144_8 <= arg_141_1.time_ and arg_141_1.time_ < var_144_8 + var_144_11 then
				local var_144_12 = (arg_141_1.time_ - var_144_8) / var_144_11
				local var_144_13 = Vector3.New(-390, -355, -140)

				var_144_7.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1029, var_144_13, var_144_12)
			end

			if arg_141_1.time_ >= var_144_8 + var_144_11 and arg_141_1.time_ < var_144_8 + var_144_11 + arg_144_0 then
				var_144_7.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_144_14 = arg_141_1.actors_["1029"]
			local var_144_15 = 0

			if var_144_15 < arg_141_1.time_ and arg_141_1.time_ <= var_144_15 + arg_144_0 and arg_141_1.var_.actorSpriteComps1029 == nil then
				arg_141_1.var_.actorSpriteComps1029 = var_144_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_144_16 = 0.2

			if var_144_15 <= arg_141_1.time_ and arg_141_1.time_ < var_144_15 + var_144_16 then
				local var_144_17 = (arg_141_1.time_ - var_144_15) / var_144_16

				if arg_141_1.var_.actorSpriteComps1029 then
					for iter_144_2, iter_144_3 in pairs(arg_141_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_144_3 then
							local var_144_18 = Mathf.Lerp(iter_144_3.color.r, 1, var_144_17)

							iter_144_3.color = Color.New(var_144_18, var_144_18, var_144_18)
						end
					end
				end
			end

			if arg_141_1.time_ >= var_144_15 + var_144_16 and arg_141_1.time_ < var_144_15 + var_144_16 + arg_144_0 and arg_141_1.var_.actorSpriteComps1029 then
				local var_144_19 = 1

				for iter_144_4, iter_144_5 in pairs(arg_141_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_144_5 then
						iter_144_5.color = Color.New(var_144_19, var_144_19, var_144_19)
					end
				end

				arg_141_1.var_.actorSpriteComps1029 = nil
			end

			local var_144_20 = arg_141_1.actors_["10034"]
			local var_144_21 = 0

			if var_144_21 < arg_141_1.time_ and arg_141_1.time_ <= var_144_21 + arg_144_0 and arg_141_1.var_.actorSpriteComps10034 == nil then
				arg_141_1.var_.actorSpriteComps10034 = var_144_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_144_22 = 0.2

			if var_144_21 <= arg_141_1.time_ and arg_141_1.time_ < var_144_21 + var_144_22 then
				local var_144_23 = (arg_141_1.time_ - var_144_21) / var_144_22

				if arg_141_1.var_.actorSpriteComps10034 then
					for iter_144_6, iter_144_7 in pairs(arg_141_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_144_7 then
							local var_144_24 = Mathf.Lerp(iter_144_7.color.r, 0.5, var_144_23)

							iter_144_7.color = Color.New(var_144_24, var_144_24, var_144_24)
						end
					end
				end
			end

			if arg_141_1.time_ >= var_144_21 + var_144_22 and arg_141_1.time_ < var_144_21 + var_144_22 + arg_144_0 and arg_141_1.var_.actorSpriteComps10034 then
				local var_144_25 = 0.5

				for iter_144_8, iter_144_9 in pairs(arg_141_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_144_9 then
						iter_144_9.color = Color.New(var_144_25, var_144_25, var_144_25)
					end
				end

				arg_141_1.var_.actorSpriteComps10034 = nil
			end

			local var_144_26 = 0
			local var_144_27 = 1.325

			if var_144_26 < arg_141_1.time_ and arg_141_1.time_ <= var_144_26 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_28 = arg_141_1:FormatText(StoryNameCfg[319].name)

				arg_141_1.leftNameTxt_.text = var_144_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_29 = arg_141_1:GetWordFromCfg(117131035)
				local var_144_30 = arg_141_1:FormatText(var_144_29.content)

				arg_141_1.text_.text = var_144_30

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_31 = 52
				local var_144_32 = utf8.len(var_144_30)
				local var_144_33 = var_144_31 <= 0 and var_144_27 or var_144_27 * (var_144_32 / var_144_31)

				if var_144_33 > 0 and var_144_27 < var_144_33 then
					arg_141_1.talkMaxDuration = var_144_33

					if var_144_33 + var_144_26 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_33 + var_144_26
					end
				end

				arg_141_1.text_.text = var_144_30
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131035", "story_v_out_117131.awb") ~= 0 then
					local var_144_34 = manager.audio:GetVoiceLength("story_v_out_117131", "117131035", "story_v_out_117131.awb") / 1000

					if var_144_34 + var_144_26 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_34 + var_144_26
					end

					if var_144_29.prefab_name ~= "" and arg_141_1.actors_[var_144_29.prefab_name] ~= nil then
						local var_144_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_29.prefab_name].transform, "story_v_out_117131", "117131035", "story_v_out_117131.awb")

						arg_141_1:RecordAudio("117131035", var_144_35)
						arg_141_1:RecordAudio("117131035", var_144_35)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_117131", "117131035", "story_v_out_117131.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_117131", "117131035", "story_v_out_117131.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_36 = math.max(var_144_27, arg_141_1.talkMaxDuration)

			if var_144_26 <= arg_141_1.time_ and arg_141_1.time_ < var_144_26 + var_144_36 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_26) / var_144_36

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_26 + var_144_36 and arg_141_1.time_ < var_144_26 + var_144_36 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play117131036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 117131036
		arg_145_1.duration_ = 14.866

		local var_145_0 = {
			zh = 13.033,
			ja = 14.866
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
				arg_145_0:Play117131037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["10034"].transform
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1.var_.moveOldPos10034 = var_148_0.localPosition
				var_148_0.localScale = Vector3.New(1, 1, 1)

				arg_145_1:CheckSpriteTmpPos("10034", 4)

				local var_148_2 = var_148_0.childCount

				for iter_148_0 = 0, var_148_2 - 1 do
					local var_148_3 = var_148_0:GetChild(iter_148_0)

					if var_148_3.name == "split_2" or not string.find(var_148_3.name, "split") then
						var_148_3.gameObject:SetActive(true)
					else
						var_148_3.gameObject:SetActive(false)
					end
				end
			end

			local var_148_4 = 0.001

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_4 then
				local var_148_5 = (arg_145_1.time_ - var_148_1) / var_148_4
				local var_148_6 = Vector3.New(390, -415, -290)

				var_148_0.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos10034, var_148_6, var_148_5)
			end

			if arg_145_1.time_ >= var_148_1 + var_148_4 and arg_145_1.time_ < var_148_1 + var_148_4 + arg_148_0 then
				var_148_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_148_7 = arg_145_1.actors_["1029"].transform
			local var_148_8 = 0

			if var_148_8 < arg_145_1.time_ and arg_145_1.time_ <= var_148_8 + arg_148_0 then
				arg_145_1.var_.moveOldPos1029 = var_148_7.localPosition
				var_148_7.localScale = Vector3.New(1, 1, 1)

				arg_145_1:CheckSpriteTmpPos("1029", 2)

				local var_148_9 = var_148_7.childCount

				for iter_148_1 = 0, var_148_9 - 1 do
					local var_148_10 = var_148_7:GetChild(iter_148_1)

					if var_148_10.name == "split_1" or not string.find(var_148_10.name, "split") then
						var_148_10.gameObject:SetActive(true)
					else
						var_148_10.gameObject:SetActive(false)
					end
				end
			end

			local var_148_11 = 0.001

			if var_148_8 <= arg_145_1.time_ and arg_145_1.time_ < var_148_8 + var_148_11 then
				local var_148_12 = (arg_145_1.time_ - var_148_8) / var_148_11
				local var_148_13 = Vector3.New(-390, -355, -140)

				var_148_7.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1029, var_148_13, var_148_12)
			end

			if arg_145_1.time_ >= var_148_8 + var_148_11 and arg_145_1.time_ < var_148_8 + var_148_11 + arg_148_0 then
				var_148_7.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_148_14 = arg_145_1.actors_["1029"]
			local var_148_15 = 0

			if var_148_15 < arg_145_1.time_ and arg_145_1.time_ <= var_148_15 + arg_148_0 and arg_145_1.var_.actorSpriteComps1029 == nil then
				arg_145_1.var_.actorSpriteComps1029 = var_148_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_148_16 = 0.2

			if var_148_15 <= arg_145_1.time_ and arg_145_1.time_ < var_148_15 + var_148_16 then
				local var_148_17 = (arg_145_1.time_ - var_148_15) / var_148_16

				if arg_145_1.var_.actorSpriteComps1029 then
					for iter_148_2, iter_148_3 in pairs(arg_145_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_148_3 then
							local var_148_18 = Mathf.Lerp(iter_148_3.color.r, 0.5, var_148_17)

							iter_148_3.color = Color.New(var_148_18, var_148_18, var_148_18)
						end
					end
				end
			end

			if arg_145_1.time_ >= var_148_15 + var_148_16 and arg_145_1.time_ < var_148_15 + var_148_16 + arg_148_0 and arg_145_1.var_.actorSpriteComps1029 then
				local var_148_19 = 0.5

				for iter_148_4, iter_148_5 in pairs(arg_145_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_148_5 then
						iter_148_5.color = Color.New(var_148_19, var_148_19, var_148_19)
					end
				end

				arg_145_1.var_.actorSpriteComps1029 = nil
			end

			local var_148_20 = arg_145_1.actors_["10034"]
			local var_148_21 = 0

			if var_148_21 < arg_145_1.time_ and arg_145_1.time_ <= var_148_21 + arg_148_0 and arg_145_1.var_.actorSpriteComps10034 == nil then
				arg_145_1.var_.actorSpriteComps10034 = var_148_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_148_22 = 0.2

			if var_148_21 <= arg_145_1.time_ and arg_145_1.time_ < var_148_21 + var_148_22 then
				local var_148_23 = (arg_145_1.time_ - var_148_21) / var_148_22

				if arg_145_1.var_.actorSpriteComps10034 then
					for iter_148_6, iter_148_7 in pairs(arg_145_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_148_7 then
							local var_148_24 = Mathf.Lerp(iter_148_7.color.r, 1, var_148_23)

							iter_148_7.color = Color.New(var_148_24, var_148_24, var_148_24)
						end
					end
				end
			end

			if arg_145_1.time_ >= var_148_21 + var_148_22 and arg_145_1.time_ < var_148_21 + var_148_22 + arg_148_0 and arg_145_1.var_.actorSpriteComps10034 then
				local var_148_25 = 1

				for iter_148_8, iter_148_9 in pairs(arg_145_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_148_9 then
						iter_148_9.color = Color.New(var_148_25, var_148_25, var_148_25)
					end
				end

				arg_145_1.var_.actorSpriteComps10034 = nil
			end

			local var_148_26 = 0
			local var_148_27 = 1.2

			if var_148_26 < arg_145_1.time_ and arg_145_1.time_ <= var_148_26 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_28 = arg_145_1:FormatText(StoryNameCfg[367].name)

				arg_145_1.leftNameTxt_.text = var_148_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_29 = arg_145_1:GetWordFromCfg(117131036)
				local var_148_30 = arg_145_1:FormatText(var_148_29.content)

				arg_145_1.text_.text = var_148_30

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_31 = 48
				local var_148_32 = utf8.len(var_148_30)
				local var_148_33 = var_148_31 <= 0 and var_148_27 or var_148_27 * (var_148_32 / var_148_31)

				if var_148_33 > 0 and var_148_27 < var_148_33 then
					arg_145_1.talkMaxDuration = var_148_33

					if var_148_33 + var_148_26 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_33 + var_148_26
					end
				end

				arg_145_1.text_.text = var_148_30
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131036", "story_v_out_117131.awb") ~= 0 then
					local var_148_34 = manager.audio:GetVoiceLength("story_v_out_117131", "117131036", "story_v_out_117131.awb") / 1000

					if var_148_34 + var_148_26 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_34 + var_148_26
					end

					if var_148_29.prefab_name ~= "" and arg_145_1.actors_[var_148_29.prefab_name] ~= nil then
						local var_148_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_29.prefab_name].transform, "story_v_out_117131", "117131036", "story_v_out_117131.awb")

						arg_145_1:RecordAudio("117131036", var_148_35)
						arg_145_1:RecordAudio("117131036", var_148_35)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_117131", "117131036", "story_v_out_117131.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_117131", "117131036", "story_v_out_117131.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_36 = math.max(var_148_27, arg_145_1.talkMaxDuration)

			if var_148_26 <= arg_145_1.time_ and arg_145_1.time_ < var_148_26 + var_148_36 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_26) / var_148_36

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_26 + var_148_36 and arg_145_1.time_ < var_148_26 + var_148_36 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play117131037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 117131037
		arg_149_1.duration_ = 8.033

		local var_149_0 = {
			zh = 8.033,
			ja = 6.766
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
				arg_149_0:Play117131038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["10034"].transform
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1.var_.moveOldPos10034 = var_152_0.localPosition
				var_152_0.localScale = Vector3.New(1, 1, 1)

				arg_149_1:CheckSpriteTmpPos("10034", 4)

				local var_152_2 = var_152_0.childCount

				for iter_152_0 = 0, var_152_2 - 1 do
					local var_152_3 = var_152_0:GetChild(iter_152_0)

					if var_152_3.name == "split_2" or not string.find(var_152_3.name, "split") then
						var_152_3.gameObject:SetActive(true)
					else
						var_152_3.gameObject:SetActive(false)
					end
				end
			end

			local var_152_4 = 0.001

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_4 then
				local var_152_5 = (arg_149_1.time_ - var_152_1) / var_152_4
				local var_152_6 = Vector3.New(390, -415, -290)

				var_152_0.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos10034, var_152_6, var_152_5)
			end

			if arg_149_1.time_ >= var_152_1 + var_152_4 and arg_149_1.time_ < var_152_1 + var_152_4 + arg_152_0 then
				var_152_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_152_7 = arg_149_1.actors_["1029"].transform
			local var_152_8 = 0

			if var_152_8 < arg_149_1.time_ and arg_149_1.time_ <= var_152_8 + arg_152_0 then
				arg_149_1.var_.moveOldPos1029 = var_152_7.localPosition
				var_152_7.localScale = Vector3.New(1, 1, 1)

				arg_149_1:CheckSpriteTmpPos("1029", 2)

				local var_152_9 = var_152_7.childCount

				for iter_152_1 = 0, var_152_9 - 1 do
					local var_152_10 = var_152_7:GetChild(iter_152_1)

					if var_152_10.name == "split_5" or not string.find(var_152_10.name, "split") then
						var_152_10.gameObject:SetActive(true)
					else
						var_152_10.gameObject:SetActive(false)
					end
				end
			end

			local var_152_11 = 0.001

			if var_152_8 <= arg_149_1.time_ and arg_149_1.time_ < var_152_8 + var_152_11 then
				local var_152_12 = (arg_149_1.time_ - var_152_8) / var_152_11
				local var_152_13 = Vector3.New(-390, -355, -140)

				var_152_7.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos1029, var_152_13, var_152_12)
			end

			if arg_149_1.time_ >= var_152_8 + var_152_11 and arg_149_1.time_ < var_152_8 + var_152_11 + arg_152_0 then
				var_152_7.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_152_14 = arg_149_1.actors_["1029"]
			local var_152_15 = 0

			if var_152_15 < arg_149_1.time_ and arg_149_1.time_ <= var_152_15 + arg_152_0 and arg_149_1.var_.actorSpriteComps1029 == nil then
				arg_149_1.var_.actorSpriteComps1029 = var_152_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_152_16 = 0.2

			if var_152_15 <= arg_149_1.time_ and arg_149_1.time_ < var_152_15 + var_152_16 then
				local var_152_17 = (arg_149_1.time_ - var_152_15) / var_152_16

				if arg_149_1.var_.actorSpriteComps1029 then
					for iter_152_2, iter_152_3 in pairs(arg_149_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_152_3 then
							local var_152_18 = Mathf.Lerp(iter_152_3.color.r, 1, var_152_17)

							iter_152_3.color = Color.New(var_152_18, var_152_18, var_152_18)
						end
					end
				end
			end

			if arg_149_1.time_ >= var_152_15 + var_152_16 and arg_149_1.time_ < var_152_15 + var_152_16 + arg_152_0 and arg_149_1.var_.actorSpriteComps1029 then
				local var_152_19 = 1

				for iter_152_4, iter_152_5 in pairs(arg_149_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_152_5 then
						iter_152_5.color = Color.New(var_152_19, var_152_19, var_152_19)
					end
				end

				arg_149_1.var_.actorSpriteComps1029 = nil
			end

			local var_152_20 = arg_149_1.actors_["10034"]
			local var_152_21 = 0

			if var_152_21 < arg_149_1.time_ and arg_149_1.time_ <= var_152_21 + arg_152_0 and arg_149_1.var_.actorSpriteComps10034 == nil then
				arg_149_1.var_.actorSpriteComps10034 = var_152_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_152_22 = 0.2

			if var_152_21 <= arg_149_1.time_ and arg_149_1.time_ < var_152_21 + var_152_22 then
				local var_152_23 = (arg_149_1.time_ - var_152_21) / var_152_22

				if arg_149_1.var_.actorSpriteComps10034 then
					for iter_152_6, iter_152_7 in pairs(arg_149_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_152_7 then
							local var_152_24 = Mathf.Lerp(iter_152_7.color.r, 0.5, var_152_23)

							iter_152_7.color = Color.New(var_152_24, var_152_24, var_152_24)
						end
					end
				end
			end

			if arg_149_1.time_ >= var_152_21 + var_152_22 and arg_149_1.time_ < var_152_21 + var_152_22 + arg_152_0 and arg_149_1.var_.actorSpriteComps10034 then
				local var_152_25 = 0.5

				for iter_152_8, iter_152_9 in pairs(arg_149_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_152_9 then
						iter_152_9.color = Color.New(var_152_25, var_152_25, var_152_25)
					end
				end

				arg_149_1.var_.actorSpriteComps10034 = nil
			end

			local var_152_26 = 0
			local var_152_27 = 1.025

			if var_152_26 < arg_149_1.time_ and arg_149_1.time_ <= var_152_26 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_28 = arg_149_1:FormatText(StoryNameCfg[319].name)

				arg_149_1.leftNameTxt_.text = var_152_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_29 = arg_149_1:GetWordFromCfg(117131037)
				local var_152_30 = arg_149_1:FormatText(var_152_29.content)

				arg_149_1.text_.text = var_152_30

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_31 = 41
				local var_152_32 = utf8.len(var_152_30)
				local var_152_33 = var_152_31 <= 0 and var_152_27 or var_152_27 * (var_152_32 / var_152_31)

				if var_152_33 > 0 and var_152_27 < var_152_33 then
					arg_149_1.talkMaxDuration = var_152_33

					if var_152_33 + var_152_26 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_33 + var_152_26
					end
				end

				arg_149_1.text_.text = var_152_30
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131037", "story_v_out_117131.awb") ~= 0 then
					local var_152_34 = manager.audio:GetVoiceLength("story_v_out_117131", "117131037", "story_v_out_117131.awb") / 1000

					if var_152_34 + var_152_26 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_34 + var_152_26
					end

					if var_152_29.prefab_name ~= "" and arg_149_1.actors_[var_152_29.prefab_name] ~= nil then
						local var_152_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_29.prefab_name].transform, "story_v_out_117131", "117131037", "story_v_out_117131.awb")

						arg_149_1:RecordAudio("117131037", var_152_35)
						arg_149_1:RecordAudio("117131037", var_152_35)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_117131", "117131037", "story_v_out_117131.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_117131", "117131037", "story_v_out_117131.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_36 = math.max(var_152_27, arg_149_1.talkMaxDuration)

			if var_152_26 <= arg_149_1.time_ and arg_149_1.time_ < var_152_26 + var_152_36 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_26) / var_152_36

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_26 + var_152_36 and arg_149_1.time_ < var_152_26 + var_152_36 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play117131038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 117131038
		arg_153_1.duration_ = 9.3

		local var_153_0 = {
			zh = 9.3,
			ja = 8.066
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
				arg_153_0:Play117131039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["10034"].transform
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 then
				arg_153_1.var_.moveOldPos10034 = var_156_0.localPosition
				var_156_0.localScale = Vector3.New(1, 1, 1)

				arg_153_1:CheckSpriteTmpPos("10034", 4)

				local var_156_2 = var_156_0.childCount

				for iter_156_0 = 0, var_156_2 - 1 do
					local var_156_3 = var_156_0:GetChild(iter_156_0)

					if var_156_3.name == "split_2" or not string.find(var_156_3.name, "split") then
						var_156_3.gameObject:SetActive(true)
					else
						var_156_3.gameObject:SetActive(false)
					end
				end
			end

			local var_156_4 = 0.001

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_4 then
				local var_156_5 = (arg_153_1.time_ - var_156_1) / var_156_4
				local var_156_6 = Vector3.New(390, -415, -290)

				var_156_0.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos10034, var_156_6, var_156_5)
			end

			if arg_153_1.time_ >= var_156_1 + var_156_4 and arg_153_1.time_ < var_156_1 + var_156_4 + arg_156_0 then
				var_156_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_156_7 = arg_153_1.actors_["1029"].transform
			local var_156_8 = 0

			if var_156_8 < arg_153_1.time_ and arg_153_1.time_ <= var_156_8 + arg_156_0 then
				arg_153_1.var_.moveOldPos1029 = var_156_7.localPosition
				var_156_7.localScale = Vector3.New(1, 1, 1)

				arg_153_1:CheckSpriteTmpPos("1029", 2)

				local var_156_9 = var_156_7.childCount

				for iter_156_1 = 0, var_156_9 - 1 do
					local var_156_10 = var_156_7:GetChild(iter_156_1)

					if var_156_10.name == "split_5" or not string.find(var_156_10.name, "split") then
						var_156_10.gameObject:SetActive(true)
					else
						var_156_10.gameObject:SetActive(false)
					end
				end
			end

			local var_156_11 = 0.001

			if var_156_8 <= arg_153_1.time_ and arg_153_1.time_ < var_156_8 + var_156_11 then
				local var_156_12 = (arg_153_1.time_ - var_156_8) / var_156_11
				local var_156_13 = Vector3.New(-390, -355, -140)

				var_156_7.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1029, var_156_13, var_156_12)
			end

			if arg_153_1.time_ >= var_156_8 + var_156_11 and arg_153_1.time_ < var_156_8 + var_156_11 + arg_156_0 then
				var_156_7.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_156_14 = arg_153_1.actors_["1029"]
			local var_156_15 = 0

			if var_156_15 < arg_153_1.time_ and arg_153_1.time_ <= var_156_15 + arg_156_0 and arg_153_1.var_.actorSpriteComps1029 == nil then
				arg_153_1.var_.actorSpriteComps1029 = var_156_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_156_16 = 0.2

			if var_156_15 <= arg_153_1.time_ and arg_153_1.time_ < var_156_15 + var_156_16 then
				local var_156_17 = (arg_153_1.time_ - var_156_15) / var_156_16

				if arg_153_1.var_.actorSpriteComps1029 then
					for iter_156_2, iter_156_3 in pairs(arg_153_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_156_3 then
							local var_156_18 = Mathf.Lerp(iter_156_3.color.r, 0.5, var_156_17)

							iter_156_3.color = Color.New(var_156_18, var_156_18, var_156_18)
						end
					end
				end
			end

			if arg_153_1.time_ >= var_156_15 + var_156_16 and arg_153_1.time_ < var_156_15 + var_156_16 + arg_156_0 and arg_153_1.var_.actorSpriteComps1029 then
				local var_156_19 = 0.5

				for iter_156_4, iter_156_5 in pairs(arg_153_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_156_5 then
						iter_156_5.color = Color.New(var_156_19, var_156_19, var_156_19)
					end
				end

				arg_153_1.var_.actorSpriteComps1029 = nil
			end

			local var_156_20 = arg_153_1.actors_["10034"]
			local var_156_21 = 0

			if var_156_21 < arg_153_1.time_ and arg_153_1.time_ <= var_156_21 + arg_156_0 and arg_153_1.var_.actorSpriteComps10034 == nil then
				arg_153_1.var_.actorSpriteComps10034 = var_156_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_156_22 = 0.2

			if var_156_21 <= arg_153_1.time_ and arg_153_1.time_ < var_156_21 + var_156_22 then
				local var_156_23 = (arg_153_1.time_ - var_156_21) / var_156_22

				if arg_153_1.var_.actorSpriteComps10034 then
					for iter_156_6, iter_156_7 in pairs(arg_153_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_156_7 then
							local var_156_24 = Mathf.Lerp(iter_156_7.color.r, 1, var_156_23)

							iter_156_7.color = Color.New(var_156_24, var_156_24, var_156_24)
						end
					end
				end
			end

			if arg_153_1.time_ >= var_156_21 + var_156_22 and arg_153_1.time_ < var_156_21 + var_156_22 + arg_156_0 and arg_153_1.var_.actorSpriteComps10034 then
				local var_156_25 = 1

				for iter_156_8, iter_156_9 in pairs(arg_153_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_156_9 then
						iter_156_9.color = Color.New(var_156_25, var_156_25, var_156_25)
					end
				end

				arg_153_1.var_.actorSpriteComps10034 = nil
			end

			local var_156_26 = 0
			local var_156_27 = 1

			if var_156_26 < arg_153_1.time_ and arg_153_1.time_ <= var_156_26 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_28 = arg_153_1:FormatText(StoryNameCfg[367].name)

				arg_153_1.leftNameTxt_.text = var_156_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_29 = arg_153_1:GetWordFromCfg(117131038)
				local var_156_30 = arg_153_1:FormatText(var_156_29.content)

				arg_153_1.text_.text = var_156_30

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_31 = 40
				local var_156_32 = utf8.len(var_156_30)
				local var_156_33 = var_156_31 <= 0 and var_156_27 or var_156_27 * (var_156_32 / var_156_31)

				if var_156_33 > 0 and var_156_27 < var_156_33 then
					arg_153_1.talkMaxDuration = var_156_33

					if var_156_33 + var_156_26 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_33 + var_156_26
					end
				end

				arg_153_1.text_.text = var_156_30
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131038", "story_v_out_117131.awb") ~= 0 then
					local var_156_34 = manager.audio:GetVoiceLength("story_v_out_117131", "117131038", "story_v_out_117131.awb") / 1000

					if var_156_34 + var_156_26 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_34 + var_156_26
					end

					if var_156_29.prefab_name ~= "" and arg_153_1.actors_[var_156_29.prefab_name] ~= nil then
						local var_156_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_29.prefab_name].transform, "story_v_out_117131", "117131038", "story_v_out_117131.awb")

						arg_153_1:RecordAudio("117131038", var_156_35)
						arg_153_1:RecordAudio("117131038", var_156_35)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_117131", "117131038", "story_v_out_117131.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_117131", "117131038", "story_v_out_117131.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_36 = math.max(var_156_27, arg_153_1.talkMaxDuration)

			if var_156_26 <= arg_153_1.time_ and arg_153_1.time_ < var_156_26 + var_156_36 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_26) / var_156_36

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_26 + var_156_36 and arg_153_1.time_ < var_156_26 + var_156_36 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play117131039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 117131039
		arg_157_1.duration_ = 4

		local var_157_0 = {
			zh = 2.333,
			ja = 4
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
				arg_157_0:Play117131040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1029"].transform
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1.var_.moveOldPos1029 = var_160_0.localPosition
				var_160_0.localScale = Vector3.New(1, 1, 1)

				arg_157_1:CheckSpriteTmpPos("1029", 2)

				local var_160_2 = var_160_0.childCount

				for iter_160_0 = 0, var_160_2 - 1 do
					local var_160_3 = var_160_0:GetChild(iter_160_0)

					if var_160_3.name == "split_5" or not string.find(var_160_3.name, "split") then
						var_160_3.gameObject:SetActive(true)
					else
						var_160_3.gameObject:SetActive(false)
					end
				end
			end

			local var_160_4 = 0.001

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_4 then
				local var_160_5 = (arg_157_1.time_ - var_160_1) / var_160_4
				local var_160_6 = Vector3.New(-390, -355, -140)

				var_160_0.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1029, var_160_6, var_160_5)
			end

			if arg_157_1.time_ >= var_160_1 + var_160_4 and arg_157_1.time_ < var_160_1 + var_160_4 + arg_160_0 then
				var_160_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_160_7 = arg_157_1.actors_["1029"]
			local var_160_8 = 0

			if var_160_8 < arg_157_1.time_ and arg_157_1.time_ <= var_160_8 + arg_160_0 and arg_157_1.var_.actorSpriteComps1029 == nil then
				arg_157_1.var_.actorSpriteComps1029 = var_160_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_160_9 = 0.2

			if var_160_8 <= arg_157_1.time_ and arg_157_1.time_ < var_160_8 + var_160_9 then
				local var_160_10 = (arg_157_1.time_ - var_160_8) / var_160_9

				if arg_157_1.var_.actorSpriteComps1029 then
					for iter_160_1, iter_160_2 in pairs(arg_157_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_160_2 then
							local var_160_11 = Mathf.Lerp(iter_160_2.color.r, 1, var_160_10)

							iter_160_2.color = Color.New(var_160_11, var_160_11, var_160_11)
						end
					end
				end
			end

			if arg_157_1.time_ >= var_160_8 + var_160_9 and arg_157_1.time_ < var_160_8 + var_160_9 + arg_160_0 and arg_157_1.var_.actorSpriteComps1029 then
				local var_160_12 = 1

				for iter_160_3, iter_160_4 in pairs(arg_157_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_160_4 then
						iter_160_4.color = Color.New(var_160_12, var_160_12, var_160_12)
					end
				end

				arg_157_1.var_.actorSpriteComps1029 = nil
			end

			local var_160_13 = arg_157_1.actors_["10034"]
			local var_160_14 = 0

			if var_160_14 < arg_157_1.time_ and arg_157_1.time_ <= var_160_14 + arg_160_0 and arg_157_1.var_.actorSpriteComps10034 == nil then
				arg_157_1.var_.actorSpriteComps10034 = var_160_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_160_15 = 0.2

			if var_160_14 <= arg_157_1.time_ and arg_157_1.time_ < var_160_14 + var_160_15 then
				local var_160_16 = (arg_157_1.time_ - var_160_14) / var_160_15

				if arg_157_1.var_.actorSpriteComps10034 then
					for iter_160_5, iter_160_6 in pairs(arg_157_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_160_6 then
							local var_160_17 = Mathf.Lerp(iter_160_6.color.r, 0.5, var_160_16)

							iter_160_6.color = Color.New(var_160_17, var_160_17, var_160_17)
						end
					end
				end
			end

			if arg_157_1.time_ >= var_160_14 + var_160_15 and arg_157_1.time_ < var_160_14 + var_160_15 + arg_160_0 and arg_157_1.var_.actorSpriteComps10034 then
				local var_160_18 = 0.5

				for iter_160_7, iter_160_8 in pairs(arg_157_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_160_8 then
						iter_160_8.color = Color.New(var_160_18, var_160_18, var_160_18)
					end
				end

				arg_157_1.var_.actorSpriteComps10034 = nil
			end

			local var_160_19 = 0
			local var_160_20 = 0.35

			if var_160_19 < arg_157_1.time_ and arg_157_1.time_ <= var_160_19 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_21 = arg_157_1:FormatText(StoryNameCfg[319].name)

				arg_157_1.leftNameTxt_.text = var_160_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_22 = arg_157_1:GetWordFromCfg(117131039)
				local var_160_23 = arg_157_1:FormatText(var_160_22.content)

				arg_157_1.text_.text = var_160_23

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_24 = 14
				local var_160_25 = utf8.len(var_160_23)
				local var_160_26 = var_160_24 <= 0 and var_160_20 or var_160_20 * (var_160_25 / var_160_24)

				if var_160_26 > 0 and var_160_20 < var_160_26 then
					arg_157_1.talkMaxDuration = var_160_26

					if var_160_26 + var_160_19 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_26 + var_160_19
					end
				end

				arg_157_1.text_.text = var_160_23
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131039", "story_v_out_117131.awb") ~= 0 then
					local var_160_27 = manager.audio:GetVoiceLength("story_v_out_117131", "117131039", "story_v_out_117131.awb") / 1000

					if var_160_27 + var_160_19 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_27 + var_160_19
					end

					if var_160_22.prefab_name ~= "" and arg_157_1.actors_[var_160_22.prefab_name] ~= nil then
						local var_160_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_22.prefab_name].transform, "story_v_out_117131", "117131039", "story_v_out_117131.awb")

						arg_157_1:RecordAudio("117131039", var_160_28)
						arg_157_1:RecordAudio("117131039", var_160_28)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_117131", "117131039", "story_v_out_117131.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_117131", "117131039", "story_v_out_117131.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_29 = math.max(var_160_20, arg_157_1.talkMaxDuration)

			if var_160_19 <= arg_157_1.time_ and arg_157_1.time_ < var_160_19 + var_160_29 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_19) / var_160_29

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_19 + var_160_29 and arg_157_1.time_ < var_160_19 + var_160_29 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play117131040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 117131040
		arg_161_1.duration_ = 11.6

		local var_161_0 = {
			zh = 11.6,
			ja = 6.766
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
				arg_161_0:Play117131041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1029"].transform
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPos1029 = var_164_0.localPosition
				var_164_0.localScale = Vector3.New(1, 1, 1)

				arg_161_1:CheckSpriteTmpPos("1029", 2)

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
				local var_164_6 = Vector3.New(-390, -355, -140)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1029, var_164_6, var_164_5)
			end

			if arg_161_1.time_ >= var_164_1 + var_164_4 and arg_161_1.time_ < var_164_1 + var_164_4 + arg_164_0 then
				var_164_0.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_164_7 = arg_161_1.actors_["1029"]
			local var_164_8 = 0

			if var_164_8 < arg_161_1.time_ and arg_161_1.time_ <= var_164_8 + arg_164_0 and arg_161_1.var_.actorSpriteComps1029 == nil then
				arg_161_1.var_.actorSpriteComps1029 = var_164_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_164_9 = 0.2

			if var_164_8 <= arg_161_1.time_ and arg_161_1.time_ < var_164_8 + var_164_9 then
				local var_164_10 = (arg_161_1.time_ - var_164_8) / var_164_9

				if arg_161_1.var_.actorSpriteComps1029 then
					for iter_164_1, iter_164_2 in pairs(arg_161_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_164_2 then
							local var_164_11 = Mathf.Lerp(iter_164_2.color.r, 0.5, var_164_10)

							iter_164_2.color = Color.New(var_164_11, var_164_11, var_164_11)
						end
					end
				end
			end

			if arg_161_1.time_ >= var_164_8 + var_164_9 and arg_161_1.time_ < var_164_8 + var_164_9 + arg_164_0 and arg_161_1.var_.actorSpriteComps1029 then
				local var_164_12 = 0.5

				for iter_164_3, iter_164_4 in pairs(arg_161_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_164_4 then
						iter_164_4.color = Color.New(var_164_12, var_164_12, var_164_12)
					end
				end

				arg_161_1.var_.actorSpriteComps1029 = nil
			end

			local var_164_13 = arg_161_1.actors_["10034"]
			local var_164_14 = 0

			if var_164_14 < arg_161_1.time_ and arg_161_1.time_ <= var_164_14 + arg_164_0 and arg_161_1.var_.actorSpriteComps10034 == nil then
				arg_161_1.var_.actorSpriteComps10034 = var_164_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_164_15 = 0.2

			if var_164_14 <= arg_161_1.time_ and arg_161_1.time_ < var_164_14 + var_164_15 then
				local var_164_16 = (arg_161_1.time_ - var_164_14) / var_164_15

				if arg_161_1.var_.actorSpriteComps10034 then
					for iter_164_5, iter_164_6 in pairs(arg_161_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_164_6 then
							local var_164_17 = Mathf.Lerp(iter_164_6.color.r, 1, var_164_16)

							iter_164_6.color = Color.New(var_164_17, var_164_17, var_164_17)
						end
					end
				end
			end

			if arg_161_1.time_ >= var_164_14 + var_164_15 and arg_161_1.time_ < var_164_14 + var_164_15 + arg_164_0 and arg_161_1.var_.actorSpriteComps10034 then
				local var_164_18 = 1

				for iter_164_7, iter_164_8 in pairs(arg_161_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_164_8 then
						iter_164_8.color = Color.New(var_164_18, var_164_18, var_164_18)
					end
				end

				arg_161_1.var_.actorSpriteComps10034 = nil
			end

			local var_164_19 = 0
			local var_164_20 = 1.125

			if var_164_19 < arg_161_1.time_ and arg_161_1.time_ <= var_164_19 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_21 = arg_161_1:FormatText(StoryNameCfg[367].name)

				arg_161_1.leftNameTxt_.text = var_164_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_22 = arg_161_1:GetWordFromCfg(117131040)
				local var_164_23 = arg_161_1:FormatText(var_164_22.content)

				arg_161_1.text_.text = var_164_23

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_24 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131040", "story_v_out_117131.awb") ~= 0 then
					local var_164_27 = manager.audio:GetVoiceLength("story_v_out_117131", "117131040", "story_v_out_117131.awb") / 1000

					if var_164_27 + var_164_19 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_27 + var_164_19
					end

					if var_164_22.prefab_name ~= "" and arg_161_1.actors_[var_164_22.prefab_name] ~= nil then
						local var_164_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_22.prefab_name].transform, "story_v_out_117131", "117131040", "story_v_out_117131.awb")

						arg_161_1:RecordAudio("117131040", var_164_28)
						arg_161_1:RecordAudio("117131040", var_164_28)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_117131", "117131040", "story_v_out_117131.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_117131", "117131040", "story_v_out_117131.awb")
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
	Play117131041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 117131041
		arg_165_1.duration_ = 15.4

		local var_165_0 = {
			zh = 15.4,
			ja = 12.7
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
				arg_165_0:Play117131042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0
			local var_168_1 = 1.475

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_2 = arg_165_1:FormatText(StoryNameCfg[367].name)

				arg_165_1.leftNameTxt_.text = var_168_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_3 = arg_165_1:GetWordFromCfg(117131041)
				local var_168_4 = arg_165_1:FormatText(var_168_3.content)

				arg_165_1.text_.text = var_168_4

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_5 = 59
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131041", "story_v_out_117131.awb") ~= 0 then
					local var_168_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131041", "story_v_out_117131.awb") / 1000

					if var_168_8 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_8 + var_168_0
					end

					if var_168_3.prefab_name ~= "" and arg_165_1.actors_[var_168_3.prefab_name] ~= nil then
						local var_168_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_3.prefab_name].transform, "story_v_out_117131", "117131041", "story_v_out_117131.awb")

						arg_165_1:RecordAudio("117131041", var_168_9)
						arg_165_1:RecordAudio("117131041", var_168_9)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_117131", "117131041", "story_v_out_117131.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_117131", "117131041", "story_v_out_117131.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_10 = math.max(var_168_1, arg_165_1.talkMaxDuration)

			if var_168_0 <= arg_165_1.time_ and arg_165_1.time_ < var_168_0 + var_168_10 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_0) / var_168_10

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_0 + var_168_10 and arg_165_1.time_ < var_168_0 + var_168_10 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play117131042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 117131042
		arg_169_1.duration_ = 11.6

		local var_169_0 = {
			zh = 6,
			ja = 11.6
		}
		local var_169_1 = manager.audio:GetLocalizationFlag()

		if var_169_0[var_169_1] ~= nil then
			arg_169_1.duration_ = var_169_0[var_169_1]
		end

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play117131043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = 0
			local var_172_1 = 0.425

			if var_172_0 < arg_169_1.time_ and arg_169_1.time_ <= var_172_0 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_2 = arg_169_1:FormatText(StoryNameCfg[367].name)

				arg_169_1.leftNameTxt_.text = var_172_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_3 = arg_169_1:GetWordFromCfg(117131042)
				local var_172_4 = arg_169_1:FormatText(var_172_3.content)

				arg_169_1.text_.text = var_172_4

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131042", "story_v_out_117131.awb") ~= 0 then
					local var_172_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131042", "story_v_out_117131.awb") / 1000

					if var_172_8 + var_172_0 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_8 + var_172_0
					end

					if var_172_3.prefab_name ~= "" and arg_169_1.actors_[var_172_3.prefab_name] ~= nil then
						local var_172_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_3.prefab_name].transform, "story_v_out_117131", "117131042", "story_v_out_117131.awb")

						arg_169_1:RecordAudio("117131042", var_172_9)
						arg_169_1:RecordAudio("117131042", var_172_9)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_117131", "117131042", "story_v_out_117131.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_117131", "117131042", "story_v_out_117131.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_10 = math.max(var_172_1, arg_169_1.talkMaxDuration)

			if var_172_0 <= arg_169_1.time_ and arg_169_1.time_ < var_172_0 + var_172_10 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_0) / var_172_10

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_0 + var_172_10 and arg_169_1.time_ < var_172_0 + var_172_10 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play117131043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 117131043
		arg_173_1.duration_ = 8.9

		local var_173_0 = {
			zh = 8.9,
			ja = 6.433
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
				arg_173_0:Play117131044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["10034"].transform
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.var_.moveOldPos10034 = var_176_0.localPosition
				var_176_0.localScale = Vector3.New(1, 1, 1)

				arg_173_1:CheckSpriteTmpPos("10034", 4)

				local var_176_2 = var_176_0.childCount

				for iter_176_0 = 0, var_176_2 - 1 do
					local var_176_3 = var_176_0:GetChild(iter_176_0)

					if var_176_3.name == "split_2" or not string.find(var_176_3.name, "split") then
						var_176_3.gameObject:SetActive(true)
					else
						var_176_3.gameObject:SetActive(false)
					end
				end
			end

			local var_176_4 = 0.001

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_4 then
				local var_176_5 = (arg_173_1.time_ - var_176_1) / var_176_4
				local var_176_6 = Vector3.New(390, -415, -290)

				var_176_0.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos10034, var_176_6, var_176_5)
			end

			if arg_173_1.time_ >= var_176_1 + var_176_4 and arg_173_1.time_ < var_176_1 + var_176_4 + arg_176_0 then
				var_176_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_176_7 = arg_173_1.actors_["1029"].transform
			local var_176_8 = 0

			if var_176_8 < arg_173_1.time_ and arg_173_1.time_ <= var_176_8 + arg_176_0 then
				arg_173_1.var_.moveOldPos1029 = var_176_7.localPosition
				var_176_7.localScale = Vector3.New(1, 1, 1)

				arg_173_1:CheckSpriteTmpPos("1029", 2)

				local var_176_9 = var_176_7.childCount

				for iter_176_1 = 0, var_176_9 - 1 do
					local var_176_10 = var_176_7:GetChild(iter_176_1)

					if var_176_10.name == "split_5" or not string.find(var_176_10.name, "split") then
						var_176_10.gameObject:SetActive(true)
					else
						var_176_10.gameObject:SetActive(false)
					end
				end
			end

			local var_176_11 = 0.001

			if var_176_8 <= arg_173_1.time_ and arg_173_1.time_ < var_176_8 + var_176_11 then
				local var_176_12 = (arg_173_1.time_ - var_176_8) / var_176_11
				local var_176_13 = Vector3.New(-390, -355, -140)

				var_176_7.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1029, var_176_13, var_176_12)
			end

			if arg_173_1.time_ >= var_176_8 + var_176_11 and arg_173_1.time_ < var_176_8 + var_176_11 + arg_176_0 then
				var_176_7.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_176_14 = arg_173_1.actors_["1029"]
			local var_176_15 = 0

			if var_176_15 < arg_173_1.time_ and arg_173_1.time_ <= var_176_15 + arg_176_0 and arg_173_1.var_.actorSpriteComps1029 == nil then
				arg_173_1.var_.actorSpriteComps1029 = var_176_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_176_16 = 0.2

			if var_176_15 <= arg_173_1.time_ and arg_173_1.time_ < var_176_15 + var_176_16 then
				local var_176_17 = (arg_173_1.time_ - var_176_15) / var_176_16

				if arg_173_1.var_.actorSpriteComps1029 then
					for iter_176_2, iter_176_3 in pairs(arg_173_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_176_3 then
							local var_176_18 = Mathf.Lerp(iter_176_3.color.r, 1, var_176_17)

							iter_176_3.color = Color.New(var_176_18, var_176_18, var_176_18)
						end
					end
				end
			end

			if arg_173_1.time_ >= var_176_15 + var_176_16 and arg_173_1.time_ < var_176_15 + var_176_16 + arg_176_0 and arg_173_1.var_.actorSpriteComps1029 then
				local var_176_19 = 1

				for iter_176_4, iter_176_5 in pairs(arg_173_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_176_5 then
						iter_176_5.color = Color.New(var_176_19, var_176_19, var_176_19)
					end
				end

				arg_173_1.var_.actorSpriteComps1029 = nil
			end

			local var_176_20 = arg_173_1.actors_["10034"]
			local var_176_21 = 0

			if var_176_21 < arg_173_1.time_ and arg_173_1.time_ <= var_176_21 + arg_176_0 and arg_173_1.var_.actorSpriteComps10034 == nil then
				arg_173_1.var_.actorSpriteComps10034 = var_176_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_176_22 = 0.2

			if var_176_21 <= arg_173_1.time_ and arg_173_1.time_ < var_176_21 + var_176_22 then
				local var_176_23 = (arg_173_1.time_ - var_176_21) / var_176_22

				if arg_173_1.var_.actorSpriteComps10034 then
					for iter_176_6, iter_176_7 in pairs(arg_173_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_176_7 then
							local var_176_24 = Mathf.Lerp(iter_176_7.color.r, 0.5, var_176_23)

							iter_176_7.color = Color.New(var_176_24, var_176_24, var_176_24)
						end
					end
				end
			end

			if arg_173_1.time_ >= var_176_21 + var_176_22 and arg_173_1.time_ < var_176_21 + var_176_22 + arg_176_0 and arg_173_1.var_.actorSpriteComps10034 then
				local var_176_25 = 0.5

				for iter_176_8, iter_176_9 in pairs(arg_173_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_176_9 then
						iter_176_9.color = Color.New(var_176_25, var_176_25, var_176_25)
					end
				end

				arg_173_1.var_.actorSpriteComps10034 = nil
			end

			local var_176_26 = 0
			local var_176_27 = 0.675

			if var_176_26 < arg_173_1.time_ and arg_173_1.time_ <= var_176_26 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_28 = arg_173_1:FormatText(StoryNameCfg[319].name)

				arg_173_1.leftNameTxt_.text = var_176_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_29 = arg_173_1:GetWordFromCfg(117131043)
				local var_176_30 = arg_173_1:FormatText(var_176_29.content)

				arg_173_1.text_.text = var_176_30

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_31 = 27
				local var_176_32 = utf8.len(var_176_30)
				local var_176_33 = var_176_31 <= 0 and var_176_27 or var_176_27 * (var_176_32 / var_176_31)

				if var_176_33 > 0 and var_176_27 < var_176_33 then
					arg_173_1.talkMaxDuration = var_176_33

					if var_176_33 + var_176_26 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_33 + var_176_26
					end
				end

				arg_173_1.text_.text = var_176_30
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131043", "story_v_out_117131.awb") ~= 0 then
					local var_176_34 = manager.audio:GetVoiceLength("story_v_out_117131", "117131043", "story_v_out_117131.awb") / 1000

					if var_176_34 + var_176_26 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_34 + var_176_26
					end

					if var_176_29.prefab_name ~= "" and arg_173_1.actors_[var_176_29.prefab_name] ~= nil then
						local var_176_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_29.prefab_name].transform, "story_v_out_117131", "117131043", "story_v_out_117131.awb")

						arg_173_1:RecordAudio("117131043", var_176_35)
						arg_173_1:RecordAudio("117131043", var_176_35)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_117131", "117131043", "story_v_out_117131.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_117131", "117131043", "story_v_out_117131.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_36 = math.max(var_176_27, arg_173_1.talkMaxDuration)

			if var_176_26 <= arg_173_1.time_ and arg_173_1.time_ < var_176_26 + var_176_36 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_26) / var_176_36

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_26 + var_176_36 and arg_173_1.time_ < var_176_26 + var_176_36 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play117131044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 117131044
		arg_177_1.duration_ = 16.266

		local var_177_0 = {
			zh = 16.266,
			ja = 13.966
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
				arg_177_0:Play117131045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["10034"].transform
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 then
				arg_177_1.var_.moveOldPos10034 = var_180_0.localPosition
				var_180_0.localScale = Vector3.New(1, 1, 1)

				arg_177_1:CheckSpriteTmpPos("10034", 4)

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
				local var_180_6 = Vector3.New(390, -415, -290)

				var_180_0.localPosition = Vector3.Lerp(arg_177_1.var_.moveOldPos10034, var_180_6, var_180_5)
			end

			if arg_177_1.time_ >= var_180_1 + var_180_4 and arg_177_1.time_ < var_180_1 + var_180_4 + arg_180_0 then
				var_180_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_180_7 = arg_177_1.actors_["1029"].transform
			local var_180_8 = 0

			if var_180_8 < arg_177_1.time_ and arg_177_1.time_ <= var_180_8 + arg_180_0 then
				arg_177_1.var_.moveOldPos1029 = var_180_7.localPosition
				var_180_7.localScale = Vector3.New(1, 1, 1)

				arg_177_1:CheckSpriteTmpPos("1029", 2)

				local var_180_9 = var_180_7.childCount

				for iter_180_1 = 0, var_180_9 - 1 do
					local var_180_10 = var_180_7:GetChild(iter_180_1)

					if var_180_10.name == "split_5" or not string.find(var_180_10.name, "split") then
						var_180_10.gameObject:SetActive(true)
					else
						var_180_10.gameObject:SetActive(false)
					end
				end
			end

			local var_180_11 = 0.001

			if var_180_8 <= arg_177_1.time_ and arg_177_1.time_ < var_180_8 + var_180_11 then
				local var_180_12 = (arg_177_1.time_ - var_180_8) / var_180_11
				local var_180_13 = Vector3.New(-390, -355, -140)

				var_180_7.localPosition = Vector3.Lerp(arg_177_1.var_.moveOldPos1029, var_180_13, var_180_12)
			end

			if arg_177_1.time_ >= var_180_8 + var_180_11 and arg_177_1.time_ < var_180_8 + var_180_11 + arg_180_0 then
				var_180_7.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_180_14 = arg_177_1.actors_["1029"]
			local var_180_15 = 0

			if var_180_15 < arg_177_1.time_ and arg_177_1.time_ <= var_180_15 + arg_180_0 and arg_177_1.var_.actorSpriteComps1029 == nil then
				arg_177_1.var_.actorSpriteComps1029 = var_180_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_180_16 = 0.2

			if var_180_15 <= arg_177_1.time_ and arg_177_1.time_ < var_180_15 + var_180_16 then
				local var_180_17 = (arg_177_1.time_ - var_180_15) / var_180_16

				if arg_177_1.var_.actorSpriteComps1029 then
					for iter_180_2, iter_180_3 in pairs(arg_177_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_180_3 then
							local var_180_18 = Mathf.Lerp(iter_180_3.color.r, 0.5, var_180_17)

							iter_180_3.color = Color.New(var_180_18, var_180_18, var_180_18)
						end
					end
				end
			end

			if arg_177_1.time_ >= var_180_15 + var_180_16 and arg_177_1.time_ < var_180_15 + var_180_16 + arg_180_0 and arg_177_1.var_.actorSpriteComps1029 then
				local var_180_19 = 0.5

				for iter_180_4, iter_180_5 in pairs(arg_177_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_180_5 then
						iter_180_5.color = Color.New(var_180_19, var_180_19, var_180_19)
					end
				end

				arg_177_1.var_.actorSpriteComps1029 = nil
			end

			local var_180_20 = arg_177_1.actors_["10034"]
			local var_180_21 = 0

			if var_180_21 < arg_177_1.time_ and arg_177_1.time_ <= var_180_21 + arg_180_0 and arg_177_1.var_.actorSpriteComps10034 == nil then
				arg_177_1.var_.actorSpriteComps10034 = var_180_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_180_22 = 0.2

			if var_180_21 <= arg_177_1.time_ and arg_177_1.time_ < var_180_21 + var_180_22 then
				local var_180_23 = (arg_177_1.time_ - var_180_21) / var_180_22

				if arg_177_1.var_.actorSpriteComps10034 then
					for iter_180_6, iter_180_7 in pairs(arg_177_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_180_7 then
							local var_180_24 = Mathf.Lerp(iter_180_7.color.r, 1, var_180_23)

							iter_180_7.color = Color.New(var_180_24, var_180_24, var_180_24)
						end
					end
				end
			end

			if arg_177_1.time_ >= var_180_21 + var_180_22 and arg_177_1.time_ < var_180_21 + var_180_22 + arg_180_0 and arg_177_1.var_.actorSpriteComps10034 then
				local var_180_25 = 1

				for iter_180_8, iter_180_9 in pairs(arg_177_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_180_9 then
						iter_180_9.color = Color.New(var_180_25, var_180_25, var_180_25)
					end
				end

				arg_177_1.var_.actorSpriteComps10034 = nil
			end

			local var_180_26 = 0
			local var_180_27 = 1.475

			if var_180_26 < arg_177_1.time_ and arg_177_1.time_ <= var_180_26 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_28 = arg_177_1:FormatText(StoryNameCfg[367].name)

				arg_177_1.leftNameTxt_.text = var_180_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_29 = arg_177_1:GetWordFromCfg(117131044)
				local var_180_30 = arg_177_1:FormatText(var_180_29.content)

				arg_177_1.text_.text = var_180_30

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_31 = 59
				local var_180_32 = utf8.len(var_180_30)
				local var_180_33 = var_180_31 <= 0 and var_180_27 or var_180_27 * (var_180_32 / var_180_31)

				if var_180_33 > 0 and var_180_27 < var_180_33 then
					arg_177_1.talkMaxDuration = var_180_33

					if var_180_33 + var_180_26 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_33 + var_180_26
					end
				end

				arg_177_1.text_.text = var_180_30
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131044", "story_v_out_117131.awb") ~= 0 then
					local var_180_34 = manager.audio:GetVoiceLength("story_v_out_117131", "117131044", "story_v_out_117131.awb") / 1000

					if var_180_34 + var_180_26 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_34 + var_180_26
					end

					if var_180_29.prefab_name ~= "" and arg_177_1.actors_[var_180_29.prefab_name] ~= nil then
						local var_180_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_29.prefab_name].transform, "story_v_out_117131", "117131044", "story_v_out_117131.awb")

						arg_177_1:RecordAudio("117131044", var_180_35)
						arg_177_1:RecordAudio("117131044", var_180_35)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_117131", "117131044", "story_v_out_117131.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_117131", "117131044", "story_v_out_117131.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_36 = math.max(var_180_27, arg_177_1.talkMaxDuration)

			if var_180_26 <= arg_177_1.time_ and arg_177_1.time_ < var_180_26 + var_180_36 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_26) / var_180_36

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_26 + var_180_36 and arg_177_1.time_ < var_180_26 + var_180_36 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play117131045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 117131045
		arg_181_1.duration_ = 5

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play117131046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1029"]
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 then
				local var_184_2 = var_184_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_184_2 then
					arg_181_1.var_.alphaOldValue1029 = var_184_2.alpha
					arg_181_1.var_.characterEffect1029 = var_184_2
				end

				arg_181_1.var_.alphaOldValue1029 = 1
			end

			local var_184_3 = 0.333333333333333

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_3 then
				local var_184_4 = (arg_181_1.time_ - var_184_1) / var_184_3
				local var_184_5 = Mathf.Lerp(arg_181_1.var_.alphaOldValue1029, 0, var_184_4)

				if arg_181_1.var_.characterEffect1029 then
					arg_181_1.var_.characterEffect1029.alpha = var_184_5
				end
			end

			if arg_181_1.time_ >= var_184_1 + var_184_3 and arg_181_1.time_ < var_184_1 + var_184_3 + arg_184_0 and arg_181_1.var_.characterEffect1029 then
				arg_181_1.var_.characterEffect1029.alpha = 0
			end

			local var_184_6 = arg_181_1.actors_["10034"]
			local var_184_7 = 0

			if var_184_7 < arg_181_1.time_ and arg_181_1.time_ <= var_184_7 + arg_184_0 then
				local var_184_8 = var_184_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_184_8 then
					arg_181_1.var_.alphaOldValue10034 = var_184_8.alpha
					arg_181_1.var_.characterEffect10034 = var_184_8
				end

				arg_181_1.var_.alphaOldValue10034 = 1
			end

			local var_184_9 = 0.333333333333333

			if var_184_7 <= arg_181_1.time_ and arg_181_1.time_ < var_184_7 + var_184_9 then
				local var_184_10 = (arg_181_1.time_ - var_184_7) / var_184_9
				local var_184_11 = Mathf.Lerp(arg_181_1.var_.alphaOldValue10034, 0, var_184_10)

				if arg_181_1.var_.characterEffect10034 then
					arg_181_1.var_.characterEffect10034.alpha = var_184_11
				end
			end

			if arg_181_1.time_ >= var_184_7 + var_184_9 and arg_181_1.time_ < var_184_7 + var_184_9 + arg_184_0 and arg_181_1.var_.characterEffect10034 then
				arg_181_1.var_.characterEffect10034.alpha = 0
			end

			local var_184_12 = 0
			local var_184_13 = 1.225

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

				local var_184_14 = arg_181_1:GetWordFromCfg(117131045)
				local var_184_15 = arg_181_1:FormatText(var_184_14.content)

				arg_181_1.text_.text = var_184_15

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_16 = 49
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
	Play117131046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 117131046
		arg_185_1.duration_ = 14.666

		local var_185_0 = {
			zh = 13,
			ja = 14.666
		}
		local var_185_1 = manager.audio:GetLocalizationFlag()

		if var_185_0[var_185_1] ~= nil then
			arg_185_1.duration_ = var_185_0[var_185_1]
		end

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play117131047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = "TI0101"

			if arg_185_1.bgs_[var_188_0] == nil then
				local var_188_1 = Object.Instantiate(arg_185_1.paintGo_)

				var_188_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_188_0)
				var_188_1.name = var_188_0
				var_188_1.transform.parent = arg_185_1.stage_.transform
				var_188_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_185_1.bgs_[var_188_0] = var_188_1
			end

			local var_188_2 = 2

			if var_188_2 < arg_185_1.time_ and arg_185_1.time_ <= var_188_2 + arg_188_0 then
				local var_188_3 = manager.ui.mainCamera.transform.localPosition
				local var_188_4 = Vector3.New(0, 0, 10) + Vector3.New(var_188_3.x, var_188_3.y, 0)
				local var_188_5 = arg_185_1.bgs_.TI0101

				var_188_5.transform.localPosition = var_188_4
				var_188_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_188_6 = var_188_5:GetComponent("SpriteRenderer")

				if var_188_6 and var_188_6.sprite then
					local var_188_7 = (var_188_5.transform.localPosition - var_188_3).z
					local var_188_8 = manager.ui.mainCameraCom_
					local var_188_9 = 2 * var_188_7 * Mathf.Tan(var_188_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_188_10 = var_188_9 * var_188_8.aspect
					local var_188_11 = var_188_6.sprite.bounds.size.x
					local var_188_12 = var_188_6.sprite.bounds.size.y
					local var_188_13 = var_188_10 / var_188_11
					local var_188_14 = var_188_9 / var_188_12
					local var_188_15 = var_188_14 < var_188_13 and var_188_13 or var_188_14

					var_188_5.transform.localScale = Vector3.New(var_188_15, var_188_15, 0)
				end

				for iter_188_0, iter_188_1 in pairs(arg_185_1.bgs_) do
					if iter_188_0 ~= "TI0101" then
						iter_188_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_188_16 = 0

			if var_188_16 < arg_185_1.time_ and arg_185_1.time_ <= var_188_16 + arg_188_0 then
				arg_185_1.mask_.enabled = true
				arg_185_1.mask_.raycastTarget = true

				arg_185_1:SetGaussion(false)
			end

			local var_188_17 = 2

			if var_188_16 <= arg_185_1.time_ and arg_185_1.time_ < var_188_16 + var_188_17 then
				local var_188_18 = (arg_185_1.time_ - var_188_16) / var_188_17
				local var_188_19 = Color.New(0, 0, 0)

				var_188_19.a = Mathf.Lerp(0, 1, var_188_18)
				arg_185_1.mask_.color = var_188_19
			end

			if arg_185_1.time_ >= var_188_16 + var_188_17 and arg_185_1.time_ < var_188_16 + var_188_17 + arg_188_0 then
				local var_188_20 = Color.New(0, 0, 0)

				var_188_20.a = 1
				arg_185_1.mask_.color = var_188_20
			end

			local var_188_21 = 2

			if var_188_21 < arg_185_1.time_ and arg_185_1.time_ <= var_188_21 + arg_188_0 then
				arg_185_1.mask_.enabled = true
				arg_185_1.mask_.raycastTarget = true

				arg_185_1:SetGaussion(false)
			end

			local var_188_22 = 2

			if var_188_21 <= arg_185_1.time_ and arg_185_1.time_ < var_188_21 + var_188_22 then
				local var_188_23 = (arg_185_1.time_ - var_188_21) / var_188_22
				local var_188_24 = Color.New(0, 0, 0)

				var_188_24.a = Mathf.Lerp(1, 0, var_188_23)
				arg_185_1.mask_.color = var_188_24
			end

			if arg_185_1.time_ >= var_188_21 + var_188_22 and arg_185_1.time_ < var_188_21 + var_188_22 + arg_188_0 then
				local var_188_25 = Color.New(0, 0, 0)
				local var_188_26 = 0

				arg_185_1.mask_.enabled = false
				var_188_25.a = var_188_26
				arg_185_1.mask_.color = var_188_25
			end

			if arg_185_1.frameCnt_ <= 1 then
				arg_185_1.dialog_:SetActive(false)
			end

			local var_188_27 = 4
			local var_188_28 = 1.175

			if var_188_27 < arg_185_1.time_ and arg_185_1.time_ <= var_188_27 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0

				arg_185_1.dialog_:SetActive(true)

				local var_188_29 = LeanTween.value(arg_185_1.dialog_, 0, 1, 0.3)

				var_188_29:setOnUpdate(LuaHelper.FloatAction(function(arg_189_0)
					arg_185_1.dialogCg_.alpha = arg_189_0
				end))
				var_188_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_185_1.dialog_)
					var_188_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_185_1.duration_ = arg_185_1.duration_ + 0.3

				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_30 = arg_185_1:FormatText(StoryNameCfg[368].name)

				arg_185_1.leftNameTxt_.text = var_188_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_31 = arg_185_1:GetWordFromCfg(117131046)
				local var_188_32 = arg_185_1:FormatText(var_188_31.content)

				arg_185_1.text_.text = var_188_32

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_33 = 46
				local var_188_34 = utf8.len(var_188_32)
				local var_188_35 = var_188_33 <= 0 and var_188_28 or var_188_28 * (var_188_34 / var_188_33)

				if var_188_35 > 0 and var_188_28 < var_188_35 then
					arg_185_1.talkMaxDuration = var_188_35
					var_188_27 = var_188_27 + 0.3

					if var_188_35 + var_188_27 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_35 + var_188_27
					end
				end

				arg_185_1.text_.text = var_188_32
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131046", "story_v_out_117131.awb") ~= 0 then
					local var_188_36 = manager.audio:GetVoiceLength("story_v_out_117131", "117131046", "story_v_out_117131.awb") / 1000

					if var_188_36 + var_188_27 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_36 + var_188_27
					end

					if var_188_31.prefab_name ~= "" and arg_185_1.actors_[var_188_31.prefab_name] ~= nil then
						local var_188_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_31.prefab_name].transform, "story_v_out_117131", "117131046", "story_v_out_117131.awb")

						arg_185_1:RecordAudio("117131046", var_188_37)
						arg_185_1:RecordAudio("117131046", var_188_37)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_117131", "117131046", "story_v_out_117131.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_117131", "117131046", "story_v_out_117131.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_38 = var_188_27 + 0.3
			local var_188_39 = math.max(var_188_28, arg_185_1.talkMaxDuration)

			if var_188_38 <= arg_185_1.time_ and arg_185_1.time_ < var_188_38 + var_188_39 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_38) / var_188_39

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_38 + var_188_39 and arg_185_1.time_ < var_188_38 + var_188_39 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play117131047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 117131047
		arg_191_1.duration_ = 14.466

		local var_191_0 = {
			zh = 14.466,
			ja = 9.4
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
				arg_191_0:Play117131048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0
			local var_194_1 = 1.725

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_2 = arg_191_1:FormatText(StoryNameCfg[368].name)

				arg_191_1.leftNameTxt_.text = var_194_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_3 = arg_191_1:GetWordFromCfg(117131047)
				local var_194_4 = arg_191_1:FormatText(var_194_3.content)

				arg_191_1.text_.text = var_194_4

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_5 = 69
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131047", "story_v_out_117131.awb") ~= 0 then
					local var_194_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131047", "story_v_out_117131.awb") / 1000

					if var_194_8 + var_194_0 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_8 + var_194_0
					end

					if var_194_3.prefab_name ~= "" and arg_191_1.actors_[var_194_3.prefab_name] ~= nil then
						local var_194_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_3.prefab_name].transform, "story_v_out_117131", "117131047", "story_v_out_117131.awb")

						arg_191_1:RecordAudio("117131047", var_194_9)
						arg_191_1:RecordAudio("117131047", var_194_9)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_117131", "117131047", "story_v_out_117131.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_117131", "117131047", "story_v_out_117131.awb")
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
	Play117131048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 117131048
		arg_195_1.duration_ = 10.366

		local var_195_0 = {
			zh = 10.366,
			ja = 9.8
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
				arg_195_0:Play117131049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 1.325

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_2 = arg_195_1:FormatText(StoryNameCfg[368].name)

				arg_195_1.leftNameTxt_.text = var_198_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_3 = arg_195_1:GetWordFromCfg(117131048)
				local var_198_4 = arg_195_1:FormatText(var_198_3.content)

				arg_195_1.text_.text = var_198_4

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_5 = 53
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131048", "story_v_out_117131.awb") ~= 0 then
					local var_198_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131048", "story_v_out_117131.awb") / 1000

					if var_198_8 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_8 + var_198_0
					end

					if var_198_3.prefab_name ~= "" and arg_195_1.actors_[var_198_3.prefab_name] ~= nil then
						local var_198_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_3.prefab_name].transform, "story_v_out_117131", "117131048", "story_v_out_117131.awb")

						arg_195_1:RecordAudio("117131048", var_198_9)
						arg_195_1:RecordAudio("117131048", var_198_9)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_117131", "117131048", "story_v_out_117131.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_117131", "117131048", "story_v_out_117131.awb")
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
	Play117131049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 117131049
		arg_199_1.duration_ = 13.3

		local var_199_0 = {
			zh = 9.3,
			ja = 13.3
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
				arg_199_0:Play117131050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 1.275

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_2 = arg_199_1:FormatText(StoryNameCfg[368].name)

				arg_199_1.leftNameTxt_.text = var_202_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_3 = arg_199_1:GetWordFromCfg(117131049)
				local var_202_4 = arg_199_1:FormatText(var_202_3.content)

				arg_199_1.text_.text = var_202_4

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_5 = 51
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131049", "story_v_out_117131.awb") ~= 0 then
					local var_202_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131049", "story_v_out_117131.awb") / 1000

					if var_202_8 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_8 + var_202_0
					end

					if var_202_3.prefab_name ~= "" and arg_199_1.actors_[var_202_3.prefab_name] ~= nil then
						local var_202_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_3.prefab_name].transform, "story_v_out_117131", "117131049", "story_v_out_117131.awb")

						arg_199_1:RecordAudio("117131049", var_202_9)
						arg_199_1:RecordAudio("117131049", var_202_9)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_117131", "117131049", "story_v_out_117131.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_117131", "117131049", "story_v_out_117131.awb")
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
	Play117131050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 117131050
		arg_203_1.duration_ = 8.2

		local var_203_0 = {
			zh = 8.2,
			ja = 6.333
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
				arg_203_0:Play117131051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = "TI0107"

			if arg_203_1.bgs_[var_206_0] == nil then
				local var_206_1 = Object.Instantiate(arg_203_1.paintGo_)

				var_206_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_206_0)
				var_206_1.name = var_206_0
				var_206_1.transform.parent = arg_203_1.stage_.transform
				var_206_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_203_1.bgs_[var_206_0] = var_206_1
			end

			local var_206_2 = 2

			if var_206_2 < arg_203_1.time_ and arg_203_1.time_ <= var_206_2 + arg_206_0 then
				local var_206_3 = manager.ui.mainCamera.transform.localPosition
				local var_206_4 = Vector3.New(0, 0, 10) + Vector3.New(var_206_3.x, var_206_3.y, 0)
				local var_206_5 = arg_203_1.bgs_.TI0107

				var_206_5.transform.localPosition = var_206_4
				var_206_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_206_6 = var_206_5:GetComponent("SpriteRenderer")

				if var_206_6 and var_206_6.sprite then
					local var_206_7 = (var_206_5.transform.localPosition - var_206_3).z
					local var_206_8 = manager.ui.mainCameraCom_
					local var_206_9 = 2 * var_206_7 * Mathf.Tan(var_206_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_206_10 = var_206_9 * var_206_8.aspect
					local var_206_11 = var_206_6.sprite.bounds.size.x
					local var_206_12 = var_206_6.sprite.bounds.size.y
					local var_206_13 = var_206_10 / var_206_11
					local var_206_14 = var_206_9 / var_206_12
					local var_206_15 = var_206_14 < var_206_13 and var_206_13 or var_206_14

					var_206_5.transform.localScale = Vector3.New(var_206_15, var_206_15, 0)
				end

				for iter_206_0, iter_206_1 in pairs(arg_203_1.bgs_) do
					if iter_206_0 ~= "TI0107" then
						iter_206_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_206_16 = 0

			if var_206_16 < arg_203_1.time_ and arg_203_1.time_ <= var_206_16 + arg_206_0 then
				arg_203_1.mask_.enabled = true
				arg_203_1.mask_.raycastTarget = true

				arg_203_1:SetGaussion(false)
			end

			local var_206_17 = 2

			if var_206_16 <= arg_203_1.time_ and arg_203_1.time_ < var_206_16 + var_206_17 then
				local var_206_18 = (arg_203_1.time_ - var_206_16) / var_206_17
				local var_206_19 = Color.New(0, 0, 0)

				var_206_19.a = Mathf.Lerp(0, 1, var_206_18)
				arg_203_1.mask_.color = var_206_19
			end

			if arg_203_1.time_ >= var_206_16 + var_206_17 and arg_203_1.time_ < var_206_16 + var_206_17 + arg_206_0 then
				local var_206_20 = Color.New(0, 0, 0)

				var_206_20.a = 1
				arg_203_1.mask_.color = var_206_20
			end

			local var_206_21 = 2

			if var_206_21 < arg_203_1.time_ and arg_203_1.time_ <= var_206_21 + arg_206_0 then
				arg_203_1.mask_.enabled = true
				arg_203_1.mask_.raycastTarget = true

				arg_203_1:SetGaussion(false)
			end

			local var_206_22 = 2

			if var_206_21 <= arg_203_1.time_ and arg_203_1.time_ < var_206_21 + var_206_22 then
				local var_206_23 = (arg_203_1.time_ - var_206_21) / var_206_22
				local var_206_24 = Color.New(0, 0, 0)

				var_206_24.a = Mathf.Lerp(1, 0, var_206_23)
				arg_203_1.mask_.color = var_206_24
			end

			if arg_203_1.time_ >= var_206_21 + var_206_22 and arg_203_1.time_ < var_206_21 + var_206_22 + arg_206_0 then
				local var_206_25 = Color.New(0, 0, 0)
				local var_206_26 = 0

				arg_203_1.mask_.enabled = false
				var_206_25.a = var_206_26
				arg_203_1.mask_.color = var_206_25
			end

			if arg_203_1.frameCnt_ <= 1 then
				arg_203_1.dialog_:SetActive(false)
			end

			local var_206_27 = 4
			local var_206_28 = 0.475

			if var_206_27 < arg_203_1.time_ and arg_203_1.time_ <= var_206_27 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0

				arg_203_1.dialog_:SetActive(true)

				local var_206_29 = LeanTween.value(arg_203_1.dialog_, 0, 1, 0.3)

				var_206_29:setOnUpdate(LuaHelper.FloatAction(function(arg_207_0)
					arg_203_1.dialogCg_.alpha = arg_207_0
				end))
				var_206_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_203_1.dialog_)
					var_206_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_203_1.duration_ = arg_203_1.duration_ + 0.3

				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_30 = arg_203_1:FormatText(StoryNameCfg[319].name)

				arg_203_1.leftNameTxt_.text = var_206_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, true)
				arg_203_1.iconController_:SetSelectedState("hero")

				arg_203_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_31 = arg_203_1:GetWordFromCfg(117131050)
				local var_206_32 = arg_203_1:FormatText(var_206_31.content)

				arg_203_1.text_.text = var_206_32

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_33 = 19
				local var_206_34 = utf8.len(var_206_32)
				local var_206_35 = var_206_33 <= 0 and var_206_28 or var_206_28 * (var_206_34 / var_206_33)

				if var_206_35 > 0 and var_206_28 < var_206_35 then
					arg_203_1.talkMaxDuration = var_206_35
					var_206_27 = var_206_27 + 0.3

					if var_206_35 + var_206_27 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_35 + var_206_27
					end
				end

				arg_203_1.text_.text = var_206_32
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131050", "story_v_out_117131.awb") ~= 0 then
					local var_206_36 = manager.audio:GetVoiceLength("story_v_out_117131", "117131050", "story_v_out_117131.awb") / 1000

					if var_206_36 + var_206_27 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_36 + var_206_27
					end

					if var_206_31.prefab_name ~= "" and arg_203_1.actors_[var_206_31.prefab_name] ~= nil then
						local var_206_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_31.prefab_name].transform, "story_v_out_117131", "117131050", "story_v_out_117131.awb")

						arg_203_1:RecordAudio("117131050", var_206_37)
						arg_203_1:RecordAudio("117131050", var_206_37)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_117131", "117131050", "story_v_out_117131.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_117131", "117131050", "story_v_out_117131.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_38 = var_206_27 + 0.3
			local var_206_39 = math.max(var_206_28, arg_203_1.talkMaxDuration)

			if var_206_38 <= arg_203_1.time_ and arg_203_1.time_ < var_206_38 + var_206_39 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_38) / var_206_39

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_38 + var_206_39 and arg_203_1.time_ < var_206_38 + var_206_39 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play117131051 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 117131051
		arg_209_1.duration_ = 9.466

		local var_209_0 = {
			zh = 9.466,
			ja = 7.233
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
				arg_209_0:Play117131052(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = 0
			local var_212_1 = 1

			if var_212_0 < arg_209_1.time_ and arg_209_1.time_ <= var_212_0 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_2 = arg_209_1:FormatText(StoryNameCfg[61].name)

				arg_209_1.leftNameTxt_.text = var_212_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_3 = arg_209_1:GetWordFromCfg(117131051)
				local var_212_4 = arg_209_1:FormatText(var_212_3.content)

				arg_209_1.text_.text = var_212_4

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_5 = 40
				local var_212_6 = utf8.len(var_212_4)
				local var_212_7 = var_212_5 <= 0 and var_212_1 or var_212_1 * (var_212_6 / var_212_5)

				if var_212_7 > 0 and var_212_1 < var_212_7 then
					arg_209_1.talkMaxDuration = var_212_7

					if var_212_7 + var_212_0 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_7 + var_212_0
					end
				end

				arg_209_1.text_.text = var_212_4
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131051", "story_v_out_117131.awb") ~= 0 then
					local var_212_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131051", "story_v_out_117131.awb") / 1000

					if var_212_8 + var_212_0 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_8 + var_212_0
					end

					if var_212_3.prefab_name ~= "" and arg_209_1.actors_[var_212_3.prefab_name] ~= nil then
						local var_212_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_3.prefab_name].transform, "story_v_out_117131", "117131051", "story_v_out_117131.awb")

						arg_209_1:RecordAudio("117131051", var_212_9)
						arg_209_1:RecordAudio("117131051", var_212_9)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_117131", "117131051", "story_v_out_117131.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_117131", "117131051", "story_v_out_117131.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_10 = math.max(var_212_1, arg_209_1.talkMaxDuration)

			if var_212_0 <= arg_209_1.time_ and arg_209_1.time_ < var_212_0 + var_212_10 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_0) / var_212_10

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_0 + var_212_10 and arg_209_1.time_ < var_212_0 + var_212_10 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play117131052 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 117131052
		arg_213_1.duration_ = 6.2

		local var_213_0 = {
			zh = 4.333,
			ja = 6.2
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
				arg_213_0:Play117131053(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = 0
			local var_216_1 = 0.35

			if var_216_0 < arg_213_1.time_ and arg_213_1.time_ <= var_216_0 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_2 = arg_213_1:FormatText(StoryNameCfg[319].name)

				arg_213_1.leftNameTxt_.text = var_216_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, true)
				arg_213_1.iconController_:SetSelectedState("hero")

				arg_213_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_3 = arg_213_1:GetWordFromCfg(117131052)
				local var_216_4 = arg_213_1:FormatText(var_216_3.content)

				arg_213_1.text_.text = var_216_4

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_5 = 14
				local var_216_6 = utf8.len(var_216_4)
				local var_216_7 = var_216_5 <= 0 and var_216_1 or var_216_1 * (var_216_6 / var_216_5)

				if var_216_7 > 0 and var_216_1 < var_216_7 then
					arg_213_1.talkMaxDuration = var_216_7

					if var_216_7 + var_216_0 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_7 + var_216_0
					end
				end

				arg_213_1.text_.text = var_216_4
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131052", "story_v_out_117131.awb") ~= 0 then
					local var_216_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131052", "story_v_out_117131.awb") / 1000

					if var_216_8 + var_216_0 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_8 + var_216_0
					end

					if var_216_3.prefab_name ~= "" and arg_213_1.actors_[var_216_3.prefab_name] ~= nil then
						local var_216_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_3.prefab_name].transform, "story_v_out_117131", "117131052", "story_v_out_117131.awb")

						arg_213_1:RecordAudio("117131052", var_216_9)
						arg_213_1:RecordAudio("117131052", var_216_9)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_117131", "117131052", "story_v_out_117131.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_117131", "117131052", "story_v_out_117131.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_10 = math.max(var_216_1, arg_213_1.talkMaxDuration)

			if var_216_0 <= arg_213_1.time_ and arg_213_1.time_ < var_216_0 + var_216_10 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_0) / var_216_10

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_0 + var_216_10 and arg_213_1.time_ < var_216_0 + var_216_10 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play117131053 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 117131053
		arg_217_1.duration_ = 10.9

		local var_217_0 = {
			zh = 7.233,
			ja = 10.9
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
				arg_217_0:Play117131054(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 0.825

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_2 = arg_217_1:FormatText(StoryNameCfg[61].name)

				arg_217_1.leftNameTxt_.text = var_220_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_3 = arg_217_1:GetWordFromCfg(117131053)
				local var_220_4 = arg_217_1:FormatText(var_220_3.content)

				arg_217_1.text_.text = var_220_4

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_5 = 33
				local var_220_6 = utf8.len(var_220_4)
				local var_220_7 = var_220_5 <= 0 and var_220_1 or var_220_1 * (var_220_6 / var_220_5)

				if var_220_7 > 0 and var_220_1 < var_220_7 then
					arg_217_1.talkMaxDuration = var_220_7

					if var_220_7 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_7 + var_220_0
					end
				end

				arg_217_1.text_.text = var_220_4
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131053", "story_v_out_117131.awb") ~= 0 then
					local var_220_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131053", "story_v_out_117131.awb") / 1000

					if var_220_8 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_8 + var_220_0
					end

					if var_220_3.prefab_name ~= "" and arg_217_1.actors_[var_220_3.prefab_name] ~= nil then
						local var_220_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_3.prefab_name].transform, "story_v_out_117131", "117131053", "story_v_out_117131.awb")

						arg_217_1:RecordAudio("117131053", var_220_9)
						arg_217_1:RecordAudio("117131053", var_220_9)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_117131", "117131053", "story_v_out_117131.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_117131", "117131053", "story_v_out_117131.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_10 = math.max(var_220_1, arg_217_1.talkMaxDuration)

			if var_220_0 <= arg_217_1.time_ and arg_217_1.time_ < var_220_0 + var_220_10 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_0) / var_220_10

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_0 + var_220_10 and arg_217_1.time_ < var_220_0 + var_220_10 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play117131054 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 117131054
		arg_221_1.duration_ = 5.466

		local var_221_0 = {
			zh = 5.466,
			ja = 2.866
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
				arg_221_0:Play117131055(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = 0
			local var_224_1 = 0.625

			if var_224_0 < arg_221_1.time_ and arg_221_1.time_ <= var_224_0 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_2 = arg_221_1:FormatText(StoryNameCfg[319].name)

				arg_221_1.leftNameTxt_.text = var_224_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, true)
				arg_221_1.iconController_:SetSelectedState("hero")

				arg_221_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_3 = arg_221_1:GetWordFromCfg(117131054)
				local var_224_4 = arg_221_1:FormatText(var_224_3.content)

				arg_221_1.text_.text = var_224_4

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131054", "story_v_out_117131.awb") ~= 0 then
					local var_224_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131054", "story_v_out_117131.awb") / 1000

					if var_224_8 + var_224_0 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_8 + var_224_0
					end

					if var_224_3.prefab_name ~= "" and arg_221_1.actors_[var_224_3.prefab_name] ~= nil then
						local var_224_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_3.prefab_name].transform, "story_v_out_117131", "117131054", "story_v_out_117131.awb")

						arg_221_1:RecordAudio("117131054", var_224_9)
						arg_221_1:RecordAudio("117131054", var_224_9)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_117131", "117131054", "story_v_out_117131.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_117131", "117131054", "story_v_out_117131.awb")
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
	Play117131055 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 117131055
		arg_225_1.duration_ = 11.633

		local var_225_0 = {
			zh = 11.633,
			ja = 10.633
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
				arg_225_0:Play117131056(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0
			local var_228_1 = 1.45

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

				local var_228_3 = arg_225_1:GetWordFromCfg(117131055)
				local var_228_4 = arg_225_1:FormatText(var_228_3.content)

				arg_225_1.text_.text = var_228_4

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_5 = 58
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131055", "story_v_out_117131.awb") ~= 0 then
					local var_228_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131055", "story_v_out_117131.awb") / 1000

					if var_228_8 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_8 + var_228_0
					end

					if var_228_3.prefab_name ~= "" and arg_225_1.actors_[var_228_3.prefab_name] ~= nil then
						local var_228_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_3.prefab_name].transform, "story_v_out_117131", "117131055", "story_v_out_117131.awb")

						arg_225_1:RecordAudio("117131055", var_228_9)
						arg_225_1:RecordAudio("117131055", var_228_9)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_117131", "117131055", "story_v_out_117131.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_117131", "117131055", "story_v_out_117131.awb")
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
	Play117131056 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 117131056
		arg_229_1.duration_ = 1.733

		local var_229_0 = {
			zh = 1.2,
			ja = 1.733
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
				arg_229_0:Play117131057(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = 0
			local var_232_1 = 0.1

			if var_232_0 < arg_229_1.time_ and arg_229_1.time_ <= var_232_0 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_2 = arg_229_1:FormatText(StoryNameCfg[319].name)

				arg_229_1.leftNameTxt_.text = var_232_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, true)
				arg_229_1.iconController_:SetSelectedState("hero")

				arg_229_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_3 = arg_229_1:GetWordFromCfg(117131056)
				local var_232_4 = arg_229_1:FormatText(var_232_3.content)

				arg_229_1.text_.text = var_232_4

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_5 = 4
				local var_232_6 = utf8.len(var_232_4)
				local var_232_7 = var_232_5 <= 0 and var_232_1 or var_232_1 * (var_232_6 / var_232_5)

				if var_232_7 > 0 and var_232_1 < var_232_7 then
					arg_229_1.talkMaxDuration = var_232_7

					if var_232_7 + var_232_0 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_7 + var_232_0
					end
				end

				arg_229_1.text_.text = var_232_4
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131056", "story_v_out_117131.awb") ~= 0 then
					local var_232_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131056", "story_v_out_117131.awb") / 1000

					if var_232_8 + var_232_0 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_8 + var_232_0
					end

					if var_232_3.prefab_name ~= "" and arg_229_1.actors_[var_232_3.prefab_name] ~= nil then
						local var_232_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_3.prefab_name].transform, "story_v_out_117131", "117131056", "story_v_out_117131.awb")

						arg_229_1:RecordAudio("117131056", var_232_9)
						arg_229_1:RecordAudio("117131056", var_232_9)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_117131", "117131056", "story_v_out_117131.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_117131", "117131056", "story_v_out_117131.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_10 = math.max(var_232_1, arg_229_1.talkMaxDuration)

			if var_232_0 <= arg_229_1.time_ and arg_229_1.time_ < var_232_0 + var_232_10 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_0) / var_232_10

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_0 + var_232_10 and arg_229_1.time_ < var_232_0 + var_232_10 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play117131057 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 117131057
		arg_233_1.duration_ = 10.9

		local var_233_0 = {
			zh = 10.9,
			ja = 10.833
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
				arg_233_0:Play117131058(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 0
			local var_236_1 = 1.175

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_2 = arg_233_1:FormatText(StoryNameCfg[61].name)

				arg_233_1.leftNameTxt_.text = var_236_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_3 = arg_233_1:GetWordFromCfg(117131057)
				local var_236_4 = arg_233_1:FormatText(var_236_3.content)

				arg_233_1.text_.text = var_236_4

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_5 = 47
				local var_236_6 = utf8.len(var_236_4)
				local var_236_7 = var_236_5 <= 0 and var_236_1 or var_236_1 * (var_236_6 / var_236_5)

				if var_236_7 > 0 and var_236_1 < var_236_7 then
					arg_233_1.talkMaxDuration = var_236_7

					if var_236_7 + var_236_0 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_7 + var_236_0
					end
				end

				arg_233_1.text_.text = var_236_4
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131057", "story_v_out_117131.awb") ~= 0 then
					local var_236_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131057", "story_v_out_117131.awb") / 1000

					if var_236_8 + var_236_0 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_8 + var_236_0
					end

					if var_236_3.prefab_name ~= "" and arg_233_1.actors_[var_236_3.prefab_name] ~= nil then
						local var_236_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_3.prefab_name].transform, "story_v_out_117131", "117131057", "story_v_out_117131.awb")

						arg_233_1:RecordAudio("117131057", var_236_9)
						arg_233_1:RecordAudio("117131057", var_236_9)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_117131", "117131057", "story_v_out_117131.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_117131", "117131057", "story_v_out_117131.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_10 = math.max(var_236_1, arg_233_1.talkMaxDuration)

			if var_236_0 <= arg_233_1.time_ and arg_233_1.time_ < var_236_0 + var_236_10 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_0) / var_236_10

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_0 + var_236_10 and arg_233_1.time_ < var_236_0 + var_236_10 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play117131058 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 117131058
		arg_237_1.duration_ = 5

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play117131059(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = 0
			local var_240_1 = 0.35

			if var_240_0 < arg_237_1.time_ and arg_237_1.time_ <= var_240_0 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, false)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_2 = arg_237_1:GetWordFromCfg(117131058)
				local var_240_3 = arg_237_1:FormatText(var_240_2.content)

				arg_237_1.text_.text = var_240_3

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_4 = 14
				local var_240_5 = utf8.len(var_240_3)
				local var_240_6 = var_240_4 <= 0 and var_240_1 or var_240_1 * (var_240_5 / var_240_4)

				if var_240_6 > 0 and var_240_1 < var_240_6 then
					arg_237_1.talkMaxDuration = var_240_6

					if var_240_6 + var_240_0 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_6 + var_240_0
					end
				end

				arg_237_1.text_.text = var_240_3
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)
				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_7 = math.max(var_240_1, arg_237_1.talkMaxDuration)

			if var_240_0 <= arg_237_1.time_ and arg_237_1.time_ < var_240_0 + var_240_7 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_0) / var_240_7

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_0 + var_240_7 and arg_237_1.time_ < var_240_0 + var_240_7 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play117131059 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 117131059
		arg_241_1.duration_ = 4.2

		local var_241_0 = {
			zh = 4.1,
			ja = 4.2
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
				arg_241_0:Play117131060(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = 0
			local var_244_1 = 0.375

			if var_244_0 < arg_241_1.time_ and arg_241_1.time_ <= var_244_0 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_2 = arg_241_1:FormatText(StoryNameCfg[319].name)

				arg_241_1.leftNameTxt_.text = var_244_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, true)
				arg_241_1.iconController_:SetSelectedState("hero")

				arg_241_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_3 = arg_241_1:GetWordFromCfg(117131059)
				local var_244_4 = arg_241_1:FormatText(var_244_3.content)

				arg_241_1.text_.text = var_244_4

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_5 = 15
				local var_244_6 = utf8.len(var_244_4)
				local var_244_7 = var_244_5 <= 0 and var_244_1 or var_244_1 * (var_244_6 / var_244_5)

				if var_244_7 > 0 and var_244_1 < var_244_7 then
					arg_241_1.talkMaxDuration = var_244_7

					if var_244_7 + var_244_0 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_7 + var_244_0
					end
				end

				arg_241_1.text_.text = var_244_4
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131059", "story_v_out_117131.awb") ~= 0 then
					local var_244_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131059", "story_v_out_117131.awb") / 1000

					if var_244_8 + var_244_0 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_8 + var_244_0
					end

					if var_244_3.prefab_name ~= "" and arg_241_1.actors_[var_244_3.prefab_name] ~= nil then
						local var_244_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_3.prefab_name].transform, "story_v_out_117131", "117131059", "story_v_out_117131.awb")

						arg_241_1:RecordAudio("117131059", var_244_9)
						arg_241_1:RecordAudio("117131059", var_244_9)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_117131", "117131059", "story_v_out_117131.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_117131", "117131059", "story_v_out_117131.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_10 = math.max(var_244_1, arg_241_1.talkMaxDuration)

			if var_244_0 <= arg_241_1.time_ and arg_241_1.time_ < var_244_0 + var_244_10 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_0) / var_244_10

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_0 + var_244_10 and arg_241_1.time_ < var_244_0 + var_244_10 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play117131060 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 117131060
		arg_245_1.duration_ = 5

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play117131061(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 0
			local var_248_1 = 0.525

			if var_248_0 < arg_245_1.time_ and arg_245_1.time_ <= var_248_0 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, false)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_2 = arg_245_1:GetWordFromCfg(117131060)
				local var_248_3 = arg_245_1:FormatText(var_248_2.content)

				arg_245_1.text_.text = var_248_3

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_4 = 21
				local var_248_5 = utf8.len(var_248_3)
				local var_248_6 = var_248_4 <= 0 and var_248_1 or var_248_1 * (var_248_5 / var_248_4)

				if var_248_6 > 0 and var_248_1 < var_248_6 then
					arg_245_1.talkMaxDuration = var_248_6

					if var_248_6 + var_248_0 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_6 + var_248_0
					end
				end

				arg_245_1.text_.text = var_248_3
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)
				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_7 = math.max(var_248_1, arg_245_1.talkMaxDuration)

			if var_248_0 <= arg_245_1.time_ and arg_245_1.time_ < var_248_0 + var_248_7 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_0) / var_248_7

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_0 + var_248_7 and arg_245_1.time_ < var_248_0 + var_248_7 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play117131061 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 117131061
		arg_249_1.duration_ = 15.266

		local var_249_0 = {
			zh = 15.266,
			ja = 12.866
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
				arg_249_0:Play117131062(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = 0
			local var_252_1 = 1.875

			if var_252_0 < arg_249_1.time_ and arg_249_1.time_ <= var_252_0 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_2 = arg_249_1:FormatText(StoryNameCfg[61].name)

				arg_249_1.leftNameTxt_.text = var_252_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_3 = arg_249_1:GetWordFromCfg(117131061)
				local var_252_4 = arg_249_1:FormatText(var_252_3.content)

				arg_249_1.text_.text = var_252_4

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_5 = 75
				local var_252_6 = utf8.len(var_252_4)
				local var_252_7 = var_252_5 <= 0 and var_252_1 or var_252_1 * (var_252_6 / var_252_5)

				if var_252_7 > 0 and var_252_1 < var_252_7 then
					arg_249_1.talkMaxDuration = var_252_7

					if var_252_7 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_7 + var_252_0
					end
				end

				arg_249_1.text_.text = var_252_4
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131061", "story_v_out_117131.awb") ~= 0 then
					local var_252_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131061", "story_v_out_117131.awb") / 1000

					if var_252_8 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_8 + var_252_0
					end

					if var_252_3.prefab_name ~= "" and arg_249_1.actors_[var_252_3.prefab_name] ~= nil then
						local var_252_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_3.prefab_name].transform, "story_v_out_117131", "117131061", "story_v_out_117131.awb")

						arg_249_1:RecordAudio("117131061", var_252_9)
						arg_249_1:RecordAudio("117131061", var_252_9)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_117131", "117131061", "story_v_out_117131.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_117131", "117131061", "story_v_out_117131.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_10 = math.max(var_252_1, arg_249_1.talkMaxDuration)

			if var_252_0 <= arg_249_1.time_ and arg_249_1.time_ < var_252_0 + var_252_10 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_0) / var_252_10

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_0 + var_252_10 and arg_249_1.time_ < var_252_0 + var_252_10 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play117131062 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 117131062
		arg_253_1.duration_ = 3

		local var_253_0 = {
			zh = 2.233,
			ja = 3
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
				arg_253_0:Play117131063(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0
			local var_256_1 = 0.225

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_2 = arg_253_1:FormatText(StoryNameCfg[319].name)

				arg_253_1.leftNameTxt_.text = var_256_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, true)
				arg_253_1.iconController_:SetSelectedState("hero")

				arg_253_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_3 = arg_253_1:GetWordFromCfg(117131062)
				local var_256_4 = arg_253_1:FormatText(var_256_3.content)

				arg_253_1.text_.text = var_256_4

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_5 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131062", "story_v_out_117131.awb") ~= 0 then
					local var_256_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131062", "story_v_out_117131.awb") / 1000

					if var_256_8 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_8 + var_256_0
					end

					if var_256_3.prefab_name ~= "" and arg_253_1.actors_[var_256_3.prefab_name] ~= nil then
						local var_256_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_3.prefab_name].transform, "story_v_out_117131", "117131062", "story_v_out_117131.awb")

						arg_253_1:RecordAudio("117131062", var_256_9)
						arg_253_1:RecordAudio("117131062", var_256_9)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_117131", "117131062", "story_v_out_117131.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_117131", "117131062", "story_v_out_117131.awb")
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
	Play117131063 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 117131063
		arg_257_1.duration_ = 10.033

		local var_257_0 = {
			zh = 7.233,
			ja = 10.033
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
				arg_257_0:Play117131064(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0
			local var_260_1 = 0.875

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_2 = arg_257_1:FormatText(StoryNameCfg[61].name)

				arg_257_1.leftNameTxt_.text = var_260_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_3 = arg_257_1:GetWordFromCfg(117131063)
				local var_260_4 = arg_257_1:FormatText(var_260_3.content)

				arg_257_1.text_.text = var_260_4

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131063", "story_v_out_117131.awb") ~= 0 then
					local var_260_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131063", "story_v_out_117131.awb") / 1000

					if var_260_8 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_8 + var_260_0
					end

					if var_260_3.prefab_name ~= "" and arg_257_1.actors_[var_260_3.prefab_name] ~= nil then
						local var_260_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_3.prefab_name].transform, "story_v_out_117131", "117131063", "story_v_out_117131.awb")

						arg_257_1:RecordAudio("117131063", var_260_9)
						arg_257_1:RecordAudio("117131063", var_260_9)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_117131", "117131063", "story_v_out_117131.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_117131", "117131063", "story_v_out_117131.awb")
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
	Play117131064 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 117131064
		arg_261_1.duration_ = 3

		local var_261_0 = {
			zh = 3,
			ja = 2.6
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
				arg_261_0:Play117131065(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0
			local var_264_1 = 0.325

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_2 = arg_261_1:FormatText(StoryNameCfg[319].name)

				arg_261_1.leftNameTxt_.text = var_264_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, true)
				arg_261_1.iconController_:SetSelectedState("hero")

				arg_261_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_3 = arg_261_1:GetWordFromCfg(117131064)
				local var_264_4 = arg_261_1:FormatText(var_264_3.content)

				arg_261_1.text_.text = var_264_4

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_5 = 13
				local var_264_6 = utf8.len(var_264_4)
				local var_264_7 = var_264_5 <= 0 and var_264_1 or var_264_1 * (var_264_6 / var_264_5)

				if var_264_7 > 0 and var_264_1 < var_264_7 then
					arg_261_1.talkMaxDuration = var_264_7

					if var_264_7 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_7 + var_264_0
					end
				end

				arg_261_1.text_.text = var_264_4
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131064", "story_v_out_117131.awb") ~= 0 then
					local var_264_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131064", "story_v_out_117131.awb") / 1000

					if var_264_8 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_8 + var_264_0
					end

					if var_264_3.prefab_name ~= "" and arg_261_1.actors_[var_264_3.prefab_name] ~= nil then
						local var_264_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_3.prefab_name].transform, "story_v_out_117131", "117131064", "story_v_out_117131.awb")

						arg_261_1:RecordAudio("117131064", var_264_9)
						arg_261_1:RecordAudio("117131064", var_264_9)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_117131", "117131064", "story_v_out_117131.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_117131", "117131064", "story_v_out_117131.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_10 = math.max(var_264_1, arg_261_1.talkMaxDuration)

			if var_264_0 <= arg_261_1.time_ and arg_261_1.time_ < var_264_0 + var_264_10 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_0) / var_264_10

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_0 + var_264_10 and arg_261_1.time_ < var_264_0 + var_264_10 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play117131065 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 117131065
		arg_265_1.duration_ = 11.366

		local var_265_0 = {
			zh = 9.9,
			ja = 11.366
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
				arg_265_0:Play117131066(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0
			local var_268_1 = 1.125

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_2 = arg_265_1:FormatText(StoryNameCfg[61].name)

				arg_265_1.leftNameTxt_.text = var_268_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_3 = arg_265_1:GetWordFromCfg(117131065)
				local var_268_4 = arg_265_1:FormatText(var_268_3.content)

				arg_265_1.text_.text = var_268_4

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_5 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131065", "story_v_out_117131.awb") ~= 0 then
					local var_268_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131065", "story_v_out_117131.awb") / 1000

					if var_268_8 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_8 + var_268_0
					end

					if var_268_3.prefab_name ~= "" and arg_265_1.actors_[var_268_3.prefab_name] ~= nil then
						local var_268_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_3.prefab_name].transform, "story_v_out_117131", "117131065", "story_v_out_117131.awb")

						arg_265_1:RecordAudio("117131065", var_268_9)
						arg_265_1:RecordAudio("117131065", var_268_9)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_117131", "117131065", "story_v_out_117131.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_117131", "117131065", "story_v_out_117131.awb")
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
	Play117131066 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 117131066
		arg_269_1.duration_ = 10.2

		local var_269_0 = {
			zh = 10.2,
			ja = 7.6
		}
		local var_269_1 = manager.audio:GetLocalizationFlag()

		if var_269_0[var_269_1] ~= nil then
			arg_269_1.duration_ = var_269_0[var_269_1]
		end

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play117131067(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = 0
			local var_272_1 = 1.275

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_2 = arg_269_1:FormatText(StoryNameCfg[319].name)

				arg_269_1.leftNameTxt_.text = var_272_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, true)
				arg_269_1.iconController_:SetSelectedState("hero")

				arg_269_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_3 = arg_269_1:GetWordFromCfg(117131066)
				local var_272_4 = arg_269_1:FormatText(var_272_3.content)

				arg_269_1.text_.text = var_272_4

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_5 = 51
				local var_272_6 = utf8.len(var_272_4)
				local var_272_7 = var_272_5 <= 0 and var_272_1 or var_272_1 * (var_272_6 / var_272_5)

				if var_272_7 > 0 and var_272_1 < var_272_7 then
					arg_269_1.talkMaxDuration = var_272_7

					if var_272_7 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_7 + var_272_0
					end
				end

				arg_269_1.text_.text = var_272_4
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131066", "story_v_out_117131.awb") ~= 0 then
					local var_272_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131066", "story_v_out_117131.awb") / 1000

					if var_272_8 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_8 + var_272_0
					end

					if var_272_3.prefab_name ~= "" and arg_269_1.actors_[var_272_3.prefab_name] ~= nil then
						local var_272_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_3.prefab_name].transform, "story_v_out_117131", "117131066", "story_v_out_117131.awb")

						arg_269_1:RecordAudio("117131066", var_272_9)
						arg_269_1:RecordAudio("117131066", var_272_9)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_117131", "117131066", "story_v_out_117131.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_117131", "117131066", "story_v_out_117131.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_10 = math.max(var_272_1, arg_269_1.talkMaxDuration)

			if var_272_0 <= arg_269_1.time_ and arg_269_1.time_ < var_272_0 + var_272_10 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_0) / var_272_10

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_0 + var_272_10 and arg_269_1.time_ < var_272_0 + var_272_10 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play117131067 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 117131067
		arg_273_1.duration_ = 15.666

		local var_273_0 = {
			zh = 15.666,
			ja = 8.833
		}
		local var_273_1 = manager.audio:GetLocalizationFlag()

		if var_273_0[var_273_1] ~= nil then
			arg_273_1.duration_ = var_273_0[var_273_1]
		end

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play117131068(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 1.85

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_2 = arg_273_1:FormatText(StoryNameCfg[61].name)

				arg_273_1.leftNameTxt_.text = var_276_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_3 = arg_273_1:GetWordFromCfg(117131067)
				local var_276_4 = arg_273_1:FormatText(var_276_3.content)

				arg_273_1.text_.text = var_276_4

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_5 = 74
				local var_276_6 = utf8.len(var_276_4)
				local var_276_7 = var_276_5 <= 0 and var_276_1 or var_276_1 * (var_276_6 / var_276_5)

				if var_276_7 > 0 and var_276_1 < var_276_7 then
					arg_273_1.talkMaxDuration = var_276_7

					if var_276_7 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_7 + var_276_0
					end
				end

				arg_273_1.text_.text = var_276_4
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131067", "story_v_out_117131.awb") ~= 0 then
					local var_276_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131067", "story_v_out_117131.awb") / 1000

					if var_276_8 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_8 + var_276_0
					end

					if var_276_3.prefab_name ~= "" and arg_273_1.actors_[var_276_3.prefab_name] ~= nil then
						local var_276_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_3.prefab_name].transform, "story_v_out_117131", "117131067", "story_v_out_117131.awb")

						arg_273_1:RecordAudio("117131067", var_276_9)
						arg_273_1:RecordAudio("117131067", var_276_9)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_117131", "117131067", "story_v_out_117131.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_117131", "117131067", "story_v_out_117131.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_10 = math.max(var_276_1, arg_273_1.talkMaxDuration)

			if var_276_0 <= arg_273_1.time_ and arg_273_1.time_ < var_276_0 + var_276_10 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_0) / var_276_10

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_0 + var_276_10 and arg_273_1.time_ < var_276_0 + var_276_10 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play117131068 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 117131068
		arg_277_1.duration_ = 8.466

		local var_277_0 = {
			zh = 7.2,
			ja = 8.466
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
				arg_277_0:Play117131069(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0
			local var_280_1 = 0.775

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_2 = arg_277_1:FormatText(StoryNameCfg[61].name)

				arg_277_1.leftNameTxt_.text = var_280_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_3 = arg_277_1:GetWordFromCfg(117131068)
				local var_280_4 = arg_277_1:FormatText(var_280_3.content)

				arg_277_1.text_.text = var_280_4

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_5 = 31
				local var_280_6 = utf8.len(var_280_4)
				local var_280_7 = var_280_5 <= 0 and var_280_1 or var_280_1 * (var_280_6 / var_280_5)

				if var_280_7 > 0 and var_280_1 < var_280_7 then
					arg_277_1.talkMaxDuration = var_280_7

					if var_280_7 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_7 + var_280_0
					end
				end

				arg_277_1.text_.text = var_280_4
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131068", "story_v_out_117131.awb") ~= 0 then
					local var_280_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131068", "story_v_out_117131.awb") / 1000

					if var_280_8 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_8 + var_280_0
					end

					if var_280_3.prefab_name ~= "" and arg_277_1.actors_[var_280_3.prefab_name] ~= nil then
						local var_280_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_3.prefab_name].transform, "story_v_out_117131", "117131068", "story_v_out_117131.awb")

						arg_277_1:RecordAudio("117131068", var_280_9)
						arg_277_1:RecordAudio("117131068", var_280_9)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_117131", "117131068", "story_v_out_117131.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_117131", "117131068", "story_v_out_117131.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_10 = math.max(var_280_1, arg_277_1.talkMaxDuration)

			if var_280_0 <= arg_277_1.time_ and arg_277_1.time_ < var_280_0 + var_280_10 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_0) / var_280_10

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_0 + var_280_10 and arg_277_1.time_ < var_280_0 + var_280_10 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play117131069 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 117131069
		arg_281_1.duration_ = 2.9

		local var_281_0 = {
			zh = 0.999999999999,
			ja = 2.9
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
				arg_281_0:Play117131070(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = 0
			local var_284_1 = 0.05

			if var_284_0 < arg_281_1.time_ and arg_281_1.time_ <= var_284_0 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_2 = arg_281_1:FormatText(StoryNameCfg[319].name)

				arg_281_1.leftNameTxt_.text = var_284_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, true)
				arg_281_1.iconController_:SetSelectedState("hero")

				arg_281_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_3 = arg_281_1:GetWordFromCfg(117131069)
				local var_284_4 = arg_281_1:FormatText(var_284_3.content)

				arg_281_1.text_.text = var_284_4

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_5 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131069", "story_v_out_117131.awb") ~= 0 then
					local var_284_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131069", "story_v_out_117131.awb") / 1000

					if var_284_8 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_8 + var_284_0
					end

					if var_284_3.prefab_name ~= "" and arg_281_1.actors_[var_284_3.prefab_name] ~= nil then
						local var_284_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_3.prefab_name].transform, "story_v_out_117131", "117131069", "story_v_out_117131.awb")

						arg_281_1:RecordAudio("117131069", var_284_9)
						arg_281_1:RecordAudio("117131069", var_284_9)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_117131", "117131069", "story_v_out_117131.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_117131", "117131069", "story_v_out_117131.awb")
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
	Play117131070 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 117131070
		arg_285_1.duration_ = 14.2

		local var_285_0 = {
			zh = 14.2,
			ja = 10.7
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
				arg_285_0:Play117131071(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 1.925

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[61].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(117131070)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 76
				local var_288_6 = utf8.len(var_288_4)
				local var_288_7 = var_288_5 <= 0 and var_288_1 or var_288_1 * (var_288_6 / var_288_5)

				if var_288_7 > 0 and var_288_1 < var_288_7 then
					arg_285_1.talkMaxDuration = var_288_7

					if var_288_7 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_7 + var_288_0
					end
				end

				arg_285_1.text_.text = var_288_4
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131070", "story_v_out_117131.awb") ~= 0 then
					local var_288_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131070", "story_v_out_117131.awb") / 1000

					if var_288_8 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_0
					end

					if var_288_3.prefab_name ~= "" and arg_285_1.actors_[var_288_3.prefab_name] ~= nil then
						local var_288_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_3.prefab_name].transform, "story_v_out_117131", "117131070", "story_v_out_117131.awb")

						arg_285_1:RecordAudio("117131070", var_288_9)
						arg_285_1:RecordAudio("117131070", var_288_9)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_117131", "117131070", "story_v_out_117131.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_117131", "117131070", "story_v_out_117131.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_10 = math.max(var_288_1, arg_285_1.talkMaxDuration)

			if var_288_0 <= arg_285_1.time_ and arg_285_1.time_ < var_288_0 + var_288_10 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_0) / var_288_10

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_0 + var_288_10 and arg_285_1.time_ < var_288_0 + var_288_10 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play117131071 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 117131071
		arg_289_1.duration_ = 10.366

		local var_289_0 = {
			zh = 6.366,
			ja = 10.366
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
				arg_289_0:Play117131072(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 0.725

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_2 = arg_289_1:FormatText(StoryNameCfg[61].name)

				arg_289_1.leftNameTxt_.text = var_292_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_3 = arg_289_1:GetWordFromCfg(117131071)
				local var_292_4 = arg_289_1:FormatText(var_292_3.content)

				arg_289_1.text_.text = var_292_4

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_5 = 29
				local var_292_6 = utf8.len(var_292_4)
				local var_292_7 = var_292_5 <= 0 and var_292_1 or var_292_1 * (var_292_6 / var_292_5)

				if var_292_7 > 0 and var_292_1 < var_292_7 then
					arg_289_1.talkMaxDuration = var_292_7

					if var_292_7 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_7 + var_292_0
					end
				end

				arg_289_1.text_.text = var_292_4
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131071", "story_v_out_117131.awb") ~= 0 then
					local var_292_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131071", "story_v_out_117131.awb") / 1000

					if var_292_8 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_8 + var_292_0
					end

					if var_292_3.prefab_name ~= "" and arg_289_1.actors_[var_292_3.prefab_name] ~= nil then
						local var_292_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_3.prefab_name].transform, "story_v_out_117131", "117131071", "story_v_out_117131.awb")

						arg_289_1:RecordAudio("117131071", var_292_9)
						arg_289_1:RecordAudio("117131071", var_292_9)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_117131", "117131071", "story_v_out_117131.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_117131", "117131071", "story_v_out_117131.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_10 = math.max(var_292_1, arg_289_1.talkMaxDuration)

			if var_292_0 <= arg_289_1.time_ and arg_289_1.time_ < var_292_0 + var_292_10 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_0) / var_292_10

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_0 + var_292_10 and arg_289_1.time_ < var_292_0 + var_292_10 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play117131072 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 117131072
		arg_293_1.duration_ = 16.566

		local var_293_0 = {
			zh = 10.2,
			ja = 16.566
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
				arg_293_0:Play117131073(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = 0
			local var_296_1 = 1.275

			if var_296_0 < arg_293_1.time_ and arg_293_1.time_ <= var_296_0 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_2 = arg_293_1:FormatText(StoryNameCfg[61].name)

				arg_293_1.leftNameTxt_.text = var_296_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_3 = arg_293_1:GetWordFromCfg(117131072)
				local var_296_4 = arg_293_1:FormatText(var_296_3.content)

				arg_293_1.text_.text = var_296_4

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_5 = 51
				local var_296_6 = utf8.len(var_296_4)
				local var_296_7 = var_296_5 <= 0 and var_296_1 or var_296_1 * (var_296_6 / var_296_5)

				if var_296_7 > 0 and var_296_1 < var_296_7 then
					arg_293_1.talkMaxDuration = var_296_7

					if var_296_7 + var_296_0 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_7 + var_296_0
					end
				end

				arg_293_1.text_.text = var_296_4
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131072", "story_v_out_117131.awb") ~= 0 then
					local var_296_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131072", "story_v_out_117131.awb") / 1000

					if var_296_8 + var_296_0 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_8 + var_296_0
					end

					if var_296_3.prefab_name ~= "" and arg_293_1.actors_[var_296_3.prefab_name] ~= nil then
						local var_296_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_3.prefab_name].transform, "story_v_out_117131", "117131072", "story_v_out_117131.awb")

						arg_293_1:RecordAudio("117131072", var_296_9)
						arg_293_1:RecordAudio("117131072", var_296_9)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_117131", "117131072", "story_v_out_117131.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_117131", "117131072", "story_v_out_117131.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_10 = math.max(var_296_1, arg_293_1.talkMaxDuration)

			if var_296_0 <= arg_293_1.time_ and arg_293_1.time_ < var_296_0 + var_296_10 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_0) / var_296_10

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_0 + var_296_10 and arg_293_1.time_ < var_296_0 + var_296_10 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play117131073 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 117131073
		arg_297_1.duration_ = 14.266

		local var_297_0 = {
			zh = 9.8,
			ja = 14.266
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
				arg_297_0:Play117131074(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0
			local var_300_1 = 1.075

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_2 = arg_297_1:FormatText(StoryNameCfg[61].name)

				arg_297_1.leftNameTxt_.text = var_300_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_3 = arg_297_1:GetWordFromCfg(117131073)
				local var_300_4 = arg_297_1:FormatText(var_300_3.content)

				arg_297_1.text_.text = var_300_4

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_5 = 43
				local var_300_6 = utf8.len(var_300_4)
				local var_300_7 = var_300_5 <= 0 and var_300_1 or var_300_1 * (var_300_6 / var_300_5)

				if var_300_7 > 0 and var_300_1 < var_300_7 then
					arg_297_1.talkMaxDuration = var_300_7

					if var_300_7 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_7 + var_300_0
					end
				end

				arg_297_1.text_.text = var_300_4
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131073", "story_v_out_117131.awb") ~= 0 then
					local var_300_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131073", "story_v_out_117131.awb") / 1000

					if var_300_8 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_8 + var_300_0
					end

					if var_300_3.prefab_name ~= "" and arg_297_1.actors_[var_300_3.prefab_name] ~= nil then
						local var_300_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_3.prefab_name].transform, "story_v_out_117131", "117131073", "story_v_out_117131.awb")

						arg_297_1:RecordAudio("117131073", var_300_9)
						arg_297_1:RecordAudio("117131073", var_300_9)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_117131", "117131073", "story_v_out_117131.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_117131", "117131073", "story_v_out_117131.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_10 = math.max(var_300_1, arg_297_1.talkMaxDuration)

			if var_300_0 <= arg_297_1.time_ and arg_297_1.time_ < var_300_0 + var_300_10 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_0) / var_300_10

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_0 + var_300_10 and arg_297_1.time_ < var_300_0 + var_300_10 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play117131074 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 117131074
		arg_301_1.duration_ = 5

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play117131075(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0
			local var_304_1 = 1.15

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, false)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_2 = arg_301_1:GetWordFromCfg(117131074)
				local var_304_3 = arg_301_1:FormatText(var_304_2.content)

				arg_301_1.text_.text = var_304_3

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_4 = 46
				local var_304_5 = utf8.len(var_304_3)
				local var_304_6 = var_304_4 <= 0 and var_304_1 or var_304_1 * (var_304_5 / var_304_4)

				if var_304_6 > 0 and var_304_1 < var_304_6 then
					arg_301_1.talkMaxDuration = var_304_6

					if var_304_6 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_6 + var_304_0
					end
				end

				arg_301_1.text_.text = var_304_3
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)
				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_7 = math.max(var_304_1, arg_301_1.talkMaxDuration)

			if var_304_0 <= arg_301_1.time_ and arg_301_1.time_ < var_304_0 + var_304_7 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_0) / var_304_7

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_0 + var_304_7 and arg_301_1.time_ < var_304_0 + var_304_7 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play117131075 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 117131075
		arg_305_1.duration_ = 4.266

		local var_305_0 = {
			zh = 2.5,
			ja = 4.266
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
				arg_305_0:Play117131076(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0
			local var_308_1 = 0.325

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_2 = arg_305_1:FormatText(StoryNameCfg[319].name)

				arg_305_1.leftNameTxt_.text = var_308_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, true)
				arg_305_1.iconController_:SetSelectedState("hero")

				arg_305_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_3 = arg_305_1:GetWordFromCfg(117131075)
				local var_308_4 = arg_305_1:FormatText(var_308_3.content)

				arg_305_1.text_.text = var_308_4

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131075", "story_v_out_117131.awb") ~= 0 then
					local var_308_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131075", "story_v_out_117131.awb") / 1000

					if var_308_8 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_8 + var_308_0
					end

					if var_308_3.prefab_name ~= "" and arg_305_1.actors_[var_308_3.prefab_name] ~= nil then
						local var_308_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_3.prefab_name].transform, "story_v_out_117131", "117131075", "story_v_out_117131.awb")

						arg_305_1:RecordAudio("117131075", var_308_9)
						arg_305_1:RecordAudio("117131075", var_308_9)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_117131", "117131075", "story_v_out_117131.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_117131", "117131075", "story_v_out_117131.awb")
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
	Play117131076 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 117131076
		arg_309_1.duration_ = 5.6

		local var_309_0 = {
			zh = 3.5,
			ja = 5.6
		}
		local var_309_1 = manager.audio:GetLocalizationFlag()

		if var_309_0[var_309_1] ~= nil then
			arg_309_1.duration_ = var_309_0[var_309_1]
		end

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play117131077(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = 0
			local var_312_1 = 0.325

			if var_312_0 < arg_309_1.time_ and arg_309_1.time_ <= var_312_0 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_2 = arg_309_1:FormatText(StoryNameCfg[61].name)

				arg_309_1.leftNameTxt_.text = var_312_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_3 = arg_309_1:GetWordFromCfg(117131076)
				local var_312_4 = arg_309_1:FormatText(var_312_3.content)

				arg_309_1.text_.text = var_312_4

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_5 = 13
				local var_312_6 = utf8.len(var_312_4)
				local var_312_7 = var_312_5 <= 0 and var_312_1 or var_312_1 * (var_312_6 / var_312_5)

				if var_312_7 > 0 and var_312_1 < var_312_7 then
					arg_309_1.talkMaxDuration = var_312_7

					if var_312_7 + var_312_0 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_7 + var_312_0
					end
				end

				arg_309_1.text_.text = var_312_4
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131076", "story_v_out_117131.awb") ~= 0 then
					local var_312_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131076", "story_v_out_117131.awb") / 1000

					if var_312_8 + var_312_0 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_8 + var_312_0
					end

					if var_312_3.prefab_name ~= "" and arg_309_1.actors_[var_312_3.prefab_name] ~= nil then
						local var_312_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_3.prefab_name].transform, "story_v_out_117131", "117131076", "story_v_out_117131.awb")

						arg_309_1:RecordAudio("117131076", var_312_9)
						arg_309_1:RecordAudio("117131076", var_312_9)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_117131", "117131076", "story_v_out_117131.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_117131", "117131076", "story_v_out_117131.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_10 = math.max(var_312_1, arg_309_1.talkMaxDuration)

			if var_312_0 <= arg_309_1.time_ and arg_309_1.time_ < var_312_0 + var_312_10 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_0) / var_312_10

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_0 + var_312_10 and arg_309_1.time_ < var_312_0 + var_312_10 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play117131077 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 117131077
		arg_313_1.duration_ = 4.6

		local var_313_0 = {
			zh = 3.766,
			ja = 4.6
		}
		local var_313_1 = manager.audio:GetLocalizationFlag()

		if var_313_0[var_313_1] ~= nil then
			arg_313_1.duration_ = var_313_0[var_313_1]
		end

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
			arg_313_1.auto_ = false
		end

		function arg_313_1.playNext_(arg_315_0)
			arg_313_1.onStoryFinished_()
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = 0
			local var_316_1 = 0.4

			if var_316_0 < arg_313_1.time_ and arg_313_1.time_ <= var_316_0 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_2 = arg_313_1:FormatText(StoryNameCfg[319].name)

				arg_313_1.leftNameTxt_.text = var_316_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, true)
				arg_313_1.iconController_:SetSelectedState("hero")

				arg_313_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_3 = arg_313_1:GetWordFromCfg(117131077)
				local var_316_4 = arg_313_1:FormatText(var_316_3.content)

				arg_313_1.text_.text = var_316_4

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_5 = 16
				local var_316_6 = utf8.len(var_316_4)
				local var_316_7 = var_316_5 <= 0 and var_316_1 or var_316_1 * (var_316_6 / var_316_5)

				if var_316_7 > 0 and var_316_1 < var_316_7 then
					arg_313_1.talkMaxDuration = var_316_7

					if var_316_7 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_7 + var_316_0
					end
				end

				arg_313_1.text_.text = var_316_4
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117131", "117131077", "story_v_out_117131.awb") ~= 0 then
					local var_316_8 = manager.audio:GetVoiceLength("story_v_out_117131", "117131077", "story_v_out_117131.awb") / 1000

					if var_316_8 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_8 + var_316_0
					end

					if var_316_3.prefab_name ~= "" and arg_313_1.actors_[var_316_3.prefab_name] ~= nil then
						local var_316_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_3.prefab_name].transform, "story_v_out_117131", "117131077", "story_v_out_117131.awb")

						arg_313_1:RecordAudio("117131077", var_316_9)
						arg_313_1:RecordAudio("117131077", var_316_9)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_117131", "117131077", "story_v_out_117131.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_117131", "117131077", "story_v_out_117131.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_10 = math.max(var_316_1, arg_313_1.talkMaxDuration)

			if var_316_0 <= arg_313_1.time_ and arg_313_1.time_ < var_316_0 + var_316_10 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_0) / var_316_10

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_0 + var_316_10 and arg_313_1.time_ < var_316_0 + var_316_10 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST12",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST04a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/TI0101",
		"Assets/UIResources/UI_AB/TextureConfig/Background/TI0107"
	},
	voices = {
		"story_v_out_117131.awb"
	}
}
