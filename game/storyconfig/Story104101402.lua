return {
	Play410142001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 410142001
		arg_1_1.duration_ = 5

		local var_1_0 = {
			ja = 5,
			CriLanguages = 3.333,
			zh = 3.333
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
				arg_1_0:Play410142002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST61"

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
				local var_4_5 = arg_1_1.bgs_.ST61

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
					if iter_4_0 ~= "ST61" then
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

			local var_4_22 = "1061"

			if arg_1_1.actors_[var_4_22] == nil then
				local var_4_23 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_4_22), arg_1_1.canvasGo_.transform)

				var_4_23.transform:SetSiblingIndex(1)

				var_4_23.name = var_4_22
				var_4_23.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_22] = var_4_23
			end

			local var_4_24 = arg_1_1.actors_["1061"].transform
			local var_4_25 = 2

			if var_4_25 < arg_1_1.time_ and arg_1_1.time_ <= var_4_25 + arg_4_0 then
				arg_1_1.var_.moveOldPos1061 = var_4_24.localPosition
				var_4_24.localScale = Vector3.New(1, 1, 1)

				arg_1_1:CheckSpriteTmpPos("1061", 3)

				local var_4_26 = var_4_24.childCount

				for iter_4_2 = 0, var_4_26 - 1 do
					local var_4_27 = var_4_24:GetChild(iter_4_2)

					if var_4_27.name == "" or not string.find(var_4_27.name, "split") then
						var_4_27.gameObject:SetActive(true)
					else
						var_4_27.gameObject:SetActive(false)
					end
				end
			end

			local var_4_28 = 0.001

			if var_4_25 <= arg_1_1.time_ and arg_1_1.time_ < var_4_25 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_25) / var_4_28
				local var_4_30 = Vector3.New(0, -490, 18)

				var_4_24.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1061, var_4_30, var_4_29)
			end

			if arg_1_1.time_ >= var_4_25 + var_4_28 and arg_1_1.time_ < var_4_25 + var_4_28 + arg_4_0 then
				var_4_24.localPosition = Vector3.New(0, -490, 18)
			end

			local var_4_31 = arg_1_1.actors_["1061"]
			local var_4_32 = 2

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 and arg_1_1.var_.actorSpriteComps1061 == nil then
				arg_1_1.var_.actorSpriteComps1061 = var_4_31:GetComponentsInChildren(typeof(Image), true)
			end

			local var_4_33 = 0.0339999999999998

			if var_4_32 <= arg_1_1.time_ and arg_1_1.time_ < var_4_32 + var_4_33 then
				local var_4_34 = (arg_1_1.time_ - var_4_32) / var_4_33

				if arg_1_1.var_.actorSpriteComps1061 then
					for iter_4_3, iter_4_4 in pairs(arg_1_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_4_4 then
							local var_4_35 = Mathf.Lerp(iter_4_4.color.r, 1, var_4_34)

							iter_4_4.color = Color.New(var_4_35, var_4_35, var_4_35)
						end
					end
				end
			end

			if arg_1_1.time_ >= var_4_32 + var_4_33 and arg_1_1.time_ < var_4_32 + var_4_33 + arg_4_0 and arg_1_1.var_.actorSpriteComps1061 then
				local var_4_36 = 1

				for iter_4_5, iter_4_6 in pairs(arg_1_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_4_6 then
						iter_4_6.color = Color.New(var_4_36, var_4_36, var_4_36)
					end
				end

				arg_1_1.var_.actorSpriteComps1061 = nil
			end

			local var_4_37 = 0
			local var_4_38 = 0.466666666666667

			if var_4_37 < arg_1_1.time_ and arg_1_1.time_ <= var_4_37 + arg_4_0 then
				local var_4_39 = "play"
				local var_4_40 = "music"

				arg_1_1:AudioAction(var_4_39, var_4_40, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_41 = 0.666666666666667
			local var_4_42 = 1

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "music"

				arg_1_1:AudioAction(var_4_43, var_4_44, "bgm_activity_2_8_story_meruism", "bgm_activity_2_8_story_meruism", "bgm_activity_2_8_story_meruism.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_45 = 2
			local var_4_46 = 0.125

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_47 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_47:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_48 = arg_1_1:FormatText(StoryNameCfg[612].name)

				arg_1_1.leftNameTxt_.text = var_4_48

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_49 = arg_1_1:GetWordFromCfg(410142001)
				local var_4_50 = arg_1_1:FormatText(var_4_49.content)

				arg_1_1.text_.text = var_4_50

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_51 = 5
				local var_4_52 = utf8.len(var_4_50)
				local var_4_53 = var_4_51 <= 0 and var_4_46 or var_4_46 * (var_4_52 / var_4_51)

				if var_4_53 > 0 and var_4_46 < var_4_53 then
					arg_1_1.talkMaxDuration = var_4_53
					var_4_45 = var_4_45 + 0.3

					if var_4_53 + var_4_45 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_53 + var_4_45
					end
				end

				arg_1_1.text_.text = var_4_50
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142001", "story_v_out_410142.awb") ~= 0 then
					local var_4_54 = manager.audio:GetVoiceLength("story_v_out_410142", "410142001", "story_v_out_410142.awb") / 1000

					if var_4_54 + var_4_45 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_54 + var_4_45
					end

					if var_4_49.prefab_name ~= "" and arg_1_1.actors_[var_4_49.prefab_name] ~= nil then
						local var_4_55 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_49.prefab_name].transform, "story_v_out_410142", "410142001", "story_v_out_410142.awb")

						arg_1_1:RecordAudio("410142001", var_4_55)
						arg_1_1:RecordAudio("410142001", var_4_55)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_410142", "410142001", "story_v_out_410142.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_410142", "410142001", "story_v_out_410142.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_56 = var_4_45 + 0.3
			local var_4_57 = math.max(var_4_46, arg_1_1.talkMaxDuration)

			if var_4_56 <= arg_1_1.time_ and arg_1_1.time_ < var_4_56 + var_4_57 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_56) / var_4_57

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_56 + var_4_57 and arg_1_1.time_ < var_4_56 + var_4_57 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play410142002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 410142002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play410142003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.466666666666667

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				local var_10_2 = "play"
				local var_10_3 = "effect"

				arg_7_1:AudioAction(var_10_2, var_10_3, "se_story_123_01", "se_story_123_01_map", "")
			end

			local var_10_4 = arg_7_1.actors_["1061"]
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 and arg_7_1.var_.actorSpriteComps1061 == nil then
				arg_7_1.var_.actorSpriteComps1061 = var_10_4:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_6 = 0.034

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6

				if arg_7_1.var_.actorSpriteComps1061 then
					for iter_10_0, iter_10_1 in pairs(arg_7_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_10_1 then
							local var_10_8 = Mathf.Lerp(iter_10_1.color.r, 0.5, var_10_7)

							iter_10_1.color = Color.New(var_10_8, var_10_8, var_10_8)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 and arg_7_1.var_.actorSpriteComps1061 then
				local var_10_9 = 0.5

				for iter_10_2, iter_10_3 in pairs(arg_7_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_10_3 then
						iter_10_3.color = Color.New(var_10_9, var_10_9, var_10_9)
					end
				end

				arg_7_1.var_.actorSpriteComps1061 = nil
			end

			local var_10_10 = 0
			local var_10_11 = 1.1

			if var_10_10 < arg_7_1.time_ and arg_7_1.time_ <= var_10_10 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_12 = arg_7_1:GetWordFromCfg(410142002)
				local var_10_13 = arg_7_1:FormatText(var_10_12.content)

				arg_7_1.text_.text = var_10_13

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_14 = 44
				local var_10_15 = utf8.len(var_10_13)
				local var_10_16 = var_10_14 <= 0 and var_10_11 or var_10_11 * (var_10_15 / var_10_14)

				if var_10_16 > 0 and var_10_11 < var_10_16 then
					arg_7_1.talkMaxDuration = var_10_16

					if var_10_16 + var_10_10 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_16 + var_10_10
					end
				end

				arg_7_1.text_.text = var_10_13
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_17 = math.max(var_10_11, arg_7_1.talkMaxDuration)

			if var_10_10 <= arg_7_1.time_ and arg_7_1.time_ < var_10_10 + var_10_17 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_10) / var_10_17

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_10 + var_10_17 and arg_7_1.time_ < var_10_10 + var_10_17 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play410142003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 410142003
		arg_11_1.duration_ = 17.4

		local var_11_0 = {
			ja = 17.4,
			CriLanguages = 10.1,
			zh = 10.1
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
				arg_11_0:Play410142004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1061"].transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPos1061 = var_14_0.localPosition
				var_14_0.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("1061", 2)

				local var_14_2 = var_14_0.childCount

				for iter_14_0 = 0, var_14_2 - 1 do
					local var_14_3 = var_14_0:GetChild(iter_14_0)

					if var_14_3.name == "" or not string.find(var_14_3.name, "split") then
						var_14_3.gameObject:SetActive(true)
					else
						var_14_3.gameObject:SetActive(false)
					end
				end
			end

			local var_14_4 = 0.001

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_4 then
				local var_14_5 = (arg_11_1.time_ - var_14_1) / var_14_4
				local var_14_6 = Vector3.New(-390, -490, 18)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1061, var_14_6, var_14_5)
			end

			if arg_11_1.time_ >= var_14_1 + var_14_4 and arg_11_1.time_ < var_14_1 + var_14_4 + arg_14_0 then
				var_14_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_14_7 = "1056"

			if arg_11_1.actors_[var_14_7] == nil then
				local var_14_8 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_14_7), arg_11_1.canvasGo_.transform)

				var_14_8.transform:SetSiblingIndex(1)

				var_14_8.name = var_14_7
				var_14_8.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_11_1.actors_[var_14_7] = var_14_8
			end

			local var_14_9 = arg_11_1.actors_["1056"].transform
			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 then
				arg_11_1.var_.moveOldPos1056 = var_14_9.localPosition
				var_14_9.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("1056", 4)

				local var_14_11 = var_14_9.childCount

				for iter_14_1 = 0, var_14_11 - 1 do
					local var_14_12 = var_14_9:GetChild(iter_14_1)

					if var_14_12.name == "" or not string.find(var_14_12.name, "split") then
						var_14_12.gameObject:SetActive(true)
					else
						var_14_12.gameObject:SetActive(false)
					end
				end
			end

			local var_14_13 = 0.001

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_13 then
				local var_14_14 = (arg_11_1.time_ - var_14_10) / var_14_13
				local var_14_15 = Vector3.New(390, -350, -180)

				var_14_9.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1056, var_14_15, var_14_14)
			end

			if arg_11_1.time_ >= var_14_10 + var_14_13 and arg_11_1.time_ < var_14_10 + var_14_13 + arg_14_0 then
				var_14_9.localPosition = Vector3.New(390, -350, -180)
			end

			local var_14_16 = arg_11_1.actors_["1061"]
			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 and arg_11_1.var_.actorSpriteComps1061 == nil then
				arg_11_1.var_.actorSpriteComps1061 = var_14_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_18 = 0.034

			if var_14_17 <= arg_11_1.time_ and arg_11_1.time_ < var_14_17 + var_14_18 then
				local var_14_19 = (arg_11_1.time_ - var_14_17) / var_14_18

				if arg_11_1.var_.actorSpriteComps1061 then
					for iter_14_2, iter_14_3 in pairs(arg_11_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_14_3 then
							local var_14_20 = Mathf.Lerp(iter_14_3.color.r, 1, var_14_19)

							iter_14_3.color = Color.New(var_14_20, var_14_20, var_14_20)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_17 + var_14_18 and arg_11_1.time_ < var_14_17 + var_14_18 + arg_14_0 and arg_11_1.var_.actorSpriteComps1061 then
				local var_14_21 = 1

				for iter_14_4, iter_14_5 in pairs(arg_11_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_14_5 then
						iter_14_5.color = Color.New(var_14_21, var_14_21, var_14_21)
					end
				end

				arg_11_1.var_.actorSpriteComps1061 = nil
			end

			local var_14_22 = arg_11_1.actors_["1056"]
			local var_14_23 = 0

			if var_14_23 < arg_11_1.time_ and arg_11_1.time_ <= var_14_23 + arg_14_0 and arg_11_1.var_.actorSpriteComps1056 == nil then
				arg_11_1.var_.actorSpriteComps1056 = var_14_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_24 = 0.034

			if var_14_23 <= arg_11_1.time_ and arg_11_1.time_ < var_14_23 + var_14_24 then
				local var_14_25 = (arg_11_1.time_ - var_14_23) / var_14_24

				if arg_11_1.var_.actorSpriteComps1056 then
					for iter_14_6, iter_14_7 in pairs(arg_11_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_14_7 then
							local var_14_26 = Mathf.Lerp(iter_14_7.color.r, 0.5, var_14_25)

							iter_14_7.color = Color.New(var_14_26, var_14_26, var_14_26)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_23 + var_14_24 and arg_11_1.time_ < var_14_23 + var_14_24 + arg_14_0 and arg_11_1.var_.actorSpriteComps1056 then
				local var_14_27 = 0.5

				for iter_14_8, iter_14_9 in pairs(arg_11_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_14_9 then
						iter_14_9.color = Color.New(var_14_27, var_14_27, var_14_27)
					end
				end

				arg_11_1.var_.actorSpriteComps1056 = nil
			end

			local var_14_28 = 0
			local var_14_29 = 1.125

			if var_14_28 < arg_11_1.time_ and arg_11_1.time_ <= var_14_28 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_30 = arg_11_1:FormatText(StoryNameCfg[612].name)

				arg_11_1.leftNameTxt_.text = var_14_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_31 = arg_11_1:GetWordFromCfg(410142003)
				local var_14_32 = arg_11_1:FormatText(var_14_31.content)

				arg_11_1.text_.text = var_14_32

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_33 = 45
				local var_14_34 = utf8.len(var_14_32)
				local var_14_35 = var_14_33 <= 0 and var_14_29 or var_14_29 * (var_14_34 / var_14_33)

				if var_14_35 > 0 and var_14_29 < var_14_35 then
					arg_11_1.talkMaxDuration = var_14_35

					if var_14_35 + var_14_28 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_35 + var_14_28
					end
				end

				arg_11_1.text_.text = var_14_32
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142003", "story_v_out_410142.awb") ~= 0 then
					local var_14_36 = manager.audio:GetVoiceLength("story_v_out_410142", "410142003", "story_v_out_410142.awb") / 1000

					if var_14_36 + var_14_28 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_36 + var_14_28
					end

					if var_14_31.prefab_name ~= "" and arg_11_1.actors_[var_14_31.prefab_name] ~= nil then
						local var_14_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_31.prefab_name].transform, "story_v_out_410142", "410142003", "story_v_out_410142.awb")

						arg_11_1:RecordAudio("410142003", var_14_37)
						arg_11_1:RecordAudio("410142003", var_14_37)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_410142", "410142003", "story_v_out_410142.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_410142", "410142003", "story_v_out_410142.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_38 = math.max(var_14_29, arg_11_1.talkMaxDuration)

			if var_14_28 <= arg_11_1.time_ and arg_11_1.time_ < var_14_28 + var_14_38 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_28) / var_14_38

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_28 + var_14_38 and arg_11_1.time_ < var_14_28 + var_14_38 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play410142004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 410142004
		arg_15_1.duration_ = 17.733

		local var_15_0 = {
			ja = 17.733,
			CriLanguages = 7.9,
			zh = 7.9
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
				arg_15_0:Play410142005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1061"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1061 = var_18_0.localPosition
				var_18_0.localScale = Vector3.New(1, 1, 1)

				arg_15_1:CheckSpriteTmpPos("1061", 2)

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
				local var_18_6 = Vector3.New(-390, -490, 18)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1061, var_18_6, var_18_5)
			end

			if arg_15_1.time_ >= var_18_1 + var_18_4 and arg_15_1.time_ < var_18_1 + var_18_4 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_18_7 = arg_15_1.actors_["1061"]
			local var_18_8 = 0

			if var_18_8 < arg_15_1.time_ and arg_15_1.time_ <= var_18_8 + arg_18_0 and arg_15_1.var_.actorSpriteComps1061 == nil then
				arg_15_1.var_.actorSpriteComps1061 = var_18_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_9 = 0.034

			if var_18_8 <= arg_15_1.time_ and arg_15_1.time_ < var_18_8 + var_18_9 then
				local var_18_10 = (arg_15_1.time_ - var_18_8) / var_18_9

				if arg_15_1.var_.actorSpriteComps1061 then
					for iter_18_1, iter_18_2 in pairs(arg_15_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_18_2 then
							local var_18_11 = Mathf.Lerp(iter_18_2.color.r, 1, var_18_10)

							iter_18_2.color = Color.New(var_18_11, var_18_11, var_18_11)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_8 + var_18_9 and arg_15_1.time_ < var_18_8 + var_18_9 + arg_18_0 and arg_15_1.var_.actorSpriteComps1061 then
				local var_18_12 = 1

				for iter_18_3, iter_18_4 in pairs(arg_15_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_18_4 then
						iter_18_4.color = Color.New(var_18_12, var_18_12, var_18_12)
					end
				end

				arg_15_1.var_.actorSpriteComps1061 = nil
			end

			local var_18_13 = 0
			local var_18_14 = 0.925

			if var_18_13 < arg_15_1.time_ and arg_15_1.time_ <= var_18_13 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_15 = arg_15_1:FormatText(StoryNameCfg[612].name)

				arg_15_1.leftNameTxt_.text = var_18_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_16 = arg_15_1:GetWordFromCfg(410142004)
				local var_18_17 = arg_15_1:FormatText(var_18_16.content)

				arg_15_1.text_.text = var_18_17

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_18 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142004", "story_v_out_410142.awb") ~= 0 then
					local var_18_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142004", "story_v_out_410142.awb") / 1000

					if var_18_21 + var_18_13 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_21 + var_18_13
					end

					if var_18_16.prefab_name ~= "" and arg_15_1.actors_[var_18_16.prefab_name] ~= nil then
						local var_18_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_16.prefab_name].transform, "story_v_out_410142", "410142004", "story_v_out_410142.awb")

						arg_15_1:RecordAudio("410142004", var_18_22)
						arg_15_1:RecordAudio("410142004", var_18_22)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_410142", "410142004", "story_v_out_410142.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_410142", "410142004", "story_v_out_410142.awb")
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
	Play410142005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 410142005
		arg_19_1.duration_ = 8.5

		local var_19_0 = {
			ja = 8.5,
			CriLanguages = 4.6,
			zh = 4.6
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
				arg_19_0:Play410142006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1056"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1056 = var_22_0.localPosition
				var_22_0.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("1056", 4)

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
				local var_22_6 = Vector3.New(390, -350, -180)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1056, var_22_6, var_22_5)
			end

			if arg_19_1.time_ >= var_22_1 + var_22_4 and arg_19_1.time_ < var_22_1 + var_22_4 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_22_7 = arg_19_1.actors_["1056"]
			local var_22_8 = 0

			if var_22_8 < arg_19_1.time_ and arg_19_1.time_ <= var_22_8 + arg_22_0 and arg_19_1.var_.actorSpriteComps1056 == nil then
				arg_19_1.var_.actorSpriteComps1056 = var_22_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_9 = 0.034

			if var_22_8 <= arg_19_1.time_ and arg_19_1.time_ < var_22_8 + var_22_9 then
				local var_22_10 = (arg_19_1.time_ - var_22_8) / var_22_9

				if arg_19_1.var_.actorSpriteComps1056 then
					for iter_22_1, iter_22_2 in pairs(arg_19_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_22_2 then
							local var_22_11 = Mathf.Lerp(iter_22_2.color.r, 1, var_22_10)

							iter_22_2.color = Color.New(var_22_11, var_22_11, var_22_11)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_8 + var_22_9 and arg_19_1.time_ < var_22_8 + var_22_9 + arg_22_0 and arg_19_1.var_.actorSpriteComps1056 then
				local var_22_12 = 1

				for iter_22_3, iter_22_4 in pairs(arg_19_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_22_4 then
						iter_22_4.color = Color.New(var_22_12, var_22_12, var_22_12)
					end
				end

				arg_19_1.var_.actorSpriteComps1056 = nil
			end

			local var_22_13 = arg_19_1.actors_["1061"]
			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 and arg_19_1.var_.actorSpriteComps1061 == nil then
				arg_19_1.var_.actorSpriteComps1061 = var_22_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_15 = 0.034

			if var_22_14 <= arg_19_1.time_ and arg_19_1.time_ < var_22_14 + var_22_15 then
				local var_22_16 = (arg_19_1.time_ - var_22_14) / var_22_15

				if arg_19_1.var_.actorSpriteComps1061 then
					for iter_22_5, iter_22_6 in pairs(arg_19_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_22_6 then
							local var_22_17 = Mathf.Lerp(iter_22_6.color.r, 0.5, var_22_16)

							iter_22_6.color = Color.New(var_22_17, var_22_17, var_22_17)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_14 + var_22_15 and arg_19_1.time_ < var_22_14 + var_22_15 + arg_22_0 and arg_19_1.var_.actorSpriteComps1061 then
				local var_22_18 = 0.5

				for iter_22_7, iter_22_8 in pairs(arg_19_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_22_8 then
						iter_22_8.color = Color.New(var_22_18, var_22_18, var_22_18)
					end
				end

				arg_19_1.var_.actorSpriteComps1061 = nil
			end

			local var_22_19 = 0
			local var_22_20 = 0.425

			if var_22_19 < arg_19_1.time_ and arg_19_1.time_ <= var_22_19 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_21 = arg_19_1:FormatText(StoryNameCfg[605].name)

				arg_19_1.leftNameTxt_.text = var_22_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_22 = arg_19_1:GetWordFromCfg(410142005)
				local var_22_23 = arg_19_1:FormatText(var_22_22.content)

				arg_19_1.text_.text = var_22_23

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_24 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142005", "story_v_out_410142.awb") ~= 0 then
					local var_22_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142005", "story_v_out_410142.awb") / 1000

					if var_22_27 + var_22_19 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_27 + var_22_19
					end

					if var_22_22.prefab_name ~= "" and arg_19_1.actors_[var_22_22.prefab_name] ~= nil then
						local var_22_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_22.prefab_name].transform, "story_v_out_410142", "410142005", "story_v_out_410142.awb")

						arg_19_1:RecordAudio("410142005", var_22_28)
						arg_19_1:RecordAudio("410142005", var_22_28)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_410142", "410142005", "story_v_out_410142.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_410142", "410142005", "story_v_out_410142.awb")
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
	Play410142006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 410142006
		arg_23_1.duration_ = 10.3

		local var_23_0 = {
			ja = 10.3,
			CriLanguages = 5.133,
			zh = 5.133
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
				arg_23_0:Play410142007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1061"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1061 = var_26_0.localPosition
				var_26_0.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("1061", 2)

				local var_26_2 = var_26_0.childCount

				for iter_26_0 = 0, var_26_2 - 1 do
					local var_26_3 = var_26_0:GetChild(iter_26_0)

					if var_26_3.name == "split_1" or not string.find(var_26_3.name, "split") then
						var_26_3.gameObject:SetActive(true)
					else
						var_26_3.gameObject:SetActive(false)
					end
				end
			end

			local var_26_4 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_4 then
				local var_26_5 = (arg_23_1.time_ - var_26_1) / var_26_4
				local var_26_6 = Vector3.New(-390, -490, 18)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1061, var_26_6, var_26_5)
			end

			if arg_23_1.time_ >= var_26_1 + var_26_4 and arg_23_1.time_ < var_26_1 + var_26_4 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_26_7 = arg_23_1.actors_["1061"]
			local var_26_8 = 0

			if var_26_8 < arg_23_1.time_ and arg_23_1.time_ <= var_26_8 + arg_26_0 and arg_23_1.var_.actorSpriteComps1061 == nil then
				arg_23_1.var_.actorSpriteComps1061 = var_26_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_9 = 0.034

			if var_26_8 <= arg_23_1.time_ and arg_23_1.time_ < var_26_8 + var_26_9 then
				local var_26_10 = (arg_23_1.time_ - var_26_8) / var_26_9

				if arg_23_1.var_.actorSpriteComps1061 then
					for iter_26_1, iter_26_2 in pairs(arg_23_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_26_2 then
							local var_26_11 = Mathf.Lerp(iter_26_2.color.r, 1, var_26_10)

							iter_26_2.color = Color.New(var_26_11, var_26_11, var_26_11)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_8 + var_26_9 and arg_23_1.time_ < var_26_8 + var_26_9 + arg_26_0 and arg_23_1.var_.actorSpriteComps1061 then
				local var_26_12 = 1

				for iter_26_3, iter_26_4 in pairs(arg_23_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_26_4 then
						iter_26_4.color = Color.New(var_26_12, var_26_12, var_26_12)
					end
				end

				arg_23_1.var_.actorSpriteComps1061 = nil
			end

			local var_26_13 = arg_23_1.actors_["1056"]
			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 and arg_23_1.var_.actorSpriteComps1056 == nil then
				arg_23_1.var_.actorSpriteComps1056 = var_26_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_15 = 0.034

			if var_26_14 <= arg_23_1.time_ and arg_23_1.time_ < var_26_14 + var_26_15 then
				local var_26_16 = (arg_23_1.time_ - var_26_14) / var_26_15

				if arg_23_1.var_.actorSpriteComps1056 then
					for iter_26_5, iter_26_6 in pairs(arg_23_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_26_6 then
							local var_26_17 = Mathf.Lerp(iter_26_6.color.r, 0.5, var_26_16)

							iter_26_6.color = Color.New(var_26_17, var_26_17, var_26_17)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_14 + var_26_15 and arg_23_1.time_ < var_26_14 + var_26_15 + arg_26_0 and arg_23_1.var_.actorSpriteComps1056 then
				local var_26_18 = 0.5

				for iter_26_7, iter_26_8 in pairs(arg_23_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_26_8 then
						iter_26_8.color = Color.New(var_26_18, var_26_18, var_26_18)
					end
				end

				arg_23_1.var_.actorSpriteComps1056 = nil
			end

			local var_26_19 = 0
			local var_26_20 = 0.55

			if var_26_19 < arg_23_1.time_ and arg_23_1.time_ <= var_26_19 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_21 = arg_23_1:FormatText(StoryNameCfg[612].name)

				arg_23_1.leftNameTxt_.text = var_26_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_22 = arg_23_1:GetWordFromCfg(410142006)
				local var_26_23 = arg_23_1:FormatText(var_26_22.content)

				arg_23_1.text_.text = var_26_23

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_24 = 22
				local var_26_25 = utf8.len(var_26_23)
				local var_26_26 = var_26_24 <= 0 and var_26_20 or var_26_20 * (var_26_25 / var_26_24)

				if var_26_26 > 0 and var_26_20 < var_26_26 then
					arg_23_1.talkMaxDuration = var_26_26

					if var_26_26 + var_26_19 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_26 + var_26_19
					end
				end

				arg_23_1.text_.text = var_26_23
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142006", "story_v_out_410142.awb") ~= 0 then
					local var_26_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142006", "story_v_out_410142.awb") / 1000

					if var_26_27 + var_26_19 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_27 + var_26_19
					end

					if var_26_22.prefab_name ~= "" and arg_23_1.actors_[var_26_22.prefab_name] ~= nil then
						local var_26_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_22.prefab_name].transform, "story_v_out_410142", "410142006", "story_v_out_410142.awb")

						arg_23_1:RecordAudio("410142006", var_26_28)
						arg_23_1:RecordAudio("410142006", var_26_28)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_410142", "410142006", "story_v_out_410142.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_410142", "410142006", "story_v_out_410142.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_29 = math.max(var_26_20, arg_23_1.talkMaxDuration)

			if var_26_19 <= arg_23_1.time_ and arg_23_1.time_ < var_26_19 + var_26_29 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_19) / var_26_29

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_19 + var_26_29 and arg_23_1.time_ < var_26_19 + var_26_29 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play410142007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 410142007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play410142008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1056"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1056 = var_30_0.localPosition
				var_30_0.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("1056", 7)

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
				local var_30_6 = Vector3.New(0, -2000, -180)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1056, var_30_6, var_30_5)
			end

			if arg_27_1.time_ >= var_30_1 + var_30_4 and arg_27_1.time_ < var_30_1 + var_30_4 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_30_7 = arg_27_1.actors_["1061"].transform
			local var_30_8 = 0

			if var_30_8 < arg_27_1.time_ and arg_27_1.time_ <= var_30_8 + arg_30_0 then
				arg_27_1.var_.moveOldPos1061 = var_30_7.localPosition
				var_30_7.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("1061", 7)

				local var_30_9 = var_30_7.childCount

				for iter_30_1 = 0, var_30_9 - 1 do
					local var_30_10 = var_30_7:GetChild(iter_30_1)

					if var_30_10.name == "" or not string.find(var_30_10.name, "split") then
						var_30_10.gameObject:SetActive(true)
					else
						var_30_10.gameObject:SetActive(false)
					end
				end
			end

			local var_30_11 = 0.001

			if var_30_8 <= arg_27_1.time_ and arg_27_1.time_ < var_30_8 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_8) / var_30_11
				local var_30_13 = Vector3.New(0, -2000, 18)

				var_30_7.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1061, var_30_13, var_30_12)
			end

			if arg_27_1.time_ >= var_30_8 + var_30_11 and arg_27_1.time_ < var_30_8 + var_30_11 + arg_30_0 then
				var_30_7.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_30_14 = arg_27_1.actors_["1056"]
			local var_30_15 = 0

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 and arg_27_1.var_.actorSpriteComps1056 == nil then
				arg_27_1.var_.actorSpriteComps1056 = var_30_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_16 = 0.034

			if var_30_15 <= arg_27_1.time_ and arg_27_1.time_ < var_30_15 + var_30_16 then
				local var_30_17 = (arg_27_1.time_ - var_30_15) / var_30_16

				if arg_27_1.var_.actorSpriteComps1056 then
					for iter_30_2, iter_30_3 in pairs(arg_27_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_30_3 then
							local var_30_18 = Mathf.Lerp(iter_30_3.color.r, 0.5, var_30_17)

							iter_30_3.color = Color.New(var_30_18, var_30_18, var_30_18)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_15 + var_30_16 and arg_27_1.time_ < var_30_15 + var_30_16 + arg_30_0 and arg_27_1.var_.actorSpriteComps1056 then
				local var_30_19 = 0.5

				for iter_30_4, iter_30_5 in pairs(arg_27_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_30_5 then
						iter_30_5.color = Color.New(var_30_19, var_30_19, var_30_19)
					end
				end

				arg_27_1.var_.actorSpriteComps1056 = nil
			end

			local var_30_20 = arg_27_1.actors_["1061"]
			local var_30_21 = 0

			if var_30_21 < arg_27_1.time_ and arg_27_1.time_ <= var_30_21 + arg_30_0 and arg_27_1.var_.actorSpriteComps1061 == nil then
				arg_27_1.var_.actorSpriteComps1061 = var_30_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_22 = 0.034

			if var_30_21 <= arg_27_1.time_ and arg_27_1.time_ < var_30_21 + var_30_22 then
				local var_30_23 = (arg_27_1.time_ - var_30_21) / var_30_22

				if arg_27_1.var_.actorSpriteComps1061 then
					for iter_30_6, iter_30_7 in pairs(arg_27_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_30_7 then
							local var_30_24 = Mathf.Lerp(iter_30_7.color.r, 0.5, var_30_23)

							iter_30_7.color = Color.New(var_30_24, var_30_24, var_30_24)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_21 + var_30_22 and arg_27_1.time_ < var_30_21 + var_30_22 + arg_30_0 and arg_27_1.var_.actorSpriteComps1061 then
				local var_30_25 = 0.5

				for iter_30_8, iter_30_9 in pairs(arg_27_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_30_9 then
						iter_30_9.color = Color.New(var_30_25, var_30_25, var_30_25)
					end
				end

				arg_27_1.var_.actorSpriteComps1061 = nil
			end

			local var_30_26 = 0
			local var_30_27 = 0.975

			if var_30_26 < arg_27_1.time_ and arg_27_1.time_ <= var_30_26 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_28 = arg_27_1:GetWordFromCfg(410142007)
				local var_30_29 = arg_27_1:FormatText(var_30_28.content)

				arg_27_1.text_.text = var_30_29

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_30 = 39
				local var_30_31 = utf8.len(var_30_29)
				local var_30_32 = var_30_30 <= 0 and var_30_27 or var_30_27 * (var_30_31 / var_30_30)

				if var_30_32 > 0 and var_30_27 < var_30_32 then
					arg_27_1.talkMaxDuration = var_30_32

					if var_30_32 + var_30_26 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_32 + var_30_26
					end
				end

				arg_27_1.text_.text = var_30_29
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_33 = math.max(var_30_27, arg_27_1.talkMaxDuration)

			if var_30_26 <= arg_27_1.time_ and arg_27_1.time_ < var_30_26 + var_30_33 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_26) / var_30_33

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_26 + var_30_33 and arg_27_1.time_ < var_30_26 + var_30_33 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play410142008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 410142008
		arg_31_1.duration_ = 6.9

		local var_31_0 = {
			ja = 6.9,
			CriLanguages = 5.666,
			zh = 5.666
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
				arg_31_0:Play410142009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1061"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1061 = var_34_0.localPosition
				var_34_0.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("1061", 3)

				local var_34_2 = var_34_0.childCount

				for iter_34_0 = 0, var_34_2 - 1 do
					local var_34_3 = var_34_0:GetChild(iter_34_0)

					if var_34_3.name == "split_2" or not string.find(var_34_3.name, "split") then
						var_34_3.gameObject:SetActive(true)
					else
						var_34_3.gameObject:SetActive(false)
					end
				end
			end

			local var_34_4 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_4 then
				local var_34_5 = (arg_31_1.time_ - var_34_1) / var_34_4
				local var_34_6 = Vector3.New(0, -490, 18)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1061, var_34_6, var_34_5)
			end

			if arg_31_1.time_ >= var_34_1 + var_34_4 and arg_31_1.time_ < var_34_1 + var_34_4 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_34_7 = arg_31_1.actors_["1061"]
			local var_34_8 = 0

			if var_34_8 < arg_31_1.time_ and arg_31_1.time_ <= var_34_8 + arg_34_0 and arg_31_1.var_.actorSpriteComps1061 == nil then
				arg_31_1.var_.actorSpriteComps1061 = var_34_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_9 = 0.034

			if var_34_8 <= arg_31_1.time_ and arg_31_1.time_ < var_34_8 + var_34_9 then
				local var_34_10 = (arg_31_1.time_ - var_34_8) / var_34_9

				if arg_31_1.var_.actorSpriteComps1061 then
					for iter_34_1, iter_34_2 in pairs(arg_31_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_34_2 then
							local var_34_11 = Mathf.Lerp(iter_34_2.color.r, 1, var_34_10)

							iter_34_2.color = Color.New(var_34_11, var_34_11, var_34_11)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_8 + var_34_9 and arg_31_1.time_ < var_34_8 + var_34_9 + arg_34_0 and arg_31_1.var_.actorSpriteComps1061 then
				local var_34_12 = 1

				for iter_34_3, iter_34_4 in pairs(arg_31_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_34_4 then
						iter_34_4.color = Color.New(var_34_12, var_34_12, var_34_12)
					end
				end

				arg_31_1.var_.actorSpriteComps1061 = nil
			end

			local var_34_13 = 0
			local var_34_14 = 0.475

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_15 = arg_31_1:FormatText(StoryNameCfg[612].name)

				arg_31_1.leftNameTxt_.text = var_34_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_16 = arg_31_1:GetWordFromCfg(410142008)
				local var_34_17 = arg_31_1:FormatText(var_34_16.content)

				arg_31_1.text_.text = var_34_17

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_18 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142008", "story_v_out_410142.awb") ~= 0 then
					local var_34_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142008", "story_v_out_410142.awb") / 1000

					if var_34_21 + var_34_13 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_21 + var_34_13
					end

					if var_34_16.prefab_name ~= "" and arg_31_1.actors_[var_34_16.prefab_name] ~= nil then
						local var_34_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_16.prefab_name].transform, "story_v_out_410142", "410142008", "story_v_out_410142.awb")

						arg_31_1:RecordAudio("410142008", var_34_22)
						arg_31_1:RecordAudio("410142008", var_34_22)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_410142", "410142008", "story_v_out_410142.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_410142", "410142008", "story_v_out_410142.awb")
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
	Play410142009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 410142009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play410142010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1061"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.actorSpriteComps1061 == nil then
				arg_35_1.var_.actorSpriteComps1061 = var_38_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_2 = 0.034

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.actorSpriteComps1061 then
					for iter_38_0, iter_38_1 in pairs(arg_35_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_38_1 then
							local var_38_4 = Mathf.Lerp(iter_38_1.color.r, 0.5, var_38_3)

							iter_38_1.color = Color.New(var_38_4, var_38_4, var_38_4)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.actorSpriteComps1061 then
				local var_38_5 = 0.5

				for iter_38_2, iter_38_3 in pairs(arg_35_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_38_3 then
						iter_38_3.color = Color.New(var_38_5, var_38_5, var_38_5)
					end
				end

				arg_35_1.var_.actorSpriteComps1061 = nil
			end

			local var_38_6 = 0
			local var_38_7 = 1.275

			if var_38_6 < arg_35_1.time_ and arg_35_1.time_ <= var_38_6 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_8 = arg_35_1:GetWordFromCfg(410142009)
				local var_38_9 = arg_35_1:FormatText(var_38_8.content)

				arg_35_1.text_.text = var_38_9

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_10 = 51
				local var_38_11 = utf8.len(var_38_9)
				local var_38_12 = var_38_10 <= 0 and var_38_7 or var_38_7 * (var_38_11 / var_38_10)

				if var_38_12 > 0 and var_38_7 < var_38_12 then
					arg_35_1.talkMaxDuration = var_38_12

					if var_38_12 + var_38_6 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_12 + var_38_6
					end
				end

				arg_35_1.text_.text = var_38_9
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_13 = math.max(var_38_7, arg_35_1.talkMaxDuration)

			if var_38_6 <= arg_35_1.time_ and arg_35_1.time_ < var_38_6 + var_38_13 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_6) / var_38_13

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_6 + var_38_13 and arg_35_1.time_ < var_38_6 + var_38_13 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play410142010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 410142010
		arg_39_1.duration_ = 6.566

		local var_39_0 = {
			ja = 6.566,
			CriLanguages = 2.5,
			zh = 2.5
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
				arg_39_0:Play410142011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1061"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1061 = var_42_0.localPosition
				var_42_0.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("1061", 2)

				local var_42_2 = var_42_0.childCount

				for iter_42_0 = 0, var_42_2 - 1 do
					local var_42_3 = var_42_0:GetChild(iter_42_0)

					if var_42_3.name == "split_5" or not string.find(var_42_3.name, "split") then
						var_42_3.gameObject:SetActive(true)
					else
						var_42_3.gameObject:SetActive(false)
					end
				end
			end

			local var_42_4 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_4 then
				local var_42_5 = (arg_39_1.time_ - var_42_1) / var_42_4
				local var_42_6 = Vector3.New(-390, -490, 18)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1061, var_42_6, var_42_5)
			end

			if arg_39_1.time_ >= var_42_1 + var_42_4 and arg_39_1.time_ < var_42_1 + var_42_4 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_42_7 = arg_39_1.actors_["1056"].transform
			local var_42_8 = 0

			if var_42_8 < arg_39_1.time_ and arg_39_1.time_ <= var_42_8 + arg_42_0 then
				arg_39_1.var_.moveOldPos1056 = var_42_7.localPosition
				var_42_7.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("1056", 4)

				local var_42_9 = var_42_7.childCount

				for iter_42_1 = 0, var_42_9 - 1 do
					local var_42_10 = var_42_7:GetChild(iter_42_1)

					if var_42_10.name == "" or not string.find(var_42_10.name, "split") then
						var_42_10.gameObject:SetActive(true)
					else
						var_42_10.gameObject:SetActive(false)
					end
				end
			end

			local var_42_11 = 0.001

			if var_42_8 <= arg_39_1.time_ and arg_39_1.time_ < var_42_8 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_8) / var_42_11
				local var_42_13 = Vector3.New(390, -350, -180)

				var_42_7.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1056, var_42_13, var_42_12)
			end

			if arg_39_1.time_ >= var_42_8 + var_42_11 and arg_39_1.time_ < var_42_8 + var_42_11 + arg_42_0 then
				var_42_7.localPosition = Vector3.New(390, -350, -180)
			end

			local var_42_14 = arg_39_1.actors_["1061"]
			local var_42_15 = 0

			if var_42_15 < arg_39_1.time_ and arg_39_1.time_ <= var_42_15 + arg_42_0 and arg_39_1.var_.actorSpriteComps1061 == nil then
				arg_39_1.var_.actorSpriteComps1061 = var_42_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_16 = 0.034

			if var_42_15 <= arg_39_1.time_ and arg_39_1.time_ < var_42_15 + var_42_16 then
				local var_42_17 = (arg_39_1.time_ - var_42_15) / var_42_16

				if arg_39_1.var_.actorSpriteComps1061 then
					for iter_42_2, iter_42_3 in pairs(arg_39_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_42_3 then
							local var_42_18 = Mathf.Lerp(iter_42_3.color.r, 1, var_42_17)

							iter_42_3.color = Color.New(var_42_18, var_42_18, var_42_18)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_15 + var_42_16 and arg_39_1.time_ < var_42_15 + var_42_16 + arg_42_0 and arg_39_1.var_.actorSpriteComps1061 then
				local var_42_19 = 1

				for iter_42_4, iter_42_5 in pairs(arg_39_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_42_5 then
						iter_42_5.color = Color.New(var_42_19, var_42_19, var_42_19)
					end
				end

				arg_39_1.var_.actorSpriteComps1061 = nil
			end

			local var_42_20 = arg_39_1.actors_["1056"]
			local var_42_21 = 0

			if var_42_21 < arg_39_1.time_ and arg_39_1.time_ <= var_42_21 + arg_42_0 and arg_39_1.var_.actorSpriteComps1056 == nil then
				arg_39_1.var_.actorSpriteComps1056 = var_42_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_22 = 0.034

			if var_42_21 <= arg_39_1.time_ and arg_39_1.time_ < var_42_21 + var_42_22 then
				local var_42_23 = (arg_39_1.time_ - var_42_21) / var_42_22

				if arg_39_1.var_.actorSpriteComps1056 then
					for iter_42_6, iter_42_7 in pairs(arg_39_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_42_7 then
							local var_42_24 = Mathf.Lerp(iter_42_7.color.r, 0.5, var_42_23)

							iter_42_7.color = Color.New(var_42_24, var_42_24, var_42_24)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_21 + var_42_22 and arg_39_1.time_ < var_42_21 + var_42_22 + arg_42_0 and arg_39_1.var_.actorSpriteComps1056 then
				local var_42_25 = 0.5

				for iter_42_8, iter_42_9 in pairs(arg_39_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_42_9 then
						iter_42_9.color = Color.New(var_42_25, var_42_25, var_42_25)
					end
				end

				arg_39_1.var_.actorSpriteComps1056 = nil
			end

			local var_42_26 = 0
			local var_42_27 = 0.325

			if var_42_26 < arg_39_1.time_ and arg_39_1.time_ <= var_42_26 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_28 = arg_39_1:FormatText(StoryNameCfg[612].name)

				arg_39_1.leftNameTxt_.text = var_42_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_29 = arg_39_1:GetWordFromCfg(410142010)
				local var_42_30 = arg_39_1:FormatText(var_42_29.content)

				arg_39_1.text_.text = var_42_30

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_31 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142010", "story_v_out_410142.awb") ~= 0 then
					local var_42_34 = manager.audio:GetVoiceLength("story_v_out_410142", "410142010", "story_v_out_410142.awb") / 1000

					if var_42_34 + var_42_26 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_34 + var_42_26
					end

					if var_42_29.prefab_name ~= "" and arg_39_1.actors_[var_42_29.prefab_name] ~= nil then
						local var_42_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_29.prefab_name].transform, "story_v_out_410142", "410142010", "story_v_out_410142.awb")

						arg_39_1:RecordAudio("410142010", var_42_35)
						arg_39_1:RecordAudio("410142010", var_42_35)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_410142", "410142010", "story_v_out_410142.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_410142", "410142010", "story_v_out_410142.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_36 = math.max(var_42_27, arg_39_1.talkMaxDuration)

			if var_42_26 <= arg_39_1.time_ and arg_39_1.time_ < var_42_26 + var_42_36 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_26) / var_42_36

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_26 + var_42_36 and arg_39_1.time_ < var_42_26 + var_42_36 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play410142011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 410142011
		arg_43_1.duration_ = 3.833

		local var_43_0 = {
			ja = 3.833,
			CriLanguages = 1.766,
			zh = 1.766
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
				arg_43_0:Play410142012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1056"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1056 = var_46_0.localPosition
				var_46_0.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("1056", 4)

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
				local var_46_6 = Vector3.New(390, -350, -180)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1056, var_46_6, var_46_5)
			end

			if arg_43_1.time_ >= var_46_1 + var_46_4 and arg_43_1.time_ < var_46_1 + var_46_4 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_46_7 = arg_43_1.actors_["1056"]
			local var_46_8 = 0

			if var_46_8 < arg_43_1.time_ and arg_43_1.time_ <= var_46_8 + arg_46_0 and arg_43_1.var_.actorSpriteComps1056 == nil then
				arg_43_1.var_.actorSpriteComps1056 = var_46_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_9 = 0.034

			if var_46_8 <= arg_43_1.time_ and arg_43_1.time_ < var_46_8 + var_46_9 then
				local var_46_10 = (arg_43_1.time_ - var_46_8) / var_46_9

				if arg_43_1.var_.actorSpriteComps1056 then
					for iter_46_1, iter_46_2 in pairs(arg_43_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_46_2 then
							local var_46_11 = Mathf.Lerp(iter_46_2.color.r, 1, var_46_10)

							iter_46_2.color = Color.New(var_46_11, var_46_11, var_46_11)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_8 + var_46_9 and arg_43_1.time_ < var_46_8 + var_46_9 + arg_46_0 and arg_43_1.var_.actorSpriteComps1056 then
				local var_46_12 = 1

				for iter_46_3, iter_46_4 in pairs(arg_43_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_46_4 then
						iter_46_4.color = Color.New(var_46_12, var_46_12, var_46_12)
					end
				end

				arg_43_1.var_.actorSpriteComps1056 = nil
			end

			local var_46_13 = arg_43_1.actors_["1061"]
			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 and arg_43_1.var_.actorSpriteComps1061 == nil then
				arg_43_1.var_.actorSpriteComps1061 = var_46_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_15 = 0.034

			if var_46_14 <= arg_43_1.time_ and arg_43_1.time_ < var_46_14 + var_46_15 then
				local var_46_16 = (arg_43_1.time_ - var_46_14) / var_46_15

				if arg_43_1.var_.actorSpriteComps1061 then
					for iter_46_5, iter_46_6 in pairs(arg_43_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_46_6 then
							local var_46_17 = Mathf.Lerp(iter_46_6.color.r, 0.5, var_46_16)

							iter_46_6.color = Color.New(var_46_17, var_46_17, var_46_17)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_14 + var_46_15 and arg_43_1.time_ < var_46_14 + var_46_15 + arg_46_0 and arg_43_1.var_.actorSpriteComps1061 then
				local var_46_18 = 0.5

				for iter_46_7, iter_46_8 in pairs(arg_43_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_46_8 then
						iter_46_8.color = Color.New(var_46_18, var_46_18, var_46_18)
					end
				end

				arg_43_1.var_.actorSpriteComps1061 = nil
			end

			local var_46_19 = 0
			local var_46_20 = 0.2

			if var_46_19 < arg_43_1.time_ and arg_43_1.time_ <= var_46_19 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_21 = arg_43_1:FormatText(StoryNameCfg[605].name)

				arg_43_1.leftNameTxt_.text = var_46_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_22 = arg_43_1:GetWordFromCfg(410142011)
				local var_46_23 = arg_43_1:FormatText(var_46_22.content)

				arg_43_1.text_.text = var_46_23

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_24 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142011", "story_v_out_410142.awb") ~= 0 then
					local var_46_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142011", "story_v_out_410142.awb") / 1000

					if var_46_27 + var_46_19 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_27 + var_46_19
					end

					if var_46_22.prefab_name ~= "" and arg_43_1.actors_[var_46_22.prefab_name] ~= nil then
						local var_46_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_22.prefab_name].transform, "story_v_out_410142", "410142011", "story_v_out_410142.awb")

						arg_43_1:RecordAudio("410142011", var_46_28)
						arg_43_1:RecordAudio("410142011", var_46_28)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_410142", "410142011", "story_v_out_410142.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_410142", "410142011", "story_v_out_410142.awb")
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
	Play410142012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 410142012
		arg_47_1.duration_ = 7.666

		local var_47_0 = {
			ja = 1.333,
			CriLanguages = 7.666,
			zh = 7.666
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
				arg_47_0:Play410142013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1061"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1061 = var_50_0.localPosition
				var_50_0.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("1061", 2)

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
				local var_50_6 = Vector3.New(-390, -490, 18)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1061, var_50_6, var_50_5)
			end

			if arg_47_1.time_ >= var_50_1 + var_50_4 and arg_47_1.time_ < var_50_1 + var_50_4 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_50_7 = arg_47_1.actors_["1061"]
			local var_50_8 = 0

			if var_50_8 < arg_47_1.time_ and arg_47_1.time_ <= var_50_8 + arg_50_0 and arg_47_1.var_.actorSpriteComps1061 == nil then
				arg_47_1.var_.actorSpriteComps1061 = var_50_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_9 = 0.034

			if var_50_8 <= arg_47_1.time_ and arg_47_1.time_ < var_50_8 + var_50_9 then
				local var_50_10 = (arg_47_1.time_ - var_50_8) / var_50_9

				if arg_47_1.var_.actorSpriteComps1061 then
					for iter_50_1, iter_50_2 in pairs(arg_47_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_50_2 then
							local var_50_11 = Mathf.Lerp(iter_50_2.color.r, 1, var_50_10)

							iter_50_2.color = Color.New(var_50_11, var_50_11, var_50_11)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_8 + var_50_9 and arg_47_1.time_ < var_50_8 + var_50_9 + arg_50_0 and arg_47_1.var_.actorSpriteComps1061 then
				local var_50_12 = 1

				for iter_50_3, iter_50_4 in pairs(arg_47_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_50_4 then
						iter_50_4.color = Color.New(var_50_12, var_50_12, var_50_12)
					end
				end

				arg_47_1.var_.actorSpriteComps1061 = nil
			end

			local var_50_13 = arg_47_1.actors_["1056"]
			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 and arg_47_1.var_.actorSpriteComps1056 == nil then
				arg_47_1.var_.actorSpriteComps1056 = var_50_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_15 = 0.034

			if var_50_14 <= arg_47_1.time_ and arg_47_1.time_ < var_50_14 + var_50_15 then
				local var_50_16 = (arg_47_1.time_ - var_50_14) / var_50_15

				if arg_47_1.var_.actorSpriteComps1056 then
					for iter_50_5, iter_50_6 in pairs(arg_47_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_50_6 then
							local var_50_17 = Mathf.Lerp(iter_50_6.color.r, 0.5, var_50_16)

							iter_50_6.color = Color.New(var_50_17, var_50_17, var_50_17)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_14 + var_50_15 and arg_47_1.time_ < var_50_14 + var_50_15 + arg_50_0 and arg_47_1.var_.actorSpriteComps1056 then
				local var_50_18 = 0.5

				for iter_50_7, iter_50_8 in pairs(arg_47_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_50_8 then
						iter_50_8.color = Color.New(var_50_18, var_50_18, var_50_18)
					end
				end

				arg_47_1.var_.actorSpriteComps1056 = nil
			end

			local var_50_19 = 0
			local var_50_20 = 0.05

			if var_50_19 < arg_47_1.time_ and arg_47_1.time_ <= var_50_19 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_21 = arg_47_1:FormatText(StoryNameCfg[612].name)

				arg_47_1.leftNameTxt_.text = var_50_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_22 = arg_47_1:GetWordFromCfg(410142012)
				local var_50_23 = arg_47_1:FormatText(var_50_22.content)

				arg_47_1.text_.text = var_50_23

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_24 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142012", "story_v_out_410142.awb") ~= 0 then
					local var_50_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142012", "story_v_out_410142.awb") / 1000

					if var_50_27 + var_50_19 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_27 + var_50_19
					end

					if var_50_22.prefab_name ~= "" and arg_47_1.actors_[var_50_22.prefab_name] ~= nil then
						local var_50_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_22.prefab_name].transform, "story_v_out_410142", "410142012", "story_v_out_410142.awb")

						arg_47_1:RecordAudio("410142012", var_50_28)
						arg_47_1:RecordAudio("410142012", var_50_28)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_410142", "410142012", "story_v_out_410142.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_410142", "410142012", "story_v_out_410142.awb")
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
	Play410142013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 410142013
		arg_51_1.duration_ = 2.766

		local var_51_0 = {
			ja = 2.766,
			CriLanguages = 2.633,
			zh = 2.633
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
				arg_51_0:Play410142014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1056"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1056 = var_54_0.localPosition
				var_54_0.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("1056", 4)

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
				local var_54_6 = Vector3.New(390, -350, -180)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1056, var_54_6, var_54_5)
			end

			if arg_51_1.time_ >= var_54_1 + var_54_4 and arg_51_1.time_ < var_54_1 + var_54_4 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_54_7 = arg_51_1.actors_["1056"]
			local var_54_8 = 0

			if var_54_8 < arg_51_1.time_ and arg_51_1.time_ <= var_54_8 + arg_54_0 and arg_51_1.var_.actorSpriteComps1056 == nil then
				arg_51_1.var_.actorSpriteComps1056 = var_54_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_9 = 0.034

			if var_54_8 <= arg_51_1.time_ and arg_51_1.time_ < var_54_8 + var_54_9 then
				local var_54_10 = (arg_51_1.time_ - var_54_8) / var_54_9

				if arg_51_1.var_.actorSpriteComps1056 then
					for iter_54_1, iter_54_2 in pairs(arg_51_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_54_2 then
							local var_54_11 = Mathf.Lerp(iter_54_2.color.r, 1, var_54_10)

							iter_54_2.color = Color.New(var_54_11, var_54_11, var_54_11)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_8 + var_54_9 and arg_51_1.time_ < var_54_8 + var_54_9 + arg_54_0 and arg_51_1.var_.actorSpriteComps1056 then
				local var_54_12 = 1

				for iter_54_3, iter_54_4 in pairs(arg_51_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_54_4 then
						iter_54_4.color = Color.New(var_54_12, var_54_12, var_54_12)
					end
				end

				arg_51_1.var_.actorSpriteComps1056 = nil
			end

			local var_54_13 = arg_51_1.actors_["1061"]
			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 and arg_51_1.var_.actorSpriteComps1061 == nil then
				arg_51_1.var_.actorSpriteComps1061 = var_54_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_15 = 0.034

			if var_54_14 <= arg_51_1.time_ and arg_51_1.time_ < var_54_14 + var_54_15 then
				local var_54_16 = (arg_51_1.time_ - var_54_14) / var_54_15

				if arg_51_1.var_.actorSpriteComps1061 then
					for iter_54_5, iter_54_6 in pairs(arg_51_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_54_6 then
							local var_54_17 = Mathf.Lerp(iter_54_6.color.r, 0.5, var_54_16)

							iter_54_6.color = Color.New(var_54_17, var_54_17, var_54_17)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_14 + var_54_15 and arg_51_1.time_ < var_54_14 + var_54_15 + arg_54_0 and arg_51_1.var_.actorSpriteComps1061 then
				local var_54_18 = 0.5

				for iter_54_7, iter_54_8 in pairs(arg_51_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_54_8 then
						iter_54_8.color = Color.New(var_54_18, var_54_18, var_54_18)
					end
				end

				arg_51_1.var_.actorSpriteComps1061 = nil
			end

			local var_54_19 = 0
			local var_54_20 = 0.35

			if var_54_19 < arg_51_1.time_ and arg_51_1.time_ <= var_54_19 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_21 = arg_51_1:FormatText(StoryNameCfg[605].name)

				arg_51_1.leftNameTxt_.text = var_54_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_22 = arg_51_1:GetWordFromCfg(410142013)
				local var_54_23 = arg_51_1:FormatText(var_54_22.content)

				arg_51_1.text_.text = var_54_23

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_24 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142013", "story_v_out_410142.awb") ~= 0 then
					local var_54_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142013", "story_v_out_410142.awb") / 1000

					if var_54_27 + var_54_19 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_27 + var_54_19
					end

					if var_54_22.prefab_name ~= "" and arg_51_1.actors_[var_54_22.prefab_name] ~= nil then
						local var_54_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_22.prefab_name].transform, "story_v_out_410142", "410142013", "story_v_out_410142.awb")

						arg_51_1:RecordAudio("410142013", var_54_28)
						arg_51_1:RecordAudio("410142013", var_54_28)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_410142", "410142013", "story_v_out_410142.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_410142", "410142013", "story_v_out_410142.awb")
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
	Play410142014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 410142014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play410142015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1056"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.actorSpriteComps1056 == nil then
				arg_55_1.var_.actorSpriteComps1056 = var_58_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_2 = 0.034

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.actorSpriteComps1056 then
					for iter_58_0, iter_58_1 in pairs(arg_55_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_58_1 then
							local var_58_4 = Mathf.Lerp(iter_58_1.color.r, 0.5, var_58_3)

							iter_58_1.color = Color.New(var_58_4, var_58_4, var_58_4)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.actorSpriteComps1056 then
				local var_58_5 = 0.5

				for iter_58_2, iter_58_3 in pairs(arg_55_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_58_3 then
						iter_58_3.color = Color.New(var_58_5, var_58_5, var_58_5)
					end
				end

				arg_55_1.var_.actorSpriteComps1056 = nil
			end

			local var_58_6 = arg_55_1.actors_["1061"]
			local var_58_7 = 0

			if var_58_7 < arg_55_1.time_ and arg_55_1.time_ <= var_58_7 + arg_58_0 and arg_55_1.var_.actorSpriteComps1061 == nil then
				arg_55_1.var_.actorSpriteComps1061 = var_58_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_8 = 0.034

			if var_58_7 <= arg_55_1.time_ and arg_55_1.time_ < var_58_7 + var_58_8 then
				local var_58_9 = (arg_55_1.time_ - var_58_7) / var_58_8

				if arg_55_1.var_.actorSpriteComps1061 then
					for iter_58_4, iter_58_5 in pairs(arg_55_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_58_5 then
							local var_58_10 = Mathf.Lerp(iter_58_5.color.r, 0.5, var_58_9)

							iter_58_5.color = Color.New(var_58_10, var_58_10, var_58_10)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_7 + var_58_8 and arg_55_1.time_ < var_58_7 + var_58_8 + arg_58_0 and arg_55_1.var_.actorSpriteComps1061 then
				local var_58_11 = 0.5

				for iter_58_6, iter_58_7 in pairs(arg_55_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_58_7 then
						iter_58_7.color = Color.New(var_58_11, var_58_11, var_58_11)
					end
				end

				arg_55_1.var_.actorSpriteComps1061 = nil
			end

			local var_58_12 = 0
			local var_58_13 = 0.7

			if var_58_12 < arg_55_1.time_ and arg_55_1.time_ <= var_58_12 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_14 = arg_55_1:GetWordFromCfg(410142014)
				local var_58_15 = arg_55_1:FormatText(var_58_14.content)

				arg_55_1.text_.text = var_58_15

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_16 = 28
				local var_58_17 = utf8.len(var_58_15)
				local var_58_18 = var_58_16 <= 0 and var_58_13 or var_58_13 * (var_58_17 / var_58_16)

				if var_58_18 > 0 and var_58_13 < var_58_18 then
					arg_55_1.talkMaxDuration = var_58_18

					if var_58_18 + var_58_12 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_18 + var_58_12
					end
				end

				arg_55_1.text_.text = var_58_15
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_19 = math.max(var_58_13, arg_55_1.talkMaxDuration)

			if var_58_12 <= arg_55_1.time_ and arg_55_1.time_ < var_58_12 + var_58_19 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_12) / var_58_19

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_12 + var_58_19 and arg_55_1.time_ < var_58_12 + var_58_19 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play410142015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 410142015
		arg_59_1.duration_ = 9

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play410142016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 2

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				local var_62_1 = manager.ui.mainCamera.transform.localPosition
				local var_62_2 = Vector3.New(0, 0, 10) + Vector3.New(var_62_1.x, var_62_1.y, 0)
				local var_62_3 = arg_59_1.bgs_.ST61

				var_62_3.transform.localPosition = var_62_2
				var_62_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_62_4 = var_62_3:GetComponent("SpriteRenderer")

				if var_62_4 and var_62_4.sprite then
					local var_62_5 = (var_62_3.transform.localPosition - var_62_1).z
					local var_62_6 = manager.ui.mainCameraCom_
					local var_62_7 = 2 * var_62_5 * Mathf.Tan(var_62_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_62_8 = var_62_7 * var_62_6.aspect
					local var_62_9 = var_62_4.sprite.bounds.size.x
					local var_62_10 = var_62_4.sprite.bounds.size.y
					local var_62_11 = var_62_8 / var_62_9
					local var_62_12 = var_62_7 / var_62_10
					local var_62_13 = var_62_12 < var_62_11 and var_62_11 or var_62_12

					var_62_3.transform.localScale = Vector3.New(var_62_13, var_62_13, 0)
				end

				for iter_62_0, iter_62_1 in pairs(arg_59_1.bgs_) do
					if iter_62_0 ~= "ST61" then
						iter_62_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_62_14 = 0

			if var_62_14 < arg_59_1.time_ and arg_59_1.time_ <= var_62_14 + arg_62_0 then
				arg_59_1.mask_.enabled = true
				arg_59_1.mask_.raycastTarget = true

				arg_59_1:SetGaussion(false)
			end

			local var_62_15 = 2

			if var_62_14 <= arg_59_1.time_ and arg_59_1.time_ < var_62_14 + var_62_15 then
				local var_62_16 = (arg_59_1.time_ - var_62_14) / var_62_15
				local var_62_17 = Color.New(0, 0, 0)

				var_62_17.a = Mathf.Lerp(0, 1, var_62_16)
				arg_59_1.mask_.color = var_62_17
			end

			if arg_59_1.time_ >= var_62_14 + var_62_15 and arg_59_1.time_ < var_62_14 + var_62_15 + arg_62_0 then
				local var_62_18 = Color.New(0, 0, 0)

				var_62_18.a = 1
				arg_59_1.mask_.color = var_62_18
			end

			local var_62_19 = 2

			if var_62_19 < arg_59_1.time_ and arg_59_1.time_ <= var_62_19 + arg_62_0 then
				arg_59_1.mask_.enabled = true
				arg_59_1.mask_.raycastTarget = true

				arg_59_1:SetGaussion(false)
			end

			local var_62_20 = 2

			if var_62_19 <= arg_59_1.time_ and arg_59_1.time_ < var_62_19 + var_62_20 then
				local var_62_21 = (arg_59_1.time_ - var_62_19) / var_62_20
				local var_62_22 = Color.New(0, 0, 0)

				var_62_22.a = Mathf.Lerp(1, 0, var_62_21)
				arg_59_1.mask_.color = var_62_22
			end

			if arg_59_1.time_ >= var_62_19 + var_62_20 and arg_59_1.time_ < var_62_19 + var_62_20 + arg_62_0 then
				local var_62_23 = Color.New(0, 0, 0)
				local var_62_24 = 0

				arg_59_1.mask_.enabled = false
				var_62_23.a = var_62_24
				arg_59_1.mask_.color = var_62_23
			end

			local var_62_25 = arg_59_1.actors_["1056"].transform
			local var_62_26 = 2

			if var_62_26 < arg_59_1.time_ and arg_59_1.time_ <= var_62_26 + arg_62_0 then
				arg_59_1.var_.moveOldPos1056 = var_62_25.localPosition
				var_62_25.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("1056", 7)

				local var_62_27 = var_62_25.childCount

				for iter_62_2 = 0, var_62_27 - 1 do
					local var_62_28 = var_62_25:GetChild(iter_62_2)

					if var_62_28.name == "split_1" or not string.find(var_62_28.name, "split") then
						var_62_28.gameObject:SetActive(true)
					else
						var_62_28.gameObject:SetActive(false)
					end
				end
			end

			local var_62_29 = 0.001

			if var_62_26 <= arg_59_1.time_ and arg_59_1.time_ < var_62_26 + var_62_29 then
				local var_62_30 = (arg_59_1.time_ - var_62_26) / var_62_29
				local var_62_31 = Vector3.New(0, -2000, -180)

				var_62_25.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1056, var_62_31, var_62_30)
			end

			if arg_59_1.time_ >= var_62_26 + var_62_29 and arg_59_1.time_ < var_62_26 + var_62_29 + arg_62_0 then
				var_62_25.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_62_32 = arg_59_1.actors_["1061"].transform
			local var_62_33 = 2

			if var_62_33 < arg_59_1.time_ and arg_59_1.time_ <= var_62_33 + arg_62_0 then
				arg_59_1.var_.moveOldPos1061 = var_62_32.localPosition
				var_62_32.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("1061", 7)

				local var_62_34 = var_62_32.childCount

				for iter_62_3 = 0, var_62_34 - 1 do
					local var_62_35 = var_62_32:GetChild(iter_62_3)

					if var_62_35.name == "split_1" or not string.find(var_62_35.name, "split") then
						var_62_35.gameObject:SetActive(true)
					else
						var_62_35.gameObject:SetActive(false)
					end
				end
			end

			local var_62_36 = 0.001

			if var_62_33 <= arg_59_1.time_ and arg_59_1.time_ < var_62_33 + var_62_36 then
				local var_62_37 = (arg_59_1.time_ - var_62_33) / var_62_36
				local var_62_38 = Vector3.New(0, -2000, -180)

				var_62_32.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1061, var_62_38, var_62_37)
			end

			if arg_59_1.time_ >= var_62_33 + var_62_36 and arg_59_1.time_ < var_62_33 + var_62_36 + arg_62_0 then
				var_62_32.localPosition = Vector3.New(0, -2000, -180)
			end

			if arg_59_1.frameCnt_ <= 1 then
				arg_59_1.dialog_:SetActive(false)
			end

			local var_62_39 = 4
			local var_62_40 = 1.025

			if var_62_39 < arg_59_1.time_ and arg_59_1.time_ <= var_62_39 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0

				arg_59_1.dialog_:SetActive(true)

				local var_62_41 = LeanTween.value(arg_59_1.dialog_, 0, 1, 0.3)

				var_62_41:setOnUpdate(LuaHelper.FloatAction(function(arg_63_0)
					arg_59_1.dialogCg_.alpha = arg_63_0
				end))
				var_62_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_59_1.dialog_)
					var_62_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_59_1.duration_ = arg_59_1.duration_ + 0.3

				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_42 = arg_59_1:GetWordFromCfg(410142015)
				local var_62_43 = arg_59_1:FormatText(var_62_42.content)

				arg_59_1.text_.text = var_62_43

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_44 = 41
				local var_62_45 = utf8.len(var_62_43)
				local var_62_46 = var_62_44 <= 0 and var_62_40 or var_62_40 * (var_62_45 / var_62_44)

				if var_62_46 > 0 and var_62_40 < var_62_46 then
					arg_59_1.talkMaxDuration = var_62_46
					var_62_39 = var_62_39 + 0.3

					if var_62_46 + var_62_39 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_46 + var_62_39
					end
				end

				arg_59_1.text_.text = var_62_43
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_47 = var_62_39 + 0.3
			local var_62_48 = math.max(var_62_40, arg_59_1.talkMaxDuration)

			if var_62_47 <= arg_59_1.time_ and arg_59_1.time_ < var_62_47 + var_62_48 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_47) / var_62_48

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_47 + var_62_48 and arg_59_1.time_ < var_62_47 + var_62_48 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play410142016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 410142016
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play410142017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["1061"].transform
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 then
				arg_65_1.var_.moveOldPos1061 = var_68_0.localPosition
				var_68_0.localScale = Vector3.New(1, 1, 1)

				arg_65_1:CheckSpriteTmpPos("1061", 3)

				local var_68_2 = var_68_0.childCount

				for iter_68_0 = 0, var_68_2 - 1 do
					local var_68_3 = var_68_0:GetChild(iter_68_0)

					if var_68_3.name == "" or not string.find(var_68_3.name, "split") then
						var_68_3.gameObject:SetActive(true)
					else
						var_68_3.gameObject:SetActive(false)
					end
				end
			end

			local var_68_4 = 0.001

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_4 then
				local var_68_5 = (arg_65_1.time_ - var_68_1) / var_68_4
				local var_68_6 = Vector3.New(0, -490, 18)

				var_68_0.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos1061, var_68_6, var_68_5)
			end

			if arg_65_1.time_ >= var_68_1 + var_68_4 and arg_65_1.time_ < var_68_1 + var_68_4 + arg_68_0 then
				var_68_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_68_7 = arg_65_1.actors_["1061"]
			local var_68_8 = 0

			if var_68_8 < arg_65_1.time_ and arg_65_1.time_ <= var_68_8 + arg_68_0 and arg_65_1.var_.actorSpriteComps1061 == nil then
				arg_65_1.var_.actorSpriteComps1061 = var_68_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_68_9 = 0.034

			if var_68_8 <= arg_65_1.time_ and arg_65_1.time_ < var_68_8 + var_68_9 then
				local var_68_10 = (arg_65_1.time_ - var_68_8) / var_68_9

				if arg_65_1.var_.actorSpriteComps1061 then
					for iter_68_1, iter_68_2 in pairs(arg_65_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_68_2 then
							local var_68_11 = Mathf.Lerp(iter_68_2.color.r, 0.5, var_68_10)

							iter_68_2.color = Color.New(var_68_11, var_68_11, var_68_11)
						end
					end
				end
			end

			if arg_65_1.time_ >= var_68_8 + var_68_9 and arg_65_1.time_ < var_68_8 + var_68_9 + arg_68_0 and arg_65_1.var_.actorSpriteComps1061 then
				local var_68_12 = 0.5

				for iter_68_3, iter_68_4 in pairs(arg_65_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_68_4 then
						iter_68_4.color = Color.New(var_68_12, var_68_12, var_68_12)
					end
				end

				arg_65_1.var_.actorSpriteComps1061 = nil
			end

			local var_68_13 = 0
			local var_68_14 = 1.125

			if var_68_13 < arg_65_1.time_ and arg_65_1.time_ <= var_68_13 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, false)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_15 = arg_65_1:GetWordFromCfg(410142016)
				local var_68_16 = arg_65_1:FormatText(var_68_15.content)

				arg_65_1.text_.text = var_68_16

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_17 = 45
				local var_68_18 = utf8.len(var_68_16)
				local var_68_19 = var_68_17 <= 0 and var_68_14 or var_68_14 * (var_68_18 / var_68_17)

				if var_68_19 > 0 and var_68_14 < var_68_19 then
					arg_65_1.talkMaxDuration = var_68_19

					if var_68_19 + var_68_13 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_19 + var_68_13
					end
				end

				arg_65_1.text_.text = var_68_16
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_20 = math.max(var_68_14, arg_65_1.talkMaxDuration)

			if var_68_13 <= arg_65_1.time_ and arg_65_1.time_ < var_68_13 + var_68_20 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_13) / var_68_20

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_13 + var_68_20 and arg_65_1.time_ < var_68_13 + var_68_20 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play410142017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 410142017
		arg_69_1.duration_ = 5.766

		local var_69_0 = {
			ja = 5.766,
			CriLanguages = 1.9,
			zh = 1.9
		}
		local var_69_1 = manager.audio:GetLocalizationFlag()

		if var_69_0[var_69_1] ~= nil then
			arg_69_1.duration_ = var_69_0[var_69_1]
		end

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play410142018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1061"].transform
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 then
				arg_69_1.var_.moveOldPos1061 = var_72_0.localPosition
				var_72_0.localScale = Vector3.New(1, 1, 1)

				arg_69_1:CheckSpriteTmpPos("1061", 3)

				local var_72_2 = var_72_0.childCount

				for iter_72_0 = 0, var_72_2 - 1 do
					local var_72_3 = var_72_0:GetChild(iter_72_0)

					if var_72_3.name == "" or not string.find(var_72_3.name, "split") then
						var_72_3.gameObject:SetActive(true)
					else
						var_72_3.gameObject:SetActive(false)
					end
				end
			end

			local var_72_4 = 0.001

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_4 then
				local var_72_5 = (arg_69_1.time_ - var_72_1) / var_72_4
				local var_72_6 = Vector3.New(0, -490, 18)

				var_72_0.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1061, var_72_6, var_72_5)
			end

			if arg_69_1.time_ >= var_72_1 + var_72_4 and arg_69_1.time_ < var_72_1 + var_72_4 + arg_72_0 then
				var_72_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_72_7 = arg_69_1.actors_["1061"]
			local var_72_8 = 0

			if var_72_8 < arg_69_1.time_ and arg_69_1.time_ <= var_72_8 + arg_72_0 and arg_69_1.var_.actorSpriteComps1061 == nil then
				arg_69_1.var_.actorSpriteComps1061 = var_72_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_72_9 = 0.034

			if var_72_8 <= arg_69_1.time_ and arg_69_1.time_ < var_72_8 + var_72_9 then
				local var_72_10 = (arg_69_1.time_ - var_72_8) / var_72_9

				if arg_69_1.var_.actorSpriteComps1061 then
					for iter_72_1, iter_72_2 in pairs(arg_69_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_72_2 then
							local var_72_11 = Mathf.Lerp(iter_72_2.color.r, 0.5, var_72_10)

							iter_72_2.color = Color.New(var_72_11, var_72_11, var_72_11)
						end
					end
				end
			end

			if arg_69_1.time_ >= var_72_8 + var_72_9 and arg_69_1.time_ < var_72_8 + var_72_9 + arg_72_0 and arg_69_1.var_.actorSpriteComps1061 then
				local var_72_12 = 0.5

				for iter_72_3, iter_72_4 in pairs(arg_69_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_72_4 then
						iter_72_4.color = Color.New(var_72_12, var_72_12, var_72_12)
					end
				end

				arg_69_1.var_.actorSpriteComps1061 = nil
			end

			local var_72_13 = 0
			local var_72_14 = 0.1

			if var_72_13 < arg_69_1.time_ and arg_69_1.time_ <= var_72_13 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_15 = arg_69_1:FormatText(StoryNameCfg[613].name)

				arg_69_1.leftNameTxt_.text = var_72_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, true)
				arg_69_1.iconController_:SetSelectedState("hero")

				arg_69_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1020")

				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_16 = arg_69_1:GetWordFromCfg(410142017)
				local var_72_17 = arg_69_1:FormatText(var_72_16.content)

				arg_69_1.text_.text = var_72_17

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_18 = 4
				local var_72_19 = utf8.len(var_72_17)
				local var_72_20 = var_72_18 <= 0 and var_72_14 or var_72_14 * (var_72_19 / var_72_18)

				if var_72_20 > 0 and var_72_14 < var_72_20 then
					arg_69_1.talkMaxDuration = var_72_20

					if var_72_20 + var_72_13 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_20 + var_72_13
					end
				end

				arg_69_1.text_.text = var_72_17
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142017", "story_v_out_410142.awb") ~= 0 then
					local var_72_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142017", "story_v_out_410142.awb") / 1000

					if var_72_21 + var_72_13 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_21 + var_72_13
					end

					if var_72_16.prefab_name ~= "" and arg_69_1.actors_[var_72_16.prefab_name] ~= nil then
						local var_72_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_16.prefab_name].transform, "story_v_out_410142", "410142017", "story_v_out_410142.awb")

						arg_69_1:RecordAudio("410142017", var_72_22)
						arg_69_1:RecordAudio("410142017", var_72_22)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_410142", "410142017", "story_v_out_410142.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_410142", "410142017", "story_v_out_410142.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_23 = math.max(var_72_14, arg_69_1.talkMaxDuration)

			if var_72_13 <= arg_69_1.time_ and arg_69_1.time_ < var_72_13 + var_72_23 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_13) / var_72_23

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_13 + var_72_23 and arg_69_1.time_ < var_72_13 + var_72_23 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play410142018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 410142018
		arg_73_1.duration_ = 11.566

		local var_73_0 = {
			ja = 11.566,
			CriLanguages = 6.333,
			zh = 6.333
		}
		local var_73_1 = manager.audio:GetLocalizationFlag()

		if var_73_0[var_73_1] ~= nil then
			arg_73_1.duration_ = var_73_0[var_73_1]
		end

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play410142019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1061"].transform
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 then
				arg_73_1.var_.moveOldPos1061 = var_76_0.localPosition
				var_76_0.localScale = Vector3.New(1, 1, 1)

				arg_73_1:CheckSpriteTmpPos("1061", 3)

				local var_76_2 = var_76_0.childCount

				for iter_76_0 = 0, var_76_2 - 1 do
					local var_76_3 = var_76_0:GetChild(iter_76_0)

					if var_76_3.name == "split_5" or not string.find(var_76_3.name, "split") then
						var_76_3.gameObject:SetActive(true)
					else
						var_76_3.gameObject:SetActive(false)
					end
				end
			end

			local var_76_4 = 0.001

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_4 then
				local var_76_5 = (arg_73_1.time_ - var_76_1) / var_76_4
				local var_76_6 = Vector3.New(0, -490, 18)

				var_76_0.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1061, var_76_6, var_76_5)
			end

			if arg_73_1.time_ >= var_76_1 + var_76_4 and arg_73_1.time_ < var_76_1 + var_76_4 + arg_76_0 then
				var_76_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_76_7 = arg_73_1.actors_["1061"]
			local var_76_8 = 0

			if var_76_8 < arg_73_1.time_ and arg_73_1.time_ <= var_76_8 + arg_76_0 and arg_73_1.var_.actorSpriteComps1061 == nil then
				arg_73_1.var_.actorSpriteComps1061 = var_76_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_76_9 = 0.034

			if var_76_8 <= arg_73_1.time_ and arg_73_1.time_ < var_76_8 + var_76_9 then
				local var_76_10 = (arg_73_1.time_ - var_76_8) / var_76_9

				if arg_73_1.var_.actorSpriteComps1061 then
					for iter_76_1, iter_76_2 in pairs(arg_73_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_76_2 then
							local var_76_11 = Mathf.Lerp(iter_76_2.color.r, 1, var_76_10)

							iter_76_2.color = Color.New(var_76_11, var_76_11, var_76_11)
						end
					end
				end
			end

			if arg_73_1.time_ >= var_76_8 + var_76_9 and arg_73_1.time_ < var_76_8 + var_76_9 + arg_76_0 and arg_73_1.var_.actorSpriteComps1061 then
				local var_76_12 = 1

				for iter_76_3, iter_76_4 in pairs(arg_73_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_76_4 then
						iter_76_4.color = Color.New(var_76_12, var_76_12, var_76_12)
					end
				end

				arg_73_1.var_.actorSpriteComps1061 = nil
			end

			local var_76_13 = 0
			local var_76_14 = 0.8

			if var_76_13 < arg_73_1.time_ and arg_73_1.time_ <= var_76_13 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_15 = arg_73_1:FormatText(StoryNameCfg[612].name)

				arg_73_1.leftNameTxt_.text = var_76_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_16 = arg_73_1:GetWordFromCfg(410142018)
				local var_76_17 = arg_73_1:FormatText(var_76_16.content)

				arg_73_1.text_.text = var_76_17

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_18 = 32
				local var_76_19 = utf8.len(var_76_17)
				local var_76_20 = var_76_18 <= 0 and var_76_14 or var_76_14 * (var_76_19 / var_76_18)

				if var_76_20 > 0 and var_76_14 < var_76_20 then
					arg_73_1.talkMaxDuration = var_76_20

					if var_76_20 + var_76_13 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_20 + var_76_13
					end
				end

				arg_73_1.text_.text = var_76_17
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142018", "story_v_out_410142.awb") ~= 0 then
					local var_76_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142018", "story_v_out_410142.awb") / 1000

					if var_76_21 + var_76_13 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_21 + var_76_13
					end

					if var_76_16.prefab_name ~= "" and arg_73_1.actors_[var_76_16.prefab_name] ~= nil then
						local var_76_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_16.prefab_name].transform, "story_v_out_410142", "410142018", "story_v_out_410142.awb")

						arg_73_1:RecordAudio("410142018", var_76_22)
						arg_73_1:RecordAudio("410142018", var_76_22)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_410142", "410142018", "story_v_out_410142.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_410142", "410142018", "story_v_out_410142.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_23 = math.max(var_76_14, arg_73_1.talkMaxDuration)

			if var_76_13 <= arg_73_1.time_ and arg_73_1.time_ < var_76_13 + var_76_23 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_13) / var_76_23

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_13 + var_76_23 and arg_73_1.time_ < var_76_13 + var_76_23 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play410142019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 410142019
		arg_77_1.duration_ = 16.4

		local var_77_0 = {
			ja = 16.4,
			CriLanguages = 5.533,
			zh = 5.533
		}
		local var_77_1 = manager.audio:GetLocalizationFlag()

		if var_77_0[var_77_1] ~= nil then
			arg_77_1.duration_ = var_77_0[var_77_1]
		end

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play410142020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1061"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.actorSpriteComps1061 == nil then
				arg_77_1.var_.actorSpriteComps1061 = var_80_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_80_2 = 0.034

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.actorSpriteComps1061 then
					for iter_80_0, iter_80_1 in pairs(arg_77_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_80_1 then
							local var_80_4 = Mathf.Lerp(iter_80_1.color.r, 0.5, var_80_3)

							iter_80_1.color = Color.New(var_80_4, var_80_4, var_80_4)
						end
					end
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.actorSpriteComps1061 then
				local var_80_5 = 0.5

				for iter_80_2, iter_80_3 in pairs(arg_77_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_80_3 then
						iter_80_3.color = Color.New(var_80_5, var_80_5, var_80_5)
					end
				end

				arg_77_1.var_.actorSpriteComps1061 = nil
			end

			local var_80_6 = 0
			local var_80_7 = 0.6

			if var_80_6 < arg_77_1.time_ and arg_77_1.time_ <= var_80_6 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_8 = arg_77_1:FormatText(StoryNameCfg[613].name)

				arg_77_1.leftNameTxt_.text = var_80_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, true)
				arg_77_1.iconController_:SetSelectedState("hero")

				arg_77_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1020")

				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_9 = arg_77_1:GetWordFromCfg(410142019)
				local var_80_10 = arg_77_1:FormatText(var_80_9.content)

				arg_77_1.text_.text = var_80_10

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_11 = 24
				local var_80_12 = utf8.len(var_80_10)
				local var_80_13 = var_80_11 <= 0 and var_80_7 or var_80_7 * (var_80_12 / var_80_11)

				if var_80_13 > 0 and var_80_7 < var_80_13 then
					arg_77_1.talkMaxDuration = var_80_13

					if var_80_13 + var_80_6 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_13 + var_80_6
					end
				end

				arg_77_1.text_.text = var_80_10
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142019", "story_v_out_410142.awb") ~= 0 then
					local var_80_14 = manager.audio:GetVoiceLength("story_v_out_410142", "410142019", "story_v_out_410142.awb") / 1000

					if var_80_14 + var_80_6 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_14 + var_80_6
					end

					if var_80_9.prefab_name ~= "" and arg_77_1.actors_[var_80_9.prefab_name] ~= nil then
						local var_80_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_9.prefab_name].transform, "story_v_out_410142", "410142019", "story_v_out_410142.awb")

						arg_77_1:RecordAudio("410142019", var_80_15)
						arg_77_1:RecordAudio("410142019", var_80_15)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_410142", "410142019", "story_v_out_410142.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_410142", "410142019", "story_v_out_410142.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_16 = math.max(var_80_7, arg_77_1.talkMaxDuration)

			if var_80_6 <= arg_77_1.time_ and arg_77_1.time_ < var_80_6 + var_80_16 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_6) / var_80_16

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_6 + var_80_16 and arg_77_1.time_ < var_80_6 + var_80_16 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play410142020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 410142020
		arg_81_1.duration_ = 14.7

		local var_81_0 = {
			ja = 14.7,
			CriLanguages = 6.1,
			zh = 6.1
		}
		local var_81_1 = manager.audio:GetLocalizationFlag()

		if var_81_0[var_81_1] ~= nil then
			arg_81_1.duration_ = var_81_0[var_81_1]
		end

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play410142021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["1061"].transform
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				arg_81_1.var_.moveOldPos1061 = var_84_0.localPosition
				var_84_0.localScale = Vector3.New(1, 1, 1)

				arg_81_1:CheckSpriteTmpPos("1061", 3)

				local var_84_2 = var_84_0.childCount

				for iter_84_0 = 0, var_84_2 - 1 do
					local var_84_3 = var_84_0:GetChild(iter_84_0)

					if var_84_3.name == "split_5" or not string.find(var_84_3.name, "split") then
						var_84_3.gameObject:SetActive(true)
					else
						var_84_3.gameObject:SetActive(false)
					end
				end
			end

			local var_84_4 = 0.001

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_4 then
				local var_84_5 = (arg_81_1.time_ - var_84_1) / var_84_4
				local var_84_6 = Vector3.New(0, -490, 18)

				var_84_0.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos1061, var_84_6, var_84_5)
			end

			if arg_81_1.time_ >= var_84_1 + var_84_4 and arg_81_1.time_ < var_84_1 + var_84_4 + arg_84_0 then
				var_84_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_84_7 = arg_81_1.actors_["1061"]
			local var_84_8 = 0

			if var_84_8 < arg_81_1.time_ and arg_81_1.time_ <= var_84_8 + arg_84_0 and arg_81_1.var_.actorSpriteComps1061 == nil then
				arg_81_1.var_.actorSpriteComps1061 = var_84_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_84_9 = 0.034

			if var_84_8 <= arg_81_1.time_ and arg_81_1.time_ < var_84_8 + var_84_9 then
				local var_84_10 = (arg_81_1.time_ - var_84_8) / var_84_9

				if arg_81_1.var_.actorSpriteComps1061 then
					for iter_84_1, iter_84_2 in pairs(arg_81_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_84_2 then
							local var_84_11 = Mathf.Lerp(iter_84_2.color.r, 1, var_84_10)

							iter_84_2.color = Color.New(var_84_11, var_84_11, var_84_11)
						end
					end
				end
			end

			if arg_81_1.time_ >= var_84_8 + var_84_9 and arg_81_1.time_ < var_84_8 + var_84_9 + arg_84_0 and arg_81_1.var_.actorSpriteComps1061 then
				local var_84_12 = 1

				for iter_84_3, iter_84_4 in pairs(arg_81_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_84_4 then
						iter_84_4.color = Color.New(var_84_12, var_84_12, var_84_12)
					end
				end

				arg_81_1.var_.actorSpriteComps1061 = nil
			end

			local var_84_13 = 0
			local var_84_14 = 0.775

			if var_84_13 < arg_81_1.time_ and arg_81_1.time_ <= var_84_13 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_15 = arg_81_1:FormatText(StoryNameCfg[612].name)

				arg_81_1.leftNameTxt_.text = var_84_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_16 = arg_81_1:GetWordFromCfg(410142020)
				local var_84_17 = arg_81_1:FormatText(var_84_16.content)

				arg_81_1.text_.text = var_84_17

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_18 = 31
				local var_84_19 = utf8.len(var_84_17)
				local var_84_20 = var_84_18 <= 0 and var_84_14 or var_84_14 * (var_84_19 / var_84_18)

				if var_84_20 > 0 and var_84_14 < var_84_20 then
					arg_81_1.talkMaxDuration = var_84_20

					if var_84_20 + var_84_13 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_20 + var_84_13
					end
				end

				arg_81_1.text_.text = var_84_17
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142020", "story_v_out_410142.awb") ~= 0 then
					local var_84_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142020", "story_v_out_410142.awb") / 1000

					if var_84_21 + var_84_13 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_21 + var_84_13
					end

					if var_84_16.prefab_name ~= "" and arg_81_1.actors_[var_84_16.prefab_name] ~= nil then
						local var_84_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_16.prefab_name].transform, "story_v_out_410142", "410142020", "story_v_out_410142.awb")

						arg_81_1:RecordAudio("410142020", var_84_22)
						arg_81_1:RecordAudio("410142020", var_84_22)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_410142", "410142020", "story_v_out_410142.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_410142", "410142020", "story_v_out_410142.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_23 = math.max(var_84_14, arg_81_1.talkMaxDuration)

			if var_84_13 <= arg_81_1.time_ and arg_81_1.time_ < var_84_13 + var_84_23 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_13) / var_84_23

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_13 + var_84_23 and arg_81_1.time_ < var_84_13 + var_84_23 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play410142021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 410142021
		arg_85_1.duration_ = 9.566

		local var_85_0 = {
			ja = 9.566,
			CriLanguages = 2.4,
			zh = 2.4
		}
		local var_85_1 = manager.audio:GetLocalizationFlag()

		if var_85_0[var_85_1] ~= nil then
			arg_85_1.duration_ = var_85_0[var_85_1]
		end

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play410142022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1061"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.actorSpriteComps1061 == nil then
				arg_85_1.var_.actorSpriteComps1061 = var_88_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_88_2 = 0.034

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.actorSpriteComps1061 then
					for iter_88_0, iter_88_1 in pairs(arg_85_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_88_1 then
							local var_88_4 = Mathf.Lerp(iter_88_1.color.r, 0.5, var_88_3)

							iter_88_1.color = Color.New(var_88_4, var_88_4, var_88_4)
						end
					end
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.actorSpriteComps1061 then
				local var_88_5 = 0.5

				for iter_88_2, iter_88_3 in pairs(arg_85_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_88_3 then
						iter_88_3.color = Color.New(var_88_5, var_88_5, var_88_5)
					end
				end

				arg_85_1.var_.actorSpriteComps1061 = nil
			end

			local var_88_6 = 0
			local var_88_7 = 0.2

			if var_88_6 < arg_85_1.time_ and arg_85_1.time_ <= var_88_6 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_8 = arg_85_1:FormatText(StoryNameCfg[613].name)

				arg_85_1.leftNameTxt_.text = var_88_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, true)
				arg_85_1.iconController_:SetSelectedState("hero")

				arg_85_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1020")

				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_9 = arg_85_1:GetWordFromCfg(410142021)
				local var_88_10 = arg_85_1:FormatText(var_88_9.content)

				arg_85_1.text_.text = var_88_10

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_11 = 8
				local var_88_12 = utf8.len(var_88_10)
				local var_88_13 = var_88_11 <= 0 and var_88_7 or var_88_7 * (var_88_12 / var_88_11)

				if var_88_13 > 0 and var_88_7 < var_88_13 then
					arg_85_1.talkMaxDuration = var_88_13

					if var_88_13 + var_88_6 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_13 + var_88_6
					end
				end

				arg_85_1.text_.text = var_88_10
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142021", "story_v_out_410142.awb") ~= 0 then
					local var_88_14 = manager.audio:GetVoiceLength("story_v_out_410142", "410142021", "story_v_out_410142.awb") / 1000

					if var_88_14 + var_88_6 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_14 + var_88_6
					end

					if var_88_9.prefab_name ~= "" and arg_85_1.actors_[var_88_9.prefab_name] ~= nil then
						local var_88_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_9.prefab_name].transform, "story_v_out_410142", "410142021", "story_v_out_410142.awb")

						arg_85_1:RecordAudio("410142021", var_88_15)
						arg_85_1:RecordAudio("410142021", var_88_15)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_410142", "410142021", "story_v_out_410142.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_410142", "410142021", "story_v_out_410142.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_16 = math.max(var_88_7, arg_85_1.talkMaxDuration)

			if var_88_6 <= arg_85_1.time_ and arg_85_1.time_ < var_88_6 + var_88_16 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_6) / var_88_16

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_6 + var_88_16 and arg_85_1.time_ < var_88_6 + var_88_16 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play410142022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 410142022
		arg_89_1.duration_ = 4.8

		local var_89_0 = {
			ja = 4.8,
			CriLanguages = 2.633,
			zh = 2.633
		}
		local var_89_1 = manager.audio:GetLocalizationFlag()

		if var_89_0[var_89_1] ~= nil then
			arg_89_1.duration_ = var_89_0[var_89_1]
		end

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play410142023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1061"].transform
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 then
				arg_89_1.var_.moveOldPos1061 = var_92_0.localPosition
				var_92_0.localScale = Vector3.New(1, 1, 1)

				arg_89_1:CheckSpriteTmpPos("1061", 3)

				local var_92_2 = var_92_0.childCount

				for iter_92_0 = 0, var_92_2 - 1 do
					local var_92_3 = var_92_0:GetChild(iter_92_0)

					if var_92_3.name == "split_5" or not string.find(var_92_3.name, "split") then
						var_92_3.gameObject:SetActive(true)
					else
						var_92_3.gameObject:SetActive(false)
					end
				end
			end

			local var_92_4 = 0.001

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_4 then
				local var_92_5 = (arg_89_1.time_ - var_92_1) / var_92_4
				local var_92_6 = Vector3.New(0, -490, 18)

				var_92_0.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1061, var_92_6, var_92_5)
			end

			if arg_89_1.time_ >= var_92_1 + var_92_4 and arg_89_1.time_ < var_92_1 + var_92_4 + arg_92_0 then
				var_92_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_92_7 = arg_89_1.actors_["1061"]
			local var_92_8 = 0

			if var_92_8 < arg_89_1.time_ and arg_89_1.time_ <= var_92_8 + arg_92_0 and arg_89_1.var_.actorSpriteComps1061 == nil then
				arg_89_1.var_.actorSpriteComps1061 = var_92_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_92_9 = 0.034

			if var_92_8 <= arg_89_1.time_ and arg_89_1.time_ < var_92_8 + var_92_9 then
				local var_92_10 = (arg_89_1.time_ - var_92_8) / var_92_9

				if arg_89_1.var_.actorSpriteComps1061 then
					for iter_92_1, iter_92_2 in pairs(arg_89_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_92_2 then
							local var_92_11 = Mathf.Lerp(iter_92_2.color.r, 1, var_92_10)

							iter_92_2.color = Color.New(var_92_11, var_92_11, var_92_11)
						end
					end
				end
			end

			if arg_89_1.time_ >= var_92_8 + var_92_9 and arg_89_1.time_ < var_92_8 + var_92_9 + arg_92_0 and arg_89_1.var_.actorSpriteComps1061 then
				local var_92_12 = 1

				for iter_92_3, iter_92_4 in pairs(arg_89_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_92_4 then
						iter_92_4.color = Color.New(var_92_12, var_92_12, var_92_12)
					end
				end

				arg_89_1.var_.actorSpriteComps1061 = nil
			end

			local var_92_13 = 0
			local var_92_14 = 0.225

			if var_92_13 < arg_89_1.time_ and arg_89_1.time_ <= var_92_13 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_15 = arg_89_1:FormatText(StoryNameCfg[612].name)

				arg_89_1.leftNameTxt_.text = var_92_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_16 = arg_89_1:GetWordFromCfg(410142022)
				local var_92_17 = arg_89_1:FormatText(var_92_16.content)

				arg_89_1.text_.text = var_92_17

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_18 = 9
				local var_92_19 = utf8.len(var_92_17)
				local var_92_20 = var_92_18 <= 0 and var_92_14 or var_92_14 * (var_92_19 / var_92_18)

				if var_92_20 > 0 and var_92_14 < var_92_20 then
					arg_89_1.talkMaxDuration = var_92_20

					if var_92_20 + var_92_13 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_20 + var_92_13
					end
				end

				arg_89_1.text_.text = var_92_17
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142022", "story_v_out_410142.awb") ~= 0 then
					local var_92_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142022", "story_v_out_410142.awb") / 1000

					if var_92_21 + var_92_13 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_21 + var_92_13
					end

					if var_92_16.prefab_name ~= "" and arg_89_1.actors_[var_92_16.prefab_name] ~= nil then
						local var_92_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_16.prefab_name].transform, "story_v_out_410142", "410142022", "story_v_out_410142.awb")

						arg_89_1:RecordAudio("410142022", var_92_22)
						arg_89_1:RecordAudio("410142022", var_92_22)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_410142", "410142022", "story_v_out_410142.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_410142", "410142022", "story_v_out_410142.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_23 = math.max(var_92_14, arg_89_1.talkMaxDuration)

			if var_92_13 <= arg_89_1.time_ and arg_89_1.time_ < var_92_13 + var_92_23 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_13) / var_92_23

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_13 + var_92_23 and arg_89_1.time_ < var_92_13 + var_92_23 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play410142023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 410142023
		arg_93_1.duration_ = 8.833

		local var_93_0 = {
			ja = 8.833,
			CriLanguages = 6.8,
			zh = 6.8
		}
		local var_93_1 = manager.audio:GetLocalizationFlag()

		if var_93_0[var_93_1] ~= nil then
			arg_93_1.duration_ = var_93_0[var_93_1]
		end

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play410142024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1061"].transform
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 then
				arg_93_1.var_.moveOldPos1061 = var_96_0.localPosition
				var_96_0.localScale = Vector3.New(1, 1, 1)

				arg_93_1:CheckSpriteTmpPos("1061", 3)

				local var_96_2 = var_96_0.childCount

				for iter_96_0 = 0, var_96_2 - 1 do
					local var_96_3 = var_96_0:GetChild(iter_96_0)

					if var_96_3.name == "" or not string.find(var_96_3.name, "split") then
						var_96_3.gameObject:SetActive(true)
					else
						var_96_3.gameObject:SetActive(false)
					end
				end
			end

			local var_96_4 = 0.001

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_4 then
				local var_96_5 = (arg_93_1.time_ - var_96_1) / var_96_4
				local var_96_6 = Vector3.New(0, -490, 18)

				var_96_0.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1061, var_96_6, var_96_5)
			end

			if arg_93_1.time_ >= var_96_1 + var_96_4 and arg_93_1.time_ < var_96_1 + var_96_4 + arg_96_0 then
				var_96_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_96_7 = arg_93_1.actors_["1061"]
			local var_96_8 = 0

			if var_96_8 < arg_93_1.time_ and arg_93_1.time_ <= var_96_8 + arg_96_0 and arg_93_1.var_.actorSpriteComps1061 == nil then
				arg_93_1.var_.actorSpriteComps1061 = var_96_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_96_9 = 0.034

			if var_96_8 <= arg_93_1.time_ and arg_93_1.time_ < var_96_8 + var_96_9 then
				local var_96_10 = (arg_93_1.time_ - var_96_8) / var_96_9

				if arg_93_1.var_.actorSpriteComps1061 then
					for iter_96_1, iter_96_2 in pairs(arg_93_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_96_2 then
							local var_96_11 = Mathf.Lerp(iter_96_2.color.r, 1, var_96_10)

							iter_96_2.color = Color.New(var_96_11, var_96_11, var_96_11)
						end
					end
				end
			end

			if arg_93_1.time_ >= var_96_8 + var_96_9 and arg_93_1.time_ < var_96_8 + var_96_9 + arg_96_0 and arg_93_1.var_.actorSpriteComps1061 then
				local var_96_12 = 1

				for iter_96_3, iter_96_4 in pairs(arg_93_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_96_4 then
						iter_96_4.color = Color.New(var_96_12, var_96_12, var_96_12)
					end
				end

				arg_93_1.var_.actorSpriteComps1061 = nil
			end

			local var_96_13 = 0
			local var_96_14 = 0.825

			if var_96_13 < arg_93_1.time_ and arg_93_1.time_ <= var_96_13 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_15 = arg_93_1:FormatText(StoryNameCfg[612].name)

				arg_93_1.leftNameTxt_.text = var_96_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_16 = arg_93_1:GetWordFromCfg(410142023)
				local var_96_17 = arg_93_1:FormatText(var_96_16.content)

				arg_93_1.text_.text = var_96_17

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_18 = 33
				local var_96_19 = utf8.len(var_96_17)
				local var_96_20 = var_96_18 <= 0 and var_96_14 or var_96_14 * (var_96_19 / var_96_18)

				if var_96_20 > 0 and var_96_14 < var_96_20 then
					arg_93_1.talkMaxDuration = var_96_20

					if var_96_20 + var_96_13 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_20 + var_96_13
					end
				end

				arg_93_1.text_.text = var_96_17
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142023", "story_v_out_410142.awb") ~= 0 then
					local var_96_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142023", "story_v_out_410142.awb") / 1000

					if var_96_21 + var_96_13 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_21 + var_96_13
					end

					if var_96_16.prefab_name ~= "" and arg_93_1.actors_[var_96_16.prefab_name] ~= nil then
						local var_96_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_16.prefab_name].transform, "story_v_out_410142", "410142023", "story_v_out_410142.awb")

						arg_93_1:RecordAudio("410142023", var_96_22)
						arg_93_1:RecordAudio("410142023", var_96_22)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_410142", "410142023", "story_v_out_410142.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_410142", "410142023", "story_v_out_410142.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_23 = math.max(var_96_14, arg_93_1.talkMaxDuration)

			if var_96_13 <= arg_93_1.time_ and arg_93_1.time_ < var_96_13 + var_96_23 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_13) / var_96_23

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_13 + var_96_23 and arg_93_1.time_ < var_96_13 + var_96_23 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play410142024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 410142024
		arg_97_1.duration_ = 1.966

		local var_97_0 = {
			ja = 0.999999999999,
			CriLanguages = 1.966,
			zh = 1.966
		}
		local var_97_1 = manager.audio:GetLocalizationFlag()

		if var_97_0[var_97_1] ~= nil then
			arg_97_1.duration_ = var_97_0[var_97_1]
		end

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play410142025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1061"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.actorSpriteComps1061 == nil then
				arg_97_1.var_.actorSpriteComps1061 = var_100_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_100_2 = 0.034

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.actorSpriteComps1061 then
					for iter_100_0, iter_100_1 in pairs(arg_97_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_100_1 then
							local var_100_4 = Mathf.Lerp(iter_100_1.color.r, 0.5, var_100_3)

							iter_100_1.color = Color.New(var_100_4, var_100_4, var_100_4)
						end
					end
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.actorSpriteComps1061 then
				local var_100_5 = 0.5

				for iter_100_2, iter_100_3 in pairs(arg_97_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_100_3 then
						iter_100_3.color = Color.New(var_100_5, var_100_5, var_100_5)
					end
				end

				arg_97_1.var_.actorSpriteComps1061 = nil
			end

			local var_100_6 = 0
			local var_100_7 = 0.075

			if var_100_6 < arg_97_1.time_ and arg_97_1.time_ <= var_100_6 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_8 = arg_97_1:FormatText(StoryNameCfg[613].name)

				arg_97_1.leftNameTxt_.text = var_100_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, true)
				arg_97_1.iconController_:SetSelectedState("hero")

				arg_97_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1020")

				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_9 = arg_97_1:GetWordFromCfg(410142024)
				local var_100_10 = arg_97_1:FormatText(var_100_9.content)

				arg_97_1.text_.text = var_100_10

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_11 = 3
				local var_100_12 = utf8.len(var_100_10)
				local var_100_13 = var_100_11 <= 0 and var_100_7 or var_100_7 * (var_100_12 / var_100_11)

				if var_100_13 > 0 and var_100_7 < var_100_13 then
					arg_97_1.talkMaxDuration = var_100_13

					if var_100_13 + var_100_6 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_13 + var_100_6
					end
				end

				arg_97_1.text_.text = var_100_10
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142024", "story_v_out_410142.awb") ~= 0 then
					local var_100_14 = manager.audio:GetVoiceLength("story_v_out_410142", "410142024", "story_v_out_410142.awb") / 1000

					if var_100_14 + var_100_6 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_14 + var_100_6
					end

					if var_100_9.prefab_name ~= "" and arg_97_1.actors_[var_100_9.prefab_name] ~= nil then
						local var_100_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_9.prefab_name].transform, "story_v_out_410142", "410142024", "story_v_out_410142.awb")

						arg_97_1:RecordAudio("410142024", var_100_15)
						arg_97_1:RecordAudio("410142024", var_100_15)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_410142", "410142024", "story_v_out_410142.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_410142", "410142024", "story_v_out_410142.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_16 = math.max(var_100_7, arg_97_1.talkMaxDuration)

			if var_100_6 <= arg_97_1.time_ and arg_97_1.time_ < var_100_6 + var_100_16 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_6) / var_100_16

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_6 + var_100_16 and arg_97_1.time_ < var_100_6 + var_100_16 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play410142025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 410142025
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play410142026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 1.075

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, false)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_2 = arg_101_1:GetWordFromCfg(410142025)
				local var_104_3 = arg_101_1:FormatText(var_104_2.content)

				arg_101_1.text_.text = var_104_3

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_4 = 43
				local var_104_5 = utf8.len(var_104_3)
				local var_104_6 = var_104_4 <= 0 and var_104_1 or var_104_1 * (var_104_5 / var_104_4)

				if var_104_6 > 0 and var_104_1 < var_104_6 then
					arg_101_1.talkMaxDuration = var_104_6

					if var_104_6 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_6 + var_104_0
					end
				end

				arg_101_1.text_.text = var_104_3
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)
				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_7 = math.max(var_104_1, arg_101_1.talkMaxDuration)

			if var_104_0 <= arg_101_1.time_ and arg_101_1.time_ < var_104_0 + var_104_7 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_0) / var_104_7

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_0 + var_104_7 and arg_101_1.time_ < var_104_0 + var_104_7 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play410142026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 410142026
		arg_105_1.duration_ = 20.2

		local var_105_0 = {
			ja = 20.2,
			CriLanguages = 6.833,
			zh = 6.833
		}
		local var_105_1 = manager.audio:GetLocalizationFlag()

		if var_105_0[var_105_1] ~= nil then
			arg_105_1.duration_ = var_105_0[var_105_1]
		end

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play410142027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 0.725

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_2 = arg_105_1:FormatText(StoryNameCfg[613].name)

				arg_105_1.leftNameTxt_.text = var_108_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, true)
				arg_105_1.iconController_:SetSelectedState("hero")

				arg_105_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1020")

				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_3 = arg_105_1:GetWordFromCfg(410142026)
				local var_108_4 = arg_105_1:FormatText(var_108_3.content)

				arg_105_1.text_.text = var_108_4

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_5 = 29
				local var_108_6 = utf8.len(var_108_4)
				local var_108_7 = var_108_5 <= 0 and var_108_1 or var_108_1 * (var_108_6 / var_108_5)

				if var_108_7 > 0 and var_108_1 < var_108_7 then
					arg_105_1.talkMaxDuration = var_108_7

					if var_108_7 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_7 + var_108_0
					end
				end

				arg_105_1.text_.text = var_108_4
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142026", "story_v_out_410142.awb") ~= 0 then
					local var_108_8 = manager.audio:GetVoiceLength("story_v_out_410142", "410142026", "story_v_out_410142.awb") / 1000

					if var_108_8 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_8 + var_108_0
					end

					if var_108_3.prefab_name ~= "" and arg_105_1.actors_[var_108_3.prefab_name] ~= nil then
						local var_108_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_3.prefab_name].transform, "story_v_out_410142", "410142026", "story_v_out_410142.awb")

						arg_105_1:RecordAudio("410142026", var_108_9)
						arg_105_1:RecordAudio("410142026", var_108_9)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_410142", "410142026", "story_v_out_410142.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_410142", "410142026", "story_v_out_410142.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_10 = math.max(var_108_1, arg_105_1.talkMaxDuration)

			if var_108_0 <= arg_105_1.time_ and arg_105_1.time_ < var_108_0 + var_108_10 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_0) / var_108_10

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_0 + var_108_10 and arg_105_1.time_ < var_108_0 + var_108_10 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play410142027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 410142027
		arg_109_1.duration_ = 6.566

		local var_109_0 = {
			ja = 6.566,
			CriLanguages = 4.6,
			zh = 4.6
		}
		local var_109_1 = manager.audio:GetLocalizationFlag()

		if var_109_0[var_109_1] ~= nil then
			arg_109_1.duration_ = var_109_0[var_109_1]
		end

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play410142028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1061"].transform
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 then
				arg_109_1.var_.moveOldPos1061 = var_112_0.localPosition
				var_112_0.localScale = Vector3.New(1, 1, 1)

				arg_109_1:CheckSpriteTmpPos("1061", 3)

				local var_112_2 = var_112_0.childCount

				for iter_112_0 = 0, var_112_2 - 1 do
					local var_112_3 = var_112_0:GetChild(iter_112_0)

					if var_112_3.name == "split_5" or not string.find(var_112_3.name, "split") then
						var_112_3.gameObject:SetActive(true)
					else
						var_112_3.gameObject:SetActive(false)
					end
				end
			end

			local var_112_4 = 0.001

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_4 then
				local var_112_5 = (arg_109_1.time_ - var_112_1) / var_112_4
				local var_112_6 = Vector3.New(0, -490, 18)

				var_112_0.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1061, var_112_6, var_112_5)
			end

			if arg_109_1.time_ >= var_112_1 + var_112_4 and arg_109_1.time_ < var_112_1 + var_112_4 + arg_112_0 then
				var_112_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_112_7 = arg_109_1.actors_["1061"]
			local var_112_8 = 0

			if var_112_8 < arg_109_1.time_ and arg_109_1.time_ <= var_112_8 + arg_112_0 and arg_109_1.var_.actorSpriteComps1061 == nil then
				arg_109_1.var_.actorSpriteComps1061 = var_112_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_112_9 = 0.034

			if var_112_8 <= arg_109_1.time_ and arg_109_1.time_ < var_112_8 + var_112_9 then
				local var_112_10 = (arg_109_1.time_ - var_112_8) / var_112_9

				if arg_109_1.var_.actorSpriteComps1061 then
					for iter_112_1, iter_112_2 in pairs(arg_109_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_112_2 then
							local var_112_11 = Mathf.Lerp(iter_112_2.color.r, 1, var_112_10)

							iter_112_2.color = Color.New(var_112_11, var_112_11, var_112_11)
						end
					end
				end
			end

			if arg_109_1.time_ >= var_112_8 + var_112_9 and arg_109_1.time_ < var_112_8 + var_112_9 + arg_112_0 and arg_109_1.var_.actorSpriteComps1061 then
				local var_112_12 = 1

				for iter_112_3, iter_112_4 in pairs(arg_109_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_112_4 then
						iter_112_4.color = Color.New(var_112_12, var_112_12, var_112_12)
					end
				end

				arg_109_1.var_.actorSpriteComps1061 = nil
			end

			local var_112_13 = 0
			local var_112_14 = 0.425

			if var_112_13 < arg_109_1.time_ and arg_109_1.time_ <= var_112_13 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_15 = arg_109_1:FormatText(StoryNameCfg[612].name)

				arg_109_1.leftNameTxt_.text = var_112_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_16 = arg_109_1:GetWordFromCfg(410142027)
				local var_112_17 = arg_109_1:FormatText(var_112_16.content)

				arg_109_1.text_.text = var_112_17

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_18 = 17
				local var_112_19 = utf8.len(var_112_17)
				local var_112_20 = var_112_18 <= 0 and var_112_14 or var_112_14 * (var_112_19 / var_112_18)

				if var_112_20 > 0 and var_112_14 < var_112_20 then
					arg_109_1.talkMaxDuration = var_112_20

					if var_112_20 + var_112_13 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_20 + var_112_13
					end
				end

				arg_109_1.text_.text = var_112_17
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142027", "story_v_out_410142.awb") ~= 0 then
					local var_112_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142027", "story_v_out_410142.awb") / 1000

					if var_112_21 + var_112_13 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_21 + var_112_13
					end

					if var_112_16.prefab_name ~= "" and arg_109_1.actors_[var_112_16.prefab_name] ~= nil then
						local var_112_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_16.prefab_name].transform, "story_v_out_410142", "410142027", "story_v_out_410142.awb")

						arg_109_1:RecordAudio("410142027", var_112_22)
						arg_109_1:RecordAudio("410142027", var_112_22)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_410142", "410142027", "story_v_out_410142.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_410142", "410142027", "story_v_out_410142.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_23 = math.max(var_112_14, arg_109_1.talkMaxDuration)

			if var_112_13 <= arg_109_1.time_ and arg_109_1.time_ < var_112_13 + var_112_23 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_13) / var_112_23

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_13 + var_112_23 and arg_109_1.time_ < var_112_13 + var_112_23 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play410142028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 410142028
		arg_113_1.duration_ = 4.066

		local var_113_0 = {
			ja = 4.066,
			CriLanguages = 1.733,
			zh = 1.733
		}
		local var_113_1 = manager.audio:GetLocalizationFlag()

		if var_113_0[var_113_1] ~= nil then
			arg_113_1.duration_ = var_113_0[var_113_1]
		end

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play410142029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1061"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.actorSpriteComps1061 == nil then
				arg_113_1.var_.actorSpriteComps1061 = var_116_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_116_2 = 0.034

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.actorSpriteComps1061 then
					for iter_116_0, iter_116_1 in pairs(arg_113_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_116_1 then
							local var_116_4 = Mathf.Lerp(iter_116_1.color.r, 0.5, var_116_3)

							iter_116_1.color = Color.New(var_116_4, var_116_4, var_116_4)
						end
					end
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.actorSpriteComps1061 then
				local var_116_5 = 0.5

				for iter_116_2, iter_116_3 in pairs(arg_113_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_116_3 then
						iter_116_3.color = Color.New(var_116_5, var_116_5, var_116_5)
					end
				end

				arg_113_1.var_.actorSpriteComps1061 = nil
			end

			local var_116_6 = 0
			local var_116_7 = 0.075

			if var_116_6 < arg_113_1.time_ and arg_113_1.time_ <= var_116_6 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_8 = arg_113_1:FormatText(StoryNameCfg[613].name)

				arg_113_1.leftNameTxt_.text = var_116_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, true)
				arg_113_1.iconController_:SetSelectedState("hero")

				arg_113_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1020")

				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_9 = arg_113_1:GetWordFromCfg(410142028)
				local var_116_10 = arg_113_1:FormatText(var_116_9.content)

				arg_113_1.text_.text = var_116_10

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_11 = 3
				local var_116_12 = utf8.len(var_116_10)
				local var_116_13 = var_116_11 <= 0 and var_116_7 or var_116_7 * (var_116_12 / var_116_11)

				if var_116_13 > 0 and var_116_7 < var_116_13 then
					arg_113_1.talkMaxDuration = var_116_13

					if var_116_13 + var_116_6 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_13 + var_116_6
					end
				end

				arg_113_1.text_.text = var_116_10
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142028", "story_v_out_410142.awb") ~= 0 then
					local var_116_14 = manager.audio:GetVoiceLength("story_v_out_410142", "410142028", "story_v_out_410142.awb") / 1000

					if var_116_14 + var_116_6 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_14 + var_116_6
					end

					if var_116_9.prefab_name ~= "" and arg_113_1.actors_[var_116_9.prefab_name] ~= nil then
						local var_116_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_9.prefab_name].transform, "story_v_out_410142", "410142028", "story_v_out_410142.awb")

						arg_113_1:RecordAudio("410142028", var_116_15)
						arg_113_1:RecordAudio("410142028", var_116_15)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_410142", "410142028", "story_v_out_410142.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_410142", "410142028", "story_v_out_410142.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_16 = math.max(var_116_7, arg_113_1.talkMaxDuration)

			if var_116_6 <= arg_113_1.time_ and arg_113_1.time_ < var_116_6 + var_116_16 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_6) / var_116_16

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_6 + var_116_16 and arg_113_1.time_ < var_116_6 + var_116_16 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play410142029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 410142029
		arg_117_1.duration_ = 10.633

		local var_117_0 = {
			ja = 10.633,
			CriLanguages = 5.166,
			zh = 5.166
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
				arg_117_0:Play410142030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1061"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos1061 = var_120_0.localPosition
				var_120_0.localScale = Vector3.New(1, 1, 1)

				arg_117_1:CheckSpriteTmpPos("1061", 3)

				local var_120_2 = var_120_0.childCount

				for iter_120_0 = 0, var_120_2 - 1 do
					local var_120_3 = var_120_0:GetChild(iter_120_0)

					if var_120_3.name == "" or not string.find(var_120_3.name, "split") then
						var_120_3.gameObject:SetActive(true)
					else
						var_120_3.gameObject:SetActive(false)
					end
				end
			end

			local var_120_4 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_4 then
				local var_120_5 = (arg_117_1.time_ - var_120_1) / var_120_4
				local var_120_6 = Vector3.New(0, -490, 18)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1061, var_120_6, var_120_5)
			end

			if arg_117_1.time_ >= var_120_1 + var_120_4 and arg_117_1.time_ < var_120_1 + var_120_4 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_120_7 = arg_117_1.actors_["1061"]
			local var_120_8 = 0

			if var_120_8 < arg_117_1.time_ and arg_117_1.time_ <= var_120_8 + arg_120_0 and arg_117_1.var_.actorSpriteComps1061 == nil then
				arg_117_1.var_.actorSpriteComps1061 = var_120_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_120_9 = 0.034

			if var_120_8 <= arg_117_1.time_ and arg_117_1.time_ < var_120_8 + var_120_9 then
				local var_120_10 = (arg_117_1.time_ - var_120_8) / var_120_9

				if arg_117_1.var_.actorSpriteComps1061 then
					for iter_120_1, iter_120_2 in pairs(arg_117_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_120_2 then
							local var_120_11 = Mathf.Lerp(iter_120_2.color.r, 1, var_120_10)

							iter_120_2.color = Color.New(var_120_11, var_120_11, var_120_11)
						end
					end
				end
			end

			if arg_117_1.time_ >= var_120_8 + var_120_9 and arg_117_1.time_ < var_120_8 + var_120_9 + arg_120_0 and arg_117_1.var_.actorSpriteComps1061 then
				local var_120_12 = 1

				for iter_120_3, iter_120_4 in pairs(arg_117_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_120_4 then
						iter_120_4.color = Color.New(var_120_12, var_120_12, var_120_12)
					end
				end

				arg_117_1.var_.actorSpriteComps1061 = nil
			end

			local var_120_13 = 0
			local var_120_14 = 0.45

			if var_120_13 < arg_117_1.time_ and arg_117_1.time_ <= var_120_13 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_15 = arg_117_1:FormatText(StoryNameCfg[612].name)

				arg_117_1.leftNameTxt_.text = var_120_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_16 = arg_117_1:GetWordFromCfg(410142029)
				local var_120_17 = arg_117_1:FormatText(var_120_16.content)

				arg_117_1.text_.text = var_120_17

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_18 = 18
				local var_120_19 = utf8.len(var_120_17)
				local var_120_20 = var_120_18 <= 0 and var_120_14 or var_120_14 * (var_120_19 / var_120_18)

				if var_120_20 > 0 and var_120_14 < var_120_20 then
					arg_117_1.talkMaxDuration = var_120_20

					if var_120_20 + var_120_13 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_20 + var_120_13
					end
				end

				arg_117_1.text_.text = var_120_17
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142029", "story_v_out_410142.awb") ~= 0 then
					local var_120_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142029", "story_v_out_410142.awb") / 1000

					if var_120_21 + var_120_13 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_21 + var_120_13
					end

					if var_120_16.prefab_name ~= "" and arg_117_1.actors_[var_120_16.prefab_name] ~= nil then
						local var_120_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_16.prefab_name].transform, "story_v_out_410142", "410142029", "story_v_out_410142.awb")

						arg_117_1:RecordAudio("410142029", var_120_22)
						arg_117_1:RecordAudio("410142029", var_120_22)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_410142", "410142029", "story_v_out_410142.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_410142", "410142029", "story_v_out_410142.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_23 = math.max(var_120_14, arg_117_1.talkMaxDuration)

			if var_120_13 <= arg_117_1.time_ and arg_117_1.time_ < var_120_13 + var_120_23 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_13) / var_120_23

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_13 + var_120_23 and arg_117_1.time_ < var_120_13 + var_120_23 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play410142030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 410142030
		arg_121_1.duration_ = 5

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play410142031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1061"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 and arg_121_1.var_.actorSpriteComps1061 == nil then
				arg_121_1.var_.actorSpriteComps1061 = var_124_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_124_2 = 0.034

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2

				if arg_121_1.var_.actorSpriteComps1061 then
					for iter_124_0, iter_124_1 in pairs(arg_121_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_124_1 then
							local var_124_4 = Mathf.Lerp(iter_124_1.color.r, 0.5, var_124_3)

							iter_124_1.color = Color.New(var_124_4, var_124_4, var_124_4)
						end
					end
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and arg_121_1.var_.actorSpriteComps1061 then
				local var_124_5 = 0.5

				for iter_124_2, iter_124_3 in pairs(arg_121_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_124_3 then
						iter_124_3.color = Color.New(var_124_5, var_124_5, var_124_5)
					end
				end

				arg_121_1.var_.actorSpriteComps1061 = nil
			end

			local var_124_6 = 0
			local var_124_7 = 1.025

			if var_124_6 < arg_121_1.time_ and arg_121_1.time_ <= var_124_6 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, false)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_8 = arg_121_1:GetWordFromCfg(410142030)
				local var_124_9 = arg_121_1:FormatText(var_124_8.content)

				arg_121_1.text_.text = var_124_9

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_10 = 41
				local var_124_11 = utf8.len(var_124_9)
				local var_124_12 = var_124_10 <= 0 and var_124_7 or var_124_7 * (var_124_11 / var_124_10)

				if var_124_12 > 0 and var_124_7 < var_124_12 then
					arg_121_1.talkMaxDuration = var_124_12

					if var_124_12 + var_124_6 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_12 + var_124_6
					end
				end

				arg_121_1.text_.text = var_124_9
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_13 = math.max(var_124_7, arg_121_1.talkMaxDuration)

			if var_124_6 <= arg_121_1.time_ and arg_121_1.time_ < var_124_6 + var_124_13 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_6) / var_124_13

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_6 + var_124_13 and arg_121_1.time_ < var_124_6 + var_124_13 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play410142031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 410142031
		arg_125_1.duration_ = 9.833

		local var_125_0 = {
			ja = 9.833,
			CriLanguages = 3.366,
			zh = 3.366
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
				arg_125_0:Play410142032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1061"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos1061 = var_128_0.localPosition
				var_128_0.localScale = Vector3.New(1, 1, 1)

				arg_125_1:CheckSpriteTmpPos("1061", 3)

				local var_128_2 = var_128_0.childCount

				for iter_128_0 = 0, var_128_2 - 1 do
					local var_128_3 = var_128_0:GetChild(iter_128_0)

					if var_128_3.name == "split_7" or not string.find(var_128_3.name, "split") then
						var_128_3.gameObject:SetActive(true)
					else
						var_128_3.gameObject:SetActive(false)
					end
				end
			end

			local var_128_4 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_4 then
				local var_128_5 = (arg_125_1.time_ - var_128_1) / var_128_4
				local var_128_6 = Vector3.New(0, -490, 18)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1061, var_128_6, var_128_5)
			end

			if arg_125_1.time_ >= var_128_1 + var_128_4 and arg_125_1.time_ < var_128_1 + var_128_4 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_128_7 = arg_125_1.actors_["1061"]
			local var_128_8 = 0

			if var_128_8 < arg_125_1.time_ and arg_125_1.time_ <= var_128_8 + arg_128_0 and arg_125_1.var_.actorSpriteComps1061 == nil then
				arg_125_1.var_.actorSpriteComps1061 = var_128_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_128_9 = 0.034

			if var_128_8 <= arg_125_1.time_ and arg_125_1.time_ < var_128_8 + var_128_9 then
				local var_128_10 = (arg_125_1.time_ - var_128_8) / var_128_9

				if arg_125_1.var_.actorSpriteComps1061 then
					for iter_128_1, iter_128_2 in pairs(arg_125_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_128_2 then
							local var_128_11 = Mathf.Lerp(iter_128_2.color.r, 1, var_128_10)

							iter_128_2.color = Color.New(var_128_11, var_128_11, var_128_11)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_8 + var_128_9 and arg_125_1.time_ < var_128_8 + var_128_9 + arg_128_0 and arg_125_1.var_.actorSpriteComps1061 then
				local var_128_12 = 1

				for iter_128_3, iter_128_4 in pairs(arg_125_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_128_4 then
						iter_128_4.color = Color.New(var_128_12, var_128_12, var_128_12)
					end
				end

				arg_125_1.var_.actorSpriteComps1061 = nil
			end

			local var_128_13 = 0
			local var_128_14 = 0.275

			if var_128_13 < arg_125_1.time_ and arg_125_1.time_ <= var_128_13 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_15 = arg_125_1:FormatText(StoryNameCfg[612].name)

				arg_125_1.leftNameTxt_.text = var_128_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_16 = arg_125_1:GetWordFromCfg(410142031)
				local var_128_17 = arg_125_1:FormatText(var_128_16.content)

				arg_125_1.text_.text = var_128_17

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_18 = 11
				local var_128_19 = utf8.len(var_128_17)
				local var_128_20 = var_128_18 <= 0 and var_128_14 or var_128_14 * (var_128_19 / var_128_18)

				if var_128_20 > 0 and var_128_14 < var_128_20 then
					arg_125_1.talkMaxDuration = var_128_20

					if var_128_20 + var_128_13 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_20 + var_128_13
					end
				end

				arg_125_1.text_.text = var_128_17
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142031", "story_v_out_410142.awb") ~= 0 then
					local var_128_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142031", "story_v_out_410142.awb") / 1000

					if var_128_21 + var_128_13 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_21 + var_128_13
					end

					if var_128_16.prefab_name ~= "" and arg_125_1.actors_[var_128_16.prefab_name] ~= nil then
						local var_128_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_16.prefab_name].transform, "story_v_out_410142", "410142031", "story_v_out_410142.awb")

						arg_125_1:RecordAudio("410142031", var_128_22)
						arg_125_1:RecordAudio("410142031", var_128_22)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_410142", "410142031", "story_v_out_410142.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_410142", "410142031", "story_v_out_410142.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_23 = math.max(var_128_14, arg_125_1.talkMaxDuration)

			if var_128_13 <= arg_125_1.time_ and arg_125_1.time_ < var_128_13 + var_128_23 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_13) / var_128_23

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_13 + var_128_23 and arg_125_1.time_ < var_128_13 + var_128_23 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play410142032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 410142032
		arg_129_1.duration_ = 14.466

		local var_129_0 = {
			ja = 14.466,
			CriLanguages = 5.8,
			zh = 5.8
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
				arg_129_0:Play410142033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1061"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos1061 = var_132_0.localPosition
				var_132_0.localScale = Vector3.New(1, 1, 1)

				arg_129_1:CheckSpriteTmpPos("1061", 3)

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
				local var_132_6 = Vector3.New(0, -490, 18)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1061, var_132_6, var_132_5)
			end

			if arg_129_1.time_ >= var_132_1 + var_132_4 and arg_129_1.time_ < var_132_1 + var_132_4 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_132_7 = arg_129_1.actors_["1061"]
			local var_132_8 = 0

			if var_132_8 < arg_129_1.time_ and arg_129_1.time_ <= var_132_8 + arg_132_0 and arg_129_1.var_.actorSpriteComps1061 == nil then
				arg_129_1.var_.actorSpriteComps1061 = var_132_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_132_9 = 0.034

			if var_132_8 <= arg_129_1.time_ and arg_129_1.time_ < var_132_8 + var_132_9 then
				local var_132_10 = (arg_129_1.time_ - var_132_8) / var_132_9

				if arg_129_1.var_.actorSpriteComps1061 then
					for iter_132_1, iter_132_2 in pairs(arg_129_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_132_2 then
							local var_132_11 = Mathf.Lerp(iter_132_2.color.r, 0.5, var_132_10)

							iter_132_2.color = Color.New(var_132_11, var_132_11, var_132_11)
						end
					end
				end
			end

			if arg_129_1.time_ >= var_132_8 + var_132_9 and arg_129_1.time_ < var_132_8 + var_132_9 + arg_132_0 and arg_129_1.var_.actorSpriteComps1061 then
				local var_132_12 = 0.5

				for iter_132_3, iter_132_4 in pairs(arg_129_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_132_4 then
						iter_132_4.color = Color.New(var_132_12, var_132_12, var_132_12)
					end
				end

				arg_129_1.var_.actorSpriteComps1061 = nil
			end

			local var_132_13 = 0
			local var_132_14 = 0.575

			if var_132_13 < arg_129_1.time_ and arg_129_1.time_ <= var_132_13 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_15 = arg_129_1:FormatText(StoryNameCfg[613].name)

				arg_129_1.leftNameTxt_.text = var_132_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, true)
				arg_129_1.iconController_:SetSelectedState("hero")

				arg_129_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1020")

				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_16 = arg_129_1:GetWordFromCfg(410142032)
				local var_132_17 = arg_129_1:FormatText(var_132_16.content)

				arg_129_1.text_.text = var_132_17

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_18 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142032", "story_v_out_410142.awb") ~= 0 then
					local var_132_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142032", "story_v_out_410142.awb") / 1000

					if var_132_21 + var_132_13 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_21 + var_132_13
					end

					if var_132_16.prefab_name ~= "" and arg_129_1.actors_[var_132_16.prefab_name] ~= nil then
						local var_132_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_16.prefab_name].transform, "story_v_out_410142", "410142032", "story_v_out_410142.awb")

						arg_129_1:RecordAudio("410142032", var_132_22)
						arg_129_1:RecordAudio("410142032", var_132_22)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_410142", "410142032", "story_v_out_410142.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_410142", "410142032", "story_v_out_410142.awb")
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
	Play410142033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 410142033
		arg_133_1.duration_ = 12.6

		local var_133_0 = {
			ja = 12.6,
			CriLanguages = 11.6,
			zh = 11.6
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
				arg_133_0:Play410142034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1061"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos1061 = var_136_0.localPosition
				var_136_0.localScale = Vector3.New(1, 1, 1)

				arg_133_1:CheckSpriteTmpPos("1061", 3)

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
				local var_136_6 = Vector3.New(0, -490, 18)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1061, var_136_6, var_136_5)
			end

			if arg_133_1.time_ >= var_136_1 + var_136_4 and arg_133_1.time_ < var_136_1 + var_136_4 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_136_7 = arg_133_1.actors_["1061"]
			local var_136_8 = 0

			if var_136_8 < arg_133_1.time_ and arg_133_1.time_ <= var_136_8 + arg_136_0 and arg_133_1.var_.actorSpriteComps1061 == nil then
				arg_133_1.var_.actorSpriteComps1061 = var_136_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_136_9 = 0.034

			if var_136_8 <= arg_133_1.time_ and arg_133_1.time_ < var_136_8 + var_136_9 then
				local var_136_10 = (arg_133_1.time_ - var_136_8) / var_136_9

				if arg_133_1.var_.actorSpriteComps1061 then
					for iter_136_1, iter_136_2 in pairs(arg_133_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_136_2 then
							local var_136_11 = Mathf.Lerp(iter_136_2.color.r, 1, var_136_10)

							iter_136_2.color = Color.New(var_136_11, var_136_11, var_136_11)
						end
					end
				end
			end

			if arg_133_1.time_ >= var_136_8 + var_136_9 and arg_133_1.time_ < var_136_8 + var_136_9 + arg_136_0 and arg_133_1.var_.actorSpriteComps1061 then
				local var_136_12 = 1

				for iter_136_3, iter_136_4 in pairs(arg_133_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_136_4 then
						iter_136_4.color = Color.New(var_136_12, var_136_12, var_136_12)
					end
				end

				arg_133_1.var_.actorSpriteComps1061 = nil
			end

			local var_136_13 = 0
			local var_136_14 = 1.35

			if var_136_13 < arg_133_1.time_ and arg_133_1.time_ <= var_136_13 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_15 = arg_133_1:FormatText(StoryNameCfg[612].name)

				arg_133_1.leftNameTxt_.text = var_136_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_16 = arg_133_1:GetWordFromCfg(410142033)
				local var_136_17 = arg_133_1:FormatText(var_136_16.content)

				arg_133_1.text_.text = var_136_17

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_18 = 54
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142033", "story_v_out_410142.awb") ~= 0 then
					local var_136_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142033", "story_v_out_410142.awb") / 1000

					if var_136_21 + var_136_13 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_21 + var_136_13
					end

					if var_136_16.prefab_name ~= "" and arg_133_1.actors_[var_136_16.prefab_name] ~= nil then
						local var_136_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_16.prefab_name].transform, "story_v_out_410142", "410142033", "story_v_out_410142.awb")

						arg_133_1:RecordAudio("410142033", var_136_22)
						arg_133_1:RecordAudio("410142033", var_136_22)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_410142", "410142033", "story_v_out_410142.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_410142", "410142033", "story_v_out_410142.awb")
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
	Play410142034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 410142034
		arg_137_1.duration_ = 5

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play410142035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1061"].transform
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1.var_.moveOldPos1061 = var_140_0.localPosition
				var_140_0.localScale = Vector3.New(1, 1, 1)

				arg_137_1:CheckSpriteTmpPos("1061", 3)

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
				local var_140_6 = Vector3.New(0, -490, 18)

				var_140_0.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1061, var_140_6, var_140_5)
			end

			if arg_137_1.time_ >= var_140_1 + var_140_4 and arg_137_1.time_ < var_140_1 + var_140_4 + arg_140_0 then
				var_140_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_140_7 = arg_137_1.actors_["1061"]
			local var_140_8 = 0

			if var_140_8 < arg_137_1.time_ and arg_137_1.time_ <= var_140_8 + arg_140_0 and arg_137_1.var_.actorSpriteComps1061 == nil then
				arg_137_1.var_.actorSpriteComps1061 = var_140_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_140_9 = 0.034

			if var_140_8 <= arg_137_1.time_ and arg_137_1.time_ < var_140_8 + var_140_9 then
				local var_140_10 = (arg_137_1.time_ - var_140_8) / var_140_9

				if arg_137_1.var_.actorSpriteComps1061 then
					for iter_140_1, iter_140_2 in pairs(arg_137_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_140_2 then
							local var_140_11 = Mathf.Lerp(iter_140_2.color.r, 0.5, var_140_10)

							iter_140_2.color = Color.New(var_140_11, var_140_11, var_140_11)
						end
					end
				end
			end

			if arg_137_1.time_ >= var_140_8 + var_140_9 and arg_137_1.time_ < var_140_8 + var_140_9 + arg_140_0 and arg_137_1.var_.actorSpriteComps1061 then
				local var_140_12 = 0.5

				for iter_140_3, iter_140_4 in pairs(arg_137_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_140_4 then
						iter_140_4.color = Color.New(var_140_12, var_140_12, var_140_12)
					end
				end

				arg_137_1.var_.actorSpriteComps1061 = nil
			end

			local var_140_13 = manager.ui.mainCamera.transform
			local var_140_14 = 0.5

			if var_140_14 < arg_137_1.time_ and arg_137_1.time_ <= var_140_14 + arg_140_0 then
				arg_137_1.var_.shakeOldPos = var_140_13.localPosition
			end

			local var_140_15 = 0.5

			if var_140_14 <= arg_137_1.time_ and arg_137_1.time_ < var_140_14 + var_140_15 then
				local var_140_16 = (arg_137_1.time_ - var_140_14) / 0.066
				local var_140_17, var_140_18 = math.modf(var_140_16)

				var_140_13.localPosition = Vector3.New(var_140_18 * 0.13, var_140_18 * 0.13, var_140_18 * 0.13) + arg_137_1.var_.shakeOldPos
			end

			if arg_137_1.time_ >= var_140_14 + var_140_15 and arg_137_1.time_ < var_140_14 + var_140_15 + arg_140_0 then
				var_140_13.localPosition = arg_137_1.var_.shakeOldPos
			end

			local var_140_19 = 0

			if var_140_19 < arg_137_1.time_ and arg_137_1.time_ <= var_140_19 + arg_140_0 then
				arg_137_1.allBtn_.enabled = false
			end

			local var_140_20 = 1

			if arg_137_1.time_ >= var_140_19 + var_140_20 and arg_137_1.time_ < var_140_19 + var_140_20 + arg_140_0 then
				arg_137_1.allBtn_.enabled = true
			end

			local var_140_21 = 0

			if var_140_21 < arg_137_1.time_ and arg_137_1.time_ <= var_140_21 + arg_140_0 then
				arg_137_1.mask_.enabled = true
				arg_137_1.mask_.raycastTarget = false

				arg_137_1:SetGaussion(false)
			end

			local var_140_22 = 0.5

			if var_140_21 <= arg_137_1.time_ and arg_137_1.time_ < var_140_21 + var_140_22 then
				local var_140_23 = (arg_137_1.time_ - var_140_21) / var_140_22
				local var_140_24 = Color.New(1, 1, 1)

				var_140_24.a = Mathf.Lerp(1, 0, var_140_23)
				arg_137_1.mask_.color = var_140_24
			end

			if arg_137_1.time_ >= var_140_21 + var_140_22 and arg_137_1.time_ < var_140_21 + var_140_22 + arg_140_0 then
				local var_140_25 = Color.New(1, 1, 1)
				local var_140_26 = 0

				arg_137_1.mask_.enabled = false
				var_140_25.a = var_140_26
				arg_137_1.mask_.color = var_140_25
			end

			local var_140_27 = manager.ui.mainCamera.transform
			local var_140_28 = 0

			if var_140_28 < arg_137_1.time_ and arg_137_1.time_ <= var_140_28 + arg_140_0 then
				arg_137_1.var_.shakeOldPos = var_140_27.localPosition
			end

			local var_140_29 = 0.5

			if var_140_28 <= arg_137_1.time_ and arg_137_1.time_ < var_140_28 + var_140_29 then
				local var_140_30 = (arg_137_1.time_ - var_140_28) / 0.066
				local var_140_31, var_140_32 = math.modf(var_140_30)

				var_140_27.localPosition = Vector3.New(var_140_32 * 0.13, var_140_32 * 0.13, var_140_32 * 0.13) + arg_137_1.var_.shakeOldPos
			end

			if arg_137_1.time_ >= var_140_28 + var_140_29 and arg_137_1.time_ < var_140_28 + var_140_29 + arg_140_0 then
				var_140_27.localPosition = arg_137_1.var_.shakeOldPos
			end

			local var_140_33 = 0

			if var_140_33 < arg_137_1.time_ and arg_137_1.time_ <= var_140_33 + arg_140_0 then
				arg_137_1.allBtn_.enabled = false
			end

			local var_140_34 = 0.5

			if arg_137_1.time_ >= var_140_33 + var_140_34 and arg_137_1.time_ < var_140_33 + var_140_34 + arg_140_0 then
				arg_137_1.allBtn_.enabled = true
			end

			local var_140_35 = 0
			local var_140_36 = 1.275

			if var_140_35 < arg_137_1.time_ and arg_137_1.time_ <= var_140_35 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, false)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_37 = arg_137_1:GetWordFromCfg(410142034)
				local var_140_38 = arg_137_1:FormatText(var_140_37.content)

				arg_137_1.text_.text = var_140_38

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_39 = 51
				local var_140_40 = utf8.len(var_140_38)
				local var_140_41 = var_140_39 <= 0 and var_140_36 or var_140_36 * (var_140_40 / var_140_39)

				if var_140_41 > 0 and var_140_36 < var_140_41 then
					arg_137_1.talkMaxDuration = var_140_41

					if var_140_41 + var_140_35 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_41 + var_140_35
					end
				end

				arg_137_1.text_.text = var_140_38
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_42 = math.max(var_140_36, arg_137_1.talkMaxDuration)

			if var_140_35 <= arg_137_1.time_ and arg_137_1.time_ < var_140_35 + var_140_42 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_35) / var_140_42

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_35 + var_140_42 and arg_137_1.time_ < var_140_35 + var_140_42 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play410142035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 410142035
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play410142036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 0.625

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, false)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_2 = arg_141_1:GetWordFromCfg(410142035)
				local var_144_3 = arg_141_1:FormatText(var_144_2.content)

				arg_141_1.text_.text = var_144_3

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_4 = 25
				local var_144_5 = utf8.len(var_144_3)
				local var_144_6 = var_144_4 <= 0 and var_144_1 or var_144_1 * (var_144_5 / var_144_4)

				if var_144_6 > 0 and var_144_1 < var_144_6 then
					arg_141_1.talkMaxDuration = var_144_6

					if var_144_6 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_6 + var_144_0
					end
				end

				arg_141_1.text_.text = var_144_3
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)
				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_7 = math.max(var_144_1, arg_141_1.talkMaxDuration)

			if var_144_0 <= arg_141_1.time_ and arg_141_1.time_ < var_144_0 + var_144_7 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_0) / var_144_7

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_0 + var_144_7 and arg_141_1.time_ < var_144_0 + var_144_7 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play410142036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 410142036
		arg_145_1.duration_ = 3.9

		local var_145_0 = {
			ja = 3.9,
			CriLanguages = 2.533,
			zh = 2.533
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
				arg_145_0:Play410142037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1061"].transform
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1.var_.moveOldPos1061 = var_148_0.localPosition
				var_148_0.localScale = Vector3.New(1, 1, 1)

				arg_145_1:CheckSpriteTmpPos("1061", 3)

				local var_148_2 = var_148_0.childCount

				for iter_148_0 = 0, var_148_2 - 1 do
					local var_148_3 = var_148_0:GetChild(iter_148_0)

					if var_148_3.name == "split_9" or not string.find(var_148_3.name, "split") then
						var_148_3.gameObject:SetActive(true)
					else
						var_148_3.gameObject:SetActive(false)
					end
				end
			end

			local var_148_4 = 0.001

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_4 then
				local var_148_5 = (arg_145_1.time_ - var_148_1) / var_148_4
				local var_148_6 = Vector3.New(0, -490, 18)

				var_148_0.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1061, var_148_6, var_148_5)
			end

			if arg_145_1.time_ >= var_148_1 + var_148_4 and arg_145_1.time_ < var_148_1 + var_148_4 + arg_148_0 then
				var_148_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_148_7 = arg_145_1.actors_["1061"]
			local var_148_8 = 0

			if var_148_8 < arg_145_1.time_ and arg_145_1.time_ <= var_148_8 + arg_148_0 and arg_145_1.var_.actorSpriteComps1061 == nil then
				arg_145_1.var_.actorSpriteComps1061 = var_148_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_148_9 = 0.034

			if var_148_8 <= arg_145_1.time_ and arg_145_1.time_ < var_148_8 + var_148_9 then
				local var_148_10 = (arg_145_1.time_ - var_148_8) / var_148_9

				if arg_145_1.var_.actorSpriteComps1061 then
					for iter_148_1, iter_148_2 in pairs(arg_145_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_148_2 then
							local var_148_11 = Mathf.Lerp(iter_148_2.color.r, 1, var_148_10)

							iter_148_2.color = Color.New(var_148_11, var_148_11, var_148_11)
						end
					end
				end
			end

			if arg_145_1.time_ >= var_148_8 + var_148_9 and arg_145_1.time_ < var_148_8 + var_148_9 + arg_148_0 and arg_145_1.var_.actorSpriteComps1061 then
				local var_148_12 = 1

				for iter_148_3, iter_148_4 in pairs(arg_145_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_148_4 then
						iter_148_4.color = Color.New(var_148_12, var_148_12, var_148_12)
					end
				end

				arg_145_1.var_.actorSpriteComps1061 = nil
			end

			local var_148_13 = 0
			local var_148_14 = 0.25

			if var_148_13 < arg_145_1.time_ and arg_145_1.time_ <= var_148_13 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_15 = arg_145_1:FormatText(StoryNameCfg[612].name)

				arg_145_1.leftNameTxt_.text = var_148_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_16 = arg_145_1:GetWordFromCfg(410142036)
				local var_148_17 = arg_145_1:FormatText(var_148_16.content)

				arg_145_1.text_.text = var_148_17

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_18 = 10
				local var_148_19 = utf8.len(var_148_17)
				local var_148_20 = var_148_18 <= 0 and var_148_14 or var_148_14 * (var_148_19 / var_148_18)

				if var_148_20 > 0 and var_148_14 < var_148_20 then
					arg_145_1.talkMaxDuration = var_148_20

					if var_148_20 + var_148_13 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_20 + var_148_13
					end
				end

				arg_145_1.text_.text = var_148_17
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142036", "story_v_out_410142.awb") ~= 0 then
					local var_148_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142036", "story_v_out_410142.awb") / 1000

					if var_148_21 + var_148_13 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_21 + var_148_13
					end

					if var_148_16.prefab_name ~= "" and arg_145_1.actors_[var_148_16.prefab_name] ~= nil then
						local var_148_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_16.prefab_name].transform, "story_v_out_410142", "410142036", "story_v_out_410142.awb")

						arg_145_1:RecordAudio("410142036", var_148_22)
						arg_145_1:RecordAudio("410142036", var_148_22)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_410142", "410142036", "story_v_out_410142.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_410142", "410142036", "story_v_out_410142.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_23 = math.max(var_148_14, arg_145_1.talkMaxDuration)

			if var_148_13 <= arg_145_1.time_ and arg_145_1.time_ < var_148_13 + var_148_23 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_13) / var_148_23

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_13 + var_148_23 and arg_145_1.time_ < var_148_13 + var_148_23 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play410142037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 410142037
		arg_149_1.duration_ = 5.666

		local var_149_0 = {
			ja = 5.666,
			CriLanguages = 3.333,
			zh = 3.333
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
				arg_149_0:Play410142038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1061"].transform
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1.var_.moveOldPos1061 = var_152_0.localPosition
				var_152_0.localScale = Vector3.New(1, 1, 1)

				arg_149_1:CheckSpriteTmpPos("1061", 3)

				local var_152_2 = var_152_0.childCount

				for iter_152_0 = 0, var_152_2 - 1 do
					local var_152_3 = var_152_0:GetChild(iter_152_0)

					if var_152_3.name == "" or not string.find(var_152_3.name, "split") then
						var_152_3.gameObject:SetActive(true)
					else
						var_152_3.gameObject:SetActive(false)
					end
				end
			end

			local var_152_4 = 0.001

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_4 then
				local var_152_5 = (arg_149_1.time_ - var_152_1) / var_152_4
				local var_152_6 = Vector3.New(0, -490, 18)

				var_152_0.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos1061, var_152_6, var_152_5)
			end

			if arg_149_1.time_ >= var_152_1 + var_152_4 and arg_149_1.time_ < var_152_1 + var_152_4 + arg_152_0 then
				var_152_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_152_7 = arg_149_1.actors_["1061"]
			local var_152_8 = 0

			if var_152_8 < arg_149_1.time_ and arg_149_1.time_ <= var_152_8 + arg_152_0 and arg_149_1.var_.actorSpriteComps1061 == nil then
				arg_149_1.var_.actorSpriteComps1061 = var_152_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_152_9 = 0.034

			if var_152_8 <= arg_149_1.time_ and arg_149_1.time_ < var_152_8 + var_152_9 then
				local var_152_10 = (arg_149_1.time_ - var_152_8) / var_152_9

				if arg_149_1.var_.actorSpriteComps1061 then
					for iter_152_1, iter_152_2 in pairs(arg_149_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_152_2 then
							local var_152_11 = Mathf.Lerp(iter_152_2.color.r, 0.5, var_152_10)

							iter_152_2.color = Color.New(var_152_11, var_152_11, var_152_11)
						end
					end
				end
			end

			if arg_149_1.time_ >= var_152_8 + var_152_9 and arg_149_1.time_ < var_152_8 + var_152_9 + arg_152_0 and arg_149_1.var_.actorSpriteComps1061 then
				local var_152_12 = 0.5

				for iter_152_3, iter_152_4 in pairs(arg_149_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_152_4 then
						iter_152_4.color = Color.New(var_152_12, var_152_12, var_152_12)
					end
				end

				arg_149_1.var_.actorSpriteComps1061 = nil
			end

			local var_152_13 = 0
			local var_152_14 = 0.4

			if var_152_13 < arg_149_1.time_ and arg_149_1.time_ <= var_152_13 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_15 = arg_149_1:FormatText(StoryNameCfg[613].name)

				arg_149_1.leftNameTxt_.text = var_152_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, true)
				arg_149_1.iconController_:SetSelectedState("hero")

				arg_149_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1020")

				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_16 = arg_149_1:GetWordFromCfg(410142037)
				local var_152_17 = arg_149_1:FormatText(var_152_16.content)

				arg_149_1.text_.text = var_152_17

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_18 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142037", "story_v_out_410142.awb") ~= 0 then
					local var_152_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142037", "story_v_out_410142.awb") / 1000

					if var_152_21 + var_152_13 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_21 + var_152_13
					end

					if var_152_16.prefab_name ~= "" and arg_149_1.actors_[var_152_16.prefab_name] ~= nil then
						local var_152_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_16.prefab_name].transform, "story_v_out_410142", "410142037", "story_v_out_410142.awb")

						arg_149_1:RecordAudio("410142037", var_152_22)
						arg_149_1:RecordAudio("410142037", var_152_22)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_410142", "410142037", "story_v_out_410142.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_410142", "410142037", "story_v_out_410142.awb")
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
	Play410142038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 410142038
		arg_153_1.duration_ = 10.233

		local var_153_0 = {
			ja = 6.8,
			CriLanguages = 10.233,
			zh = 10.233
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
				arg_153_0:Play410142039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1061"].transform
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 then
				arg_153_1.var_.moveOldPos1061 = var_156_0.localPosition
				var_156_0.localScale = Vector3.New(1, 1, 1)

				arg_153_1:CheckSpriteTmpPos("1061", 3)

				local var_156_2 = var_156_0.childCount

				for iter_156_0 = 0, var_156_2 - 1 do
					local var_156_3 = var_156_0:GetChild(iter_156_0)

					if var_156_3.name == "split_5" or not string.find(var_156_3.name, "split") then
						var_156_3.gameObject:SetActive(true)
					else
						var_156_3.gameObject:SetActive(false)
					end
				end
			end

			local var_156_4 = 0.001

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_4 then
				local var_156_5 = (arg_153_1.time_ - var_156_1) / var_156_4
				local var_156_6 = Vector3.New(0, -490, 18)

				var_156_0.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1061, var_156_6, var_156_5)
			end

			if arg_153_1.time_ >= var_156_1 + var_156_4 and arg_153_1.time_ < var_156_1 + var_156_4 + arg_156_0 then
				var_156_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_156_7 = arg_153_1.actors_["1061"]
			local var_156_8 = 0

			if var_156_8 < arg_153_1.time_ and arg_153_1.time_ <= var_156_8 + arg_156_0 and arg_153_1.var_.actorSpriteComps1061 == nil then
				arg_153_1.var_.actorSpriteComps1061 = var_156_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_156_9 = 0.034

			if var_156_8 <= arg_153_1.time_ and arg_153_1.time_ < var_156_8 + var_156_9 then
				local var_156_10 = (arg_153_1.time_ - var_156_8) / var_156_9

				if arg_153_1.var_.actorSpriteComps1061 then
					for iter_156_1, iter_156_2 in pairs(arg_153_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_156_2 then
							local var_156_11 = Mathf.Lerp(iter_156_2.color.r, 1, var_156_10)

							iter_156_2.color = Color.New(var_156_11, var_156_11, var_156_11)
						end
					end
				end
			end

			if arg_153_1.time_ >= var_156_8 + var_156_9 and arg_153_1.time_ < var_156_8 + var_156_9 + arg_156_0 and arg_153_1.var_.actorSpriteComps1061 then
				local var_156_12 = 1

				for iter_156_3, iter_156_4 in pairs(arg_153_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_156_4 then
						iter_156_4.color = Color.New(var_156_12, var_156_12, var_156_12)
					end
				end

				arg_153_1.var_.actorSpriteComps1061 = nil
			end

			local var_156_13 = 0
			local var_156_14 = 1.15

			if var_156_13 < arg_153_1.time_ and arg_153_1.time_ <= var_156_13 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_15 = arg_153_1:FormatText(StoryNameCfg[612].name)

				arg_153_1.leftNameTxt_.text = var_156_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_16 = arg_153_1:GetWordFromCfg(410142038)
				local var_156_17 = arg_153_1:FormatText(var_156_16.content)

				arg_153_1.text_.text = var_156_17

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_18 = 48
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142038", "story_v_out_410142.awb") ~= 0 then
					local var_156_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142038", "story_v_out_410142.awb") / 1000

					if var_156_21 + var_156_13 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_21 + var_156_13
					end

					if var_156_16.prefab_name ~= "" and arg_153_1.actors_[var_156_16.prefab_name] ~= nil then
						local var_156_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_16.prefab_name].transform, "story_v_out_410142", "410142038", "story_v_out_410142.awb")

						arg_153_1:RecordAudio("410142038", var_156_22)
						arg_153_1:RecordAudio("410142038", var_156_22)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_410142", "410142038", "story_v_out_410142.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_410142", "410142038", "story_v_out_410142.awb")
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
	Play410142039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 410142039
		arg_157_1.duration_ = 6.8

		local var_157_0 = {
			ja = 6.8,
			CriLanguages = 5.2,
			zh = 5.2
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
				arg_157_0:Play410142040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1061"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.actorSpriteComps1061 == nil then
				arg_157_1.var_.actorSpriteComps1061 = var_160_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_160_2 = 0.034

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.actorSpriteComps1061 then
					for iter_160_0, iter_160_1 in pairs(arg_157_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_160_1 then
							local var_160_4 = Mathf.Lerp(iter_160_1.color.r, 0.5, var_160_3)

							iter_160_1.color = Color.New(var_160_4, var_160_4, var_160_4)
						end
					end
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.actorSpriteComps1061 then
				local var_160_5 = 0.5

				for iter_160_2, iter_160_3 in pairs(arg_157_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_160_3 then
						iter_160_3.color = Color.New(var_160_5, var_160_5, var_160_5)
					end
				end

				arg_157_1.var_.actorSpriteComps1061 = nil
			end

			local var_160_6 = 0
			local var_160_7 = 0.6

			if var_160_6 < arg_157_1.time_ and arg_157_1.time_ <= var_160_6 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_8 = arg_157_1:FormatText(StoryNameCfg[613].name)

				arg_157_1.leftNameTxt_.text = var_160_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, true)
				arg_157_1.iconController_:SetSelectedState("hero")

				arg_157_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1020")

				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_9 = arg_157_1:GetWordFromCfg(410142039)
				local var_160_10 = arg_157_1:FormatText(var_160_9.content)

				arg_157_1.text_.text = var_160_10

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_11 = 24
				local var_160_12 = utf8.len(var_160_10)
				local var_160_13 = var_160_11 <= 0 and var_160_7 or var_160_7 * (var_160_12 / var_160_11)

				if var_160_13 > 0 and var_160_7 < var_160_13 then
					arg_157_1.talkMaxDuration = var_160_13

					if var_160_13 + var_160_6 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_13 + var_160_6
					end
				end

				arg_157_1.text_.text = var_160_10
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142039", "story_v_out_410142.awb") ~= 0 then
					local var_160_14 = manager.audio:GetVoiceLength("story_v_out_410142", "410142039", "story_v_out_410142.awb") / 1000

					if var_160_14 + var_160_6 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_14 + var_160_6
					end

					if var_160_9.prefab_name ~= "" and arg_157_1.actors_[var_160_9.prefab_name] ~= nil then
						local var_160_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_9.prefab_name].transform, "story_v_out_410142", "410142039", "story_v_out_410142.awb")

						arg_157_1:RecordAudio("410142039", var_160_15)
						arg_157_1:RecordAudio("410142039", var_160_15)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_410142", "410142039", "story_v_out_410142.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_410142", "410142039", "story_v_out_410142.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_16 = math.max(var_160_7, arg_157_1.talkMaxDuration)

			if var_160_6 <= arg_157_1.time_ and arg_157_1.time_ < var_160_6 + var_160_16 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_6) / var_160_16

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_6 + var_160_16 and arg_157_1.time_ < var_160_6 + var_160_16 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play410142040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 410142040
		arg_161_1.duration_ = 15.566

		local var_161_0 = {
			ja = 15.566,
			CriLanguages = 10.433,
			zh = 10.433
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
				arg_161_0:Play410142041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1061"].transform
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPos1061 = var_164_0.localPosition
				var_164_0.localScale = Vector3.New(1, 1, 1)

				arg_161_1:CheckSpriteTmpPos("1061", 3)

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
				local var_164_6 = Vector3.New(0, -490, 18)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1061, var_164_6, var_164_5)
			end

			if arg_161_1.time_ >= var_164_1 + var_164_4 and arg_161_1.time_ < var_164_1 + var_164_4 + arg_164_0 then
				var_164_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_164_7 = arg_161_1.actors_["1061"]
			local var_164_8 = 0

			if var_164_8 < arg_161_1.time_ and arg_161_1.time_ <= var_164_8 + arg_164_0 and arg_161_1.var_.actorSpriteComps1061 == nil then
				arg_161_1.var_.actorSpriteComps1061 = var_164_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_164_9 = 0.034

			if var_164_8 <= arg_161_1.time_ and arg_161_1.time_ < var_164_8 + var_164_9 then
				local var_164_10 = (arg_161_1.time_ - var_164_8) / var_164_9

				if arg_161_1.var_.actorSpriteComps1061 then
					for iter_164_1, iter_164_2 in pairs(arg_161_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_164_2 then
							local var_164_11 = Mathf.Lerp(iter_164_2.color.r, 1, var_164_10)

							iter_164_2.color = Color.New(var_164_11, var_164_11, var_164_11)
						end
					end
				end
			end

			if arg_161_1.time_ >= var_164_8 + var_164_9 and arg_161_1.time_ < var_164_8 + var_164_9 + arg_164_0 and arg_161_1.var_.actorSpriteComps1061 then
				local var_164_12 = 1

				for iter_164_3, iter_164_4 in pairs(arg_161_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_164_4 then
						iter_164_4.color = Color.New(var_164_12, var_164_12, var_164_12)
					end
				end

				arg_161_1.var_.actorSpriteComps1061 = nil
			end

			local var_164_13 = 0
			local var_164_14 = 1.3

			if var_164_13 < arg_161_1.time_ and arg_161_1.time_ <= var_164_13 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_15 = arg_161_1:FormatText(StoryNameCfg[612].name)

				arg_161_1.leftNameTxt_.text = var_164_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_16 = arg_161_1:GetWordFromCfg(410142040)
				local var_164_17 = arg_161_1:FormatText(var_164_16.content)

				arg_161_1.text_.text = var_164_17

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_18 = 52
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142040", "story_v_out_410142.awb") ~= 0 then
					local var_164_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142040", "story_v_out_410142.awb") / 1000

					if var_164_21 + var_164_13 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_21 + var_164_13
					end

					if var_164_16.prefab_name ~= "" and arg_161_1.actors_[var_164_16.prefab_name] ~= nil then
						local var_164_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_16.prefab_name].transform, "story_v_out_410142", "410142040", "story_v_out_410142.awb")

						arg_161_1:RecordAudio("410142040", var_164_22)
						arg_161_1:RecordAudio("410142040", var_164_22)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_410142", "410142040", "story_v_out_410142.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_410142", "410142040", "story_v_out_410142.awb")
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
	Play410142041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 410142041
		arg_165_1.duration_ = 7.766

		local var_165_0 = {
			ja = 7.766,
			CriLanguages = 7.066,
			zh = 7.066
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
				arg_165_0:Play410142042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["1061"].transform
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				arg_165_1.var_.moveOldPos1061 = var_168_0.localPosition
				var_168_0.localScale = Vector3.New(1, 1, 1)

				arg_165_1:CheckSpriteTmpPos("1061", 3)

				local var_168_2 = var_168_0.childCount

				for iter_168_0 = 0, var_168_2 - 1 do
					local var_168_3 = var_168_0:GetChild(iter_168_0)

					if var_168_3.name == "" or not string.find(var_168_3.name, "split") then
						var_168_3.gameObject:SetActive(true)
					else
						var_168_3.gameObject:SetActive(false)
					end
				end
			end

			local var_168_4 = 0.001

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_4 then
				local var_168_5 = (arg_165_1.time_ - var_168_1) / var_168_4
				local var_168_6 = Vector3.New(0, -490, 18)

				var_168_0.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1061, var_168_6, var_168_5)
			end

			if arg_165_1.time_ >= var_168_1 + var_168_4 and arg_165_1.time_ < var_168_1 + var_168_4 + arg_168_0 then
				var_168_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_168_7 = arg_165_1.actors_["1061"]
			local var_168_8 = 0

			if var_168_8 < arg_165_1.time_ and arg_165_1.time_ <= var_168_8 + arg_168_0 and arg_165_1.var_.actorSpriteComps1061 == nil then
				arg_165_1.var_.actorSpriteComps1061 = var_168_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_168_9 = 0.034

			if var_168_8 <= arg_165_1.time_ and arg_165_1.time_ < var_168_8 + var_168_9 then
				local var_168_10 = (arg_165_1.time_ - var_168_8) / var_168_9

				if arg_165_1.var_.actorSpriteComps1061 then
					for iter_168_1, iter_168_2 in pairs(arg_165_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_168_2 then
							local var_168_11 = Mathf.Lerp(iter_168_2.color.r, 0.5, var_168_10)

							iter_168_2.color = Color.New(var_168_11, var_168_11, var_168_11)
						end
					end
				end
			end

			if arg_165_1.time_ >= var_168_8 + var_168_9 and arg_165_1.time_ < var_168_8 + var_168_9 + arg_168_0 and arg_165_1.var_.actorSpriteComps1061 then
				local var_168_12 = 0.5

				for iter_168_3, iter_168_4 in pairs(arg_165_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_168_4 then
						iter_168_4.color = Color.New(var_168_12, var_168_12, var_168_12)
					end
				end

				arg_165_1.var_.actorSpriteComps1061 = nil
			end

			local var_168_13 = 0
			local var_168_14 = 0.6

			if var_168_13 < arg_165_1.time_ and arg_165_1.time_ <= var_168_13 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_15 = arg_165_1:FormatText(StoryNameCfg[613].name)

				arg_165_1.leftNameTxt_.text = var_168_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, true)
				arg_165_1.iconController_:SetSelectedState("hero")

				arg_165_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1020")

				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_16 = arg_165_1:GetWordFromCfg(410142041)
				local var_168_17 = arg_165_1:FormatText(var_168_16.content)

				arg_165_1.text_.text = var_168_17

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_18 = 24
				local var_168_19 = utf8.len(var_168_17)
				local var_168_20 = var_168_18 <= 0 and var_168_14 or var_168_14 * (var_168_19 / var_168_18)

				if var_168_20 > 0 and var_168_14 < var_168_20 then
					arg_165_1.talkMaxDuration = var_168_20

					if var_168_20 + var_168_13 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_20 + var_168_13
					end
				end

				arg_165_1.text_.text = var_168_17
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142041", "story_v_out_410142.awb") ~= 0 then
					local var_168_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142041", "story_v_out_410142.awb") / 1000

					if var_168_21 + var_168_13 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_21 + var_168_13
					end

					if var_168_16.prefab_name ~= "" and arg_165_1.actors_[var_168_16.prefab_name] ~= nil then
						local var_168_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_16.prefab_name].transform, "story_v_out_410142", "410142041", "story_v_out_410142.awb")

						arg_165_1:RecordAudio("410142041", var_168_22)
						arg_165_1:RecordAudio("410142041", var_168_22)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_410142", "410142041", "story_v_out_410142.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_410142", "410142041", "story_v_out_410142.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_23 = math.max(var_168_14, arg_165_1.talkMaxDuration)

			if var_168_13 <= arg_165_1.time_ and arg_165_1.time_ < var_168_13 + var_168_23 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_13) / var_168_23

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_13 + var_168_23 and arg_165_1.time_ < var_168_13 + var_168_23 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play410142042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 410142042
		arg_169_1.duration_ = 4.966

		local var_169_0 = {
			ja = 4.966,
			CriLanguages = 3.6,
			zh = 3.6
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
				arg_169_0:Play410142043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1061"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos1061 = var_172_0.localPosition
				var_172_0.localScale = Vector3.New(1, 1, 1)

				arg_169_1:CheckSpriteTmpPos("1061", 3)

				local var_172_2 = var_172_0.childCount

				for iter_172_0 = 0, var_172_2 - 1 do
					local var_172_3 = var_172_0:GetChild(iter_172_0)

					if var_172_3.name == "split_1" or not string.find(var_172_3.name, "split") then
						var_172_3.gameObject:SetActive(true)
					else
						var_172_3.gameObject:SetActive(false)
					end
				end
			end

			local var_172_4 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_4 then
				local var_172_5 = (arg_169_1.time_ - var_172_1) / var_172_4
				local var_172_6 = Vector3.New(0, -490, 18)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1061, var_172_6, var_172_5)
			end

			if arg_169_1.time_ >= var_172_1 + var_172_4 and arg_169_1.time_ < var_172_1 + var_172_4 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_172_7 = arg_169_1.actors_["1061"]
			local var_172_8 = 0

			if var_172_8 < arg_169_1.time_ and arg_169_1.time_ <= var_172_8 + arg_172_0 and arg_169_1.var_.actorSpriteComps1061 == nil then
				arg_169_1.var_.actorSpriteComps1061 = var_172_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_172_9 = 0.034

			if var_172_8 <= arg_169_1.time_ and arg_169_1.time_ < var_172_8 + var_172_9 then
				local var_172_10 = (arg_169_1.time_ - var_172_8) / var_172_9

				if arg_169_1.var_.actorSpriteComps1061 then
					for iter_172_1, iter_172_2 in pairs(arg_169_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_172_2 then
							local var_172_11 = Mathf.Lerp(iter_172_2.color.r, 1, var_172_10)

							iter_172_2.color = Color.New(var_172_11, var_172_11, var_172_11)
						end
					end
				end
			end

			if arg_169_1.time_ >= var_172_8 + var_172_9 and arg_169_1.time_ < var_172_8 + var_172_9 + arg_172_0 and arg_169_1.var_.actorSpriteComps1061 then
				local var_172_12 = 1

				for iter_172_3, iter_172_4 in pairs(arg_169_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_172_4 then
						iter_172_4.color = Color.New(var_172_12, var_172_12, var_172_12)
					end
				end

				arg_169_1.var_.actorSpriteComps1061 = nil
			end

			local var_172_13 = 0
			local var_172_14 = 0.375

			if var_172_13 < arg_169_1.time_ and arg_169_1.time_ <= var_172_13 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_15 = arg_169_1:FormatText(StoryNameCfg[612].name)

				arg_169_1.leftNameTxt_.text = var_172_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_16 = arg_169_1:GetWordFromCfg(410142042)
				local var_172_17 = arg_169_1:FormatText(var_172_16.content)

				arg_169_1.text_.text = var_172_17

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_18 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142042", "story_v_out_410142.awb") ~= 0 then
					local var_172_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142042", "story_v_out_410142.awb") / 1000

					if var_172_21 + var_172_13 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_21 + var_172_13
					end

					if var_172_16.prefab_name ~= "" and arg_169_1.actors_[var_172_16.prefab_name] ~= nil then
						local var_172_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_16.prefab_name].transform, "story_v_out_410142", "410142042", "story_v_out_410142.awb")

						arg_169_1:RecordAudio("410142042", var_172_22)
						arg_169_1:RecordAudio("410142042", var_172_22)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_410142", "410142042", "story_v_out_410142.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_410142", "410142042", "story_v_out_410142.awb")
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
	Play410142043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 410142043
		arg_173_1.duration_ = 4.633

		local var_173_0 = {
			ja = 4.633,
			CriLanguages = 3.733,
			zh = 3.733
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
				arg_173_0:Play410142044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1061"]
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 and arg_173_1.var_.actorSpriteComps1061 == nil then
				arg_173_1.var_.actorSpriteComps1061 = var_176_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_176_2 = 0.034

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2

				if arg_173_1.var_.actorSpriteComps1061 then
					for iter_176_0, iter_176_1 in pairs(arg_173_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_176_1 then
							local var_176_4 = Mathf.Lerp(iter_176_1.color.r, 0.5, var_176_3)

							iter_176_1.color = Color.New(var_176_4, var_176_4, var_176_4)
						end
					end
				end
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 and arg_173_1.var_.actorSpriteComps1061 then
				local var_176_5 = 0.5

				for iter_176_2, iter_176_3 in pairs(arg_173_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_176_3 then
						iter_176_3.color = Color.New(var_176_5, var_176_5, var_176_5)
					end
				end

				arg_173_1.var_.actorSpriteComps1061 = nil
			end

			local var_176_6 = 0
			local var_176_7 = 0.45

			if var_176_6 < arg_173_1.time_ and arg_173_1.time_ <= var_176_6 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_8 = arg_173_1:FormatText(StoryNameCfg[613].name)

				arg_173_1.leftNameTxt_.text = var_176_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, true)
				arg_173_1.iconController_:SetSelectedState("hero")

				arg_173_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1020")

				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_9 = arg_173_1:GetWordFromCfg(410142043)
				local var_176_10 = arg_173_1:FormatText(var_176_9.content)

				arg_173_1.text_.text = var_176_10

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_11 = 18
				local var_176_12 = utf8.len(var_176_10)
				local var_176_13 = var_176_11 <= 0 and var_176_7 or var_176_7 * (var_176_12 / var_176_11)

				if var_176_13 > 0 and var_176_7 < var_176_13 then
					arg_173_1.talkMaxDuration = var_176_13

					if var_176_13 + var_176_6 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_13 + var_176_6
					end
				end

				arg_173_1.text_.text = var_176_10
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142043", "story_v_out_410142.awb") ~= 0 then
					local var_176_14 = manager.audio:GetVoiceLength("story_v_out_410142", "410142043", "story_v_out_410142.awb") / 1000

					if var_176_14 + var_176_6 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_14 + var_176_6
					end

					if var_176_9.prefab_name ~= "" and arg_173_1.actors_[var_176_9.prefab_name] ~= nil then
						local var_176_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_9.prefab_name].transform, "story_v_out_410142", "410142043", "story_v_out_410142.awb")

						arg_173_1:RecordAudio("410142043", var_176_15)
						arg_173_1:RecordAudio("410142043", var_176_15)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_410142", "410142043", "story_v_out_410142.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_410142", "410142043", "story_v_out_410142.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_16 = math.max(var_176_7, arg_173_1.talkMaxDuration)

			if var_176_6 <= arg_173_1.time_ and arg_173_1.time_ < var_176_6 + var_176_16 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_6) / var_176_16

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_6 + var_176_16 and arg_173_1.time_ < var_176_6 + var_176_16 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play410142044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 410142044
		arg_177_1.duration_ = 12.166

		local var_177_0 = {
			ja = 12.166,
			CriLanguages = 9.2,
			zh = 9.2
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
				arg_177_0:Play410142045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0
			local var_180_1 = 0.95

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_2 = arg_177_1:FormatText(StoryNameCfg[613].name)

				arg_177_1.leftNameTxt_.text = var_180_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, true)
				arg_177_1.iconController_:SetSelectedState("hero")

				arg_177_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1020")

				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_3 = arg_177_1:GetWordFromCfg(410142044)
				local var_180_4 = arg_177_1:FormatText(var_180_3.content)

				arg_177_1.text_.text = var_180_4

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_5 = 38
				local var_180_6 = utf8.len(var_180_4)
				local var_180_7 = var_180_5 <= 0 and var_180_1 or var_180_1 * (var_180_6 / var_180_5)

				if var_180_7 > 0 and var_180_1 < var_180_7 then
					arg_177_1.talkMaxDuration = var_180_7

					if var_180_7 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_7 + var_180_0
					end
				end

				arg_177_1.text_.text = var_180_4
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142044", "story_v_out_410142.awb") ~= 0 then
					local var_180_8 = manager.audio:GetVoiceLength("story_v_out_410142", "410142044", "story_v_out_410142.awb") / 1000

					if var_180_8 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_8 + var_180_0
					end

					if var_180_3.prefab_name ~= "" and arg_177_1.actors_[var_180_3.prefab_name] ~= nil then
						local var_180_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_3.prefab_name].transform, "story_v_out_410142", "410142044", "story_v_out_410142.awb")

						arg_177_1:RecordAudio("410142044", var_180_9)
						arg_177_1:RecordAudio("410142044", var_180_9)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_410142", "410142044", "story_v_out_410142.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_410142", "410142044", "story_v_out_410142.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_10 = math.max(var_180_1, arg_177_1.talkMaxDuration)

			if var_180_0 <= arg_177_1.time_ and arg_177_1.time_ < var_180_0 + var_180_10 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_0) / var_180_10

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_0 + var_180_10 and arg_177_1.time_ < var_180_0 + var_180_10 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play410142045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 410142045
		arg_181_1.duration_ = 8.1

		local var_181_0 = {
			ja = 8.1,
			CriLanguages = 7.833,
			zh = 7.833
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
				arg_181_0:Play410142046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = "ST65"

			if arg_181_1.bgs_[var_184_0] == nil then
				local var_184_1 = Object.Instantiate(arg_181_1.paintGo_)

				var_184_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_184_0)
				var_184_1.name = var_184_0
				var_184_1.transform.parent = arg_181_1.stage_.transform
				var_184_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_181_1.bgs_[var_184_0] = var_184_1
			end

			local var_184_2 = 2

			if var_184_2 < arg_181_1.time_ and arg_181_1.time_ <= var_184_2 + arg_184_0 then
				local var_184_3 = manager.ui.mainCamera.transform.localPosition
				local var_184_4 = Vector3.New(0, 0, 10) + Vector3.New(var_184_3.x, var_184_3.y, 0)
				local var_184_5 = arg_181_1.bgs_.ST65

				var_184_5.transform.localPosition = var_184_4
				var_184_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_184_6 = var_184_5:GetComponent("SpriteRenderer")

				if var_184_6 and var_184_6.sprite then
					local var_184_7 = (var_184_5.transform.localPosition - var_184_3).z
					local var_184_8 = manager.ui.mainCameraCom_
					local var_184_9 = 2 * var_184_7 * Mathf.Tan(var_184_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_184_10 = var_184_9 * var_184_8.aspect
					local var_184_11 = var_184_6.sprite.bounds.size.x
					local var_184_12 = var_184_6.sprite.bounds.size.y
					local var_184_13 = var_184_10 / var_184_11
					local var_184_14 = var_184_9 / var_184_12
					local var_184_15 = var_184_14 < var_184_13 and var_184_13 or var_184_14

					var_184_5.transform.localScale = Vector3.New(var_184_15, var_184_15, 0)
				end

				for iter_184_0, iter_184_1 in pairs(arg_181_1.bgs_) do
					if iter_184_0 ~= "ST65" then
						iter_184_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_184_16 = 0

			if var_184_16 < arg_181_1.time_ and arg_181_1.time_ <= var_184_16 + arg_184_0 then
				arg_181_1.mask_.enabled = true
				arg_181_1.mask_.raycastTarget = true

				arg_181_1:SetGaussion(false)
			end

			local var_184_17 = 2

			if var_184_16 <= arg_181_1.time_ and arg_181_1.time_ < var_184_16 + var_184_17 then
				local var_184_18 = (arg_181_1.time_ - var_184_16) / var_184_17
				local var_184_19 = Color.New(0, 0, 0)

				var_184_19.a = Mathf.Lerp(0, 1, var_184_18)
				arg_181_1.mask_.color = var_184_19
			end

			if arg_181_1.time_ >= var_184_16 + var_184_17 and arg_181_1.time_ < var_184_16 + var_184_17 + arg_184_0 then
				local var_184_20 = Color.New(0, 0, 0)

				var_184_20.a = 1
				arg_181_1.mask_.color = var_184_20
			end

			local var_184_21 = 2

			if var_184_21 < arg_181_1.time_ and arg_181_1.time_ <= var_184_21 + arg_184_0 then
				arg_181_1.mask_.enabled = true
				arg_181_1.mask_.raycastTarget = true

				arg_181_1:SetGaussion(false)
			end

			local var_184_22 = 2

			if var_184_21 <= arg_181_1.time_ and arg_181_1.time_ < var_184_21 + var_184_22 then
				local var_184_23 = (arg_181_1.time_ - var_184_21) / var_184_22
				local var_184_24 = Color.New(0, 0, 0)

				var_184_24.a = Mathf.Lerp(1, 0, var_184_23)
				arg_181_1.mask_.color = var_184_24
			end

			if arg_181_1.time_ >= var_184_21 + var_184_22 and arg_181_1.time_ < var_184_21 + var_184_22 + arg_184_0 then
				local var_184_25 = Color.New(0, 0, 0)
				local var_184_26 = 0

				arg_181_1.mask_.enabled = false
				var_184_25.a = var_184_26
				arg_181_1.mask_.color = var_184_25
			end

			local var_184_27 = arg_181_1.actors_["1061"].transform
			local var_184_28 = 2

			if var_184_28 < arg_181_1.time_ and arg_181_1.time_ <= var_184_28 + arg_184_0 then
				arg_181_1.var_.moveOldPos1061 = var_184_27.localPosition
				var_184_27.localScale = Vector3.New(1, 1, 1)

				arg_181_1:CheckSpriteTmpPos("1061", 7)

				local var_184_29 = var_184_27.childCount

				for iter_184_2 = 0, var_184_29 - 1 do
					local var_184_30 = var_184_27:GetChild(iter_184_2)

					if var_184_30.name == "" or not string.find(var_184_30.name, "split") then
						var_184_30.gameObject:SetActive(true)
					else
						var_184_30.gameObject:SetActive(false)
					end
				end
			end

			local var_184_31 = 0.001

			if var_184_28 <= arg_181_1.time_ and arg_181_1.time_ < var_184_28 + var_184_31 then
				local var_184_32 = (arg_181_1.time_ - var_184_28) / var_184_31
				local var_184_33 = Vector3.New(0, -2000, 18)

				var_184_27.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos1061, var_184_33, var_184_32)
			end

			if arg_181_1.time_ >= var_184_28 + var_184_31 and arg_181_1.time_ < var_184_28 + var_184_31 + arg_184_0 then
				var_184_27.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_184_34 = arg_181_1.actors_["1056"].transform
			local var_184_35 = 4.00000000000001

			if var_184_35 < arg_181_1.time_ and arg_181_1.time_ <= var_184_35 + arg_184_0 then
				arg_181_1.var_.moveOldPos1056 = var_184_34.localPosition
				var_184_34.localScale = Vector3.New(1, 1, 1)

				arg_181_1:CheckSpriteTmpPos("1056", 3)

				local var_184_36 = var_184_34.childCount

				for iter_184_3 = 0, var_184_36 - 1 do
					local var_184_37 = var_184_34:GetChild(iter_184_3)

					if var_184_37.name == "" or not string.find(var_184_37.name, "split") then
						var_184_37.gameObject:SetActive(true)
					else
						var_184_37.gameObject:SetActive(false)
					end
				end
			end

			local var_184_38 = 0.001

			if var_184_35 <= arg_181_1.time_ and arg_181_1.time_ < var_184_35 + var_184_38 then
				local var_184_39 = (arg_181_1.time_ - var_184_35) / var_184_38
				local var_184_40 = Vector3.New(0, -350, -180)

				var_184_34.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos1056, var_184_40, var_184_39)
			end

			if arg_181_1.time_ >= var_184_35 + var_184_38 and arg_181_1.time_ < var_184_35 + var_184_38 + arg_184_0 then
				var_184_34.localPosition = Vector3.New(0, -350, -180)
			end

			local var_184_41 = arg_181_1.actors_["1061"]
			local var_184_42 = 2

			if var_184_42 < arg_181_1.time_ and arg_181_1.time_ <= var_184_42 + arg_184_0 and arg_181_1.var_.actorSpriteComps1061 == nil then
				arg_181_1.var_.actorSpriteComps1061 = var_184_41:GetComponentsInChildren(typeof(Image), true)
			end

			local var_184_43 = 0.0339999999999945

			if var_184_42 <= arg_181_1.time_ and arg_181_1.time_ < var_184_42 + var_184_43 then
				local var_184_44 = (arg_181_1.time_ - var_184_42) / var_184_43

				if arg_181_1.var_.actorSpriteComps1061 then
					for iter_184_4, iter_184_5 in pairs(arg_181_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_184_5 then
							local var_184_45 = Mathf.Lerp(iter_184_5.color.r, 0.5, var_184_44)

							iter_184_5.color = Color.New(var_184_45, var_184_45, var_184_45)
						end
					end
				end
			end

			if arg_181_1.time_ >= var_184_42 + var_184_43 and arg_181_1.time_ < var_184_42 + var_184_43 + arg_184_0 and arg_181_1.var_.actorSpriteComps1061 then
				local var_184_46 = 0.5

				for iter_184_6, iter_184_7 in pairs(arg_181_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_184_7 then
						iter_184_7.color = Color.New(var_184_46, var_184_46, var_184_46)
					end
				end

				arg_181_1.var_.actorSpriteComps1061 = nil
			end

			local var_184_47 = arg_181_1.actors_["1056"]
			local var_184_48 = 4.00000000000001

			if var_184_48 < arg_181_1.time_ and arg_181_1.time_ <= var_184_48 + arg_184_0 and arg_181_1.var_.actorSpriteComps1056 == nil then
				arg_181_1.var_.actorSpriteComps1056 = var_184_47:GetComponentsInChildren(typeof(Image), true)
			end

			local var_184_49 = 0.034

			if var_184_48 <= arg_181_1.time_ and arg_181_1.time_ < var_184_48 + var_184_49 then
				local var_184_50 = (arg_181_1.time_ - var_184_48) / var_184_49

				if arg_181_1.var_.actorSpriteComps1056 then
					for iter_184_8, iter_184_9 in pairs(arg_181_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_184_9 then
							local var_184_51 = Mathf.Lerp(iter_184_9.color.r, 1, var_184_50)

							iter_184_9.color = Color.New(var_184_51, var_184_51, var_184_51)
						end
					end
				end
			end

			if arg_181_1.time_ >= var_184_48 + var_184_49 and arg_181_1.time_ < var_184_48 + var_184_49 + arg_184_0 and arg_181_1.var_.actorSpriteComps1056 then
				local var_184_52 = 1

				for iter_184_10, iter_184_11 in pairs(arg_181_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_184_11 then
						iter_184_11.color = Color.New(var_184_52, var_184_52, var_184_52)
					end
				end

				arg_181_1.var_.actorSpriteComps1056 = nil
			end

			if arg_181_1.frameCnt_ <= 1 then
				arg_181_1.dialog_:SetActive(false)
			end

			local var_184_53 = 4
			local var_184_54 = 0.575

			if var_184_53 < arg_181_1.time_ and arg_181_1.time_ <= var_184_53 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0

				arg_181_1.dialog_:SetActive(true)

				local var_184_55 = LeanTween.value(arg_181_1.dialog_, 0, 1, 0.3)

				var_184_55:setOnUpdate(LuaHelper.FloatAction(function(arg_185_0)
					arg_181_1.dialogCg_.alpha = arg_185_0
				end))
				var_184_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_181_1.dialog_)
					var_184_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_181_1.duration_ = arg_181_1.duration_ + 0.3

				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_56 = arg_181_1:FormatText(StoryNameCfg[605].name)

				arg_181_1.leftNameTxt_.text = var_184_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_57 = arg_181_1:GetWordFromCfg(410142045)
				local var_184_58 = arg_181_1:FormatText(var_184_57.content)

				arg_181_1.text_.text = var_184_58

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_59 = 23
				local var_184_60 = utf8.len(var_184_58)
				local var_184_61 = var_184_59 <= 0 and var_184_54 or var_184_54 * (var_184_60 / var_184_59)

				if var_184_61 > 0 and var_184_54 < var_184_61 then
					arg_181_1.talkMaxDuration = var_184_61
					var_184_53 = var_184_53 + 0.3

					if var_184_61 + var_184_53 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_61 + var_184_53
					end
				end

				arg_181_1.text_.text = var_184_58
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142045", "story_v_out_410142.awb") ~= 0 then
					local var_184_62 = manager.audio:GetVoiceLength("story_v_out_410142", "410142045", "story_v_out_410142.awb") / 1000

					if var_184_62 + var_184_53 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_62 + var_184_53
					end

					if var_184_57.prefab_name ~= "" and arg_181_1.actors_[var_184_57.prefab_name] ~= nil then
						local var_184_63 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_57.prefab_name].transform, "story_v_out_410142", "410142045", "story_v_out_410142.awb")

						arg_181_1:RecordAudio("410142045", var_184_63)
						arg_181_1:RecordAudio("410142045", var_184_63)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_410142", "410142045", "story_v_out_410142.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_410142", "410142045", "story_v_out_410142.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_64 = var_184_53 + 0.3
			local var_184_65 = math.max(var_184_54, arg_181_1.talkMaxDuration)

			if var_184_64 <= arg_181_1.time_ and arg_181_1.time_ < var_184_64 + var_184_65 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_64) / var_184_65

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_64 + var_184_65 and arg_181_1.time_ < var_184_64 + var_184_65 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play410142046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 410142046
		arg_187_1.duration_ = 5

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play410142047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1056"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos1056 = var_190_0.localPosition
				var_190_0.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("1056", 4)

				local var_190_2 = var_190_0.childCount

				for iter_190_0 = 0, var_190_2 - 1 do
					local var_190_3 = var_190_0:GetChild(iter_190_0)

					if var_190_3.name == "" or not string.find(var_190_3.name, "split") then
						var_190_3.gameObject:SetActive(true)
					else
						var_190_3.gameObject:SetActive(false)
					end
				end
			end

			local var_190_4 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_4 then
				local var_190_5 = (arg_187_1.time_ - var_190_1) / var_190_4
				local var_190_6 = Vector3.New(390, -350, -180)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1056, var_190_6, var_190_5)
			end

			if arg_187_1.time_ >= var_190_1 + var_190_4 and arg_187_1.time_ < var_190_1 + var_190_4 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_190_7 = arg_187_1.actors_["1061"].transform
			local var_190_8 = 0

			if var_190_8 < arg_187_1.time_ and arg_187_1.time_ <= var_190_8 + arg_190_0 then
				arg_187_1.var_.moveOldPos1061 = var_190_7.localPosition
				var_190_7.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("1061", 2)

				local var_190_9 = var_190_7.childCount

				for iter_190_1 = 0, var_190_9 - 1 do
					local var_190_10 = var_190_7:GetChild(iter_190_1)

					if var_190_10.name == "" or not string.find(var_190_10.name, "split") then
						var_190_10.gameObject:SetActive(true)
					else
						var_190_10.gameObject:SetActive(false)
					end
				end
			end

			local var_190_11 = 0.001

			if var_190_8 <= arg_187_1.time_ and arg_187_1.time_ < var_190_8 + var_190_11 then
				local var_190_12 = (arg_187_1.time_ - var_190_8) / var_190_11
				local var_190_13 = Vector3.New(-390, -490, 18)

				var_190_7.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1061, var_190_13, var_190_12)
			end

			if arg_187_1.time_ >= var_190_8 + var_190_11 and arg_187_1.time_ < var_190_8 + var_190_11 + arg_190_0 then
				var_190_7.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_190_14 = arg_187_1.actors_["1056"]
			local var_190_15 = 0

			if var_190_15 < arg_187_1.time_ and arg_187_1.time_ <= var_190_15 + arg_190_0 and arg_187_1.var_.actorSpriteComps1056 == nil then
				arg_187_1.var_.actorSpriteComps1056 = var_190_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_16 = 0.034

			if var_190_15 <= arg_187_1.time_ and arg_187_1.time_ < var_190_15 + var_190_16 then
				local var_190_17 = (arg_187_1.time_ - var_190_15) / var_190_16

				if arg_187_1.var_.actorSpriteComps1056 then
					for iter_190_2, iter_190_3 in pairs(arg_187_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_190_3 then
							local var_190_18 = Mathf.Lerp(iter_190_3.color.r, 0.5, var_190_17)

							iter_190_3.color = Color.New(var_190_18, var_190_18, var_190_18)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_15 + var_190_16 and arg_187_1.time_ < var_190_15 + var_190_16 + arg_190_0 and arg_187_1.var_.actorSpriteComps1056 then
				local var_190_19 = 0.5

				for iter_190_4, iter_190_5 in pairs(arg_187_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_190_5 then
						iter_190_5.color = Color.New(var_190_19, var_190_19, var_190_19)
					end
				end

				arg_187_1.var_.actorSpriteComps1056 = nil
			end

			local var_190_20 = arg_187_1.actors_["1061"]
			local var_190_21 = 0

			if var_190_21 < arg_187_1.time_ and arg_187_1.time_ <= var_190_21 + arg_190_0 and arg_187_1.var_.actorSpriteComps1061 == nil then
				arg_187_1.var_.actorSpriteComps1061 = var_190_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_22 = 0.034

			if var_190_21 <= arg_187_1.time_ and arg_187_1.time_ < var_190_21 + var_190_22 then
				local var_190_23 = (arg_187_1.time_ - var_190_21) / var_190_22

				if arg_187_1.var_.actorSpriteComps1061 then
					for iter_190_6, iter_190_7 in pairs(arg_187_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_190_7 then
							local var_190_24 = Mathf.Lerp(iter_190_7.color.r, 0.5, var_190_23)

							iter_190_7.color = Color.New(var_190_24, var_190_24, var_190_24)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_21 + var_190_22 and arg_187_1.time_ < var_190_21 + var_190_22 + arg_190_0 and arg_187_1.var_.actorSpriteComps1061 then
				local var_190_25 = 0.5

				for iter_190_8, iter_190_9 in pairs(arg_187_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_190_9 then
						iter_190_9.color = Color.New(var_190_25, var_190_25, var_190_25)
					end
				end

				arg_187_1.var_.actorSpriteComps1061 = nil
			end

			local var_190_26 = 0
			local var_190_27 = 0.925

			if var_190_26 < arg_187_1.time_ and arg_187_1.time_ <= var_190_26 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, false)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_28 = arg_187_1:GetWordFromCfg(410142046)
				local var_190_29 = arg_187_1:FormatText(var_190_28.content)

				arg_187_1.text_.text = var_190_29

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_30 = 37
				local var_190_31 = utf8.len(var_190_29)
				local var_190_32 = var_190_30 <= 0 and var_190_27 or var_190_27 * (var_190_31 / var_190_30)

				if var_190_32 > 0 and var_190_27 < var_190_32 then
					arg_187_1.talkMaxDuration = var_190_32

					if var_190_32 + var_190_26 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_32 + var_190_26
					end
				end

				arg_187_1.text_.text = var_190_29
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_33 = math.max(var_190_27, arg_187_1.talkMaxDuration)

			if var_190_26 <= arg_187_1.time_ and arg_187_1.time_ < var_190_26 + var_190_33 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_26) / var_190_33

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_26 + var_190_33 and arg_187_1.time_ < var_190_26 + var_190_33 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play410142047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 410142047
		arg_191_1.duration_ = 2.366

		local var_191_0 = {
			ja = 2.366,
			CriLanguages = 2.033,
			zh = 2.033
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
				arg_191_0:Play410142048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1056"].transform
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.var_.moveOldPos1056 = var_194_0.localPosition
				var_194_0.localScale = Vector3.New(1, 1, 1)

				arg_191_1:CheckSpriteTmpPos("1056", 4)

				local var_194_2 = var_194_0.childCount

				for iter_194_0 = 0, var_194_2 - 1 do
					local var_194_3 = var_194_0:GetChild(iter_194_0)

					if var_194_3.name == "split_3" or not string.find(var_194_3.name, "split") then
						var_194_3.gameObject:SetActive(true)
					else
						var_194_3.gameObject:SetActive(false)
					end
				end
			end

			local var_194_4 = 0.001

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_4 then
				local var_194_5 = (arg_191_1.time_ - var_194_1) / var_194_4
				local var_194_6 = Vector3.New(390, -350, -180)

				var_194_0.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos1056, var_194_6, var_194_5)
			end

			if arg_191_1.time_ >= var_194_1 + var_194_4 and arg_191_1.time_ < var_194_1 + var_194_4 + arg_194_0 then
				var_194_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_194_7 = arg_191_1.actors_["1056"]
			local var_194_8 = 0

			if var_194_8 < arg_191_1.time_ and arg_191_1.time_ <= var_194_8 + arg_194_0 and arg_191_1.var_.actorSpriteComps1056 == nil then
				arg_191_1.var_.actorSpriteComps1056 = var_194_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_9 = 0.034

			if var_194_8 <= arg_191_1.time_ and arg_191_1.time_ < var_194_8 + var_194_9 then
				local var_194_10 = (arg_191_1.time_ - var_194_8) / var_194_9

				if arg_191_1.var_.actorSpriteComps1056 then
					for iter_194_1, iter_194_2 in pairs(arg_191_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_194_2 then
							local var_194_11 = Mathf.Lerp(iter_194_2.color.r, 1, var_194_10)

							iter_194_2.color = Color.New(var_194_11, var_194_11, var_194_11)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_8 + var_194_9 and arg_191_1.time_ < var_194_8 + var_194_9 + arg_194_0 and arg_191_1.var_.actorSpriteComps1056 then
				local var_194_12 = 1

				for iter_194_3, iter_194_4 in pairs(arg_191_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_194_4 then
						iter_194_4.color = Color.New(var_194_12, var_194_12, var_194_12)
					end
				end

				arg_191_1.var_.actorSpriteComps1056 = nil
			end

			local var_194_13 = 0
			local var_194_14 = 0.15

			if var_194_13 < arg_191_1.time_ and arg_191_1.time_ <= var_194_13 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_15 = arg_191_1:FormatText(StoryNameCfg[605].name)

				arg_191_1.leftNameTxt_.text = var_194_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_16 = arg_191_1:GetWordFromCfg(410142047)
				local var_194_17 = arg_191_1:FormatText(var_194_16.content)

				arg_191_1.text_.text = var_194_17

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_18 = 6
				local var_194_19 = utf8.len(var_194_17)
				local var_194_20 = var_194_18 <= 0 and var_194_14 or var_194_14 * (var_194_19 / var_194_18)

				if var_194_20 > 0 and var_194_14 < var_194_20 then
					arg_191_1.talkMaxDuration = var_194_20

					if var_194_20 + var_194_13 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_20 + var_194_13
					end
				end

				arg_191_1.text_.text = var_194_17
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142047", "story_v_out_410142.awb") ~= 0 then
					local var_194_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142047", "story_v_out_410142.awb") / 1000

					if var_194_21 + var_194_13 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_21 + var_194_13
					end

					if var_194_16.prefab_name ~= "" and arg_191_1.actors_[var_194_16.prefab_name] ~= nil then
						local var_194_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_16.prefab_name].transform, "story_v_out_410142", "410142047", "story_v_out_410142.awb")

						arg_191_1:RecordAudio("410142047", var_194_22)
						arg_191_1:RecordAudio("410142047", var_194_22)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_410142", "410142047", "story_v_out_410142.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_410142", "410142047", "story_v_out_410142.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_23 = math.max(var_194_14, arg_191_1.talkMaxDuration)

			if var_194_13 <= arg_191_1.time_ and arg_191_1.time_ < var_194_13 + var_194_23 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_13) / var_194_23

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_13 + var_194_23 and arg_191_1.time_ < var_194_13 + var_194_23 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play410142048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 410142048
		arg_195_1.duration_ = 4.1

		local var_195_0 = {
			ja = 4.1,
			CriLanguages = 1.2,
			zh = 1.2
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
				arg_195_0:Play410142049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1061"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos1061 = var_198_0.localPosition
				var_198_0.localScale = Vector3.New(1, 1, 1)

				arg_195_1:CheckSpriteTmpPos("1061", 2)

				local var_198_2 = var_198_0.childCount

				for iter_198_0 = 0, var_198_2 - 1 do
					local var_198_3 = var_198_0:GetChild(iter_198_0)

					if var_198_3.name == "split_5" or not string.find(var_198_3.name, "split") then
						var_198_3.gameObject:SetActive(true)
					else
						var_198_3.gameObject:SetActive(false)
					end
				end
			end

			local var_198_4 = 0.001

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_4 then
				local var_198_5 = (arg_195_1.time_ - var_198_1) / var_198_4
				local var_198_6 = Vector3.New(-390, -490, 18)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1061, var_198_6, var_198_5)
			end

			if arg_195_1.time_ >= var_198_1 + var_198_4 and arg_195_1.time_ < var_198_1 + var_198_4 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_198_7 = arg_195_1.actors_["1061"]
			local var_198_8 = 0

			if var_198_8 < arg_195_1.time_ and arg_195_1.time_ <= var_198_8 + arg_198_0 and arg_195_1.var_.actorSpriteComps1061 == nil then
				arg_195_1.var_.actorSpriteComps1061 = var_198_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_9 = 0.034

			if var_198_8 <= arg_195_1.time_ and arg_195_1.time_ < var_198_8 + var_198_9 then
				local var_198_10 = (arg_195_1.time_ - var_198_8) / var_198_9

				if arg_195_1.var_.actorSpriteComps1061 then
					for iter_198_1, iter_198_2 in pairs(arg_195_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_198_2 then
							local var_198_11 = Mathf.Lerp(iter_198_2.color.r, 1, var_198_10)

							iter_198_2.color = Color.New(var_198_11, var_198_11, var_198_11)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_8 + var_198_9 and arg_195_1.time_ < var_198_8 + var_198_9 + arg_198_0 and arg_195_1.var_.actorSpriteComps1061 then
				local var_198_12 = 1

				for iter_198_3, iter_198_4 in pairs(arg_195_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_198_4 then
						iter_198_4.color = Color.New(var_198_12, var_198_12, var_198_12)
					end
				end

				arg_195_1.var_.actorSpriteComps1061 = nil
			end

			local var_198_13 = arg_195_1.actors_["1056"]
			local var_198_14 = 0

			if var_198_14 < arg_195_1.time_ and arg_195_1.time_ <= var_198_14 + arg_198_0 and arg_195_1.var_.actorSpriteComps1056 == nil then
				arg_195_1.var_.actorSpriteComps1056 = var_198_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_15 = 0.034

			if var_198_14 <= arg_195_1.time_ and arg_195_1.time_ < var_198_14 + var_198_15 then
				local var_198_16 = (arg_195_1.time_ - var_198_14) / var_198_15

				if arg_195_1.var_.actorSpriteComps1056 then
					for iter_198_5, iter_198_6 in pairs(arg_195_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_198_6 then
							local var_198_17 = Mathf.Lerp(iter_198_6.color.r, 0.5, var_198_16)

							iter_198_6.color = Color.New(var_198_17, var_198_17, var_198_17)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_14 + var_198_15 and arg_195_1.time_ < var_198_14 + var_198_15 + arg_198_0 and arg_195_1.var_.actorSpriteComps1056 then
				local var_198_18 = 0.5

				for iter_198_7, iter_198_8 in pairs(arg_195_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_198_8 then
						iter_198_8.color = Color.New(var_198_18, var_198_18, var_198_18)
					end
				end

				arg_195_1.var_.actorSpriteComps1056 = nil
			end

			local var_198_19 = 0
			local var_198_20 = 0.075

			if var_198_19 < arg_195_1.time_ and arg_195_1.time_ <= var_198_19 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_21 = arg_195_1:FormatText(StoryNameCfg[612].name)

				arg_195_1.leftNameTxt_.text = var_198_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_22 = arg_195_1:GetWordFromCfg(410142048)
				local var_198_23 = arg_195_1:FormatText(var_198_22.content)

				arg_195_1.text_.text = var_198_23

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_24 = 3
				local var_198_25 = utf8.len(var_198_23)
				local var_198_26 = var_198_24 <= 0 and var_198_20 or var_198_20 * (var_198_25 / var_198_24)

				if var_198_26 > 0 and var_198_20 < var_198_26 then
					arg_195_1.talkMaxDuration = var_198_26

					if var_198_26 + var_198_19 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_26 + var_198_19
					end
				end

				arg_195_1.text_.text = var_198_23
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142048", "story_v_out_410142.awb") ~= 0 then
					local var_198_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142048", "story_v_out_410142.awb") / 1000

					if var_198_27 + var_198_19 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_27 + var_198_19
					end

					if var_198_22.prefab_name ~= "" and arg_195_1.actors_[var_198_22.prefab_name] ~= nil then
						local var_198_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_22.prefab_name].transform, "story_v_out_410142", "410142048", "story_v_out_410142.awb")

						arg_195_1:RecordAudio("410142048", var_198_28)
						arg_195_1:RecordAudio("410142048", var_198_28)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_410142", "410142048", "story_v_out_410142.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_410142", "410142048", "story_v_out_410142.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_29 = math.max(var_198_20, arg_195_1.talkMaxDuration)

			if var_198_19 <= arg_195_1.time_ and arg_195_1.time_ < var_198_19 + var_198_29 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_19) / var_198_29

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_19 + var_198_29 and arg_195_1.time_ < var_198_19 + var_198_29 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play410142049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 410142049
		arg_199_1.duration_ = 5.666

		local var_199_0 = {
			ja = 5.666,
			CriLanguages = 2,
			zh = 2
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
				arg_199_0:Play410142050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1056"].transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.moveOldPos1056 = var_202_0.localPosition
				var_202_0.localScale = Vector3.New(1, 1, 1)

				arg_199_1:CheckSpriteTmpPos("1056", 4)

				local var_202_2 = var_202_0.childCount

				for iter_202_0 = 0, var_202_2 - 1 do
					local var_202_3 = var_202_0:GetChild(iter_202_0)

					if var_202_3.name == "split_4" or not string.find(var_202_3.name, "split") then
						var_202_3.gameObject:SetActive(true)
					else
						var_202_3.gameObject:SetActive(false)
					end
				end
			end

			local var_202_4 = 0.001

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_4 then
				local var_202_5 = (arg_199_1.time_ - var_202_1) / var_202_4
				local var_202_6 = Vector3.New(390, -350, -180)

				var_202_0.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1056, var_202_6, var_202_5)
			end

			if arg_199_1.time_ >= var_202_1 + var_202_4 and arg_199_1.time_ < var_202_1 + var_202_4 + arg_202_0 then
				var_202_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_202_7 = arg_199_1.actors_["1056"]
			local var_202_8 = 0

			if var_202_8 < arg_199_1.time_ and arg_199_1.time_ <= var_202_8 + arg_202_0 and arg_199_1.var_.actorSpriteComps1056 == nil then
				arg_199_1.var_.actorSpriteComps1056 = var_202_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_9 = 0.034

			if var_202_8 <= arg_199_1.time_ and arg_199_1.time_ < var_202_8 + var_202_9 then
				local var_202_10 = (arg_199_1.time_ - var_202_8) / var_202_9

				if arg_199_1.var_.actorSpriteComps1056 then
					for iter_202_1, iter_202_2 in pairs(arg_199_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_202_2 then
							local var_202_11 = Mathf.Lerp(iter_202_2.color.r, 1, var_202_10)

							iter_202_2.color = Color.New(var_202_11, var_202_11, var_202_11)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_8 + var_202_9 and arg_199_1.time_ < var_202_8 + var_202_9 + arg_202_0 and arg_199_1.var_.actorSpriteComps1056 then
				local var_202_12 = 1

				for iter_202_3, iter_202_4 in pairs(arg_199_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_202_4 then
						iter_202_4.color = Color.New(var_202_12, var_202_12, var_202_12)
					end
				end

				arg_199_1.var_.actorSpriteComps1056 = nil
			end

			local var_202_13 = arg_199_1.actors_["1061"]
			local var_202_14 = 0

			if var_202_14 < arg_199_1.time_ and arg_199_1.time_ <= var_202_14 + arg_202_0 and arg_199_1.var_.actorSpriteComps1061 == nil then
				arg_199_1.var_.actorSpriteComps1061 = var_202_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_15 = 0.034

			if var_202_14 <= arg_199_1.time_ and arg_199_1.time_ < var_202_14 + var_202_15 then
				local var_202_16 = (arg_199_1.time_ - var_202_14) / var_202_15

				if arg_199_1.var_.actorSpriteComps1061 then
					for iter_202_5, iter_202_6 in pairs(arg_199_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_202_6 then
							local var_202_17 = Mathf.Lerp(iter_202_6.color.r, 0.5, var_202_16)

							iter_202_6.color = Color.New(var_202_17, var_202_17, var_202_17)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_14 + var_202_15 and arg_199_1.time_ < var_202_14 + var_202_15 + arg_202_0 and arg_199_1.var_.actorSpriteComps1061 then
				local var_202_18 = 0.5

				for iter_202_7, iter_202_8 in pairs(arg_199_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_202_8 then
						iter_202_8.color = Color.New(var_202_18, var_202_18, var_202_18)
					end
				end

				arg_199_1.var_.actorSpriteComps1061 = nil
			end

			local var_202_19 = 0
			local var_202_20 = 0.15

			if var_202_19 < arg_199_1.time_ and arg_199_1.time_ <= var_202_19 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_21 = arg_199_1:FormatText(StoryNameCfg[605].name)

				arg_199_1.leftNameTxt_.text = var_202_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_22 = arg_199_1:GetWordFromCfg(410142049)
				local var_202_23 = arg_199_1:FormatText(var_202_22.content)

				arg_199_1.text_.text = var_202_23

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_24 = 6
				local var_202_25 = utf8.len(var_202_23)
				local var_202_26 = var_202_24 <= 0 and var_202_20 or var_202_20 * (var_202_25 / var_202_24)

				if var_202_26 > 0 and var_202_20 < var_202_26 then
					arg_199_1.talkMaxDuration = var_202_26

					if var_202_26 + var_202_19 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_26 + var_202_19
					end
				end

				arg_199_1.text_.text = var_202_23
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142049", "story_v_out_410142.awb") ~= 0 then
					local var_202_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142049", "story_v_out_410142.awb") / 1000

					if var_202_27 + var_202_19 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_27 + var_202_19
					end

					if var_202_22.prefab_name ~= "" and arg_199_1.actors_[var_202_22.prefab_name] ~= nil then
						local var_202_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_22.prefab_name].transform, "story_v_out_410142", "410142049", "story_v_out_410142.awb")

						arg_199_1:RecordAudio("410142049", var_202_28)
						arg_199_1:RecordAudio("410142049", var_202_28)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_410142", "410142049", "story_v_out_410142.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_410142", "410142049", "story_v_out_410142.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_29 = math.max(var_202_20, arg_199_1.talkMaxDuration)

			if var_202_19 <= arg_199_1.time_ and arg_199_1.time_ < var_202_19 + var_202_29 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_19) / var_202_29

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_19 + var_202_29 and arg_199_1.time_ < var_202_19 + var_202_29 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play410142050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 410142050
		arg_203_1.duration_ = 7.066

		local var_203_0 = {
			ja = 7.066,
			CriLanguages = 3.966,
			zh = 3.966
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
				arg_203_0:Play410142051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1061"].transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPos1061 = var_206_0.localPosition
				var_206_0.localScale = Vector3.New(1, 1, 1)

				arg_203_1:CheckSpriteTmpPos("1061", 2)

				local var_206_2 = var_206_0.childCount

				for iter_206_0 = 0, var_206_2 - 1 do
					local var_206_3 = var_206_0:GetChild(iter_206_0)

					if var_206_3.name == "split_7" or not string.find(var_206_3.name, "split") then
						var_206_3.gameObject:SetActive(true)
					else
						var_206_3.gameObject:SetActive(false)
					end
				end
			end

			local var_206_4 = 0.001

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_4 then
				local var_206_5 = (arg_203_1.time_ - var_206_1) / var_206_4
				local var_206_6 = Vector3.New(-390, -490, 18)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1061, var_206_6, var_206_5)
			end

			if arg_203_1.time_ >= var_206_1 + var_206_4 and arg_203_1.time_ < var_206_1 + var_206_4 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_206_7 = arg_203_1.actors_["1061"]
			local var_206_8 = 0

			if var_206_8 < arg_203_1.time_ and arg_203_1.time_ <= var_206_8 + arg_206_0 and arg_203_1.var_.actorSpriteComps1061 == nil then
				arg_203_1.var_.actorSpriteComps1061 = var_206_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_9 = 0.034

			if var_206_8 <= arg_203_1.time_ and arg_203_1.time_ < var_206_8 + var_206_9 then
				local var_206_10 = (arg_203_1.time_ - var_206_8) / var_206_9

				if arg_203_1.var_.actorSpriteComps1061 then
					for iter_206_1, iter_206_2 in pairs(arg_203_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_206_2 then
							local var_206_11 = Mathf.Lerp(iter_206_2.color.r, 1, var_206_10)

							iter_206_2.color = Color.New(var_206_11, var_206_11, var_206_11)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_8 + var_206_9 and arg_203_1.time_ < var_206_8 + var_206_9 + arg_206_0 and arg_203_1.var_.actorSpriteComps1061 then
				local var_206_12 = 1

				for iter_206_3, iter_206_4 in pairs(arg_203_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_206_4 then
						iter_206_4.color = Color.New(var_206_12, var_206_12, var_206_12)
					end
				end

				arg_203_1.var_.actorSpriteComps1061 = nil
			end

			local var_206_13 = arg_203_1.actors_["1056"]
			local var_206_14 = 0

			if var_206_14 < arg_203_1.time_ and arg_203_1.time_ <= var_206_14 + arg_206_0 and arg_203_1.var_.actorSpriteComps1056 == nil then
				arg_203_1.var_.actorSpriteComps1056 = var_206_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_15 = 0.034

			if var_206_14 <= arg_203_1.time_ and arg_203_1.time_ < var_206_14 + var_206_15 then
				local var_206_16 = (arg_203_1.time_ - var_206_14) / var_206_15

				if arg_203_1.var_.actorSpriteComps1056 then
					for iter_206_5, iter_206_6 in pairs(arg_203_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_206_6 then
							local var_206_17 = Mathf.Lerp(iter_206_6.color.r, 0.5, var_206_16)

							iter_206_6.color = Color.New(var_206_17, var_206_17, var_206_17)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_14 + var_206_15 and arg_203_1.time_ < var_206_14 + var_206_15 + arg_206_0 and arg_203_1.var_.actorSpriteComps1056 then
				local var_206_18 = 0.5

				for iter_206_7, iter_206_8 in pairs(arg_203_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_206_8 then
						iter_206_8.color = Color.New(var_206_18, var_206_18, var_206_18)
					end
				end

				arg_203_1.var_.actorSpriteComps1056 = nil
			end

			local var_206_19 = 0
			local var_206_20 = 0.5

			if var_206_19 < arg_203_1.time_ and arg_203_1.time_ <= var_206_19 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_21 = arg_203_1:FormatText(StoryNameCfg[612].name)

				arg_203_1.leftNameTxt_.text = var_206_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_22 = arg_203_1:GetWordFromCfg(410142050)
				local var_206_23 = arg_203_1:FormatText(var_206_22.content)

				arg_203_1.text_.text = var_206_23

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_24 = 20
				local var_206_25 = utf8.len(var_206_23)
				local var_206_26 = var_206_24 <= 0 and var_206_20 or var_206_20 * (var_206_25 / var_206_24)

				if var_206_26 > 0 and var_206_20 < var_206_26 then
					arg_203_1.talkMaxDuration = var_206_26

					if var_206_26 + var_206_19 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_26 + var_206_19
					end
				end

				arg_203_1.text_.text = var_206_23
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142050", "story_v_out_410142.awb") ~= 0 then
					local var_206_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142050", "story_v_out_410142.awb") / 1000

					if var_206_27 + var_206_19 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_27 + var_206_19
					end

					if var_206_22.prefab_name ~= "" and arg_203_1.actors_[var_206_22.prefab_name] ~= nil then
						local var_206_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_22.prefab_name].transform, "story_v_out_410142", "410142050", "story_v_out_410142.awb")

						arg_203_1:RecordAudio("410142050", var_206_28)
						arg_203_1:RecordAudio("410142050", var_206_28)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_410142", "410142050", "story_v_out_410142.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_410142", "410142050", "story_v_out_410142.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_29 = math.max(var_206_20, arg_203_1.talkMaxDuration)

			if var_206_19 <= arg_203_1.time_ and arg_203_1.time_ < var_206_19 + var_206_29 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_19) / var_206_29

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_19 + var_206_29 and arg_203_1.time_ < var_206_19 + var_206_29 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play410142051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 410142051
		arg_207_1.duration_ = 11.033

		local var_207_0 = {
			ja = 7.766,
			CriLanguages = 11.033,
			zh = 11.033
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
				arg_207_0:Play410142052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1061"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos1061 = var_210_0.localPosition
				var_210_0.localScale = Vector3.New(1, 1, 1)

				arg_207_1:CheckSpriteTmpPos("1061", 2)

				local var_210_2 = var_210_0.childCount

				for iter_210_0 = 0, var_210_2 - 1 do
					local var_210_3 = var_210_0:GetChild(iter_210_0)

					if var_210_3.name == "split_7" or not string.find(var_210_3.name, "split") then
						var_210_3.gameObject:SetActive(true)
					else
						var_210_3.gameObject:SetActive(false)
					end
				end
			end

			local var_210_4 = 0.001

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_4 then
				local var_210_5 = (arg_207_1.time_ - var_210_1) / var_210_4
				local var_210_6 = Vector3.New(-390, -490, 18)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1061, var_210_6, var_210_5)
			end

			if arg_207_1.time_ >= var_210_1 + var_210_4 and arg_207_1.time_ < var_210_1 + var_210_4 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_210_7 = arg_207_1.actors_["1061"]
			local var_210_8 = 0

			if var_210_8 < arg_207_1.time_ and arg_207_1.time_ <= var_210_8 + arg_210_0 and arg_207_1.var_.actorSpriteComps1061 == nil then
				arg_207_1.var_.actorSpriteComps1061 = var_210_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_210_9 = 0.034

			if var_210_8 <= arg_207_1.time_ and arg_207_1.time_ < var_210_8 + var_210_9 then
				local var_210_10 = (arg_207_1.time_ - var_210_8) / var_210_9

				if arg_207_1.var_.actorSpriteComps1061 then
					for iter_210_1, iter_210_2 in pairs(arg_207_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_210_2 then
							local var_210_11 = Mathf.Lerp(iter_210_2.color.r, 1, var_210_10)

							iter_210_2.color = Color.New(var_210_11, var_210_11, var_210_11)
						end
					end
				end
			end

			if arg_207_1.time_ >= var_210_8 + var_210_9 and arg_207_1.time_ < var_210_8 + var_210_9 + arg_210_0 and arg_207_1.var_.actorSpriteComps1061 then
				local var_210_12 = 1

				for iter_210_3, iter_210_4 in pairs(arg_207_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_210_4 then
						iter_210_4.color = Color.New(var_210_12, var_210_12, var_210_12)
					end
				end

				arg_207_1.var_.actorSpriteComps1061 = nil
			end

			local var_210_13 = 0
			local var_210_14 = 1.175

			if var_210_13 < arg_207_1.time_ and arg_207_1.time_ <= var_210_13 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_15 = arg_207_1:FormatText(StoryNameCfg[612].name)

				arg_207_1.leftNameTxt_.text = var_210_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_16 = arg_207_1:GetWordFromCfg(410142051)
				local var_210_17 = arg_207_1:FormatText(var_210_16.content)

				arg_207_1.text_.text = var_210_17

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_18 = 47
				local var_210_19 = utf8.len(var_210_17)
				local var_210_20 = var_210_18 <= 0 and var_210_14 or var_210_14 * (var_210_19 / var_210_18)

				if var_210_20 > 0 and var_210_14 < var_210_20 then
					arg_207_1.talkMaxDuration = var_210_20

					if var_210_20 + var_210_13 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_20 + var_210_13
					end
				end

				arg_207_1.text_.text = var_210_17
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142051", "story_v_out_410142.awb") ~= 0 then
					local var_210_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142051", "story_v_out_410142.awb") / 1000

					if var_210_21 + var_210_13 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_21 + var_210_13
					end

					if var_210_16.prefab_name ~= "" and arg_207_1.actors_[var_210_16.prefab_name] ~= nil then
						local var_210_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_16.prefab_name].transform, "story_v_out_410142", "410142051", "story_v_out_410142.awb")

						arg_207_1:RecordAudio("410142051", var_210_22)
						arg_207_1:RecordAudio("410142051", var_210_22)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_410142", "410142051", "story_v_out_410142.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_410142", "410142051", "story_v_out_410142.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_23 = math.max(var_210_14, arg_207_1.talkMaxDuration)

			if var_210_13 <= arg_207_1.time_ and arg_207_1.time_ < var_210_13 + var_210_23 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_13) / var_210_23

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_13 + var_210_23 and arg_207_1.time_ < var_210_13 + var_210_23 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play410142052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 410142052
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play410142053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1061"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.actorSpriteComps1061 == nil then
				arg_211_1.var_.actorSpriteComps1061 = var_214_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_214_2 = 0.034

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.actorSpriteComps1061 then
					for iter_214_0, iter_214_1 in pairs(arg_211_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_214_1 then
							local var_214_4 = Mathf.Lerp(iter_214_1.color.r, 0.5, var_214_3)

							iter_214_1.color = Color.New(var_214_4, var_214_4, var_214_4)
						end
					end
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.actorSpriteComps1061 then
				local var_214_5 = 0.5

				for iter_214_2, iter_214_3 in pairs(arg_211_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_214_3 then
						iter_214_3.color = Color.New(var_214_5, var_214_5, var_214_5)
					end
				end

				arg_211_1.var_.actorSpriteComps1061 = nil
			end

			local var_214_6 = arg_211_1.actors_["1056"]
			local var_214_7 = 0

			if var_214_7 < arg_211_1.time_ and arg_211_1.time_ <= var_214_7 + arg_214_0 and arg_211_1.var_.actorSpriteComps1056 == nil then
				arg_211_1.var_.actorSpriteComps1056 = var_214_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_214_8 = 0.034

			if var_214_7 <= arg_211_1.time_ and arg_211_1.time_ < var_214_7 + var_214_8 then
				local var_214_9 = (arg_211_1.time_ - var_214_7) / var_214_8

				if arg_211_1.var_.actorSpriteComps1056 then
					for iter_214_4, iter_214_5 in pairs(arg_211_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_214_5 then
							local var_214_10 = Mathf.Lerp(iter_214_5.color.r, 0.5, var_214_9)

							iter_214_5.color = Color.New(var_214_10, var_214_10, var_214_10)
						end
					end
				end
			end

			if arg_211_1.time_ >= var_214_7 + var_214_8 and arg_211_1.time_ < var_214_7 + var_214_8 + arg_214_0 and arg_211_1.var_.actorSpriteComps1056 then
				local var_214_11 = 0.5

				for iter_214_6, iter_214_7 in pairs(arg_211_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_214_7 then
						iter_214_7.color = Color.New(var_214_11, var_214_11, var_214_11)
					end
				end

				arg_211_1.var_.actorSpriteComps1056 = nil
			end

			local var_214_12 = 0
			local var_214_13 = 0.925

			if var_214_12 < arg_211_1.time_ and arg_211_1.time_ <= var_214_12 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, false)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_14 = arg_211_1:GetWordFromCfg(410142052)
				local var_214_15 = arg_211_1:FormatText(var_214_14.content)

				arg_211_1.text_.text = var_214_15

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_16 = 37
				local var_214_17 = utf8.len(var_214_15)
				local var_214_18 = var_214_16 <= 0 and var_214_13 or var_214_13 * (var_214_17 / var_214_16)

				if var_214_18 > 0 and var_214_13 < var_214_18 then
					arg_211_1.talkMaxDuration = var_214_18

					if var_214_18 + var_214_12 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_18 + var_214_12
					end
				end

				arg_211_1.text_.text = var_214_15
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_19 = math.max(var_214_13, arg_211_1.talkMaxDuration)

			if var_214_12 <= arg_211_1.time_ and arg_211_1.time_ < var_214_12 + var_214_19 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_12) / var_214_19

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_12 + var_214_19 and arg_211_1.time_ < var_214_12 + var_214_19 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play410142053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 410142053
		arg_215_1.duration_ = 6.1

		local var_215_0 = {
			ja = 6.1,
			CriLanguages = 2.866,
			zh = 2.866
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
				arg_215_0:Play410142054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1061"].transform
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 then
				arg_215_1.var_.moveOldPos1061 = var_218_0.localPosition
				var_218_0.localScale = Vector3.New(1, 1, 1)

				arg_215_1:CheckSpriteTmpPos("1061", 2)

				local var_218_2 = var_218_0.childCount

				for iter_218_0 = 0, var_218_2 - 1 do
					local var_218_3 = var_218_0:GetChild(iter_218_0)

					if var_218_3.name == "split_1" or not string.find(var_218_3.name, "split") then
						var_218_3.gameObject:SetActive(true)
					else
						var_218_3.gameObject:SetActive(false)
					end
				end
			end

			local var_218_4 = 0.001

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_4 then
				local var_218_5 = (arg_215_1.time_ - var_218_1) / var_218_4
				local var_218_6 = Vector3.New(-390, -490, 18)

				var_218_0.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos1061, var_218_6, var_218_5)
			end

			if arg_215_1.time_ >= var_218_1 + var_218_4 and arg_215_1.time_ < var_218_1 + var_218_4 + arg_218_0 then
				var_218_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_218_7 = arg_215_1.actors_["1061"]
			local var_218_8 = 0

			if var_218_8 < arg_215_1.time_ and arg_215_1.time_ <= var_218_8 + arg_218_0 and arg_215_1.var_.actorSpriteComps1061 == nil then
				arg_215_1.var_.actorSpriteComps1061 = var_218_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_218_9 = 0.034

			if var_218_8 <= arg_215_1.time_ and arg_215_1.time_ < var_218_8 + var_218_9 then
				local var_218_10 = (arg_215_1.time_ - var_218_8) / var_218_9

				if arg_215_1.var_.actorSpriteComps1061 then
					for iter_218_1, iter_218_2 in pairs(arg_215_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_218_2 then
							local var_218_11 = Mathf.Lerp(iter_218_2.color.r, 1, var_218_10)

							iter_218_2.color = Color.New(var_218_11, var_218_11, var_218_11)
						end
					end
				end
			end

			if arg_215_1.time_ >= var_218_8 + var_218_9 and arg_215_1.time_ < var_218_8 + var_218_9 + arg_218_0 and arg_215_1.var_.actorSpriteComps1061 then
				local var_218_12 = 1

				for iter_218_3, iter_218_4 in pairs(arg_215_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_218_4 then
						iter_218_4.color = Color.New(var_218_12, var_218_12, var_218_12)
					end
				end

				arg_215_1.var_.actorSpriteComps1061 = nil
			end

			local var_218_13 = 0
			local var_218_14 = 0.225

			if var_218_13 < arg_215_1.time_ and arg_215_1.time_ <= var_218_13 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_15 = arg_215_1:FormatText(StoryNameCfg[612].name)

				arg_215_1.leftNameTxt_.text = var_218_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_16 = arg_215_1:GetWordFromCfg(410142053)
				local var_218_17 = arg_215_1:FormatText(var_218_16.content)

				arg_215_1.text_.text = var_218_17

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_18 = 9
				local var_218_19 = utf8.len(var_218_17)
				local var_218_20 = var_218_18 <= 0 and var_218_14 or var_218_14 * (var_218_19 / var_218_18)

				if var_218_20 > 0 and var_218_14 < var_218_20 then
					arg_215_1.talkMaxDuration = var_218_20

					if var_218_20 + var_218_13 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_20 + var_218_13
					end
				end

				arg_215_1.text_.text = var_218_17
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142053", "story_v_out_410142.awb") ~= 0 then
					local var_218_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142053", "story_v_out_410142.awb") / 1000

					if var_218_21 + var_218_13 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_21 + var_218_13
					end

					if var_218_16.prefab_name ~= "" and arg_215_1.actors_[var_218_16.prefab_name] ~= nil then
						local var_218_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_16.prefab_name].transform, "story_v_out_410142", "410142053", "story_v_out_410142.awb")

						arg_215_1:RecordAudio("410142053", var_218_22)
						arg_215_1:RecordAudio("410142053", var_218_22)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_410142", "410142053", "story_v_out_410142.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_410142", "410142053", "story_v_out_410142.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_23 = math.max(var_218_14, arg_215_1.talkMaxDuration)

			if var_218_13 <= arg_215_1.time_ and arg_215_1.time_ < var_218_13 + var_218_23 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_13) / var_218_23

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_13 + var_218_23 and arg_215_1.time_ < var_218_13 + var_218_23 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play410142054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 410142054
		arg_219_1.duration_ = 7.1

		local var_219_0 = {
			ja = 7.1,
			CriLanguages = 6.266,
			zh = 6.266
		}
		local var_219_1 = manager.audio:GetLocalizationFlag()

		if var_219_0[var_219_1] ~= nil then
			arg_219_1.duration_ = var_219_0[var_219_1]
		end

		SetActive(arg_219_1.tipsGo_, false)

		function arg_219_1.onSingleLineFinish_()
			arg_219_1.onSingleLineUpdate_ = nil
			arg_219_1.onSingleLineFinish_ = nil
			arg_219_1.state_ = "waiting"
		end

		function arg_219_1.playNext_(arg_221_0)
			if arg_221_0 == 1 then
				arg_219_0:Play410142055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1056"].transform
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos1056 = var_222_0.localPosition
				var_222_0.localScale = Vector3.New(1, 1, 1)

				arg_219_1:CheckSpriteTmpPos("1056", 4)

				local var_222_2 = var_222_0.childCount

				for iter_222_0 = 0, var_222_2 - 1 do
					local var_222_3 = var_222_0:GetChild(iter_222_0)

					if var_222_3.name == "" or not string.find(var_222_3.name, "split") then
						var_222_3.gameObject:SetActive(true)
					else
						var_222_3.gameObject:SetActive(false)
					end
				end
			end

			local var_222_4 = 0.001

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_4 then
				local var_222_5 = (arg_219_1.time_ - var_222_1) / var_222_4
				local var_222_6 = Vector3.New(390, -350, -180)

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1056, var_222_6, var_222_5)
			end

			if arg_219_1.time_ >= var_222_1 + var_222_4 and arg_219_1.time_ < var_222_1 + var_222_4 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_222_7 = arg_219_1.actors_["1056"]
			local var_222_8 = 0

			if var_222_8 < arg_219_1.time_ and arg_219_1.time_ <= var_222_8 + arg_222_0 and arg_219_1.var_.actorSpriteComps1056 == nil then
				arg_219_1.var_.actorSpriteComps1056 = var_222_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_9 = 0.034

			if var_222_8 <= arg_219_1.time_ and arg_219_1.time_ < var_222_8 + var_222_9 then
				local var_222_10 = (arg_219_1.time_ - var_222_8) / var_222_9

				if arg_219_1.var_.actorSpriteComps1056 then
					for iter_222_1, iter_222_2 in pairs(arg_219_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_222_2 then
							local var_222_11 = Mathf.Lerp(iter_222_2.color.r, 1, var_222_10)

							iter_222_2.color = Color.New(var_222_11, var_222_11, var_222_11)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_8 + var_222_9 and arg_219_1.time_ < var_222_8 + var_222_9 + arg_222_0 and arg_219_1.var_.actorSpriteComps1056 then
				local var_222_12 = 1

				for iter_222_3, iter_222_4 in pairs(arg_219_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_222_4 then
						iter_222_4.color = Color.New(var_222_12, var_222_12, var_222_12)
					end
				end

				arg_219_1.var_.actorSpriteComps1056 = nil
			end

			local var_222_13 = arg_219_1.actors_["1061"]
			local var_222_14 = 0

			if var_222_14 < arg_219_1.time_ and arg_219_1.time_ <= var_222_14 + arg_222_0 and arg_219_1.var_.actorSpriteComps1061 == nil then
				arg_219_1.var_.actorSpriteComps1061 = var_222_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_15 = 0.034

			if var_222_14 <= arg_219_1.time_ and arg_219_1.time_ < var_222_14 + var_222_15 then
				local var_222_16 = (arg_219_1.time_ - var_222_14) / var_222_15

				if arg_219_1.var_.actorSpriteComps1061 then
					for iter_222_5, iter_222_6 in pairs(arg_219_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_222_6 then
							local var_222_17 = Mathf.Lerp(iter_222_6.color.r, 0.5, var_222_16)

							iter_222_6.color = Color.New(var_222_17, var_222_17, var_222_17)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_14 + var_222_15 and arg_219_1.time_ < var_222_14 + var_222_15 + arg_222_0 and arg_219_1.var_.actorSpriteComps1061 then
				local var_222_18 = 0.5

				for iter_222_7, iter_222_8 in pairs(arg_219_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_222_8 then
						iter_222_8.color = Color.New(var_222_18, var_222_18, var_222_18)
					end
				end

				arg_219_1.var_.actorSpriteComps1061 = nil
			end

			local var_222_19 = 0
			local var_222_20 = 0.9

			if var_222_19 < arg_219_1.time_ and arg_219_1.time_ <= var_222_19 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_21 = arg_219_1:FormatText(StoryNameCfg[605].name)

				arg_219_1.leftNameTxt_.text = var_222_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_22 = arg_219_1:GetWordFromCfg(410142054)
				local var_222_23 = arg_219_1:FormatText(var_222_22.content)

				arg_219_1.text_.text = var_222_23

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_24 = 36
				local var_222_25 = utf8.len(var_222_23)
				local var_222_26 = var_222_24 <= 0 and var_222_20 or var_222_20 * (var_222_25 / var_222_24)

				if var_222_26 > 0 and var_222_20 < var_222_26 then
					arg_219_1.talkMaxDuration = var_222_26

					if var_222_26 + var_222_19 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_26 + var_222_19
					end
				end

				arg_219_1.text_.text = var_222_23
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142054", "story_v_out_410142.awb") ~= 0 then
					local var_222_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142054", "story_v_out_410142.awb") / 1000

					if var_222_27 + var_222_19 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_27 + var_222_19
					end

					if var_222_22.prefab_name ~= "" and arg_219_1.actors_[var_222_22.prefab_name] ~= nil then
						local var_222_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_22.prefab_name].transform, "story_v_out_410142", "410142054", "story_v_out_410142.awb")

						arg_219_1:RecordAudio("410142054", var_222_28)
						arg_219_1:RecordAudio("410142054", var_222_28)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_410142", "410142054", "story_v_out_410142.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_410142", "410142054", "story_v_out_410142.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_29 = math.max(var_222_20, arg_219_1.talkMaxDuration)

			if var_222_19 <= arg_219_1.time_ and arg_219_1.time_ < var_222_19 + var_222_29 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_19) / var_222_29

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_19 + var_222_29 and arg_219_1.time_ < var_222_19 + var_222_29 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play410142055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 410142055
		arg_223_1.duration_ = 13.4

		local var_223_0 = {
			ja = 13.4,
			CriLanguages = 8.7,
			zh = 8.7
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
				arg_223_0:Play410142056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1056"].transform
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.var_.moveOldPos1056 = var_226_0.localPosition
				var_226_0.localScale = Vector3.New(1, 1, 1)

				arg_223_1:CheckSpriteTmpPos("1056", 4)

				local var_226_2 = var_226_0.childCount

				for iter_226_0 = 0, var_226_2 - 1 do
					local var_226_3 = var_226_0:GetChild(iter_226_0)

					if var_226_3.name == "" or not string.find(var_226_3.name, "split") then
						var_226_3.gameObject:SetActive(true)
					else
						var_226_3.gameObject:SetActive(false)
					end
				end
			end

			local var_226_4 = 0.001

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_4 then
				local var_226_5 = (arg_223_1.time_ - var_226_1) / var_226_4
				local var_226_6 = Vector3.New(390, -350, -180)

				var_226_0.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos1056, var_226_6, var_226_5)
			end

			if arg_223_1.time_ >= var_226_1 + var_226_4 and arg_223_1.time_ < var_226_1 + var_226_4 + arg_226_0 then
				var_226_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_226_7 = arg_223_1.actors_["1056"]
			local var_226_8 = 0

			if var_226_8 < arg_223_1.time_ and arg_223_1.time_ <= var_226_8 + arg_226_0 and arg_223_1.var_.actorSpriteComps1056 == nil then
				arg_223_1.var_.actorSpriteComps1056 = var_226_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_226_9 = 0.034

			if var_226_8 <= arg_223_1.time_ and arg_223_1.time_ < var_226_8 + var_226_9 then
				local var_226_10 = (arg_223_1.time_ - var_226_8) / var_226_9

				if arg_223_1.var_.actorSpriteComps1056 then
					for iter_226_1, iter_226_2 in pairs(arg_223_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_226_2 then
							local var_226_11 = Mathf.Lerp(iter_226_2.color.r, 1, var_226_10)

							iter_226_2.color = Color.New(var_226_11, var_226_11, var_226_11)
						end
					end
				end
			end

			if arg_223_1.time_ >= var_226_8 + var_226_9 and arg_223_1.time_ < var_226_8 + var_226_9 + arg_226_0 and arg_223_1.var_.actorSpriteComps1056 then
				local var_226_12 = 1

				for iter_226_3, iter_226_4 in pairs(arg_223_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_226_4 then
						iter_226_4.color = Color.New(var_226_12, var_226_12, var_226_12)
					end
				end

				arg_223_1.var_.actorSpriteComps1056 = nil
			end

			local var_226_13 = 0
			local var_226_14 = 1.15

			if var_226_13 < arg_223_1.time_ and arg_223_1.time_ <= var_226_13 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_15 = arg_223_1:FormatText(StoryNameCfg[605].name)

				arg_223_1.leftNameTxt_.text = var_226_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_16 = arg_223_1:GetWordFromCfg(410142055)
				local var_226_17 = arg_223_1:FormatText(var_226_16.content)

				arg_223_1.text_.text = var_226_17

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_18 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142055", "story_v_out_410142.awb") ~= 0 then
					local var_226_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142055", "story_v_out_410142.awb") / 1000

					if var_226_21 + var_226_13 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_21 + var_226_13
					end

					if var_226_16.prefab_name ~= "" and arg_223_1.actors_[var_226_16.prefab_name] ~= nil then
						local var_226_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_16.prefab_name].transform, "story_v_out_410142", "410142055", "story_v_out_410142.awb")

						arg_223_1:RecordAudio("410142055", var_226_22)
						arg_223_1:RecordAudio("410142055", var_226_22)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_410142", "410142055", "story_v_out_410142.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_410142", "410142055", "story_v_out_410142.awb")
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
	Play410142056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 410142056
		arg_227_1.duration_ = 9.066

		local var_227_0 = {
			ja = 9.066,
			CriLanguages = 4.866,
			zh = 4.866
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
				arg_227_0:Play410142057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1061"].transform
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1.var_.moveOldPos1061 = var_230_0.localPosition
				var_230_0.localScale = Vector3.New(1, 1, 1)

				arg_227_1:CheckSpriteTmpPos("1061", 2)

				local var_230_2 = var_230_0.childCount

				for iter_230_0 = 0, var_230_2 - 1 do
					local var_230_3 = var_230_0:GetChild(iter_230_0)

					if var_230_3.name == "split_5" or not string.find(var_230_3.name, "split") then
						var_230_3.gameObject:SetActive(true)
					else
						var_230_3.gameObject:SetActive(false)
					end
				end
			end

			local var_230_4 = 0.001

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_4 then
				local var_230_5 = (arg_227_1.time_ - var_230_1) / var_230_4
				local var_230_6 = Vector3.New(-390, -490, 18)

				var_230_0.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos1061, var_230_6, var_230_5)
			end

			if arg_227_1.time_ >= var_230_1 + var_230_4 and arg_227_1.time_ < var_230_1 + var_230_4 + arg_230_0 then
				var_230_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_230_7 = arg_227_1.actors_["1061"]
			local var_230_8 = 0

			if var_230_8 < arg_227_1.time_ and arg_227_1.time_ <= var_230_8 + arg_230_0 and arg_227_1.var_.actorSpriteComps1061 == nil then
				arg_227_1.var_.actorSpriteComps1061 = var_230_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_230_9 = 0.034

			if var_230_8 <= arg_227_1.time_ and arg_227_1.time_ < var_230_8 + var_230_9 then
				local var_230_10 = (arg_227_1.time_ - var_230_8) / var_230_9

				if arg_227_1.var_.actorSpriteComps1061 then
					for iter_230_1, iter_230_2 in pairs(arg_227_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_230_2 then
							local var_230_11 = Mathf.Lerp(iter_230_2.color.r, 1, var_230_10)

							iter_230_2.color = Color.New(var_230_11, var_230_11, var_230_11)
						end
					end
				end
			end

			if arg_227_1.time_ >= var_230_8 + var_230_9 and arg_227_1.time_ < var_230_8 + var_230_9 + arg_230_0 and arg_227_1.var_.actorSpriteComps1061 then
				local var_230_12 = 1

				for iter_230_3, iter_230_4 in pairs(arg_227_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_230_4 then
						iter_230_4.color = Color.New(var_230_12, var_230_12, var_230_12)
					end
				end

				arg_227_1.var_.actorSpriteComps1061 = nil
			end

			local var_230_13 = arg_227_1.actors_["1056"]
			local var_230_14 = 0

			if var_230_14 < arg_227_1.time_ and arg_227_1.time_ <= var_230_14 + arg_230_0 and arg_227_1.var_.actorSpriteComps1056 == nil then
				arg_227_1.var_.actorSpriteComps1056 = var_230_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_230_15 = 0.034

			if var_230_14 <= arg_227_1.time_ and arg_227_1.time_ < var_230_14 + var_230_15 then
				local var_230_16 = (arg_227_1.time_ - var_230_14) / var_230_15

				if arg_227_1.var_.actorSpriteComps1056 then
					for iter_230_5, iter_230_6 in pairs(arg_227_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_230_6 then
							local var_230_17 = Mathf.Lerp(iter_230_6.color.r, 0.5, var_230_16)

							iter_230_6.color = Color.New(var_230_17, var_230_17, var_230_17)
						end
					end
				end
			end

			if arg_227_1.time_ >= var_230_14 + var_230_15 and arg_227_1.time_ < var_230_14 + var_230_15 + arg_230_0 and arg_227_1.var_.actorSpriteComps1056 then
				local var_230_18 = 0.5

				for iter_230_7, iter_230_8 in pairs(arg_227_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_230_8 then
						iter_230_8.color = Color.New(var_230_18, var_230_18, var_230_18)
					end
				end

				arg_227_1.var_.actorSpriteComps1056 = nil
			end

			local var_230_19 = 0
			local var_230_20 = 0.4

			if var_230_19 < arg_227_1.time_ and arg_227_1.time_ <= var_230_19 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_21 = arg_227_1:FormatText(StoryNameCfg[612].name)

				arg_227_1.leftNameTxt_.text = var_230_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_22 = arg_227_1:GetWordFromCfg(410142056)
				local var_230_23 = arg_227_1:FormatText(var_230_22.content)

				arg_227_1.text_.text = var_230_23

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_24 = 16
				local var_230_25 = utf8.len(var_230_23)
				local var_230_26 = var_230_24 <= 0 and var_230_20 or var_230_20 * (var_230_25 / var_230_24)

				if var_230_26 > 0 and var_230_20 < var_230_26 then
					arg_227_1.talkMaxDuration = var_230_26

					if var_230_26 + var_230_19 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_26 + var_230_19
					end
				end

				arg_227_1.text_.text = var_230_23
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142056", "story_v_out_410142.awb") ~= 0 then
					local var_230_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142056", "story_v_out_410142.awb") / 1000

					if var_230_27 + var_230_19 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_27 + var_230_19
					end

					if var_230_22.prefab_name ~= "" and arg_227_1.actors_[var_230_22.prefab_name] ~= nil then
						local var_230_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_22.prefab_name].transform, "story_v_out_410142", "410142056", "story_v_out_410142.awb")

						arg_227_1:RecordAudio("410142056", var_230_28)
						arg_227_1:RecordAudio("410142056", var_230_28)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_410142", "410142056", "story_v_out_410142.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_410142", "410142056", "story_v_out_410142.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_29 = math.max(var_230_20, arg_227_1.talkMaxDuration)

			if var_230_19 <= arg_227_1.time_ and arg_227_1.time_ < var_230_19 + var_230_29 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_19) / var_230_29

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_19 + var_230_29 and arg_227_1.time_ < var_230_19 + var_230_29 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play410142057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 410142057
		arg_231_1.duration_ = 8.466

		local var_231_0 = {
			ja = 8.466,
			CriLanguages = 6.666,
			zh = 6.666
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
				arg_231_0:Play410142058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1056"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos1056 = var_234_0.localPosition
				var_234_0.localScale = Vector3.New(1, 1, 1)

				arg_231_1:CheckSpriteTmpPos("1056", 4)

				local var_234_2 = var_234_0.childCount

				for iter_234_0 = 0, var_234_2 - 1 do
					local var_234_3 = var_234_0:GetChild(iter_234_0)

					if var_234_3.name == "" or not string.find(var_234_3.name, "split") then
						var_234_3.gameObject:SetActive(true)
					else
						var_234_3.gameObject:SetActive(false)
					end
				end
			end

			local var_234_4 = 0.001

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_4 then
				local var_234_5 = (arg_231_1.time_ - var_234_1) / var_234_4
				local var_234_6 = Vector3.New(390, -350, -180)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1056, var_234_6, var_234_5)
			end

			if arg_231_1.time_ >= var_234_1 + var_234_4 and arg_231_1.time_ < var_234_1 + var_234_4 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_234_7 = arg_231_1.actors_["1056"]
			local var_234_8 = 0

			if var_234_8 < arg_231_1.time_ and arg_231_1.time_ <= var_234_8 + arg_234_0 and arg_231_1.var_.actorSpriteComps1056 == nil then
				arg_231_1.var_.actorSpriteComps1056 = var_234_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_234_9 = 0.034

			if var_234_8 <= arg_231_1.time_ and arg_231_1.time_ < var_234_8 + var_234_9 then
				local var_234_10 = (arg_231_1.time_ - var_234_8) / var_234_9

				if arg_231_1.var_.actorSpriteComps1056 then
					for iter_234_1, iter_234_2 in pairs(arg_231_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_234_2 then
							local var_234_11 = Mathf.Lerp(iter_234_2.color.r, 1, var_234_10)

							iter_234_2.color = Color.New(var_234_11, var_234_11, var_234_11)
						end
					end
				end
			end

			if arg_231_1.time_ >= var_234_8 + var_234_9 and arg_231_1.time_ < var_234_8 + var_234_9 + arg_234_0 and arg_231_1.var_.actorSpriteComps1056 then
				local var_234_12 = 1

				for iter_234_3, iter_234_4 in pairs(arg_231_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_234_4 then
						iter_234_4.color = Color.New(var_234_12, var_234_12, var_234_12)
					end
				end

				arg_231_1.var_.actorSpriteComps1056 = nil
			end

			local var_234_13 = arg_231_1.actors_["1061"]
			local var_234_14 = 0

			if var_234_14 < arg_231_1.time_ and arg_231_1.time_ <= var_234_14 + arg_234_0 and arg_231_1.var_.actorSpriteComps1061 == nil then
				arg_231_1.var_.actorSpriteComps1061 = var_234_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_234_15 = 0.034

			if var_234_14 <= arg_231_1.time_ and arg_231_1.time_ < var_234_14 + var_234_15 then
				local var_234_16 = (arg_231_1.time_ - var_234_14) / var_234_15

				if arg_231_1.var_.actorSpriteComps1061 then
					for iter_234_5, iter_234_6 in pairs(arg_231_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_234_6 then
							local var_234_17 = Mathf.Lerp(iter_234_6.color.r, 0.5, var_234_16)

							iter_234_6.color = Color.New(var_234_17, var_234_17, var_234_17)
						end
					end
				end
			end

			if arg_231_1.time_ >= var_234_14 + var_234_15 and arg_231_1.time_ < var_234_14 + var_234_15 + arg_234_0 and arg_231_1.var_.actorSpriteComps1061 then
				local var_234_18 = 0.5

				for iter_234_7, iter_234_8 in pairs(arg_231_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_234_8 then
						iter_234_8.color = Color.New(var_234_18, var_234_18, var_234_18)
					end
				end

				arg_231_1.var_.actorSpriteComps1061 = nil
			end

			local var_234_19 = 0
			local var_234_20 = 0.9

			if var_234_19 < arg_231_1.time_ and arg_231_1.time_ <= var_234_19 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_21 = arg_231_1:FormatText(StoryNameCfg[605].name)

				arg_231_1.leftNameTxt_.text = var_234_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_22 = arg_231_1:GetWordFromCfg(410142057)
				local var_234_23 = arg_231_1:FormatText(var_234_22.content)

				arg_231_1.text_.text = var_234_23

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_24 = 36
				local var_234_25 = utf8.len(var_234_23)
				local var_234_26 = var_234_24 <= 0 and var_234_20 or var_234_20 * (var_234_25 / var_234_24)

				if var_234_26 > 0 and var_234_20 < var_234_26 then
					arg_231_1.talkMaxDuration = var_234_26

					if var_234_26 + var_234_19 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_26 + var_234_19
					end
				end

				arg_231_1.text_.text = var_234_23
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142057", "story_v_out_410142.awb") ~= 0 then
					local var_234_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142057", "story_v_out_410142.awb") / 1000

					if var_234_27 + var_234_19 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_27 + var_234_19
					end

					if var_234_22.prefab_name ~= "" and arg_231_1.actors_[var_234_22.prefab_name] ~= nil then
						local var_234_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_22.prefab_name].transform, "story_v_out_410142", "410142057", "story_v_out_410142.awb")

						arg_231_1:RecordAudio("410142057", var_234_28)
						arg_231_1:RecordAudio("410142057", var_234_28)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_410142", "410142057", "story_v_out_410142.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_410142", "410142057", "story_v_out_410142.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_29 = math.max(var_234_20, arg_231_1.talkMaxDuration)

			if var_234_19 <= arg_231_1.time_ and arg_231_1.time_ < var_234_19 + var_234_29 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_19) / var_234_29

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_19 + var_234_29 and arg_231_1.time_ < var_234_19 + var_234_29 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play410142058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 410142058
		arg_235_1.duration_ = 9.833

		local var_235_0 = {
			ja = 9.833,
			CriLanguages = 8.9,
			zh = 8.9
		}
		local var_235_1 = manager.audio:GetLocalizationFlag()

		if var_235_0[var_235_1] ~= nil then
			arg_235_1.duration_ = var_235_0[var_235_1]
		end

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play410142059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1061"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos1061 = var_238_0.localPosition
				var_238_0.localScale = Vector3.New(1, 1, 1)

				arg_235_1:CheckSpriteTmpPos("1061", 2)

				local var_238_2 = var_238_0.childCount

				for iter_238_0 = 0, var_238_2 - 1 do
					local var_238_3 = var_238_0:GetChild(iter_238_0)

					if var_238_3.name == "" or not string.find(var_238_3.name, "split") then
						var_238_3.gameObject:SetActive(true)
					else
						var_238_3.gameObject:SetActive(false)
					end
				end
			end

			local var_238_4 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_4 then
				local var_238_5 = (arg_235_1.time_ - var_238_1) / var_238_4
				local var_238_6 = Vector3.New(-390, -490, 18)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1061, var_238_6, var_238_5)
			end

			if arg_235_1.time_ >= var_238_1 + var_238_4 and arg_235_1.time_ < var_238_1 + var_238_4 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_238_7 = arg_235_1.actors_["1061"]
			local var_238_8 = 0

			if var_238_8 < arg_235_1.time_ and arg_235_1.time_ <= var_238_8 + arg_238_0 and arg_235_1.var_.actorSpriteComps1061 == nil then
				arg_235_1.var_.actorSpriteComps1061 = var_238_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_238_9 = 0.034

			if var_238_8 <= arg_235_1.time_ and arg_235_1.time_ < var_238_8 + var_238_9 then
				local var_238_10 = (arg_235_1.time_ - var_238_8) / var_238_9

				if arg_235_1.var_.actorSpriteComps1061 then
					for iter_238_1, iter_238_2 in pairs(arg_235_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_238_2 then
							local var_238_11 = Mathf.Lerp(iter_238_2.color.r, 1, var_238_10)

							iter_238_2.color = Color.New(var_238_11, var_238_11, var_238_11)
						end
					end
				end
			end

			if arg_235_1.time_ >= var_238_8 + var_238_9 and arg_235_1.time_ < var_238_8 + var_238_9 + arg_238_0 and arg_235_1.var_.actorSpriteComps1061 then
				local var_238_12 = 1

				for iter_238_3, iter_238_4 in pairs(arg_235_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_238_4 then
						iter_238_4.color = Color.New(var_238_12, var_238_12, var_238_12)
					end
				end

				arg_235_1.var_.actorSpriteComps1061 = nil
			end

			local var_238_13 = arg_235_1.actors_["1056"]
			local var_238_14 = 0

			if var_238_14 < arg_235_1.time_ and arg_235_1.time_ <= var_238_14 + arg_238_0 and arg_235_1.var_.actorSpriteComps1056 == nil then
				arg_235_1.var_.actorSpriteComps1056 = var_238_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_238_15 = 0.034

			if var_238_14 <= arg_235_1.time_ and arg_235_1.time_ < var_238_14 + var_238_15 then
				local var_238_16 = (arg_235_1.time_ - var_238_14) / var_238_15

				if arg_235_1.var_.actorSpriteComps1056 then
					for iter_238_5, iter_238_6 in pairs(arg_235_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_238_6 then
							local var_238_17 = Mathf.Lerp(iter_238_6.color.r, 0.5, var_238_16)

							iter_238_6.color = Color.New(var_238_17, var_238_17, var_238_17)
						end
					end
				end
			end

			if arg_235_1.time_ >= var_238_14 + var_238_15 and arg_235_1.time_ < var_238_14 + var_238_15 + arg_238_0 and arg_235_1.var_.actorSpriteComps1056 then
				local var_238_18 = 0.5

				for iter_238_7, iter_238_8 in pairs(arg_235_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_238_8 then
						iter_238_8.color = Color.New(var_238_18, var_238_18, var_238_18)
					end
				end

				arg_235_1.var_.actorSpriteComps1056 = nil
			end

			local var_238_19 = 0
			local var_238_20 = 0.9

			if var_238_19 < arg_235_1.time_ and arg_235_1.time_ <= var_238_19 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_21 = arg_235_1:FormatText(StoryNameCfg[612].name)

				arg_235_1.leftNameTxt_.text = var_238_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_22 = arg_235_1:GetWordFromCfg(410142058)
				local var_238_23 = arg_235_1:FormatText(var_238_22.content)

				arg_235_1.text_.text = var_238_23

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_24 = 36
				local var_238_25 = utf8.len(var_238_23)
				local var_238_26 = var_238_24 <= 0 and var_238_20 or var_238_20 * (var_238_25 / var_238_24)

				if var_238_26 > 0 and var_238_20 < var_238_26 then
					arg_235_1.talkMaxDuration = var_238_26

					if var_238_26 + var_238_19 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_26 + var_238_19
					end
				end

				arg_235_1.text_.text = var_238_23
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142058", "story_v_out_410142.awb") ~= 0 then
					local var_238_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142058", "story_v_out_410142.awb") / 1000

					if var_238_27 + var_238_19 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_27 + var_238_19
					end

					if var_238_22.prefab_name ~= "" and arg_235_1.actors_[var_238_22.prefab_name] ~= nil then
						local var_238_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_22.prefab_name].transform, "story_v_out_410142", "410142058", "story_v_out_410142.awb")

						arg_235_1:RecordAudio("410142058", var_238_28)
						arg_235_1:RecordAudio("410142058", var_238_28)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_410142", "410142058", "story_v_out_410142.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_410142", "410142058", "story_v_out_410142.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_29 = math.max(var_238_20, arg_235_1.talkMaxDuration)

			if var_238_19 <= arg_235_1.time_ and arg_235_1.time_ < var_238_19 + var_238_29 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_19) / var_238_29

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_19 + var_238_29 and arg_235_1.time_ < var_238_19 + var_238_29 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play410142059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 410142059
		arg_239_1.duration_ = 9.5

		local var_239_0 = {
			ja = 9.5,
			CriLanguages = 9.033,
			zh = 9.033
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
				arg_239_0:Play410142060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1056"].transform
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.var_.moveOldPos1056 = var_242_0.localPosition
				var_242_0.localScale = Vector3.New(1, 1, 1)

				arg_239_1:CheckSpriteTmpPos("1056", 4)

				local var_242_2 = var_242_0.childCount

				for iter_242_0 = 0, var_242_2 - 1 do
					local var_242_3 = var_242_0:GetChild(iter_242_0)

					if var_242_3.name == "" or not string.find(var_242_3.name, "split") then
						var_242_3.gameObject:SetActive(true)
					else
						var_242_3.gameObject:SetActive(false)
					end
				end
			end

			local var_242_4 = 0.001

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_4 then
				local var_242_5 = (arg_239_1.time_ - var_242_1) / var_242_4
				local var_242_6 = Vector3.New(390, -350, -180)

				var_242_0.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1056, var_242_6, var_242_5)
			end

			if arg_239_1.time_ >= var_242_1 + var_242_4 and arg_239_1.time_ < var_242_1 + var_242_4 + arg_242_0 then
				var_242_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_242_7 = arg_239_1.actors_["1056"]
			local var_242_8 = 0

			if var_242_8 < arg_239_1.time_ and arg_239_1.time_ <= var_242_8 + arg_242_0 and arg_239_1.var_.actorSpriteComps1056 == nil then
				arg_239_1.var_.actorSpriteComps1056 = var_242_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_242_9 = 0.034

			if var_242_8 <= arg_239_1.time_ and arg_239_1.time_ < var_242_8 + var_242_9 then
				local var_242_10 = (arg_239_1.time_ - var_242_8) / var_242_9

				if arg_239_1.var_.actorSpriteComps1056 then
					for iter_242_1, iter_242_2 in pairs(arg_239_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_242_2 then
							local var_242_11 = Mathf.Lerp(iter_242_2.color.r, 1, var_242_10)

							iter_242_2.color = Color.New(var_242_11, var_242_11, var_242_11)
						end
					end
				end
			end

			if arg_239_1.time_ >= var_242_8 + var_242_9 and arg_239_1.time_ < var_242_8 + var_242_9 + arg_242_0 and arg_239_1.var_.actorSpriteComps1056 then
				local var_242_12 = 1

				for iter_242_3, iter_242_4 in pairs(arg_239_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_242_4 then
						iter_242_4.color = Color.New(var_242_12, var_242_12, var_242_12)
					end
				end

				arg_239_1.var_.actorSpriteComps1056 = nil
			end

			local var_242_13 = arg_239_1.actors_["1061"]
			local var_242_14 = 0

			if var_242_14 < arg_239_1.time_ and arg_239_1.time_ <= var_242_14 + arg_242_0 and arg_239_1.var_.actorSpriteComps1061 == nil then
				arg_239_1.var_.actorSpriteComps1061 = var_242_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_242_15 = 0.034

			if var_242_14 <= arg_239_1.time_ and arg_239_1.time_ < var_242_14 + var_242_15 then
				local var_242_16 = (arg_239_1.time_ - var_242_14) / var_242_15

				if arg_239_1.var_.actorSpriteComps1061 then
					for iter_242_5, iter_242_6 in pairs(arg_239_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_242_6 then
							local var_242_17 = Mathf.Lerp(iter_242_6.color.r, 0.5, var_242_16)

							iter_242_6.color = Color.New(var_242_17, var_242_17, var_242_17)
						end
					end
				end
			end

			if arg_239_1.time_ >= var_242_14 + var_242_15 and arg_239_1.time_ < var_242_14 + var_242_15 + arg_242_0 and arg_239_1.var_.actorSpriteComps1061 then
				local var_242_18 = 0.5

				for iter_242_7, iter_242_8 in pairs(arg_239_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_242_8 then
						iter_242_8.color = Color.New(var_242_18, var_242_18, var_242_18)
					end
				end

				arg_239_1.var_.actorSpriteComps1061 = nil
			end

			local var_242_19 = 0
			local var_242_20 = 0.9

			if var_242_19 < arg_239_1.time_ and arg_239_1.time_ <= var_242_19 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_21 = arg_239_1:FormatText(StoryNameCfg[605].name)

				arg_239_1.leftNameTxt_.text = var_242_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_22 = arg_239_1:GetWordFromCfg(410142059)
				local var_242_23 = arg_239_1:FormatText(var_242_22.content)

				arg_239_1.text_.text = var_242_23

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_24 = 36
				local var_242_25 = utf8.len(var_242_23)
				local var_242_26 = var_242_24 <= 0 and var_242_20 or var_242_20 * (var_242_25 / var_242_24)

				if var_242_26 > 0 and var_242_20 < var_242_26 then
					arg_239_1.talkMaxDuration = var_242_26

					if var_242_26 + var_242_19 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_26 + var_242_19
					end
				end

				arg_239_1.text_.text = var_242_23
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142059", "story_v_out_410142.awb") ~= 0 then
					local var_242_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142059", "story_v_out_410142.awb") / 1000

					if var_242_27 + var_242_19 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_27 + var_242_19
					end

					if var_242_22.prefab_name ~= "" and arg_239_1.actors_[var_242_22.prefab_name] ~= nil then
						local var_242_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_22.prefab_name].transform, "story_v_out_410142", "410142059", "story_v_out_410142.awb")

						arg_239_1:RecordAudio("410142059", var_242_28)
						arg_239_1:RecordAudio("410142059", var_242_28)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_410142", "410142059", "story_v_out_410142.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_410142", "410142059", "story_v_out_410142.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_29 = math.max(var_242_20, arg_239_1.talkMaxDuration)

			if var_242_19 <= arg_239_1.time_ and arg_239_1.time_ < var_242_19 + var_242_29 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_19) / var_242_29

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_19 + var_242_29 and arg_239_1.time_ < var_242_19 + var_242_29 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play410142060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 410142060
		arg_243_1.duration_ = 5

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play410142061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1061"]
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 and arg_243_1.var_.actorSpriteComps1061 == nil then
				arg_243_1.var_.actorSpriteComps1061 = var_246_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_246_2 = 0.034

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2

				if arg_243_1.var_.actorSpriteComps1061 then
					for iter_246_0, iter_246_1 in pairs(arg_243_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_246_1 then
							local var_246_4 = Mathf.Lerp(iter_246_1.color.r, 0.5, var_246_3)

							iter_246_1.color = Color.New(var_246_4, var_246_4, var_246_4)
						end
					end
				end
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 and arg_243_1.var_.actorSpriteComps1061 then
				local var_246_5 = 0.5

				for iter_246_2, iter_246_3 in pairs(arg_243_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_246_3 then
						iter_246_3.color = Color.New(var_246_5, var_246_5, var_246_5)
					end
				end

				arg_243_1.var_.actorSpriteComps1061 = nil
			end

			local var_246_6 = arg_243_1.actors_["1056"]
			local var_246_7 = 0

			if var_246_7 < arg_243_1.time_ and arg_243_1.time_ <= var_246_7 + arg_246_0 and arg_243_1.var_.actorSpriteComps1056 == nil then
				arg_243_1.var_.actorSpriteComps1056 = var_246_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_246_8 = 0.034

			if var_246_7 <= arg_243_1.time_ and arg_243_1.time_ < var_246_7 + var_246_8 then
				local var_246_9 = (arg_243_1.time_ - var_246_7) / var_246_8

				if arg_243_1.var_.actorSpriteComps1056 then
					for iter_246_4, iter_246_5 in pairs(arg_243_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_246_5 then
							local var_246_10 = Mathf.Lerp(iter_246_5.color.r, 0.5, var_246_9)

							iter_246_5.color = Color.New(var_246_10, var_246_10, var_246_10)
						end
					end
				end
			end

			if arg_243_1.time_ >= var_246_7 + var_246_8 and arg_243_1.time_ < var_246_7 + var_246_8 + arg_246_0 and arg_243_1.var_.actorSpriteComps1056 then
				local var_246_11 = 0.5

				for iter_246_6, iter_246_7 in pairs(arg_243_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_246_7 then
						iter_246_7.color = Color.New(var_246_11, var_246_11, var_246_11)
					end
				end

				arg_243_1.var_.actorSpriteComps1056 = nil
			end

			local var_246_12 = 0
			local var_246_13 = 1.225

			if var_246_12 < arg_243_1.time_ and arg_243_1.time_ <= var_246_12 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, false)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_14 = arg_243_1:GetWordFromCfg(410142060)
				local var_246_15 = arg_243_1:FormatText(var_246_14.content)

				arg_243_1.text_.text = var_246_15

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_16 = 49
				local var_246_17 = utf8.len(var_246_15)
				local var_246_18 = var_246_16 <= 0 and var_246_13 or var_246_13 * (var_246_17 / var_246_16)

				if var_246_18 > 0 and var_246_13 < var_246_18 then
					arg_243_1.talkMaxDuration = var_246_18

					if var_246_18 + var_246_12 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_18 + var_246_12
					end
				end

				arg_243_1.text_.text = var_246_15
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)
				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_19 = math.max(var_246_13, arg_243_1.talkMaxDuration)

			if var_246_12 <= arg_243_1.time_ and arg_243_1.time_ < var_246_12 + var_246_19 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_12) / var_246_19

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_12 + var_246_19 and arg_243_1.time_ < var_246_12 + var_246_19 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play410142061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 410142061
		arg_247_1.duration_ = 4.3

		local var_247_0 = {
			ja = 4.3,
			CriLanguages = 1.633,
			zh = 1.633
		}
		local var_247_1 = manager.audio:GetLocalizationFlag()

		if var_247_0[var_247_1] ~= nil then
			arg_247_1.duration_ = var_247_0[var_247_1]
		end

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play410142062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1056"].transform
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 then
				arg_247_1.var_.moveOldPos1056 = var_250_0.localPosition
				var_250_0.localScale = Vector3.New(1, 1, 1)

				arg_247_1:CheckSpriteTmpPos("1056", 3)

				local var_250_2 = var_250_0.childCount

				for iter_250_0 = 0, var_250_2 - 1 do
					local var_250_3 = var_250_0:GetChild(iter_250_0)

					if var_250_3.name == "" or not string.find(var_250_3.name, "split") then
						var_250_3.gameObject:SetActive(true)
					else
						var_250_3.gameObject:SetActive(false)
					end
				end
			end

			local var_250_4 = 0.001

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_4 then
				local var_250_5 = (arg_247_1.time_ - var_250_1) / var_250_4
				local var_250_6 = Vector3.New(0, -350, -180)

				var_250_0.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1056, var_250_6, var_250_5)
			end

			if arg_247_1.time_ >= var_250_1 + var_250_4 and arg_247_1.time_ < var_250_1 + var_250_4 + arg_250_0 then
				var_250_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_250_7 = arg_247_1.actors_["1061"].transform
			local var_250_8 = 0

			if var_250_8 < arg_247_1.time_ and arg_247_1.time_ <= var_250_8 + arg_250_0 then
				arg_247_1.var_.moveOldPos1061 = var_250_7.localPosition
				var_250_7.localScale = Vector3.New(1, 1, 1)

				arg_247_1:CheckSpriteTmpPos("1061", 7)

				local var_250_9 = var_250_7.childCount

				for iter_250_1 = 0, var_250_9 - 1 do
					local var_250_10 = var_250_7:GetChild(iter_250_1)

					if var_250_10.name == "" or not string.find(var_250_10.name, "split") then
						var_250_10.gameObject:SetActive(true)
					else
						var_250_10.gameObject:SetActive(false)
					end
				end
			end

			local var_250_11 = 0.001

			if var_250_8 <= arg_247_1.time_ and arg_247_1.time_ < var_250_8 + var_250_11 then
				local var_250_12 = (arg_247_1.time_ - var_250_8) / var_250_11
				local var_250_13 = Vector3.New(0, -2000, 18)

				var_250_7.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1061, var_250_13, var_250_12)
			end

			if arg_247_1.time_ >= var_250_8 + var_250_11 and arg_247_1.time_ < var_250_8 + var_250_11 + arg_250_0 then
				var_250_7.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_250_14 = arg_247_1.actors_["1056"]
			local var_250_15 = 0

			if var_250_15 < arg_247_1.time_ and arg_247_1.time_ <= var_250_15 + arg_250_0 and arg_247_1.var_.actorSpriteComps1056 == nil then
				arg_247_1.var_.actorSpriteComps1056 = var_250_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_250_16 = 0.034

			if var_250_15 <= arg_247_1.time_ and arg_247_1.time_ < var_250_15 + var_250_16 then
				local var_250_17 = (arg_247_1.time_ - var_250_15) / var_250_16

				if arg_247_1.var_.actorSpriteComps1056 then
					for iter_250_2, iter_250_3 in pairs(arg_247_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_250_3 then
							local var_250_18 = Mathf.Lerp(iter_250_3.color.r, 1, var_250_17)

							iter_250_3.color = Color.New(var_250_18, var_250_18, var_250_18)
						end
					end
				end
			end

			if arg_247_1.time_ >= var_250_15 + var_250_16 and arg_247_1.time_ < var_250_15 + var_250_16 + arg_250_0 and arg_247_1.var_.actorSpriteComps1056 then
				local var_250_19 = 1

				for iter_250_4, iter_250_5 in pairs(arg_247_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_250_5 then
						iter_250_5.color = Color.New(var_250_19, var_250_19, var_250_19)
					end
				end

				arg_247_1.var_.actorSpriteComps1056 = nil
			end

			local var_250_20 = arg_247_1.actors_["1061"]
			local var_250_21 = 0

			if var_250_21 < arg_247_1.time_ and arg_247_1.time_ <= var_250_21 + arg_250_0 and arg_247_1.var_.actorSpriteComps1061 == nil then
				arg_247_1.var_.actorSpriteComps1061 = var_250_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_250_22 = 0.034

			if var_250_21 <= arg_247_1.time_ and arg_247_1.time_ < var_250_21 + var_250_22 then
				local var_250_23 = (arg_247_1.time_ - var_250_21) / var_250_22

				if arg_247_1.var_.actorSpriteComps1061 then
					for iter_250_6, iter_250_7 in pairs(arg_247_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_250_7 then
							local var_250_24 = Mathf.Lerp(iter_250_7.color.r, 0.5, var_250_23)

							iter_250_7.color = Color.New(var_250_24, var_250_24, var_250_24)
						end
					end
				end
			end

			if arg_247_1.time_ >= var_250_21 + var_250_22 and arg_247_1.time_ < var_250_21 + var_250_22 + arg_250_0 and arg_247_1.var_.actorSpriteComps1061 then
				local var_250_25 = 0.5

				for iter_250_8, iter_250_9 in pairs(arg_247_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_250_9 then
						iter_250_9.color = Color.New(var_250_25, var_250_25, var_250_25)
					end
				end

				arg_247_1.var_.actorSpriteComps1061 = nil
			end

			local var_250_26 = 0
			local var_250_27 = 0.175

			if var_250_26 < arg_247_1.time_ and arg_247_1.time_ <= var_250_26 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_28 = arg_247_1:FormatText(StoryNameCfg[605].name)

				arg_247_1.leftNameTxt_.text = var_250_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_29 = arg_247_1:GetWordFromCfg(410142061)
				local var_250_30 = arg_247_1:FormatText(var_250_29.content)

				arg_247_1.text_.text = var_250_30

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_31 = 7
				local var_250_32 = utf8.len(var_250_30)
				local var_250_33 = var_250_31 <= 0 and var_250_27 or var_250_27 * (var_250_32 / var_250_31)

				if var_250_33 > 0 and var_250_27 < var_250_33 then
					arg_247_1.talkMaxDuration = var_250_33

					if var_250_33 + var_250_26 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_33 + var_250_26
					end
				end

				arg_247_1.text_.text = var_250_30
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142061", "story_v_out_410142.awb") ~= 0 then
					local var_250_34 = manager.audio:GetVoiceLength("story_v_out_410142", "410142061", "story_v_out_410142.awb") / 1000

					if var_250_34 + var_250_26 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_34 + var_250_26
					end

					if var_250_29.prefab_name ~= "" and arg_247_1.actors_[var_250_29.prefab_name] ~= nil then
						local var_250_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_29.prefab_name].transform, "story_v_out_410142", "410142061", "story_v_out_410142.awb")

						arg_247_1:RecordAudio("410142061", var_250_35)
						arg_247_1:RecordAudio("410142061", var_250_35)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_410142", "410142061", "story_v_out_410142.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_410142", "410142061", "story_v_out_410142.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_36 = math.max(var_250_27, arg_247_1.talkMaxDuration)

			if var_250_26 <= arg_247_1.time_ and arg_247_1.time_ < var_250_26 + var_250_36 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_26) / var_250_36

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_26 + var_250_36 and arg_247_1.time_ < var_250_26 + var_250_36 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play410142062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 410142062
		arg_251_1.duration_ = 5

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play410142063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1056"].transform
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 then
				arg_251_1.var_.moveOldPos1056 = var_254_0.localPosition
				var_254_0.localScale = Vector3.New(1, 1, 1)

				arg_251_1:CheckSpriteTmpPos("1056", 2)

				local var_254_2 = var_254_0.childCount

				for iter_254_0 = 0, var_254_2 - 1 do
					local var_254_3 = var_254_0:GetChild(iter_254_0)

					if var_254_3.name == "" or not string.find(var_254_3.name, "split") then
						var_254_3.gameObject:SetActive(true)
					else
						var_254_3.gameObject:SetActive(false)
					end
				end
			end

			local var_254_4 = 0.001

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_4 then
				local var_254_5 = (arg_251_1.time_ - var_254_1) / var_254_4
				local var_254_6 = Vector3.New(-390, -350, -180)

				var_254_0.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1056, var_254_6, var_254_5)
			end

			if arg_251_1.time_ >= var_254_1 + var_254_4 and arg_251_1.time_ < var_254_1 + var_254_4 + arg_254_0 then
				var_254_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_254_7 = "10061"

			if arg_251_1.actors_[var_254_7] == nil then
				local var_254_8 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_254_7), arg_251_1.canvasGo_.transform)

				var_254_8.transform:SetSiblingIndex(1)

				var_254_8.name = var_254_7
				var_254_8.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_251_1.actors_[var_254_7] = var_254_8
			end

			local var_254_9 = arg_251_1.actors_["10061"].transform
			local var_254_10 = 0

			if var_254_10 < arg_251_1.time_ and arg_251_1.time_ <= var_254_10 + arg_254_0 then
				arg_251_1.var_.moveOldPos10061 = var_254_9.localPosition
				var_254_9.localScale = Vector3.New(1, 1, 1)

				arg_251_1:CheckSpriteTmpPos("10061", 4)

				local var_254_11 = var_254_9.childCount

				for iter_254_1 = 0, var_254_11 - 1 do
					local var_254_12 = var_254_9:GetChild(iter_254_1)

					if var_254_12.name == "" or not string.find(var_254_12.name, "split") then
						var_254_12.gameObject:SetActive(true)
					else
						var_254_12.gameObject:SetActive(false)
					end
				end
			end

			local var_254_13 = 0.001

			if var_254_10 <= arg_251_1.time_ and arg_251_1.time_ < var_254_10 + var_254_13 then
				local var_254_14 = (arg_251_1.time_ - var_254_10) / var_254_13
				local var_254_15 = Vector3.New(390, -517.5, -100)

				var_254_9.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos10061, var_254_15, var_254_14)
			end

			if arg_251_1.time_ >= var_254_10 + var_254_13 and arg_251_1.time_ < var_254_10 + var_254_13 + arg_254_0 then
				var_254_9.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_254_16 = arg_251_1.actors_["1056"]
			local var_254_17 = 0

			if var_254_17 < arg_251_1.time_ and arg_251_1.time_ <= var_254_17 + arg_254_0 and arg_251_1.var_.actorSpriteComps1056 == nil then
				arg_251_1.var_.actorSpriteComps1056 = var_254_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_18 = 0.034

			if var_254_17 <= arg_251_1.time_ and arg_251_1.time_ < var_254_17 + var_254_18 then
				local var_254_19 = (arg_251_1.time_ - var_254_17) / var_254_18

				if arg_251_1.var_.actorSpriteComps1056 then
					for iter_254_2, iter_254_3 in pairs(arg_251_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_254_3 then
							local var_254_20 = Mathf.Lerp(iter_254_3.color.r, 0.5, var_254_19)

							iter_254_3.color = Color.New(var_254_20, var_254_20, var_254_20)
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_17 + var_254_18 and arg_251_1.time_ < var_254_17 + var_254_18 + arg_254_0 and arg_251_1.var_.actorSpriteComps1056 then
				local var_254_21 = 0.5

				for iter_254_4, iter_254_5 in pairs(arg_251_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_254_5 then
						iter_254_5.color = Color.New(var_254_21, var_254_21, var_254_21)
					end
				end

				arg_251_1.var_.actorSpriteComps1056 = nil
			end

			local var_254_22 = arg_251_1.actors_["10061"]
			local var_254_23 = 0

			if var_254_23 < arg_251_1.time_ and arg_251_1.time_ <= var_254_23 + arg_254_0 and arg_251_1.var_.actorSpriteComps10061 == nil then
				arg_251_1.var_.actorSpriteComps10061 = var_254_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_24 = 0.034

			if var_254_23 <= arg_251_1.time_ and arg_251_1.time_ < var_254_23 + var_254_24 then
				local var_254_25 = (arg_251_1.time_ - var_254_23) / var_254_24

				if arg_251_1.var_.actorSpriteComps10061 then
					for iter_254_6, iter_254_7 in pairs(arg_251_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_254_7 then
							local var_254_26 = Mathf.Lerp(iter_254_7.color.r, 0.5, var_254_25)

							iter_254_7.color = Color.New(var_254_26, var_254_26, var_254_26)
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_23 + var_254_24 and arg_251_1.time_ < var_254_23 + var_254_24 + arg_254_0 and arg_251_1.var_.actorSpriteComps10061 then
				local var_254_27 = 0.5

				for iter_254_8, iter_254_9 in pairs(arg_251_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_254_9 then
						iter_254_9.color = Color.New(var_254_27, var_254_27, var_254_27)
					end
				end

				arg_251_1.var_.actorSpriteComps10061 = nil
			end

			local var_254_28 = 0
			local var_254_29 = 0.8

			if var_254_28 < arg_251_1.time_ and arg_251_1.time_ <= var_254_28 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, false)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_30 = arg_251_1:GetWordFromCfg(410142062)
				local var_254_31 = arg_251_1:FormatText(var_254_30.content)

				arg_251_1.text_.text = var_254_31

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_32 = 32
				local var_254_33 = utf8.len(var_254_31)
				local var_254_34 = var_254_32 <= 0 and var_254_29 or var_254_29 * (var_254_33 / var_254_32)

				if var_254_34 > 0 and var_254_29 < var_254_34 then
					arg_251_1.talkMaxDuration = var_254_34

					if var_254_34 + var_254_28 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_34 + var_254_28
					end
				end

				arg_251_1.text_.text = var_254_31
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)
				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_35 = math.max(var_254_29, arg_251_1.talkMaxDuration)

			if var_254_28 <= arg_251_1.time_ and arg_251_1.time_ < var_254_28 + var_254_35 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_28) / var_254_35

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_28 + var_254_35 and arg_251_1.time_ < var_254_28 + var_254_35 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play410142063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 410142063
		arg_255_1.duration_ = 5

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play410142064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 0
			local var_258_1 = 0.775

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, false)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_2 = arg_255_1:GetWordFromCfg(410142063)
				local var_258_3 = arg_255_1:FormatText(var_258_2.content)

				arg_255_1.text_.text = var_258_3

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_4 = 31
				local var_258_5 = utf8.len(var_258_3)
				local var_258_6 = var_258_4 <= 0 and var_258_1 or var_258_1 * (var_258_5 / var_258_4)

				if var_258_6 > 0 and var_258_1 < var_258_6 then
					arg_255_1.talkMaxDuration = var_258_6

					if var_258_6 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_6 + var_258_0
					end
				end

				arg_255_1.text_.text = var_258_3
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)
				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_7 = math.max(var_258_1, arg_255_1.talkMaxDuration)

			if var_258_0 <= arg_255_1.time_ and arg_255_1.time_ < var_258_0 + var_258_7 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_0) / var_258_7

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_0 + var_258_7 and arg_255_1.time_ < var_258_0 + var_258_7 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play410142064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 410142064
		arg_259_1.duration_ = 6.933

		local var_259_0 = {
			ja = 6.933,
			CriLanguages = 3.1,
			zh = 3.1
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
				arg_259_0:Play410142065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["10061"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos10061 = var_262_0.localPosition
				var_262_0.localScale = Vector3.New(1, 1, 1)

				arg_259_1:CheckSpriteTmpPos("10061", 4)

				local var_262_2 = var_262_0.childCount

				for iter_262_0 = 0, var_262_2 - 1 do
					local var_262_3 = var_262_0:GetChild(iter_262_0)

					if var_262_3.name == "split_5" or not string.find(var_262_3.name, "split") then
						var_262_3.gameObject:SetActive(true)
					else
						var_262_3.gameObject:SetActive(false)
					end
				end
			end

			local var_262_4 = 0.001

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_4 then
				local var_262_5 = (arg_259_1.time_ - var_262_1) / var_262_4
				local var_262_6 = Vector3.New(390, -517.5, -100)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos10061, var_262_6, var_262_5)
			end

			if arg_259_1.time_ >= var_262_1 + var_262_4 and arg_259_1.time_ < var_262_1 + var_262_4 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_262_7 = arg_259_1.actors_["10061"]
			local var_262_8 = 0

			if var_262_8 < arg_259_1.time_ and arg_259_1.time_ <= var_262_8 + arg_262_0 and arg_259_1.var_.actorSpriteComps10061 == nil then
				arg_259_1.var_.actorSpriteComps10061 = var_262_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_9 = 0.034

			if var_262_8 <= arg_259_1.time_ and arg_259_1.time_ < var_262_8 + var_262_9 then
				local var_262_10 = (arg_259_1.time_ - var_262_8) / var_262_9

				if arg_259_1.var_.actorSpriteComps10061 then
					for iter_262_1, iter_262_2 in pairs(arg_259_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_262_2 then
							local var_262_11 = Mathf.Lerp(iter_262_2.color.r, 1, var_262_10)

							iter_262_2.color = Color.New(var_262_11, var_262_11, var_262_11)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_8 + var_262_9 and arg_259_1.time_ < var_262_8 + var_262_9 + arg_262_0 and arg_259_1.var_.actorSpriteComps10061 then
				local var_262_12 = 1

				for iter_262_3, iter_262_4 in pairs(arg_259_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_262_4 then
						iter_262_4.color = Color.New(var_262_12, var_262_12, var_262_12)
					end
				end

				arg_259_1.var_.actorSpriteComps10061 = nil
			end

			local var_262_13 = 0
			local var_262_14 = 0.25

			if var_262_13 < arg_259_1.time_ and arg_259_1.time_ <= var_262_13 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_15 = arg_259_1:FormatText(StoryNameCfg[591].name)

				arg_259_1.leftNameTxt_.text = var_262_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_16 = arg_259_1:GetWordFromCfg(410142064)
				local var_262_17 = arg_259_1:FormatText(var_262_16.content)

				arg_259_1.text_.text = var_262_17

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_18 = 10
				local var_262_19 = utf8.len(var_262_17)
				local var_262_20 = var_262_18 <= 0 and var_262_14 or var_262_14 * (var_262_19 / var_262_18)

				if var_262_20 > 0 and var_262_14 < var_262_20 then
					arg_259_1.talkMaxDuration = var_262_20

					if var_262_20 + var_262_13 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_20 + var_262_13
					end
				end

				arg_259_1.text_.text = var_262_17
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142064", "story_v_out_410142.awb") ~= 0 then
					local var_262_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142064", "story_v_out_410142.awb") / 1000

					if var_262_21 + var_262_13 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_21 + var_262_13
					end

					if var_262_16.prefab_name ~= "" and arg_259_1.actors_[var_262_16.prefab_name] ~= nil then
						local var_262_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_16.prefab_name].transform, "story_v_out_410142", "410142064", "story_v_out_410142.awb")

						arg_259_1:RecordAudio("410142064", var_262_22)
						arg_259_1:RecordAudio("410142064", var_262_22)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_410142", "410142064", "story_v_out_410142.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_410142", "410142064", "story_v_out_410142.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_23 = math.max(var_262_14, arg_259_1.talkMaxDuration)

			if var_262_13 <= arg_259_1.time_ and arg_259_1.time_ < var_262_13 + var_262_23 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_13) / var_262_23

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_13 + var_262_23 and arg_259_1.time_ < var_262_13 + var_262_23 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play410142065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 410142065
		arg_263_1.duration_ = 7.933

		local var_263_0 = {
			ja = 7.8,
			CriLanguages = 7.933,
			zh = 7.933
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
				arg_263_0:Play410142066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1056"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos1056 = var_266_0.localPosition
				var_266_0.localScale = Vector3.New(1, 1, 1)

				arg_263_1:CheckSpriteTmpPos("1056", 2)

				local var_266_2 = var_266_0.childCount

				for iter_266_0 = 0, var_266_2 - 1 do
					local var_266_3 = var_266_0:GetChild(iter_266_0)

					if var_266_3.name == "split_1" or not string.find(var_266_3.name, "split") then
						var_266_3.gameObject:SetActive(true)
					else
						var_266_3.gameObject:SetActive(false)
					end
				end
			end

			local var_266_4 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_4 then
				local var_266_5 = (arg_263_1.time_ - var_266_1) / var_266_4
				local var_266_6 = Vector3.New(-390, -350, -180)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1056, var_266_6, var_266_5)
			end

			if arg_263_1.time_ >= var_266_1 + var_266_4 and arg_263_1.time_ < var_266_1 + var_266_4 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_266_7 = arg_263_1.actors_["1056"]
			local var_266_8 = 0

			if var_266_8 < arg_263_1.time_ and arg_263_1.time_ <= var_266_8 + arg_266_0 and arg_263_1.var_.actorSpriteComps1056 == nil then
				arg_263_1.var_.actorSpriteComps1056 = var_266_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_9 = 0.034

			if var_266_8 <= arg_263_1.time_ and arg_263_1.time_ < var_266_8 + var_266_9 then
				local var_266_10 = (arg_263_1.time_ - var_266_8) / var_266_9

				if arg_263_1.var_.actorSpriteComps1056 then
					for iter_266_1, iter_266_2 in pairs(arg_263_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_266_2 then
							local var_266_11 = Mathf.Lerp(iter_266_2.color.r, 1, var_266_10)

							iter_266_2.color = Color.New(var_266_11, var_266_11, var_266_11)
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_8 + var_266_9 and arg_263_1.time_ < var_266_8 + var_266_9 + arg_266_0 and arg_263_1.var_.actorSpriteComps1056 then
				local var_266_12 = 1

				for iter_266_3, iter_266_4 in pairs(arg_263_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_266_4 then
						iter_266_4.color = Color.New(var_266_12, var_266_12, var_266_12)
					end
				end

				arg_263_1.var_.actorSpriteComps1056 = nil
			end

			local var_266_13 = arg_263_1.actors_["10061"]
			local var_266_14 = 0

			if var_266_14 < arg_263_1.time_ and arg_263_1.time_ <= var_266_14 + arg_266_0 and arg_263_1.var_.actorSpriteComps10061 == nil then
				arg_263_1.var_.actorSpriteComps10061 = var_266_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_15 = 0.034

			if var_266_14 <= arg_263_1.time_ and arg_263_1.time_ < var_266_14 + var_266_15 then
				local var_266_16 = (arg_263_1.time_ - var_266_14) / var_266_15

				if arg_263_1.var_.actorSpriteComps10061 then
					for iter_266_5, iter_266_6 in pairs(arg_263_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_266_6 then
							local var_266_17 = Mathf.Lerp(iter_266_6.color.r, 0.5, var_266_16)

							iter_266_6.color = Color.New(var_266_17, var_266_17, var_266_17)
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_14 + var_266_15 and arg_263_1.time_ < var_266_14 + var_266_15 + arg_266_0 and arg_263_1.var_.actorSpriteComps10061 then
				local var_266_18 = 0.5

				for iter_266_7, iter_266_8 in pairs(arg_263_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_266_8 then
						iter_266_8.color = Color.New(var_266_18, var_266_18, var_266_18)
					end
				end

				arg_263_1.var_.actorSpriteComps10061 = nil
			end

			local var_266_19 = 0
			local var_266_20 = 1.05

			if var_266_19 < arg_263_1.time_ and arg_263_1.time_ <= var_266_19 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_21 = arg_263_1:FormatText(StoryNameCfg[605].name)

				arg_263_1.leftNameTxt_.text = var_266_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_22 = arg_263_1:GetWordFromCfg(410142065)
				local var_266_23 = arg_263_1:FormatText(var_266_22.content)

				arg_263_1.text_.text = var_266_23

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_24 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142065", "story_v_out_410142.awb") ~= 0 then
					local var_266_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142065", "story_v_out_410142.awb") / 1000

					if var_266_27 + var_266_19 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_27 + var_266_19
					end

					if var_266_22.prefab_name ~= "" and arg_263_1.actors_[var_266_22.prefab_name] ~= nil then
						local var_266_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_22.prefab_name].transform, "story_v_out_410142", "410142065", "story_v_out_410142.awb")

						arg_263_1:RecordAudio("410142065", var_266_28)
						arg_263_1:RecordAudio("410142065", var_266_28)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_410142", "410142065", "story_v_out_410142.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_410142", "410142065", "story_v_out_410142.awb")
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
	Play410142066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 410142066
		arg_267_1.duration_ = 9.966

		local var_267_0 = {
			ja = 9.966,
			CriLanguages = 6.3,
			zh = 6.3
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
				arg_267_0:Play410142067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["10061"].transform
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 then
				arg_267_1.var_.moveOldPos10061 = var_270_0.localPosition
				var_270_0.localScale = Vector3.New(1, 1, 1)

				arg_267_1:CheckSpriteTmpPos("10061", 4)

				local var_270_2 = var_270_0.childCount

				for iter_270_0 = 0, var_270_2 - 1 do
					local var_270_3 = var_270_0:GetChild(iter_270_0)

					if var_270_3.name == "" or not string.find(var_270_3.name, "split") then
						var_270_3.gameObject:SetActive(true)
					else
						var_270_3.gameObject:SetActive(false)
					end
				end
			end

			local var_270_4 = 0.001

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_4 then
				local var_270_5 = (arg_267_1.time_ - var_270_1) / var_270_4
				local var_270_6 = Vector3.New(390, -517.5, -100)

				var_270_0.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos10061, var_270_6, var_270_5)
			end

			if arg_267_1.time_ >= var_270_1 + var_270_4 and arg_267_1.time_ < var_270_1 + var_270_4 + arg_270_0 then
				var_270_0.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_270_7 = arg_267_1.actors_["1061"].transform
			local var_270_8 = 0

			if var_270_8 < arg_267_1.time_ and arg_267_1.time_ <= var_270_8 + arg_270_0 then
				arg_267_1.var_.moveOldPos1061 = var_270_7.localPosition
				var_270_7.localScale = Vector3.New(1, 1, 1)

				arg_267_1:CheckSpriteTmpPos("1061", 2)

				local var_270_9 = var_270_7.childCount

				for iter_270_1 = 0, var_270_9 - 1 do
					local var_270_10 = var_270_7:GetChild(iter_270_1)

					if var_270_10.name == "" or not string.find(var_270_10.name, "split") then
						var_270_10.gameObject:SetActive(true)
					else
						var_270_10.gameObject:SetActive(false)
					end
				end
			end

			local var_270_11 = 0.001

			if var_270_8 <= arg_267_1.time_ and arg_267_1.time_ < var_270_8 + var_270_11 then
				local var_270_12 = (arg_267_1.time_ - var_270_8) / var_270_11
				local var_270_13 = Vector3.New(-390, -490, 18)

				var_270_7.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1061, var_270_13, var_270_12)
			end

			if arg_267_1.time_ >= var_270_8 + var_270_11 and arg_267_1.time_ < var_270_8 + var_270_11 + arg_270_0 then
				var_270_7.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_270_14 = arg_267_1.actors_["1056"].transform
			local var_270_15 = 0

			if var_270_15 < arg_267_1.time_ and arg_267_1.time_ <= var_270_15 + arg_270_0 then
				arg_267_1.var_.moveOldPos1056 = var_270_14.localPosition
				var_270_14.localScale = Vector3.New(1, 1, 1)

				arg_267_1:CheckSpriteTmpPos("1056", 7)

				local var_270_16 = var_270_14.childCount

				for iter_270_2 = 0, var_270_16 - 1 do
					local var_270_17 = var_270_14:GetChild(iter_270_2)

					if var_270_17.name == "" or not string.find(var_270_17.name, "split") then
						var_270_17.gameObject:SetActive(true)
					else
						var_270_17.gameObject:SetActive(false)
					end
				end
			end

			local var_270_18 = 0.001

			if var_270_15 <= arg_267_1.time_ and arg_267_1.time_ < var_270_15 + var_270_18 then
				local var_270_19 = (arg_267_1.time_ - var_270_15) / var_270_18
				local var_270_20 = Vector3.New(0, -2000, -180)

				var_270_14.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1056, var_270_20, var_270_19)
			end

			if arg_267_1.time_ >= var_270_15 + var_270_18 and arg_267_1.time_ < var_270_15 + var_270_18 + arg_270_0 then
				var_270_14.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_270_21 = arg_267_1.actors_["10061"]
			local var_270_22 = 0

			if var_270_22 < arg_267_1.time_ and arg_267_1.time_ <= var_270_22 + arg_270_0 and arg_267_1.var_.actorSpriteComps10061 == nil then
				arg_267_1.var_.actorSpriteComps10061 = var_270_21:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_23 = 0.034

			if var_270_22 <= arg_267_1.time_ and arg_267_1.time_ < var_270_22 + var_270_23 then
				local var_270_24 = (arg_267_1.time_ - var_270_22) / var_270_23

				if arg_267_1.var_.actorSpriteComps10061 then
					for iter_270_3, iter_270_4 in pairs(arg_267_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_270_4 then
							local var_270_25 = Mathf.Lerp(iter_270_4.color.r, 1, var_270_24)

							iter_270_4.color = Color.New(var_270_25, var_270_25, var_270_25)
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_22 + var_270_23 and arg_267_1.time_ < var_270_22 + var_270_23 + arg_270_0 and arg_267_1.var_.actorSpriteComps10061 then
				local var_270_26 = 1

				for iter_270_5, iter_270_6 in pairs(arg_267_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_270_6 then
						iter_270_6.color = Color.New(var_270_26, var_270_26, var_270_26)
					end
				end

				arg_267_1.var_.actorSpriteComps10061 = nil
			end

			local var_270_27 = arg_267_1.actors_["1061"]
			local var_270_28 = 0

			if var_270_28 < arg_267_1.time_ and arg_267_1.time_ <= var_270_28 + arg_270_0 and arg_267_1.var_.actorSpriteComps1061 == nil then
				arg_267_1.var_.actorSpriteComps1061 = var_270_27:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_29 = 0.034

			if var_270_28 <= arg_267_1.time_ and arg_267_1.time_ < var_270_28 + var_270_29 then
				local var_270_30 = (arg_267_1.time_ - var_270_28) / var_270_29

				if arg_267_1.var_.actorSpriteComps1061 then
					for iter_270_7, iter_270_8 in pairs(arg_267_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_270_8 then
							local var_270_31 = Mathf.Lerp(iter_270_8.color.r, 0.5, var_270_30)

							iter_270_8.color = Color.New(var_270_31, var_270_31, var_270_31)
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_28 + var_270_29 and arg_267_1.time_ < var_270_28 + var_270_29 + arg_270_0 and arg_267_1.var_.actorSpriteComps1061 then
				local var_270_32 = 0.5

				for iter_270_9, iter_270_10 in pairs(arg_267_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_270_10 then
						iter_270_10.color = Color.New(var_270_32, var_270_32, var_270_32)
					end
				end

				arg_267_1.var_.actorSpriteComps1061 = nil
			end

			local var_270_33 = arg_267_1.actors_["1056"]
			local var_270_34 = 0

			if var_270_34 < arg_267_1.time_ and arg_267_1.time_ <= var_270_34 + arg_270_0 and arg_267_1.var_.actorSpriteComps1056 == nil then
				arg_267_1.var_.actorSpriteComps1056 = var_270_33:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_35 = 0.034

			if var_270_34 <= arg_267_1.time_ and arg_267_1.time_ < var_270_34 + var_270_35 then
				local var_270_36 = (arg_267_1.time_ - var_270_34) / var_270_35

				if arg_267_1.var_.actorSpriteComps1056 then
					for iter_270_11, iter_270_12 in pairs(arg_267_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_270_12 then
							local var_270_37 = Mathf.Lerp(iter_270_12.color.r, 0.5, var_270_36)

							iter_270_12.color = Color.New(var_270_37, var_270_37, var_270_37)
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_34 + var_270_35 and arg_267_1.time_ < var_270_34 + var_270_35 + arg_270_0 and arg_267_1.var_.actorSpriteComps1056 then
				local var_270_38 = 0.5

				for iter_270_13, iter_270_14 in pairs(arg_267_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_270_14 then
						iter_270_14.color = Color.New(var_270_38, var_270_38, var_270_38)
					end
				end

				arg_267_1.var_.actorSpriteComps1056 = nil
			end

			local var_270_39 = 0
			local var_270_40 = 0.525

			if var_270_39 < arg_267_1.time_ and arg_267_1.time_ <= var_270_39 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_41 = arg_267_1:FormatText(StoryNameCfg[591].name)

				arg_267_1.leftNameTxt_.text = var_270_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_42 = arg_267_1:GetWordFromCfg(410142066)
				local var_270_43 = arg_267_1:FormatText(var_270_42.content)

				arg_267_1.text_.text = var_270_43

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_44 = 21
				local var_270_45 = utf8.len(var_270_43)
				local var_270_46 = var_270_44 <= 0 and var_270_40 or var_270_40 * (var_270_45 / var_270_44)

				if var_270_46 > 0 and var_270_40 < var_270_46 then
					arg_267_1.talkMaxDuration = var_270_46

					if var_270_46 + var_270_39 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_46 + var_270_39
					end
				end

				arg_267_1.text_.text = var_270_43
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142066", "story_v_out_410142.awb") ~= 0 then
					local var_270_47 = manager.audio:GetVoiceLength("story_v_out_410142", "410142066", "story_v_out_410142.awb") / 1000

					if var_270_47 + var_270_39 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_47 + var_270_39
					end

					if var_270_42.prefab_name ~= "" and arg_267_1.actors_[var_270_42.prefab_name] ~= nil then
						local var_270_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_42.prefab_name].transform, "story_v_out_410142", "410142066", "story_v_out_410142.awb")

						arg_267_1:RecordAudio("410142066", var_270_48)
						arg_267_1:RecordAudio("410142066", var_270_48)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_410142", "410142066", "story_v_out_410142.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_410142", "410142066", "story_v_out_410142.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_49 = math.max(var_270_40, arg_267_1.talkMaxDuration)

			if var_270_39 <= arg_267_1.time_ and arg_267_1.time_ < var_270_39 + var_270_49 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_39) / var_270_49

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_39 + var_270_49 and arg_267_1.time_ < var_270_39 + var_270_49 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play410142067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 410142067
		arg_271_1.duration_ = 8.066

		local var_271_0 = {
			ja = 8.066,
			CriLanguages = 2.266,
			zh = 2.266
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
				arg_271_0:Play410142068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1061"].transform
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1.var_.moveOldPos1061 = var_274_0.localPosition
				var_274_0.localScale = Vector3.New(1, 1, 1)

				arg_271_1:CheckSpriteTmpPos("1061", 2)

				local var_274_2 = var_274_0.childCount

				for iter_274_0 = 0, var_274_2 - 1 do
					local var_274_3 = var_274_0:GetChild(iter_274_0)

					if var_274_3.name == "split_5" or not string.find(var_274_3.name, "split") then
						var_274_3.gameObject:SetActive(true)
					else
						var_274_3.gameObject:SetActive(false)
					end
				end
			end

			local var_274_4 = 0.001

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_4 then
				local var_274_5 = (arg_271_1.time_ - var_274_1) / var_274_4
				local var_274_6 = Vector3.New(-390, -490, 18)

				var_274_0.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos1061, var_274_6, var_274_5)
			end

			if arg_271_1.time_ >= var_274_1 + var_274_4 and arg_271_1.time_ < var_274_1 + var_274_4 + arg_274_0 then
				var_274_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_274_7 = arg_271_1.actors_["1061"]
			local var_274_8 = 0

			if var_274_8 < arg_271_1.time_ and arg_271_1.time_ <= var_274_8 + arg_274_0 and arg_271_1.var_.actorSpriteComps1061 == nil then
				arg_271_1.var_.actorSpriteComps1061 = var_274_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_274_9 = 0.034

			if var_274_8 <= arg_271_1.time_ and arg_271_1.time_ < var_274_8 + var_274_9 then
				local var_274_10 = (arg_271_1.time_ - var_274_8) / var_274_9

				if arg_271_1.var_.actorSpriteComps1061 then
					for iter_274_1, iter_274_2 in pairs(arg_271_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_274_2 then
							local var_274_11 = Mathf.Lerp(iter_274_2.color.r, 1, var_274_10)

							iter_274_2.color = Color.New(var_274_11, var_274_11, var_274_11)
						end
					end
				end
			end

			if arg_271_1.time_ >= var_274_8 + var_274_9 and arg_271_1.time_ < var_274_8 + var_274_9 + arg_274_0 and arg_271_1.var_.actorSpriteComps1061 then
				local var_274_12 = 1

				for iter_274_3, iter_274_4 in pairs(arg_271_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_274_4 then
						iter_274_4.color = Color.New(var_274_12, var_274_12, var_274_12)
					end
				end

				arg_271_1.var_.actorSpriteComps1061 = nil
			end

			local var_274_13 = arg_271_1.actors_["10061"]
			local var_274_14 = 0

			if var_274_14 < arg_271_1.time_ and arg_271_1.time_ <= var_274_14 + arg_274_0 and arg_271_1.var_.actorSpriteComps10061 == nil then
				arg_271_1.var_.actorSpriteComps10061 = var_274_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_274_15 = 0.034

			if var_274_14 <= arg_271_1.time_ and arg_271_1.time_ < var_274_14 + var_274_15 then
				local var_274_16 = (arg_271_1.time_ - var_274_14) / var_274_15

				if arg_271_1.var_.actorSpriteComps10061 then
					for iter_274_5, iter_274_6 in pairs(arg_271_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_274_6 then
							local var_274_17 = Mathf.Lerp(iter_274_6.color.r, 0.5, var_274_16)

							iter_274_6.color = Color.New(var_274_17, var_274_17, var_274_17)
						end
					end
				end
			end

			if arg_271_1.time_ >= var_274_14 + var_274_15 and arg_271_1.time_ < var_274_14 + var_274_15 + arg_274_0 and arg_271_1.var_.actorSpriteComps10061 then
				local var_274_18 = 0.5

				for iter_274_7, iter_274_8 in pairs(arg_271_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_274_8 then
						iter_274_8.color = Color.New(var_274_18, var_274_18, var_274_18)
					end
				end

				arg_271_1.var_.actorSpriteComps10061 = nil
			end

			local var_274_19 = 0
			local var_274_20 = 0.175

			if var_274_19 < arg_271_1.time_ and arg_271_1.time_ <= var_274_19 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_21 = arg_271_1:FormatText(StoryNameCfg[612].name)

				arg_271_1.leftNameTxt_.text = var_274_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_22 = arg_271_1:GetWordFromCfg(410142067)
				local var_274_23 = arg_271_1:FormatText(var_274_22.content)

				arg_271_1.text_.text = var_274_23

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_24 = 7
				local var_274_25 = utf8.len(var_274_23)
				local var_274_26 = var_274_24 <= 0 and var_274_20 or var_274_20 * (var_274_25 / var_274_24)

				if var_274_26 > 0 and var_274_20 < var_274_26 then
					arg_271_1.talkMaxDuration = var_274_26

					if var_274_26 + var_274_19 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_26 + var_274_19
					end
				end

				arg_271_1.text_.text = var_274_23
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142067", "story_v_out_410142.awb") ~= 0 then
					local var_274_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142067", "story_v_out_410142.awb") / 1000

					if var_274_27 + var_274_19 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_27 + var_274_19
					end

					if var_274_22.prefab_name ~= "" and arg_271_1.actors_[var_274_22.prefab_name] ~= nil then
						local var_274_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_22.prefab_name].transform, "story_v_out_410142", "410142067", "story_v_out_410142.awb")

						arg_271_1:RecordAudio("410142067", var_274_28)
						arg_271_1:RecordAudio("410142067", var_274_28)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_410142", "410142067", "story_v_out_410142.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_410142", "410142067", "story_v_out_410142.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_29 = math.max(var_274_20, arg_271_1.talkMaxDuration)

			if var_274_19 <= arg_271_1.time_ and arg_271_1.time_ < var_274_19 + var_274_29 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_19) / var_274_29

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_19 + var_274_29 and arg_271_1.time_ < var_274_19 + var_274_29 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play410142068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 410142068
		arg_275_1.duration_ = 13.433

		local var_275_0 = {
			ja = 13.433,
			CriLanguages = 7.866,
			zh = 7.866
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
				arg_275_0:Play410142069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1056"].transform
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 then
				arg_275_1.var_.moveOldPos1056 = var_278_0.localPosition
				var_278_0.localScale = Vector3.New(1, 1, 1)

				arg_275_1:CheckSpriteTmpPos("1056", 2)

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
				local var_278_6 = Vector3.New(-390, -350, -180)

				var_278_0.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1056, var_278_6, var_278_5)
			end

			if arg_275_1.time_ >= var_278_1 + var_278_4 and arg_275_1.time_ < var_278_1 + var_278_4 + arg_278_0 then
				var_278_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_278_7 = arg_275_1.actors_["1061"].transform
			local var_278_8 = 0

			if var_278_8 < arg_275_1.time_ and arg_275_1.time_ <= var_278_8 + arg_278_0 then
				arg_275_1.var_.moveOldPos1061 = var_278_7.localPosition
				var_278_7.localScale = Vector3.New(1, 1, 1)

				arg_275_1:CheckSpriteTmpPos("1061", 7)

				local var_278_9 = var_278_7.childCount

				for iter_278_1 = 0, var_278_9 - 1 do
					local var_278_10 = var_278_7:GetChild(iter_278_1)

					if var_278_10.name == "" or not string.find(var_278_10.name, "split") then
						var_278_10.gameObject:SetActive(true)
					else
						var_278_10.gameObject:SetActive(false)
					end
				end
			end

			local var_278_11 = 0.001

			if var_278_8 <= arg_275_1.time_ and arg_275_1.time_ < var_278_8 + var_278_11 then
				local var_278_12 = (arg_275_1.time_ - var_278_8) / var_278_11
				local var_278_13 = Vector3.New(0, -2000, 18)

				var_278_7.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1061, var_278_13, var_278_12)
			end

			if arg_275_1.time_ >= var_278_8 + var_278_11 and arg_275_1.time_ < var_278_8 + var_278_11 + arg_278_0 then
				var_278_7.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_278_14 = arg_275_1.actors_["1056"]
			local var_278_15 = 0

			if var_278_15 < arg_275_1.time_ and arg_275_1.time_ <= var_278_15 + arg_278_0 and arg_275_1.var_.actorSpriteComps1056 == nil then
				arg_275_1.var_.actorSpriteComps1056 = var_278_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_278_16 = 0.034

			if var_278_15 <= arg_275_1.time_ and arg_275_1.time_ < var_278_15 + var_278_16 then
				local var_278_17 = (arg_275_1.time_ - var_278_15) / var_278_16

				if arg_275_1.var_.actorSpriteComps1056 then
					for iter_278_2, iter_278_3 in pairs(arg_275_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_278_3 then
							local var_278_18 = Mathf.Lerp(iter_278_3.color.r, 1, var_278_17)

							iter_278_3.color = Color.New(var_278_18, var_278_18, var_278_18)
						end
					end
				end
			end

			if arg_275_1.time_ >= var_278_15 + var_278_16 and arg_275_1.time_ < var_278_15 + var_278_16 + arg_278_0 and arg_275_1.var_.actorSpriteComps1056 then
				local var_278_19 = 1

				for iter_278_4, iter_278_5 in pairs(arg_275_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_278_5 then
						iter_278_5.color = Color.New(var_278_19, var_278_19, var_278_19)
					end
				end

				arg_275_1.var_.actorSpriteComps1056 = nil
			end

			local var_278_20 = arg_275_1.actors_["1061"]
			local var_278_21 = 0

			if var_278_21 < arg_275_1.time_ and arg_275_1.time_ <= var_278_21 + arg_278_0 and arg_275_1.var_.actorSpriteComps1061 == nil then
				arg_275_1.var_.actorSpriteComps1061 = var_278_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_278_22 = 0.034

			if var_278_21 <= arg_275_1.time_ and arg_275_1.time_ < var_278_21 + var_278_22 then
				local var_278_23 = (arg_275_1.time_ - var_278_21) / var_278_22

				if arg_275_1.var_.actorSpriteComps1061 then
					for iter_278_6, iter_278_7 in pairs(arg_275_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_278_7 then
							local var_278_24 = Mathf.Lerp(iter_278_7.color.r, 0.5, var_278_23)

							iter_278_7.color = Color.New(var_278_24, var_278_24, var_278_24)
						end
					end
				end
			end

			if arg_275_1.time_ >= var_278_21 + var_278_22 and arg_275_1.time_ < var_278_21 + var_278_22 + arg_278_0 and arg_275_1.var_.actorSpriteComps1061 then
				local var_278_25 = 0.5

				for iter_278_8, iter_278_9 in pairs(arg_275_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_278_9 then
						iter_278_9.color = Color.New(var_278_25, var_278_25, var_278_25)
					end
				end

				arg_275_1.var_.actorSpriteComps1061 = nil
			end

			local var_278_26 = 0
			local var_278_27 = 1.075

			if var_278_26 < arg_275_1.time_ and arg_275_1.time_ <= var_278_26 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_28 = arg_275_1:FormatText(StoryNameCfg[605].name)

				arg_275_1.leftNameTxt_.text = var_278_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_29 = arg_275_1:GetWordFromCfg(410142068)
				local var_278_30 = arg_275_1:FormatText(var_278_29.content)

				arg_275_1.text_.text = var_278_30

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_31 = 43
				local var_278_32 = utf8.len(var_278_30)
				local var_278_33 = var_278_31 <= 0 and var_278_27 or var_278_27 * (var_278_32 / var_278_31)

				if var_278_33 > 0 and var_278_27 < var_278_33 then
					arg_275_1.talkMaxDuration = var_278_33

					if var_278_33 + var_278_26 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_33 + var_278_26
					end
				end

				arg_275_1.text_.text = var_278_30
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142068", "story_v_out_410142.awb") ~= 0 then
					local var_278_34 = manager.audio:GetVoiceLength("story_v_out_410142", "410142068", "story_v_out_410142.awb") / 1000

					if var_278_34 + var_278_26 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_34 + var_278_26
					end

					if var_278_29.prefab_name ~= "" and arg_275_1.actors_[var_278_29.prefab_name] ~= nil then
						local var_278_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_29.prefab_name].transform, "story_v_out_410142", "410142068", "story_v_out_410142.awb")

						arg_275_1:RecordAudio("410142068", var_278_35)
						arg_275_1:RecordAudio("410142068", var_278_35)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_410142", "410142068", "story_v_out_410142.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_410142", "410142068", "story_v_out_410142.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_36 = math.max(var_278_27, arg_275_1.talkMaxDuration)

			if var_278_26 <= arg_275_1.time_ and arg_275_1.time_ < var_278_26 + var_278_36 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_26) / var_278_36

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_26 + var_278_36 and arg_275_1.time_ < var_278_26 + var_278_36 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play410142069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 410142069
		arg_279_1.duration_ = 6.333

		local var_279_0 = {
			ja = 6.333,
			CriLanguages = 4.233,
			zh = 4.233
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
				arg_279_0:Play410142070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1056"].transform
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 then
				arg_279_1.var_.moveOldPos1056 = var_282_0.localPosition
				var_282_0.localScale = Vector3.New(1, 1, 1)

				arg_279_1:CheckSpriteTmpPos("1056", 2)

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
				local var_282_6 = Vector3.New(-390, -350, -180)

				var_282_0.localPosition = Vector3.Lerp(arg_279_1.var_.moveOldPos1056, var_282_6, var_282_5)
			end

			if arg_279_1.time_ >= var_282_1 + var_282_4 and arg_279_1.time_ < var_282_1 + var_282_4 + arg_282_0 then
				var_282_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_282_7 = arg_279_1.actors_["1056"]
			local var_282_8 = 0

			if var_282_8 < arg_279_1.time_ and arg_279_1.time_ <= var_282_8 + arg_282_0 and arg_279_1.var_.actorSpriteComps1056 == nil then
				arg_279_1.var_.actorSpriteComps1056 = var_282_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_282_9 = 0.034

			if var_282_8 <= arg_279_1.time_ and arg_279_1.time_ < var_282_8 + var_282_9 then
				local var_282_10 = (arg_279_1.time_ - var_282_8) / var_282_9

				if arg_279_1.var_.actorSpriteComps1056 then
					for iter_282_1, iter_282_2 in pairs(arg_279_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_282_2 then
							local var_282_11 = Mathf.Lerp(iter_282_2.color.r, 1, var_282_10)

							iter_282_2.color = Color.New(var_282_11, var_282_11, var_282_11)
						end
					end
				end
			end

			if arg_279_1.time_ >= var_282_8 + var_282_9 and arg_279_1.time_ < var_282_8 + var_282_9 + arg_282_0 and arg_279_1.var_.actorSpriteComps1056 then
				local var_282_12 = 1

				for iter_282_3, iter_282_4 in pairs(arg_279_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_282_4 then
						iter_282_4.color = Color.New(var_282_12, var_282_12, var_282_12)
					end
				end

				arg_279_1.var_.actorSpriteComps1056 = nil
			end

			local var_282_13 = 0
			local var_282_14 = 0.525

			if var_282_13 < arg_279_1.time_ and arg_279_1.time_ <= var_282_13 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_15 = arg_279_1:FormatText(StoryNameCfg[605].name)

				arg_279_1.leftNameTxt_.text = var_282_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_16 = arg_279_1:GetWordFromCfg(410142069)
				local var_282_17 = arg_279_1:FormatText(var_282_16.content)

				arg_279_1.text_.text = var_282_17

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_18 = 21
				local var_282_19 = utf8.len(var_282_17)
				local var_282_20 = var_282_18 <= 0 and var_282_14 or var_282_14 * (var_282_19 / var_282_18)

				if var_282_20 > 0 and var_282_14 < var_282_20 then
					arg_279_1.talkMaxDuration = var_282_20

					if var_282_20 + var_282_13 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_20 + var_282_13
					end
				end

				arg_279_1.text_.text = var_282_17
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142069", "story_v_out_410142.awb") ~= 0 then
					local var_282_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142069", "story_v_out_410142.awb") / 1000

					if var_282_21 + var_282_13 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_21 + var_282_13
					end

					if var_282_16.prefab_name ~= "" and arg_279_1.actors_[var_282_16.prefab_name] ~= nil then
						local var_282_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_16.prefab_name].transform, "story_v_out_410142", "410142069", "story_v_out_410142.awb")

						arg_279_1:RecordAudio("410142069", var_282_22)
						arg_279_1:RecordAudio("410142069", var_282_22)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_410142", "410142069", "story_v_out_410142.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_410142", "410142069", "story_v_out_410142.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_23 = math.max(var_282_14, arg_279_1.talkMaxDuration)

			if var_282_13 <= arg_279_1.time_ and arg_279_1.time_ < var_282_13 + var_282_23 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_13) / var_282_23

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_13 + var_282_23 and arg_279_1.time_ < var_282_13 + var_282_23 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play410142070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 410142070
		arg_283_1.duration_ = 9.2

		local var_283_0 = {
			ja = 9.2,
			CriLanguages = 8.3,
			zh = 7.533
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
				arg_283_0:Play410142071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["10061"].transform
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 then
				arg_283_1.var_.moveOldPos10061 = var_286_0.localPosition
				var_286_0.localScale = Vector3.New(1, 1, 1)

				arg_283_1:CheckSpriteTmpPos("10061", 4)

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
				local var_286_6 = Vector3.New(390, -517.5, -100)

				var_286_0.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos10061, var_286_6, var_286_5)
			end

			if arg_283_1.time_ >= var_286_1 + var_286_4 and arg_283_1.time_ < var_286_1 + var_286_4 + arg_286_0 then
				var_286_0.localPosition = Vector3.New(390, -517.5, -100)
			end

			local var_286_7 = arg_283_1.actors_["10061"]
			local var_286_8 = 0

			if var_286_8 < arg_283_1.time_ and arg_283_1.time_ <= var_286_8 + arg_286_0 and arg_283_1.var_.actorSpriteComps10061 == nil then
				arg_283_1.var_.actorSpriteComps10061 = var_286_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_286_9 = 0.034

			if var_286_8 <= arg_283_1.time_ and arg_283_1.time_ < var_286_8 + var_286_9 then
				local var_286_10 = (arg_283_1.time_ - var_286_8) / var_286_9

				if arg_283_1.var_.actorSpriteComps10061 then
					for iter_286_1, iter_286_2 in pairs(arg_283_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_286_2 then
							local var_286_11 = Mathf.Lerp(iter_286_2.color.r, 1, var_286_10)

							iter_286_2.color = Color.New(var_286_11, var_286_11, var_286_11)
						end
					end
				end
			end

			if arg_283_1.time_ >= var_286_8 + var_286_9 and arg_283_1.time_ < var_286_8 + var_286_9 + arg_286_0 and arg_283_1.var_.actorSpriteComps10061 then
				local var_286_12 = 1

				for iter_286_3, iter_286_4 in pairs(arg_283_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_286_4 then
						iter_286_4.color = Color.New(var_286_12, var_286_12, var_286_12)
					end
				end

				arg_283_1.var_.actorSpriteComps10061 = nil
			end

			local var_286_13 = arg_283_1.actors_["1056"]
			local var_286_14 = 0

			if var_286_14 < arg_283_1.time_ and arg_283_1.time_ <= var_286_14 + arg_286_0 and arg_283_1.var_.actorSpriteComps1056 == nil then
				arg_283_1.var_.actorSpriteComps1056 = var_286_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_286_15 = 0.034

			if var_286_14 <= arg_283_1.time_ and arg_283_1.time_ < var_286_14 + var_286_15 then
				local var_286_16 = (arg_283_1.time_ - var_286_14) / var_286_15

				if arg_283_1.var_.actorSpriteComps1056 then
					for iter_286_5, iter_286_6 in pairs(arg_283_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_286_6 then
							local var_286_17 = Mathf.Lerp(iter_286_6.color.r, 0.5, var_286_16)

							iter_286_6.color = Color.New(var_286_17, var_286_17, var_286_17)
						end
					end
				end
			end

			if arg_283_1.time_ >= var_286_14 + var_286_15 and arg_283_1.time_ < var_286_14 + var_286_15 + arg_286_0 and arg_283_1.var_.actorSpriteComps1056 then
				local var_286_18 = 0.5

				for iter_286_7, iter_286_8 in pairs(arg_283_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_286_8 then
						iter_286_8.color = Color.New(var_286_18, var_286_18, var_286_18)
					end
				end

				arg_283_1.var_.actorSpriteComps1056 = nil
			end

			local var_286_19 = 0
			local var_286_20 = 0.975

			if var_286_19 < arg_283_1.time_ and arg_283_1.time_ <= var_286_19 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_21 = arg_283_1:FormatText(StoryNameCfg[591].name)

				arg_283_1.leftNameTxt_.text = var_286_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_22 = arg_283_1:GetWordFromCfg(410142070)
				local var_286_23 = arg_283_1:FormatText(var_286_22.content)

				arg_283_1.text_.text = var_286_23

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_24 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142070", "story_v_out_410142.awb") ~= 0 then
					local var_286_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142070", "story_v_out_410142.awb") / 1000

					if var_286_27 + var_286_19 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_27 + var_286_19
					end

					if var_286_22.prefab_name ~= "" and arg_283_1.actors_[var_286_22.prefab_name] ~= nil then
						local var_286_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_22.prefab_name].transform, "story_v_out_410142", "410142070", "story_v_out_410142.awb")

						arg_283_1:RecordAudio("410142070", var_286_28)
						arg_283_1:RecordAudio("410142070", var_286_28)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_410142", "410142070", "story_v_out_410142.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_410142", "410142070", "story_v_out_410142.awb")
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
	Play410142071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 410142071
		arg_287_1.duration_ = 1.333

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play410142072(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["1056"].transform
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 then
				arg_287_1.var_.moveOldPos1056 = var_290_0.localPosition
				var_290_0.localScale = Vector3.New(1, 1, 1)

				arg_287_1:CheckSpriteTmpPos("1056", 2)

				local var_290_2 = var_290_0.childCount

				for iter_290_0 = 0, var_290_2 - 1 do
					local var_290_3 = var_290_0:GetChild(iter_290_0)

					if var_290_3.name == "split_3" or not string.find(var_290_3.name, "split") then
						var_290_3.gameObject:SetActive(true)
					else
						var_290_3.gameObject:SetActive(false)
					end
				end
			end

			local var_290_4 = 0.001

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_4 then
				local var_290_5 = (arg_287_1.time_ - var_290_1) / var_290_4
				local var_290_6 = Vector3.New(-390, -350, -180)

				var_290_0.localPosition = Vector3.Lerp(arg_287_1.var_.moveOldPos1056, var_290_6, var_290_5)
			end

			if arg_287_1.time_ >= var_290_1 + var_290_4 and arg_287_1.time_ < var_290_1 + var_290_4 + arg_290_0 then
				var_290_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_290_7 = arg_287_1.actors_["1056"]
			local var_290_8 = 0

			if var_290_8 < arg_287_1.time_ and arg_287_1.time_ <= var_290_8 + arg_290_0 and arg_287_1.var_.actorSpriteComps1056 == nil then
				arg_287_1.var_.actorSpriteComps1056 = var_290_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_290_9 = 0.034

			if var_290_8 <= arg_287_1.time_ and arg_287_1.time_ < var_290_8 + var_290_9 then
				local var_290_10 = (arg_287_1.time_ - var_290_8) / var_290_9

				if arg_287_1.var_.actorSpriteComps1056 then
					for iter_290_1, iter_290_2 in pairs(arg_287_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_290_2 then
							local var_290_11 = Mathf.Lerp(iter_290_2.color.r, 1, var_290_10)

							iter_290_2.color = Color.New(var_290_11, var_290_11, var_290_11)
						end
					end
				end
			end

			if arg_287_1.time_ >= var_290_8 + var_290_9 and arg_287_1.time_ < var_290_8 + var_290_9 + arg_290_0 and arg_287_1.var_.actorSpriteComps1056 then
				local var_290_12 = 1

				for iter_290_3, iter_290_4 in pairs(arg_287_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_290_4 then
						iter_290_4.color = Color.New(var_290_12, var_290_12, var_290_12)
					end
				end

				arg_287_1.var_.actorSpriteComps1056 = nil
			end

			local var_290_13 = arg_287_1.actors_["10061"]
			local var_290_14 = 0

			if var_290_14 < arg_287_1.time_ and arg_287_1.time_ <= var_290_14 + arg_290_0 and arg_287_1.var_.actorSpriteComps10061 == nil then
				arg_287_1.var_.actorSpriteComps10061 = var_290_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_290_15 = 0.034

			if var_290_14 <= arg_287_1.time_ and arg_287_1.time_ < var_290_14 + var_290_15 then
				local var_290_16 = (arg_287_1.time_ - var_290_14) / var_290_15

				if arg_287_1.var_.actorSpriteComps10061 then
					for iter_290_5, iter_290_6 in pairs(arg_287_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_290_6 then
							local var_290_17 = Mathf.Lerp(iter_290_6.color.r, 0.5, var_290_16)

							iter_290_6.color = Color.New(var_290_17, var_290_17, var_290_17)
						end
					end
				end
			end

			if arg_287_1.time_ >= var_290_14 + var_290_15 and arg_287_1.time_ < var_290_14 + var_290_15 + arg_290_0 and arg_287_1.var_.actorSpriteComps10061 then
				local var_290_18 = 0.5

				for iter_290_7, iter_290_8 in pairs(arg_287_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_290_8 then
						iter_290_8.color = Color.New(var_290_18, var_290_18, var_290_18)
					end
				end

				arg_287_1.var_.actorSpriteComps10061 = nil
			end

			local var_290_19 = 0
			local var_290_20 = 0.075

			if var_290_19 < arg_287_1.time_ and arg_287_1.time_ <= var_290_19 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_21 = arg_287_1:FormatText(StoryNameCfg[605].name)

				arg_287_1.leftNameTxt_.text = var_290_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_22 = arg_287_1:GetWordFromCfg(410142071)
				local var_290_23 = arg_287_1:FormatText(var_290_22.content)

				arg_287_1.text_.text = var_290_23

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_24 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142071", "story_v_out_410142.awb") ~= 0 then
					local var_290_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142071", "story_v_out_410142.awb") / 1000

					if var_290_27 + var_290_19 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_27 + var_290_19
					end

					if var_290_22.prefab_name ~= "" and arg_287_1.actors_[var_290_22.prefab_name] ~= nil then
						local var_290_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_22.prefab_name].transform, "story_v_out_410142", "410142071", "story_v_out_410142.awb")

						arg_287_1:RecordAudio("410142071", var_290_28)
						arg_287_1:RecordAudio("410142071", var_290_28)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_410142", "410142071", "story_v_out_410142.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_410142", "410142071", "story_v_out_410142.awb")
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
	Play410142072 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 410142072
		arg_291_1.duration_ = 10.9

		local var_291_0 = {
			ja = 10.9,
			CriLanguages = 6.733,
			zh = 6.733
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
				arg_291_0:Play410142073(arg_291_1)
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

			local var_294_13 = arg_291_1.actors_["1056"]
			local var_294_14 = 0

			if var_294_14 < arg_291_1.time_ and arg_291_1.time_ <= var_294_14 + arg_294_0 and arg_291_1.var_.actorSpriteComps1056 == nil then
				arg_291_1.var_.actorSpriteComps1056 = var_294_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_294_15 = 0.034

			if var_294_14 <= arg_291_1.time_ and arg_291_1.time_ < var_294_14 + var_294_15 then
				local var_294_16 = (arg_291_1.time_ - var_294_14) / var_294_15

				if arg_291_1.var_.actorSpriteComps1056 then
					for iter_294_5, iter_294_6 in pairs(arg_291_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_294_6 then
							local var_294_17 = Mathf.Lerp(iter_294_6.color.r, 0.5, var_294_16)

							iter_294_6.color = Color.New(var_294_17, var_294_17, var_294_17)
						end
					end
				end
			end

			if arg_291_1.time_ >= var_294_14 + var_294_15 and arg_291_1.time_ < var_294_14 + var_294_15 + arg_294_0 and arg_291_1.var_.actorSpriteComps1056 then
				local var_294_18 = 0.5

				for iter_294_7, iter_294_8 in pairs(arg_291_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_294_8 then
						iter_294_8.color = Color.New(var_294_18, var_294_18, var_294_18)
					end
				end

				arg_291_1.var_.actorSpriteComps1056 = nil
			end

			local var_294_19 = 0
			local var_294_20 = 0.7

			if var_294_19 < arg_291_1.time_ and arg_291_1.time_ <= var_294_19 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_21 = arg_291_1:FormatText(StoryNameCfg[591].name)

				arg_291_1.leftNameTxt_.text = var_294_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_22 = arg_291_1:GetWordFromCfg(410142072)
				local var_294_23 = arg_291_1:FormatText(var_294_22.content)

				arg_291_1.text_.text = var_294_23

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_24 = 28
				local var_294_25 = utf8.len(var_294_23)
				local var_294_26 = var_294_24 <= 0 and var_294_20 or var_294_20 * (var_294_25 / var_294_24)

				if var_294_26 > 0 and var_294_20 < var_294_26 then
					arg_291_1.talkMaxDuration = var_294_26

					if var_294_26 + var_294_19 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_26 + var_294_19
					end
				end

				arg_291_1.text_.text = var_294_23
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142072", "story_v_out_410142.awb") ~= 0 then
					local var_294_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142072", "story_v_out_410142.awb") / 1000

					if var_294_27 + var_294_19 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_27 + var_294_19
					end

					if var_294_22.prefab_name ~= "" and arg_291_1.actors_[var_294_22.prefab_name] ~= nil then
						local var_294_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_22.prefab_name].transform, "story_v_out_410142", "410142072", "story_v_out_410142.awb")

						arg_291_1:RecordAudio("410142072", var_294_28)
						arg_291_1:RecordAudio("410142072", var_294_28)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_410142", "410142072", "story_v_out_410142.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_410142", "410142072", "story_v_out_410142.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_29 = math.max(var_294_20, arg_291_1.talkMaxDuration)

			if var_294_19 <= arg_291_1.time_ and arg_291_1.time_ < var_294_19 + var_294_29 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_19) / var_294_29

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_19 + var_294_29 and arg_291_1.time_ < var_294_19 + var_294_29 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play410142073 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 410142073
		arg_295_1.duration_ = 5

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play410142074(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["10061"]
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 and arg_295_1.var_.actorSpriteComps10061 == nil then
				arg_295_1.var_.actorSpriteComps10061 = var_298_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_298_2 = 0.034

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2

				if arg_295_1.var_.actorSpriteComps10061 then
					for iter_298_0, iter_298_1 in pairs(arg_295_1.var_.actorSpriteComps10061:ToTable()) do
						if iter_298_1 then
							local var_298_4 = Mathf.Lerp(iter_298_1.color.r, 0.5, var_298_3)

							iter_298_1.color = Color.New(var_298_4, var_298_4, var_298_4)
						end
					end
				end
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 and arg_295_1.var_.actorSpriteComps10061 then
				local var_298_5 = 0.5

				for iter_298_2, iter_298_3 in pairs(arg_295_1.var_.actorSpriteComps10061:ToTable()) do
					if iter_298_3 then
						iter_298_3.color = Color.New(var_298_5, var_298_5, var_298_5)
					end
				end

				arg_295_1.var_.actorSpriteComps10061 = nil
			end

			local var_298_6 = 0
			local var_298_7 = 0.725

			if var_298_6 < arg_295_1.time_ and arg_295_1.time_ <= var_298_6 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, false)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_8 = arg_295_1:GetWordFromCfg(410142073)
				local var_298_9 = arg_295_1:FormatText(var_298_8.content)

				arg_295_1.text_.text = var_298_9

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_10 = 29
				local var_298_11 = utf8.len(var_298_9)
				local var_298_12 = var_298_10 <= 0 and var_298_7 or var_298_7 * (var_298_11 / var_298_10)

				if var_298_12 > 0 and var_298_7 < var_298_12 then
					arg_295_1.talkMaxDuration = var_298_12

					if var_298_12 + var_298_6 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_12 + var_298_6
					end
				end

				arg_295_1.text_.text = var_298_9
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)
				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_13 = math.max(var_298_7, arg_295_1.talkMaxDuration)

			if var_298_6 <= arg_295_1.time_ and arg_295_1.time_ < var_298_6 + var_298_13 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_6) / var_298_13

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_6 + var_298_13 and arg_295_1.time_ < var_298_6 + var_298_13 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play410142074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 410142074
		arg_299_1.duration_ = 9.166

		local var_299_0 = {
			ja = 9.166,
			CriLanguages = 8.466,
			zh = 8.466
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
				arg_299_0:Play410142075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 3

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				local var_302_1 = manager.ui.mainCamera.transform.localPosition
				local var_302_2 = Vector3.New(0, 0, 10) + Vector3.New(var_302_1.x, var_302_1.y, 0)
				local var_302_3 = arg_299_1.bgs_.ST61

				var_302_3.transform.localPosition = var_302_2
				var_302_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_302_4 = var_302_3:GetComponent("SpriteRenderer")

				if var_302_4 and var_302_4.sprite then
					local var_302_5 = (var_302_3.transform.localPosition - var_302_1).z
					local var_302_6 = manager.ui.mainCameraCom_
					local var_302_7 = 2 * var_302_5 * Mathf.Tan(var_302_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_302_8 = var_302_7 * var_302_6.aspect
					local var_302_9 = var_302_4.sprite.bounds.size.x
					local var_302_10 = var_302_4.sprite.bounds.size.y
					local var_302_11 = var_302_8 / var_302_9
					local var_302_12 = var_302_7 / var_302_10
					local var_302_13 = var_302_12 < var_302_11 and var_302_11 or var_302_12

					var_302_3.transform.localScale = Vector3.New(var_302_13, var_302_13, 0)
				end

				for iter_302_0, iter_302_1 in pairs(arg_299_1.bgs_) do
					if iter_302_0 ~= "ST61" then
						iter_302_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_302_14 = 0

			if var_302_14 < arg_299_1.time_ and arg_299_1.time_ <= var_302_14 + arg_302_0 then
				arg_299_1.mask_.enabled = true
				arg_299_1.mask_.raycastTarget = true

				arg_299_1:SetGaussion(false)
			end

			local var_302_15 = 3

			if var_302_14 <= arg_299_1.time_ and arg_299_1.time_ < var_302_14 + var_302_15 then
				local var_302_16 = (arg_299_1.time_ - var_302_14) / var_302_15
				local var_302_17 = Color.New(0, 0, 0)

				var_302_17.a = Mathf.Lerp(0, 1, var_302_16)
				arg_299_1.mask_.color = var_302_17
			end

			if arg_299_1.time_ >= var_302_14 + var_302_15 and arg_299_1.time_ < var_302_14 + var_302_15 + arg_302_0 then
				local var_302_18 = Color.New(0, 0, 0)

				var_302_18.a = 1
				arg_299_1.mask_.color = var_302_18
			end

			local var_302_19 = 3

			if var_302_19 < arg_299_1.time_ and arg_299_1.time_ <= var_302_19 + arg_302_0 then
				arg_299_1.mask_.enabled = true
				arg_299_1.mask_.raycastTarget = true

				arg_299_1:SetGaussion(false)
			end

			local var_302_20 = 3

			if var_302_19 <= arg_299_1.time_ and arg_299_1.time_ < var_302_19 + var_302_20 then
				local var_302_21 = (arg_299_1.time_ - var_302_19) / var_302_20
				local var_302_22 = Color.New(0, 0, 0)

				var_302_22.a = Mathf.Lerp(1, 0, var_302_21)
				arg_299_1.mask_.color = var_302_22
			end

			if arg_299_1.time_ >= var_302_19 + var_302_20 and arg_299_1.time_ < var_302_19 + var_302_20 + arg_302_0 then
				local var_302_23 = Color.New(0, 0, 0)
				local var_302_24 = 0

				arg_299_1.mask_.enabled = false
				var_302_23.a = var_302_24
				arg_299_1.mask_.color = var_302_23
			end

			local var_302_25 = arg_299_1.actors_["1056"].transform
			local var_302_26 = 5.8

			if var_302_26 < arg_299_1.time_ and arg_299_1.time_ <= var_302_26 + arg_302_0 then
				arg_299_1.var_.moveOldPos1056 = var_302_25.localPosition
				var_302_25.localScale = Vector3.New(1, 1, 1)

				arg_299_1:CheckSpriteTmpPos("1056", 4)

				local var_302_27 = var_302_25.childCount

				for iter_302_2 = 0, var_302_27 - 1 do
					local var_302_28 = var_302_25:GetChild(iter_302_2)

					if var_302_28.name == "split_3" or not string.find(var_302_28.name, "split") then
						var_302_28.gameObject:SetActive(true)
					else
						var_302_28.gameObject:SetActive(false)
					end
				end
			end

			local var_302_29 = 0.001

			if var_302_26 <= arg_299_1.time_ and arg_299_1.time_ < var_302_26 + var_302_29 then
				local var_302_30 = (arg_299_1.time_ - var_302_26) / var_302_29
				local var_302_31 = Vector3.New(390, -350, -180)

				var_302_25.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos1056, var_302_31, var_302_30)
			end

			if arg_299_1.time_ >= var_302_26 + var_302_29 and arg_299_1.time_ < var_302_26 + var_302_29 + arg_302_0 then
				var_302_25.localPosition = Vector3.New(390, -350, -180)
			end

			local var_302_32 = arg_299_1.actors_["1061"].transform
			local var_302_33 = 5.8

			if var_302_33 < arg_299_1.time_ and arg_299_1.time_ <= var_302_33 + arg_302_0 then
				arg_299_1.var_.moveOldPos1061 = var_302_32.localPosition
				var_302_32.localScale = Vector3.New(1, 1, 1)

				arg_299_1:CheckSpriteTmpPos("1061", 2)

				local var_302_34 = var_302_32.childCount

				for iter_302_3 = 0, var_302_34 - 1 do
					local var_302_35 = var_302_32:GetChild(iter_302_3)

					if var_302_35.name == "" or not string.find(var_302_35.name, "split") then
						var_302_35.gameObject:SetActive(true)
					else
						var_302_35.gameObject:SetActive(false)
					end
				end
			end

			local var_302_36 = 0.001

			if var_302_33 <= arg_299_1.time_ and arg_299_1.time_ < var_302_33 + var_302_36 then
				local var_302_37 = (arg_299_1.time_ - var_302_33) / var_302_36
				local var_302_38 = Vector3.New(-390, -490, 18)

				var_302_32.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos1061, var_302_38, var_302_37)
			end

			if arg_299_1.time_ >= var_302_33 + var_302_36 and arg_299_1.time_ < var_302_33 + var_302_36 + arg_302_0 then
				var_302_32.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_302_39 = arg_299_1.actors_["1056"]
			local var_302_40 = 5.8

			if var_302_40 < arg_299_1.time_ and arg_299_1.time_ <= var_302_40 + arg_302_0 and arg_299_1.var_.actorSpriteComps1056 == nil then
				arg_299_1.var_.actorSpriteComps1056 = var_302_39:GetComponentsInChildren(typeof(Image), true)
			end

			local var_302_41 = 0.0339999999999998

			if var_302_40 <= arg_299_1.time_ and arg_299_1.time_ < var_302_40 + var_302_41 then
				local var_302_42 = (arg_299_1.time_ - var_302_40) / var_302_41

				if arg_299_1.var_.actorSpriteComps1056 then
					for iter_302_4, iter_302_5 in pairs(arg_299_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_302_5 then
							local var_302_43 = Mathf.Lerp(iter_302_5.color.r, 1, var_302_42)

							iter_302_5.color = Color.New(var_302_43, var_302_43, var_302_43)
						end
					end
				end
			end

			if arg_299_1.time_ >= var_302_40 + var_302_41 and arg_299_1.time_ < var_302_40 + var_302_41 + arg_302_0 and arg_299_1.var_.actorSpriteComps1056 then
				local var_302_44 = 1

				for iter_302_6, iter_302_7 in pairs(arg_299_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_302_7 then
						iter_302_7.color = Color.New(var_302_44, var_302_44, var_302_44)
					end
				end

				arg_299_1.var_.actorSpriteComps1056 = nil
			end

			local var_302_45 = arg_299_1.actors_["1061"]
			local var_302_46 = 5.8

			if var_302_46 < arg_299_1.time_ and arg_299_1.time_ <= var_302_46 + arg_302_0 and arg_299_1.var_.actorSpriteComps1061 == nil then
				arg_299_1.var_.actorSpriteComps1061 = var_302_45:GetComponentsInChildren(typeof(Image), true)
			end

			local var_302_47 = 0.034

			if var_302_46 <= arg_299_1.time_ and arg_299_1.time_ < var_302_46 + var_302_47 then
				local var_302_48 = (arg_299_1.time_ - var_302_46) / var_302_47

				if arg_299_1.var_.actorSpriteComps1061 then
					for iter_302_8, iter_302_9 in pairs(arg_299_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_302_9 then
							local var_302_49 = Mathf.Lerp(iter_302_9.color.r, 0.5, var_302_48)

							iter_302_9.color = Color.New(var_302_49, var_302_49, var_302_49)
						end
					end
				end
			end

			if arg_299_1.time_ >= var_302_46 + var_302_47 and arg_299_1.time_ < var_302_46 + var_302_47 + arg_302_0 and arg_299_1.var_.actorSpriteComps1061 then
				local var_302_50 = 0.5

				for iter_302_10, iter_302_11 in pairs(arg_299_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_302_11 then
						iter_302_11.color = Color.New(var_302_50, var_302_50, var_302_50)
					end
				end

				arg_299_1.var_.actorSpriteComps1061 = nil
			end

			local var_302_51 = arg_299_1.actors_["1056"].transform
			local var_302_52 = 2.966

			if var_302_52 < arg_299_1.time_ and arg_299_1.time_ <= var_302_52 + arg_302_0 then
				arg_299_1.var_.moveOldPos1056 = var_302_51.localPosition
				var_302_51.localScale = Vector3.New(1, 1, 1)

				arg_299_1:CheckSpriteTmpPos("1056", 7)

				local var_302_53 = var_302_51.childCount

				for iter_302_12 = 0, var_302_53 - 1 do
					local var_302_54 = var_302_51:GetChild(iter_302_12)

					if var_302_54.name == "split_3" or not string.find(var_302_54.name, "split") then
						var_302_54.gameObject:SetActive(true)
					else
						var_302_54.gameObject:SetActive(false)
					end
				end
			end

			local var_302_55 = 0.001

			if var_302_52 <= arg_299_1.time_ and arg_299_1.time_ < var_302_52 + var_302_55 then
				local var_302_56 = (arg_299_1.time_ - var_302_52) / var_302_55
				local var_302_57 = Vector3.New(0, -2000, -180)

				var_302_51.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos1056, var_302_57, var_302_56)
			end

			if arg_299_1.time_ >= var_302_52 + var_302_55 and arg_299_1.time_ < var_302_52 + var_302_55 + arg_302_0 then
				var_302_51.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_302_58 = arg_299_1.actors_["10061"].transform
			local var_302_59 = 2.966

			if var_302_59 < arg_299_1.time_ and arg_299_1.time_ <= var_302_59 + arg_302_0 then
				arg_299_1.var_.moveOldPos10061 = var_302_58.localPosition
				var_302_58.localScale = Vector3.New(1, 1, 1)

				arg_299_1:CheckSpriteTmpPos("10061", 7)

				local var_302_60 = var_302_58.childCount

				for iter_302_13 = 0, var_302_60 - 1 do
					local var_302_61 = var_302_58:GetChild(iter_302_13)

					if var_302_61.name == "" or not string.find(var_302_61.name, "split") then
						var_302_61.gameObject:SetActive(true)
					else
						var_302_61.gameObject:SetActive(false)
					end
				end
			end

			local var_302_62 = 0.001

			if var_302_59 <= arg_299_1.time_ and arg_299_1.time_ < var_302_59 + var_302_62 then
				local var_302_63 = (arg_299_1.time_ - var_302_59) / var_302_62
				local var_302_64 = Vector3.New(0, -2000, -100)

				var_302_58.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos10061, var_302_64, var_302_63)
			end

			if arg_299_1.time_ >= var_302_59 + var_302_62 and arg_299_1.time_ < var_302_59 + var_302_62 + arg_302_0 then
				var_302_58.localPosition = Vector3.New(0, -2000, -100)
			end

			if arg_299_1.frameCnt_ <= 1 then
				arg_299_1.dialog_:SetActive(false)
			end

			local var_302_65 = 6
			local var_302_66 = 0.275

			if var_302_65 < arg_299_1.time_ and arg_299_1.time_ <= var_302_65 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0

				arg_299_1.dialog_:SetActive(true)

				local var_302_67 = LeanTween.value(arg_299_1.dialog_, 0, 1, 0.3)

				var_302_67:setOnUpdate(LuaHelper.FloatAction(function(arg_303_0)
					arg_299_1.dialogCg_.alpha = arg_303_0
				end))
				var_302_67:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_299_1.dialog_)
					var_302_67:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_299_1.duration_ = arg_299_1.duration_ + 0.3

				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_68 = arg_299_1:FormatText(StoryNameCfg[605].name)

				arg_299_1.leftNameTxt_.text = var_302_68

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_69 = arg_299_1:GetWordFromCfg(410142074)
				local var_302_70 = arg_299_1:FormatText(var_302_69.content)

				arg_299_1.text_.text = var_302_70

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_71 = 11
				local var_302_72 = utf8.len(var_302_70)
				local var_302_73 = var_302_71 <= 0 and var_302_66 or var_302_66 * (var_302_72 / var_302_71)

				if var_302_73 > 0 and var_302_66 < var_302_73 then
					arg_299_1.talkMaxDuration = var_302_73
					var_302_65 = var_302_65 + 0.3

					if var_302_73 + var_302_65 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_73 + var_302_65
					end
				end

				arg_299_1.text_.text = var_302_70
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142074", "story_v_out_410142.awb") ~= 0 then
					local var_302_74 = manager.audio:GetVoiceLength("story_v_out_410142", "410142074", "story_v_out_410142.awb") / 1000

					if var_302_74 + var_302_65 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_74 + var_302_65
					end

					if var_302_69.prefab_name ~= "" and arg_299_1.actors_[var_302_69.prefab_name] ~= nil then
						local var_302_75 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_69.prefab_name].transform, "story_v_out_410142", "410142074", "story_v_out_410142.awb")

						arg_299_1:RecordAudio("410142074", var_302_75)
						arg_299_1:RecordAudio("410142074", var_302_75)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_410142", "410142074", "story_v_out_410142.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_410142", "410142074", "story_v_out_410142.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_76 = var_302_65 + 0.3
			local var_302_77 = math.max(var_302_66, arg_299_1.talkMaxDuration)

			if var_302_76 <= arg_299_1.time_ and arg_299_1.time_ < var_302_76 + var_302_77 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_76) / var_302_77

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_76 + var_302_77 and arg_299_1.time_ < var_302_76 + var_302_77 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play410142075 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 410142075
		arg_305_1.duration_ = 9.566

		local var_305_0 = {
			ja = 9.566,
			CriLanguages = 4.833,
			zh = 4.833
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
				arg_305_0:Play410142076(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["1061"].transform
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 then
				arg_305_1.var_.moveOldPos1061 = var_308_0.localPosition
				var_308_0.localScale = Vector3.New(1, 1, 1)

				arg_305_1:CheckSpriteTmpPos("1061", 2)

				local var_308_2 = var_308_0.childCount

				for iter_308_0 = 0, var_308_2 - 1 do
					local var_308_3 = var_308_0:GetChild(iter_308_0)

					if var_308_3.name == "split_2" or not string.find(var_308_3.name, "split") then
						var_308_3.gameObject:SetActive(true)
					else
						var_308_3.gameObject:SetActive(false)
					end
				end
			end

			local var_308_4 = 0.001

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_4 then
				local var_308_5 = (arg_305_1.time_ - var_308_1) / var_308_4
				local var_308_6 = Vector3.New(-390, -490, 18)

				var_308_0.localPosition = Vector3.Lerp(arg_305_1.var_.moveOldPos1061, var_308_6, var_308_5)
			end

			if arg_305_1.time_ >= var_308_1 + var_308_4 and arg_305_1.time_ < var_308_1 + var_308_4 + arg_308_0 then
				var_308_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_308_7 = arg_305_1.actors_["1056"]
			local var_308_8 = 0

			if var_308_8 < arg_305_1.time_ and arg_305_1.time_ <= var_308_8 + arg_308_0 and arg_305_1.var_.actorSpriteComps1056 == nil then
				arg_305_1.var_.actorSpriteComps1056 = var_308_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_308_9 = 0.0339999999999998

			if var_308_8 <= arg_305_1.time_ and arg_305_1.time_ < var_308_8 + var_308_9 then
				local var_308_10 = (arg_305_1.time_ - var_308_8) / var_308_9

				if arg_305_1.var_.actorSpriteComps1056 then
					for iter_308_1, iter_308_2 in pairs(arg_305_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_308_2 then
							local var_308_11 = Mathf.Lerp(iter_308_2.color.r, 0.5, var_308_10)

							iter_308_2.color = Color.New(var_308_11, var_308_11, var_308_11)
						end
					end
				end
			end

			if arg_305_1.time_ >= var_308_8 + var_308_9 and arg_305_1.time_ < var_308_8 + var_308_9 + arg_308_0 and arg_305_1.var_.actorSpriteComps1056 then
				local var_308_12 = 0.5

				for iter_308_3, iter_308_4 in pairs(arg_305_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_308_4 then
						iter_308_4.color = Color.New(var_308_12, var_308_12, var_308_12)
					end
				end

				arg_305_1.var_.actorSpriteComps1056 = nil
			end

			local var_308_13 = arg_305_1.actors_["1061"]
			local var_308_14 = 0

			if var_308_14 < arg_305_1.time_ and arg_305_1.time_ <= var_308_14 + arg_308_0 and arg_305_1.var_.actorSpriteComps1061 == nil then
				arg_305_1.var_.actorSpriteComps1061 = var_308_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_308_15 = 0.034

			if var_308_14 <= arg_305_1.time_ and arg_305_1.time_ < var_308_14 + var_308_15 then
				local var_308_16 = (arg_305_1.time_ - var_308_14) / var_308_15

				if arg_305_1.var_.actorSpriteComps1061 then
					for iter_308_5, iter_308_6 in pairs(arg_305_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_308_6 then
							local var_308_17 = Mathf.Lerp(iter_308_6.color.r, 1, var_308_16)

							iter_308_6.color = Color.New(var_308_17, var_308_17, var_308_17)
						end
					end
				end
			end

			if arg_305_1.time_ >= var_308_14 + var_308_15 and arg_305_1.time_ < var_308_14 + var_308_15 + arg_308_0 and arg_305_1.var_.actorSpriteComps1061 then
				local var_308_18 = 1

				for iter_308_7, iter_308_8 in pairs(arg_305_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_308_8 then
						iter_308_8.color = Color.New(var_308_18, var_308_18, var_308_18)
					end
				end

				arg_305_1.var_.actorSpriteComps1061 = nil
			end

			local var_308_19 = 0
			local var_308_20 = 0.675

			if var_308_19 < arg_305_1.time_ and arg_305_1.time_ <= var_308_19 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_21 = arg_305_1:FormatText(StoryNameCfg[612].name)

				arg_305_1.leftNameTxt_.text = var_308_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_22 = arg_305_1:GetWordFromCfg(410142075)
				local var_308_23 = arg_305_1:FormatText(var_308_22.content)

				arg_305_1.text_.text = var_308_23

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_24 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142075", "story_v_out_410142.awb") ~= 0 then
					local var_308_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142075", "story_v_out_410142.awb") / 1000

					if var_308_27 + var_308_19 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_27 + var_308_19
					end

					if var_308_22.prefab_name ~= "" and arg_305_1.actors_[var_308_22.prefab_name] ~= nil then
						local var_308_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_22.prefab_name].transform, "story_v_out_410142", "410142075", "story_v_out_410142.awb")

						arg_305_1:RecordAudio("410142075", var_308_28)
						arg_305_1:RecordAudio("410142075", var_308_28)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_410142", "410142075", "story_v_out_410142.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_410142", "410142075", "story_v_out_410142.awb")
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
	Play410142076 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 410142076
		arg_309_1.duration_ = 5

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play410142077(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1056"]
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 and arg_309_1.var_.actorSpriteComps1056 == nil then
				arg_309_1.var_.actorSpriteComps1056 = var_312_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_312_2 = 0.0339999999999998

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2

				if arg_309_1.var_.actorSpriteComps1056 then
					for iter_312_0, iter_312_1 in pairs(arg_309_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_312_1 then
							local var_312_4 = Mathf.Lerp(iter_312_1.color.r, 0.5, var_312_3)

							iter_312_1.color = Color.New(var_312_4, var_312_4, var_312_4)
						end
					end
				end
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 and arg_309_1.var_.actorSpriteComps1056 then
				local var_312_5 = 0.5

				for iter_312_2, iter_312_3 in pairs(arg_309_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_312_3 then
						iter_312_3.color = Color.New(var_312_5, var_312_5, var_312_5)
					end
				end

				arg_309_1.var_.actorSpriteComps1056 = nil
			end

			local var_312_6 = arg_309_1.actors_["1061"]
			local var_312_7 = 0

			if var_312_7 < arg_309_1.time_ and arg_309_1.time_ <= var_312_7 + arg_312_0 and arg_309_1.var_.actorSpriteComps1061 == nil then
				arg_309_1.var_.actorSpriteComps1061 = var_312_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_312_8 = 0.034

			if var_312_7 <= arg_309_1.time_ and arg_309_1.time_ < var_312_7 + var_312_8 then
				local var_312_9 = (arg_309_1.time_ - var_312_7) / var_312_8

				if arg_309_1.var_.actorSpriteComps1061 then
					for iter_312_4, iter_312_5 in pairs(arg_309_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_312_5 then
							local var_312_10 = Mathf.Lerp(iter_312_5.color.r, 0.5, var_312_9)

							iter_312_5.color = Color.New(var_312_10, var_312_10, var_312_10)
						end
					end
				end
			end

			if arg_309_1.time_ >= var_312_7 + var_312_8 and arg_309_1.time_ < var_312_7 + var_312_8 + arg_312_0 and arg_309_1.var_.actorSpriteComps1061 then
				local var_312_11 = 0.5

				for iter_312_6, iter_312_7 in pairs(arg_309_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_312_7 then
						iter_312_7.color = Color.New(var_312_11, var_312_11, var_312_11)
					end
				end

				arg_309_1.var_.actorSpriteComps1061 = nil
			end

			local var_312_12 = 0
			local var_312_13 = 0.925

			if var_312_12 < arg_309_1.time_ and arg_309_1.time_ <= var_312_12 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, false)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_14 = arg_309_1:GetWordFromCfg(410142076)
				local var_312_15 = arg_309_1:FormatText(var_312_14.content)

				arg_309_1.text_.text = var_312_15

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_16 = 37
				local var_312_17 = utf8.len(var_312_15)
				local var_312_18 = var_312_16 <= 0 and var_312_13 or var_312_13 * (var_312_17 / var_312_16)

				if var_312_18 > 0 and var_312_13 < var_312_18 then
					arg_309_1.talkMaxDuration = var_312_18

					if var_312_18 + var_312_12 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_18 + var_312_12
					end
				end

				arg_309_1.text_.text = var_312_15
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)
				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_19 = math.max(var_312_13, arg_309_1.talkMaxDuration)

			if var_312_12 <= arg_309_1.time_ and arg_309_1.time_ < var_312_12 + var_312_19 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_12) / var_312_19

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_12 + var_312_19 and arg_309_1.time_ < var_312_12 + var_312_19 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play410142077 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 410142077
		arg_313_1.duration_ = 13.333

		local var_313_0 = {
			ja = 13.333,
			CriLanguages = 7.9,
			zh = 7.9
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
				arg_313_0:Play410142078(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["1061"].transform
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 then
				arg_313_1.var_.moveOldPos1061 = var_316_0.localPosition
				var_316_0.localScale = Vector3.New(1, 1, 1)

				arg_313_1:CheckSpriteTmpPos("1061", 2)

				local var_316_2 = var_316_0.childCount

				for iter_316_0 = 0, var_316_2 - 1 do
					local var_316_3 = var_316_0:GetChild(iter_316_0)

					if var_316_3.name == "split_1" or not string.find(var_316_3.name, "split") then
						var_316_3.gameObject:SetActive(true)
					else
						var_316_3.gameObject:SetActive(false)
					end
				end
			end

			local var_316_4 = 0.001

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_4 then
				local var_316_5 = (arg_313_1.time_ - var_316_1) / var_316_4
				local var_316_6 = Vector3.New(-390, -490, 18)

				var_316_0.localPosition = Vector3.Lerp(arg_313_1.var_.moveOldPos1061, var_316_6, var_316_5)
			end

			if arg_313_1.time_ >= var_316_1 + var_316_4 and arg_313_1.time_ < var_316_1 + var_316_4 + arg_316_0 then
				var_316_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_316_7 = arg_313_1.actors_["1061"]
			local var_316_8 = 0

			if var_316_8 < arg_313_1.time_ and arg_313_1.time_ <= var_316_8 + arg_316_0 and arg_313_1.var_.actorSpriteComps1061 == nil then
				arg_313_1.var_.actorSpriteComps1061 = var_316_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_316_9 = 0.034

			if var_316_8 <= arg_313_1.time_ and arg_313_1.time_ < var_316_8 + var_316_9 then
				local var_316_10 = (arg_313_1.time_ - var_316_8) / var_316_9

				if arg_313_1.var_.actorSpriteComps1061 then
					for iter_316_1, iter_316_2 in pairs(arg_313_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_316_2 then
							local var_316_11 = Mathf.Lerp(iter_316_2.color.r, 1, var_316_10)

							iter_316_2.color = Color.New(var_316_11, var_316_11, var_316_11)
						end
					end
				end
			end

			if arg_313_1.time_ >= var_316_8 + var_316_9 and arg_313_1.time_ < var_316_8 + var_316_9 + arg_316_0 and arg_313_1.var_.actorSpriteComps1061 then
				local var_316_12 = 1

				for iter_316_3, iter_316_4 in pairs(arg_313_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_316_4 then
						iter_316_4.color = Color.New(var_316_12, var_316_12, var_316_12)
					end
				end

				arg_313_1.var_.actorSpriteComps1061 = nil
			end

			local var_316_13 = 0
			local var_316_14 = 0.875

			if var_316_13 < arg_313_1.time_ and arg_313_1.time_ <= var_316_13 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_15 = arg_313_1:FormatText(StoryNameCfg[612].name)

				arg_313_1.leftNameTxt_.text = var_316_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_16 = arg_313_1:GetWordFromCfg(410142077)
				local var_316_17 = arg_313_1:FormatText(var_316_16.content)

				arg_313_1.text_.text = var_316_17

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_18 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142077", "story_v_out_410142.awb") ~= 0 then
					local var_316_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142077", "story_v_out_410142.awb") / 1000

					if var_316_21 + var_316_13 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_21 + var_316_13
					end

					if var_316_16.prefab_name ~= "" and arg_313_1.actors_[var_316_16.prefab_name] ~= nil then
						local var_316_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_16.prefab_name].transform, "story_v_out_410142", "410142077", "story_v_out_410142.awb")

						arg_313_1:RecordAudio("410142077", var_316_22)
						arg_313_1:RecordAudio("410142077", var_316_22)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_410142", "410142077", "story_v_out_410142.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_410142", "410142077", "story_v_out_410142.awb")
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
	Play410142078 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 410142078
		arg_317_1.duration_ = 7.833

		local var_317_0 = {
			ja = 7.833,
			CriLanguages = 5.2,
			zh = 5.2
		}
		local var_317_1 = manager.audio:GetLocalizationFlag()

		if var_317_0[var_317_1] ~= nil then
			arg_317_1.duration_ = var_317_0[var_317_1]
		end

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play410142079(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["1056"].transform
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 then
				arg_317_1.var_.moveOldPos1056 = var_320_0.localPosition
				var_320_0.localScale = Vector3.New(1, 1, 1)

				arg_317_1:CheckSpriteTmpPos("1056", 4)

				local var_320_2 = var_320_0.childCount

				for iter_320_0 = 0, var_320_2 - 1 do
					local var_320_3 = var_320_0:GetChild(iter_320_0)

					if var_320_3.name == "split_4" or not string.find(var_320_3.name, "split") then
						var_320_3.gameObject:SetActive(true)
					else
						var_320_3.gameObject:SetActive(false)
					end
				end
			end

			local var_320_4 = 0.001

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_4 then
				local var_320_5 = (arg_317_1.time_ - var_320_1) / var_320_4
				local var_320_6 = Vector3.New(390, -350, -180)

				var_320_0.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos1056, var_320_6, var_320_5)
			end

			if arg_317_1.time_ >= var_320_1 + var_320_4 and arg_317_1.time_ < var_320_1 + var_320_4 + arg_320_0 then
				var_320_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_320_7 = arg_317_1.actors_["1056"]
			local var_320_8 = 0

			if var_320_8 < arg_317_1.time_ and arg_317_1.time_ <= var_320_8 + arg_320_0 and arg_317_1.var_.actorSpriteComps1056 == nil then
				arg_317_1.var_.actorSpriteComps1056 = var_320_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_320_9 = 0.034

			if var_320_8 <= arg_317_1.time_ and arg_317_1.time_ < var_320_8 + var_320_9 then
				local var_320_10 = (arg_317_1.time_ - var_320_8) / var_320_9

				if arg_317_1.var_.actorSpriteComps1056 then
					for iter_320_1, iter_320_2 in pairs(arg_317_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_320_2 then
							local var_320_11 = Mathf.Lerp(iter_320_2.color.r, 1, var_320_10)

							iter_320_2.color = Color.New(var_320_11, var_320_11, var_320_11)
						end
					end
				end
			end

			if arg_317_1.time_ >= var_320_8 + var_320_9 and arg_317_1.time_ < var_320_8 + var_320_9 + arg_320_0 and arg_317_1.var_.actorSpriteComps1056 then
				local var_320_12 = 1

				for iter_320_3, iter_320_4 in pairs(arg_317_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_320_4 then
						iter_320_4.color = Color.New(var_320_12, var_320_12, var_320_12)
					end
				end

				arg_317_1.var_.actorSpriteComps1056 = nil
			end

			local var_320_13 = arg_317_1.actors_["1061"]
			local var_320_14 = 0

			if var_320_14 < arg_317_1.time_ and arg_317_1.time_ <= var_320_14 + arg_320_0 and arg_317_1.var_.actorSpriteComps1061 == nil then
				arg_317_1.var_.actorSpriteComps1061 = var_320_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_320_15 = 0.034

			if var_320_14 <= arg_317_1.time_ and arg_317_1.time_ < var_320_14 + var_320_15 then
				local var_320_16 = (arg_317_1.time_ - var_320_14) / var_320_15

				if arg_317_1.var_.actorSpriteComps1061 then
					for iter_320_5, iter_320_6 in pairs(arg_317_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_320_6 then
							local var_320_17 = Mathf.Lerp(iter_320_6.color.r, 0.5, var_320_16)

							iter_320_6.color = Color.New(var_320_17, var_320_17, var_320_17)
						end
					end
				end
			end

			if arg_317_1.time_ >= var_320_14 + var_320_15 and arg_317_1.time_ < var_320_14 + var_320_15 + arg_320_0 and arg_317_1.var_.actorSpriteComps1061 then
				local var_320_18 = 0.5

				for iter_320_7, iter_320_8 in pairs(arg_317_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_320_8 then
						iter_320_8.color = Color.New(var_320_18, var_320_18, var_320_18)
					end
				end

				arg_317_1.var_.actorSpriteComps1061 = nil
			end

			local var_320_19 = 0
			local var_320_20 = 0.525

			if var_320_19 < arg_317_1.time_ and arg_317_1.time_ <= var_320_19 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_21 = arg_317_1:FormatText(StoryNameCfg[605].name)

				arg_317_1.leftNameTxt_.text = var_320_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_22 = arg_317_1:GetWordFromCfg(410142078)
				local var_320_23 = arg_317_1:FormatText(var_320_22.content)

				arg_317_1.text_.text = var_320_23

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_24 = 21
				local var_320_25 = utf8.len(var_320_23)
				local var_320_26 = var_320_24 <= 0 and var_320_20 or var_320_20 * (var_320_25 / var_320_24)

				if var_320_26 > 0 and var_320_20 < var_320_26 then
					arg_317_1.talkMaxDuration = var_320_26

					if var_320_26 + var_320_19 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_26 + var_320_19
					end
				end

				arg_317_1.text_.text = var_320_23
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142078", "story_v_out_410142.awb") ~= 0 then
					local var_320_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142078", "story_v_out_410142.awb") / 1000

					if var_320_27 + var_320_19 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_27 + var_320_19
					end

					if var_320_22.prefab_name ~= "" and arg_317_1.actors_[var_320_22.prefab_name] ~= nil then
						local var_320_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_22.prefab_name].transform, "story_v_out_410142", "410142078", "story_v_out_410142.awb")

						arg_317_1:RecordAudio("410142078", var_320_28)
						arg_317_1:RecordAudio("410142078", var_320_28)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_410142", "410142078", "story_v_out_410142.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_410142", "410142078", "story_v_out_410142.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_29 = math.max(var_320_20, arg_317_1.talkMaxDuration)

			if var_320_19 <= arg_317_1.time_ and arg_317_1.time_ < var_320_19 + var_320_29 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_19) / var_320_29

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_19 + var_320_29 and arg_317_1.time_ < var_320_19 + var_320_29 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play410142079 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 410142079
		arg_321_1.duration_ = 14.733

		local var_321_0 = {
			ja = 14.733,
			CriLanguages = 11.133,
			zh = 11.133
		}
		local var_321_1 = manager.audio:GetLocalizationFlag()

		if var_321_0[var_321_1] ~= nil then
			arg_321_1.duration_ = var_321_0[var_321_1]
		end

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play410142080(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["1061"].transform
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 then
				arg_321_1.var_.moveOldPos1061 = var_324_0.localPosition
				var_324_0.localScale = Vector3.New(1, 1, 1)

				arg_321_1:CheckSpriteTmpPos("1061", 2)

				local var_324_2 = var_324_0.childCount

				for iter_324_0 = 0, var_324_2 - 1 do
					local var_324_3 = var_324_0:GetChild(iter_324_0)

					if var_324_3.name == "split_5" or not string.find(var_324_3.name, "split") then
						var_324_3.gameObject:SetActive(true)
					else
						var_324_3.gameObject:SetActive(false)
					end
				end
			end

			local var_324_4 = 0.001

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_4 then
				local var_324_5 = (arg_321_1.time_ - var_324_1) / var_324_4
				local var_324_6 = Vector3.New(-390, -490, 18)

				var_324_0.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos1061, var_324_6, var_324_5)
			end

			if arg_321_1.time_ >= var_324_1 + var_324_4 and arg_321_1.time_ < var_324_1 + var_324_4 + arg_324_0 then
				var_324_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_324_7 = arg_321_1.actors_["1061"]
			local var_324_8 = 0

			if var_324_8 < arg_321_1.time_ and arg_321_1.time_ <= var_324_8 + arg_324_0 and arg_321_1.var_.actorSpriteComps1061 == nil then
				arg_321_1.var_.actorSpriteComps1061 = var_324_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_324_9 = 0.034

			if var_324_8 <= arg_321_1.time_ and arg_321_1.time_ < var_324_8 + var_324_9 then
				local var_324_10 = (arg_321_1.time_ - var_324_8) / var_324_9

				if arg_321_1.var_.actorSpriteComps1061 then
					for iter_324_1, iter_324_2 in pairs(arg_321_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_324_2 then
							local var_324_11 = Mathf.Lerp(iter_324_2.color.r, 1, var_324_10)

							iter_324_2.color = Color.New(var_324_11, var_324_11, var_324_11)
						end
					end
				end
			end

			if arg_321_1.time_ >= var_324_8 + var_324_9 and arg_321_1.time_ < var_324_8 + var_324_9 + arg_324_0 and arg_321_1.var_.actorSpriteComps1061 then
				local var_324_12 = 1

				for iter_324_3, iter_324_4 in pairs(arg_321_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_324_4 then
						iter_324_4.color = Color.New(var_324_12, var_324_12, var_324_12)
					end
				end

				arg_321_1.var_.actorSpriteComps1061 = nil
			end

			local var_324_13 = arg_321_1.actors_["1056"]
			local var_324_14 = 0

			if var_324_14 < arg_321_1.time_ and arg_321_1.time_ <= var_324_14 + arg_324_0 and arg_321_1.var_.actorSpriteComps1056 == nil then
				arg_321_1.var_.actorSpriteComps1056 = var_324_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_324_15 = 0.0339999999999998

			if var_324_14 <= arg_321_1.time_ and arg_321_1.time_ < var_324_14 + var_324_15 then
				local var_324_16 = (arg_321_1.time_ - var_324_14) / var_324_15

				if arg_321_1.var_.actorSpriteComps1056 then
					for iter_324_5, iter_324_6 in pairs(arg_321_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_324_6 then
							local var_324_17 = Mathf.Lerp(iter_324_6.color.r, 0.5, var_324_16)

							iter_324_6.color = Color.New(var_324_17, var_324_17, var_324_17)
						end
					end
				end
			end

			if arg_321_1.time_ >= var_324_14 + var_324_15 and arg_321_1.time_ < var_324_14 + var_324_15 + arg_324_0 and arg_321_1.var_.actorSpriteComps1056 then
				local var_324_18 = 0.5

				for iter_324_7, iter_324_8 in pairs(arg_321_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_324_8 then
						iter_324_8.color = Color.New(var_324_18, var_324_18, var_324_18)
					end
				end

				arg_321_1.var_.actorSpriteComps1056 = nil
			end

			local var_324_19 = 0
			local var_324_20 = 1.275

			if var_324_19 < arg_321_1.time_ and arg_321_1.time_ <= var_324_19 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_21 = arg_321_1:FormatText(StoryNameCfg[612].name)

				arg_321_1.leftNameTxt_.text = var_324_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_22 = arg_321_1:GetWordFromCfg(410142079)
				local var_324_23 = arg_321_1:FormatText(var_324_22.content)

				arg_321_1.text_.text = var_324_23

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_24 = 51
				local var_324_25 = utf8.len(var_324_23)
				local var_324_26 = var_324_24 <= 0 and var_324_20 or var_324_20 * (var_324_25 / var_324_24)

				if var_324_26 > 0 and var_324_20 < var_324_26 then
					arg_321_1.talkMaxDuration = var_324_26

					if var_324_26 + var_324_19 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_26 + var_324_19
					end
				end

				arg_321_1.text_.text = var_324_23
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142079", "story_v_out_410142.awb") ~= 0 then
					local var_324_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142079", "story_v_out_410142.awb") / 1000

					if var_324_27 + var_324_19 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_27 + var_324_19
					end

					if var_324_22.prefab_name ~= "" and arg_321_1.actors_[var_324_22.prefab_name] ~= nil then
						local var_324_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_22.prefab_name].transform, "story_v_out_410142", "410142079", "story_v_out_410142.awb")

						arg_321_1:RecordAudio("410142079", var_324_28)
						arg_321_1:RecordAudio("410142079", var_324_28)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_410142", "410142079", "story_v_out_410142.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_410142", "410142079", "story_v_out_410142.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_29 = math.max(var_324_20, arg_321_1.talkMaxDuration)

			if var_324_19 <= arg_321_1.time_ and arg_321_1.time_ < var_324_19 + var_324_29 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_19) / var_324_29

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_19 + var_324_29 and arg_321_1.time_ < var_324_19 + var_324_29 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play410142080 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 410142080
		arg_325_1.duration_ = 2.333

		local var_325_0 = {
			ja = 2.333,
			CriLanguages = 1.4,
			zh = 1.4
		}
		local var_325_1 = manager.audio:GetLocalizationFlag()

		if var_325_0[var_325_1] ~= nil then
			arg_325_1.duration_ = var_325_0[var_325_1]
		end

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play410142081(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["1056"].transform
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 then
				arg_325_1.var_.moveOldPos1056 = var_328_0.localPosition
				var_328_0.localScale = Vector3.New(1, 1, 1)

				arg_325_1:CheckSpriteTmpPos("1056", 4)

				local var_328_2 = var_328_0.childCount

				for iter_328_0 = 0, var_328_2 - 1 do
					local var_328_3 = var_328_0:GetChild(iter_328_0)

					if var_328_3.name == "split_3" or not string.find(var_328_3.name, "split") then
						var_328_3.gameObject:SetActive(true)
					else
						var_328_3.gameObject:SetActive(false)
					end
				end
			end

			local var_328_4 = 0.001

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_4 then
				local var_328_5 = (arg_325_1.time_ - var_328_1) / var_328_4
				local var_328_6 = Vector3.New(390, -350, -180)

				var_328_0.localPosition = Vector3.Lerp(arg_325_1.var_.moveOldPos1056, var_328_6, var_328_5)
			end

			if arg_325_1.time_ >= var_328_1 + var_328_4 and arg_325_1.time_ < var_328_1 + var_328_4 + arg_328_0 then
				var_328_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_328_7 = arg_325_1.actors_["1056"]
			local var_328_8 = 0

			if var_328_8 < arg_325_1.time_ and arg_325_1.time_ <= var_328_8 + arg_328_0 and arg_325_1.var_.actorSpriteComps1056 == nil then
				arg_325_1.var_.actorSpriteComps1056 = var_328_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_328_9 = 0.034

			if var_328_8 <= arg_325_1.time_ and arg_325_1.time_ < var_328_8 + var_328_9 then
				local var_328_10 = (arg_325_1.time_ - var_328_8) / var_328_9

				if arg_325_1.var_.actorSpriteComps1056 then
					for iter_328_1, iter_328_2 in pairs(arg_325_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_328_2 then
							local var_328_11 = Mathf.Lerp(iter_328_2.color.r, 1, var_328_10)

							iter_328_2.color = Color.New(var_328_11, var_328_11, var_328_11)
						end
					end
				end
			end

			if arg_325_1.time_ >= var_328_8 + var_328_9 and arg_325_1.time_ < var_328_8 + var_328_9 + arg_328_0 and arg_325_1.var_.actorSpriteComps1056 then
				local var_328_12 = 1

				for iter_328_3, iter_328_4 in pairs(arg_325_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_328_4 then
						iter_328_4.color = Color.New(var_328_12, var_328_12, var_328_12)
					end
				end

				arg_325_1.var_.actorSpriteComps1056 = nil
			end

			local var_328_13 = arg_325_1.actors_["1061"]
			local var_328_14 = 0

			if var_328_14 < arg_325_1.time_ and arg_325_1.time_ <= var_328_14 + arg_328_0 and arg_325_1.var_.actorSpriteComps1061 == nil then
				arg_325_1.var_.actorSpriteComps1061 = var_328_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_328_15 = 0.034

			if var_328_14 <= arg_325_1.time_ and arg_325_1.time_ < var_328_14 + var_328_15 then
				local var_328_16 = (arg_325_1.time_ - var_328_14) / var_328_15

				if arg_325_1.var_.actorSpriteComps1061 then
					for iter_328_5, iter_328_6 in pairs(arg_325_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_328_6 then
							local var_328_17 = Mathf.Lerp(iter_328_6.color.r, 0.5, var_328_16)

							iter_328_6.color = Color.New(var_328_17, var_328_17, var_328_17)
						end
					end
				end
			end

			if arg_325_1.time_ >= var_328_14 + var_328_15 and arg_325_1.time_ < var_328_14 + var_328_15 + arg_328_0 and arg_325_1.var_.actorSpriteComps1061 then
				local var_328_18 = 0.5

				for iter_328_7, iter_328_8 in pairs(arg_325_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_328_8 then
						iter_328_8.color = Color.New(var_328_18, var_328_18, var_328_18)
					end
				end

				arg_325_1.var_.actorSpriteComps1061 = nil
			end

			local var_328_19 = 0
			local var_328_20 = 0.075

			if var_328_19 < arg_325_1.time_ and arg_325_1.time_ <= var_328_19 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_21 = arg_325_1:FormatText(StoryNameCfg[605].name)

				arg_325_1.leftNameTxt_.text = var_328_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_22 = arg_325_1:GetWordFromCfg(410142080)
				local var_328_23 = arg_325_1:FormatText(var_328_22.content)

				arg_325_1.text_.text = var_328_23

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_24 = 3
				local var_328_25 = utf8.len(var_328_23)
				local var_328_26 = var_328_24 <= 0 and var_328_20 or var_328_20 * (var_328_25 / var_328_24)

				if var_328_26 > 0 and var_328_20 < var_328_26 then
					arg_325_1.talkMaxDuration = var_328_26

					if var_328_26 + var_328_19 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_26 + var_328_19
					end
				end

				arg_325_1.text_.text = var_328_23
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142080", "story_v_out_410142.awb") ~= 0 then
					local var_328_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142080", "story_v_out_410142.awb") / 1000

					if var_328_27 + var_328_19 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_27 + var_328_19
					end

					if var_328_22.prefab_name ~= "" and arg_325_1.actors_[var_328_22.prefab_name] ~= nil then
						local var_328_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_22.prefab_name].transform, "story_v_out_410142", "410142080", "story_v_out_410142.awb")

						arg_325_1:RecordAudio("410142080", var_328_28)
						arg_325_1:RecordAudio("410142080", var_328_28)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_410142", "410142080", "story_v_out_410142.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_410142", "410142080", "story_v_out_410142.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_29 = math.max(var_328_20, arg_325_1.talkMaxDuration)

			if var_328_19 <= arg_325_1.time_ and arg_325_1.time_ < var_328_19 + var_328_29 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_19) / var_328_29

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_19 + var_328_29 and arg_325_1.time_ < var_328_19 + var_328_29 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play410142081 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 410142081
		arg_329_1.duration_ = 7.3

		local var_329_0 = {
			ja = 7.3,
			CriLanguages = 2.5,
			zh = 2.5
		}
		local var_329_1 = manager.audio:GetLocalizationFlag()

		if var_329_0[var_329_1] ~= nil then
			arg_329_1.duration_ = var_329_0[var_329_1]
		end

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play410142082(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["1061"].transform
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				arg_329_1.var_.moveOldPos1061 = var_332_0.localPosition
				var_332_0.localScale = Vector3.New(1, 1, 1)

				arg_329_1:CheckSpriteTmpPos("1061", 2)

				local var_332_2 = var_332_0.childCount

				for iter_332_0 = 0, var_332_2 - 1 do
					local var_332_3 = var_332_0:GetChild(iter_332_0)

					if var_332_3.name == "" or not string.find(var_332_3.name, "split") then
						var_332_3.gameObject:SetActive(true)
					else
						var_332_3.gameObject:SetActive(false)
					end
				end
			end

			local var_332_4 = 0.001

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_4 then
				local var_332_5 = (arg_329_1.time_ - var_332_1) / var_332_4
				local var_332_6 = Vector3.New(-390, -490, 18)

				var_332_0.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1061, var_332_6, var_332_5)
			end

			if arg_329_1.time_ >= var_332_1 + var_332_4 and arg_329_1.time_ < var_332_1 + var_332_4 + arg_332_0 then
				var_332_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_332_7 = arg_329_1.actors_["1061"]
			local var_332_8 = 0

			if var_332_8 < arg_329_1.time_ and arg_329_1.time_ <= var_332_8 + arg_332_0 and arg_329_1.var_.actorSpriteComps1061 == nil then
				arg_329_1.var_.actorSpriteComps1061 = var_332_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_332_9 = 0.034

			if var_332_8 <= arg_329_1.time_ and arg_329_1.time_ < var_332_8 + var_332_9 then
				local var_332_10 = (arg_329_1.time_ - var_332_8) / var_332_9

				if arg_329_1.var_.actorSpriteComps1061 then
					for iter_332_1, iter_332_2 in pairs(arg_329_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_332_2 then
							local var_332_11 = Mathf.Lerp(iter_332_2.color.r, 1, var_332_10)

							iter_332_2.color = Color.New(var_332_11, var_332_11, var_332_11)
						end
					end
				end
			end

			if arg_329_1.time_ >= var_332_8 + var_332_9 and arg_329_1.time_ < var_332_8 + var_332_9 + arg_332_0 and arg_329_1.var_.actorSpriteComps1061 then
				local var_332_12 = 1

				for iter_332_3, iter_332_4 in pairs(arg_329_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_332_4 then
						iter_332_4.color = Color.New(var_332_12, var_332_12, var_332_12)
					end
				end

				arg_329_1.var_.actorSpriteComps1061 = nil
			end

			local var_332_13 = arg_329_1.actors_["1056"]
			local var_332_14 = 0

			if var_332_14 < arg_329_1.time_ and arg_329_1.time_ <= var_332_14 + arg_332_0 and arg_329_1.var_.actorSpriteComps1056 == nil then
				arg_329_1.var_.actorSpriteComps1056 = var_332_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_332_15 = 0.0339999999999998

			if var_332_14 <= arg_329_1.time_ and arg_329_1.time_ < var_332_14 + var_332_15 then
				local var_332_16 = (arg_329_1.time_ - var_332_14) / var_332_15

				if arg_329_1.var_.actorSpriteComps1056 then
					for iter_332_5, iter_332_6 in pairs(arg_329_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_332_6 then
							local var_332_17 = Mathf.Lerp(iter_332_6.color.r, 0.5, var_332_16)

							iter_332_6.color = Color.New(var_332_17, var_332_17, var_332_17)
						end
					end
				end
			end

			if arg_329_1.time_ >= var_332_14 + var_332_15 and arg_329_1.time_ < var_332_14 + var_332_15 + arg_332_0 and arg_329_1.var_.actorSpriteComps1056 then
				local var_332_18 = 0.5

				for iter_332_7, iter_332_8 in pairs(arg_329_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_332_8 then
						iter_332_8.color = Color.New(var_332_18, var_332_18, var_332_18)
					end
				end

				arg_329_1.var_.actorSpriteComps1056 = nil
			end

			local var_332_19 = 0
			local var_332_20 = 0.325

			if var_332_19 < arg_329_1.time_ and arg_329_1.time_ <= var_332_19 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_21 = arg_329_1:FormatText(StoryNameCfg[612].name)

				arg_329_1.leftNameTxt_.text = var_332_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_22 = arg_329_1:GetWordFromCfg(410142081)
				local var_332_23 = arg_329_1:FormatText(var_332_22.content)

				arg_329_1.text_.text = var_332_23

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_24 = 13
				local var_332_25 = utf8.len(var_332_23)
				local var_332_26 = var_332_24 <= 0 and var_332_20 or var_332_20 * (var_332_25 / var_332_24)

				if var_332_26 > 0 and var_332_20 < var_332_26 then
					arg_329_1.talkMaxDuration = var_332_26

					if var_332_26 + var_332_19 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_26 + var_332_19
					end
				end

				arg_329_1.text_.text = var_332_23
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142081", "story_v_out_410142.awb") ~= 0 then
					local var_332_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142081", "story_v_out_410142.awb") / 1000

					if var_332_27 + var_332_19 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_27 + var_332_19
					end

					if var_332_22.prefab_name ~= "" and arg_329_1.actors_[var_332_22.prefab_name] ~= nil then
						local var_332_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_22.prefab_name].transform, "story_v_out_410142", "410142081", "story_v_out_410142.awb")

						arg_329_1:RecordAudio("410142081", var_332_28)
						arg_329_1:RecordAudio("410142081", var_332_28)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_410142", "410142081", "story_v_out_410142.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_410142", "410142081", "story_v_out_410142.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_29 = math.max(var_332_20, arg_329_1.talkMaxDuration)

			if var_332_19 <= arg_329_1.time_ and arg_329_1.time_ < var_332_19 + var_332_29 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_19) / var_332_29

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_19 + var_332_29 and arg_329_1.time_ < var_332_19 + var_332_29 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play410142082 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 410142082
		arg_333_1.duration_ = 5

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play410142083(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["1056"].transform
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 then
				arg_333_1.var_.moveOldPos1056 = var_336_0.localPosition
				var_336_0.localScale = Vector3.New(1, 1, 1)

				arg_333_1:CheckSpriteTmpPos("1056", 7)

				local var_336_2 = var_336_0.childCount

				for iter_336_0 = 0, var_336_2 - 1 do
					local var_336_3 = var_336_0:GetChild(iter_336_0)

					if var_336_3.name == "" or not string.find(var_336_3.name, "split") then
						var_336_3.gameObject:SetActive(true)
					else
						var_336_3.gameObject:SetActive(false)
					end
				end
			end

			local var_336_4 = 0.001

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_4 then
				local var_336_5 = (arg_333_1.time_ - var_336_1) / var_336_4
				local var_336_6 = Vector3.New(0, -2000, -180)

				var_336_0.localPosition = Vector3.Lerp(arg_333_1.var_.moveOldPos1056, var_336_6, var_336_5)
			end

			if arg_333_1.time_ >= var_336_1 + var_336_4 and arg_333_1.time_ < var_336_1 + var_336_4 + arg_336_0 then
				var_336_0.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_336_7 = arg_333_1.actors_["1061"].transform
			local var_336_8 = 0

			if var_336_8 < arg_333_1.time_ and arg_333_1.time_ <= var_336_8 + arg_336_0 then
				arg_333_1.var_.moveOldPos1061 = var_336_7.localPosition
				var_336_7.localScale = Vector3.New(1, 1, 1)

				arg_333_1:CheckSpriteTmpPos("1061", 7)

				local var_336_9 = var_336_7.childCount

				for iter_336_1 = 0, var_336_9 - 1 do
					local var_336_10 = var_336_7:GetChild(iter_336_1)

					if var_336_10.name == "" or not string.find(var_336_10.name, "split") then
						var_336_10.gameObject:SetActive(true)
					else
						var_336_10.gameObject:SetActive(false)
					end
				end
			end

			local var_336_11 = 0.001

			if var_336_8 <= arg_333_1.time_ and arg_333_1.time_ < var_336_8 + var_336_11 then
				local var_336_12 = (arg_333_1.time_ - var_336_8) / var_336_11
				local var_336_13 = Vector3.New(0, -2000, 18)

				var_336_7.localPosition = Vector3.Lerp(arg_333_1.var_.moveOldPos1061, var_336_13, var_336_12)
			end

			if arg_333_1.time_ >= var_336_8 + var_336_11 and arg_333_1.time_ < var_336_8 + var_336_11 + arg_336_0 then
				var_336_7.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_336_14 = arg_333_1.actors_["1056"]
			local var_336_15 = 0

			if var_336_15 < arg_333_1.time_ and arg_333_1.time_ <= var_336_15 + arg_336_0 and arg_333_1.var_.actorSpriteComps1056 == nil then
				arg_333_1.var_.actorSpriteComps1056 = var_336_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_336_16 = 0.034

			if var_336_15 <= arg_333_1.time_ and arg_333_1.time_ < var_336_15 + var_336_16 then
				local var_336_17 = (arg_333_1.time_ - var_336_15) / var_336_16

				if arg_333_1.var_.actorSpriteComps1056 then
					for iter_336_2, iter_336_3 in pairs(arg_333_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_336_3 then
							local var_336_18 = Mathf.Lerp(iter_336_3.color.r, 0.5, var_336_17)

							iter_336_3.color = Color.New(var_336_18, var_336_18, var_336_18)
						end
					end
				end
			end

			if arg_333_1.time_ >= var_336_15 + var_336_16 and arg_333_1.time_ < var_336_15 + var_336_16 + arg_336_0 and arg_333_1.var_.actorSpriteComps1056 then
				local var_336_19 = 0.5

				for iter_336_4, iter_336_5 in pairs(arg_333_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_336_5 then
						iter_336_5.color = Color.New(var_336_19, var_336_19, var_336_19)
					end
				end

				arg_333_1.var_.actorSpriteComps1056 = nil
			end

			local var_336_20 = arg_333_1.actors_["1061"]
			local var_336_21 = 0

			if var_336_21 < arg_333_1.time_ and arg_333_1.time_ <= var_336_21 + arg_336_0 and arg_333_1.var_.actorSpriteComps1061 == nil then
				arg_333_1.var_.actorSpriteComps1061 = var_336_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_336_22 = 0.034

			if var_336_21 <= arg_333_1.time_ and arg_333_1.time_ < var_336_21 + var_336_22 then
				local var_336_23 = (arg_333_1.time_ - var_336_21) / var_336_22

				if arg_333_1.var_.actorSpriteComps1061 then
					for iter_336_6, iter_336_7 in pairs(arg_333_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_336_7 then
							local var_336_24 = Mathf.Lerp(iter_336_7.color.r, 0.5, var_336_23)

							iter_336_7.color = Color.New(var_336_24, var_336_24, var_336_24)
						end
					end
				end
			end

			if arg_333_1.time_ >= var_336_21 + var_336_22 and arg_333_1.time_ < var_336_21 + var_336_22 + arg_336_0 and arg_333_1.var_.actorSpriteComps1061 then
				local var_336_25 = 0.5

				for iter_336_8, iter_336_9 in pairs(arg_333_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_336_9 then
						iter_336_9.color = Color.New(var_336_25, var_336_25, var_336_25)
					end
				end

				arg_333_1.var_.actorSpriteComps1061 = nil
			end

			local var_336_26 = 0
			local var_336_27 = 1.175

			if var_336_26 < arg_333_1.time_ and arg_333_1.time_ <= var_336_26 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, false)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_28 = arg_333_1:GetWordFromCfg(410142082)
				local var_336_29 = arg_333_1:FormatText(var_336_28.content)

				arg_333_1.text_.text = var_336_29

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_30 = 47
				local var_336_31 = utf8.len(var_336_29)
				local var_336_32 = var_336_30 <= 0 and var_336_27 or var_336_27 * (var_336_31 / var_336_30)

				if var_336_32 > 0 and var_336_27 < var_336_32 then
					arg_333_1.talkMaxDuration = var_336_32

					if var_336_32 + var_336_26 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_32 + var_336_26
					end
				end

				arg_333_1.text_.text = var_336_29
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)
				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_33 = math.max(var_336_27, arg_333_1.talkMaxDuration)

			if var_336_26 <= arg_333_1.time_ and arg_333_1.time_ < var_336_26 + var_336_33 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_26) / var_336_33

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_26 + var_336_33 and arg_333_1.time_ < var_336_26 + var_336_33 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play410142083 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 410142083
		arg_337_1.duration_ = 10.5

		local var_337_0 = {
			ja = 7.766,
			CriLanguages = 10.5,
			zh = 10.5
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
				arg_337_0:Play410142084(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["1061"].transform
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 then
				arg_337_1.var_.moveOldPos1061 = var_340_0.localPosition
				var_340_0.localScale = Vector3.New(1, 1, 1)

				arg_337_1:CheckSpriteTmpPos("1061", 3)

				local var_340_2 = var_340_0.childCount

				for iter_340_0 = 0, var_340_2 - 1 do
					local var_340_3 = var_340_0:GetChild(iter_340_0)

					if var_340_3.name == "split_7" or not string.find(var_340_3.name, "split") then
						var_340_3.gameObject:SetActive(true)
					else
						var_340_3.gameObject:SetActive(false)
					end
				end
			end

			local var_340_4 = 0.001

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_4 then
				local var_340_5 = (arg_337_1.time_ - var_340_1) / var_340_4
				local var_340_6 = Vector3.New(0, -490, 18)

				var_340_0.localPosition = Vector3.Lerp(arg_337_1.var_.moveOldPos1061, var_340_6, var_340_5)
			end

			if arg_337_1.time_ >= var_340_1 + var_340_4 and arg_337_1.time_ < var_340_1 + var_340_4 + arg_340_0 then
				var_340_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_340_7 = arg_337_1.actors_["1061"]
			local var_340_8 = 0

			if var_340_8 < arg_337_1.time_ and arg_337_1.time_ <= var_340_8 + arg_340_0 and arg_337_1.var_.actorSpriteComps1061 == nil then
				arg_337_1.var_.actorSpriteComps1061 = var_340_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_340_9 = 0.034

			if var_340_8 <= arg_337_1.time_ and arg_337_1.time_ < var_340_8 + var_340_9 then
				local var_340_10 = (arg_337_1.time_ - var_340_8) / var_340_9

				if arg_337_1.var_.actorSpriteComps1061 then
					for iter_340_1, iter_340_2 in pairs(arg_337_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_340_2 then
							local var_340_11 = Mathf.Lerp(iter_340_2.color.r, 1, var_340_10)

							iter_340_2.color = Color.New(var_340_11, var_340_11, var_340_11)
						end
					end
				end
			end

			if arg_337_1.time_ >= var_340_8 + var_340_9 and arg_337_1.time_ < var_340_8 + var_340_9 + arg_340_0 and arg_337_1.var_.actorSpriteComps1061 then
				local var_340_12 = 1

				for iter_340_3, iter_340_4 in pairs(arg_337_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_340_4 then
						iter_340_4.color = Color.New(var_340_12, var_340_12, var_340_12)
					end
				end

				arg_337_1.var_.actorSpriteComps1061 = nil
			end

			local var_340_13 = 0
			local var_340_14 = 1.15

			if var_340_13 < arg_337_1.time_ and arg_337_1.time_ <= var_340_13 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_15 = arg_337_1:FormatText(StoryNameCfg[612].name)

				arg_337_1.leftNameTxt_.text = var_340_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_16 = arg_337_1:GetWordFromCfg(410142083)
				local var_340_17 = arg_337_1:FormatText(var_340_16.content)

				arg_337_1.text_.text = var_340_17

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_18 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142083", "story_v_out_410142.awb") ~= 0 then
					local var_340_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142083", "story_v_out_410142.awb") / 1000

					if var_340_21 + var_340_13 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_21 + var_340_13
					end

					if var_340_16.prefab_name ~= "" and arg_337_1.actors_[var_340_16.prefab_name] ~= nil then
						local var_340_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_16.prefab_name].transform, "story_v_out_410142", "410142083", "story_v_out_410142.awb")

						arg_337_1:RecordAudio("410142083", var_340_22)
						arg_337_1:RecordAudio("410142083", var_340_22)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_410142", "410142083", "story_v_out_410142.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_410142", "410142083", "story_v_out_410142.awb")
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
	Play410142084 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 410142084
		arg_341_1.duration_ = 11.166

		local var_341_0 = {
			ja = 11.166,
			CriLanguages = 10.966,
			zh = 10.966
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
				arg_341_0:Play410142085(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1061"].transform
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 then
				arg_341_1.var_.moveOldPos1061 = var_344_0.localPosition
				var_344_0.localScale = Vector3.New(1, 1, 1)

				arg_341_1:CheckSpriteTmpPos("1061", 3)

				local var_344_2 = var_344_0.childCount

				for iter_344_0 = 0, var_344_2 - 1 do
					local var_344_3 = var_344_0:GetChild(iter_344_0)

					if var_344_3.name == "split_7" or not string.find(var_344_3.name, "split") then
						var_344_3.gameObject:SetActive(true)
					else
						var_344_3.gameObject:SetActive(false)
					end
				end
			end

			local var_344_4 = 0.001

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_4 then
				local var_344_5 = (arg_341_1.time_ - var_344_1) / var_344_4
				local var_344_6 = Vector3.New(0, -490, 18)

				var_344_0.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPos1061, var_344_6, var_344_5)
			end

			if arg_341_1.time_ >= var_344_1 + var_344_4 and arg_341_1.time_ < var_344_1 + var_344_4 + arg_344_0 then
				var_344_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_344_7 = arg_341_1.actors_["1061"]
			local var_344_8 = 0

			if var_344_8 < arg_341_1.time_ and arg_341_1.time_ <= var_344_8 + arg_344_0 and arg_341_1.var_.actorSpriteComps1061 == nil then
				arg_341_1.var_.actorSpriteComps1061 = var_344_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_344_9 = 0.034

			if var_344_8 <= arg_341_1.time_ and arg_341_1.time_ < var_344_8 + var_344_9 then
				local var_344_10 = (arg_341_1.time_ - var_344_8) / var_344_9

				if arg_341_1.var_.actorSpriteComps1061 then
					for iter_344_1, iter_344_2 in pairs(arg_341_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_344_2 then
							local var_344_11 = Mathf.Lerp(iter_344_2.color.r, 1, var_344_10)

							iter_344_2.color = Color.New(var_344_11, var_344_11, var_344_11)
						end
					end
				end
			end

			if arg_341_1.time_ >= var_344_8 + var_344_9 and arg_341_1.time_ < var_344_8 + var_344_9 + arg_344_0 and arg_341_1.var_.actorSpriteComps1061 then
				local var_344_12 = 1

				for iter_344_3, iter_344_4 in pairs(arg_341_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_344_4 then
						iter_344_4.color = Color.New(var_344_12, var_344_12, var_344_12)
					end
				end

				arg_341_1.var_.actorSpriteComps1061 = nil
			end

			local var_344_13 = 0
			local var_344_14 = 1.05

			if var_344_13 < arg_341_1.time_ and arg_341_1.time_ <= var_344_13 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_15 = arg_341_1:FormatText(StoryNameCfg[612].name)

				arg_341_1.leftNameTxt_.text = var_344_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_16 = arg_341_1:GetWordFromCfg(410142084)
				local var_344_17 = arg_341_1:FormatText(var_344_16.content)

				arg_341_1.text_.text = var_344_17

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_18 = 43
				local var_344_19 = utf8.len(var_344_17)
				local var_344_20 = var_344_18 <= 0 and var_344_14 or var_344_14 * (var_344_19 / var_344_18)

				if var_344_20 > 0 and var_344_14 < var_344_20 then
					arg_341_1.talkMaxDuration = var_344_20

					if var_344_20 + var_344_13 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_20 + var_344_13
					end
				end

				arg_341_1.text_.text = var_344_17
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142084", "story_v_out_410142.awb") ~= 0 then
					local var_344_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142084", "story_v_out_410142.awb") / 1000

					if var_344_21 + var_344_13 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_21 + var_344_13
					end

					if var_344_16.prefab_name ~= "" and arg_341_1.actors_[var_344_16.prefab_name] ~= nil then
						local var_344_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_16.prefab_name].transform, "story_v_out_410142", "410142084", "story_v_out_410142.awb")

						arg_341_1:RecordAudio("410142084", var_344_22)
						arg_341_1:RecordAudio("410142084", var_344_22)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_410142", "410142084", "story_v_out_410142.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_410142", "410142084", "story_v_out_410142.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_23 = math.max(var_344_14, arg_341_1.talkMaxDuration)

			if var_344_13 <= arg_341_1.time_ and arg_341_1.time_ < var_344_13 + var_344_23 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_13) / var_344_23

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_13 + var_344_23 and arg_341_1.time_ < var_344_13 + var_344_23 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play410142085 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 410142085
		arg_345_1.duration_ = 7.166

		local var_345_0 = {
			ja = 6.633,
			CriLanguages = 7.166,
			zh = 7.166
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
				arg_345_0:Play410142086(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["1061"].transform
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 then
				arg_345_1.var_.moveOldPos1061 = var_348_0.localPosition
				var_348_0.localScale = Vector3.New(1, 1, 1)

				arg_345_1:CheckSpriteTmpPos("1061", 3)

				local var_348_2 = var_348_0.childCount

				for iter_348_0 = 0, var_348_2 - 1 do
					local var_348_3 = var_348_0:GetChild(iter_348_0)

					if var_348_3.name == "split_7" or not string.find(var_348_3.name, "split") then
						var_348_3.gameObject:SetActive(true)
					else
						var_348_3.gameObject:SetActive(false)
					end
				end
			end

			local var_348_4 = 0.001

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_4 then
				local var_348_5 = (arg_345_1.time_ - var_348_1) / var_348_4
				local var_348_6 = Vector3.New(0, -490, 18)

				var_348_0.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos1061, var_348_6, var_348_5)
			end

			if arg_345_1.time_ >= var_348_1 + var_348_4 and arg_345_1.time_ < var_348_1 + var_348_4 + arg_348_0 then
				var_348_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_348_7 = arg_345_1.actors_["1061"]
			local var_348_8 = 0

			if var_348_8 < arg_345_1.time_ and arg_345_1.time_ <= var_348_8 + arg_348_0 and arg_345_1.var_.actorSpriteComps1061 == nil then
				arg_345_1.var_.actorSpriteComps1061 = var_348_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_348_9 = 0.034

			if var_348_8 <= arg_345_1.time_ and arg_345_1.time_ < var_348_8 + var_348_9 then
				local var_348_10 = (arg_345_1.time_ - var_348_8) / var_348_9

				if arg_345_1.var_.actorSpriteComps1061 then
					for iter_348_1, iter_348_2 in pairs(arg_345_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_348_2 then
							local var_348_11 = Mathf.Lerp(iter_348_2.color.r, 1, var_348_10)

							iter_348_2.color = Color.New(var_348_11, var_348_11, var_348_11)
						end
					end
				end
			end

			if arg_345_1.time_ >= var_348_8 + var_348_9 and arg_345_1.time_ < var_348_8 + var_348_9 + arg_348_0 and arg_345_1.var_.actorSpriteComps1061 then
				local var_348_12 = 1

				for iter_348_3, iter_348_4 in pairs(arg_345_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_348_4 then
						iter_348_4.color = Color.New(var_348_12, var_348_12, var_348_12)
					end
				end

				arg_345_1.var_.actorSpriteComps1061 = nil
			end

			local var_348_13 = 0
			local var_348_14 = 0.425

			if var_348_13 < arg_345_1.time_ and arg_345_1.time_ <= var_348_13 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_15 = arg_345_1:FormatText(StoryNameCfg[612].name)

				arg_345_1.leftNameTxt_.text = var_348_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_16 = arg_345_1:GetWordFromCfg(410142085)
				local var_348_17 = arg_345_1:FormatText(var_348_16.content)

				arg_345_1.text_.text = var_348_17

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_18 = 17
				local var_348_19 = utf8.len(var_348_17)
				local var_348_20 = var_348_18 <= 0 and var_348_14 or var_348_14 * (var_348_19 / var_348_18)

				if var_348_20 > 0 and var_348_14 < var_348_20 then
					arg_345_1.talkMaxDuration = var_348_20

					if var_348_20 + var_348_13 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_20 + var_348_13
					end
				end

				arg_345_1.text_.text = var_348_17
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142085", "story_v_out_410142.awb") ~= 0 then
					local var_348_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142085", "story_v_out_410142.awb") / 1000

					if var_348_21 + var_348_13 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_21 + var_348_13
					end

					if var_348_16.prefab_name ~= "" and arg_345_1.actors_[var_348_16.prefab_name] ~= nil then
						local var_348_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_16.prefab_name].transform, "story_v_out_410142", "410142085", "story_v_out_410142.awb")

						arg_345_1:RecordAudio("410142085", var_348_22)
						arg_345_1:RecordAudio("410142085", var_348_22)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_410142", "410142085", "story_v_out_410142.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_410142", "410142085", "story_v_out_410142.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_23 = math.max(var_348_14, arg_345_1.talkMaxDuration)

			if var_348_13 <= arg_345_1.time_ and arg_345_1.time_ < var_348_13 + var_348_23 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_13) / var_348_23

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_13 + var_348_23 and arg_345_1.time_ < var_348_13 + var_348_23 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play410142086 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 410142086
		arg_349_1.duration_ = 5

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play410142087(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["1061"]
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 and arg_349_1.var_.actorSpriteComps1061 == nil then
				arg_349_1.var_.actorSpriteComps1061 = var_352_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_352_2 = 0.034

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_2 then
				local var_352_3 = (arg_349_1.time_ - var_352_1) / var_352_2

				if arg_349_1.var_.actorSpriteComps1061 then
					for iter_352_0, iter_352_1 in pairs(arg_349_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_352_1 then
							local var_352_4 = Mathf.Lerp(iter_352_1.color.r, 0.5, var_352_3)

							iter_352_1.color = Color.New(var_352_4, var_352_4, var_352_4)
						end
					end
				end
			end

			if arg_349_1.time_ >= var_352_1 + var_352_2 and arg_349_1.time_ < var_352_1 + var_352_2 + arg_352_0 and arg_349_1.var_.actorSpriteComps1061 then
				local var_352_5 = 0.5

				for iter_352_2, iter_352_3 in pairs(arg_349_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_352_3 then
						iter_352_3.color = Color.New(var_352_5, var_352_5, var_352_5)
					end
				end

				arg_349_1.var_.actorSpriteComps1061 = nil
			end

			local var_352_6 = 0
			local var_352_7 = 1.15

			if var_352_6 < arg_349_1.time_ and arg_349_1.time_ <= var_352_6 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, false)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_8 = arg_349_1:GetWordFromCfg(410142086)
				local var_352_9 = arg_349_1:FormatText(var_352_8.content)

				arg_349_1.text_.text = var_352_9

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_10 = 46
				local var_352_11 = utf8.len(var_352_9)
				local var_352_12 = var_352_10 <= 0 and var_352_7 or var_352_7 * (var_352_11 / var_352_10)

				if var_352_12 > 0 and var_352_7 < var_352_12 then
					arg_349_1.talkMaxDuration = var_352_12

					if var_352_12 + var_352_6 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_12 + var_352_6
					end
				end

				arg_349_1.text_.text = var_352_9
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)
				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_13 = math.max(var_352_7, arg_349_1.talkMaxDuration)

			if var_352_6 <= arg_349_1.time_ and arg_349_1.time_ < var_352_6 + var_352_13 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_6) / var_352_13

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_6 + var_352_13 and arg_349_1.time_ < var_352_6 + var_352_13 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play410142087 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 410142087
		arg_353_1.duration_ = 4.199999999999

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play410142088(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = "STblack"

			if arg_353_1.bgs_[var_356_0] == nil then
				local var_356_1 = Object.Instantiate(arg_353_1.paintGo_)

				var_356_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_356_0)
				var_356_1.name = var_356_0
				var_356_1.transform.parent = arg_353_1.stage_.transform
				var_356_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_353_1.bgs_[var_356_0] = var_356_1
			end

			local var_356_2 = 2

			if var_356_2 < arg_353_1.time_ and arg_353_1.time_ <= var_356_2 + arg_356_0 then
				local var_356_3 = manager.ui.mainCamera.transform.localPosition
				local var_356_4 = Vector3.New(0, 0, 10) + Vector3.New(var_356_3.x, var_356_3.y, 0)
				local var_356_5 = arg_353_1.bgs_.STblack

				var_356_5.transform.localPosition = var_356_4
				var_356_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_356_6 = var_356_5:GetComponent("SpriteRenderer")

				if var_356_6 and var_356_6.sprite then
					local var_356_7 = (var_356_5.transform.localPosition - var_356_3).z
					local var_356_8 = manager.ui.mainCameraCom_
					local var_356_9 = 2 * var_356_7 * Mathf.Tan(var_356_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_356_10 = var_356_9 * var_356_8.aspect
					local var_356_11 = var_356_6.sprite.bounds.size.x
					local var_356_12 = var_356_6.sprite.bounds.size.y
					local var_356_13 = var_356_10 / var_356_11
					local var_356_14 = var_356_9 / var_356_12
					local var_356_15 = var_356_14 < var_356_13 and var_356_13 or var_356_14

					var_356_5.transform.localScale = Vector3.New(var_356_15, var_356_15, 0)
				end

				for iter_356_0, iter_356_1 in pairs(arg_353_1.bgs_) do
					if iter_356_0 ~= "STblack" then
						iter_356_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_356_16 = 0

			if var_356_16 < arg_353_1.time_ and arg_353_1.time_ <= var_356_16 + arg_356_0 then
				arg_353_1.mask_.enabled = true
				arg_353_1.mask_.raycastTarget = true

				arg_353_1:SetGaussion(false)
			end

			local var_356_17 = 2

			if var_356_16 <= arg_353_1.time_ and arg_353_1.time_ < var_356_16 + var_356_17 then
				local var_356_18 = (arg_353_1.time_ - var_356_16) / var_356_17
				local var_356_19 = Color.New(0, 0, 0)

				var_356_19.a = Mathf.Lerp(0, 1, var_356_18)
				arg_353_1.mask_.color = var_356_19
			end

			if arg_353_1.time_ >= var_356_16 + var_356_17 and arg_353_1.time_ < var_356_16 + var_356_17 + arg_356_0 then
				local var_356_20 = Color.New(0, 0, 0)

				var_356_20.a = 1
				arg_353_1.mask_.color = var_356_20
			end

			local var_356_21 = 2

			if var_356_21 < arg_353_1.time_ and arg_353_1.time_ <= var_356_21 + arg_356_0 then
				arg_353_1.mask_.enabled = true
				arg_353_1.mask_.raycastTarget = true

				arg_353_1:SetGaussion(false)
			end

			local var_356_22 = 2

			if var_356_21 <= arg_353_1.time_ and arg_353_1.time_ < var_356_21 + var_356_22 then
				local var_356_23 = (arg_353_1.time_ - var_356_21) / var_356_22
				local var_356_24 = Color.New(0, 0, 0)

				var_356_24.a = Mathf.Lerp(1, 0, var_356_23)
				arg_353_1.mask_.color = var_356_24
			end

			if arg_353_1.time_ >= var_356_21 + var_356_22 and arg_353_1.time_ < var_356_21 + var_356_22 + arg_356_0 then
				local var_356_25 = Color.New(0, 0, 0)
				local var_356_26 = 0

				arg_353_1.mask_.enabled = false
				var_356_25.a = var_356_26
				arg_353_1.mask_.color = var_356_25
			end

			local var_356_27 = arg_353_1.actors_["1061"].transform
			local var_356_28 = 2

			if var_356_28 < arg_353_1.time_ and arg_353_1.time_ <= var_356_28 + arg_356_0 then
				arg_353_1.var_.moveOldPos1061 = var_356_27.localPosition
				var_356_27.localScale = Vector3.New(1, 1, 1)

				arg_353_1:CheckSpriteTmpPos("1061", 7)

				local var_356_29 = var_356_27.childCount

				for iter_356_2 = 0, var_356_29 - 1 do
					local var_356_30 = var_356_27:GetChild(iter_356_2)

					if var_356_30.name == "" or not string.find(var_356_30.name, "split") then
						var_356_30.gameObject:SetActive(true)
					else
						var_356_30.gameObject:SetActive(false)
					end
				end
			end

			local var_356_31 = 0.001

			if var_356_28 <= arg_353_1.time_ and arg_353_1.time_ < var_356_28 + var_356_31 then
				local var_356_32 = (arg_353_1.time_ - var_356_28) / var_356_31
				local var_356_33 = Vector3.New(0, -2000, 18)

				var_356_27.localPosition = Vector3.Lerp(arg_353_1.var_.moveOldPos1061, var_356_33, var_356_32)
			end

			if arg_353_1.time_ >= var_356_28 + var_356_31 and arg_353_1.time_ < var_356_28 + var_356_31 + arg_356_0 then
				var_356_27.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_356_34 = arg_353_1.actors_["1061"]
			local var_356_35 = 2

			if var_356_35 < arg_353_1.time_ and arg_353_1.time_ <= var_356_35 + arg_356_0 and arg_353_1.var_.actorSpriteComps1061 == nil then
				arg_353_1.var_.actorSpriteComps1061 = var_356_34:GetComponentsInChildren(typeof(Image), true)
			end

			local var_356_36 = 0.034

			if var_356_35 <= arg_353_1.time_ and arg_353_1.time_ < var_356_35 + var_356_36 then
				local var_356_37 = (arg_353_1.time_ - var_356_35) / var_356_36

				if arg_353_1.var_.actorSpriteComps1061 then
					for iter_356_3, iter_356_4 in pairs(arg_353_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_356_4 then
							local var_356_38 = Mathf.Lerp(iter_356_4.color.r, 0.5, var_356_37)

							iter_356_4.color = Color.New(var_356_38, var_356_38, var_356_38)
						end
					end
				end
			end

			if arg_353_1.time_ >= var_356_35 + var_356_36 and arg_353_1.time_ < var_356_35 + var_356_36 + arg_356_0 and arg_353_1.var_.actorSpriteComps1061 then
				local var_356_39 = 0.5

				for iter_356_5, iter_356_6 in pairs(arg_353_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_356_6 then
						iter_356_6.color = Color.New(var_356_39, var_356_39, var_356_39)
					end
				end

				arg_353_1.var_.actorSpriteComps1061 = nil
			end

			local var_356_40 = 2

			if var_356_40 < arg_353_1.time_ and arg_353_1.time_ <= var_356_40 + arg_356_0 then
				arg_353_1.fswbg_:SetActive(true)
				arg_353_1.dialog_:SetActive(false)

				arg_353_1.fswtw_.percent = 0

				local var_356_41 = arg_353_1:GetWordFromCfg(410142087)
				local var_356_42 = arg_353_1:FormatText(var_356_41.content)

				arg_353_1.fswt_.text = var_356_42

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.fswt_)

				arg_353_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_353_1.fswtw_:SetDirty()

				arg_353_1.typewritterCharCountI18N = 0

				SetActive(arg_353_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_353_1:ShowNextGo(false)
			end

			local var_356_43 = 4

			if var_356_43 < arg_353_1.time_ and arg_353_1.time_ <= var_356_43 + arg_356_0 then
				arg_353_1.var_.oldValueTypewriter = arg_353_1.fswtw_.percent

				arg_353_1:ShowNextGo(false)
			end

			local var_356_44 = 3
			local var_356_45 = 0.2
			local var_356_46 = arg_353_1:GetWordFromCfg(410142087)
			local var_356_47 = arg_353_1:FormatText(var_356_46.content)
			local var_356_48, var_356_49 = arg_353_1:GetPercentByPara(var_356_47, 1)

			if var_356_43 < arg_353_1.time_ and arg_353_1.time_ <= var_356_43 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0

				local var_356_50 = var_356_44 <= 0 and var_356_45 or var_356_45 * ((var_356_49 - arg_353_1.typewritterCharCountI18N) / var_356_44)

				if var_356_50 > 0 and var_356_45 < var_356_50 then
					arg_353_1.talkMaxDuration = var_356_50

					if var_356_50 + var_356_43 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_50 + var_356_43
					end
				end
			end

			local var_356_51 = 0.2
			local var_356_52 = math.max(var_356_51, arg_353_1.talkMaxDuration)

			if var_356_43 <= arg_353_1.time_ and arg_353_1.time_ < var_356_43 + var_356_52 then
				local var_356_53 = (arg_353_1.time_ - var_356_43) / var_356_52

				arg_353_1.fswtw_.percent = Mathf.Lerp(arg_353_1.var_.oldValueTypewriter, var_356_48, var_356_53)
				arg_353_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_353_1.fswtw_:SetDirty()
			end

			if arg_353_1.time_ >= var_356_43 + var_356_52 and arg_353_1.time_ < var_356_43 + var_356_52 + arg_356_0 then
				arg_353_1.fswtw_.percent = var_356_48

				arg_353_1.fswtw_:SetDirty()
				arg_353_1:ShowNextGo(true)

				arg_353_1.typewritterCharCountI18N = var_356_49
			end

			local var_356_54 = 4

			if var_356_54 < arg_353_1.time_ and arg_353_1.time_ <= var_356_54 + arg_356_0 then
				local var_356_55 = arg_353_1.fswbg_.transform:Find("textbox/adapt/content") or arg_353_1.fswbg_.transform:Find("textbox/content")
				local var_356_56 = var_356_55:GetComponent("Text")
				local var_356_57 = var_356_55:GetComponent("RectTransform")

				var_356_56.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_356_57.offsetMin = Vector2.New(0, 0)
				var_356_57.offsetMax = Vector2.New(0, 0)
			end
		end
	end,
	Play410142088 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 410142088
		arg_357_1.duration_ = 9.833

		local var_357_0 = {
			ja = 9.833,
			CriLanguages = 5.3,
			zh = 5.3
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
				arg_357_0:Play410142089(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = "L01f"

			if arg_357_1.bgs_[var_360_0] == nil then
				local var_360_1 = Object.Instantiate(arg_357_1.paintGo_)

				var_360_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_360_0)
				var_360_1.name = var_360_0
				var_360_1.transform.parent = arg_357_1.stage_.transform
				var_360_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_357_1.bgs_[var_360_0] = var_360_1
			end

			local var_360_2 = 2

			if var_360_2 < arg_357_1.time_ and arg_357_1.time_ <= var_360_2 + arg_360_0 then
				local var_360_3 = manager.ui.mainCamera.transform.localPosition
				local var_360_4 = Vector3.New(0, 0, 10) + Vector3.New(var_360_3.x, var_360_3.y, 0)
				local var_360_5 = arg_357_1.bgs_.L01f

				var_360_5.transform.localPosition = var_360_4
				var_360_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_360_6 = var_360_5:GetComponent("SpriteRenderer")

				if var_360_6 and var_360_6.sprite then
					local var_360_7 = (var_360_5.transform.localPosition - var_360_3).z
					local var_360_8 = manager.ui.mainCameraCom_
					local var_360_9 = 2 * var_360_7 * Mathf.Tan(var_360_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_360_10 = var_360_9 * var_360_8.aspect
					local var_360_11 = var_360_6.sprite.bounds.size.x
					local var_360_12 = var_360_6.sprite.bounds.size.y
					local var_360_13 = var_360_10 / var_360_11
					local var_360_14 = var_360_9 / var_360_12
					local var_360_15 = var_360_14 < var_360_13 and var_360_13 or var_360_14

					var_360_5.transform.localScale = Vector3.New(var_360_15, var_360_15, 0)
				end

				for iter_360_0, iter_360_1 in pairs(arg_357_1.bgs_) do
					if iter_360_0 ~= "L01f" then
						iter_360_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_360_16 = 0

			if var_360_16 < arg_357_1.time_ and arg_357_1.time_ <= var_360_16 + arg_360_0 then
				arg_357_1.mask_.enabled = true
				arg_357_1.mask_.raycastTarget = true

				arg_357_1:SetGaussion(false)
			end

			local var_360_17 = 2

			if var_360_16 <= arg_357_1.time_ and arg_357_1.time_ < var_360_16 + var_360_17 then
				local var_360_18 = (arg_357_1.time_ - var_360_16) / var_360_17
				local var_360_19 = Color.New(0, 0, 0)

				var_360_19.a = Mathf.Lerp(0, 1, var_360_18)
				arg_357_1.mask_.color = var_360_19
			end

			if arg_357_1.time_ >= var_360_16 + var_360_17 and arg_357_1.time_ < var_360_16 + var_360_17 + arg_360_0 then
				local var_360_20 = Color.New(0, 0, 0)

				var_360_20.a = 1
				arg_357_1.mask_.color = var_360_20
			end

			local var_360_21 = 2

			if var_360_21 < arg_357_1.time_ and arg_357_1.time_ <= var_360_21 + arg_360_0 then
				arg_357_1.mask_.enabled = true
				arg_357_1.mask_.raycastTarget = true

				arg_357_1:SetGaussion(false)
			end

			local var_360_22 = 2

			if var_360_21 <= arg_357_1.time_ and arg_357_1.time_ < var_360_21 + var_360_22 then
				local var_360_23 = (arg_357_1.time_ - var_360_21) / var_360_22
				local var_360_24 = Color.New(0, 0, 0)

				var_360_24.a = Mathf.Lerp(1, 0, var_360_23)
				arg_357_1.mask_.color = var_360_24
			end

			if arg_357_1.time_ >= var_360_21 + var_360_22 and arg_357_1.time_ < var_360_21 + var_360_22 + arg_360_0 then
				local var_360_25 = Color.New(0, 0, 0)
				local var_360_26 = 0

				arg_357_1.mask_.enabled = false
				var_360_25.a = var_360_26
				arg_357_1.mask_.color = var_360_25
			end

			local var_360_27 = arg_357_1.actors_["1056"].transform
			local var_360_28 = 4

			if var_360_28 < arg_357_1.time_ and arg_357_1.time_ <= var_360_28 + arg_360_0 then
				arg_357_1.var_.moveOldPos1056 = var_360_27.localPosition
				var_360_27.localScale = Vector3.New(1, 1, 1)

				arg_357_1:CheckSpriteTmpPos("1056", 4)

				local var_360_29 = var_360_27.childCount

				for iter_360_2 = 0, var_360_29 - 1 do
					local var_360_30 = var_360_27:GetChild(iter_360_2)

					if var_360_30.name == "split_4" or not string.find(var_360_30.name, "split") then
						var_360_30.gameObject:SetActive(true)
					else
						var_360_30.gameObject:SetActive(false)
					end
				end
			end

			local var_360_31 = 0.001

			if var_360_28 <= arg_357_1.time_ and arg_357_1.time_ < var_360_28 + var_360_31 then
				local var_360_32 = (arg_357_1.time_ - var_360_28) / var_360_31
				local var_360_33 = Vector3.New(390, -350, -180)

				var_360_27.localPosition = Vector3.Lerp(arg_357_1.var_.moveOldPos1056, var_360_33, var_360_32)
			end

			if arg_357_1.time_ >= var_360_28 + var_360_31 and arg_357_1.time_ < var_360_28 + var_360_31 + arg_360_0 then
				var_360_27.localPosition = Vector3.New(390, -350, -180)
			end

			local var_360_34 = arg_357_1.actors_["1061"].transform
			local var_360_35 = 4

			if var_360_35 < arg_357_1.time_ and arg_357_1.time_ <= var_360_35 + arg_360_0 then
				arg_357_1.var_.moveOldPos1061 = var_360_34.localPosition
				var_360_34.localScale = Vector3.New(1, 1, 1)

				arg_357_1:CheckSpriteTmpPos("1061", 2)

				local var_360_36 = var_360_34.childCount

				for iter_360_3 = 0, var_360_36 - 1 do
					local var_360_37 = var_360_34:GetChild(iter_360_3)

					if var_360_37.name == "" or not string.find(var_360_37.name, "split") then
						var_360_37.gameObject:SetActive(true)
					else
						var_360_37.gameObject:SetActive(false)
					end
				end
			end

			local var_360_38 = 0.001

			if var_360_35 <= arg_357_1.time_ and arg_357_1.time_ < var_360_35 + var_360_38 then
				local var_360_39 = (arg_357_1.time_ - var_360_35) / var_360_38
				local var_360_40 = Vector3.New(-390, -490, 18)

				var_360_34.localPosition = Vector3.Lerp(arg_357_1.var_.moveOldPos1061, var_360_40, var_360_39)
			end

			if arg_357_1.time_ >= var_360_35 + var_360_38 and arg_357_1.time_ < var_360_35 + var_360_38 + arg_360_0 then
				var_360_34.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_360_41 = arg_357_1.actors_["1056"]
			local var_360_42 = 4

			if var_360_42 < arg_357_1.time_ and arg_357_1.time_ <= var_360_42 + arg_360_0 and arg_357_1.var_.actorSpriteComps1056 == nil then
				arg_357_1.var_.actorSpriteComps1056 = var_360_41:GetComponentsInChildren(typeof(Image), true)
			end

			local var_360_43 = 0.034

			if var_360_42 <= arg_357_1.time_ and arg_357_1.time_ < var_360_42 + var_360_43 then
				local var_360_44 = (arg_357_1.time_ - var_360_42) / var_360_43

				if arg_357_1.var_.actorSpriteComps1056 then
					for iter_360_4, iter_360_5 in pairs(arg_357_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_360_5 then
							local var_360_45 = Mathf.Lerp(iter_360_5.color.r, 1, var_360_44)

							iter_360_5.color = Color.New(var_360_45, var_360_45, var_360_45)
						end
					end
				end
			end

			if arg_357_1.time_ >= var_360_42 + var_360_43 and arg_357_1.time_ < var_360_42 + var_360_43 + arg_360_0 and arg_357_1.var_.actorSpriteComps1056 then
				local var_360_46 = 1

				for iter_360_6, iter_360_7 in pairs(arg_357_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_360_7 then
						iter_360_7.color = Color.New(var_360_46, var_360_46, var_360_46)
					end
				end

				arg_357_1.var_.actorSpriteComps1056 = nil
			end

			local var_360_47 = arg_357_1.actors_["1061"]
			local var_360_48 = 4

			if var_360_48 < arg_357_1.time_ and arg_357_1.time_ <= var_360_48 + arg_360_0 and arg_357_1.var_.actorSpriteComps1061 == nil then
				arg_357_1.var_.actorSpriteComps1061 = var_360_47:GetComponentsInChildren(typeof(Image), true)
			end

			local var_360_49 = 0.034

			if var_360_48 <= arg_357_1.time_ and arg_357_1.time_ < var_360_48 + var_360_49 then
				local var_360_50 = (arg_357_1.time_ - var_360_48) / var_360_49

				if arg_357_1.var_.actorSpriteComps1061 then
					for iter_360_8, iter_360_9 in pairs(arg_357_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_360_9 then
							local var_360_51 = Mathf.Lerp(iter_360_9.color.r, 0.5, var_360_50)

							iter_360_9.color = Color.New(var_360_51, var_360_51, var_360_51)
						end
					end
				end
			end

			if arg_357_1.time_ >= var_360_48 + var_360_49 and arg_357_1.time_ < var_360_48 + var_360_49 + arg_360_0 and arg_357_1.var_.actorSpriteComps1061 then
				local var_360_52 = 0.5

				for iter_360_10, iter_360_11 in pairs(arg_357_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_360_11 then
						iter_360_11.color = Color.New(var_360_52, var_360_52, var_360_52)
					end
				end

				arg_357_1.var_.actorSpriteComps1061 = nil
			end

			local var_360_53 = 2

			if var_360_53 < arg_357_1.time_ and arg_357_1.time_ <= var_360_53 + arg_360_0 then
				arg_357_1.fswbg_:SetActive(false)
				arg_357_1.dialog_:SetActive(false)
				arg_357_1:ShowNextGo(false)
			end

			if arg_357_1.frameCnt_ <= 1 then
				arg_357_1.dialog_:SetActive(false)
			end

			local var_360_54 = 4
			local var_360_55 = 0.15

			if var_360_54 < arg_357_1.time_ and arg_357_1.time_ <= var_360_54 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0

				arg_357_1.dialog_:SetActive(true)

				local var_360_56 = LeanTween.value(arg_357_1.dialog_, 0, 1, 0.3)

				var_360_56:setOnUpdate(LuaHelper.FloatAction(function(arg_361_0)
					arg_357_1.dialogCg_.alpha = arg_361_0
				end))
				var_360_56:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_357_1.dialog_)
					var_360_56:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_357_1.duration_ = arg_357_1.duration_ + 0.3

				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_57 = arg_357_1:FormatText(StoryNameCfg[605].name)

				arg_357_1.leftNameTxt_.text = var_360_57

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_58 = arg_357_1:GetWordFromCfg(410142088)
				local var_360_59 = arg_357_1:FormatText(var_360_58.content)

				arg_357_1.text_.text = var_360_59

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_60 = 6
				local var_360_61 = utf8.len(var_360_59)
				local var_360_62 = var_360_60 <= 0 and var_360_55 or var_360_55 * (var_360_61 / var_360_60)

				if var_360_62 > 0 and var_360_55 < var_360_62 then
					arg_357_1.talkMaxDuration = var_360_62
					var_360_54 = var_360_54 + 0.3

					if var_360_62 + var_360_54 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_62 + var_360_54
					end
				end

				arg_357_1.text_.text = var_360_59
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142088", "story_v_out_410142.awb") ~= 0 then
					local var_360_63 = manager.audio:GetVoiceLength("story_v_out_410142", "410142088", "story_v_out_410142.awb") / 1000

					if var_360_63 + var_360_54 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_63 + var_360_54
					end

					if var_360_58.prefab_name ~= "" and arg_357_1.actors_[var_360_58.prefab_name] ~= nil then
						local var_360_64 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_58.prefab_name].transform, "story_v_out_410142", "410142088", "story_v_out_410142.awb")

						arg_357_1:RecordAudio("410142088", var_360_64)
						arg_357_1:RecordAudio("410142088", var_360_64)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_410142", "410142088", "story_v_out_410142.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_410142", "410142088", "story_v_out_410142.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_65 = var_360_54 + 0.3
			local var_360_66 = math.max(var_360_55, arg_357_1.talkMaxDuration)

			if var_360_65 <= arg_357_1.time_ and arg_357_1.time_ < var_360_65 + var_360_66 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_65) / var_360_66

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_65 + var_360_66 and arg_357_1.time_ < var_360_65 + var_360_66 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play410142089 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 410142089
		arg_363_1.duration_ = 5.333

		local var_363_0 = {
			ja = 5.333,
			CriLanguages = 5,
			zh = 5
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
				arg_363_0:Play410142090(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["1061"].transform
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 then
				arg_363_1.var_.moveOldPos1061 = var_366_0.localPosition
				var_366_0.localScale = Vector3.New(1, 1, 1)

				arg_363_1:CheckSpriteTmpPos("1061", 2)

				local var_366_2 = var_366_0.childCount

				for iter_366_0 = 0, var_366_2 - 1 do
					local var_366_3 = var_366_0:GetChild(iter_366_0)

					if var_366_3.name == "" or not string.find(var_366_3.name, "split") then
						var_366_3.gameObject:SetActive(true)
					else
						var_366_3.gameObject:SetActive(false)
					end
				end
			end

			local var_366_4 = 0.001

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_4 then
				local var_366_5 = (arg_363_1.time_ - var_366_1) / var_366_4
				local var_366_6 = Vector3.New(-390, -490, 18)

				var_366_0.localPosition = Vector3.Lerp(arg_363_1.var_.moveOldPos1061, var_366_6, var_366_5)
			end

			if arg_363_1.time_ >= var_366_1 + var_366_4 and arg_363_1.time_ < var_366_1 + var_366_4 + arg_366_0 then
				var_366_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_366_7 = arg_363_1.actors_["1061"]
			local var_366_8 = 0

			if var_366_8 < arg_363_1.time_ and arg_363_1.time_ <= var_366_8 + arg_366_0 and arg_363_1.var_.actorSpriteComps1061 == nil then
				arg_363_1.var_.actorSpriteComps1061 = var_366_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_366_9 = 0.034

			if var_366_8 <= arg_363_1.time_ and arg_363_1.time_ < var_366_8 + var_366_9 then
				local var_366_10 = (arg_363_1.time_ - var_366_8) / var_366_9

				if arg_363_1.var_.actorSpriteComps1061 then
					for iter_366_1, iter_366_2 in pairs(arg_363_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_366_2 then
							local var_366_11 = Mathf.Lerp(iter_366_2.color.r, 1, var_366_10)

							iter_366_2.color = Color.New(var_366_11, var_366_11, var_366_11)
						end
					end
				end
			end

			if arg_363_1.time_ >= var_366_8 + var_366_9 and arg_363_1.time_ < var_366_8 + var_366_9 + arg_366_0 and arg_363_1.var_.actorSpriteComps1061 then
				local var_366_12 = 1

				for iter_366_3, iter_366_4 in pairs(arg_363_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_366_4 then
						iter_366_4.color = Color.New(var_366_12, var_366_12, var_366_12)
					end
				end

				arg_363_1.var_.actorSpriteComps1061 = nil
			end

			local var_366_13 = arg_363_1.actors_["1056"]
			local var_366_14 = 0

			if var_366_14 < arg_363_1.time_ and arg_363_1.time_ <= var_366_14 + arg_366_0 and arg_363_1.var_.actorSpriteComps1056 == nil then
				arg_363_1.var_.actorSpriteComps1056 = var_366_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_366_15 = 0.034

			if var_366_14 <= arg_363_1.time_ and arg_363_1.time_ < var_366_14 + var_366_15 then
				local var_366_16 = (arg_363_1.time_ - var_366_14) / var_366_15

				if arg_363_1.var_.actorSpriteComps1056 then
					for iter_366_5, iter_366_6 in pairs(arg_363_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_366_6 then
							local var_366_17 = Mathf.Lerp(iter_366_6.color.r, 0.5, var_366_16)

							iter_366_6.color = Color.New(var_366_17, var_366_17, var_366_17)
						end
					end
				end
			end

			if arg_363_1.time_ >= var_366_14 + var_366_15 and arg_363_1.time_ < var_366_14 + var_366_15 + arg_366_0 and arg_363_1.var_.actorSpriteComps1056 then
				local var_366_18 = 0.5

				for iter_366_7, iter_366_8 in pairs(arg_363_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_366_8 then
						iter_366_8.color = Color.New(var_366_18, var_366_18, var_366_18)
					end
				end

				arg_363_1.var_.actorSpriteComps1056 = nil
			end

			local var_366_19 = 0
			local var_366_20 = 0.6

			if var_366_19 < arg_363_1.time_ and arg_363_1.time_ <= var_366_19 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_21 = arg_363_1:FormatText(StoryNameCfg[612].name)

				arg_363_1.leftNameTxt_.text = var_366_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_22 = arg_363_1:GetWordFromCfg(410142089)
				local var_366_23 = arg_363_1:FormatText(var_366_22.content)

				arg_363_1.text_.text = var_366_23

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_24 = 24
				local var_366_25 = utf8.len(var_366_23)
				local var_366_26 = var_366_24 <= 0 and var_366_20 or var_366_20 * (var_366_25 / var_366_24)

				if var_366_26 > 0 and var_366_20 < var_366_26 then
					arg_363_1.talkMaxDuration = var_366_26

					if var_366_26 + var_366_19 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_26 + var_366_19
					end
				end

				arg_363_1.text_.text = var_366_23
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142089", "story_v_out_410142.awb") ~= 0 then
					local var_366_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142089", "story_v_out_410142.awb") / 1000

					if var_366_27 + var_366_19 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_27 + var_366_19
					end

					if var_366_22.prefab_name ~= "" and arg_363_1.actors_[var_366_22.prefab_name] ~= nil then
						local var_366_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_22.prefab_name].transform, "story_v_out_410142", "410142089", "story_v_out_410142.awb")

						arg_363_1:RecordAudio("410142089", var_366_28)
						arg_363_1:RecordAudio("410142089", var_366_28)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_out_410142", "410142089", "story_v_out_410142.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_out_410142", "410142089", "story_v_out_410142.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_29 = math.max(var_366_20, arg_363_1.talkMaxDuration)

			if var_366_19 <= arg_363_1.time_ and arg_363_1.time_ < var_366_19 + var_366_29 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_19) / var_366_29

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_19 + var_366_29 and arg_363_1.time_ < var_366_19 + var_366_29 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play410142090 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 410142090
		arg_367_1.duration_ = 5.866

		local var_367_0 = {
			ja = 5.866,
			CriLanguages = 4.5,
			zh = 4.5
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
				arg_367_0:Play410142091(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["1056"].transform
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 then
				arg_367_1.var_.moveOldPos1056 = var_370_0.localPosition
				var_370_0.localScale = Vector3.New(1, 1, 1)

				arg_367_1:CheckSpriteTmpPos("1056", 4)

				local var_370_2 = var_370_0.childCount

				for iter_370_0 = 0, var_370_2 - 1 do
					local var_370_3 = var_370_0:GetChild(iter_370_0)

					if var_370_3.name == "split_3" or not string.find(var_370_3.name, "split") then
						var_370_3.gameObject:SetActive(true)
					else
						var_370_3.gameObject:SetActive(false)
					end
				end
			end

			local var_370_4 = 0.001

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_4 then
				local var_370_5 = (arg_367_1.time_ - var_370_1) / var_370_4
				local var_370_6 = Vector3.New(390, -350, -180)

				var_370_0.localPosition = Vector3.Lerp(arg_367_1.var_.moveOldPos1056, var_370_6, var_370_5)
			end

			if arg_367_1.time_ >= var_370_1 + var_370_4 and arg_367_1.time_ < var_370_1 + var_370_4 + arg_370_0 then
				var_370_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_370_7 = arg_367_1.actors_["1056"]
			local var_370_8 = 0

			if var_370_8 < arg_367_1.time_ and arg_367_1.time_ <= var_370_8 + arg_370_0 and arg_367_1.var_.actorSpriteComps1056 == nil then
				arg_367_1.var_.actorSpriteComps1056 = var_370_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_370_9 = 0.034

			if var_370_8 <= arg_367_1.time_ and arg_367_1.time_ < var_370_8 + var_370_9 then
				local var_370_10 = (arg_367_1.time_ - var_370_8) / var_370_9

				if arg_367_1.var_.actorSpriteComps1056 then
					for iter_370_1, iter_370_2 in pairs(arg_367_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_370_2 then
							local var_370_11 = Mathf.Lerp(iter_370_2.color.r, 1, var_370_10)

							iter_370_2.color = Color.New(var_370_11, var_370_11, var_370_11)
						end
					end
				end
			end

			if arg_367_1.time_ >= var_370_8 + var_370_9 and arg_367_1.time_ < var_370_8 + var_370_9 + arg_370_0 and arg_367_1.var_.actorSpriteComps1056 then
				local var_370_12 = 1

				for iter_370_3, iter_370_4 in pairs(arg_367_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_370_4 then
						iter_370_4.color = Color.New(var_370_12, var_370_12, var_370_12)
					end
				end

				arg_367_1.var_.actorSpriteComps1056 = nil
			end

			local var_370_13 = arg_367_1.actors_["1061"]
			local var_370_14 = 0

			if var_370_14 < arg_367_1.time_ and arg_367_1.time_ <= var_370_14 + arg_370_0 and arg_367_1.var_.actorSpriteComps1061 == nil then
				arg_367_1.var_.actorSpriteComps1061 = var_370_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_370_15 = 0.034

			if var_370_14 <= arg_367_1.time_ and arg_367_1.time_ < var_370_14 + var_370_15 then
				local var_370_16 = (arg_367_1.time_ - var_370_14) / var_370_15

				if arg_367_1.var_.actorSpriteComps1061 then
					for iter_370_5, iter_370_6 in pairs(arg_367_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_370_6 then
							local var_370_17 = Mathf.Lerp(iter_370_6.color.r, 0.5, var_370_16)

							iter_370_6.color = Color.New(var_370_17, var_370_17, var_370_17)
						end
					end
				end
			end

			if arg_367_1.time_ >= var_370_14 + var_370_15 and arg_367_1.time_ < var_370_14 + var_370_15 + arg_370_0 and arg_367_1.var_.actorSpriteComps1061 then
				local var_370_18 = 0.5

				for iter_370_7, iter_370_8 in pairs(arg_367_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_370_8 then
						iter_370_8.color = Color.New(var_370_18, var_370_18, var_370_18)
					end
				end

				arg_367_1.var_.actorSpriteComps1061 = nil
			end

			local var_370_19 = 0
			local var_370_20 = 0.6

			if var_370_19 < arg_367_1.time_ and arg_367_1.time_ <= var_370_19 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_21 = arg_367_1:FormatText(StoryNameCfg[605].name)

				arg_367_1.leftNameTxt_.text = var_370_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_22 = arg_367_1:GetWordFromCfg(410142090)
				local var_370_23 = arg_367_1:FormatText(var_370_22.content)

				arg_367_1.text_.text = var_370_23

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_24 = 24
				local var_370_25 = utf8.len(var_370_23)
				local var_370_26 = var_370_24 <= 0 and var_370_20 or var_370_20 * (var_370_25 / var_370_24)

				if var_370_26 > 0 and var_370_20 < var_370_26 then
					arg_367_1.talkMaxDuration = var_370_26

					if var_370_26 + var_370_19 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_26 + var_370_19
					end
				end

				arg_367_1.text_.text = var_370_23
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142090", "story_v_out_410142.awb") ~= 0 then
					local var_370_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142090", "story_v_out_410142.awb") / 1000

					if var_370_27 + var_370_19 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_27 + var_370_19
					end

					if var_370_22.prefab_name ~= "" and arg_367_1.actors_[var_370_22.prefab_name] ~= nil then
						local var_370_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_367_1.actors_[var_370_22.prefab_name].transform, "story_v_out_410142", "410142090", "story_v_out_410142.awb")

						arg_367_1:RecordAudio("410142090", var_370_28)
						arg_367_1:RecordAudio("410142090", var_370_28)
					else
						arg_367_1:AudioAction("play", "voice", "story_v_out_410142", "410142090", "story_v_out_410142.awb")
					end

					arg_367_1:RecordHistoryTalkVoice("story_v_out_410142", "410142090", "story_v_out_410142.awb")
				end

				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_29 = math.max(var_370_20, arg_367_1.talkMaxDuration)

			if var_370_19 <= arg_367_1.time_ and arg_367_1.time_ < var_370_19 + var_370_29 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_19) / var_370_29

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_19 + var_370_29 and arg_367_1.time_ < var_370_19 + var_370_29 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play410142091 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 410142091
		arg_371_1.duration_ = 5.4

		local var_371_0 = {
			ja = 5.4,
			CriLanguages = 2.566,
			zh = 2.566
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
				arg_371_0:Play410142092(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = arg_371_1.actors_["1061"].transform
			local var_374_1 = 0

			if var_374_1 < arg_371_1.time_ and arg_371_1.time_ <= var_374_1 + arg_374_0 then
				arg_371_1.var_.moveOldPos1061 = var_374_0.localPosition
				var_374_0.localScale = Vector3.New(1, 1, 1)

				arg_371_1:CheckSpriteTmpPos("1061", 2)

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
				local var_374_6 = Vector3.New(-390, -490, 18)

				var_374_0.localPosition = Vector3.Lerp(arg_371_1.var_.moveOldPos1061, var_374_6, var_374_5)
			end

			if arg_371_1.time_ >= var_374_1 + var_374_4 and arg_371_1.time_ < var_374_1 + var_374_4 + arg_374_0 then
				var_374_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_374_7 = arg_371_1.actors_["1061"]
			local var_374_8 = 0

			if var_374_8 < arg_371_1.time_ and arg_371_1.time_ <= var_374_8 + arg_374_0 and arg_371_1.var_.actorSpriteComps1061 == nil then
				arg_371_1.var_.actorSpriteComps1061 = var_374_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_374_9 = 0.034

			if var_374_8 <= arg_371_1.time_ and arg_371_1.time_ < var_374_8 + var_374_9 then
				local var_374_10 = (arg_371_1.time_ - var_374_8) / var_374_9

				if arg_371_1.var_.actorSpriteComps1061 then
					for iter_374_1, iter_374_2 in pairs(arg_371_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_374_2 then
							local var_374_11 = Mathf.Lerp(iter_374_2.color.r, 1, var_374_10)

							iter_374_2.color = Color.New(var_374_11, var_374_11, var_374_11)
						end
					end
				end
			end

			if arg_371_1.time_ >= var_374_8 + var_374_9 and arg_371_1.time_ < var_374_8 + var_374_9 + arg_374_0 and arg_371_1.var_.actorSpriteComps1061 then
				local var_374_12 = 1

				for iter_374_3, iter_374_4 in pairs(arg_371_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_374_4 then
						iter_374_4.color = Color.New(var_374_12, var_374_12, var_374_12)
					end
				end

				arg_371_1.var_.actorSpriteComps1061 = nil
			end

			local var_374_13 = arg_371_1.actors_["1056"]
			local var_374_14 = 0

			if var_374_14 < arg_371_1.time_ and arg_371_1.time_ <= var_374_14 + arg_374_0 and arg_371_1.var_.actorSpriteComps1056 == nil then
				arg_371_1.var_.actorSpriteComps1056 = var_374_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_374_15 = 0.034

			if var_374_14 <= arg_371_1.time_ and arg_371_1.time_ < var_374_14 + var_374_15 then
				local var_374_16 = (arg_371_1.time_ - var_374_14) / var_374_15

				if arg_371_1.var_.actorSpriteComps1056 then
					for iter_374_5, iter_374_6 in pairs(arg_371_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_374_6 then
							local var_374_17 = Mathf.Lerp(iter_374_6.color.r, 0.5, var_374_16)

							iter_374_6.color = Color.New(var_374_17, var_374_17, var_374_17)
						end
					end
				end
			end

			if arg_371_1.time_ >= var_374_14 + var_374_15 and arg_371_1.time_ < var_374_14 + var_374_15 + arg_374_0 and arg_371_1.var_.actorSpriteComps1056 then
				local var_374_18 = 0.5

				for iter_374_7, iter_374_8 in pairs(arg_371_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_374_8 then
						iter_374_8.color = Color.New(var_374_18, var_374_18, var_374_18)
					end
				end

				arg_371_1.var_.actorSpriteComps1056 = nil
			end

			local var_374_19 = 0
			local var_374_20 = 0.35

			if var_374_19 < arg_371_1.time_ and arg_371_1.time_ <= var_374_19 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, true)

				local var_374_21 = arg_371_1:FormatText(StoryNameCfg[612].name)

				arg_371_1.leftNameTxt_.text = var_374_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_371_1.leftNameTxt_.transform)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1.leftNameTxt_.text)
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_22 = arg_371_1:GetWordFromCfg(410142091)
				local var_374_23 = arg_371_1:FormatText(var_374_22.content)

				arg_371_1.text_.text = var_374_23

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_24 = 14
				local var_374_25 = utf8.len(var_374_23)
				local var_374_26 = var_374_24 <= 0 and var_374_20 or var_374_20 * (var_374_25 / var_374_24)

				if var_374_26 > 0 and var_374_20 < var_374_26 then
					arg_371_1.talkMaxDuration = var_374_26

					if var_374_26 + var_374_19 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_26 + var_374_19
					end
				end

				arg_371_1.text_.text = var_374_23
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142091", "story_v_out_410142.awb") ~= 0 then
					local var_374_27 = manager.audio:GetVoiceLength("story_v_out_410142", "410142091", "story_v_out_410142.awb") / 1000

					if var_374_27 + var_374_19 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_27 + var_374_19
					end

					if var_374_22.prefab_name ~= "" and arg_371_1.actors_[var_374_22.prefab_name] ~= nil then
						local var_374_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_371_1.actors_[var_374_22.prefab_name].transform, "story_v_out_410142", "410142091", "story_v_out_410142.awb")

						arg_371_1:RecordAudio("410142091", var_374_28)
						arg_371_1:RecordAudio("410142091", var_374_28)
					else
						arg_371_1:AudioAction("play", "voice", "story_v_out_410142", "410142091", "story_v_out_410142.awb")
					end

					arg_371_1:RecordHistoryTalkVoice("story_v_out_410142", "410142091", "story_v_out_410142.awb")
				end

				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_29 = math.max(var_374_20, arg_371_1.talkMaxDuration)

			if var_374_19 <= arg_371_1.time_ and arg_371_1.time_ < var_374_19 + var_374_29 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_19) / var_374_29

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_19 + var_374_29 and arg_371_1.time_ < var_374_19 + var_374_29 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play410142092 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 410142092
		arg_375_1.duration_ = 9.3

		local var_375_0 = {
			ja = 7.266,
			CriLanguages = 9.3,
			zh = 9.3
		}
		local var_375_1 = manager.audio:GetLocalizationFlag()

		if var_375_0[var_375_1] ~= nil then
			arg_375_1.duration_ = var_375_0[var_375_1]
		end

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play410142093(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = arg_375_1.actors_["1061"].transform
			local var_378_1 = 0

			if var_378_1 < arg_375_1.time_ and arg_375_1.time_ <= var_378_1 + arg_378_0 then
				arg_375_1.var_.moveOldPos1061 = var_378_0.localPosition
				var_378_0.localScale = Vector3.New(1, 1, 1)

				arg_375_1:CheckSpriteTmpPos("1061", 2)

				local var_378_2 = var_378_0.childCount

				for iter_378_0 = 0, var_378_2 - 1 do
					local var_378_3 = var_378_0:GetChild(iter_378_0)

					if var_378_3.name == "split_5" or not string.find(var_378_3.name, "split") then
						var_378_3.gameObject:SetActive(true)
					else
						var_378_3.gameObject:SetActive(false)
					end
				end
			end

			local var_378_4 = 0.001

			if var_378_1 <= arg_375_1.time_ and arg_375_1.time_ < var_378_1 + var_378_4 then
				local var_378_5 = (arg_375_1.time_ - var_378_1) / var_378_4
				local var_378_6 = Vector3.New(-390, -490, 18)

				var_378_0.localPosition = Vector3.Lerp(arg_375_1.var_.moveOldPos1061, var_378_6, var_378_5)
			end

			if arg_375_1.time_ >= var_378_1 + var_378_4 and arg_375_1.time_ < var_378_1 + var_378_4 + arg_378_0 then
				var_378_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_378_7 = arg_375_1.actors_["1061"]
			local var_378_8 = 0

			if var_378_8 < arg_375_1.time_ and arg_375_1.time_ <= var_378_8 + arg_378_0 and arg_375_1.var_.actorSpriteComps1061 == nil then
				arg_375_1.var_.actorSpriteComps1061 = var_378_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_378_9 = 0.034

			if var_378_8 <= arg_375_1.time_ and arg_375_1.time_ < var_378_8 + var_378_9 then
				local var_378_10 = (arg_375_1.time_ - var_378_8) / var_378_9

				if arg_375_1.var_.actorSpriteComps1061 then
					for iter_378_1, iter_378_2 in pairs(arg_375_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_378_2 then
							local var_378_11 = Mathf.Lerp(iter_378_2.color.r, 1, var_378_10)

							iter_378_2.color = Color.New(var_378_11, var_378_11, var_378_11)
						end
					end
				end
			end

			if arg_375_1.time_ >= var_378_8 + var_378_9 and arg_375_1.time_ < var_378_8 + var_378_9 + arg_378_0 and arg_375_1.var_.actorSpriteComps1061 then
				local var_378_12 = 1

				for iter_378_3, iter_378_4 in pairs(arg_375_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_378_4 then
						iter_378_4.color = Color.New(var_378_12, var_378_12, var_378_12)
					end
				end

				arg_375_1.var_.actorSpriteComps1061 = nil
			end

			local var_378_13 = 0
			local var_378_14 = 0.95

			if var_378_13 < arg_375_1.time_ and arg_375_1.time_ <= var_378_13 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_15 = arg_375_1:FormatText(StoryNameCfg[612].name)

				arg_375_1.leftNameTxt_.text = var_378_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_16 = arg_375_1:GetWordFromCfg(410142092)
				local var_378_17 = arg_375_1:FormatText(var_378_16.content)

				arg_375_1.text_.text = var_378_17

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_18 = 38
				local var_378_19 = utf8.len(var_378_17)
				local var_378_20 = var_378_18 <= 0 and var_378_14 or var_378_14 * (var_378_19 / var_378_18)

				if var_378_20 > 0 and var_378_14 < var_378_20 then
					arg_375_1.talkMaxDuration = var_378_20

					if var_378_20 + var_378_13 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_20 + var_378_13
					end
				end

				arg_375_1.text_.text = var_378_17
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142092", "story_v_out_410142.awb") ~= 0 then
					local var_378_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142092", "story_v_out_410142.awb") / 1000

					if var_378_21 + var_378_13 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_21 + var_378_13
					end

					if var_378_16.prefab_name ~= "" and arg_375_1.actors_[var_378_16.prefab_name] ~= nil then
						local var_378_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_16.prefab_name].transform, "story_v_out_410142", "410142092", "story_v_out_410142.awb")

						arg_375_1:RecordAudio("410142092", var_378_22)
						arg_375_1:RecordAudio("410142092", var_378_22)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_out_410142", "410142092", "story_v_out_410142.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_out_410142", "410142092", "story_v_out_410142.awb")
				end

				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_23 = math.max(var_378_14, arg_375_1.talkMaxDuration)

			if var_378_13 <= arg_375_1.time_ and arg_375_1.time_ < var_378_13 + var_378_23 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_13) / var_378_23

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_13 + var_378_23 and arg_375_1.time_ < var_378_13 + var_378_23 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play410142093 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 410142093
		arg_379_1.duration_ = 5

		SetActive(arg_379_1.tipsGo_, false)

		function arg_379_1.onSingleLineFinish_()
			arg_379_1.onSingleLineUpdate_ = nil
			arg_379_1.onSingleLineFinish_ = nil
			arg_379_1.state_ = "waiting"
		end

		function arg_379_1.playNext_(arg_381_0)
			if arg_381_0 == 1 then
				arg_379_0:Play410142094(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = arg_379_1.actors_["1056"].transform
			local var_382_1 = 0

			if var_382_1 < arg_379_1.time_ and arg_379_1.time_ <= var_382_1 + arg_382_0 then
				arg_379_1.var_.moveOldPos1056 = var_382_0.localPosition
				var_382_0.localScale = Vector3.New(1, 1, 1)

				arg_379_1:CheckSpriteTmpPos("1056", 7)

				local var_382_2 = var_382_0.childCount

				for iter_382_0 = 0, var_382_2 - 1 do
					local var_382_3 = var_382_0:GetChild(iter_382_0)

					if var_382_3.name == "" or not string.find(var_382_3.name, "split") then
						var_382_3.gameObject:SetActive(true)
					else
						var_382_3.gameObject:SetActive(false)
					end
				end
			end

			local var_382_4 = 0.001

			if var_382_1 <= arg_379_1.time_ and arg_379_1.time_ < var_382_1 + var_382_4 then
				local var_382_5 = (arg_379_1.time_ - var_382_1) / var_382_4
				local var_382_6 = Vector3.New(0, -2000, -180)

				var_382_0.localPosition = Vector3.Lerp(arg_379_1.var_.moveOldPos1056, var_382_6, var_382_5)
			end

			if arg_379_1.time_ >= var_382_1 + var_382_4 and arg_379_1.time_ < var_382_1 + var_382_4 + arg_382_0 then
				var_382_0.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_382_7 = arg_379_1.actors_["1061"].transform
			local var_382_8 = 0

			if var_382_8 < arg_379_1.time_ and arg_379_1.time_ <= var_382_8 + arg_382_0 then
				arg_379_1.var_.moveOldPos1061 = var_382_7.localPosition
				var_382_7.localScale = Vector3.New(1, 1, 1)

				arg_379_1:CheckSpriteTmpPos("1061", 7)

				local var_382_9 = var_382_7.childCount

				for iter_382_1 = 0, var_382_9 - 1 do
					local var_382_10 = var_382_7:GetChild(iter_382_1)

					if var_382_10.name == "" or not string.find(var_382_10.name, "split") then
						var_382_10.gameObject:SetActive(true)
					else
						var_382_10.gameObject:SetActive(false)
					end
				end
			end

			local var_382_11 = 0.001

			if var_382_8 <= arg_379_1.time_ and arg_379_1.time_ < var_382_8 + var_382_11 then
				local var_382_12 = (arg_379_1.time_ - var_382_8) / var_382_11
				local var_382_13 = Vector3.New(0, -2000, 18)

				var_382_7.localPosition = Vector3.Lerp(arg_379_1.var_.moveOldPos1061, var_382_13, var_382_12)
			end

			if arg_379_1.time_ >= var_382_8 + var_382_11 and arg_379_1.time_ < var_382_8 + var_382_11 + arg_382_0 then
				var_382_7.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_382_14 = arg_379_1.actors_["1056"]
			local var_382_15 = 0

			if var_382_15 < arg_379_1.time_ and arg_379_1.time_ <= var_382_15 + arg_382_0 and arg_379_1.var_.actorSpriteComps1056 == nil then
				arg_379_1.var_.actorSpriteComps1056 = var_382_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_382_16 = 0.034

			if var_382_15 <= arg_379_1.time_ and arg_379_1.time_ < var_382_15 + var_382_16 then
				local var_382_17 = (arg_379_1.time_ - var_382_15) / var_382_16

				if arg_379_1.var_.actorSpriteComps1056 then
					for iter_382_2, iter_382_3 in pairs(arg_379_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_382_3 then
							local var_382_18 = Mathf.Lerp(iter_382_3.color.r, 0.5, var_382_17)

							iter_382_3.color = Color.New(var_382_18, var_382_18, var_382_18)
						end
					end
				end
			end

			if arg_379_1.time_ >= var_382_15 + var_382_16 and arg_379_1.time_ < var_382_15 + var_382_16 + arg_382_0 and arg_379_1.var_.actorSpriteComps1056 then
				local var_382_19 = 0.5

				for iter_382_4, iter_382_5 in pairs(arg_379_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_382_5 then
						iter_382_5.color = Color.New(var_382_19, var_382_19, var_382_19)
					end
				end

				arg_379_1.var_.actorSpriteComps1056 = nil
			end

			local var_382_20 = arg_379_1.actors_["1061"]
			local var_382_21 = 0

			if var_382_21 < arg_379_1.time_ and arg_379_1.time_ <= var_382_21 + arg_382_0 and arg_379_1.var_.actorSpriteComps1061 == nil then
				arg_379_1.var_.actorSpriteComps1061 = var_382_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_382_22 = 0.034

			if var_382_21 <= arg_379_1.time_ and arg_379_1.time_ < var_382_21 + var_382_22 then
				local var_382_23 = (arg_379_1.time_ - var_382_21) / var_382_22

				if arg_379_1.var_.actorSpriteComps1061 then
					for iter_382_6, iter_382_7 in pairs(arg_379_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_382_7 then
							local var_382_24 = Mathf.Lerp(iter_382_7.color.r, 0.5, var_382_23)

							iter_382_7.color = Color.New(var_382_24, var_382_24, var_382_24)
						end
					end
				end
			end

			if arg_379_1.time_ >= var_382_21 + var_382_22 and arg_379_1.time_ < var_382_21 + var_382_22 + arg_382_0 and arg_379_1.var_.actorSpriteComps1061 then
				local var_382_25 = 0.5

				for iter_382_8, iter_382_9 in pairs(arg_379_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_382_9 then
						iter_382_9.color = Color.New(var_382_25, var_382_25, var_382_25)
					end
				end

				arg_379_1.var_.actorSpriteComps1061 = nil
			end

			local var_382_26 = 0
			local var_382_27 = 0.95

			if var_382_26 < arg_379_1.time_ and arg_379_1.time_ <= var_382_26 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, false)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_28 = arg_379_1:GetWordFromCfg(410142093)
				local var_382_29 = arg_379_1:FormatText(var_382_28.content)

				arg_379_1.text_.text = var_382_29

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_30 = 38
				local var_382_31 = utf8.len(var_382_29)
				local var_382_32 = var_382_30 <= 0 and var_382_27 or var_382_27 * (var_382_31 / var_382_30)

				if var_382_32 > 0 and var_382_27 < var_382_32 then
					arg_379_1.talkMaxDuration = var_382_32

					if var_382_32 + var_382_26 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_32 + var_382_26
					end
				end

				arg_379_1.text_.text = var_382_29
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)
				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_33 = math.max(var_382_27, arg_379_1.talkMaxDuration)

			if var_382_26 <= arg_379_1.time_ and arg_379_1.time_ < var_382_26 + var_382_33 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_26) / var_382_33

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_26 + var_382_33 and arg_379_1.time_ < var_382_26 + var_382_33 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play410142094 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 410142094
		arg_383_1.duration_ = 13.833

		local var_383_0 = {
			ja = 2.3,
			CriLanguages = 13.833,
			zh = 13.833
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
				arg_383_0:Play410142095(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = arg_383_1.actors_["1061"].transform
			local var_386_1 = 0

			if var_386_1 < arg_383_1.time_ and arg_383_1.time_ <= var_386_1 + arg_386_0 then
				arg_383_1.var_.moveOldPos1061 = var_386_0.localPosition
				var_386_0.localScale = Vector3.New(1, 1, 1)

				arg_383_1:CheckSpriteTmpPos("1061", 3)

				local var_386_2 = var_386_0.childCount

				for iter_386_0 = 0, var_386_2 - 1 do
					local var_386_3 = var_386_0:GetChild(iter_386_0)

					if var_386_3.name == "" or not string.find(var_386_3.name, "split") then
						var_386_3.gameObject:SetActive(true)
					else
						var_386_3.gameObject:SetActive(false)
					end
				end
			end

			local var_386_4 = 0.001

			if var_386_1 <= arg_383_1.time_ and arg_383_1.time_ < var_386_1 + var_386_4 then
				local var_386_5 = (arg_383_1.time_ - var_386_1) / var_386_4
				local var_386_6 = Vector3.New(0, -490, 18)

				var_386_0.localPosition = Vector3.Lerp(arg_383_1.var_.moveOldPos1061, var_386_6, var_386_5)
			end

			if arg_383_1.time_ >= var_386_1 + var_386_4 and arg_383_1.time_ < var_386_1 + var_386_4 + arg_386_0 then
				var_386_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_386_7 = arg_383_1.actors_["1061"]
			local var_386_8 = 0

			if var_386_8 < arg_383_1.time_ and arg_383_1.time_ <= var_386_8 + arg_386_0 and arg_383_1.var_.actorSpriteComps1061 == nil then
				arg_383_1.var_.actorSpriteComps1061 = var_386_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_386_9 = 0.034

			if var_386_8 <= arg_383_1.time_ and arg_383_1.time_ < var_386_8 + var_386_9 then
				local var_386_10 = (arg_383_1.time_ - var_386_8) / var_386_9

				if arg_383_1.var_.actorSpriteComps1061 then
					for iter_386_1, iter_386_2 in pairs(arg_383_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_386_2 then
							local var_386_11 = Mathf.Lerp(iter_386_2.color.r, 1, var_386_10)

							iter_386_2.color = Color.New(var_386_11, var_386_11, var_386_11)
						end
					end
				end
			end

			if arg_383_1.time_ >= var_386_8 + var_386_9 and arg_383_1.time_ < var_386_8 + var_386_9 + arg_386_0 and arg_383_1.var_.actorSpriteComps1061 then
				local var_386_12 = 1

				for iter_386_3, iter_386_4 in pairs(arg_383_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_386_4 then
						iter_386_4.color = Color.New(var_386_12, var_386_12, var_386_12)
					end
				end

				arg_383_1.var_.actorSpriteComps1061 = nil
			end

			local var_386_13 = 0
			local var_386_14 = 0.05

			if var_386_13 < arg_383_1.time_ and arg_383_1.time_ <= var_386_13 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, true)

				local var_386_15 = arg_383_1:FormatText(StoryNameCfg[612].name)

				arg_383_1.leftNameTxt_.text = var_386_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_383_1.leftNameTxt_.transform)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1.leftNameTxt_.text)
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_16 = arg_383_1:GetWordFromCfg(410142094)
				local var_386_17 = arg_383_1:FormatText(var_386_16.content)

				arg_383_1.text_.text = var_386_17

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_18 = 2
				local var_386_19 = utf8.len(var_386_17)
				local var_386_20 = var_386_18 <= 0 and var_386_14 or var_386_14 * (var_386_19 / var_386_18)

				if var_386_20 > 0 and var_386_14 < var_386_20 then
					arg_383_1.talkMaxDuration = var_386_20

					if var_386_20 + var_386_13 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_20 + var_386_13
					end
				end

				arg_383_1.text_.text = var_386_17
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142094", "story_v_out_410142.awb") ~= 0 then
					local var_386_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142094", "story_v_out_410142.awb") / 1000

					if var_386_21 + var_386_13 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_21 + var_386_13
					end

					if var_386_16.prefab_name ~= "" and arg_383_1.actors_[var_386_16.prefab_name] ~= nil then
						local var_386_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_383_1.actors_[var_386_16.prefab_name].transform, "story_v_out_410142", "410142094", "story_v_out_410142.awb")

						arg_383_1:RecordAudio("410142094", var_386_22)
						arg_383_1:RecordAudio("410142094", var_386_22)
					else
						arg_383_1:AudioAction("play", "voice", "story_v_out_410142", "410142094", "story_v_out_410142.awb")
					end

					arg_383_1:RecordHistoryTalkVoice("story_v_out_410142", "410142094", "story_v_out_410142.awb")
				end

				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_23 = math.max(var_386_14, arg_383_1.talkMaxDuration)

			if var_386_13 <= arg_383_1.time_ and arg_383_1.time_ < var_386_13 + var_386_23 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_13) / var_386_23

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_13 + var_386_23 and arg_383_1.time_ < var_386_13 + var_386_23 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play410142095 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 410142095
		arg_387_1.duration_ = 10.9

		local var_387_0 = {
			ja = 10.9,
			CriLanguages = 5.4,
			zh = 5.4
		}
		local var_387_1 = manager.audio:GetLocalizationFlag()

		if var_387_0[var_387_1] ~= nil then
			arg_387_1.duration_ = var_387_0[var_387_1]
		end

		SetActive(arg_387_1.tipsGo_, false)

		function arg_387_1.onSingleLineFinish_()
			arg_387_1.onSingleLineUpdate_ = nil
			arg_387_1.onSingleLineFinish_ = nil
			arg_387_1.state_ = "waiting"
		end

		function arg_387_1.playNext_(arg_389_0)
			if arg_389_0 == 1 then
				arg_387_0:Play410142096(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = arg_387_1.actors_["1061"].transform
			local var_390_1 = 0

			if var_390_1 < arg_387_1.time_ and arg_387_1.time_ <= var_390_1 + arg_390_0 then
				arg_387_1.var_.moveOldPos1061 = var_390_0.localPosition
				var_390_0.localScale = Vector3.New(1, 1, 1)

				arg_387_1:CheckSpriteTmpPos("1061", 3)

				local var_390_2 = var_390_0.childCount

				for iter_390_0 = 0, var_390_2 - 1 do
					local var_390_3 = var_390_0:GetChild(iter_390_0)

					if var_390_3.name == "split_2" or not string.find(var_390_3.name, "split") then
						var_390_3.gameObject:SetActive(true)
					else
						var_390_3.gameObject:SetActive(false)
					end
				end
			end

			local var_390_4 = 0.001

			if var_390_1 <= arg_387_1.time_ and arg_387_1.time_ < var_390_1 + var_390_4 then
				local var_390_5 = (arg_387_1.time_ - var_390_1) / var_390_4
				local var_390_6 = Vector3.New(0, -490, 18)

				var_390_0.localPosition = Vector3.Lerp(arg_387_1.var_.moveOldPos1061, var_390_6, var_390_5)
			end

			if arg_387_1.time_ >= var_390_1 + var_390_4 and arg_387_1.time_ < var_390_1 + var_390_4 + arg_390_0 then
				var_390_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_390_7 = arg_387_1.actors_["1061"]
			local var_390_8 = 0

			if var_390_8 < arg_387_1.time_ and arg_387_1.time_ <= var_390_8 + arg_390_0 and arg_387_1.var_.actorSpriteComps1061 == nil then
				arg_387_1.var_.actorSpriteComps1061 = var_390_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_390_9 = 0.034

			if var_390_8 <= arg_387_1.time_ and arg_387_1.time_ < var_390_8 + var_390_9 then
				local var_390_10 = (arg_387_1.time_ - var_390_8) / var_390_9

				if arg_387_1.var_.actorSpriteComps1061 then
					for iter_390_1, iter_390_2 in pairs(arg_387_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_390_2 then
							local var_390_11 = Mathf.Lerp(iter_390_2.color.r, 1, var_390_10)

							iter_390_2.color = Color.New(var_390_11, var_390_11, var_390_11)
						end
					end
				end
			end

			if arg_387_1.time_ >= var_390_8 + var_390_9 and arg_387_1.time_ < var_390_8 + var_390_9 + arg_390_0 and arg_387_1.var_.actorSpriteComps1061 then
				local var_390_12 = 1

				for iter_390_3, iter_390_4 in pairs(arg_387_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_390_4 then
						iter_390_4.color = Color.New(var_390_12, var_390_12, var_390_12)
					end
				end

				arg_387_1.var_.actorSpriteComps1061 = nil
			end

			local var_390_13 = 0
			local var_390_14 = 0.55

			if var_390_13 < arg_387_1.time_ and arg_387_1.time_ <= var_390_13 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_15 = arg_387_1:FormatText(StoryNameCfg[612].name)

				arg_387_1.leftNameTxt_.text = var_390_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_16 = arg_387_1:GetWordFromCfg(410142095)
				local var_390_17 = arg_387_1:FormatText(var_390_16.content)

				arg_387_1.text_.text = var_390_17

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_18 = 22
				local var_390_19 = utf8.len(var_390_17)
				local var_390_20 = var_390_18 <= 0 and var_390_14 or var_390_14 * (var_390_19 / var_390_18)

				if var_390_20 > 0 and var_390_14 < var_390_20 then
					arg_387_1.talkMaxDuration = var_390_20

					if var_390_20 + var_390_13 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_20 + var_390_13
					end
				end

				arg_387_1.text_.text = var_390_17
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142095", "story_v_out_410142.awb") ~= 0 then
					local var_390_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142095", "story_v_out_410142.awb") / 1000

					if var_390_21 + var_390_13 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_21 + var_390_13
					end

					if var_390_16.prefab_name ~= "" and arg_387_1.actors_[var_390_16.prefab_name] ~= nil then
						local var_390_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_387_1.actors_[var_390_16.prefab_name].transform, "story_v_out_410142", "410142095", "story_v_out_410142.awb")

						arg_387_1:RecordAudio("410142095", var_390_22)
						arg_387_1:RecordAudio("410142095", var_390_22)
					else
						arg_387_1:AudioAction("play", "voice", "story_v_out_410142", "410142095", "story_v_out_410142.awb")
					end

					arg_387_1:RecordHistoryTalkVoice("story_v_out_410142", "410142095", "story_v_out_410142.awb")
				end

				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_23 = math.max(var_390_14, arg_387_1.talkMaxDuration)

			if var_390_13 <= arg_387_1.time_ and arg_387_1.time_ < var_390_13 + var_390_23 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_13) / var_390_23

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_13 + var_390_23 and arg_387_1.time_ < var_390_13 + var_390_23 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play410142096 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 410142096
		arg_391_1.duration_ = 11.066

		local var_391_0 = {
			ja = 11.066,
			CriLanguages = 7.6,
			zh = 7.6
		}
		local var_391_1 = manager.audio:GetLocalizationFlag()

		if var_391_0[var_391_1] ~= nil then
			arg_391_1.duration_ = var_391_0[var_391_1]
		end

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play410142097(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = arg_391_1.actors_["1061"].transform
			local var_394_1 = 0

			if var_394_1 < arg_391_1.time_ and arg_391_1.time_ <= var_394_1 + arg_394_0 then
				arg_391_1.var_.moveOldPos1061 = var_394_0.localPosition
				var_394_0.localScale = Vector3.New(1, 1, 1)

				arg_391_1:CheckSpriteTmpPos("1061", 3)

				local var_394_2 = var_394_0.childCount

				for iter_394_0 = 0, var_394_2 - 1 do
					local var_394_3 = var_394_0:GetChild(iter_394_0)

					if var_394_3.name == "split_2" or not string.find(var_394_3.name, "split") then
						var_394_3.gameObject:SetActive(true)
					else
						var_394_3.gameObject:SetActive(false)
					end
				end
			end

			local var_394_4 = 0.001

			if var_394_1 <= arg_391_1.time_ and arg_391_1.time_ < var_394_1 + var_394_4 then
				local var_394_5 = (arg_391_1.time_ - var_394_1) / var_394_4
				local var_394_6 = Vector3.New(0, -490, 18)

				var_394_0.localPosition = Vector3.Lerp(arg_391_1.var_.moveOldPos1061, var_394_6, var_394_5)
			end

			if arg_391_1.time_ >= var_394_1 + var_394_4 and arg_391_1.time_ < var_394_1 + var_394_4 + arg_394_0 then
				var_394_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_394_7 = arg_391_1.actors_["1061"]
			local var_394_8 = 0

			if var_394_8 < arg_391_1.time_ and arg_391_1.time_ <= var_394_8 + arg_394_0 and arg_391_1.var_.actorSpriteComps1061 == nil then
				arg_391_1.var_.actorSpriteComps1061 = var_394_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_394_9 = 0.034

			if var_394_8 <= arg_391_1.time_ and arg_391_1.time_ < var_394_8 + var_394_9 then
				local var_394_10 = (arg_391_1.time_ - var_394_8) / var_394_9

				if arg_391_1.var_.actorSpriteComps1061 then
					for iter_394_1, iter_394_2 in pairs(arg_391_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_394_2 then
							local var_394_11 = Mathf.Lerp(iter_394_2.color.r, 1, var_394_10)

							iter_394_2.color = Color.New(var_394_11, var_394_11, var_394_11)
						end
					end
				end
			end

			if arg_391_1.time_ >= var_394_8 + var_394_9 and arg_391_1.time_ < var_394_8 + var_394_9 + arg_394_0 and arg_391_1.var_.actorSpriteComps1061 then
				local var_394_12 = 1

				for iter_394_3, iter_394_4 in pairs(arg_391_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_394_4 then
						iter_394_4.color = Color.New(var_394_12, var_394_12, var_394_12)
					end
				end

				arg_391_1.var_.actorSpriteComps1061 = nil
			end

			local var_394_13 = 0
			local var_394_14 = 0.675

			if var_394_13 < arg_391_1.time_ and arg_391_1.time_ <= var_394_13 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, true)

				local var_394_15 = arg_391_1:FormatText(StoryNameCfg[612].name)

				arg_391_1.leftNameTxt_.text = var_394_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_391_1.leftNameTxt_.transform)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1.leftNameTxt_.text)
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_16 = arg_391_1:GetWordFromCfg(410142096)
				local var_394_17 = arg_391_1:FormatText(var_394_16.content)

				arg_391_1.text_.text = var_394_17

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_18 = 27
				local var_394_19 = utf8.len(var_394_17)
				local var_394_20 = var_394_18 <= 0 and var_394_14 or var_394_14 * (var_394_19 / var_394_18)

				if var_394_20 > 0 and var_394_14 < var_394_20 then
					arg_391_1.talkMaxDuration = var_394_20

					if var_394_20 + var_394_13 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_20 + var_394_13
					end
				end

				arg_391_1.text_.text = var_394_17
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410142", "410142096", "story_v_out_410142.awb") ~= 0 then
					local var_394_21 = manager.audio:GetVoiceLength("story_v_out_410142", "410142096", "story_v_out_410142.awb") / 1000

					if var_394_21 + var_394_13 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_21 + var_394_13
					end

					if var_394_16.prefab_name ~= "" and arg_391_1.actors_[var_394_16.prefab_name] ~= nil then
						local var_394_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_391_1.actors_[var_394_16.prefab_name].transform, "story_v_out_410142", "410142096", "story_v_out_410142.awb")

						arg_391_1:RecordAudio("410142096", var_394_22)
						arg_391_1:RecordAudio("410142096", var_394_22)
					else
						arg_391_1:AudioAction("play", "voice", "story_v_out_410142", "410142096", "story_v_out_410142.awb")
					end

					arg_391_1:RecordHistoryTalkVoice("story_v_out_410142", "410142096", "story_v_out_410142.awb")
				end

				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_23 = math.max(var_394_14, arg_391_1.talkMaxDuration)

			if var_394_13 <= arg_391_1.time_ and arg_391_1.time_ < var_394_13 + var_394_23 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_13) / var_394_23

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_13 + var_394_23 and arg_391_1.time_ < var_394_13 + var_394_23 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play410142097 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 410142097
		arg_395_1.duration_ = 5

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play410142098(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = arg_395_1.actors_["1061"]
			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 and arg_395_1.var_.actorSpriteComps1061 == nil then
				arg_395_1.var_.actorSpriteComps1061 = var_398_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_398_2 = 0.034

			if var_398_1 <= arg_395_1.time_ and arg_395_1.time_ < var_398_1 + var_398_2 then
				local var_398_3 = (arg_395_1.time_ - var_398_1) / var_398_2

				if arg_395_1.var_.actorSpriteComps1061 then
					for iter_398_0, iter_398_1 in pairs(arg_395_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_398_1 then
							local var_398_4 = Mathf.Lerp(iter_398_1.color.r, 0.5, var_398_3)

							iter_398_1.color = Color.New(var_398_4, var_398_4, var_398_4)
						end
					end
				end
			end

			if arg_395_1.time_ >= var_398_1 + var_398_2 and arg_395_1.time_ < var_398_1 + var_398_2 + arg_398_0 and arg_395_1.var_.actorSpriteComps1061 then
				local var_398_5 = 0.5

				for iter_398_2, iter_398_3 in pairs(arg_395_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_398_3 then
						iter_398_3.color = Color.New(var_398_5, var_398_5, var_398_5)
					end
				end

				arg_395_1.var_.actorSpriteComps1061 = nil
			end

			local var_398_6 = 0
			local var_398_7 = 0.575

			if var_398_6 < arg_395_1.time_ and arg_395_1.time_ <= var_398_6 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, false)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_8 = arg_395_1:GetWordFromCfg(410142097)
				local var_398_9 = arg_395_1:FormatText(var_398_8.content)

				arg_395_1.text_.text = var_398_9

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_10 = 23
				local var_398_11 = utf8.len(var_398_9)
				local var_398_12 = var_398_10 <= 0 and var_398_7 or var_398_7 * (var_398_11 / var_398_10)

				if var_398_12 > 0 and var_398_7 < var_398_12 then
					arg_395_1.talkMaxDuration = var_398_12

					if var_398_12 + var_398_6 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_12 + var_398_6
					end
				end

				arg_395_1.text_.text = var_398_9
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)
				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_13 = math.max(var_398_7, arg_395_1.talkMaxDuration)

			if var_398_6 <= arg_395_1.time_ and arg_395_1.time_ < var_398_6 + var_398_13 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_6) / var_398_13

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_6 + var_398_13 and arg_395_1.time_ < var_398_6 + var_398_13 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play410142098 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 410142098
		arg_399_1.duration_ = 5

		SetActive(arg_399_1.tipsGo_, false)

		function arg_399_1.onSingleLineFinish_()
			arg_399_1.onSingleLineUpdate_ = nil
			arg_399_1.onSingleLineFinish_ = nil
			arg_399_1.state_ = "waiting"
			arg_399_1.auto_ = false
		end

		function arg_399_1.playNext_(arg_401_0)
			arg_399_1.onStoryFinished_()
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = 0
			local var_402_1 = 0.85

			if var_402_0 < arg_399_1.time_ and arg_399_1.time_ <= var_402_0 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, false)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_2 = arg_399_1:GetWordFromCfg(410142098)
				local var_402_3 = arg_399_1:FormatText(var_402_2.content)

				arg_399_1.text_.text = var_402_3

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_4 = 34
				local var_402_5 = utf8.len(var_402_3)
				local var_402_6 = var_402_4 <= 0 and var_402_1 or var_402_1 * (var_402_5 / var_402_4)

				if var_402_6 > 0 and var_402_1 < var_402_6 then
					arg_399_1.talkMaxDuration = var_402_6

					if var_402_6 + var_402_0 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_6 + var_402_0
					end
				end

				arg_399_1.text_.text = var_402_3
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)
				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_7 = math.max(var_402_1, arg_399_1.talkMaxDuration)

			if var_402_0 <= arg_399_1.time_ and arg_399_1.time_ < var_402_0 + var_402_7 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_0) / var_402_7

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_0 + var_402_7 and arg_399_1.time_ < var_402_0 + var_402_7 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST61",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST65",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/L01f"
	},
	voices = {
		"story_v_out_410142.awb"
	}
}
