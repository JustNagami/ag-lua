return {
	Play900000001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 900000001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play900000002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "F01a"

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
				local var_4_5 = arg_1_1.bgs_.F01a

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
					if iter_4_0 ~= "F01a" then
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

			local var_4_22 = 2.77555756156289e-17
			local var_4_23 = 1

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 2
			local var_4_27 = 0.675

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_1_3_story_indoor", "bgm_activity_1_3_story_indoor", "bgm_activity_1_3_story_indoor.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.675

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

				local var_4_33 = arg_1_1:GetWordFromCfg(900000001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 27
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
	Play900000002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 900000002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play900000003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1033"

			if arg_7_1.actors_[var_10_0] == nil then
				local var_10_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_10_0), arg_7_1.canvasGo_.transform)

				var_10_1.transform:SetSiblingIndex(1)

				var_10_1.name = var_10_0
				var_10_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_7_1.actors_[var_10_0] = var_10_1
			end

			local var_10_2 = arg_7_1.actors_["1033"].transform
			local var_10_3 = 0

			if var_10_3 < arg_7_1.time_ and arg_7_1.time_ <= var_10_3 + arg_10_0 then
				arg_7_1.var_.moveOldPos1033 = var_10_2.localPosition
				var_10_2.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("1033", 2)

				local var_10_4 = var_10_2.childCount

				for iter_10_0 = 0, var_10_4 - 1 do
					local var_10_5 = var_10_2:GetChild(iter_10_0)

					if var_10_5.name == "split_1" or not string.find(var_10_5.name, "split") then
						var_10_5.gameObject:SetActive(true)
					else
						var_10_5.gameObject:SetActive(false)
					end
				end
			end

			local var_10_6 = 0.001

			if var_10_3 <= arg_7_1.time_ and arg_7_1.time_ < var_10_3 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_3) / var_10_6
				local var_10_8 = Vector3.New(-390, -420, 0)

				var_10_2.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1033, var_10_8, var_10_7)
			end

			if arg_7_1.time_ >= var_10_3 + var_10_6 and arg_7_1.time_ < var_10_3 + var_10_6 + arg_10_0 then
				var_10_2.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_10_9 = arg_7_1.actors_["1033"]
			local var_10_10 = 0

			if var_10_10 < arg_7_1.time_ and arg_7_1.time_ <= var_10_10 + arg_10_0 then
				local var_10_11 = var_10_9:GetComponentInChildren(typeof(CanvasGroup))

				if var_10_11 then
					arg_7_1.var_.alphaOldValue1033 = var_10_11.alpha
					arg_7_1.var_.characterEffect1033 = var_10_11
				end

				arg_7_1.var_.alphaOldValue1033 = 0
			end

			local var_10_12 = 0.5

			if var_10_10 <= arg_7_1.time_ and arg_7_1.time_ < var_10_10 + var_10_12 then
				local var_10_13 = (arg_7_1.time_ - var_10_10) / var_10_12
				local var_10_14 = Mathf.Lerp(arg_7_1.var_.alphaOldValue1033, 1, var_10_13)

				if arg_7_1.var_.characterEffect1033 then
					arg_7_1.var_.characterEffect1033.alpha = var_10_14
				end
			end

			if arg_7_1.time_ >= var_10_10 + var_10_12 and arg_7_1.time_ < var_10_10 + var_10_12 + arg_10_0 and arg_7_1.var_.characterEffect1033 then
				arg_7_1.var_.characterEffect1033.alpha = 1
			end

			local var_10_15 = 0
			local var_10_16 = 0.625

			if var_10_15 < arg_7_1.time_ and arg_7_1.time_ <= var_10_15 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_17 = arg_7_1:FormatText(StoryNameCfg[236].name)

				arg_7_1.leftNameTxt_.text = var_10_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_18 = arg_7_1:GetWordFromCfg(900000002)
				local var_10_19 = arg_7_1:FormatText(var_10_18.content)

				arg_7_1.text_.text = var_10_19

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_20 = 25
				local var_10_21 = utf8.len(var_10_19)
				local var_10_22 = var_10_20 <= 0 and var_10_16 or var_10_16 * (var_10_21 / var_10_20)

				if var_10_22 > 0 and var_10_16 < var_10_22 then
					arg_7_1.talkMaxDuration = var_10_22

					if var_10_22 + var_10_15 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_22 + var_10_15
					end
				end

				arg_7_1.text_.text = var_10_19
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_23 = math.max(var_10_16, arg_7_1.talkMaxDuration)

			if var_10_15 <= arg_7_1.time_ and arg_7_1.time_ < var_10_15 + var_10_23 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_15) / var_10_23

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_15 + var_10_23 and arg_7_1.time_ < var_10_15 + var_10_23 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play900000003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 900000003
		arg_11_1.duration_ = 5.5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play900000004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1038"

			if arg_11_1.actors_[var_14_0] == nil then
				local var_14_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_14_0), arg_11_1.canvasGo_.transform)

				var_14_1.transform:SetSiblingIndex(1)

				var_14_1.name = var_14_0
				var_14_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_11_1.actors_[var_14_0] = var_14_1
			end

			local var_14_2 = arg_11_1.actors_["1038"].transform
			local var_14_3 = 0

			if var_14_3 < arg_11_1.time_ and arg_11_1.time_ <= var_14_3 + arg_14_0 then
				arg_11_1.var_.moveOldPos1038 = var_14_2.localPosition
				var_14_2.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("1038", 4)

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
				local var_14_8 = Vector3.New(390, -400, 0)

				var_14_2.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1038, var_14_8, var_14_7)
			end

			if arg_11_1.time_ >= var_14_3 + var_14_6 and arg_11_1.time_ < var_14_3 + var_14_6 + arg_14_0 then
				var_14_2.localPosition = Vector3.New(390, -400, 0)
			end

			local var_14_9 = arg_11_1.actors_["1038"]
			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 then
				local var_14_11 = var_14_9:GetComponentInChildren(typeof(CanvasGroup))

				if var_14_11 then
					arg_11_1.var_.alphaOldValue1038 = var_14_11.alpha
					arg_11_1.var_.characterEffect1038 = var_14_11
				end

				arg_11_1.var_.alphaOldValue1038 = 0
			end

			local var_14_12 = 0.5

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_12 then
				local var_14_13 = (arg_11_1.time_ - var_14_10) / var_14_12
				local var_14_14 = Mathf.Lerp(arg_11_1.var_.alphaOldValue1038, 1, var_14_13)

				if arg_11_1.var_.characterEffect1038 then
					arg_11_1.var_.characterEffect1038.alpha = var_14_14
				end
			end

			if arg_11_1.time_ >= var_14_10 + var_14_12 and arg_11_1.time_ < var_14_10 + var_14_12 + arg_14_0 and arg_11_1.var_.characterEffect1038 then
				arg_11_1.var_.characterEffect1038.alpha = 1
			end

			local var_14_15 = arg_11_1.actors_["1038"]
			local var_14_16 = 0

			if var_14_16 < arg_11_1.time_ and arg_11_1.time_ <= var_14_16 + arg_14_0 and arg_11_1.var_.actorSpriteComps1038 == nil then
				arg_11_1.var_.actorSpriteComps1038 = var_14_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_17 = 0.2

			if var_14_16 <= arg_11_1.time_ and arg_11_1.time_ < var_14_16 + var_14_17 then
				local var_14_18 = (arg_11_1.time_ - var_14_16) / var_14_17

				if arg_11_1.var_.actorSpriteComps1038 then
					for iter_14_1, iter_14_2 in pairs(arg_11_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_14_2 then
							local var_14_19 = Mathf.Lerp(iter_14_2.color.r, 1, var_14_18)

							iter_14_2.color = Color.New(var_14_19, var_14_19, var_14_19)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_16 + var_14_17 and arg_11_1.time_ < var_14_16 + var_14_17 + arg_14_0 and arg_11_1.var_.actorSpriteComps1038 then
				local var_14_20 = 1

				for iter_14_3, iter_14_4 in pairs(arg_11_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_14_4 then
						iter_14_4.color = Color.New(var_14_20, var_14_20, var_14_20)
					end
				end

				arg_11_1.var_.actorSpriteComps1038 = nil
			end

			local var_14_21 = arg_11_1.actors_["1033"]
			local var_14_22 = 0

			if var_14_22 < arg_11_1.time_ and arg_11_1.time_ <= var_14_22 + arg_14_0 and arg_11_1.var_.actorSpriteComps1033 == nil then
				arg_11_1.var_.actorSpriteComps1033 = var_14_21:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_23 = 0.2

			if var_14_22 <= arg_11_1.time_ and arg_11_1.time_ < var_14_22 + var_14_23 then
				local var_14_24 = (arg_11_1.time_ - var_14_22) / var_14_23

				if arg_11_1.var_.actorSpriteComps1033 then
					for iter_14_5, iter_14_6 in pairs(arg_11_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_14_6 then
							local var_14_25 = Mathf.Lerp(iter_14_6.color.r, 0.5, var_14_24)

							iter_14_6.color = Color.New(var_14_25, var_14_25, var_14_25)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_22 + var_14_23 and arg_11_1.time_ < var_14_22 + var_14_23 + arg_14_0 and arg_11_1.var_.actorSpriteComps1033 then
				local var_14_26 = 0.5

				for iter_14_7, iter_14_8 in pairs(arg_11_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_14_8 then
						iter_14_8.color = Color.New(var_14_26, var_14_26, var_14_26)
					end
				end

				arg_11_1.var_.actorSpriteComps1033 = nil
			end

			local var_14_27 = 0.5
			local var_14_28 = 0.55

			if var_14_27 < arg_11_1.time_ and arg_11_1.time_ <= var_14_27 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_29 = arg_11_1:FormatText(StoryNameCfg[94].name)

				arg_11_1.leftNameTxt_.text = var_14_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_30 = arg_11_1:GetWordFromCfg(900000003)
				local var_14_31 = arg_11_1:FormatText(var_14_30.content)

				arg_11_1.text_.text = var_14_31

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_32 = 22
				local var_14_33 = utf8.len(var_14_31)
				local var_14_34 = var_14_32 <= 0 and var_14_28 or var_14_28 * (var_14_33 / var_14_32)

				if var_14_34 > 0 and var_14_28 < var_14_34 then
					arg_11_1.talkMaxDuration = var_14_34

					if var_14_34 + var_14_27 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_34 + var_14_27
					end
				end

				arg_11_1.text_.text = var_14_31
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_35 = math.max(var_14_28, arg_11_1.talkMaxDuration)

			if var_14_27 <= arg_11_1.time_ and arg_11_1.time_ < var_14_27 + var_14_35 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_27) / var_14_35

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_27 + var_14_35 and arg_11_1.time_ < var_14_27 + var_14_35 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play900000004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 900000004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play900000005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1033"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.actorSpriteComps1033 == nil then
				arg_15_1.var_.actorSpriteComps1033 = var_18_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_2 = 0.2

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.actorSpriteComps1033 then
					for iter_18_0, iter_18_1 in pairs(arg_15_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_18_1 then
							local var_18_4 = Mathf.Lerp(iter_18_1.color.r, 1, var_18_3)

							iter_18_1.color = Color.New(var_18_4, var_18_4, var_18_4)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.actorSpriteComps1033 then
				local var_18_5 = 1

				for iter_18_2, iter_18_3 in pairs(arg_15_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_18_3 then
						iter_18_3.color = Color.New(var_18_5, var_18_5, var_18_5)
					end
				end

				arg_15_1.var_.actorSpriteComps1033 = nil
			end

			local var_18_6 = arg_15_1.actors_["1038"]
			local var_18_7 = 0

			if var_18_7 < arg_15_1.time_ and arg_15_1.time_ <= var_18_7 + arg_18_0 and arg_15_1.var_.actorSpriteComps1038 == nil then
				arg_15_1.var_.actorSpriteComps1038 = var_18_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_8 = 0.2

			if var_18_7 <= arg_15_1.time_ and arg_15_1.time_ < var_18_7 + var_18_8 then
				local var_18_9 = (arg_15_1.time_ - var_18_7) / var_18_8

				if arg_15_1.var_.actorSpriteComps1038 then
					for iter_18_4, iter_18_5 in pairs(arg_15_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_18_5 then
							local var_18_10 = Mathf.Lerp(iter_18_5.color.r, 0.5, var_18_9)

							iter_18_5.color = Color.New(var_18_10, var_18_10, var_18_10)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_7 + var_18_8 and arg_15_1.time_ < var_18_7 + var_18_8 + arg_18_0 and arg_15_1.var_.actorSpriteComps1038 then
				local var_18_11 = 0.5

				for iter_18_6, iter_18_7 in pairs(arg_15_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_18_7 then
						iter_18_7.color = Color.New(var_18_11, var_18_11, var_18_11)
					end
				end

				arg_15_1.var_.actorSpriteComps1038 = nil
			end

			local var_18_12 = 0
			local var_18_13 = 0.9

			if var_18_12 < arg_15_1.time_ and arg_15_1.time_ <= var_18_12 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_14 = arg_15_1:FormatText(StoryNameCfg[236].name)

				arg_15_1.leftNameTxt_.text = var_18_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_15 = arg_15_1:GetWordFromCfg(900000004)
				local var_18_16 = arg_15_1:FormatText(var_18_15.content)

				arg_15_1.text_.text = var_18_16

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_17 = 36
				local var_18_18 = utf8.len(var_18_16)
				local var_18_19 = var_18_17 <= 0 and var_18_13 or var_18_13 * (var_18_18 / var_18_17)

				if var_18_19 > 0 and var_18_13 < var_18_19 then
					arg_15_1.talkMaxDuration = var_18_19

					if var_18_19 + var_18_12 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_19 + var_18_12
					end
				end

				arg_15_1.text_.text = var_18_16
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_20 = math.max(var_18_13, arg_15_1.talkMaxDuration)

			if var_18_12 <= arg_15_1.time_ and arg_15_1.time_ < var_18_12 + var_18_20 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_12) / var_18_20

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_12 + var_18_20 and arg_15_1.time_ < var_18_12 + var_18_20 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play900000005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 900000005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play900000006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.925

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[236].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(900000005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 37
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
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_8 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_8 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_0) / var_22_8

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_8 and arg_19_1.time_ < var_22_0 + var_22_8 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play900000006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 900000006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play900000007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1033"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1033 = var_26_0.localPosition
				var_26_0.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("1033", 2)

				local var_26_2 = var_26_0.childCount

				for iter_26_0 = 0, var_26_2 - 1 do
					local var_26_3 = var_26_0:GetChild(iter_26_0)

					if var_26_3.name == "split_6" or not string.find(var_26_3.name, "split") then
						var_26_3.gameObject:SetActive(true)
					else
						var_26_3.gameObject:SetActive(false)
					end
				end
			end

			local var_26_4 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_4 then
				local var_26_5 = (arg_23_1.time_ - var_26_1) / var_26_4
				local var_26_6 = Vector3.New(-390, -420, 0)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1033, var_26_6, var_26_5)
			end

			if arg_23_1.time_ >= var_26_1 + var_26_4 and arg_23_1.time_ < var_26_1 + var_26_4 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_26_7 = arg_23_1.actors_["1033"].transform
			local var_26_8 = 0

			if var_26_8 < arg_23_1.time_ and arg_23_1.time_ <= var_26_8 + arg_26_0 then
				arg_23_1.var_.moveOldPos1033 = var_26_7.localPosition
				var_26_7.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("1033", 7)

				local var_26_9 = var_26_7.childCount

				for iter_26_1 = 0, var_26_9 - 1 do
					local var_26_10 = var_26_7:GetChild(iter_26_1)

					if var_26_10.name == "split_1" or not string.find(var_26_10.name, "split") then
						var_26_10.gameObject:SetActive(true)
					else
						var_26_10.gameObject:SetActive(false)
					end
				end
			end

			local var_26_11 = 0.001

			if var_26_8 <= arg_23_1.time_ and arg_23_1.time_ < var_26_8 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_8) / var_26_11
				local var_26_13 = Vector3.New(0, -2000, 0)

				var_26_7.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1033, var_26_13, var_26_12)
			end

			if arg_23_1.time_ >= var_26_8 + var_26_11 and arg_23_1.time_ < var_26_8 + var_26_11 + arg_26_0 then
				var_26_7.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_26_14 = 0
			local var_26_15 = 0.425

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_16 = arg_23_1:FormatText(StoryNameCfg[236].name)

				arg_23_1.leftNameTxt_.text = var_26_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_17 = arg_23_1:GetWordFromCfg(900000006)
				local var_26_18 = arg_23_1:FormatText(var_26_17.content)

				arg_23_1.text_.text = var_26_18

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_19 = 17
				local var_26_20 = utf8.len(var_26_18)
				local var_26_21 = var_26_19 <= 0 and var_26_15 or var_26_15 * (var_26_20 / var_26_19)

				if var_26_21 > 0 and var_26_15 < var_26_21 then
					arg_23_1.talkMaxDuration = var_26_21

					if var_26_21 + var_26_14 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_21 + var_26_14
					end
				end

				arg_23_1.text_.text = var_26_18
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_22 = math.max(var_26_15, arg_23_1.talkMaxDuration)

			if var_26_14 <= arg_23_1.time_ and arg_23_1.time_ < var_26_14 + var_26_22 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_14) / var_26_22

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_14 + var_26_22 and arg_23_1.time_ < var_26_14 + var_26_22 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play900000007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 900000007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play900000008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1038"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1038 = var_30_0.localPosition
				var_30_0.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("1038", 4)

				local var_30_2 = var_30_0.childCount

				for iter_30_0 = 0, var_30_2 - 1 do
					local var_30_3 = var_30_0:GetChild(iter_30_0)

					if var_30_3.name == "split_2" or not string.find(var_30_3.name, "split") then
						var_30_3.gameObject:SetActive(true)
					else
						var_30_3.gameObject:SetActive(false)
					end
				end
			end

			local var_30_4 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_4 then
				local var_30_5 = (arg_27_1.time_ - var_30_1) / var_30_4
				local var_30_6 = Vector3.New(390, -400, 0)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1038, var_30_6, var_30_5)
			end

			if arg_27_1.time_ >= var_30_1 + var_30_4 and arg_27_1.time_ < var_30_1 + var_30_4 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_30_7 = arg_27_1.actors_["1033"]
			local var_30_8 = 0

			if var_30_8 < arg_27_1.time_ and arg_27_1.time_ <= var_30_8 + arg_30_0 and arg_27_1.var_.actorSpriteComps1033 == nil then
				arg_27_1.var_.actorSpriteComps1033 = var_30_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_9 = 0.2

			if var_30_8 <= arg_27_1.time_ and arg_27_1.time_ < var_30_8 + var_30_9 then
				local var_30_10 = (arg_27_1.time_ - var_30_8) / var_30_9

				if arg_27_1.var_.actorSpriteComps1033 then
					for iter_30_1, iter_30_2 in pairs(arg_27_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_30_2 then
							local var_30_11 = Mathf.Lerp(iter_30_2.color.r, 0.5, var_30_10)

							iter_30_2.color = Color.New(var_30_11, var_30_11, var_30_11)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_8 + var_30_9 and arg_27_1.time_ < var_30_8 + var_30_9 + arg_30_0 and arg_27_1.var_.actorSpriteComps1033 then
				local var_30_12 = 0.5

				for iter_30_3, iter_30_4 in pairs(arg_27_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_30_4 then
						iter_30_4.color = Color.New(var_30_12, var_30_12, var_30_12)
					end
				end

				arg_27_1.var_.actorSpriteComps1033 = nil
			end

			local var_30_13 = arg_27_1.actors_["1038"]
			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 and arg_27_1.var_.actorSpriteComps1038 == nil then
				arg_27_1.var_.actorSpriteComps1038 = var_30_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_15 = 0.2

			if var_30_14 <= arg_27_1.time_ and arg_27_1.time_ < var_30_14 + var_30_15 then
				local var_30_16 = (arg_27_1.time_ - var_30_14) / var_30_15

				if arg_27_1.var_.actorSpriteComps1038 then
					for iter_30_5, iter_30_6 in pairs(arg_27_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_30_6 then
							local var_30_17 = Mathf.Lerp(iter_30_6.color.r, 1, var_30_16)

							iter_30_6.color = Color.New(var_30_17, var_30_17, var_30_17)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_14 + var_30_15 and arg_27_1.time_ < var_30_14 + var_30_15 + arg_30_0 and arg_27_1.var_.actorSpriteComps1038 then
				local var_30_18 = 1

				for iter_30_7, iter_30_8 in pairs(arg_27_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_30_8 then
						iter_30_8.color = Color.New(var_30_18, var_30_18, var_30_18)
					end
				end

				arg_27_1.var_.actorSpriteComps1038 = nil
			end

			local var_30_19 = arg_27_1.actors_["1038"].transform
			local var_30_20 = 0

			if var_30_20 < arg_27_1.time_ and arg_27_1.time_ <= var_30_20 + arg_30_0 then
				arg_27_1.var_.moveOldPos1038 = var_30_19.localPosition
				var_30_19.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("1038", 7)

				local var_30_21 = var_30_19.childCount

				for iter_30_9 = 0, var_30_21 - 1 do
					local var_30_22 = var_30_19:GetChild(iter_30_9)

					if var_30_22.name == "split_1" or not string.find(var_30_22.name, "split") then
						var_30_22.gameObject:SetActive(true)
					else
						var_30_22.gameObject:SetActive(false)
					end
				end
			end

			local var_30_23 = 0.001

			if var_30_20 <= arg_27_1.time_ and arg_27_1.time_ < var_30_20 + var_30_23 then
				local var_30_24 = (arg_27_1.time_ - var_30_20) / var_30_23
				local var_30_25 = Vector3.New(0, -2000, 0)

				var_30_19.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1038, var_30_25, var_30_24)
			end

			if arg_27_1.time_ >= var_30_20 + var_30_23 and arg_27_1.time_ < var_30_20 + var_30_23 + arg_30_0 then
				var_30_19.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_30_26 = 0
			local var_30_27 = 0.75

			if var_30_26 < arg_27_1.time_ and arg_27_1.time_ <= var_30_26 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_28 = arg_27_1:FormatText(StoryNameCfg[94].name)

				arg_27_1.leftNameTxt_.text = var_30_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_29 = arg_27_1:GetWordFromCfg(900000007)
				local var_30_30 = arg_27_1:FormatText(var_30_29.content)

				arg_27_1.text_.text = var_30_30

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_31 = 30
				local var_30_32 = utf8.len(var_30_30)
				local var_30_33 = var_30_31 <= 0 and var_30_27 or var_30_27 * (var_30_32 / var_30_31)

				if var_30_33 > 0 and var_30_27 < var_30_33 then
					arg_27_1.talkMaxDuration = var_30_33

					if var_30_33 + var_30_26 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_33 + var_30_26
					end
				end

				arg_27_1.text_.text = var_30_30
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_34 = math.max(var_30_27, arg_27_1.talkMaxDuration)

			if var_30_26 <= arg_27_1.time_ and arg_27_1.time_ < var_30_26 + var_30_34 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_26) / var_30_34

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_26 + var_30_34 and arg_27_1.time_ < var_30_26 + var_30_34 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play900000008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 900000008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play900000009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = "1019"

			if arg_31_1.actors_[var_34_0] == nil then
				local var_34_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_34_0), arg_31_1.canvasGo_.transform)

				var_34_1.transform:SetSiblingIndex(1)

				var_34_1.name = var_34_0
				var_34_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_31_1.actors_[var_34_0] = var_34_1
			end

			local var_34_2 = arg_31_1.actors_["1019"].transform
			local var_34_3 = 0

			if var_34_3 < arg_31_1.time_ and arg_31_1.time_ <= var_34_3 + arg_34_0 then
				arg_31_1.var_.moveOldPos1019 = var_34_2.localPosition
				var_34_2.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("1019", 3)

				local var_34_4 = var_34_2.childCount

				for iter_34_0 = 0, var_34_4 - 1 do
					local var_34_5 = var_34_2:GetChild(iter_34_0)

					if var_34_5.name == "split_1" or not string.find(var_34_5.name, "split") then
						var_34_5.gameObject:SetActive(true)
					else
						var_34_5.gameObject:SetActive(false)
					end
				end
			end

			local var_34_6 = 0.001

			if var_34_3 <= arg_31_1.time_ and arg_31_1.time_ < var_34_3 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_3) / var_34_6
				local var_34_8 = Vector3.New(-210, -340, 200)

				var_34_2.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1019, var_34_8, var_34_7)
			end

			if arg_31_1.time_ >= var_34_3 + var_34_6 and arg_31_1.time_ < var_34_3 + var_34_6 + arg_34_0 then
				var_34_2.localPosition = Vector3.New(-210, -340, 200)
			end

			local var_34_9 = arg_31_1.actors_["1019"]
			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 and arg_31_1.var_.actorSpriteComps1019 == nil then
				arg_31_1.var_.actorSpriteComps1019 = var_34_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_11 = 0.2

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_11 then
				local var_34_12 = (arg_31_1.time_ - var_34_10) / var_34_11

				if arg_31_1.var_.actorSpriteComps1019 then
					for iter_34_1, iter_34_2 in pairs(arg_31_1.var_.actorSpriteComps1019:ToTable()) do
						if iter_34_2 then
							local var_34_13 = Mathf.Lerp(iter_34_2.color.r, 1, var_34_12)

							iter_34_2.color = Color.New(var_34_13, var_34_13, var_34_13)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_10 + var_34_11 and arg_31_1.time_ < var_34_10 + var_34_11 + arg_34_0 and arg_31_1.var_.actorSpriteComps1019 then
				local var_34_14 = 1

				for iter_34_3, iter_34_4 in pairs(arg_31_1.var_.actorSpriteComps1019:ToTable()) do
					if iter_34_4 then
						iter_34_4.color = Color.New(var_34_14, var_34_14, var_34_14)
					end
				end

				arg_31_1.var_.actorSpriteComps1019 = nil
			end

			local var_34_15 = arg_31_1.actors_["1019"]
			local var_34_16 = 0

			if var_34_16 < arg_31_1.time_ and arg_31_1.time_ <= var_34_16 + arg_34_0 then
				local var_34_17 = var_34_15:GetComponentInChildren(typeof(CanvasGroup))

				if var_34_17 then
					arg_31_1.var_.alphaOldValue1019 = var_34_17.alpha
					arg_31_1.var_.characterEffect1019 = var_34_17
				end

				arg_31_1.var_.alphaOldValue1019 = 0
			end

			local var_34_18 = 0.2

			if var_34_16 <= arg_31_1.time_ and arg_31_1.time_ < var_34_16 + var_34_18 then
				local var_34_19 = (arg_31_1.time_ - var_34_16) / var_34_18
				local var_34_20 = Mathf.Lerp(arg_31_1.var_.alphaOldValue1019, 1, var_34_19)

				if arg_31_1.var_.characterEffect1019 then
					arg_31_1.var_.characterEffect1019.alpha = var_34_20
				end
			end

			if arg_31_1.time_ >= var_34_16 + var_34_18 and arg_31_1.time_ < var_34_16 + var_34_18 + arg_34_0 and arg_31_1.var_.characterEffect1019 then
				arg_31_1.var_.characterEffect1019.alpha = 1
			end

			local var_34_21 = arg_31_1.actors_["1033"].transform
			local var_34_22 = 0

			if var_34_22 < arg_31_1.time_ and arg_31_1.time_ <= var_34_22 + arg_34_0 then
				arg_31_1.var_.moveOldPos1033 = var_34_21.localPosition
				var_34_21.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("1033", 7)

				local var_34_23 = var_34_21.childCount

				for iter_34_5 = 0, var_34_23 - 1 do
					local var_34_24 = var_34_21:GetChild(iter_34_5)

					if var_34_24.name == "split_6" or not string.find(var_34_24.name, "split") then
						var_34_24.gameObject:SetActive(true)
					else
						var_34_24.gameObject:SetActive(false)
					end
				end
			end

			local var_34_25 = 0.001

			if var_34_22 <= arg_31_1.time_ and arg_31_1.time_ < var_34_22 + var_34_25 then
				local var_34_26 = (arg_31_1.time_ - var_34_22) / var_34_25
				local var_34_27 = Vector3.New(0, -2000, 0)

				var_34_21.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1033, var_34_27, var_34_26)
			end

			if arg_31_1.time_ >= var_34_22 + var_34_25 and arg_31_1.time_ < var_34_22 + var_34_25 + arg_34_0 then
				var_34_21.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_34_28 = arg_31_1.actors_["1038"].transform
			local var_34_29 = 0

			if var_34_29 < arg_31_1.time_ and arg_31_1.time_ <= var_34_29 + arg_34_0 then
				arg_31_1.var_.moveOldPos1038 = var_34_28.localPosition
				var_34_28.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("1038", 7)

				local var_34_30 = var_34_28.childCount

				for iter_34_6 = 0, var_34_30 - 1 do
					local var_34_31 = var_34_28:GetChild(iter_34_6)

					if var_34_31.name == "split_2" or not string.find(var_34_31.name, "split") then
						var_34_31.gameObject:SetActive(true)
					else
						var_34_31.gameObject:SetActive(false)
					end
				end
			end

			local var_34_32 = 0.001

			if var_34_29 <= arg_31_1.time_ and arg_31_1.time_ < var_34_29 + var_34_32 then
				local var_34_33 = (arg_31_1.time_ - var_34_29) / var_34_32
				local var_34_34 = Vector3.New(0, -2000, 0)

				var_34_28.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1038, var_34_34, var_34_33)
			end

			if arg_31_1.time_ >= var_34_29 + var_34_32 and arg_31_1.time_ < var_34_29 + var_34_32 + arg_34_0 then
				var_34_28.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_34_35 = 0
			local var_34_36 = 0.825

			if var_34_35 < arg_31_1.time_ and arg_31_1.time_ <= var_34_35 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_37 = arg_31_1:FormatText(StoryNameCfg[13].name)

				arg_31_1.leftNameTxt_.text = var_34_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_38 = arg_31_1:GetWordFromCfg(900000008)
				local var_34_39 = arg_31_1:FormatText(var_34_38.content)

				arg_31_1.text_.text = var_34_39

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_40 = 33
				local var_34_41 = utf8.len(var_34_39)
				local var_34_42 = var_34_40 <= 0 and var_34_36 or var_34_36 * (var_34_41 / var_34_40)

				if var_34_42 > 0 and var_34_36 < var_34_42 then
					arg_31_1.talkMaxDuration = var_34_42

					if var_34_42 + var_34_35 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_42 + var_34_35
					end
				end

				arg_31_1.text_.text = var_34_39
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_43 = math.max(var_34_36, arg_31_1.talkMaxDuration)

			if var_34_35 <= arg_31_1.time_ and arg_31_1.time_ < var_34_35 + var_34_43 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_35) / var_34_43

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_35 + var_34_43 and arg_31_1.time_ < var_34_35 + var_34_43 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play900000009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 900000009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play900000010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1033"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1033 = var_38_0.localPosition
				var_38_0.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("1033", 3)

				local var_38_2 = var_38_0.childCount

				for iter_38_0 = 0, var_38_2 - 1 do
					local var_38_3 = var_38_0:GetChild(iter_38_0)

					if var_38_3.name == "split_2" or not string.find(var_38_3.name, "split") then
						var_38_3.gameObject:SetActive(true)
					else
						var_38_3.gameObject:SetActive(false)
					end
				end
			end

			local var_38_4 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_4 then
				local var_38_5 = (arg_35_1.time_ - var_38_1) / var_38_4
				local var_38_6 = Vector3.New(0, -420, 0)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1033, var_38_6, var_38_5)
			end

			if arg_35_1.time_ >= var_38_1 + var_38_4 and arg_35_1.time_ < var_38_1 + var_38_4 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0, -420, 0)
			end

			local var_38_7 = arg_35_1.actors_["1033"]
			local var_38_8 = 0

			if var_38_8 < arg_35_1.time_ and arg_35_1.time_ <= var_38_8 + arg_38_0 and arg_35_1.var_.actorSpriteComps1033 == nil then
				arg_35_1.var_.actorSpriteComps1033 = var_38_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_9 = 0.1

			if var_38_8 <= arg_35_1.time_ and arg_35_1.time_ < var_38_8 + var_38_9 then
				local var_38_10 = (arg_35_1.time_ - var_38_8) / var_38_9

				if arg_35_1.var_.actorSpriteComps1033 then
					for iter_38_1, iter_38_2 in pairs(arg_35_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_38_2 then
							local var_38_11 = Mathf.Lerp(iter_38_2.color.r, 1, var_38_10)

							iter_38_2.color = Color.New(var_38_11, var_38_11, var_38_11)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_8 + var_38_9 and arg_35_1.time_ < var_38_8 + var_38_9 + arg_38_0 and arg_35_1.var_.actorSpriteComps1033 then
				local var_38_12 = 1

				for iter_38_3, iter_38_4 in pairs(arg_35_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_38_4 then
						iter_38_4.color = Color.New(var_38_12, var_38_12, var_38_12)
					end
				end

				arg_35_1.var_.actorSpriteComps1033 = nil
			end

			local var_38_13 = arg_35_1.actors_["1033"]
			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 then
				local var_38_15 = var_38_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_38_15 then
					arg_35_1.var_.alphaOldValue1033 = var_38_15.alpha
					arg_35_1.var_.characterEffect1033 = var_38_15
				end

				arg_35_1.var_.alphaOldValue1033 = 0
			end

			local var_38_16 = 0.1

			if var_38_14 <= arg_35_1.time_ and arg_35_1.time_ < var_38_14 + var_38_16 then
				local var_38_17 = (arg_35_1.time_ - var_38_14) / var_38_16
				local var_38_18 = Mathf.Lerp(arg_35_1.var_.alphaOldValue1033, 1, var_38_17)

				if arg_35_1.var_.characterEffect1033 then
					arg_35_1.var_.characterEffect1033.alpha = var_38_18
				end
			end

			if arg_35_1.time_ >= var_38_14 + var_38_16 and arg_35_1.time_ < var_38_14 + var_38_16 + arg_38_0 and arg_35_1.var_.characterEffect1033 then
				arg_35_1.var_.characterEffect1033.alpha = 1
			end

			local var_38_19 = arg_35_1.actors_["1019"].transform
			local var_38_20 = 0

			if var_38_20 < arg_35_1.time_ and arg_35_1.time_ <= var_38_20 + arg_38_0 then
				arg_35_1.var_.moveOldPos1019 = var_38_19.localPosition
				var_38_19.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("1019", 7)

				local var_38_21 = var_38_19.childCount

				for iter_38_5 = 0, var_38_21 - 1 do
					local var_38_22 = var_38_19:GetChild(iter_38_5)

					if var_38_22.name == "split_1" or not string.find(var_38_22.name, "split") then
						var_38_22.gameObject:SetActive(true)
					else
						var_38_22.gameObject:SetActive(false)
					end
				end
			end

			local var_38_23 = 0.001

			if var_38_20 <= arg_35_1.time_ and arg_35_1.time_ < var_38_20 + var_38_23 then
				local var_38_24 = (arg_35_1.time_ - var_38_20) / var_38_23
				local var_38_25 = Vector3.New(0, -2000, 200)

				var_38_19.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1019, var_38_25, var_38_24)
			end

			if arg_35_1.time_ >= var_38_20 + var_38_23 and arg_35_1.time_ < var_38_20 + var_38_23 + arg_38_0 then
				var_38_19.localPosition = Vector3.New(0, -2000, 200)
			end

			local var_38_26 = 0
			local var_38_27 = 0.6

			if var_38_26 < arg_35_1.time_ and arg_35_1.time_ <= var_38_26 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_28 = arg_35_1:FormatText(StoryNameCfg[236].name)

				arg_35_1.leftNameTxt_.text = var_38_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_29 = arg_35_1:GetWordFromCfg(900000009)
				local var_38_30 = arg_35_1:FormatText(var_38_29.content)

				arg_35_1.text_.text = var_38_30

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_31 = 24
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
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_34 = math.max(var_38_27, arg_35_1.talkMaxDuration)

			if var_38_26 <= arg_35_1.time_ and arg_35_1.time_ < var_38_26 + var_38_34 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_26) / var_38_34

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_26 + var_38_34 and arg_35_1.time_ < var_38_26 + var_38_34 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play900000010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 900000010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play900000011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1038"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1038 = var_42_0.localPosition
				var_42_0.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("1038", 2)

				local var_42_2 = var_42_0.childCount

				for iter_42_0 = 0, var_42_2 - 1 do
					local var_42_3 = var_42_0:GetChild(iter_42_0)

					if var_42_3.name == "split_2" or not string.find(var_42_3.name, "split") then
						var_42_3.gameObject:SetActive(true)
					else
						var_42_3.gameObject:SetActive(false)
					end
				end
			end

			local var_42_4 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_4 then
				local var_42_5 = (arg_39_1.time_ - var_42_1) / var_42_4
				local var_42_6 = Vector3.New(-390, -400, 0)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1038, var_42_6, var_42_5)
			end

			if arg_39_1.time_ >= var_42_1 + var_42_4 and arg_39_1.time_ < var_42_1 + var_42_4 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_42_7 = arg_39_1.actors_["1038"]
			local var_42_8 = 0

			if var_42_8 < arg_39_1.time_ and arg_39_1.time_ <= var_42_8 + arg_42_0 and arg_39_1.var_.actorSpriteComps1038 == nil then
				arg_39_1.var_.actorSpriteComps1038 = var_42_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_9 = 0.1

			if var_42_8 <= arg_39_1.time_ and arg_39_1.time_ < var_42_8 + var_42_9 then
				local var_42_10 = (arg_39_1.time_ - var_42_8) / var_42_9

				if arg_39_1.var_.actorSpriteComps1038 then
					for iter_42_1, iter_42_2 in pairs(arg_39_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_42_2 then
							local var_42_11 = Mathf.Lerp(iter_42_2.color.r, 1, var_42_10)

							iter_42_2.color = Color.New(var_42_11, var_42_11, var_42_11)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_8 + var_42_9 and arg_39_1.time_ < var_42_8 + var_42_9 + arg_42_0 and arg_39_1.var_.actorSpriteComps1038 then
				local var_42_12 = 1

				for iter_42_3, iter_42_4 in pairs(arg_39_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_42_4 then
						iter_42_4.color = Color.New(var_42_12, var_42_12, var_42_12)
					end
				end

				arg_39_1.var_.actorSpriteComps1038 = nil
			end

			local var_42_13 = arg_39_1.actors_["1038"]
			local var_42_14 = 0

			if var_42_14 < arg_39_1.time_ and arg_39_1.time_ <= var_42_14 + arg_42_0 then
				local var_42_15 = var_42_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_42_15 then
					arg_39_1.var_.alphaOldValue1038 = var_42_15.alpha
					arg_39_1.var_.characterEffect1038 = var_42_15
				end

				arg_39_1.var_.alphaOldValue1038 = 0
			end

			local var_42_16 = 0.1

			if var_42_14 <= arg_39_1.time_ and arg_39_1.time_ < var_42_14 + var_42_16 then
				local var_42_17 = (arg_39_1.time_ - var_42_14) / var_42_16
				local var_42_18 = Mathf.Lerp(arg_39_1.var_.alphaOldValue1038, 1, var_42_17)

				if arg_39_1.var_.characterEffect1038 then
					arg_39_1.var_.characterEffect1038.alpha = var_42_18
				end
			end

			if arg_39_1.time_ >= var_42_14 + var_42_16 and arg_39_1.time_ < var_42_14 + var_42_16 + arg_42_0 and arg_39_1.var_.characterEffect1038 then
				arg_39_1.var_.characterEffect1038.alpha = 1
			end

			local var_42_19 = arg_39_1.actors_["1033"].transform
			local var_42_20 = 0

			if var_42_20 < arg_39_1.time_ and arg_39_1.time_ <= var_42_20 + arg_42_0 then
				arg_39_1.var_.moveOldPos1033 = var_42_19.localPosition
				var_42_19.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("1033", 7)

				local var_42_21 = var_42_19.childCount

				for iter_42_5 = 0, var_42_21 - 1 do
					local var_42_22 = var_42_19:GetChild(iter_42_5)

					if var_42_22.name == "split_2" or not string.find(var_42_22.name, "split") then
						var_42_22.gameObject:SetActive(true)
					else
						var_42_22.gameObject:SetActive(false)
					end
				end
			end

			local var_42_23 = 0.001

			if var_42_20 <= arg_39_1.time_ and arg_39_1.time_ < var_42_20 + var_42_23 then
				local var_42_24 = (arg_39_1.time_ - var_42_20) / var_42_23
				local var_42_25 = Vector3.New(0, -2000, 0)

				var_42_19.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1033, var_42_25, var_42_24)
			end

			if arg_39_1.time_ >= var_42_20 + var_42_23 and arg_39_1.time_ < var_42_20 + var_42_23 + arg_42_0 then
				var_42_19.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_42_26 = 0
			local var_42_27 = 0.75

			if var_42_26 < arg_39_1.time_ and arg_39_1.time_ <= var_42_26 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_28 = arg_39_1:FormatText(StoryNameCfg[94].name)

				arg_39_1.leftNameTxt_.text = var_42_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_29 = arg_39_1:GetWordFromCfg(900000010)
				local var_42_30 = arg_39_1:FormatText(var_42_29.content)

				arg_39_1.text_.text = var_42_30

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_31 = 30
				local var_42_32 = utf8.len(var_42_30)
				local var_42_33 = var_42_31 <= 0 and var_42_27 or var_42_27 * (var_42_32 / var_42_31)

				if var_42_33 > 0 and var_42_27 < var_42_33 then
					arg_39_1.talkMaxDuration = var_42_33

					if var_42_33 + var_42_26 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_33 + var_42_26
					end
				end

				arg_39_1.text_.text = var_42_30
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_34 = math.max(var_42_27, arg_39_1.talkMaxDuration)

			if var_42_26 <= arg_39_1.time_ and arg_39_1.time_ < var_42_26 + var_42_34 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_26) / var_42_34

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_26 + var_42_34 and arg_39_1.time_ < var_42_26 + var_42_34 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play900000011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 900000011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play900000012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1019"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1019 = var_46_0.localPosition
				var_46_0.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("1019", 4)

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
				local var_46_6 = Vector3.New(180, -340, 200)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1019, var_46_6, var_46_5)
			end

			if arg_43_1.time_ >= var_46_1 + var_46_4 and arg_43_1.time_ < var_46_1 + var_46_4 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(180, -340, 200)
			end

			local var_46_7 = arg_43_1.actors_["1019"]
			local var_46_8 = 0

			if var_46_8 < arg_43_1.time_ and arg_43_1.time_ <= var_46_8 + arg_46_0 then
				local var_46_9 = var_46_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_46_9 then
					arg_43_1.var_.alphaOldValue1019 = var_46_9.alpha
					arg_43_1.var_.characterEffect1019 = var_46_9
				end

				arg_43_1.var_.alphaOldValue1019 = 0
			end

			local var_46_10 = 0.1

			if var_46_8 <= arg_43_1.time_ and arg_43_1.time_ < var_46_8 + var_46_10 then
				local var_46_11 = (arg_43_1.time_ - var_46_8) / var_46_10
				local var_46_12 = Mathf.Lerp(arg_43_1.var_.alphaOldValue1019, 1, var_46_11)

				if arg_43_1.var_.characterEffect1019 then
					arg_43_1.var_.characterEffect1019.alpha = var_46_12
				end
			end

			if arg_43_1.time_ >= var_46_8 + var_46_10 and arg_43_1.time_ < var_46_8 + var_46_10 + arg_46_0 and arg_43_1.var_.characterEffect1019 then
				arg_43_1.var_.characterEffect1019.alpha = 1
			end

			local var_46_13 = arg_43_1.actors_["1019"]
			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 and arg_43_1.var_.actorSpriteComps1019 == nil then
				arg_43_1.var_.actorSpriteComps1019 = var_46_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_15 = 0.1

			if var_46_14 <= arg_43_1.time_ and arg_43_1.time_ < var_46_14 + var_46_15 then
				local var_46_16 = (arg_43_1.time_ - var_46_14) / var_46_15

				if arg_43_1.var_.actorSpriteComps1019 then
					for iter_46_1, iter_46_2 in pairs(arg_43_1.var_.actorSpriteComps1019:ToTable()) do
						if iter_46_2 then
							local var_46_17 = Mathf.Lerp(iter_46_2.color.r, 1, var_46_16)

							iter_46_2.color = Color.New(var_46_17, var_46_17, var_46_17)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_14 + var_46_15 and arg_43_1.time_ < var_46_14 + var_46_15 + arg_46_0 and arg_43_1.var_.actorSpriteComps1019 then
				local var_46_18 = 1

				for iter_46_3, iter_46_4 in pairs(arg_43_1.var_.actorSpriteComps1019:ToTable()) do
					if iter_46_4 then
						iter_46_4.color = Color.New(var_46_18, var_46_18, var_46_18)
					end
				end

				arg_43_1.var_.actorSpriteComps1019 = nil
			end

			local var_46_19 = arg_43_1.actors_["1038"]
			local var_46_20 = 0

			if var_46_20 < arg_43_1.time_ and arg_43_1.time_ <= var_46_20 + arg_46_0 and arg_43_1.var_.actorSpriteComps1038 == nil then
				arg_43_1.var_.actorSpriteComps1038 = var_46_19:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_21 = 0.1

			if var_46_20 <= arg_43_1.time_ and arg_43_1.time_ < var_46_20 + var_46_21 then
				local var_46_22 = (arg_43_1.time_ - var_46_20) / var_46_21

				if arg_43_1.var_.actorSpriteComps1038 then
					for iter_46_5, iter_46_6 in pairs(arg_43_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_46_6 then
							local var_46_23 = Mathf.Lerp(iter_46_6.color.r, 0.5, var_46_22)

							iter_46_6.color = Color.New(var_46_23, var_46_23, var_46_23)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_20 + var_46_21 and arg_43_1.time_ < var_46_20 + var_46_21 + arg_46_0 and arg_43_1.var_.actorSpriteComps1038 then
				local var_46_24 = 0.5

				for iter_46_7, iter_46_8 in pairs(arg_43_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_46_8 then
						iter_46_8.color = Color.New(var_46_24, var_46_24, var_46_24)
					end
				end

				arg_43_1.var_.actorSpriteComps1038 = nil
			end

			local var_46_25 = 0
			local var_46_26 = 0.175

			if var_46_25 < arg_43_1.time_ and arg_43_1.time_ <= var_46_25 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_27 = arg_43_1:FormatText(StoryNameCfg[13].name)

				arg_43_1.leftNameTxt_.text = var_46_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_28 = arg_43_1:GetWordFromCfg(900000011)
				local var_46_29 = arg_43_1:FormatText(var_46_28.content)

				arg_43_1.text_.text = var_46_29

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_30 = 7
				local var_46_31 = utf8.len(var_46_29)
				local var_46_32 = var_46_30 <= 0 and var_46_26 or var_46_26 * (var_46_31 / var_46_30)

				if var_46_32 > 0 and var_46_26 < var_46_32 then
					arg_43_1.talkMaxDuration = var_46_32

					if var_46_32 + var_46_25 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_32 + var_46_25
					end
				end

				arg_43_1.text_.text = var_46_29
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_33 = math.max(var_46_26, arg_43_1.talkMaxDuration)

			if var_46_25 <= arg_43_1.time_ and arg_43_1.time_ < var_46_25 + var_46_33 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_25) / var_46_33

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_25 + var_46_33 and arg_43_1.time_ < var_46_25 + var_46_33 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play900000012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 900000012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play900000013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1038"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1038 = var_50_0.localPosition
				var_50_0.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("1038", 2)

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
				local var_50_6 = Vector3.New(-390, -400, 0)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1038, var_50_6, var_50_5)
			end

			if arg_47_1.time_ >= var_50_1 + var_50_4 and arg_47_1.time_ < var_50_1 + var_50_4 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_50_7 = arg_47_1.actors_["1019"]
			local var_50_8 = 0

			if var_50_8 < arg_47_1.time_ and arg_47_1.time_ <= var_50_8 + arg_50_0 and arg_47_1.var_.actorSpriteComps1019 == nil then
				arg_47_1.var_.actorSpriteComps1019 = var_50_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_9 = 0.1

			if var_50_8 <= arg_47_1.time_ and arg_47_1.time_ < var_50_8 + var_50_9 then
				local var_50_10 = (arg_47_1.time_ - var_50_8) / var_50_9

				if arg_47_1.var_.actorSpriteComps1019 then
					for iter_50_1, iter_50_2 in pairs(arg_47_1.var_.actorSpriteComps1019:ToTable()) do
						if iter_50_2 then
							local var_50_11 = Mathf.Lerp(iter_50_2.color.r, 0.5, var_50_10)

							iter_50_2.color = Color.New(var_50_11, var_50_11, var_50_11)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_8 + var_50_9 and arg_47_1.time_ < var_50_8 + var_50_9 + arg_50_0 and arg_47_1.var_.actorSpriteComps1019 then
				local var_50_12 = 0.5

				for iter_50_3, iter_50_4 in pairs(arg_47_1.var_.actorSpriteComps1019:ToTable()) do
					if iter_50_4 then
						iter_50_4.color = Color.New(var_50_12, var_50_12, var_50_12)
					end
				end

				arg_47_1.var_.actorSpriteComps1019 = nil
			end

			local var_50_13 = arg_47_1.actors_["1038"]
			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 and arg_47_1.var_.actorSpriteComps1038 == nil then
				arg_47_1.var_.actorSpriteComps1038 = var_50_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_15 = 0.1

			if var_50_14 <= arg_47_1.time_ and arg_47_1.time_ < var_50_14 + var_50_15 then
				local var_50_16 = (arg_47_1.time_ - var_50_14) / var_50_15

				if arg_47_1.var_.actorSpriteComps1038 then
					for iter_50_5, iter_50_6 in pairs(arg_47_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_50_6 then
							local var_50_17 = Mathf.Lerp(iter_50_6.color.r, 1, var_50_16)

							iter_50_6.color = Color.New(var_50_17, var_50_17, var_50_17)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_14 + var_50_15 and arg_47_1.time_ < var_50_14 + var_50_15 + arg_50_0 and arg_47_1.var_.actorSpriteComps1038 then
				local var_50_18 = 1

				for iter_50_7, iter_50_8 in pairs(arg_47_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_50_8 then
						iter_50_8.color = Color.New(var_50_18, var_50_18, var_50_18)
					end
				end

				arg_47_1.var_.actorSpriteComps1038 = nil
			end

			local var_50_19 = arg_47_1.actors_["1038"].transform
			local var_50_20 = 0

			if var_50_20 < arg_47_1.time_ and arg_47_1.time_ <= var_50_20 + arg_50_0 then
				arg_47_1.var_.moveOldPos1038 = var_50_19.localPosition
				var_50_19.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("1038", 7)

				local var_50_21 = var_50_19.childCount

				for iter_50_9 = 0, var_50_21 - 1 do
					local var_50_22 = var_50_19:GetChild(iter_50_9)

					if var_50_22.name == "split_2" or not string.find(var_50_22.name, "split") then
						var_50_22.gameObject:SetActive(true)
					else
						var_50_22.gameObject:SetActive(false)
					end
				end
			end

			local var_50_23 = 0.001

			if var_50_20 <= arg_47_1.time_ and arg_47_1.time_ < var_50_20 + var_50_23 then
				local var_50_24 = (arg_47_1.time_ - var_50_20) / var_50_23
				local var_50_25 = Vector3.New(0, -2000, 0)

				var_50_19.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1038, var_50_25, var_50_24)
			end

			if arg_47_1.time_ >= var_50_20 + var_50_23 and arg_47_1.time_ < var_50_20 + var_50_23 + arg_50_0 then
				var_50_19.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_50_26 = 0
			local var_50_27 = 0.225

			if var_50_26 < arg_47_1.time_ and arg_47_1.time_ <= var_50_26 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_28 = arg_47_1:FormatText(StoryNameCfg[94].name)

				arg_47_1.leftNameTxt_.text = var_50_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_29 = arg_47_1:GetWordFromCfg(900000012)
				local var_50_30 = arg_47_1:FormatText(var_50_29.content)

				arg_47_1.text_.text = var_50_30

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_31 = 9
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
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_34 = math.max(var_50_27, arg_47_1.talkMaxDuration)

			if var_50_26 <= arg_47_1.time_ and arg_47_1.time_ < var_50_26 + var_50_34 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_26) / var_50_34

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_26 + var_50_34 and arg_47_1.time_ < var_50_26 + var_50_34 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play900000013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 900000013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play900000014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1019"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.actorSpriteComps1019 == nil then
				arg_51_1.var_.actorSpriteComps1019 = var_54_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_2 = 0.1

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.actorSpriteComps1019 then
					for iter_54_0, iter_54_1 in pairs(arg_51_1.var_.actorSpriteComps1019:ToTable()) do
						if iter_54_1 then
							local var_54_4 = Mathf.Lerp(iter_54_1.color.r, 1, var_54_3)

							iter_54_1.color = Color.New(var_54_4, var_54_4, var_54_4)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.actorSpriteComps1019 then
				local var_54_5 = 1

				for iter_54_2, iter_54_3 in pairs(arg_51_1.var_.actorSpriteComps1019:ToTable()) do
					if iter_54_3 then
						iter_54_3.color = Color.New(var_54_5, var_54_5, var_54_5)
					end
				end

				arg_51_1.var_.actorSpriteComps1019 = nil
			end

			local var_54_6 = arg_51_1.actors_["1038"]
			local var_54_7 = 0

			if var_54_7 < arg_51_1.time_ and arg_51_1.time_ <= var_54_7 + arg_54_0 and arg_51_1.var_.actorSpriteComps1038 == nil then
				arg_51_1.var_.actorSpriteComps1038 = var_54_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_8 = 0.1

			if var_54_7 <= arg_51_1.time_ and arg_51_1.time_ < var_54_7 + var_54_8 then
				local var_54_9 = (arg_51_1.time_ - var_54_7) / var_54_8

				if arg_51_1.var_.actorSpriteComps1038 then
					for iter_54_4, iter_54_5 in pairs(arg_51_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_54_5 then
							local var_54_10 = Mathf.Lerp(iter_54_5.color.r, 0.5, var_54_9)

							iter_54_5.color = Color.New(var_54_10, var_54_10, var_54_10)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_7 + var_54_8 and arg_51_1.time_ < var_54_7 + var_54_8 + arg_54_0 and arg_51_1.var_.actorSpriteComps1038 then
				local var_54_11 = 0.5

				for iter_54_6, iter_54_7 in pairs(arg_51_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_54_7 then
						iter_54_7.color = Color.New(var_54_11, var_54_11, var_54_11)
					end
				end

				arg_51_1.var_.actorSpriteComps1038 = nil
			end

			local var_54_12 = 0
			local var_54_13 = 0.775

			if var_54_12 < arg_51_1.time_ and arg_51_1.time_ <= var_54_12 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_14 = arg_51_1:FormatText(StoryNameCfg[13].name)

				arg_51_1.leftNameTxt_.text = var_54_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_15 = arg_51_1:GetWordFromCfg(900000013)
				local var_54_16 = arg_51_1:FormatText(var_54_15.content)

				arg_51_1.text_.text = var_54_16

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_17 = 31
				local var_54_18 = utf8.len(var_54_16)
				local var_54_19 = var_54_17 <= 0 and var_54_13 or var_54_13 * (var_54_18 / var_54_17)

				if var_54_19 > 0 and var_54_13 < var_54_19 then
					arg_51_1.talkMaxDuration = var_54_19

					if var_54_19 + var_54_12 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_19 + var_54_12
					end
				end

				arg_51_1.text_.text = var_54_16
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_20 = math.max(var_54_13, arg_51_1.talkMaxDuration)

			if var_54_12 <= arg_51_1.time_ and arg_51_1.time_ < var_54_12 + var_54_20 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_12) / var_54_20

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_12 + var_54_20 and arg_51_1.time_ < var_54_12 + var_54_20 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play900000014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 900000014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play900000015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1033"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1033 = var_58_0.localPosition
				var_58_0.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("1033", 2)

				local var_58_2 = var_58_0.childCount

				for iter_58_0 = 0, var_58_2 - 1 do
					local var_58_3 = var_58_0:GetChild(iter_58_0)

					if var_58_3.name == "split_4" or not string.find(var_58_3.name, "split") then
						var_58_3.gameObject:SetActive(true)
					else
						var_58_3.gameObject:SetActive(false)
					end
				end
			end

			local var_58_4 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_4 then
				local var_58_5 = (arg_55_1.time_ - var_58_1) / var_58_4
				local var_58_6 = Vector3.New(-390, -420, 0)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1033, var_58_6, var_58_5)
			end

			if arg_55_1.time_ >= var_58_1 + var_58_4 and arg_55_1.time_ < var_58_1 + var_58_4 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_58_7 = arg_55_1.actors_["1033"]
			local var_58_8 = 0

			if var_58_8 < arg_55_1.time_ and arg_55_1.time_ <= var_58_8 + arg_58_0 and arg_55_1.var_.actorSpriteComps1033 == nil then
				arg_55_1.var_.actorSpriteComps1033 = var_58_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_9 = 0.1

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

			local var_58_13 = arg_55_1.actors_["1033"]
			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				local var_58_15 = var_58_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_58_15 then
					arg_55_1.var_.alphaOldValue1033 = var_58_15.alpha
					arg_55_1.var_.characterEffect1033 = var_58_15
				end

				arg_55_1.var_.alphaOldValue1033 = 0
			end

			local var_58_16 = 0.1

			if var_58_14 <= arg_55_1.time_ and arg_55_1.time_ < var_58_14 + var_58_16 then
				local var_58_17 = (arg_55_1.time_ - var_58_14) / var_58_16
				local var_58_18 = Mathf.Lerp(arg_55_1.var_.alphaOldValue1033, 1, var_58_17)

				if arg_55_1.var_.characterEffect1033 then
					arg_55_1.var_.characterEffect1033.alpha = var_58_18
				end
			end

			if arg_55_1.time_ >= var_58_14 + var_58_16 and arg_55_1.time_ < var_58_14 + var_58_16 + arg_58_0 and arg_55_1.var_.characterEffect1033 then
				arg_55_1.var_.characterEffect1033.alpha = 1
			end

			local var_58_19 = arg_55_1.actors_["1019"]
			local var_58_20 = 0

			if var_58_20 < arg_55_1.time_ and arg_55_1.time_ <= var_58_20 + arg_58_0 and arg_55_1.var_.actorSpriteComps1019 == nil then
				arg_55_1.var_.actorSpriteComps1019 = var_58_19:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_21 = 0.1

			if var_58_20 <= arg_55_1.time_ and arg_55_1.time_ < var_58_20 + var_58_21 then
				local var_58_22 = (arg_55_1.time_ - var_58_20) / var_58_21

				if arg_55_1.var_.actorSpriteComps1019 then
					for iter_58_5, iter_58_6 in pairs(arg_55_1.var_.actorSpriteComps1019:ToTable()) do
						if iter_58_6 then
							local var_58_23 = Mathf.Lerp(iter_58_6.color.r, 0.5, var_58_22)

							iter_58_6.color = Color.New(var_58_23, var_58_23, var_58_23)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_20 + var_58_21 and arg_55_1.time_ < var_58_20 + var_58_21 + arg_58_0 and arg_55_1.var_.actorSpriteComps1019 then
				local var_58_24 = 0.5

				for iter_58_7, iter_58_8 in pairs(arg_55_1.var_.actorSpriteComps1019:ToTable()) do
					if iter_58_8 then
						iter_58_8.color = Color.New(var_58_24, var_58_24, var_58_24)
					end
				end

				arg_55_1.var_.actorSpriteComps1019 = nil
			end

			local var_58_25 = arg_55_1.actors_["1038"].transform
			local var_58_26 = 0

			if var_58_26 < arg_55_1.time_ and arg_55_1.time_ <= var_58_26 + arg_58_0 then
				arg_55_1.var_.moveOldPos1038 = var_58_25.localPosition
				var_58_25.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("1038", 7)

				local var_58_27 = var_58_25.childCount

				for iter_58_9 = 0, var_58_27 - 1 do
					local var_58_28 = var_58_25:GetChild(iter_58_9)

					if var_58_28.name == "split_1" or not string.find(var_58_28.name, "split") then
						var_58_28.gameObject:SetActive(true)
					else
						var_58_28.gameObject:SetActive(false)
					end
				end
			end

			local var_58_29 = 0.001

			if var_58_26 <= arg_55_1.time_ and arg_55_1.time_ < var_58_26 + var_58_29 then
				local var_58_30 = (arg_55_1.time_ - var_58_26) / var_58_29
				local var_58_31 = Vector3.New(0, -2000, 0)

				var_58_25.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1038, var_58_31, var_58_30)
			end

			if arg_55_1.time_ >= var_58_26 + var_58_29 and arg_55_1.time_ < var_58_26 + var_58_29 + arg_58_0 then
				var_58_25.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_58_32 = 0
			local var_58_33 = 0.4

			if var_58_32 < arg_55_1.time_ and arg_55_1.time_ <= var_58_32 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_34 = arg_55_1:FormatText(StoryNameCfg[236].name)

				arg_55_1.leftNameTxt_.text = var_58_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_35 = arg_55_1:GetWordFromCfg(900000014)
				local var_58_36 = arg_55_1:FormatText(var_58_35.content)

				arg_55_1.text_.text = var_58_36

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_37 = 16
				local var_58_38 = utf8.len(var_58_36)
				local var_58_39 = var_58_37 <= 0 and var_58_33 or var_58_33 * (var_58_38 / var_58_37)

				if var_58_39 > 0 and var_58_33 < var_58_39 then
					arg_55_1.talkMaxDuration = var_58_39

					if var_58_39 + var_58_32 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_39 + var_58_32
					end
				end

				arg_55_1.text_.text = var_58_36
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_40 = math.max(var_58_33, arg_55_1.talkMaxDuration)

			if var_58_32 <= arg_55_1.time_ and arg_55_1.time_ < var_58_32 + var_58_40 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_32) / var_58_40

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_32 + var_58_40 and arg_55_1.time_ < var_58_32 + var_58_40 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play900000015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 900000015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play900000016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1019"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.actorSpriteComps1019 == nil then
				arg_59_1.var_.actorSpriteComps1019 = var_62_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_2 = 0.1

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.actorSpriteComps1019 then
					for iter_62_0, iter_62_1 in pairs(arg_59_1.var_.actorSpriteComps1019:ToTable()) do
						if iter_62_1 then
							local var_62_4 = Mathf.Lerp(iter_62_1.color.r, 1, var_62_3)

							iter_62_1.color = Color.New(var_62_4, var_62_4, var_62_4)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.actorSpriteComps1019 then
				local var_62_5 = 1

				for iter_62_2, iter_62_3 in pairs(arg_59_1.var_.actorSpriteComps1019:ToTable()) do
					if iter_62_3 then
						iter_62_3.color = Color.New(var_62_5, var_62_5, var_62_5)
					end
				end

				arg_59_1.var_.actorSpriteComps1019 = nil
			end

			local var_62_6 = arg_59_1.actors_["1033"]
			local var_62_7 = 0

			if var_62_7 < arg_59_1.time_ and arg_59_1.time_ <= var_62_7 + arg_62_0 and arg_59_1.var_.actorSpriteComps1033 == nil then
				arg_59_1.var_.actorSpriteComps1033 = var_62_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_8 = 0.1

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

			local var_62_12 = arg_59_1.actors_["1033"].transform
			local var_62_13 = 0

			if var_62_13 < arg_59_1.time_ and arg_59_1.time_ <= var_62_13 + arg_62_0 then
				arg_59_1.var_.moveOldPos1033 = var_62_12.localPosition
				var_62_12.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("1033", 7)

				local var_62_14 = var_62_12.childCount

				for iter_62_8 = 0, var_62_14 - 1 do
					local var_62_15 = var_62_12:GetChild(iter_62_8)

					if var_62_15.name == "split_4" or not string.find(var_62_15.name, "split") then
						var_62_15.gameObject:SetActive(true)
					else
						var_62_15.gameObject:SetActive(false)
					end
				end
			end

			local var_62_16 = 0.001

			if var_62_13 <= arg_59_1.time_ and arg_59_1.time_ < var_62_13 + var_62_16 then
				local var_62_17 = (arg_59_1.time_ - var_62_13) / var_62_16
				local var_62_18 = Vector3.New(0, -2000, 0)

				var_62_12.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1033, var_62_18, var_62_17)
			end

			if arg_59_1.time_ >= var_62_13 + var_62_16 and arg_59_1.time_ < var_62_13 + var_62_16 + arg_62_0 then
				var_62_12.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_62_19 = arg_59_1.actors_["1033"].transform
			local var_62_20 = 0

			if var_62_20 < arg_59_1.time_ and arg_59_1.time_ <= var_62_20 + arg_62_0 then
				arg_59_1.var_.moveOldPos1033 = var_62_19.localPosition
				var_62_19.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("1033", 2)

				local var_62_21 = var_62_19.childCount

				for iter_62_9 = 0, var_62_21 - 1 do
					local var_62_22 = var_62_19:GetChild(iter_62_9)

					if var_62_22.name == "split_5" or not string.find(var_62_22.name, "split") then
						var_62_22.gameObject:SetActive(true)
					else
						var_62_22.gameObject:SetActive(false)
					end
				end
			end

			local var_62_23 = 0.001

			if var_62_20 <= arg_59_1.time_ and arg_59_1.time_ < var_62_20 + var_62_23 then
				local var_62_24 = (arg_59_1.time_ - var_62_20) / var_62_23
				local var_62_25 = Vector3.New(-390, -420, 0)

				var_62_19.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1033, var_62_25, var_62_24)
			end

			if arg_59_1.time_ >= var_62_20 + var_62_23 and arg_59_1.time_ < var_62_20 + var_62_23 + arg_62_0 then
				var_62_19.localPosition = Vector3.New(-390, -420, 0)
			end

			local var_62_26 = 0
			local var_62_27 = 0.85

			if var_62_26 < arg_59_1.time_ and arg_59_1.time_ <= var_62_26 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_28 = arg_59_1:FormatText(StoryNameCfg[13].name)

				arg_59_1.leftNameTxt_.text = var_62_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_29 = arg_59_1:GetWordFromCfg(900000015)
				local var_62_30 = arg_59_1:FormatText(var_62_29.content)

				arg_59_1.text_.text = var_62_30

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_31 = 34
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
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_34 = math.max(var_62_27, arg_59_1.talkMaxDuration)

			if var_62_26 <= arg_59_1.time_ and arg_59_1.time_ < var_62_26 + var_62_34 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_26) / var_62_34

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_26 + var_62_34 and arg_59_1.time_ < var_62_26 + var_62_34 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play900000016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 900000016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play900000017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1019"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.actorSpriteComps1019 == nil then
				arg_63_1.var_.actorSpriteComps1019 = var_66_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_2 = 0.1

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.actorSpriteComps1019 then
					for iter_66_0, iter_66_1 in pairs(arg_63_1.var_.actorSpriteComps1019:ToTable()) do
						if iter_66_1 then
							local var_66_4 = Mathf.Lerp(iter_66_1.color.r, 0.5, var_66_3)

							iter_66_1.color = Color.New(var_66_4, var_66_4, var_66_4)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.actorSpriteComps1019 then
				local var_66_5 = 0.5

				for iter_66_2, iter_66_3 in pairs(arg_63_1.var_.actorSpriteComps1019:ToTable()) do
					if iter_66_3 then
						iter_66_3.color = Color.New(var_66_5, var_66_5, var_66_5)
					end
				end

				arg_63_1.var_.actorSpriteComps1019 = nil
			end

			local var_66_6 = arg_63_1.actors_["1033"]
			local var_66_7 = 0

			if var_66_7 < arg_63_1.time_ and arg_63_1.time_ <= var_66_7 + arg_66_0 and arg_63_1.var_.actorSpriteComps1033 == nil then
				arg_63_1.var_.actorSpriteComps1033 = var_66_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_8 = 0.1

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

				local var_66_15 = arg_63_1:GetWordFromCfg(900000016)
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
	Play900000017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 900000017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play900000018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1038"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1038 = var_70_0.localPosition
				var_70_0.localScale = Vector3.New(1, 1, 1)

				arg_67_1:CheckSpriteTmpPos("1038", 3)

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
				local var_70_6 = Vector3.New(0, -400, 0)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1038, var_70_6, var_70_5)
			end

			if arg_67_1.time_ >= var_70_1 + var_70_4 and arg_67_1.time_ < var_70_1 + var_70_4 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(0, -400, 0)
			end

			local var_70_7 = arg_67_1.actors_["1038"]
			local var_70_8 = 0

			if var_70_8 < arg_67_1.time_ and arg_67_1.time_ <= var_70_8 + arg_70_0 then
				local var_70_9 = var_70_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_70_9 then
					arg_67_1.var_.alphaOldValue1038 = var_70_9.alpha
					arg_67_1.var_.characterEffect1038 = var_70_9
				end

				arg_67_1.var_.alphaOldValue1038 = 0
			end

			local var_70_10 = 0.1

			if var_70_8 <= arg_67_1.time_ and arg_67_1.time_ < var_70_8 + var_70_10 then
				local var_70_11 = (arg_67_1.time_ - var_70_8) / var_70_10
				local var_70_12 = Mathf.Lerp(arg_67_1.var_.alphaOldValue1038, 1, var_70_11)

				if arg_67_1.var_.characterEffect1038 then
					arg_67_1.var_.characterEffect1038.alpha = var_70_12
				end
			end

			if arg_67_1.time_ >= var_70_8 + var_70_10 and arg_67_1.time_ < var_70_8 + var_70_10 + arg_70_0 and arg_67_1.var_.characterEffect1038 then
				arg_67_1.var_.characterEffect1038.alpha = 1
			end

			local var_70_13 = arg_67_1.actors_["1038"]
			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 and arg_67_1.var_.actorSpriteComps1038 == nil then
				arg_67_1.var_.actorSpriteComps1038 = var_70_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_15 = 0.1

			if var_70_14 <= arg_67_1.time_ and arg_67_1.time_ < var_70_14 + var_70_15 then
				local var_70_16 = (arg_67_1.time_ - var_70_14) / var_70_15

				if arg_67_1.var_.actorSpriteComps1038 then
					for iter_70_1, iter_70_2 in pairs(arg_67_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_70_2 then
							local var_70_17 = Mathf.Lerp(iter_70_2.color.r, 1, var_70_16)

							iter_70_2.color = Color.New(var_70_17, var_70_17, var_70_17)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_14 + var_70_15 and arg_67_1.time_ < var_70_14 + var_70_15 + arg_70_0 and arg_67_1.var_.actorSpriteComps1038 then
				local var_70_18 = 1

				for iter_70_3, iter_70_4 in pairs(arg_67_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_70_4 then
						iter_70_4.color = Color.New(var_70_18, var_70_18, var_70_18)
					end
				end

				arg_67_1.var_.actorSpriteComps1038 = nil
			end

			local var_70_19 = arg_67_1.actors_["1033"].transform
			local var_70_20 = 0

			if var_70_20 < arg_67_1.time_ and arg_67_1.time_ <= var_70_20 + arg_70_0 then
				arg_67_1.var_.moveOldPos1033 = var_70_19.localPosition
				var_70_19.localScale = Vector3.New(1, 1, 1)

				arg_67_1:CheckSpriteTmpPos("1033", 7)

				local var_70_21 = var_70_19.childCount

				for iter_70_5 = 0, var_70_21 - 1 do
					local var_70_22 = var_70_19:GetChild(iter_70_5)

					if var_70_22.name == "split_5" or not string.find(var_70_22.name, "split") then
						var_70_22.gameObject:SetActive(true)
					else
						var_70_22.gameObject:SetActive(false)
					end
				end
			end

			local var_70_23 = 0.001

			if var_70_20 <= arg_67_1.time_ and arg_67_1.time_ < var_70_20 + var_70_23 then
				local var_70_24 = (arg_67_1.time_ - var_70_20) / var_70_23
				local var_70_25 = Vector3.New(0, -2000, 0)

				var_70_19.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1033, var_70_25, var_70_24)
			end

			if arg_67_1.time_ >= var_70_20 + var_70_23 and arg_67_1.time_ < var_70_20 + var_70_23 + arg_70_0 then
				var_70_19.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_70_26 = arg_67_1.actors_["1019"].transform
			local var_70_27 = 0

			if var_70_27 < arg_67_1.time_ and arg_67_1.time_ <= var_70_27 + arg_70_0 then
				arg_67_1.var_.moveOldPos1019 = var_70_26.localPosition
				var_70_26.localScale = Vector3.New(1, 1, 1)

				arg_67_1:CheckSpriteTmpPos("1019", 7)

				local var_70_28 = var_70_26.childCount

				for iter_70_6 = 0, var_70_28 - 1 do
					local var_70_29 = var_70_26:GetChild(iter_70_6)

					if var_70_29.name == "split_1" or not string.find(var_70_29.name, "split") then
						var_70_29.gameObject:SetActive(true)
					else
						var_70_29.gameObject:SetActive(false)
					end
				end
			end

			local var_70_30 = 0.001

			if var_70_27 <= arg_67_1.time_ and arg_67_1.time_ < var_70_27 + var_70_30 then
				local var_70_31 = (arg_67_1.time_ - var_70_27) / var_70_30
				local var_70_32 = Vector3.New(0, -2000, 200)

				var_70_26.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1019, var_70_32, var_70_31)
			end

			if arg_67_1.time_ >= var_70_27 + var_70_30 and arg_67_1.time_ < var_70_27 + var_70_30 + arg_70_0 then
				var_70_26.localPosition = Vector3.New(0, -2000, 200)
			end

			local var_70_33 = 0
			local var_70_34 = 0.4

			if var_70_33 < arg_67_1.time_ and arg_67_1.time_ <= var_70_33 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_35 = arg_67_1:FormatText(StoryNameCfg[94].name)

				arg_67_1.leftNameTxt_.text = var_70_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_36 = arg_67_1:GetWordFromCfg(900000017)
				local var_70_37 = arg_67_1:FormatText(var_70_36.content)

				arg_67_1.text_.text = var_70_37

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_38 = 16
				local var_70_39 = utf8.len(var_70_37)
				local var_70_40 = var_70_38 <= 0 and var_70_34 or var_70_34 * (var_70_39 / var_70_38)

				if var_70_40 > 0 and var_70_34 < var_70_40 then
					arg_67_1.talkMaxDuration = var_70_40

					if var_70_40 + var_70_33 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_40 + var_70_33
					end
				end

				arg_67_1.text_.text = var_70_37
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_41 = math.max(var_70_34, arg_67_1.talkMaxDuration)

			if var_70_33 <= arg_67_1.time_ and arg_67_1.time_ < var_70_33 + var_70_41 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_33) / var_70_41

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_33 + var_70_41 and arg_67_1.time_ < var_70_33 + var_70_41 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play900000018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 900000018
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play900000019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1038"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1038 = var_74_0.localPosition
				var_74_0.localScale = Vector3.New(1, 1, 1)

				arg_71_1:CheckSpriteTmpPos("1038", 7)

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
				local var_74_6 = Vector3.New(0, -2000, 0)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1038, var_74_6, var_74_5)
			end

			if arg_71_1.time_ >= var_74_1 + var_74_4 and arg_71_1.time_ < var_74_1 + var_74_4 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_74_7 = arg_71_1.actors_["1019"].transform
			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 then
				arg_71_1.var_.moveOldPos1019 = var_74_7.localPosition
				var_74_7.localScale = Vector3.New(1, 1, 1)

				arg_71_1:CheckSpriteTmpPos("1019", 3)

				local var_74_9 = var_74_7.childCount

				for iter_74_1 = 0, var_74_9 - 1 do
					local var_74_10 = var_74_7:GetChild(iter_74_1)

					if var_74_10.name == "split_1" or not string.find(var_74_10.name, "split") then
						var_74_10.gameObject:SetActive(true)
					else
						var_74_10.gameObject:SetActive(false)
					end
				end
			end

			local var_74_11 = 0.001

			if var_74_8 <= arg_71_1.time_ and arg_71_1.time_ < var_74_8 + var_74_11 then
				local var_74_12 = (arg_71_1.time_ - var_74_8) / var_74_11
				local var_74_13 = Vector3.New(-210, -340, 200)

				var_74_7.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1019, var_74_13, var_74_12)
			end

			if arg_71_1.time_ >= var_74_8 + var_74_11 and arg_71_1.time_ < var_74_8 + var_74_11 + arg_74_0 then
				var_74_7.localPosition = Vector3.New(-210, -340, 200)
			end

			local var_74_14 = arg_71_1.actors_["1019"]
			local var_74_15 = 0

			if var_74_15 < arg_71_1.time_ and arg_71_1.time_ <= var_74_15 + arg_74_0 and arg_71_1.var_.actorSpriteComps1019 == nil then
				arg_71_1.var_.actorSpriteComps1019 = var_74_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_16 = 0.1

			if var_74_15 <= arg_71_1.time_ and arg_71_1.time_ < var_74_15 + var_74_16 then
				local var_74_17 = (arg_71_1.time_ - var_74_15) / var_74_16

				if arg_71_1.var_.actorSpriteComps1019 then
					for iter_74_2, iter_74_3 in pairs(arg_71_1.var_.actorSpriteComps1019:ToTable()) do
						if iter_74_3 then
							local var_74_18 = Mathf.Lerp(iter_74_3.color.r, 1, var_74_17)

							iter_74_3.color = Color.New(var_74_18, var_74_18, var_74_18)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_15 + var_74_16 and arg_71_1.time_ < var_74_15 + var_74_16 + arg_74_0 and arg_71_1.var_.actorSpriteComps1019 then
				local var_74_19 = 1

				for iter_74_4, iter_74_5 in pairs(arg_71_1.var_.actorSpriteComps1019:ToTable()) do
					if iter_74_5 then
						iter_74_5.color = Color.New(var_74_19, var_74_19, var_74_19)
					end
				end

				arg_71_1.var_.actorSpriteComps1019 = nil
			end

			local var_74_20 = arg_71_1.actors_["1019"]
			local var_74_21 = 0

			if var_74_21 < arg_71_1.time_ and arg_71_1.time_ <= var_74_21 + arg_74_0 then
				local var_74_22 = var_74_20:GetComponentInChildren(typeof(CanvasGroup))

				if var_74_22 then
					arg_71_1.var_.alphaOldValue1019 = var_74_22.alpha
					arg_71_1.var_.characterEffect1019 = var_74_22
				end

				arg_71_1.var_.alphaOldValue1019 = 0
			end

			local var_74_23 = 0.1

			if var_74_21 <= arg_71_1.time_ and arg_71_1.time_ < var_74_21 + var_74_23 then
				local var_74_24 = (arg_71_1.time_ - var_74_21) / var_74_23
				local var_74_25 = Mathf.Lerp(arg_71_1.var_.alphaOldValue1019, 1, var_74_24)

				if arg_71_1.var_.characterEffect1019 then
					arg_71_1.var_.characterEffect1019.alpha = var_74_25
				end
			end

			if arg_71_1.time_ >= var_74_21 + var_74_23 and arg_71_1.time_ < var_74_21 + var_74_23 + arg_74_0 and arg_71_1.var_.characterEffect1019 then
				arg_71_1.var_.characterEffect1019.alpha = 1
			end

			local var_74_26 = 0
			local var_74_27 = 0.2

			if var_74_26 < arg_71_1.time_ and arg_71_1.time_ <= var_74_26 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_28 = arg_71_1:FormatText(StoryNameCfg[13].name)

				arg_71_1.leftNameTxt_.text = var_74_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_29 = arg_71_1:GetWordFromCfg(900000018)
				local var_74_30 = arg_71_1:FormatText(var_74_29.content)

				arg_71_1.text_.text = var_74_30

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_31 = 8
				local var_74_32 = utf8.len(var_74_30)
				local var_74_33 = var_74_31 <= 0 and var_74_27 or var_74_27 * (var_74_32 / var_74_31)

				if var_74_33 > 0 and var_74_27 < var_74_33 then
					arg_71_1.talkMaxDuration = var_74_33

					if var_74_33 + var_74_26 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_33 + var_74_26
					end
				end

				arg_71_1.text_.text = var_74_30
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_34 = math.max(var_74_27, arg_71_1.talkMaxDuration)

			if var_74_26 <= arg_71_1.time_ and arg_71_1.time_ < var_74_26 + var_74_34 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_26) / var_74_34

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_26 + var_74_34 and arg_71_1.time_ < var_74_26 + var_74_34 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play900000019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 900000019
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
			arg_75_1.auto_ = false
		end

		function arg_75_1.playNext_(arg_77_0)
			arg_75_1.onStoryFinished_()
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1033"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1033 = var_78_0.localPosition
				var_78_0.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("1033", 3)

				local var_78_2 = var_78_0.childCount

				for iter_78_0 = 0, var_78_2 - 1 do
					local var_78_3 = var_78_0:GetChild(iter_78_0)

					if var_78_3.name == "split_4" or not string.find(var_78_3.name, "split") then
						var_78_3.gameObject:SetActive(true)
					else
						var_78_3.gameObject:SetActive(false)
					end
				end
			end

			local var_78_4 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_4 then
				local var_78_5 = (arg_75_1.time_ - var_78_1) / var_78_4
				local var_78_6 = Vector3.New(0, -420, 0)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1033, var_78_6, var_78_5)
			end

			if arg_75_1.time_ >= var_78_1 + var_78_4 and arg_75_1.time_ < var_78_1 + var_78_4 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0, -420, 0)
			end

			local var_78_7 = arg_75_1.actors_["1019"].transform
			local var_78_8 = 0

			if var_78_8 < arg_75_1.time_ and arg_75_1.time_ <= var_78_8 + arg_78_0 then
				arg_75_1.var_.moveOldPos1019 = var_78_7.localPosition
				var_78_7.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("1019", 7)

				local var_78_9 = var_78_7.childCount

				for iter_78_1 = 0, var_78_9 - 1 do
					local var_78_10 = var_78_7:GetChild(iter_78_1)

					if var_78_10.name == "split_1" or not string.find(var_78_10.name, "split") then
						var_78_10.gameObject:SetActive(true)
					else
						var_78_10.gameObject:SetActive(false)
					end
				end
			end

			local var_78_11 = 0.001

			if var_78_8 <= arg_75_1.time_ and arg_75_1.time_ < var_78_8 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_8) / var_78_11
				local var_78_13 = Vector3.New(0, -2000, 200)

				var_78_7.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1019, var_78_13, var_78_12)
			end

			if arg_75_1.time_ >= var_78_8 + var_78_11 and arg_75_1.time_ < var_78_8 + var_78_11 + arg_78_0 then
				var_78_7.localPosition = Vector3.New(0, -2000, 200)
			end

			local var_78_14 = arg_75_1.actors_["1033"]
			local var_78_15 = 0

			if var_78_15 < arg_75_1.time_ and arg_75_1.time_ <= var_78_15 + arg_78_0 and arg_75_1.var_.actorSpriteComps1033 == nil then
				arg_75_1.var_.actorSpriteComps1033 = var_78_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_16 = 0.1

			if var_78_15 <= arg_75_1.time_ and arg_75_1.time_ < var_78_15 + var_78_16 then
				local var_78_17 = (arg_75_1.time_ - var_78_15) / var_78_16

				if arg_75_1.var_.actorSpriteComps1033 then
					for iter_78_2, iter_78_3 in pairs(arg_75_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_78_3 then
							local var_78_18 = Mathf.Lerp(iter_78_3.color.r, 1, var_78_17)

							iter_78_3.color = Color.New(var_78_18, var_78_18, var_78_18)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_15 + var_78_16 and arg_75_1.time_ < var_78_15 + var_78_16 + arg_78_0 and arg_75_1.var_.actorSpriteComps1033 then
				local var_78_19 = 1

				for iter_78_4, iter_78_5 in pairs(arg_75_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_78_5 then
						iter_78_5.color = Color.New(var_78_19, var_78_19, var_78_19)
					end
				end

				arg_75_1.var_.actorSpriteComps1033 = nil
			end

			local var_78_20 = arg_75_1.actors_["1033"]
			local var_78_21 = 0

			if var_78_21 < arg_75_1.time_ and arg_75_1.time_ <= var_78_21 + arg_78_0 then
				local var_78_22 = var_78_20:GetComponentInChildren(typeof(CanvasGroup))

				if var_78_22 then
					arg_75_1.var_.alphaOldValue1033 = var_78_22.alpha
					arg_75_1.var_.characterEffect1033 = var_78_22
				end

				arg_75_1.var_.alphaOldValue1033 = 0
			end

			local var_78_23 = 0.1

			if var_78_21 <= arg_75_1.time_ and arg_75_1.time_ < var_78_21 + var_78_23 then
				local var_78_24 = (arg_75_1.time_ - var_78_21) / var_78_23
				local var_78_25 = Mathf.Lerp(arg_75_1.var_.alphaOldValue1033, 1, var_78_24)

				if arg_75_1.var_.characterEffect1033 then
					arg_75_1.var_.characterEffect1033.alpha = var_78_25
				end
			end

			if arg_75_1.time_ >= var_78_21 + var_78_23 and arg_75_1.time_ < var_78_21 + var_78_23 + arg_78_0 and arg_75_1.var_.characterEffect1033 then
				arg_75_1.var_.characterEffect1033.alpha = 1
			end

			local var_78_26 = 0
			local var_78_27 = 0.05

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

				local var_78_29 = arg_75_1:GetWordFromCfg(900000019)
				local var_78_30 = arg_75_1:FormatText(var_78_29.content)

				arg_75_1.text_.text = var_78_30

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_31 = 2
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
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_34 = math.max(var_78_27, arg_75_1.talkMaxDuration)

			if var_78_26 <= arg_75_1.time_ and arg_75_1.time_ < var_78_26 + var_78_34 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_26) / var_78_34

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_26 + var_78_34 and arg_75_1.time_ < var_78_26 + var_78_34 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/F01a"
	},
	voices = {}
}
