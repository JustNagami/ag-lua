return {
	Play410032001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 410032001
		arg_1_1.duration_ = 6.699999999999

		local var_1_0 = {
			zh = 6.599999999999,
			ja = 6.699999999999
		}
		local var_1_1 = manager.audio:GetLocalizationFlag()

		if var_1_0[var_1_1] ~= nil then
			arg_1_1.duration_ = var_1_0[var_1_1]
		end

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play410032002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "L01g"

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
				local var_4_5 = arg_1_1.bgs_.L01g

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
					if iter_4_0 ~= "L01g" then
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

			local var_4_26 = 1.6
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_8_story_jivitabad_slum", "bgm_activity_2_8_story_jivitabad_slum", "bgm_activity_2_8_story_jivitabad_slum.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 1.999999999999
			local var_4_31 = 0.375

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

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_33 = arg_1_1:FormatText(StoryNameCfg[594].name)

				arg_1_1.leftNameTxt_.text = var_4_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_fathera")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_34 = arg_1_1:GetWordFromCfg(410032001)
				local var_4_35 = arg_1_1:FormatText(var_4_34.content)

				arg_1_1.text_.text = var_4_35

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_36 = 15
				local var_4_37 = utf8.len(var_4_35)
				local var_4_38 = var_4_36 <= 0 and var_4_31 or var_4_31 * (var_4_37 / var_4_36)

				if var_4_38 > 0 and var_4_31 < var_4_38 then
					arg_1_1.talkMaxDuration = var_4_38
					var_4_30 = var_4_30 + 0.3

					if var_4_38 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_38 + var_4_30
					end
				end

				arg_1_1.text_.text = var_4_35
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032001", "story_v_out_410032.awb") ~= 0 then
					local var_4_39 = manager.audio:GetVoiceLength("story_v_out_410032", "410032001", "story_v_out_410032.awb") / 1000

					if var_4_39 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_39 + var_4_30
					end

					if var_4_34.prefab_name ~= "" and arg_1_1.actors_[var_4_34.prefab_name] ~= nil then
						local var_4_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_34.prefab_name].transform, "story_v_out_410032", "410032001", "story_v_out_410032.awb")

						arg_1_1:RecordAudio("410032001", var_4_40)
						arg_1_1:RecordAudio("410032001", var_4_40)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_410032", "410032001", "story_v_out_410032.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_410032", "410032001", "story_v_out_410032.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_41 = var_4_30 + 0.3
			local var_4_42 = math.max(var_4_31, arg_1_1.talkMaxDuration)

			if var_4_41 <= arg_1_1.time_ and arg_1_1.time_ < var_4_41 + var_4_42 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_41) / var_4_42

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_41 + var_4_42 and arg_1_1.time_ < var_4_41 + var_4_42 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play410032002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 410032002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play410032003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1060"

			if arg_7_1.actors_[var_10_0] == nil then
				local var_10_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_10_0), arg_7_1.canvasGo_.transform)

				var_10_1.transform:SetSiblingIndex(1)

				var_10_1.name = var_10_0
				var_10_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_7_1.actors_[var_10_0] = var_10_1
			end

			local var_10_2 = arg_7_1.actors_["1060"].transform
			local var_10_3 = 0

			if var_10_3 < arg_7_1.time_ and arg_7_1.time_ <= var_10_3 + arg_10_0 then
				arg_7_1.var_.moveOldPos1060 = var_10_2.localPosition
				var_10_2.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("1060", 3)

				local var_10_4 = var_10_2.childCount

				for iter_10_0 = 0, var_10_4 - 1 do
					local var_10_5 = var_10_2:GetChild(iter_10_0)

					if var_10_5.name == "" or not string.find(var_10_5.name, "split") then
						var_10_5.gameObject:SetActive(true)
					else
						var_10_5.gameObject:SetActive(false)
					end
				end
			end

			local var_10_6 = 0.001

			if var_10_3 <= arg_7_1.time_ and arg_7_1.time_ < var_10_3 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_3) / var_10_6
				local var_10_8 = Vector3.New(0, -435, -40)

				var_10_2.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1060, var_10_8, var_10_7)
			end

			if arg_7_1.time_ >= var_10_3 + var_10_6 and arg_7_1.time_ < var_10_3 + var_10_6 + arg_10_0 then
				var_10_2.localPosition = Vector3.New(0, -435, -40)
			end

			local var_10_9 = arg_7_1.actors_["1060"]
			local var_10_10 = 0

			if var_10_10 < arg_7_1.time_ and arg_7_1.time_ <= var_10_10 + arg_10_0 and arg_7_1.var_.actorSpriteComps1060 == nil then
				arg_7_1.var_.actorSpriteComps1060 = var_10_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_11 = 0.034

			if var_10_10 <= arg_7_1.time_ and arg_7_1.time_ < var_10_10 + var_10_11 then
				local var_10_12 = (arg_7_1.time_ - var_10_10) / var_10_11

				if arg_7_1.var_.actorSpriteComps1060 then
					for iter_10_1, iter_10_2 in pairs(arg_7_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_10_2 then
							local var_10_13 = Mathf.Lerp(iter_10_2.color.r, 0.5, var_10_12)

							iter_10_2.color = Color.New(var_10_13, var_10_13, var_10_13)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_10 + var_10_11 and arg_7_1.time_ < var_10_10 + var_10_11 + arg_10_0 and arg_7_1.var_.actorSpriteComps1060 then
				local var_10_14 = 0.5

				for iter_10_3, iter_10_4 in pairs(arg_7_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_10_4 then
						iter_10_4.color = Color.New(var_10_14, var_10_14, var_10_14)
					end
				end

				arg_7_1.var_.actorSpriteComps1060 = nil
			end

			local var_10_15 = 0
			local var_10_16 = 1.45

			if var_10_15 < arg_7_1.time_ and arg_7_1.time_ <= var_10_15 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_17 = arg_7_1:GetWordFromCfg(410032002)
				local var_10_18 = arg_7_1:FormatText(var_10_17.content)

				arg_7_1.text_.text = var_10_18

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_19 = 58
				local var_10_20 = utf8.len(var_10_18)
				local var_10_21 = var_10_19 <= 0 and var_10_16 or var_10_16 * (var_10_20 / var_10_19)

				if var_10_21 > 0 and var_10_16 < var_10_21 then
					arg_7_1.talkMaxDuration = var_10_21

					if var_10_21 + var_10_15 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_21 + var_10_15
					end
				end

				arg_7_1.text_.text = var_10_18
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_22 = math.max(var_10_16, arg_7_1.talkMaxDuration)

			if var_10_15 <= arg_7_1.time_ and arg_7_1.time_ < var_10_15 + var_10_22 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_15) / var_10_22

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_15 + var_10_22 and arg_7_1.time_ < var_10_15 + var_10_22 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play410032003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 410032003
		arg_11_1.duration_ = 12.633

		local var_11_0 = {
			zh = 10.9,
			ja = 12.633
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
				arg_11_0:Play410032004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1.175

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[594].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_fathera")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(410032003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 45
				local var_14_6 = utf8.len(var_14_4)
				local var_14_7 = var_14_5 <= 0 and var_14_1 or var_14_1 * (var_14_6 / var_14_5)

				if var_14_7 > 0 and var_14_1 < var_14_7 then
					arg_11_1.talkMaxDuration = var_14_7

					if var_14_7 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_7 + var_14_0
					end
				end

				arg_11_1.text_.text = var_14_4
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032003", "story_v_out_410032.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_410032", "410032003", "story_v_out_410032.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_410032", "410032003", "story_v_out_410032.awb")

						arg_11_1:RecordAudio("410032003", var_14_9)
						arg_11_1:RecordAudio("410032003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_410032", "410032003", "story_v_out_410032.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_410032", "410032003", "story_v_out_410032.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_10 = math.max(var_14_1, arg_11_1.talkMaxDuration)

			if var_14_0 <= arg_11_1.time_ and arg_11_1.time_ < var_14_0 + var_14_10 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_0) / var_14_10

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_0 + var_14_10 and arg_11_1.time_ < var_14_0 + var_14_10 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play410032004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 410032004
		arg_15_1.duration_ = 8.966

		local var_15_0 = {
			zh = 8,
			ja = 8.966
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
				arg_15_0:Play410032005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[593].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_fatherb")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(410032004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032004", "story_v_out_410032.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_410032", "410032004", "story_v_out_410032.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_410032", "410032004", "story_v_out_410032.awb")

						arg_15_1:RecordAudio("410032004", var_18_9)
						arg_15_1:RecordAudio("410032004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_410032", "410032004", "story_v_out_410032.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_410032", "410032004", "story_v_out_410032.awb")
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
	Play410032005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 410032005
		arg_19_1.duration_ = 4

		local var_19_0 = {
			zh = 3.9,
			ja = 4
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
				arg_19_0:Play410032006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.4

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[593].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_fatherb")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(410032005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032005", "story_v_out_410032.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_410032", "410032005", "story_v_out_410032.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_410032", "410032005", "story_v_out_410032.awb")

						arg_19_1:RecordAudio("410032005", var_22_9)
						arg_19_1:RecordAudio("410032005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_410032", "410032005", "story_v_out_410032.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_410032", "410032005", "story_v_out_410032.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_10 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_10 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_0) / var_22_10

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_10 and arg_19_1.time_ < var_22_0 + var_22_10 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play410032006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 410032006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play410032007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 1.3

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_2 = arg_23_1:GetWordFromCfg(410032006)
				local var_26_3 = arg_23_1:FormatText(var_26_2.content)

				arg_23_1.text_.text = var_26_3

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_4 = 52
				local var_26_5 = utf8.len(var_26_3)
				local var_26_6 = var_26_4 <= 0 and var_26_1 or var_26_1 * (var_26_5 / var_26_4)

				if var_26_6 > 0 and var_26_1 < var_26_6 then
					arg_23_1.talkMaxDuration = var_26_6

					if var_26_6 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_6 + var_26_0
					end
				end

				arg_23_1.text_.text = var_26_3
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_7 = math.max(var_26_1, arg_23_1.talkMaxDuration)

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_7 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_0) / var_26_7

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_0 + var_26_7 and arg_23_1.time_ < var_26_0 + var_26_7 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play410032007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 410032007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play410032008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 1.3

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

				local var_30_2 = arg_27_1:GetWordFromCfg(410032007)
				local var_30_3 = arg_27_1:FormatText(var_30_2.content)

				arg_27_1.text_.text = var_30_3

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_4 = 52
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
	Play410032008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 410032008
		arg_31_1.duration_ = 5

		local var_31_0 = {
			zh = 4.766,
			ja = 5
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
				arg_31_0:Play410032009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1060"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1060 = var_34_0.localPosition
				var_34_0.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("1060", 2)

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
				local var_34_6 = Vector3.New(-390, -435, -40)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1060, var_34_6, var_34_5)
			end

			if arg_31_1.time_ >= var_34_1 + var_34_4 and arg_31_1.time_ < var_34_1 + var_34_4 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_34_7 = "1056"

			if arg_31_1.actors_[var_34_7] == nil then
				local var_34_8 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_34_7), arg_31_1.canvasGo_.transform)

				var_34_8.transform:SetSiblingIndex(1)

				var_34_8.name = var_34_7
				var_34_8.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_31_1.actors_[var_34_7] = var_34_8
			end

			local var_34_9 = arg_31_1.actors_["1056"].transform
			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1.var_.moveOldPos1056 = var_34_9.localPosition
				var_34_9.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("1056", 4)

				local var_34_11 = var_34_9.childCount

				for iter_34_1 = 0, var_34_11 - 1 do
					local var_34_12 = var_34_9:GetChild(iter_34_1)

					if var_34_12.name == "" or not string.find(var_34_12.name, "split") then
						var_34_12.gameObject:SetActive(true)
					else
						var_34_12.gameObject:SetActive(false)
					end
				end
			end

			local var_34_13 = 0.001

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_13 then
				local var_34_14 = (arg_31_1.time_ - var_34_10) / var_34_13
				local var_34_15 = Vector3.New(390, -350, -180)

				var_34_9.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1056, var_34_15, var_34_14)
			end

			if arg_31_1.time_ >= var_34_10 + var_34_13 and arg_31_1.time_ < var_34_10 + var_34_13 + arg_34_0 then
				var_34_9.localPosition = Vector3.New(390, -350, -180)
			end

			local var_34_16 = arg_31_1.actors_["1060"]
			local var_34_17 = 0

			if var_34_17 < arg_31_1.time_ and arg_31_1.time_ <= var_34_17 + arg_34_0 and arg_31_1.var_.actorSpriteComps1060 == nil then
				arg_31_1.var_.actorSpriteComps1060 = var_34_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_18 = 0.034

			if var_34_17 <= arg_31_1.time_ and arg_31_1.time_ < var_34_17 + var_34_18 then
				local var_34_19 = (arg_31_1.time_ - var_34_17) / var_34_18

				if arg_31_1.var_.actorSpriteComps1060 then
					for iter_34_2, iter_34_3 in pairs(arg_31_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_34_3 then
							local var_34_20 = Mathf.Lerp(iter_34_3.color.r, 1, var_34_19)

							iter_34_3.color = Color.New(var_34_20, var_34_20, var_34_20)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_17 + var_34_18 and arg_31_1.time_ < var_34_17 + var_34_18 + arg_34_0 and arg_31_1.var_.actorSpriteComps1060 then
				local var_34_21 = 1

				for iter_34_4, iter_34_5 in pairs(arg_31_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_34_5 then
						iter_34_5.color = Color.New(var_34_21, var_34_21, var_34_21)
					end
				end

				arg_31_1.var_.actorSpriteComps1060 = nil
			end

			local var_34_22 = arg_31_1.actors_["1056"]
			local var_34_23 = 0

			if var_34_23 < arg_31_1.time_ and arg_31_1.time_ <= var_34_23 + arg_34_0 and arg_31_1.var_.actorSpriteComps1056 == nil then
				arg_31_1.var_.actorSpriteComps1056 = var_34_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_24 = 0.034

			if var_34_23 <= arg_31_1.time_ and arg_31_1.time_ < var_34_23 + var_34_24 then
				local var_34_25 = (arg_31_1.time_ - var_34_23) / var_34_24

				if arg_31_1.var_.actorSpriteComps1056 then
					for iter_34_6, iter_34_7 in pairs(arg_31_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_34_7 then
							local var_34_26 = Mathf.Lerp(iter_34_7.color.r, 0.5, var_34_25)

							iter_34_7.color = Color.New(var_34_26, var_34_26, var_34_26)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_23 + var_34_24 and arg_31_1.time_ < var_34_23 + var_34_24 + arg_34_0 and arg_31_1.var_.actorSpriteComps1056 then
				local var_34_27 = 0.5

				for iter_34_8, iter_34_9 in pairs(arg_31_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_34_9 then
						iter_34_9.color = Color.New(var_34_27, var_34_27, var_34_27)
					end
				end

				arg_31_1.var_.actorSpriteComps1056 = nil
			end

			local var_34_28 = 0
			local var_34_29 = 0.6

			if var_34_28 < arg_31_1.time_ and arg_31_1.time_ <= var_34_28 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_30 = arg_31_1:FormatText(StoryNameCfg[584].name)

				arg_31_1.leftNameTxt_.text = var_34_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_31 = arg_31_1:GetWordFromCfg(410032008)
				local var_34_32 = arg_31_1:FormatText(var_34_31.content)

				arg_31_1.text_.text = var_34_32

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_33 = 24
				local var_34_34 = utf8.len(var_34_32)
				local var_34_35 = var_34_33 <= 0 and var_34_29 or var_34_29 * (var_34_34 / var_34_33)

				if var_34_35 > 0 and var_34_29 < var_34_35 then
					arg_31_1.talkMaxDuration = var_34_35

					if var_34_35 + var_34_28 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_35 + var_34_28
					end
				end

				arg_31_1.text_.text = var_34_32
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032008", "story_v_out_410032.awb") ~= 0 then
					local var_34_36 = manager.audio:GetVoiceLength("story_v_out_410032", "410032008", "story_v_out_410032.awb") / 1000

					if var_34_36 + var_34_28 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_36 + var_34_28
					end

					if var_34_31.prefab_name ~= "" and arg_31_1.actors_[var_34_31.prefab_name] ~= nil then
						local var_34_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_31.prefab_name].transform, "story_v_out_410032", "410032008", "story_v_out_410032.awb")

						arg_31_1:RecordAudio("410032008", var_34_37)
						arg_31_1:RecordAudio("410032008", var_34_37)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_410032", "410032008", "story_v_out_410032.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_410032", "410032008", "story_v_out_410032.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_38 = math.max(var_34_29, arg_31_1.talkMaxDuration)

			if var_34_28 <= arg_31_1.time_ and arg_31_1.time_ < var_34_28 + var_34_38 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_28) / var_34_38

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_28 + var_34_38 and arg_31_1.time_ < var_34_28 + var_34_38 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play410032009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 410032009
		arg_35_1.duration_ = 6.1

		local var_35_0 = {
			zh = 5.833,
			ja = 6.1
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
				arg_35_0:Play410032010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1056"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1056 = var_38_0.localPosition
				var_38_0.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("1056", 4)

				local var_38_2 = var_38_0.childCount

				for iter_38_0 = 0, var_38_2 - 1 do
					local var_38_3 = var_38_0:GetChild(iter_38_0)

					if var_38_3.name == "split_1" or not string.find(var_38_3.name, "split") then
						var_38_3.gameObject:SetActive(true)
					else
						var_38_3.gameObject:SetActive(false)
					end
				end
			end

			local var_38_4 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_4 then
				local var_38_5 = (arg_35_1.time_ - var_38_1) / var_38_4
				local var_38_6 = Vector3.New(390, -350, -180)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1056, var_38_6, var_38_5)
			end

			if arg_35_1.time_ >= var_38_1 + var_38_4 and arg_35_1.time_ < var_38_1 + var_38_4 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_38_7 = arg_35_1.actors_["1056"]
			local var_38_8 = 0

			if var_38_8 < arg_35_1.time_ and arg_35_1.time_ <= var_38_8 + arg_38_0 and arg_35_1.var_.actorSpriteComps1056 == nil then
				arg_35_1.var_.actorSpriteComps1056 = var_38_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_9 = 0.034

			if var_38_8 <= arg_35_1.time_ and arg_35_1.time_ < var_38_8 + var_38_9 then
				local var_38_10 = (arg_35_1.time_ - var_38_8) / var_38_9

				if arg_35_1.var_.actorSpriteComps1056 then
					for iter_38_1, iter_38_2 in pairs(arg_35_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_38_2 then
							local var_38_11 = Mathf.Lerp(iter_38_2.color.r, 1, var_38_10)

							iter_38_2.color = Color.New(var_38_11, var_38_11, var_38_11)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_8 + var_38_9 and arg_35_1.time_ < var_38_8 + var_38_9 + arg_38_0 and arg_35_1.var_.actorSpriteComps1056 then
				local var_38_12 = 1

				for iter_38_3, iter_38_4 in pairs(arg_35_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_38_4 then
						iter_38_4.color = Color.New(var_38_12, var_38_12, var_38_12)
					end
				end

				arg_35_1.var_.actorSpriteComps1056 = nil
			end

			local var_38_13 = arg_35_1.actors_["1060"]
			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 and arg_35_1.var_.actorSpriteComps1060 == nil then
				arg_35_1.var_.actorSpriteComps1060 = var_38_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_15 = 0.034

			if var_38_14 <= arg_35_1.time_ and arg_35_1.time_ < var_38_14 + var_38_15 then
				local var_38_16 = (arg_35_1.time_ - var_38_14) / var_38_15

				if arg_35_1.var_.actorSpriteComps1060 then
					for iter_38_5, iter_38_6 in pairs(arg_35_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_38_6 then
							local var_38_17 = Mathf.Lerp(iter_38_6.color.r, 0.5, var_38_16)

							iter_38_6.color = Color.New(var_38_17, var_38_17, var_38_17)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_14 + var_38_15 and arg_35_1.time_ < var_38_14 + var_38_15 + arg_38_0 and arg_35_1.var_.actorSpriteComps1060 then
				local var_38_18 = 0.5

				for iter_38_7, iter_38_8 in pairs(arg_35_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_38_8 then
						iter_38_8.color = Color.New(var_38_18, var_38_18, var_38_18)
					end
				end

				arg_35_1.var_.actorSpriteComps1060 = nil
			end

			local var_38_19 = arg_35_1.actors_["1056"]
			local var_38_20 = 0

			if var_38_20 < arg_35_1.time_ and arg_35_1.time_ <= var_38_20 + arg_38_0 and arg_35_1.var_.actorSpriteComps1056 == nil then
				arg_35_1.var_.actorSpriteComps1056 = var_38_19:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_21 = 0.034

			if var_38_20 <= arg_35_1.time_ and arg_35_1.time_ < var_38_20 + var_38_21 then
				local var_38_22 = (arg_35_1.time_ - var_38_20) / var_38_21

				if arg_35_1.var_.actorSpriteComps1056 then
					for iter_38_9, iter_38_10 in pairs(arg_35_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_38_10 then
							local var_38_23 = Mathf.Lerp(iter_38_10.color.r, 1, var_38_22)

							iter_38_10.color = Color.New(var_38_23, var_38_23, var_38_23)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_20 + var_38_21 and arg_35_1.time_ < var_38_20 + var_38_21 + arg_38_0 and arg_35_1.var_.actorSpriteComps1056 then
				local var_38_24 = 1

				for iter_38_11, iter_38_12 in pairs(arg_35_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_38_12 then
						iter_38_12.color = Color.New(var_38_24, var_38_24, var_38_24)
					end
				end

				arg_35_1.var_.actorSpriteComps1056 = nil
			end

			local var_38_25 = 0
			local var_38_26 = 0.7

			if var_38_25 < arg_35_1.time_ and arg_35_1.time_ <= var_38_25 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_27 = arg_35_1:FormatText(StoryNameCfg[605].name)

				arg_35_1.leftNameTxt_.text = var_38_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_28 = arg_35_1:GetWordFromCfg(410032009)
				local var_38_29 = arg_35_1:FormatText(var_38_28.content)

				arg_35_1.text_.text = var_38_29

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_30 = 28
				local var_38_31 = utf8.len(var_38_29)
				local var_38_32 = var_38_30 <= 0 and var_38_26 or var_38_26 * (var_38_31 / var_38_30)

				if var_38_32 > 0 and var_38_26 < var_38_32 then
					arg_35_1.talkMaxDuration = var_38_32

					if var_38_32 + var_38_25 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_32 + var_38_25
					end
				end

				arg_35_1.text_.text = var_38_29
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032009", "story_v_out_410032.awb") ~= 0 then
					local var_38_33 = manager.audio:GetVoiceLength("story_v_out_410032", "410032009", "story_v_out_410032.awb") / 1000

					if var_38_33 + var_38_25 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_33 + var_38_25
					end

					if var_38_28.prefab_name ~= "" and arg_35_1.actors_[var_38_28.prefab_name] ~= nil then
						local var_38_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_28.prefab_name].transform, "story_v_out_410032", "410032009", "story_v_out_410032.awb")

						arg_35_1:RecordAudio("410032009", var_38_34)
						arg_35_1:RecordAudio("410032009", var_38_34)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_410032", "410032009", "story_v_out_410032.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_410032", "410032009", "story_v_out_410032.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_35 = math.max(var_38_26, arg_35_1.talkMaxDuration)

			if var_38_25 <= arg_35_1.time_ and arg_35_1.time_ < var_38_25 + var_38_35 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_25) / var_38_35

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_25 + var_38_35 and arg_35_1.time_ < var_38_25 + var_38_35 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play410032010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 410032010
		arg_39_1.duration_ = 6.533

		local var_39_0 = {
			zh = 3.9,
			ja = 6.533
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
				arg_39_0:Play410032011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1056"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1056 = var_42_0.localPosition
				var_42_0.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("1056", 4)

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
				local var_42_6 = Vector3.New(390, -350, -180)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1056, var_42_6, var_42_5)
			end

			if arg_39_1.time_ >= var_42_1 + var_42_4 and arg_39_1.time_ < var_42_1 + var_42_4 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_42_7 = arg_39_1.actors_["1056"]
			local var_42_8 = 0

			if var_42_8 < arg_39_1.time_ and arg_39_1.time_ <= var_42_8 + arg_42_0 and arg_39_1.var_.actorSpriteComps1056 == nil then
				arg_39_1.var_.actorSpriteComps1056 = var_42_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_9 = 0.034

			if var_42_8 <= arg_39_1.time_ and arg_39_1.time_ < var_42_8 + var_42_9 then
				local var_42_10 = (arg_39_1.time_ - var_42_8) / var_42_9

				if arg_39_1.var_.actorSpriteComps1056 then
					for iter_42_1, iter_42_2 in pairs(arg_39_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_42_2 then
							local var_42_11 = Mathf.Lerp(iter_42_2.color.r, 1, var_42_10)

							iter_42_2.color = Color.New(var_42_11, var_42_11, var_42_11)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_8 + var_42_9 and arg_39_1.time_ < var_42_8 + var_42_9 + arg_42_0 and arg_39_1.var_.actorSpriteComps1056 then
				local var_42_12 = 1

				for iter_42_3, iter_42_4 in pairs(arg_39_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_42_4 then
						iter_42_4.color = Color.New(var_42_12, var_42_12, var_42_12)
					end
				end

				arg_39_1.var_.actorSpriteComps1056 = nil
			end

			local var_42_13 = 0
			local var_42_14 = 0.55

			if var_42_13 < arg_39_1.time_ and arg_39_1.time_ <= var_42_13 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_15 = arg_39_1:FormatText(StoryNameCfg[605].name)

				arg_39_1.leftNameTxt_.text = var_42_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_16 = arg_39_1:GetWordFromCfg(410032010)
				local var_42_17 = arg_39_1:FormatText(var_42_16.content)

				arg_39_1.text_.text = var_42_17

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_18 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032010", "story_v_out_410032.awb") ~= 0 then
					local var_42_21 = manager.audio:GetVoiceLength("story_v_out_410032", "410032010", "story_v_out_410032.awb") / 1000

					if var_42_21 + var_42_13 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_21 + var_42_13
					end

					if var_42_16.prefab_name ~= "" and arg_39_1.actors_[var_42_16.prefab_name] ~= nil then
						local var_42_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_16.prefab_name].transform, "story_v_out_410032", "410032010", "story_v_out_410032.awb")

						arg_39_1:RecordAudio("410032010", var_42_22)
						arg_39_1:RecordAudio("410032010", var_42_22)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_410032", "410032010", "story_v_out_410032.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_410032", "410032010", "story_v_out_410032.awb")
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
	Play410032011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 410032011
		arg_43_1.duration_ = 5.466

		local var_43_0 = {
			zh = 4.333,
			ja = 5.466
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
				arg_43_0:Play410032012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1060"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1060 = var_46_0.localPosition
				var_46_0.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("1060", 2)

				local var_46_2 = var_46_0.childCount

				for iter_46_0 = 0, var_46_2 - 1 do
					local var_46_3 = var_46_0:GetChild(iter_46_0)

					if var_46_3.name == "split_3" or not string.find(var_46_3.name, "split") then
						var_46_3.gameObject:SetActive(true)
					else
						var_46_3.gameObject:SetActive(false)
					end
				end
			end

			local var_46_4 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_4 then
				local var_46_5 = (arg_43_1.time_ - var_46_1) / var_46_4
				local var_46_6 = Vector3.New(-390, -435, -40)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1060, var_46_6, var_46_5)
			end

			if arg_43_1.time_ >= var_46_1 + var_46_4 and arg_43_1.time_ < var_46_1 + var_46_4 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(-390, -435, -40)
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
							local var_46_11 = Mathf.Lerp(iter_46_2.color.r, 1, var_46_10)

							iter_46_2.color = Color.New(var_46_11, var_46_11, var_46_11)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_8 + var_46_9 and arg_43_1.time_ < var_46_8 + var_46_9 + arg_46_0 and arg_43_1.var_.actorSpriteComps1060 then
				local var_46_12 = 1

				for iter_46_3, iter_46_4 in pairs(arg_43_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_46_4 then
						iter_46_4.color = Color.New(var_46_12, var_46_12, var_46_12)
					end
				end

				arg_43_1.var_.actorSpriteComps1060 = nil
			end

			local var_46_13 = arg_43_1.actors_["1056"]
			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 and arg_43_1.var_.actorSpriteComps1056 == nil then
				arg_43_1.var_.actorSpriteComps1056 = var_46_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_15 = 0.034

			if var_46_14 <= arg_43_1.time_ and arg_43_1.time_ < var_46_14 + var_46_15 then
				local var_46_16 = (arg_43_1.time_ - var_46_14) / var_46_15

				if arg_43_1.var_.actorSpriteComps1056 then
					for iter_46_5, iter_46_6 in pairs(arg_43_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_46_6 then
							local var_46_17 = Mathf.Lerp(iter_46_6.color.r, 0.5, var_46_16)

							iter_46_6.color = Color.New(var_46_17, var_46_17, var_46_17)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_14 + var_46_15 and arg_43_1.time_ < var_46_14 + var_46_15 + arg_46_0 and arg_43_1.var_.actorSpriteComps1056 then
				local var_46_18 = 0.5

				for iter_46_7, iter_46_8 in pairs(arg_43_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_46_8 then
						iter_46_8.color = Color.New(var_46_18, var_46_18, var_46_18)
					end
				end

				arg_43_1.var_.actorSpriteComps1056 = nil
			end

			local var_46_19 = 0
			local var_46_20 = 0.35

			if var_46_19 < arg_43_1.time_ and arg_43_1.time_ <= var_46_19 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_21 = arg_43_1:FormatText(StoryNameCfg[584].name)

				arg_43_1.leftNameTxt_.text = var_46_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_22 = arg_43_1:GetWordFromCfg(410032011)
				local var_46_23 = arg_43_1:FormatText(var_46_22.content)

				arg_43_1.text_.text = var_46_23

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_24 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032011", "story_v_out_410032.awb") ~= 0 then
					local var_46_27 = manager.audio:GetVoiceLength("story_v_out_410032", "410032011", "story_v_out_410032.awb") / 1000

					if var_46_27 + var_46_19 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_27 + var_46_19
					end

					if var_46_22.prefab_name ~= "" and arg_43_1.actors_[var_46_22.prefab_name] ~= nil then
						local var_46_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_22.prefab_name].transform, "story_v_out_410032", "410032011", "story_v_out_410032.awb")

						arg_43_1:RecordAudio("410032011", var_46_28)
						arg_43_1:RecordAudio("410032011", var_46_28)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_410032", "410032011", "story_v_out_410032.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_410032", "410032011", "story_v_out_410032.awb")
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
	Play410032012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 410032012
		arg_47_1.duration_ = 2.5

		local var_47_0 = {
			zh = 2.5,
			ja = 2.3
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
				arg_47_0:Play410032013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1056"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1056 = var_50_0.localPosition
				var_50_0.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("1056", 4)

				local var_50_2 = var_50_0.childCount

				for iter_50_0 = 0, var_50_2 - 1 do
					local var_50_3 = var_50_0:GetChild(iter_50_0)

					if var_50_3.name == "split_3" or not string.find(var_50_3.name, "split") then
						var_50_3.gameObject:SetActive(true)
					else
						var_50_3.gameObject:SetActive(false)
					end
				end
			end

			local var_50_4 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_4 then
				local var_50_5 = (arg_47_1.time_ - var_50_1) / var_50_4
				local var_50_6 = Vector3.New(390, -350, -180)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1056, var_50_6, var_50_5)
			end

			if arg_47_1.time_ >= var_50_1 + var_50_4 and arg_47_1.time_ < var_50_1 + var_50_4 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_50_7 = arg_47_1.actors_["1056"]
			local var_50_8 = 0

			if var_50_8 < arg_47_1.time_ and arg_47_1.time_ <= var_50_8 + arg_50_0 and arg_47_1.var_.actorSpriteComps1056 == nil then
				arg_47_1.var_.actorSpriteComps1056 = var_50_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_9 = 0.034

			if var_50_8 <= arg_47_1.time_ and arg_47_1.time_ < var_50_8 + var_50_9 then
				local var_50_10 = (arg_47_1.time_ - var_50_8) / var_50_9

				if arg_47_1.var_.actorSpriteComps1056 then
					for iter_50_1, iter_50_2 in pairs(arg_47_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_50_2 then
							local var_50_11 = Mathf.Lerp(iter_50_2.color.r, 1, var_50_10)

							iter_50_2.color = Color.New(var_50_11, var_50_11, var_50_11)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_8 + var_50_9 and arg_47_1.time_ < var_50_8 + var_50_9 + arg_50_0 and arg_47_1.var_.actorSpriteComps1056 then
				local var_50_12 = 1

				for iter_50_3, iter_50_4 in pairs(arg_47_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_50_4 then
						iter_50_4.color = Color.New(var_50_12, var_50_12, var_50_12)
					end
				end

				arg_47_1.var_.actorSpriteComps1056 = nil
			end

			local var_50_13 = arg_47_1.actors_["1060"]
			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 and arg_47_1.var_.actorSpriteComps1060 == nil then
				arg_47_1.var_.actorSpriteComps1060 = var_50_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_15 = 0.034

			if var_50_14 <= arg_47_1.time_ and arg_47_1.time_ < var_50_14 + var_50_15 then
				local var_50_16 = (arg_47_1.time_ - var_50_14) / var_50_15

				if arg_47_1.var_.actorSpriteComps1060 then
					for iter_50_5, iter_50_6 in pairs(arg_47_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_50_6 then
							local var_50_17 = Mathf.Lerp(iter_50_6.color.r, 0.5, var_50_16)

							iter_50_6.color = Color.New(var_50_17, var_50_17, var_50_17)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_14 + var_50_15 and arg_47_1.time_ < var_50_14 + var_50_15 + arg_50_0 and arg_47_1.var_.actorSpriteComps1060 then
				local var_50_18 = 0.5

				for iter_50_7, iter_50_8 in pairs(arg_47_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_50_8 then
						iter_50_8.color = Color.New(var_50_18, var_50_18, var_50_18)
					end
				end

				arg_47_1.var_.actorSpriteComps1060 = nil
			end

			local var_50_19 = 0
			local var_50_20 = 0.1

			if var_50_19 < arg_47_1.time_ and arg_47_1.time_ <= var_50_19 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_21 = arg_47_1:FormatText(StoryNameCfg[605].name)

				arg_47_1.leftNameTxt_.text = var_50_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_22 = arg_47_1:GetWordFromCfg(410032012)
				local var_50_23 = arg_47_1:FormatText(var_50_22.content)

				arg_47_1.text_.text = var_50_23

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_24 = 4
				local var_50_25 = utf8.len(var_50_23)
				local var_50_26 = var_50_24 <= 0 and var_50_20 or var_50_20 * (var_50_25 / var_50_24)

				if var_50_26 > 0 and var_50_20 < var_50_26 then
					arg_47_1.talkMaxDuration = var_50_26

					if var_50_26 + var_50_19 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_26 + var_50_19
					end
				end

				arg_47_1.text_.text = var_50_23
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032012", "story_v_out_410032.awb") ~= 0 then
					local var_50_27 = manager.audio:GetVoiceLength("story_v_out_410032", "410032012", "story_v_out_410032.awb") / 1000

					if var_50_27 + var_50_19 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_27 + var_50_19
					end

					if var_50_22.prefab_name ~= "" and arg_47_1.actors_[var_50_22.prefab_name] ~= nil then
						local var_50_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_22.prefab_name].transform, "story_v_out_410032", "410032012", "story_v_out_410032.awb")

						arg_47_1:RecordAudio("410032012", var_50_28)
						arg_47_1:RecordAudio("410032012", var_50_28)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_410032", "410032012", "story_v_out_410032.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_410032", "410032012", "story_v_out_410032.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_29 = math.max(var_50_20, arg_47_1.talkMaxDuration)

			if var_50_19 <= arg_47_1.time_ and arg_47_1.time_ < var_50_19 + var_50_29 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_19) / var_50_29

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_19 + var_50_29 and arg_47_1.time_ < var_50_19 + var_50_29 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play410032013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 410032013
		arg_51_1.duration_ = 7

		local var_51_0 = {
			zh = 7,
			ja = 4.933
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
				arg_51_0:Play410032014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1060"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1060 = var_54_0.localPosition
				var_54_0.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("1060", 2)

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
				local var_54_6 = Vector3.New(-390, -435, -40)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1060, var_54_6, var_54_5)
			end

			if arg_51_1.time_ >= var_54_1 + var_54_4 and arg_51_1.time_ < var_54_1 + var_54_4 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(-390, -435, -40)
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

			local var_54_13 = arg_51_1.actors_["1056"]
			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 and arg_51_1.var_.actorSpriteComps1056 == nil then
				arg_51_1.var_.actorSpriteComps1056 = var_54_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_15 = 0.034

			if var_54_14 <= arg_51_1.time_ and arg_51_1.time_ < var_54_14 + var_54_15 then
				local var_54_16 = (arg_51_1.time_ - var_54_14) / var_54_15

				if arg_51_1.var_.actorSpriteComps1056 then
					for iter_54_5, iter_54_6 in pairs(arg_51_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_54_6 then
							local var_54_17 = Mathf.Lerp(iter_54_6.color.r, 0.5, var_54_16)

							iter_54_6.color = Color.New(var_54_17, var_54_17, var_54_17)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_14 + var_54_15 and arg_51_1.time_ < var_54_14 + var_54_15 + arg_54_0 and arg_51_1.var_.actorSpriteComps1056 then
				local var_54_18 = 0.5

				for iter_54_7, iter_54_8 in pairs(arg_51_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_54_8 then
						iter_54_8.color = Color.New(var_54_18, var_54_18, var_54_18)
					end
				end

				arg_51_1.var_.actorSpriteComps1056 = nil
			end

			local var_54_19 = 0
			local var_54_20 = 0.925

			if var_54_19 < arg_51_1.time_ and arg_51_1.time_ <= var_54_19 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_21 = arg_51_1:FormatText(StoryNameCfg[584].name)

				arg_51_1.leftNameTxt_.text = var_54_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_22 = arg_51_1:GetWordFromCfg(410032013)
				local var_54_23 = arg_51_1:FormatText(var_54_22.content)

				arg_51_1.text_.text = var_54_23

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_24 = 37
				local var_54_25 = utf8.len(var_54_23)
				local var_54_26 = var_54_24 <= 0 and var_54_20 or var_54_20 * (var_54_25 / var_54_24)

				if var_54_26 > 0 and var_54_20 < var_54_26 then
					arg_51_1.talkMaxDuration = var_54_26

					if var_54_26 + var_54_19 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_26 + var_54_19
					end
				end

				arg_51_1.text_.text = var_54_23
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032013", "story_v_out_410032.awb") ~= 0 then
					local var_54_27 = manager.audio:GetVoiceLength("story_v_out_410032", "410032013", "story_v_out_410032.awb") / 1000

					if var_54_27 + var_54_19 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_27 + var_54_19
					end

					if var_54_22.prefab_name ~= "" and arg_51_1.actors_[var_54_22.prefab_name] ~= nil then
						local var_54_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_22.prefab_name].transform, "story_v_out_410032", "410032013", "story_v_out_410032.awb")

						arg_51_1:RecordAudio("410032013", var_54_28)
						arg_51_1:RecordAudio("410032013", var_54_28)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_410032", "410032013", "story_v_out_410032.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_410032", "410032013", "story_v_out_410032.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_29 = math.max(var_54_20, arg_51_1.talkMaxDuration)

			if var_54_19 <= arg_51_1.time_ and arg_51_1.time_ < var_54_19 + var_54_29 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_19) / var_54_29

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_19 + var_54_29 and arg_51_1.time_ < var_54_19 + var_54_29 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play410032014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 410032014
		arg_55_1.duration_ = 8.366

		local var_55_0 = {
			zh = 8.366,
			ja = 8.266
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
				arg_55_0:Play410032015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1060"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1060 = var_58_0.localPosition
				var_58_0.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("1060", 2)

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
				local var_58_6 = Vector3.New(-390, -435, -40)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1060, var_58_6, var_58_5)
			end

			if arg_55_1.time_ >= var_58_1 + var_58_4 and arg_55_1.time_ < var_58_1 + var_58_4 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_58_7 = arg_55_1.actors_["1060"]
			local var_58_8 = 0

			if var_58_8 < arg_55_1.time_ and arg_55_1.time_ <= var_58_8 + arg_58_0 and arg_55_1.var_.actorSpriteComps1060 == nil then
				arg_55_1.var_.actorSpriteComps1060 = var_58_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_9 = 0.034

			if var_58_8 <= arg_55_1.time_ and arg_55_1.time_ < var_58_8 + var_58_9 then
				local var_58_10 = (arg_55_1.time_ - var_58_8) / var_58_9

				if arg_55_1.var_.actorSpriteComps1060 then
					for iter_58_1, iter_58_2 in pairs(arg_55_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_58_2 then
							local var_58_11 = Mathf.Lerp(iter_58_2.color.r, 1, var_58_10)

							iter_58_2.color = Color.New(var_58_11, var_58_11, var_58_11)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_8 + var_58_9 and arg_55_1.time_ < var_58_8 + var_58_9 + arg_58_0 and arg_55_1.var_.actorSpriteComps1060 then
				local var_58_12 = 1

				for iter_58_3, iter_58_4 in pairs(arg_55_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_58_4 then
						iter_58_4.color = Color.New(var_58_12, var_58_12, var_58_12)
					end
				end

				arg_55_1.var_.actorSpriteComps1060 = nil
			end

			local var_58_13 = 0
			local var_58_14 = 0.95

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_15 = arg_55_1:FormatText(StoryNameCfg[584].name)

				arg_55_1.leftNameTxt_.text = var_58_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_16 = arg_55_1:GetWordFromCfg(410032014)
				local var_58_17 = arg_55_1:FormatText(var_58_16.content)

				arg_55_1.text_.text = var_58_17

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_18 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032014", "story_v_out_410032.awb") ~= 0 then
					local var_58_21 = manager.audio:GetVoiceLength("story_v_out_410032", "410032014", "story_v_out_410032.awb") / 1000

					if var_58_21 + var_58_13 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_21 + var_58_13
					end

					if var_58_16.prefab_name ~= "" and arg_55_1.actors_[var_58_16.prefab_name] ~= nil then
						local var_58_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_16.prefab_name].transform, "story_v_out_410032", "410032014", "story_v_out_410032.awb")

						arg_55_1:RecordAudio("410032014", var_58_22)
						arg_55_1:RecordAudio("410032014", var_58_22)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_410032", "410032014", "story_v_out_410032.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_410032", "410032014", "story_v_out_410032.awb")
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
	Play410032015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 410032015
		arg_59_1.duration_ = 13.533

		local var_59_0 = {
			zh = 9.7,
			ja = 13.533
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
				arg_59_0:Play410032016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1056"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos1056 = var_62_0.localPosition
				var_62_0.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("1056", 4)

				local var_62_2 = var_62_0.childCount

				for iter_62_0 = 0, var_62_2 - 1 do
					local var_62_3 = var_62_0:GetChild(iter_62_0)

					if var_62_3.name == "split_3" or not string.find(var_62_3.name, "split") then
						var_62_3.gameObject:SetActive(true)
					else
						var_62_3.gameObject:SetActive(false)
					end
				end
			end

			local var_62_4 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_4 then
				local var_62_5 = (arg_59_1.time_ - var_62_1) / var_62_4
				local var_62_6 = Vector3.New(390, -350, -180)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1056, var_62_6, var_62_5)
			end

			if arg_59_1.time_ >= var_62_1 + var_62_4 and arg_59_1.time_ < var_62_1 + var_62_4 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_62_7 = arg_59_1.actors_["1056"]
			local var_62_8 = 0

			if var_62_8 < arg_59_1.time_ and arg_59_1.time_ <= var_62_8 + arg_62_0 and arg_59_1.var_.actorSpriteComps1056 == nil then
				arg_59_1.var_.actorSpriteComps1056 = var_62_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_9 = 0.034

			if var_62_8 <= arg_59_1.time_ and arg_59_1.time_ < var_62_8 + var_62_9 then
				local var_62_10 = (arg_59_1.time_ - var_62_8) / var_62_9

				if arg_59_1.var_.actorSpriteComps1056 then
					for iter_62_1, iter_62_2 in pairs(arg_59_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_62_2 then
							local var_62_11 = Mathf.Lerp(iter_62_2.color.r, 1, var_62_10)

							iter_62_2.color = Color.New(var_62_11, var_62_11, var_62_11)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_8 + var_62_9 and arg_59_1.time_ < var_62_8 + var_62_9 + arg_62_0 and arg_59_1.var_.actorSpriteComps1056 then
				local var_62_12 = 1

				for iter_62_3, iter_62_4 in pairs(arg_59_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_62_4 then
						iter_62_4.color = Color.New(var_62_12, var_62_12, var_62_12)
					end
				end

				arg_59_1.var_.actorSpriteComps1056 = nil
			end

			local var_62_13 = arg_59_1.actors_["1060"]
			local var_62_14 = 0

			if var_62_14 < arg_59_1.time_ and arg_59_1.time_ <= var_62_14 + arg_62_0 and arg_59_1.var_.actorSpriteComps1060 == nil then
				arg_59_1.var_.actorSpriteComps1060 = var_62_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_15 = 0.034

			if var_62_14 <= arg_59_1.time_ and arg_59_1.time_ < var_62_14 + var_62_15 then
				local var_62_16 = (arg_59_1.time_ - var_62_14) / var_62_15

				if arg_59_1.var_.actorSpriteComps1060 then
					for iter_62_5, iter_62_6 in pairs(arg_59_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_62_6 then
							local var_62_17 = Mathf.Lerp(iter_62_6.color.r, 0.5, var_62_16)

							iter_62_6.color = Color.New(var_62_17, var_62_17, var_62_17)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_14 + var_62_15 and arg_59_1.time_ < var_62_14 + var_62_15 + arg_62_0 and arg_59_1.var_.actorSpriteComps1060 then
				local var_62_18 = 0.5

				for iter_62_7, iter_62_8 in pairs(arg_59_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_62_8 then
						iter_62_8.color = Color.New(var_62_18, var_62_18, var_62_18)
					end
				end

				arg_59_1.var_.actorSpriteComps1060 = nil
			end

			local var_62_19 = 0
			local var_62_20 = 1.2

			if var_62_19 < arg_59_1.time_ and arg_59_1.time_ <= var_62_19 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_21 = arg_59_1:FormatText(StoryNameCfg[605].name)

				arg_59_1.leftNameTxt_.text = var_62_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_22 = arg_59_1:GetWordFromCfg(410032015)
				local var_62_23 = arg_59_1:FormatText(var_62_22.content)

				arg_59_1.text_.text = var_62_23

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_24 = 48
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

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032015", "story_v_out_410032.awb") ~= 0 then
					local var_62_27 = manager.audio:GetVoiceLength("story_v_out_410032", "410032015", "story_v_out_410032.awb") / 1000

					if var_62_27 + var_62_19 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_27 + var_62_19
					end

					if var_62_22.prefab_name ~= "" and arg_59_1.actors_[var_62_22.prefab_name] ~= nil then
						local var_62_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_22.prefab_name].transform, "story_v_out_410032", "410032015", "story_v_out_410032.awb")

						arg_59_1:RecordAudio("410032015", var_62_28)
						arg_59_1:RecordAudio("410032015", var_62_28)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_410032", "410032015", "story_v_out_410032.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_410032", "410032015", "story_v_out_410032.awb")
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
	Play410032016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 410032016
		arg_63_1.duration_ = 6.933

		local var_63_0 = {
			zh = 6.933,
			ja = 6.7
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
				arg_63_0:Play410032017(arg_63_1)
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

			local var_66_13 = 0
			local var_66_14 = 0.875

			if var_66_13 < arg_63_1.time_ and arg_63_1.time_ <= var_66_13 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_15 = arg_63_1:FormatText(StoryNameCfg[605].name)

				arg_63_1.leftNameTxt_.text = var_66_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_16 = arg_63_1:GetWordFromCfg(410032016)
				local var_66_17 = arg_63_1:FormatText(var_66_16.content)

				arg_63_1.text_.text = var_66_17

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_18 = 35
				local var_66_19 = utf8.len(var_66_17)
				local var_66_20 = var_66_18 <= 0 and var_66_14 or var_66_14 * (var_66_19 / var_66_18)

				if var_66_20 > 0 and var_66_14 < var_66_20 then
					arg_63_1.talkMaxDuration = var_66_20

					if var_66_20 + var_66_13 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_20 + var_66_13
					end
				end

				arg_63_1.text_.text = var_66_17
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032016", "story_v_out_410032.awb") ~= 0 then
					local var_66_21 = manager.audio:GetVoiceLength("story_v_out_410032", "410032016", "story_v_out_410032.awb") / 1000

					if var_66_21 + var_66_13 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_21 + var_66_13
					end

					if var_66_16.prefab_name ~= "" and arg_63_1.actors_[var_66_16.prefab_name] ~= nil then
						local var_66_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_16.prefab_name].transform, "story_v_out_410032", "410032016", "story_v_out_410032.awb")

						arg_63_1:RecordAudio("410032016", var_66_22)
						arg_63_1:RecordAudio("410032016", var_66_22)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_410032", "410032016", "story_v_out_410032.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_410032", "410032016", "story_v_out_410032.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_23 = math.max(var_66_14, arg_63_1.talkMaxDuration)

			if var_66_13 <= arg_63_1.time_ and arg_63_1.time_ < var_66_13 + var_66_23 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_13) / var_66_23

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_13 + var_66_23 and arg_63_1.time_ < var_66_13 + var_66_23 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play410032017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 410032017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play410032018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1060"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.actorSpriteComps1060 == nil then
				arg_67_1.var_.actorSpriteComps1060 = var_70_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_2 = 0.034

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.actorSpriteComps1060 then
					for iter_70_0, iter_70_1 in pairs(arg_67_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_70_1 then
							local var_70_4 = Mathf.Lerp(iter_70_1.color.r, 0.5, var_70_3)

							iter_70_1.color = Color.New(var_70_4, var_70_4, var_70_4)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.actorSpriteComps1060 then
				local var_70_5 = 0.5

				for iter_70_2, iter_70_3 in pairs(arg_67_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_70_3 then
						iter_70_3.color = Color.New(var_70_5, var_70_5, var_70_5)
					end
				end

				arg_67_1.var_.actorSpriteComps1060 = nil
			end

			local var_70_6 = arg_67_1.actors_["1056"]
			local var_70_7 = 0

			if var_70_7 < arg_67_1.time_ and arg_67_1.time_ <= var_70_7 + arg_70_0 and arg_67_1.var_.actorSpriteComps1056 == nil then
				arg_67_1.var_.actorSpriteComps1056 = var_70_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_8 = 0.034

			if var_70_7 <= arg_67_1.time_ and arg_67_1.time_ < var_70_7 + var_70_8 then
				local var_70_9 = (arg_67_1.time_ - var_70_7) / var_70_8

				if arg_67_1.var_.actorSpriteComps1056 then
					for iter_70_4, iter_70_5 in pairs(arg_67_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_70_5 then
							local var_70_10 = Mathf.Lerp(iter_70_5.color.r, 0.5, var_70_9)

							iter_70_5.color = Color.New(var_70_10, var_70_10, var_70_10)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_7 + var_70_8 and arg_67_1.time_ < var_70_7 + var_70_8 + arg_70_0 and arg_67_1.var_.actorSpriteComps1056 then
				local var_70_11 = 0.5

				for iter_70_6, iter_70_7 in pairs(arg_67_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_70_7 then
						iter_70_7.color = Color.New(var_70_11, var_70_11, var_70_11)
					end
				end

				arg_67_1.var_.actorSpriteComps1056 = nil
			end

			local var_70_12 = 0
			local var_70_13 = 1.125

			if var_70_12 < arg_67_1.time_ and arg_67_1.time_ <= var_70_12 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_14 = arg_67_1:GetWordFromCfg(410032017)
				local var_70_15 = arg_67_1:FormatText(var_70_14.content)

				arg_67_1.text_.text = var_70_15

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_16 = 45
				local var_70_17 = utf8.len(var_70_15)
				local var_70_18 = var_70_16 <= 0 and var_70_13 or var_70_13 * (var_70_17 / var_70_16)

				if var_70_18 > 0 and var_70_13 < var_70_18 then
					arg_67_1.talkMaxDuration = var_70_18

					if var_70_18 + var_70_12 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_18 + var_70_12
					end
				end

				arg_67_1.text_.text = var_70_15
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_19 = math.max(var_70_13, arg_67_1.talkMaxDuration)

			if var_70_12 <= arg_67_1.time_ and arg_67_1.time_ < var_70_12 + var_70_19 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_12) / var_70_19

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_12 + var_70_19 and arg_67_1.time_ < var_70_12 + var_70_19 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play410032018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 410032018
		arg_71_1.duration_ = 7.933

		local var_71_0 = {
			zh = 3.7,
			ja = 7.933
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
				arg_71_0:Play410032019(arg_71_1)
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

					if var_74_3.name == "split_4" or not string.find(var_74_3.name, "split") then
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
			local var_74_14 = 0.375

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

				local var_74_16 = arg_71_1:GetWordFromCfg(410032018)
				local var_74_17 = arg_71_1:FormatText(var_74_16.content)

				arg_71_1.text_.text = var_74_17

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_18 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032018", "story_v_out_410032.awb") ~= 0 then
					local var_74_21 = manager.audio:GetVoiceLength("story_v_out_410032", "410032018", "story_v_out_410032.awb") / 1000

					if var_74_21 + var_74_13 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_21 + var_74_13
					end

					if var_74_16.prefab_name ~= "" and arg_71_1.actors_[var_74_16.prefab_name] ~= nil then
						local var_74_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_16.prefab_name].transform, "story_v_out_410032", "410032018", "story_v_out_410032.awb")

						arg_71_1:RecordAudio("410032018", var_74_22)
						arg_71_1:RecordAudio("410032018", var_74_22)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_410032", "410032018", "story_v_out_410032.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_410032", "410032018", "story_v_out_410032.awb")
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
	Play410032019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 410032019
		arg_75_1.duration_ = 10.5

		local var_75_0 = {
			zh = 8.133,
			ja = 10.5
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
				arg_75_0:Play410032020(arg_75_1)
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
			local var_78_20 = 0.8

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

				local var_78_22 = arg_75_1:GetWordFromCfg(410032019)
				local var_78_23 = arg_75_1:FormatText(var_78_22.content)

				arg_75_1.text_.text = var_78_23

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_24 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032019", "story_v_out_410032.awb") ~= 0 then
					local var_78_27 = manager.audio:GetVoiceLength("story_v_out_410032", "410032019", "story_v_out_410032.awb") / 1000

					if var_78_27 + var_78_19 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_27 + var_78_19
					end

					if var_78_22.prefab_name ~= "" and arg_75_1.actors_[var_78_22.prefab_name] ~= nil then
						local var_78_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_22.prefab_name].transform, "story_v_out_410032", "410032019", "story_v_out_410032.awb")

						arg_75_1:RecordAudio("410032019", var_78_28)
						arg_75_1:RecordAudio("410032019", var_78_28)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_410032", "410032019", "story_v_out_410032.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_410032", "410032019", "story_v_out_410032.awb")
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
	Play410032020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 410032020
		arg_79_1.duration_ = 4.933

		local var_79_0 = {
			zh = 4.066,
			ja = 4.933
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
				arg_79_0:Play410032021(arg_79_1)
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
			local var_82_20 = 0.4

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

				local var_82_22 = arg_79_1:GetWordFromCfg(410032020)
				local var_82_23 = arg_79_1:FormatText(var_82_22.content)

				arg_79_1.text_.text = var_82_23

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_24 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032020", "story_v_out_410032.awb") ~= 0 then
					local var_82_27 = manager.audio:GetVoiceLength("story_v_out_410032", "410032020", "story_v_out_410032.awb") / 1000

					if var_82_27 + var_82_19 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_27 + var_82_19
					end

					if var_82_22.prefab_name ~= "" and arg_79_1.actors_[var_82_22.prefab_name] ~= nil then
						local var_82_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_22.prefab_name].transform, "story_v_out_410032", "410032020", "story_v_out_410032.awb")

						arg_79_1:RecordAudio("410032020", var_82_28)
						arg_79_1:RecordAudio("410032020", var_82_28)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_410032", "410032020", "story_v_out_410032.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_410032", "410032020", "story_v_out_410032.awb")
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
	Play410032021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 410032021
		arg_83_1.duration_ = 6.3

		local var_83_0 = {
			zh = 3.533,
			ja = 6.3
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
				arg_83_0:Play410032022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1060"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1060 = var_86_0.localPosition
				var_86_0.localScale = Vector3.New(1, 1, 1)

				arg_83_1:CheckSpriteTmpPos("1060", 2)

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
				local var_86_6 = Vector3.New(-390, -435, -40)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1060, var_86_6, var_86_5)
			end

			if arg_83_1.time_ >= var_86_1 + var_86_4 and arg_83_1.time_ < var_86_1 + var_86_4 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_86_7 = arg_83_1.actors_["1060"]
			local var_86_8 = 0

			if var_86_8 < arg_83_1.time_ and arg_83_1.time_ <= var_86_8 + arg_86_0 and arg_83_1.var_.actorSpriteComps1060 == nil then
				arg_83_1.var_.actorSpriteComps1060 = var_86_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_9 = 0.034

			if var_86_8 <= arg_83_1.time_ and arg_83_1.time_ < var_86_8 + var_86_9 then
				local var_86_10 = (arg_83_1.time_ - var_86_8) / var_86_9

				if arg_83_1.var_.actorSpriteComps1060 then
					for iter_86_1, iter_86_2 in pairs(arg_83_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_86_2 then
							local var_86_11 = Mathf.Lerp(iter_86_2.color.r, 1, var_86_10)

							iter_86_2.color = Color.New(var_86_11, var_86_11, var_86_11)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_8 + var_86_9 and arg_83_1.time_ < var_86_8 + var_86_9 + arg_86_0 and arg_83_1.var_.actorSpriteComps1060 then
				local var_86_12 = 1

				for iter_86_3, iter_86_4 in pairs(arg_83_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_86_4 then
						iter_86_4.color = Color.New(var_86_12, var_86_12, var_86_12)
					end
				end

				arg_83_1.var_.actorSpriteComps1060 = nil
			end

			local var_86_13 = arg_83_1.actors_["1056"]
			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 and arg_83_1.var_.actorSpriteComps1056 == nil then
				arg_83_1.var_.actorSpriteComps1056 = var_86_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_15 = 0.034

			if var_86_14 <= arg_83_1.time_ and arg_83_1.time_ < var_86_14 + var_86_15 then
				local var_86_16 = (arg_83_1.time_ - var_86_14) / var_86_15

				if arg_83_1.var_.actorSpriteComps1056 then
					for iter_86_5, iter_86_6 in pairs(arg_83_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_86_6 then
							local var_86_17 = Mathf.Lerp(iter_86_6.color.r, 0.5, var_86_16)

							iter_86_6.color = Color.New(var_86_17, var_86_17, var_86_17)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_14 + var_86_15 and arg_83_1.time_ < var_86_14 + var_86_15 + arg_86_0 and arg_83_1.var_.actorSpriteComps1056 then
				local var_86_18 = 0.5

				for iter_86_7, iter_86_8 in pairs(arg_83_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_86_8 then
						iter_86_8.color = Color.New(var_86_18, var_86_18, var_86_18)
					end
				end

				arg_83_1.var_.actorSpriteComps1056 = nil
			end

			local var_86_19 = 0
			local var_86_20 = 0.4

			if var_86_19 < arg_83_1.time_ and arg_83_1.time_ <= var_86_19 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_21 = arg_83_1:FormatText(StoryNameCfg[584].name)

				arg_83_1.leftNameTxt_.text = var_86_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_22 = arg_83_1:GetWordFromCfg(410032021)
				local var_86_23 = arg_83_1:FormatText(var_86_22.content)

				arg_83_1.text_.text = var_86_23

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_24 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032021", "story_v_out_410032.awb") ~= 0 then
					local var_86_27 = manager.audio:GetVoiceLength("story_v_out_410032", "410032021", "story_v_out_410032.awb") / 1000

					if var_86_27 + var_86_19 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_27 + var_86_19
					end

					if var_86_22.prefab_name ~= "" and arg_83_1.actors_[var_86_22.prefab_name] ~= nil then
						local var_86_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_22.prefab_name].transform, "story_v_out_410032", "410032021", "story_v_out_410032.awb")

						arg_83_1:RecordAudio("410032021", var_86_28)
						arg_83_1:RecordAudio("410032021", var_86_28)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_410032", "410032021", "story_v_out_410032.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_410032", "410032021", "story_v_out_410032.awb")
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
	Play410032022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 410032022
		arg_87_1.duration_ = 13.9

		local var_87_0 = {
			zh = 4.933,
			ja = 13.9
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
				arg_87_0:Play410032023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1056"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1056 = var_90_0.localPosition
				var_90_0.localScale = Vector3.New(1, 1, 1)

				arg_87_1:CheckSpriteTmpPos("1056", 4)

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
				local var_90_6 = Vector3.New(390, -350, -180)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1056, var_90_6, var_90_5)
			end

			if arg_87_1.time_ >= var_90_1 + var_90_4 and arg_87_1.time_ < var_90_1 + var_90_4 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_90_7 = arg_87_1.actors_["1056"]
			local var_90_8 = 0

			if var_90_8 < arg_87_1.time_ and arg_87_1.time_ <= var_90_8 + arg_90_0 and arg_87_1.var_.actorSpriteComps1056 == nil then
				arg_87_1.var_.actorSpriteComps1056 = var_90_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_9 = 0.034

			if var_90_8 <= arg_87_1.time_ and arg_87_1.time_ < var_90_8 + var_90_9 then
				local var_90_10 = (arg_87_1.time_ - var_90_8) / var_90_9

				if arg_87_1.var_.actorSpriteComps1056 then
					for iter_90_1, iter_90_2 in pairs(arg_87_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_90_2 then
							local var_90_11 = Mathf.Lerp(iter_90_2.color.r, 1, var_90_10)

							iter_90_2.color = Color.New(var_90_11, var_90_11, var_90_11)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_8 + var_90_9 and arg_87_1.time_ < var_90_8 + var_90_9 + arg_90_0 and arg_87_1.var_.actorSpriteComps1056 then
				local var_90_12 = 1

				for iter_90_3, iter_90_4 in pairs(arg_87_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_90_4 then
						iter_90_4.color = Color.New(var_90_12, var_90_12, var_90_12)
					end
				end

				arg_87_1.var_.actorSpriteComps1056 = nil
			end

			local var_90_13 = arg_87_1.actors_["1060"]
			local var_90_14 = 0

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 and arg_87_1.var_.actorSpriteComps1060 == nil then
				arg_87_1.var_.actorSpriteComps1060 = var_90_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_15 = 0.034

			if var_90_14 <= arg_87_1.time_ and arg_87_1.time_ < var_90_14 + var_90_15 then
				local var_90_16 = (arg_87_1.time_ - var_90_14) / var_90_15

				if arg_87_1.var_.actorSpriteComps1060 then
					for iter_90_5, iter_90_6 in pairs(arg_87_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_90_6 then
							local var_90_17 = Mathf.Lerp(iter_90_6.color.r, 0.5, var_90_16)

							iter_90_6.color = Color.New(var_90_17, var_90_17, var_90_17)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_14 + var_90_15 and arg_87_1.time_ < var_90_14 + var_90_15 + arg_90_0 and arg_87_1.var_.actorSpriteComps1060 then
				local var_90_18 = 0.5

				for iter_90_7, iter_90_8 in pairs(arg_87_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_90_8 then
						iter_90_8.color = Color.New(var_90_18, var_90_18, var_90_18)
					end
				end

				arg_87_1.var_.actorSpriteComps1060 = nil
			end

			local var_90_19 = 0
			local var_90_20 = 0.75

			if var_90_19 < arg_87_1.time_ and arg_87_1.time_ <= var_90_19 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_21 = arg_87_1:FormatText(StoryNameCfg[605].name)

				arg_87_1.leftNameTxt_.text = var_90_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_22 = arg_87_1:GetWordFromCfg(410032022)
				local var_90_23 = arg_87_1:FormatText(var_90_22.content)

				arg_87_1.text_.text = var_90_23

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_24 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032022", "story_v_out_410032.awb") ~= 0 then
					local var_90_27 = manager.audio:GetVoiceLength("story_v_out_410032", "410032022", "story_v_out_410032.awb") / 1000

					if var_90_27 + var_90_19 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_27 + var_90_19
					end

					if var_90_22.prefab_name ~= "" and arg_87_1.actors_[var_90_22.prefab_name] ~= nil then
						local var_90_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_22.prefab_name].transform, "story_v_out_410032", "410032022", "story_v_out_410032.awb")

						arg_87_1:RecordAudio("410032022", var_90_28)
						arg_87_1:RecordAudio("410032022", var_90_28)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_410032", "410032022", "story_v_out_410032.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_410032", "410032022", "story_v_out_410032.awb")
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
	Play410032023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 410032023
		arg_91_1.duration_ = 6.933

		local var_91_0 = {
			zh = 4.5,
			ja = 6.933
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
				arg_91_0:Play410032024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1056"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1056 = var_94_0.localPosition
				var_94_0.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("1056", 4)

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
				local var_94_6 = Vector3.New(390, -350, -180)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1056, var_94_6, var_94_5)
			end

			if arg_91_1.time_ >= var_94_1 + var_94_4 and arg_91_1.time_ < var_94_1 + var_94_4 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_94_7 = arg_91_1.actors_["1056"]
			local var_94_8 = 0

			if var_94_8 < arg_91_1.time_ and arg_91_1.time_ <= var_94_8 + arg_94_0 and arg_91_1.var_.actorSpriteComps1056 == nil then
				arg_91_1.var_.actorSpriteComps1056 = var_94_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_9 = 0.034

			if var_94_8 <= arg_91_1.time_ and arg_91_1.time_ < var_94_8 + var_94_9 then
				local var_94_10 = (arg_91_1.time_ - var_94_8) / var_94_9

				if arg_91_1.var_.actorSpriteComps1056 then
					for iter_94_1, iter_94_2 in pairs(arg_91_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_94_2 then
							local var_94_11 = Mathf.Lerp(iter_94_2.color.r, 1, var_94_10)

							iter_94_2.color = Color.New(var_94_11, var_94_11, var_94_11)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_8 + var_94_9 and arg_91_1.time_ < var_94_8 + var_94_9 + arg_94_0 and arg_91_1.var_.actorSpriteComps1056 then
				local var_94_12 = 1

				for iter_94_3, iter_94_4 in pairs(arg_91_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_94_4 then
						iter_94_4.color = Color.New(var_94_12, var_94_12, var_94_12)
					end
				end

				arg_91_1.var_.actorSpriteComps1056 = nil
			end

			local var_94_13 = 0
			local var_94_14 = 0.525

			if var_94_13 < arg_91_1.time_ and arg_91_1.time_ <= var_94_13 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_15 = arg_91_1:FormatText(StoryNameCfg[605].name)

				arg_91_1.leftNameTxt_.text = var_94_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_16 = arg_91_1:GetWordFromCfg(410032023)
				local var_94_17 = arg_91_1:FormatText(var_94_16.content)

				arg_91_1.text_.text = var_94_17

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_18 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032023", "story_v_out_410032.awb") ~= 0 then
					local var_94_21 = manager.audio:GetVoiceLength("story_v_out_410032", "410032023", "story_v_out_410032.awb") / 1000

					if var_94_21 + var_94_13 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_21 + var_94_13
					end

					if var_94_16.prefab_name ~= "" and arg_91_1.actors_[var_94_16.prefab_name] ~= nil then
						local var_94_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_16.prefab_name].transform, "story_v_out_410032", "410032023", "story_v_out_410032.awb")

						arg_91_1:RecordAudio("410032023", var_94_22)
						arg_91_1:RecordAudio("410032023", var_94_22)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_410032", "410032023", "story_v_out_410032.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_410032", "410032023", "story_v_out_410032.awb")
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
	Play410032024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 410032024
		arg_95_1.duration_ = 7.233

		local var_95_0 = {
			zh = 3.666,
			ja = 7.233
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
				arg_95_0:Play410032025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1060"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos1060 = var_98_0.localPosition
				var_98_0.localScale = Vector3.New(1, 1, 1)

				arg_95_1:CheckSpriteTmpPos("1060", 2)

				local var_98_2 = var_98_0.childCount

				for iter_98_0 = 0, var_98_2 - 1 do
					local var_98_3 = var_98_0:GetChild(iter_98_0)

					if var_98_3.name == "" or not string.find(var_98_3.name, "split") then
						var_98_3.gameObject:SetActive(true)
					else
						var_98_3.gameObject:SetActive(false)
					end
				end
			end

			local var_98_4 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_4 then
				local var_98_5 = (arg_95_1.time_ - var_98_1) / var_98_4
				local var_98_6 = Vector3.New(-390, -435, -40)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1060, var_98_6, var_98_5)
			end

			if arg_95_1.time_ >= var_98_1 + var_98_4 and arg_95_1.time_ < var_98_1 + var_98_4 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_98_7 = arg_95_1.actors_["1060"]
			local var_98_8 = 0

			if var_98_8 < arg_95_1.time_ and arg_95_1.time_ <= var_98_8 + arg_98_0 and arg_95_1.var_.actorSpriteComps1060 == nil then
				arg_95_1.var_.actorSpriteComps1060 = var_98_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_9 = 0.034

			if var_98_8 <= arg_95_1.time_ and arg_95_1.time_ < var_98_8 + var_98_9 then
				local var_98_10 = (arg_95_1.time_ - var_98_8) / var_98_9

				if arg_95_1.var_.actorSpriteComps1060 then
					for iter_98_1, iter_98_2 in pairs(arg_95_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_98_2 then
							local var_98_11 = Mathf.Lerp(iter_98_2.color.r, 1, var_98_10)

							iter_98_2.color = Color.New(var_98_11, var_98_11, var_98_11)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_8 + var_98_9 and arg_95_1.time_ < var_98_8 + var_98_9 + arg_98_0 and arg_95_1.var_.actorSpriteComps1060 then
				local var_98_12 = 1

				for iter_98_3, iter_98_4 in pairs(arg_95_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_98_4 then
						iter_98_4.color = Color.New(var_98_12, var_98_12, var_98_12)
					end
				end

				arg_95_1.var_.actorSpriteComps1060 = nil
			end

			local var_98_13 = arg_95_1.actors_["1056"]
			local var_98_14 = 0

			if var_98_14 < arg_95_1.time_ and arg_95_1.time_ <= var_98_14 + arg_98_0 and arg_95_1.var_.actorSpriteComps1056 == nil then
				arg_95_1.var_.actorSpriteComps1056 = var_98_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_15 = 0.034

			if var_98_14 <= arg_95_1.time_ and arg_95_1.time_ < var_98_14 + var_98_15 then
				local var_98_16 = (arg_95_1.time_ - var_98_14) / var_98_15

				if arg_95_1.var_.actorSpriteComps1056 then
					for iter_98_5, iter_98_6 in pairs(arg_95_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_98_6 then
							local var_98_17 = Mathf.Lerp(iter_98_6.color.r, 0.5, var_98_16)

							iter_98_6.color = Color.New(var_98_17, var_98_17, var_98_17)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_14 + var_98_15 and arg_95_1.time_ < var_98_14 + var_98_15 + arg_98_0 and arg_95_1.var_.actorSpriteComps1056 then
				local var_98_18 = 0.5

				for iter_98_7, iter_98_8 in pairs(arg_95_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_98_8 then
						iter_98_8.color = Color.New(var_98_18, var_98_18, var_98_18)
					end
				end

				arg_95_1.var_.actorSpriteComps1056 = nil
			end

			local var_98_19 = 0
			local var_98_20 = 0.4

			if var_98_19 < arg_95_1.time_ and arg_95_1.time_ <= var_98_19 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_21 = arg_95_1:FormatText(StoryNameCfg[584].name)

				arg_95_1.leftNameTxt_.text = var_98_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_22 = arg_95_1:GetWordFromCfg(410032024)
				local var_98_23 = arg_95_1:FormatText(var_98_22.content)

				arg_95_1.text_.text = var_98_23

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_24 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032024", "story_v_out_410032.awb") ~= 0 then
					local var_98_27 = manager.audio:GetVoiceLength("story_v_out_410032", "410032024", "story_v_out_410032.awb") / 1000

					if var_98_27 + var_98_19 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_27 + var_98_19
					end

					if var_98_22.prefab_name ~= "" and arg_95_1.actors_[var_98_22.prefab_name] ~= nil then
						local var_98_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_22.prefab_name].transform, "story_v_out_410032", "410032024", "story_v_out_410032.awb")

						arg_95_1:RecordAudio("410032024", var_98_28)
						arg_95_1:RecordAudio("410032024", var_98_28)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_410032", "410032024", "story_v_out_410032.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_410032", "410032024", "story_v_out_410032.awb")
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
	Play410032025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 410032025
		arg_99_1.duration_ = 4.8

		local var_99_0 = {
			zh = 4.266,
			ja = 4.8
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
				arg_99_0:Play410032026(arg_99_1)
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

			local var_102_13 = arg_99_1.actors_["1060"]
			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 and arg_99_1.var_.actorSpriteComps1060 == nil then
				arg_99_1.var_.actorSpriteComps1060 = var_102_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_15 = 0.034

			if var_102_14 <= arg_99_1.time_ and arg_99_1.time_ < var_102_14 + var_102_15 then
				local var_102_16 = (arg_99_1.time_ - var_102_14) / var_102_15

				if arg_99_1.var_.actorSpriteComps1060 then
					for iter_102_5, iter_102_6 in pairs(arg_99_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_102_6 then
							local var_102_17 = Mathf.Lerp(iter_102_6.color.r, 0.5, var_102_16)

							iter_102_6.color = Color.New(var_102_17, var_102_17, var_102_17)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_14 + var_102_15 and arg_99_1.time_ < var_102_14 + var_102_15 + arg_102_0 and arg_99_1.var_.actorSpriteComps1060 then
				local var_102_18 = 0.5

				for iter_102_7, iter_102_8 in pairs(arg_99_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_102_8 then
						iter_102_8.color = Color.New(var_102_18, var_102_18, var_102_18)
					end
				end

				arg_99_1.var_.actorSpriteComps1060 = nil
			end

			local var_102_19 = 0
			local var_102_20 = 0.625

			if var_102_19 < arg_99_1.time_ and arg_99_1.time_ <= var_102_19 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_21 = arg_99_1:FormatText(StoryNameCfg[605].name)

				arg_99_1.leftNameTxt_.text = var_102_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_22 = arg_99_1:GetWordFromCfg(410032025)
				local var_102_23 = arg_99_1:FormatText(var_102_22.content)

				arg_99_1.text_.text = var_102_23

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_24 = 25
				local var_102_25 = utf8.len(var_102_23)
				local var_102_26 = var_102_24 <= 0 and var_102_20 or var_102_20 * (var_102_25 / var_102_24)

				if var_102_26 > 0 and var_102_20 < var_102_26 then
					arg_99_1.talkMaxDuration = var_102_26

					if var_102_26 + var_102_19 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_26 + var_102_19
					end
				end

				arg_99_1.text_.text = var_102_23
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032025", "story_v_out_410032.awb") ~= 0 then
					local var_102_27 = manager.audio:GetVoiceLength("story_v_out_410032", "410032025", "story_v_out_410032.awb") / 1000

					if var_102_27 + var_102_19 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_27 + var_102_19
					end

					if var_102_22.prefab_name ~= "" and arg_99_1.actors_[var_102_22.prefab_name] ~= nil then
						local var_102_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_22.prefab_name].transform, "story_v_out_410032", "410032025", "story_v_out_410032.awb")

						arg_99_1:RecordAudio("410032025", var_102_28)
						arg_99_1:RecordAudio("410032025", var_102_28)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_410032", "410032025", "story_v_out_410032.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_410032", "410032025", "story_v_out_410032.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_29 = math.max(var_102_20, arg_99_1.talkMaxDuration)

			if var_102_19 <= arg_99_1.time_ and arg_99_1.time_ < var_102_19 + var_102_29 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_19) / var_102_29

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_19 + var_102_29 and arg_99_1.time_ < var_102_19 + var_102_29 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play410032026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 410032026
		arg_103_1.duration_ = 5.566

		local var_103_0 = {
			zh = 3.8,
			ja = 5.566
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
				arg_103_0:Play410032027(arg_103_1)
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
			local var_106_14 = 0.45

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

				local var_106_16 = arg_103_1:GetWordFromCfg(410032026)
				local var_106_17 = arg_103_1:FormatText(var_106_16.content)

				arg_103_1.text_.text = var_106_17

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_18 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032026", "story_v_out_410032.awb") ~= 0 then
					local var_106_21 = manager.audio:GetVoiceLength("story_v_out_410032", "410032026", "story_v_out_410032.awb") / 1000

					if var_106_21 + var_106_13 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_21 + var_106_13
					end

					if var_106_16.prefab_name ~= "" and arg_103_1.actors_[var_106_16.prefab_name] ~= nil then
						local var_106_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_16.prefab_name].transform, "story_v_out_410032", "410032026", "story_v_out_410032.awb")

						arg_103_1:RecordAudio("410032026", var_106_22)
						arg_103_1:RecordAudio("410032026", var_106_22)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_410032", "410032026", "story_v_out_410032.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_410032", "410032026", "story_v_out_410032.awb")
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
	Play410032027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 410032027
		arg_107_1.duration_ = 7.7

		local var_107_0 = {
			zh = 7.7,
			ja = 7.133
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
				arg_107_0:Play410032028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1060"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos1060 = var_110_0.localPosition
				var_110_0.localScale = Vector3.New(1, 1, 1)

				arg_107_1:CheckSpriteTmpPos("1060", 2)

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
				local var_110_6 = Vector3.New(-390, -435, -40)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1060, var_110_6, var_110_5)
			end

			if arg_107_1.time_ >= var_110_1 + var_110_4 and arg_107_1.time_ < var_110_1 + var_110_4 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(-390, -435, -40)
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

			local var_110_13 = arg_107_1.actors_["1056"]
			local var_110_14 = 0

			if var_110_14 < arg_107_1.time_ and arg_107_1.time_ <= var_110_14 + arg_110_0 and arg_107_1.var_.actorSpriteComps1056 == nil then
				arg_107_1.var_.actorSpriteComps1056 = var_110_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_15 = 0.034

			if var_110_14 <= arg_107_1.time_ and arg_107_1.time_ < var_110_14 + var_110_15 then
				local var_110_16 = (arg_107_1.time_ - var_110_14) / var_110_15

				if arg_107_1.var_.actorSpriteComps1056 then
					for iter_110_5, iter_110_6 in pairs(arg_107_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_110_6 then
							local var_110_17 = Mathf.Lerp(iter_110_6.color.r, 0.5, var_110_16)

							iter_110_6.color = Color.New(var_110_17, var_110_17, var_110_17)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_14 + var_110_15 and arg_107_1.time_ < var_110_14 + var_110_15 + arg_110_0 and arg_107_1.var_.actorSpriteComps1056 then
				local var_110_18 = 0.5

				for iter_110_7, iter_110_8 in pairs(arg_107_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_110_8 then
						iter_110_8.color = Color.New(var_110_18, var_110_18, var_110_18)
					end
				end

				arg_107_1.var_.actorSpriteComps1056 = nil
			end

			local var_110_19 = 0
			local var_110_20 = 0.825

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

				local var_110_22 = arg_107_1:GetWordFromCfg(410032027)
				local var_110_23 = arg_107_1:FormatText(var_110_22.content)

				arg_107_1.text_.text = var_110_23

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_24 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032027", "story_v_out_410032.awb") ~= 0 then
					local var_110_27 = manager.audio:GetVoiceLength("story_v_out_410032", "410032027", "story_v_out_410032.awb") / 1000

					if var_110_27 + var_110_19 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_27 + var_110_19
					end

					if var_110_22.prefab_name ~= "" and arg_107_1.actors_[var_110_22.prefab_name] ~= nil then
						local var_110_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_22.prefab_name].transform, "story_v_out_410032", "410032027", "story_v_out_410032.awb")

						arg_107_1:RecordAudio("410032027", var_110_28)
						arg_107_1:RecordAudio("410032027", var_110_28)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_410032", "410032027", "story_v_out_410032.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_410032", "410032027", "story_v_out_410032.awb")
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
	Play410032028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 410032028
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play410032029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1060"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.actorSpriteComps1060 == nil then
				arg_111_1.var_.actorSpriteComps1060 = var_114_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_2 = 0.034

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.actorSpriteComps1060 then
					for iter_114_0, iter_114_1 in pairs(arg_111_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_114_1 then
							local var_114_4 = Mathf.Lerp(iter_114_1.color.r, 0.5, var_114_3)

							iter_114_1.color = Color.New(var_114_4, var_114_4, var_114_4)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.actorSpriteComps1060 then
				local var_114_5 = 0.5

				for iter_114_2, iter_114_3 in pairs(arg_111_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_114_3 then
						iter_114_3.color = Color.New(var_114_5, var_114_5, var_114_5)
					end
				end

				arg_111_1.var_.actorSpriteComps1060 = nil
			end

			local var_114_6 = arg_111_1.actors_["1056"]
			local var_114_7 = 0

			if var_114_7 < arg_111_1.time_ and arg_111_1.time_ <= var_114_7 + arg_114_0 and arg_111_1.var_.actorSpriteComps1056 == nil then
				arg_111_1.var_.actorSpriteComps1056 = var_114_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_8 = 0.034

			if var_114_7 <= arg_111_1.time_ and arg_111_1.time_ < var_114_7 + var_114_8 then
				local var_114_9 = (arg_111_1.time_ - var_114_7) / var_114_8

				if arg_111_1.var_.actorSpriteComps1056 then
					for iter_114_4, iter_114_5 in pairs(arg_111_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_114_5 then
							local var_114_10 = Mathf.Lerp(iter_114_5.color.r, 0.5, var_114_9)

							iter_114_5.color = Color.New(var_114_10, var_114_10, var_114_10)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_7 + var_114_8 and arg_111_1.time_ < var_114_7 + var_114_8 + arg_114_0 and arg_111_1.var_.actorSpriteComps1056 then
				local var_114_11 = 0.5

				for iter_114_6, iter_114_7 in pairs(arg_111_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_114_7 then
						iter_114_7.color = Color.New(var_114_11, var_114_11, var_114_11)
					end
				end

				arg_111_1.var_.actorSpriteComps1056 = nil
			end

			local var_114_12 = 0
			local var_114_13 = 1.225

			if var_114_12 < arg_111_1.time_ and arg_111_1.time_ <= var_114_12 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, false)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_14 = arg_111_1:GetWordFromCfg(410032028)
				local var_114_15 = arg_111_1:FormatText(var_114_14.content)

				arg_111_1.text_.text = var_114_15

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_16 = 49
				local var_114_17 = utf8.len(var_114_15)
				local var_114_18 = var_114_16 <= 0 and var_114_13 or var_114_13 * (var_114_17 / var_114_16)

				if var_114_18 > 0 and var_114_13 < var_114_18 then
					arg_111_1.talkMaxDuration = var_114_18

					if var_114_18 + var_114_12 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_18 + var_114_12
					end
				end

				arg_111_1.text_.text = var_114_15
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_19 = math.max(var_114_13, arg_111_1.talkMaxDuration)

			if var_114_12 <= arg_111_1.time_ and arg_111_1.time_ < var_114_12 + var_114_19 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_12) / var_114_19

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_12 + var_114_19 and arg_111_1.time_ < var_114_12 + var_114_19 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play410032029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 410032029
		arg_115_1.duration_ = 5.866

		local var_115_0 = {
			zh = 3.866,
			ja = 5.866
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
			arg_115_1.auto_ = false
		end

		function arg_115_1.playNext_(arg_117_0)
			arg_115_1.onStoryFinished_()
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1060"].transform
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.var_.moveOldPos1060 = var_118_0.localPosition
				var_118_0.localScale = Vector3.New(1, 1, 1)

				arg_115_1:CheckSpriteTmpPos("1060", 3)

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
				local var_118_6 = Vector3.New(0, -435, -40)

				var_118_0.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1060, var_118_6, var_118_5)
			end

			if arg_115_1.time_ >= var_118_1 + var_118_4 and arg_115_1.time_ < var_118_1 + var_118_4 + arg_118_0 then
				var_118_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_118_7 = arg_115_1.actors_["1056"].transform
			local var_118_8 = 0

			if var_118_8 < arg_115_1.time_ and arg_115_1.time_ <= var_118_8 + arg_118_0 then
				arg_115_1.var_.moveOldPos1056 = var_118_7.localPosition
				var_118_7.localScale = Vector3.New(1, 1, 1)

				arg_115_1:CheckSpriteTmpPos("1056", 7)

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
				local var_118_13 = Vector3.New(0, -2000, -180)

				var_118_7.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1056, var_118_13, var_118_12)
			end

			if arg_115_1.time_ >= var_118_8 + var_118_11 and arg_115_1.time_ < var_118_8 + var_118_11 + arg_118_0 then
				var_118_7.localPosition = Vector3.New(0, -2000, -180)
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
							local var_118_18 = Mathf.Lerp(iter_118_3.color.r, 1, var_118_17)

							iter_118_3.color = Color.New(var_118_18, var_118_18, var_118_18)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_15 + var_118_16 and arg_115_1.time_ < var_118_15 + var_118_16 + arg_118_0 and arg_115_1.var_.actorSpriteComps1060 then
				local var_118_19 = 1

				for iter_118_4, iter_118_5 in pairs(arg_115_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_118_5 then
						iter_118_5.color = Color.New(var_118_19, var_118_19, var_118_19)
					end
				end

				arg_115_1.var_.actorSpriteComps1060 = nil
			end

			local var_118_20 = arg_115_1.actors_["1056"]
			local var_118_21 = 0

			if var_118_21 < arg_115_1.time_ and arg_115_1.time_ <= var_118_21 + arg_118_0 and arg_115_1.var_.actorSpriteComps1056 == nil then
				arg_115_1.var_.actorSpriteComps1056 = var_118_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_22 = 0.034

			if var_118_21 <= arg_115_1.time_ and arg_115_1.time_ < var_118_21 + var_118_22 then
				local var_118_23 = (arg_115_1.time_ - var_118_21) / var_118_22

				if arg_115_1.var_.actorSpriteComps1056 then
					for iter_118_6, iter_118_7 in pairs(arg_115_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_118_7 then
							local var_118_24 = Mathf.Lerp(iter_118_7.color.r, 0.5, var_118_23)

							iter_118_7.color = Color.New(var_118_24, var_118_24, var_118_24)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_21 + var_118_22 and arg_115_1.time_ < var_118_21 + var_118_22 + arg_118_0 and arg_115_1.var_.actorSpriteComps1056 then
				local var_118_25 = 0.5

				for iter_118_8, iter_118_9 in pairs(arg_115_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_118_9 then
						iter_118_9.color = Color.New(var_118_25, var_118_25, var_118_25)
					end
				end

				arg_115_1.var_.actorSpriteComps1056 = nil
			end

			local var_118_26 = 0
			local var_118_27 = 0.35

			if var_118_26 < arg_115_1.time_ and arg_115_1.time_ <= var_118_26 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_28 = arg_115_1:FormatText(StoryNameCfg[584].name)

				arg_115_1.leftNameTxt_.text = var_118_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_29 = arg_115_1:GetWordFromCfg(410032029)
				local var_118_30 = arg_115_1:FormatText(var_118_29.content)

				arg_115_1.text_.text = var_118_30

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_31 = 14
				local var_118_32 = utf8.len(var_118_30)
				local var_118_33 = var_118_31 <= 0 and var_118_27 or var_118_27 * (var_118_32 / var_118_31)

				if var_118_33 > 0 and var_118_27 < var_118_33 then
					arg_115_1.talkMaxDuration = var_118_33

					if var_118_33 + var_118_26 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_33 + var_118_26
					end
				end

				arg_115_1.text_.text = var_118_30
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410032", "410032029", "story_v_out_410032.awb") ~= 0 then
					local var_118_34 = manager.audio:GetVoiceLength("story_v_out_410032", "410032029", "story_v_out_410032.awb") / 1000

					if var_118_34 + var_118_26 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_34 + var_118_26
					end

					if var_118_29.prefab_name ~= "" and arg_115_1.actors_[var_118_29.prefab_name] ~= nil then
						local var_118_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_29.prefab_name].transform, "story_v_out_410032", "410032029", "story_v_out_410032.awb")

						arg_115_1:RecordAudio("410032029", var_118_35)
						arg_115_1:RecordAudio("410032029", var_118_35)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_410032", "410032029", "story_v_out_410032.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_410032", "410032029", "story_v_out_410032.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_36 = math.max(var_118_27, arg_115_1.talkMaxDuration)

			if var_118_26 <= arg_115_1.time_ and arg_115_1.time_ < var_118_26 + var_118_36 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_26) / var_118_36

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_26 + var_118_36 and arg_115_1.time_ < var_118_26 + var_118_36 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/L01g"
	},
	voices = {
		"story_v_out_410032.awb"
	}
}
