return {
	Play114221001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 114221001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play114221002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "F03"

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
				local var_4_5 = arg_1_1.bgs_.F03

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
					if iter_4_0 ~= "F03" then
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

			local var_4_26 = 2
			local var_4_27 = 1.53333333333333

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_1_4_story_source", "bgm_activity_1_4_story_source", "bgm_activity_1_4_story_source.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 1.225

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

				local var_4_33 = arg_1_1:GetWordFromCfg(114221001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 49
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
	Play114221002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 114221002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play114221003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.4

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

				local var_10_2 = arg_7_1:GetWordFromCfg(114221002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 56
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
	Play114221003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 114221003
		arg_11_1.duration_ = 9.766

		local var_11_0 = {
			ja = 7.7,
			ko = 6.7,
			zh = 5.6,
			en = 9.766
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
				arg_11_0:Play114221004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "10015"

			if arg_11_1.actors_[var_14_0] == nil then
				local var_14_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_14_0), arg_11_1.canvasGo_.transform)

				var_14_1.transform:SetSiblingIndex(1)

				var_14_1.name = var_14_0
				var_14_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_11_1.actors_[var_14_0] = var_14_1
			end

			local var_14_2 = arg_11_1.actors_["10015"].transform
			local var_14_3 = 0

			if var_14_3 < arg_11_1.time_ and arg_11_1.time_ <= var_14_3 + arg_14_0 then
				arg_11_1.var_.moveOldPos10015 = var_14_2.localPosition
				var_14_2.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("10015", 3)

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
				local var_14_8 = Vector3.New(0, -350, -180)

				var_14_2.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos10015, var_14_8, var_14_7)
			end

			if arg_11_1.time_ >= var_14_3 + var_14_6 and arg_11_1.time_ < var_14_3 + var_14_6 + arg_14_0 then
				var_14_2.localPosition = Vector3.New(0, -350, -180)
			end

			local var_14_9 = arg_11_1.actors_["10015"]
			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 and arg_11_1.var_.actorSpriteComps10015 == nil then
				arg_11_1.var_.actorSpriteComps10015 = var_14_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_11 = 0.034

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_11 then
				local var_14_12 = (arg_11_1.time_ - var_14_10) / var_14_11

				if arg_11_1.var_.actorSpriteComps10015 then
					for iter_14_1, iter_14_2 in pairs(arg_11_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_14_2 then
							local var_14_13 = Mathf.Lerp(iter_14_2.color.r, 1, var_14_12)

							iter_14_2.color = Color.New(var_14_13, var_14_13, var_14_13)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_10 + var_14_11 and arg_11_1.time_ < var_14_10 + var_14_11 + arg_14_0 and arg_11_1.var_.actorSpriteComps10015 then
				local var_14_14 = 1

				for iter_14_3, iter_14_4 in pairs(arg_11_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_14_4 then
						iter_14_4.color = Color.New(var_14_14, var_14_14, var_14_14)
					end
				end

				arg_11_1.var_.actorSpriteComps10015 = nil
			end

			local var_14_15 = arg_11_1.actors_["10015"]
			local var_14_16 = 0

			if var_14_16 < arg_11_1.time_ and arg_11_1.time_ <= var_14_16 + arg_14_0 then
				local var_14_17 = var_14_15:GetComponentInChildren(typeof(CanvasGroup))

				if var_14_17 then
					arg_11_1.var_.alphaOldValue10015 = var_14_17.alpha
					arg_11_1.var_.characterEffect10015 = var_14_17
				end

				arg_11_1.var_.alphaOldValue10015 = 0
			end

			local var_14_18 = 0.5

			if var_14_16 <= arg_11_1.time_ and arg_11_1.time_ < var_14_16 + var_14_18 then
				local var_14_19 = (arg_11_1.time_ - var_14_16) / var_14_18
				local var_14_20 = Mathf.Lerp(arg_11_1.var_.alphaOldValue10015, 1, var_14_19)

				if arg_11_1.var_.characterEffect10015 then
					arg_11_1.var_.characterEffect10015.alpha = var_14_20
				end
			end

			if arg_11_1.time_ >= var_14_16 + var_14_18 and arg_11_1.time_ < var_14_16 + var_14_18 + arg_14_0 and arg_11_1.var_.characterEffect10015 then
				arg_11_1.var_.characterEffect10015.alpha = 1
			end

			local var_14_21 = 0
			local var_14_22 = 0.55

			if var_14_21 < arg_11_1.time_ and arg_11_1.time_ <= var_14_21 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_23 = arg_11_1:FormatText(StoryNameCfg[208].name)

				arg_11_1.leftNameTxt_.text = var_14_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_24 = arg_11_1:GetWordFromCfg(114221003)
				local var_14_25 = arg_11_1:FormatText(var_14_24.content)

				arg_11_1.text_.text = var_14_25

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_26 = 22
				local var_14_27 = utf8.len(var_14_25)
				local var_14_28 = var_14_26 <= 0 and var_14_22 or var_14_22 * (var_14_27 / var_14_26)

				if var_14_28 > 0 and var_14_22 < var_14_28 then
					arg_11_1.talkMaxDuration = var_14_28

					if var_14_28 + var_14_21 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_28 + var_14_21
					end
				end

				arg_11_1.text_.text = var_14_25
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114221", "114221003", "story_v_out_114221.awb") ~= 0 then
					local var_14_29 = manager.audio:GetVoiceLength("story_v_out_114221", "114221003", "story_v_out_114221.awb") / 1000

					if var_14_29 + var_14_21 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_29 + var_14_21
					end

					if var_14_24.prefab_name ~= "" and arg_11_1.actors_[var_14_24.prefab_name] ~= nil then
						local var_14_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_24.prefab_name].transform, "story_v_out_114221", "114221003", "story_v_out_114221.awb")

						arg_11_1:RecordAudio("114221003", var_14_30)
						arg_11_1:RecordAudio("114221003", var_14_30)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_114221", "114221003", "story_v_out_114221.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_114221", "114221003", "story_v_out_114221.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_31 = math.max(var_14_22, arg_11_1.talkMaxDuration)

			if var_14_21 <= arg_11_1.time_ and arg_11_1.time_ < var_14_21 + var_14_31 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_21) / var_14_31

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_21 + var_14_31 and arg_11_1.time_ < var_14_21 + var_14_31 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play114221004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 114221004
		arg_15_1.duration_ = 6.2

		local var_15_0 = {
			ja = 5.333,
			ko = 6.2,
			zh = 5.2,
			en = 6.033
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
				arg_15_0:Play114221005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.625

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[208].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(114221004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 25
				local var_18_6 = utf8.len(var_18_4)
				local var_18_7 = var_18_5 <= 0 and var_18_1 or var_18_1 * (var_18_6 / var_18_5)

				if var_18_7 > 0 and var_18_1 < var_18_7 then
					arg_15_1.talkMaxDuration = var_18_7

					if var_18_7 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_7 + var_18_0
					end
				end

				arg_15_1.text_.text = var_18_4
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114221", "114221004", "story_v_out_114221.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_114221", "114221004", "story_v_out_114221.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_114221", "114221004", "story_v_out_114221.awb")

						arg_15_1:RecordAudio("114221004", var_18_9)
						arg_15_1:RecordAudio("114221004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_114221", "114221004", "story_v_out_114221.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_114221", "114221004", "story_v_out_114221.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_10 = math.max(var_18_1, arg_15_1.talkMaxDuration)

			if var_18_0 <= arg_15_1.time_ and arg_15_1.time_ < var_18_0 + var_18_10 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_0) / var_18_10

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_0 + var_18_10 and arg_15_1.time_ < var_18_0 + var_18_10 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play114221005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 114221005
		arg_19_1.duration_ = 15.366

		local var_19_0 = {
			ja = 11.533,
			ko = 14.933,
			zh = 15.366,
			en = 14.9
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
				arg_19_0:Play114221006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "10016"

			if arg_19_1.actors_[var_22_0] == nil then
				local var_22_1 = Object.Instantiate(arg_19_1.imageGo_, arg_19_1.canvasGo_.transform)

				var_22_1.transform:SetSiblingIndex(1)

				var_22_1.name = var_22_0

				local var_22_2 = var_22_1:GetComponent(typeof(Image))

				var_22_2.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_22_0)

				var_22_2:SetNativeSize()

				var_22_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_19_1.actors_[var_22_0] = var_22_1
			end

			local var_22_3 = arg_19_1.actors_["10016"].transform
			local var_22_4 = 3.8

			if var_22_4 < arg_19_1.time_ and arg_19_1.time_ <= var_22_4 + arg_22_0 then
				arg_19_1.var_.moveOldPos10016 = var_22_3.localPosition
				var_22_3.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("10016", 2)
			end

			local var_22_5 = 0.001

			if var_22_4 <= arg_19_1.time_ and arg_19_1.time_ < var_22_4 + var_22_5 then
				local var_22_6 = (arg_19_1.time_ - var_22_4) / var_22_5
				local var_22_7 = Vector3.New(-390, -350, -180)

				var_22_3.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos10016, var_22_7, var_22_6)
			end

			if arg_19_1.time_ >= var_22_4 + var_22_5 and arg_19_1.time_ < var_22_4 + var_22_5 + arg_22_0 then
				var_22_3.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_22_8 = arg_19_1.actors_["10016"]
			local var_22_9 = 3.8

			if var_22_9 < arg_19_1.time_ and arg_19_1.time_ <= var_22_9 + arg_22_0 then
				local var_22_10 = var_22_8:GetComponent("Image")

				if var_22_10 then
					arg_19_1.var_.highlightMatValue10016 = var_22_10
				end
			end

			local var_22_11 = 0.034

			if var_22_9 <= arg_19_1.time_ and arg_19_1.time_ < var_22_9 + var_22_11 then
				local var_22_12 = (arg_19_1.time_ - var_22_9) / var_22_11

				if arg_19_1.var_.highlightMatValue10016 then
					local var_22_13 = Mathf.Lerp(0.5, 1, var_22_12)
					local var_22_14 = arg_19_1.var_.highlightMatValue10016
					local var_22_15 = var_22_14.color

					var_22_15.r = var_22_13
					var_22_15.g = var_22_13
					var_22_15.b = var_22_13
					var_22_14.color = var_22_15
				end
			end

			if arg_19_1.time_ >= var_22_9 + var_22_11 and arg_19_1.time_ < var_22_9 + var_22_11 + arg_22_0 and arg_19_1.var_.highlightMatValue10016 then
				local var_22_16 = 1

				var_22_8.transform:SetSiblingIndex(1)

				local var_22_17 = arg_19_1.var_.highlightMatValue10016
				local var_22_18 = var_22_17.color

				var_22_18.r = var_22_16
				var_22_18.g = var_22_16
				var_22_18.b = var_22_16
				var_22_17.color = var_22_18
			end

			local var_22_19 = arg_19_1.actors_["10016"]
			local var_22_20 = 3.8

			if var_22_20 < arg_19_1.time_ and arg_19_1.time_ <= var_22_20 + arg_22_0 then
				local var_22_21 = var_22_19:GetComponent("Image")

				if var_22_21 then
					arg_19_1.var_.alphaMatValue10016 = var_22_21
					arg_19_1.var_.alphaOldValue10016 = var_22_21.color.a
				end

				arg_19_1.var_.alphaOldValue10016 = 0
			end

			local var_22_22 = 0.5

			if var_22_20 <= arg_19_1.time_ and arg_19_1.time_ < var_22_20 + var_22_22 then
				local var_22_23 = (arg_19_1.time_ - var_22_20) / var_22_22
				local var_22_24 = Mathf.Lerp(arg_19_1.var_.alphaOldValue10016, 1, var_22_23)

				if arg_19_1.var_.alphaMatValue10016 then
					local var_22_25 = arg_19_1.var_.alphaMatValue10016.color

					var_22_25.a = var_22_24
					arg_19_1.var_.alphaMatValue10016.color = var_22_25
				end
			end

			if arg_19_1.time_ >= var_22_20 + var_22_22 and arg_19_1.time_ < var_22_20 + var_22_22 + arg_22_0 and arg_19_1.var_.alphaMatValue10016 then
				local var_22_26 = arg_19_1.var_.alphaMatValue10016
				local var_22_27 = var_22_26.color

				var_22_27.a = 1
				var_22_26.color = var_22_27
			end

			local var_22_28 = 0

			if var_22_28 < arg_19_1.time_ and arg_19_1.time_ <= var_22_28 + arg_22_0 then
				arg_19_1.mask_.enabled = true
				arg_19_1.mask_.raycastTarget = true

				arg_19_1:SetGaussion(false)
			end

			local var_22_29 = 2

			if var_22_28 <= arg_19_1.time_ and arg_19_1.time_ < var_22_28 + var_22_29 then
				local var_22_30 = (arg_19_1.time_ - var_22_28) / var_22_29
				local var_22_31 = Color.New(0, 0, 0)

				var_22_31.a = Mathf.Lerp(0, 1, var_22_30)
				arg_19_1.mask_.color = var_22_31
			end

			if arg_19_1.time_ >= var_22_28 + var_22_29 and arg_19_1.time_ < var_22_28 + var_22_29 + arg_22_0 then
				local var_22_32 = Color.New(0, 0, 0)

				var_22_32.a = 1
				arg_19_1.mask_.color = var_22_32
			end

			local var_22_33 = 2

			if var_22_33 < arg_19_1.time_ and arg_19_1.time_ <= var_22_33 + arg_22_0 then
				arg_19_1.mask_.enabled = true
				arg_19_1.mask_.raycastTarget = true

				arg_19_1:SetGaussion(false)
			end

			local var_22_34 = 2

			if var_22_33 <= arg_19_1.time_ and arg_19_1.time_ < var_22_33 + var_22_34 then
				local var_22_35 = (arg_19_1.time_ - var_22_33) / var_22_34
				local var_22_36 = Color.New(0, 0, 0)

				var_22_36.a = Mathf.Lerp(1, 0, var_22_35)
				arg_19_1.mask_.color = var_22_36
			end

			if arg_19_1.time_ >= var_22_33 + var_22_34 and arg_19_1.time_ < var_22_33 + var_22_34 + arg_22_0 then
				local var_22_37 = Color.New(0, 0, 0)
				local var_22_38 = 0

				arg_19_1.mask_.enabled = false
				var_22_37.a = var_22_38
				arg_19_1.mask_.color = var_22_37
			end

			local var_22_39 = arg_19_1.actors_["10015"].transform
			local var_22_40 = 1.966

			if var_22_40 < arg_19_1.time_ and arg_19_1.time_ <= var_22_40 + arg_22_0 then
				arg_19_1.var_.moveOldPos10015 = var_22_39.localPosition
				var_22_39.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("10015", 7)

				local var_22_41 = var_22_39.childCount

				for iter_22_0 = 0, var_22_41 - 1 do
					local var_22_42 = var_22_39:GetChild(iter_22_0)

					if var_22_42.name == "split_6" or not string.find(var_22_42.name, "split") then
						var_22_42.gameObject:SetActive(true)
					else
						var_22_42.gameObject:SetActive(false)
					end
				end
			end

			local var_22_43 = 0.001

			if var_22_40 <= arg_19_1.time_ and arg_19_1.time_ < var_22_40 + var_22_43 then
				local var_22_44 = (arg_19_1.time_ - var_22_40) / var_22_43
				local var_22_45 = Vector3.New(0, -2000, -180)

				var_22_39.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos10015, var_22_45, var_22_44)
			end

			if arg_19_1.time_ >= var_22_40 + var_22_43 and arg_19_1.time_ < var_22_40 + var_22_43 + arg_22_0 then
				var_22_39.localPosition = Vector3.New(0, -2000, -180)
			end

			if arg_19_1.frameCnt_ <= 1 then
				arg_19_1.dialog_:SetActive(false)
			end

			local var_22_46 = 4
			local var_22_47 = 1

			if var_22_46 < arg_19_1.time_ and arg_19_1.time_ <= var_22_46 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0

				arg_19_1.dialog_:SetActive(true)

				local var_22_48 = LeanTween.value(arg_19_1.dialog_, 0, 1, 0.3)

				var_22_48:setOnUpdate(LuaHelper.FloatAction(function(arg_23_0)
					arg_19_1.dialogCg_.alpha = arg_23_0
				end))
				var_22_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_19_1.dialog_)
					var_22_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_19_1.duration_ = arg_19_1.duration_ + 0.3

				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_49 = arg_19_1:FormatText(StoryNameCfg[226].name)

				arg_19_1.leftNameTxt_.text = var_22_49

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_50 = arg_19_1:GetWordFromCfg(114221005)
				local var_22_51 = arg_19_1:FormatText(var_22_50.content)

				arg_19_1.text_.text = var_22_51

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_52 = 40
				local var_22_53 = utf8.len(var_22_51)
				local var_22_54 = var_22_52 <= 0 and var_22_47 or var_22_47 * (var_22_53 / var_22_52)

				if var_22_54 > 0 and var_22_47 < var_22_54 then
					arg_19_1.talkMaxDuration = var_22_54
					var_22_46 = var_22_46 + 0.3

					if var_22_54 + var_22_46 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_54 + var_22_46
					end
				end

				arg_19_1.text_.text = var_22_51
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114221", "114221005", "story_v_out_114221.awb") ~= 0 then
					local var_22_55 = manager.audio:GetVoiceLength("story_v_out_114221", "114221005", "story_v_out_114221.awb") / 1000

					if var_22_55 + var_22_46 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_55 + var_22_46
					end

					if var_22_50.prefab_name ~= "" and arg_19_1.actors_[var_22_50.prefab_name] ~= nil then
						local var_22_56 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_50.prefab_name].transform, "story_v_out_114221", "114221005", "story_v_out_114221.awb")

						arg_19_1:RecordAudio("114221005", var_22_56)
						arg_19_1:RecordAudio("114221005", var_22_56)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_114221", "114221005", "story_v_out_114221.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_114221", "114221005", "story_v_out_114221.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_57 = var_22_46 + 0.3
			local var_22_58 = math.max(var_22_47, arg_19_1.talkMaxDuration)

			if var_22_57 <= arg_19_1.time_ and arg_19_1.time_ < var_22_57 + var_22_58 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_57) / var_22_58

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_57 + var_22_58 and arg_19_1.time_ < var_22_57 + var_22_58 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play114221006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 114221006
		arg_25_1.duration_ = 4.133

		local var_25_0 = {
			ja = 4.133,
			ko = 3.3,
			zh = 2.1,
			en = 2.2
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
				arg_25_0:Play114221007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["10015"].transform
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 then
				arg_25_1.var_.moveOldPos10015 = var_28_0.localPosition
				var_28_0.localScale = Vector3.New(1, 1, 1)

				arg_25_1:CheckSpriteTmpPos("10015", 4)

				local var_28_2 = var_28_0.childCount

				for iter_28_0 = 0, var_28_2 - 1 do
					local var_28_3 = var_28_0:GetChild(iter_28_0)

					if var_28_3.name == "split_5" or not string.find(var_28_3.name, "split") then
						var_28_3.gameObject:SetActive(true)
					else
						var_28_3.gameObject:SetActive(false)
					end
				end
			end

			local var_28_4 = 0.001

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_4 then
				local var_28_5 = (arg_25_1.time_ - var_28_1) / var_28_4
				local var_28_6 = Vector3.New(390, -350, -180)

				var_28_0.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos10015, var_28_6, var_28_5)
			end

			if arg_25_1.time_ >= var_28_1 + var_28_4 and arg_25_1.time_ < var_28_1 + var_28_4 + arg_28_0 then
				var_28_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_28_7 = arg_25_1.actors_["10016"]
			local var_28_8 = 0

			if var_28_8 < arg_25_1.time_ and arg_25_1.time_ <= var_28_8 + arg_28_0 then
				local var_28_9 = var_28_7:GetComponent("Image")

				if var_28_9 then
					arg_25_1.var_.highlightMatValue10016 = var_28_9
				end
			end

			local var_28_10 = 0.034

			if var_28_8 <= arg_25_1.time_ and arg_25_1.time_ < var_28_8 + var_28_10 then
				local var_28_11 = (arg_25_1.time_ - var_28_8) / var_28_10

				if arg_25_1.var_.highlightMatValue10016 then
					local var_28_12 = Mathf.Lerp(1, 0.5, var_28_11)
					local var_28_13 = arg_25_1.var_.highlightMatValue10016
					local var_28_14 = var_28_13.color

					var_28_14.r = var_28_12
					var_28_14.g = var_28_12
					var_28_14.b = var_28_12
					var_28_13.color = var_28_14
				end
			end

			if arg_25_1.time_ >= var_28_8 + var_28_10 and arg_25_1.time_ < var_28_8 + var_28_10 + arg_28_0 and arg_25_1.var_.highlightMatValue10016 then
				local var_28_15 = 0.5
				local var_28_16 = arg_25_1.var_.highlightMatValue10016
				local var_28_17 = var_28_16.color

				var_28_17.r = var_28_15
				var_28_17.g = var_28_15
				var_28_17.b = var_28_15
				var_28_16.color = var_28_17
			end

			local var_28_18 = arg_25_1.actors_["10015"]
			local var_28_19 = 0

			if var_28_19 < arg_25_1.time_ and arg_25_1.time_ <= var_28_19 + arg_28_0 and arg_25_1.var_.actorSpriteComps10015 == nil then
				arg_25_1.var_.actorSpriteComps10015 = var_28_18:GetComponentsInChildren(typeof(Image), true)
			end

			local var_28_20 = 0.034

			if var_28_19 <= arg_25_1.time_ and arg_25_1.time_ < var_28_19 + var_28_20 then
				local var_28_21 = (arg_25_1.time_ - var_28_19) / var_28_20

				if arg_25_1.var_.actorSpriteComps10015 then
					for iter_28_1, iter_28_2 in pairs(arg_25_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_28_2 then
							local var_28_22 = Mathf.Lerp(iter_28_2.color.r, 1, var_28_21)

							iter_28_2.color = Color.New(var_28_22, var_28_22, var_28_22)
						end
					end
				end
			end

			if arg_25_1.time_ >= var_28_19 + var_28_20 and arg_25_1.time_ < var_28_19 + var_28_20 + arg_28_0 and arg_25_1.var_.actorSpriteComps10015 then
				local var_28_23 = 1

				for iter_28_3, iter_28_4 in pairs(arg_25_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_28_4 then
						iter_28_4.color = Color.New(var_28_23, var_28_23, var_28_23)
					end
				end

				arg_25_1.var_.actorSpriteComps10015 = nil
			end

			local var_28_24 = arg_25_1.actors_["10015"]
			local var_28_25 = 0

			if var_28_25 < arg_25_1.time_ and arg_25_1.time_ <= var_28_25 + arg_28_0 then
				local var_28_26 = var_28_24:GetComponentInChildren(typeof(CanvasGroup))

				if var_28_26 then
					arg_25_1.var_.alphaOldValue10015 = var_28_26.alpha
					arg_25_1.var_.characterEffect10015 = var_28_26
				end

				arg_25_1.var_.alphaOldValue10015 = 0
			end

			local var_28_27 = 0.5

			if var_28_25 <= arg_25_1.time_ and arg_25_1.time_ < var_28_25 + var_28_27 then
				local var_28_28 = (arg_25_1.time_ - var_28_25) / var_28_27
				local var_28_29 = Mathf.Lerp(arg_25_1.var_.alphaOldValue10015, 1, var_28_28)

				if arg_25_1.var_.characterEffect10015 then
					arg_25_1.var_.characterEffect10015.alpha = var_28_29
				end
			end

			if arg_25_1.time_ >= var_28_25 + var_28_27 and arg_25_1.time_ < var_28_25 + var_28_27 + arg_28_0 and arg_25_1.var_.characterEffect10015 then
				arg_25_1.var_.characterEffect10015.alpha = 1
			end

			local var_28_30 = 0
			local var_28_31 = 0.25

			if var_28_30 < arg_25_1.time_ and arg_25_1.time_ <= var_28_30 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_32 = arg_25_1:FormatText(StoryNameCfg[208].name)

				arg_25_1.leftNameTxt_.text = var_28_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_33 = arg_25_1:GetWordFromCfg(114221006)
				local var_28_34 = arg_25_1:FormatText(var_28_33.content)

				arg_25_1.text_.text = var_28_34

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_35 = 10
				local var_28_36 = utf8.len(var_28_34)
				local var_28_37 = var_28_35 <= 0 and var_28_31 or var_28_31 * (var_28_36 / var_28_35)

				if var_28_37 > 0 and var_28_31 < var_28_37 then
					arg_25_1.talkMaxDuration = var_28_37

					if var_28_37 + var_28_30 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_37 + var_28_30
					end
				end

				arg_25_1.text_.text = var_28_34
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114221", "114221006", "story_v_out_114221.awb") ~= 0 then
					local var_28_38 = manager.audio:GetVoiceLength("story_v_out_114221", "114221006", "story_v_out_114221.awb") / 1000

					if var_28_38 + var_28_30 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_38 + var_28_30
					end

					if var_28_33.prefab_name ~= "" and arg_25_1.actors_[var_28_33.prefab_name] ~= nil then
						local var_28_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_33.prefab_name].transform, "story_v_out_114221", "114221006", "story_v_out_114221.awb")

						arg_25_1:RecordAudio("114221006", var_28_39)
						arg_25_1:RecordAudio("114221006", var_28_39)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_114221", "114221006", "story_v_out_114221.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_114221", "114221006", "story_v_out_114221.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_40 = math.max(var_28_31, arg_25_1.talkMaxDuration)

			if var_28_30 <= arg_25_1.time_ and arg_25_1.time_ < var_28_30 + var_28_40 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_30) / var_28_40

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_30 + var_28_40 and arg_25_1.time_ < var_28_30 + var_28_40 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play114221007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 114221007
		arg_29_1.duration_ = 7

		local var_29_0 = {
			ja = 3.133,
			ko = 5.2,
			zh = 7,
			en = 4.833
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
				arg_29_0:Play114221008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["10016"]
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 then
				local var_32_2 = var_32_0:GetComponent("Image")

				if var_32_2 then
					arg_29_1.var_.highlightMatValue10016 = var_32_2
				end
			end

			local var_32_3 = 0.034

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_3 then
				local var_32_4 = (arg_29_1.time_ - var_32_1) / var_32_3

				if arg_29_1.var_.highlightMatValue10016 then
					local var_32_5 = Mathf.Lerp(0.5, 1, var_32_4)
					local var_32_6 = arg_29_1.var_.highlightMatValue10016
					local var_32_7 = var_32_6.color

					var_32_7.r = var_32_5
					var_32_7.g = var_32_5
					var_32_7.b = var_32_5
					var_32_6.color = var_32_7
				end
			end

			if arg_29_1.time_ >= var_32_1 + var_32_3 and arg_29_1.time_ < var_32_1 + var_32_3 + arg_32_0 and arg_29_1.var_.highlightMatValue10016 then
				local var_32_8 = 1

				var_32_0.transform:SetSiblingIndex(1)

				local var_32_9 = arg_29_1.var_.highlightMatValue10016
				local var_32_10 = var_32_9.color

				var_32_10.r = var_32_8
				var_32_10.g = var_32_8
				var_32_10.b = var_32_8
				var_32_9.color = var_32_10
			end

			local var_32_11 = arg_29_1.actors_["10015"]
			local var_32_12 = 0

			if var_32_12 < arg_29_1.time_ and arg_29_1.time_ <= var_32_12 + arg_32_0 and arg_29_1.var_.actorSpriteComps10015 == nil then
				arg_29_1.var_.actorSpriteComps10015 = var_32_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_32_13 = 0.034

			if var_32_12 <= arg_29_1.time_ and arg_29_1.time_ < var_32_12 + var_32_13 then
				local var_32_14 = (arg_29_1.time_ - var_32_12) / var_32_13

				if arg_29_1.var_.actorSpriteComps10015 then
					for iter_32_0, iter_32_1 in pairs(arg_29_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_32_1 then
							local var_32_15 = Mathf.Lerp(iter_32_1.color.r, 0.5, var_32_14)

							iter_32_1.color = Color.New(var_32_15, var_32_15, var_32_15)
						end
					end
				end
			end

			if arg_29_1.time_ >= var_32_12 + var_32_13 and arg_29_1.time_ < var_32_12 + var_32_13 + arg_32_0 and arg_29_1.var_.actorSpriteComps10015 then
				local var_32_16 = 0.5

				for iter_32_2, iter_32_3 in pairs(arg_29_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_32_3 then
						iter_32_3.color = Color.New(var_32_16, var_32_16, var_32_16)
					end
				end

				arg_29_1.var_.actorSpriteComps10015 = nil
			end

			local var_32_17 = 0
			local var_32_18 = 0.425

			if var_32_17 < arg_29_1.time_ and arg_29_1.time_ <= var_32_17 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_19 = arg_29_1:FormatText(StoryNameCfg[226].name)

				arg_29_1.leftNameTxt_.text = var_32_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_20 = arg_29_1:GetWordFromCfg(114221007)
				local var_32_21 = arg_29_1:FormatText(var_32_20.content)

				arg_29_1.text_.text = var_32_21

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_22 = 17
				local var_32_23 = utf8.len(var_32_21)
				local var_32_24 = var_32_22 <= 0 and var_32_18 or var_32_18 * (var_32_23 / var_32_22)

				if var_32_24 > 0 and var_32_18 < var_32_24 then
					arg_29_1.talkMaxDuration = var_32_24

					if var_32_24 + var_32_17 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_24 + var_32_17
					end
				end

				arg_29_1.text_.text = var_32_21
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114221", "114221007", "story_v_out_114221.awb") ~= 0 then
					local var_32_25 = manager.audio:GetVoiceLength("story_v_out_114221", "114221007", "story_v_out_114221.awb") / 1000

					if var_32_25 + var_32_17 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_25 + var_32_17
					end

					if var_32_20.prefab_name ~= "" and arg_29_1.actors_[var_32_20.prefab_name] ~= nil then
						local var_32_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_20.prefab_name].transform, "story_v_out_114221", "114221007", "story_v_out_114221.awb")

						arg_29_1:RecordAudio("114221007", var_32_26)
						arg_29_1:RecordAudio("114221007", var_32_26)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_114221", "114221007", "story_v_out_114221.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_114221", "114221007", "story_v_out_114221.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_27 = math.max(var_32_18, arg_29_1.talkMaxDuration)

			if var_32_17 <= arg_29_1.time_ and arg_29_1.time_ < var_32_17 + var_32_27 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_17) / var_32_27

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_17 + var_32_27 and arg_29_1.time_ < var_32_17 + var_32_27 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play114221008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 114221008
		arg_33_1.duration_ = 9.866

		local var_33_0 = {
			ja = 9.5,
			ko = 9.866,
			zh = 9.333,
			en = 9.4
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
				arg_33_0:Play114221009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = 0
			local var_36_1 = 0.925

			if var_36_0 < arg_33_1.time_ and arg_33_1.time_ <= var_36_0 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_2 = arg_33_1:FormatText(StoryNameCfg[226].name)

				arg_33_1.leftNameTxt_.text = var_36_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_3 = arg_33_1:GetWordFromCfg(114221008)
				local var_36_4 = arg_33_1:FormatText(var_36_3.content)

				arg_33_1.text_.text = var_36_4

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_5 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_114221", "114221008", "story_v_out_114221.awb") ~= 0 then
					local var_36_8 = manager.audio:GetVoiceLength("story_v_out_114221", "114221008", "story_v_out_114221.awb") / 1000

					if var_36_8 + var_36_0 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_8 + var_36_0
					end

					if var_36_3.prefab_name ~= "" and arg_33_1.actors_[var_36_3.prefab_name] ~= nil then
						local var_36_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_3.prefab_name].transform, "story_v_out_114221", "114221008", "story_v_out_114221.awb")

						arg_33_1:RecordAudio("114221008", var_36_9)
						arg_33_1:RecordAudio("114221008", var_36_9)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_114221", "114221008", "story_v_out_114221.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_114221", "114221008", "story_v_out_114221.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_10 = math.max(var_36_1, arg_33_1.talkMaxDuration)

			if var_36_0 <= arg_33_1.time_ and arg_33_1.time_ < var_36_0 + var_36_10 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_0) / var_36_10

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_0 + var_36_10 and arg_33_1.time_ < var_36_0 + var_36_10 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play114221009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 114221009
		arg_37_1.duration_ = 5.466

		local var_37_0 = {
			ja = 4.966,
			ko = 5.466,
			zh = 3.933,
			en = 3.833
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
				arg_37_0:Play114221010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["10016"]
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 then
				local var_40_2 = var_40_0:GetComponent("Image")

				if var_40_2 then
					arg_37_1.var_.highlightMatValue10016 = var_40_2
				end
			end

			local var_40_3 = 0.034

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_3 then
				local var_40_4 = (arg_37_1.time_ - var_40_1) / var_40_3

				if arg_37_1.var_.highlightMatValue10016 then
					local var_40_5 = Mathf.Lerp(1, 0.5, var_40_4)
					local var_40_6 = arg_37_1.var_.highlightMatValue10016
					local var_40_7 = var_40_6.color

					var_40_7.r = var_40_5
					var_40_7.g = var_40_5
					var_40_7.b = var_40_5
					var_40_6.color = var_40_7
				end
			end

			if arg_37_1.time_ >= var_40_1 + var_40_3 and arg_37_1.time_ < var_40_1 + var_40_3 + arg_40_0 and arg_37_1.var_.highlightMatValue10016 then
				local var_40_8 = 0.5
				local var_40_9 = arg_37_1.var_.highlightMatValue10016
				local var_40_10 = var_40_9.color

				var_40_10.r = var_40_8
				var_40_10.g = var_40_8
				var_40_10.b = var_40_8
				var_40_9.color = var_40_10
			end

			local var_40_11 = arg_37_1.actors_["10015"]
			local var_40_12 = 0

			if var_40_12 < arg_37_1.time_ and arg_37_1.time_ <= var_40_12 + arg_40_0 and arg_37_1.var_.actorSpriteComps10015 == nil then
				arg_37_1.var_.actorSpriteComps10015 = var_40_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_40_13 = 0.034

			if var_40_12 <= arg_37_1.time_ and arg_37_1.time_ < var_40_12 + var_40_13 then
				local var_40_14 = (arg_37_1.time_ - var_40_12) / var_40_13

				if arg_37_1.var_.actorSpriteComps10015 then
					for iter_40_0, iter_40_1 in pairs(arg_37_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_40_1 then
							local var_40_15 = Mathf.Lerp(iter_40_1.color.r, 1, var_40_14)

							iter_40_1.color = Color.New(var_40_15, var_40_15, var_40_15)
						end
					end
				end
			end

			if arg_37_1.time_ >= var_40_12 + var_40_13 and arg_37_1.time_ < var_40_12 + var_40_13 + arg_40_0 and arg_37_1.var_.actorSpriteComps10015 then
				local var_40_16 = 1

				for iter_40_2, iter_40_3 in pairs(arg_37_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_40_3 then
						iter_40_3.color = Color.New(var_40_16, var_40_16, var_40_16)
					end
				end

				arg_37_1.var_.actorSpriteComps10015 = nil
			end

			local var_40_17 = arg_37_1.actors_["10015"].transform
			local var_40_18 = 0

			if var_40_18 < arg_37_1.time_ and arg_37_1.time_ <= var_40_18 + arg_40_0 then
				arg_37_1.var_.moveOldPos10015 = var_40_17.localPosition
				var_40_17.localScale = Vector3.New(1, 1, 1)

				arg_37_1:CheckSpriteTmpPos("10015", 4)

				local var_40_19 = var_40_17.childCount

				for iter_40_4 = 0, var_40_19 - 1 do
					local var_40_20 = var_40_17:GetChild(iter_40_4)

					if var_40_20.name == "split_6" or not string.find(var_40_20.name, "split") then
						var_40_20.gameObject:SetActive(true)
					else
						var_40_20.gameObject:SetActive(false)
					end
				end
			end

			local var_40_21 = 0.001

			if var_40_18 <= arg_37_1.time_ and arg_37_1.time_ < var_40_18 + var_40_21 then
				local var_40_22 = (arg_37_1.time_ - var_40_18) / var_40_21
				local var_40_23 = Vector3.New(390, -350, -180)

				var_40_17.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos10015, var_40_23, var_40_22)
			end

			if arg_37_1.time_ >= var_40_18 + var_40_21 and arg_37_1.time_ < var_40_18 + var_40_21 + arg_40_0 then
				var_40_17.localPosition = Vector3.New(390, -350, -180)
			end

			local var_40_24 = 0
			local var_40_25 = 0.55

			if var_40_24 < arg_37_1.time_ and arg_37_1.time_ <= var_40_24 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_26 = arg_37_1:FormatText(StoryNameCfg[208].name)

				arg_37_1.leftNameTxt_.text = var_40_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_27 = arg_37_1:GetWordFromCfg(114221009)
				local var_40_28 = arg_37_1:FormatText(var_40_27.content)

				arg_37_1.text_.text = var_40_28

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_29 = 22
				local var_40_30 = utf8.len(var_40_28)
				local var_40_31 = var_40_29 <= 0 and var_40_25 or var_40_25 * (var_40_30 / var_40_29)

				if var_40_31 > 0 and var_40_25 < var_40_31 then
					arg_37_1.talkMaxDuration = var_40_31

					if var_40_31 + var_40_24 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_31 + var_40_24
					end
				end

				arg_37_1.text_.text = var_40_28
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114221", "114221009", "story_v_out_114221.awb") ~= 0 then
					local var_40_32 = manager.audio:GetVoiceLength("story_v_out_114221", "114221009", "story_v_out_114221.awb") / 1000

					if var_40_32 + var_40_24 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_32 + var_40_24
					end

					if var_40_27.prefab_name ~= "" and arg_37_1.actors_[var_40_27.prefab_name] ~= nil then
						local var_40_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_27.prefab_name].transform, "story_v_out_114221", "114221009", "story_v_out_114221.awb")

						arg_37_1:RecordAudio("114221009", var_40_33)
						arg_37_1:RecordAudio("114221009", var_40_33)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_114221", "114221009", "story_v_out_114221.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_114221", "114221009", "story_v_out_114221.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_34 = math.max(var_40_25, arg_37_1.talkMaxDuration)

			if var_40_24 <= arg_37_1.time_ and arg_37_1.time_ < var_40_24 + var_40_34 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_24) / var_40_34

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_24 + var_40_34 and arg_37_1.time_ < var_40_24 + var_40_34 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play114221010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 114221010
		arg_41_1.duration_ = 11.2

		local var_41_0 = {
			ja = 10.133,
			ko = 11.2,
			zh = 9.533,
			en = 9.266
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
				arg_41_0:Play114221011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["10016"]
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 then
				local var_44_2 = var_44_0:GetComponent("Image")

				if var_44_2 then
					arg_41_1.var_.highlightMatValue10016 = var_44_2
				end
			end

			local var_44_3 = 0.034

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_3 then
				local var_44_4 = (arg_41_1.time_ - var_44_1) / var_44_3

				if arg_41_1.var_.highlightMatValue10016 then
					local var_44_5 = Mathf.Lerp(0.5, 1, var_44_4)
					local var_44_6 = arg_41_1.var_.highlightMatValue10016
					local var_44_7 = var_44_6.color

					var_44_7.r = var_44_5
					var_44_7.g = var_44_5
					var_44_7.b = var_44_5
					var_44_6.color = var_44_7
				end
			end

			if arg_41_1.time_ >= var_44_1 + var_44_3 and arg_41_1.time_ < var_44_1 + var_44_3 + arg_44_0 and arg_41_1.var_.highlightMatValue10016 then
				local var_44_8 = 1

				var_44_0.transform:SetSiblingIndex(1)

				local var_44_9 = arg_41_1.var_.highlightMatValue10016
				local var_44_10 = var_44_9.color

				var_44_10.r = var_44_8
				var_44_10.g = var_44_8
				var_44_10.b = var_44_8
				var_44_9.color = var_44_10
			end

			local var_44_11 = arg_41_1.actors_["10015"]
			local var_44_12 = 0

			if var_44_12 < arg_41_1.time_ and arg_41_1.time_ <= var_44_12 + arg_44_0 and arg_41_1.var_.actorSpriteComps10015 == nil then
				arg_41_1.var_.actorSpriteComps10015 = var_44_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_44_13 = 0.034

			if var_44_12 <= arg_41_1.time_ and arg_41_1.time_ < var_44_12 + var_44_13 then
				local var_44_14 = (arg_41_1.time_ - var_44_12) / var_44_13

				if arg_41_1.var_.actorSpriteComps10015 then
					for iter_44_0, iter_44_1 in pairs(arg_41_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_44_1 then
							local var_44_15 = Mathf.Lerp(iter_44_1.color.r, 0.5, var_44_14)

							iter_44_1.color = Color.New(var_44_15, var_44_15, var_44_15)
						end
					end
				end
			end

			if arg_41_1.time_ >= var_44_12 + var_44_13 and arg_41_1.time_ < var_44_12 + var_44_13 + arg_44_0 and arg_41_1.var_.actorSpriteComps10015 then
				local var_44_16 = 0.5

				for iter_44_2, iter_44_3 in pairs(arg_41_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_44_3 then
						iter_44_3.color = Color.New(var_44_16, var_44_16, var_44_16)
					end
				end

				arg_41_1.var_.actorSpriteComps10015 = nil
			end

			local var_44_17 = 0
			local var_44_18 = 0.7

			if var_44_17 < arg_41_1.time_ and arg_41_1.time_ <= var_44_17 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_19 = arg_41_1:FormatText(StoryNameCfg[226].name)

				arg_41_1.leftNameTxt_.text = var_44_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_20 = arg_41_1:GetWordFromCfg(114221010)
				local var_44_21 = arg_41_1:FormatText(var_44_20.content)

				arg_41_1.text_.text = var_44_21

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_22 = 28
				local var_44_23 = utf8.len(var_44_21)
				local var_44_24 = var_44_22 <= 0 and var_44_18 or var_44_18 * (var_44_23 / var_44_22)

				if var_44_24 > 0 and var_44_18 < var_44_24 then
					arg_41_1.talkMaxDuration = var_44_24

					if var_44_24 + var_44_17 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_24 + var_44_17
					end
				end

				arg_41_1.text_.text = var_44_21
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114221", "114221010", "story_v_out_114221.awb") ~= 0 then
					local var_44_25 = manager.audio:GetVoiceLength("story_v_out_114221", "114221010", "story_v_out_114221.awb") / 1000

					if var_44_25 + var_44_17 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_25 + var_44_17
					end

					if var_44_20.prefab_name ~= "" and arg_41_1.actors_[var_44_20.prefab_name] ~= nil then
						local var_44_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_20.prefab_name].transform, "story_v_out_114221", "114221010", "story_v_out_114221.awb")

						arg_41_1:RecordAudio("114221010", var_44_26)
						arg_41_1:RecordAudio("114221010", var_44_26)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_114221", "114221010", "story_v_out_114221.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_114221", "114221010", "story_v_out_114221.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_27 = math.max(var_44_18, arg_41_1.talkMaxDuration)

			if var_44_17 <= arg_41_1.time_ and arg_41_1.time_ < var_44_17 + var_44_27 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_17) / var_44_27

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_17 + var_44_27 and arg_41_1.time_ < var_44_17 + var_44_27 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play114221011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 114221011
		arg_45_1.duration_ = 9

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play114221012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = 0

			if var_48_0 < arg_45_1.time_ and arg_45_1.time_ <= var_48_0 + arg_48_0 then
				arg_45_1.mask_.enabled = true
				arg_45_1.mask_.raycastTarget = true

				arg_45_1:SetGaussion(false)
			end

			local var_48_1 = 2

			if var_48_0 <= arg_45_1.time_ and arg_45_1.time_ < var_48_0 + var_48_1 then
				local var_48_2 = (arg_45_1.time_ - var_48_0) / var_48_1
				local var_48_3 = Color.New(0, 0, 0)

				var_48_3.a = Mathf.Lerp(0, 1, var_48_2)
				arg_45_1.mask_.color = var_48_3
			end

			if arg_45_1.time_ >= var_48_0 + var_48_1 and arg_45_1.time_ < var_48_0 + var_48_1 + arg_48_0 then
				local var_48_4 = Color.New(0, 0, 0)

				var_48_4.a = 1
				arg_45_1.mask_.color = var_48_4
			end

			local var_48_5 = 2

			if var_48_5 < arg_45_1.time_ and arg_45_1.time_ <= var_48_5 + arg_48_0 then
				arg_45_1.mask_.enabled = true
				arg_45_1.mask_.raycastTarget = true

				arg_45_1:SetGaussion(false)
			end

			local var_48_6 = 2

			if var_48_5 <= arg_45_1.time_ and arg_45_1.time_ < var_48_5 + var_48_6 then
				local var_48_7 = (arg_45_1.time_ - var_48_5) / var_48_6
				local var_48_8 = Color.New(0, 0, 0)

				var_48_8.a = Mathf.Lerp(1, 0, var_48_7)
				arg_45_1.mask_.color = var_48_8
			end

			if arg_45_1.time_ >= var_48_5 + var_48_6 and arg_45_1.time_ < var_48_5 + var_48_6 + arg_48_0 then
				local var_48_9 = Color.New(0, 0, 0)
				local var_48_10 = 0

				arg_45_1.mask_.enabled = false
				var_48_9.a = var_48_10
				arg_45_1.mask_.color = var_48_9
			end

			local var_48_11 = arg_45_1.actors_["10016"].transform
			local var_48_12 = 1.966

			if var_48_12 < arg_45_1.time_ and arg_45_1.time_ <= var_48_12 + arg_48_0 then
				arg_45_1.var_.moveOldPos10016 = var_48_11.localPosition
				var_48_11.localScale = Vector3.New(1, 1, 1)

				arg_45_1:CheckSpriteTmpPos("10016", 7)
			end

			local var_48_13 = 0.001

			if var_48_12 <= arg_45_1.time_ and arg_45_1.time_ < var_48_12 + var_48_13 then
				local var_48_14 = (arg_45_1.time_ - var_48_12) / var_48_13
				local var_48_15 = Vector3.New(0, -2000, -180)

				var_48_11.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos10016, var_48_15, var_48_14)
			end

			if arg_45_1.time_ >= var_48_12 + var_48_13 and arg_45_1.time_ < var_48_12 + var_48_13 + arg_48_0 then
				var_48_11.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_48_16 = arg_45_1.actors_["10015"].transform
			local var_48_17 = 1.966

			if var_48_17 < arg_45_1.time_ and arg_45_1.time_ <= var_48_17 + arg_48_0 then
				arg_45_1.var_.moveOldPos10015 = var_48_16.localPosition
				var_48_16.localScale = Vector3.New(1, 1, 1)

				arg_45_1:CheckSpriteTmpPos("10015", 7)

				local var_48_18 = var_48_16.childCount

				for iter_48_0 = 0, var_48_18 - 1 do
					local var_48_19 = var_48_16:GetChild(iter_48_0)

					if var_48_19.name == "split_6" or not string.find(var_48_19.name, "split") then
						var_48_19.gameObject:SetActive(true)
					else
						var_48_19.gameObject:SetActive(false)
					end
				end
			end

			local var_48_20 = 0.001

			if var_48_17 <= arg_45_1.time_ and arg_45_1.time_ < var_48_17 + var_48_20 then
				local var_48_21 = (arg_45_1.time_ - var_48_17) / var_48_20
				local var_48_22 = Vector3.New(0, -2000, -180)

				var_48_16.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos10015, var_48_22, var_48_21)
			end

			if arg_45_1.time_ >= var_48_17 + var_48_20 and arg_45_1.time_ < var_48_17 + var_48_20 + arg_48_0 then
				var_48_16.localPosition = Vector3.New(0, -2000, -180)
			end

			if arg_45_1.frameCnt_ <= 1 then
				arg_45_1.dialog_:SetActive(false)
			end

			local var_48_23 = 4
			local var_48_24 = 0.05

			if var_48_23 < arg_45_1.time_ and arg_45_1.time_ <= var_48_23 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0

				arg_45_1.dialog_:SetActive(true)

				local var_48_25 = LeanTween.value(arg_45_1.dialog_, 0, 1, 0.3)

				var_48_25:setOnUpdate(LuaHelper.FloatAction(function(arg_49_0)
					arg_45_1.dialogCg_.alpha = arg_49_0
				end))
				var_48_25:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_45_1.dialog_)
					var_48_25:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_45_1.duration_ = arg_45_1.duration_ + 0.3

				SetActive(arg_45_1.leftNameGo_, false)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_26 = arg_45_1:GetWordFromCfg(114221011)
				local var_48_27 = arg_45_1:FormatText(var_48_26.content)

				arg_45_1.text_.text = var_48_27

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_28 = 2
				local var_48_29 = utf8.len(var_48_27)
				local var_48_30 = var_48_28 <= 0 and var_48_24 or var_48_24 * (var_48_29 / var_48_28)

				if var_48_30 > 0 and var_48_24 < var_48_30 then
					arg_45_1.talkMaxDuration = var_48_30
					var_48_23 = var_48_23 + 0.3

					if var_48_30 + var_48_23 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_30 + var_48_23
					end
				end

				arg_45_1.text_.text = var_48_27
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)
				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_31 = var_48_23 + 0.3
			local var_48_32 = math.max(var_48_24, arg_45_1.talkMaxDuration)

			if var_48_31 <= arg_45_1.time_ and arg_45_1.time_ < var_48_31 + var_48_32 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_31) / var_48_32

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_31 + var_48_32 and arg_45_1.time_ < var_48_31 + var_48_32 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play114221012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 114221012
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play114221013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 1.075

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

				local var_54_2 = arg_51_1:GetWordFromCfg(114221012)
				local var_54_3 = arg_51_1:FormatText(var_54_2.content)

				arg_51_1.text_.text = var_54_3

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_4 = 43
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
	Play114221013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 114221013
		arg_55_1.duration_ = 12.8

		local var_55_0 = {
			ja = 4.766,
			ko = 9.833,
			zh = 12.8,
			en = 11.233
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
				arg_55_0:Play114221014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["10015"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos10015 = var_58_0.localPosition
				var_58_0.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("10015", 3)

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
				local var_58_6 = Vector3.New(0, -350, -180)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos10015, var_58_6, var_58_5)
			end

			if arg_55_1.time_ >= var_58_1 + var_58_4 and arg_55_1.time_ < var_58_1 + var_58_4 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_58_7 = arg_55_1.actors_["10015"]
			local var_58_8 = 0

			if var_58_8 < arg_55_1.time_ and arg_55_1.time_ <= var_58_8 + arg_58_0 and arg_55_1.var_.actorSpriteComps10015 == nil then
				arg_55_1.var_.actorSpriteComps10015 = var_58_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_9 = 0.034

			if var_58_8 <= arg_55_1.time_ and arg_55_1.time_ < var_58_8 + var_58_9 then
				local var_58_10 = (arg_55_1.time_ - var_58_8) / var_58_9

				if arg_55_1.var_.actorSpriteComps10015 then
					for iter_58_1, iter_58_2 in pairs(arg_55_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_58_2 then
							local var_58_11 = Mathf.Lerp(iter_58_2.color.r, 1, var_58_10)

							iter_58_2.color = Color.New(var_58_11, var_58_11, var_58_11)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_8 + var_58_9 and arg_55_1.time_ < var_58_8 + var_58_9 + arg_58_0 and arg_55_1.var_.actorSpriteComps10015 then
				local var_58_12 = 1

				for iter_58_3, iter_58_4 in pairs(arg_55_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_58_4 then
						iter_58_4.color = Color.New(var_58_12, var_58_12, var_58_12)
					end
				end

				arg_55_1.var_.actorSpriteComps10015 = nil
			end

			local var_58_13 = arg_55_1.actors_["10015"]
			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				local var_58_15 = var_58_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_58_15 then
					arg_55_1.var_.alphaOldValue10015 = var_58_15.alpha
					arg_55_1.var_.characterEffect10015 = var_58_15
				end

				arg_55_1.var_.alphaOldValue10015 = 0
			end

			local var_58_16 = 0.5

			if var_58_14 <= arg_55_1.time_ and arg_55_1.time_ < var_58_14 + var_58_16 then
				local var_58_17 = (arg_55_1.time_ - var_58_14) / var_58_16
				local var_58_18 = Mathf.Lerp(arg_55_1.var_.alphaOldValue10015, 1, var_58_17)

				if arg_55_1.var_.characterEffect10015 then
					arg_55_1.var_.characterEffect10015.alpha = var_58_18
				end
			end

			if arg_55_1.time_ >= var_58_14 + var_58_16 and arg_55_1.time_ < var_58_14 + var_58_16 + arg_58_0 and arg_55_1.var_.characterEffect10015 then
				arg_55_1.var_.characterEffect10015.alpha = 1
			end

			local var_58_19 = 0
			local var_58_20 = 1.25

			if var_58_19 < arg_55_1.time_ and arg_55_1.time_ <= var_58_19 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_21 = arg_55_1:FormatText(StoryNameCfg[208].name)

				arg_55_1.leftNameTxt_.text = var_58_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_22 = arg_55_1:GetWordFromCfg(114221013)
				local var_58_23 = arg_55_1:FormatText(var_58_22.content)

				arg_55_1.text_.text = var_58_23

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_24 = 50
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

				if manager.audio:GetVoiceLength("story_v_out_114221", "114221013", "story_v_out_114221.awb") ~= 0 then
					local var_58_27 = manager.audio:GetVoiceLength("story_v_out_114221", "114221013", "story_v_out_114221.awb") / 1000

					if var_58_27 + var_58_19 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_27 + var_58_19
					end

					if var_58_22.prefab_name ~= "" and arg_55_1.actors_[var_58_22.prefab_name] ~= nil then
						local var_58_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_22.prefab_name].transform, "story_v_out_114221", "114221013", "story_v_out_114221.awb")

						arg_55_1:RecordAudio("114221013", var_58_28)
						arg_55_1:RecordAudio("114221013", var_58_28)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_114221", "114221013", "story_v_out_114221.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_114221", "114221013", "story_v_out_114221.awb")
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
	Play114221014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 114221014
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play114221015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["10015"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.actorSpriteComps10015 == nil then
				arg_59_1.var_.actorSpriteComps10015 = var_62_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_2 = 0.034

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.actorSpriteComps10015 then
					for iter_62_0, iter_62_1 in pairs(arg_59_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_62_1 then
							local var_62_4 = Mathf.Lerp(iter_62_1.color.r, 0.5, var_62_3)

							iter_62_1.color = Color.New(var_62_4, var_62_4, var_62_4)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.actorSpriteComps10015 then
				local var_62_5 = 0.5

				for iter_62_2, iter_62_3 in pairs(arg_59_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_62_3 then
						iter_62_3.color = Color.New(var_62_5, var_62_5, var_62_5)
					end
				end

				arg_59_1.var_.actorSpriteComps10015 = nil
			end

			local var_62_6 = 0
			local var_62_7 = 1.175

			if var_62_6 < arg_59_1.time_ and arg_59_1.time_ <= var_62_6 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_8 = arg_59_1:GetWordFromCfg(114221014)
				local var_62_9 = arg_59_1:FormatText(var_62_8.content)

				arg_59_1.text_.text = var_62_9

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_10 = 47
				local var_62_11 = utf8.len(var_62_9)
				local var_62_12 = var_62_10 <= 0 and var_62_7 or var_62_7 * (var_62_11 / var_62_10)

				if var_62_12 > 0 and var_62_7 < var_62_12 then
					arg_59_1.talkMaxDuration = var_62_12

					if var_62_12 + var_62_6 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_12 + var_62_6
					end
				end

				arg_59_1.text_.text = var_62_9
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_13 = math.max(var_62_7, arg_59_1.talkMaxDuration)

			if var_62_6 <= arg_59_1.time_ and arg_59_1.time_ < var_62_6 + var_62_13 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_6) / var_62_13

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_6 + var_62_13 and arg_59_1.time_ < var_62_6 + var_62_13 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play114221015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 114221015
		arg_63_1.duration_ = 4.4

		local var_63_0 = {
			ja = 4.4,
			ko = 2.7,
			zh = 4.133,
			en = 4.4
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
				arg_63_0:Play114221016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["10015"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.actorSpriteComps10015 == nil then
				arg_63_1.var_.actorSpriteComps10015 = var_66_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_2 = 0.034

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.actorSpriteComps10015 then
					for iter_66_0, iter_66_1 in pairs(arg_63_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_66_1 then
							local var_66_4 = Mathf.Lerp(iter_66_1.color.r, 1, var_66_3)

							iter_66_1.color = Color.New(var_66_4, var_66_4, var_66_4)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.actorSpriteComps10015 then
				local var_66_5 = 1

				for iter_66_2, iter_66_3 in pairs(arg_63_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_66_3 then
						iter_66_3.color = Color.New(var_66_5, var_66_5, var_66_5)
					end
				end

				arg_63_1.var_.actorSpriteComps10015 = nil
			end

			local var_66_6 = 0
			local var_66_7 = 0.225

			if var_66_6 < arg_63_1.time_ and arg_63_1.time_ <= var_66_6 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_8 = arg_63_1:FormatText(StoryNameCfg[208].name)

				arg_63_1.leftNameTxt_.text = var_66_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_9 = arg_63_1:GetWordFromCfg(114221015)
				local var_66_10 = arg_63_1:FormatText(var_66_9.content)

				arg_63_1.text_.text = var_66_10

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_11 = 9
				local var_66_12 = utf8.len(var_66_10)
				local var_66_13 = var_66_11 <= 0 and var_66_7 or var_66_7 * (var_66_12 / var_66_11)

				if var_66_13 > 0 and var_66_7 < var_66_13 then
					arg_63_1.talkMaxDuration = var_66_13

					if var_66_13 + var_66_6 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_13 + var_66_6
					end
				end

				arg_63_1.text_.text = var_66_10
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114221", "114221015", "story_v_out_114221.awb") ~= 0 then
					local var_66_14 = manager.audio:GetVoiceLength("story_v_out_114221", "114221015", "story_v_out_114221.awb") / 1000

					if var_66_14 + var_66_6 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_14 + var_66_6
					end

					if var_66_9.prefab_name ~= "" and arg_63_1.actors_[var_66_9.prefab_name] ~= nil then
						local var_66_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_9.prefab_name].transform, "story_v_out_114221", "114221015", "story_v_out_114221.awb")

						arg_63_1:RecordAudio("114221015", var_66_15)
						arg_63_1:RecordAudio("114221015", var_66_15)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_114221", "114221015", "story_v_out_114221.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_114221", "114221015", "story_v_out_114221.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_16 = math.max(var_66_7, arg_63_1.talkMaxDuration)

			if var_66_6 <= arg_63_1.time_ and arg_63_1.time_ < var_66_6 + var_66_16 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_6) / var_66_16

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_6 + var_66_16 and arg_63_1.time_ < var_66_6 + var_66_16 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play114221016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 114221016
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play114221017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["10015"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				local var_70_2 = var_70_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_70_2 then
					arg_67_1.var_.alphaOldValue10015 = var_70_2.alpha
					arg_67_1.var_.characterEffect10015 = var_70_2
				end

				arg_67_1.var_.alphaOldValue10015 = 1
			end

			local var_70_3 = 0.5

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_3 then
				local var_70_4 = (arg_67_1.time_ - var_70_1) / var_70_3
				local var_70_5 = Mathf.Lerp(arg_67_1.var_.alphaOldValue10015, 0, var_70_4)

				if arg_67_1.var_.characterEffect10015 then
					arg_67_1.var_.characterEffect10015.alpha = var_70_5
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_3 and arg_67_1.time_ < var_70_1 + var_70_3 + arg_70_0 and arg_67_1.var_.characterEffect10015 then
				arg_67_1.var_.characterEffect10015.alpha = 0
			end

			local var_70_6 = 0
			local var_70_7 = 0.5

			if var_70_6 < arg_67_1.time_ and arg_67_1.time_ <= var_70_6 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_8 = arg_67_1:GetWordFromCfg(114221016)
				local var_70_9 = arg_67_1:FormatText(var_70_8.content)

				arg_67_1.text_.text = var_70_9

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_10 = 20
				local var_70_11 = utf8.len(var_70_9)
				local var_70_12 = var_70_10 <= 0 and var_70_7 or var_70_7 * (var_70_11 / var_70_10)

				if var_70_12 > 0 and var_70_7 < var_70_12 then
					arg_67_1.talkMaxDuration = var_70_12

					if var_70_12 + var_70_6 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_12 + var_70_6
					end
				end

				arg_67_1.text_.text = var_70_9
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_13 = math.max(var_70_7, arg_67_1.talkMaxDuration)

			if var_70_6 <= arg_67_1.time_ and arg_67_1.time_ < var_70_6 + var_70_13 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_6) / var_70_13

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_6 + var_70_13 and arg_67_1.time_ < var_70_6 + var_70_13 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play114221017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 114221017
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play114221018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 1.95

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_2 = arg_71_1:GetWordFromCfg(114221017)
				local var_74_3 = arg_71_1:FormatText(var_74_2.content)

				arg_71_1.text_.text = var_74_3

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_4 = 77
				local var_74_5 = utf8.len(var_74_3)
				local var_74_6 = var_74_4 <= 0 and var_74_1 or var_74_1 * (var_74_5 / var_74_4)

				if var_74_6 > 0 and var_74_1 < var_74_6 then
					arg_71_1.talkMaxDuration = var_74_6

					if var_74_6 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_6 + var_74_0
					end
				end

				arg_71_1.text_.text = var_74_3
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_7 = math.max(var_74_1, arg_71_1.talkMaxDuration)

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_7 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_0) / var_74_7

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_0 + var_74_7 and arg_71_1.time_ < var_74_0 + var_74_7 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play114221018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 114221018
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play114221019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 1.15

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, false)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_2 = arg_75_1:GetWordFromCfg(114221018)
				local var_78_3 = arg_75_1:FormatText(var_78_2.content)

				arg_75_1.text_.text = var_78_3

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_4 = 46
				local var_78_5 = utf8.len(var_78_3)
				local var_78_6 = var_78_4 <= 0 and var_78_1 or var_78_1 * (var_78_5 / var_78_4)

				if var_78_6 > 0 and var_78_1 < var_78_6 then
					arg_75_1.talkMaxDuration = var_78_6

					if var_78_6 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_6 + var_78_0
					end
				end

				arg_75_1.text_.text = var_78_3
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_7 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_7 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_7

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_7 and arg_75_1.time_ < var_78_0 + var_78_7 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play114221019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 114221019
		arg_79_1.duration_ = 2.7

		local var_79_0 = {
			ja = 0.999999999999,
			ko = 2.7,
			zh = 0.999999999999,
			en = 1.5
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
				arg_79_0:Play114221020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 0.05

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_2 = arg_79_1:FormatText(StoryNameCfg[256].name)

				arg_79_1.leftNameTxt_.text = var_82_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, true)
				arg_79_1.iconController_:SetSelectedState("hero")

				arg_79_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3020")

				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_3 = arg_79_1:GetWordFromCfg(114221019)
				local var_82_4 = arg_79_1:FormatText(var_82_3.content)

				arg_79_1.text_.text = var_82_4

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_5 = 2
				local var_82_6 = utf8.len(var_82_4)
				local var_82_7 = var_82_5 <= 0 and var_82_1 or var_82_1 * (var_82_6 / var_82_5)

				if var_82_7 > 0 and var_82_1 < var_82_7 then
					arg_79_1.talkMaxDuration = var_82_7

					if var_82_7 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_7 + var_82_0
					end
				end

				arg_79_1.text_.text = var_82_4
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114221", "114221019", "story_v_out_114221.awb") ~= 0 then
					local var_82_8 = manager.audio:GetVoiceLength("story_v_out_114221", "114221019", "story_v_out_114221.awb") / 1000

					if var_82_8 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_8 + var_82_0
					end

					if var_82_3.prefab_name ~= "" and arg_79_1.actors_[var_82_3.prefab_name] ~= nil then
						local var_82_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_3.prefab_name].transform, "story_v_out_114221", "114221019", "story_v_out_114221.awb")

						arg_79_1:RecordAudio("114221019", var_82_9)
						arg_79_1:RecordAudio("114221019", var_82_9)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_114221", "114221019", "story_v_out_114221.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_114221", "114221019", "story_v_out_114221.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_10 = math.max(var_82_1, arg_79_1.talkMaxDuration)

			if var_82_0 <= arg_79_1.time_ and arg_79_1.time_ < var_82_0 + var_82_10 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_0) / var_82_10

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_0 + var_82_10 and arg_79_1.time_ < var_82_0 + var_82_10 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play114221020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 114221020
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play114221021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0.466666666666667
			local var_86_1 = 0.533333333333333

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				local var_86_2 = "play"
				local var_86_3 = "effect"

				arg_83_1:AudioAction(var_86_2, var_86_3, "se_story_activity_1_4_3", "se_story_activity_1_4_3_knight", "")
			end

			local var_86_4 = 0
			local var_86_5 = 0.65

			if var_86_4 < arg_83_1.time_ and arg_83_1.time_ <= var_86_4 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, false)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_6 = arg_83_1:GetWordFromCfg(114221020)
				local var_86_7 = arg_83_1:FormatText(var_86_6.content)

				arg_83_1.text_.text = var_86_7

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_8 = 26
				local var_86_9 = utf8.len(var_86_7)
				local var_86_10 = var_86_8 <= 0 and var_86_5 or var_86_5 * (var_86_9 / var_86_8)

				if var_86_10 > 0 and var_86_5 < var_86_10 then
					arg_83_1.talkMaxDuration = var_86_10

					if var_86_10 + var_86_4 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_10 + var_86_4
					end
				end

				arg_83_1.text_.text = var_86_7
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_11 = math.max(var_86_5, arg_83_1.talkMaxDuration)

			if var_86_4 <= arg_83_1.time_ and arg_83_1.time_ < var_86_4 + var_86_11 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_4) / var_86_11

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_4 + var_86_11 and arg_83_1.time_ < var_86_4 + var_86_11 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play114221021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 114221021
		arg_87_1.duration_ = 3.433

		local var_87_0 = {
			ja = 2.3,
			ko = 3.433,
			zh = 3.366,
			en = 3.4
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
				arg_87_0:Play114221022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 0.25

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[256].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, true)
				arg_87_1.iconController_:SetSelectedState("hero")

				arg_87_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3020")

				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(114221021)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_114221", "114221021", "story_v_out_114221.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_114221", "114221021", "story_v_out_114221.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_114221", "114221021", "story_v_out_114221.awb")

						arg_87_1:RecordAudio("114221021", var_90_9)
						arg_87_1:RecordAudio("114221021", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_114221", "114221021", "story_v_out_114221.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_114221", "114221021", "story_v_out_114221.awb")
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
	Play114221022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 114221022
		arg_91_1.duration_ = 1

		local var_91_0 = {
			ja = 0.999999999999,
			ko = 1,
			zh = 1,
			en = 0.999999999999
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
				arg_91_0:Play114221023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 1

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				local var_94_2 = "play"
				local var_94_3 = "effect"

				arg_91_1:AudioAction(var_94_2, var_94_3, "se_story_activity_1_4_3", "se_story_activity_1_4_3_jump", "")
			end

			local var_94_4 = manager.ui.mainCamera.transform
			local var_94_5 = 0

			if var_94_5 < arg_91_1.time_ and arg_91_1.time_ <= var_94_5 + arg_94_0 then
				arg_91_1.var_.shakeOldPos = var_94_4.localPosition
			end

			local var_94_6 = 0.5

			if var_94_5 <= arg_91_1.time_ and arg_91_1.time_ < var_94_5 + var_94_6 then
				local var_94_7 = (arg_91_1.time_ - var_94_5) / 0.066
				local var_94_8, var_94_9 = math.modf(var_94_7)

				var_94_4.localPosition = Vector3.New(var_94_9 * 0.13, var_94_9 * 0.13, var_94_9 * 0.13) + arg_91_1.var_.shakeOldPos
			end

			if arg_91_1.time_ >= var_94_5 + var_94_6 and arg_91_1.time_ < var_94_5 + var_94_6 + arg_94_0 then
				var_94_4.localPosition = arg_91_1.var_.shakeOldPos
			end

			local var_94_10 = 0

			if var_94_10 < arg_91_1.time_ and arg_91_1.time_ <= var_94_10 + arg_94_0 then
				arg_91_1.allBtn_.enabled = false
			end

			local var_94_11 = 0.5

			if arg_91_1.time_ >= var_94_10 + var_94_11 and arg_91_1.time_ < var_94_10 + var_94_11 + arg_94_0 then
				arg_91_1.allBtn_.enabled = true
			end

			local var_94_12 = 0
			local var_94_13 = 0.075

			if var_94_12 < arg_91_1.time_ and arg_91_1.time_ <= var_94_12 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_14 = arg_91_1:FormatText(StoryNameCfg[208].name)

				arg_91_1.leftNameTxt_.text = var_94_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, true)
				arg_91_1.iconController_:SetSelectedState("hero")

				arg_91_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10015_split4")

				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_15 = arg_91_1:GetWordFromCfg(114221022)
				local var_94_16 = arg_91_1:FormatText(var_94_15.content)

				arg_91_1.text_.text = var_94_16

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_17 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_114221", "114221022", "story_v_out_114221.awb") ~= 0 then
					local var_94_20 = manager.audio:GetVoiceLength("story_v_out_114221", "114221022", "story_v_out_114221.awb") / 1000

					if var_94_20 + var_94_12 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_20 + var_94_12
					end

					if var_94_15.prefab_name ~= "" and arg_91_1.actors_[var_94_15.prefab_name] ~= nil then
						local var_94_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_15.prefab_name].transform, "story_v_out_114221", "114221022", "story_v_out_114221.awb")

						arg_91_1:RecordAudio("114221022", var_94_21)
						arg_91_1:RecordAudio("114221022", var_94_21)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_114221", "114221022", "story_v_out_114221.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_114221", "114221022", "story_v_out_114221.awb")
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
	Play114221023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 114221023
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play114221024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["10015"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				local var_98_2 = var_98_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_98_2 then
					arg_95_1.var_.alphaOldValue10015 = var_98_2.alpha
					arg_95_1.var_.characterEffect10015 = var_98_2
				end

				arg_95_1.var_.alphaOldValue10015 = 1
			end

			local var_98_3 = 0.5

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_3 then
				local var_98_4 = (arg_95_1.time_ - var_98_1) / var_98_3
				local var_98_5 = Mathf.Lerp(arg_95_1.var_.alphaOldValue10015, 0, var_98_4)

				if arg_95_1.var_.characterEffect10015 then
					arg_95_1.var_.characterEffect10015.alpha = var_98_5
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_3 and arg_95_1.time_ < var_98_1 + var_98_3 + arg_98_0 and arg_95_1.var_.characterEffect10015 then
				arg_95_1.var_.characterEffect10015.alpha = 0
			end

			local var_98_6 = 0
			local var_98_7 = 1.55

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

				local var_98_8 = arg_95_1:GetWordFromCfg(114221023)
				local var_98_9 = arg_95_1:FormatText(var_98_8.content)

				arg_95_1.text_.text = var_98_9

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_10 = 62
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
	Play114221024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 114221024
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play114221025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 1.525

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, false)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_2 = arg_99_1:GetWordFromCfg(114221024)
				local var_102_3 = arg_99_1:FormatText(var_102_2.content)

				arg_99_1.text_.text = var_102_3

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_4 = 61
				local var_102_5 = utf8.len(var_102_3)
				local var_102_6 = var_102_4 <= 0 and var_102_1 or var_102_1 * (var_102_5 / var_102_4)

				if var_102_6 > 0 and var_102_1 < var_102_6 then
					arg_99_1.talkMaxDuration = var_102_6

					if var_102_6 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_6 + var_102_0
					end
				end

				arg_99_1.text_.text = var_102_3
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_7 = math.max(var_102_1, arg_99_1.talkMaxDuration)

			if var_102_0 <= arg_99_1.time_ and arg_99_1.time_ < var_102_0 + var_102_7 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_0) / var_102_7

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_0 + var_102_7 and arg_99_1.time_ < var_102_0 + var_102_7 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play114221025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 114221025
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play114221026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 0.925

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

				local var_106_2 = arg_103_1:GetWordFromCfg(114221025)
				local var_106_3 = arg_103_1:FormatText(var_106_2.content)

				arg_103_1.text_.text = var_106_3

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_4 = 37
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
	Play114221026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 114221026
		arg_107_1.duration_ = 6.533

		local var_107_0 = {
			ja = 6.533,
			ko = 4,
			zh = 4.066,
			en = 5
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
				arg_107_0:Play114221027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["10015"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos10015 = var_110_0.localPosition
				var_110_0.localScale = Vector3.New(1, 1, 1)

				arg_107_1:CheckSpriteTmpPos("10015", 3)

				local var_110_2 = var_110_0.childCount

				for iter_110_0 = 0, var_110_2 - 1 do
					local var_110_3 = var_110_0:GetChild(iter_110_0)

					if var_110_3.name == "split_1" or not string.find(var_110_3.name, "split") then
						var_110_3.gameObject:SetActive(true)
					else
						var_110_3.gameObject:SetActive(false)
					end
				end
			end

			local var_110_4 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_4 then
				local var_110_5 = (arg_107_1.time_ - var_110_1) / var_110_4
				local var_110_6 = Vector3.New(0, -350, -180)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos10015, var_110_6, var_110_5)
			end

			if arg_107_1.time_ >= var_110_1 + var_110_4 and arg_107_1.time_ < var_110_1 + var_110_4 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_110_7 = arg_107_1.actors_["10015"]
			local var_110_8 = 0

			if var_110_8 < arg_107_1.time_ and arg_107_1.time_ <= var_110_8 + arg_110_0 and arg_107_1.var_.actorSpriteComps10015 == nil then
				arg_107_1.var_.actorSpriteComps10015 = var_110_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_9 = 0.034

			if var_110_8 <= arg_107_1.time_ and arg_107_1.time_ < var_110_8 + var_110_9 then
				local var_110_10 = (arg_107_1.time_ - var_110_8) / var_110_9

				if arg_107_1.var_.actorSpriteComps10015 then
					for iter_110_1, iter_110_2 in pairs(arg_107_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_110_2 then
							local var_110_11 = Mathf.Lerp(iter_110_2.color.r, 1, var_110_10)

							iter_110_2.color = Color.New(var_110_11, var_110_11, var_110_11)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_8 + var_110_9 and arg_107_1.time_ < var_110_8 + var_110_9 + arg_110_0 and arg_107_1.var_.actorSpriteComps10015 then
				local var_110_12 = 1

				for iter_110_3, iter_110_4 in pairs(arg_107_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_110_4 then
						iter_110_4.color = Color.New(var_110_12, var_110_12, var_110_12)
					end
				end

				arg_107_1.var_.actorSpriteComps10015 = nil
			end

			local var_110_13 = arg_107_1.actors_["10015"]
			local var_110_14 = 0

			if var_110_14 < arg_107_1.time_ and arg_107_1.time_ <= var_110_14 + arg_110_0 then
				local var_110_15 = var_110_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_110_15 then
					arg_107_1.var_.alphaOldValue10015 = var_110_15.alpha
					arg_107_1.var_.characterEffect10015 = var_110_15
				end

				arg_107_1.var_.alphaOldValue10015 = 0
			end

			local var_110_16 = 0.5

			if var_110_14 <= arg_107_1.time_ and arg_107_1.time_ < var_110_14 + var_110_16 then
				local var_110_17 = (arg_107_1.time_ - var_110_14) / var_110_16
				local var_110_18 = Mathf.Lerp(arg_107_1.var_.alphaOldValue10015, 1, var_110_17)

				if arg_107_1.var_.characterEffect10015 then
					arg_107_1.var_.characterEffect10015.alpha = var_110_18
				end
			end

			if arg_107_1.time_ >= var_110_14 + var_110_16 and arg_107_1.time_ < var_110_14 + var_110_16 + arg_110_0 and arg_107_1.var_.characterEffect10015 then
				arg_107_1.var_.characterEffect10015.alpha = 1
			end

			local var_110_19 = 0
			local var_110_20 = 0.5

			if var_110_19 < arg_107_1.time_ and arg_107_1.time_ <= var_110_19 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_21 = arg_107_1:FormatText(StoryNameCfg[208].name)

				arg_107_1.leftNameTxt_.text = var_110_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_22 = arg_107_1:GetWordFromCfg(114221026)
				local var_110_23 = arg_107_1:FormatText(var_110_22.content)

				arg_107_1.text_.text = var_110_23

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_24 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_114221", "114221026", "story_v_out_114221.awb") ~= 0 then
					local var_110_27 = manager.audio:GetVoiceLength("story_v_out_114221", "114221026", "story_v_out_114221.awb") / 1000

					if var_110_27 + var_110_19 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_27 + var_110_19
					end

					if var_110_22.prefab_name ~= "" and arg_107_1.actors_[var_110_22.prefab_name] ~= nil then
						local var_110_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_22.prefab_name].transform, "story_v_out_114221", "114221026", "story_v_out_114221.awb")

						arg_107_1:RecordAudio("114221026", var_110_28)
						arg_107_1:RecordAudio("114221026", var_110_28)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_114221", "114221026", "story_v_out_114221.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_114221", "114221026", "story_v_out_114221.awb")
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
	Play114221027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 114221027
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play114221028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["10015"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.actorSpriteComps10015 == nil then
				arg_111_1.var_.actorSpriteComps10015 = var_114_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_2 = 0.034

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.actorSpriteComps10015 then
					for iter_114_0, iter_114_1 in pairs(arg_111_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_114_1 then
							local var_114_4 = Mathf.Lerp(iter_114_1.color.r, 0.5, var_114_3)

							iter_114_1.color = Color.New(var_114_4, var_114_4, var_114_4)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.actorSpriteComps10015 then
				local var_114_5 = 0.5

				for iter_114_2, iter_114_3 in pairs(arg_111_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_114_3 then
						iter_114_3.color = Color.New(var_114_5, var_114_5, var_114_5)
					end
				end

				arg_111_1.var_.actorSpriteComps10015 = nil
			end

			local var_114_6 = 0
			local var_114_7 = 1.2

			if var_114_6 < arg_111_1.time_ and arg_111_1.time_ <= var_114_6 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, false)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_8 = arg_111_1:GetWordFromCfg(114221027)
				local var_114_9 = arg_111_1:FormatText(var_114_8.content)

				arg_111_1.text_.text = var_114_9

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_10 = 48
				local var_114_11 = utf8.len(var_114_9)
				local var_114_12 = var_114_10 <= 0 and var_114_7 or var_114_7 * (var_114_11 / var_114_10)

				if var_114_12 > 0 and var_114_7 < var_114_12 then
					arg_111_1.talkMaxDuration = var_114_12

					if var_114_12 + var_114_6 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_12 + var_114_6
					end
				end

				arg_111_1.text_.text = var_114_9
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_13 = math.max(var_114_7, arg_111_1.talkMaxDuration)

			if var_114_6 <= arg_111_1.time_ and arg_111_1.time_ < var_114_6 + var_114_13 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_6) / var_114_13

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_6 + var_114_13 and arg_111_1.time_ < var_114_6 + var_114_13 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play114221028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 114221028
		arg_115_1.duration_ = 11.433

		local var_115_0 = {
			ja = 5.433,
			ko = 9.5,
			zh = 11.433,
			en = 8.833
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
				arg_115_0:Play114221029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.8

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_2 = arg_115_1:FormatText(StoryNameCfg[256].name)

				arg_115_1.leftNameTxt_.text = var_118_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, true)
				arg_115_1.iconController_:SetSelectedState("hero")

				arg_115_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3020")

				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_3 = arg_115_1:GetWordFromCfg(114221028)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 31
				local var_118_6 = utf8.len(var_118_4)
				local var_118_7 = var_118_5 <= 0 and var_118_1 or var_118_1 * (var_118_6 / var_118_5)

				if var_118_7 > 0 and var_118_1 < var_118_7 then
					arg_115_1.talkMaxDuration = var_118_7

					if var_118_7 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_7 + var_118_0
					end
				end

				arg_115_1.text_.text = var_118_4
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114221", "114221028", "story_v_out_114221.awb") ~= 0 then
					local var_118_8 = manager.audio:GetVoiceLength("story_v_out_114221", "114221028", "story_v_out_114221.awb") / 1000

					if var_118_8 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_8 + var_118_0
					end

					if var_118_3.prefab_name ~= "" and arg_115_1.actors_[var_118_3.prefab_name] ~= nil then
						local var_118_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_3.prefab_name].transform, "story_v_out_114221", "114221028", "story_v_out_114221.awb")

						arg_115_1:RecordAudio("114221028", var_118_9)
						arg_115_1:RecordAudio("114221028", var_118_9)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_114221", "114221028", "story_v_out_114221.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_114221", "114221028", "story_v_out_114221.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_10 = math.max(var_118_1, arg_115_1.talkMaxDuration)

			if var_118_0 <= arg_115_1.time_ and arg_115_1.time_ < var_118_0 + var_118_10 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_0) / var_118_10

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_0 + var_118_10 and arg_115_1.time_ < var_118_0 + var_118_10 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play114221029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 114221029
		arg_119_1.duration_ = 5.233

		local var_119_0 = {
			ja = 5.1,
			ko = 5.233,
			zh = 4.7,
			en = 5.1
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
				arg_119_0:Play114221030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["10015"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos10015 = var_122_0.localPosition
				var_122_0.localScale = Vector3.New(1, 1, 1)

				arg_119_1:CheckSpriteTmpPos("10015", 3)

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
				local var_122_6 = Vector3.New(0, -350, -180)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos10015, var_122_6, var_122_5)
			end

			if arg_119_1.time_ >= var_122_1 + var_122_4 and arg_119_1.time_ < var_122_1 + var_122_4 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_122_7 = arg_119_1.actors_["10015"]
			local var_122_8 = 0

			if var_122_8 < arg_119_1.time_ and arg_119_1.time_ <= var_122_8 + arg_122_0 and arg_119_1.var_.actorSpriteComps10015 == nil then
				arg_119_1.var_.actorSpriteComps10015 = var_122_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_9 = 0.034

			if var_122_8 <= arg_119_1.time_ and arg_119_1.time_ < var_122_8 + var_122_9 then
				local var_122_10 = (arg_119_1.time_ - var_122_8) / var_122_9

				if arg_119_1.var_.actorSpriteComps10015 then
					for iter_122_1, iter_122_2 in pairs(arg_119_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_122_2 then
							local var_122_11 = Mathf.Lerp(iter_122_2.color.r, 1, var_122_10)

							iter_122_2.color = Color.New(var_122_11, var_122_11, var_122_11)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_8 + var_122_9 and arg_119_1.time_ < var_122_8 + var_122_9 + arg_122_0 and arg_119_1.var_.actorSpriteComps10015 then
				local var_122_12 = 1

				for iter_122_3, iter_122_4 in pairs(arg_119_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_122_4 then
						iter_122_4.color = Color.New(var_122_12, var_122_12, var_122_12)
					end
				end

				arg_119_1.var_.actorSpriteComps10015 = nil
			end

			local var_122_13 = arg_119_1.actors_["10015"]
			local var_122_14 = 0

			if var_122_14 < arg_119_1.time_ and arg_119_1.time_ <= var_122_14 + arg_122_0 then
				local var_122_15 = var_122_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_122_15 then
					arg_119_1.var_.alphaOldValue10015 = var_122_15.alpha
					arg_119_1.var_.characterEffect10015 = var_122_15
				end

				arg_119_1.var_.alphaOldValue10015 = 0
			end

			local var_122_16 = 0.0166666666666667

			if var_122_14 <= arg_119_1.time_ and arg_119_1.time_ < var_122_14 + var_122_16 then
				local var_122_17 = (arg_119_1.time_ - var_122_14) / var_122_16
				local var_122_18 = Mathf.Lerp(arg_119_1.var_.alphaOldValue10015, 1, var_122_17)

				if arg_119_1.var_.characterEffect10015 then
					arg_119_1.var_.characterEffect10015.alpha = var_122_18
				end
			end

			if arg_119_1.time_ >= var_122_14 + var_122_16 and arg_119_1.time_ < var_122_14 + var_122_16 + arg_122_0 and arg_119_1.var_.characterEffect10015 then
				arg_119_1.var_.characterEffect10015.alpha = 1
			end

			local var_122_19 = 0
			local var_122_20 = 0.475

			if var_122_19 < arg_119_1.time_ and arg_119_1.time_ <= var_122_19 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_21 = arg_119_1:FormatText(StoryNameCfg[208].name)

				arg_119_1.leftNameTxt_.text = var_122_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_22 = arg_119_1:GetWordFromCfg(114221029)
				local var_122_23 = arg_119_1:FormatText(var_122_22.content)

				arg_119_1.text_.text = var_122_23

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_24 = 19
				local var_122_25 = utf8.len(var_122_23)
				local var_122_26 = var_122_24 <= 0 and var_122_20 or var_122_20 * (var_122_25 / var_122_24)

				if var_122_26 > 0 and var_122_20 < var_122_26 then
					arg_119_1.talkMaxDuration = var_122_26

					if var_122_26 + var_122_19 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_26 + var_122_19
					end
				end

				arg_119_1.text_.text = var_122_23
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114221", "114221029", "story_v_out_114221.awb") ~= 0 then
					local var_122_27 = manager.audio:GetVoiceLength("story_v_out_114221", "114221029", "story_v_out_114221.awb") / 1000

					if var_122_27 + var_122_19 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_27 + var_122_19
					end

					if var_122_22.prefab_name ~= "" and arg_119_1.actors_[var_122_22.prefab_name] ~= nil then
						local var_122_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_22.prefab_name].transform, "story_v_out_114221", "114221029", "story_v_out_114221.awb")

						arg_119_1:RecordAudio("114221029", var_122_28)
						arg_119_1:RecordAudio("114221029", var_122_28)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_114221", "114221029", "story_v_out_114221.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_114221", "114221029", "story_v_out_114221.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_29 = math.max(var_122_20, arg_119_1.talkMaxDuration)

			if var_122_19 <= arg_119_1.time_ and arg_119_1.time_ < var_122_19 + var_122_29 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_19) / var_122_29

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_19 + var_122_29 and arg_119_1.time_ < var_122_19 + var_122_29 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play114221030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 114221030
		arg_123_1.duration_ = 9.965999999999

		local var_123_0 = {
			ja = 5.432999999999,
			ko = 9.499999999999,
			zh = 9.965999999999,
			en = 9.499999999999
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
				arg_123_0:Play114221031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.mask_.enabled = true
				arg_123_1.mask_.raycastTarget = true

				arg_123_1:SetGaussion(false)
			end

			local var_126_1 = 2

			if var_126_0 <= arg_123_1.time_ and arg_123_1.time_ < var_126_0 + var_126_1 then
				local var_126_2 = (arg_123_1.time_ - var_126_0) / var_126_1
				local var_126_3 = Color.New(1, 1, 1)

				var_126_3.a = Mathf.Lerp(1, 0, var_126_2)
				arg_123_1.mask_.color = var_126_3
			end

			if arg_123_1.time_ >= var_126_0 + var_126_1 and arg_123_1.time_ < var_126_0 + var_126_1 + arg_126_0 then
				local var_126_4 = Color.New(1, 1, 1)
				local var_126_5 = 0

				arg_123_1.mask_.enabled = false
				var_126_4.a = var_126_5
				arg_123_1.mask_.color = var_126_4
			end

			local var_126_6 = arg_123_1.actors_["10015"].transform
			local var_126_7 = 0

			if var_126_7 < arg_123_1.time_ and arg_123_1.time_ <= var_126_7 + arg_126_0 then
				arg_123_1.var_.moveOldPos10015 = var_126_6.localPosition
				var_126_6.localScale = Vector3.New(1, 1, 1)

				arg_123_1:CheckSpriteTmpPos("10015", 7)

				local var_126_8 = var_126_6.childCount

				for iter_126_0 = 0, var_126_8 - 1 do
					local var_126_9 = var_126_6:GetChild(iter_126_0)

					if var_126_9.name == "split_5" or not string.find(var_126_9.name, "split") then
						var_126_9.gameObject:SetActive(true)
					else
						var_126_9.gameObject:SetActive(false)
					end
				end
			end

			local var_126_10 = 0.001

			if var_126_7 <= arg_123_1.time_ and arg_123_1.time_ < var_126_7 + var_126_10 then
				local var_126_11 = (arg_123_1.time_ - var_126_7) / var_126_10
				local var_126_12 = Vector3.New(0, -2000, -180)

				var_126_6.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos10015, var_126_12, var_126_11)
			end

			if arg_123_1.time_ >= var_126_7 + var_126_10 and arg_123_1.time_ < var_126_7 + var_126_10 + arg_126_0 then
				var_126_6.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_126_13 = "OM0501"

			if arg_123_1.bgs_[var_126_13] == nil then
				local var_126_14 = Object.Instantiate(arg_123_1.paintGo_)

				var_126_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_126_13)
				var_126_14.name = var_126_13
				var_126_14.transform.parent = arg_123_1.stage_.transform
				var_126_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_123_1.bgs_[var_126_13] = var_126_14
			end

			local var_126_15 = 0

			if var_126_15 < arg_123_1.time_ and arg_123_1.time_ <= var_126_15 + arg_126_0 then
				local var_126_16 = manager.ui.mainCamera.transform.localPosition
				local var_126_17 = Vector3.New(0, 0, 10) + Vector3.New(var_126_16.x, var_126_16.y, 0)
				local var_126_18 = arg_123_1.bgs_.OM0501

				var_126_18.transform.localPosition = var_126_17
				var_126_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_126_19 = var_126_18:GetComponent("SpriteRenderer")

				if var_126_19 and var_126_19.sprite then
					local var_126_20 = (var_126_18.transform.localPosition - var_126_16).z
					local var_126_21 = manager.ui.mainCameraCom_
					local var_126_22 = 2 * var_126_20 * Mathf.Tan(var_126_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_126_23 = var_126_22 * var_126_21.aspect
					local var_126_24 = var_126_19.sprite.bounds.size.x
					local var_126_25 = var_126_19.sprite.bounds.size.y
					local var_126_26 = var_126_23 / var_126_24
					local var_126_27 = var_126_22 / var_126_25
					local var_126_28 = var_126_27 < var_126_26 and var_126_26 or var_126_27

					var_126_18.transform.localScale = Vector3.New(var_126_28, var_126_28, 0)
				end

				for iter_126_1, iter_126_2 in pairs(arg_123_1.bgs_) do
					if iter_126_1 ~= "OM0501" then
						iter_126_2.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_126_29 = arg_123_1.bgs_.OM0501.transform
			local var_126_30 = 0

			if var_126_30 < arg_123_1.time_ and arg_123_1.time_ <= var_126_30 + arg_126_0 then
				arg_123_1.var_.moveOldPosOM0501 = var_126_29.localPosition
			end

			local var_126_31 = 0.001

			if var_126_30 <= arg_123_1.time_ and arg_123_1.time_ < var_126_30 + var_126_31 then
				local var_126_32 = (arg_123_1.time_ - var_126_30) / var_126_31
				local var_126_33 = Vector3.New(0, 1, 9.5)

				var_126_29.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPosOM0501, var_126_33, var_126_32)
			end

			if arg_123_1.time_ >= var_126_30 + var_126_31 and arg_123_1.time_ < var_126_30 + var_126_31 + arg_126_0 then
				var_126_29.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_126_34 = arg_123_1.bgs_.OM0501.transform
			local var_126_35 = 0.034

			if var_126_35 < arg_123_1.time_ and arg_123_1.time_ <= var_126_35 + arg_126_0 then
				arg_123_1.var_.moveOldPosOM0501 = var_126_34.localPosition
			end

			local var_126_36 = 2.5

			if var_126_35 <= arg_123_1.time_ and arg_123_1.time_ < var_126_35 + var_126_36 then
				local var_126_37 = (arg_123_1.time_ - var_126_35) / var_126_36
				local var_126_38 = Vector3.New(0, 1, 10)

				var_126_34.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPosOM0501, var_126_38, var_126_37)
			end

			if arg_123_1.time_ >= var_126_35 + var_126_36 and arg_123_1.time_ < var_126_35 + var_126_36 + arg_126_0 then
				var_126_34.localPosition = Vector3.New(0, 1, 10)
			end

			local var_126_39 = 2

			if var_126_39 < arg_123_1.time_ and arg_123_1.time_ <= var_126_39 + arg_126_0 then
				arg_123_1.allBtn_.enabled = false
			end

			local var_126_40 = 0.6

			if arg_123_1.time_ >= var_126_39 + var_126_40 and arg_123_1.time_ < var_126_39 + var_126_40 + arg_126_0 then
				arg_123_1.allBtn_.enabled = true
			end

			local var_126_41 = manager.ui.mainCamera.transform
			local var_126_42 = 2

			if var_126_42 < arg_123_1.time_ and arg_123_1.time_ <= var_126_42 + arg_126_0 then
				arg_123_1.var_.shakeOldPos = var_126_41.localPosition
			end

			local var_126_43 = 0.6

			if var_126_42 <= arg_123_1.time_ and arg_123_1.time_ < var_126_42 + var_126_43 then
				local var_126_44 = (arg_123_1.time_ - var_126_42) / 0.066
				local var_126_45, var_126_46 = math.modf(var_126_44)

				var_126_41.localPosition = Vector3.New(var_126_46 * 0.13, var_126_46 * 0.13, var_126_46 * 0.13) + arg_123_1.var_.shakeOldPos
			end

			if arg_123_1.time_ >= var_126_42 + var_126_43 and arg_123_1.time_ < var_126_42 + var_126_43 + arg_126_0 then
				var_126_41.localPosition = arg_123_1.var_.shakeOldPos
			end

			if arg_123_1.frameCnt_ <= 1 then
				arg_123_1.dialog_:SetActive(false)
			end

			local var_126_47 = 1.999999999999
			local var_126_48 = 0.55

			if var_126_47 < arg_123_1.time_ and arg_123_1.time_ <= var_126_47 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0

				arg_123_1.dialog_:SetActive(true)

				local var_126_49 = LeanTween.value(arg_123_1.dialog_, 0, 1, 0.3)

				var_126_49:setOnUpdate(LuaHelper.FloatAction(function(arg_127_0)
					arg_123_1.dialogCg_.alpha = arg_127_0
				end))
				var_126_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_123_1.dialog_)
					var_126_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_123_1.duration_ = arg_123_1.duration_ + 0.3

				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_50 = arg_123_1:FormatText(StoryNameCfg[256].name)

				arg_123_1.leftNameTxt_.text = var_126_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, true)
				arg_123_1.iconController_:SetSelectedState("hero")

				arg_123_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3020")

				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_51 = arg_123_1:GetWordFromCfg(114221030)
				local var_126_52 = arg_123_1:FormatText(var_126_51.content)

				arg_123_1.text_.text = var_126_52

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_53 = 22
				local var_126_54 = utf8.len(var_126_52)
				local var_126_55 = var_126_53 <= 0 and var_126_48 or var_126_48 * (var_126_54 / var_126_53)

				if var_126_55 > 0 and var_126_48 < var_126_55 then
					arg_123_1.talkMaxDuration = var_126_55
					var_126_47 = var_126_47 + 0.3

					if var_126_55 + var_126_47 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_55 + var_126_47
					end
				end

				arg_123_1.text_.text = var_126_52
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114221", "114221030", "story_v_out_114221.awb") ~= 0 then
					local var_126_56 = manager.audio:GetVoiceLength("story_v_out_114221", "114221030", "story_v_out_114221.awb") / 1000

					if var_126_56 + var_126_47 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_56 + var_126_47
					end

					if var_126_51.prefab_name ~= "" and arg_123_1.actors_[var_126_51.prefab_name] ~= nil then
						local var_126_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_51.prefab_name].transform, "story_v_out_114221", "114221030", "story_v_out_114221.awb")

						arg_123_1:RecordAudio("114221030", var_126_57)
						arg_123_1:RecordAudio("114221030", var_126_57)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_114221", "114221030", "story_v_out_114221.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_114221", "114221030", "story_v_out_114221.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_58 = var_126_47 + 0.3
			local var_126_59 = math.max(var_126_48, arg_123_1.talkMaxDuration)

			if var_126_58 <= arg_123_1.time_ and arg_123_1.time_ < var_126_58 + var_126_59 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_58) / var_126_59

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_58 + var_126_59 and arg_123_1.time_ < var_126_58 + var_126_59 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play114221031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 114221031
		arg_129_1.duration_ = 2.7

		local var_129_0 = {
			ja = 2.7,
			ko = 1.733,
			zh = 1.666,
			en = 1.666
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
			arg_129_1.auto_ = false
		end

		function arg_129_1.playNext_(arg_131_0)
			arg_129_1.onStoryFinished_()
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0
			local var_132_1 = 0.175

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_2 = arg_129_1:FormatText(StoryNameCfg[208].name)

				arg_129_1.leftNameTxt_.text = var_132_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_3 = arg_129_1:GetWordFromCfg(114221031)
				local var_132_4 = arg_129_1:FormatText(var_132_3.content)

				arg_129_1.text_.text = var_132_4

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_114221", "114221031", "story_v_out_114221.awb") ~= 0 then
					local var_132_8 = manager.audio:GetVoiceLength("story_v_out_114221", "114221031", "story_v_out_114221.awb") / 1000

					if var_132_8 + var_132_0 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_8 + var_132_0
					end

					if var_132_3.prefab_name ~= "" and arg_129_1.actors_[var_132_3.prefab_name] ~= nil then
						local var_132_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_3.prefab_name].transform, "story_v_out_114221", "114221031", "story_v_out_114221.awb")

						arg_129_1:RecordAudio("114221031", var_132_9)
						arg_129_1:RecordAudio("114221031", var_132_9)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_114221", "114221031", "story_v_out_114221.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_114221", "114221031", "story_v_out_114221.awb")
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
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/F03",
		"Assets/UIResources/UI_AB/TextureConfig/Background/OM0501"
	},
	voices = {
		"story_v_out_114221.awb"
	}
}
