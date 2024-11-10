return {
	Play410021001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 410021001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play410021002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "L01f"

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
				local var_4_5 = arg_1_1.bgs_.L01f

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
					if iter_4_0 ~= "L01f" then
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

			local var_4_26 = 1.56666666666667
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_8_story_jivitabad_slum", "bgm_activity_2_8_story_jivitabad_slum", "bgm_activity_2_8_story_jivitabad_slum.awb")
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

				local var_4_33 = arg_1_1:GetWordFromCfg(410021001)
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
	Play410021002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 410021002
		arg_7_1.duration_ = 5.5

		local var_7_0 = {
			zh = 4.2,
			ja = 5.5
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
				arg_7_0:Play410021003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "10061"

			if arg_7_1.actors_[var_10_0] == nil then
				local var_10_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_10_0), arg_7_1.canvasGo_.transform)

				var_10_1.transform:SetSiblingIndex(1)

				var_10_1.name = var_10_0
				var_10_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_7_1.actors_[var_10_0] = var_10_1
			end

			local var_10_2 = arg_7_1.actors_["10061"].transform
			local var_10_3 = 0

			if var_10_3 < arg_7_1.time_ and arg_7_1.time_ <= var_10_3 + arg_10_0 then
				arg_7_1.var_.moveOldPos10061 = var_10_2.localPosition
				var_10_2.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("10061", 3)

				local var_10_4 = var_10_2.childCount

				for iter_10_0 = 0, var_10_4 - 1 do
					local var_10_5 = var_10_2:GetChild(iter_10_0)

					if var_10_5.name == "split_2" or not string.find(var_10_5.name, "split") then
						var_10_5.gameObject:SetActive(true)
					else
						var_10_5.gameObject:SetActive(false)
					end
				end
			end

			local var_10_6 = 0.001

			if var_10_3 <= arg_7_1.time_ and arg_7_1.time_ < var_10_3 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_3) / var_10_6
				local var_10_8 = Vector3.New(0, -517.5, -100)

				var_10_2.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10061, var_10_8, var_10_7)
			end

			if arg_7_1.time_ >= var_10_3 + var_10_6 and arg_7_1.time_ < var_10_3 + var_10_6 + arg_10_0 then
				var_10_2.localPosition = Vector3.New(0, -517.5, -100)
			end

			local var_10_9 = arg_7_1.actors_["10061"]
			local var_10_10 = 0

			if var_10_10 < arg_7_1.time_ and arg_7_1.time_ <= var_10_10 + arg_10_0 and arg_7_1.var_.actorSpriteComps10061 == nil then
				arg_7_1.var_.actorSpriteComps10061 = var_10_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_11 = 0.034

			if var_10_10 <= arg_7_1.time_ and arg_7_1.time_ < var_10_10 + var_10_11 then
				local var_10_12 = (arg_7_1.time_ - var_10_10) / var_10_11

				if arg_7_1.var_.actorSpriteComps10061 then
					for iter_10_1, iter_10_2 in pairs(arg_7_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_10_2 then
							local var_10_13 = Mathf.Lerp(iter_10_2.color.r, 1, var_10_12)

							iter_10_2.color = Color.New(var_10_13, var_10_13, var_10_13)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_10 + var_10_11 and arg_7_1.time_ < var_10_10 + var_10_11 + arg_10_0 and arg_7_1.var_.actorSpriteComps10061 then
				local var_10_14 = 1

				for iter_10_3, iter_10_4 in pairs(arg_7_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_10_4 then
						iter_10_4.color = Color.New(var_10_14, var_10_14, var_10_14)
					end
				end

				arg_7_1.var_.actorSpriteComps10061 = nil
			end

			local var_10_15 = 0
			local var_10_16 = 0.375

			if var_10_15 < arg_7_1.time_ and arg_7_1.time_ <= var_10_15 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_17 = arg_7_1:FormatText(StoryNameCfg[591].name)

				arg_7_1.leftNameTxt_.text = var_10_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_18 = arg_7_1:GetWordFromCfg(410021002)
				local var_10_19 = arg_7_1:FormatText(var_10_18.content)

				arg_7_1.text_.text = var_10_19

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_20 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021002", "story_v_out_410021.awb") ~= 0 then
					local var_10_23 = manager.audio:GetVoiceLength("story_v_out_410021", "410021002", "story_v_out_410021.awb") / 1000

					if var_10_23 + var_10_15 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_23 + var_10_15
					end

					if var_10_18.prefab_name ~= "" and arg_7_1.actors_[var_10_18.prefab_name] ~= nil then
						local var_10_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_18.prefab_name].transform, "story_v_out_410021", "410021002", "story_v_out_410021.awb")

						arg_7_1:RecordAudio("410021002", var_10_24)
						arg_7_1:RecordAudio("410021002", var_10_24)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_410021", "410021002", "story_v_out_410021.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_410021", "410021002", "story_v_out_410021.awb")
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
	Play410021003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 410021003
		arg_11_1.duration_ = 11.9

		local var_11_0 = {
			zh = 6.8,
			ja = 11.9
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
				arg_11_0:Play410021004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["10061"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.actorSpriteComps10061 == nil then
				arg_11_1.var_.actorSpriteComps10061 = var_14_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_2 = 0.034

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.actorSpriteComps10061 then
					for iter_14_0, iter_14_1 in pairs(arg_11_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_14_1 then
							local var_14_4 = Mathf.Lerp(iter_14_1.color.r, 0.5, var_14_3)

							iter_14_1.color = Color.New(var_14_4, var_14_4, var_14_4)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.actorSpriteComps10061 then
				local var_14_5 = 0.5

				for iter_14_2, iter_14_3 in pairs(arg_11_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_14_3 then
						iter_14_3.color = Color.New(var_14_5, var_14_5, var_14_5)
					end
				end

				arg_11_1.var_.actorSpriteComps10061 = nil
			end

			local var_14_6 = 0
			local var_14_7 = 0.6

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_8 = arg_11_1:FormatText(StoryNameCfg[606].name)

				arg_11_1.leftNameTxt_.text = var_14_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_lolic")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_9 = arg_11_1:GetWordFromCfg(410021003)
				local var_14_10 = arg_11_1:FormatText(var_14_9.content)

				arg_11_1.text_.text = var_14_10

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_11 = 24
				local var_14_12 = utf8.len(var_14_10)
				local var_14_13 = var_14_11 <= 0 and var_14_7 or var_14_7 * (var_14_12 / var_14_11)

				if var_14_13 > 0 and var_14_7 < var_14_13 then
					arg_11_1.talkMaxDuration = var_14_13

					if var_14_13 + var_14_6 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_13 + var_14_6
					end
				end

				arg_11_1.text_.text = var_14_10
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021003", "story_v_out_410021.awb") ~= 0 then
					local var_14_14 = manager.audio:GetVoiceLength("story_v_out_410021", "410021003", "story_v_out_410021.awb") / 1000

					if var_14_14 + var_14_6 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_14 + var_14_6
					end

					if var_14_9.prefab_name ~= "" and arg_11_1.actors_[var_14_9.prefab_name] ~= nil then
						local var_14_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_9.prefab_name].transform, "story_v_out_410021", "410021003", "story_v_out_410021.awb")

						arg_11_1:RecordAudio("410021003", var_14_15)
						arg_11_1:RecordAudio("410021003", var_14_15)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_410021", "410021003", "story_v_out_410021.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_410021", "410021003", "story_v_out_410021.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_16 = math.max(var_14_7, arg_11_1.talkMaxDuration)

			if var_14_6 <= arg_11_1.time_ and arg_11_1.time_ < var_14_6 + var_14_16 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_6) / var_14_16

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_6 + var_14_16 and arg_11_1.time_ < var_14_6 + var_14_16 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play410021004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 410021004
		arg_15_1.duration_ = 8.733

		local var_15_0 = {
			zh = 4.8,
			ja = 8.733
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
				arg_15_0:Play410021005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["10061"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos10061 = var_18_0.localPosition
				var_18_0.localScale = Vector3.New(1, 1, 1)

				arg_15_1:CheckSpriteTmpPos("10061", 3)

				local var_18_2 = var_18_0.childCount

				for iter_18_0 = 0, var_18_2 - 1 do
					local var_18_3 = var_18_0:GetChild(iter_18_0)

					if var_18_3.name == "split_2" or not string.find(var_18_3.name, "split") then
						var_18_3.gameObject:SetActive(true)
					else
						var_18_3.gameObject:SetActive(false)
					end
				end
			end

			local var_18_4 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_4 then
				local var_18_5 = (arg_15_1.time_ - var_18_1) / var_18_4
				local var_18_6 = Vector3.New(0, -517.5, -100)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10061, var_18_6, var_18_5)
			end

			if arg_15_1.time_ >= var_18_1 + var_18_4 and arg_15_1.time_ < var_18_1 + var_18_4 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(0, -517.5, -100)
			end

			local var_18_7 = arg_15_1.actors_["10061"]
			local var_18_8 = 0

			if var_18_8 < arg_15_1.time_ and arg_15_1.time_ <= var_18_8 + arg_18_0 and arg_15_1.var_.actorSpriteComps10061 == nil then
				arg_15_1.var_.actorSpriteComps10061 = var_18_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_9 = 0.034

			if var_18_8 <= arg_15_1.time_ and arg_15_1.time_ < var_18_8 + var_18_9 then
				local var_18_10 = (arg_15_1.time_ - var_18_8) / var_18_9

				if arg_15_1.var_.actorSpriteComps10061 then
					for iter_18_1, iter_18_2 in pairs(arg_15_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_18_2 then
							local var_18_11 = Mathf.Lerp(iter_18_2.color.r, 1, var_18_10)

							iter_18_2.color = Color.New(var_18_11, var_18_11, var_18_11)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_8 + var_18_9 and arg_15_1.time_ < var_18_8 + var_18_9 + arg_18_0 and arg_15_1.var_.actorSpriteComps10061 then
				local var_18_12 = 1

				for iter_18_3, iter_18_4 in pairs(arg_15_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_18_4 then
						iter_18_4.color = Color.New(var_18_12, var_18_12, var_18_12)
					end
				end

				arg_15_1.var_.actorSpriteComps10061 = nil
			end

			local var_18_13 = 0
			local var_18_14 = 0.5

			if var_18_13 < arg_15_1.time_ and arg_15_1.time_ <= var_18_13 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_15 = arg_15_1:FormatText(StoryNameCfg[591].name)

				arg_15_1.leftNameTxt_.text = var_18_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_16 = arg_15_1:GetWordFromCfg(410021004)
				local var_18_17 = arg_15_1:FormatText(var_18_16.content)

				arg_15_1.text_.text = var_18_17

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_18 = 20
				local var_18_19 = utf8.len(var_18_17)
				local var_18_20 = var_18_18 <= 0 and var_18_14 or var_18_14 * (var_18_19 / var_18_18)

				if var_18_20 > 0 and var_18_14 < var_18_20 then
					arg_15_1.talkMaxDuration = var_18_20

					if var_18_20 + var_18_13 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_20 + var_18_13
					end
				end

				arg_15_1.text_.text = var_18_17
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021004", "story_v_out_410021.awb") ~= 0 then
					local var_18_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021004", "story_v_out_410021.awb") / 1000

					if var_18_21 + var_18_13 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_21 + var_18_13
					end

					if var_18_16.prefab_name ~= "" and arg_15_1.actors_[var_18_16.prefab_name] ~= nil then
						local var_18_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_16.prefab_name].transform, "story_v_out_410021", "410021004", "story_v_out_410021.awb")

						arg_15_1:RecordAudio("410021004", var_18_22)
						arg_15_1:RecordAudio("410021004", var_18_22)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_410021", "410021004", "story_v_out_410021.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_410021", "410021004", "story_v_out_410021.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_23 = math.max(var_18_14, arg_15_1.talkMaxDuration)

			if var_18_13 <= arg_15_1.time_ and arg_15_1.time_ < var_18_13 + var_18_23 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_13) / var_18_23

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_13 + var_18_23 and arg_15_1.time_ < var_18_13 + var_18_23 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play410021005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 410021005
		arg_19_1.duration_ = 14.8

		local var_19_0 = {
			zh = 8.7,
			ja = 14.8
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
				arg_19_0:Play410021006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10061"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.actorSpriteComps10061 == nil then
				arg_19_1.var_.actorSpriteComps10061 = var_22_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_2 = 0.034

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.actorSpriteComps10061 then
					for iter_22_0, iter_22_1 in pairs(arg_19_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_22_1 then
							local var_22_4 = Mathf.Lerp(iter_22_1.color.r, 0.5, var_22_3)

							iter_22_1.color = Color.New(var_22_4, var_22_4, var_22_4)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.actorSpriteComps10061 then
				local var_22_5 = 0.5

				for iter_22_2, iter_22_3 in pairs(arg_19_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_22_3 then
						iter_22_3.color = Color.New(var_22_5, var_22_5, var_22_5)
					end
				end

				arg_19_1.var_.actorSpriteComps10061 = nil
			end

			local var_22_6 = 0
			local var_22_7 = 0.825

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_8 = arg_19_1:FormatText(StoryNameCfg[606].name)

				arg_19_1.leftNameTxt_.text = var_22_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_lolic")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_9 = arg_19_1:GetWordFromCfg(410021005)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021005", "story_v_out_410021.awb") ~= 0 then
					local var_22_14 = manager.audio:GetVoiceLength("story_v_out_410021", "410021005", "story_v_out_410021.awb") / 1000

					if var_22_14 + var_22_6 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_14 + var_22_6
					end

					if var_22_9.prefab_name ~= "" and arg_19_1.actors_[var_22_9.prefab_name] ~= nil then
						local var_22_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_9.prefab_name].transform, "story_v_out_410021", "410021005", "story_v_out_410021.awb")

						arg_19_1:RecordAudio("410021005", var_22_15)
						arg_19_1:RecordAudio("410021005", var_22_15)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_410021", "410021005", "story_v_out_410021.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_410021", "410021005", "story_v_out_410021.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_16 = math.max(var_22_7, arg_19_1.talkMaxDuration)

			if var_22_6 <= arg_19_1.time_ and arg_19_1.time_ < var_22_6 + var_22_16 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_6) / var_22_16

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_6 + var_22_16 and arg_19_1.time_ < var_22_6 + var_22_16 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play410021006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 410021006
		arg_23_1.duration_ = 8.933

		local var_23_0 = {
			zh = 7.633,
			ja = 8.933
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
				arg_23_0:Play410021007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["10061"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos10061 = var_26_0.localPosition
				var_26_0.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("10061", 3)

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
				local var_26_6 = Vector3.New(0, -517.5, -100)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos10061, var_26_6, var_26_5)
			end

			if arg_23_1.time_ >= var_26_1 + var_26_4 and arg_23_1.time_ < var_26_1 + var_26_4 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(0, -517.5, -100)
			end

			local var_26_7 = arg_23_1.actors_["10061"]
			local var_26_8 = 0

			if var_26_8 < arg_23_1.time_ and arg_23_1.time_ <= var_26_8 + arg_26_0 and arg_23_1.var_.actorSpriteComps10061 == nil then
				arg_23_1.var_.actorSpriteComps10061 = var_26_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_9 = 0.034

			if var_26_8 <= arg_23_1.time_ and arg_23_1.time_ < var_26_8 + var_26_9 then
				local var_26_10 = (arg_23_1.time_ - var_26_8) / var_26_9

				if arg_23_1.var_.actorSpriteComps10061 then
					for iter_26_1, iter_26_2 in pairs(arg_23_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_26_2 then
							local var_26_11 = Mathf.Lerp(iter_26_2.color.r, 1, var_26_10)

							iter_26_2.color = Color.New(var_26_11, var_26_11, var_26_11)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_8 + var_26_9 and arg_23_1.time_ < var_26_8 + var_26_9 + arg_26_0 and arg_23_1.var_.actorSpriteComps10061 then
				local var_26_12 = 1

				for iter_26_3, iter_26_4 in pairs(arg_23_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_26_4 then
						iter_26_4.color = Color.New(var_26_12, var_26_12, var_26_12)
					end
				end

				arg_23_1.var_.actorSpriteComps10061 = nil
			end

			local var_26_13 = 0
			local var_26_14 = 0.8

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_15 = arg_23_1:FormatText(StoryNameCfg[591].name)

				arg_23_1.leftNameTxt_.text = var_26_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_16 = arg_23_1:GetWordFromCfg(410021006)
				local var_26_17 = arg_23_1:FormatText(var_26_16.content)

				arg_23_1.text_.text = var_26_17

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_18 = 32
				local var_26_19 = utf8.len(var_26_17)
				local var_26_20 = var_26_18 <= 0 and var_26_14 or var_26_14 * (var_26_19 / var_26_18)

				if var_26_20 > 0 and var_26_14 < var_26_20 then
					arg_23_1.talkMaxDuration = var_26_20

					if var_26_20 + var_26_13 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_20 + var_26_13
					end
				end

				arg_23_1.text_.text = var_26_17
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021006", "story_v_out_410021.awb") ~= 0 then
					local var_26_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021006", "story_v_out_410021.awb") / 1000

					if var_26_21 + var_26_13 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_21 + var_26_13
					end

					if var_26_16.prefab_name ~= "" and arg_23_1.actors_[var_26_16.prefab_name] ~= nil then
						local var_26_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_16.prefab_name].transform, "story_v_out_410021", "410021006", "story_v_out_410021.awb")

						arg_23_1:RecordAudio("410021006", var_26_22)
						arg_23_1:RecordAudio("410021006", var_26_22)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_410021", "410021006", "story_v_out_410021.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_410021", "410021006", "story_v_out_410021.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_23 = math.max(var_26_14, arg_23_1.talkMaxDuration)

			if var_26_13 <= arg_23_1.time_ and arg_23_1.time_ < var_26_13 + var_26_23 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_13) / var_26_23

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_13 + var_26_23 and arg_23_1.time_ < var_26_13 + var_26_23 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play410021007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 410021007
		arg_27_1.duration_ = 7.7

		local var_27_0 = {
			zh = 7.7,
			ja = 5.533
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
				arg_27_0:Play410021008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10061"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos10061 = var_30_0.localPosition
				var_30_0.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("10061", 3)

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
				local var_30_6 = Vector3.New(0, -517.5, -100)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10061, var_30_6, var_30_5)
			end

			if arg_27_1.time_ >= var_30_1 + var_30_4 and arg_27_1.time_ < var_30_1 + var_30_4 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0, -517.5, -100)
			end

			local var_30_7 = arg_27_1.actors_["10061"]
			local var_30_8 = 0

			if var_30_8 < arg_27_1.time_ and arg_27_1.time_ <= var_30_8 + arg_30_0 and arg_27_1.var_.actorSpriteComps10061 == nil then
				arg_27_1.var_.actorSpriteComps10061 = var_30_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_9 = 0.034

			if var_30_8 <= arg_27_1.time_ and arg_27_1.time_ < var_30_8 + var_30_9 then
				local var_30_10 = (arg_27_1.time_ - var_30_8) / var_30_9

				if arg_27_1.var_.actorSpriteComps10061 then
					for iter_30_1, iter_30_2 in pairs(arg_27_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_30_2 then
							local var_30_11 = Mathf.Lerp(iter_30_2.color.r, 1, var_30_10)

							iter_30_2.color = Color.New(var_30_11, var_30_11, var_30_11)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_8 + var_30_9 and arg_27_1.time_ < var_30_8 + var_30_9 + arg_30_0 and arg_27_1.var_.actorSpriteComps10061 then
				local var_30_12 = 1

				for iter_30_3, iter_30_4 in pairs(arg_27_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_30_4 then
						iter_30_4.color = Color.New(var_30_12, var_30_12, var_30_12)
					end
				end

				arg_27_1.var_.actorSpriteComps10061 = nil
			end

			local var_30_13 = 0
			local var_30_14 = 0.875

			if var_30_13 < arg_27_1.time_ and arg_27_1.time_ <= var_30_13 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_15 = arg_27_1:FormatText(StoryNameCfg[591].name)

				arg_27_1.leftNameTxt_.text = var_30_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_16 = arg_27_1:GetWordFromCfg(410021007)
				local var_30_17 = arg_27_1:FormatText(var_30_16.content)

				arg_27_1.text_.text = var_30_17

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_18 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021007", "story_v_out_410021.awb") ~= 0 then
					local var_30_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021007", "story_v_out_410021.awb") / 1000

					if var_30_21 + var_30_13 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_21 + var_30_13
					end

					if var_30_16.prefab_name ~= "" and arg_27_1.actors_[var_30_16.prefab_name] ~= nil then
						local var_30_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_16.prefab_name].transform, "story_v_out_410021", "410021007", "story_v_out_410021.awb")

						arg_27_1:RecordAudio("410021007", var_30_22)
						arg_27_1:RecordAudio("410021007", var_30_22)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_410021", "410021007", "story_v_out_410021.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_410021", "410021007", "story_v_out_410021.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_23 = math.max(var_30_14, arg_27_1.talkMaxDuration)

			if var_30_13 <= arg_27_1.time_ and arg_27_1.time_ < var_30_13 + var_30_23 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_13) / var_30_23

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_13 + var_30_23 and arg_27_1.time_ < var_30_13 + var_30_23 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play410021008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 410021008
		arg_31_1.duration_ = 2.033

		local var_31_0 = {
			zh = 2.033,
			ja = 1.833
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
				arg_31_0:Play410021009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10061"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.actorSpriteComps10061 == nil then
				arg_31_1.var_.actorSpriteComps10061 = var_34_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_2 = 0.034

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.actorSpriteComps10061 then
					for iter_34_0, iter_34_1 in pairs(arg_31_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_34_1 then
							local var_34_4 = Mathf.Lerp(iter_34_1.color.r, 0.5, var_34_3)

							iter_34_1.color = Color.New(var_34_4, var_34_4, var_34_4)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.actorSpriteComps10061 then
				local var_34_5 = 0.5

				for iter_34_2, iter_34_3 in pairs(arg_31_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_34_3 then
						iter_34_3.color = Color.New(var_34_5, var_34_5, var_34_5)
					end
				end

				arg_31_1.var_.actorSpriteComps10061 = nil
			end

			local var_34_6 = 0
			local var_34_7 = 0.075

			if var_34_6 < arg_31_1.time_ and arg_31_1.time_ <= var_34_6 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_8 = arg_31_1:FormatText(StoryNameCfg[606].name)

				arg_31_1.leftNameTxt_.text = var_34_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_lolic")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_9 = arg_31_1:GetWordFromCfg(410021008)
				local var_34_10 = arg_31_1:FormatText(var_34_9.content)

				arg_31_1.text_.text = var_34_10

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_11 = 3
				local var_34_12 = utf8.len(var_34_10)
				local var_34_13 = var_34_11 <= 0 and var_34_7 or var_34_7 * (var_34_12 / var_34_11)

				if var_34_13 > 0 and var_34_7 < var_34_13 then
					arg_31_1.talkMaxDuration = var_34_13

					if var_34_13 + var_34_6 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_13 + var_34_6
					end
				end

				arg_31_1.text_.text = var_34_10
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021008", "story_v_out_410021.awb") ~= 0 then
					local var_34_14 = manager.audio:GetVoiceLength("story_v_out_410021", "410021008", "story_v_out_410021.awb") / 1000

					if var_34_14 + var_34_6 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_14 + var_34_6
					end

					if var_34_9.prefab_name ~= "" and arg_31_1.actors_[var_34_9.prefab_name] ~= nil then
						local var_34_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_9.prefab_name].transform, "story_v_out_410021", "410021008", "story_v_out_410021.awb")

						arg_31_1:RecordAudio("410021008", var_34_15)
						arg_31_1:RecordAudio("410021008", var_34_15)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_410021", "410021008", "story_v_out_410021.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_410021", "410021008", "story_v_out_410021.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_16 = math.max(var_34_7, arg_31_1.talkMaxDuration)

			if var_34_6 <= arg_31_1.time_ and arg_31_1.time_ < var_34_6 + var_34_16 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_6) / var_34_16

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_6 + var_34_16 and arg_31_1.time_ < var_34_6 + var_34_16 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play410021009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 410021009
		arg_35_1.duration_ = 8.566

		local var_35_0 = {
			zh = 5.766,
			ja = 8.566
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
				arg_35_0:Play410021010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["10061"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos10061 = var_38_0.localPosition
				var_38_0.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("10061", 3)

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
				local var_38_6 = Vector3.New(0, -517.5, -100)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos10061, var_38_6, var_38_5)
			end

			if arg_35_1.time_ >= var_38_1 + var_38_4 and arg_35_1.time_ < var_38_1 + var_38_4 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0, -517.5, -100)
			end

			local var_38_7 = arg_35_1.actors_["10061"]
			local var_38_8 = 0

			if var_38_8 < arg_35_1.time_ and arg_35_1.time_ <= var_38_8 + arg_38_0 and arg_35_1.var_.actorSpriteComps10061 == nil then
				arg_35_1.var_.actorSpriteComps10061 = var_38_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_9 = 0.034

			if var_38_8 <= arg_35_1.time_ and arg_35_1.time_ < var_38_8 + var_38_9 then
				local var_38_10 = (arg_35_1.time_ - var_38_8) / var_38_9

				if arg_35_1.var_.actorSpriteComps10061 then
					for iter_38_1, iter_38_2 in pairs(arg_35_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_38_2 then
							local var_38_11 = Mathf.Lerp(iter_38_2.color.r, 1, var_38_10)

							iter_38_2.color = Color.New(var_38_11, var_38_11, var_38_11)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_8 + var_38_9 and arg_35_1.time_ < var_38_8 + var_38_9 + arg_38_0 and arg_35_1.var_.actorSpriteComps10061 then
				local var_38_12 = 1

				for iter_38_3, iter_38_4 in pairs(arg_35_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_38_4 then
						iter_38_4.color = Color.New(var_38_12, var_38_12, var_38_12)
					end
				end

				arg_35_1.var_.actorSpriteComps10061 = nil
			end

			local var_38_13 = 0
			local var_38_14 = 0.4

			if var_38_13 < arg_35_1.time_ and arg_35_1.time_ <= var_38_13 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_15 = arg_35_1:FormatText(StoryNameCfg[591].name)

				arg_35_1.leftNameTxt_.text = var_38_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_16 = arg_35_1:GetWordFromCfg(410021009)
				local var_38_17 = arg_35_1:FormatText(var_38_16.content)

				arg_35_1.text_.text = var_38_17

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_18 = 16
				local var_38_19 = utf8.len(var_38_17)
				local var_38_20 = var_38_18 <= 0 and var_38_14 or var_38_14 * (var_38_19 / var_38_18)

				if var_38_20 > 0 and var_38_14 < var_38_20 then
					arg_35_1.talkMaxDuration = var_38_20

					if var_38_20 + var_38_13 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_20 + var_38_13
					end
				end

				arg_35_1.text_.text = var_38_17
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021009", "story_v_out_410021.awb") ~= 0 then
					local var_38_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021009", "story_v_out_410021.awb") / 1000

					if var_38_21 + var_38_13 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_21 + var_38_13
					end

					if var_38_16.prefab_name ~= "" and arg_35_1.actors_[var_38_16.prefab_name] ~= nil then
						local var_38_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_16.prefab_name].transform, "story_v_out_410021", "410021009", "story_v_out_410021.awb")

						arg_35_1:RecordAudio("410021009", var_38_22)
						arg_35_1:RecordAudio("410021009", var_38_22)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_410021", "410021009", "story_v_out_410021.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_410021", "410021009", "story_v_out_410021.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_23 = math.max(var_38_14, arg_35_1.talkMaxDuration)

			if var_38_13 <= arg_35_1.time_ and arg_35_1.time_ < var_38_13 + var_38_23 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_13) / var_38_23

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_13 + var_38_23 and arg_35_1.time_ < var_38_13 + var_38_23 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play410021010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 410021010
		arg_39_1.duration_ = 4.733

		local var_39_0 = {
			zh = 2.6,
			ja = 4.733
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
				arg_39_0:Play410021011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10061"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos10061 = var_42_0.localPosition
				var_42_0.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("10061", 4)

				local var_42_2 = var_42_0.childCount

				for iter_42_0 = 0, var_42_2 - 1 do
					local var_42_3 = var_42_0:GetChild(iter_42_0)

					if var_42_3.name == "split_1" or not string.find(var_42_3.name, "split") then
						var_42_3.gameObject:SetActive(true)
					else
						var_42_3.gameObject:SetActive(false)
					end
				end
			end

			local var_42_4 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_4 then
				local var_42_5 = (arg_39_1.time_ - var_42_1) / var_42_4
				local var_42_6 = Vector3.New(390, -517.5, -100)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10061, var_42_6, var_42_5)
			end

			if arg_39_1.time_ >= var_42_1 + var_42_4 and arg_39_1.time_ < var_42_1 + var_42_4 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_42_7 = "1056"

			if arg_39_1.actors_[var_42_7] == nil then
				local var_42_8 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_42_7), arg_39_1.canvasGo_.transform)

				var_42_8.transform:SetSiblingIndex(1)

				var_42_8.name = var_42_7
				var_42_8.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_39_1.actors_[var_42_7] = var_42_8
			end

			local var_42_9 = arg_39_1.actors_["1056"].transform
			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1.var_.moveOldPos1056 = var_42_9.localPosition
				var_42_9.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("1056", 2)

				local var_42_11 = var_42_9.childCount

				for iter_42_1 = 0, var_42_11 - 1 do
					local var_42_12 = var_42_9:GetChild(iter_42_1)

					if var_42_12.name == "split_1" or not string.find(var_42_12.name, "split") then
						var_42_12.gameObject:SetActive(true)
					else
						var_42_12.gameObject:SetActive(false)
					end
				end
			end

			local var_42_13 = 0.001

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_13 then
				local var_42_14 = (arg_39_1.time_ - var_42_10) / var_42_13
				local var_42_15 = Vector3.New(-390, -350, -180)

				var_42_9.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1056, var_42_15, var_42_14)
			end

			if arg_39_1.time_ >= var_42_10 + var_42_13 and arg_39_1.time_ < var_42_10 + var_42_13 + arg_42_0 then
				var_42_9.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_42_16 = arg_39_1.actors_["10061"]
			local var_42_17 = 0

			if var_42_17 < arg_39_1.time_ and arg_39_1.time_ <= var_42_17 + arg_42_0 and arg_39_1.var_.actorSpriteComps10061 == nil then
				arg_39_1.var_.actorSpriteComps10061 = var_42_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_18 = 0.034

			if var_42_17 <= arg_39_1.time_ and arg_39_1.time_ < var_42_17 + var_42_18 then
				local var_42_19 = (arg_39_1.time_ - var_42_17) / var_42_18

				if arg_39_1.var_.actorSpriteComps10061 then
					for iter_42_2, iter_42_3 in pairs(arg_39_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_42_3 then
							local var_42_20 = Mathf.Lerp(iter_42_3.color.r, 0.5, var_42_19)

							iter_42_3.color = Color.New(var_42_20, var_42_20, var_42_20)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_17 + var_42_18 and arg_39_1.time_ < var_42_17 + var_42_18 + arg_42_0 and arg_39_1.var_.actorSpriteComps10061 then
				local var_42_21 = 0.5

				for iter_42_4, iter_42_5 in pairs(arg_39_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_42_5 then
						iter_42_5.color = Color.New(var_42_21, var_42_21, var_42_21)
					end
				end

				arg_39_1.var_.actorSpriteComps10061 = nil
			end

			local var_42_22 = arg_39_1.actors_["1056"]
			local var_42_23 = 0

			if var_42_23 < arg_39_1.time_ and arg_39_1.time_ <= var_42_23 + arg_42_0 and arg_39_1.var_.actorSpriteComps1056 == nil then
				arg_39_1.var_.actorSpriteComps1056 = var_42_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_24 = 0.034

			if var_42_23 <= arg_39_1.time_ and arg_39_1.time_ < var_42_23 + var_42_24 then
				local var_42_25 = (arg_39_1.time_ - var_42_23) / var_42_24

				if arg_39_1.var_.actorSpriteComps1056 then
					for iter_42_6, iter_42_7 in pairs(arg_39_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_42_7 then
							local var_42_26 = Mathf.Lerp(iter_42_7.color.r, 1, var_42_25)

							iter_42_7.color = Color.New(var_42_26, var_42_26, var_42_26)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_23 + var_42_24 and arg_39_1.time_ < var_42_23 + var_42_24 + arg_42_0 and arg_39_1.var_.actorSpriteComps1056 then
				local var_42_27 = 1

				for iter_42_8, iter_42_9 in pairs(arg_39_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_42_9 then
						iter_42_9.color = Color.New(var_42_27, var_42_27, var_42_27)
					end
				end

				arg_39_1.var_.actorSpriteComps1056 = nil
			end

			local var_42_28 = 0
			local var_42_29 = 0.25

			if var_42_28 < arg_39_1.time_ and arg_39_1.time_ <= var_42_28 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_30 = arg_39_1:FormatText(StoryNameCfg[605].name)

				arg_39_1.leftNameTxt_.text = var_42_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_31 = arg_39_1:GetWordFromCfg(410021010)
				local var_42_32 = arg_39_1:FormatText(var_42_31.content)

				arg_39_1.text_.text = var_42_32

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_33 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021010", "story_v_out_410021.awb") ~= 0 then
					local var_42_36 = manager.audio:GetVoiceLength("story_v_out_410021", "410021010", "story_v_out_410021.awb") / 1000

					if var_42_36 + var_42_28 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_36 + var_42_28
					end

					if var_42_31.prefab_name ~= "" and arg_39_1.actors_[var_42_31.prefab_name] ~= nil then
						local var_42_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_31.prefab_name].transform, "story_v_out_410021", "410021010", "story_v_out_410021.awb")

						arg_39_1:RecordAudio("410021010", var_42_37)
						arg_39_1:RecordAudio("410021010", var_42_37)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_410021", "410021010", "story_v_out_410021.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_410021", "410021010", "story_v_out_410021.awb")
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
	Play410021011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 410021011
		arg_43_1.duration_ = 10.733

		local var_43_0 = {
			zh = 4.733,
			ja = 10.733
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
				arg_43_0:Play410021012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1056"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.actorSpriteComps1056 == nil then
				arg_43_1.var_.actorSpriteComps1056 = var_46_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_2 = 0.034

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.actorSpriteComps1056 then
					for iter_46_0, iter_46_1 in pairs(arg_43_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_46_1 then
							local var_46_4 = Mathf.Lerp(iter_46_1.color.r, 0.5, var_46_3)

							iter_46_1.color = Color.New(var_46_4, var_46_4, var_46_4)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.actorSpriteComps1056 then
				local var_46_5 = 0.5

				for iter_46_2, iter_46_3 in pairs(arg_43_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_46_3 then
						iter_46_3.color = Color.New(var_46_5, var_46_5, var_46_5)
					end
				end

				arg_43_1.var_.actorSpriteComps1056 = nil
			end

			local var_46_6 = 0
			local var_46_7 = 0.35

			if var_46_6 < arg_43_1.time_ and arg_43_1.time_ <= var_46_6 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_8 = arg_43_1:FormatText(StoryNameCfg[606].name)

				arg_43_1.leftNameTxt_.text = var_46_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, true)
				arg_43_1.iconController_:SetSelectedState("hero")

				arg_43_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_lolic")

				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_9 = arg_43_1:GetWordFromCfg(410021011)
				local var_46_10 = arg_43_1:FormatText(var_46_9.content)

				arg_43_1.text_.text = var_46_10

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_11 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021011", "story_v_out_410021.awb") ~= 0 then
					local var_46_14 = manager.audio:GetVoiceLength("story_v_out_410021", "410021011", "story_v_out_410021.awb") / 1000

					if var_46_14 + var_46_6 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_14 + var_46_6
					end

					if var_46_9.prefab_name ~= "" and arg_43_1.actors_[var_46_9.prefab_name] ~= nil then
						local var_46_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_9.prefab_name].transform, "story_v_out_410021", "410021011", "story_v_out_410021.awb")

						arg_43_1:RecordAudio("410021011", var_46_15)
						arg_43_1:RecordAudio("410021011", var_46_15)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_410021", "410021011", "story_v_out_410021.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_410021", "410021011", "story_v_out_410021.awb")
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
	Play410021012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 410021012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play410021013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.975

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

				local var_50_2 = arg_47_1:GetWordFromCfg(410021012)
				local var_50_3 = arg_47_1:FormatText(var_50_2.content)

				arg_47_1.text_.text = var_50_3

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_4 = 39
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
	Play410021013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 410021013
		arg_51_1.duration_ = 3.6

		local var_51_0 = {
			zh = 3.6,
			ja = 3.133
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
				arg_51_0:Play410021014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.225

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[606].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_lolic")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(410021013)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021013", "story_v_out_410021.awb") ~= 0 then
					local var_54_8 = manager.audio:GetVoiceLength("story_v_out_410021", "410021013", "story_v_out_410021.awb") / 1000

					if var_54_8 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_0
					end

					if var_54_3.prefab_name ~= "" and arg_51_1.actors_[var_54_3.prefab_name] ~= nil then
						local var_54_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_3.prefab_name].transform, "story_v_out_410021", "410021013", "story_v_out_410021.awb")

						arg_51_1:RecordAudio("410021013", var_54_9)
						arg_51_1:RecordAudio("410021013", var_54_9)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_410021", "410021013", "story_v_out_410021.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_410021", "410021013", "story_v_out_410021.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_10 = math.max(var_54_1, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_10 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_0) / var_54_10

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_10 and arg_51_1.time_ < var_54_0 + var_54_10 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play410021014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 410021014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play410021015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1056"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1056 = var_58_0.localPosition
				var_58_0.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("1056", 7)

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
				local var_58_6 = Vector3.New(0, -2000, -180)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1056, var_58_6, var_58_5)
			end

			if arg_55_1.time_ >= var_58_1 + var_58_4 and arg_55_1.time_ < var_58_1 + var_58_4 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_58_7 = arg_55_1.actors_["10061"].transform
			local var_58_8 = 0

			if var_58_8 < arg_55_1.time_ and arg_55_1.time_ <= var_58_8 + arg_58_0 then
				arg_55_1.var_.moveOldPos10061 = var_58_7.localPosition
				var_58_7.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("10061", 7)

				local var_58_9 = var_58_7.childCount

				for iter_58_1 = 0, var_58_9 - 1 do
					local var_58_10 = var_58_7:GetChild(iter_58_1)

					if var_58_10.name == "" or not string.find(var_58_10.name, "split") then
						var_58_10.gameObject:SetActive(true)
					else
						var_58_10.gameObject:SetActive(false)
					end
				end
			end

			local var_58_11 = 0.001

			if var_58_8 <= arg_55_1.time_ and arg_55_1.time_ < var_58_8 + var_58_11 then
				local var_58_12 = (arg_55_1.time_ - var_58_8) / var_58_11
				local var_58_13 = Vector3.New(0, -2000, -100)

				var_58_7.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos10061, var_58_13, var_58_12)
			end

			if arg_55_1.time_ >= var_58_8 + var_58_11 and arg_55_1.time_ < var_58_8 + var_58_11 + arg_58_0 then
				var_58_7.localPosition = Vector3.New(0, -2000, -100)
			end

			local var_58_14 = arg_55_1.actors_["1056"]
			local var_58_15 = 0

			if var_58_15 < arg_55_1.time_ and arg_55_1.time_ <= var_58_15 + arg_58_0 and arg_55_1.var_.actorSpriteComps1056 == nil then
				arg_55_1.var_.actorSpriteComps1056 = var_58_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_16 = 0.034

			if var_58_15 <= arg_55_1.time_ and arg_55_1.time_ < var_58_15 + var_58_16 then
				local var_58_17 = (arg_55_1.time_ - var_58_15) / var_58_16

				if arg_55_1.var_.actorSpriteComps1056 then
					for iter_58_2, iter_58_3 in pairs(arg_55_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_58_3 then
							local var_58_18 = Mathf.Lerp(iter_58_3.color.r, 0.5, var_58_17)

							iter_58_3.color = Color.New(var_58_18, var_58_18, var_58_18)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_15 + var_58_16 and arg_55_1.time_ < var_58_15 + var_58_16 + arg_58_0 and arg_55_1.var_.actorSpriteComps1056 then
				local var_58_19 = 0.5

				for iter_58_4, iter_58_5 in pairs(arg_55_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_58_5 then
						iter_58_5.color = Color.New(var_58_19, var_58_19, var_58_19)
					end
				end

				arg_55_1.var_.actorSpriteComps1056 = nil
			end

			local var_58_20 = arg_55_1.actors_["10061"]
			local var_58_21 = 0

			if var_58_21 < arg_55_1.time_ and arg_55_1.time_ <= var_58_21 + arg_58_0 and arg_55_1.var_.actorSpriteComps10061 == nil then
				arg_55_1.var_.actorSpriteComps10061 = var_58_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_22 = 0.034

			if var_58_21 <= arg_55_1.time_ and arg_55_1.time_ < var_58_21 + var_58_22 then
				local var_58_23 = (arg_55_1.time_ - var_58_21) / var_58_22

				if arg_55_1.var_.actorSpriteComps10061 then
					for iter_58_6, iter_58_7 in pairs(arg_55_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_58_7 then
							local var_58_24 = Mathf.Lerp(iter_58_7.color.r, 0.5, var_58_23)

							iter_58_7.color = Color.New(var_58_24, var_58_24, var_58_24)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_21 + var_58_22 and arg_55_1.time_ < var_58_21 + var_58_22 + arg_58_0 and arg_55_1.var_.actorSpriteComps10061 then
				local var_58_25 = 0.5

				for iter_58_8, iter_58_9 in pairs(arg_55_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_58_9 then
						iter_58_9.color = Color.New(var_58_25, var_58_25, var_58_25)
					end
				end

				arg_55_1.var_.actorSpriteComps10061 = nil
			end

			local var_58_26 = 0
			local var_58_27 = 1.75

			if var_58_26 < arg_55_1.time_ and arg_55_1.time_ <= var_58_26 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_28 = arg_55_1:GetWordFromCfg(410021014)
				local var_58_29 = arg_55_1:FormatText(var_58_28.content)

				arg_55_1.text_.text = var_58_29

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_30 = 70
				local var_58_31 = utf8.len(var_58_29)
				local var_58_32 = var_58_30 <= 0 and var_58_27 or var_58_27 * (var_58_31 / var_58_30)

				if var_58_32 > 0 and var_58_27 < var_58_32 then
					arg_55_1.talkMaxDuration = var_58_32

					if var_58_32 + var_58_26 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_32 + var_58_26
					end
				end

				arg_55_1.text_.text = var_58_29
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_33 = math.max(var_58_27, arg_55_1.talkMaxDuration)

			if var_58_26 <= arg_55_1.time_ and arg_55_1.time_ < var_58_26 + var_58_33 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_26) / var_58_33

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_26 + var_58_33 and arg_55_1.time_ < var_58_26 + var_58_33 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play410021015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 410021015
		arg_59_1.duration_ = 12.8

		local var_59_0 = {
			zh = 6.2,
			ja = 12.8
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
				arg_59_0:Play410021016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = "1060"

			if arg_59_1.actors_[var_62_0] == nil then
				local var_62_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_62_0), arg_59_1.canvasGo_.transform)

				var_62_1.transform:SetSiblingIndex(1)

				var_62_1.name = var_62_0
				var_62_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_59_1.actors_[var_62_0] = var_62_1
			end

			local var_62_2 = arg_59_1.actors_["1060"].transform
			local var_62_3 = 0

			if var_62_3 < arg_59_1.time_ and arg_59_1.time_ <= var_62_3 + arg_62_0 then
				arg_59_1.var_.moveOldPos1060 = var_62_2.localPosition
				var_62_2.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("1060", 2)

				local var_62_4 = var_62_2.childCount

				for iter_62_0 = 0, var_62_4 - 1 do
					local var_62_5 = var_62_2:GetChild(iter_62_0)

					if var_62_5.name == "" or not string.find(var_62_5.name, "split") then
						var_62_5.gameObject:SetActive(true)
					else
						var_62_5.gameObject:SetActive(false)
					end
				end
			end

			local var_62_6 = 0.001

			if var_62_3 <= arg_59_1.time_ and arg_59_1.time_ < var_62_3 + var_62_6 then
				local var_62_7 = (arg_59_1.time_ - var_62_3) / var_62_6
				local var_62_8 = Vector3.New(-390, -435, -40)

				var_62_2.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1060, var_62_8, var_62_7)
			end

			if arg_59_1.time_ >= var_62_3 + var_62_6 and arg_59_1.time_ < var_62_3 + var_62_6 + arg_62_0 then
				var_62_2.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_62_9 = arg_59_1.actors_["1060"]
			local var_62_10 = 0

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 and arg_59_1.var_.actorSpriteComps1060 == nil then
				arg_59_1.var_.actorSpriteComps1060 = var_62_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_11 = 0.034

			if var_62_10 <= arg_59_1.time_ and arg_59_1.time_ < var_62_10 + var_62_11 then
				local var_62_12 = (arg_59_1.time_ - var_62_10) / var_62_11

				if arg_59_1.var_.actorSpriteComps1060 then
					for iter_62_1, iter_62_2 in pairs(arg_59_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_62_2 then
							local var_62_13 = Mathf.Lerp(iter_62_2.color.r, 1, var_62_12)

							iter_62_2.color = Color.New(var_62_13, var_62_13, var_62_13)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_10 + var_62_11 and arg_59_1.time_ < var_62_10 + var_62_11 + arg_62_0 and arg_59_1.var_.actorSpriteComps1060 then
				local var_62_14 = 1

				for iter_62_3, iter_62_4 in pairs(arg_59_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_62_4 then
						iter_62_4.color = Color.New(var_62_14, var_62_14, var_62_14)
					end
				end

				arg_59_1.var_.actorSpriteComps1060 = nil
			end

			local var_62_15 = arg_59_1.actors_["1056"].transform
			local var_62_16 = 0

			if var_62_16 < arg_59_1.time_ and arg_59_1.time_ <= var_62_16 + arg_62_0 then
				arg_59_1.var_.moveOldPos1056 = var_62_15.localPosition
				var_62_15.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("1056", 4)

				local var_62_17 = var_62_15.childCount

				for iter_62_5 = 0, var_62_17 - 1 do
					local var_62_18 = var_62_15:GetChild(iter_62_5)

					if var_62_18.name == "" or not string.find(var_62_18.name, "split") then
						var_62_18.gameObject:SetActive(true)
					else
						var_62_18.gameObject:SetActive(false)
					end
				end
			end

			local var_62_19 = 0.001

			if var_62_16 <= arg_59_1.time_ and arg_59_1.time_ < var_62_16 + var_62_19 then
				local var_62_20 = (arg_59_1.time_ - var_62_16) / var_62_19
				local var_62_21 = Vector3.New(390, -350, -180)

				var_62_15.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1056, var_62_21, var_62_20)
			end

			if arg_59_1.time_ >= var_62_16 + var_62_19 and arg_59_1.time_ < var_62_16 + var_62_19 + arg_62_0 then
				var_62_15.localPosition = Vector3.New(390, -350, -180)
			end

			local var_62_22 = arg_59_1.actors_["1056"]
			local var_62_23 = 0

			if var_62_23 < arg_59_1.time_ and arg_59_1.time_ <= var_62_23 + arg_62_0 and arg_59_1.var_.actorSpriteComps1056 == nil then
				arg_59_1.var_.actorSpriteComps1056 = var_62_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_24 = 0.034

			if var_62_23 <= arg_59_1.time_ and arg_59_1.time_ < var_62_23 + var_62_24 then
				local var_62_25 = (arg_59_1.time_ - var_62_23) / var_62_24

				if arg_59_1.var_.actorSpriteComps1056 then
					for iter_62_6, iter_62_7 in pairs(arg_59_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_62_7 then
							local var_62_26 = Mathf.Lerp(iter_62_7.color.r, 0.5, var_62_25)

							iter_62_7.color = Color.New(var_62_26, var_62_26, var_62_26)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_23 + var_62_24 and arg_59_1.time_ < var_62_23 + var_62_24 + arg_62_0 and arg_59_1.var_.actorSpriteComps1056 then
				local var_62_27 = 0.5

				for iter_62_8, iter_62_9 in pairs(arg_59_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_62_9 then
						iter_62_9.color = Color.New(var_62_27, var_62_27, var_62_27)
					end
				end

				arg_59_1.var_.actorSpriteComps1056 = nil
			end

			local var_62_28 = 0
			local var_62_29 = 0.675

			if var_62_28 < arg_59_1.time_ and arg_59_1.time_ <= var_62_28 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_30 = arg_59_1:FormatText(StoryNameCfg[584].name)

				arg_59_1.leftNameTxt_.text = var_62_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_31 = arg_59_1:GetWordFromCfg(410021015)
				local var_62_32 = arg_59_1:FormatText(var_62_31.content)

				arg_59_1.text_.text = var_62_32

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_33 = 27
				local var_62_34 = utf8.len(var_62_32)
				local var_62_35 = var_62_33 <= 0 and var_62_29 or var_62_29 * (var_62_34 / var_62_33)

				if var_62_35 > 0 and var_62_29 < var_62_35 then
					arg_59_1.talkMaxDuration = var_62_35

					if var_62_35 + var_62_28 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_35 + var_62_28
					end
				end

				arg_59_1.text_.text = var_62_32
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021015", "story_v_out_410021.awb") ~= 0 then
					local var_62_36 = manager.audio:GetVoiceLength("story_v_out_410021", "410021015", "story_v_out_410021.awb") / 1000

					if var_62_36 + var_62_28 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_36 + var_62_28
					end

					if var_62_31.prefab_name ~= "" and arg_59_1.actors_[var_62_31.prefab_name] ~= nil then
						local var_62_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_31.prefab_name].transform, "story_v_out_410021", "410021015", "story_v_out_410021.awb")

						arg_59_1:RecordAudio("410021015", var_62_37)
						arg_59_1:RecordAudio("410021015", var_62_37)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_410021", "410021015", "story_v_out_410021.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_410021", "410021015", "story_v_out_410021.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_38 = math.max(var_62_29, arg_59_1.talkMaxDuration)

			if var_62_28 <= arg_59_1.time_ and arg_59_1.time_ < var_62_28 + var_62_38 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_28) / var_62_38

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_28 + var_62_38 and arg_59_1.time_ < var_62_28 + var_62_38 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play410021016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 410021016
		arg_63_1.duration_ = 14.666

		local var_63_0 = {
			zh = 6.533,
			ja = 14.666
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
				arg_63_0:Play410021017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1056"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1056 = var_66_0.localPosition
				var_66_0.localScale = Vector3.New(1, 1, 1)

				arg_63_1:CheckSpriteTmpPos("1056", 4)

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
				local var_66_6 = Vector3.New(390, -350, -180)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1056, var_66_6, var_66_5)
			end

			if arg_63_1.time_ >= var_66_1 + var_66_4 and arg_63_1.time_ < var_66_1 + var_66_4 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_66_7 = arg_63_1.actors_["1056"]
			local var_66_8 = 0

			if var_66_8 < arg_63_1.time_ and arg_63_1.time_ <= var_66_8 + arg_66_0 and arg_63_1.var_.actorSpriteComps1056 == nil then
				arg_63_1.var_.actorSpriteComps1056 = var_66_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_9 = 0.034

			if var_66_8 <= arg_63_1.time_ and arg_63_1.time_ < var_66_8 + var_66_9 then
				local var_66_10 = (arg_63_1.time_ - var_66_8) / var_66_9

				if arg_63_1.var_.actorSpriteComps1056 then
					for iter_66_1, iter_66_2 in pairs(arg_63_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_66_2 then
							local var_66_11 = Mathf.Lerp(iter_66_2.color.r, 1, var_66_10)

							iter_66_2.color = Color.New(var_66_11, var_66_11, var_66_11)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_8 + var_66_9 and arg_63_1.time_ < var_66_8 + var_66_9 + arg_66_0 and arg_63_1.var_.actorSpriteComps1056 then
				local var_66_12 = 1

				for iter_66_3, iter_66_4 in pairs(arg_63_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_66_4 then
						iter_66_4.color = Color.New(var_66_12, var_66_12, var_66_12)
					end
				end

				arg_63_1.var_.actorSpriteComps1056 = nil
			end

			local var_66_13 = arg_63_1.actors_["1060"]
			local var_66_14 = 0

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 and arg_63_1.var_.actorSpriteComps1060 == nil then
				arg_63_1.var_.actorSpriteComps1060 = var_66_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_15 = 0.034

			if var_66_14 <= arg_63_1.time_ and arg_63_1.time_ < var_66_14 + var_66_15 then
				local var_66_16 = (arg_63_1.time_ - var_66_14) / var_66_15

				if arg_63_1.var_.actorSpriteComps1060 then
					for iter_66_5, iter_66_6 in pairs(arg_63_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_66_6 then
							local var_66_17 = Mathf.Lerp(iter_66_6.color.r, 0.5, var_66_16)

							iter_66_6.color = Color.New(var_66_17, var_66_17, var_66_17)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_14 + var_66_15 and arg_63_1.time_ < var_66_14 + var_66_15 + arg_66_0 and arg_63_1.var_.actorSpriteComps1060 then
				local var_66_18 = 0.5

				for iter_66_7, iter_66_8 in pairs(arg_63_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_66_8 then
						iter_66_8.color = Color.New(var_66_18, var_66_18, var_66_18)
					end
				end

				arg_63_1.var_.actorSpriteComps1060 = nil
			end

			local var_66_19 = 0
			local var_66_20 = 0.7

			if var_66_19 < arg_63_1.time_ and arg_63_1.time_ <= var_66_19 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_21 = arg_63_1:FormatText(StoryNameCfg[605].name)

				arg_63_1.leftNameTxt_.text = var_66_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_22 = arg_63_1:GetWordFromCfg(410021016)
				local var_66_23 = arg_63_1:FormatText(var_66_22.content)

				arg_63_1.text_.text = var_66_23

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_24 = 28
				local var_66_25 = utf8.len(var_66_23)
				local var_66_26 = var_66_24 <= 0 and var_66_20 or var_66_20 * (var_66_25 / var_66_24)

				if var_66_26 > 0 and var_66_20 < var_66_26 then
					arg_63_1.talkMaxDuration = var_66_26

					if var_66_26 + var_66_19 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_26 + var_66_19
					end
				end

				arg_63_1.text_.text = var_66_23
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021016", "story_v_out_410021.awb") ~= 0 then
					local var_66_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021016", "story_v_out_410021.awb") / 1000

					if var_66_27 + var_66_19 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_27 + var_66_19
					end

					if var_66_22.prefab_name ~= "" and arg_63_1.actors_[var_66_22.prefab_name] ~= nil then
						local var_66_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_22.prefab_name].transform, "story_v_out_410021", "410021016", "story_v_out_410021.awb")

						arg_63_1:RecordAudio("410021016", var_66_28)
						arg_63_1:RecordAudio("410021016", var_66_28)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_410021", "410021016", "story_v_out_410021.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_410021", "410021016", "story_v_out_410021.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_29 = math.max(var_66_20, arg_63_1.talkMaxDuration)

			if var_66_19 <= arg_63_1.time_ and arg_63_1.time_ < var_66_19 + var_66_29 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_19) / var_66_29

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_19 + var_66_29 and arg_63_1.time_ < var_66_19 + var_66_29 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play410021017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 410021017
		arg_67_1.duration_ = 11

		local var_67_0 = {
			zh = 10.7,
			ja = 11
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
				arg_67_0:Play410021018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1056"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1056 = var_70_0.localPosition
				var_70_0.localScale = Vector3.New(1, 1, 1)

				arg_67_1:CheckSpriteTmpPos("1056", 4)

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
				local var_70_6 = Vector3.New(390, -350, -180)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1056, var_70_6, var_70_5)
			end

			if arg_67_1.time_ >= var_70_1 + var_70_4 and arg_67_1.time_ < var_70_1 + var_70_4 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_70_7 = arg_67_1.actors_["1056"]
			local var_70_8 = 0

			if var_70_8 < arg_67_1.time_ and arg_67_1.time_ <= var_70_8 + arg_70_0 and arg_67_1.var_.actorSpriteComps1056 == nil then
				arg_67_1.var_.actorSpriteComps1056 = var_70_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_9 = 0.034

			if var_70_8 <= arg_67_1.time_ and arg_67_1.time_ < var_70_8 + var_70_9 then
				local var_70_10 = (arg_67_1.time_ - var_70_8) / var_70_9

				if arg_67_1.var_.actorSpriteComps1056 then
					for iter_70_1, iter_70_2 in pairs(arg_67_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_70_2 then
							local var_70_11 = Mathf.Lerp(iter_70_2.color.r, 1, var_70_10)

							iter_70_2.color = Color.New(var_70_11, var_70_11, var_70_11)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_8 + var_70_9 and arg_67_1.time_ < var_70_8 + var_70_9 + arg_70_0 and arg_67_1.var_.actorSpriteComps1056 then
				local var_70_12 = 1

				for iter_70_3, iter_70_4 in pairs(arg_67_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_70_4 then
						iter_70_4.color = Color.New(var_70_12, var_70_12, var_70_12)
					end
				end

				arg_67_1.var_.actorSpriteComps1056 = nil
			end

			local var_70_13 = 0
			local var_70_14 = 1.3

			if var_70_13 < arg_67_1.time_ and arg_67_1.time_ <= var_70_13 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_15 = arg_67_1:FormatText(StoryNameCfg[605].name)

				arg_67_1.leftNameTxt_.text = var_70_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_16 = arg_67_1:GetWordFromCfg(410021017)
				local var_70_17 = arg_67_1:FormatText(var_70_16.content)

				arg_67_1.text_.text = var_70_17

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_18 = 52
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

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021017", "story_v_out_410021.awb") ~= 0 then
					local var_70_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021017", "story_v_out_410021.awb") / 1000

					if var_70_21 + var_70_13 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_21 + var_70_13
					end

					if var_70_16.prefab_name ~= "" and arg_67_1.actors_[var_70_16.prefab_name] ~= nil then
						local var_70_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_16.prefab_name].transform, "story_v_out_410021", "410021017", "story_v_out_410021.awb")

						arg_67_1:RecordAudio("410021017", var_70_22)
						arg_67_1:RecordAudio("410021017", var_70_22)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_410021", "410021017", "story_v_out_410021.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_410021", "410021017", "story_v_out_410021.awb")
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
	Play410021018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 410021018
		arg_71_1.duration_ = 11.4

		local var_71_0 = {
			zh = 7.3,
			ja = 11.4
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
				arg_71_0:Play410021019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1056"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1056 = var_74_0.localPosition
				var_74_0.localScale = Vector3.New(1, 1, 1)

				arg_71_1:CheckSpriteTmpPos("1056", 4)

				local var_74_2 = var_74_0.childCount

				for iter_74_0 = 0, var_74_2 - 1 do
					local var_74_3 = var_74_0:GetChild(iter_74_0)

					if var_74_3.name == "split_3" or not string.find(var_74_3.name, "split") then
						var_74_3.gameObject:SetActive(true)
					else
						var_74_3.gameObject:SetActive(false)
					end
				end
			end

			local var_74_4 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_4 then
				local var_74_5 = (arg_71_1.time_ - var_74_1) / var_74_4
				local var_74_6 = Vector3.New(390, -350, -180)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1056, var_74_6, var_74_5)
			end

			if arg_71_1.time_ >= var_74_1 + var_74_4 and arg_71_1.time_ < var_74_1 + var_74_4 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_74_7 = arg_71_1.actors_["1056"]
			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 and arg_71_1.var_.actorSpriteComps1056 == nil then
				arg_71_1.var_.actorSpriteComps1056 = var_74_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_9 = 0.034

			if var_74_8 <= arg_71_1.time_ and arg_71_1.time_ < var_74_8 + var_74_9 then
				local var_74_10 = (arg_71_1.time_ - var_74_8) / var_74_9

				if arg_71_1.var_.actorSpriteComps1056 then
					for iter_74_1, iter_74_2 in pairs(arg_71_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_74_2 then
							local var_74_11 = Mathf.Lerp(iter_74_2.color.r, 1, var_74_10)

							iter_74_2.color = Color.New(var_74_11, var_74_11, var_74_11)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_8 + var_74_9 and arg_71_1.time_ < var_74_8 + var_74_9 + arg_74_0 and arg_71_1.var_.actorSpriteComps1056 then
				local var_74_12 = 1

				for iter_74_3, iter_74_4 in pairs(arg_71_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_74_4 then
						iter_74_4.color = Color.New(var_74_12, var_74_12, var_74_12)
					end
				end

				arg_71_1.var_.actorSpriteComps1056 = nil
			end

			local var_74_13 = 0
			local var_74_14 = 0.925

			if var_74_13 < arg_71_1.time_ and arg_71_1.time_ <= var_74_13 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_15 = arg_71_1:FormatText(StoryNameCfg[605].name)

				arg_71_1.leftNameTxt_.text = var_74_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_16 = arg_71_1:GetWordFromCfg(410021018)
				local var_74_17 = arg_71_1:FormatText(var_74_16.content)

				arg_71_1.text_.text = var_74_17

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_18 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021018", "story_v_out_410021.awb") ~= 0 then
					local var_74_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021018", "story_v_out_410021.awb") / 1000

					if var_74_21 + var_74_13 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_21 + var_74_13
					end

					if var_74_16.prefab_name ~= "" and arg_71_1.actors_[var_74_16.prefab_name] ~= nil then
						local var_74_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_16.prefab_name].transform, "story_v_out_410021", "410021018", "story_v_out_410021.awb")

						arg_71_1:RecordAudio("410021018", var_74_22)
						arg_71_1:RecordAudio("410021018", var_74_22)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_410021", "410021018", "story_v_out_410021.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_410021", "410021018", "story_v_out_410021.awb")
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
	Play410021019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 410021019
		arg_75_1.duration_ = 13.966

		local var_75_0 = {
			zh = 7.333,
			ja = 13.966
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
				arg_75_0:Play410021020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1060"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1060 = var_78_0.localPosition
				var_78_0.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("1060", 2)

				local var_78_2 = var_78_0.childCount

				for iter_78_0 = 0, var_78_2 - 1 do
					local var_78_3 = var_78_0:GetChild(iter_78_0)

					if var_78_3.name == "" or not string.find(var_78_3.name, "split") then
						var_78_3.gameObject:SetActive(true)
					else
						var_78_3.gameObject:SetActive(false)
					end
				end
			end

			local var_78_4 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_4 then
				local var_78_5 = (arg_75_1.time_ - var_78_1) / var_78_4
				local var_78_6 = Vector3.New(-390, -435, -40)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1060, var_78_6, var_78_5)
			end

			if arg_75_1.time_ >= var_78_1 + var_78_4 and arg_75_1.time_ < var_78_1 + var_78_4 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_78_7 = arg_75_1.actors_["1060"]
			local var_78_8 = 0

			if var_78_8 < arg_75_1.time_ and arg_75_1.time_ <= var_78_8 + arg_78_0 and arg_75_1.var_.actorSpriteComps1060 == nil then
				arg_75_1.var_.actorSpriteComps1060 = var_78_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_9 = 0.034

			if var_78_8 <= arg_75_1.time_ and arg_75_1.time_ < var_78_8 + var_78_9 then
				local var_78_10 = (arg_75_1.time_ - var_78_8) / var_78_9

				if arg_75_1.var_.actorSpriteComps1060 then
					for iter_78_1, iter_78_2 in pairs(arg_75_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_78_2 then
							local var_78_11 = Mathf.Lerp(iter_78_2.color.r, 1, var_78_10)

							iter_78_2.color = Color.New(var_78_11, var_78_11, var_78_11)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_8 + var_78_9 and arg_75_1.time_ < var_78_8 + var_78_9 + arg_78_0 and arg_75_1.var_.actorSpriteComps1060 then
				local var_78_12 = 1

				for iter_78_3, iter_78_4 in pairs(arg_75_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_78_4 then
						iter_78_4.color = Color.New(var_78_12, var_78_12, var_78_12)
					end
				end

				arg_75_1.var_.actorSpriteComps1060 = nil
			end

			local var_78_13 = arg_75_1.actors_["1056"]
			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 and arg_75_1.var_.actorSpriteComps1056 == nil then
				arg_75_1.var_.actorSpriteComps1056 = var_78_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_15 = 0.034

			if var_78_14 <= arg_75_1.time_ and arg_75_1.time_ < var_78_14 + var_78_15 then
				local var_78_16 = (arg_75_1.time_ - var_78_14) / var_78_15

				if arg_75_1.var_.actorSpriteComps1056 then
					for iter_78_5, iter_78_6 in pairs(arg_75_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_78_6 then
							local var_78_17 = Mathf.Lerp(iter_78_6.color.r, 0.5, var_78_16)

							iter_78_6.color = Color.New(var_78_17, var_78_17, var_78_17)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_14 + var_78_15 and arg_75_1.time_ < var_78_14 + var_78_15 + arg_78_0 and arg_75_1.var_.actorSpriteComps1056 then
				local var_78_18 = 0.5

				for iter_78_7, iter_78_8 in pairs(arg_75_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_78_8 then
						iter_78_8.color = Color.New(var_78_18, var_78_18, var_78_18)
					end
				end

				arg_75_1.var_.actorSpriteComps1056 = nil
			end

			local var_78_19 = 0
			local var_78_20 = 0.95

			if var_78_19 < arg_75_1.time_ and arg_75_1.time_ <= var_78_19 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_21 = arg_75_1:FormatText(StoryNameCfg[584].name)

				arg_75_1.leftNameTxt_.text = var_78_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_22 = arg_75_1:GetWordFromCfg(410021019)
				local var_78_23 = arg_75_1:FormatText(var_78_22.content)

				arg_75_1.text_.text = var_78_23

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_24 = 38
				local var_78_25 = utf8.len(var_78_23)
				local var_78_26 = var_78_24 <= 0 and var_78_20 or var_78_20 * (var_78_25 / var_78_24)

				if var_78_26 > 0 and var_78_20 < var_78_26 then
					arg_75_1.talkMaxDuration = var_78_26

					if var_78_26 + var_78_19 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_26 + var_78_19
					end
				end

				arg_75_1.text_.text = var_78_23
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021019", "story_v_out_410021.awb") ~= 0 then
					local var_78_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021019", "story_v_out_410021.awb") / 1000

					if var_78_27 + var_78_19 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_27 + var_78_19
					end

					if var_78_22.prefab_name ~= "" and arg_75_1.actors_[var_78_22.prefab_name] ~= nil then
						local var_78_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_22.prefab_name].transform, "story_v_out_410021", "410021019", "story_v_out_410021.awb")

						arg_75_1:RecordAudio("410021019", var_78_28)
						arg_75_1:RecordAudio("410021019", var_78_28)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_410021", "410021019", "story_v_out_410021.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_410021", "410021019", "story_v_out_410021.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_29 = math.max(var_78_20, arg_75_1.talkMaxDuration)

			if var_78_19 <= arg_75_1.time_ and arg_75_1.time_ < var_78_19 + var_78_29 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_19) / var_78_29

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_19 + var_78_29 and arg_75_1.time_ < var_78_19 + var_78_29 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play410021020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 410021020
		arg_79_1.duration_ = 10.9

		local var_79_0 = {
			zh = 10.9,
			ja = 9.633
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
				arg_79_0:Play410021021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1056"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1056 = var_82_0.localPosition
				var_82_0.localScale = Vector3.New(1, 1, 1)

				arg_79_1:CheckSpriteTmpPos("1056", 4)

				local var_82_2 = var_82_0.childCount

				for iter_82_0 = 0, var_82_2 - 1 do
					local var_82_3 = var_82_0:GetChild(iter_82_0)

					if var_82_3.name == "" or not string.find(var_82_3.name, "split") then
						var_82_3.gameObject:SetActive(true)
					else
						var_82_3.gameObject:SetActive(false)
					end
				end
			end

			local var_82_4 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_4 then
				local var_82_5 = (arg_79_1.time_ - var_82_1) / var_82_4
				local var_82_6 = Vector3.New(390, -350, -180)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1056, var_82_6, var_82_5)
			end

			if arg_79_1.time_ >= var_82_1 + var_82_4 and arg_79_1.time_ < var_82_1 + var_82_4 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_82_7 = arg_79_1.actors_["1056"]
			local var_82_8 = 0

			if var_82_8 < arg_79_1.time_ and arg_79_1.time_ <= var_82_8 + arg_82_0 and arg_79_1.var_.actorSpriteComps1056 == nil then
				arg_79_1.var_.actorSpriteComps1056 = var_82_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_9 = 0.034

			if var_82_8 <= arg_79_1.time_ and arg_79_1.time_ < var_82_8 + var_82_9 then
				local var_82_10 = (arg_79_1.time_ - var_82_8) / var_82_9

				if arg_79_1.var_.actorSpriteComps1056 then
					for iter_82_1, iter_82_2 in pairs(arg_79_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_82_2 then
							local var_82_11 = Mathf.Lerp(iter_82_2.color.r, 1, var_82_10)

							iter_82_2.color = Color.New(var_82_11, var_82_11, var_82_11)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_8 + var_82_9 and arg_79_1.time_ < var_82_8 + var_82_9 + arg_82_0 and arg_79_1.var_.actorSpriteComps1056 then
				local var_82_12 = 1

				for iter_82_3, iter_82_4 in pairs(arg_79_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_82_4 then
						iter_82_4.color = Color.New(var_82_12, var_82_12, var_82_12)
					end
				end

				arg_79_1.var_.actorSpriteComps1056 = nil
			end

			local var_82_13 = arg_79_1.actors_["1060"]
			local var_82_14 = 0

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 and arg_79_1.var_.actorSpriteComps1060 == nil then
				arg_79_1.var_.actorSpriteComps1060 = var_82_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_15 = 0.034

			if var_82_14 <= arg_79_1.time_ and arg_79_1.time_ < var_82_14 + var_82_15 then
				local var_82_16 = (arg_79_1.time_ - var_82_14) / var_82_15

				if arg_79_1.var_.actorSpriteComps1060 then
					for iter_82_5, iter_82_6 in pairs(arg_79_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_82_6 then
							local var_82_17 = Mathf.Lerp(iter_82_6.color.r, 0.5, var_82_16)

							iter_82_6.color = Color.New(var_82_17, var_82_17, var_82_17)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_14 + var_82_15 and arg_79_1.time_ < var_82_14 + var_82_15 + arg_82_0 and arg_79_1.var_.actorSpriteComps1060 then
				local var_82_18 = 0.5

				for iter_82_7, iter_82_8 in pairs(arg_79_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_82_8 then
						iter_82_8.color = Color.New(var_82_18, var_82_18, var_82_18)
					end
				end

				arg_79_1.var_.actorSpriteComps1060 = nil
			end

			local var_82_19 = 0
			local var_82_20 = 1.3

			if var_82_19 < arg_79_1.time_ and arg_79_1.time_ <= var_82_19 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_21 = arg_79_1:FormatText(StoryNameCfg[605].name)

				arg_79_1.leftNameTxt_.text = var_82_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_22 = arg_79_1:GetWordFromCfg(410021020)
				local var_82_23 = arg_79_1:FormatText(var_82_22.content)

				arg_79_1.text_.text = var_82_23

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_24 = 52
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

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021020", "story_v_out_410021.awb") ~= 0 then
					local var_82_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021020", "story_v_out_410021.awb") / 1000

					if var_82_27 + var_82_19 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_27 + var_82_19
					end

					if var_82_22.prefab_name ~= "" and arg_79_1.actors_[var_82_22.prefab_name] ~= nil then
						local var_82_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_22.prefab_name].transform, "story_v_out_410021", "410021020", "story_v_out_410021.awb")

						arg_79_1:RecordAudio("410021020", var_82_28)
						arg_79_1:RecordAudio("410021020", var_82_28)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_410021", "410021020", "story_v_out_410021.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_410021", "410021020", "story_v_out_410021.awb")
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
	Play410021021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 410021021
		arg_83_1.duration_ = 13.866

		local var_83_0 = {
			zh = 11.466,
			ja = 13.866
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
				arg_83_0:Play410021022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1056"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1056 = var_86_0.localPosition
				var_86_0.localScale = Vector3.New(1, 1, 1)

				arg_83_1:CheckSpriteTmpPos("1056", 4)

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
				local var_86_6 = Vector3.New(390, -350, -180)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1056, var_86_6, var_86_5)
			end

			if arg_83_1.time_ >= var_86_1 + var_86_4 and arg_83_1.time_ < var_86_1 + var_86_4 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_86_7 = arg_83_1.actors_["1056"]
			local var_86_8 = 0

			if var_86_8 < arg_83_1.time_ and arg_83_1.time_ <= var_86_8 + arg_86_0 and arg_83_1.var_.actorSpriteComps1056 == nil then
				arg_83_1.var_.actorSpriteComps1056 = var_86_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_9 = 0.034

			if var_86_8 <= arg_83_1.time_ and arg_83_1.time_ < var_86_8 + var_86_9 then
				local var_86_10 = (arg_83_1.time_ - var_86_8) / var_86_9

				if arg_83_1.var_.actorSpriteComps1056 then
					for iter_86_1, iter_86_2 in pairs(arg_83_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_86_2 then
							local var_86_11 = Mathf.Lerp(iter_86_2.color.r, 1, var_86_10)

							iter_86_2.color = Color.New(var_86_11, var_86_11, var_86_11)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_8 + var_86_9 and arg_83_1.time_ < var_86_8 + var_86_9 + arg_86_0 and arg_83_1.var_.actorSpriteComps1056 then
				local var_86_12 = 1

				for iter_86_3, iter_86_4 in pairs(arg_83_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_86_4 then
						iter_86_4.color = Color.New(var_86_12, var_86_12, var_86_12)
					end
				end

				arg_83_1.var_.actorSpriteComps1056 = nil
			end

			local var_86_13 = 0
			local var_86_14 = 1.4

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_15 = arg_83_1:FormatText(StoryNameCfg[605].name)

				arg_83_1.leftNameTxt_.text = var_86_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_16 = arg_83_1:GetWordFromCfg(410021021)
				local var_86_17 = arg_83_1:FormatText(var_86_16.content)

				arg_83_1.text_.text = var_86_17

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_18 = 56
				local var_86_19 = utf8.len(var_86_17)
				local var_86_20 = var_86_18 <= 0 and var_86_14 or var_86_14 * (var_86_19 / var_86_18)

				if var_86_20 > 0 and var_86_14 < var_86_20 then
					arg_83_1.talkMaxDuration = var_86_20

					if var_86_20 + var_86_13 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_20 + var_86_13
					end
				end

				arg_83_1.text_.text = var_86_17
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021021", "story_v_out_410021.awb") ~= 0 then
					local var_86_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021021", "story_v_out_410021.awb") / 1000

					if var_86_21 + var_86_13 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_21 + var_86_13
					end

					if var_86_16.prefab_name ~= "" and arg_83_1.actors_[var_86_16.prefab_name] ~= nil then
						local var_86_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_16.prefab_name].transform, "story_v_out_410021", "410021021", "story_v_out_410021.awb")

						arg_83_1:RecordAudio("410021021", var_86_22)
						arg_83_1:RecordAudio("410021021", var_86_22)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_410021", "410021021", "story_v_out_410021.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_410021", "410021021", "story_v_out_410021.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_23 = math.max(var_86_14, arg_83_1.talkMaxDuration)

			if var_86_13 <= arg_83_1.time_ and arg_83_1.time_ < var_86_13 + var_86_23 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_13) / var_86_23

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_13 + var_86_23 and arg_83_1.time_ < var_86_13 + var_86_23 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play410021022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 410021022
		arg_87_1.duration_ = 10.466

		local var_87_0 = {
			zh = 3.866,
			ja = 10.466
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
				arg_87_0:Play410021023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1060"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1060 = var_90_0.localPosition
				var_90_0.localScale = Vector3.New(1, 1, 1)

				arg_87_1:CheckSpriteTmpPos("1060", 2)

				local var_90_2 = var_90_0.childCount

				for iter_90_0 = 0, var_90_2 - 1 do
					local var_90_3 = var_90_0:GetChild(iter_90_0)

					if var_90_3.name == "" or not string.find(var_90_3.name, "split") then
						var_90_3.gameObject:SetActive(true)
					else
						var_90_3.gameObject:SetActive(false)
					end
				end
			end

			local var_90_4 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_4 then
				local var_90_5 = (arg_87_1.time_ - var_90_1) / var_90_4
				local var_90_6 = Vector3.New(-390, -435, -40)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1060, var_90_6, var_90_5)
			end

			if arg_87_1.time_ >= var_90_1 + var_90_4 and arg_87_1.time_ < var_90_1 + var_90_4 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_90_7 = arg_87_1.actors_["1060"]
			local var_90_8 = 0

			if var_90_8 < arg_87_1.time_ and arg_87_1.time_ <= var_90_8 + arg_90_0 and arg_87_1.var_.actorSpriteComps1060 == nil then
				arg_87_1.var_.actorSpriteComps1060 = var_90_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_9 = 0.034

			if var_90_8 <= arg_87_1.time_ and arg_87_1.time_ < var_90_8 + var_90_9 then
				local var_90_10 = (arg_87_1.time_ - var_90_8) / var_90_9

				if arg_87_1.var_.actorSpriteComps1060 then
					for iter_90_1, iter_90_2 in pairs(arg_87_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_90_2 then
							local var_90_11 = Mathf.Lerp(iter_90_2.color.r, 1, var_90_10)

							iter_90_2.color = Color.New(var_90_11, var_90_11, var_90_11)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_8 + var_90_9 and arg_87_1.time_ < var_90_8 + var_90_9 + arg_90_0 and arg_87_1.var_.actorSpriteComps1060 then
				local var_90_12 = 1

				for iter_90_3, iter_90_4 in pairs(arg_87_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_90_4 then
						iter_90_4.color = Color.New(var_90_12, var_90_12, var_90_12)
					end
				end

				arg_87_1.var_.actorSpriteComps1060 = nil
			end

			local var_90_13 = arg_87_1.actors_["1056"]
			local var_90_14 = 0

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 and arg_87_1.var_.actorSpriteComps1056 == nil then
				arg_87_1.var_.actorSpriteComps1056 = var_90_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_15 = 0.034

			if var_90_14 <= arg_87_1.time_ and arg_87_1.time_ < var_90_14 + var_90_15 then
				local var_90_16 = (arg_87_1.time_ - var_90_14) / var_90_15

				if arg_87_1.var_.actorSpriteComps1056 then
					for iter_90_5, iter_90_6 in pairs(arg_87_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_90_6 then
							local var_90_17 = Mathf.Lerp(iter_90_6.color.r, 0.5, var_90_16)

							iter_90_6.color = Color.New(var_90_17, var_90_17, var_90_17)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_14 + var_90_15 and arg_87_1.time_ < var_90_14 + var_90_15 + arg_90_0 and arg_87_1.var_.actorSpriteComps1056 then
				local var_90_18 = 0.5

				for iter_90_7, iter_90_8 in pairs(arg_87_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_90_8 then
						iter_90_8.color = Color.New(var_90_18, var_90_18, var_90_18)
					end
				end

				arg_87_1.var_.actorSpriteComps1056 = nil
			end

			local var_90_19 = 0
			local var_90_20 = 0.475

			if var_90_19 < arg_87_1.time_ and arg_87_1.time_ <= var_90_19 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_21 = arg_87_1:FormatText(StoryNameCfg[584].name)

				arg_87_1.leftNameTxt_.text = var_90_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_22 = arg_87_1:GetWordFromCfg(410021022)
				local var_90_23 = arg_87_1:FormatText(var_90_22.content)

				arg_87_1.text_.text = var_90_23

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_24 = 19
				local var_90_25 = utf8.len(var_90_23)
				local var_90_26 = var_90_24 <= 0 and var_90_20 or var_90_20 * (var_90_25 / var_90_24)

				if var_90_26 > 0 and var_90_20 < var_90_26 then
					arg_87_1.talkMaxDuration = var_90_26

					if var_90_26 + var_90_19 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_26 + var_90_19
					end
				end

				arg_87_1.text_.text = var_90_23
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021022", "story_v_out_410021.awb") ~= 0 then
					local var_90_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021022", "story_v_out_410021.awb") / 1000

					if var_90_27 + var_90_19 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_27 + var_90_19
					end

					if var_90_22.prefab_name ~= "" and arg_87_1.actors_[var_90_22.prefab_name] ~= nil then
						local var_90_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_22.prefab_name].transform, "story_v_out_410021", "410021022", "story_v_out_410021.awb")

						arg_87_1:RecordAudio("410021022", var_90_28)
						arg_87_1:RecordAudio("410021022", var_90_28)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_410021", "410021022", "story_v_out_410021.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_410021", "410021022", "story_v_out_410021.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_29 = math.max(var_90_20, arg_87_1.talkMaxDuration)

			if var_90_19 <= arg_87_1.time_ and arg_87_1.time_ < var_90_19 + var_90_29 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_19) / var_90_29

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_19 + var_90_29 and arg_87_1.time_ < var_90_19 + var_90_29 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play410021023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 410021023
		arg_91_1.duration_ = 9.433

		local var_91_0 = {
			zh = 9.233,
			ja = 9.433
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
				arg_91_0:Play410021024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1060"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1060 = var_94_0.localPosition
				var_94_0.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("1060", 2)

				local var_94_2 = var_94_0.childCount

				for iter_94_0 = 0, var_94_2 - 1 do
					local var_94_3 = var_94_0:GetChild(iter_94_0)

					if var_94_3.name == "" or not string.find(var_94_3.name, "split") then
						var_94_3.gameObject:SetActive(true)
					else
						var_94_3.gameObject:SetActive(false)
					end
				end
			end

			local var_94_4 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_4 then
				local var_94_5 = (arg_91_1.time_ - var_94_1) / var_94_4
				local var_94_6 = Vector3.New(-390, -435, -40)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1060, var_94_6, var_94_5)
			end

			if arg_91_1.time_ >= var_94_1 + var_94_4 and arg_91_1.time_ < var_94_1 + var_94_4 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_94_7 = arg_91_1.actors_["1060"]
			local var_94_8 = 0

			if var_94_8 < arg_91_1.time_ and arg_91_1.time_ <= var_94_8 + arg_94_0 and arg_91_1.var_.actorSpriteComps1060 == nil then
				arg_91_1.var_.actorSpriteComps1060 = var_94_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_9 = 0.034

			if var_94_8 <= arg_91_1.time_ and arg_91_1.time_ < var_94_8 + var_94_9 then
				local var_94_10 = (arg_91_1.time_ - var_94_8) / var_94_9

				if arg_91_1.var_.actorSpriteComps1060 then
					for iter_94_1, iter_94_2 in pairs(arg_91_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_94_2 then
							local var_94_11 = Mathf.Lerp(iter_94_2.color.r, 1, var_94_10)

							iter_94_2.color = Color.New(var_94_11, var_94_11, var_94_11)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_8 + var_94_9 and arg_91_1.time_ < var_94_8 + var_94_9 + arg_94_0 and arg_91_1.var_.actorSpriteComps1060 then
				local var_94_12 = 1

				for iter_94_3, iter_94_4 in pairs(arg_91_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_94_4 then
						iter_94_4.color = Color.New(var_94_12, var_94_12, var_94_12)
					end
				end

				arg_91_1.var_.actorSpriteComps1060 = nil
			end

			local var_94_13 = 0
			local var_94_14 = 1.175

			if var_94_13 < arg_91_1.time_ and arg_91_1.time_ <= var_94_13 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_15 = arg_91_1:FormatText(StoryNameCfg[584].name)

				arg_91_1.leftNameTxt_.text = var_94_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_16 = arg_91_1:GetWordFromCfg(410021023)
				local var_94_17 = arg_91_1:FormatText(var_94_16.content)

				arg_91_1.text_.text = var_94_17

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_18 = 47
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

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021023", "story_v_out_410021.awb") ~= 0 then
					local var_94_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021023", "story_v_out_410021.awb") / 1000

					if var_94_21 + var_94_13 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_21 + var_94_13
					end

					if var_94_16.prefab_name ~= "" and arg_91_1.actors_[var_94_16.prefab_name] ~= nil then
						local var_94_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_16.prefab_name].transform, "story_v_out_410021", "410021023", "story_v_out_410021.awb")

						arg_91_1:RecordAudio("410021023", var_94_22)
						arg_91_1:RecordAudio("410021023", var_94_22)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_410021", "410021023", "story_v_out_410021.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_410021", "410021023", "story_v_out_410021.awb")
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
	Play410021024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 410021024
		arg_95_1.duration_ = 10.1

		local var_95_0 = {
			zh = 4.7,
			ja = 10.1
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
				arg_95_0:Play410021025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1056"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos1056 = var_98_0.localPosition
				var_98_0.localScale = Vector3.New(1, 1, 1)

				arg_95_1:CheckSpriteTmpPos("1056", 4)

				local var_98_2 = var_98_0.childCount

				for iter_98_0 = 0, var_98_2 - 1 do
					local var_98_3 = var_98_0:GetChild(iter_98_0)

					if var_98_3.name == "split_3" or not string.find(var_98_3.name, "split") then
						var_98_3.gameObject:SetActive(true)
					else
						var_98_3.gameObject:SetActive(false)
					end
				end
			end

			local var_98_4 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_4 then
				local var_98_5 = (arg_95_1.time_ - var_98_1) / var_98_4
				local var_98_6 = Vector3.New(390, -350, -180)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1056, var_98_6, var_98_5)
			end

			if arg_95_1.time_ >= var_98_1 + var_98_4 and arg_95_1.time_ < var_98_1 + var_98_4 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_98_7 = arg_95_1.actors_["1056"]
			local var_98_8 = 0

			if var_98_8 < arg_95_1.time_ and arg_95_1.time_ <= var_98_8 + arg_98_0 and arg_95_1.var_.actorSpriteComps1056 == nil then
				arg_95_1.var_.actorSpriteComps1056 = var_98_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_9 = 0.034

			if var_98_8 <= arg_95_1.time_ and arg_95_1.time_ < var_98_8 + var_98_9 then
				local var_98_10 = (arg_95_1.time_ - var_98_8) / var_98_9

				if arg_95_1.var_.actorSpriteComps1056 then
					for iter_98_1, iter_98_2 in pairs(arg_95_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_98_2 then
							local var_98_11 = Mathf.Lerp(iter_98_2.color.r, 1, var_98_10)

							iter_98_2.color = Color.New(var_98_11, var_98_11, var_98_11)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_8 + var_98_9 and arg_95_1.time_ < var_98_8 + var_98_9 + arg_98_0 and arg_95_1.var_.actorSpriteComps1056 then
				local var_98_12 = 1

				for iter_98_3, iter_98_4 in pairs(arg_95_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_98_4 then
						iter_98_4.color = Color.New(var_98_12, var_98_12, var_98_12)
					end
				end

				arg_95_1.var_.actorSpriteComps1056 = nil
			end

			local var_98_13 = arg_95_1.actors_["1060"]
			local var_98_14 = 0

			if var_98_14 < arg_95_1.time_ and arg_95_1.time_ <= var_98_14 + arg_98_0 and arg_95_1.var_.actorSpriteComps1060 == nil then
				arg_95_1.var_.actorSpriteComps1060 = var_98_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_15 = 0.034

			if var_98_14 <= arg_95_1.time_ and arg_95_1.time_ < var_98_14 + var_98_15 then
				local var_98_16 = (arg_95_1.time_ - var_98_14) / var_98_15

				if arg_95_1.var_.actorSpriteComps1060 then
					for iter_98_5, iter_98_6 in pairs(arg_95_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_98_6 then
							local var_98_17 = Mathf.Lerp(iter_98_6.color.r, 0.5, var_98_16)

							iter_98_6.color = Color.New(var_98_17, var_98_17, var_98_17)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_14 + var_98_15 and arg_95_1.time_ < var_98_14 + var_98_15 + arg_98_0 and arg_95_1.var_.actorSpriteComps1060 then
				local var_98_18 = 0.5

				for iter_98_7, iter_98_8 in pairs(arg_95_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_98_8 then
						iter_98_8.color = Color.New(var_98_18, var_98_18, var_98_18)
					end
				end

				arg_95_1.var_.actorSpriteComps1060 = nil
			end

			local var_98_19 = 0
			local var_98_20 = 0.725

			if var_98_19 < arg_95_1.time_ and arg_95_1.time_ <= var_98_19 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_21 = arg_95_1:FormatText(StoryNameCfg[605].name)

				arg_95_1.leftNameTxt_.text = var_98_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_22 = arg_95_1:GetWordFromCfg(410021024)
				local var_98_23 = arg_95_1:FormatText(var_98_22.content)

				arg_95_1.text_.text = var_98_23

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_24 = 29
				local var_98_25 = utf8.len(var_98_23)
				local var_98_26 = var_98_24 <= 0 and var_98_20 or var_98_20 * (var_98_25 / var_98_24)

				if var_98_26 > 0 and var_98_20 < var_98_26 then
					arg_95_1.talkMaxDuration = var_98_26

					if var_98_26 + var_98_19 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_26 + var_98_19
					end
				end

				arg_95_1.text_.text = var_98_23
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021024", "story_v_out_410021.awb") ~= 0 then
					local var_98_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021024", "story_v_out_410021.awb") / 1000

					if var_98_27 + var_98_19 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_27 + var_98_19
					end

					if var_98_22.prefab_name ~= "" and arg_95_1.actors_[var_98_22.prefab_name] ~= nil then
						local var_98_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_22.prefab_name].transform, "story_v_out_410021", "410021024", "story_v_out_410021.awb")

						arg_95_1:RecordAudio("410021024", var_98_28)
						arg_95_1:RecordAudio("410021024", var_98_28)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_410021", "410021024", "story_v_out_410021.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_410021", "410021024", "story_v_out_410021.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_29 = math.max(var_98_20, arg_95_1.talkMaxDuration)

			if var_98_19 <= arg_95_1.time_ and arg_95_1.time_ < var_98_19 + var_98_29 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_19) / var_98_29

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_19 + var_98_29 and arg_95_1.time_ < var_98_19 + var_98_29 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play410021025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 410021025
		arg_99_1.duration_ = 8.166

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play410021026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1056"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1056 = var_102_0.localPosition
				var_102_0.localScale = Vector3.New(1, 1, 1)

				arg_99_1:CheckSpriteTmpPos("1056", 4)

				local var_102_2 = var_102_0.childCount

				for iter_102_0 = 0, var_102_2 - 1 do
					local var_102_3 = var_102_0:GetChild(iter_102_0)

					if var_102_3.name == "split_3" or not string.find(var_102_3.name, "split") then
						var_102_3.gameObject:SetActive(true)
					else
						var_102_3.gameObject:SetActive(false)
					end
				end
			end

			local var_102_4 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_4 then
				local var_102_5 = (arg_99_1.time_ - var_102_1) / var_102_4
				local var_102_6 = Vector3.New(390, -350, -180)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1056, var_102_6, var_102_5)
			end

			if arg_99_1.time_ >= var_102_1 + var_102_4 and arg_99_1.time_ < var_102_1 + var_102_4 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_102_7 = arg_99_1.actors_["1056"]
			local var_102_8 = 0

			if var_102_8 < arg_99_1.time_ and arg_99_1.time_ <= var_102_8 + arg_102_0 and arg_99_1.var_.actorSpriteComps1056 == nil then
				arg_99_1.var_.actorSpriteComps1056 = var_102_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_9 = 0.034

			if var_102_8 <= arg_99_1.time_ and arg_99_1.time_ < var_102_8 + var_102_9 then
				local var_102_10 = (arg_99_1.time_ - var_102_8) / var_102_9

				if arg_99_1.var_.actorSpriteComps1056 then
					for iter_102_1, iter_102_2 in pairs(arg_99_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_102_2 then
							local var_102_11 = Mathf.Lerp(iter_102_2.color.r, 1, var_102_10)

							iter_102_2.color = Color.New(var_102_11, var_102_11, var_102_11)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_8 + var_102_9 and arg_99_1.time_ < var_102_8 + var_102_9 + arg_102_0 and arg_99_1.var_.actorSpriteComps1056 then
				local var_102_12 = 1

				for iter_102_3, iter_102_4 in pairs(arg_99_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_102_4 then
						iter_102_4.color = Color.New(var_102_12, var_102_12, var_102_12)
					end
				end

				arg_99_1.var_.actorSpriteComps1056 = nil
			end

			local var_102_13 = 0
			local var_102_14 = 1.05

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_15 = arg_99_1:FormatText(StoryNameCfg[605].name)

				arg_99_1.leftNameTxt_.text = var_102_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_16 = arg_99_1:GetWordFromCfg(410021025)
				local var_102_17 = arg_99_1:FormatText(var_102_16.content)

				arg_99_1.text_.text = var_102_17

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_18 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021025", "story_v_out_410021.awb") ~= 0 then
					local var_102_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021025", "story_v_out_410021.awb") / 1000

					if var_102_21 + var_102_13 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_21 + var_102_13
					end

					if var_102_16.prefab_name ~= "" and arg_99_1.actors_[var_102_16.prefab_name] ~= nil then
						local var_102_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_16.prefab_name].transform, "story_v_out_410021", "410021025", "story_v_out_410021.awb")

						arg_99_1:RecordAudio("410021025", var_102_22)
						arg_99_1:RecordAudio("410021025", var_102_22)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_410021", "410021025", "story_v_out_410021.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_410021", "410021025", "story_v_out_410021.awb")
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
	Play410021026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 410021026
		arg_103_1.duration_ = 7.5

		local var_103_0 = {
			zh = 4.566,
			ja = 7.5
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
				arg_103_0:Play410021027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1056"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos1056 = var_106_0.localPosition
				var_106_0.localScale = Vector3.New(1, 1, 1)

				arg_103_1:CheckSpriteTmpPos("1056", 4)

				local var_106_2 = var_106_0.childCount

				for iter_106_0 = 0, var_106_2 - 1 do
					local var_106_3 = var_106_0:GetChild(iter_106_0)

					if var_106_3.name == "split_3" or not string.find(var_106_3.name, "split") then
						var_106_3.gameObject:SetActive(true)
					else
						var_106_3.gameObject:SetActive(false)
					end
				end
			end

			local var_106_4 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_4 then
				local var_106_5 = (arg_103_1.time_ - var_106_1) / var_106_4
				local var_106_6 = Vector3.New(390, -350, -180)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1056, var_106_6, var_106_5)
			end

			if arg_103_1.time_ >= var_106_1 + var_106_4 and arg_103_1.time_ < var_106_1 + var_106_4 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_106_7 = arg_103_1.actors_["1056"]
			local var_106_8 = 0

			if var_106_8 < arg_103_1.time_ and arg_103_1.time_ <= var_106_8 + arg_106_0 and arg_103_1.var_.actorSpriteComps1056 == nil then
				arg_103_1.var_.actorSpriteComps1056 = var_106_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_9 = 0.034

			if var_106_8 <= arg_103_1.time_ and arg_103_1.time_ < var_106_8 + var_106_9 then
				local var_106_10 = (arg_103_1.time_ - var_106_8) / var_106_9

				if arg_103_1.var_.actorSpriteComps1056 then
					for iter_106_1, iter_106_2 in pairs(arg_103_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_106_2 then
							local var_106_11 = Mathf.Lerp(iter_106_2.color.r, 1, var_106_10)

							iter_106_2.color = Color.New(var_106_11, var_106_11, var_106_11)
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_8 + var_106_9 and arg_103_1.time_ < var_106_8 + var_106_9 + arg_106_0 and arg_103_1.var_.actorSpriteComps1056 then
				local var_106_12 = 1

				for iter_106_3, iter_106_4 in pairs(arg_103_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_106_4 then
						iter_106_4.color = Color.New(var_106_12, var_106_12, var_106_12)
					end
				end

				arg_103_1.var_.actorSpriteComps1056 = nil
			end

			local var_106_13 = 0
			local var_106_14 = 0.575

			if var_106_13 < arg_103_1.time_ and arg_103_1.time_ <= var_106_13 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_15 = arg_103_1:FormatText(StoryNameCfg[605].name)

				arg_103_1.leftNameTxt_.text = var_106_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_16 = arg_103_1:GetWordFromCfg(410021026)
				local var_106_17 = arg_103_1:FormatText(var_106_16.content)

				arg_103_1.text_.text = var_106_17

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_18 = 23
				local var_106_19 = utf8.len(var_106_17)
				local var_106_20 = var_106_18 <= 0 and var_106_14 or var_106_14 * (var_106_19 / var_106_18)

				if var_106_20 > 0 and var_106_14 < var_106_20 then
					arg_103_1.talkMaxDuration = var_106_20

					if var_106_20 + var_106_13 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_20 + var_106_13
					end
				end

				arg_103_1.text_.text = var_106_17
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021026", "story_v_out_410021.awb") ~= 0 then
					local var_106_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021026", "story_v_out_410021.awb") / 1000

					if var_106_21 + var_106_13 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_21 + var_106_13
					end

					if var_106_16.prefab_name ~= "" and arg_103_1.actors_[var_106_16.prefab_name] ~= nil then
						local var_106_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_16.prefab_name].transform, "story_v_out_410021", "410021026", "story_v_out_410021.awb")

						arg_103_1:RecordAudio("410021026", var_106_22)
						arg_103_1:RecordAudio("410021026", var_106_22)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_410021", "410021026", "story_v_out_410021.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_410021", "410021026", "story_v_out_410021.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_23 = math.max(var_106_14, arg_103_1.talkMaxDuration)

			if var_106_13 <= arg_103_1.time_ and arg_103_1.time_ < var_106_13 + var_106_23 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_13) / var_106_23

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_13 + var_106_23 and arg_103_1.time_ < var_106_13 + var_106_23 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play410021027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 410021027
		arg_107_1.duration_ = 9

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play410021028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = "ST61"

			if arg_107_1.bgs_[var_110_0] == nil then
				local var_110_1 = Object.Instantiate(arg_107_1.paintGo_)

				var_110_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_110_0)
				var_110_1.name = var_110_0
				var_110_1.transform.parent = arg_107_1.stage_.transform
				var_110_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_107_1.bgs_[var_110_0] = var_110_1
			end

			local var_110_2 = 2

			if var_110_2 < arg_107_1.time_ and arg_107_1.time_ <= var_110_2 + arg_110_0 then
				local var_110_3 = manager.ui.mainCamera.transform.localPosition
				local var_110_4 = Vector3.New(0, 0, 10) + Vector3.New(var_110_3.x, var_110_3.y, 0)
				local var_110_5 = arg_107_1.bgs_.ST61

				var_110_5.transform.localPosition = var_110_4
				var_110_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_110_6 = var_110_5:GetComponent("SpriteRenderer")

				if var_110_6 and var_110_6.sprite then
					local var_110_7 = (var_110_5.transform.localPosition - var_110_3).z
					local var_110_8 = manager.ui.mainCameraCom_
					local var_110_9 = 2 * var_110_7 * Mathf.Tan(var_110_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_110_10 = var_110_9 * var_110_8.aspect
					local var_110_11 = var_110_6.sprite.bounds.size.x
					local var_110_12 = var_110_6.sprite.bounds.size.y
					local var_110_13 = var_110_10 / var_110_11
					local var_110_14 = var_110_9 / var_110_12
					local var_110_15 = var_110_14 < var_110_13 and var_110_13 or var_110_14

					var_110_5.transform.localScale = Vector3.New(var_110_15, var_110_15, 0)
				end

				for iter_110_0, iter_110_1 in pairs(arg_107_1.bgs_) do
					if iter_110_0 ~= "ST61" then
						iter_110_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_110_16 = 0

			if var_110_16 < arg_107_1.time_ and arg_107_1.time_ <= var_110_16 + arg_110_0 then
				arg_107_1.mask_.enabled = true
				arg_107_1.mask_.raycastTarget = true

				arg_107_1:SetGaussion(false)
			end

			local var_110_17 = 2

			if var_110_16 <= arg_107_1.time_ and arg_107_1.time_ < var_110_16 + var_110_17 then
				local var_110_18 = (arg_107_1.time_ - var_110_16) / var_110_17
				local var_110_19 = Color.New(0, 0, 0)

				var_110_19.a = Mathf.Lerp(0, 1, var_110_18)
				arg_107_1.mask_.color = var_110_19
			end

			if arg_107_1.time_ >= var_110_16 + var_110_17 and arg_107_1.time_ < var_110_16 + var_110_17 + arg_110_0 then
				local var_110_20 = Color.New(0, 0, 0)

				var_110_20.a = 1
				arg_107_1.mask_.color = var_110_20
			end

			local var_110_21 = 2

			if var_110_21 < arg_107_1.time_ and arg_107_1.time_ <= var_110_21 + arg_110_0 then
				arg_107_1.mask_.enabled = true
				arg_107_1.mask_.raycastTarget = true

				arg_107_1:SetGaussion(false)
			end

			local var_110_22 = 2

			if var_110_21 <= arg_107_1.time_ and arg_107_1.time_ < var_110_21 + var_110_22 then
				local var_110_23 = (arg_107_1.time_ - var_110_21) / var_110_22
				local var_110_24 = Color.New(0, 0, 0)

				var_110_24.a = Mathf.Lerp(1, 0, var_110_23)
				arg_107_1.mask_.color = var_110_24
			end

			if arg_107_1.time_ >= var_110_21 + var_110_22 and arg_107_1.time_ < var_110_21 + var_110_22 + arg_110_0 then
				local var_110_25 = Color.New(0, 0, 0)
				local var_110_26 = 0

				arg_107_1.mask_.enabled = false
				var_110_25.a = var_110_26
				arg_107_1.mask_.color = var_110_25
			end

			local var_110_27 = arg_107_1.actors_["1060"].transform
			local var_110_28 = 2

			if var_110_28 < arg_107_1.time_ and arg_107_1.time_ <= var_110_28 + arg_110_0 then
				arg_107_1.var_.moveOldPos1060 = var_110_27.localPosition
				var_110_27.localScale = Vector3.New(1, 1, 1)

				arg_107_1:CheckSpriteTmpPos("1060", 7)

				local var_110_29 = var_110_27.childCount

				for iter_110_2 = 0, var_110_29 - 1 do
					local var_110_30 = var_110_27:GetChild(iter_110_2)

					if var_110_30.name == "" or not string.find(var_110_30.name, "split") then
						var_110_30.gameObject:SetActive(true)
					else
						var_110_30.gameObject:SetActive(false)
					end
				end
			end

			local var_110_31 = 0.001

			if var_110_28 <= arg_107_1.time_ and arg_107_1.time_ < var_110_28 + var_110_31 then
				local var_110_32 = (arg_107_1.time_ - var_110_28) / var_110_31
				local var_110_33 = Vector3.New(0, -2000, -40)

				var_110_27.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1060, var_110_33, var_110_32)
			end

			if arg_107_1.time_ >= var_110_28 + var_110_31 and arg_107_1.time_ < var_110_28 + var_110_31 + arg_110_0 then
				var_110_27.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_110_34 = arg_107_1.actors_["1056"].transform
			local var_110_35 = 2

			if var_110_35 < arg_107_1.time_ and arg_107_1.time_ <= var_110_35 + arg_110_0 then
				arg_107_1.var_.moveOldPos1056 = var_110_34.localPosition
				var_110_34.localScale = Vector3.New(1, 1, 1)

				arg_107_1:CheckSpriteTmpPos("1056", 7)

				local var_110_36 = var_110_34.childCount

				for iter_110_3 = 0, var_110_36 - 1 do
					local var_110_37 = var_110_34:GetChild(iter_110_3)

					if var_110_37.name == "" or not string.find(var_110_37.name, "split") then
						var_110_37.gameObject:SetActive(true)
					else
						var_110_37.gameObject:SetActive(false)
					end
				end
			end

			local var_110_38 = 0.001

			if var_110_35 <= arg_107_1.time_ and arg_107_1.time_ < var_110_35 + var_110_38 then
				local var_110_39 = (arg_107_1.time_ - var_110_35) / var_110_38
				local var_110_40 = Vector3.New(0, -2000, -180)

				var_110_34.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1056, var_110_40, var_110_39)
			end

			if arg_107_1.time_ >= var_110_35 + var_110_38 and arg_107_1.time_ < var_110_35 + var_110_38 + arg_110_0 then
				var_110_34.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_110_41 = 0
			local var_110_42 = 0.2

			if var_110_41 < arg_107_1.time_ and arg_107_1.time_ <= var_110_41 + arg_110_0 then
				local var_110_43 = "play"
				local var_110_44 = "music"

				arg_107_1:AudioAction(var_110_43, var_110_44, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_110_45 = 0.3
			local var_110_46 = 0.733333333333333

			if var_110_45 < arg_107_1.time_ and arg_107_1.time_ <= var_110_45 + arg_110_0 then
				local var_110_47 = "play"
				local var_110_48 = "music"

				arg_107_1:AudioAction(var_110_47, var_110_48, "bgm_activity_2_8_story_meruism", "bgm_activity_2_8_story_meruism", "bgm_activity_2_8_story_meruism.awb")
			end

			if arg_107_1.frameCnt_ <= 1 then
				arg_107_1.dialog_:SetActive(false)
			end

			local var_110_49 = 4
			local var_110_50 = 0.7

			if var_110_49 < arg_107_1.time_ and arg_107_1.time_ <= var_110_49 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0

				arg_107_1.dialog_:SetActive(true)

				local var_110_51 = LeanTween.value(arg_107_1.dialog_, 0, 1, 0.3)

				var_110_51:setOnUpdate(LuaHelper.FloatAction(function(arg_111_0)
					arg_107_1.dialogCg_.alpha = arg_111_0
				end))
				var_110_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_107_1.dialog_)
					var_110_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_107_1.duration_ = arg_107_1.duration_ + 0.3

				SetActive(arg_107_1.leftNameGo_, false)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_52 = arg_107_1:GetWordFromCfg(410021027)
				local var_110_53 = arg_107_1:FormatText(var_110_52.content)

				arg_107_1.text_.text = var_110_53

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_54 = 28
				local var_110_55 = utf8.len(var_110_53)
				local var_110_56 = var_110_54 <= 0 and var_110_50 or var_110_50 * (var_110_55 / var_110_54)

				if var_110_56 > 0 and var_110_50 < var_110_56 then
					arg_107_1.talkMaxDuration = var_110_56
					var_110_49 = var_110_49 + 0.3

					if var_110_56 + var_110_49 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_56 + var_110_49
					end
				end

				arg_107_1.text_.text = var_110_53
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_57 = var_110_49 + 0.3
			local var_110_58 = math.max(var_110_50, arg_107_1.talkMaxDuration)

			if var_110_57 <= arg_107_1.time_ and arg_107_1.time_ < var_110_57 + var_110_58 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_57) / var_110_58

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_57 + var_110_58 and arg_107_1.time_ < var_110_57 + var_110_58 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play410021028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 410021028
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play410021029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 1.4

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, false)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_2 = arg_113_1:GetWordFromCfg(410021028)
				local var_116_3 = arg_113_1:FormatText(var_116_2.content)

				arg_113_1.text_.text = var_116_3

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_4 = 56
				local var_116_5 = utf8.len(var_116_3)
				local var_116_6 = var_116_4 <= 0 and var_116_1 or var_116_1 * (var_116_5 / var_116_4)

				if var_116_6 > 0 and var_116_1 < var_116_6 then
					arg_113_1.talkMaxDuration = var_116_6

					if var_116_6 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_6 + var_116_0
					end
				end

				arg_113_1.text_.text = var_116_3
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_7 = math.max(var_116_1, arg_113_1.talkMaxDuration)

			if var_116_0 <= arg_113_1.time_ and arg_113_1.time_ < var_116_0 + var_116_7 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_0) / var_116_7

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_0 + var_116_7 and arg_113_1.time_ < var_116_0 + var_116_7 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play410021029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 410021029
		arg_117_1.duration_ = 6.5

		local var_117_0 = {
			zh = 4.1,
			ja = 6.5
		}
		local var_117_1 = manager.audio:GetLocalizationFlag()

		if var_117_0[var_117_1] ~= nil then
			arg_117_1.duration_ = var_117_0[var_117_1]
		end

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play410021030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1060"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos1060 = var_120_0.localPosition
				var_120_0.localScale = Vector3.New(1, 1, 1)

				arg_117_1:CheckSpriteTmpPos("1060", 2)

				local var_120_2 = var_120_0.childCount

				for iter_120_0 = 0, var_120_2 - 1 do
					local var_120_3 = var_120_0:GetChild(iter_120_0)

					if var_120_3.name == "split_1" or not string.find(var_120_3.name, "split") then
						var_120_3.gameObject:SetActive(true)
					else
						var_120_3.gameObject:SetActive(false)
					end
				end
			end

			local var_120_4 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_4 then
				local var_120_5 = (arg_117_1.time_ - var_120_1) / var_120_4
				local var_120_6 = Vector3.New(-390, -435, -40)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1060, var_120_6, var_120_5)
			end

			if arg_117_1.time_ >= var_120_1 + var_120_4 and arg_117_1.time_ < var_120_1 + var_120_4 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_120_7 = arg_117_1.actors_["1056"].transform
			local var_120_8 = 0

			if var_120_8 < arg_117_1.time_ and arg_117_1.time_ <= var_120_8 + arg_120_0 then
				arg_117_1.var_.moveOldPos1056 = var_120_7.localPosition
				var_120_7.localScale = Vector3.New(1, 1, 1)

				arg_117_1:CheckSpriteTmpPos("1056", 4)

				local var_120_9 = var_120_7.childCount

				for iter_120_1 = 0, var_120_9 - 1 do
					local var_120_10 = var_120_7:GetChild(iter_120_1)

					if var_120_10.name == "split_1" or not string.find(var_120_10.name, "split") then
						var_120_10.gameObject:SetActive(true)
					else
						var_120_10.gameObject:SetActive(false)
					end
				end
			end

			local var_120_11 = 0.001

			if var_120_8 <= arg_117_1.time_ and arg_117_1.time_ < var_120_8 + var_120_11 then
				local var_120_12 = (arg_117_1.time_ - var_120_8) / var_120_11
				local var_120_13 = Vector3.New(390, -350, -180)

				var_120_7.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1056, var_120_13, var_120_12)
			end

			if arg_117_1.time_ >= var_120_8 + var_120_11 and arg_117_1.time_ < var_120_8 + var_120_11 + arg_120_0 then
				var_120_7.localPosition = Vector3.New(390, -350, -180)
			end

			local var_120_14 = arg_117_1.actors_["1060"]
			local var_120_15 = 0

			if var_120_15 < arg_117_1.time_ and arg_117_1.time_ <= var_120_15 + arg_120_0 and arg_117_1.var_.actorSpriteComps1060 == nil then
				arg_117_1.var_.actorSpriteComps1060 = var_120_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_120_16 = 0.034

			if var_120_15 <= arg_117_1.time_ and arg_117_1.time_ < var_120_15 + var_120_16 then
				local var_120_17 = (arg_117_1.time_ - var_120_15) / var_120_16

				if arg_117_1.var_.actorSpriteComps1060 then
					for iter_120_2, iter_120_3 in pairs(arg_117_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_120_3 then
							local var_120_18 = Mathf.Lerp(iter_120_3.color.r, 0.5, var_120_17)

							iter_120_3.color = Color.New(var_120_18, var_120_18, var_120_18)
						end
					end
				end
			end

			if arg_117_1.time_ >= var_120_15 + var_120_16 and arg_117_1.time_ < var_120_15 + var_120_16 + arg_120_0 and arg_117_1.var_.actorSpriteComps1060 then
				local var_120_19 = 0.5

				for iter_120_4, iter_120_5 in pairs(arg_117_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_120_5 then
						iter_120_5.color = Color.New(var_120_19, var_120_19, var_120_19)
					end
				end

				arg_117_1.var_.actorSpriteComps1060 = nil
			end

			local var_120_20 = arg_117_1.actors_["1056"]
			local var_120_21 = 0

			if var_120_21 < arg_117_1.time_ and arg_117_1.time_ <= var_120_21 + arg_120_0 and arg_117_1.var_.actorSpriteComps1056 == nil then
				arg_117_1.var_.actorSpriteComps1056 = var_120_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_120_22 = 0.034

			if var_120_21 <= arg_117_1.time_ and arg_117_1.time_ < var_120_21 + var_120_22 then
				local var_120_23 = (arg_117_1.time_ - var_120_21) / var_120_22

				if arg_117_1.var_.actorSpriteComps1056 then
					for iter_120_6, iter_120_7 in pairs(arg_117_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_120_7 then
							local var_120_24 = Mathf.Lerp(iter_120_7.color.r, 1, var_120_23)

							iter_120_7.color = Color.New(var_120_24, var_120_24, var_120_24)
						end
					end
				end
			end

			if arg_117_1.time_ >= var_120_21 + var_120_22 and arg_117_1.time_ < var_120_21 + var_120_22 + arg_120_0 and arg_117_1.var_.actorSpriteComps1056 then
				local var_120_25 = 1

				for iter_120_8, iter_120_9 in pairs(arg_117_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_120_9 then
						iter_120_9.color = Color.New(var_120_25, var_120_25, var_120_25)
					end
				end

				arg_117_1.var_.actorSpriteComps1056 = nil
			end

			local var_120_26 = 0
			local var_120_27 = 0.525

			if var_120_26 < arg_117_1.time_ and arg_117_1.time_ <= var_120_26 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_28 = arg_117_1:FormatText(StoryNameCfg[605].name)

				arg_117_1.leftNameTxt_.text = var_120_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_29 = arg_117_1:GetWordFromCfg(410021029)
				local var_120_30 = arg_117_1:FormatText(var_120_29.content)

				arg_117_1.text_.text = var_120_30

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_31 = 21
				local var_120_32 = utf8.len(var_120_30)
				local var_120_33 = var_120_31 <= 0 and var_120_27 or var_120_27 * (var_120_32 / var_120_31)

				if var_120_33 > 0 and var_120_27 < var_120_33 then
					arg_117_1.talkMaxDuration = var_120_33

					if var_120_33 + var_120_26 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_33 + var_120_26
					end
				end

				arg_117_1.text_.text = var_120_30
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021029", "story_v_out_410021.awb") ~= 0 then
					local var_120_34 = manager.audio:GetVoiceLength("story_v_out_410021", "410021029", "story_v_out_410021.awb") / 1000

					if var_120_34 + var_120_26 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_34 + var_120_26
					end

					if var_120_29.prefab_name ~= "" and arg_117_1.actors_[var_120_29.prefab_name] ~= nil then
						local var_120_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_29.prefab_name].transform, "story_v_out_410021", "410021029", "story_v_out_410021.awb")

						arg_117_1:RecordAudio("410021029", var_120_35)
						arg_117_1:RecordAudio("410021029", var_120_35)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_410021", "410021029", "story_v_out_410021.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_410021", "410021029", "story_v_out_410021.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_36 = math.max(var_120_27, arg_117_1.talkMaxDuration)

			if var_120_26 <= arg_117_1.time_ and arg_117_1.time_ < var_120_26 + var_120_36 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_26) / var_120_36

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_26 + var_120_36 and arg_117_1.time_ < var_120_26 + var_120_36 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play410021030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 410021030
		arg_121_1.duration_ = 8.566

		local var_121_0 = {
			zh = 8.566,
			ja = 7.3
		}
		local var_121_1 = manager.audio:GetLocalizationFlag()

		if var_121_0[var_121_1] ~= nil then
			arg_121_1.duration_ = var_121_0[var_121_1]
		end

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play410021031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1060"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos1060 = var_124_0.localPosition
				var_124_0.localScale = Vector3.New(1, 1, 1)

				arg_121_1:CheckSpriteTmpPos("1060", 2)

				local var_124_2 = var_124_0.childCount

				for iter_124_0 = 0, var_124_2 - 1 do
					local var_124_3 = var_124_0:GetChild(iter_124_0)

					if var_124_3.name == "split_2" or not string.find(var_124_3.name, "split") then
						var_124_3.gameObject:SetActive(true)
					else
						var_124_3.gameObject:SetActive(false)
					end
				end
			end

			local var_124_4 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_4 then
				local var_124_5 = (arg_121_1.time_ - var_124_1) / var_124_4
				local var_124_6 = Vector3.New(-390, -435, -40)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1060, var_124_6, var_124_5)
			end

			if arg_121_1.time_ >= var_124_1 + var_124_4 and arg_121_1.time_ < var_124_1 + var_124_4 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_124_7 = arg_121_1.actors_["1060"]
			local var_124_8 = 0

			if var_124_8 < arg_121_1.time_ and arg_121_1.time_ <= var_124_8 + arg_124_0 and arg_121_1.var_.actorSpriteComps1060 == nil then
				arg_121_1.var_.actorSpriteComps1060 = var_124_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_124_9 = 0.034

			if var_124_8 <= arg_121_1.time_ and arg_121_1.time_ < var_124_8 + var_124_9 then
				local var_124_10 = (arg_121_1.time_ - var_124_8) / var_124_9

				if arg_121_1.var_.actorSpriteComps1060 then
					for iter_124_1, iter_124_2 in pairs(arg_121_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_124_2 then
							local var_124_11 = Mathf.Lerp(iter_124_2.color.r, 1, var_124_10)

							iter_124_2.color = Color.New(var_124_11, var_124_11, var_124_11)
						end
					end
				end
			end

			if arg_121_1.time_ >= var_124_8 + var_124_9 and arg_121_1.time_ < var_124_8 + var_124_9 + arg_124_0 and arg_121_1.var_.actorSpriteComps1060 then
				local var_124_12 = 1

				for iter_124_3, iter_124_4 in pairs(arg_121_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_124_4 then
						iter_124_4.color = Color.New(var_124_12, var_124_12, var_124_12)
					end
				end

				arg_121_1.var_.actorSpriteComps1060 = nil
			end

			local var_124_13 = arg_121_1.actors_["1056"]
			local var_124_14 = 0

			if var_124_14 < arg_121_1.time_ and arg_121_1.time_ <= var_124_14 + arg_124_0 and arg_121_1.var_.actorSpriteComps1056 == nil then
				arg_121_1.var_.actorSpriteComps1056 = var_124_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_124_15 = 0.034

			if var_124_14 <= arg_121_1.time_ and arg_121_1.time_ < var_124_14 + var_124_15 then
				local var_124_16 = (arg_121_1.time_ - var_124_14) / var_124_15

				if arg_121_1.var_.actorSpriteComps1056 then
					for iter_124_5, iter_124_6 in pairs(arg_121_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_124_6 then
							local var_124_17 = Mathf.Lerp(iter_124_6.color.r, 0.5, var_124_16)

							iter_124_6.color = Color.New(var_124_17, var_124_17, var_124_17)
						end
					end
				end
			end

			if arg_121_1.time_ >= var_124_14 + var_124_15 and arg_121_1.time_ < var_124_14 + var_124_15 + arg_124_0 and arg_121_1.var_.actorSpriteComps1056 then
				local var_124_18 = 0.5

				for iter_124_7, iter_124_8 in pairs(arg_121_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_124_8 then
						iter_124_8.color = Color.New(var_124_18, var_124_18, var_124_18)
					end
				end

				arg_121_1.var_.actorSpriteComps1056 = nil
			end

			local var_124_19 = 0
			local var_124_20 = 0.875

			if var_124_19 < arg_121_1.time_ and arg_121_1.time_ <= var_124_19 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_21 = arg_121_1:FormatText(StoryNameCfg[584].name)

				arg_121_1.leftNameTxt_.text = var_124_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_22 = arg_121_1:GetWordFromCfg(410021030)
				local var_124_23 = arg_121_1:FormatText(var_124_22.content)

				arg_121_1.text_.text = var_124_23

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_24 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021030", "story_v_out_410021.awb") ~= 0 then
					local var_124_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021030", "story_v_out_410021.awb") / 1000

					if var_124_27 + var_124_19 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_27 + var_124_19
					end

					if var_124_22.prefab_name ~= "" and arg_121_1.actors_[var_124_22.prefab_name] ~= nil then
						local var_124_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_22.prefab_name].transform, "story_v_out_410021", "410021030", "story_v_out_410021.awb")

						arg_121_1:RecordAudio("410021030", var_124_28)
						arg_121_1:RecordAudio("410021030", var_124_28)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_410021", "410021030", "story_v_out_410021.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_410021", "410021030", "story_v_out_410021.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_29 = math.max(var_124_20, arg_121_1.talkMaxDuration)

			if var_124_19 <= arg_121_1.time_ and arg_121_1.time_ < var_124_19 + var_124_29 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_19) / var_124_29

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_19 + var_124_29 and arg_121_1.time_ < var_124_19 + var_124_29 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play410021031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 410021031
		arg_125_1.duration_ = 11.566

		local var_125_0 = {
			zh = 6.833,
			ja = 11.566
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
				arg_125_0:Play410021032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1056"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos1056 = var_128_0.localPosition
				var_128_0.localScale = Vector3.New(1, 1, 1)

				arg_125_1:CheckSpriteTmpPos("1056", 4)

				local var_128_2 = var_128_0.childCount

				for iter_128_0 = 0, var_128_2 - 1 do
					local var_128_3 = var_128_0:GetChild(iter_128_0)

					if var_128_3.name == "split_1" or not string.find(var_128_3.name, "split") then
						var_128_3.gameObject:SetActive(true)
					else
						var_128_3.gameObject:SetActive(false)
					end
				end
			end

			local var_128_4 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_4 then
				local var_128_5 = (arg_125_1.time_ - var_128_1) / var_128_4
				local var_128_6 = Vector3.New(390, -350, -180)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1056, var_128_6, var_128_5)
			end

			if arg_125_1.time_ >= var_128_1 + var_128_4 and arg_125_1.time_ < var_128_1 + var_128_4 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_128_7 = arg_125_1.actors_["1056"]
			local var_128_8 = 0

			if var_128_8 < arg_125_1.time_ and arg_125_1.time_ <= var_128_8 + arg_128_0 and arg_125_1.var_.actorSpriteComps1056 == nil then
				arg_125_1.var_.actorSpriteComps1056 = var_128_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_128_9 = 0.034

			if var_128_8 <= arg_125_1.time_ and arg_125_1.time_ < var_128_8 + var_128_9 then
				local var_128_10 = (arg_125_1.time_ - var_128_8) / var_128_9

				if arg_125_1.var_.actorSpriteComps1056 then
					for iter_128_1, iter_128_2 in pairs(arg_125_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_128_2 then
							local var_128_11 = Mathf.Lerp(iter_128_2.color.r, 1, var_128_10)

							iter_128_2.color = Color.New(var_128_11, var_128_11, var_128_11)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_8 + var_128_9 and arg_125_1.time_ < var_128_8 + var_128_9 + arg_128_0 and arg_125_1.var_.actorSpriteComps1056 then
				local var_128_12 = 1

				for iter_128_3, iter_128_4 in pairs(arg_125_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_128_4 then
						iter_128_4.color = Color.New(var_128_12, var_128_12, var_128_12)
					end
				end

				arg_125_1.var_.actorSpriteComps1056 = nil
			end

			local var_128_13 = arg_125_1.actors_["1060"]
			local var_128_14 = 0

			if var_128_14 < arg_125_1.time_ and arg_125_1.time_ <= var_128_14 + arg_128_0 and arg_125_1.var_.actorSpriteComps1060 == nil then
				arg_125_1.var_.actorSpriteComps1060 = var_128_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_128_15 = 0.034

			if var_128_14 <= arg_125_1.time_ and arg_125_1.time_ < var_128_14 + var_128_15 then
				local var_128_16 = (arg_125_1.time_ - var_128_14) / var_128_15

				if arg_125_1.var_.actorSpriteComps1060 then
					for iter_128_5, iter_128_6 in pairs(arg_125_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_128_6 then
							local var_128_17 = Mathf.Lerp(iter_128_6.color.r, 0.5, var_128_16)

							iter_128_6.color = Color.New(var_128_17, var_128_17, var_128_17)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_14 + var_128_15 and arg_125_1.time_ < var_128_14 + var_128_15 + arg_128_0 and arg_125_1.var_.actorSpriteComps1060 then
				local var_128_18 = 0.5

				for iter_128_7, iter_128_8 in pairs(arg_125_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_128_8 then
						iter_128_8.color = Color.New(var_128_18, var_128_18, var_128_18)
					end
				end

				arg_125_1.var_.actorSpriteComps1060 = nil
			end

			local var_128_19 = 0
			local var_128_20 = 0.85

			if var_128_19 < arg_125_1.time_ and arg_125_1.time_ <= var_128_19 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_21 = arg_125_1:FormatText(StoryNameCfg[605].name)

				arg_125_1.leftNameTxt_.text = var_128_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_22 = arg_125_1:GetWordFromCfg(410021031)
				local var_128_23 = arg_125_1:FormatText(var_128_22.content)

				arg_125_1.text_.text = var_128_23

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_24 = 34
				local var_128_25 = utf8.len(var_128_23)
				local var_128_26 = var_128_24 <= 0 and var_128_20 or var_128_20 * (var_128_25 / var_128_24)

				if var_128_26 > 0 and var_128_20 < var_128_26 then
					arg_125_1.talkMaxDuration = var_128_26

					if var_128_26 + var_128_19 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_26 + var_128_19
					end
				end

				arg_125_1.text_.text = var_128_23
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021031", "story_v_out_410021.awb") ~= 0 then
					local var_128_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021031", "story_v_out_410021.awb") / 1000

					if var_128_27 + var_128_19 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_27 + var_128_19
					end

					if var_128_22.prefab_name ~= "" and arg_125_1.actors_[var_128_22.prefab_name] ~= nil then
						local var_128_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_22.prefab_name].transform, "story_v_out_410021", "410021031", "story_v_out_410021.awb")

						arg_125_1:RecordAudio("410021031", var_128_28)
						arg_125_1:RecordAudio("410021031", var_128_28)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_410021", "410021031", "story_v_out_410021.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_410021", "410021031", "story_v_out_410021.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_29 = math.max(var_128_20, arg_125_1.talkMaxDuration)

			if var_128_19 <= arg_125_1.time_ and arg_125_1.time_ < var_128_19 + var_128_29 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_19) / var_128_29

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_19 + var_128_29 and arg_125_1.time_ < var_128_19 + var_128_29 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play410021032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 410021032
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play410021033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1056"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.actorSpriteComps1056 == nil then
				arg_129_1.var_.actorSpriteComps1056 = var_132_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_132_2 = 0.034

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.actorSpriteComps1056 then
					for iter_132_0, iter_132_1 in pairs(arg_129_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_132_1 then
							local var_132_4 = Mathf.Lerp(iter_132_1.color.r, 0.5, var_132_3)

							iter_132_1.color = Color.New(var_132_4, var_132_4, var_132_4)
						end
					end
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.actorSpriteComps1056 then
				local var_132_5 = 0.5

				for iter_132_2, iter_132_3 in pairs(arg_129_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_132_3 then
						iter_132_3.color = Color.New(var_132_5, var_132_5, var_132_5)
					end
				end

				arg_129_1.var_.actorSpriteComps1056 = nil
			end

			local var_132_6 = 0
			local var_132_7 = 1.225

			if var_132_6 < arg_129_1.time_ and arg_129_1.time_ <= var_132_6 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, false)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_8 = arg_129_1:GetWordFromCfg(410021032)
				local var_132_9 = arg_129_1:FormatText(var_132_8.content)

				arg_129_1.text_.text = var_132_9

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_10 = 49
				local var_132_11 = utf8.len(var_132_9)
				local var_132_12 = var_132_10 <= 0 and var_132_7 or var_132_7 * (var_132_11 / var_132_10)

				if var_132_12 > 0 and var_132_7 < var_132_12 then
					arg_129_1.talkMaxDuration = var_132_12

					if var_132_12 + var_132_6 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_12 + var_132_6
					end
				end

				arg_129_1.text_.text = var_132_9
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)
				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_13 = math.max(var_132_7, arg_129_1.talkMaxDuration)

			if var_132_6 <= arg_129_1.time_ and arg_129_1.time_ < var_132_6 + var_132_13 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_6) / var_132_13

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_6 + var_132_13 and arg_129_1.time_ < var_132_6 + var_132_13 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play410021033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 410021033
		arg_133_1.duration_ = 8.433

		local var_133_0 = {
			zh = 6.633,
			ja = 8.433
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
				arg_133_0:Play410021034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1056"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos1056 = var_136_0.localPosition
				var_136_0.localScale = Vector3.New(1, 1, 1)

				arg_133_1:CheckSpriteTmpPos("1056", 4)

				local var_136_2 = var_136_0.childCount

				for iter_136_0 = 0, var_136_2 - 1 do
					local var_136_3 = var_136_0:GetChild(iter_136_0)

					if var_136_3.name == "" or not string.find(var_136_3.name, "split") then
						var_136_3.gameObject:SetActive(true)
					else
						var_136_3.gameObject:SetActive(false)
					end
				end
			end

			local var_136_4 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_4 then
				local var_136_5 = (arg_133_1.time_ - var_136_1) / var_136_4
				local var_136_6 = Vector3.New(390, -350, -180)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1056, var_136_6, var_136_5)
			end

			if arg_133_1.time_ >= var_136_1 + var_136_4 and arg_133_1.time_ < var_136_1 + var_136_4 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_136_7 = arg_133_1.actors_["1056"]
			local var_136_8 = 0

			if var_136_8 < arg_133_1.time_ and arg_133_1.time_ <= var_136_8 + arg_136_0 and arg_133_1.var_.actorSpriteComps1056 == nil then
				arg_133_1.var_.actorSpriteComps1056 = var_136_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_136_9 = 0.034

			if var_136_8 <= arg_133_1.time_ and arg_133_1.time_ < var_136_8 + var_136_9 then
				local var_136_10 = (arg_133_1.time_ - var_136_8) / var_136_9

				if arg_133_1.var_.actorSpriteComps1056 then
					for iter_136_1, iter_136_2 in pairs(arg_133_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_136_2 then
							local var_136_11 = Mathf.Lerp(iter_136_2.color.r, 1, var_136_10)

							iter_136_2.color = Color.New(var_136_11, var_136_11, var_136_11)
						end
					end
				end
			end

			if arg_133_1.time_ >= var_136_8 + var_136_9 and arg_133_1.time_ < var_136_8 + var_136_9 + arg_136_0 and arg_133_1.var_.actorSpriteComps1056 then
				local var_136_12 = 1

				for iter_136_3, iter_136_4 in pairs(arg_133_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_136_4 then
						iter_136_4.color = Color.New(var_136_12, var_136_12, var_136_12)
					end
				end

				arg_133_1.var_.actorSpriteComps1056 = nil
			end

			local var_136_13 = 0
			local var_136_14 = 0.875

			if var_136_13 < arg_133_1.time_ and arg_133_1.time_ <= var_136_13 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_15 = arg_133_1:FormatText(StoryNameCfg[605].name)

				arg_133_1.leftNameTxt_.text = var_136_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_16 = arg_133_1:GetWordFromCfg(410021033)
				local var_136_17 = arg_133_1:FormatText(var_136_16.content)

				arg_133_1.text_.text = var_136_17

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_18 = 35
				local var_136_19 = utf8.len(var_136_17)
				local var_136_20 = var_136_18 <= 0 and var_136_14 or var_136_14 * (var_136_19 / var_136_18)

				if var_136_20 > 0 and var_136_14 < var_136_20 then
					arg_133_1.talkMaxDuration = var_136_20

					if var_136_20 + var_136_13 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_20 + var_136_13
					end
				end

				arg_133_1.text_.text = var_136_17
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021033", "story_v_out_410021.awb") ~= 0 then
					local var_136_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021033", "story_v_out_410021.awb") / 1000

					if var_136_21 + var_136_13 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_21 + var_136_13
					end

					if var_136_16.prefab_name ~= "" and arg_133_1.actors_[var_136_16.prefab_name] ~= nil then
						local var_136_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_16.prefab_name].transform, "story_v_out_410021", "410021033", "story_v_out_410021.awb")

						arg_133_1:RecordAudio("410021033", var_136_22)
						arg_133_1:RecordAudio("410021033", var_136_22)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_410021", "410021033", "story_v_out_410021.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_410021", "410021033", "story_v_out_410021.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_23 = math.max(var_136_14, arg_133_1.talkMaxDuration)

			if var_136_13 <= arg_133_1.time_ and arg_133_1.time_ < var_136_13 + var_136_23 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_13) / var_136_23

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_13 + var_136_23 and arg_133_1.time_ < var_136_13 + var_136_23 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play410021034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 410021034
		arg_137_1.duration_ = 8.2

		local var_137_0 = {
			zh = 4.966,
			ja = 8.2
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
				arg_137_0:Play410021035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1060"].transform
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1.var_.moveOldPos1060 = var_140_0.localPosition
				var_140_0.localScale = Vector3.New(1, 1, 1)

				arg_137_1:CheckSpriteTmpPos("1060", 2)

				local var_140_2 = var_140_0.childCount

				for iter_140_0 = 0, var_140_2 - 1 do
					local var_140_3 = var_140_0:GetChild(iter_140_0)

					if var_140_3.name == "" or not string.find(var_140_3.name, "split") then
						var_140_3.gameObject:SetActive(true)
					else
						var_140_3.gameObject:SetActive(false)
					end
				end
			end

			local var_140_4 = 0.001

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_4 then
				local var_140_5 = (arg_137_1.time_ - var_140_1) / var_140_4
				local var_140_6 = Vector3.New(-390, -435, -40)

				var_140_0.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1060, var_140_6, var_140_5)
			end

			if arg_137_1.time_ >= var_140_1 + var_140_4 and arg_137_1.time_ < var_140_1 + var_140_4 + arg_140_0 then
				var_140_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_140_7 = arg_137_1.actors_["1060"]
			local var_140_8 = 0

			if var_140_8 < arg_137_1.time_ and arg_137_1.time_ <= var_140_8 + arg_140_0 and arg_137_1.var_.actorSpriteComps1060 == nil then
				arg_137_1.var_.actorSpriteComps1060 = var_140_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_140_9 = 0.034

			if var_140_8 <= arg_137_1.time_ and arg_137_1.time_ < var_140_8 + var_140_9 then
				local var_140_10 = (arg_137_1.time_ - var_140_8) / var_140_9

				if arg_137_1.var_.actorSpriteComps1060 then
					for iter_140_1, iter_140_2 in pairs(arg_137_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_140_2 then
							local var_140_11 = Mathf.Lerp(iter_140_2.color.r, 1, var_140_10)

							iter_140_2.color = Color.New(var_140_11, var_140_11, var_140_11)
						end
					end
				end
			end

			if arg_137_1.time_ >= var_140_8 + var_140_9 and arg_137_1.time_ < var_140_8 + var_140_9 + arg_140_0 and arg_137_1.var_.actorSpriteComps1060 then
				local var_140_12 = 1

				for iter_140_3, iter_140_4 in pairs(arg_137_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_140_4 then
						iter_140_4.color = Color.New(var_140_12, var_140_12, var_140_12)
					end
				end

				arg_137_1.var_.actorSpriteComps1060 = nil
			end

			local var_140_13 = arg_137_1.actors_["1056"]
			local var_140_14 = 0

			if var_140_14 < arg_137_1.time_ and arg_137_1.time_ <= var_140_14 + arg_140_0 and arg_137_1.var_.actorSpriteComps1056 == nil then
				arg_137_1.var_.actorSpriteComps1056 = var_140_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_140_15 = 0.034

			if var_140_14 <= arg_137_1.time_ and arg_137_1.time_ < var_140_14 + var_140_15 then
				local var_140_16 = (arg_137_1.time_ - var_140_14) / var_140_15

				if arg_137_1.var_.actorSpriteComps1056 then
					for iter_140_5, iter_140_6 in pairs(arg_137_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_140_6 then
							local var_140_17 = Mathf.Lerp(iter_140_6.color.r, 0.5, var_140_16)

							iter_140_6.color = Color.New(var_140_17, var_140_17, var_140_17)
						end
					end
				end
			end

			if arg_137_1.time_ >= var_140_14 + var_140_15 and arg_137_1.time_ < var_140_14 + var_140_15 + arg_140_0 and arg_137_1.var_.actorSpriteComps1056 then
				local var_140_18 = 0.5

				for iter_140_7, iter_140_8 in pairs(arg_137_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_140_8 then
						iter_140_8.color = Color.New(var_140_18, var_140_18, var_140_18)
					end
				end

				arg_137_1.var_.actorSpriteComps1056 = nil
			end

			local var_140_19 = 0
			local var_140_20 = 0.475

			if var_140_19 < arg_137_1.time_ and arg_137_1.time_ <= var_140_19 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_21 = arg_137_1:FormatText(StoryNameCfg[584].name)

				arg_137_1.leftNameTxt_.text = var_140_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_22 = arg_137_1:GetWordFromCfg(410021034)
				local var_140_23 = arg_137_1:FormatText(var_140_22.content)

				arg_137_1.text_.text = var_140_23

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_24 = 19
				local var_140_25 = utf8.len(var_140_23)
				local var_140_26 = var_140_24 <= 0 and var_140_20 or var_140_20 * (var_140_25 / var_140_24)

				if var_140_26 > 0 and var_140_20 < var_140_26 then
					arg_137_1.talkMaxDuration = var_140_26

					if var_140_26 + var_140_19 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_26 + var_140_19
					end
				end

				arg_137_1.text_.text = var_140_23
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021034", "story_v_out_410021.awb") ~= 0 then
					local var_140_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021034", "story_v_out_410021.awb") / 1000

					if var_140_27 + var_140_19 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_27 + var_140_19
					end

					if var_140_22.prefab_name ~= "" and arg_137_1.actors_[var_140_22.prefab_name] ~= nil then
						local var_140_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_22.prefab_name].transform, "story_v_out_410021", "410021034", "story_v_out_410021.awb")

						arg_137_1:RecordAudio("410021034", var_140_28)
						arg_137_1:RecordAudio("410021034", var_140_28)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_410021", "410021034", "story_v_out_410021.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_410021", "410021034", "story_v_out_410021.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_29 = math.max(var_140_20, arg_137_1.talkMaxDuration)

			if var_140_19 <= arg_137_1.time_ and arg_137_1.time_ < var_140_19 + var_140_29 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_19) / var_140_29

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_19 + var_140_29 and arg_137_1.time_ < var_140_19 + var_140_29 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play410021035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 410021035
		arg_141_1.duration_ = 3.666

		local var_141_0 = {
			zh = 3.666,
			ja = 2.5
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
				arg_141_0:Play410021036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1056"].transform
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos1056 = var_144_0.localPosition
				var_144_0.localScale = Vector3.New(1, 1, 1)

				arg_141_1:CheckSpriteTmpPos("1056", 4)

				local var_144_2 = var_144_0.childCount

				for iter_144_0 = 0, var_144_2 - 1 do
					local var_144_3 = var_144_0:GetChild(iter_144_0)

					if var_144_3.name == "" or not string.find(var_144_3.name, "split") then
						var_144_3.gameObject:SetActive(true)
					else
						var_144_3.gameObject:SetActive(false)
					end
				end
			end

			local var_144_4 = 0.001

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_4 then
				local var_144_5 = (arg_141_1.time_ - var_144_1) / var_144_4
				local var_144_6 = Vector3.New(390, -350, -180)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1056, var_144_6, var_144_5)
			end

			if arg_141_1.time_ >= var_144_1 + var_144_4 and arg_141_1.time_ < var_144_1 + var_144_4 + arg_144_0 then
				var_144_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_144_7 = arg_141_1.actors_["1056"]
			local var_144_8 = 0

			if var_144_8 < arg_141_1.time_ and arg_141_1.time_ <= var_144_8 + arg_144_0 and arg_141_1.var_.actorSpriteComps1056 == nil then
				arg_141_1.var_.actorSpriteComps1056 = var_144_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_144_9 = 0.034

			if var_144_8 <= arg_141_1.time_ and arg_141_1.time_ < var_144_8 + var_144_9 then
				local var_144_10 = (arg_141_1.time_ - var_144_8) / var_144_9

				if arg_141_1.var_.actorSpriteComps1056 then
					for iter_144_1, iter_144_2 in pairs(arg_141_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_144_2 then
							local var_144_11 = Mathf.Lerp(iter_144_2.color.r, 1, var_144_10)

							iter_144_2.color = Color.New(var_144_11, var_144_11, var_144_11)
						end
					end
				end
			end

			if arg_141_1.time_ >= var_144_8 + var_144_9 and arg_141_1.time_ < var_144_8 + var_144_9 + arg_144_0 and arg_141_1.var_.actorSpriteComps1056 then
				local var_144_12 = 1

				for iter_144_3, iter_144_4 in pairs(arg_141_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_144_4 then
						iter_144_4.color = Color.New(var_144_12, var_144_12, var_144_12)
					end
				end

				arg_141_1.var_.actorSpriteComps1056 = nil
			end

			local var_144_13 = arg_141_1.actors_["1060"]
			local var_144_14 = 0

			if var_144_14 < arg_141_1.time_ and arg_141_1.time_ <= var_144_14 + arg_144_0 and arg_141_1.var_.actorSpriteComps1060 == nil then
				arg_141_1.var_.actorSpriteComps1060 = var_144_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_144_15 = 0.034

			if var_144_14 <= arg_141_1.time_ and arg_141_1.time_ < var_144_14 + var_144_15 then
				local var_144_16 = (arg_141_1.time_ - var_144_14) / var_144_15

				if arg_141_1.var_.actorSpriteComps1060 then
					for iter_144_5, iter_144_6 in pairs(arg_141_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_144_6 then
							local var_144_17 = Mathf.Lerp(iter_144_6.color.r, 0.5, var_144_16)

							iter_144_6.color = Color.New(var_144_17, var_144_17, var_144_17)
						end
					end
				end
			end

			if arg_141_1.time_ >= var_144_14 + var_144_15 and arg_141_1.time_ < var_144_14 + var_144_15 + arg_144_0 and arg_141_1.var_.actorSpriteComps1060 then
				local var_144_18 = 0.5

				for iter_144_7, iter_144_8 in pairs(arg_141_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_144_8 then
						iter_144_8.color = Color.New(var_144_18, var_144_18, var_144_18)
					end
				end

				arg_141_1.var_.actorSpriteComps1060 = nil
			end

			local var_144_19 = 0
			local var_144_20 = 0.425

			if var_144_19 < arg_141_1.time_ and arg_141_1.time_ <= var_144_19 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_21 = arg_141_1:FormatText(StoryNameCfg[605].name)

				arg_141_1.leftNameTxt_.text = var_144_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_22 = arg_141_1:GetWordFromCfg(410021035)
				local var_144_23 = arg_141_1:FormatText(var_144_22.content)

				arg_141_1.text_.text = var_144_23

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_24 = 17
				local var_144_25 = utf8.len(var_144_23)
				local var_144_26 = var_144_24 <= 0 and var_144_20 or var_144_20 * (var_144_25 / var_144_24)

				if var_144_26 > 0 and var_144_20 < var_144_26 then
					arg_141_1.talkMaxDuration = var_144_26

					if var_144_26 + var_144_19 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_26 + var_144_19
					end
				end

				arg_141_1.text_.text = var_144_23
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021035", "story_v_out_410021.awb") ~= 0 then
					local var_144_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021035", "story_v_out_410021.awb") / 1000

					if var_144_27 + var_144_19 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_27 + var_144_19
					end

					if var_144_22.prefab_name ~= "" and arg_141_1.actors_[var_144_22.prefab_name] ~= nil then
						local var_144_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_22.prefab_name].transform, "story_v_out_410021", "410021035", "story_v_out_410021.awb")

						arg_141_1:RecordAudio("410021035", var_144_28)
						arg_141_1:RecordAudio("410021035", var_144_28)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_410021", "410021035", "story_v_out_410021.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_410021", "410021035", "story_v_out_410021.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_29 = math.max(var_144_20, arg_141_1.talkMaxDuration)

			if var_144_19 <= arg_141_1.time_ and arg_141_1.time_ < var_144_19 + var_144_29 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_19) / var_144_29

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_19 + var_144_29 and arg_141_1.time_ < var_144_19 + var_144_29 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play410021036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 410021036
		arg_145_1.duration_ = 8.666

		local var_145_0 = {
			zh = 5.966,
			ja = 8.666
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
				arg_145_0:Play410021037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1060"].transform
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1.var_.moveOldPos1060 = var_148_0.localPosition
				var_148_0.localScale = Vector3.New(1, 1, 1)

				arg_145_1:CheckSpriteTmpPos("1060", 2)

				local var_148_2 = var_148_0.childCount

				for iter_148_0 = 0, var_148_2 - 1 do
					local var_148_3 = var_148_0:GetChild(iter_148_0)

					if var_148_3.name == "" or not string.find(var_148_3.name, "split") then
						var_148_3.gameObject:SetActive(true)
					else
						var_148_3.gameObject:SetActive(false)
					end
				end
			end

			local var_148_4 = 0.001

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_4 then
				local var_148_5 = (arg_145_1.time_ - var_148_1) / var_148_4
				local var_148_6 = Vector3.New(-390, -435, -40)

				var_148_0.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1060, var_148_6, var_148_5)
			end

			if arg_145_1.time_ >= var_148_1 + var_148_4 and arg_145_1.time_ < var_148_1 + var_148_4 + arg_148_0 then
				var_148_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_148_7 = arg_145_1.actors_["1060"]
			local var_148_8 = 0

			if var_148_8 < arg_145_1.time_ and arg_145_1.time_ <= var_148_8 + arg_148_0 and arg_145_1.var_.actorSpriteComps1060 == nil then
				arg_145_1.var_.actorSpriteComps1060 = var_148_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_148_9 = 0.034

			if var_148_8 <= arg_145_1.time_ and arg_145_1.time_ < var_148_8 + var_148_9 then
				local var_148_10 = (arg_145_1.time_ - var_148_8) / var_148_9

				if arg_145_1.var_.actorSpriteComps1060 then
					for iter_148_1, iter_148_2 in pairs(arg_145_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_148_2 then
							local var_148_11 = Mathf.Lerp(iter_148_2.color.r, 1, var_148_10)

							iter_148_2.color = Color.New(var_148_11, var_148_11, var_148_11)
						end
					end
				end
			end

			if arg_145_1.time_ >= var_148_8 + var_148_9 and arg_145_1.time_ < var_148_8 + var_148_9 + arg_148_0 and arg_145_1.var_.actorSpriteComps1060 then
				local var_148_12 = 1

				for iter_148_3, iter_148_4 in pairs(arg_145_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_148_4 then
						iter_148_4.color = Color.New(var_148_12, var_148_12, var_148_12)
					end
				end

				arg_145_1.var_.actorSpriteComps1060 = nil
			end

			local var_148_13 = arg_145_1.actors_["1056"]
			local var_148_14 = 0

			if var_148_14 < arg_145_1.time_ and arg_145_1.time_ <= var_148_14 + arg_148_0 and arg_145_1.var_.actorSpriteComps1056 == nil then
				arg_145_1.var_.actorSpriteComps1056 = var_148_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_148_15 = 0.034

			if var_148_14 <= arg_145_1.time_ and arg_145_1.time_ < var_148_14 + var_148_15 then
				local var_148_16 = (arg_145_1.time_ - var_148_14) / var_148_15

				if arg_145_1.var_.actorSpriteComps1056 then
					for iter_148_5, iter_148_6 in pairs(arg_145_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_148_6 then
							local var_148_17 = Mathf.Lerp(iter_148_6.color.r, 0.5, var_148_16)

							iter_148_6.color = Color.New(var_148_17, var_148_17, var_148_17)
						end
					end
				end
			end

			if arg_145_1.time_ >= var_148_14 + var_148_15 and arg_145_1.time_ < var_148_14 + var_148_15 + arg_148_0 and arg_145_1.var_.actorSpriteComps1056 then
				local var_148_18 = 0.5

				for iter_148_7, iter_148_8 in pairs(arg_145_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_148_8 then
						iter_148_8.color = Color.New(var_148_18, var_148_18, var_148_18)
					end
				end

				arg_145_1.var_.actorSpriteComps1056 = nil
			end

			local var_148_19 = 0
			local var_148_20 = 0.525

			if var_148_19 < arg_145_1.time_ and arg_145_1.time_ <= var_148_19 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_21 = arg_145_1:FormatText(StoryNameCfg[584].name)

				arg_145_1.leftNameTxt_.text = var_148_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_22 = arg_145_1:GetWordFromCfg(410021036)
				local var_148_23 = arg_145_1:FormatText(var_148_22.content)

				arg_145_1.text_.text = var_148_23

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_24 = 21
				local var_148_25 = utf8.len(var_148_23)
				local var_148_26 = var_148_24 <= 0 and var_148_20 or var_148_20 * (var_148_25 / var_148_24)

				if var_148_26 > 0 and var_148_20 < var_148_26 then
					arg_145_1.talkMaxDuration = var_148_26

					if var_148_26 + var_148_19 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_26 + var_148_19
					end
				end

				arg_145_1.text_.text = var_148_23
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021036", "story_v_out_410021.awb") ~= 0 then
					local var_148_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021036", "story_v_out_410021.awb") / 1000

					if var_148_27 + var_148_19 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_27 + var_148_19
					end

					if var_148_22.prefab_name ~= "" and arg_145_1.actors_[var_148_22.prefab_name] ~= nil then
						local var_148_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_22.prefab_name].transform, "story_v_out_410021", "410021036", "story_v_out_410021.awb")

						arg_145_1:RecordAudio("410021036", var_148_28)
						arg_145_1:RecordAudio("410021036", var_148_28)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_410021", "410021036", "story_v_out_410021.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_410021", "410021036", "story_v_out_410021.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_29 = math.max(var_148_20, arg_145_1.talkMaxDuration)

			if var_148_19 <= arg_145_1.time_ and arg_145_1.time_ < var_148_19 + var_148_29 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_19) / var_148_29

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_19 + var_148_29 and arg_145_1.time_ < var_148_19 + var_148_29 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play410021037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 410021037
		arg_149_1.duration_ = 15.4

		local var_149_0 = {
			zh = 9.166,
			ja = 15.4
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
				arg_149_0:Play410021038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1060"].transform
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1.var_.moveOldPos1060 = var_152_0.localPosition
				var_152_0.localScale = Vector3.New(1, 1, 1)

				arg_149_1:CheckSpriteTmpPos("1060", 2)

				local var_152_2 = var_152_0.childCount

				for iter_152_0 = 0, var_152_2 - 1 do
					local var_152_3 = var_152_0:GetChild(iter_152_0)

					if var_152_3.name == "split_4" or not string.find(var_152_3.name, "split") then
						var_152_3.gameObject:SetActive(true)
					else
						var_152_3.gameObject:SetActive(false)
					end
				end
			end

			local var_152_4 = 0.001

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_4 then
				local var_152_5 = (arg_149_1.time_ - var_152_1) / var_152_4
				local var_152_6 = Vector3.New(-390, -435, -40)

				var_152_0.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos1060, var_152_6, var_152_5)
			end

			if arg_149_1.time_ >= var_152_1 + var_152_4 and arg_149_1.time_ < var_152_1 + var_152_4 + arg_152_0 then
				var_152_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_152_7 = arg_149_1.actors_["1060"]
			local var_152_8 = 0

			if var_152_8 < arg_149_1.time_ and arg_149_1.time_ <= var_152_8 + arg_152_0 and arg_149_1.var_.actorSpriteComps1060 == nil then
				arg_149_1.var_.actorSpriteComps1060 = var_152_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_152_9 = 0.034

			if var_152_8 <= arg_149_1.time_ and arg_149_1.time_ < var_152_8 + var_152_9 then
				local var_152_10 = (arg_149_1.time_ - var_152_8) / var_152_9

				if arg_149_1.var_.actorSpriteComps1060 then
					for iter_152_1, iter_152_2 in pairs(arg_149_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_152_2 then
							local var_152_11 = Mathf.Lerp(iter_152_2.color.r, 1, var_152_10)

							iter_152_2.color = Color.New(var_152_11, var_152_11, var_152_11)
						end
					end
				end
			end

			if arg_149_1.time_ >= var_152_8 + var_152_9 and arg_149_1.time_ < var_152_8 + var_152_9 + arg_152_0 and arg_149_1.var_.actorSpriteComps1060 then
				local var_152_12 = 1

				for iter_152_3, iter_152_4 in pairs(arg_149_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_152_4 then
						iter_152_4.color = Color.New(var_152_12, var_152_12, var_152_12)
					end
				end

				arg_149_1.var_.actorSpriteComps1060 = nil
			end

			local var_152_13 = 0
			local var_152_14 = 1.025

			if var_152_13 < arg_149_1.time_ and arg_149_1.time_ <= var_152_13 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_15 = arg_149_1:FormatText(StoryNameCfg[584].name)

				arg_149_1.leftNameTxt_.text = var_152_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_16 = arg_149_1:GetWordFromCfg(410021037)
				local var_152_17 = arg_149_1:FormatText(var_152_16.content)

				arg_149_1.text_.text = var_152_17

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_18 = 41
				local var_152_19 = utf8.len(var_152_17)
				local var_152_20 = var_152_18 <= 0 and var_152_14 or var_152_14 * (var_152_19 / var_152_18)

				if var_152_20 > 0 and var_152_14 < var_152_20 then
					arg_149_1.talkMaxDuration = var_152_20

					if var_152_20 + var_152_13 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_20 + var_152_13
					end
				end

				arg_149_1.text_.text = var_152_17
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021037", "story_v_out_410021.awb") ~= 0 then
					local var_152_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021037", "story_v_out_410021.awb") / 1000

					if var_152_21 + var_152_13 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_21 + var_152_13
					end

					if var_152_16.prefab_name ~= "" and arg_149_1.actors_[var_152_16.prefab_name] ~= nil then
						local var_152_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_16.prefab_name].transform, "story_v_out_410021", "410021037", "story_v_out_410021.awb")

						arg_149_1:RecordAudio("410021037", var_152_22)
						arg_149_1:RecordAudio("410021037", var_152_22)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_410021", "410021037", "story_v_out_410021.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_410021", "410021037", "story_v_out_410021.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_23 = math.max(var_152_14, arg_149_1.talkMaxDuration)

			if var_152_13 <= arg_149_1.time_ and arg_149_1.time_ < var_152_13 + var_152_23 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_13) / var_152_23

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_13 + var_152_23 and arg_149_1.time_ < var_152_13 + var_152_23 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play410021038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 410021038
		arg_153_1.duration_ = 7.1

		local var_153_0 = {
			zh = 4.5,
			ja = 7.1
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
				arg_153_0:Play410021039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1060"].transform
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 then
				arg_153_1.var_.moveOldPos1060 = var_156_0.localPosition
				var_156_0.localScale = Vector3.New(1, 1, 1)

				arg_153_1:CheckSpriteTmpPos("1060", 2)

				local var_156_2 = var_156_0.childCount

				for iter_156_0 = 0, var_156_2 - 1 do
					local var_156_3 = var_156_0:GetChild(iter_156_0)

					if var_156_3.name == "split_4" or not string.find(var_156_3.name, "split") then
						var_156_3.gameObject:SetActive(true)
					else
						var_156_3.gameObject:SetActive(false)
					end
				end
			end

			local var_156_4 = 0.001

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_4 then
				local var_156_5 = (arg_153_1.time_ - var_156_1) / var_156_4
				local var_156_6 = Vector3.New(-390, -435, -40)

				var_156_0.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1060, var_156_6, var_156_5)
			end

			if arg_153_1.time_ >= var_156_1 + var_156_4 and arg_153_1.time_ < var_156_1 + var_156_4 + arg_156_0 then
				var_156_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_156_7 = arg_153_1.actors_["1060"]
			local var_156_8 = 0

			if var_156_8 < arg_153_1.time_ and arg_153_1.time_ <= var_156_8 + arg_156_0 and arg_153_1.var_.actorSpriteComps1060 == nil then
				arg_153_1.var_.actorSpriteComps1060 = var_156_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_156_9 = 0.034

			if var_156_8 <= arg_153_1.time_ and arg_153_1.time_ < var_156_8 + var_156_9 then
				local var_156_10 = (arg_153_1.time_ - var_156_8) / var_156_9

				if arg_153_1.var_.actorSpriteComps1060 then
					for iter_156_1, iter_156_2 in pairs(arg_153_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_156_2 then
							local var_156_11 = Mathf.Lerp(iter_156_2.color.r, 1, var_156_10)

							iter_156_2.color = Color.New(var_156_11, var_156_11, var_156_11)
						end
					end
				end
			end

			if arg_153_1.time_ >= var_156_8 + var_156_9 and arg_153_1.time_ < var_156_8 + var_156_9 + arg_156_0 and arg_153_1.var_.actorSpriteComps1060 then
				local var_156_12 = 1

				for iter_156_3, iter_156_4 in pairs(arg_153_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_156_4 then
						iter_156_4.color = Color.New(var_156_12, var_156_12, var_156_12)
					end
				end

				arg_153_1.var_.actorSpriteComps1060 = nil
			end

			local var_156_13 = 0
			local var_156_14 = 0.575

			if var_156_13 < arg_153_1.time_ and arg_153_1.time_ <= var_156_13 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_15 = arg_153_1:FormatText(StoryNameCfg[584].name)

				arg_153_1.leftNameTxt_.text = var_156_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_16 = arg_153_1:GetWordFromCfg(410021038)
				local var_156_17 = arg_153_1:FormatText(var_156_16.content)

				arg_153_1.text_.text = var_156_17

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_18 = 23
				local var_156_19 = utf8.len(var_156_17)
				local var_156_20 = var_156_18 <= 0 and var_156_14 or var_156_14 * (var_156_19 / var_156_18)

				if var_156_20 > 0 and var_156_14 < var_156_20 then
					arg_153_1.talkMaxDuration = var_156_20

					if var_156_20 + var_156_13 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_20 + var_156_13
					end
				end

				arg_153_1.text_.text = var_156_17
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021038", "story_v_out_410021.awb") ~= 0 then
					local var_156_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021038", "story_v_out_410021.awb") / 1000

					if var_156_21 + var_156_13 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_21 + var_156_13
					end

					if var_156_16.prefab_name ~= "" and arg_153_1.actors_[var_156_16.prefab_name] ~= nil then
						local var_156_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_16.prefab_name].transform, "story_v_out_410021", "410021038", "story_v_out_410021.awb")

						arg_153_1:RecordAudio("410021038", var_156_22)
						arg_153_1:RecordAudio("410021038", var_156_22)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_410021", "410021038", "story_v_out_410021.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_410021", "410021038", "story_v_out_410021.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_23 = math.max(var_156_14, arg_153_1.talkMaxDuration)

			if var_156_13 <= arg_153_1.time_ and arg_153_1.time_ < var_156_13 + var_156_23 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_13) / var_156_23

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_13 + var_156_23 and arg_153_1.time_ < var_156_13 + var_156_23 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play410021039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 410021039
		arg_157_1.duration_ = 12.866

		local var_157_0 = {
			zh = 10.2,
			ja = 12.866
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
				arg_157_0:Play410021040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1056"].transform
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1.var_.moveOldPos1056 = var_160_0.localPosition
				var_160_0.localScale = Vector3.New(1, 1, 1)

				arg_157_1:CheckSpriteTmpPos("1056", 4)

				local var_160_2 = var_160_0.childCount

				for iter_160_0 = 0, var_160_2 - 1 do
					local var_160_3 = var_160_0:GetChild(iter_160_0)

					if var_160_3.name == "split_1" or not string.find(var_160_3.name, "split") then
						var_160_3.gameObject:SetActive(true)
					else
						var_160_3.gameObject:SetActive(false)
					end
				end
			end

			local var_160_4 = 0.001

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_4 then
				local var_160_5 = (arg_157_1.time_ - var_160_1) / var_160_4
				local var_160_6 = Vector3.New(390, -350, -180)

				var_160_0.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1056, var_160_6, var_160_5)
			end

			if arg_157_1.time_ >= var_160_1 + var_160_4 and arg_157_1.time_ < var_160_1 + var_160_4 + arg_160_0 then
				var_160_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_160_7 = arg_157_1.actors_["1056"]
			local var_160_8 = 0

			if var_160_8 < arg_157_1.time_ and arg_157_1.time_ <= var_160_8 + arg_160_0 and arg_157_1.var_.actorSpriteComps1056 == nil then
				arg_157_1.var_.actorSpriteComps1056 = var_160_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_160_9 = 0.034

			if var_160_8 <= arg_157_1.time_ and arg_157_1.time_ < var_160_8 + var_160_9 then
				local var_160_10 = (arg_157_1.time_ - var_160_8) / var_160_9

				if arg_157_1.var_.actorSpriteComps1056 then
					for iter_160_1, iter_160_2 in pairs(arg_157_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_160_2 then
							local var_160_11 = Mathf.Lerp(iter_160_2.color.r, 1, var_160_10)

							iter_160_2.color = Color.New(var_160_11, var_160_11, var_160_11)
						end
					end
				end
			end

			if arg_157_1.time_ >= var_160_8 + var_160_9 and arg_157_1.time_ < var_160_8 + var_160_9 + arg_160_0 and arg_157_1.var_.actorSpriteComps1056 then
				local var_160_12 = 1

				for iter_160_3, iter_160_4 in pairs(arg_157_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_160_4 then
						iter_160_4.color = Color.New(var_160_12, var_160_12, var_160_12)
					end
				end

				arg_157_1.var_.actorSpriteComps1056 = nil
			end

			local var_160_13 = arg_157_1.actors_["1060"]
			local var_160_14 = 0

			if var_160_14 < arg_157_1.time_ and arg_157_1.time_ <= var_160_14 + arg_160_0 and arg_157_1.var_.actorSpriteComps1060 == nil then
				arg_157_1.var_.actorSpriteComps1060 = var_160_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_160_15 = 0.034

			if var_160_14 <= arg_157_1.time_ and arg_157_1.time_ < var_160_14 + var_160_15 then
				local var_160_16 = (arg_157_1.time_ - var_160_14) / var_160_15

				if arg_157_1.var_.actorSpriteComps1060 then
					for iter_160_5, iter_160_6 in pairs(arg_157_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_160_6 then
							local var_160_17 = Mathf.Lerp(iter_160_6.color.r, 0.5, var_160_16)

							iter_160_6.color = Color.New(var_160_17, var_160_17, var_160_17)
						end
					end
				end
			end

			if arg_157_1.time_ >= var_160_14 + var_160_15 and arg_157_1.time_ < var_160_14 + var_160_15 + arg_160_0 and arg_157_1.var_.actorSpriteComps1060 then
				local var_160_18 = 0.5

				for iter_160_7, iter_160_8 in pairs(arg_157_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_160_8 then
						iter_160_8.color = Color.New(var_160_18, var_160_18, var_160_18)
					end
				end

				arg_157_1.var_.actorSpriteComps1060 = nil
			end

			local var_160_19 = 0
			local var_160_20 = 1.275

			if var_160_19 < arg_157_1.time_ and arg_157_1.time_ <= var_160_19 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_21 = arg_157_1:FormatText(StoryNameCfg[605].name)

				arg_157_1.leftNameTxt_.text = var_160_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_22 = arg_157_1:GetWordFromCfg(410021039)
				local var_160_23 = arg_157_1:FormatText(var_160_22.content)

				arg_157_1.text_.text = var_160_23

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_24 = 51
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

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021039", "story_v_out_410021.awb") ~= 0 then
					local var_160_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021039", "story_v_out_410021.awb") / 1000

					if var_160_27 + var_160_19 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_27 + var_160_19
					end

					if var_160_22.prefab_name ~= "" and arg_157_1.actors_[var_160_22.prefab_name] ~= nil then
						local var_160_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_22.prefab_name].transform, "story_v_out_410021", "410021039", "story_v_out_410021.awb")

						arg_157_1:RecordAudio("410021039", var_160_28)
						arg_157_1:RecordAudio("410021039", var_160_28)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_410021", "410021039", "story_v_out_410021.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_410021", "410021039", "story_v_out_410021.awb")
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
	Play410021040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 410021040
		arg_161_1.duration_ = 8.766

		local var_161_0 = {
			zh = 6.7,
			ja = 8.766
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
				arg_161_0:Play410021041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1056"].transform
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPos1056 = var_164_0.localPosition
				var_164_0.localScale = Vector3.New(1, 1, 1)

				arg_161_1:CheckSpriteTmpPos("1056", 4)

				local var_164_2 = var_164_0.childCount

				for iter_164_0 = 0, var_164_2 - 1 do
					local var_164_3 = var_164_0:GetChild(iter_164_0)

					if var_164_3.name == "split_1" or not string.find(var_164_3.name, "split") then
						var_164_3.gameObject:SetActive(true)
					else
						var_164_3.gameObject:SetActive(false)
					end
				end
			end

			local var_164_4 = 0.001

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_4 then
				local var_164_5 = (arg_161_1.time_ - var_164_1) / var_164_4
				local var_164_6 = Vector3.New(390, -350, -180)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1056, var_164_6, var_164_5)
			end

			if arg_161_1.time_ >= var_164_1 + var_164_4 and arg_161_1.time_ < var_164_1 + var_164_4 + arg_164_0 then
				var_164_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_164_7 = arg_161_1.actors_["1056"]
			local var_164_8 = 0

			if var_164_8 < arg_161_1.time_ and arg_161_1.time_ <= var_164_8 + arg_164_0 and arg_161_1.var_.actorSpriteComps1056 == nil then
				arg_161_1.var_.actorSpriteComps1056 = var_164_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_164_9 = 0.034

			if var_164_8 <= arg_161_1.time_ and arg_161_1.time_ < var_164_8 + var_164_9 then
				local var_164_10 = (arg_161_1.time_ - var_164_8) / var_164_9

				if arg_161_1.var_.actorSpriteComps1056 then
					for iter_164_1, iter_164_2 in pairs(arg_161_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_164_2 then
							local var_164_11 = Mathf.Lerp(iter_164_2.color.r, 1, var_164_10)

							iter_164_2.color = Color.New(var_164_11, var_164_11, var_164_11)
						end
					end
				end
			end

			if arg_161_1.time_ >= var_164_8 + var_164_9 and arg_161_1.time_ < var_164_8 + var_164_9 + arg_164_0 and arg_161_1.var_.actorSpriteComps1056 then
				local var_164_12 = 1

				for iter_164_3, iter_164_4 in pairs(arg_161_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_164_4 then
						iter_164_4.color = Color.New(var_164_12, var_164_12, var_164_12)
					end
				end

				arg_161_1.var_.actorSpriteComps1056 = nil
			end

			local var_164_13 = 0
			local var_164_14 = 0.875

			if var_164_13 < arg_161_1.time_ and arg_161_1.time_ <= var_164_13 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_15 = arg_161_1:FormatText(StoryNameCfg[605].name)

				arg_161_1.leftNameTxt_.text = var_164_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_16 = arg_161_1:GetWordFromCfg(410021040)
				local var_164_17 = arg_161_1:FormatText(var_164_16.content)

				arg_161_1.text_.text = var_164_17

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_18 = 35
				local var_164_19 = utf8.len(var_164_17)
				local var_164_20 = var_164_18 <= 0 and var_164_14 or var_164_14 * (var_164_19 / var_164_18)

				if var_164_20 > 0 and var_164_14 < var_164_20 then
					arg_161_1.talkMaxDuration = var_164_20

					if var_164_20 + var_164_13 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_20 + var_164_13
					end
				end

				arg_161_1.text_.text = var_164_17
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021040", "story_v_out_410021.awb") ~= 0 then
					local var_164_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021040", "story_v_out_410021.awb") / 1000

					if var_164_21 + var_164_13 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_21 + var_164_13
					end

					if var_164_16.prefab_name ~= "" and arg_161_1.actors_[var_164_16.prefab_name] ~= nil then
						local var_164_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_16.prefab_name].transform, "story_v_out_410021", "410021040", "story_v_out_410021.awb")

						arg_161_1:RecordAudio("410021040", var_164_22)
						arg_161_1:RecordAudio("410021040", var_164_22)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_410021", "410021040", "story_v_out_410021.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_410021", "410021040", "story_v_out_410021.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_23 = math.max(var_164_14, arg_161_1.talkMaxDuration)

			if var_164_13 <= arg_161_1.time_ and arg_161_1.time_ < var_164_13 + var_164_23 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_13) / var_164_23

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_13 + var_164_23 and arg_161_1.time_ < var_164_13 + var_164_23 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play410021041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 410021041
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play410021042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["1056"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 and arg_165_1.var_.actorSpriteComps1056 == nil then
				arg_165_1.var_.actorSpriteComps1056 = var_168_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_168_2 = 0.034

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2

				if arg_165_1.var_.actorSpriteComps1056 then
					for iter_168_0, iter_168_1 in pairs(arg_165_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_168_1 then
							local var_168_4 = Mathf.Lerp(iter_168_1.color.r, 0.5, var_168_3)

							iter_168_1.color = Color.New(var_168_4, var_168_4, var_168_4)
						end
					end
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 and arg_165_1.var_.actorSpriteComps1056 then
				local var_168_5 = 0.5

				for iter_168_2, iter_168_3 in pairs(arg_165_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_168_3 then
						iter_168_3.color = Color.New(var_168_5, var_168_5, var_168_5)
					end
				end

				arg_165_1.var_.actorSpriteComps1056 = nil
			end

			local var_168_6 = arg_165_1.actors_["1060"]
			local var_168_7 = 0

			if var_168_7 < arg_165_1.time_ and arg_165_1.time_ <= var_168_7 + arg_168_0 and arg_165_1.var_.actorSpriteComps1060 == nil then
				arg_165_1.var_.actorSpriteComps1060 = var_168_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_168_8 = 0.034

			if var_168_7 <= arg_165_1.time_ and arg_165_1.time_ < var_168_7 + var_168_8 then
				local var_168_9 = (arg_165_1.time_ - var_168_7) / var_168_8

				if arg_165_1.var_.actorSpriteComps1060 then
					for iter_168_4, iter_168_5 in pairs(arg_165_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_168_5 then
							local var_168_10 = Mathf.Lerp(iter_168_5.color.r, 0.5, var_168_9)

							iter_168_5.color = Color.New(var_168_10, var_168_10, var_168_10)
						end
					end
				end
			end

			if arg_165_1.time_ >= var_168_7 + var_168_8 and arg_165_1.time_ < var_168_7 + var_168_8 + arg_168_0 and arg_165_1.var_.actorSpriteComps1060 then
				local var_168_11 = 0.5

				for iter_168_6, iter_168_7 in pairs(arg_165_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_168_7 then
						iter_168_7.color = Color.New(var_168_11, var_168_11, var_168_11)
					end
				end

				arg_165_1.var_.actorSpriteComps1060 = nil
			end

			local var_168_12 = 0
			local var_168_13 = 1.725

			if var_168_12 < arg_165_1.time_ and arg_165_1.time_ <= var_168_12 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, false)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_14 = arg_165_1:GetWordFromCfg(410021041)
				local var_168_15 = arg_165_1:FormatText(var_168_14.content)

				arg_165_1.text_.text = var_168_15

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_16 = 69
				local var_168_17 = utf8.len(var_168_15)
				local var_168_18 = var_168_16 <= 0 and var_168_13 or var_168_13 * (var_168_17 / var_168_16)

				if var_168_18 > 0 and var_168_13 < var_168_18 then
					arg_165_1.talkMaxDuration = var_168_18

					if var_168_18 + var_168_12 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_18 + var_168_12
					end
				end

				arg_165_1.text_.text = var_168_15
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_19 = math.max(var_168_13, arg_165_1.talkMaxDuration)

			if var_168_12 <= arg_165_1.time_ and arg_165_1.time_ < var_168_12 + var_168_19 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_12) / var_168_19

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_12 + var_168_19 and arg_165_1.time_ < var_168_12 + var_168_19 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play410021042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 410021042
		arg_169_1.duration_ = 5

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play410021043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = 0
			local var_172_1 = 0.8

			if var_172_0 < arg_169_1.time_ and arg_169_1.time_ <= var_172_0 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, false)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_2 = arg_169_1:GetWordFromCfg(410021042)
				local var_172_3 = arg_169_1:FormatText(var_172_2.content)

				arg_169_1.text_.text = var_172_3

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_4 = 32
				local var_172_5 = utf8.len(var_172_3)
				local var_172_6 = var_172_4 <= 0 and var_172_1 or var_172_1 * (var_172_5 / var_172_4)

				if var_172_6 > 0 and var_172_1 < var_172_6 then
					arg_169_1.talkMaxDuration = var_172_6

					if var_172_6 + var_172_0 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_6 + var_172_0
					end
				end

				arg_169_1.text_.text = var_172_3
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)
				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_7 = math.max(var_172_1, arg_169_1.talkMaxDuration)

			if var_172_0 <= arg_169_1.time_ and arg_169_1.time_ < var_172_0 + var_172_7 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_0) / var_172_7

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_0 + var_172_7 and arg_169_1.time_ < var_172_0 + var_172_7 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play410021043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 410021043
		arg_173_1.duration_ = 8.933

		local var_173_0 = {
			zh = 6.233,
			ja = 8.933
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
				arg_173_0:Play410021044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1056"].transform
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.var_.moveOldPos1056 = var_176_0.localPosition
				var_176_0.localScale = Vector3.New(1, 1, 1)

				arg_173_1:CheckSpriteTmpPos("1056", 4)

				local var_176_2 = var_176_0.childCount

				for iter_176_0 = 0, var_176_2 - 1 do
					local var_176_3 = var_176_0:GetChild(iter_176_0)

					if var_176_3.name == "split_1" or not string.find(var_176_3.name, "split") then
						var_176_3.gameObject:SetActive(true)
					else
						var_176_3.gameObject:SetActive(false)
					end
				end
			end

			local var_176_4 = 0.001

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_4 then
				local var_176_5 = (arg_173_1.time_ - var_176_1) / var_176_4
				local var_176_6 = Vector3.New(390, -350, -180)

				var_176_0.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1056, var_176_6, var_176_5)
			end

			if arg_173_1.time_ >= var_176_1 + var_176_4 and arg_173_1.time_ < var_176_1 + var_176_4 + arg_176_0 then
				var_176_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_176_7 = arg_173_1.actors_["1056"]
			local var_176_8 = 0

			if var_176_8 < arg_173_1.time_ and arg_173_1.time_ <= var_176_8 + arg_176_0 and arg_173_1.var_.actorSpriteComps1056 == nil then
				arg_173_1.var_.actorSpriteComps1056 = var_176_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_176_9 = 0.034

			if var_176_8 <= arg_173_1.time_ and arg_173_1.time_ < var_176_8 + var_176_9 then
				local var_176_10 = (arg_173_1.time_ - var_176_8) / var_176_9

				if arg_173_1.var_.actorSpriteComps1056 then
					for iter_176_1, iter_176_2 in pairs(arg_173_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_176_2 then
							local var_176_11 = Mathf.Lerp(iter_176_2.color.r, 1, var_176_10)

							iter_176_2.color = Color.New(var_176_11, var_176_11, var_176_11)
						end
					end
				end
			end

			if arg_173_1.time_ >= var_176_8 + var_176_9 and arg_173_1.time_ < var_176_8 + var_176_9 + arg_176_0 and arg_173_1.var_.actorSpriteComps1056 then
				local var_176_12 = 1

				for iter_176_3, iter_176_4 in pairs(arg_173_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_176_4 then
						iter_176_4.color = Color.New(var_176_12, var_176_12, var_176_12)
					end
				end

				arg_173_1.var_.actorSpriteComps1056 = nil
			end

			local var_176_13 = 0
			local var_176_14 = 0.9

			if var_176_13 < arg_173_1.time_ and arg_173_1.time_ <= var_176_13 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_15 = arg_173_1:FormatText(StoryNameCfg[605].name)

				arg_173_1.leftNameTxt_.text = var_176_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_16 = arg_173_1:GetWordFromCfg(410021043)
				local var_176_17 = arg_173_1:FormatText(var_176_16.content)

				arg_173_1.text_.text = var_176_17

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_18 = 36
				local var_176_19 = utf8.len(var_176_17)
				local var_176_20 = var_176_18 <= 0 and var_176_14 or var_176_14 * (var_176_19 / var_176_18)

				if var_176_20 > 0 and var_176_14 < var_176_20 then
					arg_173_1.talkMaxDuration = var_176_20

					if var_176_20 + var_176_13 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_20 + var_176_13
					end
				end

				arg_173_1.text_.text = var_176_17
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021043", "story_v_out_410021.awb") ~= 0 then
					local var_176_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021043", "story_v_out_410021.awb") / 1000

					if var_176_21 + var_176_13 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_21 + var_176_13
					end

					if var_176_16.prefab_name ~= "" and arg_173_1.actors_[var_176_16.prefab_name] ~= nil then
						local var_176_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_16.prefab_name].transform, "story_v_out_410021", "410021043", "story_v_out_410021.awb")

						arg_173_1:RecordAudio("410021043", var_176_22)
						arg_173_1:RecordAudio("410021043", var_176_22)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_410021", "410021043", "story_v_out_410021.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_410021", "410021043", "story_v_out_410021.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_23 = math.max(var_176_14, arg_173_1.talkMaxDuration)

			if var_176_13 <= arg_173_1.time_ and arg_173_1.time_ < var_176_13 + var_176_23 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_13) / var_176_23

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_13 + var_176_23 and arg_173_1.time_ < var_176_13 + var_176_23 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play410021044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 410021044
		arg_177_1.duration_ = 12.266

		local var_177_0 = {
			zh = 9.966,
			ja = 12.266
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
				arg_177_0:Play410021045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["1060"].transform
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 then
				arg_177_1.var_.moveOldPos1060 = var_180_0.localPosition
				var_180_0.localScale = Vector3.New(1, 1, 1)

				arg_177_1:CheckSpriteTmpPos("1060", 2)

				local var_180_2 = var_180_0.childCount

				for iter_180_0 = 0, var_180_2 - 1 do
					local var_180_3 = var_180_0:GetChild(iter_180_0)

					if var_180_3.name == "" or not string.find(var_180_3.name, "split") then
						var_180_3.gameObject:SetActive(true)
					else
						var_180_3.gameObject:SetActive(false)
					end
				end
			end

			local var_180_4 = 0.001

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_4 then
				local var_180_5 = (arg_177_1.time_ - var_180_1) / var_180_4
				local var_180_6 = Vector3.New(-390, -435, -40)

				var_180_0.localPosition = Vector3.Lerp(arg_177_1.var_.moveOldPos1060, var_180_6, var_180_5)
			end

			if arg_177_1.time_ >= var_180_1 + var_180_4 and arg_177_1.time_ < var_180_1 + var_180_4 + arg_180_0 then
				var_180_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_180_7 = arg_177_1.actors_["1060"]
			local var_180_8 = 0

			if var_180_8 < arg_177_1.time_ and arg_177_1.time_ <= var_180_8 + arg_180_0 and arg_177_1.var_.actorSpriteComps1060 == nil then
				arg_177_1.var_.actorSpriteComps1060 = var_180_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_180_9 = 0.034

			if var_180_8 <= arg_177_1.time_ and arg_177_1.time_ < var_180_8 + var_180_9 then
				local var_180_10 = (arg_177_1.time_ - var_180_8) / var_180_9

				if arg_177_1.var_.actorSpriteComps1060 then
					for iter_180_1, iter_180_2 in pairs(arg_177_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_180_2 then
							local var_180_11 = Mathf.Lerp(iter_180_2.color.r, 1, var_180_10)

							iter_180_2.color = Color.New(var_180_11, var_180_11, var_180_11)
						end
					end
				end
			end

			if arg_177_1.time_ >= var_180_8 + var_180_9 and arg_177_1.time_ < var_180_8 + var_180_9 + arg_180_0 and arg_177_1.var_.actorSpriteComps1060 then
				local var_180_12 = 1

				for iter_180_3, iter_180_4 in pairs(arg_177_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_180_4 then
						iter_180_4.color = Color.New(var_180_12, var_180_12, var_180_12)
					end
				end

				arg_177_1.var_.actorSpriteComps1060 = nil
			end

			local var_180_13 = arg_177_1.actors_["1056"]
			local var_180_14 = 0

			if var_180_14 < arg_177_1.time_ and arg_177_1.time_ <= var_180_14 + arg_180_0 and arg_177_1.var_.actorSpriteComps1056 == nil then
				arg_177_1.var_.actorSpriteComps1056 = var_180_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_180_15 = 0.034

			if var_180_14 <= arg_177_1.time_ and arg_177_1.time_ < var_180_14 + var_180_15 then
				local var_180_16 = (arg_177_1.time_ - var_180_14) / var_180_15

				if arg_177_1.var_.actorSpriteComps1056 then
					for iter_180_5, iter_180_6 in pairs(arg_177_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_180_6 then
							local var_180_17 = Mathf.Lerp(iter_180_6.color.r, 0.5, var_180_16)

							iter_180_6.color = Color.New(var_180_17, var_180_17, var_180_17)
						end
					end
				end
			end

			if arg_177_1.time_ >= var_180_14 + var_180_15 and arg_177_1.time_ < var_180_14 + var_180_15 + arg_180_0 and arg_177_1.var_.actorSpriteComps1056 then
				local var_180_18 = 0.5

				for iter_180_7, iter_180_8 in pairs(arg_177_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_180_8 then
						iter_180_8.color = Color.New(var_180_18, var_180_18, var_180_18)
					end
				end

				arg_177_1.var_.actorSpriteComps1056 = nil
			end

			local var_180_19 = 0
			local var_180_20 = 1.15

			if var_180_19 < arg_177_1.time_ and arg_177_1.time_ <= var_180_19 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_21 = arg_177_1:FormatText(StoryNameCfg[584].name)

				arg_177_1.leftNameTxt_.text = var_180_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_22 = arg_177_1:GetWordFromCfg(410021044)
				local var_180_23 = arg_177_1:FormatText(var_180_22.content)

				arg_177_1.text_.text = var_180_23

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_24 = 46
				local var_180_25 = utf8.len(var_180_23)
				local var_180_26 = var_180_24 <= 0 and var_180_20 or var_180_20 * (var_180_25 / var_180_24)

				if var_180_26 > 0 and var_180_20 < var_180_26 then
					arg_177_1.talkMaxDuration = var_180_26

					if var_180_26 + var_180_19 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_26 + var_180_19
					end
				end

				arg_177_1.text_.text = var_180_23
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021044", "story_v_out_410021.awb") ~= 0 then
					local var_180_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021044", "story_v_out_410021.awb") / 1000

					if var_180_27 + var_180_19 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_27 + var_180_19
					end

					if var_180_22.prefab_name ~= "" and arg_177_1.actors_[var_180_22.prefab_name] ~= nil then
						local var_180_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_22.prefab_name].transform, "story_v_out_410021", "410021044", "story_v_out_410021.awb")

						arg_177_1:RecordAudio("410021044", var_180_28)
						arg_177_1:RecordAudio("410021044", var_180_28)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_410021", "410021044", "story_v_out_410021.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_410021", "410021044", "story_v_out_410021.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_29 = math.max(var_180_20, arg_177_1.talkMaxDuration)

			if var_180_19 <= arg_177_1.time_ and arg_177_1.time_ < var_180_19 + var_180_29 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_19) / var_180_29

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_19 + var_180_29 and arg_177_1.time_ < var_180_19 + var_180_29 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play410021045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 410021045
		arg_181_1.duration_ = 3.666

		local var_181_0 = {
			zh = 2.8,
			ja = 3.666
		}
		local var_181_1 = manager.audio:GetLocalizationFlag()

		if var_181_0[var_181_1] ~= nil then
			arg_181_1.duration_ = var_181_0[var_181_1]
		end

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play410021046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1056"].transform
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 then
				arg_181_1.var_.moveOldPos1056 = var_184_0.localPosition
				var_184_0.localScale = Vector3.New(1, 1, 1)

				arg_181_1:CheckSpriteTmpPos("1056", 4)

				local var_184_2 = var_184_0.childCount

				for iter_184_0 = 0, var_184_2 - 1 do
					local var_184_3 = var_184_0:GetChild(iter_184_0)

					if var_184_3.name == "split_4" or not string.find(var_184_3.name, "split") then
						var_184_3.gameObject:SetActive(true)
					else
						var_184_3.gameObject:SetActive(false)
					end
				end
			end

			local var_184_4 = 0.001

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_4 then
				local var_184_5 = (arg_181_1.time_ - var_184_1) / var_184_4
				local var_184_6 = Vector3.New(390, -350, -180)

				var_184_0.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos1056, var_184_6, var_184_5)
			end

			if arg_181_1.time_ >= var_184_1 + var_184_4 and arg_181_1.time_ < var_184_1 + var_184_4 + arg_184_0 then
				var_184_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_184_7 = arg_181_1.actors_["1056"]
			local var_184_8 = 0

			if var_184_8 < arg_181_1.time_ and arg_181_1.time_ <= var_184_8 + arg_184_0 and arg_181_1.var_.actorSpriteComps1056 == nil then
				arg_181_1.var_.actorSpriteComps1056 = var_184_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_184_9 = 0.034

			if var_184_8 <= arg_181_1.time_ and arg_181_1.time_ < var_184_8 + var_184_9 then
				local var_184_10 = (arg_181_1.time_ - var_184_8) / var_184_9

				if arg_181_1.var_.actorSpriteComps1056 then
					for iter_184_1, iter_184_2 in pairs(arg_181_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_184_2 then
							local var_184_11 = Mathf.Lerp(iter_184_2.color.r, 1, var_184_10)

							iter_184_2.color = Color.New(var_184_11, var_184_11, var_184_11)
						end
					end
				end
			end

			if arg_181_1.time_ >= var_184_8 + var_184_9 and arg_181_1.time_ < var_184_8 + var_184_9 + arg_184_0 and arg_181_1.var_.actorSpriteComps1056 then
				local var_184_12 = 1

				for iter_184_3, iter_184_4 in pairs(arg_181_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_184_4 then
						iter_184_4.color = Color.New(var_184_12, var_184_12, var_184_12)
					end
				end

				arg_181_1.var_.actorSpriteComps1056 = nil
			end

			local var_184_13 = arg_181_1.actors_["1060"]
			local var_184_14 = 0

			if var_184_14 < arg_181_1.time_ and arg_181_1.time_ <= var_184_14 + arg_184_0 and arg_181_1.var_.actorSpriteComps1060 == nil then
				arg_181_1.var_.actorSpriteComps1060 = var_184_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_184_15 = 0.034

			if var_184_14 <= arg_181_1.time_ and arg_181_1.time_ < var_184_14 + var_184_15 then
				local var_184_16 = (arg_181_1.time_ - var_184_14) / var_184_15

				if arg_181_1.var_.actorSpriteComps1060 then
					for iter_184_5, iter_184_6 in pairs(arg_181_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_184_6 then
							local var_184_17 = Mathf.Lerp(iter_184_6.color.r, 0.5, var_184_16)

							iter_184_6.color = Color.New(var_184_17, var_184_17, var_184_17)
						end
					end
				end
			end

			if arg_181_1.time_ >= var_184_14 + var_184_15 and arg_181_1.time_ < var_184_14 + var_184_15 + arg_184_0 and arg_181_1.var_.actorSpriteComps1060 then
				local var_184_18 = 0.5

				for iter_184_7, iter_184_8 in pairs(arg_181_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_184_8 then
						iter_184_8.color = Color.New(var_184_18, var_184_18, var_184_18)
					end
				end

				arg_181_1.var_.actorSpriteComps1060 = nil
			end

			local var_184_19 = 0
			local var_184_20 = 0.275

			if var_184_19 < arg_181_1.time_ and arg_181_1.time_ <= var_184_19 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_21 = arg_181_1:FormatText(StoryNameCfg[605].name)

				arg_181_1.leftNameTxt_.text = var_184_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_22 = arg_181_1:GetWordFromCfg(410021045)
				local var_184_23 = arg_181_1:FormatText(var_184_22.content)

				arg_181_1.text_.text = var_184_23

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_24 = 11
				local var_184_25 = utf8.len(var_184_23)
				local var_184_26 = var_184_24 <= 0 and var_184_20 or var_184_20 * (var_184_25 / var_184_24)

				if var_184_26 > 0 and var_184_20 < var_184_26 then
					arg_181_1.talkMaxDuration = var_184_26

					if var_184_26 + var_184_19 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_26 + var_184_19
					end
				end

				arg_181_1.text_.text = var_184_23
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021045", "story_v_out_410021.awb") ~= 0 then
					local var_184_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021045", "story_v_out_410021.awb") / 1000

					if var_184_27 + var_184_19 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_27 + var_184_19
					end

					if var_184_22.prefab_name ~= "" and arg_181_1.actors_[var_184_22.prefab_name] ~= nil then
						local var_184_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_22.prefab_name].transform, "story_v_out_410021", "410021045", "story_v_out_410021.awb")

						arg_181_1:RecordAudio("410021045", var_184_28)
						arg_181_1:RecordAudio("410021045", var_184_28)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_410021", "410021045", "story_v_out_410021.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_410021", "410021045", "story_v_out_410021.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_29 = math.max(var_184_20, arg_181_1.talkMaxDuration)

			if var_184_19 <= arg_181_1.time_ and arg_181_1.time_ < var_184_19 + var_184_29 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_19) / var_184_29

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_19 + var_184_29 and arg_181_1.time_ < var_184_19 + var_184_29 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play410021046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 410021046
		arg_185_1.duration_ = 5.3

		local var_185_0 = {
			zh = 4.533,
			ja = 5.3
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
				arg_185_0:Play410021047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["1060"].transform
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 then
				arg_185_1.var_.moveOldPos1060 = var_188_0.localPosition
				var_188_0.localScale = Vector3.New(1, 1, 1)

				arg_185_1:CheckSpriteTmpPos("1060", 2)

				local var_188_2 = var_188_0.childCount

				for iter_188_0 = 0, var_188_2 - 1 do
					local var_188_3 = var_188_0:GetChild(iter_188_0)

					if var_188_3.name == "" or not string.find(var_188_3.name, "split") then
						var_188_3.gameObject:SetActive(true)
					else
						var_188_3.gameObject:SetActive(false)
					end
				end
			end

			local var_188_4 = 0.001

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_4 then
				local var_188_5 = (arg_185_1.time_ - var_188_1) / var_188_4
				local var_188_6 = Vector3.New(-390, -435, -40)

				var_188_0.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos1060, var_188_6, var_188_5)
			end

			if arg_185_1.time_ >= var_188_1 + var_188_4 and arg_185_1.time_ < var_188_1 + var_188_4 + arg_188_0 then
				var_188_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_188_7 = arg_185_1.actors_["1060"]
			local var_188_8 = 0

			if var_188_8 < arg_185_1.time_ and arg_185_1.time_ <= var_188_8 + arg_188_0 and arg_185_1.var_.actorSpriteComps1060 == nil then
				arg_185_1.var_.actorSpriteComps1060 = var_188_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_188_9 = 0.034

			if var_188_8 <= arg_185_1.time_ and arg_185_1.time_ < var_188_8 + var_188_9 then
				local var_188_10 = (arg_185_1.time_ - var_188_8) / var_188_9

				if arg_185_1.var_.actorSpriteComps1060 then
					for iter_188_1, iter_188_2 in pairs(arg_185_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_188_2 then
							local var_188_11 = Mathf.Lerp(iter_188_2.color.r, 1, var_188_10)

							iter_188_2.color = Color.New(var_188_11, var_188_11, var_188_11)
						end
					end
				end
			end

			if arg_185_1.time_ >= var_188_8 + var_188_9 and arg_185_1.time_ < var_188_8 + var_188_9 + arg_188_0 and arg_185_1.var_.actorSpriteComps1060 then
				local var_188_12 = 1

				for iter_188_3, iter_188_4 in pairs(arg_185_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_188_4 then
						iter_188_4.color = Color.New(var_188_12, var_188_12, var_188_12)
					end
				end

				arg_185_1.var_.actorSpriteComps1060 = nil
			end

			local var_188_13 = arg_185_1.actors_["1056"]
			local var_188_14 = 0

			if var_188_14 < arg_185_1.time_ and arg_185_1.time_ <= var_188_14 + arg_188_0 and arg_185_1.var_.actorSpriteComps1056 == nil then
				arg_185_1.var_.actorSpriteComps1056 = var_188_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_188_15 = 0.034

			if var_188_14 <= arg_185_1.time_ and arg_185_1.time_ < var_188_14 + var_188_15 then
				local var_188_16 = (arg_185_1.time_ - var_188_14) / var_188_15

				if arg_185_1.var_.actorSpriteComps1056 then
					for iter_188_5, iter_188_6 in pairs(arg_185_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_188_6 then
							local var_188_17 = Mathf.Lerp(iter_188_6.color.r, 0.5, var_188_16)

							iter_188_6.color = Color.New(var_188_17, var_188_17, var_188_17)
						end
					end
				end
			end

			if arg_185_1.time_ >= var_188_14 + var_188_15 and arg_185_1.time_ < var_188_14 + var_188_15 + arg_188_0 and arg_185_1.var_.actorSpriteComps1056 then
				local var_188_18 = 0.5

				for iter_188_7, iter_188_8 in pairs(arg_185_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_188_8 then
						iter_188_8.color = Color.New(var_188_18, var_188_18, var_188_18)
					end
				end

				arg_185_1.var_.actorSpriteComps1056 = nil
			end

			local var_188_19 = 0
			local var_188_20 = 0.425

			if var_188_19 < arg_185_1.time_ and arg_185_1.time_ <= var_188_19 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_21 = arg_185_1:FormatText(StoryNameCfg[584].name)

				arg_185_1.leftNameTxt_.text = var_188_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_22 = arg_185_1:GetWordFromCfg(410021046)
				local var_188_23 = arg_185_1:FormatText(var_188_22.content)

				arg_185_1.text_.text = var_188_23

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_24 = 17
				local var_188_25 = utf8.len(var_188_23)
				local var_188_26 = var_188_24 <= 0 and var_188_20 or var_188_20 * (var_188_25 / var_188_24)

				if var_188_26 > 0 and var_188_20 < var_188_26 then
					arg_185_1.talkMaxDuration = var_188_26

					if var_188_26 + var_188_19 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_26 + var_188_19
					end
				end

				arg_185_1.text_.text = var_188_23
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021046", "story_v_out_410021.awb") ~= 0 then
					local var_188_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021046", "story_v_out_410021.awb") / 1000

					if var_188_27 + var_188_19 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_27 + var_188_19
					end

					if var_188_22.prefab_name ~= "" and arg_185_1.actors_[var_188_22.prefab_name] ~= nil then
						local var_188_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_22.prefab_name].transform, "story_v_out_410021", "410021046", "story_v_out_410021.awb")

						arg_185_1:RecordAudio("410021046", var_188_28)
						arg_185_1:RecordAudio("410021046", var_188_28)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_410021", "410021046", "story_v_out_410021.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_410021", "410021046", "story_v_out_410021.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_29 = math.max(var_188_20, arg_185_1.talkMaxDuration)

			if var_188_19 <= arg_185_1.time_ and arg_185_1.time_ < var_188_19 + var_188_29 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_19) / var_188_29

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_19 + var_188_29 and arg_185_1.time_ < var_188_19 + var_188_29 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play410021047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 410021047
		arg_189_1.duration_ = 5.266

		local var_189_0 = {
			zh = 3.566,
			ja = 5.266
		}
		local var_189_1 = manager.audio:GetLocalizationFlag()

		if var_189_0[var_189_1] ~= nil then
			arg_189_1.duration_ = var_189_0[var_189_1]
		end

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play410021048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["1056"].transform
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 then
				arg_189_1.var_.moveOldPos1056 = var_192_0.localPosition
				var_192_0.localScale = Vector3.New(1, 1, 1)

				arg_189_1:CheckSpriteTmpPos("1056", 4)

				local var_192_2 = var_192_0.childCount

				for iter_192_0 = 0, var_192_2 - 1 do
					local var_192_3 = var_192_0:GetChild(iter_192_0)

					if var_192_3.name == "split_4" or not string.find(var_192_3.name, "split") then
						var_192_3.gameObject:SetActive(true)
					else
						var_192_3.gameObject:SetActive(false)
					end
				end
			end

			local var_192_4 = 0.001

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_4 then
				local var_192_5 = (arg_189_1.time_ - var_192_1) / var_192_4
				local var_192_6 = Vector3.New(390, -350, -180)

				var_192_0.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos1056, var_192_6, var_192_5)
			end

			if arg_189_1.time_ >= var_192_1 + var_192_4 and arg_189_1.time_ < var_192_1 + var_192_4 + arg_192_0 then
				var_192_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_192_7 = arg_189_1.actors_["1056"]
			local var_192_8 = 0

			if var_192_8 < arg_189_1.time_ and arg_189_1.time_ <= var_192_8 + arg_192_0 and arg_189_1.var_.actorSpriteComps1056 == nil then
				arg_189_1.var_.actorSpriteComps1056 = var_192_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_192_9 = 0.034

			if var_192_8 <= arg_189_1.time_ and arg_189_1.time_ < var_192_8 + var_192_9 then
				local var_192_10 = (arg_189_1.time_ - var_192_8) / var_192_9

				if arg_189_1.var_.actorSpriteComps1056 then
					for iter_192_1, iter_192_2 in pairs(arg_189_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_192_2 then
							local var_192_11 = Mathf.Lerp(iter_192_2.color.r, 1, var_192_10)

							iter_192_2.color = Color.New(var_192_11, var_192_11, var_192_11)
						end
					end
				end
			end

			if arg_189_1.time_ >= var_192_8 + var_192_9 and arg_189_1.time_ < var_192_8 + var_192_9 + arg_192_0 and arg_189_1.var_.actorSpriteComps1056 then
				local var_192_12 = 1

				for iter_192_3, iter_192_4 in pairs(arg_189_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_192_4 then
						iter_192_4.color = Color.New(var_192_12, var_192_12, var_192_12)
					end
				end

				arg_189_1.var_.actorSpriteComps1056 = nil
			end

			local var_192_13 = arg_189_1.actors_["1060"]
			local var_192_14 = 0

			if var_192_14 < arg_189_1.time_ and arg_189_1.time_ <= var_192_14 + arg_192_0 and arg_189_1.var_.actorSpriteComps1060 == nil then
				arg_189_1.var_.actorSpriteComps1060 = var_192_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_192_15 = 0.034

			if var_192_14 <= arg_189_1.time_ and arg_189_1.time_ < var_192_14 + var_192_15 then
				local var_192_16 = (arg_189_1.time_ - var_192_14) / var_192_15

				if arg_189_1.var_.actorSpriteComps1060 then
					for iter_192_5, iter_192_6 in pairs(arg_189_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_192_6 then
							local var_192_17 = Mathf.Lerp(iter_192_6.color.r, 0.5, var_192_16)

							iter_192_6.color = Color.New(var_192_17, var_192_17, var_192_17)
						end
					end
				end
			end

			if arg_189_1.time_ >= var_192_14 + var_192_15 and arg_189_1.time_ < var_192_14 + var_192_15 + arg_192_0 and arg_189_1.var_.actorSpriteComps1060 then
				local var_192_18 = 0.5

				for iter_192_7, iter_192_8 in pairs(arg_189_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_192_8 then
						iter_192_8.color = Color.New(var_192_18, var_192_18, var_192_18)
					end
				end

				arg_189_1.var_.actorSpriteComps1060 = nil
			end

			local var_192_19 = 0
			local var_192_20 = 0.275

			if var_192_19 < arg_189_1.time_ and arg_189_1.time_ <= var_192_19 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_21 = arg_189_1:FormatText(StoryNameCfg[605].name)

				arg_189_1.leftNameTxt_.text = var_192_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_22 = arg_189_1:GetWordFromCfg(410021047)
				local var_192_23 = arg_189_1:FormatText(var_192_22.content)

				arg_189_1.text_.text = var_192_23

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_24 = 11
				local var_192_25 = utf8.len(var_192_23)
				local var_192_26 = var_192_24 <= 0 and var_192_20 or var_192_20 * (var_192_25 / var_192_24)

				if var_192_26 > 0 and var_192_20 < var_192_26 then
					arg_189_1.talkMaxDuration = var_192_26

					if var_192_26 + var_192_19 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_26 + var_192_19
					end
				end

				arg_189_1.text_.text = var_192_23
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021047", "story_v_out_410021.awb") ~= 0 then
					local var_192_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021047", "story_v_out_410021.awb") / 1000

					if var_192_27 + var_192_19 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_27 + var_192_19
					end

					if var_192_22.prefab_name ~= "" and arg_189_1.actors_[var_192_22.prefab_name] ~= nil then
						local var_192_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_22.prefab_name].transform, "story_v_out_410021", "410021047", "story_v_out_410021.awb")

						arg_189_1:RecordAudio("410021047", var_192_28)
						arg_189_1:RecordAudio("410021047", var_192_28)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_410021", "410021047", "story_v_out_410021.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_410021", "410021047", "story_v_out_410021.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_29 = math.max(var_192_20, arg_189_1.talkMaxDuration)

			if var_192_19 <= arg_189_1.time_ and arg_189_1.time_ < var_192_19 + var_192_29 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_19) / var_192_29

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_19 + var_192_29 and arg_189_1.time_ < var_192_19 + var_192_29 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play410021048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 410021048
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play410021049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["1056"].transform
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 then
				arg_193_1.var_.moveOldPos1056 = var_196_0.localPosition
				var_196_0.localScale = Vector3.New(1, 1, 1)

				arg_193_1:CheckSpriteTmpPos("1056", 2)

				local var_196_2 = var_196_0.childCount

				for iter_196_0 = 0, var_196_2 - 1 do
					local var_196_3 = var_196_0:GetChild(iter_196_0)

					if var_196_3.name == "" or not string.find(var_196_3.name, "split") then
						var_196_3.gameObject:SetActive(true)
					else
						var_196_3.gameObject:SetActive(false)
					end
				end
			end

			local var_196_4 = 0.001

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_4 then
				local var_196_5 = (arg_193_1.time_ - var_196_1) / var_196_4
				local var_196_6 = Vector3.New(-390, -350, -180)

				var_196_0.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos1056, var_196_6, var_196_5)
			end

			if arg_193_1.time_ >= var_196_1 + var_196_4 and arg_193_1.time_ < var_196_1 + var_196_4 + arg_196_0 then
				var_196_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_196_7 = arg_193_1.actors_["10061"].transform
			local var_196_8 = 0

			if var_196_8 < arg_193_1.time_ and arg_193_1.time_ <= var_196_8 + arg_196_0 then
				arg_193_1.var_.moveOldPos10061 = var_196_7.localPosition
				var_196_7.localScale = Vector3.New(1, 1, 1)

				arg_193_1:CheckSpriteTmpPos("10061", 4)

				local var_196_9 = var_196_7.childCount

				for iter_196_1 = 0, var_196_9 - 1 do
					local var_196_10 = var_196_7:GetChild(iter_196_1)

					if var_196_10.name == "" or not string.find(var_196_10.name, "split") then
						var_196_10.gameObject:SetActive(true)
					else
						var_196_10.gameObject:SetActive(false)
					end
				end
			end

			local var_196_11 = 0.001

			if var_196_8 <= arg_193_1.time_ and arg_193_1.time_ < var_196_8 + var_196_11 then
				local var_196_12 = (arg_193_1.time_ - var_196_8) / var_196_11
				local var_196_13 = Vector3.New(390, -517.5, -100)

				var_196_7.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos10061, var_196_13, var_196_12)
			end

			if arg_193_1.time_ >= var_196_8 + var_196_11 and arg_193_1.time_ < var_196_8 + var_196_11 + arg_196_0 then
				var_196_7.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_196_14 = arg_193_1.actors_["1060"].transform
			local var_196_15 = 0

			if var_196_15 < arg_193_1.time_ and arg_193_1.time_ <= var_196_15 + arg_196_0 then
				arg_193_1.var_.moveOldPos1060 = var_196_14.localPosition
				var_196_14.localScale = Vector3.New(1, 1, 1)

				arg_193_1:CheckSpriteTmpPos("1060", 7)

				local var_196_16 = var_196_14.childCount

				for iter_196_2 = 0, var_196_16 - 1 do
					local var_196_17 = var_196_14:GetChild(iter_196_2)

					if var_196_17.name == "" or not string.find(var_196_17.name, "split") then
						var_196_17.gameObject:SetActive(true)
					else
						var_196_17.gameObject:SetActive(false)
					end
				end
			end

			local var_196_18 = 0.001

			if var_196_15 <= arg_193_1.time_ and arg_193_1.time_ < var_196_15 + var_196_18 then
				local var_196_19 = (arg_193_1.time_ - var_196_15) / var_196_18
				local var_196_20 = Vector3.New(0, -2000, -40)

				var_196_14.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos1060, var_196_20, var_196_19)
			end

			if arg_193_1.time_ >= var_196_15 + var_196_18 and arg_193_1.time_ < var_196_15 + var_196_18 + arg_196_0 then
				var_196_14.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_196_21 = arg_193_1.actors_["1056"]
			local var_196_22 = 0

			if var_196_22 < arg_193_1.time_ and arg_193_1.time_ <= var_196_22 + arg_196_0 and arg_193_1.var_.actorSpriteComps1056 == nil then
				arg_193_1.var_.actorSpriteComps1056 = var_196_21:GetComponentsInChildren(typeof(Image), true)
			end

			local var_196_23 = 0.034

			if var_196_22 <= arg_193_1.time_ and arg_193_1.time_ < var_196_22 + var_196_23 then
				local var_196_24 = (arg_193_1.time_ - var_196_22) / var_196_23

				if arg_193_1.var_.actorSpriteComps1056 then
					for iter_196_3, iter_196_4 in pairs(arg_193_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_196_4 then
							local var_196_25 = Mathf.Lerp(iter_196_4.color.r, 0.5, var_196_24)

							iter_196_4.color = Color.New(var_196_25, var_196_25, var_196_25)
						end
					end
				end
			end

			if arg_193_1.time_ >= var_196_22 + var_196_23 and arg_193_1.time_ < var_196_22 + var_196_23 + arg_196_0 and arg_193_1.var_.actorSpriteComps1056 then
				local var_196_26 = 0.5

				for iter_196_5, iter_196_6 in pairs(arg_193_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_196_6 then
						iter_196_6.color = Color.New(var_196_26, var_196_26, var_196_26)
					end
				end

				arg_193_1.var_.actorSpriteComps1056 = nil
			end

			local var_196_27 = arg_193_1.actors_["10061"]
			local var_196_28 = 0

			if var_196_28 < arg_193_1.time_ and arg_193_1.time_ <= var_196_28 + arg_196_0 and arg_193_1.var_.actorSpriteComps10061 == nil then
				arg_193_1.var_.actorSpriteComps10061 = var_196_27:GetComponentsInChildren(typeof(Image), true)
			end

			local var_196_29 = 0.034

			if var_196_28 <= arg_193_1.time_ and arg_193_1.time_ < var_196_28 + var_196_29 then
				local var_196_30 = (arg_193_1.time_ - var_196_28) / var_196_29

				if arg_193_1.var_.actorSpriteComps10061 then
					for iter_196_7, iter_196_8 in pairs(arg_193_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_196_8 then
							local var_196_31 = Mathf.Lerp(iter_196_8.color.r, 0.5, var_196_30)

							iter_196_8.color = Color.New(var_196_31, var_196_31, var_196_31)
						end
					end
				end
			end

			if arg_193_1.time_ >= var_196_28 + var_196_29 and arg_193_1.time_ < var_196_28 + var_196_29 + arg_196_0 and arg_193_1.var_.actorSpriteComps10061 then
				local var_196_32 = 0.5

				for iter_196_9, iter_196_10 in pairs(arg_193_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_196_10 then
						iter_196_10.color = Color.New(var_196_32, var_196_32, var_196_32)
					end
				end

				arg_193_1.var_.actorSpriteComps10061 = nil
			end

			local var_196_33 = arg_193_1.actors_["1060"]
			local var_196_34 = 0

			if var_196_34 < arg_193_1.time_ and arg_193_1.time_ <= var_196_34 + arg_196_0 and arg_193_1.var_.actorSpriteComps1060 == nil then
				arg_193_1.var_.actorSpriteComps1060 = var_196_33:GetComponentsInChildren(typeof(Image), true)
			end

			local var_196_35 = 0.034

			if var_196_34 <= arg_193_1.time_ and arg_193_1.time_ < var_196_34 + var_196_35 then
				local var_196_36 = (arg_193_1.time_ - var_196_34) / var_196_35

				if arg_193_1.var_.actorSpriteComps1060 then
					for iter_196_11, iter_196_12 in pairs(arg_193_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_196_12 then
							local var_196_37 = Mathf.Lerp(iter_196_12.color.r, 0.5, var_196_36)

							iter_196_12.color = Color.New(var_196_37, var_196_37, var_196_37)
						end
					end
				end
			end

			if arg_193_1.time_ >= var_196_34 + var_196_35 and arg_193_1.time_ < var_196_34 + var_196_35 + arg_196_0 and arg_193_1.var_.actorSpriteComps1060 then
				local var_196_38 = 0.5

				for iter_196_13, iter_196_14 in pairs(arg_193_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_196_14 then
						iter_196_14.color = Color.New(var_196_38, var_196_38, var_196_38)
					end
				end

				arg_193_1.var_.actorSpriteComps1060 = nil
			end

			local var_196_39 = 0
			local var_196_40 = 1.025

			if var_196_39 < arg_193_1.time_ and arg_193_1.time_ <= var_196_39 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, false)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_41 = arg_193_1:GetWordFromCfg(410021048)
				local var_196_42 = arg_193_1:FormatText(var_196_41.content)

				arg_193_1.text_.text = var_196_42

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_43 = 41
				local var_196_44 = utf8.len(var_196_42)
				local var_196_45 = var_196_43 <= 0 and var_196_40 or var_196_40 * (var_196_44 / var_196_43)

				if var_196_45 > 0 and var_196_40 < var_196_45 then
					arg_193_1.talkMaxDuration = var_196_45

					if var_196_45 + var_196_39 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_45 + var_196_39
					end
				end

				arg_193_1.text_.text = var_196_42
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_46 = math.max(var_196_40, arg_193_1.talkMaxDuration)

			if var_196_39 <= arg_193_1.time_ and arg_193_1.time_ < var_196_39 + var_196_46 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_39) / var_196_46

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_39 + var_196_46 and arg_193_1.time_ < var_196_39 + var_196_46 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play410021049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 410021049
		arg_197_1.duration_ = 2.533

		local var_197_0 = {
			zh = 2.533,
			ja = 2.433
		}
		local var_197_1 = manager.audio:GetLocalizationFlag()

		if var_197_0[var_197_1] ~= nil then
			arg_197_1.duration_ = var_197_0[var_197_1]
		end

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play410021050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["1056"].transform
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 then
				arg_197_1.var_.moveOldPos1056 = var_200_0.localPosition
				var_200_0.localScale = Vector3.New(1, 1, 1)

				arg_197_1:CheckSpriteTmpPos("1056", 2)

				local var_200_2 = var_200_0.childCount

				for iter_200_0 = 0, var_200_2 - 1 do
					local var_200_3 = var_200_0:GetChild(iter_200_0)

					if var_200_3.name == "" or not string.find(var_200_3.name, "split") then
						var_200_3.gameObject:SetActive(true)
					else
						var_200_3.gameObject:SetActive(false)
					end
				end
			end

			local var_200_4 = 0.001

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_4 then
				local var_200_5 = (arg_197_1.time_ - var_200_1) / var_200_4
				local var_200_6 = Vector3.New(-390, -350, -180)

				var_200_0.localPosition = Vector3.Lerp(arg_197_1.var_.moveOldPos1056, var_200_6, var_200_5)
			end

			if arg_197_1.time_ >= var_200_1 + var_200_4 and arg_197_1.time_ < var_200_1 + var_200_4 + arg_200_0 then
				var_200_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_200_7 = arg_197_1.actors_["1056"]
			local var_200_8 = 0

			if var_200_8 < arg_197_1.time_ and arg_197_1.time_ <= var_200_8 + arg_200_0 and arg_197_1.var_.actorSpriteComps1056 == nil then
				arg_197_1.var_.actorSpriteComps1056 = var_200_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_200_9 = 0.034

			if var_200_8 <= arg_197_1.time_ and arg_197_1.time_ < var_200_8 + var_200_9 then
				local var_200_10 = (arg_197_1.time_ - var_200_8) / var_200_9

				if arg_197_1.var_.actorSpriteComps1056 then
					for iter_200_1, iter_200_2 in pairs(arg_197_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_200_2 then
							local var_200_11 = Mathf.Lerp(iter_200_2.color.r, 1, var_200_10)

							iter_200_2.color = Color.New(var_200_11, var_200_11, var_200_11)
						end
					end
				end
			end

			if arg_197_1.time_ >= var_200_8 + var_200_9 and arg_197_1.time_ < var_200_8 + var_200_9 + arg_200_0 and arg_197_1.var_.actorSpriteComps1056 then
				local var_200_12 = 1

				for iter_200_3, iter_200_4 in pairs(arg_197_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_200_4 then
						iter_200_4.color = Color.New(var_200_12, var_200_12, var_200_12)
					end
				end

				arg_197_1.var_.actorSpriteComps1056 = nil
			end

			local var_200_13 = 0
			local var_200_14 = 0.275

			if var_200_13 < arg_197_1.time_ and arg_197_1.time_ <= var_200_13 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_15 = arg_197_1:FormatText(StoryNameCfg[605].name)

				arg_197_1.leftNameTxt_.text = var_200_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_16 = arg_197_1:GetWordFromCfg(410021049)
				local var_200_17 = arg_197_1:FormatText(var_200_16.content)

				arg_197_1.text_.text = var_200_17

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_18 = 11
				local var_200_19 = utf8.len(var_200_17)
				local var_200_20 = var_200_18 <= 0 and var_200_14 or var_200_14 * (var_200_19 / var_200_18)

				if var_200_20 > 0 and var_200_14 < var_200_20 then
					arg_197_1.talkMaxDuration = var_200_20

					if var_200_20 + var_200_13 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_20 + var_200_13
					end
				end

				arg_197_1.text_.text = var_200_17
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021049", "story_v_out_410021.awb") ~= 0 then
					local var_200_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021049", "story_v_out_410021.awb") / 1000

					if var_200_21 + var_200_13 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_21 + var_200_13
					end

					if var_200_16.prefab_name ~= "" and arg_197_1.actors_[var_200_16.prefab_name] ~= nil then
						local var_200_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_16.prefab_name].transform, "story_v_out_410021", "410021049", "story_v_out_410021.awb")

						arg_197_1:RecordAudio("410021049", var_200_22)
						arg_197_1:RecordAudio("410021049", var_200_22)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_410021", "410021049", "story_v_out_410021.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_410021", "410021049", "story_v_out_410021.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_23 = math.max(var_200_14, arg_197_1.talkMaxDuration)

			if var_200_13 <= arg_197_1.time_ and arg_197_1.time_ < var_200_13 + var_200_23 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_13) / var_200_23

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_13 + var_200_23 and arg_197_1.time_ < var_200_13 + var_200_23 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play410021050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 410021050
		arg_201_1.duration_ = 10.833

		local var_201_0 = {
			zh = 8.633,
			ja = 10.833
		}
		local var_201_1 = manager.audio:GetLocalizationFlag()

		if var_201_0[var_201_1] ~= nil then
			arg_201_1.duration_ = var_201_0[var_201_1]
		end

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play410021051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["10061"].transform
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1.var_.moveOldPos10061 = var_204_0.localPosition
				var_204_0.localScale = Vector3.New(1, 1, 1)

				arg_201_1:CheckSpriteTmpPos("10061", 4)

				local var_204_2 = var_204_0.childCount

				for iter_204_0 = 0, var_204_2 - 1 do
					local var_204_3 = var_204_0:GetChild(iter_204_0)

					if var_204_3.name == "" or not string.find(var_204_3.name, "split") then
						var_204_3.gameObject:SetActive(true)
					else
						var_204_3.gameObject:SetActive(false)
					end
				end
			end

			local var_204_4 = 0.001

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_4 then
				local var_204_5 = (arg_201_1.time_ - var_204_1) / var_204_4
				local var_204_6 = Vector3.New(390, -517.5, -100)

				var_204_0.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos10061, var_204_6, var_204_5)
			end

			if arg_201_1.time_ >= var_204_1 + var_204_4 and arg_201_1.time_ < var_204_1 + var_204_4 + arg_204_0 then
				var_204_0.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_204_7 = arg_201_1.actors_["10061"]
			local var_204_8 = 0

			if var_204_8 < arg_201_1.time_ and arg_201_1.time_ <= var_204_8 + arg_204_0 and arg_201_1.var_.actorSpriteComps10061 == nil then
				arg_201_1.var_.actorSpriteComps10061 = var_204_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_204_9 = 0.034

			if var_204_8 <= arg_201_1.time_ and arg_201_1.time_ < var_204_8 + var_204_9 then
				local var_204_10 = (arg_201_1.time_ - var_204_8) / var_204_9

				if arg_201_1.var_.actorSpriteComps10061 then
					for iter_204_1, iter_204_2 in pairs(arg_201_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_204_2 then
							local var_204_11 = Mathf.Lerp(iter_204_2.color.r, 1, var_204_10)

							iter_204_2.color = Color.New(var_204_11, var_204_11, var_204_11)
						end
					end
				end
			end

			if arg_201_1.time_ >= var_204_8 + var_204_9 and arg_201_1.time_ < var_204_8 + var_204_9 + arg_204_0 and arg_201_1.var_.actorSpriteComps10061 then
				local var_204_12 = 1

				for iter_204_3, iter_204_4 in pairs(arg_201_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_204_4 then
						iter_204_4.color = Color.New(var_204_12, var_204_12, var_204_12)
					end
				end

				arg_201_1.var_.actorSpriteComps10061 = nil
			end

			local var_204_13 = arg_201_1.actors_["1056"]
			local var_204_14 = 0

			if var_204_14 < arg_201_1.time_ and arg_201_1.time_ <= var_204_14 + arg_204_0 and arg_201_1.var_.actorSpriteComps1056 == nil then
				arg_201_1.var_.actorSpriteComps1056 = var_204_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_204_15 = 0.034

			if var_204_14 <= arg_201_1.time_ and arg_201_1.time_ < var_204_14 + var_204_15 then
				local var_204_16 = (arg_201_1.time_ - var_204_14) / var_204_15

				if arg_201_1.var_.actorSpriteComps1056 then
					for iter_204_5, iter_204_6 in pairs(arg_201_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_204_6 then
							local var_204_17 = Mathf.Lerp(iter_204_6.color.r, 0.5, var_204_16)

							iter_204_6.color = Color.New(var_204_17, var_204_17, var_204_17)
						end
					end
				end
			end

			if arg_201_1.time_ >= var_204_14 + var_204_15 and arg_201_1.time_ < var_204_14 + var_204_15 + arg_204_0 and arg_201_1.var_.actorSpriteComps1056 then
				local var_204_18 = 0.5

				for iter_204_7, iter_204_8 in pairs(arg_201_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_204_8 then
						iter_204_8.color = Color.New(var_204_18, var_204_18, var_204_18)
					end
				end

				arg_201_1.var_.actorSpriteComps1056 = nil
			end

			local var_204_19 = 0
			local var_204_20 = 0.825

			if var_204_19 < arg_201_1.time_ and arg_201_1.time_ <= var_204_19 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_21 = arg_201_1:FormatText(StoryNameCfg[591].name)

				arg_201_1.leftNameTxt_.text = var_204_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_22 = arg_201_1:GetWordFromCfg(410021050)
				local var_204_23 = arg_201_1:FormatText(var_204_22.content)

				arg_201_1.text_.text = var_204_23

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_24 = 33
				local var_204_25 = utf8.len(var_204_23)
				local var_204_26 = var_204_24 <= 0 and var_204_20 or var_204_20 * (var_204_25 / var_204_24)

				if var_204_26 > 0 and var_204_20 < var_204_26 then
					arg_201_1.talkMaxDuration = var_204_26

					if var_204_26 + var_204_19 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_26 + var_204_19
					end
				end

				arg_201_1.text_.text = var_204_23
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021050", "story_v_out_410021.awb") ~= 0 then
					local var_204_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021050", "story_v_out_410021.awb") / 1000

					if var_204_27 + var_204_19 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_27 + var_204_19
					end

					if var_204_22.prefab_name ~= "" and arg_201_1.actors_[var_204_22.prefab_name] ~= nil then
						local var_204_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_22.prefab_name].transform, "story_v_out_410021", "410021050", "story_v_out_410021.awb")

						arg_201_1:RecordAudio("410021050", var_204_28)
						arg_201_1:RecordAudio("410021050", var_204_28)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_410021", "410021050", "story_v_out_410021.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_410021", "410021050", "story_v_out_410021.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_29 = math.max(var_204_20, arg_201_1.talkMaxDuration)

			if var_204_19 <= arg_201_1.time_ and arg_201_1.time_ < var_204_19 + var_204_29 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_19) / var_204_29

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_19 + var_204_29 and arg_201_1.time_ < var_204_19 + var_204_29 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play410021051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 410021051
		arg_205_1.duration_ = 5.533

		local var_205_0 = {
			zh = 4.5,
			ja = 5.533
		}
		local var_205_1 = manager.audio:GetLocalizationFlag()

		if var_205_0[var_205_1] ~= nil then
			arg_205_1.duration_ = var_205_0[var_205_1]
		end

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play410021052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["1056"].transform
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				arg_205_1.var_.moveOldPos1056 = var_208_0.localPosition
				var_208_0.localScale = Vector3.New(1, 1, 1)

				arg_205_1:CheckSpriteTmpPos("1056", 2)

				local var_208_2 = var_208_0.childCount

				for iter_208_0 = 0, var_208_2 - 1 do
					local var_208_3 = var_208_0:GetChild(iter_208_0)

					if var_208_3.name == "" or not string.find(var_208_3.name, "split") then
						var_208_3.gameObject:SetActive(true)
					else
						var_208_3.gameObject:SetActive(false)
					end
				end
			end

			local var_208_4 = 0.001

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_4 then
				local var_208_5 = (arg_205_1.time_ - var_208_1) / var_208_4
				local var_208_6 = Vector3.New(-390, -350, -180)

				var_208_0.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos1056, var_208_6, var_208_5)
			end

			if arg_205_1.time_ >= var_208_1 + var_208_4 and arg_205_1.time_ < var_208_1 + var_208_4 + arg_208_0 then
				var_208_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_208_7 = arg_205_1.actors_["1056"]
			local var_208_8 = 0

			if var_208_8 < arg_205_1.time_ and arg_205_1.time_ <= var_208_8 + arg_208_0 and arg_205_1.var_.actorSpriteComps1056 == nil then
				arg_205_1.var_.actorSpriteComps1056 = var_208_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_208_9 = 0.034

			if var_208_8 <= arg_205_1.time_ and arg_205_1.time_ < var_208_8 + var_208_9 then
				local var_208_10 = (arg_205_1.time_ - var_208_8) / var_208_9

				if arg_205_1.var_.actorSpriteComps1056 then
					for iter_208_1, iter_208_2 in pairs(arg_205_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_208_2 then
							local var_208_11 = Mathf.Lerp(iter_208_2.color.r, 1, var_208_10)

							iter_208_2.color = Color.New(var_208_11, var_208_11, var_208_11)
						end
					end
				end
			end

			if arg_205_1.time_ >= var_208_8 + var_208_9 and arg_205_1.time_ < var_208_8 + var_208_9 + arg_208_0 and arg_205_1.var_.actorSpriteComps1056 then
				local var_208_12 = 1

				for iter_208_3, iter_208_4 in pairs(arg_205_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_208_4 then
						iter_208_4.color = Color.New(var_208_12, var_208_12, var_208_12)
					end
				end

				arg_205_1.var_.actorSpriteComps1056 = nil
			end

			local var_208_13 = arg_205_1.actors_["10061"]
			local var_208_14 = 0

			if var_208_14 < arg_205_1.time_ and arg_205_1.time_ <= var_208_14 + arg_208_0 and arg_205_1.var_.actorSpriteComps10061 == nil then
				arg_205_1.var_.actorSpriteComps10061 = var_208_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_208_15 = 0.034

			if var_208_14 <= arg_205_1.time_ and arg_205_1.time_ < var_208_14 + var_208_15 then
				local var_208_16 = (arg_205_1.time_ - var_208_14) / var_208_15

				if arg_205_1.var_.actorSpriteComps10061 then
					for iter_208_5, iter_208_6 in pairs(arg_205_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_208_6 then
							local var_208_17 = Mathf.Lerp(iter_208_6.color.r, 0.5, var_208_16)

							iter_208_6.color = Color.New(var_208_17, var_208_17, var_208_17)
						end
					end
				end
			end

			if arg_205_1.time_ >= var_208_14 + var_208_15 and arg_205_1.time_ < var_208_14 + var_208_15 + arg_208_0 and arg_205_1.var_.actorSpriteComps10061 then
				local var_208_18 = 0.5

				for iter_208_7, iter_208_8 in pairs(arg_205_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_208_8 then
						iter_208_8.color = Color.New(var_208_18, var_208_18, var_208_18)
					end
				end

				arg_205_1.var_.actorSpriteComps10061 = nil
			end

			local var_208_19 = 0
			local var_208_20 = 0.475

			if var_208_19 < arg_205_1.time_ and arg_205_1.time_ <= var_208_19 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_21 = arg_205_1:FormatText(StoryNameCfg[605].name)

				arg_205_1.leftNameTxt_.text = var_208_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_22 = arg_205_1:GetWordFromCfg(410021051)
				local var_208_23 = arg_205_1:FormatText(var_208_22.content)

				arg_205_1.text_.text = var_208_23

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_24 = 19
				local var_208_25 = utf8.len(var_208_23)
				local var_208_26 = var_208_24 <= 0 and var_208_20 or var_208_20 * (var_208_25 / var_208_24)

				if var_208_26 > 0 and var_208_20 < var_208_26 then
					arg_205_1.talkMaxDuration = var_208_26

					if var_208_26 + var_208_19 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_26 + var_208_19
					end
				end

				arg_205_1.text_.text = var_208_23
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021051", "story_v_out_410021.awb") ~= 0 then
					local var_208_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021051", "story_v_out_410021.awb") / 1000

					if var_208_27 + var_208_19 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_27 + var_208_19
					end

					if var_208_22.prefab_name ~= "" and arg_205_1.actors_[var_208_22.prefab_name] ~= nil then
						local var_208_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_22.prefab_name].transform, "story_v_out_410021", "410021051", "story_v_out_410021.awb")

						arg_205_1:RecordAudio("410021051", var_208_28)
						arg_205_1:RecordAudio("410021051", var_208_28)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_410021", "410021051", "story_v_out_410021.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_410021", "410021051", "story_v_out_410021.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_29 = math.max(var_208_20, arg_205_1.talkMaxDuration)

			if var_208_19 <= arg_205_1.time_ and arg_205_1.time_ < var_208_19 + var_208_29 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_19) / var_208_29

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_19 + var_208_29 and arg_205_1.time_ < var_208_19 + var_208_29 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play410021052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 410021052
		arg_209_1.duration_ = 1.333

		local var_209_0 = {
			zh = 1.066,
			ja = 1.333
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
				arg_209_0:Play410021053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["10061"].transform
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.var_.moveOldPos10061 = var_212_0.localPosition
				var_212_0.localScale = Vector3.New(1, 1, 1)

				arg_209_1:CheckSpriteTmpPos("10061", 4)

				local var_212_2 = var_212_0.childCount

				for iter_212_0 = 0, var_212_2 - 1 do
					local var_212_3 = var_212_0:GetChild(iter_212_0)

					if var_212_3.name == "" or not string.find(var_212_3.name, "split") then
						var_212_3.gameObject:SetActive(true)
					else
						var_212_3.gameObject:SetActive(false)
					end
				end
			end

			local var_212_4 = 0.001

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_4 then
				local var_212_5 = (arg_209_1.time_ - var_212_1) / var_212_4
				local var_212_6 = Vector3.New(390, -517.5, -100)

				var_212_0.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos10061, var_212_6, var_212_5)
			end

			if arg_209_1.time_ >= var_212_1 + var_212_4 and arg_209_1.time_ < var_212_1 + var_212_4 + arg_212_0 then
				var_212_0.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_212_7 = arg_209_1.actors_["10061"]
			local var_212_8 = 0

			if var_212_8 < arg_209_1.time_ and arg_209_1.time_ <= var_212_8 + arg_212_0 and arg_209_1.var_.actorSpriteComps10061 == nil then
				arg_209_1.var_.actorSpriteComps10061 = var_212_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_212_9 = 0.034

			if var_212_8 <= arg_209_1.time_ and arg_209_1.time_ < var_212_8 + var_212_9 then
				local var_212_10 = (arg_209_1.time_ - var_212_8) / var_212_9

				if arg_209_1.var_.actorSpriteComps10061 then
					for iter_212_1, iter_212_2 in pairs(arg_209_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_212_2 then
							local var_212_11 = Mathf.Lerp(iter_212_2.color.r, 1, var_212_10)

							iter_212_2.color = Color.New(var_212_11, var_212_11, var_212_11)
						end
					end
				end
			end

			if arg_209_1.time_ >= var_212_8 + var_212_9 and arg_209_1.time_ < var_212_8 + var_212_9 + arg_212_0 and arg_209_1.var_.actorSpriteComps10061 then
				local var_212_12 = 1

				for iter_212_3, iter_212_4 in pairs(arg_209_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_212_4 then
						iter_212_4.color = Color.New(var_212_12, var_212_12, var_212_12)
					end
				end

				arg_209_1.var_.actorSpriteComps10061 = nil
			end

			local var_212_13 = arg_209_1.actors_["1056"]
			local var_212_14 = 0

			if var_212_14 < arg_209_1.time_ and arg_209_1.time_ <= var_212_14 + arg_212_0 and arg_209_1.var_.actorSpriteComps1056 == nil then
				arg_209_1.var_.actorSpriteComps1056 = var_212_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_212_15 = 0.034

			if var_212_14 <= arg_209_1.time_ and arg_209_1.time_ < var_212_14 + var_212_15 then
				local var_212_16 = (arg_209_1.time_ - var_212_14) / var_212_15

				if arg_209_1.var_.actorSpriteComps1056 then
					for iter_212_5, iter_212_6 in pairs(arg_209_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_212_6 then
							local var_212_17 = Mathf.Lerp(iter_212_6.color.r, 0.5, var_212_16)

							iter_212_6.color = Color.New(var_212_17, var_212_17, var_212_17)
						end
					end
				end
			end

			if arg_209_1.time_ >= var_212_14 + var_212_15 and arg_209_1.time_ < var_212_14 + var_212_15 + arg_212_0 and arg_209_1.var_.actorSpriteComps1056 then
				local var_212_18 = 0.5

				for iter_212_7, iter_212_8 in pairs(arg_209_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_212_8 then
						iter_212_8.color = Color.New(var_212_18, var_212_18, var_212_18)
					end
				end

				arg_209_1.var_.actorSpriteComps1056 = nil
			end

			local var_212_19 = 0
			local var_212_20 = 0.1

			if var_212_19 < arg_209_1.time_ and arg_209_1.time_ <= var_212_19 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_21 = arg_209_1:FormatText(StoryNameCfg[591].name)

				arg_209_1.leftNameTxt_.text = var_212_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_22 = arg_209_1:GetWordFromCfg(410021052)
				local var_212_23 = arg_209_1:FormatText(var_212_22.content)

				arg_209_1.text_.text = var_212_23

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_24 = 4
				local var_212_25 = utf8.len(var_212_23)
				local var_212_26 = var_212_24 <= 0 and var_212_20 or var_212_20 * (var_212_25 / var_212_24)

				if var_212_26 > 0 and var_212_20 < var_212_26 then
					arg_209_1.talkMaxDuration = var_212_26

					if var_212_26 + var_212_19 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_26 + var_212_19
					end
				end

				arg_209_1.text_.text = var_212_23
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021052", "story_v_out_410021.awb") ~= 0 then
					local var_212_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021052", "story_v_out_410021.awb") / 1000

					if var_212_27 + var_212_19 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_27 + var_212_19
					end

					if var_212_22.prefab_name ~= "" and arg_209_1.actors_[var_212_22.prefab_name] ~= nil then
						local var_212_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_22.prefab_name].transform, "story_v_out_410021", "410021052", "story_v_out_410021.awb")

						arg_209_1:RecordAudio("410021052", var_212_28)
						arg_209_1:RecordAudio("410021052", var_212_28)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_410021", "410021052", "story_v_out_410021.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_410021", "410021052", "story_v_out_410021.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_29 = math.max(var_212_20, arg_209_1.talkMaxDuration)

			if var_212_19 <= arg_209_1.time_ and arg_209_1.time_ < var_212_19 + var_212_29 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_19) / var_212_29

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_19 + var_212_29 and arg_209_1.time_ < var_212_19 + var_212_29 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play410021053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 410021053
		arg_213_1.duration_ = 8.333

		local var_213_0 = {
			zh = 7.966,
			ja = 8.333
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
				arg_213_0:Play410021054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["10061"].transform
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				arg_213_1.var_.moveOldPos10061 = var_216_0.localPosition
				var_216_0.localScale = Vector3.New(1, 1, 1)

				arg_213_1:CheckSpriteTmpPos("10061", 4)

				local var_216_2 = var_216_0.childCount

				for iter_216_0 = 0, var_216_2 - 1 do
					local var_216_3 = var_216_0:GetChild(iter_216_0)

					if var_216_3.name == "" or not string.find(var_216_3.name, "split") then
						var_216_3.gameObject:SetActive(true)
					else
						var_216_3.gameObject:SetActive(false)
					end
				end
			end

			local var_216_4 = 0.001

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_4 then
				local var_216_5 = (arg_213_1.time_ - var_216_1) / var_216_4
				local var_216_6 = Vector3.New(390, -517.5, -100)

				var_216_0.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos10061, var_216_6, var_216_5)
			end

			if arg_213_1.time_ >= var_216_1 + var_216_4 and arg_213_1.time_ < var_216_1 + var_216_4 + arg_216_0 then
				var_216_0.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_216_7 = arg_213_1.actors_["10061"]
			local var_216_8 = 0

			if var_216_8 < arg_213_1.time_ and arg_213_1.time_ <= var_216_8 + arg_216_0 and arg_213_1.var_.actorSpriteComps10061 == nil then
				arg_213_1.var_.actorSpriteComps10061 = var_216_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_216_9 = 0.034

			if var_216_8 <= arg_213_1.time_ and arg_213_1.time_ < var_216_8 + var_216_9 then
				local var_216_10 = (arg_213_1.time_ - var_216_8) / var_216_9

				if arg_213_1.var_.actorSpriteComps10061 then
					for iter_216_1, iter_216_2 in pairs(arg_213_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_216_2 then
							local var_216_11 = Mathf.Lerp(iter_216_2.color.r, 1, var_216_10)

							iter_216_2.color = Color.New(var_216_11, var_216_11, var_216_11)
						end
					end
				end
			end

			if arg_213_1.time_ >= var_216_8 + var_216_9 and arg_213_1.time_ < var_216_8 + var_216_9 + arg_216_0 and arg_213_1.var_.actorSpriteComps10061 then
				local var_216_12 = 1

				for iter_216_3, iter_216_4 in pairs(arg_213_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_216_4 then
						iter_216_4.color = Color.New(var_216_12, var_216_12, var_216_12)
					end
				end

				arg_213_1.var_.actorSpriteComps10061 = nil
			end

			local var_216_13 = 0
			local var_216_14 = 0.875

			if var_216_13 < arg_213_1.time_ and arg_213_1.time_ <= var_216_13 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_15 = arg_213_1:FormatText(StoryNameCfg[591].name)

				arg_213_1.leftNameTxt_.text = var_216_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_16 = arg_213_1:GetWordFromCfg(410021053)
				local var_216_17 = arg_213_1:FormatText(var_216_16.content)

				arg_213_1.text_.text = var_216_17

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_18 = 35
				local var_216_19 = utf8.len(var_216_17)
				local var_216_20 = var_216_18 <= 0 and var_216_14 or var_216_14 * (var_216_19 / var_216_18)

				if var_216_20 > 0 and var_216_14 < var_216_20 then
					arg_213_1.talkMaxDuration = var_216_20

					if var_216_20 + var_216_13 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_20 + var_216_13
					end
				end

				arg_213_1.text_.text = var_216_17
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021053", "story_v_out_410021.awb") ~= 0 then
					local var_216_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021053", "story_v_out_410021.awb") / 1000

					if var_216_21 + var_216_13 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_21 + var_216_13
					end

					if var_216_16.prefab_name ~= "" and arg_213_1.actors_[var_216_16.prefab_name] ~= nil then
						local var_216_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_16.prefab_name].transform, "story_v_out_410021", "410021053", "story_v_out_410021.awb")

						arg_213_1:RecordAudio("410021053", var_216_22)
						arg_213_1:RecordAudio("410021053", var_216_22)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_410021", "410021053", "story_v_out_410021.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_410021", "410021053", "story_v_out_410021.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_23 = math.max(var_216_14, arg_213_1.talkMaxDuration)

			if var_216_13 <= arg_213_1.time_ and arg_213_1.time_ < var_216_13 + var_216_23 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_13) / var_216_23

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_13 + var_216_23 and arg_213_1.time_ < var_216_13 + var_216_23 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play410021054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 410021054
		arg_217_1.duration_ = 6.5

		local var_217_0 = {
			zh = 6.5,
			ja = 6.266
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
				arg_217_0:Play410021055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["1060"].transform
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 then
				arg_217_1.var_.moveOldPos1060 = var_220_0.localPosition
				var_220_0.localScale = Vector3.New(1, 1, 1)

				arg_217_1:CheckSpriteTmpPos("1060", 2)

				local var_220_2 = var_220_0.childCount

				for iter_220_0 = 0, var_220_2 - 1 do
					local var_220_3 = var_220_0:GetChild(iter_220_0)

					if var_220_3.name == "split_2" or not string.find(var_220_3.name, "split") then
						var_220_3.gameObject:SetActive(true)
					else
						var_220_3.gameObject:SetActive(false)
					end
				end
			end

			local var_220_4 = 0.001

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_4 then
				local var_220_5 = (arg_217_1.time_ - var_220_1) / var_220_4
				local var_220_6 = Vector3.New(-390, -435, -40)

				var_220_0.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos1060, var_220_6, var_220_5)
			end

			if arg_217_1.time_ >= var_220_1 + var_220_4 and arg_217_1.time_ < var_220_1 + var_220_4 + arg_220_0 then
				var_220_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_220_7 = arg_217_1.actors_["1056"].transform
			local var_220_8 = 0

			if var_220_8 < arg_217_1.time_ and arg_217_1.time_ <= var_220_8 + arg_220_0 then
				arg_217_1.var_.moveOldPos1056 = var_220_7.localPosition
				var_220_7.localScale = Vector3.New(1, 1, 1)

				arg_217_1:CheckSpriteTmpPos("1056", 7)

				local var_220_9 = var_220_7.childCount

				for iter_220_1 = 0, var_220_9 - 1 do
					local var_220_10 = var_220_7:GetChild(iter_220_1)

					if var_220_10.name == "" or not string.find(var_220_10.name, "split") then
						var_220_10.gameObject:SetActive(true)
					else
						var_220_10.gameObject:SetActive(false)
					end
				end
			end

			local var_220_11 = 0.001

			if var_220_8 <= arg_217_1.time_ and arg_217_1.time_ < var_220_8 + var_220_11 then
				local var_220_12 = (arg_217_1.time_ - var_220_8) / var_220_11
				local var_220_13 = Vector3.New(0, -2000, -180)

				var_220_7.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos1056, var_220_13, var_220_12)
			end

			if arg_217_1.time_ >= var_220_8 + var_220_11 and arg_217_1.time_ < var_220_8 + var_220_11 + arg_220_0 then
				var_220_7.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_220_14 = arg_217_1.actors_["1060"]
			local var_220_15 = 0

			if var_220_15 < arg_217_1.time_ and arg_217_1.time_ <= var_220_15 + arg_220_0 and arg_217_1.var_.actorSpriteComps1060 == nil then
				arg_217_1.var_.actorSpriteComps1060 = var_220_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_220_16 = 0.034

			if var_220_15 <= arg_217_1.time_ and arg_217_1.time_ < var_220_15 + var_220_16 then
				local var_220_17 = (arg_217_1.time_ - var_220_15) / var_220_16

				if arg_217_1.var_.actorSpriteComps1060 then
					for iter_220_2, iter_220_3 in pairs(arg_217_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_220_3 then
							local var_220_18 = Mathf.Lerp(iter_220_3.color.r, 1, var_220_17)

							iter_220_3.color = Color.New(var_220_18, var_220_18, var_220_18)
						end
					end
				end
			end

			if arg_217_1.time_ >= var_220_15 + var_220_16 and arg_217_1.time_ < var_220_15 + var_220_16 + arg_220_0 and arg_217_1.var_.actorSpriteComps1060 then
				local var_220_19 = 1

				for iter_220_4, iter_220_5 in pairs(arg_217_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_220_5 then
						iter_220_5.color = Color.New(var_220_19, var_220_19, var_220_19)
					end
				end

				arg_217_1.var_.actorSpriteComps1060 = nil
			end

			local var_220_20 = arg_217_1.actors_["1056"]
			local var_220_21 = 0

			if var_220_21 < arg_217_1.time_ and arg_217_1.time_ <= var_220_21 + arg_220_0 and arg_217_1.var_.actorSpriteComps1056 == nil then
				arg_217_1.var_.actorSpriteComps1056 = var_220_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_220_22 = 0.034

			if var_220_21 <= arg_217_1.time_ and arg_217_1.time_ < var_220_21 + var_220_22 then
				local var_220_23 = (arg_217_1.time_ - var_220_21) / var_220_22

				if arg_217_1.var_.actorSpriteComps1056 then
					for iter_220_6, iter_220_7 in pairs(arg_217_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_220_7 then
							local var_220_24 = Mathf.Lerp(iter_220_7.color.r, 0.5, var_220_23)

							iter_220_7.color = Color.New(var_220_24, var_220_24, var_220_24)
						end
					end
				end
			end

			if arg_217_1.time_ >= var_220_21 + var_220_22 and arg_217_1.time_ < var_220_21 + var_220_22 + arg_220_0 and arg_217_1.var_.actorSpriteComps1056 then
				local var_220_25 = 0.5

				for iter_220_8, iter_220_9 in pairs(arg_217_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_220_9 then
						iter_220_9.color = Color.New(var_220_25, var_220_25, var_220_25)
					end
				end

				arg_217_1.var_.actorSpriteComps1056 = nil
			end

			local var_220_26 = arg_217_1.actors_["10061"]
			local var_220_27 = 0

			if var_220_27 < arg_217_1.time_ and arg_217_1.time_ <= var_220_27 + arg_220_0 and arg_217_1.var_.actorSpriteComps10061 == nil then
				arg_217_1.var_.actorSpriteComps10061 = var_220_26:GetComponentsInChildren(typeof(Image), true)
			end

			local var_220_28 = 0.034

			if var_220_27 <= arg_217_1.time_ and arg_217_1.time_ < var_220_27 + var_220_28 then
				local var_220_29 = (arg_217_1.time_ - var_220_27) / var_220_28

				if arg_217_1.var_.actorSpriteComps10061 then
					for iter_220_10, iter_220_11 in pairs(arg_217_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_220_11 then
							local var_220_30 = Mathf.Lerp(iter_220_11.color.r, 0.5, var_220_29)

							iter_220_11.color = Color.New(var_220_30, var_220_30, var_220_30)
						end
					end
				end
			end

			if arg_217_1.time_ >= var_220_27 + var_220_28 and arg_217_1.time_ < var_220_27 + var_220_28 + arg_220_0 and arg_217_1.var_.actorSpriteComps10061 then
				local var_220_31 = 0.5

				for iter_220_12, iter_220_13 in pairs(arg_217_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_220_13 then
						iter_220_13.color = Color.New(var_220_31, var_220_31, var_220_31)
					end
				end

				arg_217_1.var_.actorSpriteComps10061 = nil
			end

			local var_220_32 = 0
			local var_220_33 = 0.775

			if var_220_32 < arg_217_1.time_ and arg_217_1.time_ <= var_220_32 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_34 = arg_217_1:FormatText(StoryNameCfg[584].name)

				arg_217_1.leftNameTxt_.text = var_220_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_35 = arg_217_1:GetWordFromCfg(410021054)
				local var_220_36 = arg_217_1:FormatText(var_220_35.content)

				arg_217_1.text_.text = var_220_36

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_37 = 31
				local var_220_38 = utf8.len(var_220_36)
				local var_220_39 = var_220_37 <= 0 and var_220_33 or var_220_33 * (var_220_38 / var_220_37)

				if var_220_39 > 0 and var_220_33 < var_220_39 then
					arg_217_1.talkMaxDuration = var_220_39

					if var_220_39 + var_220_32 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_39 + var_220_32
					end
				end

				arg_217_1.text_.text = var_220_36
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021054", "story_v_out_410021.awb") ~= 0 then
					local var_220_40 = manager.audio:GetVoiceLength("story_v_out_410021", "410021054", "story_v_out_410021.awb") / 1000

					if var_220_40 + var_220_32 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_40 + var_220_32
					end

					if var_220_35.prefab_name ~= "" and arg_217_1.actors_[var_220_35.prefab_name] ~= nil then
						local var_220_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_35.prefab_name].transform, "story_v_out_410021", "410021054", "story_v_out_410021.awb")

						arg_217_1:RecordAudio("410021054", var_220_41)
						arg_217_1:RecordAudio("410021054", var_220_41)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_410021", "410021054", "story_v_out_410021.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_410021", "410021054", "story_v_out_410021.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_42 = math.max(var_220_33, arg_217_1.talkMaxDuration)

			if var_220_32 <= arg_217_1.time_ and arg_217_1.time_ < var_220_32 + var_220_42 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_32) / var_220_42

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_32 + var_220_42 and arg_217_1.time_ < var_220_32 + var_220_42 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play410021055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 410021055
		arg_221_1.duration_ = 5

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play410021056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1056"].transform
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.var_.moveOldPos1056 = var_224_0.localPosition
				var_224_0.localScale = Vector3.New(1, 1, 1)

				arg_221_1:CheckSpriteTmpPos("1056", 4)

				local var_224_2 = var_224_0.childCount

				for iter_224_0 = 0, var_224_2 - 1 do
					local var_224_3 = var_224_0:GetChild(iter_224_0)

					if var_224_3.name == "" or not string.find(var_224_3.name, "split") then
						var_224_3.gameObject:SetActive(true)
					else
						var_224_3.gameObject:SetActive(false)
					end
				end
			end

			local var_224_4 = 0.001

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_4 then
				local var_224_5 = (arg_221_1.time_ - var_224_1) / var_224_4
				local var_224_6 = Vector3.New(390, -350, -180)

				var_224_0.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos1056, var_224_6, var_224_5)
			end

			if arg_221_1.time_ >= var_224_1 + var_224_4 and arg_221_1.time_ < var_224_1 + var_224_4 + arg_224_0 then
				var_224_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_224_7 = arg_221_1.actors_["10061"].transform
			local var_224_8 = 0

			if var_224_8 < arg_221_1.time_ and arg_221_1.time_ <= var_224_8 + arg_224_0 then
				arg_221_1.var_.moveOldPos10061 = var_224_7.localPosition
				var_224_7.localScale = Vector3.New(1, 1, 1)

				arg_221_1:CheckSpriteTmpPos("10061", 7)

				local var_224_9 = var_224_7.childCount

				for iter_224_1 = 0, var_224_9 - 1 do
					local var_224_10 = var_224_7:GetChild(iter_224_1)

					if var_224_10.name == "" or not string.find(var_224_10.name, "split") then
						var_224_10.gameObject:SetActive(true)
					else
						var_224_10.gameObject:SetActive(false)
					end
				end
			end

			local var_224_11 = 0.001

			if var_224_8 <= arg_221_1.time_ and arg_221_1.time_ < var_224_8 + var_224_11 then
				local var_224_12 = (arg_221_1.time_ - var_224_8) / var_224_11
				local var_224_13 = Vector3.New(0, -2000, -100)

				var_224_7.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos10061, var_224_13, var_224_12)
			end

			if arg_221_1.time_ >= var_224_8 + var_224_11 and arg_221_1.time_ < var_224_8 + var_224_11 + arg_224_0 then
				var_224_7.localPosition = Vector3.New(0, -2000, -100)
			end

			local var_224_14 = arg_221_1.actors_["1056"]
			local var_224_15 = 0

			if var_224_15 < arg_221_1.time_ and arg_221_1.time_ <= var_224_15 + arg_224_0 and arg_221_1.var_.actorSpriteComps1056 == nil then
				arg_221_1.var_.actorSpriteComps1056 = var_224_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_224_16 = 0.034

			if var_224_15 <= arg_221_1.time_ and arg_221_1.time_ < var_224_15 + var_224_16 then
				local var_224_17 = (arg_221_1.time_ - var_224_15) / var_224_16

				if arg_221_1.var_.actorSpriteComps1056 then
					for iter_224_2, iter_224_3 in pairs(arg_221_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_224_3 then
							local var_224_18 = Mathf.Lerp(iter_224_3.color.r, 0.5, var_224_17)

							iter_224_3.color = Color.New(var_224_18, var_224_18, var_224_18)
						end
					end
				end
			end

			if arg_221_1.time_ >= var_224_15 + var_224_16 and arg_221_1.time_ < var_224_15 + var_224_16 + arg_224_0 and arg_221_1.var_.actorSpriteComps1056 then
				local var_224_19 = 0.5

				for iter_224_4, iter_224_5 in pairs(arg_221_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_224_5 then
						iter_224_5.color = Color.New(var_224_19, var_224_19, var_224_19)
					end
				end

				arg_221_1.var_.actorSpriteComps1056 = nil
			end

			local var_224_20 = arg_221_1.actors_["10061"]
			local var_224_21 = 0

			if var_224_21 < arg_221_1.time_ and arg_221_1.time_ <= var_224_21 + arg_224_0 and arg_221_1.var_.actorSpriteComps10061 == nil then
				arg_221_1.var_.actorSpriteComps10061 = var_224_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_224_22 = 0.034

			if var_224_21 <= arg_221_1.time_ and arg_221_1.time_ < var_224_21 + var_224_22 then
				local var_224_23 = (arg_221_1.time_ - var_224_21) / var_224_22

				if arg_221_1.var_.actorSpriteComps10061 then
					for iter_224_6, iter_224_7 in pairs(arg_221_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_224_7 then
							local var_224_24 = Mathf.Lerp(iter_224_7.color.r, 0.5, var_224_23)

							iter_224_7.color = Color.New(var_224_24, var_224_24, var_224_24)
						end
					end
				end
			end

			if arg_221_1.time_ >= var_224_21 + var_224_22 and arg_221_1.time_ < var_224_21 + var_224_22 + arg_224_0 and arg_221_1.var_.actorSpriteComps10061 then
				local var_224_25 = 0.5

				for iter_224_8, iter_224_9 in pairs(arg_221_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_224_9 then
						iter_224_9.color = Color.New(var_224_25, var_224_25, var_224_25)
					end
				end

				arg_221_1.var_.actorSpriteComps10061 = nil
			end

			local var_224_26 = arg_221_1.actors_["1060"]
			local var_224_27 = 0

			if var_224_27 < arg_221_1.time_ and arg_221_1.time_ <= var_224_27 + arg_224_0 and arg_221_1.var_.actorSpriteComps1060 == nil then
				arg_221_1.var_.actorSpriteComps1060 = var_224_26:GetComponentsInChildren(typeof(Image), true)
			end

			local var_224_28 = 0.034

			if var_224_27 <= arg_221_1.time_ and arg_221_1.time_ < var_224_27 + var_224_28 then
				local var_224_29 = (arg_221_1.time_ - var_224_27) / var_224_28

				if arg_221_1.var_.actorSpriteComps1060 then
					for iter_224_10, iter_224_11 in pairs(arg_221_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_224_11 then
							local var_224_30 = Mathf.Lerp(iter_224_11.color.r, 0.5, var_224_29)

							iter_224_11.color = Color.New(var_224_30, var_224_30, var_224_30)
						end
					end
				end
			end

			if arg_221_1.time_ >= var_224_27 + var_224_28 and arg_221_1.time_ < var_224_27 + var_224_28 + arg_224_0 and arg_221_1.var_.actorSpriteComps1060 then
				local var_224_31 = 0.5

				for iter_224_12, iter_224_13 in pairs(arg_221_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_224_13 then
						iter_224_13.color = Color.New(var_224_31, var_224_31, var_224_31)
					end
				end

				arg_221_1.var_.actorSpriteComps1060 = nil
			end

			local var_224_32 = 0
			local var_224_33 = 1.275

			if var_224_32 < arg_221_1.time_ and arg_221_1.time_ <= var_224_32 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, false)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_34 = arg_221_1:GetWordFromCfg(410021055)
				local var_224_35 = arg_221_1:FormatText(var_224_34.content)

				arg_221_1.text_.text = var_224_35

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_36 = 51
				local var_224_37 = utf8.len(var_224_35)
				local var_224_38 = var_224_36 <= 0 and var_224_33 or var_224_33 * (var_224_37 / var_224_36)

				if var_224_38 > 0 and var_224_33 < var_224_38 then
					arg_221_1.talkMaxDuration = var_224_38

					if var_224_38 + var_224_32 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_38 + var_224_32
					end
				end

				arg_221_1.text_.text = var_224_35
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)
				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_39 = math.max(var_224_33, arg_221_1.talkMaxDuration)

			if var_224_32 <= arg_221_1.time_ and arg_221_1.time_ < var_224_32 + var_224_39 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_32) / var_224_39

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_32 + var_224_39 and arg_221_1.time_ < var_224_32 + var_224_39 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play410021056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 410021056
		arg_225_1.duration_ = 4.766

		local var_225_0 = {
			zh = 2.366,
			ja = 4.766
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
				arg_225_0:Play410021057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["1060"].transform
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1.var_.moveOldPos1060 = var_228_0.localPosition
				var_228_0.localScale = Vector3.New(1, 1, 1)

				arg_225_1:CheckSpriteTmpPos("1060", 2)

				local var_228_2 = var_228_0.childCount

				for iter_228_0 = 0, var_228_2 - 1 do
					local var_228_3 = var_228_0:GetChild(iter_228_0)

					if var_228_3.name == "" or not string.find(var_228_3.name, "split") then
						var_228_3.gameObject:SetActive(true)
					else
						var_228_3.gameObject:SetActive(false)
					end
				end
			end

			local var_228_4 = 0.001

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_4 then
				local var_228_5 = (arg_225_1.time_ - var_228_1) / var_228_4
				local var_228_6 = Vector3.New(-390, -435, -40)

				var_228_0.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos1060, var_228_6, var_228_5)
			end

			if arg_225_1.time_ >= var_228_1 + var_228_4 and arg_225_1.time_ < var_228_1 + var_228_4 + arg_228_0 then
				var_228_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_228_7 = arg_225_1.actors_["1060"]
			local var_228_8 = 0

			if var_228_8 < arg_225_1.time_ and arg_225_1.time_ <= var_228_8 + arg_228_0 and arg_225_1.var_.actorSpriteComps1060 == nil then
				arg_225_1.var_.actorSpriteComps1060 = var_228_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_228_9 = 0.034

			if var_228_8 <= arg_225_1.time_ and arg_225_1.time_ < var_228_8 + var_228_9 then
				local var_228_10 = (arg_225_1.time_ - var_228_8) / var_228_9

				if arg_225_1.var_.actorSpriteComps1060 then
					for iter_228_1, iter_228_2 in pairs(arg_225_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_228_2 then
							local var_228_11 = Mathf.Lerp(iter_228_2.color.r, 1, var_228_10)

							iter_228_2.color = Color.New(var_228_11, var_228_11, var_228_11)
						end
					end
				end
			end

			if arg_225_1.time_ >= var_228_8 + var_228_9 and arg_225_1.time_ < var_228_8 + var_228_9 + arg_228_0 and arg_225_1.var_.actorSpriteComps1060 then
				local var_228_12 = 1

				for iter_228_3, iter_228_4 in pairs(arg_225_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_228_4 then
						iter_228_4.color = Color.New(var_228_12, var_228_12, var_228_12)
					end
				end

				arg_225_1.var_.actorSpriteComps1060 = nil
			end

			local var_228_13 = 0
			local var_228_14 = 0.225

			if var_228_13 < arg_225_1.time_ and arg_225_1.time_ <= var_228_13 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_15 = arg_225_1:FormatText(StoryNameCfg[584].name)

				arg_225_1.leftNameTxt_.text = var_228_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_16 = arg_225_1:GetWordFromCfg(410021056)
				local var_228_17 = arg_225_1:FormatText(var_228_16.content)

				arg_225_1.text_.text = var_228_17

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_18 = 9
				local var_228_19 = utf8.len(var_228_17)
				local var_228_20 = var_228_18 <= 0 and var_228_14 or var_228_14 * (var_228_19 / var_228_18)

				if var_228_20 > 0 and var_228_14 < var_228_20 then
					arg_225_1.talkMaxDuration = var_228_20

					if var_228_20 + var_228_13 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_20 + var_228_13
					end
				end

				arg_225_1.text_.text = var_228_17
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021056", "story_v_out_410021.awb") ~= 0 then
					local var_228_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021056", "story_v_out_410021.awb") / 1000

					if var_228_21 + var_228_13 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_21 + var_228_13
					end

					if var_228_16.prefab_name ~= "" and arg_225_1.actors_[var_228_16.prefab_name] ~= nil then
						local var_228_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_16.prefab_name].transform, "story_v_out_410021", "410021056", "story_v_out_410021.awb")

						arg_225_1:RecordAudio("410021056", var_228_22)
						arg_225_1:RecordAudio("410021056", var_228_22)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_410021", "410021056", "story_v_out_410021.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_410021", "410021056", "story_v_out_410021.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_23 = math.max(var_228_14, arg_225_1.talkMaxDuration)

			if var_228_13 <= arg_225_1.time_ and arg_225_1.time_ < var_228_13 + var_228_23 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_13) / var_228_23

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_13 + var_228_23 and arg_225_1.time_ < var_228_13 + var_228_23 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play410021057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 410021057
		arg_229_1.duration_ = 6.1

		local var_229_0 = {
			zh = 1.9,
			ja = 6.1
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
				arg_229_0:Play410021058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1056"].transform
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 then
				arg_229_1.var_.moveOldPos1056 = var_232_0.localPosition
				var_232_0.localScale = Vector3.New(1, 1, 1)

				arg_229_1:CheckSpriteTmpPos("1056", 4)

				local var_232_2 = var_232_0.childCount

				for iter_232_0 = 0, var_232_2 - 1 do
					local var_232_3 = var_232_0:GetChild(iter_232_0)

					if var_232_3.name == "" or not string.find(var_232_3.name, "split") then
						var_232_3.gameObject:SetActive(true)
					else
						var_232_3.gameObject:SetActive(false)
					end
				end
			end

			local var_232_4 = 0.001

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_4 then
				local var_232_5 = (arg_229_1.time_ - var_232_1) / var_232_4
				local var_232_6 = Vector3.New(390, -350, -180)

				var_232_0.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1056, var_232_6, var_232_5)
			end

			if arg_229_1.time_ >= var_232_1 + var_232_4 and arg_229_1.time_ < var_232_1 + var_232_4 + arg_232_0 then
				var_232_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_232_7 = arg_229_1.actors_["1056"]
			local var_232_8 = 0

			if var_232_8 < arg_229_1.time_ and arg_229_1.time_ <= var_232_8 + arg_232_0 and arg_229_1.var_.actorSpriteComps1056 == nil then
				arg_229_1.var_.actorSpriteComps1056 = var_232_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_232_9 = 0.034

			if var_232_8 <= arg_229_1.time_ and arg_229_1.time_ < var_232_8 + var_232_9 then
				local var_232_10 = (arg_229_1.time_ - var_232_8) / var_232_9

				if arg_229_1.var_.actorSpriteComps1056 then
					for iter_232_1, iter_232_2 in pairs(arg_229_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_232_2 then
							local var_232_11 = Mathf.Lerp(iter_232_2.color.r, 1, var_232_10)

							iter_232_2.color = Color.New(var_232_11, var_232_11, var_232_11)
						end
					end
				end
			end

			if arg_229_1.time_ >= var_232_8 + var_232_9 and arg_229_1.time_ < var_232_8 + var_232_9 + arg_232_0 and arg_229_1.var_.actorSpriteComps1056 then
				local var_232_12 = 1

				for iter_232_3, iter_232_4 in pairs(arg_229_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_232_4 then
						iter_232_4.color = Color.New(var_232_12, var_232_12, var_232_12)
					end
				end

				arg_229_1.var_.actorSpriteComps1056 = nil
			end

			local var_232_13 = arg_229_1.actors_["1060"]
			local var_232_14 = 0

			if var_232_14 < arg_229_1.time_ and arg_229_1.time_ <= var_232_14 + arg_232_0 and arg_229_1.var_.actorSpriteComps1060 == nil then
				arg_229_1.var_.actorSpriteComps1060 = var_232_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_232_15 = 0.034

			if var_232_14 <= arg_229_1.time_ and arg_229_1.time_ < var_232_14 + var_232_15 then
				local var_232_16 = (arg_229_1.time_ - var_232_14) / var_232_15

				if arg_229_1.var_.actorSpriteComps1060 then
					for iter_232_5, iter_232_6 in pairs(arg_229_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_232_6 then
							local var_232_17 = Mathf.Lerp(iter_232_6.color.r, 0.5, var_232_16)

							iter_232_6.color = Color.New(var_232_17, var_232_17, var_232_17)
						end
					end
				end
			end

			if arg_229_1.time_ >= var_232_14 + var_232_15 and arg_229_1.time_ < var_232_14 + var_232_15 + arg_232_0 and arg_229_1.var_.actorSpriteComps1060 then
				local var_232_18 = 0.5

				for iter_232_7, iter_232_8 in pairs(arg_229_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_232_8 then
						iter_232_8.color = Color.New(var_232_18, var_232_18, var_232_18)
					end
				end

				arg_229_1.var_.actorSpriteComps1060 = nil
			end

			local var_232_19 = 0
			local var_232_20 = 0.25

			if var_232_19 < arg_229_1.time_ and arg_229_1.time_ <= var_232_19 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_21 = arg_229_1:FormatText(StoryNameCfg[605].name)

				arg_229_1.leftNameTxt_.text = var_232_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_22 = arg_229_1:GetWordFromCfg(410021057)
				local var_232_23 = arg_229_1:FormatText(var_232_22.content)

				arg_229_1.text_.text = var_232_23

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_24 = 10
				local var_232_25 = utf8.len(var_232_23)
				local var_232_26 = var_232_24 <= 0 and var_232_20 or var_232_20 * (var_232_25 / var_232_24)

				if var_232_26 > 0 and var_232_20 < var_232_26 then
					arg_229_1.talkMaxDuration = var_232_26

					if var_232_26 + var_232_19 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_26 + var_232_19
					end
				end

				arg_229_1.text_.text = var_232_23
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021057", "story_v_out_410021.awb") ~= 0 then
					local var_232_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021057", "story_v_out_410021.awb") / 1000

					if var_232_27 + var_232_19 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_27 + var_232_19
					end

					if var_232_22.prefab_name ~= "" and arg_229_1.actors_[var_232_22.prefab_name] ~= nil then
						local var_232_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_22.prefab_name].transform, "story_v_out_410021", "410021057", "story_v_out_410021.awb")

						arg_229_1:RecordAudio("410021057", var_232_28)
						arg_229_1:RecordAudio("410021057", var_232_28)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_410021", "410021057", "story_v_out_410021.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_410021", "410021057", "story_v_out_410021.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_29 = math.max(var_232_20, arg_229_1.talkMaxDuration)

			if var_232_19 <= arg_229_1.time_ and arg_229_1.time_ < var_232_19 + var_232_29 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_19) / var_232_29

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_19 + var_232_29 and arg_229_1.time_ < var_232_19 + var_232_29 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play410021058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 410021058
		arg_233_1.duration_ = 11.4

		local var_233_0 = {
			zh = 7.066,
			ja = 11.4
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
				arg_233_0:Play410021059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["1056"].transform
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				arg_233_1.var_.moveOldPos1056 = var_236_0.localPosition
				var_236_0.localScale = Vector3.New(1, 1, 1)

				arg_233_1:CheckSpriteTmpPos("1056", 4)

				local var_236_2 = var_236_0.childCount

				for iter_236_0 = 0, var_236_2 - 1 do
					local var_236_3 = var_236_0:GetChild(iter_236_0)

					if var_236_3.name == "" or not string.find(var_236_3.name, "split") then
						var_236_3.gameObject:SetActive(true)
					else
						var_236_3.gameObject:SetActive(false)
					end
				end
			end

			local var_236_4 = 0.001

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_4 then
				local var_236_5 = (arg_233_1.time_ - var_236_1) / var_236_4
				local var_236_6 = Vector3.New(390, -350, -180)

				var_236_0.localPosition = Vector3.Lerp(arg_233_1.var_.moveOldPos1056, var_236_6, var_236_5)
			end

			if arg_233_1.time_ >= var_236_1 + var_236_4 and arg_233_1.time_ < var_236_1 + var_236_4 + arg_236_0 then
				var_236_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_236_7 = arg_233_1.actors_["1056"]
			local var_236_8 = 0

			if var_236_8 < arg_233_1.time_ and arg_233_1.time_ <= var_236_8 + arg_236_0 and arg_233_1.var_.actorSpriteComps1056 == nil then
				arg_233_1.var_.actorSpriteComps1056 = var_236_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_236_9 = 0.034

			if var_236_8 <= arg_233_1.time_ and arg_233_1.time_ < var_236_8 + var_236_9 then
				local var_236_10 = (arg_233_1.time_ - var_236_8) / var_236_9

				if arg_233_1.var_.actorSpriteComps1056 then
					for iter_236_1, iter_236_2 in pairs(arg_233_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_236_2 then
							local var_236_11 = Mathf.Lerp(iter_236_2.color.r, 1, var_236_10)

							iter_236_2.color = Color.New(var_236_11, var_236_11, var_236_11)
						end
					end
				end
			end

			if arg_233_1.time_ >= var_236_8 + var_236_9 and arg_233_1.time_ < var_236_8 + var_236_9 + arg_236_0 and arg_233_1.var_.actorSpriteComps1056 then
				local var_236_12 = 1

				for iter_236_3, iter_236_4 in pairs(arg_233_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_236_4 then
						iter_236_4.color = Color.New(var_236_12, var_236_12, var_236_12)
					end
				end

				arg_233_1.var_.actorSpriteComps1056 = nil
			end

			local var_236_13 = 0
			local var_236_14 = 0.95

			if var_236_13 < arg_233_1.time_ and arg_233_1.time_ <= var_236_13 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_15 = arg_233_1:FormatText(StoryNameCfg[605].name)

				arg_233_1.leftNameTxt_.text = var_236_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_16 = arg_233_1:GetWordFromCfg(410021058)
				local var_236_17 = arg_233_1:FormatText(var_236_16.content)

				arg_233_1.text_.text = var_236_17

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_18 = 40
				local var_236_19 = utf8.len(var_236_17)
				local var_236_20 = var_236_18 <= 0 and var_236_14 or var_236_14 * (var_236_19 / var_236_18)

				if var_236_20 > 0 and var_236_14 < var_236_20 then
					arg_233_1.talkMaxDuration = var_236_20

					if var_236_20 + var_236_13 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_20 + var_236_13
					end
				end

				arg_233_1.text_.text = var_236_17
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021058", "story_v_out_410021.awb") ~= 0 then
					local var_236_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021058", "story_v_out_410021.awb") / 1000

					if var_236_21 + var_236_13 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_21 + var_236_13
					end

					if var_236_16.prefab_name ~= "" and arg_233_1.actors_[var_236_16.prefab_name] ~= nil then
						local var_236_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_16.prefab_name].transform, "story_v_out_410021", "410021058", "story_v_out_410021.awb")

						arg_233_1:RecordAudio("410021058", var_236_22)
						arg_233_1:RecordAudio("410021058", var_236_22)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_410021", "410021058", "story_v_out_410021.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_410021", "410021058", "story_v_out_410021.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_23 = math.max(var_236_14, arg_233_1.talkMaxDuration)

			if var_236_13 <= arg_233_1.time_ and arg_233_1.time_ < var_236_13 + var_236_23 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_13) / var_236_23

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_13 + var_236_23 and arg_233_1.time_ < var_236_13 + var_236_23 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play410021059 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 410021059
		arg_237_1.duration_ = 9.766

		local var_237_0 = {
			zh = 7.833,
			ja = 9.766
		}
		local var_237_1 = manager.audio:GetLocalizationFlag()

		if var_237_0[var_237_1] ~= nil then
			arg_237_1.duration_ = var_237_0[var_237_1]
		end

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play410021060(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1056"].transform
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 then
				arg_237_1.var_.moveOldPos1056 = var_240_0.localPosition
				var_240_0.localScale = Vector3.New(1, 1, 1)

				arg_237_1:CheckSpriteTmpPos("1056", 4)

				local var_240_2 = var_240_0.childCount

				for iter_240_0 = 0, var_240_2 - 1 do
					local var_240_3 = var_240_0:GetChild(iter_240_0)

					if var_240_3.name == "split_1" or not string.find(var_240_3.name, "split") then
						var_240_3.gameObject:SetActive(true)
					else
						var_240_3.gameObject:SetActive(false)
					end
				end
			end

			local var_240_4 = 0.001

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_4 then
				local var_240_5 = (arg_237_1.time_ - var_240_1) / var_240_4
				local var_240_6 = Vector3.New(390, -350, -180)

				var_240_0.localPosition = Vector3.Lerp(arg_237_1.var_.moveOldPos1056, var_240_6, var_240_5)
			end

			if arg_237_1.time_ >= var_240_1 + var_240_4 and arg_237_1.time_ < var_240_1 + var_240_4 + arg_240_0 then
				var_240_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_240_7 = arg_237_1.actors_["1056"]
			local var_240_8 = 0

			if var_240_8 < arg_237_1.time_ and arg_237_1.time_ <= var_240_8 + arg_240_0 and arg_237_1.var_.actorSpriteComps1056 == nil then
				arg_237_1.var_.actorSpriteComps1056 = var_240_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_240_9 = 0.034

			if var_240_8 <= arg_237_1.time_ and arg_237_1.time_ < var_240_8 + var_240_9 then
				local var_240_10 = (arg_237_1.time_ - var_240_8) / var_240_9

				if arg_237_1.var_.actorSpriteComps1056 then
					for iter_240_1, iter_240_2 in pairs(arg_237_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_240_2 then
							local var_240_11 = Mathf.Lerp(iter_240_2.color.r, 1, var_240_10)

							iter_240_2.color = Color.New(var_240_11, var_240_11, var_240_11)
						end
					end
				end
			end

			if arg_237_1.time_ >= var_240_8 + var_240_9 and arg_237_1.time_ < var_240_8 + var_240_9 + arg_240_0 and arg_237_1.var_.actorSpriteComps1056 then
				local var_240_12 = 1

				for iter_240_3, iter_240_4 in pairs(arg_237_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_240_4 then
						iter_240_4.color = Color.New(var_240_12, var_240_12, var_240_12)
					end
				end

				arg_237_1.var_.actorSpriteComps1056 = nil
			end

			local var_240_13 = 0
			local var_240_14 = 1.15

			if var_240_13 < arg_237_1.time_ and arg_237_1.time_ <= var_240_13 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_15 = arg_237_1:FormatText(StoryNameCfg[605].name)

				arg_237_1.leftNameTxt_.text = var_240_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_16 = arg_237_1:GetWordFromCfg(410021059)
				local var_240_17 = arg_237_1:FormatText(var_240_16.content)

				arg_237_1.text_.text = var_240_17

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_18 = 46
				local var_240_19 = utf8.len(var_240_17)
				local var_240_20 = var_240_18 <= 0 and var_240_14 or var_240_14 * (var_240_19 / var_240_18)

				if var_240_20 > 0 and var_240_14 < var_240_20 then
					arg_237_1.talkMaxDuration = var_240_20

					if var_240_20 + var_240_13 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_20 + var_240_13
					end
				end

				arg_237_1.text_.text = var_240_17
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021059", "story_v_out_410021.awb") ~= 0 then
					local var_240_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021059", "story_v_out_410021.awb") / 1000

					if var_240_21 + var_240_13 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_21 + var_240_13
					end

					if var_240_16.prefab_name ~= "" and arg_237_1.actors_[var_240_16.prefab_name] ~= nil then
						local var_240_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_16.prefab_name].transform, "story_v_out_410021", "410021059", "story_v_out_410021.awb")

						arg_237_1:RecordAudio("410021059", var_240_22)
						arg_237_1:RecordAudio("410021059", var_240_22)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_410021", "410021059", "story_v_out_410021.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_410021", "410021059", "story_v_out_410021.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_23 = math.max(var_240_14, arg_237_1.talkMaxDuration)

			if var_240_13 <= arg_237_1.time_ and arg_237_1.time_ < var_240_13 + var_240_23 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_13) / var_240_23

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_13 + var_240_23 and arg_237_1.time_ < var_240_13 + var_240_23 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play410021060 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 410021060
		arg_241_1.duration_ = 12.133

		local var_241_0 = {
			zh = 9.833,
			ja = 12.133
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
				arg_241_0:Play410021061(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["1056"].transform
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				arg_241_1.var_.moveOldPos1056 = var_244_0.localPosition
				var_244_0.localScale = Vector3.New(1, 1, 1)

				arg_241_1:CheckSpriteTmpPos("1056", 4)

				local var_244_2 = var_244_0.childCount

				for iter_244_0 = 0, var_244_2 - 1 do
					local var_244_3 = var_244_0:GetChild(iter_244_0)

					if var_244_3.name == "split_1" or not string.find(var_244_3.name, "split") then
						var_244_3.gameObject:SetActive(true)
					else
						var_244_3.gameObject:SetActive(false)
					end
				end
			end

			local var_244_4 = 0.001

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_4 then
				local var_244_5 = (arg_241_1.time_ - var_244_1) / var_244_4
				local var_244_6 = Vector3.New(390, -350, -180)

				var_244_0.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos1056, var_244_6, var_244_5)
			end

			if arg_241_1.time_ >= var_244_1 + var_244_4 and arg_241_1.time_ < var_244_1 + var_244_4 + arg_244_0 then
				var_244_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_244_7 = arg_241_1.actors_["1056"]
			local var_244_8 = 0

			if var_244_8 < arg_241_1.time_ and arg_241_1.time_ <= var_244_8 + arg_244_0 and arg_241_1.var_.actorSpriteComps1056 == nil then
				arg_241_1.var_.actorSpriteComps1056 = var_244_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_244_9 = 0.034

			if var_244_8 <= arg_241_1.time_ and arg_241_1.time_ < var_244_8 + var_244_9 then
				local var_244_10 = (arg_241_1.time_ - var_244_8) / var_244_9

				if arg_241_1.var_.actorSpriteComps1056 then
					for iter_244_1, iter_244_2 in pairs(arg_241_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_244_2 then
							local var_244_11 = Mathf.Lerp(iter_244_2.color.r, 1, var_244_10)

							iter_244_2.color = Color.New(var_244_11, var_244_11, var_244_11)
						end
					end
				end
			end

			if arg_241_1.time_ >= var_244_8 + var_244_9 and arg_241_1.time_ < var_244_8 + var_244_9 + arg_244_0 and arg_241_1.var_.actorSpriteComps1056 then
				local var_244_12 = 1

				for iter_244_3, iter_244_4 in pairs(arg_241_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_244_4 then
						iter_244_4.color = Color.New(var_244_12, var_244_12, var_244_12)
					end
				end

				arg_241_1.var_.actorSpriteComps1056 = nil
			end

			local var_244_13 = 0
			local var_244_14 = 1.4

			if var_244_13 < arg_241_1.time_ and arg_241_1.time_ <= var_244_13 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_15 = arg_241_1:FormatText(StoryNameCfg[605].name)

				arg_241_1.leftNameTxt_.text = var_244_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_16 = arg_241_1:GetWordFromCfg(410021060)
				local var_244_17 = arg_241_1:FormatText(var_244_16.content)

				arg_241_1.text_.text = var_244_17

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_18 = 56
				local var_244_19 = utf8.len(var_244_17)
				local var_244_20 = var_244_18 <= 0 and var_244_14 or var_244_14 * (var_244_19 / var_244_18)

				if var_244_20 > 0 and var_244_14 < var_244_20 then
					arg_241_1.talkMaxDuration = var_244_20

					if var_244_20 + var_244_13 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_20 + var_244_13
					end
				end

				arg_241_1.text_.text = var_244_17
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021060", "story_v_out_410021.awb") ~= 0 then
					local var_244_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021060", "story_v_out_410021.awb") / 1000

					if var_244_21 + var_244_13 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_21 + var_244_13
					end

					if var_244_16.prefab_name ~= "" and arg_241_1.actors_[var_244_16.prefab_name] ~= nil then
						local var_244_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_16.prefab_name].transform, "story_v_out_410021", "410021060", "story_v_out_410021.awb")

						arg_241_1:RecordAudio("410021060", var_244_22)
						arg_241_1:RecordAudio("410021060", var_244_22)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_410021", "410021060", "story_v_out_410021.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_410021", "410021060", "story_v_out_410021.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_23 = math.max(var_244_14, arg_241_1.talkMaxDuration)

			if var_244_13 <= arg_241_1.time_ and arg_241_1.time_ < var_244_13 + var_244_23 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_13) / var_244_23

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_13 + var_244_23 and arg_241_1.time_ < var_244_13 + var_244_23 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play410021061 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 410021061
		arg_245_1.duration_ = 8.366

		local var_245_0 = {
			zh = 3.366,
			ja = 8.366
		}
		local var_245_1 = manager.audio:GetLocalizationFlag()

		if var_245_0[var_245_1] ~= nil then
			arg_245_1.duration_ = var_245_0[var_245_1]
		end

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play410021062(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["1060"].transform
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 then
				arg_245_1.var_.moveOldPos1060 = var_248_0.localPosition
				var_248_0.localScale = Vector3.New(1, 1, 1)

				arg_245_1:CheckSpriteTmpPos("1060", 2)

				local var_248_2 = var_248_0.childCount

				for iter_248_0 = 0, var_248_2 - 1 do
					local var_248_3 = var_248_0:GetChild(iter_248_0)

					if var_248_3.name == "" or not string.find(var_248_3.name, "split") then
						var_248_3.gameObject:SetActive(true)
					else
						var_248_3.gameObject:SetActive(false)
					end
				end
			end

			local var_248_4 = 0.001

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_4 then
				local var_248_5 = (arg_245_1.time_ - var_248_1) / var_248_4
				local var_248_6 = Vector3.New(-390, -435, -40)

				var_248_0.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos1060, var_248_6, var_248_5)
			end

			if arg_245_1.time_ >= var_248_1 + var_248_4 and arg_245_1.time_ < var_248_1 + var_248_4 + arg_248_0 then
				var_248_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_248_7 = arg_245_1.actors_["1060"]
			local var_248_8 = 0

			if var_248_8 < arg_245_1.time_ and arg_245_1.time_ <= var_248_8 + arg_248_0 and arg_245_1.var_.actorSpriteComps1060 == nil then
				arg_245_1.var_.actorSpriteComps1060 = var_248_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_248_9 = 0.034

			if var_248_8 <= arg_245_1.time_ and arg_245_1.time_ < var_248_8 + var_248_9 then
				local var_248_10 = (arg_245_1.time_ - var_248_8) / var_248_9

				if arg_245_1.var_.actorSpriteComps1060 then
					for iter_248_1, iter_248_2 in pairs(arg_245_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_248_2 then
							local var_248_11 = Mathf.Lerp(iter_248_2.color.r, 1, var_248_10)

							iter_248_2.color = Color.New(var_248_11, var_248_11, var_248_11)
						end
					end
				end
			end

			if arg_245_1.time_ >= var_248_8 + var_248_9 and arg_245_1.time_ < var_248_8 + var_248_9 + arg_248_0 and arg_245_1.var_.actorSpriteComps1060 then
				local var_248_12 = 1

				for iter_248_3, iter_248_4 in pairs(arg_245_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_248_4 then
						iter_248_4.color = Color.New(var_248_12, var_248_12, var_248_12)
					end
				end

				arg_245_1.var_.actorSpriteComps1060 = nil
			end

			local var_248_13 = arg_245_1.actors_["1056"]
			local var_248_14 = 0

			if var_248_14 < arg_245_1.time_ and arg_245_1.time_ <= var_248_14 + arg_248_0 and arg_245_1.var_.actorSpriteComps1056 == nil then
				arg_245_1.var_.actorSpriteComps1056 = var_248_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_248_15 = 0.034

			if var_248_14 <= arg_245_1.time_ and arg_245_1.time_ < var_248_14 + var_248_15 then
				local var_248_16 = (arg_245_1.time_ - var_248_14) / var_248_15

				if arg_245_1.var_.actorSpriteComps1056 then
					for iter_248_5, iter_248_6 in pairs(arg_245_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_248_6 then
							local var_248_17 = Mathf.Lerp(iter_248_6.color.r, 0.5, var_248_16)

							iter_248_6.color = Color.New(var_248_17, var_248_17, var_248_17)
						end
					end
				end
			end

			if arg_245_1.time_ >= var_248_14 + var_248_15 and arg_245_1.time_ < var_248_14 + var_248_15 + arg_248_0 and arg_245_1.var_.actorSpriteComps1056 then
				local var_248_18 = 0.5

				for iter_248_7, iter_248_8 in pairs(arg_245_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_248_8 then
						iter_248_8.color = Color.New(var_248_18, var_248_18, var_248_18)
					end
				end

				arg_245_1.var_.actorSpriteComps1056 = nil
			end

			local var_248_19 = 0
			local var_248_20 = 0.375

			if var_248_19 < arg_245_1.time_ and arg_245_1.time_ <= var_248_19 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_21 = arg_245_1:FormatText(StoryNameCfg[584].name)

				arg_245_1.leftNameTxt_.text = var_248_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_22 = arg_245_1:GetWordFromCfg(410021061)
				local var_248_23 = arg_245_1:FormatText(var_248_22.content)

				arg_245_1.text_.text = var_248_23

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_24 = 15
				local var_248_25 = utf8.len(var_248_23)
				local var_248_26 = var_248_24 <= 0 and var_248_20 or var_248_20 * (var_248_25 / var_248_24)

				if var_248_26 > 0 and var_248_20 < var_248_26 then
					arg_245_1.talkMaxDuration = var_248_26

					if var_248_26 + var_248_19 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_26 + var_248_19
					end
				end

				arg_245_1.text_.text = var_248_23
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021061", "story_v_out_410021.awb") ~= 0 then
					local var_248_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021061", "story_v_out_410021.awb") / 1000

					if var_248_27 + var_248_19 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_27 + var_248_19
					end

					if var_248_22.prefab_name ~= "" and arg_245_1.actors_[var_248_22.prefab_name] ~= nil then
						local var_248_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_22.prefab_name].transform, "story_v_out_410021", "410021061", "story_v_out_410021.awb")

						arg_245_1:RecordAudio("410021061", var_248_28)
						arg_245_1:RecordAudio("410021061", var_248_28)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_410021", "410021061", "story_v_out_410021.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_410021", "410021061", "story_v_out_410021.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_29 = math.max(var_248_20, arg_245_1.talkMaxDuration)

			if var_248_19 <= arg_245_1.time_ and arg_245_1.time_ < var_248_19 + var_248_29 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_19) / var_248_29

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_19 + var_248_29 and arg_245_1.time_ < var_248_19 + var_248_29 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play410021062 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 410021062
		arg_249_1.duration_ = 6.8

		local var_249_0 = {
			zh = 6.533,
			ja = 6.8
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
				arg_249_0:Play410021063(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1056"].transform
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				arg_249_1.var_.moveOldPos1056 = var_252_0.localPosition
				var_252_0.localScale = Vector3.New(1, 1, 1)

				arg_249_1:CheckSpriteTmpPos("1056", 4)

				local var_252_2 = var_252_0.childCount

				for iter_252_0 = 0, var_252_2 - 1 do
					local var_252_3 = var_252_0:GetChild(iter_252_0)

					if var_252_3.name == "" or not string.find(var_252_3.name, "split") then
						var_252_3.gameObject:SetActive(true)
					else
						var_252_3.gameObject:SetActive(false)
					end
				end
			end

			local var_252_4 = 0.001

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_4 then
				local var_252_5 = (arg_249_1.time_ - var_252_1) / var_252_4
				local var_252_6 = Vector3.New(390, -350, -180)

				var_252_0.localPosition = Vector3.Lerp(arg_249_1.var_.moveOldPos1056, var_252_6, var_252_5)
			end

			if arg_249_1.time_ >= var_252_1 + var_252_4 and arg_249_1.time_ < var_252_1 + var_252_4 + arg_252_0 then
				var_252_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_252_7 = arg_249_1.actors_["1056"]
			local var_252_8 = 0

			if var_252_8 < arg_249_1.time_ and arg_249_1.time_ <= var_252_8 + arg_252_0 and arg_249_1.var_.actorSpriteComps1056 == nil then
				arg_249_1.var_.actorSpriteComps1056 = var_252_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_252_9 = 0.034

			if var_252_8 <= arg_249_1.time_ and arg_249_1.time_ < var_252_8 + var_252_9 then
				local var_252_10 = (arg_249_1.time_ - var_252_8) / var_252_9

				if arg_249_1.var_.actorSpriteComps1056 then
					for iter_252_1, iter_252_2 in pairs(arg_249_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_252_2 then
							local var_252_11 = Mathf.Lerp(iter_252_2.color.r, 1, var_252_10)

							iter_252_2.color = Color.New(var_252_11, var_252_11, var_252_11)
						end
					end
				end
			end

			if arg_249_1.time_ >= var_252_8 + var_252_9 and arg_249_1.time_ < var_252_8 + var_252_9 + arg_252_0 and arg_249_1.var_.actorSpriteComps1056 then
				local var_252_12 = 1

				for iter_252_3, iter_252_4 in pairs(arg_249_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_252_4 then
						iter_252_4.color = Color.New(var_252_12, var_252_12, var_252_12)
					end
				end

				arg_249_1.var_.actorSpriteComps1056 = nil
			end

			local var_252_13 = arg_249_1.actors_["1060"]
			local var_252_14 = 0

			if var_252_14 < arg_249_1.time_ and arg_249_1.time_ <= var_252_14 + arg_252_0 and arg_249_1.var_.actorSpriteComps1060 == nil then
				arg_249_1.var_.actorSpriteComps1060 = var_252_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_252_15 = 0.034

			if var_252_14 <= arg_249_1.time_ and arg_249_1.time_ < var_252_14 + var_252_15 then
				local var_252_16 = (arg_249_1.time_ - var_252_14) / var_252_15

				if arg_249_1.var_.actorSpriteComps1060 then
					for iter_252_5, iter_252_6 in pairs(arg_249_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_252_6 then
							local var_252_17 = Mathf.Lerp(iter_252_6.color.r, 0.5, var_252_16)

							iter_252_6.color = Color.New(var_252_17, var_252_17, var_252_17)
						end
					end
				end
			end

			if arg_249_1.time_ >= var_252_14 + var_252_15 and arg_249_1.time_ < var_252_14 + var_252_15 + arg_252_0 and arg_249_1.var_.actorSpriteComps1060 then
				local var_252_18 = 0.5

				for iter_252_7, iter_252_8 in pairs(arg_249_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_252_8 then
						iter_252_8.color = Color.New(var_252_18, var_252_18, var_252_18)
					end
				end

				arg_249_1.var_.actorSpriteComps1060 = nil
			end

			local var_252_19 = 0
			local var_252_20 = 0.825

			if var_252_19 < arg_249_1.time_ and arg_249_1.time_ <= var_252_19 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_21 = arg_249_1:FormatText(StoryNameCfg[605].name)

				arg_249_1.leftNameTxt_.text = var_252_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_22 = arg_249_1:GetWordFromCfg(410021062)
				local var_252_23 = arg_249_1:FormatText(var_252_22.content)

				arg_249_1.text_.text = var_252_23

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_24 = 33
				local var_252_25 = utf8.len(var_252_23)
				local var_252_26 = var_252_24 <= 0 and var_252_20 or var_252_20 * (var_252_25 / var_252_24)

				if var_252_26 > 0 and var_252_20 < var_252_26 then
					arg_249_1.talkMaxDuration = var_252_26

					if var_252_26 + var_252_19 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_26 + var_252_19
					end
				end

				arg_249_1.text_.text = var_252_23
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021062", "story_v_out_410021.awb") ~= 0 then
					local var_252_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021062", "story_v_out_410021.awb") / 1000

					if var_252_27 + var_252_19 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_27 + var_252_19
					end

					if var_252_22.prefab_name ~= "" and arg_249_1.actors_[var_252_22.prefab_name] ~= nil then
						local var_252_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_22.prefab_name].transform, "story_v_out_410021", "410021062", "story_v_out_410021.awb")

						arg_249_1:RecordAudio("410021062", var_252_28)
						arg_249_1:RecordAudio("410021062", var_252_28)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_410021", "410021062", "story_v_out_410021.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_410021", "410021062", "story_v_out_410021.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_29 = math.max(var_252_20, arg_249_1.talkMaxDuration)

			if var_252_19 <= arg_249_1.time_ and arg_249_1.time_ < var_252_19 + var_252_29 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_19) / var_252_29

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_19 + var_252_29 and arg_249_1.time_ < var_252_19 + var_252_29 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play410021063 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 410021063
		arg_253_1.duration_ = 9.8

		local var_253_0 = {
			zh = 7.9,
			ja = 9.8
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
				arg_253_0:Play410021064(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1056"].transform
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 then
				arg_253_1.var_.moveOldPos1056 = var_256_0.localPosition
				var_256_0.localScale = Vector3.New(1, 1, 1)

				arg_253_1:CheckSpriteTmpPos("1056", 4)

				local var_256_2 = var_256_0.childCount

				for iter_256_0 = 0, var_256_2 - 1 do
					local var_256_3 = var_256_0:GetChild(iter_256_0)

					if var_256_3.name == "" or not string.find(var_256_3.name, "split") then
						var_256_3.gameObject:SetActive(true)
					else
						var_256_3.gameObject:SetActive(false)
					end
				end
			end

			local var_256_4 = 0.001

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_4 then
				local var_256_5 = (arg_253_1.time_ - var_256_1) / var_256_4
				local var_256_6 = Vector3.New(390, -350, -180)

				var_256_0.localPosition = Vector3.Lerp(arg_253_1.var_.moveOldPos1056, var_256_6, var_256_5)
			end

			if arg_253_1.time_ >= var_256_1 + var_256_4 and arg_253_1.time_ < var_256_1 + var_256_4 + arg_256_0 then
				var_256_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_256_7 = arg_253_1.actors_["1056"]
			local var_256_8 = 0

			if var_256_8 < arg_253_1.time_ and arg_253_1.time_ <= var_256_8 + arg_256_0 and arg_253_1.var_.actorSpriteComps1056 == nil then
				arg_253_1.var_.actorSpriteComps1056 = var_256_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_256_9 = 0.034

			if var_256_8 <= arg_253_1.time_ and arg_253_1.time_ < var_256_8 + var_256_9 then
				local var_256_10 = (arg_253_1.time_ - var_256_8) / var_256_9

				if arg_253_1.var_.actorSpriteComps1056 then
					for iter_256_1, iter_256_2 in pairs(arg_253_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_256_2 then
							local var_256_11 = Mathf.Lerp(iter_256_2.color.r, 1, var_256_10)

							iter_256_2.color = Color.New(var_256_11, var_256_11, var_256_11)
						end
					end
				end
			end

			if arg_253_1.time_ >= var_256_8 + var_256_9 and arg_253_1.time_ < var_256_8 + var_256_9 + arg_256_0 and arg_253_1.var_.actorSpriteComps1056 then
				local var_256_12 = 1

				for iter_256_3, iter_256_4 in pairs(arg_253_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_256_4 then
						iter_256_4.color = Color.New(var_256_12, var_256_12, var_256_12)
					end
				end

				arg_253_1.var_.actorSpriteComps1056 = nil
			end

			local var_256_13 = 0
			local var_256_14 = 1.075

			if var_256_13 < arg_253_1.time_ and arg_253_1.time_ <= var_256_13 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_15 = arg_253_1:FormatText(StoryNameCfg[605].name)

				arg_253_1.leftNameTxt_.text = var_256_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_16 = arg_253_1:GetWordFromCfg(410021063)
				local var_256_17 = arg_253_1:FormatText(var_256_16.content)

				arg_253_1.text_.text = var_256_17

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_18 = 43
				local var_256_19 = utf8.len(var_256_17)
				local var_256_20 = var_256_18 <= 0 and var_256_14 or var_256_14 * (var_256_19 / var_256_18)

				if var_256_20 > 0 and var_256_14 < var_256_20 then
					arg_253_1.talkMaxDuration = var_256_20

					if var_256_20 + var_256_13 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_20 + var_256_13
					end
				end

				arg_253_1.text_.text = var_256_17
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021063", "story_v_out_410021.awb") ~= 0 then
					local var_256_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021063", "story_v_out_410021.awb") / 1000

					if var_256_21 + var_256_13 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_21 + var_256_13
					end

					if var_256_16.prefab_name ~= "" and arg_253_1.actors_[var_256_16.prefab_name] ~= nil then
						local var_256_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_16.prefab_name].transform, "story_v_out_410021", "410021063", "story_v_out_410021.awb")

						arg_253_1:RecordAudio("410021063", var_256_22)
						arg_253_1:RecordAudio("410021063", var_256_22)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_410021", "410021063", "story_v_out_410021.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_410021", "410021063", "story_v_out_410021.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_23 = math.max(var_256_14, arg_253_1.talkMaxDuration)

			if var_256_13 <= arg_253_1.time_ and arg_253_1.time_ < var_256_13 + var_256_23 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_13) / var_256_23

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_13 + var_256_23 and arg_253_1.time_ < var_256_13 + var_256_23 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play410021064 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 410021064
		arg_257_1.duration_ = 8.3

		local var_257_0 = {
			zh = 6.5,
			ja = 8.3
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
				arg_257_0:Play410021065(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = arg_257_1.actors_["1056"].transform
			local var_260_1 = 0

			if var_260_1 < arg_257_1.time_ and arg_257_1.time_ <= var_260_1 + arg_260_0 then
				arg_257_1.var_.moveOldPos1056 = var_260_0.localPosition
				var_260_0.localScale = Vector3.New(1, 1, 1)

				arg_257_1:CheckSpriteTmpPos("1056", 4)

				local var_260_2 = var_260_0.childCount

				for iter_260_0 = 0, var_260_2 - 1 do
					local var_260_3 = var_260_0:GetChild(iter_260_0)

					if var_260_3.name == "split_1" or not string.find(var_260_3.name, "split") then
						var_260_3.gameObject:SetActive(true)
					else
						var_260_3.gameObject:SetActive(false)
					end
				end
			end

			local var_260_4 = 0.001

			if var_260_1 <= arg_257_1.time_ and arg_257_1.time_ < var_260_1 + var_260_4 then
				local var_260_5 = (arg_257_1.time_ - var_260_1) / var_260_4
				local var_260_6 = Vector3.New(390, -350, -180)

				var_260_0.localPosition = Vector3.Lerp(arg_257_1.var_.moveOldPos1056, var_260_6, var_260_5)
			end

			if arg_257_1.time_ >= var_260_1 + var_260_4 and arg_257_1.time_ < var_260_1 + var_260_4 + arg_260_0 then
				var_260_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_260_7 = arg_257_1.actors_["1056"]
			local var_260_8 = 0

			if var_260_8 < arg_257_1.time_ and arg_257_1.time_ <= var_260_8 + arg_260_0 and arg_257_1.var_.actorSpriteComps1056 == nil then
				arg_257_1.var_.actorSpriteComps1056 = var_260_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_260_9 = 0.034

			if var_260_8 <= arg_257_1.time_ and arg_257_1.time_ < var_260_8 + var_260_9 then
				local var_260_10 = (arg_257_1.time_ - var_260_8) / var_260_9

				if arg_257_1.var_.actorSpriteComps1056 then
					for iter_260_1, iter_260_2 in pairs(arg_257_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_260_2 then
							local var_260_11 = Mathf.Lerp(iter_260_2.color.r, 1, var_260_10)

							iter_260_2.color = Color.New(var_260_11, var_260_11, var_260_11)
						end
					end
				end
			end

			if arg_257_1.time_ >= var_260_8 + var_260_9 and arg_257_1.time_ < var_260_8 + var_260_9 + arg_260_0 and arg_257_1.var_.actorSpriteComps1056 then
				local var_260_12 = 1

				for iter_260_3, iter_260_4 in pairs(arg_257_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_260_4 then
						iter_260_4.color = Color.New(var_260_12, var_260_12, var_260_12)
					end
				end

				arg_257_1.var_.actorSpriteComps1056 = nil
			end

			local var_260_13 = 0
			local var_260_14 = 0.675

			if var_260_13 < arg_257_1.time_ and arg_257_1.time_ <= var_260_13 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_15 = arg_257_1:FormatText(StoryNameCfg[605].name)

				arg_257_1.leftNameTxt_.text = var_260_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_16 = arg_257_1:GetWordFromCfg(410021064)
				local var_260_17 = arg_257_1:FormatText(var_260_16.content)

				arg_257_1.text_.text = var_260_17

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_18 = 27
				local var_260_19 = utf8.len(var_260_17)
				local var_260_20 = var_260_18 <= 0 and var_260_14 or var_260_14 * (var_260_19 / var_260_18)

				if var_260_20 > 0 and var_260_14 < var_260_20 then
					arg_257_1.talkMaxDuration = var_260_20

					if var_260_20 + var_260_13 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_20 + var_260_13
					end
				end

				arg_257_1.text_.text = var_260_17
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021064", "story_v_out_410021.awb") ~= 0 then
					local var_260_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021064", "story_v_out_410021.awb") / 1000

					if var_260_21 + var_260_13 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_21 + var_260_13
					end

					if var_260_16.prefab_name ~= "" and arg_257_1.actors_[var_260_16.prefab_name] ~= nil then
						local var_260_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_16.prefab_name].transform, "story_v_out_410021", "410021064", "story_v_out_410021.awb")

						arg_257_1:RecordAudio("410021064", var_260_22)
						arg_257_1:RecordAudio("410021064", var_260_22)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_410021", "410021064", "story_v_out_410021.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_410021", "410021064", "story_v_out_410021.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_23 = math.max(var_260_14, arg_257_1.talkMaxDuration)

			if var_260_13 <= arg_257_1.time_ and arg_257_1.time_ < var_260_13 + var_260_23 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_13) / var_260_23

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_13 + var_260_23 and arg_257_1.time_ < var_260_13 + var_260_23 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play410021065 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 410021065
		arg_261_1.duration_ = 5

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play410021066(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["1056"]
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 and arg_261_1.var_.actorSpriteComps1056 == nil then
				arg_261_1.var_.actorSpriteComps1056 = var_264_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_264_2 = 0.034

			if var_264_1 <= arg_261_1.time_ and arg_261_1.time_ < var_264_1 + var_264_2 then
				local var_264_3 = (arg_261_1.time_ - var_264_1) / var_264_2

				if arg_261_1.var_.actorSpriteComps1056 then
					for iter_264_0, iter_264_1 in pairs(arg_261_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_264_1 then
							local var_264_4 = Mathf.Lerp(iter_264_1.color.r, 0.5, var_264_3)

							iter_264_1.color = Color.New(var_264_4, var_264_4, var_264_4)
						end
					end
				end
			end

			if arg_261_1.time_ >= var_264_1 + var_264_2 and arg_261_1.time_ < var_264_1 + var_264_2 + arg_264_0 and arg_261_1.var_.actorSpriteComps1056 then
				local var_264_5 = 0.5

				for iter_264_2, iter_264_3 in pairs(arg_261_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_264_3 then
						iter_264_3.color = Color.New(var_264_5, var_264_5, var_264_5)
					end
				end

				arg_261_1.var_.actorSpriteComps1056 = nil
			end

			local var_264_6 = 0
			local var_264_7 = 1.4

			if var_264_6 < arg_261_1.time_ and arg_261_1.time_ <= var_264_6 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, false)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_8 = arg_261_1:GetWordFromCfg(410021065)
				local var_264_9 = arg_261_1:FormatText(var_264_8.content)

				arg_261_1.text_.text = var_264_9

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_10 = 56
				local var_264_11 = utf8.len(var_264_9)
				local var_264_12 = var_264_10 <= 0 and var_264_7 or var_264_7 * (var_264_11 / var_264_10)

				if var_264_12 > 0 and var_264_7 < var_264_12 then
					arg_261_1.talkMaxDuration = var_264_12

					if var_264_12 + var_264_6 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_12 + var_264_6
					end
				end

				arg_261_1.text_.text = var_264_9
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)
				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_13 = math.max(var_264_7, arg_261_1.talkMaxDuration)

			if var_264_6 <= arg_261_1.time_ and arg_261_1.time_ < var_264_6 + var_264_13 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_6) / var_264_13

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_6 + var_264_13 and arg_261_1.time_ < var_264_6 + var_264_13 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play410021066 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 410021066
		arg_265_1.duration_ = 5

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play410021067(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0
			local var_268_1 = 0.95

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, false)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_2 = arg_265_1:GetWordFromCfg(410021066)
				local var_268_3 = arg_265_1:FormatText(var_268_2.content)

				arg_265_1.text_.text = var_268_3

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_4 = 38
				local var_268_5 = utf8.len(var_268_3)
				local var_268_6 = var_268_4 <= 0 and var_268_1 or var_268_1 * (var_268_5 / var_268_4)

				if var_268_6 > 0 and var_268_1 < var_268_6 then
					arg_265_1.talkMaxDuration = var_268_6

					if var_268_6 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_6 + var_268_0
					end
				end

				arg_265_1.text_.text = var_268_3
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)
				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_7 = math.max(var_268_1, arg_265_1.talkMaxDuration)

			if var_268_0 <= arg_265_1.time_ and arg_265_1.time_ < var_268_0 + var_268_7 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_0) / var_268_7

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_0 + var_268_7 and arg_265_1.time_ < var_268_0 + var_268_7 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play410021067 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 410021067
		arg_269_1.duration_ = 7

		local var_269_0 = {
			zh = 3.766,
			ja = 7
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
				arg_269_0:Play410021068(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["1060"].transform
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 then
				arg_269_1.var_.moveOldPos1060 = var_272_0.localPosition
				var_272_0.localScale = Vector3.New(1, 1, 1)

				arg_269_1:CheckSpriteTmpPos("1060", 2)

				local var_272_2 = var_272_0.childCount

				for iter_272_0 = 0, var_272_2 - 1 do
					local var_272_3 = var_272_0:GetChild(iter_272_0)

					if var_272_3.name == "" or not string.find(var_272_3.name, "split") then
						var_272_3.gameObject:SetActive(true)
					else
						var_272_3.gameObject:SetActive(false)
					end
				end
			end

			local var_272_4 = 0.001

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_4 then
				local var_272_5 = (arg_269_1.time_ - var_272_1) / var_272_4
				local var_272_6 = Vector3.New(-390, -435, -40)

				var_272_0.localPosition = Vector3.Lerp(arg_269_1.var_.moveOldPos1060, var_272_6, var_272_5)
			end

			if arg_269_1.time_ >= var_272_1 + var_272_4 and arg_269_1.time_ < var_272_1 + var_272_4 + arg_272_0 then
				var_272_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_272_7 = arg_269_1.actors_["1060"]
			local var_272_8 = 0

			if var_272_8 < arg_269_1.time_ and arg_269_1.time_ <= var_272_8 + arg_272_0 and arg_269_1.var_.actorSpriteComps1060 == nil then
				arg_269_1.var_.actorSpriteComps1060 = var_272_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_272_9 = 0.034

			if var_272_8 <= arg_269_1.time_ and arg_269_1.time_ < var_272_8 + var_272_9 then
				local var_272_10 = (arg_269_1.time_ - var_272_8) / var_272_9

				if arg_269_1.var_.actorSpriteComps1060 then
					for iter_272_1, iter_272_2 in pairs(arg_269_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_272_2 then
							local var_272_11 = Mathf.Lerp(iter_272_2.color.r, 1, var_272_10)

							iter_272_2.color = Color.New(var_272_11, var_272_11, var_272_11)
						end
					end
				end
			end

			if arg_269_1.time_ >= var_272_8 + var_272_9 and arg_269_1.time_ < var_272_8 + var_272_9 + arg_272_0 and arg_269_1.var_.actorSpriteComps1060 then
				local var_272_12 = 1

				for iter_272_3, iter_272_4 in pairs(arg_269_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_272_4 then
						iter_272_4.color = Color.New(var_272_12, var_272_12, var_272_12)
					end
				end

				arg_269_1.var_.actorSpriteComps1060 = nil
			end

			local var_272_13 = 0
			local var_272_14 = 0.45

			if var_272_13 < arg_269_1.time_ and arg_269_1.time_ <= var_272_13 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_15 = arg_269_1:FormatText(StoryNameCfg[584].name)

				arg_269_1.leftNameTxt_.text = var_272_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_16 = arg_269_1:GetWordFromCfg(410021067)
				local var_272_17 = arg_269_1:FormatText(var_272_16.content)

				arg_269_1.text_.text = var_272_17

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_18 = 18
				local var_272_19 = utf8.len(var_272_17)
				local var_272_20 = var_272_18 <= 0 and var_272_14 or var_272_14 * (var_272_19 / var_272_18)

				if var_272_20 > 0 and var_272_14 < var_272_20 then
					arg_269_1.talkMaxDuration = var_272_20

					if var_272_20 + var_272_13 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_20 + var_272_13
					end
				end

				arg_269_1.text_.text = var_272_17
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021067", "story_v_out_410021.awb") ~= 0 then
					local var_272_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021067", "story_v_out_410021.awb") / 1000

					if var_272_21 + var_272_13 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_21 + var_272_13
					end

					if var_272_16.prefab_name ~= "" and arg_269_1.actors_[var_272_16.prefab_name] ~= nil then
						local var_272_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_16.prefab_name].transform, "story_v_out_410021", "410021067", "story_v_out_410021.awb")

						arg_269_1:RecordAudio("410021067", var_272_22)
						arg_269_1:RecordAudio("410021067", var_272_22)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_410021", "410021067", "story_v_out_410021.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_410021", "410021067", "story_v_out_410021.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_23 = math.max(var_272_14, arg_269_1.talkMaxDuration)

			if var_272_13 <= arg_269_1.time_ and arg_269_1.time_ < var_272_13 + var_272_23 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_13) / var_272_23

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_13 + var_272_23 and arg_269_1.time_ < var_272_13 + var_272_23 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play410021068 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 410021068
		arg_273_1.duration_ = 5.4

		local var_273_0 = {
			zh = 4.066,
			ja = 5.4
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
				arg_273_0:Play410021069(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["1056"].transform
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 then
				arg_273_1.var_.moveOldPos1056 = var_276_0.localPosition
				var_276_0.localScale = Vector3.New(1, 1, 1)

				arg_273_1:CheckSpriteTmpPos("1056", 4)

				local var_276_2 = var_276_0.childCount

				for iter_276_0 = 0, var_276_2 - 1 do
					local var_276_3 = var_276_0:GetChild(iter_276_0)

					if var_276_3.name == "" or not string.find(var_276_3.name, "split") then
						var_276_3.gameObject:SetActive(true)
					else
						var_276_3.gameObject:SetActive(false)
					end
				end
			end

			local var_276_4 = 0.001

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_4 then
				local var_276_5 = (arg_273_1.time_ - var_276_1) / var_276_4
				local var_276_6 = Vector3.New(390, -350, -180)

				var_276_0.localPosition = Vector3.Lerp(arg_273_1.var_.moveOldPos1056, var_276_6, var_276_5)
			end

			if arg_273_1.time_ >= var_276_1 + var_276_4 and arg_273_1.time_ < var_276_1 + var_276_4 + arg_276_0 then
				var_276_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_276_7 = arg_273_1.actors_["1056"]
			local var_276_8 = 0

			if var_276_8 < arg_273_1.time_ and arg_273_1.time_ <= var_276_8 + arg_276_0 and arg_273_1.var_.actorSpriteComps1056 == nil then
				arg_273_1.var_.actorSpriteComps1056 = var_276_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_276_9 = 0.034

			if var_276_8 <= arg_273_1.time_ and arg_273_1.time_ < var_276_8 + var_276_9 then
				local var_276_10 = (arg_273_1.time_ - var_276_8) / var_276_9

				if arg_273_1.var_.actorSpriteComps1056 then
					for iter_276_1, iter_276_2 in pairs(arg_273_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_276_2 then
							local var_276_11 = Mathf.Lerp(iter_276_2.color.r, 1, var_276_10)

							iter_276_2.color = Color.New(var_276_11, var_276_11, var_276_11)
						end
					end
				end
			end

			if arg_273_1.time_ >= var_276_8 + var_276_9 and arg_273_1.time_ < var_276_8 + var_276_9 + arg_276_0 and arg_273_1.var_.actorSpriteComps1056 then
				local var_276_12 = 1

				for iter_276_3, iter_276_4 in pairs(arg_273_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_276_4 then
						iter_276_4.color = Color.New(var_276_12, var_276_12, var_276_12)
					end
				end

				arg_273_1.var_.actorSpriteComps1056 = nil
			end

			local var_276_13 = arg_273_1.actors_["1060"]
			local var_276_14 = 0

			if var_276_14 < arg_273_1.time_ and arg_273_1.time_ <= var_276_14 + arg_276_0 and arg_273_1.var_.actorSpriteComps1060 == nil then
				arg_273_1.var_.actorSpriteComps1060 = var_276_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_276_15 = 0.034

			if var_276_14 <= arg_273_1.time_ and arg_273_1.time_ < var_276_14 + var_276_15 then
				local var_276_16 = (arg_273_1.time_ - var_276_14) / var_276_15

				if arg_273_1.var_.actorSpriteComps1060 then
					for iter_276_5, iter_276_6 in pairs(arg_273_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_276_6 then
							local var_276_17 = Mathf.Lerp(iter_276_6.color.r, 0.5, var_276_16)

							iter_276_6.color = Color.New(var_276_17, var_276_17, var_276_17)
						end
					end
				end
			end

			if arg_273_1.time_ >= var_276_14 + var_276_15 and arg_273_1.time_ < var_276_14 + var_276_15 + arg_276_0 and arg_273_1.var_.actorSpriteComps1060 then
				local var_276_18 = 0.5

				for iter_276_7, iter_276_8 in pairs(arg_273_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_276_8 then
						iter_276_8.color = Color.New(var_276_18, var_276_18, var_276_18)
					end
				end

				arg_273_1.var_.actorSpriteComps1060 = nil
			end

			local var_276_19 = 0
			local var_276_20 = 0.525

			if var_276_19 < arg_273_1.time_ and arg_273_1.time_ <= var_276_19 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_21 = arg_273_1:FormatText(StoryNameCfg[605].name)

				arg_273_1.leftNameTxt_.text = var_276_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_22 = arg_273_1:GetWordFromCfg(410021068)
				local var_276_23 = arg_273_1:FormatText(var_276_22.content)

				arg_273_1.text_.text = var_276_23

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_24 = 21
				local var_276_25 = utf8.len(var_276_23)
				local var_276_26 = var_276_24 <= 0 and var_276_20 or var_276_20 * (var_276_25 / var_276_24)

				if var_276_26 > 0 and var_276_20 < var_276_26 then
					arg_273_1.talkMaxDuration = var_276_26

					if var_276_26 + var_276_19 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_26 + var_276_19
					end
				end

				arg_273_1.text_.text = var_276_23
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021068", "story_v_out_410021.awb") ~= 0 then
					local var_276_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021068", "story_v_out_410021.awb") / 1000

					if var_276_27 + var_276_19 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_27 + var_276_19
					end

					if var_276_22.prefab_name ~= "" and arg_273_1.actors_[var_276_22.prefab_name] ~= nil then
						local var_276_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_22.prefab_name].transform, "story_v_out_410021", "410021068", "story_v_out_410021.awb")

						arg_273_1:RecordAudio("410021068", var_276_28)
						arg_273_1:RecordAudio("410021068", var_276_28)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_410021", "410021068", "story_v_out_410021.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_410021", "410021068", "story_v_out_410021.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_29 = math.max(var_276_20, arg_273_1.talkMaxDuration)

			if var_276_19 <= arg_273_1.time_ and arg_273_1.time_ < var_276_19 + var_276_29 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_19) / var_276_29

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_19 + var_276_29 and arg_273_1.time_ < var_276_19 + var_276_29 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play410021069 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 410021069
		arg_277_1.duration_ = 9.733

		local var_277_0 = {
			zh = 3.4,
			ja = 9.733
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
				arg_277_0:Play410021070(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["1060"].transform
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 then
				arg_277_1.var_.moveOldPos1060 = var_280_0.localPosition
				var_280_0.localScale = Vector3.New(1, 1, 1)

				arg_277_1:CheckSpriteTmpPos("1060", 2)

				local var_280_2 = var_280_0.childCount

				for iter_280_0 = 0, var_280_2 - 1 do
					local var_280_3 = var_280_0:GetChild(iter_280_0)

					if var_280_3.name == "split_3" or not string.find(var_280_3.name, "split") then
						var_280_3.gameObject:SetActive(true)
					else
						var_280_3.gameObject:SetActive(false)
					end
				end
			end

			local var_280_4 = 0.001

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_4 then
				local var_280_5 = (arg_277_1.time_ - var_280_1) / var_280_4
				local var_280_6 = Vector3.New(-390, -435, -40)

				var_280_0.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos1060, var_280_6, var_280_5)
			end

			if arg_277_1.time_ >= var_280_1 + var_280_4 and arg_277_1.time_ < var_280_1 + var_280_4 + arg_280_0 then
				var_280_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_280_7 = arg_277_1.actors_["1060"]
			local var_280_8 = 0

			if var_280_8 < arg_277_1.time_ and arg_277_1.time_ <= var_280_8 + arg_280_0 and arg_277_1.var_.actorSpriteComps1060 == nil then
				arg_277_1.var_.actorSpriteComps1060 = var_280_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_280_9 = 0.034

			if var_280_8 <= arg_277_1.time_ and arg_277_1.time_ < var_280_8 + var_280_9 then
				local var_280_10 = (arg_277_1.time_ - var_280_8) / var_280_9

				if arg_277_1.var_.actorSpriteComps1060 then
					for iter_280_1, iter_280_2 in pairs(arg_277_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_280_2 then
							local var_280_11 = Mathf.Lerp(iter_280_2.color.r, 1, var_280_10)

							iter_280_2.color = Color.New(var_280_11, var_280_11, var_280_11)
						end
					end
				end
			end

			if arg_277_1.time_ >= var_280_8 + var_280_9 and arg_277_1.time_ < var_280_8 + var_280_9 + arg_280_0 and arg_277_1.var_.actorSpriteComps1060 then
				local var_280_12 = 1

				for iter_280_3, iter_280_4 in pairs(arg_277_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_280_4 then
						iter_280_4.color = Color.New(var_280_12, var_280_12, var_280_12)
					end
				end

				arg_277_1.var_.actorSpriteComps1060 = nil
			end

			local var_280_13 = arg_277_1.actors_["1056"]
			local var_280_14 = 0

			if var_280_14 < arg_277_1.time_ and arg_277_1.time_ <= var_280_14 + arg_280_0 and arg_277_1.var_.actorSpriteComps1056 == nil then
				arg_277_1.var_.actorSpriteComps1056 = var_280_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_280_15 = 0.034

			if var_280_14 <= arg_277_1.time_ and arg_277_1.time_ < var_280_14 + var_280_15 then
				local var_280_16 = (arg_277_1.time_ - var_280_14) / var_280_15

				if arg_277_1.var_.actorSpriteComps1056 then
					for iter_280_5, iter_280_6 in pairs(arg_277_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_280_6 then
							local var_280_17 = Mathf.Lerp(iter_280_6.color.r, 0.5, var_280_16)

							iter_280_6.color = Color.New(var_280_17, var_280_17, var_280_17)
						end
					end
				end
			end

			if arg_277_1.time_ >= var_280_14 + var_280_15 and arg_277_1.time_ < var_280_14 + var_280_15 + arg_280_0 and arg_277_1.var_.actorSpriteComps1056 then
				local var_280_18 = 0.5

				for iter_280_7, iter_280_8 in pairs(arg_277_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_280_8 then
						iter_280_8.color = Color.New(var_280_18, var_280_18, var_280_18)
					end
				end

				arg_277_1.var_.actorSpriteComps1056 = nil
			end

			local var_280_19 = 0
			local var_280_20 = 0.375

			if var_280_19 < arg_277_1.time_ and arg_277_1.time_ <= var_280_19 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_21 = arg_277_1:FormatText(StoryNameCfg[584].name)

				arg_277_1.leftNameTxt_.text = var_280_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_22 = arg_277_1:GetWordFromCfg(410021069)
				local var_280_23 = arg_277_1:FormatText(var_280_22.content)

				arg_277_1.text_.text = var_280_23

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_24 = 15
				local var_280_25 = utf8.len(var_280_23)
				local var_280_26 = var_280_24 <= 0 and var_280_20 or var_280_20 * (var_280_25 / var_280_24)

				if var_280_26 > 0 and var_280_20 < var_280_26 then
					arg_277_1.talkMaxDuration = var_280_26

					if var_280_26 + var_280_19 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_26 + var_280_19
					end
				end

				arg_277_1.text_.text = var_280_23
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021069", "story_v_out_410021.awb") ~= 0 then
					local var_280_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021069", "story_v_out_410021.awb") / 1000

					if var_280_27 + var_280_19 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_27 + var_280_19
					end

					if var_280_22.prefab_name ~= "" and arg_277_1.actors_[var_280_22.prefab_name] ~= nil then
						local var_280_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_22.prefab_name].transform, "story_v_out_410021", "410021069", "story_v_out_410021.awb")

						arg_277_1:RecordAudio("410021069", var_280_28)
						arg_277_1:RecordAudio("410021069", var_280_28)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_410021", "410021069", "story_v_out_410021.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_410021", "410021069", "story_v_out_410021.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_29 = math.max(var_280_20, arg_277_1.talkMaxDuration)

			if var_280_19 <= arg_277_1.time_ and arg_277_1.time_ < var_280_19 + var_280_29 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_19) / var_280_29

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_19 + var_280_29 and arg_277_1.time_ < var_280_19 + var_280_29 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play410021070 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 410021070
		arg_281_1.duration_ = 14.366

		local var_281_0 = {
			zh = 14.2,
			ja = 14.366
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
				arg_281_0:Play410021071(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["1056"].transform
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 then
				arg_281_1.var_.moveOldPos1056 = var_284_0.localPosition
				var_284_0.localScale = Vector3.New(1, 1, 1)

				arg_281_1:CheckSpriteTmpPos("1056", 4)

				local var_284_2 = var_284_0.childCount

				for iter_284_0 = 0, var_284_2 - 1 do
					local var_284_3 = var_284_0:GetChild(iter_284_0)

					if var_284_3.name == "split_2" or not string.find(var_284_3.name, "split") then
						var_284_3.gameObject:SetActive(true)
					else
						var_284_3.gameObject:SetActive(false)
					end
				end
			end

			local var_284_4 = 0.001

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_4 then
				local var_284_5 = (arg_281_1.time_ - var_284_1) / var_284_4
				local var_284_6 = Vector3.New(390, -350, -180)

				var_284_0.localPosition = Vector3.Lerp(arg_281_1.var_.moveOldPos1056, var_284_6, var_284_5)
			end

			if arg_281_1.time_ >= var_284_1 + var_284_4 and arg_281_1.time_ < var_284_1 + var_284_4 + arg_284_0 then
				var_284_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_284_7 = arg_281_1.actors_["1056"]
			local var_284_8 = 0

			if var_284_8 < arg_281_1.time_ and arg_281_1.time_ <= var_284_8 + arg_284_0 and arg_281_1.var_.actorSpriteComps1056 == nil then
				arg_281_1.var_.actorSpriteComps1056 = var_284_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_284_9 = 0.034

			if var_284_8 <= arg_281_1.time_ and arg_281_1.time_ < var_284_8 + var_284_9 then
				local var_284_10 = (arg_281_1.time_ - var_284_8) / var_284_9

				if arg_281_1.var_.actorSpriteComps1056 then
					for iter_284_1, iter_284_2 in pairs(arg_281_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_284_2 then
							local var_284_11 = Mathf.Lerp(iter_284_2.color.r, 1, var_284_10)

							iter_284_2.color = Color.New(var_284_11, var_284_11, var_284_11)
						end
					end
				end
			end

			if arg_281_1.time_ >= var_284_8 + var_284_9 and arg_281_1.time_ < var_284_8 + var_284_9 + arg_284_0 and arg_281_1.var_.actorSpriteComps1056 then
				local var_284_12 = 1

				for iter_284_3, iter_284_4 in pairs(arg_281_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_284_4 then
						iter_284_4.color = Color.New(var_284_12, var_284_12, var_284_12)
					end
				end

				arg_281_1.var_.actorSpriteComps1056 = nil
			end

			local var_284_13 = arg_281_1.actors_["1060"]
			local var_284_14 = 0

			if var_284_14 < arg_281_1.time_ and arg_281_1.time_ <= var_284_14 + arg_284_0 and arg_281_1.var_.actorSpriteComps1060 == nil then
				arg_281_1.var_.actorSpriteComps1060 = var_284_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_284_15 = 0.034

			if var_284_14 <= arg_281_1.time_ and arg_281_1.time_ < var_284_14 + var_284_15 then
				local var_284_16 = (arg_281_1.time_ - var_284_14) / var_284_15

				if arg_281_1.var_.actorSpriteComps1060 then
					for iter_284_5, iter_284_6 in pairs(arg_281_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_284_6 then
							local var_284_17 = Mathf.Lerp(iter_284_6.color.r, 0.5, var_284_16)

							iter_284_6.color = Color.New(var_284_17, var_284_17, var_284_17)
						end
					end
				end
			end

			if arg_281_1.time_ >= var_284_14 + var_284_15 and arg_281_1.time_ < var_284_14 + var_284_15 + arg_284_0 and arg_281_1.var_.actorSpriteComps1060 then
				local var_284_18 = 0.5

				for iter_284_7, iter_284_8 in pairs(arg_281_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_284_8 then
						iter_284_8.color = Color.New(var_284_18, var_284_18, var_284_18)
					end
				end

				arg_281_1.var_.actorSpriteComps1060 = nil
			end

			local var_284_19 = 0
			local var_284_20 = 1.725

			if var_284_19 < arg_281_1.time_ and arg_281_1.time_ <= var_284_19 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_21 = arg_281_1:FormatText(StoryNameCfg[605].name)

				arg_281_1.leftNameTxt_.text = var_284_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_22 = arg_281_1:GetWordFromCfg(410021070)
				local var_284_23 = arg_281_1:FormatText(var_284_22.content)

				arg_281_1.text_.text = var_284_23

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_24 = 69
				local var_284_25 = utf8.len(var_284_23)
				local var_284_26 = var_284_24 <= 0 and var_284_20 or var_284_20 * (var_284_25 / var_284_24)

				if var_284_26 > 0 and var_284_20 < var_284_26 then
					arg_281_1.talkMaxDuration = var_284_26

					if var_284_26 + var_284_19 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_26 + var_284_19
					end
				end

				arg_281_1.text_.text = var_284_23
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021070", "story_v_out_410021.awb") ~= 0 then
					local var_284_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021070", "story_v_out_410021.awb") / 1000

					if var_284_27 + var_284_19 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_27 + var_284_19
					end

					if var_284_22.prefab_name ~= "" and arg_281_1.actors_[var_284_22.prefab_name] ~= nil then
						local var_284_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_22.prefab_name].transform, "story_v_out_410021", "410021070", "story_v_out_410021.awb")

						arg_281_1:RecordAudio("410021070", var_284_28)
						arg_281_1:RecordAudio("410021070", var_284_28)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_410021", "410021070", "story_v_out_410021.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_410021", "410021070", "story_v_out_410021.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_29 = math.max(var_284_20, arg_281_1.talkMaxDuration)

			if var_284_19 <= arg_281_1.time_ and arg_281_1.time_ < var_284_19 + var_284_29 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_19) / var_284_29

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_19 + var_284_29 and arg_281_1.time_ < var_284_19 + var_284_29 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play410021071 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 410021071
		arg_285_1.duration_ = 9.9

		local var_285_0 = {
			zh = 6,
			ja = 9.9
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
				arg_285_0:Play410021072(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["1056"].transform
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 then
				arg_285_1.var_.moveOldPos1056 = var_288_0.localPosition
				var_288_0.localScale = Vector3.New(1, 1, 1)

				arg_285_1:CheckSpriteTmpPos("1056", 4)

				local var_288_2 = var_288_0.childCount

				for iter_288_0 = 0, var_288_2 - 1 do
					local var_288_3 = var_288_0:GetChild(iter_288_0)

					if var_288_3.name == "split_2" or not string.find(var_288_3.name, "split") then
						var_288_3.gameObject:SetActive(true)
					else
						var_288_3.gameObject:SetActive(false)
					end
				end
			end

			local var_288_4 = 0.001

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_4 then
				local var_288_5 = (arg_285_1.time_ - var_288_1) / var_288_4
				local var_288_6 = Vector3.New(390, -350, -180)

				var_288_0.localPosition = Vector3.Lerp(arg_285_1.var_.moveOldPos1056, var_288_6, var_288_5)
			end

			if arg_285_1.time_ >= var_288_1 + var_288_4 and arg_285_1.time_ < var_288_1 + var_288_4 + arg_288_0 then
				var_288_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_288_7 = arg_285_1.actors_["1056"]
			local var_288_8 = 0

			if var_288_8 < arg_285_1.time_ and arg_285_1.time_ <= var_288_8 + arg_288_0 and arg_285_1.var_.actorSpriteComps1056 == nil then
				arg_285_1.var_.actorSpriteComps1056 = var_288_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_288_9 = 0.034

			if var_288_8 <= arg_285_1.time_ and arg_285_1.time_ < var_288_8 + var_288_9 then
				local var_288_10 = (arg_285_1.time_ - var_288_8) / var_288_9

				if arg_285_1.var_.actorSpriteComps1056 then
					for iter_288_1, iter_288_2 in pairs(arg_285_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_288_2 then
							local var_288_11 = Mathf.Lerp(iter_288_2.color.r, 1, var_288_10)

							iter_288_2.color = Color.New(var_288_11, var_288_11, var_288_11)
						end
					end
				end
			end

			if arg_285_1.time_ >= var_288_8 + var_288_9 and arg_285_1.time_ < var_288_8 + var_288_9 + arg_288_0 and arg_285_1.var_.actorSpriteComps1056 then
				local var_288_12 = 1

				for iter_288_3, iter_288_4 in pairs(arg_285_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_288_4 then
						iter_288_4.color = Color.New(var_288_12, var_288_12, var_288_12)
					end
				end

				arg_285_1.var_.actorSpriteComps1056 = nil
			end

			local var_288_13 = 0
			local var_288_14 = 0.9

			if var_288_13 < arg_285_1.time_ and arg_285_1.time_ <= var_288_13 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_15 = arg_285_1:FormatText(StoryNameCfg[605].name)

				arg_285_1.leftNameTxt_.text = var_288_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_16 = arg_285_1:GetWordFromCfg(410021071)
				local var_288_17 = arg_285_1:FormatText(var_288_16.content)

				arg_285_1.text_.text = var_288_17

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_18 = 36
				local var_288_19 = utf8.len(var_288_17)
				local var_288_20 = var_288_18 <= 0 and var_288_14 or var_288_14 * (var_288_19 / var_288_18)

				if var_288_20 > 0 and var_288_14 < var_288_20 then
					arg_285_1.talkMaxDuration = var_288_20

					if var_288_20 + var_288_13 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_20 + var_288_13
					end
				end

				arg_285_1.text_.text = var_288_17
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021071", "story_v_out_410021.awb") ~= 0 then
					local var_288_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021071", "story_v_out_410021.awb") / 1000

					if var_288_21 + var_288_13 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_21 + var_288_13
					end

					if var_288_16.prefab_name ~= "" and arg_285_1.actors_[var_288_16.prefab_name] ~= nil then
						local var_288_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_16.prefab_name].transform, "story_v_out_410021", "410021071", "story_v_out_410021.awb")

						arg_285_1:RecordAudio("410021071", var_288_22)
						arg_285_1:RecordAudio("410021071", var_288_22)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_410021", "410021071", "story_v_out_410021.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_410021", "410021071", "story_v_out_410021.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_23 = math.max(var_288_14, arg_285_1.talkMaxDuration)

			if var_288_13 <= arg_285_1.time_ and arg_285_1.time_ < var_288_13 + var_288_23 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_13) / var_288_23

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_13 + var_288_23 and arg_285_1.time_ < var_288_13 + var_288_23 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play410021072 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 410021072
		arg_289_1.duration_ = 7.8

		local var_289_0 = {
			zh = 2.466,
			ja = 7.8
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
				arg_289_0:Play410021073(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = arg_289_1.actors_["1060"].transform
			local var_292_1 = 0

			if var_292_1 < arg_289_1.time_ and arg_289_1.time_ <= var_292_1 + arg_292_0 then
				arg_289_1.var_.moveOldPos1060 = var_292_0.localPosition
				var_292_0.localScale = Vector3.New(1, 1, 1)

				arg_289_1:CheckSpriteTmpPos("1060", 2)

				local var_292_2 = var_292_0.childCount

				for iter_292_0 = 0, var_292_2 - 1 do
					local var_292_3 = var_292_0:GetChild(iter_292_0)

					if var_292_3.name == "split_3" or not string.find(var_292_3.name, "split") then
						var_292_3.gameObject:SetActive(true)
					else
						var_292_3.gameObject:SetActive(false)
					end
				end
			end

			local var_292_4 = 0.001

			if var_292_1 <= arg_289_1.time_ and arg_289_1.time_ < var_292_1 + var_292_4 then
				local var_292_5 = (arg_289_1.time_ - var_292_1) / var_292_4
				local var_292_6 = Vector3.New(-390, -435, -40)

				var_292_0.localPosition = Vector3.Lerp(arg_289_1.var_.moveOldPos1060, var_292_6, var_292_5)
			end

			if arg_289_1.time_ >= var_292_1 + var_292_4 and arg_289_1.time_ < var_292_1 + var_292_4 + arg_292_0 then
				var_292_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_292_7 = arg_289_1.actors_["1060"]
			local var_292_8 = 0

			if var_292_8 < arg_289_1.time_ and arg_289_1.time_ <= var_292_8 + arg_292_0 and arg_289_1.var_.actorSpriteComps1060 == nil then
				arg_289_1.var_.actorSpriteComps1060 = var_292_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_292_9 = 0.034

			if var_292_8 <= arg_289_1.time_ and arg_289_1.time_ < var_292_8 + var_292_9 then
				local var_292_10 = (arg_289_1.time_ - var_292_8) / var_292_9

				if arg_289_1.var_.actorSpriteComps1060 then
					for iter_292_1, iter_292_2 in pairs(arg_289_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_292_2 then
							local var_292_11 = Mathf.Lerp(iter_292_2.color.r, 1, var_292_10)

							iter_292_2.color = Color.New(var_292_11, var_292_11, var_292_11)
						end
					end
				end
			end

			if arg_289_1.time_ >= var_292_8 + var_292_9 and arg_289_1.time_ < var_292_8 + var_292_9 + arg_292_0 and arg_289_1.var_.actorSpriteComps1060 then
				local var_292_12 = 1

				for iter_292_3, iter_292_4 in pairs(arg_289_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_292_4 then
						iter_292_4.color = Color.New(var_292_12, var_292_12, var_292_12)
					end
				end

				arg_289_1.var_.actorSpriteComps1060 = nil
			end

			local var_292_13 = arg_289_1.actors_["1056"]
			local var_292_14 = 0

			if var_292_14 < arg_289_1.time_ and arg_289_1.time_ <= var_292_14 + arg_292_0 and arg_289_1.var_.actorSpriteComps1056 == nil then
				arg_289_1.var_.actorSpriteComps1056 = var_292_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_292_15 = 0.034

			if var_292_14 <= arg_289_1.time_ and arg_289_1.time_ < var_292_14 + var_292_15 then
				local var_292_16 = (arg_289_1.time_ - var_292_14) / var_292_15

				if arg_289_1.var_.actorSpriteComps1056 then
					for iter_292_5, iter_292_6 in pairs(arg_289_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_292_6 then
							local var_292_17 = Mathf.Lerp(iter_292_6.color.r, 0.5, var_292_16)

							iter_292_6.color = Color.New(var_292_17, var_292_17, var_292_17)
						end
					end
				end
			end

			if arg_289_1.time_ >= var_292_14 + var_292_15 and arg_289_1.time_ < var_292_14 + var_292_15 + arg_292_0 and arg_289_1.var_.actorSpriteComps1056 then
				local var_292_18 = 0.5

				for iter_292_7, iter_292_8 in pairs(arg_289_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_292_8 then
						iter_292_8.color = Color.New(var_292_18, var_292_18, var_292_18)
					end
				end

				arg_289_1.var_.actorSpriteComps1056 = nil
			end

			local var_292_19 = 0
			local var_292_20 = 0.325

			if var_292_19 < arg_289_1.time_ and arg_289_1.time_ <= var_292_19 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_21 = arg_289_1:FormatText(StoryNameCfg[584].name)

				arg_289_1.leftNameTxt_.text = var_292_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_22 = arg_289_1:GetWordFromCfg(410021072)
				local var_292_23 = arg_289_1:FormatText(var_292_22.content)

				arg_289_1.text_.text = var_292_23

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_24 = 13
				local var_292_25 = utf8.len(var_292_23)
				local var_292_26 = var_292_24 <= 0 and var_292_20 or var_292_20 * (var_292_25 / var_292_24)

				if var_292_26 > 0 and var_292_20 < var_292_26 then
					arg_289_1.talkMaxDuration = var_292_26

					if var_292_26 + var_292_19 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_26 + var_292_19
					end
				end

				arg_289_1.text_.text = var_292_23
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021072", "story_v_out_410021.awb") ~= 0 then
					local var_292_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021072", "story_v_out_410021.awb") / 1000

					if var_292_27 + var_292_19 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_27 + var_292_19
					end

					if var_292_22.prefab_name ~= "" and arg_289_1.actors_[var_292_22.prefab_name] ~= nil then
						local var_292_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_22.prefab_name].transform, "story_v_out_410021", "410021072", "story_v_out_410021.awb")

						arg_289_1:RecordAudio("410021072", var_292_28)
						arg_289_1:RecordAudio("410021072", var_292_28)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_410021", "410021072", "story_v_out_410021.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_410021", "410021072", "story_v_out_410021.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_29 = math.max(var_292_20, arg_289_1.talkMaxDuration)

			if var_292_19 <= arg_289_1.time_ and arg_289_1.time_ < var_292_19 + var_292_29 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_19) / var_292_29

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_19 + var_292_29 and arg_289_1.time_ < var_292_19 + var_292_29 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play410021073 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 410021073
		arg_293_1.duration_ = 5

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play410021074(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["1060"]
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 and arg_293_1.var_.actorSpriteComps1060 == nil then
				arg_293_1.var_.actorSpriteComps1060 = var_296_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_296_2 = 0.034

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_2 then
				local var_296_3 = (arg_293_1.time_ - var_296_1) / var_296_2

				if arg_293_1.var_.actorSpriteComps1060 then
					for iter_296_0, iter_296_1 in pairs(arg_293_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_296_1 then
							local var_296_4 = Mathf.Lerp(iter_296_1.color.r, 0.5, var_296_3)

							iter_296_1.color = Color.New(var_296_4, var_296_4, var_296_4)
						end
					end
				end
			end

			if arg_293_1.time_ >= var_296_1 + var_296_2 and arg_293_1.time_ < var_296_1 + var_296_2 + arg_296_0 and arg_293_1.var_.actorSpriteComps1060 then
				local var_296_5 = 0.5

				for iter_296_2, iter_296_3 in pairs(arg_293_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_296_3 then
						iter_296_3.color = Color.New(var_296_5, var_296_5, var_296_5)
					end
				end

				arg_293_1.var_.actorSpriteComps1060 = nil
			end

			local var_296_6 = 0
			local var_296_7 = 0.775

			if var_296_6 < arg_293_1.time_ and arg_293_1.time_ <= var_296_6 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, false)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_8 = arg_293_1:GetWordFromCfg(410021073)
				local var_296_9 = arg_293_1:FormatText(var_296_8.content)

				arg_293_1.text_.text = var_296_9

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_10 = 31
				local var_296_11 = utf8.len(var_296_9)
				local var_296_12 = var_296_10 <= 0 and var_296_7 or var_296_7 * (var_296_11 / var_296_10)

				if var_296_12 > 0 and var_296_7 < var_296_12 then
					arg_293_1.talkMaxDuration = var_296_12

					if var_296_12 + var_296_6 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_12 + var_296_6
					end
				end

				arg_293_1.text_.text = var_296_9
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)
				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_13 = math.max(var_296_7, arg_293_1.talkMaxDuration)

			if var_296_6 <= arg_293_1.time_ and arg_293_1.time_ < var_296_6 + var_296_13 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_6) / var_296_13

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_6 + var_296_13 and arg_293_1.time_ < var_296_6 + var_296_13 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play410021074 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 410021074
		arg_297_1.duration_ = 14.4

		local var_297_0 = {
			zh = 8.7,
			ja = 14.4
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
				arg_297_0:Play410021075(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = arg_297_1.actors_["1056"].transform
			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 then
				arg_297_1.var_.moveOldPos1056 = var_300_0.localPosition
				var_300_0.localScale = Vector3.New(1, 1, 1)

				arg_297_1:CheckSpriteTmpPos("1056", 4)

				local var_300_2 = var_300_0.childCount

				for iter_300_0 = 0, var_300_2 - 1 do
					local var_300_3 = var_300_0:GetChild(iter_300_0)

					if var_300_3.name == "split_3" or not string.find(var_300_3.name, "split") then
						var_300_3.gameObject:SetActive(true)
					else
						var_300_3.gameObject:SetActive(false)
					end
				end
			end

			local var_300_4 = 0.001

			if var_300_1 <= arg_297_1.time_ and arg_297_1.time_ < var_300_1 + var_300_4 then
				local var_300_5 = (arg_297_1.time_ - var_300_1) / var_300_4
				local var_300_6 = Vector3.New(390, -350, -180)

				var_300_0.localPosition = Vector3.Lerp(arg_297_1.var_.moveOldPos1056, var_300_6, var_300_5)
			end

			if arg_297_1.time_ >= var_300_1 + var_300_4 and arg_297_1.time_ < var_300_1 + var_300_4 + arg_300_0 then
				var_300_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_300_7 = arg_297_1.actors_["1056"]
			local var_300_8 = 0

			if var_300_8 < arg_297_1.time_ and arg_297_1.time_ <= var_300_8 + arg_300_0 and arg_297_1.var_.actorSpriteComps1056 == nil then
				arg_297_1.var_.actorSpriteComps1056 = var_300_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_300_9 = 0.034

			if var_300_8 <= arg_297_1.time_ and arg_297_1.time_ < var_300_8 + var_300_9 then
				local var_300_10 = (arg_297_1.time_ - var_300_8) / var_300_9

				if arg_297_1.var_.actorSpriteComps1056 then
					for iter_300_1, iter_300_2 in pairs(arg_297_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_300_2 then
							local var_300_11 = Mathf.Lerp(iter_300_2.color.r, 1, var_300_10)

							iter_300_2.color = Color.New(var_300_11, var_300_11, var_300_11)
						end
					end
				end
			end

			if arg_297_1.time_ >= var_300_8 + var_300_9 and arg_297_1.time_ < var_300_8 + var_300_9 + arg_300_0 and arg_297_1.var_.actorSpriteComps1056 then
				local var_300_12 = 1

				for iter_300_3, iter_300_4 in pairs(arg_297_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_300_4 then
						iter_300_4.color = Color.New(var_300_12, var_300_12, var_300_12)
					end
				end

				arg_297_1.var_.actorSpriteComps1056 = nil
			end

			local var_300_13 = 0
			local var_300_14 = 1.1

			if var_300_13 < arg_297_1.time_ and arg_297_1.time_ <= var_300_13 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_15 = arg_297_1:FormatText(StoryNameCfg[605].name)

				arg_297_1.leftNameTxt_.text = var_300_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_16 = arg_297_1:GetWordFromCfg(410021074)
				local var_300_17 = arg_297_1:FormatText(var_300_16.content)

				arg_297_1.text_.text = var_300_17

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_18 = 44
				local var_300_19 = utf8.len(var_300_17)
				local var_300_20 = var_300_18 <= 0 and var_300_14 or var_300_14 * (var_300_19 / var_300_18)

				if var_300_20 > 0 and var_300_14 < var_300_20 then
					arg_297_1.talkMaxDuration = var_300_20

					if var_300_20 + var_300_13 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_20 + var_300_13
					end
				end

				arg_297_1.text_.text = var_300_17
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021074", "story_v_out_410021.awb") ~= 0 then
					local var_300_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021074", "story_v_out_410021.awb") / 1000

					if var_300_21 + var_300_13 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_21 + var_300_13
					end

					if var_300_16.prefab_name ~= "" and arg_297_1.actors_[var_300_16.prefab_name] ~= nil then
						local var_300_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_16.prefab_name].transform, "story_v_out_410021", "410021074", "story_v_out_410021.awb")

						arg_297_1:RecordAudio("410021074", var_300_22)
						arg_297_1:RecordAudio("410021074", var_300_22)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_410021", "410021074", "story_v_out_410021.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_410021", "410021074", "story_v_out_410021.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_23 = math.max(var_300_14, arg_297_1.talkMaxDuration)

			if var_300_13 <= arg_297_1.time_ and arg_297_1.time_ < var_300_13 + var_300_23 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_13) / var_300_23

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_13 + var_300_23 and arg_297_1.time_ < var_300_13 + var_300_23 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play410021075 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 410021075
		arg_301_1.duration_ = 13.1

		local var_301_0 = {
			zh = 11.8,
			ja = 13.1
		}
		local var_301_1 = manager.audio:GetLocalizationFlag()

		if var_301_0[var_301_1] ~= nil then
			arg_301_1.duration_ = var_301_0[var_301_1]
		end

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play410021076(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["1056"].transform
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 then
				arg_301_1.var_.moveOldPos1056 = var_304_0.localPosition
				var_304_0.localScale = Vector3.New(1, 1, 1)

				arg_301_1:CheckSpriteTmpPos("1056", 4)

				local var_304_2 = var_304_0.childCount

				for iter_304_0 = 0, var_304_2 - 1 do
					local var_304_3 = var_304_0:GetChild(iter_304_0)

					if var_304_3.name == "split_3" or not string.find(var_304_3.name, "split") then
						var_304_3.gameObject:SetActive(true)
					else
						var_304_3.gameObject:SetActive(false)
					end
				end
			end

			local var_304_4 = 0.001

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_4 then
				local var_304_5 = (arg_301_1.time_ - var_304_1) / var_304_4
				local var_304_6 = Vector3.New(390, -350, -180)

				var_304_0.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos1056, var_304_6, var_304_5)
			end

			if arg_301_1.time_ >= var_304_1 + var_304_4 and arg_301_1.time_ < var_304_1 + var_304_4 + arg_304_0 then
				var_304_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_304_7 = arg_301_1.actors_["1056"]
			local var_304_8 = 0

			if var_304_8 < arg_301_1.time_ and arg_301_1.time_ <= var_304_8 + arg_304_0 and arg_301_1.var_.actorSpriteComps1056 == nil then
				arg_301_1.var_.actorSpriteComps1056 = var_304_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_304_9 = 0.034

			if var_304_8 <= arg_301_1.time_ and arg_301_1.time_ < var_304_8 + var_304_9 then
				local var_304_10 = (arg_301_1.time_ - var_304_8) / var_304_9

				if arg_301_1.var_.actorSpriteComps1056 then
					for iter_304_1, iter_304_2 in pairs(arg_301_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_304_2 then
							local var_304_11 = Mathf.Lerp(iter_304_2.color.r, 1, var_304_10)

							iter_304_2.color = Color.New(var_304_11, var_304_11, var_304_11)
						end
					end
				end
			end

			if arg_301_1.time_ >= var_304_8 + var_304_9 and arg_301_1.time_ < var_304_8 + var_304_9 + arg_304_0 and arg_301_1.var_.actorSpriteComps1056 then
				local var_304_12 = 1

				for iter_304_3, iter_304_4 in pairs(arg_301_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_304_4 then
						iter_304_4.color = Color.New(var_304_12, var_304_12, var_304_12)
					end
				end

				arg_301_1.var_.actorSpriteComps1056 = nil
			end

			local var_304_13 = 0
			local var_304_14 = 1.375

			if var_304_13 < arg_301_1.time_ and arg_301_1.time_ <= var_304_13 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_15 = arg_301_1:FormatText(StoryNameCfg[605].name)

				arg_301_1.leftNameTxt_.text = var_304_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_16 = arg_301_1:GetWordFromCfg(410021075)
				local var_304_17 = arg_301_1:FormatText(var_304_16.content)

				arg_301_1.text_.text = var_304_17

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_18 = 55
				local var_304_19 = utf8.len(var_304_17)
				local var_304_20 = var_304_18 <= 0 and var_304_14 or var_304_14 * (var_304_19 / var_304_18)

				if var_304_20 > 0 and var_304_14 < var_304_20 then
					arg_301_1.talkMaxDuration = var_304_20

					if var_304_20 + var_304_13 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_20 + var_304_13
					end
				end

				arg_301_1.text_.text = var_304_17
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021075", "story_v_out_410021.awb") ~= 0 then
					local var_304_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021075", "story_v_out_410021.awb") / 1000

					if var_304_21 + var_304_13 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_21 + var_304_13
					end

					if var_304_16.prefab_name ~= "" and arg_301_1.actors_[var_304_16.prefab_name] ~= nil then
						local var_304_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_16.prefab_name].transform, "story_v_out_410021", "410021075", "story_v_out_410021.awb")

						arg_301_1:RecordAudio("410021075", var_304_22)
						arg_301_1:RecordAudio("410021075", var_304_22)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_410021", "410021075", "story_v_out_410021.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_410021", "410021075", "story_v_out_410021.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_23 = math.max(var_304_14, arg_301_1.talkMaxDuration)

			if var_304_13 <= arg_301_1.time_ and arg_301_1.time_ < var_304_13 + var_304_23 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_13) / var_304_23

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_13 + var_304_23 and arg_301_1.time_ < var_304_13 + var_304_23 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play410021076 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 410021076
		arg_305_1.duration_ = 6.8

		local var_305_0 = {
			zh = 6.133,
			ja = 6.8
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
				arg_305_0:Play410021077(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["1060"].transform
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 then
				arg_305_1.var_.moveOldPos1060 = var_308_0.localPosition
				var_308_0.localScale = Vector3.New(1, 1, 1)

				arg_305_1:CheckSpriteTmpPos("1060", 2)

				local var_308_2 = var_308_0.childCount

				for iter_308_0 = 0, var_308_2 - 1 do
					local var_308_3 = var_308_0:GetChild(iter_308_0)

					if var_308_3.name == "split_4" or not string.find(var_308_3.name, "split") then
						var_308_3.gameObject:SetActive(true)
					else
						var_308_3.gameObject:SetActive(false)
					end
				end
			end

			local var_308_4 = 0.001

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_4 then
				local var_308_5 = (arg_305_1.time_ - var_308_1) / var_308_4
				local var_308_6 = Vector3.New(-390, -435, -40)

				var_308_0.localPosition = Vector3.Lerp(arg_305_1.var_.moveOldPos1060, var_308_6, var_308_5)
			end

			if arg_305_1.time_ >= var_308_1 + var_308_4 and arg_305_1.time_ < var_308_1 + var_308_4 + arg_308_0 then
				var_308_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_308_7 = arg_305_1.actors_["1060"]
			local var_308_8 = 0

			if var_308_8 < arg_305_1.time_ and arg_305_1.time_ <= var_308_8 + arg_308_0 and arg_305_1.var_.actorSpriteComps1060 == nil then
				arg_305_1.var_.actorSpriteComps1060 = var_308_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_308_9 = 0.034

			if var_308_8 <= arg_305_1.time_ and arg_305_1.time_ < var_308_8 + var_308_9 then
				local var_308_10 = (arg_305_1.time_ - var_308_8) / var_308_9

				if arg_305_1.var_.actorSpriteComps1060 then
					for iter_308_1, iter_308_2 in pairs(arg_305_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_308_2 then
							local var_308_11 = Mathf.Lerp(iter_308_2.color.r, 1, var_308_10)

							iter_308_2.color = Color.New(var_308_11, var_308_11, var_308_11)
						end
					end
				end
			end

			if arg_305_1.time_ >= var_308_8 + var_308_9 and arg_305_1.time_ < var_308_8 + var_308_9 + arg_308_0 and arg_305_1.var_.actorSpriteComps1060 then
				local var_308_12 = 1

				for iter_308_3, iter_308_4 in pairs(arg_305_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_308_4 then
						iter_308_4.color = Color.New(var_308_12, var_308_12, var_308_12)
					end
				end

				arg_305_1.var_.actorSpriteComps1060 = nil
			end

			local var_308_13 = arg_305_1.actors_["1056"]
			local var_308_14 = 0

			if var_308_14 < arg_305_1.time_ and arg_305_1.time_ <= var_308_14 + arg_308_0 and arg_305_1.var_.actorSpriteComps1056 == nil then
				arg_305_1.var_.actorSpriteComps1056 = var_308_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_308_15 = 0.034

			if var_308_14 <= arg_305_1.time_ and arg_305_1.time_ < var_308_14 + var_308_15 then
				local var_308_16 = (arg_305_1.time_ - var_308_14) / var_308_15

				if arg_305_1.var_.actorSpriteComps1056 then
					for iter_308_5, iter_308_6 in pairs(arg_305_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_308_6 then
							local var_308_17 = Mathf.Lerp(iter_308_6.color.r, 0.5, var_308_16)

							iter_308_6.color = Color.New(var_308_17, var_308_17, var_308_17)
						end
					end
				end
			end

			if arg_305_1.time_ >= var_308_14 + var_308_15 and arg_305_1.time_ < var_308_14 + var_308_15 + arg_308_0 and arg_305_1.var_.actorSpriteComps1056 then
				local var_308_18 = 0.5

				for iter_308_7, iter_308_8 in pairs(arg_305_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_308_8 then
						iter_308_8.color = Color.New(var_308_18, var_308_18, var_308_18)
					end
				end

				arg_305_1.var_.actorSpriteComps1056 = nil
			end

			local var_308_19 = 0
			local var_308_20 = 0.375

			if var_308_19 < arg_305_1.time_ and arg_305_1.time_ <= var_308_19 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_21 = arg_305_1:FormatText(StoryNameCfg[584].name)

				arg_305_1.leftNameTxt_.text = var_308_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_22 = arg_305_1:GetWordFromCfg(410021076)
				local var_308_23 = arg_305_1:FormatText(var_308_22.content)

				arg_305_1.text_.text = var_308_23

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_24 = 15
				local var_308_25 = utf8.len(var_308_23)
				local var_308_26 = var_308_24 <= 0 and var_308_20 or var_308_20 * (var_308_25 / var_308_24)

				if var_308_26 > 0 and var_308_20 < var_308_26 then
					arg_305_1.talkMaxDuration = var_308_26

					if var_308_26 + var_308_19 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_26 + var_308_19
					end
				end

				arg_305_1.text_.text = var_308_23
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021076", "story_v_out_410021.awb") ~= 0 then
					local var_308_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021076", "story_v_out_410021.awb") / 1000

					if var_308_27 + var_308_19 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_27 + var_308_19
					end

					if var_308_22.prefab_name ~= "" and arg_305_1.actors_[var_308_22.prefab_name] ~= nil then
						local var_308_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_22.prefab_name].transform, "story_v_out_410021", "410021076", "story_v_out_410021.awb")

						arg_305_1:RecordAudio("410021076", var_308_28)
						arg_305_1:RecordAudio("410021076", var_308_28)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_410021", "410021076", "story_v_out_410021.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_410021", "410021076", "story_v_out_410021.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_29 = math.max(var_308_20, arg_305_1.talkMaxDuration)

			if var_308_19 <= arg_305_1.time_ and arg_305_1.time_ < var_308_19 + var_308_29 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_19) / var_308_29

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_19 + var_308_29 and arg_305_1.time_ < var_308_19 + var_308_29 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play410021077 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 410021077
		arg_309_1.duration_ = 8.966

		local var_309_0 = {
			zh = 8.9,
			ja = 8.966
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
				arg_309_0:Play410021078(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1056"].transform
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 then
				arg_309_1.var_.moveOldPos1056 = var_312_0.localPosition
				var_312_0.localScale = Vector3.New(1, 1, 1)

				arg_309_1:CheckSpriteTmpPos("1056", 4)

				local var_312_2 = var_312_0.childCount

				for iter_312_0 = 0, var_312_2 - 1 do
					local var_312_3 = var_312_0:GetChild(iter_312_0)

					if var_312_3.name == "split_3" or not string.find(var_312_3.name, "split") then
						var_312_3.gameObject:SetActive(true)
					else
						var_312_3.gameObject:SetActive(false)
					end
				end
			end

			local var_312_4 = 0.001

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_4 then
				local var_312_5 = (arg_309_1.time_ - var_312_1) / var_312_4
				local var_312_6 = Vector3.New(390, -350, -180)

				var_312_0.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1056, var_312_6, var_312_5)
			end

			if arg_309_1.time_ >= var_312_1 + var_312_4 and arg_309_1.time_ < var_312_1 + var_312_4 + arg_312_0 then
				var_312_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_312_7 = arg_309_1.actors_["1056"]
			local var_312_8 = 0

			if var_312_8 < arg_309_1.time_ and arg_309_1.time_ <= var_312_8 + arg_312_0 and arg_309_1.var_.actorSpriteComps1056 == nil then
				arg_309_1.var_.actorSpriteComps1056 = var_312_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_312_9 = 0.034

			if var_312_8 <= arg_309_1.time_ and arg_309_1.time_ < var_312_8 + var_312_9 then
				local var_312_10 = (arg_309_1.time_ - var_312_8) / var_312_9

				if arg_309_1.var_.actorSpriteComps1056 then
					for iter_312_1, iter_312_2 in pairs(arg_309_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_312_2 then
							local var_312_11 = Mathf.Lerp(iter_312_2.color.r, 1, var_312_10)

							iter_312_2.color = Color.New(var_312_11, var_312_11, var_312_11)
						end
					end
				end
			end

			if arg_309_1.time_ >= var_312_8 + var_312_9 and arg_309_1.time_ < var_312_8 + var_312_9 + arg_312_0 and arg_309_1.var_.actorSpriteComps1056 then
				local var_312_12 = 1

				for iter_312_3, iter_312_4 in pairs(arg_309_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_312_4 then
						iter_312_4.color = Color.New(var_312_12, var_312_12, var_312_12)
					end
				end

				arg_309_1.var_.actorSpriteComps1056 = nil
			end

			local var_312_13 = arg_309_1.actors_["1060"]
			local var_312_14 = 0

			if var_312_14 < arg_309_1.time_ and arg_309_1.time_ <= var_312_14 + arg_312_0 and arg_309_1.var_.actorSpriteComps1060 == nil then
				arg_309_1.var_.actorSpriteComps1060 = var_312_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_312_15 = 0.034

			if var_312_14 <= arg_309_1.time_ and arg_309_1.time_ < var_312_14 + var_312_15 then
				local var_312_16 = (arg_309_1.time_ - var_312_14) / var_312_15

				if arg_309_1.var_.actorSpriteComps1060 then
					for iter_312_5, iter_312_6 in pairs(arg_309_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_312_6 then
							local var_312_17 = Mathf.Lerp(iter_312_6.color.r, 0.5, var_312_16)

							iter_312_6.color = Color.New(var_312_17, var_312_17, var_312_17)
						end
					end
				end
			end

			if arg_309_1.time_ >= var_312_14 + var_312_15 and arg_309_1.time_ < var_312_14 + var_312_15 + arg_312_0 and arg_309_1.var_.actorSpriteComps1060 then
				local var_312_18 = 0.5

				for iter_312_7, iter_312_8 in pairs(arg_309_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_312_8 then
						iter_312_8.color = Color.New(var_312_18, var_312_18, var_312_18)
					end
				end

				arg_309_1.var_.actorSpriteComps1060 = nil
			end

			local var_312_19 = 0
			local var_312_20 = 1.175

			if var_312_19 < arg_309_1.time_ and arg_309_1.time_ <= var_312_19 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_21 = arg_309_1:FormatText(StoryNameCfg[605].name)

				arg_309_1.leftNameTxt_.text = var_312_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_22 = arg_309_1:GetWordFromCfg(410021077)
				local var_312_23 = arg_309_1:FormatText(var_312_22.content)

				arg_309_1.text_.text = var_312_23

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_24 = 47
				local var_312_25 = utf8.len(var_312_23)
				local var_312_26 = var_312_24 <= 0 and var_312_20 or var_312_20 * (var_312_25 / var_312_24)

				if var_312_26 > 0 and var_312_20 < var_312_26 then
					arg_309_1.talkMaxDuration = var_312_26

					if var_312_26 + var_312_19 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_26 + var_312_19
					end
				end

				arg_309_1.text_.text = var_312_23
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021077", "story_v_out_410021.awb") ~= 0 then
					local var_312_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021077", "story_v_out_410021.awb") / 1000

					if var_312_27 + var_312_19 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_27 + var_312_19
					end

					if var_312_22.prefab_name ~= "" and arg_309_1.actors_[var_312_22.prefab_name] ~= nil then
						local var_312_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_22.prefab_name].transform, "story_v_out_410021", "410021077", "story_v_out_410021.awb")

						arg_309_1:RecordAudio("410021077", var_312_28)
						arg_309_1:RecordAudio("410021077", var_312_28)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_410021", "410021077", "story_v_out_410021.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_410021", "410021077", "story_v_out_410021.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_29 = math.max(var_312_20, arg_309_1.talkMaxDuration)

			if var_312_19 <= arg_309_1.time_ and arg_309_1.time_ < var_312_19 + var_312_29 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_19) / var_312_29

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_19 + var_312_29 and arg_309_1.time_ < var_312_19 + var_312_29 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play410021078 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 410021078
		arg_313_1.duration_ = 5.8

		local var_313_0 = {
			zh = 4.966,
			ja = 5.8
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
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play410021079(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["1056"].transform
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 then
				arg_313_1.var_.moveOldPos1056 = var_316_0.localPosition
				var_316_0.localScale = Vector3.New(1, 1, 1)

				arg_313_1:CheckSpriteTmpPos("1056", 4)

				local var_316_2 = var_316_0.childCount

				for iter_316_0 = 0, var_316_2 - 1 do
					local var_316_3 = var_316_0:GetChild(iter_316_0)

					if var_316_3.name == "split_3" or not string.find(var_316_3.name, "split") then
						var_316_3.gameObject:SetActive(true)
					else
						var_316_3.gameObject:SetActive(false)
					end
				end
			end

			local var_316_4 = 0.001

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_4 then
				local var_316_5 = (arg_313_1.time_ - var_316_1) / var_316_4
				local var_316_6 = Vector3.New(390, -350, -180)

				var_316_0.localPosition = Vector3.Lerp(arg_313_1.var_.moveOldPos1056, var_316_6, var_316_5)
			end

			if arg_313_1.time_ >= var_316_1 + var_316_4 and arg_313_1.time_ < var_316_1 + var_316_4 + arg_316_0 then
				var_316_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_316_7 = arg_313_1.actors_["1056"]
			local var_316_8 = 0

			if var_316_8 < arg_313_1.time_ and arg_313_1.time_ <= var_316_8 + arg_316_0 and arg_313_1.var_.actorSpriteComps1056 == nil then
				arg_313_1.var_.actorSpriteComps1056 = var_316_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_316_9 = 0.034

			if var_316_8 <= arg_313_1.time_ and arg_313_1.time_ < var_316_8 + var_316_9 then
				local var_316_10 = (arg_313_1.time_ - var_316_8) / var_316_9

				if arg_313_1.var_.actorSpriteComps1056 then
					for iter_316_1, iter_316_2 in pairs(arg_313_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_316_2 then
							local var_316_11 = Mathf.Lerp(iter_316_2.color.r, 1, var_316_10)

							iter_316_2.color = Color.New(var_316_11, var_316_11, var_316_11)
						end
					end
				end
			end

			if arg_313_1.time_ >= var_316_8 + var_316_9 and arg_313_1.time_ < var_316_8 + var_316_9 + arg_316_0 and arg_313_1.var_.actorSpriteComps1056 then
				local var_316_12 = 1

				for iter_316_3, iter_316_4 in pairs(arg_313_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_316_4 then
						iter_316_4.color = Color.New(var_316_12, var_316_12, var_316_12)
					end
				end

				arg_313_1.var_.actorSpriteComps1056 = nil
			end

			local var_316_13 = 0
			local var_316_14 = 0.675

			if var_316_13 < arg_313_1.time_ and arg_313_1.time_ <= var_316_13 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_15 = arg_313_1:FormatText(StoryNameCfg[605].name)

				arg_313_1.leftNameTxt_.text = var_316_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_16 = arg_313_1:GetWordFromCfg(410021078)
				local var_316_17 = arg_313_1:FormatText(var_316_16.content)

				arg_313_1.text_.text = var_316_17

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_18 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021078", "story_v_out_410021.awb") ~= 0 then
					local var_316_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021078", "story_v_out_410021.awb") / 1000

					if var_316_21 + var_316_13 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_21 + var_316_13
					end

					if var_316_16.prefab_name ~= "" and arg_313_1.actors_[var_316_16.prefab_name] ~= nil then
						local var_316_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_16.prefab_name].transform, "story_v_out_410021", "410021078", "story_v_out_410021.awb")

						arg_313_1:RecordAudio("410021078", var_316_22)
						arg_313_1:RecordAudio("410021078", var_316_22)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_410021", "410021078", "story_v_out_410021.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_410021", "410021078", "story_v_out_410021.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_23 = math.max(var_316_14, arg_313_1.talkMaxDuration)

			if var_316_13 <= arg_313_1.time_ and arg_313_1.time_ < var_316_13 + var_316_23 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_13) / var_316_23

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_13 + var_316_23 and arg_313_1.time_ < var_316_13 + var_316_23 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play410021079 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 410021079
		arg_317_1.duration_ = 5

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play410021080(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["1056"]
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 and arg_317_1.var_.actorSpriteComps1056 == nil then
				arg_317_1.var_.actorSpriteComps1056 = var_320_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_320_2 = 0.034

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2

				if arg_317_1.var_.actorSpriteComps1056 then
					for iter_320_0, iter_320_1 in pairs(arg_317_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_320_1 then
							local var_320_4 = Mathf.Lerp(iter_320_1.color.r, 0.5, var_320_3)

							iter_320_1.color = Color.New(var_320_4, var_320_4, var_320_4)
						end
					end
				end
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 and arg_317_1.var_.actorSpriteComps1056 then
				local var_320_5 = 0.5

				for iter_320_2, iter_320_3 in pairs(arg_317_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_320_3 then
						iter_320_3.color = Color.New(var_320_5, var_320_5, var_320_5)
					end
				end

				arg_317_1.var_.actorSpriteComps1056 = nil
			end

			local var_320_6 = 0
			local var_320_7 = 0.625

			if var_320_6 < arg_317_1.time_ and arg_317_1.time_ <= var_320_6 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, false)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_8 = arg_317_1:GetWordFromCfg(410021079)
				local var_320_9 = arg_317_1:FormatText(var_320_8.content)

				arg_317_1.text_.text = var_320_9

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_10 = 25
				local var_320_11 = utf8.len(var_320_9)
				local var_320_12 = var_320_10 <= 0 and var_320_7 or var_320_7 * (var_320_11 / var_320_10)

				if var_320_12 > 0 and var_320_7 < var_320_12 then
					arg_317_1.talkMaxDuration = var_320_12

					if var_320_12 + var_320_6 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_12 + var_320_6
					end
				end

				arg_317_1.text_.text = var_320_9
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)
				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_13 = math.max(var_320_7, arg_317_1.talkMaxDuration)

			if var_320_6 <= arg_317_1.time_ and arg_317_1.time_ < var_320_6 + var_320_13 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_6) / var_320_13

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_6 + var_320_13 and arg_317_1.time_ < var_320_6 + var_320_13 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play410021080 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 410021080
		arg_321_1.duration_ = 5

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play410021081(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = 0
			local var_324_1 = 1.575

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

				local var_324_2 = arg_321_1:GetWordFromCfg(410021080)
				local var_324_3 = arg_321_1:FormatText(var_324_2.content)

				arg_321_1.text_.text = var_324_3

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_4 = 63
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
	Play410021081 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 410021081
		arg_325_1.duration_ = 5

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play410021082(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0
			local var_328_1 = 1.675

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, false)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_2 = arg_325_1:GetWordFromCfg(410021081)
				local var_328_3 = arg_325_1:FormatText(var_328_2.content)

				arg_325_1.text_.text = var_328_3

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_4 = 67
				local var_328_5 = utf8.len(var_328_3)
				local var_328_6 = var_328_4 <= 0 and var_328_1 or var_328_1 * (var_328_5 / var_328_4)

				if var_328_6 > 0 and var_328_1 < var_328_6 then
					arg_325_1.talkMaxDuration = var_328_6

					if var_328_6 + var_328_0 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_6 + var_328_0
					end
				end

				arg_325_1.text_.text = var_328_3
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)
				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_7 = math.max(var_328_1, arg_325_1.talkMaxDuration)

			if var_328_0 <= arg_325_1.time_ and arg_325_1.time_ < var_328_0 + var_328_7 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_0) / var_328_7

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_0 + var_328_7 and arg_325_1.time_ < var_328_0 + var_328_7 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play410021082 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 410021082
		arg_329_1.duration_ = 5

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play410021083(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = 0
			local var_332_1 = 1.625

			if var_332_0 < arg_329_1.time_ and arg_329_1.time_ <= var_332_0 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, false)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_2 = arg_329_1:GetWordFromCfg(410021082)
				local var_332_3 = arg_329_1:FormatText(var_332_2.content)

				arg_329_1.text_.text = var_332_3

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_4 = 65
				local var_332_5 = utf8.len(var_332_3)
				local var_332_6 = var_332_4 <= 0 and var_332_1 or var_332_1 * (var_332_5 / var_332_4)

				if var_332_6 > 0 and var_332_1 < var_332_6 then
					arg_329_1.talkMaxDuration = var_332_6

					if var_332_6 + var_332_0 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_6 + var_332_0
					end
				end

				arg_329_1.text_.text = var_332_3
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)
				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_7 = math.max(var_332_1, arg_329_1.talkMaxDuration)

			if var_332_0 <= arg_329_1.time_ and arg_329_1.time_ < var_332_0 + var_332_7 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_0) / var_332_7

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_0 + var_332_7 and arg_329_1.time_ < var_332_0 + var_332_7 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play410021083 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 410021083
		arg_333_1.duration_ = 5

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play410021084(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = 0
			local var_336_1 = 0.825

			if var_336_0 < arg_333_1.time_ and arg_333_1.time_ <= var_336_0 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, false)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_2 = arg_333_1:GetWordFromCfg(410021083)
				local var_336_3 = arg_333_1:FormatText(var_336_2.content)

				arg_333_1.text_.text = var_336_3

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_4 = 33
				local var_336_5 = utf8.len(var_336_3)
				local var_336_6 = var_336_4 <= 0 and var_336_1 or var_336_1 * (var_336_5 / var_336_4)

				if var_336_6 > 0 and var_336_1 < var_336_6 then
					arg_333_1.talkMaxDuration = var_336_6

					if var_336_6 + var_336_0 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_6 + var_336_0
					end
				end

				arg_333_1.text_.text = var_336_3
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)
				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_7 = math.max(var_336_1, arg_333_1.talkMaxDuration)

			if var_336_0 <= arg_333_1.time_ and arg_333_1.time_ < var_336_0 + var_336_7 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_0) / var_336_7

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_0 + var_336_7 and arg_333_1.time_ < var_336_0 + var_336_7 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play410021084 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 410021084
		arg_337_1.duration_ = 11.5

		local var_337_0 = {
			zh = 4.133,
			ja = 11.5
		}
		local var_337_1 = manager.audio:GetLocalizationFlag()

		if var_337_0[var_337_1] ~= nil then
			arg_337_1.duration_ = var_337_0[var_337_1]
		end

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play410021085(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["1060"].transform
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 then
				arg_337_1.var_.moveOldPos1060 = var_340_0.localPosition
				var_340_0.localScale = Vector3.New(1, 1, 1)

				arg_337_1:CheckSpriteTmpPos("1060", 2)

				local var_340_2 = var_340_0.childCount

				for iter_340_0 = 0, var_340_2 - 1 do
					local var_340_3 = var_340_0:GetChild(iter_340_0)

					if var_340_3.name == "" or not string.find(var_340_3.name, "split") then
						var_340_3.gameObject:SetActive(true)
					else
						var_340_3.gameObject:SetActive(false)
					end
				end
			end

			local var_340_4 = 0.001

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_4 then
				local var_340_5 = (arg_337_1.time_ - var_340_1) / var_340_4
				local var_340_6 = Vector3.New(-390, -435, -40)

				var_340_0.localPosition = Vector3.Lerp(arg_337_1.var_.moveOldPos1060, var_340_6, var_340_5)
			end

			if arg_337_1.time_ >= var_340_1 + var_340_4 and arg_337_1.time_ < var_340_1 + var_340_4 + arg_340_0 then
				var_340_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_340_7 = arg_337_1.actors_["1060"]
			local var_340_8 = 0

			if var_340_8 < arg_337_1.time_ and arg_337_1.time_ <= var_340_8 + arg_340_0 and arg_337_1.var_.actorSpriteComps1060 == nil then
				arg_337_1.var_.actorSpriteComps1060 = var_340_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_340_9 = 0.034

			if var_340_8 <= arg_337_1.time_ and arg_337_1.time_ < var_340_8 + var_340_9 then
				local var_340_10 = (arg_337_1.time_ - var_340_8) / var_340_9

				if arg_337_1.var_.actorSpriteComps1060 then
					for iter_340_1, iter_340_2 in pairs(arg_337_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_340_2 then
							local var_340_11 = Mathf.Lerp(iter_340_2.color.r, 1, var_340_10)

							iter_340_2.color = Color.New(var_340_11, var_340_11, var_340_11)
						end
					end
				end
			end

			if arg_337_1.time_ >= var_340_8 + var_340_9 and arg_337_1.time_ < var_340_8 + var_340_9 + arg_340_0 and arg_337_1.var_.actorSpriteComps1060 then
				local var_340_12 = 1

				for iter_340_3, iter_340_4 in pairs(arg_337_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_340_4 then
						iter_340_4.color = Color.New(var_340_12, var_340_12, var_340_12)
					end
				end

				arg_337_1.var_.actorSpriteComps1060 = nil
			end

			local var_340_13 = 0
			local var_340_14 = 0.375

			if var_340_13 < arg_337_1.time_ and arg_337_1.time_ <= var_340_13 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_15 = arg_337_1:FormatText(StoryNameCfg[584].name)

				arg_337_1.leftNameTxt_.text = var_340_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_16 = arg_337_1:GetWordFromCfg(410021084)
				local var_340_17 = arg_337_1:FormatText(var_340_16.content)

				arg_337_1.text_.text = var_340_17

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_18 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021084", "story_v_out_410021.awb") ~= 0 then
					local var_340_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021084", "story_v_out_410021.awb") / 1000

					if var_340_21 + var_340_13 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_21 + var_340_13
					end

					if var_340_16.prefab_name ~= "" and arg_337_1.actors_[var_340_16.prefab_name] ~= nil then
						local var_340_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_16.prefab_name].transform, "story_v_out_410021", "410021084", "story_v_out_410021.awb")

						arg_337_1:RecordAudio("410021084", var_340_22)
						arg_337_1:RecordAudio("410021084", var_340_22)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_410021", "410021084", "story_v_out_410021.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_410021", "410021084", "story_v_out_410021.awb")
				end

				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_23 = math.max(var_340_14, arg_337_1.talkMaxDuration)

			if var_340_13 <= arg_337_1.time_ and arg_337_1.time_ < var_340_13 + var_340_23 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_13) / var_340_23

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_13 + var_340_23 and arg_337_1.time_ < var_340_13 + var_340_23 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play410021085 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 410021085
		arg_341_1.duration_ = 6.033

		local var_341_0 = {
			zh = 3,
			ja = 6.033
		}
		local var_341_1 = manager.audio:GetLocalizationFlag()

		if var_341_0[var_341_1] ~= nil then
			arg_341_1.duration_ = var_341_0[var_341_1]
		end

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play410021086(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1056"].transform
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 then
				arg_341_1.var_.moveOldPos1056 = var_344_0.localPosition
				var_344_0.localScale = Vector3.New(1, 1, 1)

				arg_341_1:CheckSpriteTmpPos("1056", 4)

				local var_344_2 = var_344_0.childCount

				for iter_344_0 = 0, var_344_2 - 1 do
					local var_344_3 = var_344_0:GetChild(iter_344_0)

					if var_344_3.name == "split_4" or not string.find(var_344_3.name, "split") then
						var_344_3.gameObject:SetActive(true)
					else
						var_344_3.gameObject:SetActive(false)
					end
				end
			end

			local var_344_4 = 0.001

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_4 then
				local var_344_5 = (arg_341_1.time_ - var_344_1) / var_344_4
				local var_344_6 = Vector3.New(390, -350, -180)

				var_344_0.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPos1056, var_344_6, var_344_5)
			end

			if arg_341_1.time_ >= var_344_1 + var_344_4 and arg_341_1.time_ < var_344_1 + var_344_4 + arg_344_0 then
				var_344_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_344_7 = arg_341_1.actors_["1056"]
			local var_344_8 = 0

			if var_344_8 < arg_341_1.time_ and arg_341_1.time_ <= var_344_8 + arg_344_0 and arg_341_1.var_.actorSpriteComps1056 == nil then
				arg_341_1.var_.actorSpriteComps1056 = var_344_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_344_9 = 0.034

			if var_344_8 <= arg_341_1.time_ and arg_341_1.time_ < var_344_8 + var_344_9 then
				local var_344_10 = (arg_341_1.time_ - var_344_8) / var_344_9

				if arg_341_1.var_.actorSpriteComps1056 then
					for iter_344_1, iter_344_2 in pairs(arg_341_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_344_2 then
							local var_344_11 = Mathf.Lerp(iter_344_2.color.r, 1, var_344_10)

							iter_344_2.color = Color.New(var_344_11, var_344_11, var_344_11)
						end
					end
				end
			end

			if arg_341_1.time_ >= var_344_8 + var_344_9 and arg_341_1.time_ < var_344_8 + var_344_9 + arg_344_0 and arg_341_1.var_.actorSpriteComps1056 then
				local var_344_12 = 1

				for iter_344_3, iter_344_4 in pairs(arg_341_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_344_4 then
						iter_344_4.color = Color.New(var_344_12, var_344_12, var_344_12)
					end
				end

				arg_341_1.var_.actorSpriteComps1056 = nil
			end

			local var_344_13 = arg_341_1.actors_["1060"]
			local var_344_14 = 0

			if var_344_14 < arg_341_1.time_ and arg_341_1.time_ <= var_344_14 + arg_344_0 and arg_341_1.var_.actorSpriteComps1060 == nil then
				arg_341_1.var_.actorSpriteComps1060 = var_344_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_344_15 = 0.034

			if var_344_14 <= arg_341_1.time_ and arg_341_1.time_ < var_344_14 + var_344_15 then
				local var_344_16 = (arg_341_1.time_ - var_344_14) / var_344_15

				if arg_341_1.var_.actorSpriteComps1060 then
					for iter_344_5, iter_344_6 in pairs(arg_341_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_344_6 then
							local var_344_17 = Mathf.Lerp(iter_344_6.color.r, 0.5, var_344_16)

							iter_344_6.color = Color.New(var_344_17, var_344_17, var_344_17)
						end
					end
				end
			end

			if arg_341_1.time_ >= var_344_14 + var_344_15 and arg_341_1.time_ < var_344_14 + var_344_15 + arg_344_0 and arg_341_1.var_.actorSpriteComps1060 then
				local var_344_18 = 0.5

				for iter_344_7, iter_344_8 in pairs(arg_341_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_344_8 then
						iter_344_8.color = Color.New(var_344_18, var_344_18, var_344_18)
					end
				end

				arg_341_1.var_.actorSpriteComps1060 = nil
			end

			local var_344_19 = 0
			local var_344_20 = 0.3

			if var_344_19 < arg_341_1.time_ and arg_341_1.time_ <= var_344_19 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_21 = arg_341_1:FormatText(StoryNameCfg[605].name)

				arg_341_1.leftNameTxt_.text = var_344_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_22 = arg_341_1:GetWordFromCfg(410021085)
				local var_344_23 = arg_341_1:FormatText(var_344_22.content)

				arg_341_1.text_.text = var_344_23

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_24 = 12
				local var_344_25 = utf8.len(var_344_23)
				local var_344_26 = var_344_24 <= 0 and var_344_20 or var_344_20 * (var_344_25 / var_344_24)

				if var_344_26 > 0 and var_344_20 < var_344_26 then
					arg_341_1.talkMaxDuration = var_344_26

					if var_344_26 + var_344_19 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_26 + var_344_19
					end
				end

				arg_341_1.text_.text = var_344_23
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021085", "story_v_out_410021.awb") ~= 0 then
					local var_344_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021085", "story_v_out_410021.awb") / 1000

					if var_344_27 + var_344_19 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_27 + var_344_19
					end

					if var_344_22.prefab_name ~= "" and arg_341_1.actors_[var_344_22.prefab_name] ~= nil then
						local var_344_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_22.prefab_name].transform, "story_v_out_410021", "410021085", "story_v_out_410021.awb")

						arg_341_1:RecordAudio("410021085", var_344_28)
						arg_341_1:RecordAudio("410021085", var_344_28)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_410021", "410021085", "story_v_out_410021.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_410021", "410021085", "story_v_out_410021.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_29 = math.max(var_344_20, arg_341_1.talkMaxDuration)

			if var_344_19 <= arg_341_1.time_ and arg_341_1.time_ < var_344_19 + var_344_29 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_19) / var_344_29

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_19 + var_344_29 and arg_341_1.time_ < var_344_19 + var_344_29 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play410021086 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 410021086
		arg_345_1.duration_ = 8.4

		local var_345_0 = {
			zh = 4.866,
			ja = 8.4
		}
		local var_345_1 = manager.audio:GetLocalizationFlag()

		if var_345_0[var_345_1] ~= nil then
			arg_345_1.duration_ = var_345_0[var_345_1]
		end

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play410021087(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["1060"].transform
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 then
				arg_345_1.var_.moveOldPos1060 = var_348_0.localPosition
				var_348_0.localScale = Vector3.New(1, 1, 1)

				arg_345_1:CheckSpriteTmpPos("1060", 2)

				local var_348_2 = var_348_0.childCount

				for iter_348_0 = 0, var_348_2 - 1 do
					local var_348_3 = var_348_0:GetChild(iter_348_0)

					if var_348_3.name == "" or not string.find(var_348_3.name, "split") then
						var_348_3.gameObject:SetActive(true)
					else
						var_348_3.gameObject:SetActive(false)
					end
				end
			end

			local var_348_4 = 0.001

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_4 then
				local var_348_5 = (arg_345_1.time_ - var_348_1) / var_348_4
				local var_348_6 = Vector3.New(-390, -435, -40)

				var_348_0.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos1060, var_348_6, var_348_5)
			end

			if arg_345_1.time_ >= var_348_1 + var_348_4 and arg_345_1.time_ < var_348_1 + var_348_4 + arg_348_0 then
				var_348_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_348_7 = arg_345_1.actors_["1060"]
			local var_348_8 = 0

			if var_348_8 < arg_345_1.time_ and arg_345_1.time_ <= var_348_8 + arg_348_0 and arg_345_1.var_.actorSpriteComps1060 == nil then
				arg_345_1.var_.actorSpriteComps1060 = var_348_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_348_9 = 0.034

			if var_348_8 <= arg_345_1.time_ and arg_345_1.time_ < var_348_8 + var_348_9 then
				local var_348_10 = (arg_345_1.time_ - var_348_8) / var_348_9

				if arg_345_1.var_.actorSpriteComps1060 then
					for iter_348_1, iter_348_2 in pairs(arg_345_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_348_2 then
							local var_348_11 = Mathf.Lerp(iter_348_2.color.r, 1, var_348_10)

							iter_348_2.color = Color.New(var_348_11, var_348_11, var_348_11)
						end
					end
				end
			end

			if arg_345_1.time_ >= var_348_8 + var_348_9 and arg_345_1.time_ < var_348_8 + var_348_9 + arg_348_0 and arg_345_1.var_.actorSpriteComps1060 then
				local var_348_12 = 1

				for iter_348_3, iter_348_4 in pairs(arg_345_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_348_4 then
						iter_348_4.color = Color.New(var_348_12, var_348_12, var_348_12)
					end
				end

				arg_345_1.var_.actorSpriteComps1060 = nil
			end

			local var_348_13 = arg_345_1.actors_["1056"]
			local var_348_14 = 0

			if var_348_14 < arg_345_1.time_ and arg_345_1.time_ <= var_348_14 + arg_348_0 and arg_345_1.var_.actorSpriteComps1056 == nil then
				arg_345_1.var_.actorSpriteComps1056 = var_348_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_348_15 = 0.034

			if var_348_14 <= arg_345_1.time_ and arg_345_1.time_ < var_348_14 + var_348_15 then
				local var_348_16 = (arg_345_1.time_ - var_348_14) / var_348_15

				if arg_345_1.var_.actorSpriteComps1056 then
					for iter_348_5, iter_348_6 in pairs(arg_345_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_348_6 then
							local var_348_17 = Mathf.Lerp(iter_348_6.color.r, 0.5, var_348_16)

							iter_348_6.color = Color.New(var_348_17, var_348_17, var_348_17)
						end
					end
				end
			end

			if arg_345_1.time_ >= var_348_14 + var_348_15 and arg_345_1.time_ < var_348_14 + var_348_15 + arg_348_0 and arg_345_1.var_.actorSpriteComps1056 then
				local var_348_18 = 0.5

				for iter_348_7, iter_348_8 in pairs(arg_345_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_348_8 then
						iter_348_8.color = Color.New(var_348_18, var_348_18, var_348_18)
					end
				end

				arg_345_1.var_.actorSpriteComps1056 = nil
			end

			local var_348_19 = 0
			local var_348_20 = 0.55

			if var_348_19 < arg_345_1.time_ and arg_345_1.time_ <= var_348_19 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_21 = arg_345_1:FormatText(StoryNameCfg[584].name)

				arg_345_1.leftNameTxt_.text = var_348_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_22 = arg_345_1:GetWordFromCfg(410021086)
				local var_348_23 = arg_345_1:FormatText(var_348_22.content)

				arg_345_1.text_.text = var_348_23

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_24 = 22
				local var_348_25 = utf8.len(var_348_23)
				local var_348_26 = var_348_24 <= 0 and var_348_20 or var_348_20 * (var_348_25 / var_348_24)

				if var_348_26 > 0 and var_348_20 < var_348_26 then
					arg_345_1.talkMaxDuration = var_348_26

					if var_348_26 + var_348_19 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_26 + var_348_19
					end
				end

				arg_345_1.text_.text = var_348_23
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021086", "story_v_out_410021.awb") ~= 0 then
					local var_348_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021086", "story_v_out_410021.awb") / 1000

					if var_348_27 + var_348_19 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_27 + var_348_19
					end

					if var_348_22.prefab_name ~= "" and arg_345_1.actors_[var_348_22.prefab_name] ~= nil then
						local var_348_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_22.prefab_name].transform, "story_v_out_410021", "410021086", "story_v_out_410021.awb")

						arg_345_1:RecordAudio("410021086", var_348_28)
						arg_345_1:RecordAudio("410021086", var_348_28)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_410021", "410021086", "story_v_out_410021.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_410021", "410021086", "story_v_out_410021.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_29 = math.max(var_348_20, arg_345_1.talkMaxDuration)

			if var_348_19 <= arg_345_1.time_ and arg_345_1.time_ < var_348_19 + var_348_29 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_19) / var_348_29

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_19 + var_348_29 and arg_345_1.time_ < var_348_19 + var_348_29 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play410021087 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 410021087
		arg_349_1.duration_ = 6.1

		local var_349_0 = {
			zh = 2.633,
			ja = 6.1
		}
		local var_349_1 = manager.audio:GetLocalizationFlag()

		if var_349_0[var_349_1] ~= nil then
			arg_349_1.duration_ = var_349_0[var_349_1]
		end

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play410021088(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["1056"].transform
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 then
				arg_349_1.var_.moveOldPos1056 = var_352_0.localPosition
				var_352_0.localScale = Vector3.New(1, 1, 1)

				arg_349_1:CheckSpriteTmpPos("1056", 4)

				local var_352_2 = var_352_0.childCount

				for iter_352_0 = 0, var_352_2 - 1 do
					local var_352_3 = var_352_0:GetChild(iter_352_0)

					if var_352_3.name == "split_4" or not string.find(var_352_3.name, "split") then
						var_352_3.gameObject:SetActive(true)
					else
						var_352_3.gameObject:SetActive(false)
					end
				end
			end

			local var_352_4 = 0.001

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_4 then
				local var_352_5 = (arg_349_1.time_ - var_352_1) / var_352_4
				local var_352_6 = Vector3.New(390, -350, -180)

				var_352_0.localPosition = Vector3.Lerp(arg_349_1.var_.moveOldPos1056, var_352_6, var_352_5)
			end

			if arg_349_1.time_ >= var_352_1 + var_352_4 and arg_349_1.time_ < var_352_1 + var_352_4 + arg_352_0 then
				var_352_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_352_7 = arg_349_1.actors_["1056"]
			local var_352_8 = 0

			if var_352_8 < arg_349_1.time_ and arg_349_1.time_ <= var_352_8 + arg_352_0 and arg_349_1.var_.actorSpriteComps1056 == nil then
				arg_349_1.var_.actorSpriteComps1056 = var_352_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_352_9 = 0.034

			if var_352_8 <= arg_349_1.time_ and arg_349_1.time_ < var_352_8 + var_352_9 then
				local var_352_10 = (arg_349_1.time_ - var_352_8) / var_352_9

				if arg_349_1.var_.actorSpriteComps1056 then
					for iter_352_1, iter_352_2 in pairs(arg_349_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_352_2 then
							local var_352_11 = Mathf.Lerp(iter_352_2.color.r, 1, var_352_10)

							iter_352_2.color = Color.New(var_352_11, var_352_11, var_352_11)
						end
					end
				end
			end

			if arg_349_1.time_ >= var_352_8 + var_352_9 and arg_349_1.time_ < var_352_8 + var_352_9 + arg_352_0 and arg_349_1.var_.actorSpriteComps1056 then
				local var_352_12 = 1

				for iter_352_3, iter_352_4 in pairs(arg_349_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_352_4 then
						iter_352_4.color = Color.New(var_352_12, var_352_12, var_352_12)
					end
				end

				arg_349_1.var_.actorSpriteComps1056 = nil
			end

			local var_352_13 = arg_349_1.actors_["1060"]
			local var_352_14 = 0

			if var_352_14 < arg_349_1.time_ and arg_349_1.time_ <= var_352_14 + arg_352_0 and arg_349_1.var_.actorSpriteComps1060 == nil then
				arg_349_1.var_.actorSpriteComps1060 = var_352_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_352_15 = 0.034

			if var_352_14 <= arg_349_1.time_ and arg_349_1.time_ < var_352_14 + var_352_15 then
				local var_352_16 = (arg_349_1.time_ - var_352_14) / var_352_15

				if arg_349_1.var_.actorSpriteComps1060 then
					for iter_352_5, iter_352_6 in pairs(arg_349_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_352_6 then
							local var_352_17 = Mathf.Lerp(iter_352_6.color.r, 0.5, var_352_16)

							iter_352_6.color = Color.New(var_352_17, var_352_17, var_352_17)
						end
					end
				end
			end

			if arg_349_1.time_ >= var_352_14 + var_352_15 and arg_349_1.time_ < var_352_14 + var_352_15 + arg_352_0 and arg_349_1.var_.actorSpriteComps1060 then
				local var_352_18 = 0.5

				for iter_352_7, iter_352_8 in pairs(arg_349_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_352_8 then
						iter_352_8.color = Color.New(var_352_18, var_352_18, var_352_18)
					end
				end

				arg_349_1.var_.actorSpriteComps1060 = nil
			end

			local var_352_19 = 0
			local var_352_20 = 0.4

			if var_352_19 < arg_349_1.time_ and arg_349_1.time_ <= var_352_19 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_21 = arg_349_1:FormatText(StoryNameCfg[605].name)

				arg_349_1.leftNameTxt_.text = var_352_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_22 = arg_349_1:GetWordFromCfg(410021087)
				local var_352_23 = arg_349_1:FormatText(var_352_22.content)

				arg_349_1.text_.text = var_352_23

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_24 = 16
				local var_352_25 = utf8.len(var_352_23)
				local var_352_26 = var_352_24 <= 0 and var_352_20 or var_352_20 * (var_352_25 / var_352_24)

				if var_352_26 > 0 and var_352_20 < var_352_26 then
					arg_349_1.talkMaxDuration = var_352_26

					if var_352_26 + var_352_19 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_26 + var_352_19
					end
				end

				arg_349_1.text_.text = var_352_23
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021087", "story_v_out_410021.awb") ~= 0 then
					local var_352_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021087", "story_v_out_410021.awb") / 1000

					if var_352_27 + var_352_19 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_27 + var_352_19
					end

					if var_352_22.prefab_name ~= "" and arg_349_1.actors_[var_352_22.prefab_name] ~= nil then
						local var_352_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_22.prefab_name].transform, "story_v_out_410021", "410021087", "story_v_out_410021.awb")

						arg_349_1:RecordAudio("410021087", var_352_28)
						arg_349_1:RecordAudio("410021087", var_352_28)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_410021", "410021087", "story_v_out_410021.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_410021", "410021087", "story_v_out_410021.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_29 = math.max(var_352_20, arg_349_1.talkMaxDuration)

			if var_352_19 <= arg_349_1.time_ and arg_349_1.time_ < var_352_19 + var_352_29 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_19) / var_352_29

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_19 + var_352_29 and arg_349_1.time_ < var_352_19 + var_352_29 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play410021088 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 410021088
		arg_353_1.duration_ = 5

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play410021089(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = arg_353_1.actors_["1056"]
			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 and arg_353_1.var_.actorSpriteComps1056 == nil then
				arg_353_1.var_.actorSpriteComps1056 = var_356_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_356_2 = 0.034

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_2 then
				local var_356_3 = (arg_353_1.time_ - var_356_1) / var_356_2

				if arg_353_1.var_.actorSpriteComps1056 then
					for iter_356_0, iter_356_1 in pairs(arg_353_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_356_1 then
							local var_356_4 = Mathf.Lerp(iter_356_1.color.r, 0.5, var_356_3)

							iter_356_1.color = Color.New(var_356_4, var_356_4, var_356_4)
						end
					end
				end
			end

			if arg_353_1.time_ >= var_356_1 + var_356_2 and arg_353_1.time_ < var_356_1 + var_356_2 + arg_356_0 and arg_353_1.var_.actorSpriteComps1056 then
				local var_356_5 = 0.5

				for iter_356_2, iter_356_3 in pairs(arg_353_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_356_3 then
						iter_356_3.color = Color.New(var_356_5, var_356_5, var_356_5)
					end
				end

				arg_353_1.var_.actorSpriteComps1056 = nil
			end

			local var_356_6 = 0
			local var_356_7 = 1

			if var_356_6 < arg_353_1.time_ and arg_353_1.time_ <= var_356_6 + arg_356_0 then
				local var_356_8 = "play"
				local var_356_9 = "effect"

				arg_353_1:AudioAction(var_356_8, var_356_9, "se_story_128", "se_story_128_projection", "")
			end

			local var_356_10 = 0
			local var_356_11 = 1.95

			if var_356_10 < arg_353_1.time_ and arg_353_1.time_ <= var_356_10 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, false)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_12 = arg_353_1:GetWordFromCfg(410021088)
				local var_356_13 = arg_353_1:FormatText(var_356_12.content)

				arg_353_1.text_.text = var_356_13

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_14 = 78
				local var_356_15 = utf8.len(var_356_13)
				local var_356_16 = var_356_14 <= 0 and var_356_11 or var_356_11 * (var_356_15 / var_356_14)

				if var_356_16 > 0 and var_356_11 < var_356_16 then
					arg_353_1.talkMaxDuration = var_356_16

					if var_356_16 + var_356_10 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_16 + var_356_10
					end
				end

				arg_353_1.text_.text = var_356_13
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)
				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_17 = math.max(var_356_11, arg_353_1.talkMaxDuration)

			if var_356_10 <= arg_353_1.time_ and arg_353_1.time_ < var_356_10 + var_356_17 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_10) / var_356_17

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_10 + var_356_17 and arg_353_1.time_ < var_356_10 + var_356_17 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play410021089 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 410021089
		arg_357_1.duration_ = 9.933

		local var_357_0 = {
			zh = 7.466,
			ja = 9.933
		}
		local var_357_1 = manager.audio:GetLocalizationFlag()

		if var_357_0[var_357_1] ~= nil then
			arg_357_1.duration_ = var_357_0[var_357_1]
		end

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play410021090(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["1060"].transform
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 then
				arg_357_1.var_.moveOldPos1060 = var_360_0.localPosition
				var_360_0.localScale = Vector3.New(1, 1, 1)

				arg_357_1:CheckSpriteTmpPos("1060", 2)

				local var_360_2 = var_360_0.childCount

				for iter_360_0 = 0, var_360_2 - 1 do
					local var_360_3 = var_360_0:GetChild(iter_360_0)

					if var_360_3.name == "" or not string.find(var_360_3.name, "split") then
						var_360_3.gameObject:SetActive(true)
					else
						var_360_3.gameObject:SetActive(false)
					end
				end
			end

			local var_360_4 = 0.001

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_4 then
				local var_360_5 = (arg_357_1.time_ - var_360_1) / var_360_4
				local var_360_6 = Vector3.New(-390, -435, -40)

				var_360_0.localPosition = Vector3.Lerp(arg_357_1.var_.moveOldPos1060, var_360_6, var_360_5)
			end

			if arg_357_1.time_ >= var_360_1 + var_360_4 and arg_357_1.time_ < var_360_1 + var_360_4 + arg_360_0 then
				var_360_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_360_7 = arg_357_1.actors_["1060"]
			local var_360_8 = 0

			if var_360_8 < arg_357_1.time_ and arg_357_1.time_ <= var_360_8 + arg_360_0 and arg_357_1.var_.actorSpriteComps1060 == nil then
				arg_357_1.var_.actorSpriteComps1060 = var_360_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_360_9 = 0.034

			if var_360_8 <= arg_357_1.time_ and arg_357_1.time_ < var_360_8 + var_360_9 then
				local var_360_10 = (arg_357_1.time_ - var_360_8) / var_360_9

				if arg_357_1.var_.actorSpriteComps1060 then
					for iter_360_1, iter_360_2 in pairs(arg_357_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_360_2 then
							local var_360_11 = Mathf.Lerp(iter_360_2.color.r, 1, var_360_10)

							iter_360_2.color = Color.New(var_360_11, var_360_11, var_360_11)
						end
					end
				end
			end

			if arg_357_1.time_ >= var_360_8 + var_360_9 and arg_357_1.time_ < var_360_8 + var_360_9 + arg_360_0 and arg_357_1.var_.actorSpriteComps1060 then
				local var_360_12 = 1

				for iter_360_3, iter_360_4 in pairs(arg_357_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_360_4 then
						iter_360_4.color = Color.New(var_360_12, var_360_12, var_360_12)
					end
				end

				arg_357_1.var_.actorSpriteComps1060 = nil
			end

			local var_360_13 = 0
			local var_360_14 = 0.7

			if var_360_13 < arg_357_1.time_ and arg_357_1.time_ <= var_360_13 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_15 = arg_357_1:FormatText(StoryNameCfg[584].name)

				arg_357_1.leftNameTxt_.text = var_360_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_16 = arg_357_1:GetWordFromCfg(410021089)
				local var_360_17 = arg_357_1:FormatText(var_360_16.content)

				arg_357_1.text_.text = var_360_17

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_18 = 28
				local var_360_19 = utf8.len(var_360_17)
				local var_360_20 = var_360_18 <= 0 and var_360_14 or var_360_14 * (var_360_19 / var_360_18)

				if var_360_20 > 0 and var_360_14 < var_360_20 then
					arg_357_1.talkMaxDuration = var_360_20

					if var_360_20 + var_360_13 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_20 + var_360_13
					end
				end

				arg_357_1.text_.text = var_360_17
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021089", "story_v_out_410021.awb") ~= 0 then
					local var_360_21 = manager.audio:GetVoiceLength("story_v_out_410021", "410021089", "story_v_out_410021.awb") / 1000

					if var_360_21 + var_360_13 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_21 + var_360_13
					end

					if var_360_16.prefab_name ~= "" and arg_357_1.actors_[var_360_16.prefab_name] ~= nil then
						local var_360_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_16.prefab_name].transform, "story_v_out_410021", "410021089", "story_v_out_410021.awb")

						arg_357_1:RecordAudio("410021089", var_360_22)
						arg_357_1:RecordAudio("410021089", var_360_22)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_410021", "410021089", "story_v_out_410021.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_410021", "410021089", "story_v_out_410021.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_23 = math.max(var_360_14, arg_357_1.talkMaxDuration)

			if var_360_13 <= arg_357_1.time_ and arg_357_1.time_ < var_360_13 + var_360_23 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_13) / var_360_23

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_13 + var_360_23 and arg_357_1.time_ < var_360_13 + var_360_23 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play410021090 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 410021090
		arg_361_1.duration_ = 5.366

		local var_361_0 = {
			zh = 3.833,
			ja = 5.366
		}
		local var_361_1 = manager.audio:GetLocalizationFlag()

		if var_361_0[var_361_1] ~= nil then
			arg_361_1.duration_ = var_361_0[var_361_1]
		end

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
			arg_361_1.auto_ = false
		end

		function arg_361_1.playNext_(arg_363_0)
			arg_361_1.onStoryFinished_()
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["1056"].transform
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 then
				arg_361_1.var_.moveOldPos1056 = var_364_0.localPosition
				var_364_0.localScale = Vector3.New(1, 1, 1)

				arg_361_1:CheckSpriteTmpPos("1056", 4)

				local var_364_2 = var_364_0.childCount

				for iter_364_0 = 0, var_364_2 - 1 do
					local var_364_3 = var_364_0:GetChild(iter_364_0)

					if var_364_3.name == "split_2" or not string.find(var_364_3.name, "split") then
						var_364_3.gameObject:SetActive(true)
					else
						var_364_3.gameObject:SetActive(false)
					end
				end
			end

			local var_364_4 = 0.001

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_4 then
				local var_364_5 = (arg_361_1.time_ - var_364_1) / var_364_4
				local var_364_6 = Vector3.New(390, -350, -180)

				var_364_0.localPosition = Vector3.Lerp(arg_361_1.var_.moveOldPos1056, var_364_6, var_364_5)
			end

			if arg_361_1.time_ >= var_364_1 + var_364_4 and arg_361_1.time_ < var_364_1 + var_364_4 + arg_364_0 then
				var_364_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_364_7 = arg_361_1.actors_["1056"]
			local var_364_8 = 0

			if var_364_8 < arg_361_1.time_ and arg_361_1.time_ <= var_364_8 + arg_364_0 and arg_361_1.var_.actorSpriteComps1056 == nil then
				arg_361_1.var_.actorSpriteComps1056 = var_364_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_364_9 = 0.034

			if var_364_8 <= arg_361_1.time_ and arg_361_1.time_ < var_364_8 + var_364_9 then
				local var_364_10 = (arg_361_1.time_ - var_364_8) / var_364_9

				if arg_361_1.var_.actorSpriteComps1056 then
					for iter_364_1, iter_364_2 in pairs(arg_361_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_364_2 then
							local var_364_11 = Mathf.Lerp(iter_364_2.color.r, 1, var_364_10)

							iter_364_2.color = Color.New(var_364_11, var_364_11, var_364_11)
						end
					end
				end
			end

			if arg_361_1.time_ >= var_364_8 + var_364_9 and arg_361_1.time_ < var_364_8 + var_364_9 + arg_364_0 and arg_361_1.var_.actorSpriteComps1056 then
				local var_364_12 = 1

				for iter_364_3, iter_364_4 in pairs(arg_361_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_364_4 then
						iter_364_4.color = Color.New(var_364_12, var_364_12, var_364_12)
					end
				end

				arg_361_1.var_.actorSpriteComps1056 = nil
			end

			local var_364_13 = arg_361_1.actors_["1060"]
			local var_364_14 = 0

			if var_364_14 < arg_361_1.time_ and arg_361_1.time_ <= var_364_14 + arg_364_0 and arg_361_1.var_.actorSpriteComps1060 == nil then
				arg_361_1.var_.actorSpriteComps1060 = var_364_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_364_15 = 0.034

			if var_364_14 <= arg_361_1.time_ and arg_361_1.time_ < var_364_14 + var_364_15 then
				local var_364_16 = (arg_361_1.time_ - var_364_14) / var_364_15

				if arg_361_1.var_.actorSpriteComps1060 then
					for iter_364_5, iter_364_6 in pairs(arg_361_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_364_6 then
							local var_364_17 = Mathf.Lerp(iter_364_6.color.r, 0.5, var_364_16)

							iter_364_6.color = Color.New(var_364_17, var_364_17, var_364_17)
						end
					end
				end
			end

			if arg_361_1.time_ >= var_364_14 + var_364_15 and arg_361_1.time_ < var_364_14 + var_364_15 + arg_364_0 and arg_361_1.var_.actorSpriteComps1060 then
				local var_364_18 = 0.5

				for iter_364_7, iter_364_8 in pairs(arg_361_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_364_8 then
						iter_364_8.color = Color.New(var_364_18, var_364_18, var_364_18)
					end
				end

				arg_361_1.var_.actorSpriteComps1060 = nil
			end

			local var_364_19 = 0
			local var_364_20 = 0.375

			if var_364_19 < arg_361_1.time_ and arg_361_1.time_ <= var_364_19 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_21 = arg_361_1:FormatText(StoryNameCfg[605].name)

				arg_361_1.leftNameTxt_.text = var_364_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_22 = arg_361_1:GetWordFromCfg(410021090)
				local var_364_23 = arg_361_1:FormatText(var_364_22.content)

				arg_361_1.text_.text = var_364_23

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_24 = 15
				local var_364_25 = utf8.len(var_364_23)
				local var_364_26 = var_364_24 <= 0 and var_364_20 or var_364_20 * (var_364_25 / var_364_24)

				if var_364_26 > 0 and var_364_20 < var_364_26 then
					arg_361_1.talkMaxDuration = var_364_26

					if var_364_26 + var_364_19 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_26 + var_364_19
					end
				end

				arg_361_1.text_.text = var_364_23
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410021", "410021090", "story_v_out_410021.awb") ~= 0 then
					local var_364_27 = manager.audio:GetVoiceLength("story_v_out_410021", "410021090", "story_v_out_410021.awb") / 1000

					if var_364_27 + var_364_19 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_27 + var_364_19
					end

					if var_364_22.prefab_name ~= "" and arg_361_1.actors_[var_364_22.prefab_name] ~= nil then
						local var_364_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_22.prefab_name].transform, "story_v_out_410021", "410021090", "story_v_out_410021.awb")

						arg_361_1:RecordAudio("410021090", var_364_28)
						arg_361_1:RecordAudio("410021090", var_364_28)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_410021", "410021090", "story_v_out_410021.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_410021", "410021090", "story_v_out_410021.awb")
				end

				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_29 = math.max(var_364_20, arg_361_1.talkMaxDuration)

			if var_364_19 <= arg_361_1.time_ and arg_361_1.time_ < var_364_19 + var_364_29 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_19) / var_364_29

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_19 + var_364_29 and arg_361_1.time_ < var_364_19 + var_364_29 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/L01f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST61"
	},
	voices = {
		"story_v_out_410021.awb"
	}
}
