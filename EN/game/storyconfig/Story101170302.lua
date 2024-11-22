return {
	Play117032001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 117032001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play117032002(arg_1_1)
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
			local var_4_23 = 0.5

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "", "", "")
			end

			local var_4_26 = 2.03333333333333
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_1_7_story_firehouse", "bgm_activity_1_7_story_firehouse", "bgm_activity_1_7_story_firehouse.awb")
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

				local var_4_33 = arg_1_1:GetWordFromCfg(117032001)
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
	Play117032002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 117032002
		arg_7_1.duration_ = 6.733

		local var_7_0 = {
			zh = 3.366,
			ja = 6.733
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
				arg_7_0:Play117032003(arg_7_1)
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

				arg_7_1:CheckSpriteTmpPos("1033", 4)

				local var_10_4 = var_10_2.childCount

				for iter_10_0 = 0, var_10_4 - 1 do
					local var_10_5 = var_10_2:GetChild(iter_10_0)

					if var_10_5.name == "split_6" or not string.find(var_10_5.name, "split") then
						var_10_5.gameObject:SetActive(true)
					else
						var_10_5.gameObject:SetActive(false)
					end
				end
			end

			local var_10_6 = 0.001

			if var_10_3 <= arg_7_1.time_ and arg_7_1.time_ < var_10_3 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_3) / var_10_6
				local var_10_8 = Vector3.New(390, -420, 0)

				var_10_2.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1033, var_10_8, var_10_7)
			end

			if arg_7_1.time_ >= var_10_3 + var_10_6 and arg_7_1.time_ < var_10_3 + var_10_6 + arg_10_0 then
				var_10_2.localPosition = Vector3.New(390, -420, 0)
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

			local var_10_12 = 0.333333333333333

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
			local var_10_16 = 0.325

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

				local var_10_18 = arg_7_1:GetWordFromCfg(117032002)
				local var_10_19 = arg_7_1:FormatText(var_10_18.content)

				arg_7_1.text_.text = var_10_19

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_20 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032002", "story_v_out_117032.awb") ~= 0 then
					local var_10_23 = manager.audio:GetVoiceLength("story_v_out_117032", "117032002", "story_v_out_117032.awb") / 1000

					if var_10_23 + var_10_15 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_23 + var_10_15
					end

					if var_10_18.prefab_name ~= "" and arg_7_1.actors_[var_10_18.prefab_name] ~= nil then
						local var_10_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_18.prefab_name].transform, "story_v_out_117032", "117032002", "story_v_out_117032.awb")

						arg_7_1:RecordAudio("117032002", var_10_24)
						arg_7_1:RecordAudio("117032002", var_10_24)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_117032", "117032002", "story_v_out_117032.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_117032", "117032002", "story_v_out_117032.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_25 = math.max(var_10_16, arg_7_1.talkMaxDuration)

			if var_10_15 <= arg_7_1.time_ and arg_7_1.time_ < var_10_15 + var_10_25 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_15) / var_10_25

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_15 + var_10_25 and arg_7_1.time_ < var_10_15 + var_10_25 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play117032003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 117032003
		arg_11_1.duration_ = 1.733

		local var_11_0 = {
			zh = 1.733,
			ja = 1.166
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
				arg_11_0:Play117032004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1132"

			if arg_11_1.actors_[var_14_0] == nil then
				local var_14_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_14_0), arg_11_1.canvasGo_.transform)

				var_14_1.transform:SetSiblingIndex(1)

				var_14_1.name = var_14_0
				var_14_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_11_1.actors_[var_14_0] = var_14_1
			end

			local var_14_2 = arg_11_1.actors_["1132"].transform
			local var_14_3 = 0

			if var_14_3 < arg_11_1.time_ and arg_11_1.time_ <= var_14_3 + arg_14_0 then
				arg_11_1.var_.moveOldPos1132 = var_14_2.localPosition
				var_14_2.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("1132", 2)

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
				local var_14_8 = Vector3.New(-390, -413, -185)

				var_14_2.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1132, var_14_8, var_14_7)
			end

			if arg_11_1.time_ >= var_14_3 + var_14_6 and arg_11_1.time_ < var_14_3 + var_14_6 + arg_14_0 then
				var_14_2.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_14_9 = arg_11_1.actors_["1132"]
			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 then
				local var_14_11 = var_14_9:GetComponentInChildren(typeof(CanvasGroup))

				if var_14_11 then
					arg_11_1.var_.alphaOldValue1132 = var_14_11.alpha
					arg_11_1.var_.characterEffect1132 = var_14_11
				end

				arg_11_1.var_.alphaOldValue1132 = 0
			end

			local var_14_12 = 0.333333333333333

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_12 then
				local var_14_13 = (arg_11_1.time_ - var_14_10) / var_14_12
				local var_14_14 = Mathf.Lerp(arg_11_1.var_.alphaOldValue1132, 1, var_14_13)

				if arg_11_1.var_.characterEffect1132 then
					arg_11_1.var_.characterEffect1132.alpha = var_14_14
				end
			end

			if arg_11_1.time_ >= var_14_10 + var_14_12 and arg_11_1.time_ < var_14_10 + var_14_12 + arg_14_0 and arg_11_1.var_.characterEffect1132 then
				arg_11_1.var_.characterEffect1132.alpha = 1
			end

			local var_14_15 = arg_11_1.actors_["1132"]
			local var_14_16 = 0

			if var_14_16 < arg_11_1.time_ and arg_11_1.time_ <= var_14_16 + arg_14_0 and arg_11_1.var_.actorSpriteComps1132 == nil then
				arg_11_1.var_.actorSpriteComps1132 = var_14_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_17 = 0.2

			if var_14_16 <= arg_11_1.time_ and arg_11_1.time_ < var_14_16 + var_14_17 then
				local var_14_18 = (arg_11_1.time_ - var_14_16) / var_14_17

				if arg_11_1.var_.actorSpriteComps1132 then
					for iter_14_1, iter_14_2 in pairs(arg_11_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_14_2 then
							local var_14_19 = Mathf.Lerp(iter_14_2.color.r, 1, var_14_18)

							iter_14_2.color = Color.New(var_14_19, var_14_19, var_14_19)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_16 + var_14_17 and arg_11_1.time_ < var_14_16 + var_14_17 + arg_14_0 and arg_11_1.var_.actorSpriteComps1132 then
				local var_14_20 = 1

				for iter_14_3, iter_14_4 in pairs(arg_11_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_14_4 then
						iter_14_4.color = Color.New(var_14_20, var_14_20, var_14_20)
					end
				end

				arg_11_1.var_.actorSpriteComps1132 = nil
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

			local var_14_27 = 0
			local var_14_28 = 0.125

			if var_14_27 < arg_11_1.time_ and arg_11_1.time_ <= var_14_27 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_29 = arg_11_1:FormatText(StoryNameCfg[61].name)

				arg_11_1.leftNameTxt_.text = var_14_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_30 = arg_11_1:GetWordFromCfg(117032003)
				local var_14_31 = arg_11_1:FormatText(var_14_30.content)

				arg_11_1.text_.text = var_14_31

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_32 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032003", "story_v_out_117032.awb") ~= 0 then
					local var_14_35 = manager.audio:GetVoiceLength("story_v_out_117032", "117032003", "story_v_out_117032.awb") / 1000

					if var_14_35 + var_14_27 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_35 + var_14_27
					end

					if var_14_30.prefab_name ~= "" and arg_11_1.actors_[var_14_30.prefab_name] ~= nil then
						local var_14_36 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_30.prefab_name].transform, "story_v_out_117032", "117032003", "story_v_out_117032.awb")

						arg_11_1:RecordAudio("117032003", var_14_36)
						arg_11_1:RecordAudio("117032003", var_14_36)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_117032", "117032003", "story_v_out_117032.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_117032", "117032003", "story_v_out_117032.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_37 = math.max(var_14_28, arg_11_1.talkMaxDuration)

			if var_14_27 <= arg_11_1.time_ and arg_11_1.time_ < var_14_27 + var_14_37 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_27) / var_14_37

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_27 + var_14_37 and arg_11_1.time_ < var_14_27 + var_14_37 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play117032004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 117032004
		arg_15_1.duration_ = 9.666

		local var_15_0 = {
			zh = 6.366,
			ja = 9.666
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
				arg_15_0:Play117032005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1132"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.actorSpriteComps1132 == nil then
				arg_15_1.var_.actorSpriteComps1132 = var_18_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_2 = 0.2

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.actorSpriteComps1132 then
					for iter_18_0, iter_18_1 in pairs(arg_15_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_18_1 then
							local var_18_4 = Mathf.Lerp(iter_18_1.color.r, 0.5, var_18_3)

							iter_18_1.color = Color.New(var_18_4, var_18_4, var_18_4)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.actorSpriteComps1132 then
				local var_18_5 = 0.5

				for iter_18_2, iter_18_3 in pairs(arg_15_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_18_3 then
						iter_18_3.color = Color.New(var_18_5, var_18_5, var_18_5)
					end
				end

				arg_15_1.var_.actorSpriteComps1132 = nil
			end

			local var_18_6 = arg_15_1.actors_["1033"]
			local var_18_7 = 0

			if var_18_7 < arg_15_1.time_ and arg_15_1.time_ <= var_18_7 + arg_18_0 and arg_15_1.var_.actorSpriteComps1033 == nil then
				arg_15_1.var_.actorSpriteComps1033 = var_18_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_8 = 0.2

			if var_18_7 <= arg_15_1.time_ and arg_15_1.time_ < var_18_7 + var_18_8 then
				local var_18_9 = (arg_15_1.time_ - var_18_7) / var_18_8

				if arg_15_1.var_.actorSpriteComps1033 then
					for iter_18_4, iter_18_5 in pairs(arg_15_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_18_5 then
							local var_18_10 = Mathf.Lerp(iter_18_5.color.r, 1, var_18_9)

							iter_18_5.color = Color.New(var_18_10, var_18_10, var_18_10)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_7 + var_18_8 and arg_15_1.time_ < var_18_7 + var_18_8 + arg_18_0 and arg_15_1.var_.actorSpriteComps1033 then
				local var_18_11 = 1

				for iter_18_6, iter_18_7 in pairs(arg_15_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_18_7 then
						iter_18_7.color = Color.New(var_18_11, var_18_11, var_18_11)
					end
				end

				arg_15_1.var_.actorSpriteComps1033 = nil
			end

			local var_18_12 = 0
			local var_18_13 = 0.65

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

				local var_18_15 = arg_15_1:GetWordFromCfg(117032004)
				local var_18_16 = arg_15_1:FormatText(var_18_15.content)

				arg_15_1.text_.text = var_18_16

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_17 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032004", "story_v_out_117032.awb") ~= 0 then
					local var_18_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032004", "story_v_out_117032.awb") / 1000

					if var_18_20 + var_18_12 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_20 + var_18_12
					end

					if var_18_15.prefab_name ~= "" and arg_15_1.actors_[var_18_15.prefab_name] ~= nil then
						local var_18_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_15.prefab_name].transform, "story_v_out_117032", "117032004", "story_v_out_117032.awb")

						arg_15_1:RecordAudio("117032004", var_18_21)
						arg_15_1:RecordAudio("117032004", var_18_21)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_117032", "117032004", "story_v_out_117032.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_117032", "117032004", "story_v_out_117032.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_22 = math.max(var_18_13, arg_15_1.talkMaxDuration)

			if var_18_12 <= arg_15_1.time_ and arg_15_1.time_ < var_18_12 + var_18_22 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_12) / var_18_22

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_12 + var_18_22 and arg_15_1.time_ < var_18_12 + var_18_22 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play117032005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 117032005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play117032006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1033"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.actorSpriteComps1033 == nil then
				arg_19_1.var_.actorSpriteComps1033 = var_22_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_2 = 0.2

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.actorSpriteComps1033 then
					for iter_22_0, iter_22_1 in pairs(arg_19_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_22_1 then
							local var_22_4 = Mathf.Lerp(iter_22_1.color.r, 0.5, var_22_3)

							iter_22_1.color = Color.New(var_22_4, var_22_4, var_22_4)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.actorSpriteComps1033 then
				local var_22_5 = 0.5

				for iter_22_2, iter_22_3 in pairs(arg_19_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_22_3 then
						iter_22_3.color = Color.New(var_22_5, var_22_5, var_22_5)
					end
				end

				arg_19_1.var_.actorSpriteComps1033 = nil
			end

			local var_22_6 = 0
			local var_22_7 = 0.775

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_8 = arg_19_1:GetWordFromCfg(117032005)
				local var_22_9 = arg_19_1:FormatText(var_22_8.content)

				arg_19_1.text_.text = var_22_9

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_10 = 31
				local var_22_11 = utf8.len(var_22_9)
				local var_22_12 = var_22_10 <= 0 and var_22_7 or var_22_7 * (var_22_11 / var_22_10)

				if var_22_12 > 0 and var_22_7 < var_22_12 then
					arg_19_1.talkMaxDuration = var_22_12

					if var_22_12 + var_22_6 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_12 + var_22_6
					end
				end

				arg_19_1.text_.text = var_22_9
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_13 = math.max(var_22_7, arg_19_1.talkMaxDuration)

			if var_22_6 <= arg_19_1.time_ and arg_19_1.time_ < var_22_6 + var_22_13 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_6) / var_22_13

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_6 + var_22_13 and arg_19_1.time_ < var_22_6 + var_22_13 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play117032006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 117032006
		arg_23_1.duration_ = 7.566

		local var_23_0 = {
			zh = 6.633,
			ja = 7.566
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
				arg_23_0:Play117032007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1132"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.actorSpriteComps1132 == nil then
				arg_23_1.var_.actorSpriteComps1132 = var_26_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_2 = 0.2

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.actorSpriteComps1132 then
					for iter_26_0, iter_26_1 in pairs(arg_23_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_26_1 then
							local var_26_4 = Mathf.Lerp(iter_26_1.color.r, 1, var_26_3)

							iter_26_1.color = Color.New(var_26_4, var_26_4, var_26_4)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.actorSpriteComps1132 then
				local var_26_5 = 1

				for iter_26_2, iter_26_3 in pairs(arg_23_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_26_3 then
						iter_26_3.color = Color.New(var_26_5, var_26_5, var_26_5)
					end
				end

				arg_23_1.var_.actorSpriteComps1132 = nil
			end

			local var_26_6 = 0
			local var_26_7 = 0.6

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_8 = arg_23_1:FormatText(StoryNameCfg[61].name)

				arg_23_1.leftNameTxt_.text = var_26_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_9 = arg_23_1:GetWordFromCfg(117032006)
				local var_26_10 = arg_23_1:FormatText(var_26_9.content)

				arg_23_1.text_.text = var_26_10

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_11 = 24
				local var_26_12 = utf8.len(var_26_10)
				local var_26_13 = var_26_11 <= 0 and var_26_7 or var_26_7 * (var_26_12 / var_26_11)

				if var_26_13 > 0 and var_26_7 < var_26_13 then
					arg_23_1.talkMaxDuration = var_26_13

					if var_26_13 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_13 + var_26_6
					end
				end

				arg_23_1.text_.text = var_26_10
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032006", "story_v_out_117032.awb") ~= 0 then
					local var_26_14 = manager.audio:GetVoiceLength("story_v_out_117032", "117032006", "story_v_out_117032.awb") / 1000

					if var_26_14 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_14 + var_26_6
					end

					if var_26_9.prefab_name ~= "" and arg_23_1.actors_[var_26_9.prefab_name] ~= nil then
						local var_26_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_9.prefab_name].transform, "story_v_out_117032", "117032006", "story_v_out_117032.awb")

						arg_23_1:RecordAudio("117032006", var_26_15)
						arg_23_1:RecordAudio("117032006", var_26_15)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_117032", "117032006", "story_v_out_117032.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_117032", "117032006", "story_v_out_117032.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_16 = math.max(var_26_7, arg_23_1.talkMaxDuration)

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_16 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_6) / var_26_16

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_6 + var_26_16 and arg_23_1.time_ < var_26_6 + var_26_16 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play117032007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 117032007
		arg_27_1.duration_ = 10.166

		local var_27_0 = {
			zh = 8.733,
			ja = 10.166
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
				arg_27_0:Play117032008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.75

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_2 = arg_27_1:FormatText(StoryNameCfg[61].name)

				arg_27_1.leftNameTxt_.text = var_30_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_3 = arg_27_1:GetWordFromCfg(117032007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 30
				local var_30_6 = utf8.len(var_30_4)
				local var_30_7 = var_30_5 <= 0 and var_30_1 or var_30_1 * (var_30_6 / var_30_5)

				if var_30_7 > 0 and var_30_1 < var_30_7 then
					arg_27_1.talkMaxDuration = var_30_7

					if var_30_7 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_7 + var_30_0
					end
				end

				arg_27_1.text_.text = var_30_4
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032007", "story_v_out_117032.awb") ~= 0 then
					local var_30_8 = manager.audio:GetVoiceLength("story_v_out_117032", "117032007", "story_v_out_117032.awb") / 1000

					if var_30_8 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_8 + var_30_0
					end

					if var_30_3.prefab_name ~= "" and arg_27_1.actors_[var_30_3.prefab_name] ~= nil then
						local var_30_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_3.prefab_name].transform, "story_v_out_117032", "117032007", "story_v_out_117032.awb")

						arg_27_1:RecordAudio("117032007", var_30_9)
						arg_27_1:RecordAudio("117032007", var_30_9)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_117032", "117032007", "story_v_out_117032.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_117032", "117032007", "story_v_out_117032.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_10 = math.max(var_30_1, arg_27_1.talkMaxDuration)

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_10 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_0) / var_30_10

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_0 + var_30_10 and arg_27_1.time_ < var_30_0 + var_30_10 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play117032008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 117032008
		arg_31_1.duration_ = 9.033333

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play117032009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.mask_.enabled = true
				arg_31_1.mask_.raycastTarget = true

				arg_31_1:SetGaussion(false)
			end

			local var_34_1 = 2

			if var_34_0 <= arg_31_1.time_ and arg_31_1.time_ < var_34_0 + var_34_1 then
				local var_34_2 = (arg_31_1.time_ - var_34_0) / var_34_1
				local var_34_3 = Color.New(0, 0, 0)

				var_34_3.a = Mathf.Lerp(0, 1, var_34_2)
				arg_31_1.mask_.color = var_34_3
			end

			if arg_31_1.time_ >= var_34_0 + var_34_1 and arg_31_1.time_ < var_34_0 + var_34_1 + arg_34_0 then
				local var_34_4 = Color.New(0, 0, 0)

				var_34_4.a = 1
				arg_31_1.mask_.color = var_34_4
			end

			local var_34_5 = 2

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 then
				arg_31_1.mask_.enabled = true
				arg_31_1.mask_.raycastTarget = true

				arg_31_1:SetGaussion(false)
			end

			local var_34_6 = 2.033333

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6
				local var_34_8 = Color.New(0, 0, 0)

				var_34_8.a = Mathf.Lerp(1, 0, var_34_7)
				arg_31_1.mask_.color = var_34_8
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 then
				local var_34_9 = Color.New(0, 0, 0)
				local var_34_10 = 0

				arg_31_1.mask_.enabled = false
				var_34_9.a = var_34_10
				arg_31_1.mask_.color = var_34_9
			end

			local var_34_11 = arg_31_1.actors_["1132"]
			local var_34_12 = 0

			if var_34_12 < arg_31_1.time_ and arg_31_1.time_ <= var_34_12 + arg_34_0 and arg_31_1.var_.actorSpriteComps1132 == nil then
				arg_31_1.var_.actorSpriteComps1132 = var_34_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_13 = 0.2

			if var_34_12 <= arg_31_1.time_ and arg_31_1.time_ < var_34_12 + var_34_13 then
				local var_34_14 = (arg_31_1.time_ - var_34_12) / var_34_13

				if arg_31_1.var_.actorSpriteComps1132 then
					for iter_34_0, iter_34_1 in pairs(arg_31_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_34_1 then
							local var_34_15 = Mathf.Lerp(iter_34_1.color.r, 0.5, var_34_14)

							iter_34_1.color = Color.New(var_34_15, var_34_15, var_34_15)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_12 + var_34_13 and arg_31_1.time_ < var_34_12 + var_34_13 + arg_34_0 and arg_31_1.var_.actorSpriteComps1132 then
				local var_34_16 = 0.5

				for iter_34_2, iter_34_3 in pairs(arg_31_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_34_3 then
						iter_34_3.color = Color.New(var_34_16, var_34_16, var_34_16)
					end
				end

				arg_31_1.var_.actorSpriteComps1132 = nil
			end

			if arg_31_1.frameCnt_ <= 1 then
				arg_31_1.dialog_:SetActive(false)
			end

			local var_34_17 = 4.033333
			local var_34_18 = 0.575

			if var_34_17 < arg_31_1.time_ and arg_31_1.time_ <= var_34_17 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0

				arg_31_1.dialog_:SetActive(true)

				local var_34_19 = LeanTween.value(arg_31_1.dialog_, 0, 1, 0.3)

				var_34_19:setOnUpdate(LuaHelper.FloatAction(function(arg_35_0)
					arg_31_1.dialogCg_.alpha = arg_35_0
				end))
				var_34_19:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_31_1.dialog_)
					var_34_19:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_31_1.duration_ = arg_31_1.duration_ + 0.3

				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_20 = arg_31_1:GetWordFromCfg(117032008)
				local var_34_21 = arg_31_1:FormatText(var_34_20.content)

				arg_31_1.text_.text = var_34_21

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_22 = 23
				local var_34_23 = utf8.len(var_34_21)
				local var_34_24 = var_34_22 <= 0 and var_34_18 or var_34_18 * (var_34_23 / var_34_22)

				if var_34_24 > 0 and var_34_18 < var_34_24 then
					arg_31_1.talkMaxDuration = var_34_24
					var_34_17 = var_34_17 + 0.3

					if var_34_24 + var_34_17 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_24 + var_34_17
					end
				end

				arg_31_1.text_.text = var_34_21
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_25 = var_34_17 + 0.3
			local var_34_26 = math.max(var_34_18, arg_31_1.talkMaxDuration)

			if var_34_25 <= arg_31_1.time_ and arg_31_1.time_ < var_34_25 + var_34_26 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_25) / var_34_26

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_25 + var_34_26 and arg_31_1.time_ < var_34_25 + var_34_26 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play117032009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 117032009
		arg_37_1.duration_ = 7.166

		local var_37_0 = {
			zh = 5,
			ja = 7.166
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
				arg_37_0:Play117032010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1033"]
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 and arg_37_1.var_.actorSpriteComps1033 == nil then
				arg_37_1.var_.actorSpriteComps1033 = var_40_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_40_2 = 0.2

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2

				if arg_37_1.var_.actorSpriteComps1033 then
					for iter_40_0, iter_40_1 in pairs(arg_37_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_40_1 then
							local var_40_4 = Mathf.Lerp(iter_40_1.color.r, 1, var_40_3)

							iter_40_1.color = Color.New(var_40_4, var_40_4, var_40_4)
						end
					end
				end
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 and arg_37_1.var_.actorSpriteComps1033 then
				local var_40_5 = 1

				for iter_40_2, iter_40_3 in pairs(arg_37_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_40_3 then
						iter_40_3.color = Color.New(var_40_5, var_40_5, var_40_5)
					end
				end

				arg_37_1.var_.actorSpriteComps1033 = nil
			end

			local var_40_6 = 0
			local var_40_7 = 0.7

			if var_40_6 < arg_37_1.time_ and arg_37_1.time_ <= var_40_6 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_8 = arg_37_1:FormatText(StoryNameCfg[236].name)

				arg_37_1.leftNameTxt_.text = var_40_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_9 = arg_37_1:GetWordFromCfg(117032009)
				local var_40_10 = arg_37_1:FormatText(var_40_9.content)

				arg_37_1.text_.text = var_40_10

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_11 = 28
				local var_40_12 = utf8.len(var_40_10)
				local var_40_13 = var_40_11 <= 0 and var_40_7 or var_40_7 * (var_40_12 / var_40_11)

				if var_40_13 > 0 and var_40_7 < var_40_13 then
					arg_37_1.talkMaxDuration = var_40_13

					if var_40_13 + var_40_6 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_13 + var_40_6
					end
				end

				arg_37_1.text_.text = var_40_10
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032009", "story_v_out_117032.awb") ~= 0 then
					local var_40_14 = manager.audio:GetVoiceLength("story_v_out_117032", "117032009", "story_v_out_117032.awb") / 1000

					if var_40_14 + var_40_6 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_14 + var_40_6
					end

					if var_40_9.prefab_name ~= "" and arg_37_1.actors_[var_40_9.prefab_name] ~= nil then
						local var_40_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_9.prefab_name].transform, "story_v_out_117032", "117032009", "story_v_out_117032.awb")

						arg_37_1:RecordAudio("117032009", var_40_15)
						arg_37_1:RecordAudio("117032009", var_40_15)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_117032", "117032009", "story_v_out_117032.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_117032", "117032009", "story_v_out_117032.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_16 = math.max(var_40_7, arg_37_1.talkMaxDuration)

			if var_40_6 <= arg_37_1.time_ and arg_37_1.time_ < var_40_6 + var_40_16 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_6) / var_40_16

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_6 + var_40_16 and arg_37_1.time_ < var_40_6 + var_40_16 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play117032010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 117032010
		arg_41_1.duration_ = 6.633

		local var_41_0 = {
			zh = 3.7,
			ja = 6.633
		}
		local var_41_1 = manager.audio:GetLocalizationFlag()

		if var_41_0[var_41_1] ~= nil then
			arg_41_1.duration_ = var_41_0[var_41_1]
		end

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play117032011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1132"]
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 and arg_41_1.var_.actorSpriteComps1132 == nil then
				arg_41_1.var_.actorSpriteComps1132 = var_44_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_44_2 = 0.2

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2

				if arg_41_1.var_.actorSpriteComps1132 then
					for iter_44_0, iter_44_1 in pairs(arg_41_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_44_1 then
							local var_44_4 = Mathf.Lerp(iter_44_1.color.r, 1, var_44_3)

							iter_44_1.color = Color.New(var_44_4, var_44_4, var_44_4)
						end
					end
				end
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 and arg_41_1.var_.actorSpriteComps1132 then
				local var_44_5 = 1

				for iter_44_2, iter_44_3 in pairs(arg_41_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_44_3 then
						iter_44_3.color = Color.New(var_44_5, var_44_5, var_44_5)
					end
				end

				arg_41_1.var_.actorSpriteComps1132 = nil
			end

			local var_44_6 = arg_41_1.actors_["1033"]
			local var_44_7 = 0

			if var_44_7 < arg_41_1.time_ and arg_41_1.time_ <= var_44_7 + arg_44_0 and arg_41_1.var_.actorSpriteComps1033 == nil then
				arg_41_1.var_.actorSpriteComps1033 = var_44_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_44_8 = 0.2

			if var_44_7 <= arg_41_1.time_ and arg_41_1.time_ < var_44_7 + var_44_8 then
				local var_44_9 = (arg_41_1.time_ - var_44_7) / var_44_8

				if arg_41_1.var_.actorSpriteComps1033 then
					for iter_44_4, iter_44_5 in pairs(arg_41_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_44_5 then
							local var_44_10 = Mathf.Lerp(iter_44_5.color.r, 0.5, var_44_9)

							iter_44_5.color = Color.New(var_44_10, var_44_10, var_44_10)
						end
					end
				end
			end

			if arg_41_1.time_ >= var_44_7 + var_44_8 and arg_41_1.time_ < var_44_7 + var_44_8 + arg_44_0 and arg_41_1.var_.actorSpriteComps1033 then
				local var_44_11 = 0.5

				for iter_44_6, iter_44_7 in pairs(arg_41_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_44_7 then
						iter_44_7.color = Color.New(var_44_11, var_44_11, var_44_11)
					end
				end

				arg_41_1.var_.actorSpriteComps1033 = nil
			end

			local var_44_12 = 0
			local var_44_13 = 0.4

			if var_44_12 < arg_41_1.time_ and arg_41_1.time_ <= var_44_12 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_14 = arg_41_1:FormatText(StoryNameCfg[61].name)

				arg_41_1.leftNameTxt_.text = var_44_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_15 = arg_41_1:GetWordFromCfg(117032010)
				local var_44_16 = arg_41_1:FormatText(var_44_15.content)

				arg_41_1.text_.text = var_44_16

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_17 = 16
				local var_44_18 = utf8.len(var_44_16)
				local var_44_19 = var_44_17 <= 0 and var_44_13 or var_44_13 * (var_44_18 / var_44_17)

				if var_44_19 > 0 and var_44_13 < var_44_19 then
					arg_41_1.talkMaxDuration = var_44_19

					if var_44_19 + var_44_12 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_19 + var_44_12
					end
				end

				arg_41_1.text_.text = var_44_16
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032010", "story_v_out_117032.awb") ~= 0 then
					local var_44_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032010", "story_v_out_117032.awb") / 1000

					if var_44_20 + var_44_12 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_20 + var_44_12
					end

					if var_44_15.prefab_name ~= "" and arg_41_1.actors_[var_44_15.prefab_name] ~= nil then
						local var_44_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_15.prefab_name].transform, "story_v_out_117032", "117032010", "story_v_out_117032.awb")

						arg_41_1:RecordAudio("117032010", var_44_21)
						arg_41_1:RecordAudio("117032010", var_44_21)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_117032", "117032010", "story_v_out_117032.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_117032", "117032010", "story_v_out_117032.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_22 = math.max(var_44_13, arg_41_1.talkMaxDuration)

			if var_44_12 <= arg_41_1.time_ and arg_41_1.time_ < var_44_12 + var_44_22 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_12) / var_44_22

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_12 + var_44_22 and arg_41_1.time_ < var_44_12 + var_44_22 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play117032011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 117032011
		arg_45_1.duration_ = 9

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play117032012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = "ST28"

			if arg_45_1.bgs_[var_48_0] == nil then
				local var_48_1 = Object.Instantiate(arg_45_1.paintGo_)

				var_48_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_48_0)
				var_48_1.name = var_48_0
				var_48_1.transform.parent = arg_45_1.stage_.transform
				var_48_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_45_1.bgs_[var_48_0] = var_48_1
			end

			local var_48_2 = 2

			if var_48_2 < arg_45_1.time_ and arg_45_1.time_ <= var_48_2 + arg_48_0 then
				local var_48_3 = manager.ui.mainCamera.transform.localPosition
				local var_48_4 = Vector3.New(0, 0, 10) + Vector3.New(var_48_3.x, var_48_3.y, 0)
				local var_48_5 = arg_45_1.bgs_.ST28

				var_48_5.transform.localPosition = var_48_4
				var_48_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_48_6 = var_48_5:GetComponent("SpriteRenderer")

				if var_48_6 and var_48_6.sprite then
					local var_48_7 = (var_48_5.transform.localPosition - var_48_3).z
					local var_48_8 = manager.ui.mainCameraCom_
					local var_48_9 = 2 * var_48_7 * Mathf.Tan(var_48_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_48_10 = var_48_9 * var_48_8.aspect
					local var_48_11 = var_48_6.sprite.bounds.size.x
					local var_48_12 = var_48_6.sprite.bounds.size.y
					local var_48_13 = var_48_10 / var_48_11
					local var_48_14 = var_48_9 / var_48_12
					local var_48_15 = var_48_14 < var_48_13 and var_48_13 or var_48_14

					var_48_5.transform.localScale = Vector3.New(var_48_15, var_48_15, 0)
				end

				for iter_48_0, iter_48_1 in pairs(arg_45_1.bgs_) do
					if iter_48_0 ~= "ST28" then
						iter_48_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_48_16 = 0

			if var_48_16 < arg_45_1.time_ and arg_45_1.time_ <= var_48_16 + arg_48_0 then
				arg_45_1.mask_.enabled = true
				arg_45_1.mask_.raycastTarget = true

				arg_45_1:SetGaussion(false)
			end

			local var_48_17 = 2

			if var_48_16 <= arg_45_1.time_ and arg_45_1.time_ < var_48_16 + var_48_17 then
				local var_48_18 = (arg_45_1.time_ - var_48_16) / var_48_17
				local var_48_19 = Color.New(0, 0, 0)

				var_48_19.a = Mathf.Lerp(0, 1, var_48_18)
				arg_45_1.mask_.color = var_48_19
			end

			if arg_45_1.time_ >= var_48_16 + var_48_17 and arg_45_1.time_ < var_48_16 + var_48_17 + arg_48_0 then
				local var_48_20 = Color.New(0, 0, 0)

				var_48_20.a = 1
				arg_45_1.mask_.color = var_48_20
			end

			local var_48_21 = 2

			if var_48_21 < arg_45_1.time_ and arg_45_1.time_ <= var_48_21 + arg_48_0 then
				arg_45_1.mask_.enabled = true
				arg_45_1.mask_.raycastTarget = true

				arg_45_1:SetGaussion(false)
			end

			local var_48_22 = 2

			if var_48_21 <= arg_45_1.time_ and arg_45_1.time_ < var_48_21 + var_48_22 then
				local var_48_23 = (arg_45_1.time_ - var_48_21) / var_48_22
				local var_48_24 = Color.New(0, 0, 0)

				var_48_24.a = Mathf.Lerp(1, 0, var_48_23)
				arg_45_1.mask_.color = var_48_24
			end

			if arg_45_1.time_ >= var_48_21 + var_48_22 and arg_45_1.time_ < var_48_21 + var_48_22 + arg_48_0 then
				local var_48_25 = Color.New(0, 0, 0)
				local var_48_26 = 0

				arg_45_1.mask_.enabled = false
				var_48_25.a = var_48_26
				arg_45_1.mask_.color = var_48_25
			end

			local var_48_27 = arg_45_1.actors_["1033"].transform
			local var_48_28 = 2

			if var_48_28 < arg_45_1.time_ and arg_45_1.time_ <= var_48_28 + arg_48_0 then
				arg_45_1.var_.moveOldPos1033 = var_48_27.localPosition
				var_48_27.localScale = Vector3.New(1, 1, 1)

				arg_45_1:CheckSpriteTmpPos("1033", 7)

				local var_48_29 = var_48_27.childCount

				for iter_48_2 = 0, var_48_29 - 1 do
					local var_48_30 = var_48_27:GetChild(iter_48_2)

					if var_48_30.name == "split_6" or not string.find(var_48_30.name, "split") then
						var_48_30.gameObject:SetActive(true)
					else
						var_48_30.gameObject:SetActive(false)
					end
				end
			end

			local var_48_31 = 0.001

			if var_48_28 <= arg_45_1.time_ and arg_45_1.time_ < var_48_28 + var_48_31 then
				local var_48_32 = (arg_45_1.time_ - var_48_28) / var_48_31
				local var_48_33 = Vector3.New(0, -2000, 0)

				var_48_27.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1033, var_48_33, var_48_32)
			end

			if arg_45_1.time_ >= var_48_28 + var_48_31 and arg_45_1.time_ < var_48_28 + var_48_31 + arg_48_0 then
				var_48_27.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_48_34 = arg_45_1.actors_["1132"].transform
			local var_48_35 = 2

			if var_48_35 < arg_45_1.time_ and arg_45_1.time_ <= var_48_35 + arg_48_0 then
				arg_45_1.var_.moveOldPos1132 = var_48_34.localPosition
				var_48_34.localScale = Vector3.New(1, 1, 1)

				arg_45_1:CheckSpriteTmpPos("1132", 7)

				local var_48_36 = var_48_34.childCount

				for iter_48_3 = 0, var_48_36 - 1 do
					local var_48_37 = var_48_34:GetChild(iter_48_3)

					if var_48_37.name == "split_6" or not string.find(var_48_37.name, "split") then
						var_48_37.gameObject:SetActive(true)
					else
						var_48_37.gameObject:SetActive(false)
					end
				end
			end

			local var_48_38 = 0.001

			if var_48_35 <= arg_45_1.time_ and arg_45_1.time_ < var_48_35 + var_48_38 then
				local var_48_39 = (arg_45_1.time_ - var_48_35) / var_48_38
				local var_48_40 = Vector3.New(0, -2000, -185)

				var_48_34.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1132, var_48_40, var_48_39)
			end

			if arg_45_1.time_ >= var_48_35 + var_48_38 and arg_45_1.time_ < var_48_35 + var_48_38 + arg_48_0 then
				var_48_34.localPosition = Vector3.New(0, -2000, -185)
			end

			if arg_45_1.frameCnt_ <= 1 then
				arg_45_1.dialog_:SetActive(false)
			end

			local var_48_41 = 4
			local var_48_42 = 1.2

			if var_48_41 < arg_45_1.time_ and arg_45_1.time_ <= var_48_41 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0

				arg_45_1.dialog_:SetActive(true)

				local var_48_43 = LeanTween.value(arg_45_1.dialog_, 0, 1, 0.3)

				var_48_43:setOnUpdate(LuaHelper.FloatAction(function(arg_49_0)
					arg_45_1.dialogCg_.alpha = arg_49_0
				end))
				var_48_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_45_1.dialog_)
					var_48_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_45_1.duration_ = arg_45_1.duration_ + 0.3

				SetActive(arg_45_1.leftNameGo_, false)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_44 = arg_45_1:GetWordFromCfg(117032011)
				local var_48_45 = arg_45_1:FormatText(var_48_44.content)

				arg_45_1.text_.text = var_48_45

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_46 = 48
				local var_48_47 = utf8.len(var_48_45)
				local var_48_48 = var_48_46 <= 0 and var_48_42 or var_48_42 * (var_48_47 / var_48_46)

				if var_48_48 > 0 and var_48_42 < var_48_48 then
					arg_45_1.talkMaxDuration = var_48_48
					var_48_41 = var_48_41 + 0.3

					if var_48_48 + var_48_41 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_48 + var_48_41
					end
				end

				arg_45_1.text_.text = var_48_45
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)
				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_49 = var_48_41 + 0.3
			local var_48_50 = math.max(var_48_42, arg_45_1.talkMaxDuration)

			if var_48_49 <= arg_45_1.time_ and arg_45_1.time_ < var_48_49 + var_48_50 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_49) / var_48_50

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_49 + var_48_50 and arg_45_1.time_ < var_48_49 + var_48_50 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play117032012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 117032012
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play117032013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 1.225

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_2 = arg_51_1:GetWordFromCfg(117032012)
				local var_54_3 = arg_51_1:FormatText(var_54_2.content)

				arg_51_1.text_.text = var_54_3

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_4 = 49
				local var_54_5 = utf8.len(var_54_3)
				local var_54_6 = var_54_4 <= 0 and var_54_1 or var_54_1 * (var_54_5 / var_54_4)

				if var_54_6 > 0 and var_54_1 < var_54_6 then
					arg_51_1.talkMaxDuration = var_54_6

					if var_54_6 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_6 + var_54_0
					end
				end

				arg_51_1.text_.text = var_54_3
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_7 = math.max(var_54_1, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_7 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_0) / var_54_7

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_7 and arg_51_1.time_ < var_54_0 + var_54_7 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play117032013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 117032013
		arg_55_1.duration_ = 3.033

		local var_55_0 = {
			zh = 1.2,
			ja = 3.033
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
				arg_55_0:Play117032014(arg_55_1)
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
				local var_58_6 = Vector3.New(390, -420, 0)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1033, var_58_6, var_58_5)
			end

			if arg_55_1.time_ >= var_58_1 + var_58_4 and arg_55_1.time_ < var_58_1 + var_58_4 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_58_7 = arg_55_1.actors_["1132"].transform
			local var_58_8 = 0

			if var_58_8 < arg_55_1.time_ and arg_55_1.time_ <= var_58_8 + arg_58_0 then
				arg_55_1.var_.moveOldPos1132 = var_58_7.localPosition
				var_58_7.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("1132", 2)

				local var_58_9 = var_58_7.childCount

				for iter_58_1 = 0, var_58_9 - 1 do
					local var_58_10 = var_58_7:GetChild(iter_58_1)

					if var_58_10.name == "split_6" or not string.find(var_58_10.name, "split") then
						var_58_10.gameObject:SetActive(true)
					else
						var_58_10.gameObject:SetActive(false)
					end
				end
			end

			local var_58_11 = 0.001

			if var_58_8 <= arg_55_1.time_ and arg_55_1.time_ < var_58_8 + var_58_11 then
				local var_58_12 = (arg_55_1.time_ - var_58_8) / var_58_11
				local var_58_13 = Vector3.New(-390, -413, -185)

				var_58_7.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1132, var_58_13, var_58_12)
			end

			if arg_55_1.time_ >= var_58_8 + var_58_11 and arg_55_1.time_ < var_58_8 + var_58_11 + arg_58_0 then
				var_58_7.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_58_14 = arg_55_1.actors_["1033"]
			local var_58_15 = 0

			if var_58_15 < arg_55_1.time_ and arg_55_1.time_ <= var_58_15 + arg_58_0 then
				local var_58_16 = var_58_14:GetComponentInChildren(typeof(CanvasGroup))

				if var_58_16 then
					arg_55_1.var_.alphaOldValue1033 = var_58_16.alpha
					arg_55_1.var_.characterEffect1033 = var_58_16
				end

				arg_55_1.var_.alphaOldValue1033 = 0
			end

			local var_58_17 = 0.333333333333333

			if var_58_15 <= arg_55_1.time_ and arg_55_1.time_ < var_58_15 + var_58_17 then
				local var_58_18 = (arg_55_1.time_ - var_58_15) / var_58_17
				local var_58_19 = Mathf.Lerp(arg_55_1.var_.alphaOldValue1033, 1, var_58_18)

				if arg_55_1.var_.characterEffect1033 then
					arg_55_1.var_.characterEffect1033.alpha = var_58_19
				end
			end

			if arg_55_1.time_ >= var_58_15 + var_58_17 and arg_55_1.time_ < var_58_15 + var_58_17 + arg_58_0 and arg_55_1.var_.characterEffect1033 then
				arg_55_1.var_.characterEffect1033.alpha = 1
			end

			local var_58_20 = arg_55_1.actors_["1132"]
			local var_58_21 = 0

			if var_58_21 < arg_55_1.time_ and arg_55_1.time_ <= var_58_21 + arg_58_0 then
				local var_58_22 = var_58_20:GetComponentInChildren(typeof(CanvasGroup))

				if var_58_22 then
					arg_55_1.var_.alphaOldValue1132 = var_58_22.alpha
					arg_55_1.var_.characterEffect1132 = var_58_22
				end

				arg_55_1.var_.alphaOldValue1132 = 0
			end

			local var_58_23 = 0.333333333333333

			if var_58_21 <= arg_55_1.time_ and arg_55_1.time_ < var_58_21 + var_58_23 then
				local var_58_24 = (arg_55_1.time_ - var_58_21) / var_58_23
				local var_58_25 = Mathf.Lerp(arg_55_1.var_.alphaOldValue1132, 1, var_58_24)

				if arg_55_1.var_.characterEffect1132 then
					arg_55_1.var_.characterEffect1132.alpha = var_58_25
				end
			end

			if arg_55_1.time_ >= var_58_21 + var_58_23 and arg_55_1.time_ < var_58_21 + var_58_23 + arg_58_0 and arg_55_1.var_.characterEffect1132 then
				arg_55_1.var_.characterEffect1132.alpha = 1
			end

			local var_58_26 = arg_55_1.actors_["1033"]
			local var_58_27 = 0

			if var_58_27 < arg_55_1.time_ and arg_55_1.time_ <= var_58_27 + arg_58_0 and arg_55_1.var_.actorSpriteComps1033 == nil then
				arg_55_1.var_.actorSpriteComps1033 = var_58_26:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_28 = 0.2

			if var_58_27 <= arg_55_1.time_ and arg_55_1.time_ < var_58_27 + var_58_28 then
				local var_58_29 = (arg_55_1.time_ - var_58_27) / var_58_28

				if arg_55_1.var_.actorSpriteComps1033 then
					for iter_58_2, iter_58_3 in pairs(arg_55_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_58_3 then
							local var_58_30 = Mathf.Lerp(iter_58_3.color.r, 1, var_58_29)

							iter_58_3.color = Color.New(var_58_30, var_58_30, var_58_30)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_27 + var_58_28 and arg_55_1.time_ < var_58_27 + var_58_28 + arg_58_0 and arg_55_1.var_.actorSpriteComps1033 then
				local var_58_31 = 1

				for iter_58_4, iter_58_5 in pairs(arg_55_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_58_5 then
						iter_58_5.color = Color.New(var_58_31, var_58_31, var_58_31)
					end
				end

				arg_55_1.var_.actorSpriteComps1033 = nil
			end

			local var_58_32 = arg_55_1.actors_["1132"]
			local var_58_33 = 0

			if var_58_33 < arg_55_1.time_ and arg_55_1.time_ <= var_58_33 + arg_58_0 and arg_55_1.var_.actorSpriteComps1132 == nil then
				arg_55_1.var_.actorSpriteComps1132 = var_58_32:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_34 = 0.2

			if var_58_33 <= arg_55_1.time_ and arg_55_1.time_ < var_58_33 + var_58_34 then
				local var_58_35 = (arg_55_1.time_ - var_58_33) / var_58_34

				if arg_55_1.var_.actorSpriteComps1132 then
					for iter_58_6, iter_58_7 in pairs(arg_55_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_58_7 then
							local var_58_36 = Mathf.Lerp(iter_58_7.color.r, 0.5, var_58_35)

							iter_58_7.color = Color.New(var_58_36, var_58_36, var_58_36)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_33 + var_58_34 and arg_55_1.time_ < var_58_33 + var_58_34 + arg_58_0 and arg_55_1.var_.actorSpriteComps1132 then
				local var_58_37 = 0.5

				for iter_58_8, iter_58_9 in pairs(arg_55_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_58_9 then
						iter_58_9.color = Color.New(var_58_37, var_58_37, var_58_37)
					end
				end

				arg_55_1.var_.actorSpriteComps1132 = nil
			end

			local var_58_38 = 0
			local var_58_39 = 0.1

			if var_58_38 < arg_55_1.time_ and arg_55_1.time_ <= var_58_38 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_40 = arg_55_1:FormatText(StoryNameCfg[236].name)

				arg_55_1.leftNameTxt_.text = var_58_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_41 = arg_55_1:GetWordFromCfg(117032013)
				local var_58_42 = arg_55_1:FormatText(var_58_41.content)

				arg_55_1.text_.text = var_58_42

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_43 = 4
				local var_58_44 = utf8.len(var_58_42)
				local var_58_45 = var_58_43 <= 0 and var_58_39 or var_58_39 * (var_58_44 / var_58_43)

				if var_58_45 > 0 and var_58_39 < var_58_45 then
					arg_55_1.talkMaxDuration = var_58_45

					if var_58_45 + var_58_38 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_45 + var_58_38
					end
				end

				arg_55_1.text_.text = var_58_42
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032013", "story_v_out_117032.awb") ~= 0 then
					local var_58_46 = manager.audio:GetVoiceLength("story_v_out_117032", "117032013", "story_v_out_117032.awb") / 1000

					if var_58_46 + var_58_38 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_46 + var_58_38
					end

					if var_58_41.prefab_name ~= "" and arg_55_1.actors_[var_58_41.prefab_name] ~= nil then
						local var_58_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_41.prefab_name].transform, "story_v_out_117032", "117032013", "story_v_out_117032.awb")

						arg_55_1:RecordAudio("117032013", var_58_47)
						arg_55_1:RecordAudio("117032013", var_58_47)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_117032", "117032013", "story_v_out_117032.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_117032", "117032013", "story_v_out_117032.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_48 = math.max(var_58_39, arg_55_1.talkMaxDuration)

			if var_58_38 <= arg_55_1.time_ and arg_55_1.time_ < var_58_38 + var_58_48 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_38) / var_58_48

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_38 + var_58_48 and arg_55_1.time_ < var_58_38 + var_58_48 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play117032014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 117032014
		arg_59_1.duration_ = 4.8

		local var_59_0 = {
			zh = 3.3,
			ja = 4.8
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
				arg_59_0:Play117032015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1033"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.actorSpriteComps1033 == nil then
				arg_59_1.var_.actorSpriteComps1033 = var_62_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_2 = 0.2

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.actorSpriteComps1033 then
					for iter_62_0, iter_62_1 in pairs(arg_59_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_62_1 then
							local var_62_4 = Mathf.Lerp(iter_62_1.color.r, 0.5, var_62_3)

							iter_62_1.color = Color.New(var_62_4, var_62_4, var_62_4)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.actorSpriteComps1033 then
				local var_62_5 = 0.5

				for iter_62_2, iter_62_3 in pairs(arg_59_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_62_3 then
						iter_62_3.color = Color.New(var_62_5, var_62_5, var_62_5)
					end
				end

				arg_59_1.var_.actorSpriteComps1033 = nil
			end

			local var_62_6 = arg_59_1.actors_["1132"]
			local var_62_7 = 0

			if var_62_7 < arg_59_1.time_ and arg_59_1.time_ <= var_62_7 + arg_62_0 and arg_59_1.var_.actorSpriteComps1132 == nil then
				arg_59_1.var_.actorSpriteComps1132 = var_62_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_8 = 0.2

			if var_62_7 <= arg_59_1.time_ and arg_59_1.time_ < var_62_7 + var_62_8 then
				local var_62_9 = (arg_59_1.time_ - var_62_7) / var_62_8

				if arg_59_1.var_.actorSpriteComps1132 then
					for iter_62_4, iter_62_5 in pairs(arg_59_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_62_5 then
							local var_62_10 = Mathf.Lerp(iter_62_5.color.r, 1, var_62_9)

							iter_62_5.color = Color.New(var_62_10, var_62_10, var_62_10)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_7 + var_62_8 and arg_59_1.time_ < var_62_7 + var_62_8 + arg_62_0 and arg_59_1.var_.actorSpriteComps1132 then
				local var_62_11 = 1

				for iter_62_6, iter_62_7 in pairs(arg_59_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_62_7 then
						iter_62_7.color = Color.New(var_62_11, var_62_11, var_62_11)
					end
				end

				arg_59_1.var_.actorSpriteComps1132 = nil
			end

			local var_62_12 = 0
			local var_62_13 = 0.4

			if var_62_12 < arg_59_1.time_ and arg_59_1.time_ <= var_62_12 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_14 = arg_59_1:FormatText(StoryNameCfg[61].name)

				arg_59_1.leftNameTxt_.text = var_62_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_15 = arg_59_1:GetWordFromCfg(117032014)
				local var_62_16 = arg_59_1:FormatText(var_62_15.content)

				arg_59_1.text_.text = var_62_16

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_17 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032014", "story_v_out_117032.awb") ~= 0 then
					local var_62_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032014", "story_v_out_117032.awb") / 1000

					if var_62_20 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_20 + var_62_12
					end

					if var_62_15.prefab_name ~= "" and arg_59_1.actors_[var_62_15.prefab_name] ~= nil then
						local var_62_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_15.prefab_name].transform, "story_v_out_117032", "117032014", "story_v_out_117032.awb")

						arg_59_1:RecordAudio("117032014", var_62_21)
						arg_59_1:RecordAudio("117032014", var_62_21)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_117032", "117032014", "story_v_out_117032.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_117032", "117032014", "story_v_out_117032.awb")
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
	Play117032015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 117032015
		arg_63_1.duration_ = 9.566

		local var_63_0 = {
			zh = 6.5,
			ja = 9.566
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
				arg_63_0:Play117032016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 0.8

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_2 = arg_63_1:FormatText(StoryNameCfg[61].name)

				arg_63_1.leftNameTxt_.text = var_66_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_3 = arg_63_1:GetWordFromCfg(117032015)
				local var_66_4 = arg_63_1:FormatText(var_66_3.content)

				arg_63_1.text_.text = var_66_4

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_5 = 32
				local var_66_6 = utf8.len(var_66_4)
				local var_66_7 = var_66_5 <= 0 and var_66_1 or var_66_1 * (var_66_6 / var_66_5)

				if var_66_7 > 0 and var_66_1 < var_66_7 then
					arg_63_1.talkMaxDuration = var_66_7

					if var_66_7 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_7 + var_66_0
					end
				end

				arg_63_1.text_.text = var_66_4
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032015", "story_v_out_117032.awb") ~= 0 then
					local var_66_8 = manager.audio:GetVoiceLength("story_v_out_117032", "117032015", "story_v_out_117032.awb") / 1000

					if var_66_8 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_8 + var_66_0
					end

					if var_66_3.prefab_name ~= "" and arg_63_1.actors_[var_66_3.prefab_name] ~= nil then
						local var_66_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_3.prefab_name].transform, "story_v_out_117032", "117032015", "story_v_out_117032.awb")

						arg_63_1:RecordAudio("117032015", var_66_9)
						arg_63_1:RecordAudio("117032015", var_66_9)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_117032", "117032015", "story_v_out_117032.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_117032", "117032015", "story_v_out_117032.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_10 = math.max(var_66_1, arg_63_1.talkMaxDuration)

			if var_66_0 <= arg_63_1.time_ and arg_63_1.time_ < var_66_0 + var_66_10 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_0) / var_66_10

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_0 + var_66_10 and arg_63_1.time_ < var_66_0 + var_66_10 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play117032016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 117032016
		arg_67_1.duration_ = 10.466

		local var_67_0 = {
			zh = 9.833,
			ja = 10.466
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
				arg_67_0:Play117032017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1033"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1033 = var_70_0.localPosition
				var_70_0.localScale = Vector3.New(1, 1, 1)

				arg_67_1:CheckSpriteTmpPos("1033", 4)

				local var_70_2 = var_70_0.childCount

				for iter_70_0 = 0, var_70_2 - 1 do
					local var_70_3 = var_70_0:GetChild(iter_70_0)

					if var_70_3.name == "split_6" or not string.find(var_70_3.name, "split") then
						var_70_3.gameObject:SetActive(true)
					else
						var_70_3.gameObject:SetActive(false)
					end
				end
			end

			local var_70_4 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_4 then
				local var_70_5 = (arg_67_1.time_ - var_70_1) / var_70_4
				local var_70_6 = Vector3.New(390, -420, 0)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1033, var_70_6, var_70_5)
			end

			if arg_67_1.time_ >= var_70_1 + var_70_4 and arg_67_1.time_ < var_70_1 + var_70_4 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_70_7 = arg_67_1.actors_["1132"]
			local var_70_8 = 0

			if var_70_8 < arg_67_1.time_ and arg_67_1.time_ <= var_70_8 + arg_70_0 and arg_67_1.var_.actorSpriteComps1132 == nil then
				arg_67_1.var_.actorSpriteComps1132 = var_70_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_9 = 0.2

			if var_70_8 <= arg_67_1.time_ and arg_67_1.time_ < var_70_8 + var_70_9 then
				local var_70_10 = (arg_67_1.time_ - var_70_8) / var_70_9

				if arg_67_1.var_.actorSpriteComps1132 then
					for iter_70_1, iter_70_2 in pairs(arg_67_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_70_2 then
							local var_70_11 = Mathf.Lerp(iter_70_2.color.r, 0.5, var_70_10)

							iter_70_2.color = Color.New(var_70_11, var_70_11, var_70_11)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_8 + var_70_9 and arg_67_1.time_ < var_70_8 + var_70_9 + arg_70_0 and arg_67_1.var_.actorSpriteComps1132 then
				local var_70_12 = 0.5

				for iter_70_3, iter_70_4 in pairs(arg_67_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_70_4 then
						iter_70_4.color = Color.New(var_70_12, var_70_12, var_70_12)
					end
				end

				arg_67_1.var_.actorSpriteComps1132 = nil
			end

			local var_70_13 = arg_67_1.actors_["1033"]
			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 and arg_67_1.var_.actorSpriteComps1033 == nil then
				arg_67_1.var_.actorSpriteComps1033 = var_70_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_15 = 0.2

			if var_70_14 <= arg_67_1.time_ and arg_67_1.time_ < var_70_14 + var_70_15 then
				local var_70_16 = (arg_67_1.time_ - var_70_14) / var_70_15

				if arg_67_1.var_.actorSpriteComps1033 then
					for iter_70_5, iter_70_6 in pairs(arg_67_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_70_6 then
							local var_70_17 = Mathf.Lerp(iter_70_6.color.r, 1, var_70_16)

							iter_70_6.color = Color.New(var_70_17, var_70_17, var_70_17)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_14 + var_70_15 and arg_67_1.time_ < var_70_14 + var_70_15 + arg_70_0 and arg_67_1.var_.actorSpriteComps1033 then
				local var_70_18 = 1

				for iter_70_7, iter_70_8 in pairs(arg_67_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_70_8 then
						iter_70_8.color = Color.New(var_70_18, var_70_18, var_70_18)
					end
				end

				arg_67_1.var_.actorSpriteComps1033 = nil
			end

			local var_70_19 = 0
			local var_70_20 = 1.175

			if var_70_19 < arg_67_1.time_ and arg_67_1.time_ <= var_70_19 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_21 = arg_67_1:FormatText(StoryNameCfg[236].name)

				arg_67_1.leftNameTxt_.text = var_70_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_22 = arg_67_1:GetWordFromCfg(117032016)
				local var_70_23 = arg_67_1:FormatText(var_70_22.content)

				arg_67_1.text_.text = var_70_23

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_24 = 47
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032016", "story_v_out_117032.awb") ~= 0 then
					local var_70_27 = manager.audio:GetVoiceLength("story_v_out_117032", "117032016", "story_v_out_117032.awb") / 1000

					if var_70_27 + var_70_19 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_27 + var_70_19
					end

					if var_70_22.prefab_name ~= "" and arg_67_1.actors_[var_70_22.prefab_name] ~= nil then
						local var_70_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_22.prefab_name].transform, "story_v_out_117032", "117032016", "story_v_out_117032.awb")

						arg_67_1:RecordAudio("117032016", var_70_28)
						arg_67_1:RecordAudio("117032016", var_70_28)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_117032", "117032016", "story_v_out_117032.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_117032", "117032016", "story_v_out_117032.awb")
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
	Play117032017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 117032017
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play117032018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1033"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.actorSpriteComps1033 == nil then
				arg_71_1.var_.actorSpriteComps1033 = var_74_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_2 = 0.2

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.actorSpriteComps1033 then
					for iter_74_0, iter_74_1 in pairs(arg_71_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_74_1 then
							local var_74_4 = Mathf.Lerp(iter_74_1.color.r, 0.5, var_74_3)

							iter_74_1.color = Color.New(var_74_4, var_74_4, var_74_4)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.actorSpriteComps1033 then
				local var_74_5 = 0.5

				for iter_74_2, iter_74_3 in pairs(arg_71_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_74_3 then
						iter_74_3.color = Color.New(var_74_5, var_74_5, var_74_5)
					end
				end

				arg_71_1.var_.actorSpriteComps1033 = nil
			end

			local var_74_6 = 0
			local var_74_7 = 0.7

			if var_74_6 < arg_71_1.time_ and arg_71_1.time_ <= var_74_6 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_8 = arg_71_1:GetWordFromCfg(117032017)
				local var_74_9 = arg_71_1:FormatText(var_74_8.content)

				arg_71_1.text_.text = var_74_9

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_10 = 28
				local var_74_11 = utf8.len(var_74_9)
				local var_74_12 = var_74_10 <= 0 and var_74_7 or var_74_7 * (var_74_11 / var_74_10)

				if var_74_12 > 0 and var_74_7 < var_74_12 then
					arg_71_1.talkMaxDuration = var_74_12

					if var_74_12 + var_74_6 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_12 + var_74_6
					end
				end

				arg_71_1.text_.text = var_74_9
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_13 = math.max(var_74_7, arg_71_1.talkMaxDuration)

			if var_74_6 <= arg_71_1.time_ and arg_71_1.time_ < var_74_6 + var_74_13 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_6) / var_74_13

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_6 + var_74_13 and arg_71_1.time_ < var_74_6 + var_74_13 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play117032018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 117032018
		arg_75_1.duration_ = 8.2

		local var_75_0 = {
			zh = 5.533,
			ja = 8.2
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
				arg_75_0:Play117032019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1132"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.actorSpriteComps1132 == nil then
				arg_75_1.var_.actorSpriteComps1132 = var_78_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_2 = 0.2

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.actorSpriteComps1132 then
					for iter_78_0, iter_78_1 in pairs(arg_75_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_78_1 then
							local var_78_4 = Mathf.Lerp(iter_78_1.color.r, 1, var_78_3)

							iter_78_1.color = Color.New(var_78_4, var_78_4, var_78_4)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.actorSpriteComps1132 then
				local var_78_5 = 1

				for iter_78_2, iter_78_3 in pairs(arg_75_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_78_3 then
						iter_78_3.color = Color.New(var_78_5, var_78_5, var_78_5)
					end
				end

				arg_75_1.var_.actorSpriteComps1132 = nil
			end

			local var_78_6 = 0
			local var_78_7 = 0.65

			if var_78_6 < arg_75_1.time_ and arg_75_1.time_ <= var_78_6 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_8 = arg_75_1:FormatText(StoryNameCfg[61].name)

				arg_75_1.leftNameTxt_.text = var_78_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_9 = arg_75_1:GetWordFromCfg(117032018)
				local var_78_10 = arg_75_1:FormatText(var_78_9.content)

				arg_75_1.text_.text = var_78_10

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_11 = 26
				local var_78_12 = utf8.len(var_78_10)
				local var_78_13 = var_78_11 <= 0 and var_78_7 or var_78_7 * (var_78_12 / var_78_11)

				if var_78_13 > 0 and var_78_7 < var_78_13 then
					arg_75_1.talkMaxDuration = var_78_13

					if var_78_13 + var_78_6 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_13 + var_78_6
					end
				end

				arg_75_1.text_.text = var_78_10
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032018", "story_v_out_117032.awb") ~= 0 then
					local var_78_14 = manager.audio:GetVoiceLength("story_v_out_117032", "117032018", "story_v_out_117032.awb") / 1000

					if var_78_14 + var_78_6 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_14 + var_78_6
					end

					if var_78_9.prefab_name ~= "" and arg_75_1.actors_[var_78_9.prefab_name] ~= nil then
						local var_78_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_9.prefab_name].transform, "story_v_out_117032", "117032018", "story_v_out_117032.awb")

						arg_75_1:RecordAudio("117032018", var_78_15)
						arg_75_1:RecordAudio("117032018", var_78_15)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_117032", "117032018", "story_v_out_117032.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_117032", "117032018", "story_v_out_117032.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_16 = math.max(var_78_7, arg_75_1.talkMaxDuration)

			if var_78_6 <= arg_75_1.time_ and arg_75_1.time_ < var_78_6 + var_78_16 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_6) / var_78_16

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_6 + var_78_16 and arg_75_1.time_ < var_78_6 + var_78_16 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play117032019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 117032019
		arg_79_1.duration_ = 10.933

		local var_79_0 = {
			zh = 8.2,
			ja = 10.933
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
				arg_79_0:Play117032020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1132"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.actorSpriteComps1132 == nil then
				arg_79_1.var_.actorSpriteComps1132 = var_82_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_2 = 0.2

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.actorSpriteComps1132 then
					for iter_82_0, iter_82_1 in pairs(arg_79_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_82_1 then
							local var_82_4 = Mathf.Lerp(iter_82_1.color.r, 0.5, var_82_3)

							iter_82_1.color = Color.New(var_82_4, var_82_4, var_82_4)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.actorSpriteComps1132 then
				local var_82_5 = 0.5

				for iter_82_2, iter_82_3 in pairs(arg_79_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_82_3 then
						iter_82_3.color = Color.New(var_82_5, var_82_5, var_82_5)
					end
				end

				arg_79_1.var_.actorSpriteComps1132 = nil
			end

			local var_82_6 = arg_79_1.actors_["1033"]
			local var_82_7 = 0

			if var_82_7 < arg_79_1.time_ and arg_79_1.time_ <= var_82_7 + arg_82_0 and arg_79_1.var_.actorSpriteComps1033 == nil then
				arg_79_1.var_.actorSpriteComps1033 = var_82_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_8 = 0.2

			if var_82_7 <= arg_79_1.time_ and arg_79_1.time_ < var_82_7 + var_82_8 then
				local var_82_9 = (arg_79_1.time_ - var_82_7) / var_82_8

				if arg_79_1.var_.actorSpriteComps1033 then
					for iter_82_4, iter_82_5 in pairs(arg_79_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_82_5 then
							local var_82_10 = Mathf.Lerp(iter_82_5.color.r, 1, var_82_9)

							iter_82_5.color = Color.New(var_82_10, var_82_10, var_82_10)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_7 + var_82_8 and arg_79_1.time_ < var_82_7 + var_82_8 + arg_82_0 and arg_79_1.var_.actorSpriteComps1033 then
				local var_82_11 = 1

				for iter_82_6, iter_82_7 in pairs(arg_79_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_82_7 then
						iter_82_7.color = Color.New(var_82_11, var_82_11, var_82_11)
					end
				end

				arg_79_1.var_.actorSpriteComps1033 = nil
			end

			local var_82_12 = 0
			local var_82_13 = 1.1

			if var_82_12 < arg_79_1.time_ and arg_79_1.time_ <= var_82_12 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_14 = arg_79_1:FormatText(StoryNameCfg[236].name)

				arg_79_1.leftNameTxt_.text = var_82_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_15 = arg_79_1:GetWordFromCfg(117032019)
				local var_82_16 = arg_79_1:FormatText(var_82_15.content)

				arg_79_1.text_.text = var_82_16

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_17 = 44
				local var_82_18 = utf8.len(var_82_16)
				local var_82_19 = var_82_17 <= 0 and var_82_13 or var_82_13 * (var_82_18 / var_82_17)

				if var_82_19 > 0 and var_82_13 < var_82_19 then
					arg_79_1.talkMaxDuration = var_82_19

					if var_82_19 + var_82_12 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_19 + var_82_12
					end
				end

				arg_79_1.text_.text = var_82_16
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032019", "story_v_out_117032.awb") ~= 0 then
					local var_82_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032019", "story_v_out_117032.awb") / 1000

					if var_82_20 + var_82_12 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_20 + var_82_12
					end

					if var_82_15.prefab_name ~= "" and arg_79_1.actors_[var_82_15.prefab_name] ~= nil then
						local var_82_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_15.prefab_name].transform, "story_v_out_117032", "117032019", "story_v_out_117032.awb")

						arg_79_1:RecordAudio("117032019", var_82_21)
						arg_79_1:RecordAudio("117032019", var_82_21)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_117032", "117032019", "story_v_out_117032.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_117032", "117032019", "story_v_out_117032.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_22 = math.max(var_82_13, arg_79_1.talkMaxDuration)

			if var_82_12 <= arg_79_1.time_ and arg_79_1.time_ < var_82_12 + var_82_22 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_12) / var_82_22

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_12 + var_82_22 and arg_79_1.time_ < var_82_12 + var_82_22 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play117032020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 117032020
		arg_83_1.duration_ = 10.9

		local var_83_0 = {
			zh = 9.666,
			ja = 10.9
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
				arg_83_0:Play117032021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1132"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.actorSpriteComps1132 == nil then
				arg_83_1.var_.actorSpriteComps1132 = var_86_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_2 = 0.2

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.actorSpriteComps1132 then
					for iter_86_0, iter_86_1 in pairs(arg_83_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_86_1 then
							local var_86_4 = Mathf.Lerp(iter_86_1.color.r, 1, var_86_3)

							iter_86_1.color = Color.New(var_86_4, var_86_4, var_86_4)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.actorSpriteComps1132 then
				local var_86_5 = 1

				for iter_86_2, iter_86_3 in pairs(arg_83_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_86_3 then
						iter_86_3.color = Color.New(var_86_5, var_86_5, var_86_5)
					end
				end

				arg_83_1.var_.actorSpriteComps1132 = nil
			end

			local var_86_6 = arg_83_1.actors_["1033"]
			local var_86_7 = 0

			if var_86_7 < arg_83_1.time_ and arg_83_1.time_ <= var_86_7 + arg_86_0 and arg_83_1.var_.actorSpriteComps1033 == nil then
				arg_83_1.var_.actorSpriteComps1033 = var_86_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_8 = 0.2

			if var_86_7 <= arg_83_1.time_ and arg_83_1.time_ < var_86_7 + var_86_8 then
				local var_86_9 = (arg_83_1.time_ - var_86_7) / var_86_8

				if arg_83_1.var_.actorSpriteComps1033 then
					for iter_86_4, iter_86_5 in pairs(arg_83_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_86_5 then
							local var_86_10 = Mathf.Lerp(iter_86_5.color.r, 0.5, var_86_9)

							iter_86_5.color = Color.New(var_86_10, var_86_10, var_86_10)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_7 + var_86_8 and arg_83_1.time_ < var_86_7 + var_86_8 + arg_86_0 and arg_83_1.var_.actorSpriteComps1033 then
				local var_86_11 = 0.5

				for iter_86_6, iter_86_7 in pairs(arg_83_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_86_7 then
						iter_86_7.color = Color.New(var_86_11, var_86_11, var_86_11)
					end
				end

				arg_83_1.var_.actorSpriteComps1033 = nil
			end

			local var_86_12 = 0
			local var_86_13 = 0.975

			if var_86_12 < arg_83_1.time_ and arg_83_1.time_ <= var_86_12 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_14 = arg_83_1:FormatText(StoryNameCfg[61].name)

				arg_83_1.leftNameTxt_.text = var_86_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_15 = arg_83_1:GetWordFromCfg(117032020)
				local var_86_16 = arg_83_1:FormatText(var_86_15.content)

				arg_83_1.text_.text = var_86_16

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_17 = 39
				local var_86_18 = utf8.len(var_86_16)
				local var_86_19 = var_86_17 <= 0 and var_86_13 or var_86_13 * (var_86_18 / var_86_17)

				if var_86_19 > 0 and var_86_13 < var_86_19 then
					arg_83_1.talkMaxDuration = var_86_19

					if var_86_19 + var_86_12 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_19 + var_86_12
					end
				end

				arg_83_1.text_.text = var_86_16
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032020", "story_v_out_117032.awb") ~= 0 then
					local var_86_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032020", "story_v_out_117032.awb") / 1000

					if var_86_20 + var_86_12 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_20 + var_86_12
					end

					if var_86_15.prefab_name ~= "" and arg_83_1.actors_[var_86_15.prefab_name] ~= nil then
						local var_86_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_15.prefab_name].transform, "story_v_out_117032", "117032020", "story_v_out_117032.awb")

						arg_83_1:RecordAudio("117032020", var_86_21)
						arg_83_1:RecordAudio("117032020", var_86_21)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_117032", "117032020", "story_v_out_117032.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_117032", "117032020", "story_v_out_117032.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_22 = math.max(var_86_13, arg_83_1.talkMaxDuration)

			if var_86_12 <= arg_83_1.time_ and arg_83_1.time_ < var_86_12 + var_86_22 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_12) / var_86_22

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_12 + var_86_22 and arg_83_1.time_ < var_86_12 + var_86_22 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play117032021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 117032021
		arg_87_1.duration_ = 6.466

		local var_87_0 = {
			zh = 3.4,
			ja = 6.466
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
				arg_87_0:Play117032022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 0.275

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[61].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(117032021)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032021", "story_v_out_117032.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_117032", "117032021", "story_v_out_117032.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_117032", "117032021", "story_v_out_117032.awb")

						arg_87_1:RecordAudio("117032021", var_90_9)
						arg_87_1:RecordAudio("117032021", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_117032", "117032021", "story_v_out_117032.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_117032", "117032021", "story_v_out_117032.awb")
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
	Play117032022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 117032022
		arg_91_1.duration_ = 11.066

		local var_91_0 = {
			zh = 11.066,
			ja = 10.966
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
				arg_91_0:Play117032023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1132"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.actorSpriteComps1132 == nil then
				arg_91_1.var_.actorSpriteComps1132 = var_94_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_2 = 0.2

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.actorSpriteComps1132 then
					for iter_94_0, iter_94_1 in pairs(arg_91_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_94_1 then
							local var_94_4 = Mathf.Lerp(iter_94_1.color.r, 0.5, var_94_3)

							iter_94_1.color = Color.New(var_94_4, var_94_4, var_94_4)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.actorSpriteComps1132 then
				local var_94_5 = 0.5

				for iter_94_2, iter_94_3 in pairs(arg_91_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_94_3 then
						iter_94_3.color = Color.New(var_94_5, var_94_5, var_94_5)
					end
				end

				arg_91_1.var_.actorSpriteComps1132 = nil
			end

			local var_94_6 = arg_91_1.actors_["1033"]
			local var_94_7 = 0

			if var_94_7 < arg_91_1.time_ and arg_91_1.time_ <= var_94_7 + arg_94_0 and arg_91_1.var_.actorSpriteComps1033 == nil then
				arg_91_1.var_.actorSpriteComps1033 = var_94_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_8 = 0.2

			if var_94_7 <= arg_91_1.time_ and arg_91_1.time_ < var_94_7 + var_94_8 then
				local var_94_9 = (arg_91_1.time_ - var_94_7) / var_94_8

				if arg_91_1.var_.actorSpriteComps1033 then
					for iter_94_4, iter_94_5 in pairs(arg_91_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_94_5 then
							local var_94_10 = Mathf.Lerp(iter_94_5.color.r, 1, var_94_9)

							iter_94_5.color = Color.New(var_94_10, var_94_10, var_94_10)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_7 + var_94_8 and arg_91_1.time_ < var_94_7 + var_94_8 + arg_94_0 and arg_91_1.var_.actorSpriteComps1033 then
				local var_94_11 = 1

				for iter_94_6, iter_94_7 in pairs(arg_91_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_94_7 then
						iter_94_7.color = Color.New(var_94_11, var_94_11, var_94_11)
					end
				end

				arg_91_1.var_.actorSpriteComps1033 = nil
			end

			local var_94_12 = 0
			local var_94_13 = 1.35

			if var_94_12 < arg_91_1.time_ and arg_91_1.time_ <= var_94_12 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_14 = arg_91_1:FormatText(StoryNameCfg[236].name)

				arg_91_1.leftNameTxt_.text = var_94_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_15 = arg_91_1:GetWordFromCfg(117032022)
				local var_94_16 = arg_91_1:FormatText(var_94_15.content)

				arg_91_1.text_.text = var_94_16

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_17 = 54
				local var_94_18 = utf8.len(var_94_16)
				local var_94_19 = var_94_17 <= 0 and var_94_13 or var_94_13 * (var_94_18 / var_94_17)

				if var_94_19 > 0 and var_94_13 < var_94_19 then
					arg_91_1.talkMaxDuration = var_94_19

					if var_94_19 + var_94_12 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_19 + var_94_12
					end
				end

				arg_91_1.text_.text = var_94_16
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032022", "story_v_out_117032.awb") ~= 0 then
					local var_94_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032022", "story_v_out_117032.awb") / 1000

					if var_94_20 + var_94_12 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_20 + var_94_12
					end

					if var_94_15.prefab_name ~= "" and arg_91_1.actors_[var_94_15.prefab_name] ~= nil then
						local var_94_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_15.prefab_name].transform, "story_v_out_117032", "117032022", "story_v_out_117032.awb")

						arg_91_1:RecordAudio("117032022", var_94_21)
						arg_91_1:RecordAudio("117032022", var_94_21)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_117032", "117032022", "story_v_out_117032.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_117032", "117032022", "story_v_out_117032.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_22 = math.max(var_94_13, arg_91_1.talkMaxDuration)

			if var_94_12 <= arg_91_1.time_ and arg_91_1.time_ < var_94_12 + var_94_22 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_12) / var_94_22

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_12 + var_94_22 and arg_91_1.time_ < var_94_12 + var_94_22 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play117032023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 117032023
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play117032024(arg_95_1)
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
			local var_98_7 = 0.575

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

				local var_98_8 = arg_95_1:GetWordFromCfg(117032023)
				local var_98_9 = arg_95_1:FormatText(var_98_8.content)

				arg_95_1.text_.text = var_98_9

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_10 = 23
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
	Play117032024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 117032024
		arg_99_1.duration_ = 9.9

		local var_99_0 = {
			zh = 6.1,
			ja = 9.9
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
				arg_99_0:Play117032025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1033"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.actorSpriteComps1033 == nil then
				arg_99_1.var_.actorSpriteComps1033 = var_102_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_2 = 0.2

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.actorSpriteComps1033 then
					for iter_102_0, iter_102_1 in pairs(arg_99_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_102_1 then
							local var_102_4 = Mathf.Lerp(iter_102_1.color.r, 1, var_102_3)

							iter_102_1.color = Color.New(var_102_4, var_102_4, var_102_4)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.actorSpriteComps1033 then
				local var_102_5 = 1

				for iter_102_2, iter_102_3 in pairs(arg_99_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_102_3 then
						iter_102_3.color = Color.New(var_102_5, var_102_5, var_102_5)
					end
				end

				arg_99_1.var_.actorSpriteComps1033 = nil
			end

			local var_102_6 = 0
			local var_102_7 = 0.775

			if var_102_6 < arg_99_1.time_ and arg_99_1.time_ <= var_102_6 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_8 = arg_99_1:FormatText(StoryNameCfg[236].name)

				arg_99_1.leftNameTxt_.text = var_102_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_9 = arg_99_1:GetWordFromCfg(117032024)
				local var_102_10 = arg_99_1:FormatText(var_102_9.content)

				arg_99_1.text_.text = var_102_10

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_11 = 31
				local var_102_12 = utf8.len(var_102_10)
				local var_102_13 = var_102_11 <= 0 and var_102_7 or var_102_7 * (var_102_12 / var_102_11)

				if var_102_13 > 0 and var_102_7 < var_102_13 then
					arg_99_1.talkMaxDuration = var_102_13

					if var_102_13 + var_102_6 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_13 + var_102_6
					end
				end

				arg_99_1.text_.text = var_102_10
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032024", "story_v_out_117032.awb") ~= 0 then
					local var_102_14 = manager.audio:GetVoiceLength("story_v_out_117032", "117032024", "story_v_out_117032.awb") / 1000

					if var_102_14 + var_102_6 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_14 + var_102_6
					end

					if var_102_9.prefab_name ~= "" and arg_99_1.actors_[var_102_9.prefab_name] ~= nil then
						local var_102_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_9.prefab_name].transform, "story_v_out_117032", "117032024", "story_v_out_117032.awb")

						arg_99_1:RecordAudio("117032024", var_102_15)
						arg_99_1:RecordAudio("117032024", var_102_15)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_117032", "117032024", "story_v_out_117032.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_117032", "117032024", "story_v_out_117032.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_16 = math.max(var_102_7, arg_99_1.talkMaxDuration)

			if var_102_6 <= arg_99_1.time_ and arg_99_1.time_ < var_102_6 + var_102_16 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_6) / var_102_16

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_6 + var_102_16 and arg_99_1.time_ < var_102_6 + var_102_16 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play117032025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 117032025
		arg_103_1.duration_ = 3

		local var_103_0 = {
			zh = 2.633,
			ja = 3
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
				arg_103_0:Play117032026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1132"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.actorSpriteComps1132 == nil then
				arg_103_1.var_.actorSpriteComps1132 = var_106_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_2 = 0.2

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.actorSpriteComps1132 then
					for iter_106_0, iter_106_1 in pairs(arg_103_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_106_1 then
							local var_106_4 = Mathf.Lerp(iter_106_1.color.r, 1, var_106_3)

							iter_106_1.color = Color.New(var_106_4, var_106_4, var_106_4)
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.actorSpriteComps1132 then
				local var_106_5 = 1

				for iter_106_2, iter_106_3 in pairs(arg_103_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_106_3 then
						iter_106_3.color = Color.New(var_106_5, var_106_5, var_106_5)
					end
				end

				arg_103_1.var_.actorSpriteComps1132 = nil
			end

			local var_106_6 = arg_103_1.actors_["1033"]
			local var_106_7 = 0

			if var_106_7 < arg_103_1.time_ and arg_103_1.time_ <= var_106_7 + arg_106_0 and arg_103_1.var_.actorSpriteComps1033 == nil then
				arg_103_1.var_.actorSpriteComps1033 = var_106_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_8 = 0.2

			if var_106_7 <= arg_103_1.time_ and arg_103_1.time_ < var_106_7 + var_106_8 then
				local var_106_9 = (arg_103_1.time_ - var_106_7) / var_106_8

				if arg_103_1.var_.actorSpriteComps1033 then
					for iter_106_4, iter_106_5 in pairs(arg_103_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_106_5 then
							local var_106_10 = Mathf.Lerp(iter_106_5.color.r, 0.5, var_106_9)

							iter_106_5.color = Color.New(var_106_10, var_106_10, var_106_10)
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_7 + var_106_8 and arg_103_1.time_ < var_106_7 + var_106_8 + arg_106_0 and arg_103_1.var_.actorSpriteComps1033 then
				local var_106_11 = 0.5

				for iter_106_6, iter_106_7 in pairs(arg_103_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_106_7 then
						iter_106_7.color = Color.New(var_106_11, var_106_11, var_106_11)
					end
				end

				arg_103_1.var_.actorSpriteComps1033 = nil
			end

			local var_106_12 = 0
			local var_106_13 = 0.3

			if var_106_12 < arg_103_1.time_ and arg_103_1.time_ <= var_106_12 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_14 = arg_103_1:FormatText(StoryNameCfg[61].name)

				arg_103_1.leftNameTxt_.text = var_106_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_15 = arg_103_1:GetWordFromCfg(117032025)
				local var_106_16 = arg_103_1:FormatText(var_106_15.content)

				arg_103_1.text_.text = var_106_16

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_17 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032025", "story_v_out_117032.awb") ~= 0 then
					local var_106_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032025", "story_v_out_117032.awb") / 1000

					if var_106_20 + var_106_12 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_20 + var_106_12
					end

					if var_106_15.prefab_name ~= "" and arg_103_1.actors_[var_106_15.prefab_name] ~= nil then
						local var_106_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_15.prefab_name].transform, "story_v_out_117032", "117032025", "story_v_out_117032.awb")

						arg_103_1:RecordAudio("117032025", var_106_21)
						arg_103_1:RecordAudio("117032025", var_106_21)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_117032", "117032025", "story_v_out_117032.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_117032", "117032025", "story_v_out_117032.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_22 = math.max(var_106_13, arg_103_1.talkMaxDuration)

			if var_106_12 <= arg_103_1.time_ and arg_103_1.time_ < var_106_12 + var_106_22 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_12) / var_106_22

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_12 + var_106_22 and arg_103_1.time_ < var_106_12 + var_106_22 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play117032026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 117032026
		arg_107_1.duration_ = 10.766

		local var_107_0 = {
			zh = 9.633,
			ja = 10.766
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
				arg_107_0:Play117032027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1132"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.actorSpriteComps1132 == nil then
				arg_107_1.var_.actorSpriteComps1132 = var_110_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_2 = 0.2

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.actorSpriteComps1132 then
					for iter_110_0, iter_110_1 in pairs(arg_107_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_110_1 then
							local var_110_4 = Mathf.Lerp(iter_110_1.color.r, 0.5, var_110_3)

							iter_110_1.color = Color.New(var_110_4, var_110_4, var_110_4)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.actorSpriteComps1132 then
				local var_110_5 = 0.5

				for iter_110_2, iter_110_3 in pairs(arg_107_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_110_3 then
						iter_110_3.color = Color.New(var_110_5, var_110_5, var_110_5)
					end
				end

				arg_107_1.var_.actorSpriteComps1132 = nil
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
			local var_110_13 = 1.025

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

				local var_110_15 = arg_107_1:GetWordFromCfg(117032026)
				local var_110_16 = arg_107_1:FormatText(var_110_15.content)

				arg_107_1.text_.text = var_110_16

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_17 = 41
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032026", "story_v_out_117032.awb") ~= 0 then
					local var_110_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032026", "story_v_out_117032.awb") / 1000

					if var_110_20 + var_110_12 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_20 + var_110_12
					end

					if var_110_15.prefab_name ~= "" and arg_107_1.actors_[var_110_15.prefab_name] ~= nil then
						local var_110_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_15.prefab_name].transform, "story_v_out_117032", "117032026", "story_v_out_117032.awb")

						arg_107_1:RecordAudio("117032026", var_110_21)
						arg_107_1:RecordAudio("117032026", var_110_21)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_117032", "117032026", "story_v_out_117032.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_117032", "117032026", "story_v_out_117032.awb")
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
	Play117032027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 117032027
		arg_111_1.duration_ = 6.166

		local var_111_0 = {
			zh = 1.333,
			ja = 6.166
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
				arg_111_0:Play117032028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1132"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.actorSpriteComps1132 == nil then
				arg_111_1.var_.actorSpriteComps1132 = var_114_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_2 = 0.2

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.actorSpriteComps1132 then
					for iter_114_0, iter_114_1 in pairs(arg_111_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_114_1 then
							local var_114_4 = Mathf.Lerp(iter_114_1.color.r, 1, var_114_3)

							iter_114_1.color = Color.New(var_114_4, var_114_4, var_114_4)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.actorSpriteComps1132 then
				local var_114_5 = 1

				for iter_114_2, iter_114_3 in pairs(arg_111_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_114_3 then
						iter_114_3.color = Color.New(var_114_5, var_114_5, var_114_5)
					end
				end

				arg_111_1.var_.actorSpriteComps1132 = nil
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
			local var_114_13 = 0.125

			if var_114_12 < arg_111_1.time_ and arg_111_1.time_ <= var_114_12 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_14 = arg_111_1:FormatText(StoryNameCfg[61].name)

				arg_111_1.leftNameTxt_.text = var_114_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_15 = arg_111_1:GetWordFromCfg(117032027)
				local var_114_16 = arg_111_1:FormatText(var_114_15.content)

				arg_111_1.text_.text = var_114_16

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_17 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032027", "story_v_out_117032.awb") ~= 0 then
					local var_114_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032027", "story_v_out_117032.awb") / 1000

					if var_114_20 + var_114_12 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_20 + var_114_12
					end

					if var_114_15.prefab_name ~= "" and arg_111_1.actors_[var_114_15.prefab_name] ~= nil then
						local var_114_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_15.prefab_name].transform, "story_v_out_117032", "117032027", "story_v_out_117032.awb")

						arg_111_1:RecordAudio("117032027", var_114_21)
						arg_111_1:RecordAudio("117032027", var_114_21)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_117032", "117032027", "story_v_out_117032.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_117032", "117032027", "story_v_out_117032.awb")
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
	Play117032028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 117032028
		arg_115_1.duration_ = 2.666

		local var_115_0 = {
			zh = 1.133,
			ja = 2.666
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
				arg_115_0:Play117032029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1132"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.actorSpriteComps1132 == nil then
				arg_115_1.var_.actorSpriteComps1132 = var_118_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_2 = 0.2

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.actorSpriteComps1132 then
					for iter_118_0, iter_118_1 in pairs(arg_115_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_118_1 then
							local var_118_4 = Mathf.Lerp(iter_118_1.color.r, 0.5, var_118_3)

							iter_118_1.color = Color.New(var_118_4, var_118_4, var_118_4)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.actorSpriteComps1132 then
				local var_118_5 = 0.5

				for iter_118_2, iter_118_3 in pairs(arg_115_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_118_3 then
						iter_118_3.color = Color.New(var_118_5, var_118_5, var_118_5)
					end
				end

				arg_115_1.var_.actorSpriteComps1132 = nil
			end

			local var_118_6 = arg_115_1.actors_["1033"]
			local var_118_7 = 0

			if var_118_7 < arg_115_1.time_ and arg_115_1.time_ <= var_118_7 + arg_118_0 and arg_115_1.var_.actorSpriteComps1033 == nil then
				arg_115_1.var_.actorSpriteComps1033 = var_118_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_8 = 0.2

			if var_118_7 <= arg_115_1.time_ and arg_115_1.time_ < var_118_7 + var_118_8 then
				local var_118_9 = (arg_115_1.time_ - var_118_7) / var_118_8

				if arg_115_1.var_.actorSpriteComps1033 then
					for iter_118_4, iter_118_5 in pairs(arg_115_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_118_5 then
							local var_118_10 = Mathf.Lerp(iter_118_5.color.r, 1, var_118_9)

							iter_118_5.color = Color.New(var_118_10, var_118_10, var_118_10)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_7 + var_118_8 and arg_115_1.time_ < var_118_7 + var_118_8 + arg_118_0 and arg_115_1.var_.actorSpriteComps1033 then
				local var_118_11 = 1

				for iter_118_6, iter_118_7 in pairs(arg_115_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_118_7 then
						iter_118_7.color = Color.New(var_118_11, var_118_11, var_118_11)
					end
				end

				arg_115_1.var_.actorSpriteComps1033 = nil
			end

			local var_118_12 = arg_115_1.actors_["1033"].transform
			local var_118_13 = 0

			if var_118_13 < arg_115_1.time_ and arg_115_1.time_ <= var_118_13 + arg_118_0 then
				arg_115_1.var_.moveOldPos1033 = var_118_12.localPosition
				var_118_12.localScale = Vector3.New(1, 1, 1)

				arg_115_1:CheckSpriteTmpPos("1033", 4)

				local var_118_14 = var_118_12.childCount

				for iter_118_8 = 0, var_118_14 - 1 do
					local var_118_15 = var_118_12:GetChild(iter_118_8)

					if var_118_15.name == "split_4" or not string.find(var_118_15.name, "split") then
						var_118_15.gameObject:SetActive(true)
					else
						var_118_15.gameObject:SetActive(false)
					end
				end
			end

			local var_118_16 = 0.001

			if var_118_13 <= arg_115_1.time_ and arg_115_1.time_ < var_118_13 + var_118_16 then
				local var_118_17 = (arg_115_1.time_ - var_118_13) / var_118_16
				local var_118_18 = Vector3.New(390, -420, 0)

				var_118_12.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1033, var_118_18, var_118_17)
			end

			if arg_115_1.time_ >= var_118_13 + var_118_16 and arg_115_1.time_ < var_118_13 + var_118_16 + arg_118_0 then
				var_118_12.localPosition = Vector3.New(390, -420, 0)
			end

			local var_118_19 = 0
			local var_118_20 = 0.15

			if var_118_19 < arg_115_1.time_ and arg_115_1.time_ <= var_118_19 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_21 = arg_115_1:FormatText(StoryNameCfg[236].name)

				arg_115_1.leftNameTxt_.text = var_118_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_22 = arg_115_1:GetWordFromCfg(117032028)
				local var_118_23 = arg_115_1:FormatText(var_118_22.content)

				arg_115_1.text_.text = var_118_23

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_24 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032028", "story_v_out_117032.awb") ~= 0 then
					local var_118_27 = manager.audio:GetVoiceLength("story_v_out_117032", "117032028", "story_v_out_117032.awb") / 1000

					if var_118_27 + var_118_19 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_27 + var_118_19
					end

					if var_118_22.prefab_name ~= "" and arg_115_1.actors_[var_118_22.prefab_name] ~= nil then
						local var_118_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_22.prefab_name].transform, "story_v_out_117032", "117032028", "story_v_out_117032.awb")

						arg_115_1:RecordAudio("117032028", var_118_28)
						arg_115_1:RecordAudio("117032028", var_118_28)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_117032", "117032028", "story_v_out_117032.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_117032", "117032028", "story_v_out_117032.awb")
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
	Play117032029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 117032029
		arg_119_1.duration_ = 10.333

		local var_119_0 = {
			zh = 8.5,
			ja = 10.333
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
				arg_119_0:Play117032030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1132"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.actorSpriteComps1132 == nil then
				arg_119_1.var_.actorSpriteComps1132 = var_122_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_2 = 0.2

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.actorSpriteComps1132 then
					for iter_122_0, iter_122_1 in pairs(arg_119_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_122_1 then
							local var_122_4 = Mathf.Lerp(iter_122_1.color.r, 1, var_122_3)

							iter_122_1.color = Color.New(var_122_4, var_122_4, var_122_4)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.actorSpriteComps1132 then
				local var_122_5 = 1

				for iter_122_2, iter_122_3 in pairs(arg_119_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_122_3 then
						iter_122_3.color = Color.New(var_122_5, var_122_5, var_122_5)
					end
				end

				arg_119_1.var_.actorSpriteComps1132 = nil
			end

			local var_122_6 = arg_119_1.actors_["1033"]
			local var_122_7 = 0

			if var_122_7 < arg_119_1.time_ and arg_119_1.time_ <= var_122_7 + arg_122_0 and arg_119_1.var_.actorSpriteComps1033 == nil then
				arg_119_1.var_.actorSpriteComps1033 = var_122_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_8 = 0.2

			if var_122_7 <= arg_119_1.time_ and arg_119_1.time_ < var_122_7 + var_122_8 then
				local var_122_9 = (arg_119_1.time_ - var_122_7) / var_122_8

				if arg_119_1.var_.actorSpriteComps1033 then
					for iter_122_4, iter_122_5 in pairs(arg_119_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_122_5 then
							local var_122_10 = Mathf.Lerp(iter_122_5.color.r, 0.5, var_122_9)

							iter_122_5.color = Color.New(var_122_10, var_122_10, var_122_10)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_7 + var_122_8 and arg_119_1.time_ < var_122_7 + var_122_8 + arg_122_0 and arg_119_1.var_.actorSpriteComps1033 then
				local var_122_11 = 0.5

				for iter_122_6, iter_122_7 in pairs(arg_119_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_122_7 then
						iter_122_7.color = Color.New(var_122_11, var_122_11, var_122_11)
					end
				end

				arg_119_1.var_.actorSpriteComps1033 = nil
			end

			local var_122_12 = 0
			local var_122_13 = 1.15

			if var_122_12 < arg_119_1.time_ and arg_119_1.time_ <= var_122_12 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_14 = arg_119_1:FormatText(StoryNameCfg[61].name)

				arg_119_1.leftNameTxt_.text = var_122_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_15 = arg_119_1:GetWordFromCfg(117032029)
				local var_122_16 = arg_119_1:FormatText(var_122_15.content)

				arg_119_1.text_.text = var_122_16

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_17 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032029", "story_v_out_117032.awb") ~= 0 then
					local var_122_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032029", "story_v_out_117032.awb") / 1000

					if var_122_20 + var_122_12 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_20 + var_122_12
					end

					if var_122_15.prefab_name ~= "" and arg_119_1.actors_[var_122_15.prefab_name] ~= nil then
						local var_122_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_15.prefab_name].transform, "story_v_out_117032", "117032029", "story_v_out_117032.awb")

						arg_119_1:RecordAudio("117032029", var_122_21)
						arg_119_1:RecordAudio("117032029", var_122_21)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_117032", "117032029", "story_v_out_117032.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_117032", "117032029", "story_v_out_117032.awb")
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
	Play117032030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 117032030
		arg_123_1.duration_ = 7.133

		local var_123_0 = {
			zh = 4,
			ja = 7.133
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
				arg_123_0:Play117032031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1132"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.actorSpriteComps1132 == nil then
				arg_123_1.var_.actorSpriteComps1132 = var_126_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_2 = 0.2

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.actorSpriteComps1132 then
					for iter_126_0, iter_126_1 in pairs(arg_123_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_126_1 then
							local var_126_4 = Mathf.Lerp(iter_126_1.color.r, 0.5, var_126_3)

							iter_126_1.color = Color.New(var_126_4, var_126_4, var_126_4)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.actorSpriteComps1132 then
				local var_126_5 = 0.5

				for iter_126_2, iter_126_3 in pairs(arg_123_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_126_3 then
						iter_126_3.color = Color.New(var_126_5, var_126_5, var_126_5)
					end
				end

				arg_123_1.var_.actorSpriteComps1132 = nil
			end

			local var_126_6 = arg_123_1.actors_["1033"]
			local var_126_7 = 0

			if var_126_7 < arg_123_1.time_ and arg_123_1.time_ <= var_126_7 + arg_126_0 and arg_123_1.var_.actorSpriteComps1033 == nil then
				arg_123_1.var_.actorSpriteComps1033 = var_126_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_8 = 0.2

			if var_126_7 <= arg_123_1.time_ and arg_123_1.time_ < var_126_7 + var_126_8 then
				local var_126_9 = (arg_123_1.time_ - var_126_7) / var_126_8

				if arg_123_1.var_.actorSpriteComps1033 then
					for iter_126_4, iter_126_5 in pairs(arg_123_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_126_5 then
							local var_126_10 = Mathf.Lerp(iter_126_5.color.r, 1, var_126_9)

							iter_126_5.color = Color.New(var_126_10, var_126_10, var_126_10)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_7 + var_126_8 and arg_123_1.time_ < var_126_7 + var_126_8 + arg_126_0 and arg_123_1.var_.actorSpriteComps1033 then
				local var_126_11 = 1

				for iter_126_6, iter_126_7 in pairs(arg_123_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_126_7 then
						iter_126_7.color = Color.New(var_126_11, var_126_11, var_126_11)
					end
				end

				arg_123_1.var_.actorSpriteComps1033 = nil
			end

			local var_126_12 = arg_123_1.actors_["1033"].transform
			local var_126_13 = 0

			if var_126_13 < arg_123_1.time_ and arg_123_1.time_ <= var_126_13 + arg_126_0 then
				arg_123_1.var_.moveOldPos1033 = var_126_12.localPosition
				var_126_12.localScale = Vector3.New(1, 1, 1)

				arg_123_1:CheckSpriteTmpPos("1033", 4)

				local var_126_14 = var_126_12.childCount

				for iter_126_8 = 0, var_126_14 - 1 do
					local var_126_15 = var_126_12:GetChild(iter_126_8)

					if var_126_15.name == "split_6" or not string.find(var_126_15.name, "split") then
						var_126_15.gameObject:SetActive(true)
					else
						var_126_15.gameObject:SetActive(false)
					end
				end
			end

			local var_126_16 = 0.001

			if var_126_13 <= arg_123_1.time_ and arg_123_1.time_ < var_126_13 + var_126_16 then
				local var_126_17 = (arg_123_1.time_ - var_126_13) / var_126_16
				local var_126_18 = Vector3.New(390, -420, 0)

				var_126_12.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1033, var_126_18, var_126_17)
			end

			if arg_123_1.time_ >= var_126_13 + var_126_16 and arg_123_1.time_ < var_126_13 + var_126_16 + arg_126_0 then
				var_126_12.localPosition = Vector3.New(390, -420, 0)
			end

			local var_126_19 = 0
			local var_126_20 = 0.375

			if var_126_19 < arg_123_1.time_ and arg_123_1.time_ <= var_126_19 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_21 = arg_123_1:FormatText(StoryNameCfg[236].name)

				arg_123_1.leftNameTxt_.text = var_126_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_22 = arg_123_1:GetWordFromCfg(117032030)
				local var_126_23 = arg_123_1:FormatText(var_126_22.content)

				arg_123_1.text_.text = var_126_23

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_24 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032030", "story_v_out_117032.awb") ~= 0 then
					local var_126_27 = manager.audio:GetVoiceLength("story_v_out_117032", "117032030", "story_v_out_117032.awb") / 1000

					if var_126_27 + var_126_19 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_27 + var_126_19
					end

					if var_126_22.prefab_name ~= "" and arg_123_1.actors_[var_126_22.prefab_name] ~= nil then
						local var_126_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_22.prefab_name].transform, "story_v_out_117032", "117032030", "story_v_out_117032.awb")

						arg_123_1:RecordAudio("117032030", var_126_28)
						arg_123_1:RecordAudio("117032030", var_126_28)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_117032", "117032030", "story_v_out_117032.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_117032", "117032030", "story_v_out_117032.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_29 = math.max(var_126_20, arg_123_1.talkMaxDuration)

			if var_126_19 <= arg_123_1.time_ and arg_123_1.time_ < var_126_19 + var_126_29 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_19) / var_126_29

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_19 + var_126_29 and arg_123_1.time_ < var_126_19 + var_126_29 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play117032031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 117032031
		arg_127_1.duration_ = 7

		local var_127_0 = {
			zh = 7,
			ja = 6.5
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
				arg_127_0:Play117032032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.85

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_2 = arg_127_1:FormatText(StoryNameCfg[236].name)

				arg_127_1.leftNameTxt_.text = var_130_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_3 = arg_127_1:GetWordFromCfg(117032031)
				local var_130_4 = arg_127_1:FormatText(var_130_3.content)

				arg_127_1.text_.text = var_130_4

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_5 = 34
				local var_130_6 = utf8.len(var_130_4)
				local var_130_7 = var_130_5 <= 0 and var_130_1 or var_130_1 * (var_130_6 / var_130_5)

				if var_130_7 > 0 and var_130_1 < var_130_7 then
					arg_127_1.talkMaxDuration = var_130_7

					if var_130_7 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_7 + var_130_0
					end
				end

				arg_127_1.text_.text = var_130_4
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032031", "story_v_out_117032.awb") ~= 0 then
					local var_130_8 = manager.audio:GetVoiceLength("story_v_out_117032", "117032031", "story_v_out_117032.awb") / 1000

					if var_130_8 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_0
					end

					if var_130_3.prefab_name ~= "" and arg_127_1.actors_[var_130_3.prefab_name] ~= nil then
						local var_130_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_3.prefab_name].transform, "story_v_out_117032", "117032031", "story_v_out_117032.awb")

						arg_127_1:RecordAudio("117032031", var_130_9)
						arg_127_1:RecordAudio("117032031", var_130_9)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_117032", "117032031", "story_v_out_117032.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_117032", "117032031", "story_v_out_117032.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_10 = math.max(var_130_1, arg_127_1.talkMaxDuration)

			if var_130_0 <= arg_127_1.time_ and arg_127_1.time_ < var_130_0 + var_130_10 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_0) / var_130_10

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_0 + var_130_10 and arg_127_1.time_ < var_130_0 + var_130_10 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play117032032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 117032032
		arg_131_1.duration_ = 4.366

		local var_131_0 = {
			zh = 2.066,
			ja = 4.366
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
				arg_131_0:Play117032033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 0.275

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_2 = arg_131_1:FormatText(StoryNameCfg[236].name)

				arg_131_1.leftNameTxt_.text = var_134_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_3 = arg_131_1:GetWordFromCfg(117032032)
				local var_134_4 = arg_131_1:FormatText(var_134_3.content)

				arg_131_1.text_.text = var_134_4

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_5 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032032", "story_v_out_117032.awb") ~= 0 then
					local var_134_8 = manager.audio:GetVoiceLength("story_v_out_117032", "117032032", "story_v_out_117032.awb") / 1000

					if var_134_8 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_8 + var_134_0
					end

					if var_134_3.prefab_name ~= "" and arg_131_1.actors_[var_134_3.prefab_name] ~= nil then
						local var_134_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_3.prefab_name].transform, "story_v_out_117032", "117032032", "story_v_out_117032.awb")

						arg_131_1:RecordAudio("117032032", var_134_9)
						arg_131_1:RecordAudio("117032032", var_134_9)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_117032", "117032032", "story_v_out_117032.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_117032", "117032032", "story_v_out_117032.awb")
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
	Play117032033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 117032033
		arg_135_1.duration_ = 3.666

		local var_135_0 = {
			zh = 1.033,
			ja = 3.666
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
				arg_135_0:Play117032034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1132"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.actorSpriteComps1132 == nil then
				arg_135_1.var_.actorSpriteComps1132 = var_138_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_138_2 = 0.2

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.actorSpriteComps1132 then
					for iter_138_0, iter_138_1 in pairs(arg_135_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_138_1 then
							local var_138_4 = Mathf.Lerp(iter_138_1.color.r, 1, var_138_3)

							iter_138_1.color = Color.New(var_138_4, var_138_4, var_138_4)
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.actorSpriteComps1132 then
				local var_138_5 = 1

				for iter_138_2, iter_138_3 in pairs(arg_135_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_138_3 then
						iter_138_3.color = Color.New(var_138_5, var_138_5, var_138_5)
					end
				end

				arg_135_1.var_.actorSpriteComps1132 = nil
			end

			local var_138_6 = arg_135_1.actors_["1033"]
			local var_138_7 = 0

			if var_138_7 < arg_135_1.time_ and arg_135_1.time_ <= var_138_7 + arg_138_0 and arg_135_1.var_.actorSpriteComps1033 == nil then
				arg_135_1.var_.actorSpriteComps1033 = var_138_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_138_8 = 0.2

			if var_138_7 <= arg_135_1.time_ and arg_135_1.time_ < var_138_7 + var_138_8 then
				local var_138_9 = (arg_135_1.time_ - var_138_7) / var_138_8

				if arg_135_1.var_.actorSpriteComps1033 then
					for iter_138_4, iter_138_5 in pairs(arg_135_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_138_5 then
							local var_138_10 = Mathf.Lerp(iter_138_5.color.r, 0.5, var_138_9)

							iter_138_5.color = Color.New(var_138_10, var_138_10, var_138_10)
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_7 + var_138_8 and arg_135_1.time_ < var_138_7 + var_138_8 + arg_138_0 and arg_135_1.var_.actorSpriteComps1033 then
				local var_138_11 = 0.5

				for iter_138_6, iter_138_7 in pairs(arg_135_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_138_7 then
						iter_138_7.color = Color.New(var_138_11, var_138_11, var_138_11)
					end
				end

				arg_135_1.var_.actorSpriteComps1033 = nil
			end

			local var_138_12 = 0
			local var_138_13 = 0.125

			if var_138_12 < arg_135_1.time_ and arg_135_1.time_ <= var_138_12 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_14 = arg_135_1:FormatText(StoryNameCfg[61].name)

				arg_135_1.leftNameTxt_.text = var_138_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_15 = arg_135_1:GetWordFromCfg(117032033)
				local var_138_16 = arg_135_1:FormatText(var_138_15.content)

				arg_135_1.text_.text = var_138_16

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_17 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032033", "story_v_out_117032.awb") ~= 0 then
					local var_138_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032033", "story_v_out_117032.awb") / 1000

					if var_138_20 + var_138_12 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_20 + var_138_12
					end

					if var_138_15.prefab_name ~= "" and arg_135_1.actors_[var_138_15.prefab_name] ~= nil then
						local var_138_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_15.prefab_name].transform, "story_v_out_117032", "117032033", "story_v_out_117032.awb")

						arg_135_1:RecordAudio("117032033", var_138_21)
						arg_135_1:RecordAudio("117032033", var_138_21)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_117032", "117032033", "story_v_out_117032.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_117032", "117032033", "story_v_out_117032.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_22 = math.max(var_138_13, arg_135_1.talkMaxDuration)

			if var_138_12 <= arg_135_1.time_ and arg_135_1.time_ < var_138_12 + var_138_22 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_12) / var_138_22

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_12 + var_138_22 and arg_135_1.time_ < var_138_12 + var_138_22 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play117032034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 117032034
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play117032035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1132"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.actorSpriteComps1132 == nil then
				arg_139_1.var_.actorSpriteComps1132 = var_142_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_142_2 = 0.2

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.actorSpriteComps1132 then
					for iter_142_0, iter_142_1 in pairs(arg_139_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_142_1 then
							local var_142_4 = Mathf.Lerp(iter_142_1.color.r, 0.5, var_142_3)

							iter_142_1.color = Color.New(var_142_4, var_142_4, var_142_4)
						end
					end
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.actorSpriteComps1132 then
				local var_142_5 = 0.5

				for iter_142_2, iter_142_3 in pairs(arg_139_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_142_3 then
						iter_142_3.color = Color.New(var_142_5, var_142_5, var_142_5)
					end
				end

				arg_139_1.var_.actorSpriteComps1132 = nil
			end

			local var_142_6 = 0
			local var_142_7 = 0.95

			if var_142_6 < arg_139_1.time_ and arg_139_1.time_ <= var_142_6 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, false)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_8 = arg_139_1:GetWordFromCfg(117032034)
				local var_142_9 = arg_139_1:FormatText(var_142_8.content)

				arg_139_1.text_.text = var_142_9

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_10 = 38
				local var_142_11 = utf8.len(var_142_9)
				local var_142_12 = var_142_10 <= 0 and var_142_7 or var_142_7 * (var_142_11 / var_142_10)

				if var_142_12 > 0 and var_142_7 < var_142_12 then
					arg_139_1.talkMaxDuration = var_142_12

					if var_142_12 + var_142_6 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_12 + var_142_6
					end
				end

				arg_139_1.text_.text = var_142_9
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_13 = math.max(var_142_7, arg_139_1.talkMaxDuration)

			if var_142_6 <= arg_139_1.time_ and arg_139_1.time_ < var_142_6 + var_142_13 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_6) / var_142_13

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_6 + var_142_13 and arg_139_1.time_ < var_142_6 + var_142_13 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play117032035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 117032035
		arg_143_1.duration_ = 6.3

		local var_143_0 = {
			zh = 2.566,
			ja = 6.3
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
				arg_143_0:Play117032036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1132"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.actorSpriteComps1132 == nil then
				arg_143_1.var_.actorSpriteComps1132 = var_146_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_146_2 = 0.2

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.actorSpriteComps1132 then
					for iter_146_0, iter_146_1 in pairs(arg_143_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_146_1 then
							local var_146_4 = Mathf.Lerp(iter_146_1.color.r, 1, var_146_3)

							iter_146_1.color = Color.New(var_146_4, var_146_4, var_146_4)
						end
					end
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.actorSpriteComps1132 then
				local var_146_5 = 1

				for iter_146_2, iter_146_3 in pairs(arg_143_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_146_3 then
						iter_146_3.color = Color.New(var_146_5, var_146_5, var_146_5)
					end
				end

				arg_143_1.var_.actorSpriteComps1132 = nil
			end

			local var_146_6 = 0
			local var_146_7 = 0.35

			if var_146_6 < arg_143_1.time_ and arg_143_1.time_ <= var_146_6 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_8 = arg_143_1:FormatText(StoryNameCfg[61].name)

				arg_143_1.leftNameTxt_.text = var_146_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_9 = arg_143_1:GetWordFromCfg(117032035)
				local var_146_10 = arg_143_1:FormatText(var_146_9.content)

				arg_143_1.text_.text = var_146_10

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_11 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032035", "story_v_out_117032.awb") ~= 0 then
					local var_146_14 = manager.audio:GetVoiceLength("story_v_out_117032", "117032035", "story_v_out_117032.awb") / 1000

					if var_146_14 + var_146_6 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_14 + var_146_6
					end

					if var_146_9.prefab_name ~= "" and arg_143_1.actors_[var_146_9.prefab_name] ~= nil then
						local var_146_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_9.prefab_name].transform, "story_v_out_117032", "117032035", "story_v_out_117032.awb")

						arg_143_1:RecordAudio("117032035", var_146_15)
						arg_143_1:RecordAudio("117032035", var_146_15)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_117032", "117032035", "story_v_out_117032.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_117032", "117032035", "story_v_out_117032.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_16 = math.max(var_146_7, arg_143_1.talkMaxDuration)

			if var_146_6 <= arg_143_1.time_ and arg_143_1.time_ < var_146_6 + var_146_16 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_6) / var_146_16

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_6 + var_146_16 and arg_143_1.time_ < var_146_6 + var_146_16 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play117032036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 117032036
		arg_147_1.duration_ = 9.3

		local var_147_0 = {
			zh = 8.133,
			ja = 9.3
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
				arg_147_0:Play117032037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 1.1

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_2 = arg_147_1:FormatText(StoryNameCfg[61].name)

				arg_147_1.leftNameTxt_.text = var_150_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_3 = arg_147_1:GetWordFromCfg(117032036)
				local var_150_4 = arg_147_1:FormatText(var_150_3.content)

				arg_147_1.text_.text = var_150_4

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_5 = 44
				local var_150_6 = utf8.len(var_150_4)
				local var_150_7 = var_150_5 <= 0 and var_150_1 or var_150_1 * (var_150_6 / var_150_5)

				if var_150_7 > 0 and var_150_1 < var_150_7 then
					arg_147_1.talkMaxDuration = var_150_7

					if var_150_7 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_7 + var_150_0
					end
				end

				arg_147_1.text_.text = var_150_4
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032036", "story_v_out_117032.awb") ~= 0 then
					local var_150_8 = manager.audio:GetVoiceLength("story_v_out_117032", "117032036", "story_v_out_117032.awb") / 1000

					if var_150_8 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_8 + var_150_0
					end

					if var_150_3.prefab_name ~= "" and arg_147_1.actors_[var_150_3.prefab_name] ~= nil then
						local var_150_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_3.prefab_name].transform, "story_v_out_117032", "117032036", "story_v_out_117032.awb")

						arg_147_1:RecordAudio("117032036", var_150_9)
						arg_147_1:RecordAudio("117032036", var_150_9)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_117032", "117032036", "story_v_out_117032.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_117032", "117032036", "story_v_out_117032.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_10 = math.max(var_150_1, arg_147_1.talkMaxDuration)

			if var_150_0 <= arg_147_1.time_ and arg_147_1.time_ < var_150_0 + var_150_10 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_0) / var_150_10

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_0 + var_150_10 and arg_147_1.time_ < var_150_0 + var_150_10 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play117032037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 117032037
		arg_151_1.duration_ = 9.866

		local var_151_0 = {
			zh = 5.8,
			ja = 9.866
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
				arg_151_0:Play117032038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1132"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.actorSpriteComps1132 == nil then
				arg_151_1.var_.actorSpriteComps1132 = var_154_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_2 = 0.2

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.actorSpriteComps1132 then
					for iter_154_0, iter_154_1 in pairs(arg_151_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_154_1 then
							local var_154_4 = Mathf.Lerp(iter_154_1.color.r, 0.5, var_154_3)

							iter_154_1.color = Color.New(var_154_4, var_154_4, var_154_4)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.actorSpriteComps1132 then
				local var_154_5 = 0.5

				for iter_154_2, iter_154_3 in pairs(arg_151_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_154_3 then
						iter_154_3.color = Color.New(var_154_5, var_154_5, var_154_5)
					end
				end

				arg_151_1.var_.actorSpriteComps1132 = nil
			end

			local var_154_6 = arg_151_1.actors_["1033"]
			local var_154_7 = 0

			if var_154_7 < arg_151_1.time_ and arg_151_1.time_ <= var_154_7 + arg_154_0 and arg_151_1.var_.actorSpriteComps1033 == nil then
				arg_151_1.var_.actorSpriteComps1033 = var_154_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_8 = 0.2

			if var_154_7 <= arg_151_1.time_ and arg_151_1.time_ < var_154_7 + var_154_8 then
				local var_154_9 = (arg_151_1.time_ - var_154_7) / var_154_8

				if arg_151_1.var_.actorSpriteComps1033 then
					for iter_154_4, iter_154_5 in pairs(arg_151_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_154_5 then
							local var_154_10 = Mathf.Lerp(iter_154_5.color.r, 1, var_154_9)

							iter_154_5.color = Color.New(var_154_10, var_154_10, var_154_10)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_7 + var_154_8 and arg_151_1.time_ < var_154_7 + var_154_8 + arg_154_0 and arg_151_1.var_.actorSpriteComps1033 then
				local var_154_11 = 1

				for iter_154_6, iter_154_7 in pairs(arg_151_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_154_7 then
						iter_154_7.color = Color.New(var_154_11, var_154_11, var_154_11)
					end
				end

				arg_151_1.var_.actorSpriteComps1033 = nil
			end

			local var_154_12 = 0
			local var_154_13 = 0.7

			if var_154_12 < arg_151_1.time_ and arg_151_1.time_ <= var_154_12 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_14 = arg_151_1:FormatText(StoryNameCfg[236].name)

				arg_151_1.leftNameTxt_.text = var_154_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_15 = arg_151_1:GetWordFromCfg(117032037)
				local var_154_16 = arg_151_1:FormatText(var_154_15.content)

				arg_151_1.text_.text = var_154_16

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_17 = 28
				local var_154_18 = utf8.len(var_154_16)
				local var_154_19 = var_154_17 <= 0 and var_154_13 or var_154_13 * (var_154_18 / var_154_17)

				if var_154_19 > 0 and var_154_13 < var_154_19 then
					arg_151_1.talkMaxDuration = var_154_19

					if var_154_19 + var_154_12 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_19 + var_154_12
					end
				end

				arg_151_1.text_.text = var_154_16
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032037", "story_v_out_117032.awb") ~= 0 then
					local var_154_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032037", "story_v_out_117032.awb") / 1000

					if var_154_20 + var_154_12 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_20 + var_154_12
					end

					if var_154_15.prefab_name ~= "" and arg_151_1.actors_[var_154_15.prefab_name] ~= nil then
						local var_154_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_15.prefab_name].transform, "story_v_out_117032", "117032037", "story_v_out_117032.awb")

						arg_151_1:RecordAudio("117032037", var_154_21)
						arg_151_1:RecordAudio("117032037", var_154_21)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_117032", "117032037", "story_v_out_117032.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_117032", "117032037", "story_v_out_117032.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_22 = math.max(var_154_13, arg_151_1.talkMaxDuration)

			if var_154_12 <= arg_151_1.time_ and arg_151_1.time_ < var_154_12 + var_154_22 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_12) / var_154_22

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_12 + var_154_22 and arg_151_1.time_ < var_154_12 + var_154_22 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play117032038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 117032038
		arg_155_1.duration_ = 9.9

		local var_155_0 = {
			zh = 4.566,
			ja = 9.9
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
				arg_155_0:Play117032039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1132"]
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 and arg_155_1.var_.actorSpriteComps1132 == nil then
				arg_155_1.var_.actorSpriteComps1132 = var_158_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_2 = 0.2

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2

				if arg_155_1.var_.actorSpriteComps1132 then
					for iter_158_0, iter_158_1 in pairs(arg_155_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_158_1 then
							local var_158_4 = Mathf.Lerp(iter_158_1.color.r, 1, var_158_3)

							iter_158_1.color = Color.New(var_158_4, var_158_4, var_158_4)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 and arg_155_1.var_.actorSpriteComps1132 then
				local var_158_5 = 1

				for iter_158_2, iter_158_3 in pairs(arg_155_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_158_3 then
						iter_158_3.color = Color.New(var_158_5, var_158_5, var_158_5)
					end
				end

				arg_155_1.var_.actorSpriteComps1132 = nil
			end

			local var_158_6 = arg_155_1.actors_["1033"]
			local var_158_7 = 0

			if var_158_7 < arg_155_1.time_ and arg_155_1.time_ <= var_158_7 + arg_158_0 and arg_155_1.var_.actorSpriteComps1033 == nil then
				arg_155_1.var_.actorSpriteComps1033 = var_158_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_8 = 0.2

			if var_158_7 <= arg_155_1.time_ and arg_155_1.time_ < var_158_7 + var_158_8 then
				local var_158_9 = (arg_155_1.time_ - var_158_7) / var_158_8

				if arg_155_1.var_.actorSpriteComps1033 then
					for iter_158_4, iter_158_5 in pairs(arg_155_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_158_5 then
							local var_158_10 = Mathf.Lerp(iter_158_5.color.r, 0.5, var_158_9)

							iter_158_5.color = Color.New(var_158_10, var_158_10, var_158_10)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_7 + var_158_8 and arg_155_1.time_ < var_158_7 + var_158_8 + arg_158_0 and arg_155_1.var_.actorSpriteComps1033 then
				local var_158_11 = 0.5

				for iter_158_6, iter_158_7 in pairs(arg_155_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_158_7 then
						iter_158_7.color = Color.New(var_158_11, var_158_11, var_158_11)
					end
				end

				arg_155_1.var_.actorSpriteComps1033 = nil
			end

			local var_158_12 = 0
			local var_158_13 = 0.5

			if var_158_12 < arg_155_1.time_ and arg_155_1.time_ <= var_158_12 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_14 = arg_155_1:FormatText(StoryNameCfg[61].name)

				arg_155_1.leftNameTxt_.text = var_158_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_15 = arg_155_1:GetWordFromCfg(117032038)
				local var_158_16 = arg_155_1:FormatText(var_158_15.content)

				arg_155_1.text_.text = var_158_16

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_17 = 20
				local var_158_18 = utf8.len(var_158_16)
				local var_158_19 = var_158_17 <= 0 and var_158_13 or var_158_13 * (var_158_18 / var_158_17)

				if var_158_19 > 0 and var_158_13 < var_158_19 then
					arg_155_1.talkMaxDuration = var_158_19

					if var_158_19 + var_158_12 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_19 + var_158_12
					end
				end

				arg_155_1.text_.text = var_158_16
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032038", "story_v_out_117032.awb") ~= 0 then
					local var_158_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032038", "story_v_out_117032.awb") / 1000

					if var_158_20 + var_158_12 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_20 + var_158_12
					end

					if var_158_15.prefab_name ~= "" and arg_155_1.actors_[var_158_15.prefab_name] ~= nil then
						local var_158_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_15.prefab_name].transform, "story_v_out_117032", "117032038", "story_v_out_117032.awb")

						arg_155_1:RecordAudio("117032038", var_158_21)
						arg_155_1:RecordAudio("117032038", var_158_21)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_117032", "117032038", "story_v_out_117032.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_117032", "117032038", "story_v_out_117032.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_22 = math.max(var_158_13, arg_155_1.talkMaxDuration)

			if var_158_12 <= arg_155_1.time_ and arg_155_1.time_ < var_158_12 + var_158_22 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_12) / var_158_22

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_12 + var_158_22 and arg_155_1.time_ < var_158_12 + var_158_22 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play117032039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 117032039
		arg_159_1.duration_ = 15.966

		local var_159_0 = {
			zh = 12.1,
			ja = 15.966
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
				arg_159_0:Play117032040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1132"]
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 and arg_159_1.var_.actorSpriteComps1132 == nil then
				arg_159_1.var_.actorSpriteComps1132 = var_162_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_162_2 = 0.2

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2

				if arg_159_1.var_.actorSpriteComps1132 then
					for iter_162_0, iter_162_1 in pairs(arg_159_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_162_1 then
							local var_162_4 = Mathf.Lerp(iter_162_1.color.r, 0.5, var_162_3)

							iter_162_1.color = Color.New(var_162_4, var_162_4, var_162_4)
						end
					end
				end
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 and arg_159_1.var_.actorSpriteComps1132 then
				local var_162_5 = 0.5

				for iter_162_2, iter_162_3 in pairs(arg_159_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_162_3 then
						iter_162_3.color = Color.New(var_162_5, var_162_5, var_162_5)
					end
				end

				arg_159_1.var_.actorSpriteComps1132 = nil
			end

			local var_162_6 = arg_159_1.actors_["1033"]
			local var_162_7 = 0

			if var_162_7 < arg_159_1.time_ and arg_159_1.time_ <= var_162_7 + arg_162_0 and arg_159_1.var_.actorSpriteComps1033 == nil then
				arg_159_1.var_.actorSpriteComps1033 = var_162_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_162_8 = 0.2

			if var_162_7 <= arg_159_1.time_ and arg_159_1.time_ < var_162_7 + var_162_8 then
				local var_162_9 = (arg_159_1.time_ - var_162_7) / var_162_8

				if arg_159_1.var_.actorSpriteComps1033 then
					for iter_162_4, iter_162_5 in pairs(arg_159_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_162_5 then
							local var_162_10 = Mathf.Lerp(iter_162_5.color.r, 1, var_162_9)

							iter_162_5.color = Color.New(var_162_10, var_162_10, var_162_10)
						end
					end
				end
			end

			if arg_159_1.time_ >= var_162_7 + var_162_8 and arg_159_1.time_ < var_162_7 + var_162_8 + arg_162_0 and arg_159_1.var_.actorSpriteComps1033 then
				local var_162_11 = 1

				for iter_162_6, iter_162_7 in pairs(arg_159_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_162_7 then
						iter_162_7.color = Color.New(var_162_11, var_162_11, var_162_11)
					end
				end

				arg_159_1.var_.actorSpriteComps1033 = nil
			end

			local var_162_12 = 0
			local var_162_13 = 1.15

			if var_162_12 < arg_159_1.time_ and arg_159_1.time_ <= var_162_12 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_14 = arg_159_1:FormatText(StoryNameCfg[236].name)

				arg_159_1.leftNameTxt_.text = var_162_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_15 = arg_159_1:GetWordFromCfg(117032039)
				local var_162_16 = arg_159_1:FormatText(var_162_15.content)

				arg_159_1.text_.text = var_162_16

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_17 = 46
				local var_162_18 = utf8.len(var_162_16)
				local var_162_19 = var_162_17 <= 0 and var_162_13 or var_162_13 * (var_162_18 / var_162_17)

				if var_162_19 > 0 and var_162_13 < var_162_19 then
					arg_159_1.talkMaxDuration = var_162_19

					if var_162_19 + var_162_12 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_19 + var_162_12
					end
				end

				arg_159_1.text_.text = var_162_16
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032039", "story_v_out_117032.awb") ~= 0 then
					local var_162_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032039", "story_v_out_117032.awb") / 1000

					if var_162_20 + var_162_12 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_20 + var_162_12
					end

					if var_162_15.prefab_name ~= "" and arg_159_1.actors_[var_162_15.prefab_name] ~= nil then
						local var_162_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_15.prefab_name].transform, "story_v_out_117032", "117032039", "story_v_out_117032.awb")

						arg_159_1:RecordAudio("117032039", var_162_21)
						arg_159_1:RecordAudio("117032039", var_162_21)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_117032", "117032039", "story_v_out_117032.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_117032", "117032039", "story_v_out_117032.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_22 = math.max(var_162_13, arg_159_1.talkMaxDuration)

			if var_162_12 <= arg_159_1.time_ and arg_159_1.time_ < var_162_12 + var_162_22 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_12) / var_162_22

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_12 + var_162_22 and arg_159_1.time_ < var_162_12 + var_162_22 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play117032040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 117032040
		arg_163_1.duration_ = 7.066

		local var_163_0 = {
			zh = 7.066,
			ja = 4.533
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
				arg_163_0:Play117032041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 0.925

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_2 = arg_163_1:FormatText(StoryNameCfg[236].name)

				arg_163_1.leftNameTxt_.text = var_166_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_3 = arg_163_1:GetWordFromCfg(117032040)
				local var_166_4 = arg_163_1:FormatText(var_166_3.content)

				arg_163_1.text_.text = var_166_4

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_5 = 37
				local var_166_6 = utf8.len(var_166_4)
				local var_166_7 = var_166_5 <= 0 and var_166_1 or var_166_1 * (var_166_6 / var_166_5)

				if var_166_7 > 0 and var_166_1 < var_166_7 then
					arg_163_1.talkMaxDuration = var_166_7

					if var_166_7 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_7 + var_166_0
					end
				end

				arg_163_1.text_.text = var_166_4
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032040", "story_v_out_117032.awb") ~= 0 then
					local var_166_8 = manager.audio:GetVoiceLength("story_v_out_117032", "117032040", "story_v_out_117032.awb") / 1000

					if var_166_8 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_8 + var_166_0
					end

					if var_166_3.prefab_name ~= "" and arg_163_1.actors_[var_166_3.prefab_name] ~= nil then
						local var_166_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_3.prefab_name].transform, "story_v_out_117032", "117032040", "story_v_out_117032.awb")

						arg_163_1:RecordAudio("117032040", var_166_9)
						arg_163_1:RecordAudio("117032040", var_166_9)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_117032", "117032040", "story_v_out_117032.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_117032", "117032040", "story_v_out_117032.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_10 = math.max(var_166_1, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_10 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_0) / var_166_10

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_10 and arg_163_1.time_ < var_166_0 + var_166_10 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play117032041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 117032041
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play117032042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1033"]
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 and arg_167_1.var_.actorSpriteComps1033 == nil then
				arg_167_1.var_.actorSpriteComps1033 = var_170_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_2 = 0.2

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2

				if arg_167_1.var_.actorSpriteComps1033 then
					for iter_170_0, iter_170_1 in pairs(arg_167_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_170_1 then
							local var_170_4 = Mathf.Lerp(iter_170_1.color.r, 0.5, var_170_3)

							iter_170_1.color = Color.New(var_170_4, var_170_4, var_170_4)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 and arg_167_1.var_.actorSpriteComps1033 then
				local var_170_5 = 0.5

				for iter_170_2, iter_170_3 in pairs(arg_167_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_170_3 then
						iter_170_3.color = Color.New(var_170_5, var_170_5, var_170_5)
					end
				end

				arg_167_1.var_.actorSpriteComps1033 = nil
			end

			local var_170_6 = 0
			local var_170_7 = 0.675

			if var_170_6 < arg_167_1.time_ and arg_167_1.time_ <= var_170_6 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, false)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_8 = arg_167_1:GetWordFromCfg(117032041)
				local var_170_9 = arg_167_1:FormatText(var_170_8.content)

				arg_167_1.text_.text = var_170_9

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_10 = 27
				local var_170_11 = utf8.len(var_170_9)
				local var_170_12 = var_170_10 <= 0 and var_170_7 or var_170_7 * (var_170_11 / var_170_10)

				if var_170_12 > 0 and var_170_7 < var_170_12 then
					arg_167_1.talkMaxDuration = var_170_12

					if var_170_12 + var_170_6 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_12 + var_170_6
					end
				end

				arg_167_1.text_.text = var_170_9
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_13 = math.max(var_170_7, arg_167_1.talkMaxDuration)

			if var_170_6 <= arg_167_1.time_ and arg_167_1.time_ < var_170_6 + var_170_13 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_6) / var_170_13

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_6 + var_170_13 and arg_167_1.time_ < var_170_6 + var_170_13 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play117032042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 117032042
		arg_171_1.duration_ = 11

		local var_171_0 = {
			zh = 11,
			ja = 8.133
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
				arg_171_0:Play117032043(arg_171_1)
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
							local var_174_4 = Mathf.Lerp(iter_174_1.color.r, 1, var_174_3)

							iter_174_1.color = Color.New(var_174_4, var_174_4, var_174_4)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.actorSpriteComps1033 then
				local var_174_5 = 1

				for iter_174_2, iter_174_3 in pairs(arg_171_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_174_3 then
						iter_174_3.color = Color.New(var_174_5, var_174_5, var_174_5)
					end
				end

				arg_171_1.var_.actorSpriteComps1033 = nil
			end

			local var_174_6 = 0
			local var_174_7 = 1.175

			if var_174_6 < arg_171_1.time_ and arg_171_1.time_ <= var_174_6 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_8 = arg_171_1:FormatText(StoryNameCfg[236].name)

				arg_171_1.leftNameTxt_.text = var_174_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_9 = arg_171_1:GetWordFromCfg(117032042)
				local var_174_10 = arg_171_1:FormatText(var_174_9.content)

				arg_171_1.text_.text = var_174_10

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_11 = 47
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032042", "story_v_out_117032.awb") ~= 0 then
					local var_174_14 = manager.audio:GetVoiceLength("story_v_out_117032", "117032042", "story_v_out_117032.awb") / 1000

					if var_174_14 + var_174_6 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_14 + var_174_6
					end

					if var_174_9.prefab_name ~= "" and arg_171_1.actors_[var_174_9.prefab_name] ~= nil then
						local var_174_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_9.prefab_name].transform, "story_v_out_117032", "117032042", "story_v_out_117032.awb")

						arg_171_1:RecordAudio("117032042", var_174_15)
						arg_171_1:RecordAudio("117032042", var_174_15)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_117032", "117032042", "story_v_out_117032.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_117032", "117032042", "story_v_out_117032.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_16 = math.max(var_174_7, arg_171_1.talkMaxDuration)

			if var_174_6 <= arg_171_1.time_ and arg_171_1.time_ < var_174_6 + var_174_16 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_6) / var_174_16

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_6 + var_174_16 and arg_171_1.time_ < var_174_6 + var_174_16 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play117032043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 117032043
		arg_175_1.duration_ = 5

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play117032044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1033"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.actorSpriteComps1033 == nil then
				arg_175_1.var_.actorSpriteComps1033 = var_178_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_2 = 0.2

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.actorSpriteComps1033 then
					for iter_178_0, iter_178_1 in pairs(arg_175_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_178_1 then
							local var_178_4 = Mathf.Lerp(iter_178_1.color.r, 0.5, var_178_3)

							iter_178_1.color = Color.New(var_178_4, var_178_4, var_178_4)
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.actorSpriteComps1033 then
				local var_178_5 = 0.5

				for iter_178_2, iter_178_3 in pairs(arg_175_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_178_3 then
						iter_178_3.color = Color.New(var_178_5, var_178_5, var_178_5)
					end
				end

				arg_175_1.var_.actorSpriteComps1033 = nil
			end

			local var_178_6 = 0
			local var_178_7 = 0.675

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

				local var_178_8 = arg_175_1:GetWordFromCfg(117032043)
				local var_178_9 = arg_175_1:FormatText(var_178_8.content)

				arg_175_1.text_.text = var_178_9

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_10 = 27
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
	Play117032044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 117032044
		arg_179_1.duration_ = 3.466

		local var_179_0 = {
			zh = 2.966,
			ja = 3.466
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
				arg_179_0:Play117032045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 0.25

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_2 = arg_179_1:FormatText(StoryNameCfg[369].name)

				arg_179_1.leftNameTxt_.text = var_182_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, true)
				arg_179_1.iconController_:SetSelectedState("hero")

				arg_179_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10035_split_4")

				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_3 = arg_179_1:GetWordFromCfg(117032044)
				local var_182_4 = arg_179_1:FormatText(var_182_3.content)

				arg_179_1.text_.text = var_182_4

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032044", "story_v_out_117032.awb") ~= 0 then
					local var_182_8 = manager.audio:GetVoiceLength("story_v_out_117032", "117032044", "story_v_out_117032.awb") / 1000

					if var_182_8 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_0
					end

					if var_182_3.prefab_name ~= "" and arg_179_1.actors_[var_182_3.prefab_name] ~= nil then
						local var_182_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_3.prefab_name].transform, "story_v_out_117032", "117032044", "story_v_out_117032.awb")

						arg_179_1:RecordAudio("117032044", var_182_9)
						arg_179_1:RecordAudio("117032044", var_182_9)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_117032", "117032044", "story_v_out_117032.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_117032", "117032044", "story_v_out_117032.awb")
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
	Play117032045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 117032045
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play117032046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 0.65

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, false)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_2 = arg_183_1:GetWordFromCfg(117032045)
				local var_186_3 = arg_183_1:FormatText(var_186_2.content)

				arg_183_1.text_.text = var_186_3

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_4 = 26
				local var_186_5 = utf8.len(var_186_3)
				local var_186_6 = var_186_4 <= 0 and var_186_1 or var_186_1 * (var_186_5 / var_186_4)

				if var_186_6 > 0 and var_186_1 < var_186_6 then
					arg_183_1.talkMaxDuration = var_186_6

					if var_186_6 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_6 + var_186_0
					end
				end

				arg_183_1.text_.text = var_186_3
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_7 = math.max(var_186_1, arg_183_1.talkMaxDuration)

			if var_186_0 <= arg_183_1.time_ and arg_183_1.time_ < var_186_0 + var_186_7 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_0) / var_186_7

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_0 + var_186_7 and arg_183_1.time_ < var_186_0 + var_186_7 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play117032046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 117032046
		arg_187_1.duration_ = 2.5

		local var_187_0 = {
			zh = 2.133,
			ja = 2.5
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
				arg_187_0:Play117032047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = "10035"

			if arg_187_1.actors_[var_190_0] == nil then
				local var_190_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_190_0), arg_187_1.canvasGo_.transform)

				var_190_1.transform:SetSiblingIndex(1)

				var_190_1.name = var_190_0
				var_190_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_187_1.actors_[var_190_0] = var_190_1
			end

			local var_190_2 = arg_187_1.actors_["10035"].transform
			local var_190_3 = 0

			if var_190_3 < arg_187_1.time_ and arg_187_1.time_ <= var_190_3 + arg_190_0 then
				arg_187_1.var_.moveOldPos10035 = var_190_2.localPosition
				var_190_2.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("10035", 4)

				local var_190_4 = var_190_2.childCount

				for iter_190_0 = 0, var_190_4 - 1 do
					local var_190_5 = var_190_2:GetChild(iter_190_0)

					if var_190_5.name == "split_1" or not string.find(var_190_5.name, "split") then
						var_190_5.gameObject:SetActive(true)
					else
						var_190_5.gameObject:SetActive(false)
					end
				end
			end

			local var_190_6 = 0.001

			if var_190_3 <= arg_187_1.time_ and arg_187_1.time_ < var_190_3 + var_190_6 then
				local var_190_7 = (arg_187_1.time_ - var_190_3) / var_190_6
				local var_190_8 = Vector3.New(390, -410, -235)

				var_190_2.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10035, var_190_8, var_190_7)
			end

			if arg_187_1.time_ >= var_190_3 + var_190_6 and arg_187_1.time_ < var_190_3 + var_190_6 + arg_190_0 then
				var_190_2.localPosition = Vector3.New(390, -410, -235)
			end

			local var_190_9 = arg_187_1.actors_["10035"]
			local var_190_10 = 0

			if var_190_10 < arg_187_1.time_ and arg_187_1.time_ <= var_190_10 + arg_190_0 and arg_187_1.var_.actorSpriteComps10035 == nil then
				arg_187_1.var_.actorSpriteComps10035 = var_190_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_11 = 0.2

			if var_190_10 <= arg_187_1.time_ and arg_187_1.time_ < var_190_10 + var_190_11 then
				local var_190_12 = (arg_187_1.time_ - var_190_10) / var_190_11

				if arg_187_1.var_.actorSpriteComps10035 then
					for iter_190_1, iter_190_2 in pairs(arg_187_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_190_2 then
							local var_190_13 = Mathf.Lerp(iter_190_2.color.r, 1, var_190_12)

							iter_190_2.color = Color.New(var_190_13, var_190_13, var_190_13)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_10 + var_190_11 and arg_187_1.time_ < var_190_10 + var_190_11 + arg_190_0 and arg_187_1.var_.actorSpriteComps10035 then
				local var_190_14 = 1

				for iter_190_3, iter_190_4 in pairs(arg_187_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_190_4 then
						iter_190_4.color = Color.New(var_190_14, var_190_14, var_190_14)
					end
				end

				arg_187_1.var_.actorSpriteComps10035 = nil
			end

			local var_190_15 = arg_187_1.actors_["10035"]
			local var_190_16 = 0

			if var_190_16 < arg_187_1.time_ and arg_187_1.time_ <= var_190_16 + arg_190_0 then
				local var_190_17 = var_190_15:GetComponentInChildren(typeof(CanvasGroup))

				if var_190_17 then
					arg_187_1.var_.alphaOldValue10035 = var_190_17.alpha
					arg_187_1.var_.characterEffect10035 = var_190_17
				end

				arg_187_1.var_.alphaOldValue10035 = 0
			end

			local var_190_18 = 0.33

			if var_190_16 <= arg_187_1.time_ and arg_187_1.time_ < var_190_16 + var_190_18 then
				local var_190_19 = (arg_187_1.time_ - var_190_16) / var_190_18
				local var_190_20 = Mathf.Lerp(arg_187_1.var_.alphaOldValue10035, 1, var_190_19)

				if arg_187_1.var_.characterEffect10035 then
					arg_187_1.var_.characterEffect10035.alpha = var_190_20
				end
			end

			if arg_187_1.time_ >= var_190_16 + var_190_18 and arg_187_1.time_ < var_190_16 + var_190_18 + arg_190_0 and arg_187_1.var_.characterEffect10035 then
				arg_187_1.var_.characterEffect10035.alpha = 1
			end

			local var_190_21 = 0
			local var_190_22 = 0.15

			if var_190_21 < arg_187_1.time_ and arg_187_1.time_ <= var_190_21 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_23 = arg_187_1:FormatText(StoryNameCfg[369].name)

				arg_187_1.leftNameTxt_.text = var_190_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_24 = arg_187_1:GetWordFromCfg(117032046)
				local var_190_25 = arg_187_1:FormatText(var_190_24.content)

				arg_187_1.text_.text = var_190_25

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_26 = 6
				local var_190_27 = utf8.len(var_190_25)
				local var_190_28 = var_190_26 <= 0 and var_190_22 or var_190_22 * (var_190_27 / var_190_26)

				if var_190_28 > 0 and var_190_22 < var_190_28 then
					arg_187_1.talkMaxDuration = var_190_28

					if var_190_28 + var_190_21 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_28 + var_190_21
					end
				end

				arg_187_1.text_.text = var_190_25
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032046", "story_v_out_117032.awb") ~= 0 then
					local var_190_29 = manager.audio:GetVoiceLength("story_v_out_117032", "117032046", "story_v_out_117032.awb") / 1000

					if var_190_29 + var_190_21 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_29 + var_190_21
					end

					if var_190_24.prefab_name ~= "" and arg_187_1.actors_[var_190_24.prefab_name] ~= nil then
						local var_190_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_24.prefab_name].transform, "story_v_out_117032", "117032046", "story_v_out_117032.awb")

						arg_187_1:RecordAudio("117032046", var_190_30)
						arg_187_1:RecordAudio("117032046", var_190_30)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_117032", "117032046", "story_v_out_117032.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_117032", "117032046", "story_v_out_117032.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_31 = math.max(var_190_22, arg_187_1.talkMaxDuration)

			if var_190_21 <= arg_187_1.time_ and arg_187_1.time_ < var_190_21 + var_190_31 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_21) / var_190_31

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_21 + var_190_31 and arg_187_1.time_ < var_190_21 + var_190_31 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play117032047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 117032047
		arg_191_1.duration_ = 5.666

		local var_191_0 = {
			zh = 5.666,
			ja = 3.366
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
				arg_191_0:Play117032048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1132"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.actorSpriteComps1132 == nil then
				arg_191_1.var_.actorSpriteComps1132 = var_194_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_2 = 0.2

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.actorSpriteComps1132 then
					for iter_194_0, iter_194_1 in pairs(arg_191_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_194_1 then
							local var_194_4 = Mathf.Lerp(iter_194_1.color.r, 1, var_194_3)

							iter_194_1.color = Color.New(var_194_4, var_194_4, var_194_4)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.actorSpriteComps1132 then
				local var_194_5 = 1

				for iter_194_2, iter_194_3 in pairs(arg_191_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_194_3 then
						iter_194_3.color = Color.New(var_194_5, var_194_5, var_194_5)
					end
				end

				arg_191_1.var_.actorSpriteComps1132 = nil
			end

			local var_194_6 = arg_191_1.actors_["10035"]
			local var_194_7 = 0

			if var_194_7 < arg_191_1.time_ and arg_191_1.time_ <= var_194_7 + arg_194_0 and arg_191_1.var_.actorSpriteComps10035 == nil then
				arg_191_1.var_.actorSpriteComps10035 = var_194_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_8 = 0.2

			if var_194_7 <= arg_191_1.time_ and arg_191_1.time_ < var_194_7 + var_194_8 then
				local var_194_9 = (arg_191_1.time_ - var_194_7) / var_194_8

				if arg_191_1.var_.actorSpriteComps10035 then
					for iter_194_4, iter_194_5 in pairs(arg_191_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_194_5 then
							local var_194_10 = Mathf.Lerp(iter_194_5.color.r, 0.5, var_194_9)

							iter_194_5.color = Color.New(var_194_10, var_194_10, var_194_10)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_7 + var_194_8 and arg_191_1.time_ < var_194_7 + var_194_8 + arg_194_0 and arg_191_1.var_.actorSpriteComps10035 then
				local var_194_11 = 0.5

				for iter_194_6, iter_194_7 in pairs(arg_191_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_194_7 then
						iter_194_7.color = Color.New(var_194_11, var_194_11, var_194_11)
					end
				end

				arg_191_1.var_.actorSpriteComps10035 = nil
			end

			local var_194_12 = 0
			local var_194_13 = 0.625

			if var_194_12 < arg_191_1.time_ and arg_191_1.time_ <= var_194_12 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_14 = arg_191_1:FormatText(StoryNameCfg[61].name)

				arg_191_1.leftNameTxt_.text = var_194_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_15 = arg_191_1:GetWordFromCfg(117032047)
				local var_194_16 = arg_191_1:FormatText(var_194_15.content)

				arg_191_1.text_.text = var_194_16

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_17 = 25
				local var_194_18 = utf8.len(var_194_16)
				local var_194_19 = var_194_17 <= 0 and var_194_13 or var_194_13 * (var_194_18 / var_194_17)

				if var_194_19 > 0 and var_194_13 < var_194_19 then
					arg_191_1.talkMaxDuration = var_194_19

					if var_194_19 + var_194_12 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_19 + var_194_12
					end
				end

				arg_191_1.text_.text = var_194_16
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032047", "story_v_out_117032.awb") ~= 0 then
					local var_194_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032047", "story_v_out_117032.awb") / 1000

					if var_194_20 + var_194_12 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_20 + var_194_12
					end

					if var_194_15.prefab_name ~= "" and arg_191_1.actors_[var_194_15.prefab_name] ~= nil then
						local var_194_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_15.prefab_name].transform, "story_v_out_117032", "117032047", "story_v_out_117032.awb")

						arg_191_1:RecordAudio("117032047", var_194_21)
						arg_191_1:RecordAudio("117032047", var_194_21)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_117032", "117032047", "story_v_out_117032.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_117032", "117032047", "story_v_out_117032.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_22 = math.max(var_194_13, arg_191_1.talkMaxDuration)

			if var_194_12 <= arg_191_1.time_ and arg_191_1.time_ < var_194_12 + var_194_22 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_12) / var_194_22

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_12 + var_194_22 and arg_191_1.time_ < var_194_12 + var_194_22 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play117032048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 117032048
		arg_195_1.duration_ = 1.6

		local var_195_0 = {
			zh = 1.6,
			ja = 1.4
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
				arg_195_0:Play117032049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1132"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 and arg_195_1.var_.actorSpriteComps1132 == nil then
				arg_195_1.var_.actorSpriteComps1132 = var_198_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_2 = 0.2

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2

				if arg_195_1.var_.actorSpriteComps1132 then
					for iter_198_0, iter_198_1 in pairs(arg_195_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_198_1 then
							local var_198_4 = Mathf.Lerp(iter_198_1.color.r, 0.5, var_198_3)

							iter_198_1.color = Color.New(var_198_4, var_198_4, var_198_4)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 and arg_195_1.var_.actorSpriteComps1132 then
				local var_198_5 = 0.5

				for iter_198_2, iter_198_3 in pairs(arg_195_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_198_3 then
						iter_198_3.color = Color.New(var_198_5, var_198_5, var_198_5)
					end
				end

				arg_195_1.var_.actorSpriteComps1132 = nil
			end

			local var_198_6 = arg_195_1.actors_["10035"].transform
			local var_198_7 = 0

			if var_198_7 < arg_195_1.time_ and arg_195_1.time_ <= var_198_7 + arg_198_0 then
				arg_195_1.var_.moveOldPos10035 = var_198_6.localPosition
				var_198_6.localScale = Vector3.New(1, 1, 1)

				arg_195_1:CheckSpriteTmpPos("10035", 4)

				local var_198_8 = var_198_6.childCount

				for iter_198_4 = 0, var_198_8 - 1 do
					local var_198_9 = var_198_6:GetChild(iter_198_4)

					if var_198_9.name == "split_4" or not string.find(var_198_9.name, "split") then
						var_198_9.gameObject:SetActive(true)
					else
						var_198_9.gameObject:SetActive(false)
					end
				end
			end

			local var_198_10 = 0.001

			if var_198_7 <= arg_195_1.time_ and arg_195_1.time_ < var_198_7 + var_198_10 then
				local var_198_11 = (arg_195_1.time_ - var_198_7) / var_198_10
				local var_198_12 = Vector3.New(390, -410, -235)

				var_198_6.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos10035, var_198_12, var_198_11)
			end

			if arg_195_1.time_ >= var_198_7 + var_198_10 and arg_195_1.time_ < var_198_7 + var_198_10 + arg_198_0 then
				var_198_6.localPosition = Vector3.New(390, -410, -235)
			end

			local var_198_13 = 0
			local var_198_14 = 0.075

			if var_198_13 < arg_195_1.time_ and arg_195_1.time_ <= var_198_13 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_15 = arg_195_1:FormatText(StoryNameCfg[369].name)

				arg_195_1.leftNameTxt_.text = var_198_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_16 = arg_195_1:GetWordFromCfg(117032048)
				local var_198_17 = arg_195_1:FormatText(var_198_16.content)

				arg_195_1.text_.text = var_198_17

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_18 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032048", "story_v_out_117032.awb") ~= 0 then
					local var_198_21 = manager.audio:GetVoiceLength("story_v_out_117032", "117032048", "story_v_out_117032.awb") / 1000

					if var_198_21 + var_198_13 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_21 + var_198_13
					end

					if var_198_16.prefab_name ~= "" and arg_195_1.actors_[var_198_16.prefab_name] ~= nil then
						local var_198_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_16.prefab_name].transform, "story_v_out_117032", "117032048", "story_v_out_117032.awb")

						arg_195_1:RecordAudio("117032048", var_198_22)
						arg_195_1:RecordAudio("117032048", var_198_22)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_117032", "117032048", "story_v_out_117032.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_117032", "117032048", "story_v_out_117032.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_23 = math.max(var_198_14, arg_195_1.talkMaxDuration)

			if var_198_13 <= arg_195_1.time_ and arg_195_1.time_ < var_198_13 + var_198_23 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_13) / var_198_23

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_13 + var_198_23 and arg_195_1.time_ < var_198_13 + var_198_23 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play117032049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 117032049
		arg_199_1.duration_ = 3.9

		local var_199_0 = {
			zh = 2.2,
			ja = 3.9
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
				arg_199_0:Play117032050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1132"].transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.moveOldPos1132 = var_202_0.localPosition
				var_202_0.localScale = Vector3.New(1, 1, 1)

				arg_199_1:CheckSpriteTmpPos("1132", 7)

				local var_202_2 = var_202_0.childCount

				for iter_202_0 = 0, var_202_2 - 1 do
					local var_202_3 = var_202_0:GetChild(iter_202_0)

					if var_202_3.name == "split_6" or not string.find(var_202_3.name, "split") then
						var_202_3.gameObject:SetActive(true)
					else
						var_202_3.gameObject:SetActive(false)
					end
				end
			end

			local var_202_4 = 0.001

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_4 then
				local var_202_5 = (arg_199_1.time_ - var_202_1) / var_202_4
				local var_202_6 = Vector3.New(0, -2000, -185)

				var_202_0.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1132, var_202_6, var_202_5)
			end

			if arg_199_1.time_ >= var_202_1 + var_202_4 and arg_199_1.time_ < var_202_1 + var_202_4 + arg_202_0 then
				var_202_0.localPosition = Vector3.New(0, -2000, -185)
			end

			local var_202_7 = arg_199_1.actors_["10035"].transform
			local var_202_8 = 0

			if var_202_8 < arg_199_1.time_ and arg_199_1.time_ <= var_202_8 + arg_202_0 then
				arg_199_1.var_.moveOldPos10035 = var_202_7.localPosition
				var_202_7.localScale = Vector3.New(1, 1, 1)

				arg_199_1:CheckSpriteTmpPos("10035", 7)

				local var_202_9 = var_202_7.childCount

				for iter_202_1 = 0, var_202_9 - 1 do
					local var_202_10 = var_202_7:GetChild(iter_202_1)

					if var_202_10.name == "split_4" or not string.find(var_202_10.name, "split") then
						var_202_10.gameObject:SetActive(true)
					else
						var_202_10.gameObject:SetActive(false)
					end
				end
			end

			local var_202_11 = 0.001

			if var_202_8 <= arg_199_1.time_ and arg_199_1.time_ < var_202_8 + var_202_11 then
				local var_202_12 = (arg_199_1.time_ - var_202_8) / var_202_11
				local var_202_13 = Vector3.New(0, -2000, -235)

				var_202_7.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos10035, var_202_13, var_202_12)
			end

			if arg_199_1.time_ >= var_202_8 + var_202_11 and arg_199_1.time_ < var_202_8 + var_202_11 + arg_202_0 then
				var_202_7.localPosition = Vector3.New(0, -2000, -235)
			end

			local var_202_14 = arg_199_1.actors_["1033"].transform
			local var_202_15 = 0

			if var_202_15 < arg_199_1.time_ and arg_199_1.time_ <= var_202_15 + arg_202_0 then
				arg_199_1.var_.moveOldPos1033 = var_202_14.localPosition
				var_202_14.localScale = Vector3.New(1, 1, 1)

				arg_199_1:CheckSpriteTmpPos("1033", 3)

				local var_202_16 = var_202_14.childCount

				for iter_202_2 = 0, var_202_16 - 1 do
					local var_202_17 = var_202_14:GetChild(iter_202_2)

					if var_202_17.name == "split_4" or not string.find(var_202_17.name, "split") then
						var_202_17.gameObject:SetActive(true)
					else
						var_202_17.gameObject:SetActive(false)
					end
				end
			end

			local var_202_18 = 0.001

			if var_202_15 <= arg_199_1.time_ and arg_199_1.time_ < var_202_15 + var_202_18 then
				local var_202_19 = (arg_199_1.time_ - var_202_15) / var_202_18
				local var_202_20 = Vector3.New(0, -420, 0)

				var_202_14.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1033, var_202_20, var_202_19)
			end

			if arg_199_1.time_ >= var_202_15 + var_202_18 and arg_199_1.time_ < var_202_15 + var_202_18 + arg_202_0 then
				var_202_14.localPosition = Vector3.New(0, -420, 0)
			end

			local var_202_21 = arg_199_1.actors_["1033"]
			local var_202_22 = 0

			if var_202_22 < arg_199_1.time_ and arg_199_1.time_ <= var_202_22 + arg_202_0 then
				local var_202_23 = var_202_21:GetComponentInChildren(typeof(CanvasGroup))

				if var_202_23 then
					arg_199_1.var_.alphaOldValue1033 = var_202_23.alpha
					arg_199_1.var_.characterEffect1033 = var_202_23
				end

				arg_199_1.var_.alphaOldValue1033 = 0
			end

			local var_202_24 = 0.333333333333333

			if var_202_22 <= arg_199_1.time_ and arg_199_1.time_ < var_202_22 + var_202_24 then
				local var_202_25 = (arg_199_1.time_ - var_202_22) / var_202_24
				local var_202_26 = Mathf.Lerp(arg_199_1.var_.alphaOldValue1033, 1, var_202_25)

				if arg_199_1.var_.characterEffect1033 then
					arg_199_1.var_.characterEffect1033.alpha = var_202_26
				end
			end

			if arg_199_1.time_ >= var_202_22 + var_202_24 and arg_199_1.time_ < var_202_22 + var_202_24 + arg_202_0 and arg_199_1.var_.characterEffect1033 then
				arg_199_1.var_.characterEffect1033.alpha = 1
			end

			local var_202_27 = arg_199_1.actors_["1033"]
			local var_202_28 = 0

			if var_202_28 < arg_199_1.time_ and arg_199_1.time_ <= var_202_28 + arg_202_0 and arg_199_1.var_.actorSpriteComps1033 == nil then
				arg_199_1.var_.actorSpriteComps1033 = var_202_27:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_29 = 0.2

			if var_202_28 <= arg_199_1.time_ and arg_199_1.time_ < var_202_28 + var_202_29 then
				local var_202_30 = (arg_199_1.time_ - var_202_28) / var_202_29

				if arg_199_1.var_.actorSpriteComps1033 then
					for iter_202_3, iter_202_4 in pairs(arg_199_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_202_4 then
							local var_202_31 = Mathf.Lerp(iter_202_4.color.r, 1, var_202_30)

							iter_202_4.color = Color.New(var_202_31, var_202_31, var_202_31)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_28 + var_202_29 and arg_199_1.time_ < var_202_28 + var_202_29 + arg_202_0 and arg_199_1.var_.actorSpriteComps1033 then
				local var_202_32 = 1

				for iter_202_5, iter_202_6 in pairs(arg_199_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_202_6 then
						iter_202_6.color = Color.New(var_202_32, var_202_32, var_202_32)
					end
				end

				arg_199_1.var_.actorSpriteComps1033 = nil
			end

			local var_202_33 = 0
			local var_202_34 = 0.15

			if var_202_33 < arg_199_1.time_ and arg_199_1.time_ <= var_202_33 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_35 = arg_199_1:FormatText(StoryNameCfg[236].name)

				arg_199_1.leftNameTxt_.text = var_202_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_36 = arg_199_1:GetWordFromCfg(117032049)
				local var_202_37 = arg_199_1:FormatText(var_202_36.content)

				arg_199_1.text_.text = var_202_37

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_38 = 6
				local var_202_39 = utf8.len(var_202_37)
				local var_202_40 = var_202_38 <= 0 and var_202_34 or var_202_34 * (var_202_39 / var_202_38)

				if var_202_40 > 0 and var_202_34 < var_202_40 then
					arg_199_1.talkMaxDuration = var_202_40

					if var_202_40 + var_202_33 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_40 + var_202_33
					end
				end

				arg_199_1.text_.text = var_202_37
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032049", "story_v_out_117032.awb") ~= 0 then
					local var_202_41 = manager.audio:GetVoiceLength("story_v_out_117032", "117032049", "story_v_out_117032.awb") / 1000

					if var_202_41 + var_202_33 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_41 + var_202_33
					end

					if var_202_36.prefab_name ~= "" and arg_199_1.actors_[var_202_36.prefab_name] ~= nil then
						local var_202_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_36.prefab_name].transform, "story_v_out_117032", "117032049", "story_v_out_117032.awb")

						arg_199_1:RecordAudio("117032049", var_202_42)
						arg_199_1:RecordAudio("117032049", var_202_42)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_117032", "117032049", "story_v_out_117032.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_117032", "117032049", "story_v_out_117032.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_43 = math.max(var_202_34, arg_199_1.talkMaxDuration)

			if var_202_33 <= arg_199_1.time_ and arg_199_1.time_ < var_202_33 + var_202_43 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_33) / var_202_43

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_33 + var_202_43 and arg_199_1.time_ < var_202_33 + var_202_43 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play117032050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 117032050
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play117032051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1033"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.actorSpriteComps1033 == nil then
				arg_203_1.var_.actorSpriteComps1033 = var_206_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_2 = 0.2

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.actorSpriteComps1033 then
					for iter_206_0, iter_206_1 in pairs(arg_203_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_206_1 then
							local var_206_4 = Mathf.Lerp(iter_206_1.color.r, 0.5, var_206_3)

							iter_206_1.color = Color.New(var_206_4, var_206_4, var_206_4)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.actorSpriteComps1033 then
				local var_206_5 = 0.5

				for iter_206_2, iter_206_3 in pairs(arg_203_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_206_3 then
						iter_206_3.color = Color.New(var_206_5, var_206_5, var_206_5)
					end
				end

				arg_203_1.var_.actorSpriteComps1033 = nil
			end

			local var_206_6 = arg_203_1.actors_["1033"]
			local var_206_7 = 0

			if var_206_7 < arg_203_1.time_ and arg_203_1.time_ <= var_206_7 + arg_206_0 and arg_203_1.var_.actorSpriteComps1033 == nil then
				arg_203_1.var_.actorSpriteComps1033 = var_206_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_8 = 0.2

			if var_206_7 <= arg_203_1.time_ and arg_203_1.time_ < var_206_7 + var_206_8 then
				local var_206_9 = (arg_203_1.time_ - var_206_7) / var_206_8

				if arg_203_1.var_.actorSpriteComps1033 then
					for iter_206_4, iter_206_5 in pairs(arg_203_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_206_5 then
							local var_206_10 = Mathf.Lerp(iter_206_5.color.r, 1, var_206_9)

							iter_206_5.color = Color.New(var_206_10, var_206_10, var_206_10)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_7 + var_206_8 and arg_203_1.time_ < var_206_7 + var_206_8 + arg_206_0 and arg_203_1.var_.actorSpriteComps1033 then
				local var_206_11 = 1

				for iter_206_6, iter_206_7 in pairs(arg_203_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_206_7 then
						iter_206_7.color = Color.New(var_206_11, var_206_11, var_206_11)
					end
				end

				arg_203_1.var_.actorSpriteComps1033 = nil
			end

			local var_206_12 = 0
			local var_206_13 = 1.375

			if var_206_12 < arg_203_1.time_ and arg_203_1.time_ <= var_206_12 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, false)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_14 = arg_203_1:GetWordFromCfg(117032050)
				local var_206_15 = arg_203_1:FormatText(var_206_14.content)

				arg_203_1.text_.text = var_206_15

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_16 = 55
				local var_206_17 = utf8.len(var_206_15)
				local var_206_18 = var_206_16 <= 0 and var_206_13 or var_206_13 * (var_206_17 / var_206_16)

				if var_206_18 > 0 and var_206_13 < var_206_18 then
					arg_203_1.talkMaxDuration = var_206_18

					if var_206_18 + var_206_12 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_18 + var_206_12
					end
				end

				arg_203_1.text_.text = var_206_15
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)
				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_19 = math.max(var_206_13, arg_203_1.talkMaxDuration)

			if var_206_12 <= arg_203_1.time_ and arg_203_1.time_ < var_206_12 + var_206_19 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_12) / var_206_19

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_12 + var_206_19 and arg_203_1.time_ < var_206_12 + var_206_19 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play117032051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 117032051
		arg_207_1.duration_ = 12.9

		local var_207_0 = {
			zh = 9.6,
			ja = 12.9
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
				arg_207_0:Play117032052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1033"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos1033 = var_210_0.localPosition
				var_210_0.localScale = Vector3.New(1, 1, 1)

				arg_207_1:CheckSpriteTmpPos("1033", 3)

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
				local var_210_6 = Vector3.New(0, -420, 0)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1033, var_210_6, var_210_5)
			end

			if arg_207_1.time_ >= var_210_1 + var_210_4 and arg_207_1.time_ < var_210_1 + var_210_4 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(0, -420, 0)
			end

			local var_210_7 = 0
			local var_210_8 = 1.075

			if var_210_7 < arg_207_1.time_ and arg_207_1.time_ <= var_210_7 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_9 = arg_207_1:FormatText(StoryNameCfg[236].name)

				arg_207_1.leftNameTxt_.text = var_210_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_10 = arg_207_1:GetWordFromCfg(117032051)
				local var_210_11 = arg_207_1:FormatText(var_210_10.content)

				arg_207_1.text_.text = var_210_11

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_12 = 43
				local var_210_13 = utf8.len(var_210_11)
				local var_210_14 = var_210_12 <= 0 and var_210_8 or var_210_8 * (var_210_13 / var_210_12)

				if var_210_14 > 0 and var_210_8 < var_210_14 then
					arg_207_1.talkMaxDuration = var_210_14

					if var_210_14 + var_210_7 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_14 + var_210_7
					end
				end

				arg_207_1.text_.text = var_210_11
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032051", "story_v_out_117032.awb") ~= 0 then
					local var_210_15 = manager.audio:GetVoiceLength("story_v_out_117032", "117032051", "story_v_out_117032.awb") / 1000

					if var_210_15 + var_210_7 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_15 + var_210_7
					end

					if var_210_10.prefab_name ~= "" and arg_207_1.actors_[var_210_10.prefab_name] ~= nil then
						local var_210_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_10.prefab_name].transform, "story_v_out_117032", "117032051", "story_v_out_117032.awb")

						arg_207_1:RecordAudio("117032051", var_210_16)
						arg_207_1:RecordAudio("117032051", var_210_16)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_117032", "117032051", "story_v_out_117032.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_117032", "117032051", "story_v_out_117032.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_17 = math.max(var_210_8, arg_207_1.talkMaxDuration)

			if var_210_7 <= arg_207_1.time_ and arg_207_1.time_ < var_210_7 + var_210_17 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_7) / var_210_17

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_7 + var_210_17 and arg_207_1.time_ < var_210_7 + var_210_17 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play117032052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 117032052
		arg_211_1.duration_ = 3.866

		local var_211_0 = {
			zh = 1.966,
			ja = 3.866
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
				arg_211_0:Play117032053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 0.25

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

				local var_214_3 = arg_211_1:GetWordFromCfg(117032052)
				local var_214_4 = arg_211_1:FormatText(var_214_3.content)

				arg_211_1.text_.text = var_214_4

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032052", "story_v_out_117032.awb") ~= 0 then
					local var_214_8 = manager.audio:GetVoiceLength("story_v_out_117032", "117032052", "story_v_out_117032.awb") / 1000

					if var_214_8 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_8 + var_214_0
					end

					if var_214_3.prefab_name ~= "" and arg_211_1.actors_[var_214_3.prefab_name] ~= nil then
						local var_214_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_3.prefab_name].transform, "story_v_out_117032", "117032052", "story_v_out_117032.awb")

						arg_211_1:RecordAudio("117032052", var_214_9)
						arg_211_1:RecordAudio("117032052", var_214_9)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_117032", "117032052", "story_v_out_117032.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_117032", "117032052", "story_v_out_117032.awb")
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
	Play117032053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 117032053
		arg_215_1.duration_ = 4.6

		local var_215_0 = {
			zh = 4.6,
			ja = 3.433
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
				arg_215_0:Play117032054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1132"].transform
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 then
				arg_215_1.var_.moveOldPos1132 = var_218_0.localPosition
				var_218_0.localScale = Vector3.New(1, 1, 1)

				arg_215_1:CheckSpriteTmpPos("1132", 2)

				local var_218_2 = var_218_0.childCount

				for iter_218_0 = 0, var_218_2 - 1 do
					local var_218_3 = var_218_0:GetChild(iter_218_0)

					if var_218_3.name == "split_6" or not string.find(var_218_3.name, "split") then
						var_218_3.gameObject:SetActive(true)
					else
						var_218_3.gameObject:SetActive(false)
					end
				end
			end

			local var_218_4 = 0.001

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_4 then
				local var_218_5 = (arg_215_1.time_ - var_218_1) / var_218_4
				local var_218_6 = Vector3.New(-390, -413, -185)

				var_218_0.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos1132, var_218_6, var_218_5)
			end

			if arg_215_1.time_ >= var_218_1 + var_218_4 and arg_215_1.time_ < var_218_1 + var_218_4 + arg_218_0 then
				var_218_0.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_218_7 = arg_215_1.actors_["10035"].transform
			local var_218_8 = 0

			if var_218_8 < arg_215_1.time_ and arg_215_1.time_ <= var_218_8 + arg_218_0 then
				arg_215_1.var_.moveOldPos10035 = var_218_7.localPosition
				var_218_7.localScale = Vector3.New(1, 1, 1)

				arg_215_1:CheckSpriteTmpPos("10035", 4)

				local var_218_9 = var_218_7.childCount

				for iter_218_1 = 0, var_218_9 - 1 do
					local var_218_10 = var_218_7:GetChild(iter_218_1)

					if var_218_10.name == "split_1" or not string.find(var_218_10.name, "split") then
						var_218_10.gameObject:SetActive(true)
					else
						var_218_10.gameObject:SetActive(false)
					end
				end
			end

			local var_218_11 = 0.001

			if var_218_8 <= arg_215_1.time_ and arg_215_1.time_ < var_218_8 + var_218_11 then
				local var_218_12 = (arg_215_1.time_ - var_218_8) / var_218_11
				local var_218_13 = Vector3.New(390, -410, -235)

				var_218_7.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos10035, var_218_13, var_218_12)
			end

			if arg_215_1.time_ >= var_218_8 + var_218_11 and arg_215_1.time_ < var_218_8 + var_218_11 + arg_218_0 then
				var_218_7.localPosition = Vector3.New(390, -410, -235)
			end

			local var_218_14 = arg_215_1.actors_["1033"].transform
			local var_218_15 = 0

			if var_218_15 < arg_215_1.time_ and arg_215_1.time_ <= var_218_15 + arg_218_0 then
				arg_215_1.var_.moveOldPos1033 = var_218_14.localPosition
				var_218_14.localScale = Vector3.New(1, 1, 1)

				arg_215_1:CheckSpriteTmpPos("1033", 7)

				local var_218_16 = var_218_14.childCount

				for iter_218_2 = 0, var_218_16 - 1 do
					local var_218_17 = var_218_14:GetChild(iter_218_2)

					if var_218_17.name == "split_6" or not string.find(var_218_17.name, "split") then
						var_218_17.gameObject:SetActive(true)
					else
						var_218_17.gameObject:SetActive(false)
					end
				end
			end

			local var_218_18 = 0.001

			if var_218_15 <= arg_215_1.time_ and arg_215_1.time_ < var_218_15 + var_218_18 then
				local var_218_19 = (arg_215_1.time_ - var_218_15) / var_218_18
				local var_218_20 = Vector3.New(0, -2000, -235)

				var_218_14.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos1033, var_218_20, var_218_19)
			end

			if arg_215_1.time_ >= var_218_15 + var_218_18 and arg_215_1.time_ < var_218_15 + var_218_18 + arg_218_0 then
				var_218_14.localPosition = Vector3.New(0, -2000, -235)
			end

			local var_218_21 = arg_215_1.actors_["1132"]
			local var_218_22 = 0

			if var_218_22 < arg_215_1.time_ and arg_215_1.time_ <= var_218_22 + arg_218_0 and arg_215_1.var_.actorSpriteComps1132 == nil then
				arg_215_1.var_.actorSpriteComps1132 = var_218_21:GetComponentsInChildren(typeof(Image), true)
			end

			local var_218_23 = 0.2

			if var_218_22 <= arg_215_1.time_ and arg_215_1.time_ < var_218_22 + var_218_23 then
				local var_218_24 = (arg_215_1.time_ - var_218_22) / var_218_23

				if arg_215_1.var_.actorSpriteComps1132 then
					for iter_218_3, iter_218_4 in pairs(arg_215_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_218_4 then
							local var_218_25 = Mathf.Lerp(iter_218_4.color.r, 1, var_218_24)

							iter_218_4.color = Color.New(var_218_25, var_218_25, var_218_25)
						end
					end
				end
			end

			if arg_215_1.time_ >= var_218_22 + var_218_23 and arg_215_1.time_ < var_218_22 + var_218_23 + arg_218_0 and arg_215_1.var_.actorSpriteComps1132 then
				local var_218_26 = 1

				for iter_218_5, iter_218_6 in pairs(arg_215_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_218_6 then
						iter_218_6.color = Color.New(var_218_26, var_218_26, var_218_26)
					end
				end

				arg_215_1.var_.actorSpriteComps1132 = nil
			end

			local var_218_27 = arg_215_1.actors_["10035"]
			local var_218_28 = 0

			if var_218_28 < arg_215_1.time_ and arg_215_1.time_ <= var_218_28 + arg_218_0 and arg_215_1.var_.actorSpriteComps10035 == nil then
				arg_215_1.var_.actorSpriteComps10035 = var_218_27:GetComponentsInChildren(typeof(Image), true)
			end

			local var_218_29 = 0.2

			if var_218_28 <= arg_215_1.time_ and arg_215_1.time_ < var_218_28 + var_218_29 then
				local var_218_30 = (arg_215_1.time_ - var_218_28) / var_218_29

				if arg_215_1.var_.actorSpriteComps10035 then
					for iter_218_7, iter_218_8 in pairs(arg_215_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_218_8 then
							local var_218_31 = Mathf.Lerp(iter_218_8.color.r, 0.5, var_218_30)

							iter_218_8.color = Color.New(var_218_31, var_218_31, var_218_31)
						end
					end
				end
			end

			if arg_215_1.time_ >= var_218_28 + var_218_29 and arg_215_1.time_ < var_218_28 + var_218_29 + arg_218_0 and arg_215_1.var_.actorSpriteComps10035 then
				local var_218_32 = 0.5

				for iter_218_9, iter_218_10 in pairs(arg_215_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_218_10 then
						iter_218_10.color = Color.New(var_218_32, var_218_32, var_218_32)
					end
				end

				arg_215_1.var_.actorSpriteComps10035 = nil
			end

			local var_218_33 = 0
			local var_218_34 = 0.575

			if var_218_33 < arg_215_1.time_ and arg_215_1.time_ <= var_218_33 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_35 = arg_215_1:FormatText(StoryNameCfg[61].name)

				arg_215_1.leftNameTxt_.text = var_218_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_36 = arg_215_1:GetWordFromCfg(117032053)
				local var_218_37 = arg_215_1:FormatText(var_218_36.content)

				arg_215_1.text_.text = var_218_37

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_38 = 23
				local var_218_39 = utf8.len(var_218_37)
				local var_218_40 = var_218_38 <= 0 and var_218_34 or var_218_34 * (var_218_39 / var_218_38)

				if var_218_40 > 0 and var_218_34 < var_218_40 then
					arg_215_1.talkMaxDuration = var_218_40

					if var_218_40 + var_218_33 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_40 + var_218_33
					end
				end

				arg_215_1.text_.text = var_218_37
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032053", "story_v_out_117032.awb") ~= 0 then
					local var_218_41 = manager.audio:GetVoiceLength("story_v_out_117032", "117032053", "story_v_out_117032.awb") / 1000

					if var_218_41 + var_218_33 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_41 + var_218_33
					end

					if var_218_36.prefab_name ~= "" and arg_215_1.actors_[var_218_36.prefab_name] ~= nil then
						local var_218_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_36.prefab_name].transform, "story_v_out_117032", "117032053", "story_v_out_117032.awb")

						arg_215_1:RecordAudio("117032053", var_218_42)
						arg_215_1:RecordAudio("117032053", var_218_42)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_117032", "117032053", "story_v_out_117032.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_117032", "117032053", "story_v_out_117032.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_43 = math.max(var_218_34, arg_215_1.talkMaxDuration)

			if var_218_33 <= arg_215_1.time_ and arg_215_1.time_ < var_218_33 + var_218_43 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_33) / var_218_43

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_33 + var_218_43 and arg_215_1.time_ < var_218_33 + var_218_43 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play117032054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 117032054
		arg_219_1.duration_ = 5

		SetActive(arg_219_1.tipsGo_, false)

		function arg_219_1.onSingleLineFinish_()
			arg_219_1.onSingleLineUpdate_ = nil
			arg_219_1.onSingleLineFinish_ = nil
			arg_219_1.state_ = "waiting"
		end

		function arg_219_1.playNext_(arg_221_0)
			if arg_221_0 == 1 then
				arg_219_0:Play117032055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1132"]
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 and arg_219_1.var_.actorSpriteComps1132 == nil then
				arg_219_1.var_.actorSpriteComps1132 = var_222_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_2 = 0.2

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2

				if arg_219_1.var_.actorSpriteComps1132 then
					for iter_222_0, iter_222_1 in pairs(arg_219_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_222_1 then
							local var_222_4 = Mathf.Lerp(iter_222_1.color.r, 0.5, var_222_3)

							iter_222_1.color = Color.New(var_222_4, var_222_4, var_222_4)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 and arg_219_1.var_.actorSpriteComps1132 then
				local var_222_5 = 0.5

				for iter_222_2, iter_222_3 in pairs(arg_219_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_222_3 then
						iter_222_3.color = Color.New(var_222_5, var_222_5, var_222_5)
					end
				end

				arg_219_1.var_.actorSpriteComps1132 = nil
			end

			local var_222_6 = 0
			local var_222_7 = 0.4

			if var_222_6 < arg_219_1.time_ and arg_219_1.time_ <= var_222_6 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, false)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_8 = arg_219_1:GetWordFromCfg(117032054)
				local var_222_9 = arg_219_1:FormatText(var_222_8.content)

				arg_219_1.text_.text = var_222_9

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_10 = 16
				local var_222_11 = utf8.len(var_222_9)
				local var_222_12 = var_222_10 <= 0 and var_222_7 or var_222_7 * (var_222_11 / var_222_10)

				if var_222_12 > 0 and var_222_7 < var_222_12 then
					arg_219_1.talkMaxDuration = var_222_12

					if var_222_12 + var_222_6 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_12 + var_222_6
					end
				end

				arg_219_1.text_.text = var_222_9
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)
				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_13 = math.max(var_222_7, arg_219_1.talkMaxDuration)

			if var_222_6 <= arg_219_1.time_ and arg_219_1.time_ < var_222_6 + var_222_13 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_6) / var_222_13

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_6 + var_222_13 and arg_219_1.time_ < var_222_6 + var_222_13 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play117032055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 117032055
		arg_223_1.duration_ = 5.933

		local var_223_0 = {
			zh = 5.933,
			ja = 5.8
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
				arg_223_0:Play117032056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["10035"].transform
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.var_.moveOldPos10035 = var_226_0.localPosition
				var_226_0.localScale = Vector3.New(1, 1, 1)

				arg_223_1:CheckSpriteTmpPos("10035", 4)

				local var_226_2 = var_226_0.childCount

				for iter_226_0 = 0, var_226_2 - 1 do
					local var_226_3 = var_226_0:GetChild(iter_226_0)

					if var_226_3.name == "split_4" or not string.find(var_226_3.name, "split") then
						var_226_3.gameObject:SetActive(true)
					else
						var_226_3.gameObject:SetActive(false)
					end
				end
			end

			local var_226_4 = 0.001

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_4 then
				local var_226_5 = (arg_223_1.time_ - var_226_1) / var_226_4
				local var_226_6 = Vector3.New(390, -410, -235)

				var_226_0.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos10035, var_226_6, var_226_5)
			end

			if arg_223_1.time_ >= var_226_1 + var_226_4 and arg_223_1.time_ < var_226_1 + var_226_4 + arg_226_0 then
				var_226_0.localPosition = Vector3.New(390, -410, -235)
			end

			local var_226_7 = arg_223_1.actors_["10035"]
			local var_226_8 = 0

			if var_226_8 < arg_223_1.time_ and arg_223_1.time_ <= var_226_8 + arg_226_0 and arg_223_1.var_.actorSpriteComps10035 == nil then
				arg_223_1.var_.actorSpriteComps10035 = var_226_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_226_9 = 0.2

			if var_226_8 <= arg_223_1.time_ and arg_223_1.time_ < var_226_8 + var_226_9 then
				local var_226_10 = (arg_223_1.time_ - var_226_8) / var_226_9

				if arg_223_1.var_.actorSpriteComps10035 then
					for iter_226_1, iter_226_2 in pairs(arg_223_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_226_2 then
							local var_226_11 = Mathf.Lerp(iter_226_2.color.r, 1, var_226_10)

							iter_226_2.color = Color.New(var_226_11, var_226_11, var_226_11)
						end
					end
				end
			end

			if arg_223_1.time_ >= var_226_8 + var_226_9 and arg_223_1.time_ < var_226_8 + var_226_9 + arg_226_0 and arg_223_1.var_.actorSpriteComps10035 then
				local var_226_12 = 1

				for iter_226_3, iter_226_4 in pairs(arg_223_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_226_4 then
						iter_226_4.color = Color.New(var_226_12, var_226_12, var_226_12)
					end
				end

				arg_223_1.var_.actorSpriteComps10035 = nil
			end

			local var_226_13 = 0
			local var_226_14 = 0.7

			if var_226_13 < arg_223_1.time_ and arg_223_1.time_ <= var_226_13 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_15 = arg_223_1:FormatText(StoryNameCfg[369].name)

				arg_223_1.leftNameTxt_.text = var_226_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_16 = arg_223_1:GetWordFromCfg(117032055)
				local var_226_17 = arg_223_1:FormatText(var_226_16.content)

				arg_223_1.text_.text = var_226_17

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_18 = 28
				local var_226_19 = utf8.len(var_226_17)
				local var_226_20 = var_226_18 <= 0 and var_226_14 or var_226_14 * (var_226_19 / var_226_18)

				if var_226_20 > 0 and var_226_14 < var_226_20 then
					arg_223_1.talkMaxDuration = var_226_20

					if var_226_20 + var_226_13 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_20 + var_226_13
					end
				end

				arg_223_1.text_.text = var_226_17
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032055", "story_v_out_117032.awb") ~= 0 then
					local var_226_21 = manager.audio:GetVoiceLength("story_v_out_117032", "117032055", "story_v_out_117032.awb") / 1000

					if var_226_21 + var_226_13 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_21 + var_226_13
					end

					if var_226_16.prefab_name ~= "" and arg_223_1.actors_[var_226_16.prefab_name] ~= nil then
						local var_226_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_16.prefab_name].transform, "story_v_out_117032", "117032055", "story_v_out_117032.awb")

						arg_223_1:RecordAudio("117032055", var_226_22)
						arg_223_1:RecordAudio("117032055", var_226_22)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_117032", "117032055", "story_v_out_117032.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_117032", "117032055", "story_v_out_117032.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_23 = math.max(var_226_14, arg_223_1.talkMaxDuration)

			if var_226_13 <= arg_223_1.time_ and arg_223_1.time_ < var_226_13 + var_226_23 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_13) / var_226_23

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_13 + var_226_23 and arg_223_1.time_ < var_226_13 + var_226_23 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play117032056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 117032056
		arg_227_1.duration_ = 2.9

		local var_227_0 = {
			zh = 2.133,
			ja = 2.9
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
				arg_227_0:Play117032057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1132"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.actorSpriteComps1132 == nil then
				arg_227_1.var_.actorSpriteComps1132 = var_230_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_230_2 = 0.2

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.actorSpriteComps1132 then
					for iter_230_0, iter_230_1 in pairs(arg_227_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_230_1 then
							local var_230_4 = Mathf.Lerp(iter_230_1.color.r, 1, var_230_3)

							iter_230_1.color = Color.New(var_230_4, var_230_4, var_230_4)
						end
					end
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.actorSpriteComps1132 then
				local var_230_5 = 1

				for iter_230_2, iter_230_3 in pairs(arg_227_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_230_3 then
						iter_230_3.color = Color.New(var_230_5, var_230_5, var_230_5)
					end
				end

				arg_227_1.var_.actorSpriteComps1132 = nil
			end

			local var_230_6 = arg_227_1.actors_["10035"]
			local var_230_7 = 0

			if var_230_7 < arg_227_1.time_ and arg_227_1.time_ <= var_230_7 + arg_230_0 and arg_227_1.var_.actorSpriteComps10035 == nil then
				arg_227_1.var_.actorSpriteComps10035 = var_230_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_230_8 = 0.2

			if var_230_7 <= arg_227_1.time_ and arg_227_1.time_ < var_230_7 + var_230_8 then
				local var_230_9 = (arg_227_1.time_ - var_230_7) / var_230_8

				if arg_227_1.var_.actorSpriteComps10035 then
					for iter_230_4, iter_230_5 in pairs(arg_227_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_230_5 then
							local var_230_10 = Mathf.Lerp(iter_230_5.color.r, 0.5, var_230_9)

							iter_230_5.color = Color.New(var_230_10, var_230_10, var_230_10)
						end
					end
				end
			end

			if arg_227_1.time_ >= var_230_7 + var_230_8 and arg_227_1.time_ < var_230_7 + var_230_8 + arg_230_0 and arg_227_1.var_.actorSpriteComps10035 then
				local var_230_11 = 0.5

				for iter_230_6, iter_230_7 in pairs(arg_227_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_230_7 then
						iter_230_7.color = Color.New(var_230_11, var_230_11, var_230_11)
					end
				end

				arg_227_1.var_.actorSpriteComps10035 = nil
			end

			local var_230_12 = 0
			local var_230_13 = 0.25

			if var_230_12 < arg_227_1.time_ and arg_227_1.time_ <= var_230_12 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_14 = arg_227_1:FormatText(StoryNameCfg[61].name)

				arg_227_1.leftNameTxt_.text = var_230_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_15 = arg_227_1:GetWordFromCfg(117032056)
				local var_230_16 = arg_227_1:FormatText(var_230_15.content)

				arg_227_1.text_.text = var_230_16

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_17 = 10
				local var_230_18 = utf8.len(var_230_16)
				local var_230_19 = var_230_17 <= 0 and var_230_13 or var_230_13 * (var_230_18 / var_230_17)

				if var_230_19 > 0 and var_230_13 < var_230_19 then
					arg_227_1.talkMaxDuration = var_230_19

					if var_230_19 + var_230_12 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_19 + var_230_12
					end
				end

				arg_227_1.text_.text = var_230_16
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032056", "story_v_out_117032.awb") ~= 0 then
					local var_230_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032056", "story_v_out_117032.awb") / 1000

					if var_230_20 + var_230_12 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_20 + var_230_12
					end

					if var_230_15.prefab_name ~= "" and arg_227_1.actors_[var_230_15.prefab_name] ~= nil then
						local var_230_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_15.prefab_name].transform, "story_v_out_117032", "117032056", "story_v_out_117032.awb")

						arg_227_1:RecordAudio("117032056", var_230_21)
						arg_227_1:RecordAudio("117032056", var_230_21)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_117032", "117032056", "story_v_out_117032.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_117032", "117032056", "story_v_out_117032.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_22 = math.max(var_230_13, arg_227_1.talkMaxDuration)

			if var_230_12 <= arg_227_1.time_ and arg_227_1.time_ < var_230_12 + var_230_22 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_12) / var_230_22

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_12 + var_230_22 and arg_227_1.time_ < var_230_12 + var_230_22 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play117032057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 117032057
		arg_231_1.duration_ = 1.266

		local var_231_0 = {
			zh = 1.266,
			ja = 1.166
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
				arg_231_0:Play117032058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1132"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.actorSpriteComps1132 == nil then
				arg_231_1.var_.actorSpriteComps1132 = var_234_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_234_2 = 0.2

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.actorSpriteComps1132 then
					for iter_234_0, iter_234_1 in pairs(arg_231_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_234_1 then
							local var_234_4 = Mathf.Lerp(iter_234_1.color.r, 0.5, var_234_3)

							iter_234_1.color = Color.New(var_234_4, var_234_4, var_234_4)
						end
					end
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.actorSpriteComps1132 then
				local var_234_5 = 0.5

				for iter_234_2, iter_234_3 in pairs(arg_231_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_234_3 then
						iter_234_3.color = Color.New(var_234_5, var_234_5, var_234_5)
					end
				end

				arg_231_1.var_.actorSpriteComps1132 = nil
			end

			local var_234_6 = arg_231_1.actors_["10035"]
			local var_234_7 = 0

			if var_234_7 < arg_231_1.time_ and arg_231_1.time_ <= var_234_7 + arg_234_0 and arg_231_1.var_.actorSpriteComps10035 == nil then
				arg_231_1.var_.actorSpriteComps10035 = var_234_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_234_8 = 0.2

			if var_234_7 <= arg_231_1.time_ and arg_231_1.time_ < var_234_7 + var_234_8 then
				local var_234_9 = (arg_231_1.time_ - var_234_7) / var_234_8

				if arg_231_1.var_.actorSpriteComps10035 then
					for iter_234_4, iter_234_5 in pairs(arg_231_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_234_5 then
							local var_234_10 = Mathf.Lerp(iter_234_5.color.r, 1, var_234_9)

							iter_234_5.color = Color.New(var_234_10, var_234_10, var_234_10)
						end
					end
				end
			end

			if arg_231_1.time_ >= var_234_7 + var_234_8 and arg_231_1.time_ < var_234_7 + var_234_8 + arg_234_0 and arg_231_1.var_.actorSpriteComps10035 then
				local var_234_11 = 1

				for iter_234_6, iter_234_7 in pairs(arg_231_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_234_7 then
						iter_234_7.color = Color.New(var_234_11, var_234_11, var_234_11)
					end
				end

				arg_231_1.var_.actorSpriteComps10035 = nil
			end

			local var_234_12 = 0
			local var_234_13 = 0.1

			if var_234_12 < arg_231_1.time_ and arg_231_1.time_ <= var_234_12 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_14 = arg_231_1:FormatText(StoryNameCfg[369].name)

				arg_231_1.leftNameTxt_.text = var_234_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_15 = arg_231_1:GetWordFromCfg(117032057)
				local var_234_16 = arg_231_1:FormatText(var_234_15.content)

				arg_231_1.text_.text = var_234_16

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_17 = 4
				local var_234_18 = utf8.len(var_234_16)
				local var_234_19 = var_234_17 <= 0 and var_234_13 or var_234_13 * (var_234_18 / var_234_17)

				if var_234_19 > 0 and var_234_13 < var_234_19 then
					arg_231_1.talkMaxDuration = var_234_19

					if var_234_19 + var_234_12 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_19 + var_234_12
					end
				end

				arg_231_1.text_.text = var_234_16
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032057", "story_v_out_117032.awb") ~= 0 then
					local var_234_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032057", "story_v_out_117032.awb") / 1000

					if var_234_20 + var_234_12 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_20 + var_234_12
					end

					if var_234_15.prefab_name ~= "" and arg_231_1.actors_[var_234_15.prefab_name] ~= nil then
						local var_234_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_15.prefab_name].transform, "story_v_out_117032", "117032057", "story_v_out_117032.awb")

						arg_231_1:RecordAudio("117032057", var_234_21)
						arg_231_1:RecordAudio("117032057", var_234_21)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_117032", "117032057", "story_v_out_117032.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_117032", "117032057", "story_v_out_117032.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_22 = math.max(var_234_13, arg_231_1.talkMaxDuration)

			if var_234_12 <= arg_231_1.time_ and arg_231_1.time_ < var_234_12 + var_234_22 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_12) / var_234_22

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_12 + var_234_22 and arg_231_1.time_ < var_234_12 + var_234_22 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play117032058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 117032058
		arg_235_1.duration_ = 5

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play117032059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["10035"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos10035 = var_238_0.localPosition
				var_238_0.localScale = Vector3.New(1, 1, 1)

				arg_235_1:CheckSpriteTmpPos("10035", 4)

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
				local var_238_6 = Vector3.New(390, -410, -235)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos10035, var_238_6, var_238_5)
			end

			if arg_235_1.time_ >= var_238_1 + var_238_4 and arg_235_1.time_ < var_238_1 + var_238_4 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(390, -410, -235)
			end

			local var_238_7 = arg_235_1.actors_["10035"]
			local var_238_8 = 0

			if var_238_8 < arg_235_1.time_ and arg_235_1.time_ <= var_238_8 + arg_238_0 and arg_235_1.var_.actorSpriteComps10035 == nil then
				arg_235_1.var_.actorSpriteComps10035 = var_238_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_238_9 = 0.2

			if var_238_8 <= arg_235_1.time_ and arg_235_1.time_ < var_238_8 + var_238_9 then
				local var_238_10 = (arg_235_1.time_ - var_238_8) / var_238_9

				if arg_235_1.var_.actorSpriteComps10035 then
					for iter_238_1, iter_238_2 in pairs(arg_235_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_238_2 then
							local var_238_11 = Mathf.Lerp(iter_238_2.color.r, 0.5, var_238_10)

							iter_238_2.color = Color.New(var_238_11, var_238_11, var_238_11)
						end
					end
				end
			end

			if arg_235_1.time_ >= var_238_8 + var_238_9 and arg_235_1.time_ < var_238_8 + var_238_9 + arg_238_0 and arg_235_1.var_.actorSpriteComps10035 then
				local var_238_12 = 0.5

				for iter_238_3, iter_238_4 in pairs(arg_235_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_238_4 then
						iter_238_4.color = Color.New(var_238_12, var_238_12, var_238_12)
					end
				end

				arg_235_1.var_.actorSpriteComps10035 = nil
			end

			local var_238_13 = 0
			local var_238_14 = 0.875

			if var_238_13 < arg_235_1.time_ and arg_235_1.time_ <= var_238_13 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, false)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_15 = arg_235_1:GetWordFromCfg(117032058)
				local var_238_16 = arg_235_1:FormatText(var_238_15.content)

				arg_235_1.text_.text = var_238_16

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_17 = 35
				local var_238_18 = utf8.len(var_238_16)
				local var_238_19 = var_238_17 <= 0 and var_238_14 or var_238_14 * (var_238_18 / var_238_17)

				if var_238_19 > 0 and var_238_14 < var_238_19 then
					arg_235_1.talkMaxDuration = var_238_19

					if var_238_19 + var_238_13 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_19 + var_238_13
					end
				end

				arg_235_1.text_.text = var_238_16
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)
				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_20 = math.max(var_238_14, arg_235_1.talkMaxDuration)

			if var_238_13 <= arg_235_1.time_ and arg_235_1.time_ < var_238_13 + var_238_20 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_13) / var_238_20

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_13 + var_238_20 and arg_235_1.time_ < var_238_13 + var_238_20 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play117032059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 117032059
		arg_239_1.duration_ = 7.033

		local var_239_0 = {
			zh = 5.7,
			ja = 7.033
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
				arg_239_0:Play117032060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["10035"]
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 and arg_239_1.var_.actorSpriteComps10035 == nil then
				arg_239_1.var_.actorSpriteComps10035 = var_242_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_242_2 = 0.2

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2

				if arg_239_1.var_.actorSpriteComps10035 then
					for iter_242_0, iter_242_1 in pairs(arg_239_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_242_1 then
							local var_242_4 = Mathf.Lerp(iter_242_1.color.r, 1, var_242_3)

							iter_242_1.color = Color.New(var_242_4, var_242_4, var_242_4)
						end
					end
				end
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 and arg_239_1.var_.actorSpriteComps10035 then
				local var_242_5 = 1

				for iter_242_2, iter_242_3 in pairs(arg_239_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_242_3 then
						iter_242_3.color = Color.New(var_242_5, var_242_5, var_242_5)
					end
				end

				arg_239_1.var_.actorSpriteComps10035 = nil
			end

			local var_242_6 = 0
			local var_242_7 = 0.725

			if var_242_6 < arg_239_1.time_ and arg_239_1.time_ <= var_242_6 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_8 = arg_239_1:FormatText(StoryNameCfg[369].name)

				arg_239_1.leftNameTxt_.text = var_242_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_9 = arg_239_1:GetWordFromCfg(117032059)
				local var_242_10 = arg_239_1:FormatText(var_242_9.content)

				arg_239_1.text_.text = var_242_10

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_11 = 29
				local var_242_12 = utf8.len(var_242_10)
				local var_242_13 = var_242_11 <= 0 and var_242_7 or var_242_7 * (var_242_12 / var_242_11)

				if var_242_13 > 0 and var_242_7 < var_242_13 then
					arg_239_1.talkMaxDuration = var_242_13

					if var_242_13 + var_242_6 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_13 + var_242_6
					end
				end

				arg_239_1.text_.text = var_242_10
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032059", "story_v_out_117032.awb") ~= 0 then
					local var_242_14 = manager.audio:GetVoiceLength("story_v_out_117032", "117032059", "story_v_out_117032.awb") / 1000

					if var_242_14 + var_242_6 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_14 + var_242_6
					end

					if var_242_9.prefab_name ~= "" and arg_239_1.actors_[var_242_9.prefab_name] ~= nil then
						local var_242_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_9.prefab_name].transform, "story_v_out_117032", "117032059", "story_v_out_117032.awb")

						arg_239_1:RecordAudio("117032059", var_242_15)
						arg_239_1:RecordAudio("117032059", var_242_15)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_117032", "117032059", "story_v_out_117032.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_117032", "117032059", "story_v_out_117032.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_16 = math.max(var_242_7, arg_239_1.talkMaxDuration)

			if var_242_6 <= arg_239_1.time_ and arg_239_1.time_ < var_242_6 + var_242_16 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_6) / var_242_16

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_6 + var_242_16 and arg_239_1.time_ < var_242_6 + var_242_16 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play117032060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 117032060
		arg_243_1.duration_ = 9.366

		local var_243_0 = {
			zh = 9.366,
			ja = 7.533
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
				arg_243_0:Play117032061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 1.125

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_2 = arg_243_1:FormatText(StoryNameCfg[369].name)

				arg_243_1.leftNameTxt_.text = var_246_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_3 = arg_243_1:GetWordFromCfg(117032060)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032060", "story_v_out_117032.awb") ~= 0 then
					local var_246_8 = manager.audio:GetVoiceLength("story_v_out_117032", "117032060", "story_v_out_117032.awb") / 1000

					if var_246_8 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_8 + var_246_0
					end

					if var_246_3.prefab_name ~= "" and arg_243_1.actors_[var_246_3.prefab_name] ~= nil then
						local var_246_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_3.prefab_name].transform, "story_v_out_117032", "117032060", "story_v_out_117032.awb")

						arg_243_1:RecordAudio("117032060", var_246_9)
						arg_243_1:RecordAudio("117032060", var_246_9)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_117032", "117032060", "story_v_out_117032.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_117032", "117032060", "story_v_out_117032.awb")
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
	Play117032061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 117032061
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play117032062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["10035"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.actorSpriteComps10035 == nil then
				arg_247_1.var_.actorSpriteComps10035 = var_250_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_250_2 = 0.2

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.actorSpriteComps10035 then
					for iter_250_0, iter_250_1 in pairs(arg_247_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_250_1 then
							local var_250_4 = Mathf.Lerp(iter_250_1.color.r, 0.5, var_250_3)

							iter_250_1.color = Color.New(var_250_4, var_250_4, var_250_4)
						end
					end
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.actorSpriteComps10035 then
				local var_250_5 = 0.5

				for iter_250_2, iter_250_3 in pairs(arg_247_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_250_3 then
						iter_250_3.color = Color.New(var_250_5, var_250_5, var_250_5)
					end
				end

				arg_247_1.var_.actorSpriteComps10035 = nil
			end

			local var_250_6 = 0
			local var_250_7 = 0.375

			if var_250_6 < arg_247_1.time_ and arg_247_1.time_ <= var_250_6 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, false)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_8 = arg_247_1:GetWordFromCfg(117032061)
				local var_250_9 = arg_247_1:FormatText(var_250_8.content)

				arg_247_1.text_.text = var_250_9

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_10 = 15
				local var_250_11 = utf8.len(var_250_9)
				local var_250_12 = var_250_10 <= 0 and var_250_7 or var_250_7 * (var_250_11 / var_250_10)

				if var_250_12 > 0 and var_250_7 < var_250_12 then
					arg_247_1.talkMaxDuration = var_250_12

					if var_250_12 + var_250_6 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_12 + var_250_6
					end
				end

				arg_247_1.text_.text = var_250_9
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)
				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_13 = math.max(var_250_7, arg_247_1.talkMaxDuration)

			if var_250_6 <= arg_247_1.time_ and arg_247_1.time_ < var_250_6 + var_250_13 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_6) / var_250_13

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_6 + var_250_13 and arg_247_1.time_ < var_250_6 + var_250_13 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play117032062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 117032062
		arg_251_1.duration_ = 5.633

		local var_251_0 = {
			zh = 5.633,
			ja = 2.9
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
				arg_251_0:Play117032063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1132"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.actorSpriteComps1132 == nil then
				arg_251_1.var_.actorSpriteComps1132 = var_254_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_2 = 0.2

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.actorSpriteComps1132 then
					for iter_254_0, iter_254_1 in pairs(arg_251_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_254_1 then
							local var_254_4 = Mathf.Lerp(iter_254_1.color.r, 1, var_254_3)

							iter_254_1.color = Color.New(var_254_4, var_254_4, var_254_4)
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.actorSpriteComps1132 then
				local var_254_5 = 1

				for iter_254_2, iter_254_3 in pairs(arg_251_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_254_3 then
						iter_254_3.color = Color.New(var_254_5, var_254_5, var_254_5)
					end
				end

				arg_251_1.var_.actorSpriteComps1132 = nil
			end

			local var_254_6 = 0
			local var_254_7 = 0.25

			if var_254_6 < arg_251_1.time_ and arg_251_1.time_ <= var_254_6 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_8 = arg_251_1:FormatText(StoryNameCfg[61].name)

				arg_251_1.leftNameTxt_.text = var_254_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_9 = arg_251_1:GetWordFromCfg(117032062)
				local var_254_10 = arg_251_1:FormatText(var_254_9.content)

				arg_251_1.text_.text = var_254_10

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_11 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032062", "story_v_out_117032.awb") ~= 0 then
					local var_254_14 = manager.audio:GetVoiceLength("story_v_out_117032", "117032062", "story_v_out_117032.awb") / 1000

					if var_254_14 + var_254_6 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_14 + var_254_6
					end

					if var_254_9.prefab_name ~= "" and arg_251_1.actors_[var_254_9.prefab_name] ~= nil then
						local var_254_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_9.prefab_name].transform, "story_v_out_117032", "117032062", "story_v_out_117032.awb")

						arg_251_1:RecordAudio("117032062", var_254_15)
						arg_251_1:RecordAudio("117032062", var_254_15)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_117032", "117032062", "story_v_out_117032.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_117032", "117032062", "story_v_out_117032.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_16 = math.max(var_254_7, arg_251_1.talkMaxDuration)

			if var_254_6 <= arg_251_1.time_ and arg_251_1.time_ < var_254_6 + var_254_16 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_6) / var_254_16

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_6 + var_254_16 and arg_251_1.time_ < var_254_6 + var_254_16 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play117032063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 117032063
		arg_255_1.duration_ = 2.866

		local var_255_0 = {
			zh = 2.866,
			ja = 2.8
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
				arg_255_0:Play117032064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["10035"]
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 and arg_255_1.var_.actorSpriteComps10035 == nil then
				arg_255_1.var_.actorSpriteComps10035 = var_258_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_258_2 = 0.2

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2

				if arg_255_1.var_.actorSpriteComps10035 then
					for iter_258_0, iter_258_1 in pairs(arg_255_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_258_1 then
							local var_258_4 = Mathf.Lerp(iter_258_1.color.r, 1, var_258_3)

							iter_258_1.color = Color.New(var_258_4, var_258_4, var_258_4)
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 and arg_255_1.var_.actorSpriteComps10035 then
				local var_258_5 = 1

				for iter_258_2, iter_258_3 in pairs(arg_255_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_258_3 then
						iter_258_3.color = Color.New(var_258_5, var_258_5, var_258_5)
					end
				end

				arg_255_1.var_.actorSpriteComps10035 = nil
			end

			local var_258_6 = arg_255_1.actors_["1132"]
			local var_258_7 = 0

			if var_258_7 < arg_255_1.time_ and arg_255_1.time_ <= var_258_7 + arg_258_0 and arg_255_1.var_.actorSpriteComps1132 == nil then
				arg_255_1.var_.actorSpriteComps1132 = var_258_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_258_8 = 0.2

			if var_258_7 <= arg_255_1.time_ and arg_255_1.time_ < var_258_7 + var_258_8 then
				local var_258_9 = (arg_255_1.time_ - var_258_7) / var_258_8

				if arg_255_1.var_.actorSpriteComps1132 then
					for iter_258_4, iter_258_5 in pairs(arg_255_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_258_5 then
							local var_258_10 = Mathf.Lerp(iter_258_5.color.r, 0.5, var_258_9)

							iter_258_5.color = Color.New(var_258_10, var_258_10, var_258_10)
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_7 + var_258_8 and arg_255_1.time_ < var_258_7 + var_258_8 + arg_258_0 and arg_255_1.var_.actorSpriteComps1132 then
				local var_258_11 = 0.5

				for iter_258_6, iter_258_7 in pairs(arg_255_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_258_7 then
						iter_258_7.color = Color.New(var_258_11, var_258_11, var_258_11)
					end
				end

				arg_255_1.var_.actorSpriteComps1132 = nil
			end

			local var_258_12 = 0
			local var_258_13 = 0.375

			if var_258_12 < arg_255_1.time_ and arg_255_1.time_ <= var_258_12 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_14 = arg_255_1:FormatText(StoryNameCfg[369].name)

				arg_255_1.leftNameTxt_.text = var_258_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_15 = arg_255_1:GetWordFromCfg(117032063)
				local var_258_16 = arg_255_1:FormatText(var_258_15.content)

				arg_255_1.text_.text = var_258_16

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_17 = 15
				local var_258_18 = utf8.len(var_258_16)
				local var_258_19 = var_258_17 <= 0 and var_258_13 or var_258_13 * (var_258_18 / var_258_17)

				if var_258_19 > 0 and var_258_13 < var_258_19 then
					arg_255_1.talkMaxDuration = var_258_19

					if var_258_19 + var_258_12 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_19 + var_258_12
					end
				end

				arg_255_1.text_.text = var_258_16
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032063", "story_v_out_117032.awb") ~= 0 then
					local var_258_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032063", "story_v_out_117032.awb") / 1000

					if var_258_20 + var_258_12 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_20 + var_258_12
					end

					if var_258_15.prefab_name ~= "" and arg_255_1.actors_[var_258_15.prefab_name] ~= nil then
						local var_258_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_15.prefab_name].transform, "story_v_out_117032", "117032063", "story_v_out_117032.awb")

						arg_255_1:RecordAudio("117032063", var_258_21)
						arg_255_1:RecordAudio("117032063", var_258_21)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_117032", "117032063", "story_v_out_117032.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_117032", "117032063", "story_v_out_117032.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_22 = math.max(var_258_13, arg_255_1.talkMaxDuration)

			if var_258_12 <= arg_255_1.time_ and arg_255_1.time_ < var_258_12 + var_258_22 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_12) / var_258_22

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_12 + var_258_22 and arg_255_1.time_ < var_258_12 + var_258_22 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play117032064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 117032064
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play117032065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["10035"]
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				local var_262_2 = var_262_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_262_2 then
					arg_259_1.var_.alphaOldValue10035 = var_262_2.alpha
					arg_259_1.var_.characterEffect10035 = var_262_2
				end

				arg_259_1.var_.alphaOldValue10035 = 1
			end

			local var_262_3 = 0.333333333333333

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_3 then
				local var_262_4 = (arg_259_1.time_ - var_262_1) / var_262_3
				local var_262_5 = Mathf.Lerp(arg_259_1.var_.alphaOldValue10035, 0, var_262_4)

				if arg_259_1.var_.characterEffect10035 then
					arg_259_1.var_.characterEffect10035.alpha = var_262_5
				end
			end

			if arg_259_1.time_ >= var_262_1 + var_262_3 and arg_259_1.time_ < var_262_1 + var_262_3 + arg_262_0 and arg_259_1.var_.characterEffect10035 then
				arg_259_1.var_.characterEffect10035.alpha = 0
			end

			local var_262_6 = arg_259_1.actors_["1132"]
			local var_262_7 = 0

			if var_262_7 < arg_259_1.time_ and arg_259_1.time_ <= var_262_7 + arg_262_0 then
				local var_262_8 = var_262_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_262_8 then
					arg_259_1.var_.alphaOldValue1132 = var_262_8.alpha
					arg_259_1.var_.characterEffect1132 = var_262_8
				end

				arg_259_1.var_.alphaOldValue1132 = 1
			end

			local var_262_9 = 0.333333333333333

			if var_262_7 <= arg_259_1.time_ and arg_259_1.time_ < var_262_7 + var_262_9 then
				local var_262_10 = (arg_259_1.time_ - var_262_7) / var_262_9
				local var_262_11 = Mathf.Lerp(arg_259_1.var_.alphaOldValue1132, 0, var_262_10)

				if arg_259_1.var_.characterEffect1132 then
					arg_259_1.var_.characterEffect1132.alpha = var_262_11
				end
			end

			if arg_259_1.time_ >= var_262_7 + var_262_9 and arg_259_1.time_ < var_262_7 + var_262_9 + arg_262_0 and arg_259_1.var_.characterEffect1132 then
				arg_259_1.var_.characterEffect1132.alpha = 0
			end

			local var_262_12 = 0
			local var_262_13 = 1.075

			if var_262_12 < arg_259_1.time_ and arg_259_1.time_ <= var_262_12 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, false)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_14 = arg_259_1:GetWordFromCfg(117032064)
				local var_262_15 = arg_259_1:FormatText(var_262_14.content)

				arg_259_1.text_.text = var_262_15

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_16 = 43
				local var_262_17 = utf8.len(var_262_15)
				local var_262_18 = var_262_16 <= 0 and var_262_13 or var_262_13 * (var_262_17 / var_262_16)

				if var_262_18 > 0 and var_262_13 < var_262_18 then
					arg_259_1.talkMaxDuration = var_262_18

					if var_262_18 + var_262_12 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_18 + var_262_12
					end
				end

				arg_259_1.text_.text = var_262_15
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_19 = math.max(var_262_13, arg_259_1.talkMaxDuration)

			if var_262_12 <= arg_259_1.time_ and arg_259_1.time_ < var_262_12 + var_262_19 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_12) / var_262_19

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_12 + var_262_19 and arg_259_1.time_ < var_262_12 + var_262_19 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play117032065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 117032065
		arg_263_1.duration_ = 7.7

		local var_263_0 = {
			zh = 5.233,
			ja = 7.7
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
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play117032066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1132"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos1132 = var_266_0.localPosition
				var_266_0.localScale = Vector3.New(1, 1, 1)

				arg_263_1:CheckSpriteTmpPos("1132", 2)

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
				local var_266_6 = Vector3.New(-390, -413, -185)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1132, var_266_6, var_266_5)
			end

			if arg_263_1.time_ >= var_266_1 + var_266_4 and arg_263_1.time_ < var_266_1 + var_266_4 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_266_7 = arg_263_1.actors_["1132"]
			local var_266_8 = 0

			if var_266_8 < arg_263_1.time_ and arg_263_1.time_ <= var_266_8 + arg_266_0 then
				local var_266_9 = var_266_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_266_9 then
					arg_263_1.var_.alphaOldValue1132 = var_266_9.alpha
					arg_263_1.var_.characterEffect1132 = var_266_9
				end

				arg_263_1.var_.alphaOldValue1132 = 0
			end

			local var_266_10 = 0.333333333333333

			if var_266_8 <= arg_263_1.time_ and arg_263_1.time_ < var_266_8 + var_266_10 then
				local var_266_11 = (arg_263_1.time_ - var_266_8) / var_266_10
				local var_266_12 = Mathf.Lerp(arg_263_1.var_.alphaOldValue1132, 1, var_266_11)

				if arg_263_1.var_.characterEffect1132 then
					arg_263_1.var_.characterEffect1132.alpha = var_266_12
				end
			end

			if arg_263_1.time_ >= var_266_8 + var_266_10 and arg_263_1.time_ < var_266_8 + var_266_10 + arg_266_0 and arg_263_1.var_.characterEffect1132 then
				arg_263_1.var_.characterEffect1132.alpha = 1
			end

			local var_266_13 = arg_263_1.actors_["1132"]
			local var_266_14 = 0

			if var_266_14 < arg_263_1.time_ and arg_263_1.time_ <= var_266_14 + arg_266_0 and arg_263_1.var_.actorSpriteComps1132 == nil then
				arg_263_1.var_.actorSpriteComps1132 = var_266_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_15 = 0.2

			if var_266_14 <= arg_263_1.time_ and arg_263_1.time_ < var_266_14 + var_266_15 then
				local var_266_16 = (arg_263_1.time_ - var_266_14) / var_266_15

				if arg_263_1.var_.actorSpriteComps1132 then
					for iter_266_1, iter_266_2 in pairs(arg_263_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_266_2 then
							local var_266_17 = Mathf.Lerp(iter_266_2.color.r, 1, var_266_16)

							iter_266_2.color = Color.New(var_266_17, var_266_17, var_266_17)
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_14 + var_266_15 and arg_263_1.time_ < var_266_14 + var_266_15 + arg_266_0 and arg_263_1.var_.actorSpriteComps1132 then
				local var_266_18 = 1

				for iter_266_3, iter_266_4 in pairs(arg_263_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_266_4 then
						iter_266_4.color = Color.New(var_266_18, var_266_18, var_266_18)
					end
				end

				arg_263_1.var_.actorSpriteComps1132 = nil
			end

			local var_266_19 = 0
			local var_266_20 = 0.5

			if var_266_19 < arg_263_1.time_ and arg_263_1.time_ <= var_266_19 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_21 = arg_263_1:FormatText(StoryNameCfg[61].name)

				arg_263_1.leftNameTxt_.text = var_266_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_22 = arg_263_1:GetWordFromCfg(117032065)
				local var_266_23 = arg_263_1:FormatText(var_266_22.content)

				arg_263_1.text_.text = var_266_23

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_24 = 20
				local var_266_25 = utf8.len(var_266_23)
				local var_266_26 = var_266_24 <= 0 and var_266_20 or var_266_20 * (var_266_25 / var_266_24)

				if var_266_26 > 0 and var_266_20 < var_266_26 then
					arg_263_1.talkMaxDuration = var_266_26

					if var_266_26 + var_266_19 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_26 + var_266_19
					end
				end

				arg_263_1.text_.text = var_266_23
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032065", "story_v_out_117032.awb") ~= 0 then
					local var_266_27 = manager.audio:GetVoiceLength("story_v_out_117032", "117032065", "story_v_out_117032.awb") / 1000

					if var_266_27 + var_266_19 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_27 + var_266_19
					end

					if var_266_22.prefab_name ~= "" and arg_263_1.actors_[var_266_22.prefab_name] ~= nil then
						local var_266_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_22.prefab_name].transform, "story_v_out_117032", "117032065", "story_v_out_117032.awb")

						arg_263_1:RecordAudio("117032065", var_266_28)
						arg_263_1:RecordAudio("117032065", var_266_28)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_117032", "117032065", "story_v_out_117032.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_117032", "117032065", "story_v_out_117032.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_29 = math.max(var_266_20, arg_263_1.talkMaxDuration)

			if var_266_19 <= arg_263_1.time_ and arg_263_1.time_ < var_266_19 + var_266_29 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_19) / var_266_29

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_19 + var_266_29 and arg_263_1.time_ < var_266_19 + var_266_29 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play117032066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 117032066
		arg_267_1.duration_ = 2.6

		local var_267_0 = {
			zh = 1.7,
			ja = 2.6
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
				arg_267_0:Play117032067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1033"].transform
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 then
				arg_267_1.var_.moveOldPos1033 = var_270_0.localPosition
				var_270_0.localScale = Vector3.New(1, 1, 1)

				arg_267_1:CheckSpriteTmpPos("1033", 4)

				local var_270_2 = var_270_0.childCount

				for iter_270_0 = 0, var_270_2 - 1 do
					local var_270_3 = var_270_0:GetChild(iter_270_0)

					if var_270_3.name == "split_6" or not string.find(var_270_3.name, "split") then
						var_270_3.gameObject:SetActive(true)
					else
						var_270_3.gameObject:SetActive(false)
					end
				end
			end

			local var_270_4 = 0.001

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_4 then
				local var_270_5 = (arg_267_1.time_ - var_270_1) / var_270_4
				local var_270_6 = Vector3.New(390, -420, 0)

				var_270_0.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1033, var_270_6, var_270_5)
			end

			if arg_267_1.time_ >= var_270_1 + var_270_4 and arg_267_1.time_ < var_270_1 + var_270_4 + arg_270_0 then
				var_270_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_270_7 = arg_267_1.actors_["1132"]
			local var_270_8 = 0

			if var_270_8 < arg_267_1.time_ and arg_267_1.time_ <= var_270_8 + arg_270_0 and arg_267_1.var_.actorSpriteComps1132 == nil then
				arg_267_1.var_.actorSpriteComps1132 = var_270_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_9 = 0.2

			if var_270_8 <= arg_267_1.time_ and arg_267_1.time_ < var_270_8 + var_270_9 then
				local var_270_10 = (arg_267_1.time_ - var_270_8) / var_270_9

				if arg_267_1.var_.actorSpriteComps1132 then
					for iter_270_1, iter_270_2 in pairs(arg_267_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_270_2 then
							local var_270_11 = Mathf.Lerp(iter_270_2.color.r, 0.5, var_270_10)

							iter_270_2.color = Color.New(var_270_11, var_270_11, var_270_11)
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_8 + var_270_9 and arg_267_1.time_ < var_270_8 + var_270_9 + arg_270_0 and arg_267_1.var_.actorSpriteComps1132 then
				local var_270_12 = 0.5

				for iter_270_3, iter_270_4 in pairs(arg_267_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_270_4 then
						iter_270_4.color = Color.New(var_270_12, var_270_12, var_270_12)
					end
				end

				arg_267_1.var_.actorSpriteComps1132 = nil
			end

			local var_270_13 = arg_267_1.actors_["1033"]
			local var_270_14 = 0

			if var_270_14 < arg_267_1.time_ and arg_267_1.time_ <= var_270_14 + arg_270_0 and arg_267_1.var_.actorSpriteComps1033 == nil then
				arg_267_1.var_.actorSpriteComps1033 = var_270_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_15 = 0.2

			if var_270_14 <= arg_267_1.time_ and arg_267_1.time_ < var_270_14 + var_270_15 then
				local var_270_16 = (arg_267_1.time_ - var_270_14) / var_270_15

				if arg_267_1.var_.actorSpriteComps1033 then
					for iter_270_5, iter_270_6 in pairs(arg_267_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_270_6 then
							local var_270_17 = Mathf.Lerp(iter_270_6.color.r, 1, var_270_16)

							iter_270_6.color = Color.New(var_270_17, var_270_17, var_270_17)
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_14 + var_270_15 and arg_267_1.time_ < var_270_14 + var_270_15 + arg_270_0 and arg_267_1.var_.actorSpriteComps1033 then
				local var_270_18 = 1

				for iter_270_7, iter_270_8 in pairs(arg_267_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_270_8 then
						iter_270_8.color = Color.New(var_270_18, var_270_18, var_270_18)
					end
				end

				arg_267_1.var_.actorSpriteComps1033 = nil
			end

			local var_270_19 = arg_267_1.actors_["1033"]
			local var_270_20 = 0

			if var_270_20 < arg_267_1.time_ and arg_267_1.time_ <= var_270_20 + arg_270_0 then
				local var_270_21 = var_270_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_270_21 then
					arg_267_1.var_.alphaOldValue1033 = var_270_21.alpha
					arg_267_1.var_.characterEffect1033 = var_270_21
				end

				arg_267_1.var_.alphaOldValue1033 = 0
			end

			local var_270_22 = 0.2

			if var_270_20 <= arg_267_1.time_ and arg_267_1.time_ < var_270_20 + var_270_22 then
				local var_270_23 = (arg_267_1.time_ - var_270_20) / var_270_22
				local var_270_24 = Mathf.Lerp(arg_267_1.var_.alphaOldValue1033, 1, var_270_23)

				if arg_267_1.var_.characterEffect1033 then
					arg_267_1.var_.characterEffect1033.alpha = var_270_24
				end
			end

			if arg_267_1.time_ >= var_270_20 + var_270_22 and arg_267_1.time_ < var_270_20 + var_270_22 + arg_270_0 and arg_267_1.var_.characterEffect1033 then
				arg_267_1.var_.characterEffect1033.alpha = 1
			end

			local var_270_25 = 0
			local var_270_26 = 0.225

			if var_270_25 < arg_267_1.time_ and arg_267_1.time_ <= var_270_25 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_27 = arg_267_1:FormatText(StoryNameCfg[236].name)

				arg_267_1.leftNameTxt_.text = var_270_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_28 = arg_267_1:GetWordFromCfg(117032066)
				local var_270_29 = arg_267_1:FormatText(var_270_28.content)

				arg_267_1.text_.text = var_270_29

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_30 = 9
				local var_270_31 = utf8.len(var_270_29)
				local var_270_32 = var_270_30 <= 0 and var_270_26 or var_270_26 * (var_270_31 / var_270_30)

				if var_270_32 > 0 and var_270_26 < var_270_32 then
					arg_267_1.talkMaxDuration = var_270_32

					if var_270_32 + var_270_25 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_32 + var_270_25
					end
				end

				arg_267_1.text_.text = var_270_29
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032066", "story_v_out_117032.awb") ~= 0 then
					local var_270_33 = manager.audio:GetVoiceLength("story_v_out_117032", "117032066", "story_v_out_117032.awb") / 1000

					if var_270_33 + var_270_25 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_33 + var_270_25
					end

					if var_270_28.prefab_name ~= "" and arg_267_1.actors_[var_270_28.prefab_name] ~= nil then
						local var_270_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_28.prefab_name].transform, "story_v_out_117032", "117032066", "story_v_out_117032.awb")

						arg_267_1:RecordAudio("117032066", var_270_34)
						arg_267_1:RecordAudio("117032066", var_270_34)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_117032", "117032066", "story_v_out_117032.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_117032", "117032066", "story_v_out_117032.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_35 = math.max(var_270_26, arg_267_1.talkMaxDuration)

			if var_270_25 <= arg_267_1.time_ and arg_267_1.time_ < var_270_25 + var_270_35 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_25) / var_270_35

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_25 + var_270_35 and arg_267_1.time_ < var_270_25 + var_270_35 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play117032067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 117032067
		arg_271_1.duration_ = 6.466

		local var_271_0 = {
			zh = 6.366,
			ja = 6.466
		}
		local var_271_1 = manager.audio:GetLocalizationFlag()

		if var_271_0[var_271_1] ~= nil then
			arg_271_1.duration_ = var_271_0[var_271_1]
		end

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play117032068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 0
			local var_274_1 = 0.875

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_2 = arg_271_1:FormatText(StoryNameCfg[236].name)

				arg_271_1.leftNameTxt_.text = var_274_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_3 = arg_271_1:GetWordFromCfg(117032067)
				local var_274_4 = arg_271_1:FormatText(var_274_3.content)

				arg_271_1.text_.text = var_274_4

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_5 = 35
				local var_274_6 = utf8.len(var_274_4)
				local var_274_7 = var_274_5 <= 0 and var_274_1 or var_274_1 * (var_274_6 / var_274_5)

				if var_274_7 > 0 and var_274_1 < var_274_7 then
					arg_271_1.talkMaxDuration = var_274_7

					if var_274_7 + var_274_0 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_7 + var_274_0
					end
				end

				arg_271_1.text_.text = var_274_4
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032067", "story_v_out_117032.awb") ~= 0 then
					local var_274_8 = manager.audio:GetVoiceLength("story_v_out_117032", "117032067", "story_v_out_117032.awb") / 1000

					if var_274_8 + var_274_0 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_8 + var_274_0
					end

					if var_274_3.prefab_name ~= "" and arg_271_1.actors_[var_274_3.prefab_name] ~= nil then
						local var_274_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_3.prefab_name].transform, "story_v_out_117032", "117032067", "story_v_out_117032.awb")

						arg_271_1:RecordAudio("117032067", var_274_9)
						arg_271_1:RecordAudio("117032067", var_274_9)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_117032", "117032067", "story_v_out_117032.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_117032", "117032067", "story_v_out_117032.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_10 = math.max(var_274_1, arg_271_1.talkMaxDuration)

			if var_274_0 <= arg_271_1.time_ and arg_271_1.time_ < var_274_0 + var_274_10 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_0) / var_274_10

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_0 + var_274_10 and arg_271_1.time_ < var_274_0 + var_274_10 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play117032068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 117032068
		arg_275_1.duration_ = 10.533

		local var_275_0 = {
			zh = 10.366,
			ja = 10.533
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
				arg_275_0:Play117032069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1132"]
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 and arg_275_1.var_.actorSpriteComps1132 == nil then
				arg_275_1.var_.actorSpriteComps1132 = var_278_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_278_2 = 0.2

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2

				if arg_275_1.var_.actorSpriteComps1132 then
					for iter_278_0, iter_278_1 in pairs(arg_275_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_278_1 then
							local var_278_4 = Mathf.Lerp(iter_278_1.color.r, 1, var_278_3)

							iter_278_1.color = Color.New(var_278_4, var_278_4, var_278_4)
						end
					end
				end
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 and arg_275_1.var_.actorSpriteComps1132 then
				local var_278_5 = 1

				for iter_278_2, iter_278_3 in pairs(arg_275_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_278_3 then
						iter_278_3.color = Color.New(var_278_5, var_278_5, var_278_5)
					end
				end

				arg_275_1.var_.actorSpriteComps1132 = nil
			end

			local var_278_6 = arg_275_1.actors_["1033"]
			local var_278_7 = 0

			if var_278_7 < arg_275_1.time_ and arg_275_1.time_ <= var_278_7 + arg_278_0 and arg_275_1.var_.actorSpriteComps1033 == nil then
				arg_275_1.var_.actorSpriteComps1033 = var_278_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_278_8 = 0.2

			if var_278_7 <= arg_275_1.time_ and arg_275_1.time_ < var_278_7 + var_278_8 then
				local var_278_9 = (arg_275_1.time_ - var_278_7) / var_278_8

				if arg_275_1.var_.actorSpriteComps1033 then
					for iter_278_4, iter_278_5 in pairs(arg_275_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_278_5 then
							local var_278_10 = Mathf.Lerp(iter_278_5.color.r, 0.5, var_278_9)

							iter_278_5.color = Color.New(var_278_10, var_278_10, var_278_10)
						end
					end
				end
			end

			if arg_275_1.time_ >= var_278_7 + var_278_8 and arg_275_1.time_ < var_278_7 + var_278_8 + arg_278_0 and arg_275_1.var_.actorSpriteComps1033 then
				local var_278_11 = 0.5

				for iter_278_6, iter_278_7 in pairs(arg_275_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_278_7 then
						iter_278_7.color = Color.New(var_278_11, var_278_11, var_278_11)
					end
				end

				arg_275_1.var_.actorSpriteComps1033 = nil
			end

			local var_278_12 = 0
			local var_278_13 = 0.8

			if var_278_12 < arg_275_1.time_ and arg_275_1.time_ <= var_278_12 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_14 = arg_275_1:FormatText(StoryNameCfg[61].name)

				arg_275_1.leftNameTxt_.text = var_278_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_15 = arg_275_1:GetWordFromCfg(117032068)
				local var_278_16 = arg_275_1:FormatText(var_278_15.content)

				arg_275_1.text_.text = var_278_16

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_17 = 32
				local var_278_18 = utf8.len(var_278_16)
				local var_278_19 = var_278_17 <= 0 and var_278_13 or var_278_13 * (var_278_18 / var_278_17)

				if var_278_19 > 0 and var_278_13 < var_278_19 then
					arg_275_1.talkMaxDuration = var_278_19

					if var_278_19 + var_278_12 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_19 + var_278_12
					end
				end

				arg_275_1.text_.text = var_278_16
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032068", "story_v_out_117032.awb") ~= 0 then
					local var_278_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032068", "story_v_out_117032.awb") / 1000

					if var_278_20 + var_278_12 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_20 + var_278_12
					end

					if var_278_15.prefab_name ~= "" and arg_275_1.actors_[var_278_15.prefab_name] ~= nil then
						local var_278_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_15.prefab_name].transform, "story_v_out_117032", "117032068", "story_v_out_117032.awb")

						arg_275_1:RecordAudio("117032068", var_278_21)
						arg_275_1:RecordAudio("117032068", var_278_21)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_117032", "117032068", "story_v_out_117032.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_117032", "117032068", "story_v_out_117032.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_22 = math.max(var_278_13, arg_275_1.talkMaxDuration)

			if var_278_12 <= arg_275_1.time_ and arg_275_1.time_ < var_278_12 + var_278_22 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_12) / var_278_22

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_12 + var_278_22 and arg_275_1.time_ < var_278_12 + var_278_22 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play117032069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 117032069
		arg_279_1.duration_ = 9.833

		local var_279_0 = {
			zh = 7.133,
			ja = 9.833
		}
		local var_279_1 = manager.audio:GetLocalizationFlag()

		if var_279_0[var_279_1] ~= nil then
			arg_279_1.duration_ = var_279_0[var_279_1]
		end

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play117032070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1132"]
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 and arg_279_1.var_.actorSpriteComps1132 == nil then
				arg_279_1.var_.actorSpriteComps1132 = var_282_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_282_2 = 0.2

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2

				if arg_279_1.var_.actorSpriteComps1132 then
					for iter_282_0, iter_282_1 in pairs(arg_279_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_282_1 then
							local var_282_4 = Mathf.Lerp(iter_282_1.color.r, 0.5, var_282_3)

							iter_282_1.color = Color.New(var_282_4, var_282_4, var_282_4)
						end
					end
				end
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 and arg_279_1.var_.actorSpriteComps1132 then
				local var_282_5 = 0.5

				for iter_282_2, iter_282_3 in pairs(arg_279_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_282_3 then
						iter_282_3.color = Color.New(var_282_5, var_282_5, var_282_5)
					end
				end

				arg_279_1.var_.actorSpriteComps1132 = nil
			end

			local var_282_6 = arg_279_1.actors_["1033"]
			local var_282_7 = 0

			if var_282_7 < arg_279_1.time_ and arg_279_1.time_ <= var_282_7 + arg_282_0 and arg_279_1.var_.actorSpriteComps1033 == nil then
				arg_279_1.var_.actorSpriteComps1033 = var_282_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_282_8 = 0.2

			if var_282_7 <= arg_279_1.time_ and arg_279_1.time_ < var_282_7 + var_282_8 then
				local var_282_9 = (arg_279_1.time_ - var_282_7) / var_282_8

				if arg_279_1.var_.actorSpriteComps1033 then
					for iter_282_4, iter_282_5 in pairs(arg_279_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_282_5 then
							local var_282_10 = Mathf.Lerp(iter_282_5.color.r, 1, var_282_9)

							iter_282_5.color = Color.New(var_282_10, var_282_10, var_282_10)
						end
					end
				end
			end

			if arg_279_1.time_ >= var_282_7 + var_282_8 and arg_279_1.time_ < var_282_7 + var_282_8 + arg_282_0 and arg_279_1.var_.actorSpriteComps1033 then
				local var_282_11 = 1

				for iter_282_6, iter_282_7 in pairs(arg_279_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_282_7 then
						iter_282_7.color = Color.New(var_282_11, var_282_11, var_282_11)
					end
				end

				arg_279_1.var_.actorSpriteComps1033 = nil
			end

			local var_282_12 = 0
			local var_282_13 = 0.925

			if var_282_12 < arg_279_1.time_ and arg_279_1.time_ <= var_282_12 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_14 = arg_279_1:FormatText(StoryNameCfg[236].name)

				arg_279_1.leftNameTxt_.text = var_282_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_15 = arg_279_1:GetWordFromCfg(117032069)
				local var_282_16 = arg_279_1:FormatText(var_282_15.content)

				arg_279_1.text_.text = var_282_16

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_17 = 37
				local var_282_18 = utf8.len(var_282_16)
				local var_282_19 = var_282_17 <= 0 and var_282_13 or var_282_13 * (var_282_18 / var_282_17)

				if var_282_19 > 0 and var_282_13 < var_282_19 then
					arg_279_1.talkMaxDuration = var_282_19

					if var_282_19 + var_282_12 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_19 + var_282_12
					end
				end

				arg_279_1.text_.text = var_282_16
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032069", "story_v_out_117032.awb") ~= 0 then
					local var_282_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032069", "story_v_out_117032.awb") / 1000

					if var_282_20 + var_282_12 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_20 + var_282_12
					end

					if var_282_15.prefab_name ~= "" and arg_279_1.actors_[var_282_15.prefab_name] ~= nil then
						local var_282_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_15.prefab_name].transform, "story_v_out_117032", "117032069", "story_v_out_117032.awb")

						arg_279_1:RecordAudio("117032069", var_282_21)
						arg_279_1:RecordAudio("117032069", var_282_21)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_117032", "117032069", "story_v_out_117032.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_117032", "117032069", "story_v_out_117032.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_22 = math.max(var_282_13, arg_279_1.talkMaxDuration)

			if var_282_12 <= arg_279_1.time_ and arg_279_1.time_ < var_282_12 + var_282_22 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_12) / var_282_22

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_12 + var_282_22 and arg_279_1.time_ < var_282_12 + var_282_22 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play117032070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 117032070
		arg_283_1.duration_ = 5

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play117032071(arg_283_1)
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
							local var_286_4 = Mathf.Lerp(iter_286_1.color.r, 0.5, var_286_3)

							iter_286_1.color = Color.New(var_286_4, var_286_4, var_286_4)
						end
					end
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 and arg_283_1.var_.actorSpriteComps1033 then
				local var_286_5 = 0.5

				for iter_286_2, iter_286_3 in pairs(arg_283_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_286_3 then
						iter_286_3.color = Color.New(var_286_5, var_286_5, var_286_5)
					end
				end

				arg_283_1.var_.actorSpriteComps1033 = nil
			end

			local var_286_6 = 0
			local var_286_7 = 0.75

			if var_286_6 < arg_283_1.time_ and arg_283_1.time_ <= var_286_6 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, false)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_8 = arg_283_1:GetWordFromCfg(117032070)
				local var_286_9 = arg_283_1:FormatText(var_286_8.content)

				arg_283_1.text_.text = var_286_9

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_10 = 30
				local var_286_11 = utf8.len(var_286_9)
				local var_286_12 = var_286_10 <= 0 and var_286_7 or var_286_7 * (var_286_11 / var_286_10)

				if var_286_12 > 0 and var_286_7 < var_286_12 then
					arg_283_1.talkMaxDuration = var_286_12

					if var_286_12 + var_286_6 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_12 + var_286_6
					end
				end

				arg_283_1.text_.text = var_286_9
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)
				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_13 = math.max(var_286_7, arg_283_1.talkMaxDuration)

			if var_286_6 <= arg_283_1.time_ and arg_283_1.time_ < var_286_6 + var_286_13 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_6) / var_286_13

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_6 + var_286_13 and arg_283_1.time_ < var_286_6 + var_286_13 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play117032071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 117032071
		arg_287_1.duration_ = 4.833

		local var_287_0 = {
			zh = 4.233,
			ja = 4.833
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
				arg_287_0:Play117032072(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["1132"]
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 and arg_287_1.var_.actorSpriteComps1132 == nil then
				arg_287_1.var_.actorSpriteComps1132 = var_290_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_290_2 = 0.2

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_2 then
				local var_290_3 = (arg_287_1.time_ - var_290_1) / var_290_2

				if arg_287_1.var_.actorSpriteComps1132 then
					for iter_290_0, iter_290_1 in pairs(arg_287_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_290_1 then
							local var_290_4 = Mathf.Lerp(iter_290_1.color.r, 1, var_290_3)

							iter_290_1.color = Color.New(var_290_4, var_290_4, var_290_4)
						end
					end
				end
			end

			if arg_287_1.time_ >= var_290_1 + var_290_2 and arg_287_1.time_ < var_290_1 + var_290_2 + arg_290_0 and arg_287_1.var_.actorSpriteComps1132 then
				local var_290_5 = 1

				for iter_290_2, iter_290_3 in pairs(arg_287_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_290_3 then
						iter_290_3.color = Color.New(var_290_5, var_290_5, var_290_5)
					end
				end

				arg_287_1.var_.actorSpriteComps1132 = nil
			end

			local var_290_6 = 0
			local var_290_7 = 0.3

			if var_290_6 < arg_287_1.time_ and arg_287_1.time_ <= var_290_6 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_8 = arg_287_1:FormatText(StoryNameCfg[61].name)

				arg_287_1.leftNameTxt_.text = var_290_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_9 = arg_287_1:GetWordFromCfg(117032071)
				local var_290_10 = arg_287_1:FormatText(var_290_9.content)

				arg_287_1.text_.text = var_290_10

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_11 = 12
				local var_290_12 = utf8.len(var_290_10)
				local var_290_13 = var_290_11 <= 0 and var_290_7 or var_290_7 * (var_290_12 / var_290_11)

				if var_290_13 > 0 and var_290_7 < var_290_13 then
					arg_287_1.talkMaxDuration = var_290_13

					if var_290_13 + var_290_6 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_13 + var_290_6
					end
				end

				arg_287_1.text_.text = var_290_10
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032071", "story_v_out_117032.awb") ~= 0 then
					local var_290_14 = manager.audio:GetVoiceLength("story_v_out_117032", "117032071", "story_v_out_117032.awb") / 1000

					if var_290_14 + var_290_6 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_14 + var_290_6
					end

					if var_290_9.prefab_name ~= "" and arg_287_1.actors_[var_290_9.prefab_name] ~= nil then
						local var_290_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_9.prefab_name].transform, "story_v_out_117032", "117032071", "story_v_out_117032.awb")

						arg_287_1:RecordAudio("117032071", var_290_15)
						arg_287_1:RecordAudio("117032071", var_290_15)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_117032", "117032071", "story_v_out_117032.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_117032", "117032071", "story_v_out_117032.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_16 = math.max(var_290_7, arg_287_1.talkMaxDuration)

			if var_290_6 <= arg_287_1.time_ and arg_287_1.time_ < var_290_6 + var_290_16 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_6) / var_290_16

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_6 + var_290_16 and arg_287_1.time_ < var_290_6 + var_290_16 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play117032072 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 117032072
		arg_291_1.duration_ = 6.9

		local var_291_0 = {
			zh = 3.833,
			ja = 6.9
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
				arg_291_0:Play117032073(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["1132"]
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 and arg_291_1.var_.actorSpriteComps1132 == nil then
				arg_291_1.var_.actorSpriteComps1132 = var_294_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_294_2 = 0.2

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2

				if arg_291_1.var_.actorSpriteComps1132 then
					for iter_294_0, iter_294_1 in pairs(arg_291_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_294_1 then
							local var_294_4 = Mathf.Lerp(iter_294_1.color.r, 0.5, var_294_3)

							iter_294_1.color = Color.New(var_294_4, var_294_4, var_294_4)
						end
					end
				end
			end

			if arg_291_1.time_ >= var_294_1 + var_294_2 and arg_291_1.time_ < var_294_1 + var_294_2 + arg_294_0 and arg_291_1.var_.actorSpriteComps1132 then
				local var_294_5 = 0.5

				for iter_294_2, iter_294_3 in pairs(arg_291_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_294_3 then
						iter_294_3.color = Color.New(var_294_5, var_294_5, var_294_5)
					end
				end

				arg_291_1.var_.actorSpriteComps1132 = nil
			end

			local var_294_6 = arg_291_1.actors_["1033"]
			local var_294_7 = 0

			if var_294_7 < arg_291_1.time_ and arg_291_1.time_ <= var_294_7 + arg_294_0 and arg_291_1.var_.actorSpriteComps1033 == nil then
				arg_291_1.var_.actorSpriteComps1033 = var_294_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_294_8 = 0.2

			if var_294_7 <= arg_291_1.time_ and arg_291_1.time_ < var_294_7 + var_294_8 then
				local var_294_9 = (arg_291_1.time_ - var_294_7) / var_294_8

				if arg_291_1.var_.actorSpriteComps1033 then
					for iter_294_4, iter_294_5 in pairs(arg_291_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_294_5 then
							local var_294_10 = Mathf.Lerp(iter_294_5.color.r, 1, var_294_9)

							iter_294_5.color = Color.New(var_294_10, var_294_10, var_294_10)
						end
					end
				end
			end

			if arg_291_1.time_ >= var_294_7 + var_294_8 and arg_291_1.time_ < var_294_7 + var_294_8 + arg_294_0 and arg_291_1.var_.actorSpriteComps1033 then
				local var_294_11 = 1

				for iter_294_6, iter_294_7 in pairs(arg_291_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_294_7 then
						iter_294_7.color = Color.New(var_294_11, var_294_11, var_294_11)
					end
				end

				arg_291_1.var_.actorSpriteComps1033 = nil
			end

			local var_294_12 = 0
			local var_294_13 = 0.45

			if var_294_12 < arg_291_1.time_ and arg_291_1.time_ <= var_294_12 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_14 = arg_291_1:FormatText(StoryNameCfg[236].name)

				arg_291_1.leftNameTxt_.text = var_294_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_15 = arg_291_1:GetWordFromCfg(117032072)
				local var_294_16 = arg_291_1:FormatText(var_294_15.content)

				arg_291_1.text_.text = var_294_16

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_17 = 18
				local var_294_18 = utf8.len(var_294_16)
				local var_294_19 = var_294_17 <= 0 and var_294_13 or var_294_13 * (var_294_18 / var_294_17)

				if var_294_19 > 0 and var_294_13 < var_294_19 then
					arg_291_1.talkMaxDuration = var_294_19

					if var_294_19 + var_294_12 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_19 + var_294_12
					end
				end

				arg_291_1.text_.text = var_294_16
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032072", "story_v_out_117032.awb") ~= 0 then
					local var_294_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032072", "story_v_out_117032.awb") / 1000

					if var_294_20 + var_294_12 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_20 + var_294_12
					end

					if var_294_15.prefab_name ~= "" and arg_291_1.actors_[var_294_15.prefab_name] ~= nil then
						local var_294_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_15.prefab_name].transform, "story_v_out_117032", "117032072", "story_v_out_117032.awb")

						arg_291_1:RecordAudio("117032072", var_294_21)
						arg_291_1:RecordAudio("117032072", var_294_21)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_117032", "117032072", "story_v_out_117032.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_117032", "117032072", "story_v_out_117032.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_22 = math.max(var_294_13, arg_291_1.talkMaxDuration)

			if var_294_12 <= arg_291_1.time_ and arg_291_1.time_ < var_294_12 + var_294_22 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_12) / var_294_22

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_12 + var_294_22 and arg_291_1.time_ < var_294_12 + var_294_22 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play117032073 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 117032073
		arg_295_1.duration_ = 6.8

		local var_295_0 = {
			zh = 4.833,
			ja = 6.8
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
				arg_295_0:Play117032074(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["1132"]
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 and arg_295_1.var_.actorSpriteComps1132 == nil then
				arg_295_1.var_.actorSpriteComps1132 = var_298_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_298_2 = 0.2

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2

				if arg_295_1.var_.actorSpriteComps1132 then
					for iter_298_0, iter_298_1 in pairs(arg_295_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_298_1 then
							local var_298_4 = Mathf.Lerp(iter_298_1.color.r, 1, var_298_3)

							iter_298_1.color = Color.New(var_298_4, var_298_4, var_298_4)
						end
					end
				end
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 and arg_295_1.var_.actorSpriteComps1132 then
				local var_298_5 = 1

				for iter_298_2, iter_298_3 in pairs(arg_295_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_298_3 then
						iter_298_3.color = Color.New(var_298_5, var_298_5, var_298_5)
					end
				end

				arg_295_1.var_.actorSpriteComps1132 = nil
			end

			local var_298_6 = arg_295_1.actors_["1033"]
			local var_298_7 = 0

			if var_298_7 < arg_295_1.time_ and arg_295_1.time_ <= var_298_7 + arg_298_0 and arg_295_1.var_.actorSpriteComps1033 == nil then
				arg_295_1.var_.actorSpriteComps1033 = var_298_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_298_8 = 0.2

			if var_298_7 <= arg_295_1.time_ and arg_295_1.time_ < var_298_7 + var_298_8 then
				local var_298_9 = (arg_295_1.time_ - var_298_7) / var_298_8

				if arg_295_1.var_.actorSpriteComps1033 then
					for iter_298_4, iter_298_5 in pairs(arg_295_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_298_5 then
							local var_298_10 = Mathf.Lerp(iter_298_5.color.r, 0.5, var_298_9)

							iter_298_5.color = Color.New(var_298_10, var_298_10, var_298_10)
						end
					end
				end
			end

			if arg_295_1.time_ >= var_298_7 + var_298_8 and arg_295_1.time_ < var_298_7 + var_298_8 + arg_298_0 and arg_295_1.var_.actorSpriteComps1033 then
				local var_298_11 = 0.5

				for iter_298_6, iter_298_7 in pairs(arg_295_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_298_7 then
						iter_298_7.color = Color.New(var_298_11, var_298_11, var_298_11)
					end
				end

				arg_295_1.var_.actorSpriteComps1033 = nil
			end

			local var_298_12 = 0
			local var_298_13 = 0.6

			if var_298_12 < arg_295_1.time_ and arg_295_1.time_ <= var_298_12 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_14 = arg_295_1:FormatText(StoryNameCfg[61].name)

				arg_295_1.leftNameTxt_.text = var_298_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_15 = arg_295_1:GetWordFromCfg(117032073)
				local var_298_16 = arg_295_1:FormatText(var_298_15.content)

				arg_295_1.text_.text = var_298_16

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_17 = 24
				local var_298_18 = utf8.len(var_298_16)
				local var_298_19 = var_298_17 <= 0 and var_298_13 or var_298_13 * (var_298_18 / var_298_17)

				if var_298_19 > 0 and var_298_13 < var_298_19 then
					arg_295_1.talkMaxDuration = var_298_19

					if var_298_19 + var_298_12 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_19 + var_298_12
					end
				end

				arg_295_1.text_.text = var_298_16
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032073", "story_v_out_117032.awb") ~= 0 then
					local var_298_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032073", "story_v_out_117032.awb") / 1000

					if var_298_20 + var_298_12 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_20 + var_298_12
					end

					if var_298_15.prefab_name ~= "" and arg_295_1.actors_[var_298_15.prefab_name] ~= nil then
						local var_298_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_15.prefab_name].transform, "story_v_out_117032", "117032073", "story_v_out_117032.awb")

						arg_295_1:RecordAudio("117032073", var_298_21)
						arg_295_1:RecordAudio("117032073", var_298_21)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_117032", "117032073", "story_v_out_117032.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_117032", "117032073", "story_v_out_117032.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_22 = math.max(var_298_13, arg_295_1.talkMaxDuration)

			if var_298_12 <= arg_295_1.time_ and arg_295_1.time_ < var_298_12 + var_298_22 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_12) / var_298_22

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_12 + var_298_22 and arg_295_1.time_ < var_298_12 + var_298_22 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play117032074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 117032074
		arg_299_1.duration_ = 9.8

		local var_299_0 = {
			zh = 9.8,
			ja = 8.8
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
				arg_299_0:Play117032075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0
			local var_302_1 = 1.175

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_2 = arg_299_1:FormatText(StoryNameCfg[61].name)

				arg_299_1.leftNameTxt_.text = var_302_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_3 = arg_299_1:GetWordFromCfg(117032074)
				local var_302_4 = arg_299_1:FormatText(var_302_3.content)

				arg_299_1.text_.text = var_302_4

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_5 = 47
				local var_302_6 = utf8.len(var_302_4)
				local var_302_7 = var_302_5 <= 0 and var_302_1 or var_302_1 * (var_302_6 / var_302_5)

				if var_302_7 > 0 and var_302_1 < var_302_7 then
					arg_299_1.talkMaxDuration = var_302_7

					if var_302_7 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_7 + var_302_0
					end
				end

				arg_299_1.text_.text = var_302_4
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032074", "story_v_out_117032.awb") ~= 0 then
					local var_302_8 = manager.audio:GetVoiceLength("story_v_out_117032", "117032074", "story_v_out_117032.awb") / 1000

					if var_302_8 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_8 + var_302_0
					end

					if var_302_3.prefab_name ~= "" and arg_299_1.actors_[var_302_3.prefab_name] ~= nil then
						local var_302_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_3.prefab_name].transform, "story_v_out_117032", "117032074", "story_v_out_117032.awb")

						arg_299_1:RecordAudio("117032074", var_302_9)
						arg_299_1:RecordAudio("117032074", var_302_9)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_117032", "117032074", "story_v_out_117032.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_117032", "117032074", "story_v_out_117032.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_10 = math.max(var_302_1, arg_299_1.talkMaxDuration)

			if var_302_0 <= arg_299_1.time_ and arg_299_1.time_ < var_302_0 + var_302_10 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_0) / var_302_10

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_0 + var_302_10 and arg_299_1.time_ < var_302_0 + var_302_10 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play117032075 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 117032075
		arg_303_1.duration_ = 4.566

		local var_303_0 = {
			zh = 2.3,
			ja = 4.566
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
				arg_303_0:Play117032076(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["1132"]
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 and arg_303_1.var_.actorSpriteComps1132 == nil then
				arg_303_1.var_.actorSpriteComps1132 = var_306_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_306_2 = 0.2

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_2 then
				local var_306_3 = (arg_303_1.time_ - var_306_1) / var_306_2

				if arg_303_1.var_.actorSpriteComps1132 then
					for iter_306_0, iter_306_1 in pairs(arg_303_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_306_1 then
							local var_306_4 = Mathf.Lerp(iter_306_1.color.r, 0.5, var_306_3)

							iter_306_1.color = Color.New(var_306_4, var_306_4, var_306_4)
						end
					end
				end
			end

			if arg_303_1.time_ >= var_306_1 + var_306_2 and arg_303_1.time_ < var_306_1 + var_306_2 + arg_306_0 and arg_303_1.var_.actorSpriteComps1132 then
				local var_306_5 = 0.5

				for iter_306_2, iter_306_3 in pairs(arg_303_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_306_3 then
						iter_306_3.color = Color.New(var_306_5, var_306_5, var_306_5)
					end
				end

				arg_303_1.var_.actorSpriteComps1132 = nil
			end

			local var_306_6 = arg_303_1.actors_["1033"]
			local var_306_7 = 0

			if var_306_7 < arg_303_1.time_ and arg_303_1.time_ <= var_306_7 + arg_306_0 and arg_303_1.var_.actorSpriteComps1033 == nil then
				arg_303_1.var_.actorSpriteComps1033 = var_306_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_306_8 = 0.2

			if var_306_7 <= arg_303_1.time_ and arg_303_1.time_ < var_306_7 + var_306_8 then
				local var_306_9 = (arg_303_1.time_ - var_306_7) / var_306_8

				if arg_303_1.var_.actorSpriteComps1033 then
					for iter_306_4, iter_306_5 in pairs(arg_303_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_306_5 then
							local var_306_10 = Mathf.Lerp(iter_306_5.color.r, 1, var_306_9)

							iter_306_5.color = Color.New(var_306_10, var_306_10, var_306_10)
						end
					end
				end
			end

			if arg_303_1.time_ >= var_306_7 + var_306_8 and arg_303_1.time_ < var_306_7 + var_306_8 + arg_306_0 and arg_303_1.var_.actorSpriteComps1033 then
				local var_306_11 = 1

				for iter_306_6, iter_306_7 in pairs(arg_303_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_306_7 then
						iter_306_7.color = Color.New(var_306_11, var_306_11, var_306_11)
					end
				end

				arg_303_1.var_.actorSpriteComps1033 = nil
			end

			local var_306_12 = 0
			local var_306_13 = 0.2

			if var_306_12 < arg_303_1.time_ and arg_303_1.time_ <= var_306_12 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_14 = arg_303_1:FormatText(StoryNameCfg[236].name)

				arg_303_1.leftNameTxt_.text = var_306_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_15 = arg_303_1:GetWordFromCfg(117032075)
				local var_306_16 = arg_303_1:FormatText(var_306_15.content)

				arg_303_1.text_.text = var_306_16

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_17 = 8
				local var_306_18 = utf8.len(var_306_16)
				local var_306_19 = var_306_17 <= 0 and var_306_13 or var_306_13 * (var_306_18 / var_306_17)

				if var_306_19 > 0 and var_306_13 < var_306_19 then
					arg_303_1.talkMaxDuration = var_306_19

					if var_306_19 + var_306_12 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_19 + var_306_12
					end
				end

				arg_303_1.text_.text = var_306_16
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032075", "story_v_out_117032.awb") ~= 0 then
					local var_306_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032075", "story_v_out_117032.awb") / 1000

					if var_306_20 + var_306_12 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_20 + var_306_12
					end

					if var_306_15.prefab_name ~= "" and arg_303_1.actors_[var_306_15.prefab_name] ~= nil then
						local var_306_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_15.prefab_name].transform, "story_v_out_117032", "117032075", "story_v_out_117032.awb")

						arg_303_1:RecordAudio("117032075", var_306_21)
						arg_303_1:RecordAudio("117032075", var_306_21)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_117032", "117032075", "story_v_out_117032.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_117032", "117032075", "story_v_out_117032.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_22 = math.max(var_306_13, arg_303_1.talkMaxDuration)

			if var_306_12 <= arg_303_1.time_ and arg_303_1.time_ < var_306_12 + var_306_22 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_12) / var_306_22

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_12 + var_306_22 and arg_303_1.time_ < var_306_12 + var_306_22 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play117032076 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 117032076
		arg_307_1.duration_ = 5.3

		local var_307_0 = {
			zh = 3.2,
			ja = 5.3
		}
		local var_307_1 = manager.audio:GetLocalizationFlag()

		if var_307_0[var_307_1] ~= nil then
			arg_307_1.duration_ = var_307_0[var_307_1]
		end

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play117032077(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["1132"]
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 and arg_307_1.var_.actorSpriteComps1132 == nil then
				arg_307_1.var_.actorSpriteComps1132 = var_310_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_310_2 = 0.2

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2

				if arg_307_1.var_.actorSpriteComps1132 then
					for iter_310_0, iter_310_1 in pairs(arg_307_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_310_1 then
							local var_310_4 = Mathf.Lerp(iter_310_1.color.r, 1, var_310_3)

							iter_310_1.color = Color.New(var_310_4, var_310_4, var_310_4)
						end
					end
				end
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 and arg_307_1.var_.actorSpriteComps1132 then
				local var_310_5 = 1

				for iter_310_2, iter_310_3 in pairs(arg_307_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_310_3 then
						iter_310_3.color = Color.New(var_310_5, var_310_5, var_310_5)
					end
				end

				arg_307_1.var_.actorSpriteComps1132 = nil
			end

			local var_310_6 = arg_307_1.actors_["1033"]
			local var_310_7 = 0

			if var_310_7 < arg_307_1.time_ and arg_307_1.time_ <= var_310_7 + arg_310_0 and arg_307_1.var_.actorSpriteComps1033 == nil then
				arg_307_1.var_.actorSpriteComps1033 = var_310_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_310_8 = 0.2

			if var_310_7 <= arg_307_1.time_ and arg_307_1.time_ < var_310_7 + var_310_8 then
				local var_310_9 = (arg_307_1.time_ - var_310_7) / var_310_8

				if arg_307_1.var_.actorSpriteComps1033 then
					for iter_310_4, iter_310_5 in pairs(arg_307_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_310_5 then
							local var_310_10 = Mathf.Lerp(iter_310_5.color.r, 0.5, var_310_9)

							iter_310_5.color = Color.New(var_310_10, var_310_10, var_310_10)
						end
					end
				end
			end

			if arg_307_1.time_ >= var_310_7 + var_310_8 and arg_307_1.time_ < var_310_7 + var_310_8 + arg_310_0 and arg_307_1.var_.actorSpriteComps1033 then
				local var_310_11 = 0.5

				for iter_310_6, iter_310_7 in pairs(arg_307_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_310_7 then
						iter_310_7.color = Color.New(var_310_11, var_310_11, var_310_11)
					end
				end

				arg_307_1.var_.actorSpriteComps1033 = nil
			end

			local var_310_12 = 0
			local var_310_13 = 0.375

			if var_310_12 < arg_307_1.time_ and arg_307_1.time_ <= var_310_12 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_14 = arg_307_1:FormatText(StoryNameCfg[61].name)

				arg_307_1.leftNameTxt_.text = var_310_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_15 = arg_307_1:GetWordFromCfg(117032076)
				local var_310_16 = arg_307_1:FormatText(var_310_15.content)

				arg_307_1.text_.text = var_310_16

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_17 = 15
				local var_310_18 = utf8.len(var_310_16)
				local var_310_19 = var_310_17 <= 0 and var_310_13 or var_310_13 * (var_310_18 / var_310_17)

				if var_310_19 > 0 and var_310_13 < var_310_19 then
					arg_307_1.talkMaxDuration = var_310_19

					if var_310_19 + var_310_12 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_19 + var_310_12
					end
				end

				arg_307_1.text_.text = var_310_16
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117032", "117032076", "story_v_out_117032.awb") ~= 0 then
					local var_310_20 = manager.audio:GetVoiceLength("story_v_out_117032", "117032076", "story_v_out_117032.awb") / 1000

					if var_310_20 + var_310_12 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_20 + var_310_12
					end

					if var_310_15.prefab_name ~= "" and arg_307_1.actors_[var_310_15.prefab_name] ~= nil then
						local var_310_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_15.prefab_name].transform, "story_v_out_117032", "117032076", "story_v_out_117032.awb")

						arg_307_1:RecordAudio("117032076", var_310_21)
						arg_307_1:RecordAudio("117032076", var_310_21)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_117032", "117032076", "story_v_out_117032.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_117032", "117032076", "story_v_out_117032.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_22 = math.max(var_310_13, arg_307_1.talkMaxDuration)

			if var_310_12 <= arg_307_1.time_ and arg_307_1.time_ < var_310_12 + var_310_22 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_12) / var_310_22

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_12 + var_310_22 and arg_307_1.time_ < var_310_12 + var_310_22 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play117032077 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 117032077
		arg_311_1.duration_ = 5

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
			arg_311_1.auto_ = false
		end

		function arg_311_1.playNext_(arg_313_0)
			arg_311_1.onStoryFinished_()
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["1132"]
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 then
				local var_314_2 = var_314_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_314_2 then
					arg_311_1.var_.alphaOldValue1132 = var_314_2.alpha
					arg_311_1.var_.characterEffect1132 = var_314_2
				end

				arg_311_1.var_.alphaOldValue1132 = 1
			end

			local var_314_3 = 0.333333333333333

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_3 then
				local var_314_4 = (arg_311_1.time_ - var_314_1) / var_314_3
				local var_314_5 = Mathf.Lerp(arg_311_1.var_.alphaOldValue1132, 0, var_314_4)

				if arg_311_1.var_.characterEffect1132 then
					arg_311_1.var_.characterEffect1132.alpha = var_314_5
				end
			end

			if arg_311_1.time_ >= var_314_1 + var_314_3 and arg_311_1.time_ < var_314_1 + var_314_3 + arg_314_0 and arg_311_1.var_.characterEffect1132 then
				arg_311_1.var_.characterEffect1132.alpha = 0
			end

			local var_314_6 = arg_311_1.actors_["1033"]
			local var_314_7 = 0

			if var_314_7 < arg_311_1.time_ and arg_311_1.time_ <= var_314_7 + arg_314_0 then
				local var_314_8 = var_314_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_314_8 then
					arg_311_1.var_.alphaOldValue1033 = var_314_8.alpha
					arg_311_1.var_.characterEffect1033 = var_314_8
				end

				arg_311_1.var_.alphaOldValue1033 = 1
			end

			local var_314_9 = 0.333333333333333

			if var_314_7 <= arg_311_1.time_ and arg_311_1.time_ < var_314_7 + var_314_9 then
				local var_314_10 = (arg_311_1.time_ - var_314_7) / var_314_9
				local var_314_11 = Mathf.Lerp(arg_311_1.var_.alphaOldValue1033, 0, var_314_10)

				if arg_311_1.var_.characterEffect1033 then
					arg_311_1.var_.characterEffect1033.alpha = var_314_11
				end
			end

			if arg_311_1.time_ >= var_314_7 + var_314_9 and arg_311_1.time_ < var_314_7 + var_314_9 + arg_314_0 and arg_311_1.var_.characterEffect1033 then
				arg_311_1.var_.characterEffect1033.alpha = 0
			end

			local var_314_12 = 0
			local var_314_13 = 1.4

			if var_314_12 < arg_311_1.time_ and arg_311_1.time_ <= var_314_12 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, false)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_14 = arg_311_1:GetWordFromCfg(117032077)
				local var_314_15 = arg_311_1:FormatText(var_314_14.content)

				arg_311_1.text_.text = var_314_15

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_16 = 56
				local var_314_17 = utf8.len(var_314_15)
				local var_314_18 = var_314_16 <= 0 and var_314_13 or var_314_13 * (var_314_17 / var_314_16)

				if var_314_18 > 0 and var_314_13 < var_314_18 then
					arg_311_1.talkMaxDuration = var_314_18

					if var_314_18 + var_314_12 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_18 + var_314_12
					end
				end

				arg_311_1.text_.text = var_314_15
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)
				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_19 = math.max(var_314_13, arg_311_1.talkMaxDuration)

			if var_314_12 <= arg_311_1.time_ and arg_311_1.time_ < var_314_12 + var_314_19 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_12) / var_314_19

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_12 + var_314_19 and arg_311_1.time_ < var_314_12 + var_314_19 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I08a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST28"
	},
	voices = {
		"story_v_out_117032.awb"
	}
}
