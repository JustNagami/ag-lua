return {
	Play410202001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 410202001
		arg_1_1.duration_ = 6.966

		local var_1_0 = {
			ja = 6.966,
			CriLanguages = 5.333,
			zh = 5.333
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
				arg_1_0:Play410202002(arg_1_1)
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

			local var_4_22 = "10059"

			if arg_1_1.actors_[var_4_22] == nil then
				local var_4_23 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_4_22), arg_1_1.canvasGo_.transform)

				var_4_23.transform:SetSiblingIndex(1)

				var_4_23.name = var_4_22
				var_4_23.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_22] = var_4_23
			end

			local var_4_24 = arg_1_1.actors_["10059"].transform
			local var_4_25 = 2

			if var_4_25 < arg_1_1.time_ and arg_1_1.time_ <= var_4_25 + arg_4_0 then
				arg_1_1.var_.moveOldPos10059 = var_4_24.localPosition
				var_4_24.localScale = Vector3.New(1, 1, 1)

				arg_1_1:CheckSpriteTmpPos("10059", 3)

				local var_4_26 = var_4_24.childCount

				for iter_4_2 = 0, var_4_26 - 1 do
					local var_4_27 = var_4_24:GetChild(iter_4_2)

					if var_4_27.name == "split_3" or not string.find(var_4_27.name, "split") then
						var_4_27.gameObject:SetActive(true)
					else
						var_4_27.gameObject:SetActive(false)
					end
				end
			end

			local var_4_28 = 0.001

			if var_4_25 <= arg_1_1.time_ and arg_1_1.time_ < var_4_25 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_25) / var_4_28
				local var_4_30 = Vector3.New(0, -530, 35)

				var_4_24.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos10059, var_4_30, var_4_29)
			end

			if arg_1_1.time_ >= var_4_25 + var_4_28 and arg_1_1.time_ < var_4_25 + var_4_28 + arg_4_0 then
				var_4_24.localPosition = Vector3.New(0, -530, 35)
			end

			local var_4_31 = arg_1_1.actors_["10059"]
			local var_4_32 = 2

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 and arg_1_1.var_.actorSpriteComps10059 == nil then
				arg_1_1.var_.actorSpriteComps10059 = var_4_31:GetComponentsInChildren(typeof(Image), true)
			end

			local var_4_33 = 0.034

			if var_4_32 <= arg_1_1.time_ and arg_1_1.time_ < var_4_32 + var_4_33 then
				local var_4_34 = (arg_1_1.time_ - var_4_32) / var_4_33

				if arg_1_1.var_.actorSpriteComps10059 then
					for iter_4_3, iter_4_4 in pairs(arg_1_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_4_4 then
							local var_4_35 = Mathf.Lerp(iter_4_4.color.r, 1, var_4_34)

							iter_4_4.color = Color.New(var_4_35, var_4_35, var_4_35)
						end
					end
				end
			end

			if arg_1_1.time_ >= var_4_32 + var_4_33 and arg_1_1.time_ < var_4_32 + var_4_33 + arg_4_0 and arg_1_1.var_.actorSpriteComps10059 then
				local var_4_36 = 1

				for iter_4_5, iter_4_6 in pairs(arg_1_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_4_6 then
						iter_4_6.color = Color.New(var_4_36, var_4_36, var_4_36)
					end
				end

				arg_1_1.var_.actorSpriteComps10059 = nil
			end

			local var_4_37 = 0
			local var_4_38 = 0.166666666666667

			if var_4_37 < arg_1_1.time_ and arg_1_1.time_ <= var_4_37 + arg_4_0 then
				local var_4_39 = "play"
				local var_4_40 = "music"

				arg_1_1:AudioAction(var_4_39, var_4_40, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_41 = 0.3
			local var_4_42 = 1

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "music"

				arg_1_1:AudioAction(var_4_43, var_4_44, "bgm_activity_2_8_story_tara_building", "bgm_activity_2_8_story_tara_building", "bgm_activity_2_8_story_tara_building.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_45 = 2
			local var_4_46 = 0.35

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

				local var_4_48 = arg_1_1:FormatText(StoryNameCfg[596].name)

				arg_1_1.leftNameTxt_.text = var_4_48

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_49 = arg_1_1:GetWordFromCfg(410202001)
				local var_4_50 = arg_1_1:FormatText(var_4_49.content)

				arg_1_1.text_.text = var_4_50

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_51 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202001", "story_v_out_410202.awb") ~= 0 then
					local var_4_54 = manager.audio:GetVoiceLength("story_v_out_410202", "410202001", "story_v_out_410202.awb") / 1000

					if var_4_54 + var_4_45 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_54 + var_4_45
					end

					if var_4_49.prefab_name ~= "" and arg_1_1.actors_[var_4_49.prefab_name] ~= nil then
						local var_4_55 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_49.prefab_name].transform, "story_v_out_410202", "410202001", "story_v_out_410202.awb")

						arg_1_1:RecordAudio("410202001", var_4_55)
						arg_1_1:RecordAudio("410202001", var_4_55)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_410202", "410202001", "story_v_out_410202.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_410202", "410202001", "story_v_out_410202.awb")
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
	Play410202002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 410202002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play410202003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["10059"].transform
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				arg_7_1.var_.moveOldPos10059 = var_10_0.localPosition
				var_10_0.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("10059", 7)

				local var_10_2 = var_10_0.childCount

				for iter_10_0 = 0, var_10_2 - 1 do
					local var_10_3 = var_10_0:GetChild(iter_10_0)

					if var_10_3.name == "" or not string.find(var_10_3.name, "split") then
						var_10_3.gameObject:SetActive(true)
					else
						var_10_3.gameObject:SetActive(false)
					end
				end
			end

			local var_10_4 = 0.001

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_4 then
				local var_10_5 = (arg_7_1.time_ - var_10_1) / var_10_4
				local var_10_6 = Vector3.New(0, -2000, 35)

				var_10_0.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10059, var_10_6, var_10_5)
			end

			if arg_7_1.time_ >= var_10_1 + var_10_4 and arg_7_1.time_ < var_10_1 + var_10_4 + arg_10_0 then
				var_10_0.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_10_7 = arg_7_1.actors_["10059"]
			local var_10_8 = 0

			if var_10_8 < arg_7_1.time_ and arg_7_1.time_ <= var_10_8 + arg_10_0 and arg_7_1.var_.actorSpriteComps10059 == nil then
				arg_7_1.var_.actorSpriteComps10059 = var_10_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_9 = 0.034

			if var_10_8 <= arg_7_1.time_ and arg_7_1.time_ < var_10_8 + var_10_9 then
				local var_10_10 = (arg_7_1.time_ - var_10_8) / var_10_9

				if arg_7_1.var_.actorSpriteComps10059 then
					for iter_10_1, iter_10_2 in pairs(arg_7_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_10_2 then
							local var_10_11 = Mathf.Lerp(iter_10_2.color.r, 0.5, var_10_10)

							iter_10_2.color = Color.New(var_10_11, var_10_11, var_10_11)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_8 + var_10_9 and arg_7_1.time_ < var_10_8 + var_10_9 + arg_10_0 and arg_7_1.var_.actorSpriteComps10059 then
				local var_10_12 = 0.5

				for iter_10_3, iter_10_4 in pairs(arg_7_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_10_4 then
						iter_10_4.color = Color.New(var_10_12, var_10_12, var_10_12)
					end
				end

				arg_7_1.var_.actorSpriteComps10059 = nil
			end

			local var_10_13 = 0
			local var_10_14 = 1.075

			if var_10_13 < arg_7_1.time_ and arg_7_1.time_ <= var_10_13 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_15 = arg_7_1:GetWordFromCfg(410202002)
				local var_10_16 = arg_7_1:FormatText(var_10_15.content)

				arg_7_1.text_.text = var_10_16

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_17 = 43
				local var_10_18 = utf8.len(var_10_16)
				local var_10_19 = var_10_17 <= 0 and var_10_14 or var_10_14 * (var_10_18 / var_10_17)

				if var_10_19 > 0 and var_10_14 < var_10_19 then
					arg_7_1.talkMaxDuration = var_10_19

					if var_10_19 + var_10_13 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_19 + var_10_13
					end
				end

				arg_7_1.text_.text = var_10_16
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_20 = math.max(var_10_14, arg_7_1.talkMaxDuration)

			if var_10_13 <= arg_7_1.time_ and arg_7_1.time_ < var_10_13 + var_10_20 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_13) / var_10_20

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_13 + var_10_20 and arg_7_1.time_ < var_10_13 + var_10_20 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play410202003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 410202003
		arg_11_1.duration_ = 11.1

		local var_11_0 = {
			ja = 1.1,
			CriLanguages = 11.1,
			zh = 11.1
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
				arg_11_0:Play410202004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1061"

			if arg_11_1.actors_[var_14_0] == nil then
				local var_14_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_14_0), arg_11_1.canvasGo_.transform)

				var_14_1.transform:SetSiblingIndex(1)

				var_14_1.name = var_14_0
				var_14_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_11_1.actors_[var_14_0] = var_14_1
			end

			local var_14_2 = arg_11_1.actors_["1061"].transform
			local var_14_3 = 0

			if var_14_3 < arg_11_1.time_ and arg_11_1.time_ <= var_14_3 + arg_14_0 then
				arg_11_1.var_.moveOldPos1061 = var_14_2.localPosition
				var_14_2.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("1061", 3)

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
				local var_14_8 = Vector3.New(0, -490, 18)

				var_14_2.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1061, var_14_8, var_14_7)
			end

			if arg_11_1.time_ >= var_14_3 + var_14_6 and arg_11_1.time_ < var_14_3 + var_14_6 + arg_14_0 then
				var_14_2.localPosition = Vector3.New(0, -490, 18)
			end

			local var_14_9 = arg_11_1.actors_["1061"]
			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 and arg_11_1.var_.actorSpriteComps1061 == nil then
				arg_11_1.var_.actorSpriteComps1061 = var_14_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_11 = 0.034

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_11 then
				local var_14_12 = (arg_11_1.time_ - var_14_10) / var_14_11

				if arg_11_1.var_.actorSpriteComps1061 then
					for iter_14_1, iter_14_2 in pairs(arg_11_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_14_2 then
							local var_14_13 = Mathf.Lerp(iter_14_2.color.r, 1, var_14_12)

							iter_14_2.color = Color.New(var_14_13, var_14_13, var_14_13)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_10 + var_14_11 and arg_11_1.time_ < var_14_10 + var_14_11 + arg_14_0 and arg_11_1.var_.actorSpriteComps1061 then
				local var_14_14 = 1

				for iter_14_3, iter_14_4 in pairs(arg_11_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_14_4 then
						iter_14_4.color = Color.New(var_14_14, var_14_14, var_14_14)
					end
				end

				arg_11_1.var_.actorSpriteComps1061 = nil
			end

			local var_14_15 = 0
			local var_14_16 = 0.05

			if var_14_15 < arg_11_1.time_ and arg_11_1.time_ <= var_14_15 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_17 = arg_11_1:FormatText(StoryNameCfg[612].name)

				arg_11_1.leftNameTxt_.text = var_14_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_18 = arg_11_1:GetWordFromCfg(410202003)
				local var_14_19 = arg_11_1:FormatText(var_14_18.content)

				arg_11_1.text_.text = var_14_19

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_20 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202003", "story_v_out_410202.awb") ~= 0 then
					local var_14_23 = manager.audio:GetVoiceLength("story_v_out_410202", "410202003", "story_v_out_410202.awb") / 1000

					if var_14_23 + var_14_15 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_23 + var_14_15
					end

					if var_14_18.prefab_name ~= "" and arg_11_1.actors_[var_14_18.prefab_name] ~= nil then
						local var_14_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_18.prefab_name].transform, "story_v_out_410202", "410202003", "story_v_out_410202.awb")

						arg_11_1:RecordAudio("410202003", var_14_24)
						arg_11_1:RecordAudio("410202003", var_14_24)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_410202", "410202003", "story_v_out_410202.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_410202", "410202003", "story_v_out_410202.awb")
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
	Play410202004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 410202004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play410202005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1061"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1061 = var_18_0.localPosition
				var_18_0.localScale = Vector3.New(1, 1, 1)

				arg_15_1:CheckSpriteTmpPos("1061", 7)

				local var_18_2 = var_18_0.childCount

				for iter_18_0 = 0, var_18_2 - 1 do
					local var_18_3 = var_18_0:GetChild(iter_18_0)

					if var_18_3.name == "" or not string.find(var_18_3.name, "split") then
						var_18_3.gameObject:SetActive(true)
					else
						var_18_3.gameObject:SetActive(false)
					end
				end
			end

			local var_18_4 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_4 then
				local var_18_5 = (arg_15_1.time_ - var_18_1) / var_18_4
				local var_18_6 = Vector3.New(0, -2000, 18)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1061, var_18_6, var_18_5)
			end

			if arg_15_1.time_ >= var_18_1 + var_18_4 and arg_15_1.time_ < var_18_1 + var_18_4 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_18_7 = 0
			local var_18_8 = 1.425

			if var_18_7 < arg_15_1.time_ and arg_15_1.time_ <= var_18_7 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_9 = arg_15_1:GetWordFromCfg(410202004)
				local var_18_10 = arg_15_1:FormatText(var_18_9.content)

				arg_15_1.text_.text = var_18_10

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_11 = 57
				local var_18_12 = utf8.len(var_18_10)
				local var_18_13 = var_18_11 <= 0 and var_18_8 or var_18_8 * (var_18_12 / var_18_11)

				if var_18_13 > 0 and var_18_8 < var_18_13 then
					arg_15_1.talkMaxDuration = var_18_13

					if var_18_13 + var_18_7 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_13 + var_18_7
					end
				end

				arg_15_1.text_.text = var_18_10
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_14 = math.max(var_18_8, arg_15_1.talkMaxDuration)

			if var_18_7 <= arg_15_1.time_ and arg_15_1.time_ < var_18_7 + var_18_14 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_7) / var_18_14

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_7 + var_18_14 and arg_15_1.time_ < var_18_7 + var_18_14 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play410202005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 410202005
		arg_19_1.duration_ = 11.966

		local var_19_0 = {
			ja = 11.966,
			CriLanguages = 6.2,
			zh = 6.2
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
				arg_19_0:Play410202006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1061"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1061 = var_22_0.localPosition
				var_22_0.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("1061", 3)

				local var_22_2 = var_22_0.childCount

				for iter_22_0 = 0, var_22_2 - 1 do
					local var_22_3 = var_22_0:GetChild(iter_22_0)

					if var_22_3.name == "split_7" or not string.find(var_22_3.name, "split") then
						var_22_3.gameObject:SetActive(true)
					else
						var_22_3.gameObject:SetActive(false)
					end
				end
			end

			local var_22_4 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_4 then
				local var_22_5 = (arg_19_1.time_ - var_22_1) / var_22_4
				local var_22_6 = Vector3.New(0, -490, 18)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1061, var_22_6, var_22_5)
			end

			if arg_19_1.time_ >= var_22_1 + var_22_4 and arg_19_1.time_ < var_22_1 + var_22_4 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_22_7 = arg_19_1.actors_["1061"]
			local var_22_8 = 0

			if var_22_8 < arg_19_1.time_ and arg_19_1.time_ <= var_22_8 + arg_22_0 and arg_19_1.var_.actorSpriteComps1061 == nil then
				arg_19_1.var_.actorSpriteComps1061 = var_22_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_9 = 0.034

			if var_22_8 <= arg_19_1.time_ and arg_19_1.time_ < var_22_8 + var_22_9 then
				local var_22_10 = (arg_19_1.time_ - var_22_8) / var_22_9

				if arg_19_1.var_.actorSpriteComps1061 then
					for iter_22_1, iter_22_2 in pairs(arg_19_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_22_2 then
							local var_22_11 = Mathf.Lerp(iter_22_2.color.r, 1, var_22_10)

							iter_22_2.color = Color.New(var_22_11, var_22_11, var_22_11)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_8 + var_22_9 and arg_19_1.time_ < var_22_8 + var_22_9 + arg_22_0 and arg_19_1.var_.actorSpriteComps1061 then
				local var_22_12 = 1

				for iter_22_3, iter_22_4 in pairs(arg_19_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_22_4 then
						iter_22_4.color = Color.New(var_22_12, var_22_12, var_22_12)
					end
				end

				arg_19_1.var_.actorSpriteComps1061 = nil
			end

			local var_22_13 = 0
			local var_22_14 = 0.55

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_15 = arg_19_1:FormatText(StoryNameCfg[612].name)

				arg_19_1.leftNameTxt_.text = var_22_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_16 = arg_19_1:GetWordFromCfg(410202005)
				local var_22_17 = arg_19_1:FormatText(var_22_16.content)

				arg_19_1.text_.text = var_22_17

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_18 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202005", "story_v_out_410202.awb") ~= 0 then
					local var_22_21 = manager.audio:GetVoiceLength("story_v_out_410202", "410202005", "story_v_out_410202.awb") / 1000

					if var_22_21 + var_22_13 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_21 + var_22_13
					end

					if var_22_16.prefab_name ~= "" and arg_19_1.actors_[var_22_16.prefab_name] ~= nil then
						local var_22_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_16.prefab_name].transform, "story_v_out_410202", "410202005", "story_v_out_410202.awb")

						arg_19_1:RecordAudio("410202005", var_22_22)
						arg_19_1:RecordAudio("410202005", var_22_22)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_410202", "410202005", "story_v_out_410202.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_410202", "410202005", "story_v_out_410202.awb")
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
	Play410202006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 410202006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play410202007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1061"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.actorSpriteComps1061 == nil then
				arg_23_1.var_.actorSpriteComps1061 = var_26_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_2 = 0.034

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.actorSpriteComps1061 then
					for iter_26_0, iter_26_1 in pairs(arg_23_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_26_1 then
							local var_26_4 = Mathf.Lerp(iter_26_1.color.r, 0.5, var_26_3)

							iter_26_1.color = Color.New(var_26_4, var_26_4, var_26_4)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.actorSpriteComps1061 then
				local var_26_5 = 0.5

				for iter_26_2, iter_26_3 in pairs(arg_23_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_26_3 then
						iter_26_3.color = Color.New(var_26_5, var_26_5, var_26_5)
					end
				end

				arg_23_1.var_.actorSpriteComps1061 = nil
			end

			local var_26_6 = 0
			local var_26_7 = 0.5

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_8 = arg_23_1:GetWordFromCfg(410202006)
				local var_26_9 = arg_23_1:FormatText(var_26_8.content)

				arg_23_1.text_.text = var_26_9

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_10 = 20
				local var_26_11 = utf8.len(var_26_9)
				local var_26_12 = var_26_10 <= 0 and var_26_7 or var_26_7 * (var_26_11 / var_26_10)

				if var_26_12 > 0 and var_26_7 < var_26_12 then
					arg_23_1.talkMaxDuration = var_26_12

					if var_26_12 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_12 + var_26_6
					end
				end

				arg_23_1.text_.text = var_26_9
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_13 = math.max(var_26_7, arg_23_1.talkMaxDuration)

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_13 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_6) / var_26_13

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_6 + var_26_13 and arg_23_1.time_ < var_26_6 + var_26_13 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play410202007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 410202007
		arg_27_1.duration_ = 7.166

		local var_27_0 = {
			ja = 7.166,
			CriLanguages = 4.366,
			zh = 4.366
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
				arg_27_0:Play410202008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1061"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1061 = var_30_0.localPosition
				var_30_0.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("1061", 3)

				local var_30_2 = var_30_0.childCount

				for iter_30_0 = 0, var_30_2 - 1 do
					local var_30_3 = var_30_0:GetChild(iter_30_0)

					if var_30_3.name == "split_7" or not string.find(var_30_3.name, "split") then
						var_30_3.gameObject:SetActive(true)
					else
						var_30_3.gameObject:SetActive(false)
					end
				end
			end

			local var_30_4 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_4 then
				local var_30_5 = (arg_27_1.time_ - var_30_1) / var_30_4
				local var_30_6 = Vector3.New(0, -490, 18)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1061, var_30_6, var_30_5)
			end

			if arg_27_1.time_ >= var_30_1 + var_30_4 and arg_27_1.time_ < var_30_1 + var_30_4 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_30_7 = arg_27_1.actors_["1061"]
			local var_30_8 = 0

			if var_30_8 < arg_27_1.time_ and arg_27_1.time_ <= var_30_8 + arg_30_0 and arg_27_1.var_.actorSpriteComps1061 == nil then
				arg_27_1.var_.actorSpriteComps1061 = var_30_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_9 = 0.034

			if var_30_8 <= arg_27_1.time_ and arg_27_1.time_ < var_30_8 + var_30_9 then
				local var_30_10 = (arg_27_1.time_ - var_30_8) / var_30_9

				if arg_27_1.var_.actorSpriteComps1061 then
					for iter_30_1, iter_30_2 in pairs(arg_27_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_30_2 then
							local var_30_11 = Mathf.Lerp(iter_30_2.color.r, 1, var_30_10)

							iter_30_2.color = Color.New(var_30_11, var_30_11, var_30_11)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_8 + var_30_9 and arg_27_1.time_ < var_30_8 + var_30_9 + arg_30_0 and arg_27_1.var_.actorSpriteComps1061 then
				local var_30_12 = 1

				for iter_30_3, iter_30_4 in pairs(arg_27_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_30_4 then
						iter_30_4.color = Color.New(var_30_12, var_30_12, var_30_12)
					end
				end

				arg_27_1.var_.actorSpriteComps1061 = nil
			end

			local var_30_13 = 0
			local var_30_14 = 0.45

			if var_30_13 < arg_27_1.time_ and arg_27_1.time_ <= var_30_13 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_15 = arg_27_1:FormatText(StoryNameCfg[612].name)

				arg_27_1.leftNameTxt_.text = var_30_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_16 = arg_27_1:GetWordFromCfg(410202007)
				local var_30_17 = arg_27_1:FormatText(var_30_16.content)

				arg_27_1.text_.text = var_30_17

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_18 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202007", "story_v_out_410202.awb") ~= 0 then
					local var_30_21 = manager.audio:GetVoiceLength("story_v_out_410202", "410202007", "story_v_out_410202.awb") / 1000

					if var_30_21 + var_30_13 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_21 + var_30_13
					end

					if var_30_16.prefab_name ~= "" and arg_27_1.actors_[var_30_16.prefab_name] ~= nil then
						local var_30_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_16.prefab_name].transform, "story_v_out_410202", "410202007", "story_v_out_410202.awb")

						arg_27_1:RecordAudio("410202007", var_30_22)
						arg_27_1:RecordAudio("410202007", var_30_22)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_410202", "410202007", "story_v_out_410202.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_410202", "410202007", "story_v_out_410202.awb")
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
	Play410202008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 410202008
		arg_31_1.duration_ = 10.466

		local var_31_0 = {
			ja = 8.766,
			CriLanguages = 10.466,
			zh = 10.466
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
				arg_31_0:Play410202009(arg_31_1)
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
			local var_34_14 = 0.8

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

				local var_34_16 = arg_31_1:GetWordFromCfg(410202008)
				local var_34_17 = arg_31_1:FormatText(var_34_16.content)

				arg_31_1.text_.text = var_34_17

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_18 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202008", "story_v_out_410202.awb") ~= 0 then
					local var_34_21 = manager.audio:GetVoiceLength("story_v_out_410202", "410202008", "story_v_out_410202.awb") / 1000

					if var_34_21 + var_34_13 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_21 + var_34_13
					end

					if var_34_16.prefab_name ~= "" and arg_31_1.actors_[var_34_16.prefab_name] ~= nil then
						local var_34_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_16.prefab_name].transform, "story_v_out_410202", "410202008", "story_v_out_410202.awb")

						arg_31_1:RecordAudio("410202008", var_34_22)
						arg_31_1:RecordAudio("410202008", var_34_22)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_410202", "410202008", "story_v_out_410202.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_410202", "410202008", "story_v_out_410202.awb")
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
	Play410202009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 410202009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play410202010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1061"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1061 = var_38_0.localPosition
				var_38_0.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("1061", 7)

				local var_38_2 = var_38_0.childCount

				for iter_38_0 = 0, var_38_2 - 1 do
					local var_38_3 = var_38_0:GetChild(iter_38_0)

					if var_38_3.name == "" or not string.find(var_38_3.name, "split") then
						var_38_3.gameObject:SetActive(true)
					else
						var_38_3.gameObject:SetActive(false)
					end
				end
			end

			local var_38_4 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_4 then
				local var_38_5 = (arg_35_1.time_ - var_38_1) / var_38_4
				local var_38_6 = Vector3.New(0, -2000, 18)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1061, var_38_6, var_38_5)
			end

			if arg_35_1.time_ >= var_38_1 + var_38_4 and arg_35_1.time_ < var_38_1 + var_38_4 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_38_7 = arg_35_1.actors_["1061"]
			local var_38_8 = 0

			if var_38_8 < arg_35_1.time_ and arg_35_1.time_ <= var_38_8 + arg_38_0 and arg_35_1.var_.actorSpriteComps1061 == nil then
				arg_35_1.var_.actorSpriteComps1061 = var_38_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_9 = 0.034

			if var_38_8 <= arg_35_1.time_ and arg_35_1.time_ < var_38_8 + var_38_9 then
				local var_38_10 = (arg_35_1.time_ - var_38_8) / var_38_9

				if arg_35_1.var_.actorSpriteComps1061 then
					for iter_38_1, iter_38_2 in pairs(arg_35_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_38_2 then
							local var_38_11 = Mathf.Lerp(iter_38_2.color.r, 0.5, var_38_10)

							iter_38_2.color = Color.New(var_38_11, var_38_11, var_38_11)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_8 + var_38_9 and arg_35_1.time_ < var_38_8 + var_38_9 + arg_38_0 and arg_35_1.var_.actorSpriteComps1061 then
				local var_38_12 = 0.5

				for iter_38_3, iter_38_4 in pairs(arg_35_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_38_4 then
						iter_38_4.color = Color.New(var_38_12, var_38_12, var_38_12)
					end
				end

				arg_35_1.var_.actorSpriteComps1061 = nil
			end

			local var_38_13 = 0
			local var_38_14 = 1.225

			if var_38_13 < arg_35_1.time_ and arg_35_1.time_ <= var_38_13 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_15 = arg_35_1:GetWordFromCfg(410202009)
				local var_38_16 = arg_35_1:FormatText(var_38_15.content)

				arg_35_1.text_.text = var_38_16

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_17 = 49
				local var_38_18 = utf8.len(var_38_16)
				local var_38_19 = var_38_17 <= 0 and var_38_14 or var_38_14 * (var_38_18 / var_38_17)

				if var_38_19 > 0 and var_38_14 < var_38_19 then
					arg_35_1.talkMaxDuration = var_38_19

					if var_38_19 + var_38_13 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_19 + var_38_13
					end
				end

				arg_35_1.text_.text = var_38_16
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_20 = math.max(var_38_14, arg_35_1.talkMaxDuration)

			if var_38_13 <= arg_35_1.time_ and arg_35_1.time_ < var_38_13 + var_38_20 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_13) / var_38_20

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_13 + var_38_20 and arg_35_1.time_ < var_38_13 + var_38_20 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play410202010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 410202010
		arg_39_1.duration_ = 7.5

		local var_39_0 = {
			ja = 7.5,
			CriLanguages = 6.633,
			zh = 6.633
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
				arg_39_0:Play410202011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = "STblack"

			if arg_39_1.bgs_[var_42_0] == nil then
				local var_42_1 = Object.Instantiate(arg_39_1.paintGo_)

				var_42_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_42_0)
				var_42_1.name = var_42_0
				var_42_1.transform.parent = arg_39_1.stage_.transform
				var_42_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_39_1.bgs_[var_42_0] = var_42_1
			end

			local var_42_2 = 2

			if var_42_2 < arg_39_1.time_ and arg_39_1.time_ <= var_42_2 + arg_42_0 then
				local var_42_3 = manager.ui.mainCamera.transform.localPosition
				local var_42_4 = Vector3.New(0, 0, 10) + Vector3.New(var_42_3.x, var_42_3.y, 0)
				local var_42_5 = arg_39_1.bgs_.STblack

				var_42_5.transform.localPosition = var_42_4
				var_42_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_42_6 = var_42_5:GetComponent("SpriteRenderer")

				if var_42_6 and var_42_6.sprite then
					local var_42_7 = (var_42_5.transform.localPosition - var_42_3).z
					local var_42_8 = manager.ui.mainCameraCom_
					local var_42_9 = 2 * var_42_7 * Mathf.Tan(var_42_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_42_10 = var_42_9 * var_42_8.aspect
					local var_42_11 = var_42_6.sprite.bounds.size.x
					local var_42_12 = var_42_6.sprite.bounds.size.y
					local var_42_13 = var_42_10 / var_42_11
					local var_42_14 = var_42_9 / var_42_12
					local var_42_15 = var_42_14 < var_42_13 and var_42_13 or var_42_14

					var_42_5.transform.localScale = Vector3.New(var_42_15, var_42_15, 0)
				end

				for iter_42_0, iter_42_1 in pairs(arg_39_1.bgs_) do
					if iter_42_0 ~= "STblack" then
						iter_42_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_42_16 = 0

			if var_42_16 < arg_39_1.time_ and arg_39_1.time_ <= var_42_16 + arg_42_0 then
				arg_39_1.mask_.enabled = true
				arg_39_1.mask_.raycastTarget = true

				arg_39_1:SetGaussion(false)
			end

			local var_42_17 = 2

			if var_42_16 <= arg_39_1.time_ and arg_39_1.time_ < var_42_16 + var_42_17 then
				local var_42_18 = (arg_39_1.time_ - var_42_16) / var_42_17
				local var_42_19 = Color.New(0, 0, 0)

				var_42_19.a = Mathf.Lerp(0, 1, var_42_18)
				arg_39_1.mask_.color = var_42_19
			end

			if arg_39_1.time_ >= var_42_16 + var_42_17 and arg_39_1.time_ < var_42_16 + var_42_17 + arg_42_0 then
				local var_42_20 = Color.New(0, 0, 0)

				var_42_20.a = 1
				arg_39_1.mask_.color = var_42_20
			end

			local var_42_21 = 2

			if var_42_21 < arg_39_1.time_ and arg_39_1.time_ <= var_42_21 + arg_42_0 then
				arg_39_1.mask_.enabled = true
				arg_39_1.mask_.raycastTarget = true

				arg_39_1:SetGaussion(false)
			end

			local var_42_22 = 2

			if var_42_21 <= arg_39_1.time_ and arg_39_1.time_ < var_42_21 + var_42_22 then
				local var_42_23 = (arg_39_1.time_ - var_42_21) / var_42_22
				local var_42_24 = Color.New(0, 0, 0)

				var_42_24.a = Mathf.Lerp(1, 0, var_42_23)
				arg_39_1.mask_.color = var_42_24
			end

			if arg_39_1.time_ >= var_42_21 + var_42_22 and arg_39_1.time_ < var_42_21 + var_42_22 + arg_42_0 then
				local var_42_25 = Color.New(0, 0, 0)
				local var_42_26 = 0

				arg_39_1.mask_.enabled = false
				var_42_25.a = var_42_26
				arg_39_1.mask_.color = var_42_25
			end

			local var_42_27 = 0
			local var_42_28 = 0.166666666666667

			if var_42_27 < arg_39_1.time_ and arg_39_1.time_ <= var_42_27 + arg_42_0 then
				local var_42_29 = "play"
				local var_42_30 = "effect"

				arg_39_1:AudioAction(var_42_29, var_42_30, "se_story_side_1039", "se_story_1039_knock", "")
			end

			if arg_39_1.frameCnt_ <= 1 then
				arg_39_1.dialog_:SetActive(false)
			end

			local var_42_31 = 4
			local var_42_32 = 0.175

			if var_42_31 < arg_39_1.time_ and arg_39_1.time_ <= var_42_31 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0

				arg_39_1.dialog_:SetActive(true)

				local var_42_33 = LeanTween.value(arg_39_1.dialog_, 0, 1, 0.3)

				var_42_33:setOnUpdate(LuaHelper.FloatAction(function(arg_43_0)
					arg_39_1.dialogCg_.alpha = arg_43_0
				end))
				var_42_33:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_39_1.dialog_)
					var_42_33:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_39_1.duration_ = arg_39_1.duration_ + 0.3

				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_34 = arg_39_1:FormatText(StoryNameCfg[36].name)

				arg_39_1.leftNameTxt_.text = var_42_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_35 = arg_39_1:GetWordFromCfg(410202010)
				local var_42_36 = arg_39_1:FormatText(var_42_35.content)

				arg_39_1.text_.text = var_42_36

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_37 = 7
				local var_42_38 = utf8.len(var_42_36)
				local var_42_39 = var_42_37 <= 0 and var_42_32 or var_42_32 * (var_42_38 / var_42_37)

				if var_42_39 > 0 and var_42_32 < var_42_39 then
					arg_39_1.talkMaxDuration = var_42_39
					var_42_31 = var_42_31 + 0.3

					if var_42_39 + var_42_31 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_39 + var_42_31
					end
				end

				arg_39_1.text_.text = var_42_36
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202010", "story_v_out_410202.awb") ~= 0 then
					local var_42_40 = manager.audio:GetVoiceLength("story_v_out_410202", "410202010", "story_v_out_410202.awb") / 1000

					if var_42_40 + var_42_31 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_40 + var_42_31
					end

					if var_42_35.prefab_name ~= "" and arg_39_1.actors_[var_42_35.prefab_name] ~= nil then
						local var_42_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_35.prefab_name].transform, "story_v_out_410202", "410202010", "story_v_out_410202.awb")

						arg_39_1:RecordAudio("410202010", var_42_41)
						arg_39_1:RecordAudio("410202010", var_42_41)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_410202", "410202010", "story_v_out_410202.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_410202", "410202010", "story_v_out_410202.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_42 = var_42_31 + 0.3
			local var_42_43 = math.max(var_42_32, arg_39_1.talkMaxDuration)

			if var_42_42 <= arg_39_1.time_ and arg_39_1.time_ < var_42_42 + var_42_43 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_42) / var_42_43

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_42 + var_42_43 and arg_39_1.time_ < var_42_42 + var_42_43 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play410202011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 410202011
		arg_45_1.duration_ = 3.4

		local var_45_0 = {
			ja = 3.4,
			CriLanguages = 3.066,
			zh = 3.066
		}
		local var_45_1 = manager.audio:GetLocalizationFlag()

		if var_45_0[var_45_1] ~= nil then
			arg_45_1.duration_ = var_45_0[var_45_1]
		end

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play410202012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = 0
			local var_48_1 = 0.15

			if var_48_0 < arg_45_1.time_ and arg_45_1.time_ <= var_48_0 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_2 = arg_45_1:FormatText(StoryNameCfg[612].name)

				arg_45_1.leftNameTxt_.text = var_48_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, true)
				arg_45_1.iconController_:SetSelectedState("hero")

				arg_45_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1061")

				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_3 = arg_45_1:GetWordFromCfg(410202011)
				local var_48_4 = arg_45_1:FormatText(var_48_3.content)

				arg_45_1.text_.text = var_48_4

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_5 = 6
				local var_48_6 = utf8.len(var_48_4)
				local var_48_7 = var_48_5 <= 0 and var_48_1 or var_48_1 * (var_48_6 / var_48_5)

				if var_48_7 > 0 and var_48_1 < var_48_7 then
					arg_45_1.talkMaxDuration = var_48_7

					if var_48_7 + var_48_0 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_7 + var_48_0
					end
				end

				arg_45_1.text_.text = var_48_4
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202011", "story_v_out_410202.awb") ~= 0 then
					local var_48_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202011", "story_v_out_410202.awb") / 1000

					if var_48_8 + var_48_0 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_8 + var_48_0
					end

					if var_48_3.prefab_name ~= "" and arg_45_1.actors_[var_48_3.prefab_name] ~= nil then
						local var_48_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_3.prefab_name].transform, "story_v_out_410202", "410202011", "story_v_out_410202.awb")

						arg_45_1:RecordAudio("410202011", var_48_9)
						arg_45_1:RecordAudio("410202011", var_48_9)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_410202", "410202011", "story_v_out_410202.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_410202", "410202011", "story_v_out_410202.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_10 = math.max(var_48_1, arg_45_1.talkMaxDuration)

			if var_48_0 <= arg_45_1.time_ and arg_45_1.time_ < var_48_0 + var_48_10 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_0) / var_48_10

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_0 + var_48_10 and arg_45_1.time_ < var_48_0 + var_48_10 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play410202012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 410202012
		arg_49_1.duration_ = 7

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play410202013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = "LZ0204"

			if arg_49_1.bgs_[var_52_0] == nil then
				local var_52_1 = Object.Instantiate(arg_49_1.paintGo_)

				var_52_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_52_0)
				var_52_1.name = var_52_0
				var_52_1.transform.parent = arg_49_1.stage_.transform
				var_52_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_49_1.bgs_[var_52_0] = var_52_1
			end

			local var_52_2 = 0

			if var_52_2 < arg_49_1.time_ and arg_49_1.time_ <= var_52_2 + arg_52_0 then
				local var_52_3 = manager.ui.mainCamera.transform.localPosition
				local var_52_4 = Vector3.New(0, 0, 10) + Vector3.New(var_52_3.x, var_52_3.y, 0)
				local var_52_5 = arg_49_1.bgs_.LZ0204

				var_52_5.transform.localPosition = var_52_4
				var_52_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_52_6 = var_52_5:GetComponent("SpriteRenderer")

				if var_52_6 and var_52_6.sprite then
					local var_52_7 = (var_52_5.transform.localPosition - var_52_3).z
					local var_52_8 = manager.ui.mainCameraCom_
					local var_52_9 = 2 * var_52_7 * Mathf.Tan(var_52_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_52_10 = var_52_9 * var_52_8.aspect
					local var_52_11 = var_52_6.sprite.bounds.size.x
					local var_52_12 = var_52_6.sprite.bounds.size.y
					local var_52_13 = var_52_10 / var_52_11
					local var_52_14 = var_52_9 / var_52_12
					local var_52_15 = var_52_14 < var_52_13 and var_52_13 or var_52_14

					var_52_5.transform.localScale = Vector3.New(var_52_15, var_52_15, 0)
				end

				for iter_52_0, iter_52_1 in pairs(arg_49_1.bgs_) do
					if iter_52_0 ~= "LZ0204" then
						iter_52_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_52_16 = 0

			if var_52_16 < arg_49_1.time_ and arg_49_1.time_ <= var_52_16 + arg_52_0 then
				arg_49_1.mask_.enabled = true
				arg_49_1.mask_.raycastTarget = true

				arg_49_1:SetGaussion(false)
			end

			local var_52_17 = 2

			if var_52_16 <= arg_49_1.time_ and arg_49_1.time_ < var_52_16 + var_52_17 then
				local var_52_18 = (arg_49_1.time_ - var_52_16) / var_52_17
				local var_52_19 = Color.New(0, 0, 0)

				var_52_19.a = Mathf.Lerp(1, 0, var_52_18)
				arg_49_1.mask_.color = var_52_19
			end

			if arg_49_1.time_ >= var_52_16 + var_52_17 and arg_49_1.time_ < var_52_16 + var_52_17 + arg_52_0 then
				local var_52_20 = Color.New(0, 0, 0)
				local var_52_21 = 0

				arg_49_1.mask_.enabled = false
				var_52_20.a = var_52_21
				arg_49_1.mask_.color = var_52_20
			end

			if arg_49_1.frameCnt_ <= 1 then
				arg_49_1.dialog_:SetActive(false)
			end

			local var_52_22 = 2
			local var_52_23 = 0.95

			if var_52_22 < arg_49_1.time_ and arg_49_1.time_ <= var_52_22 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0

				arg_49_1.dialog_:SetActive(true)

				local var_52_24 = LeanTween.value(arg_49_1.dialog_, 0, 1, 0.3)

				var_52_24:setOnUpdate(LuaHelper.FloatAction(function(arg_53_0)
					arg_49_1.dialogCg_.alpha = arg_53_0
				end))
				var_52_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_49_1.dialog_)
					var_52_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_49_1.duration_ = arg_49_1.duration_ + 0.3

				SetActive(arg_49_1.leftNameGo_, false)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_25 = arg_49_1:GetWordFromCfg(410202012)
				local var_52_26 = arg_49_1:FormatText(var_52_25.content)

				arg_49_1.text_.text = var_52_26

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_27 = 38
				local var_52_28 = utf8.len(var_52_26)
				local var_52_29 = var_52_27 <= 0 and var_52_23 or var_52_23 * (var_52_28 / var_52_27)

				if var_52_29 > 0 and var_52_23 < var_52_29 then
					arg_49_1.talkMaxDuration = var_52_29
					var_52_22 = var_52_22 + 0.3

					if var_52_29 + var_52_22 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_29 + var_52_22
					end
				end

				arg_49_1.text_.text = var_52_26
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)
				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_30 = var_52_22 + 0.3
			local var_52_31 = math.max(var_52_23, arg_49_1.talkMaxDuration)

			if var_52_30 <= arg_49_1.time_ and arg_49_1.time_ < var_52_30 + var_52_31 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_30) / var_52_31

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_30 + var_52_31 and arg_49_1.time_ < var_52_30 + var_52_31 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play410202013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 410202013
		arg_55_1.duration_ = 11.7

		local var_55_0 = {
			ja = 11.7,
			CriLanguages = 9.1,
			zh = 9.1
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
				arg_55_0:Play410202014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.575

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[612].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(410202013)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 23
				local var_58_6 = utf8.len(var_58_4)
				local var_58_7 = var_58_5 <= 0 and var_58_1 or var_58_1 * (var_58_6 / var_58_5)

				if var_58_7 > 0 and var_58_1 < var_58_7 then
					arg_55_1.talkMaxDuration = var_58_7

					if var_58_7 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_7 + var_58_0
					end
				end

				arg_55_1.text_.text = var_58_4
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202013", "story_v_out_410202.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202013", "story_v_out_410202.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_410202", "410202013", "story_v_out_410202.awb")

						arg_55_1:RecordAudio("410202013", var_58_9)
						arg_55_1:RecordAudio("410202013", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_410202", "410202013", "story_v_out_410202.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_410202", "410202013", "story_v_out_410202.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_10 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_10 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_10

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_10 and arg_55_1.time_ < var_58_0 + var_58_10 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play410202014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 410202014
		arg_59_1.duration_ = 10.3

		local var_59_0 = {
			ja = 10.3,
			CriLanguages = 6.7,
			zh = 6.7
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
				arg_59_0:Play410202015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.625

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[597].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(410202014)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202014", "story_v_out_410202.awb") ~= 0 then
					local var_62_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202014", "story_v_out_410202.awb") / 1000

					if var_62_8 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_0
					end

					if var_62_3.prefab_name ~= "" and arg_59_1.actors_[var_62_3.prefab_name] ~= nil then
						local var_62_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_3.prefab_name].transform, "story_v_out_410202", "410202014", "story_v_out_410202.awb")

						arg_59_1:RecordAudio("410202014", var_62_9)
						arg_59_1:RecordAudio("410202014", var_62_9)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_410202", "410202014", "story_v_out_410202.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_410202", "410202014", "story_v_out_410202.awb")
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
	Play410202015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 410202015
		arg_63_1.duration_ = 11.966

		local var_63_0 = {
			ja = 11.966,
			CriLanguages = 6.566,
			zh = 6.566
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
				arg_63_0:Play410202016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 0.65

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_2 = arg_63_1:FormatText(StoryNameCfg[612].name)

				arg_63_1.leftNameTxt_.text = var_66_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_3 = arg_63_1:GetWordFromCfg(410202015)
				local var_66_4 = arg_63_1:FormatText(var_66_3.content)

				arg_63_1.text_.text = var_66_4

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_5 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202015", "story_v_out_410202.awb") ~= 0 then
					local var_66_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202015", "story_v_out_410202.awb") / 1000

					if var_66_8 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_8 + var_66_0
					end

					if var_66_3.prefab_name ~= "" and arg_63_1.actors_[var_66_3.prefab_name] ~= nil then
						local var_66_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_3.prefab_name].transform, "story_v_out_410202", "410202015", "story_v_out_410202.awb")

						arg_63_1:RecordAudio("410202015", var_66_9)
						arg_63_1:RecordAudio("410202015", var_66_9)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_410202", "410202015", "story_v_out_410202.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_410202", "410202015", "story_v_out_410202.awb")
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
	Play410202016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 410202016
		arg_67_1.duration_ = 9.2

		local var_67_0 = {
			ja = 9.2,
			CriLanguages = 7.4,
			zh = 7.4
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
				arg_67_0:Play410202017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 0.875

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_2 = arg_67_1:FormatText(StoryNameCfg[597].name)

				arg_67_1.leftNameTxt_.text = var_70_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_3 = arg_67_1:GetWordFromCfg(410202016)
				local var_70_4 = arg_67_1:FormatText(var_70_3.content)

				arg_67_1.text_.text = var_70_4

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_5 = 35
				local var_70_6 = utf8.len(var_70_4)
				local var_70_7 = var_70_5 <= 0 and var_70_1 or var_70_1 * (var_70_6 / var_70_5)

				if var_70_7 > 0 and var_70_1 < var_70_7 then
					arg_67_1.talkMaxDuration = var_70_7

					if var_70_7 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_7 + var_70_0
					end
				end

				arg_67_1.text_.text = var_70_4
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202016", "story_v_out_410202.awb") ~= 0 then
					local var_70_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202016", "story_v_out_410202.awb") / 1000

					if var_70_8 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_8 + var_70_0
					end

					if var_70_3.prefab_name ~= "" and arg_67_1.actors_[var_70_3.prefab_name] ~= nil then
						local var_70_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_3.prefab_name].transform, "story_v_out_410202", "410202016", "story_v_out_410202.awb")

						arg_67_1:RecordAudio("410202016", var_70_9)
						arg_67_1:RecordAudio("410202016", var_70_9)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_410202", "410202016", "story_v_out_410202.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_410202", "410202016", "story_v_out_410202.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_10 = math.max(var_70_1, arg_67_1.talkMaxDuration)

			if var_70_0 <= arg_67_1.time_ and arg_67_1.time_ < var_70_0 + var_70_10 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_0) / var_70_10

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_0 + var_70_10 and arg_67_1.time_ < var_70_0 + var_70_10 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play410202017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 410202017
		arg_71_1.duration_ = 9.266

		local var_71_0 = {
			ja = 9.266,
			CriLanguages = 7.033,
			zh = 7.033
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
				arg_71_0:Play410202018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 0.675

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_2 = arg_71_1:FormatText(StoryNameCfg[597].name)

				arg_71_1.leftNameTxt_.text = var_74_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_3 = arg_71_1:GetWordFromCfg(410202017)
				local var_74_4 = arg_71_1:FormatText(var_74_3.content)

				arg_71_1.text_.text = var_74_4

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_5 = 27
				local var_74_6 = utf8.len(var_74_4)
				local var_74_7 = var_74_5 <= 0 and var_74_1 or var_74_1 * (var_74_6 / var_74_5)

				if var_74_7 > 0 and var_74_1 < var_74_7 then
					arg_71_1.talkMaxDuration = var_74_7

					if var_74_7 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_7 + var_74_0
					end
				end

				arg_71_1.text_.text = var_74_4
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202017", "story_v_out_410202.awb") ~= 0 then
					local var_74_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202017", "story_v_out_410202.awb") / 1000

					if var_74_8 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_8 + var_74_0
					end

					if var_74_3.prefab_name ~= "" and arg_71_1.actors_[var_74_3.prefab_name] ~= nil then
						local var_74_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_3.prefab_name].transform, "story_v_out_410202", "410202017", "story_v_out_410202.awb")

						arg_71_1:RecordAudio("410202017", var_74_9)
						arg_71_1:RecordAudio("410202017", var_74_9)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_410202", "410202017", "story_v_out_410202.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_410202", "410202017", "story_v_out_410202.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_10 = math.max(var_74_1, arg_71_1.talkMaxDuration)

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_10 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_0) / var_74_10

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_0 + var_74_10 and arg_71_1.time_ < var_74_0 + var_74_10 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play410202018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 410202018
		arg_75_1.duration_ = 2.733

		local var_75_0 = {
			ja = 2.733,
			CriLanguages = 1.466,
			zh = 1.466
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
				arg_75_0:Play410202019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 0.125

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_2 = arg_75_1:FormatText(StoryNameCfg[612].name)

				arg_75_1.leftNameTxt_.text = var_78_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_3 = arg_75_1:GetWordFromCfg(410202018)
				local var_78_4 = arg_75_1:FormatText(var_78_3.content)

				arg_75_1.text_.text = var_78_4

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_5 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202018", "story_v_out_410202.awb") ~= 0 then
					local var_78_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202018", "story_v_out_410202.awb") / 1000

					if var_78_8 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_8 + var_78_0
					end

					if var_78_3.prefab_name ~= "" and arg_75_1.actors_[var_78_3.prefab_name] ~= nil then
						local var_78_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_3.prefab_name].transform, "story_v_out_410202", "410202018", "story_v_out_410202.awb")

						arg_75_1:RecordAudio("410202018", var_78_9)
						arg_75_1:RecordAudio("410202018", var_78_9)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_410202", "410202018", "story_v_out_410202.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_410202", "410202018", "story_v_out_410202.awb")
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
	Play410202019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 410202019
		arg_79_1.duration_ = 2.8

		local var_79_0 = {
			ja = 2.8,
			CriLanguages = 1.7,
			zh = 1.7
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
				arg_79_0:Play410202020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 0.25

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_2 = arg_79_1:FormatText(StoryNameCfg[597].name)

				arg_79_1.leftNameTxt_.text = var_82_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_3 = arg_79_1:GetWordFromCfg(410202019)
				local var_82_4 = arg_79_1:FormatText(var_82_3.content)

				arg_79_1.text_.text = var_82_4

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202019", "story_v_out_410202.awb") ~= 0 then
					local var_82_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202019", "story_v_out_410202.awb") / 1000

					if var_82_8 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_8 + var_82_0
					end

					if var_82_3.prefab_name ~= "" and arg_79_1.actors_[var_82_3.prefab_name] ~= nil then
						local var_82_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_3.prefab_name].transform, "story_v_out_410202", "410202019", "story_v_out_410202.awb")

						arg_79_1:RecordAudio("410202019", var_82_9)
						arg_79_1:RecordAudio("410202019", var_82_9)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_410202", "410202019", "story_v_out_410202.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_410202", "410202019", "story_v_out_410202.awb")
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
	Play410202020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 410202020
		arg_83_1.duration_ = 11.966

		local var_83_0 = {
			ja = 11.966,
			CriLanguages = 8.5,
			zh = 8.5
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
				arg_83_0:Play410202021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 0.825

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_2 = arg_83_1:FormatText(StoryNameCfg[612].name)

				arg_83_1.leftNameTxt_.text = var_86_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_3 = arg_83_1:GetWordFromCfg(410202020)
				local var_86_4 = arg_83_1:FormatText(var_86_3.content)

				arg_83_1.text_.text = var_86_4

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202020", "story_v_out_410202.awb") ~= 0 then
					local var_86_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202020", "story_v_out_410202.awb") / 1000

					if var_86_8 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_8 + var_86_0
					end

					if var_86_3.prefab_name ~= "" and arg_83_1.actors_[var_86_3.prefab_name] ~= nil then
						local var_86_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_3.prefab_name].transform, "story_v_out_410202", "410202020", "story_v_out_410202.awb")

						arg_83_1:RecordAudio("410202020", var_86_9)
						arg_83_1:RecordAudio("410202020", var_86_9)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_410202", "410202020", "story_v_out_410202.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_410202", "410202020", "story_v_out_410202.awb")
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
	Play410202021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 410202021
		arg_87_1.duration_ = 18

		local var_87_0 = {
			ja = 18,
			CriLanguages = 12.333,
			zh = 12.333
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
				arg_87_0:Play410202022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 1.325

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[612].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(410202021)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 53
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202021", "story_v_out_410202.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202021", "story_v_out_410202.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_410202", "410202021", "story_v_out_410202.awb")

						arg_87_1:RecordAudio("410202021", var_90_9)
						arg_87_1:RecordAudio("410202021", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_410202", "410202021", "story_v_out_410202.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_410202", "410202021", "story_v_out_410202.awb")
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
	Play410202022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 410202022
		arg_91_1.duration_ = 7.5

		local var_91_0 = {
			ja = 7.5,
			CriLanguages = 6.833,
			zh = 6.833
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
				arg_91_0:Play410202023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 0.8

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[612].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(410202022)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 32
				local var_94_6 = utf8.len(var_94_4)
				local var_94_7 = var_94_5 <= 0 and var_94_1 or var_94_1 * (var_94_6 / var_94_5)

				if var_94_7 > 0 and var_94_1 < var_94_7 then
					arg_91_1.talkMaxDuration = var_94_7

					if var_94_7 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_7 + var_94_0
					end
				end

				arg_91_1.text_.text = var_94_4
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202022", "story_v_out_410202.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202022", "story_v_out_410202.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_410202", "410202022", "story_v_out_410202.awb")

						arg_91_1:RecordAudio("410202022", var_94_9)
						arg_91_1:RecordAudio("410202022", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_410202", "410202022", "story_v_out_410202.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_410202", "410202022", "story_v_out_410202.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_10 = math.max(var_94_1, arg_91_1.talkMaxDuration)

			if var_94_0 <= arg_91_1.time_ and arg_91_1.time_ < var_94_0 + var_94_10 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_0) / var_94_10

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_0 + var_94_10 and arg_91_1.time_ < var_94_0 + var_94_10 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play410202023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 410202023
		arg_95_1.duration_ = 11.2

		local var_95_0 = {
			ja = 11.2,
			CriLanguages = 8.6,
			zh = 8.6
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
				arg_95_0:Play410202024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 1

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_2 = arg_95_1:FormatText(StoryNameCfg[612].name)

				arg_95_1.leftNameTxt_.text = var_98_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_3 = arg_95_1:GetWordFromCfg(410202023)
				local var_98_4 = arg_95_1:FormatText(var_98_3.content)

				arg_95_1.text_.text = var_98_4

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_5 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202023", "story_v_out_410202.awb") ~= 0 then
					local var_98_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202023", "story_v_out_410202.awb") / 1000

					if var_98_8 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_8 + var_98_0
					end

					if var_98_3.prefab_name ~= "" and arg_95_1.actors_[var_98_3.prefab_name] ~= nil then
						local var_98_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_3.prefab_name].transform, "story_v_out_410202", "410202023", "story_v_out_410202.awb")

						arg_95_1:RecordAudio("410202023", var_98_9)
						arg_95_1:RecordAudio("410202023", var_98_9)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_410202", "410202023", "story_v_out_410202.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_410202", "410202023", "story_v_out_410202.awb")
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
	Play410202024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 410202024
		arg_99_1.duration_ = 5.066

		local var_99_0 = {
			ja = 4.833,
			CriLanguages = 5.066,
			zh = 5.066
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
				arg_99_0:Play410202025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 0.4

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_2 = arg_99_1:FormatText(StoryNameCfg[597].name)

				arg_99_1.leftNameTxt_.text = var_102_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_3 = arg_99_1:GetWordFromCfg(410202024)
				local var_102_4 = arg_99_1:FormatText(var_102_3.content)

				arg_99_1.text_.text = var_102_4

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_5 = 16
				local var_102_6 = utf8.len(var_102_4)
				local var_102_7 = var_102_5 <= 0 and var_102_1 or var_102_1 * (var_102_6 / var_102_5)

				if var_102_7 > 0 and var_102_1 < var_102_7 then
					arg_99_1.talkMaxDuration = var_102_7

					if var_102_7 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_7 + var_102_0
					end
				end

				arg_99_1.text_.text = var_102_4
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202024", "story_v_out_410202.awb") ~= 0 then
					local var_102_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202024", "story_v_out_410202.awb") / 1000

					if var_102_8 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_8 + var_102_0
					end

					if var_102_3.prefab_name ~= "" and arg_99_1.actors_[var_102_3.prefab_name] ~= nil then
						local var_102_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_3.prefab_name].transform, "story_v_out_410202", "410202024", "story_v_out_410202.awb")

						arg_99_1:RecordAudio("410202024", var_102_9)
						arg_99_1:RecordAudio("410202024", var_102_9)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_410202", "410202024", "story_v_out_410202.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_410202", "410202024", "story_v_out_410202.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_10 = math.max(var_102_1, arg_99_1.talkMaxDuration)

			if var_102_0 <= arg_99_1.time_ and arg_99_1.time_ < var_102_0 + var_102_10 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_0) / var_102_10

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_0 + var_102_10 and arg_99_1.time_ < var_102_0 + var_102_10 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play410202025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 410202025
		arg_103_1.duration_ = 14.766

		local var_103_0 = {
			ja = 14.766,
			CriLanguages = 9.766,
			zh = 9.766
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
				arg_103_0:Play410202026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 1.075

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_2 = arg_103_1:FormatText(StoryNameCfg[612].name)

				arg_103_1.leftNameTxt_.text = var_106_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_3 = arg_103_1:GetWordFromCfg(410202025)
				local var_106_4 = arg_103_1:FormatText(var_106_3.content)

				arg_103_1.text_.text = var_106_4

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_5 = 43
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202025", "story_v_out_410202.awb") ~= 0 then
					local var_106_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202025", "story_v_out_410202.awb") / 1000

					if var_106_8 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_0
					end

					if var_106_3.prefab_name ~= "" and arg_103_1.actors_[var_106_3.prefab_name] ~= nil then
						local var_106_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_3.prefab_name].transform, "story_v_out_410202", "410202025", "story_v_out_410202.awb")

						arg_103_1:RecordAudio("410202025", var_106_9)
						arg_103_1:RecordAudio("410202025", var_106_9)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_410202", "410202025", "story_v_out_410202.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_410202", "410202025", "story_v_out_410202.awb")
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
	Play410202026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 410202026
		arg_107_1.duration_ = 18.466

		local var_107_0 = {
			ja = 18.466,
			CriLanguages = 10.333,
			zh = 10.333
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
				arg_107_0:Play410202027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 1.125

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_2 = arg_107_1:FormatText(StoryNameCfg[612].name)

				arg_107_1.leftNameTxt_.text = var_110_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_3 = arg_107_1:GetWordFromCfg(410202026)
				local var_110_4 = arg_107_1:FormatText(var_110_3.content)

				arg_107_1.text_.text = var_110_4

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_5 = 45
				local var_110_6 = utf8.len(var_110_4)
				local var_110_7 = var_110_5 <= 0 and var_110_1 or var_110_1 * (var_110_6 / var_110_5)

				if var_110_7 > 0 and var_110_1 < var_110_7 then
					arg_107_1.talkMaxDuration = var_110_7

					if var_110_7 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_7 + var_110_0
					end
				end

				arg_107_1.text_.text = var_110_4
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202026", "story_v_out_410202.awb") ~= 0 then
					local var_110_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202026", "story_v_out_410202.awb") / 1000

					if var_110_8 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_8 + var_110_0
					end

					if var_110_3.prefab_name ~= "" and arg_107_1.actors_[var_110_3.prefab_name] ~= nil then
						local var_110_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_3.prefab_name].transform, "story_v_out_410202", "410202026", "story_v_out_410202.awb")

						arg_107_1:RecordAudio("410202026", var_110_9)
						arg_107_1:RecordAudio("410202026", var_110_9)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_410202", "410202026", "story_v_out_410202.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_410202", "410202026", "story_v_out_410202.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_10 = math.max(var_110_1, arg_107_1.talkMaxDuration)

			if var_110_0 <= arg_107_1.time_ and arg_107_1.time_ < var_110_0 + var_110_10 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_0) / var_110_10

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_0 + var_110_10 and arg_107_1.time_ < var_110_0 + var_110_10 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play410202027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 410202027
		arg_111_1.duration_ = 8.933

		local var_111_0 = {
			ja = 6.766,
			CriLanguages = 8.933,
			zh = 8.933
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
				arg_111_0:Play410202028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 1.025

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_2 = arg_111_1:FormatText(StoryNameCfg[612].name)

				arg_111_1.leftNameTxt_.text = var_114_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_3 = arg_111_1:GetWordFromCfg(410202027)
				local var_114_4 = arg_111_1:FormatText(var_114_3.content)

				arg_111_1.text_.text = var_114_4

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_5 = 41
				local var_114_6 = utf8.len(var_114_4)
				local var_114_7 = var_114_5 <= 0 and var_114_1 or var_114_1 * (var_114_6 / var_114_5)

				if var_114_7 > 0 and var_114_1 < var_114_7 then
					arg_111_1.talkMaxDuration = var_114_7

					if var_114_7 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_7 + var_114_0
					end
				end

				arg_111_1.text_.text = var_114_4
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202027", "story_v_out_410202.awb") ~= 0 then
					local var_114_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202027", "story_v_out_410202.awb") / 1000

					if var_114_8 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_8 + var_114_0
					end

					if var_114_3.prefab_name ~= "" and arg_111_1.actors_[var_114_3.prefab_name] ~= nil then
						local var_114_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_3.prefab_name].transform, "story_v_out_410202", "410202027", "story_v_out_410202.awb")

						arg_111_1:RecordAudio("410202027", var_114_9)
						arg_111_1:RecordAudio("410202027", var_114_9)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_410202", "410202027", "story_v_out_410202.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_410202", "410202027", "story_v_out_410202.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_10 = math.max(var_114_1, arg_111_1.talkMaxDuration)

			if var_114_0 <= arg_111_1.time_ and arg_111_1.time_ < var_114_0 + var_114_10 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_0) / var_114_10

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_0 + var_114_10 and arg_111_1.time_ < var_114_0 + var_114_10 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play410202028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 410202028
		arg_115_1.duration_ = 13.066

		local var_115_0 = {
			ja = 12.8,
			CriLanguages = 13.066,
			zh = 13.066
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
				arg_115_0:Play410202029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 1.475

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_2 = arg_115_1:FormatText(StoryNameCfg[612].name)

				arg_115_1.leftNameTxt_.text = var_118_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_3 = arg_115_1:GetWordFromCfg(410202028)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 59
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202028", "story_v_out_410202.awb") ~= 0 then
					local var_118_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202028", "story_v_out_410202.awb") / 1000

					if var_118_8 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_8 + var_118_0
					end

					if var_118_3.prefab_name ~= "" and arg_115_1.actors_[var_118_3.prefab_name] ~= nil then
						local var_118_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_3.prefab_name].transform, "story_v_out_410202", "410202028", "story_v_out_410202.awb")

						arg_115_1:RecordAudio("410202028", var_118_9)
						arg_115_1:RecordAudio("410202028", var_118_9)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_410202", "410202028", "story_v_out_410202.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_410202", "410202028", "story_v_out_410202.awb")
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
	Play410202029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 410202029
		arg_119_1.duration_ = 12.366

		local var_119_0 = {
			ja = 12.366,
			CriLanguages = 8,
			zh = 8
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
				arg_119_0:Play410202030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 0.825

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_2 = arg_119_1:FormatText(StoryNameCfg[612].name)

				arg_119_1.leftNameTxt_.text = var_122_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_3 = arg_119_1:GetWordFromCfg(410202029)
				local var_122_4 = arg_119_1:FormatText(var_122_3.content)

				arg_119_1.text_.text = var_122_4

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_5 = 33
				local var_122_6 = utf8.len(var_122_4)
				local var_122_7 = var_122_5 <= 0 and var_122_1 or var_122_1 * (var_122_6 / var_122_5)

				if var_122_7 > 0 and var_122_1 < var_122_7 then
					arg_119_1.talkMaxDuration = var_122_7

					if var_122_7 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_7 + var_122_0
					end
				end

				arg_119_1.text_.text = var_122_4
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202029", "story_v_out_410202.awb") ~= 0 then
					local var_122_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202029", "story_v_out_410202.awb") / 1000

					if var_122_8 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_0
					end

					if var_122_3.prefab_name ~= "" and arg_119_1.actors_[var_122_3.prefab_name] ~= nil then
						local var_122_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_3.prefab_name].transform, "story_v_out_410202", "410202029", "story_v_out_410202.awb")

						arg_119_1:RecordAudio("410202029", var_122_9)
						arg_119_1:RecordAudio("410202029", var_122_9)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_410202", "410202029", "story_v_out_410202.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_410202", "410202029", "story_v_out_410202.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_10 = math.max(var_122_1, arg_119_1.talkMaxDuration)

			if var_122_0 <= arg_119_1.time_ and arg_119_1.time_ < var_122_0 + var_122_10 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_0) / var_122_10

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_0 + var_122_10 and arg_119_1.time_ < var_122_0 + var_122_10 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play410202030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 410202030
		arg_123_1.duration_ = 7.566

		local var_123_0 = {
			ja = 5.866,
			CriLanguages = 7.566,
			zh = 7.566
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
				arg_123_0:Play410202031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 0.725

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_2 = arg_123_1:FormatText(StoryNameCfg[597].name)

				arg_123_1.leftNameTxt_.text = var_126_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_3 = arg_123_1:GetWordFromCfg(410202030)
				local var_126_4 = arg_123_1:FormatText(var_126_3.content)

				arg_123_1.text_.text = var_126_4

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_5 = 29
				local var_126_6 = utf8.len(var_126_4)
				local var_126_7 = var_126_5 <= 0 and var_126_1 or var_126_1 * (var_126_6 / var_126_5)

				if var_126_7 > 0 and var_126_1 < var_126_7 then
					arg_123_1.talkMaxDuration = var_126_7

					if var_126_7 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_7 + var_126_0
					end
				end

				arg_123_1.text_.text = var_126_4
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202030", "story_v_out_410202.awb") ~= 0 then
					local var_126_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202030", "story_v_out_410202.awb") / 1000

					if var_126_8 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_8 + var_126_0
					end

					if var_126_3.prefab_name ~= "" and arg_123_1.actors_[var_126_3.prefab_name] ~= nil then
						local var_126_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_3.prefab_name].transform, "story_v_out_410202", "410202030", "story_v_out_410202.awb")

						arg_123_1:RecordAudio("410202030", var_126_9)
						arg_123_1:RecordAudio("410202030", var_126_9)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_410202", "410202030", "story_v_out_410202.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_410202", "410202030", "story_v_out_410202.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_10 = math.max(var_126_1, arg_123_1.talkMaxDuration)

			if var_126_0 <= arg_123_1.time_ and arg_123_1.time_ < var_126_0 + var_126_10 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_0) / var_126_10

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_0 + var_126_10 and arg_123_1.time_ < var_126_0 + var_126_10 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play410202031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 410202031
		arg_127_1.duration_ = 14.233

		local var_127_0 = {
			ja = 14.233,
			CriLanguages = 7.033,
			zh = 7.033
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
				arg_127_0:Play410202032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.875

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_2 = arg_127_1:FormatText(StoryNameCfg[612].name)

				arg_127_1.leftNameTxt_.text = var_130_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_3 = arg_127_1:GetWordFromCfg(410202031)
				local var_130_4 = arg_127_1:FormatText(var_130_3.content)

				arg_127_1.text_.text = var_130_4

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202031", "story_v_out_410202.awb") ~= 0 then
					local var_130_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202031", "story_v_out_410202.awb") / 1000

					if var_130_8 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_0
					end

					if var_130_3.prefab_name ~= "" and arg_127_1.actors_[var_130_3.prefab_name] ~= nil then
						local var_130_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_3.prefab_name].transform, "story_v_out_410202", "410202031", "story_v_out_410202.awb")

						arg_127_1:RecordAudio("410202031", var_130_9)
						arg_127_1:RecordAudio("410202031", var_130_9)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_410202", "410202031", "story_v_out_410202.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_410202", "410202031", "story_v_out_410202.awb")
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
	Play410202032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 410202032
		arg_131_1.duration_ = 2.4

		local var_131_0 = {
			ja = 2.4,
			CriLanguages = 2.166,
			zh = 2.166
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
				arg_131_0:Play410202033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 0.15

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_2 = arg_131_1:FormatText(StoryNameCfg[597].name)

				arg_131_1.leftNameTxt_.text = var_134_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_3 = arg_131_1:GetWordFromCfg(410202032)
				local var_134_4 = arg_131_1:FormatText(var_134_3.content)

				arg_131_1.text_.text = var_134_4

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202032", "story_v_out_410202.awb") ~= 0 then
					local var_134_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202032", "story_v_out_410202.awb") / 1000

					if var_134_8 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_8 + var_134_0
					end

					if var_134_3.prefab_name ~= "" and arg_131_1.actors_[var_134_3.prefab_name] ~= nil then
						local var_134_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_3.prefab_name].transform, "story_v_out_410202", "410202032", "story_v_out_410202.awb")

						arg_131_1:RecordAudio("410202032", var_134_9)
						arg_131_1:RecordAudio("410202032", var_134_9)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_410202", "410202032", "story_v_out_410202.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_410202", "410202032", "story_v_out_410202.awb")
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
	Play410202033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 410202033
		arg_135_1.duration_ = 19.9

		local var_135_0 = {
			ja = 19.9,
			CriLanguages = 10.533,
			zh = 10.533
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
				arg_135_0:Play410202034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0
			local var_138_1 = 1.35

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_2 = arg_135_1:FormatText(StoryNameCfg[612].name)

				arg_135_1.leftNameTxt_.text = var_138_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_3 = arg_135_1:GetWordFromCfg(410202033)
				local var_138_4 = arg_135_1:FormatText(var_138_3.content)

				arg_135_1.text_.text = var_138_4

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_5 = 54
				local var_138_6 = utf8.len(var_138_4)
				local var_138_7 = var_138_5 <= 0 and var_138_1 or var_138_1 * (var_138_6 / var_138_5)

				if var_138_7 > 0 and var_138_1 < var_138_7 then
					arg_135_1.talkMaxDuration = var_138_7

					if var_138_7 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_7 + var_138_0
					end
				end

				arg_135_1.text_.text = var_138_4
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202033", "story_v_out_410202.awb") ~= 0 then
					local var_138_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202033", "story_v_out_410202.awb") / 1000

					if var_138_8 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_8 + var_138_0
					end

					if var_138_3.prefab_name ~= "" and arg_135_1.actors_[var_138_3.prefab_name] ~= nil then
						local var_138_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_3.prefab_name].transform, "story_v_out_410202", "410202033", "story_v_out_410202.awb")

						arg_135_1:RecordAudio("410202033", var_138_9)
						arg_135_1:RecordAudio("410202033", var_138_9)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_410202", "410202033", "story_v_out_410202.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_410202", "410202033", "story_v_out_410202.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_10 = math.max(var_138_1, arg_135_1.talkMaxDuration)

			if var_138_0 <= arg_135_1.time_ and arg_135_1.time_ < var_138_0 + var_138_10 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_0) / var_138_10

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_0 + var_138_10 and arg_135_1.time_ < var_138_0 + var_138_10 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play410202034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 410202034
		arg_139_1.duration_ = 10.533

		local var_139_0 = {
			ja = 10,
			CriLanguages = 10.533,
			zh = 10.533
		}
		local var_139_1 = manager.audio:GetLocalizationFlag()

		if var_139_0[var_139_1] ~= nil then
			arg_139_1.duration_ = var_139_0[var_139_1]
		end

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play410202035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0
			local var_142_1 = 1.075

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_2 = arg_139_1:FormatText(StoryNameCfg[612].name)

				arg_139_1.leftNameTxt_.text = var_142_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_3 = arg_139_1:GetWordFromCfg(410202034)
				local var_142_4 = arg_139_1:FormatText(var_142_3.content)

				arg_139_1.text_.text = var_142_4

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_5 = 43
				local var_142_6 = utf8.len(var_142_4)
				local var_142_7 = var_142_5 <= 0 and var_142_1 or var_142_1 * (var_142_6 / var_142_5)

				if var_142_7 > 0 and var_142_1 < var_142_7 then
					arg_139_1.talkMaxDuration = var_142_7

					if var_142_7 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_7 + var_142_0
					end
				end

				arg_139_1.text_.text = var_142_4
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202034", "story_v_out_410202.awb") ~= 0 then
					local var_142_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202034", "story_v_out_410202.awb") / 1000

					if var_142_8 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_8 + var_142_0
					end

					if var_142_3.prefab_name ~= "" and arg_139_1.actors_[var_142_3.prefab_name] ~= nil then
						local var_142_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_3.prefab_name].transform, "story_v_out_410202", "410202034", "story_v_out_410202.awb")

						arg_139_1:RecordAudio("410202034", var_142_9)
						arg_139_1:RecordAudio("410202034", var_142_9)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_410202", "410202034", "story_v_out_410202.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_410202", "410202034", "story_v_out_410202.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_10 = math.max(var_142_1, arg_139_1.talkMaxDuration)

			if var_142_0 <= arg_139_1.time_ and arg_139_1.time_ < var_142_0 + var_142_10 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_0) / var_142_10

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_0 + var_142_10 and arg_139_1.time_ < var_142_0 + var_142_10 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play410202035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 410202035
		arg_143_1.duration_ = 5.3

		local var_143_0 = {
			ja = 5.3,
			CriLanguages = 3.466,
			zh = 3.466
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
				arg_143_0:Play410202036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 0.3

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_2 = arg_143_1:FormatText(StoryNameCfg[612].name)

				arg_143_1.leftNameTxt_.text = var_146_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_3 = arg_143_1:GetWordFromCfg(410202035)
				local var_146_4 = arg_143_1:FormatText(var_146_3.content)

				arg_143_1.text_.text = var_146_4

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_5 = 12
				local var_146_6 = utf8.len(var_146_4)
				local var_146_7 = var_146_5 <= 0 and var_146_1 or var_146_1 * (var_146_6 / var_146_5)

				if var_146_7 > 0 and var_146_1 < var_146_7 then
					arg_143_1.talkMaxDuration = var_146_7

					if var_146_7 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_7 + var_146_0
					end
				end

				arg_143_1.text_.text = var_146_4
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202035", "story_v_out_410202.awb") ~= 0 then
					local var_146_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202035", "story_v_out_410202.awb") / 1000

					if var_146_8 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_8 + var_146_0
					end

					if var_146_3.prefab_name ~= "" and arg_143_1.actors_[var_146_3.prefab_name] ~= nil then
						local var_146_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_3.prefab_name].transform, "story_v_out_410202", "410202035", "story_v_out_410202.awb")

						arg_143_1:RecordAudio("410202035", var_146_9)
						arg_143_1:RecordAudio("410202035", var_146_9)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_410202", "410202035", "story_v_out_410202.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_410202", "410202035", "story_v_out_410202.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_10 = math.max(var_146_1, arg_143_1.talkMaxDuration)

			if var_146_0 <= arg_143_1.time_ and arg_143_1.time_ < var_146_0 + var_146_10 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_0) / var_146_10

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_0 + var_146_10 and arg_143_1.time_ < var_146_0 + var_146_10 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play410202036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 410202036
		arg_147_1.duration_ = 5

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play410202037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 0.45

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, false)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_2 = arg_147_1:GetWordFromCfg(410202036)
				local var_150_3 = arg_147_1:FormatText(var_150_2.content)

				arg_147_1.text_.text = var_150_3

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_4 = 18
				local var_150_5 = utf8.len(var_150_3)
				local var_150_6 = var_150_4 <= 0 and var_150_1 or var_150_1 * (var_150_5 / var_150_4)

				if var_150_6 > 0 and var_150_1 < var_150_6 then
					arg_147_1.talkMaxDuration = var_150_6

					if var_150_6 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_6 + var_150_0
					end
				end

				arg_147_1.text_.text = var_150_3
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)
				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_7 = math.max(var_150_1, arg_147_1.talkMaxDuration)

			if var_150_0 <= arg_147_1.time_ and arg_147_1.time_ < var_150_0 + var_150_7 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_0) / var_150_7

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_0 + var_150_7 and arg_147_1.time_ < var_150_0 + var_150_7 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play410202037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 410202037
		arg_151_1.duration_ = 5.266

		local var_151_0 = {
			ja = 4.1,
			CriLanguages = 5.266,
			zh = 5.266
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
				arg_151_0:Play410202038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 0.4

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_2 = arg_151_1:FormatText(StoryNameCfg[612].name)

				arg_151_1.leftNameTxt_.text = var_154_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_3 = arg_151_1:GetWordFromCfg(410202037)
				local var_154_4 = arg_151_1:FormatText(var_154_3.content)

				arg_151_1.text_.text = var_154_4

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_5 = 16
				local var_154_6 = utf8.len(var_154_4)
				local var_154_7 = var_154_5 <= 0 and var_154_1 or var_154_1 * (var_154_6 / var_154_5)

				if var_154_7 > 0 and var_154_1 < var_154_7 then
					arg_151_1.talkMaxDuration = var_154_7

					if var_154_7 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_7 + var_154_0
					end
				end

				arg_151_1.text_.text = var_154_4
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202037", "story_v_out_410202.awb") ~= 0 then
					local var_154_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202037", "story_v_out_410202.awb") / 1000

					if var_154_8 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_0
					end

					if var_154_3.prefab_name ~= "" and arg_151_1.actors_[var_154_3.prefab_name] ~= nil then
						local var_154_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_3.prefab_name].transform, "story_v_out_410202", "410202037", "story_v_out_410202.awb")

						arg_151_1:RecordAudio("410202037", var_154_9)
						arg_151_1:RecordAudio("410202037", var_154_9)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_410202", "410202037", "story_v_out_410202.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_410202", "410202037", "story_v_out_410202.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_10 = math.max(var_154_1, arg_151_1.talkMaxDuration)

			if var_154_0 <= arg_151_1.time_ and arg_151_1.time_ < var_154_0 + var_154_10 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_0) / var_154_10

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_0 + var_154_10 and arg_151_1.time_ < var_154_0 + var_154_10 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play410202038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 410202038
		arg_155_1.duration_ = 6.166

		local var_155_0 = {
			ja = 6.166,
			CriLanguages = 5.3,
			zh = 5.3
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
				arg_155_0:Play410202039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = "ST66"

			if arg_155_1.bgs_[var_158_0] == nil then
				local var_158_1 = Object.Instantiate(arg_155_1.paintGo_)

				var_158_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_158_0)
				var_158_1.name = var_158_0
				var_158_1.transform.parent = arg_155_1.stage_.transform
				var_158_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_155_1.bgs_[var_158_0] = var_158_1
			end

			local var_158_2 = 2

			if var_158_2 < arg_155_1.time_ and arg_155_1.time_ <= var_158_2 + arg_158_0 then
				local var_158_3 = manager.ui.mainCamera.transform.localPosition
				local var_158_4 = Vector3.New(0, 0, 10) + Vector3.New(var_158_3.x, var_158_3.y, 0)
				local var_158_5 = arg_155_1.bgs_.ST66

				var_158_5.transform.localPosition = var_158_4
				var_158_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_158_6 = var_158_5:GetComponent("SpriteRenderer")

				if var_158_6 and var_158_6.sprite then
					local var_158_7 = (var_158_5.transform.localPosition - var_158_3).z
					local var_158_8 = manager.ui.mainCameraCom_
					local var_158_9 = 2 * var_158_7 * Mathf.Tan(var_158_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_158_10 = var_158_9 * var_158_8.aspect
					local var_158_11 = var_158_6.sprite.bounds.size.x
					local var_158_12 = var_158_6.sprite.bounds.size.y
					local var_158_13 = var_158_10 / var_158_11
					local var_158_14 = var_158_9 / var_158_12
					local var_158_15 = var_158_14 < var_158_13 and var_158_13 or var_158_14

					var_158_5.transform.localScale = Vector3.New(var_158_15, var_158_15, 0)
				end

				for iter_158_0, iter_158_1 in pairs(arg_155_1.bgs_) do
					if iter_158_0 ~= "ST66" then
						iter_158_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_158_16 = 0

			if var_158_16 < arg_155_1.time_ and arg_155_1.time_ <= var_158_16 + arg_158_0 then
				arg_155_1.mask_.enabled = true
				arg_155_1.mask_.raycastTarget = true

				arg_155_1:SetGaussion(false)
			end

			local var_158_17 = 2

			if var_158_16 <= arg_155_1.time_ and arg_155_1.time_ < var_158_16 + var_158_17 then
				local var_158_18 = (arg_155_1.time_ - var_158_16) / var_158_17
				local var_158_19 = Color.New(0, 0, 0)

				var_158_19.a = Mathf.Lerp(0, 1, var_158_18)
				arg_155_1.mask_.color = var_158_19
			end

			if arg_155_1.time_ >= var_158_16 + var_158_17 and arg_155_1.time_ < var_158_16 + var_158_17 + arg_158_0 then
				local var_158_20 = Color.New(0, 0, 0)

				var_158_20.a = 1
				arg_155_1.mask_.color = var_158_20
			end

			local var_158_21 = 2

			if var_158_21 < arg_155_1.time_ and arg_155_1.time_ <= var_158_21 + arg_158_0 then
				arg_155_1.mask_.enabled = true
				arg_155_1.mask_.raycastTarget = true

				arg_155_1:SetGaussion(false)
			end

			local var_158_22 = 2

			if var_158_21 <= arg_155_1.time_ and arg_155_1.time_ < var_158_21 + var_158_22 then
				local var_158_23 = (arg_155_1.time_ - var_158_21) / var_158_22
				local var_158_24 = Color.New(0, 0, 0)

				var_158_24.a = Mathf.Lerp(1, 0, var_158_23)
				arg_155_1.mask_.color = var_158_24
			end

			if arg_155_1.time_ >= var_158_21 + var_158_22 and arg_155_1.time_ < var_158_21 + var_158_22 + arg_158_0 then
				local var_158_25 = Color.New(0, 0, 0)
				local var_158_26 = 0

				arg_155_1.mask_.enabled = false
				var_158_25.a = var_158_26
				arg_155_1.mask_.color = var_158_25
			end

			local var_158_27 = arg_155_1.actors_["10059"].transform
			local var_158_28 = 4

			if var_158_28 < arg_155_1.time_ and arg_155_1.time_ <= var_158_28 + arg_158_0 then
				arg_155_1.var_.moveOldPos10059 = var_158_27.localPosition
				var_158_27.localScale = Vector3.New(1, 1, 1)

				arg_155_1:CheckSpriteTmpPos("10059", 2)

				local var_158_29 = var_158_27.childCount

				for iter_158_2 = 0, var_158_29 - 1 do
					local var_158_30 = var_158_27:GetChild(iter_158_2)

					if var_158_30.name == "" or not string.find(var_158_30.name, "split") then
						var_158_30.gameObject:SetActive(true)
					else
						var_158_30.gameObject:SetActive(false)
					end
				end
			end

			local var_158_31 = 0.001

			if var_158_28 <= arg_155_1.time_ and arg_155_1.time_ < var_158_28 + var_158_31 then
				local var_158_32 = (arg_155_1.time_ - var_158_28) / var_158_31
				local var_158_33 = Vector3.New(-390, -530, 35)

				var_158_27.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos10059, var_158_33, var_158_32)
			end

			if arg_155_1.time_ >= var_158_28 + var_158_31 and arg_155_1.time_ < var_158_28 + var_158_31 + arg_158_0 then
				var_158_27.localPosition = Vector3.New(-390, -530, 35)
			end

			local var_158_34 = arg_155_1.actors_["1061"].transform
			local var_158_35 = 4

			if var_158_35 < arg_155_1.time_ and arg_155_1.time_ <= var_158_35 + arg_158_0 then
				arg_155_1.var_.moveOldPos1061 = var_158_34.localPosition
				var_158_34.localScale = Vector3.New(1, 1, 1)

				arg_155_1:CheckSpriteTmpPos("1061", 4)

				local var_158_36 = var_158_34.childCount

				for iter_158_3 = 0, var_158_36 - 1 do
					local var_158_37 = var_158_34:GetChild(iter_158_3)

					if var_158_37.name == "" or not string.find(var_158_37.name, "split") then
						var_158_37.gameObject:SetActive(true)
					else
						var_158_37.gameObject:SetActive(false)
					end
				end
			end

			local var_158_38 = 0.001

			if var_158_35 <= arg_155_1.time_ and arg_155_1.time_ < var_158_35 + var_158_38 then
				local var_158_39 = (arg_155_1.time_ - var_158_35) / var_158_38
				local var_158_40 = Vector3.New(390, -490, 18)

				var_158_34.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos1061, var_158_40, var_158_39)
			end

			if arg_155_1.time_ >= var_158_35 + var_158_38 and arg_155_1.time_ < var_158_35 + var_158_38 + arg_158_0 then
				var_158_34.localPosition = Vector3.New(390, -490, 18)
			end

			local var_158_41 = arg_155_1.actors_["10059"]
			local var_158_42 = 4

			if var_158_42 < arg_155_1.time_ and arg_155_1.time_ <= var_158_42 + arg_158_0 and arg_155_1.var_.actorSpriteComps10059 == nil then
				arg_155_1.var_.actorSpriteComps10059 = var_158_41:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_43 = 0.034

			if var_158_42 <= arg_155_1.time_ and arg_155_1.time_ < var_158_42 + var_158_43 then
				local var_158_44 = (arg_155_1.time_ - var_158_42) / var_158_43

				if arg_155_1.var_.actorSpriteComps10059 then
					for iter_158_4, iter_158_5 in pairs(arg_155_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_158_5 then
							local var_158_45 = Mathf.Lerp(iter_158_5.color.r, 1, var_158_44)

							iter_158_5.color = Color.New(var_158_45, var_158_45, var_158_45)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_42 + var_158_43 and arg_155_1.time_ < var_158_42 + var_158_43 + arg_158_0 and arg_155_1.var_.actorSpriteComps10059 then
				local var_158_46 = 1

				for iter_158_6, iter_158_7 in pairs(arg_155_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_158_7 then
						iter_158_7.color = Color.New(var_158_46, var_158_46, var_158_46)
					end
				end

				arg_155_1.var_.actorSpriteComps10059 = nil
			end

			local var_158_47 = arg_155_1.actors_["1061"]
			local var_158_48 = 4

			if var_158_48 < arg_155_1.time_ and arg_155_1.time_ <= var_158_48 + arg_158_0 and arg_155_1.var_.actorSpriteComps1061 == nil then
				arg_155_1.var_.actorSpriteComps1061 = var_158_47:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_49 = 0.034

			if var_158_48 <= arg_155_1.time_ and arg_155_1.time_ < var_158_48 + var_158_49 then
				local var_158_50 = (arg_155_1.time_ - var_158_48) / var_158_49

				if arg_155_1.var_.actorSpriteComps1061 then
					for iter_158_8, iter_158_9 in pairs(arg_155_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_158_9 then
							local var_158_51 = Mathf.Lerp(iter_158_9.color.r, 0.5, var_158_50)

							iter_158_9.color = Color.New(var_158_51, var_158_51, var_158_51)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_48 + var_158_49 and arg_155_1.time_ < var_158_48 + var_158_49 + arg_158_0 and arg_155_1.var_.actorSpriteComps1061 then
				local var_158_52 = 0.5

				for iter_158_10, iter_158_11 in pairs(arg_155_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_158_11 then
						iter_158_11.color = Color.New(var_158_52, var_158_52, var_158_52)
					end
				end

				arg_155_1.var_.actorSpriteComps1061 = nil
			end

			if arg_155_1.frameCnt_ <= 1 then
				arg_155_1.dialog_:SetActive(false)
			end

			local var_158_53 = 4
			local var_158_54 = 0.1

			if var_158_53 < arg_155_1.time_ and arg_155_1.time_ <= var_158_53 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0

				arg_155_1.dialog_:SetActive(true)

				local var_158_55 = LeanTween.value(arg_155_1.dialog_, 0, 1, 0.3)

				var_158_55:setOnUpdate(LuaHelper.FloatAction(function(arg_159_0)
					arg_155_1.dialogCg_.alpha = arg_159_0
				end))
				var_158_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_155_1.dialog_)
					var_158_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_155_1.duration_ = arg_155_1.duration_ + 0.3

				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_56 = arg_155_1:FormatText(StoryNameCfg[596].name)

				arg_155_1.leftNameTxt_.text = var_158_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_57 = arg_155_1:GetWordFromCfg(410202038)
				local var_158_58 = arg_155_1:FormatText(var_158_57.content)

				arg_155_1.text_.text = var_158_58

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_59 = 4
				local var_158_60 = utf8.len(var_158_58)
				local var_158_61 = var_158_59 <= 0 and var_158_54 or var_158_54 * (var_158_60 / var_158_59)

				if var_158_61 > 0 and var_158_54 < var_158_61 then
					arg_155_1.talkMaxDuration = var_158_61
					var_158_53 = var_158_53 + 0.3

					if var_158_61 + var_158_53 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_61 + var_158_53
					end
				end

				arg_155_1.text_.text = var_158_58
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202038", "story_v_out_410202.awb") ~= 0 then
					local var_158_62 = manager.audio:GetVoiceLength("story_v_out_410202", "410202038", "story_v_out_410202.awb") / 1000

					if var_158_62 + var_158_53 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_62 + var_158_53
					end

					if var_158_57.prefab_name ~= "" and arg_155_1.actors_[var_158_57.prefab_name] ~= nil then
						local var_158_63 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_57.prefab_name].transform, "story_v_out_410202", "410202038", "story_v_out_410202.awb")

						arg_155_1:RecordAudio("410202038", var_158_63)
						arg_155_1:RecordAudio("410202038", var_158_63)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_410202", "410202038", "story_v_out_410202.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_410202", "410202038", "story_v_out_410202.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_64 = var_158_53 + 0.3
			local var_158_65 = math.max(var_158_54, arg_155_1.talkMaxDuration)

			if var_158_64 <= arg_155_1.time_ and arg_155_1.time_ < var_158_64 + var_158_65 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_64) / var_158_65

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_64 + var_158_65 and arg_155_1.time_ < var_158_64 + var_158_65 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play410202039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 410202039
		arg_161_1.duration_ = 7.666

		local var_161_0 = {
			ja = 7.666,
			CriLanguages = 3.333,
			zh = 3.333
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
				arg_161_0:Play410202040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1061"].transform
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPos1061 = var_164_0.localPosition
				var_164_0.localScale = Vector3.New(1, 1, 1)

				arg_161_1:CheckSpriteTmpPos("1061", 4)

				local var_164_2 = var_164_0.childCount

				for iter_164_0 = 0, var_164_2 - 1 do
					local var_164_3 = var_164_0:GetChild(iter_164_0)

					if var_164_3.name == "" or not string.find(var_164_3.name, "split") then
						var_164_3.gameObject:SetActive(true)
					else
						var_164_3.gameObject:SetActive(false)
					end
				end
			end

			local var_164_4 = 0.001

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_4 then
				local var_164_5 = (arg_161_1.time_ - var_164_1) / var_164_4
				local var_164_6 = Vector3.New(390, -490, 18)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1061, var_164_6, var_164_5)
			end

			if arg_161_1.time_ >= var_164_1 + var_164_4 and arg_161_1.time_ < var_164_1 + var_164_4 + arg_164_0 then
				var_164_0.localPosition = Vector3.New(390, -490, 18)
			end

			local var_164_7 = arg_161_1.actors_["10059"]
			local var_164_8 = 0

			if var_164_8 < arg_161_1.time_ and arg_161_1.time_ <= var_164_8 + arg_164_0 and arg_161_1.var_.actorSpriteComps10059 == nil then
				arg_161_1.var_.actorSpriteComps10059 = var_164_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_164_9 = 0.034

			if var_164_8 <= arg_161_1.time_ and arg_161_1.time_ < var_164_8 + var_164_9 then
				local var_164_10 = (arg_161_1.time_ - var_164_8) / var_164_9

				if arg_161_1.var_.actorSpriteComps10059 then
					for iter_164_1, iter_164_2 in pairs(arg_161_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_164_2 then
							local var_164_11 = Mathf.Lerp(iter_164_2.color.r, 0.5, var_164_10)

							iter_164_2.color = Color.New(var_164_11, var_164_11, var_164_11)
						end
					end
				end
			end

			if arg_161_1.time_ >= var_164_8 + var_164_9 and arg_161_1.time_ < var_164_8 + var_164_9 + arg_164_0 and arg_161_1.var_.actorSpriteComps10059 then
				local var_164_12 = 0.5

				for iter_164_3, iter_164_4 in pairs(arg_161_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_164_4 then
						iter_164_4.color = Color.New(var_164_12, var_164_12, var_164_12)
					end
				end

				arg_161_1.var_.actorSpriteComps10059 = nil
			end

			local var_164_13 = arg_161_1.actors_["1061"]
			local var_164_14 = 0

			if var_164_14 < arg_161_1.time_ and arg_161_1.time_ <= var_164_14 + arg_164_0 and arg_161_1.var_.actorSpriteComps1061 == nil then
				arg_161_1.var_.actorSpriteComps1061 = var_164_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_164_15 = 0.034

			if var_164_14 <= arg_161_1.time_ and arg_161_1.time_ < var_164_14 + var_164_15 then
				local var_164_16 = (arg_161_1.time_ - var_164_14) / var_164_15

				if arg_161_1.var_.actorSpriteComps1061 then
					for iter_164_5, iter_164_6 in pairs(arg_161_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_164_6 then
							local var_164_17 = Mathf.Lerp(iter_164_6.color.r, 1, var_164_16)

							iter_164_6.color = Color.New(var_164_17, var_164_17, var_164_17)
						end
					end
				end
			end

			if arg_161_1.time_ >= var_164_14 + var_164_15 and arg_161_1.time_ < var_164_14 + var_164_15 + arg_164_0 and arg_161_1.var_.actorSpriteComps1061 then
				local var_164_18 = 1

				for iter_164_7, iter_164_8 in pairs(arg_161_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_164_8 then
						iter_164_8.color = Color.New(var_164_18, var_164_18, var_164_18)
					end
				end

				arg_161_1.var_.actorSpriteComps1061 = nil
			end

			local var_164_19 = 0
			local var_164_20 = 0.4

			if var_164_19 < arg_161_1.time_ and arg_161_1.time_ <= var_164_19 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_21 = arg_161_1:FormatText(StoryNameCfg[612].name)

				arg_161_1.leftNameTxt_.text = var_164_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_22 = arg_161_1:GetWordFromCfg(410202039)
				local var_164_23 = arg_161_1:FormatText(var_164_22.content)

				arg_161_1.text_.text = var_164_23

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_24 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202039", "story_v_out_410202.awb") ~= 0 then
					local var_164_27 = manager.audio:GetVoiceLength("story_v_out_410202", "410202039", "story_v_out_410202.awb") / 1000

					if var_164_27 + var_164_19 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_27 + var_164_19
					end

					if var_164_22.prefab_name ~= "" and arg_161_1.actors_[var_164_22.prefab_name] ~= nil then
						local var_164_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_22.prefab_name].transform, "story_v_out_410202", "410202039", "story_v_out_410202.awb")

						arg_161_1:RecordAudio("410202039", var_164_28)
						arg_161_1:RecordAudio("410202039", var_164_28)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_410202", "410202039", "story_v_out_410202.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_410202", "410202039", "story_v_out_410202.awb")
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
	Play410202040 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 410202040
		arg_165_1.duration_ = 12.5

		local var_165_0 = {
			ja = 12.5,
			CriLanguages = 7.133,
			zh = 7.133
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
				arg_165_0:Play410202041(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["10059"].transform
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				arg_165_1.var_.moveOldPos10059 = var_168_0.localPosition
				var_168_0.localScale = Vector3.New(1, 1, 1)

				arg_165_1:CheckSpriteTmpPos("10059", 2)

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
				local var_168_6 = Vector3.New(-390, -530, 35)

				var_168_0.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos10059, var_168_6, var_168_5)
			end

			if arg_165_1.time_ >= var_168_1 + var_168_4 and arg_165_1.time_ < var_168_1 + var_168_4 + arg_168_0 then
				var_168_0.localPosition = Vector3.New(-390, -530, 35)
			end

			local var_168_7 = arg_165_1.actors_["10059"]
			local var_168_8 = 0

			if var_168_8 < arg_165_1.time_ and arg_165_1.time_ <= var_168_8 + arg_168_0 and arg_165_1.var_.actorSpriteComps10059 == nil then
				arg_165_1.var_.actorSpriteComps10059 = var_168_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_168_9 = 0.034

			if var_168_8 <= arg_165_1.time_ and arg_165_1.time_ < var_168_8 + var_168_9 then
				local var_168_10 = (arg_165_1.time_ - var_168_8) / var_168_9

				if arg_165_1.var_.actorSpriteComps10059 then
					for iter_168_1, iter_168_2 in pairs(arg_165_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_168_2 then
							local var_168_11 = Mathf.Lerp(iter_168_2.color.r, 1, var_168_10)

							iter_168_2.color = Color.New(var_168_11, var_168_11, var_168_11)
						end
					end
				end
			end

			if arg_165_1.time_ >= var_168_8 + var_168_9 and arg_165_1.time_ < var_168_8 + var_168_9 + arg_168_0 and arg_165_1.var_.actorSpriteComps10059 then
				local var_168_12 = 1

				for iter_168_3, iter_168_4 in pairs(arg_165_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_168_4 then
						iter_168_4.color = Color.New(var_168_12, var_168_12, var_168_12)
					end
				end

				arg_165_1.var_.actorSpriteComps10059 = nil
			end

			local var_168_13 = arg_165_1.actors_["1061"]
			local var_168_14 = 0

			if var_168_14 < arg_165_1.time_ and arg_165_1.time_ <= var_168_14 + arg_168_0 and arg_165_1.var_.actorSpriteComps1061 == nil then
				arg_165_1.var_.actorSpriteComps1061 = var_168_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_168_15 = 0.034

			if var_168_14 <= arg_165_1.time_ and arg_165_1.time_ < var_168_14 + var_168_15 then
				local var_168_16 = (arg_165_1.time_ - var_168_14) / var_168_15

				if arg_165_1.var_.actorSpriteComps1061 then
					for iter_168_5, iter_168_6 in pairs(arg_165_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_168_6 then
							local var_168_17 = Mathf.Lerp(iter_168_6.color.r, 0.5, var_168_16)

							iter_168_6.color = Color.New(var_168_17, var_168_17, var_168_17)
						end
					end
				end
			end

			if arg_165_1.time_ >= var_168_14 + var_168_15 and arg_165_1.time_ < var_168_14 + var_168_15 + arg_168_0 and arg_165_1.var_.actorSpriteComps1061 then
				local var_168_18 = 0.5

				for iter_168_7, iter_168_8 in pairs(arg_165_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_168_8 then
						iter_168_8.color = Color.New(var_168_18, var_168_18, var_168_18)
					end
				end

				arg_165_1.var_.actorSpriteComps1061 = nil
			end

			local var_168_19 = 0
			local var_168_20 = 0.875

			if var_168_19 < arg_165_1.time_ and arg_165_1.time_ <= var_168_19 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_21 = arg_165_1:FormatText(StoryNameCfg[596].name)

				arg_165_1.leftNameTxt_.text = var_168_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_22 = arg_165_1:GetWordFromCfg(410202040)
				local var_168_23 = arg_165_1:FormatText(var_168_22.content)

				arg_165_1.text_.text = var_168_23

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_24 = 35
				local var_168_25 = utf8.len(var_168_23)
				local var_168_26 = var_168_24 <= 0 and var_168_20 or var_168_20 * (var_168_25 / var_168_24)

				if var_168_26 > 0 and var_168_20 < var_168_26 then
					arg_165_1.talkMaxDuration = var_168_26

					if var_168_26 + var_168_19 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_26 + var_168_19
					end
				end

				arg_165_1.text_.text = var_168_23
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202040", "story_v_out_410202.awb") ~= 0 then
					local var_168_27 = manager.audio:GetVoiceLength("story_v_out_410202", "410202040", "story_v_out_410202.awb") / 1000

					if var_168_27 + var_168_19 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_27 + var_168_19
					end

					if var_168_22.prefab_name ~= "" and arg_165_1.actors_[var_168_22.prefab_name] ~= nil then
						local var_168_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_22.prefab_name].transform, "story_v_out_410202", "410202040", "story_v_out_410202.awb")

						arg_165_1:RecordAudio("410202040", var_168_28)
						arg_165_1:RecordAudio("410202040", var_168_28)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_410202", "410202040", "story_v_out_410202.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_410202", "410202040", "story_v_out_410202.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_29 = math.max(var_168_20, arg_165_1.talkMaxDuration)

			if var_168_19 <= arg_165_1.time_ and arg_165_1.time_ < var_168_19 + var_168_29 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_19) / var_168_29

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_19 + var_168_29 and arg_165_1.time_ < var_168_19 + var_168_29 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play410202041 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 410202041
		arg_169_1.duration_ = 8.5

		local var_169_0 = {
			ja = 8.5,
			CriLanguages = 6.3,
			zh = 6.3
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
				arg_169_0:Play410202042(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["10059"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos10059 = var_172_0.localPosition
				var_172_0.localScale = Vector3.New(1, 1, 1)

				arg_169_1:CheckSpriteTmpPos("10059", 2)

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
				local var_172_6 = Vector3.New(-390, -530, 35)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos10059, var_172_6, var_172_5)
			end

			if arg_169_1.time_ >= var_172_1 + var_172_4 and arg_169_1.time_ < var_172_1 + var_172_4 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(-390, -530, 35)
			end

			local var_172_7 = 0
			local var_172_8 = 0.75

			if var_172_7 < arg_169_1.time_ and arg_169_1.time_ <= var_172_7 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_9 = arg_169_1:FormatText(StoryNameCfg[596].name)

				arg_169_1.leftNameTxt_.text = var_172_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_10 = arg_169_1:GetWordFromCfg(410202041)
				local var_172_11 = arg_169_1:FormatText(var_172_10.content)

				arg_169_1.text_.text = var_172_11

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_12 = 30
				local var_172_13 = utf8.len(var_172_11)
				local var_172_14 = var_172_12 <= 0 and var_172_8 or var_172_8 * (var_172_13 / var_172_12)

				if var_172_14 > 0 and var_172_8 < var_172_14 then
					arg_169_1.talkMaxDuration = var_172_14

					if var_172_14 + var_172_7 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_14 + var_172_7
					end
				end

				arg_169_1.text_.text = var_172_11
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202041", "story_v_out_410202.awb") ~= 0 then
					local var_172_15 = manager.audio:GetVoiceLength("story_v_out_410202", "410202041", "story_v_out_410202.awb") / 1000

					if var_172_15 + var_172_7 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_15 + var_172_7
					end

					if var_172_10.prefab_name ~= "" and arg_169_1.actors_[var_172_10.prefab_name] ~= nil then
						local var_172_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_10.prefab_name].transform, "story_v_out_410202", "410202041", "story_v_out_410202.awb")

						arg_169_1:RecordAudio("410202041", var_172_16)
						arg_169_1:RecordAudio("410202041", var_172_16)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_410202", "410202041", "story_v_out_410202.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_410202", "410202041", "story_v_out_410202.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_17 = math.max(var_172_8, arg_169_1.talkMaxDuration)

			if var_172_7 <= arg_169_1.time_ and arg_169_1.time_ < var_172_7 + var_172_17 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_7) / var_172_17

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_7 + var_172_17 and arg_169_1.time_ < var_172_7 + var_172_17 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play410202042 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 410202042
		arg_173_1.duration_ = 9.7

		local var_173_0 = {
			ja = 9.7,
			CriLanguages = 5.2,
			zh = 5.2
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
				arg_173_0:Play410202043(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1061"].transform
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.var_.moveOldPos1061 = var_176_0.localPosition
				var_176_0.localScale = Vector3.New(1, 1, 1)

				arg_173_1:CheckSpriteTmpPos("1061", 4)

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
				local var_176_6 = Vector3.New(390, -490, 18)

				var_176_0.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1061, var_176_6, var_176_5)
			end

			if arg_173_1.time_ >= var_176_1 + var_176_4 and arg_173_1.time_ < var_176_1 + var_176_4 + arg_176_0 then
				var_176_0.localPosition = Vector3.New(390, -490, 18)
			end

			local var_176_7 = arg_173_1.actors_["10059"]
			local var_176_8 = 0

			if var_176_8 < arg_173_1.time_ and arg_173_1.time_ <= var_176_8 + arg_176_0 and arg_173_1.var_.actorSpriteComps10059 == nil then
				arg_173_1.var_.actorSpriteComps10059 = var_176_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_176_9 = 0.034

			if var_176_8 <= arg_173_1.time_ and arg_173_1.time_ < var_176_8 + var_176_9 then
				local var_176_10 = (arg_173_1.time_ - var_176_8) / var_176_9

				if arg_173_1.var_.actorSpriteComps10059 then
					for iter_176_1, iter_176_2 in pairs(arg_173_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_176_2 then
							local var_176_11 = Mathf.Lerp(iter_176_2.color.r, 0.5, var_176_10)

							iter_176_2.color = Color.New(var_176_11, var_176_11, var_176_11)
						end
					end
				end
			end

			if arg_173_1.time_ >= var_176_8 + var_176_9 and arg_173_1.time_ < var_176_8 + var_176_9 + arg_176_0 and arg_173_1.var_.actorSpriteComps10059 then
				local var_176_12 = 0.5

				for iter_176_3, iter_176_4 in pairs(arg_173_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_176_4 then
						iter_176_4.color = Color.New(var_176_12, var_176_12, var_176_12)
					end
				end

				arg_173_1.var_.actorSpriteComps10059 = nil
			end

			local var_176_13 = arg_173_1.actors_["1061"]
			local var_176_14 = 0

			if var_176_14 < arg_173_1.time_ and arg_173_1.time_ <= var_176_14 + arg_176_0 and arg_173_1.var_.actorSpriteComps1061 == nil then
				arg_173_1.var_.actorSpriteComps1061 = var_176_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_176_15 = 0.034

			if var_176_14 <= arg_173_1.time_ and arg_173_1.time_ < var_176_14 + var_176_15 then
				local var_176_16 = (arg_173_1.time_ - var_176_14) / var_176_15

				if arg_173_1.var_.actorSpriteComps1061 then
					for iter_176_5, iter_176_6 in pairs(arg_173_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_176_6 then
							local var_176_17 = Mathf.Lerp(iter_176_6.color.r, 1, var_176_16)

							iter_176_6.color = Color.New(var_176_17, var_176_17, var_176_17)
						end
					end
				end
			end

			if arg_173_1.time_ >= var_176_14 + var_176_15 and arg_173_1.time_ < var_176_14 + var_176_15 + arg_176_0 and arg_173_1.var_.actorSpriteComps1061 then
				local var_176_18 = 1

				for iter_176_7, iter_176_8 in pairs(arg_173_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_176_8 then
						iter_176_8.color = Color.New(var_176_18, var_176_18, var_176_18)
					end
				end

				arg_173_1.var_.actorSpriteComps1061 = nil
			end

			local var_176_19 = 0
			local var_176_20 = 0.675

			if var_176_19 < arg_173_1.time_ and arg_173_1.time_ <= var_176_19 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_21 = arg_173_1:FormatText(StoryNameCfg[612].name)

				arg_173_1.leftNameTxt_.text = var_176_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_22 = arg_173_1:GetWordFromCfg(410202042)
				local var_176_23 = arg_173_1:FormatText(var_176_22.content)

				arg_173_1.text_.text = var_176_23

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_24 = 27
				local var_176_25 = utf8.len(var_176_23)
				local var_176_26 = var_176_24 <= 0 and var_176_20 or var_176_20 * (var_176_25 / var_176_24)

				if var_176_26 > 0 and var_176_20 < var_176_26 then
					arg_173_1.talkMaxDuration = var_176_26

					if var_176_26 + var_176_19 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_26 + var_176_19
					end
				end

				arg_173_1.text_.text = var_176_23
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202042", "story_v_out_410202.awb") ~= 0 then
					local var_176_27 = manager.audio:GetVoiceLength("story_v_out_410202", "410202042", "story_v_out_410202.awb") / 1000

					if var_176_27 + var_176_19 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_27 + var_176_19
					end

					if var_176_22.prefab_name ~= "" and arg_173_1.actors_[var_176_22.prefab_name] ~= nil then
						local var_176_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_22.prefab_name].transform, "story_v_out_410202", "410202042", "story_v_out_410202.awb")

						arg_173_1:RecordAudio("410202042", var_176_28)
						arg_173_1:RecordAudio("410202042", var_176_28)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_410202", "410202042", "story_v_out_410202.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_410202", "410202042", "story_v_out_410202.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_29 = math.max(var_176_20, arg_173_1.talkMaxDuration)

			if var_176_19 <= arg_173_1.time_ and arg_173_1.time_ < var_176_19 + var_176_29 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_19) / var_176_29

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_19 + var_176_29 and arg_173_1.time_ < var_176_19 + var_176_29 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play410202043 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 410202043
		arg_177_1.duration_ = 1.833

		local var_177_0 = {
			ja = 1.833,
			CriLanguages = 1.266,
			zh = 1.266
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
				arg_177_0:Play410202044(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["10059"].transform
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 then
				arg_177_1.var_.moveOldPos10059 = var_180_0.localPosition
				var_180_0.localScale = Vector3.New(1, 1, 1)

				arg_177_1:CheckSpriteTmpPos("10059", 2)

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
				local var_180_6 = Vector3.New(-390, -530, 35)

				var_180_0.localPosition = Vector3.Lerp(arg_177_1.var_.moveOldPos10059, var_180_6, var_180_5)
			end

			if arg_177_1.time_ >= var_180_1 + var_180_4 and arg_177_1.time_ < var_180_1 + var_180_4 + arg_180_0 then
				var_180_0.localPosition = Vector3.New(-390, -530, 35)
			end

			local var_180_7 = arg_177_1.actors_["10059"]
			local var_180_8 = 0

			if var_180_8 < arg_177_1.time_ and arg_177_1.time_ <= var_180_8 + arg_180_0 and arg_177_1.var_.actorSpriteComps10059 == nil then
				arg_177_1.var_.actorSpriteComps10059 = var_180_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_180_9 = 0.034

			if var_180_8 <= arg_177_1.time_ and arg_177_1.time_ < var_180_8 + var_180_9 then
				local var_180_10 = (arg_177_1.time_ - var_180_8) / var_180_9

				if arg_177_1.var_.actorSpriteComps10059 then
					for iter_180_1, iter_180_2 in pairs(arg_177_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_180_2 then
							local var_180_11 = Mathf.Lerp(iter_180_2.color.r, 1, var_180_10)

							iter_180_2.color = Color.New(var_180_11, var_180_11, var_180_11)
						end
					end
				end
			end

			if arg_177_1.time_ >= var_180_8 + var_180_9 and arg_177_1.time_ < var_180_8 + var_180_9 + arg_180_0 and arg_177_1.var_.actorSpriteComps10059 then
				local var_180_12 = 1

				for iter_180_3, iter_180_4 in pairs(arg_177_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_180_4 then
						iter_180_4.color = Color.New(var_180_12, var_180_12, var_180_12)
					end
				end

				arg_177_1.var_.actorSpriteComps10059 = nil
			end

			local var_180_13 = arg_177_1.actors_["1061"]
			local var_180_14 = 0

			if var_180_14 < arg_177_1.time_ and arg_177_1.time_ <= var_180_14 + arg_180_0 and arg_177_1.var_.actorSpriteComps1061 == nil then
				arg_177_1.var_.actorSpriteComps1061 = var_180_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_180_15 = 0.034

			if var_180_14 <= arg_177_1.time_ and arg_177_1.time_ < var_180_14 + var_180_15 then
				local var_180_16 = (arg_177_1.time_ - var_180_14) / var_180_15

				if arg_177_1.var_.actorSpriteComps1061 then
					for iter_180_5, iter_180_6 in pairs(arg_177_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_180_6 then
							local var_180_17 = Mathf.Lerp(iter_180_6.color.r, 0.5, var_180_16)

							iter_180_6.color = Color.New(var_180_17, var_180_17, var_180_17)
						end
					end
				end
			end

			if arg_177_1.time_ >= var_180_14 + var_180_15 and arg_177_1.time_ < var_180_14 + var_180_15 + arg_180_0 and arg_177_1.var_.actorSpriteComps1061 then
				local var_180_18 = 0.5

				for iter_180_7, iter_180_8 in pairs(arg_177_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_180_8 then
						iter_180_8.color = Color.New(var_180_18, var_180_18, var_180_18)
					end
				end

				arg_177_1.var_.actorSpriteComps1061 = nil
			end

			local var_180_19 = 0
			local var_180_20 = 0.1

			if var_180_19 < arg_177_1.time_ and arg_177_1.time_ <= var_180_19 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_21 = arg_177_1:FormatText(StoryNameCfg[596].name)

				arg_177_1.leftNameTxt_.text = var_180_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_22 = arg_177_1:GetWordFromCfg(410202043)
				local var_180_23 = arg_177_1:FormatText(var_180_22.content)

				arg_177_1.text_.text = var_180_23

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_24 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202043", "story_v_out_410202.awb") ~= 0 then
					local var_180_27 = manager.audio:GetVoiceLength("story_v_out_410202", "410202043", "story_v_out_410202.awb") / 1000

					if var_180_27 + var_180_19 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_27 + var_180_19
					end

					if var_180_22.prefab_name ~= "" and arg_177_1.actors_[var_180_22.prefab_name] ~= nil then
						local var_180_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_22.prefab_name].transform, "story_v_out_410202", "410202043", "story_v_out_410202.awb")

						arg_177_1:RecordAudio("410202043", var_180_28)
						arg_177_1:RecordAudio("410202043", var_180_28)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_410202", "410202043", "story_v_out_410202.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_410202", "410202043", "story_v_out_410202.awb")
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
	Play410202044 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 410202044
		arg_181_1.duration_ = 2.633

		local var_181_0 = {
			ja = 2.633,
			CriLanguages = 2.2,
			zh = 2.2
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
				arg_181_0:Play410202045(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["10059"].transform
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 then
				arg_181_1.var_.moveOldPos10059 = var_184_0.localPosition
				var_184_0.localScale = Vector3.New(1, 1, 1)

				arg_181_1:CheckSpriteTmpPos("10059", 7)

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
				local var_184_6 = Vector3.New(0, -2000, 35)

				var_184_0.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos10059, var_184_6, var_184_5)
			end

			if arg_181_1.time_ >= var_184_1 + var_184_4 and arg_181_1.time_ < var_184_1 + var_184_4 + arg_184_0 then
				var_184_0.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_184_7 = arg_181_1.actors_["1061"].transform
			local var_184_8 = 0

			if var_184_8 < arg_181_1.time_ and arg_181_1.time_ <= var_184_8 + arg_184_0 then
				arg_181_1.var_.moveOldPos1061 = var_184_7.localPosition
				var_184_7.localScale = Vector3.New(1, 1, 1)

				arg_181_1:CheckSpriteTmpPos("1061", 7)

				local var_184_9 = var_184_7.childCount

				for iter_184_1 = 0, var_184_9 - 1 do
					local var_184_10 = var_184_7:GetChild(iter_184_1)

					if var_184_10.name == "" or not string.find(var_184_10.name, "split") then
						var_184_10.gameObject:SetActive(true)
					else
						var_184_10.gameObject:SetActive(false)
					end
				end
			end

			local var_184_11 = 0.001

			if var_184_8 <= arg_181_1.time_ and arg_181_1.time_ < var_184_8 + var_184_11 then
				local var_184_12 = (arg_181_1.time_ - var_184_8) / var_184_11
				local var_184_13 = Vector3.New(0, -2000, 18)

				var_184_7.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos1061, var_184_13, var_184_12)
			end

			if arg_181_1.time_ >= var_184_8 + var_184_11 and arg_181_1.time_ < var_184_8 + var_184_11 + arg_184_0 then
				var_184_7.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_184_14 = "10060"

			if arg_181_1.actors_[var_184_14] == nil then
				local var_184_15 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_184_14), arg_181_1.canvasGo_.transform)

				var_184_15.transform:SetSiblingIndex(1)

				var_184_15.name = var_184_14
				var_184_15.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_181_1.actors_[var_184_14] = var_184_15
			end

			local var_184_16 = arg_181_1.actors_["10060"].transform
			local var_184_17 = 0

			if var_184_17 < arg_181_1.time_ and arg_181_1.time_ <= var_184_17 + arg_184_0 then
				arg_181_1.var_.moveOldPos10060 = var_184_16.localPosition
				var_184_16.localScale = Vector3.New(1, 1, 1)

				arg_181_1:CheckSpriteTmpPos("10060", 3)

				local var_184_18 = var_184_16.childCount

				for iter_184_2 = 0, var_184_18 - 1 do
					local var_184_19 = var_184_16:GetChild(iter_184_2)

					if var_184_19.name == "" or not string.find(var_184_19.name, "split") then
						var_184_19.gameObject:SetActive(true)
					else
						var_184_19.gameObject:SetActive(false)
					end
				end
			end

			local var_184_20 = 0.001

			if var_184_17 <= arg_181_1.time_ and arg_181_1.time_ < var_184_17 + var_184_20 then
				local var_184_21 = (arg_181_1.time_ - var_184_17) / var_184_20
				local var_184_22 = Vector3.New(0, -400, 0)

				var_184_16.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos10060, var_184_22, var_184_21)
			end

			if arg_181_1.time_ >= var_184_17 + var_184_20 and arg_181_1.time_ < var_184_17 + var_184_20 + arg_184_0 then
				var_184_16.localPosition = Vector3.New(0, -400, 0)
			end

			local var_184_23 = arg_181_1.actors_["10059"]
			local var_184_24 = 0

			if var_184_24 < arg_181_1.time_ and arg_181_1.time_ <= var_184_24 + arg_184_0 and arg_181_1.var_.actorSpriteComps10059 == nil then
				arg_181_1.var_.actorSpriteComps10059 = var_184_23:GetComponentsInChildren(typeof(Image), true)
			end

			local var_184_25 = 0.034

			if var_184_24 <= arg_181_1.time_ and arg_181_1.time_ < var_184_24 + var_184_25 then
				local var_184_26 = (arg_181_1.time_ - var_184_24) / var_184_25

				if arg_181_1.var_.actorSpriteComps10059 then
					for iter_184_3, iter_184_4 in pairs(arg_181_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_184_4 then
							local var_184_27 = Mathf.Lerp(iter_184_4.color.r, 0.5, var_184_26)

							iter_184_4.color = Color.New(var_184_27, var_184_27, var_184_27)
						end
					end
				end
			end

			if arg_181_1.time_ >= var_184_24 + var_184_25 and arg_181_1.time_ < var_184_24 + var_184_25 + arg_184_0 and arg_181_1.var_.actorSpriteComps10059 then
				local var_184_28 = 0.5

				for iter_184_5, iter_184_6 in pairs(arg_181_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_184_6 then
						iter_184_6.color = Color.New(var_184_28, var_184_28, var_184_28)
					end
				end

				arg_181_1.var_.actorSpriteComps10059 = nil
			end

			local var_184_29 = arg_181_1.actors_["1061"]
			local var_184_30 = 0

			if var_184_30 < arg_181_1.time_ and arg_181_1.time_ <= var_184_30 + arg_184_0 and arg_181_1.var_.actorSpriteComps1061 == nil then
				arg_181_1.var_.actorSpriteComps1061 = var_184_29:GetComponentsInChildren(typeof(Image), true)
			end

			local var_184_31 = 0.034

			if var_184_30 <= arg_181_1.time_ and arg_181_1.time_ < var_184_30 + var_184_31 then
				local var_184_32 = (arg_181_1.time_ - var_184_30) / var_184_31

				if arg_181_1.var_.actorSpriteComps1061 then
					for iter_184_7, iter_184_8 in pairs(arg_181_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_184_8 then
							local var_184_33 = Mathf.Lerp(iter_184_8.color.r, 0.5, var_184_32)

							iter_184_8.color = Color.New(var_184_33, var_184_33, var_184_33)
						end
					end
				end
			end

			if arg_181_1.time_ >= var_184_30 + var_184_31 and arg_181_1.time_ < var_184_30 + var_184_31 + arg_184_0 and arg_181_1.var_.actorSpriteComps1061 then
				local var_184_34 = 0.5

				for iter_184_9, iter_184_10 in pairs(arg_181_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_184_10 then
						iter_184_10.color = Color.New(var_184_34, var_184_34, var_184_34)
					end
				end

				arg_181_1.var_.actorSpriteComps1061 = nil
			end

			local var_184_35 = arg_181_1.actors_["10060"]
			local var_184_36 = 0

			if var_184_36 < arg_181_1.time_ and arg_181_1.time_ <= var_184_36 + arg_184_0 and arg_181_1.var_.actorSpriteComps10060 == nil then
				arg_181_1.var_.actorSpriteComps10060 = var_184_35:GetComponentsInChildren(typeof(Image), true)
			end

			local var_184_37 = 0.034

			if var_184_36 <= arg_181_1.time_ and arg_181_1.time_ < var_184_36 + var_184_37 then
				local var_184_38 = (arg_181_1.time_ - var_184_36) / var_184_37

				if arg_181_1.var_.actorSpriteComps10060 then
					for iter_184_11, iter_184_12 in pairs(arg_181_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_184_12 then
							local var_184_39 = Mathf.Lerp(iter_184_12.color.r, 1, var_184_38)

							iter_184_12.color = Color.New(var_184_39, var_184_39, var_184_39)
						end
					end
				end
			end

			if arg_181_1.time_ >= var_184_36 + var_184_37 and arg_181_1.time_ < var_184_36 + var_184_37 + arg_184_0 and arg_181_1.var_.actorSpriteComps10060 then
				local var_184_40 = 1

				for iter_184_13, iter_184_14 in pairs(arg_181_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_184_14 then
						iter_184_14.color = Color.New(var_184_40, var_184_40, var_184_40)
					end
				end

				arg_181_1.var_.actorSpriteComps10060 = nil
			end

			local var_184_41 = 0
			local var_184_42 = 0.225

			if var_184_41 < arg_181_1.time_ and arg_181_1.time_ <= var_184_41 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_43 = arg_181_1:FormatText(StoryNameCfg[597].name)

				arg_181_1.leftNameTxt_.text = var_184_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_44 = arg_181_1:GetWordFromCfg(410202044)
				local var_184_45 = arg_181_1:FormatText(var_184_44.content)

				arg_181_1.text_.text = var_184_45

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_46 = 9
				local var_184_47 = utf8.len(var_184_45)
				local var_184_48 = var_184_46 <= 0 and var_184_42 or var_184_42 * (var_184_47 / var_184_46)

				if var_184_48 > 0 and var_184_42 < var_184_48 then
					arg_181_1.talkMaxDuration = var_184_48

					if var_184_48 + var_184_41 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_48 + var_184_41
					end
				end

				arg_181_1.text_.text = var_184_45
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202044", "story_v_out_410202.awb") ~= 0 then
					local var_184_49 = manager.audio:GetVoiceLength("story_v_out_410202", "410202044", "story_v_out_410202.awb") / 1000

					if var_184_49 + var_184_41 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_49 + var_184_41
					end

					if var_184_44.prefab_name ~= "" and arg_181_1.actors_[var_184_44.prefab_name] ~= nil then
						local var_184_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_44.prefab_name].transform, "story_v_out_410202", "410202044", "story_v_out_410202.awb")

						arg_181_1:RecordAudio("410202044", var_184_50)
						arg_181_1:RecordAudio("410202044", var_184_50)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_410202", "410202044", "story_v_out_410202.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_410202", "410202044", "story_v_out_410202.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_51 = math.max(var_184_42, arg_181_1.talkMaxDuration)

			if var_184_41 <= arg_181_1.time_ and arg_181_1.time_ < var_184_41 + var_184_51 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_41) / var_184_51

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_41 + var_184_51 and arg_181_1.time_ < var_184_41 + var_184_51 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play410202045 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 410202045
		arg_185_1.duration_ = 3.7

		local var_185_0 = {
			ja = 3.7,
			CriLanguages = 1.366,
			zh = 1.366
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
				arg_185_0:Play410202046(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["10060"].transform
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 then
				arg_185_1.var_.moveOldPos10060 = var_188_0.localPosition
				var_188_0.localScale = Vector3.New(1, 1, 1)

				arg_185_1:CheckSpriteTmpPos("10060", 7)

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
				local var_188_6 = Vector3.New(0, -2000, 0)

				var_188_0.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos10060, var_188_6, var_188_5)
			end

			if arg_185_1.time_ >= var_188_1 + var_188_4 and arg_185_1.time_ < var_188_1 + var_188_4 + arg_188_0 then
				var_188_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_188_7 = arg_185_1.actors_["10059"].transform
			local var_188_8 = 0

			if var_188_8 < arg_185_1.time_ and arg_185_1.time_ <= var_188_8 + arg_188_0 then
				arg_185_1.var_.moveOldPos10059 = var_188_7.localPosition
				var_188_7.localScale = Vector3.New(1, 1, 1)

				arg_185_1:CheckSpriteTmpPos("10059", 2)

				local var_188_9 = var_188_7.childCount

				for iter_188_1 = 0, var_188_9 - 1 do
					local var_188_10 = var_188_7:GetChild(iter_188_1)

					if var_188_10.name == "" or not string.find(var_188_10.name, "split") then
						var_188_10.gameObject:SetActive(true)
					else
						var_188_10.gameObject:SetActive(false)
					end
				end
			end

			local var_188_11 = 0.001

			if var_188_8 <= arg_185_1.time_ and arg_185_1.time_ < var_188_8 + var_188_11 then
				local var_188_12 = (arg_185_1.time_ - var_188_8) / var_188_11
				local var_188_13 = Vector3.New(-390, -530, 35)

				var_188_7.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos10059, var_188_13, var_188_12)
			end

			if arg_185_1.time_ >= var_188_8 + var_188_11 and arg_185_1.time_ < var_188_8 + var_188_11 + arg_188_0 then
				var_188_7.localPosition = Vector3.New(-390, -530, 35)
			end

			local var_188_14 = arg_185_1.actors_["1061"].transform
			local var_188_15 = 0

			if var_188_15 < arg_185_1.time_ and arg_185_1.time_ <= var_188_15 + arg_188_0 then
				arg_185_1.var_.moveOldPos1061 = var_188_14.localPosition
				var_188_14.localScale = Vector3.New(1, 1, 1)

				arg_185_1:CheckSpriteTmpPos("1061", 4)

				local var_188_16 = var_188_14.childCount

				for iter_188_2 = 0, var_188_16 - 1 do
					local var_188_17 = var_188_14:GetChild(iter_188_2)

					if var_188_17.name == "" or not string.find(var_188_17.name, "split") then
						var_188_17.gameObject:SetActive(true)
					else
						var_188_17.gameObject:SetActive(false)
					end
				end
			end

			local var_188_18 = 0.001

			if var_188_15 <= arg_185_1.time_ and arg_185_1.time_ < var_188_15 + var_188_18 then
				local var_188_19 = (arg_185_1.time_ - var_188_15) / var_188_18
				local var_188_20 = Vector3.New(390, -490, 18)

				var_188_14.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos1061, var_188_20, var_188_19)
			end

			if arg_185_1.time_ >= var_188_15 + var_188_18 and arg_185_1.time_ < var_188_15 + var_188_18 + arg_188_0 then
				var_188_14.localPosition = Vector3.New(390, -490, 18)
			end

			local var_188_21 = arg_185_1.actors_["10060"]
			local var_188_22 = 0

			if var_188_22 < arg_185_1.time_ and arg_185_1.time_ <= var_188_22 + arg_188_0 and arg_185_1.var_.actorSpriteComps10060 == nil then
				arg_185_1.var_.actorSpriteComps10060 = var_188_21:GetComponentsInChildren(typeof(Image), true)
			end

			local var_188_23 = 0.034

			if var_188_22 <= arg_185_1.time_ and arg_185_1.time_ < var_188_22 + var_188_23 then
				local var_188_24 = (arg_185_1.time_ - var_188_22) / var_188_23

				if arg_185_1.var_.actorSpriteComps10060 then
					for iter_188_3, iter_188_4 in pairs(arg_185_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_188_4 then
							local var_188_25 = Mathf.Lerp(iter_188_4.color.r, 0.5, var_188_24)

							iter_188_4.color = Color.New(var_188_25, var_188_25, var_188_25)
						end
					end
				end
			end

			if arg_185_1.time_ >= var_188_22 + var_188_23 and arg_185_1.time_ < var_188_22 + var_188_23 + arg_188_0 and arg_185_1.var_.actorSpriteComps10060 then
				local var_188_26 = 0.5

				for iter_188_5, iter_188_6 in pairs(arg_185_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_188_6 then
						iter_188_6.color = Color.New(var_188_26, var_188_26, var_188_26)
					end
				end

				arg_185_1.var_.actorSpriteComps10060 = nil
			end

			local var_188_27 = arg_185_1.actors_["10059"]
			local var_188_28 = 0

			if var_188_28 < arg_185_1.time_ and arg_185_1.time_ <= var_188_28 + arg_188_0 and arg_185_1.var_.actorSpriteComps10059 == nil then
				arg_185_1.var_.actorSpriteComps10059 = var_188_27:GetComponentsInChildren(typeof(Image), true)
			end

			local var_188_29 = 0.034

			if var_188_28 <= arg_185_1.time_ and arg_185_1.time_ < var_188_28 + var_188_29 then
				local var_188_30 = (arg_185_1.time_ - var_188_28) / var_188_29

				if arg_185_1.var_.actorSpriteComps10059 then
					for iter_188_7, iter_188_8 in pairs(arg_185_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_188_8 then
							local var_188_31 = Mathf.Lerp(iter_188_8.color.r, 1, var_188_30)

							iter_188_8.color = Color.New(var_188_31, var_188_31, var_188_31)
						end
					end
				end
			end

			if arg_185_1.time_ >= var_188_28 + var_188_29 and arg_185_1.time_ < var_188_28 + var_188_29 + arg_188_0 and arg_185_1.var_.actorSpriteComps10059 then
				local var_188_32 = 1

				for iter_188_9, iter_188_10 in pairs(arg_185_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_188_10 then
						iter_188_10.color = Color.New(var_188_32, var_188_32, var_188_32)
					end
				end

				arg_185_1.var_.actorSpriteComps10059 = nil
			end

			local var_188_33 = arg_185_1.actors_["1061"]
			local var_188_34 = 0

			if var_188_34 < arg_185_1.time_ and arg_185_1.time_ <= var_188_34 + arg_188_0 and arg_185_1.var_.actorSpriteComps1061 == nil then
				arg_185_1.var_.actorSpriteComps1061 = var_188_33:GetComponentsInChildren(typeof(Image), true)
			end

			local var_188_35 = 0.034

			if var_188_34 <= arg_185_1.time_ and arg_185_1.time_ < var_188_34 + var_188_35 then
				local var_188_36 = (arg_185_1.time_ - var_188_34) / var_188_35

				if arg_185_1.var_.actorSpriteComps1061 then
					for iter_188_11, iter_188_12 in pairs(arg_185_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_188_12 then
							local var_188_37 = Mathf.Lerp(iter_188_12.color.r, 0.5, var_188_36)

							iter_188_12.color = Color.New(var_188_37, var_188_37, var_188_37)
						end
					end
				end
			end

			if arg_185_1.time_ >= var_188_34 + var_188_35 and arg_185_1.time_ < var_188_34 + var_188_35 + arg_188_0 and arg_185_1.var_.actorSpriteComps1061 then
				local var_188_38 = 0.5

				for iter_188_13, iter_188_14 in pairs(arg_185_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_188_14 then
						iter_188_14.color = Color.New(var_188_38, var_188_38, var_188_38)
					end
				end

				arg_185_1.var_.actorSpriteComps1061 = nil
			end

			local var_188_39 = 0
			local var_188_40 = 0.125

			if var_188_39 < arg_185_1.time_ and arg_185_1.time_ <= var_188_39 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_41 = arg_185_1:FormatText(StoryNameCfg[596].name)

				arg_185_1.leftNameTxt_.text = var_188_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_42 = arg_185_1:GetWordFromCfg(410202045)
				local var_188_43 = arg_185_1:FormatText(var_188_42.content)

				arg_185_1.text_.text = var_188_43

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_44 = 5
				local var_188_45 = utf8.len(var_188_43)
				local var_188_46 = var_188_44 <= 0 and var_188_40 or var_188_40 * (var_188_45 / var_188_44)

				if var_188_46 > 0 and var_188_40 < var_188_46 then
					arg_185_1.talkMaxDuration = var_188_46

					if var_188_46 + var_188_39 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_46 + var_188_39
					end
				end

				arg_185_1.text_.text = var_188_43
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202045", "story_v_out_410202.awb") ~= 0 then
					local var_188_47 = manager.audio:GetVoiceLength("story_v_out_410202", "410202045", "story_v_out_410202.awb") / 1000

					if var_188_47 + var_188_39 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_47 + var_188_39
					end

					if var_188_42.prefab_name ~= "" and arg_185_1.actors_[var_188_42.prefab_name] ~= nil then
						local var_188_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_42.prefab_name].transform, "story_v_out_410202", "410202045", "story_v_out_410202.awb")

						arg_185_1:RecordAudio("410202045", var_188_48)
						arg_185_1:RecordAudio("410202045", var_188_48)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_410202", "410202045", "story_v_out_410202.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_410202", "410202045", "story_v_out_410202.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_49 = math.max(var_188_40, arg_185_1.talkMaxDuration)

			if var_188_39 <= arg_185_1.time_ and arg_185_1.time_ < var_188_39 + var_188_49 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_39) / var_188_49

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_39 + var_188_49 and arg_185_1.time_ < var_188_39 + var_188_49 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play410202046 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 410202046
		arg_189_1.duration_ = 10.166

		local var_189_0 = {
			ja = 10.166,
			CriLanguages = 6.166,
			zh = 6.166
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
				arg_189_0:Play410202047(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["1061"].transform
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 then
				arg_189_1.var_.moveOldPos1061 = var_192_0.localPosition
				var_192_0.localScale = Vector3.New(1, 1, 1)

				arg_189_1:CheckSpriteTmpPos("1061", 4)

				local var_192_2 = var_192_0.childCount

				for iter_192_0 = 0, var_192_2 - 1 do
					local var_192_3 = var_192_0:GetChild(iter_192_0)

					if var_192_3.name == "split_5" or not string.find(var_192_3.name, "split") then
						var_192_3.gameObject:SetActive(true)
					else
						var_192_3.gameObject:SetActive(false)
					end
				end
			end

			local var_192_4 = 0.001

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_4 then
				local var_192_5 = (arg_189_1.time_ - var_192_1) / var_192_4
				local var_192_6 = Vector3.New(390, -490, 18)

				var_192_0.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos1061, var_192_6, var_192_5)
			end

			if arg_189_1.time_ >= var_192_1 + var_192_4 and arg_189_1.time_ < var_192_1 + var_192_4 + arg_192_0 then
				var_192_0.localPosition = Vector3.New(390, -490, 18)
			end

			local var_192_7 = arg_189_1.actors_["10059"]
			local var_192_8 = 0

			if var_192_8 < arg_189_1.time_ and arg_189_1.time_ <= var_192_8 + arg_192_0 and arg_189_1.var_.actorSpriteComps10059 == nil then
				arg_189_1.var_.actorSpriteComps10059 = var_192_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_192_9 = 0.034

			if var_192_8 <= arg_189_1.time_ and arg_189_1.time_ < var_192_8 + var_192_9 then
				local var_192_10 = (arg_189_1.time_ - var_192_8) / var_192_9

				if arg_189_1.var_.actorSpriteComps10059 then
					for iter_192_1, iter_192_2 in pairs(arg_189_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_192_2 then
							local var_192_11 = Mathf.Lerp(iter_192_2.color.r, 0.5, var_192_10)

							iter_192_2.color = Color.New(var_192_11, var_192_11, var_192_11)
						end
					end
				end
			end

			if arg_189_1.time_ >= var_192_8 + var_192_9 and arg_189_1.time_ < var_192_8 + var_192_9 + arg_192_0 and arg_189_1.var_.actorSpriteComps10059 then
				local var_192_12 = 0.5

				for iter_192_3, iter_192_4 in pairs(arg_189_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_192_4 then
						iter_192_4.color = Color.New(var_192_12, var_192_12, var_192_12)
					end
				end

				arg_189_1.var_.actorSpriteComps10059 = nil
			end

			local var_192_13 = arg_189_1.actors_["1061"]
			local var_192_14 = 0

			if var_192_14 < arg_189_1.time_ and arg_189_1.time_ <= var_192_14 + arg_192_0 and arg_189_1.var_.actorSpriteComps1061 == nil then
				arg_189_1.var_.actorSpriteComps1061 = var_192_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_192_15 = 0.034

			if var_192_14 <= arg_189_1.time_ and arg_189_1.time_ < var_192_14 + var_192_15 then
				local var_192_16 = (arg_189_1.time_ - var_192_14) / var_192_15

				if arg_189_1.var_.actorSpriteComps1061 then
					for iter_192_5, iter_192_6 in pairs(arg_189_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_192_6 then
							local var_192_17 = Mathf.Lerp(iter_192_6.color.r, 1, var_192_16)

							iter_192_6.color = Color.New(var_192_17, var_192_17, var_192_17)
						end
					end
				end
			end

			if arg_189_1.time_ >= var_192_14 + var_192_15 and arg_189_1.time_ < var_192_14 + var_192_15 + arg_192_0 and arg_189_1.var_.actorSpriteComps1061 then
				local var_192_18 = 1

				for iter_192_7, iter_192_8 in pairs(arg_189_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_192_8 then
						iter_192_8.color = Color.New(var_192_18, var_192_18, var_192_18)
					end
				end

				arg_189_1.var_.actorSpriteComps1061 = nil
			end

			local var_192_19 = 0
			local var_192_20 = 0.675

			if var_192_19 < arg_189_1.time_ and arg_189_1.time_ <= var_192_19 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_21 = arg_189_1:FormatText(StoryNameCfg[612].name)

				arg_189_1.leftNameTxt_.text = var_192_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_22 = arg_189_1:GetWordFromCfg(410202046)
				local var_192_23 = arg_189_1:FormatText(var_192_22.content)

				arg_189_1.text_.text = var_192_23

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_24 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202046", "story_v_out_410202.awb") ~= 0 then
					local var_192_27 = manager.audio:GetVoiceLength("story_v_out_410202", "410202046", "story_v_out_410202.awb") / 1000

					if var_192_27 + var_192_19 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_27 + var_192_19
					end

					if var_192_22.prefab_name ~= "" and arg_189_1.actors_[var_192_22.prefab_name] ~= nil then
						local var_192_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_22.prefab_name].transform, "story_v_out_410202", "410202046", "story_v_out_410202.awb")

						arg_189_1:RecordAudio("410202046", var_192_28)
						arg_189_1:RecordAudio("410202046", var_192_28)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_410202", "410202046", "story_v_out_410202.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_410202", "410202046", "story_v_out_410202.awb")
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
	Play410202047 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 410202047
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play410202048(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["1061"]
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 and arg_193_1.var_.actorSpriteComps1061 == nil then
				arg_193_1.var_.actorSpriteComps1061 = var_196_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_196_2 = 0.034

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2

				if arg_193_1.var_.actorSpriteComps1061 then
					for iter_196_0, iter_196_1 in pairs(arg_193_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_196_1 then
							local var_196_4 = Mathf.Lerp(iter_196_1.color.r, 0.5, var_196_3)

							iter_196_1.color = Color.New(var_196_4, var_196_4, var_196_4)
						end
					end
				end
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 and arg_193_1.var_.actorSpriteComps1061 then
				local var_196_5 = 0.5

				for iter_196_2, iter_196_3 in pairs(arg_193_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_196_3 then
						iter_196_3.color = Color.New(var_196_5, var_196_5, var_196_5)
					end
				end

				arg_193_1.var_.actorSpriteComps1061 = nil
			end

			local var_196_6 = 0
			local var_196_7 = 0.875

			if var_196_6 < arg_193_1.time_ and arg_193_1.time_ <= var_196_6 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, false)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_8 = arg_193_1:GetWordFromCfg(410202047)
				local var_196_9 = arg_193_1:FormatText(var_196_8.content)

				arg_193_1.text_.text = var_196_9

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_10 = 35
				local var_196_11 = utf8.len(var_196_9)
				local var_196_12 = var_196_10 <= 0 and var_196_7 or var_196_7 * (var_196_11 / var_196_10)

				if var_196_12 > 0 and var_196_7 < var_196_12 then
					arg_193_1.talkMaxDuration = var_196_12

					if var_196_12 + var_196_6 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_12 + var_196_6
					end
				end

				arg_193_1.text_.text = var_196_9
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_13 = math.max(var_196_7, arg_193_1.talkMaxDuration)

			if var_196_6 <= arg_193_1.time_ and arg_193_1.time_ < var_196_6 + var_196_13 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_6) / var_196_13

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_6 + var_196_13 and arg_193_1.time_ < var_196_6 + var_196_13 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play410202048 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 410202048
		arg_197_1.duration_ = 7.966

		local var_197_0 = {
			ja = 6.866,
			CriLanguages = 7.966,
			zh = 7.966
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
				arg_197_0:Play410202049(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["10059"].transform
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 then
				arg_197_1.var_.moveOldPos10059 = var_200_0.localPosition
				var_200_0.localScale = Vector3.New(1, 1, 1)

				arg_197_1:CheckSpriteTmpPos("10059", 2)

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
				local var_200_6 = Vector3.New(-390, -530, 35)

				var_200_0.localPosition = Vector3.Lerp(arg_197_1.var_.moveOldPos10059, var_200_6, var_200_5)
			end

			if arg_197_1.time_ >= var_200_1 + var_200_4 and arg_197_1.time_ < var_200_1 + var_200_4 + arg_200_0 then
				var_200_0.localPosition = Vector3.New(-390, -530, 35)
			end

			local var_200_7 = arg_197_1.actors_["10059"]
			local var_200_8 = 0

			if var_200_8 < arg_197_1.time_ and arg_197_1.time_ <= var_200_8 + arg_200_0 and arg_197_1.var_.actorSpriteComps10059 == nil then
				arg_197_1.var_.actorSpriteComps10059 = var_200_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_200_9 = 0.034

			if var_200_8 <= arg_197_1.time_ and arg_197_1.time_ < var_200_8 + var_200_9 then
				local var_200_10 = (arg_197_1.time_ - var_200_8) / var_200_9

				if arg_197_1.var_.actorSpriteComps10059 then
					for iter_200_1, iter_200_2 in pairs(arg_197_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_200_2 then
							local var_200_11 = Mathf.Lerp(iter_200_2.color.r, 1, var_200_10)

							iter_200_2.color = Color.New(var_200_11, var_200_11, var_200_11)
						end
					end
				end
			end

			if arg_197_1.time_ >= var_200_8 + var_200_9 and arg_197_1.time_ < var_200_8 + var_200_9 + arg_200_0 and arg_197_1.var_.actorSpriteComps10059 then
				local var_200_12 = 1

				for iter_200_3, iter_200_4 in pairs(arg_197_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_200_4 then
						iter_200_4.color = Color.New(var_200_12, var_200_12, var_200_12)
					end
				end

				arg_197_1.var_.actorSpriteComps10059 = nil
			end

			local var_200_13 = 0
			local var_200_14 = 0.975

			if var_200_13 < arg_197_1.time_ and arg_197_1.time_ <= var_200_13 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_15 = arg_197_1:FormatText(StoryNameCfg[596].name)

				arg_197_1.leftNameTxt_.text = var_200_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_16 = arg_197_1:GetWordFromCfg(410202048)
				local var_200_17 = arg_197_1:FormatText(var_200_16.content)

				arg_197_1.text_.text = var_200_17

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_18 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202048", "story_v_out_410202.awb") ~= 0 then
					local var_200_21 = manager.audio:GetVoiceLength("story_v_out_410202", "410202048", "story_v_out_410202.awb") / 1000

					if var_200_21 + var_200_13 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_21 + var_200_13
					end

					if var_200_16.prefab_name ~= "" and arg_197_1.actors_[var_200_16.prefab_name] ~= nil then
						local var_200_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_16.prefab_name].transform, "story_v_out_410202", "410202048", "story_v_out_410202.awb")

						arg_197_1:RecordAudio("410202048", var_200_22)
						arg_197_1:RecordAudio("410202048", var_200_22)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_410202", "410202048", "story_v_out_410202.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_410202", "410202048", "story_v_out_410202.awb")
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
	Play410202049 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 410202049
		arg_201_1.duration_ = 7.766

		local var_201_0 = {
			ja = 7.766,
			CriLanguages = 7.7,
			zh = 7.7
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
				arg_201_0:Play410202050(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = "ST64a"

			if arg_201_1.bgs_[var_204_0] == nil then
				local var_204_1 = Object.Instantiate(arg_201_1.paintGo_)

				var_204_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_204_0)
				var_204_1.name = var_204_0
				var_204_1.transform.parent = arg_201_1.stage_.transform
				var_204_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_201_1.bgs_[var_204_0] = var_204_1
			end

			local var_204_2 = 2

			if var_204_2 < arg_201_1.time_ and arg_201_1.time_ <= var_204_2 + arg_204_0 then
				local var_204_3 = manager.ui.mainCamera.transform.localPosition
				local var_204_4 = Vector3.New(0, 0, 10) + Vector3.New(var_204_3.x, var_204_3.y, 0)
				local var_204_5 = arg_201_1.bgs_.ST64a

				var_204_5.transform.localPosition = var_204_4
				var_204_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_204_6 = var_204_5:GetComponent("SpriteRenderer")

				if var_204_6 and var_204_6.sprite then
					local var_204_7 = (var_204_5.transform.localPosition - var_204_3).z
					local var_204_8 = manager.ui.mainCameraCom_
					local var_204_9 = 2 * var_204_7 * Mathf.Tan(var_204_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_204_10 = var_204_9 * var_204_8.aspect
					local var_204_11 = var_204_6.sprite.bounds.size.x
					local var_204_12 = var_204_6.sprite.bounds.size.y
					local var_204_13 = var_204_10 / var_204_11
					local var_204_14 = var_204_9 / var_204_12
					local var_204_15 = var_204_14 < var_204_13 and var_204_13 or var_204_14

					var_204_5.transform.localScale = Vector3.New(var_204_15, var_204_15, 0)
				end

				for iter_204_0, iter_204_1 in pairs(arg_201_1.bgs_) do
					if iter_204_0 ~= "ST64a" then
						iter_204_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_204_16 = 0

			if var_204_16 < arg_201_1.time_ and arg_201_1.time_ <= var_204_16 + arg_204_0 then
				arg_201_1.mask_.enabled = true
				arg_201_1.mask_.raycastTarget = true

				arg_201_1:SetGaussion(false)
			end

			local var_204_17 = 2

			if var_204_16 <= arg_201_1.time_ and arg_201_1.time_ < var_204_16 + var_204_17 then
				local var_204_18 = (arg_201_1.time_ - var_204_16) / var_204_17
				local var_204_19 = Color.New(0, 0, 0)

				var_204_19.a = Mathf.Lerp(0, 1, var_204_18)
				arg_201_1.mask_.color = var_204_19
			end

			if arg_201_1.time_ >= var_204_16 + var_204_17 and arg_201_1.time_ < var_204_16 + var_204_17 + arg_204_0 then
				local var_204_20 = Color.New(0, 0, 0)

				var_204_20.a = 1
				arg_201_1.mask_.color = var_204_20
			end

			local var_204_21 = 2

			if var_204_21 < arg_201_1.time_ and arg_201_1.time_ <= var_204_21 + arg_204_0 then
				arg_201_1.mask_.enabled = true
				arg_201_1.mask_.raycastTarget = true

				arg_201_1:SetGaussion(false)
			end

			local var_204_22 = 2

			if var_204_21 <= arg_201_1.time_ and arg_201_1.time_ < var_204_21 + var_204_22 then
				local var_204_23 = (arg_201_1.time_ - var_204_21) / var_204_22
				local var_204_24 = Color.New(0, 0, 0)

				var_204_24.a = Mathf.Lerp(1, 0, var_204_23)
				arg_201_1.mask_.color = var_204_24
			end

			if arg_201_1.time_ >= var_204_21 + var_204_22 and arg_201_1.time_ < var_204_21 + var_204_22 + arg_204_0 then
				local var_204_25 = Color.New(0, 0, 0)
				local var_204_26 = 0

				arg_201_1.mask_.enabled = false
				var_204_25.a = var_204_26
				arg_201_1.mask_.color = var_204_25
			end

			local var_204_27 = "10063"

			if arg_201_1.actors_[var_204_27] == nil then
				local var_204_28 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_204_27), arg_201_1.canvasGo_.transform)

				var_204_28.transform:SetSiblingIndex(1)

				var_204_28.name = var_204_27
				var_204_28.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_201_1.actors_[var_204_27] = var_204_28
			end

			local var_204_29 = arg_201_1.actors_["10063"].transform
			local var_204_30 = 4

			if var_204_30 < arg_201_1.time_ and arg_201_1.time_ <= var_204_30 + arg_204_0 then
				arg_201_1.var_.moveOldPos10063 = var_204_29.localPosition
				var_204_29.localScale = Vector3.New(1, 1, 1)

				arg_201_1:CheckSpriteTmpPos("10063", 3)

				local var_204_31 = var_204_29.childCount

				for iter_204_2 = 0, var_204_31 - 1 do
					local var_204_32 = var_204_29:GetChild(iter_204_2)

					if var_204_32.name == "" or not string.find(var_204_32.name, "split") then
						var_204_32.gameObject:SetActive(true)
					else
						var_204_32.gameObject:SetActive(false)
					end
				end
			end

			local var_204_33 = 0.001

			if var_204_30 <= arg_201_1.time_ and arg_201_1.time_ < var_204_30 + var_204_33 then
				local var_204_34 = (arg_201_1.time_ - var_204_30) / var_204_33
				local var_204_35 = Vector3.New(0, -535, -105)

				var_204_29.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos10063, var_204_35, var_204_34)
			end

			if arg_201_1.time_ >= var_204_30 + var_204_33 and arg_201_1.time_ < var_204_30 + var_204_33 + arg_204_0 then
				var_204_29.localPosition = Vector3.New(0, -535, -105)
			end

			local var_204_36 = arg_201_1.actors_["10063"]
			local var_204_37 = 4

			if var_204_37 < arg_201_1.time_ and arg_201_1.time_ <= var_204_37 + arg_204_0 and arg_201_1.var_.actorSpriteComps10063 == nil then
				arg_201_1.var_.actorSpriteComps10063 = var_204_36:GetComponentsInChildren(typeof(Image), true)
			end

			local var_204_38 = 0.034

			if var_204_37 <= arg_201_1.time_ and arg_201_1.time_ < var_204_37 + var_204_38 then
				local var_204_39 = (arg_201_1.time_ - var_204_37) / var_204_38

				if arg_201_1.var_.actorSpriteComps10063 then
					for iter_204_3, iter_204_4 in pairs(arg_201_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_204_4 then
							local var_204_40 = Mathf.Lerp(iter_204_4.color.r, 1, var_204_39)

							iter_204_4.color = Color.New(var_204_40, var_204_40, var_204_40)
						end
					end
				end
			end

			if arg_201_1.time_ >= var_204_37 + var_204_38 and arg_201_1.time_ < var_204_37 + var_204_38 + arg_204_0 and arg_201_1.var_.actorSpriteComps10063 then
				local var_204_41 = 1

				for iter_204_5, iter_204_6 in pairs(arg_201_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_204_6 then
						iter_204_6.color = Color.New(var_204_41, var_204_41, var_204_41)
					end
				end

				arg_201_1.var_.actorSpriteComps10063 = nil
			end

			local var_204_42 = arg_201_1.actors_["1061"].transform
			local var_204_43 = 2

			if var_204_43 < arg_201_1.time_ and arg_201_1.time_ <= var_204_43 + arg_204_0 then
				arg_201_1.var_.moveOldPos1061 = var_204_42.localPosition
				var_204_42.localScale = Vector3.New(1, 1, 1)

				arg_201_1:CheckSpriteTmpPos("1061", 7)

				local var_204_44 = var_204_42.childCount

				for iter_204_7 = 0, var_204_44 - 1 do
					local var_204_45 = var_204_42:GetChild(iter_204_7)

					if var_204_45.name == "" or not string.find(var_204_45.name, "split") then
						var_204_45.gameObject:SetActive(true)
					else
						var_204_45.gameObject:SetActive(false)
					end
				end
			end

			local var_204_46 = 0.001

			if var_204_43 <= arg_201_1.time_ and arg_201_1.time_ < var_204_43 + var_204_46 then
				local var_204_47 = (arg_201_1.time_ - var_204_43) / var_204_46
				local var_204_48 = Vector3.New(0, -2000, 18)

				var_204_42.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos1061, var_204_48, var_204_47)
			end

			if arg_201_1.time_ >= var_204_43 + var_204_46 and arg_201_1.time_ < var_204_43 + var_204_46 + arg_204_0 then
				var_204_42.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_204_49 = arg_201_1.actors_["10059"].transform
			local var_204_50 = 2

			if var_204_50 < arg_201_1.time_ and arg_201_1.time_ <= var_204_50 + arg_204_0 then
				arg_201_1.var_.moveOldPos10059 = var_204_49.localPosition
				var_204_49.localScale = Vector3.New(1, 1, 1)

				arg_201_1:CheckSpriteTmpPos("10059", 7)

				local var_204_51 = var_204_49.childCount

				for iter_204_8 = 0, var_204_51 - 1 do
					local var_204_52 = var_204_49:GetChild(iter_204_8)

					if var_204_52.name == "" or not string.find(var_204_52.name, "split") then
						var_204_52.gameObject:SetActive(true)
					else
						var_204_52.gameObject:SetActive(false)
					end
				end
			end

			local var_204_53 = 0.001

			if var_204_50 <= arg_201_1.time_ and arg_201_1.time_ < var_204_50 + var_204_53 then
				local var_204_54 = (arg_201_1.time_ - var_204_50) / var_204_53
				local var_204_55 = Vector3.New(0, -2000, 35)

				var_204_49.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos10059, var_204_55, var_204_54)
			end

			if arg_201_1.time_ >= var_204_50 + var_204_53 and arg_201_1.time_ < var_204_50 + var_204_53 + arg_204_0 then
				var_204_49.localPosition = Vector3.New(0, -2000, 35)
			end

			if arg_201_1.frameCnt_ <= 1 then
				arg_201_1.dialog_:SetActive(false)
			end

			local var_204_56 = 4
			local var_204_57 = 0.275

			if var_204_56 < arg_201_1.time_ and arg_201_1.time_ <= var_204_56 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0

				arg_201_1.dialog_:SetActive(true)

				local var_204_58 = LeanTween.value(arg_201_1.dialog_, 0, 1, 0.3)

				var_204_58:setOnUpdate(LuaHelper.FloatAction(function(arg_205_0)
					arg_201_1.dialogCg_.alpha = arg_205_0
				end))
				var_204_58:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_201_1.dialog_)
					var_204_58:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_201_1.duration_ = arg_201_1.duration_ + 0.3

				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_59 = arg_201_1:FormatText(StoryNameCfg[591].name)

				arg_201_1.leftNameTxt_.text = var_204_59

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_60 = arg_201_1:GetWordFromCfg(410202049)
				local var_204_61 = arg_201_1:FormatText(var_204_60.content)

				arg_201_1.text_.text = var_204_61

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_62 = 11
				local var_204_63 = utf8.len(var_204_61)
				local var_204_64 = var_204_62 <= 0 and var_204_57 or var_204_57 * (var_204_63 / var_204_62)

				if var_204_64 > 0 and var_204_57 < var_204_64 then
					arg_201_1.talkMaxDuration = var_204_64
					var_204_56 = var_204_56 + 0.3

					if var_204_64 + var_204_56 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_64 + var_204_56
					end
				end

				arg_201_1.text_.text = var_204_61
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202049", "story_v_out_410202.awb") ~= 0 then
					local var_204_65 = manager.audio:GetVoiceLength("story_v_out_410202", "410202049", "story_v_out_410202.awb") / 1000

					if var_204_65 + var_204_56 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_65 + var_204_56
					end

					if var_204_60.prefab_name ~= "" and arg_201_1.actors_[var_204_60.prefab_name] ~= nil then
						local var_204_66 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_60.prefab_name].transform, "story_v_out_410202", "410202049", "story_v_out_410202.awb")

						arg_201_1:RecordAudio("410202049", var_204_66)
						arg_201_1:RecordAudio("410202049", var_204_66)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_410202", "410202049", "story_v_out_410202.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_410202", "410202049", "story_v_out_410202.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_67 = var_204_56 + 0.3
			local var_204_68 = math.max(var_204_57, arg_201_1.talkMaxDuration)

			if var_204_67 <= arg_201_1.time_ and arg_201_1.time_ < var_204_67 + var_204_68 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_67) / var_204_68

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_67 + var_204_68 and arg_201_1.time_ < var_204_67 + var_204_68 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play410202050 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 410202050
		arg_207_1.duration_ = 3.566

		local var_207_0 = {
			ja = 2.7,
			CriLanguages = 3.566,
			zh = 3.566
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
				arg_207_0:Play410202051(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["10063"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos10063 = var_210_0.localPosition
				var_210_0.localScale = Vector3.New(1, 1, 1)

				arg_207_1:CheckSpriteTmpPos("10063", 7)

				local var_210_2 = var_210_0.childCount

				for iter_210_0 = 0, var_210_2 - 1 do
					local var_210_3 = var_210_0:GetChild(iter_210_0)

					if var_210_3.name == "" or not string.find(var_210_3.name, "split") then
						var_210_3.gameObject:SetActive(true)
					else
						var_210_3.gameObject:SetActive(false)
					end
				end
			end

			local var_210_4 = 0.001

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_4 then
				local var_210_5 = (arg_207_1.time_ - var_210_1) / var_210_4
				local var_210_6 = Vector3.New(0, -2000, -105)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos10063, var_210_6, var_210_5)
			end

			if arg_207_1.time_ >= var_210_1 + var_210_4 and arg_207_1.time_ < var_210_1 + var_210_4 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(0, -2000, -105)
			end

			local var_210_7 = arg_207_1.actors_["1061"].transform
			local var_210_8 = 0

			if var_210_8 < arg_207_1.time_ and arg_207_1.time_ <= var_210_8 + arg_210_0 then
				arg_207_1.var_.moveOldPos1061 = var_210_7.localPosition
				var_210_7.localScale = Vector3.New(1, 1, 1)

				arg_207_1:CheckSpriteTmpPos("1061", 3)

				local var_210_9 = var_210_7.childCount

				for iter_210_1 = 0, var_210_9 - 1 do
					local var_210_10 = var_210_7:GetChild(iter_210_1)

					if var_210_10.name == "" or not string.find(var_210_10.name, "split") then
						var_210_10.gameObject:SetActive(true)
					else
						var_210_10.gameObject:SetActive(false)
					end
				end
			end

			local var_210_11 = 0.001

			if var_210_8 <= arg_207_1.time_ and arg_207_1.time_ < var_210_8 + var_210_11 then
				local var_210_12 = (arg_207_1.time_ - var_210_8) / var_210_11
				local var_210_13 = Vector3.New(0, -490, 18)

				var_210_7.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1061, var_210_13, var_210_12)
			end

			if arg_207_1.time_ >= var_210_8 + var_210_11 and arg_207_1.time_ < var_210_8 + var_210_11 + arg_210_0 then
				var_210_7.localPosition = Vector3.New(0, -490, 18)
			end

			local var_210_14 = arg_207_1.actors_["10063"]
			local var_210_15 = 0

			if var_210_15 < arg_207_1.time_ and arg_207_1.time_ <= var_210_15 + arg_210_0 and arg_207_1.var_.actorSpriteComps10063 == nil then
				arg_207_1.var_.actorSpriteComps10063 = var_210_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_210_16 = 0.034

			if var_210_15 <= arg_207_1.time_ and arg_207_1.time_ < var_210_15 + var_210_16 then
				local var_210_17 = (arg_207_1.time_ - var_210_15) / var_210_16

				if arg_207_1.var_.actorSpriteComps10063 then
					for iter_210_2, iter_210_3 in pairs(arg_207_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_210_3 then
							local var_210_18 = Mathf.Lerp(iter_210_3.color.r, 0.5, var_210_17)

							iter_210_3.color = Color.New(var_210_18, var_210_18, var_210_18)
						end
					end
				end
			end

			if arg_207_1.time_ >= var_210_15 + var_210_16 and arg_207_1.time_ < var_210_15 + var_210_16 + arg_210_0 and arg_207_1.var_.actorSpriteComps10063 then
				local var_210_19 = 0.5

				for iter_210_4, iter_210_5 in pairs(arg_207_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_210_5 then
						iter_210_5.color = Color.New(var_210_19, var_210_19, var_210_19)
					end
				end

				arg_207_1.var_.actorSpriteComps10063 = nil
			end

			local var_210_20 = arg_207_1.actors_["1061"]
			local var_210_21 = 0

			if var_210_21 < arg_207_1.time_ and arg_207_1.time_ <= var_210_21 + arg_210_0 and arg_207_1.var_.actorSpriteComps1061 == nil then
				arg_207_1.var_.actorSpriteComps1061 = var_210_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_210_22 = 0.034

			if var_210_21 <= arg_207_1.time_ and arg_207_1.time_ < var_210_21 + var_210_22 then
				local var_210_23 = (arg_207_1.time_ - var_210_21) / var_210_22

				if arg_207_1.var_.actorSpriteComps1061 then
					for iter_210_6, iter_210_7 in pairs(arg_207_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_210_7 then
							local var_210_24 = Mathf.Lerp(iter_210_7.color.r, 1, var_210_23)

							iter_210_7.color = Color.New(var_210_24, var_210_24, var_210_24)
						end
					end
				end
			end

			if arg_207_1.time_ >= var_210_21 + var_210_22 and arg_207_1.time_ < var_210_21 + var_210_22 + arg_210_0 and arg_207_1.var_.actorSpriteComps1061 then
				local var_210_25 = 1

				for iter_210_8, iter_210_9 in pairs(arg_207_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_210_9 then
						iter_210_9.color = Color.New(var_210_25, var_210_25, var_210_25)
					end
				end

				arg_207_1.var_.actorSpriteComps1061 = nil
			end

			local var_210_26 = 0
			local var_210_27 = 0.35

			if var_210_26 < arg_207_1.time_ and arg_207_1.time_ <= var_210_26 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_28 = arg_207_1:FormatText(StoryNameCfg[612].name)

				arg_207_1.leftNameTxt_.text = var_210_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_29 = arg_207_1:GetWordFromCfg(410202050)
				local var_210_30 = arg_207_1:FormatText(var_210_29.content)

				arg_207_1.text_.text = var_210_30

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_31 = 14
				local var_210_32 = utf8.len(var_210_30)
				local var_210_33 = var_210_31 <= 0 and var_210_27 or var_210_27 * (var_210_32 / var_210_31)

				if var_210_33 > 0 and var_210_27 < var_210_33 then
					arg_207_1.talkMaxDuration = var_210_33

					if var_210_33 + var_210_26 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_33 + var_210_26
					end
				end

				arg_207_1.text_.text = var_210_30
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202050", "story_v_out_410202.awb") ~= 0 then
					local var_210_34 = manager.audio:GetVoiceLength("story_v_out_410202", "410202050", "story_v_out_410202.awb") / 1000

					if var_210_34 + var_210_26 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_34 + var_210_26
					end

					if var_210_29.prefab_name ~= "" and arg_207_1.actors_[var_210_29.prefab_name] ~= nil then
						local var_210_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_29.prefab_name].transform, "story_v_out_410202", "410202050", "story_v_out_410202.awb")

						arg_207_1:RecordAudio("410202050", var_210_35)
						arg_207_1:RecordAudio("410202050", var_210_35)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_410202", "410202050", "story_v_out_410202.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_410202", "410202050", "story_v_out_410202.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_36 = math.max(var_210_27, arg_207_1.talkMaxDuration)

			if var_210_26 <= arg_207_1.time_ and arg_207_1.time_ < var_210_26 + var_210_36 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_26) / var_210_36

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_26 + var_210_36 and arg_207_1.time_ < var_210_26 + var_210_36 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play410202051 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 410202051
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play410202052(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1061"].transform
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 then
				arg_211_1.var_.moveOldPos1061 = var_214_0.localPosition
				var_214_0.localScale = Vector3.New(1, 1, 1)

				arg_211_1:CheckSpriteTmpPos("1061", 7)

				local var_214_2 = var_214_0.childCount

				for iter_214_0 = 0, var_214_2 - 1 do
					local var_214_3 = var_214_0:GetChild(iter_214_0)

					if var_214_3.name == "" or not string.find(var_214_3.name, "split") then
						var_214_3.gameObject:SetActive(true)
					else
						var_214_3.gameObject:SetActive(false)
					end
				end
			end

			local var_214_4 = 0.001

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_4 then
				local var_214_5 = (arg_211_1.time_ - var_214_1) / var_214_4
				local var_214_6 = Vector3.New(0, -2000, 18)

				var_214_0.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos1061, var_214_6, var_214_5)
			end

			if arg_211_1.time_ >= var_214_1 + var_214_4 and arg_211_1.time_ < var_214_1 + var_214_4 + arg_214_0 then
				var_214_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_214_7 = arg_211_1.actors_["1061"]
			local var_214_8 = 0

			if var_214_8 < arg_211_1.time_ and arg_211_1.time_ <= var_214_8 + arg_214_0 and arg_211_1.var_.actorSpriteComps1061 == nil then
				arg_211_1.var_.actorSpriteComps1061 = var_214_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_214_9 = 0.034

			if var_214_8 <= arg_211_1.time_ and arg_211_1.time_ < var_214_8 + var_214_9 then
				local var_214_10 = (arg_211_1.time_ - var_214_8) / var_214_9

				if arg_211_1.var_.actorSpriteComps1061 then
					for iter_214_1, iter_214_2 in pairs(arg_211_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_214_2 then
							local var_214_11 = Mathf.Lerp(iter_214_2.color.r, 0.5, var_214_10)

							iter_214_2.color = Color.New(var_214_11, var_214_11, var_214_11)
						end
					end
				end
			end

			if arg_211_1.time_ >= var_214_8 + var_214_9 and arg_211_1.time_ < var_214_8 + var_214_9 + arg_214_0 and arg_211_1.var_.actorSpriteComps1061 then
				local var_214_12 = 0.5

				for iter_214_3, iter_214_4 in pairs(arg_211_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_214_4 then
						iter_214_4.color = Color.New(var_214_12, var_214_12, var_214_12)
					end
				end

				arg_211_1.var_.actorSpriteComps1061 = nil
			end

			local var_214_13 = 0
			local var_214_14 = 0.9

			if var_214_13 < arg_211_1.time_ and arg_211_1.time_ <= var_214_13 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, false)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_15 = arg_211_1:GetWordFromCfg(410202051)
				local var_214_16 = arg_211_1:FormatText(var_214_15.content)

				arg_211_1.text_.text = var_214_16

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_17 = 36
				local var_214_18 = utf8.len(var_214_16)
				local var_214_19 = var_214_17 <= 0 and var_214_14 or var_214_14 * (var_214_18 / var_214_17)

				if var_214_19 > 0 and var_214_14 < var_214_19 then
					arg_211_1.talkMaxDuration = var_214_19

					if var_214_19 + var_214_13 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_19 + var_214_13
					end
				end

				arg_211_1.text_.text = var_214_16
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_20 = math.max(var_214_14, arg_211_1.talkMaxDuration)

			if var_214_13 <= arg_211_1.time_ and arg_211_1.time_ < var_214_13 + var_214_20 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_13) / var_214_20

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_13 + var_214_20 and arg_211_1.time_ < var_214_13 + var_214_20 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play410202052 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 410202052
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play410202053(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 0.95

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, false)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_2 = arg_215_1:GetWordFromCfg(410202052)
				local var_218_3 = arg_215_1:FormatText(var_218_2.content)

				arg_215_1.text_.text = var_218_3

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_4 = 38
				local var_218_5 = utf8.len(var_218_3)
				local var_218_6 = var_218_4 <= 0 and var_218_1 or var_218_1 * (var_218_5 / var_218_4)

				if var_218_6 > 0 and var_218_1 < var_218_6 then
					arg_215_1.talkMaxDuration = var_218_6

					if var_218_6 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_6 + var_218_0
					end
				end

				arg_215_1.text_.text = var_218_3
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)
				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_7 = math.max(var_218_1, arg_215_1.talkMaxDuration)

			if var_218_0 <= arg_215_1.time_ and arg_215_1.time_ < var_218_0 + var_218_7 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_0) / var_218_7

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_0 + var_218_7 and arg_215_1.time_ < var_218_0 + var_218_7 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play410202053 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 410202053
		arg_219_1.duration_ = 1.8

		local var_219_0 = {
			ja = 1.8,
			CriLanguages = 1.2,
			zh = 1.2
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
				arg_219_0:Play410202054(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1061"].transform
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos1061 = var_222_0.localPosition
				var_222_0.localScale = Vector3.New(1, 1, 1)

				arg_219_1:CheckSpriteTmpPos("1061", 3)

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
				local var_222_6 = Vector3.New(0, -490, 18)

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1061, var_222_6, var_222_5)
			end

			if arg_219_1.time_ >= var_222_1 + var_222_4 and arg_219_1.time_ < var_222_1 + var_222_4 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_222_7 = arg_219_1.actors_["1061"]
			local var_222_8 = 0

			if var_222_8 < arg_219_1.time_ and arg_219_1.time_ <= var_222_8 + arg_222_0 and arg_219_1.var_.actorSpriteComps1061 == nil then
				arg_219_1.var_.actorSpriteComps1061 = var_222_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_9 = 0.034

			if var_222_8 <= arg_219_1.time_ and arg_219_1.time_ < var_222_8 + var_222_9 then
				local var_222_10 = (arg_219_1.time_ - var_222_8) / var_222_9

				if arg_219_1.var_.actorSpriteComps1061 then
					for iter_222_1, iter_222_2 in pairs(arg_219_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_222_2 then
							local var_222_11 = Mathf.Lerp(iter_222_2.color.r, 1, var_222_10)

							iter_222_2.color = Color.New(var_222_11, var_222_11, var_222_11)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_8 + var_222_9 and arg_219_1.time_ < var_222_8 + var_222_9 + arg_222_0 and arg_219_1.var_.actorSpriteComps1061 then
				local var_222_12 = 1

				for iter_222_3, iter_222_4 in pairs(arg_219_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_222_4 then
						iter_222_4.color = Color.New(var_222_12, var_222_12, var_222_12)
					end
				end

				arg_219_1.var_.actorSpriteComps1061 = nil
			end

			local var_222_13 = 0
			local var_222_14 = 0.125

			if var_222_13 < arg_219_1.time_ and arg_219_1.time_ <= var_222_13 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_15 = arg_219_1:FormatText(StoryNameCfg[612].name)

				arg_219_1.leftNameTxt_.text = var_222_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_16 = arg_219_1:GetWordFromCfg(410202053)
				local var_222_17 = arg_219_1:FormatText(var_222_16.content)

				arg_219_1.text_.text = var_222_17

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_18 = 5
				local var_222_19 = utf8.len(var_222_17)
				local var_222_20 = var_222_18 <= 0 and var_222_14 or var_222_14 * (var_222_19 / var_222_18)

				if var_222_20 > 0 and var_222_14 < var_222_20 then
					arg_219_1.talkMaxDuration = var_222_20

					if var_222_20 + var_222_13 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_20 + var_222_13
					end
				end

				arg_219_1.text_.text = var_222_17
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202053", "story_v_out_410202.awb") ~= 0 then
					local var_222_21 = manager.audio:GetVoiceLength("story_v_out_410202", "410202053", "story_v_out_410202.awb") / 1000

					if var_222_21 + var_222_13 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_21 + var_222_13
					end

					if var_222_16.prefab_name ~= "" and arg_219_1.actors_[var_222_16.prefab_name] ~= nil then
						local var_222_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_16.prefab_name].transform, "story_v_out_410202", "410202053", "story_v_out_410202.awb")

						arg_219_1:RecordAudio("410202053", var_222_22)
						arg_219_1:RecordAudio("410202053", var_222_22)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_410202", "410202053", "story_v_out_410202.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_410202", "410202053", "story_v_out_410202.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_23 = math.max(var_222_14, arg_219_1.talkMaxDuration)

			if var_222_13 <= arg_219_1.time_ and arg_219_1.time_ < var_222_13 + var_222_23 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_13) / var_222_23

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_13 + var_222_23 and arg_219_1.time_ < var_222_13 + var_222_23 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play410202054 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 410202054
		arg_223_1.duration_ = 6.433

		local var_223_0 = {
			ja = 6.433,
			CriLanguages = 2.033,
			zh = 2.033
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
				arg_223_0:Play410202055(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["10063"].transform
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.var_.moveOldPos10063 = var_226_0.localPosition
				var_226_0.localScale = Vector3.New(1, 1, 1)

				arg_223_1:CheckSpriteTmpPos("10063", 7)

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
				local var_226_6 = Vector3.New(0, -2000, -105)

				var_226_0.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos10063, var_226_6, var_226_5)
			end

			if arg_223_1.time_ >= var_226_1 + var_226_4 and arg_223_1.time_ < var_226_1 + var_226_4 + arg_226_0 then
				var_226_0.localPosition = Vector3.New(0, -2000, -105)
			end

			local var_226_7 = arg_223_1.actors_["10060"].transform
			local var_226_8 = 0

			if var_226_8 < arg_223_1.time_ and arg_223_1.time_ <= var_226_8 + arg_226_0 then
				arg_223_1.var_.moveOldPos10060 = var_226_7.localPosition
				var_226_7.localScale = Vector3.New(1, 1, 1)

				arg_223_1:CheckSpriteTmpPos("10060", 3)

				local var_226_9 = var_226_7.childCount

				for iter_226_1 = 0, var_226_9 - 1 do
					local var_226_10 = var_226_7:GetChild(iter_226_1)

					if var_226_10.name == "" or not string.find(var_226_10.name, "split") then
						var_226_10.gameObject:SetActive(true)
					else
						var_226_10.gameObject:SetActive(false)
					end
				end
			end

			local var_226_11 = 0.001

			if var_226_8 <= arg_223_1.time_ and arg_223_1.time_ < var_226_8 + var_226_11 then
				local var_226_12 = (arg_223_1.time_ - var_226_8) / var_226_11
				local var_226_13 = Vector3.New(0, -400, 0)

				var_226_7.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos10060, var_226_13, var_226_12)
			end

			if arg_223_1.time_ >= var_226_8 + var_226_11 and arg_223_1.time_ < var_226_8 + var_226_11 + arg_226_0 then
				var_226_7.localPosition = Vector3.New(0, -400, 0)
			end

			local var_226_14 = arg_223_1.actors_["10063"]
			local var_226_15 = 0

			if var_226_15 < arg_223_1.time_ and arg_223_1.time_ <= var_226_15 + arg_226_0 and arg_223_1.var_.actorSpriteComps10063 == nil then
				arg_223_1.var_.actorSpriteComps10063 = var_226_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_226_16 = 0.034

			if var_226_15 <= arg_223_1.time_ and arg_223_1.time_ < var_226_15 + var_226_16 then
				local var_226_17 = (arg_223_1.time_ - var_226_15) / var_226_16

				if arg_223_1.var_.actorSpriteComps10063 then
					for iter_226_2, iter_226_3 in pairs(arg_223_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_226_3 then
							local var_226_18 = Mathf.Lerp(iter_226_3.color.r, 0.5, var_226_17)

							iter_226_3.color = Color.New(var_226_18, var_226_18, var_226_18)
						end
					end
				end
			end

			if arg_223_1.time_ >= var_226_15 + var_226_16 and arg_223_1.time_ < var_226_15 + var_226_16 + arg_226_0 and arg_223_1.var_.actorSpriteComps10063 then
				local var_226_19 = 0.5

				for iter_226_4, iter_226_5 in pairs(arg_223_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_226_5 then
						iter_226_5.color = Color.New(var_226_19, var_226_19, var_226_19)
					end
				end

				arg_223_1.var_.actorSpriteComps10063 = nil
			end

			local var_226_20 = arg_223_1.actors_["10060"]
			local var_226_21 = 0

			if var_226_21 < arg_223_1.time_ and arg_223_1.time_ <= var_226_21 + arg_226_0 and arg_223_1.var_.actorSpriteComps10060 == nil then
				arg_223_1.var_.actorSpriteComps10060 = var_226_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_226_22 = 0.034

			if var_226_21 <= arg_223_1.time_ and arg_223_1.time_ < var_226_21 + var_226_22 then
				local var_226_23 = (arg_223_1.time_ - var_226_21) / var_226_22

				if arg_223_1.var_.actorSpriteComps10060 then
					for iter_226_6, iter_226_7 in pairs(arg_223_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_226_7 then
							local var_226_24 = Mathf.Lerp(iter_226_7.color.r, 1, var_226_23)

							iter_226_7.color = Color.New(var_226_24, var_226_24, var_226_24)
						end
					end
				end
			end

			if arg_223_1.time_ >= var_226_21 + var_226_22 and arg_223_1.time_ < var_226_21 + var_226_22 + arg_226_0 and arg_223_1.var_.actorSpriteComps10060 then
				local var_226_25 = 1

				for iter_226_8, iter_226_9 in pairs(arg_223_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_226_9 then
						iter_226_9.color = Color.New(var_226_25, var_226_25, var_226_25)
					end
				end

				arg_223_1.var_.actorSpriteComps10060 = nil
			end

			local var_226_26 = 0
			local var_226_27 = 0.325

			if var_226_26 < arg_223_1.time_ and arg_223_1.time_ <= var_226_26 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_28 = arg_223_1:FormatText(StoryNameCfg[597].name)

				arg_223_1.leftNameTxt_.text = var_226_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_29 = arg_223_1:GetWordFromCfg(410202054)
				local var_226_30 = arg_223_1:FormatText(var_226_29.content)

				arg_223_1.text_.text = var_226_30

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_31 = 13
				local var_226_32 = utf8.len(var_226_30)
				local var_226_33 = var_226_31 <= 0 and var_226_27 or var_226_27 * (var_226_32 / var_226_31)

				if var_226_33 > 0 and var_226_27 < var_226_33 then
					arg_223_1.talkMaxDuration = var_226_33

					if var_226_33 + var_226_26 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_33 + var_226_26
					end
				end

				arg_223_1.text_.text = var_226_30
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202054", "story_v_out_410202.awb") ~= 0 then
					local var_226_34 = manager.audio:GetVoiceLength("story_v_out_410202", "410202054", "story_v_out_410202.awb") / 1000

					if var_226_34 + var_226_26 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_34 + var_226_26
					end

					if var_226_29.prefab_name ~= "" and arg_223_1.actors_[var_226_29.prefab_name] ~= nil then
						local var_226_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_29.prefab_name].transform, "story_v_out_410202", "410202054", "story_v_out_410202.awb")

						arg_223_1:RecordAudio("410202054", var_226_35)
						arg_223_1:RecordAudio("410202054", var_226_35)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_410202", "410202054", "story_v_out_410202.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_410202", "410202054", "story_v_out_410202.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_36 = math.max(var_226_27, arg_223_1.talkMaxDuration)

			if var_226_26 <= arg_223_1.time_ and arg_223_1.time_ < var_226_26 + var_226_36 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_26) / var_226_36

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_26 + var_226_36 and arg_223_1.time_ < var_226_26 + var_226_36 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play410202055 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 410202055
		arg_227_1.duration_ = 5.566

		local var_227_0 = {
			ja = 5.566,
			CriLanguages = 2.566,
			zh = 2.566
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
				arg_227_0:Play410202056(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1061"].transform
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1.var_.moveOldPos1061 = var_230_0.localPosition
				var_230_0.localScale = Vector3.New(1, 1, 1)

				arg_227_1:CheckSpriteTmpPos("1061", 3)

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
				local var_230_6 = Vector3.New(0, -490, 18)

				var_230_0.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos1061, var_230_6, var_230_5)
			end

			if arg_227_1.time_ >= var_230_1 + var_230_4 and arg_227_1.time_ < var_230_1 + var_230_4 + arg_230_0 then
				var_230_0.localPosition = Vector3.New(0, -490, 18)
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

			local var_230_13 = 0
			local var_230_14 = 0.35

			if var_230_13 < arg_227_1.time_ and arg_227_1.time_ <= var_230_13 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_15 = arg_227_1:FormatText(StoryNameCfg[612].name)

				arg_227_1.leftNameTxt_.text = var_230_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_16 = arg_227_1:GetWordFromCfg(410202055)
				local var_230_17 = arg_227_1:FormatText(var_230_16.content)

				arg_227_1.text_.text = var_230_17

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_18 = 14
				local var_230_19 = utf8.len(var_230_17)
				local var_230_20 = var_230_18 <= 0 and var_230_14 or var_230_14 * (var_230_19 / var_230_18)

				if var_230_20 > 0 and var_230_14 < var_230_20 then
					arg_227_1.talkMaxDuration = var_230_20

					if var_230_20 + var_230_13 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_20 + var_230_13
					end
				end

				arg_227_1.text_.text = var_230_17
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202055", "story_v_out_410202.awb") ~= 0 then
					local var_230_21 = manager.audio:GetVoiceLength("story_v_out_410202", "410202055", "story_v_out_410202.awb") / 1000

					if var_230_21 + var_230_13 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_21 + var_230_13
					end

					if var_230_16.prefab_name ~= "" and arg_227_1.actors_[var_230_16.prefab_name] ~= nil then
						local var_230_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_16.prefab_name].transform, "story_v_out_410202", "410202055", "story_v_out_410202.awb")

						arg_227_1:RecordAudio("410202055", var_230_22)
						arg_227_1:RecordAudio("410202055", var_230_22)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_410202", "410202055", "story_v_out_410202.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_410202", "410202055", "story_v_out_410202.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_23 = math.max(var_230_14, arg_227_1.talkMaxDuration)

			if var_230_13 <= arg_227_1.time_ and arg_227_1.time_ < var_230_13 + var_230_23 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_13) / var_230_23

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_13 + var_230_23 and arg_227_1.time_ < var_230_13 + var_230_23 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play410202056 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 410202056
		arg_231_1.duration_ = 3.766

		local var_231_0 = {
			ja = 3.766,
			CriLanguages = 3.666,
			zh = 3.666
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
				arg_231_0:Play410202057(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1061"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos1061 = var_234_0.localPosition
				var_234_0.localScale = Vector3.New(1, 1, 1)

				arg_231_1:CheckSpriteTmpPos("1061", 3)

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
				local var_234_6 = Vector3.New(0, -490, 18)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1061, var_234_6, var_234_5)
			end

			if arg_231_1.time_ >= var_234_1 + var_234_4 and arg_231_1.time_ < var_234_1 + var_234_4 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_234_7 = arg_231_1.actors_["1061"]
			local var_234_8 = 0

			if var_234_8 < arg_231_1.time_ and arg_231_1.time_ <= var_234_8 + arg_234_0 and arg_231_1.var_.actorSpriteComps1061 == nil then
				arg_231_1.var_.actorSpriteComps1061 = var_234_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_234_9 = 0.034

			if var_234_8 <= arg_231_1.time_ and arg_231_1.time_ < var_234_8 + var_234_9 then
				local var_234_10 = (arg_231_1.time_ - var_234_8) / var_234_9

				if arg_231_1.var_.actorSpriteComps1061 then
					for iter_234_1, iter_234_2 in pairs(arg_231_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_234_2 then
							local var_234_11 = Mathf.Lerp(iter_234_2.color.r, 1, var_234_10)

							iter_234_2.color = Color.New(var_234_11, var_234_11, var_234_11)
						end
					end
				end
			end

			if arg_231_1.time_ >= var_234_8 + var_234_9 and arg_231_1.time_ < var_234_8 + var_234_9 + arg_234_0 and arg_231_1.var_.actorSpriteComps1061 then
				local var_234_12 = 1

				for iter_234_3, iter_234_4 in pairs(arg_231_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_234_4 then
						iter_234_4.color = Color.New(var_234_12, var_234_12, var_234_12)
					end
				end

				arg_231_1.var_.actorSpriteComps1061 = nil
			end

			local var_234_13 = 0
			local var_234_14 = 0.45

			if var_234_13 < arg_231_1.time_ and arg_231_1.time_ <= var_234_13 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_15 = arg_231_1:FormatText(StoryNameCfg[612].name)

				arg_231_1.leftNameTxt_.text = var_234_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_16 = arg_231_1:GetWordFromCfg(410202056)
				local var_234_17 = arg_231_1:FormatText(var_234_16.content)

				arg_231_1.text_.text = var_234_17

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_18 = 18
				local var_234_19 = utf8.len(var_234_17)
				local var_234_20 = var_234_18 <= 0 and var_234_14 or var_234_14 * (var_234_19 / var_234_18)

				if var_234_20 > 0 and var_234_14 < var_234_20 then
					arg_231_1.talkMaxDuration = var_234_20

					if var_234_20 + var_234_13 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_20 + var_234_13
					end
				end

				arg_231_1.text_.text = var_234_17
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202056", "story_v_out_410202.awb") ~= 0 then
					local var_234_21 = manager.audio:GetVoiceLength("story_v_out_410202", "410202056", "story_v_out_410202.awb") / 1000

					if var_234_21 + var_234_13 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_21 + var_234_13
					end

					if var_234_16.prefab_name ~= "" and arg_231_1.actors_[var_234_16.prefab_name] ~= nil then
						local var_234_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_16.prefab_name].transform, "story_v_out_410202", "410202056", "story_v_out_410202.awb")

						arg_231_1:RecordAudio("410202056", var_234_22)
						arg_231_1:RecordAudio("410202056", var_234_22)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_410202", "410202056", "story_v_out_410202.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_410202", "410202056", "story_v_out_410202.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_23 = math.max(var_234_14, arg_231_1.talkMaxDuration)

			if var_234_13 <= arg_231_1.time_ and arg_231_1.time_ < var_234_13 + var_234_23 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_13) / var_234_23

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_13 + var_234_23 and arg_231_1.time_ < var_234_13 + var_234_23 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play410202057 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 410202057
		arg_235_1.duration_ = 8.433

		local var_235_0 = {
			ja = 6.5,
			CriLanguages = 8.433,
			zh = 8.433
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
				arg_235_0:Play410202058(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1061"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos1061 = var_238_0.localPosition
				var_238_0.localScale = Vector3.New(1, 1, 1)

				arg_235_1:CheckSpriteTmpPos("1061", 7)

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
				local var_238_6 = Vector3.New(0, -2000, 18)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1061, var_238_6, var_238_5)
			end

			if arg_235_1.time_ >= var_238_1 + var_238_4 and arg_235_1.time_ < var_238_1 + var_238_4 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_238_7 = arg_235_1.actors_["10063"].transform
			local var_238_8 = 0

			if var_238_8 < arg_235_1.time_ and arg_235_1.time_ <= var_238_8 + arg_238_0 then
				arg_235_1.var_.moveOldPos10063 = var_238_7.localPosition
				var_238_7.localScale = Vector3.New(1, 1, 1)

				arg_235_1:CheckSpriteTmpPos("10063", 3)

				local var_238_9 = var_238_7.childCount

				for iter_238_1 = 0, var_238_9 - 1 do
					local var_238_10 = var_238_7:GetChild(iter_238_1)

					if var_238_10.name == "" or not string.find(var_238_10.name, "split") then
						var_238_10.gameObject:SetActive(true)
					else
						var_238_10.gameObject:SetActive(false)
					end
				end
			end

			local var_238_11 = 0.001

			if var_238_8 <= arg_235_1.time_ and arg_235_1.time_ < var_238_8 + var_238_11 then
				local var_238_12 = (arg_235_1.time_ - var_238_8) / var_238_11
				local var_238_13 = Vector3.New(0, -535, -105)

				var_238_7.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos10063, var_238_13, var_238_12)
			end

			if arg_235_1.time_ >= var_238_8 + var_238_11 and arg_235_1.time_ < var_238_8 + var_238_11 + arg_238_0 then
				var_238_7.localPosition = Vector3.New(0, -535, -105)
			end

			local var_238_14 = arg_235_1.actors_["1061"]
			local var_238_15 = 0

			if var_238_15 < arg_235_1.time_ and arg_235_1.time_ <= var_238_15 + arg_238_0 and arg_235_1.var_.actorSpriteComps1061 == nil then
				arg_235_1.var_.actorSpriteComps1061 = var_238_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_238_16 = 0.034

			if var_238_15 <= arg_235_1.time_ and arg_235_1.time_ < var_238_15 + var_238_16 then
				local var_238_17 = (arg_235_1.time_ - var_238_15) / var_238_16

				if arg_235_1.var_.actorSpriteComps1061 then
					for iter_238_2, iter_238_3 in pairs(arg_235_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_238_3 then
							local var_238_18 = Mathf.Lerp(iter_238_3.color.r, 0.5, var_238_17)

							iter_238_3.color = Color.New(var_238_18, var_238_18, var_238_18)
						end
					end
				end
			end

			if arg_235_1.time_ >= var_238_15 + var_238_16 and arg_235_1.time_ < var_238_15 + var_238_16 + arg_238_0 and arg_235_1.var_.actorSpriteComps1061 then
				local var_238_19 = 0.5

				for iter_238_4, iter_238_5 in pairs(arg_235_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_238_5 then
						iter_238_5.color = Color.New(var_238_19, var_238_19, var_238_19)
					end
				end

				arg_235_1.var_.actorSpriteComps1061 = nil
			end

			local var_238_20 = arg_235_1.actors_["10063"]
			local var_238_21 = 0

			if var_238_21 < arg_235_1.time_ and arg_235_1.time_ <= var_238_21 + arg_238_0 and arg_235_1.var_.actorSpriteComps10063 == nil then
				arg_235_1.var_.actorSpriteComps10063 = var_238_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_238_22 = 0.034

			if var_238_21 <= arg_235_1.time_ and arg_235_1.time_ < var_238_21 + var_238_22 then
				local var_238_23 = (arg_235_1.time_ - var_238_21) / var_238_22

				if arg_235_1.var_.actorSpriteComps10063 then
					for iter_238_6, iter_238_7 in pairs(arg_235_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_238_7 then
							local var_238_24 = Mathf.Lerp(iter_238_7.color.r, 1, var_238_23)

							iter_238_7.color = Color.New(var_238_24, var_238_24, var_238_24)
						end
					end
				end
			end

			if arg_235_1.time_ >= var_238_21 + var_238_22 and arg_235_1.time_ < var_238_21 + var_238_22 + arg_238_0 and arg_235_1.var_.actorSpriteComps10063 then
				local var_238_25 = 1

				for iter_238_8, iter_238_9 in pairs(arg_235_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_238_9 then
						iter_238_9.color = Color.New(var_238_25, var_238_25, var_238_25)
					end
				end

				arg_235_1.var_.actorSpriteComps10063 = nil
			end

			local var_238_26 = 0
			local var_238_27 = 0.925

			if var_238_26 < arg_235_1.time_ and arg_235_1.time_ <= var_238_26 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_28 = arg_235_1:FormatText(StoryNameCfg[591].name)

				arg_235_1.leftNameTxt_.text = var_238_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_29 = arg_235_1:GetWordFromCfg(410202057)
				local var_238_30 = arg_235_1:FormatText(var_238_29.content)

				arg_235_1.text_.text = var_238_30

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_31 = 37
				local var_238_32 = utf8.len(var_238_30)
				local var_238_33 = var_238_31 <= 0 and var_238_27 or var_238_27 * (var_238_32 / var_238_31)

				if var_238_33 > 0 and var_238_27 < var_238_33 then
					arg_235_1.talkMaxDuration = var_238_33

					if var_238_33 + var_238_26 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_33 + var_238_26
					end
				end

				arg_235_1.text_.text = var_238_30
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202057", "story_v_out_410202.awb") ~= 0 then
					local var_238_34 = manager.audio:GetVoiceLength("story_v_out_410202", "410202057", "story_v_out_410202.awb") / 1000

					if var_238_34 + var_238_26 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_34 + var_238_26
					end

					if var_238_29.prefab_name ~= "" and arg_235_1.actors_[var_238_29.prefab_name] ~= nil then
						local var_238_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_29.prefab_name].transform, "story_v_out_410202", "410202057", "story_v_out_410202.awb")

						arg_235_1:RecordAudio("410202057", var_238_35)
						arg_235_1:RecordAudio("410202057", var_238_35)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_410202", "410202057", "story_v_out_410202.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_410202", "410202057", "story_v_out_410202.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_36 = math.max(var_238_27, arg_235_1.talkMaxDuration)

			if var_238_26 <= arg_235_1.time_ and arg_235_1.time_ < var_238_26 + var_238_36 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_26) / var_238_36

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_26 + var_238_36 and arg_235_1.time_ < var_238_26 + var_238_36 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play410202058 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 410202058
		arg_239_1.duration_ = 4.766

		local var_239_0 = {
			ja = 4.766,
			CriLanguages = 4.633,
			zh = 4.633
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
				arg_239_0:Play410202059(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["10063"].transform
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.var_.moveOldPos10063 = var_242_0.localPosition
				var_242_0.localScale = Vector3.New(1, 1, 1)

				arg_239_1:CheckSpriteTmpPos("10063", 7)

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
				local var_242_6 = Vector3.New(0, -2000, -105)

				var_242_0.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos10063, var_242_6, var_242_5)
			end

			if arg_239_1.time_ >= var_242_1 + var_242_4 and arg_239_1.time_ < var_242_1 + var_242_4 + arg_242_0 then
				var_242_0.localPosition = Vector3.New(0, -2000, -105)
			end

			local var_242_7 = arg_239_1.actors_["1061"].transform
			local var_242_8 = 0

			if var_242_8 < arg_239_1.time_ and arg_239_1.time_ <= var_242_8 + arg_242_0 then
				arg_239_1.var_.moveOldPos1061 = var_242_7.localPosition
				var_242_7.localScale = Vector3.New(1, 1, 1)

				arg_239_1:CheckSpriteTmpPos("1061", 3)

				local var_242_9 = var_242_7.childCount

				for iter_242_1 = 0, var_242_9 - 1 do
					local var_242_10 = var_242_7:GetChild(iter_242_1)

					if var_242_10.name == "" or not string.find(var_242_10.name, "split") then
						var_242_10.gameObject:SetActive(true)
					else
						var_242_10.gameObject:SetActive(false)
					end
				end
			end

			local var_242_11 = 0.001

			if var_242_8 <= arg_239_1.time_ and arg_239_1.time_ < var_242_8 + var_242_11 then
				local var_242_12 = (arg_239_1.time_ - var_242_8) / var_242_11
				local var_242_13 = Vector3.New(0, -490, 18)

				var_242_7.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1061, var_242_13, var_242_12)
			end

			if arg_239_1.time_ >= var_242_8 + var_242_11 and arg_239_1.time_ < var_242_8 + var_242_11 + arg_242_0 then
				var_242_7.localPosition = Vector3.New(0, -490, 18)
			end

			local var_242_14 = arg_239_1.actors_["10063"]
			local var_242_15 = 0

			if var_242_15 < arg_239_1.time_ and arg_239_1.time_ <= var_242_15 + arg_242_0 and arg_239_1.var_.actorSpriteComps10063 == nil then
				arg_239_1.var_.actorSpriteComps10063 = var_242_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_242_16 = 0.034

			if var_242_15 <= arg_239_1.time_ and arg_239_1.time_ < var_242_15 + var_242_16 then
				local var_242_17 = (arg_239_1.time_ - var_242_15) / var_242_16

				if arg_239_1.var_.actorSpriteComps10063 then
					for iter_242_2, iter_242_3 in pairs(arg_239_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_242_3 then
							local var_242_18 = Mathf.Lerp(iter_242_3.color.r, 0.5, var_242_17)

							iter_242_3.color = Color.New(var_242_18, var_242_18, var_242_18)
						end
					end
				end
			end

			if arg_239_1.time_ >= var_242_15 + var_242_16 and arg_239_1.time_ < var_242_15 + var_242_16 + arg_242_0 and arg_239_1.var_.actorSpriteComps10063 then
				local var_242_19 = 0.5

				for iter_242_4, iter_242_5 in pairs(arg_239_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_242_5 then
						iter_242_5.color = Color.New(var_242_19, var_242_19, var_242_19)
					end
				end

				arg_239_1.var_.actorSpriteComps10063 = nil
			end

			local var_242_20 = arg_239_1.actors_["1061"]
			local var_242_21 = 0

			if var_242_21 < arg_239_1.time_ and arg_239_1.time_ <= var_242_21 + arg_242_0 and arg_239_1.var_.actorSpriteComps1061 == nil then
				arg_239_1.var_.actorSpriteComps1061 = var_242_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_242_22 = 0.034

			if var_242_21 <= arg_239_1.time_ and arg_239_1.time_ < var_242_21 + var_242_22 then
				local var_242_23 = (arg_239_1.time_ - var_242_21) / var_242_22

				if arg_239_1.var_.actorSpriteComps1061 then
					for iter_242_6, iter_242_7 in pairs(arg_239_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_242_7 then
							local var_242_24 = Mathf.Lerp(iter_242_7.color.r, 1, var_242_23)

							iter_242_7.color = Color.New(var_242_24, var_242_24, var_242_24)
						end
					end
				end
			end

			if arg_239_1.time_ >= var_242_21 + var_242_22 and arg_239_1.time_ < var_242_21 + var_242_22 + arg_242_0 and arg_239_1.var_.actorSpriteComps1061 then
				local var_242_25 = 1

				for iter_242_8, iter_242_9 in pairs(arg_239_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_242_9 then
						iter_242_9.color = Color.New(var_242_25, var_242_25, var_242_25)
					end
				end

				arg_239_1.var_.actorSpriteComps1061 = nil
			end

			local var_242_26 = 0
			local var_242_27 = 0.525

			if var_242_26 < arg_239_1.time_ and arg_239_1.time_ <= var_242_26 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_28 = arg_239_1:FormatText(StoryNameCfg[612].name)

				arg_239_1.leftNameTxt_.text = var_242_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_29 = arg_239_1:GetWordFromCfg(410202058)
				local var_242_30 = arg_239_1:FormatText(var_242_29.content)

				arg_239_1.text_.text = var_242_30

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_31 = 21
				local var_242_32 = utf8.len(var_242_30)
				local var_242_33 = var_242_31 <= 0 and var_242_27 or var_242_27 * (var_242_32 / var_242_31)

				if var_242_33 > 0 and var_242_27 < var_242_33 then
					arg_239_1.talkMaxDuration = var_242_33

					if var_242_33 + var_242_26 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_33 + var_242_26
					end
				end

				arg_239_1.text_.text = var_242_30
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202058", "story_v_out_410202.awb") ~= 0 then
					local var_242_34 = manager.audio:GetVoiceLength("story_v_out_410202", "410202058", "story_v_out_410202.awb") / 1000

					if var_242_34 + var_242_26 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_34 + var_242_26
					end

					if var_242_29.prefab_name ~= "" and arg_239_1.actors_[var_242_29.prefab_name] ~= nil then
						local var_242_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_29.prefab_name].transform, "story_v_out_410202", "410202058", "story_v_out_410202.awb")

						arg_239_1:RecordAudio("410202058", var_242_35)
						arg_239_1:RecordAudio("410202058", var_242_35)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_410202", "410202058", "story_v_out_410202.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_410202", "410202058", "story_v_out_410202.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_36 = math.max(var_242_27, arg_239_1.talkMaxDuration)

			if var_242_26 <= arg_239_1.time_ and arg_239_1.time_ < var_242_26 + var_242_36 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_26) / var_242_36

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_26 + var_242_36 and arg_239_1.time_ < var_242_26 + var_242_36 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play410202059 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 410202059
		arg_243_1.duration_ = 6.066

		local var_243_0 = {
			ja = 6.066,
			CriLanguages = 5.266,
			zh = 5.266
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
				arg_243_0:Play410202060(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1061"].transform
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 then
				arg_243_1.var_.moveOldPos1061 = var_246_0.localPosition
				var_246_0.localScale = Vector3.New(1, 1, 1)

				arg_243_1:CheckSpriteTmpPos("1061", 3)

				local var_246_2 = var_246_0.childCount

				for iter_246_0 = 0, var_246_2 - 1 do
					local var_246_3 = var_246_0:GetChild(iter_246_0)

					if var_246_3.name == "" or not string.find(var_246_3.name, "split") then
						var_246_3.gameObject:SetActive(true)
					else
						var_246_3.gameObject:SetActive(false)
					end
				end
			end

			local var_246_4 = 0.001

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_4 then
				local var_246_5 = (arg_243_1.time_ - var_246_1) / var_246_4
				local var_246_6 = Vector3.New(0, -490, 18)

				var_246_0.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos1061, var_246_6, var_246_5)
			end

			if arg_243_1.time_ >= var_246_1 + var_246_4 and arg_243_1.time_ < var_246_1 + var_246_4 + arg_246_0 then
				var_246_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_246_7 = arg_243_1.actors_["1061"]
			local var_246_8 = 0

			if var_246_8 < arg_243_1.time_ and arg_243_1.time_ <= var_246_8 + arg_246_0 and arg_243_1.var_.actorSpriteComps1061 == nil then
				arg_243_1.var_.actorSpriteComps1061 = var_246_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_246_9 = 0.034

			if var_246_8 <= arg_243_1.time_ and arg_243_1.time_ < var_246_8 + var_246_9 then
				local var_246_10 = (arg_243_1.time_ - var_246_8) / var_246_9

				if arg_243_1.var_.actorSpriteComps1061 then
					for iter_246_1, iter_246_2 in pairs(arg_243_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_246_2 then
							local var_246_11 = Mathf.Lerp(iter_246_2.color.r, 1, var_246_10)

							iter_246_2.color = Color.New(var_246_11, var_246_11, var_246_11)
						end
					end
				end
			end

			if arg_243_1.time_ >= var_246_8 + var_246_9 and arg_243_1.time_ < var_246_8 + var_246_9 + arg_246_0 and arg_243_1.var_.actorSpriteComps1061 then
				local var_246_12 = 1

				for iter_246_3, iter_246_4 in pairs(arg_243_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_246_4 then
						iter_246_4.color = Color.New(var_246_12, var_246_12, var_246_12)
					end
				end

				arg_243_1.var_.actorSpriteComps1061 = nil
			end

			local var_246_13 = 0
			local var_246_14 = 0.6

			if var_246_13 < arg_243_1.time_ and arg_243_1.time_ <= var_246_13 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_15 = arg_243_1:FormatText(StoryNameCfg[612].name)

				arg_243_1.leftNameTxt_.text = var_246_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_16 = arg_243_1:GetWordFromCfg(410202059)
				local var_246_17 = arg_243_1:FormatText(var_246_16.content)

				arg_243_1.text_.text = var_246_17

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_18 = 24
				local var_246_19 = utf8.len(var_246_17)
				local var_246_20 = var_246_18 <= 0 and var_246_14 or var_246_14 * (var_246_19 / var_246_18)

				if var_246_20 > 0 and var_246_14 < var_246_20 then
					arg_243_1.talkMaxDuration = var_246_20

					if var_246_20 + var_246_13 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_20 + var_246_13
					end
				end

				arg_243_1.text_.text = var_246_17
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202059", "story_v_out_410202.awb") ~= 0 then
					local var_246_21 = manager.audio:GetVoiceLength("story_v_out_410202", "410202059", "story_v_out_410202.awb") / 1000

					if var_246_21 + var_246_13 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_21 + var_246_13
					end

					if var_246_16.prefab_name ~= "" and arg_243_1.actors_[var_246_16.prefab_name] ~= nil then
						local var_246_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_16.prefab_name].transform, "story_v_out_410202", "410202059", "story_v_out_410202.awb")

						arg_243_1:RecordAudio("410202059", var_246_22)
						arg_243_1:RecordAudio("410202059", var_246_22)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_410202", "410202059", "story_v_out_410202.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_410202", "410202059", "story_v_out_410202.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_23 = math.max(var_246_14, arg_243_1.talkMaxDuration)

			if var_246_13 <= arg_243_1.time_ and arg_243_1.time_ < var_246_13 + var_246_23 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_13) / var_246_23

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_13 + var_246_23 and arg_243_1.time_ < var_246_13 + var_246_23 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play410202060 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 410202060
		arg_247_1.duration_ = 7.5

		local var_247_0 = {
			ja = 7.5,
			CriLanguages = 4.266,
			zh = 4.266
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
				arg_247_0:Play410202061(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1061"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.actorSpriteComps1061 == nil then
				arg_247_1.var_.actorSpriteComps1061 = var_250_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_250_2 = 0.034

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.actorSpriteComps1061 then
					for iter_250_0, iter_250_1 in pairs(arg_247_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_250_1 then
							local var_250_4 = Mathf.Lerp(iter_250_1.color.r, 0.5, var_250_3)

							iter_250_1.color = Color.New(var_250_4, var_250_4, var_250_4)
						end
					end
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.actorSpriteComps1061 then
				local var_250_5 = 0.5

				for iter_250_2, iter_250_3 in pairs(arg_247_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_250_3 then
						iter_250_3.color = Color.New(var_250_5, var_250_5, var_250_5)
					end
				end

				arg_247_1.var_.actorSpriteComps1061 = nil
			end

			local var_250_6 = 0
			local var_250_7 = 0.575

			if var_250_6 < arg_247_1.time_ and arg_247_1.time_ <= var_250_6 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_8 = arg_247_1:FormatText(StoryNameCfg[609].name)

				arg_247_1.leftNameTxt_.text = var_250_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, true)
				arg_247_1.iconController_:SetSelectedState("hero")

				arg_247_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_9 = arg_247_1:GetWordFromCfg(410202060)
				local var_250_10 = arg_247_1:FormatText(var_250_9.content)

				arg_247_1.text_.text = var_250_10

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_11 = 23
				local var_250_12 = utf8.len(var_250_10)
				local var_250_13 = var_250_11 <= 0 and var_250_7 or var_250_7 * (var_250_12 / var_250_11)

				if var_250_13 > 0 and var_250_7 < var_250_13 then
					arg_247_1.talkMaxDuration = var_250_13

					if var_250_13 + var_250_6 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_13 + var_250_6
					end
				end

				arg_247_1.text_.text = var_250_10
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202060", "story_v_out_410202.awb") ~= 0 then
					local var_250_14 = manager.audio:GetVoiceLength("story_v_out_410202", "410202060", "story_v_out_410202.awb") / 1000

					if var_250_14 + var_250_6 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_14 + var_250_6
					end

					if var_250_9.prefab_name ~= "" and arg_247_1.actors_[var_250_9.prefab_name] ~= nil then
						local var_250_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_9.prefab_name].transform, "story_v_out_410202", "410202060", "story_v_out_410202.awb")

						arg_247_1:RecordAudio("410202060", var_250_15)
						arg_247_1:RecordAudio("410202060", var_250_15)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_410202", "410202060", "story_v_out_410202.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_410202", "410202060", "story_v_out_410202.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_16 = math.max(var_250_7, arg_247_1.talkMaxDuration)

			if var_250_6 <= arg_247_1.time_ and arg_247_1.time_ < var_250_6 + var_250_16 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_6) / var_250_16

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_6 + var_250_16 and arg_247_1.time_ < var_250_6 + var_250_16 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play410202061 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 410202061
		arg_251_1.duration_ = 9.966

		local var_251_0 = {
			ja = 9.666,
			CriLanguages = 9.966,
			zh = 9.966
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
				arg_251_0:Play410202062(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0
			local var_254_1 = 1.25

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_2 = arg_251_1:FormatText(StoryNameCfg[609].name)

				arg_251_1.leftNameTxt_.text = var_254_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, true)
				arg_251_1.iconController_:SetSelectedState("hero")

				arg_251_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_3 = arg_251_1:GetWordFromCfg(410202061)
				local var_254_4 = arg_251_1:FormatText(var_254_3.content)

				arg_251_1.text_.text = var_254_4

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_5 = 50
				local var_254_6 = utf8.len(var_254_4)
				local var_254_7 = var_254_5 <= 0 and var_254_1 or var_254_1 * (var_254_6 / var_254_5)

				if var_254_7 > 0 and var_254_1 < var_254_7 then
					arg_251_1.talkMaxDuration = var_254_7

					if var_254_7 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_7 + var_254_0
					end
				end

				arg_251_1.text_.text = var_254_4
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202061", "story_v_out_410202.awb") ~= 0 then
					local var_254_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202061", "story_v_out_410202.awb") / 1000

					if var_254_8 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_8 + var_254_0
					end

					if var_254_3.prefab_name ~= "" and arg_251_1.actors_[var_254_3.prefab_name] ~= nil then
						local var_254_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_3.prefab_name].transform, "story_v_out_410202", "410202061", "story_v_out_410202.awb")

						arg_251_1:RecordAudio("410202061", var_254_9)
						arg_251_1:RecordAudio("410202061", var_254_9)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_410202", "410202061", "story_v_out_410202.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_410202", "410202061", "story_v_out_410202.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_10 = math.max(var_254_1, arg_251_1.talkMaxDuration)

			if var_254_0 <= arg_251_1.time_ and arg_251_1.time_ < var_254_0 + var_254_10 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_0) / var_254_10

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_0 + var_254_10 and arg_251_1.time_ < var_254_0 + var_254_10 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play410202062 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 410202062
		arg_255_1.duration_ = 12.733

		local var_255_0 = {
			ja = 12.733,
			CriLanguages = 9.566,
			zh = 9.566
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
				arg_255_0:Play410202063(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1061"].transform
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 then
				arg_255_1.var_.moveOldPos1061 = var_258_0.localPosition
				var_258_0.localScale = Vector3.New(1, 1, 1)

				arg_255_1:CheckSpriteTmpPos("1061", 3)

				local var_258_2 = var_258_0.childCount

				for iter_258_0 = 0, var_258_2 - 1 do
					local var_258_3 = var_258_0:GetChild(iter_258_0)

					if var_258_3.name == "" or not string.find(var_258_3.name, "split") then
						var_258_3.gameObject:SetActive(true)
					else
						var_258_3.gameObject:SetActive(false)
					end
				end
			end

			local var_258_4 = 0.001

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_4 then
				local var_258_5 = (arg_255_1.time_ - var_258_1) / var_258_4
				local var_258_6 = Vector3.New(0, -490, 18)

				var_258_0.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1061, var_258_6, var_258_5)
			end

			if arg_255_1.time_ >= var_258_1 + var_258_4 and arg_255_1.time_ < var_258_1 + var_258_4 + arg_258_0 then
				var_258_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_258_7 = arg_255_1.actors_["1061"]
			local var_258_8 = 0

			if var_258_8 < arg_255_1.time_ and arg_255_1.time_ <= var_258_8 + arg_258_0 and arg_255_1.var_.actorSpriteComps1061 == nil then
				arg_255_1.var_.actorSpriteComps1061 = var_258_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_258_9 = 0.034

			if var_258_8 <= arg_255_1.time_ and arg_255_1.time_ < var_258_8 + var_258_9 then
				local var_258_10 = (arg_255_1.time_ - var_258_8) / var_258_9

				if arg_255_1.var_.actorSpriteComps1061 then
					for iter_258_1, iter_258_2 in pairs(arg_255_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_258_2 then
							local var_258_11 = Mathf.Lerp(iter_258_2.color.r, 1, var_258_10)

							iter_258_2.color = Color.New(var_258_11, var_258_11, var_258_11)
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_8 + var_258_9 and arg_255_1.time_ < var_258_8 + var_258_9 + arg_258_0 and arg_255_1.var_.actorSpriteComps1061 then
				local var_258_12 = 1

				for iter_258_3, iter_258_4 in pairs(arg_255_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_258_4 then
						iter_258_4.color = Color.New(var_258_12, var_258_12, var_258_12)
					end
				end

				arg_255_1.var_.actorSpriteComps1061 = nil
			end

			local var_258_13 = 0
			local var_258_14 = 0.9

			if var_258_13 < arg_255_1.time_ and arg_255_1.time_ <= var_258_13 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_15 = arg_255_1:FormatText(StoryNameCfg[612].name)

				arg_255_1.leftNameTxt_.text = var_258_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_16 = arg_255_1:GetWordFromCfg(410202062)
				local var_258_17 = arg_255_1:FormatText(var_258_16.content)

				arg_255_1.text_.text = var_258_17

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_18 = 36
				local var_258_19 = utf8.len(var_258_17)
				local var_258_20 = var_258_18 <= 0 and var_258_14 or var_258_14 * (var_258_19 / var_258_18)

				if var_258_20 > 0 and var_258_14 < var_258_20 then
					arg_255_1.talkMaxDuration = var_258_20

					if var_258_20 + var_258_13 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_20 + var_258_13
					end
				end

				arg_255_1.text_.text = var_258_17
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202062", "story_v_out_410202.awb") ~= 0 then
					local var_258_21 = manager.audio:GetVoiceLength("story_v_out_410202", "410202062", "story_v_out_410202.awb") / 1000

					if var_258_21 + var_258_13 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_21 + var_258_13
					end

					if var_258_16.prefab_name ~= "" and arg_255_1.actors_[var_258_16.prefab_name] ~= nil then
						local var_258_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_16.prefab_name].transform, "story_v_out_410202", "410202062", "story_v_out_410202.awb")

						arg_255_1:RecordAudio("410202062", var_258_22)
						arg_255_1:RecordAudio("410202062", var_258_22)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_410202", "410202062", "story_v_out_410202.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_410202", "410202062", "story_v_out_410202.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_23 = math.max(var_258_14, arg_255_1.talkMaxDuration)

			if var_258_13 <= arg_255_1.time_ and arg_255_1.time_ < var_258_13 + var_258_23 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_13) / var_258_23

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_13 + var_258_23 and arg_255_1.time_ < var_258_13 + var_258_23 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play410202063 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 410202063
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play410202064(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1061"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos1061 = var_262_0.localPosition
				var_262_0.localScale = Vector3.New(1, 1, 1)

				arg_259_1:CheckSpriteTmpPos("1061", 7)

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
				local var_262_6 = Vector3.New(0, -2000, 18)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1061, var_262_6, var_262_5)
			end

			if arg_259_1.time_ >= var_262_1 + var_262_4 and arg_259_1.time_ < var_262_1 + var_262_4 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_262_7 = arg_259_1.actors_["1061"]
			local var_262_8 = 0

			if var_262_8 < arg_259_1.time_ and arg_259_1.time_ <= var_262_8 + arg_262_0 and arg_259_1.var_.actorSpriteComps1061 == nil then
				arg_259_1.var_.actorSpriteComps1061 = var_262_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_9 = 0.034

			if var_262_8 <= arg_259_1.time_ and arg_259_1.time_ < var_262_8 + var_262_9 then
				local var_262_10 = (arg_259_1.time_ - var_262_8) / var_262_9

				if arg_259_1.var_.actorSpriteComps1061 then
					for iter_262_1, iter_262_2 in pairs(arg_259_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_262_2 then
							local var_262_11 = Mathf.Lerp(iter_262_2.color.r, 0.5, var_262_10)

							iter_262_2.color = Color.New(var_262_11, var_262_11, var_262_11)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_8 + var_262_9 and arg_259_1.time_ < var_262_8 + var_262_9 + arg_262_0 and arg_259_1.var_.actorSpriteComps1061 then
				local var_262_12 = 0.5

				for iter_262_3, iter_262_4 in pairs(arg_259_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_262_4 then
						iter_262_4.color = Color.New(var_262_12, var_262_12, var_262_12)
					end
				end

				arg_259_1.var_.actorSpriteComps1061 = nil
			end

			local var_262_13 = 0
			local var_262_14 = 1

			if var_262_13 < arg_259_1.time_ and arg_259_1.time_ <= var_262_13 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, false)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_15 = arg_259_1:GetWordFromCfg(410202063)
				local var_262_16 = arg_259_1:FormatText(var_262_15.content)

				arg_259_1.text_.text = var_262_16

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_17 = 40
				local var_262_18 = utf8.len(var_262_16)
				local var_262_19 = var_262_17 <= 0 and var_262_14 or var_262_14 * (var_262_18 / var_262_17)

				if var_262_19 > 0 and var_262_14 < var_262_19 then
					arg_259_1.talkMaxDuration = var_262_19

					if var_262_19 + var_262_13 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_19 + var_262_13
					end
				end

				arg_259_1.text_.text = var_262_16
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_20 = math.max(var_262_14, arg_259_1.talkMaxDuration)

			if var_262_13 <= arg_259_1.time_ and arg_259_1.time_ < var_262_13 + var_262_20 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_13) / var_262_20

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_13 + var_262_20 and arg_259_1.time_ < var_262_13 + var_262_20 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play410202064 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 410202064
		arg_263_1.duration_ = 6.733

		local var_263_0 = {
			ja = 6.733,
			CriLanguages = 6,
			zh = 6
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
				arg_263_0:Play410202065(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0
			local var_266_1 = 0.475

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_2 = arg_263_1:FormatText(StoryNameCfg[608].name)

				arg_263_1.leftNameTxt_.text = var_266_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, true)
				arg_263_1.iconController_:SetSelectedState("hero")

				arg_263_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10055_a")

				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_3 = arg_263_1:GetWordFromCfg(410202064)
				local var_266_4 = arg_263_1:FormatText(var_266_3.content)

				arg_263_1.text_.text = var_266_4

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_5 = 19
				local var_266_6 = utf8.len(var_266_4)
				local var_266_7 = var_266_5 <= 0 and var_266_1 or var_266_1 * (var_266_6 / var_266_5)

				if var_266_7 > 0 and var_266_1 < var_266_7 then
					arg_263_1.talkMaxDuration = var_266_7

					if var_266_7 + var_266_0 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_7 + var_266_0
					end
				end

				arg_263_1.text_.text = var_266_4
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202064", "story_v_out_410202.awb") ~= 0 then
					local var_266_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202064", "story_v_out_410202.awb") / 1000

					if var_266_8 + var_266_0 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_8 + var_266_0
					end

					if var_266_3.prefab_name ~= "" and arg_263_1.actors_[var_266_3.prefab_name] ~= nil then
						local var_266_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_3.prefab_name].transform, "story_v_out_410202", "410202064", "story_v_out_410202.awb")

						arg_263_1:RecordAudio("410202064", var_266_9)
						arg_263_1:RecordAudio("410202064", var_266_9)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_410202", "410202064", "story_v_out_410202.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_410202", "410202064", "story_v_out_410202.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_10 = math.max(var_266_1, arg_263_1.talkMaxDuration)

			if var_266_0 <= arg_263_1.time_ and arg_263_1.time_ < var_266_0 + var_266_10 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_0) / var_266_10

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_0 + var_266_10 and arg_263_1.time_ < var_266_0 + var_266_10 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play410202065 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 410202065
		arg_267_1.duration_ = 6.766

		local var_267_0 = {
			ja = 6.566,
			CriLanguages = 6.766,
			zh = 6.766
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
				arg_267_0:Play410202066(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1061"].transform
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 then
				arg_267_1.var_.moveOldPos1061 = var_270_0.localPosition
				var_270_0.localScale = Vector3.New(1, 1, 1)

				arg_267_1:CheckSpriteTmpPos("1061", 3)

				local var_270_2 = var_270_0.childCount

				for iter_270_0 = 0, var_270_2 - 1 do
					local var_270_3 = var_270_0:GetChild(iter_270_0)

					if var_270_3.name == "split_5" or not string.find(var_270_3.name, "split") then
						var_270_3.gameObject:SetActive(true)
					else
						var_270_3.gameObject:SetActive(false)
					end
				end
			end

			local var_270_4 = 0.001

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_4 then
				local var_270_5 = (arg_267_1.time_ - var_270_1) / var_270_4
				local var_270_6 = Vector3.New(0, -490, 18)

				var_270_0.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1061, var_270_6, var_270_5)
			end

			if arg_267_1.time_ >= var_270_1 + var_270_4 and arg_267_1.time_ < var_270_1 + var_270_4 + arg_270_0 then
				var_270_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_270_7 = arg_267_1.actors_["1061"]
			local var_270_8 = 0

			if var_270_8 < arg_267_1.time_ and arg_267_1.time_ <= var_270_8 + arg_270_0 and arg_267_1.var_.actorSpriteComps1061 == nil then
				arg_267_1.var_.actorSpriteComps1061 = var_270_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_9 = 0.034

			if var_270_8 <= arg_267_1.time_ and arg_267_1.time_ < var_270_8 + var_270_9 then
				local var_270_10 = (arg_267_1.time_ - var_270_8) / var_270_9

				if arg_267_1.var_.actorSpriteComps1061 then
					for iter_270_1, iter_270_2 in pairs(arg_267_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_270_2 then
							local var_270_11 = Mathf.Lerp(iter_270_2.color.r, 1, var_270_10)

							iter_270_2.color = Color.New(var_270_11, var_270_11, var_270_11)
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_8 + var_270_9 and arg_267_1.time_ < var_270_8 + var_270_9 + arg_270_0 and arg_267_1.var_.actorSpriteComps1061 then
				local var_270_12 = 1

				for iter_270_3, iter_270_4 in pairs(arg_267_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_270_4 then
						iter_270_4.color = Color.New(var_270_12, var_270_12, var_270_12)
					end
				end

				arg_267_1.var_.actorSpriteComps1061 = nil
			end

			local var_270_13 = 0
			local var_270_14 = 0.725

			if var_270_13 < arg_267_1.time_ and arg_267_1.time_ <= var_270_13 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_15 = arg_267_1:FormatText(StoryNameCfg[612].name)

				arg_267_1.leftNameTxt_.text = var_270_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_16 = arg_267_1:GetWordFromCfg(410202065)
				local var_270_17 = arg_267_1:FormatText(var_270_16.content)

				arg_267_1.text_.text = var_270_17

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_18 = 29
				local var_270_19 = utf8.len(var_270_17)
				local var_270_20 = var_270_18 <= 0 and var_270_14 or var_270_14 * (var_270_19 / var_270_18)

				if var_270_20 > 0 and var_270_14 < var_270_20 then
					arg_267_1.talkMaxDuration = var_270_20

					if var_270_20 + var_270_13 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_20 + var_270_13
					end
				end

				arg_267_1.text_.text = var_270_17
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202065", "story_v_out_410202.awb") ~= 0 then
					local var_270_21 = manager.audio:GetVoiceLength("story_v_out_410202", "410202065", "story_v_out_410202.awb") / 1000

					if var_270_21 + var_270_13 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_21 + var_270_13
					end

					if var_270_16.prefab_name ~= "" and arg_267_1.actors_[var_270_16.prefab_name] ~= nil then
						local var_270_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_16.prefab_name].transform, "story_v_out_410202", "410202065", "story_v_out_410202.awb")

						arg_267_1:RecordAudio("410202065", var_270_22)
						arg_267_1:RecordAudio("410202065", var_270_22)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_410202", "410202065", "story_v_out_410202.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_410202", "410202065", "story_v_out_410202.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_23 = math.max(var_270_14, arg_267_1.talkMaxDuration)

			if var_270_13 <= arg_267_1.time_ and arg_267_1.time_ < var_270_13 + var_270_23 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_13) / var_270_23

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_13 + var_270_23 and arg_267_1.time_ < var_270_13 + var_270_23 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play410202066 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 410202066
		arg_271_1.duration_ = 4.3

		local var_271_0 = {
			ja = 4.3,
			CriLanguages = 3.566,
			zh = 3.566
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
				arg_271_0:Play410202067(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1061"]
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 and arg_271_1.var_.actorSpriteComps1061 == nil then
				arg_271_1.var_.actorSpriteComps1061 = var_274_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_274_2 = 0.034

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2

				if arg_271_1.var_.actorSpriteComps1061 then
					for iter_274_0, iter_274_1 in pairs(arg_271_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_274_1 then
							local var_274_4 = Mathf.Lerp(iter_274_1.color.r, 0.5, var_274_3)

							iter_274_1.color = Color.New(var_274_4, var_274_4, var_274_4)
						end
					end
				end
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 and arg_271_1.var_.actorSpriteComps1061 then
				local var_274_5 = 0.5

				for iter_274_2, iter_274_3 in pairs(arg_271_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_274_3 then
						iter_274_3.color = Color.New(var_274_5, var_274_5, var_274_5)
					end
				end

				arg_271_1.var_.actorSpriteComps1061 = nil
			end

			local var_274_6 = 0
			local var_274_7 = 0.375

			if var_274_6 < arg_271_1.time_ and arg_271_1.time_ <= var_274_6 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_8 = arg_271_1:FormatText(StoryNameCfg[610].name)

				arg_271_1.leftNameTxt_.text = var_274_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, true)
				arg_271_1.iconController_:SetSelectedState("hero")

				arg_271_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10055_b")

				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_9 = arg_271_1:GetWordFromCfg(410202066)
				local var_274_10 = arg_271_1:FormatText(var_274_9.content)

				arg_271_1.text_.text = var_274_10

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_11 = 15
				local var_274_12 = utf8.len(var_274_10)
				local var_274_13 = var_274_11 <= 0 and var_274_7 or var_274_7 * (var_274_12 / var_274_11)

				if var_274_13 > 0 and var_274_7 < var_274_13 then
					arg_271_1.talkMaxDuration = var_274_13

					if var_274_13 + var_274_6 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_13 + var_274_6
					end
				end

				arg_271_1.text_.text = var_274_10
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202066", "story_v_out_410202.awb") ~= 0 then
					local var_274_14 = manager.audio:GetVoiceLength("story_v_out_410202", "410202066", "story_v_out_410202.awb") / 1000

					if var_274_14 + var_274_6 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_14 + var_274_6
					end

					if var_274_9.prefab_name ~= "" and arg_271_1.actors_[var_274_9.prefab_name] ~= nil then
						local var_274_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_9.prefab_name].transform, "story_v_out_410202", "410202066", "story_v_out_410202.awb")

						arg_271_1:RecordAudio("410202066", var_274_15)
						arg_271_1:RecordAudio("410202066", var_274_15)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_410202", "410202066", "story_v_out_410202.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_410202", "410202066", "story_v_out_410202.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_16 = math.max(var_274_7, arg_271_1.talkMaxDuration)

			if var_274_6 <= arg_271_1.time_ and arg_271_1.time_ < var_274_6 + var_274_16 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_6) / var_274_16

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_6 + var_274_16 and arg_271_1.time_ < var_274_6 + var_274_16 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play410202067 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 410202067
		arg_275_1.duration_ = 5

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play410202068(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1061"].transform
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 then
				arg_275_1.var_.moveOldPos1061 = var_278_0.localPosition
				var_278_0.localScale = Vector3.New(1, 1, 1)

				arg_275_1:CheckSpriteTmpPos("1061", 7)

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
				local var_278_6 = Vector3.New(0, -2000, 18)

				var_278_0.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1061, var_278_6, var_278_5)
			end

			if arg_275_1.time_ >= var_278_1 + var_278_4 and arg_275_1.time_ < var_278_1 + var_278_4 + arg_278_0 then
				var_278_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_278_7 = arg_275_1.actors_["1061"]
			local var_278_8 = 0

			if var_278_8 < arg_275_1.time_ and arg_275_1.time_ <= var_278_8 + arg_278_0 and arg_275_1.var_.actorSpriteComps1061 == nil then
				arg_275_1.var_.actorSpriteComps1061 = var_278_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_278_9 = 0.034

			if var_278_8 <= arg_275_1.time_ and arg_275_1.time_ < var_278_8 + var_278_9 then
				local var_278_10 = (arg_275_1.time_ - var_278_8) / var_278_9

				if arg_275_1.var_.actorSpriteComps1061 then
					for iter_278_1, iter_278_2 in pairs(arg_275_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_278_2 then
							local var_278_11 = Mathf.Lerp(iter_278_2.color.r, 0.5, var_278_10)

							iter_278_2.color = Color.New(var_278_11, var_278_11, var_278_11)
						end
					end
				end
			end

			if arg_275_1.time_ >= var_278_8 + var_278_9 and arg_275_1.time_ < var_278_8 + var_278_9 + arg_278_0 and arg_275_1.var_.actorSpriteComps1061 then
				local var_278_12 = 0.5

				for iter_278_3, iter_278_4 in pairs(arg_275_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_278_4 then
						iter_278_4.color = Color.New(var_278_12, var_278_12, var_278_12)
					end
				end

				arg_275_1.var_.actorSpriteComps1061 = nil
			end

			local var_278_13 = 0
			local var_278_14 = 1.65

			if var_278_13 < arg_275_1.time_ and arg_275_1.time_ <= var_278_13 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, false)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_15 = arg_275_1:GetWordFromCfg(410202067)
				local var_278_16 = arg_275_1:FormatText(var_278_15.content)

				arg_275_1.text_.text = var_278_16

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_17 = 66
				local var_278_18 = utf8.len(var_278_16)
				local var_278_19 = var_278_17 <= 0 and var_278_14 or var_278_14 * (var_278_18 / var_278_17)

				if var_278_19 > 0 and var_278_14 < var_278_19 then
					arg_275_1.talkMaxDuration = var_278_19

					if var_278_19 + var_278_13 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_19 + var_278_13
					end
				end

				arg_275_1.text_.text = var_278_16
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)
				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_20 = math.max(var_278_14, arg_275_1.talkMaxDuration)

			if var_278_13 <= arg_275_1.time_ and arg_275_1.time_ < var_278_13 + var_278_20 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_13) / var_278_20

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_13 + var_278_20 and arg_275_1.time_ < var_278_13 + var_278_20 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play410202068 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 410202068
		arg_279_1.duration_ = 6.4

		local var_279_0 = {
			ja = 6.4,
			CriLanguages = 3.766,
			zh = 3.766
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
				arg_279_0:Play410202069(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = 0
			local var_282_1 = 0.45

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_2 = arg_279_1:FormatText(StoryNameCfg[609].name)

				arg_279_1.leftNameTxt_.text = var_282_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, true)
				arg_279_1.iconController_:SetSelectedState("hero")

				arg_279_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_3 = arg_279_1:GetWordFromCfg(410202068)
				local var_282_4 = arg_279_1:FormatText(var_282_3.content)

				arg_279_1.text_.text = var_282_4

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_5 = 18
				local var_282_6 = utf8.len(var_282_4)
				local var_282_7 = var_282_5 <= 0 and var_282_1 or var_282_1 * (var_282_6 / var_282_5)

				if var_282_7 > 0 and var_282_1 < var_282_7 then
					arg_279_1.talkMaxDuration = var_282_7

					if var_282_7 + var_282_0 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_7 + var_282_0
					end
				end

				arg_279_1.text_.text = var_282_4
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202068", "story_v_out_410202.awb") ~= 0 then
					local var_282_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202068", "story_v_out_410202.awb") / 1000

					if var_282_8 + var_282_0 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_8 + var_282_0
					end

					if var_282_3.prefab_name ~= "" and arg_279_1.actors_[var_282_3.prefab_name] ~= nil then
						local var_282_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_3.prefab_name].transform, "story_v_out_410202", "410202068", "story_v_out_410202.awb")

						arg_279_1:RecordAudio("410202068", var_282_9)
						arg_279_1:RecordAudio("410202068", var_282_9)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_410202", "410202068", "story_v_out_410202.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_410202", "410202068", "story_v_out_410202.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_10 = math.max(var_282_1, arg_279_1.talkMaxDuration)

			if var_282_0 <= arg_279_1.time_ and arg_279_1.time_ < var_282_0 + var_282_10 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_0) / var_282_10

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_0 + var_282_10 and arg_279_1.time_ < var_282_0 + var_282_10 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play410202069 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 410202069
		arg_283_1.duration_ = 5.166

		local var_283_0 = {
			ja = 5.166,
			CriLanguages = 4.733,
			zh = 4.733
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
				arg_283_0:Play410202070(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = 0
			local var_286_1 = 0.625

			if var_286_0 < arg_283_1.time_ and arg_283_1.time_ <= var_286_0 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_2 = arg_283_1:FormatText(StoryNameCfg[609].name)

				arg_283_1.leftNameTxt_.text = var_286_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, true)
				arg_283_1.iconController_:SetSelectedState("hero")

				arg_283_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_3 = arg_283_1:GetWordFromCfg(410202069)
				local var_286_4 = arg_283_1:FormatText(var_286_3.content)

				arg_283_1.text_.text = var_286_4

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_5 = 25
				local var_286_6 = utf8.len(var_286_4)
				local var_286_7 = var_286_5 <= 0 and var_286_1 or var_286_1 * (var_286_6 / var_286_5)

				if var_286_7 > 0 and var_286_1 < var_286_7 then
					arg_283_1.talkMaxDuration = var_286_7

					if var_286_7 + var_286_0 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_7 + var_286_0
					end
				end

				arg_283_1.text_.text = var_286_4
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202069", "story_v_out_410202.awb") ~= 0 then
					local var_286_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202069", "story_v_out_410202.awb") / 1000

					if var_286_8 + var_286_0 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_8 + var_286_0
					end

					if var_286_3.prefab_name ~= "" and arg_283_1.actors_[var_286_3.prefab_name] ~= nil then
						local var_286_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_3.prefab_name].transform, "story_v_out_410202", "410202069", "story_v_out_410202.awb")

						arg_283_1:RecordAudio("410202069", var_286_9)
						arg_283_1:RecordAudio("410202069", var_286_9)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_410202", "410202069", "story_v_out_410202.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_410202", "410202069", "story_v_out_410202.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_10 = math.max(var_286_1, arg_283_1.talkMaxDuration)

			if var_286_0 <= arg_283_1.time_ and arg_283_1.time_ < var_286_0 + var_286_10 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_0) / var_286_10

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_0 + var_286_10 and arg_283_1.time_ < var_286_0 + var_286_10 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play410202070 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 410202070
		arg_287_1.duration_ = 12

		local var_287_0 = {
			ja = 8.333,
			CriLanguages = 12,
			zh = 12
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
				arg_287_0:Play410202071(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0
			local var_290_1 = 1.225

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_2 = arg_287_1:FormatText(StoryNameCfg[610].name)

				arg_287_1.leftNameTxt_.text = var_290_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, true)
				arg_287_1.iconController_:SetSelectedState("hero")

				arg_287_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10055_b")

				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_3 = arg_287_1:GetWordFromCfg(410202070)
				local var_290_4 = arg_287_1:FormatText(var_290_3.content)

				arg_287_1.text_.text = var_290_4

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_5 = 49
				local var_290_6 = utf8.len(var_290_4)
				local var_290_7 = var_290_5 <= 0 and var_290_1 or var_290_1 * (var_290_6 / var_290_5)

				if var_290_7 > 0 and var_290_1 < var_290_7 then
					arg_287_1.talkMaxDuration = var_290_7

					if var_290_7 + var_290_0 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_7 + var_290_0
					end
				end

				arg_287_1.text_.text = var_290_4
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202070", "story_v_out_410202.awb") ~= 0 then
					local var_290_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202070", "story_v_out_410202.awb") / 1000

					if var_290_8 + var_290_0 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_8 + var_290_0
					end

					if var_290_3.prefab_name ~= "" and arg_287_1.actors_[var_290_3.prefab_name] ~= nil then
						local var_290_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_3.prefab_name].transform, "story_v_out_410202", "410202070", "story_v_out_410202.awb")

						arg_287_1:RecordAudio("410202070", var_290_9)
						arg_287_1:RecordAudio("410202070", var_290_9)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_410202", "410202070", "story_v_out_410202.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_410202", "410202070", "story_v_out_410202.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_10 = math.max(var_290_1, arg_287_1.talkMaxDuration)

			if var_290_0 <= arg_287_1.time_ and arg_287_1.time_ < var_290_0 + var_290_10 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_0) / var_290_10

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_0 + var_290_10 and arg_287_1.time_ < var_290_0 + var_290_10 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play410202071 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 410202071
		arg_291_1.duration_ = 5

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play410202072(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 0
			local var_294_1 = 1.95

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, false)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_2 = arg_291_1:GetWordFromCfg(410202071)
				local var_294_3 = arg_291_1:FormatText(var_294_2.content)

				arg_291_1.text_.text = var_294_3

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_4 = 78
				local var_294_5 = utf8.len(var_294_3)
				local var_294_6 = var_294_4 <= 0 and var_294_1 or var_294_1 * (var_294_5 / var_294_4)

				if var_294_6 > 0 and var_294_1 < var_294_6 then
					arg_291_1.talkMaxDuration = var_294_6

					if var_294_6 + var_294_0 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_6 + var_294_0
					end
				end

				arg_291_1.text_.text = var_294_3
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)
				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_7 = math.max(var_294_1, arg_291_1.talkMaxDuration)

			if var_294_0 <= arg_291_1.time_ and arg_291_1.time_ < var_294_0 + var_294_7 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_0) / var_294_7

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_0 + var_294_7 and arg_291_1.time_ < var_294_0 + var_294_7 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play410202072 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 410202072
		arg_295_1.duration_ = 8.633

		local var_295_0 = {
			ja = 8.633,
			CriLanguages = 5.2,
			zh = 5.2
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
				arg_295_0:Play410202073(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["1061"].transform
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 then
				arg_295_1.var_.moveOldPos1061 = var_298_0.localPosition
				var_298_0.localScale = Vector3.New(1, 1, 1)

				arg_295_1:CheckSpriteTmpPos("1061", 3)

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
				local var_298_6 = Vector3.New(0, -490, 18)

				var_298_0.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos1061, var_298_6, var_298_5)
			end

			if arg_295_1.time_ >= var_298_1 + var_298_4 and arg_295_1.time_ < var_298_1 + var_298_4 + arg_298_0 then
				var_298_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_298_7 = arg_295_1.actors_["1061"]
			local var_298_8 = 0

			if var_298_8 < arg_295_1.time_ and arg_295_1.time_ <= var_298_8 + arg_298_0 and arg_295_1.var_.actorSpriteComps1061 == nil then
				arg_295_1.var_.actorSpriteComps1061 = var_298_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_298_9 = 0.034

			if var_298_8 <= arg_295_1.time_ and arg_295_1.time_ < var_298_8 + var_298_9 then
				local var_298_10 = (arg_295_1.time_ - var_298_8) / var_298_9

				if arg_295_1.var_.actorSpriteComps1061 then
					for iter_298_1, iter_298_2 in pairs(arg_295_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_298_2 then
							local var_298_11 = Mathf.Lerp(iter_298_2.color.r, 1, var_298_10)

							iter_298_2.color = Color.New(var_298_11, var_298_11, var_298_11)
						end
					end
				end
			end

			if arg_295_1.time_ >= var_298_8 + var_298_9 and arg_295_1.time_ < var_298_8 + var_298_9 + arg_298_0 and arg_295_1.var_.actorSpriteComps1061 then
				local var_298_12 = 1

				for iter_298_3, iter_298_4 in pairs(arg_295_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_298_4 then
						iter_298_4.color = Color.New(var_298_12, var_298_12, var_298_12)
					end
				end

				arg_295_1.var_.actorSpriteComps1061 = nil
			end

			local var_298_13 = 0
			local var_298_14 = 0.55

			if var_298_13 < arg_295_1.time_ and arg_295_1.time_ <= var_298_13 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_15 = arg_295_1:FormatText(StoryNameCfg[612].name)

				arg_295_1.leftNameTxt_.text = var_298_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_16 = arg_295_1:GetWordFromCfg(410202072)
				local var_298_17 = arg_295_1:FormatText(var_298_16.content)

				arg_295_1.text_.text = var_298_17

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_18 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202072", "story_v_out_410202.awb") ~= 0 then
					local var_298_21 = manager.audio:GetVoiceLength("story_v_out_410202", "410202072", "story_v_out_410202.awb") / 1000

					if var_298_21 + var_298_13 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_21 + var_298_13
					end

					if var_298_16.prefab_name ~= "" and arg_295_1.actors_[var_298_16.prefab_name] ~= nil then
						local var_298_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_16.prefab_name].transform, "story_v_out_410202", "410202072", "story_v_out_410202.awb")

						arg_295_1:RecordAudio("410202072", var_298_22)
						arg_295_1:RecordAudio("410202072", var_298_22)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_410202", "410202072", "story_v_out_410202.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_410202", "410202072", "story_v_out_410202.awb")
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
	Play410202073 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 410202073
		arg_299_1.duration_ = 5.6

		local var_299_0 = {
			ja = 5.6,
			CriLanguages = 3.533,
			zh = 3.533
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
				arg_299_0:Play410202074(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0
			local var_302_1 = 0.4

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_2 = arg_299_1:FormatText(StoryNameCfg[612].name)

				arg_299_1.leftNameTxt_.text = var_302_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_3 = arg_299_1:GetWordFromCfg(410202073)
				local var_302_4 = arg_299_1:FormatText(var_302_3.content)

				arg_299_1.text_.text = var_302_4

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202073", "story_v_out_410202.awb") ~= 0 then
					local var_302_8 = manager.audio:GetVoiceLength("story_v_out_410202", "410202073", "story_v_out_410202.awb") / 1000

					if var_302_8 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_8 + var_302_0
					end

					if var_302_3.prefab_name ~= "" and arg_299_1.actors_[var_302_3.prefab_name] ~= nil then
						local var_302_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_3.prefab_name].transform, "story_v_out_410202", "410202073", "story_v_out_410202.awb")

						arg_299_1:RecordAudio("410202073", var_302_9)
						arg_299_1:RecordAudio("410202073", var_302_9)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_410202", "410202073", "story_v_out_410202.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_410202", "410202073", "story_v_out_410202.awb")
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
	Play410202074 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 410202074
		arg_303_1.duration_ = 5

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play410202075(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["1061"]
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 and arg_303_1.var_.actorSpriteComps1061 == nil then
				arg_303_1.var_.actorSpriteComps1061 = var_306_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_306_2 = 0.034

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_2 then
				local var_306_3 = (arg_303_1.time_ - var_306_1) / var_306_2

				if arg_303_1.var_.actorSpriteComps1061 then
					for iter_306_0, iter_306_1 in pairs(arg_303_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_306_1 then
							local var_306_4 = Mathf.Lerp(iter_306_1.color.r, 0.5, var_306_3)

							iter_306_1.color = Color.New(var_306_4, var_306_4, var_306_4)
						end
					end
				end
			end

			if arg_303_1.time_ >= var_306_1 + var_306_2 and arg_303_1.time_ < var_306_1 + var_306_2 + arg_306_0 and arg_303_1.var_.actorSpriteComps1061 then
				local var_306_5 = 0.5

				for iter_306_2, iter_306_3 in pairs(arg_303_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_306_3 then
						iter_306_3.color = Color.New(var_306_5, var_306_5, var_306_5)
					end
				end

				arg_303_1.var_.actorSpriteComps1061 = nil
			end

			local var_306_6 = 0
			local var_306_7 = 1.625

			if var_306_6 < arg_303_1.time_ and arg_303_1.time_ <= var_306_6 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, false)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_8 = arg_303_1:GetWordFromCfg(410202074)
				local var_306_9 = arg_303_1:FormatText(var_306_8.content)

				arg_303_1.text_.text = var_306_9

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_10 = 65
				local var_306_11 = utf8.len(var_306_9)
				local var_306_12 = var_306_10 <= 0 and var_306_7 or var_306_7 * (var_306_11 / var_306_10)

				if var_306_12 > 0 and var_306_7 < var_306_12 then
					arg_303_1.talkMaxDuration = var_306_12

					if var_306_12 + var_306_6 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_12 + var_306_6
					end
				end

				arg_303_1.text_.text = var_306_9
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)
				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_13 = math.max(var_306_7, arg_303_1.talkMaxDuration)

			if var_306_6 <= arg_303_1.time_ and arg_303_1.time_ < var_306_6 + var_306_13 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_6) / var_306_13

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_6 + var_306_13 and arg_303_1.time_ < var_306_6 + var_306_13 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play410202075 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 410202075
		arg_307_1.duration_ = 12.233

		local var_307_0 = {
			ja = 12.233,
			CriLanguages = 6.533,
			zh = 6.533
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
				arg_307_0:Play410202076(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["1061"].transform
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 then
				arg_307_1.var_.moveOldPos1061 = var_310_0.localPosition
				var_310_0.localScale = Vector3.New(1, 1, 1)

				arg_307_1:CheckSpriteTmpPos("1061", 3)

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
				local var_310_6 = Vector3.New(0, -490, 18)

				var_310_0.localPosition = Vector3.Lerp(arg_307_1.var_.moveOldPos1061, var_310_6, var_310_5)
			end

			if arg_307_1.time_ >= var_310_1 + var_310_4 and arg_307_1.time_ < var_310_1 + var_310_4 + arg_310_0 then
				var_310_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_310_7 = arg_307_1.actors_["1061"]
			local var_310_8 = 0

			if var_310_8 < arg_307_1.time_ and arg_307_1.time_ <= var_310_8 + arg_310_0 and arg_307_1.var_.actorSpriteComps1061 == nil then
				arg_307_1.var_.actorSpriteComps1061 = var_310_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_310_9 = 0.034

			if var_310_8 <= arg_307_1.time_ and arg_307_1.time_ < var_310_8 + var_310_9 then
				local var_310_10 = (arg_307_1.time_ - var_310_8) / var_310_9

				if arg_307_1.var_.actorSpriteComps1061 then
					for iter_310_1, iter_310_2 in pairs(arg_307_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_310_2 then
							local var_310_11 = Mathf.Lerp(iter_310_2.color.r, 1, var_310_10)

							iter_310_2.color = Color.New(var_310_11, var_310_11, var_310_11)
						end
					end
				end
			end

			if arg_307_1.time_ >= var_310_8 + var_310_9 and arg_307_1.time_ < var_310_8 + var_310_9 + arg_310_0 and arg_307_1.var_.actorSpriteComps1061 then
				local var_310_12 = 1

				for iter_310_3, iter_310_4 in pairs(arg_307_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_310_4 then
						iter_310_4.color = Color.New(var_310_12, var_310_12, var_310_12)
					end
				end

				arg_307_1.var_.actorSpriteComps1061 = nil
			end

			local var_310_13 = 0
			local var_310_14 = 0.875

			if var_310_13 < arg_307_1.time_ and arg_307_1.time_ <= var_310_13 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_15 = arg_307_1:FormatText(StoryNameCfg[612].name)

				arg_307_1.leftNameTxt_.text = var_310_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_16 = arg_307_1:GetWordFromCfg(410202075)
				local var_310_17 = arg_307_1:FormatText(var_310_16.content)

				arg_307_1.text_.text = var_310_17

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_18 = 35
				local var_310_19 = utf8.len(var_310_17)
				local var_310_20 = var_310_18 <= 0 and var_310_14 or var_310_14 * (var_310_19 / var_310_18)

				if var_310_20 > 0 and var_310_14 < var_310_20 then
					arg_307_1.talkMaxDuration = var_310_20

					if var_310_20 + var_310_13 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_20 + var_310_13
					end
				end

				arg_307_1.text_.text = var_310_17
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202075", "story_v_out_410202.awb") ~= 0 then
					local var_310_21 = manager.audio:GetVoiceLength("story_v_out_410202", "410202075", "story_v_out_410202.awb") / 1000

					if var_310_21 + var_310_13 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_21 + var_310_13
					end

					if var_310_16.prefab_name ~= "" and arg_307_1.actors_[var_310_16.prefab_name] ~= nil then
						local var_310_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_16.prefab_name].transform, "story_v_out_410202", "410202075", "story_v_out_410202.awb")

						arg_307_1:RecordAudio("410202075", var_310_22)
						arg_307_1:RecordAudio("410202075", var_310_22)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_410202", "410202075", "story_v_out_410202.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_410202", "410202075", "story_v_out_410202.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_23 = math.max(var_310_14, arg_307_1.talkMaxDuration)

			if var_310_13 <= arg_307_1.time_ and arg_307_1.time_ < var_310_13 + var_310_23 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_13) / var_310_23

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_13 + var_310_23 and arg_307_1.time_ < var_310_13 + var_310_23 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play410202076 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 410202076
		arg_311_1.duration_ = 17.2

		local var_311_0 = {
			ja = 17.2,
			CriLanguages = 8.233,
			zh = 8.233
		}
		local var_311_1 = manager.audio:GetLocalizationFlag()

		if var_311_0[var_311_1] ~= nil then
			arg_311_1.duration_ = var_311_0[var_311_1]
		end

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play410202077(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["1061"].transform
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 then
				arg_311_1.var_.moveOldPos1061 = var_314_0.localPosition
				var_314_0.localScale = Vector3.New(1, 1, 1)

				arg_311_1:CheckSpriteTmpPos("1061", 3)

				local var_314_2 = var_314_0.childCount

				for iter_314_0 = 0, var_314_2 - 1 do
					local var_314_3 = var_314_0:GetChild(iter_314_0)

					if var_314_3.name == "" or not string.find(var_314_3.name, "split") then
						var_314_3.gameObject:SetActive(true)
					else
						var_314_3.gameObject:SetActive(false)
					end
				end
			end

			local var_314_4 = 0.001

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_4 then
				local var_314_5 = (arg_311_1.time_ - var_314_1) / var_314_4
				local var_314_6 = Vector3.New(0, -490, 18)

				var_314_0.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos1061, var_314_6, var_314_5)
			end

			if arg_311_1.time_ >= var_314_1 + var_314_4 and arg_311_1.time_ < var_314_1 + var_314_4 + arg_314_0 then
				var_314_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_314_7 = arg_311_1.actors_["1061"]
			local var_314_8 = 0

			if var_314_8 < arg_311_1.time_ and arg_311_1.time_ <= var_314_8 + arg_314_0 and arg_311_1.var_.actorSpriteComps1061 == nil then
				arg_311_1.var_.actorSpriteComps1061 = var_314_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_314_9 = 0.034

			if var_314_8 <= arg_311_1.time_ and arg_311_1.time_ < var_314_8 + var_314_9 then
				local var_314_10 = (arg_311_1.time_ - var_314_8) / var_314_9

				if arg_311_1.var_.actorSpriteComps1061 then
					for iter_314_1, iter_314_2 in pairs(arg_311_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_314_2 then
							local var_314_11 = Mathf.Lerp(iter_314_2.color.r, 1, var_314_10)

							iter_314_2.color = Color.New(var_314_11, var_314_11, var_314_11)
						end
					end
				end
			end

			if arg_311_1.time_ >= var_314_8 + var_314_9 and arg_311_1.time_ < var_314_8 + var_314_9 + arg_314_0 and arg_311_1.var_.actorSpriteComps1061 then
				local var_314_12 = 1

				for iter_314_3, iter_314_4 in pairs(arg_311_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_314_4 then
						iter_314_4.color = Color.New(var_314_12, var_314_12, var_314_12)
					end
				end

				arg_311_1.var_.actorSpriteComps1061 = nil
			end

			local var_314_13 = 0
			local var_314_14 = 0.975

			if var_314_13 < arg_311_1.time_ and arg_311_1.time_ <= var_314_13 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_15 = arg_311_1:FormatText(StoryNameCfg[612].name)

				arg_311_1.leftNameTxt_.text = var_314_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_16 = arg_311_1:GetWordFromCfg(410202076)
				local var_314_17 = arg_311_1:FormatText(var_314_16.content)

				arg_311_1.text_.text = var_314_17

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_18 = 39
				local var_314_19 = utf8.len(var_314_17)
				local var_314_20 = var_314_18 <= 0 and var_314_14 or var_314_14 * (var_314_19 / var_314_18)

				if var_314_20 > 0 and var_314_14 < var_314_20 then
					arg_311_1.talkMaxDuration = var_314_20

					if var_314_20 + var_314_13 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_20 + var_314_13
					end
				end

				arg_311_1.text_.text = var_314_17
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202076", "story_v_out_410202.awb") ~= 0 then
					local var_314_21 = manager.audio:GetVoiceLength("story_v_out_410202", "410202076", "story_v_out_410202.awb") / 1000

					if var_314_21 + var_314_13 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_21 + var_314_13
					end

					if var_314_16.prefab_name ~= "" and arg_311_1.actors_[var_314_16.prefab_name] ~= nil then
						local var_314_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_16.prefab_name].transform, "story_v_out_410202", "410202076", "story_v_out_410202.awb")

						arg_311_1:RecordAudio("410202076", var_314_22)
						arg_311_1:RecordAudio("410202076", var_314_22)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_410202", "410202076", "story_v_out_410202.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_410202", "410202076", "story_v_out_410202.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_23 = math.max(var_314_14, arg_311_1.talkMaxDuration)

			if var_314_13 <= arg_311_1.time_ and arg_311_1.time_ < var_314_13 + var_314_23 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_13) / var_314_23

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_13 + var_314_23 and arg_311_1.time_ < var_314_13 + var_314_23 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play410202077 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 410202077
		arg_315_1.duration_ = 8.833

		local var_315_0 = {
			ja = 8.833,
			CriLanguages = 6.666,
			zh = 6.666
		}
		local var_315_1 = manager.audio:GetLocalizationFlag()

		if var_315_0[var_315_1] ~= nil then
			arg_315_1.duration_ = var_315_0[var_315_1]
		end

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play410202078(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["1061"].transform
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 then
				arg_315_1.var_.moveOldPos1061 = var_318_0.localPosition
				var_318_0.localScale = Vector3.New(1, 1, 1)

				arg_315_1:CheckSpriteTmpPos("1061", 7)

				local var_318_2 = var_318_0.childCount

				for iter_318_0 = 0, var_318_2 - 1 do
					local var_318_3 = var_318_0:GetChild(iter_318_0)

					if var_318_3.name == "" or not string.find(var_318_3.name, "split") then
						var_318_3.gameObject:SetActive(true)
					else
						var_318_3.gameObject:SetActive(false)
					end
				end
			end

			local var_318_4 = 0.001

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_4 then
				local var_318_5 = (arg_315_1.time_ - var_318_1) / var_318_4
				local var_318_6 = Vector3.New(0, -2000, 18)

				var_318_0.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1061, var_318_6, var_318_5)
			end

			if arg_315_1.time_ >= var_318_1 + var_318_4 and arg_315_1.time_ < var_318_1 + var_318_4 + arg_318_0 then
				var_318_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_318_7 = arg_315_1.actors_["10063"].transform
			local var_318_8 = 0

			if var_318_8 < arg_315_1.time_ and arg_315_1.time_ <= var_318_8 + arg_318_0 then
				arg_315_1.var_.moveOldPos10063 = var_318_7.localPosition
				var_318_7.localScale = Vector3.New(1, 1, 1)

				arg_315_1:CheckSpriteTmpPos("10063", 3)

				local var_318_9 = var_318_7.childCount

				for iter_318_1 = 0, var_318_9 - 1 do
					local var_318_10 = var_318_7:GetChild(iter_318_1)

					if var_318_10.name == "split_4" or not string.find(var_318_10.name, "split") then
						var_318_10.gameObject:SetActive(true)
					else
						var_318_10.gameObject:SetActive(false)
					end
				end
			end

			local var_318_11 = 0.001

			if var_318_8 <= arg_315_1.time_ and arg_315_1.time_ < var_318_8 + var_318_11 then
				local var_318_12 = (arg_315_1.time_ - var_318_8) / var_318_11
				local var_318_13 = Vector3.New(0, -535, -105)

				var_318_7.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos10063, var_318_13, var_318_12)
			end

			if arg_315_1.time_ >= var_318_8 + var_318_11 and arg_315_1.time_ < var_318_8 + var_318_11 + arg_318_0 then
				var_318_7.localPosition = Vector3.New(0, -535, -105)
			end

			local var_318_14 = arg_315_1.actors_["1061"]
			local var_318_15 = 0

			if var_318_15 < arg_315_1.time_ and arg_315_1.time_ <= var_318_15 + arg_318_0 and arg_315_1.var_.actorSpriteComps1061 == nil then
				arg_315_1.var_.actorSpriteComps1061 = var_318_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_318_16 = 0.034

			if var_318_15 <= arg_315_1.time_ and arg_315_1.time_ < var_318_15 + var_318_16 then
				local var_318_17 = (arg_315_1.time_ - var_318_15) / var_318_16

				if arg_315_1.var_.actorSpriteComps1061 then
					for iter_318_2, iter_318_3 in pairs(arg_315_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_318_3 then
							local var_318_18 = Mathf.Lerp(iter_318_3.color.r, 0.5, var_318_17)

							iter_318_3.color = Color.New(var_318_18, var_318_18, var_318_18)
						end
					end
				end
			end

			if arg_315_1.time_ >= var_318_15 + var_318_16 and arg_315_1.time_ < var_318_15 + var_318_16 + arg_318_0 and arg_315_1.var_.actorSpriteComps1061 then
				local var_318_19 = 0.5

				for iter_318_4, iter_318_5 in pairs(arg_315_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_318_5 then
						iter_318_5.color = Color.New(var_318_19, var_318_19, var_318_19)
					end
				end

				arg_315_1.var_.actorSpriteComps1061 = nil
			end

			local var_318_20 = arg_315_1.actors_["10063"]
			local var_318_21 = 0

			if var_318_21 < arg_315_1.time_ and arg_315_1.time_ <= var_318_21 + arg_318_0 and arg_315_1.var_.actorSpriteComps10063 == nil then
				arg_315_1.var_.actorSpriteComps10063 = var_318_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_318_22 = 0.034

			if var_318_21 <= arg_315_1.time_ and arg_315_1.time_ < var_318_21 + var_318_22 then
				local var_318_23 = (arg_315_1.time_ - var_318_21) / var_318_22

				if arg_315_1.var_.actorSpriteComps10063 then
					for iter_318_6, iter_318_7 in pairs(arg_315_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_318_7 then
							local var_318_24 = Mathf.Lerp(iter_318_7.color.r, 1, var_318_23)

							iter_318_7.color = Color.New(var_318_24, var_318_24, var_318_24)
						end
					end
				end
			end

			if arg_315_1.time_ >= var_318_21 + var_318_22 and arg_315_1.time_ < var_318_21 + var_318_22 + arg_318_0 and arg_315_1.var_.actorSpriteComps10063 then
				local var_318_25 = 1

				for iter_318_8, iter_318_9 in pairs(arg_315_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_318_9 then
						iter_318_9.color = Color.New(var_318_25, var_318_25, var_318_25)
					end
				end

				arg_315_1.var_.actorSpriteComps10063 = nil
			end

			local var_318_26 = 0
			local var_318_27 = 0.375

			if var_318_26 < arg_315_1.time_ and arg_315_1.time_ <= var_318_26 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_28 = arg_315_1:FormatText(StoryNameCfg[591].name)

				arg_315_1.leftNameTxt_.text = var_318_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_29 = arg_315_1:GetWordFromCfg(410202077)
				local var_318_30 = arg_315_1:FormatText(var_318_29.content)

				arg_315_1.text_.text = var_318_30

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_31 = 14
				local var_318_32 = utf8.len(var_318_30)
				local var_318_33 = var_318_31 <= 0 and var_318_27 or var_318_27 * (var_318_32 / var_318_31)

				if var_318_33 > 0 and var_318_27 < var_318_33 then
					arg_315_1.talkMaxDuration = var_318_33

					if var_318_33 + var_318_26 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_33 + var_318_26
					end
				end

				arg_315_1.text_.text = var_318_30
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202077", "story_v_out_410202.awb") ~= 0 then
					local var_318_34 = manager.audio:GetVoiceLength("story_v_out_410202", "410202077", "story_v_out_410202.awb") / 1000

					if var_318_34 + var_318_26 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_34 + var_318_26
					end

					if var_318_29.prefab_name ~= "" and arg_315_1.actors_[var_318_29.prefab_name] ~= nil then
						local var_318_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_29.prefab_name].transform, "story_v_out_410202", "410202077", "story_v_out_410202.awb")

						arg_315_1:RecordAudio("410202077", var_318_35)
						arg_315_1:RecordAudio("410202077", var_318_35)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_410202", "410202077", "story_v_out_410202.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_410202", "410202077", "story_v_out_410202.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_36 = math.max(var_318_27, arg_315_1.talkMaxDuration)

			if var_318_26 <= arg_315_1.time_ and arg_315_1.time_ < var_318_26 + var_318_36 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_26) / var_318_36

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_26 + var_318_36 and arg_315_1.time_ < var_318_26 + var_318_36 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play410202078 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 410202078
		arg_319_1.duration_ = 4.833

		local var_319_0 = {
			ja = 4.833,
			CriLanguages = 2.9,
			zh = 2.9
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
				arg_319_0:Play410202079(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["10063"].transform
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 then
				arg_319_1.var_.moveOldPos10063 = var_322_0.localPosition
				var_322_0.localScale = Vector3.New(1, 1, 1)

				arg_319_1:CheckSpriteTmpPos("10063", 7)

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
				local var_322_6 = Vector3.New(0, -2000, -105)

				var_322_0.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos10063, var_322_6, var_322_5)
			end

			if arg_319_1.time_ >= var_322_1 + var_322_4 and arg_319_1.time_ < var_322_1 + var_322_4 + arg_322_0 then
				var_322_0.localPosition = Vector3.New(0, -2000, -105)
			end

			local var_322_7 = arg_319_1.actors_["1061"].transform
			local var_322_8 = 0

			if var_322_8 < arg_319_1.time_ and arg_319_1.time_ <= var_322_8 + arg_322_0 then
				arg_319_1.var_.moveOldPos1061 = var_322_7.localPosition
				var_322_7.localScale = Vector3.New(1, 1, 1)

				arg_319_1:CheckSpriteTmpPos("1061", 3)

				local var_322_9 = var_322_7.childCount

				for iter_322_1 = 0, var_322_9 - 1 do
					local var_322_10 = var_322_7:GetChild(iter_322_1)

					if var_322_10.name == "" or not string.find(var_322_10.name, "split") then
						var_322_10.gameObject:SetActive(true)
					else
						var_322_10.gameObject:SetActive(false)
					end
				end
			end

			local var_322_11 = 0.001

			if var_322_8 <= arg_319_1.time_ and arg_319_1.time_ < var_322_8 + var_322_11 then
				local var_322_12 = (arg_319_1.time_ - var_322_8) / var_322_11
				local var_322_13 = Vector3.New(0, -490, 18)

				var_322_7.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos1061, var_322_13, var_322_12)
			end

			if arg_319_1.time_ >= var_322_8 + var_322_11 and arg_319_1.time_ < var_322_8 + var_322_11 + arg_322_0 then
				var_322_7.localPosition = Vector3.New(0, -490, 18)
			end

			local var_322_14 = arg_319_1.actors_["10063"]
			local var_322_15 = 0

			if var_322_15 < arg_319_1.time_ and arg_319_1.time_ <= var_322_15 + arg_322_0 and arg_319_1.var_.actorSpriteComps10063 == nil then
				arg_319_1.var_.actorSpriteComps10063 = var_322_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_322_16 = 0.034

			if var_322_15 <= arg_319_1.time_ and arg_319_1.time_ < var_322_15 + var_322_16 then
				local var_322_17 = (arg_319_1.time_ - var_322_15) / var_322_16

				if arg_319_1.var_.actorSpriteComps10063 then
					for iter_322_2, iter_322_3 in pairs(arg_319_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_322_3 then
							local var_322_18 = Mathf.Lerp(iter_322_3.color.r, 0.5, var_322_17)

							iter_322_3.color = Color.New(var_322_18, var_322_18, var_322_18)
						end
					end
				end
			end

			if arg_319_1.time_ >= var_322_15 + var_322_16 and arg_319_1.time_ < var_322_15 + var_322_16 + arg_322_0 and arg_319_1.var_.actorSpriteComps10063 then
				local var_322_19 = 0.5

				for iter_322_4, iter_322_5 in pairs(arg_319_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_322_5 then
						iter_322_5.color = Color.New(var_322_19, var_322_19, var_322_19)
					end
				end

				arg_319_1.var_.actorSpriteComps10063 = nil
			end

			local var_322_20 = arg_319_1.actors_["1061"]
			local var_322_21 = 0

			if var_322_21 < arg_319_1.time_ and arg_319_1.time_ <= var_322_21 + arg_322_0 and arg_319_1.var_.actorSpriteComps1061 == nil then
				arg_319_1.var_.actorSpriteComps1061 = var_322_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_322_22 = 0.034

			if var_322_21 <= arg_319_1.time_ and arg_319_1.time_ < var_322_21 + var_322_22 then
				local var_322_23 = (arg_319_1.time_ - var_322_21) / var_322_22

				if arg_319_1.var_.actorSpriteComps1061 then
					for iter_322_6, iter_322_7 in pairs(arg_319_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_322_7 then
							local var_322_24 = Mathf.Lerp(iter_322_7.color.r, 1, var_322_23)

							iter_322_7.color = Color.New(var_322_24, var_322_24, var_322_24)
						end
					end
				end
			end

			if arg_319_1.time_ >= var_322_21 + var_322_22 and arg_319_1.time_ < var_322_21 + var_322_22 + arg_322_0 and arg_319_1.var_.actorSpriteComps1061 then
				local var_322_25 = 1

				for iter_322_8, iter_322_9 in pairs(arg_319_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_322_9 then
						iter_322_9.color = Color.New(var_322_25, var_322_25, var_322_25)
					end
				end

				arg_319_1.var_.actorSpriteComps1061 = nil
			end

			local var_322_26 = 0
			local var_322_27 = 0.325

			if var_322_26 < arg_319_1.time_ and arg_319_1.time_ <= var_322_26 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_28 = arg_319_1:FormatText(StoryNameCfg[612].name)

				arg_319_1.leftNameTxt_.text = var_322_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_29 = arg_319_1:GetWordFromCfg(410202078)
				local var_322_30 = arg_319_1:FormatText(var_322_29.content)

				arg_319_1.text_.text = var_322_30

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_31 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202078", "story_v_out_410202.awb") ~= 0 then
					local var_322_34 = manager.audio:GetVoiceLength("story_v_out_410202", "410202078", "story_v_out_410202.awb") / 1000

					if var_322_34 + var_322_26 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_34 + var_322_26
					end

					if var_322_29.prefab_name ~= "" and arg_319_1.actors_[var_322_29.prefab_name] ~= nil then
						local var_322_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_29.prefab_name].transform, "story_v_out_410202", "410202078", "story_v_out_410202.awb")

						arg_319_1:RecordAudio("410202078", var_322_35)
						arg_319_1:RecordAudio("410202078", var_322_35)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_410202", "410202078", "story_v_out_410202.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_410202", "410202078", "story_v_out_410202.awb")
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
	Play410202079 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 410202079
		arg_323_1.duration_ = 5

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play410202080(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["1061"]
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 and arg_323_1.var_.actorSpriteComps1061 == nil then
				arg_323_1.var_.actorSpriteComps1061 = var_326_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_326_2 = 0.034

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2

				if arg_323_1.var_.actorSpriteComps1061 then
					for iter_326_0, iter_326_1 in pairs(arg_323_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_326_1 then
							local var_326_4 = Mathf.Lerp(iter_326_1.color.r, 0.5, var_326_3)

							iter_326_1.color = Color.New(var_326_4, var_326_4, var_326_4)
						end
					end
				end
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 and arg_323_1.var_.actorSpriteComps1061 then
				local var_326_5 = 0.5

				for iter_326_2, iter_326_3 in pairs(arg_323_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_326_3 then
						iter_326_3.color = Color.New(var_326_5, var_326_5, var_326_5)
					end
				end

				arg_323_1.var_.actorSpriteComps1061 = nil
			end

			local var_326_6 = 0
			local var_326_7 = 0.975

			if var_326_6 < arg_323_1.time_ and arg_323_1.time_ <= var_326_6 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, false)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_8 = arg_323_1:GetWordFromCfg(410202079)
				local var_326_9 = arg_323_1:FormatText(var_326_8.content)

				arg_323_1.text_.text = var_326_9

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_10 = 39
				local var_326_11 = utf8.len(var_326_9)
				local var_326_12 = var_326_10 <= 0 and var_326_7 or var_326_7 * (var_326_11 / var_326_10)

				if var_326_12 > 0 and var_326_7 < var_326_12 then
					arg_323_1.talkMaxDuration = var_326_12

					if var_326_12 + var_326_6 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_12 + var_326_6
					end
				end

				arg_323_1.text_.text = var_326_9
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)
				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_13 = math.max(var_326_7, arg_323_1.talkMaxDuration)

			if var_326_6 <= arg_323_1.time_ and arg_323_1.time_ < var_326_6 + var_326_13 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_6) / var_326_13

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_6 + var_326_13 and arg_323_1.time_ < var_326_6 + var_326_13 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play410202080 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 410202080
		arg_327_1.duration_ = 16.6

		local var_327_0 = {
			ja = 16.6,
			CriLanguages = 9.266,
			zh = 9.266
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
				arg_327_0:Play410202081(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1061"].transform
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 then
				arg_327_1.var_.moveOldPos1061 = var_330_0.localPosition
				var_330_0.localScale = Vector3.New(1, 1, 1)

				arg_327_1:CheckSpriteTmpPos("1061", 3)

				local var_330_2 = var_330_0.childCount

				for iter_330_0 = 0, var_330_2 - 1 do
					local var_330_3 = var_330_0:GetChild(iter_330_0)

					if var_330_3.name == "" or not string.find(var_330_3.name, "split") then
						var_330_3.gameObject:SetActive(true)
					else
						var_330_3.gameObject:SetActive(false)
					end
				end
			end

			local var_330_4 = 0.001

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_4 then
				local var_330_5 = (arg_327_1.time_ - var_330_1) / var_330_4
				local var_330_6 = Vector3.New(0, -490, 18)

				var_330_0.localPosition = Vector3.Lerp(arg_327_1.var_.moveOldPos1061, var_330_6, var_330_5)
			end

			if arg_327_1.time_ >= var_330_1 + var_330_4 and arg_327_1.time_ < var_330_1 + var_330_4 + arg_330_0 then
				var_330_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_330_7 = arg_327_1.actors_["1061"]
			local var_330_8 = 0

			if var_330_8 < arg_327_1.time_ and arg_327_1.time_ <= var_330_8 + arg_330_0 and arg_327_1.var_.actorSpriteComps1061 == nil then
				arg_327_1.var_.actorSpriteComps1061 = var_330_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_330_9 = 0.034

			if var_330_8 <= arg_327_1.time_ and arg_327_1.time_ < var_330_8 + var_330_9 then
				local var_330_10 = (arg_327_1.time_ - var_330_8) / var_330_9

				if arg_327_1.var_.actorSpriteComps1061 then
					for iter_330_1, iter_330_2 in pairs(arg_327_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_330_2 then
							local var_330_11 = Mathf.Lerp(iter_330_2.color.r, 1, var_330_10)

							iter_330_2.color = Color.New(var_330_11, var_330_11, var_330_11)
						end
					end
				end
			end

			if arg_327_1.time_ >= var_330_8 + var_330_9 and arg_327_1.time_ < var_330_8 + var_330_9 + arg_330_0 and arg_327_1.var_.actorSpriteComps1061 then
				local var_330_12 = 1

				for iter_330_3, iter_330_4 in pairs(arg_327_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_330_4 then
						iter_330_4.color = Color.New(var_330_12, var_330_12, var_330_12)
					end
				end

				arg_327_1.var_.actorSpriteComps1061 = nil
			end

			local var_330_13 = 0
			local var_330_14 = 0.875

			if var_330_13 < arg_327_1.time_ and arg_327_1.time_ <= var_330_13 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_15 = arg_327_1:FormatText(StoryNameCfg[612].name)

				arg_327_1.leftNameTxt_.text = var_330_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_16 = arg_327_1:GetWordFromCfg(410202080)
				local var_330_17 = arg_327_1:FormatText(var_330_16.content)

				arg_327_1.text_.text = var_330_17

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_18 = 35
				local var_330_19 = utf8.len(var_330_17)
				local var_330_20 = var_330_18 <= 0 and var_330_14 or var_330_14 * (var_330_19 / var_330_18)

				if var_330_20 > 0 and var_330_14 < var_330_20 then
					arg_327_1.talkMaxDuration = var_330_20

					if var_330_20 + var_330_13 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_20 + var_330_13
					end
				end

				arg_327_1.text_.text = var_330_17
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202080", "story_v_out_410202.awb") ~= 0 then
					local var_330_21 = manager.audio:GetVoiceLength("story_v_out_410202", "410202080", "story_v_out_410202.awb") / 1000

					if var_330_21 + var_330_13 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_21 + var_330_13
					end

					if var_330_16.prefab_name ~= "" and arg_327_1.actors_[var_330_16.prefab_name] ~= nil then
						local var_330_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_16.prefab_name].transform, "story_v_out_410202", "410202080", "story_v_out_410202.awb")

						arg_327_1:RecordAudio("410202080", var_330_22)
						arg_327_1:RecordAudio("410202080", var_330_22)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_410202", "410202080", "story_v_out_410202.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_410202", "410202080", "story_v_out_410202.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_23 = math.max(var_330_14, arg_327_1.talkMaxDuration)

			if var_330_13 <= arg_327_1.time_ and arg_327_1.time_ < var_330_13 + var_330_23 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_13) / var_330_23

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_13 + var_330_23 and arg_327_1.time_ < var_330_13 + var_330_23 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play410202081 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 410202081
		arg_331_1.duration_ = 4.966

		local var_331_0 = {
			ja = 2.966,
			CriLanguages = 4.966,
			zh = 4.966
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
			arg_331_1.auto_ = false
		end

		function arg_331_1.playNext_(arg_333_0)
			arg_331_1.onStoryFinished_()
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1061"].transform
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 then
				arg_331_1.var_.moveOldPos1061 = var_334_0.localPosition
				var_334_0.localScale = Vector3.New(1, 1, 1)

				arg_331_1:CheckSpriteTmpPos("1061", 3)

				local var_334_2 = var_334_0.childCount

				for iter_334_0 = 0, var_334_2 - 1 do
					local var_334_3 = var_334_0:GetChild(iter_334_0)

					if var_334_3.name == "split_5" or not string.find(var_334_3.name, "split") then
						var_334_3.gameObject:SetActive(true)
					else
						var_334_3.gameObject:SetActive(false)
					end
				end
			end

			local var_334_4 = 0.001

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_4 then
				local var_334_5 = (arg_331_1.time_ - var_334_1) / var_334_4
				local var_334_6 = Vector3.New(0, -490, 18)

				var_334_0.localPosition = Vector3.Lerp(arg_331_1.var_.moveOldPos1061, var_334_6, var_334_5)
			end

			if arg_331_1.time_ >= var_334_1 + var_334_4 and arg_331_1.time_ < var_334_1 + var_334_4 + arg_334_0 then
				var_334_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_334_7 = arg_331_1.actors_["1061"]
			local var_334_8 = 0

			if var_334_8 < arg_331_1.time_ and arg_331_1.time_ <= var_334_8 + arg_334_0 and arg_331_1.var_.actorSpriteComps1061 == nil then
				arg_331_1.var_.actorSpriteComps1061 = var_334_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_334_9 = 0.034

			if var_334_8 <= arg_331_1.time_ and arg_331_1.time_ < var_334_8 + var_334_9 then
				local var_334_10 = (arg_331_1.time_ - var_334_8) / var_334_9

				if arg_331_1.var_.actorSpriteComps1061 then
					for iter_334_1, iter_334_2 in pairs(arg_331_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_334_2 then
							local var_334_11 = Mathf.Lerp(iter_334_2.color.r, 1, var_334_10)

							iter_334_2.color = Color.New(var_334_11, var_334_11, var_334_11)
						end
					end
				end
			end

			if arg_331_1.time_ >= var_334_8 + var_334_9 and arg_331_1.time_ < var_334_8 + var_334_9 + arg_334_0 and arg_331_1.var_.actorSpriteComps1061 then
				local var_334_12 = 1

				for iter_334_3, iter_334_4 in pairs(arg_331_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_334_4 then
						iter_334_4.color = Color.New(var_334_12, var_334_12, var_334_12)
					end
				end

				arg_331_1.var_.actorSpriteComps1061 = nil
			end

			local var_334_13 = 0
			local var_334_14 = 0.4

			if var_334_13 < arg_331_1.time_ and arg_331_1.time_ <= var_334_13 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_15 = arg_331_1:FormatText(StoryNameCfg[612].name)

				arg_331_1.leftNameTxt_.text = var_334_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_16 = arg_331_1:GetWordFromCfg(410202081)
				local var_334_17 = arg_331_1:FormatText(var_334_16.content)

				arg_331_1.text_.text = var_334_17

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_18 = 16
				local var_334_19 = utf8.len(var_334_17)
				local var_334_20 = var_334_18 <= 0 and var_334_14 or var_334_14 * (var_334_19 / var_334_18)

				if var_334_20 > 0 and var_334_14 < var_334_20 then
					arg_331_1.talkMaxDuration = var_334_20

					if var_334_20 + var_334_13 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_20 + var_334_13
					end
				end

				arg_331_1.text_.text = var_334_17
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410202", "410202081", "story_v_out_410202.awb") ~= 0 then
					local var_334_21 = manager.audio:GetVoiceLength("story_v_out_410202", "410202081", "story_v_out_410202.awb") / 1000

					if var_334_21 + var_334_13 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_21 + var_334_13
					end

					if var_334_16.prefab_name ~= "" and arg_331_1.actors_[var_334_16.prefab_name] ~= nil then
						local var_334_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_16.prefab_name].transform, "story_v_out_410202", "410202081", "story_v_out_410202.awb")

						arg_331_1:RecordAudio("410202081", var_334_22)
						arg_331_1:RecordAudio("410202081", var_334_22)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_410202", "410202081", "story_v_out_410202.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_410202", "410202081", "story_v_out_410202.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_23 = math.max(var_334_14, arg_331_1.talkMaxDuration)

			if var_334_13 <= arg_331_1.time_ and arg_331_1.time_ < var_334_13 + var_334_23 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_13) / var_334_23

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_13 + var_334_23 and arg_331_1.time_ < var_334_13 + var_334_23 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/L04f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/LZ0204",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST66",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST64a"
	},
	voices = {
		"story_v_out_410202.awb"
	}
}
