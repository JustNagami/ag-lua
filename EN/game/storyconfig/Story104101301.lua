return {
	Play410131001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 410131001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play410131002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "L04f"

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
				local var_4_5 = arg_1_1.bgs_.L04f

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
					if iter_4_0 ~= "L04f" then
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

			local var_4_22 = 2
			local var_4_23 = 1

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "effect"

				arg_1_1:AudioAction(var_4_24, var_4_25, "se_story_1", "se_story_1_gun_load", "")
			end

			local var_4_26 = 0
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_30 = 1.56666666666666
			local var_4_31 = 1

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "music"

				arg_1_1:AudioAction(var_4_32, var_4_33, "bgm_activity_2_8_story_tara_building", "bgm_activity_2_8_story_tara_building", "bgm_activity_2_8_story_tara_building.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.8

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_36 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_36:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_37 = arg_1_1:GetWordFromCfg(410131001)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_39 = 32
				local var_4_40 = utf8.len(var_4_38)
				local var_4_41 = var_4_39 <= 0 and var_4_35 or var_4_35 * (var_4_40 / var_4_39)

				if var_4_41 > 0 and var_4_35 < var_4_41 then
					arg_1_1.talkMaxDuration = var_4_41
					var_4_34 = var_4_34 + 0.3

					if var_4_41 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_41 + var_4_34
					end
				end

				arg_1_1.text_.text = var_4_38
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_42 = var_4_34 + 0.3
			local var_4_43 = math.max(var_4_35, arg_1_1.talkMaxDuration)

			if var_4_42 <= arg_1_1.time_ and arg_1_1.time_ < var_4_42 + var_4_43 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_42) / var_4_43

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_42 + var_4_43 and arg_1_1.time_ < var_4_42 + var_4_43 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play410131002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 410131002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play410131003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.075

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

				local var_10_2 = arg_7_1:GetWordFromCfg(410131002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 43
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
	Play410131003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 410131003
		arg_11_1.duration_ = 7.5

		local var_11_0 = {
			zh = 7.5,
			ja = 6.733
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
				arg_11_0:Play410131004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "10059"

			if arg_11_1.actors_[var_14_0] == nil then
				local var_14_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_14_0), arg_11_1.canvasGo_.transform)

				var_14_1.transform:SetSiblingIndex(1)

				var_14_1.name = var_14_0
				var_14_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_11_1.actors_[var_14_0] = var_14_1
			end

			local var_14_2 = arg_11_1.actors_["10059"].transform
			local var_14_3 = 0

			if var_14_3 < arg_11_1.time_ and arg_11_1.time_ <= var_14_3 + arg_14_0 then
				arg_11_1.var_.moveOldPos10059 = var_14_2.localPosition
				var_14_2.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("10059", 3)

				local var_14_4 = var_14_2.childCount

				for iter_14_0 = 0, var_14_4 - 1 do
					local var_14_5 = var_14_2:GetChild(iter_14_0)

					if var_14_5.name == "" or not string.find(var_14_5.name, "split") then
						var_14_5.gameObject:SetActive(true)
					else
						var_14_5.gameObject:SetActive(false)
					end
				end
			end

			local var_14_6 = 0.001

			if var_14_3 <= arg_11_1.time_ and arg_11_1.time_ < var_14_3 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_3) / var_14_6
				local var_14_8 = Vector3.New(0, -530, 35)

				var_14_2.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos10059, var_14_8, var_14_7)
			end

			if arg_11_1.time_ >= var_14_3 + var_14_6 and arg_11_1.time_ < var_14_3 + var_14_6 + arg_14_0 then
				var_14_2.localPosition = Vector3.New(0, -530, 35)
			end

			local var_14_9 = arg_11_1.actors_["10059"]
			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 and arg_11_1.var_.actorSpriteComps10059 == nil then
				arg_11_1.var_.actorSpriteComps10059 = var_14_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_11 = 0.034

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_11 then
				local var_14_12 = (arg_11_1.time_ - var_14_10) / var_14_11

				if arg_11_1.var_.actorSpriteComps10059 then
					for iter_14_1, iter_14_2 in pairs(arg_11_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_14_2 then
							local var_14_13 = Mathf.Lerp(iter_14_2.color.r, 1, var_14_12)

							iter_14_2.color = Color.New(var_14_13, var_14_13, var_14_13)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_10 + var_14_11 and arg_11_1.time_ < var_14_10 + var_14_11 + arg_14_0 and arg_11_1.var_.actorSpriteComps10059 then
				local var_14_14 = 1

				for iter_14_3, iter_14_4 in pairs(arg_11_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_14_4 then
						iter_14_4.color = Color.New(var_14_14, var_14_14, var_14_14)
					end
				end

				arg_11_1.var_.actorSpriteComps10059 = nil
			end

			local var_14_15 = 0
			local var_14_16 = 0.55

			if var_14_15 < arg_11_1.time_ and arg_11_1.time_ <= var_14_15 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_17 = arg_11_1:FormatText(StoryNameCfg[596].name)

				arg_11_1.leftNameTxt_.text = var_14_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_18 = arg_11_1:GetWordFromCfg(410131003)
				local var_14_19 = arg_11_1:FormatText(var_14_18.content)

				arg_11_1.text_.text = var_14_19

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_20 = 22
				local var_14_21 = utf8.len(var_14_19)
				local var_14_22 = var_14_20 <= 0 and var_14_16 or var_14_16 * (var_14_21 / var_14_20)

				if var_14_22 > 0 and var_14_16 < var_14_22 then
					arg_11_1.talkMaxDuration = var_14_22

					if var_14_22 + var_14_15 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_22 + var_14_15
					end
				end

				arg_11_1.text_.text = var_14_19
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131003", "story_v_out_410131.awb") ~= 0 then
					local var_14_23 = manager.audio:GetVoiceLength("story_v_out_410131", "410131003", "story_v_out_410131.awb") / 1000

					if var_14_23 + var_14_15 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_23 + var_14_15
					end

					if var_14_18.prefab_name ~= "" and arg_11_1.actors_[var_14_18.prefab_name] ~= nil then
						local var_14_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_18.prefab_name].transform, "story_v_out_410131", "410131003", "story_v_out_410131.awb")

						arg_11_1:RecordAudio("410131003", var_14_24)
						arg_11_1:RecordAudio("410131003", var_14_24)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_410131", "410131003", "story_v_out_410131.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_410131", "410131003", "story_v_out_410131.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_25 = math.max(var_14_16, arg_11_1.talkMaxDuration)

			if var_14_15 <= arg_11_1.time_ and arg_11_1.time_ < var_14_15 + var_14_25 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_15) / var_14_25

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_15 + var_14_25 and arg_11_1.time_ < var_14_15 + var_14_25 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play410131004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 410131004
		arg_15_1.duration_ = 18

		local var_15_0 = {
			zh = 7.233,
			ja = 18
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
				arg_15_0:Play410131005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "1060"

			if arg_15_1.actors_[var_18_0] == nil then
				local var_18_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_18_0), arg_15_1.canvasGo_.transform)

				var_18_1.transform:SetSiblingIndex(1)

				var_18_1.name = var_18_0
				var_18_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_15_1.actors_[var_18_0] = var_18_1
			end

			local var_18_2 = arg_15_1.actors_["1060"].transform
			local var_18_3 = 0

			if var_18_3 < arg_15_1.time_ and arg_15_1.time_ <= var_18_3 + arg_18_0 then
				arg_15_1.var_.moveOldPos1060 = var_18_2.localPosition
				var_18_2.localScale = Vector3.New(1, 1, 1)

				arg_15_1:CheckSpriteTmpPos("1060", 4)

				local var_18_4 = var_18_2.childCount

				for iter_18_0 = 0, var_18_4 - 1 do
					local var_18_5 = var_18_2:GetChild(iter_18_0)

					if var_18_5.name == "" or not string.find(var_18_5.name, "split") then
						var_18_5.gameObject:SetActive(true)
					else
						var_18_5.gameObject:SetActive(false)
					end
				end
			end

			local var_18_6 = 0.001

			if var_18_3 <= arg_15_1.time_ and arg_15_1.time_ < var_18_3 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_3) / var_18_6
				local var_18_8 = Vector3.New(390, -435, -40)

				var_18_2.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1060, var_18_8, var_18_7)
			end

			if arg_15_1.time_ >= var_18_3 + var_18_6 and arg_15_1.time_ < var_18_3 + var_18_6 + arg_18_0 then
				var_18_2.localPosition = Vector3.New(390, -435, -40)
			end

			local var_18_9 = arg_15_1.actors_["10059"].transform
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 then
				arg_15_1.var_.moveOldPos10059 = var_18_9.localPosition
				var_18_9.localScale = Vector3.New(1, 1, 1)

				arg_15_1:CheckSpriteTmpPos("10059", 2)

				local var_18_11 = var_18_9.childCount

				for iter_18_1 = 0, var_18_11 - 1 do
					local var_18_12 = var_18_9:GetChild(iter_18_1)

					if var_18_12.name == "" or not string.find(var_18_12.name, "split") then
						var_18_12.gameObject:SetActive(true)
					else
						var_18_12.gameObject:SetActive(false)
					end
				end
			end

			local var_18_13 = 0.001

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_13 then
				local var_18_14 = (arg_15_1.time_ - var_18_10) / var_18_13
				local var_18_15 = Vector3.New(-390, -530, 35)

				var_18_9.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10059, var_18_15, var_18_14)
			end

			if arg_15_1.time_ >= var_18_10 + var_18_13 and arg_15_1.time_ < var_18_10 + var_18_13 + arg_18_0 then
				var_18_9.localPosition = Vector3.New(-390, -530, 35)
			end

			local var_18_16 = arg_15_1.actors_["1060"]
			local var_18_17 = 0

			if var_18_17 < arg_15_1.time_ and arg_15_1.time_ <= var_18_17 + arg_18_0 and arg_15_1.var_.actorSpriteComps1060 == nil then
				arg_15_1.var_.actorSpriteComps1060 = var_18_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_18 = 0.034

			if var_18_17 <= arg_15_1.time_ and arg_15_1.time_ < var_18_17 + var_18_18 then
				local var_18_19 = (arg_15_1.time_ - var_18_17) / var_18_18

				if arg_15_1.var_.actorSpriteComps1060 then
					for iter_18_2, iter_18_3 in pairs(arg_15_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_18_3 then
							local var_18_20 = Mathf.Lerp(iter_18_3.color.r, 1, var_18_19)

							iter_18_3.color = Color.New(var_18_20, var_18_20, var_18_20)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_17 + var_18_18 and arg_15_1.time_ < var_18_17 + var_18_18 + arg_18_0 and arg_15_1.var_.actorSpriteComps1060 then
				local var_18_21 = 1

				for iter_18_4, iter_18_5 in pairs(arg_15_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_18_5 then
						iter_18_5.color = Color.New(var_18_21, var_18_21, var_18_21)
					end
				end

				arg_15_1.var_.actorSpriteComps1060 = nil
			end

			local var_18_22 = arg_15_1.actors_["10059"]
			local var_18_23 = 0

			if var_18_23 < arg_15_1.time_ and arg_15_1.time_ <= var_18_23 + arg_18_0 and arg_15_1.var_.actorSpriteComps10059 == nil then
				arg_15_1.var_.actorSpriteComps10059 = var_18_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_24 = 0.034

			if var_18_23 <= arg_15_1.time_ and arg_15_1.time_ < var_18_23 + var_18_24 then
				local var_18_25 = (arg_15_1.time_ - var_18_23) / var_18_24

				if arg_15_1.var_.actorSpriteComps10059 then
					for iter_18_6, iter_18_7 in pairs(arg_15_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_18_7 then
							local var_18_26 = Mathf.Lerp(iter_18_7.color.r, 0.5, var_18_25)

							iter_18_7.color = Color.New(var_18_26, var_18_26, var_18_26)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_23 + var_18_24 and arg_15_1.time_ < var_18_23 + var_18_24 + arg_18_0 and arg_15_1.var_.actorSpriteComps10059 then
				local var_18_27 = 0.5

				for iter_18_8, iter_18_9 in pairs(arg_15_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_18_9 then
						iter_18_9.color = Color.New(var_18_27, var_18_27, var_18_27)
					end
				end

				arg_15_1.var_.actorSpriteComps10059 = nil
			end

			local var_18_28 = 0
			local var_18_29 = 1.05

			if var_18_28 < arg_15_1.time_ and arg_15_1.time_ <= var_18_28 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_30 = arg_15_1:FormatText(StoryNameCfg[584].name)

				arg_15_1.leftNameTxt_.text = var_18_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_31 = arg_15_1:GetWordFromCfg(410131004)
				local var_18_32 = arg_15_1:FormatText(var_18_31.content)

				arg_15_1.text_.text = var_18_32

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_33 = 42
				local var_18_34 = utf8.len(var_18_32)
				local var_18_35 = var_18_33 <= 0 and var_18_29 or var_18_29 * (var_18_34 / var_18_33)

				if var_18_35 > 0 and var_18_29 < var_18_35 then
					arg_15_1.talkMaxDuration = var_18_35

					if var_18_35 + var_18_28 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_35 + var_18_28
					end
				end

				arg_15_1.text_.text = var_18_32
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131004", "story_v_out_410131.awb") ~= 0 then
					local var_18_36 = manager.audio:GetVoiceLength("story_v_out_410131", "410131004", "story_v_out_410131.awb") / 1000

					if var_18_36 + var_18_28 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_36 + var_18_28
					end

					if var_18_31.prefab_name ~= "" and arg_15_1.actors_[var_18_31.prefab_name] ~= nil then
						local var_18_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_31.prefab_name].transform, "story_v_out_410131", "410131004", "story_v_out_410131.awb")

						arg_15_1:RecordAudio("410131004", var_18_37)
						arg_15_1:RecordAudio("410131004", var_18_37)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_410131", "410131004", "story_v_out_410131.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_410131", "410131004", "story_v_out_410131.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_38 = math.max(var_18_29, arg_15_1.talkMaxDuration)

			if var_18_28 <= arg_15_1.time_ and arg_15_1.time_ < var_18_28 + var_18_38 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_28) / var_18_38

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_28 + var_18_38 and arg_15_1.time_ < var_18_28 + var_18_38 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play410131005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 410131005
		arg_19_1.duration_ = 10

		local var_19_0 = {
			zh = 6.766,
			ja = 10
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
				arg_19_0:Play410131006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10059"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.actorSpriteComps10059 == nil then
				arg_19_1.var_.actorSpriteComps10059 = var_22_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_2 = 0.034

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.actorSpriteComps10059 then
					for iter_22_0, iter_22_1 in pairs(arg_19_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_22_1 then
							local var_22_4 = Mathf.Lerp(iter_22_1.color.r, 1, var_22_3)

							iter_22_1.color = Color.New(var_22_4, var_22_4, var_22_4)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.actorSpriteComps10059 then
				local var_22_5 = 1

				for iter_22_2, iter_22_3 in pairs(arg_19_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_22_3 then
						iter_22_3.color = Color.New(var_22_5, var_22_5, var_22_5)
					end
				end

				arg_19_1.var_.actorSpriteComps10059 = nil
			end

			local var_22_6 = arg_19_1.actors_["1060"]
			local var_22_7 = 0

			if var_22_7 < arg_19_1.time_ and arg_19_1.time_ <= var_22_7 + arg_22_0 and arg_19_1.var_.actorSpriteComps1060 == nil then
				arg_19_1.var_.actorSpriteComps1060 = var_22_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_8 = 0.034

			if var_22_7 <= arg_19_1.time_ and arg_19_1.time_ < var_22_7 + var_22_8 then
				local var_22_9 = (arg_19_1.time_ - var_22_7) / var_22_8

				if arg_19_1.var_.actorSpriteComps1060 then
					for iter_22_4, iter_22_5 in pairs(arg_19_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_22_5 then
							local var_22_10 = Mathf.Lerp(iter_22_5.color.r, 0.5, var_22_9)

							iter_22_5.color = Color.New(var_22_10, var_22_10, var_22_10)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_7 + var_22_8 and arg_19_1.time_ < var_22_7 + var_22_8 + arg_22_0 and arg_19_1.var_.actorSpriteComps1060 then
				local var_22_11 = 0.5

				for iter_22_6, iter_22_7 in pairs(arg_19_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_22_7 then
						iter_22_7.color = Color.New(var_22_11, var_22_11, var_22_11)
					end
				end

				arg_19_1.var_.actorSpriteComps1060 = nil
			end

			local var_22_12 = 0
			local var_22_13 = 0.8

			if var_22_12 < arg_19_1.time_ and arg_19_1.time_ <= var_22_12 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_14 = arg_19_1:FormatText(StoryNameCfg[596].name)

				arg_19_1.leftNameTxt_.text = var_22_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_15 = arg_19_1:GetWordFromCfg(410131005)
				local var_22_16 = arg_19_1:FormatText(var_22_15.content)

				arg_19_1.text_.text = var_22_16

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_17 = 32
				local var_22_18 = utf8.len(var_22_16)
				local var_22_19 = var_22_17 <= 0 and var_22_13 or var_22_13 * (var_22_18 / var_22_17)

				if var_22_19 > 0 and var_22_13 < var_22_19 then
					arg_19_1.talkMaxDuration = var_22_19

					if var_22_19 + var_22_12 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_19 + var_22_12
					end
				end

				arg_19_1.text_.text = var_22_16
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131005", "story_v_out_410131.awb") ~= 0 then
					local var_22_20 = manager.audio:GetVoiceLength("story_v_out_410131", "410131005", "story_v_out_410131.awb") / 1000

					if var_22_20 + var_22_12 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_20 + var_22_12
					end

					if var_22_15.prefab_name ~= "" and arg_19_1.actors_[var_22_15.prefab_name] ~= nil then
						local var_22_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_15.prefab_name].transform, "story_v_out_410131", "410131005", "story_v_out_410131.awb")

						arg_19_1:RecordAudio("410131005", var_22_21)
						arg_19_1:RecordAudio("410131005", var_22_21)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_410131", "410131005", "story_v_out_410131.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_410131", "410131005", "story_v_out_410131.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_22 = math.max(var_22_13, arg_19_1.talkMaxDuration)

			if var_22_12 <= arg_19_1.time_ and arg_19_1.time_ < var_22_12 + var_22_22 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_12) / var_22_22

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_12 + var_22_22 and arg_19_1.time_ < var_22_12 + var_22_22 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play410131006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 410131006
		arg_23_1.duration_ = 11.033

		local var_23_0 = {
			zh = 8.1,
			ja = 11.033
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
				arg_23_0:Play410131007(arg_23_1)
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

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[596].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(410131006)
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

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131006", "story_v_out_410131.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_410131", "410131006", "story_v_out_410131.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_410131", "410131006", "story_v_out_410131.awb")

						arg_23_1:RecordAudio("410131006", var_26_9)
						arg_23_1:RecordAudio("410131006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_410131", "410131006", "story_v_out_410131.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_410131", "410131006", "story_v_out_410131.awb")
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
	Play410131007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 410131007
		arg_27_1.duration_ = 8.366

		local var_27_0 = {
			zh = 4.7,
			ja = 8.366
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
				arg_27_0:Play410131008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1060"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.actorSpriteComps1060 == nil then
				arg_27_1.var_.actorSpriteComps1060 = var_30_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_2 = 0.034

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.actorSpriteComps1060 then
					for iter_30_0, iter_30_1 in pairs(arg_27_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_30_1 then
							local var_30_4 = Mathf.Lerp(iter_30_1.color.r, 1, var_30_3)

							iter_30_1.color = Color.New(var_30_4, var_30_4, var_30_4)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.actorSpriteComps1060 then
				local var_30_5 = 1

				for iter_30_2, iter_30_3 in pairs(arg_27_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_30_3 then
						iter_30_3.color = Color.New(var_30_5, var_30_5, var_30_5)
					end
				end

				arg_27_1.var_.actorSpriteComps1060 = nil
			end

			local var_30_6 = arg_27_1.actors_["10059"]
			local var_30_7 = 0

			if var_30_7 < arg_27_1.time_ and arg_27_1.time_ <= var_30_7 + arg_30_0 and arg_27_1.var_.actorSpriteComps10059 == nil then
				arg_27_1.var_.actorSpriteComps10059 = var_30_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_8 = 0.034

			if var_30_7 <= arg_27_1.time_ and arg_27_1.time_ < var_30_7 + var_30_8 then
				local var_30_9 = (arg_27_1.time_ - var_30_7) / var_30_8

				if arg_27_1.var_.actorSpriteComps10059 then
					for iter_30_4, iter_30_5 in pairs(arg_27_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_30_5 then
							local var_30_10 = Mathf.Lerp(iter_30_5.color.r, 0.5, var_30_9)

							iter_30_5.color = Color.New(var_30_10, var_30_10, var_30_10)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_7 + var_30_8 and arg_27_1.time_ < var_30_7 + var_30_8 + arg_30_0 and arg_27_1.var_.actorSpriteComps10059 then
				local var_30_11 = 0.5

				for iter_30_6, iter_30_7 in pairs(arg_27_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_30_7 then
						iter_30_7.color = Color.New(var_30_11, var_30_11, var_30_11)
					end
				end

				arg_27_1.var_.actorSpriteComps10059 = nil
			end

			local var_30_12 = 0
			local var_30_13 = 0.625

			if var_30_12 < arg_27_1.time_ and arg_27_1.time_ <= var_30_12 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_14 = arg_27_1:FormatText(StoryNameCfg[584].name)

				arg_27_1.leftNameTxt_.text = var_30_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_15 = arg_27_1:GetWordFromCfg(410131007)
				local var_30_16 = arg_27_1:FormatText(var_30_15.content)

				arg_27_1.text_.text = var_30_16

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_17 = 25
				local var_30_18 = utf8.len(var_30_16)
				local var_30_19 = var_30_17 <= 0 and var_30_13 or var_30_13 * (var_30_18 / var_30_17)

				if var_30_19 > 0 and var_30_13 < var_30_19 then
					arg_27_1.talkMaxDuration = var_30_19

					if var_30_19 + var_30_12 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_19 + var_30_12
					end
				end

				arg_27_1.text_.text = var_30_16
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131007", "story_v_out_410131.awb") ~= 0 then
					local var_30_20 = manager.audio:GetVoiceLength("story_v_out_410131", "410131007", "story_v_out_410131.awb") / 1000

					if var_30_20 + var_30_12 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_20 + var_30_12
					end

					if var_30_15.prefab_name ~= "" and arg_27_1.actors_[var_30_15.prefab_name] ~= nil then
						local var_30_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_15.prefab_name].transform, "story_v_out_410131", "410131007", "story_v_out_410131.awb")

						arg_27_1:RecordAudio("410131007", var_30_21)
						arg_27_1:RecordAudio("410131007", var_30_21)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_410131", "410131007", "story_v_out_410131.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_410131", "410131007", "story_v_out_410131.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_22 = math.max(var_30_13, arg_27_1.talkMaxDuration)

			if var_30_12 <= arg_27_1.time_ and arg_27_1.time_ < var_30_12 + var_30_22 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_12) / var_30_22

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_12 + var_30_22 and arg_27_1.time_ < var_30_12 + var_30_22 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play410131008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 410131008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play410131009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1060"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1060 = var_34_0.localPosition
				var_34_0.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("1060", 7)

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
				local var_34_6 = Vector3.New(0, -2000, -40)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1060, var_34_6, var_34_5)
			end

			if arg_31_1.time_ >= var_34_1 + var_34_4 and arg_31_1.time_ < var_34_1 + var_34_4 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_34_7 = arg_31_1.actors_["1060"]
			local var_34_8 = 0

			if var_34_8 < arg_31_1.time_ and arg_31_1.time_ <= var_34_8 + arg_34_0 and arg_31_1.var_.actorSpriteComps1060 == nil then
				arg_31_1.var_.actorSpriteComps1060 = var_34_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_9 = 0.034

			if var_34_8 <= arg_31_1.time_ and arg_31_1.time_ < var_34_8 + var_34_9 then
				local var_34_10 = (arg_31_1.time_ - var_34_8) / var_34_9

				if arg_31_1.var_.actorSpriteComps1060 then
					for iter_34_1, iter_34_2 in pairs(arg_31_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_34_2 then
							local var_34_11 = Mathf.Lerp(iter_34_2.color.r, 0.5, var_34_10)

							iter_34_2.color = Color.New(var_34_11, var_34_11, var_34_11)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_8 + var_34_9 and arg_31_1.time_ < var_34_8 + var_34_9 + arg_34_0 and arg_31_1.var_.actorSpriteComps1060 then
				local var_34_12 = 0.5

				for iter_34_3, iter_34_4 in pairs(arg_31_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_34_4 then
						iter_34_4.color = Color.New(var_34_12, var_34_12, var_34_12)
					end
				end

				arg_31_1.var_.actorSpriteComps1060 = nil
			end

			local var_34_13 = arg_31_1.actors_["10059"].transform
			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1.var_.moveOldPos10059 = var_34_13.localPosition
				var_34_13.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("10059", 7)

				local var_34_15 = var_34_13.childCount

				for iter_34_5 = 0, var_34_15 - 1 do
					local var_34_16 = var_34_13:GetChild(iter_34_5)

					if var_34_16.name == "" or not string.find(var_34_16.name, "split") then
						var_34_16.gameObject:SetActive(true)
					else
						var_34_16.gameObject:SetActive(false)
					end
				end
			end

			local var_34_17 = 0.001

			if var_34_14 <= arg_31_1.time_ and arg_31_1.time_ < var_34_14 + var_34_17 then
				local var_34_18 = (arg_31_1.time_ - var_34_14) / var_34_17
				local var_34_19 = Vector3.New(0, -2000, -40)

				var_34_13.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10059, var_34_19, var_34_18)
			end

			if arg_31_1.time_ >= var_34_14 + var_34_17 and arg_31_1.time_ < var_34_14 + var_34_17 + arg_34_0 then
				var_34_13.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_34_20 = 0
			local var_34_21 = 1

			if var_34_20 < arg_31_1.time_ and arg_31_1.time_ <= var_34_20 + arg_34_0 then
				local var_34_22 = "play"
				local var_34_23 = "effect"

				arg_31_1:AudioAction(var_34_22, var_34_23, "se_story_128", "se_story_128_bullet", "")
			end

			local var_34_24 = 0
			local var_34_25 = 1.025

			if var_34_24 < arg_31_1.time_ and arg_31_1.time_ <= var_34_24 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_26 = arg_31_1:GetWordFromCfg(410131008)
				local var_34_27 = arg_31_1:FormatText(var_34_26.content)

				arg_31_1.text_.text = var_34_27

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_28 = 41
				local var_34_29 = utf8.len(var_34_27)
				local var_34_30 = var_34_28 <= 0 and var_34_25 or var_34_25 * (var_34_29 / var_34_28)

				if var_34_30 > 0 and var_34_25 < var_34_30 then
					arg_31_1.talkMaxDuration = var_34_30

					if var_34_30 + var_34_24 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_30 + var_34_24
					end
				end

				arg_31_1.text_.text = var_34_27
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_31 = math.max(var_34_25, arg_31_1.talkMaxDuration)

			if var_34_24 <= arg_31_1.time_ and arg_31_1.time_ < var_34_24 + var_34_31 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_24) / var_34_31

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_24 + var_34_31 and arg_31_1.time_ < var_34_24 + var_34_31 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play410131009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 410131009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play410131010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.05

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[604].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, true)
				arg_35_1.iconController_:SetSelectedState("hero")

				arg_35_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3046")

				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(410131009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 2
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
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_8 = math.max(var_38_1, arg_35_1.talkMaxDuration)

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_8 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_0) / var_38_8

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_0 + var_38_8 and arg_35_1.time_ < var_38_0 + var_38_8 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play410131010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 410131010
		arg_39_1.duration_ = 6.966

		local var_39_0 = {
			zh = 1.966,
			ja = 6.966
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
				arg_39_0:Play410131011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1060"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1060 = var_42_0.localPosition
				var_42_0.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("1060", 3)

				local var_42_2 = var_42_0.childCount

				for iter_42_0 = 0, var_42_2 - 1 do
					local var_42_3 = var_42_0:GetChild(iter_42_0)

					if var_42_3.name == "" or not string.find(var_42_3.name, "split") then
						var_42_3.gameObject:SetActive(true)
					else
						var_42_3.gameObject:SetActive(false)
					end
				end
			end

			local var_42_4 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_4 then
				local var_42_5 = (arg_39_1.time_ - var_42_1) / var_42_4
				local var_42_6 = Vector3.New(0, -435, -40)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1060, var_42_6, var_42_5)
			end

			if arg_39_1.time_ >= var_42_1 + var_42_4 and arg_39_1.time_ < var_42_1 + var_42_4 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_42_7 = arg_39_1.actors_["1060"]
			local var_42_8 = 0

			if var_42_8 < arg_39_1.time_ and arg_39_1.time_ <= var_42_8 + arg_42_0 and arg_39_1.var_.actorSpriteComps1060 == nil then
				arg_39_1.var_.actorSpriteComps1060 = var_42_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_9 = 0.034

			if var_42_8 <= arg_39_1.time_ and arg_39_1.time_ < var_42_8 + var_42_9 then
				local var_42_10 = (arg_39_1.time_ - var_42_8) / var_42_9

				if arg_39_1.var_.actorSpriteComps1060 then
					for iter_42_1, iter_42_2 in pairs(arg_39_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_42_2 then
							local var_42_11 = Mathf.Lerp(iter_42_2.color.r, 1, var_42_10)

							iter_42_2.color = Color.New(var_42_11, var_42_11, var_42_11)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_8 + var_42_9 and arg_39_1.time_ < var_42_8 + var_42_9 + arg_42_0 and arg_39_1.var_.actorSpriteComps1060 then
				local var_42_12 = 1

				for iter_42_3, iter_42_4 in pairs(arg_39_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_42_4 then
						iter_42_4.color = Color.New(var_42_12, var_42_12, var_42_12)
					end
				end

				arg_39_1.var_.actorSpriteComps1060 = nil
			end

			local var_42_13 = 0
			local var_42_14 = 0.275

			if var_42_13 < arg_39_1.time_ and arg_39_1.time_ <= var_42_13 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_15 = arg_39_1:FormatText(StoryNameCfg[584].name)

				arg_39_1.leftNameTxt_.text = var_42_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_16 = arg_39_1:GetWordFromCfg(410131010)
				local var_42_17 = arg_39_1:FormatText(var_42_16.content)

				arg_39_1.text_.text = var_42_17

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_18 = 11
				local var_42_19 = utf8.len(var_42_17)
				local var_42_20 = var_42_18 <= 0 and var_42_14 or var_42_14 * (var_42_19 / var_42_18)

				if var_42_20 > 0 and var_42_14 < var_42_20 then
					arg_39_1.talkMaxDuration = var_42_20

					if var_42_20 + var_42_13 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_20 + var_42_13
					end
				end

				arg_39_1.text_.text = var_42_17
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131010", "story_v_out_410131.awb") ~= 0 then
					local var_42_21 = manager.audio:GetVoiceLength("story_v_out_410131", "410131010", "story_v_out_410131.awb") / 1000

					if var_42_21 + var_42_13 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_21 + var_42_13
					end

					if var_42_16.prefab_name ~= "" and arg_39_1.actors_[var_42_16.prefab_name] ~= nil then
						local var_42_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_16.prefab_name].transform, "story_v_out_410131", "410131010", "story_v_out_410131.awb")

						arg_39_1:RecordAudio("410131010", var_42_22)
						arg_39_1:RecordAudio("410131010", var_42_22)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_410131", "410131010", "story_v_out_410131.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_410131", "410131010", "story_v_out_410131.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_23 = math.max(var_42_14, arg_39_1.talkMaxDuration)

			if var_42_13 <= arg_39_1.time_ and arg_39_1.time_ < var_42_13 + var_42_23 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_13) / var_42_23

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_13 + var_42_23 and arg_39_1.time_ < var_42_13 + var_42_23 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play410131011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 410131011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play410131012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1060"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1060 = var_46_0.localPosition
				var_46_0.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("1060", 7)

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
				local var_46_6 = Vector3.New(0, -2000, -40)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1060, var_46_6, var_46_5)
			end

			if arg_43_1.time_ >= var_46_1 + var_46_4 and arg_43_1.time_ < var_46_1 + var_46_4 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_46_7 = arg_43_1.actors_["1060"]
			local var_46_8 = 0

			if var_46_8 < arg_43_1.time_ and arg_43_1.time_ <= var_46_8 + arg_46_0 and arg_43_1.var_.actorSpriteComps1060 == nil then
				arg_43_1.var_.actorSpriteComps1060 = var_46_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_9 = 0.034

			if var_46_8 <= arg_43_1.time_ and arg_43_1.time_ < var_46_8 + var_46_9 then
				local var_46_10 = (arg_43_1.time_ - var_46_8) / var_46_9

				if arg_43_1.var_.actorSpriteComps1060 then
					for iter_46_1, iter_46_2 in pairs(arg_43_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_46_2 then
							local var_46_11 = Mathf.Lerp(iter_46_2.color.r, 0.5, var_46_10)

							iter_46_2.color = Color.New(var_46_11, var_46_11, var_46_11)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_8 + var_46_9 and arg_43_1.time_ < var_46_8 + var_46_9 + arg_46_0 and arg_43_1.var_.actorSpriteComps1060 then
				local var_46_12 = 0.5

				for iter_46_3, iter_46_4 in pairs(arg_43_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_46_4 then
						iter_46_4.color = Color.New(var_46_12, var_46_12, var_46_12)
					end
				end

				arg_43_1.var_.actorSpriteComps1060 = nil
			end

			local var_46_13 = 0
			local var_46_14 = 1

			if var_46_13 < arg_43_1.time_ and arg_43_1.time_ <= var_46_13 + arg_46_0 then
				local var_46_15 = "play"
				local var_46_16 = "effect"

				arg_43_1:AudioAction(var_46_15, var_46_16, "se_story_222_00", "se_story_222_00_gun", "")
			end

			local var_46_17 = 0
			local var_46_18 = 0.975

			if var_46_17 < arg_43_1.time_ and arg_43_1.time_ <= var_46_17 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_19 = arg_43_1:GetWordFromCfg(410131011)
				local var_46_20 = arg_43_1:FormatText(var_46_19.content)

				arg_43_1.text_.text = var_46_20

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_21 = 39
				local var_46_22 = utf8.len(var_46_20)
				local var_46_23 = var_46_21 <= 0 and var_46_18 or var_46_18 * (var_46_22 / var_46_21)

				if var_46_23 > 0 and var_46_18 < var_46_23 then
					arg_43_1.talkMaxDuration = var_46_23

					if var_46_23 + var_46_17 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_23 + var_46_17
					end
				end

				arg_43_1.text_.text = var_46_20
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_24 = math.max(var_46_18, arg_43_1.talkMaxDuration)

			if var_46_17 <= arg_43_1.time_ and arg_43_1.time_ < var_46_17 + var_46_24 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_17) / var_46_24

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_17 + var_46_24 and arg_43_1.time_ < var_46_17 + var_46_24 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play410131012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 410131012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play410131013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 1.25

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_2 = arg_47_1:GetWordFromCfg(410131012)
				local var_50_3 = arg_47_1:FormatText(var_50_2.content)

				arg_47_1.text_.text = var_50_3

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_4 = 50
				local var_50_5 = utf8.len(var_50_3)
				local var_50_6 = var_50_4 <= 0 and var_50_1 or var_50_1 * (var_50_5 / var_50_4)

				if var_50_6 > 0 and var_50_1 < var_50_6 then
					arg_47_1.talkMaxDuration = var_50_6

					if var_50_6 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_6 + var_50_0
					end
				end

				arg_47_1.text_.text = var_50_3
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_7 = math.max(var_50_1, arg_47_1.talkMaxDuration)

			if var_50_0 <= arg_47_1.time_ and arg_47_1.time_ < var_50_0 + var_50_7 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_0) / var_50_7

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_0 + var_50_7 and arg_47_1.time_ < var_50_0 + var_50_7 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play410131013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 410131013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play410131014(arg_51_1)
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

				local var_54_2 = arg_51_1:GetWordFromCfg(410131013)
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
	Play410131014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 410131014
		arg_55_1.duration_ = 14.266

		local var_55_0 = {
			zh = 11.7,
			ja = 14.266
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
				arg_55_0:Play410131015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["10059"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos10059 = var_58_0.localPosition
				var_58_0.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("10059", 3)

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
				local var_58_6 = Vector3.New(0, -530, 35)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos10059, var_58_6, var_58_5)
			end

			if arg_55_1.time_ >= var_58_1 + var_58_4 and arg_55_1.time_ < var_58_1 + var_58_4 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0, -530, 35)
			end

			local var_58_7 = arg_55_1.actors_["10059"]
			local var_58_8 = 0

			if var_58_8 < arg_55_1.time_ and arg_55_1.time_ <= var_58_8 + arg_58_0 and arg_55_1.var_.actorSpriteComps10059 == nil then
				arg_55_1.var_.actorSpriteComps10059 = var_58_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_9 = 0.034

			if var_58_8 <= arg_55_1.time_ and arg_55_1.time_ < var_58_8 + var_58_9 then
				local var_58_10 = (arg_55_1.time_ - var_58_8) / var_58_9

				if arg_55_1.var_.actorSpriteComps10059 then
					for iter_58_1, iter_58_2 in pairs(arg_55_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_58_2 then
							local var_58_11 = Mathf.Lerp(iter_58_2.color.r, 1, var_58_10)

							iter_58_2.color = Color.New(var_58_11, var_58_11, var_58_11)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_8 + var_58_9 and arg_55_1.time_ < var_58_8 + var_58_9 + arg_58_0 and arg_55_1.var_.actorSpriteComps10059 then
				local var_58_12 = 1

				for iter_58_3, iter_58_4 in pairs(arg_55_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_58_4 then
						iter_58_4.color = Color.New(var_58_12, var_58_12, var_58_12)
					end
				end

				arg_55_1.var_.actorSpriteComps10059 = nil
			end

			local var_58_13 = 0
			local var_58_14 = 1.325

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_15 = arg_55_1:FormatText(StoryNameCfg[596].name)

				arg_55_1.leftNameTxt_.text = var_58_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_16 = arg_55_1:GetWordFromCfg(410131014)
				local var_58_17 = arg_55_1:FormatText(var_58_16.content)

				arg_55_1.text_.text = var_58_17

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_18 = 53
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

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131014", "story_v_out_410131.awb") ~= 0 then
					local var_58_21 = manager.audio:GetVoiceLength("story_v_out_410131", "410131014", "story_v_out_410131.awb") / 1000

					if var_58_21 + var_58_13 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_21 + var_58_13
					end

					if var_58_16.prefab_name ~= "" and arg_55_1.actors_[var_58_16.prefab_name] ~= nil then
						local var_58_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_16.prefab_name].transform, "story_v_out_410131", "410131014", "story_v_out_410131.awb")

						arg_55_1:RecordAudio("410131014", var_58_22)
						arg_55_1:RecordAudio("410131014", var_58_22)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_410131", "410131014", "story_v_out_410131.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_410131", "410131014", "story_v_out_410131.awb")
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
	Play410131015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 410131015
		arg_59_1.duration_ = 7.533

		local var_59_0 = {
			zh = 7.533,
			ja = 5.966
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
				arg_59_0:Play410131016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.65

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[596].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(410131015)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 26
				local var_62_6 = utf8.len(var_62_4)
				local var_62_7 = var_62_5 <= 0 and var_62_1 or var_62_1 * (var_62_6 / var_62_5)

				if var_62_7 > 0 and var_62_1 < var_62_7 then
					arg_59_1.talkMaxDuration = var_62_7

					if var_62_7 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_7 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_4
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131015", "story_v_out_410131.awb") ~= 0 then
					local var_62_8 = manager.audio:GetVoiceLength("story_v_out_410131", "410131015", "story_v_out_410131.awb") / 1000

					if var_62_8 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_0
					end

					if var_62_3.prefab_name ~= "" and arg_59_1.actors_[var_62_3.prefab_name] ~= nil then
						local var_62_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_3.prefab_name].transform, "story_v_out_410131", "410131015", "story_v_out_410131.awb")

						arg_59_1:RecordAudio("410131015", var_62_9)
						arg_59_1:RecordAudio("410131015", var_62_9)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_410131", "410131015", "story_v_out_410131.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_410131", "410131015", "story_v_out_410131.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_10 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_10 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_10

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_10 and arg_59_1.time_ < var_62_0 + var_62_10 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play410131016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 410131016
		arg_63_1.duration_ = 5.166

		local var_63_0 = {
			zh = 4,
			ja = 5.166
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
				arg_63_0:Play410131017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1060"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1060 = var_66_0.localPosition
				var_66_0.localScale = Vector3.New(1, 1, 1)

				arg_63_1:CheckSpriteTmpPos("1060", 4)

				local var_66_2 = var_66_0.childCount

				for iter_66_0 = 0, var_66_2 - 1 do
					local var_66_3 = var_66_0:GetChild(iter_66_0)

					if var_66_3.name == "split_3" or not string.find(var_66_3.name, "split") then
						var_66_3.gameObject:SetActive(true)
					else
						var_66_3.gameObject:SetActive(false)
					end
				end
			end

			local var_66_4 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_4 then
				local var_66_5 = (arg_63_1.time_ - var_66_1) / var_66_4
				local var_66_6 = Vector3.New(390, -435, -40)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1060, var_66_6, var_66_5)
			end

			if arg_63_1.time_ >= var_66_1 + var_66_4 and arg_63_1.time_ < var_66_1 + var_66_4 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(390, -435, -40)
			end

			local var_66_7 = arg_63_1.actors_["10059"].transform
			local var_66_8 = 0

			if var_66_8 < arg_63_1.time_ and arg_63_1.time_ <= var_66_8 + arg_66_0 then
				arg_63_1.var_.moveOldPos10059 = var_66_7.localPosition
				var_66_7.localScale = Vector3.New(1, 1, 1)

				arg_63_1:CheckSpriteTmpPos("10059", 2)

				local var_66_9 = var_66_7.childCount

				for iter_66_1 = 0, var_66_9 - 1 do
					local var_66_10 = var_66_7:GetChild(iter_66_1)

					if var_66_10.name == "" or not string.find(var_66_10.name, "split") then
						var_66_10.gameObject:SetActive(true)
					else
						var_66_10.gameObject:SetActive(false)
					end
				end
			end

			local var_66_11 = 0.001

			if var_66_8 <= arg_63_1.time_ and arg_63_1.time_ < var_66_8 + var_66_11 then
				local var_66_12 = (arg_63_1.time_ - var_66_8) / var_66_11
				local var_66_13 = Vector3.New(-390, -530, 35)

				var_66_7.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos10059, var_66_13, var_66_12)
			end

			if arg_63_1.time_ >= var_66_8 + var_66_11 and arg_63_1.time_ < var_66_8 + var_66_11 + arg_66_0 then
				var_66_7.localPosition = Vector3.New(-390, -530, 35)
			end

			local var_66_14 = arg_63_1.actors_["1060"]
			local var_66_15 = 0

			if var_66_15 < arg_63_1.time_ and arg_63_1.time_ <= var_66_15 + arg_66_0 and arg_63_1.var_.actorSpriteComps1060 == nil then
				arg_63_1.var_.actorSpriteComps1060 = var_66_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_16 = 0.034

			if var_66_15 <= arg_63_1.time_ and arg_63_1.time_ < var_66_15 + var_66_16 then
				local var_66_17 = (arg_63_1.time_ - var_66_15) / var_66_16

				if arg_63_1.var_.actorSpriteComps1060 then
					for iter_66_2, iter_66_3 in pairs(arg_63_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_66_3 then
							local var_66_18 = Mathf.Lerp(iter_66_3.color.r, 1, var_66_17)

							iter_66_3.color = Color.New(var_66_18, var_66_18, var_66_18)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_15 + var_66_16 and arg_63_1.time_ < var_66_15 + var_66_16 + arg_66_0 and arg_63_1.var_.actorSpriteComps1060 then
				local var_66_19 = 1

				for iter_66_4, iter_66_5 in pairs(arg_63_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_66_5 then
						iter_66_5.color = Color.New(var_66_19, var_66_19, var_66_19)
					end
				end

				arg_63_1.var_.actorSpriteComps1060 = nil
			end

			local var_66_20 = arg_63_1.actors_["10059"]
			local var_66_21 = 0

			if var_66_21 < arg_63_1.time_ and arg_63_1.time_ <= var_66_21 + arg_66_0 and arg_63_1.var_.actorSpriteComps10059 == nil then
				arg_63_1.var_.actorSpriteComps10059 = var_66_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_22 = 0.034

			if var_66_21 <= arg_63_1.time_ and arg_63_1.time_ < var_66_21 + var_66_22 then
				local var_66_23 = (arg_63_1.time_ - var_66_21) / var_66_22

				if arg_63_1.var_.actorSpriteComps10059 then
					for iter_66_6, iter_66_7 in pairs(arg_63_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_66_7 then
							local var_66_24 = Mathf.Lerp(iter_66_7.color.r, 0.5, var_66_23)

							iter_66_7.color = Color.New(var_66_24, var_66_24, var_66_24)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_21 + var_66_22 and arg_63_1.time_ < var_66_21 + var_66_22 + arg_66_0 and arg_63_1.var_.actorSpriteComps10059 then
				local var_66_25 = 0.5

				for iter_66_8, iter_66_9 in pairs(arg_63_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_66_9 then
						iter_66_9.color = Color.New(var_66_25, var_66_25, var_66_25)
					end
				end

				arg_63_1.var_.actorSpriteComps10059 = nil
			end

			local var_66_26 = 0
			local var_66_27 = 0.575

			if var_66_26 < arg_63_1.time_ and arg_63_1.time_ <= var_66_26 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_28 = arg_63_1:FormatText(StoryNameCfg[584].name)

				arg_63_1.leftNameTxt_.text = var_66_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_29 = arg_63_1:GetWordFromCfg(410131016)
				local var_66_30 = arg_63_1:FormatText(var_66_29.content)

				arg_63_1.text_.text = var_66_30

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_31 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131016", "story_v_out_410131.awb") ~= 0 then
					local var_66_34 = manager.audio:GetVoiceLength("story_v_out_410131", "410131016", "story_v_out_410131.awb") / 1000

					if var_66_34 + var_66_26 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_34 + var_66_26
					end

					if var_66_29.prefab_name ~= "" and arg_63_1.actors_[var_66_29.prefab_name] ~= nil then
						local var_66_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_29.prefab_name].transform, "story_v_out_410131", "410131016", "story_v_out_410131.awb")

						arg_63_1:RecordAudio("410131016", var_66_35)
						arg_63_1:RecordAudio("410131016", var_66_35)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_410131", "410131016", "story_v_out_410131.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_410131", "410131016", "story_v_out_410131.awb")
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
	Play410131017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 410131017
		arg_67_1.duration_ = 15.6

		local var_67_0 = {
			zh = 6.9,
			ja = 15.6
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
				arg_67_0:Play410131018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1060"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1060 = var_70_0.localPosition
				var_70_0.localScale = Vector3.New(1, 1, 1)

				arg_67_1:CheckSpriteTmpPos("1060", 4)

				local var_70_2 = var_70_0.childCount

				for iter_70_0 = 0, var_70_2 - 1 do
					local var_70_3 = var_70_0:GetChild(iter_70_0)

					if var_70_3.name == "split_3" or not string.find(var_70_3.name, "split") then
						var_70_3.gameObject:SetActive(true)
					else
						var_70_3.gameObject:SetActive(false)
					end
				end
			end

			local var_70_4 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_4 then
				local var_70_5 = (arg_67_1.time_ - var_70_1) / var_70_4
				local var_70_6 = Vector3.New(390, -435, -40)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1060, var_70_6, var_70_5)
			end

			if arg_67_1.time_ >= var_70_1 + var_70_4 and arg_67_1.time_ < var_70_1 + var_70_4 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(390, -435, -40)
			end

			local var_70_7 = 0
			local var_70_8 = 0.9

			if var_70_7 < arg_67_1.time_ and arg_67_1.time_ <= var_70_7 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_9 = arg_67_1:FormatText(StoryNameCfg[584].name)

				arg_67_1.leftNameTxt_.text = var_70_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_10 = arg_67_1:GetWordFromCfg(410131017)
				local var_70_11 = arg_67_1:FormatText(var_70_10.content)

				arg_67_1.text_.text = var_70_11

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_12 = 36
				local var_70_13 = utf8.len(var_70_11)
				local var_70_14 = var_70_12 <= 0 and var_70_8 or var_70_8 * (var_70_13 / var_70_12)

				if var_70_14 > 0 and var_70_8 < var_70_14 then
					arg_67_1.talkMaxDuration = var_70_14

					if var_70_14 + var_70_7 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_14 + var_70_7
					end
				end

				arg_67_1.text_.text = var_70_11
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131017", "story_v_out_410131.awb") ~= 0 then
					local var_70_15 = manager.audio:GetVoiceLength("story_v_out_410131", "410131017", "story_v_out_410131.awb") / 1000

					if var_70_15 + var_70_7 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_15 + var_70_7
					end

					if var_70_10.prefab_name ~= "" and arg_67_1.actors_[var_70_10.prefab_name] ~= nil then
						local var_70_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_10.prefab_name].transform, "story_v_out_410131", "410131017", "story_v_out_410131.awb")

						arg_67_1:RecordAudio("410131017", var_70_16)
						arg_67_1:RecordAudio("410131017", var_70_16)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_410131", "410131017", "story_v_out_410131.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_410131", "410131017", "story_v_out_410131.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_17 = math.max(var_70_8, arg_67_1.talkMaxDuration)

			if var_70_7 <= arg_67_1.time_ and arg_67_1.time_ < var_70_7 + var_70_17 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_7) / var_70_17

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_7 + var_70_17 and arg_67_1.time_ < var_70_7 + var_70_17 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play410131018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 410131018
		arg_71_1.duration_ = 11.6

		local var_71_0 = {
			zh = 7.4,
			ja = 11.6
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
				arg_71_0:Play410131019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1060"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1060 = var_74_0.localPosition
				var_74_0.localScale = Vector3.New(1, 1, 1)

				arg_71_1:CheckSpriteTmpPos("1060", 4)

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
				local var_74_6 = Vector3.New(390, -435, -40)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1060, var_74_6, var_74_5)
			end

			if arg_71_1.time_ >= var_74_1 + var_74_4 and arg_71_1.time_ < var_74_1 + var_74_4 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(390, -435, -40)
			end

			local var_74_7 = arg_71_1.actors_["10059"].transform
			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 then
				arg_71_1.var_.moveOldPos10059 = var_74_7.localPosition
				var_74_7.localScale = Vector3.New(1, 1, 1)

				arg_71_1:CheckSpriteTmpPos("10059", 2)

				local var_74_9 = var_74_7.childCount

				for iter_74_1 = 0, var_74_9 - 1 do
					local var_74_10 = var_74_7:GetChild(iter_74_1)

					if var_74_10.name == "split_3" or not string.find(var_74_10.name, "split") then
						var_74_10.gameObject:SetActive(true)
					else
						var_74_10.gameObject:SetActive(false)
					end
				end
			end

			local var_74_11 = 0.001

			if var_74_8 <= arg_71_1.time_ and arg_71_1.time_ < var_74_8 + var_74_11 then
				local var_74_12 = (arg_71_1.time_ - var_74_8) / var_74_11
				local var_74_13 = Vector3.New(-390, -530, 35)

				var_74_7.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos10059, var_74_13, var_74_12)
			end

			if arg_71_1.time_ >= var_74_8 + var_74_11 and arg_71_1.time_ < var_74_8 + var_74_11 + arg_74_0 then
				var_74_7.localPosition = Vector3.New(-390, -530, 35)
			end

			local var_74_14 = arg_71_1.actors_["1060"]
			local var_74_15 = 0

			if var_74_15 < arg_71_1.time_ and arg_71_1.time_ <= var_74_15 + arg_74_0 and arg_71_1.var_.actorSpriteComps1060 == nil then
				arg_71_1.var_.actorSpriteComps1060 = var_74_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_16 = 0.034

			if var_74_15 <= arg_71_1.time_ and arg_71_1.time_ < var_74_15 + var_74_16 then
				local var_74_17 = (arg_71_1.time_ - var_74_15) / var_74_16

				if arg_71_1.var_.actorSpriteComps1060 then
					for iter_74_2, iter_74_3 in pairs(arg_71_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_74_3 then
							local var_74_18 = Mathf.Lerp(iter_74_3.color.r, 0.5, var_74_17)

							iter_74_3.color = Color.New(var_74_18, var_74_18, var_74_18)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_15 + var_74_16 and arg_71_1.time_ < var_74_15 + var_74_16 + arg_74_0 and arg_71_1.var_.actorSpriteComps1060 then
				local var_74_19 = 0.5

				for iter_74_4, iter_74_5 in pairs(arg_71_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_74_5 then
						iter_74_5.color = Color.New(var_74_19, var_74_19, var_74_19)
					end
				end

				arg_71_1.var_.actorSpriteComps1060 = nil
			end

			local var_74_20 = arg_71_1.actors_["10059"]
			local var_74_21 = 0

			if var_74_21 < arg_71_1.time_ and arg_71_1.time_ <= var_74_21 + arg_74_0 and arg_71_1.var_.actorSpriteComps10059 == nil then
				arg_71_1.var_.actorSpriteComps10059 = var_74_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_22 = 0.034

			if var_74_21 <= arg_71_1.time_ and arg_71_1.time_ < var_74_21 + var_74_22 then
				local var_74_23 = (arg_71_1.time_ - var_74_21) / var_74_22

				if arg_71_1.var_.actorSpriteComps10059 then
					for iter_74_6, iter_74_7 in pairs(arg_71_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_74_7 then
							local var_74_24 = Mathf.Lerp(iter_74_7.color.r, 1, var_74_23)

							iter_74_7.color = Color.New(var_74_24, var_74_24, var_74_24)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_21 + var_74_22 and arg_71_1.time_ < var_74_21 + var_74_22 + arg_74_0 and arg_71_1.var_.actorSpriteComps10059 then
				local var_74_25 = 1

				for iter_74_8, iter_74_9 in pairs(arg_71_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_74_9 then
						iter_74_9.color = Color.New(var_74_25, var_74_25, var_74_25)
					end
				end

				arg_71_1.var_.actorSpriteComps10059 = nil
			end

			local var_74_26 = 0
			local var_74_27 = 0.825

			if var_74_26 < arg_71_1.time_ and arg_71_1.time_ <= var_74_26 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_28 = arg_71_1:FormatText(StoryNameCfg[596].name)

				arg_71_1.leftNameTxt_.text = var_74_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_29 = arg_71_1:GetWordFromCfg(410131018)
				local var_74_30 = arg_71_1:FormatText(var_74_29.content)

				arg_71_1.text_.text = var_74_30

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_31 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131018", "story_v_out_410131.awb") ~= 0 then
					local var_74_34 = manager.audio:GetVoiceLength("story_v_out_410131", "410131018", "story_v_out_410131.awb") / 1000

					if var_74_34 + var_74_26 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_34 + var_74_26
					end

					if var_74_29.prefab_name ~= "" and arg_71_1.actors_[var_74_29.prefab_name] ~= nil then
						local var_74_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_29.prefab_name].transform, "story_v_out_410131", "410131018", "story_v_out_410131.awb")

						arg_71_1:RecordAudio("410131018", var_74_35)
						arg_71_1:RecordAudio("410131018", var_74_35)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_410131", "410131018", "story_v_out_410131.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_410131", "410131018", "story_v_out_410131.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_36 = math.max(var_74_27, arg_71_1.talkMaxDuration)

			if var_74_26 <= arg_71_1.time_ and arg_71_1.time_ < var_74_26 + var_74_36 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_26) / var_74_36

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_26 + var_74_36 and arg_71_1.time_ < var_74_26 + var_74_36 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play410131019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 410131019
		arg_75_1.duration_ = 8

		local var_75_0 = {
			zh = 6.166,
			ja = 8
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
				arg_75_0:Play410131020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 0.575

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_2 = arg_75_1:FormatText(StoryNameCfg[596].name)

				arg_75_1.leftNameTxt_.text = var_78_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_3 = arg_75_1:GetWordFromCfg(410131019)
				local var_78_4 = arg_75_1:FormatText(var_78_3.content)

				arg_75_1.text_.text = var_78_4

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131019", "story_v_out_410131.awb") ~= 0 then
					local var_78_8 = manager.audio:GetVoiceLength("story_v_out_410131", "410131019", "story_v_out_410131.awb") / 1000

					if var_78_8 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_8 + var_78_0
					end

					if var_78_3.prefab_name ~= "" and arg_75_1.actors_[var_78_3.prefab_name] ~= nil then
						local var_78_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_3.prefab_name].transform, "story_v_out_410131", "410131019", "story_v_out_410131.awb")

						arg_75_1:RecordAudio("410131019", var_78_9)
						arg_75_1:RecordAudio("410131019", var_78_9)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_410131", "410131019", "story_v_out_410131.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_410131", "410131019", "story_v_out_410131.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_10 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_10 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_10

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_10 and arg_75_1.time_ < var_78_0 + var_78_10 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play410131020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 410131020
		arg_79_1.duration_ = 5.866

		local var_79_0 = {
			zh = 5.566,
			ja = 5.866
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
				arg_79_0:Play410131021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 0.675

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_2 = arg_79_1:FormatText(StoryNameCfg[596].name)

				arg_79_1.leftNameTxt_.text = var_82_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_3 = arg_79_1:GetWordFromCfg(410131020)
				local var_82_4 = arg_79_1:FormatText(var_82_3.content)

				arg_79_1.text_.text = var_82_4

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_5 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131020", "story_v_out_410131.awb") ~= 0 then
					local var_82_8 = manager.audio:GetVoiceLength("story_v_out_410131", "410131020", "story_v_out_410131.awb") / 1000

					if var_82_8 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_8 + var_82_0
					end

					if var_82_3.prefab_name ~= "" and arg_79_1.actors_[var_82_3.prefab_name] ~= nil then
						local var_82_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_3.prefab_name].transform, "story_v_out_410131", "410131020", "story_v_out_410131.awb")

						arg_79_1:RecordAudio("410131020", var_82_9)
						arg_79_1:RecordAudio("410131020", var_82_9)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_410131", "410131020", "story_v_out_410131.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_410131", "410131020", "story_v_out_410131.awb")
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
	Play410131021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 410131021
		arg_83_1.duration_ = 8.766

		local var_83_0 = {
			zh = 3.033,
			ja = 8.766
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
				arg_83_0:Play410131022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["10059"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.actorSpriteComps10059 == nil then
				arg_83_1.var_.actorSpriteComps10059 = var_86_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_2 = 0.034

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.actorSpriteComps10059 then
					for iter_86_0, iter_86_1 in pairs(arg_83_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_86_1 then
							local var_86_4 = Mathf.Lerp(iter_86_1.color.r, 0.5, var_86_3)

							iter_86_1.color = Color.New(var_86_4, var_86_4, var_86_4)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.actorSpriteComps10059 then
				local var_86_5 = 0.5

				for iter_86_2, iter_86_3 in pairs(arg_83_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_86_3 then
						iter_86_3.color = Color.New(var_86_5, var_86_5, var_86_5)
					end
				end

				arg_83_1.var_.actorSpriteComps10059 = nil
			end

			local var_86_6 = 0
			local var_86_7 = 0.4

			if var_86_6 < arg_83_1.time_ and arg_83_1.time_ <= var_86_6 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_8 = arg_83_1:FormatText(StoryNameCfg[36].name)

				arg_83_1.leftNameTxt_.text = var_86_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_9 = arg_83_1:GetWordFromCfg(410131021)
				local var_86_10 = arg_83_1:FormatText(var_86_9.content)

				arg_83_1.text_.text = var_86_10

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_11 = 16
				local var_86_12 = utf8.len(var_86_10)
				local var_86_13 = var_86_11 <= 0 and var_86_7 or var_86_7 * (var_86_12 / var_86_11)

				if var_86_13 > 0 and var_86_7 < var_86_13 then
					arg_83_1.talkMaxDuration = var_86_13

					if var_86_13 + var_86_6 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_13 + var_86_6
					end
				end

				arg_83_1.text_.text = var_86_10
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131021", "story_v_out_410131.awb") ~= 0 then
					local var_86_14 = manager.audio:GetVoiceLength("story_v_out_410131", "410131021", "story_v_out_410131.awb") / 1000

					if var_86_14 + var_86_6 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_14 + var_86_6
					end

					if var_86_9.prefab_name ~= "" and arg_83_1.actors_[var_86_9.prefab_name] ~= nil then
						local var_86_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_9.prefab_name].transform, "story_v_out_410131", "410131021", "story_v_out_410131.awb")

						arg_83_1:RecordAudio("410131021", var_86_15)
						arg_83_1:RecordAudio("410131021", var_86_15)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_410131", "410131021", "story_v_out_410131.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_410131", "410131021", "story_v_out_410131.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_16 = math.max(var_86_7, arg_83_1.talkMaxDuration)

			if var_86_6 <= arg_83_1.time_ and arg_83_1.time_ < var_86_6 + var_86_16 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_6) / var_86_16

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_6 + var_86_16 and arg_83_1.time_ < var_86_6 + var_86_16 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play410131022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 410131022
		arg_87_1.duration_ = 3.133

		local var_87_0 = {
			zh = 1.466,
			ja = 3.133
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
				arg_87_0:Play410131023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["10059"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.actorSpriteComps10059 == nil then
				arg_87_1.var_.actorSpriteComps10059 = var_90_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_2 = 0.034

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.actorSpriteComps10059 then
					for iter_90_0, iter_90_1 in pairs(arg_87_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_90_1 then
							local var_90_4 = Mathf.Lerp(iter_90_1.color.r, 1, var_90_3)

							iter_90_1.color = Color.New(var_90_4, var_90_4, var_90_4)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.actorSpriteComps10059 then
				local var_90_5 = 1

				for iter_90_2, iter_90_3 in pairs(arg_87_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_90_3 then
						iter_90_3.color = Color.New(var_90_5, var_90_5, var_90_5)
					end
				end

				arg_87_1.var_.actorSpriteComps10059 = nil
			end

			local var_90_6 = 0
			local var_90_7 = 0.15

			if var_90_6 < arg_87_1.time_ and arg_87_1.time_ <= var_90_6 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_8 = arg_87_1:FormatText(StoryNameCfg[596].name)

				arg_87_1.leftNameTxt_.text = var_90_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_9 = arg_87_1:GetWordFromCfg(410131022)
				local var_90_10 = arg_87_1:FormatText(var_90_9.content)

				arg_87_1.text_.text = var_90_10

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_11 = 6
				local var_90_12 = utf8.len(var_90_10)
				local var_90_13 = var_90_11 <= 0 and var_90_7 or var_90_7 * (var_90_12 / var_90_11)

				if var_90_13 > 0 and var_90_7 < var_90_13 then
					arg_87_1.talkMaxDuration = var_90_13

					if var_90_13 + var_90_6 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_13 + var_90_6
					end
				end

				arg_87_1.text_.text = var_90_10
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131022", "story_v_out_410131.awb") ~= 0 then
					local var_90_14 = manager.audio:GetVoiceLength("story_v_out_410131", "410131022", "story_v_out_410131.awb") / 1000

					if var_90_14 + var_90_6 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_14 + var_90_6
					end

					if var_90_9.prefab_name ~= "" and arg_87_1.actors_[var_90_9.prefab_name] ~= nil then
						local var_90_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_9.prefab_name].transform, "story_v_out_410131", "410131022", "story_v_out_410131.awb")

						arg_87_1:RecordAudio("410131022", var_90_15)
						arg_87_1:RecordAudio("410131022", var_90_15)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_410131", "410131022", "story_v_out_410131.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_410131", "410131022", "story_v_out_410131.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_16 = math.max(var_90_7, arg_87_1.talkMaxDuration)

			if var_90_6 <= arg_87_1.time_ and arg_87_1.time_ < var_90_6 + var_90_16 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_6) / var_90_16

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_6 + var_90_16 and arg_87_1.time_ < var_90_6 + var_90_16 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play410131023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 410131023
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play410131024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["10059"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.actorSpriteComps10059 == nil then
				arg_91_1.var_.actorSpriteComps10059 = var_94_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_2 = 0.034

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.actorSpriteComps10059 then
					for iter_94_0, iter_94_1 in pairs(arg_91_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_94_1 then
							local var_94_4 = Mathf.Lerp(iter_94_1.color.r, 0.5, var_94_3)

							iter_94_1.color = Color.New(var_94_4, var_94_4, var_94_4)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.actorSpriteComps10059 then
				local var_94_5 = 0.5

				for iter_94_2, iter_94_3 in pairs(arg_91_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_94_3 then
						iter_94_3.color = Color.New(var_94_5, var_94_5, var_94_5)
					end
				end

				arg_91_1.var_.actorSpriteComps10059 = nil
			end

			local var_94_6 = arg_91_1.actors_["1060"].transform
			local var_94_7 = 0

			if var_94_7 < arg_91_1.time_ and arg_91_1.time_ <= var_94_7 + arg_94_0 then
				arg_91_1.var_.moveOldPos1060 = var_94_6.localPosition
				var_94_6.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("1060", 7)

				local var_94_8 = var_94_6.childCount

				for iter_94_4 = 0, var_94_8 - 1 do
					local var_94_9 = var_94_6:GetChild(iter_94_4)

					if var_94_9.name == "" or not string.find(var_94_9.name, "split") then
						var_94_9.gameObject:SetActive(true)
					else
						var_94_9.gameObject:SetActive(false)
					end
				end
			end

			local var_94_10 = 0.001

			if var_94_7 <= arg_91_1.time_ and arg_91_1.time_ < var_94_7 + var_94_10 then
				local var_94_11 = (arg_91_1.time_ - var_94_7) / var_94_10
				local var_94_12 = Vector3.New(0, -2000, -40)

				var_94_6.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1060, var_94_12, var_94_11)
			end

			if arg_91_1.time_ >= var_94_7 + var_94_10 and arg_91_1.time_ < var_94_7 + var_94_10 + arg_94_0 then
				var_94_6.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_94_13 = arg_91_1.actors_["10059"].transform
			local var_94_14 = 0

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 then
				arg_91_1.var_.moveOldPos10059 = var_94_13.localPosition
				var_94_13.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("10059", 7)

				local var_94_15 = var_94_13.childCount

				for iter_94_5 = 0, var_94_15 - 1 do
					local var_94_16 = var_94_13:GetChild(iter_94_5)

					if var_94_16.name == "" or not string.find(var_94_16.name, "split") then
						var_94_16.gameObject:SetActive(true)
					else
						var_94_16.gameObject:SetActive(false)
					end
				end
			end

			local var_94_17 = 0.001

			if var_94_14 <= arg_91_1.time_ and arg_91_1.time_ < var_94_14 + var_94_17 then
				local var_94_18 = (arg_91_1.time_ - var_94_14) / var_94_17
				local var_94_19 = Vector3.New(0, -2000, 35)

				var_94_13.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos10059, var_94_19, var_94_18)
			end

			if arg_91_1.time_ >= var_94_14 + var_94_17 and arg_91_1.time_ < var_94_14 + var_94_17 + arg_94_0 then
				var_94_13.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_94_20 = 0
			local var_94_21 = 1.35

			if var_94_20 < arg_91_1.time_ and arg_91_1.time_ <= var_94_20 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, false)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_22 = arg_91_1:GetWordFromCfg(410131023)
				local var_94_23 = arg_91_1:FormatText(var_94_22.content)

				arg_91_1.text_.text = var_94_23

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_24 = 54
				local var_94_25 = utf8.len(var_94_23)
				local var_94_26 = var_94_24 <= 0 and var_94_21 or var_94_21 * (var_94_25 / var_94_24)

				if var_94_26 > 0 and var_94_21 < var_94_26 then
					arg_91_1.talkMaxDuration = var_94_26

					if var_94_26 + var_94_20 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_26 + var_94_20
					end
				end

				arg_91_1.text_.text = var_94_23
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_27 = math.max(var_94_21, arg_91_1.talkMaxDuration)

			if var_94_20 <= arg_91_1.time_ and arg_91_1.time_ < var_94_20 + var_94_27 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_20) / var_94_27

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_20 + var_94_27 and arg_91_1.time_ < var_94_20 + var_94_27 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play410131024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 410131024
		arg_95_1.duration_ = 2.533

		local var_95_0 = {
			zh = 1.3,
			ja = 2.533
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
				arg_95_0:Play410131025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1060"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.actorSpriteComps1060 == nil then
				arg_95_1.var_.actorSpriteComps1060 = var_98_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_2 = 0.034

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.actorSpriteComps1060 then
					for iter_98_0, iter_98_1 in pairs(arg_95_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_98_1 then
							local var_98_4 = Mathf.Lerp(iter_98_1.color.r, 1, var_98_3)

							iter_98_1.color = Color.New(var_98_4, var_98_4, var_98_4)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.actorSpriteComps1060 then
				local var_98_5 = 1

				for iter_98_2, iter_98_3 in pairs(arg_95_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_98_3 then
						iter_98_3.color = Color.New(var_98_5, var_98_5, var_98_5)
					end
				end

				arg_95_1.var_.actorSpriteComps1060 = nil
			end

			local var_98_6 = arg_95_1.actors_["1060"].transform
			local var_98_7 = 0

			if var_98_7 < arg_95_1.time_ and arg_95_1.time_ <= var_98_7 + arg_98_0 then
				arg_95_1.var_.moveOldPos1060 = var_98_6.localPosition
				var_98_6.localScale = Vector3.New(1, 1, 1)

				arg_95_1:CheckSpriteTmpPos("1060", 3)

				local var_98_8 = var_98_6.childCount

				for iter_98_4 = 0, var_98_8 - 1 do
					local var_98_9 = var_98_6:GetChild(iter_98_4)

					if var_98_9.name == "" or not string.find(var_98_9.name, "split") then
						var_98_9.gameObject:SetActive(true)
					else
						var_98_9.gameObject:SetActive(false)
					end
				end
			end

			local var_98_10 = 0.001

			if var_98_7 <= arg_95_1.time_ and arg_95_1.time_ < var_98_7 + var_98_10 then
				local var_98_11 = (arg_95_1.time_ - var_98_7) / var_98_10
				local var_98_12 = Vector3.New(0, -435, -40)

				var_98_6.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1060, var_98_12, var_98_11)
			end

			if arg_95_1.time_ >= var_98_7 + var_98_10 and arg_95_1.time_ < var_98_7 + var_98_10 + arg_98_0 then
				var_98_6.localPosition = Vector3.New(0, -435, -40)
			end

			local var_98_13 = 0
			local var_98_14 = 0.15

			if var_98_13 < arg_95_1.time_ and arg_95_1.time_ <= var_98_13 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_15 = arg_95_1:FormatText(StoryNameCfg[584].name)

				arg_95_1.leftNameTxt_.text = var_98_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_16 = arg_95_1:GetWordFromCfg(410131024)
				local var_98_17 = arg_95_1:FormatText(var_98_16.content)

				arg_95_1.text_.text = var_98_17

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_18 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131024", "story_v_out_410131.awb") ~= 0 then
					local var_98_21 = manager.audio:GetVoiceLength("story_v_out_410131", "410131024", "story_v_out_410131.awb") / 1000

					if var_98_21 + var_98_13 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_21 + var_98_13
					end

					if var_98_16.prefab_name ~= "" and arg_95_1.actors_[var_98_16.prefab_name] ~= nil then
						local var_98_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_16.prefab_name].transform, "story_v_out_410131", "410131024", "story_v_out_410131.awb")

						arg_95_1:RecordAudio("410131024", var_98_22)
						arg_95_1:RecordAudio("410131024", var_98_22)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_410131", "410131024", "story_v_out_410131.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_410131", "410131024", "story_v_out_410131.awb")
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
	Play410131025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 410131025
		arg_99_1.duration_ = 8.366

		local var_99_0 = {
			zh = 5.233,
			ja = 8.366
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
				arg_99_0:Play410131026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = "1012"

			if arg_99_1.actors_[var_102_0] == nil then
				local var_102_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_102_0), arg_99_1.canvasGo_.transform)

				var_102_1.transform:SetSiblingIndex(1)

				var_102_1.name = var_102_0
				var_102_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_99_1.actors_[var_102_0] = var_102_1
			end

			local var_102_2 = arg_99_1.actors_["1012"].transform
			local var_102_3 = 0

			if var_102_3 < arg_99_1.time_ and arg_99_1.time_ <= var_102_3 + arg_102_0 then
				arg_99_1.var_.moveOldPos1012 = var_102_2.localPosition
				var_102_2.localScale = Vector3.New(1, 1, 1)

				arg_99_1:CheckSpriteTmpPos("1012", 2)

				local var_102_4 = var_102_2.childCount

				for iter_102_0 = 0, var_102_4 - 1 do
					local var_102_5 = var_102_2:GetChild(iter_102_0)

					if var_102_5.name == "split_2" or not string.find(var_102_5.name, "split") then
						var_102_5.gameObject:SetActive(true)
					else
						var_102_5.gameObject:SetActive(false)
					end
				end
			end

			local var_102_6 = 0.001

			if var_102_3 <= arg_99_1.time_ and arg_99_1.time_ < var_102_3 + var_102_6 then
				local var_102_7 = (arg_99_1.time_ - var_102_3) / var_102_6
				local var_102_8 = Vector3.New(-390, -465, 300)

				var_102_2.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1012, var_102_8, var_102_7)
			end

			if arg_99_1.time_ >= var_102_3 + var_102_6 and arg_99_1.time_ < var_102_3 + var_102_6 + arg_102_0 then
				var_102_2.localPosition = Vector3.New(-390, -465, 300)
			end

			local var_102_9 = arg_99_1.actors_["1012"]
			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 and arg_99_1.var_.actorSpriteComps1012 == nil then
				arg_99_1.var_.actorSpriteComps1012 = var_102_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_11 = 0.034

			if var_102_10 <= arg_99_1.time_ and arg_99_1.time_ < var_102_10 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_10) / var_102_11

				if arg_99_1.var_.actorSpriteComps1012 then
					for iter_102_1, iter_102_2 in pairs(arg_99_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_102_2 then
							local var_102_13 = Mathf.Lerp(iter_102_2.color.r, 1, var_102_12)

							iter_102_2.color = Color.New(var_102_13, var_102_13, var_102_13)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_10 + var_102_11 and arg_99_1.time_ < var_102_10 + var_102_11 + arg_102_0 and arg_99_1.var_.actorSpriteComps1012 then
				local var_102_14 = 1

				for iter_102_3, iter_102_4 in pairs(arg_99_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_102_4 then
						iter_102_4.color = Color.New(var_102_14, var_102_14, var_102_14)
					end
				end

				arg_99_1.var_.actorSpriteComps1012 = nil
			end

			local var_102_15 = arg_99_1.actors_["1060"]
			local var_102_16 = 0

			if var_102_16 < arg_99_1.time_ and arg_99_1.time_ <= var_102_16 + arg_102_0 and arg_99_1.var_.actorSpriteComps1060 == nil then
				arg_99_1.var_.actorSpriteComps1060 = var_102_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_17 = 0.034

			if var_102_16 <= arg_99_1.time_ and arg_99_1.time_ < var_102_16 + var_102_17 then
				local var_102_18 = (arg_99_1.time_ - var_102_16) / var_102_17

				if arg_99_1.var_.actorSpriteComps1060 then
					for iter_102_5, iter_102_6 in pairs(arg_99_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_102_6 then
							local var_102_19 = Mathf.Lerp(iter_102_6.color.r, 0.5, var_102_18)

							iter_102_6.color = Color.New(var_102_19, var_102_19, var_102_19)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_16 + var_102_17 and arg_99_1.time_ < var_102_16 + var_102_17 + arg_102_0 and arg_99_1.var_.actorSpriteComps1060 then
				local var_102_20 = 0.5

				for iter_102_7, iter_102_8 in pairs(arg_99_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_102_8 then
						iter_102_8.color = Color.New(var_102_20, var_102_20, var_102_20)
					end
				end

				arg_99_1.var_.actorSpriteComps1060 = nil
			end

			local var_102_21 = arg_99_1.actors_["1060"].transform
			local var_102_22 = 0

			if var_102_22 < arg_99_1.time_ and arg_99_1.time_ <= var_102_22 + arg_102_0 then
				arg_99_1.var_.moveOldPos1060 = var_102_21.localPosition
				var_102_21.localScale = Vector3.New(1, 1, 1)

				arg_99_1:CheckSpriteTmpPos("1060", 4)

				local var_102_23 = var_102_21.childCount

				for iter_102_9 = 0, var_102_23 - 1 do
					local var_102_24 = var_102_21:GetChild(iter_102_9)

					if var_102_24.name == "split_1" or not string.find(var_102_24.name, "split") then
						var_102_24.gameObject:SetActive(true)
					else
						var_102_24.gameObject:SetActive(false)
					end
				end
			end

			local var_102_25 = 0.001

			if var_102_22 <= arg_99_1.time_ and arg_99_1.time_ < var_102_22 + var_102_25 then
				local var_102_26 = (arg_99_1.time_ - var_102_22) / var_102_25
				local var_102_27 = Vector3.New(390, -435, -40)

				var_102_21.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1060, var_102_27, var_102_26)
			end

			if arg_99_1.time_ >= var_102_22 + var_102_25 and arg_99_1.time_ < var_102_22 + var_102_25 + arg_102_0 then
				var_102_21.localPosition = Vector3.New(390, -435, -40)
			end

			local var_102_28 = 0
			local var_102_29 = 0.725

			if var_102_28 < arg_99_1.time_ and arg_99_1.time_ <= var_102_28 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_30 = arg_99_1:FormatText(StoryNameCfg[595].name)

				arg_99_1.leftNameTxt_.text = var_102_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_31 = arg_99_1:GetWordFromCfg(410131025)
				local var_102_32 = arg_99_1:FormatText(var_102_31.content)

				arg_99_1.text_.text = var_102_32

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_33 = 29
				local var_102_34 = utf8.len(var_102_32)
				local var_102_35 = var_102_33 <= 0 and var_102_29 or var_102_29 * (var_102_34 / var_102_33)

				if var_102_35 > 0 and var_102_29 < var_102_35 then
					arg_99_1.talkMaxDuration = var_102_35

					if var_102_35 + var_102_28 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_35 + var_102_28
					end
				end

				arg_99_1.text_.text = var_102_32
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131025", "story_v_out_410131.awb") ~= 0 then
					local var_102_36 = manager.audio:GetVoiceLength("story_v_out_410131", "410131025", "story_v_out_410131.awb") / 1000

					if var_102_36 + var_102_28 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_36 + var_102_28
					end

					if var_102_31.prefab_name ~= "" and arg_99_1.actors_[var_102_31.prefab_name] ~= nil then
						local var_102_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_31.prefab_name].transform, "story_v_out_410131", "410131025", "story_v_out_410131.awb")

						arg_99_1:RecordAudio("410131025", var_102_37)
						arg_99_1:RecordAudio("410131025", var_102_37)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_410131", "410131025", "story_v_out_410131.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_410131", "410131025", "story_v_out_410131.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_38 = math.max(var_102_29, arg_99_1.talkMaxDuration)

			if var_102_28 <= arg_99_1.time_ and arg_99_1.time_ < var_102_28 + var_102_38 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_28) / var_102_38

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_28 + var_102_38 and arg_99_1.time_ < var_102_28 + var_102_38 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play410131026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 410131026
		arg_103_1.duration_ = 2.733

		local var_103_0 = {
			zh = 1.1,
			ja = 2.733
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
				arg_103_0:Play410131027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 0.1

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_2 = arg_103_1:FormatText(StoryNameCfg[595].name)

				arg_103_1.leftNameTxt_.text = var_106_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_3 = arg_103_1:GetWordFromCfg(410131026)
				local var_106_4 = arg_103_1:FormatText(var_106_3.content)

				arg_103_1.text_.text = var_106_4

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_5 = 4
				local var_106_6 = utf8.len(var_106_4)
				local var_106_7 = var_106_5 <= 0 and var_106_1 or var_106_1 * (var_106_6 / var_106_5)

				if var_106_7 > 0 and var_106_1 < var_106_7 then
					arg_103_1.talkMaxDuration = var_106_7

					if var_106_7 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_7 + var_106_0
					end
				end

				arg_103_1.text_.text = var_106_4
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131026", "story_v_out_410131.awb") ~= 0 then
					local var_106_8 = manager.audio:GetVoiceLength("story_v_out_410131", "410131026", "story_v_out_410131.awb") / 1000

					if var_106_8 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_0
					end

					if var_106_3.prefab_name ~= "" and arg_103_1.actors_[var_106_3.prefab_name] ~= nil then
						local var_106_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_3.prefab_name].transform, "story_v_out_410131", "410131026", "story_v_out_410131.awb")

						arg_103_1:RecordAudio("410131026", var_106_9)
						arg_103_1:RecordAudio("410131026", var_106_9)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_410131", "410131026", "story_v_out_410131.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_410131", "410131026", "story_v_out_410131.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_10 = math.max(var_106_1, arg_103_1.talkMaxDuration)

			if var_106_0 <= arg_103_1.time_ and arg_103_1.time_ < var_106_0 + var_106_10 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_0) / var_106_10

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_0 + var_106_10 and arg_103_1.time_ < var_106_0 + var_106_10 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play410131027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 410131027
		arg_107_1.duration_ = 6.866

		local var_107_0 = {
			zh = 5,
			ja = 6.866
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
				arg_107_0:Play410131028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1060"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos1060 = var_110_0.localPosition
				var_110_0.localScale = Vector3.New(1, 1, 1)

				arg_107_1:CheckSpriteTmpPos("1060", 4)

				local var_110_2 = var_110_0.childCount

				for iter_110_0 = 0, var_110_2 - 1 do
					local var_110_3 = var_110_0:GetChild(iter_110_0)

					if var_110_3.name == "split_4" or not string.find(var_110_3.name, "split") then
						var_110_3.gameObject:SetActive(true)
					else
						var_110_3.gameObject:SetActive(false)
					end
				end
			end

			local var_110_4 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_4 then
				local var_110_5 = (arg_107_1.time_ - var_110_1) / var_110_4
				local var_110_6 = Vector3.New(390, -435, -40)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1060, var_110_6, var_110_5)
			end

			if arg_107_1.time_ >= var_110_1 + var_110_4 and arg_107_1.time_ < var_110_1 + var_110_4 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(390, -435, -40)
			end

			local var_110_7 = arg_107_1.actors_["1060"]
			local var_110_8 = 0

			if var_110_8 < arg_107_1.time_ and arg_107_1.time_ <= var_110_8 + arg_110_0 and arg_107_1.var_.actorSpriteComps1060 == nil then
				arg_107_1.var_.actorSpriteComps1060 = var_110_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_9 = 0.034

			if var_110_8 <= arg_107_1.time_ and arg_107_1.time_ < var_110_8 + var_110_9 then
				local var_110_10 = (arg_107_1.time_ - var_110_8) / var_110_9

				if arg_107_1.var_.actorSpriteComps1060 then
					for iter_110_1, iter_110_2 in pairs(arg_107_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_110_2 then
							local var_110_11 = Mathf.Lerp(iter_110_2.color.r, 1, var_110_10)

							iter_110_2.color = Color.New(var_110_11, var_110_11, var_110_11)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_8 + var_110_9 and arg_107_1.time_ < var_110_8 + var_110_9 + arg_110_0 and arg_107_1.var_.actorSpriteComps1060 then
				local var_110_12 = 1

				for iter_110_3, iter_110_4 in pairs(arg_107_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_110_4 then
						iter_110_4.color = Color.New(var_110_12, var_110_12, var_110_12)
					end
				end

				arg_107_1.var_.actorSpriteComps1060 = nil
			end

			local var_110_13 = arg_107_1.actors_["1012"]
			local var_110_14 = 0

			if var_110_14 < arg_107_1.time_ and arg_107_1.time_ <= var_110_14 + arg_110_0 and arg_107_1.var_.actorSpriteComps1012 == nil then
				arg_107_1.var_.actorSpriteComps1012 = var_110_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_15 = 0.034

			if var_110_14 <= arg_107_1.time_ and arg_107_1.time_ < var_110_14 + var_110_15 then
				local var_110_16 = (arg_107_1.time_ - var_110_14) / var_110_15

				if arg_107_1.var_.actorSpriteComps1012 then
					for iter_110_5, iter_110_6 in pairs(arg_107_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_110_6 then
							local var_110_17 = Mathf.Lerp(iter_110_6.color.r, 0.5, var_110_16)

							iter_110_6.color = Color.New(var_110_17, var_110_17, var_110_17)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_14 + var_110_15 and arg_107_1.time_ < var_110_14 + var_110_15 + arg_110_0 and arg_107_1.var_.actorSpriteComps1012 then
				local var_110_18 = 0.5

				for iter_110_7, iter_110_8 in pairs(arg_107_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_110_8 then
						iter_110_8.color = Color.New(var_110_18, var_110_18, var_110_18)
					end
				end

				arg_107_1.var_.actorSpriteComps1012 = nil
			end

			local var_110_19 = 0
			local var_110_20 = 0.625

			if var_110_19 < arg_107_1.time_ and arg_107_1.time_ <= var_110_19 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_21 = arg_107_1:FormatText(StoryNameCfg[584].name)

				arg_107_1.leftNameTxt_.text = var_110_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_22 = arg_107_1:GetWordFromCfg(410131027)
				local var_110_23 = arg_107_1:FormatText(var_110_22.content)

				arg_107_1.text_.text = var_110_23

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_24 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131027", "story_v_out_410131.awb") ~= 0 then
					local var_110_27 = manager.audio:GetVoiceLength("story_v_out_410131", "410131027", "story_v_out_410131.awb") / 1000

					if var_110_27 + var_110_19 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_27 + var_110_19
					end

					if var_110_22.prefab_name ~= "" and arg_107_1.actors_[var_110_22.prefab_name] ~= nil then
						local var_110_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_22.prefab_name].transform, "story_v_out_410131", "410131027", "story_v_out_410131.awb")

						arg_107_1:RecordAudio("410131027", var_110_28)
						arg_107_1:RecordAudio("410131027", var_110_28)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_410131", "410131027", "story_v_out_410131.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_410131", "410131027", "story_v_out_410131.awb")
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
	Play410131028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 410131028
		arg_111_1.duration_ = 8.6

		local var_111_0 = {
			zh = 3.166,
			ja = 8.6
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
				arg_111_0:Play410131029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1012"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos1012 = var_114_0.localPosition
				var_114_0.localScale = Vector3.New(1, 1, 1)

				arg_111_1:CheckSpriteTmpPos("1012", 2)

				local var_114_2 = var_114_0.childCount

				for iter_114_0 = 0, var_114_2 - 1 do
					local var_114_3 = var_114_0:GetChild(iter_114_0)

					if var_114_3.name == "split_1" or not string.find(var_114_3.name, "split") then
						var_114_3.gameObject:SetActive(true)
					else
						var_114_3.gameObject:SetActive(false)
					end
				end
			end

			local var_114_4 = 0.001

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_4 then
				local var_114_5 = (arg_111_1.time_ - var_114_1) / var_114_4
				local var_114_6 = Vector3.New(-390, -465, 300)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1012, var_114_6, var_114_5)
			end

			if arg_111_1.time_ >= var_114_1 + var_114_4 and arg_111_1.time_ < var_114_1 + var_114_4 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(-390, -465, 300)
			end

			local var_114_7 = arg_111_1.actors_["1012"]
			local var_114_8 = 0

			if var_114_8 < arg_111_1.time_ and arg_111_1.time_ <= var_114_8 + arg_114_0 and arg_111_1.var_.actorSpriteComps1012 == nil then
				arg_111_1.var_.actorSpriteComps1012 = var_114_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_9 = 0.034

			if var_114_8 <= arg_111_1.time_ and arg_111_1.time_ < var_114_8 + var_114_9 then
				local var_114_10 = (arg_111_1.time_ - var_114_8) / var_114_9

				if arg_111_1.var_.actorSpriteComps1012 then
					for iter_114_1, iter_114_2 in pairs(arg_111_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_114_2 then
							local var_114_11 = Mathf.Lerp(iter_114_2.color.r, 1, var_114_10)

							iter_114_2.color = Color.New(var_114_11, var_114_11, var_114_11)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_8 + var_114_9 and arg_111_1.time_ < var_114_8 + var_114_9 + arg_114_0 and arg_111_1.var_.actorSpriteComps1012 then
				local var_114_12 = 1

				for iter_114_3, iter_114_4 in pairs(arg_111_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_114_4 then
						iter_114_4.color = Color.New(var_114_12, var_114_12, var_114_12)
					end
				end

				arg_111_1.var_.actorSpriteComps1012 = nil
			end

			local var_114_13 = arg_111_1.actors_["1060"]
			local var_114_14 = 0

			if var_114_14 < arg_111_1.time_ and arg_111_1.time_ <= var_114_14 + arg_114_0 and arg_111_1.var_.actorSpriteComps1060 == nil then
				arg_111_1.var_.actorSpriteComps1060 = var_114_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_15 = 0.034

			if var_114_14 <= arg_111_1.time_ and arg_111_1.time_ < var_114_14 + var_114_15 then
				local var_114_16 = (arg_111_1.time_ - var_114_14) / var_114_15

				if arg_111_1.var_.actorSpriteComps1060 then
					for iter_114_5, iter_114_6 in pairs(arg_111_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_114_6 then
							local var_114_17 = Mathf.Lerp(iter_114_6.color.r, 0.5, var_114_16)

							iter_114_6.color = Color.New(var_114_17, var_114_17, var_114_17)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_14 + var_114_15 and arg_111_1.time_ < var_114_14 + var_114_15 + arg_114_0 and arg_111_1.var_.actorSpriteComps1060 then
				local var_114_18 = 0.5

				for iter_114_7, iter_114_8 in pairs(arg_111_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_114_8 then
						iter_114_8.color = Color.New(var_114_18, var_114_18, var_114_18)
					end
				end

				arg_111_1.var_.actorSpriteComps1060 = nil
			end

			local var_114_19 = 0
			local var_114_20 = 0.3

			if var_114_19 < arg_111_1.time_ and arg_111_1.time_ <= var_114_19 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_21 = arg_111_1:FormatText(StoryNameCfg[595].name)

				arg_111_1.leftNameTxt_.text = var_114_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_22 = arg_111_1:GetWordFromCfg(410131028)
				local var_114_23 = arg_111_1:FormatText(var_114_22.content)

				arg_111_1.text_.text = var_114_23

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_24 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131028", "story_v_out_410131.awb") ~= 0 then
					local var_114_27 = manager.audio:GetVoiceLength("story_v_out_410131", "410131028", "story_v_out_410131.awb") / 1000

					if var_114_27 + var_114_19 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_27 + var_114_19
					end

					if var_114_22.prefab_name ~= "" and arg_111_1.actors_[var_114_22.prefab_name] ~= nil then
						local var_114_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_22.prefab_name].transform, "story_v_out_410131", "410131028", "story_v_out_410131.awb")

						arg_111_1:RecordAudio("410131028", var_114_28)
						arg_111_1:RecordAudio("410131028", var_114_28)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_410131", "410131028", "story_v_out_410131.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_410131", "410131028", "story_v_out_410131.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_29 = math.max(var_114_20, arg_111_1.talkMaxDuration)

			if var_114_19 <= arg_111_1.time_ and arg_111_1.time_ < var_114_19 + var_114_29 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_19) / var_114_29

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_19 + var_114_29 and arg_111_1.time_ < var_114_19 + var_114_29 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play410131029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 410131029
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play410131030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1060"].transform
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.var_.moveOldPos1060 = var_118_0.localPosition
				var_118_0.localScale = Vector3.New(1, 1, 1)

				arg_115_1:CheckSpriteTmpPos("1060", 7)

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
				local var_118_6 = Vector3.New(0, -2000, -40)

				var_118_0.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1060, var_118_6, var_118_5)
			end

			if arg_115_1.time_ >= var_118_1 + var_118_4 and arg_115_1.time_ < var_118_1 + var_118_4 + arg_118_0 then
				var_118_0.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_118_7 = arg_115_1.actors_["1012"].transform
			local var_118_8 = 0

			if var_118_8 < arg_115_1.time_ and arg_115_1.time_ <= var_118_8 + arg_118_0 then
				arg_115_1.var_.moveOldPos1012 = var_118_7.localPosition
				var_118_7.localScale = Vector3.New(1, 1, 1)

				arg_115_1:CheckSpriteTmpPos("1012", 7)

				local var_118_9 = var_118_7.childCount

				for iter_118_1 = 0, var_118_9 - 1 do
					local var_118_10 = var_118_7:GetChild(iter_118_1)

					if var_118_10.name == "" or not string.find(var_118_10.name, "split") then
						var_118_10.gameObject:SetActive(true)
					else
						var_118_10.gameObject:SetActive(false)
					end
				end
			end

			local var_118_11 = 0.001

			if var_118_8 <= arg_115_1.time_ and arg_115_1.time_ < var_118_8 + var_118_11 then
				local var_118_12 = (arg_115_1.time_ - var_118_8) / var_118_11
				local var_118_13 = Vector3.New(0, -2000, 300)

				var_118_7.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1012, var_118_13, var_118_12)
			end

			if arg_115_1.time_ >= var_118_8 + var_118_11 and arg_115_1.time_ < var_118_8 + var_118_11 + arg_118_0 then
				var_118_7.localPosition = Vector3.New(0, -2000, 300)
			end

			local var_118_14 = arg_115_1.actors_["1060"]
			local var_118_15 = 0

			if var_118_15 < arg_115_1.time_ and arg_115_1.time_ <= var_118_15 + arg_118_0 and arg_115_1.var_.actorSpriteComps1060 == nil then
				arg_115_1.var_.actorSpriteComps1060 = var_118_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_16 = 0.034

			if var_118_15 <= arg_115_1.time_ and arg_115_1.time_ < var_118_15 + var_118_16 then
				local var_118_17 = (arg_115_1.time_ - var_118_15) / var_118_16

				if arg_115_1.var_.actorSpriteComps1060 then
					for iter_118_2, iter_118_3 in pairs(arg_115_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_118_3 then
							local var_118_18 = Mathf.Lerp(iter_118_3.color.r, 0.5, var_118_17)

							iter_118_3.color = Color.New(var_118_18, var_118_18, var_118_18)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_15 + var_118_16 and arg_115_1.time_ < var_118_15 + var_118_16 + arg_118_0 and arg_115_1.var_.actorSpriteComps1060 then
				local var_118_19 = 0.5

				for iter_118_4, iter_118_5 in pairs(arg_115_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_118_5 then
						iter_118_5.color = Color.New(var_118_19, var_118_19, var_118_19)
					end
				end

				arg_115_1.var_.actorSpriteComps1060 = nil
			end

			local var_118_20 = 0
			local var_118_21 = 0.7

			if var_118_20 < arg_115_1.time_ and arg_115_1.time_ <= var_118_20 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, false)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_22 = arg_115_1:GetWordFromCfg(410131029)
				local var_118_23 = arg_115_1:FormatText(var_118_22.content)

				arg_115_1.text_.text = var_118_23

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_24 = 28
				local var_118_25 = utf8.len(var_118_23)
				local var_118_26 = var_118_24 <= 0 and var_118_21 or var_118_21 * (var_118_25 / var_118_24)

				if var_118_26 > 0 and var_118_21 < var_118_26 then
					arg_115_1.talkMaxDuration = var_118_26

					if var_118_26 + var_118_20 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_26 + var_118_20
					end
				end

				arg_115_1.text_.text = var_118_23
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_27 = math.max(var_118_21, arg_115_1.talkMaxDuration)

			if var_118_20 <= arg_115_1.time_ and arg_115_1.time_ < var_118_20 + var_118_27 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_20) / var_118_27

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_20 + var_118_27 and arg_115_1.time_ < var_118_20 + var_118_27 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play410131030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 410131030
		arg_119_1.duration_ = 11.633

		local var_119_0 = {
			zh = 9.366,
			ja = 11.633
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
				arg_119_0:Play410131031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = "LZ0108"

			if arg_119_1.bgs_[var_122_0] == nil then
				local var_122_1 = Object.Instantiate(arg_119_1.paintGo_)

				var_122_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_122_0)
				var_122_1.name = var_122_0
				var_122_1.transform.parent = arg_119_1.stage_.transform
				var_122_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_119_1.bgs_[var_122_0] = var_122_1
			end

			local var_122_2 = 2

			if var_122_2 < arg_119_1.time_ and arg_119_1.time_ <= var_122_2 + arg_122_0 then
				local var_122_3 = manager.ui.mainCamera.transform.localPosition
				local var_122_4 = Vector3.New(0, 0, 10) + Vector3.New(var_122_3.x, var_122_3.y, 0)
				local var_122_5 = arg_119_1.bgs_.LZ0108

				var_122_5.transform.localPosition = var_122_4
				var_122_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_122_6 = var_122_5:GetComponent("SpriteRenderer")

				if var_122_6 and var_122_6.sprite then
					local var_122_7 = (var_122_5.transform.localPosition - var_122_3).z
					local var_122_8 = manager.ui.mainCameraCom_
					local var_122_9 = 2 * var_122_7 * Mathf.Tan(var_122_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_122_10 = var_122_9 * var_122_8.aspect
					local var_122_11 = var_122_6.sprite.bounds.size.x
					local var_122_12 = var_122_6.sprite.bounds.size.y
					local var_122_13 = var_122_10 / var_122_11
					local var_122_14 = var_122_9 / var_122_12
					local var_122_15 = var_122_14 < var_122_13 and var_122_13 or var_122_14

					var_122_5.transform.localScale = Vector3.New(var_122_15, var_122_15, 0)
				end

				for iter_122_0, iter_122_1 in pairs(arg_119_1.bgs_) do
					if iter_122_0 ~= "LZ0108" then
						iter_122_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_122_16 = 2

			if var_122_16 < arg_119_1.time_ and arg_119_1.time_ <= var_122_16 + arg_122_0 then
				arg_119_1.mask_.enabled = true
				arg_119_1.mask_.raycastTarget = true

				arg_119_1:SetGaussion(false)
			end

			local var_122_17 = 2

			if var_122_16 <= arg_119_1.time_ and arg_119_1.time_ < var_122_16 + var_122_17 then
				local var_122_18 = (arg_119_1.time_ - var_122_16) / var_122_17
				local var_122_19 = Color.New(0, 0, 0)

				var_122_19.a = Mathf.Lerp(1, 0, var_122_18)
				arg_119_1.mask_.color = var_122_19
			end

			if arg_119_1.time_ >= var_122_16 + var_122_17 and arg_119_1.time_ < var_122_16 + var_122_17 + arg_122_0 then
				local var_122_20 = Color.New(0, 0, 0)
				local var_122_21 = 0

				arg_119_1.mask_.enabled = false
				var_122_20.a = var_122_21
				arg_119_1.mask_.color = var_122_20
			end

			local var_122_22 = 0

			if var_122_22 < arg_119_1.time_ and arg_119_1.time_ <= var_122_22 + arg_122_0 then
				arg_119_1.mask_.enabled = true
				arg_119_1.mask_.raycastTarget = true

				arg_119_1:SetGaussion(false)
			end

			local var_122_23 = 2

			if var_122_22 <= arg_119_1.time_ and arg_119_1.time_ < var_122_22 + var_122_23 then
				local var_122_24 = (arg_119_1.time_ - var_122_22) / var_122_23
				local var_122_25 = Color.New(0, 0, 0)

				var_122_25.a = Mathf.Lerp(0, 1, var_122_24)
				arg_119_1.mask_.color = var_122_25
			end

			if arg_119_1.time_ >= var_122_22 + var_122_23 and arg_119_1.time_ < var_122_22 + var_122_23 + arg_122_0 then
				local var_122_26 = Color.New(0, 0, 0)

				var_122_26.a = 1
				arg_119_1.mask_.color = var_122_26
			end

			if arg_119_1.frameCnt_ <= 1 then
				arg_119_1.dialog_:SetActive(false)
			end

			local var_122_27 = 4
			local var_122_28 = 0.675

			if var_122_27 < arg_119_1.time_ and arg_119_1.time_ <= var_122_27 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0

				arg_119_1.dialog_:SetActive(true)

				local var_122_29 = LeanTween.value(arg_119_1.dialog_, 0, 1, 0.3)

				var_122_29:setOnUpdate(LuaHelper.FloatAction(function(arg_123_0)
					arg_119_1.dialogCg_.alpha = arg_123_0
				end))
				var_122_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_119_1.dialog_)
					var_122_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_119_1.duration_ = arg_119_1.duration_ + 0.3

				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_30 = arg_119_1:FormatText(StoryNameCfg[595].name)

				arg_119_1.leftNameTxt_.text = var_122_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_31 = arg_119_1:GetWordFromCfg(410131030)
				local var_122_32 = arg_119_1:FormatText(var_122_31.content)

				arg_119_1.text_.text = var_122_32

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_33 = 27
				local var_122_34 = utf8.len(var_122_32)
				local var_122_35 = var_122_33 <= 0 and var_122_28 or var_122_28 * (var_122_34 / var_122_33)

				if var_122_35 > 0 and var_122_28 < var_122_35 then
					arg_119_1.talkMaxDuration = var_122_35
					var_122_27 = var_122_27 + 0.3

					if var_122_35 + var_122_27 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_35 + var_122_27
					end
				end

				arg_119_1.text_.text = var_122_32
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131030", "story_v_out_410131.awb") ~= 0 then
					local var_122_36 = manager.audio:GetVoiceLength("story_v_out_410131", "410131030", "story_v_out_410131.awb") / 1000

					if var_122_36 + var_122_27 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_36 + var_122_27
					end

					if var_122_31.prefab_name ~= "" and arg_119_1.actors_[var_122_31.prefab_name] ~= nil then
						local var_122_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_31.prefab_name].transform, "story_v_out_410131", "410131030", "story_v_out_410131.awb")

						arg_119_1:RecordAudio("410131030", var_122_37)
						arg_119_1:RecordAudio("410131030", var_122_37)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_410131", "410131030", "story_v_out_410131.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_410131", "410131030", "story_v_out_410131.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_38 = var_122_27 + 0.3
			local var_122_39 = math.max(var_122_28, arg_119_1.talkMaxDuration)

			if var_122_38 <= arg_119_1.time_ and arg_119_1.time_ < var_122_38 + var_122_39 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_38) / var_122_39

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_38 + var_122_39 and arg_119_1.time_ < var_122_38 + var_122_39 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play410131031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 410131031
		arg_125_1.duration_ = 19.666

		local var_125_0 = {
			zh = 13.333,
			ja = 19.666
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
				arg_125_0:Play410131032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0
			local var_128_1 = 1.65

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_2 = arg_125_1:FormatText(StoryNameCfg[595].name)

				arg_125_1.leftNameTxt_.text = var_128_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_3 = arg_125_1:GetWordFromCfg(410131031)
				local var_128_4 = arg_125_1:FormatText(var_128_3.content)

				arg_125_1.text_.text = var_128_4

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_5 = 66
				local var_128_6 = utf8.len(var_128_4)
				local var_128_7 = var_128_5 <= 0 and var_128_1 or var_128_1 * (var_128_6 / var_128_5)

				if var_128_7 > 0 and var_128_1 < var_128_7 then
					arg_125_1.talkMaxDuration = var_128_7

					if var_128_7 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_7 + var_128_0
					end
				end

				arg_125_1.text_.text = var_128_4
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131031", "story_v_out_410131.awb") ~= 0 then
					local var_128_8 = manager.audio:GetVoiceLength("story_v_out_410131", "410131031", "story_v_out_410131.awb") / 1000

					if var_128_8 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_8 + var_128_0
					end

					if var_128_3.prefab_name ~= "" and arg_125_1.actors_[var_128_3.prefab_name] ~= nil then
						local var_128_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_3.prefab_name].transform, "story_v_out_410131", "410131031", "story_v_out_410131.awb")

						arg_125_1:RecordAudio("410131031", var_128_9)
						arg_125_1:RecordAudio("410131031", var_128_9)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_410131", "410131031", "story_v_out_410131.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_410131", "410131031", "story_v_out_410131.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_10 = math.max(var_128_1, arg_125_1.talkMaxDuration)

			if var_128_0 <= arg_125_1.time_ and arg_125_1.time_ < var_128_0 + var_128_10 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_0) / var_128_10

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_0 + var_128_10 and arg_125_1.time_ < var_128_0 + var_128_10 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play410131032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 410131032
		arg_129_1.duration_ = 6.233

		local var_129_0 = {
			zh = 5,
			ja = 6.233
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
				arg_129_0:Play410131033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0
			local var_132_1 = 0.55

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_2 = arg_129_1:FormatText(StoryNameCfg[595].name)

				arg_129_1.leftNameTxt_.text = var_132_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_3 = arg_129_1:GetWordFromCfg(410131032)
				local var_132_4 = arg_129_1:FormatText(var_132_3.content)

				arg_129_1.text_.text = var_132_4

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_5 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131032", "story_v_out_410131.awb") ~= 0 then
					local var_132_8 = manager.audio:GetVoiceLength("story_v_out_410131", "410131032", "story_v_out_410131.awb") / 1000

					if var_132_8 + var_132_0 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_8 + var_132_0
					end

					if var_132_3.prefab_name ~= "" and arg_129_1.actors_[var_132_3.prefab_name] ~= nil then
						local var_132_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_3.prefab_name].transform, "story_v_out_410131", "410131032", "story_v_out_410131.awb")

						arg_129_1:RecordAudio("410131032", var_132_9)
						arg_129_1:RecordAudio("410131032", var_132_9)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_410131", "410131032", "story_v_out_410131.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_410131", "410131032", "story_v_out_410131.awb")
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
	Play410131033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 410131033
		arg_133_1.duration_ = 1.9

		local var_133_0 = {
			zh = 0.999999999999,
			ja = 1.9
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
				arg_133_0:Play410131034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0
			local var_136_1 = 0.125

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_2 = arg_133_1:FormatText(StoryNameCfg[596].name)

				arg_133_1.leftNameTxt_.text = var_136_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, true)
				arg_133_1.iconController_:SetSelectedState("hero")

				arg_133_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10059_split_2")

				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_3 = arg_133_1:GetWordFromCfg(410131033)
				local var_136_4 = arg_133_1:FormatText(var_136_3.content)

				arg_133_1.text_.text = var_136_4

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_5 = 5
				local var_136_6 = utf8.len(var_136_4)
				local var_136_7 = var_136_5 <= 0 and var_136_1 or var_136_1 * (var_136_6 / var_136_5)

				if var_136_7 > 0 and var_136_1 < var_136_7 then
					arg_133_1.talkMaxDuration = var_136_7

					if var_136_7 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_7 + var_136_0
					end
				end

				arg_133_1.text_.text = var_136_4
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131033", "story_v_out_410131.awb") ~= 0 then
					local var_136_8 = manager.audio:GetVoiceLength("story_v_out_410131", "410131033", "story_v_out_410131.awb") / 1000

					if var_136_8 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_8 + var_136_0
					end

					if var_136_3.prefab_name ~= "" and arg_133_1.actors_[var_136_3.prefab_name] ~= nil then
						local var_136_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_3.prefab_name].transform, "story_v_out_410131", "410131033", "story_v_out_410131.awb")

						arg_133_1:RecordAudio("410131033", var_136_9)
						arg_133_1:RecordAudio("410131033", var_136_9)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_410131", "410131033", "story_v_out_410131.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_410131", "410131033", "story_v_out_410131.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_10 = math.max(var_136_1, arg_133_1.talkMaxDuration)

			if var_136_0 <= arg_133_1.time_ and arg_133_1.time_ < var_136_0 + var_136_10 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_0) / var_136_10

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_0 + var_136_10 and arg_133_1.time_ < var_136_0 + var_136_10 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play410131034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 410131034
		arg_137_1.duration_ = 2.866

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play410131035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 0.075

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_2 = arg_137_1:FormatText(StoryNameCfg[604].name)

				arg_137_1.leftNameTxt_.text = var_140_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, true)
				arg_137_1.iconController_:SetSelectedState("hero")

				arg_137_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3046")

				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_3 = arg_137_1:GetWordFromCfg(410131034)
				local var_140_4 = arg_137_1:FormatText(var_140_3.content)

				arg_137_1.text_.text = var_140_4

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_5 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131034", "story_v_out_410131.awb") ~= 0 then
					local var_140_8 = manager.audio:GetVoiceLength("story_v_out_410131", "410131034", "story_v_out_410131.awb") / 1000

					if var_140_8 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_8 + var_140_0
					end

					if var_140_3.prefab_name ~= "" and arg_137_1.actors_[var_140_3.prefab_name] ~= nil then
						local var_140_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_3.prefab_name].transform, "story_v_out_410131", "410131034", "story_v_out_410131.awb")

						arg_137_1:RecordAudio("410131034", var_140_9)
						arg_137_1:RecordAudio("410131034", var_140_9)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_410131", "410131034", "story_v_out_410131.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_410131", "410131034", "story_v_out_410131.awb")
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
	Play410131035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 410131035
		arg_141_1.duration_ = 11.066

		local var_141_0 = {
			zh = 4.366,
			ja = 11.066
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
				arg_141_0:Play410131036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 0.375

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_2 = arg_141_1:FormatText(StoryNameCfg[595].name)

				arg_141_1.leftNameTxt_.text = var_144_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_3 = arg_141_1:GetWordFromCfg(410131035)
				local var_144_4 = arg_141_1:FormatText(var_144_3.content)

				arg_141_1.text_.text = var_144_4

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131035", "story_v_out_410131.awb") ~= 0 then
					local var_144_8 = manager.audio:GetVoiceLength("story_v_out_410131", "410131035", "story_v_out_410131.awb") / 1000

					if var_144_8 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_8 + var_144_0
					end

					if var_144_3.prefab_name ~= "" and arg_141_1.actors_[var_144_3.prefab_name] ~= nil then
						local var_144_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_3.prefab_name].transform, "story_v_out_410131", "410131035", "story_v_out_410131.awb")

						arg_141_1:RecordAudio("410131035", var_144_9)
						arg_141_1:RecordAudio("410131035", var_144_9)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_410131", "410131035", "story_v_out_410131.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_410131", "410131035", "story_v_out_410131.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_10 = math.max(var_144_1, arg_141_1.talkMaxDuration)

			if var_144_0 <= arg_141_1.time_ and arg_141_1.time_ < var_144_0 + var_144_10 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_0) / var_144_10

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_0 + var_144_10 and arg_141_1.time_ < var_144_0 + var_144_10 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play410131036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 410131036
		arg_145_1.duration_ = 5.8

		local var_145_0 = {
			zh = 1.833,
			ja = 5.8
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
				arg_145_0:Play410131037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 0.15

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_2 = arg_145_1:FormatText(StoryNameCfg[584].name)

				arg_145_1.leftNameTxt_.text = var_148_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_3 = arg_145_1:GetWordFromCfg(410131036)
				local var_148_4 = arg_145_1:FormatText(var_148_3.content)

				arg_145_1.text_.text = var_148_4

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131036", "story_v_out_410131.awb") ~= 0 then
					local var_148_8 = manager.audio:GetVoiceLength("story_v_out_410131", "410131036", "story_v_out_410131.awb") / 1000

					if var_148_8 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_8 + var_148_0
					end

					if var_148_3.prefab_name ~= "" and arg_145_1.actors_[var_148_3.prefab_name] ~= nil then
						local var_148_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_3.prefab_name].transform, "story_v_out_410131", "410131036", "story_v_out_410131.awb")

						arg_145_1:RecordAudio("410131036", var_148_9)
						arg_145_1:RecordAudio("410131036", var_148_9)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_410131", "410131036", "story_v_out_410131.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_410131", "410131036", "story_v_out_410131.awb")
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
	Play410131037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 410131037
		arg_149_1.duration_ = 8.1

		local var_149_0 = {
			zh = 3.533,
			ja = 8.1
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
				arg_149_0:Play410131038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 0.425

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_2 = arg_149_1:FormatText(StoryNameCfg[595].name)

				arg_149_1.leftNameTxt_.text = var_152_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_3 = arg_149_1:GetWordFromCfg(410131037)
				local var_152_4 = arg_149_1:FormatText(var_152_3.content)

				arg_149_1.text_.text = var_152_4

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131037", "story_v_out_410131.awb") ~= 0 then
					local var_152_8 = manager.audio:GetVoiceLength("story_v_out_410131", "410131037", "story_v_out_410131.awb") / 1000

					if var_152_8 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_8 + var_152_0
					end

					if var_152_3.prefab_name ~= "" and arg_149_1.actors_[var_152_3.prefab_name] ~= nil then
						local var_152_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_3.prefab_name].transform, "story_v_out_410131", "410131037", "story_v_out_410131.awb")

						arg_149_1:RecordAudio("410131037", var_152_9)
						arg_149_1:RecordAudio("410131037", var_152_9)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_410131", "410131037", "story_v_out_410131.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_410131", "410131037", "story_v_out_410131.awb")
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
	Play410131038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 410131038
		arg_153_1.duration_ = 9.066

		local var_153_0 = {
			zh = 6.833,
			ja = 9.066
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
			arg_153_1.auto_ = false
		end

		function arg_153_1.playNext_(arg_155_0)
			arg_153_1.onStoryFinished_()
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 0.925

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_2 = arg_153_1:FormatText(StoryNameCfg[595].name)

				arg_153_1.leftNameTxt_.text = var_156_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_3 = arg_153_1:GetWordFromCfg(410131038)
				local var_156_4 = arg_153_1:FormatText(var_156_3.content)

				arg_153_1.text_.text = var_156_4

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_5 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_410131", "410131038", "story_v_out_410131.awb") ~= 0 then
					local var_156_8 = manager.audio:GetVoiceLength("story_v_out_410131", "410131038", "story_v_out_410131.awb") / 1000

					if var_156_8 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_8 + var_156_0
					end

					if var_156_3.prefab_name ~= "" and arg_153_1.actors_[var_156_3.prefab_name] ~= nil then
						local var_156_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_3.prefab_name].transform, "story_v_out_410131", "410131038", "story_v_out_410131.awb")

						arg_153_1:RecordAudio("410131038", var_156_9)
						arg_153_1:RecordAudio("410131038", var_156_9)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_410131", "410131038", "story_v_out_410131.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_410131", "410131038", "story_v_out_410131.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_10 = math.max(var_156_1, arg_153_1.talkMaxDuration)

			if var_156_0 <= arg_153_1.time_ and arg_153_1.time_ < var_156_0 + var_156_10 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_0) / var_156_10

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_0 + var_156_10 and arg_153_1.time_ < var_156_0 + var_156_10 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/L04f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/LZ0108"
	},
	voices = {
		"story_v_out_410131.awb"
	}
}
