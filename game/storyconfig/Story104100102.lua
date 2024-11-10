return {
	Play410012001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 410012001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play410012002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "L02f"

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
				local var_4_5 = arg_1_1.bgs_.L02f

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
					if iter_4_0 ~= "L02f" then
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
			local var_4_31 = 1.25

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

				local var_4_33 = arg_1_1:GetWordFromCfg(410012001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 50
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
	Play410012002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 410012002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play410012003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.7

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

				local var_10_2 = arg_7_1:GetWordFromCfg(410012002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 68
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
	Play410012003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 410012003
		arg_11_1.duration_ = 2.5

		local var_11_0 = {
			zh = 1.133,
			ja = 2.5
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
				arg_11_0:Play410012004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1060"

			if arg_11_1.actors_[var_14_0] == nil then
				local var_14_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_14_0), arg_11_1.canvasGo_.transform)

				var_14_1.transform:SetSiblingIndex(1)

				var_14_1.name = var_14_0
				var_14_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_11_1.actors_[var_14_0] = var_14_1
			end

			local var_14_2 = arg_11_1.actors_["1060"].transform
			local var_14_3 = 0

			if var_14_3 < arg_11_1.time_ and arg_11_1.time_ <= var_14_3 + arg_14_0 then
				arg_11_1.var_.moveOldPos1060 = var_14_2.localPosition
				var_14_2.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("1060", 3)

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
				local var_14_8 = Vector3.New(0, -435, -40)

				var_14_2.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1060, var_14_8, var_14_7)
			end

			if arg_11_1.time_ >= var_14_3 + var_14_6 and arg_11_1.time_ < var_14_3 + var_14_6 + arg_14_0 then
				var_14_2.localPosition = Vector3.New(0, -435, -40)
			end

			local var_14_9 = arg_11_1.actors_["1060"]
			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 and arg_11_1.var_.actorSpriteComps1060 == nil then
				arg_11_1.var_.actorSpriteComps1060 = var_14_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_11 = 0.034

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_11 then
				local var_14_12 = (arg_11_1.time_ - var_14_10) / var_14_11

				if arg_11_1.var_.actorSpriteComps1060 then
					for iter_14_1, iter_14_2 in pairs(arg_11_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_14_2 then
							local var_14_13 = Mathf.Lerp(iter_14_2.color.r, 1, var_14_12)

							iter_14_2.color = Color.New(var_14_13, var_14_13, var_14_13)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_10 + var_14_11 and arg_11_1.time_ < var_14_10 + var_14_11 + arg_14_0 and arg_11_1.var_.actorSpriteComps1060 then
				local var_14_14 = 1

				for iter_14_3, iter_14_4 in pairs(arg_11_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_14_4 then
						iter_14_4.color = Color.New(var_14_14, var_14_14, var_14_14)
					end
				end

				arg_11_1.var_.actorSpriteComps1060 = nil
			end

			local var_14_15 = 0
			local var_14_16 = 0.125

			if var_14_15 < arg_11_1.time_ and arg_11_1.time_ <= var_14_15 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_17 = arg_11_1:FormatText(StoryNameCfg[584].name)

				arg_11_1.leftNameTxt_.text = var_14_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_18 = arg_11_1:GetWordFromCfg(410012003)
				local var_14_19 = arg_11_1:FormatText(var_14_18.content)

				arg_11_1.text_.text = var_14_19

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_20 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012003", "story_v_out_410012.awb") ~= 0 then
					local var_14_23 = manager.audio:GetVoiceLength("story_v_out_410012", "410012003", "story_v_out_410012.awb") / 1000

					if var_14_23 + var_14_15 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_23 + var_14_15
					end

					if var_14_18.prefab_name ~= "" and arg_11_1.actors_[var_14_18.prefab_name] ~= nil then
						local var_14_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_18.prefab_name].transform, "story_v_out_410012", "410012003", "story_v_out_410012.awb")

						arg_11_1:RecordAudio("410012003", var_14_24)
						arg_11_1:RecordAudio("410012003", var_14_24)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_410012", "410012003", "story_v_out_410012.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_410012", "410012003", "story_v_out_410012.awb")
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
	Play410012004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 410012004
		arg_15_1.duration_ = 2.266

		local var_15_0 = {
			zh = 1.266,
			ja = 2.266
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
				arg_15_0:Play410012005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1060"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.actorSpriteComps1060 == nil then
				arg_15_1.var_.actorSpriteComps1060 = var_18_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_2 = 0.034

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.actorSpriteComps1060 then
					for iter_18_0, iter_18_1 in pairs(arg_15_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_18_1 then
							local var_18_4 = Mathf.Lerp(iter_18_1.color.r, 0.5, var_18_3)

							iter_18_1.color = Color.New(var_18_4, var_18_4, var_18_4)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.actorSpriteComps1060 then
				local var_18_5 = 0.5

				for iter_18_2, iter_18_3 in pairs(arg_15_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_18_3 then
						iter_18_3.color = Color.New(var_18_5, var_18_5, var_18_5)
					end
				end

				arg_15_1.var_.actorSpriteComps1060 = nil
			end

			local var_18_6 = 0
			local var_18_7 = 0.175

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_8 = arg_15_1:FormatText(StoryNameCfg[589].name)

				arg_15_1.leftNameTxt_.text = var_18_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2083")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_9 = arg_15_1:GetWordFromCfg(410012004)
				local var_18_10 = arg_15_1:FormatText(var_18_9.content)

				arg_15_1.text_.text = var_18_10

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_11 = 7
				local var_18_12 = utf8.len(var_18_10)
				local var_18_13 = var_18_11 <= 0 and var_18_7 or var_18_7 * (var_18_12 / var_18_11)

				if var_18_13 > 0 and var_18_7 < var_18_13 then
					arg_15_1.talkMaxDuration = var_18_13

					if var_18_13 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_13 + var_18_6
					end
				end

				arg_15_1.text_.text = var_18_10
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012004", "story_v_out_410012.awb") ~= 0 then
					local var_18_14 = manager.audio:GetVoiceLength("story_v_out_410012", "410012004", "story_v_out_410012.awb") / 1000

					if var_18_14 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_14 + var_18_6
					end

					if var_18_9.prefab_name ~= "" and arg_15_1.actors_[var_18_9.prefab_name] ~= nil then
						local var_18_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_9.prefab_name].transform, "story_v_out_410012", "410012004", "story_v_out_410012.awb")

						arg_15_1:RecordAudio("410012004", var_18_15)
						arg_15_1:RecordAudio("410012004", var_18_15)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_410012", "410012004", "story_v_out_410012.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_410012", "410012004", "story_v_out_410012.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_16 = math.max(var_18_7, arg_15_1.talkMaxDuration)

			if var_18_6 <= arg_15_1.time_ and arg_15_1.time_ < var_18_6 + var_18_16 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_6) / var_18_16

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_6 + var_18_16 and arg_15_1.time_ < var_18_6 + var_18_16 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play410012005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 410012005
		arg_19_1.duration_ = 4.066

		local var_19_0 = {
			zh = 3.133,
			ja = 4.066
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
				arg_19_0:Play410012006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1060"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1060 = var_22_0.localPosition
				var_22_0.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("1060", 3)

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
				local var_22_6 = Vector3.New(0, -435, -40)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1060, var_22_6, var_22_5)
			end

			if arg_19_1.time_ >= var_22_1 + var_22_4 and arg_19_1.time_ < var_22_1 + var_22_4 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_22_7 = arg_19_1.actors_["1060"]
			local var_22_8 = 0

			if var_22_8 < arg_19_1.time_ and arg_19_1.time_ <= var_22_8 + arg_22_0 and arg_19_1.var_.actorSpriteComps1060 == nil then
				arg_19_1.var_.actorSpriteComps1060 = var_22_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_9 = 0.034

			if var_22_8 <= arg_19_1.time_ and arg_19_1.time_ < var_22_8 + var_22_9 then
				local var_22_10 = (arg_19_1.time_ - var_22_8) / var_22_9

				if arg_19_1.var_.actorSpriteComps1060 then
					for iter_22_1, iter_22_2 in pairs(arg_19_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_22_2 then
							local var_22_11 = Mathf.Lerp(iter_22_2.color.r, 1, var_22_10)

							iter_22_2.color = Color.New(var_22_11, var_22_11, var_22_11)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_8 + var_22_9 and arg_19_1.time_ < var_22_8 + var_22_9 + arg_22_0 and arg_19_1.var_.actorSpriteComps1060 then
				local var_22_12 = 1

				for iter_22_3, iter_22_4 in pairs(arg_19_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_22_4 then
						iter_22_4.color = Color.New(var_22_12, var_22_12, var_22_12)
					end
				end

				arg_19_1.var_.actorSpriteComps1060 = nil
			end

			local var_22_13 = 0
			local var_22_14 = 0.425

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_15 = arg_19_1:FormatText(StoryNameCfg[584].name)

				arg_19_1.leftNameTxt_.text = var_22_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_16 = arg_19_1:GetWordFromCfg(410012005)
				local var_22_17 = arg_19_1:FormatText(var_22_16.content)

				arg_19_1.text_.text = var_22_17

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_18 = 17
				local var_22_19 = utf8.len(var_22_17)
				local var_22_20 = var_22_18 <= 0 and var_22_14 or var_22_14 * (var_22_19 / var_22_18)

				if var_22_20 > 0 and var_22_14 < var_22_20 then
					arg_19_1.talkMaxDuration = var_22_20

					if var_22_20 + var_22_13 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_20 + var_22_13
					end
				end

				arg_19_1.text_.text = var_22_17
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012005", "story_v_out_410012.awb") ~= 0 then
					local var_22_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012005", "story_v_out_410012.awb") / 1000

					if var_22_21 + var_22_13 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_21 + var_22_13
					end

					if var_22_16.prefab_name ~= "" and arg_19_1.actors_[var_22_16.prefab_name] ~= nil then
						local var_22_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_16.prefab_name].transform, "story_v_out_410012", "410012005", "story_v_out_410012.awb")

						arg_19_1:RecordAudio("410012005", var_22_22)
						arg_19_1:RecordAudio("410012005", var_22_22)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_410012", "410012005", "story_v_out_410012.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_410012", "410012005", "story_v_out_410012.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_23 = math.max(var_22_14, arg_19_1.talkMaxDuration)

			if var_22_13 <= arg_19_1.time_ and arg_19_1.time_ < var_22_13 + var_22_23 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_13) / var_22_23

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_13 + var_22_23 and arg_19_1.time_ < var_22_13 + var_22_23 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play410012006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 410012006
		arg_23_1.duration_ = 12.433

		local var_23_0 = {
			zh = 5.2,
			ja = 12.433
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
				arg_23_0:Play410012007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1060"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.actorSpriteComps1060 == nil then
				arg_23_1.var_.actorSpriteComps1060 = var_26_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_2 = 0.034

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.actorSpriteComps1060 then
					for iter_26_0, iter_26_1 in pairs(arg_23_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_26_1 then
							local var_26_4 = Mathf.Lerp(iter_26_1.color.r, 0.5, var_26_3)

							iter_26_1.color = Color.New(var_26_4, var_26_4, var_26_4)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.actorSpriteComps1060 then
				local var_26_5 = 0.5

				for iter_26_2, iter_26_3 in pairs(arg_23_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_26_3 then
						iter_26_3.color = Color.New(var_26_5, var_26_5, var_26_5)
					end
				end

				arg_23_1.var_.actorSpriteComps1060 = nil
			end

			local var_26_6 = 0
			local var_26_7 = 0.625

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_8 = arg_23_1:FormatText(StoryNameCfg[589].name)

				arg_23_1.leftNameTxt_.text = var_26_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2083")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_9 = arg_23_1:GetWordFromCfg(410012006)
				local var_26_10 = arg_23_1:FormatText(var_26_9.content)

				arg_23_1.text_.text = var_26_10

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_11 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012006", "story_v_out_410012.awb") ~= 0 then
					local var_26_14 = manager.audio:GetVoiceLength("story_v_out_410012", "410012006", "story_v_out_410012.awb") / 1000

					if var_26_14 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_14 + var_26_6
					end

					if var_26_9.prefab_name ~= "" and arg_23_1.actors_[var_26_9.prefab_name] ~= nil then
						local var_26_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_9.prefab_name].transform, "story_v_out_410012", "410012006", "story_v_out_410012.awb")

						arg_23_1:RecordAudio("410012006", var_26_15)
						arg_23_1:RecordAudio("410012006", var_26_15)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_410012", "410012006", "story_v_out_410012.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_410012", "410012006", "story_v_out_410012.awb")
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
	Play410012007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 410012007
		arg_27_1.duration_ = 14.266

		local var_27_0 = {
			zh = 7.8,
			ja = 14.266
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
				arg_27_0:Play410012008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.925

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_2 = arg_27_1:FormatText(StoryNameCfg[589].name)

				arg_27_1.leftNameTxt_.text = var_30_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, true)
				arg_27_1.iconController_:SetSelectedState("hero")

				arg_27_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2083")

				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_3 = arg_27_1:GetWordFromCfg(410012007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012007", "story_v_out_410012.awb") ~= 0 then
					local var_30_8 = manager.audio:GetVoiceLength("story_v_out_410012", "410012007", "story_v_out_410012.awb") / 1000

					if var_30_8 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_8 + var_30_0
					end

					if var_30_3.prefab_name ~= "" and arg_27_1.actors_[var_30_3.prefab_name] ~= nil then
						local var_30_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_3.prefab_name].transform, "story_v_out_410012", "410012007", "story_v_out_410012.awb")

						arg_27_1:RecordAudio("410012007", var_30_9)
						arg_27_1:RecordAudio("410012007", var_30_9)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_410012", "410012007", "story_v_out_410012.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_410012", "410012007", "story_v_out_410012.awb")
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
	Play410012008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 410012008
		arg_31_1.duration_ = 4.7

		local var_31_0 = {
			zh = 2.666,
			ja = 4.7
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
				arg_31_0:Play410012009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1060"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1060 = var_34_0.localPosition
				var_34_0.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("1060", 3)

				local var_34_2 = var_34_0.childCount

				for iter_34_0 = 0, var_34_2 - 1 do
					local var_34_3 = var_34_0:GetChild(iter_34_0)

					if var_34_3.name == "split_4" or not string.find(var_34_3.name, "split") then
						var_34_3.gameObject:SetActive(true)
					else
						var_34_3.gameObject:SetActive(false)
					end
				end
			end

			local var_34_4 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_4 then
				local var_34_5 = (arg_31_1.time_ - var_34_1) / var_34_4
				local var_34_6 = Vector3.New(0, -435, -40)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1060, var_34_6, var_34_5)
			end

			if arg_31_1.time_ >= var_34_1 + var_34_4 and arg_31_1.time_ < var_34_1 + var_34_4 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, -435, -40)
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
							local var_34_11 = Mathf.Lerp(iter_34_2.color.r, 1, var_34_10)

							iter_34_2.color = Color.New(var_34_11, var_34_11, var_34_11)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_8 + var_34_9 and arg_31_1.time_ < var_34_8 + var_34_9 + arg_34_0 and arg_31_1.var_.actorSpriteComps1060 then
				local var_34_12 = 1

				for iter_34_3, iter_34_4 in pairs(arg_31_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_34_4 then
						iter_34_4.color = Color.New(var_34_12, var_34_12, var_34_12)
					end
				end

				arg_31_1.var_.actorSpriteComps1060 = nil
			end

			local var_34_13 = 0
			local var_34_14 = 0.375

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_15 = arg_31_1:FormatText(StoryNameCfg[584].name)

				arg_31_1.leftNameTxt_.text = var_34_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_16 = arg_31_1:GetWordFromCfg(410012008)
				local var_34_17 = arg_31_1:FormatText(var_34_16.content)

				arg_31_1.text_.text = var_34_17

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_18 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012008", "story_v_out_410012.awb") ~= 0 then
					local var_34_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012008", "story_v_out_410012.awb") / 1000

					if var_34_21 + var_34_13 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_21 + var_34_13
					end

					if var_34_16.prefab_name ~= "" and arg_31_1.actors_[var_34_16.prefab_name] ~= nil then
						local var_34_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_16.prefab_name].transform, "story_v_out_410012", "410012008", "story_v_out_410012.awb")

						arg_31_1:RecordAudio("410012008", var_34_22)
						arg_31_1:RecordAudio("410012008", var_34_22)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_410012", "410012008", "story_v_out_410012.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_410012", "410012008", "story_v_out_410012.awb")
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
	Play410012009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 410012009
		arg_35_1.duration_ = 11.3

		local var_35_0 = {
			zh = 8.2,
			ja = 11.3
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
				arg_35_0:Play410012010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1060"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.actorSpriteComps1060 == nil then
				arg_35_1.var_.actorSpriteComps1060 = var_38_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_2 = 0.034

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.actorSpriteComps1060 then
					for iter_38_0, iter_38_1 in pairs(arg_35_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_38_1 then
							local var_38_4 = Mathf.Lerp(iter_38_1.color.r, 0.5, var_38_3)

							iter_38_1.color = Color.New(var_38_4, var_38_4, var_38_4)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.actorSpriteComps1060 then
				local var_38_5 = 0.5

				for iter_38_2, iter_38_3 in pairs(arg_35_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_38_3 then
						iter_38_3.color = Color.New(var_38_5, var_38_5, var_38_5)
					end
				end

				arg_35_1.var_.actorSpriteComps1060 = nil
			end

			local var_38_6 = 0
			local var_38_7 = 1.125

			if var_38_6 < arg_35_1.time_ and arg_35_1.time_ <= var_38_6 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_8 = arg_35_1:FormatText(StoryNameCfg[589].name)

				arg_35_1.leftNameTxt_.text = var_38_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, true)
				arg_35_1.iconController_:SetSelectedState("hero")

				arg_35_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2083")

				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_9 = arg_35_1:GetWordFromCfg(410012009)
				local var_38_10 = arg_35_1:FormatText(var_38_9.content)

				arg_35_1.text_.text = var_38_10

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_11 = 45
				local var_38_12 = utf8.len(var_38_10)
				local var_38_13 = var_38_11 <= 0 and var_38_7 or var_38_7 * (var_38_12 / var_38_11)

				if var_38_13 > 0 and var_38_7 < var_38_13 then
					arg_35_1.talkMaxDuration = var_38_13

					if var_38_13 + var_38_6 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_13 + var_38_6
					end
				end

				arg_35_1.text_.text = var_38_10
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012009", "story_v_out_410012.awb") ~= 0 then
					local var_38_14 = manager.audio:GetVoiceLength("story_v_out_410012", "410012009", "story_v_out_410012.awb") / 1000

					if var_38_14 + var_38_6 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_14 + var_38_6
					end

					if var_38_9.prefab_name ~= "" and arg_35_1.actors_[var_38_9.prefab_name] ~= nil then
						local var_38_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_9.prefab_name].transform, "story_v_out_410012", "410012009", "story_v_out_410012.awb")

						arg_35_1:RecordAudio("410012009", var_38_15)
						arg_35_1:RecordAudio("410012009", var_38_15)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_410012", "410012009", "story_v_out_410012.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_410012", "410012009", "story_v_out_410012.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_16 = math.max(var_38_7, arg_35_1.talkMaxDuration)

			if var_38_6 <= arg_35_1.time_ and arg_35_1.time_ < var_38_6 + var_38_16 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_6) / var_38_16

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_6 + var_38_16 and arg_35_1.time_ < var_38_6 + var_38_16 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play410012010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 410012010
		arg_39_1.duration_ = 7.266

		local var_39_0 = {
			zh = 4.3,
			ja = 7.266
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
				arg_39_0:Play410012011(arg_39_1)
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
			local var_42_14 = 0.45

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

				local var_42_16 = arg_39_1:GetWordFromCfg(410012010)
				local var_42_17 = arg_39_1:FormatText(var_42_16.content)

				arg_39_1.text_.text = var_42_17

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_18 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012010", "story_v_out_410012.awb") ~= 0 then
					local var_42_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012010", "story_v_out_410012.awb") / 1000

					if var_42_21 + var_42_13 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_21 + var_42_13
					end

					if var_42_16.prefab_name ~= "" and arg_39_1.actors_[var_42_16.prefab_name] ~= nil then
						local var_42_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_16.prefab_name].transform, "story_v_out_410012", "410012010", "story_v_out_410012.awb")

						arg_39_1:RecordAudio("410012010", var_42_22)
						arg_39_1:RecordAudio("410012010", var_42_22)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_410012", "410012010", "story_v_out_410012.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_410012", "410012010", "story_v_out_410012.awb")
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
	Play410012011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 410012011
		arg_43_1.duration_ = 11.2

		local var_43_0 = {
			zh = 8.3,
			ja = 11.2
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
				arg_43_0:Play410012012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1060"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.actorSpriteComps1060 == nil then
				arg_43_1.var_.actorSpriteComps1060 = var_46_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_2 = 0.034

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.actorSpriteComps1060 then
					for iter_46_0, iter_46_1 in pairs(arg_43_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_46_1 then
							local var_46_4 = Mathf.Lerp(iter_46_1.color.r, 0.5, var_46_3)

							iter_46_1.color = Color.New(var_46_4, var_46_4, var_46_4)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.actorSpriteComps1060 then
				local var_46_5 = 0.5

				for iter_46_2, iter_46_3 in pairs(arg_43_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_46_3 then
						iter_46_3.color = Color.New(var_46_5, var_46_5, var_46_5)
					end
				end

				arg_43_1.var_.actorSpriteComps1060 = nil
			end

			local var_46_6 = 0
			local var_46_7 = 0.975

			if var_46_6 < arg_43_1.time_ and arg_43_1.time_ <= var_46_6 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_8 = arg_43_1:FormatText(StoryNameCfg[589].name)

				arg_43_1.leftNameTxt_.text = var_46_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, true)
				arg_43_1.iconController_:SetSelectedState("hero")

				arg_43_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2083")

				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_9 = arg_43_1:GetWordFromCfg(410012011)
				local var_46_10 = arg_43_1:FormatText(var_46_9.content)

				arg_43_1.text_.text = var_46_10

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_11 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012011", "story_v_out_410012.awb") ~= 0 then
					local var_46_14 = manager.audio:GetVoiceLength("story_v_out_410012", "410012011", "story_v_out_410012.awb") / 1000

					if var_46_14 + var_46_6 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_14 + var_46_6
					end

					if var_46_9.prefab_name ~= "" and arg_43_1.actors_[var_46_9.prefab_name] ~= nil then
						local var_46_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_9.prefab_name].transform, "story_v_out_410012", "410012011", "story_v_out_410012.awb")

						arg_43_1:RecordAudio("410012011", var_46_15)
						arg_43_1:RecordAudio("410012011", var_46_15)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_410012", "410012011", "story_v_out_410012.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_410012", "410012011", "story_v_out_410012.awb")
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
	Play410012012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 410012012
		arg_47_1.duration_ = 8.133

		local var_47_0 = {
			zh = 4.9,
			ja = 8.133
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
				arg_47_0:Play410012013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1060"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1060 = var_50_0.localPosition
				var_50_0.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("1060", 3)

				local var_50_2 = var_50_0.childCount

				for iter_50_0 = 0, var_50_2 - 1 do
					local var_50_3 = var_50_0:GetChild(iter_50_0)

					if var_50_3.name == "" or not string.find(var_50_3.name, "split") then
						var_50_3.gameObject:SetActive(true)
					else
						var_50_3.gameObject:SetActive(false)
					end
				end
			end

			local var_50_4 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_4 then
				local var_50_5 = (arg_47_1.time_ - var_50_1) / var_50_4
				local var_50_6 = Vector3.New(0, -435, -40)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1060, var_50_6, var_50_5)
			end

			if arg_47_1.time_ >= var_50_1 + var_50_4 and arg_47_1.time_ < var_50_1 + var_50_4 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_50_7 = arg_47_1.actors_["1060"]
			local var_50_8 = 0

			if var_50_8 < arg_47_1.time_ and arg_47_1.time_ <= var_50_8 + arg_50_0 and arg_47_1.var_.actorSpriteComps1060 == nil then
				arg_47_1.var_.actorSpriteComps1060 = var_50_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_9 = 0.034

			if var_50_8 <= arg_47_1.time_ and arg_47_1.time_ < var_50_8 + var_50_9 then
				local var_50_10 = (arg_47_1.time_ - var_50_8) / var_50_9

				if arg_47_1.var_.actorSpriteComps1060 then
					for iter_50_1, iter_50_2 in pairs(arg_47_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_50_2 then
							local var_50_11 = Mathf.Lerp(iter_50_2.color.r, 1, var_50_10)

							iter_50_2.color = Color.New(var_50_11, var_50_11, var_50_11)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_8 + var_50_9 and arg_47_1.time_ < var_50_8 + var_50_9 + arg_50_0 and arg_47_1.var_.actorSpriteComps1060 then
				local var_50_12 = 1

				for iter_50_3, iter_50_4 in pairs(arg_47_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_50_4 then
						iter_50_4.color = Color.New(var_50_12, var_50_12, var_50_12)
					end
				end

				arg_47_1.var_.actorSpriteComps1060 = nil
			end

			local var_50_13 = 0
			local var_50_14 = 0.65

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_15 = arg_47_1:FormatText(StoryNameCfg[584].name)

				arg_47_1.leftNameTxt_.text = var_50_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_16 = arg_47_1:GetWordFromCfg(410012012)
				local var_50_17 = arg_47_1:FormatText(var_50_16.content)

				arg_47_1.text_.text = var_50_17

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_18 = 26
				local var_50_19 = utf8.len(var_50_17)
				local var_50_20 = var_50_18 <= 0 and var_50_14 or var_50_14 * (var_50_19 / var_50_18)

				if var_50_20 > 0 and var_50_14 < var_50_20 then
					arg_47_1.talkMaxDuration = var_50_20

					if var_50_20 + var_50_13 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_20 + var_50_13
					end
				end

				arg_47_1.text_.text = var_50_17
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012012", "story_v_out_410012.awb") ~= 0 then
					local var_50_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012012", "story_v_out_410012.awb") / 1000

					if var_50_21 + var_50_13 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_21 + var_50_13
					end

					if var_50_16.prefab_name ~= "" and arg_47_1.actors_[var_50_16.prefab_name] ~= nil then
						local var_50_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_16.prefab_name].transform, "story_v_out_410012", "410012012", "story_v_out_410012.awb")

						arg_47_1:RecordAudio("410012012", var_50_22)
						arg_47_1:RecordAudio("410012012", var_50_22)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_410012", "410012012", "story_v_out_410012.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_410012", "410012012", "story_v_out_410012.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_23 = math.max(var_50_14, arg_47_1.talkMaxDuration)

			if var_50_13 <= arg_47_1.time_ and arg_47_1.time_ < var_50_13 + var_50_23 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_13) / var_50_23

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_13 + var_50_23 and arg_47_1.time_ < var_50_13 + var_50_23 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play410012013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 410012013
		arg_51_1.duration_ = 6.633

		local var_51_0 = {
			zh = 5.366,
			ja = 6.633
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
				arg_51_0:Play410012014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1060"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1060 = var_54_0.localPosition
				var_54_0.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("1060", 3)

				local var_54_2 = var_54_0.childCount

				for iter_54_0 = 0, var_54_2 - 1 do
					local var_54_3 = var_54_0:GetChild(iter_54_0)

					if var_54_3.name == "split_1" or not string.find(var_54_3.name, "split") then
						var_54_3.gameObject:SetActive(true)
					else
						var_54_3.gameObject:SetActive(false)
					end
				end
			end

			local var_54_4 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_4 then
				local var_54_5 = (arg_51_1.time_ - var_54_1) / var_54_4
				local var_54_6 = Vector3.New(0, -435, -40)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1060, var_54_6, var_54_5)
			end

			if arg_51_1.time_ >= var_54_1 + var_54_4 and arg_51_1.time_ < var_54_1 + var_54_4 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_54_7 = arg_51_1.actors_["1060"]
			local var_54_8 = 0

			if var_54_8 < arg_51_1.time_ and arg_51_1.time_ <= var_54_8 + arg_54_0 and arg_51_1.var_.actorSpriteComps1060 == nil then
				arg_51_1.var_.actorSpriteComps1060 = var_54_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_9 = 0.034

			if var_54_8 <= arg_51_1.time_ and arg_51_1.time_ < var_54_8 + var_54_9 then
				local var_54_10 = (arg_51_1.time_ - var_54_8) / var_54_9

				if arg_51_1.var_.actorSpriteComps1060 then
					for iter_54_1, iter_54_2 in pairs(arg_51_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_54_2 then
							local var_54_11 = Mathf.Lerp(iter_54_2.color.r, 1, var_54_10)

							iter_54_2.color = Color.New(var_54_11, var_54_11, var_54_11)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_8 + var_54_9 and arg_51_1.time_ < var_54_8 + var_54_9 + arg_54_0 and arg_51_1.var_.actorSpriteComps1060 then
				local var_54_12 = 1

				for iter_54_3, iter_54_4 in pairs(arg_51_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_54_4 then
						iter_54_4.color = Color.New(var_54_12, var_54_12, var_54_12)
					end
				end

				arg_51_1.var_.actorSpriteComps1060 = nil
			end

			local var_54_13 = 0
			local var_54_14 = 0.625

			if var_54_13 < arg_51_1.time_ and arg_51_1.time_ <= var_54_13 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_15 = arg_51_1:FormatText(StoryNameCfg[584].name)

				arg_51_1.leftNameTxt_.text = var_54_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_16 = arg_51_1:GetWordFromCfg(410012013)
				local var_54_17 = arg_51_1:FormatText(var_54_16.content)

				arg_51_1.text_.text = var_54_17

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_18 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012013", "story_v_out_410012.awb") ~= 0 then
					local var_54_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012013", "story_v_out_410012.awb") / 1000

					if var_54_21 + var_54_13 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_21 + var_54_13
					end

					if var_54_16.prefab_name ~= "" and arg_51_1.actors_[var_54_16.prefab_name] ~= nil then
						local var_54_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_16.prefab_name].transform, "story_v_out_410012", "410012013", "story_v_out_410012.awb")

						arg_51_1:RecordAudio("410012013", var_54_22)
						arg_51_1:RecordAudio("410012013", var_54_22)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_410012", "410012013", "story_v_out_410012.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_410012", "410012013", "story_v_out_410012.awb")
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
	Play410012014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 410012014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play410012015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1060"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.actorSpriteComps1060 == nil then
				arg_55_1.var_.actorSpriteComps1060 = var_58_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_2 = 0.034

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.actorSpriteComps1060 then
					for iter_58_0, iter_58_1 in pairs(arg_55_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_58_1 then
							local var_58_4 = Mathf.Lerp(iter_58_1.color.r, 0.5, var_58_3)

							iter_58_1.color = Color.New(var_58_4, var_58_4, var_58_4)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.actorSpriteComps1060 then
				local var_58_5 = 0.5

				for iter_58_2, iter_58_3 in pairs(arg_55_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_58_3 then
						iter_58_3.color = Color.New(var_58_5, var_58_5, var_58_5)
					end
				end

				arg_55_1.var_.actorSpriteComps1060 = nil
			end

			local var_58_6 = 0
			local var_58_7 = 1.6

			if var_58_6 < arg_55_1.time_ and arg_55_1.time_ <= var_58_6 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_8 = arg_55_1:GetWordFromCfg(410012014)
				local var_58_9 = arg_55_1:FormatText(var_58_8.content)

				arg_55_1.text_.text = var_58_9

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_10 = 64
				local var_58_11 = utf8.len(var_58_9)
				local var_58_12 = var_58_10 <= 0 and var_58_7 or var_58_7 * (var_58_11 / var_58_10)

				if var_58_12 > 0 and var_58_7 < var_58_12 then
					arg_55_1.talkMaxDuration = var_58_12

					if var_58_12 + var_58_6 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_12 + var_58_6
					end
				end

				arg_55_1.text_.text = var_58_9
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_13 = math.max(var_58_7, arg_55_1.talkMaxDuration)

			if var_58_6 <= arg_55_1.time_ and arg_55_1.time_ < var_58_6 + var_58_13 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_6) / var_58_13

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_6 + var_58_13 and arg_55_1.time_ < var_58_6 + var_58_13 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play410012015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 410012015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play410012016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 1

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

				local var_62_2 = arg_59_1:GetWordFromCfg(410012015)
				local var_62_3 = arg_59_1:FormatText(var_62_2.content)

				arg_59_1.text_.text = var_62_3

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_4 = 40
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
	Play410012016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 410012016
		arg_63_1.duration_ = 9.266

		local var_63_0 = {
			zh = 4.333,
			ja = 9.266
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
				arg_63_0:Play410012017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 0.475

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_2 = arg_63_1:FormatText(StoryNameCfg[589].name)

				arg_63_1.leftNameTxt_.text = var_66_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, true)
				arg_63_1.iconController_:SetSelectedState("hero")

				arg_63_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2083")

				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_3 = arg_63_1:GetWordFromCfg(410012016)
				local var_66_4 = arg_63_1:FormatText(var_66_3.content)

				arg_63_1.text_.text = var_66_4

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_5 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012016", "story_v_out_410012.awb") ~= 0 then
					local var_66_8 = manager.audio:GetVoiceLength("story_v_out_410012", "410012016", "story_v_out_410012.awb") / 1000

					if var_66_8 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_8 + var_66_0
					end

					if var_66_3.prefab_name ~= "" and arg_63_1.actors_[var_66_3.prefab_name] ~= nil then
						local var_66_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_3.prefab_name].transform, "story_v_out_410012", "410012016", "story_v_out_410012.awb")

						arg_63_1:RecordAudio("410012016", var_66_9)
						arg_63_1:RecordAudio("410012016", var_66_9)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_410012", "410012016", "story_v_out_410012.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_410012", "410012016", "story_v_out_410012.awb")
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
	Play410012017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 410012017
		arg_67_1.duration_ = 10.233

		local var_67_0 = {
			zh = 6.166,
			ja = 10.233
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
				arg_67_0:Play410012018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1060"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1060 = var_70_0.localPosition
				var_70_0.localScale = Vector3.New(1, 1, 1)

				arg_67_1:CheckSpriteTmpPos("1060", 3)

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
				local var_70_6 = Vector3.New(0, -435, -40)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1060, var_70_6, var_70_5)
			end

			if arg_67_1.time_ >= var_70_1 + var_70_4 and arg_67_1.time_ < var_70_1 + var_70_4 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_70_7 = arg_67_1.actors_["1060"]
			local var_70_8 = 0

			if var_70_8 < arg_67_1.time_ and arg_67_1.time_ <= var_70_8 + arg_70_0 and arg_67_1.var_.actorSpriteComps1060 == nil then
				arg_67_1.var_.actorSpriteComps1060 = var_70_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_9 = 0.034

			if var_70_8 <= arg_67_1.time_ and arg_67_1.time_ < var_70_8 + var_70_9 then
				local var_70_10 = (arg_67_1.time_ - var_70_8) / var_70_9

				if arg_67_1.var_.actorSpriteComps1060 then
					for iter_70_1, iter_70_2 in pairs(arg_67_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_70_2 then
							local var_70_11 = Mathf.Lerp(iter_70_2.color.r, 1, var_70_10)

							iter_70_2.color = Color.New(var_70_11, var_70_11, var_70_11)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_8 + var_70_9 and arg_67_1.time_ < var_70_8 + var_70_9 + arg_70_0 and arg_67_1.var_.actorSpriteComps1060 then
				local var_70_12 = 1

				for iter_70_3, iter_70_4 in pairs(arg_67_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_70_4 then
						iter_70_4.color = Color.New(var_70_12, var_70_12, var_70_12)
					end
				end

				arg_67_1.var_.actorSpriteComps1060 = nil
			end

			local var_70_13 = 0
			local var_70_14 = 0.725

			if var_70_13 < arg_67_1.time_ and arg_67_1.time_ <= var_70_13 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_15 = arg_67_1:FormatText(StoryNameCfg[584].name)

				arg_67_1.leftNameTxt_.text = var_70_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_16 = arg_67_1:GetWordFromCfg(410012017)
				local var_70_17 = arg_67_1:FormatText(var_70_16.content)

				arg_67_1.text_.text = var_70_17

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_18 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012017", "story_v_out_410012.awb") ~= 0 then
					local var_70_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012017", "story_v_out_410012.awb") / 1000

					if var_70_21 + var_70_13 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_21 + var_70_13
					end

					if var_70_16.prefab_name ~= "" and arg_67_1.actors_[var_70_16.prefab_name] ~= nil then
						local var_70_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_16.prefab_name].transform, "story_v_out_410012", "410012017", "story_v_out_410012.awb")

						arg_67_1:RecordAudio("410012017", var_70_22)
						arg_67_1:RecordAudio("410012017", var_70_22)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_410012", "410012017", "story_v_out_410012.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_410012", "410012017", "story_v_out_410012.awb")
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
	Play410012018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 410012018
		arg_71_1.duration_ = 11.666

		local var_71_0 = {
			zh = 7.233,
			ja = 11.666
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
				arg_71_0:Play410012019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1060"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1060 = var_74_0.localPosition
				var_74_0.localScale = Vector3.New(1, 1, 1)

				arg_71_1:CheckSpriteTmpPos("1060", 3)

				local var_74_2 = var_74_0.childCount

				for iter_74_0 = 0, var_74_2 - 1 do
					local var_74_3 = var_74_0:GetChild(iter_74_0)

					if var_74_3.name == "" or not string.find(var_74_3.name, "split") then
						var_74_3.gameObject:SetActive(true)
					else
						var_74_3.gameObject:SetActive(false)
					end
				end
			end

			local var_74_4 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_4 then
				local var_74_5 = (arg_71_1.time_ - var_74_1) / var_74_4
				local var_74_6 = Vector3.New(0, -435, -40)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1060, var_74_6, var_74_5)
			end

			if arg_71_1.time_ >= var_74_1 + var_74_4 and arg_71_1.time_ < var_74_1 + var_74_4 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_74_7 = arg_71_1.actors_["1060"]
			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 and arg_71_1.var_.actorSpriteComps1060 == nil then
				arg_71_1.var_.actorSpriteComps1060 = var_74_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_9 = 0.034

			if var_74_8 <= arg_71_1.time_ and arg_71_1.time_ < var_74_8 + var_74_9 then
				local var_74_10 = (arg_71_1.time_ - var_74_8) / var_74_9

				if arg_71_1.var_.actorSpriteComps1060 then
					for iter_74_1, iter_74_2 in pairs(arg_71_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_74_2 then
							local var_74_11 = Mathf.Lerp(iter_74_2.color.r, 1, var_74_10)

							iter_74_2.color = Color.New(var_74_11, var_74_11, var_74_11)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_8 + var_74_9 and arg_71_1.time_ < var_74_8 + var_74_9 + arg_74_0 and arg_71_1.var_.actorSpriteComps1060 then
				local var_74_12 = 1

				for iter_74_3, iter_74_4 in pairs(arg_71_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_74_4 then
						iter_74_4.color = Color.New(var_74_12, var_74_12, var_74_12)
					end
				end

				arg_71_1.var_.actorSpriteComps1060 = nil
			end

			local var_74_13 = 0
			local var_74_14 = 0.925

			if var_74_13 < arg_71_1.time_ and arg_71_1.time_ <= var_74_13 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_15 = arg_71_1:FormatText(StoryNameCfg[584].name)

				arg_71_1.leftNameTxt_.text = var_74_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_16 = arg_71_1:GetWordFromCfg(410012018)
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012018", "story_v_out_410012.awb") ~= 0 then
					local var_74_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012018", "story_v_out_410012.awb") / 1000

					if var_74_21 + var_74_13 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_21 + var_74_13
					end

					if var_74_16.prefab_name ~= "" and arg_71_1.actors_[var_74_16.prefab_name] ~= nil then
						local var_74_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_16.prefab_name].transform, "story_v_out_410012", "410012018", "story_v_out_410012.awb")

						arg_71_1:RecordAudio("410012018", var_74_22)
						arg_71_1:RecordAudio("410012018", var_74_22)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_410012", "410012018", "story_v_out_410012.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_410012", "410012018", "story_v_out_410012.awb")
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
	Play410012019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 410012019
		arg_75_1.duration_ = 9.466

		local var_75_0 = {
			zh = 3.5,
			ja = 9.466
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
				arg_75_0:Play410012020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1060"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.actorSpriteComps1060 == nil then
				arg_75_1.var_.actorSpriteComps1060 = var_78_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_2 = 0.034

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.actorSpriteComps1060 then
					for iter_78_0, iter_78_1 in pairs(arg_75_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_78_1 then
							local var_78_4 = Mathf.Lerp(iter_78_1.color.r, 0.5, var_78_3)

							iter_78_1.color = Color.New(var_78_4, var_78_4, var_78_4)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.actorSpriteComps1060 then
				local var_78_5 = 0.5

				for iter_78_2, iter_78_3 in pairs(arg_75_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_78_3 then
						iter_78_3.color = Color.New(var_78_5, var_78_5, var_78_5)
					end
				end

				arg_75_1.var_.actorSpriteComps1060 = nil
			end

			local var_78_6 = 0
			local var_78_7 = 0.275

			if var_78_6 < arg_75_1.time_ and arg_75_1.time_ <= var_78_6 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_8 = arg_75_1:FormatText(StoryNameCfg[589].name)

				arg_75_1.leftNameTxt_.text = var_78_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, true)
				arg_75_1.iconController_:SetSelectedState("hero")

				arg_75_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2083")

				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_9 = arg_75_1:GetWordFromCfg(410012019)
				local var_78_10 = arg_75_1:FormatText(var_78_9.content)

				arg_75_1.text_.text = var_78_10

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_11 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012019", "story_v_out_410012.awb") ~= 0 then
					local var_78_14 = manager.audio:GetVoiceLength("story_v_out_410012", "410012019", "story_v_out_410012.awb") / 1000

					if var_78_14 + var_78_6 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_14 + var_78_6
					end

					if var_78_9.prefab_name ~= "" and arg_75_1.actors_[var_78_9.prefab_name] ~= nil then
						local var_78_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_9.prefab_name].transform, "story_v_out_410012", "410012019", "story_v_out_410012.awb")

						arg_75_1:RecordAudio("410012019", var_78_15)
						arg_75_1:RecordAudio("410012019", var_78_15)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_410012", "410012019", "story_v_out_410012.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_410012", "410012019", "story_v_out_410012.awb")
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
	Play410012020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 410012020
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play410012021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 0.625

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_2 = arg_79_1:GetWordFromCfg(410012020)
				local var_82_3 = arg_79_1:FormatText(var_82_2.content)

				arg_79_1.text_.text = var_82_3

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_4 = 25
				local var_82_5 = utf8.len(var_82_3)
				local var_82_6 = var_82_4 <= 0 and var_82_1 or var_82_1 * (var_82_5 / var_82_4)

				if var_82_6 > 0 and var_82_1 < var_82_6 then
					arg_79_1.talkMaxDuration = var_82_6

					if var_82_6 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_6 + var_82_0
					end
				end

				arg_79_1.text_.text = var_82_3
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_7 = math.max(var_82_1, arg_79_1.talkMaxDuration)

			if var_82_0 <= arg_79_1.time_ and arg_79_1.time_ < var_82_0 + var_82_7 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_0) / var_82_7

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_0 + var_82_7 and arg_79_1.time_ < var_82_0 + var_82_7 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play410012021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 410012021
		arg_83_1.duration_ = 7.166

		local var_83_0 = {
			zh = 2.9,
			ja = 7.166
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
				arg_83_0:Play410012022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 0.35

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_2 = arg_83_1:FormatText(StoryNameCfg[589].name)

				arg_83_1.leftNameTxt_.text = var_86_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, true)
				arg_83_1.iconController_:SetSelectedState("hero")

				arg_83_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2083")

				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_3 = arg_83_1:GetWordFromCfg(410012021)
				local var_86_4 = arg_83_1:FormatText(var_86_3.content)

				arg_83_1.text_.text = var_86_4

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012021", "story_v_out_410012.awb") ~= 0 then
					local var_86_8 = manager.audio:GetVoiceLength("story_v_out_410012", "410012021", "story_v_out_410012.awb") / 1000

					if var_86_8 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_8 + var_86_0
					end

					if var_86_3.prefab_name ~= "" and arg_83_1.actors_[var_86_3.prefab_name] ~= nil then
						local var_86_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_3.prefab_name].transform, "story_v_out_410012", "410012021", "story_v_out_410012.awb")

						arg_83_1:RecordAudio("410012021", var_86_9)
						arg_83_1:RecordAudio("410012021", var_86_9)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_410012", "410012021", "story_v_out_410012.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_410012", "410012021", "story_v_out_410012.awb")
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
	Play410012022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 410012022
		arg_87_1.duration_ = 8.966

		local var_87_0 = {
			zh = 3.4,
			ja = 8.966
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
				arg_87_0:Play410012023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1060"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1060 = var_90_0.localPosition
				var_90_0.localScale = Vector3.New(1, 1, 1)

				arg_87_1:CheckSpriteTmpPos("1060", 3)

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
				local var_90_6 = Vector3.New(0, -435, -40)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1060, var_90_6, var_90_5)
			end

			if arg_87_1.time_ >= var_90_1 + var_90_4 and arg_87_1.time_ < var_90_1 + var_90_4 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0, -435, -40)
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

			local var_90_13 = 0
			local var_90_14 = 0.425

			if var_90_13 < arg_87_1.time_ and arg_87_1.time_ <= var_90_13 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_15 = arg_87_1:FormatText(StoryNameCfg[584].name)

				arg_87_1.leftNameTxt_.text = var_90_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_16 = arg_87_1:GetWordFromCfg(410012022)
				local var_90_17 = arg_87_1:FormatText(var_90_16.content)

				arg_87_1.text_.text = var_90_17

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_18 = 17
				local var_90_19 = utf8.len(var_90_17)
				local var_90_20 = var_90_18 <= 0 and var_90_14 or var_90_14 * (var_90_19 / var_90_18)

				if var_90_20 > 0 and var_90_14 < var_90_20 then
					arg_87_1.talkMaxDuration = var_90_20

					if var_90_20 + var_90_13 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_20 + var_90_13
					end
				end

				arg_87_1.text_.text = var_90_17
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012022", "story_v_out_410012.awb") ~= 0 then
					local var_90_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012022", "story_v_out_410012.awb") / 1000

					if var_90_21 + var_90_13 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_21 + var_90_13
					end

					if var_90_16.prefab_name ~= "" and arg_87_1.actors_[var_90_16.prefab_name] ~= nil then
						local var_90_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_16.prefab_name].transform, "story_v_out_410012", "410012022", "story_v_out_410012.awb")

						arg_87_1:RecordAudio("410012022", var_90_22)
						arg_87_1:RecordAudio("410012022", var_90_22)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_410012", "410012022", "story_v_out_410012.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_410012", "410012022", "story_v_out_410012.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_23 = math.max(var_90_14, arg_87_1.talkMaxDuration)

			if var_90_13 <= arg_87_1.time_ and arg_87_1.time_ < var_90_13 + var_90_23 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_13) / var_90_23

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_13 + var_90_23 and arg_87_1.time_ < var_90_13 + var_90_23 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play410012023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 410012023
		arg_91_1.duration_ = 8.8

		local var_91_0 = {
			zh = 8.633,
			ja = 8.8
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
				arg_91_0:Play410012024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1060"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.actorSpriteComps1060 == nil then
				arg_91_1.var_.actorSpriteComps1060 = var_94_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_2 = 0.034

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.actorSpriteComps1060 then
					for iter_94_0, iter_94_1 in pairs(arg_91_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_94_1 then
							local var_94_4 = Mathf.Lerp(iter_94_1.color.r, 0.5, var_94_3)

							iter_94_1.color = Color.New(var_94_4, var_94_4, var_94_4)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.actorSpriteComps1060 then
				local var_94_5 = 0.5

				for iter_94_2, iter_94_3 in pairs(arg_91_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_94_3 then
						iter_94_3.color = Color.New(var_94_5, var_94_5, var_94_5)
					end
				end

				arg_91_1.var_.actorSpriteComps1060 = nil
			end

			local var_94_6 = 0
			local var_94_7 = 1.075

			if var_94_6 < arg_91_1.time_ and arg_91_1.time_ <= var_94_6 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_8 = arg_91_1:FormatText(StoryNameCfg[589].name)

				arg_91_1.leftNameTxt_.text = var_94_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, true)
				arg_91_1.iconController_:SetSelectedState("hero")

				arg_91_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2083")

				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_9 = arg_91_1:GetWordFromCfg(410012023)
				local var_94_10 = arg_91_1:FormatText(var_94_9.content)

				arg_91_1.text_.text = var_94_10

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_11 = 43
				local var_94_12 = utf8.len(var_94_10)
				local var_94_13 = var_94_11 <= 0 and var_94_7 or var_94_7 * (var_94_12 / var_94_11)

				if var_94_13 > 0 and var_94_7 < var_94_13 then
					arg_91_1.talkMaxDuration = var_94_13

					if var_94_13 + var_94_6 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_13 + var_94_6
					end
				end

				arg_91_1.text_.text = var_94_10
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012023", "story_v_out_410012.awb") ~= 0 then
					local var_94_14 = manager.audio:GetVoiceLength("story_v_out_410012", "410012023", "story_v_out_410012.awb") / 1000

					if var_94_14 + var_94_6 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_14 + var_94_6
					end

					if var_94_9.prefab_name ~= "" and arg_91_1.actors_[var_94_9.prefab_name] ~= nil then
						local var_94_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_9.prefab_name].transform, "story_v_out_410012", "410012023", "story_v_out_410012.awb")

						arg_91_1:RecordAudio("410012023", var_94_15)
						arg_91_1:RecordAudio("410012023", var_94_15)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_410012", "410012023", "story_v_out_410012.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_410012", "410012023", "story_v_out_410012.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_16 = math.max(var_94_7, arg_91_1.talkMaxDuration)

			if var_94_6 <= arg_91_1.time_ and arg_91_1.time_ < var_94_6 + var_94_16 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_6) / var_94_16

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_6 + var_94_16 and arg_91_1.time_ < var_94_6 + var_94_16 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play410012024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 410012024
		arg_95_1.duration_ = 12.3

		local var_95_0 = {
			zh = 7.966,
			ja = 12.3
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
				arg_95_0:Play410012025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 0.925

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_2 = arg_95_1:FormatText(StoryNameCfg[589].name)

				arg_95_1.leftNameTxt_.text = var_98_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, true)
				arg_95_1.iconController_:SetSelectedState("hero")

				arg_95_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2083")

				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_3 = arg_95_1:GetWordFromCfg(410012024)
				local var_98_4 = arg_95_1:FormatText(var_98_3.content)

				arg_95_1.text_.text = var_98_4

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_5 = 37
				local var_98_6 = utf8.len(var_98_4)
				local var_98_7 = var_98_5 <= 0 and var_98_1 or var_98_1 * (var_98_6 / var_98_5)

				if var_98_7 > 0 and var_98_1 < var_98_7 then
					arg_95_1.talkMaxDuration = var_98_7

					if var_98_7 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_7 + var_98_0
					end
				end

				arg_95_1.text_.text = var_98_4
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012024", "story_v_out_410012.awb") ~= 0 then
					local var_98_8 = manager.audio:GetVoiceLength("story_v_out_410012", "410012024", "story_v_out_410012.awb") / 1000

					if var_98_8 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_8 + var_98_0
					end

					if var_98_3.prefab_name ~= "" and arg_95_1.actors_[var_98_3.prefab_name] ~= nil then
						local var_98_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_3.prefab_name].transform, "story_v_out_410012", "410012024", "story_v_out_410012.awb")

						arg_95_1:RecordAudio("410012024", var_98_9)
						arg_95_1:RecordAudio("410012024", var_98_9)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_410012", "410012024", "story_v_out_410012.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_410012", "410012024", "story_v_out_410012.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_10 = math.max(var_98_1, arg_95_1.talkMaxDuration)

			if var_98_0 <= arg_95_1.time_ and arg_95_1.time_ < var_98_0 + var_98_10 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_0) / var_98_10

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_0 + var_98_10 and arg_95_1.time_ < var_98_0 + var_98_10 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play410012025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 410012025
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play410012026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 1.05

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

				local var_102_2 = arg_99_1:GetWordFromCfg(410012025)
				local var_102_3 = arg_99_1:FormatText(var_102_2.content)

				arg_99_1.text_.text = var_102_3

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_4 = 42
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
	Play410012026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 410012026
		arg_103_1.duration_ = 4.933

		local var_103_0 = {
			zh = 3,
			ja = 4.933
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
				arg_103_0:Play410012027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1060"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos1060 = var_106_0.localPosition
				var_106_0.localScale = Vector3.New(1, 1, 1)

				arg_103_1:CheckSpriteTmpPos("1060", 3)

				local var_106_2 = var_106_0.childCount

				for iter_106_0 = 0, var_106_2 - 1 do
					local var_106_3 = var_106_0:GetChild(iter_106_0)

					if var_106_3.name == "" or not string.find(var_106_3.name, "split") then
						var_106_3.gameObject:SetActive(true)
					else
						var_106_3.gameObject:SetActive(false)
					end
				end
			end

			local var_106_4 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_4 then
				local var_106_5 = (arg_103_1.time_ - var_106_1) / var_106_4
				local var_106_6 = Vector3.New(0, -435, -40)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1060, var_106_6, var_106_5)
			end

			if arg_103_1.time_ >= var_106_1 + var_106_4 and arg_103_1.time_ < var_106_1 + var_106_4 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_106_7 = arg_103_1.actors_["1060"]
			local var_106_8 = 0

			if var_106_8 < arg_103_1.time_ and arg_103_1.time_ <= var_106_8 + arg_106_0 and arg_103_1.var_.actorSpriteComps1060 == nil then
				arg_103_1.var_.actorSpriteComps1060 = var_106_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_9 = 0.034

			if var_106_8 <= arg_103_1.time_ and arg_103_1.time_ < var_106_8 + var_106_9 then
				local var_106_10 = (arg_103_1.time_ - var_106_8) / var_106_9

				if arg_103_1.var_.actorSpriteComps1060 then
					for iter_106_1, iter_106_2 in pairs(arg_103_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_106_2 then
							local var_106_11 = Mathf.Lerp(iter_106_2.color.r, 1, var_106_10)

							iter_106_2.color = Color.New(var_106_11, var_106_11, var_106_11)
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_8 + var_106_9 and arg_103_1.time_ < var_106_8 + var_106_9 + arg_106_0 and arg_103_1.var_.actorSpriteComps1060 then
				local var_106_12 = 1

				for iter_106_3, iter_106_4 in pairs(arg_103_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_106_4 then
						iter_106_4.color = Color.New(var_106_12, var_106_12, var_106_12)
					end
				end

				arg_103_1.var_.actorSpriteComps1060 = nil
			end

			local var_106_13 = 0
			local var_106_14 = 0.375

			if var_106_13 < arg_103_1.time_ and arg_103_1.time_ <= var_106_13 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_15 = arg_103_1:FormatText(StoryNameCfg[584].name)

				arg_103_1.leftNameTxt_.text = var_106_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_16 = arg_103_1:GetWordFromCfg(410012026)
				local var_106_17 = arg_103_1:FormatText(var_106_16.content)

				arg_103_1.text_.text = var_106_17

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_18 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012026", "story_v_out_410012.awb") ~= 0 then
					local var_106_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012026", "story_v_out_410012.awb") / 1000

					if var_106_21 + var_106_13 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_21 + var_106_13
					end

					if var_106_16.prefab_name ~= "" and arg_103_1.actors_[var_106_16.prefab_name] ~= nil then
						local var_106_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_16.prefab_name].transform, "story_v_out_410012", "410012026", "story_v_out_410012.awb")

						arg_103_1:RecordAudio("410012026", var_106_22)
						arg_103_1:RecordAudio("410012026", var_106_22)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_410012", "410012026", "story_v_out_410012.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_410012", "410012026", "story_v_out_410012.awb")
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
	Play410012027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 410012027
		arg_107_1.duration_ = 4.2

		local var_107_0 = {
			zh = 1.766,
			ja = 4.2
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
				arg_107_0:Play410012028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1060"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.actorSpriteComps1060 == nil then
				arg_107_1.var_.actorSpriteComps1060 = var_110_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_2 = 0.034

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.actorSpriteComps1060 then
					for iter_110_0, iter_110_1 in pairs(arg_107_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_110_1 then
							local var_110_4 = Mathf.Lerp(iter_110_1.color.r, 0.5, var_110_3)

							iter_110_1.color = Color.New(var_110_4, var_110_4, var_110_4)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.actorSpriteComps1060 then
				local var_110_5 = 0.5

				for iter_110_2, iter_110_3 in pairs(arg_107_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_110_3 then
						iter_110_3.color = Color.New(var_110_5, var_110_5, var_110_5)
					end
				end

				arg_107_1.var_.actorSpriteComps1060 = nil
			end

			local var_110_6 = 0
			local var_110_7 = 0.175

			if var_110_6 < arg_107_1.time_ and arg_107_1.time_ <= var_110_6 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_8 = arg_107_1:FormatText(StoryNameCfg[589].name)

				arg_107_1.leftNameTxt_.text = var_110_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, true)
				arg_107_1.iconController_:SetSelectedState("hero")

				arg_107_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2083")

				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_9 = arg_107_1:GetWordFromCfg(410012027)
				local var_110_10 = arg_107_1:FormatText(var_110_9.content)

				arg_107_1.text_.text = var_110_10

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_11 = 7
				local var_110_12 = utf8.len(var_110_10)
				local var_110_13 = var_110_11 <= 0 and var_110_7 or var_110_7 * (var_110_12 / var_110_11)

				if var_110_13 > 0 and var_110_7 < var_110_13 then
					arg_107_1.talkMaxDuration = var_110_13

					if var_110_13 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_13 + var_110_6
					end
				end

				arg_107_1.text_.text = var_110_10
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012027", "story_v_out_410012.awb") ~= 0 then
					local var_110_14 = manager.audio:GetVoiceLength("story_v_out_410012", "410012027", "story_v_out_410012.awb") / 1000

					if var_110_14 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_14 + var_110_6
					end

					if var_110_9.prefab_name ~= "" and arg_107_1.actors_[var_110_9.prefab_name] ~= nil then
						local var_110_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_9.prefab_name].transform, "story_v_out_410012", "410012027", "story_v_out_410012.awb")

						arg_107_1:RecordAudio("410012027", var_110_15)
						arg_107_1:RecordAudio("410012027", var_110_15)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_410012", "410012027", "story_v_out_410012.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_410012", "410012027", "story_v_out_410012.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_16 = math.max(var_110_7, arg_107_1.talkMaxDuration)

			if var_110_6 <= arg_107_1.time_ and arg_107_1.time_ < var_110_6 + var_110_16 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_6) / var_110_16

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_6 + var_110_16 and arg_107_1.time_ < var_110_6 + var_110_16 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play410012028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 410012028
		arg_111_1.duration_ = 11.433

		local var_111_0 = {
			zh = 9.633,
			ja = 11.433
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
				arg_111_0:Play410012029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = "ST65"

			if arg_111_1.bgs_[var_114_0] == nil then
				local var_114_1 = Object.Instantiate(arg_111_1.paintGo_)

				var_114_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_114_0)
				var_114_1.name = var_114_0
				var_114_1.transform.parent = arg_111_1.stage_.transform
				var_114_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_111_1.bgs_[var_114_0] = var_114_1
			end

			local var_114_2 = 2

			if var_114_2 < arg_111_1.time_ and arg_111_1.time_ <= var_114_2 + arg_114_0 then
				local var_114_3 = manager.ui.mainCamera.transform.localPosition
				local var_114_4 = Vector3.New(0, 0, 10) + Vector3.New(var_114_3.x, var_114_3.y, 0)
				local var_114_5 = arg_111_1.bgs_.ST65

				var_114_5.transform.localPosition = var_114_4
				var_114_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_114_6 = var_114_5:GetComponent("SpriteRenderer")

				if var_114_6 and var_114_6.sprite then
					local var_114_7 = (var_114_5.transform.localPosition - var_114_3).z
					local var_114_8 = manager.ui.mainCameraCom_
					local var_114_9 = 2 * var_114_7 * Mathf.Tan(var_114_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_114_10 = var_114_9 * var_114_8.aspect
					local var_114_11 = var_114_6.sprite.bounds.size.x
					local var_114_12 = var_114_6.sprite.bounds.size.y
					local var_114_13 = var_114_10 / var_114_11
					local var_114_14 = var_114_9 / var_114_12
					local var_114_15 = var_114_14 < var_114_13 and var_114_13 or var_114_14

					var_114_5.transform.localScale = Vector3.New(var_114_15, var_114_15, 0)
				end

				for iter_114_0, iter_114_1 in pairs(arg_111_1.bgs_) do
					if iter_114_0 ~= "ST65" then
						iter_114_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_114_16 = 0

			if var_114_16 < arg_111_1.time_ and arg_111_1.time_ <= var_114_16 + arg_114_0 then
				arg_111_1.mask_.enabled = true
				arg_111_1.mask_.raycastTarget = true

				arg_111_1:SetGaussion(false)
			end

			local var_114_17 = 2

			if var_114_16 <= arg_111_1.time_ and arg_111_1.time_ < var_114_16 + var_114_17 then
				local var_114_18 = (arg_111_1.time_ - var_114_16) / var_114_17
				local var_114_19 = Color.New(0, 0, 0)

				var_114_19.a = Mathf.Lerp(0, 1, var_114_18)
				arg_111_1.mask_.color = var_114_19
			end

			if arg_111_1.time_ >= var_114_16 + var_114_17 and arg_111_1.time_ < var_114_16 + var_114_17 + arg_114_0 then
				local var_114_20 = Color.New(0, 0, 0)

				var_114_20.a = 1
				arg_111_1.mask_.color = var_114_20
			end

			local var_114_21 = 2

			if var_114_21 < arg_111_1.time_ and arg_111_1.time_ <= var_114_21 + arg_114_0 then
				arg_111_1.mask_.enabled = true
				arg_111_1.mask_.raycastTarget = true

				arg_111_1:SetGaussion(false)
			end

			local var_114_22 = 2

			if var_114_21 <= arg_111_1.time_ and arg_111_1.time_ < var_114_21 + var_114_22 then
				local var_114_23 = (arg_111_1.time_ - var_114_21) / var_114_22
				local var_114_24 = Color.New(0, 0, 0)

				var_114_24.a = Mathf.Lerp(1, 0, var_114_23)
				arg_111_1.mask_.color = var_114_24
			end

			if arg_111_1.time_ >= var_114_21 + var_114_22 and arg_111_1.time_ < var_114_21 + var_114_22 + arg_114_0 then
				local var_114_25 = Color.New(0, 0, 0)
				local var_114_26 = 0

				arg_111_1.mask_.enabled = false
				var_114_25.a = var_114_26
				arg_111_1.mask_.color = var_114_25
			end

			local var_114_27 = arg_111_1.actors_["1060"].transform
			local var_114_28 = 2

			if var_114_28 < arg_111_1.time_ and arg_111_1.time_ <= var_114_28 + arg_114_0 then
				arg_111_1.var_.moveOldPos1060 = var_114_27.localPosition
				var_114_27.localScale = Vector3.New(1, 1, 1)

				arg_111_1:CheckSpriteTmpPos("1060", 7)

				local var_114_29 = var_114_27.childCount

				for iter_114_2 = 0, var_114_29 - 1 do
					local var_114_30 = var_114_27:GetChild(iter_114_2)

					if var_114_30.name == "" or not string.find(var_114_30.name, "split") then
						var_114_30.gameObject:SetActive(true)
					else
						var_114_30.gameObject:SetActive(false)
					end
				end
			end

			local var_114_31 = 0.001

			if var_114_28 <= arg_111_1.time_ and arg_111_1.time_ < var_114_28 + var_114_31 then
				local var_114_32 = (arg_111_1.time_ - var_114_28) / var_114_31
				local var_114_33 = Vector3.New(0, -2000, -40)

				var_114_27.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1060, var_114_33, var_114_32)
			end

			if arg_111_1.time_ >= var_114_28 + var_114_31 and arg_111_1.time_ < var_114_28 + var_114_31 + arg_114_0 then
				var_114_27.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_114_34 = 4
			local var_114_35 = 1

			if var_114_34 < arg_111_1.time_ and arg_111_1.time_ <= var_114_34 + arg_114_0 then
				local var_114_36 = "play"
				local var_114_37 = "effect"

				arg_111_1:AudioAction(var_114_36, var_114_37, "se_story_128", "se_story_128_cheer", "")
			end

			if arg_111_1.frameCnt_ <= 1 then
				arg_111_1.dialog_:SetActive(false)
			end

			local var_114_38 = 4
			local var_114_39 = 0.775

			if var_114_38 < arg_111_1.time_ and arg_111_1.time_ <= var_114_38 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0

				arg_111_1.dialog_:SetActive(true)

				local var_114_40 = LeanTween.value(arg_111_1.dialog_, 0, 1, 0.3)

				var_114_40:setOnUpdate(LuaHelper.FloatAction(function(arg_115_0)
					arg_111_1.dialogCg_.alpha = arg_115_0
				end))
				var_114_40:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_111_1.dialog_)
					var_114_40:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_111_1.duration_ = arg_111_1.duration_ + 0.3

				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_41 = arg_111_1:FormatText(StoryNameCfg[590].name)

				arg_111_1.leftNameTxt_.text = var_114_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, true)
				arg_111_1.iconController_:SetSelectedState("hero")

				arg_111_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenma")

				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_42 = arg_111_1:GetWordFromCfg(410012028)
				local var_114_43 = arg_111_1:FormatText(var_114_42.content)

				arg_111_1.text_.text = var_114_43

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_44 = 30
				local var_114_45 = utf8.len(var_114_43)
				local var_114_46 = var_114_44 <= 0 and var_114_39 or var_114_39 * (var_114_45 / var_114_44)

				if var_114_46 > 0 and var_114_39 < var_114_46 then
					arg_111_1.talkMaxDuration = var_114_46
					var_114_38 = var_114_38 + 0.3

					if var_114_46 + var_114_38 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_46 + var_114_38
					end
				end

				arg_111_1.text_.text = var_114_43
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012028", "story_v_out_410012.awb") ~= 0 then
					local var_114_47 = manager.audio:GetVoiceLength("story_v_out_410012", "410012028", "story_v_out_410012.awb") / 1000

					if var_114_47 + var_114_38 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_47 + var_114_38
					end

					if var_114_42.prefab_name ~= "" and arg_111_1.actors_[var_114_42.prefab_name] ~= nil then
						local var_114_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_42.prefab_name].transform, "story_v_out_410012", "410012028", "story_v_out_410012.awb")

						arg_111_1:RecordAudio("410012028", var_114_48)
						arg_111_1:RecordAudio("410012028", var_114_48)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_410012", "410012028", "story_v_out_410012.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_410012", "410012028", "story_v_out_410012.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_49 = var_114_38 + 0.3
			local var_114_50 = math.max(var_114_39, arg_111_1.talkMaxDuration)

			if var_114_49 <= arg_111_1.time_ and arg_111_1.time_ < var_114_49 + var_114_50 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_49) / var_114_50

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_49 + var_114_50 and arg_111_1.time_ < var_114_49 + var_114_50 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play410012029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 410012029
		arg_117_1.duration_ = 5

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play410012030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0
			local var_120_1 = 1.275

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, false)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_2 = arg_117_1:GetWordFromCfg(410012029)
				local var_120_3 = arg_117_1:FormatText(var_120_2.content)

				arg_117_1.text_.text = var_120_3

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_4 = 51
				local var_120_5 = utf8.len(var_120_3)
				local var_120_6 = var_120_4 <= 0 and var_120_1 or var_120_1 * (var_120_5 / var_120_4)

				if var_120_6 > 0 and var_120_1 < var_120_6 then
					arg_117_1.talkMaxDuration = var_120_6

					if var_120_6 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_6 + var_120_0
					end
				end

				arg_117_1.text_.text = var_120_3
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_7 = math.max(var_120_1, arg_117_1.talkMaxDuration)

			if var_120_0 <= arg_117_1.time_ and arg_117_1.time_ < var_120_0 + var_120_7 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_0) / var_120_7

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_0 + var_120_7 and arg_117_1.time_ < var_120_0 + var_120_7 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play410012030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 410012030
		arg_121_1.duration_ = 2.9

		local var_121_0 = {
			zh = 2.9,
			ja = 1.8
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
				arg_121_0:Play410012031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1060"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos1060 = var_124_0.localPosition
				var_124_0.localScale = Vector3.New(1, 1, 1)

				arg_121_1:CheckSpriteTmpPos("1060", 3)

				local var_124_2 = var_124_0.childCount

				for iter_124_0 = 0, var_124_2 - 1 do
					local var_124_3 = var_124_0:GetChild(iter_124_0)

					if var_124_3.name == "" or not string.find(var_124_3.name, "split") then
						var_124_3.gameObject:SetActive(true)
					else
						var_124_3.gameObject:SetActive(false)
					end
				end
			end

			local var_124_4 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_4 then
				local var_124_5 = (arg_121_1.time_ - var_124_1) / var_124_4
				local var_124_6 = Vector3.New(0, -435, -40)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1060, var_124_6, var_124_5)
			end

			if arg_121_1.time_ >= var_124_1 + var_124_4 and arg_121_1.time_ < var_124_1 + var_124_4 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(0, -435, -40)
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

			local var_124_13 = 0
			local var_124_14 = 0.15

			if var_124_13 < arg_121_1.time_ and arg_121_1.time_ <= var_124_13 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_15 = arg_121_1:FormatText(StoryNameCfg[584].name)

				arg_121_1.leftNameTxt_.text = var_124_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_16 = arg_121_1:GetWordFromCfg(410012030)
				local var_124_17 = arg_121_1:FormatText(var_124_16.content)

				arg_121_1.text_.text = var_124_17

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_18 = 6
				local var_124_19 = utf8.len(var_124_17)
				local var_124_20 = var_124_18 <= 0 and var_124_14 or var_124_14 * (var_124_19 / var_124_18)

				if var_124_20 > 0 and var_124_14 < var_124_20 then
					arg_121_1.talkMaxDuration = var_124_20

					if var_124_20 + var_124_13 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_20 + var_124_13
					end
				end

				arg_121_1.text_.text = var_124_17
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012030", "story_v_out_410012.awb") ~= 0 then
					local var_124_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012030", "story_v_out_410012.awb") / 1000

					if var_124_21 + var_124_13 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_21 + var_124_13
					end

					if var_124_16.prefab_name ~= "" and arg_121_1.actors_[var_124_16.prefab_name] ~= nil then
						local var_124_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_16.prefab_name].transform, "story_v_out_410012", "410012030", "story_v_out_410012.awb")

						arg_121_1:RecordAudio("410012030", var_124_22)
						arg_121_1:RecordAudio("410012030", var_124_22)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_410012", "410012030", "story_v_out_410012.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_410012", "410012030", "story_v_out_410012.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_23 = math.max(var_124_14, arg_121_1.talkMaxDuration)

			if var_124_13 <= arg_121_1.time_ and arg_121_1.time_ < var_124_13 + var_124_23 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_13) / var_124_23

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_13 + var_124_23 and arg_121_1.time_ < var_124_13 + var_124_23 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play410012031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 410012031
		arg_125_1.duration_ = 13.8

		local var_125_0 = {
			zh = 7.2,
			ja = 13.8
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
				arg_125_0:Play410012032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1060"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.actorSpriteComps1060 == nil then
				arg_125_1.var_.actorSpriteComps1060 = var_128_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_128_2 = 0.034

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.actorSpriteComps1060 then
					for iter_128_0, iter_128_1 in pairs(arg_125_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_128_1 then
							local var_128_4 = Mathf.Lerp(iter_128_1.color.r, 0.5, var_128_3)

							iter_128_1.color = Color.New(var_128_4, var_128_4, var_128_4)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.actorSpriteComps1060 then
				local var_128_5 = 0.5

				for iter_128_2, iter_128_3 in pairs(arg_125_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_128_3 then
						iter_128_3.color = Color.New(var_128_5, var_128_5, var_128_5)
					end
				end

				arg_125_1.var_.actorSpriteComps1060 = nil
			end

			local var_128_6 = 0
			local var_128_7 = 0.75

			if var_128_6 < arg_125_1.time_ and arg_125_1.time_ <= var_128_6 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_8 = arg_125_1:FormatText(StoryNameCfg[590].name)

				arg_125_1.leftNameTxt_.text = var_128_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, true)
				arg_125_1.iconController_:SetSelectedState("hero")

				arg_125_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenma")

				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_9 = arg_125_1:GetWordFromCfg(410012031)
				local var_128_10 = arg_125_1:FormatText(var_128_9.content)

				arg_125_1.text_.text = var_128_10

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_11 = 30
				local var_128_12 = utf8.len(var_128_10)
				local var_128_13 = var_128_11 <= 0 and var_128_7 or var_128_7 * (var_128_12 / var_128_11)

				if var_128_13 > 0 and var_128_7 < var_128_13 then
					arg_125_1.talkMaxDuration = var_128_13

					if var_128_13 + var_128_6 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_13 + var_128_6
					end
				end

				arg_125_1.text_.text = var_128_10
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012031", "story_v_out_410012.awb") ~= 0 then
					local var_128_14 = manager.audio:GetVoiceLength("story_v_out_410012", "410012031", "story_v_out_410012.awb") / 1000

					if var_128_14 + var_128_6 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_14 + var_128_6
					end

					if var_128_9.prefab_name ~= "" and arg_125_1.actors_[var_128_9.prefab_name] ~= nil then
						local var_128_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_9.prefab_name].transform, "story_v_out_410012", "410012031", "story_v_out_410012.awb")

						arg_125_1:RecordAudio("410012031", var_128_15)
						arg_125_1:RecordAudio("410012031", var_128_15)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_410012", "410012031", "story_v_out_410012.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_410012", "410012031", "story_v_out_410012.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_16 = math.max(var_128_7, arg_125_1.talkMaxDuration)

			if var_128_6 <= arg_125_1.time_ and arg_125_1.time_ < var_128_6 + var_128_16 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_6) / var_128_16

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_6 + var_128_16 and arg_125_1.time_ < var_128_6 + var_128_16 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play410012032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 410012032
		arg_129_1.duration_ = 3.533

		local var_129_0 = {
			zh = 3.533,
			ja = 3.5
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
				arg_129_0:Play410012033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1060"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos1060 = var_132_0.localPosition
				var_132_0.localScale = Vector3.New(1, 1, 1)

				arg_129_1:CheckSpriteTmpPos("1060", 3)

				local var_132_2 = var_132_0.childCount

				for iter_132_0 = 0, var_132_2 - 1 do
					local var_132_3 = var_132_0:GetChild(iter_132_0)

					if var_132_3.name == "" or not string.find(var_132_3.name, "split") then
						var_132_3.gameObject:SetActive(true)
					else
						var_132_3.gameObject:SetActive(false)
					end
				end
			end

			local var_132_4 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_4 then
				local var_132_5 = (arg_129_1.time_ - var_132_1) / var_132_4
				local var_132_6 = Vector3.New(0, -435, -40)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1060, var_132_6, var_132_5)
			end

			if arg_129_1.time_ >= var_132_1 + var_132_4 and arg_129_1.time_ < var_132_1 + var_132_4 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_132_7 = arg_129_1.actors_["1060"]
			local var_132_8 = 0

			if var_132_8 < arg_129_1.time_ and arg_129_1.time_ <= var_132_8 + arg_132_0 and arg_129_1.var_.actorSpriteComps1060 == nil then
				arg_129_1.var_.actorSpriteComps1060 = var_132_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_132_9 = 0.034

			if var_132_8 <= arg_129_1.time_ and arg_129_1.time_ < var_132_8 + var_132_9 then
				local var_132_10 = (arg_129_1.time_ - var_132_8) / var_132_9

				if arg_129_1.var_.actorSpriteComps1060 then
					for iter_132_1, iter_132_2 in pairs(arg_129_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_132_2 then
							local var_132_11 = Mathf.Lerp(iter_132_2.color.r, 1, var_132_10)

							iter_132_2.color = Color.New(var_132_11, var_132_11, var_132_11)
						end
					end
				end
			end

			if arg_129_1.time_ >= var_132_8 + var_132_9 and arg_129_1.time_ < var_132_8 + var_132_9 + arg_132_0 and arg_129_1.var_.actorSpriteComps1060 then
				local var_132_12 = 1

				for iter_132_3, iter_132_4 in pairs(arg_129_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_132_4 then
						iter_132_4.color = Color.New(var_132_12, var_132_12, var_132_12)
					end
				end

				arg_129_1.var_.actorSpriteComps1060 = nil
			end

			local var_132_13 = 0
			local var_132_14 = 0.325

			if var_132_13 < arg_129_1.time_ and arg_129_1.time_ <= var_132_13 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_15 = arg_129_1:FormatText(StoryNameCfg[584].name)

				arg_129_1.leftNameTxt_.text = var_132_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_16 = arg_129_1:GetWordFromCfg(410012032)
				local var_132_17 = arg_129_1:FormatText(var_132_16.content)

				arg_129_1.text_.text = var_132_17

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_18 = 13
				local var_132_19 = utf8.len(var_132_17)
				local var_132_20 = var_132_18 <= 0 and var_132_14 or var_132_14 * (var_132_19 / var_132_18)

				if var_132_20 > 0 and var_132_14 < var_132_20 then
					arg_129_1.talkMaxDuration = var_132_20

					if var_132_20 + var_132_13 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_20 + var_132_13
					end
				end

				arg_129_1.text_.text = var_132_17
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012032", "story_v_out_410012.awb") ~= 0 then
					local var_132_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012032", "story_v_out_410012.awb") / 1000

					if var_132_21 + var_132_13 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_21 + var_132_13
					end

					if var_132_16.prefab_name ~= "" and arg_129_1.actors_[var_132_16.prefab_name] ~= nil then
						local var_132_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_16.prefab_name].transform, "story_v_out_410012", "410012032", "story_v_out_410012.awb")

						arg_129_1:RecordAudio("410012032", var_132_22)
						arg_129_1:RecordAudio("410012032", var_132_22)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_410012", "410012032", "story_v_out_410012.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_410012", "410012032", "story_v_out_410012.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_23 = math.max(var_132_14, arg_129_1.talkMaxDuration)

			if var_132_13 <= arg_129_1.time_ and arg_129_1.time_ < var_132_13 + var_132_23 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_13) / var_132_23

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_13 + var_132_23 and arg_129_1.time_ < var_132_13 + var_132_23 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play410012033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 410012033
		arg_133_1.duration_ = 10.033

		local var_133_0 = {
			zh = 4.166,
			ja = 10.033
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
				arg_133_0:Play410012034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0
			local var_136_1 = 0.4

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_2 = arg_133_1:FormatText(StoryNameCfg[590].name)

				arg_133_1.leftNameTxt_.text = var_136_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, true)
				arg_133_1.iconController_:SetSelectedState("hero")

				arg_133_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenma")

				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_3 = arg_133_1:GetWordFromCfg(410012033)
				local var_136_4 = arg_133_1:FormatText(var_136_3.content)

				arg_133_1.text_.text = var_136_4

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012033", "story_v_out_410012.awb") ~= 0 then
					local var_136_8 = manager.audio:GetVoiceLength("story_v_out_410012", "410012033", "story_v_out_410012.awb") / 1000

					if var_136_8 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_8 + var_136_0
					end

					if var_136_3.prefab_name ~= "" and arg_133_1.actors_[var_136_3.prefab_name] ~= nil then
						local var_136_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_3.prefab_name].transform, "story_v_out_410012", "410012033", "story_v_out_410012.awb")

						arg_133_1:RecordAudio("410012033", var_136_9)
						arg_133_1:RecordAudio("410012033", var_136_9)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_410012", "410012033", "story_v_out_410012.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_410012", "410012033", "story_v_out_410012.awb")
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
	Play410012034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 410012034
		arg_137_1.duration_ = 4.766

		local var_137_0 = {
			zh = 4.366,
			ja = 4.766
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
				arg_137_0:Play410012035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = "10061"

			if arg_137_1.actors_[var_140_0] == nil then
				local var_140_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_140_0), arg_137_1.canvasGo_.transform)

				var_140_1.transform:SetSiblingIndex(1)

				var_140_1.name = var_140_0
				var_140_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_137_1.actors_[var_140_0] = var_140_1
			end

			local var_140_2 = arg_137_1.actors_["10061"].transform
			local var_140_3 = 0

			if var_140_3 < arg_137_1.time_ and arg_137_1.time_ <= var_140_3 + arg_140_0 then
				arg_137_1.var_.moveOldPos10061 = var_140_2.localPosition
				var_140_2.localScale = Vector3.New(1, 1, 1)

				arg_137_1:CheckSpriteTmpPos("10061", 3)

				local var_140_4 = var_140_2.childCount

				for iter_140_0 = 0, var_140_4 - 1 do
					local var_140_5 = var_140_2:GetChild(iter_140_0)

					if var_140_5.name == "" or not string.find(var_140_5.name, "split") then
						var_140_5.gameObject:SetActive(true)
					else
						var_140_5.gameObject:SetActive(false)
					end
				end
			end

			local var_140_6 = 0.001

			if var_140_3 <= arg_137_1.time_ and arg_137_1.time_ < var_140_3 + var_140_6 then
				local var_140_7 = (arg_137_1.time_ - var_140_3) / var_140_6
				local var_140_8 = Vector3.New(0, -517.5, -100)

				var_140_2.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos10061, var_140_8, var_140_7)
			end

			if arg_137_1.time_ >= var_140_3 + var_140_6 and arg_137_1.time_ < var_140_3 + var_140_6 + arg_140_0 then
				var_140_2.localPosition = Vector3.New(0, -517.5, -100)
			end

			local var_140_9 = arg_137_1.actors_["10061"]
			local var_140_10 = 0

			if var_140_10 < arg_137_1.time_ and arg_137_1.time_ <= var_140_10 + arg_140_0 and arg_137_1.var_.actorSpriteComps10061 == nil then
				arg_137_1.var_.actorSpriteComps10061 = var_140_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_140_11 = 0.034

			if var_140_10 <= arg_137_1.time_ and arg_137_1.time_ < var_140_10 + var_140_11 then
				local var_140_12 = (arg_137_1.time_ - var_140_10) / var_140_11

				if arg_137_1.var_.actorSpriteComps10061 then
					for iter_140_1, iter_140_2 in pairs(arg_137_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_140_2 then
							local var_140_13 = Mathf.Lerp(iter_140_2.color.r, 1, var_140_12)

							iter_140_2.color = Color.New(var_140_13, var_140_13, var_140_13)
						end
					end
				end
			end

			if arg_137_1.time_ >= var_140_10 + var_140_11 and arg_137_1.time_ < var_140_10 + var_140_11 + arg_140_0 and arg_137_1.var_.actorSpriteComps10061 then
				local var_140_14 = 1

				for iter_140_3, iter_140_4 in pairs(arg_137_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_140_4 then
						iter_140_4.color = Color.New(var_140_14, var_140_14, var_140_14)
					end
				end

				arg_137_1.var_.actorSpriteComps10061 = nil
			end

			local var_140_15 = 0
			local var_140_16 = 0.05

			if var_140_15 < arg_137_1.time_ and arg_137_1.time_ <= var_140_15 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_17 = arg_137_1:FormatText(StoryNameCfg[591].name)

				arg_137_1.leftNameTxt_.text = var_140_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_18 = arg_137_1:GetWordFromCfg(410012034)
				local var_140_19 = arg_137_1:FormatText(var_140_18.content)

				arg_137_1.text_.text = var_140_19

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_20 = 2
				local var_140_21 = utf8.len(var_140_19)
				local var_140_22 = var_140_20 <= 0 and var_140_16 or var_140_16 * (var_140_21 / var_140_20)

				if var_140_22 > 0 and var_140_16 < var_140_22 then
					arg_137_1.talkMaxDuration = var_140_22

					if var_140_22 + var_140_15 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_22 + var_140_15
					end
				end

				arg_137_1.text_.text = var_140_19
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012034", "story_v_out_410012.awb") ~= 0 then
					local var_140_23 = manager.audio:GetVoiceLength("story_v_out_410012", "410012034", "story_v_out_410012.awb") / 1000

					if var_140_23 + var_140_15 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_23 + var_140_15
					end

					if var_140_18.prefab_name ~= "" and arg_137_1.actors_[var_140_18.prefab_name] ~= nil then
						local var_140_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_18.prefab_name].transform, "story_v_out_410012", "410012034", "story_v_out_410012.awb")

						arg_137_1:RecordAudio("410012034", var_140_24)
						arg_137_1:RecordAudio("410012034", var_140_24)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_410012", "410012034", "story_v_out_410012.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_410012", "410012034", "story_v_out_410012.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_25 = math.max(var_140_16, arg_137_1.talkMaxDuration)

			if var_140_15 <= arg_137_1.time_ and arg_137_1.time_ < var_140_15 + var_140_25 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_15) / var_140_25

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_15 + var_140_25 and arg_137_1.time_ < var_140_15 + var_140_25 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play410012035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 410012035
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play410012036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["10061"].transform
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos10061 = var_144_0.localPosition
				var_144_0.localScale = Vector3.New(1, 1, 1)

				arg_141_1:CheckSpriteTmpPos("10061", 7)

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
				local var_144_6 = Vector3.New(0, -2000, -100)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos10061, var_144_6, var_144_5)
			end

			if arg_141_1.time_ >= var_144_1 + var_144_4 and arg_141_1.time_ < var_144_1 + var_144_4 + arg_144_0 then
				var_144_0.localPosition = Vector3.New(0, -2000, -100)
			end

			local var_144_7 = arg_141_1.actors_["10061"]
			local var_144_8 = 0

			if var_144_8 < arg_141_1.time_ and arg_141_1.time_ <= var_144_8 + arg_144_0 and arg_141_1.var_.actorSpriteComps10061 == nil then
				arg_141_1.var_.actorSpriteComps10061 = var_144_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_144_9 = 0.034

			if var_144_8 <= arg_141_1.time_ and arg_141_1.time_ < var_144_8 + var_144_9 then
				local var_144_10 = (arg_141_1.time_ - var_144_8) / var_144_9

				if arg_141_1.var_.actorSpriteComps10061 then
					for iter_144_1, iter_144_2 in pairs(arg_141_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_144_2 then
							local var_144_11 = Mathf.Lerp(iter_144_2.color.r, 0.5, var_144_10)

							iter_144_2.color = Color.New(var_144_11, var_144_11, var_144_11)
						end
					end
				end
			end

			if arg_141_1.time_ >= var_144_8 + var_144_9 and arg_141_1.time_ < var_144_8 + var_144_9 + arg_144_0 and arg_141_1.var_.actorSpriteComps10061 then
				local var_144_12 = 0.5

				for iter_144_3, iter_144_4 in pairs(arg_141_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_144_4 then
						iter_144_4.color = Color.New(var_144_12, var_144_12, var_144_12)
					end
				end

				arg_141_1.var_.actorSpriteComps10061 = nil
			end

			local var_144_13 = 0
			local var_144_14 = 1.25

			if var_144_13 < arg_141_1.time_ and arg_141_1.time_ <= var_144_13 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, false)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_15 = arg_141_1:GetWordFromCfg(410012035)
				local var_144_16 = arg_141_1:FormatText(var_144_15.content)

				arg_141_1.text_.text = var_144_16

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_17 = 50
				local var_144_18 = utf8.len(var_144_16)
				local var_144_19 = var_144_17 <= 0 and var_144_14 or var_144_14 * (var_144_18 / var_144_17)

				if var_144_19 > 0 and var_144_14 < var_144_19 then
					arg_141_1.talkMaxDuration = var_144_19

					if var_144_19 + var_144_13 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_19 + var_144_13
					end
				end

				arg_141_1.text_.text = var_144_16
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)
				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_20 = math.max(var_144_14, arg_141_1.talkMaxDuration)

			if var_144_13 <= arg_141_1.time_ and arg_141_1.time_ < var_144_13 + var_144_20 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_13) / var_144_20

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_13 + var_144_20 and arg_141_1.time_ < var_144_13 + var_144_20 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play410012036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 410012036
		arg_145_1.duration_ = 5

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play410012037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 1.875

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, false)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_2 = arg_145_1:GetWordFromCfg(410012036)
				local var_148_3 = arg_145_1:FormatText(var_148_2.content)

				arg_145_1.text_.text = var_148_3

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_4 = 75
				local var_148_5 = utf8.len(var_148_3)
				local var_148_6 = var_148_4 <= 0 and var_148_1 or var_148_1 * (var_148_5 / var_148_4)

				if var_148_6 > 0 and var_148_1 < var_148_6 then
					arg_145_1.talkMaxDuration = var_148_6

					if var_148_6 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_6 + var_148_0
					end
				end

				arg_145_1.text_.text = var_148_3
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)
				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_7 = math.max(var_148_1, arg_145_1.talkMaxDuration)

			if var_148_0 <= arg_145_1.time_ and arg_145_1.time_ < var_148_0 + var_148_7 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_0) / var_148_7

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_0 + var_148_7 and arg_145_1.time_ < var_148_0 + var_148_7 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play410012037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 410012037
		arg_149_1.duration_ = 20.4

		local var_149_0 = {
			zh = 7.3,
			ja = 20.4
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
				arg_149_0:Play410012038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = "10062"

			if arg_149_1.actors_[var_152_0] == nil then
				local var_152_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_152_0), arg_149_1.canvasGo_.transform)

				var_152_1.transform:SetSiblingIndex(1)

				var_152_1.name = var_152_0
				var_152_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_149_1.actors_[var_152_0] = var_152_1
			end

			local var_152_2 = arg_149_1.actors_["10062"].transform
			local var_152_3 = 0

			if var_152_3 < arg_149_1.time_ and arg_149_1.time_ <= var_152_3 + arg_152_0 then
				arg_149_1.var_.moveOldPos10062 = var_152_2.localPosition
				var_152_2.localScale = Vector3.New(1, 1, 1)

				arg_149_1:CheckSpriteTmpPos("10062", 3)

				local var_152_4 = var_152_2.childCount

				for iter_152_0 = 0, var_152_4 - 1 do
					local var_152_5 = var_152_2:GetChild(iter_152_0)

					if var_152_5.name == "" or not string.find(var_152_5.name, "split") then
						var_152_5.gameObject:SetActive(true)
					else
						var_152_5.gameObject:SetActive(false)
					end
				end
			end

			local var_152_6 = 0.001

			if var_152_3 <= arg_149_1.time_ and arg_149_1.time_ < var_152_3 + var_152_6 then
				local var_152_7 = (arg_149_1.time_ - var_152_3) / var_152_6
				local var_152_8 = Vector3.New(0, -390, -290)

				var_152_2.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos10062, var_152_8, var_152_7)
			end

			if arg_149_1.time_ >= var_152_3 + var_152_6 and arg_149_1.time_ < var_152_3 + var_152_6 + arg_152_0 then
				var_152_2.localPosition = Vector3.New(0, -390, -290)
			end

			local var_152_9 = arg_149_1.actors_["10062"]
			local var_152_10 = 0

			if var_152_10 < arg_149_1.time_ and arg_149_1.time_ <= var_152_10 + arg_152_0 and arg_149_1.var_.actorSpriteComps10062 == nil then
				arg_149_1.var_.actorSpriteComps10062 = var_152_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_152_11 = 0.034

			if var_152_10 <= arg_149_1.time_ and arg_149_1.time_ < var_152_10 + var_152_11 then
				local var_152_12 = (arg_149_1.time_ - var_152_10) / var_152_11

				if arg_149_1.var_.actorSpriteComps10062 then
					for iter_152_1, iter_152_2 in pairs(arg_149_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_152_2 then
							local var_152_13 = Mathf.Lerp(iter_152_2.color.r, 1, var_152_12)

							iter_152_2.color = Color.New(var_152_13, var_152_13, var_152_13)
						end
					end
				end
			end

			if arg_149_1.time_ >= var_152_10 + var_152_11 and arg_149_1.time_ < var_152_10 + var_152_11 + arg_152_0 and arg_149_1.var_.actorSpriteComps10062 then
				local var_152_14 = 1

				for iter_152_3, iter_152_4 in pairs(arg_149_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_152_4 then
						iter_152_4.color = Color.New(var_152_14, var_152_14, var_152_14)
					end
				end

				arg_149_1.var_.actorSpriteComps10062 = nil
			end

			local var_152_15 = 0
			local var_152_16 = 0.725

			if var_152_15 < arg_149_1.time_ and arg_149_1.time_ <= var_152_15 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_17 = arg_149_1:FormatText(StoryNameCfg[592].name)

				arg_149_1.leftNameTxt_.text = var_152_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_18 = arg_149_1:GetWordFromCfg(410012037)
				local var_152_19 = arg_149_1:FormatText(var_152_18.content)

				arg_149_1.text_.text = var_152_19

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_20 = 29
				local var_152_21 = utf8.len(var_152_19)
				local var_152_22 = var_152_20 <= 0 and var_152_16 or var_152_16 * (var_152_21 / var_152_20)

				if var_152_22 > 0 and var_152_16 < var_152_22 then
					arg_149_1.talkMaxDuration = var_152_22

					if var_152_22 + var_152_15 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_22 + var_152_15
					end
				end

				arg_149_1.text_.text = var_152_19
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012037", "story_v_out_410012.awb") ~= 0 then
					local var_152_23 = manager.audio:GetVoiceLength("story_v_out_410012", "410012037", "story_v_out_410012.awb") / 1000

					if var_152_23 + var_152_15 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_23 + var_152_15
					end

					if var_152_18.prefab_name ~= "" and arg_149_1.actors_[var_152_18.prefab_name] ~= nil then
						local var_152_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_18.prefab_name].transform, "story_v_out_410012", "410012037", "story_v_out_410012.awb")

						arg_149_1:RecordAudio("410012037", var_152_24)
						arg_149_1:RecordAudio("410012037", var_152_24)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_410012", "410012037", "story_v_out_410012.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_410012", "410012037", "story_v_out_410012.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_25 = math.max(var_152_16, arg_149_1.talkMaxDuration)

			if var_152_15 <= arg_149_1.time_ and arg_149_1.time_ < var_152_15 + var_152_25 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_15) / var_152_25

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_15 + var_152_25 and arg_149_1.time_ < var_152_15 + var_152_25 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play410012038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 410012038
		arg_153_1.duration_ = 6.133

		local var_153_0 = {
			zh = 1.6,
			ja = 6.133
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
				arg_153_0:Play410012039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["10062"].transform
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 then
				arg_153_1.var_.moveOldPos10062 = var_156_0.localPosition
				var_156_0.localScale = Vector3.New(1, 1, 1)

				arg_153_1:CheckSpriteTmpPos("10062", 3)

				local var_156_2 = var_156_0.childCount

				for iter_156_0 = 0, var_156_2 - 1 do
					local var_156_3 = var_156_0:GetChild(iter_156_0)

					if var_156_3.name == "" or not string.find(var_156_3.name, "split") then
						var_156_3.gameObject:SetActive(true)
					else
						var_156_3.gameObject:SetActive(false)
					end
				end
			end

			local var_156_4 = 0.001

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_4 then
				local var_156_5 = (arg_153_1.time_ - var_156_1) / var_156_4
				local var_156_6 = Vector3.New(0, -390, -290)

				var_156_0.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos10062, var_156_6, var_156_5)
			end

			if arg_153_1.time_ >= var_156_1 + var_156_4 and arg_153_1.time_ < var_156_1 + var_156_4 + arg_156_0 then
				var_156_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_156_7 = arg_153_1.actors_["10062"]
			local var_156_8 = 0

			if var_156_8 < arg_153_1.time_ and arg_153_1.time_ <= var_156_8 + arg_156_0 and arg_153_1.var_.actorSpriteComps10062 == nil then
				arg_153_1.var_.actorSpriteComps10062 = var_156_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_156_9 = 0.034

			if var_156_8 <= arg_153_1.time_ and arg_153_1.time_ < var_156_8 + var_156_9 then
				local var_156_10 = (arg_153_1.time_ - var_156_8) / var_156_9

				if arg_153_1.var_.actorSpriteComps10062 then
					for iter_156_1, iter_156_2 in pairs(arg_153_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_156_2 then
							local var_156_11 = Mathf.Lerp(iter_156_2.color.r, 1, var_156_10)

							iter_156_2.color = Color.New(var_156_11, var_156_11, var_156_11)
						end
					end
				end
			end

			if arg_153_1.time_ >= var_156_8 + var_156_9 and arg_153_1.time_ < var_156_8 + var_156_9 + arg_156_0 and arg_153_1.var_.actorSpriteComps10062 then
				local var_156_12 = 1

				for iter_156_3, iter_156_4 in pairs(arg_153_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_156_4 then
						iter_156_4.color = Color.New(var_156_12, var_156_12, var_156_12)
					end
				end

				arg_153_1.var_.actorSpriteComps10062 = nil
			end

			local var_156_13 = 0
			local var_156_14 = 1

			if var_156_13 < arg_153_1.time_ and arg_153_1.time_ <= var_156_13 + arg_156_0 then
				local var_156_15 = "play"
				local var_156_16 = "effect"

				arg_153_1:AudioAction(var_156_15, var_156_16, "se_story_128", "se_story_128_bell", "")
			end

			local var_156_17 = 0
			local var_156_18 = 0.075

			if var_156_17 < arg_153_1.time_ and arg_153_1.time_ <= var_156_17 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_19 = arg_153_1:FormatText(StoryNameCfg[592].name)

				arg_153_1.leftNameTxt_.text = var_156_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_20 = arg_153_1:GetWordFromCfg(410012038)
				local var_156_21 = arg_153_1:FormatText(var_156_20.content)

				arg_153_1.text_.text = var_156_21

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_22 = 3
				local var_156_23 = utf8.len(var_156_21)
				local var_156_24 = var_156_22 <= 0 and var_156_18 or var_156_18 * (var_156_23 / var_156_22)

				if var_156_24 > 0 and var_156_18 < var_156_24 then
					arg_153_1.talkMaxDuration = var_156_24

					if var_156_24 + var_156_17 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_24 + var_156_17
					end
				end

				arg_153_1.text_.text = var_156_21
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012038", "story_v_out_410012.awb") ~= 0 then
					local var_156_25 = manager.audio:GetVoiceLength("story_v_out_410012", "410012038", "story_v_out_410012.awb") / 1000

					if var_156_25 + var_156_17 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_25 + var_156_17
					end

					if var_156_20.prefab_name ~= "" and arg_153_1.actors_[var_156_20.prefab_name] ~= nil then
						local var_156_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_20.prefab_name].transform, "story_v_out_410012", "410012038", "story_v_out_410012.awb")

						arg_153_1:RecordAudio("410012038", var_156_26)
						arg_153_1:RecordAudio("410012038", var_156_26)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_410012", "410012038", "story_v_out_410012.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_410012", "410012038", "story_v_out_410012.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_27 = math.max(var_156_18, arg_153_1.talkMaxDuration)

			if var_156_17 <= arg_153_1.time_ and arg_153_1.time_ < var_156_17 + var_156_27 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_17) / var_156_27

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_17 + var_156_27 and arg_153_1.time_ < var_156_17 + var_156_27 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play410012039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 410012039
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play410012040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["10062"].transform
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1.var_.moveOldPos10062 = var_160_0.localPosition
				var_160_0.localScale = Vector3.New(1, 1, 1)

				arg_157_1:CheckSpriteTmpPos("10062", 7)

				local var_160_2 = var_160_0.childCount

				for iter_160_0 = 0, var_160_2 - 1 do
					local var_160_3 = var_160_0:GetChild(iter_160_0)

					if var_160_3.name == "" or not string.find(var_160_3.name, "split") then
						var_160_3.gameObject:SetActive(true)
					else
						var_160_3.gameObject:SetActive(false)
					end
				end
			end

			local var_160_4 = 0.001

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_4 then
				local var_160_5 = (arg_157_1.time_ - var_160_1) / var_160_4
				local var_160_6 = Vector3.New(0, -2000, -290)

				var_160_0.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos10062, var_160_6, var_160_5)
			end

			if arg_157_1.time_ >= var_160_1 + var_160_4 and arg_157_1.time_ < var_160_1 + var_160_4 + arg_160_0 then
				var_160_0.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_160_7 = arg_157_1.actors_["10062"]
			local var_160_8 = 0

			if var_160_8 < arg_157_1.time_ and arg_157_1.time_ <= var_160_8 + arg_160_0 and arg_157_1.var_.actorSpriteComps10062 == nil then
				arg_157_1.var_.actorSpriteComps10062 = var_160_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_160_9 = 0.034

			if var_160_8 <= arg_157_1.time_ and arg_157_1.time_ < var_160_8 + var_160_9 then
				local var_160_10 = (arg_157_1.time_ - var_160_8) / var_160_9

				if arg_157_1.var_.actorSpriteComps10062 then
					for iter_160_1, iter_160_2 in pairs(arg_157_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_160_2 then
							local var_160_11 = Mathf.Lerp(iter_160_2.color.r, 0.5, var_160_10)

							iter_160_2.color = Color.New(var_160_11, var_160_11, var_160_11)
						end
					end
				end
			end

			if arg_157_1.time_ >= var_160_8 + var_160_9 and arg_157_1.time_ < var_160_8 + var_160_9 + arg_160_0 and arg_157_1.var_.actorSpriteComps10062 then
				local var_160_12 = 0.5

				for iter_160_3, iter_160_4 in pairs(arg_157_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_160_4 then
						iter_160_4.color = Color.New(var_160_12, var_160_12, var_160_12)
					end
				end

				arg_157_1.var_.actorSpriteComps10062 = nil
			end

			local var_160_13 = 0
			local var_160_14 = 1.125

			if var_160_13 < arg_157_1.time_ and arg_157_1.time_ <= var_160_13 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_15 = arg_157_1:GetWordFromCfg(410012039)
				local var_160_16 = arg_157_1:FormatText(var_160_15.content)

				arg_157_1.text_.text = var_160_16

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_17 = 45
				local var_160_18 = utf8.len(var_160_16)
				local var_160_19 = var_160_17 <= 0 and var_160_14 or var_160_14 * (var_160_18 / var_160_17)

				if var_160_19 > 0 and var_160_14 < var_160_19 then
					arg_157_1.talkMaxDuration = var_160_19

					if var_160_19 + var_160_13 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_19 + var_160_13
					end
				end

				arg_157_1.text_.text = var_160_16
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_20 = math.max(var_160_14, arg_157_1.talkMaxDuration)

			if var_160_13 <= arg_157_1.time_ and arg_157_1.time_ < var_160_13 + var_160_20 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_13) / var_160_20

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_13 + var_160_20 and arg_157_1.time_ < var_160_13 + var_160_20 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play410012040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 410012040
		arg_161_1.duration_ = 5

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play410012041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0
			local var_164_1 = 1.725

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, false)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_2 = arg_161_1:GetWordFromCfg(410012040)
				local var_164_3 = arg_161_1:FormatText(var_164_2.content)

				arg_161_1.text_.text = var_164_3

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_4 = 69
				local var_164_5 = utf8.len(var_164_3)
				local var_164_6 = var_164_4 <= 0 and var_164_1 or var_164_1 * (var_164_5 / var_164_4)

				if var_164_6 > 0 and var_164_1 < var_164_6 then
					arg_161_1.talkMaxDuration = var_164_6

					if var_164_6 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_6 + var_164_0
					end
				end

				arg_161_1.text_.text = var_164_3
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)
				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_7 = math.max(var_164_1, arg_161_1.talkMaxDuration)

			if var_164_0 <= arg_161_1.time_ and arg_161_1.time_ < var_164_0 + var_164_7 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_0) / var_164_7

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_0 + var_164_7 and arg_161_1.time_ < var_164_0 + var_164_7 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play410012041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 410012041
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play410012042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0
			local var_168_1 = 1.375

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, false)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_2 = arg_165_1:GetWordFromCfg(410012041)
				local var_168_3 = arg_165_1:FormatText(var_168_2.content)

				arg_165_1.text_.text = var_168_3

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_4 = 55
				local var_168_5 = utf8.len(var_168_3)
				local var_168_6 = var_168_4 <= 0 and var_168_1 or var_168_1 * (var_168_5 / var_168_4)

				if var_168_6 > 0 and var_168_1 < var_168_6 then
					arg_165_1.talkMaxDuration = var_168_6

					if var_168_6 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_6 + var_168_0
					end
				end

				arg_165_1.text_.text = var_168_3
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_7 = math.max(var_168_1, arg_165_1.talkMaxDuration)

			if var_168_0 <= arg_165_1.time_ and arg_165_1.time_ < var_168_0 + var_168_7 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_0) / var_168_7

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_0 + var_168_7 and arg_165_1.time_ < var_168_0 + var_168_7 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play410012042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 410012042
		arg_169_1.duration_ = 14.1

		local var_169_0 = {
			zh = 14.1,
			ja = 13.2
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
				arg_169_0:Play410012043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1060"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos1060 = var_172_0.localPosition
				var_172_0.localScale = Vector3.New(1, 1, 1)

				arg_169_1:CheckSpriteTmpPos("1060", 3)

				local var_172_2 = var_172_0.childCount

				for iter_172_0 = 0, var_172_2 - 1 do
					local var_172_3 = var_172_0:GetChild(iter_172_0)

					if var_172_3.name == "" or not string.find(var_172_3.name, "split") then
						var_172_3.gameObject:SetActive(true)
					else
						var_172_3.gameObject:SetActive(false)
					end
				end
			end

			local var_172_4 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_4 then
				local var_172_5 = (arg_169_1.time_ - var_172_1) / var_172_4
				local var_172_6 = Vector3.New(0, -435, -40)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1060, var_172_6, var_172_5)
			end

			if arg_169_1.time_ >= var_172_1 + var_172_4 and arg_169_1.time_ < var_172_1 + var_172_4 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_172_7 = arg_169_1.actors_["1060"]
			local var_172_8 = 0

			if var_172_8 < arg_169_1.time_ and arg_169_1.time_ <= var_172_8 + arg_172_0 and arg_169_1.var_.actorSpriteComps1060 == nil then
				arg_169_1.var_.actorSpriteComps1060 = var_172_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_172_9 = 0.034

			if var_172_8 <= arg_169_1.time_ and arg_169_1.time_ < var_172_8 + var_172_9 then
				local var_172_10 = (arg_169_1.time_ - var_172_8) / var_172_9

				if arg_169_1.var_.actorSpriteComps1060 then
					for iter_172_1, iter_172_2 in pairs(arg_169_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_172_2 then
							local var_172_11 = Mathf.Lerp(iter_172_2.color.r, 1, var_172_10)

							iter_172_2.color = Color.New(var_172_11, var_172_11, var_172_11)
						end
					end
				end
			end

			if arg_169_1.time_ >= var_172_8 + var_172_9 and arg_169_1.time_ < var_172_8 + var_172_9 + arg_172_0 and arg_169_1.var_.actorSpriteComps1060 then
				local var_172_12 = 1

				for iter_172_3, iter_172_4 in pairs(arg_169_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_172_4 then
						iter_172_4.color = Color.New(var_172_12, var_172_12, var_172_12)
					end
				end

				arg_169_1.var_.actorSpriteComps1060 = nil
			end

			local var_172_13 = 0
			local var_172_14 = 1.525

			if var_172_13 < arg_169_1.time_ and arg_169_1.time_ <= var_172_13 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_15 = arg_169_1:FormatText(StoryNameCfg[584].name)

				arg_169_1.leftNameTxt_.text = var_172_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_16 = arg_169_1:GetWordFromCfg(410012042)
				local var_172_17 = arg_169_1:FormatText(var_172_16.content)

				arg_169_1.text_.text = var_172_17

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_18 = 61
				local var_172_19 = utf8.len(var_172_17)
				local var_172_20 = var_172_18 <= 0 and var_172_14 or var_172_14 * (var_172_19 / var_172_18)

				if var_172_20 > 0 and var_172_14 < var_172_20 then
					arg_169_1.talkMaxDuration = var_172_20

					if var_172_20 + var_172_13 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_20 + var_172_13
					end
				end

				arg_169_1.text_.text = var_172_17
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012042", "story_v_out_410012.awb") ~= 0 then
					local var_172_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012042", "story_v_out_410012.awb") / 1000

					if var_172_21 + var_172_13 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_21 + var_172_13
					end

					if var_172_16.prefab_name ~= "" and arg_169_1.actors_[var_172_16.prefab_name] ~= nil then
						local var_172_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_16.prefab_name].transform, "story_v_out_410012", "410012042", "story_v_out_410012.awb")

						arg_169_1:RecordAudio("410012042", var_172_22)
						arg_169_1:RecordAudio("410012042", var_172_22)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_410012", "410012042", "story_v_out_410012.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_410012", "410012042", "story_v_out_410012.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_23 = math.max(var_172_14, arg_169_1.talkMaxDuration)

			if var_172_13 <= arg_169_1.time_ and arg_169_1.time_ < var_172_13 + var_172_23 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_13) / var_172_23

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_13 + var_172_23 and arg_169_1.time_ < var_172_13 + var_172_23 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play410012043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 410012043
		arg_173_1.duration_ = 6.6

		local var_173_0 = {
			zh = 4.566,
			ja = 6.6
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
				arg_173_0:Play410012044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1060"].transform
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.var_.moveOldPos1060 = var_176_0.localPosition
				var_176_0.localScale = Vector3.New(1, 1, 1)

				arg_173_1:CheckSpriteTmpPos("1060", 3)

				local var_176_2 = var_176_0.childCount

				for iter_176_0 = 0, var_176_2 - 1 do
					local var_176_3 = var_176_0:GetChild(iter_176_0)

					if var_176_3.name == "" or not string.find(var_176_3.name, "split") then
						var_176_3.gameObject:SetActive(true)
					else
						var_176_3.gameObject:SetActive(false)
					end
				end
			end

			local var_176_4 = 0.001

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_4 then
				local var_176_5 = (arg_173_1.time_ - var_176_1) / var_176_4
				local var_176_6 = Vector3.New(0, -435, -40)

				var_176_0.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1060, var_176_6, var_176_5)
			end

			if arg_173_1.time_ >= var_176_1 + var_176_4 and arg_173_1.time_ < var_176_1 + var_176_4 + arg_176_0 then
				var_176_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_176_7 = arg_173_1.actors_["1060"]
			local var_176_8 = 0

			if var_176_8 < arg_173_1.time_ and arg_173_1.time_ <= var_176_8 + arg_176_0 and arg_173_1.var_.actorSpriteComps1060 == nil then
				arg_173_1.var_.actorSpriteComps1060 = var_176_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_176_9 = 0.034

			if var_176_8 <= arg_173_1.time_ and arg_173_1.time_ < var_176_8 + var_176_9 then
				local var_176_10 = (arg_173_1.time_ - var_176_8) / var_176_9

				if arg_173_1.var_.actorSpriteComps1060 then
					for iter_176_1, iter_176_2 in pairs(arg_173_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_176_2 then
							local var_176_11 = Mathf.Lerp(iter_176_2.color.r, 1, var_176_10)

							iter_176_2.color = Color.New(var_176_11, var_176_11, var_176_11)
						end
					end
				end
			end

			if arg_173_1.time_ >= var_176_8 + var_176_9 and arg_173_1.time_ < var_176_8 + var_176_9 + arg_176_0 and arg_173_1.var_.actorSpriteComps1060 then
				local var_176_12 = 1

				for iter_176_3, iter_176_4 in pairs(arg_173_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_176_4 then
						iter_176_4.color = Color.New(var_176_12, var_176_12, var_176_12)
					end
				end

				arg_173_1.var_.actorSpriteComps1060 = nil
			end

			local var_176_13 = 0
			local var_176_14 = 0.575

			if var_176_13 < arg_173_1.time_ and arg_173_1.time_ <= var_176_13 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_15 = arg_173_1:FormatText(StoryNameCfg[584].name)

				arg_173_1.leftNameTxt_.text = var_176_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_16 = arg_173_1:GetWordFromCfg(410012043)
				local var_176_17 = arg_173_1:FormatText(var_176_16.content)

				arg_173_1.text_.text = var_176_17

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_18 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012043", "story_v_out_410012.awb") ~= 0 then
					local var_176_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012043", "story_v_out_410012.awb") / 1000

					if var_176_21 + var_176_13 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_21 + var_176_13
					end

					if var_176_16.prefab_name ~= "" and arg_173_1.actors_[var_176_16.prefab_name] ~= nil then
						local var_176_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_16.prefab_name].transform, "story_v_out_410012", "410012043", "story_v_out_410012.awb")

						arg_173_1:RecordAudio("410012043", var_176_22)
						arg_173_1:RecordAudio("410012043", var_176_22)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_410012", "410012043", "story_v_out_410012.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_410012", "410012043", "story_v_out_410012.awb")
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
	Play410012044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 410012044
		arg_177_1.duration_ = 5

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play410012045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["1060"]
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 and arg_177_1.var_.actorSpriteComps1060 == nil then
				arg_177_1.var_.actorSpriteComps1060 = var_180_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_180_2 = 0.034

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2

				if arg_177_1.var_.actorSpriteComps1060 then
					for iter_180_0, iter_180_1 in pairs(arg_177_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_180_1 then
							local var_180_4 = Mathf.Lerp(iter_180_1.color.r, 0.5, var_180_3)

							iter_180_1.color = Color.New(var_180_4, var_180_4, var_180_4)
						end
					end
				end
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 and arg_177_1.var_.actorSpriteComps1060 then
				local var_180_5 = 0.5

				for iter_180_2, iter_180_3 in pairs(arg_177_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_180_3 then
						iter_180_3.color = Color.New(var_180_5, var_180_5, var_180_5)
					end
				end

				arg_177_1.var_.actorSpriteComps1060 = nil
			end

			local var_180_6 = 0
			local var_180_7 = 1.2

			if var_180_6 < arg_177_1.time_ and arg_177_1.time_ <= var_180_6 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, false)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_8 = arg_177_1:GetWordFromCfg(410012044)
				local var_180_9 = arg_177_1:FormatText(var_180_8.content)

				arg_177_1.text_.text = var_180_9

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_10 = 48
				local var_180_11 = utf8.len(var_180_9)
				local var_180_12 = var_180_10 <= 0 and var_180_7 or var_180_7 * (var_180_11 / var_180_10)

				if var_180_12 > 0 and var_180_7 < var_180_12 then
					arg_177_1.talkMaxDuration = var_180_12

					if var_180_12 + var_180_6 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_12 + var_180_6
					end
				end

				arg_177_1.text_.text = var_180_9
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)
				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_13 = math.max(var_180_7, arg_177_1.talkMaxDuration)

			if var_180_6 <= arg_177_1.time_ and arg_177_1.time_ < var_180_6 + var_180_13 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_6) / var_180_13

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_6 + var_180_13 and arg_177_1.time_ < var_180_6 + var_180_13 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play410012045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 410012045
		arg_181_1.duration_ = 7.366

		local var_181_0 = {
			zh = 5.133,
			ja = 7.366
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
				arg_181_0:Play410012046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1060"].transform
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 then
				arg_181_1.var_.moveOldPos1060 = var_184_0.localPosition
				var_184_0.localScale = Vector3.New(1, 1, 1)

				arg_181_1:CheckSpriteTmpPos("1060", 3)

				local var_184_2 = var_184_0.childCount

				for iter_184_0 = 0, var_184_2 - 1 do
					local var_184_3 = var_184_0:GetChild(iter_184_0)

					if var_184_3.name == "" or not string.find(var_184_3.name, "split") then
						var_184_3.gameObject:SetActive(true)
					else
						var_184_3.gameObject:SetActive(false)
					end
				end
			end

			local var_184_4 = 0.001

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_4 then
				local var_184_5 = (arg_181_1.time_ - var_184_1) / var_184_4
				local var_184_6 = Vector3.New(0, -435, -40)

				var_184_0.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos1060, var_184_6, var_184_5)
			end

			if arg_181_1.time_ >= var_184_1 + var_184_4 and arg_181_1.time_ < var_184_1 + var_184_4 + arg_184_0 then
				var_184_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_184_7 = arg_181_1.actors_["1060"]
			local var_184_8 = 0

			if var_184_8 < arg_181_1.time_ and arg_181_1.time_ <= var_184_8 + arg_184_0 and arg_181_1.var_.actorSpriteComps1060 == nil then
				arg_181_1.var_.actorSpriteComps1060 = var_184_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_184_9 = 0.034

			if var_184_8 <= arg_181_1.time_ and arg_181_1.time_ < var_184_8 + var_184_9 then
				local var_184_10 = (arg_181_1.time_ - var_184_8) / var_184_9

				if arg_181_1.var_.actorSpriteComps1060 then
					for iter_184_1, iter_184_2 in pairs(arg_181_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_184_2 then
							local var_184_11 = Mathf.Lerp(iter_184_2.color.r, 1, var_184_10)

							iter_184_2.color = Color.New(var_184_11, var_184_11, var_184_11)
						end
					end
				end
			end

			if arg_181_1.time_ >= var_184_8 + var_184_9 and arg_181_1.time_ < var_184_8 + var_184_9 + arg_184_0 and arg_181_1.var_.actorSpriteComps1060 then
				local var_184_12 = 1

				for iter_184_3, iter_184_4 in pairs(arg_181_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_184_4 then
						iter_184_4.color = Color.New(var_184_12, var_184_12, var_184_12)
					end
				end

				arg_181_1.var_.actorSpriteComps1060 = nil
			end

			local var_184_13 = 0
			local var_184_14 = 0.65

			if var_184_13 < arg_181_1.time_ and arg_181_1.time_ <= var_184_13 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_15 = arg_181_1:FormatText(StoryNameCfg[584].name)

				arg_181_1.leftNameTxt_.text = var_184_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_16 = arg_181_1:GetWordFromCfg(410012045)
				local var_184_17 = arg_181_1:FormatText(var_184_16.content)

				arg_181_1.text_.text = var_184_17

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_18 = 26
				local var_184_19 = utf8.len(var_184_17)
				local var_184_20 = var_184_18 <= 0 and var_184_14 or var_184_14 * (var_184_19 / var_184_18)

				if var_184_20 > 0 and var_184_14 < var_184_20 then
					arg_181_1.talkMaxDuration = var_184_20

					if var_184_20 + var_184_13 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_20 + var_184_13
					end
				end

				arg_181_1.text_.text = var_184_17
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012045", "story_v_out_410012.awb") ~= 0 then
					local var_184_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012045", "story_v_out_410012.awb") / 1000

					if var_184_21 + var_184_13 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_21 + var_184_13
					end

					if var_184_16.prefab_name ~= "" and arg_181_1.actors_[var_184_16.prefab_name] ~= nil then
						local var_184_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_16.prefab_name].transform, "story_v_out_410012", "410012045", "story_v_out_410012.awb")

						arg_181_1:RecordAudio("410012045", var_184_22)
						arg_181_1:RecordAudio("410012045", var_184_22)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_410012", "410012045", "story_v_out_410012.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_410012", "410012045", "story_v_out_410012.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_23 = math.max(var_184_14, arg_181_1.talkMaxDuration)

			if var_184_13 <= arg_181_1.time_ and arg_181_1.time_ < var_184_13 + var_184_23 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_13) / var_184_23

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_13 + var_184_23 and arg_181_1.time_ < var_184_13 + var_184_23 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play410012046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 410012046
		arg_185_1.duration_ = 5

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play410012047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["1060"].transform
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 then
				arg_185_1.var_.moveOldPos1060 = var_188_0.localPosition
				var_188_0.localScale = Vector3.New(1, 1, 1)

				arg_185_1:CheckSpriteTmpPos("1060", 7)

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
				local var_188_6 = Vector3.New(0, -2000, -40)

				var_188_0.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos1060, var_188_6, var_188_5)
			end

			if arg_185_1.time_ >= var_188_1 + var_188_4 and arg_185_1.time_ < var_188_1 + var_188_4 + arg_188_0 then
				var_188_0.localPosition = Vector3.New(0, -2000, -40)
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
							local var_188_11 = Mathf.Lerp(iter_188_2.color.r, 0.5, var_188_10)

							iter_188_2.color = Color.New(var_188_11, var_188_11, var_188_11)
						end
					end
				end
			end

			if arg_185_1.time_ >= var_188_8 + var_188_9 and arg_185_1.time_ < var_188_8 + var_188_9 + arg_188_0 and arg_185_1.var_.actorSpriteComps1060 then
				local var_188_12 = 0.5

				for iter_188_3, iter_188_4 in pairs(arg_185_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_188_4 then
						iter_188_4.color = Color.New(var_188_12, var_188_12, var_188_12)
					end
				end

				arg_185_1.var_.actorSpriteComps1060 = nil
			end

			local var_188_13 = 0
			local var_188_14 = 1.35

			if var_188_13 < arg_185_1.time_ and arg_185_1.time_ <= var_188_13 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, false)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_15 = arg_185_1:GetWordFromCfg(410012046)
				local var_188_16 = arg_185_1:FormatText(var_188_15.content)

				arg_185_1.text_.text = var_188_16

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_17 = 54
				local var_188_18 = utf8.len(var_188_16)
				local var_188_19 = var_188_17 <= 0 and var_188_14 or var_188_14 * (var_188_18 / var_188_17)

				if var_188_19 > 0 and var_188_14 < var_188_19 then
					arg_185_1.talkMaxDuration = var_188_19

					if var_188_19 + var_188_13 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_19 + var_188_13
					end
				end

				arg_185_1.text_.text = var_188_16
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)
				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_20 = math.max(var_188_14, arg_185_1.talkMaxDuration)

			if var_188_13 <= arg_185_1.time_ and arg_185_1.time_ < var_188_13 + var_188_20 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_13) / var_188_20

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_13 + var_188_20 and arg_185_1.time_ < var_188_13 + var_188_20 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play410012047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 410012047
		arg_189_1.duration_ = 5

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play410012048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = 0
			local var_192_1 = 1.25

			if var_192_0 < arg_189_1.time_ and arg_189_1.time_ <= var_192_0 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, false)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_2 = arg_189_1:GetWordFromCfg(410012047)
				local var_192_3 = arg_189_1:FormatText(var_192_2.content)

				arg_189_1.text_.text = var_192_3

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_4 = 50
				local var_192_5 = utf8.len(var_192_3)
				local var_192_6 = var_192_4 <= 0 and var_192_1 or var_192_1 * (var_192_5 / var_192_4)

				if var_192_6 > 0 and var_192_1 < var_192_6 then
					arg_189_1.talkMaxDuration = var_192_6

					if var_192_6 + var_192_0 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_6 + var_192_0
					end
				end

				arg_189_1.text_.text = var_192_3
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)
				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_7 = math.max(var_192_1, arg_189_1.talkMaxDuration)

			if var_192_0 <= arg_189_1.time_ and arg_189_1.time_ < var_192_0 + var_192_7 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_0) / var_192_7

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_0 + var_192_7 and arg_189_1.time_ < var_192_0 + var_192_7 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play410012048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 410012048
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play410012049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 1

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				local var_196_2 = "play"
				local var_196_3 = "effect"

				arg_193_1:AudioAction(var_196_2, var_196_3, "se_story_128", "se_story_128_cheer", "")
			end

			local var_196_4 = 0
			local var_196_5 = 1.275

			if var_196_4 < arg_193_1.time_ and arg_193_1.time_ <= var_196_4 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, false)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_6 = arg_193_1:GetWordFromCfg(410012048)
				local var_196_7 = arg_193_1:FormatText(var_196_6.content)

				arg_193_1.text_.text = var_196_7

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_8 = 51
				local var_196_9 = utf8.len(var_196_7)
				local var_196_10 = var_196_8 <= 0 and var_196_5 or var_196_5 * (var_196_9 / var_196_8)

				if var_196_10 > 0 and var_196_5 < var_196_10 then
					arg_193_1.talkMaxDuration = var_196_10

					if var_196_10 + var_196_4 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_10 + var_196_4
					end
				end

				arg_193_1.text_.text = var_196_7
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_11 = math.max(var_196_5, arg_193_1.talkMaxDuration)

			if var_196_4 <= arg_193_1.time_ and arg_193_1.time_ < var_196_4 + var_196_11 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_4) / var_196_11

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_4 + var_196_11 and arg_193_1.time_ < var_196_4 + var_196_11 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play410012049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 410012049
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play410012050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 0
			local var_200_1 = 1.125

			if var_200_0 < arg_197_1.time_ and arg_197_1.time_ <= var_200_0 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, false)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_2 = arg_197_1:GetWordFromCfg(410012049)
				local var_200_3 = arg_197_1:FormatText(var_200_2.content)

				arg_197_1.text_.text = var_200_3

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_4 = 45
				local var_200_5 = utf8.len(var_200_3)
				local var_200_6 = var_200_4 <= 0 and var_200_1 or var_200_1 * (var_200_5 / var_200_4)

				if var_200_6 > 0 and var_200_1 < var_200_6 then
					arg_197_1.talkMaxDuration = var_200_6

					if var_200_6 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_6 + var_200_0
					end
				end

				arg_197_1.text_.text = var_200_3
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)
				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_7 = math.max(var_200_1, arg_197_1.talkMaxDuration)

			if var_200_0 <= arg_197_1.time_ and arg_197_1.time_ < var_200_0 + var_200_7 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_0) / var_200_7

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_0 + var_200_7 and arg_197_1.time_ < var_200_0 + var_200_7 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play410012050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 410012050
		arg_201_1.duration_ = 8.866

		local var_201_0 = {
			zh = 6.566,
			ja = 8.866
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
				arg_201_0:Play410012051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["10062"].transform
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1.var_.moveOldPos10062 = var_204_0.localPosition
				var_204_0.localScale = Vector3.New(1, 1, 1)

				arg_201_1:CheckSpriteTmpPos("10062", 3)

				local var_204_2 = var_204_0.childCount

				for iter_204_0 = 0, var_204_2 - 1 do
					local var_204_3 = var_204_0:GetChild(iter_204_0)

					if var_204_3.name == "split_2" or not string.find(var_204_3.name, "split") then
						var_204_3.gameObject:SetActive(true)
					else
						var_204_3.gameObject:SetActive(false)
					end
				end
			end

			local var_204_4 = 0.001

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_4 then
				local var_204_5 = (arg_201_1.time_ - var_204_1) / var_204_4
				local var_204_6 = Vector3.New(0, -390, -290)

				var_204_0.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos10062, var_204_6, var_204_5)
			end

			if arg_201_1.time_ >= var_204_1 + var_204_4 and arg_201_1.time_ < var_204_1 + var_204_4 + arg_204_0 then
				var_204_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_204_7 = arg_201_1.actors_["10062"]
			local var_204_8 = 0

			if var_204_8 < arg_201_1.time_ and arg_201_1.time_ <= var_204_8 + arg_204_0 and arg_201_1.var_.actorSpriteComps10062 == nil then
				arg_201_1.var_.actorSpriteComps10062 = var_204_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_204_9 = 0.034

			if var_204_8 <= arg_201_1.time_ and arg_201_1.time_ < var_204_8 + var_204_9 then
				local var_204_10 = (arg_201_1.time_ - var_204_8) / var_204_9

				if arg_201_1.var_.actorSpriteComps10062 then
					for iter_204_1, iter_204_2 in pairs(arg_201_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_204_2 then
							local var_204_11 = Mathf.Lerp(iter_204_2.color.r, 1, var_204_10)

							iter_204_2.color = Color.New(var_204_11, var_204_11, var_204_11)
						end
					end
				end
			end

			if arg_201_1.time_ >= var_204_8 + var_204_9 and arg_201_1.time_ < var_204_8 + var_204_9 + arg_204_0 and arg_201_1.var_.actorSpriteComps10062 then
				local var_204_12 = 1

				for iter_204_3, iter_204_4 in pairs(arg_201_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_204_4 then
						iter_204_4.color = Color.New(var_204_12, var_204_12, var_204_12)
					end
				end

				arg_201_1.var_.actorSpriteComps10062 = nil
			end

			local var_204_13 = 0
			local var_204_14 = 0.575

			if var_204_13 < arg_201_1.time_ and arg_201_1.time_ <= var_204_13 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_15 = arg_201_1:FormatText(StoryNameCfg[592].name)

				arg_201_1.leftNameTxt_.text = var_204_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_16 = arg_201_1:GetWordFromCfg(410012050)
				local var_204_17 = arg_201_1:FormatText(var_204_16.content)

				arg_201_1.text_.text = var_204_17

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_18 = 23
				local var_204_19 = utf8.len(var_204_17)
				local var_204_20 = var_204_18 <= 0 and var_204_14 or var_204_14 * (var_204_19 / var_204_18)

				if var_204_20 > 0 and var_204_14 < var_204_20 then
					arg_201_1.talkMaxDuration = var_204_20

					if var_204_20 + var_204_13 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_20 + var_204_13
					end
				end

				arg_201_1.text_.text = var_204_17
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012050", "story_v_out_410012.awb") ~= 0 then
					local var_204_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012050", "story_v_out_410012.awb") / 1000

					if var_204_21 + var_204_13 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_21 + var_204_13
					end

					if var_204_16.prefab_name ~= "" and arg_201_1.actors_[var_204_16.prefab_name] ~= nil then
						local var_204_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_16.prefab_name].transform, "story_v_out_410012", "410012050", "story_v_out_410012.awb")

						arg_201_1:RecordAudio("410012050", var_204_22)
						arg_201_1:RecordAudio("410012050", var_204_22)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_410012", "410012050", "story_v_out_410012.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_410012", "410012050", "story_v_out_410012.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_23 = math.max(var_204_14, arg_201_1.talkMaxDuration)

			if var_204_13 <= arg_201_1.time_ and arg_201_1.time_ < var_204_13 + var_204_23 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_13) / var_204_23

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_13 + var_204_23 and arg_201_1.time_ < var_204_13 + var_204_23 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play410012051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 410012051
		arg_205_1.duration_ = 10.133

		local var_205_0 = {
			zh = 7.6,
			ja = 10.133
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
				arg_205_0:Play410012052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["10062"].transform
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				arg_205_1.var_.moveOldPos10062 = var_208_0.localPosition
				var_208_0.localScale = Vector3.New(1, 1, 1)

				arg_205_1:CheckSpriteTmpPos("10062", 4)

				local var_208_2 = var_208_0.childCount

				for iter_208_0 = 0, var_208_2 - 1 do
					local var_208_3 = var_208_0:GetChild(iter_208_0)

					if var_208_3.name == "split_2" or not string.find(var_208_3.name, "split") then
						var_208_3.gameObject:SetActive(true)
					else
						var_208_3.gameObject:SetActive(false)
					end
				end
			end

			local var_208_4 = 0.001

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_4 then
				local var_208_5 = (arg_205_1.time_ - var_208_1) / var_208_4
				local var_208_6 = Vector3.New(370, -390, -290)

				var_208_0.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos10062, var_208_6, var_208_5)
			end

			if arg_205_1.time_ >= var_208_1 + var_208_4 and arg_205_1.time_ < var_208_1 + var_208_4 + arg_208_0 then
				var_208_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_208_7 = arg_205_1.actors_["1060"].transform
			local var_208_8 = 0

			if var_208_8 < arg_205_1.time_ and arg_205_1.time_ <= var_208_8 + arg_208_0 then
				arg_205_1.var_.moveOldPos1060 = var_208_7.localPosition
				var_208_7.localScale = Vector3.New(1, 1, 1)

				arg_205_1:CheckSpriteTmpPos("1060", 2)

				local var_208_9 = var_208_7.childCount

				for iter_208_1 = 0, var_208_9 - 1 do
					local var_208_10 = var_208_7:GetChild(iter_208_1)

					if var_208_10.name == "split_1" or not string.find(var_208_10.name, "split") then
						var_208_10.gameObject:SetActive(true)
					else
						var_208_10.gameObject:SetActive(false)
					end
				end
			end

			local var_208_11 = 0.001

			if var_208_8 <= arg_205_1.time_ and arg_205_1.time_ < var_208_8 + var_208_11 then
				local var_208_12 = (arg_205_1.time_ - var_208_8) / var_208_11
				local var_208_13 = Vector3.New(-390, -435, -40)

				var_208_7.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos1060, var_208_13, var_208_12)
			end

			if arg_205_1.time_ >= var_208_8 + var_208_11 and arg_205_1.time_ < var_208_8 + var_208_11 + arg_208_0 then
				var_208_7.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_208_14 = arg_205_1.actors_["10062"]
			local var_208_15 = 0

			if var_208_15 < arg_205_1.time_ and arg_205_1.time_ <= var_208_15 + arg_208_0 and arg_205_1.var_.actorSpriteComps10062 == nil then
				arg_205_1.var_.actorSpriteComps10062 = var_208_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_208_16 = 0.034

			if var_208_15 <= arg_205_1.time_ and arg_205_1.time_ < var_208_15 + var_208_16 then
				local var_208_17 = (arg_205_1.time_ - var_208_15) / var_208_16

				if arg_205_1.var_.actorSpriteComps10062 then
					for iter_208_2, iter_208_3 in pairs(arg_205_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_208_3 then
							local var_208_18 = Mathf.Lerp(iter_208_3.color.r, 0.5, var_208_17)

							iter_208_3.color = Color.New(var_208_18, var_208_18, var_208_18)
						end
					end
				end
			end

			if arg_205_1.time_ >= var_208_15 + var_208_16 and arg_205_1.time_ < var_208_15 + var_208_16 + arg_208_0 and arg_205_1.var_.actorSpriteComps10062 then
				local var_208_19 = 0.5

				for iter_208_4, iter_208_5 in pairs(arg_205_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_208_5 then
						iter_208_5.color = Color.New(var_208_19, var_208_19, var_208_19)
					end
				end

				arg_205_1.var_.actorSpriteComps10062 = nil
			end

			local var_208_20 = arg_205_1.actors_["1060"]
			local var_208_21 = 0

			if var_208_21 < arg_205_1.time_ and arg_205_1.time_ <= var_208_21 + arg_208_0 and arg_205_1.var_.actorSpriteComps1060 == nil then
				arg_205_1.var_.actorSpriteComps1060 = var_208_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_208_22 = 0.034

			if var_208_21 <= arg_205_1.time_ and arg_205_1.time_ < var_208_21 + var_208_22 then
				local var_208_23 = (arg_205_1.time_ - var_208_21) / var_208_22

				if arg_205_1.var_.actorSpriteComps1060 then
					for iter_208_6, iter_208_7 in pairs(arg_205_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_208_7 then
							local var_208_24 = Mathf.Lerp(iter_208_7.color.r, 1, var_208_23)

							iter_208_7.color = Color.New(var_208_24, var_208_24, var_208_24)
						end
					end
				end
			end

			if arg_205_1.time_ >= var_208_21 + var_208_22 and arg_205_1.time_ < var_208_21 + var_208_22 + arg_208_0 and arg_205_1.var_.actorSpriteComps1060 then
				local var_208_25 = 1

				for iter_208_8, iter_208_9 in pairs(arg_205_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_208_9 then
						iter_208_9.color = Color.New(var_208_25, var_208_25, var_208_25)
					end
				end

				arg_205_1.var_.actorSpriteComps1060 = nil
			end

			local var_208_26 = 0
			local var_208_27 = 0.775

			if var_208_26 < arg_205_1.time_ and arg_205_1.time_ <= var_208_26 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_28 = arg_205_1:FormatText(StoryNameCfg[584].name)

				arg_205_1.leftNameTxt_.text = var_208_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_29 = arg_205_1:GetWordFromCfg(410012051)
				local var_208_30 = arg_205_1:FormatText(var_208_29.content)

				arg_205_1.text_.text = var_208_30

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_31 = 31
				local var_208_32 = utf8.len(var_208_30)
				local var_208_33 = var_208_31 <= 0 and var_208_27 or var_208_27 * (var_208_32 / var_208_31)

				if var_208_33 > 0 and var_208_27 < var_208_33 then
					arg_205_1.talkMaxDuration = var_208_33

					if var_208_33 + var_208_26 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_33 + var_208_26
					end
				end

				arg_205_1.text_.text = var_208_30
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012051", "story_v_out_410012.awb") ~= 0 then
					local var_208_34 = manager.audio:GetVoiceLength("story_v_out_410012", "410012051", "story_v_out_410012.awb") / 1000

					if var_208_34 + var_208_26 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_34 + var_208_26
					end

					if var_208_29.prefab_name ~= "" and arg_205_1.actors_[var_208_29.prefab_name] ~= nil then
						local var_208_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_29.prefab_name].transform, "story_v_out_410012", "410012051", "story_v_out_410012.awb")

						arg_205_1:RecordAudio("410012051", var_208_35)
						arg_205_1:RecordAudio("410012051", var_208_35)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_410012", "410012051", "story_v_out_410012.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_410012", "410012051", "story_v_out_410012.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_36 = math.max(var_208_27, arg_205_1.talkMaxDuration)

			if var_208_26 <= arg_205_1.time_ and arg_205_1.time_ < var_208_26 + var_208_36 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_26) / var_208_36

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_26 + var_208_36 and arg_205_1.time_ < var_208_26 + var_208_36 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play410012052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 410012052
		arg_209_1.duration_ = 4.066

		local var_209_0 = {
			zh = 1.933,
			ja = 4.066
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
				arg_209_0:Play410012053(arg_209_1)
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

					if var_212_3.name == "split_5" or not string.find(var_212_3.name, "split") then
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

			local var_212_7 = arg_209_1.actors_["10062"].transform
			local var_212_8 = 0

			if var_212_8 < arg_209_1.time_ and arg_209_1.time_ <= var_212_8 + arg_212_0 then
				arg_209_1.var_.moveOldPos10062 = var_212_7.localPosition
				var_212_7.localScale = Vector3.New(1, 1, 1)

				arg_209_1:CheckSpriteTmpPos("10062", 7)

				local var_212_9 = var_212_7.childCount

				for iter_212_1 = 0, var_212_9 - 1 do
					local var_212_10 = var_212_7:GetChild(iter_212_1)

					if var_212_10.name == "" or not string.find(var_212_10.name, "split") then
						var_212_10.gameObject:SetActive(true)
					else
						var_212_10.gameObject:SetActive(false)
					end
				end
			end

			local var_212_11 = 0.001

			if var_212_8 <= arg_209_1.time_ and arg_209_1.time_ < var_212_8 + var_212_11 then
				local var_212_12 = (arg_209_1.time_ - var_212_8) / var_212_11
				local var_212_13 = Vector3.New(0, -2000, -290)

				var_212_7.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos10062, var_212_13, var_212_12)
			end

			if arg_209_1.time_ >= var_212_8 + var_212_11 and arg_209_1.time_ < var_212_8 + var_212_11 + arg_212_0 then
				var_212_7.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_212_14 = arg_209_1.actors_["10061"]
			local var_212_15 = 0

			if var_212_15 < arg_209_1.time_ and arg_209_1.time_ <= var_212_15 + arg_212_0 and arg_209_1.var_.actorSpriteComps10061 == nil then
				arg_209_1.var_.actorSpriteComps10061 = var_212_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_212_16 = 0.034

			if var_212_15 <= arg_209_1.time_ and arg_209_1.time_ < var_212_15 + var_212_16 then
				local var_212_17 = (arg_209_1.time_ - var_212_15) / var_212_16

				if arg_209_1.var_.actorSpriteComps10061 then
					for iter_212_2, iter_212_3 in pairs(arg_209_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_212_3 then
							local var_212_18 = Mathf.Lerp(iter_212_3.color.r, 1, var_212_17)

							iter_212_3.color = Color.New(var_212_18, var_212_18, var_212_18)
						end
					end
				end
			end

			if arg_209_1.time_ >= var_212_15 + var_212_16 and arg_209_1.time_ < var_212_15 + var_212_16 + arg_212_0 and arg_209_1.var_.actorSpriteComps10061 then
				local var_212_19 = 1

				for iter_212_4, iter_212_5 in pairs(arg_209_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_212_5 then
						iter_212_5.color = Color.New(var_212_19, var_212_19, var_212_19)
					end
				end

				arg_209_1.var_.actorSpriteComps10061 = nil
			end

			local var_212_20 = arg_209_1.actors_["10062"]
			local var_212_21 = 0

			if var_212_21 < arg_209_1.time_ and arg_209_1.time_ <= var_212_21 + arg_212_0 and arg_209_1.var_.actorSpriteComps10062 == nil then
				arg_209_1.var_.actorSpriteComps10062 = var_212_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_212_22 = 0.034

			if var_212_21 <= arg_209_1.time_ and arg_209_1.time_ < var_212_21 + var_212_22 then
				local var_212_23 = (arg_209_1.time_ - var_212_21) / var_212_22

				if arg_209_1.var_.actorSpriteComps10062 then
					for iter_212_6, iter_212_7 in pairs(arg_209_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_212_7 then
							local var_212_24 = Mathf.Lerp(iter_212_7.color.r, 0.5, var_212_23)

							iter_212_7.color = Color.New(var_212_24, var_212_24, var_212_24)
						end
					end
				end
			end

			if arg_209_1.time_ >= var_212_21 + var_212_22 and arg_209_1.time_ < var_212_21 + var_212_22 + arg_212_0 and arg_209_1.var_.actorSpriteComps10062 then
				local var_212_25 = 0.5

				for iter_212_8, iter_212_9 in pairs(arg_209_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_212_9 then
						iter_212_9.color = Color.New(var_212_25, var_212_25, var_212_25)
					end
				end

				arg_209_1.var_.actorSpriteComps10062 = nil
			end

			local var_212_26 = arg_209_1.actors_["1060"]
			local var_212_27 = 0

			if var_212_27 < arg_209_1.time_ and arg_209_1.time_ <= var_212_27 + arg_212_0 and arg_209_1.var_.actorSpriteComps1060 == nil then
				arg_209_1.var_.actorSpriteComps1060 = var_212_26:GetComponentsInChildren(typeof(Image), true)
			end

			local var_212_28 = 0.034

			if var_212_27 <= arg_209_1.time_ and arg_209_1.time_ < var_212_27 + var_212_28 then
				local var_212_29 = (arg_209_1.time_ - var_212_27) / var_212_28

				if arg_209_1.var_.actorSpriteComps1060 then
					for iter_212_10, iter_212_11 in pairs(arg_209_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_212_11 then
							local var_212_30 = Mathf.Lerp(iter_212_11.color.r, 0.5, var_212_29)

							iter_212_11.color = Color.New(var_212_30, var_212_30, var_212_30)
						end
					end
				end
			end

			if arg_209_1.time_ >= var_212_27 + var_212_28 and arg_209_1.time_ < var_212_27 + var_212_28 + arg_212_0 and arg_209_1.var_.actorSpriteComps1060 then
				local var_212_31 = 0.5

				for iter_212_12, iter_212_13 in pairs(arg_209_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_212_13 then
						iter_212_13.color = Color.New(var_212_31, var_212_31, var_212_31)
					end
				end

				arg_209_1.var_.actorSpriteComps1060 = nil
			end

			local var_212_32 = 0
			local var_212_33 = 0.225

			if var_212_32 < arg_209_1.time_ and arg_209_1.time_ <= var_212_32 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_34 = arg_209_1:FormatText(StoryNameCfg[591].name)

				arg_209_1.leftNameTxt_.text = var_212_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_35 = arg_209_1:GetWordFromCfg(410012052)
				local var_212_36 = arg_209_1:FormatText(var_212_35.content)

				arg_209_1.text_.text = var_212_36

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_37 = 9
				local var_212_38 = utf8.len(var_212_36)
				local var_212_39 = var_212_37 <= 0 and var_212_33 or var_212_33 * (var_212_38 / var_212_37)

				if var_212_39 > 0 and var_212_33 < var_212_39 then
					arg_209_1.talkMaxDuration = var_212_39

					if var_212_39 + var_212_32 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_39 + var_212_32
					end
				end

				arg_209_1.text_.text = var_212_36
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012052", "story_v_out_410012.awb") ~= 0 then
					local var_212_40 = manager.audio:GetVoiceLength("story_v_out_410012", "410012052", "story_v_out_410012.awb") / 1000

					if var_212_40 + var_212_32 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_40 + var_212_32
					end

					if var_212_35.prefab_name ~= "" and arg_209_1.actors_[var_212_35.prefab_name] ~= nil then
						local var_212_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_35.prefab_name].transform, "story_v_out_410012", "410012052", "story_v_out_410012.awb")

						arg_209_1:RecordAudio("410012052", var_212_41)
						arg_209_1:RecordAudio("410012052", var_212_41)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_410012", "410012052", "story_v_out_410012.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_410012", "410012052", "story_v_out_410012.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_42 = math.max(var_212_33, arg_209_1.talkMaxDuration)

			if var_212_32 <= arg_209_1.time_ and arg_209_1.time_ < var_212_32 + var_212_42 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_32) / var_212_42

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_32 + var_212_42 and arg_209_1.time_ < var_212_32 + var_212_42 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play410012053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 410012053
		arg_213_1.duration_ = 7.033

		local var_213_0 = {
			zh = 4.4,
			ja = 7.033
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
				arg_213_0:Play410012054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1060"].transform
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				arg_213_1.var_.moveOldPos1060 = var_216_0.localPosition
				var_216_0.localScale = Vector3.New(1, 1, 1)

				arg_213_1:CheckSpriteTmpPos("1060", 2)

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
				local var_216_6 = Vector3.New(-390, -435, -40)

				var_216_0.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos1060, var_216_6, var_216_5)
			end

			if arg_213_1.time_ >= var_216_1 + var_216_4 and arg_213_1.time_ < var_216_1 + var_216_4 + arg_216_0 then
				var_216_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_216_7 = arg_213_1.actors_["1060"]
			local var_216_8 = 0

			if var_216_8 < arg_213_1.time_ and arg_213_1.time_ <= var_216_8 + arg_216_0 and arg_213_1.var_.actorSpriteComps1060 == nil then
				arg_213_1.var_.actorSpriteComps1060 = var_216_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_216_9 = 0.034

			if var_216_8 <= arg_213_1.time_ and arg_213_1.time_ < var_216_8 + var_216_9 then
				local var_216_10 = (arg_213_1.time_ - var_216_8) / var_216_9

				if arg_213_1.var_.actorSpriteComps1060 then
					for iter_216_1, iter_216_2 in pairs(arg_213_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_216_2 then
							local var_216_11 = Mathf.Lerp(iter_216_2.color.r, 1, var_216_10)

							iter_216_2.color = Color.New(var_216_11, var_216_11, var_216_11)
						end
					end
				end
			end

			if arg_213_1.time_ >= var_216_8 + var_216_9 and arg_213_1.time_ < var_216_8 + var_216_9 + arg_216_0 and arg_213_1.var_.actorSpriteComps1060 then
				local var_216_12 = 1

				for iter_216_3, iter_216_4 in pairs(arg_213_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_216_4 then
						iter_216_4.color = Color.New(var_216_12, var_216_12, var_216_12)
					end
				end

				arg_213_1.var_.actorSpriteComps1060 = nil
			end

			local var_216_13 = arg_213_1.actors_["10061"]
			local var_216_14 = 0

			if var_216_14 < arg_213_1.time_ and arg_213_1.time_ <= var_216_14 + arg_216_0 and arg_213_1.var_.actorSpriteComps10061 == nil then
				arg_213_1.var_.actorSpriteComps10061 = var_216_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_216_15 = 0.034

			if var_216_14 <= arg_213_1.time_ and arg_213_1.time_ < var_216_14 + var_216_15 then
				local var_216_16 = (arg_213_1.time_ - var_216_14) / var_216_15

				if arg_213_1.var_.actorSpriteComps10061 then
					for iter_216_5, iter_216_6 in pairs(arg_213_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_216_6 then
							local var_216_17 = Mathf.Lerp(iter_216_6.color.r, 0.5, var_216_16)

							iter_216_6.color = Color.New(var_216_17, var_216_17, var_216_17)
						end
					end
				end
			end

			if arg_213_1.time_ >= var_216_14 + var_216_15 and arg_213_1.time_ < var_216_14 + var_216_15 + arg_216_0 and arg_213_1.var_.actorSpriteComps10061 then
				local var_216_18 = 0.5

				for iter_216_7, iter_216_8 in pairs(arg_213_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_216_8 then
						iter_216_8.color = Color.New(var_216_18, var_216_18, var_216_18)
					end
				end

				arg_213_1.var_.actorSpriteComps10061 = nil
			end

			local var_216_19 = 0
			local var_216_20 = 0.575

			if var_216_19 < arg_213_1.time_ and arg_213_1.time_ <= var_216_19 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_21 = arg_213_1:FormatText(StoryNameCfg[584].name)

				arg_213_1.leftNameTxt_.text = var_216_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_22 = arg_213_1:GetWordFromCfg(410012053)
				local var_216_23 = arg_213_1:FormatText(var_216_22.content)

				arg_213_1.text_.text = var_216_23

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_24 = 23
				local var_216_25 = utf8.len(var_216_23)
				local var_216_26 = var_216_24 <= 0 and var_216_20 or var_216_20 * (var_216_25 / var_216_24)

				if var_216_26 > 0 and var_216_20 < var_216_26 then
					arg_213_1.talkMaxDuration = var_216_26

					if var_216_26 + var_216_19 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_26 + var_216_19
					end
				end

				arg_213_1.text_.text = var_216_23
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012053", "story_v_out_410012.awb") ~= 0 then
					local var_216_27 = manager.audio:GetVoiceLength("story_v_out_410012", "410012053", "story_v_out_410012.awb") / 1000

					if var_216_27 + var_216_19 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_27 + var_216_19
					end

					if var_216_22.prefab_name ~= "" and arg_213_1.actors_[var_216_22.prefab_name] ~= nil then
						local var_216_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_22.prefab_name].transform, "story_v_out_410012", "410012053", "story_v_out_410012.awb")

						arg_213_1:RecordAudio("410012053", var_216_28)
						arg_213_1:RecordAudio("410012053", var_216_28)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_410012", "410012053", "story_v_out_410012.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_410012", "410012053", "story_v_out_410012.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_29 = math.max(var_216_20, arg_213_1.talkMaxDuration)

			if var_216_19 <= arg_213_1.time_ and arg_213_1.time_ < var_216_19 + var_216_29 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_19) / var_216_29

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_19 + var_216_29 and arg_213_1.time_ < var_216_19 + var_216_29 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play410012054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 410012054
		arg_217_1.duration_ = 10.866

		local var_217_0 = {
			zh = 5.666,
			ja = 10.866
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
				arg_217_0:Play410012055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["10062"].transform
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 then
				arg_217_1.var_.moveOldPos10062 = var_220_0.localPosition
				var_220_0.localScale = Vector3.New(1, 1, 1)

				arg_217_1:CheckSpriteTmpPos("10062", 4)

				local var_220_2 = var_220_0.childCount

				for iter_220_0 = 0, var_220_2 - 1 do
					local var_220_3 = var_220_0:GetChild(iter_220_0)

					if var_220_3.name == "" or not string.find(var_220_3.name, "split") then
						var_220_3.gameObject:SetActive(true)
					else
						var_220_3.gameObject:SetActive(false)
					end
				end
			end

			local var_220_4 = 0.001

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_4 then
				local var_220_5 = (arg_217_1.time_ - var_220_1) / var_220_4
				local var_220_6 = Vector3.New(370, -390, -290)

				var_220_0.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos10062, var_220_6, var_220_5)
			end

			if arg_217_1.time_ >= var_220_1 + var_220_4 and arg_217_1.time_ < var_220_1 + var_220_4 + arg_220_0 then
				var_220_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_220_7 = arg_217_1.actors_["10061"].transform
			local var_220_8 = 0

			if var_220_8 < arg_217_1.time_ and arg_217_1.time_ <= var_220_8 + arg_220_0 then
				arg_217_1.var_.moveOldPos10061 = var_220_7.localPosition
				var_220_7.localScale = Vector3.New(1, 1, 1)

				arg_217_1:CheckSpriteTmpPos("10061", 7)

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
				local var_220_13 = Vector3.New(0, -2000, -100)

				var_220_7.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos10061, var_220_13, var_220_12)
			end

			if arg_217_1.time_ >= var_220_8 + var_220_11 and arg_217_1.time_ < var_220_8 + var_220_11 + arg_220_0 then
				var_220_7.localPosition = Vector3.New(0, -2000, -100)
			end

			local var_220_14 = arg_217_1.actors_["10062"]
			local var_220_15 = 0

			if var_220_15 < arg_217_1.time_ and arg_217_1.time_ <= var_220_15 + arg_220_0 and arg_217_1.var_.actorSpriteComps10062 == nil then
				arg_217_1.var_.actorSpriteComps10062 = var_220_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_220_16 = 0.034

			if var_220_15 <= arg_217_1.time_ and arg_217_1.time_ < var_220_15 + var_220_16 then
				local var_220_17 = (arg_217_1.time_ - var_220_15) / var_220_16

				if arg_217_1.var_.actorSpriteComps10062 then
					for iter_220_2, iter_220_3 in pairs(arg_217_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_220_3 then
							local var_220_18 = Mathf.Lerp(iter_220_3.color.r, 1, var_220_17)

							iter_220_3.color = Color.New(var_220_18, var_220_18, var_220_18)
						end
					end
				end
			end

			if arg_217_1.time_ >= var_220_15 + var_220_16 and arg_217_1.time_ < var_220_15 + var_220_16 + arg_220_0 and arg_217_1.var_.actorSpriteComps10062 then
				local var_220_19 = 1

				for iter_220_4, iter_220_5 in pairs(arg_217_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_220_5 then
						iter_220_5.color = Color.New(var_220_19, var_220_19, var_220_19)
					end
				end

				arg_217_1.var_.actorSpriteComps10062 = nil
			end

			local var_220_20 = arg_217_1.actors_["10061"]
			local var_220_21 = 0

			if var_220_21 < arg_217_1.time_ and arg_217_1.time_ <= var_220_21 + arg_220_0 and arg_217_1.var_.actorSpriteComps10061 == nil then
				arg_217_1.var_.actorSpriteComps10061 = var_220_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_220_22 = 0.034

			if var_220_21 <= arg_217_1.time_ and arg_217_1.time_ < var_220_21 + var_220_22 then
				local var_220_23 = (arg_217_1.time_ - var_220_21) / var_220_22

				if arg_217_1.var_.actorSpriteComps10061 then
					for iter_220_6, iter_220_7 in pairs(arg_217_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_220_7 then
							local var_220_24 = Mathf.Lerp(iter_220_7.color.r, 0.5, var_220_23)

							iter_220_7.color = Color.New(var_220_24, var_220_24, var_220_24)
						end
					end
				end
			end

			if arg_217_1.time_ >= var_220_21 + var_220_22 and arg_217_1.time_ < var_220_21 + var_220_22 + arg_220_0 and arg_217_1.var_.actorSpriteComps10061 then
				local var_220_25 = 0.5

				for iter_220_8, iter_220_9 in pairs(arg_217_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_220_9 then
						iter_220_9.color = Color.New(var_220_25, var_220_25, var_220_25)
					end
				end

				arg_217_1.var_.actorSpriteComps10061 = nil
			end

			local var_220_26 = arg_217_1.actors_["1060"]
			local var_220_27 = 0

			if var_220_27 < arg_217_1.time_ and arg_217_1.time_ <= var_220_27 + arg_220_0 and arg_217_1.var_.actorSpriteComps1060 == nil then
				arg_217_1.var_.actorSpriteComps1060 = var_220_26:GetComponentsInChildren(typeof(Image), true)
			end

			local var_220_28 = 0.034

			if var_220_27 <= arg_217_1.time_ and arg_217_1.time_ < var_220_27 + var_220_28 then
				local var_220_29 = (arg_217_1.time_ - var_220_27) / var_220_28

				if arg_217_1.var_.actorSpriteComps1060 then
					for iter_220_10, iter_220_11 in pairs(arg_217_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_220_11 then
							local var_220_30 = Mathf.Lerp(iter_220_11.color.r, 0.5, var_220_29)

							iter_220_11.color = Color.New(var_220_30, var_220_30, var_220_30)
						end
					end
				end
			end

			if arg_217_1.time_ >= var_220_27 + var_220_28 and arg_217_1.time_ < var_220_27 + var_220_28 + arg_220_0 and arg_217_1.var_.actorSpriteComps1060 then
				local var_220_31 = 0.5

				for iter_220_12, iter_220_13 in pairs(arg_217_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_220_13 then
						iter_220_13.color = Color.New(var_220_31, var_220_31, var_220_31)
					end
				end

				arg_217_1.var_.actorSpriteComps1060 = nil
			end

			local var_220_32 = 0
			local var_220_33 = 0.45

			if var_220_32 < arg_217_1.time_ and arg_217_1.time_ <= var_220_32 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_34 = arg_217_1:FormatText(StoryNameCfg[592].name)

				arg_217_1.leftNameTxt_.text = var_220_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_35 = arg_217_1:GetWordFromCfg(410012054)
				local var_220_36 = arg_217_1:FormatText(var_220_35.content)

				arg_217_1.text_.text = var_220_36

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_37 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012054", "story_v_out_410012.awb") ~= 0 then
					local var_220_40 = manager.audio:GetVoiceLength("story_v_out_410012", "410012054", "story_v_out_410012.awb") / 1000

					if var_220_40 + var_220_32 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_40 + var_220_32
					end

					if var_220_35.prefab_name ~= "" and arg_217_1.actors_[var_220_35.prefab_name] ~= nil then
						local var_220_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_35.prefab_name].transform, "story_v_out_410012", "410012054", "story_v_out_410012.awb")

						arg_217_1:RecordAudio("410012054", var_220_41)
						arg_217_1:RecordAudio("410012054", var_220_41)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_410012", "410012054", "story_v_out_410012.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_410012", "410012054", "story_v_out_410012.awb")
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
	Play410012055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 410012055
		arg_221_1.duration_ = 5.166

		local var_221_0 = {
			zh = 1.1,
			ja = 5.166
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
				arg_221_0:Play410012056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1060"].transform
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.var_.moveOldPos1060 = var_224_0.localPosition
				var_224_0.localScale = Vector3.New(1, 1, 1)

				arg_221_1:CheckSpriteTmpPos("1060", 2)

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
				local var_224_6 = Vector3.New(-390, -435, -40)

				var_224_0.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos1060, var_224_6, var_224_5)
			end

			if arg_221_1.time_ >= var_224_1 + var_224_4 and arg_221_1.time_ < var_224_1 + var_224_4 + arg_224_0 then
				var_224_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_224_7 = arg_221_1.actors_["1060"]
			local var_224_8 = 0

			if var_224_8 < arg_221_1.time_ and arg_221_1.time_ <= var_224_8 + arg_224_0 and arg_221_1.var_.actorSpriteComps1060 == nil then
				arg_221_1.var_.actorSpriteComps1060 = var_224_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_224_9 = 0.034

			if var_224_8 <= arg_221_1.time_ and arg_221_1.time_ < var_224_8 + var_224_9 then
				local var_224_10 = (arg_221_1.time_ - var_224_8) / var_224_9

				if arg_221_1.var_.actorSpriteComps1060 then
					for iter_224_1, iter_224_2 in pairs(arg_221_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_224_2 then
							local var_224_11 = Mathf.Lerp(iter_224_2.color.r, 1, var_224_10)

							iter_224_2.color = Color.New(var_224_11, var_224_11, var_224_11)
						end
					end
				end
			end

			if arg_221_1.time_ >= var_224_8 + var_224_9 and arg_221_1.time_ < var_224_8 + var_224_9 + arg_224_0 and arg_221_1.var_.actorSpriteComps1060 then
				local var_224_12 = 1

				for iter_224_3, iter_224_4 in pairs(arg_221_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_224_4 then
						iter_224_4.color = Color.New(var_224_12, var_224_12, var_224_12)
					end
				end

				arg_221_1.var_.actorSpriteComps1060 = nil
			end

			local var_224_13 = arg_221_1.actors_["10062"]
			local var_224_14 = 0

			if var_224_14 < arg_221_1.time_ and arg_221_1.time_ <= var_224_14 + arg_224_0 and arg_221_1.var_.actorSpriteComps10062 == nil then
				arg_221_1.var_.actorSpriteComps10062 = var_224_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_224_15 = 0.034

			if var_224_14 <= arg_221_1.time_ and arg_221_1.time_ < var_224_14 + var_224_15 then
				local var_224_16 = (arg_221_1.time_ - var_224_14) / var_224_15

				if arg_221_1.var_.actorSpriteComps10062 then
					for iter_224_5, iter_224_6 in pairs(arg_221_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_224_6 then
							local var_224_17 = Mathf.Lerp(iter_224_6.color.r, 0.5, var_224_16)

							iter_224_6.color = Color.New(var_224_17, var_224_17, var_224_17)
						end
					end
				end
			end

			if arg_221_1.time_ >= var_224_14 + var_224_15 and arg_221_1.time_ < var_224_14 + var_224_15 + arg_224_0 and arg_221_1.var_.actorSpriteComps10062 then
				local var_224_18 = 0.5

				for iter_224_7, iter_224_8 in pairs(arg_221_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_224_8 then
						iter_224_8.color = Color.New(var_224_18, var_224_18, var_224_18)
					end
				end

				arg_221_1.var_.actorSpriteComps10062 = nil
			end

			local var_224_19 = 0
			local var_224_20 = 0.15

			if var_224_19 < arg_221_1.time_ and arg_221_1.time_ <= var_224_19 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_21 = arg_221_1:FormatText(StoryNameCfg[584].name)

				arg_221_1.leftNameTxt_.text = var_224_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_22 = arg_221_1:GetWordFromCfg(410012055)
				local var_224_23 = arg_221_1:FormatText(var_224_22.content)

				arg_221_1.text_.text = var_224_23

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_24 = 6
				local var_224_25 = utf8.len(var_224_23)
				local var_224_26 = var_224_24 <= 0 and var_224_20 or var_224_20 * (var_224_25 / var_224_24)

				if var_224_26 > 0 and var_224_20 < var_224_26 then
					arg_221_1.talkMaxDuration = var_224_26

					if var_224_26 + var_224_19 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_26 + var_224_19
					end
				end

				arg_221_1.text_.text = var_224_23
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012055", "story_v_out_410012.awb") ~= 0 then
					local var_224_27 = manager.audio:GetVoiceLength("story_v_out_410012", "410012055", "story_v_out_410012.awb") / 1000

					if var_224_27 + var_224_19 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_27 + var_224_19
					end

					if var_224_22.prefab_name ~= "" and arg_221_1.actors_[var_224_22.prefab_name] ~= nil then
						local var_224_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_22.prefab_name].transform, "story_v_out_410012", "410012055", "story_v_out_410012.awb")

						arg_221_1:RecordAudio("410012055", var_224_28)
						arg_221_1:RecordAudio("410012055", var_224_28)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_410012", "410012055", "story_v_out_410012.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_410012", "410012055", "story_v_out_410012.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_29 = math.max(var_224_20, arg_221_1.talkMaxDuration)

			if var_224_19 <= arg_221_1.time_ and arg_221_1.time_ < var_224_19 + var_224_29 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_19) / var_224_29

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_19 + var_224_29 and arg_221_1.time_ < var_224_19 + var_224_29 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play410012056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 410012056
		arg_225_1.duration_ = 11.166

		local var_225_0 = {
			zh = 8.566,
			ja = 11.166
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
				arg_225_0:Play410012057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["10062"].transform
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1.var_.moveOldPos10062 = var_228_0.localPosition
				var_228_0.localScale = Vector3.New(1, 1, 1)

				arg_225_1:CheckSpriteTmpPos("10062", 4)

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
				local var_228_6 = Vector3.New(370, -390, -290)

				var_228_0.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos10062, var_228_6, var_228_5)
			end

			if arg_225_1.time_ >= var_228_1 + var_228_4 and arg_225_1.time_ < var_228_1 + var_228_4 + arg_228_0 then
				var_228_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_228_7 = arg_225_1.actors_["10062"]
			local var_228_8 = 0

			if var_228_8 < arg_225_1.time_ and arg_225_1.time_ <= var_228_8 + arg_228_0 and arg_225_1.var_.actorSpriteComps10062 == nil then
				arg_225_1.var_.actorSpriteComps10062 = var_228_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_228_9 = 0.034

			if var_228_8 <= arg_225_1.time_ and arg_225_1.time_ < var_228_8 + var_228_9 then
				local var_228_10 = (arg_225_1.time_ - var_228_8) / var_228_9

				if arg_225_1.var_.actorSpriteComps10062 then
					for iter_228_1, iter_228_2 in pairs(arg_225_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_228_2 then
							local var_228_11 = Mathf.Lerp(iter_228_2.color.r, 1, var_228_10)

							iter_228_2.color = Color.New(var_228_11, var_228_11, var_228_11)
						end
					end
				end
			end

			if arg_225_1.time_ >= var_228_8 + var_228_9 and arg_225_1.time_ < var_228_8 + var_228_9 + arg_228_0 and arg_225_1.var_.actorSpriteComps10062 then
				local var_228_12 = 1

				for iter_228_3, iter_228_4 in pairs(arg_225_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_228_4 then
						iter_228_4.color = Color.New(var_228_12, var_228_12, var_228_12)
					end
				end

				arg_225_1.var_.actorSpriteComps10062 = nil
			end

			local var_228_13 = arg_225_1.actors_["1060"]
			local var_228_14 = 0

			if var_228_14 < arg_225_1.time_ and arg_225_1.time_ <= var_228_14 + arg_228_0 and arg_225_1.var_.actorSpriteComps1060 == nil then
				arg_225_1.var_.actorSpriteComps1060 = var_228_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_228_15 = 0.034

			if var_228_14 <= arg_225_1.time_ and arg_225_1.time_ < var_228_14 + var_228_15 then
				local var_228_16 = (arg_225_1.time_ - var_228_14) / var_228_15

				if arg_225_1.var_.actorSpriteComps1060 then
					for iter_228_5, iter_228_6 in pairs(arg_225_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_228_6 then
							local var_228_17 = Mathf.Lerp(iter_228_6.color.r, 0.5, var_228_16)

							iter_228_6.color = Color.New(var_228_17, var_228_17, var_228_17)
						end
					end
				end
			end

			if arg_225_1.time_ >= var_228_14 + var_228_15 and arg_225_1.time_ < var_228_14 + var_228_15 + arg_228_0 and arg_225_1.var_.actorSpriteComps1060 then
				local var_228_18 = 0.5

				for iter_228_7, iter_228_8 in pairs(arg_225_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_228_8 then
						iter_228_8.color = Color.New(var_228_18, var_228_18, var_228_18)
					end
				end

				arg_225_1.var_.actorSpriteComps1060 = nil
			end

			local var_228_19 = 0
			local var_228_20 = 0.8

			if var_228_19 < arg_225_1.time_ and arg_225_1.time_ <= var_228_19 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_21 = arg_225_1:FormatText(StoryNameCfg[592].name)

				arg_225_1.leftNameTxt_.text = var_228_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_22 = arg_225_1:GetWordFromCfg(410012056)
				local var_228_23 = arg_225_1:FormatText(var_228_22.content)

				arg_225_1.text_.text = var_228_23

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_24 = 32
				local var_228_25 = utf8.len(var_228_23)
				local var_228_26 = var_228_24 <= 0 and var_228_20 or var_228_20 * (var_228_25 / var_228_24)

				if var_228_26 > 0 and var_228_20 < var_228_26 then
					arg_225_1.talkMaxDuration = var_228_26

					if var_228_26 + var_228_19 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_26 + var_228_19
					end
				end

				arg_225_1.text_.text = var_228_23
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012056", "story_v_out_410012.awb") ~= 0 then
					local var_228_27 = manager.audio:GetVoiceLength("story_v_out_410012", "410012056", "story_v_out_410012.awb") / 1000

					if var_228_27 + var_228_19 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_27 + var_228_19
					end

					if var_228_22.prefab_name ~= "" and arg_225_1.actors_[var_228_22.prefab_name] ~= nil then
						local var_228_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_22.prefab_name].transform, "story_v_out_410012", "410012056", "story_v_out_410012.awb")

						arg_225_1:RecordAudio("410012056", var_228_28)
						arg_225_1:RecordAudio("410012056", var_228_28)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_410012", "410012056", "story_v_out_410012.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_410012", "410012056", "story_v_out_410012.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_29 = math.max(var_228_20, arg_225_1.talkMaxDuration)

			if var_228_19 <= arg_225_1.time_ and arg_225_1.time_ < var_228_19 + var_228_29 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_19) / var_228_29

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_19 + var_228_29 and arg_225_1.time_ < var_228_19 + var_228_29 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play410012057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 410012057
		arg_229_1.duration_ = 11.966

		local var_229_0 = {
			zh = 6.766,
			ja = 11.966
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
				arg_229_0:Play410012058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["10062"].transform
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 then
				arg_229_1.var_.moveOldPos10062 = var_232_0.localPosition
				var_232_0.localScale = Vector3.New(1, 1, 1)

				arg_229_1:CheckSpriteTmpPos("10062", 4)

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
				local var_232_6 = Vector3.New(370, -390, -290)

				var_232_0.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos10062, var_232_6, var_232_5)
			end

			if arg_229_1.time_ >= var_232_1 + var_232_4 and arg_229_1.time_ < var_232_1 + var_232_4 + arg_232_0 then
				var_232_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_232_7 = arg_229_1.actors_["10062"]
			local var_232_8 = 0

			if var_232_8 < arg_229_1.time_ and arg_229_1.time_ <= var_232_8 + arg_232_0 and arg_229_1.var_.actorSpriteComps10062 == nil then
				arg_229_1.var_.actorSpriteComps10062 = var_232_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_232_9 = 0.034

			if var_232_8 <= arg_229_1.time_ and arg_229_1.time_ < var_232_8 + var_232_9 then
				local var_232_10 = (arg_229_1.time_ - var_232_8) / var_232_9

				if arg_229_1.var_.actorSpriteComps10062 then
					for iter_232_1, iter_232_2 in pairs(arg_229_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_232_2 then
							local var_232_11 = Mathf.Lerp(iter_232_2.color.r, 1, var_232_10)

							iter_232_2.color = Color.New(var_232_11, var_232_11, var_232_11)
						end
					end
				end
			end

			if arg_229_1.time_ >= var_232_8 + var_232_9 and arg_229_1.time_ < var_232_8 + var_232_9 + arg_232_0 and arg_229_1.var_.actorSpriteComps10062 then
				local var_232_12 = 1

				for iter_232_3, iter_232_4 in pairs(arg_229_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_232_4 then
						iter_232_4.color = Color.New(var_232_12, var_232_12, var_232_12)
					end
				end

				arg_229_1.var_.actorSpriteComps10062 = nil
			end

			local var_232_13 = 0
			local var_232_14 = 0.7

			if var_232_13 < arg_229_1.time_ and arg_229_1.time_ <= var_232_13 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_15 = arg_229_1:FormatText(StoryNameCfg[592].name)

				arg_229_1.leftNameTxt_.text = var_232_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_16 = arg_229_1:GetWordFromCfg(410012057)
				local var_232_17 = arg_229_1:FormatText(var_232_16.content)

				arg_229_1.text_.text = var_232_17

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_18 = 28
				local var_232_19 = utf8.len(var_232_17)
				local var_232_20 = var_232_18 <= 0 and var_232_14 or var_232_14 * (var_232_19 / var_232_18)

				if var_232_20 > 0 and var_232_14 < var_232_20 then
					arg_229_1.talkMaxDuration = var_232_20

					if var_232_20 + var_232_13 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_20 + var_232_13
					end
				end

				arg_229_1.text_.text = var_232_17
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012057", "story_v_out_410012.awb") ~= 0 then
					local var_232_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012057", "story_v_out_410012.awb") / 1000

					if var_232_21 + var_232_13 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_21 + var_232_13
					end

					if var_232_16.prefab_name ~= "" and arg_229_1.actors_[var_232_16.prefab_name] ~= nil then
						local var_232_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_16.prefab_name].transform, "story_v_out_410012", "410012057", "story_v_out_410012.awb")

						arg_229_1:RecordAudio("410012057", var_232_22)
						arg_229_1:RecordAudio("410012057", var_232_22)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_410012", "410012057", "story_v_out_410012.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_410012", "410012057", "story_v_out_410012.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_23 = math.max(var_232_14, arg_229_1.talkMaxDuration)

			if var_232_13 <= arg_229_1.time_ and arg_229_1.time_ < var_232_13 + var_232_23 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_13) / var_232_23

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_13 + var_232_23 and arg_229_1.time_ < var_232_13 + var_232_23 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play410012058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 410012058
		arg_233_1.duration_ = 5

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play410012059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["10062"].transform
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				arg_233_1.var_.moveOldPos10062 = var_236_0.localPosition
				var_236_0.localScale = Vector3.New(1, 1, 1)

				arg_233_1:CheckSpriteTmpPos("10062", 3)

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
				local var_236_6 = Vector3.New(0, -390, -290)

				var_236_0.localPosition = Vector3.Lerp(arg_233_1.var_.moveOldPos10062, var_236_6, var_236_5)
			end

			if arg_233_1.time_ >= var_236_1 + var_236_4 and arg_233_1.time_ < var_236_1 + var_236_4 + arg_236_0 then
				var_236_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_236_7 = arg_233_1.actors_["10062"]
			local var_236_8 = 0

			if var_236_8 < arg_233_1.time_ and arg_233_1.time_ <= var_236_8 + arg_236_0 and arg_233_1.var_.actorSpriteComps10062 == nil then
				arg_233_1.var_.actorSpriteComps10062 = var_236_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_236_9 = 0.034

			if var_236_8 <= arg_233_1.time_ and arg_233_1.time_ < var_236_8 + var_236_9 then
				local var_236_10 = (arg_233_1.time_ - var_236_8) / var_236_9

				if arg_233_1.var_.actorSpriteComps10062 then
					for iter_236_1, iter_236_2 in pairs(arg_233_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_236_2 then
							local var_236_11 = Mathf.Lerp(iter_236_2.color.r, 0.5, var_236_10)

							iter_236_2.color = Color.New(var_236_11, var_236_11, var_236_11)
						end
					end
				end
			end

			if arg_233_1.time_ >= var_236_8 + var_236_9 and arg_233_1.time_ < var_236_8 + var_236_9 + arg_236_0 and arg_233_1.var_.actorSpriteComps10062 then
				local var_236_12 = 0.5

				for iter_236_3, iter_236_4 in pairs(arg_233_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_236_4 then
						iter_236_4.color = Color.New(var_236_12, var_236_12, var_236_12)
					end
				end

				arg_233_1.var_.actorSpriteComps10062 = nil
			end

			local var_236_13 = arg_233_1.actors_["1060"].transform
			local var_236_14 = 0

			if var_236_14 < arg_233_1.time_ and arg_233_1.time_ <= var_236_14 + arg_236_0 then
				arg_233_1.var_.moveOldPos1060 = var_236_13.localPosition
				var_236_13.localScale = Vector3.New(1, 1, 1)

				arg_233_1:CheckSpriteTmpPos("1060", 7)

				local var_236_15 = var_236_13.childCount

				for iter_236_5 = 0, var_236_15 - 1 do
					local var_236_16 = var_236_13:GetChild(iter_236_5)

					if var_236_16.name == "" or not string.find(var_236_16.name, "split") then
						var_236_16.gameObject:SetActive(true)
					else
						var_236_16.gameObject:SetActive(false)
					end
				end
			end

			local var_236_17 = 0.001

			if var_236_14 <= arg_233_1.time_ and arg_233_1.time_ < var_236_14 + var_236_17 then
				local var_236_18 = (arg_233_1.time_ - var_236_14) / var_236_17
				local var_236_19 = Vector3.New(0, -2000, -40)

				var_236_13.localPosition = Vector3.Lerp(arg_233_1.var_.moveOldPos1060, var_236_19, var_236_18)
			end

			if arg_233_1.time_ >= var_236_14 + var_236_17 and arg_233_1.time_ < var_236_14 + var_236_17 + arg_236_0 then
				var_236_13.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_236_20 = 0
			local var_236_21 = 1.4

			if var_236_20 < arg_233_1.time_ and arg_233_1.time_ <= var_236_20 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, false)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_22 = arg_233_1:GetWordFromCfg(410012058)
				local var_236_23 = arg_233_1:FormatText(var_236_22.content)

				arg_233_1.text_.text = var_236_23

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_24 = 56
				local var_236_25 = utf8.len(var_236_23)
				local var_236_26 = var_236_24 <= 0 and var_236_21 or var_236_21 * (var_236_25 / var_236_24)

				if var_236_26 > 0 and var_236_21 < var_236_26 then
					arg_233_1.talkMaxDuration = var_236_26

					if var_236_26 + var_236_20 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_26 + var_236_20
					end
				end

				arg_233_1.text_.text = var_236_23
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)
				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_27 = math.max(var_236_21, arg_233_1.talkMaxDuration)

			if var_236_20 <= arg_233_1.time_ and arg_233_1.time_ < var_236_20 + var_236_27 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_20) / var_236_27

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_20 + var_236_27 and arg_233_1.time_ < var_236_20 + var_236_27 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play410012059 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 410012059
		arg_237_1.duration_ = 5

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play410012060(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["10062"].transform
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 then
				arg_237_1.var_.moveOldPos10062 = var_240_0.localPosition
				var_240_0.localScale = Vector3.New(1, 1, 1)

				arg_237_1:CheckSpriteTmpPos("10062", 7)

				local var_240_2 = var_240_0.childCount

				for iter_240_0 = 0, var_240_2 - 1 do
					local var_240_3 = var_240_0:GetChild(iter_240_0)

					if var_240_3.name == "" or not string.find(var_240_3.name, "split") then
						var_240_3.gameObject:SetActive(true)
					else
						var_240_3.gameObject:SetActive(false)
					end
				end
			end

			local var_240_4 = 0.001

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_4 then
				local var_240_5 = (arg_237_1.time_ - var_240_1) / var_240_4
				local var_240_6 = Vector3.New(0, -2000, -290)

				var_240_0.localPosition = Vector3.Lerp(arg_237_1.var_.moveOldPos10062, var_240_6, var_240_5)
			end

			if arg_237_1.time_ >= var_240_1 + var_240_4 and arg_237_1.time_ < var_240_1 + var_240_4 + arg_240_0 then
				var_240_0.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_240_7 = arg_237_1.actors_["10062"]
			local var_240_8 = 0

			if var_240_8 < arg_237_1.time_ and arg_237_1.time_ <= var_240_8 + arg_240_0 and arg_237_1.var_.actorSpriteComps10062 == nil then
				arg_237_1.var_.actorSpriteComps10062 = var_240_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_240_9 = 0.034

			if var_240_8 <= arg_237_1.time_ and arg_237_1.time_ < var_240_8 + var_240_9 then
				local var_240_10 = (arg_237_1.time_ - var_240_8) / var_240_9

				if arg_237_1.var_.actorSpriteComps10062 then
					for iter_240_1, iter_240_2 in pairs(arg_237_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_240_2 then
							local var_240_11 = Mathf.Lerp(iter_240_2.color.r, 0.5, var_240_10)

							iter_240_2.color = Color.New(var_240_11, var_240_11, var_240_11)
						end
					end
				end
			end

			if arg_237_1.time_ >= var_240_8 + var_240_9 and arg_237_1.time_ < var_240_8 + var_240_9 + arg_240_0 and arg_237_1.var_.actorSpriteComps10062 then
				local var_240_12 = 0.5

				for iter_240_3, iter_240_4 in pairs(arg_237_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_240_4 then
						iter_240_4.color = Color.New(var_240_12, var_240_12, var_240_12)
					end
				end

				arg_237_1.var_.actorSpriteComps10062 = nil
			end

			local var_240_13 = 0
			local var_240_14 = 1.475

			if var_240_13 < arg_237_1.time_ and arg_237_1.time_ <= var_240_13 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, false)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_15 = arg_237_1:GetWordFromCfg(410012059)
				local var_240_16 = arg_237_1:FormatText(var_240_15.content)

				arg_237_1.text_.text = var_240_16

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_17 = 59
				local var_240_18 = utf8.len(var_240_16)
				local var_240_19 = var_240_17 <= 0 and var_240_14 or var_240_14 * (var_240_18 / var_240_17)

				if var_240_19 > 0 and var_240_14 < var_240_19 then
					arg_237_1.talkMaxDuration = var_240_19

					if var_240_19 + var_240_13 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_19 + var_240_13
					end
				end

				arg_237_1.text_.text = var_240_16
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)
				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_20 = math.max(var_240_14, arg_237_1.talkMaxDuration)

			if var_240_13 <= arg_237_1.time_ and arg_237_1.time_ < var_240_13 + var_240_20 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_13) / var_240_20

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_13 + var_240_20 and arg_237_1.time_ < var_240_13 + var_240_20 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play410012060 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 410012060
		arg_241_1.duration_ = 9.6

		local var_241_0 = {
			zh = 9.6,
			ja = 8.566
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
				arg_241_0:Play410012061(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["1060"].transform
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				arg_241_1.var_.moveOldPos1060 = var_244_0.localPosition
				var_244_0.localScale = Vector3.New(1, 1, 1)

				arg_241_1:CheckSpriteTmpPos("1060", 2)

				local var_244_2 = var_244_0.childCount

				for iter_244_0 = 0, var_244_2 - 1 do
					local var_244_3 = var_244_0:GetChild(iter_244_0)

					if var_244_3.name == "" or not string.find(var_244_3.name, "split") then
						var_244_3.gameObject:SetActive(true)
					else
						var_244_3.gameObject:SetActive(false)
					end
				end
			end

			local var_244_4 = 0.001

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_4 then
				local var_244_5 = (arg_241_1.time_ - var_244_1) / var_244_4
				local var_244_6 = Vector3.New(-390, -435, -40)

				var_244_0.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos1060, var_244_6, var_244_5)
			end

			if arg_241_1.time_ >= var_244_1 + var_244_4 and arg_241_1.time_ < var_244_1 + var_244_4 + arg_244_0 then
				var_244_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_244_7 = arg_241_1.actors_["10061"].transform
			local var_244_8 = 0

			if var_244_8 < arg_241_1.time_ and arg_241_1.time_ <= var_244_8 + arg_244_0 then
				arg_241_1.var_.moveOldPos10061 = var_244_7.localPosition
				var_244_7.localScale = Vector3.New(1, 1, 1)

				arg_241_1:CheckSpriteTmpPos("10061", 4)

				local var_244_9 = var_244_7.childCount

				for iter_244_1 = 0, var_244_9 - 1 do
					local var_244_10 = var_244_7:GetChild(iter_244_1)

					if var_244_10.name == "" or not string.find(var_244_10.name, "split") then
						var_244_10.gameObject:SetActive(true)
					else
						var_244_10.gameObject:SetActive(false)
					end
				end
			end

			local var_244_11 = 0.001

			if var_244_8 <= arg_241_1.time_ and arg_241_1.time_ < var_244_8 + var_244_11 then
				local var_244_12 = (arg_241_1.time_ - var_244_8) / var_244_11
				local var_244_13 = Vector3.New(390, -517.5, -100)

				var_244_7.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos10061, var_244_13, var_244_12)
			end

			if arg_241_1.time_ >= var_244_8 + var_244_11 and arg_241_1.time_ < var_244_8 + var_244_11 + arg_244_0 then
				var_244_7.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_244_14 = arg_241_1.actors_["1060"]
			local var_244_15 = 0

			if var_244_15 < arg_241_1.time_ and arg_241_1.time_ <= var_244_15 + arg_244_0 and arg_241_1.var_.actorSpriteComps1060 == nil then
				arg_241_1.var_.actorSpriteComps1060 = var_244_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_244_16 = 0.034

			if var_244_15 <= arg_241_1.time_ and arg_241_1.time_ < var_244_15 + var_244_16 then
				local var_244_17 = (arg_241_1.time_ - var_244_15) / var_244_16

				if arg_241_1.var_.actorSpriteComps1060 then
					for iter_244_2, iter_244_3 in pairs(arg_241_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_244_3 then
							local var_244_18 = Mathf.Lerp(iter_244_3.color.r, 1, var_244_17)

							iter_244_3.color = Color.New(var_244_18, var_244_18, var_244_18)
						end
					end
				end
			end

			if arg_241_1.time_ >= var_244_15 + var_244_16 and arg_241_1.time_ < var_244_15 + var_244_16 + arg_244_0 and arg_241_1.var_.actorSpriteComps1060 then
				local var_244_19 = 1

				for iter_244_4, iter_244_5 in pairs(arg_241_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_244_5 then
						iter_244_5.color = Color.New(var_244_19, var_244_19, var_244_19)
					end
				end

				arg_241_1.var_.actorSpriteComps1060 = nil
			end

			local var_244_20 = arg_241_1.actors_["10061"]
			local var_244_21 = 0

			if var_244_21 < arg_241_1.time_ and arg_241_1.time_ <= var_244_21 + arg_244_0 and arg_241_1.var_.actorSpriteComps10061 == nil then
				arg_241_1.var_.actorSpriteComps10061 = var_244_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_244_22 = 0.034

			if var_244_21 <= arg_241_1.time_ and arg_241_1.time_ < var_244_21 + var_244_22 then
				local var_244_23 = (arg_241_1.time_ - var_244_21) / var_244_22

				if arg_241_1.var_.actorSpriteComps10061 then
					for iter_244_6, iter_244_7 in pairs(arg_241_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_244_7 then
							local var_244_24 = Mathf.Lerp(iter_244_7.color.r, 0.5, var_244_23)

							iter_244_7.color = Color.New(var_244_24, var_244_24, var_244_24)
						end
					end
				end
			end

			if arg_241_1.time_ >= var_244_21 + var_244_22 and arg_241_1.time_ < var_244_21 + var_244_22 + arg_244_0 and arg_241_1.var_.actorSpriteComps10061 then
				local var_244_25 = 0.5

				for iter_244_8, iter_244_9 in pairs(arg_241_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_244_9 then
						iter_244_9.color = Color.New(var_244_25, var_244_25, var_244_25)
					end
				end

				arg_241_1.var_.actorSpriteComps10061 = nil
			end

			local var_244_26 = arg_241_1.actors_["10062"].transform
			local var_244_27 = 0

			if var_244_27 < arg_241_1.time_ and arg_241_1.time_ <= var_244_27 + arg_244_0 then
				arg_241_1.var_.moveOldPos10062 = var_244_26.localPosition
				var_244_26.localScale = Vector3.New(1, 1, 1)

				arg_241_1:CheckSpriteTmpPos("10062", 7)

				local var_244_28 = var_244_26.childCount

				for iter_244_10 = 0, var_244_28 - 1 do
					local var_244_29 = var_244_26:GetChild(iter_244_10)

					if var_244_29.name == "" or not string.find(var_244_29.name, "split") then
						var_244_29.gameObject:SetActive(true)
					else
						var_244_29.gameObject:SetActive(false)
					end
				end
			end

			local var_244_30 = 0.001

			if var_244_27 <= arg_241_1.time_ and arg_241_1.time_ < var_244_27 + var_244_30 then
				local var_244_31 = (arg_241_1.time_ - var_244_27) / var_244_30
				local var_244_32 = Vector3.New(0, -2000, -290)

				var_244_26.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos10062, var_244_32, var_244_31)
			end

			if arg_241_1.time_ >= var_244_27 + var_244_30 and arg_241_1.time_ < var_244_27 + var_244_30 + arg_244_0 then
				var_244_26.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_244_33 = 0
			local var_244_34 = 1.025

			if var_244_33 < arg_241_1.time_ and arg_241_1.time_ <= var_244_33 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_35 = arg_241_1:FormatText(StoryNameCfg[584].name)

				arg_241_1.leftNameTxt_.text = var_244_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_36 = arg_241_1:GetWordFromCfg(410012060)
				local var_244_37 = arg_241_1:FormatText(var_244_36.content)

				arg_241_1.text_.text = var_244_37

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_38 = 41
				local var_244_39 = utf8.len(var_244_37)
				local var_244_40 = var_244_38 <= 0 and var_244_34 or var_244_34 * (var_244_39 / var_244_38)

				if var_244_40 > 0 and var_244_34 < var_244_40 then
					arg_241_1.talkMaxDuration = var_244_40

					if var_244_40 + var_244_33 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_40 + var_244_33
					end
				end

				arg_241_1.text_.text = var_244_37
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012060", "story_v_out_410012.awb") ~= 0 then
					local var_244_41 = manager.audio:GetVoiceLength("story_v_out_410012", "410012060", "story_v_out_410012.awb") / 1000

					if var_244_41 + var_244_33 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_41 + var_244_33
					end

					if var_244_36.prefab_name ~= "" and arg_241_1.actors_[var_244_36.prefab_name] ~= nil then
						local var_244_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_36.prefab_name].transform, "story_v_out_410012", "410012060", "story_v_out_410012.awb")

						arg_241_1:RecordAudio("410012060", var_244_42)
						arg_241_1:RecordAudio("410012060", var_244_42)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_410012", "410012060", "story_v_out_410012.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_410012", "410012060", "story_v_out_410012.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_43 = math.max(var_244_34, arg_241_1.talkMaxDuration)

			if var_244_33 <= arg_241_1.time_ and arg_241_1.time_ < var_244_33 + var_244_43 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_33) / var_244_43

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_33 + var_244_43 and arg_241_1.time_ < var_244_33 + var_244_43 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play410012061 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 410012061
		arg_245_1.duration_ = 2.133

		local var_245_0 = {
			zh = 1.233,
			ja = 2.133
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
				arg_245_0:Play410012062(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["10061"].transform
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 then
				arg_245_1.var_.moveOldPos10061 = var_248_0.localPosition
				var_248_0.localScale = Vector3.New(1, 1, 1)

				arg_245_1:CheckSpriteTmpPos("10061", 4)

				local var_248_2 = var_248_0.childCount

				for iter_248_0 = 0, var_248_2 - 1 do
					local var_248_3 = var_248_0:GetChild(iter_248_0)

					if var_248_3.name == "split_5" or not string.find(var_248_3.name, "split") then
						var_248_3.gameObject:SetActive(true)
					else
						var_248_3.gameObject:SetActive(false)
					end
				end
			end

			local var_248_4 = 0.001

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_4 then
				local var_248_5 = (arg_245_1.time_ - var_248_1) / var_248_4
				local var_248_6 = Vector3.New(390, -517.5, -100)

				var_248_0.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos10061, var_248_6, var_248_5)
			end

			if arg_245_1.time_ >= var_248_1 + var_248_4 and arg_245_1.time_ < var_248_1 + var_248_4 + arg_248_0 then
				var_248_0.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_248_7 = arg_245_1.actors_["10061"]
			local var_248_8 = 0

			if var_248_8 < arg_245_1.time_ and arg_245_1.time_ <= var_248_8 + arg_248_0 and arg_245_1.var_.actorSpriteComps10061 == nil then
				arg_245_1.var_.actorSpriteComps10061 = var_248_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_248_9 = 0.034

			if var_248_8 <= arg_245_1.time_ and arg_245_1.time_ < var_248_8 + var_248_9 then
				local var_248_10 = (arg_245_1.time_ - var_248_8) / var_248_9

				if arg_245_1.var_.actorSpriteComps10061 then
					for iter_248_1, iter_248_2 in pairs(arg_245_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_248_2 then
							local var_248_11 = Mathf.Lerp(iter_248_2.color.r, 1, var_248_10)

							iter_248_2.color = Color.New(var_248_11, var_248_11, var_248_11)
						end
					end
				end
			end

			if arg_245_1.time_ >= var_248_8 + var_248_9 and arg_245_1.time_ < var_248_8 + var_248_9 + arg_248_0 and arg_245_1.var_.actorSpriteComps10061 then
				local var_248_12 = 1

				for iter_248_3, iter_248_4 in pairs(arg_245_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_248_4 then
						iter_248_4.color = Color.New(var_248_12, var_248_12, var_248_12)
					end
				end

				arg_245_1.var_.actorSpriteComps10061 = nil
			end

			local var_248_13 = arg_245_1.actors_["1060"]
			local var_248_14 = 0

			if var_248_14 < arg_245_1.time_ and arg_245_1.time_ <= var_248_14 + arg_248_0 and arg_245_1.var_.actorSpriteComps1060 == nil then
				arg_245_1.var_.actorSpriteComps1060 = var_248_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_248_15 = 0.034

			if var_248_14 <= arg_245_1.time_ and arg_245_1.time_ < var_248_14 + var_248_15 then
				local var_248_16 = (arg_245_1.time_ - var_248_14) / var_248_15

				if arg_245_1.var_.actorSpriteComps1060 then
					for iter_248_5, iter_248_6 in pairs(arg_245_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_248_6 then
							local var_248_17 = Mathf.Lerp(iter_248_6.color.r, 0.5, var_248_16)

							iter_248_6.color = Color.New(var_248_17, var_248_17, var_248_17)
						end
					end
				end
			end

			if arg_245_1.time_ >= var_248_14 + var_248_15 and arg_245_1.time_ < var_248_14 + var_248_15 + arg_248_0 and arg_245_1.var_.actorSpriteComps1060 then
				local var_248_18 = 0.5

				for iter_248_7, iter_248_8 in pairs(arg_245_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_248_8 then
						iter_248_8.color = Color.New(var_248_18, var_248_18, var_248_18)
					end
				end

				arg_245_1.var_.actorSpriteComps1060 = nil
			end

			local var_248_19 = 0
			local var_248_20 = 0.05

			if var_248_19 < arg_245_1.time_ and arg_245_1.time_ <= var_248_19 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_21 = arg_245_1:FormatText(StoryNameCfg[591].name)

				arg_245_1.leftNameTxt_.text = var_248_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_22 = arg_245_1:GetWordFromCfg(410012061)
				local var_248_23 = arg_245_1:FormatText(var_248_22.content)

				arg_245_1.text_.text = var_248_23

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_24 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012061", "story_v_out_410012.awb") ~= 0 then
					local var_248_27 = manager.audio:GetVoiceLength("story_v_out_410012", "410012061", "story_v_out_410012.awb") / 1000

					if var_248_27 + var_248_19 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_27 + var_248_19
					end

					if var_248_22.prefab_name ~= "" and arg_245_1.actors_[var_248_22.prefab_name] ~= nil then
						local var_248_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_22.prefab_name].transform, "story_v_out_410012", "410012061", "story_v_out_410012.awb")

						arg_245_1:RecordAudio("410012061", var_248_28)
						arg_245_1:RecordAudio("410012061", var_248_28)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_410012", "410012061", "story_v_out_410012.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_410012", "410012061", "story_v_out_410012.awb")
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
	Play410012062 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 410012062
		arg_249_1.duration_ = 5.5

		local var_249_0 = {
			zh = 2.1,
			ja = 5.5
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
				arg_249_0:Play410012063(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1060"].transform
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				arg_249_1.var_.moveOldPos1060 = var_252_0.localPosition
				var_252_0.localScale = Vector3.New(1, 1, 1)

				arg_249_1:CheckSpriteTmpPos("1060", 2)

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
				local var_252_6 = Vector3.New(-390, -435, -40)

				var_252_0.localPosition = Vector3.Lerp(arg_249_1.var_.moveOldPos1060, var_252_6, var_252_5)
			end

			if arg_249_1.time_ >= var_252_1 + var_252_4 and arg_249_1.time_ < var_252_1 + var_252_4 + arg_252_0 then
				var_252_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_252_7 = arg_249_1.actors_["1060"]
			local var_252_8 = 0

			if var_252_8 < arg_249_1.time_ and arg_249_1.time_ <= var_252_8 + arg_252_0 and arg_249_1.var_.actorSpriteComps1060 == nil then
				arg_249_1.var_.actorSpriteComps1060 = var_252_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_252_9 = 0.034

			if var_252_8 <= arg_249_1.time_ and arg_249_1.time_ < var_252_8 + var_252_9 then
				local var_252_10 = (arg_249_1.time_ - var_252_8) / var_252_9

				if arg_249_1.var_.actorSpriteComps1060 then
					for iter_252_1, iter_252_2 in pairs(arg_249_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_252_2 then
							local var_252_11 = Mathf.Lerp(iter_252_2.color.r, 1, var_252_10)

							iter_252_2.color = Color.New(var_252_11, var_252_11, var_252_11)
						end
					end
				end
			end

			if arg_249_1.time_ >= var_252_8 + var_252_9 and arg_249_1.time_ < var_252_8 + var_252_9 + arg_252_0 and arg_249_1.var_.actorSpriteComps1060 then
				local var_252_12 = 1

				for iter_252_3, iter_252_4 in pairs(arg_249_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_252_4 then
						iter_252_4.color = Color.New(var_252_12, var_252_12, var_252_12)
					end
				end

				arg_249_1.var_.actorSpriteComps1060 = nil
			end

			local var_252_13 = arg_249_1.actors_["10061"]
			local var_252_14 = 0

			if var_252_14 < arg_249_1.time_ and arg_249_1.time_ <= var_252_14 + arg_252_0 and arg_249_1.var_.actorSpriteComps10061 == nil then
				arg_249_1.var_.actorSpriteComps10061 = var_252_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_252_15 = 0.034

			if var_252_14 <= arg_249_1.time_ and arg_249_1.time_ < var_252_14 + var_252_15 then
				local var_252_16 = (arg_249_1.time_ - var_252_14) / var_252_15

				if arg_249_1.var_.actorSpriteComps10061 then
					for iter_252_5, iter_252_6 in pairs(arg_249_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_252_6 then
							local var_252_17 = Mathf.Lerp(iter_252_6.color.r, 0.5, var_252_16)

							iter_252_6.color = Color.New(var_252_17, var_252_17, var_252_17)
						end
					end
				end
			end

			if arg_249_1.time_ >= var_252_14 + var_252_15 and arg_249_1.time_ < var_252_14 + var_252_15 + arg_252_0 and arg_249_1.var_.actorSpriteComps10061 then
				local var_252_18 = 0.5

				for iter_252_7, iter_252_8 in pairs(arg_249_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_252_8 then
						iter_252_8.color = Color.New(var_252_18, var_252_18, var_252_18)
					end
				end

				arg_249_1.var_.actorSpriteComps10061 = nil
			end

			local var_252_19 = 0
			local var_252_20 = 0.25

			if var_252_19 < arg_249_1.time_ and arg_249_1.time_ <= var_252_19 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_21 = arg_249_1:FormatText(StoryNameCfg[584].name)

				arg_249_1.leftNameTxt_.text = var_252_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_22 = arg_249_1:GetWordFromCfg(410012062)
				local var_252_23 = arg_249_1:FormatText(var_252_22.content)

				arg_249_1.text_.text = var_252_23

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_24 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012062", "story_v_out_410012.awb") ~= 0 then
					local var_252_27 = manager.audio:GetVoiceLength("story_v_out_410012", "410012062", "story_v_out_410012.awb") / 1000

					if var_252_27 + var_252_19 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_27 + var_252_19
					end

					if var_252_22.prefab_name ~= "" and arg_249_1.actors_[var_252_22.prefab_name] ~= nil then
						local var_252_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_22.prefab_name].transform, "story_v_out_410012", "410012062", "story_v_out_410012.awb")

						arg_249_1:RecordAudio("410012062", var_252_28)
						arg_249_1:RecordAudio("410012062", var_252_28)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_410012", "410012062", "story_v_out_410012.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_410012", "410012062", "story_v_out_410012.awb")
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
	Play410012063 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 410012063
		arg_253_1.duration_ = 9.633

		local var_253_0 = {
			zh = 9.633,
			ja = 6.3
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
				arg_253_0:Play410012064(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 2

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				local var_256_1 = manager.ui.mainCamera.transform.localPosition
				local var_256_2 = Vector3.New(0, 0, 10) + Vector3.New(var_256_1.x, var_256_1.y, 0)
				local var_256_3 = arg_253_1.bgs_.L02f

				var_256_3.transform.localPosition = var_256_2
				var_256_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_256_4 = var_256_3:GetComponent("SpriteRenderer")

				if var_256_4 and var_256_4.sprite then
					local var_256_5 = (var_256_3.transform.localPosition - var_256_1).z
					local var_256_6 = manager.ui.mainCameraCom_
					local var_256_7 = 2 * var_256_5 * Mathf.Tan(var_256_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_256_8 = var_256_7 * var_256_6.aspect
					local var_256_9 = var_256_4.sprite.bounds.size.x
					local var_256_10 = var_256_4.sprite.bounds.size.y
					local var_256_11 = var_256_8 / var_256_9
					local var_256_12 = var_256_7 / var_256_10
					local var_256_13 = var_256_12 < var_256_11 and var_256_11 or var_256_12

					var_256_3.transform.localScale = Vector3.New(var_256_13, var_256_13, 0)
				end

				for iter_256_0, iter_256_1 in pairs(arg_253_1.bgs_) do
					if iter_256_0 ~= "L02f" then
						iter_256_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_256_14 = 0

			if var_256_14 < arg_253_1.time_ and arg_253_1.time_ <= var_256_14 + arg_256_0 then
				arg_253_1.mask_.enabled = true
				arg_253_1.mask_.raycastTarget = true

				arg_253_1:SetGaussion(false)
			end

			local var_256_15 = 2

			if var_256_14 <= arg_253_1.time_ and arg_253_1.time_ < var_256_14 + var_256_15 then
				local var_256_16 = (arg_253_1.time_ - var_256_14) / var_256_15
				local var_256_17 = Color.New(0, 0, 0)

				var_256_17.a = Mathf.Lerp(0, 1, var_256_16)
				arg_253_1.mask_.color = var_256_17
			end

			if arg_253_1.time_ >= var_256_14 + var_256_15 and arg_253_1.time_ < var_256_14 + var_256_15 + arg_256_0 then
				local var_256_18 = Color.New(0, 0, 0)

				var_256_18.a = 1
				arg_253_1.mask_.color = var_256_18
			end

			local var_256_19 = 2

			if var_256_19 < arg_253_1.time_ and arg_253_1.time_ <= var_256_19 + arg_256_0 then
				arg_253_1.mask_.enabled = true
				arg_253_1.mask_.raycastTarget = true

				arg_253_1:SetGaussion(false)
			end

			local var_256_20 = 2

			if var_256_19 <= arg_253_1.time_ and arg_253_1.time_ < var_256_19 + var_256_20 then
				local var_256_21 = (arg_253_1.time_ - var_256_19) / var_256_20
				local var_256_22 = Color.New(0, 0, 0)

				var_256_22.a = Mathf.Lerp(1, 0, var_256_21)
				arg_253_1.mask_.color = var_256_22
			end

			if arg_253_1.time_ >= var_256_19 + var_256_20 and arg_253_1.time_ < var_256_19 + var_256_20 + arg_256_0 then
				local var_256_23 = Color.New(0, 0, 0)
				local var_256_24 = 0

				arg_253_1.mask_.enabled = false
				var_256_23.a = var_256_24
				arg_253_1.mask_.color = var_256_23
			end

			local var_256_25 = arg_253_1.actors_["10061"].transform
			local var_256_26 = 2

			if var_256_26 < arg_253_1.time_ and arg_253_1.time_ <= var_256_26 + arg_256_0 then
				arg_253_1.var_.moveOldPos10061 = var_256_25.localPosition
				var_256_25.localScale = Vector3.New(1, 1, 1)

				arg_253_1:CheckSpriteTmpPos("10061", 7)

				local var_256_27 = var_256_25.childCount

				for iter_256_2 = 0, var_256_27 - 1 do
					local var_256_28 = var_256_25:GetChild(iter_256_2)

					if var_256_28.name == "split_3" or not string.find(var_256_28.name, "split") then
						var_256_28.gameObject:SetActive(true)
					else
						var_256_28.gameObject:SetActive(false)
					end
				end
			end

			local var_256_29 = 0.001

			if var_256_26 <= arg_253_1.time_ and arg_253_1.time_ < var_256_26 + var_256_29 then
				local var_256_30 = (arg_253_1.time_ - var_256_26) / var_256_29
				local var_256_31 = Vector3.New(0, -2000, -100)

				var_256_25.localPosition = Vector3.Lerp(arg_253_1.var_.moveOldPos10061, var_256_31, var_256_30)
			end

			if arg_253_1.time_ >= var_256_26 + var_256_29 and arg_253_1.time_ < var_256_26 + var_256_29 + arg_256_0 then
				var_256_25.localPosition = Vector3.New(0, -2000, -100)
			end

			local var_256_32 = arg_253_1.actors_["1060"].transform
			local var_256_33 = 2

			if var_256_33 < arg_253_1.time_ and arg_253_1.time_ <= var_256_33 + arg_256_0 then
				arg_253_1.var_.moveOldPos1060 = var_256_32.localPosition
				var_256_32.localScale = Vector3.New(1, 1, 1)

				arg_253_1:CheckSpriteTmpPos("1060", 7)

				local var_256_34 = var_256_32.childCount

				for iter_256_3 = 0, var_256_34 - 1 do
					local var_256_35 = var_256_32:GetChild(iter_256_3)

					if var_256_35.name == "" or not string.find(var_256_35.name, "split") then
						var_256_35.gameObject:SetActive(true)
					else
						var_256_35.gameObject:SetActive(false)
					end
				end
			end

			local var_256_36 = 0.001

			if var_256_33 <= arg_253_1.time_ and arg_253_1.time_ < var_256_33 + var_256_36 then
				local var_256_37 = (arg_253_1.time_ - var_256_33) / var_256_36
				local var_256_38 = Vector3.New(0, -2000, -40)

				var_256_32.localPosition = Vector3.Lerp(arg_253_1.var_.moveOldPos1060, var_256_38, var_256_37)
			end

			if arg_253_1.time_ >= var_256_33 + var_256_36 and arg_253_1.time_ < var_256_33 + var_256_36 + arg_256_0 then
				var_256_32.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_256_39 = arg_253_1.actors_["10061"]
			local var_256_40 = 4

			if var_256_40 < arg_253_1.time_ and arg_253_1.time_ <= var_256_40 + arg_256_0 and arg_253_1.var_.actorSpriteComps10061 == nil then
				arg_253_1.var_.actorSpriteComps10061 = var_256_39:GetComponentsInChildren(typeof(Image), true)
			end

			local var_256_41 = 0.034

			if var_256_40 <= arg_253_1.time_ and arg_253_1.time_ < var_256_40 + var_256_41 then
				local var_256_42 = (arg_253_1.time_ - var_256_40) / var_256_41

				if arg_253_1.var_.actorSpriteComps10061 then
					for iter_256_4, iter_256_5 in pairs(arg_253_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_256_5 then
							local var_256_43 = Mathf.Lerp(iter_256_5.color.r, 1, var_256_42)

							iter_256_5.color = Color.New(var_256_43, var_256_43, var_256_43)
						end
					end
				end
			end

			if arg_253_1.time_ >= var_256_40 + var_256_41 and arg_253_1.time_ < var_256_40 + var_256_41 + arg_256_0 and arg_253_1.var_.actorSpriteComps10061 then
				local var_256_44 = 1

				for iter_256_6, iter_256_7 in pairs(arg_253_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_256_7 then
						iter_256_7.color = Color.New(var_256_44, var_256_44, var_256_44)
					end
				end

				arg_253_1.var_.actorSpriteComps10061 = nil
			end

			local var_256_45 = arg_253_1.actors_["1060"]
			local var_256_46 = 2

			if var_256_46 < arg_253_1.time_ and arg_253_1.time_ <= var_256_46 + arg_256_0 and arg_253_1.var_.actorSpriteComps1060 == nil then
				arg_253_1.var_.actorSpriteComps1060 = var_256_45:GetComponentsInChildren(typeof(Image), true)
			end

			local var_256_47 = 0.034

			if var_256_46 <= arg_253_1.time_ and arg_253_1.time_ < var_256_46 + var_256_47 then
				local var_256_48 = (arg_253_1.time_ - var_256_46) / var_256_47

				if arg_253_1.var_.actorSpriteComps1060 then
					for iter_256_8, iter_256_9 in pairs(arg_253_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_256_9 then
							local var_256_49 = Mathf.Lerp(iter_256_9.color.r, 0.5, var_256_48)

							iter_256_9.color = Color.New(var_256_49, var_256_49, var_256_49)
						end
					end
				end
			end

			if arg_253_1.time_ >= var_256_46 + var_256_47 and arg_253_1.time_ < var_256_46 + var_256_47 + arg_256_0 and arg_253_1.var_.actorSpriteComps1060 then
				local var_256_50 = 0.5

				for iter_256_10, iter_256_11 in pairs(arg_253_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_256_11 then
						iter_256_11.color = Color.New(var_256_50, var_256_50, var_256_50)
					end
				end

				arg_253_1.var_.actorSpriteComps1060 = nil
			end

			local var_256_51 = arg_253_1.actors_["10061"].transform
			local var_256_52 = 4

			if var_256_52 < arg_253_1.time_ and arg_253_1.time_ <= var_256_52 + arg_256_0 then
				arg_253_1.var_.moveOldPos10061 = var_256_51.localPosition
				var_256_51.localScale = Vector3.New(1, 1, 1)

				arg_253_1:CheckSpriteTmpPos("10061", 3)

				local var_256_53 = var_256_51.childCount

				for iter_256_12 = 0, var_256_53 - 1 do
					local var_256_54 = var_256_51:GetChild(iter_256_12)

					if var_256_54.name == "split_3" or not string.find(var_256_54.name, "split") then
						var_256_54.gameObject:SetActive(true)
					else
						var_256_54.gameObject:SetActive(false)
					end
				end
			end

			local var_256_55 = 0.001

			if var_256_52 <= arg_253_1.time_ and arg_253_1.time_ < var_256_52 + var_256_55 then
				local var_256_56 = (arg_253_1.time_ - var_256_52) / var_256_55
				local var_256_57 = Vector3.New(0, -517.5, -100)

				var_256_51.localPosition = Vector3.Lerp(arg_253_1.var_.moveOldPos10061, var_256_57, var_256_56)
			end

			if arg_253_1.time_ >= var_256_52 + var_256_55 and arg_253_1.time_ < var_256_52 + var_256_55 + arg_256_0 then
				var_256_51.localPosition = Vector3.New(0, -517.5, -100)
			end

			if arg_253_1.frameCnt_ <= 1 then
				arg_253_1.dialog_:SetActive(false)
			end

			local var_256_58 = 4
			local var_256_59 = 0.7

			if var_256_58 < arg_253_1.time_ and arg_253_1.time_ <= var_256_58 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0

				arg_253_1.dialog_:SetActive(true)

				local var_256_60 = LeanTween.value(arg_253_1.dialog_, 0, 1, 0.3)

				var_256_60:setOnUpdate(LuaHelper.FloatAction(function(arg_257_0)
					arg_253_1.dialogCg_.alpha = arg_257_0
				end))
				var_256_60:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_253_1.dialog_)
					var_256_60:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_253_1.duration_ = arg_253_1.duration_ + 0.3

				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_61 = arg_253_1:FormatText(StoryNameCfg[591].name)

				arg_253_1.leftNameTxt_.text = var_256_61

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_62 = arg_253_1:GetWordFromCfg(410012063)
				local var_256_63 = arg_253_1:FormatText(var_256_62.content)

				arg_253_1.text_.text = var_256_63

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_64 = 28
				local var_256_65 = utf8.len(var_256_63)
				local var_256_66 = var_256_64 <= 0 and var_256_59 or var_256_59 * (var_256_65 / var_256_64)

				if var_256_66 > 0 and var_256_59 < var_256_66 then
					arg_253_1.talkMaxDuration = var_256_66
					var_256_58 = var_256_58 + 0.3

					if var_256_66 + var_256_58 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_66 + var_256_58
					end
				end

				arg_253_1.text_.text = var_256_63
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012063", "story_v_out_410012.awb") ~= 0 then
					local var_256_67 = manager.audio:GetVoiceLength("story_v_out_410012", "410012063", "story_v_out_410012.awb") / 1000

					if var_256_67 + var_256_58 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_67 + var_256_58
					end

					if var_256_62.prefab_name ~= "" and arg_253_1.actors_[var_256_62.prefab_name] ~= nil then
						local var_256_68 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_62.prefab_name].transform, "story_v_out_410012", "410012063", "story_v_out_410012.awb")

						arg_253_1:RecordAudio("410012063", var_256_68)
						arg_253_1:RecordAudio("410012063", var_256_68)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_410012", "410012063", "story_v_out_410012.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_410012", "410012063", "story_v_out_410012.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_69 = var_256_58 + 0.3
			local var_256_70 = math.max(var_256_59, arg_253_1.talkMaxDuration)

			if var_256_69 <= arg_253_1.time_ and arg_253_1.time_ < var_256_69 + var_256_70 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_69) / var_256_70

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_69 + var_256_70 and arg_253_1.time_ < var_256_69 + var_256_70 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play410012064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 410012064
		arg_259_1.duration_ = 5.5

		local var_259_0 = {
			zh = 1.233,
			ja = 5.5
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
				arg_259_0:Play410012065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1060"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos1060 = var_262_0.localPosition
				var_262_0.localScale = Vector3.New(1, 1, 1)

				arg_259_1:CheckSpriteTmpPos("1060", 2)

				local var_262_2 = var_262_0.childCount

				for iter_262_0 = 0, var_262_2 - 1 do
					local var_262_3 = var_262_0:GetChild(iter_262_0)

					if var_262_3.name == "" or not string.find(var_262_3.name, "split") then
						var_262_3.gameObject:SetActive(true)
					else
						var_262_3.gameObject:SetActive(false)
					end
				end
			end

			local var_262_4 = 0.001

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_4 then
				local var_262_5 = (arg_259_1.time_ - var_262_1) / var_262_4
				local var_262_6 = Vector3.New(-390, -435, -40)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1060, var_262_6, var_262_5)
			end

			if arg_259_1.time_ >= var_262_1 + var_262_4 and arg_259_1.time_ < var_262_1 + var_262_4 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_262_7 = arg_259_1.actors_["10061"].transform
			local var_262_8 = 0

			if var_262_8 < arg_259_1.time_ and arg_259_1.time_ <= var_262_8 + arg_262_0 then
				arg_259_1.var_.moveOldPos10061 = var_262_7.localPosition
				var_262_7.localScale = Vector3.New(1, 1, 1)

				arg_259_1:CheckSpriteTmpPos("10061", 4)

				local var_262_9 = var_262_7.childCount

				for iter_262_1 = 0, var_262_9 - 1 do
					local var_262_10 = var_262_7:GetChild(iter_262_1)

					if var_262_10.name == "" or not string.find(var_262_10.name, "split") then
						var_262_10.gameObject:SetActive(true)
					else
						var_262_10.gameObject:SetActive(false)
					end
				end
			end

			local var_262_11 = 0.001

			if var_262_8 <= arg_259_1.time_ and arg_259_1.time_ < var_262_8 + var_262_11 then
				local var_262_12 = (arg_259_1.time_ - var_262_8) / var_262_11
				local var_262_13 = Vector3.New(390, -517.5, -100)

				var_262_7.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos10061, var_262_13, var_262_12)
			end

			if arg_259_1.time_ >= var_262_8 + var_262_11 and arg_259_1.time_ < var_262_8 + var_262_11 + arg_262_0 then
				var_262_7.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_262_14 = arg_259_1.actors_["1060"]
			local var_262_15 = 0

			if var_262_15 < arg_259_1.time_ and arg_259_1.time_ <= var_262_15 + arg_262_0 and arg_259_1.var_.actorSpriteComps1060 == nil then
				arg_259_1.var_.actorSpriteComps1060 = var_262_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_16 = 0.034

			if var_262_15 <= arg_259_1.time_ and arg_259_1.time_ < var_262_15 + var_262_16 then
				local var_262_17 = (arg_259_1.time_ - var_262_15) / var_262_16

				if arg_259_1.var_.actorSpriteComps1060 then
					for iter_262_2, iter_262_3 in pairs(arg_259_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_262_3 then
							local var_262_18 = Mathf.Lerp(iter_262_3.color.r, 1, var_262_17)

							iter_262_3.color = Color.New(var_262_18, var_262_18, var_262_18)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_15 + var_262_16 and arg_259_1.time_ < var_262_15 + var_262_16 + arg_262_0 and arg_259_1.var_.actorSpriteComps1060 then
				local var_262_19 = 1

				for iter_262_4, iter_262_5 in pairs(arg_259_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_262_5 then
						iter_262_5.color = Color.New(var_262_19, var_262_19, var_262_19)
					end
				end

				arg_259_1.var_.actorSpriteComps1060 = nil
			end

			local var_262_20 = arg_259_1.actors_["10061"]
			local var_262_21 = 0

			if var_262_21 < arg_259_1.time_ and arg_259_1.time_ <= var_262_21 + arg_262_0 and arg_259_1.var_.actorSpriteComps10061 == nil then
				arg_259_1.var_.actorSpriteComps10061 = var_262_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_22 = 0.034

			if var_262_21 <= arg_259_1.time_ and arg_259_1.time_ < var_262_21 + var_262_22 then
				local var_262_23 = (arg_259_1.time_ - var_262_21) / var_262_22

				if arg_259_1.var_.actorSpriteComps10061 then
					for iter_262_6, iter_262_7 in pairs(arg_259_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_262_7 then
							local var_262_24 = Mathf.Lerp(iter_262_7.color.r, 0.5, var_262_23)

							iter_262_7.color = Color.New(var_262_24, var_262_24, var_262_24)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_21 + var_262_22 and arg_259_1.time_ < var_262_21 + var_262_22 + arg_262_0 and arg_259_1.var_.actorSpriteComps10061 then
				local var_262_25 = 0.5

				for iter_262_8, iter_262_9 in pairs(arg_259_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_262_9 then
						iter_262_9.color = Color.New(var_262_25, var_262_25, var_262_25)
					end
				end

				arg_259_1.var_.actorSpriteComps10061 = nil
			end

			local var_262_26 = 0
			local var_262_27 = 0.15

			if var_262_26 < arg_259_1.time_ and arg_259_1.time_ <= var_262_26 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_28 = arg_259_1:FormatText(StoryNameCfg[584].name)

				arg_259_1.leftNameTxt_.text = var_262_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_29 = arg_259_1:GetWordFromCfg(410012064)
				local var_262_30 = arg_259_1:FormatText(var_262_29.content)

				arg_259_1.text_.text = var_262_30

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_31 = 6
				local var_262_32 = utf8.len(var_262_30)
				local var_262_33 = var_262_31 <= 0 and var_262_27 or var_262_27 * (var_262_32 / var_262_31)

				if var_262_33 > 0 and var_262_27 < var_262_33 then
					arg_259_1.talkMaxDuration = var_262_33

					if var_262_33 + var_262_26 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_33 + var_262_26
					end
				end

				arg_259_1.text_.text = var_262_30
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012064", "story_v_out_410012.awb") ~= 0 then
					local var_262_34 = manager.audio:GetVoiceLength("story_v_out_410012", "410012064", "story_v_out_410012.awb") / 1000

					if var_262_34 + var_262_26 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_34 + var_262_26
					end

					if var_262_29.prefab_name ~= "" and arg_259_1.actors_[var_262_29.prefab_name] ~= nil then
						local var_262_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_29.prefab_name].transform, "story_v_out_410012", "410012064", "story_v_out_410012.awb")

						arg_259_1:RecordAudio("410012064", var_262_35)
						arg_259_1:RecordAudio("410012064", var_262_35)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_410012", "410012064", "story_v_out_410012.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_410012", "410012064", "story_v_out_410012.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_36 = math.max(var_262_27, arg_259_1.talkMaxDuration)

			if var_262_26 <= arg_259_1.time_ and arg_259_1.time_ < var_262_26 + var_262_36 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_26) / var_262_36

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_26 + var_262_36 and arg_259_1.time_ < var_262_26 + var_262_36 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play410012065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 410012065
		arg_263_1.duration_ = 5

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play410012066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1060"]
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 and arg_263_1.var_.actorSpriteComps1060 == nil then
				arg_263_1.var_.actorSpriteComps1060 = var_266_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_2 = 0.034

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2

				if arg_263_1.var_.actorSpriteComps1060 then
					for iter_266_0, iter_266_1 in pairs(arg_263_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_266_1 then
							local var_266_4 = Mathf.Lerp(iter_266_1.color.r, 0.5, var_266_3)

							iter_266_1.color = Color.New(var_266_4, var_266_4, var_266_4)
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 and arg_263_1.var_.actorSpriteComps1060 then
				local var_266_5 = 0.5

				for iter_266_2, iter_266_3 in pairs(arg_263_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_266_3 then
						iter_266_3.color = Color.New(var_266_5, var_266_5, var_266_5)
					end
				end

				arg_263_1.var_.actorSpriteComps1060 = nil
			end

			local var_266_6 = 0
			local var_266_7 = 1.3

			if var_266_6 < arg_263_1.time_ and arg_263_1.time_ <= var_266_6 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, false)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_8 = arg_263_1:GetWordFromCfg(410012065)
				local var_266_9 = arg_263_1:FormatText(var_266_8.content)

				arg_263_1.text_.text = var_266_9

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_10 = 52
				local var_266_11 = utf8.len(var_266_9)
				local var_266_12 = var_266_10 <= 0 and var_266_7 or var_266_7 * (var_266_11 / var_266_10)

				if var_266_12 > 0 and var_266_7 < var_266_12 then
					arg_263_1.talkMaxDuration = var_266_12

					if var_266_12 + var_266_6 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_12 + var_266_6
					end
				end

				arg_263_1.text_.text = var_266_9
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)
				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_13 = math.max(var_266_7, arg_263_1.talkMaxDuration)

			if var_266_6 <= arg_263_1.time_ and arg_263_1.time_ < var_266_6 + var_266_13 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_6) / var_266_13

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_6 + var_266_13 and arg_263_1.time_ < var_266_6 + var_266_13 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play410012066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 410012066
		arg_267_1.duration_ = 5

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play410012067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 0
			local var_270_1 = 0.9

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, false)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_2 = arg_267_1:GetWordFromCfg(410012066)
				local var_270_3 = arg_267_1:FormatText(var_270_2.content)

				arg_267_1.text_.text = var_270_3

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_4 = 36
				local var_270_5 = utf8.len(var_270_3)
				local var_270_6 = var_270_4 <= 0 and var_270_1 or var_270_1 * (var_270_5 / var_270_4)

				if var_270_6 > 0 and var_270_1 < var_270_6 then
					arg_267_1.talkMaxDuration = var_270_6

					if var_270_6 + var_270_0 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_6 + var_270_0
					end
				end

				arg_267_1.text_.text = var_270_3
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_7 = math.max(var_270_1, arg_267_1.talkMaxDuration)

			if var_270_0 <= arg_267_1.time_ and arg_267_1.time_ < var_270_0 + var_270_7 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_0) / var_270_7

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_0 + var_270_7 and arg_267_1.time_ < var_270_0 + var_270_7 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play410012067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 410012067
		arg_271_1.duration_ = 12.766

		local var_271_0 = {
			zh = 6.5,
			ja = 12.766
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
				arg_271_0:Play410012068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1060"].transform
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1.var_.moveOldPos1060 = var_274_0.localPosition
				var_274_0.localScale = Vector3.New(1, 1, 1)

				arg_271_1:CheckSpriteTmpPos("1060", 2)

				local var_274_2 = var_274_0.childCount

				for iter_274_0 = 0, var_274_2 - 1 do
					local var_274_3 = var_274_0:GetChild(iter_274_0)

					if var_274_3.name == "split_1" or not string.find(var_274_3.name, "split") then
						var_274_3.gameObject:SetActive(true)
					else
						var_274_3.gameObject:SetActive(false)
					end
				end
			end

			local var_274_4 = 0.001

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_4 then
				local var_274_5 = (arg_271_1.time_ - var_274_1) / var_274_4
				local var_274_6 = Vector3.New(-390, -435, -40)

				var_274_0.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos1060, var_274_6, var_274_5)
			end

			if arg_271_1.time_ >= var_274_1 + var_274_4 and arg_271_1.time_ < var_274_1 + var_274_4 + arg_274_0 then
				var_274_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_274_7 = arg_271_1.actors_["1060"]
			local var_274_8 = 0

			if var_274_8 < arg_271_1.time_ and arg_271_1.time_ <= var_274_8 + arg_274_0 and arg_271_1.var_.actorSpriteComps1060 == nil then
				arg_271_1.var_.actorSpriteComps1060 = var_274_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_274_9 = 0.034

			if var_274_8 <= arg_271_1.time_ and arg_271_1.time_ < var_274_8 + var_274_9 then
				local var_274_10 = (arg_271_1.time_ - var_274_8) / var_274_9

				if arg_271_1.var_.actorSpriteComps1060 then
					for iter_274_1, iter_274_2 in pairs(arg_271_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_274_2 then
							local var_274_11 = Mathf.Lerp(iter_274_2.color.r, 1, var_274_10)

							iter_274_2.color = Color.New(var_274_11, var_274_11, var_274_11)
						end
					end
				end
			end

			if arg_271_1.time_ >= var_274_8 + var_274_9 and arg_271_1.time_ < var_274_8 + var_274_9 + arg_274_0 and arg_271_1.var_.actorSpriteComps1060 then
				local var_274_12 = 1

				for iter_274_3, iter_274_4 in pairs(arg_271_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_274_4 then
						iter_274_4.color = Color.New(var_274_12, var_274_12, var_274_12)
					end
				end

				arg_271_1.var_.actorSpriteComps1060 = nil
			end

			local var_274_13 = 0
			local var_274_14 = 0.7

			if var_274_13 < arg_271_1.time_ and arg_271_1.time_ <= var_274_13 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_15 = arg_271_1:FormatText(StoryNameCfg[584].name)

				arg_271_1.leftNameTxt_.text = var_274_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_16 = arg_271_1:GetWordFromCfg(410012067)
				local var_274_17 = arg_271_1:FormatText(var_274_16.content)

				arg_271_1.text_.text = var_274_17

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_18 = 28
				local var_274_19 = utf8.len(var_274_17)
				local var_274_20 = var_274_18 <= 0 and var_274_14 or var_274_14 * (var_274_19 / var_274_18)

				if var_274_20 > 0 and var_274_14 < var_274_20 then
					arg_271_1.talkMaxDuration = var_274_20

					if var_274_20 + var_274_13 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_20 + var_274_13
					end
				end

				arg_271_1.text_.text = var_274_17
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012067", "story_v_out_410012.awb") ~= 0 then
					local var_274_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012067", "story_v_out_410012.awb") / 1000

					if var_274_21 + var_274_13 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_21 + var_274_13
					end

					if var_274_16.prefab_name ~= "" and arg_271_1.actors_[var_274_16.prefab_name] ~= nil then
						local var_274_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_16.prefab_name].transform, "story_v_out_410012", "410012067", "story_v_out_410012.awb")

						arg_271_1:RecordAudio("410012067", var_274_22)
						arg_271_1:RecordAudio("410012067", var_274_22)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_410012", "410012067", "story_v_out_410012.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_410012", "410012067", "story_v_out_410012.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_23 = math.max(var_274_14, arg_271_1.talkMaxDuration)

			if var_274_13 <= arg_271_1.time_ and arg_271_1.time_ < var_274_13 + var_274_23 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_13) / var_274_23

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_13 + var_274_23 and arg_271_1.time_ < var_274_13 + var_274_23 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play410012068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 410012068
		arg_275_1.duration_ = 10.666

		local var_275_0 = {
			zh = 9.066,
			ja = 10.666
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
				arg_275_0:Play410012069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1060"].transform
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 then
				arg_275_1.var_.moveOldPos1060 = var_278_0.localPosition
				var_278_0.localScale = Vector3.New(1, 1, 1)

				arg_275_1:CheckSpriteTmpPos("1060", 2)

				local var_278_2 = var_278_0.childCount

				for iter_278_0 = 0, var_278_2 - 1 do
					local var_278_3 = var_278_0:GetChild(iter_278_0)

					if var_278_3.name == "" or not string.find(var_278_3.name, "split") then
						var_278_3.gameObject:SetActive(true)
					else
						var_278_3.gameObject:SetActive(false)
					end
				end
			end

			local var_278_4 = 0.001

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_4 then
				local var_278_5 = (arg_275_1.time_ - var_278_1) / var_278_4
				local var_278_6 = Vector3.New(-390, -435, -40)

				var_278_0.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1060, var_278_6, var_278_5)
			end

			if arg_275_1.time_ >= var_278_1 + var_278_4 and arg_275_1.time_ < var_278_1 + var_278_4 + arg_278_0 then
				var_278_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_278_7 = arg_275_1.actors_["1060"]
			local var_278_8 = 0

			if var_278_8 < arg_275_1.time_ and arg_275_1.time_ <= var_278_8 + arg_278_0 and arg_275_1.var_.actorSpriteComps1060 == nil then
				arg_275_1.var_.actorSpriteComps1060 = var_278_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_278_9 = 0.034

			if var_278_8 <= arg_275_1.time_ and arg_275_1.time_ < var_278_8 + var_278_9 then
				local var_278_10 = (arg_275_1.time_ - var_278_8) / var_278_9

				if arg_275_1.var_.actorSpriteComps1060 then
					for iter_278_1, iter_278_2 in pairs(arg_275_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_278_2 then
							local var_278_11 = Mathf.Lerp(iter_278_2.color.r, 1, var_278_10)

							iter_278_2.color = Color.New(var_278_11, var_278_11, var_278_11)
						end
					end
				end
			end

			if arg_275_1.time_ >= var_278_8 + var_278_9 and arg_275_1.time_ < var_278_8 + var_278_9 + arg_278_0 and arg_275_1.var_.actorSpriteComps1060 then
				local var_278_12 = 1

				for iter_278_3, iter_278_4 in pairs(arg_275_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_278_4 then
						iter_278_4.color = Color.New(var_278_12, var_278_12, var_278_12)
					end
				end

				arg_275_1.var_.actorSpriteComps1060 = nil
			end

			local var_278_13 = 0
			local var_278_14 = 1.175

			if var_278_13 < arg_275_1.time_ and arg_275_1.time_ <= var_278_13 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_15 = arg_275_1:FormatText(StoryNameCfg[584].name)

				arg_275_1.leftNameTxt_.text = var_278_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_16 = arg_275_1:GetWordFromCfg(410012068)
				local var_278_17 = arg_275_1:FormatText(var_278_16.content)

				arg_275_1.text_.text = var_278_17

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_18 = 47
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012068", "story_v_out_410012.awb") ~= 0 then
					local var_278_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012068", "story_v_out_410012.awb") / 1000

					if var_278_21 + var_278_13 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_21 + var_278_13
					end

					if var_278_16.prefab_name ~= "" and arg_275_1.actors_[var_278_16.prefab_name] ~= nil then
						local var_278_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_16.prefab_name].transform, "story_v_out_410012", "410012068", "story_v_out_410012.awb")

						arg_275_1:RecordAudio("410012068", var_278_22)
						arg_275_1:RecordAudio("410012068", var_278_22)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_410012", "410012068", "story_v_out_410012.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_410012", "410012068", "story_v_out_410012.awb")
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
	Play410012069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 410012069
		arg_279_1.duration_ = 6.3

		local var_279_0 = {
			zh = 2.166,
			ja = 6.3
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
				arg_279_0:Play410012070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["10061"].transform
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 then
				arg_279_1.var_.moveOldPos10061 = var_282_0.localPosition
				var_282_0.localScale = Vector3.New(1, 1, 1)

				arg_279_1:CheckSpriteTmpPos("10061", 4)

				local var_282_2 = var_282_0.childCount

				for iter_282_0 = 0, var_282_2 - 1 do
					local var_282_3 = var_282_0:GetChild(iter_282_0)

					if var_282_3.name == "" or not string.find(var_282_3.name, "split") then
						var_282_3.gameObject:SetActive(true)
					else
						var_282_3.gameObject:SetActive(false)
					end
				end
			end

			local var_282_4 = 0.001

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_4 then
				local var_282_5 = (arg_279_1.time_ - var_282_1) / var_282_4
				local var_282_6 = Vector3.New(390, -517.5, -100)

				var_282_0.localPosition = Vector3.Lerp(arg_279_1.var_.moveOldPos10061, var_282_6, var_282_5)
			end

			if arg_279_1.time_ >= var_282_1 + var_282_4 and arg_279_1.time_ < var_282_1 + var_282_4 + arg_282_0 then
				var_282_0.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_282_7 = arg_279_1.actors_["10061"]
			local var_282_8 = 0

			if var_282_8 < arg_279_1.time_ and arg_279_1.time_ <= var_282_8 + arg_282_0 and arg_279_1.var_.actorSpriteComps10061 == nil then
				arg_279_1.var_.actorSpriteComps10061 = var_282_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_282_9 = 0.034

			if var_282_8 <= arg_279_1.time_ and arg_279_1.time_ < var_282_8 + var_282_9 then
				local var_282_10 = (arg_279_1.time_ - var_282_8) / var_282_9

				if arg_279_1.var_.actorSpriteComps10061 then
					for iter_282_1, iter_282_2 in pairs(arg_279_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_282_2 then
							local var_282_11 = Mathf.Lerp(iter_282_2.color.r, 1, var_282_10)

							iter_282_2.color = Color.New(var_282_11, var_282_11, var_282_11)
						end
					end
				end
			end

			if arg_279_1.time_ >= var_282_8 + var_282_9 and arg_279_1.time_ < var_282_8 + var_282_9 + arg_282_0 and arg_279_1.var_.actorSpriteComps10061 then
				local var_282_12 = 1

				for iter_282_3, iter_282_4 in pairs(arg_279_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_282_4 then
						iter_282_4.color = Color.New(var_282_12, var_282_12, var_282_12)
					end
				end

				arg_279_1.var_.actorSpriteComps10061 = nil
			end

			local var_282_13 = arg_279_1.actors_["1060"]
			local var_282_14 = 0

			if var_282_14 < arg_279_1.time_ and arg_279_1.time_ <= var_282_14 + arg_282_0 and arg_279_1.var_.actorSpriteComps1060 == nil then
				arg_279_1.var_.actorSpriteComps1060 = var_282_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_282_15 = 0.034

			if var_282_14 <= arg_279_1.time_ and arg_279_1.time_ < var_282_14 + var_282_15 then
				local var_282_16 = (arg_279_1.time_ - var_282_14) / var_282_15

				if arg_279_1.var_.actorSpriteComps1060 then
					for iter_282_5, iter_282_6 in pairs(arg_279_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_282_6 then
							local var_282_17 = Mathf.Lerp(iter_282_6.color.r, 0.5, var_282_16)

							iter_282_6.color = Color.New(var_282_17, var_282_17, var_282_17)
						end
					end
				end
			end

			if arg_279_1.time_ >= var_282_14 + var_282_15 and arg_279_1.time_ < var_282_14 + var_282_15 + arg_282_0 and arg_279_1.var_.actorSpriteComps1060 then
				local var_282_18 = 0.5

				for iter_282_7, iter_282_8 in pairs(arg_279_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_282_8 then
						iter_282_8.color = Color.New(var_282_18, var_282_18, var_282_18)
					end
				end

				arg_279_1.var_.actorSpriteComps1060 = nil
			end

			local var_282_19 = 0
			local var_282_20 = 0.275

			if var_282_19 < arg_279_1.time_ and arg_279_1.time_ <= var_282_19 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_21 = arg_279_1:FormatText(StoryNameCfg[591].name)

				arg_279_1.leftNameTxt_.text = var_282_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_22 = arg_279_1:GetWordFromCfg(410012069)
				local var_282_23 = arg_279_1:FormatText(var_282_22.content)

				arg_279_1.text_.text = var_282_23

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_24 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012069", "story_v_out_410012.awb") ~= 0 then
					local var_282_27 = manager.audio:GetVoiceLength("story_v_out_410012", "410012069", "story_v_out_410012.awb") / 1000

					if var_282_27 + var_282_19 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_27 + var_282_19
					end

					if var_282_22.prefab_name ~= "" and arg_279_1.actors_[var_282_22.prefab_name] ~= nil then
						local var_282_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_22.prefab_name].transform, "story_v_out_410012", "410012069", "story_v_out_410012.awb")

						arg_279_1:RecordAudio("410012069", var_282_28)
						arg_279_1:RecordAudio("410012069", var_282_28)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_410012", "410012069", "story_v_out_410012.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_410012", "410012069", "story_v_out_410012.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_29 = math.max(var_282_20, arg_279_1.talkMaxDuration)

			if var_282_19 <= arg_279_1.time_ and arg_279_1.time_ < var_282_19 + var_282_29 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_19) / var_282_29

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_19 + var_282_29 and arg_279_1.time_ < var_282_19 + var_282_29 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play410012070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 410012070
		arg_283_1.duration_ = 7.2

		local var_283_0 = {
			zh = 2.9,
			ja = 7.2
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
				arg_283_0:Play410012071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["1060"].transform
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 then
				arg_283_1.var_.moveOldPos1060 = var_286_0.localPosition
				var_286_0.localScale = Vector3.New(1, 1, 1)

				arg_283_1:CheckSpriteTmpPos("1060", 2)

				local var_286_2 = var_286_0.childCount

				for iter_286_0 = 0, var_286_2 - 1 do
					local var_286_3 = var_286_0:GetChild(iter_286_0)

					if var_286_3.name == "" or not string.find(var_286_3.name, "split") then
						var_286_3.gameObject:SetActive(true)
					else
						var_286_3.gameObject:SetActive(false)
					end
				end
			end

			local var_286_4 = 0.001

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_4 then
				local var_286_5 = (arg_283_1.time_ - var_286_1) / var_286_4
				local var_286_6 = Vector3.New(-390, -435, -40)

				var_286_0.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos1060, var_286_6, var_286_5)
			end

			if arg_283_1.time_ >= var_286_1 + var_286_4 and arg_283_1.time_ < var_286_1 + var_286_4 + arg_286_0 then
				var_286_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_286_7 = arg_283_1.actors_["1060"]
			local var_286_8 = 0

			if var_286_8 < arg_283_1.time_ and arg_283_1.time_ <= var_286_8 + arg_286_0 and arg_283_1.var_.actorSpriteComps1060 == nil then
				arg_283_1.var_.actorSpriteComps1060 = var_286_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_286_9 = 0.034

			if var_286_8 <= arg_283_1.time_ and arg_283_1.time_ < var_286_8 + var_286_9 then
				local var_286_10 = (arg_283_1.time_ - var_286_8) / var_286_9

				if arg_283_1.var_.actorSpriteComps1060 then
					for iter_286_1, iter_286_2 in pairs(arg_283_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_286_2 then
							local var_286_11 = Mathf.Lerp(iter_286_2.color.r, 1, var_286_10)

							iter_286_2.color = Color.New(var_286_11, var_286_11, var_286_11)
						end
					end
				end
			end

			if arg_283_1.time_ >= var_286_8 + var_286_9 and arg_283_1.time_ < var_286_8 + var_286_9 + arg_286_0 and arg_283_1.var_.actorSpriteComps1060 then
				local var_286_12 = 1

				for iter_286_3, iter_286_4 in pairs(arg_283_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_286_4 then
						iter_286_4.color = Color.New(var_286_12, var_286_12, var_286_12)
					end
				end

				arg_283_1.var_.actorSpriteComps1060 = nil
			end

			local var_286_13 = arg_283_1.actors_["10061"]
			local var_286_14 = 0

			if var_286_14 < arg_283_1.time_ and arg_283_1.time_ <= var_286_14 + arg_286_0 and arg_283_1.var_.actorSpriteComps10061 == nil then
				arg_283_1.var_.actorSpriteComps10061 = var_286_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_286_15 = 0.034

			if var_286_14 <= arg_283_1.time_ and arg_283_1.time_ < var_286_14 + var_286_15 then
				local var_286_16 = (arg_283_1.time_ - var_286_14) / var_286_15

				if arg_283_1.var_.actorSpriteComps10061 then
					for iter_286_5, iter_286_6 in pairs(arg_283_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_286_6 then
							local var_286_17 = Mathf.Lerp(iter_286_6.color.r, 0.5, var_286_16)

							iter_286_6.color = Color.New(var_286_17, var_286_17, var_286_17)
						end
					end
				end
			end

			if arg_283_1.time_ >= var_286_14 + var_286_15 and arg_283_1.time_ < var_286_14 + var_286_15 + arg_286_0 and arg_283_1.var_.actorSpriteComps10061 then
				local var_286_18 = 0.5

				for iter_286_7, iter_286_8 in pairs(arg_283_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_286_8 then
						iter_286_8.color = Color.New(var_286_18, var_286_18, var_286_18)
					end
				end

				arg_283_1.var_.actorSpriteComps10061 = nil
			end

			local var_286_19 = 0
			local var_286_20 = 0.325

			if var_286_19 < arg_283_1.time_ and arg_283_1.time_ <= var_286_19 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_21 = arg_283_1:FormatText(StoryNameCfg[584].name)

				arg_283_1.leftNameTxt_.text = var_286_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_22 = arg_283_1:GetWordFromCfg(410012070)
				local var_286_23 = arg_283_1:FormatText(var_286_22.content)

				arg_283_1.text_.text = var_286_23

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_24 = 13
				local var_286_25 = utf8.len(var_286_23)
				local var_286_26 = var_286_24 <= 0 and var_286_20 or var_286_20 * (var_286_25 / var_286_24)

				if var_286_26 > 0 and var_286_20 < var_286_26 then
					arg_283_1.talkMaxDuration = var_286_26

					if var_286_26 + var_286_19 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_26 + var_286_19
					end
				end

				arg_283_1.text_.text = var_286_23
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012070", "story_v_out_410012.awb") ~= 0 then
					local var_286_27 = manager.audio:GetVoiceLength("story_v_out_410012", "410012070", "story_v_out_410012.awb") / 1000

					if var_286_27 + var_286_19 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_27 + var_286_19
					end

					if var_286_22.prefab_name ~= "" and arg_283_1.actors_[var_286_22.prefab_name] ~= nil then
						local var_286_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_22.prefab_name].transform, "story_v_out_410012", "410012070", "story_v_out_410012.awb")

						arg_283_1:RecordAudio("410012070", var_286_28)
						arg_283_1:RecordAudio("410012070", var_286_28)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_410012", "410012070", "story_v_out_410012.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_410012", "410012070", "story_v_out_410012.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_29 = math.max(var_286_20, arg_283_1.talkMaxDuration)

			if var_286_19 <= arg_283_1.time_ and arg_283_1.time_ < var_286_19 + var_286_29 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_19) / var_286_29

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_19 + var_286_29 and arg_283_1.time_ < var_286_19 + var_286_29 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play410012071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 410012071
		arg_287_1.duration_ = 11.466

		local var_287_0 = {
			zh = 9.266,
			ja = 11.466
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
				arg_287_0:Play410012072(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["10061"].transform
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 then
				arg_287_1.var_.moveOldPos10061 = var_290_0.localPosition
				var_290_0.localScale = Vector3.New(1, 1, 1)

				arg_287_1:CheckSpriteTmpPos("10061", 4)

				local var_290_2 = var_290_0.childCount

				for iter_290_0 = 0, var_290_2 - 1 do
					local var_290_3 = var_290_0:GetChild(iter_290_0)

					if var_290_3.name == "" or not string.find(var_290_3.name, "split") then
						var_290_3.gameObject:SetActive(true)
					else
						var_290_3.gameObject:SetActive(false)
					end
				end
			end

			local var_290_4 = 0.001

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_4 then
				local var_290_5 = (arg_287_1.time_ - var_290_1) / var_290_4
				local var_290_6 = Vector3.New(390, -517.5, -100)

				var_290_0.localPosition = Vector3.Lerp(arg_287_1.var_.moveOldPos10061, var_290_6, var_290_5)
			end

			if arg_287_1.time_ >= var_290_1 + var_290_4 and arg_287_1.time_ < var_290_1 + var_290_4 + arg_290_0 then
				var_290_0.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_290_7 = arg_287_1.actors_["10061"]
			local var_290_8 = 0

			if var_290_8 < arg_287_1.time_ and arg_287_1.time_ <= var_290_8 + arg_290_0 and arg_287_1.var_.actorSpriteComps10061 == nil then
				arg_287_1.var_.actorSpriteComps10061 = var_290_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_290_9 = 0.034

			if var_290_8 <= arg_287_1.time_ and arg_287_1.time_ < var_290_8 + var_290_9 then
				local var_290_10 = (arg_287_1.time_ - var_290_8) / var_290_9

				if arg_287_1.var_.actorSpriteComps10061 then
					for iter_290_1, iter_290_2 in pairs(arg_287_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_290_2 then
							local var_290_11 = Mathf.Lerp(iter_290_2.color.r, 1, var_290_10)

							iter_290_2.color = Color.New(var_290_11, var_290_11, var_290_11)
						end
					end
				end
			end

			if arg_287_1.time_ >= var_290_8 + var_290_9 and arg_287_1.time_ < var_290_8 + var_290_9 + arg_290_0 and arg_287_1.var_.actorSpriteComps10061 then
				local var_290_12 = 1

				for iter_290_3, iter_290_4 in pairs(arg_287_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_290_4 then
						iter_290_4.color = Color.New(var_290_12, var_290_12, var_290_12)
					end
				end

				arg_287_1.var_.actorSpriteComps10061 = nil
			end

			local var_290_13 = arg_287_1.actors_["1060"]
			local var_290_14 = 0

			if var_290_14 < arg_287_1.time_ and arg_287_1.time_ <= var_290_14 + arg_290_0 and arg_287_1.var_.actorSpriteComps1060 == nil then
				arg_287_1.var_.actorSpriteComps1060 = var_290_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_290_15 = 0.034

			if var_290_14 <= arg_287_1.time_ and arg_287_1.time_ < var_290_14 + var_290_15 then
				local var_290_16 = (arg_287_1.time_ - var_290_14) / var_290_15

				if arg_287_1.var_.actorSpriteComps1060 then
					for iter_290_5, iter_290_6 in pairs(arg_287_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_290_6 then
							local var_290_17 = Mathf.Lerp(iter_290_6.color.r, 0.5, var_290_16)

							iter_290_6.color = Color.New(var_290_17, var_290_17, var_290_17)
						end
					end
				end
			end

			if arg_287_1.time_ >= var_290_14 + var_290_15 and arg_287_1.time_ < var_290_14 + var_290_15 + arg_290_0 and arg_287_1.var_.actorSpriteComps1060 then
				local var_290_18 = 0.5

				for iter_290_7, iter_290_8 in pairs(arg_287_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_290_8 then
						iter_290_8.color = Color.New(var_290_18, var_290_18, var_290_18)
					end
				end

				arg_287_1.var_.actorSpriteComps1060 = nil
			end

			local var_290_19 = 0
			local var_290_20 = 0.975

			if var_290_19 < arg_287_1.time_ and arg_287_1.time_ <= var_290_19 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_21 = arg_287_1:FormatText(StoryNameCfg[591].name)

				arg_287_1.leftNameTxt_.text = var_290_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_22 = arg_287_1:GetWordFromCfg(410012071)
				local var_290_23 = arg_287_1:FormatText(var_290_22.content)

				arg_287_1.text_.text = var_290_23

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_24 = 39
				local var_290_25 = utf8.len(var_290_23)
				local var_290_26 = var_290_24 <= 0 and var_290_20 or var_290_20 * (var_290_25 / var_290_24)

				if var_290_26 > 0 and var_290_20 < var_290_26 then
					arg_287_1.talkMaxDuration = var_290_26

					if var_290_26 + var_290_19 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_26 + var_290_19
					end
				end

				arg_287_1.text_.text = var_290_23
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012071", "story_v_out_410012.awb") ~= 0 then
					local var_290_27 = manager.audio:GetVoiceLength("story_v_out_410012", "410012071", "story_v_out_410012.awb") / 1000

					if var_290_27 + var_290_19 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_27 + var_290_19
					end

					if var_290_22.prefab_name ~= "" and arg_287_1.actors_[var_290_22.prefab_name] ~= nil then
						local var_290_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_22.prefab_name].transform, "story_v_out_410012", "410012071", "story_v_out_410012.awb")

						arg_287_1:RecordAudio("410012071", var_290_28)
						arg_287_1:RecordAudio("410012071", var_290_28)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_410012", "410012071", "story_v_out_410012.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_410012", "410012071", "story_v_out_410012.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_29 = math.max(var_290_20, arg_287_1.talkMaxDuration)

			if var_290_19 <= arg_287_1.time_ and arg_287_1.time_ < var_290_19 + var_290_29 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_19) / var_290_29

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_19 + var_290_29 and arg_287_1.time_ < var_290_19 + var_290_29 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play410012072 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 410012072
		arg_291_1.duration_ = 19.733

		local var_291_0 = {
			zh = 12.133,
			ja = 19.733
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
				arg_291_0:Play410012073(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["10061"].transform
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1.var_.moveOldPos10061 = var_294_0.localPosition
				var_294_0.localScale = Vector3.New(1, 1, 1)

				arg_291_1:CheckSpriteTmpPos("10061", 4)

				local var_294_2 = var_294_0.childCount

				for iter_294_0 = 0, var_294_2 - 1 do
					local var_294_3 = var_294_0:GetChild(iter_294_0)

					if var_294_3.name == "" or not string.find(var_294_3.name, "split") then
						var_294_3.gameObject:SetActive(true)
					else
						var_294_3.gameObject:SetActive(false)
					end
				end
			end

			local var_294_4 = 0.001

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_4 then
				local var_294_5 = (arg_291_1.time_ - var_294_1) / var_294_4
				local var_294_6 = Vector3.New(390, -517.5, -100)

				var_294_0.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos10061, var_294_6, var_294_5)
			end

			if arg_291_1.time_ >= var_294_1 + var_294_4 and arg_291_1.time_ < var_294_1 + var_294_4 + arg_294_0 then
				var_294_0.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_294_7 = arg_291_1.actors_["10061"]
			local var_294_8 = 0

			if var_294_8 < arg_291_1.time_ and arg_291_1.time_ <= var_294_8 + arg_294_0 and arg_291_1.var_.actorSpriteComps10061 == nil then
				arg_291_1.var_.actorSpriteComps10061 = var_294_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_294_9 = 0.034

			if var_294_8 <= arg_291_1.time_ and arg_291_1.time_ < var_294_8 + var_294_9 then
				local var_294_10 = (arg_291_1.time_ - var_294_8) / var_294_9

				if arg_291_1.var_.actorSpriteComps10061 then
					for iter_294_1, iter_294_2 in pairs(arg_291_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_294_2 then
							local var_294_11 = Mathf.Lerp(iter_294_2.color.r, 1, var_294_10)

							iter_294_2.color = Color.New(var_294_11, var_294_11, var_294_11)
						end
					end
				end
			end

			if arg_291_1.time_ >= var_294_8 + var_294_9 and arg_291_1.time_ < var_294_8 + var_294_9 + arg_294_0 and arg_291_1.var_.actorSpriteComps10061 then
				local var_294_12 = 1

				for iter_294_3, iter_294_4 in pairs(arg_291_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_294_4 then
						iter_294_4.color = Color.New(var_294_12, var_294_12, var_294_12)
					end
				end

				arg_291_1.var_.actorSpriteComps10061 = nil
			end

			local var_294_13 = 0
			local var_294_14 = 1.15

			if var_294_13 < arg_291_1.time_ and arg_291_1.time_ <= var_294_13 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_15 = arg_291_1:FormatText(StoryNameCfg[591].name)

				arg_291_1.leftNameTxt_.text = var_294_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_16 = arg_291_1:GetWordFromCfg(410012072)
				local var_294_17 = arg_291_1:FormatText(var_294_16.content)

				arg_291_1.text_.text = var_294_17

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_18 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012072", "story_v_out_410012.awb") ~= 0 then
					local var_294_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012072", "story_v_out_410012.awb") / 1000

					if var_294_21 + var_294_13 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_21 + var_294_13
					end

					if var_294_16.prefab_name ~= "" and arg_291_1.actors_[var_294_16.prefab_name] ~= nil then
						local var_294_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_16.prefab_name].transform, "story_v_out_410012", "410012072", "story_v_out_410012.awb")

						arg_291_1:RecordAudio("410012072", var_294_22)
						arg_291_1:RecordAudio("410012072", var_294_22)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_410012", "410012072", "story_v_out_410012.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_410012", "410012072", "story_v_out_410012.awb")
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
	Play410012073 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 410012073
		arg_295_1.duration_ = 11.333

		local var_295_0 = {
			zh = 5.666,
			ja = 11.333
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
				arg_295_0:Play410012074(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["10061"].transform
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 then
				arg_295_1.var_.moveOldPos10061 = var_298_0.localPosition
				var_298_0.localScale = Vector3.New(1, 1, 1)

				arg_295_1:CheckSpriteTmpPos("10061", 4)

				local var_298_2 = var_298_0.childCount

				for iter_298_0 = 0, var_298_2 - 1 do
					local var_298_3 = var_298_0:GetChild(iter_298_0)

					if var_298_3.name == "" or not string.find(var_298_3.name, "split") then
						var_298_3.gameObject:SetActive(true)
					else
						var_298_3.gameObject:SetActive(false)
					end
				end
			end

			local var_298_4 = 0.001

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_4 then
				local var_298_5 = (arg_295_1.time_ - var_298_1) / var_298_4
				local var_298_6 = Vector3.New(390, -517.5, -100)

				var_298_0.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos10061, var_298_6, var_298_5)
			end

			if arg_295_1.time_ >= var_298_1 + var_298_4 and arg_295_1.time_ < var_298_1 + var_298_4 + arg_298_0 then
				var_298_0.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_298_7 = arg_295_1.actors_["10061"]
			local var_298_8 = 0

			if var_298_8 < arg_295_1.time_ and arg_295_1.time_ <= var_298_8 + arg_298_0 and arg_295_1.var_.actorSpriteComps10061 == nil then
				arg_295_1.var_.actorSpriteComps10061 = var_298_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_298_9 = 0.034

			if var_298_8 <= arg_295_1.time_ and arg_295_1.time_ < var_298_8 + var_298_9 then
				local var_298_10 = (arg_295_1.time_ - var_298_8) / var_298_9

				if arg_295_1.var_.actorSpriteComps10061 then
					for iter_298_1, iter_298_2 in pairs(arg_295_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_298_2 then
							local var_298_11 = Mathf.Lerp(iter_298_2.color.r, 1, var_298_10)

							iter_298_2.color = Color.New(var_298_11, var_298_11, var_298_11)
						end
					end
				end
			end

			if arg_295_1.time_ >= var_298_8 + var_298_9 and arg_295_1.time_ < var_298_8 + var_298_9 + arg_298_0 and arg_295_1.var_.actorSpriteComps10061 then
				local var_298_12 = 1

				for iter_298_3, iter_298_4 in pairs(arg_295_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_298_4 then
						iter_298_4.color = Color.New(var_298_12, var_298_12, var_298_12)
					end
				end

				arg_295_1.var_.actorSpriteComps10061 = nil
			end

			local var_298_13 = 0
			local var_298_14 = 0.475

			if var_298_13 < arg_295_1.time_ and arg_295_1.time_ <= var_298_13 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_15 = arg_295_1:FormatText(StoryNameCfg[591].name)

				arg_295_1.leftNameTxt_.text = var_298_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_16 = arg_295_1:GetWordFromCfg(410012073)
				local var_298_17 = arg_295_1:FormatText(var_298_16.content)

				arg_295_1.text_.text = var_298_17

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_18 = 19
				local var_298_19 = utf8.len(var_298_17)
				local var_298_20 = var_298_18 <= 0 and var_298_14 or var_298_14 * (var_298_19 / var_298_18)

				if var_298_20 > 0 and var_298_14 < var_298_20 then
					arg_295_1.talkMaxDuration = var_298_20

					if var_298_20 + var_298_13 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_20 + var_298_13
					end
				end

				arg_295_1.text_.text = var_298_17
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012073", "story_v_out_410012.awb") ~= 0 then
					local var_298_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012073", "story_v_out_410012.awb") / 1000

					if var_298_21 + var_298_13 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_21 + var_298_13
					end

					if var_298_16.prefab_name ~= "" and arg_295_1.actors_[var_298_16.prefab_name] ~= nil then
						local var_298_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_16.prefab_name].transform, "story_v_out_410012", "410012073", "story_v_out_410012.awb")

						arg_295_1:RecordAudio("410012073", var_298_22)
						arg_295_1:RecordAudio("410012073", var_298_22)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_410012", "410012073", "story_v_out_410012.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_410012", "410012073", "story_v_out_410012.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_23 = math.max(var_298_14, arg_295_1.talkMaxDuration)

			if var_298_13 <= arg_295_1.time_ and arg_295_1.time_ < var_298_13 + var_298_23 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_13) / var_298_23

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_13 + var_298_23 and arg_295_1.time_ < var_298_13 + var_298_23 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play410012074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 410012074
		arg_299_1.duration_ = 5.3

		local var_299_0 = {
			zh = 0.999999999999,
			ja = 5.3
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
				arg_299_0:Play410012075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = arg_299_1.actors_["1060"].transform
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 then
				arg_299_1.var_.moveOldPos1060 = var_302_0.localPosition
				var_302_0.localScale = Vector3.New(1, 1, 1)

				arg_299_1:CheckSpriteTmpPos("1060", 2)

				local var_302_2 = var_302_0.childCount

				for iter_302_0 = 0, var_302_2 - 1 do
					local var_302_3 = var_302_0:GetChild(iter_302_0)

					if var_302_3.name == "split_4" or not string.find(var_302_3.name, "split") then
						var_302_3.gameObject:SetActive(true)
					else
						var_302_3.gameObject:SetActive(false)
					end
				end
			end

			local var_302_4 = 0.001

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_4 then
				local var_302_5 = (arg_299_1.time_ - var_302_1) / var_302_4
				local var_302_6 = Vector3.New(-390, -435, -40)

				var_302_0.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos1060, var_302_6, var_302_5)
			end

			if arg_299_1.time_ >= var_302_1 + var_302_4 and arg_299_1.time_ < var_302_1 + var_302_4 + arg_302_0 then
				var_302_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_302_7 = arg_299_1.actors_["1060"]
			local var_302_8 = 0

			if var_302_8 < arg_299_1.time_ and arg_299_1.time_ <= var_302_8 + arg_302_0 and arg_299_1.var_.actorSpriteComps1060 == nil then
				arg_299_1.var_.actorSpriteComps1060 = var_302_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_302_9 = 0.034

			if var_302_8 <= arg_299_1.time_ and arg_299_1.time_ < var_302_8 + var_302_9 then
				local var_302_10 = (arg_299_1.time_ - var_302_8) / var_302_9

				if arg_299_1.var_.actorSpriteComps1060 then
					for iter_302_1, iter_302_2 in pairs(arg_299_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_302_2 then
							local var_302_11 = Mathf.Lerp(iter_302_2.color.r, 1, var_302_10)

							iter_302_2.color = Color.New(var_302_11, var_302_11, var_302_11)
						end
					end
				end
			end

			if arg_299_1.time_ >= var_302_8 + var_302_9 and arg_299_1.time_ < var_302_8 + var_302_9 + arg_302_0 and arg_299_1.var_.actorSpriteComps1060 then
				local var_302_12 = 1

				for iter_302_3, iter_302_4 in pairs(arg_299_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_302_4 then
						iter_302_4.color = Color.New(var_302_12, var_302_12, var_302_12)
					end
				end

				arg_299_1.var_.actorSpriteComps1060 = nil
			end

			local var_302_13 = arg_299_1.actors_["10061"]
			local var_302_14 = 0

			if var_302_14 < arg_299_1.time_ and arg_299_1.time_ <= var_302_14 + arg_302_0 and arg_299_1.var_.actorSpriteComps10061 == nil then
				arg_299_1.var_.actorSpriteComps10061 = var_302_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_302_15 = 0.034

			if var_302_14 <= arg_299_1.time_ and arg_299_1.time_ < var_302_14 + var_302_15 then
				local var_302_16 = (arg_299_1.time_ - var_302_14) / var_302_15

				if arg_299_1.var_.actorSpriteComps10061 then
					for iter_302_5, iter_302_6 in pairs(arg_299_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_302_6 then
							local var_302_17 = Mathf.Lerp(iter_302_6.color.r, 0.5, var_302_16)

							iter_302_6.color = Color.New(var_302_17, var_302_17, var_302_17)
						end
					end
				end
			end

			if arg_299_1.time_ >= var_302_14 + var_302_15 and arg_299_1.time_ < var_302_14 + var_302_15 + arg_302_0 and arg_299_1.var_.actorSpriteComps10061 then
				local var_302_18 = 0.5

				for iter_302_7, iter_302_8 in pairs(arg_299_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_302_8 then
						iter_302_8.color = Color.New(var_302_18, var_302_18, var_302_18)
					end
				end

				arg_299_1.var_.actorSpriteComps10061 = nil
			end

			local var_302_19 = 0
			local var_302_20 = 0.1

			if var_302_19 < arg_299_1.time_ and arg_299_1.time_ <= var_302_19 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_21 = arg_299_1:FormatText(StoryNameCfg[584].name)

				arg_299_1.leftNameTxt_.text = var_302_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_22 = arg_299_1:GetWordFromCfg(410012074)
				local var_302_23 = arg_299_1:FormatText(var_302_22.content)

				arg_299_1.text_.text = var_302_23

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_24 = 4
				local var_302_25 = utf8.len(var_302_23)
				local var_302_26 = var_302_24 <= 0 and var_302_20 or var_302_20 * (var_302_25 / var_302_24)

				if var_302_26 > 0 and var_302_20 < var_302_26 then
					arg_299_1.talkMaxDuration = var_302_26

					if var_302_26 + var_302_19 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_26 + var_302_19
					end
				end

				arg_299_1.text_.text = var_302_23
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012074", "story_v_out_410012.awb") ~= 0 then
					local var_302_27 = manager.audio:GetVoiceLength("story_v_out_410012", "410012074", "story_v_out_410012.awb") / 1000

					if var_302_27 + var_302_19 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_27 + var_302_19
					end

					if var_302_22.prefab_name ~= "" and arg_299_1.actors_[var_302_22.prefab_name] ~= nil then
						local var_302_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_22.prefab_name].transform, "story_v_out_410012", "410012074", "story_v_out_410012.awb")

						arg_299_1:RecordAudio("410012074", var_302_28)
						arg_299_1:RecordAudio("410012074", var_302_28)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_410012", "410012074", "story_v_out_410012.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_410012", "410012074", "story_v_out_410012.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_29 = math.max(var_302_20, arg_299_1.talkMaxDuration)

			if var_302_19 <= arg_299_1.time_ and arg_299_1.time_ < var_302_19 + var_302_29 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_19) / var_302_29

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_19 + var_302_29 and arg_299_1.time_ < var_302_19 + var_302_29 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play410012075 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 410012075
		arg_303_1.duration_ = 13.066

		local var_303_0 = {
			zh = 12.766,
			ja = 13.066
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
				arg_303_0:Play410012076(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["10061"].transform
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 then
				arg_303_1.var_.moveOldPos10061 = var_306_0.localPosition
				var_306_0.localScale = Vector3.New(1, 1, 1)

				arg_303_1:CheckSpriteTmpPos("10061", 4)

				local var_306_2 = var_306_0.childCount

				for iter_306_0 = 0, var_306_2 - 1 do
					local var_306_3 = var_306_0:GetChild(iter_306_0)

					if var_306_3.name == "split_3" or not string.find(var_306_3.name, "split") then
						var_306_3.gameObject:SetActive(true)
					else
						var_306_3.gameObject:SetActive(false)
					end
				end
			end

			local var_306_4 = 0.001

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_4 then
				local var_306_5 = (arg_303_1.time_ - var_306_1) / var_306_4
				local var_306_6 = Vector3.New(390, -517.5, -100)

				var_306_0.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos10061, var_306_6, var_306_5)
			end

			if arg_303_1.time_ >= var_306_1 + var_306_4 and arg_303_1.time_ < var_306_1 + var_306_4 + arg_306_0 then
				var_306_0.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_306_7 = arg_303_1.actors_["10061"]
			local var_306_8 = 0

			if var_306_8 < arg_303_1.time_ and arg_303_1.time_ <= var_306_8 + arg_306_0 and arg_303_1.var_.actorSpriteComps10061 == nil then
				arg_303_1.var_.actorSpriteComps10061 = var_306_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_306_9 = 0.034

			if var_306_8 <= arg_303_1.time_ and arg_303_1.time_ < var_306_8 + var_306_9 then
				local var_306_10 = (arg_303_1.time_ - var_306_8) / var_306_9

				if arg_303_1.var_.actorSpriteComps10061 then
					for iter_306_1, iter_306_2 in pairs(arg_303_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_306_2 then
							local var_306_11 = Mathf.Lerp(iter_306_2.color.r, 1, var_306_10)

							iter_306_2.color = Color.New(var_306_11, var_306_11, var_306_11)
						end
					end
				end
			end

			if arg_303_1.time_ >= var_306_8 + var_306_9 and arg_303_1.time_ < var_306_8 + var_306_9 + arg_306_0 and arg_303_1.var_.actorSpriteComps10061 then
				local var_306_12 = 1

				for iter_306_3, iter_306_4 in pairs(arg_303_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_306_4 then
						iter_306_4.color = Color.New(var_306_12, var_306_12, var_306_12)
					end
				end

				arg_303_1.var_.actorSpriteComps10061 = nil
			end

			local var_306_13 = arg_303_1.actors_["1060"]
			local var_306_14 = 0

			if var_306_14 < arg_303_1.time_ and arg_303_1.time_ <= var_306_14 + arg_306_0 and arg_303_1.var_.actorSpriteComps1060 == nil then
				arg_303_1.var_.actorSpriteComps1060 = var_306_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_306_15 = 0.034

			if var_306_14 <= arg_303_1.time_ and arg_303_1.time_ < var_306_14 + var_306_15 then
				local var_306_16 = (arg_303_1.time_ - var_306_14) / var_306_15

				if arg_303_1.var_.actorSpriteComps1060 then
					for iter_306_5, iter_306_6 in pairs(arg_303_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_306_6 then
							local var_306_17 = Mathf.Lerp(iter_306_6.color.r, 0.5, var_306_16)

							iter_306_6.color = Color.New(var_306_17, var_306_17, var_306_17)
						end
					end
				end
			end

			if arg_303_1.time_ >= var_306_14 + var_306_15 and arg_303_1.time_ < var_306_14 + var_306_15 + arg_306_0 and arg_303_1.var_.actorSpriteComps1060 then
				local var_306_18 = 0.5

				for iter_306_7, iter_306_8 in pairs(arg_303_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_306_8 then
						iter_306_8.color = Color.New(var_306_18, var_306_18, var_306_18)
					end
				end

				arg_303_1.var_.actorSpriteComps1060 = nil
			end

			local var_306_19 = 0
			local var_306_20 = 1.1

			if var_306_19 < arg_303_1.time_ and arg_303_1.time_ <= var_306_19 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_21 = arg_303_1:FormatText(StoryNameCfg[591].name)

				arg_303_1.leftNameTxt_.text = var_306_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_22 = arg_303_1:GetWordFromCfg(410012075)
				local var_306_23 = arg_303_1:FormatText(var_306_22.content)

				arg_303_1.text_.text = var_306_23

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_24 = 44
				local var_306_25 = utf8.len(var_306_23)
				local var_306_26 = var_306_24 <= 0 and var_306_20 or var_306_20 * (var_306_25 / var_306_24)

				if var_306_26 > 0 and var_306_20 < var_306_26 then
					arg_303_1.talkMaxDuration = var_306_26

					if var_306_26 + var_306_19 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_26 + var_306_19
					end
				end

				arg_303_1.text_.text = var_306_23
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012075", "story_v_out_410012.awb") ~= 0 then
					local var_306_27 = manager.audio:GetVoiceLength("story_v_out_410012", "410012075", "story_v_out_410012.awb") / 1000

					if var_306_27 + var_306_19 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_27 + var_306_19
					end

					if var_306_22.prefab_name ~= "" and arg_303_1.actors_[var_306_22.prefab_name] ~= nil then
						local var_306_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_22.prefab_name].transform, "story_v_out_410012", "410012075", "story_v_out_410012.awb")

						arg_303_1:RecordAudio("410012075", var_306_28)
						arg_303_1:RecordAudio("410012075", var_306_28)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_410012", "410012075", "story_v_out_410012.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_410012", "410012075", "story_v_out_410012.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_29 = math.max(var_306_20, arg_303_1.talkMaxDuration)

			if var_306_19 <= arg_303_1.time_ and arg_303_1.time_ < var_306_19 + var_306_29 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_19) / var_306_29

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_19 + var_306_29 and arg_303_1.time_ < var_306_19 + var_306_29 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play410012076 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 410012076
		arg_307_1.duration_ = 5

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play410012077(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["10061"].transform
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 then
				arg_307_1.var_.moveOldPos10061 = var_310_0.localPosition
				var_310_0.localScale = Vector3.New(1, 1, 1)

				arg_307_1:CheckSpriteTmpPos("10061", 7)

				local var_310_2 = var_310_0.childCount

				for iter_310_0 = 0, var_310_2 - 1 do
					local var_310_3 = var_310_0:GetChild(iter_310_0)

					if var_310_3.name == "" or not string.find(var_310_3.name, "split") then
						var_310_3.gameObject:SetActive(true)
					else
						var_310_3.gameObject:SetActive(false)
					end
				end
			end

			local var_310_4 = 0.001

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_4 then
				local var_310_5 = (arg_307_1.time_ - var_310_1) / var_310_4
				local var_310_6 = Vector3.New(0, -2000, -100)

				var_310_0.localPosition = Vector3.Lerp(arg_307_1.var_.moveOldPos10061, var_310_6, var_310_5)
			end

			if arg_307_1.time_ >= var_310_1 + var_310_4 and arg_307_1.time_ < var_310_1 + var_310_4 + arg_310_0 then
				var_310_0.localPosition = Vector3.New(0, -2000, -100)
			end

			local var_310_7 = arg_307_1.actors_["1060"].transform
			local var_310_8 = 0

			if var_310_8 < arg_307_1.time_ and arg_307_1.time_ <= var_310_8 + arg_310_0 then
				arg_307_1.var_.moveOldPos1060 = var_310_7.localPosition
				var_310_7.localScale = Vector3.New(1, 1, 1)

				arg_307_1:CheckSpriteTmpPos("1060", 7)

				local var_310_9 = var_310_7.childCount

				for iter_310_1 = 0, var_310_9 - 1 do
					local var_310_10 = var_310_7:GetChild(iter_310_1)

					if var_310_10.name == "" or not string.find(var_310_10.name, "split") then
						var_310_10.gameObject:SetActive(true)
					else
						var_310_10.gameObject:SetActive(false)
					end
				end
			end

			local var_310_11 = 0.001

			if var_310_8 <= arg_307_1.time_ and arg_307_1.time_ < var_310_8 + var_310_11 then
				local var_310_12 = (arg_307_1.time_ - var_310_8) / var_310_11
				local var_310_13 = Vector3.New(0, -2000, -40)

				var_310_7.localPosition = Vector3.Lerp(arg_307_1.var_.moveOldPos1060, var_310_13, var_310_12)
			end

			if arg_307_1.time_ >= var_310_8 + var_310_11 and arg_307_1.time_ < var_310_8 + var_310_11 + arg_310_0 then
				var_310_7.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_310_14 = arg_307_1.actors_["10061"]
			local var_310_15 = 0

			if var_310_15 < arg_307_1.time_ and arg_307_1.time_ <= var_310_15 + arg_310_0 and arg_307_1.var_.actorSpriteComps10061 == nil then
				arg_307_1.var_.actorSpriteComps10061 = var_310_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_310_16 = 0.034

			if var_310_15 <= arg_307_1.time_ and arg_307_1.time_ < var_310_15 + var_310_16 then
				local var_310_17 = (arg_307_1.time_ - var_310_15) / var_310_16

				if arg_307_1.var_.actorSpriteComps10061 then
					for iter_310_2, iter_310_3 in pairs(arg_307_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_310_3 then
							local var_310_18 = Mathf.Lerp(iter_310_3.color.r, 0.5, var_310_17)

							iter_310_3.color = Color.New(var_310_18, var_310_18, var_310_18)
						end
					end
				end
			end

			if arg_307_1.time_ >= var_310_15 + var_310_16 and arg_307_1.time_ < var_310_15 + var_310_16 + arg_310_0 and arg_307_1.var_.actorSpriteComps10061 then
				local var_310_19 = 0.5

				for iter_310_4, iter_310_5 in pairs(arg_307_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_310_5 then
						iter_310_5.color = Color.New(var_310_19, var_310_19, var_310_19)
					end
				end

				arg_307_1.var_.actorSpriteComps10061 = nil
			end

			local var_310_20 = arg_307_1.actors_["1060"]
			local var_310_21 = 0

			if var_310_21 < arg_307_1.time_ and arg_307_1.time_ <= var_310_21 + arg_310_0 and arg_307_1.var_.actorSpriteComps1060 == nil then
				arg_307_1.var_.actorSpriteComps1060 = var_310_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_310_22 = 0.034

			if var_310_21 <= arg_307_1.time_ and arg_307_1.time_ < var_310_21 + var_310_22 then
				local var_310_23 = (arg_307_1.time_ - var_310_21) / var_310_22

				if arg_307_1.var_.actorSpriteComps1060 then
					for iter_310_6, iter_310_7 in pairs(arg_307_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_310_7 then
							local var_310_24 = Mathf.Lerp(iter_310_7.color.r, 0.5, var_310_23)

							iter_310_7.color = Color.New(var_310_24, var_310_24, var_310_24)
						end
					end
				end
			end

			if arg_307_1.time_ >= var_310_21 + var_310_22 and arg_307_1.time_ < var_310_21 + var_310_22 + arg_310_0 and arg_307_1.var_.actorSpriteComps1060 then
				local var_310_25 = 0.5

				for iter_310_8, iter_310_9 in pairs(arg_307_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_310_9 then
						iter_310_9.color = Color.New(var_310_25, var_310_25, var_310_25)
					end
				end

				arg_307_1.var_.actorSpriteComps1060 = nil
			end

			local var_310_26 = 0
			local var_310_27 = 1.55

			if var_310_26 < arg_307_1.time_ and arg_307_1.time_ <= var_310_26 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, false)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_28 = arg_307_1:GetWordFromCfg(410012076)
				local var_310_29 = arg_307_1:FormatText(var_310_28.content)

				arg_307_1.text_.text = var_310_29

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_30 = 62
				local var_310_31 = utf8.len(var_310_29)
				local var_310_32 = var_310_30 <= 0 and var_310_27 or var_310_27 * (var_310_31 / var_310_30)

				if var_310_32 > 0 and var_310_27 < var_310_32 then
					arg_307_1.talkMaxDuration = var_310_32

					if var_310_32 + var_310_26 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_32 + var_310_26
					end
				end

				arg_307_1.text_.text = var_310_29
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)
				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_33 = math.max(var_310_27, arg_307_1.talkMaxDuration)

			if var_310_26 <= arg_307_1.time_ and arg_307_1.time_ < var_310_26 + var_310_33 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_26) / var_310_33

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_26 + var_310_33 and arg_307_1.time_ < var_310_26 + var_310_33 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play410012077 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 410012077
		arg_311_1.duration_ = 5

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play410012078(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = 0
			local var_314_1 = 0.475

			if var_314_0 < arg_311_1.time_ and arg_311_1.time_ <= var_314_0 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, false)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_2 = arg_311_1:GetWordFromCfg(410012077)
				local var_314_3 = arg_311_1:FormatText(var_314_2.content)

				arg_311_1.text_.text = var_314_3

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_4 = 19
				local var_314_5 = utf8.len(var_314_3)
				local var_314_6 = var_314_4 <= 0 and var_314_1 or var_314_1 * (var_314_5 / var_314_4)

				if var_314_6 > 0 and var_314_1 < var_314_6 then
					arg_311_1.talkMaxDuration = var_314_6

					if var_314_6 + var_314_0 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_6 + var_314_0
					end
				end

				arg_311_1.text_.text = var_314_3
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)
				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_7 = math.max(var_314_1, arg_311_1.talkMaxDuration)

			if var_314_0 <= arg_311_1.time_ and arg_311_1.time_ < var_314_0 + var_314_7 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_0) / var_314_7

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_0 + var_314_7 and arg_311_1.time_ < var_314_0 + var_314_7 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play410012078 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 410012078
		arg_315_1.duration_ = 5

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play410012079(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = 0
			local var_318_1 = 1.65

			if var_318_0 < arg_315_1.time_ and arg_315_1.time_ <= var_318_0 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, false)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_2 = arg_315_1:GetWordFromCfg(410012078)
				local var_318_3 = arg_315_1:FormatText(var_318_2.content)

				arg_315_1.text_.text = var_318_3

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_4 = 66
				local var_318_5 = utf8.len(var_318_3)
				local var_318_6 = var_318_4 <= 0 and var_318_1 or var_318_1 * (var_318_5 / var_318_4)

				if var_318_6 > 0 and var_318_1 < var_318_6 then
					arg_315_1.talkMaxDuration = var_318_6

					if var_318_6 + var_318_0 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_6 + var_318_0
					end
				end

				arg_315_1.text_.text = var_318_3
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)
				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_7 = math.max(var_318_1, arg_315_1.talkMaxDuration)

			if var_318_0 <= arg_315_1.time_ and arg_315_1.time_ < var_318_0 + var_318_7 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_0) / var_318_7

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_0 + var_318_7 and arg_315_1.time_ < var_318_0 + var_318_7 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play410012079 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 410012079
		arg_319_1.duration_ = 4

		local var_319_0 = {
			zh = 3.566,
			ja = 4
		}
		local var_319_1 = manager.audio:GetLocalizationFlag()

		if var_319_0[var_319_1] ~= nil then
			arg_319_1.duration_ = var_319_0[var_319_1]
		end

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play410012080(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["1060"].transform
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 then
				arg_319_1.var_.moveOldPos1060 = var_322_0.localPosition
				var_322_0.localScale = Vector3.New(1, 1, 1)

				arg_319_1:CheckSpriteTmpPos("1060", 2)

				local var_322_2 = var_322_0.childCount

				for iter_322_0 = 0, var_322_2 - 1 do
					local var_322_3 = var_322_0:GetChild(iter_322_0)

					if var_322_3.name == "" or not string.find(var_322_3.name, "split") then
						var_322_3.gameObject:SetActive(true)
					else
						var_322_3.gameObject:SetActive(false)
					end
				end
			end

			local var_322_4 = 0.001

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_4 then
				local var_322_5 = (arg_319_1.time_ - var_322_1) / var_322_4
				local var_322_6 = Vector3.New(-390, -435, -40)

				var_322_0.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos1060, var_322_6, var_322_5)
			end

			if arg_319_1.time_ >= var_322_1 + var_322_4 and arg_319_1.time_ < var_322_1 + var_322_4 + arg_322_0 then
				var_322_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_322_7 = arg_319_1.actors_["10061"].transform
			local var_322_8 = 0

			if var_322_8 < arg_319_1.time_ and arg_319_1.time_ <= var_322_8 + arg_322_0 then
				arg_319_1.var_.moveOldPos10061 = var_322_7.localPosition
				var_322_7.localScale = Vector3.New(1, 1, 1)

				arg_319_1:CheckSpriteTmpPos("10061", 4)

				local var_322_9 = var_322_7.childCount

				for iter_322_1 = 0, var_322_9 - 1 do
					local var_322_10 = var_322_7:GetChild(iter_322_1)

					if var_322_10.name == "split_3" or not string.find(var_322_10.name, "split") then
						var_322_10.gameObject:SetActive(true)
					else
						var_322_10.gameObject:SetActive(false)
					end
				end
			end

			local var_322_11 = 0.001

			if var_322_8 <= arg_319_1.time_ and arg_319_1.time_ < var_322_8 + var_322_11 then
				local var_322_12 = (arg_319_1.time_ - var_322_8) / var_322_11
				local var_322_13 = Vector3.New(390, -517.5, -100)

				var_322_7.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos10061, var_322_13, var_322_12)
			end

			if arg_319_1.time_ >= var_322_8 + var_322_11 and arg_319_1.time_ < var_322_8 + var_322_11 + arg_322_0 then
				var_322_7.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_322_14 = arg_319_1.actors_["1060"]
			local var_322_15 = 0

			if var_322_15 < arg_319_1.time_ and arg_319_1.time_ <= var_322_15 + arg_322_0 and arg_319_1.var_.actorSpriteComps1060 == nil then
				arg_319_1.var_.actorSpriteComps1060 = var_322_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_322_16 = 0.034

			if var_322_15 <= arg_319_1.time_ and arg_319_1.time_ < var_322_15 + var_322_16 then
				local var_322_17 = (arg_319_1.time_ - var_322_15) / var_322_16

				if arg_319_1.var_.actorSpriteComps1060 then
					for iter_322_2, iter_322_3 in pairs(arg_319_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_322_3 then
							local var_322_18 = Mathf.Lerp(iter_322_3.color.r, 0.5, var_322_17)

							iter_322_3.color = Color.New(var_322_18, var_322_18, var_322_18)
						end
					end
				end
			end

			if arg_319_1.time_ >= var_322_15 + var_322_16 and arg_319_1.time_ < var_322_15 + var_322_16 + arg_322_0 and arg_319_1.var_.actorSpriteComps1060 then
				local var_322_19 = 0.5

				for iter_322_4, iter_322_5 in pairs(arg_319_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_322_5 then
						iter_322_5.color = Color.New(var_322_19, var_322_19, var_322_19)
					end
				end

				arg_319_1.var_.actorSpriteComps1060 = nil
			end

			local var_322_20 = arg_319_1.actors_["10061"]
			local var_322_21 = 0

			if var_322_21 < arg_319_1.time_ and arg_319_1.time_ <= var_322_21 + arg_322_0 and arg_319_1.var_.actorSpriteComps10061 == nil then
				arg_319_1.var_.actorSpriteComps10061 = var_322_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_322_22 = 0.034

			if var_322_21 <= arg_319_1.time_ and arg_319_1.time_ < var_322_21 + var_322_22 then
				local var_322_23 = (arg_319_1.time_ - var_322_21) / var_322_22

				if arg_319_1.var_.actorSpriteComps10061 then
					for iter_322_6, iter_322_7 in pairs(arg_319_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_322_7 then
							local var_322_24 = Mathf.Lerp(iter_322_7.color.r, 1, var_322_23)

							iter_322_7.color = Color.New(var_322_24, var_322_24, var_322_24)
						end
					end
				end
			end

			if arg_319_1.time_ >= var_322_21 + var_322_22 and arg_319_1.time_ < var_322_21 + var_322_22 + arg_322_0 and arg_319_1.var_.actorSpriteComps10061 then
				local var_322_25 = 1

				for iter_322_8, iter_322_9 in pairs(arg_319_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_322_9 then
						iter_322_9.color = Color.New(var_322_25, var_322_25, var_322_25)
					end
				end

				arg_319_1.var_.actorSpriteComps10061 = nil
			end

			local var_322_26 = 0
			local var_322_27 = 0.275

			if var_322_26 < arg_319_1.time_ and arg_319_1.time_ <= var_322_26 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_28 = arg_319_1:FormatText(StoryNameCfg[591].name)

				arg_319_1.leftNameTxt_.text = var_322_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_29 = arg_319_1:GetWordFromCfg(410012079)
				local var_322_30 = arg_319_1:FormatText(var_322_29.content)

				arg_319_1.text_.text = var_322_30

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_31 = 11
				local var_322_32 = utf8.len(var_322_30)
				local var_322_33 = var_322_31 <= 0 and var_322_27 or var_322_27 * (var_322_32 / var_322_31)

				if var_322_33 > 0 and var_322_27 < var_322_33 then
					arg_319_1.talkMaxDuration = var_322_33

					if var_322_33 + var_322_26 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_33 + var_322_26
					end
				end

				arg_319_1.text_.text = var_322_30
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012079", "story_v_out_410012.awb") ~= 0 then
					local var_322_34 = manager.audio:GetVoiceLength("story_v_out_410012", "410012079", "story_v_out_410012.awb") / 1000

					if var_322_34 + var_322_26 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_34 + var_322_26
					end

					if var_322_29.prefab_name ~= "" and arg_319_1.actors_[var_322_29.prefab_name] ~= nil then
						local var_322_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_29.prefab_name].transform, "story_v_out_410012", "410012079", "story_v_out_410012.awb")

						arg_319_1:RecordAudio("410012079", var_322_35)
						arg_319_1:RecordAudio("410012079", var_322_35)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_410012", "410012079", "story_v_out_410012.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_410012", "410012079", "story_v_out_410012.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_36 = math.max(var_322_27, arg_319_1.talkMaxDuration)

			if var_322_26 <= arg_319_1.time_ and arg_319_1.time_ < var_322_26 + var_322_36 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_26) / var_322_36

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_26 + var_322_36 and arg_319_1.time_ < var_322_26 + var_322_36 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play410012080 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 410012080
		arg_323_1.duration_ = 14.533

		local var_323_0 = {
			zh = 11.766,
			ja = 14.533
		}
		local var_323_1 = manager.audio:GetLocalizationFlag()

		if var_323_0[var_323_1] ~= nil then
			arg_323_1.duration_ = var_323_0[var_323_1]
		end

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play410012081(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["10061"].transform
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 then
				arg_323_1.var_.moveOldPos10061 = var_326_0.localPosition
				var_326_0.localScale = Vector3.New(1, 1, 1)

				arg_323_1:CheckSpriteTmpPos("10061", 4)

				local var_326_2 = var_326_0.childCount

				for iter_326_0 = 0, var_326_2 - 1 do
					local var_326_3 = var_326_0:GetChild(iter_326_0)

					if var_326_3.name == "" or not string.find(var_326_3.name, "split") then
						var_326_3.gameObject:SetActive(true)
					else
						var_326_3.gameObject:SetActive(false)
					end
				end
			end

			local var_326_4 = 0.001

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_4 then
				local var_326_5 = (arg_323_1.time_ - var_326_1) / var_326_4
				local var_326_6 = Vector3.New(390, -517.5, -100)

				var_326_0.localPosition = Vector3.Lerp(arg_323_1.var_.moveOldPos10061, var_326_6, var_326_5)
			end

			if arg_323_1.time_ >= var_326_1 + var_326_4 and arg_323_1.time_ < var_326_1 + var_326_4 + arg_326_0 then
				var_326_0.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_326_7 = arg_323_1.actors_["10061"]
			local var_326_8 = 0

			if var_326_8 < arg_323_1.time_ and arg_323_1.time_ <= var_326_8 + arg_326_0 and arg_323_1.var_.actorSpriteComps10061 == nil then
				arg_323_1.var_.actorSpriteComps10061 = var_326_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_326_9 = 0.034

			if var_326_8 <= arg_323_1.time_ and arg_323_1.time_ < var_326_8 + var_326_9 then
				local var_326_10 = (arg_323_1.time_ - var_326_8) / var_326_9

				if arg_323_1.var_.actorSpriteComps10061 then
					for iter_326_1, iter_326_2 in pairs(arg_323_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_326_2 then
							local var_326_11 = Mathf.Lerp(iter_326_2.color.r, 1, var_326_10)

							iter_326_2.color = Color.New(var_326_11, var_326_11, var_326_11)
						end
					end
				end
			end

			if arg_323_1.time_ >= var_326_8 + var_326_9 and arg_323_1.time_ < var_326_8 + var_326_9 + arg_326_0 and arg_323_1.var_.actorSpriteComps10061 then
				local var_326_12 = 1

				for iter_326_3, iter_326_4 in pairs(arg_323_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_326_4 then
						iter_326_4.color = Color.New(var_326_12, var_326_12, var_326_12)
					end
				end

				arg_323_1.var_.actorSpriteComps10061 = nil
			end

			local var_326_13 = 0
			local var_326_14 = 1.1

			if var_326_13 < arg_323_1.time_ and arg_323_1.time_ <= var_326_13 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_15 = arg_323_1:FormatText(StoryNameCfg[591].name)

				arg_323_1.leftNameTxt_.text = var_326_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_16 = arg_323_1:GetWordFromCfg(410012080)
				local var_326_17 = arg_323_1:FormatText(var_326_16.content)

				arg_323_1.text_.text = var_326_17

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_18 = 44
				local var_326_19 = utf8.len(var_326_17)
				local var_326_20 = var_326_18 <= 0 and var_326_14 or var_326_14 * (var_326_19 / var_326_18)

				if var_326_20 > 0 and var_326_14 < var_326_20 then
					arg_323_1.talkMaxDuration = var_326_20

					if var_326_20 + var_326_13 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_20 + var_326_13
					end
				end

				arg_323_1.text_.text = var_326_17
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012080", "story_v_out_410012.awb") ~= 0 then
					local var_326_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012080", "story_v_out_410012.awb") / 1000

					if var_326_21 + var_326_13 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_21 + var_326_13
					end

					if var_326_16.prefab_name ~= "" and arg_323_1.actors_[var_326_16.prefab_name] ~= nil then
						local var_326_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_16.prefab_name].transform, "story_v_out_410012", "410012080", "story_v_out_410012.awb")

						arg_323_1:RecordAudio("410012080", var_326_22)
						arg_323_1:RecordAudio("410012080", var_326_22)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_out_410012", "410012080", "story_v_out_410012.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_out_410012", "410012080", "story_v_out_410012.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_23 = math.max(var_326_14, arg_323_1.talkMaxDuration)

			if var_326_13 <= arg_323_1.time_ and arg_323_1.time_ < var_326_13 + var_326_23 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_13) / var_326_23

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_13 + var_326_23 and arg_323_1.time_ < var_326_13 + var_326_23 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play410012081 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 410012081
		arg_327_1.duration_ = 8.333

		local var_327_0 = {
			zh = 7.933,
			ja = 8.333
		}
		local var_327_1 = manager.audio:GetLocalizationFlag()

		if var_327_0[var_327_1] ~= nil then
			arg_327_1.duration_ = var_327_0[var_327_1]
		end

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play410012082(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1060"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 and arg_327_1.var_.actorSpriteComps1060 == nil then
				arg_327_1.var_.actorSpriteComps1060 = var_330_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_330_2 = 0.034

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2

				if arg_327_1.var_.actorSpriteComps1060 then
					for iter_330_0, iter_330_1 in pairs(arg_327_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_330_1 then
							local var_330_4 = Mathf.Lerp(iter_330_1.color.r, 1, var_330_3)

							iter_330_1.color = Color.New(var_330_4, var_330_4, var_330_4)
						end
					end
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 and arg_327_1.var_.actorSpriteComps1060 then
				local var_330_5 = 1

				for iter_330_2, iter_330_3 in pairs(arg_327_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_330_3 then
						iter_330_3.color = Color.New(var_330_5, var_330_5, var_330_5)
					end
				end

				arg_327_1.var_.actorSpriteComps1060 = nil
			end

			local var_330_6 = arg_327_1.actors_["10061"]
			local var_330_7 = 0

			if var_330_7 < arg_327_1.time_ and arg_327_1.time_ <= var_330_7 + arg_330_0 and arg_327_1.var_.actorSpriteComps10061 == nil then
				arg_327_1.var_.actorSpriteComps10061 = var_330_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_330_8 = 0.034

			if var_330_7 <= arg_327_1.time_ and arg_327_1.time_ < var_330_7 + var_330_8 then
				local var_330_9 = (arg_327_1.time_ - var_330_7) / var_330_8

				if arg_327_1.var_.actorSpriteComps10061 then
					for iter_330_4, iter_330_5 in pairs(arg_327_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_330_5 then
							local var_330_10 = Mathf.Lerp(iter_330_5.color.r, 0.5, var_330_9)

							iter_330_5.color = Color.New(var_330_10, var_330_10, var_330_10)
						end
					end
				end
			end

			if arg_327_1.time_ >= var_330_7 + var_330_8 and arg_327_1.time_ < var_330_7 + var_330_8 + arg_330_0 and arg_327_1.var_.actorSpriteComps10061 then
				local var_330_11 = 0.5

				for iter_330_6, iter_330_7 in pairs(arg_327_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_330_7 then
						iter_330_7.color = Color.New(var_330_11, var_330_11, var_330_11)
					end
				end

				arg_327_1.var_.actorSpriteComps10061 = nil
			end

			local var_330_12 = 0
			local var_330_13 = 0.875

			if var_330_12 < arg_327_1.time_ and arg_327_1.time_ <= var_330_12 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_14 = arg_327_1:FormatText(StoryNameCfg[584].name)

				arg_327_1.leftNameTxt_.text = var_330_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_15 = arg_327_1:GetWordFromCfg(410012081)
				local var_330_16 = arg_327_1:FormatText(var_330_15.content)

				arg_327_1.text_.text = var_330_16

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_17 = 35
				local var_330_18 = utf8.len(var_330_16)
				local var_330_19 = var_330_17 <= 0 and var_330_13 or var_330_13 * (var_330_18 / var_330_17)

				if var_330_19 > 0 and var_330_13 < var_330_19 then
					arg_327_1.talkMaxDuration = var_330_19

					if var_330_19 + var_330_12 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_19 + var_330_12
					end
				end

				arg_327_1.text_.text = var_330_16
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012081", "story_v_out_410012.awb") ~= 0 then
					local var_330_20 = manager.audio:GetVoiceLength("story_v_out_410012", "410012081", "story_v_out_410012.awb") / 1000

					if var_330_20 + var_330_12 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_20 + var_330_12
					end

					if var_330_15.prefab_name ~= "" and arg_327_1.actors_[var_330_15.prefab_name] ~= nil then
						local var_330_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_15.prefab_name].transform, "story_v_out_410012", "410012081", "story_v_out_410012.awb")

						arg_327_1:RecordAudio("410012081", var_330_21)
						arg_327_1:RecordAudio("410012081", var_330_21)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_410012", "410012081", "story_v_out_410012.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_410012", "410012081", "story_v_out_410012.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_22 = math.max(var_330_13, arg_327_1.talkMaxDuration)

			if var_330_12 <= arg_327_1.time_ and arg_327_1.time_ < var_330_12 + var_330_22 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_12) / var_330_22

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_12 + var_330_22 and arg_327_1.time_ < var_330_12 + var_330_22 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play410012082 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 410012082
		arg_331_1.duration_ = 7.3

		local var_331_0 = {
			zh = 3.2,
			ja = 7.3
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
				arg_331_0:Play410012083(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1060"]
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 and arg_331_1.var_.actorSpriteComps1060 == nil then
				arg_331_1.var_.actorSpriteComps1060 = var_334_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_334_2 = 0.034

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2

				if arg_331_1.var_.actorSpriteComps1060 then
					for iter_334_0, iter_334_1 in pairs(arg_331_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_334_1 then
							local var_334_4 = Mathf.Lerp(iter_334_1.color.r, 0.5, var_334_3)

							iter_334_1.color = Color.New(var_334_4, var_334_4, var_334_4)
						end
					end
				end
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 and arg_331_1.var_.actorSpriteComps1060 then
				local var_334_5 = 0.5

				for iter_334_2, iter_334_3 in pairs(arg_331_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_334_3 then
						iter_334_3.color = Color.New(var_334_5, var_334_5, var_334_5)
					end
				end

				arg_331_1.var_.actorSpriteComps1060 = nil
			end

			local var_334_6 = arg_331_1.actors_["10061"]
			local var_334_7 = 0

			if var_334_7 < arg_331_1.time_ and arg_331_1.time_ <= var_334_7 + arg_334_0 and arg_331_1.var_.actorSpriteComps10061 == nil then
				arg_331_1.var_.actorSpriteComps10061 = var_334_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_334_8 = 0.034

			if var_334_7 <= arg_331_1.time_ and arg_331_1.time_ < var_334_7 + var_334_8 then
				local var_334_9 = (arg_331_1.time_ - var_334_7) / var_334_8

				if arg_331_1.var_.actorSpriteComps10061 then
					for iter_334_4, iter_334_5 in pairs(arg_331_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_334_5 then
							local var_334_10 = Mathf.Lerp(iter_334_5.color.r, 1, var_334_9)

							iter_334_5.color = Color.New(var_334_10, var_334_10, var_334_10)
						end
					end
				end
			end

			if arg_331_1.time_ >= var_334_7 + var_334_8 and arg_331_1.time_ < var_334_7 + var_334_8 + arg_334_0 and arg_331_1.var_.actorSpriteComps10061 then
				local var_334_11 = 1

				for iter_334_6, iter_334_7 in pairs(arg_331_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_334_7 then
						iter_334_7.color = Color.New(var_334_11, var_334_11, var_334_11)
					end
				end

				arg_331_1.var_.actorSpriteComps10061 = nil
			end

			local var_334_12 = 0
			local var_334_13 = 0.4

			if var_334_12 < arg_331_1.time_ and arg_331_1.time_ <= var_334_12 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_14 = arg_331_1:FormatText(StoryNameCfg[591].name)

				arg_331_1.leftNameTxt_.text = var_334_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_15 = arg_331_1:GetWordFromCfg(410012082)
				local var_334_16 = arg_331_1:FormatText(var_334_15.content)

				arg_331_1.text_.text = var_334_16

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_17 = 16
				local var_334_18 = utf8.len(var_334_16)
				local var_334_19 = var_334_17 <= 0 and var_334_13 or var_334_13 * (var_334_18 / var_334_17)

				if var_334_19 > 0 and var_334_13 < var_334_19 then
					arg_331_1.talkMaxDuration = var_334_19

					if var_334_19 + var_334_12 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_19 + var_334_12
					end
				end

				arg_331_1.text_.text = var_334_16
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012082", "story_v_out_410012.awb") ~= 0 then
					local var_334_20 = manager.audio:GetVoiceLength("story_v_out_410012", "410012082", "story_v_out_410012.awb") / 1000

					if var_334_20 + var_334_12 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_20 + var_334_12
					end

					if var_334_15.prefab_name ~= "" and arg_331_1.actors_[var_334_15.prefab_name] ~= nil then
						local var_334_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_15.prefab_name].transform, "story_v_out_410012", "410012082", "story_v_out_410012.awb")

						arg_331_1:RecordAudio("410012082", var_334_21)
						arg_331_1:RecordAudio("410012082", var_334_21)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_410012", "410012082", "story_v_out_410012.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_410012", "410012082", "story_v_out_410012.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_22 = math.max(var_334_13, arg_331_1.talkMaxDuration)

			if var_334_12 <= arg_331_1.time_ and arg_331_1.time_ < var_334_12 + var_334_22 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_12) / var_334_22

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_12 + var_334_22 and arg_331_1.time_ < var_334_12 + var_334_22 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play410012083 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 410012083
		arg_335_1.duration_ = 6.833

		local var_335_0 = {
			zh = 1.633,
			ja = 6.833
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
				arg_335_0:Play410012084(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = arg_335_1.actors_["1060"]
			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 and arg_335_1.var_.actorSpriteComps1060 == nil then
				arg_335_1.var_.actorSpriteComps1060 = var_338_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_338_2 = 0.034

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_2 then
				local var_338_3 = (arg_335_1.time_ - var_338_1) / var_338_2

				if arg_335_1.var_.actorSpriteComps1060 then
					for iter_338_0, iter_338_1 in pairs(arg_335_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_338_1 then
							local var_338_4 = Mathf.Lerp(iter_338_1.color.r, 1, var_338_3)

							iter_338_1.color = Color.New(var_338_4, var_338_4, var_338_4)
						end
					end
				end
			end

			if arg_335_1.time_ >= var_338_1 + var_338_2 and arg_335_1.time_ < var_338_1 + var_338_2 + arg_338_0 and arg_335_1.var_.actorSpriteComps1060 then
				local var_338_5 = 1

				for iter_338_2, iter_338_3 in pairs(arg_335_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_338_3 then
						iter_338_3.color = Color.New(var_338_5, var_338_5, var_338_5)
					end
				end

				arg_335_1.var_.actorSpriteComps1060 = nil
			end

			local var_338_6 = arg_335_1.actors_["10061"]
			local var_338_7 = 0

			if var_338_7 < arg_335_1.time_ and arg_335_1.time_ <= var_338_7 + arg_338_0 and arg_335_1.var_.actorSpriteComps10061 == nil then
				arg_335_1.var_.actorSpriteComps10061 = var_338_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_338_8 = 0.034

			if var_338_7 <= arg_335_1.time_ and arg_335_1.time_ < var_338_7 + var_338_8 then
				local var_338_9 = (arg_335_1.time_ - var_338_7) / var_338_8

				if arg_335_1.var_.actorSpriteComps10061 then
					for iter_338_4, iter_338_5 in pairs(arg_335_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_338_5 then
							local var_338_10 = Mathf.Lerp(iter_338_5.color.r, 0.5, var_338_9)

							iter_338_5.color = Color.New(var_338_10, var_338_10, var_338_10)
						end
					end
				end
			end

			if arg_335_1.time_ >= var_338_7 + var_338_8 and arg_335_1.time_ < var_338_7 + var_338_8 + arg_338_0 and arg_335_1.var_.actorSpriteComps10061 then
				local var_338_11 = 0.5

				for iter_338_6, iter_338_7 in pairs(arg_335_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_338_7 then
						iter_338_7.color = Color.New(var_338_11, var_338_11, var_338_11)
					end
				end

				arg_335_1.var_.actorSpriteComps10061 = nil
			end

			local var_338_12 = 0
			local var_338_13 = 0.225

			if var_338_12 < arg_335_1.time_ and arg_335_1.time_ <= var_338_12 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_14 = arg_335_1:FormatText(StoryNameCfg[584].name)

				arg_335_1.leftNameTxt_.text = var_338_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_15 = arg_335_1:GetWordFromCfg(410012083)
				local var_338_16 = arg_335_1:FormatText(var_338_15.content)

				arg_335_1.text_.text = var_338_16

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_17 = 9
				local var_338_18 = utf8.len(var_338_16)
				local var_338_19 = var_338_17 <= 0 and var_338_13 or var_338_13 * (var_338_18 / var_338_17)

				if var_338_19 > 0 and var_338_13 < var_338_19 then
					arg_335_1.talkMaxDuration = var_338_19

					if var_338_19 + var_338_12 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_19 + var_338_12
					end
				end

				arg_335_1.text_.text = var_338_16
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012083", "story_v_out_410012.awb") ~= 0 then
					local var_338_20 = manager.audio:GetVoiceLength("story_v_out_410012", "410012083", "story_v_out_410012.awb") / 1000

					if var_338_20 + var_338_12 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_20 + var_338_12
					end

					if var_338_15.prefab_name ~= "" and arg_335_1.actors_[var_338_15.prefab_name] ~= nil then
						local var_338_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_15.prefab_name].transform, "story_v_out_410012", "410012083", "story_v_out_410012.awb")

						arg_335_1:RecordAudio("410012083", var_338_21)
						arg_335_1:RecordAudio("410012083", var_338_21)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_410012", "410012083", "story_v_out_410012.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_410012", "410012083", "story_v_out_410012.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_22 = math.max(var_338_13, arg_335_1.talkMaxDuration)

			if var_338_12 <= arg_335_1.time_ and arg_335_1.time_ < var_338_12 + var_338_22 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_12) / var_338_22

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_12 + var_338_22 and arg_335_1.time_ < var_338_12 + var_338_22 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play410012084 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 410012084
		arg_339_1.duration_ = 3.733

		local var_339_0 = {
			zh = 2.466,
			ja = 3.733
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
				arg_339_0:Play410012085(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["10061"].transform
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 then
				arg_339_1.var_.moveOldPos10061 = var_342_0.localPosition
				var_342_0.localScale = Vector3.New(1, 1, 1)

				arg_339_1:CheckSpriteTmpPos("10061", 4)

				local var_342_2 = var_342_0.childCount

				for iter_342_0 = 0, var_342_2 - 1 do
					local var_342_3 = var_342_0:GetChild(iter_342_0)

					if var_342_3.name == "split_3" or not string.find(var_342_3.name, "split") then
						var_342_3.gameObject:SetActive(true)
					else
						var_342_3.gameObject:SetActive(false)
					end
				end
			end

			local var_342_4 = 0.001

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_4 then
				local var_342_5 = (arg_339_1.time_ - var_342_1) / var_342_4
				local var_342_6 = Vector3.New(390, -517.5, -100)

				var_342_0.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos10061, var_342_6, var_342_5)
			end

			if arg_339_1.time_ >= var_342_1 + var_342_4 and arg_339_1.time_ < var_342_1 + var_342_4 + arg_342_0 then
				var_342_0.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_342_7 = arg_339_1.actors_["10061"]
			local var_342_8 = 0

			if var_342_8 < arg_339_1.time_ and arg_339_1.time_ <= var_342_8 + arg_342_0 and arg_339_1.var_.actorSpriteComps10061 == nil then
				arg_339_1.var_.actorSpriteComps10061 = var_342_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_342_9 = 0.034

			if var_342_8 <= arg_339_1.time_ and arg_339_1.time_ < var_342_8 + var_342_9 then
				local var_342_10 = (arg_339_1.time_ - var_342_8) / var_342_9

				if arg_339_1.var_.actorSpriteComps10061 then
					for iter_342_1, iter_342_2 in pairs(arg_339_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_342_2 then
							local var_342_11 = Mathf.Lerp(iter_342_2.color.r, 1, var_342_10)

							iter_342_2.color = Color.New(var_342_11, var_342_11, var_342_11)
						end
					end
				end
			end

			if arg_339_1.time_ >= var_342_8 + var_342_9 and arg_339_1.time_ < var_342_8 + var_342_9 + arg_342_0 and arg_339_1.var_.actorSpriteComps10061 then
				local var_342_12 = 1

				for iter_342_3, iter_342_4 in pairs(arg_339_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_342_4 then
						iter_342_4.color = Color.New(var_342_12, var_342_12, var_342_12)
					end
				end

				arg_339_1.var_.actorSpriteComps10061 = nil
			end

			local var_342_13 = arg_339_1.actors_["1060"]
			local var_342_14 = 0

			if var_342_14 < arg_339_1.time_ and arg_339_1.time_ <= var_342_14 + arg_342_0 and arg_339_1.var_.actorSpriteComps1060 == nil then
				arg_339_1.var_.actorSpriteComps1060 = var_342_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_342_15 = 0.034

			if var_342_14 <= arg_339_1.time_ and arg_339_1.time_ < var_342_14 + var_342_15 then
				local var_342_16 = (arg_339_1.time_ - var_342_14) / var_342_15

				if arg_339_1.var_.actorSpriteComps1060 then
					for iter_342_5, iter_342_6 in pairs(arg_339_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_342_6 then
							local var_342_17 = Mathf.Lerp(iter_342_6.color.r, 0.5, var_342_16)

							iter_342_6.color = Color.New(var_342_17, var_342_17, var_342_17)
						end
					end
				end
			end

			if arg_339_1.time_ >= var_342_14 + var_342_15 and arg_339_1.time_ < var_342_14 + var_342_15 + arg_342_0 and arg_339_1.var_.actorSpriteComps1060 then
				local var_342_18 = 0.5

				for iter_342_7, iter_342_8 in pairs(arg_339_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_342_8 then
						iter_342_8.color = Color.New(var_342_18, var_342_18, var_342_18)
					end
				end

				arg_339_1.var_.actorSpriteComps1060 = nil
			end

			local var_342_19 = 0
			local var_342_20 = 0.3

			if var_342_19 < arg_339_1.time_ and arg_339_1.time_ <= var_342_19 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_21 = arg_339_1:FormatText(StoryNameCfg[591].name)

				arg_339_1.leftNameTxt_.text = var_342_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_22 = arg_339_1:GetWordFromCfg(410012084)
				local var_342_23 = arg_339_1:FormatText(var_342_22.content)

				arg_339_1.text_.text = var_342_23

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_24 = 12
				local var_342_25 = utf8.len(var_342_23)
				local var_342_26 = var_342_24 <= 0 and var_342_20 or var_342_20 * (var_342_25 / var_342_24)

				if var_342_26 > 0 and var_342_20 < var_342_26 then
					arg_339_1.talkMaxDuration = var_342_26

					if var_342_26 + var_342_19 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_26 + var_342_19
					end
				end

				arg_339_1.text_.text = var_342_23
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012084", "story_v_out_410012.awb") ~= 0 then
					local var_342_27 = manager.audio:GetVoiceLength("story_v_out_410012", "410012084", "story_v_out_410012.awb") / 1000

					if var_342_27 + var_342_19 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_27 + var_342_19
					end

					if var_342_22.prefab_name ~= "" and arg_339_1.actors_[var_342_22.prefab_name] ~= nil then
						local var_342_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_22.prefab_name].transform, "story_v_out_410012", "410012084", "story_v_out_410012.awb")

						arg_339_1:RecordAudio("410012084", var_342_28)
						arg_339_1:RecordAudio("410012084", var_342_28)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_410012", "410012084", "story_v_out_410012.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_410012", "410012084", "story_v_out_410012.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_29 = math.max(var_342_20, arg_339_1.talkMaxDuration)

			if var_342_19 <= arg_339_1.time_ and arg_339_1.time_ < var_342_19 + var_342_29 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_19) / var_342_29

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_19 + var_342_29 and arg_339_1.time_ < var_342_19 + var_342_29 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play410012085 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 410012085
		arg_343_1.duration_ = 5

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play410012086(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["10061"]
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 and arg_343_1.var_.actorSpriteComps10061 == nil then
				arg_343_1.var_.actorSpriteComps10061 = var_346_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_346_2 = 0.034

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2

				if arg_343_1.var_.actorSpriteComps10061 then
					for iter_346_0, iter_346_1 in pairs(arg_343_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_346_1 then
							local var_346_4 = Mathf.Lerp(iter_346_1.color.r, 0.5, var_346_3)

							iter_346_1.color = Color.New(var_346_4, var_346_4, var_346_4)
						end
					end
				end
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 and arg_343_1.var_.actorSpriteComps10061 then
				local var_346_5 = 0.5

				for iter_346_2, iter_346_3 in pairs(arg_343_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_346_3 then
						iter_346_3.color = Color.New(var_346_5, var_346_5, var_346_5)
					end
				end

				arg_343_1.var_.actorSpriteComps10061 = nil
			end

			local var_346_6 = 0
			local var_346_7 = 1.15

			if var_346_6 < arg_343_1.time_ and arg_343_1.time_ <= var_346_6 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, false)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_8 = arg_343_1:GetWordFromCfg(410012085)
				local var_346_9 = arg_343_1:FormatText(var_346_8.content)

				arg_343_1.text_.text = var_346_9

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_10 = 46
				local var_346_11 = utf8.len(var_346_9)
				local var_346_12 = var_346_10 <= 0 and var_346_7 or var_346_7 * (var_346_11 / var_346_10)

				if var_346_12 > 0 and var_346_7 < var_346_12 then
					arg_343_1.talkMaxDuration = var_346_12

					if var_346_12 + var_346_6 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_12 + var_346_6
					end
				end

				arg_343_1.text_.text = var_346_9
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)
				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_13 = math.max(var_346_7, arg_343_1.talkMaxDuration)

			if var_346_6 <= arg_343_1.time_ and arg_343_1.time_ < var_346_6 + var_346_13 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_6) / var_346_13

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_6 + var_346_13 and arg_343_1.time_ < var_346_6 + var_346_13 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play410012086 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 410012086
		arg_347_1.duration_ = 9

		local var_347_0 = {
			zh = 8.833,
			ja = 9
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
				arg_347_0:Play410012087(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["10061"].transform
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 then
				arg_347_1.var_.moveOldPos10061 = var_350_0.localPosition
				var_350_0.localScale = Vector3.New(1, 1, 1)

				arg_347_1:CheckSpriteTmpPos("10061", 3)

				local var_350_2 = var_350_0.childCount

				for iter_350_0 = 0, var_350_2 - 1 do
					local var_350_3 = var_350_0:GetChild(iter_350_0)

					if var_350_3.name == "" or not string.find(var_350_3.name, "split") then
						var_350_3.gameObject:SetActive(true)
					else
						var_350_3.gameObject:SetActive(false)
					end
				end
			end

			local var_350_4 = 0.001

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_4 then
				local var_350_5 = (arg_347_1.time_ - var_350_1) / var_350_4
				local var_350_6 = Vector3.New(0, -517.5, -100)

				var_350_0.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPos10061, var_350_6, var_350_5)
			end

			if arg_347_1.time_ >= var_350_1 + var_350_4 and arg_347_1.time_ < var_350_1 + var_350_4 + arg_350_0 then
				var_350_0.localPosition = Vector3.New(0, -517.5, -100)
			end

			local var_350_7 = arg_347_1.actors_["1060"].transform
			local var_350_8 = 0

			if var_350_8 < arg_347_1.time_ and arg_347_1.time_ <= var_350_8 + arg_350_0 then
				arg_347_1.var_.moveOldPos1060 = var_350_7.localPosition
				var_350_7.localScale = Vector3.New(1, 1, 1)

				arg_347_1:CheckSpriteTmpPos("1060", 7)

				local var_350_9 = var_350_7.childCount

				for iter_350_1 = 0, var_350_9 - 1 do
					local var_350_10 = var_350_7:GetChild(iter_350_1)

					if var_350_10.name == "" or not string.find(var_350_10.name, "split") then
						var_350_10.gameObject:SetActive(true)
					else
						var_350_10.gameObject:SetActive(false)
					end
				end
			end

			local var_350_11 = 0.001

			if var_350_8 <= arg_347_1.time_ and arg_347_1.time_ < var_350_8 + var_350_11 then
				local var_350_12 = (arg_347_1.time_ - var_350_8) / var_350_11
				local var_350_13 = Vector3.New(0, -2000, -40)

				var_350_7.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPos1060, var_350_13, var_350_12)
			end

			if arg_347_1.time_ >= var_350_8 + var_350_11 and arg_347_1.time_ < var_350_8 + var_350_11 + arg_350_0 then
				var_350_7.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_350_14 = arg_347_1.actors_["10061"]
			local var_350_15 = 0

			if var_350_15 < arg_347_1.time_ and arg_347_1.time_ <= var_350_15 + arg_350_0 and arg_347_1.var_.actorSpriteComps10061 == nil then
				arg_347_1.var_.actorSpriteComps10061 = var_350_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_350_16 = 0.034

			if var_350_15 <= arg_347_1.time_ and arg_347_1.time_ < var_350_15 + var_350_16 then
				local var_350_17 = (arg_347_1.time_ - var_350_15) / var_350_16

				if arg_347_1.var_.actorSpriteComps10061 then
					for iter_350_2, iter_350_3 in pairs(arg_347_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_350_3 then
							local var_350_18 = Mathf.Lerp(iter_350_3.color.r, 1, var_350_17)

							iter_350_3.color = Color.New(var_350_18, var_350_18, var_350_18)
						end
					end
				end
			end

			if arg_347_1.time_ >= var_350_15 + var_350_16 and arg_347_1.time_ < var_350_15 + var_350_16 + arg_350_0 and arg_347_1.var_.actorSpriteComps10061 then
				local var_350_19 = 1

				for iter_350_4, iter_350_5 in pairs(arg_347_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_350_5 then
						iter_350_5.color = Color.New(var_350_19, var_350_19, var_350_19)
					end
				end

				arg_347_1.var_.actorSpriteComps10061 = nil
			end

			local var_350_20 = arg_347_1.actors_["1060"]
			local var_350_21 = 0

			if var_350_21 < arg_347_1.time_ and arg_347_1.time_ <= var_350_21 + arg_350_0 and arg_347_1.var_.actorSpriteComps1060 == nil then
				arg_347_1.var_.actorSpriteComps1060 = var_350_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_350_22 = 0.034

			if var_350_21 <= arg_347_1.time_ and arg_347_1.time_ < var_350_21 + var_350_22 then
				local var_350_23 = (arg_347_1.time_ - var_350_21) / var_350_22

				if arg_347_1.var_.actorSpriteComps1060 then
					for iter_350_6, iter_350_7 in pairs(arg_347_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_350_7 then
							local var_350_24 = Mathf.Lerp(iter_350_7.color.r, 0.5, var_350_23)

							iter_350_7.color = Color.New(var_350_24, var_350_24, var_350_24)
						end
					end
				end
			end

			if arg_347_1.time_ >= var_350_21 + var_350_22 and arg_347_1.time_ < var_350_21 + var_350_22 + arg_350_0 and arg_347_1.var_.actorSpriteComps1060 then
				local var_350_25 = 0.5

				for iter_350_8, iter_350_9 in pairs(arg_347_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_350_9 then
						iter_350_9.color = Color.New(var_350_25, var_350_25, var_350_25)
					end
				end

				arg_347_1.var_.actorSpriteComps1060 = nil
			end

			local var_350_26 = 0
			local var_350_27 = 0.85

			if var_350_26 < arg_347_1.time_ and arg_347_1.time_ <= var_350_26 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_28 = arg_347_1:FormatText(StoryNameCfg[591].name)

				arg_347_1.leftNameTxt_.text = var_350_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_29 = arg_347_1:GetWordFromCfg(410012086)
				local var_350_30 = arg_347_1:FormatText(var_350_29.content)

				arg_347_1.text_.text = var_350_30

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_31 = 34
				local var_350_32 = utf8.len(var_350_30)
				local var_350_33 = var_350_31 <= 0 and var_350_27 or var_350_27 * (var_350_32 / var_350_31)

				if var_350_33 > 0 and var_350_27 < var_350_33 then
					arg_347_1.talkMaxDuration = var_350_33

					if var_350_33 + var_350_26 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_33 + var_350_26
					end
				end

				arg_347_1.text_.text = var_350_30
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012086", "story_v_out_410012.awb") ~= 0 then
					local var_350_34 = manager.audio:GetVoiceLength("story_v_out_410012", "410012086", "story_v_out_410012.awb") / 1000

					if var_350_34 + var_350_26 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_34 + var_350_26
					end

					if var_350_29.prefab_name ~= "" and arg_347_1.actors_[var_350_29.prefab_name] ~= nil then
						local var_350_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_29.prefab_name].transform, "story_v_out_410012", "410012086", "story_v_out_410012.awb")

						arg_347_1:RecordAudio("410012086", var_350_35)
						arg_347_1:RecordAudio("410012086", var_350_35)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_410012", "410012086", "story_v_out_410012.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_410012", "410012086", "story_v_out_410012.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_36 = math.max(var_350_27, arg_347_1.talkMaxDuration)

			if var_350_26 <= arg_347_1.time_ and arg_347_1.time_ < var_350_26 + var_350_36 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_26) / var_350_36

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_26 + var_350_36 and arg_347_1.time_ < var_350_26 + var_350_36 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play410012087 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 410012087
		arg_351_1.duration_ = 5

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play410012088(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["10061"]
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 and arg_351_1.var_.actorSpriteComps10061 == nil then
				arg_351_1.var_.actorSpriteComps10061 = var_354_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_354_2 = 0.034

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_2 then
				local var_354_3 = (arg_351_1.time_ - var_354_1) / var_354_2

				if arg_351_1.var_.actorSpriteComps10061 then
					for iter_354_0, iter_354_1 in pairs(arg_351_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_354_1 then
							local var_354_4 = Mathf.Lerp(iter_354_1.color.r, 0.5, var_354_3)

							iter_354_1.color = Color.New(var_354_4, var_354_4, var_354_4)
						end
					end
				end
			end

			if arg_351_1.time_ >= var_354_1 + var_354_2 and arg_351_1.time_ < var_354_1 + var_354_2 + arg_354_0 and arg_351_1.var_.actorSpriteComps10061 then
				local var_354_5 = 0.5

				for iter_354_2, iter_354_3 in pairs(arg_351_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_354_3 then
						iter_354_3.color = Color.New(var_354_5, var_354_5, var_354_5)
					end
				end

				arg_351_1.var_.actorSpriteComps10061 = nil
			end

			local var_354_6 = 0
			local var_354_7 = 1.75

			if var_354_6 < arg_351_1.time_ and arg_351_1.time_ <= var_354_6 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, false)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_8 = arg_351_1:GetWordFromCfg(410012087)
				local var_354_9 = arg_351_1:FormatText(var_354_8.content)

				arg_351_1.text_.text = var_354_9

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_10 = 70
				local var_354_11 = utf8.len(var_354_9)
				local var_354_12 = var_354_10 <= 0 and var_354_7 or var_354_7 * (var_354_11 / var_354_10)

				if var_354_12 > 0 and var_354_7 < var_354_12 then
					arg_351_1.talkMaxDuration = var_354_12

					if var_354_12 + var_354_6 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_12 + var_354_6
					end
				end

				arg_351_1.text_.text = var_354_9
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)
				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_13 = math.max(var_354_7, arg_351_1.talkMaxDuration)

			if var_354_6 <= arg_351_1.time_ and arg_351_1.time_ < var_354_6 + var_354_13 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_6) / var_354_13

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_6 + var_354_13 and arg_351_1.time_ < var_354_6 + var_354_13 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play410012088 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 410012088
		arg_355_1.duration_ = 5

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play410012089(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = 0
			local var_358_1 = 0.8

			if var_358_0 < arg_355_1.time_ and arg_355_1.time_ <= var_358_0 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, false)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_2 = arg_355_1:GetWordFromCfg(410012088)
				local var_358_3 = arg_355_1:FormatText(var_358_2.content)

				arg_355_1.text_.text = var_358_3

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_4 = 32
				local var_358_5 = utf8.len(var_358_3)
				local var_358_6 = var_358_4 <= 0 and var_358_1 or var_358_1 * (var_358_5 / var_358_4)

				if var_358_6 > 0 and var_358_1 < var_358_6 then
					arg_355_1.talkMaxDuration = var_358_6

					if var_358_6 + var_358_0 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_6 + var_358_0
					end
				end

				arg_355_1.text_.text = var_358_3
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)
				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_7 = math.max(var_358_1, arg_355_1.talkMaxDuration)

			if var_358_0 <= arg_355_1.time_ and arg_355_1.time_ < var_358_0 + var_358_7 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_0) / var_358_7

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_0 + var_358_7 and arg_355_1.time_ < var_358_0 + var_358_7 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play410012089 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 410012089
		arg_359_1.duration_ = 4.633

		local var_359_0 = {
			zh = 4.1,
			ja = 4.633
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
				arg_359_0:Play410012090(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = 0
			local var_362_1 = 0.55

			if var_362_0 < arg_359_1.time_ and arg_359_1.time_ <= var_362_0 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_2 = arg_359_1:FormatText(StoryNameCfg[36].name)

				arg_359_1.leftNameTxt_.text = var_362_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_3 = arg_359_1:GetWordFromCfg(410012089)
				local var_362_4 = arg_359_1:FormatText(var_362_3.content)

				arg_359_1.text_.text = var_362_4

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_5 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012089", "story_v_out_410012.awb") ~= 0 then
					local var_362_8 = manager.audio:GetVoiceLength("story_v_out_410012", "410012089", "story_v_out_410012.awb") / 1000

					if var_362_8 + var_362_0 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_8 + var_362_0
					end

					if var_362_3.prefab_name ~= "" and arg_359_1.actors_[var_362_3.prefab_name] ~= nil then
						local var_362_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_359_1.actors_[var_362_3.prefab_name].transform, "story_v_out_410012", "410012089", "story_v_out_410012.awb")

						arg_359_1:RecordAudio("410012089", var_362_9)
						arg_359_1:RecordAudio("410012089", var_362_9)
					else
						arg_359_1:AudioAction("play", "voice", "story_v_out_410012", "410012089", "story_v_out_410012.awb")
					end

					arg_359_1:RecordHistoryTalkVoice("story_v_out_410012", "410012089", "story_v_out_410012.awb")
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
	Play410012090 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 410012090
		arg_363_1.duration_ = 2.1

		local var_363_0 = {
			zh = 2.1,
			ja = 2
		}
		local var_363_1 = manager.audio:GetLocalizationFlag()

		if var_363_0[var_363_1] ~= nil then
			arg_363_1.duration_ = var_363_0[var_363_1]
		end

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play410012091(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["10061"].transform
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 then
				arg_363_1.var_.moveOldPos10061 = var_366_0.localPosition
				var_366_0.localScale = Vector3.New(1, 1, 1)

				arg_363_1:CheckSpriteTmpPos("10061", 3)

				local var_366_2 = var_366_0.childCount

				for iter_366_0 = 0, var_366_2 - 1 do
					local var_366_3 = var_366_0:GetChild(iter_366_0)

					if var_366_3.name == "split_5" or not string.find(var_366_3.name, "split") then
						var_366_3.gameObject:SetActive(true)
					else
						var_366_3.gameObject:SetActive(false)
					end
				end
			end

			local var_366_4 = 0.001

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_4 then
				local var_366_5 = (arg_363_1.time_ - var_366_1) / var_366_4
				local var_366_6 = Vector3.New(0, -517.5, -100)

				var_366_0.localPosition = Vector3.Lerp(arg_363_1.var_.moveOldPos10061, var_366_6, var_366_5)
			end

			if arg_363_1.time_ >= var_366_1 + var_366_4 and arg_363_1.time_ < var_366_1 + var_366_4 + arg_366_0 then
				var_366_0.localPosition = Vector3.New(0, -517.5, -100)
			end

			local var_366_7 = arg_363_1.actors_["10061"]
			local var_366_8 = 0

			if var_366_8 < arg_363_1.time_ and arg_363_1.time_ <= var_366_8 + arg_366_0 and arg_363_1.var_.actorSpriteComps10061 == nil then
				arg_363_1.var_.actorSpriteComps10061 = var_366_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_366_9 = 0.034

			if var_366_8 <= arg_363_1.time_ and arg_363_1.time_ < var_366_8 + var_366_9 then
				local var_366_10 = (arg_363_1.time_ - var_366_8) / var_366_9

				if arg_363_1.var_.actorSpriteComps10061 then
					for iter_366_1, iter_366_2 in pairs(arg_363_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_366_2 then
							local var_366_11 = Mathf.Lerp(iter_366_2.color.r, 1, var_366_10)

							iter_366_2.color = Color.New(var_366_11, var_366_11, var_366_11)
						end
					end
				end
			end

			if arg_363_1.time_ >= var_366_8 + var_366_9 and arg_363_1.time_ < var_366_8 + var_366_9 + arg_366_0 and arg_363_1.var_.actorSpriteComps10061 then
				local var_366_12 = 1

				for iter_366_3, iter_366_4 in pairs(arg_363_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_366_4 then
						iter_366_4.color = Color.New(var_366_12, var_366_12, var_366_12)
					end
				end

				arg_363_1.var_.actorSpriteComps10061 = nil
			end

			local var_366_13 = 0
			local var_366_14 = 0.175

			if var_366_13 < arg_363_1.time_ and arg_363_1.time_ <= var_366_13 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_15 = arg_363_1:FormatText(StoryNameCfg[591].name)

				arg_363_1.leftNameTxt_.text = var_366_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_16 = arg_363_1:GetWordFromCfg(410012090)
				local var_366_17 = arg_363_1:FormatText(var_366_16.content)

				arg_363_1.text_.text = var_366_17

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_18 = 7
				local var_366_19 = utf8.len(var_366_17)
				local var_366_20 = var_366_18 <= 0 and var_366_14 or var_366_14 * (var_366_19 / var_366_18)

				if var_366_20 > 0 and var_366_14 < var_366_20 then
					arg_363_1.talkMaxDuration = var_366_20

					if var_366_20 + var_366_13 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_20 + var_366_13
					end
				end

				arg_363_1.text_.text = var_366_17
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012090", "story_v_out_410012.awb") ~= 0 then
					local var_366_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012090", "story_v_out_410012.awb") / 1000

					if var_366_21 + var_366_13 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_21 + var_366_13
					end

					if var_366_16.prefab_name ~= "" and arg_363_1.actors_[var_366_16.prefab_name] ~= nil then
						local var_366_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_16.prefab_name].transform, "story_v_out_410012", "410012090", "story_v_out_410012.awb")

						arg_363_1:RecordAudio("410012090", var_366_22)
						arg_363_1:RecordAudio("410012090", var_366_22)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_out_410012", "410012090", "story_v_out_410012.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_out_410012", "410012090", "story_v_out_410012.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_23 = math.max(var_366_14, arg_363_1.talkMaxDuration)

			if var_366_13 <= arg_363_1.time_ and arg_363_1.time_ < var_366_13 + var_366_23 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_13) / var_366_23

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_13 + var_366_23 and arg_363_1.time_ < var_366_13 + var_366_23 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play410012091 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 410012091
		arg_367_1.duration_ = 3.9

		local var_367_0 = {
			zh = 2.066,
			ja = 3.9
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
				arg_367_0:Play410012092(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["10061"]
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 and arg_367_1.var_.actorSpriteComps10061 == nil then
				arg_367_1.var_.actorSpriteComps10061 = var_370_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_370_2 = 0.034

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_2 then
				local var_370_3 = (arg_367_1.time_ - var_370_1) / var_370_2

				if arg_367_1.var_.actorSpriteComps10061 then
					for iter_370_0, iter_370_1 in pairs(arg_367_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_370_1 then
							local var_370_4 = Mathf.Lerp(iter_370_1.color.r, 0.5, var_370_3)

							iter_370_1.color = Color.New(var_370_4, var_370_4, var_370_4)
						end
					end
				end
			end

			if arg_367_1.time_ >= var_370_1 + var_370_2 and arg_367_1.time_ < var_370_1 + var_370_2 + arg_370_0 and arg_367_1.var_.actorSpriteComps10061 then
				local var_370_5 = 0.5

				for iter_370_2, iter_370_3 in pairs(arg_367_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_370_3 then
						iter_370_3.color = Color.New(var_370_5, var_370_5, var_370_5)
					end
				end

				arg_367_1.var_.actorSpriteComps10061 = nil
			end

			local var_370_6 = 0
			local var_370_7 = 0.2

			if var_370_6 < arg_367_1.time_ and arg_367_1.time_ <= var_370_6 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_8 = arg_367_1:FormatText(StoryNameCfg[605].name)

				arg_367_1.leftNameTxt_.text = var_370_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, true)
				arg_367_1.iconController_:SetSelectedState("hero")

				arg_367_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1056_split_4")

				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_9 = arg_367_1:GetWordFromCfg(410012091)
				local var_370_10 = arg_367_1:FormatText(var_370_9.content)

				arg_367_1.text_.text = var_370_10

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_11 = 8
				local var_370_12 = utf8.len(var_370_10)
				local var_370_13 = var_370_11 <= 0 and var_370_7 or var_370_7 * (var_370_12 / var_370_11)

				if var_370_13 > 0 and var_370_7 < var_370_13 then
					arg_367_1.talkMaxDuration = var_370_13

					if var_370_13 + var_370_6 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_13 + var_370_6
					end
				end

				arg_367_1.text_.text = var_370_10
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012091", "story_v_out_410012.awb") ~= 0 then
					local var_370_14 = manager.audio:GetVoiceLength("story_v_out_410012", "410012091", "story_v_out_410012.awb") / 1000

					if var_370_14 + var_370_6 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_14 + var_370_6
					end

					if var_370_9.prefab_name ~= "" and arg_367_1.actors_[var_370_9.prefab_name] ~= nil then
						local var_370_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_367_1.actors_[var_370_9.prefab_name].transform, "story_v_out_410012", "410012091", "story_v_out_410012.awb")

						arg_367_1:RecordAudio("410012091", var_370_15)
						arg_367_1:RecordAudio("410012091", var_370_15)
					else
						arg_367_1:AudioAction("play", "voice", "story_v_out_410012", "410012091", "story_v_out_410012.awb")
					end

					arg_367_1:RecordHistoryTalkVoice("story_v_out_410012", "410012091", "story_v_out_410012.awb")
				end

				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_16 = math.max(var_370_7, arg_367_1.talkMaxDuration)

			if var_370_6 <= arg_367_1.time_ and arg_367_1.time_ < var_370_6 + var_370_16 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_6) / var_370_16

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_6 + var_370_16 and arg_367_1.time_ < var_370_6 + var_370_16 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play410012092 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 410012092
		arg_371_1.duration_ = 7.033

		local var_371_0 = {
			zh = 5.466,
			ja = 7.033
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
				arg_371_0:Play410012093(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = arg_371_1.actors_["10061"].transform
			local var_374_1 = 0

			if var_374_1 < arg_371_1.time_ and arg_371_1.time_ <= var_374_1 + arg_374_0 then
				arg_371_1.var_.moveOldPos10061 = var_374_0.localPosition
				var_374_0.localScale = Vector3.New(1, 1, 1)

				arg_371_1:CheckSpriteTmpPos("10061", 3)

				local var_374_2 = var_374_0.childCount

				for iter_374_0 = 0, var_374_2 - 1 do
					local var_374_3 = var_374_0:GetChild(iter_374_0)

					if var_374_3.name == "" or not string.find(var_374_3.name, "split") then
						var_374_3.gameObject:SetActive(true)
					else
						var_374_3.gameObject:SetActive(false)
					end
				end
			end

			local var_374_4 = 0.001

			if var_374_1 <= arg_371_1.time_ and arg_371_1.time_ < var_374_1 + var_374_4 then
				local var_374_5 = (arg_371_1.time_ - var_374_1) / var_374_4
				local var_374_6 = Vector3.New(0, -517.5, -100)

				var_374_0.localPosition = Vector3.Lerp(arg_371_1.var_.moveOldPos10061, var_374_6, var_374_5)
			end

			if arg_371_1.time_ >= var_374_1 + var_374_4 and arg_371_1.time_ < var_374_1 + var_374_4 + arg_374_0 then
				var_374_0.localPosition = Vector3.New(0, -517.5, -100)
			end

			local var_374_7 = arg_371_1.actors_["10061"]
			local var_374_8 = 0

			if var_374_8 < arg_371_1.time_ and arg_371_1.time_ <= var_374_8 + arg_374_0 and arg_371_1.var_.actorSpriteComps10061 == nil then
				arg_371_1.var_.actorSpriteComps10061 = var_374_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_374_9 = 0.034

			if var_374_8 <= arg_371_1.time_ and arg_371_1.time_ < var_374_8 + var_374_9 then
				local var_374_10 = (arg_371_1.time_ - var_374_8) / var_374_9

				if arg_371_1.var_.actorSpriteComps10061 then
					for iter_374_1, iter_374_2 in pairs(arg_371_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_374_2 then
							local var_374_11 = Mathf.Lerp(iter_374_2.color.r, 1, var_374_10)

							iter_374_2.color = Color.New(var_374_11, var_374_11, var_374_11)
						end
					end
				end
			end

			if arg_371_1.time_ >= var_374_8 + var_374_9 and arg_371_1.time_ < var_374_8 + var_374_9 + arg_374_0 and arg_371_1.var_.actorSpriteComps10061 then
				local var_374_12 = 1

				for iter_374_3, iter_374_4 in pairs(arg_371_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_374_4 then
						iter_374_4.color = Color.New(var_374_12, var_374_12, var_374_12)
					end
				end

				arg_371_1.var_.actorSpriteComps10061 = nil
			end

			local var_374_13 = 0
			local var_374_14 = 0.65

			if var_374_13 < arg_371_1.time_ and arg_371_1.time_ <= var_374_13 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, true)

				local var_374_15 = arg_371_1:FormatText(StoryNameCfg[591].name)

				arg_371_1.leftNameTxt_.text = var_374_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_371_1.leftNameTxt_.transform)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1.leftNameTxt_.text)
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_16 = arg_371_1:GetWordFromCfg(410012092)
				local var_374_17 = arg_371_1:FormatText(var_374_16.content)

				arg_371_1.text_.text = var_374_17

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_18 = 26
				local var_374_19 = utf8.len(var_374_17)
				local var_374_20 = var_374_18 <= 0 and var_374_14 or var_374_14 * (var_374_19 / var_374_18)

				if var_374_20 > 0 and var_374_14 < var_374_20 then
					arg_371_1.talkMaxDuration = var_374_20

					if var_374_20 + var_374_13 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_20 + var_374_13
					end
				end

				arg_371_1.text_.text = var_374_17
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012092", "story_v_out_410012.awb") ~= 0 then
					local var_374_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012092", "story_v_out_410012.awb") / 1000

					if var_374_21 + var_374_13 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_21 + var_374_13
					end

					if var_374_16.prefab_name ~= "" and arg_371_1.actors_[var_374_16.prefab_name] ~= nil then
						local var_374_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_371_1.actors_[var_374_16.prefab_name].transform, "story_v_out_410012", "410012092", "story_v_out_410012.awb")

						arg_371_1:RecordAudio("410012092", var_374_22)
						arg_371_1:RecordAudio("410012092", var_374_22)
					else
						arg_371_1:AudioAction("play", "voice", "story_v_out_410012", "410012092", "story_v_out_410012.awb")
					end

					arg_371_1:RecordHistoryTalkVoice("story_v_out_410012", "410012092", "story_v_out_410012.awb")
				end

				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_23 = math.max(var_374_14, arg_371_1.talkMaxDuration)

			if var_374_13 <= arg_371_1.time_ and arg_371_1.time_ < var_374_13 + var_374_23 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_13) / var_374_23

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_13 + var_374_23 and arg_371_1.time_ < var_374_13 + var_374_23 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play410012093 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 410012093
		arg_375_1.duration_ = 5

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play410012094(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = arg_375_1.actors_["10061"].transform
			local var_378_1 = 0

			if var_378_1 < arg_375_1.time_ and arg_375_1.time_ <= var_378_1 + arg_378_0 then
				arg_375_1.var_.moveOldPos10061 = var_378_0.localPosition
				var_378_0.localScale = Vector3.New(1, 1, 1)

				arg_375_1:CheckSpriteTmpPos("10061", 7)

				local var_378_2 = var_378_0.childCount

				for iter_378_0 = 0, var_378_2 - 1 do
					local var_378_3 = var_378_0:GetChild(iter_378_0)

					if var_378_3.name == "" or not string.find(var_378_3.name, "split") then
						var_378_3.gameObject:SetActive(true)
					else
						var_378_3.gameObject:SetActive(false)
					end
				end
			end

			local var_378_4 = 0.001

			if var_378_1 <= arg_375_1.time_ and arg_375_1.time_ < var_378_1 + var_378_4 then
				local var_378_5 = (arg_375_1.time_ - var_378_1) / var_378_4
				local var_378_6 = Vector3.New(0, -2000, -100)

				var_378_0.localPosition = Vector3.Lerp(arg_375_1.var_.moveOldPos10061, var_378_6, var_378_5)
			end

			if arg_375_1.time_ >= var_378_1 + var_378_4 and arg_375_1.time_ < var_378_1 + var_378_4 + arg_378_0 then
				var_378_0.localPosition = Vector3.New(0, -2000, -100)
			end

			local var_378_7 = arg_375_1.actors_["10061"]
			local var_378_8 = 0

			if var_378_8 < arg_375_1.time_ and arg_375_1.time_ <= var_378_8 + arg_378_0 and arg_375_1.var_.actorSpriteComps10061 == nil then
				arg_375_1.var_.actorSpriteComps10061 = var_378_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_378_9 = 0.034

			if var_378_8 <= arg_375_1.time_ and arg_375_1.time_ < var_378_8 + var_378_9 then
				local var_378_10 = (arg_375_1.time_ - var_378_8) / var_378_9

				if arg_375_1.var_.actorSpriteComps10061 then
					for iter_378_1, iter_378_2 in pairs(arg_375_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_378_2 then
							local var_378_11 = Mathf.Lerp(iter_378_2.color.r, 0.5, var_378_10)

							iter_378_2.color = Color.New(var_378_11, var_378_11, var_378_11)
						end
					end
				end
			end

			if arg_375_1.time_ >= var_378_8 + var_378_9 and arg_375_1.time_ < var_378_8 + var_378_9 + arg_378_0 and arg_375_1.var_.actorSpriteComps10061 then
				local var_378_12 = 0.5

				for iter_378_3, iter_378_4 in pairs(arg_375_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_378_4 then
						iter_378_4.color = Color.New(var_378_12, var_378_12, var_378_12)
					end
				end

				arg_375_1.var_.actorSpriteComps10061 = nil
			end

			local var_378_13 = 0
			local var_378_14 = 1

			if var_378_13 < arg_375_1.time_ and arg_375_1.time_ <= var_378_13 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, false)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_15 = arg_375_1:GetWordFromCfg(410012093)
				local var_378_16 = arg_375_1:FormatText(var_378_15.content)

				arg_375_1.text_.text = var_378_16

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_17 = 40
				local var_378_18 = utf8.len(var_378_16)
				local var_378_19 = var_378_17 <= 0 and var_378_14 or var_378_14 * (var_378_18 / var_378_17)

				if var_378_19 > 0 and var_378_14 < var_378_19 then
					arg_375_1.talkMaxDuration = var_378_19

					if var_378_19 + var_378_13 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_19 + var_378_13
					end
				end

				arg_375_1.text_.text = var_378_16
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)
				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_20 = math.max(var_378_14, arg_375_1.talkMaxDuration)

			if var_378_13 <= arg_375_1.time_ and arg_375_1.time_ < var_378_13 + var_378_20 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_13) / var_378_20

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_13 + var_378_20 and arg_375_1.time_ < var_378_13 + var_378_20 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play410012094 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 410012094
		arg_379_1.duration_ = 5

		SetActive(arg_379_1.tipsGo_, false)

		function arg_379_1.onSingleLineFinish_()
			arg_379_1.onSingleLineUpdate_ = nil
			arg_379_1.onSingleLineFinish_ = nil
			arg_379_1.state_ = "waiting"
		end

		function arg_379_1.playNext_(arg_381_0)
			if arg_381_0 == 1 then
				arg_379_0:Play410012095(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = 0
			local var_382_1 = 0.85

			if var_382_0 < arg_379_1.time_ and arg_379_1.time_ <= var_382_0 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, false)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_2 = arg_379_1:GetWordFromCfg(410012094)
				local var_382_3 = arg_379_1:FormatText(var_382_2.content)

				arg_379_1.text_.text = var_382_3

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_4 = 34
				local var_382_5 = utf8.len(var_382_3)
				local var_382_6 = var_382_4 <= 0 and var_382_1 or var_382_1 * (var_382_5 / var_382_4)

				if var_382_6 > 0 and var_382_1 < var_382_6 then
					arg_379_1.talkMaxDuration = var_382_6

					if var_382_6 + var_382_0 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_6 + var_382_0
					end
				end

				arg_379_1.text_.text = var_382_3
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)
				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_7 = math.max(var_382_1, arg_379_1.talkMaxDuration)

			if var_382_0 <= arg_379_1.time_ and arg_379_1.time_ < var_382_0 + var_382_7 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_0) / var_382_7

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_0 + var_382_7 and arg_379_1.time_ < var_382_0 + var_382_7 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play410012095 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 410012095
		arg_383_1.duration_ = 1.333

		local var_383_0 = {
			zh = 0.999999999999,
			ja = 1.333
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
				arg_383_0:Play410012096(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = 0
			local var_386_1 = 0.05

			if var_386_0 < arg_383_1.time_ and arg_383_1.time_ <= var_386_0 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, true)

				local var_386_2 = arg_383_1:FormatText(StoryNameCfg[584].name)

				arg_383_1.leftNameTxt_.text = var_386_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_383_1.leftNameTxt_.transform)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1.leftNameTxt_.text)
				SetActive(arg_383_1.iconTrs_.gameObject, true)
				arg_383_1.iconController_:SetSelectedState("hero")

				arg_383_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "1060_split_1_1")

				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_3 = arg_383_1:GetWordFromCfg(410012095)
				local var_386_4 = arg_383_1:FormatText(var_386_3.content)

				arg_383_1.text_.text = var_386_4

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_5 = 2
				local var_386_6 = utf8.len(var_386_4)
				local var_386_7 = var_386_5 <= 0 and var_386_1 or var_386_1 * (var_386_6 / var_386_5)

				if var_386_7 > 0 and var_386_1 < var_386_7 then
					arg_383_1.talkMaxDuration = var_386_7

					if var_386_7 + var_386_0 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_7 + var_386_0
					end
				end

				arg_383_1.text_.text = var_386_4
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012095", "story_v_out_410012.awb") ~= 0 then
					local var_386_8 = manager.audio:GetVoiceLength("story_v_out_410012", "410012095", "story_v_out_410012.awb") / 1000

					if var_386_8 + var_386_0 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_8 + var_386_0
					end

					if var_386_3.prefab_name ~= "" and arg_383_1.actors_[var_386_3.prefab_name] ~= nil then
						local var_386_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_383_1.actors_[var_386_3.prefab_name].transform, "story_v_out_410012", "410012095", "story_v_out_410012.awb")

						arg_383_1:RecordAudio("410012095", var_386_9)
						arg_383_1:RecordAudio("410012095", var_386_9)
					else
						arg_383_1:AudioAction("play", "voice", "story_v_out_410012", "410012095", "story_v_out_410012.awb")
					end

					arg_383_1:RecordHistoryTalkVoice("story_v_out_410012", "410012095", "story_v_out_410012.awb")
				end

				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_10 = math.max(var_386_1, arg_383_1.talkMaxDuration)

			if var_386_0 <= arg_383_1.time_ and arg_383_1.time_ < var_386_0 + var_386_10 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_0) / var_386_10

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_0 + var_386_10 and arg_383_1.time_ < var_386_0 + var_386_10 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play410012096 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 410012096
		arg_387_1.duration_ = 5

		SetActive(arg_387_1.tipsGo_, false)

		function arg_387_1.onSingleLineFinish_()
			arg_387_1.onSingleLineUpdate_ = nil
			arg_387_1.onSingleLineFinish_ = nil
			arg_387_1.state_ = "waiting"
		end

		function arg_387_1.playNext_(arg_389_0)
			if arg_389_0 == 1 then
				arg_387_0:Play410012097(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = "1056"

			if arg_387_1.actors_[var_390_0] == nil then
				local var_390_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_390_0), arg_387_1.canvasGo_.transform)

				var_390_1.transform:SetSiblingIndex(1)

				var_390_1.name = var_390_0
				var_390_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_387_1.actors_[var_390_0] = var_390_1
			end

			local var_390_2 = arg_387_1.actors_["1056"].transform
			local var_390_3 = 0

			if var_390_3 < arg_387_1.time_ and arg_387_1.time_ <= var_390_3 + arg_390_0 then
				arg_387_1.var_.moveOldPos1056 = var_390_2.localPosition
				var_390_2.localScale = Vector3.New(1, 1, 1)

				arg_387_1:CheckSpriteTmpPos("1056", 3)

				local var_390_4 = var_390_2.childCount

				for iter_390_0 = 0, var_390_4 - 1 do
					local var_390_5 = var_390_2:GetChild(iter_390_0)

					if var_390_5.name == "split_2" or not string.find(var_390_5.name, "split") then
						var_390_5.gameObject:SetActive(true)
					else
						var_390_5.gameObject:SetActive(false)
					end
				end
			end

			local var_390_6 = 0.001

			if var_390_3 <= arg_387_1.time_ and arg_387_1.time_ < var_390_3 + var_390_6 then
				local var_390_7 = (arg_387_1.time_ - var_390_3) / var_390_6
				local var_390_8 = Vector3.New(0, -350, -180)

				var_390_2.localPosition = Vector3.Lerp(arg_387_1.var_.moveOldPos1056, var_390_8, var_390_7)
			end

			if arg_387_1.time_ >= var_390_3 + var_390_6 and arg_387_1.time_ < var_390_3 + var_390_6 + arg_390_0 then
				var_390_2.localPosition = Vector3.New(0, -350, -180)
			end

			local var_390_9 = arg_387_1.actors_["1056"]
			local var_390_10 = 0

			if var_390_10 < arg_387_1.time_ and arg_387_1.time_ <= var_390_10 + arg_390_0 and arg_387_1.var_.actorSpriteComps1056 == nil then
				arg_387_1.var_.actorSpriteComps1056 = var_390_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_390_11 = 0.034

			if var_390_10 <= arg_387_1.time_ and arg_387_1.time_ < var_390_10 + var_390_11 then
				local var_390_12 = (arg_387_1.time_ - var_390_10) / var_390_11

				if arg_387_1.var_.actorSpriteComps1056 then
					for iter_390_1, iter_390_2 in pairs(arg_387_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_390_2 then
							local var_390_13 = Mathf.Lerp(iter_390_2.color.r, 0.5, var_390_12)

							iter_390_2.color = Color.New(var_390_13, var_390_13, var_390_13)
						end
					end
				end
			end

			if arg_387_1.time_ >= var_390_10 + var_390_11 and arg_387_1.time_ < var_390_10 + var_390_11 + arg_390_0 and arg_387_1.var_.actorSpriteComps1056 then
				local var_390_14 = 0.5

				for iter_390_3, iter_390_4 in pairs(arg_387_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_390_4 then
						iter_390_4.color = Color.New(var_390_14, var_390_14, var_390_14)
					end
				end

				arg_387_1.var_.actorSpriteComps1056 = nil
			end

			local var_390_15 = 0
			local var_390_16 = 1.75

			if var_390_15 < arg_387_1.time_ and arg_387_1.time_ <= var_390_15 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, false)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_17 = arg_387_1:GetWordFromCfg(410012096)
				local var_390_18 = arg_387_1:FormatText(var_390_17.content)

				arg_387_1.text_.text = var_390_18

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_19 = 70
				local var_390_20 = utf8.len(var_390_18)
				local var_390_21 = var_390_19 <= 0 and var_390_16 or var_390_16 * (var_390_20 / var_390_19)

				if var_390_21 > 0 and var_390_16 < var_390_21 then
					arg_387_1.talkMaxDuration = var_390_21

					if var_390_21 + var_390_15 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_21 + var_390_15
					end
				end

				arg_387_1.text_.text = var_390_18
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)
				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_22 = math.max(var_390_16, arg_387_1.talkMaxDuration)

			if var_390_15 <= arg_387_1.time_ and arg_387_1.time_ < var_390_15 + var_390_22 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_15) / var_390_22

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_15 + var_390_22 and arg_387_1.time_ < var_390_15 + var_390_22 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play410012097 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 410012097
		arg_391_1.duration_ = 5

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play410012098(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = arg_391_1.actors_["1056"].transform
			local var_394_1 = 0

			if var_394_1 < arg_391_1.time_ and arg_391_1.time_ <= var_394_1 + arg_394_0 then
				arg_391_1.var_.moveOldPos1056 = var_394_0.localPosition
				var_394_0.localScale = Vector3.New(1, 1, 1)

				arg_391_1:CheckSpriteTmpPos("1056", 3)

				local var_394_2 = var_394_0.childCount

				for iter_394_0 = 0, var_394_2 - 1 do
					local var_394_3 = var_394_0:GetChild(iter_394_0)

					if var_394_3.name == "" or not string.find(var_394_3.name, "split") then
						var_394_3.gameObject:SetActive(true)
					else
						var_394_3.gameObject:SetActive(false)
					end
				end
			end

			local var_394_4 = 0.001

			if var_394_1 <= arg_391_1.time_ and arg_391_1.time_ < var_394_1 + var_394_4 then
				local var_394_5 = (arg_391_1.time_ - var_394_1) / var_394_4
				local var_394_6 = Vector3.New(0, -350, -180)

				var_394_0.localPosition = Vector3.Lerp(arg_391_1.var_.moveOldPos1056, var_394_6, var_394_5)
			end

			if arg_391_1.time_ >= var_394_1 + var_394_4 and arg_391_1.time_ < var_394_1 + var_394_4 + arg_394_0 then
				var_394_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_394_7 = arg_391_1.actors_["1056"]
			local var_394_8 = 0

			if var_394_8 < arg_391_1.time_ and arg_391_1.time_ <= var_394_8 + arg_394_0 and arg_391_1.var_.actorSpriteComps1056 == nil then
				arg_391_1.var_.actorSpriteComps1056 = var_394_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_394_9 = 0.034

			if var_394_8 <= arg_391_1.time_ and arg_391_1.time_ < var_394_8 + var_394_9 then
				local var_394_10 = (arg_391_1.time_ - var_394_8) / var_394_9

				if arg_391_1.var_.actorSpriteComps1056 then
					for iter_394_1, iter_394_2 in pairs(arg_391_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_394_2 then
							local var_394_11 = Mathf.Lerp(iter_394_2.color.r, 0.5, var_394_10)

							iter_394_2.color = Color.New(var_394_11, var_394_11, var_394_11)
						end
					end
				end
			end

			if arg_391_1.time_ >= var_394_8 + var_394_9 and arg_391_1.time_ < var_394_8 + var_394_9 + arg_394_0 and arg_391_1.var_.actorSpriteComps1056 then
				local var_394_12 = 0.5

				for iter_394_3, iter_394_4 in pairs(arg_391_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_394_4 then
						iter_394_4.color = Color.New(var_394_12, var_394_12, var_394_12)
					end
				end

				arg_391_1.var_.actorSpriteComps1056 = nil
			end

			local var_394_13 = 0
			local var_394_14 = 1.6

			if var_394_13 < arg_391_1.time_ and arg_391_1.time_ <= var_394_13 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, false)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_15 = arg_391_1:GetWordFromCfg(410012097)
				local var_394_16 = arg_391_1:FormatText(var_394_15.content)

				arg_391_1.text_.text = var_394_16

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_17 = 64
				local var_394_18 = utf8.len(var_394_16)
				local var_394_19 = var_394_17 <= 0 and var_394_14 or var_394_14 * (var_394_18 / var_394_17)

				if var_394_19 > 0 and var_394_14 < var_394_19 then
					arg_391_1.talkMaxDuration = var_394_19

					if var_394_19 + var_394_13 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_19 + var_394_13
					end
				end

				arg_391_1.text_.text = var_394_16
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)
				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_20 = math.max(var_394_14, arg_391_1.talkMaxDuration)

			if var_394_13 <= arg_391_1.time_ and arg_391_1.time_ < var_394_13 + var_394_20 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_13) / var_394_20

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_13 + var_394_20 and arg_391_1.time_ < var_394_13 + var_394_20 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play410012098 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 410012098
		arg_395_1.duration_ = 6.466

		local var_395_0 = {
			zh = 4.766,
			ja = 6.466
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
			arg_395_1.auto_ = false
		end

		function arg_395_1.playNext_(arg_397_0)
			arg_395_1.onStoryFinished_()
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = arg_395_1.actors_["1056"].transform
			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 then
				arg_395_1.var_.moveOldPos1056 = var_398_0.localPosition
				var_398_0.localScale = Vector3.New(1, 1, 1)

				arg_395_1:CheckSpriteTmpPos("1056", 3)

				local var_398_2 = var_398_0.childCount

				for iter_398_0 = 0, var_398_2 - 1 do
					local var_398_3 = var_398_0:GetChild(iter_398_0)

					if var_398_3.name == "split_4" or not string.find(var_398_3.name, "split") then
						var_398_3.gameObject:SetActive(true)
					else
						var_398_3.gameObject:SetActive(false)
					end
				end
			end

			local var_398_4 = 0.001

			if var_398_1 <= arg_395_1.time_ and arg_395_1.time_ < var_398_1 + var_398_4 then
				local var_398_5 = (arg_395_1.time_ - var_398_1) / var_398_4
				local var_398_6 = Vector3.New(0, -350, -180)

				var_398_0.localPosition = Vector3.Lerp(arg_395_1.var_.moveOldPos1056, var_398_6, var_398_5)
			end

			if arg_395_1.time_ >= var_398_1 + var_398_4 and arg_395_1.time_ < var_398_1 + var_398_4 + arg_398_0 then
				var_398_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_398_7 = arg_395_1.actors_["1056"]
			local var_398_8 = 0

			if var_398_8 < arg_395_1.time_ and arg_395_1.time_ <= var_398_8 + arg_398_0 and arg_395_1.var_.actorSpriteComps1056 == nil then
				arg_395_1.var_.actorSpriteComps1056 = var_398_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_398_9 = 0.034

			if var_398_8 <= arg_395_1.time_ and arg_395_1.time_ < var_398_8 + var_398_9 then
				local var_398_10 = (arg_395_1.time_ - var_398_8) / var_398_9

				if arg_395_1.var_.actorSpriteComps1056 then
					for iter_398_1, iter_398_2 in pairs(arg_395_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_398_2 then
							local var_398_11 = Mathf.Lerp(iter_398_2.color.r, 1, var_398_10)

							iter_398_2.color = Color.New(var_398_11, var_398_11, var_398_11)
						end
					end
				end
			end

			if arg_395_1.time_ >= var_398_8 + var_398_9 and arg_395_1.time_ < var_398_8 + var_398_9 + arg_398_0 and arg_395_1.var_.actorSpriteComps1056 then
				local var_398_12 = 1

				for iter_398_3, iter_398_4 in pairs(arg_395_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_398_4 then
						iter_398_4.color = Color.New(var_398_12, var_398_12, var_398_12)
					end
				end

				arg_395_1.var_.actorSpriteComps1056 = nil
			end

			local var_398_13 = 0
			local var_398_14 = 0.45

			if var_398_13 < arg_395_1.time_ and arg_395_1.time_ <= var_398_13 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, true)

				local var_398_15 = arg_395_1:FormatText(StoryNameCfg[605].name)

				arg_395_1.leftNameTxt_.text = var_398_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_395_1.leftNameTxt_.transform)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1.leftNameTxt_.text)
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_16 = arg_395_1:GetWordFromCfg(410012098)
				local var_398_17 = arg_395_1:FormatText(var_398_16.content)

				arg_395_1.text_.text = var_398_17

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_18 = 18
				local var_398_19 = utf8.len(var_398_17)
				local var_398_20 = var_398_18 <= 0 and var_398_14 or var_398_14 * (var_398_19 / var_398_18)

				if var_398_20 > 0 and var_398_14 < var_398_20 then
					arg_395_1.talkMaxDuration = var_398_20

					if var_398_20 + var_398_13 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_20 + var_398_13
					end
				end

				arg_395_1.text_.text = var_398_17
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410012", "410012098", "story_v_out_410012.awb") ~= 0 then
					local var_398_21 = manager.audio:GetVoiceLength("story_v_out_410012", "410012098", "story_v_out_410012.awb") / 1000

					if var_398_21 + var_398_13 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_21 + var_398_13
					end

					if var_398_16.prefab_name ~= "" and arg_395_1.actors_[var_398_16.prefab_name] ~= nil then
						local var_398_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_395_1.actors_[var_398_16.prefab_name].transform, "story_v_out_410012", "410012098", "story_v_out_410012.awb")

						arg_395_1:RecordAudio("410012098", var_398_22)
						arg_395_1:RecordAudio("410012098", var_398_22)
					else
						arg_395_1:AudioAction("play", "voice", "story_v_out_410012", "410012098", "story_v_out_410012.awb")
					end

					arg_395_1:RecordHistoryTalkVoice("story_v_out_410012", "410012098", "story_v_out_410012.awb")
				end

				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_23 = math.max(var_398_14, arg_395_1.talkMaxDuration)

			if var_398_13 <= arg_395_1.time_ and arg_395_1.time_ < var_398_13 + var_398_23 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_13) / var_398_23

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_13 + var_398_23 and arg_395_1.time_ < var_398_13 + var_398_23 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/L02f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST65"
	},
	voices = {
		"story_v_out_410012.awb"
	}
}
