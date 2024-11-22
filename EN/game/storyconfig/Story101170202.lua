return {
	Play117022001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 117022001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play117022002(arg_1_1)
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

			local var_4_22 = 0
			local var_4_23 = 0.6

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

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_side_daily04", "bgm_side_daily04", "bgm_side_daily04.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 1.05

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

				local var_4_33 = arg_1_1:GetWordFromCfg(117022001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 42
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
	Play117022002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 117022002
		arg_7_1.duration_ = 5.1

		local var_7_0 = {
			zh = 5.1,
			ja = 4.866
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
				arg_7_0:Play117022003(arg_7_1)
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

			local var_10_2 = arg_7_1.actors_["1033"]
			local var_10_3 = 0

			if var_10_3 < arg_7_1.time_ and arg_7_1.time_ <= var_10_3 + arg_10_0 then
				local var_10_4 = var_10_2:GetComponentInChildren(typeof(CanvasGroup))

				if var_10_4 then
					arg_7_1.var_.alphaOldValue1033 = var_10_4.alpha
					arg_7_1.var_.characterEffect1033 = var_10_4
				end

				arg_7_1.var_.alphaOldValue1033 = 0
			end

			local var_10_5 = 0.333333333333333

			if var_10_3 <= arg_7_1.time_ and arg_7_1.time_ < var_10_3 + var_10_5 then
				local var_10_6 = (arg_7_1.time_ - var_10_3) / var_10_5
				local var_10_7 = Mathf.Lerp(arg_7_1.var_.alphaOldValue1033, 1, var_10_6)

				if arg_7_1.var_.characterEffect1033 then
					arg_7_1.var_.characterEffect1033.alpha = var_10_7
				end
			end

			if arg_7_1.time_ >= var_10_3 + var_10_5 and arg_7_1.time_ < var_10_3 + var_10_5 + arg_10_0 and arg_7_1.var_.characterEffect1033 then
				arg_7_1.var_.characterEffect1033.alpha = 1
			end

			local var_10_8 = arg_7_1.actors_["1033"].transform
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 then
				arg_7_1.var_.moveOldPos1033 = var_10_8.localPosition
				var_10_8.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("1033", 3)

				local var_10_10 = var_10_8.childCount

				for iter_10_0 = 0, var_10_10 - 1 do
					local var_10_11 = var_10_8:GetChild(iter_10_0)

					if var_10_11.name == "split_6" or not string.find(var_10_11.name, "split") then
						var_10_11.gameObject:SetActive(true)
					else
						var_10_11.gameObject:SetActive(false)
					end
				end
			end

			local var_10_12 = 0.001

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_12 then
				local var_10_13 = (arg_7_1.time_ - var_10_9) / var_10_12
				local var_10_14 = Vector3.New(0, -420, 0)

				var_10_8.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1033, var_10_14, var_10_13)
			end

			if arg_7_1.time_ >= var_10_9 + var_10_12 and arg_7_1.time_ < var_10_9 + var_10_12 + arg_10_0 then
				var_10_8.localPosition = Vector3.New(0, -420, 0)
			end

			local var_10_15 = arg_7_1.actors_["1033"]
			local var_10_16 = 0

			if var_10_16 < arg_7_1.time_ and arg_7_1.time_ <= var_10_16 + arg_10_0 and arg_7_1.var_.actorSpriteComps1033 == nil then
				arg_7_1.var_.actorSpriteComps1033 = var_10_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_17 = 0.2

			if var_10_16 <= arg_7_1.time_ and arg_7_1.time_ < var_10_16 + var_10_17 then
				local var_10_18 = (arg_7_1.time_ - var_10_16) / var_10_17

				if arg_7_1.var_.actorSpriteComps1033 then
					for iter_10_1, iter_10_2 in pairs(arg_7_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_10_2 then
							local var_10_19 = Mathf.Lerp(iter_10_2.color.r, 1, var_10_18)

							iter_10_2.color = Color.New(var_10_19, var_10_19, var_10_19)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_16 + var_10_17 and arg_7_1.time_ < var_10_16 + var_10_17 + arg_10_0 and arg_7_1.var_.actorSpriteComps1033 then
				local var_10_20 = 1

				for iter_10_3, iter_10_4 in pairs(arg_7_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_10_4 then
						iter_10_4.color = Color.New(var_10_20, var_10_20, var_10_20)
					end
				end

				arg_7_1.var_.actorSpriteComps1033 = nil
			end

			local var_10_21 = 0
			local var_10_22 = 0.675

			if var_10_21 < arg_7_1.time_ and arg_7_1.time_ <= var_10_21 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_23 = arg_7_1:FormatText(StoryNameCfg[236].name)

				arg_7_1.leftNameTxt_.text = var_10_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_24 = arg_7_1:GetWordFromCfg(117022002)
				local var_10_25 = arg_7_1:FormatText(var_10_24.content)

				arg_7_1.text_.text = var_10_25

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_26 = 27
				local var_10_27 = utf8.len(var_10_25)
				local var_10_28 = var_10_26 <= 0 and var_10_22 or var_10_22 * (var_10_27 / var_10_26)

				if var_10_28 > 0 and var_10_22 < var_10_28 then
					arg_7_1.talkMaxDuration = var_10_28

					if var_10_28 + var_10_21 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_28 + var_10_21
					end
				end

				arg_7_1.text_.text = var_10_25
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117022", "117022002", "story_v_out_117022.awb") ~= 0 then
					local var_10_29 = manager.audio:GetVoiceLength("story_v_out_117022", "117022002", "story_v_out_117022.awb") / 1000

					if var_10_29 + var_10_21 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_29 + var_10_21
					end

					if var_10_24.prefab_name ~= "" and arg_7_1.actors_[var_10_24.prefab_name] ~= nil then
						local var_10_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_24.prefab_name].transform, "story_v_out_117022", "117022002", "story_v_out_117022.awb")

						arg_7_1:RecordAudio("117022002", var_10_30)
						arg_7_1:RecordAudio("117022002", var_10_30)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_117022", "117022002", "story_v_out_117022.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_117022", "117022002", "story_v_out_117022.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_31 = math.max(var_10_22, arg_7_1.talkMaxDuration)

			if var_10_21 <= arg_7_1.time_ and arg_7_1.time_ < var_10_21 + var_10_31 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_21) / var_10_31

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_21 + var_10_31 and arg_7_1.time_ < var_10_21 + var_10_31 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play117022003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 117022003
		arg_11_1.duration_ = 5.6

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play117022004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = manager.ui.mainCamera.transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.shakeOldPos = var_14_0.localPosition
			end

			local var_14_2 = 0.6

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / 0.066
				local var_14_4, var_14_5 = math.modf(var_14_3)

				var_14_0.localPosition = Vector3.New(var_14_5 * 0.13, var_14_5 * 0.13, var_14_5 * 0.13) + arg_11_1.var_.shakeOldPos
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 then
				var_14_0.localPosition = arg_11_1.var_.shakeOldPos
			end

			local var_14_6 = arg_11_1.actors_["1033"]
			local var_14_7 = 0

			if var_14_7 < arg_11_1.time_ and arg_11_1.time_ <= var_14_7 + arg_14_0 then
				local var_14_8 = var_14_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_14_8 then
					arg_11_1.var_.alphaOldValue1033 = var_14_8.alpha
					arg_11_1.var_.characterEffect1033 = var_14_8
				end

				arg_11_1.var_.alphaOldValue1033 = 1
			end

			local var_14_9 = 0.333333333333333

			if var_14_7 <= arg_11_1.time_ and arg_11_1.time_ < var_14_7 + var_14_9 then
				local var_14_10 = (arg_11_1.time_ - var_14_7) / var_14_9
				local var_14_11 = Mathf.Lerp(arg_11_1.var_.alphaOldValue1033, 0, var_14_10)

				if arg_11_1.var_.characterEffect1033 then
					arg_11_1.var_.characterEffect1033.alpha = var_14_11
				end
			end

			if arg_11_1.time_ >= var_14_7 + var_14_9 and arg_11_1.time_ < var_14_7 + var_14_9 + arg_14_0 and arg_11_1.var_.characterEffect1033 then
				arg_11_1.var_.characterEffect1033.alpha = 0
			end

			local var_14_12 = 0

			if var_14_12 < arg_11_1.time_ and arg_11_1.time_ <= var_14_12 + arg_14_0 then
				arg_11_1.allBtn_.enabled = false
			end

			local var_14_13 = 0.6

			if arg_11_1.time_ >= var_14_12 + var_14_13 and arg_11_1.time_ < var_14_12 + var_14_13 + arg_14_0 then
				arg_11_1.allBtn_.enabled = true
			end

			local var_14_14 = 0.6
			local var_14_15 = 1

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 then
				local var_14_16 = "play"
				local var_14_17 = "effect"

				arg_11_1:AudioAction(var_14_16, var_14_17, "se_story_activity_1_5_3", "se_story_activity_1_5_3_fireworks04", "")
			end

			if arg_11_1.frameCnt_ <= 1 then
				arg_11_1.dialog_:SetActive(false)
			end

			local var_14_18 = 0.6
			local var_14_19 = 1.15

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0

				arg_11_1.dialog_:SetActive(true)

				local var_14_20 = LeanTween.value(arg_11_1.dialog_, 0, 1, 0.3)

				var_14_20:setOnUpdate(LuaHelper.FloatAction(function(arg_15_0)
					arg_11_1.dialogCg_.alpha = arg_15_0
				end))
				var_14_20:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_11_1.dialog_)
					var_14_20:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_11_1.duration_ = arg_11_1.duration_ + 0.3

				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_21 = arg_11_1:GetWordFromCfg(117022003)
				local var_14_22 = arg_11_1:FormatText(var_14_21.content)

				arg_11_1.text_.text = var_14_22

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_23 = 46
				local var_14_24 = utf8.len(var_14_22)
				local var_14_25 = var_14_23 <= 0 and var_14_19 or var_14_19 * (var_14_24 / var_14_23)

				if var_14_25 > 0 and var_14_19 < var_14_25 then
					arg_11_1.talkMaxDuration = var_14_25
					var_14_18 = var_14_18 + 0.3

					if var_14_25 + var_14_18 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_25 + var_14_18
					end
				end

				arg_11_1.text_.text = var_14_22
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_26 = var_14_18 + 0.3
			local var_14_27 = math.max(var_14_19, arg_11_1.talkMaxDuration)

			if var_14_26 <= arg_11_1.time_ and arg_11_1.time_ < var_14_26 + var_14_27 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_26) / var_14_27

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_26 + var_14_27 and arg_11_1.time_ < var_14_26 + var_14_27 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play117022004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 117022004
		arg_17_1.duration_ = 2.6

		local var_17_0 = {
			zh = 2.233,
			ja = 2.6
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
				arg_17_0:Play117022005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = arg_17_1.actors_["1033"]
			local var_20_1 = 0

			if var_20_1 < arg_17_1.time_ and arg_17_1.time_ <= var_20_1 + arg_20_0 then
				local var_20_2 = var_20_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_20_2 then
					arg_17_1.var_.alphaOldValue1033 = var_20_2.alpha
					arg_17_1.var_.characterEffect1033 = var_20_2
				end

				arg_17_1.var_.alphaOldValue1033 = 0
			end

			local var_20_3 = 0.333333333333333

			if var_20_1 <= arg_17_1.time_ and arg_17_1.time_ < var_20_1 + var_20_3 then
				local var_20_4 = (arg_17_1.time_ - var_20_1) / var_20_3
				local var_20_5 = Mathf.Lerp(arg_17_1.var_.alphaOldValue1033, 1, var_20_4)

				if arg_17_1.var_.characterEffect1033 then
					arg_17_1.var_.characterEffect1033.alpha = var_20_5
				end
			end

			if arg_17_1.time_ >= var_20_1 + var_20_3 and arg_17_1.time_ < var_20_1 + var_20_3 + arg_20_0 and arg_17_1.var_.characterEffect1033 then
				arg_17_1.var_.characterEffect1033.alpha = 1
			end

			local var_20_6 = arg_17_1.actors_["1033"].transform
			local var_20_7 = 0

			if var_20_7 < arg_17_1.time_ and arg_17_1.time_ <= var_20_7 + arg_20_0 then
				arg_17_1.var_.moveOldPos1033 = var_20_6.localPosition
				var_20_6.localScale = Vector3.New(1, 1, 1)

				arg_17_1:CheckSpriteTmpPos("1033", 3)

				local var_20_8 = var_20_6.childCount

				for iter_20_0 = 0, var_20_8 - 1 do
					local var_20_9 = var_20_6:GetChild(iter_20_0)

					if var_20_9.name == "split_6" or not string.find(var_20_9.name, "split") then
						var_20_9.gameObject:SetActive(true)
					else
						var_20_9.gameObject:SetActive(false)
					end
				end
			end

			local var_20_10 = 0.001

			if var_20_7 <= arg_17_1.time_ and arg_17_1.time_ < var_20_7 + var_20_10 then
				local var_20_11 = (arg_17_1.time_ - var_20_7) / var_20_10
				local var_20_12 = Vector3.New(0, -420, 0)

				var_20_6.localPosition = Vector3.Lerp(arg_17_1.var_.moveOldPos1033, var_20_12, var_20_11)
			end

			if arg_17_1.time_ >= var_20_7 + var_20_10 and arg_17_1.time_ < var_20_7 + var_20_10 + arg_20_0 then
				var_20_6.localPosition = Vector3.New(0, -420, 0)
			end

			local var_20_13 = arg_17_1.actors_["1033"]
			local var_20_14 = 0

			if var_20_14 < arg_17_1.time_ and arg_17_1.time_ <= var_20_14 + arg_20_0 and arg_17_1.var_.actorSpriteComps1033 == nil then
				arg_17_1.var_.actorSpriteComps1033 = var_20_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_20_15 = 0.2

			if var_20_14 <= arg_17_1.time_ and arg_17_1.time_ < var_20_14 + var_20_15 then
				local var_20_16 = (arg_17_1.time_ - var_20_14) / var_20_15

				if arg_17_1.var_.actorSpriteComps1033 then
					for iter_20_1, iter_20_2 in pairs(arg_17_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_20_2 then
							local var_20_17 = Mathf.Lerp(iter_20_2.color.r, 1, var_20_16)

							iter_20_2.color = Color.New(var_20_17, var_20_17, var_20_17)
						end
					end
				end
			end

			if arg_17_1.time_ >= var_20_14 + var_20_15 and arg_17_1.time_ < var_20_14 + var_20_15 + arg_20_0 and arg_17_1.var_.actorSpriteComps1033 then
				local var_20_18 = 1

				for iter_20_3, iter_20_4 in pairs(arg_17_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_20_4 then
						iter_20_4.color = Color.New(var_20_18, var_20_18, var_20_18)
					end
				end

				arg_17_1.var_.actorSpriteComps1033 = nil
			end

			local var_20_19 = 0
			local var_20_20 = 0.1

			if var_20_19 < arg_17_1.time_ and arg_17_1.time_ <= var_20_19 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_21 = arg_17_1:FormatText(StoryNameCfg[236].name)

				arg_17_1.leftNameTxt_.text = var_20_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_22 = arg_17_1:GetWordFromCfg(117022004)
				local var_20_23 = arg_17_1:FormatText(var_20_22.content)

				arg_17_1.text_.text = var_20_23

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_24 = 4
				local var_20_25 = utf8.len(var_20_23)
				local var_20_26 = var_20_24 <= 0 and var_20_20 or var_20_20 * (var_20_25 / var_20_24)

				if var_20_26 > 0 and var_20_20 < var_20_26 then
					arg_17_1.talkMaxDuration = var_20_26

					if var_20_26 + var_20_19 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_26 + var_20_19
					end
				end

				arg_17_1.text_.text = var_20_23
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117022", "117022004", "story_v_out_117022.awb") ~= 0 then
					local var_20_27 = manager.audio:GetVoiceLength("story_v_out_117022", "117022004", "story_v_out_117022.awb") / 1000

					if var_20_27 + var_20_19 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_27 + var_20_19
					end

					if var_20_22.prefab_name ~= "" and arg_17_1.actors_[var_20_22.prefab_name] ~= nil then
						local var_20_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_17_1.actors_[var_20_22.prefab_name].transform, "story_v_out_117022", "117022004", "story_v_out_117022.awb")

						arg_17_1:RecordAudio("117022004", var_20_28)
						arg_17_1:RecordAudio("117022004", var_20_28)
					else
						arg_17_1:AudioAction("play", "voice", "story_v_out_117022", "117022004", "story_v_out_117022.awb")
					end

					arg_17_1:RecordHistoryTalkVoice("story_v_out_117022", "117022004", "story_v_out_117022.awb")
				end

				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_29 = math.max(var_20_20, arg_17_1.talkMaxDuration)

			if var_20_19 <= arg_17_1.time_ and arg_17_1.time_ < var_20_19 + var_20_29 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_19) / var_20_29

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_19 + var_20_29 and arg_17_1.time_ < var_20_19 + var_20_29 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play117022005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 117022005
		arg_21_1.duration_ = 9

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play117022006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = "TI0102"

			if arg_21_1.bgs_[var_24_0] == nil then
				local var_24_1 = Object.Instantiate(arg_21_1.paintGo_)

				var_24_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_24_0)
				var_24_1.name = var_24_0
				var_24_1.transform.parent = arg_21_1.stage_.transform
				var_24_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_21_1.bgs_[var_24_0] = var_24_1
			end

			local var_24_2 = 2

			if var_24_2 < arg_21_1.time_ and arg_21_1.time_ <= var_24_2 + arg_24_0 then
				local var_24_3 = manager.ui.mainCamera.transform.localPosition
				local var_24_4 = Vector3.New(0, 0, 10) + Vector3.New(var_24_3.x, var_24_3.y, 0)
				local var_24_5 = arg_21_1.bgs_.TI0102

				var_24_5.transform.localPosition = var_24_4
				var_24_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_24_6 = var_24_5:GetComponent("SpriteRenderer")

				if var_24_6 and var_24_6.sprite then
					local var_24_7 = (var_24_5.transform.localPosition - var_24_3).z
					local var_24_8 = manager.ui.mainCameraCom_
					local var_24_9 = 2 * var_24_7 * Mathf.Tan(var_24_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_24_10 = var_24_9 * var_24_8.aspect
					local var_24_11 = var_24_6.sprite.bounds.size.x
					local var_24_12 = var_24_6.sprite.bounds.size.y
					local var_24_13 = var_24_10 / var_24_11
					local var_24_14 = var_24_9 / var_24_12
					local var_24_15 = var_24_14 < var_24_13 and var_24_13 or var_24_14

					var_24_5.transform.localScale = Vector3.New(var_24_15, var_24_15, 0)
				end

				for iter_24_0, iter_24_1 in pairs(arg_21_1.bgs_) do
					if iter_24_0 ~= "TI0102" then
						iter_24_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_24_16 = 0

			if var_24_16 < arg_21_1.time_ and arg_21_1.time_ <= var_24_16 + arg_24_0 then
				arg_21_1.mask_.enabled = true
				arg_21_1.mask_.raycastTarget = true

				arg_21_1:SetGaussion(false)
			end

			local var_24_17 = 2

			if var_24_16 <= arg_21_1.time_ and arg_21_1.time_ < var_24_16 + var_24_17 then
				local var_24_18 = (arg_21_1.time_ - var_24_16) / var_24_17
				local var_24_19 = Color.New(0, 0, 0)

				var_24_19.a = Mathf.Lerp(0, 1, var_24_18)
				arg_21_1.mask_.color = var_24_19
			end

			if arg_21_1.time_ >= var_24_16 + var_24_17 and arg_21_1.time_ < var_24_16 + var_24_17 + arg_24_0 then
				local var_24_20 = Color.New(0, 0, 0)

				var_24_20.a = 1
				arg_21_1.mask_.color = var_24_20
			end

			local var_24_21 = 2

			if var_24_21 < arg_21_1.time_ and arg_21_1.time_ <= var_24_21 + arg_24_0 then
				arg_21_1.mask_.enabled = true
				arg_21_1.mask_.raycastTarget = true

				arg_21_1:SetGaussion(false)
			end

			local var_24_22 = 2

			if var_24_21 <= arg_21_1.time_ and arg_21_1.time_ < var_24_21 + var_24_22 then
				local var_24_23 = (arg_21_1.time_ - var_24_21) / var_24_22
				local var_24_24 = Color.New(0, 0, 0)

				var_24_24.a = Mathf.Lerp(1, 0, var_24_23)
				arg_21_1.mask_.color = var_24_24
			end

			if arg_21_1.time_ >= var_24_21 + var_24_22 and arg_21_1.time_ < var_24_21 + var_24_22 + arg_24_0 then
				local var_24_25 = Color.New(0, 0, 0)
				local var_24_26 = 0

				arg_21_1.mask_.enabled = false
				var_24_25.a = var_24_26
				arg_21_1.mask_.color = var_24_25
			end

			local var_24_27 = arg_21_1.actors_["1033"]
			local var_24_28 = 1.98333333333333

			if var_24_28 < arg_21_1.time_ and arg_21_1.time_ <= var_24_28 + arg_24_0 then
				local var_24_29 = var_24_27:GetComponentInChildren(typeof(CanvasGroup))

				if var_24_29 then
					arg_21_1.var_.alphaOldValue1033 = var_24_29.alpha
					arg_21_1.var_.characterEffect1033 = var_24_29
				end

				arg_21_1.var_.alphaOldValue1033 = 1
			end

			local var_24_30 = 0.0166666666666667

			if var_24_28 <= arg_21_1.time_ and arg_21_1.time_ < var_24_28 + var_24_30 then
				local var_24_31 = (arg_21_1.time_ - var_24_28) / var_24_30
				local var_24_32 = Mathf.Lerp(arg_21_1.var_.alphaOldValue1033, 0, var_24_31)

				if arg_21_1.var_.characterEffect1033 then
					arg_21_1.var_.characterEffect1033.alpha = var_24_32
				end
			end

			if arg_21_1.time_ >= var_24_28 + var_24_30 and arg_21_1.time_ < var_24_28 + var_24_30 + arg_24_0 and arg_21_1.var_.characterEffect1033 then
				arg_21_1.var_.characterEffect1033.alpha = 0
			end

			local var_24_33 = arg_21_1.bgs_.TI0102.transform
			local var_24_34 = 2

			if var_24_34 < arg_21_1.time_ and arg_21_1.time_ <= var_24_34 + arg_24_0 then
				arg_21_1.var_.moveOldPosTI0102 = var_24_33.localPosition
			end

			local var_24_35 = 0.001

			if var_24_34 <= arg_21_1.time_ and arg_21_1.time_ < var_24_34 + var_24_35 then
				local var_24_36 = (arg_21_1.time_ - var_24_34) / var_24_35
				local var_24_37 = Vector3.New(-0.5, -1, 1)

				var_24_33.localPosition = Vector3.Lerp(arg_21_1.var_.moveOldPosTI0102, var_24_37, var_24_36)
			end

			if arg_21_1.time_ >= var_24_34 + var_24_35 and arg_21_1.time_ < var_24_34 + var_24_35 + arg_24_0 then
				var_24_33.localPosition = Vector3.New(-0.5, -1, 1)
			end

			local var_24_38 = arg_21_1.bgs_.TI0102.transform
			local var_24_39 = 2.034

			if var_24_39 < arg_21_1.time_ and arg_21_1.time_ <= var_24_39 + arg_24_0 then
				arg_21_1.var_.moveOldPosTI0102 = var_24_38.localPosition
			end

			local var_24_40 = 2.73333333333333

			if var_24_39 <= arg_21_1.time_ and arg_21_1.time_ < var_24_39 + var_24_40 then
				local var_24_41 = (arg_21_1.time_ - var_24_39) / var_24_40
				local var_24_42 = Vector3.New(-0.5, -0.5, 1)

				var_24_38.localPosition = Vector3.Lerp(arg_21_1.var_.moveOldPosTI0102, var_24_42, var_24_41)
			end

			if arg_21_1.time_ >= var_24_39 + var_24_40 and arg_21_1.time_ < var_24_39 + var_24_40 + arg_24_0 then
				var_24_38.localPosition = Vector3.New(-0.5, -0.5, 1)
			end

			if arg_21_1.frameCnt_ <= 1 then
				arg_21_1.dialog_:SetActive(false)
			end

			local var_24_43 = 4
			local var_24_44 = 1.075

			if var_24_43 < arg_21_1.time_ and arg_21_1.time_ <= var_24_43 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0

				arg_21_1.dialog_:SetActive(true)

				local var_24_45 = LeanTween.value(arg_21_1.dialog_, 0, 1, 0.3)

				var_24_45:setOnUpdate(LuaHelper.FloatAction(function(arg_25_0)
					arg_21_1.dialogCg_.alpha = arg_25_0
				end))
				var_24_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_21_1.dialog_)
					var_24_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_21_1.duration_ = arg_21_1.duration_ + 0.3

				SetActive(arg_21_1.leftNameGo_, false)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_46 = arg_21_1:GetWordFromCfg(117022005)
				local var_24_47 = arg_21_1:FormatText(var_24_46.content)

				arg_21_1.text_.text = var_24_47

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_48 = 43
				local var_24_49 = utf8.len(var_24_47)
				local var_24_50 = var_24_48 <= 0 and var_24_44 or var_24_44 * (var_24_49 / var_24_48)

				if var_24_50 > 0 and var_24_44 < var_24_50 then
					arg_21_1.talkMaxDuration = var_24_50
					var_24_43 = var_24_43 + 0.3

					if var_24_50 + var_24_43 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_50 + var_24_43
					end
				end

				arg_21_1.text_.text = var_24_47
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)
				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_51 = var_24_43 + 0.3
			local var_24_52 = math.max(var_24_44, arg_21_1.talkMaxDuration)

			if var_24_51 <= arg_21_1.time_ and arg_21_1.time_ < var_24_51 + var_24_52 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_51) / var_24_52

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_51 + var_24_52 and arg_21_1.time_ < var_24_51 + var_24_52 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play117022006 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 117022006
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play117022007(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.8

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_2 = arg_27_1:GetWordFromCfg(117022006)
				local var_30_3 = arg_27_1:FormatText(var_30_2.content)

				arg_27_1.text_.text = var_30_3

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_4 = 32
				local var_30_5 = utf8.len(var_30_3)
				local var_30_6 = var_30_4 <= 0 and var_30_1 or var_30_1 * (var_30_5 / var_30_4)

				if var_30_6 > 0 and var_30_1 < var_30_6 then
					arg_27_1.talkMaxDuration = var_30_6

					if var_30_6 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_6 + var_30_0
					end
				end

				arg_27_1.text_.text = var_30_3
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_7 = math.max(var_30_1, arg_27_1.talkMaxDuration)

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_7 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_0) / var_30_7

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_0 + var_30_7 and arg_27_1.time_ < var_30_0 + var_30_7 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play117022007 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 117022007
		arg_31_1.duration_ = 7

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play117022008(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				local var_34_1 = manager.ui.mainCamera.transform.localPosition
				local var_34_2 = Vector3.New(0, 0, 10) + Vector3.New(var_34_1.x, var_34_1.y, 0)
				local var_34_3 = arg_31_1.bgs_.TI0102

				var_34_3.transform.localPosition = var_34_2
				var_34_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_34_4 = var_34_3:GetComponent("SpriteRenderer")

				if var_34_4 and var_34_4.sprite then
					local var_34_5 = (var_34_3.transform.localPosition - var_34_1).z
					local var_34_6 = manager.ui.mainCameraCom_
					local var_34_7 = 2 * var_34_5 * Mathf.Tan(var_34_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_34_8 = var_34_7 * var_34_6.aspect
					local var_34_9 = var_34_4.sprite.bounds.size.x
					local var_34_10 = var_34_4.sprite.bounds.size.y
					local var_34_11 = var_34_8 / var_34_9
					local var_34_12 = var_34_7 / var_34_10
					local var_34_13 = var_34_12 < var_34_11 and var_34_11 or var_34_12

					var_34_3.transform.localScale = Vector3.New(var_34_13, var_34_13, 0)
				end

				for iter_34_0, iter_34_1 in pairs(arg_31_1.bgs_) do
					if iter_34_0 ~= "TI0102" then
						iter_34_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1.mask_.enabled = true
				arg_31_1.mask_.raycastTarget = true

				arg_31_1:SetGaussion(false)
			end

			local var_34_15 = 2

			if var_34_14 <= arg_31_1.time_ and arg_31_1.time_ < var_34_14 + var_34_15 then
				local var_34_16 = (arg_31_1.time_ - var_34_14) / var_34_15
				local var_34_17 = Color.New(1, 1, 1)

				var_34_17.a = Mathf.Lerp(1, 0, var_34_16)
				arg_31_1.mask_.color = var_34_17
			end

			if arg_31_1.time_ >= var_34_14 + var_34_15 and arg_31_1.time_ < var_34_14 + var_34_15 + arg_34_0 then
				local var_34_18 = Color.New(1, 1, 1)
				local var_34_19 = 0

				arg_31_1.mask_.enabled = false
				var_34_18.a = var_34_19
				arg_31_1.mask_.color = var_34_18
			end

			if arg_31_1.frameCnt_ <= 1 then
				arg_31_1.dialog_:SetActive(false)
			end

			local var_34_20 = 2
			local var_34_21 = 1.075

			if var_34_20 < arg_31_1.time_ and arg_31_1.time_ <= var_34_20 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0

				arg_31_1.dialog_:SetActive(true)

				local var_34_22 = LeanTween.value(arg_31_1.dialog_, 0, 1, 0.3)

				var_34_22:setOnUpdate(LuaHelper.FloatAction(function(arg_35_0)
					arg_31_1.dialogCg_.alpha = arg_35_0
				end))
				var_34_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_31_1.dialog_)
					var_34_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_31_1.duration_ = arg_31_1.duration_ + 0.3

				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_23 = arg_31_1:GetWordFromCfg(117022007)
				local var_34_24 = arg_31_1:FormatText(var_34_23.content)

				arg_31_1.text_.text = var_34_24

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_25 = 43
				local var_34_26 = utf8.len(var_34_24)
				local var_34_27 = var_34_25 <= 0 and var_34_21 or var_34_21 * (var_34_26 / var_34_25)

				if var_34_27 > 0 and var_34_21 < var_34_27 then
					arg_31_1.talkMaxDuration = var_34_27
					var_34_20 = var_34_20 + 0.3

					if var_34_27 + var_34_20 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_27 + var_34_20
					end
				end

				arg_31_1.text_.text = var_34_24
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_28 = var_34_20 + 0.3
			local var_34_29 = math.max(var_34_21, arg_31_1.talkMaxDuration)

			if var_34_28 <= arg_31_1.time_ and arg_31_1.time_ < var_34_28 + var_34_29 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_28) / var_34_29

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_28 + var_34_29 and arg_31_1.time_ < var_34_28 + var_34_29 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play117022008 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 117022008
		arg_37_1.duration_ = 2.9

		local var_37_0 = {
			zh = 2,
			ja = 2.9
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
			arg_37_1.auto_ = false
		end

		function arg_37_1.playNext_(arg_39_0)
			arg_37_1.onStoryFinished_()
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = 0
			local var_40_1 = 0.175

			if var_40_0 < arg_37_1.time_ and arg_37_1.time_ <= var_40_0 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_2 = arg_37_1:FormatText(StoryNameCfg[236].name)

				arg_37_1.leftNameTxt_.text = var_40_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, true)
				arg_37_1.iconController_:SetSelectedState("hero")

				arg_37_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1033")

				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_3 = arg_37_1:GetWordFromCfg(117022008)
				local var_40_4 = arg_37_1:FormatText(var_40_3.content)

				arg_37_1.text_.text = var_40_4

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_5 = 7
				local var_40_6 = utf8.len(var_40_4)
				local var_40_7 = var_40_5 <= 0 and var_40_1 or var_40_1 * (var_40_6 / var_40_5)

				if var_40_7 > 0 and var_40_1 < var_40_7 then
					arg_37_1.talkMaxDuration = var_40_7

					if var_40_7 + var_40_0 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_7 + var_40_0
					end
				end

				arg_37_1.text_.text = var_40_4
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117022", "117022008", "story_v_out_117022.awb") ~= 0 then
					local var_40_8 = manager.audio:GetVoiceLength("story_v_out_117022", "117022008", "story_v_out_117022.awb") / 1000

					if var_40_8 + var_40_0 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_8 + var_40_0
					end

					if var_40_3.prefab_name ~= "" and arg_37_1.actors_[var_40_3.prefab_name] ~= nil then
						local var_40_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_3.prefab_name].transform, "story_v_out_117022", "117022008", "story_v_out_117022.awb")

						arg_37_1:RecordAudio("117022008", var_40_9)
						arg_37_1:RecordAudio("117022008", var_40_9)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_117022", "117022008", "story_v_out_117022.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_117022", "117022008", "story_v_out_117022.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_10 = math.max(var_40_1, arg_37_1.talkMaxDuration)

			if var_40_0 <= arg_37_1.time_ and arg_37_1.time_ < var_40_0 + var_40_10 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_0) / var_40_10

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_0 + var_40_10 and arg_37_1.time_ < var_40_0 + var_40_10 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I08a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/TI0102"
	},
	voices = {
		"story_v_out_117022.awb"
	}
}
